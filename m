Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41710D1B749
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 22:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE59110E553;
	Tue, 13 Jan 2026 21:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CxhMTMNm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82F410E381
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 21:41:10 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-64b6f22bc77so1467939a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 13:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768340469; x=1768945269; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5TVnYGVRm+Z+bM0lIMVs1bFQFPxij1W9a0LrjLJBefs=;
 b=CxhMTMNmKWAlLcx8pH89Db6oNIjsWwlyVpxE0it2E9hd1yZtuI+hPISqhaIqSrVRId
 U4U4jiBwY6YnbPmX0mFHH3hEXDW+spt6pEUvxUqg5eavvqMkl3x7V39Xf4JF96hZ2fzt
 U3FpLmhaHyd0BLBRZaZlatcwkzAxI2e8riphqhxBqzTNyP5BPQiBGWl2wIfTJercRdsX
 VKCvLVaxRT6WV1GtW9Zn4AluP02pHCMF/4u4qz0D+yszEZpHq9y7mlZMxM9zESAlXWbj
 PTAhB4nlbayzu7IXUuQgTPxI868Xj4EhI8N/1HwIdN9Wp2B1Awa5chsp8R1GsugMdJbe
 V32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768340469; x=1768945269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5TVnYGVRm+Z+bM0lIMVs1bFQFPxij1W9a0LrjLJBefs=;
 b=UWWe2U3tbt1oxKTY6umWFOxbdg7sf47p8Ui//0u9lb7hzopGuD6wSF/+3egzKMXq/c
 rk74EoJumC6WEHtV6EAMknweXk34GoCEnLcxYu7Z5VnY7vR7NeuoKgqmQJOi8kW13zxJ
 Pprn+Okq95IYO9PoJghOFLeCljTwHOXZy1f8RRCd3iqyK12io9w8PxJGRSzQydVCbx6D
 v+/xVgwspIcNRbVKbaIm+Di3PN37E8EtwIb5Tlj2B8ysUIElsdatUukmE2d74VolmJxw
 +bbU5+KeyBclmgkTi7x69WUK+Rz8IPXXXgeqdDwZ8HGhBTtbt4C1mMkbCGGjopdl7EsL
 H3cw==
X-Gm-Message-State: AOJu0YzUCdz/4+aIjkGEh7rqxyeGilyOHAdCs7a7HNFE3u+bdn5VSFH6
 lHtJOSGsV1ht+WX3REZaQ/6GQ/TN+4bQpJT79g4gFiXTpsgqrrCPYfHk
X-Gm-Gg: AY/fxX6UkeyC4AEE6jR+5ZDUHMxSts2xgn9ZYUICaJudv/kaXElSGKzyB36fr2XGCjf
 d93EITG+q7LBqsZ8Dwphbwoz6N+b/6Nb6VmgWNiUP7n3uFFQP8U6DpYRpgGmxhtmSvtELGvIY2X
 dI8x21V5zFDbedXsrKDUqrQJg6qZ+bJIcfwy407tAeh4K2oO42Dvt6roB0Xvso96ce3dMpgIgQ0
 6WtN2suQIx5+y4lyNIDy2e4eWngH8uPGq43e5nE+PrS8Jj5WAT4Aq/Db7YGCVghjNjbyE8pjQLb
 oqjVdhr8nznyMNkSIppWyPGFpR7qsOdNYZI0aBEwu0qbCtDH17oW7ob+j3cDacFafGdEnQbhZZF
 FGSOc78qcPCRIdUEvlpuYCEsfSil4bAm+IPAO4AeJbv8M4JmETlRBNW51f2/LQGITt2528lPWJM
 6b1iEZbVBaaJnbPnNKrqN97weHjF+HJJ9yGifk3RlB/Xt24YgMdpPEwuR2oP7DGSj7
X-Received: by 2002:a05:6402:2816:b0:645:7d1b:e151 with SMTP id
 4fb4d7f45d1cf-653ec1086d0mr204044a12.1.1768340469025; 
 Tue, 13 Jan 2026 13:41:09 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507bf6d5e0sm20858052a12.31.2026.01.13.13.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 13:41:08 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] drm/amd/display: rename PCON adaptive sync types
