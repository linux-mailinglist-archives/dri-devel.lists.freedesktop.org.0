Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B14BD624390
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 14:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C676510E7C1;
	Thu, 10 Nov 2022 13:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB7C10E7B8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:48:00 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a14so2335937wru.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 05:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OLY2eEQFguZMIlY74s69pwkJXEOkjmvxBO7cb3VXH9s=;
 b=fhAPyBkyxhDKeTqg+JqZWQsY4umNf4sYfDnF8USCVvvFTZSNZHUo+JQvef272pkr1c
 8I8aqC079tWCHZA/lNHvCzVqIvMVo51wS49wNbWWVRx9uR2UOaewRAcumne6bktPlaIL
 xez1MlDj8nAsglT7znRsVL3Il1ow8jY3Qxtv7oC1U3Emru5vkfr8gpyjcIGPPnAZ1Lac
 TB7xf61siUjU2WBFyXwRvlKoCO1ji6PdXb8xsSsjhGIuIMZ1bWfsKbYmjvZGHu5y2fe9
 LI0JVeHIloPW2F/9uBZKAeupKYCh33DPq67V+ryoKT5YLPqFM1z6e3hKyjia1x8gVtk+
 uvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OLY2eEQFguZMIlY74s69pwkJXEOkjmvxBO7cb3VXH9s=;
 b=CsY2m13cUi0E/kb/XxZpjZg7TM8oD/p/ii0N+rBfiklOgD+NXom9w3ZES2D6pZpbKV
 xieppLVu4BpVj5v+yqvHNlawfnaSgCAbPr0ZWdAdTMCWzn9oD+ym3Uq2s53y94vXX8pu
 ww92R1jwVwe41Bnb/5F+W6PSyhSYvCkfMn2rI5BNrgmZ9dYzZlfaRZloUb14jT0VuJlc
 uMkwk5/TbQCdWVpCekz201TbRnz3LKlpDFsNPggIx9rRa86qwkicI6YWgd9OFNGdBG7E
 dfjgykfNSiZ4Vxhgox01KuOZhv8FYGpDVlq1f68FNS6vJZrIUpXFk3xkUneDpcCVcKWV
 MpOg==
X-Gm-Message-State: ACrzQf3msb9LmNM1fh0Be7ai/JTqt+6aH+ivK2s8QYWnft6723qh+Zff
 zBHJobiMVnM3Nk30LSJR5vc=
X-Google-Smtp-Source: AMsMyM6FTHfjKzU1+iMHW0JdWPMGdz7hTtjxHSpuh1O2USH3Dn1AglaEQKe2BBL0wK+BEiQTwrEwbw==
X-Received: by 2002:a5d:5a17:0:b0:238:589f:e610 with SMTP id
 bq23-20020a5d5a17000000b00238589fe610mr885821wrb.42.1668088079216; 
 Thu, 10 Nov 2022 05:47:59 -0800 (PST)
Received: from localhost.localdomain ([94.73.35.109])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a5d4302000000b0022ae0965a8asm15717060wrq.24.2022.11.10.05.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 05:47:58 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: mripard@kernel.org
Subject: [PATCH v2 1/2] drm/vc4: hdmi: Pass vc4_hdmi to
 vc4_hdmi_supports_scrambling()
Date: Thu, 10 Nov 2022 14:47:51 +0100
Message-Id: <20221110134752.238820-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110134752.238820-1-jose.exposito89@gmail.com>
References: <20221110134752.238820-1-jose.exposito89@gmail.com>
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
Cc: emma@anholt.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify vc4_hdmi_supports_scrambling() by changing its first parameter
from struct drm_encoder to struct vc4_hdmi.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 0d78c800ed51..a49f88e5d2b9 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -124,9 +124,8 @@ static unsigned long long
 vc4_hdmi_encoder_compute_mode_clock(const struct drm_display_mode *mode,
 				    unsigned int bpc, enum vc4_hdmi_output_format fmt);
 
-static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder)
+static bool vc4_hdmi_supports_scrambling(struct vc4_hdmi *vc4_hdmi)
 {
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
@@ -321,7 +320,6 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
 {
 	struct drm_device *drm = connector->dev;
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc;
@@ -349,7 +347,7 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
 	if (!crtc_state->active)
 		return 0;
 
-	if (!vc4_hdmi_supports_scrambling(encoder))
+	if (!vc4_hdmi_supports_scrambling(vc4_hdmi))
 		return 0;
 
 	scrambling_needed = vc4_hdmi_mode_needs_scrambling(&vc4_hdmi->saved_adjusted_mode,
@@ -867,7 +865,7 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
-	if (!vc4_hdmi_supports_scrambling(encoder))
+	if (!vc4_hdmi_supports_scrambling(vc4_hdmi))
 		return;
 
 	if (!vc4_hdmi_mode_needs_scrambling(mode,
-- 
2.25.1

