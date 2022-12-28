Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014A96571CB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 02:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A068C10E36C;
	Wed, 28 Dec 2022 01:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E4210E364
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 01:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672192096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LVRZWETGH6ZWArylwAp+hcdkJg08dz7DN+pWXc29+fo=;
 b=GvxyrQICMQvGEiw0iFF0uMECz27Gdm6tbRJ7ccUcyD+jiH/gM67NaUZhddNBhfoSKE2EPE
 J981tY8xTnvgDmd6a5K1agb4p/mo4UL2j4dcZ30jNOy3nl5QtTZgeVlfJ4OcyTRYM0iM+N
 UIqeGK32djFJb2yhSs1Heccw29WK/mg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-303-VWx8MMiNNyq4uoHnMT6hLQ-1; Tue, 27 Dec 2022 20:48:15 -0500
X-MC-Unique: VWx8MMiNNyq4uoHnMT6hLQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j1-20020a05600c1c0100b003d99070f529so1114197wms.9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 17:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LVRZWETGH6ZWArylwAp+hcdkJg08dz7DN+pWXc29+fo=;
 b=mDVQQikEHzy//r7pQDp7Pocn6sCRUrPqOSuHge9HCcCQqBm4F/MZzlBefGNtHnwmTM
 VgIANFye/zzevbGitPaXOfc9E0JkzfaLDLY0nSoT2ob1n7x9jIFJbtLwyY1UwG1xRSTa
 8r8tdPPxJ1ZM6TjwCYtiOSPeYne4eAim6yXz0i8o1AbrUqy5I1K8RpU6acCvPzpa5nKR
 TfT+NYm+KKJvqc1I17kJf6MQ1K/sg3iKkTRRNc+eYBeF/fi7VxaIzaXSbhVCLdwza6s2
 Gvfnd/bCo2Xw9CDYwO1JPWdunD0FvEzKTeMyuQRiEzaHzDHd1zubBOa+/5KnORk/vPV5
 ckeg==
X-Gm-Message-State: AFqh2koxx+J3s0V0DgnxBjC80oF2d45RMRRNjBlD6qCeHDNylk3k8FvA
 FaEuisKze8ybJRg6FSsWVSThkTwRIfDMWTB2Lcq0TOTyaO454HRjbCD49hCwTX6nDtlO/kHeq1A
 j0HP+YGHiV53IygccG0jKBZyQCypB
X-Received: by 2002:adf:ee52:0:b0:25d:d243:4f3c with SMTP id
 w18-20020adfee52000000b0025dd2434f3cmr13553301wro.69.1672192094236; 
 Tue, 27 Dec 2022 17:48:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtaoDohriVGDqNtNH1suISrVVz7wzewDzWmFBOFjilDu6cmmOLQCCgEM/ufMGlv7ZwkWINAzg==
X-Received: by 2002:adf:ee52:0:b0:25d:d243:4f3c with SMTP id
 w18-20020adfee52000000b0025dd2434f3cmr13553292wro.69.1672192094038; 
 Tue, 27 Dec 2022 17:48:14 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k16-20020a056000005000b002258235bda3sm14158873wrx.61.2022.12.27.17.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 17:48:13 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 07/14] drm/panel-novatek-nt35950: Drop custom DSI write macro
Date: Wed, 28 Dec 2022 02:47:50 +0100
Message-Id: <20221228014757.3170486-8-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228014757.3170486-1-javierm@redhat.com>
References: <20221228014757.3170486-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a macro for this already in the <drm/drm_mipi_dsi.h> header, use
that instead and delete the custom DSI write macro defined in the driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/panel/panel-novatek-nt35950.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
index 3a844917da07..abf752b36a52 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
@@ -89,14 +89,6 @@ static inline struct nt35950 *to_nt35950(struct drm_panel *panel)
 	return container_of(panel, struct nt35950, panel);
 }
 
-#define dsi_dcs_write_seq(dsi, seq...) do {				\
-		static const u8 d[] = { seq };				\
-		int ret;						\
-		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
 static void nt35950_reset(struct nt35950 *nt)
 {
 	gpiod_set_value_cansleep(nt->reset_gpio, 1);
@@ -338,7 +330,7 @@ static int nt35950_on(struct nt35950 *nt)
 		return ret;
 
 	/* Unknown command */
-	dsi_dcs_write_seq(dsi, 0xd4, 0x88, 0x88);
+	mipi_dsi_dcs_write_seq(dsi, 0xd4, 0x88, 0x88);
 
 	/* CMD2 Page 7 */
 	ret = nt35950_set_cmd2_page(nt, 7);
@@ -346,10 +338,10 @@ static int nt35950_on(struct nt35950 *nt)
 		return ret;
 
 	/* Enable SubPixel Rendering */
-	dsi_dcs_write_seq(dsi, MCS_PARAM_SPR_EN, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, MCS_PARAM_SPR_EN, 0x01);
 
 	/* SPR Mode: YYG Rainbow-RGB */
-	dsi_dcs_write_seq(dsi, MCS_PARAM_SPR_MODE, MCS_SPR_MODE_YYG_RAINBOW_RGB);
+	mipi_dsi_dcs_write_seq(dsi, MCS_PARAM_SPR_MODE, MCS_SPR_MODE_YYG_RAINBOW_RGB);
 
 	/* CMD3 */
 	ret = nt35950_inject_black_image(nt);
-- 
2.38.1

