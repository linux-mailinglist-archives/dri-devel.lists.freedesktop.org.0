Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3F3967071
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 11:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADFE10E0E7;
	Sat, 31 Aug 2024 09:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="lOCgYrI3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B088610E0D7
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 09:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1725095953; x=1725700753; i=wahrenst@gmx.net;
 bh=DCJM6CMJUU62uUqG060BsY+UBF9LmX3KRYG14zeCN44=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lOCgYrI399GLa63LDSPh5EW2elI/NgrymunA7/8s8tAxhpVoW+3noM+EYCtv+eIZ
 BR08UBUpFfQzpV5hGx0nAtqAqEbvRnaeYxrsuT996nzjmQrhjZ4gVJWk5jRZbYAof
 w1PGH4vNU4c48mswNprIh7nGkcWcSZtfxRyuReDd25FcEK0VIHLePrjDXh4zgmtbH
 m1svDgwAygZVP8o6I13bHkgrXaENuqyR/14dO6wM1sEDa4AFVb2xD/w24/ebHbmVM
 fOs5HhznSB3hv5Md3HqElYOfy6arteqkGwhi9WSpkhRPUhNnM8et3OJL3o0gwb7Xz
 HGcrgeOy4alVQNmWDA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYvY2-1sX2bg3y6a-00WVDP; Sat, 31
 Aug 2024 11:19:13 +0200
Message-ID: <7ba14fe2-38e0-414c-bc3d-62c1e70741ad@gmx.net>
Date: Sat, 31 Aug 2024 11:19:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/9] mailbox: bcm2835: Fix timeout during suspend mode
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Doug Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Russell King <linux@armlinux.org.uk>,
 Minas Harutyunyan <hminas@synopsys.com>, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-list@raspberrypi.com, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240821214052.6800-1-wahrenst@gmx.net>
 <20240821214052.6800-2-wahrenst@gmx.net>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240821214052.6800-2-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:LHmw1KfsSaItuLqhBtv7gcE2AE8rQOkuLoH3Y1mUAtW48KNCQ6H
 +zxuSDUOD3/UQ0MsI3HZwFJTu/WyaZn3+j6xUw8k421h56WyzSJDZTBfGHxrvEkkw8KYWEM
 SKc8hJT3sBmz0KJ5Su+4fh+g3DbZ3tirJGHiCV6LrLEtok4VRnYVciZUbzOnfuGO77V8plW
 Qr29fYuTJIZMw+eeFw90w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GCjBaRtpmXg=;K7QcE9qCs2b8RuGubAZxIcNWAvp
 Wtb4OuvQ/77mPUc7Ynl+S+De8oF8dxA1QusqUi9hqvE5ZkXh7zxx5VpwT5SV/fififXJ+7T1t
 ACRCVNbU2lXyryXh/+JuzTMIJsCe3Ycmim25oRf+kPp/2a6XXItpyb97qoLAOEwoapBBfsxfT
 XBsMQ36wrDwe8AqRqTz5++WQIBRQoUmqisu0XjAdRT0IRC5otUhlZuAXrn1IJIaO/Kjum1VU8
 BnM7ID6EHU1KgND74TQknPT3K8LnPocgQsQHB5i88abm3k6lqG+ZvFEDRMyY0NMozU344u2fc
 dPWoRt3ECcGhzwGCFk0wS5BkJEz7JvhCYvYPuiRgove1qiRBadDa1I3UhmEs1NrXsuoVKGXmx
 oUsZ27hQbRs7Gf/XZlCvrQRtfpqk9UPmi+hkGQWRtBEN8ddf14zZOfm0u5WsMPRwl7xppJ0R8
 AbB+ibHpCAeNWkfeRuTNUnIjwXSFeQrkZ9HRBpmrR5BBh2HwEzCtax9hXcUaLWlvHVBaWQ93u
 CRyuaPZ8LYt8/VE2iC1QVZUCTk5c9gKhmO5fjODuqpw2id0YkSYNSv/GKsuUQP8HsWI1Xlwqa
 WBt+5qeFTb3yA3xVhXbx16/kj5/NGgVbki6ecOR4x9Qo/ekHEKgM4AZCHUl0J3fZw4ebUpYyY
 1mom1slF7ofeeZ2wPEzsIBbI0Fe7zoAMUPWSmJWAzbW2MpIcrjuGdhgdfuao+j9vQctG1eSRR
 thgWZpbAgev3jPnSAmvs5OU/YxsRWR2An4OJ9EQOo3KSJdDiBjj/l0jxS8jr+ixLqHKRExGT5
 WU9G5J4kuK8b+c9KlLlm7pXA==
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

