Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1C7605C3B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 12:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35B710E421;
	Thu, 20 Oct 2022 10:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4A510E1A1;
 Thu, 20 Oct 2022 10:24:38 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so1839712wmb.3; 
 Thu, 20 Oct 2022 03:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=338ew+i7lhPhhsRwFXebT4YiHgbE5e7sWqj7Y/pRaLI=;
 b=pb8WX3HWaEJ0WTcDPURYIIYexJdp7jutkc+9DRribLrBrMheWwvoPTL69Kp3TgYLQU
 /q5buwPNLNvXPYtgmbvDTRPU3Cf9rN8af39laD6hNylMLhOlUWZcdjcuSnzgCp6h22Od
 /UuAQx1kzlARdQpq1xCwWoxDsm6WpgvcDhpEBGnxXMx7fyn+WxlJMB4yb5j7IGFpA5IY
 JowuZeey7HLVUqI08CfxheelbkMeehuJYR+H4MMaYbpc9lOToq3WbPhuta/kpStUn9rM
 Vs9FHcrWbF1cOoeU5N3b7QVUDeUPRpfB22qrSTrmwu6xTG2wpQ1sJ9Hb+8npd6UyRrVT
 hFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=338ew+i7lhPhhsRwFXebT4YiHgbE5e7sWqj7Y/pRaLI=;
 b=aqhRxitrBf0Hs30dko7Ohfq4km3psY1XatozheiFXk5IsqXZ9VsrdTR6GnQeydux/8
 rW9TXs93teXvncI/oV57QUKPlkqN9IhZgYLG3vGRfaWzPbEKWfHDKSkQP4zgYxCEOFtl
 RbLpuANLQVWzR92T3yd2SNN1fvpS82gWhGFpniIweud7EeqPtbgZ9ggmGqEM+HUC8/8H
 fjKB75edNxtAv9O2LwvMDGfvD1yhDUloSwrpkEyf/B8dfkkU1KieCaz2uln0v9QY4Cq2
 nh3cnlnIb4P2pArZNxZ7sIDJMQ0LKWJZ8yoeUGtiLW31Djyon4jXxQbBxFLDAww8qy6q
 /O3A==
X-Gm-Message-State: ACrzQf2S18CXT6orlO/94sV7Ol/OKp2dKDFVnprL4z+gclqWEZSR+5S1
 o0Bm+NOoZBlNGYL2gBx6pq0=
X-Google-Smtp-Source: AMsMyM5WmolYkONk0FMYkPzqo4dahEZcXdn77VTv+ezaYrMPOagr//Hcwc+NtW4Wt6SJLMDRMTxFKw==
X-Received: by 2002:a05:600c:5486:b0:3b4:7e47:e19 with SMTP id
 iv6-20020a05600c548600b003b47e470e19mr8729825wmb.12.1666261476483; 
 Thu, 20 Oct 2022 03:24:36 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 n14-20020a5d67ce000000b0022da3977ec5sm16088946wrw.113.2022.10.20.03.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 03:24:36 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: fix incorrect function name in comment block
Date: Thu, 20 Oct 2022 11:24:35 +0100
Message-Id: <20221020102435.1527436-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function name in the comment block for intel_vgpu_emulate_cfg_write is
incorrect. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/gvt/cfg_space.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/gvt/cfg_space.c
index eef3bba8a41b..bff63babacd5 100644
--- a/drivers/gpu/drm/i915/gvt/cfg_space.c
+++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
@@ -244,7 +244,7 @@ static void emulate_pci_bar_write(struct intel_vgpu *vgpu, unsigned int offset,
 }
 
 /**
- * intel_vgpu_emulate_cfg_read - emulate vGPU configuration space write
+ * intel_vgpu_emulate_cfg_write - emulate vGPU configuration space write
  * @vgpu: target vgpu
  * @offset: offset
  * @p_data: write data ptr
-- 
2.37.3

