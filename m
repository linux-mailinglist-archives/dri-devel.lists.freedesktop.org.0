Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CD97F3AEB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 01:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7925510E5C7;
	Wed, 22 Nov 2023 00:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2329210E5C7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 00:58:02 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-679dd3055faso14099186d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 16:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700614681; x=1701219481; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MFz25rhV/tQYJ/usJamHobIxJPBWkC1P9QKNu6+n9H0=;
 b=B4VFMTe9dHrNQF6flFiBg8DPUr1PMJvlal71VsFMglxLbxP2K2jK6p2fQirxrZQvlE
 xMcfp658v8HM/mPZ1k8WBOuk0IhFgVRdNMKDAmXoAdeZo18/eQqFGMpy0wKzU3BZhCRj
 zU1MVVnnZYk+KrBi5SEyIol5OsriJTvOQk3//RUNm5dz+Djsb11RDybq9m0uzKJWjvdG
 MweXAHRpSMiRJZrFWTF7sbGzseU6199V03l+GGVAaGii7/ufbLHwMNxd7+1UWuwzy226
 otQLQqZZbf9ePZkikM3TMtU6yx6e6aoCnZHJTM3RoJBb7S6N5YpIK9ENteRGzlYQN/0T
 dJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700614681; x=1701219481;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MFz25rhV/tQYJ/usJamHobIxJPBWkC1P9QKNu6+n9H0=;
 b=kC/fN4xe4lFavxMKNm3WFv8kDiF20elbbJqNXZshP7KY3Va5QmltwKznGUi4JcEDT3
 TzIhbGI41MifvUhjMorVBY6xw8foO+iD9LZ9nKGoDwQsJxqPBEQ+PZDOtpCEjAT41STb
 rV4+81rMJoYH9ZEHet8UruunkmXTqKL3j6lcwqf7TcxHOehNrILmGY49REt6aLugCqto
 dAO4v74tk5Am13wtAHFsSGcZcM0P86Jj95Xp8uVpQt/Kq24pyoxqcYDIBreuWcsR/YXB
 dt57aPJ3KweMpgHp6c2/1Uuv1FKaFHvgp2WGBSsBBgNQaAdgWSsIJ4MEylsXpxV92y01
 YCew==
X-Gm-Message-State: AOJu0Yyi9RBQqdwie6FcW8qpYFrapilp6ikUs3tPsryjyNtiD+cDvjGR
 F84J8IeKFrIUqAyix+SzqaaOiMOJqBBHKg==
X-Google-Smtp-Source: AGHT+IHK5zmXtx2CrzmRrXrePJ8VaQvJ/bDCoqi8nx/Atu1M6AvENNujwhGE+whhP3wVQywcUytgug==
X-Received: by 2002:a05:6214:c41:b0:66d:12b5:68c1 with SMTP id
 r1-20020a0562140c4100b0066d12b568c1mr923386qvj.59.1700614681132; 
 Tue, 21 Nov 2023 16:58:01 -0800 (PST)
Received: from localhost ([2607:fea8:529e:7800::80ec])
 by smtp.gmail.com with ESMTPSA id
 j2-20020ad453a2000000b0066d32666a20sm4427293qvv.71.2023.11.21.16.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 16:58:00 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>,
 Thierry Reding <treding@nvidia.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev/simplefb: Suppress error on missing power domains
Date: Tue, 21 Nov 2023 19:54:59 -0500
Message-ID: <20231122005457.330066-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Richard Acayan <mailingradian@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the power domains are missing, the call to of_count_phandle_with_args
fails with -ENOENT. The power domains are not required and there are
some device trees that do not specify them. Suppress this error to fix
devices without power domains attached to simplefb.

Fixes: 92a511a568e4 ("fbdev/simplefb: Add support for generic power-domains")
Closes: https://lore.kernel.org/linux-fbdev/ZVwFNfkqjrvhFHM0@radian
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/video/fbdev/simplefb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index fe682af63827..6f58ee276ad1 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -466,6 +466,10 @@ static int simplefb_attach_genpds(struct simplefb_par *par,
 	err = of_count_phandle_with_args(dev->of_node, "power-domains",
 					 "#power-domain-cells");
 	if (err < 0) {
+		/* Nothing wrong if optional PDs are missing */
+		if (err == -ENOENT)
+			return 0;
+
 		dev_info(dev, "failed to parse power-domains: %d\n", err);
 		return err;
 	}
-- 
2.43.0

