Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86392BB1863
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 20:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD8810E15B;
	Wed,  1 Oct 2025 18:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="LAB2IGuh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0E510E0E1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1759344121; x=1759948921; i=deller@gmx.de;
 bh=hX23R7BCnOMSqZnbsySfrRKi+7x+cD7a+OYIc574Fqs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=LAB2IGuhix57g9w9q0hmRStSPprbp21qYysVnAToajd6DdRelUnjM2M6TW2ZT9Gb
 iZMXUVjPPlb2LHJAE015v+MtDMWfcbbZUt3bM7IacWw5vwqvVvjoiBVUzIpiVIxoK
 SVE0JUwLaxMc2LFTuMDP9IPH3d1dJmvZUU+at0ZgPS5tpAxRZLZZ4LTysYCfXzzw2
 eEt0ErbHcvEZzeJwEYa4OI/RxDS6YTD2siM5WV6XNP6014Y/vTn0VzN4P0WooU0pz
 ruYyrVwem3tapPBo/3rI+eU6RFQb+IRQ4SWICXepVqa/NRdCVmL0GUi1jCzfordA/
 bpNY8ivRIKgpIJVC7A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.8]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIx3C-1ukiew0mV8-00Jska; Wed, 01
 Oct 2025 20:36:48 +0200
Message-ID: <5ab00319-e43e-4000-8814-c7d67f384c53@gmx.de>
Date: Wed, 1 Oct 2025 20:36:47 +0200
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
Content-Language: en-US
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
In-Reply-To: <aN1ihRfB-GHTEt_4@arch-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yL6kOtrV72IeisdOHr9cbmBEzZIhuMvaDiv06hNLuZktAy3cwa0
 ARt/FV8/b9UEEeOfOFiezBClh4khuFfjzZz+yKewnPbPGg2tVdjwF4FuDjWJZARy+atJURK
 5c1gtdjnbxJ181zIc74EXvdstQJ/GGo4SRX4+DhZW3YLuOAuQgNieO0PeMz2Ef0Pyvr3nLa
 YyinNfh/+ZqC4g10wRbHw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:G/ACvzhZJUQ=;Ohe8LrwW47W6gmTMyjz/zdbUbYl
 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
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

On 10/1/25 19:19, Albin Babu Varghese wrote:
> Hi Helge, Thanks for the review.
>=20
>> I wonder if the image.height value should be capped in this case,
>> instead of not rendering any chars at all?
>> Something like (untested!):
>>
>> +	if (image.dy >=3D info->var.yres)
>> +		return;
>> +       image.height =3D min(image.height, info->var.yres - image.dy);
>  =20
> This looks like a better implementation than what I had.=20

I just added comments - not sure if mine was better.,

> I thought it might be better to skip the entire row instead of
> rendering partially.

Do you know if this affects the selection?
If so, would modifying (reducing/shortening) the selection maybe fix it?

> I=E2=80=99m still new to this subsystem, so thanks for pointing this out=
.
> I=E2=80=99ll test the suggested changes and send a v2.
Thanks for testing and checking!

Helge
