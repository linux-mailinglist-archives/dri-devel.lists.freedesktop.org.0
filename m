Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4D3299739
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 20:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6F46E135;
	Mon, 26 Oct 2020 19:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7456E6E0E5;
 Mon, 26 Oct 2020 19:41:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.30.34.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F41420872;
 Mon, 26 Oct 2020 19:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603741310;
 bh=VLNSpeq9/avcjh10RAUxOl5HJD/C0lqcUgYnxzCFedA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zyNLVnR7Y8LoSfkbNY4gd0K6VlfbjAqqlUi23Qqy54f0We4dvdQQaDOWeKtz58zM8
 CLzuQZP29aOtQ3guUZGXXt3mow91qds3KkcX2iLMoTOuqSRpnpr2nGnTvaJayU6kdY
 FPSrxYCzurbCzYzjTX2Mfcfe/E8p5aIf2H5tzQzI=
From: Arnd Bergmann <arnd@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 3/4] drm/msm: fix -Woverride-init warning
Date: Mon, 26 Oct 2020 20:41:03 +0100
Message-Id: <20201026194110.3817470-3-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201026194110.3817470-1-arnd@kernel.org>
References: <20201026194110.3817470-1-arnd@kernel.org>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Shubhashree Dhar <dhar@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>,
 Raviteja Tamatam <travitej@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

There is one harmless duplicate initialization that causes a warning
with 'make W=1':

drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:122:19: warning: initialized field overwritten [-Woverride-init]
  122 |  .max_linewidth = 4096,
      |                   ^~~~
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:122:19: note: (near initialization for 'sm8250_dpu_caps.max_linewidth')

Remove one of the two identical initializers to avoid the warning.

Fixes: af776a3e1c30 ("drm/msm/dpu: add SM8250 to hw catalog")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 60b304b72b7c..9c23f814ccaf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,7 +111,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 static const struct dpu_caps sm8250_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
-	.max_linewidth = 4096,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3, /* TODO: qseed3 lite */
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
