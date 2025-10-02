Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512BDBB3911
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 12:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F7910E01F;
	Thu,  2 Oct 2025 10:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="ckfVU200";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE22310E01F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 10:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1759399877; x=1760004677; i=deller@gmx.de;
 bh=ahAUlbKeYMw4kObW2wIhCa08EtFJP0e35i5Z/gVr/KU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ckfVU200voCT6PEDhWE3iHvJNof1Y/VJP5EW6GNlu0HiehzFSbgPaq3iFyVvzGl6
 U0Cqs9/y2KA7vm5p8OcuMmeNyQhN2ms2wWbfLH6oNotyZr3SW5AekmzzGV5Ldcz8U
 5tJfuYkUHpOS3ys2/l/z2JMICe2CNVS7TGwgAu207fNVlZ/R6F7ni3EU1SSs99o1Y
 bfwAyn8VZHtA7IW79Iqk2MpPSwr6YCDrsvPWn3g1VuHm7dFlrY5oy0Bfj58w25Kly
 2xjJKVvHeMwT9JD90axjSmRKgUllYzmuD+mMEJwJ8dwxKX9MvGuZ48VE5aIPUcTlF
 fs04ogDJhABkypgbjg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsYqv-1uB2vn2xnH-00y0hQ; Thu, 02
 Oct 2025 12:11:16 +0200
Message-ID: <c008abe6-d16e-4063-a81b-dc52cf71d5a8@gmx.de>
Date: Thu, 2 Oct 2025 12:11:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Add bounds checking in bit_putcs to fix
 vmalloc-out-of-bounds
