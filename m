Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7049365B711
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 21:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A8510E1C4;
	Mon,  2 Jan 2023 20:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBA010E1B7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 20:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672691151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CBlDHKovYJnwPgpmS84u28pOqrwSgYnv9FJm79/ywfo=;
 b=H0A53CHDKiSJ0P7aq0ubCSpHTOu8Db2SQPP23AtQ5iOC0Jvfo7CsMqVnwmCJR01gHEc2Mm
 DzZ+CC/brGm+G1qVc+Hu+qpPXK7sIlmjkTDHR50m3MliO6A3m/1ZiGcURioJXVMa3Qjg91
 ZM68PmrQWwrzK8ViUsomxhF4XwfXORY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-93-qlwl5PwGOS2IKSYTFWCe0w-1; Mon, 02 Jan 2023 15:25:50 -0500
X-MC-Unique: qlwl5PwGOS2IKSYTFWCe0w-1
Received: by mail-wm1-f71.google.com with SMTP id
 k20-20020a05600c1c9400b003d9717c8b11so13505115wms.7
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 12:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBlDHKovYJnwPgpmS84u28pOqrwSgYnv9FJm79/ywfo=;
 b=R4/oSDTyaYZw21hjjZh//whnHkKL9WCnrCWox7p9deFTBi6f9KC+ZR825mwV4J3H7/
 DgebsMzZniKn3c9KjQaulr06i6tmPlXOQWu4PWOIL/y5srMQU+3KRmjzWSVlC0J1hYW8
 5R0wIfLuxacnqIzP7+xTGBTZjQfuIY96mb+VrTMogKOYfnneFY5Jr6eilrtQtUeCKnWg
 g0yCk807cHfWCvXL9y/AKVvbRLslqZfGMjUziWlMZ421EjFOj3YVuQ9duecdPM8UqZou
 zagD/AysKOfZ0ywT0sw/BVaUuqD0c0IpeGyrc9YqWl8Upg/zl1HdsWT0YqR+dUfa6vWN
 z5+w==
X-Gm-Message-State: AFqh2ko7JDQYJDLXobRUNEYku1+vFhARzNLhLaN8Adauvc2QA3OfGxnu
 lIMSou+UOHsgAAeY/Lg2CCFlONlVcRnZuom7jpkctM1LvoXGFVpnQRDN/ow0gD7G7REsFy3zLC3
 RbNhQ2dvxRNNH4OS37n0vg9Dyj35D
X-Received: by 2002:a05:600c:5c8:b0:3d1:4145:b3b with SMTP id
 p8-20020a05600c05c800b003d141450b3bmr30492711wmd.9.1672691149109; 
 Mon, 02 Jan 2023 12:25:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuFSBAgfXtOm8IhviyEQci+lDT3iLsXP7qbucv5WVdjLUibBjrcSUUYhWY1PDUAyK235lJ0ew==
X-Received: by 2002:a05:600c:5c8:b0:3d1:4145:b3b with SMTP id
 p8-20020a05600c05c800b003d141450b3bmr30492703wmd.9.1672691148924; 
 Mon, 02 Jan 2023 12:25:48 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f18-20020a05600c4e9200b003d35c845cbbsm50061135wmq.21.2023.01.02.12.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 12:25:48 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/mipi-dsi: Add a mipi_dsi_dcs_write_seq() macro
Date: Mon,  2 Jan 2023 21:25:42 +0100
Message-Id: <20230102202542.3494677-2-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230102202542.3494677-1-javierm@redhat.com>
References: <20230102202542.3494677-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Many panel drivers define dsi_dcs_write_seq() and dsi_generic_write_seq()
macros to send DCS commands and generic write packets respectively, with
the payload specified as a list of parameters instead of using arrays.

There's already a macro for the former, introduced by commit 2a9e9daf75231
("drm/mipi-dsi: Introduce mipi_dsi_dcs_write_seq macro") so drivers can be
changed to use that. But there isn't one yet for the latter, let's add it.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v2:
- Fix kernel-doc macro name (kernel test robot, Sam Ravnborg)
- Add Sam Ravnborg's Reviewed-by tag.

 include/drm/drm_mipi_dsi.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index e9d1e8a7fc7e..4f503d99f668 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -297,6 +297,24 @@ int mipi_dsi_dcs_set_display_brightness(struct mipi_dsi_device *dsi,
 int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
 					u16 *brightness);
 
+/**
+ * mipi_dsi_generic_write_seq - transmit data using a generic write packet
+ * @dsi: DSI peripheral device
+ * @seq: buffer containing the payload
+ */
+#define mipi_dsi_generic_write_seq(dsi, seq...)                                \
+	do {                                                                   \
+		static const u8 d[] = { seq };                                 \
+		struct device *dev = &dsi->dev;                                \
+		int ret;                                                       \
+		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));           \
+		if (ret < 0) {                                                 \
+			dev_err_ratelimited(dev, "transmit data failed: %d\n", \
+					    ret);                              \
+			return ret;                                            \
+		}                                                              \
+	} while (0)
+
 /**
  * mipi_dsi_dcs_write_seq - transmit a DCS command with payload
  * @dsi: DSI peripheral device
-- 
2.38.1

