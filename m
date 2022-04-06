Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC3F4F7787
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 09:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A4D10E098;
	Thu,  7 Apr 2022 07:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682B210E03B;
 Wed,  6 Apr 2022 16:50:53 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id b21so5132325lfb.5;
 Wed, 06 Apr 2022 09:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7mcxCMUsY68b1C+y1FYJV5SZRpo8yl4CCyl7R2mFnT0=;
 b=LCXDwOcQDeA5enlC7K6Ie77FKlqGpjFTFPq/iH0xIFNgegH0lHp95s3B+k5PMn1p/5
 D75OJnHRVlBjkfYEjU5hiEStLBBWmsnq+vlJV/wJ2DaovZetBIyCfgo4YUqsa1CvJ7w3
 kdQUr8kMDa2qI7EbHIxcPRqt68eA7k4Bl0zlKcog6azWtr9r4fpfXH7fE+9Ph459D6ve
 cdOgD8Zjzi8jethjodBKELXCjaKfot89VjplCw28l6k9HK2APqZ5735RRtYm9Sw8nTU7
 WLTvHCCfFpSeVql5Oi6KjsyyTTfgSySWDDbIcOH1l82MVLXbZWQ9vbpt8O5H6prPfYm/
 AL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7mcxCMUsY68b1C+y1FYJV5SZRpo8yl4CCyl7R2mFnT0=;
 b=OKYa8Pup8pVcCkMGWoXIRjM/CKiUOtqODgGotPSp7Dw36aFL0UjtQc4rq+utIOGxer
 GO414hnsZBNKBr/sspNo49HWU5ivgC7wzS7joTh9gMatLBbztz8+dDaBShyxaqzE4+Fh
 tdWTtET307+QwbAvkwO1xvcvXSnepvzuICbYXJ+f9YLkbgFPqMrLddnwmriN9CM7k4u7
 CG0oWHONjJcBngelVzWqrQQguuQFSIOhFu7sdjq13aQpWPl2mNOrvw/pUG1lf9wTdjE+
 AUWidkpSAHYK1TiXnhYQbclC3KokXhPcphBH/ij9mM55I2MTJOPcFrYcxw+wewJcJiAE
 BxYQ==
X-Gm-Message-State: AOAM531k6ky2zrl02ognbe1mARg9CaOgqCBs0b4zX7Obnhe6qsmwMyW8
 RXRrtRoo6I5IV65pIY8WUlo=
X-Google-Smtp-Source: ABdhPJzPCpdf6bHUll904yF8Otv10ELarDhb1BAS3riXpkas1kvTZGd3KYrfieHGJ3plUkcvkm/2ZQ==
X-Received: by 2002:a05:6512:108f:b0:44a:4317:a066 with SMTP id
 j15-20020a056512108f00b0044a4317a066mr6614576lfg.236.1649263851576; 
 Wed, 06 Apr 2022 09:50:51 -0700 (PDT)
Received: from noname.. ([2a02:2698:8c2a:226e:6d9:f5ff:fecb:a8ab])
 by smtp.googlemail.com with ESMTPSA id
 k9-20020a056512330900b0044a1be3bdbbsm1877872lfe.196.2022.04.06.09.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 09:50:51 -0700 (PDT)
From: Grigory Vasilyev <h0tc0d3@gmail.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH] drm/amdgpu: Fix code with incorrect enum type
Date: Wed,  6 Apr 2022 19:50:56 +0300
Message-Id: <20220406165057.97492-1-h0tc0d3@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 07 Apr 2022 07:32:25 +0000
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
Cc: Joseph Greathouse <Joseph.Greathouse@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, Grigory Vasilyev <h0tc0d3@gmail.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of the 'amdgpu_ring_priority_level' type,
the 'amdgpu_gfx_pipe_priority' type was used,
which is an error when setting ring priority.
This is a minor error, but may cause problems in the future.

Instead of AMDGPU_RING_PRIO_2 = 2, we can use AMDGPU_RING_PRIO_MAX = 3,
but AMDGPU_RING_PRIO_2 = 2 is used for compatibility with
AMDGPU_GFX_PIPE_PRIO_HIGH = 2, and not change the behavior of the
code.

Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 5554084ec1f1..9bc26395f833 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -1929,7 +1929,7 @@ static int gfx_v8_0_compute_ring_init(struct amdgpu_device *adev, int ring_id,
 		+ ring->pipe;
 
 	hw_prio = amdgpu_gfx_is_high_priority_compute_queue(adev, ring) ?
-			AMDGPU_GFX_PIPE_PRIO_HIGH : AMDGPU_RING_PRIO_DEFAULT;
+			AMDGPU_RING_PRIO_2 : AMDGPU_RING_PRIO_DEFAULT;
 	/* type-2 packets are deprecated on MEC, use type-3 instead */
 	r = amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, irq_type,
 			     hw_prio, NULL);
-- 
2.35.1

