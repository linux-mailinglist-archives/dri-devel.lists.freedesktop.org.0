Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A45746571CF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 02:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D6D10E36E;
	Wed, 28 Dec 2022 01:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A181010E367
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 01:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672192101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAya4FSKwba6VvdFIeSAErTX1xwGmtOXg5P4/ZRBg8k=;
 b=P6kZMlTP7kigl/7YFzcfzTuivFGJ4LilWuRLK/XbZHDytlM3jAzwpFpmc8I+zq6os0Mo1C
 b8jyPMWkS21ylVdywYE5ddI4pt81uM+UPh6CTuU3JzJn9/2bjy71r6Y5JOvP1POKVz8y9U
 YllNGO++rHauYzc+zz8yPywTZjr3ji0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-j6IJjV85Oeq5zm17wznIpw-1; Tue, 27 Dec 2022 20:48:20 -0500
X-MC-Unique: j6IJjV85Oeq5zm17wznIpw-1
Received: by mail-wm1-f72.google.com with SMTP id
 k20-20020a05600c1c9400b003d9717c8b11so5640338wms.7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 17:48:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FAya4FSKwba6VvdFIeSAErTX1xwGmtOXg5P4/ZRBg8k=;
 b=Rhk8QeRebsnzigbTVqr6cPfU3N8LQnvP60vbnFi5ayJ7WgWwzJeFa/RqhnzJ9iKn6/
 QC51fUfoq2d4GVMweXC4NPOUIp2LkYBGIP+MfkaQ4sKCK5XBtR+C9ne3mMF9RRxHzjQf
 472p/c436wfcqYddo9PWbw/qIZVW9UQN9rRQEP5Rj90rNs09JxExlN7JHfA+n0YyTMDu
 HTQoD3cLygQKr/h22DGmWw2ALNltayFkGe9e/XwD5IpYudnsb3ApSk59D5O8bbqq0XQi
 iATXIPYvZZ0gsv9gkoTVmu97d7oBTyGGhkrTDgEWVHdr+EMQlaT62mZwgreq1Qxs4TQ7
 24mA==
X-Gm-Message-State: AFqh2kr40YHy71VLsuktN1bVbwc4ijtMCGQc/ZrDuJUDRKHR6PfuRnzg
 W1JFtt8bo7kCDVk5xI2qWINVjp9bRIkU13WIuqB0HM3GK3y/XcTTtjNBP62ZAQRxWIc9rzvbHHJ
 psvesdc3+4GfzgtRu/UoI1HU5v63T
X-Received: by 2002:adf:fc51:0:b0:27d:ddaa:8bd8 with SMTP id
 e17-20020adffc51000000b0027dddaa8bd8mr5313652wrs.13.1672192099363; 
 Tue, 27 Dec 2022 17:48:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs/Kssky6t73oZG/gcrNsPYZiX5THvQztGesgNjeV0fyMNB/Jn0TcbRPckGXXZFNtoGYRY1hw==
X-Received: by 2002:adf:fc51:0:b0:27d:ddaa:8bd8 with SMTP id
 e17-20020adffc51000000b0027dddaa8bd8mr5313649wrs.13.1672192099191; 
 Tue, 27 Dec 2022 17:48:19 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k16-20020a056000005000b002258235bda3sm14158873wrx.61.2022.12.27.17.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 17:48:18 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 11/14] drm/panel-sharp-ls060t1sx01: Drop custom DSI write macro
Date: Wed, 28 Dec 2022 02:47:54 +0100
Message-Id: <20221228014757.3170486-12-javierm@redhat.com>
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

 .../gpu/drm/panel/panel-sharp-ls060t1sx01.c   | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c b/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
index 8a4e0c1fe73f..68f52eaaf4fa 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
@@ -32,12 +32,6 @@ static inline struct sharp_ls060 *to_sharp_ls060(struct drm_panel *panel)
 	return container_of(panel, struct sharp_ls060, panel);
 }
 
-#define dsi_dcs_write_seq(dsi, seq...) ({				\
-		static const u8 d[] = { seq };				\
-									\
-		mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
-	})
-
 static void sharp_ls060_reset(struct sharp_ls060 *ctx)
 {
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
@@ -56,17 +50,8 @@ static int sharp_ls060_on(struct sharp_ls060 *ctx)
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = dsi_dcs_write_seq(dsi, 0xbb, 0x13);
-	if (ret < 0) {
-		dev_err(dev, "Failed to send command: %d\n", ret);
-		return ret;
-	}
-
-	ret = dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_MEMORY_START);
-	if (ret < 0) {
-		dev_err(dev, "Failed to send command: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x13);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_MEMORY_START);
 
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
 	if (ret < 0) {
-- 
2.38.1

