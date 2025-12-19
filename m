Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785BDCCE90F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 06:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED7A10ED48;
	Fri, 19 Dec 2025 05:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OQkcn+Lz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9407310EC52
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 05:43:49 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2a12ed4d205so12401405ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 21:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766123029; x=1766727829; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GyhsaHMpowAoVL5AwJvNjQeVURBtbaVBE0KV9gHYSKY=;
 b=OQkcn+LzJNBshR6Z/AK5AqzJI6Fqb0Y/2NwPZaOkQqHNEpY7vPRRdDfnT/8wdTb8Zy
 vWVJauT1CyrGZvkqHgXqROCObQt8xSlwXH9ukIzQzypc/8vZRDftZ09/ix8r/rZ+sBQV
 Pn8ZtpEjhGVe70jlehC75N9HGR9PKlP3Nt11wMhXd2Ap9KULN55m14W1MePE8dWhxl0+
 jP5bbtblIkhG4WLf00zZJ0cRa9QK15xSg/BUT9fUcHfKt01KghQ2DsBMesHl6ESggWcy
 i/SIF+5T/AvSosAsUWKycGs19nk7jgJaDeVdimG0YCpk5/9TeeY3fx55ag2D0LAX+gz+
 MNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766123029; x=1766727829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GyhsaHMpowAoVL5AwJvNjQeVURBtbaVBE0KV9gHYSKY=;
 b=njQp5qY2+5JMqif7FlpKn3YSJN6Z4FQzcysWU/HAQaPngoAUHfWXt5+4d+wtzvTGOF
 jrGLp4/wmPx+XyrSEN7yKpsQnsFajvs951w1I6WZfNJxeNLN63DPT485EULAaf3+GdiX
 OfIy06b0sooIgXFQwxhWh0bGnGYFHR0cGk4bvxkMDUpT7tdzSIf/cUHBW6dgcAZgt6aH
 zBkEIEl320dev2Y1mLzWnjMoxduwhTNasQkTDnO5/HlL7hfoccquySmuMGE37fnnG58y
 VdlFe6S8aZalquLjE9oRDto0KURZKJIOZFqGvT01YDztv8ckateABUAo0QsyvgMFBCh8
 UMFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF3dotJeSlyjM4dxGj67j2nS8TgwcSI53qrsszKfVc6WRhvcwwsYlRr/0LpIaztq9F66eDN6CZoN4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywrt0WF6vEubiueOqRp6n4YbLGLap9XOUaCKDb6YLNqQq326Fez
 L5wPCSiMqpPUzt+yhNFSN0RRqjreFbN8/Q7zimMrxZ2Zsa/yU/2jwtcG
X-Gm-Gg: AY/fxX52dtkpSSk9VRWkfFgJ2gVEWuMmIuFEKDZdGoESkKaxoAO0LlT5IkPq/o/vCGP
 MDvZfOrtwUbAyLkyGqUTHVzNfn1PEKSUooHr1iOJvgEwO/S2mYOkZ8d24IJjeCUGTqlqrTN3cIX
 1oc5JXLkgrtdNzO5DtTc/C9SPIxvcbdfIuqX4Z34Bz9ysRcqkMSI8ToC1Fzygq53wCPscae7bfF
 HR/OoTybBgbE1foTLzu/d0MAORrUw6m0WMLgWtzx/DW7BH4R5V+KwjP/BbF9j3DN9m9mAiQWqID
 hXW/CohZy6QThgukVUhse0K6+55Kwt2jB2WuctvIMJsKwg4vCnUmVO8GnwiBz8wWLREXlGotXaL
 4S2J6GrTRHZx9V3tnJRXFzk4Mf1Wl7tR4zK0pitHnGSJLRnBl2F5Wq/2KA/QNhFTV6IHkG1+uR0
 h7g9vFpg/+Bn/osPgXmY14nJ1pLlu1OEefcKCH8r3wy/Q=
X-Google-Smtp-Source: AGHT+IHXEchSi8iM+Y5+MS3Ww91XngpXuQu21mxZ8hWmVfsLgeWot8cDnyt6+QWma8zqSPX6kmHH4g==
X-Received: by 2002:a17:902:f68f:b0:29f:1fad:8e56 with SMTP id
 d9443c01a7336-2a2f22049acmr15569505ad.6.1766123029021; 
 Thu, 18 Dec 2025 21:43:49 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:5160:2cad:cf88:afa5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3da7dabsm9878955ad.25.2025.12.18.21.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 21:43:48 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v2 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency
 optional
Date: Thu, 18 Dec 2025 21:43:19 -0800
Message-ID: <20251219054320.447281-5-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219054320.447281-1-chintanlike@gmail.com>
References: <20251219054320.447281-1-chintanlike@gmail.com>
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

The sh_mobile_lcdc driver exposes overlay configuration via sysfs, but the
core driver does not require CONFIG_FB_DEVICE.

Make sysfs support optional by defining overlay_sysfs_groups as NULL when
FB_DEVICE is disabled. The driver always sets .dev_groups, and the kernel
naturally skips NULL attribute groups while the code remains buildable
and type-checked.

v2:
- Replace CONFIG_FB_DEVICE ifdefs with NULL overlay_sysfs_groups
- Always populate .dev_groups

Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index dd950e4ab5ce..704c17ad241e 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1350,7 +1350,16 @@ static struct attribute *overlay_sysfs_attrs[] = {
 	&dev_attr_overlay_rop3.attr,
 	NULL,
 };
+
+#ifdef CONFIG_FB_DEVICE
 ATTRIBUTE_GROUPS(overlay_sysfs);
+#else
+/*
+ * When CONFIG_FB_DEVICE is disabled, define overlay_sysfs_groups as NULL.
+ * The compiler will optimize out the sysfs code paths when dev_groups is NULL.
+ */
+static const struct attribute_group *overlay_sysfs_groups[] = { NULL };
+#endif
 
 static const struct fb_fix_screeninfo sh_mobile_lcdc_overlay_fix  = {
 	.id =		"SH Mobile LCDC",
-- 
2.43.0

