Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B401C82AC
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 08:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921086E914;
	Thu,  7 May 2020 06:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CC36E914;
 Thu,  7 May 2020 06:42:54 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 188so5070284wmc.2;
 Wed, 06 May 2020 23:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=u9x5CxPuUX9KvELHPIEAEoDfCQa03ODaNOa1+2QT5/Y=;
 b=Jg/8Weta4UEn+UaAsuYfsWcL1WXFxhUUbzx32Wng0weqzZVChYoliVf2Dsbab7b/C0
 W6KUk8QGFnu5KOXA/Be5pqeb7TjNTrzbp6vX/dt8j20PeV2aIBV+6olcpYubdxE/Db3J
 C/sFMOhCAxNPRpHjouJt1eY/ipGii6NtklkePn5KEbCIwb9ff7585NWCyJJSGeBk2aQb
 cf+XAJVC0YwTWYp0ZoJSqb8nfiGM0W0uc/5Dky7UCBR4mjQwBJHtHpCIyTEJRVDmmn8k
 9U0XpRh7SQ4Bhe/acqZtzzlsMDv+Ny90GzU5uCgog0nlhLPEZqbQBYSHZBMmK3CFea1C
 bhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=u9x5CxPuUX9KvELHPIEAEoDfCQa03ODaNOa1+2QT5/Y=;
 b=XxeZx8CnX8/FVE/DrtF1x/A4NVnoAc7p+c74CO+IHJL8a0BpXt0ynei5hrye5+Lt4A
 1b0Kf5t3q8oNpslbO/W/NQ8rG6T7z57FSK9Drze47S4AsFAYwD0u0ogOLmOgboZ8VILr
 bSHKBB+ZMOUNCZg4xGSeRrbZNPzThrzeKYuz6BYOFWytuRDiwDLD9Nw4cmVDLN+1CkTH
 jhZ+Iotjq2PM1DXqhIFbWXzKxb7p/vcDzcjoSGM+imt1OjWwItS6VtLjGb9F0braLzl3
 9mqtj5Q/vri5v4OsyEFYnLNLI+oo8hpeX5nZd1b9s34Qw0HpSI/aGHaaJ68ve/KaqxrG
 GvhA==
X-Gm-Message-State: AGi0PuaFCk9tqMaPMsALD1jy3kO7/NNar1uyBfGmZJJLVqoNCnPjaLQx
 cxHHGBFcb+Fl3ugYP+MKaI8=
X-Google-Smtp-Source: APiQypKQFRvND9YMQALXyd7xMrHaeY3PO4dhEInignttoGdFAGtl2qTWrdddrR/9c7FbdjaLg2sRrg==
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr8755266wmc.67.1588833773329; 
 Wed, 06 May 2020 23:42:53 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id w6sm6674286wrt.39.2020.05.06.23.42.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 May 2020 23:42:52 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: allocate large structures dynamically
To: Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, John Clements <john.clements@amd.com>
References: <20200505140208.284473-1-arnd@arndb.de>
 <006e29037a9314fb286a5d6d84905bce99cef6c7.camel@perches.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <845a2e12-538c-fb6d-db80-78e8adf1413f@gmail.com>
