Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 943A44C550C
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 11:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7636810ED6C;
	Sat, 26 Feb 2022 10:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpproxy21.qq.com (smtpbg701.qq.com [203.205.195.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6013F10E7E2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 09:47:44 +0000 (UTC)
X-QQ-mid: bizesmtp69t1645782450t0kbe8hh
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 25 Feb 2022 17:47:24 +0800 (CST)
X-QQ-SSF: 01400000002000C0F000000A0000000
X-QQ-FEAT: vsfsx1ezZ8T9jEj1xNfTc/NNOY+XLDtQ8KYfXZfbFq1OAyvxyybatFq69W8AI
 mycbPgvMN1QnO8/m3gZ4MXNE0Zk+9eIzUD8kDpcX4/3m0fuYQ1g3dyoYAnSaGiXEl3fj6HF
 Km8scUlBVEan0JXqC0YQjUEIv+KBhB2DCtPGymk80N91YFlBGLQEvDJrWy39/796K1qPCVo
 khjMPwmDue14T9tCbafeiSZU4SIUKbVJYPzTUUtsJitFFd2u/qoW0Q/W4Ir/CiC7S1lWgxU
 hQ3WedHzT9K7OtW/iRZ8aTvg9APS/5NBzkWNrRTQe9cg0PEDaogOItAu/D5uXmJR5xDa+hJ
 qkd9CQSAwDFbvgrIHt/V9YHcl4/IX7b4dN7hOQoCBap8M7kzcg=
X-QQ-GoodBg: 1
From: Meng Tang <tangmeng@uniontech.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] gpu/amd: vega10_hwmgr: fix inappropriate private variable name
Date: Fri, 25 Feb 2022 17:47:22 +0800
Message-Id: <20220225094722.4734-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Sat, 26 Feb 2022 10:00:59 +0000
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
Cc: Meng Tang <tangmeng@uniontech.com>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, evan.quan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In file vega10_hwmgr.c, the names of struct vega10_power_state *
and struct pp_power_state * are confusingly used, which may lead
to some confusion.

Status quo is that variables of type struct vega10_power_state *
are named "vega10_ps", "ps", "vega10_power_state". A more
appropriate usage is that struct are named "ps" is used for
variabled of type struct pp_power_state *.

So rename struct vega10_power_state * which are named "ps" and
"vega10_power_state" to "vega10_ps", I also renamed "psa" to
"vega10_psa" and "psb" to "vega10_psb" to make it more clearly.

The rows longer than 100 columns are involved.

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 68 +++++++++++--------
 1 file changed, 38 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
index 3f040be0d158..37324f2009ca 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
@@ -3095,7 +3095,7 @@ static int vega10_get_pp_table_entry_callback_func(struct pp_hwmgr *hwmgr,
 		void *pp_table, uint32_t classification_flag)
 {
 	ATOM_Vega10_GFXCLK_Dependency_Record_V2 *patom_record_V2;
-	struct vega10_power_state *vega10_power_state =
+	struct vega10_power_state *vega10_ps =
 			cast_phw_vega10_power_state(&(power_state->hardware));
 	struct vega10_performance_level *performance_level;
 	ATOM_Vega10_State *state_entry = (ATOM_Vega10_State *)state;
@@ -3145,17 +3145,17 @@ static int vega10_get_pp_table_entry_callback_func(struct pp_hwmgr *hwmgr,
 	power_state->temperatures.min = 0;
 	power_state->temperatures.max = 0;
 
-	performance_level = &(vega10_power_state->performance_levels
-			[vega10_power_state->performance_level_count++]);
+	performance_level = &(vega10_ps->performance_levels
+			[vega10_ps->performance_level_count++]);
 
 	PP_ASSERT_WITH_CODE(
-			(vega10_power_state->performance_level_count <
+			(vega10_ps->performance_level_count <
 					NUM_GFXCLK_DPM_LEVELS),
 			"Performance levels exceeds SMC limit!",
 			return -1);
 
 	PP_ASSERT_WITH_CODE(
-			(vega10_power_state->performance_level_count <=
+			(vega10_ps->performance_level_count <=
 					hwmgr->platform_descriptor.
 					hardwareActivityPerformanceLevels),
 			"Performance levels exceeds Driver limit!",
@@ -3169,8 +3169,8 @@ static int vega10_get_pp_table_entry_callback_func(struct pp_hwmgr *hwmgr,
 	performance_level->mem_clock = mclk_dep_table->entries
 			[state_entry->ucMemClockIndexLow].ulMemClk;
 
-	performance_level = &(vega10_power_state->performance_levels
-				[vega10_power_state->performance_level_count++]);
+	performance_level = &(vega10_ps->performance_levels
+				[vega10_ps->performance_level_count++]);
 	performance_level->soc_clock = socclk_dep_table->entries
 				[state_entry->ucSocClockIndexHigh].ulClk;
 	if (gfxclk_dep_table->ucRevId == 0) {
@@ -3201,11 +3201,11 @@ static int vega10_get_pp_table_entry(struct pp_hwmgr *hwmgr,
 		unsigned long entry_index, struct pp_power_state *state)
 {
 	int result;
-	struct vega10_power_state *ps;
+	struct vega10_power_state *vega10_ps;
 
 	state->hardware.magic = PhwVega10_Magic;
 
-	ps = cast_phw_vega10_power_state(&state->hardware);
+	vega10_ps = cast_phw_vega10_power_state(&state->hardware);
 
 	result = vega10_get_powerplay_table_entry(hwmgr, entry_index, state,
 			vega10_get_pp_table_entry_callback_func);
@@ -3218,10 +3218,10 @@ static int vega10_get_pp_table_entry(struct pp_hwmgr *hwmgr,
 	 */
 	/* set DC compatible flag if this state supports DC */
 	if (!state->validation.disallowOnDC)
-		ps->dc_compatible = true;
+		vega10_ps->dc_compatible = true;
 
-	ps->uvd_clks.vclk = state->uvd_clocks.VCLK;
-	ps->uvd_clks.dclk = state->uvd_clocks.DCLK;
+	vega10_ps->uvd_clks.vclk = state->uvd_clocks.VCLK;
+	vega10_ps->uvd_clks.dclk = state->uvd_clocks.DCLK;
 
 	return 0;
 }
@@ -4823,33 +4823,41 @@ static int vega10_check_states_equal(struct pp_hwmgr *hwmgr,
 				const struct pp_hw_power_state *pstate1,
 			const struct pp_hw_power_state *pstate2, bool *equal)
 {
-	const struct vega10_power_state *psa;
-	const struct vega10_power_state *psb;
+	const struct vega10_power_state *vega10_psa;
+	const struct vega10_power_state *vega10_psb;
 	int i;
 
 	if (pstate1 == NULL || pstate2 == NULL || equal == NULL)
 		return -EINVAL;
 
-	psa = cast_const_phw_vega10_power_state(pstate1);
-	psb = cast_const_phw_vega10_power_state(pstate2);
-	/* If the two states don't even have the same number of performance levels they cannot be the same state. */
-	if (psa->performance_level_count != psb->performance_level_count) {
+	vega10_psa = cast_const_phw_vega10_power_state(pstate1);
+	vega10_psb = cast_const_phw_vega10_power_state(pstate2);
+
+	/* If the two states don't even have the same number of performance levels
+	 * they cannot be the same state.
+	 */
+	if (vega10_psa->performance_level_count != vega10_psb->performance_level_count) {
 		*equal = false;
 		return 0;
 	}
 
-	for (i = 0; i < psa->performance_level_count; i++) {
-		if (!vega10_are_power_levels_equal(&(psa->performance_levels[i]), &(psb->performance_levels[i]))) {
-			/* If we have found even one performance level pair that is different the states are different. */
+	for (i = 0; i < vega10_psa->performance_level_count; i++) {
+		if (!vega10_are_power_levels_equal(&(vega10_psa->performance_levels[i]),
+						   &(vega10_psb->performance_levels[i]))) {
+			/* If we have found even one performance level pair
+			 * that is different the states are different.
+			 */
 			*equal = false;
 			return 0;
 		}
 	}
 
 	/* If all performance levels are the same try to use the UVD clocks to break the tie.*/
-	*equal = ((psa->uvd_clks.vclk == psb->uvd_clks.vclk) && (psa->uvd_clks.dclk == psb->uvd_clks.dclk));
-	*equal &= ((psa->vce_clks.evclk == psb->vce_clks.evclk) && (psa->vce_clks.ecclk == psb->vce_clks.ecclk));
-	*equal &= (psa->sclk_threshold == psb->sclk_threshold);
+	*equal = ((vega10_psa->uvd_clks.vclk == vega10_psb->uvd_clks.vclk) &&
+		  (vega10_psa->uvd_clks.dclk == vega10_psb->uvd_clks.dclk));
+	*equal &= ((vega10_psa->vce_clks.evclk == vega10_psb->vce_clks.evclk) &&
+		   (vega10_psa->vce_clks.ecclk == vega10_psb->vce_clks.ecclk));
+	*equal &= (vega10_psa->sclk_threshold == vega10_psb->sclk_threshold);
 
 	return 0;
 }
@@ -5444,19 +5452,19 @@ static int vega10_get_performance_level(struct pp_hwmgr *hwmgr, const struct pp_
 				PHM_PerformanceLevelDesignation designation, uint32_t index,
 				PHM_PerformanceLevel *level)
 {
-	const struct vega10_power_state *ps;
+	const struct vega10_power_state *vega10_ps;
 	uint32_t i;
 
 	if (level == NULL || hwmgr == NULL || state == NULL)
 		return -EINVAL;
 
-	ps = cast_const_phw_vega10_power_state(state);
+	vega10_ps = cast_const_phw_vega10_power_state(state);
 
-	i = index > ps->performance_level_count - 1 ?
-			ps->performance_level_count - 1 : index;
+	i = index > vega10_ps->performance_level_count - 1 ?
+			vega10_ps->performance_level_count - 1 : index;
 
-	level->coreClock = ps->performance_levels[i].gfx_clock;
-	level->memory_clock = ps->performance_levels[i].mem_clock;
+	level->coreClock = vega10_ps->performance_levels[i].gfx_clock;
+	level->memory_clock = vega10_ps->performance_levels[i].mem_clock;
 
 	return 0;
 }
-- 
2.20.1



