Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5239B6BB2
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 19:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9B010E7E1;
	Wed, 30 Oct 2024 18:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="NNwqD5Nz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B1210E7E1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 18:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1730311802; x=1730916602; i=friedrich.vock@gmx.de;
 bh=LQRJj2KKQ1z1iHAN65JSqEQ+8TJ/TK08yaQxe3NrquA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=NNwqD5NzKKIMQqJY+3KJdkTlKWuf3ngvd0xvc2H8QBYkt0VvBdZUw72X8jAKbI+z
 COAefAdPJICEXKsAFEPkn4jp2x5GFKL2b5GIW+1+UxkwcAKhb3+KR9lu+31CHkcUG
 ZEdOC6CDRvJzlkzQmmIURQZkgBoZM9b1zOE5CPsENazbwCahcnBfBW8lPO00Aj5jr
 AS0RL8YRQrOvQcsaLQFxOuu/WHrACQkcLgO0HoDv/p5Qg1z2hyMCc41hxZBCu0ezT
 VUJzTFR9c0jFCMBI/URE6aqliqWjVuqvEfwu35sayMc8Brmoj0N1boQ7QFONtzvQq
 jgHrRMXwHAhJj7N6ZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Ygz-1t88wr15GV-008KgA; Wed, 30
 Oct 2024 19:10:02 +0100
Message-ID: <c93698d1-5b83-4314-bf9f-d1540d5cdf2d@gmx.de>
Date: Wed, 30 Oct 2024 19:10:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dma-buf: sort fences in dma_fence_unwrap_merge
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Richardqi.Liang@amd.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-3-christian.koenig@amd.com>
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
Autocrypt: addr=friedrich.vock@gmx.de; keydata=
 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
 f7+xmX0X3AMtWz/15Y+7cPO2
In-Reply-To: <20241024124159.4519-3-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qN3YPrQlAK5aRHZ9LZXxsA+0bm1izX4aO9+2j/kmMwuF6Xc8erm
 5FrP0Skw6tdF/xjmD/vNdBi330aXl8Ql4YGFyvyMzfraQ2xgvzQc4RjQwECwyfbJuR5m0AJ
 DCpeQ+MGX3uAmsM4tQ8gwxN199s/m5Sglc3LreLpHmY6G+fXDWXJQGQPBYAxsqmSDaedXON
 P9qlQpYI1kKZX+UqQ4dRw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ACNDhzvFTiw=;BLcT1k6G9EsogCoPRlwBT/9JNBS
 Tf7DnAdeNJO1By49kV/LmItltycRJZwsP0S2Cmh3Tbs/7gYIbbgpXG4KqNdHxgf4JZnDZru/M
 lwLs4I2e+Jja6+dgoxBdTwP+KZ1p0FIVxq2kEa7+/U44vPWE0TskMosKJ0ilibd1N0hW9zkW/
 2uhZVi1ZhC6BV6eni/vxOdQVIFS/CKVBCy/WuNPSgq2R4Xuf5SiK8ihtqBtzrXYEK7nLr4Kkm
 zA4cbL+1hY1dBc0JNvzHAQ7UF/bz03+x/eDgLO1Iexrnnti2XR3yt7/8mYgtWry97lxigpMAW
 QylcpElcJES6LvofZtFYqTNFr4Hv/X21m1o/E8CaBJrEtA/jHoEwUcvThpVb6/VjAVhK9K+xp
 xTB1tvY0otESOJwhAdNZvxtYC0tzENT4U8PawHE0wnMG6aPkY2QXfC3ssrSJEtbJVQkIs6E+T
 C+rYW5NpyBMs/R1JU+iofXSOSK7GehilrQFGJq1ZWLddySbQiNwJn9qeWzwBcRCy17jXQ+fXd
 t3XbGIRuV766wWVjEwFWtRBlMLxesi4b8w3uFumwJ0fZAe79NBKE2OV0C0axEDHhh4zUP5ugP
 zQDNvviEKnEF9ON8Jq41daQOHsv8DiK1Ipf/28YNZ2QMzpzN8KPI02Amx6Mgeoy3X4yEonjEG
 DBpgCuNaD4WYPGzRVScrmjvIlDZGaqR+EWc2vTXqx18QSQUA4LPhjKsz1MEkY2iJnQI13jSHp
 wCSfUqS+MdMbNj4/lh8hZyYXpp/FT0Rg04XHxMJme5OCU9kSFUBhLt2rfx+gN0YWUUpm4YRap
 IdOThysN455v2kifwaj2JTDA==
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

