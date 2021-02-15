Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A7A31B5FC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 09:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D9B6E106;
	Mon, 15 Feb 2021 08:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663A66E106
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 08:49:35 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F2DA11F44C1E;
 Mon, 15 Feb 2021 08:49:33 +0000 (GMT)
Date: Mon, 15 Feb 2021 09:49:31 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Steven Price
 <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 0/3] drm/panfrost: MMU fixes
Message-ID: <20210215094931.5742d45a@collabora.com>
In-Reply-To: <20210205111757.585248-1-boris.brezillon@collabora.com>
References: <20210205111757.585248-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  5 Feb 2021 12:17:54 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hello,
> 
> Here are 2 fixes and one improvement for the page fault handling. Those
> bugs were found while working on indirect draw supports which requires
> the allocation of a big heap buffer for varyings, and the vertex/tiler
> shaders seem to have access pattern that trigger those issues. I
> remember discussing the first issue with Steve or Robin a while back,
> but we never hit it before (now we do :)).
> 
> The last patch is a perf improvement: no need to re-enable hardware
> interrupts if we know the threaded irq handler will be woken up right
> away.
> 
> Regards,
> 
> Boris
> 
> Changes in v2:
> * Rework the MMU irq handling loop to avoid a goto

Queued to drm-misc-next.

> 
> Boris Brezillon (3):
>   drm/panfrost: Clear MMU irqs before handling the fault
>   drm/panfrost: Don't try to map pages that are already mapped
>   drm/panfrost: Stay in the threaded MMU IRQ handler until we've handled
>     all IRQs
> 
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 39 +++++++++++++++----------
>  1 file changed, 24 insertions(+), 15 deletions(-)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
