Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF256E8B1C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AF010EBB7;
	Thu, 20 Apr 2023 07:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797F210E1AB;
 Wed, 19 Apr 2023 08:58:07 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 s23-20020a17090aba1700b00247a8f0dd50so440785pjr.1; 
 Wed, 19 Apr 2023 01:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681894686; x=1684486686;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3zpvMjDc8PUDIFIffBUt+CiFgxX1fPBud4Kt6HqJXz8=;
 b=UtlW7QeLG94NWEB+dlWHbmjRnFYxbJOyvIGIfJLxjiZJWo8SZyBMKGSu71KsdnwYkM
 5Embc4NaJ3SRopVgqDxHW19iPNF3jiDTDgNow4AnPZhfVsPAXcYRUDzE1Vg8kwHbGJUD
 Jul3ZOIWXSqS2g+Yx3G3JGBEeRD5s3faZmYLtYfgoeuGOtaIwe0inEdi+yDJ2XrC4o8H
 C6Fmym88uYZ4psi3ZY8pPDaFiFCq2RZWCtlWPWIPlglDjw9gTAEpgU/1MgyiFw6Rw5Y2
 F0XB+yzdy9HPo3WvfTOqm4b5GZvfeXDVeSU9m4fgJCGIpN5Emu8pXWkG/fnCjF7VARx6
 /heA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681894686; x=1684486686;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3zpvMjDc8PUDIFIffBUt+CiFgxX1fPBud4Kt6HqJXz8=;
 b=Cg1aTyvUTixTtLuV9LOhbBsv1hkKDiMuq1KfTzGHBCQTjmZbnkXwoPNIoWAwjFw6hx
 MwxskmOA/OWybyzOEIc1FuKiBQd2lSDk12gIXjU4mLjQe1IFTcBamq2sZYUp+W7Nz0os
 wUwyldW/NxrTm/Se6emUk8IO/UIMVQzsU2us8qgaFU/DhGuw69rUOesP+J9IxCLEftXd
 GITbIyfdKN43bVD+zUjciqZTmbLnJpGatZEgr9YwzmmfpghAeNyDpwexX5lFua6wpkod
 mLPZbs/BdaUq9sdvybkYu4EKfN4LW61/D2PMRlMP0kzPhhFGD3Jj54Nb7pIsvfGRT3A6
 2esw==
X-Gm-Message-State: AAQBX9fbIlKBXYKEUQzLhHLTeOphf07pe7ISucPGIfj2XuN/fXzQkoR+
 a11tZWu71jzpzGyJqX75QZQ=
X-Google-Smtp-Source: AKy350ZsGA0KS7CsW/PhUED2oIMNWfU0ei4iNIRQe4Ug65OBD1ljL1KiruI2NorA2j6a8NNhWpDYRA==
X-Received: by 2002:a05:6a20:5493:b0:ef:ecaf:ff6d with SMTP id
 i19-20020a056a20549300b000efecafff6dmr2062989pzk.12.1681894686508; 
 Wed, 19 Apr 2023 01:58:06 -0700 (PDT)
Received: from hackyzh-virtual-machine.localdomain ([58.34.53.146])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a63d90a000000b0051b72ef978fsm8144902pgg.20.2023.04.19.01.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 01:58:05 -0700 (PDT)
From: hackyzh002 <hackyzh002@gmail.com>
To: alexander.deucher@amd.com
Subject: [PATCH v2 1/2] drm/radeon: Fix integer overflow in
 radeon_cs_parser_init
Date: Wed, 19 Apr 2023 16:57:47 +0800
Message-Id: <20230419085747.4720-1-hackyzh002@gmail.com>
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
 drivers/gpu/drm/radeon/radeon_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index 46a27ebf4..8e12b406e 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -270,7 +270,7 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data)
 {
 	struct drm_radeon_cs *cs = data;
 	uint64_t *chunk_array_ptr;
-	unsigned size, i;
+	u64 size, i;
 	u32 ring = RADEON_CS_RING_GFX;
 	s32 priority = 0;
 
-- 
2.34.1

