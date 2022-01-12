Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA94648D3A7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 09:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B6810EE53;
	Thu, 13 Jan 2022 08:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D98D10E4B6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 23:20:38 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h10so7012676wrb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 15:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BZetsEggcZdDtvIjPQfbsaoX1aAbsURqAycl8u60wPc=;
 b=QiPlOCYzz/Afi5jyqbpliTey9a1ba0Gw+PfX7Gz9I5jPJfchYzAEMdwuSs5fwgiyla
 Nma1aLjBfrZ4L1MA91ynUGNmJLvtdwN04Mmm8jmLrEEkMIl5OvyEq67/8lRKVKgztmTe
 TRsMDFyWM/K4HrHcE8v4VwSg21tXdYXEq+WH4lRrWPN6wF0HiJ2lABoGZbDpmE8Xr+ep
 rHA8kp6G+LZPhAgiPeADqbJ1gW12d0a59/pVlW4iek9Q9s6/ZBAiPqpAM3Rndi/sALTi
 NmcfQu/xi0NgeIznj/AkpwQzOrWwyBUeviNF22XlqgKy2pOkqfqIICm7sOvKAqMASpBL
 hxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BZetsEggcZdDtvIjPQfbsaoX1aAbsURqAycl8u60wPc=;
 b=ZAg2qaNrCezwyKqq+PHvjUbXiCyJTaFH/VeLr98jNgQTLcTZJJtT/o9w7IqePy5oAU
 5nUzKOh02LpJGBId1cLib4OZD4fR4Dur6F9t6SaGevApIUWADMT9S0evbBOob+ZlhCH3
 kJ+1w6KXCH1dvM1P48fxGxybwnK1XmTi5/nUMHm47ipRI3h4CWZAoWPtMWLdIyhW9el5
 DRHG9KTPzhS9dljQAAK0NIf9oBEm7wdZrOgyhUXkjdu9tb20I2Fxo9Mmdh52P+sFlzYG
 kZSFx/xh+B2KmIWUfENwkGn0EXFmqWWJ8uAACQ4UeQSoOAH3Qy0gNf0w3T7Nubvnkvnu
 vr4w==
X-Gm-Message-State: AOAM533O+ZxdH8BODN6Akx2uUiWZpTeY0UmDONQQ5cPF9JmhWc1VwfiY
 qSNf/hFpihrzHM9TvUDd9S8=
X-Google-Smtp-Source: ABdhPJxqVabMtVcZhWSJ9raCaLAxk4HaOSfwpuc8+h9zSIMyHVxyFvF0t1vLFmXru6xvw/3inQWmVw==
X-Received: by 2002:a05:6000:1a89:: with SMTP id
 f9mr1577287wry.41.1642029637059; 
 Wed, 12 Jan 2022 15:20:37 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id k10sm992328wrz.113.2022.01.12.15.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 15:20:36 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vc4: remove redundant assignment of variable size
Date: Wed, 12 Jan 2022 23:20:36 +0000
Message-Id: <20220112232036.1182846-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Jan 2022 08:32:04 +0000
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
Cc: llvm@lists.linux.dev, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable 'size' is being assigned a value that is never read,
the assignment is redundant and can be removed. Cleans up clang-scan
warning:

drivers/gpu/drm/vc4/vc4_bo.c:358:2: warning: Value stored to 'size'
is never read [deadcode.DeadStores]
        size = roundup(size, PAGE_SIZE);

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_bo.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 6d1281a343e9..e451cc5bcfac 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -355,8 +355,6 @@ static struct vc4_bo *vc4_bo_get_from_cache(struct drm_device *dev,
 	uint32_t page_index = bo_page_index(size);
 	struct vc4_bo *bo = NULL;
 
-	size = roundup(size, PAGE_SIZE);
-
 	mutex_lock(&vc4->bo_lock);
 	if (page_index >= vc4->bo_cache.size_list_size)
 		goto out;
-- 
2.33.1

