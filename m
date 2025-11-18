Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A385C68AA1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 10:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D5310E475;
	Tue, 18 Nov 2025 09:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jZT7QUY3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD05410E475
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 09:57:16 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-29806bd47b5so33958335ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 01:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763459836; x=1764064636; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q6tZ5VzBoVYTTO+te69K4vXT1SJ3st9Rw22BJ6+xFwY=;
 b=jZT7QUY3bdnrfYkYKTiDSdiaYN/3osIcfy/F6Z+p6KJdDmRIZfzfhIKmCNpM43JmCS
 E8mHBMCTUKv2Nb+CQJ+jo/6grlYohbcwW6OKtF0cO7Y/WiV9EjZWT1pmuOOV1yvOVrFV
 s4YvBL7Wcvfqfw1Om05TL/MOxd7Rkbz20rJY6JDJZN+aNd+I7kVTTLKGGSqmg9qpYNdZ
 ncyboHpbg9zKEQVDExMC8lgXPe2yLN94Fqr02f/Ksykn/LvDu0vVZu4CxHxkYLGMfF73
 ZnsV1mAE83MEOdct7HzJPbOgSVfWvn9Xg3YuZ+cZCu/SVUBDRwMw6A+H4X2veB/gbdoz
 FF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763459836; x=1764064636;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q6tZ5VzBoVYTTO+te69K4vXT1SJ3st9Rw22BJ6+xFwY=;
 b=jDnPNMOcaw2reDJSvQpcRli9CSNcTqbq2uxlW0MJBuC6YKy+XeGDI64h9QWOIUwTv8
 QbBURo+fG864WTDHBEqYpmRCkksn5UDsSKBWUZJ+5QHAn9DawvVUzS6CNa4TMBW0Z/Ro
 T9ngcDZLFyCc8WWFbzunEMSCk79DZaMiOaHDwo4rsuuqXFFxxN8sVuRLlPG36r89Q9o3
 HrZb/RX2gp53H+UrZOO5PZI8YJwEyychw9/iGUhWKBXKVef1C8syksCYiW3x2SWuAj7F
 EKryr5zCWmjitYWB7AH0jXlg3jUC78hCnBZD70/T1dG08PYzwHeL5uZdl8zgvJ4H5mkI
 AkDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy7+9oEq8rFLcS+yOoAJS/MzspuXQaslgLPBAm3RyNwgajpEDPMO5gpjE1E+LkR7y7X7rNU/tNxrk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6o7MEzPn9GeAKPafz380FM/sRp19FdDvIPZSCvm8cfK7W/Z+I
 PBhG388wc5NaXbVQInUBFbkiEUuaac+HjlgFBRSKhajW/IrRLRG2bbiD
X-Gm-Gg: ASbGncvqDkp1n6oV0S+wPzi8aIv5JV0ypzKVToVTSMxClu3DO+mEqFrPR6MWe97HtXy
 4M+KtGpa9/fQrDPqELGmAMsQ3S8e3n2wSK2pH6TyZBdXtNab0xtAdkqfR8EPCmMpd//lnQeZnGP
 0J9ylhx47VYZ3XTS1bbvzzelUstEej5lxzzs6TEC7kqADf48AGWU6TtFqApTWAIKCuMNJokxjpM
 XE9MZet2oA6oAnieS1HIH+Za1UNgFxmir3ZAiYI/Zh0G/pwz8Dz28WozoHd9ZcJzIHL5m5r7dRP
 qACLHioaHdG/nO9rKJIiMSjPY7EZyUPvIDHNqqDBLUzoDlz6OKjquJB/qKhYdaW7O2wdKw8rb98
 03Ugd5kKjqwcp9ZGLHLAAwlYWs6pQRvAeqfFcgv40jyabb8QoiYnK3JsskWncBUrnOoY8eVJA
X-Google-Smtp-Source: AGHT+IHMmjMJMqz3ygPywtDFWliHJnZbTS7XL1ZWr8wjn2DCGXdd4NPyybAvK2X81ZXZ3yNMXbed1g==
X-Received: by 2002:a17:903:198b:b0:295:82b4:216a with SMTP id
 d9443c01a7336-2986a76a1d4mr172192395ad.55.1763459836197; 
 Tue, 18 Nov 2025 01:57:16 -0800 (PST)
Received: from hsukr3.. ([2405:201:d019:4042:80a6:7dd7:b597:d951])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2ccafesm168572415ad.97.2025.11.18.01.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 01:57:15 -0800 (PST)
From: Sukrut Heroorkar <hsukrut3@gmail.com>
To: Helge Deller <deller@gmx.de>, Sukrut Heroorkar <hsukrut3@gmail.com>,
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
 linux-kernel@vger.kernel.org (open list)
Cc: shuah@kernel.org,
	david.hunter.linux@gmail.com
Subject: [PATCH] fbdev: q40fb: request memory region
Date: Tue, 18 Nov 2025 15:26:55 +0530
Message-ID: <20251118095700.393474-1-hsukrut3@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The q40fb driver uses a fixed physical address but never reserves
the corresponding I/O region. Reserve the range  as suggested in
Documentation/gpu/todo.rst ("Request memory regions in all fbdev drivers").

No functional change beyond claming the resource. This change is compile
tested only.

Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
---
 drivers/video/fbdev/q40fb.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/video/fbdev/q40fb.c b/drivers/video/fbdev/q40fb.c
index 1ff8fa176124..935260326c6f 100644
--- a/drivers/video/fbdev/q40fb.c
+++ b/drivers/video/fbdev/q40fb.c
@@ -101,6 +101,12 @@ static int q40fb_probe(struct platform_device *dev)
 	info->par = NULL;
 	info->screen_base = (char *) q40fb_fix.smem_start;
 
+	if (!request_mem_region(q40fb_fix.smem_start, q40fb_fix.smem_len,
+				"q40fb")) {
+		dev_err(&dev->dev, "cannot reserve video memory at 0x%lx\n",
+			q40fb_fix.smem_start);
+	}
+
 	if (fb_alloc_cmap(&info->cmap, 256, 0) < 0) {
 		framebuffer_release(info);
 		return -ENOMEM;
@@ -144,6 +150,7 @@ static int __init q40fb_init(void)
 		if (ret)
 			platform_driver_unregister(&q40fb_driver);
 	}
+
 	return ret;
 }
 
-- 
2.43.0

