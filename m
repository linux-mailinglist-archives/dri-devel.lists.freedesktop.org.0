Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B17D1BC43
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 01:00:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D3B10E568;
	Wed, 14 Jan 2026 00:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uc+7oYGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E9B10E37F;
 Wed, 14 Jan 2026 00:00:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DE8AB43EFC;
 Wed, 14 Jan 2026 00:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49891C116C6;
 Wed, 14 Jan 2026 00:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768348843;
 bh=bXLpO8c9ZBsExdS2sHYGwKNmU+WKPGSgvNzVCoVhZYw=;
 h=From:Date:Subject:To:Cc:From;
 b=uc+7oYGl75Lz8ht0DyVesshS8Yxx8aV8Q5h8oU6t3D0pXEnrrYsOoDnIfNxYZWEAK
 sKLjVwY+F26AjkDiYsPs48ilC/mpxdZyeu771qPN7rWgSJcQ1bVuFnzq3XgNarTihr
 ZFZJQQqvrJqqVsZHSZxnWhVRAbMdOS3qo9R5/+gdHfVIoZxWnLLJ5HlPe1TaK4o2D/
 JCzZyekCygyNVTctCkGUqRkXalu1iLiV5xRi/6MwoOMJd+36uBH5LQv21/gOHG2efc
 vfyzx0VI86PRsewPyNn8IvmFshLL1Z2boB4YULGLO/DkLa46lkYZN0OpXq2dtODf0z
 zqjvzP5w9bIRA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 13 Jan 2026 17:00:31 -0700
Subject: [PATCH v2] drm/msm/dp: Avoid division by zero in
 msm_dp_ctrl_config_msa()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-drm-msm-dp_ctrl-avoid-zero-div-v2-1-f1aa67bf6e8e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr0Jm7ZgWlBBX3sMQQ9sRRoGSKTYq4
 e4CXsDlS17++xMEEqYAp2QCociBfb9AukvANlVfE7JbGFKV5kqrAp102IUO3XC1o7RYRc8OPyQ
 eHUc0dHT2oKyxuoBlZBC68WsLXMofh6e5kx3X1dVoOIxe3tuDqFfv71jUqDGvCkfGmkxl2flB0
 lO791JDOc/zF71BhHzfAAAA
X-Change-ID: 20260108-drm-msm-dp_ctrl-avoid-zero-div-be5dc40cbc18
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, kernel test robot <lkp@intel.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3616; i=nathan@kernel.org;
 h=from:subject:message-id; bh=bXLpO8c9ZBsExdS2sHYGwKNmU+WKPGSgvNzVCoVhZYw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlpd1aoxTJt9GOdJFio/Oh2+SfpdJ6yrfuVjVbubGvh0
 dnYotjfUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACZi2cvIcKvp5KZbV//qR/CL
 Hz0W67YnpkImbJ//Xhklhe+K32MF5jMyzCy40il6SIfjYPjSRomXN1ISjsyPvPzoYOPOdStPzrq
 vxQsA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

An (admittedly problematic) optimization change in LLVM 20 [1] turns
known division by zero into the equivalent of __builtin_unreachable(),
which invokes undefined behavior if it is encountered in a control flow
graph, destroying code generation. When compile testing for x86_64,
objtool flags an instance of this optimization triggering in
msm_dp_ctrl_config_msa(), inlined into msm_dp_ctrl_on_stream():

  drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section .text.msm_dp_ctrl_on_stream

The zero division happens if the else branch in the first if statement
in msm_dp_ctrl_config_msa() is taken because pixel_div is initialized to
zero and it is not possible for LLVM to eliminate the else branch since
rate is still not known after inlining into msm_dp_ctrl_on_stream().

Transform the if statements into a switch statement with a default case
with the existing error print and an early return to avoid the invalid
division. Add a comment to note this helps the compiler, even though the
case is known to be unreachable. With this, pixel_dev's default zero
initialization can be dropped, as it is dead with this change.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Link: https://github.com/llvm/llvm-project/commit/37932643abab699e8bb1def08b7eb4eae7ff1448 [1]
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601081959.9UVJEOfP-lkp@intel.com/
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Changes in v2:
- Transform existing if statement structure into a switch case with a
  default case that early returns, avoiding the invalid division
  (Konrad, Dmitry). Add a commment about the reachability of the default
  case.
- Drop the default zero initialization of pixel_div, as it is no longer
  used due to the new switch statement.
- Link to v1: https://patch.msgid.link/20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cbcc7c2f0ffc..94411870a5e0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2395,20 +2395,32 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 			       bool is_ycbcr_420)
 {
 	u32 pixel_m, pixel_n;
-	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
+	u32 mvid, nvid, pixel_div, dispcc_input_rate;
 	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
 	u32 const link_rate_hbr2 = 540000;
 	u32 const link_rate_hbr3 = 810000;
 	unsigned long den, num;
 
-	if (rate == link_rate_hbr3)
+	switch (rate) {
+	case link_rate_hbr3:
 		pixel_div = 6;
-	else if (rate == 162000 || rate == 270000)
-		pixel_div = 2;
-	else if (rate == link_rate_hbr2)
+		break;
+	case link_rate_hbr2:
 		pixel_div = 4;
-	else
+		break;
+	case 162000:
+	case 270000:
+		pixel_div = 2;
+		break;
+	default:
+		/*
+		 * This cannot be reached but the compiler is not able to know
+		 * that statically so return early to avoid a possibly invalid
+		 * division.
+		 */
 		DRM_ERROR("Invalid pixel mux divider\n");
+		return;
+	}
 
 	dispcc_input_rate = (rate * 10) / pixel_div;
 

---
base-commit: 66691e272e40c91305f1704695e0cb340cd162ff
change-id: 20260108-drm-msm-dp_ctrl-avoid-zero-div-be5dc40cbc18

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

