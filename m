Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F01C09617
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 18:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAD610E2F0;
	Sat, 25 Oct 2025 16:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S5MThyjW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B465710E31E
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Oct 2025 16:23:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AF32D6117A;
 Sat, 25 Oct 2025 16:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C97C19421;
 Sat, 25 Oct 2025 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761409415;
 bh=Uo0Xxl9p51/nswKQFjAhaOwx7o/XDgnL+oPo5dwsqt4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S5MThyjWATbNIFw22b/yDP+UdTya5CWGt7+l7stctKMteCbp162U97nyMuYtnBbg6
 U+ngDApt5VkY0+PsxMMzQZFmUQlDlCTh/GdhAkFrbykFJ4UHBprYLFLZkCpout8ayb
 S4az2s/WchcpG5WLy3acDnVK0OMYLdGuvjr3ukLEchqcn/0hWCtDnR5X9cEgCYb+5w
 ixzH4YTyZnc0GsXIkh4nxUR1Q6aI2A9akYgAxH1X+8MzZ8aaBEtAptgznUR1/HI9SH
 CqhCa4wkDwuaEtSPfxPV67p5hlLEdpT1GN6T8XUSDMxqZW0IxHNirT+NmDjvtmVWXk
 xDuKosj1ic46Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Lizhi Hou <lizhi.hou@amd.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Sasha Levin <sashal@kernel.org>, mamin506@gmail.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17] accel/amdxdna: Unify pm and rpm suspend and
 resume callbacks
Date: Sat, 25 Oct 2025 11:59:04 -0400
Message-ID: <20251025160905.3857885-313-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
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

From: Lizhi Hou <lizhi.hou@amd.com>

[ Upstream commit d2b48f2b30f25997a1ae1ad0cefac68c25f8c330 ]

The suspend and resume callbacks for pm and runtime pm should be same.
During suspending, it needs to stop all hardware contexts first. And
the hardware contexts will be restarted after the device is resumed.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Link: https://lore.kernel.org/r/20250803191450.1568851-1-lizhi.hou@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Why this matters
- The previous runtime PM (RPM) suspend/resume paths did not
  stop/restart hardware contexts, while system PM did. This mismatch
  risks leaving DRM scheduler jobs and firmware/mailbox state out of
  sync during RPM autosuspend, leading to command aborts, fence
  timeouts, or wedged contexts after resume.

Evidence of the bug in current code
- System PM suspend stops per-client HW contexts before stopping the
  hardware: drivers/accel/amdxdna/amdxdna_pci_drv.c:367 calls
  `amdxdna_hwctx_suspend(client)` in a loop before suspending the
  device.
- Runtime PM suspend does not stop HW contexts; it only suspends the
  device: drivers/accel/amdxdna/amdxdna_pci_drv.c:400–407.
- System PM resume restarts the device then restarts HW contexts:
  drivers/accel/amdxdna/amdxdna_pci_drv.c:383–395.
- Runtime PM resume does not restart HW contexts; it only resumes the
  device: drivers/accel/amdxdna/amdxdna_pci_drv.c:418–423.

What the patch does
- Unifies PM and RPM flows so both stop contexts before hardware suspend
  and restart them after hardware resume.
  - New device-level suspend/resume ops:
    - `aie2_hw_suspend()` iterates clients and suspends all HW contexts,
      then calls `aie2_hw_stop()`.
    - `aie2_hw_resume()` calls `aie2_hw_start()`, then iterates clients
      and resumes all HW contexts.
    - Implemented in drivers/accel/amdxdna/aie2_pci.c (added functions
      referenced by `.suspend`/`.resume`).
- Moves per-client HW context stop/restart into the AIE2 layer:
  - `aie2_hwctx_suspend(struct amdxdna_client *client)` and
    `aie2_hwctx_resume(struct amdxdna_client *client)` iterate a
    client’s contexts:
    - Wait up to 2s for idle via an output fence, stop DRM scheduler,
      destroy context, save/restore status, then recreate and
      reconfigure CUs and restart scheduler.
    - Implemented in drivers/accel/amdxdna/aie2_ctx.c (replacing the
      previous per-hwctx API).
  - Helper functions `aie2_hwctx_status_shift_stop()` and
    `aie2_hwctx_status_restore()` make status transitions explicit.