Hi Jassi,

Am 21.08.24 um 23:40 schrieb Stefan Wahren:
> During noirq suspend phase the Raspberry Pi power driver suffer of
> firmware property timeouts. The reason is that the IRQ of the underlying
> BCM2835 mailbox is disabled and rpi_firmware_property_list() will always
> run into a timeout [1].
>
> Since the VideoCore side isn't consider as a wakeup source, set the
> IRQF_NO_SUSPEND flag for the mailbox IRQ in order to keep it enabled
> during suspend-resume cycle.
>
> [1]
> PM: late suspend of devices complete after 1.754 msecs
> WARNING: CPU: 0 PID: 438 at drivers/firmware/raspberrypi.c:128
>   rpi_firmware_property_list+0x204/0x22c
> Firmware transaction 0x00028001 timeout
> Modules linked in:
> CPU: 0 PID: 438 Comm: bash Tainted: G         C         6.9.3-dirty #17
> Hardware name: BCM2835
> Call trace:
> unwind_backtrace from show_stack+0x18/0x1c
> show_stack from dump_stack_lvl+0x34/0x44
> dump_stack_lvl from __warn+0x88/0xec
> __warn from warn_slowpath_fmt+0x7c/0xb0
> warn_slowpath_fmt from rpi_firmware_property_list+0x204/0x22c
> rpi_firmware_property_list from rpi_firmware_property+0x68/0x8c
> rpi_firmware_property from rpi_firmware_set_power+0x54/0xc0
> rpi_firmware_set_power from _genpd_power_off+0xe4/0x148
> _genpd_power_off from genpd_sync_power_off+0x7c/0x11c
> genpd_sync_power_off from genpd_finish_suspend+0xcc/0xe0
> genpd_finish_suspend from dpm_run_callback+0x78/0xd0
> dpm_run_callback from device_suspend_noirq+0xc0/0x238
> device_suspend_noirq from dpm_suspend_noirq+0xb0/0x168
> dpm_suspend_noirq from suspend_devices_and_enter+0x1b8/0x5ac
> suspend_devices_and_enter from pm_suspend+0x254/0x2e4
> pm_suspend from state_store+0xa8/0xd4
> state_store from kernfs_fop_write_iter+0x154/0x1a0
> kernfs_fop_write_iter from vfs_write+0x12c/0x184
> vfs_write from ksys_write+0x78/0xc0
> ksys_write from ret_fast_syscall+0x0/0x54
> Exception stack(0xcc93dfa8 to 0xcc93dff0)
> [...]
> PM: noirq suspend of devices complete after 3095.584 msecs
>
> Link: https://github.com/raspberrypi/firmware/issues/1894
> Fixes: 0bae6af6d704 ("mailbox: Enable BCM2835 mailbox support")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
gentle ping
> ---
>   drivers/mailbox/bcm2835-mailbox.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mailbox/bcm2835-mailbox.c b/drivers/mailbox/bcm2835-mailbox.c
> index fbfd0202047c..ea12fb8d2401 100644
> --- a/drivers/mailbox/bcm2835-mailbox.c
> +++ b/drivers/mailbox/bcm2835-mailbox.c
> @@ -145,7 +145,8 @@ static int bcm2835_mbox_probe(struct platform_device *pdev)
>   	spin_lock_init(&mbox->lock);
>
>   	ret = devm_request_irq(dev, irq_of_parse_and_map(dev->of_node, 0),
> -			       bcm2835_mbox_irq, 0, dev_name(dev), mbox);
> +			       bcm2835_mbox_irq, IRQF_NO_SUSPEND, dev_name(dev),
> +			       mbox);
>   	if (ret) {
>   		dev_err(dev, "Failed to register a mailbox IRQ handler: %d\n",
>   			ret);
> --
> 2.34.1
>

