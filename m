Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070AE666C5C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 09:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9936410E88F;
	Thu, 12 Jan 2023 08:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C8C10E888;
 Thu, 12 Jan 2023 07:18:46 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id r18so12165459pgr.12;
 Wed, 11 Jan 2023 23:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UDSVYKBNF2+Uy+iLNC5V0cr7qiLHD6nPA7wwnGptmgE=;
 b=SijGG49NZHdI1KNM+q13z6V78bOY7XyDD6HAs474o0IjHEkHj57jWZBXi4RWTHkifD
 pY0kXWrxRJgkaaZMeRuiHTKfz41QF01vcK8r0DwR+a5Fp45ftlUykQqAtwDKVAp5inKA
 TgWzdgKzm6hU2Bojxi5+zYOPgEs1Triw2BYpBl51NwbGYBgA2UIvT+iPxk7Jm+zeWp7M
 DsZa+dSnR6q20RsGSLEot1ZrQAr04dx4ABX0zA4B2aQ1aInJ5bS39y5FMT6xMPzscQwR
 xkuAhZP0tzGvfWNu25b5AmnuK+5+U0C0P1fv8gjo95guqzF1+eGgDSxwR8cfUYHmoOT5
 Jwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UDSVYKBNF2+Uy+iLNC5V0cr7qiLHD6nPA7wwnGptmgE=;
 b=OLjz18+9PkMgeE7RBz/ftU1AU8gK6wnku1D4fH1XtJ/LfD622RBgm/A4xAKhgT3ABS
 fpJxoj7HBIBasUxk5XdN4Wc02komchQK/uFlnvrvoWu2962iujhyzfu/HJWGZRVyGPtN
 SWPJarYre/8f48bBFS83TF1vTLH6p70CY53hed6W/yYC4ujIKyPhkIGBYINtKIcaeNAQ
 VJI2LOps4XIuFXLimZvAvVnnIITrT9VfSshFIlhIGgx3xGWTbFj+z5IqNgLXFoyWQ4Bq
 IFpFeG0t7OMl1KTi/gab1/3zJRwzuFjdh8e0BMliU3J/D76e9w1MsGLcMwimLro1hSzr
 uLOg==
X-Gm-Message-State: AFqh2krOiA/ahpVKcm3Ub/aA5I6sBlXPSCLsLcuCCKkdBAdvXrNVKtSG
 y/snmzmI1HH3mfJ24wH4rTelFb61FQQYqQ==
X-Google-Smtp-Source: AMrXdXuZYt2mUlQGkVh+q0eNdji128F4aLy4TNV26HWjm8aiwgOEHsgMnZSu+LHtNx6YoVKwe8NlSQ==
X-Received: by 2002:a62:6d03:0:b0:582:998a:bed5 with SMTP id
 i3-20020a626d03000000b00582998abed5mr4990282pfc.23.1673507926535; 
 Wed, 11 Jan 2023 23:18:46 -0800 (PST)
Received: from localhost.localdomain ([43.132.141.9])
 by smtp.gmail.com with ESMTPSA id
 e17-20020aa798d1000000b0058ba98f16a3sm289121pfm.171.2023.01.11.23.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 23:18:46 -0800 (PST)
From: korantwork@gmail.com
To: bskeggs@redhat.com, kherbst@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/mmu: Fix an UAF issue in NVKM
Date: Thu, 12 Jan 2023 15:18:42 +0800
Message-Id: <20230112071842.819123-1-korantwork@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 12 Jan 2023 08:26:18 +0000
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
Cc: nouveau@lists.freedesktop.org, loydlv <loydlv@tencent.com>,
 Xinghui Li <korantli@tencent.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xinghui Li <korantli@tencent.com>

In nvkm_mem_new_host, the mem is be alloced. And mem->memory is
assigned to pmemory. During this process, the mem will be free if
the error occurs. But the *pmemory still points to the &mem->memory
which has been relased.Laterly, the nvkm_memory_unref will put the
memory which points to the pmemory again.So, we set the *pmemory to
NULL to avoid UAF issue.

Reported-by: loydlv <loydlv@tencent.com>
Signed-off-by: Xinghui Li <korantli@tencent.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mem.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mem.c
index 92e363dbbc5a..ab30eb1fc0a3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mem.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mem.c
@@ -185,6 +185,7 @@ nvkm_mem_new_host(struct nvkm_mmu *mmu, int type, u8 page, u64 size,
 	} else
 	if ( (ret = nvif_unvers(ret, &argv, &argc, args->vn))) {
 		kfree(mem);
+		*pmemory = NULL;
 		return ret;
 	}
 
-- 
2.31.1

