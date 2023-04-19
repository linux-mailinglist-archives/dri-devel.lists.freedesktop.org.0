Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2584F6E8B2D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683A110EBC4;
	Thu, 20 Apr 2023 07:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF81B10E958;
 Wed, 19 Apr 2023 12:23:11 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1a645fd0c6dso24472135ad.1; 
 Wed, 19 Apr 2023 05:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681906991; x=1684498991;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vuo1R6zgWP4V7fxSrNGqI53skR4NUxsCW4UKtSQFHoQ=;
 b=iHj2EFKwjqQG5zGuh91t/HLTjhn98+Tm/JgEUgdtKzQYUcMmigmjFwJZQ27nAG8Bnn
 RHiWrB3TM8X4DXmmFUxo4NXSXOgDWYjPdgXCG/SYRg/5s9pd4KEAOJnc20QtgnF8qg52
 AUf1b2vXcFFtExWm9wshnbebzGLoILPKk6KmWinlkzij5YLgVKCJ7g26LmkyIfbTFQqg
 FLt59XmV42XHJ8E+dQGIJaHimuxqMmRFmogeMWa+pdUIzr2GIVnbyyyvr0DFJqmTfMVp
 0L9i+faJHasd1uXPnVTW5t6+PMtY5Nt+W/N4+KxTV6QfESQ7rL+ImLHb+Q4igKn6JFDk
 v/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681906991; x=1684498991;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vuo1R6zgWP4V7fxSrNGqI53skR4NUxsCW4UKtSQFHoQ=;
 b=WrnotGIsMckntjH0TzepvS/tzoDygc7LydLEvFUyitebFFddPGv5K7r/twz+NFa9XY
 iTnWWHSQ08ML4KMKIffxO/CgclGzAZxBde3xmWNJZT2viavm881NMd3WriMLWC760fLX
 KP2oYjdnYfInj5UJCCruJykEAKO1BlNsQ3ArtCiU0+ndaY8LYw4GrtT6EksdIBDv+B8F
 /qyyNARskNOfV9ZehT8Hc35GcnsPdH0zG1a2nvSS1ghZTlCoupPgIwYy0jcOFH4u5Z3G
 X6/iPVAdadYv9bgYRZoMfkylZ4F7nVcS92dZQ8+dpLjdZiUGkKNFCsMOd7N5RXIcSJ8y
 Ny6g==
X-Gm-Message-State: AAQBX9eVdDkXnePtSReVSY3rY4ROAkOrAyM63iWc0a57mKLmvRGKmxAm
 u7ZeFsCw9hcqzb1fEAPxYRQ=
X-Google-Smtp-Source: AKy350ZOvvzEVtaSNhWFtkSL5aX841ukA5rD+bJ6S5wFb5ZiUTOGTwRiL0CFdwfo4kCozHg/35yMcw==
X-Received: by 2002:a17:902:c410:b0:1a1:f0ad:8657 with SMTP id
 k16-20020a170902c41000b001a1f0ad8657mr7207596plk.37.1681906990803; 
 Wed, 19 Apr 2023 05:23:10 -0700 (PDT)
Received: from hackyzh-virtual-machine.localdomain ([112.64.53.154])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a170902d34b00b0019c32968271sm9053670plk.11.2023.04.19.05.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 05:23:10 -0700 (PDT)
From: hackyzh002 <hackyzh002@gmail.com>
To: alexander.deucher@amd.com
Subject: [PATCH v3 2/2] drm/amdgpu: Fix integer overflow in amdgpu_cs_pass1
Date: Wed, 19 Apr 2023 20:22:33 +0800
Message-Id: <20230419122233.3440-1-hackyzh002@gmail.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 08eced097..89bcacc65 100644
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
 
-- 
2.34.1

