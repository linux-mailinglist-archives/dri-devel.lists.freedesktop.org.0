Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8CD9B51D5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 19:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB27610E3A5;
	Tue, 29 Oct 2024 18:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZtqCmII0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8906710E3A5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 18:30:45 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-37d538fe5f2so4301876f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 11:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730226644; x=1730831444; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6tchzCWGrJlSX3rW/FyPve/w/cSyAJic1zkZ2Qkuh9o=;
 b=ZtqCmII0AygrcsGqP8HnJC0Z/PUOUl3qXv+6EK+qzNc/clNVjhSLvRsMXpxZ2iRFeC
 oqY/l1taz8f1m/ub0zmK5k2kKOkf+6inp1kAaqaZeQC980zlddwmztUBuMzehnycV5+K
 9/zzqpH11iqObTAxKgOqa74RTGK8asTh7aSyng5hrRZDjGMtBWp41NP8SPeJJBsLpq5U
 sZNt8ZgYPoEnjYWFit1EeDDEwTCrHmsPgHkCfysDu2Y7K1HMqw6mGQJqYShSPPigwug2
 cO2fwCTeVcmNIrkIeCgy0r2QhroPSQnce11DfCB6mizc+wesNKJlVukWd8W9zZHxE02q
 wSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730226644; x=1730831444;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6tchzCWGrJlSX3rW/FyPve/w/cSyAJic1zkZ2Qkuh9o=;
 b=eLBSohmxQYzt4BXAcPL7V1PnU745DzZDGMQhre7eshaAAZQ3kBSGDTeXr5IJFaSz3Z
 JXaInAS0la16wv7TY+xKmQWYoiV86HJyeFxlVfWsfO4/TI9WfkAyOLszL6/80rHPsbQG
 av7GHzzb/0i+mJXUPnvqiPeyxTwsC0/rgH6XkkqlSwPfnWhU5HqaowfyrpCJKhc+lxN2
 XUkA/SsAJPnjGA1QfCM1/Ba9Vx7OCGsKGirFWu2T1urSwwBb5hGgIpTTfAcmgz0O+SGU
 HwYPVaf3DAalojGCPf/ELHbyw5hQwL+plSQjOpFStNqkQ0OKjmT/HLcT5W20iFtqI1fW
 nbJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMXoOzP1h7Wj8gXuBquvBwZT987PJ1tRFwAGC8rpYMu2i37YruBxOyAbaMyqni/e5Dsn/m6sehCzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvcfsVSE689+s7aDFuqlKBJf6r8CghYnj8nC/hSINH9MSBnk52
 EWna549RGxVzCW5xiQx74dV7Y7y3E2QWn0DmxOSWlOFH66iPEZ/j
X-Google-Smtp-Source: AGHT+IHT1npegBHS1gJiTwoB1Yq4A9pNPGgqdHqSHieML//oJyPhcNNxGrIiMxMWbjPVZkn6vVz8NA==
X-Received: by 2002:a5d:4f04:0:b0:37e:d965:4e1e with SMTP id
 ffacd0b85a97d-380611ee9ccmr9645279f8f.42.1730226643592; 
 Tue, 29 Oct 2024 11:30:43 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b91d36sm13181811f8f.95.2024.10.29.11.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 11:30:43 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alain Volmat <alain.volmat@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: add Raphael Gallais-Pou to DRM/STi maintainers
Date: Tue, 29 Oct 2024 19:30:41 +0100
Message-ID: <20241029183041.137414-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.47.0
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

Add myself as a maintainer for STi driver changes.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 71b739b40921..0e583aae590a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7477,6 +7477,7 @@ F:	drivers/gpu/drm/rockchip/
 
 DRM DRIVERS FOR STI
 M:	Alain Volmat <alain.volmat@foss.st.com>
+M:	Raphael Gallais-Pou <rgallaispou@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.45.2

