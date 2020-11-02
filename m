Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 115652A34D8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 21:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F726E0AD;
	Mon,  2 Nov 2020 20:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF5F6E0AD;
 Mon,  2 Nov 2020 20:06:24 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id l24so15599069edj.8;
 Mon, 02 Nov 2020 12:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=w3IRnJzG4XjUcIM6h66eH4WlctfkNHefOPDkKyf49Dc=;
 b=siNHqjmbla66+WUg+oZsw0diCCWy6NqAWJ4FQla7ocOXGqqP9CWNK3eH/fG65GwntQ
 FzbcB3xTlxGRA8YiXdtz1eQ3wrFIczsrJUibOqgPAukv+W+2L0oPtreXtpGYNqP/PgPe
 JyiWGuo3rSPJ6oDzPLR/tIcLfupMn6pPFUO+Evzj1AzYOIHM7SKacjXgKhhI6ekI3fz1
 A8+GRwTgok1eLjJox3XHgqcZc5HxLR+k9Ldx8KgdIc8qmpJKfUVG5otxonCHMh026h6h
 +v5+h4qN8oqsnn+Lyh48SGqxTgsHbgC2G21BAwBuCKkjOsMbXt/7pu3nW9w5JEyDA6EF
 Ixxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=w3IRnJzG4XjUcIM6h66eH4WlctfkNHefOPDkKyf49Dc=;
 b=PMMNJT+9tm+T2os6jQiUfy1cb1kSUDy1vSaKhurc0HtZ+gV/Kb3hjfEatREUCIuuFO
 /PjhkHU2Tbx1jpr58NAB1kcQp9cyr356xYKLlkwNNkhIZ6NIcVuztVOkZzHh68F0rkqA
 fxOPLhCNWEuP5Rtl80a8J0fgfQ/oRfi823GOsn5LSCaL5bYWcE8qjl7Qo76JUNCnAMD+
 FbA2DTOGqaccKrQaQ+s0Pysz9SAP1+V+5/PGLl6Jd5pkqlX2IXSW+wLibHhDMcxQ8RTQ
 pzs0RZKKfMmL4dDrxK+ZVVO4ckz65Bs4YDvzKWGq+uzcsNvNoQ0LH+Fo5ihl1vp95Rhm
 wMQA==
X-Gm-Message-State: AOAM5300U3OkZ32ENEefqZjoMA8OOClL2sjtgxNvYM3VqgXfnxHOtKNq
 043EKGyMSdvA4c4U2SDHq2M=
X-Google-Smtp-Source: ABdhPJy0aMGn1kELGS+uke5nHRhUK4NXtI5kkC7cUQTLJaWJHBrr8+w/qfFLOHaR/k37qH8hWGwrew==
X-Received: by 2002:a50:88e5:: with SMTP id d92mr18507918edd.145.1604347583544; 
 Mon, 02 Nov 2020 12:06:23 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c3sm10752877edl.60.2020.11.02.12.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 12:06:22 -0800 (PST)
Subject: Re: [PATCH] drm/amdgpu: do not initialise global variables to 0 or
 NULL
To: Alex Deucher <alexdeucher@gmail.com>, Deepak R Varma <mh12gx2825@gmail.com>
References: <20201102184147.GA42288@localhost>
 <CADnq5_OnA3T_p4pTEOpoqQ=NZyso2VFoDiOHu=+h7dKOeKHq-A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c916ae88-5933-ab06-ad32-d87f00cac21f@gmail.com>
Date: Mon, 2 Nov 2020 21:06:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_OnA3T_p4pTEOpoqQ=NZyso2VFoDiOHu=+h7dKOeKHq-A@mail.gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.11.20 um 20:43 schrieb Alex Deucher:
> On Mon, Nov 2, 2020 at 1:42 PM Deepak R Varma <mh12gx2825@gmail.com> wrote:
>> Initializing global variable to 0 or NULL is not necessary and should
>> be avoided. Issue reported by checkpatch script as:
>> ERROR: do not initialise globals to 0 (or NULL).
> I agree that this is technically correct, but a lot of people don't
> seem to know that so we get a lot of comments about this code for the
> variables that are not explicitly set.  Seems less confusing to
> initialize them even if it not necessary.  I don't have a particularly
> strong opinion on it however.

Agree with Alex.

Especially for the module parameters we should have a explicit init 
value for documentation purposes, even when it is 0.

Christian.

