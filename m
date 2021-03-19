Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E36342761
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 22:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87016EAC4;
	Fri, 19 Mar 2021 21:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7D26EAC2;
 Fri, 19 Mar 2021 21:03:55 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id e7so12289339edu.10;
 Fri, 19 Mar 2021 14:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UgvwTz2zVDz8Y1uh0pozoywjBdQIfprGzORIG76GguY=;
 b=VWGDzG9HMmYHJlHcBrp+yunegncHhkhejKKCKZ1FafVblsHfVJkx04prg8dk+BoB0l
 tr+OG179uKzi+Fo2E9tm5IIP2ox6jjm5GCJjLkURrW4igigQbzNlfX3iEHaDj28l5CWl
 rzLnksjliRj4YZSpiu1VmhcLy3bxgUPXzK1zqxMxp1Fpd5/tyIsaFx8dQeb3uwZWiVv3
 Eh0sWNJgyDsfwCZOzGmXTxYJ2HIoG3R7V8dfAFWst8MriYROrcFFkBN4vK1ngb/lY9yw
 453c7BJQZtA5FO+gjc+TNWS4jR0rKUKvDlkfsDlMrJsBhV2ljMsdEh/6B/Rp8oW1dvwI
 Lyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UgvwTz2zVDz8Y1uh0pozoywjBdQIfprGzORIG76GguY=;
 b=Wuq4nVLsEdSsnKFMf8EQtqjOv0BH6Y9gSeu53BntDm059ewEo+dWVBR7zfK1qT+GLo
 Rl1aNeid4oQLTIDkrJjvhvIm07t5J1W2D4YHq/g3L0fon9CMGskTkUVPj7RIm33Zi2Nh
 MsuAxipGjxibY/IzAWbqg2qlmQ1KkuRbr1PwOCKqg0IDV3R+qAR1v6lSQrsLmxbilh7/
 svn+umjN3fva+lxScR00Jb4S9dK0DnabS30EH3vhP1j1vffDCiMWgvDU7LMDWQulAu8h
 dhBEwaAVgt4Mj+KsGHQShJQev6SP+MTbv5ckUu2Sg7PwuAhjuCNDD3gGG8w1LnN3wvZf
 fqWg==
X-Gm-Message-State: AOAM532C3l1RnFtrdvVrhO8SEnIhVpEAKPOTuK22fNehpSxtHsZXjowf
 u0Bqkkb3sc1eYTokr62FJWz38IBaqCk=
X-Google-Smtp-Source: ABdhPJw6JkoFsghgH4gFhGTUpR9seXrO5vVLu7+OQTQ9U74KK2Jp7cgi2/Axcy9KAlm5HoNrX/6J+w==
X-Received: by 2002:a05:6402:32d:: with SMTP id
 q13mr12004493edw.17.1616187833917; 
 Fri, 19 Mar 2021 14:03:53 -0700 (PDT)
Received: from twisty.localdomain
 (dynamic-2a01-0c23-7833-6000-6cbb-50d4-b91e-5b37.c23.pool.telefonica.de.
 [2a01:c23:7833:6000:6cbb:50d4:b91e:5b37])
 by smtp.gmail.com with ESMTPSA id jj15sm4353122ejc.99.2021.03.19.14.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 14:03:53 -0700 (PDT)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/amd/display: Enable support for 16 bpc fixed-point
 framebuffers.
Date: Fri, 19 Mar 2021 22:03:17 +0100
Message-Id: <20210319210317.32369-6-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
References: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
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

This is intended to enable direct high-precision scanout and pageflip
of Vulkan swapchain images in format VK_FORMAT_R16G16B16A16_UNORM.

Expose DRM_FORMAT_XRGB16161616, DRM_FORMAT_ARGB16161616,
DRM_FORMAT_XBGR16161616 and DRM_FORMAT_ABGR16161616 as 16 bpc
unsigned normalized formats. These allow to take full advantage
of the maximum precision of the display hardware, ie. currently
up to 12 bpc.

Searching through old AMD M56, M76 and RV630 hw programming docs
suggests that these 16 bpc formats are supported by all DCE and
DCN display engines, so we can expose the formats unconditionally.

Successfully tested on AMD Polaris11 DCE-11.2 an RavenRidge DCN-1.0
with a HDR-10 monitor over 10 bpc DP output with spatial dithering
enabled by the driver. Picture looks good, and my photometer
measurement procedure confirms an effective 12 bpc color
reproduction.

Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 94cd5ddd67ef..1a6e90e20f10 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4563,6 +4563,14 @@ fill_dc_plane_info_and_addr(struct amdgpu_device *adev,
 	case DRM_FORMAT_ABGR16161616F:
 		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F;
 		break;
+	case DRM_FORMAT_XRGB16161616:
+	case DRM_FORMAT_ARGB16161616:
+		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616;
+		break;
+	case DRM_FORMAT_XBGR16161616:
+	case DRM_FORMAT_ABGR16161616:
+		plane_info->format = SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616;
+		break;
 	default:
 		DRM_ERROR(
 			"Unsupported screen format %s\n",
@@ -6541,6 +6549,10 @@ static const uint32_t rgb_formats[] = {
 	DRM_FORMAT_XBGR2101010,
 	DRM_FORMAT_ARGB2101010,
 	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_XBGR16161616,
+	DRM_FORMAT_ARGB16161616,
+	DRM_FORMAT_ABGR16161616,
 	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_RGB565,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
