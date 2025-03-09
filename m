Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7093CA584E3
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 15:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFCB10E35C;
	Sun,  9 Mar 2025 14:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Al6M4roF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7755310E171
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 14:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1741530005; x=1742134805; i=deller@gmx.de;
 bh=l2/iG8WKtiNO+mz+C3vHD3EsnLQNxECdkNSFLgEYfS4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Al6M4roFMILcRHikaMXvoQw0aUiKqEv2inbBH2Sr2sFdQtvjEaoZ8uqwpOdLZZzk
 Qi0PKCQtdDVXNAN6H1MLkgyiLU0foX1ok9ikiYia+PX0ovxJeD1hPlXYZ0ZAqYeMk
 7hqzwh78PacTB/qfmrb1XC6Jn8AKsVBFwXn+DtOfQV6tH5RspKL14YHy+ZHT02IQK
 HUx9+QW4rceBt+jfuKV1V0jC1GxXLjLQhbteWRyzGUhimAoyGRapVf8dgBGVf2A1Z
 AicnB2GHzRgpghz+0SmIpkFq0SWohFzT8FbFGy4De3g4GRXw57IvXFcODyLlxGYhF
 2melBE2fB/jb9Al1zw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.121]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhU5R-1tMdNu1SD5-00bqKV; Sun, 09
 Mar 2025 15:20:05 +0100
Message-ID: <fc8f7246-2e05-4433-85d8-65dbed723826@gmx.de>
Date: Sun, 9 Mar 2025 15:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] fbdev: hyperv_fb: Fix hang in kdump kernel when on
 Hyper-V Gen 2 VMs
To: Michael Kelley <mhklinux@outlook.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
References: <20250218230130.3207-1-mhklinux@outlook.com>
 <24668c7d-6333-423e-bd48-28af1431b263@gmx.de>
 <SN6PR02MB4157594508B80319444C6C24D4D72@SN6PR02MB4157.namprd02.prod.outlook.com>
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
In-Reply-To: <SN6PR02MB4157594508B80319444C6C24D4D72@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:l70lS2fMfJxjdlphzMlS2nvWxd1I98pF1dIsGqawjoEGjZG074S
 khIHmH+AlgLRErba8t9RP9JTC5pGBidh7FK3p14ISZLtVb8fWeqH6135L/MGk1I9UwfNiFs
 6220HUhpOK3Bz2BOP5v263T6BJ4Aq81uP9fgkkzHcBz1eoO+KCFXRERhyNtNUrbR6Xzh7EF
 LglDCD1Qzfe82z3JT2qaA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vGdK+Z0kilA=;JpL4QeABnVv/sJkRK/eOzZB/e01
 ujDrvqwQW/2bvgvZv7JeEERECgFMRWMtjHcAgSACL0xZTg2BLSK+LT6ZQW0gNtXrmuTnH9ZJE
 AjiG2cqorPObhYkJezlwFL6ybt+kUGppLMrLd/vdxdFGR0fVutbFqaZ3U5Dkx9VRj1Tz5t6Jg
 dJf8tX0qgZWrMVBtTiylSopy8yPwL3keK/PivD7tdKPe5dg1RCOfK+hyx+Gfnb0Ow3cQ17XQw
 vJ9ddt7cyyMjWpsyuIx1uNo3V/KlRlJug/IoW6CD4/gcQna4fdl+xEIfWeN7IrRBmNj+l59ab
 Rdp5TO3e07uhSoGg2c0PyyyuduRakXJQcjpEBZ0KFCCyfl2BBg1hqJyCOmUGccunY7npUI2fQ
 wZ+ZkoPZc1xhPB3AKamUDSvB88kCOH9qk/a5xFDugoKcb1EZGgPwJBXtGc6/Eqe6BI1HxKVtU
 qXpw6ra5ETZDg4C3wkEZCet6/GCvTgToGpZU+eHybNpXlGT8IlyA7k9805sIXocmYNBD9CHfI
 VRiCR2Dd7vf5OkAoWZMHh1c5F49j+L1kIum86g4OYgukvHXypFV6HWqEJOP+oH0cjDUKwQCmN
 ak2Cb8pd2eU/Oxv9Kz0yZd/7ZAy7lxd+IWMdhKl49QXO01cwkdq9Pkv2spUiYrLejPsJsreX4
 C5x+miIBEApKsaLTj1M8ixWwngzAJk2VkEWZ7zZZGp3ndvKdCKXBqrfdsBMo3aJfMRT8z6bCR
 FFRHqrCZJtpE/ckmihawGSxU/sSDD97LpyXBMTSN+Fwb4N6WhOqrwPU+wFbJZGIoxow8W30cF
 jodnkbX4Xkk639vniL2Qz1klgpn/um4y1NKKM8/HyVdwQZMMnzVP4Ny0j/Jegdu3JscpO1bpQ
 7CYFW9uqF7Dgyq0lP85wDzmh14wJKWCw1j7bpvH1RWNHpRnwjxTWf06mPyFTCSkoVdQrqEg6K
 8ktzMyQWkX/Jk1tMTKsBHEWS7TObHSTwhqaBJ4kO06sIIKt8FNJ2zhNwdZMFBQITlsS/EJYrq
 Bt6BOqN20zIxAj3/ZCeN4axRseBkWXLHimztF5uwgYBzjkh0pc80aYmGIgL7Bq3XzOc4/iAyC
 n1Jb9+gv7SG1htI13IdgNOff+CJbxinPJgMbRycwoz07SUCX3PPlzd8FsDH5z0DEyKDLgeGJQ
 VPwYPWB3DowGSgqtm7DEdSCnpAqOetKLj6t/yKHmh5NV3yhR3jBDRq2fFTXuzOVEQoORYLnfv
 eUvTogLQdSePYu0fcgIhDmVnPelEm7hglYi1DXwnFPVA094Scd7K9/BhvDAg3Mc+Lukj9Zq1I
 oQ+TOngX9XXXIo6ZzjO8uPcxhHsxBUFoiG+DRYWv88AFSwYUfBiUZHEueuqJXoROdy/NeLcbe
 ASjsQ7Vmj86qrjyYN+eXd+tCbcpyIHgrQ7JiRsmsz/LIBl0mPkL3pQojUz73Gqli3owuqJDSF
 k9FInNg==
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

