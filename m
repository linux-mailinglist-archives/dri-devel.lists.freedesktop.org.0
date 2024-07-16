Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A3D9326A6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 14:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A979410E6B8;
	Tue, 16 Jul 2024 12:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EG0MCYLn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5079810E6B4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 12:35:26 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42797289c8bso40423475e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 05:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721133325; x=1721738125; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lasyAl9ukDWZ1eqMs/L0VH2cL9OYH2xMgGUg0WBLP7o=;
 b=EG0MCYLnf65fLITq7wHV4Mtmhj0Hb5ihFGQCjsl8TAdGYcaSDWlfHBg73QjLaNp9/a
 wYfKGGAyecgHLfjFW2ePefPhnEZz2m/egm4hJ/PQD/RrqCG0S+UAEuL2oMJfg/iH5cTV
 klmv1W0qEaR/CHe9CqD2b9Ffr78hpFMVaPAuiSy7ME6FqH+eb4Io17UOnOPPyX616LVE
 tYHPa6yJmZcAtN88N6X1g9T6V0CHMDGMajc8OCfQorXyLc6e7Bo2ZwVrWeOrJl3AW72O
 RntDlETZYx+U0FoyBfWMwEm/IHyKHw6sEAA4g5iYqWiq3c7My8aNf2XX8nPdq5kXlqBw
 1jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721133325; x=1721738125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lasyAl9ukDWZ1eqMs/L0VH2cL9OYH2xMgGUg0WBLP7o=;
 b=HFs+4rZ+vcXBFW9AOiIDgmQlgWMFegdCfMqeeYqbg+pyMFJOyfAChf1zm5QgcGFArA
 J5ybnXj6ciOKkYMOOAPAk8X4pVR1UTOR0mhYP3xolEwySWJHJgsVWqyRP7YQ8oq9llBy
 gfIWBW4ybag88UuBeemTx797dViuYGXhtObHWIOZjadQXjSYkP+9nVnJujYAPqAYEs18
 3K5mybg6l958Q+KfRybrO0nvCtdvxlZ9PG+P/z6oVNOkZObEHNnyQenhuNXb3htnOeGz
 TtAkr5RaziQCrMp7i+83QNouAcE3kIvX/xNALxXe+7k530zZJBJ/IzdVesd+aYdvqm3a
 m3wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8Ztce2YSJdtB71QZiUWuxtfnbi4K9xjlkBAK4GOUo4wtetY1w65F02IPsIqt1uZnxPriBgwvb/2+RTtEgfQvKYhgjb/vcyl+daYD6W44Z
X-Gm-Message-State: AOJu0YxvNLeoXUbDy7ouX7Aro3OqXzqhhPNQGgdGf5VJrCBhGyveENtg
 Oz1RRQmUsOogJxjBdSYEUMtY1S/dhx0FJ3qAaeZr08RCOA0/WMX/
X-Google-Smtp-Source: AGHT+IEWLOwSNjN8JE6U3x/+so7IwMAmCp4f9we8Ncs0I6SsYBSSzje14RCOVeTxnRIbaakiO39maA==
X-Received: by 2002:a05:600c:1c18:b0:426:5d43:e41d with SMTP id
 5b1f17b1804b1-427ba69ad25mr12531925e9.18.1721133324407; 
 Tue, 16 Jul 2024 05:35:24 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1592:7f00:1c98:7fd3:7b80:1cc1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e77493sm127058225e9.7.2024.07.16.05.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 05:35:24 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm/nouveau: use GEM references instead of TTMs
Date: Tue, 16 Jul 2024 14:35:13 +0200
Message-Id: <20240716123519.1884-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716123519.1884-1-christian.koenig@amd.com>
References: <20240716123519.1884-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Instead of a TTM reference grab a GEM reference whenever necessary.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index 4e891752c255..74035b16a381 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -63,13 +63,13 @@ nouveau_bo_ref(struct nouveau_bo *ref, struct nouveau_bo **pnvbo)
 	prev = *pnvbo;
 
 	if (ref) {
-		ttm_bo_get(&ref->bo);
+		drm_gem_object_get(&ref->bo.base);
 		*pnvbo = nouveau_bo(&ref->bo);
 	} else {
 		*pnvbo = NULL;
 	}
 	if (prev)
-		ttm_bo_put(&prev->bo);
+		drm_gem_object_put(&prev->bo.base);
 
 	return 0;
 }
-- 
2.34.1

