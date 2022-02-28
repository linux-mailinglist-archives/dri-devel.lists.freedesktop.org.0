Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D918F4C64A9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 09:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3427A10E25F;
	Mon, 28 Feb 2022 08:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC7C10E25F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 08:14:34 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id t14so7823293pgr.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 00:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=doltg0EIdSmNoZq27I75wxyAPlbzp0xcc8dv/Y7u+Cs=;
 b=YVxznTg/QjH9avE6lNR58bU4o+IWvD7DMsflx4uThJnOdGu3gJJifvXzI0o4OJTMKV
 +jX4LVGqldDimvl1C0XwItBA29LxmVHpQgMdnAZDuDMEut/03b8+Hz2rvfVAsp8oeUIU
 AbMR9Nm5ZzHZVjBuXHlajocZpFo79QwIRz9zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=doltg0EIdSmNoZq27I75wxyAPlbzp0xcc8dv/Y7u+Cs=;
 b=RM7pVzHWQqNhs/1ORHcvkku3LPJf7F6zA3kaim6BCBMeCNOKErddw4nhzrVbm94Hnh
 YMaZ1U6qMyth+WHu4VCsBID9TKUb3w1wcG/TTaWoR3ePqtnn3zsIHmBKxXjg9WoabYvr
 vOLE6tNDqW3My0YzdUWkCTCw9VCryO1dWHo7Po6l7atTWIHcGwK+Nye+7SvjLvlKB1ZG
 HQMrcTH7vksmmSGLAQr0sPUkvR5F+hXwtjVMd9P3ogghH/9cIFW+Sc9XJHTujyzn4Ntr
 MWnUdw+2G6ftrwT4Ldkq0PgGjW3lzXZ4GBSqnAS5/mnNE5ZMp3WFIao4z/Wv5bUdhaTP
 MfWQ==
X-Gm-Message-State: AOAM532BgWt4bmPreD5s68Zt1DnXawpIgnb9VRquRLhU076Xd2kf7ARl
 NREeWH4KNtk9ErO1bZ8vhWHWF8Mk2WDfEA==
X-Google-Smtp-Source: ABdhPJyl4BNj7TAs4Wq0y8meXmnSMvgG6Exp0ChLB6bFKf5z2wkAWTaodGZsJTBYA6Oe1U9DGzHZJw==
X-Received: by 2002:a62:3383:0:b0:4f3:c157:8898 with SMTP id
 z125-20020a623383000000b004f3c1578898mr19008754pfz.14.1646036073887; 
 Mon, 28 Feb 2022 00:14:33 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e717:c093:114f:b510])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a056a000a8200b004f1111c66afsm12299576pfl.148.2022.02.28.00.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 00:14:33 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>,
 Allen Chen <allen.chen@ite.com.tw>
Subject: [PATCH] drm/bridge: it6505: Fix the read buffer array bound
Date: Mon, 28 Feb 2022 16:14:21 +0800
Message-Id: <20220228081421.1504213-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.1.574.g5d30c73bfb-goog
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hermes Wu <hermes.wu@ite.com.tw>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The size of read_buf is READ_BUFFER_SIZE (200), so we can't access it
with read_buf + PAGE_SIZE (4096). Extend the READ_BUFFER_SIZE to 400 and
set the end position to read_buf + READ_BUFFER_SIZE.

Fixes: b5c84a9edcd418 ("drm/bridge: add it6505 driver")
Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index fb16a176822d81..f2f101220ade94 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -289,7 +289,7 @@
 #define WORD_LENGTH_20BIT 2
 #define WORD_LENGTH_24BIT 3
 #define DEBUGFS_DIR_NAME "it6505-debugfs"
-#define READ_BUFFER_SIZE 200
+#define READ_BUFFER_SIZE 400
 
 /* Vendor option */
 #define HDCP_DESIRED 1
@@ -3074,7 +3074,7 @@ static ssize_t receive_timing_debugfs_show(struct file *file, char __user *buf,
 	struct it6505 *it6505 = file->private_data;
 	struct drm_display_mode *vid = &it6505->video_info;
 	u8 read_buf[READ_BUFFER_SIZE];
-	u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
+	u8 *str = read_buf, *end = read_buf + READ_BUFFER_SIZE;
 	ssize_t ret, count;
 
 	if (!it6505)
-- 
2.35.1.574.g5d30c73bfb-goog