Date: Thu, 7 May 2020 08:42:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <006e29037a9314fb286a5d6d84905bce99cef6c7.camel@perches.com>
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
Cc: Guchun Chen <guchun.chen@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Dennis Li <Dennis.Li@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.05.20 um 21:01 schrieb Joe Perches:
> On Tue, 2020-05-05 at 16:01 +0200, Arnd Bergmann wrote:
>> After the structure was padded to 1024 bytes, it is no longer
>> suitable for being a local variable, as the function surpasses
>> the warning limit for 32-bit architectures:
>>
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:587:5: error: stack frame size of 1072 bytes in function 'amdgpu_ras_feature_enable' [-Werror,-Wframe-larger-than=]
>> int amdgpu_ras_feature_enable(struct amdgpu_device *adev,
>>      ^
>>
>> Use kzalloc() instead to get it from the heap.
> []
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> []
>> @@ -588,19 +588,23 @@ int amdgpu_ras_feature_enable(struct amdgpu_device *adev,
>>   		struct ras_common_if *head, bool enable)
>>   {
>>   	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
>> -	union ta_ras_cmd_input info;
>> +	union ta_ras_cmd_input *info;
>>   	int ret;
>>   
>>   	if (!con)
>>   		return -EINVAL;
>>   
>> +        info = kzalloc(sizeof(union ta_ras_cmd_input), GFP_KERNEL);
> Spaces were used for indentation here not a tab.
> It might be useful to run your proposed patches through checkpatch
>
> Is this an actual bug fix as the previous use didn't
> zero unused info members?
>
>> +	if (!info)
>> +		return -ENOMEM;
>> +
>>   	if (!enable) {
>> -		info.disable_features = (struct ta_ras_disable_features_input) {
>> +		info->disable_features = (struct ta_ras_disable_features_input) {
>>   			.block_id =  amdgpu_ras_block_to_ta(head->block),
>>   			.error_type = amdgpu_ras_error_to_ta(head->type),
>>   		};
>>   	} else {
>> -		info.enable_features = (struct ta_ras_enable_features_input) {
>> +		info->enable_features = (struct ta_ras_enable_features_input) {
>>   			.block_id =  amdgpu_ras_block_to_ta(head->block),
>>   			.error_type = amdgpu_ras_error_to_ta(head->type),
>>   		};
>> @@ -609,26 +613,33 @@ int amdgpu_ras_feature_enable(struct amdgpu_device *adev,
>>   	/* Do not enable if it is not allowed. */
>>   	WARN_ON(enable && !amdgpu_ras_is_feature_allowed(adev, head));
>>   	/* Are we alerady in that state we are going to set? */
>> -	if (!(!!enable ^ !!amdgpu_ras_is_feature_enabled(adev, head)))
>> -		return 0;
>> +	if (!(!!enable ^ !!amdgpu_ras_is_feature_enabled(adev, head))) {
> And trivia:
>
> The !! uses with bool seem unnecessary and it's probably better
> to make amdgpu_ras_is_feature_enabled to return bool.
>
> Maybe something like:
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> index 538895cfd862..05c4eaf0ddfa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -526,16 +526,16 @@ void amdgpu_ras_parse_status_code(struct amdgpu_device* adev,
>   }
>   
>   /* feature ctl begin */
> -static int amdgpu_ras_is_feature_allowed(struct amdgpu_device *adev,
> -		struct ras_common_if *head)
> +static bool amdgpu_ras_is_feature_allowed(struct amdgpu_device *adev,
> +					  struct ras_common_if *head)
>   {
>   	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
>   
>   	return con->hw_supported & BIT(head->block);
>   }
>   
> -static int amdgpu_ras_is_feature_enabled(struct amdgpu_device *adev,
> -		struct ras_common_if *head)
> +static bool amdgpu_ras_is_feature_enabled(struct amdgpu_device *adev,
> +					  struct ras_common_if *head)
>   {
>   	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
>   
> @@ -560,7 +560,7 @@ static int __amdgpu_ras_feature_enable(struct amdgpu_device *adev,
>   	 */
>   	if (!amdgpu_ras_is_feature_allowed(adev, head))
>   		return 0;
> -	if (!(!!enable ^ !!amdgpu_ras_is_feature_enabled(adev, head)))
> +	if (!(enable ^ amdgpu_ras_is_feature_enabled(adev, head)))

And while we are at improving coding style I think that writing this as 
"if (enabled == amdgpu_ras_is_feature_enabled(adev, head))" would be 
much more readable.

Christian.

>   		return 0;
>   
>   	if (enable) {
> @@ -609,7 +609,7 @@ int amdgpu_ras_feature_enable(struct amdgpu_device *adev,
>   	/* Do not enable if it is not allowed. */
>   	WARN_ON(enable && !amdgpu_ras_is_feature_allowed(adev, head));
>   	/* Are we alerady in that state we are going to set? */
> -	if (!(!!enable ^ !!amdgpu_ras_is_feature_enabled(adev, head)))
> +	if (!(enable ^ amdgpu_ras_is_feature_enabled(adev, head)))
>   		return 0;
>   
>   	if (!amdgpu_ras_intr_triggered()) {
>
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
