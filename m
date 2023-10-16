Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3F97CB53E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 23:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B6510E1DD;
	Mon, 16 Oct 2023 21:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DFA10E1DD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 21:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1697491453; x=1698096253; i=deller@gmx.de;
 bh=8jUO08HNrfpJtMMD2zoBRZuL+JGAUil05Lp+9H+JWF4=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=ErqNyeXV6paBZXM/A9In7g7YwJPT83/t1jqsWalb4R5r+QdTOcj1SjnDLbZQ4lFN/FDuAAkQGsm
 jx0vMob1/v6+eVvMTFjt2ClCUTWjKltYJYIHxnQKPBUdjFeXE4czCbWRYH43daLfn/LpskcMLnd+A
 MJwzJjF9JTg3zcDVluP4wXUgtmw7vhYahm68VKlyhEijz5Mmws4Q3f150eub7b+AZKC6cP4rVjvYI
 4pN/iJGaabiBxx0aBZjupLSNJosvcd0UrhphiHKO4KvbHo+tWoRkNv1pHx+PU1ffHPpHNNbiZCB8W
 vKmunsxCSQIdr3ymfLUrGNEEnkrB53LGAU6Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.153.197]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N49lD-1ra7KO0csr-0108uX; Mon, 16
 Oct 2023 23:24:13 +0200
Message-ID: <a47d414d-c9b4-486e-946f-cef58752f589@gmx.de>
Date: Mon, 16 Oct 2023 23:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] video: fbdev: core: cfbcopyarea: fix sloppy typing
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20231013205024.8099-1-s.shtylyov@omp.ru>
 <20231013205024.8099-2-s.shtylyov@omp.ru>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231013205024.8099-2-s.shtylyov@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XFFCCOL6P6sYAvEJFuZyZbt8Lu8fFHw64e5s6bmhMHx9o/p5bnA
 fTNDn1ulxfPtUNmkWLjsJ4EtRh3h+7je9euZ60jRXJazYMDR3wN2VwMvcyOtgf3g4E2WoOR
 RoMmX/4F41+sx4g9yO184OBYF6pvPVBkxunR3bLlE02neGxjAZ1ToBFJv6Q7IEApsmeO8X/
 KYVlppPX6ytKU4RS6UGbw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/KBklV4KaOE=;3qzpPseRovlfNqpB0sdTZYlj/+Q
 EOcVECWHswr1Dah0IXzYRiq082/QR8tM3TQ4SBq9XxEGIHO3x2GoowOzRZLMMajcgo5aBbdBW
 s/cK+36+Rt4hDreOqGEIdjloeA2o+iCs/Nvwp5z/8lIgGBZ9SJEB6QEkqCkdrjZDfGLM87nYa
 QyAktUe3klD8cHB2e2CQdggHoDS9utLqs1Z+mJsBGdrdA9OVQLatewWzeiwLdYow2ncSbwfcn
 h0BbcRa2Q51vWOT0Yzi0arsOQ+omHnTpWHwecotVpdfTDrmMMiHfcCfGMGDtSpbf4XkYQ9qU9
 zuNW1heNOKNP1c323l8vgHKTx6yyhMMQSs1DQV3fdEaN3o5EtXfYopW7Oq6HzBHQetcgXWGfk
 jxXpDd/FnHQTyAMnk2tnoxDJ1uyJdN8hE33v3RT8jsF1y+M9C4x1YOfdP9/kgWhQAsuwYNQff
 sU8FeAJvIO6B531+LcDENwXswwN6APjIN/pKSrnMF2uEC3+XI+jnCINo9TZ9IaqP+Wi3hcj2M
 x/IR2v9DZYax1aQeA8V088UcBIFIzwNMB1zIr6wdUPlVDmVH/yyHCp7NQzE5T9wR3sknGyL+W
 qLXuWaGYzXt/i5Zxl0sB+iH+Aqz6Bxk8o4OyXBTDl+qMqCtKCkJ7pH40HY8fQKJB4eIspjaoF
 OISlqf2CaQVMyGRorwIh/j5MIL96oyQ2oH8dIwiBHfauI0Mt069t55Wv6BoMObIgRI/IuFcWC
 I9WXVOlSI0zzWt8AHk16SiaLqYbCeuHGdWBlHuIALDE84INPxQlLwaOD2d3DNtoHMfMLZoir/
 d1+xN4Gcz3c2/FFul1pApaps60RX8A//vTDHvo9iu9Ygr7tpu9J/BupFSdzjDWKdUjQUyfpV2
 YexIRCm1uVpPh9OZ8bRSAi05YKqPZdjMUf/IH93DLAiT8jvO5Vb7o1t2PUsoTRZsdAGUoEZ5z
 ZAHyx3r2HiPCzQBWEs/pUX0rRhE=
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

On 10/13/23 22:50, Sergey Shtylyov wrote:
> In cfb_copyarea(), the local variable bits_per_line is needlessly typed =
as
> *unsigned long* -- which is a 32-bit type on the 32-bit arches and a 64-=
bit
> type on the 64-bit arches; that variable's value is derived from the __u=
32
> typed fb_fix_screeninfo::line_length field (multiplied by 8u) and a 32-b=
it
> *unsigned int* type should still be enough to store the # of bits per li=
ne.
>
> Found by Linux Verification Center (linuxtesting.org) with the Svace sta=
tic
> analysis tool.
>
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

applied both patches.

Thanks!
Helge

> ---
>   drivers/video/fbdev/core/cfbcopyarea.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/core/cfbcopyarea.c b/drivers/video/fbde=
v/core/cfbcopyarea.c
> index 6d4bfeecee35..5b80bf3dae50 100644
> --- a/drivers/video/fbdev/core/cfbcopyarea.c
> +++ b/drivers/video/fbdev/core/cfbcopyarea.c
> @@ -382,7 +382,7 @@ void cfb_copyarea(struct fb_info *p, const struct fb=
_copyarea *area)
>   {
>   	u32 dx =3D area->dx, dy =3D area->dy, sx =3D area->sx, sy =3D area->s=
y;
>   	u32 height =3D area->height, width =3D area->width;
> -	unsigned long const bits_per_line =3D p->fix.line_length*8u;
> +	unsigned int const bits_per_line =3D p->fix.line_length * 8u;
>   	unsigned long __iomem *base =3D NULL;
>   	int bits =3D BITS_PER_LONG, bytes =3D bits >> 3;
>   	unsigned dst_idx =3D 0, src_idx =3D 0, rev_copy =3D 0;

