Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EDC54F923
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 16:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAE710E4A8;
	Fri, 17 Jun 2022 14:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CC410E4A3;
 Fri, 17 Jun 2022 14:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 92C4C3F4A2;
 Fri, 17 Jun 2022 16:26:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.337
X-Spam-Level: 
X-Spam-Status: No, score=-3.337 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.228,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8G1SZAGIsVcu; Fri, 17 Jun 2022 16:26:16 +0200 (CEST)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 4E9D33F26B;
 Fri, 17 Jun 2022 16:26:14 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.198.151.53])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 3F02B362636;
 Fri, 17 Jun 2022 16:26:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1655475973; bh=BY6KCenvYRo/HZgPG1W8/8aXGwDbcIVWGgk4L2qcTb0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EeburbDrQ+j3bRw+MuOrHbxJDHKn8SiFrXCw2kFRMLkMiS6d7lsthHNhaRI+OAof+
 AGyeHdBs3t11UlKL/DEkaZG+6cvqh4/2beCxqM4NQABGMrmpNz7bB1+QrttNVV45GN
 rv0HEfrvzFqmJ5XYitp38tBkUYpczs/5BEd6ICN0=
Message-ID: <644ed02c-ad56-0121-e743-4b500d4b9577@shipmail.org>
Date: Fri, 17 Jun 2022 16:26:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH 07/10] drm/i915/error: skip non-mappable pages
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220525184337.491763-1-matthew.auld@intel.com>
 <20220525184337.491763-8-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220525184337.491763-8-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/25/22 20:43, Matthew Auld wrote:
> Skip capturing any lmem pages that can't be copied using the CPU. This
> in now only best effort on platforms that have small BAR.
>
> Testcase: igt@gem-exec-capture@capture-invisible
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_gpu_error.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 0512c66fa4f3..77df899123c2 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1116,11 +1116,15 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>   		dma_addr_t dma;
>   
>   		for_each_sgt_daddr(dma, iter, vma_res->bi.pages) {
> +			dma_addr_t offset = dma - mem->region.start;
>   			void __iomem *s;
>   
> -			s = io_mapping_map_wc(&mem->iomap,
> -					      dma - mem->region.start,
> -					      PAGE_SIZE);
> +			if (offset + PAGE_SIZE > mem->io_size) {
> +				ret = -EINVAL;
> +				break;
> +			}
> +
> +			s = io_mapping_map_wc(&mem->iomap, offset, PAGE_SIZE);
>   			ret = compress_page(compress,
>   					    (void __force *)s, dst,
>   					    true);

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


