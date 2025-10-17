Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B29D8BE992D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 17:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D93010EC50;
	Fri, 17 Oct 2025 15:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeLVD5Tq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CB310EC50
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 15:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760714046; x=1792250046;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WYvJ64RC4Myo0jrdjPfsN1YtT2wWB2zaxB30Gu1WMGg=;
 b=jeLVD5TqCWs2ApKTwAMggU0XEx9N9smbxapIxDjCmPQj/5jos2Xva4WM
 jHU/Ucf5J4sCO9ShTv+S67fmvu09+AApFaiSvjxfUVypSpqS8lIiY3/3B
 VwA88wokfZjdR9WJwtuyiggAQ/KqnwAgV1+B8UAu00FdjCRQJbp0mi5kz
 bd4U4sOVBcgN9KrOLqIG0W5YEtQ6gtSN4NUV9BT1nPr/3z01wEwFPJ042
 +bRvmEQeKUdrygOyLA1SlQHB6cC+EnpvWPw+SWSIBuRFM2pnpY0BMAqyR
 a0XysLPBNJ3HlJ3kPWKAtwmn72fEYJwLlDxkpGPQDsHeGP09+KYCAvsWd w==;
X-CSE-ConnectionGUID: Y5D5zpk0TmSY8KyxivSznw==
X-CSE-MsgGUID: BtvqyaKXRDqRkqbhBMx+IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62835042"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62835042"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 08:14:05 -0700
X-CSE-ConnectionGUID: f8+TNfl4TgiRIuU1y1lG+A==
X-CSE-MsgGUID: ZYNEgyTHTgCxHTMErDQ0Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="182567425"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.17.191])
 ([10.246.17.191])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 08:14:03 -0700
Message-ID: <97dee1c9-fc43-404b-bbd1-06fe04718c5a@linux.intel.com>
Date: Fri, 17 Oct 2025 17:13:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Replace user defined overflow check
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
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

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

On 10/15/2025 5:22 PM, Youssef Samir wrote:
> From: Sourab Bera <quic_sourbera@quicinc.com>
>
> Replace the current logic to check overflow, with the kernel-provided
> macro `check_mul_overflow` in the function __qaic_execute_bo_ioctl().
>
> Signed-off-by: Sourab Bera <quic_sourbera@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---
>   drivers/accel/qaic/qaic_data.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index 797289e9d780..e6f96dbb3382 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -15,6 +15,7 @@
>   #include <linux/math64.h>
>   #include <linux/mm.h>
>   #include <linux/moduleparam.h>
> +#include <linux/overflow.h>
>   #include <linux/scatterlist.h>
>   #include <linux/spinlock.h>
>   #include <linux/srcu.h>
> @@ -1305,17 +1306,17 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
>   	u64 received_ts;
>   	u32 queue_level;
>   	u64 submit_ts;
> +	size_t size;
>   	int rcu_id;
>   	u32 head;
>   	u32 tail;
> -	u64 size;
>   	int ret;
>   
>   	received_ts = ktime_get_ns();
>   
>   	size = is_partial ? sizeof(struct qaic_partial_execute_entry) : sizeof(*exec);
> -	n = (unsigned long)size * args->hdr.count;
> -	if (args->hdr.count == 0 || n / args->hdr.count != size)
> +	if (args->hdr.count == 0 ||
> +	    check_mul_overflow((unsigned long)size, (unsigned long)args->hdr.count, &n))
>   		return -EINVAL;
>   
>   	user_data = u64_to_user_ptr(args->data);
