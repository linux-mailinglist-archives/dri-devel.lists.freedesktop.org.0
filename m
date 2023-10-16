Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A237CB524
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 23:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4277310E1F8;
	Mon, 16 Oct 2023 21:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625D710E1F8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 21:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1697490929; x=1698095729; i=deller@gmx.de;
 bh=qt5SCacwR+qzi/Vd+l+sCphO9tmMZL/NjDwuWp8B9YM=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Utk79TX2JS5EkQy03SN5tA37tS5cg5CNpwosz/HhQ9BuHyot7bW/uWyNrVcaoGNicqJ9SERC9uN
 shXLjR+ocgg2yEQ9g0kaoblm660N17vuoQjCQEesEljRAz8mgH38256Jv8QZ2Ae3hKq3aDz+V+Rh0
 hGmLMlkBjOMA8E3NXWrpIgWtrx54eDa8XSzgmayKBryZ5NLVWN37S0mBL0WJVEKFloJ7NbCzWf5Jc
 QSch7l7n3dknCwPdixvzpLZRnQJFzlNZYP/2nRnEHFCqK0iHxZ1tqcDBkxsOFO2ksY/R6CPhW69wv
 9mGvSl/ZccVkJMGuguOay/wPkO9i76XJ18mA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.153.197]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUXpK-1r1KbZ0uxs-00QWzk; Mon, 16
 Oct 2023 23:15:29 +0200
Message-ID: <34994a3f-e44d-4ef1-95ee-2b2a885b3732@gmx.de>
Date: Mon, 16 Oct 2023 23:15:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: fbmon: fix potential divide error in
 fb_validate_mode
Content-Language: en-US
To: Zhang Shurong <zhang_shurong@foxmail.com>, daniel@ffwll.ch
References: <tencent_C816151C508524D86E346A69B706C0D03C09@qq.com>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <tencent_C816151C508524D86E346A69B706C0D03C09@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CQ+YnTw6KdXAZpnpWmEclIUl/ZNN5/eRCNxAwN1Cz4SIGQdfZIO
 PoqEIlPhXd5dmKSq2K7HWZ7z5128krfFFhY7vnYetJIRBlciNMtRq2QckMJ1QUqw6WGgdT5
 CuY1KI6LzUrmot3c9ocBQ4NM0i7yf0UqshHk1CRC5Sh3Le+JSxAe7qn2pbZo8fJbA12gVWv
 kPIj5hM7VbK8duOCGktxw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5MsAZc9NPsg=;xO9SSUhlTYQmwY/NqfOsrLTwjuO
 uk9eVyi4NRvEhUzwGhld6JovgQk2YbBQoM32OxORX5wpOGX9Jdt4OW+22+7cbvSi3tt2pyAPu
 Ce4Kp30Dz/wQaekM4S7U4Cd9c3MmGtW0cgaG5TZK+kmcdNrQ9EwC/tdJdI88HVr6mWAPHb7UG
 dh6V982ZqU/rbTlc086FauS9EQnzKH/3SmLw/1Z/RaqNa7aXfAvWB8cZ0Q7EjFG/Pf9EvBK1c
 tuP3duMoY8a4KVNXx09Ou6nO1En28CwDK6UWFy8a8/W7xPLYhv0rNYL0r/qeNJ/v+VFiMVeco
 rKwI+cGLULmA+5ZRcSidzyRtY5eWk6KTpsBWrrdbs8+UdshC0EfsHCIXpJi+G5mBEj5o8PGiF
 CZp3LOJCDyO2FiQ7Dh8Bu0kBJET/KfhjQPK5pg9+8oGSmNI9GptAN/ls+H7VyTn6blYNX7h/B
 m5Ikb0Q3i+Z7+OLkQvnmi6zlC0cQjyfuPwZwbogten9sJNZ0NdvmbvIi6t4lmUAaFDpTvpeuP
 voJNhbAyMkoK//K8k/dv0xbhyCDEB7IngLVsW0w1vflGlmCeMVF8RpJQci9Bqv7yqLOCPL+gt
 H6GdmF6QeQpmzHy3TrdbsGb/+BJQ+CFLW5XaAEBFIZhR+wrJFUi5eCOlJkwyrMKksEb8PlhVz
 zMcx4iBAgzxpSaEica9kuzvUbwPePnkEgnblwghi3bSbapFcDe4lJxcOXDJ2N2p8FLUkOq2ID
 FhELU6s0FD/e8wjfBw7o3AAdueFDXCm9rRzbx9A8x0Wv0lElZzHuYMUJ7c3quHBNgUC3t9bNL
 yeH2wGG/j/wu5+c/eNoYTrwVj+X8KFjoE4O0pAhxjftOXqBi4zQeBQzN7BP3d3NqtubKaYAOT
 2NpMm7ulGDaYw4BSQDevcKjoJ+IPlRC9DmcR38+FyH2pXT15xM/JtWllRWi6/6j0Lqp7tZEHb
 cOx1Rxm5sW/WthFQn/yVvg55NI4=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/14/23 14:14, Zhang Shurong wrote:
> We can easily use FBIOPUT_VSCREENINFO set fb_var_screeninfo, so
> it's possible for a divide by zero error to occur.
>
> Fix this by making sure the divisor is non-zero before the computation.
>
> Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
> ---
>   drivers/video/fbdev/core/fbmon.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core=
/fbmon.c
> index 79e5bfbdd34c..bdd15b8e3a71 100644
> --- a/drivers/video/fbdev/core/fbmon.c
> +++ b/drivers/video/fbdev/core/fbmon.c
> @@ -1470,6 +1470,9 @@ int fb_validate_mode(const struct fb_var_screeninf=
o *var, struct fb_info *info)
>   	if (var->vmode & FB_VMODE_DOUBLE)
>   		vtotal *=3D 2;
>
> +	if (!htotal || !vtotal)
> +		return -EINVAL;

This is above here:
         htotal =3D var->xres + var->right_margin + var->hsync_len +
                 var->left_margin;
         vtotal =3D var->yres + var->lower_margin + var->vsync_len +
                 var->upper_margin;

I don't see how htotal and vtotal can become zero...

Helge
