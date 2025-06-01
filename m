Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7419CACA227
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FCE10E410;
	Sun,  1 Jun 2025 23:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dU8kpc/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9467A10E417
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jun 2025 23:34:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D526FA4FB07;
 Sun,  1 Jun 2025 23:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC3DC4CEE7;
 Sun,  1 Jun 2025 23:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820877;
 bh=G5ptFgI035r6QM783wg67cRlLhJPu1qeqOLJdtsVheU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dU8kpc/eTuIOneymkeVr2vl07xOyuE2J/AoLn3P2BTOfwh6Uf0ylIOtTDJIfZ6S+g
 1JRQ3j7Nx3zsc+CrJhiZNQp3+RaNVC6JfZpJve6t61TCwaxcNjGDgNJiXCE58N4swH
 eALt/GI4m6BBwYnwUsSEOVKeaLTJTm61pzMwWaOCXK2CiiAKegEM9w01wO/w8jthPK
 cDXdmBhmTmc1sokhgtCzxHU1q0ljY/BbqGnWPdxpV4qC/+IaLHVgR7cZZGeKFrmkS+
 t5sicJMYHQMNpYrRBO9lKke9o/NMcItieZpGUcgtyB2ov+wuqNp0beD4MhVdft/XtA
 z0eimha26nGmw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Anusha Srivatsa <asrivats@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tejas Vipin <tejasvipin76@gmail.com>,
 Doug Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sasha Levin <sashal@kernel.org>, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 12/93] drm/panel/sharp-ls043t1le01: Use _multi
 variants
Date: Sun,  1 Jun 2025 19:32:39 -0400
Message-Id: <20250601233402.3512823-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601233402.3512823-1-sashal@kernel.org>
References: <20250601233402.3512823-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.31
Content-Type: text/plain; charset=UTF-8
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

From: Anusha Srivatsa <asrivats@redhat.com>

[ Upstream commit 20e8219205145e1af3b98b6a0a3cc59568116a05 ]

Move away from using deprecated API and use _multi variants
if available. Use mipi_dsi_msleep() and mipi_dsi_usleep_range()
instead of msleep() and usleep_range() respectively.

Used Coccinelle to find the _multi variant APIs,replacing
mpi_dsi_msleep() where necessary and for returning
dsi_ctx.accum_err in these functions. mipi_dsi_dcs_write()
does not have a corresponding _multi() variant. Replacing it with
mipi_dsi_dcs_write_seq_multi() instead. This change is manual.

The Coccinelle script is the same as the one in commit c8ba07caaecc
("drm/panel/synaptics-r63353: Use _multi variants")

v2: Use mipi_dsi_write_buffer_multi() in place of
mipi_dsi_dcs_write(). (Dmitry)

v3: add commit details where the same coccinelle script is
used and remove the actual script from commit log.
Use mipi_dsi_dcs_write_seq_multi() for mipi_dsi_dcs_write() (Doug)

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Link: https://lore.kernel.org/r/20250326-b4-panel-ls043t1le01-v3-1-96c554c0ea2b@redhat.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Looking at this commit, I need to analyze whether it should be
backported to stable kernel trees. **Answer: NO** **Detailed Analysis:**
This commit is a **code modernization/refactoring change** that converts
from deprecated MIPI DSI APIs to newer "_multi" variants. Here's my
detailed reasoning: ## 1. **Nature of Changes - API Modernization Only**
The changes are purely about replacing deprecated function calls with
their modern equivalents: - `mipi_dsi_dcs_exit_sleep_mode()` →
`mipi_dsi_dcs_exit_sleep_mode_multi()` -
`mipi_dsi_dcs_set_pixel_format()` →
`mipi_dsi_dcs_set_pixel_format_multi()` -
`mipi_dsi_dcs_set_display_on()` → `mipi_dsi_dcs_set_display_on_multi()`
- `mipi_dsi_dcs_write()` → `mipi_dsi_dcs_write_seq_multi()` - `msleep()`
→ `mipi_dsi_msleep()` This is classic API modernization, not a bug fix.
## 2. **No Functional Bug Fixes** The commit doesn't address any user-
visible issues, crashes, security vulnerabilities, or hardware
compatibility problems. The panel functionality remains identical - this
is purely about using preferred APIs for better error handling patterns.
## 3. **Pattern Consistent with Similar Commits** All the reference
commits provided show the same pattern and are marked as **"Backport
Status: NO"**: - **Similar Commit #1**: "Switch to
mipi_dsi_dcs_write_seq_multi()" - mechanical conversion for code
reduction - **Similar Commit #2**: "add more multi functions" - adding
new API variants and deprecating old ones - **Similar Commit #4**:
"Transition to mipi_dsi_dcs_write_seq_multi" - replacing deprecated
macros - **Similar Commit #5**: "use mipi_dsi_dcs_nop_multi()" -
removing conditional code using multi wrappers All these similar commits
involve the same type of API modernization and none were backported. ##
4. **Error Handling Changes Don't Fix Existing Bugs** While the new
"_multi" pattern provides better error handling through
`dsi_ctx.accum_err`, the original code was already handling errors
properly with explicit return checks. The change improves code
maintainability but doesn't fix any error handling bugs. ## 5. **Stable
Tree Criteria Violation** This commit violates stable tree rules: -
**Not a critical bugfix**: No user-impacting issues resolved -
**Introduces new features**: Uses newer API variants that may not exist
in older kernels - **Code churn without necessity**: Changes working
code for style/modernization reasons - **Potential compatibility
issues**: "_multi" variants may not be available in all stable branches
## 6. **Risk vs. Benefit Analysis** - **Risk**: Potential
incompatibility with older kernel versions, unnecessary code churn -
**Benefit**: None for stable users - no bugs fixed, no new functionality
for end users ## **Conclusion** This is a textbook example of a commit
that should **NOT** be backported to stable trees. It's pure code
modernization that doesn't fix any user-visible problems, follows the
same pattern as other non-backported similar commits, and could
potentially introduce compatibility issues in stable branches. Stable
trees should only receive critical fixes, not API modernization changes.

 .../gpu/drm/panel/panel-sharp-ls043t1le01.c   | 41 +++++++------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
index 729cbb0d8403f..36abfa2e65e96 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
@@ -36,60 +36,49 @@ static inline struct sharp_nt_panel *to_sharp_nt_panel(struct drm_panel *panel)
 static int sharp_nt_panel_init(struct sharp_nt_panel *sharp_nt)
 {
 	struct mipi_dsi_device *dsi = sharp_nt->dsi;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
-	msleep(120);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
 	/* Novatek two-lane operation */
-	ret = mipi_dsi_dcs_write(dsi, 0xae, (u8[]){ 0x03 }, 1);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xae,  0x03);
 
 	/* Set both MCU and RGB I/F to 24bpp */
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, MIPI_DCS_PIXEL_FMT_24BIT |
-					(MIPI_DCS_PIXEL_FMT_24BIT << 4));
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx,
+					    MIPI_DCS_PIXEL_FMT_24BIT |
+					    (MIPI_DCS_PIXEL_FMT_24BIT << 4));
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int sharp_nt_panel_on(struct sharp_nt_panel *sharp_nt)
 {
 	struct mipi_dsi_device *dsi = sharp_nt->dsi;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int sharp_nt_panel_off(struct sharp_nt_panel *sharp_nt)
 {
 	struct mipi_dsi_device *dsi = sharp_nt->dsi;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int sharp_nt_panel_unprepare(struct drm_panel *panel)
-- 
2.39.5

