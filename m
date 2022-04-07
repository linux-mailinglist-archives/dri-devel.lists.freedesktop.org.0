Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7774F7EDC
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 14:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5335D10EAE6;
	Thu,  7 Apr 2022 12:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 445 seconds by postgrey-1.36 at gabe;
 Thu, 07 Apr 2022 12:20:49 UTC
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CE510EADD;
 Thu,  7 Apr 2022 12:20:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.101.196.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 35F803F1C1; 
 Thu,  7 Apr 2022 12:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1649333600;
 bh=7d9HpX9xJNe7GwBK5GWCOecxSN4L3nt6+lrVisYKkb4=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=rxBpAzM7VPvJwot97nRvX4vVja01L1CSrfP4x6oTxHQpRIfwv2Oi/bdzfJADL8RWK
 nl1UJR4xIVMyf8NmnbBqmaFt+WTF6kdD+ZvbYWJbDZ1NEhHZZ/47wt4t3SUDFcbOTS
 vPw9Oa/UgV/lKKGJ2b9+RgbOpi+qmHUw+woUoiBIjq/yMLVgCAGIn2fP7OrcnALYd+
 Z9EdM19SIfViFBkWlwQNdSB9M44BNCwgq2fzrMmYkvlq+WmiTcFzJpGCcIzyoEvTCY
 31FOTKQzsBO67uesg419CZzL03wLSH2Yps0X+FTVNhwjOcVH17hWINxfL6Six+8hOx
 TfsgttR368wAQ==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com
Subject: [PATCH] drm/amdgpu: Ensure HDA function is suspended before ASIC reset
Date: Thu,  7 Apr 2022 20:12:28 +0800
Message-Id: <20220407121230.132627-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Solomon Chiu <solomon.chiu@amd.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Evan Quan <evan.quan@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP/HDMI audio on AMD PRO VII stops working after S3:
[  149.450391] amdgpu 0000:63:00.0: amdgpu: MODE1 reset
[  149.450395] amdgpu 0000:63:00.0: amdgpu: GPU mode1 reset
[  149.450494] amdgpu 0000:63:00.0: amdgpu: GPU psp mode1 reset
[  149.983693] snd_hda_intel 0000:63:00.1: refused to change power state from D0 to D3hot
[  150.003439] amdgpu 0000:63:00.0: refused to change power state from D0 to D3hot
...
[  155.432975] snd_hda_intel 0000:63:00.1: CORB reset timeout#2, CORBRP = 65535

The offending commit is daf8de0874ab5b ("drm/amdgpu: always reset the asic in
suspend (v2)"). Commit 34452ac3038a7 ("drm/amdgpu: don't use BACO for
reset in S3 ") doesn't help, so the issue is something different.

Assuming that to make HDA resume to D0 fully realized, it needs to be
successfully put to D3 first. And this guesswork proves working, by
moving amdgpu_asic_reset() to noirq callback, so it's called after HDA
function is in D3.

Fixes: daf8de0874ab5b ("drm/amdgpu: always reset the asic in suspend (v2)")
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index bb1c025d90019..31f7229e7ea89 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2323,18 +2323,23 @@ static int amdgpu_pmops_suspend(struct device *dev)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(drm_dev);
-	int r;
 
 	if (amdgpu_acpi_is_s0ix_active(adev))
 		adev->in_s0ix = true;
 	else
 		adev->in_s3 = true;
-	r = amdgpu_device_suspend(drm_dev, true);
-	if (r)
-		return r;
+	return amdgpu_device_suspend(drm_dev, true);
+}
+
+static int amdgpu_pmops_suspend_noirq(struct device *dev)
+{
+	struct drm_device *drm_dev = dev_get_drvdata(dev);
+	struct amdgpu_device *adev = drm_to_adev(drm_dev);
+
 	if (!adev->in_s0ix)
-		r = amdgpu_asic_reset(adev);
-	return r;
+		return amdgpu_asic_reset(adev);
+
+	return 0;
 }
 
 static int amdgpu_pmops_resume(struct device *dev)
@@ -2575,6 +2580,7 @@ static const struct dev_pm_ops amdgpu_pm_ops = {
 	.prepare = amdgpu_pmops_prepare,
 	.complete = amdgpu_pmops_complete,
 	.suspend = amdgpu_pmops_suspend,
+	.suspend_noirq = amdgpu_pmops_suspend_noirq,
 	.resume = amdgpu_pmops_resume,
 	.freeze = amdgpu_pmops_freeze,
 	.thaw = amdgpu_pmops_thaw,
-- 
2.34.1

