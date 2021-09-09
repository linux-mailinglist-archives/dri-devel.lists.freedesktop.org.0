Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC896404C4C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 13:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2394B6E826;
	Thu,  9 Sep 2021 11:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4096E825;
 Thu,  9 Sep 2021 11:55:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4AC66137A;
 Thu,  9 Sep 2021 11:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188539;
 bh=d0uy1H7o0uVaDv4n6hI95+QyaQXObdt0zxBWx+1kk+o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bY2n0ARwGTQETD94FN50MZ1Rr2eeiWkeQnOEa/4cMWi3+9oWNSEL7Yuew8u9a0vMG
 Cd0oGGJD2T8ZPF6DhfduN3tBFdyI9TXsU8g2X2/eyIavX1I2TNY2XXrTZC2+U8HFxh
 /9Ft9vbvbE5Z1Zg/kwHircqDCuDJdSmMI+s7NfNCTVYFOO0R5KS87dlLjcM958TIBz
 3hyNOqnMsl4HqDGaKwVTzOo+aHYOs3mpeG6TSc+gH2COesNtDFyk7HgVtb6jTlt26k
 2LtOs3tBi6zDQB3WlMLwWB14rq25RzcjJkF81hC7wjYNsJvFv8gGBh1L4C7BaojKsF
 eMpZcDNQ2dbcg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Anson Jacob <Anson.Jacob@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.4 025/109] drm/amd/amdgpu: Update debugfs
 link_settings output link_rate field in hex
Date: Thu,  9 Sep 2021 07:53:42 -0400
Message-Id: <20210909115507.147917-25-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115507.147917-1-sashal@kernel.org>
References: <20210909115507.147917-1-sashal@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Anson Jacob <Anson.Jacob@amd.com>

[ Upstream commit 1a394b3c3de2577f200cb623c52a5c2b82805cec ]

link_rate is updated via debugfs using hex values, set it to output
in hex as well.

eg: Resolution: 1920x1080@144Hz
cat /sys/kernel/debug/dri/0/DP-1/link_settings
Current:  4  0x14  0  Verified:  4  0x1e  0  Reported:  4  0x1e  16  Preferred:  0  0x0  0

echo "4 0x1e" > /sys/kernel/debug/dri/0/DP-1/link_settings

cat /sys/kernel/debug/dri/0/DP-1/link_settings
Current:  4  0x1e  0  Verified:  4  0x1e  0  Reported:  4  0x1e  16  Preferred:  4  0x1e  0

Signed-off-by: Anson Jacob <Anson.Jacob@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index f3dfb2887ae0..2cdcefab2d7d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -95,29 +95,29 @@ static ssize_t dp_link_settings_read(struct file *f, char __user *buf,
 
 	rd_buf_ptr = rd_buf;
 
-	str_len = strlen("Current:  %d  %d  %d  ");
-	snprintf(rd_buf_ptr, str_len, "Current:  %d  %d  %d  ",
+	str_len = strlen("Current:  %d  0x%x  %d  ");
+	snprintf(rd_buf_ptr, str_len, "Current:  %d  0x%x  %d  ",
 			link->cur_link_settings.lane_count,
 			link->cur_link_settings.link_rate,
 			link->cur_link_settings.link_spread);
 	rd_buf_ptr += str_len;
 
-	str_len = strlen("Verified:  %d  %d  %d  ");
-	snprintf(rd_buf_ptr, str_len, "Verified:  %d  %d  %d  ",
+	str_len = strlen("Verified:  %d  0x%x  %d  ");
+	snprintf(rd_buf_ptr, str_len, "Verified:  %d  0x%x  %d  ",
 			link->verified_link_cap.lane_count,
 			link->verified_link_cap.link_rate,
 			link->verified_link_cap.link_spread);
 	rd_buf_ptr += str_len;
 
-	str_len = strlen("Reported:  %d  %d  %d  ");
-	snprintf(rd_buf_ptr, str_len, "Reported:  %d  %d  %d  ",
+	str_len = strlen("Reported:  %d  0x%x  %d  ");
+	snprintf(rd_buf_ptr, str_len, "Reported:  %d  0x%x  %d  ",
 			link->reported_link_cap.lane_count,
 			link->reported_link_cap.link_rate,
 			link->reported_link_cap.link_spread);
 	rd_buf_ptr += str_len;
 
-	str_len = strlen("Preferred:  %d  %d  %d  ");
-	snprintf(rd_buf_ptr, str_len, "Preferred:  %d  %d  %d\n",
+	str_len = strlen("Preferred:  %d  0x%x  %d  ");
+	snprintf(rd_buf_ptr, str_len, "Preferred:  %d  0x%x  %d\n",
 			link->preferred_link_setting.lane_count,
 			link->preferred_link_setting.link_rate,
 			link->preferred_link_setting.link_spread);
-- 
2.30.2

