Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D8011D030
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 15:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F1F6E148;
	Thu, 12 Dec 2019 14:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1616E148
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 14:49:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 06:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,306,1571727600"; d="scan'208";a="245748962"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2019 06:49:05 -0800
Received: from fmsmsx101.amr.corp.intel.com (10.18.124.199) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 12 Dec 2019 06:49:05 -0800
Received: from fmsmsx107.amr.corp.intel.com ([169.254.6.96]) by
 fmsmsx101.amr.corp.intel.com ([169.254.1.124]) with mapi id 14.03.0439.000;
 Thu, 12 Dec 2019 06:49:05 -0800
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/virtio: fix mmap page attributes
Thread-Topic: [PATCH] drm/virtio: fix mmap page attributes
Thread-Index: AQHVrzjyVT6cHGbxNE67i4kUKKmNL6e2l33w
Date: Thu, 12 Dec 2019 14:49:04 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663EE148E5D@fmsmsx107.amr.corp.intel.com>
References: <20191210085759.14763-1-kraxel@redhat.com>
In-Reply-To: <20191210085759.14763-1-kraxel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTQxNTkzOTMtMDdjOC00MzQ0LTgyNjMtZjk0NDA5MTY0ZGVmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiS3hMREFEWnJxV3FlRmY4RTd2U0JLaDhpeHlwU29CaHhUTVo0TjNCRU1vVksrM1gxR0pnSHhVZXFBUWx5NjdJaiJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.106]
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
Cc: David Airlie <airlied@linux.ie>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Gerd Hoffmann
>Sent: Tuesday, December 10, 2019 3:58 AM
>To: dri-devel@lists.freedesktop.org
>Cc: David Airlie <airlied@linux.ie>; open list <linux-kernel@vger.kernel.org>;
>open list:VIRTIO GPU DRIVER <virtualization@lists.linux-foundation.org>;
>Gerd Hoffmann <kraxel@redhat.com>; gurchetansingh@chromium.org
>Subject: [PATCH] drm/virtio: fix mmap page attributes
>
>virtio-gpu uses cached mappings.  shmem helpers use writecombine though.
>So roll our own mmap function, wrapping drm_gem_shmem_mmap(), to
>tweak
>vm_page_prot accordingly.
>
>Reported-by: Gurchetan Singh <gurchetansingh@chromium.org>
>Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>---
> drivers/gpu/drm/virtio/virtgpu_object.c | 18 +++++++++++++++++-
> 1 file changed, 17 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c
>b/drivers/gpu/drm/virtio/virtgpu_object.c
>index 017a9e0fc3bb..158610902054 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_object.c
>+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
>@@ -75,6 +75,22 @@ static void virtio_gpu_free_object(struct
>drm_gem_object *obj)
> 	drm_gem_shmem_free_object(obj);
> }
>
>+static int virtio_gpu_gem_mmap(struct drm_gem_object *obj, struct
>vm_area_struct *vma)
>+{
>+	pgprot_t prot;
>+	int ret;
>+
>+	ret = drm_gem_shmem_mmap(obj, vma);
>+	if (ret < 0)
>+		return ret;
>+
>+	/* virtio-gpu needs normal caching, so clear writecombine */

A minor nit. 

I was looking at this code, trying to see where you were clearing the
writecombine bit.

Maybe a more clear comment would be:

virtio-gpu needs normal caching, re-do protection without writecombine

?

Mike

>+	prot = vm_get_page_prot(vma->vm_flags);
>+	prot = pgprot_decrypted(prot);
>+	vma->vm_page_prot = prot;
>+	return 0;
>+}
>+
> static const struct drm_gem_object_funcs virtio_gpu_gem_funcs = {
> 	.free = virtio_gpu_free_object,
> 	.open = virtio_gpu_gem_object_open,
>@@ -86,7 +102,7 @@ static const struct drm_gem_object_funcs
>virtio_gpu_gem_funcs = {
> 	.get_sg_table = drm_gem_shmem_get_sg_table,
> 	.vmap = drm_gem_shmem_vmap,
> 	.vunmap = drm_gem_shmem_vunmap,
>-	.mmap = &drm_gem_shmem_mmap,
>+	.mmap = &virtio_gpu_gem_mmap,
> };
>
> struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
>--
>2.18.1
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
