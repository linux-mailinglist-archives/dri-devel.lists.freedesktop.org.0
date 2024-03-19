Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E9287FD7B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 13:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DCE10E1FC;
	Tue, 19 Mar 2024 12:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="X955zbFj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB59F10E1FC
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 12:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1710850979; x=1711455779; i=deller@gmx.de;
 bh=Nxw4b52QeC3UfUcGxCJ301o+Q77IyuQfrmALOSQhkYU=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=X955zbFjLAif8tQ2YyniW7mqhsUYTUA99aMHhRGlMm4HzoavRDvZ5lxLhNy1LwYf
 MBf7Otw6Au37NOvivIq2jnRnZPo0NcAdTe6Rb7+aoqm1hCxvhEc9Uh5VfTVJdl8/z
 i4cwQw1rKpMVTQm5diqOjLqplFkaJB3qplzwMxDsAFC0Zkv/tpWHgfF5PBuE0h6nr
 I39DvpS+KbSZPdGiGvSbju5PNzR0JrBO2pziHwcoVkW16u4fhYJphVPNO2GdXnSrd
 0dgQmWfGyt8907SuTMydzapyfsXkPDDVTenJEACYZZoL0hiqKZFken0COdwIUMNmn
 Sa+PAUb/bzBtX7g1Fw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAONX-1rbs2i0eAV-00Bt0b; Tue, 19
 Mar 2024 13:22:59 +0100
Message-ID: <99a52bd5-7291-4ef6-a2b1-0fcb646dcff8@gmx.de>
Date: Tue, 19 Mar 2024 13:22:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] fbmon: prevent division by zero in
 fb_videomode_from_videomode()
Content-Language: en-US
To: Roman Smirnov <r.smirnov@omp.ru>, Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Karina Yankevich <k.yankevich@omp.ru>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20240319081344.7223-1-r.smirnov@omp.ru>
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
In-Reply-To: <20240319081344.7223-1-r.smirnov@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HzvfooUmpaWyEE5Pay2Cw3SS8hcXQuzTUAFh8bbYWl8JwC6iW04
 VF/61+Clof0FpCg28VJk89pYjvQhh0i+/6E5rSi4il7mVZEFM0PQCG709G9zY37ZS9NR9Vc
 x6cgfmkiEirJ1lJANz7x1PAgBZkB+NFFjygkg49S/0CP4Rn3ZRv9LGWSDlv5mVwhf7wqOrl
 PDfOlVCrat95QyLY029eg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5SbLCblxnVA=;qXXF+5a8auLxRt/33p6+g3jLYHs
 BTqGH37DrfubIWv9lXG9fKGuPlkhwFxvvpO0pjB1RueV3KN7kchRU/AFEoQ7Nvi/K1S7EmwKO
 yheXXJiMALv3WohLdMWAAmg9+0q3PQSW4YYu0w16MEJYIeJGTuWL8lFroLWBmZcaQ21JhU3Zc
 CkUp9y3zVJl3G7mZXl77sDrSmbnK1AyDGelTxk4Lhr403Tb4fgqfo9nVATlrZLwG2qfNImVeK
 dp68Z8CYdrjAmUOy2yi9dzgVxjMQEvGdpBkMpKhQKHSWJxgkEOaW4Z4i9RhebnKPrYCW7rsvj
 UTP/PF+7WGvHWOxHyFR0O1D3FxRDv/zIusLAA4rjGw+lxT0RHXWH1xHOVMb9YLljtbtlS521e
 CriE+JgfN7y/7H8un2wu4S0j4bxn4b1aEQlurDJ9lOQXCM1ue9PMSoGYAh0QbxuQ597VtVm/o
 sMG8TggxxRpZGTz3WDqYQe1msii4Y8utUJaK3Apfe+y4vffmRc7/adXJy4Gz6OVloeFc75ZzR
 XjwOJn/hARTr/8u6owlxrSgkNF2k1f7wjGdt6jSh9QNMA+Z7rvZ7sLlkqdFslbxHdcUM+GIuY
 pFYlgdmC77BN+gnAu7stgAwZZ25pILn1OWAeM0uO7oC6rLccLFGHuO2XIuM4e9RqilwaJlbN5
 pWUdnJEH4KXJf3I43EUpoWuZvqgzFcXq74QjPln0O0bup3dkHbNKPd7v04/J67rTjrOjC7MpY
 K4y/fDVKLknGzDIfjfV1I+hXRnrJjDK4iZ3m6HwqEiGdPEKXvPOV0chu3abZuqLIwaHIW/M+G
 SC3pWI2R7ZFicyZiD//UbcSnbKEqm96heIqEt0ktf132U=
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

On 3/19/24 09:13, Roman Smirnov wrote:
> The expression htotal * vtotal can have a zero value on
> overflow. It is necessary to prevent division by zero like in
> fb_var_to_videomode().
>
> Found by Linux Verification Center (linuxtesting.org) with Svace.
>
> Signed-off-by: Roman Smirnov <r.smirnov@omp.ru>
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
>   V1 -> V2: Replaced the code of the first version with a check.
>   V2 -> V3: Replaced the code of the second version with a zero check
>
>   drivers/video/fbdev/core/fbmon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core=
/fbmon.c
> index 79e5bfbdd34c..ca946919d962 100644
> --- a/drivers/video/fbdev/core/fbmon.c
> +++ b/drivers/video/fbdev/core/fbmon.c
> @@ -1344,7 +1344,7 @@ int fb_videomode_from_videomode(const struct video=
mode *vm,
>   	vtotal =3D vm->vactive + vm->vfront_porch + vm->vback_porch +
>   		 vm->vsync_len;
>   	/* prevent division by zero */
> -	if (htotal && vtotal) {
> +	if (htotal && vtotal && (htotal * vtotal)) {
>   		fbmode->refresh =3D vm->pixelclock / (htotal * vtotal);

I modified your patch like this:
...
-       if (htotal && vtotal) {
-               fbmode->refresh =3D vm->pixelclock / (htotal * vtotal);
+       total =3D htotal * vtotal;
+       if (total) {
+               fbmode->refresh =3D vm->pixelclock / total;

and added it to the fbdev git tree.
https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/com=
mit/?h=3Dfor-next

Thanks,
Helge
