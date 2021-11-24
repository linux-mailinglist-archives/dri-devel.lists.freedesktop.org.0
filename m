Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC8245BE6F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 13:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6076E499;
	Wed, 24 Nov 2021 12:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390A26E0F1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 12:44:42 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a18so3968258wrn.6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 04:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8iHsc0fAePf2B4p6GyWVE8tAe1CGSwwITXdSJ37jDKk=;
 b=dgepN4LQTFDp527pJPBT4ZkmwEAuie27P94kl8/w4HbFydxvQ9rueAM+3x0IHrGmw8
 MDOg9iwEIJzcKdPGrWSlQP/VBTEtG0NPbD9e8SZnuOp5hBK7g80V/5k6XRGf1nxhJgao
 4tasZN7YYIUlFkAta4MtLRu87LiOhel2meiyzFJlDUTEQY+sCFviQxoWUPuilFraBkLu
 p8rZ1A4o3+xRR6yaAlRuQkTMhoMQAt/QcAjaKl+oWDezofXhoGiPr7hl8abxDtuHNO4R
 DzjOf6595e4uO9pRKrdSaaPPf2WpSz1eEOHDls/veETcD4AwgnnBRSdS9sgOTpcUrR2F
 Htkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8iHsc0fAePf2B4p6GyWVE8tAe1CGSwwITXdSJ37jDKk=;
 b=RdZLAC4CwjsiRPbuUvHaQuPfFyFYm7YdDDP/xoy7ham98TZkGNRjBD+2sGRHnsT3Hy
 SfDdb52yoS5Toi15ioMTArONDAiKZfa8B3Re8JXb2LIilkUqVP+E9yYh1DLCIbTjAItS
 FiNn33B8wZzhuA97EK2jRWzY9rlQf6orj/231AOYO8qQCHstnXkvHRiXih3gFb1KDDO9
 ZuANZa68KNurjo9yMYMDOGUM2+uxEnR6UnHGk/yxRTYTM7QM+zn6pqp1ef9ZbsZiXpq5
 nxmXlHGJH1NvBkHEhI4fguYjK6IsuUSll9COrojuHhKsC3PljOWKnUNkkhTb72JpNElF
 pYyA==
X-Gm-Message-State: AOAM532itp2HbMwbEVJBPvxi4KxH0Ix4MxdXKOyU9zJFMyjGm193I548
 uugAdTPNuI898MjihTb/VZc=
X-Google-Smtp-Source: ABdhPJz9RvwaamYDTeTagFZwc0G97fkVh6RweSktUcDONCIl2O/kV6P/vH4LsFBYtTpzS4YpKED5Hw==
X-Received: by 2002:adf:ec45:: with SMTP id w5mr18240862wrn.183.1637757880782; 
 Wed, 24 Nov 2021 04:44:40 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id 38sm15583145wrc.1.2021.11.24.04.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 04:44:40 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, thomas.hellstrom@linux.intel.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 09/12] drm/amdgpu: use ttm_resource_manager_debug
Date: Wed, 24 Nov 2021 13:44:27 +0100
Message-Id: <20211124124430.20859-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124124430.20859-1-christian.koenig@amd.com>
References: <20211124124430.20859-1-christian.koenig@amd.com>
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
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 9be56ecaf39a..62c328f23ff6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2082,7 +2082,7 @@ static int amdgpu_mm_vram_table_show(struct seq_file *m, void *unused)
 							    TTM_PL_VRAM);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -2100,7 +2100,7 @@ static int amdgpu_mm_tt_table_show(struct seq_file *m, void *unused)
 							    TTM_PL_TT);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -2111,7 +2111,7 @@ static int amdgpu_mm_gds_table_show(struct seq_file *m, void *unused)
 							    AMDGPU_PL_GDS);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -2122,7 +2122,7 @@ static int amdgpu_mm_gws_table_show(struct seq_file *m, void *unused)
 							    AMDGPU_PL_GWS);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -2133,7 +2133,7 @@ static int amdgpu_mm_oa_table_show(struct seq_file *m, void *unused)
 							    AMDGPU_PL_OA);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
-- 
2.25.1

