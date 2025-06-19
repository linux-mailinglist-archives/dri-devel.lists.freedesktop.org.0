Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFE7AE0B14
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 18:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F48B10E0E5;
	Thu, 19 Jun 2025 16:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="VtnZw2YR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F063110E0E5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 16:07:26 +0000 (UTC)
Message-ID: <1506c0e7-85a3-47e4-9c70-77b01e30accb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1750349236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cTojXNX5CIjMfi7YHEbgz18E+hKTxA8Gwzc3F8Ro3/0=;
 b=VtnZw2YRAW53vBuv+uVae2B+yXTexQv1yy+JvMAKWb8g9Ag1tW1k0pLKrCodDFjxKcGakT
 JsbBfpjikg7Yuy2luTa0q5e937vvoIB6SyCUkGXpQrhTj3/S3yradCYWfYf3vW3leSnnQr
 JDxA/ylOW3NaOtHl3GRA2fGpIpHD+8k=
Date: Fri, 20 Jun 2025 00:07:04 +0800
MIME-Version: 1.0
Subject: Re: [report] DMA-API: platform vgem: mapping sg segment longer than
 device claims to support [len=1048576] [max=65536]
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
References: <6d22bce3-4533-4cfa-96ba-64352b715741@linux.dev>
 <17d14458-a035-4793-8f19-38f4405e02a3@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <17d14458-a035-4793-8f19-38f4405e02a3@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Hi Thomas,

On 2025/6/19 00:25, Thomas Zimmermann wrote:
> Hi
> 
> Am 18.06.25 um 18:03 schrieb Zenghui Yu:
> > Hi all,
> >
> > Running the dmabuf-heap test [*] on mainline kernel triggers the
> > following splat:
> >
> >  ------------[ cut here ]------------
> >  DMA-API: platform vgem: mapping sg segment longer than device claims to support [len=1048576] [max=65536]
> 
> Thanks for the bug report. We have a possible fix in the latest drm-
> misc-next tree. Does it work if use replace DRM_GEM_SHMEM_DRIVER_OPS
> with DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT at [1]?
> 
> [1] https://elixir.bootlin.com/linux/v6.16-rc2/source/drivers/gpu/drm/vgem/vgem_drv.c#L118

Thanks for the heads up! So I applied commit 660cd44659a0
("drm/shmem-helper: Import dmabuf without mapping its sg_table") [*] in
my local tree, together with your suggestion:

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c
b/drivers/gpu/drm/vgem/vgem_drv.c
index 2752ab4f1c97..ba0d4e611bd2 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -115,7 +115,7 @@ static const struct drm_driver vgem_driver = {
 	.num_ioctls 			= ARRAY_SIZE(vgem_ioctls),
 	.fops				= &vgem_driver_fops,

-	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT,
 	.gem_create_object		= vgem_gem_create_object,

 	.name	= DRIVER_NAME,

The warning message disappeared with that. Thanks again!

[*]
https://gitlab.freedesktop.org/drm/kernel/-/commit/660cd44659a05c5fbfce6d2bb1ce448aa0f35594

Zenghui
