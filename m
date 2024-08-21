Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E9F95A6D4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 23:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55FB10E6E3;
	Wed, 21 Aug 2024 21:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="NKWtp8ZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7F910E5D5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 21:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1724276465; x=1724881265; i=wahrenst@gmx.net;
 bh=IbGjewfMVvYXbrFbwzubZ45vd9Gh3tFpLWbhBJeYuoI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NKWtp8ZEQ6mzpsbeG9vy+n0d59v7F1XtuK+/PFazbByxFfjvMdq4crvcdJHz4U0b
 VnJ09qbsMIdxHdUVVdbRjhIZZ9vdASHOWmOs0vrRevT76+ezgC6ksTIJHrILymTkX
 IGyoK3ixIKruTQ/SedKVlv4cDhuG9800RXIpmM0nuCTvBys1bWIp0jDtc0+Vbpuw4
 oXQa7cW8dh7I7n7eYe4EdAHz4LvgxpVDX8nh5aJiXS1IEVmgdCaA7xyLvRgZzDxyy
 EILzvgAvUcCXuT2+6W5zddu+WoDhj9p5KSD38ht8OVvCpB1eHbpoG0CQgmUFA++l5
 PN05yUDnkbYhF7rEBg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCbIn-1spReE0Nz1-00ASCL; Wed, 21
 Aug 2024 23:41:05 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Russell King <linux@armlinux.org.uk>,
 Doug Anderson <dianders@chromium.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-list@raspberrypi.com, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V3 1/9] mailbox: bcm2835: Fix timeout during suspend mode
Date: Wed, 21 Aug 2024 23:40:44 +0200
Message-Id: <20240821214052.6800-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821214052.6800-1-wahrenst@gmx.net>
References: <20240821214052.6800-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ps0daNFio1td97HjGTIDdopoApycSfa8qEfrfkoFZ4k/zzsd4TR
 wh+HRKwaAmNSD2cF+626TBdV8+DAqDQ2FNzganb2joUii7lzPv7UFjB4bNUHTi8UJksheQt
 5U53WMIb7T/vsiG9v8jj0YNO0Xfj/G2c6xOOUmro8R0JtipHaY+VYz7F8qWrBgx7YHCzOsy
 CxyXiky9R66N8L7GxhjSQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:U16rvxg5ux0=;g/2hdCvWDWc5NREG2mi0oVON4Br
 PiGxu4pgvJ82XvwpCw6YcxKbyU3dR8bGrFqZ1sj6xVULooPQlJ2KZRzkqXJdj1z9AOHE86ZDx
 Cyp71JGEgKzUz2wyg0GL40ci+R8tPyOO06mD8/CJJPdefznxYaXI+4aeGtDvgM6sZIGUWk6/P
 +VxNJf6V6ZvjyPK51RuBnoH+ib/Mex3Nzloyo5ICa3ON2U5N9tXwmbeieQ2SNu8UDkntHhMC4
 sTRTMIYh7GspMJ5M2BULxnhBELpXZUSo1NQiENV+Nok8exR0fuq1diTaMcm2qfUecuPtiSt3L
 M3vRKHWRjkfLWFXxcudklrM6GZehddpilcVfMCYeI1HO9P0Qn9mijRSHL+k7sbmpahAnT2f0T
 bLvpVDH+BtU7nZrza1Vpct/D3IGGxFTGd6mk0oCvjME2zR8Q7pVL8/5MDb2Qd9ibvhjbqjTuR
 lrmCWMlkN/OfNM7BGQOi+PX5I0xoUcipIPNiPImbAf1brOVsiwoQPVTy+zV2zsUEgDpmqLUyf
 Zdh+/fJzcWhhnM+yPDUUwzXSOf5Vx7iQXXLP8dVOfx82tLZrEwMIX0j2x1OO6d4+QoborAYsr
 b+oQsYlmm/HTgJZldCnaacFTBY8rCGtNDE0C4T2eoIf9Y9PRJ/jZZZYMAbLdIx1y5voRKDBwB
 LGeUSK6xkbVXLAIO4Kxq+JUKF/r+2PsJpVwfcc6+akSiegmgyCro1VYKpjDfXWjOQi3q/8GY/
 V5u0d3G5lhrLOhB0PQtKZ+SGV2zAVA75hxNzinI5fO1H47TlZxGkN1dsoOyrMXokZ7ywo1wSw
 /4A0+iC6kO67nbcjq/DK1NHA==
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

