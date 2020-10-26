Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6BF299BA1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 00:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10506EA95;
	Mon, 26 Oct 2020 23:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9D66EA88;
 Mon, 26 Oct 2020 23:52:40 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FD85221FA;
 Mon, 26 Oct 2020 23:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603756360;
 bh=Tck5dv2qtba8u2Jf38M/7hnYMasdDz2D8I9vwSUc5ds=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XxaBzqwCrhRbcEwefjgmMMnrwHJv6KqJPVn1dYWk1iBVyxN+qMSr4n8XRjHnDo2JD
 S+3k7av78/1wqp2WEUTHJkKb4uinEf5deGLjI2SAPWZmE/iqmqqMjx1lFEi8L9E+Fc
 XST/aue7EgwVgworSunmqFxcYSjXSUmMDTinoHM0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 029/132] drm/amdgpu: restore ras flags when user
 resets eeprom(v2)
Date: Mon, 26 Oct 2020 19:50:21 -0400
Message-Id: <20201026235205.1023962-29-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026235205.1023962-1-sashal@kernel.org>
References: <20201026235205.1023962-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Guchun Chen <guchun.chen@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guchun Chen <guchun.chen@amd.com>

[ Upstream commit bf0b91b78f002faa1be1902a75eeb0797f9fbcf3 ]

RAS flags needs to be cleaned as well when user requires
one clean eeprom.

v2: RAS flags shall be restored after eeprom reset succeeds.

Signed-off-by: Guchun Chen <guchun.chen@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 3f47f35eedff1..50fc974655f0d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -364,12 +364,19 @@ static ssize_t amdgpu_ras_debugfs_ctrl_write(struct file *f, const char __user *
 static ssize_t amdgpu_ras_debugfs_eeprom_write(struct file *f, const char __user *buf,
 		size_t size, loff_t *pos)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)file_inode(f)->i_private;
+	struct amdgpu_device *adev =
+		(struct amdgpu_device *)file_inode(f)->i_private;
 	int ret;
 
-	ret = amdgpu_ras_eeprom_reset_table(&adev->psp.ras.ras->eeprom_control);
+	ret = amdgpu_ras_eeprom_reset_table(
+			&(amdgpu_ras_get_context(adev)->eeprom_control));
 
-	return ret == 1 ? size : -EIO;
+	if (ret == 1) {
+		amdgpu_ras_get_context(adev)->flags = RAS_DEFAULT_FLAGS;
+		return size;
+	} else {
+		return -EIO;
+	}
 }
 
 static const struct file_operations amdgpu_ras_debugfs_ctrl_ops = {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
