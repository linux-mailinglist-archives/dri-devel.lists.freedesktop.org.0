Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F410093E4D4
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 13:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682F610E140;
	Sun, 28 Jul 2024 11:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Qksm5P3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC6310E140
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 11:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1722167052; x=1722771852; i=wahrenst@gmx.net;
 bh=IbGjewfMVvYXbrFbwzubZ45vd9Gh3tFpLWbhBJeYuoI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Qksm5P3p5CRNNdes+g/NL3jPU3p0HnphU3o6RslsQNc6xdp27JbMo4YFDMPvZEPp
 1npoVNRq8Ut84Q/9FW3e9K2LYWLKf9NuClS9noeFFCDzIx7gP67rQD1y3m52hMc6m
 qU9CoBFhmrcJeevpkGpCl5+KoovkMajx+0XYLEoL44FFmyk+kyJWN6JAHZU9j+Us0
 xGJYNwpUFNoQBBwn3zqVMQhcr1RtLU+PpMIkW7GLuPJJx0gsfB0K+brveI5BCYVGO
 xbRESKLXnLysz60odoVdsOgsQoSOi+3SqYSmxnDKRVC0cycwthJI1lh32sS/rTl30
 MypypdLKkzA9dQgv1g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTzay-1sgJoM2ID4-00L8m9; Sun, 28
 Jul 2024 13:44:12 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Jiri Slaby <jirislaby@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
 Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 02/16] mailbox: bcm2835: Fix timeout during suspend mode
Date: Sun, 28 Jul 2024 13:41:46 +0200
Message-Id: <20240728114200.75559-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240728114200.75559-1-wahrenst@gmx.net>
References: <20240728114200.75559-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8gHlvy2cq7q0FmBdgqfBmCudv2v+AkQkTrbr6+v+4cawgLMRiP7
 I6WYfRp6lfU706qmZLWTww4siOukAG7n+jA1FU86+qu98d+U9UMGhdlkyDy7QS5icxFNBoQ
 NOzJmBmCDlN8gyXryRU/xNOovaw4p4zCkJorOxMb2ZmVx52i6MHgBiBiZH9NahfdXKsFV0r
 17NLGKp4+sax2g19ulL0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GvHpumZq+Q4=;f1hgc09s2ZL1zFiR+ZdW9uLpm4l
 Dl83J93DYLWs2cENUpRtKq+92lalmUjF3cfldUv8D4vwexvokVVZ3v6vub5l2CHu/uBNi4VFb
 96xBHlgEsRFrqqd/JeuZ4hzsMPoVDxAou+zwdUcAaDEVML83SSj6WxSAjHamY1O4rYbC9Z1zW
 GpxHei+/kzjv0e1FZduakzXVqURdsOmNfpi1iUyoGaxkpYnQNjI1XTveoVXdMv2uLpvu0a2sE
 3El1GFJxlm4u+xubtnZjY/AMTFqZwMgbrxX5K3KD1H+FiQ15ikaeHqbZctW9tFkPoJFBarEBu
 snVeFD4taEcrRtuBBjVqWNz9y0RTdO4KaXutvq8CkNCi51MwERHOOV2GNbm8Sa7Q37F1veRuu
 0Uo88LrN1eQGeC/5KYpDHEhJVdPCsVNzUpr+hBh++B84KxXpogaSvoGl0MSv3thaBu/HrQd1b
 Vii8/RcP0dviPTwenY9KkZbIrP6BX/LTh1fktdIR1zwWb6AMZMPc83cJLRyo0vtFdBhBomTBj
 ffpmoGVvjwUQOrtX7CV75+i5wMIQ28WR5w+8vrJMIo74GxUKUZbjU+JiwE1KM/BgrUPSNzSRG
 1ssfhtEEh6NFmL6xXeosAaRnjmvZDpl96wCWIGFbyfQ6d7bWS/cXvr7irUcL8Bjbn9u5pwJri
 RwfZjiZyu4SlzmsNfq6IcPb8E7AZaoLstB2zer8eQTeXyrS7+v+LaIdHT5LFFzhTa2VZ6ygXa
 KYC1VR/M+gHjWUHy2roAegzM2+2sZkrRahiQCY1BE4oB4r5B3/D29UlpWOwvBvydCwzxG98wr
 EoDivwl3aXoYFWu89mq048AA==
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

