Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5B0A93BBF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 19:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AAE10E233;
	Fri, 18 Apr 2025 17:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lnvfy0p2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C7610E231;
 Fri, 18 Apr 2025 17:14:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B6914A4B577;
 Fri, 18 Apr 2025 17:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6707DC4CEF3;
 Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744996442;
 bh=OZmjqaYou2hOWVgwSLN1prGm2SZUlosb+4HXW4GaF/s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lnvfy0p2QOMF7gsoDLe3MV10TIIRdiZCaTWZzcqt8sOh+iFB7VU3UQNMfzYkk3LKj
 WCXFCPMaCWZUGhIK6W0OoUuVfApXNaER0yt6pOIQ0E0P3niqeAO2w5qfc3kQ4OIZOt
 jnqRxMOtiDmSPYVZ8aXK+bDGo86NzcIaQmmj/2YDW6B4DFPaVJ7VhjPuLDrqrZbDW9
 PgwntmM117DGIqmHuZ3ZkddPfpa7n4oT73b9+vNy/aCNNlWz3oFhiP6p0jc5+Qwhk4
 wINXj47NC05MDQJIRJpvKnL+WtzajVq6rHpxi81qxO7N9B448ya/3NCwXwJl0N+amy
 T0FiOeZsq5d8w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id E25EDCE11D5; Fri, 18 Apr 2025 10:14:01 -0700 (PDT)
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
Subject: [PATCH v2 ratelimit 05/14] drm/amd/pm: Avoid open-coded use of
 ratelimit_state structure's internals
Date: Fri, 18 Apr 2025 10:13:50 -0700
Message-Id: <20250418171359.1187719-5-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
References: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
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
the ratelimit_state structure's ->missed field, which work, but which
also makes it more difficult to change this field.  Therefore, make
use of the ratelimit_state_reset_miss() function instead of directly
accessing the ->missed field.

Nevertheless, open-coded use of ->burst and ->interval is still permitted,
for example, for runtime sysfs adjustment of these fields.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503180826.EiekA1MB-lkp@intel.com/
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
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

