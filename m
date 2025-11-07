Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EB7C3F5C2
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 11:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4B510EA66;
	Fri,  7 Nov 2025 10:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="hmPxzHhZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB3610EA66
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 10:14:34 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso6296015e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 02:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762510473; x=1763115273; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7BfazoHqWYQE87lslY9CXnZpsO5TV9TIgLU45i4jh/o=;
 b=hmPxzHhZBI2kji3SdHQJ7hjfwEyvRkncQI0UiAZZZfV5fTPvXedzCcscg5jKOCeuUT
 C937JVfeVmJgSMFJ3eB1e/lU/hZ+YAASuDrbfUvSDIn7PrIZKz3Nq3832Yk5gF8zd5mi
 otWmVHKzheW2gEbUpowyX3COY0C+IbRZwdxs038jZLlAVj7xtle+8AopQgxlYJnGi60e
 /puQJylw4TzlOg2GLdaR2z6erZmRK7qo5+d7geTet5ExAMPl7Wg4Eji/Xfi+qXczxf/w
 5RJVPMnc2jtKsTq1Bx1gyxmrtdnoZWiv6tkvEKenMizzQvAvBlFZ4LdiZYDoDDMRZZm0
 vLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762510473; x=1763115273;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7BfazoHqWYQE87lslY9CXnZpsO5TV9TIgLU45i4jh/o=;
 b=Z++AqmGZEj3xPdPhEs5Hf0yVgewhz1wmRVs42hsR4q9qzhPxqL+k6Srbn5T5zVP6G5
 0YaRs2kkY0x/vaa1QorQsMM80Z2sZyXbSX7BHOGJ2sFSm0lkZDszXoF1KmcukmMpXTJ4
 FZLdAbGftZSZjlZxDk+n/N7qbRwivmlvK0jG2/MHEFlQBQ6qpbF1+FJJqRdf4COBQnaP
 xncAs2whLBuAUY+R/5nOb668BcNzp65CbTTSmeoyDjsbRgOfmo9YRwdKmM0WOxDe8frg
 ofjuoj1Rm0W4UX2QJTUoon7x6kW4A6+l9m6puQ3BglncOMCT3t8AWYiVlO01L8Q57GVT
 MKIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN67aO0E874Dl+XyEAA4C8vHySl238WoILpvfrzGjH6H8YlAJK4FkKKYJybizszs9mQFnEcGiVuIY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEGYics9CsC1f9GA9RdFcJUiwlaHVNHeWOJlAzjohhXkZTqAjj
 GH7Uqk2hKx+bb2vexecCJYWkUqFokzZst9O5Ab3R6vMPoXlduaj0ioSfeOjiuFmiX6k=
X-Gm-Gg: ASbGncvYGpSXAt3gJtsUqf9fBbV07AfumQDiL+X3dzU2nQuYNMyVbi+7Dos9W33OuTx
 yMvWks8wfK284ICfBtB7TFu53wlr9dpD9aq7lpoJzB5ACNDoGJGVnKD67kIAyPWTBCx6/G+nDbj
 0te3WLacKC/PzKpLYn4OWRoQnK6ie8WoylSNhuwQCsRhVmj7ltuaDlZTkX/Eqwdmhhy3xbDBAeQ
 kD43sEmrmBK7UIdFY3FBJ8x+mBnVQQZn/OTri1m+wLzDhkTtlI7Rc4Q3ngPuReUyU3unvC8McHI
 Br58N+GRmR7m9N6yUNjHLSBiaKxnNodxy9ex8OttQzCAzPj0fyGu8u5N4m8ykGoOHpUeZnEsmOS
 0jCUoGTrEJze0zq4EnUuttyYuqzBUIBAP4fqJIpxiSyoRLgsARHpOuGvxsu2R9R28NIMv/XAGr+
 Kz8SjMYeTLHraQ+6FQTwQGgkM5Dpg=
X-Google-Smtp-Source: AGHT+IEp8JUAaMnZ4SnBSr0rcVN4Klwf8IQ64WyYmOuRgmzLuIy7MJXiArG0X6gqQXD8QWQtn8IntQ==
X-Received: by 2002:a05:600c:3ba9:b0:477:c71:1fc1 with SMTP id
 5b1f17b1804b1-4776bcbbc90mr27048055e9.19.1762510472824; 
 Fri, 07 Nov 2025 02:14:32 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4776bcfcfc7sm47399045e9.12.2025.11.07.02.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 02:14:32 -0800 (PST)
Message-ID: <6d2a4e81-8cfe-4ce8-82da-e5b0718ccbc7@ursulin.net>
Date: Fri, 7 Nov 2025 10:14:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/amdgpu: add engine_retains_context to
 amdgpu_ring_funcs
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251107090425.23199-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251107090425.23199-1-pierre-eric.pelloux-prayer@amd.com>
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


