Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD454691F48
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 13:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A78F10E116;
	Fri, 10 Feb 2023 12:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0E210E0F7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 12:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676033253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kuu/PJhD8nGIHIgUoDS4z2Cwm/+wmnT47re0wBKh1e4=;
 b=eOA5OBJDmPfaDRndggdI+3BkhHvOxy5VR4k9X4+Z1KhArCSgo+nwSLyMa5YhyOwNXzWV05
 TJz3HzlWBpl/jrWOPTDbWKUeoQdcKhMkZZ8NkAY5QD6VGwViDrIiAftppomLR4NsvdIWNj
 3Nv3WT8KjNvmuyfVH1pnX/6w6tOw6pw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-46-2TaX7LaYM16I4pEneB2IuQ-1; Fri, 10 Feb 2023 07:47:32 -0500
X-MC-Unique: 2TaX7LaYM16I4pEneB2IuQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 qk8-20020a1709077f8800b008af3fb43869so2951764ejc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 04:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kuu/PJhD8nGIHIgUoDS4z2Cwm/+wmnT47re0wBKh1e4=;
 b=DsZUm/fqfpnO2LE1Qdx4zGZroYGFvLHC4RJ/hC6qqxBcLcAshJkyXNbSYOCLJOSaES
 0BTy7dc++yMXTZt7dhcoYtIxd/UBK/vURWuHhTewKjZNzN1F5T1kAGtAomLQtG9isJet
 ZQXin0c5AUiuHrMThrTs475LNqBra39DhSP6MfcOddMlngxp10N/GhhXBqMtRx4lmtd0
 N+qwyNW74lcX7UaLX5R4gfFXw6Oj9zS79bwSQvhyA+RWZUHwTfMRD++X5PAflrz64JDD
 OES5z1R8WaEFx4XU5N+av4u3rxf29AbQAWaoWp0lT5e6/mTWFKPwLOY5k+PD6bKHWMRM
 Nm1w==
X-Gm-Message-State: AO0yUKUkxiwyxpO7AfD+OWrc76ukl0HQvtn4obJr2Lp0rrX6crEx4Gj6
 C7cSm1Is1w78G7ZaUvZ2dnKMaqrrGtjXlVTH/7j0yC1kWfPF4tD4nmlIqbHYZi2OJxdS7ghD8TH
 evdLfwYWd7PKFjwijKZ36mZHGGK8c
X-Received: by 2002:a17:906:5fcb:b0:88d:ba89:183e with SMTP id
 k11-20020a1709065fcb00b0088dba89183emr11115001ejv.15.1676033251364; 
 Fri, 10 Feb 2023 04:47:31 -0800 (PST)
X-Google-Smtp-Source: AK7set+h13nK6UjQk0B/wbdzyHe5d49vQIdg12VGYZOctpH1Oj5IEVL1ApVKB4joAXetjIXpR0UyxQ==
X-Received: by 2002:a17:906:5fcb:b0:88d:ba89:183e with SMTP id
 k11-20020a1709065fcb00b0088dba89183emr11114987ejv.15.1676033251145; 
 Fri, 10 Feb 2023 04:47:31 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 h24-20020a170906829800b008aa0305dbe8sm2288291ejx.80.2023.02.10.04.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 04:47:30 -0800 (PST)
