Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B666E8B27
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC6510EBBB;
	Thu, 20 Apr 2023 07:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E859210E169;
 Wed, 19 Apr 2023 08:27:32 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-63b7588005fso2327424b3a.0; 
 Wed, 19 Apr 2023 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681892852; x=1684484852;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DZ6u9/CgweQ6jEZks/xNcF/T3qE4BW1KJoYmfltjmnY=;
 b=jDdzGmKUWx25EHLZZrgXq7aDt3wKPN6KbvpQblP4OzUqawFkruB9AZ0pTXtxj5uflb
 0Eg93b+jYxUjYMmYx/jMH4zSUgSvb3+F7scJZWp3r5jgRL+FYxXVDlT3UnX/DsD7JWyg
 2qfZvuXWGG4yxj7YwEr76JeXl8kZVrx7j2kLXxEZs4Ak6V9SYdtll2nEamGBQ2zh4sF5
 g/c4562wmL3t06jZ6GIixFAYw2GwQaEHdKqyq+QRcx+tpC6GAqm5xe9aetaBF9Fdrr5i
 sTEuBvnoZQr7Pm+C8xZTSVDKZS0eBfi7066zLUowoXXFsrwf36jV7pidMne/kJfXRRKB
 nmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681892852; x=1684484852;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DZ6u9/CgweQ6jEZks/xNcF/T3qE4BW1KJoYmfltjmnY=;
 b=YTRZa1JHOpJ4oY/NLOJGqSiV3rgbhSQaI35VpKJ0C3dRH5scJZjgxlw0RkZkmes4+c
 FLLBAKgKA6u9+Q1ilNhALLBfP8gz3sl98yTRAtirNE2sXsCDPkabbcOtw+I+vWcLB6KL
 Pl81FQzGpVcI1zlnqoO1XOXPDtin2IEsfkE0f/lWmvLbZGMPyqwcTcpWC9JXMwQuH5OG
 J8/QYWQOz393KMJtLj9NYchFfQr2ZIpnyjHy4UVhxjBxJpbj+xRdxK00OBpCGiIuqEbW
 QEnOvq13mDQ5VUK1XreUNZPLIDDbH/W1SrcemJgjK41Knre6lhYR3HC+33pxxyAJku+c
 n+gQ==
X-Gm-Message-State: AAQBX9div1ZTYFtzR81jz/ORjquURy8CWYDESpB63QEbxf72Xyb0LbPt
 eZXLFTB9Q+Fbi5CYUDJt1bk=
X-Google-Smtp-Source: AKy350ag1YslGcDUesBAO6cVpS0tdiEfRtWuJuAlBJdYCw1S/UrhRm6CndcjR0xKt+ywr/rYXpxrtg==
X-Received: by 2002:a17:903:708:b0:1a6:a375:cb49 with SMTP id
 kk8-20020a170903070800b001a6a375cb49mr3818668plb.39.1681892851691; 
 Wed, 19 Apr 2023 01:27:31 -0700 (PDT)
Received: from hackyzh-virtual-machine.localdomain ([58.34.53.146])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a170902b71300b001a6ebc39fd9sm4411339pls.309.2023.04.19.01.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 01:27:31 -0700 (PDT)
From: hackyzh002 <hackyzh002@gmail.com>
To: alexander.deucher@amd.com
Subject: [PATCH V2 2/2] drm/amdgpu: Fix integer overflow in amdgpu_cs_pass1
Date: Wed, 19 Apr 2023 16:27:05 +0800
Message-Id: <20230419082705.4110-1-hackyzh002@gmail.com>
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
+	size_t size;
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

