Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 326C186CA71
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 14:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430C510E14D;
	Thu, 29 Feb 2024 13:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DDDQTuhT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E1210E14D;
 Thu, 29 Feb 2024 13:40:07 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a3ed9cae56fso392996366b.1; 
 Thu, 29 Feb 2024 05:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709214005; x=1709818805; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EsD9duYaaP/guPxTYG25ecMaCbHiDY/ZqhIHI87Zhf8=;
 b=DDDQTuhTM6MrNU46kpsHahHan80ufzfSTWxDKeiXGag9eoGJ/vodzGFWfb+sQi4Mfz
 MmDfdRwpiMnu6QiRRfUH/W0dqZRRkq8pOkrgfKzVTSkCs16xwBf6jD6VQ1ndAI8iP/ev
 nOzjULYUpC4aNQEkuvWPNLodavtVNqFIVWpu3AYFwzaAX6FCOG9tThydKGChcFVktXrz
 XeGOoglE8XrPL86NFOMuy9WJLsjYjSUpmgbXqitLcbf893ggfiK+hnNpjtUNk06s24+g
 ezInE6CBbjqoNR9wJgAB+65TiHqaNU1p9bdLBTNKDYM2OnxYq3nWNlmAR8BBqio9+Fad
 EGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709214005; x=1709818805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EsD9duYaaP/guPxTYG25ecMaCbHiDY/ZqhIHI87Zhf8=;
 b=I7gzj5CRg1KFka2MB9IOergkWrRpei3tt8Rt+nj2lwxkjB70Xxi9+iylJCESui6jN0
 yhu/QwckrbJ4RTQXSMeTHj06h+ZSeI2C1KslgBa8ujP/Ybr1WRL1z6s9s9jqvy0osvhF
 jI4jJb0JHgYXQHKrhf4uEIRVHDkGNOK27AZUNQbH906lYVyK/8rs59rFKMlR9TKZJGCv
 rOstWN/JHtreD7T0N87F8HklPvpR9d45rS2K55QzD7kfDOhyuvLwloYMXu37qRxAU5aa
 UPtzFV5y0VuUTVQHX79Os0S1vDGVhUrvZ5GbvJs7wwzU/dj2wHORkArGTChLxveDHmlT
 d0zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQQgmFi0MYHuDMIXV+So/r5SwTT7oq22dFoIM+aiEYtZCNUvNmW9zU+bdFafTqsufSTkP0IVDGq9DmV+b3yg8u+sERAkj0JW0K5FXOZjDkEmVPjKk28rT7nWDuKm9PGkL79kynJFWUee4uX4XoK91USYdwyz2nIWYHpdt3YiWC+YjBH+OeNBd+uHCHwpTSIg==
X-Gm-Message-State: AOJu0YzVXgF0XOxcRl+ECv982CPsxYoiCP0NYgT1tXn0LjbRzV38Irti
 RDBn843q0C0pyfuCpyVphEGuwkvrRz9QNg0XuNsmNw8soUnk81il
X-Google-Smtp-Source: AGHT+IGmoMWPdN+QD3+ShE1Q9nuwX6oAOM5DSiXBvLPNPDsB4d1jYwwHqT0JV7b38lqG/ISJbsWc5w==
X-Received: by 2002:a17:906:f107:b0:a44:690:86de with SMTP id
 gv7-20020a170906f10700b00a44069086demr1569347ejb.0.1709214005453; 
 Thu, 29 Feb 2024 05:40:05 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15dd:1300:6947:88a8:d838:c55])
 by smtp.gmail.com with ESMTPSA id
 pv25-20020a170907209900b00a3ee9305b02sm698153ejb.20.2024.02.29.05.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 05:40:05 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: use GTT only as fallback for VRAM|GTT
Date: Thu, 29 Feb 2024 14:40:03 +0100
Message-Id: <20240229134003.3688-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229134003.3688-1-christian.koenig@amd.com>
References: <20240229134003.3688-1-christian.koenig@amd.com>
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
index 010b0cb7693c..8bc79924d171 100644
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

