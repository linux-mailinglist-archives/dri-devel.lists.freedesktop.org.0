Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A9A5901C1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8B89778B;
	Thu, 11 Aug 2022 16:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1537 seconds by postgrey-1.36 at gabe;
 Thu, 11 Aug 2022 16:00:43 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E09F8ED4A;
 Thu, 11 Aug 2022 16:00:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 95CE5CE2256;
 Thu, 11 Aug 2022 16:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96AB4C433D6;
 Thu, 11 Aug 2022 16:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660233639;
 bh=id/+ZTd9+Vg7mlteQAlUJbibewSF+8p4GBZGenOOAkQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=buQpnOa3B26n1GtiAPS+2LWWAJwqpPYMBfKoM9d6fm+66rvK8LWf9d1cThGjEMsnq
 hSJdehZF9RLUfesoTqm5jJtqF+1owthUGqUZL23d3afLaLxzJQoM1fFklzr6J5Nrzh
 83oO1JZ1lbHJCeTUc7RQm8rV8ZPwG5t/O167Rf3MiFpih+7oAOa3jpnoappNGsThb7
 dnTODiLSecC/Q3WwiHa6bhTHipBDVEXx0+v2a41b6Hnjvp1mi0tDZWjzQ7CqiOdD5m
 wk0AzTknUhds79jBhCojhb2uU9YT+V6WJ7TmnAVGhLCjjo1IIuALUPYoMt/UWYIwtu
 cpYH8qvO+FyGg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 36/69] amdgpu/pm: Fix possible array
 out-of-bounds if SCLK levels != 2
Date: Thu, 11 Aug 2022 11:55:45 -0400
Message-Id: <20220811155632.1536867-36-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811155632.1536867-1-sashal@kernel.org>
References: <20220811155632.1536867-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, lijo.lazar@amd.com, kevin1.wang@amd.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 tao.zhou1@amd.com, amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 Stanley.Yang@amd.com, kent.russell@amd.com,
 Darren Powell <darren.powell@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 Kenneth Feng <kenneth.feng@amd.com>, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Darren Powell <darren.powell@amd.com>

[ Upstream commit ceb180361e3851007547c55035cd1de03f108f75 ]

 [v2]
simplified fix after Lijo's feedback
 removed clocks.num_levels from calculation of loop count
   removed unsafe accesses to shim table freq_values
 retained corner case output only min,now if
   clocks.num_levels == 1 && now > min

 [v1]
added a check to populate and use SCLK shim table freq_values only
   if using dpm_level == AMD_DPM_FORCED_LEVEL_MANUAL or
                         AMD_DPM_FORCED_LEVEL_PERF_DETERMINISM
removed clocks.num_levels from calculation of shim table size
removed unsafe accesses to shim table freq_values
   output gfx_table values if using other dpm levels
added check for freq_match when using freq_values for when now == min_clk

== Test ==
LOGFILE=aldebaran-sclk.test.log
AMDGPU_PCI_ADDR=`lspci -nn | grep "VGA\|Display" | cut -d " " -f 1`
AMDGPU_HWMON=`ls -la /sys/class/hwmon | grep $AMDGPU_PCI_ADDR | awk '{print $9}'`
HWMON_DIR=/sys/class/hwmon/${AMDGPU_HWMON}

lspci -nn | grep "VGA\|Display"  > $LOGFILE
FILES="pp_od_clk_voltage
pp_dpm_sclk"

for f in $FILES
do
  echo === $f === >> $LOGFILE
  cat $HWMON_DIR/device/$f >> $LOGFILE
done
cat $LOGFILE

Signed-off-by: Darren Powell <darren.powell@amd.com>
Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/pm/swsmu/smu13/aldebaran_ppt.c    | 34 +++++++------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
index d0c6b864d00a..b82ef1e10018 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
@@ -729,7 +729,7 @@ static int aldebaran_print_clk_levels(struct smu_context *smu,
 	struct smu_13_0_dpm_table *single_dpm_table;
 	struct smu_dpm_context *smu_dpm = &smu->smu_dpm;
 	struct smu_13_0_dpm_context *dpm_context = NULL;
-	uint32_t display_levels;
+	int display_levels;
 	uint32_t freq_values[3] = {0};
 	uint32_t min_clk, max_clk;
 
@@ -761,7 +761,7 @@ static int aldebaran_print_clk_levels(struct smu_context *smu,
 			return ret;
 		}
 
-		display_levels = clocks.num_levels;
+		display_levels = (clocks.num_levels == 1) ? 1 : 2;
 
 		min_clk = pstate_table->gfxclk_pstate.curr.min;
 		max_clk = pstate_table->gfxclk_pstate.curr.max;
@@ -771,30 +771,20 @@ static int aldebaran_print_clk_levels(struct smu_context *smu,
 
 		/* fine-grained dpm has only 2 levels */
 		if (now > min_clk && now < max_clk) {
-			display_levels = clocks.num_levels + 1;
+			display_levels++;
 			freq_values[2] = max_clk;
 			freq_values[1] = now;
 		}
 
-		/*
-		 * For DPM disabled case, there will be only one clock level.
-		 * And it's safe to assume that is always the current clock.
-		 */
-		if (display_levels == clocks.num_levels) {
-			for (i = 0; i < clocks.num_levels; i++)
-				size += sysfs_emit_at(buf, size, "%d: %uMhz %s\n", i,
-					freq_values[i],
-					(clocks.num_levels == 1) ?
-						"*" :
-						(aldebaran_freqs_in_same_level(
-							 freq_values[i], now) ?
-							 "*" :
-							 ""));
-		} else {
-			for (i = 0; i < display_levels; i++)
-				size += sysfs_emit_at(buf, size, "%d: %uMhz %s\n", i,
-						freq_values[i], i == 1 ? "*" : "");
-		}
+		for (i = 0; i < display_levels; i++)
+			size += sysfs_emit_at(buf, size, "%d: %uMhz %s\n", i,
+				freq_values[i],
+				(display_levels == 1) ?
+					"*" :
+					(aldebaran_freqs_in_same_level(
+						 freq_values[i], now) ?
+						 "*" :
+						 ""));
 
 		break;
 
-- 
2.35.1

