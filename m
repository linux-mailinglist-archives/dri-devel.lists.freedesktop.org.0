Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DA7762707
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 00:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD34410E1B8;
	Tue, 25 Jul 2023 22:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929FF10E1B8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 22:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690325329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fqtwPYmHGNsoP1pFuN8jF45AEQfTNG8g69I653X2PAs=;
 b=AVCI5s8nJEPccZvWl2kUi0C6MZhCVKVzUUXfUYBVEjdv6nqqj4fc2xtLowpLqTSUwinoGf
 csKYdrYYfzeBzAdRrWROmzYq4ylclirBPAxtqdFeSfppVY2TF3J9JWvEuhrCKSmNcGVIF5
 9a3MheHFhbpLJE47RcBNqsML3l+X3uA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-1ujoiEB_NBq2mahJJDd5Gg-1; Tue, 25 Jul 2023 18:48:46 -0400
X-MC-Unique: 1ujoiEB_NBq2mahJJDd5Gg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-997d144f31dso350987966b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 15:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690325325; x=1690930125;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fqtwPYmHGNsoP1pFuN8jF45AEQfTNG8g69I653X2PAs=;
 b=M0QnaF8LV4BmPB/AXAtFIe/tkZ05iGaDU966jCrPETzKL3W2e4FoAD6hlT7a3H/ygz
 VbH5uNK+DVLre0zmcrmUP+jFr6GohfhKcf43pN6zZoJoh5wRqra59I950irWdd6ng4Nl
 RDxuBHm/d/KoRBSu98SWGz2HRQNjsje5073wXPofOXe6PjjIOt2Mjg3AydS6U/+V2Is1
 H7qzcALrFHfyb4HdXx8uqjVimpAMfOWii10HS8nA2ctMrWouF0Vy0TJP9EUlo+kzNMAJ
 0Rdn+pWgwzpSekmfDfpH3qr0f/H8cA3onr6IrO+EuOyODLzA7fUAy+7iYuy0JVtC6Kzo
 FYtQ==
X-Gm-Message-State: ABy/qLbbgQ9r5rt2cUUSVPCVdod6xLkpFOMNzxCNOw7V7q2lDHlHC8sf
 O0vwzKadTH5Rfyjk7wmrppUYsY/LK16WvSxsFCLZkjTYPrW3nCyVksEtTAAbcc9SjPJns4Qy3PP
 XFPK9Z7H3ZeYAY5tMNmwGp4KsV3A+
X-Received: by 2002:a17:907:2be9:b0:982:7545:efb6 with SMTP id
 gv41-20020a1709072be900b009827545efb6mr158274ejc.66.1690325324931; 
 Tue, 25 Jul 2023 15:48:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFjV59E7oAEbgLcfuvqGzUWbSIkW/kHUTr3BMaofJ0Plmev7uMfuohC5/16L7eW3+4p7WZnVA==
X-Received: by 2002:a17:907:2be9:b0:982:7545:efb6 with SMTP id
 gv41-20020a1709072be900b009827545efb6mr158266ejc.66.1690325324597; 
 Tue, 25 Jul 2023 15:48:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 lg23-20020a170906f89700b0098733a40bb7sm8814043ejb.155.2023.07.25.15.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jul 2023 15:48:44 -0700 (PDT)
Message-ID: <21ea63fe-33d7-a075-7291-35dd1b2a9b64@redhat.com>
Date: Tue, 25 Jul 2023 23:00:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH drm-misc-next v8 11/12] drm/nouveau: implement new VM_BIND
 uAPI
From: Danilo Krummrich <dakr@redhat.com>
To: Faith Ekstrand <faith@gfxstrand.net>
References: <20230720001443.2380-1-dakr@redhat.com>
 <20230720001443.2380-12-dakr@redhat.com>
 <CAOFGe945tp344=g-++=EAT89t0qJHZ=3yeW-k9OTbGNJodvwAg@mail.gmail.com>
 <542203c6-781a-dc44-6fa1-13cd20ab9e21@redhat.com>
 <CAOFGe94sG5==GM+spcTihcAtMCoj2xZYpN8NsYE6CEckdHJ8rQ@mail.gmail.com>
 <75c86224-6183-07fe-da04-6a2101615a50@redhat.com>
Organization: RedHat
In-Reply-To: <75c86224-6183-07fe-da04-6a2101615a50@redhat.com>
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 tzimmermann@suse.de, Liam.Howlett@oracle.com, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/25/23 18:43, Danilo Krummrich wrote:
> On 7/25/23 18:16, Faith Ekstrand wrote:
>> Thanks for the detailed write-up! That would definitely explain it. If 
>> I remember, I'll try to do a single-threaded run or two. If your 
>> theory is correct, there should be no real perf difference when 
>> running single-threaded. Those runs will take a long time, though, so 
>> I'll have to run them over night. I'll let you know in a few days once 
>> I have the results.
> 
> I can also push a separate branch where I just print out a warning 
> whenever we run into such a condition including the time we were waiting 
> for things to complete. I can probably push something later today.

https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next-track-stalls

It prints out the duration of every wait as well as the total wait time 
since boot.

- Danilo

> 
>>
>> If this theory holds, then I'm not concerned about the performance of 
>> the API itself. It would still be good to see if we can find a way to 
>> reduce the cross-process drag in the implementation but that's a perf 
>> optimization we can do later.
> 
>  From the kernel side I think the only thing we could really do is to 
> temporarily run a secondary drm_gpu_scheduler instance, one for VM_BINDs 
> and one for EXECs until we got the new page table handling in place.
> 
> However, the UMD could avoid such conditions more effectively, since it 
> controls the address space. Namely, avoid re-using the same region of 
> the address space right away in certain cases. For instance, instead of 
> replacing a sparse region A[0x0, 0x4000000] with a larger sparse region 
> B[0x0, 0x8000000], replace it with B'[0x4000000, 0xC000000] if possible.
> 
> However, just mentioning this for completeness. The UMD surely shouldn't 
> probably even temporarily work around such a kernel limitation.
> 
> Anyway, before doing any of those, let's see if the theory holds and 
> we're actually running into such cases.
> 
>>
>> Does it actually matter? Yes, it kinda does. No, it probably doesn't 
>> matter for games because you're typically only running one game at a 
>> time. From a development PoV, however, if it makes CI take longer then 
>> that slows down development and that's not good for the users, either.
> 
> Fully agree.
> 
> - Danilo
> 
>>
>> ~Faith
>>
>>     - Danilo
>>
>>      >
>>      > ~Faith
>>      >
>>

