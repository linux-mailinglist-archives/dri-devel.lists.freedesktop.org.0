Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBB4765EE0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 00:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843EB10E61D;
	Thu, 27 Jul 2023 22:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from qs51p00im-qukt01071501.me.com (qs51p00im-qukt01071501.me.com
 [17.57.155.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9045410E61D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 22:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1690494764; bh=6Y5rmpwqO9RIngtw3twLpHFk4RjqozKiV85QZdnBP8A=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=vpuxvcx3yQpRL49XjgN8c+mV0Wgx7BRyEVXPj/a2NF7OI/u2gxvO+Yi6jdz/VZhAI
 FUYTytATJuogqg62sDF3BZmfmbskKuZLR0RMCDuVq7/Of956Bsy0P7bVwhMekeuEBx
 1MEIj571IW8KLTRKV9929ILuRIxgi7cae58Kz/oQXqPENHA/TKb+6gta7e40+X7npG
 An9TfB14dnv+1MKDbzhdj5O3fZ0Rpo8EK3GxZWDqAaMfCGTk0KPOmhAkp1lKiJ8ucO
 wlDBDyLPacAY+7QVbgocdPMmAjE0qDuUtOpnhno7NISNfgqFP8H6VZvuB7MdEkgI3V
 Q42i+J317F9xA==
Received: from localhost (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
 by qs51p00im-qukt01071501.me.com (Postfix) with ESMTPSA id
 A2C1A1C406DA; Thu, 27 Jul 2023 21:52:43 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
To: Alain Volmat <alain.volmat@foss.st.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 08/14] drm/sti: add more planes supports in sti_mixer
Date: Thu, 27 Jul 2023 21:51:32 +0000
Message-Id: <20230727215141.53910-9-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727215141.53910-1-avolmat@me.com>
References: <20230727215141.53910-1-avolmat@me.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MjTwYVc_lutVqaTkRR6pG5QDvwo5FQqo
X-Proofpoint-ORIG-GUID: MjTwYVc_lutVqaTkRR6pG5QDvwo5FQqo
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-11=5F01:2022-01-11=5F01,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2307270199
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alain Volmat <avolmat@me.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On STiH418, the mixer is able to driver more layers of
planes.  For this purpose, add those new possible entries
and allow it to work in either STiH407 or STiH418 mode.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 drivers/gpu/drm/sti/sti_mixer.c | 66 ++++++++++++++++++++++++++++-----
 drivers/gpu/drm/sti/sti_mixer.h |  3 +-
 2 files changed, 58 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_mixer.c b/drivers/gpu/drm/sti/sti_mixer.c
index 9cd780403d7b..d30e31e62268 100644
--- a/drivers/gpu/drm/sti/sti_mixer.c
+++ b/drivers/gpu/drm/sti/sti_mixer.c
@@ -42,7 +42,9 @@ module_param_named(bkgcolor, bkg_color, int, 0644);
 #define GAM_DEPTH_GDP1_ID  4
 #define GAM_DEPTH_GDP2_ID  5
 #define GAM_DEPTH_GDP3_ID  6
-#define GAM_DEPTH_MASK_ID  7
+#define GAM_DEPTH_GDP4_ID  7
+#define GAM_DEPTH_GDP5_ID  8
+#define GAM_DEPTH_VID2_ID  9
 
 /* mask in CTL reg */
 #define GAM_CTL_BACK_MASK  BIT(0)
@@ -52,6 +54,10 @@ module_param_named(bkgcolor, bkg_color, int, 0644);
 #define GAM_CTL_GDP1_MASK  BIT(4)
 #define GAM_CTL_GDP2_MASK  BIT(5)
 #define GAM_CTL_GDP3_MASK  BIT(6)
+#define GAM_CTL_GDP4_MASK  BIT(7)
+#define GAM_CTL_GDP5_MASK  BIT(8)
+/* CURSOR doesn't exist on STiH418 where VID2 exist */
+#define GAM_CTL_VID2_MASK  BIT(9)
 #define GAM_CTL_CURSOR_MASK BIT(9)
 
 const char *sti_mixer_to_str(struct sti_mixer *mixer)
@@ -80,15 +86,16 @@ static inline void sti_mixer_reg_write(struct sti_mixer *mixer,
 #define DBGFS_DUMP(reg) seq_printf(s, "\n  %-25s 0x%08X", #reg, \
 				   sti_mixer_reg_read(mixer, reg))
 
-static void mixer_dbg_ctl(struct seq_file *s, int val)
+static void mixer_dbg_ctl(struct seq_file *s, int val, int depth)
 {
 	unsigned int i;
 	int count = 0;
 	char *const disp_layer[] = {"BKG", "VID0", "VID1", "GDP0",
-				    "GDP1", "GDP2", "GDP3"};
+				    "GDP1", "GDP2", "GDP3", "GDP4",
+				    "GDP5", "VID2"};
 
 	seq_puts(s, "\tEnabled: ");
-	for (i = 0; i < 7; i++) {
+	for (i = 0; i < depth; i++) {
 		if (val & 1) {
 			seq_printf(s, "%s ", disp_layer[i]);
 			count++;
@@ -108,18 +115,20 @@ static void mixer_dbg_ctl(struct seq_file *s, int val)
 static void mixer_dbg_crb(struct seq_file *s, struct sti_mixer *mixer, u64 val)
 {
 	int i;
-	u32 shift, mask_id;
+	u32 shift, mask_id, mixer_depth;
 
 	if (of_device_is_compatible(mixer->dev->of_node, "st,stih418-compositor")) {
 		shift = 4;
 		mask_id = 0x0f;
+		mixer_depth = GAM_MIXER_NB_DEPTH_LEVEL_STIH418;
 	} else {
 		shift = 3;
 		mask_id = 0x07;
+		mixer_depth = GAM_MIXER_NB_DEPTH_LEVEL_STIH407;
 	}
 
 	seq_puts(s, "\tDepth: ");
-	for (i = 0; i < GAM_MIXER_NB_DEPTH_LEVEL; i++) {
+	for (i = 0; i < mixer_depth; i++) {
 		switch (val & mask_id) {
 		case GAM_DEPTH_VID0_ID:
 			seq_puts(s, "VID0");
@@ -139,11 +148,20 @@ static void mixer_dbg_crb(struct seq_file *s, struct sti_mixer *mixer, u64 val)
 		case GAM_DEPTH_GDP3_ID:
 			seq_puts(s, "GDP3");
 			break;
+		case GAM_DEPTH_GDP4_ID:
+			seq_puts(s, "GDP4");
+			break;
+		case GAM_DEPTH_GDP5_ID:
+			seq_puts(s, "GDP5");
+			break;
+		case GAM_DEPTH_VID2_ID:
+			seq_puts(s, "VID2");
+			break;
 		default:
 			seq_puts(s, "---");
 		}
 
-		if (i < GAM_MIXER_NB_DEPTH_LEVEL - 1)
+		if (i < mixer_depth - 1)
 			seq_puts(s, " < ");
 		val = val >> shift;
 	}
@@ -161,13 +179,19 @@ static int mixer_dbg_show(struct seq_file *s, void *arg)
 {
 	struct drm_info_node *node = s->private;
 	struct sti_mixer *mixer = (struct sti_mixer *)node->info_ent->data;
+	int depth;
 	u64 val;
 
+	if (of_device_is_compatible(mixer->dev->of_node, "st,stih418-compositor"))
+		depth = GAM_MIXER_NB_DEPTH_LEVEL_STIH418 + 1;
+	else
+		depth = GAM_MIXER_NB_DEPTH_LEVEL_STIH407 + 1;
+
 	seq_printf(s, "%s: (vaddr = 0x%p)",
 		   sti_mixer_to_str(mixer), mixer->regs);
 
 	DBGFS_DUMP(GAM_MIXER_CTL);
-	mixer_dbg_ctl(s, sti_mixer_reg_read(mixer, GAM_MIXER_CTL));
+	mixer_dbg_ctl(s, sti_mixer_reg_read(mixer, GAM_MIXER_CTL), depth);
 	DBGFS_DUMP(GAM_MIXER_BKC);
 	DBGFS_DUMP(GAM_MIXER_BCO);
 	DBGFS_DUMP(GAM_MIXER_BCS);
@@ -259,14 +283,16 @@ int sti_mixer_set_plane_depth(struct sti_mixer *mixer, struct sti_plane *plane)
 	int plane_id, depth = plane->drm_plane.state->normalized_zpos;
 	unsigned int i;
 	u64 mask, val;
-	u32 shift, mask_id;
+	u32 shift, mask_id, mixer_depth;
 
 	if (of_device_is_compatible(mixer->dev->of_node, "st,stih418-compositor")) {
 		shift = 4;
 		mask_id = 0x0f;
+		mixer_depth = GAM_MIXER_NB_DEPTH_LEVEL_STIH418;
 	} else {
 		shift = 3;
 		mask_id = 0x07;
+		mixer_depth = GAM_MIXER_NB_DEPTH_LEVEL_STIH407;
 	}
 
 	switch (plane->desc) {
@@ -285,6 +311,18 @@ int sti_mixer_set_plane_depth(struct sti_mixer *mixer, struct sti_plane *plane)
 	case STI_HQVDP_0:
 		plane_id = GAM_DEPTH_VID0_ID;
 		break;
+	case STI_HQVDP_1:
+		plane_id = GAM_DEPTH_VID1_ID;
+		break;
+	case STI_GDP_4:
+		plane_id = GAM_DEPTH_GDP4_ID;
+		break;
+	case STI_GDP_5:
+		plane_id = GAM_DEPTH_GDP5_ID;
+		break;
+	case STI_HQVDP_2:
+		plane_id = GAM_DEPTH_VID2_ID;
+		break;
 	case STI_CURSOR:
 		/* no need to set depth for cursor */
 		return 0;
@@ -297,7 +335,7 @@ int sti_mixer_set_plane_depth(struct sti_mixer *mixer, struct sti_plane *plane)
 	val = sti_mixer_reg_read(mixer, GAM_MIXER_CRB);
 	if (of_device_is_compatible(mixer->dev->of_node, "st,stih418-compositor"))
 		val |= ((u64)sti_mixer_reg_read(mixer, GAM_MIXER_CRB2) << 32);
-	for (i = 0; i < GAM_MIXER_NB_DEPTH_LEVEL; i++) {
+	for (i = 0; i < mixer_depth; i++) {
 		mask = mask_id << (shift * i);
 		if ((val & mask) == plane_id << (shift * i))
 			break;
@@ -366,6 +404,14 @@ static u32 sti_mixer_get_plane_mask(struct sti_plane *plane)
 		return GAM_CTL_GDP3_MASK;
 	case STI_HQVDP_0:
 		return GAM_CTL_VID0_MASK;
+	case STI_HQVDP_1:
+		return GAM_CTL_VID1_MASK;
+	case STI_GDP_4:
+		return GAM_CTL_GDP4_MASK;
+	case STI_GDP_5:
+		return GAM_CTL_GDP5_MASK;
+	case STI_HQVDP_2:
+		return GAM_CTL_VID2_MASK;
 	case STI_CURSOR:
 		return GAM_CTL_CURSOR_MASK;
 	default:
diff --git a/drivers/gpu/drm/sti/sti_mixer.h b/drivers/gpu/drm/sti/sti_mixer.h
index ab06beb7b258..1ce7c6b4b4f3 100644
--- a/drivers/gpu/drm/sti/sti_mixer.h
+++ b/drivers/gpu/drm/sti/sti_mixer.h
@@ -61,7 +61,8 @@ void sti_mixer_set_background_status(struct sti_mixer *mixer, bool enable);
 void sti_mixer_debugfs_init(struct sti_mixer *mixer, struct drm_minor *minor);
 
 /* depth in Cross-bar control = z order */
-#define GAM_MIXER_NB_DEPTH_LEVEL 6
+#define GAM_MIXER_NB_DEPTH_LEVEL_STIH407 6
+#define GAM_MIXER_NB_DEPTH_LEVEL_STIH418 9
 
 #define STI_MIXER_MAIN 0
 #define STI_MIXER_AUX  1
-- 
2.34.1

