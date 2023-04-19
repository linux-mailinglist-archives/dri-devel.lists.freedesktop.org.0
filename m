Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4A96E8B29
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C70E10EBC2;
	Thu, 20 Apr 2023 07:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B0210E08A;
 Wed, 19 Apr 2023 04:52:17 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1a682eee3baso17167585ad.0; 
 Tue, 18 Apr 2023 21:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681879936; x=1684471936;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ek00L1cc21EOyKRafT/BGo0L28SeYIDeaJNfXSoDXCk=;
 b=d+4BWM18QNx9T8dgCdsk3UsYNuvnf21SDCQFyquG/W2sADMBujm+iIWajisCKuKoxG
 R1VSJCKr1sX5EaaIxiWJ9XO0RVuA33BMi4vOnetn4QAV09WkxRK8PCOkuIi6ItRXhGKh
 q8A6NjgJujvmHHhkGqmnks1KiR23uvckaBpED9UuP27afZdSTNWqqCnJyt02KL3MDhJ7
 v909j7ReBDq8PNdCrjoqk7IwZdirR07mN/VwA4lJsdBY6K6u3pjpZIdiKGC0536W6i7q
 pzXBMTKpacWNp/o5Nj4/aCBbCz6k8k/EhmtDUpnzDe3V4oiVzNUPB2OYLhCtphGf28uy
 9AGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681879936; x=1684471936;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ek00L1cc21EOyKRafT/BGo0L28SeYIDeaJNfXSoDXCk=;
 b=jNroC2ETeu1eNDlogqwXe9cavjOQ/VnZU0TRXAZ2wsVM8gSsK3Gb/L/GpnXYHCxA98
 9zBZrDnkLJIEUt/dJQbAi76enpT4nNVrOZKqy6Fy+yw2c9NYLVqVtReyjRlXHy4AJ331
 c9jM/u+7YQCnYGu7N9PObuYDCvQxC8Ul4Dm6owD22e6DIBFKfLuhN/394OviHBe4WSTv
 752dAUh4GxnPo2MvFz3Z6W104UIMsU2OnuGLAQ3zQVOkcIH5sk9AnGWUfOMI+gpspCXJ
 J0qb3bAUArKlH3azMZkXf0jRRuI5u/2VsccUsakwOR6EAL3Q4G90YUycriKIKENdr5RQ
 Zz8w==
X-Gm-Message-State: AAQBX9fZh4yfM0ko9VyA83C3mBHgey4i5cx1SLSMymMOGRY/0Z7bseSI
 jKFRlLyjzWYP6dEa56qL6J/2T1wjkD2e5FQjh+o=
X-Google-Smtp-Source: AKy350aYkXkO5nxw+E17pu3EKWjttrdTBgY/iJvBuAu1+xFva4iSl0hDCqJM6NsevZ9568vkBqdsJg==
X-Received: by 2002:a17:902:8503:b0:19e:500b:517a with SMTP id
 bj3-20020a170902850300b0019e500b517amr3719378plb.69.1681879936118; 
 Tue, 18 Apr 2023 21:52:16 -0700 (PDT)
Received: from hackyzh-virtual-machine.localdomain ([58.34.53.146])
 by smtp.gmail.com with ESMTPSA id
 ix9-20020a170902f80900b001a64dbfc5d7sm10433184plb.145.2023.04.18.21.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 21:52:15 -0700 (PDT)
From: hackyzh002 <hackyzh002@gmail.com>
To: alexander.deucher@amd.com
Subject: [PATCH 2/2] drm/amdgpu: Fix integer overflow in amdgpu_cs_pass1
Date: Wed, 19 Apr 2023 12:51:57 +0800
Message-Id: <20230419045157.69829-1-hackyzh002@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 hackyzh002 <hackyzh002@gmail.com>, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The type of size is unsigned int, if size is 0x40000000, there will
be an integer overflow, size will be zero after size *= sizeof(uint32_t),
will cause uninitialized memory to be referenced later.

Signed-off-by: hackyzh002 <hackyzh002@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 08eced097..c17b3af85 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -192,7 +192,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 	uint64_t *chunk_array_user;
 	uint64_t *chunk_array;
 	uint32_t uf_offset = 0;
-	unsigned int size;
+	uint64_t int size;
 	int ret;
 	int i;
 
@@ -235,7 +235,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 		size = p->chunks[i].length_dw;
 		cdata = u64_to_user_ptr(user_chunk.chunk_data);
 
-		p->chunks[i].kdata = kvmalloc_array(size, sizeof(uint32_t),
+		p->chunks[i].kdata = kvcalloc(size, sizeof(uint32_t),
 						    GFP_KERNEL);
 		if (p->chunks[i].kdata == NULL) {
 			ret = -ENOMEM;
-- 
2.34.1

