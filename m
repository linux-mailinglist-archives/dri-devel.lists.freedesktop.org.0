Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C53B987A0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 09:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE46310E228;
	Wed, 24 Sep 2025 07:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vip.corpemail.net (mail-vip.corpemail.net
 [162.243.126.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937EA10E159
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 07:14:14 +0000 (UTC)
Received: from jtjnmail201610.home.langchao.com
 by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202509241450466645;
 Wed, 24 Sep 2025 14:50:46 +0800
Received: from localhost.localdomain.com (10.94.5.170) by
 jtjnmail201610.home.langchao.com (10.100.2.10) with Microsoft SMTP Server id
 15.1.2507.58; Wed, 24 Sep 2025 14:50:47 +0800
From: Chu Guangqing <chuguangqing@inspur.com>
To: <tzimmermann@suse.de>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <airlied@gmail.com>, <simona@ffwll.cc>,
 <dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, Chu
 Guangqing <chuguangqing@inspur.com>
Subject: [PATCH v4 0/1] [DRIVER] gpu: drm: add support for Yhgc ZX1000 soc
 chipset
Date: Wed, 24 Sep 2025 14:49:53 +0800
Message-ID: <20250924064954.3921-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <d518790b-a224-443a-bbd2-1dfb41f8b0bd@suse.de>
References: <d518790b-a224-443a-bbd2-1dfb41f8b0bd@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.5.170]
tUid: 2025924145046bcdf406d4afb10f49daffd5e3e59633b
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

Sorry, Thomas. The changes have been made this time.

>Hi
>
>Am 10.09.25 um 04:23 schrieb Chu Guangqing:
>> +    select DRM_VRAM_HELPER
>> +    select DRM_TTM_HELPER
>
>I told you twice that VRAM helpers are obsolete and what to use instead.
>
It has been modified.
>> +
>> +struct yhgch_vdac {
>> +	struct drm_connector base;
>> +	struct i2c_adapter adapter;
>> +	struct i2c_algo_bit_data bit_data;
>> +};
>
>I've asked you several times whether to adopt the coding style in
>ast/mgag200 for the DDC.
It has been modified.
>
>No only that you not respond to to any of my reviews, you keep on submitting the same code again and again. Linux kernel development does not work like that.
>
>NAK on this driver until you get your act together.
>
>Best regards
>Thomas
>

to Dmitry:
1. use plane_state->dst instead of crtc_h/w/x/y.
2. delete duplicate framebuffer's atomic_check.
3. use FIELD_PREP() directly.
4. use dev->mode_config.
5. delete unnecessary drm_atomic_helper_shutdown call
6. add AUTHOR
7. using .enable instead 

Chu Guangqing (1):
  [DRIVER] gpu: drm: add support for Yhgc ZX1000 soc chipset

 MAINTAINERS                                   |   5 +
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/yhgch/yhgch-drm/Kconfig       |  11 +
 drivers/gpu/drm/yhgch/yhgch-drm/Makefile      |   4 +
 .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_de.c    | 423 ++++++++++++++++++
 .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.c   | 310 +++++++++++++
 .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.h   |  51 +++
 .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_i2c.c   | 114 +++++
 .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_regs.h  | 208 +++++++++
 .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_vdac.c  | 123 +++++
 11 files changed, 1252 insertions(+)
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