>
> Alex
>
>> Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 46 ++++++++++++-------------
>>   drivers/gpu/drm/amd/amdgpu/atom.c       |  4 +--
>>   2 files changed, 25 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 8ab6126ff70c..6de94c46bc91 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -94,16 +94,16 @@
>>   #define KMS_DRIVER_MINOR       40
>>   #define KMS_DRIVER_PATCHLEVEL  0
>>
>> -int amdgpu_vram_limit = 0;
>> -int amdgpu_vis_vram_limit = 0;
>> +int amdgpu_vram_limit;
>> +int amdgpu_vis_vram_limit;
>>   int amdgpu_gart_size = -1; /* auto */
>>   int amdgpu_gtt_size = -1; /* auto */
>>   int amdgpu_moverate = -1; /* auto */
>> -int amdgpu_benchmarking = 0;
>> -int amdgpu_testing = 0;
>> +int amdgpu_benchmarking;
>> +int amdgpu_testing;
>>   int amdgpu_audio = -1;
>> -int amdgpu_disp_priority = 0;
>> -int amdgpu_hw_i2c = 0;
>> +int amdgpu_disp_priority;
>> +int amdgpu_hw_i2c;
>>   int amdgpu_pcie_gen2 = -1;
>>   int amdgpu_msi = -1;
>>   char amdgpu_lockup_timeout[AMDGPU_MAX_TIMEOUT_PARAM_LENGTH];
>> @@ -113,43 +113,43 @@ int amdgpu_aspm = -1;
>>   int amdgpu_runtime_pm = -1;
>>   uint amdgpu_ip_block_mask = 0xffffffff;
>>   int amdgpu_bapm = -1;
>> -int amdgpu_deep_color = 0;
>> +int amdgpu_deep_color;
>>   int amdgpu_vm_size = -1;
>>   int amdgpu_vm_fragment_size = -1;
>>   int amdgpu_vm_block_size = -1;
>> -int amdgpu_vm_fault_stop = 0;
>> -int amdgpu_vm_debug = 0;
>> +int amdgpu_vm_fault_stop;
>> +int amdgpu_vm_debug;
>>   int amdgpu_vm_update_mode = -1;
>> -int amdgpu_exp_hw_support = 0;
>> +int amdgpu_exp_hw_support;
>>   int amdgpu_dc = -1;
>>   int amdgpu_sched_jobs = 32;
>>   int amdgpu_sched_hw_submission = 2;
>> -uint amdgpu_pcie_gen_cap = 0;
>> -uint amdgpu_pcie_lane_cap = 0;
>> +uint amdgpu_pcie_gen_cap;
>> +uint amdgpu_pcie_lane_cap;
>>   uint amdgpu_cg_mask = 0xffffffff;
>>   uint amdgpu_pg_mask = 0xffffffff;
>>   uint amdgpu_sdma_phase_quantum = 32;
>> -char *amdgpu_disable_cu = NULL;
>> -char *amdgpu_virtual_display = NULL;
>> +char *amdgpu_disable_cu;
>> +char *amdgpu_virtual_display;
>>   /* OverDrive(bit 14) disabled by default*/
>>   uint amdgpu_pp_feature_mask = 0xffffbfff;
>> -uint amdgpu_force_long_training = 0;
>> -int amdgpu_job_hang_limit = 0;
>> +uint amdgpu_force_long_training;
>> +int amdgpu_job_hang_limit;
>>   int amdgpu_lbpw = -1;
>>   int amdgpu_compute_multipipe = -1;
>>   int amdgpu_gpu_recovery = -1; /* auto */
>> -int amdgpu_emu_mode = 0;
>> -uint amdgpu_smu_memory_pool_size = 0;
>> +int amdgpu_emu_mode;
>> +uint amdgpu_smu_memory_pool_size;
>>   /* FBC (bit 0) disabled by default*/
>> -uint amdgpu_dc_feature_mask = 0;
>> -uint amdgpu_dc_debug_mask = 0;
>> +uint amdgpu_dc_feature_mask;
>> +uint amdgpu_dc_debug_mask;
>>   int amdgpu_async_gfx_ring = 1;
>> -int amdgpu_mcbp = 0;
>> +int amdgpu_mcbp;
>>   int amdgpu_discovery = -1;
>> -int amdgpu_mes = 0;
>> +int amdgpu_mes;
>>   int amdgpu_noretry = -1;
>>   int amdgpu_force_asic_type = -1;
>> -int amdgpu_tmz = 0;
>> +int amdgpu_tmz;
>>   int amdgpu_reset_method = -1; /* auto */
>>   int amdgpu_num_kcq = -1;
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
>> index 696e97ab77eb..46c00ee580b1 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/atom.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/atom.c
>> @@ -66,7 +66,7 @@ typedef struct {
>>          bool abort;
>>   } atom_exec_context;
>>
>> -int amdgpu_atom_debug = 0;
>> +int amdgpu_atom_debug;
>>   static int amdgpu_atom_execute_table_locked(struct atom_context *ctx, int index, uint32_t * params);
>>   int amdgpu_atom_execute_table(struct atom_context *ctx, int index, uint32_t * params);
>>
>> @@ -88,7 +88,7 @@ static int atom_dst_to_src[8][4] = {
>>   };
>>   static int atom_def_dst[8] = { 0, 0, 1, 2, 0, 1, 2, 3 };
>>
>> -static int debug_depth = 0;
>> +static int debug_depth;
>>   #ifdef ATOM_DEBUG
>>   static void debug_print_spaces(int n)
>>   {
>> --
>> 2.25.1
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
