Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 154D0648FA5
	for <lists+dri-devel@lfdr.de>; Sat, 10 Dec 2022 17:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB5110E0B6;
	Sat, 10 Dec 2022 16:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF15910E0B6
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Dec 2022 16:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1670688680; bh=UAb7ldzD3tHL8gu70PvIFz+mnBkn1chzH5limOUuYsw=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=XeBEnD7uXLIJhLNaP4V6rwBbWXC7Bml3j03oiRuHkz0xR4IEj2ySr+Orbg9oYr/Iu
 wNmmJzOP1E+3JaQyJ6qyN7ouo8BGFaKU0UbINq5lJ6IEw8bkNbURdab1pwfef6BKSC
 OTduzLd8UamfC5AvDgQnvpSmmBkZu4VUtKSIgj/0utQDrAhZCvTNSrzbNJZ5uMNbQw
 01RJ54fC91KRlj7QZOwdn1237pEu/7PG6fvpbvG02B7AedrRaeo+4ATfLqUPNiV4A2
 0kdU8UTAhS2t6nNmay4oPkkmzxdXE69OO4qS/rSvCP15rN7H1M7Ke0OJWena20PSoz
 oOKXJTtIJNfzA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.157.120]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZCbB-1pQMZO2pyj-00VC2f; Sat, 10
 Dec 2022 17:05:47 +0100
Message-ID: <cb19a577-0778-1d85-2c74-b92166038288@gmx.de>
Date: Sat, 10 Dec 2022 17:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/2] video: fbdev: uvesafb: Fixes an error handling
 path in uvesafb_probe()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Michal Januszewski <spock@gentoo.org>, Antonino Daplas <adaplas@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <0eba6acb70fa1270d8cf798afd11ce342aa7e8e1.1670671944.git.christophe.jaillet@wanadoo.fr>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <0eba6acb70fa1270d8cf798afd11ce342aa7e8e1.1670671944.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1o0OJtIJZku0ozeLcuTXLOKqT55qfyBM1PV7jFRQE5NXzjsCr3Z
 L3vzE56cLZM7CtCF9CgQ1mcJMrrGwXTViEpUllTnt86x86KwI1IhpNdnZTZgZHWy4P4z1Cf
 DslrD3dCaPmQxZ7c4Us1R95WSrJ3ehA3Ro2K4V97OnWr4l/7YTagm74HEUnEePm+7aodL68
 kfepUdky5+wCDez/wqPaQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PxMhCblhFzM=;1y/8jaWW+z29rYhjKqorAVv/Kxs
 3Fiz+lRAJnmtRgj/hmSCNFwVhA2XHZXibRlxjCkszo0cmWCpQBRaWe5eyR0iVc+MXkgWpbHOX
 5O/09BXGVxeSvmMsVExeWhK/HvXKucJt5QhUCtkwHz6Rv/uJZynaiIUcN2nMhME0uMYoSzO3D
 lQeI56U2ZhkqKLJ1FzAK5Ykm3krQjIZCuHR22NI5ghUD2S+rN3N9tDlDO99yo2R3OzSG5hk1u
 cFEs7tRu/kpzXDj2zEtJMlxr026IFdRoOv+U9Omx9d2KzVedlmjC/nRqFajVKrwSDmexR+2m/
 TK4SobPJvbUJk5B9f85KKpHR1TeeiWBkbi897on5BIPbA1CMUTasTLUXVHirpEZn96swoiZW2
 YiokRmi8AbbbKB8Ri5m0eFwMHAcoVKLV8vpD70PRK3MQxdOX90ELVtwI6yo+KXnpmim7VE55r
 vHdGKrHNBsCWK9vXjWaQlNmaHYjWjMUV1CSGI84xl8q4R0LMmGyvLhTj6SCJG7n8sfD1wz/Fz
 CY318F5/eJehgb0RPk6RdCNZFKzeCur9J6TAdRdQv26TleNdmN+C0AtmRFI48IC7TTtzt8ZLs
 iPR6IbpJS1cbm7XZH4Gs9/qDeUl9bvn4nb7bVLMt8f3VLiiYkrL/n/0xqmZ3Z/+bYdOcvVvfC
 yu6e0+fEQDGYVnFZJlBZuhtNpzNvHfRrMCIzQ0Jzl6AHDyqipJfhnXl0fZzPvCEzQ+mmu9Q5f
 ahKK2rpeU3YMYQiBdJxzKb/aLdhkDaWYyUjzgqfqITgDMb+9LGVXFE3By34vQMhRbsitQ83Hv
 +7ibeENrUHPFvnXKJgcbBm74mt20TxNllsUyhcdooE9CqsYWcSLfMZ/hGDmGhAYO43NaSTrvY
 WatMr/0Ge4s3z7cavb/jSUI0c4yTOuvnBfYhL1NTvtuMpNkZbgdhPBDObjW3BcEmGEbByfXUs
 C1PuaDR0jd/ZISuCgxTTb2FjUlg=
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/10/22 12:35, Christophe JAILLET wrote:
> If an error occurs after a successful uvesafb_init_mtrr() call, it must =
be
> undone by a corresponding arch_phys_wc_del() call, as already done in th=
e
> remove function.
>
> This has been added in the remove function in commit 63e28a7a5ffc
> ("uvesafb: Clean up MTRR code")
>
> Fixes: 8bdb3a2d7df4 ("uvesafb: the driver core")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Both patches applied.
Thanks!
Helge


> ---
> Unsure about the Fixes tag, maybe it is 63e28a7a5ffc
>
> Change in v2:
>    - add arch_phys_wc_del() at the right place in the error handling pat=
h
>
> v1 (a long time ago!):
> https://lore.kernel.org/all/dd2a4806d3a570ab84947806f38a494454fd0245.162=
2994310.git.christophe.jaillet@wanadoo.fr/
> ---
>   drivers/video/fbdev/uvesafb.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb=
.c
> index 00d789b6c0fa..0e3cabbec4b4 100644
> --- a/drivers/video/fbdev/uvesafb.c
> +++ b/drivers/video/fbdev/uvesafb.c
> @@ -1758,6 +1758,7 @@ static int uvesafb_probe(struct platform_device *d=
ev)
>   out_unmap:
>   	iounmap(info->screen_base);
>   out_mem:
> +	arch_phys_wc_del(par->mtrr_handle);
>   	release_mem_region(info->fix.smem_start, info->fix.smem_len);
>   out_reg:
>   	release_region(0x3c0, 32);

