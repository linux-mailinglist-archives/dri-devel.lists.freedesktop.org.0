Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C60CE94FC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 11:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE6D10E45E;
	Tue, 30 Dec 2025 10:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="cI3tZl4p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A294810E45E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 10:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1767089417; x=1767694217; i=deller@gmx.de;
 bh=HWMqf7C9R1XN2iJA3m7j7t2Iq+GhqWobceqRGHHQanY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=cI3tZl4plTXQOVab0LRkbHp8lMxz3e6VLMzFV02+nRxmOFPtAfGbangtFiEbJsYv
 kDTObv6+RM8JWwaMKXtnA6METTw7jruy5g2oNOxUutXwaDyGHJdwX+mRtZhlNnvfZ
 9gXgO31glavB5Vq1BR0qKuDa/V8PDGPureJopggXOZGG7mn26c5YPvcjKz0yCRBpS
 WEQ/AZ2zXj/nQTjnWwhrs5IiCxdkrMzvAP0qxgN1PhcMQ8pTFq+GtAOefGzCKroqK
 VJzwZY3x36iynktrMEuNRl6ZDHbmO8XhqOrCFNk3nZXLZFH2zmZyhIwUs0B+NE820
 X382bspEMYSYS/3vDQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.253]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVeMA-1vSrCX13gq-00YZho; Tue, 30
 Dec 2025 11:10:17 +0100
Message-ID: <0e284b23-e753-4100-8959-2d01977c1ad0@gmx.de>
Date: Tue, 30 Dec 2025 11:10:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: geode: lxfb: Use devm_request_mem_region
To: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
 Andres Salomon <dilinger@queued.net>,
 "moderated list:AMD GEODE PROCESSOR/CHIPSET SUPPORT"
 <linux-geode@lists.infradead.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: skhan@linuxfoundation.org, david.hunter.linux@gmail.com
References: <20251214012059.304043-1-swarajgaikwad1925@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251214012059.304043-1-swarajgaikwad1925@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MMqVyPWROZf5r95yg9v8nq/1s2epymBzUdiaWQ62AQvShniR0+U
 hlvGZ2KBycKekQOy2Wo4RkuIpECrqPk5RlFB5x3vddRRKIQ6SbiXx1MdnuIbFBN8TnjcMGw
 jI1zM8c63qkSEogOQCoFNL/sDnDnLmJ41Rl/VWU7dJvLOxVmQ4FuBpzh5n5h/HC7gNM89Pz
 JAA4XFcGaHczsuDdZbDNQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mmw08bnNByI=;zsJKsbmPFbHWBR7FKSQeCSDXKZX
 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
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

Hello Swaraj,

On 12/14/25 02:20, Swaraj Gaikwad wrote:
> The lxfb driver currently uses pci_request_region() for memory
> reservation, which requires manual error handling and cleanup using
> pci_release_region().
>=20
> Simplify the driver by migrating to the managed helper
> devm_request_mem_region(). This ensures that resources are automatically
> released on driver detach, allowing the removal of explicit cleanup code
> in the probe error path and the remove function.
>=20
> This addresses the TODO item "Request memory regions in all fbdev
> drivers" in Documentation/gpu/todo.rst.
>=20
> Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
> ---
> Compile-tested only on x86_64.

I'm somewhat hesitated to apply your geode and arkfb patches.

IIRC, geode and arkfb chips were mostly (only?) used in some
laptops. That means, beside the arkfb and geode onboard graphics
chips there were no other (PCI) graphic cards which could conflict
at VGA addresses. So basically there is no real benefit for
those drivers to switching using devm_* functions.

Then, although your patches seem to be correct, it's hard to say
they are okay without actual testing.

That said, maybe someone still has the hardware and is able to test?

Helge
 =20
>   drivers/video/fbdev/geode/lxfb_core.c | 36 +++++++++------------------
>   1 file changed, 12 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/geode/lxfb_core.c b/drivers/video/fbdev=
/geode/lxfb_core.c
> index cad99f5b7fe8..8189d6a13c5d 100644
> --- a/drivers/video/fbdev/geode/lxfb_core.c
> +++ b/drivers/video/fbdev/geode/lxfb_core.c
> @@ -335,25 +335,21 @@ static int lxfb_map_video_memory(struct fb_info *i=
nfo, struct pci_dev *dev)
>   	if (ret)
>   		return ret;
>=20
> -	ret =3D pci_request_region(dev, 0, "lxfb-framebuffer");
> +	if (!devm_request_mem_region(&dev->dev, pci_resource_start(dev, 0),
> +			      pci_resource_len(dev, 0), "lxfb-framebuffer"))
> +		return -EBUSY;
>=20
> -	if (ret)
> -		return ret;
> -
> -	ret =3D pci_request_region(dev, 1, "lxfb-gp");
> -
> -	if (ret)
> -		return ret;
> +	if (!devm_request_mem_region(&dev->dev, pci_resource_start(dev, 1),
> +			      pci_resource_len(dev, 1), "lxfb-gp"))
> +		return -EBUSY;
>=20
> -	ret =3D pci_request_region(dev, 2, "lxfb-vg");
> +	if (!devm_request_mem_region(&dev->dev, pci_resource_start(dev, 2),
> +			      pci_resource_len(dev, 2), "lxfb-vg"))
> +		return -EBUSY;
>=20
> -	if (ret)
> -		return ret;
> -
> -	ret =3D pci_request_region(dev, 3, "lxfb-vp");
> -
> -	if (ret)
> -		return ret;
> +	if (!devm_request_mem_region(&dev->dev, pci_resource_start(dev, 3),
> +			      pci_resource_len(dev, 3), "lxfb-vp"))
> +		return -EBUSY;
>=20
>   	info->fix.smem_start =3D pci_resource_start(dev, 0);
>   	info->fix.smem_len =3D vram ? vram : lx_framebuffer_size();
> @@ -546,19 +542,15 @@ static int lxfb_probe(struct pci_dev *pdev, const =
struct pci_device_id *id)
>   err:
>   	if (info->screen_base) {
>   		iounmap(info->screen_base);
> -		pci_release_region(pdev, 0);
>   	}
>   	if (par->gp_regs) {
>   		iounmap(par->gp_regs);
> -		pci_release_region(pdev, 1);
>   	}
>   	if (par->dc_regs) {
>   		iounmap(par->dc_regs);
> -		pci_release_region(pdev, 2);
>   	}
>   	if (par->vp_regs) {
>   		iounmap(par->vp_regs);
> -		pci_release_region(pdev, 3);
>   	}
>=20
>   	fb_dealloc_cmap(&info->cmap);
> @@ -575,16 +567,12 @@ static void lxfb_remove(struct pci_dev *pdev)
>   	unregister_framebuffer(info);
>=20
>   	iounmap(info->screen_base);
> -	pci_release_region(pdev, 0);
>=20
>   	iounmap(par->gp_regs);
> -	pci_release_region(pdev, 1);
>=20
>   	iounmap(par->dc_regs);
> -	pci_release_region(pdev, 2);
>=20
>   	iounmap(par->vp_regs);
> -	pci_release_region(pdev, 3);
>=20
>   	fb_dealloc_cmap(&info->cmap);
>   	framebuffer_release(info);
>=20
> base-commit: a859eca0e4cc96f63ff125dbe5388d961558b0e9
> --
> 2.52.0
>=20