To: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>,
 syzbot+48b0652a95834717f190@syzkaller.appspotmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250927075010.119671-1-albinbabuvarghese20@gmail.com>
 <cb00a5e2-6e50-4b01-bcd7-33eeae57ed63@gmx.de> <aN1ihRfB-GHTEt_4@arch-box>
 <5ab00319-e43e-4000-8814-c7d67f384c53@gmx.de> <aN49Qt4dezOqAmoo@arch-box>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <aN49Qt4dezOqAmoo@arch-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qDmaz6m0gNP8uIanKiF7WpZDN9xxQaKEPucu4IdX6dG8lVAhGHW
 cIVCCPeOE968Kv/k6DSa+NlueLh2VetgDmmDWjxdHzZf0mHVeoATemOuuHc7/5uGeEecs4X
 7JyJgKbfe6D4D0APtDJnA73qnEkJ4OhlMNWTkbRtqFCQ+G/reX3QhfzP9zXmPCvOHOLIQ2O
 t8jYkzOl8RxL+qPIIVnTQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pMLNWrBJkTE=;g+YNv0Dm68b4j1Tv4oCbboT7SMb
 Mh5/FQWrxfeVub1qZq0zhUi/Ma+HkVFKEtZLwNaS71G0Mgc1c8aK+U2RZJXS1ccuUPch7q2b/
 F4qkiYSb2AiZdsV6uOlLxiKfNYL8NjYXSOcNrSFUpsa+IyKUf33sTXFMmuJ0Te2BPr23TEnSU
 5oQZFVmM/MklYeD0gBGPUZnyu/WbYXJu4u2pKReGkThSi5NqplUl9UP2m3pWci6JyDP2dQzM1
 JM9RVRFjb2/BcMDugrKJMGRrClqd6ruaRB02oie4V/ct7qja/Dx29lyOwKKG6mfaGIgbyIul1
 FSDCkQH6x+LRVu1rJsaf2F8LnN9LpamTICstxiWqPn3Qmk47wU3kBVrcmo3QXZlYfZHWdtzCx
 1eC8mQeQxzeafndYf5yLtkLL4ZxK5O5LhmblFR9XGIO+qR1xDuKAt0HjZ5BlHtACKy1tEmK4W
 iuj6xI3lkvEyFy3zNJ7qylLoraEt235gHIDX/TolqUdRxWz8KhkcsN8mhP6/ej4V2tTTZoSoP
 0OmIWll0CKkg//nOT/2LfkHL0WzipuieyIDjHd47z8HE1Q1pI2w2eMwdmw8xIgT8MEIQEtQa4
 e/4vtnOvR/TamrX/accrwah9vC9e3FeJMAasqX5s28I32gaQ0OFcXn9xX4LgE33jID1KwouKI
 EycpMoPYu13Hh2L7XK2C4Q8b+Q+fLTDss6/COb9tOCJ0sZYWkQ6Gpn4lJtOkTEAsbKmPHijCu
 aE/kKpFoMSv3aee3/wUu8mnrNuGTSmCNVe0VOXp/yj8NVaEnThsK8jK4gRI8cRhOsZEvGXCZQ
 q6BYFpldjRaweZ/y3+uGzxU/QaYICc1A/DWCW788RNFcLiw/+6H6EOkztyEWSqx5bn7SiD8AK
 QVW5LY+EUTw+TM3Tg684U9rhAFwpjBI4PUMwYD9Jx86dNefoAO3B46JH7e86x/FPP8/aFcPMC
 N12kdI1gzv0vktPLqKgvs6bVGR7B84YPU0ZWbtwF1lcruFW1GZajIuST1kt9RWetE/plk3BwQ
 BHFczwfHogtEHib9J3T6mU9rCXf8kO9A8UkrNLpGYKYA/1S6xmIq8gAOBy/7aVmIeVvPmmvXj
 Xx/SX8F2DUKUEz7FESJOkbOpnF9b/ev3yT1tkTgJGnBma4MVG6LZp5fMGF4GYZYrXYBRJi6gG
 kZLTU0cvLR6kanPctsOjr6j/2iGbKcOJxkGUo5sr5McQcLJVKtNBkac9+szmBuRaEuVQn0aUz
 d316fxITdrDDP7773T+Ou586WXLm2K0uLhrz+gT2sePmKu7cWIWWd3ihE17i2UekP11boMoYG
 NsvnLWaIh5udBCvOP6k/4RzXuFa3D/d6/0iB1dbdAzZ44LSmDUoMCT39/bKhi+1TcjEsp+gGy
 wjzCXEBZjQKpEbIaGbjiRNbJeZeFjrP9q4PcKetUKuRdPHWdUt7C9d2N5c7JAQCJZoRLYgWpe
 MtfdXeMnI3eRAJuuBk31i8vuv+iI8dvzPTubEtvx1lqBNoF9Z+rRJMV+SLJP2XRDC4ZG7vZ8K
 vu4HVXaRVG2VOf9TG9PzlVLJ073SOS0UrUMqK78x6ZAX0Yj23/jtEpg48rUAtXiSlkqtSH4wJ
 o5HD4xGudfwjso0dZaamFSURgPd3QUv7lK3OemqvFWXgz1RrrOJA+7TgLCTYu4oy5lp+zV5vD
 VaswYq9rPjUjc2VTuF6tG3ZjRKvS7jaGzf9HFuRFbBv+nbI/5cPdLcAKj6BhvP77wkNjbVEA2
 WIl7B2RUAwxDEXmGqUJkOWyJItaPtHNPjmtm8qmpdI6YLL5v1LKILcBvoRWAkeMhaWIeh8/sW
 YTkxLQfGVHOiNplJkaOiaST6JZwnRxQ3ZyAZhG6OX8NTrkQe3MW1/8GlcDdQmSElh0qBBGZSE
 xpPAKzzrmcTf/iFyjec35O2G7LHZHXIOZASDsPNZKvS2/TdpZ2zR0G1z6OhgxtcIvMtRDORYw
 cF1nREoFWZ5eZJ+CFBKnpywle2ZmLJGO0UUH8lYiUIQ91bNsEBimh/JqSed4zUsHgbwsaelg3
 6STQ5bounpUnSM5laJ8SKzHUPapfZ2l2WfE9ggtoKFqaLhB7vH+IUHEjlI7P0nLsQTvAgCjeJ
 qUp6ta9ATlwkwekIfNyJaOi2rJRZRdNx1MpMOq5NLyuaVdrFI6W/KfnUe2YaAFPaXBMqrImYC
 hP/NSAcL2tzftyxaiOPGfUtu6dhWsdiJHnJmIaQUW8po3YwVPYXbspkqbDTOVTi/nvPZzVBvV
 B7TkKik5b0QQ67vyN6lpCHnINHXJKbEAu+fF+t/Dej2WW9Q6p0C628dOlkKv0RJEktJVPdvgI
 CZf4ZXCBsznZhY2eZayuxfOOOiTJD/jFy1bNh/UM+MZf+MYxcNOKwUDKoYg+W7CfrwAiix1Hu
 ENs43kLfasd9xJWfEs2abOL9ZoomZfj2wx3onCpI0FsbZ/0U0gswVXhN4saEp2Ph4qvAoFVo6
 0Z3T8Vgn16TPD6zGZDcXJlTUVBZQJhF4BYfPBFF1HnVy6Jte2cZxUc8eoLQY7X9CpNeKqn9fV
 QvAk7lOCmR+l1MiK8lm23Lel3UolyzlxAKd7lISX/lBjT9YFWkKPNRV0Cblw8oU7sentwAaan
 PhmdoaX2UUAjsSw5gue35kk9zLvSUsfQO+g6Z2OHmjmvig3W3oGYBgJsDOxbjI01gG7rDlBoL
 yDW6PMXuThJZu0bCC60N3cIqT4H6RIX9tNUA9K9P+WzkpiAtCnPnbWVAfTGmKeOUsSN2Re0HB
 gV79eAwFwFy0ZfimEONhta4g/WpCWEEXuCKOkAQMaj7cLwEP15qjd9O7g2BKbr4qFaYfunEQI
 SwAqNppVa0NL9NJi0sWb6c5qn7YPDkT5wra9Pz4spJJZZRR8p9OqM62Bo8gAW6eF/T4VdqyMl
 90bsnRAn+WKA9Wn9KBGFnFjHi/rrmydWUVgUXQOr41jKHBtHUhgpOoH/thOELo3Z2VJjytZKw
 rrCE6kpFJwkrID0nMG6MRPCyjhdv04YsVYlhGuNCmaFb2o7wffuPgsLOnhdmFtzuDzOo1M5jl
 DEOltii6p8UcIidKHE1lChx8bg+OPyfxWwx2xL3oKVS3W1bRGZy36vogIKXmxvniVSfT3HdZ3
 N/Yt40MRjwfd+GTJ47bk//ox+W4XuLjXQXS90YDxAiKK69nU3jwP/sCrMtgSjoTIWweHu/mbc
 ncJypa6vzQYLFoql4ndYJWl8eE7dQqP6A6OaHoWELqQJrTOctDeHj2WbJh7rWKY4ymfNZqXJS
 fa1KwYsk6BblE3dxpbwWKm7cGbhHhYTKEYzKXL0QAGSPC9AKqO5cqVke1WPlo0kOWc3XFhuKp
 rbGuDhf+tAVkJlFK4qhJUtoQ73kgOsP1EMwO0D2PdwYoVObolksiHsz8JzeLO6HwaetBbssJN
 MlnaxlovcIEU/9nPWoq9Zfr4y6cLGoK5MAZHRx6Gm1xwq3HXVNfCmQL5/HpKHO9pYULEKIAxK
 OzpMmCmvq0GrvDmrwPjJ9tC1m46SVDbdN3HyVKFzhUH+2MyWzL51wOsNzvGDd+FqBRIEUAe6P
 8oaSf2zIIpEZIHSLUHoBBS50+s5yce/7TjGHjPEO/vhL+qF8q9Y/sXPwpUE4c2NiW46v7SxAo
 QPMWKqhnNc2OFASd4jxg1/DEPxDEfH0l0CnMNQE3FEFjAahYG/iueOKdf4jLTp6CIY3sdXVXj
 UyC+XEyitTq6P+MghlN2AQ1iFIXPw9pKubmyXXRzmtgnHRQqKpL4Y0Pxj8T2Lg2v6WTsAGfr3
 agv6DVV/yQAs49aub6t7vZe1KWBEoX+6yh1pcs2jQy07kQ8L2o9bi395KFOulW7whUkZZS3FJ
 3N1O50+eVzrYNCwOlmTp91qTEhu75J3i5iCaExUOoForyRotOrCmo13AMpL8oFlysndlMCXCX
 llMwwSbzC7fAplucQOx8kOY1XJXAs+w5WXBPkbvtHKEAm9BqX5UtWBUJvfXgHfHZERwe+jRlN
 PsPPGpGGJpiXzdcG/XsY5bRZ+gNlfPwA+NpcbpHJgBbiX7blLLXyeyJMrV/TA2kgq3+bNXRoE
 59LxCP8GNJ5nRq2r+Q06KFpB/lz/tHpU+4rst1A2aeBhpTx+kfzPsvFK6VQ2cehQZFy5DqJw5
 OTIGbjPkbplp0ntb21BW/SKItVitKjsmzZrutdYf9fqv546JmW0onEH4sxEapm0zJb/d3L89t
 OaDbd68UqluJ4FeKtu1+kW46eQhfrQ1CkmOqorVsA0ck83REMJLIwnVOlnFEKDsCVf9/l+FGX
 4GTGavq1BoRLLlLyeedGH1HlRchSZdiRRttWpuYaQ1HmTIOCgspijYcfLLZ79OcNVyFq8EVO+
 6r/x2vKRlfNMUijq1mdhTTYyO7GvaX4rqDHCaYCjzeb24OiwjdZl7a3TEOTzrEKoqTYgBkk13
 +Ik9DKk2q7xDn7F/O+pjepSKZufdOO6XewjY2mqNEN8UpIyGBgswkHM8XFwpmJJUu4kNYseNU
 7SDq1vhDtMsnDJCJ3N1yLbhzgE/BlJijgbSHO7lOWbJj7CVt2tUrw6ztwdl9QfXMNH+CN0fC3
 vHOidcjeOp0T9R5IDaj6eCarA5A5+mp6iR84FhokeMKeD/tp8UfGbn03Mn+6ySqMRKoiQqabS
 FzDGeJRsUl+tKWfSQkNQJ6onFkb6MuWS0aGFA46przxvw8f1Oxkjb9yHeH3RViaUdx2mIEKE6
 PyIUbyoBevJLS0+XgUHJxR7FImjF8w4YBMbAwhMCZ3Kl7MykzuZUgzMMbRxAIvrsL9IDfmDoJ
 W+zYgexM0tQCyjLQDq51tIuvO0e9iA68TORgK0wbJQuyxonYgy5Utr+5HHRHyzmsRFnOShx+e
 bkZn3uV0aFFvuSml38LC2twEx5+zZ1ri3ftCiNRb6PXjvBpBxhs7QjbzWWhZUFH39B+ityXY1
 fpfjin4v0B1yS8PLNq2xfmytE+OPfHfe5MD5MSjIeBtWLIvxL0moNFKbt1BHhZ6nFvr3nWtK0
 +z+cm0Y/cKOFAKACnk6kXC9HyQUz/kihobTrCezkvFP0teA06YXkxy5sFJQxhUhcm1xd0EKYD
 kCXBA==
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

