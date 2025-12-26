Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C3BCDF1FB
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 00:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4EF1126F3;
	Fri, 26 Dec 2025 23:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AUgVCKsb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD421126D6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 22:36:00 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id
 ffacd0b85a97d-42fbbc3df8fso3754374f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 14:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766788559; x=1767393359; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zLxrfZdyjDR6B5udEzsNrJMX0E0uwP4R+afqeEvo8J0=;
 b=AUgVCKsb5871+Y8vXda2fUQyjeLEG43FAveTOfH8QPp+0AyVfZRdPbV8+sU7+ko6dU
 StLE5Q8ZOHuPEOhgmQLzyZetsjLWdWIvzVxC+cpiHfEnMnb0yjwWG6HXNqD/hUKkpQdD
 nCgOEbPXRpMC6Vyegn7JzdmoK4GU2GD4LunaWu1BSP0j12ImEPjXKNjIb+jOPy0FcxTq
 zjnHiaIcY0cPTNyIrQi2KaPwHlxX7r6tHCHfM7XsfbjS0CFcyl9Lgo1/94nVffRcQlQ7
 P9w7ZIwDmPRiAKZJc2LhZLMyGWc8rQG/0W1PCItqWisGW4jNQmEX5JIW1dQ/A0iqaTG3
 N0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766788559; x=1767393359;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zLxrfZdyjDR6B5udEzsNrJMX0E0uwP4R+afqeEvo8J0=;
 b=JOywzw+ZczFeY5CGQlxxHTbcIehMJ1eL7fftLf/SnkPLRF8zViIgvIZwJnxU+423lC
 47zuxx8Z/oh6Xvp1MfCefoB+YN5kqQHl+RgWyoEb4uTlBZMbzxP9wT3LtVXelGwzoni/
 jo2tmBisl5pJmpcs5hJ/c9WvLaHqf1BHWflzE5jVOgHn/Xcs46qxMp8kzErgx0Cnmy/0
 lvXGSBb22mnSoiqZKT8hraZxOsFPiOwanpycDXP9eYnGi/TA1s+ZP/Xy8kkQ+1ljkrYz
 qvmn9oIqGh8C5lUxIadZdc6Fd7L+qrawei3jZsIY4ryILVrtPNLvVat8zPx6wTl1ML4g
 2/wA==
X-Gm-Message-State: AOJu0YzxgGatD1GWf4sEiINSv4D3cpyEH2cjlRcAvp6g7JYDS+FdEDO8
 uVeV9E+t3IOTc8N6ec9RRMC37k1qdrjVqh+7fbkcU74m9PlpXpt7tcZ1
X-Gm-Gg: AY/fxX6ylRlFpVR7Z3Bh4oY9KDYIGzLEJzOb1JUrabaK80IgE7gAivQDf+oGhefo29W
 LcaEHgNHC0U/FIOgnAOt3cycvvw2jAm8H9SoCSUyj+fmes2zDFhASBODPhxj3eLkhlui4Q3tLuO
 NT1C9uQrCbBTgna4U/9z4MUKgdBeBHJh7/IjExTqGvqgyJFiLcAJd5yDUe8pi2SqCNuffcYoUnh
 sgjrOAw/FCiXshahO76hp9ZhT/q6mZ0TorX/bX50+BxfzmxVmY3IIYU1LGVyn0gyNhfVcPEzk7H
 Zlz9s4lsCs3B4fBzHf/nxFeb3VN1itLhMuygqIDpWfsqfNiwDFQxlxWGjVwnOfL4LTh7JG5vzzf
 mb6fLxA59xo+QvqjfwXmazEzeRe0vZF/vtiLOlcSaonETNKBEc97q43wat8qtcE48oMNi/0grWE
 sfI9Vs9EYlVzUWIbh7
X-Google-Smtp-Source: AGHT+IGKTqkkqTV3cV67h5L0E8qKuzMoDvpHZFPuZf5QCka9zfA9RceZQ7Pqv7r6sJj1b6X+txm59g==
X-Received: by 2002:a05:6000:26d0:b0:430:fd84:3175 with SMTP id
 ffacd0b85a97d-4324e503ec6mr29281045f8f.38.1766788559059; 
 Fri, 26 Dec 2025 14:35:59 -0800 (PST)
Received: from Arch-Spectre.home ([92.19.101.73])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1b36fsm47400181f8f.5.2025.12.26.14.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 14:35:58 -0800 (PST)
From: Yicong Hui <yiconghui@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Yicong Hui <yiconghui@gmail.com>
Subject: [PATCH] drm/gpusvm: Fix documentation build errors by updating names
Date: Fri, 26 Dec 2025 22:36:14 +0000
Message-ID: <20251226223614.1263014-1-yiconghui@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 26 Dec 2025 23:46:51 +0000
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

Fix the two following documentation build errors which were introduced
when drivers/gpu/drm/drm_gpusvm.c was refactored but when updating the
corresponding documentation, the variable and function names were not
also updated as well.

WARNING: ./drivers/gpu/drm/drm_gpusvm.c:1229 function parameter 'svm_pages' not described in 'drm_gpusvm_pages_valid_unlocked'
WARNING: ./drivers/gpu/drm/drm_gpusvm.c:1229 expecting prototype for drm_gpusvm_range_pages_valid_unlocked(). Prototype was for drm_gpusvm_pages_valid_unlocked() instead
Signed-off-by: Yicong Hui <yiconghui@gmail.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 73e550c8ff8c..b099b4d0a2ec 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1216,9 +1216,9 @@ bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
 
 /**
- * drm_gpusvm_range_pages_valid_unlocked() - GPU SVM range pages valid unlocked
+ * drm_gpusvm_pages_valid_unlocked() - GPU SVM range pages valid unlocked
  * @gpusvm: Pointer to the GPU SVM structure
- * @range: Pointer to the GPU SVM range structure
+ * @svm_pages: Pointer to the GPU SVM pages structure
  *
  * This function determines if a GPU SVM range pages are valid. Expected be
  * called without holding gpusvm->notifier_lock.
-- 
2.52.0

