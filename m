Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A4CD068C2
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 00:29:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A7210E19C;
	Thu,  8 Jan 2026 23:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LaDAOUIY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B8E10E19C;
 Thu,  8 Jan 2026 23:29:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B6E71435BB;
 Thu,  8 Jan 2026 23:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BCEC116C6;
 Thu,  8 Jan 2026 23:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767914978;
 bh=Rw3b/I81KHL7rDt7WZsRA6q5wG50TRlXUqsg2VrqzSg=;
 h=From:Date:Subject:To:Cc:From;
 b=LaDAOUIYfdcS1TELNDZjf6/2IqXXfGW9tJJF8AlT3amw0KHLz9m4RzhPpyFj0eUwO
 NkBhHLaa4ImtevJtSzL/7gXNCnJEsHk79Z3H1XX8ESpkJ59wXKL+/6RpIq2l15CV0N
 zCQSF+DO1Z38ppubYSyswD8prBuFDD+RBJW9PxrDck8LviJp+WGDOhzsjBOKKS1GY/
 UWleuMUSKLsIeCBFE4EexrdxldpVclpji9HV49gz9eb4QvdVZvkBRt33eEbZbnFk+Y
 aiGKhCCqHynXF3WvHn8yik682hKDChFuk+YnPkVGwQy9Jg+7feUnHXmCQgX9xOBMU1
 FwUSkYrQcnf4g==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 08 Jan 2026 16:29:25 -0700
Subject: [PATCH] drm/msm/dp: Avoid division by zero in msm_dp_ctrl_config_msa()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN0QrCMAxA0V8ZeTbQDifDXxGRNYkasetIZxHH/
 n1VH8/LvQtkMZUMx2YBk6JZ01jhdw3QfRhvgsrV0Lr24LzrkS1izBF5utBsTxxKUsaPWELWgkE
 6pr2jQL6HGplMrvr+DU7nv/MrPITmbxXWdQMS7Q8DggAAAA==
X-Change-ID: 20260108-drm-msm-dp_ctrl-avoid-zero-div-be5dc40cbc18
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, kernel test robot <lkp@intel.com>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2225; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Rw3b/I81KHL7rDt7WZsRA6q5wG50TRlXUqsg2VrqzSg=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkJtvckMppmf1ITXfHmyfb7Mzas2bhW59SuK76O7ketn
 kTdWRa5t6OUhUGMi0FWTJGl+rHqcUPDOWcZb5yaBDOHlQlkCAMXpwBMZOYERobLr3oXTIlLNNns
 qfGj32ri40sRd+SPHXM9f9HMNfvJkSYlhv8uosfs1tsuObR9s++ClsJ9u15fTJVmZdraah9R+mM
 P91UGAA==
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
Change pixel_div to one to make the division well defined in the
presence of an unsupported rate, relying on the DRM_ERROR print to
indicate the error to the user.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Link: https://github.com/llvm/llvm-project/commit/37932643abab699e8bb1def08b7eb4eae7ff1448 [1]
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601081959.9UVJEOfP-lkp@intel.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cbcc7c2f0ffc..e4731c059ed8 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2395,7 +2395,7 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 			       bool is_ycbcr_420)
 {
 	u32 pixel_m, pixel_n;
-	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
+	u32 mvid, nvid, pixel_div = 1, dispcc_input_rate;
 	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
 	u32 const link_rate_hbr2 = 540000;
 	u32 const link_rate_hbr3 = 810000;

---
base-commit: 66691e272e40c91305f1704695e0cb340cd162ff
change-id: 20260108-drm-msm-dp_ctrl-avoid-zero-div-be5dc40cbc18

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

