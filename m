Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971395BB3A8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 22:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B7310E122;
	Fri, 16 Sep 2022 20:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DE310E122
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 20:48:02 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1280590722dso53861501fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 13:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=8tndNWWo7lA8zxMWjXo79wFYy7T8DZ1WmSv9NU+Qn00=;
 b=ZWmfg1lRRT5cNVKTt0jTiHBgVMqzXKAg+mWeUHDA+3U1KWQQ49oYipINIxDFBWou6A
 OB4YQ8Z+slpnBCt0Ecv5s5cwk0g6/rfOl2/r4ds6cmgk3w8l+x2lTMSOp8Co0lyYwzdG
 f6XKy/puez2KLA3pbV37FoAKgr2RaXgNNyqPq+FJOxxxhBtbiihCspumLXPWuZm+FHjo
 awwyHCuyTSbbb+8IW5dBx/kMJgoOvf1kiJcQGwigm8xFAq3Jg6I/OC5CMbQinQTxI9x7
 ZQ8arAuZiUjrqVYmYHW3St2FHRGm+ASRqoTvvQ25s9EC7luoiUm9EMn/z8bwG6wP7OU2
 azrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=8tndNWWo7lA8zxMWjXo79wFYy7T8DZ1WmSv9NU+Qn00=;
 b=anx/SoGyygozmR7rkIW2+Q0Slswiu3+2lw44VM26Pz0wKiUkm1lhIQbymPx1yAOvxE
 XdStQQX0A73KrSs83VVUIJHTBuOYmnSx+P3Lhu0e/UPDiJfKhd7b6dOkV6zxpXOj5Efi
 +Uu7bBQ3bsScHP4TZj5QladSJ+2UvALT5EmTAKUeP4UhuYIvrlS3tV7ZtUevBasNQoC9
 xahiGDGh/PeJ2IIGf5f32tlY884ktYfniGbuFvwiMp1Q5UPSdcyZ5vfozrsxxjKVVPED
 wLhCKwrN6mAeja4MP5x6WmMFI/rIBdKAMuMnwx0YtwflQIe83zPcoRC0uOb9GqzPNRJo
 WzGg==
X-Gm-Message-State: ACgBeo2Z7JdQQ3bTDllc1lJvNSspPaIvqfVwExq2JNk9CxzgtgceRmSl
 KzcpCCFh7/eLkSyj6WcsWzQ=
X-Google-Smtp-Source: AA6agR5G+ecb3He752RviFLpk7+0KdXJV/JKh/ZKfmg8l+9nkf1YYT8QIY9isMCp9DXbMAlDo2T6rw==
X-Received: by 2002:a05:6870:b290:b0:127:4089:227a with SMTP id
 c16-20020a056870b29000b001274089227amr9788780oao.8.1663361282172; 
 Fri, 16 Sep 2022 13:48:02 -0700 (PDT)
Received: from macondo.. ([2804:431:e7cd:8cb3:43e6:f4f3:1b9f:38fe])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a4aea94000000b0044b47bb023fsm1803963ooh.37.2022.09.16.13.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 13:48:01 -0700 (PDT)
From: Rafael Mendonca <rafaelmendsr@gmail.com>
To: Zack Rusin <zackr@vmware.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Martin Krastev <krastevm@vmware.com>
Subject: [PATCH] drm/vmwgfx: Fix memory leak in vmw_mksstat_add_ioctl()
Date: Fri, 16 Sep 2022 17:47:51 -0300
Message-Id: <20220916204751.720716-1-rafaelmendsr@gmail.com>
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
Cc: Rafael Mendonca <rafaelmendsr@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the copy of the description string from userspace fails, then the page
for the instance descriptor doesn't get freed before returning -EFAULT,
which leads to a memleak.

Fixes: 7a7a933edd6c ("drm/vmwgfx: Introduce VMware mks-guest-stats")
Signed-off-by: Rafael Mendonca <rafaelmendsr@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index 2aceac7856e2..089046fa21be 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -1076,6 +1076,7 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
 
 	if (desc_len < 0) {
 		atomic_set(&dev_priv->mksstat_user_pids[slot], 0);
+		__free_page(page);
 		return -EFAULT;
 	}
 
-- 
2.34.1

