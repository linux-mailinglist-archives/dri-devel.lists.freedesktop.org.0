Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 541506628E0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 15:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A5210E43A;
	Mon,  9 Jan 2023 14:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB8110E439;
 Mon,  9 Jan 2023 14:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TnpDW0+fbBbPza9wMiMd8HlnPnuskPiG6Rgbq1iBi8g=; b=TWlBIDGPLku7ghz50n9qdn+SRR
 rSsoJ5irFxQwjH15eFYk2IYJNrqpRurnCYXnxw8WGxnaWVqs7UDlgQyYIBvLG24rYFugu5wijcoZv
 D0f6aZZUucwt2K6Z8czdhtetq5QjYHLt51W5IrZuwDpY0zWIa8YnszsUXY/aF8qtWcguCFcJ+L14a
 X89hvd3/m7fir50TxzHQv1WUOJfvo4JiUrZMeQt9uNvQf6xeUrKn9r+fuIGn43F4m6BQRYWY1LPoa
 45WaPqH8IRnEpNo9jpedCoIFIWWrEiWODP/gUFrutpPMPqb06Dt/vkFD/F0gu1cjz6kCdboGFe/fX
 xiBK5j1w==;
Received: from [41.74.137.107] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEtNx-003TyM-HA; Mon, 09 Jan 2023 15:44:25 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH v2 14/18] drm/amd/display: expand array of supported 3D
 LUT modes
Date: Mon,  9 Jan 2023 13:38:42 -0100
Message-Id: <20230109143846.1966301-15-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230109143846.1966301-1-mwen@igalia.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: laurent.pinchart+renesas@ideasonboard.com, kernel-dev@igalia.com,
 Shashank Sharma <shashank.sharma@amd.com>, alex.hung@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>, seanpaul@chromium.org, tzimmermann@suse.de,
 amd-gfx@lists.freedesktop.org, bhawanpreet.lakha@amd.com,
 nicholas.kazlauskas@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AMD MPC block support 3D LUTs of dimensions 17 and 9, and also bit
depth 12 and 10, therefore, advertise them to the userspace.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/modules/color/color_gamma.h   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/modules/color/color_gamma.h b/drivers/gpu/drm/amd/display/modules/color/color_gamma.h
index 8e159b1eb9c6..69b9a1aa6dd4 100644
--- a/drivers/gpu/drm/amd/display/modules/color/color_gamma.h
+++ b/drivers/gpu/drm/amd/display/modules/color/color_gamma.h
@@ -47,6 +47,37 @@ static const struct drm_mode_lut3d_mode lut3d_mode_17_12bit = {
 	.flags = 0,
 };
 
+static const struct drm_mode_lut3d_mode amdgpu_lut3d_modes[] = {
+	{
+		.lut_size = 17,
+		.lut_stride = {17, 17, 18},
+		.bit_depth = 12,
+		.color_format = DRM_FORMAT_XRGB16161616,
+		.flags = 0,
+	},
+	{
+		.lut_size = 17,
+		.lut_stride = {17, 17, 18},
+		.bit_depth = 10,
+		.color_format = DRM_FORMAT_XRGB16161616,
+		.flags = 0,
+	},
+	{
+		.lut_size = 9,
+		.lut_stride = {9, 9, 10},
+		.bit_depth = 12,
+		.color_format = DRM_FORMAT_XRGB16161616,
+		.flags = 0,
+	},
+	{
+		.lut_size = 9,
+		.lut_stride = {9, 9, 10},
+		.bit_depth = 10,
+		.color_format = DRM_FORMAT_XRGB16161616,
+		.flags = 0,
+	},
+};
+
 /* For SetRegamma ADL interface support
  * Must match escape type
  */
-- 
2.35.1