On 10/2/25 10:52, Albin Babu Varghese wrote:
> Hi Helge, I tested your suggestions and they seem to work well.
>=20
>> Do you know if this affects the selection?
>> If so, would modifying (reducing/shortening) the selection maybe fix it=
?
>=20
> The syzkaller reproducer uses really weird values where xs > xe and ys >=
 ye
> (xs=3D0xa00, xe=3D0x101, ys=3D0xc7e, ye=3D0x100) and set_selection() alr=
eady swaps them
> if needed and clamps the values.

Ok.
 =20
> I added debug prints to check what's happening and the clamping in
> set_selection() is working and the values coming through are within boun=
ds. But
> the crash still happens when you remap the framebuffer because of a slig=
ht
> overflow.
>=20
> I also discovered that when image.width is clipped on the X-axis, the ch=
aracter
> count (cnt) must also be updated to match, otherwise bit_putcs_aligned()
> 	receives mismatched buffer size and character count parameters, causing
> 	out-of-bounds writes.
>=20
> So I changed it to something like this:
>=20
> +	if (image.dx >=3D info->var.xres)
> +		break;
> +	if (image.dx + image.width > info->var.xres) {
> +		image.width =3D info->var.xres - image.dx;
> +		cnt =3D image.width / vc->vc_font.width;
> +		if (cnt =3D=3D 0)
> +			break;
> +		image.width =3D cnt * vc->vc_font.width;
> +	}

Looks good.

> I tested it in syzbot, with the syzkaller reproducer, and also manually =
in QEMU
> and verified that the buffer switches from tty1 to tty2 work correctly.
>=20
> I couldn=E2=80=99t find a dedicated fbdev/fbcon test suite. Beyond kself=
tests, do you
> recommend anything specific before sending v2?

There is Geert's fbdev test tool (https://git.kernel.org/pub/scm/linux/ker=
nel/git/geert/fbtest.git/),
but it does not involve testing of fbcon.

Helge
