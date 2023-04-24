Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 145846ED42B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 20:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4214C10E1D7;
	Mon, 24 Apr 2023 18:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0772410E1D7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 18:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682360056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1t7mmBoREyN++55SKMolHK6qsrf6grZmQqxd4DYClio=;
 b=Kgw2syPxB9GOHRcjnc/V6tsFN1tArs+AzeU8T62sv7UtejFV4iKJ+Z3YaTzCMWmRj/LACj
 D4ak0ytJKALFuf8jcTVJpEJUA/rnWV6yLnHMNuJHfGuSf+gte4kzXqkpzNMVHHYUzRsMsW
 8QK6OoKCWeweyzMiI/7ce9xC1V/LXuM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-mKDp6tZhPqOW03xP1nN_tQ-1; Mon, 24 Apr 2023 14:14:15 -0400
X-MC-Unique: mKDp6tZhPqOW03xP1nN_tQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-5ef510c0f4dso28438246d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 11:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682360055; x=1684952055;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1t7mmBoREyN++55SKMolHK6qsrf6grZmQqxd4DYClio=;
 b=BQs2mMuPvTZLE07MEUb5r++p+MGt8Sgl2OS4kpGQAS7E8QUGWQgArMtkRXmSsTyg7M
 89r21CmTDgL8a9aBoHjpKVhy12pPRvij3jg9AUFKzg8nWvIQykJ7fg0YWfb7Z4q7fzpY
 NUFlqZCAhN1oQpdZqpkkFDK2dQkxp5KP5mwTh2aoUa5MCWkYOTHSiqI8XZXzFU0rdhMp
 j3KNKcAFY2uzmyImZdp+cuytFRN0MAtM2MFTz62s85MgHcNroRwY/9f9JAWTFNW6leHt
 GO8OBmd5d9IeFNQ7pytp572kyxCJ5HQPjBZGFRX02HgBahXmpnfxICJhNlCDoGjnzQlR
 zCSw==
X-Gm-Message-State: AAQBX9d6T742CmR0LcLB2Y9Gada1mSL6kwIrD8dYEsEuTZynUYniAaNR
 FhMoSLGRU00KJjR1ETNX/qwpx0MunG8iR9ChGzDD25YdD5TY3Xb/0nKuzi4403srkZlVsHxzXes
 4ey47mvtAfZU5lhD0OmB73Eo6ZHQK
X-Received: by 2002:ac8:5792:0:b0:3ef:5733:29e4 with SMTP id
 v18-20020ac85792000000b003ef573329e4mr23695484qta.64.1682360054971; 
 Mon, 24 Apr 2023 11:14:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350atGQDLcokpP+b8qwiVWcVt+lW3aoMSwbKlIc/IoMCQwMl5grguEKprAip97oqd3hMBQL6FWw==
X-Received: by 2002:ac8:5792:0:b0:3ef:5733:29e4 with SMTP id
 v18-20020ac85792000000b003ef573329e4mr23695447qta.64.1682360054621; 
 Mon, 24 Apr 2023 11:14:14 -0700 (PDT)
Received: from [192.168.1.31] (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 p141-20020a374293000000b0074de75f783fsm3757258qka.26.2023.04.24.11.14.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 11:14:14 -0700 (PDT)
Message-ID: <4ca4e590-a996-81ad-e088-d172f5a5a8ba@redhat.com>
Date: Mon, 24 Apr 2023 11:14:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/amd/display: return status of
 dmub_srv_get_fw_boot_status
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Alvin.Lee2@amd.com, Jun.Lei@amd.com, qingqing.zhuo@amd.com,
 Max.Tseng@amd.com, Josip.Pavic@amd.com, Eric.Yang2@amd.com,
 aurabindo.pillai@amd.com
References: <20230420135901.3889747-1-trix@redhat.com>
 <9910a5e3-a161-edfa-19d4-2bbf3bbf405f@amd.com>
From: Tom Rix <trix@redhat.com>
In-Reply-To: <9910a5e3-a161-edfa-19d4-2bbf3bbf405f@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/24/23 10:02 AM, Hamza Mahfooz wrote:
>
> On 4/20/23 09:59, Tom Rix wrote:
>> gcc with W=1 reports
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:
>>    In function ‘dc_dmub_srv_optimized_init_done’:
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:184:26:
>>    error: variable ‘dmub’ set but not used 
>> [-Werror=unused-but-set-variable]
>>    184 |         struct dmub_srv *dmub;
>>        |                          ^~~~
>>
>> The return status is never set.
>> It looks like a call to dmub_srv_get_fw_boot_status is missing.
>>
>> Fixes: 499e4b1c722e ("drm/amd/display: add mechanism to skip DCN init")
>
> What tree is this based on? I am unable to find that exact commit on
> amd-staging-drm-next.

linux-next

Tom


>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c 
>> b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
>> index d15ec32243e2..36d936ab4300 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
>> @@ -182,14 +182,23 @@ bool dc_dmub_srv_cmd_run_list(struct 
>> dc_dmub_srv *dc_dmub_srv, unsigned int coun
>>   bool dc_dmub_srv_optimized_init_done(struct dc_dmub_srv *dc_dmub_srv)
>>   {
>>       struct dmub_srv *dmub;
>> -    union dmub_fw_boot_status status;
>> +    struct dc_context *dc_ctx;
>> +    union dmub_fw_boot_status boot_status;
>> +    enum dmub_status status;
>>         if (!dc_dmub_srv || !dc_dmub_srv->dmub)
>>           return false;
>>         dmub = dc_dmub_srv->dmub;
>> +    dc_ctx = dc_dmub_srv->ctx;
>> +
>> +    status = dmub_srv_get_fw_boot_status(dmub, &boot_status);
>> +    if (status != DMUB_STATUS_OK) {
>> +        DC_ERROR("Error querying DMUB boot status: error=%d\n", 
>> status);
>> +        return false;
>> +    }
>>   -    return status.bits.optimized_init_done;
>> +    return boot_status.bits.optimized_init_done;
>>   }
>>     bool dc_dmub_srv_notify_stream_mask(struct dc_dmub_srv *dc_dmub_srv,

