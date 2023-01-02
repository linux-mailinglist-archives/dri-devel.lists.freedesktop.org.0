Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 709B465B710
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 21:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86E510E1B7;
	Mon,  2 Jan 2023 20:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301D110E1B7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 20:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672691150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xCNMgkWa09fEzea1HqZoR7Nx7p6LXc3d3hq975HBBf8=;
 b=c2M3eULR4SrHEtadMH4w/oKeDoXpeGqfj8oQlSa03jFY7D95X1+aY1KEvQg7LwT8PUHrMt
 Ol44dyYQDgwhswErbn7izCNmqSg3OhD8ZtxbXS/gscBVDefX8P3VglApc90+MvrVnUkS8d
 6eBnY2VDXJlCw19yaTZixy94QcSAHno=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-495-9L93zUMuNBeB21iFykTg_Q-1; Mon, 02 Jan 2023 15:25:49 -0500
X-MC-Unique: 9L93zUMuNBeB21iFykTg_Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 n13-20020adfc60d000000b0029bdfcf52eeso311884wrg.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 12:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xCNMgkWa09fEzea1HqZoR7Nx7p6LXc3d3hq975HBBf8=;
 b=bjjiiGKUEuMiWxZfKT/ASeNW+jBAtVTb7ibuYeoi2kE/oa9aWjhRWk2ysI+l4uWLVJ
 3Dzp7tYE/nc6iQUccUa67kTO+neVqEwt3FW+dny83KQo5pp/keLiuEiDrsZfgFYGA9dA
 EL7txz15zJmW0cOoBRxtRo3BzzyUSYyEqO2EyP9WxD75BNPr/LShfBwWm+HN6QTtgWev
 3TvnvEcWU3PqDCCzC6RX/BBctlPSN/5rD726IIWDjZ0I6L+Rhlx6LTmLxfq8B8WVnMXv
 oFujapDVijTYf8Zn1m5l9ckMs7ZgRcfYQ6bJWapdsJeks57+cxb1cDARodiA80s6IMv/
 wkOQ==
X-Gm-Message-State: AFqh2kpwzfpQXZ/54XkENOCTu5PvDomt1deZyu+3mZC5FGGDJ3gzUY8y
 qySTdMT0aqUlGPMxzXde/vs+pPFeeS+boydqe2yrMzMXRHiwBea4vpk49chEo8CseAimPPjjfkU
 JWZKv0iwP294OP5VSkkpzbxh+83Oi
X-Received: by 2002:a05:600c:1c85:b0:3d3:4b18:27c6 with SMTP id
 k5-20020a05600c1c8500b003d34b1827c6mr29159456wms.11.1672691148001; 
 Mon, 02 Jan 2023 12:25:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXucLyQjV1JdUh/Oxhsrc63ax4d9VZwsRvpyJNghr8LaaYhJT1s03Mg1ltldjdSwypzvI/Jtqw==
X-Received: by 2002:a05:600c:1c85:b0:3d3:4b18:27c6 with SMTP id
 k5-20020a05600c1c8500b003d34b1827c6mr29159442wms.11.1672691147819; 
 Mon, 02 Jan 2023 12:25:47 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f18-20020a05600c4e9200b003d35c845cbbsm50061135wmq.21.2023.01.02.12.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 12:25:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/mipi-dsi: Fix mipi_dsi_dcs_write_seq() macro
 definition format
Date: Mon,  2 Jan 2023 21:25:41 +0100
Message-Id: <20230102202542.3494677-1-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 llvm@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>, dri-devel@lists.freedesktop.org,
 Tom Rix <trix@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change made using a `clang-format -i include/drm/drm_mipi_dsi.h` command.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- New patch in v2.

 include/drm/drm_mipi_dsi.h | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 20b21b577dea..e9d1e8a7fc7e 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -303,15 +303,18 @@ int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
  * @cmd: Command
  * @seq: buffer containing data to be transmitted
  */
-#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...) do {				\
-		static const u8 d[] = { cmd, seq };				\
-		struct device *dev = &dsi->dev;	\
-		int ret;						\
-		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
-		if (ret < 0) {						\
-			dev_err_ratelimited(dev, "sending command %#02x failed: %d\n", cmd, ret); \
-			return ret;						\
-		}						\
+#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...)                           \
+	do {                                                               \
+		static const u8 d[] = { cmd, seq };                        \
+		struct device *dev = &dsi->dev;                            \
+		int ret;                                                   \
+		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));    \
+		if (ret < 0) {                                             \
+			dev_err_ratelimited(                               \
+				dev, "sending command %#02x failed: %d\n", \
+				cmd, ret);                                 \
+			return ret;                                        \
+		}                                                          \
 	} while (0)
 
 /**
-- 
2.38.1

