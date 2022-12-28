Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5076571BF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 02:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9047B10E368;
	Wed, 28 Dec 2022 01:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A40C10E177
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 01:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672192091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sg6FOfZxQPsgBuL2lCxZX6+6aSPYMIBPuFtBP5Cei48=;
 b=ZcNDGYDHum819+s9jqidLpExjW+FPhEfeRr45Ziptwg9rPqg19bg+rFyu/KM0WaCttFI8C
 4s67Lr9o/eD3Tj93kZK64qGRHoZqazb3MEmvFoHmvyeu5vCXQLhRTKvjZfbqE9xDarSQlZ
 M7G9iD/junT6BPiAnhBY60fYcv0fDzA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-130-HgNQJ2KWOE-jadG_ovcvKA-1; Tue, 27 Dec 2022 20:48:07 -0500
X-MC-Unique: HgNQJ2KWOE-jadG_ovcvKA-1
Received: by mail-wm1-f72.google.com with SMTP id
 p34-20020a05600c1da200b003d990064285so1230446wms.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 17:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sg6FOfZxQPsgBuL2lCxZX6+6aSPYMIBPuFtBP5Cei48=;
 b=uNWkGPDVmENqnHa4L8Wpuz7vtSaF5ccVyXGohFGJZFFMCo01etkz1sOmEDEqmmCki6
 l8pq94blteOtCZY/ZDKy9gFepsZUwhgasVGmMeq2PX2V6SZrT7vEQzyFP7qFGW2x5wPB
 R+ZNpWpq2tggMqW6FtO2NPZxKcz70eTsnTm/H23jDEoYFhorkfPkW/851aRWjZ9Ahgg2
 W6EaxocA0+tbY2CmKPw9jIBrOu2e0nZbDZpVOJpH+vVRZhb55anp0DkZYnT5rUt20eJM
 kbJQ1JWhfEXnuT5x+un1Cn7fh2MBmivxExWixZMYXNgKEokQhdZEGnPDi+3k4oUP/lBw
 /r3w==
X-Gm-Message-State: AFqh2kroHouL0RfWEp6upT3/snfXJqmXeyKna+QaLIBHGn+S5RceY2G2
 Bzt73NYBG6XDgPTQ8jrh7cLtPIa9+eym39CZYTd0Wz1NcEIvho4bii6RPWo0/T7dwerk7Jg2aDE
 crW/8kO668e9JDkYK1urI/OQPjEPw
X-Received: by 2002:a5d:4e83:0:b0:242:5a9e:4568 with SMTP id
 e3-20020a5d4e83000000b002425a9e4568mr12991617wru.45.1672192086078; 
 Tue, 27 Dec 2022 17:48:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuXz9A+09CakdtdwfU4SPOdpy8fb8wQkkl6VF14wcUIysAKCYyZAYMYn7pcI8WMR07nGId45w==
X-Received: by 2002:a5d:4e83:0:b0:242:5a9e:4568 with SMTP id
 e3-20020a5d4e83000000b002425a9e4568mr12991610wru.45.1672192085901; 
 Tue, 27 Dec 2022 17:48:05 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k16-20020a056000005000b002258235bda3sm14158873wrx.61.2022.12.27.17.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 17:48:05 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 01/14] drm/mipi-dsi: Add a mipi_dsi_dcs_write_seq() macro
Date: Wed, 28 Dec 2022 02:47:44 +0100
Message-Id: <20221228014757.3170486-2-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
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
---

 include/drm/drm_mipi_dsi.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 20b21b577dea..c7c458131ba1 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -297,6 +297,22 @@ int mipi_dsi_dcs_set_display_brightness(struct mipi_dsi_device *dsi,
 int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
 					u16 *brightness);
 
+/**
+ * mipi_dsi_generic_write - transmit data using a generic write packet
+ * @dsi: DSI peripheral device
+ * @seq: buffer containing the payload
+ */
+#define mipi_dsi_generic_write_seq(dsi, seq...) do {				\
+		static const u8 d[] = { seq };					\
+		struct device *dev = &dsi->dev;	\
+		int ret;						\
+		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));	\
+		if (ret < 0) {						\
+			dev_err_ratelimited(dev, "transmit data failed: %d\n", ret); \
+			return ret;						\
+		}						\
+	} while (0)
+
 /**
  * mipi_dsi_dcs_write_seq - transmit a DCS command with payload
  * @dsi: DSI peripheral device
-- 
2.38.1

