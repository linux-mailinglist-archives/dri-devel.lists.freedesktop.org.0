Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAFE9146CD
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010EA10E3E1;
	Mon, 24 Jun 2024 09:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2EA10E3E1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:57:24 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sLgRu-0005BT-J9; Mon, 24 Jun 2024 11:57:22 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sLgRu-004cRL-6r; Mon, 24 Jun 2024 11:57:22 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1sLgRu-0005K2-0V;
 Mon, 24 Jun 2024 11:57:22 +0200
Message-ID: <a40c757b7c17a5b605d1f572bdf73fc4ce180b74.camel@pengutronix.de>
Subject: Re: [PATCH v3 3/3] gpu: ipu-v3: pre: don't use fixed timeout when
 waiting for safe window
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
 patchwork-lst@pengutronix.de
Date: Mon, 24 Jun 2024 11:57:22 +0200
In-Reply-To: <20240517104549.3648939-3-l.stach@pengutronix.de>
References: <20240517104549.3648939-1-l.stach@pengutronix.de>
 <20240517104549.3648939-3-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fr, 2024-05-17 at 12:45 +0200, Lucas Stach wrote:
> The timeout when waiting for the PRE safe window is rather short, as
> normally we would only need to wait a few dozen usecs for the problematic
> scanline region to pass and we don't want to spin too long in case
> something goes wrong. This however mixes badly with preemption, as we
> can easily get scheduled away from the CPU for a longer time than our
> timeout, in which case we would hit a spurious timeout and wrongly skip
> the PRE update.
>=20
> Instead of disabling preemption across the wait loop, potentially
> impacting the overall system latency, use a wait loop with a fixed
> max number of iterations, so time spent away from the CPU is not
> accounted against the timeout budget.
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
