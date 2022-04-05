Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B87E24F5725
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 10:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730E910E46C;
	Wed,  6 Apr 2022 08:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25C510ED94;
 Tue,  5 Apr 2022 17:36:29 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id b43so18015076ljr.10;
 Tue, 05 Apr 2022 10:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hKOYgRsFR0laaLuRCNcCw4kzlI2NLR4gbF3cCQ5uqJo=;
 b=BVr2YLDF7/GGyceZtEIm5ngSV0ZtewWefzWQMZJrDgToXi9Raa7zKK44DLjRVzPSqP
 rsZLh6unBOu9b8DWnbG/ulO/wlcI8YZUN880shObyr6Um/tVfTBF3cpDo2m1IIKVXFXc
 zuEn6HEaMmx6K8GTOTGE4Mblhp0TiZE2FitQh5Rr8gfwTotRoebmdrpUBkbSJQqBH8oj
 W1xHElC1X+BR49CMwpETUiRpdxyPiM6vQ59CHEktyrUKPaIaztu332GBp/js3CB90ZAn
 r78X3f+ujP//edJmpYijII+/KADwpeHvELEGDupRr4+0b1KDmJ35cLhgmUM4MdeHvqp9
 rfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hKOYgRsFR0laaLuRCNcCw4kzlI2NLR4gbF3cCQ5uqJo=;
 b=2S5QDRXMqVOtg/SXYzs8aa6E28w7J4ngqzmz9/8GOx5sw582u7dTzzL/AytZmZXy/e
 7i8Y+Uv3L5rrshJ6r31ZnVOPyYh2roH4ItY/ppx0HmpeOhWWn68SvLWhCw3MKrX0zWWM
 seOxAvuN9ybVxMBDqo9OSPULrBBFhvh9Xa6wcakOBchC7oPrpQtW5bMMcc8SyGk3MMvs
 175ejgw23cUVI0McvjofGvcyiSWvqhjF87U4LXBURm2H4fpx+mrTZUDnqn6n3m74xOfR
 gIjskO3UFZBQkoqXyL8YnVtcH53DZbB89Tes6PC6XY6SHSb/7wgmVDbrc9EgFeJyP1RG
 tDwQ==
X-Gm-Message-State: AOAM5336PlTLsNGZkvahB9VOaXBsE4mMsgH/upHPhhxBZvlBGMglUebp
 gmX9Om27ToVgWFn1El2j8Xw=
X-Google-Smtp-Source: ABdhPJx9gURcfFhpkbU9G9qwJXgvTRqcQU7EZfhQn5YZ/YhwpA3vtsYFCnXigwEL5XUSIkyEiMsvQQ==
X-Received: by 2002:a2e:a490:0:b0:249:894b:ce20 with SMTP id
 h16-20020a2ea490000000b00249894bce20mr2753320lji.301.1649180187930; 
 Tue, 05 Apr 2022 10:36:27 -0700 (PDT)
Received: from noname.. ([2a02:2698:8c2a:226e:6d9:f5ff:fecb:a8ab])
 by smtp.googlemail.com with ESMTPSA id
 j11-20020a196e0b000000b0044a3f007893sm1563825lfc.286.2022.04.05.10.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 10:36:27 -0700 (PDT)
From: Grigory Vasilyev <h0tc0d3@gmail.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH] drm/amdgpu: Senseless code and unnecessary memset
Date: Tue,  5 Apr 2022 20:36:31 +0300
Message-Id: <20220405173632.2663-1-h0tc0d3@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 Apr 2022 08:00:38 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, Jiawei Gu <Jiawei.Gu@amd.com>,
 Grigory Vasilyev <h0tc0d3@gmail.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using memset on local arrays before exiting the function is pointless.
Compilator will remove this code. Also for local arrays is preferable to
use {0} instead of memset. Mistakes are often made when working with
memset.

Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/atom.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index be9d61bcb8ae..537e48fbbe6b 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -1538,11 +1538,9 @@ struct atom_context *amdgpu_atom_parse(struct card_info *card, void *bios)
 int amdgpu_atom_asic_init(struct atom_context *ctx)
 {
 	int hwi = CU16(ctx->data_table + ATOM_DATA_FWI_PTR);
-	uint32_t ps[16];
+	uint32_t ps[16] = {0};
 	int ret;
 
-	memset(ps, 0, 64);
-
 	ps[0] = cpu_to_le32(CU32(hwi + ATOM_FWI_DEFSCLK_PTR));
 	ps[1] = cpu_to_le32(CU32(hwi + ATOM_FWI_DEFMCLK_PTR));
 	if (!ps[0] || !ps[1])
@@ -1551,10 +1549,6 @@ int amdgpu_atom_asic_init(struct atom_context *ctx)
 	if (!CU16(ctx->cmd_table + 4 + 2 * ATOM_CMD_INIT))
 		return 1;
 	ret = amdgpu_atom_execute_table(ctx, ATOM_CMD_INIT, ps);
-	if (ret)
-		return ret;
-
-	memset(ps, 0, 64);
 
 	return ret;
 }
-- 
2.35.1

