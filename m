Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C99C9218B8F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 17:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF0A6E191;
	Wed,  8 Jul 2020 15:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5124B6E124;
 Wed,  8 Jul 2020 15:41:20 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 445D320786;
 Wed,  8 Jul 2020 15:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594222880;
 bh=+LpYrR59OhPiCgCI0Bz36JSXB63Ug5Bm7RsE1ZYQFX8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wwWTusAX+B59vR848JVEGG/G3GVKCXLKlLQXX8ksaEXR1undr+mwNOl1XwzJ9FSNv
 VE4mR6EtV41UtdVgXDeXyZAmS6Cy63U1zhJCmYPY9Wo/QN4khMVmLD63JRpKAHm+lH
 66cp17kyHZDdFnI0l8VpX1OesE+6V0THaMlethbI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 02/30] drm/msm/dpu: allow initialization of
 encoder locks during encoder init
Date: Wed,  8 Jul 2020 11:40:48 -0400
Message-Id: <20200708154116.3199728-2-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200708154116.3199728-1-sashal@kernel.org>
References: <20200708154116.3199728-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
 Krishna Manikandan <mkrishn@codeaurora.org>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Krishna Manikandan <mkrishn@codeaurora.org>

[ Upstream commit 2e7ec6b5297157efabb50e5f82adc628cf90296c ]

In the current implementation, mutex initialization
for encoder mutex locks are done during encoder
setup. This can lead to scenarios where the lock
is used before it is initialized. Move mutex_init
to dpu_encoder_init to avoid this.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index a1b79ee2bd9d5..aa5409f06e3f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2126,7 +2126,6 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 
 	dpu_enc = to_dpu_encoder_virt(enc);
 
-	mutex_init(&dpu_enc->enc_lock);
 	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
 	if (ret)
 		goto fail;
@@ -2141,7 +2140,6 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 				0);
 
 
-	mutex_init(&dpu_enc->rc_lock);
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
 	dpu_enc->idle_timeout = IDLE_TIMEOUT;
@@ -2186,6 +2184,8 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 
 	spin_lock_init(&dpu_enc->enc_spinlock);
 	dpu_enc->enabled = false;
+	mutex_init(&dpu_enc->enc_lock);
+	mutex_init(&dpu_enc->rc_lock);
 
 	return &dpu_enc->base;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
