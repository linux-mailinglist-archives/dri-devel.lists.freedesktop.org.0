Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EE5297DA1
	for <lists+dri-devel@lfdr.de>; Sat, 24 Oct 2020 19:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502A06E904;
	Sat, 24 Oct 2020 17:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EDF6E47A
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Oct 2020 00:47:30 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id k3so4760720ejj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 17:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9nGBhSaBuMaImbsbpDD696OYT/ES8t/q7g+4eLy+bu8=;
 b=gOZhoV+6gGSXqS8XfN8jVsjRRRjofmjn+hpYzAmNvCrWy9I5g0qMUVR5e5R9NweGJ0
 ABDDLfGOiOVsu/LmVAo2oaVNbi03304MCep7p0yUlBcH13Q6UhLDnjwymy4mLmiWZhls
 3uHEGqYLM0eAJBn6cq3eglfA4U2IMp01rPZkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9nGBhSaBuMaImbsbpDD696OYT/ES8t/q7g+4eLy+bu8=;
 b=PLJiS7BWo1DJWqsa2pjZdg11b3gsRBbIIijujbsRVjXVbzNdwa6rm9JKvvkhQ+Wfd/
 d+rVBkx0jocFh6C7WkJVUNFFYaZPMsPXpNo++k4bgXdhU6CNI79qM/Fd8fR1hHotNByH
 Lf0fJ1Lsvy8aDKUUFMyxDqqciJgf7r+3GRvqraNTU37XqcMB5TkNSeAkE7sVr9OcjzW6
 sjxk89riBEx7TiDIBgYi7u6ITsied9xoWrQiBpzfsI/2CQdR4qpkoNWBj0+6C2mj1aih
 9rkrgi8ld0p1ozdainLKreskFczvH/9kcHeWm9R9fiO9Qsr1HRmk1yl04Kc/PMsfuRZk
 bGYA==
X-Gm-Message-State: AOAM532RqNbFkH31KfMQj8ZpLi6gofhZdjw26s2aEZrKbMGe8nDLJyz2
 tQ6zegBkBDTZwlh/1as7qIo2KQ==
X-Google-Smtp-Source: ABdhPJwDurk4oHPdsox9A9z3dqzjWUY5yj8mDDqlIRq04fNZyTcZK1l9lEzo723x7M0+yR9UN4D2tg==
X-Received: by 2002:a17:906:3bd7:: with SMTP id
 v23mr4829055ejf.100.1603500449274; 
 Fri, 23 Oct 2020 17:47:29 -0700 (PDT)
Received: from prevas-ravi.prevas.se (5.186.115.188.cgn.fibianet.dk.
 [5.186.115.188])
 by smtp.gmail.com with ESMTPSA id i14sm1527349ejp.2.2020.10.23.17.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 17:47:28 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/ttm: add __user annotation in radeon_ttm_vram_read
Date: Sat, 24 Oct 2020 02:47:06 +0200
Message-Id: <20201024004706.24518-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 24 Oct 2020 17:05:18 +0000
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
Cc: kernel test robot <lkp@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Keep sparse happy by preserving the __user annotation when casting.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---

kernel test robot has already started spamming me due to 9c5743dff. If
I don't fix those warnings I'll keep getting those emails for
months, so let me do the easy ones.


 drivers/gpu/drm/radeon/radeon_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 36150b7f31a90aa1eece..ecfe88b0a35d8f317712 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -1005,7 +1005,7 @@ static ssize_t radeon_ttm_vram_read(struct file *f, char __user *buf,
 		value = RREG32(RADEON_MM_DATA);
 		spin_unlock_irqrestore(&rdev->mmio_idx_lock, flags);
 
-		r = put_user(value, (uint32_t *)buf);
+		r = put_user(value, (uint32_t __user *)buf);
 		if (r)
 			return r;
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
