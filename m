Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C533B3FA6D1
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 18:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0326E082;
	Sat, 28 Aug 2021 16:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4096EA5B
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 15:40:55 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id e1so5948180plt.11
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 08:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=itfac-mrt-ac-lk.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=akdugIMHsoyXsfhl3XKBAKae34UmKAEkl8JKPj7EnFs=;
 b=UrVAIb9+S4rwa2YODgE9Q4ZZr9y00HJhRxBrL83ksYLZ8fKwcOEDr2eWfb/kJioTvV
 r6wwj9PD2lcdcm0dzmjN3szorTZpB68tpcmTigXugfT7CsSaW7vRAkeH/aUhoofYSsjd
 5AY0+7HhaL+rOZ2K1bChM1zoh7ykuc+zEDhpbOdeBoAmgGsLhcFENCCJeqttF67RleKM
 AFwC3/KwH9+JRCJbdZCf5M9unA7CRFjtq3ICBt2rwssnFuJzVCH9ABY3Yv6Ta0vfaI0z
 odkDj03UoukCVMgHmcgUGRc2XYH6RZswiFO4LsWmLimq+CRbxDq4ORlQjisXQpkmyw78
 UKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=akdugIMHsoyXsfhl3XKBAKae34UmKAEkl8JKPj7EnFs=;
 b=UqyBF17OkOgdfU2at1MZCQo5dieNtbfuZodDJmCX8eWTPRryaRA5wdi7wyh+0ZihQr
 fRdbcO2lzcORHqhs46eaP0B35DBd3rTYLcRr8xye09phLzrC1CQz/REKJf5sQayNJ9Py
 06sk7/j5Sx5zVz6n0Tmdub6qLRnG4ixZvR/i45ol36fy3nF0nqruhZ92lmcQH8pryHZF
 vMdlXDyJYiRbbFLcoqkvRVJNZ5SkBLfwXPK4tOsx87ghp6+ocAXKYMnZpDEWtzYSVMTP
 gQl30hBHwxqztHDJuud+eMW9C2Tu2kgUdc8QbXhkCAknp5pqc95Ql3KNteGfB3OQu0GP
 pV6g==
X-Gm-Message-State: AOAM531LvMo2ESIRn9weSaMlBfOXOrQNTGMDauZolxITj/uZMo4gAX3o
 4POiPwYjyPK+aIcqLhvJp3Di
X-Google-Smtp-Source: ABdhPJyFCSQpwgZ/X8ubSpy4OipMWbOOyTJAFIoG0iqKokfsFXHKzOY/xyhQcleKJCB0UXxRqF31xw==
X-Received: by 2002:a17:90a:af8f:: with SMTP id
 w15mr29098349pjq.90.1630165254592; 
 Sat, 28 Aug 2021 08:40:54 -0700 (PDT)
Received: from localhost.localdomain ([123.231.122.209])
 by smtp.gmail.com with ESMTPSA id d1sm9077316pfa.71.2021.08.28.08.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 08:40:54 -0700 (PDT)
From: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
To: airlied@redhat.com, sean@poorly.run, tzimmermann@suse.de, airlied@linux.ie,
 daniel@ffwll.ch
Cc: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] GPU:drm: returning ENOMEM
Date: Sat, 28 Aug 2021 21:10:27 +0530
Message-Id: <20210828154027.8198-1-asha.16@itfac.mrt.ac.lk>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sat, 28 Aug 2021 16:54:49 +0000
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

When memory allocation is failed this patch returns out of memory error instead of -1.

Signed-off-by: F.A. SULAIMAN <asha.16@itfac.mrt.ac.lk>
---
 drivers/gpu/drm/udl/udl_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/udl_connector.c
index 3750fd216131..afebab6186ab 100644
--- a/drivers/gpu/drm/udl/udl_connector.c
+++ b/drivers/gpu/drm/udl/udl_connector.c
@@ -24,7 +24,7 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block,
 
 	read_buff = kmalloc(2, GFP_KERNEL);
 	if (!read_buff)
-		return -1;
+		return -ENOMEM;
 
 	for (i = 0; i < len; i++) {
 		int bval = (i + block * EDID_LENGTH) << 8;
-- 
2.17.1

