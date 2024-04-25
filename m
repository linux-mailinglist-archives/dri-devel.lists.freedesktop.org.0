Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500488B1EE0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 12:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE7911A369;
	Thu, 25 Apr 2024 10:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="NMnuMYdm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE6711A37D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 10:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1714040015; x=1714644815; i=deller@gmx.de;
 bh=pzkDqB4oCrdeansAkrKYjZ6pH+bsyogE99NCvj2aUQg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=NMnuMYdmqQq1/cGfeJnBStCgm22HV3KdnkQsA9lFAvz3VAJ4lHe+suQrJUwXAC0L
 1J8PfzqdfCiaz0owdDv0FQJgTXfG8k2bdkBN9Ut8UOptbCeT5nJRFNs7DD3tUsa6E
 S57oRVW/o+VCFTiI+7yAHB5RRg3OSkrqRASxLl6kZyO/LQNUrn1MwYgqF/l/voLu9
 IUm2qeRyTZbMLCLRNZWAg40uHFMxIBzQgdxnwVvha8NiALn818vZr6sAu1sFEvxtt
 jprdJb+qktknewuz+5D1/SkqHmBJSd6mI/464XfAPtgdVKt8CBC8LsMVlzdgOUzD0
 dZrWplWRbF7tXprugQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysW2-1suo7Z1ekM-00vzco; Thu, 25
 Apr 2024 12:13:35 +0200
Message-ID: <784db573-5903-4c13-b0ad-fdeeb7b649de@gmx.de>
Date: Thu, 25 Apr 2024 12:13:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: fbdev: replacing of_node_put with
 __free(device_node)
To: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>, sam@ravnborg.org,
 tzimmermann@suse.de, christophe.jaillet@wanadoo.fr,
 u.kleine-koenig@pengutronix.de, julia.lawall@inria.fr
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 javier.carrasco.cruz@gmail.com
References: <20240423012021.56470-1-abdulrasaqolawani@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240423012021.56470-1-abdulrasaqolawani@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cLoYK3RAKUWSdOY6pQlv7OlqIwml9+GVoL+EEXQ8NdchQNLb/zj
 GXFCxHpUtoQ2ueZvax1PU+p/UTXOGjnhrfOL16gGtIKh2Aljp74vzu1NlXaxblZMcHBmLMT
 MvizEjMG5UocoweYVAWJdHpGJDfEneRkOxzwBRaahxmhERpSZmEDQa9AoffIUn9loxGiqWc
 fQsg6ql/RgDFBP7ader6w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7Bm6gTeIB1w=;mvdNqtr9er35ddS/XAQnZYH2em/
 p1B5ioWPV2HEdhWe7nLTc82QrOA/TzBvNHh1GAtWWp9VKwj3Ht0cGxtRk1iuG2uwu3jbBAu8o
 l323RTgmnb5WdjENF8+rT2meXJUsK3hnIH+ZXGrasI/XmKNpP+gTr3MFJXjNw/de+dDYe1zg2
 scNrCAGKLPVDtRVybE/lxQRjkUoM8njBeh+9t2DGfv46zcgmP9uydLXymZyoBT1EriohPPNm2
 KsbxMrtJwp13oB87JrR44N5SFC9cgaD2xELN4L3nGkleLsMNu+T6NLsidDbAzsEWcvwKEb2Co
 ZkcgZ8tk0JAAzdzpVMtrvhpWwRh+8jHYbGs6IZGFKOcPjWdf9VIP8uOjsFWM719kGaEBP0oV3
 1qa2q8jaSm2ct5Ygz4Gutrs9pYF/HOLb5wBCxDqdONLjIFBDRZAII+Z6D1fR2dfNcCrxhhj9N
 SbtTMtHRU/34IdrNrSsXLYosbTPWBaqTB55x6VGrsab4Y8c/A8COcfDg/tYjpTVaToQJQeLsm
 i8kZej7MEZzPem+LzC7A5w06YON3ItjRKAdjHgFhXNv+SFYnxCIjfNptn4HdkGy4E4+Kla19G
 SQYIlqqS8UEA0zmO/8yvKukohVC+7vFZ5qNZwjU9QwsW+xTsLaRkHWEV2Xgh8/cQ7HoFKOHl/
 JIgcRBduB/BXrJtCnSwHV6gcD8MI/Qw5Ypt6RP9OR0Sq2S2DUIDhqUQeMxtVDn4ZntK5nP7Ya
 iPmviYJL5JB/Z+xBagMR8mdT9YXnBL89h+5EFYj7PSbzBzeHqeGa8tYECcDhAGFKRai5QlmBB
 kPixGUkKaNsPoTchhAuRfVwybotQvmXVq2ylqwYnso3cU=
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

On 4/23/24 03:20, Abdulrasaq Lawani wrote:
> Replaced instance of of_node_put with __free(device_node)
> to simplify code and protect against any memory leaks
> due to future changes in the control flow.
>
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>

applied.
Thanks!

Helge

> ---
>   drivers/video/fbdev/offb.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
> index b421b46d88ef..ea38a260774b 100644
> --- a/drivers/video/fbdev/offb.c
> +++ b/drivers/video/fbdev/offb.c
> @@ -357,7 +357,7 @@ static void offb_init_palette_hacks(struct fb_info *=
info, struct device_node *dp
>   			par->cmap_type =3D cmap_gxt2000;
>   	} else if (of_node_name_prefix(dp, "vga,Display-")) {
>   		/* Look for AVIVO initialized by SLOF */
> -		struct device_node *pciparent =3D of_get_parent(dp);
> +		struct device_node *pciparent __free(device_node) =3D of_get_parent(d=
p);
>   		const u32 *vid, *did;
>   		vid =3D of_get_property(pciparent, "vendor-id", NULL);
>   		did =3D of_get_property(pciparent, "device-id", NULL);
> @@ -369,7 +369,6 @@ static void offb_init_palette_hacks(struct fb_info *=
info, struct device_node *dp
>   			if (par->cmap_adr)
>   				par->cmap_type =3D cmap_avivo;
>   		}
> -		of_node_put(pciparent);
>   	} else if (dp && of_device_is_compatible(dp, "qemu,std-vga")) {
>   #ifdef __BIG_ENDIAN
>   		const __be32 io_of_addr[3] =3D { 0x01000000, 0x0, 0x0 };

