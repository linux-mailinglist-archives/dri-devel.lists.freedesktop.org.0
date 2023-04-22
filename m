Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 556D76EB844
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 11:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487A310E122;
	Sat, 22 Apr 2023 09:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4D910E122
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 09:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1682156503; i=deller@gmx.de;
 bh=DsrLIIluLdgO3bhcRHmlFP9nZL0fd0/iJPDU9qOBfjc=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=rVSlOPRDQE2i5mnHQnYFaswQlPY/GF82A2OQ4DhfttWy+z7mPOlO+FwB8dSsNqxwD
 Gbv/2omTDZCGzHswS6tCTky9DGDDXep5DdLuTKBG9PcPb2f5cNGJ6N1ZCYE8Q6D3SI
 wpFEduLizWsk3d0NcK5UPP43VHrF755qINxOPrVguNlUnzFMOORccPEpy1e8KF/mnN
 J1mXlA0yVeab75d5kX0Hz+bKPmAuj+/QqfMbdS8Ft+0f9kvZRUh1iBBUGfAom3y2fp
 YQ3hfTEYK61lYJtbOHtXx0wgRllC67xY+xWikrQhMztZINIBUgiIhli3d1gaaFkQyh
 Ri8kpBgH7WBiA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.157.94]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4QwW-1qH0Eq3yT8-011TXz; Sat, 22
 Apr 2023 11:41:43 +0200
Message-ID: <6a884317-392b-f650-a568-d15ccc48003a@gmx.de>
Date: Sat, 22 Apr 2023 11:41:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] video: fbdev: mmp: Fix deferred clk handling in
 mmphw_probe()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Cai Huoqing <cai.huoqing@linux.dev>
References: <685f452cacc74f4983aaff2bc28a02a95e8aa8b7.1681414375.git.christophe.jaillet@wanadoo.fr>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <685f452cacc74f4983aaff2bc28a02a95e8aa8b7.1681414375.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8DLUdHsBEC11ImvIVpi71DOvVHxWYxBpkiAqhEunAt3ANScjdYc
 AtSaGHPFYFszjdvdvKaNoOS3/1/s9T41l0tyUfJU5ZhN0OL10rjjOolav2HU1cX/arYH0H6
 PYUYks1c5oyW/NYNhHGB+2P8JPfAy3il7wWboXWJPT9YAsi9Z0TrUT/kq8OZIjP5aAvZOL0
 Koimrcf+OLuO1sw+37zHA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9Sxpr+R4hCM=;0jIm3eStXPw1yRfwq0/eSMazErh
 RAB6HO/ADP71oPqMdvSzmNdBH28DgGJkIxnWMG2ZZK224PNdje7SMdmPrS0mFt+NgLtSdVMv8
 g86LIOKsGXOqIlMhVo3t52H5gBQvEbakW7tnM+nrkc9nF2YVeNnG7KbvfjSgdPIHGOlByaem6
 8COnX+QzsXYZpnImaSD4je446sX6sZ1R/s+9jqqaT6Bk+bafD8F4SuD9J3CaqDYEOYV9sZ2Hw
 HORXHgk1KpuqEJoeYUIAA9g55CIx9nxXrHWKorYvdq31UdJmpV994sf3Eib9ezowtuLGgircQ
 BNTC4LB0E453jR7vPMqUpXR85+bjJzQTwK9JR1FyW7LwylnrCiQ0dKDWgoOgdD/NO+ChyaJ47
 LLqjWr5+mt1u/1zJVUC1R3ltdGV/y+b1n7z+zf+6XgM7iurni39ECPyJFaFBOlBF1V8e+Zh6Q
 MlDRqsocnJCY8Wird6PT+JcDnPbXOn+5dYv3DbDYDInCRj+w/9b9sHZIgZLKGoUnai3Gf3qNK
 y/xv1jzKBujJcdZ2088q/DwS9CanOftnh7awD2MhKPjVkTBSLmelbv8Vrl+NAqNfK5oDvT5l6
 VMkMKLo2xenz8H3BLQDXEEFSJUjvlcKIzcEY8QUFeMXQVykggal/gM2PL7i6WSZR85oibEd3o
 CSYYG4pPlTvLztrjPJyvuj2orOIsZ2DXo+GqVS44Tm7NLlXp0yaSTO6fNVotcVy6WaK3NeQzN
 OONmZEAAoUwVNnwk93tVRLMlL27qUUWtxSkBYx23kBpcgVVG1pOHXsD73r8qoGHMzdGUqOKPM
 dUH0DDlwO/SojzviCPZXHaDt1X0MDFYRq45DU3fBb9yDlN4V57QC6+MN0hbakEeRG9gMn7vRX
 J5f6dP0cabXmb8tygWYLHgvZdfH2n/rboVt0uuP90WD2s5n0PkTJGB9juMVTWcS2BhXbf1zol
 1oR9FUeySknBwgD+J6DIVUfiqi0=
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/13/23 21:33, Christophe JAILLET wrote:
> When dev_err_probe() is called, 'ret' holds the value of the previous
> successful devm_request_irq() call.
> 'ret' should be assigned with a meaningful value before being used in
> dev_err_probe().
>
> While at it, use and return "PTR_ERR(ctrl->clk)" instead of a hard-coded
> "-ENOENT" so that -EPROBE_DEFER is handled and propagated correctly.
>
> Fixes: 81b63420564d ("video: fbdev: mmp: Make use of the helper function=
 dev_err_probe()")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/video/fbdev/mmp/hw/mmp_ctrl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

applied.

Thanks!
Helge

>
> diff --git a/drivers/video/fbdev/mmp/hw/mmp_ctrl.c b/drivers/video/fbdev=
/mmp/hw/mmp_ctrl.c
> index a9df8ee79810..51fbf02a0343 100644
> --- a/drivers/video/fbdev/mmp/hw/mmp_ctrl.c
> +++ b/drivers/video/fbdev/mmp/hw/mmp_ctrl.c
> @@ -514,9 +514,9 @@ static int mmphw_probe(struct platform_device *pdev)
>   	/* get clock */
>   	ctrl->clk =3D devm_clk_get(ctrl->dev, mi->clk_name);
>   	if (IS_ERR(ctrl->clk)) {
> +		ret =3D PTR_ERR(ctrl->clk);
>   		dev_err_probe(ctrl->dev, ret,
>   			      "unable to get clk %s\n", mi->clk_name);
> -		ret =3D -ENOENT;
>   		goto failed;
>   	}
>   	clk_prepare_enable(ctrl->clk);

