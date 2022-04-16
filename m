Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C015045A9
	for <lists+dri-devel@lfdr.de>; Sun, 17 Apr 2022 00:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A3910E25D;
	Sat, 16 Apr 2022 22:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6123910E25D
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 22:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650147925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rAHldDuMtrwN53CF2WYzds8qp7tRtwJj5+xsN53tnj0=;
 b=UbeB9iQw6QiRiJRGjA3hjqFqYzcy/gTFTQ36mOjYfCguxI3QNpmtlzZWVSZgb2e49TWEn/
 BuewYIAXMRb/O0NapW73jYG1gUC9NH/Xaiy1ECbT4FTzuWaeBcApK6JDZD5eVX8NYKqv32
 41LzuEf8AWQUBD3kYAq0i2ChGG+EPvk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-35XjJo72MJanoBQs4HjG6A-1; Sat, 16 Apr 2022 18:25:24 -0400
X-MC-Unique: 35XjJo72MJanoBQs4HjG6A-1
Received: by mail-qv1-f69.google.com with SMTP id
 gh5-20020a05621429c500b004443be8db85so9303091qvb.11
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 15:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rAHldDuMtrwN53CF2WYzds8qp7tRtwJj5+xsN53tnj0=;
 b=V5NTcz4ycXibmXAULojV7EsCp300NR5p4rX84pHQR7Pfrk4XsO7IScLcpNKAMwAFaQ
 mZmbam+KYPTRAu7yomB6om/od+7jYihJ38aWbyucMc7VdtWCPvbtrdU5KaoVMUVr6P0L
 Ddtgho6hxfDUknMJKAVfecjNm9xB94ptlPVaPSxl30mtBHtDjFaXL7S+tanFmxOVEm0l
 pkdDgoSGW+WYG8Ch8qt+YaQfgELFCsOlYeLrDpVUSeCeezC6JID6JzX/Sphk6M5akBIx
 fQ3SqnlKOtJv+kXgiBcuj9Ujc7/aFGVOqlvB/ExSGJg8XDmm58Koojh+2ffHWJATbIpR
 UErA==
X-Gm-Message-State: AOAM531v0bckrYazX4Rm2vJCdoOqbh19A7fZU2w11AdEJVJj+FALrdSa
 RAuM0hQY/Rz16RYlHC5bzI/ZIZ0d+/hgHZf1QtNfQ2z1jD7W06zeUDbFOW3w7x36lj5T4KztQSW
 Jtn53JZGaQPhZ4Bv3XmOhqwHfNPkV
X-Received: by 2002:a05:620a:2585:b0:680:f1f5:23ac with SMTP id
 x5-20020a05620a258500b00680f1f523acmr2919883qko.656.1650147923855; 
 Sat, 16 Apr 2022 15:25:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi81NuV1kGhitJKFFnawv59JqWzpTvRdIhVgpGW8vegAAaWegsx91tx2nF0D8cXb1IBOuR4Q==
X-Received: by 2002:a05:620a:2585:b0:680:f1f5:23ac with SMTP id
 x5-20020a05620a258500b00680f1f523acmr2919875qko.656.1650147923662; 
 Sat, 16 Apr 2022 15:25:23 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 w6-20020a05622a190600b002f1f91ad3e7sm842259qtc.22.2022.04.16.15.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Apr 2022 15:25:23 -0700 (PDT)
Subject: Re: [PATCH] drm/i915: change node clearing from memset to
 initialization
To: Joe Perches <joe@perches.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220416172325.1039795-1-trix@redhat.com>
 <26839195c315eebcd1148d2a3de6a0df9e42dd1c.camel@perches.com>
 <7973fecf-4e51-3ec8-b626-2581e3ad2f26@redhat.com>
 <715d6dbd696a9dad2690772d175d2ab497e0c316.camel@perches.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <d0f293a4-18fc-4c82-8dfc-286c4913948b@redhat.com>
Date: Sat, 16 Apr 2022 15:25:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <715d6dbd696a9dad2690772d175d2ab497e0c316.camel@perches.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/16/22 2:04 PM, Joe Perches wrote:
> On Sat, 2022-04-16 at 13:48 -0700, Tom Rix wrote:
>> On 4/16/22 11:33 AM, Joe Perches wrote:
>>> On Sat, 2022-04-16 at 13:23 -0400, Tom Rix wrote:
>>>> In insert_mappable_node(), the parameter node is
>>>> cleared late in node's use with memset.
>>>> insert_mappable_node() is a singleton, called only
>>>> from i915_gem_gtt_prepare() which itself is only
>>>> called by i915_gem_gtt_pread() and
>>>> i915_gem_gtt_pwrite_fast() where the definition of
>>>> node originates.
>>>>
>>>> Instead of using memset, initialize node to 0 at it's
>>>> definitions.
>>> trivia: /it's/its/
>>>
>>> Only reason _not_ to do this is memset is guaranteed to
>>> zero any padding that might go to userspace.
>>>
>>> But it doesn't seem there is any padding anyway nor is
>>> the struct available to userspace.
>>>
>>> So this seems fine though it might increase overall code
>>> size a tiny bit.
>>>
>>> I do have a caveat: see below:
>>>
>>>> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
>>> []
>>>> @@ -328,7 +327,6 @@ static struct i915_vma *i915_gem_gtt_prepare(struct drm_i915_gem_object *obj,
>>>>    		goto err_ww;
>>>>    	} else if (!IS_ERR(vma)) {
>>>>    		node->start = i915_ggtt_offset(vma);
>>>> -		node->flags = 0;
>>> Why is this unneeded?
>> node = {} initializes all of node's elements to 0, including this one.
> true, but could the call to insert_mappable_node combined with the
> retry goto in i915_gem_gtt_prepare set this to non-zero?

Yikes!

I'll add that back.

Thanks for pointing it out.

Tom

>
>

