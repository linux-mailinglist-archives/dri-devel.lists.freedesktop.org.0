Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA70B7E15C5
	for <lists+dri-devel@lfdr.de>; Sun,  5 Nov 2023 19:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FF310E147;
	Sun,  5 Nov 2023 18:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939F310E147
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Nov 2023 18:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1699208529; x=1699813329; i=deller@gmx.de;
 bh=q6fbhKtgJKrq1eWaJkIzaWp0FTRFUQnw82SlgKs9rQg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=HMJXUVfQxXchtbK5whIk4yKdabZ0xTy5F5k/zLKyk/S6Md+IbeBOwAL1bjyjuvWN
 nseqUsDSalmu1P1PC9f9HqVMTBtYeJC/yETXENMjh6BJzzsY59uMVxsaEuY0mM6qQ
 KqroY1dFiMTHPykLPO9YcVoY/MlpLZ5fX8CQLi+IqhAJdkc/Tug6FR+Qax80O9n4L
 Hwt0oE7VwL2CCaQgIvdbtNh/SCPqKhp7NXF4KpYc7Zbj0XyknrA4i9iul2T78Tpqr
 3y2VX6C8dVoe6mnQBXC3n0Ag7ZBSLN6TfrZTvOFyTs5iUbxsZgRneueukV7RgMXEz
 2wnlQnveIoRtsyjDhg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.149.195]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsYv3-1rIStv3a1L-00u0fv; Sun, 05
 Nov 2023 19:22:08 +0100
Message-ID: <0f93f782-08bf-4a2e-b370-806602fe1eee@gmx.de>
Date: Sun, 5 Nov 2023 19:22:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] fbdev/imsttfb: fix double free in probe()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <014c0272-0d53-4625-8517-e8b4aa68f4dd@moroto.mountain>
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
In-Reply-To: <014c0272-0d53-4625-8517-e8b4aa68f4dd@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iM+cZKeoyANqJPhayAfxfwOMbq3oUPGvQPbPBdDnr2MTBFYvm0u
 wJPjoGrvkW02CobBy0mJSsXXlFLJA1N5E2A7GfYCSJhLG6G6L1jL3/XH0SiwXQSyfWhUCDb
 Keivx9sipkbNi6uGrbeT70P4RNoLIK3gHnb3QTzZha1LB3Sh8ac/Du9MWqM2umIr8+YY75i
 HiIhoDfwbfCaeX9a0yWmg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0q8eeXBvOX8=;qY0yvo3DWEBe720JKRoE940XUVY
 1S98FvX3BIRRi3Wqjd4MqpFFhx9nJDaYN5p2M5lM1es2tCHUuvZej/mVokqkP2Yp5XLYqVdBR
 A+O8btx32sIGlhMVK6fDRH2up1efGtLR/+P1LX0nAkvM3iUaC54m1u5B+HeYk6GzwQPHsNm9n
 1RgvgPQ3g+JvqDk3f0OpLma8VqNYVwlysyBQ26Jw8+lbQdHZ7J6ZDxGe+1tKtr0KaS8hXxP+R
 KMsKNXz1lT4DO+r+1IeF2//zOUC+9JTjpwm0EiCOKMjj/KfUCUED5muuHQ2tmpnn5z6uQF2hQ
 mwkELZvlZPxRiu11trJvayGtb1e6N0BdiwvExNNoz10rq7qqevEVJugRqQsGIhi84dDUtSVZZ
 ZupiZWcN60KYM69K/fsk+DSlpDv6O63fzqisCaC8MxxT+XJV0465u2UaN185PIPTtNncq8D2f
 c7wi4LC013m5bBOBX5UOrVniCwQjkI1b3Fnp5fq8VaMQ2ZpBnx6w6SFeKf6bGvI1tPh38ygss
 A3Rk/JAmFZ0IklJAGM60fQHBk/rxipQZIVG2v++55EF9fJTI0JzLC7E0NmBA0VHsTTeY8CoCH
 KbR5J/YftB6SnRirU7NPDweyt5SGLhFsVxUSv3v5hWdvRvBTRgJpGOpD7GhsR1UgMeV7Thqqz
 nSEPp72wc2qn8W6U+rPGXv8n6/1i+ri27DUHUYnMME35OV4ylK/L5daPKxR0KV1oBS9aBz5DV
 MAlI9jgLQdkHd23cRtB4yBRr/b9/E4hlvczcv/D5kI+bcbCTk8kL4q1zUDl9K7bdjm+Cl5MN4
 bwzOdXwywlbAtp39SPkzr1MqGMUaAT3uD4OXEDaK3Vgx/REkDskqWBbhoBtq5qRCfrBw2DqYS
 aQg4HgZwM1nFfwMbOnbRB8uUlFfSlKeORq6yV259R8b3mJ/1E8XzE1J1aGrhMBolh3G+yXx2h
 d4kJ5GFrfprINpQWcIpOzECoaiM=
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
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Zheng Wang <zyytlz.wz@163.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/27/23 14:04, Dan Carpenter wrote:
> The init_imstt() function calls framebuffer_release() on error and then
> the probe() function calls it again.  It should only be done in probe.
>
> Fixes: 518ecb6a209f ("fbdev: imsttfb: Fix error path of imsttfb_probe()"=
)
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Both patches applied.

Thanks!
Helge
