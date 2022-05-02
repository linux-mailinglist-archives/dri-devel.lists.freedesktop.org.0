Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C2851759A
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 19:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DD610F1C7;
	Mon,  2 May 2022 17:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 404 seconds by postgrey-1.36 at gabe;
 Mon, 02 May 2022 17:17:45 UTC
Received: from forward107p.mail.yandex.net (forward107p.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b7:115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB5510F1CB;
 Mon,  2 May 2022 17:17:45 +0000 (UTC)
Received: from forward101q.mail.yandex.net (forward101q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb98])
 by forward107p.mail.yandex.net (Yandex) with ESMTP id 6AA90556E59B;
 Mon,  2 May 2022 20:10:59 +0300 (MSK)
Received: from vla1-166bfab327a3.qloud-c.yandex.net
 (vla1-166bfab327a3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3007:0:640:166b:fab3])
 by forward101q.mail.yandex.net (Yandex) with ESMTP id 6613D13E80002;
 Mon,  2 May 2022 20:10:59 +0300 (MSK)
Received: from vla3-3dd1bd6927b2.qloud-c.yandex.net
 (vla3-3dd1bd6927b2.qloud-c.yandex.net [2a02:6b8:c15:350f:0:640:3dd1:bd69])
 by vla1-166bfab327a3.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 TVcvmXr5ZA-AxgKLj8a; Mon, 02 May 2022 20:10:59 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lach.pw; s=mail;
 t=1651511459; bh=Agoq4DRar/aNcme/ep3h/Ph9puEsY2Ulitbie9lM8hE=;
 h=In-Reply-To:References:Date:Subject:Cc:To:From:Message-Id;
 b=hp1HvciOXsQY1mQw5MW7itL9JqwMvVo0pNZPz/tzCcJaHaD0DXBXN6Qbo8Bv/+Wti
 CWxJig41NJgQCkv5/S1e0xX00OKSZQ9TfQKyxE61LdlECV+X+QJr5J8cWkAiKqKpnw
 HV2w/MDwpnH/k5SiMrAJMbSyIhd7HJuqBD7jaass=
Authentication-Results: vla1-166bfab327a3.qloud-c.yandex.net;
 dkim=pass header.i=@lach.pw
Received: by vla3-3dd1bd6927b2.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id xTgxo8AHyR-AuMSB13b; Mon, 02 May 2022 20:10:58 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Yaroslav Bolyukin <iam@lach.pw>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [RESEND PATCH v2 2/2] drm/amd: use fixed dsc bits-per-pixel from edid
Date: Mon,  2 May 2022 20:10:31 +0300
Message-Id: <20220502171031.11797-2-iam@lach.pw>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502171031.11797-1-iam@lach.pw>
References: <20220220151940.58327-1-iam@lach.pw>
 <20220502171031.11797-1-iam@lach.pw>
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
 Xinhui" <Xinhui.Pan@amd.com>, Leo Li <sunpeng.li@amd.com>, "Lin,
 Wayne" <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yaroslav Bolyukin <iam@lach.pw>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VESA vendor header from DisplayID spec may contain fixed bit per pixel
rate, it should be respected by drm driver

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 ++
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c           | 3 ++-
 drivers/gpu/drm/amd/display/dc/dc_types.h                 | 3 +++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index f5f39984702f..5565d55f56f9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -119,6 +119,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 
 	edid_caps->edid_hdmi = connector->display_info.is_hdmi;
 
+	edid_caps->dsc_fixed_bits_per_pixel_x16 = connector->display_info.dp_dsc_bpp;
+
 	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
 	if (sad_count <= 0)
 		return result;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index c4e871f358ab..65c90e432a39 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -105,6 +105,8 @@ static bool dc_stream_construct(struct dc_stream_state *stream,
 
 	/* EDID CAP translation for HDMI 2.0 */
 	stream->timing.flags.LTE_340MCSC_SCRAMBLE = dc_sink_data->edid_caps.lte_340mcsc_scramble;
+	stream->timing.dsc_fixed_bits_per_pixel_x16 =
+		dc_sink_data->edid_caps.dsc_fixed_bits_per_pixel_x16;
 
 	memset(&stream->timing.dsc_cfg, 0, sizeof(stream->timing.dsc_cfg));
 	stream->timing.dsc_cfg.num_slices_h = 0;
@@ -773,4 +775,3 @@ void dc_stream_log(const struct dc *dc, const struct dc_stream_state *stream)
 		}
 	}
 }
-
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index 2ba9f528c0fe..e53c414b6c93 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -228,6 +228,9 @@ struct dc_edid_caps {
 	bool edid_hdmi;
 	bool hdr_supported;
 
+	/* DisplayPort caps */
+	uint32_t dsc_fixed_bits_per_pixel_x16;
+
 	struct dc_panel_patch panel_patch;
 };
 
-- 
2.35.1