Message-ID: <b870aa81-d392-127d-c5f0-7e327e170536@redhat.com>
Date: Fri, 10 Feb 2023 13:47:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Nouveau] [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi
 interfaces
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
 <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
 <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
 <a214b28b-043c-a8bb-69da-b4d8216fce56@amd.com>
 <3a76bfa9-8ee5-a7d9-b9fb-a98181baec0b@redhat.com>
 <49ac3f95-6eda-9009-4b28-0167213301b2@amd.com>
 <bc523c5c-efe6-1a7f-b49a-e0867dc1413d@redhat.com>
 <15fb0179-c7c5-8a64-ed08-841189919f5e@redhat.com>
 <1840e9fb-fd1b-79b7-4238-54ae97333d0b@amd.com>
 <CAPM=9txON8VCb3H7vDY_DOgtUg2Ad3mBvYVxgSMyZ1noOu-rBQ@mail.gmail.com>
 <a1c526e0-0df7-12cb-c5a1-06e9cd0d876b@amd.com>
 <3f935a7e-fede-2bad-c029-4a3af850c9b5@redhat.com>
 <95d0631b-545c-ea4d-7439-75422e9a9120@amd.com>
 <67958920-c5bb-a0f5-2306-e3ae4fdbaeb3@redhat.com>
 <c0635ff3-027f-bcd7-afbc-46f4e62d3651@amd.com>
 <4439c44b-cbd0-7160-da3d-e78f6aeeec77@redhat.com>
 <85548cd2-1bea-3c04-40b9-9abb03cb57b3@amd.com>
 <69e87e6a-7e6a-7b8d-c877-739be9cba0a1@redhat.com>
 <28eeb2f9-76e5-2a74-8adb-183f00900da1@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <28eeb2f9-76e5-2a74-8adb-183f00900da1@amd.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, jason@jlekstrand.net,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/10/23 12:50, Christian König wrote:
> 
> 
> Am 07.02.23 um 11:50 schrieb Danilo Krummrich:
>> On 2/7/23 10:35, Christian König wrote:

<snip>

>> However, I still don't see why we would want to merge over buffer 
>> boundaries, because ultimately we'll end up splitting such a merged 
>> mapping later on anyway once one of the buffers is destroyed.
> 
> Well the key point is all approaches have some pros and cons.
> 
> If we merge and decide to only do that inside certain boundaries then 
> those boundaries needs to be provided and checked against. This burns 
> quite some CPU cycles
> 
> If we just merge what we can we might have extra page table updates 
> which cost time and could result in undesired side effects.
> 
> If we don't merge at all we have additional housekeeping for the 
> mappings and maybe hw restrictions.

Absolutely agree, hence I think it would be beneficial to leave the 
decision to the driver which approach to pick.

For instance, if a driver needs to keep track of these bounds anyway 
because it needs to track separate page tables for sparse regions, there 
is no additional overhead, but the nice effect of being able not avoid 
unnecessary merges and subsequent splits.

> 
>> Also, as explained in one of the previous mails in nouveau we can have 
>> separate PTs for sparse mappings with large page sizes and separate 
>> PTs for memory backed mappings with smaller page sizes overlaying 
>> them. Hence, I need to track a single sparse mapping per buffer 
>> spanning the whole buffer (which I do with a region) and the actual 
>> memory backed mappings within the same range.
>>
>> Now, this might or might not be unique for Nvidia hardware. If nouveau 
>> would be the only potential user, plus we don't care about potentially 
>> merging mappings over buffer boundaries and hence producing 
>> foreseeable splits of those merged mappings, we could get rid of 
>> regions entirely.
> 
> This sounds similar to what AMD hw used to have up until gfx8 (I think), 
> basically sparse resources where defined through a separate mechanism to 
> the address resolution of the page tables. I won't rule out that other 
> hardware has similar approaches.
> 
> On the other hand when you have separate page tables for address 
> translation and sparse handling then why not instantiate two separate VM 
> manager instances for them?

As mentioned above, for some drivers there could be a synergy between 
keeping track of those separate page tables and using these boundaries 
for merge decisions.

Also, having a separate manager instance would lead to have less 
lightweight nodes for sparse regions, since we'd also carry the fields 
needed for memory backed mappings. Furthermore there wouldn't be a 
"generic relationship" between the nodes of the two separate manager 
instances, like a mapping node has a pointer to the region it resides 
in. This may be useful to e.g. do some sanity checks, unmap all mappings 
of a given region, etc.

Of course drivers could code this relationship within the driver 
specific structures around the mapping nodes, but I think it would be 
nice to generalize that and have this built-in.

> 
> Regards,
> Christian.
> 
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>
>>>>
>>>>>
>>>>> So you need to be able to handle this case anyway and the approach 
>>>>> with the regions won't help you at all preventing that.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>
>>>
>>
> 

