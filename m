Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B0B5ACA97
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B5A10E180;
	Mon,  5 Sep 2022 06:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Mon, 05 Sep 2022 03:28:21 UTC
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040F610E038;
 Mon,  5 Sep 2022 03:28:20 +0000 (UTC)
X-UUID: 7928ea5452b340daac7de128ff4adbd9-20220905
X-CPASD-INFO: 0c6ebd3c5c40433cb3e84f0545c07c38@ebNwhY-WYZNhg3Z8g3Z-
 nYJklWhkklCEdm-
 DYGWTX1iVhH5xTV5uYFV9fWtVYV9dYVR6eGxQYmBgZFJ4i3-XblBgXoZgUZB3f6VwhZKSYw==
X-CLOUD-ID: 0c6ebd3c5c40433cb3e84f0545c07c38
X-CPASD-SUMMARY: SIP:-1, APTIP:-2.0, KEY:0.0, FROMBLOCK:1, OB:0.0, URL:-5,
 TVAL:186.
 0, ESV:0.0, ECOM:-5.0, ML:0.0, FD:0.0, CUTS:314.0, IP:-2.0, MAL:-5.0, PHF:-5.0,
 PHC:-5
 .0, SPF:4.0, EDMS:-5, IPLABEL:4480.0, FROMTO:0, AD:0, FFOB:0.0, CFOB:0.0, SPC:0,
 SIG:-
 5, AUF:0, DUF:3998, ACD:70, DCD:70, SL:0, EISP:0, AG:0, CFC:0.437, CFSR:0.047,
 UAT:0, RA
 F:0, IMG:-5.0, DFA:0, DTA:0, IBL:-2.0, ADI:-5, SBL:0, REDM:0, REIP:0, ESB:0,
 ATTNUM:0, E AF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: 7928ea5452b340daac7de128ff4adbd9-20220905
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: 7928ea5452b340daac7de128ff4adbd9-20220905
X-User: zhongpei@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <zhongpei@kylinos.cn>) (Generic MTA)
 with ESMTP id 1623344949; Mon, 05 Sep 2022 11:23:37 +0800
From: zhongpei <zhongpei@kylinos.cn>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, zhongpei@kylinos.cn,
 isabbasso@riseup.net
Subject: [PATCH] drm:Fix the blank screen problem of some 1920x1080 75Hz
 monitors using R520 graphics card
Date: Mon,  5 Sep 2022 11:23:07 +0800
Message-Id: <20220905032307.1519169-1-zhongpei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Sep 2022 06:28:39 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We found that in the scenario of AMD R520 graphics card
and some 1920x1080 monitors,when we switch the refresh rate
of the monitor to 75Hz,the monitor will have a blank screen problem,
and the restart cannot be restored.After testing, it is found that
when we limit the maximum value of ref_div_max to 128,
the problem can be solved.In order to keep the previous modification
to be compatible with other monitors,we added a judgment
when finding the minimum diff value in the loop of the
amdgpu_pll_compute/radeon_compute_pll_avivo function.
If no diff value of 0 is found when the maximum value of ref_div_max
is limited to 100,continue to search when it is 128,
and take the parameter with the smallest diff value.

