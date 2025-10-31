Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129D6C24B4B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 12:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0B610EBB8;
	Fri, 31 Oct 2025 11:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Nif7F6BX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7379410EB56
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 11:10:42 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4711810948aso15797695e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 04:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1761909041; x=1762513841;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D0Nk1P3ntHG4OBpltR07ZgmEI6Qnj6qaUIPd34PSAfk=;
 b=Nif7F6BXY5N+lrOIq1ppWu1KruiRRSiEtohKYmoWJrgtqUZ3ZhC5YIpcoMOJaN9+gl
 Pn2HlxC1LbE56U9IIKykqY1Xw/k/rVf95cQQhR9vj/OoT9I5RLQLp//poXlae9J5CKxg
 5UQZlazWX9t2Vu57yXg77WKf3jxFHD371qYr4BHwNgddMLovnkJvFRBSInJzaJk48epp
 ZW8PZkYUWxPZhGunlPl+kK5t+4p8VxhovKaDqGwjBt5zvTf+MRRMGWW6+PYUUqkber3H
 ZRkOiSqffjZymzctGNVFKsocOxSp12GCAKfLVHhPVf+Ob5Y+3Cci49nZnqYwSWm3RqPo
 fDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761909041; x=1762513841;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D0Nk1P3ntHG4OBpltR07ZgmEI6Qnj6qaUIPd34PSAfk=;
 b=B3bviyZdK56DKmGQj0FNwqTOC/H0kTjW8hdUArhbc9pWb1uWXhFJ9Ih0apSww9mVQp
 Dg5CmBIJfDNsN0+RRCKIEeV/E0rMyplEH6cVfmbnRx8NyP9FyD72X38ox6ni9Ok2ZGbb
 A/jhZ7T3NCKDLz7Yp/NEccq8933xsZCB0rJG/tWXM3pypMydjs4ktBDqaesJ56J8rNxj
 yp57RajCyi8pQfIOQCEXsfY2XPMpdNZ2TtcH92kxt2RW/OeN01DceDBTfd8cSX44FFlV
 BNO7XB6UPLZb2cjJ3amuh396CcSIh/XjBqA7sSMMdZFqTYZoGEhdhjmaTGz0xvKaBQJX
 QrKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI/O36WJ7yizRG1xQl2L3PlEUdjBBYw6sYld/xvPZz9T4dqP9WjFP+tNZTLQPrK19EwyLvapyViRc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywi+RoAO07aJKezQha6VctR4Pp4VVErNxLOqYU7RgP+YWq7UDfQ
 L27RMn2I9KCwaSEWtRNsCM0jcM8qmO8D0Rfr+V74BL1/a3rgIdiLt+KkI8bIZ1M4M6M=
X-Gm-Gg: ASbGncvZTiDvrSns8E3glGJT5vXSL2K4//G4XjMsgkMfV6WKF6Elb4RdTScnzs8eNAs
 IqBmWQAFSA6MMkVb6FkV+s/6MJ2UemhtyGP0doESLBj0ikI597bDlcr/Gf53zycWiZlwigxOQ0/
 7BXAaP7MNXhvhKk4NRiwWs7uIlUhFNNEAtOSIPlPVteYn8BTjlRIkimzNg++FWJsrMly0wW8l6a
 9+xA79tJp5TDxs5iA+wLkoVX7tUsogEjyTHQMnOzD2rnJRMxb3J/JJz1LYXfI7CI8wjRBKduI+B
 THhBRq0Ni6/88piB7QNvqWTXgul7GskIhCc4LtZIaZb77O52TI4NRezbh7+QPq3+s1zxGGNdFej
 gChHkK3lmynxrFfgKi9LTsFPxOV2dak9c/eoBvNikLpR22BN9aHKT8Fk07zT1r6SVoiAMTFXtZY
 AZ7zPFthqygvUfMYdB
X-Google-Smtp-Source: AGHT+IExR92bmZl9tZdCBl/7orqf5R1ospyKjCjVMeFLCt8U0ORRPkDWrMpIm+SwSgdMcNCXxCw1kA==
X-Received: by 2002:a05:600c:4e05:b0:46f:b42e:edce with SMTP id
 5b1f17b1804b1-477308a8ba3mr28081815e9.39.1761909039970; 
 Fri, 31 Oct 2025 04:10:39 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732ff8235sm26926255e9.14.2025.10.31.04.10.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 04:10:39 -0700 (PDT)
Message-ID: <a71af2ef-d35b-4ef2-baaf-2e68cd3d22de@ursulin.net>
Date: Fri, 31 Oct 2025 11:10:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/amdgpu: add engine_retains_context to
 amdgpu_ring_funcs
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251030091118.4864-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251030091118.4864-1-pierre-eric.pelloux-prayer@amd.com>
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


On 30/10/2025 09:11, Pierre-Eric Pelloux-Prayer wrote:
> If true, the hw engine retains context among dependent jobs, which means
> load balancing between schedulers cannot be used at the job level.
> 
> amdgpu_ctx_init_entity uses this information to disable load balancing,
> but it's best to store it as a property rather than deduce it based on
> hw_ip.

On a tangent, this patch reminded me on a series I had to remove some 
holes from structs. For the ring specifically:

commit e89d67894fe4824d0163c8831b9bcdaabb4ae3a2
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Fri Feb 21 13:37:25 2025 +0000

     struct amdgpu_ring {

             /* size: 792, cachelines: 13, members: 62 */
             /* sum members: 746, holes: 13, sum holes: 46 */
             /* last cacheline: 24 bytes */

             /* size: 744, cachelines: 12, members: 62 */
             /* sum members: 738, holes: 2, sum holes: 6 */
             /* last cacheline: 40 bytes */

I tried to keep and/or improve logical grouping of fields while 
re-arranging to avoid holes. Only one cacheline saved is not much so not 
sure. Not even sure if I ever sent it. Any interest to clean it up and send?

Regards,

Tvrtko
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