Date: Tue, 13 Jan 2026 22:41:03 +0100
Message-ID: <20260113214104.146856-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113214104.146856-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260113214104.146856-1-tomasz.pakula.oficjalny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the name more generic for the upcoming HDMI VRR over PCON
implementation

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Tested-by: Bernhard Berger <bernhard.berger@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c             | 4 ++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c     | 2 +-
 drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h     | 4 ++--
 drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7fe40bbba265..1318d88687ae 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9342,7 +9342,7 @@ static void update_freesync_state_on_stream(
 
 	aconn = (struct amdgpu_dm_connector *)new_stream->dm_stream_context;
 
-	if (aconn && (aconn->as_type == FREESYNC_TYPE_PCON_IN_WHITELIST || aconn->vsdb_info.replay_mode)) {
+	if (aconn && (aconn->as_type == ADAPTIVE_SYNC_TYPE_PCON_IN_WHITELIST || aconn->vsdb_info.replay_mode)) {
 		pack_sdp_v1_3 = aconn->pack_sdp_v1_3;
 
 		if (aconn->vsdb_info.amd_vsdb_version == 1)
@@ -13003,7 +13003,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	if (amdgpu_dm_connector->dc_link)
 		as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
 
-	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST) {
+	if (as_type == ADAPTIVE_SYNC_TYPE_PCON_IN_WHITELIST) {
 		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 		if (i >= 0 && vsdb_info.freesync_supported && vsdb_info.amd_vsdb_version > 0) {
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index d0f770dd0a95..63dc9382c48e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -1393,7 +1393,7 @@ enum adaptive_sync_type dm_get_adaptive_sync_support_type(struct dc_link *link)
 		if (dpcd_caps->adaptive_sync_caps.dp_adap_sync_caps.bits.ADAPTIVE_SYNC_SDP_SUPPORT == true &&
 			dpcd_caps->allow_invalid_MSA_timing_param == true &&
 			dm_is_freesync_pcon_whitelist(dpcd_caps->branch_dev_id))
-			as_type = FREESYNC_TYPE_PCON_IN_WHITELIST;
+			as_type = ADAPTIVE_SYNC_TYPE_PCON_IN_WHITELIST;
 		break;
 	default:
 		break;
diff --git a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
index 66dc9a19aebe..91fe039c0c95 100644
--- a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
+++ b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
@@ -44,8 +44,8 @@ void mod_build_hf_vsif_infopacket(const struct dc_stream_state *stream,
 enum adaptive_sync_type {
 	ADAPTIVE_SYNC_TYPE_NONE                  = 0,
 	ADAPTIVE_SYNC_TYPE_DP                    = 1,
-	FREESYNC_TYPE_PCON_IN_WHITELIST          = 2,
-	FREESYNC_TYPE_PCON_NOT_IN_WHITELIST      = 3,
+	ADAPTIVE_SYNC_TYPE_PCON_IN_WHITELIST     = 2,
+	ADAPTIVE_SYNC_TYPE_PCON_NOT_IN_WHITELIST = 3,
 	ADAPTIVE_SYNC_TYPE_EDP                   = 4,
 };
 
diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index b3d55cac3569..429bc0ab86d6 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -535,12 +535,12 @@ void mod_build_adaptive_sync_infopacket(const struct dc_stream_state *stream,
 		if (stream != NULL)
 			mod_build_adaptive_sync_infopacket_v2(stream, param, info_packet);
 		break;
-	case FREESYNC_TYPE_PCON_IN_WHITELIST:
+	case ADAPTIVE_SYNC_TYPE_PCON_IN_WHITELIST:
 	case ADAPTIVE_SYNC_TYPE_EDP:
 		mod_build_adaptive_sync_infopacket_v1(info_packet);
 		break;
 	case ADAPTIVE_SYNC_TYPE_NONE:
-	case FREESYNC_TYPE_PCON_NOT_IN_WHITELIST:
+	case ADAPTIVE_SYNC_TYPE_PCON_NOT_IN_WHITELIST:
 	default:
 		break;
 	}
-- 
2.52.0

