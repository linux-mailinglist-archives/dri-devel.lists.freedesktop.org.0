Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E61B910249
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 13:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880F410E91E;
	Thu, 20 Jun 2024 11:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="EPqct4Pm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f99.google.com (mail-ed1-f99.google.com
 [209.85.208.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3892B10E92C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 11:14:07 +0000 (UTC)
Received: by mail-ed1-f99.google.com with SMTP id
 4fb4d7f45d1cf-57d044aa5beso729265a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 04:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718882045; x=1719486845;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v/0BVXWlmNwDbeApY8MBLZ4tYisiCMGIpsfW35i2wow=;
 b=EPqct4Pm6ApTqJG0s8lMd46wiQEYLp0f1eTW1HxOCCYzOBPq9iZpKr1UF9NxFM4Jsz
 I9sfQin2KwrJwBmTDRmgZw0dMSv1DIgdkZC9UUm1RfJclflQgJYdim1cX6Q49f9CKTr4
 DTpEqF+2r+fVa99LOa7JDrCdVg/DzdLKtuFXfXExsIa3q8yqi/vThoOjiPiIdnvs20fT
 rinuSitnRw3DwKqb6f0QTwvXlhiWMEKxjC2qYQBG9CdBcwJypZnYSh/bY9X1l3e8RTRB
 SBP6ePbX8LZJ2KjsOKiOTmC7K3RqtlsuJgHEuC4TyFM9dPfMXc/v6vD0suYQ/1xhkaHv
 jtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718882045; x=1719486845;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v/0BVXWlmNwDbeApY8MBLZ4tYisiCMGIpsfW35i2wow=;
 b=G3cccd4I9mezrQ7y8A8we9OEVW8U084gDc10m0baJdZt33Aln9v8lSpDkHvZujJa0R
 O/V1obub+RnEQW8nU0HsPz6OPpKrBGoSnJ1f4hHdYZL3Yppzi4om0xJFky3Y4RPxY6cb
 HcnDUObR1MQMUZOzKIK0zwlYfiSjS0YjeCsaocuCFKtRWWuC3jS/aHXNr08uPjbCqM/D
 hv8fDcrPbM6TAbE7DCWecFKtb7/oEF9LD4iJaUpYbdCxfCtMpFu5F21sxNPbv6yjMOZc
 b416Lcqq7DS9AdlbgBxekMGwHpTTUy/yele/4F0FSSsEtL2FFnEtFeR816oeucwtLgel
 rMtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVADJBj97s9lX2ZZYew4k7ZO14emo6jW54hYRS0GpETbPEP6VbzaGdzWHbWqK+Ktofq+acqu3XDybWLBEGcitawdN44WLhRVbtwPx0Yq1aj
X-Gm-Message-State: AOJu0YyX+cqewEHgwBx9BasH1XFiA2oonxIBIWwhc9oD5jNwvGPlgIAy
 awi108dqMbqRy+b4yqwtXUTzYu3Grp1+VUMElxfqQPzQ8+yGsZIa+5sbHXqKWC+S2IluG/jv7os
 gy0Kqmc+Gf+JWIFxAntilpiEww6rGzd4t
X-Google-Smtp-Source: AGHT+IGEJrHyXbcjqf42j4ZlPly5jmkt8epf8BaOBlxMXtPID8p/a9RkvuvW1fQD8A9cbDK4UitP5NfyMTNt
X-Received: by 2002:a05:6402:750:b0:57d:17c3:a58d with SMTP id
 4fb4d7f45d1cf-57d17c3a680mr1499643a12.37.1718882045349; 
 Thu, 20 Jun 2024 04:14:05 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 4fb4d7f45d1cf-57cb74f54c2sm469533a12.19.2024.06.20.04.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 04:14:05 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 1/2] MAINTAINERS: drm : vc4: Add Raspberry Pi as maintainers
Date: Thu, 20 Jun 2024 12:14:00 +0100
Message-Id: <20240620111401.3629380-1-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
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

Add myself and our kernel maintenance list as maintainers for
VC4 alongside Maxime.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d1566c647a50..b6dd628d5bc6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7520,6 +7520,8 @@ F:	include/uapi/drm/v3d_drm.h
 
 DRM DRIVERS FOR VC4
 M:	Maxime Ripard <mripard@kernel.org>
+M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
+M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 S:	Supported
 T:	git git://github.com/anholt/linux
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.34.1

