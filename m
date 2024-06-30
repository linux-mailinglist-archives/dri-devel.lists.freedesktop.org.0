Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5165291D259
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 17:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7138110E281;
	Sun, 30 Jun 2024 15:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="HqwyRkuo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1972410E27B
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2024 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1719761839; x=1720366639; i=wahrenst@gmx.net;
 bh=ih3wUQeDzJJqL1OWTddn6+L5ffHfGjRbiVctGOrH+AM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=HqwyRkuoE+qRsI0+bsGC/P5S+k1ntwg9R2iHcaSt4zBPCsVFbokHB3+hnVE6g+4K
 IZ2akmhbed3E639JN7lTkCI8LvV6gP5hN4McqVggJj69w+A6h2Z8ZItSK/070OMkn
 RnoD50XogkbvhLocYP7iobTjkghA84DEPBP1rY8PCRmXUJtwz6KJkZmFJEfXGtfwY
 jTYH0JiE2zcfI3j1LR6rm6vWJ4gICa5tkgTY77NyIORF9n2T91GjYrnFqTz2CEWwa
 ErloGGNjt2nxnwCGsA9Oc09dswosSEfyT9A1VvEzsMHv3LhiR1vAlGXZx0RsF7xvy
 k6067PpRJRfl2m7XHw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Msq2E-1s8baQ3Q64-00ufFH; Sun, 30
 Jun 2024 17:37:18 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jiri Slaby <jirislaby@kernel.org>,
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
 Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 02/11] mailbox: bcm2835: Fix timeout during suspend mode
Date: Sun, 30 Jun 2024 17:36:43 +0200
Message-Id: <20240630153652.318882-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630153652.318882-1-wahrenst@gmx.net>
References: <20240630153652.318882-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+eS7VjvylTmd2ce6rQQXNQVZzMe2xTWuYOen4qDXgVNExxnGsfd
 DRRDc00e/b7oFfw1PtqTPjPGxawx4evTppOhjkFTdloe2+teyYa0P9+O3rja0FohGjpcLGf
 QZAa1N0wPmLsjx9sMQ69FB6QKU1teVj1vxft+Q/rpDQoxKFmkJz+s+7F54inVXqEdNkGiIO
 85++VrQYxeuQAPABACv2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8EW4z9MobNc=;JJUIZttLMZqr1SkeydBcjP1xOPu
 Unjiw4xtRYZWx+8jWNS7/NFujaE44rLoAreuM9ovzixRSOHuwaiX5IvDXc/ZBWuIS4Dx+FT26
 WmSSk9Xr0y7JZyOGarctrjVEZqeHcm69gMSEGwcXeQfIF9c/GkufHP17W/AeO5QqJKa7hxkpC
 qSTfqxiSahJcX9E4ihmngP9fID9fZMEagemuUc1EPX/exRL2YMAqqwK/D31hzCoznCsydQmrX
 G/ti47qlJ+GHDSD+WFTnuFtJ0EqHhfj60z3EHojwBJJ7xO34z8+9dusRBtT8h+NXARmlx6Jd/
 d61c1fWDeZZ3AeiYVinXdj06R/RL56GpV+fNPpXhnKpBn95fw4/kB/MMGpjnLezLnD4QAEEiv
 KtTN7E4dOlumDkeQFdgBp4/9GdAqfQbQF3sD/h/7n9DV4EzjrUoZfrMV5fKZz/cj4uLeLHAMs
 bu7vHdtNBtQiSz2twOkSJunW3EJkENGSBcrgZuO56v/amzdzJVihzreqRTJ70L5/zNx3G3ogR
 aG8NJWb+/WNa/HyEySRyOzEJ5OOmG0vGEqCj6yMYi/oHCzDQG8vN4afVwj7WtQ85iea/gspxv
 QsOHYQLTTorNxa4lLkIVBrWi+ux5KgiEgubR87zoCcB3sFilayjUJftidRGic8eY9/jYcW2et
 3qMbMpA9jqp5AhK8g0Y2uwqASCSYgCRIhsvcfhiB33cT3w1zLgkYreCSOdwlqAhKSUZ1hrYzy
 xtMd9N578XdAkaW1MnqYyWn7IF9Mh2/cYZy9WgweNk2Te24+8SlVCftIgk4GYxjGuKSxWqksu
 aLO+1f5vwa7QqijA/YXsn08LcgY7Zct48NRYwB70/OJv0=
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

