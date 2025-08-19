Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59004B2C2F2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE3210E5C6;
	Tue, 19 Aug 2025 12:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="frqyxjTT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B85E10E5C4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:16:54 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-afcb7acfde3so730530466b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605812; x=1756210612; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
 b=frqyxjTTSDT9R/snisy5heFU350/Nj+TPjiyqDYsenMjaXtJMWaoa0WTgRxmYrvp53
 xZnT7NfwqX/rWZfWu+rlXeDPe2/o3oPomq1/Kdw3fOCir+VONNKDOtRLC3/YnhJvJ7Ey
 DgT/ioekwgYzGhndpmbneAR0mRJQ6TsEO3CIQ4J/d77beg8UK/rXC5BDukuC+0KFCOCD
 IORQHNY6aUO066el0EnnnmThk1YdtJwhnp5OPmsZsoGuZe69Md5NkpW89nbqQg6f6nMc
 im46ae9gx6kAuMCtcjHUGY6hU+C9c4m/iawnjNOb+mrwtm/GRiao6FaYnivXYNCE70zG
 LgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605812; x=1756210612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
 b=uOQfSaGSHBqse/b4c95Uy/MQqfpiFonVBOLkJVoW7KWP6Q9CkewabIcb8mV5sUXk2a
 687Uj3JFkUe4gVUg7PPa4Co0NlxypN4R2y/67E8JbxoKkvfvtC/InCvWjWezDj9j7l0J
 x6Q5DtsgFgehm6bWF84RiXrHD1vH5D4OJco+JwlQXf8vA7P9h95NWS8k2u5XjsEE0TC3
 lz92AUJT6C78RRbRIFyzbXxVk+vyhpIWDFuhnbbFkPGLQDeDFr8iZwRtbQXMIL1epaEx
 sGN+eSVtXQlel+YAOWzr3fXR2DK91BVt05bQw79vxmZuM+IyFhLDxeFmeX/MS/Ja/UUL
 Cwhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu4P4pReJsWSb43vk4r+xvxjuzAX9iL9M6Ko4Ug+vkcS0MVRO5Eh7o0lgiaizcAEq401kJvBoL19Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQy/tDymeUoLuOP4EprO+cwz5Sv5AEY1BLZmKAeJn8bxp/1GYU
 Zs99jKUyNFbcXWVCwU0ErCDZ7fJrT3LXb7WKaWw8S8jSzL8zXL9uZm9pKGVzBA==
X-Gm-Gg: ASbGncuiQPoXs/OJrbO6DW3t6T8NyrE8DnnSzR96uzlwV5IgN+lxYkuRSI22EWJZlHe
 EoUGC9rlxr/19iwp+cF8SmKsGV+Mb4Rs+H+qTtIfKRnNYA4sVJHPjyrq5KVYhBzgRzME7+JrlMs
 SVLS0ckhnwwr9TQb+5rsQ2pF2olPlyk/p/aQKQ0VZNG+A7tIxYLVu+9ZM52ANc7VgI6gdBjODA/
 S/4VxE3F9jYLvwXi+uVO+FfQakRMeCdua/psIWTsG85YUiLR4dvwCYSC+DlsAui0lQ14Gl82Z71
 8JBhE7OA/M2bKyVjw91vTpnXwXtnrNRc/SQhPh0ZThYyznmHzWODWoyD9PrF/FMVq9aXjExAxIc
 YH61/PaLUhzbW0A==
X-Google-Smtp-Source: AGHT+IHy3F/e1kSRDlbofyboq4p2pglFSUtVJLGVczC1I6BCAnBxgMTYMS6YyE/2e4b1RIBWu7NZlA==
X-Received: by 2002:a17:906:c113:b0:afc:d5a3:90c1 with SMTP id
 a640c23a62f3a-afddd21a8c1mr208971666b.55.1755605812119; 
 Tue, 19 Aug 2025 05:16:52 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:16:51 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v1 06/19] staging: media: tegra-video: csi: move CSI helpers
 to header
Date: Tue, 19 Aug 2025 15:16:18 +0300
Message-ID: <20250819121631.84280-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move CSI helpers into the header for easier access from SoC-specific video
driver parts.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 11 -----------
 drivers/staging/media/tegra-video/csi.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 604185c00a1a..74c92db1032f 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -20,17 +20,6 @@
 
 #define MHZ			1000000
 
-static inline struct tegra_csi *
-host1x_client_to_csi(struct host1x_client *client)
-{
-	return container_of(client, struct tegra_csi, client);
-}
-
-static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
-{
-	return container_of(subdev, struct tegra_csi_channel, subdev);
-}
-
 /*
  * CSI is a separate subdevice which has 6 source pads to generate
  * test pattern. CSI subdevice pad ops are used only for TPG and
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3e6e5ee1bb1e..3ed2dbc73ce9 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -151,6 +151,16 @@ struct tegra_csi {
 	struct list_head csi_chans;
 };
 
+static inline struct tegra_csi *host1x_client_to_csi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_csi, client);
+}
+
+static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_csi_channel, subdev);
+}
+
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				u8 csi_port_num,
-- 
2.48.1

