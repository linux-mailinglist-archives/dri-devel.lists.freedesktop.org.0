Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EBD965EA3
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 12:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEA410EA61;
	Fri, 30 Aug 2024 10:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="o+Bgvky4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC0410EA5F;
 Fri, 30 Aug 2024 10:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1725013150; x=1725617950; i=deller@gmx.de;
 bh=9+dueI8bosr7037SDmUwpWrguCYldlWx+vVde7fdzPw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=o+Bgvky4ZFiSoeLsuIPcOoy2NN4b8PVqnTwCz1gClPenbT4X9fxNwGzm5EJzmIjS
 6odLc62NEprdas5Vb9w9KU80cZZ9LILLHFuL6uF9hqlJCW/euNeWzA5O1tYeYQI6D
 krRxSBsDZLdV0tc8poFwHLcLtYuPrg1rDhamLF4l7QQZ67oViHX3honFQYmEohXQA
 IZBFs8EPlF5vCPgj41laNYwiIK0m4teoitEYE8XbkUKGNUe60X9Qyz/zT5kuhGhPX
 +igGBIYpMlvFJIwE6S1TVmSO25rKShbzrv7MvGjiFbfu39opNdwndYUfnzOiv6gyq
 bAE4RKhniO7e4eiP/w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.126]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKKZ3-1sW0u10qMh-00KCQp; Fri, 30
 Aug 2024 12:19:10 +0200
Message-ID: <7aa99a5f-306b-4c9b-88d2-9ea93c013eda@gmx.de>
Date: Fri, 30 Aug 2024 12:19:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Introduce devm_register_framebuffer()
From: Helge Deller <deller@gmx.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bert Karwatzki <spasswolf@web.de>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 intel-gfx@lists.freedesktop.org,
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>
References: <20240830-fbdev-devm_register_framebuffer-v1-1-6d4186519c68@weissschuh.net>
 <729c4f82-a683-4302-b4ae-f591ac04daa1@gmx.de>
Content-Language: en-US
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
In-Reply-To: <729c4f82-a683-4302-b4ae-f591ac04daa1@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ke00r2fjsrt2Tn/tP8qIcKESj9Ec7VvVpdVynge0YOQ9CgxxEEP
 9p3ZPMQKdtn5RZy0qx2akfMPi8+4RQ1NAdmbk7TXGlL9tBMYoydYKfTmhfmO1dZkhFXu8M6
 ajDl3qG25lhpZvoQsVvhxOxTY1PTv+VGqHpIlzGcl0rFrk2cJ/HlgYdAZBPygopub0WPnXY
 FrqQts/7j3v0VUg/REHgg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4+OuAVJzvWg=;hzh9By/lVafIMZFJMsI1NSZz8Yz
 OIU/2GHfZFLpJ+I8l4RiMJqS/6tfVuE2yEj43FWjP6lsSgd3wfp0pyH3Qj6Qkhesl/5j2lEyl
 ErxCLcgXJnPO6+0JP0yQMJrxRNbBYMrU5dhpnhXy88UWp3ZhI06f/V/lTc5o+6F3bsN8cniF6
 cUk7Ri+G6MpMdY7Nfgdc58Nn5mo8g9UrwXQXoY1C8yY1QhUyH7x2XcynROJa176DeJW5HQHFf
 6qPljXO4s8FcAtIzHjdGfzOi5K+9ewdzkLErZEPYsVoRKDdKqW+jPkGLErvCUtG1jCtk7Sci5
 Md4Wto/ZPMEmbIKhCcFS/N7aOV5R5XcFWWXXyR0BBuAFTmvsc73dPu644QE3Wm4CAi+LqGhAM
 w2Qmycj8il7Tlj+Jf5XFz9f2P9A1b1raQ4r63p5lGYpoNROUlANrJHftJNFIgsD/XT3DQ8n6b
 BnITMSgX1pSnmwifGEscwa3jDhU4cvpz5jc8xkVaZHKvzSnT8U/kqz47g1PbDqV9kKV5Mprkf
 yHn9UzFTTeeofRjR2+c4Ny5Ael/ydajORkZe8/datHD/8ylBKvPa2QWEjYPoIxs6YOcWNqnyV
 XRSntKvLY2RCG90UlIPXEVLhf21E6KzNds3WFL4K8i7HGbTcMF11IDxIzmeDL5xWcoepB3SzO
 5AVHKPL0CQC76OZO5CnGmjSorz/ma8P9fKiGA/e3cuIa3Cu8bz8nmppI5mkm/f67Ul5GTE/Px
 4WWHUpiahQq/d2rSGXUXIuoH3EHtixphLgffewcdAs6MBtKqt7TVE+DcgfIMGjn9MV9T+KkNh
 EtyC85vsIHnVwoeQ8zmv8i+w==
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

On 8/30/24 12:16, Helge Deller wrote:
> On 8/30/24 11:45, Thomas Wei=C3=9Fschuh wrote:
>> Introduce a device-managed variant of register_framebuffer() which
>> automatically unregisters the framebuffer on device destruction.
>> This can simplify the error handling and resource management in drivers=
.
>>
>> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>> ---
>> This is a fixed resend of [0], which was broken.
>> Thanks to Bert [1], and Chaitanya Kumar [2]
>> for reporting the issue.
>>
>> [0] https://lore.kernel.org/lkml/20240827-efifb-sysfs-v1-3-c9cc3e052180=
@weissschuh.net/
>> [1] https://lore.kernel.org/lkml/20240829224124.2978-1-spasswolf@web.de=
/
>> [2] https://lore.kernel.org/lkml/SJ1PR11MB612925C1C533C09F8F62F7CBB9972=
@SJ1PR11MB6129.namprd11.prod.outlook.com/
>
> I've applied this patch to the fbdev git tree.
> Please double check at
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/l=
og/?h=3Dfor-next
>
> Can you please check if this fixes this new report too:
> https://marc.info/?l=3Dlinux-fbdev&m=3D172500784802901&w=3D2

Please ignore this ^^^.  You already mentioned this one above.
Helge


>> Helge, I didn't document the function devm_unregister_framebuffer() as
>> it is only an internal helper and will ever only used by one user,
>> similar to other helpers in fbmem.c.
>
> Ok.
>
> Helge

