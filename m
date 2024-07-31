Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD6494349B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 19:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F88F10E1BE;
	Wed, 31 Jul 2024 17:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="KDT8pI8E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291B910E1BE;
 Wed, 31 Jul 2024 17:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1722445249;
 bh=43fWu65ahIpq44m9rON/hw4CQ9V4doMziHt54yTlBJw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=KDT8pI8EDndfMwfy6JXzaMlNbU0ntozOhTxAe9Zb9JRmAAYQmIHresilA47UNmRn+
 Ph9AgnOukvln8Rvv10azxNHwexz6IkngR3kvr4rOV3MVeKw78Ae8tgpzAN/UcBBNom
 A+rCE3cGTS1WXrvvtrplNBcwehwrPjPX0lICsNHc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 31 Jul 2024 19:00:47 +0200
Subject: [PATCH v3 2/2] drm/amd/display: implement minimum brightness override
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240731-amdgpu-min-backlight-quirk-v3-2-46d40bb21a62@weissschuh.net>
References: <20240731-amdgpu-min-backlight-quirk-v3-0-46d40bb21a62@weissschuh.net>
In-Reply-To: <20240731-amdgpu-min-backlight-quirk-v3-0-46d40bb21a62@weissschuh.net>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Hans de Goede <hdegoede@redhat.com>, Xinhui Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722445249; l=1442;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=43fWu65ahIpq44m9rON/hw4CQ9V4doMziHt54yTlBJw=;
 b=mvJubKuaHtZBkENwO11yIlMdmHS9DFCZHAPoZXVILB1oIMee6smLON2xWexjvPUb4Av+LndQF
 QJ5vISGBRbuBA86TkoRc4QVhAqEzrITSdmfwpEC+8Wo+CiCbwMZW5DB
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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

This is useful if the minimum backlight as reported by machines VBT
does not match the user expectations.

As an example, the minimum backlight brightness on the Framework 13
matte panel is too high.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7e7929f24ae4..ae15465cacfc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3330,6 +3330,7 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 	struct drm_connector *conn_base;
 	struct amdgpu_device *adev;
 	struct drm_luminance_range_info *luminance_range;
+	int min_input_signal_override;
 
 	if (aconnector->bl_idx == -1 ||
 	    aconnector->dc_link->connector_signal != SIGNAL_TYPE_EDP)
@@ -3364,6 +3365,11 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 		caps->aux_min_input_signal = 0;
 		caps->aux_max_input_signal = 512;
 	}
+
+	min_input_signal_override = drm_connector_get_cmdline_min_brightness_override(conn_base);
+	if (min_input_signal_override >= 0)
+		caps->min_input_signal = min_input_signal_override;
+
 }
 
 void amdgpu_dm_update_connector_after_detect(

-- 
2.46.0

