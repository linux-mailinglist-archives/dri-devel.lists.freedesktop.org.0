Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DB83AEAA1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 15:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4846E167;
	Mon, 21 Jun 2021 13:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00636E17F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 13:58:07 +0000 (UTC)
Received: from maud (unknown [IPv6:2600:8800:8c04:8c00::912b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E9D631F422F0;
 Mon, 21 Jun 2021 14:58:02 +0100 (BST)
Date: Mon, 21 Jun 2021 09:57:55 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 01/12] drm/panfrost: Make sure MMU context lifetime is
 not bound to panfrost_priv
Message-ID: <YNCa46vEbjzWvrLn@maud>
References: <20210621133907.1683899-1-boris.brezillon@collabora.com>
 <20210621133907.1683899-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621133907.1683899-2-boris.brezillon@collabora.com>
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
Cc: Icecream95 <ixn@keemail.me>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, stable@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Jobs can be in-flight when the file descriptor is closed (either because
> the process did not terminate properly, or because it didn't wait for
> all GPU jobs to be finished), and apparently panfrost_job_close() does
> not cancel already running jobs. Let's refcount the MMU context object
> so it's lifetime is no longer bound to the FD lifetime and running jobs
> can finish properly without generating spurious page faults.

Remind me - why can't we hard stop in-flight jobs when the fd is closed?
I've seen cases where kill -9'ing a badly behaved process doesn't end
the fault storm, or unfreeze the desktop.
