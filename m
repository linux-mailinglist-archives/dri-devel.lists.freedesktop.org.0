Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7405583DB89
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 15:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B742B10FADB;
	Fri, 26 Jan 2024 14:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0122110E2A1;
 Fri, 26 Jan 2024 14:11:08 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2cf205dc075so4169721fa.2; 
 Fri, 26 Jan 2024 06:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706278207; x=1706883007; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2ZVeVLRlVofRyZad/dqeZuEKBLGK5uC0f/PC082ZqIg=;
 b=Xx1A2QtkJGrlR9Ja5LRrplEjtZMFXVoVP3fLsom+05wvyczhTQrcXHB0tmRPIZ7RbN
 29q/ckADglEYIFHclXZBOh37/7waeTIbM9C7Wzoksb8kGrEs9jrp6KLw7Ii4oTa5pgQ3
 jHaYLC5Ko/vdvfnwX1tbu9YvkU97lrmbJg2AmlEQYIezNt7e0b9Bv1VItZoAw4Bqtozl
 g6m05krAnm0preEzhtygF6A+tawEJ91GWruyK9NVqxRaGTBq8CoPyE0P6MZD55aaI8r3
 bm7KRA55nZKFvnRLID3hPLSjJBFGv/cs+/i4mEFZA5OqvI5B+nWeBsAWoR+SDFdwapw6
 yeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706278207; x=1706883007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ZVeVLRlVofRyZad/dqeZuEKBLGK5uC0f/PC082ZqIg=;
 b=NmUEe7/Fow4bW9Z+aSQEdQslxMkgtTmv7l7hmIxzMzx1ovPLyH8qq8wZbp29+4gPqP
 BkZ1SXUb2+PgaGlMrRSxoZpiCXc50KRBkZcZ6dKKf5hF+Lk5zYv8yO7Ke/kVKnd9TBSK
 8xzjEIDdIcezIIMOkI1TxYgoljvh5X7KRadT9Cm2HFujPzgo8ahpB1kGt+gnOS2pT/oe
 nZ4F0wUWGd72WSi7DQCUtQym0JxsnOwrVdQl2tGw10IDN+kZAZZ5iLA5DuBAI6gOHuPx
 cZQ5OnSmczmzl5gU+sbsWgemOeliI4xlaRnrPP6VytGmJSGgJN6r2K+oXI7b6BW2Vpxf
 inAg==
X-Gm-Message-State: AOJu0YxxoBqZkxT+qV0Cg3KXKyScHOb+/Zst0JG8Rltzk+IDmZB3btE+
 vGPSSwdUy1hf5t/c2NTSgg/F6Ko9AmngdY1I1mhL9Aa7BxicOJn3KF8hX/fc
X-Google-Smtp-Source: AGHT+IGJcAiL+CJcWDgjfkuCBx+QT5N7ROB+6h4kHfJYKlpRi5MOZx/ZJSt6tsRaLbBasp+NOqnGiw==
X-Received: by 2002:a05:651c:1c6:b0:2cf:4d9d:7135 with SMTP id
 d6-20020a05651c01c600b002cf4d9d7135mr433411ljn.65.1706278206955; 
 Fri, 26 Jan 2024 06:10:06 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1528:de00:74a1:34a:f78c:7883])
 by smtp.gmail.com with ESMTPSA id
 m23-20020aa7c497000000b0055c76eebbdbsm636427edq.30.2024.01.26.06.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 06:10:03 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: use GTT only as fallback for VRAM|GTT
Date: Fri, 26 Jan 2024 15:09:16 +0100
Message-Id: <20240126140916.1577-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240126140916.1577-1-christian.koenig@amd.com>
References: <20240126140916.1577-1-christian.koenig@amd.com>
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

Try to fill up VRAM as well by setting the busy flag on GTT allocations.

This fixes the issue that when VRAM was evacuated for suspend it's never
filled up again unless the application is restarted.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index b671b0665492..0eac179a387c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -173,6 +173,12 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 			abo->flags & AMDGPU_GEM_CREATE_PREEMPTIBLE ?
 			AMDGPU_PL_PREEMPT : TTM_PL_TT;
 		places[c].flags = 0;
+		/*
+		 * When GTT is just an alternative to VRAM make sure that we
+		 * only use it as fallback and still try to fill up VRAM first.
+		 */
+		if (domain & abo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM)
+			places[c].flags |= TTM_PL_FLAG_FALLBACK;
 		c++;
 	}
 
-- 
2.34.1

