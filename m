Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C56BE9933
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 17:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E66210EC53;
	Fri, 17 Oct 2025 15:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJJztOH0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49F410EC53
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 15:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760714062; x=1792250062;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3E3ghrMfbvU5c1+mUTJuBiacaEFJ8uCkBHo58k55BJ4=;
 b=VJJztOH0zH9kqSnfjhFoseUaq3DxGBvjtsxI3npJt54LZOqXLERtodRj
 wGfT0Lhms/B3hX9K9t9frmW8PTXn2Z9ercvX+rtMn5IvHtFUP0yFMFOCd
 WMwZ8SapOnmQ2lLTAMOoxl2JHTFLsOVyPtzoRXWShUMRRIXmQqrZQktnI
 /UZz6qn6hgR/8JffRSBI28ZTR2XL1oNsGEFG6hukOXMur6nqFTchgDfJD
 1bjYDY1jwg2+b6YA1fHVCKEsJFGR4gyq+hCWLy4wGdJzI7m+P3QOyhz4n
 3qp81VjKdBA4WHSRzCzy3aH+8ipLFC8Rw9xPWN8yy2fJJHguAj+4OfeRa Q==;
X-CSE-ConnectionGUID: FJ9m6bPvRjWgZbxrdBxdVw==
X-CSE-MsgGUID: NGA+HmvYRziTE/f/ciMZaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62835074"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62835074"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 08:14:21 -0700
X-CSE-ConnectionGUID: Rkp/OAfWTg+crrmXiJfz4A==
X-CSE-MsgGUID: lSKmGcyPQwa7jCIAkOp8gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="182567452"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.17.191])
 ([10.246.17.191])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 08:14:17 -0700
Message-ID: <428d5588-969a-494d-8dbe-a99957a763bf@linux.intel.com>
Date: Fri, 17 Oct 2025 17:14:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix mismatched types in min()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
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

On 10/15/2025 5:37 PM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
>
> Use min_t() instead of min() to resolve compiler warnings for mismatched
> types.
>
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---
>   drivers/accel/qaic/sahara.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
> index 3ebcc1f7ff58..ed24417d4c8a 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -615,7 +615,7 @@ static void sahara_parse_dump_table(struct sahara_context *context)
>   
>   	/* Request the first chunk of the first image */
>   	context->dump_image = &image_out_table[0];
> -	dump_length = min(context->dump_image->length, SAHARA_READ_MAX_SIZE);
> +	dump_length = min_t(u64, context->dump_image->length, SAHARA_READ_MAX_SIZE);
>   	/* Avoid requesting EOI sized data so that we can identify errors */
>   	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
>   		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
> @@ -663,7 +663,7 @@ static void sahara_parse_dump_image(struct sahara_context *context)
>   
>   	/* Get next image chunk */
>   	dump_length = context->dump_image->length - context->dump_image_offset;
> -	dump_length = min(dump_length, SAHARA_READ_MAX_SIZE);
> +	dump_length = min_t(u64, dump_length, SAHARA_READ_MAX_SIZE);
>   	/* Avoid requesting EOI sized data so that we can identify errors */
>   	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
>   		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
