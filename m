Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EDAAB068C
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 01:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCAE10E225;
	Thu,  8 May 2025 23:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ao4yOyV3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F9C10E223;
 Thu,  8 May 2025 23:33:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D58B05C64F5;
 Thu,  8 May 2025 23:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB11C4CEEF;
 Thu,  8 May 2025 23:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746747216;
 bh=oSI4AdvwmcSLbAbbuCxcWerS/mPOdTcxQRziDu39kWk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ao4yOyV309QJqgvD0J6pZSDfn7PX/Sk94PVY6wDwhdmjl1VIBygrgblIKi6BsKnXK
 ORKXHZI1zKuT6K9yU2wfX6rFUtHc/8H5HVc2l6nEnWr5YA15Jpj7S1QC1HytNCGnSs
 8BM2MlCkJxh7P4LdBjpkkHdgSsXaxoj/Deo5okICE9KP8T/BnXjLYPgO36bBfFr6h0
 nXaryJJM5lLpvpSr2Oc1Aj3SW7tA7PGm/nzT5Z9PcZoxjsOYpTcMIeakgwE0xE1A52
 vOm3hzR3Izo78oZ/TwKWx8bx4GQvADvP0zpR05RFAWYMPZtAz0dCLtQfHEAXmYUT6B
 hLL7OVlKMJXhg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 65C08CE11F1; Thu,  8 May 2025 16:33:36 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com, Andrew Morton <akpm@linux-foundation.org>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Mateusz Guzik <mjguzik@gmail.com>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jon Pan-Doh <pandoh@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Karolina Stolarek <karolina.stolarek@oracle.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, kernel test robot <lkp@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 04/21] drm/amd/pm: Avoid open-coded use of ratelimit_state
 structure's internals
Date: Thu,  8 May 2025 16:33:18 -0700
Message-Id: <20250508233335.1996059-4-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <1bcf7d5e-b89c-4118-b872-c8896bdbdc19@paulmck-laptop>
References: <1bcf7d5e-b89c-4118-b872-c8896bdbdc19@paulmck-laptop>
MIME-Version: 1.0
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

The amdgpu_set_thermal_throttling_logging() function directly accesses
the ratelimit_state structure's ->missed field, which works, but which
also makes it more difficult to change this field.  Therefore, make use
of the ratelimit_state_reset_interval() function instead of directly
accessing the ->missed field.

Nevertheless, open-coded use of ->burst and ->interval is still permitted,
for example, for runtime sysfs adjustment of these fields.

Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503180826.EiekA1MB-lkp@intel.com/
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Cc: Kenneth Feng <kenneth.feng@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Xinhui Pan <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: <amd-gfx@lists.freedesktop.org>
Cc: <dri-devel@lists.freedesktop.org>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 922def51685b0..d533c79f7e215 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -1606,7 +1606,6 @@ static ssize_t amdgpu_set_thermal_throttling_logging(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 	long throttling_logging_interval;
-	unsigned long flags;
 	int ret = 0;
 
 	ret = kstrtol(buf, 0, &throttling_logging_interval);
@@ -1617,18 +1616,12 @@ static ssize_t amdgpu_set_thermal_throttling_logging(struct device *dev,
 		return -EINVAL;
 
 	if (throttling_logging_interval > 0) {
-		raw_spin_lock_irqsave(&adev->throttling_logging_rs.lock, flags);
 		/*
 		 * Reset the ratelimit timer internals.
 		 * This can effectively restart the timer.
 		 */
-		adev->throttling_logging_rs.interval =
-			(throttling_logging_interval - 1) * HZ;
-		adev->throttling_logging_rs.begin = 0;
-		adev->throttling_logging_rs.printed = 0;
-		adev->throttling_logging_rs.missed = 0;
-		raw_spin_unlock_irqrestore(&adev->throttling_logging_rs.lock, flags);
-
+		ratelimit_state_reset_interval(&adev->throttling_logging_rs,
+					       (throttling_logging_interval - 1) * HZ);
 		atomic_set(&adev->throttling_logging_enabled, 1);
 	} else {
 		atomic_set(&adev->throttling_logging_enabled, 0);
-- 
2.40.1

