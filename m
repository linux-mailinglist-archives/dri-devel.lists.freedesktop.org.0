Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FBEB33143
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 17:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EC910E0EC;
	Sun, 24 Aug 2025 15:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Sas+c+Bx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A5E10E0EC
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 15:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1756049942; x=1756654742; i=deller@gmx.de;
 bh=vBGs3UY59Np0FG+iXT6HvEmmkEi562Q2TMeGI2nI6Vw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Sas+c+BxupiZcCDiWtzqwV7bJ6ckzvl9LWq8ptgHl63+JtIuJPToOxHTrZ2oB7Kd
 0dm8/3ructsOOniMr5Q1bFt5Z8vcHkVK5+CCGohK4dDP7NWZfAOcWQQXoexMZ+dmX
 dwB9aHd7dFbsrz3kmq5iUQ6+k4PeW2evn8KgMKm67J0Hv9DDvsI0esR6Ti/CxnlzW
 KSNCaBTdY016+09uS48onD+ysvUl7S7MGDwzm4PTrrdOdfltrsLd/i38rlNX9pTib
 8rP06FlP1r41kpcQJ3FIUPSWiqj4wIX+Lq8SiiKGGbMoxcIT+7TrMpUThN0sgtY8y
 isUyCvMzO2NgIvDykw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([83.135.217.92]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26vB-1unjyB1pkX-009deO; Sun, 24
 Aug 2025 17:39:02 +0200
Message-ID: <bff033e0-7953-4a50-a772-74aadda22a04@gmx.de>
Date: Sun, 24 Aug 2025 17:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: core: fix ubsan warning in pixel_to_pat
To: Zsolt Kajtar <soci@c64.rulez.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250821024248.7458-1-soci@c64.rulez.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250821024248.7458-1-soci@c64.rulez.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Oner/VY0jWHH+du52T2a/PawwsrVMAJrEhv9fwdi4ULoSX3o+NJ
 wc6qpEoBwRar7VMd7jrDlwjOYL+FLqTM+pTb0qmqtlbuvJ0U1PPnJJS7qLt5SAqkP8w3Mkk
 66NHybmAKMIjSmA/pgL6skThh6nyp+65SPdDINCjOQz1XS+mvzYV3mHNdUEL8ZeMXKAJUTD
 7vel1YsHKggIJBOl87hdA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:upKLEQA9Pho=;xc7gYQMisCK9sqEDvre7WPp124Y
 Ggij1KOE7MH6Ygv/4l6yndM7VCd6NzeYoft4eyiG9vHI7Nn25/vGdWILHqzbHJWfYp+ctMo/R
 E+BHybXWyW5DIVW1q3GD0OJjFWrg4HhiGukM7B8KACRwkeVANcunR6560/Ii0NR7aU65ppnKq
 ByOOP3PhkJRi2nG5pKYtH2aEP+m5qhfWlBey7jtL06K+dywC7gCtgfP69y6bmQ1sn/oiSt68z
 Kxh9zgwP4AnpWwzrFvdDGocJJ5iJQSH3qJYMyIn4c3Q9iPCoKZIX0yf/p2qIiXJ8g4sr4JSmO
 W6ExFJ7cmNnGnVpL8s8ZsechIKueril81G+kVuaLb0HQ9EKp3GR0e/uP8FHzMVvBzGOMHq66c
 RSHAxRd7Kid8QOsIdfvpmSr8SCmLf0oIoKZV8XJnfNivFEezDBXu8UDEty7kfX8gbw7sWjxYi
 vVRRBLtXJ71ohfu/N0ENmpJitWvgn3jShz4TwF2cGyJgFHogIma1NEnpKeFuIsfRCqew+rVKp
 ieltongOVVBIa0O5qD9+b/1rViTH0WFG3botUn2/8EsIw7/9/qkQv6Z3a3mpaiberAthvS6sF
 sX8IN5lXDTVvmb6K6cXN0VaME2eA0Db8Uvaw1HEPKvgN/BIKWrNz+HjWbNXn5RpBOi/FztDCG
 mHsNZOd+WcUQhJJvGYbPWi1aNvJTv+jWRrpZLCsiiJfaID3jBwSpbjEE4yvM68IEgnZ0bziuM
 VxDdCVO7x/NZNsc4GiNtVyujWhSaOg+IaTLh9n+L1KJ5nuTK8DLj5SNJwxXXF3fMmCXYh+juw
 s7Dym+Fm+9gcZAhqpksREva3bjfQcMcbm5hqcvJR472vv7qHST6lU5GOJJwJTclr4Leh14wNx
 Cp9aYprUsCj5ytYMffvs3mm2NvntwJloeca+qeC1oMWFWHr/0WRpaUPcA1os6WEA9R1bYh32k
 znhdDQb8H9CpQzB9YGrnX+sKdVrJgLImJBg6/vu5UVKh/CLNQ0wLE9xrwgcEnVz7Awu9S0TQO
 CHtr4QEqoLe51p3nJy71/8ZCR0WRmgYfxZ5hjuS2wezfmHJA57F5rW8tPaKwR1OQSeR821pWn
 +drf/SmHcBR/gnBeoPrUhGKPTlBoAWzJ+JaYM+djq4YRQfFEje0cpXqNsuexgcYrvOiPYDv1w
 KQbBWk8X8uvbl8clQwEd1Td9qg20vVCaBKJ8ymiMSU0Dp+MPf/3+Zw9aiLcdbuK3o2VxQuomu
 KwkP54Co0AoyT/yMRj9hSq0QKK8aWV83vbhJ/luN9BHnizsAunO4YM4o/H/q+vQMLPvd1weps
 TbtdsGiXqhCsFbiVun1k7TJhc9Y1BX4NPtATj8IJVuNjl2Aq3N48dUu19dgdBNObvuBBooyjQ
 Adiuv0wKrvw3fl+aDIHkwfP2N/4rcgPFZ6TJrZMUhA0jJwJ7dHRdOZYx/oeSFLv3Houq3T+I0
 IF/32mqK1V06VO0yMxO+IMmgu2x6XmaEdVEG5hpL+JQvIE54pZEdl5Hi4gWdv2vpyzmXPgj2I
 Walb+VsPgoaqyclIfGR98fevgN+7UVIgepaflqQouGtRADYR7ClQjMTNCWIj4zpRuJtLj4fMw
 6vUZmqe8Tp55S+ujHhQslBqfSbHgYrsmevzFxc6l/sHbGk1IRYTempKfFDSSUe9aTrhk0bHH9
 GRFeufylAUL7H1OLf8ZleGBakp226ysN6d+hNTkVM3UMiIcuOBXfA/bxtWLVbqm/OTGmkYSBS
 FucfURNVzqyrQ0gjlqH8GwLht2dvEOmtpncGkCBpTb/Xn0DkDG/UrGSQkprQEll7mN9JEHL/d
 Pwo/mjux3H6EMgMYJ7EW5a6KwURdyNUVD+Yt57Zre1mnBkMLdnM1cwSfGmfsIPWTsgx1wECD/
 UiejKbqmtLM02JKlsRPEyMLekQPf0+jJFj5Fw+9fqSt/bgKwCczw0xXkOVpUAh0rj5UQMN1wP
 9AvUFq0oLacyLuZi24h9ROTCrxj4f0KVKX70lGNqyP4yBpnVVK40YCCQFxy3Kd1EGYf/SyEAp
 9DbYhInBM64MqMYYb9X76R0VmBPyPjlJBp884N2g3TB4a5spDJsYfkvxCUyYd2ntoCHOkCFIr
 PxVXwoIC6NNQgWobXH4F3zHMN0Nyvh2dLP7xwQVxBetl9xh2Pp5xJGdYUF9IaCvtLQ5gtvqHi
 3GWb4TZnM1OIBRk4enEuMXGpDMG29rh2rrjEs5ESGvYbChwrx638UYkCLfBdS/swkw544b4JG
 sptyinC+Ovk972Kh1dT7No9p1whxlLH/zLYUt/sX2aPZSmFUQEpPk1wbywC02Xc1qthK5tapn
 Xa7HU3jjq8Y3gaZ4VKttW72tFXRhP68g0lAlKHZKpDd6EQUM2Vo/P7WqnYnb1ereL2P1TJn75
 B4ICcD4u8d0R+m4NDRPPzq+URRi8NNns7ItuD+NKnBrTYst6QP2+3xeZW9t8nOrQaI8KUqZ80
 OZwkEAQBONR3qxvN7UvEYVhLA/+F9EV8Vh9KjEL+J14YhHUSmO2T4xUpprTtgvywLRtNLj7Zl
 R8kWVS2a8C1RgHYPmlXh7b7gM6/35/2NFsoejjsM09J5aWPta5qUxUKlvfeMPGEZ+/YkGKyGd
 8Fa3se7VsBvmdg49HqUOWCapLBGKVm5rzAF5jpiLtjsbBzYr6EKz3E25zkLDFQaTvSYExqXpm
 dpb0g5SjzAQbmoWMR9L/KWy1kl2d6oZLTbAAQcv6wZVWvPOgSiWdhcY0dUglZHk1jDioXn38Z
 fADVSSxY6WrVkOanAc5V6KpGkT734HAEkKD1j09SvMvgRmbtSSMXu7NpOyPUNsoKJa9YRuVYw
 8wE9Ik9of1ITf1d/WxjsnJcaEy2PKnGFe6lNP2MQCisIT7DclU+rKK9mPp97QjCX+8W3TACHY
 HUZW+DMd7eNd+6xOdi4bSIzeXy6A6wnGYisEnUE35zJHH/02E/6Tcz2GWpPewgMwuoZmtR3DG
 Jl4+UzRV1FZD5XjSgfoM7V+Ojq0RoT0rqG5Jq6Sr+e6WqwNVXJ8LUpvqlZN1e+EMAotmHSKmU
 TpG9RYnHNqlkKmUpan8z6UPbLfz4zaA6W7YbkUPy0lgzspFhu02lkQTVGCpp1pN7wGL7YZGtW
 U8c3NU99DjUUW70S7/dJVNP6+qLAg6Ko2bnNzDhsmkgvqk9kPQbMisoW98sonhLFXrK8L3N2g
 jHhCPWVo9Druk+4AXDX+CzC8Hg4PvN3CqGDlKTdXQBjtQORQukmnpVHorcYezUyFy2EQYqUq0
 A9KJMUQpSybT+K5BjMvPSpxGdvWy2nzBg6iD5dI++fp+XIUXe7m6u6FKWunDwA2uhk8TdaG56
 AScEjzcBqjOUtsiOqIaxUjVS6aWsBHBllOxVBfrspvVNkqZ1E2+83xWqgBDIfot0kXcz3azqH
 CurcWry1sGO+sN1BhH2PB5+PZy4nuU4FpTGBpAanINoWMWhpQEYV39c9mIcwNrtdNOAbbLd8/
 qR26vi4ZFNViGW6Nq1i5AJ6/sBw1bnmsyGpH+bcO3X70wvsnxG+Ods8OvaEvtuwWP+XruAPxU
 LGM3d9pNCoJa4dK00hUCYNICYSsX51HpPU7YwaVlPzZEYNBPSt5tXEGAFfgJCnHZuoYklVE/f
 E1CUjmNoGpV0YSmPQQ5JVMTCWTxes7VTTaulz2fzDCsUrl11QefZrBIlkyZJ6U3MlGWiikMbH
 flNrlG1Dc/XLlaUhQN2pGX1fk0oZXKd8ZwngdHvW7de13xCOpjYWazENL3GorVBCS4ngqbCnh
 no3a/jQU5xpyxheqrWuxI0kgSSI9D60+YxVSRX6dSHJLTLRl8elRscsCMaFKv9LYQlAMwb3dP
 0CiCjTJ/7fyG78mTnvo7aa9xqqA1sWjvfgeRSdu4iFhvzsrd27mTbx5hgJgypohNnvOp9JHr0
 +iIVnpR99hVy4qdgS2bC2igRipW0ZBf73iMrRYoRTZsn8kdDgVguzuqIvId/rA2kjHd/QPZGv
 6Iyf6zpOF3ldhTYmvxd6HPCtBefzUH4wP4CuhVv1a3UaqmGXEKzMaZQYqs5934598pbVtgkX6
 Cg8Zv0SV3tjnYSpaGnnpfxoav6t/q829ajXfllHww9FOq0u4Lws1k0du7AtsEIvflkgHQDSwF
 MoL9PcW1Ft0pNSItn/J+rnn+hHco6mpycLifwzvoXA517HnN5Ae/YRP/+xo49t/vh8v+Jtp41
 yISRumiwRSPCxv7sukpJRDb86IouB+lCRYsrbwJlU7nRj/DLwXd+oBw7K0EK0YCrZAM6D+0zK
 s9fvHMiAEqGZVL/s9yGE3qSGrRY04+ZzJxOxvkyknhEmqSGHwKOpDuQBCcSQ6ZePLrQo0dHM4
 Ae88hBmv6X/0wR0WaVNSxE6P5pcdbr6G/rEi5rDrtr/wU/gxw7y54XDEn7FrysxBiTDD7/1cm
 BPd1nMfWNSwofrZnJh82lic/7bq0/z2To+KinpaUaYhEngBaW4hLUWmufZjTgUZ+8AtD6GZIP
 NekAzeZnAnr4EKhda7IKO5judmD30D6uVsYoQs+DB8uxNZU2R4oHXh+Bp4nGH/0imMxPeGgT+
 2sUywMa6IpBcuBkkLNnB52m/u2gmUR5YKxCs88ZFixkMhJAzQtopDy44r19xIrKw+cOSY3j+o
 2dkz+YrIzq5HBFI4eyGdxhb9HhVhV2yZx36z6XW5tmKtN5wMkeAuhpSH/9gTGiQ3Ix5gu4ogk
 8GaBYl0LeAbj35I9qk+BBfCtUAPe
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

On 8/21/25 04:42, Zsolt Kajtar wrote:
> It could be triggered on 32 bit big endian machines at 32 bpp in the
> pattern realignment. In this case just return early as the result is
> an identity.
>=20
> Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>
> ---
>   drivers/video/fbdev/core/fb_fillrect.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

applied.

Thanks!
Helge
