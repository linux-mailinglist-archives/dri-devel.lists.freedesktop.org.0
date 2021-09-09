Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A3F404AEA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 13:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1933F6E5B4;
	Thu,  9 Sep 2021 11:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3F26E5B4;
 Thu,  9 Sep 2021 11:49:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD86161A04;
 Thu,  9 Sep 2021 11:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188140;
 bh=xL8R0xhcv7lM2CtakF54LGe40ktCPUaMQx6L5gTtMWA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HDNMOp9V1fiuqlJz1rfD0paJbo5/rl2lhA21TolT8e9aY6TikJN2PKpjG3KmUHTlV
 EwVD1N3E3g6Or5XF0nipAOuC464hXxQPONC+ShzY/3GlJuFWqrkWL+G9s6ntdFSR88
 8jO75uaCWjzDVWp5iNmb+fG9LPDlq0pPTkk6pm0eHMYIs+4VNl92hQT90HkJSXTsXk
 sh4vUbcK1e28y538gYJVfIFtDY0j2oSHmbSlzR01LcVwQv0LhB1j3rwM6Ug/hbx9T/
 f0zt7Amf/1UTCty8YiZVQeSVnUK+aWJr6lp+XI5k3V82LKcdls2ZDyzjcWu+lYs2MT
 4+micmTXxta7w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: David Heidelberg <david@ixit.cz>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.13 112/219] drm/msm: mdp4: drop vblank get/put from
 prepare/complete_commit
Date: Thu,  9 Sep 2021 07:44:48 -0400
Message-Id: <20210909114635.143983-112-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114635.143983-1-sashal@kernel.org>
References: <20210909114635.143983-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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

From: David Heidelberg <david@ixit.cz>

[ Upstream commit 56bd931ae506730c9ab1e4cc4bfefa43fc2d18fa ]

msm_atomic is doing vblank get/put's already,
currently there no need to duplicate the effort in MDP4

Fix warning:
...
WARNING: CPU: 3 PID: 79 at drivers/gpu/drm/drm_vblank.c:1194 drm_vblank_put+0x1cc/0x1d4
...
and multiple vblank time-outs:
...
msm 5100000.mdp: vblank time out, crtc=1
...

Tested on Nexus 7 2013 (deb), LTS 5.10.50.

Introduced by: 119ecb7fd3b5 ("drm/msm/mdp4: request vblank during modeset")

Signed-off-by: David Heidelberg <david@ixit.cz>
Link: https://lore.kernel.org/r/20210715060925.7880-1-david@ixit.cz
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 4a5b518288b0..1325731282f7 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -108,13 +108,6 @@ static void mdp4_disable_commit(struct msm_kms *kms)
 
 static void mdp4_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *state)
 {
-	int i;
-	struct drm_crtc *crtc;
-	struct drm_crtc_state *crtc_state;
-
-	/* see 119ecb7fd */
-	for_each_new_crtc_in_state(state, crtc, crtc_state, i)
-		drm_crtc_vblank_get(crtc);
 }
 
 static void mdp4_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
@@ -133,12 +126,6 @@ static void mdp4_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
 
 static void mdp4_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 {
-	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
-	struct drm_crtc *crtc;
-
-	/* see 119ecb7fd */
-	for_each_crtc_mask(mdp4_kms->dev, crtc, crtc_mask)
-		drm_crtc_vblank_put(crtc);
 }
 
 static long mdp4_round_pixclk(struct msm_kms *kms, unsigned long rate,
-- 
2.30.2

