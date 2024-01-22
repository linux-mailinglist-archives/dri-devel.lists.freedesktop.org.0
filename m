Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9406183779A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 00:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE1810E8B7;
	Mon, 22 Jan 2024 23:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F95010E8B7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 23:14:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 97E64CE2D6A;
 Mon, 22 Jan 2024 23:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17219C43394;
 Mon, 22 Jan 2024 23:14:17 +0000 (UTC)
Date: Mon, 22 Jan 2024 18:15:47 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: Re: [BUG]  BUG: kernel NULL pointer dereference at
 ttm_device_init+0xb4
Message-ID: <20240122181547.16b029d6@gandalf.local.home>
In-Reply-To: <20240122180605.28daf23a@gandalf.local.home>
References: <20240122180605.28daf23a@gandalf.local.home>
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
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Jan 2024 18:06:05 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:


>   qxl_ttm_init+0x34/0x130


> 
> int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
> 		    struct device *dev, struct address_space *mapping,
> 		    struct drm_vma_offset_manager *vma_manager,
> 		    bool use_dma_alloc, bool use_dma32)
> {
> 	struct ttm_global *glob = &ttm_glob;
> 	int ret;
> 
> 	if (WARN_ON(vma_manager == NULL))
> 		return -EINVAL;
> 
> 	ret = ttm_global_init();
> 	if (ret)
> 		return ret;
> 
> 	bdev->wq = alloc_workqueue("ttm",
> 				   WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_UNBOUND, 16);
> 	if (!bdev->wq) {
> 		ttm_global_release();
> 		return -ENOMEM;
> 	}
> 
> 	bdev->funcs = funcs;
> 
> 	ttm_sys_man_init(bdev);
> 
> 	ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc, use_dma32); <<<------- BUG!
> 
> Specifically, it appears that dev is NULL and dev_to_node() doesn't like
> having a NULL pointer passed to it.
> 

Yeah, that qxl_ttm_init() has:

	/* No others user of address space so set it to 0 */
	r = ttm_device_init(&qdev->mman.bdev, &qxl_bo_driver, NULL,
			    qdev->ddev.anon_inode->i_mapping,
			    qdev->ddev.vma_offset_manager,
			    false, false);

Where that NULL is "dev"!

Thus that will never work here.

-- Steve

