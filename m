Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077231B4925
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 17:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1262B6EA1F;
	Wed, 22 Apr 2020 15:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F376EA20;
 Wed, 22 Apr 2020 15:52:05 +0000 (UTC)
IronPort-SDR: ON4j5Gn/C7YWuMi0yLetva71jA8IbBaoxIzj/GuXKOecJk3uLX0/7JMtzNl87LA9N0OvKW8czo
 ZEwluEq2nZpA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 08:52:04 -0700
IronPort-SDR: TjUAltXeCoo925sIJYL3sVkWXBBK96XchWNtkhSibXo8PV4Aq6G3f8oErs7mfdwIV7yW37IqQ5
 bId691ZTbd4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,303,1583222400"; d="scan'208";a="259113020"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga006.jf.intel.com with ESMTP; 22 Apr 2020 08:52:02 -0700
Received: from fmsmsx125.amr.corp.intel.com (10.18.125.40) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 22 Apr 2020 08:51:27 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.13]) by
 FMSMSX125.amr.corp.intel.com ([169.254.2.138]) with mapi id 14.03.0439.000;
 Wed, 22 Apr 2020 08:51:27 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Bernard Zhao <bernard@vivo.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, "David
 (ChunMing) Zhou" <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Tom St Denis <tom.stdenis@amd.com>, "Ori
 Messinger" <Ori.Messinger@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] amdgpu: fixes memleak issue when init failed
Thread-Topic: [PATCH] amdgpu: fixes memleak issue when init failed
Thread-Index: AQHWGHMwaB1WU0xlDki55E9Aceac76iFShmg
Date: Wed, 22 Apr 2020 15:51:27 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663010212C230@FMSMSX108.amr.corp.intel.com>
References: <20200421111715.1231-1-bernard@vivo.com>
In-Reply-To: <20200421111715.1231-1-bernard@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.107]
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
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Bernard Zhao
>Sent: Tuesday, April 21, 2020 7:17 AM
>To: Alex Deucher <alexander.deucher@amd.com>; Christian K=F6nig
><christian.koenig@amd.com>; David (ChunMing) Zhou
><David1.Zhou@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter
><daniel@ffwll.ch>; Tom St Denis <tom.stdenis@amd.com>; Ori Messinger
><Ori.Messinger@amd.com>; Sam Ravnborg <sam@ravnborg.org>; Bernard
>Zhao <bernard@vivo.com>; amd-gfx@lists.freedesktop.org; dri-
>devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
>Cc: opensource.kernel@vivo.com
>Subject: [PATCH] amdgpu: fixes memleak issue when init failed
>
>VRAM manager and DRM MM when init failed, there is no operaction
>to free kzalloc memory & remove device file.
>This will lead to memleak & cause stability issue.
>
>Signed-off-by: Bernard Zhao <bernard@vivo.com>
>---
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 24
>++++++++++++++++----
> 1 file changed, 19 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>index 82a3299e53c0..4c5fb153e6b4 100644
>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>@@ -175,30 +175,44 @@ static int amdgpu_vram_mgr_init(struct
>ttm_mem_type_manager *man,
> 	ret =3D device_create_file(adev->dev,
>&dev_attr_mem_info_vram_total);
> 	if (ret) {
> 		DRM_ERROR("Failed to create device file
>mem_info_vram_total\n");
>-		return ret;
>+		goto VRAM_TOTAL_FAIL;
> 	}
> 	ret =3D device_create_file(adev->dev,
>&dev_attr_mem_info_vis_vram_total);

Have you looked at the DEVICE_ATTR mechanism?

It is set up to add device files.  You won't get the granularity of each fi=
le,
but it has a lot more automatic-ness to setting this stuff up.

Mike

> 	if (ret) {
> 		DRM_ERROR("Failed to create device file
>mem_info_vis_vram_total\n");
>-		return ret;
>+		goto VIS_VRAM_TOTA_FAIL;
> 	}
> 	ret =3D device_create_file(adev->dev,
>&dev_attr_mem_info_vram_used);
> 	if (ret) {
> 		DRM_ERROR("Failed to create device file
>mem_info_vram_used\n");
>-		return ret;
>+		goto VRAM_USED_FAIL;
> 	}
> 	ret =3D device_create_file(adev->dev,
>&dev_attr_mem_info_vis_vram_used);
> 	if (ret) {
> 		DRM_ERROR("Failed to create device file
>mem_info_vis_vram_used\n");
>-		return ret;
>+		goto VIS_VRAM_USED_FAIL;
> 	}
> 	ret =3D device_create_file(adev->dev,
>&dev_attr_mem_info_vram_vendor);
> 	if (ret) {
> 		DRM_ERROR("Failed to create device file
>mem_info_vram_vendor\n");
>-		return ret;
>+		goto VRAM_VERDOR_FAIL;
> 	}
>
> 	return 0;
>+
>+VRAM_VERDOR_FAIL:
>+	device_remove_file(adev->dev,
>&dev_attr_mem_info_vis_vram_used);
>+VIS_VRAM_USED_FAIL:
>+	device_remove_file(adev->dev, &dev_attr_mem_info_vram_used);
>+RVAM_USED_FAIL:
>+	device_remove_file(adev->dev,
>&dev_attr_mem_info_vis_vram_total);
>+VIS_VRAM_TOTA_FAIL:
>+	device_remove_file(adev->dev, &dev_attr_mem_info_vram_total);
>+VRAM_TOTAL_FAIL:
>+	kfree(mgr);
>+	man->priv =3D NULL;
>+
>+	return ret;
> }
>
> /**
>--
>2.26.2
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