- Drops the generic wrappers
  `amdxdna_hwctx_suspend()`/`amdxdna_hwctx_resume()` and their dev_ops
  hooks, avoiding layering divergence:
  - Removal in drivers/accel/amdxdna/amdxdna_ctx.c (previous wrappers)
    and drivers/accel/amdxdna/amdxdna_ctx.h.
  - `aie2_ops` no longer exposes `.hwctx_suspend`/`.hwctx_resume`;
    instead, `.suspend`/`.resume` do the full device+contexts sequence:
    drivers/accel/amdxdna/aie2_pci.c:905.
- Unifies RPM with system PM:
  - `RUNTIME_PM_OPS` now points to the same suspend/resume callbacks as
    system sleep, not separate RPM handlers:
    drivers/accel/amdxdna/amdxdna_pci_drv.c (RUNTIME_PM_OPS now uses
    `amdxdna_pmops_suspend`/`amdxdna_pmops_resume`).
- Returns errors from suspend/resume:
  - `struct amdxdna_dev_ops`’s `.suspend` now returns `int` (was
    `void`), allowing pm core to see failures:
    drivers/accel/amdxdna/amdxdna_pci_drv.h.
  - `amdxdna_pmops_suspend()`/`amdxdna_pmops_resume()` now forward
    errors to the PM core instead of swallowing them:
    drivers/accel/amdxdna/amdxdna_pci_drv.c.

Why this is a good stable backport
- Fixes a real user-visible bug: RPM autosuspend could stop
  firmware/mailbox without quiescing or tearing down contexts, causing
  subsequent failures when resuming or when commands are still pending.
- Minimal and contained: All changes are local to the amdxdna driver; no
  uAPI changes; no kernel core changes; no architectural overhaul.
- Behavior parity: Aligns RPM behavior with system suspend, reducing
  divergence and subtle bugs.
- Safe sequencing: The new flow preserves the established order (stop
  all contexts → stop device; start device → restore contexts), but
  applies it consistently for both PM and RPM. It also maintains locking
  discipline using dev_lock and client hwctx locks.
- Error handling improved: The new `.suspend` returns an error code so
  PM core can act if device resume/suspend fails.

Specific code references
- Divergence in current RPM/system PM handling:
  - drivers/accel/amdxdna/amdxdna_pci_drv.c:367
  - drivers/accel/amdxdna/amdxdna_pci_drv.c:371
  - drivers/accel/amdxdna/amdxdna_pci_drv.c:400
  - drivers/accel/amdxdna/amdxdna_pci_drv.c:418
- Previous AIE2 per-hwctx suspend/resume that system PM used:
  - drivers/accel/amdxdna/aie2_ctx.c:144
  - drivers/accel/amdxdna/aie2_ctx.c:160
- New unified ops: `aie2_ops` switches to device-level suspend/resume:
  - drivers/accel/amdxdna/aie2_pci.c:905
- Struct change to allow suspend to report errors:
  - drivers/accel/amdxdna/amdxdna_pci_drv.h:49

Risk and regressions
- Slightly larger refactor within the driver (removal of wrappers and
  function signature change) but entirely local to amdxdna.
- RPM will now do context teardown/recreation, which takes some time;
  however, this mirrors the safer system PM behavior and prevents
  inconsistent state.
- Uses `guard(mutex)` (present in modern kernels); if an older stable
  branch lacks it, the backport can trivially use explicit
  `mutex_lock()`/`mutex_unlock()`.

Conclusion
- This is a targeted correctness fix that unifies PM flows, prevents
  context/firmware desynchronization under runtime PM, and follows
  stable rules (important bugfix, low regression risk, driver-scoped).
  Backporting is recommended.

 drivers/accel/amdxdna/aie2_ctx.c        | 59 ++++++++++----------
 drivers/accel/amdxdna/aie2_pci.c        | 37 +++++++++++--
 drivers/accel/amdxdna/aie2_pci.h        |  5 +-
 drivers/accel/amdxdna/amdxdna_ctx.c     | 26 ---------
 drivers/accel/amdxdna/amdxdna_ctx.h     |  2 -
 drivers/accel/amdxdna/amdxdna_pci_drv.c | 74 +++----------------------
 drivers/accel/amdxdna/amdxdna_pci_drv.h |  4 +-
 7 files changed, 73 insertions(+), 134 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index cda964ba33cd7..6f77d1794e483 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -46,6 +46,17 @@ static void aie2_job_put(struct amdxdna_sched_job *job)
 	kref_put(&job->refcnt, aie2_job_release);
 }
 
