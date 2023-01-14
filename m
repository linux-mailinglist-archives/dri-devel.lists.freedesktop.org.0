Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B891B66AB18
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 12:05:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0A110E08F;
	Sat, 14 Jan 2023 11:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4CC10E228
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jan 2023 01:00:27 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id a3so5632774ilp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 17:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hef3HKJw/rh8LMbhGDXUzdaIfcIHyO7m2r48LhMzONQ=;
 b=Zy//f3JiIpMV+8UMCiYoIm2Tha3BaDlu356RKRLoiWjKY0XOKk1MGobKMcAb3ixLRP
 NTWR3wf4LAaxp+sYohOs90AIqfu+IbIiwZENwL6qTuSkmvefdO5/wxO41TBK72NB+D98
 M+DP2helRU+IqSnOkn7f6AtZLOgt50oEQ6G5AGD+Hn8LwoXqLbCTb6oXLZmvJ7/cf9qL
 O64PgChaj6cl+I6HmfQUsM7eMJbM3bijQ1q48UKP8hql/nN+lQNIjR7EMMO2XbWkOh2A
 YoYWtMDDiaD5ek3wWbwMw4zh7x3h1dAQkDXvW6WzKotwUUR3S0KKZnawnoGK19YHesRw
 ct0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hef3HKJw/rh8LMbhGDXUzdaIfcIHyO7m2r48LhMzONQ=;
 b=EaGK2fKhhfVRN6ZL/d/Z20dEvjU0ZBjVy7AFnZ2lM4Xr30BwdIf2w2tAWK5xFnND3C
 TLMbmnKdnnzqNE7J2eotlqRsaFGlIEQaXspkJ4SX/DHSQQPp5MVC03R0JZpcTSXcJ0/v
 S6J767a8zRjPyQCgWBw78G49uMQoXhQGQX6ULtFegeVXlVxtiBoS0beCB7z0O/iTrdLh
 u8IKE2zjzkk9qNHUKbrhEhqgSnUA9a8Z3jKE0md5mh3tfaIRYkMz5geOLOa+3QUPcOaV
 cohs8tDtndmzwgUfG1j17v1l/0iXYIEzk1kartYDz7f8rIbhv3+4dABvRrH+PkxAS1Rd
 eTlQ==
X-Gm-Message-State: AFqh2kq8d9mj/TaLUkDD7oKmStxbNbZuf3MCqmHqzT+mcdrWM2099gau
 N96CsKGd1s2O+1duK9ZXseY=
X-Google-Smtp-Source: AMrXdXsIIUYD+FJQRU22iUAfjjh4RjByOXA0IuTNMrw5Nv9J8+VQxZsV6IuZ/eXk5Q7x1+wwxbhfeA==
X-Received: by 2002:a92:d186:0:b0:30d:b66e:e4e3 with SMTP id
 z6-20020a92d186000000b0030db66ee4e3mr10760510ilz.1.1673658026262; 
 Fri, 13 Jan 2023 17:00:26 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::6463])
 by smtp.gmail.com with ESMTPSA id
 191-20020a021dc8000000b0039e07ca9ae5sm6566086jaj.113.2023.01.13.17.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 17:00:25 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 Vinay Simha BN <simhavcs@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/2] drm/dsi-mipi: Fix byte order of DCS set/get
 brightness
Date: Fri, 13 Jan 2023 20:00:05 -0500
Message-Id: <20230114010006.50471-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114010006.50471-1-mailingradian@gmail.com>
References: <20230114010006.50471-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 14 Jan 2023 11:05:05 +0000
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
Cc: Caleb Connolly <caleb@connolly.tech>,
 Richard Acayan <mailingradian@gmail.com>,
 Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Mentz <danielmentz@google.com>

The MIPI DCS specification demands that brightness values are sent in
big endian byte order. It also states that one parameter (i.e. one byte)
shall be sent/received for 8 bit wide values, and two parameters shall
be used for values that are between 9 and 16 bits wide.

Fixes: 1a9d759331b8 ("drm/dsi: Implement DCS set/get display brightness")
Signed-off-by: Daniel Mentz <danielmentz@google.com>
Change-Id: I24306e21ec6a5ff48ea121d977419a81d5b44152
Link: https://android.googlesource.com/kernel/msm/+/754affd62d0ee268c686c53169b1dbb7deac8550
[richard: fix 16-bit brightness_get]
[richard: use separate functions instead of switch/case]
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 52 ++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  4 +++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 497ef4b6a90a..4bc15fbd009d 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -1224,6 +1224,58 @@ int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_get_display_brightness);
 
+/**
+ * mipi_dsi_dcs_set_display_brightness_large() - sets the 16-bit brightness value
+ *    of the display
+ * @dsi: DSI peripheral device
+ * @brightness: brightness value
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int mipi_dsi_dcs_set_display_brightness_large(struct mipi_dsi_device *dsi,
+					     u16 brightness)
+{
+	u8 payload[2] = { brightness >> 8, brightness & 0xff };
+	ssize_t err;
+
+	err = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
+				 payload, sizeof(payload));
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_set_display_brightness_large);
+
+/**
+ * mipi_dsi_dcs_get_display_brightness_large() - gets the current 16-bit
+ *    brightness value of the display
+ * @dsi: DSI peripheral device
+ * @brightness: brightness value
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
+					     u16 *brightness)
+{
+	u8 brightness_be[2];
+	ssize_t err;
+
+	err = mipi_dsi_dcs_read(dsi, MIPI_DCS_GET_DISPLAY_BRIGHTNESS,
+				brightness_be, sizeof(brightness_be));
+	if (err <= 0) {
+		if (err == 0)
+			err = -ENODATA;
+
+		return err;
+	}
+
+	*brightness = (brightness_be[0] << 8) | brightness_be[1];
+
+	return 0;
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_get_display_brightness_large);
+
 static int mipi_dsi_drv_probe(struct device *dev)
 {
 	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 4f503d99f668..16f30975b22b 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -296,6 +296,10 @@ int mipi_dsi_dcs_set_display_brightness(struct mipi_dsi_device *dsi,
 					u16 brightness);
 int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
 					u16 *brightness);
+int mipi_dsi_dcs_set_display_brightness_large(struct mipi_dsi_device *dsi,
+					     u16 brightness);
+int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
+					     u16 *brightness);
 
 /**
  * mipi_dsi_generic_write_seq - transmit data using a generic write packet
-- 
2.39.0

