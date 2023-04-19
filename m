Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0666E8B18
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE0610EBAA;
	Thu, 20 Apr 2023 07:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2D010E1C7;
 Wed, 19 Apr 2023 12:22:23 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 k65-20020a17090a3ec700b00247131783f7so731837pjc.0; 
 Wed, 19 Apr 2023 05:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681906943; x=1684498943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cvi/8BFVMUmJHt4WjuHDaXoszJBRcvvbnSWyynNb4dw=;
 b=M3A9a6WtOWXdYHHcfybW8ymSEnpEjD5R0HfAB1fZbrJ4eb18z3BbaIQkiZch+E3XFN
 gtImBttegWoB8LCoLFNJDhiiSl267YU1V1Nsc33I4Y18p03z0gGfjf/VdKUhfjZcBXD5
 aq+woQSFxs2Vu2JdQq610eO1TMJ0DviQoiqjfPoAGc/JAkBZ7fiCJzgpbt/FhH5BE7Zm
 0vjqLsxUHKPd4lYUtp5GXOSKExiXmujz3dv9bAp68j4aoXlww1GZg/PJ3faT06bwcuTO
 4QQaNsK1vvXfQuNxUKLhbD5rkeXzfHeIk527XpKrudr38a8q5hrfpyRQWEWtLb0bfx1u
 1w9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681906943; x=1684498943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cvi/8BFVMUmJHt4WjuHDaXoszJBRcvvbnSWyynNb4dw=;
 b=DP9GlRM4glcHNmS+7MFxq/pz8G4CEQC7sK6+9GHFbtMEP+Nk/QHTn6EawELr/sZbDd
 h9ELl3xtZajIwzQlONTH+Dw+rqfmuEe4pPdrrPkZzv5khLAiyn1pPRntziWQrDdnxXwC
 WUoLKZt8N+S0FiEQKVVZ2nAXJzbaAOXpsvTnx3x1wQAOO9RrIVhYEbeTTbMffYJ8TwAw
 sHOkRE/8ka/MrNjyawcaLPcmWnY7gaDAhWkWT8HrpkYpvPwAd1h0+UJvmqhTHCiOk8Ks
 vRgOnCamTih7xj/nX//sfw31PNck6hE4W432VhWu0MdrXIwblB/eaeICLymg9KFEWjDF
 F/XQ==
X-Gm-Message-State: AAQBX9fKEtNMhlr1oC29BqiXpc3HU9xZfTF7bHrYj6VkqGyu1NVS+yKW
 Lw7wsg2T9TSjb6Bfk7BP+nU=
X-Google-Smtp-Source: AKy350YunIiQ3rSxoOx6P/gwromJ6KqxNFKy+BHVTeuXJi6xVHlbz9D1gBHrAJqbGAdA5qNa2rmVAg==
X-Received: by 2002:a05:6a20:3d1a:b0:ee:7694:f069 with SMTP id
 y26-20020a056a203d1a00b000ee7694f069mr3643470pzi.41.1681906942789; 
 Wed, 19 Apr 2023 05:22:22 -0700 (PDT)
Received: from hackyzh-virtual-machine.localdomain ([112.64.53.154])
 by smtp.gmail.com with ESMTPSA id
 ft2-20020a17090b0f8200b002471f34d5ddsm1279106pjb.55.2023.04.19.05.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 05:22:22 -0700 (PDT)
From: hackyzh002 <hackyzh002@gmail.com>
To: alexander.deucher@amd.com
Subject: [PATCH V3 1/2] drm/radeon: Fix integer overflow in
 radeon_cs_parser_init
Date: Wed, 19 Apr 2023 20:20:58 +0800
Message-Id: <20230419122058.3420-1-hackyzh002@gmail.com>
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

The type of size is unsigned, if size is 0x40000000, there will be an
integer overflow, size will be zero after size *= sizeof(uint32_t),
will cause uninitialized memory to be referenced later

Signed-off-by: hackyzh002 <hackyzh002@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_cs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index 46a27ebf4..a6700d727 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -270,7 +270,8 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data)
 {
 	struct drm_radeon_cs *cs = data;
 	uint64_t *chunk_array_ptr;
-	unsigned size, i;
+	u64 size;
+	unsigned i;
 	u32 ring = RADEON_CS_RING_GFX;
 	s32 priority = 0;
 
-- 
2.34.1

