Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A27397328
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 14:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C916EA31;
	Tue,  1 Jun 2021 12:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A3F6E92F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 12:25:33 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id k7so11834885ejv.12
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 05:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EWs6SPWoQkgdAkdLURcKJ0gLgWOX+pgv/leiPSJhQKk=;
 b=o0pUP/feiIX54q0qh14Bjrikp1QJmXRPz9OnKf6D0Y2mEGR9ejmYGCBfmko96UvdsD
 3oscN2Bjwxz8tbfNdQORGynQEUlKeFTcs0+V65Lx6CkQUmgVZM4jGGxhb2GR6hPNjDGT
 ntx9uN8shMw1zGcsVBDM6gmloonGgXlz6zfYG5n2Qtr/1ZInKthDvL/oYK7q7HUsikn4
 RFkRpq0IT1EB4LODE7iw3jWPhEiW1TIy3oJVpGDfU3kiJ8YBdus3j5rZR43x3MuRcGUX
 2ScCYesbZVdO3TehBwlNDRLUlyCCdx4eF+KEeFQh+vzUCqJD/iMl9FG8DFtIDXJ2F+5G
 E29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EWs6SPWoQkgdAkdLURcKJ0gLgWOX+pgv/leiPSJhQKk=;
 b=K/Xgu5AYKcmA7+VFsOPc+418wY9r8F0a+XZlGiE3zKNH1neIV+bZ/4St3QhvtHUS9n
 kg5atmA0IZOLxBWTTYs4fJzATd8BHFMiQi23ohBbNcWr1kj8GwiLB6x+MYkifX5qFvrq
 lcSWwW8guc3fW/eQSZCYcDXA+UCXvIq9PU8vRBrv3sX4V5eV/UlIF72D9DuzEyHeTKfw
 YDHPaRdfqhFpuew/1y7HGc/pqDncfO/tVRjKHnBchO5KrEsYxTnAtnN0wK2kLr/E0de/
 0jRLdRqENsBf4QPDAIEOU4n/9+ouOLnPKJEXtDnDuCSR6WTEA5XggpDHEpY8v9Rc9tUg
 +rKQ==
X-Gm-Message-State: AOAM532YkzWwtZtuzEo5BGhdJb14/GEKairYT9oKUbRgwlSvagJK+p/k
 DhApY5AxfJoE5d91x1F7eXGeFwpgRhY=
X-Google-Smtp-Source: ABdhPJyNdqS+mJjzzRTuC5z33DeLD+JGASmPM8kSdeBlt2JiCK41OEA0ebzLLeTiwuiv4d/gihhU4g==
X-Received: by 2002:a17:906:a398:: with SMTP id
 k24mr20290995ejz.203.1622550331883; 
 Tue, 01 Jun 2021 05:25:31 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fba0:a784:4c4a:8bc0])
 by smtp.gmail.com with ESMTPSA id f7sm8534845edd.5.2021.06.01.05.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 05:25:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Lang.Yu@amd.com,
	thomas_os@shipmail.org
Subject: [PATCH 3/4] drm/amdgpu: always allow evicting to SYSTEM domain
Date: Tue,  1 Jun 2021 14:25:27 +0200
Message-Id: <20210601122528.1643-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601122528.1643-1-christian.koenig@amd.com>
References: <20210601122528.1643-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When we run out of GTT we should still be able to evict VRAM->SYSTEM
with a bounce bufferdrm/amdgpu: always allow evicting to SYSTEM domain

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 6bdff9005a47..0faf9765ef41 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -147,14 +147,16 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 			 * BOs to be evicted from VRAM
 			 */
 			amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_VRAM |
-							 AMDGPU_GEM_DOMAIN_GTT);
+							AMDGPU_GEM_DOMAIN_GTT |
+							AMDGPU_GEM_DOMAIN_CPU);
 			abo->placements[0].fpfn = adev->gmc.visible_vram_size >> PAGE_SHIFT;
 			abo->placements[0].lpfn = 0;
 			abo->placement.busy_placement = &abo->placements[1];
 			abo->placement.num_busy_placement = 1;
 		} else {
 			/* Move to GTT memory */
-			amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_GTT);
+			amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_GTT |
+							AMDGPU_GEM_DOMAIN_CPU);
 		}
 		break;
 	case TTM_PL_TT:
-- 
2.25.1

