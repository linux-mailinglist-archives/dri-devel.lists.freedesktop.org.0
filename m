Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDA67DD241
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE90D10E568;
	Tue, 31 Oct 2023 16:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791EB10E133
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698770378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJqCZxrLTKcwcLAE87Zs5L0NcoxMkUhMyUSeCCjP4ho=;
 b=e8RJvwWETCmvqMLYFNueCelFvSZH1lRK3Wg9IdyI8grJR2A1WZvHROsf67Q07A2Q24JbA+
 WVBPZVJUajhXWcVcgegMx7dGGYkN/WhR0CpQTG9rqPMuRCNi98HttIT2/d719i5IYSBZlF
 oNWxMnNpFFRsdhp7MRGst7hYQMs2ERY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-GU1nuXy7P9anOyqw4moj7g-1; Tue, 31 Oct 2023 12:39:36 -0400
X-MC-Unique: GU1nuXy7P9anOyqw4moj7g-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9ae0601d689so394597266b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 09:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698770375; x=1699375175;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XJqCZxrLTKcwcLAE87Zs5L0NcoxMkUhMyUSeCCjP4ho=;
 b=YJkHobCB/soft5OtiqgJdtpCBJMsIzE/Lea71e8YqLD1XhKzPF+ntpXcB/nBG5SOLY
 3iGxINeaBHAY6ggWx9xfFNP2xuytoOecQk7eUujNPVjw9vptJ6ffvtzCOzXouSJr/L8y
 gzsGs6zTv0tdtONGsT149Nylytd7KiHreKiyrUuWMRAsbVt8hGp5P9JMOqrxFtJwonE4
 UHV/GP3L9UTFgiVeieNP2SBMVvxRbYe7g7xSlHP6ofsinUKjY88H5TR31Xt6gOYb6wy6
 t8x4WdfC7IEROcF3KzerAJmM13rR+byw8N/3fPjucvM4eVlNUE6ItfFvkEzfWp613cFu
 djYg==
X-Gm-Message-State: AOJu0YzFAvVg8z0Aad7cO54ja9SvL3Y4W8/7oa3QhXyqwDQtTCqhStcA
 XAlSX9yjkUETW/O5SdkBBsl57J4Xghx0s88xWwMwm1CDaSZG5Yl3Wl2cfdJBYrZiegIYlhdWO7o
 3i6sI7eEZQWAmRI6ZrGQ92AyjW8Dv
X-Received: by 2002:a17:906:fd8b:b0:9bf:30e8:5bfd with SMTP id
 xa11-20020a170906fd8b00b009bf30e85bfdmr11756711ejb.48.1698770375521; 
 Tue, 31 Oct 2023 09:39:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuyO5pLCHn8pJ83CSPTWoms/T8gldqXUtB/D0/4Zzvxqi9jtHduxrXbKLdaxRhtjX8nVkSdQ==
X-Received: by 2002:a17:906:fd8b:b0:9bf:30e8:5bfd with SMTP id
 xa11-20020a170906fd8b00b009bf30e85bfdmr11756697ejb.48.1698770375172; 
 Tue, 31 Oct 2023 09:39:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 s25-20020a170906bc5900b009b9977867fbsm1230584ejv.109.2023.10.31.09.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 09:39:34 -0700 (PDT)
Message-ID: <980754a3-7f5a-465e-88a9-62a40c82cae8@redhat.com>
Date: Tue, 31 Oct 2023 17:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v7 4/7] drm/gpuvm: add an abstraction for a
 VM / BO combination
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, faith@gfxstrand.net
References: <20231023201659.25332-1-dakr@redhat.com>
 <20231023201659.25332-5-dakr@redhat.com>
 <4a51c1cd9e2435332e033f9426bac8fae1c21c60.camel@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <4a51c1cd9e2435332e033f9426bac8fae1c21c60.camel@linux.intel.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/31/23 12:25, Thomas Hellström wrote:
> On Mon, 2023-10-23 at 22:16 +0200, Danilo Krummrich wrote:
>> Add an abstraction layer between the drm_gpuva mappings of a
>> particular
>> drm_gem_object and this GEM object itself. The abstraction represents
>> a
>> combination of a drm_gem_object and drm_gpuvm. The drm_gem_object
>> holds
>> a list of drm_gpuvm_bo structures (the structure representing this
>> abstraction), while each drm_gpuvm_bo contains list of mappings of
>> this
>> GEM object.
>>
>> This has multiple advantages:
>>
>> 1) We can use the drm_gpuvm_bo structure to attach it to various
>> lists
>>     of the drm_gpuvm. This is useful for tracking external and evicted
>>     objects per VM, which is introduced in subsequent patches.
>>
>> 2) Finding mappings of a certain drm_gem_object mapped in a certain
>>     drm_gpuvm becomes much cheaper.
>>
>> 3) Drivers can derive and extend the structure to easily represent
>>     driver specific states of a BO for a certain GPUVM.
>>
>> The idea of this abstraction was taken from amdgpu, hence the credit
>> for
>> this idea goes to the developers of amdgpu.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_gpuvm.c            | 335 +++++++++++++++++++++--
>> --
>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c |  64 +++--
>>   include/drm/drm_gem.h                  |  32 +--
>>   include/drm/drm_gpuvm.h                | 188 +++++++++++++-
>>   4 files changed, 533 insertions(+), 86 deletions(-)
> 
> That checkpatch.pl error still remains as well.

I guess you refer to:

ERROR: do not use assignment in if condition
#633: FILE: drivers/gpu/drm/nouveau/nouveau_uvmm.c:1165:
+                       if (!(op->gem.obj = obj))

This was an intentional decision, since in this specific case it seems to
be more readable than the alternatives.

However, if we consider this to be a hard rule, which we never ever break,
I'm fine changing it too.

> 
> Thanks,
> Thomas
> 

