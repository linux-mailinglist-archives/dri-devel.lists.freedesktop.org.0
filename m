Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506A1BEC83F
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 07:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCF210E08F;
	Sat, 18 Oct 2025 05:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=0x0f.com header.i=@0x0f.com header.b="Qj1yvM+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F9710E08F
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 05:45:03 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-782023ca359so2650422b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 22:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0x0f.com; s=google; t=1760766303; x=1761371103; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VmUPjTR3yMW64aVQGfGVjFZpeabfMfYHxfBKINbWsBI=;
 b=Qj1yvM+KismuC2Q29F5UmaM3yCr6eceMdAbMVANRe0j4MCACSheMjF9G0Yg8lLtLvM
 UpY3hv0wXwgWpDUzBd+4KwAoHBQPKwMbE60JG9E9MMJeRQft+1mUbXcxc42KWjI1vqOb
 UXRwjUQVl71PHM8fOWgI3h/ctjx/k50JP+ncE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760766303; x=1761371103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VmUPjTR3yMW64aVQGfGVjFZpeabfMfYHxfBKINbWsBI=;
 b=aVg0gOuzmELoU9/mvXxjza6HVayynomiiYyZjSFQncMR1BLGlYRhAbzCNGQ4hR0SXd
 smb6iglj/zT0PiW65PY8X4ihbfN9tjZITmegGvzHxdRAubhR7AnFclRnYMSYi8NryEsd
 BBQ4wyk58e7C7Zewr+lYZemZ9jyfCNNx0bZMlM7LZY20LT4hSji0ltzGgSl/vQR3Z5yL
 4lrYRvly/TKT/wOV8VvWKK7Yg2i9BSKA6qqGOq2WrhJ+FeM3ilQdx02ExGGiSDjtie6a
 4hf7n9VYsFfA6cFe5VVO0NaGdb69gBU8TnlMJdnXh0pRmQ0F4k8xv0gX6z6FkAnEAlLa
 XJTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2o0Lle2c5yQR5ehSLb07cEFq+CsU6uavHz60SArVWr35TzZQn9tk872q4bK4A6m2W1RqM0yMi9s4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxbm3LXz7l3TTZAv+WU4X1FdLJ+033krTFNj7yhlX6uG2UQLTsl
 QVarOSCMNK+o9olpjEWyyzBUOfHxYI0RXSGH3jzPMkj3F3bO4ArLnP9qkcBMv9ifu4E=
X-Gm-Gg: ASbGncu8zHcTAaqrpkkeBEuaCnRoNWRuWoiS+R341f5Z7+TY/Ure12s6VyUdJyscbw7
 1o3LSV3lVxYm7dQ1e5nAEMA1AamDpkXUqQgKyUUi+mMUNVSxSc+Lmw58bNa1ZSKu7HxBDiYPutO
 za640SzJyjIoxkKQSOhnyCi8vMPb3nrJe3X1tE+NqkzLfHhgsU2Ez2XpOw5rejCuoLIqzGMKMMe
 oO+cu+1vtD/A14e6SIwSz86kQqdNRdbt1e0hKRkJurGkmxsvuLQmTreCgjcUXi7RgTbbAz+921n
 ZcrttrU4R6B6JlztDO5inQE3wGMk0nyYFjJoJvRBPQHtE0n/pcHF2AsWIUsrugs5/WCv/cpofVW
 YRGrEk80PFzDuq6JqQXY1EAnoQRG8Gj+/MZnuWemqxdnQ+t+TGsdK4FnTSuflTbiyzrhAb25+zY
 H0Y11Bvr3Ea10UvUOAH7JWu2wkp7QLsIqdoC8qkJj8
X-Google-Smtp-Source: AGHT+IE0n5z7f/IMMhO8RMH8A+89s4jb/Yrjx1i30f1bpPQKuZW8GFOMc0cHZQNBYLb0n3r/GPAvpw==
X-Received: by 2002:a05:6a21:3e15:b0:334:b57f:554a with SMTP id
 adf61e73a8af0-334b57f5562mr3664489637.25.1760766302707; 
 Fri, 17 Oct 2025 22:45:02 -0700 (PDT)
Received: from shiro (p1391188-ipxg00a01sizuokaden.shizuoka.ocn.ne.jp.
 [153.222.3.188]) by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-b6a76645c61sm1657222a12.3.2025.10.17.22.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 22:45:02 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, wuhoipok@gmail.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 2/3] drm/radeon: Do not kfree() devres managed rdev
Date: Sat, 18 Oct 2025 14:44:50 +0900
Message-ID: <20251018054451.259432-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018054451.259432-1-daniel@0x0f.com>
References: <20251018054451.259432-1-daniel@0x0f.com>
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

Since the allocation of the drivers main structure was changed to
devm_drm_dev_alloc() rdev is managed by devres and we shouldn't be calling
kfree() on it.

This fixes things exploding if the driver probe fails and devres cleans up
the rdev after we already free'd it.

Fixes: a9ed2f052c5c ("drm/radeon: change drm_dev_alloc to devm_drm_dev_alloc")
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/gpu/drm/radeon/radeon_kms.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index 645e33bf7947..ba1446acd703 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -84,7 +84,6 @@ void radeon_driver_unload_kms(struct drm_device *dev)
 	rdev->agp = NULL;
 
 done_free:
-	kfree(rdev);
 	dev->dev_private = NULL;
 }
 
-- 
2.51.0

