Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96346B4A557
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 10:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895DC10E654;
	Tue,  9 Sep 2025 08:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/bVgtg6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0986910E654
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 08:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757406759; x=1788942759;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=K7qZ76h9zFhXCt0JoNSRAZpnemtuSuxUEh9f7iex2N8=;
 b=Y/bVgtg6CB8GmVk4z2PGv80lQCHcV/lBT/Nya161kiBuR5C+CkUBLRin
 0KVUDuahpq006ttfmMwuxSQGNVEP6fGgreRo2aUddq0/da+pNoV2YKa+1
 /X7yVme83WCBYweg+p4Mr2A0Segenm8OUkqslc64QkPWq/NYh2A2G0IT2
 OWbDXaNOWvsh+4keMWWccFuKpp/+IV/QuTAEHxgclNiJLGDheA5VBJr1x
 cV5/Ol0QQArl9QNhL6sXCnoG296rrHz2iGp5mSKZ0t/hIncbtUm/oerQ6
 dAXr05UhS19Z8d2rTfUXgW7vdkufnA5nP+9lp+EnO8ePb8ONHMvTG620B w==;
X-CSE-ConnectionGUID: WRlq0Pc+RDikxxZXEp2Piw==
X-CSE-MsgGUID: vF652KFTTYaTMVOcXhrvWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59828498"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="59828498"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:32:38 -0700
X-CSE-ConnectionGUID: UAfrkDxuQr66E2lu8iOOPA==
X-CSE-MsgGUID: ZUvTGv9DTYygBaQl3jSmZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="173490191"
Received: from unknown (HELO [10.217.180.72]) ([10.217.180.72])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:32:35 -0700
Message-ID: <68b20509-7b7e-4a01-9260-62ffd8f686a8@linux.intel.com>
Date: Tue, 9 Sep 2025 10:32:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/habanalabs: Replace kmalloc_array + copy_from_user
 with memdup_array_user
To: Thorsten Blum <thorsten.blum@linux.dev>, Koby Elbaz
 <koby.elbaz@intel.com>, Konstantin Sinyuk <konstantin.sinyuk@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908203540.475303-1-thorsten.blum@linux.dev>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250908203540.475303-1-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

|Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>|

 W dniu 08.09.2025 o 22:35, Thorsten Blum pisze:

> Replace kmalloc_array() followed by copy_from_user() with
> memdup_array_user() to improve and simplify cs_ioctl_engine_cores(),
> cs_ioctl_engines(), and hl_multi_cs_wait_ioctl().
>
> Remove the unused variable 'size_to_copy' from hl_multi_cs_wait_ioctl().
>
> No functional changes intended.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  .../habanalabs/common/command_submission.c    | 34 +++++--------------
>  1 file changed, 9 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
> index dee487724918..a5e339eb7a4f 100644
> --- a/drivers/accel/habanalabs/common/command_submission.c
> +++ b/drivers/accel/habanalabs/common/command_submission.c
> @@ -2481,14 +2481,10 @@ static int cs_ioctl_engine_cores(struct hl_fpriv *hpriv, u64 engine_cores,
>  	}
>  
>  	engine_cores_arr = (void __user *) (uintptr_t) engine_cores;
> -	cores = kmalloc_array(num_engine_cores, sizeof(u32), GFP_KERNEL);
> -	if (!cores)
> -		return -ENOMEM;
> -
> -	if (copy_from_user(cores, engine_cores_arr, num_engine_cores * sizeof(u32))) {
> +	cores = memdup_array_user(engine_cores_arr, num_engine_cores, sizeof(u32));
> +	if (IS_ERR(cores)) {
>  		dev_err(hdev->dev, "Failed to copy core-ids array from user\n");
> -		kfree(cores);
> -		return -EFAULT;
> +		return PTR_ERR(cores);
>  	}
>  
>  	rc = hdev->asic_funcs->set_engine_cores(hdev, cores, num_engine_cores, core_command);
> @@ -2523,14 +2519,10 @@ static int cs_ioctl_engines(struct hl_fpriv *hpriv, u64 engines_arr_user_addr,
>  	}
>  
>  	engines_arr = (void __user *) (uintptr_t) engines_arr_user_addr;
> -	engines = kmalloc_array(num_engines, sizeof(u32), GFP_KERNEL);
> -	if (!engines)
> -		return -ENOMEM;
> -
> -	if (copy_from_user(engines, engines_arr, num_engines * sizeof(u32))) {
> +	engines = memdup_array_user(engines_arr, num_engines, sizeof(u32));
> +	if (IS_ERR(engines)) {
>  		dev_err(hdev->dev, "Failed to copy engine-ids array from user\n");
> -		kfree(engines);
> -		return -EFAULT;
> +		return PTR_ERR(engines);
>  	}
>  
>  	rc = hdev->asic_funcs->set_engines(hdev, engines, num_engines, command);
> @@ -3013,7 +3005,6 @@ static int hl_multi_cs_wait_ioctl(struct hl_fpriv *hpriv, void *data)
>  	struct hl_ctx *ctx = hpriv->ctx;
>  	struct hl_fence **fence_arr;
>  	void __user *seq_arr;
> -	u32 size_to_copy;
>  	u64 *cs_seq_arr;
>  	u8 seq_arr_len;
>  	int rc, i;
> @@ -3037,19 +3028,12 @@ static int hl_multi_cs_wait_ioctl(struct hl_fpriv *hpriv, void *data)
>  		return -EINVAL;
>  	}
>  
> -	/* allocate memory for sequence array */
> -	cs_seq_arr =
> -		kmalloc_array(seq_arr_len, sizeof(*cs_seq_arr), GFP_KERNEL);
> -	if (!cs_seq_arr)
> -		return -ENOMEM;
> -
>  	/* copy CS sequence array from user */
>  	seq_arr = (void __user *) (uintptr_t) args->in.seq;
> -	size_to_copy = seq_arr_len * sizeof(*cs_seq_arr);
> -	if (copy_from_user(cs_seq_arr, seq_arr, size_to_copy)) {
> +	cs_seq_arr = memdup_array_user(seq_arr, seq_arr_len, sizeof(*cs_seq_arr));
> +	if (IS_ERR(cs_seq_arr)) {
>  		dev_err(hdev->dev, "Failed to copy multi-cs sequence array from user\n");
> -		rc = -EFAULT;
> -		goto free_seq_arr;
> +		return PTR_ERR(cs_seq_arr);
>  	}
>  
>  	/* allocate array for the fences */
