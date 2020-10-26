Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E01C299B24
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 00:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152046EA85;
	Mon, 26 Oct 2020 23:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC346EA85;
 Mon, 26 Oct 2020 23:49:47 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A75320B1F;
 Mon, 26 Oct 2020 23:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603756187;
 bh=htVQ0lM5PeZptMc1xhUBFGlaX5GmnCOsIXTPr3B8Ttg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZE0+NDzxQqe8F5FknJfZZrGFcORsaasBuNhyTr/aHgi19Vql6v3LSOE+xOwdAoRCx
 /bvA3FiOoZ8C/+DD46YaKnO/8+/tJJaJcEsmuYqAgVnXJMcmm1J7e6lgWqm10OZ/OJ
 h/xOQ2ThJD5rAubyWkD737FMaRgRQmxjfUAZvzY0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 033/147] drm/amdgpu: restore ras flags when user
 resets eeprom(v2)
Date: Mon, 26 Oct 2020 19:47:11 -0400
Message-Id: <20201026234905.1022767-33-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026234905.1022767-1-sashal@kernel.org>
References: <20201026234905.1022767-1-sashal@kernel.org>
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
index 1bedb416eebd0..b4fb5a473df5a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -367,12 +367,19 @@ static ssize_t amdgpu_ras_debugfs_ctrl_write(struct file *f, const char __user *
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
