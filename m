Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EFF3479BA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 14:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB99C6EB0C;
	Wed, 24 Mar 2021 13:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1276EAF0;
 Wed, 24 Mar 2021 13:37:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C94061A01;
 Wed, 24 Mar 2021 13:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616593029;
 bh=PslWGV1zAHiCp3MqLppdgDKQmZVZu+7LJijobMo672I=;
 h=From:To:Cc:Subject:Date:From;
 b=YjucVhlv4T4O6vQl3V2slzxT7hy6Co+DyTCphMDBxW5NMFNt8DjqAQgZqd9UF9b5W
 OXFRcGTiWArcvxPvg83co4bR3fHa8DEiq2E6H4xez//ePlhqww/9AU2sauVUBOCA00
 d1F+oi/qwjxBdhkZVtGnU85ewEhX2a4xjJQxSPmTW5bVGsFUTHvrouVIun8RwEPjIg
 VO5dYbrHGWt+O6cE+C+pb9DS0BLkko1UT62XusklGh7hoQzCGFEY4xlEeuzIyWWb9d
 yuJxJbeGWlTdtWreyotXLRL3rkNZpIvarkU8u0JD5emchlX8KUC1mllSw9jdz4I1wV
 eOarLf2DivS1g==
From: Arnd Bergmann <arnd@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] amdgpu: securedisplay: simplify i2c hexdump output
Date: Wed, 24 Mar 2021 14:36:52 +0100
Message-Id: <20210324133705.2664873-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: Jinzhou Su <Jinzhou.Su@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

A previous fix I did left a rather complicated loop in
amdgpu_securedisplay_debugfs_write() for what could be expressed in a
simple sprintf, as Rasmus pointed out.

This drops the leading 0x for each byte, but is otherwise
much nicer.

Suggested-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
index 69d7f6bff5d4..fc3ddd7aa6f0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
@@ -92,9 +92,7 @@ static ssize_t amdgpu_securedisplay_debugfs_write(struct file *f, const char __u
 	struct drm_device *dev = adev_to_drm(adev);
 	uint32_t phy_id;
 	uint32_t op;
-	int i;
 	char str[64];
-	char i2c_output[256];
 	int ret;
 
 	if (*pos || size > sizeof(str) - 1)
@@ -136,12 +134,9 @@ static ssize_t amdgpu_securedisplay_debugfs_write(struct file *f, const char __u
 		ret = psp_securedisplay_invoke(psp, TA_SECUREDISPLAY_COMMAND__SEND_ROI_CRC);
 		if (!ret) {
 			if (securedisplay_cmd->status == TA_SECUREDISPLAY_STATUS__SUCCESS) {
-				int pos = 0;
-				memset(i2c_output,  0, sizeof(i2c_output));
-				for (i = 0; i < TA_SECUREDISPLAY_I2C_BUFFER_SIZE; i++)
-					pos += sprintf(i2c_output + pos, " 0x%X",
-						securedisplay_cmd->securedisplay_out_message.send_roi_crc.i2c_buf[i]);
-				dev_info(adev->dev, "SECUREDISPLAY: I2C buffer out put is :%s\n", i2c_output);
+				dev_info(adev->dev, "SECUREDISPLAY: I2C buffer out put is: %*ph\n",
+					 TA_SECUREDISPLAY_I2C_BUFFER_SIZE,
+					 securedisplay_cmd->securedisplay_out_message.send_roi_crc.i2c_buf);
 			} else {
 				psp_securedisplay_parse_resp_status(psp, securedisplay_cmd->status);
 			}
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
