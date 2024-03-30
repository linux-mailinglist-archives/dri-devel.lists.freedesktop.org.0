Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1B2892B89
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 15:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BEC810E484;
	Sat, 30 Mar 2024 14:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JD0oqpQF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CEB10E4E5
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 14:12:07 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-5a496fde460so1636498eaf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 07:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711807926; x=1712412726;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5R0+AkTWI8QZwkAahS3FDyHG9j7KXHmvm4QW/s+hHfA=;
 b=JD0oqpQFuQRY2Gyaye5Z7iGI5yQg1uS4MewdW5ya6k3bFU27dKa3R8vFKy5Kn9S/Er
 YxECMj80DvXxclqKUQDJ72TtG3nGrBwzx4vPIyE/kvk0EhED7n2IaB8pt7s4Uz4Wk7mB
 sfyuLMr6eY5o+xK7/ia3ycGm/WOE3JGuBZplU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711807926; x=1712412726;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5R0+AkTWI8QZwkAahS3FDyHG9j7KXHmvm4QW/s+hHfA=;
 b=WnLWy9T3WVTCK5jerno4B3QZBh+SezWjTZGYYCWceAzluvaR459Dy6A+wZNCrkdVyB
 9utiSFz4DssQA6oVd8I0wYU6WlDMJ/tG91mBBFZdGbt6ifj8mkyAsqStu3GuWAbMVnmj
 8iC4Qti7qtn6qivDX8qZnsNxwbjZUH+xO67swcb8A0ed7cS8fsJmxZ75rpGLLatSJpGz
 JPuUutTQd8u+1f/ppNkNMLDWfJYQul7pCN/Y8T2m32LgUskXP9cifefsX98loWkRXBKs
 lQnwLCa0QCKXvmLZPMLsljMRjsVLVruIGEvQZmbF0c55WzjaC/qYaWIQ9cjdwaf32trf
 tQPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhcqi7w1YbSf9jAO6o26LWAoyhCvUG6xX5UnWMlpVK7YrxmzGxtStMWausWGkqGyvoLomV7MzW+vtHynhlG+m1wV3eyvKc8aEbXNGvMOBA
X-Gm-Message-State: AOJu0YzqypJ+LL+WctvYsDlSIejKlZESuA95/GM0oHPu7BA8oKI+oDTw
 CW5FUSlRM1LiTvXhcX3Wz282e8N3h28O9xPFa2dgoJQFSb6jWyLxhfFbi77MFA==
X-Google-Smtp-Source: AGHT+IEJtzUzuRZgSZPHVHwVuvYRyBRpL8kDmcK5MecWGpcsJm7ruAhRPpLIlgMAXixtWQGCSKy74g==
X-Received: by 2002:a05:6359:4121:b0:178:6c79:6ccf with SMTP id
 kh33-20020a056359412100b001786c796ccfmr5950622rwc.17.1711807926336; 
 Sat, 30 Mar 2024 07:12:06 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a63fb56000000b005dc4b562f6csm4607931pgj.3.2024.03.30.07.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 07:12:05 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Karol Herbst <kherbst@redhat.com>
Cc: Kees Cook <keescook@chromium.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Timur Tabi <ttabi@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH] nouveau/gsp: Avoid addressing beyond end of rpc->entries
Date: Sat, 30 Mar 2024 07:12:03 -0700
Message-Id: <20240330141159.work.063-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2226; i=keescook@chromium.org; 
 h=from:subject:message-id;
 bh=72NlypCU3m1Ai+nlWdQqXQ/FhzgDGtzVMmXe9FDsnK0=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBmCB2zFC4lHA+jf2TBWjM1ztczWQiNIUhah6PlJ
 NpV613q9s6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZggdswAKCRCJcvTf3G3A
 Ju46D/41X6YPEmbiOsUB+J4DpwOnPKKcWsCj004G4gCAGXDcM6V+h7frx+gzNYT4Rf8x4XsR+Jr
 rQie9X4uNZp2UqZjv6FoMoJ/4Fns8PwbjLF+l0gB/Fb9vnxXhMacWym6B8w+PswdMS16W9pSaen
 F5Zs8+sTbvHAaRXn3iZCPYx6ui3LhmHpqy/e7+pHVKnrj4FCMPmAuZYvV4anVze9FSq+nPmoFVe
 4z1zpNbj5Nty9xbyRYWwhQNfAB8YuZpgDUGoG1p2AdiphqV77NP//zHYPcHsfgP+y0JIz/5BUxR
 Lp65/01z/jPpJyAivKhVM2pvS3aEM7N8bTOuAaM+rtB1V3deWraWkypkkJSwRAtdxUTiXrnbr3Q
 zK1KtBGo7BRK6DVc03milid8NDHuHnIwNJM3w+/h3ePn0NlvlmBD9bJLoAajAl/hlrYTzTAak2Z
 VHzHA0SQ2Vhn9Etuq2ipHNQhNVT3u8txxcSJCBr6Q6RBWkaeHS+IXH4DIwvKkwbcmc2SZ7BehHC
 gecHXXvfcvmvsbcNQnJHTKr0dZmjQsZkf7YPzVfhrYvzU33RIoADtfHAmcVTQXZsVqXFZq5PRjO
 3LC4+FeijavF4l/RRJPr3Btg3mW8DmycJkmfTy3BiYHrt1lxWF488MN0zrq3NdSq2+JfZ8KkBrh
 pVR23AZ tcRpXu8A==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

Using the end of rpc->entries[] for addressing runs into both compile-time
and run-time detection of accessing beyond the end of the array. Use the
base pointer instead, since was allocated with the additional bytes for
storing the strings. Avoids the following warning in future GCC releases
with support for __counted_by:

In function 'fortify_memcpy_chk',
    inlined from 'r535_gsp_rpc_set_registry' at ../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1123:3:
../include/linux/fortify-string.h:553:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
  553 |                         __write_overflow_field(p_size_field, size);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

for this code:

	strings = (char *)&rpc->entries[NV_GSP_REG_NUM_ENTRIES];
	...
                memcpy(strings, r535_registry_entries[i].name, name_len);

Signed-off-by: Kees Cook <keescook@chromium.org>
---
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 9994cbd6f1c4..9858c1438aa7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1112,7 +1112,7 @@ r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
 	rpc->numEntries = NV_GSP_REG_NUM_ENTRIES;
 
 	str_offset = offsetof(typeof(*rpc), entries[NV_GSP_REG_NUM_ENTRIES]);
-	strings = (char *)&rpc->entries[NV_GSP_REG_NUM_ENTRIES];
+	strings = (char *)rpc + str_offset;
 	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++) {
 		int name_len = strlen(r535_registry_entries[i].name) + 1;
 
-- 
2.34.1

