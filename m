Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CCEB41479
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 07:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF5A10E0E4;
	Wed,  3 Sep 2025 05:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from unicom146.biz-email.net (unicom146.biz-email.net
 [210.51.26.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3E710E0E4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 05:46:55 +0000 (UTC)
Received: from jtjnmail201602.home.langchao.com
 by unicom146.biz-email.net ((D)) with ASMTP (SSL) id 202509031346473286;
 Wed, 03 Sep 2025 13:46:47 +0800
Received: from localhost.localdomain.com (10.94.10.238) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server id
 15.1.2507.57; Wed, 3 Sep 2025 13:46:47 +0800
From: chuguangqing <chuguangqing@inspur.com>
To: <tzimmermann@suse.de>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <airlied@gmail.com>, <simona@ffwll.cc>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 chuguangqing <chuguangqing@inspur.com>
Subject: [PATCH v2 0/1] [DRIVER] gpu: drm: add support for Yhgc ZX1000 soc
 chipset
Date: Wed, 3 Sep 2025 13:45:32 +0800
Message-ID: <20250903054533.68540-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <086d09a9-680e-48bd-8624-2d3400a57222@suse.de>
References: <086d09a9-680e-48bd-8624-2d3400a57222@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.10.238]
tUid: 2025903134647c97faec2c4897fbdff081ed5fe2aaf10
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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

1. Delete unnecessary comments
2. Delete unnecessary branch
3. Use drm_atomic_helper_check_plane_state
4. remove the alpha formats form this list.
5. use w,h rather than x, y
7. delete type casting
8. use a simple call to drm_atomic_helper_shutdown()
9. delete yhgch_load function
10. delete vblanking code
11. delete unneeded i2c type 

Some other hardware-related issues cannot be confirmed for the time being, but the current code has passed the test.

chuguangqing (1):
  [DRIVER] gpu: drm: add support for Yhgc ZX1000 soc chipset

 MAINTAINERS                                   |   5 +
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/yhgch/Kconfig                 |   3 +
 drivers/gpu/drm/yhgch/Makefile                |   1 +
 drivers/gpu/drm/yhgch/yhgch-drm/Kconfig       |  12 +
 drivers/gpu/drm/yhgch/yhgch-drm/Makefile      |   5 +
 .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_de.c    | 428 ++++++++++++++++++
 .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.c   | 324 +++++++++++++
 .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.h   |  54 +++
 .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_i2c.c   | 108 +++++
 .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_regs.h  | 209 +++++++++
 .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_vdac.c  | 110 +++++
 13 files changed, 1262 insertions(+)
 create mode 100644 drivers/gpu/drm/yhgch/Kconfig
 create mode 100644 drivers/gpu/drm/yhgch/Makefile
 create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/Kconfig
 create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/Makefile
 create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_de.c
 create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.c
 create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.h
 create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_i2c.c
 create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_regs.h
 create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_vdac.c

-- 
2.43.5