On 07/11/2025 09:04, Pierre-Eric Pelloux-Prayer wrote:
> If true, the hw engine retains context among dependent jobs, which means
> load balancing between schedulers cannot be used at the job level.
> 
> amdgpu_ctx_init_entity uses this information to disable load balancing,
> but it's best to store it as a property rather than deduce it based on
> hw_ip.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h | 1 +
>   drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c    | 1 +
>   drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c    | 1 +
>   drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c    | 1 +
>   drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c    | 3 +++
>   drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c    | 2 ++
>   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c    | 2 ++
>   drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c    | 2 ++
>   drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c    | 2 ++
>   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c    | 3 +++
>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c    | 1 +
>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c  | 1 +
>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c  | 1 +
>   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c  | 1 +
>   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c  | 1 +
>   15 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> index 4b46e3c26ff3..a10efac2fc54 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> @@ -211,6 +211,7 @@ struct amdgpu_ring_funcs {
>   	bool			support_64bit_ptrs;
>   	bool			no_user_fence;
>   	bool			secure_submission_supported;
> +	bool			engine_retains_context;
>   
>   	/**
>   	 * @extra_bytes:
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> index 2e79a3afc774..4a85b5465bb2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> @@ -181,6 +181,7 @@ static const struct amdgpu_ring_funcs uvd_v3_1_ring_funcs = {
>   	.align_mask = 0xf,
>   	.support_64bit_ptrs = false,
>   	.no_user_fence = true,
> +	.engine_retains_context = true,
>   	.get_rptr = uvd_v3_1_ring_get_rptr,
>   	.get_wptr = uvd_v3_1_ring_get_wptr,
>   	.set_wptr = uvd_v3_1_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
> index 4b96fd583772..e7c1d12f0596 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
> @@ -775,6 +775,7 @@ static const struct amdgpu_ring_funcs uvd_v4_2_ring_funcs = {
>   	.align_mask = 0xf,
>   	.support_64bit_ptrs = false,
>   	.no_user_fence = true,
> +	.engine_retains_context = true,
>   	.get_rptr = uvd_v4_2_ring_get_rptr,
>   	.get_wptr = uvd_v4_2_ring_get_wptr,
>   	.set_wptr = uvd_v4_2_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
> index 71409ad8b7ed..a62788e4af96 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
> @@ -882,6 +882,7 @@ static const struct amdgpu_ring_funcs uvd_v5_0_ring_funcs = {
>   	.align_mask = 0xf,
>   	.support_64bit_ptrs = false,
>   	.no_user_fence = true,
> +	.engine_retains_context = true,
>   	.get_rptr = uvd_v5_0_ring_get_rptr,
>   	.get_wptr = uvd_v5_0_ring_get_wptr,
>   	.set_wptr = uvd_v5_0_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> index ceb94bbb03a4..0435577b9b3b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> @@ -1552,6 +1552,7 @@ static const struct amdgpu_ring_funcs uvd_v6_0_ring_phys_funcs = {
>   	.align_mask = 0xf,
>   	.support_64bit_ptrs = false,
>   	.no_user_fence = true,
> +	.engine_retains_context = true,
>   	.get_rptr = uvd_v6_0_ring_get_rptr,
>   	.get_wptr = uvd_v6_0_ring_get_wptr,
>   	.set_wptr = uvd_v6_0_ring_set_wptr,
> @@ -1578,6 +1579,7 @@ static const struct amdgpu_ring_funcs uvd_v6_0_ring_vm_funcs = {
>   	.align_mask = 0xf,
>   	.support_64bit_ptrs = false,
>   	.no_user_fence = true,
> +	.engine_retains_context = true,
>   	.get_rptr = uvd_v6_0_ring_get_rptr,
>   	.get_wptr = uvd_v6_0_ring_get_wptr,
>   	.set_wptr = uvd_v6_0_ring_set_wptr,
> @@ -1607,6 +1609,7 @@ static const struct amdgpu_ring_funcs uvd_v6_0_enc_ring_vm_funcs = {
>   	.nop = HEVC_ENC_CMD_NO_OP,
>   	.support_64bit_ptrs = false,
>   	.no_user_fence = true,
> +	.engine_retains_context = true,
>   	.get_rptr = uvd_v6_0_enc_ring_get_rptr,
>   	.get_wptr = uvd_v6_0_enc_ring_get_wptr,
>   	.set_wptr = uvd_v6_0_enc_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> index 1f8866f3f63c..3720d72f2c3e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> @@ -1539,6 +1539,7 @@ static const struct amdgpu_ring_funcs uvd_v7_0_ring_vm_funcs = {
>   	.align_mask = 0xf,
>   	.support_64bit_ptrs = false,
>   	.no_user_fence = true,
> +	.engine_retains_context = true,
>   	.get_rptr = uvd_v7_0_ring_get_rptr,
>   	.get_wptr = uvd_v7_0_ring_get_wptr,
>   	.set_wptr = uvd_v7_0_ring_set_wptr,
> @@ -1571,6 +1572,7 @@ static const struct amdgpu_ring_funcs uvd_v7_0_enc_ring_vm_funcs = {
>   	.nop = HEVC_ENC_CMD_NO_OP,
>   	.support_64bit_ptrs = false,
>   	.no_user_fence = true,
> +	.engine_retains_context = true,
>   	.get_rptr = uvd_v7_0_enc_ring_get_rptr,
>   	.get_wptr = uvd_v7_0_enc_ring_get_wptr,
>   	.set_wptr = uvd_v7_0_enc_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> index a316797875a8..1691d0f955a9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> @@ -2117,6 +2117,7 @@ static const struct amdgpu_ring_funcs vcn_v1_0_dec_ring_vm_funcs = {
>   	.support_64bit_ptrs = false,
>   	.no_user_fence = true,
>   	.secure_submission_supported = true,
> +	.engine_retains_context = true,
>   	.get_rptr = vcn_v1_0_dec_ring_get_rptr,
>   	.get_wptr = vcn_v1_0_dec_ring_get_wptr,
>   	.set_wptr = vcn_v1_0_dec_ring_set_wptr,
> @@ -2150,6 +2151,7 @@ static const struct amdgpu_ring_funcs vcn_v1_0_enc_ring_vm_funcs = {
>   	.align_mask = 0x3f,
>   	.nop = VCN_ENC_CMD_NO_OP,
>   	.support_64bit_ptrs = false,
> +	.engine_retains_context = true,
>   	.no_user_fence = true,
>   	.get_rptr = vcn_v1_0_enc_ring_get_rptr,
>   	.get_wptr = vcn_v1_0_enc_ring_get_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> index 8897dcc9c1a0..046dd6b216e9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> @@ -2113,6 +2113,7 @@ static const struct amdgpu_ring_funcs vcn_v2_0_dec_ring_vm_funcs = {
>   	.type = AMDGPU_RING_TYPE_VCN_DEC,
>   	.align_mask = 0xf,
>   	.secure_submission_supported = true,
> +	.engine_retains_context = true,
>   	.get_rptr = vcn_v2_0_dec_ring_get_rptr,
>   	.get_wptr = vcn_v2_0_dec_ring_get_wptr,
>   	.set_wptr = vcn_v2_0_dec_ring_set_wptr,
> @@ -2144,6 +2145,7 @@ static const struct amdgpu_ring_funcs vcn_v2_0_enc_ring_vm_funcs = {
>   	.type = AMDGPU_RING_TYPE_VCN_ENC,
>   	.align_mask = 0x3f,
>   	.nop = VCN_ENC_CMD_NO_OP,
> +	.engine_retains_context = true,
>   	.get_rptr = vcn_v2_0_enc_ring_get_rptr,
>   	.get_wptr = vcn_v2_0_enc_ring_get_wptr,
>   	.set_wptr = vcn_v2_0_enc_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> index cebee453871c..063f88da120b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> @@ -1777,6 +1777,7 @@ static const struct amdgpu_ring_funcs vcn_v2_5_dec_ring_vm_funcs = {
>   	.type = AMDGPU_RING_TYPE_VCN_DEC,
>   	.align_mask = 0xf,
>   	.secure_submission_supported = true,
> +	.engine_retains_context = true,
>   	.get_rptr = vcn_v2_5_dec_ring_get_rptr,
>   	.get_wptr = vcn_v2_5_dec_ring_get_wptr,
>   	.set_wptr = vcn_v2_5_dec_ring_set_wptr,
> @@ -1877,6 +1878,7 @@ static const struct amdgpu_ring_funcs vcn_v2_5_enc_ring_vm_funcs = {
>   	.type = AMDGPU_RING_TYPE_VCN_ENC,
>   	.align_mask = 0x3f,
>   	.nop = VCN_ENC_CMD_NO_OP,
> +	.engine_retains_context = true,
>   	.get_rptr = vcn_v2_5_enc_ring_get_rptr,
>   	.get_wptr = vcn_v2_5_enc_ring_get_wptr,
>   	.set_wptr = vcn_v2_5_enc_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> index d9cf8f0feeb3..8dcc07b3f631 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> @@ -1857,6 +1857,7 @@ static const struct amdgpu_ring_funcs vcn_v3_0_dec_sw_ring_vm_funcs = {
>   	.align_mask = 0x3f,
>   	.nop = VCN_DEC_SW_CMD_NO_OP,
>   	.secure_submission_supported = true,
> +	.engine_retains_context = true,
>   	.get_rptr = vcn_v3_0_dec_ring_get_rptr,
>   	.get_wptr = vcn_v3_0_dec_ring_get_wptr,
>   	.set_wptr = vcn_v3_0_dec_ring_set_wptr,
> @@ -2021,6 +2022,7 @@ static const struct amdgpu_ring_funcs vcn_v3_0_dec_ring_vm_funcs = {
>   	.type = AMDGPU_RING_TYPE_VCN_DEC,
>   	.align_mask = 0xf,
>   	.secure_submission_supported = true,
> +	.engine_retains_context = true,
>   	.get_rptr = vcn_v3_0_dec_ring_get_rptr,
>   	.get_wptr = vcn_v3_0_dec_ring_get_wptr,
>   	.set_wptr = vcn_v3_0_dec_ring_set_wptr,
> @@ -2122,6 +2124,7 @@ static const struct amdgpu_ring_funcs vcn_v3_0_enc_ring_vm_funcs = {
>   	.type = AMDGPU_RING_TYPE_VCN_ENC,
>   	.align_mask = 0x3f,
>   	.nop = VCN_ENC_CMD_NO_OP,
> +	.engine_retains_context = true,
>   	.get_rptr = vcn_v3_0_enc_ring_get_rptr,
>   	.get_wptr = vcn_v3_0_enc_ring_get_wptr,
>   	.set_wptr = vcn_v3_0_enc_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> index 3ae666522d57..f1306316dc3c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> @@ -1977,6 +1977,7 @@ static struct amdgpu_ring_funcs vcn_v4_0_unified_ring_vm_funcs = {
>   	.type = AMDGPU_RING_TYPE_VCN_ENC,
>   	.align_mask = 0x3f,
>   	.nop = VCN_ENC_CMD_NO_OP,
> +	.engine_retains_context = true,
>   	.extra_bytes = sizeof(struct amdgpu_vcn_rb_metadata),
>   	.get_rptr = vcn_v4_0_unified_ring_get_rptr,
>   	.get_wptr = vcn_v4_0_unified_ring_get_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
> index eacf4e93ba2f..5a935c07352a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
> @@ -1628,6 +1628,7 @@ static const struct amdgpu_ring_funcs vcn_v4_0_3_unified_ring_vm_funcs = {
>   	.type = AMDGPU_RING_TYPE_VCN_ENC,
>   	.align_mask = 0x3f,
>   	.nop = VCN_ENC_CMD_NO_OP,
> +	.engine_retains_context = true,
>   	.get_rptr = vcn_v4_0_3_unified_ring_get_rptr,
>   	.get_wptr = vcn_v4_0_3_unified_ring_get_wptr,
>   	.set_wptr = vcn_v4_0_3_unified_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
> index b107ee80e472..1a485f5825dd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
> @@ -1481,6 +1481,7 @@ static struct amdgpu_ring_funcs vcn_v4_0_5_unified_ring_vm_funcs = {
>   	.type = AMDGPU_RING_TYPE_VCN_ENC,
>   	.align_mask = 0x3f,
>   	.nop = VCN_ENC_CMD_NO_OP,
> +	.engine_retains_context = true,
>   	.get_rptr = vcn_v4_0_5_unified_ring_get_rptr,
>   	.get_wptr = vcn_v4_0_5_unified_ring_get_wptr,
>   	.set_wptr = vcn_v4_0_5_unified_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
> index 0202df5db1e1..2d8214f591f1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
> @@ -1203,6 +1203,7 @@ static const struct amdgpu_ring_funcs vcn_v5_0_0_unified_ring_vm_funcs = {
>   	.type = AMDGPU_RING_TYPE_VCN_ENC,
>   	.align_mask = 0x3f,
>   	.nop = VCN_ENC_CMD_NO_OP,
> +	.engine_retains_context = true,
>   	.get_rptr = vcn_v5_0_0_unified_ring_get_rptr,
>   	.get_wptr = vcn_v5_0_0_unified_ring_get_wptr,
>   	.set_wptr = vcn_v5_0_0_unified_ring_set_wptr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
> index 714350cabf2f..bd3a04f1414d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
> @@ -1328,6 +1328,7 @@ static const struct amdgpu_ring_funcs vcn_v5_0_1_unified_ring_vm_funcs = {
>   	.type = AMDGPU_RING_TYPE_VCN_ENC,
>   	.align_mask = 0x3f,
>   	.nop = VCN_ENC_CMD_NO_OP,
> +	.engine_retains_context = true,
>   	.get_rptr = vcn_v5_0_1_unified_ring_get_rptr,
>   	.get_wptr = vcn_v5_0_1_unified_ring_get_wptr,
>   	.set_wptr = vcn_v5_0_1_unified_ring_set_wptr,

All checks out, nothing seems forgotten.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

