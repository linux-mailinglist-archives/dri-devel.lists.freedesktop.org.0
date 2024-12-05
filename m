Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4AC9E4F15
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 09:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1802910EDCC;
	Thu,  5 Dec 2024 08:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="nUjm31s+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pv50p00im-tydg10011801.me.com (pv50p00im-tydg10011801.me.com
 [17.58.6.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADFC10E35C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 00:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1733357463;
 bh=J6WeSKH7kVjMpjRr1tuq1yIkFW9eM7Z6c7COG90NeY8=;
 h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:
 x-icloud-hme;
 b=nUjm31s+le2By14e1uvhDXRZcL6JvDqlAm6faRZrYR3lf5tGz2pO9OJANi3o6oJIX
 jDvhVuqB5hl+UMN45ytU5zEd4K74EEp95CEOuasDG6/Q/rDhT9HWfjwHQlTk7gg9Kf
 1H0CpvZD/JK+jpNhp8RCjf0r5Zeqds8scLrXtRFar6mRxbUhmYk/zjuhu4EKn4CLJu
 ai1YelWUhUJ5MEyq0XkuGV4aouHgDFtqzkZtjYS4RP5MtW+iOf1aZ3QVemHCcg9Ow6
 aawF1fTnQiXcSMAlkkDsx520AKxkNmzRAzfwQZWUThz2DShzSKRLjYp96CIRKxGt+P
 0tS7N48Gl948g==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id 7E4458002D7;
 Thu,  5 Dec 2024 00:10:52 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Subject: [PATCH v3 00/11] driver core: Constify API device_find_child()
Date: Thu, 05 Dec 2024 08:10:09 +0800
Message-Id: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGHvUGcC/2XMQQ6CMBCF4auQWVvTUozgynsYQsp0kFnYYotEQ
 3p3a7cu/5e8b4dIgSnCpdoh0MaRvcuhDxXgbNydBNvcUMu6UbVUAr2L62AnHKx3JIwhPCvS40g
 G8mkJNPG7gLc+98xx9eFT/E391kLJVv1RmxJSdLY9kZ66RuN4fb4Y2eER/QP6lNIXY8kkKK4AA
 AA=
X-Change-ID: 20241201-const_dfc_done-aaec71e3bbea
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
 Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux-sound@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-cxl@vger.kernel.org, linux1394-devel@lists.sourceforge.net, 
 arm-scmi@vger.kernel.org, linux-efi@vger.kernel.org, 
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 open-iscsi@googlegroups.com, linux-usb@vger.kernel.org, 
 linux-serial@vger.kernel.org, netdev@vger.kernel.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: SZpoGZHNuD90VNBiGwICh7r4ZYK4OmYI
X-Proofpoint-GUID: SZpoGZHNuD90VNBiGwICh7r4ZYK4OmYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_19,2024-12-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 spamscore=0 mlxlogscore=899 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2412040186
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
X-Mailman-Approved-At: Thu, 05 Dec 2024 08:01:58 +0000
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

This patch series is to constify the following API:
struct device *device_find_child(struct device *dev, void *data,
		int (*match)(struct device *dev, void *data));
To :
struct device *device_find_child(struct device *dev, const void *data,
				 device_match_t match);
typedef int (*device_match_t)(struct device *dev, const void *data);

Why to constify the API?

- Protect caller's match data @*data which is for comparison and lookup
  and the API does not actually need to modify @*data.

- Make the API's parameters (@match)() and @data have the same type as
  all of other device finding APIs (bus|class|driver)_find_device().

- All kinds of existing device matching functions can be directly taken
  as the API's argument, they were exported by driver core.

What to do?

- Patches [1/11, 3/11] prepare for constifying the API.

- Patch 4/11 constifies the API and adapt for its various subsystem usages.

- Remaining do cleanup for several usages with benefits brought above.

---
Changes in v3:
- Solve build broken issue by squashing changes of various subsystem.
- Reduce recipients to try to send out full patch serial.
- Correct tiles and commit messages.
- Link to v2: https://lore.kernel.org/all/20241203-const_dfc_done-v2-0-7436a98c497f@quicinc.com

Changes in v2:
- Series v1 have no code review comments and are posted a long time ago, so may ignore differences.
- Link to v1: https://lore.kernel.org/r/20240811-const_dfc_done-v1-0-9d85e3f943cb@quicinc.com
- Motivation link: https://lore.kernel.org/lkml/917359cc-a421-41dd-93f4-d28937fe2325@icloud.com

---
Zijun Hu (11):
      libnvdimm: Simplify nd_namespace_store() implementation
      slimbus: core: Constify slim_eaddr_equal()
      bus: fsl-mc: Constify fsl_mc_device_match()
      driver core: Constify API device_find_child() then adapt for various usages
      driver core: Simplify API device_find_child_by_name() implementation
      driver core: Remove match_any()
      slimbus: core: Simplify of_find_slim_device() implementation
      gpio: sim: Remove gpio_sim_dev_match_fwnode()
      driver core: Introduce an device matching API device_match_type()
      cxl/pmem: Remove match_nvdimm_bridge()
      usb: typec: class: Remove both cable_match() and partner_match()

 arch/sparc/kernel/vio.c                |  6 +++---
 drivers/base/core.c                    | 30 ++++++++++--------------------
 drivers/block/sunvdc.c                 |  6 +++---
 drivers/bus/fsl-mc/dprc-driver.c       |  8 ++++----
 drivers/cxl/core/pci.c                 |  4 ++--
 drivers/cxl/core/pmem.c                |  9 +++------
 drivers/cxl/core/region.c              | 21 ++++++++++++---------
 drivers/firewire/core-device.c         |  4 ++--
 drivers/firmware/arm_scmi/bus.c        |  4 ++--
 drivers/firmware/efi/dev-path-parser.c |  4 ++--
 drivers/gpio/gpio-sim.c                |  7 +------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 +-
 drivers/hwmon/hwmon.c                  |  2 +-
 drivers/media/pci/mgb4/mgb4_core.c     |  4 ++--
 drivers/nvdimm/bus.c                   |  2 +-
 drivers/nvdimm/claim.c                 |  9 +--------
 drivers/pwm/core.c                     |  2 +-
 drivers/rpmsg/rpmsg_core.c             |  4 ++--
 drivers/scsi/qla4xxx/ql4_os.c          |  3 ++-
 drivers/scsi/scsi_transport_iscsi.c    | 10 +++++-----
 drivers/slimbus/core.c                 | 17 +++++------------
 drivers/thunderbolt/retimer.c          |  2 +-
 drivers/thunderbolt/xdomain.c          |  2 +-
 drivers/tty/serial/serial_core.c       |  4 ++--
 drivers/usb/typec/class.c              | 31 ++++++++++++++-----------------
 include/linux/device.h                 |  4 ++--
 include/linux/device/bus.h             |  1 +
 include/scsi/scsi_transport_iscsi.h    |  4 ++--
 net/dsa/dsa.c                          |  2 +-
 tools/testing/cxl/test/cxl.c           |  2 +-
 30 files changed, 90 insertions(+), 120 deletions(-)
---
base-commit: feffde684ac29a3b7aec82d2df850fbdbdee55e4
change-id: 20241201-const_dfc_done-aaec71e3bbea

Best regards,
-- 
Zijun Hu <quic_zijuhu@quicinc.com>