On 3/9/25 05:10, Michael Kelley wrote:
> From: Helge Deller <deller@gmx.de> Sent: Saturday, March 8, 2025 6:59 PM
>>
>> On 2/19/25 00:01, mhkelley58@gmail.com wrote:
>>> From: Michael Kelley <mhklinux@outlook.com>
>>>
> [snip]
>
>>>
>>> Reported-by: Thomas Tai <thomas.tai@oracle.com>
>>> Fixes: c25a19afb81c ("fbdev/hyperv_fb: Do not clear global screen_info=
")
>>> Signed-off-by: Michael Kelley <mhklinux@outlook.com>
>>> ---
>>> The "Fixes" tag uses commit c25a19afb81c because that's where the prob=
lem
>>> was re-exposed, and how far back a stable backport is needed. But I've
>>> taken a completely different, and hopefully better, approach in the
>>> solution that isn't related to the code changes in c25a19afb81c.
>>>
>>>    drivers/video/fbdev/hyperv_fb.c | 20 +++++++++++++-------
>>>    1 file changed, 13 insertions(+), 7 deletions(-)
>>
>> applied to fbdev tree.
>>
>
> Thank you!
>
> Related, I noticed the patch "fbdev: hyperv_fb: iounmap() the correct
> memory when removing a device" is also in the fbdev for-next branch.
> Wei Liu previously applied this patch to the hyperv-fixes tree (see [1])
> and it's already in linux-next. Won't having it also in fbdev produce a
> merge conflict?
> [1] https://lore.kernel.org/linux-hyperv/Z6wHDw8BssJyQHiM@liuwe-devbox-d=
ebian-v2/

Thanks Michael!
I now dropped that patch from the fbdev tree to avoid collisions.

Btw, I'm fine if we agree that all hyperv-fbdev fixes & patches go through
hyperv or other trees. Just let me know.

Helge
