Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F6F9E0B1F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 19:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700CB8952F;
	Mon,  2 Dec 2024 18:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=derek.foreman@collabora.com header.b="R/ImUEca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 904 seconds by postgrey-1.36 at gabe;
 Mon, 02 Dec 2024 18:35:16 UTC
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8192110E106
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 18:35:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1733163602; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FNuB7lGW0c1JfdZrXBeXmVOAZQtTVBuqV9jxA3VnP4ovLHZDlqzDsfUCVjlB+21SrATMxxRRFjXjydWjVGgseLDIlku25sBQtEpPx0HYykFv+em4fNocNLPNk7PhagmSm6yF1vPp9EXBZj0CXshMN6Ciz1B6Wdu3ThKMGvzlKSM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1733163602;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=9NoMdQu2hwXtcLbGO/uDqJangdgfOFpomDmoHtRNlWc=; 
 b=Lm4nZMPV0Q/dm9M07OnAG2Zi7HsogCH2hdlxsHR4REYMKuCD4lU4rPUkhjby8ISrs6Bv8nDIPVVhhnUhICb96k+avvQVb06YTAlZ0bLzLVnZ1FqbUfCQEPYggICOqaOyNaM1Eq6ITwSCPkGSRcTYrK6GHcnJ229y/d4yYKrUb4A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=derek.foreman@collabora.com;
 dmarc=pass header.from=<derek.foreman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733163602; 
 s=zohomail; d=collabora.com; i=derek.foreman@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=9NoMdQu2hwXtcLbGO/uDqJangdgfOFpomDmoHtRNlWc=;
 b=R/ImUEcajaEKI5cJ05usme7ujcAtXxm3Dz+LLo8kY8kQ1L7+2NIkNO8sGKX1jbxx
 7lvdI4G2ZG8ZgOMA83voOmdvgdJg1kwsu7llkeVkeicBixKSRbR/1a01MqkgP+S25vY
 HblJhsg/ZjQWtcmV4jrarhOEM8DGQSNTMvFA62so=
Received: by mx.zohomail.com with SMTPS id 1733163599682952.0502819432988;
 Mon, 2 Dec 2024 10:19:59 -0800 (PST)
From: Derek Foreman <derek.foreman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: mripard@kernel.org, kernel@collabora.com, dmitry.baryshkov@linaro.org,
 Derek Foreman <derek.foreman@collabora.com>
Subject: [PATCH] drm/connector: Allow clearing HDMI infoframes
Date: Mon,  2 Dec 2024 12:19:39 -0600
Message-ID: <20241202181939.724011-1-derek.foreman@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Our infoframe setting code currently lacks the ability to clear
infoframes. For some of the infoframes, we only need to replace them,
so if an error occurred when generating a new infoframe we would leave
a stale frame instead of clearing the frame.

However, the Dynamic Range and Mastering (DRM) infoframe should only
be present when displaying HDR content (ie: the HDR_OUTPUT_METADATA blob
is set). If we can't clear infoframes, the stale DRM infoframe will
remain and we can never set the display back to SDR mode.

With this change, we clear infoframes when they can not, or should not,
be generated. This fixes switching to an SDR mode from an HDR one.

Fixes: f378b77227bc4 ("drm/connector: hdmi: Add Infoframes generation")
Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index feb7a3a75981..936a8f95d80f 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -347,6 +347,8 @@ static int hdmi_generate_avi_infoframe(const struct drm_connector *connector,
 		is_limited_range ? HDMI_QUANTIZATION_RANGE_LIMITED : HDMI_QUANTIZATION_RANGE_FULL;
 	int ret;
 
+	infoframe->set = false;
+
 	ret = drm_hdmi_avi_infoframe_from_display_mode(frame, connector, mode);
 	if (ret)
 		return ret;
@@ -376,6 +378,8 @@ static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
 		&infoframe->data.spd;
 	int ret;
 
+	infoframe->set = false;
+
 	ret = hdmi_spd_infoframe_init(frame,
 				      connector->hdmi.vendor,
 				      connector->hdmi.product);
@@ -398,6 +402,8 @@ static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
 		&infoframe->data.drm;
 	int ret;
 
+	infoframe->set = false;
+
 	if (connector->max_bpc < 10)
 		return 0;
 
@@ -425,6 +431,8 @@ static int hdmi_generate_hdmi_vendor_infoframe(const struct drm_connector *conne
 		&infoframe->data.vendor.hdmi;
 	int ret;
 
+	infoframe->set = false;
+
 	if (!info->has_hdmi_infoframe)
 		return 0;
 
-- 
2.45.2

