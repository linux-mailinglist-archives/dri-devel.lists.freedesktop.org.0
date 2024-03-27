Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9E288DFC2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4BF10FC9F;
	Wed, 27 Mar 2024 12:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XIg4l7+R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42AE10FC96;
 Wed, 27 Mar 2024 12:26:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E0716CE16C2;
 Wed, 27 Mar 2024 12:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B900CC433F1;
 Wed, 27 Mar 2024 12:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711542391;
 bh=c6I8Ilt7BMRkOWNzIl697pUiKROGT3eJAxfs/f6ncJQ=;
 h=From:To:Cc:Subject:Date:From;
 b=XIg4l7+R5UQi2IglUDLt22Q4mTZBnecJFto7c+lBwKKvlwVWYzEpKb9F2kZnHf3cM
 NVMAGFgEzpwgzv7l6iHdW99T/ZZ4rj6CvS/B1GtxNCH/wTsgrhgEsuDIKFdCAkkeE4
 kB8t1yHxFFWRO++ACxiVZHswwcB9GaIzZ1eL08lFUdFyUpcqOQF7p/5TjU1b689mLj
 PzavNI8TP0iKqPOuZ9tjkejCZm2+uxXH4ujbeaXJR7onTuhaliRRjQJIo1tPPsXFQ3
 eHqlKfgzSxIS+KCHwkAwQ5R+YXzJdO8v7/q2nVroLkKEZROELU2qls7bhh/IkNhYfJ
 E9MDIWbe8BtrA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	ville.syrjala@linux.intel.com
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/i915/dp: Limit SST link rate to <=8.1Gbps" failed
 to apply to 4.19-stable tree
Date: Wed, 27 Mar 2024 08:26:29 -0400
Message-ID: <20240327122629.2841148-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 4.19-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 6061811d72e14f41f71b6a025510920b187bfcca Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Date: Thu, 8 Feb 2024 17:45:52 +0200
Subject: [PATCH] drm/i915/dp: Limit SST link rate to <=8.1Gbps
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Limit the link rate to HBR3 or below (<=8.1Gbps) in SST mode.
UHBR (10Gbps+) link rates require 128b/132b channel encoding
which we have not yet hooked up into the SST/no-sideband codepaths.

Cc: stable@vger.kernel.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240208154552.14545-1-ville.syrjala@linux.intel.com
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ab415f41924d7..5045c34a16be1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2356,6 +2356,9 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 	limits->min_rate = intel_dp_common_rate(intel_dp, 0);
 	limits->max_rate = intel_dp_max_link_rate(intel_dp);
 
+	/* FIXME 128b/132b SST support missing */
+	limits->max_rate = min(limits->max_rate, 810000);
+
 	limits->min_lane_count = 1;
 	limits->max_lane_count = intel_dp_max_lane_count(intel_dp);
 
-- 
2.43.0




