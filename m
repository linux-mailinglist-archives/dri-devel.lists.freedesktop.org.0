Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5628385F7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 04:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E9410E0E3;
	Tue, 23 Jan 2024 03:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD66B10E0E3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 03:24:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B0DF9CE2AE9;
 Tue, 23 Jan 2024 03:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67727C433F1;
 Tue, 23 Jan 2024 03:24:06 +0000 (UTC)
Date: Mon, 22 Jan 2024 22:25:35 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] drm/qxl: pass a device into ttm init.
Message-ID: <20240122222535.6f0023c2@gandalf.local.home>
In-Reply-To: <20240123022015.1288588-1-airlied@gmail.com>
References: <20240123022015.1288588-1-airlied@gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Jan 2024 12:20:15 +1000
Dave Airlie <airlied@gmail.com> wrote:

> From: Dave Airlie <airlied@redhat.com>
> 
> ttm init was changed to look at numa node, but that needed a device.
> 
> Only qxl appears to not hand in a device, so just fix that.
> 
> Fixes: b0a7ce53d494 ("drm/ttm: Schedule delayed_delete worker closer")
> Reported-by: Steven Rostedt <rostedt@goodmis.org>

My tests seem to get past the crash with this patch and not my "fix".

Tested-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

> Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/qxl/qxl_ttm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index 1a82629bce3f..1876419ea237 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -195,7 +195,7 @@ int qxl_ttm_init(struct qxl_device *qdev)
>  	int num_io_pages; /* != rom->num_io_pages, we include surface0 */
>  
>  	/* No others user of address space so set it to 0 */
> -	r = ttm_device_init(&qdev->mman.bdev, &qxl_bo_driver, NULL,
> +	r = ttm_device_init(&qdev->mman.bdev, &qxl_bo_driver, qdev->ddev.dev,
>  			    qdev->ddev.anon_inode->i_mapping,
>  			    qdev->ddev.vma_offset_manager,
>  			    false, false);

