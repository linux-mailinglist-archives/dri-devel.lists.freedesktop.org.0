Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 388434D183B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 13:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E164310E56E;
	Tue,  8 Mar 2022 12:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 165CB10E56E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 12:48:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83B41139F;
 Tue,  8 Mar 2022 04:48:57 -0800 (PST)
Received: from [10.57.41.254] (unknown [10.57.41.254])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 156733FA50;
 Tue,  8 Mar 2022 04:48:56 -0800 (PST)
Message-ID: <d35d377d-ceb7-726e-a8cd-93ea8df93100@arm.com>
Date: Tue, 8 Mar 2022 12:48:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH RFC libdrm 1/2] intel: Improve checks for big-endian
Content-Language: en-GB
To: Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
References: <cover.1646684158.git.geert@linux-m68k.org>
 <9a2d5522f15688981783c5f113563c2bb562568d.1646684158.git.geert@linux-m68k.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <9a2d5522f15688981783c5f113563c2bb562568d.1646684158.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 2022-03-07 20:53, Geert Uytterhoeven wrote:
>    - sparc64-linux-gnu-gcc does not define __BIG_ENDIAN__ or SPARC, but
>      does define __sparc__, hence replace the check for SPARC by a check
>      for __sparc__,
>    - powerpc{,64,64}-linux-gnu-gcc does not define __ppc__ or __ppc64__,
>      but does define __BIG_ENDIAN__.
>      powerpc64le-linux-gnu-gcc does not define __ppc__ or __ppc64__, but
>      does define __LITTLE_ENDIAN__.
>      Hence remove the checks for __ppc__ and __ppc64__.
>    - mips{,64}-linux-gnu{,abi64}-gcc does not define __BIG_ENDIAN__, but
>      does define __MIPSEB__, so add a check for the latter,
>    - m68k-linux-gnu-gcc does not define __BIG_ENDIAN__, but does define
>      __mc68000__, so add a check for the latter,
>    - hppa{,64}-linux-gnu-gcc defines __BIG_ENDIAN__, and thus should work
>      out-of-the-box.

FWIW there's also __ARM_BIG_ENDIAN for arm-* and aarch64-* targets in BE 
mode, if you want to flesh out the list even more. In principle there's 
also "__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__" which should supposedly be 
consistent across platforms, but I don't know if that's even more of a 
specific GCC-ism.

Robin.

> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Untested due to lack of hardware.
> ---
>   intel/uthash.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/intel/uthash.h b/intel/uthash.h
> index 45d1f9fc12a1d6f9..0f5480be6e8ca033 100644
> --- a/intel/uthash.h
> +++ b/intel/uthash.h
> @@ -648,7 +648,7 @@ do {
>   #define MUR_PLUS2_ALIGNED(p) (((unsigned long)p & 3UL) == 2UL)
>   #define MUR_PLUS3_ALIGNED(p) (((unsigned long)p & 3UL) == 3UL)
>   #define WP(p) ((uint32_t*)((unsigned long)(p) & ~3UL))
> -#if (defined(__BIG_ENDIAN__) || defined(SPARC) || defined(__ppc__) || defined(__ppc64__))
> +#if (defined(__BIG_ENDIAN__) || defined(__sparc__) || defined(__mc68000__) || defined(__MIPSEB__))
>   #define MUR_THREE_ONE(p) ((((*WP(p))&0x00ffffff) << 8) | (((*(WP(p)+1))&0xff000000) >> 24))
>   #define MUR_TWO_TWO(p)   ((((*WP(p))&0x0000ffff) <<16) | (((*(WP(p)+1))&0xffff0000) >> 16))
>   #define MUR_ONE_THREE(p) ((((*WP(p))&0x000000ff) <<24) | (((*(WP(p)+1))&0xffffff00) >>  8))
