Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SP+lJuPonmk/XwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:19:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7082F1972B2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D7910E75B;
	Wed, 25 Feb 2026 12:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pigXeoI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB8710E758;
 Wed, 25 Feb 2026 12:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qCNfPEwAGiKU96Yx+NI9AHGJhYxtzmzSW92THWvtbRk=; b=pigXeoI1qPdwwdvRByBRwmcFg7
 Ro+JG+VNz8FCI6pjlwyN54sv1NuTW56PW+ObpTy2GC3DnwqvDZVxWjqZ3uqU/+BCvlOAv3pJiHA4c
 Mto7Ra0CydGv7s/lfnw7x6TuTmH5qSTYXyZkxpmj7QFNx4z6Myo6ZCdtpDCDPNUeweYSBEMo/MB8f
 BfCiuI4xad+1Nhfp717ETaRvMizlXFsGGgl0QdvoORU1wfwqBjGE96Bo7fROjjWGOm1vvdnGaHU2x
 1bTg19ENVXJo6vQNLAKIRi4q4XipclAXYXv/Okr/nZooF/zEWWjPj0+X8kAtAKYkrJwhElGGxlP0f
 19IrjsQA==;
Received: from [186.208.68.119] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vvDrQ-005DpP-UM; Wed, 25 Feb 2026 13:19:25 +0100
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, alex.hung@amd.com,
 andrzej.hajda@intel.com, christian.koenig@amd.com, harry.wentland@amd.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mario.limonciello@amd.com, mripard@kernel.org, mwen@igalia.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH v8 2/8] drm/amd/display: start using drm_edid helpers to parse
 EDID caps
Date: Wed, 25 Feb 2026 09:04:31 -0300
Message-ID: <20260225121903.236115-3-mwen@igalia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260225121903.236115-1-mwen@igalia.com>
References: <20260225121903.236115-1-mwen@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,intel.com,kwiboo.se,ideasonboard.com,linux.intel.com,kernel.org,igalia.com,linaro.org,ffwll.ch,suse.de];
	FREEMAIL_CC(0.00)[linux.intel.com,mailbox.org,gmail.com,lists.freedesktop.org,igalia.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.737];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 7082F1972B2
X-Rspamd-Action: no action

Groundwork that allocates a temporary drm_edid from raw edid to take
advantage of DRM common-code helpers instead of driver-specific code.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---

v8:
- centralize cleanup and return to a single place (Timur)
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 7d0ecce6b034..ef7f27ce4b50 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -110,18 +110,21 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	struct drm_connector *connector = &aconnector->base;
 	struct drm_device *dev = connector->dev;
 	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
+	const struct drm_edid *drm_edid;
 	struct cea_sad *sads;
 	int sad_count = -1;
 	int sadb_count = -1;
 	int i = 0;
 	uint8_t *sadb = NULL;
-
 	enum dc_edid_status result = EDID_OK;
 
+
 	if (!edid_caps || !edid)
 		return EDID_BAD_INPUT;
 
-	if (!drm_edid_is_valid(edid_buf))
+	drm_edid = drm_edid_alloc(edid_buf, EDID_LENGTH * (edid_buf->extensions + 1));
+
+	if (!drm_edid_valid(drm_edid))
 		result = EDID_BAD_CHECKSUM;
 
 	edid_caps->manufacturer_id = (uint16_t) edid_buf->mfg_id[0] |
@@ -145,8 +148,9 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	apply_edid_quirks(dev, edid_buf, edid_caps);
 
 	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
-	if (sad_count <= 0)
-		return result;
+	if (sad_count <= 0) {
+		goto cleanup;
+	}
 
 	edid_caps->audio_mode_count = min(sad_count, DC_MAX_AUDIO_DESC_COUNT);
 	for (i = 0; i < edid_caps->audio_mode_count; ++i) {
@@ -173,6 +177,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	kfree(sads);
 	kfree(sadb);
 
+cleanup:
+	drm_edid_free(drm_edid);
 	return result;
 }
 
-- 
2.51.0

