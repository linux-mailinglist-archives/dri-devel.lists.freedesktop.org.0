Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85082818ABE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 16:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7AA10E4CB;
	Tue, 19 Dec 2023 15:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2126210E4C2;
 Tue, 19 Dec 2023 15:03:22 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c2db2ee28so58607525e9.2; 
 Tue, 19 Dec 2023 07:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702998200; x=1703603000; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j+2uydkqP7/GP5xpG18IqG/AnXLR2V5zI/Eof83ojXM=;
 b=LqmC1MtbZMXcAIu9FC9Pfjiz1FAkxwH9lSxwtUQkHbCGF7xB1M/zCJ9zhRmG/Qh0bG
 pJijtJrXmQwGEbpeX95hWiYNCYc7/Iup1O0oG4C+UfzOiDcOiWfz2cJQQVdk1Pl0jtcn
 8Z+DAIi/r3j16zqfsaIxxz4LXv0t39dVGjaXlwPx/gYkCOQLU0Szsr8Qel75NYrJ0jgV
 cQcbgTd/sMz5a3cz5eM8piKXaemp/2gbCEI4v2j6LITOwymE28NRVHTfR/4ahb2qE/Rg
 GmdBw+eN9dtgWTs8NKVPUAN1nXTpD5Hblp0Ew/rVkXJBbB0yCh/asA1XIZ6DQ+k3SxnU
 YLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702998200; x=1703603000;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j+2uydkqP7/GP5xpG18IqG/AnXLR2V5zI/Eof83ojXM=;
 b=J6JV+rNV6i2ubPilBXqIwqBv4uSnOVFD515vl14C4xO+a7yRldNlKvuWs1cY/qdXal
 xqfsoUO/sEki5AGrs7mXZ62gOb/oaNfS1drwZaViWd2ZeIFrouWlJoR7HKoGElw/5t1u
 5ezkUoCWrKj7XRV+zbBVMu5VrCRtrSi+rChd1OSpliwZ6OMyIxtRfAjGCYhfrDYeqxM/
 LKISIA9T5vyo5ALr4GFSj2dzhv1OfNFVvKMkJJ33uPmO+haExu0TD15tUcge2kaIL+Sd
 1O+te9Qter7wa0oPem+tfxqoYCYqUSKaZxGqq9xDLpzYkXBIvQwC2kt+9ROe8rYukMPy
 AVIA==
X-Gm-Message-State: AOJu0Yzx20lDTPbvoP6gyeEEz4ROrCflMmhimc0TQFFNYBQbnLpxR24G
 Ns13fkxyThysLdNhpat40KsFukIBCfVXwA==
X-Google-Smtp-Source: AGHT+IGxnNsXzTz9OUKp2xip5KTPq0mzABVaftCPhQeLID8u1htUaLAIfs8yDDd4UNZQPtmE2nIdMQ==
X-Received: by 2002:a05:600c:46c6:b0:40c:2ba6:809 with SMTP id
 q6-20020a05600c46c600b0040c2ba60809mr10002784wmo.157.1702998200183; 
 Tue, 19 Dec 2023 07:03:20 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c4f8700b0040b45282f88sm3190226wmq.36.2023.12.19.07.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 07:03:19 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/therm: remove redundant duty == target check
Date: Tue, 19 Dec 2023 15:03:18 +0000
Message-Id: <20231219150318.368398-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The check for duty == target is always false because it is in an if block
where duty != target. A previous change added the duty != target check
and so the check duty == target check is now redundant and can be removed.
Cleans up a cppcheck warning:

drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c:93:17: warning: Opposite
inner 'if' condition leads to a dead code block. [oppositeInnerCondition]

Fixes: e4311ee51d1e ("drm/nouveau/therm: remove ineffective workarounds for alarm bugs")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c
index f8fa43c8a7d2..c4aaf7473065 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c
@@ -90,8 +90,6 @@ nvkm_fan_update(struct nvkm_fan *fan, bool immediate, int target)
 
 		if (duty > target)
 			delay = slow_down_period;
-		else if (duty == target)
-			delay = min(bump_period, slow_down_period) ;
 		else
 			delay = bump_period;
 
-- 
2.39.2

