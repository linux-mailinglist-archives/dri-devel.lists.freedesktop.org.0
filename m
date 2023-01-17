Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7AD66E544
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 18:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1C610E303;
	Tue, 17 Jan 2023 17:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC3910E305;
 Tue, 17 Jan 2023 17:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673977893; x=1705513893;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=n0FgE4J8em7zQXCwUH4vknV/VS6zROjS7xx2r3TK52k=;
 b=iHJyFU1e2aR6zsZkpz263q3Uo8Z02IYcmR8Kj9bwiIaOCYNPKXi0YHeN
 dsneEhanzer3/yNUDSUMOcyKVna5xhCt7cKShYgIMEIKPD6F4H1wBzb4+
 P+LED2e1kJFooMdppUVZA/dpQ+KeMhcup8ebjxjTzbPnkCgFTu7cze4CE
 2kjx3N90G21eYQnM3/ZRl3Wez71FUp5QUR4yZBpsEQvcMMkzoAOtUW5Nw
 4f/3Zgndflan1vEy76TVE7jlVjiaudtCciUZZO26Qr5x3VgFHYicesJdO
 4haLoqSjzwYFUjaJjMb+3AvOFUKupwXliiTBOSOvcCzGjC0+7ia4T3Zpa Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="387111630"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="387111630"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 09:51:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="659463220"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="659463220"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.222.166])
 ([10.251.222.166])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 09:51:31 -0800
Message-ID: <b1b8cc97-f102-8820-3b5d-1cce97fc398f@linux.intel.com>
Date: Tue, 17 Jan 2023 18:51:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] drm/radeon: Do not use deprecated drm log API
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20230117174447.21870-1-nirmoy.das@intel.com>
 <CADnq5_P-vC9zfEPUk7LwPWuS1s+e4nqZtEqWf2mo0BfnVwYqJA@mail.gmail.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <CADnq5_P-vC9zfEPUk7LwPWuS1s+e4nqZtEqWf2mo0BfnVwYqJA@mail.gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/17/2023 6:48 PM, Alex Deucher wrote:
> On Tue, Jan 17, 2023 at 12:45 PM Nirmoy Das <nirmoy.das@intel.com> wrote:
>> Replace deprecated DRM_DEBUG_KMS_RATELIMITED() and DRM_ERROR()
>> with proper APIs.
>>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/radeon/radeon_dp_auxch.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_dp_auxch.c b/drivers/gpu/drm/radeon/radeon_dp_auxch.c
>> index 69379b95146e..76ce66efb5f8 100644
>> --- a/drivers/gpu/drm/radeon/radeon_dp_auxch.c
>> +++ b/drivers/gpu/drm/radeon/radeon_dp_auxch.c
>> @@ -158,7 +158,7 @@ radeon_dp_aux_transfer_native(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg
>>          } while (retry_count++ < 1000);
>>
>>          if (retry_count >= 1000) {
>> -               DRM_ERROR("auxch hw never signalled completion, error %08x\n", tmp);
>> +               pr_err("auxch hw never signalled completion, error %08x\n", tmp);
> Please use dev_err() instead so we get device identification on error
> messages.  Makes it much easier when you have multiple GPUs in a
> system.


Thanks for your quick review, Alex. I will resend with dev_err().


Nirmoy

>
> Alex
>
>>                  ret = -EIO;
>>                  goto done;
>>          }
>> @@ -168,8 +168,7 @@ radeon_dp_aux_transfer_native(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg
>>                  goto done;
>>          }
>>          if (tmp & AUX_RX_ERROR_FLAGS) {
>> -               DRM_DEBUG_KMS_RATELIMITED("dp_aux_ch flags not zero: %08x\n",
>> -                                         tmp);
>> +               drm_dbg_kms_ratelimited(dev, "dp_aux_ch flags not zero: %08x\n", tmp);
>>                  ret = -EIO;
>>                  goto done;
>>          }
>> --
>> 2.39.0
>>
