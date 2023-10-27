Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C417D9CE4
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 17:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683B610E9E7;
	Fri, 27 Oct 2023 15:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBDD10E9E7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 15:26:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4E74B615E3;
 Fri, 27 Oct 2023 15:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0F1C433C8;
 Fri, 27 Oct 2023 15:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698420398;
 bh=RxaYtqGr2+GxYO6xhl6ZJJP1os+XOSBfgC7UHEbUye0=;
 h=From:To:Cc:Subject:Date:From;
 b=QQRAlRCtgdel7XpyAAQMZUYi0rbo4jkuK7LtpPJewjmbSzpBVZ3brHDPORY01iu+x
 2otGvxIXE/9aLVuQ8bTPEjSZcxkMtZGF2RKNabJiJh4ZD+sbsBT5NiU+C43/OWhPxF
 3+iaHWEZgbx0QvB535iE0ssAUTipyab/mODrRRTQGNNUutvJfnwitMnyRm5shBII5K
 oPmMsNPhNfXkvWeNhrprqhc7/eFTMqYmY3Sdtxy3zsI8qySpFv2gx0YOAx+tL40MH7
 0T8eVesi1/TapgMZY7BugocSbki5ny8dU8aeC5Hx5xWE7KVVEZhBZuHPwlpL2oVVAl
 7uNNFOM/bx4ZA==
From: Arnd Bergmann <arnd@kernel.org>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: avoid build failure with CONFIG_PM=n
Date: Fri, 27 Oct 2023 17:26:23 +0200
Message-Id: <20231027152633.528490-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The usage count of struct dev_pm_info is an implementation detail that
is only available if CONFIG_PM is enabled, so printing it in a debug message
causes a build failure in configurations without PM:

In file included from include/linux/device.h:15,
                 from include/linux/pci.h:37,
                 from drivers/accel/ivpu/ivpu_pm.c:8:
drivers/accel/ivpu/ivpu_pm.c: In function 'ivpu_rpm_get_if_active':
drivers/accel/ivpu/ivpu_pm.c:254:51: error: 'struct dev_pm_info' has no member named 'usage_count'
  254 |                  atomic_read(&vdev->drm.dev->power.usage_count));
      |                                                   ^
include/linux/dev_printk.h:129:48: note: in definition of macro 'dev_printk'
  129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
      |                                                ^~~~~~~~~~~
drivers/accel/ivpu/ivpu_drv.h:75:17: note: in expansion of macro 'dev_dbg'
   75 |                 dev_dbg((vdev)->drm.dev, "[%s] " fmt, #type, ##args);          \
      |                 ^~~~~~~
drivers/accel/ivpu/ivpu_pm.c:253:9: note: in expansion of macro 'ivpu_dbg'
  253 |         ivpu_dbg(vdev, RPM, "rpm_get_if_active count %d\n",
      |         ^~~~~~~~

The print message does not seem essential, so the easiest workaround is
to just remove it.

Fixes: c39dc15191c4 ("accel/ivpu: Read clock rate only if device is up")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/accel/ivpu/ivpu_pm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 0ace218783c8..e9b16cbc26f4 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -250,9 +250,6 @@ int ivpu_rpm_get_if_active(struct ivpu_device *vdev)
 {
 	int ret;
 
-	ivpu_dbg(vdev, RPM, "rpm_get_if_active count %d\n",
-		 atomic_read(&vdev->drm.dev->power.usage_count));
-
 	ret = pm_runtime_get_if_active(vdev->drm.dev, false);
 	drm_WARN_ON(&vdev->drm, ret < 0);
 
-- 
2.39.2

