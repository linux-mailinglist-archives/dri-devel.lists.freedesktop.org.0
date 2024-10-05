Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 557EF991B56
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 01:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4DA10E156;
	Sat,  5 Oct 2024 23:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="hIqsSE+A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DAC10E156
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2024 23:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=bH75UUiSgOjpB/GMh3ZaKU2cpH9596DeOfRb2X80uds=; b=hIqsSE+AIGrZQCB0
 fHhMqECqnOgaS9R9x8Q+OQ5OSy3feIsGQnjpZH+LFJekn29H0aU5yY7rKAqzZEpg7QFm111bC+PwA
 Iyz5pmSO4cvNw5JwEjINdAE/QnzgMDforcNhWNDdU/aLwSOaEFtgwnQXjLq81o8eS2iFClkpOyvaW
 dE5YDwZJO1VHU23rfXngMp7c9aNTxoysbQGgont3mcOWYEBYZnfujYOA/egfGmagprcfqQ0PTwCZF
 Ekn5aUfyvw8HMM87fi8pubWcBxA82VWOCYtkoHxTj2Y/7C1cQNJlfjwYdMONbZOKsl1mUjGGHoRCZ
 fUDOSqtWe3VCEGe5DQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1sxE9o-009Da5-2C;
 Sat, 05 Oct 2024 23:25:52 +0000
From: linux@treblig.org
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/rockchip: cdn-dp: Remove unused functions
Date: Sun,  6 Oct 2024 00:25:51 +0100
Message-ID: <20241005232551.307399-1-linux@treblig.org>
X-Mailer: git-send-email 2.46.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

cdn_dp_get_event and cdn_dp_dpcd_write were added in 2017 by commit
1a0f7ed3abe2 ("drm/rockchip: cdn-dp: add cdn DP support for rk3399")

but unused.
Remove them.
(Build tested only on x86-64)

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/rockchip/cdn-dp-reg.c | 39 ---------------------------
 drivers/gpu/drm/rockchip/cdn-dp-reg.h |  2 --
 2 files changed, 41 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-reg.c b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
index 33fb4d05c506..a57cda971f20 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-reg.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
@@ -244,40 +244,6 @@ int cdn_dp_dpcd_read(struct cdn_dp_device *dp, u32 addr, u8 *data, u16 len)
 	return ret;
 }
 
-int cdn_dp_dpcd_write(struct cdn_dp_device *dp, u32 addr, u8 value)
-{
-	u8 msg[6], reg[5];
-	int ret;
-
-	msg[0] = 0;
-	msg[1] = 1;
-	msg[2] = (addr >> 16) & 0xff;
-	msg[3] = (addr >> 8) & 0xff;
-	msg[4] = addr & 0xff;
-	msg[5] = value;
-	ret = cdn_dp_mailbox_send(dp, MB_MODULE_ID_DP_TX, DPTX_WRITE_DPCD,
-				  sizeof(msg), msg);
-	if (ret)
-		goto err_dpcd_write;
-
-	ret = cdn_dp_mailbox_validate_receive(dp, MB_MODULE_ID_DP_TX,
-					      DPTX_WRITE_DPCD, sizeof(reg));
-	if (ret)
-		goto err_dpcd_write;
-
-	ret = cdn_dp_mailbox_read_receive(dp, reg, sizeof(reg));
-	if (ret)
-		goto err_dpcd_write;
-
-	if (addr != (reg[2] << 16 | reg[3] << 8 | reg[4]))
-		ret = -EINVAL;
-
-err_dpcd_write:
-	if (ret)
-		DRM_DEV_ERROR(dp->dev, "dpcd write failed: %d\n", ret);
-	return ret;
-}
-
 int cdn_dp_load_firmware(struct cdn_dp_device *dp, const u32 *i_mem,
 			 u32 i_size, const u32 *d_mem, u32 d_size)
 {
@@ -400,11 +366,6 @@ int cdn_dp_event_config(struct cdn_dp_device *dp)
 	return ret;
 }
 
-u32 cdn_dp_get_event(struct cdn_dp_device *dp)
-{
-	return readl(dp->regs + SW_EVENTS0);
-}
-
 int cdn_dp_get_hpd_status(struct cdn_dp_device *dp)
 {
 	u8 status;
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-reg.h b/drivers/gpu/drm/rockchip/cdn-dp-reg.h
index 441248b7a79e..68c3dbff1123 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-reg.h
+++ b/drivers/gpu/drm/rockchip/cdn-dp-reg.h
@@ -459,9 +459,7 @@ int cdn_dp_load_firmware(struct cdn_dp_device *dp, const u32 *i_mem,
 int cdn_dp_set_firmware_active(struct cdn_dp_device *dp, bool enable);
 int cdn_dp_set_host_cap(struct cdn_dp_device *dp, u8 lanes, bool flip);
 int cdn_dp_event_config(struct cdn_dp_device *dp);
-u32 cdn_dp_get_event(struct cdn_dp_device *dp);
 int cdn_dp_get_hpd_status(struct cdn_dp_device *dp);
-int cdn_dp_dpcd_write(struct cdn_dp_device *dp, u32 addr, u8 value);
 int cdn_dp_dpcd_read(struct cdn_dp_device *dp, u32 addr, u8 *data, u16 len);
 int cdn_dp_get_edid_block(void *dp, u8 *edid,
 			  unsigned int block, size_t length);
-- 
2.46.2

