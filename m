Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EABF1A293D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADEC6EAB9;
	Wed,  8 Apr 2020 19:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A50C6EABA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:15:11 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MG9Xu-1jW9e42yUO-00GXX9; Wed, 08 Apr 2020 21:15:00 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jcrouse@codeaurora.org>
Subject: [PATCH] drm/msm: fix link error without CONFIG_DEBUG_FS
Date: Wed,  8 Apr 2020 21:14:22 +0200
Message-Id: <20200408191458.1260397-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:fdpx1d/DLJfitrFpYrv8Gkkt6VAi33wDZasxO8tqJ48cXnNukcc
 VB/q8aFUWkBATecQB02IKtYojv/7l+Y0/mI+xOkGkohuj0ZY4xA6z2cp4m13/z+BJ0uyHvn
 yA6d6TySZK/ah969Kwpn8hB3N5sX/O/4aiSFnMFZXs2FeFCV0pXCA3Gg2HWS8es86yMdTJp
 UwUjR8Rc/Y7boiWmcahiA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kF1greHftFI=:ivJ7OWNComZDWHcSPqHuVF
 fQMfSIdFDMDjxV7GJQtasTwesVIjnbxOV3ownNUKiWq7W4MmZ4/XEbw1+54eOK8dO2yRHdFAO
 NEVksE9tiSX25TanxKVRdD6CudBu/Y4jb5750M3LUoD2vwOvlf16CjXqNdWh2APT8ZuibJWvE
 o2tiuVNIucvkYERGk4fSWF6wsu7u1O6Po2lCq30E1NjRMTE5Dwa63rtXtiik5SX/Ukx9wqGHe
 gST/LpfRaMbauz6fxk4xCxEW/If7kUB50d1Ls3zpWQXZTPQckX2Jgk8zN0X9243OLFs7Gwaje
 GrRasgfxmZW9uqthJzj6odDkV/EWXn8e01lHb6iHK2+Rqm5xcBGZnGXpLf1lqjXOjcURmPIjt
 7jxvVts3EpHJ3CmN7su87024TaZeiU/63E8KScvBXle7nRZW/gubk+dyYhx4L3D+lr/IXNqS5
 ZUylcVDrWpAiW58UFyVbUl1q4o3BArcu1ZeKrgFNMAMg1BAyz63jlrXCUJOTOS/g3Mw+ebBMB
 QKPemHcn1TsdD5CXVQC+paAf2IfcdxBfzAgr7PDkF1qkeyFr4lESb3zWerIJhuX98S2V/IKOm
 2pjVCNR+I9/mnFscvygahOdh3eFe2wPgL2vKAV7vY+HlKEkr3f9H3Pep+SOCXVcyM7vzvoRyh
 1+PRFyl4gOalwGSgcG7klIUbrVX4krfAT9sfWE+3e4KJLoRuGA4wzROscPdwN9Y7Lm8UfJkic
 33UsM8NfMjkjuZc9EMwc8xbAvdckusmkA6IKvS/oUimisy+sB0pAxBbYwuh121fspv3WeZ3qX
 KmQQTuYd2KN8PuaOJPPaDdfSswvNBaI3+baHmXL7eWV9VhnvUY=
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
Cc: Rob Clark <robdclark@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, "Kristian H. Kristensen" <hoegsberg@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I ran into a randconfig link error with debugfs disabled:

arm-linux-gnueabi-ld:
drivers/gpu/drm/msm/msm_gpu.o: in function `should_dump': msm_gpu.c:(.text+0x1cc): undefined reference to `rd_full'

Change the helper to only look at this variable if debugfs is present.

Fixes: e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/msm_gem.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 30584eaf8cc8..eb4aeaf291ea 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -167,7 +167,10 @@ static inline bool
 should_dump(struct msm_gem_submit *submit, int idx)
 {
 	extern bool rd_full;
-	return rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
+	if (IS_ENABLED(CONFIG_DEBUG_FS) && rd_full)
+		return true;
+
+	return submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP;
 }
 
 #endif /* __MSM_GEM_H__ */
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
