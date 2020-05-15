Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1791D4518
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 07:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BF56EBCA;
	Fri, 15 May 2020 05:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8BF6EBCA;
 Fri, 15 May 2020 05:19:41 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u16so1090214wmc.5;
 Thu, 14 May 2020 22:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i1dS+9A8wTU215IAbY7tCuDJIgwLJnZEKle46PzX1ew=;
 b=qXnayYLvSilGHD5WEQrJHgZ2hHwdnhFwBjg9dOrjAyaZhP/HKGy80SIFghWSpOBIGj
 rRM0n2D+m3qhbu9FZcM+IlA4zYTdYDPkERg2+Rhs6Mr7LEgy6Adeij5gwiU9jj4GNiMX
 GQC4F8b6E3n99LsyZo+BfsOIHaXUyejKY7PUMybEooLPGrI1BElSbh5pepINuLad2R+k
 SawG1RldvM5oiHRxFV1DUyZ6Mom7iajqGlb7MSJ9lnYleyOUMrGs7Sf6DYsBWqTOzMJQ
 s6q76GYTrD3s5RLzc8bVCMRGqzg9qjamsbtuiQnQXMI/wFcQupz0hzX5MXbBsWXX9chb
 wKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i1dS+9A8wTU215IAbY7tCuDJIgwLJnZEKle46PzX1ew=;
 b=Ynj99GcS9tkies7nx6upTmVn5YI0K+jgWEux+TLTM9CxIZD0zA4us2NZGazcxzhQ/U
 NA3hi/31abfpcLtwtgzdIyXAIA/ZPiViTf6JVfOsPhfxltNbx8fo4jP2eF9xlt9gpex+
 1B9ASx857zGZ1Z/kK/aOvnceF87DoDJaWCi/7dMerk2Pd2IeKooXCju8PDDQwjeUzpeQ
 VuOPuUMQbqIEIOfIj2XhVdrQ1nlACLw4HqQjFnbz/ysufbr/23pGpic3TKvzff8OpjSn
 UwVriWDU8E4UT5wlCXj4OoEekCS7I72uKGcnF+3alCkvhL0Ah2rhNfrVVBqlKpSEBHdK
 Bc+g==
X-Gm-Message-State: AOAM532AM7ZI9mzYXornG2w8o2Btz8wq5gCXfNJBZeHZ59RvlqEqGsbc
 VK+C+ooWuSOIzk8JmNnYtqyTiNDuL+U=
X-Google-Smtp-Source: ABdhPJzl6/3NTXiDJYhi49H4wkDN1z0k+ZDjZtVIaqoqY0/hrcWUX22/3/qXj/17jM8mhkMoqvZZBQ==
X-Received: by 2002:a7b:c651:: with SMTP id q17mr1838200wmk.167.1589519979923; 
 Thu, 14 May 2020 22:19:39 -0700 (PDT)
Received: from twisty.localdomain
 (dynamic-2a01-0c22-c877-2100-f914-43b7-6b66-02cf.c22.pool.telefonica.de.
 [2a01:c22:c877:2100:f914:43b7:6b66:2cf])
 by smtp.gmail.com with ESMTPSA id s8sm1554631wrt.69.2020.05.14.22.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 22:19:39 -0700 (PDT)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amd/display: Expose support for xBGR ordered fp16
 formats.
Date: Fri, 15 May 2020 07:19:23 +0200
Message-Id: <20200515051924.12331-2-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200515051924.12331-1-mario.kleiner.de@gmail.com>
References: <20200515051924.12331-1-mario.kleiner.de@gmail.com>
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
Cc: alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expose support for DRM_FORMAT_ABGR16161616F and
DRM_FORMAT_XBGR16161616F to the DRM core, complementing
the already existing xRGB ordered fp16 formats.

These are especially useful for creating presentable
swapchains in Vulkan for VK_FORMAT_R16G16B16A16_SFLOAT.

Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 48f2b3710e7c..bd0c9eda8f93 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3651,6 +3651,10 @@ fill_dc_plane_info_and_addr(struct amdgpu_device *adev,
 	case DRM_FORMAT_ARGB16161616F:
 		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F;
 		break;
+	case DRM_FORMAT_XBGR16161616F:
+	case DRM_FORMAT_ABGR16161616F:
+		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F;
+		break;
 	default:
 		DRM_ERROR(
 			"Unsupported screen format %s\n",
@@ -5566,6 +5570,8 @@ static int get_plane_formats(const struct drm_plane *plane,
 		if (plane_cap && plane_cap->pixel_format_support.fp16) {
 			formats[num_formats++] = DRM_FORMAT_XRGB16161616F;
 			formats[num_formats++] = DRM_FORMAT_ARGB16161616F;
+			formats[num_formats++] = DRM_FORMAT_XBGR16161616F;
+			formats[num_formats++] = DRM_FORMAT_ABGR16161616F;
 		}
 		break;
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
