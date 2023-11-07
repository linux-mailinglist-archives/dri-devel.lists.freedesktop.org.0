Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 318B07E4163
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 15:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A316610E5F7;
	Tue,  7 Nov 2023 14:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 332 seconds by postgrey-1.36 at gabe;
 Tue, 07 Nov 2023 14:03:14 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E777E10E5FA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 14:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1699365793; x=1699970593; i=deller@gmx.de;
 bh=p0n3xVOp9BeJAf/wjJtPJiFlqD7fJ/EeIppkkT97BkY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=CnZ0yLaC9EflX0H9iPBc7rGcX+qRzHen9UeTAheVDzaB3xOHzYssxqY15t07hsFv
 AH9QlGKWCc9BQ+zjSjpzvp6gsa5wnrHNXoH2///0fK3us827jdVLWqEWN0C/7Zznw
 IVzfHF4JPRNPPRnNXZEcB7xiwwqDVzbZTPUmg0TT8MQray8SKb4Ku6bQAtbxEHAfh
 ymE8vqvgjjoy+0kfAf+Hbhd9HeI3cTd5kJ+an4CPytqBD7xUu/XqQEp7yczmd49zs
 cRsgA6QKQR4bXcU98qdlXMby6O7AyKnHSI+pxDOScqfntdYeuWDc3KylRqD4x1oAo
 RyZ2Joa2kvIcGUhTdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.157.202]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zFj-1rV0Qt2ENv-0154EG; Tue, 07
 Nov 2023 14:57:28 +0100
Message-ID: <d23a19eb-6f13-407c-a09e-ce55fb903171@gmx.de>
Date: Tue, 7 Nov 2023 14:57:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] fb: handle remove callbacks in .exit.text and
 convert to .remove_new
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
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
In-Reply-To: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JN2iC4gf0zkfiA/NEAWl8Kgbg7aqYMvjyof2nBrypp5HNWUqwwd
 2wNodxKU5c+r4FJhlxXAKBRq+r88f+ToXEDZ9lhHZnxaqU3aozBM42jE3V/SgO3Y9UYydGI
 FDr5foFxzcTGBmpzPYe3ugd8bkHxJqDIKcMHBCzMe6jFiHp1nLr8eV8i7CeScUaLoN78L+N
 tMKvFNQd+GxYKk+TPbHMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:M9wm9ngG1D0=;aN8CIoRGRk678OPg6B4TG1jn5Yb
 e7Tp4YUy1Z8G0M8WLI3HN3f7BnBMJo2mu6PKg6jD3NEjgUqrZQVONobA1ACF5reoQH10n7CHX
 l2n7phlI3bhK3rvT5UBSMeG5ltVAJgyQ6//63dDESyalAt3J/lCc15oyfNMsTeYt/EJDW5eAI
 iXc11sT9IPQi39DoHZjqy1Z8SqYsLIobAtlPDOF6jmMJlP3S3gzOPUbfTH7bizg2eUs3soj7p
 S1oc4bwtXjLzWwjqWRraz3/FTUPXgS7Vhb2AvYM4mv1WGagjwXg1zKWKgHbu9kPL6yUvqsUVJ
 23E9Tfd2q1ZKUE7Lrs1v6gm+Z0G/MvxxVMTEGrE+rLUSdXtjw9+7euC/N6YC93rwvKQxMqEFR
 7dnnkhwbLP+y3rId9w1mlmqiWFY5V6oHe6rmRDrp+cl9hxOjX+skAyuHnIjxrsyyJWDKkog2x
 xKVZm/7qVb5uvgl5bLh0NWjIkxvw4LAQGMbcsQ+Fna+H79Nwj5/DMZz2837e0+KBbrfxMHxil
 A2DX/Fg3PQ+tNqPZYU7JH5863OGtl6UlnkYHYClchu0gsTQGIwTSlq7ygHbAvfWJtu88ChhFu
 kiIVB1ZhiBSA3E0MNpquK2iexnzWZ2kVS3tBvWZZhLnKVWI45/CD66u6GdoOqSVKtWNh2LwGw
 3S2viiE8St65Tn/lDcnONQJV4Qd17s6THZRJrEmmuS96Et+2+foM1F+m92dB6+uX0s/EuV7MR
 qXgS2FIl3aZZU6SAZeDTSU4zMLYKmq+Is53IarhfSrY77KLPHhmq8mqrH64XsnMEE9IdYCTPv
 KuhJsR/HGVY4AFj+NdS7X4ftcvYrEw3YPTTr7/9tEoR4zSRn53Pir4NbqYe3EmL/6t0PbiU6N
 OV8ug8cUhifmJl6tcOujGyWb4MzZu6PjW0lmG/x4gBbcHirRZF5SEkbFYuAeNpxY+/G8OsYWO
 uk1LAkajiz9h+Ry0fE07CT5GzVE=
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
Cc: linux-fbdev@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, kernel@pengutronix.de,
 Atul Raut <rauji.raut@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-omap@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/7/23 10:17, Uwe Kleine-K=C3=B6nig wrote:
> there are currently several platform drivers that have their .remove
> callback defined in .exit.text. While this works fine, it comes with a
> few downsides: Since commit f177cd0c15fc ("modpost: Don't let "driver"s
> reference .exit.*") it triggers a modpost warning unless the driver
> struct is marked with __refdata. None of the drivers in
> drivers/video/fbdev get that right (which is understandable the warning
> was added only recently). While it would be possible to add that marker,
> that's also a bit ugly as this bypasses all other section checks that
> modpost does. Having the remove callback in .exit.text also means that
> the corresponding devices cannot be unbound at runtime which is
> sometimes usefull for debugging purposes.
>
> To fix the modpost warning I picked the progressive option and moved the
> .remove() callbacks (and for two drivers also .probe()) into .text (i.e.
> the default code section) and dropped .suppress_bind_attrs =3D true (whi=
ch
> is implicitly set for drivers using platform_driver_probe()).  Note even
> though these patches fix a warning, it currently only happens with W=3D1=
,
> so this isn't urgent and there is no need to apply these before v6.7.
> The next merge window is fine (although I wouldn't object an earlier
> application of course :-) The alternative is to add the __refdata
> marker, ideally with a comment describing the need. (See e.g. commit
> 141626dbc2e6 ("rtc: sh: Mark driver struct with __refdata to prevent
> section mismatch warning") .)
>
> As a follow-up I converted the affected drivers to .remove_new(). There
> was already a series doing this for the other drivers in
> drivers/video/fb, but my coccinelle script missed these drivers as it
> didn't handle
>
> 	.remove =3D __exit_p(removefunc),
>
> . See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal. I
> considered creating a second series for this conversion, but as the
> patches conflict I put all patches in a single series to make it easier
> to apply it.

Thanks Uwe!

I've applied the series as-is to the fbdev for-next git tree.
The patches look ok, and if they survive the next few days they will go
upstream soon.

Helge