During noirq suspend phase the Raspberry Pi power driver suffer of
firmware property timeouts. The reason is that the IRQ of the underlying
BCM2835 mailbox is disabled and rpi_firmware_property_list() will always
run into a timeout [1].

Since the VideoCore side isn't consider as a wakeup source, set the
IRQF_NO_SUSPEND flag for the mailbox IRQ in order to keep it enabled
during suspend-resume cycle.

[1]
PM: late suspend of devices complete after 1.754 msecs
WARNING: CPU: 0 PID: 438 at drivers/firmware/raspberrypi.c:128
 rpi_firmware_property_list+0x204/0x22c
Firmware transaction 0x00028001 timeout
Modules linked in:
CPU: 0 PID: 438 Comm: bash Tainted: G         C         6.9.3-dirty #17
Hardware name: BCM2835
Call trace:
unwind_backtrace from show_stack+0x18/0x1c
show_stack from dump_stack_lvl+0x34/0x44
dump_stack_lvl from __warn+0x88/0xec
__warn from warn_slowpath_fmt+0x7c/0xb0
warn_slowpath_fmt from rpi_firmware_property_list+0x204/0x22c
rpi_firmware_property_list from rpi_firmware_property+0x68/0x8c
rpi_firmware_property from rpi_firmware_set_power+0x54/0xc0
rpi_firmware_set_power from _genpd_power_off+0xe4/0x148
_genpd_power_off from genpd_sync_power_off+0x7c/0x11c
genpd_sync_power_off from genpd_finish_suspend+0xcc/0xe0
genpd_finish_suspend from dpm_run_callback+0x78/0xd0
dpm_run_callback from device_suspend_noirq+0xc0/0x238
device_suspend_noirq from dpm_suspend_noirq+0xb0/0x168
dpm_suspend_noirq from suspend_devices_and_enter+0x1b8/0x5ac
suspend_devices_and_enter from pm_suspend+0x254/0x2e4
pm_suspend from state_store+0xa8/0xd4
state_store from kernfs_fop_write_iter+0x154/0x1a0
kernfs_fop_write_iter from vfs_write+0x12c/0x184
vfs_write from ksys_write+0x78/0xc0
ksys_write from ret_fast_syscall+0x0/0x54
Exception stack(0xcc93dfa8 to 0xcc93dff0)
[...]
PM: noirq suspend of devices complete after 3095.584 msecs

Link: https://github.com/raspberrypi/firmware/issues/1894
Fixes: 0bae6af6d704 ("mailbox: Enable BCM2835 mailbox support")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
=2D--
 drivers/mailbox/bcm2835-mailbox.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/bcm2835-mailbox.c b/drivers/mailbox/bcm2835-m=
ailbox.c
index fbfd0202047c..ea12fb8d2401 100644
=2D-- a/drivers/mailbox/bcm2835-mailbox.c
+++ b/drivers/mailbox/bcm2835-mailbox.c
@@ -145,7 +145,8 @@ static int bcm2835_mbox_probe(struct platform_device *=
pdev)
 	spin_lock_init(&mbox->lock);

 	ret =3D devm_request_irq(dev, irq_of_parse_and_map(dev->of_node, 0),
-			       bcm2835_mbox_irq, 0, dev_name(dev), mbox);
+			       bcm2835_mbox_irq, IRQF_NO_SUSPEND, dev_name(dev),
+			       mbox);
 	if (ret) {
 		dev_err(dev, "Failed to register a mailbox IRQ handler: %d\n",
 			ret);
=2D-
2.34.1

