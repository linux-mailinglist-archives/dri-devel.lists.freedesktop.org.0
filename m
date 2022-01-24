Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEFB498051
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 14:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA4E10E5CC;
	Mon, 24 Jan 2022 13:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C9810E5CC;
 Mon, 24 Jan 2022 13:03:34 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l25so13440579wrb.13;
 Mon, 24 Jan 2022 05:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iln5gjTz62zqfYGlcLHz+tSndCkcbqCw4qI5vFOyxu0=;
 b=FtHZGsNcCMqHb5xGQRdkRgDH7RY0N6RZ6ivUXEw1s/MNexBi1c+CI3gtAY9Bv8brI1
 H3O/N1KMMFQVs1/envxvkYCilUUZlxpsTpL0TvzG/BLSlZPAlhy/cPZmWDgMM3MmJgfx
 OmPlwkliusrYX8Qf7OBR50y+pbNSSQMD33G0N1MhfeW+FcSJ3eBWo1+2LiJLjYQ2QaUQ
 JRyKrN8GVPmuqoSdHyAgT0toI9zbc0Zkdsb8rjia36TU00FmIWxdJHylIZpA4GaD1oQy
 H4mYax9UFCpO9Q1zNA7fLevRivELP4sOTpGi0fpSqol/Mu6h4VoiFRdgpw7qFAFD3c1y
 gRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iln5gjTz62zqfYGlcLHz+tSndCkcbqCw4qI5vFOyxu0=;
 b=eaSezEVWaCGRBQXCeV7V2Y+Sbea+QdQTyON2JkM53vJa6JtaU2h7aKhGi7h+mSSn75
 Zxn0vH2Lvvsv5s97eDSWFfCXlHHF6kBBQ83mdMWRnL+Ctu+hJECMJKZgs/1iuJqdGxUj
 Wem2rgFWmJmgBjVAmKJ7jatS/SFMZXcTbZj6kc/CuxgZNFhwENmeBhlLrM5qmOSN57Li
 AmxFKFVqmVLdQfPOU0hyPdqBSSZJNHVf2ujrxcUYM/pT+WHllB85SLbbn6kredTpXnuI
 jE4oGkmHk4gBIM0Kvw0kjsWEkxPDS0SjSquOpC4K8ytwDfoa95ZQrOMOUyteCYi+0GDl
 SX+Q==
X-Gm-Message-State: AOAM532q1Z+/qOZzheMAwH/nqdeH9lyhWtw6ftpYQqSxbtC2IVGMLXEl
 D09tvTaq6rTqs4+fx6YuUz4=
X-Google-Smtp-Source: ABdhPJx73TPcrcp4J6XlhIWaLhB6ba/1n7iR3MXQPOOTPOBZn9KdwnCJrygAK0v9RCLneem3MgsKXQ==
X-Received: by 2002:a5d:470b:: with SMTP id y11mr2845559wrq.122.1643029412475; 
 Mon, 24 Jan 2022 05:03:32 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id g4sm16543554wrd.12.2022.01.24.05.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 05:03:32 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 01/11] drm/radeon: use ttm_resource_manager_debug
Date: Mon, 24 Jan 2022 14:03:18 +0100
Message-Id: <20220124130328.2376-2-christian.koenig@amd.com>
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
 drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 11b21d605584..0d1283cdc8fb 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -802,7 +802,7 @@ static int radeon_mm_vram_dump_table_show(struct seq_file *m, void *unused)
 							    TTM_PL_VRAM);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -820,7 +820,7 @@ static int radeon_mm_gtt_dump_table_show(struct seq_file *m, void *unused)
 							    TTM_PL_TT);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
-- 
2.25.1

