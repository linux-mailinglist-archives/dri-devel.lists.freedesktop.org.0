Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E15D627661
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 08:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5651610E078;
	Mon, 14 Nov 2022 07:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A572410E078
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 07:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1668410974; bh=JlcudpcRB8lLSYM3pyxw2CcM5IMYVAIBgpsHzYD4udo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=WuPQ08JH5+H2QEq6Kj2rJSwFrJFOFksZFFul+YkZedrA5Hxs0PfeC8mGVNDzAIWma
 HOGWc0AN9IcRQ0bkyngoQ/VBfX1XEtagfaCJDOjtonx1i9Zl7zPbBaEpNg5yApB4Z1
 T3vBkj/X4HeBTEDf3tP95IGH4wuI2q+4/ET1Fpxkh9XCTyT14J/eX+QVbKEAlO4QCa
 Asb3TGkMj7YjAITqq09+0RuqYFsv1XxlcMAlvDfd36Kfpmi2WR8pnjjwhnf7qZuCP6
 QJ297i+ms0Plh7huRysr9pQMK3ZWoDWgnrcPGHwn2ZB+HdLafgyMDIVhOIsapDBRMx
 kdO2uWKqtm+og==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.133.36]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M89Gj-1oqNAb2PRr-005GaY; Mon, 14
 Nov 2022 08:29:34 +0100
Message-ID: <7f47e563-8c3c-dcba-3bfc-174681b608f3@gmx.de>
Date: Mon, 14 Nov 2022 08:29:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] fbdev: smscufx: fix error handling code in ufx_usb_probe
Content-Language: en-US
To: Dongliang Mu <dzm91@hust.edu.cn>,
 Steve Glendinning <steve.glendinning@shawell.net>
