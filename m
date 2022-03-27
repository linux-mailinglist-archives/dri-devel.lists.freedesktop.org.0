Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CAE4E861C
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 07:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0714010E4AB;
	Sun, 27 Mar 2022 05:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3121910E4AB
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 05:54:03 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id m22so11180870pja.0
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Mar 2022 22:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=LIDQGlj3VLO68EFfP7fGx3WACork59rTmNVuYIV40DE=;
 b=q1T9x1irmTEDglNu4jA/LGN/tv+9XWlN8xmGoZRJ94dQYV4PFTPV+3L3D6La0T5TGO
 U7u5tZsTqJm/JgbrkP+OQlxzLLkeh4oACKfpJ6iH3azw4RA2mxRiB2By0FqZdKeiR8NK
 d6UJaVdF2yWaggbls8plj0d0/v3rL2+jiOEyoCkppbkHH/q/WxNnxLp7ed1z9AVoQSkq
 vPw7DDwGHJMnX4Doy3QuQrbWiTeq9wsbyNHKN5wC/oF42wohZagR1O+ZCi+G5rSAfwcB
 B/66OfrBlgVndH/XA71/creKi9QT6sKKlyswdatTFl96vg8weVg1aBPdaIiYMYbWhbY6
 CoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LIDQGlj3VLO68EFfP7fGx3WACork59rTmNVuYIV40DE=;
 b=SZO3h6ci2d86iVHH0qqMHsBVi7x0vcnoOYwY2dCltoAkkWEPjZrp+xYV3ZyHiesJE4
 1VpB35gbKXPQ/D3RP0oT2rOuwA3whEt4q9lLhtzGFozxsH3bmv8KudhI+llQZwiDbg9s
 wguK01jo72froQnaRdN30IzHKnqtwntXDNnM2+MfPAosR9eWQd1SEtA3XpvCPqDfwL2a
 QsfaHBJGEl1u78vcBTrxTbv8om0OEMmt0GrIyFzSO5G3cpdYTb+C7nNMrTzHlyqc1gMu
 JvPJrjXdwcUr/j1ie6LrjJqLMECKAgPC42dpJMoeWJzqPdNmpb/2letumWwyKszKywbN
 bucw==
X-Gm-Message-State: AOAM531O8mQKEfBSlILcmk8RV4Xr3Rc8xYnqkAv/6qFgv2GFZxHl8wiV
 Qx4wpT6IBM/AcjQZlfmBHWs=
X-Google-Smtp-Source: ABdhPJy4k07mvfzm2EG3bok+szq0r8f379ZtqpNiz3wD1da1BhAx93ZoSKYEp5L3TI3I5jVnEniXNA==
X-Received: by 2002:a17:90b:1a8b:b0:1c7:386b:4811 with SMTP id
 ng11-20020a17090b1a8b00b001c7386b4811mr22577530pjb.4.1648360442838; 
 Sat, 26 Mar 2022 22:54:02 -0700 (PDT)
Received: from localhost.localdomain ([115.220.243.108])
 by smtp.googlemail.com with ESMTPSA id
 w61-20020a17090a6bc300b001c7ca8a1467sm8779049pjj.46.2022.03.26.22.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 22:54:02 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: yannick.fertre@foss.st.com
Subject: [PATCH] stm: ltdc: fix two incorrect NULL checks on list iterator
Date: Sun, 27 Mar 2022 13:53:55 +0800
Message-Id: <20220327055355.3808-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: marex@denx.de, raphael.gallais-pou@foss.st.com, airlied@linux.ie,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The two bugs are here:
	if (encoder) {
	if (bridge && bridge->timings)

The list iterator value 'encoder/bridge' will *always* be set and
non-NULL by drm_for_each_encoder()/list_for_each_entry(), so it is
incorrect to assume that the iterator value will be NULL if the
list is empty or no element is found.

To fix the bug, use a new variable '*_iter' as the list iterator,
while use the old variable 'encoder/bridge' as a dedicated pointer
to point to the found element.

Cc: stable@vger.kernel.org
Fixes: 99e360442f223 ("drm/stm: Fix bus_flags handling")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/gpu/drm/stm/ltdc.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index dbdee954692a..d6124aa873e5 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -528,8 +528,8 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	struct drm_device *ddev = crtc->dev;
 	struct drm_connector_list_iter iter;
 	struct drm_connector *connector = NULL;
-	struct drm_encoder *encoder = NULL;
-	struct drm_bridge *bridge = NULL;
+	struct drm_encoder *encoder = NULL, *en_iter;
+	struct drm_bridge *bridge = NULL, *br_iter;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	u32 hsync, vsync, accum_hbp, accum_vbp, accum_act_w, accum_act_h;
 	u32 total_width, total_height;
@@ -538,15 +538,19 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	int ret;
 
 	/* get encoder from crtc */
-	drm_for_each_encoder(encoder, ddev)
-		if (encoder->crtc == crtc)
+	drm_for_each_encoder(en_iter, ddev)
+		if (en_iter->crtc == crtc) {
+			encoder = en_iter;
 			break;
+		}
 
 	if (encoder) {
 		/* get bridge from encoder */
-		list_for_each_entry(bridge, &encoder->bridge_chain, chain_node)
-			if (bridge->encoder == encoder)
+		list_for_each_entry(br_iter, &encoder->bridge_chain, chain_node)
+			if (br_iter->encoder == encoder) {
+				bridge = br_iter;
 				break;
+			}
 
 		/* Get the connector from encoder */
 		drm_connector_list_iter_begin(ddev, &iter);
-- 
2.17.1