+static void aie2_hwctx_status_shift_stop(struct amdxdna_hwctx *hwctx)
+{
+	 hwctx->old_status = hwctx->status;
+	 hwctx->status = HWCTX_STAT_STOP;
+}
+
+static void aie2_hwctx_status_restore(struct amdxdna_hwctx *hwctx)
+{
+	hwctx->status = hwctx->old_status;
+}
+
 /* The bad_job is used in aie2_sched_job_timedout, otherwise, set it to NULL */
 static void aie2_hwctx_stop(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hwctx,
 			    struct drm_sched_job *bad_job)
@@ -89,25 +100,6 @@ static int aie2_hwctx_restart(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hw
 	return ret;
 }
 
-void aie2_restart_ctx(struct amdxdna_client *client)
-{
-	struct amdxdna_dev *xdna = client->xdna;
-	struct amdxdna_hwctx *hwctx;
-	unsigned long hwctx_id;
-
-	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
-	mutex_lock(&client->hwctx_lock);
-	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
-		if (hwctx->status != HWCTX_STAT_STOP)
-			continue;
-
-		hwctx->status = hwctx->old_status;
-		XDNA_DBG(xdna, "Resetting %s", hwctx->name);
-		aie2_hwctx_restart(xdna, hwctx);
-	}
-	mutex_unlock(&client->hwctx_lock);
-}
-
 static struct dma_fence *aie2_cmd_get_out_fence(struct amdxdna_hwctx *hwctx, u64 seq)
 {
 	struct dma_fence *fence, *out_fence = NULL;
@@ -141,9 +133,11 @@ static void aie2_hwctx_wait_for_idle(struct amdxdna_hwctx *hwctx)
 	dma_fence_put(fence);
 }
 
-void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx)
+void aie2_hwctx_suspend(struct amdxdna_client *client)
 {
-	struct amdxdna_dev *xdna = hwctx->client->xdna;
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_hwctx *hwctx;
+	unsigned long hwctx_id;
 
 	/*
 	 * Command timeout is unlikely. But if it happens, it doesn't
@@ -151,15 +145,19 @@ void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx)
 	 * and abort all commands.
 	 */
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
-	aie2_hwctx_wait_for_idle(hwctx);
-	aie2_hwctx_stop(xdna, hwctx, NULL);
-	hwctx->old_status = hwctx->status;
-	hwctx->status = HWCTX_STAT_STOP;
+	guard(mutex)(&client->hwctx_lock);
+	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
+		aie2_hwctx_wait_for_idle(hwctx);
+		aie2_hwctx_stop(xdna, hwctx, NULL);
+		aie2_hwctx_status_shift_stop(hwctx);
+	}
 }
 
-void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx)
+void aie2_hwctx_resume(struct amdxdna_client *client)
 {
-	struct amdxdna_dev *xdna = hwctx->client->xdna;
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_hwctx *hwctx;
+	unsigned long hwctx_id;
 
 	/*
 	 * The resume path cannot guarantee that mailbox channel can be
@@ -167,8 +165,11 @@ void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx)
 	 * mailbox channel, error will return.
 	 */
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
-	hwctx->status = hwctx->old_status;
-	aie2_hwctx_restart(xdna, hwctx);
+	guard(mutex)(&client->hwctx_lock);
+	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
+		aie2_hwctx_status_restore(hwctx);
+		aie2_hwctx_restart(xdna, hwctx);
+	}
 }
 
 static void
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index c6cf7068d23c0..272c919d6d4fd 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -440,6 +440,37 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
 	return ret;
 }
 
