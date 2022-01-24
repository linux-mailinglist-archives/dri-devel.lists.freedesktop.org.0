Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF7049805A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 14:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3FF710EA98;
	Mon, 24 Jan 2022 13:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C1410E7DE;
 Mon, 24 Jan 2022 13:03:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v13so13444323wrv.10;
 Mon, 24 Jan 2022 05:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=r0nXcZqVGQ6Ta4bR5kQnQWxyJcyVFZB12g3PuPb0C9w=;
 b=nftL/d7gjyMEVVqsmMsHQvvAHZjqRoZ87F4j8U53Z9SJqdadiTw6wNOpuacpXloMF7
 mM2hanVVVbDCcS/uSnaRZJC019c85wYViQ5ztmnWHsRnb2Lrm6MfWE3TyXhQJMrs9yQA
 ZKTahxOYqEsb0xrlWhkYMrAkBgsIxGXaoLjDjl799P/xlWA+ajY8cPeTdXXGEIOw5AaR
 X27W5xQhEWV9lGeJBNMQEcn8sa8MF/c5UhuSC1xUxvBHFj6loLfGu6TxVEM4M3NuhYHe
 0koUaI1OB+aYjgH0cNn12jKctMsw42vABGE9K+KKvQzXfVpNjzvQvt6tAkoiyc3IOkOV
 kRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r0nXcZqVGQ6Ta4bR5kQnQWxyJcyVFZB12g3PuPb0C9w=;
 b=C3pTJLnjZJVy/dFbO3t0MXHBshgn6ga9AH+YEueD3zzV5y0epnDcbc1tijgZVom52/
 0jvgUMUCFIzv2+uERmPU5BRwjSjwEdiv6Wke1cKbcPF/THq8Za6VmpLbEXn4uekFjDPT
 9FvtWDNYnhmLdK6NFcdAJkaPiOd6Fin49OHS1HovxoTqet5rMd1WFOHYSr1JKDI68DmX
 4o6kEAIjphKYUBj+CkotAG5WqoZbXArV21iFQjkPK0+Me6Q003iVOIEbAnQGCQACJqkB
 OJ33pllwUdYcSgYBJ6mMEDoTnJPNS5jK+b8Sz+7QeBqREyie1RNejxaBhLlhvqAbTak2
 xkcA==
X-Gm-Message-State: AOAM530J9QijaEZ7lPfYQjgioMa1MaI5n7SjWnP8zTKgpuarkkzomn7R
 cosCa+1/Ma9tfNgyfB6nncA=
X-Google-Smtp-Source: ABdhPJz2zt//EU8ROABvVL+unJmuxPgWOCUhgF7nNeJ9i10SZvbdXAJUV6qDThFd6rwZC53Myvv24Q==
X-Received: by 2002:adf:e806:: with SMTP id o6mr14903326wrm.331.1643029413522; 
 Mon, 24 Jan 2022 05:03:33 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id g4sm16543554wrd.12.2022.01.24.05.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 05:03:33 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 02/11] drm/amdgpu: use ttm_resource_manager_debug
Date: Mon, 24 Jan 2022 14:03:19 +0100
Message-Id: <20220124130328.2376-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124130328.2376-1-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
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

Instead of calling the debug operation directly.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Huang Rui <ray.huang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index fb0d8bffdce2..eac2ff4647e3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2076,7 +2076,7 @@ static int amdgpu_mm_vram_table_show(struct seq_file *m, void *unused)
 							    TTM_PL_VRAM);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -2094,7 +2094,7 @@ static int amdgpu_mm_tt_table_show(struct seq_file *m, void *unused)
 							    TTM_PL_TT);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -2105,7 +2105,7 @@ static int amdgpu_mm_gds_table_show(struct seq_file *m, void *unused)
 							    AMDGPU_PL_GDS);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -2116,7 +2116,7 @@ static int amdgpu_mm_gws_table_show(struct seq_file *m, void *unused)
 							    AMDGPU_PL_GWS);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -2127,7 +2127,7 @@ static int amdgpu_mm_oa_table_show(struct seq_file *m, void *unused)
 							    AMDGPU_PL_OA);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
-- 
2.25.1

