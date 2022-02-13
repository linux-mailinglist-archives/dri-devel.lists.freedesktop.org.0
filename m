Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D8A4B3B96
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 14:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C3F10E2DD;
	Sun, 13 Feb 2022 13:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from forward100o.mail.yandex.net (forward100o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CC910E2DD
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 13:32:21 +0000 (UTC)
Received: from forward102q.mail.yandex.net (forward102q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:1ba:0:640:516:4e7d])
 by forward100o.mail.yandex.net (Yandex) with ESMTP id 8685852A963C;
 Sun, 13 Feb 2022 16:32:17 +0300 (MSK)
Received: from vla5-b2c3939582a3.qloud-c.yandex.net
 (vla5-b2c3939582a3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3482:0:640:b2c3:9395])
 by forward102q.mail.yandex.net (Yandex) with ESMTP id 80FDCBF00002;
 Sun, 13 Feb 2022 16:32:17 +0300 (MSK)
Received: from vla5-047c0c0d12a6.qloud-c.yandex.net
 (vla5-047c0c0d12a6.qloud-c.yandex.net [2a02:6b8:c18:3484:0:640:47c:c0d])
 by vla5-b2c3939582a3.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 FtQJCF8VMQ-WHZans4Z; Sun, 13 Feb 2022 16:32:17 +0300
X-Yandex-Fwd: 2
Authentication-Results: vla5-b2c3939582a3.qloud-c.yandex.net; dkim=pass
Received: by vla5-047c0c0d12a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id lKwSmfPfvd-WFIGTICm; Sun, 13 Feb 2022 16:32:16 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Yaroslav Bolyukin <iam@lach.pw>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amd: use fixed dsc bits-per-pixel from edid
Date: Sun, 13 Feb 2022 16:31:28 +0300
Message-Id: <20220213133128.5833-2-iam@lach.pw>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220213133128.5833-1-iam@lach.pw>
References: <20220213133128.5833-1-iam@lach.pw>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yaroslav Bolyukin <iam@lach.pw>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VESA vendor header from DisplayID spec may contain fixed bit per pixel
rate, it should be respected by drm driver

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 ++
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c           | 3 ++-
 drivers/gpu/drm/amd/display/dc/dc_types.h                 | 3 +++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 29f07c26d..b34dd89ae 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -118,6 +118,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 
 	edid_caps->edid_hdmi = connector->display_info.is_hdmi;
 
+	edid_caps->dsc_fixed_bits_per_pixel_x16 = connector->display_info.dp_dsc_bpp;
+
 	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
 	if (sad_count <= 0)
 		return result;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index 57cf4cb82..f8516ec70 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -105,6 +105,8 @@ static bool dc_stream_construct(struct dc_stream_state *stream,
 
 	/* EDID CAP translation for HDMI 2.0 */
 	stream->timing.flags.LTE_340MCSC_SCRAMBLE = dc_sink_data->edid_caps.lte_340mcsc_scramble;
+	stream->timing.dsc_fixed_bits_per_pixel_x16 =
+		dc_sink_data->edid_caps.dsc_fixed_bits_per_pixel_x16;
 
 	memset(&stream->timing.dsc_cfg, 0, sizeof(stream->timing.dsc_cfg));
 	stream->timing.dsc_cfg.num_slices_h = 0;
@@ -738,4 +740,3 @@ void dc_stream_log(const struct dc *dc, const struct dc_stream_state *stream)
 			"\tlink: %d\n",
 			stream->link->link_index);
 }
-
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index 0285a4b38..ce2e11d70 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -227,6 +227,9 @@ struct dc_edid_caps {
 	bool edid_hdmi;
 	bool hdr_supported;
 
+	/* DisplayPort caps */
+	uint32_t dsc_fixed_bits_per_pixel_x16;
+
 	struct dc_panel_patch panel_patch;
 };
 
-- 
2.35.1