+static int aie2_hw_suspend(struct amdxdna_dev *xdna)
+{
+	struct amdxdna_client *client;
+
+	guard(mutex)(&xdna->dev_lock);
+	list_for_each_entry(client, &xdna->client_list, node)
+		aie2_hwctx_suspend(client);
+
+	aie2_hw_stop(xdna);
+
+	return 0;
+}
+
+static int aie2_hw_resume(struct amdxdna_dev *xdna)
+{
+	struct amdxdna_client *client;
+	int ret;
+
+	guard(mutex)(&xdna->dev_lock);
+	ret = aie2_hw_start(xdna);
+	if (ret) {
+		XDNA_ERR(xdna, "Start hardware failed, %d", ret);
+		return ret;
+	}
+
+	list_for_each_entry(client, &xdna->client_list, node)
+		aie2_hwctx_resume(client);
+
+	return ret;
+}
+
 static int aie2_init(struct amdxdna_dev *xdna)
 {
 	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
@@ -905,8 +936,8 @@ static int aie2_set_state(struct amdxdna_client *client,
 const struct amdxdna_dev_ops aie2_ops = {
 	.init           = aie2_init,
 	.fini           = aie2_fini,
-	.resume         = aie2_hw_start,
-	.suspend        = aie2_hw_stop,
+	.resume         = aie2_hw_resume,
+	.suspend        = aie2_hw_suspend,
 	.get_aie_info   = aie2_get_info,
 	.set_aie_state	= aie2_set_state,
 	.hwctx_init     = aie2_hwctx_init,
@@ -914,6 +945,4 @@ const struct amdxdna_dev_ops aie2_ops = {
 	.hwctx_config   = aie2_hwctx_config,
 	.cmd_submit     = aie2_cmd_submit,
 	.hmm_invalidate = aie2_hmm_invalidate,
-	.hwctx_suspend  = aie2_hwctx_suspend,
-	.hwctx_resume   = aie2_hwctx_resume,
 };
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 385914840eaa6..488d8ee568eb1 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -288,10 +288,9 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
 void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
 int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
-void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx);
-void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx);
+void aie2_hwctx_suspend(struct amdxdna_client *client);
+void aie2_hwctx_resume(struct amdxdna_client *client);
 int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
 void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
-void aie2_restart_ctx(struct amdxdna_client *client);
 
 #endif /* _AIE2_PCI_H_ */
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index be073224bd693..b47a7f8e90170 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -60,32 +60,6 @@ static struct dma_fence *amdxdna_fence_create(struct amdxdna_hwctx *hwctx)
 	return &fence->base;
 }
 
-void amdxdna_hwctx_suspend(struct amdxdna_client *client)
-{
-	struct amdxdna_dev *xdna = client->xdna;
-	struct amdxdna_hwctx *hwctx;
-	unsigned long hwctx_id;
-
-	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
-	mutex_lock(&client->hwctx_lock);
-	amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
-		xdna->dev_info->ops->hwctx_suspend(hwctx);
-	mutex_unlock(&client->hwctx_lock);
-}
-
-void amdxdna_hwctx_resume(struct amdxdna_client *client)
-{
-	struct amdxdna_dev *xdna = client->xdna;
-	struct amdxdna_hwctx *hwctx;
-	unsigned long hwctx_id;
-
-	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
-	mutex_lock(&client->hwctx_lock);
-	amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
-		xdna->dev_info->ops->hwctx_resume(hwctx);
-	mutex_unlock(&client->hwctx_lock);
-}
-
 static void amdxdna_hwctx_destroy_rcu(struct amdxdna_hwctx *hwctx,
 				      struct srcu_struct *ss)
 {
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index f0a4a8586d858..c652229547a3c 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -147,8 +147,6 @@ static inline u32 amdxdna_hwctx_col_map(struct amdxdna_hwctx *hwctx)
 
 void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job);
 void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
-void amdxdna_hwctx_suspend(struct amdxdna_client *client);
-void amdxdna_hwctx_resume(struct amdxdna_client *client);
 
 int amdxdna_cmd_submit(struct amdxdna_client *client,
 		       u32 cmd_bo_hdls, u32 *arg_bo_hdls, u32 arg_bo_cnt,
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index f2bf1d374cc70..fbca94183f963 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -343,89 +343,29 @@ static void amdxdna_remove(struct pci_dev *pdev)
 	mutex_unlock(&xdna->dev_lock);
 }
 