On 24.10.24 14:41, Christian K=C3=B6nig wrote:
> The merge function initially handled only individual fences and
> arrays which in turn were created by the merge function. This allowed
> to create the new array by a simple merge sort based on the fence
> context number.
>
> The problem is now that since the addition of timeline sync objects
> userspace can create chain containers in basically any fence context
> order.
>
> If those are merged together it can happen that we create really
> large arrays since the merge sort algorithm doesn't work any more.
>
> So put an insert sort behind the merge sort which kicks in when the
> input fences are not in the expected order. This isn't as efficient
> as a heap sort, but has better properties for the most common use
> case.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence-unwrap.c | 39 ++++++++++++++++++++++++++----
>   1 file changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fe=
nce-unwrap.c
> index 628af51c81af..d9aa280d9ff6 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -106,7 +106,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned =
int num_fences,
>   		fences[i] =3D dma_fence_unwrap_first(fences[i], &iter[i]);
>
>   	count =3D 0;
> -	do {
> +	while (true) {
>   		unsigned int sel;
>
>   restart:
> @@ -144,11 +144,40 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigne=
d int num_fences,
>   			}
>   		}
>
> -		if (tmp) {
> -			array[count++] =3D dma_fence_get(tmp);
> -			fences[sel] =3D dma_fence_unwrap_next(&iter[sel]);
> +		if (!tmp)
> +			break;
> +
> +		/*
> +		 * We could use a binary search here, but since the assumption
> +		 * is that the main input are already sorted dma_fence_arrays
> +		 * just looking from end has a higher chance of finding the
> +		 * right location on the first try
> +		 */
> +
> +		for (i =3D count; i--;) {

This is broken. The first iteration of this loop will always index out
of bounds. What you probably want here is:

+		for (i =3D count - 1; count && i--;) {

This intentionally overflows for count =3D=3D 0, but the ++i after the loo=
p
undoes that. Maybe it would be worth a comment to point out that's
intentional.

> +			if (likely(array[i]->context < tmp->context))
> +				break;
> +
> +			if (array[i]->context =3D=3D tmp->context) {
> +				if (dma_fence_is_later(tmp, array[i])) {
> +					dma_fence_put(array[i]);
> +					array[i] =3D dma_fence_get(tmp);
> +				}
> +				fences[sel] =3D dma_fence_unwrap_next(&iter[sel]);
> +				goto restart;
> +			}
>   		}
> -	} while (tmp);
> +
> +		++i;
> +		/*
> +		 * Make room for the fence, this should be a nop most of the
> +		 * time.
> +		 */
> +		memcpy(&array[i + 1], &array[i], (count - i) * sizeof(*array));

Need memmove here, src and dst alias.

I took it for a spin with these things fixed and it seemed to resolve
the issue as well. How do you want to proceed? I guess I would be
comfortable putting a Reviewed-by and/or Tested-by on a version with
these things fixed (with the usual caveat that I'm not a maintainer - I
guess the process requires (at least one) reviewer to be?).

By the way, I guess you might've had some internal branches where this
fix needed to go into quick or something? Usually I'm happy to make a v2
for my patches myself, too ;)

Regards,
Friedrich

> +		array[i] =3D dma_fence_get(tmp);
> +		fences[sel] =3D dma_fence_unwrap_next(&iter[sel]);
> +		count++;
> +	};
>
>   	if (count =3D=3D 0) {
>   		tmp =3D dma_fence_allocate_private_stub(ktime_get());