References: <20221111054949.1002804-1-dzm91@hust.edu.cn>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221111054949.1002804-1-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZGHBiQ9xYRwYtrAQMEY5GJqQKCfzW1rR0WXUUcXgvBu5WQfsVc+
 Am+KcE/Wr9JVYU03OQUANVrkiybqgtilkKDEMfjPpIXjDDyQbAJeTzMowPoF2Usr1f+KaE5
 fytFbovaGWsDZ5/FKLBxUNG6ftHy/p7b45TWFrW/v98xXkFgrvtvh0a69JxJXH001uE02s+
 K/icqzdD9sYs1Ff9aU7Ng==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:E+fDw7+sEKk=;uVWA1A8eE36n1XJBz6XKB1jytRG
 TmLBCVzbgWxycKuR5X2tH2g78MM7uCHNxcPh+Js58pOOdny+EwBvJTLWJwiO62c8rIFdnzev5
 1SWbL6a2THcv//BvF5148ntKKW6CjZAEJfR3rFqxQysRi7EUtr9ArkjjteDofD3TabJn0Bfta
 7kEZ3K3czCiTpGG5tiERuuwg4pYtbdTnRbC9fW8umb+VVTupiz1Te43eqDWvTmgpUOccRAwrb
 48DHS7GVn3VgBI+bGKXqgilItlHdBKoLWmS+BCWdEOSAAlhAL4tRGD7kF9kE525U8cMGwxyJF
 YxqHrhMILcB7bvh+sXLQE3Z8WKAELEmgoTVjKYMeFtiKGAYJA/379pP3JmkIaYzBuxo1mBTmH
 5CAt6rClUn26S4Y1nJB3dfpNOYDMPaPZ54ILeMHKrg89bCs+xDj7h4C3Vtpp0ipg3g67kMLjz
 oPaBZwu8pftwycISviMN6Spj4MzcKZ5hhBJ8EOY4LavorQ2MWtKM5o+OJtiBixSjP/PR7GIJ/
 1B+uT5nuDV3E34RqftyVfmnUr9V84wFnjIQiS0r4rZSAyerUFkVlZj4KdM44/N/7P+N0/Jp9M
 no0RR133MAiY9FxbSZ6SrXN93zX2RHRTR65M2oGToZkiSwRgQ8aUb79kWp16XMrR0odw21Acw
 jXe52Z0xbQ5zRcdYPiOiWGtzshmzmQyPCI2cvTStUdUpMYUhGl/O8xo5a0UTQCJyNggAAQXCp
 6HAL0KRn77NiAy/WOk1kHjDSvyBdsfhgcGkLFPRkXFjoB77S8FS6O9894QPwE/OpCLq+SY9iA
 bICQHUhHj8GXiVUOz6MeZ7Gc1NUDypbyqK2tIps3YS6hyuUTpmqtET9boK17VQUt+tyYWPx/R
 ozPihoArD7FLVcsrVShyZGWVZMny7ad+aauOwpQGjf83ua9Y7nh2yOtNQJuE7cppXJFpv3Mic
 7kTyhQ==
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
Cc: linux-fbdev@vger.kernel.org, syzkaller <syzkaller@googlegroups.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/11/22 06:49, Dongliang Mu wrote:
> The current error handling code in ufx_usb_probe have many unmatching
> issues, e.g., missing ufx_free_usb_list, destroy_modedb label should
> only include framebuffer_release, fb_dealloc_cmap only matches
> fb_alloc_cmap.
>
> My local syzkaller reports a memory leak bug:
>
> memory leak in ufx_usb_probe
>
> BUG: memory leak
> unreferenced object 0xffff88802f879580 (size 128):
>    comm "kworker/0:7", pid 17416, jiffies 4295067474 (age 46.710s)
>    hex dump (first 32 bytes):
>      80 21 7c 2e 80 88 ff ff 18 d0 d0 0c 80 88 ff ff  .!|.............
>      00 d0 d0 0c 80 88 ff ff e0 ff ff ff 0f 00 00 00  ................
>    backtrace:
>      [<ffffffff814c99a0>] kmalloc_trace+0x20/0x90 mm/slab_common.c:1045
>      [<ffffffff824d219c>] kmalloc include/linux/slab.h:553 [inline]
>      [<ffffffff824d219c>] kzalloc include/linux/slab.h:689 [inline]
>      [<ffffffff824d219c>] ufx_alloc_urb_list drivers/video/fbdev/smscufx=
.c:1873 [inline]
>      [<ffffffff824d219c>] ufx_usb_probe+0x11c/0x15a0 drivers/video/fbdev=
/smscufx.c:1655
>      [<ffffffff82d17927>] usb_probe_interface+0x177/0x370 drivers/usb/co=
re/driver.c:396
>      [<ffffffff82712f0d>] call_driver_probe drivers/base/dd.c:560 [inlin=
e]
>      [<ffffffff82712f0d>] really_probe+0x12d/0x390 drivers/base/dd.c:639
>      [<ffffffff8271322f>] __driver_probe_device+0xbf/0x140 drivers/base/=
dd.c:778
>      [<ffffffff827132da>] driver_probe_device+0x2a/0x120 drivers/base/dd=
.c:808
>      [<ffffffff82713c27>] __device_attach_driver+0xf7/0x150 drivers/base=
/dd.c:936
>      [<ffffffff82710137>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c=
:427
>      [<ffffffff827136b5>] __device_attach+0x105/0x2d0 drivers/base/dd.c:=
1008
>      [<ffffffff82711d36>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:=
487
>      [<ffffffff8270e242>] device_add+0x642/0xdc0 drivers/base/core.c:351=
7
>      [<ffffffff82d14d5f>] usb_set_configuration+0x8ef/0xb80 drivers/usb/=
core/message.c:2170
>      [<ffffffff82d2576c>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb=
/core/generic.c:238
>      [<ffffffff82d16ffc>] usb_probe_device+0x5c/0x140 drivers/usb/core/d=
river.c:293
>      [<ffffffff82712f0d>] call_driver_probe drivers/base/dd.c:560 [inlin=
e]
>      [<ffffffff82712f0d>] really_probe+0x12d/0x390 drivers/base/dd.c:639
>      [<ffffffff8271322f>] __driver_probe_device+0xbf/0x140 drivers/base/=
dd.c:778
>
> Fix this bug by rewriting the error handling code in ufx_usb_probe.
>
> Reported-by: syzkaller <syzkaller@googlegroups.com>
> Tested-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>

applied.
Thanks!
Helge

> ---
>   drivers/video/fbdev/smscufx.c | 46 +++++++++++++++++++++++------------
>   1 file changed, 31 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx=
.c
> index 9343b7a4ac89..2ad6e98ce10d 100644
> --- a/drivers/video/fbdev/smscufx.c
> +++ b/drivers/video/fbdev/smscufx.c
> @@ -1622,7 +1622,7 @@ static int ufx_usb_probe(struct usb_interface *int=
erface,
>   	struct usb_device *usbdev;
>   	struct ufx_data *dev;
>   	struct fb_info *info;
> -	int retval;
> +	int retval =3D -ENOMEM;
>   	u32 id_rev, fpga_rev;
>
>   	/* usb initialization */
> @@ -1654,15 +1654,17 @@ static int ufx_usb_probe(struct usb_interface *i=
nterface,
>
>   	if (!ufx_alloc_urb_list(dev, WRITES_IN_FLIGHT, MAX_TRANSFER)) {
>   		dev_err(dev->gdev, "ufx_alloc_urb_list failed\n");
> -		goto e_nomem;
> +		goto put_ref;
>   	}
>
>   	/* We don't register a new USB class. Our client interface is fbdev *=
/
>
>   	/* allocates framebuffer driver structure, not framebuffer memory */
>   	info =3D framebuffer_alloc(0, &usbdev->dev);
> -	if (!info)
> -		goto e_nomem;
> +	if (!info) {
> +		dev_err(dev->gdev, "framebuffer_alloc failed\n");
> +		goto free_urb_list;
> +	}
>
>   	dev->info =3D info;
>   	info->par =3D dev;
> @@ -1705,22 +1707,34 @@ static int ufx_usb_probe(struct usb_interface *i=
nterface,
>   	check_warn_goto_error(retval, "unable to find common mode for display=
 and adapter");
>
>   	retval =3D ufx_reg_set_bits(dev, 0x4000, 0x00000001);
> -	check_warn_goto_error(retval, "error %d enabling graphics engine", ret=
val);
> +	if (retval < 0) {
> +		dev_err(dev->gdev, "error %d enabling graphics engine", retval);
> +		goto setup_modes;
> +	}
>
>   	/* ready to begin using device */
>   	atomic_set(&dev->usb_active, 1);
>
>   	dev_dbg(dev->gdev, "checking var");
>   	retval =3D ufx_ops_check_var(&info->var, info);
> -	check_warn_goto_error(retval, "error %d ufx_ops_check_var", retval);
> +	if (retval < 0) {
> +		dev_err(dev->gdev, "error %d ufx_ops_check_var", retval);
> +		goto reset_active;
> +	}
>
>   	dev_dbg(dev->gdev, "setting par");
>   	retval =3D ufx_ops_set_par(info);
> -	check_warn_goto_error(retval, "error %d ufx_ops_set_par", retval);
> +	if (retval < 0) {
> +		dev_err(dev->gdev, "error %d ufx_ops_set_par", retval);
> +		goto reset_active;
> +	}
>
>   	dev_dbg(dev->gdev, "registering framebuffer");
>   	retval =3D register_framebuffer(info);
> -	check_warn_goto_error(retval, "error %d register_framebuffer", retval)=
;
> +	if (retval < 0) {
> +		dev_err(dev->gdev, "error %d register_framebuffer", retval);
> +		goto reset_active;
> +	}
>
>   	dev_info(dev->gdev, "SMSC UDX USB device /dev/fb%d attached. %dx%d re=
solution."
>   		" Using %dK framebuffer memory\n", info->node,
> @@ -1728,21 +1742,23 @@ static int ufx_usb_probe(struct usb_interface *i=
nterface,
>
>   	return 0;
>
> -error:
> -	fb_dealloc_cmap(&info->cmap);
> -destroy_modedb:
> +reset_active:
> +	atomic_set(&dev->usb_active, 0);
> +setup_modes:
>   	fb_destroy_modedb(info->monspecs.modedb);
>   	vfree(info->screen_base);
>   	fb_destroy_modelist(&info->modelist);
> +error:
> +	fb_dealloc_cmap(&info->cmap);
> +destroy_modedb:
>   	framebuffer_release(info);
> +free_urb_list:
> +	if (dev->urbs.count > 0)
> +		ufx_free_urb_list(dev);
>   put_ref:
>   	kref_put(&dev->kref, ufx_free); /* ref for framebuffer */
>   	kref_put(&dev->kref, ufx_free); /* last ref from kref_init */
>   	return retval;
> -
> -e_nomem:
> -	retval =3D -ENOMEM;
> -	goto put_ref;
>   }
>
>   static void ufx_usb_disconnect(struct usb_interface *interface)

