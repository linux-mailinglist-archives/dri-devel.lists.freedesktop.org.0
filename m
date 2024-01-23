Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB34C837943
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 01:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7650910F1B5;
	Tue, 23 Jan 2024 00:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C07510F1B5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 00:34:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B20D3CE2865;
 Tue, 23 Jan 2024 00:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21345C433F1;
 Tue, 23 Jan 2024 00:33:24 +0000 (UTC)
Date: Mon, 22 Jan 2024 19:34:53 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>
Subject: Re: [BUG] BUG: kernel NULL pointer dereference at ttm_device_init+0xb4
Message-ID: <20240122193453.6096d45f@gandalf.local.home>
In-Reply-To: <918ddc13-1cf8-4199-b5be-5719a023de42@amd.com>
References: <20240122180605.28daf23a@gandalf.local.home>
 <918ddc13-1cf8-4199-b5be-5719a023de42@amd.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Jan 2024 19:29:41 -0500
"Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com> wrote:

> 
> In one of my previous revisions of this patch when I was experimenting, 
> I used something like below. Wonder if that could work in your case 
> and/or in general.
> 
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
> b/drivers/gpu/drm/ttm/ttm_device.c
> 
> index 43e27ab77f95..4c3902b94be4 100644
> 
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> 
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> 
> @@ -195,6 +195,7 @@ int ttm_device_init(struct ttm_device *bdev, struct 
> ttm_device_funcs *funcs,
> 
> bool use_dma_alloc, bool use_dma32){
> 
> struct ttm_global *glob = &ttm_glob;
> 
> +bool node_has_cpu = false;
> 
> int ret;
> 
> if (WARN_ON(vma_manager == NULL))
> 
> @@ -213,7 +214,12 @@ int ttm_device_init(struct ttm_device *bdev, struct 
> ttm_device_funcs *funcs,
> 
> bdev->funcs = funcs;
> 
> ttm_sys_man_init(bdev);
> 
> -ttm_pool_init(&bdev->pool, dev, NUMA_NO_NODE, use_dma_alloc, use_dma32);
> 
> +
> 
> +node_has_cpu = node_state(dev->numa_node, N_CPU);

Considering that qxl_ttm_init() passes in dev = NULL, the above would blow
up just the same.

-- Steve


> 
> +if (node_has_cpu)
> 
> +ttm_pool_init(&bdev->pool, dev, dev->numa_node, use_dma_alloc, use_dma32);
> 
> +else
> 
> +ttm_pool_init(&bdev->pool, dev, NUMA_NO_NODE, use_dma_alloc,
> 
> +use_dma32);
> 
> bdev->vma_manager = vma_manager;
> 
> spin_lock_init(&bdev->lru_lock);
> 
> 
> >
> > -- Steve
