Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 249637BDF11
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 15:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB11810E113;
	Mon,  9 Oct 2023 13:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389A810E113
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 13:25:57 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qpqGh-0006Nr-6Q; Mon, 09 Oct 2023 15:25:55 +0200
Message-ID: <da2d50228d70da212741da9ac475d7a75d356877.camel@pengutronix.de>
Subject: high IRQ latency due to pcp draining
From: Lucas Stach <l.stach@pengutronix.de>
To: Mel Gorman <mgorman@techsingularity.net>, linux-mm@kvack.org
Date: Mon, 09 Oct 2023 15:25:54 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

recently I've been looking at inconsistent frame times in one of our
graphics workloads and it seems the culprit lies within the MM
subsystem. During workload execution sporadically some graphics
buffers, which are typically single digit megabytes in size, are freed.
The pages are freed via __folio_batch_release from drm_gem_put_pages,
which means they are put on the pcp and drained back into the zone via
free_pcppages_bulk.

As the buffers are quite large even a single free triggers the batching
optimization added in 3b12e7e97938 ("mm/page_alloc: scale the number of
pages that are batch freed"), as there is a huge number of pages that
get freed without any intervening allocations. The pcp for the normal
zone on this system has a high watermark of 614 pages and batch of 63,
which means that the batching optimizations will drive up the number of
pages freed per batch to 551 pages.
As the cost per page free (including tracing overhead, which isn't
negligible on this small ARM system) is around 0.7=C2=B5s and the batch fre=
e
is done with zone spinlock held and IRQs disabled, this leads to
significant IRQ disabled times of upwards of 250=C2=B5s even in the
production system without tracing. Those long IRQ disabled sections do
interfere with the workload of the system.

As the larger free batching was added on purpose I don't want to rip it
out altogether. But then there are also no tuneables aside from the pcp
high watermark, which may have other unintended side effects.

I'm hoping to get some ideas on how to proceed here. Should we consider
a more conservative maximum of pages for the batching optimization?
Should another tunable be added? Or any other clever ideas to minimize
those critical sections?

Regards,
Lucas
