Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF277E15BC
	for <lists+dri-devel@lfdr.de>; Sun,  5 Nov 2023 19:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE6910E11A;
	Sun,  5 Nov 2023 18:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CCE10E11A
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Nov 2023 18:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1699208261; x=1699813061; i=deller@gmx.de;
 bh=3RbYanvi9UwzmdwGMMPwpJFtJjQ4PV9jI8gAKX94JkU=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=m5Js7DTvWU8jwR6I957DGgo/2lq3iYgN/VIQYxn6PbZtrBuKmBdtTZOdT1zvqt0S
 5bqXK6BZWI1Z5dyxeJ6RmOyl5zG5I9NSzX0ogRDqxLQQlrkKXWgihDH50IirPe/Du
 gtOr1UwfdZR63n8Xl3XNlz7wS4q0eW1JCDGUYSjGCkI6B4k6pBuxAEG71PmNSAdxT
 lpiHVQA1sycnUiyOnpLuwQPuSMT2Pr6tKfQsqUUllh+GELMzl7s35iOS5FaMCQGN0
 rRm7FLCWAFKWXpNTsGVs8z5kNrTNj0IGy8Q/iUW0eeru5iv6w+FwJfKgkwM2kjiv1
 Gb3b4zkZvrRdS7iRKQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.149.195]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4b1o-1qy3GN1LmQ-001k0U; Sun, 05
 Nov 2023 19:17:41 +0100
Message-ID: <e9ff2894-e04c-4772-ab5d-595e0df460ae@gmx.de>
Date: Sun, 5 Nov 2023 19:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/video/fbdev: use new array-copying-wrapper
Content-Language: en-US
To: Philipp Stanner <pstanner@redhat.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
References: <20231102192402.53721-2-pstanner@redhat.com>
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
In-Reply-To: <20231102192402.53721-2-pstanner@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mjyxRPphkkeBnYzLrrmnxNd0Ntb7vbQiQyz9rLYbujT0Yg8+fhc
 DDKqXZXKbZntwRaGqKc39wdXTWMcVFBLE67varukDtnajseJbi58doGSkEBHPAI4Pvav/b+
 xWvC7iLArxdujuVHqskPUni09Ii+BkjkVGR33QwlaHfkAJzCeX/qs4BLP/OwuE4tGNaqSXl
 GY01vGS6A5IgU01nPgV0Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Zw6MeNHaqfY=;qYVrKdIqOMYux+gD1/Ltf+QFY2Z
 TbBmg13CUPOaWPFOkx63U1OL9jZzxkuHO4/TthNAoOZ26dFCrJaO6Cu0ZMte9EwJweqcOBy8g
 r11bOFzj2NqeWZ9XRWBJ0qLOonPkb/BJpsoNS2KJ2y17kluKcWqvb/maGgkAoUbF7VJyVGXJL
 vBg5pcKE73Vjn5Rk39zzJvOkTx8GS7VLnYTZ3CLBf+MVEgC1j6+bs0zyJxyNS5sMdP4nu2NIP
 04tUGIAuMNa16rL4a6+8qm+oHoZr8pjecvn77mWXVH4iz9Ag8QYzf3CdoRS62TBt/IyPIVCJJ
 EAwY6wCGBxo3fJH5ly0iHe+fZv1geag4kaEgfkXCAChXq/Oe3gogpJc1Y7ZEtj+aDLxTwtRD8
 HQmGBOlnaepE6H/EZV3kZG2maMObDNGwwhf4QV6cOcoLX6y6FwvaFTZmNW7lWjfynEc+dnHCi
 N7iYWap3V84Wt5mr7Iz4rP0n0p3JngJk7Z9ij2eFeUivAX+QhMzZ4EdBOXBUkfOxLafHyCIty
 qOJmZQLLnjmRarPwruLrmK6QV2LJ/1+8PgWlsIw7wFTLHoyifpHbMUN0jbQiTLbDc0akGIJ+P
 vu7fHS5L+mrgqpVWhL9BQDacicoZwhJ5Ampd+k5DJ/QLPzjJuWBJPXjddx6DXf52jhuySacNO
 0VGmULE8rpEpxyjL+eyV1q9t0MzCwr+ahzQhgGe2JvpSlS6csbn7QxPNL+kVDj6jZUa6j+uPA
 rLBZhEKS6xhqS9g3tU08wdwxgGoag+Aoz/peM59kTGqLUAw8BMN6MtxQXssm5uN1FyJAN6PQ3
 ifmqByDiMOAlaW+U/HKGEM4iRos8yPH3f7wEt4YuEH90agFVb2ERiCLk7hB0yPu5Rw3RpCgvX
 osBvY6S35pCa3zum4WG6lqquq34p2y+1eqhGKqykn1Rqz2EVwT2fUbyLFSqkORFSgu6DZglfV
 m3srFw==
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
Cc: Dave Airlie <airlied@redhat.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/2/23 20:24, Philipp Stanner wrote:
> viafbdev.c utilizes memdup_user() to copy an array from userspace.
>
> There is a new wrapper, specifically designed for copying arrays. Use
> this one instead.
>
> Suggested-by: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

applied.

Thanks!
Helge


> ---
>   drivers/video/fbdev/via/viafbdev.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/via/viafbdev.c b/drivers/video/fbdev/vi=
a/viafbdev.c
> index 58868f8880d6..a52b1ba43a48 100644
> --- a/drivers/video/fbdev/via/viafbdev.c
> +++ b/drivers/video/fbdev/via/viafbdev.c
> @@ -574,7 +574,7 @@ static int viafb_ioctl(struct fb_info *info, u_int c=
md, u_long arg)
>   		break;
>
>   	case VIAFB_SET_GAMMA_LUT:
> -		viafb_gamma_table =3D memdup_user(argp, 256 * sizeof(u32));
> +		viafb_gamma_table =3D memdup_array_user(argp, 256, sizeof(u32));
>   		if (IS_ERR(viafb_gamma_table))
>   			return PTR_ERR(viafb_gamma_table);
>   		viafb_set_gamma_table(viafb_bpp, viafb_gamma_table);

