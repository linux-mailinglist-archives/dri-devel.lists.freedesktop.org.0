Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2279F8BB677
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B07D112A1F;
	Fri,  3 May 2024 21:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="BUWeOsA0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [95.215.58.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B27112A1F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:54:42 +0000 (UTC)
Message-ID: <4d8f4c9b-2efb-4774-9a37-2f257f79b2c9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714773279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y2853ucShxPVH0hhzsUqBU7LM1cSh77nnSWLF2uYAqA=;
 b=BUWeOsA0/2P3mrUoipdI59mfx6Z9ZUqxsBff025rLQpEMITgxHTVZ9dS4dduZnDjzKTEro
 XU4Ed7K+d42hYYAzzakJTGxl8KrH96WgPonVvNjx5kzSPgPWWM0bKgWSWMzhu0Jz8EPgHO
 QY6+6RvZNTzEX4zO2GBvJ6cb93DDs5M=
Date: Fri, 3 May 2024 17:54:32 -0400
MIME-Version: 1.0
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [BUG] drm: zynqmp_dp: Lockup in zynqmp_dp_bridge_detect when device
 is unbound
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,

I have discovered a bug in the displayport driver on drm-misc-next. To
trigger it, run

echo fd4a0000.display > /sys/bus/platform/drivers/zynqmp-dpsub/unbind

The system will become unresponsive and (after a bit) splat with a hard
LOCKUP. One core will be unresponsive at the first zynqmp_dp_read in
zynqmp_dp_bridge_detect.

I believe the issue is due the registers being unmapped and the block
put into reset in zynqmp_dp_remove instead of zynqmp_dpsub_release. This
could be resolved by deferring things until zynqmp_dpsub_release
(requiring us to skip devm_*), or by adding a flag to struct zynqmp_dp
and checking it before each callback. A subsystem-level implementation
might be better for the latter.

For a better traceback, try applying the below patch and running the
following commands before triggering the lockup:

echo 4 > /sys/module/drm/parameters/debug
echo 8 > /proc/sys/kernel/printk

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 9df068a413f3..17b477b14ab5 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -296,6 +296,7 @@ struct zynqmp_dp_config {
  * @train_set: set of training data
  */
 struct zynqmp_dp {
+       unsigned long long magic;
        struct device *dev;
        struct zynqmp_dpsub *dpsub;
        void __iomem *iomem;
@@ -1533,6 +1534,8 @@ static enum drm_connector_status zynqmp_dp_bridge_detect(struct drm_bridge *brid
        u32 state, i;
        int ret;
 
+       WARN_ON(dp->magic != 0x0123456789abcdefULL);
+
        /*
         * This is from heuristic. It takes some delay (ex, 100 ~ 500 msec) to
         * get the HPD signal with some monitors.
@@ -1723,6 +1726,7 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
        if (!dp)
                return -ENOMEM;
 
+       dp->magic = 0x0123456789abcdefULL;
        dp->dev = &pdev->dev;
        dp->dpsub = dpsub;
        dp->status = connector_status_disconnected;
@@ -1839,4 +1843,5 @@ void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub)
 
        zynqmp_dp_phy_exit(dp);
        zynqmp_dp_reset(dp, true);
+       dp->magic = 0xdeadbeefdeadbeefULL;
 }
