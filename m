Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0A0ACA12F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF5610E294;
	Sun,  1 Jun 2025 23:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cPU+c4vW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8445B10E27A
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jun 2025 23:25:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0629560EDF;
 Sun,  1 Jun 2025 23:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FB6C4CEE7;
 Sun,  1 Jun 2025 23:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820316;
 bh=qYT/5UcpFwSL+g9PPj+IKZggYjFpbFb3JYDZ3n7U8dk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cPU+c4vWCULOBvZLlgQLlsRrRV2KQ2wfevRch/zD0loXiTLkxW79LlIxViya4Dpt+
 pkNjTUghn2HyP5x3vGxiYCBbQFGJww7Y4/Fyvb2T+pcaKw6Covh1eSxx+vaJeRer4m
 H5ralRnj/wpc4agfgJeUZxHX1LBR7fswz9Dxb8RHRztsLrBibFYG8EYZ/0LsXBwWCg
 UnnhQU0dy/B4NgnqD3ST9BPrSOhTTSJZZ9tnt9MvRQBxxAFraN5qlmtKs8HKMRqxrA
 xWAl/MU20y/hM2oIvCH7Zd5rC/V4KnlSZU81d0NH6a1umcqxtaHSTx1FA9WXLn+Fil
 ra4lBlngowmqQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sasha Levin <sashal@kernel.org>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org,
 dianders@chromium.org, nichen@iscas.ac.cn, u.kleine-koenig@baylibre.com,
 xji@analogixsemi.com, robh@kernel.org, wenst@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 015/110] drm/bridge: anx7625: enable HPD
 interrupts
Date: Sun,  1 Jun 2025 19:22:57 -0400
Message-Id: <20250601232435.3507697-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
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

From: Ayushi Makhija <quic_amakhija@quicinc.com>

[ Upstream commit ca8a78cdceb48ad3b753f836068611265840ef22 ]

When the device enters the suspend state, it prevents
HPD interrupts from occurring. To address this, implement
.hpd_enable() and .hpd_disable() callbacks functions of
the drm_bridge.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20250505094245.2660750-4-quic_amakhija@quicinc.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. ##
Extensive Analysis ### **This is a User-Affecting Bug Fix, Not a Feature
Addition** The commit message states this addresses a real problem:
"When the device enters the suspend state, it prevents HPD interrupts
from occurring." The investigation of the kernel repository reveals this
fixes a significant architectural gap where the anx7625 driver: 1.
**Declares HPD support** by setting `DRM_BRIDGE_OP_HPD` flag (line
2594-2595 in the driver) 2. **Fails to implement required callbacks**
that the DRM bridge framework expects when this flag is set 3. **Causes
unreliable external display detection** particularly during
suspend/resume cycles ### **Code Changes Analysis** The implementation
is extremely minimal and safe: ```c +static void
anx7625_bridge_hpd_enable(struct drm_bridge *bridge) +{ + struct
anx7625_data *ctx = bridge_to_anx7625(bridge); + struct device *dev =
ctx->dev; + + pm_runtime_get_sync(dev); +} + +static void
anx7625_bridge_hpd_disable(struct drm_bridge *bridge) +{ + struct
anx7625_data *ctx = bridge_to_anx7625(bridge); + struct device *dev =
ctx->dev; + + pm_runtime_put_sync(dev); +} ``` - **Only 18 lines of code
added** (including function signatures and braces) - **Uses existing,
well-tested PM runtime APIs**
(`pm_runtime_get_sync`/`pm_runtime_put_sync`) - **No new logic or
complex state management** - simply ensures power is on when HPD is
enabled - **Follows established patterns** already used throughout the
anx7625 driver ### **Meets All Stable Tree Criteria** 1. **✅ Important
Bug Fix**: Fixes missing DRM bridge framework contract compliance that
causes unreliable display detection 2. **✅ Small and Contained**:
Minimal code change confined to a single driver 3. **✅ Low Regression
Risk**: Uses existing PM runtime APIs with no new complex logic 4. **✅
No Architectural Changes**: Simple callback additions to existing
framework 5. **✅ Subsystem Isolation**: Limited to anx7625 bridge
driver, doesn't affect core kernel ### **Historical Precedent**
Comparing to similar HPD-related commits: - **Similar Commit #3 (Status:
YES)**: Another small anx7625 HPD fix addressing hardware timing issues
- This commit follows the same pattern: small, targeted fix for real
user issues ### **Real-World Impact Evidence** The kernel repository
shows multiple recent commits addressing anx7625 HPD and power
management issues: - Power management deadlocks affecting Chromebook
external displays - Bridge suspend/resume problems - HPD detection
window timing issues This commit completes the framework integration
needed to prevent these classes of problems. ### **Risk Assessment**
**Extremely low risk** because: - The PM runtime calls used are the same
ones already extensively used in the driver - The callbacks are only
invoked by the DRM bridge connector framework in well-defined contexts -
No existing functionality is modified - only missing callbacks are added
- Failure modes are limited to the same PM runtime error paths already
handled This is a textbook example of a stable-tree-appropriate fix:
small, safe, addresses real user problems, and completes missing
functionality that users expect to work.

 drivers/gpu/drm/bridge/analogix/anx7625.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 0b97b66de5774..99ef3f27ae429 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2474,6 +2474,22 @@ static const struct drm_edid *anx7625_bridge_edid_read(struct drm_bridge *bridge
 	return anx7625_edid_read(ctx);
 }
 
+static void anx7625_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
+	struct device *dev = ctx->dev;
+
+	pm_runtime_get_sync(dev);
+}
+
+static void anx7625_bridge_hpd_disable(struct drm_bridge *bridge)
+{
+	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
+	struct device *dev = ctx->dev;
+
+	pm_runtime_put_sync(dev);
+}
+
 static const struct drm_bridge_funcs anx7625_bridge_funcs = {
 	.attach = anx7625_bridge_attach,
 	.detach = anx7625_bridge_detach,
@@ -2487,6 +2503,8 @@ static const struct drm_bridge_funcs anx7625_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.detect = anx7625_bridge_detect,
 	.edid_read = anx7625_bridge_edid_read,
+	.hpd_enable = anx7625_bridge_hpd_enable,
+	.hpd_disable = anx7625_bridge_hpd_disable,
 };
 
 static int anx7625_register_i2c_dummy_clients(struct anx7625_data *ctx,
-- 
2.39.5

