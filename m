Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A99F251A629
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 18:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3547510F987;
	Wed,  4 May 2022 16:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C0310F955
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 16:50:22 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q23so2844806wra.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 09:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3czjZEp8b86nn6LrmtiC2bmFLn/kHp3yI7V0niu6+Eg=;
 b=pSB7ky8H0fhvorvzkXi50T3wg5kx5pOUg0L2w9Imz6waSNfuGfhp0xQVHhDjYHLtAX
 VjhuugnP/pwMi1K7pgYifn4B7XPwu15wds4tihE79qOzRg5i3CZ8g5WojtpGClAVimoe
 MmlPRV32Cn3d8vtQGrUG9iOFQHyveiyf7YkVF3ye5cqSZ7fZimr3LQ6/UyXxX5CN3Y4V
 MJfLSzR/QuGqN7jGuCwW35PLE1/ND6NfULaBg5Jmgv783+bbOwW9IRPAbfEXOQy+W23D
 KexkwZJ+ilijV20u1MIt4wg/phePjfMOSXwepeOZr1JyOl/zaPQcAI9qqr/XpcnoO/6t
 SaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3czjZEp8b86nn6LrmtiC2bmFLn/kHp3yI7V0niu6+Eg=;
 b=awhZzNNxPkXVhSqHQ8c9zlAACzk3b5FpT24VfJ2gXgn4c/tv9Ztq47Q36TurR/tMMO
 WfpW1d59QYAQEua31dADgwb6ALOLkuEQ3JOWhM0Fru/ZUEHewKdjNvmK4H1HjyfK+6oo
 ImMP3OXFGnh+BucPX5kdOgSTXRoSswcO2tAKMYc9VHIrINFy4dmdFejiFml7dHdhMAfi
 CuMDilzDojdKICkgvbOuVXFqSe7pcx2Anv7FiPi3FiNfgqCdzLt8kopL6kUC/gH3AG58
 mhpyCB74ffm9+bM8qJckoeKnxalw0ik4tVgZWvjQSalmHe0Fi4ilhBEGmkwCwoNrwViq
 dA8g==
X-Gm-Message-State: AOAM533D/hQ6rmX/GldvGIbf5U18pv7pJf4C08Q5vqdXjQKNDl5SrsbU
 kAmnb7XDYfXwtnLtZJ5ukbrqE7j4xEYkUA==
X-Google-Smtp-Source: ABdhPJzTIpdaqtYWKMmU9cftxXl1e46ohM3/lGyv8uJinheR2KcFvaDZtNxjNw3U94XLIL9l8+Xg7w==
X-Received: by 2002:adf:dc0e:0:b0:20c:8a3f:b523 with SMTP id
 t14-20020adfdc0e000000b0020c8a3fb523mr1340906wri.201.1651683020058; 
 Wed, 04 May 2022 09:50:20 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:f40e:900::24e])
 by smtp.gmail.com with ESMTPSA id
 t1-20020adfba41000000b0020c6fa5a797sm5930593wrg.91.2022.05.04.09.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 09:50:19 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amdgpu/gfx11: Initalise index
Date: Wed,  4 May 2022 17:50:08 +0100
Message-Id: <20220504165009.82557-3-mike@fireburn.co.uk>
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

drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:376:6: warning: variable 'index' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
        if (ring->is_mes_queue) {
            ^~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:433:30: note: uninitialized use occurs here
        amdgpu_device_wb_free(adev, index);
                                    ^~~~~
drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:376:2: note: remove the 'if' if its condition is always false
        if (ring->is_mes_queue) {
        ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:364:16: note: initialize the variable 'index' to silence this warning
        unsigned index;
                      ^
                       = 0

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index 184bf554acca..b6fc39edc862 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -361,7 +361,7 @@ static int gfx_v11_0_ring_test_ib(struct amdgpu_ring *ring, long timeout)
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

