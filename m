Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 257F4AD4A89
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 07:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16D110E060;
	Wed, 11 Jun 2025 05:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IEdloHda";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE6210E060;
 Wed, 11 Jun 2025 05:48:57 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so75351705e9.1; 
 Tue, 10 Jun 2025 22:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749620935; x=1750225735; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BxLsl1EtZ+/S92kRfUwyMhLwGpM1C0JZqmhvFyqhsOU=;
 b=IEdloHdasTIOVJZYCWvmZ+ed7BaZe8a/mAtms/AUEKdghQ0X05p2QijghthF0jaZtf
 vpTL0mMT6UyXlHkAfz2rKVlfUA5dWCWuJmn/nOpZ4oPAL8FzvWvWokwwhzxMqY4eLe6n
 xegmP1Z6uekGXHdkmQEluQ5bt/dIfgyifHMYnndq/p0z0qc07VhquOdG8U/TdJaGxajl
 qDHmVd8grFRZQj2CSo9ZSoICyeDAFBQEY1uNhPJWTgipegZeEP/eo0egnoh8S9gdEVyJ
 Iya3DfOqJ/BOE5GSButXl5QdiX+yK+t77J6En7cl0FL53Fui00ZE8k+9iX+9j23pKvPA
 DLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749620935; x=1750225735;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BxLsl1EtZ+/S92kRfUwyMhLwGpM1C0JZqmhvFyqhsOU=;
 b=id6wnM3XMg4nivuJbomFxDiWZP4u9JzVPEb1YeGb9e45F5XaaSVJAg946hRqAOqW3J
 f9c6m4Xua+vheYTTM/0zJz4uXGbc9p5EJxP8tGEAhBmBBPesZltjZ4RYKVzsgxyuOJte
 zENKfjIo7aDPGSfXEmbb2+vcDRIMD3+AqrkSoWUgh7E0uxUsc/18y0qkHDmXsPWjvS46
 zeivGUbyk/GqQnX3GSuPd2D5reCI39voVma69S5Dr9xqmW2aluxLe5F7Va+cLp+1z/lb
 SnG255Eo61NnGwM7qbZySthGZnPr2LMRH/GMA401ojmq/77aQ1JUeDlshPQ+LVjAERP0
 bZHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKtFTgBgxEzid3cnzrSzwqbH/D/zk9Zu56sbGRpAVdiBuEaetpUsHlYGQMHeX9j+WTBmByIHNcQKQ=@lists.freedesktop.org,
 AJvYcCW5CEilFkI9NAtENxJFnNnlZlsND/En2xd8PnMmnTVbFMwX3IA9TeC/+ox4itz3rr9as21oC5tkr4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8Pw4I65kPfuHpVabk+Ky6NP9wwdkRPe1y+ZCT5ESAN5kwVUZD
 tmbCKIqkfJbW/eci6z2+A5O+q6rz7ewIFEnW4AFi8FA9pMZvJ8Y7Gnc/
X-Gm-Gg: ASbGncvlmLtbb6zSizUnPzJ6w/EgMHFHcAF7rW/8dmDanIvQh3CJr9nTFzvb9oLwb1N
 UFJKErJl2n/nQ0s+gt6zPid1sevFqW+8UzYuF2u1xAvSTOVE4ef5bNmbhPgrrzrMogR2bSzkGU0
 q0zXVZazUiVZK/YwHab2KooodRSFNkElRYoqjpLnS4e/YsrVZ/nnwlQxjzgpSuHCtvdpvs252wb
 jWYlb6y5UV589W7sBeZYuV3ca4pWSbztHZGQPE5munTGbitAPKyG94byu9Lvr+sy8rvg5ivvuhO
 h7hjPQcHsFugnZbyoPhVDmxzl0gSp65pgCnp8krV6pD37DCQNlw=
X-Google-Smtp-Source: AGHT+IGtvTLfWgn3tSC0zbpaDKA+sRi4y6yGMt4LLOqYRwJFJ634U+zXrAaYuqs7XFm6Gu2WJkUySg==
X-Received: by 2002:a05:600c:4f10:b0:442:f97b:87e with SMTP id
 5b1f17b1804b1-453248796eemr13119685e9.6.1749620935177; 
 Tue, 10 Jun 2025 22:48:55 -0700 (PDT)
Received: from pc ([165.51.67.115]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532056486dsm23083735e9.1.2025.06.10.22.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 22:48:54 -0700 (PDT)
Date: Wed, 11 Jun 2025 06:48:51 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: salah.triki@gmail.com
Subject: [PATCH] drm/xe: replace kmem_cache_create() with KMEM_CACHE()
Message-ID: <aEkYwwhFQqPxyyey@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Use KMEM_CACHE() instead of kmem_cache_create() to simplify the creation
of SLAB cache.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 0b4f12be3692..b54f758a905e 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -20,9 +20,8 @@ static struct kmem_cache *xe_hw_fence_slab;
 
 int __init xe_hw_fence_module_init(void)
 {
-	xe_hw_fence_slab = kmem_cache_create("xe_hw_fence",
-					     sizeof(struct xe_hw_fence), 0,
-					     SLAB_HWCACHE_ALIGN, NULL);
+	xe_hw_fence_slab = KMEM_CACHE(xe_hw_fence, SLAB_HWCACHE_ALIGN);
+
 	if (!xe_hw_fence_slab)
 		return -ENOMEM;
 
-- 
2.43.0

