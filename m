Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1263187BA20
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 10:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A415310E5FF;
	Thu, 14 Mar 2024 09:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aYXctcv1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162CF10F754
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 11:26:35 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d208be133bso77470391fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 04:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710329193; x=1710933993; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lfLsFRDMtbO4BOATAAgu9+j4r/MV0Lasvl2lY8+nWuI=;
 b=aYXctcv1nOBLXOF/50MGvmJV4r9QckyesK3jRb8rr6Xj1UuAvh++mm1Cl8UDVYkqmm
 BSXL1Lwr2kQqwgOOQ0hqL65cKPXylALKOuOvlKmniIWkQzZL1wYQZQSDqKAv2l8WWfp4
 1+k+u0WXHh+/KU7s3cK8t5i7JG19DCSha4fvvUNfW3f5B+t7mZHY377P+rSIzieR2cBn
 ahZmMdb7ZWuohNWGGGwgIIeXrNS8ZQU1N0C6+8jFl2dcxm0BzlZ2eC0QmmquvtJsCZen
 Cp+G8U0bibgPCLfEs2fmfwYc9iIBF7lx615S5B1rKvwKPz68TE/wvbf2Ah1MFSagZqIW
 E06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710329193; x=1710933993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lfLsFRDMtbO4BOATAAgu9+j4r/MV0Lasvl2lY8+nWuI=;
 b=wN+4b9IXbSvBP5W7IVSbG41+yjWOU6B5AkXnL9/5iWeHPTolOmLXrTa4JIYOINUg9n
 f2SCPesqbbfevMNafy6c+H0ibsoe8rjyBojKdF/cSu8HPOFneaUXqCt4XNUnm/vLrWG0
 POBqruZzbYVLT3nnTnM4R4o+20c1JYaB7Ln1YCkkXhNZv9qOShD4ta1CigbsZA4giG6+
 2bakCyoji8826t58DkhCrwNxNmWcBO/jrQrByduROdWDsH+5M696+Grqni2KOtrC3z5O
 OXu97d2xnf79hDT5dZrsTw/s+W8yfE88z7Gai5zqbT5sLUlFVy2SjuyFart/zSyJrJ+U
 fFAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYotTqmopbW9yKpudT6Xfkr4PTMvAe1w56/RiwssGNDMZgJl/bKG+MPuKtzuZJE92J5Ci9W+8iH9ENHLoVfSNnryjwt+5NF64OdYQf8Q3i
X-Gm-Message-State: AOJu0YzFpVqSR4x9lrZmyZGVwsO8ygulBupBOa/5aUgpeEimoNi0ldQ7
 1ZofrpMaSp9qu8A2H0fIdyjS/5VLxZjRjuQTSBG+iateCk9aNYHM
X-Google-Smtp-Source: AGHT+IE09mLx4VQegu+Vnd0FwZuy7/tra7X+S5yizQYa4igYpoiDi330J+2AjIJz1BQLwhk6pLz3rA==
X-Received: by 2002:ac2:5506:0:b0:512:a4ce:abaa with SMTP id
 j6-20020ac25506000000b00512a4ceabaamr7845165lfk.48.1710329192820; 
 Wed, 13 Mar 2024 04:26:32 -0700 (PDT)
Received: from localhost.localdomain ([212.22.67.162])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a19e045000000b00513201a0e56sm268249lfj.78.2024.03.13.04.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 04:26:32 -0700 (PDT)
From: Maxim Korotkov <korotkov.maxim.s@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Maxim Korotkov <korotkov.maxim.s@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, virtualization@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxim Korotkov <m.korotkov@securitycode.ru>
Subject: [PATCH] drm/bochs: avoided potential integer overflow
Date: Wed, 13 Mar 2024 14:25:18 +0300
Message-Id: <20240313112518.2030805-1-korotkov.maxim.s@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 14 Mar 2024 09:14:26 +0000
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

if the bochs_dispi_read() function returns a value between
0x8000 and 0xFFFF, then an overflow may occurs.

Found by Security Code and Linux Verification Center (linuxtesting.org)

Signed-off-by: Maxim Korotkov <m.korotkov@securitycode.ru>
---
 drivers/gpu/drm/tiny/bochs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index c23c9f0cf49c..ad31049f9779 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -240,7 +240,7 @@ static int bochs_hw_init(struct drm_device *dev)
 
 	id = bochs_dispi_read(bochs, VBE_DISPI_INDEX_ID);
 	mem = bochs_dispi_read(bochs, VBE_DISPI_INDEX_VIDEO_MEMORY_64K)
-		* 64 * 1024;
+		* mul_u32_u32(64, 1024);
 	if ((id & 0xfff0) != VBE_DISPI_ID0) {
 		DRM_ERROR("ID mismatch\n");
 		return -ENODEV;
-- 
2.34.1