Signed-off-by: zhongpei <zhongpei@kylinos.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c | 17 +++++++++++++----
 drivers/gpu/drm/radeon/radeon_display.c | 15 +++++++++++----
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
index 0bb2466d539a..0c298faa0f94 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
@@ -84,12 +84,13 @@ static void amdgpu_pll_reduce_ratio(unsigned *nom, unsigned *den,
 static void amdgpu_pll_get_fb_ref_div(struct amdgpu_device *adev, unsigned int nom,
 				      unsigned int den, unsigned int post_div,
 				      unsigned int fb_div_max, unsigned int ref_div_max,
-				      unsigned int *fb_div, unsigned int *ref_div)
+				      unsigned int ref_div_limit, unsigned int *fb_div,
+				      unsigned int *ref_div)
 {
 
 	/* limit reference * post divider to a maximum */
 	if (adev->family == AMDGPU_FAMILY_SI)
-		ref_div_max = min(100 / post_div, ref_div_max);
+		ref_div_max = min(ref_div_limit / post_div, ref_div_max);
 	else
 		ref_div_max = min(128 / post_div, ref_div_max);
 
@@ -136,6 +137,7 @@ void amdgpu_pll_compute(struct amdgpu_device *adev,
 	unsigned ref_div_min, ref_div_max, ref_div;
 	unsigned post_div_best, diff_best;
 	unsigned nom, den;
+	unsigned ref_div_limit, ref_limit_best;
 
 	/* determine allowed feedback divider range */
 	fb_div_min = pll->min_feedback_div;
@@ -204,11 +206,12 @@ void amdgpu_pll_compute(struct amdgpu_device *adev,
 	else
 		post_div_best = post_div_max;
 	diff_best = ~0;
+	ref_div_limit = ref_limit_best = 100;
 
 	for (post_div = post_div_min; post_div <= post_div_max; ++post_div) {
 		unsigned diff;
 		amdgpu_pll_get_fb_ref_div(adev, nom, den, post_div, fb_div_max,
-					  ref_div_max, &fb_div, &ref_div);
+					  ref_div_max, ref_div_limit, &fb_div, &ref_div);
 		diff = abs(target_clock - (pll->reference_freq * fb_div) /
 			(ref_div * post_div));
 
@@ -217,13 +220,19 @@ void amdgpu_pll_compute(struct amdgpu_device *adev,
 
 			post_div_best = post_div;
 			diff_best = diff;
+			ref_limit_best = ref_div_limit;
 		}
+		if (post_div >= post_div_max && diff_best != 0 && ref_div_limit != 128) {
+			ref_div_limit = 128;
+			post_div = post_div_min - 1;
+		}
+
 	}
 	post_div = post_div_best;
 
 	/* get the feedback and reference divider for the optimal value */
 	amdgpu_pll_get_fb_ref_div(adev, nom, den, post_div, fb_div_max, ref_div_max,
-				  &fb_div, &ref_div);
+				  ref_limit_best, &fb_div, &ref_div);
 
 	/* reduce the numbers to a simpler ratio once more */
 	/* this also makes sure that the reference divider is large enough */
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index f12675e3d261..0fcbf45a68db 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -925,10 +925,10 @@ static void avivo_reduce_ratio(unsigned *nom, unsigned *den,
  */
 static void avivo_get_fb_ref_div(unsigned nom, unsigned den, unsigned post_div,
 				 unsigned fb_div_max, unsigned ref_div_max,
-				 unsigned *fb_div, unsigned *ref_div)
+				 unsigned ref_div_limit, unsigned *fb_div, unsigned *ref_div)
 {
 	/* limit reference * post divider to a maximum */
-	ref_div_max = max(min(100 / post_div, ref_div_max), 1u);
+	ref_div_max = max(min(ref_div_limit / post_div, ref_div_max), 1u);
 
 	/* get matching reference and feedback divider */
 	*ref_div = min(max(den/post_div, 1u), ref_div_max);
@@ -971,6 +971,7 @@ void radeon_compute_pll_avivo(struct radeon_pll *pll,
 	unsigned ref_div_min, ref_div_max, ref_div;
 	unsigned post_div_best, diff_best;
 	unsigned nom, den;
+	unsigned ref_div_limit, ref_limit_best;
 
 	/* determine allowed feedback divider range */
 	fb_div_min = pll->min_feedback_div;
@@ -1042,11 +1043,12 @@ void radeon_compute_pll_avivo(struct radeon_pll *pll,
 	else
 		post_div_best = post_div_max;
 	diff_best = ~0;
+	ref_div_limit = ref_limit_best = 100;
 
 	for (post_div = post_div_min; post_div <= post_div_max; ++post_div) {
 		unsigned diff;
 		avivo_get_fb_ref_div(nom, den, post_div, fb_div_max,
-				     ref_div_max, &fb_div, &ref_div);
+				     ref_div_max, ref_div_limit, &fb_div, &ref_div);
 		diff = abs(target_clock - (pll->reference_freq * fb_div) /
 			(ref_div * post_div));
 
@@ -1055,13 +1057,18 @@ void radeon_compute_pll_avivo(struct radeon_pll *pll,
 
 			post_div_best = post_div;
 			diff_best = diff;
+			ref_limit_best = ref_div_limit;
+		}
+		if (post_div >= post_div_max && diff_best != 0 && ref_div_limit != 128) {
+			ref_div_limit = 128;
+			post_div = post_div_min - 1;
 		}
 	}
 	post_div = post_div_best;
 
 	/* get the feedback and reference divider for the optimal value */
 	avivo_get_fb_ref_div(nom, den, post_div, fb_div_max, ref_div_max,
-			     &fb_div, &ref_div);
+			     ref_limit_best, &fb_div, &ref_div);
 
 	/* reduce the numbers to a simpler ratio once more */
 	/* this also makes sure that the reference divider is large enough */
-- 
2.17.1


No virus found
		Checked by Hillstone Network AntiVirus
