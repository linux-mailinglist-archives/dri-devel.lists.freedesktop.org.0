Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33A251A628
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 18:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2B210FA97;
	Wed,  4 May 2022 16:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE6610F955
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 16:50:20 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j15so2849929wrb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ME8Vb8gxqOIl8C5dNwfrWec0fnVNMEI4H6/gIen6nk=;
 b=LsmoXB53RuJklEcAgoP/lhVs9xJZkWQ06se27ShvPyND9EE+eyYD9CCqgS6XuWxXpt
 J95ed7Oav/B3VQtu596CkZR50FD2mkVQyQXNc2NoxDdS5BzmW0YqgMgmZE2o9ELoYVe8
 0k7hUa+2OGZQyhVPf7PvANlWUneKvKK22k6j6DqKQ98fW/hDAx+68xt8sd6twMiwHa1E
 trZqNqXCVaURz1kW3e5jwtWHgzfbqdIM60Wc8X/PXQ+wURfqAg3529CaoEWFcbGRHoL5
 1vpjBtP8geQUBPHs5MoO9fCG6fddXTn909fVZ52lZN3qdgw9h4yr5RE3b7Vyuid2UwTQ
 l0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ME8Vb8gxqOIl8C5dNwfrWec0fnVNMEI4H6/gIen6nk=;
 b=ogVMJs/YbLNd+B+pO83pr7nrt5WeAgt0esaIZOiX12UU5280DF4/GcVAz6K9ba8ykh
 3hBXELqZDl7r9lP/PH+TlLclCcb7I1HH+77OLzJ21pGihFZZPdOEYyPT5M5HkdcinY//
 JmauTJZyU1cE4g7R3s48R0z4WBU4eoscPfYgEOcAbd9qVZUsVn/fEomz/juvGQzQTcZB
 eMnTDX6E55753mJJ3s69/iSYauf2R+uUtoY4FirBzQAy7CqH2XeFpn7XmyyAtHj+NgIH
 JIG0ZLhZnb2kAaACQZjU4nqFpp4MBd/5+XAjbg/unPR20MZBpE/RR4cn07jtH8wKC/pL
 h8eA==
X-Gm-Message-State: AOAM532ds9vo1P/HTaOev4M9bD5DfhOb8FmPlVv6/I/WthQsSe47Uq6v
 MaaIktIH3VJgXFbpyICQLYUsjSU1GC6FIg==
X-Google-Smtp-Source: ABdhPJx8fjZFXeKn20TrWM2eFHYfX2nPxb05nZBTfwFwypVvjUbxbR+/yX8vByZjTiq0GiWvE3V/1g==
X-Received: by 2002:adf:fb90:0:b0:20c:62bd:652d with SMTP id
 a16-20020adffb90000000b0020c62bd652dmr11902526wrr.402.1651683019155; 
 Wed, 04 May 2022 09:50:19 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:f40e:900::24e])
 by smtp.gmail.com with ESMTPSA id
 t1-20020adfba41000000b0020c6fa5a797sm5930593wrg.91.2022.05.04.09.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 09:50:18 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amdgpu/gfx10: Initalise index
Date: Wed,  4 May 2022 17:50:07 +0100
Message-Id: <20220504165009.82557-2-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504165009.82557-1-mike@fireburn.co.uk>
References: <20220504165009.82557-1-mike@fireburn.co.uk>
MIME-Version: 1.0
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

This stops clang complaining:

drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3846:6: warning: variable 'index' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
        if (ring->is_mes_queue) {
            ^~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3903:30: note: uninitialized use occurs here
        amdgpu_device_wb_free(adev, index);
                                    ^~~~~
drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3846:2: note: remove the 'if' if its condition is always false
        if (ring->is_mes_queue) {
        ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3839:16: note: initialize the variable 'index' to silence this warning
        unsigned index;
                      ^
                       = 0

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index fc289ee54a47..7ce62b12e5b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -3836,7 +3836,7 @@ static int gfx_v10_0_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 	struct amdgpu_device *adev = ring->adev;
 	struct amdgpu_ib ib;
 	struct dma_fence *f = NULL;
-	unsigned index;
+	unsigned index = 0;
 	uint64_t gpu_addr;
 	volatile uint32_t *cpu_ptr;
 	long r;
-- 
2.35.1

