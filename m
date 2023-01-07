Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB29B661142
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 20:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80C310E358;
	Sat,  7 Jan 2023 19:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A7E10E1C1
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 19:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673119119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rD+5XNBbrJZAW/YgIxLybfi5YZERSLl6kQc4XxgcM9A=;
 b=MNETaOqi9fXVR4S6QOW1Y669zQbDekcU+Wre5ass/UWjildh5NiJxhSY4JRkMhPJlvU6hg
 MwisucGxdMnLzjLNvUZc2uDKSL4cUwNZatcopZX6uPg6j+XA9yT1BQMU/b9i1QaRLguS4U
 m6lzrWQ+1N262+US/jTTH272cLt73Xk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-z4ZLoIhWPO-gOI8Na-iWaw-1; Sat, 07 Jan 2023 14:18:37 -0500
X-MC-Unique: z4ZLoIhWPO-gOI8Na-iWaw-1
Received: by mail-wm1-f69.google.com with SMTP id
 bd6-20020a05600c1f0600b003d96f7f2396so4653348wmb.3
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 11:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rD+5XNBbrJZAW/YgIxLybfi5YZERSLl6kQc4XxgcM9A=;
 b=g2THSH3wbsTURtcb2F4/qicBIj4sxCVpx1uverKA3JiKuUI/l/CiPqH+lUFpbSJ7qR
 FbOzzACpC7bT3ZZoL2pTIAJlA7MAiGRdpqW8UGi4NUjEqzVFWU7Be4LqRkCHlvKmhSHu
 raacLjcQ1kfH6/YHQoW4F6ho97zh1aFBSwRqSu3CygjwCEmWntpBYZ9vAUnSjr4illXe
 KNj18G1Q8CDhuRuudsYyjl4MStU7TR1gIAYKYgvq6VUHK8Tx/SlbjwFPPcFERtM11Bmi
 7o777mHlzvYpX/WwvyYfaYwwsq2PSER7h8e2uOSPHmvqdbzvyd1NsXprsMCpM7jNZPoo
 B2dw==
X-Gm-Message-State: AFqh2kpq2FC9UT8t5t0DW0vD220CTe4XGICfNh5xUjY2zieqHYUfJokU
 qOIwnLd3y2ZGD+FXg+nMTSz/vt9we33N/1BRRuDKfYbTjaJeGMfNVWZfqsm1levccxy4ATVbd4s
 j7L+XJ0bdD9TTdnAohmnWJPhUphGo
X-Received: by 2002:adf:eb8c:0:b0:242:728a:fa7 with SMTP id
 t12-20020adfeb8c000000b00242728a0fa7mr33769253wrn.61.1673119116649; 
 Sat, 07 Jan 2023 11:18:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvE+E+NlBTd5p9Pyq5ZUX2ftUmzX2ODr9/fM3A+3zEhCen7AjJZbom7669251XvENcNq7EVFQ==
X-Received: by 2002:adf:eb8c:0:b0:242:728a:fa7 with SMTP id
 t12-20020adfeb8c000000b00242728a0fa7mr33769247wrn.61.1673119116483; 
 Sat, 07 Jan 2023 11:18:36 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bp28-20020a5d5a9c000000b00273cd321a1bsm4553900wrb.107.2023.01.07.11.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 11:18:36 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/13] drm/panel-elida-kd35t133: Drop custom DSI write macro
Date: Sat,  7 Jan 2023 20:18:13 +0100
Message-Id: <20230107191822.3787147-5-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230107191822.3787147-1-javierm@redhat.com>
References: <20230107191822.3787147-1-javierm@redhat.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a macro for this already in the <drm/drm_mipi_dsi.h> header, use
that instead and delete the custom DSI write macro defined in the driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v2:
- Add Sam Ravnborg's Reviewed-by tag.
- Fix identation on macro usage (Sam Ravnborg).

 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 46 ++++++++------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index eee714cf3f49..e7be15b68102 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -51,14 +51,6 @@ static inline struct kd35t133 *panel_to_kd35t133(struct drm_panel *panel)
 	return container_of(panel, struct kd35t133, panel);
 }
 
-#define dsi_dcs_write_seq(dsi, cmd, seq...) do {			\
-		static const u8 b[] = { cmd, seq };			\
-		int ret;						\
-		ret = mipi_dsi_dcs_write_buffer(dsi, b, ARRAY_SIZE(b));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
 static int kd35t133_init_sequence(struct kd35t133 *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
@@ -68,25 +60,25 @@ static int kd35t133_init_sequence(struct kd35t133 *ctx)
 	 * Init sequence was supplied by the panel vendor with minimal
 	 * documentation.
 	 */
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_POSITIVEGAMMA,
-			  0x00, 0x13, 0x18, 0x04, 0x0f, 0x06, 0x3a, 0x56,
-			  0x4d, 0x03, 0x0a, 0x06, 0x30, 0x3e, 0x0f);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_NEGATIVEGAMMA,
-			  0x00, 0x13, 0x18, 0x01, 0x11, 0x06, 0x38, 0x34,
-			  0x4d, 0x06, 0x0d, 0x0b, 0x31, 0x37, 0x0f);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_POWERCONTROL1, 0x18, 0x17);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_POWERCONTROL2, 0x41);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_VCOMCONTROL, 0x00, 0x1a, 0x80);
-	dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x48);
-	dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_INTERFACEMODECTRL, 0x00);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_FRAMERATECTRL, 0xa0);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_DISPLAYINVERSIONCTRL, 0x02);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_DISPLAYFUNCTIONCTRL,
-			  0x20, 0x02);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_SETIMAGEFUNCTION, 0x00);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_ADJUSTCONTROL3,
-			  0xa9, 0x51, 0x2c, 0x82);
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POSITIVEGAMMA,
+			       0x00, 0x13, 0x18, 0x04, 0x0f, 0x06, 0x3a, 0x56,
+			       0x4d, 0x03, 0x0a, 0x06, 0x30, 0x3e, 0x0f);
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_NEGATIVEGAMMA,
+			       0x00, 0x13, 0x18, 0x01, 0x11, 0x06, 0x38, 0x34,
+			       0x4d, 0x06, 0x0d, 0x0b, 0x31, 0x37, 0x0f);
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POWERCONTROL1, 0x18, 0x17);
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POWERCONTROL2, 0x41);
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_VCOMCONTROL, 0x00, 0x1a, 0x80);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x48);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_INTERFACEMODECTRL, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_FRAMERATECTRL, 0xa0);
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_DISPLAYINVERSIONCTRL, 0x02);
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_DISPLAYFUNCTIONCTRL,
+			       0x20, 0x02);
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_SETIMAGEFUNCTION, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_ADJUSTCONTROL3,
+			       0xa9, 0x51, 0x2c, 0x82);
 	mipi_dsi_dcs_write(dsi, MIPI_DCS_ENTER_INVERT_MODE, NULL, 0);
 
 	dev_dbg(dev, "Panel init sequence done\n");
-- 
2.38.1