-static int amdxdna_dev_suspend_nolock(struct amdxdna_dev *xdna)
-{
-	if (xdna->dev_info->ops->suspend)
-		xdna->dev_info->ops->suspend(xdna);
-
-	return 0;
-}
-
-static int amdxdna_dev_resume_nolock(struct amdxdna_dev *xdna)
-{
-	if (xdna->dev_info->ops->resume)
-		return xdna->dev_info->ops->resume(xdna);
-
-	return 0;
-}
-
 static int amdxdna_pmops_suspend(struct device *dev)
 {
 	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
-	struct amdxdna_client *client;
-
-	mutex_lock(&xdna->dev_lock);
-	list_for_each_entry(client, &xdna->client_list, node)
-		amdxdna_hwctx_suspend(client);
 
-	amdxdna_dev_suspend_nolock(xdna);
-	mutex_unlock(&xdna->dev_lock);
+	if (!xdna->dev_info->ops->suspend)
+		return -EOPNOTSUPP;
 
-	return 0;
+	return xdna->dev_info->ops->suspend(xdna);
 }
 
 static int amdxdna_pmops_resume(struct device *dev)
 {
 	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
-	struct amdxdna_client *client;
-	int ret;
-
-	XDNA_INFO(xdna, "firmware resuming...");
-	mutex_lock(&xdna->dev_lock);
-	ret = amdxdna_dev_resume_nolock(xdna);
-	if (ret) {
-		XDNA_ERR(xdna, "resume NPU firmware failed");
-		mutex_unlock(&xdna->dev_lock);
-		return ret;
-	}
 
-	XDNA_INFO(xdna, "hardware context resuming...");
-	list_for_each_entry(client, &xdna->client_list, node)
-		amdxdna_hwctx_resume(client);
-	mutex_unlock(&xdna->dev_lock);
-
-	return 0;
-}
-
-static int amdxdna_rpmops_suspend(struct device *dev)
-{
-	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
-	int ret;
-
-	mutex_lock(&xdna->dev_lock);
-	ret = amdxdna_dev_suspend_nolock(xdna);
-	mutex_unlock(&xdna->dev_lock);
-
-	XDNA_DBG(xdna, "Runtime suspend done ret: %d", ret);
-	return ret;
-}
-
-static int amdxdna_rpmops_resume(struct device *dev)
-{
-	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
-	int ret;
-
-	mutex_lock(&xdna->dev_lock);
-	ret = amdxdna_dev_resume_nolock(xdna);
-	mutex_unlock(&xdna->dev_lock);
+	if (!xdna->dev_info->ops->resume)
+		return -EOPNOTSUPP;
 
-	XDNA_DBG(xdna, "Runtime resume done ret: %d", ret);
-	return ret;
+	return xdna->dev_info->ops->resume(xdna);
 }
 
 static const struct dev_pm_ops amdxdna_pm_ops = {
 	SYSTEM_SLEEP_PM_OPS(amdxdna_pmops_suspend, amdxdna_pmops_resume)
-	RUNTIME_PM_OPS(amdxdna_rpmops_suspend, amdxdna_rpmops_resume, NULL)
+	RUNTIME_PM_OPS(amdxdna_pmops_suspend, amdxdna_pmops_resume, NULL)
 };
 
 static struct pci_driver amdxdna_pci_driver = {
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index ab79600911aaa..40bbb3c063203 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -50,13 +50,11 @@ struct amdxdna_dev_ops {
 	int (*init)(struct amdxdna_dev *xdna);
 	void (*fini)(struct amdxdna_dev *xdna);
 	int (*resume)(struct amdxdna_dev *xdna);
-	void (*suspend)(struct amdxdna_dev *xdna);
+	int (*suspend)(struct amdxdna_dev *xdna);
 	int (*hwctx_init)(struct amdxdna_hwctx *hwctx);
 	void (*hwctx_fini)(struct amdxdna_hwctx *hwctx);
 	int (*hwctx_config)(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
 	void (*hmm_invalidate)(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
-	void (*hwctx_suspend)(struct amdxdna_hwctx *hwctx);
-	void (*hwctx_resume)(struct amdxdna_hwctx *hwctx);
 	int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
 	int (*get_aie_info)(struct amdxdna_client *client, struct amdxdna_drm_get_info *args);
 	int (*set_aie_state)(struct amdxdna_client *client, struct amdxdna_drm_set_state *args);
-- 
2.51.0

