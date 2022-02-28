Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C174C775B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 19:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39BF10E268;
	Mon, 28 Feb 2022 18:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB03710E268
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 18:14:43 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b5so16842809wrr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 10:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=laSnQJpbry/7HDfeFASKUPW4HYc9KBwUxVn9S4td0qc=;
 b=c0WRI4mazSMxTdg2exnk+Q3pEXI74oiHYivOcAxyKozC7Y4/wrofRWWnCvtaPZhGxR
 IhujeWQfFo00DEXYokFGtCEV1Nn/dkAzptGSD5IEwXwkYfvy1qfoB3e94L+04fLU12+3
 pcpQ7uF/jzshj84kJryjM8O1p3msTMRKDo8oU509HnrI67clNXOfUUBLIc4+upY8iJaR
 lijHIn+cImvx6w0OH/8X7tgsuHtgADaACEwj7KzCQe1+ShF5wzUkQf1V0VpMSUNCbwen
 iJRaVoijltE0Hg7tQ28uZOYG9wwLUfhgUw87xdeEs/IH4v0p+SOczJhRr0p1Uu2joV3V
 27AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=laSnQJpbry/7HDfeFASKUPW4HYc9KBwUxVn9S4td0qc=;
 b=ECmmqUoP3IwCZN6TgESeIH4frsbW37GGuAfLTAylpTAzdCQ5OnuSp3rF8apxTzLjII
 neLXrlCgLJPKrSLHvyizQh/mnEEFcmyHJ+9A9OVcX+Q/kmuHcCKZwOJpSlTRB4ty02II
 xhHLDyBd90jfu1wC8jrF61KCTKma6RXv15pe6jNMKsjVk+1+OfVWmJtY1jncsYQFn7u0
 a2mzZfgH+2d16YPXqNxJRuBIbrXXQPn9u9ex+c5yWt77wFirUqt0oETOiBcwuzVA6ysW
 sJIhG/zi2WqOWPTwpT0/X2FNghghlmQgKJbACA6wQuvfAfEQ0aXbvoY7WWnu2ASvITy1
 XvZQ==
X-Gm-Message-State: AOAM5339sJkZGkXG3I2vFCRgeMH3wNWGzZeyQUNDAYR9PPCPJ/WH+lin
 D8Tk5mGIo9TQmrvHKVu8nwI=
X-Google-Smtp-Source: ABdhPJyhltbPdhysi/wISTmoSAx5kNxmU7sMGyLPJmQFUN5FgbPAW2+eU+jUkbBOfunmlYPPW6hcbw==
X-Received: by 2002:a5d:648f:0:b0:1e9:5445:4b13 with SMTP id
 o15-20020a5d648f000000b001e954454b13mr16540343wri.127.1646072082307; 
 Mon, 28 Feb 2022 10:14:42 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net.
 [86.58.32.107]) by smtp.gmail.com with ESMTPSA id
 z2-20020a056000110200b001e7140ddb44sm10780677wrw.49.2022.02.28.10.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:14:41 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH] drm/sun4i: mixer: Fix P010 and P210 format numbers
Date: Mon, 28 Feb 2022 19:14:36 +0100
Message-Id: <20220228181436.1424550-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: samuel@sholland.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It turns out that DE3 manual has inverted YUV and YVU format numbers for
P010 and P210. Invert them.

This was tested by playing video decoded to P010 and additionally
confirmed by looking at BSP driver source.

Fixes: 169ca4b38932 ("drm/sun4i: Add separate DE3 VI layer formats")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 145833a9d82d..5b3fbee18671 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -111,10 +111,10 @@
 /* format 13 is semi-planar YUV411 VUVU */
 #define SUN8I_MIXER_FBFMT_YUV411	14
 /* format 15 doesn't exist */
-/* format 16 is P010 YVU */
-#define SUN8I_MIXER_FBFMT_P010_YUV	17
-/* format 18 is P210 YVU */
-#define SUN8I_MIXER_FBFMT_P210_YUV	19
+#define SUN8I_MIXER_FBFMT_P010_YUV	16
+/* format 17 is P010 YVU */
+#define SUN8I_MIXER_FBFMT_P210_YUV	18
+/* format 19 is P210 YVU */
 /* format 20 is packed YVU444 10-bit */
 /* format 21 is packed YUV444 10-bit */
 
-- 
2.35.1

