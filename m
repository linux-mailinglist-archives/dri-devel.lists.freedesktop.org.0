Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F64930FEE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 10:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96D310E2F8;
	Mon, 15 Jul 2024 08:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1176 seconds by postgrey-1.36 at gabe;
 Mon, 15 Jul 2024 07:22:08 UTC
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B58810E077
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 07:22:07 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WMtMS1smCzQldV;
 Mon, 15 Jul 2024 14:58:28 +0800 (CST)
Received: from dggpeml500003.china.huawei.com (unknown [7.185.36.200])
 by mail.maildlp.com (Postfix) with ESMTPS id 657391800A1;
 Mon, 15 Jul 2024 15:02:29 +0800 (CST)
Received: from [10.174.177.173] (10.174.177.173) by
 dggpeml500003.china.huawei.com (7.185.36.200) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 15:02:28 +0800
Message-ID: <3e66f3b9-668e-06bd-6088-43de9667fce9@huawei.com>
Date: Mon, 15 Jul 2024 15:02:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
From: Yu Liao <liaoyu15@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <liwei391@huawei.com>
Subject: [bug report] drm/vblank: Hard lockup in __disable_vblank()
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.173]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500003.china.huawei.com (7.185.36.200)
X-Mailman-Approved-At: Mon, 15 Jul 2024 08:38:02 +0000
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

A hard lockup is happened when I do fuzz test with syzkaller.

Kernel panic - not syncing: Hard LOCKUP
CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.6.0+ #21
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
Call Trace:
 <IRQ>
 hrtimer_cancel+0x52/0x70 kernel/time/hrtimer.c:1449
 __disable_vblank drivers/gpu/drm/drm_vblank.c:434 [inline]
 drm_vblank_disable_and_save+0x27f/0x3c0 drivers/gpu/drm/drm_vblank.c:478
 vblank_disable_fn+0x15d/0x1b0 drivers/gpu/drm/drm_vblank.c:495
 call_timer_fn+0x39/0x280 kernel/time/timer.c:1700
 expire_timers+0x22d/0x3c0 kernel/time/timer.c:1751
 __run_timers kernel/time/timer.c:2022 [inline]
 run_timer_softirq+0x315/0x8a0 kernel/time/timer.c:2035
 handle_softirqs+0x195/0x580 kernel/softirq.c:553
 __do_softirq kernel/softirq.c:587 [inline]
 </IRQ>

This is a deadlock issue as follows:

    CPU3				CPU 7

vblank_disable_fn()
  drm_vblank_disable_and_save()
  spin_lock(vblank_time_lock)
				hrtimer_interrupt()
				  vkms_vblank_simulate()
				    drm_handle_vblank()
				      //wait for CPU3 to release vblank_time_lock
				      spin_lock(vblank_time_lock)
    vkms_disable_vblank()
      //wait for vblank_hrtimer on CPU7 to finish
      hrtimer_cancel(vblank_hrtimer)

The call of hrtimer_cancel() should not hold locks which would prevent
completion of the hrtimer's callback function.

Best regards,
Yu
