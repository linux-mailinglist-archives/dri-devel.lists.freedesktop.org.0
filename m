Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F72D13E11F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 17:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9576EDE8;
	Thu, 16 Jan 2020 16:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3536EDE8;
 Thu, 16 Jan 2020 16:48:05 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBF2520663;
 Thu, 16 Jan 2020 16:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579193285;
 bh=SvnjTp3S3Rs2yeHSY5+SCBEcB5/rFV/XnzG7hbKOwAs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Tn382tP+vC1YosrVFQbuXjhyzZKZsPAfIokd5ZSfkFAy1S0Tt0gz0q7/JKcv8FzI2
 TzECo6eTeqhEKsiIQ0juLmhT3iwsEOMuakUesSalgsJ5kOia8bNa3yLUKDRsE2dIvH
 LvqB2nu+t/I2kaw5PAR/VTJz2NmrNewzlZZCieVE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 066/205] drm/amdgpu/vi: silence an uninitialized
 variable warning
Date: Thu, 16 Jan 2020 11:40:41 -0500
Message-Id: <20200116164300.6705-66-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116164300.6705-1-sashal@kernel.org>
References: <20200116164300.6705-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit 4ff17a1df7d550257972a838220a8af4611c8f2c ]

Smatch complains that we need to initialized "*cap" otherwise it can
lead to an uninitialized variable bug in the caller.  This seems like a
reasonable warning and it doesn't hurt to silence it at least.

drivers/gpu/drm/amd/amdgpu/vi.c:767 vi_asic_reset_method() error: uninitialized symbol 'baco_reset'.

Fixes: 425db2553e43 ("drm/amdgpu: expose BACO interfaces to upper level from PP")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/powerplay/amd_powerplay.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
index fa8ad7db2b3a..d306cc711997 100644
--- a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
@@ -1421,6 +1421,7 @@ static int pp_get_asic_baco_capability(void *handle, bool *cap)
 {
 	struct pp_hwmgr *hwmgr = handle;
 
+	*cap = false;
 	if (!hwmgr)
 		return -EINVAL;
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
