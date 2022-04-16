Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B4D50383E
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 22:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D8810E03C;
	Sat, 16 Apr 2022 20:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E8A10E03C
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 20:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650142105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oWxIUT+rH8PESyeqg6StkvsoyVPPRKkMATCJ7S1FFtE=;
 b=MfaJrEY8Axiw8xg0m6r0K7u53yO9iDXYl42E1sfSTWQUQCMTevPTUJw+OqJl101LC88SYY
 0hJnnGd39RmGOs4C/LfqQm+jSI7jITg+Ik8AcIuf6KHOu9HyRlS/RorWT3odw7ut/8rvYU
 mzfvmfzKjlYQjLscd6pCmkBYoIvdl0w=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-I9-kKSCYOJu-HzQMUog-Bw-1; Sat, 16 Apr 2022 16:48:19 -0400
X-MC-Unique: I9-kKSCYOJu-HzQMUog-Bw-1
Received: by mail-qv1-f69.google.com with SMTP id
 z12-20020a0ce60c000000b0044632eb79b3so4768449qvm.7
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 13:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=oWxIUT+rH8PESyeqg6StkvsoyVPPRKkMATCJ7S1FFtE=;
 b=xWfBo7V7bX63qbNumjJ/aC5x/Ki+WTmCe7gJ9cOApXAbPH/ASnwmpaL10YW9N3/sOE
 aMvQa//SZp64XK/ujh3hCIiSwU91XvExI+jx26vuj+4yMu/GbfnIkEPg2PJLPlp3G0b/
 s69smEjIF/sI2hiHiVaKKYc0/YQ/8EtlsRj5BDXTktQ2fchxjqPLbzRZFEWboak1t0YO
 IYFj4t+CWtpTy/Lmomde2I1kqWTpXpzvqb0fFQHpQPSL7OsLWyQ4cMeAQUINuaDlmic2
 C0OHjUXgksD7M33B9QfjZQGYZxh4p3GzS4SvUEuvdkxLA7dd31gtFob72WqlMc5WI9wY
 TKqw==
X-Gm-Message-State: AOAM530FikNXkL69FeEItKQ42T/IN8nOLtSX5IuIMBTxVnRdb8m8yEKv
 PRg3OkaZageLsbI2Pk61xehegoCrBA/eRKPquEe4liGPXfJoboL9D8YrI5a2F5RWkwVrvzz3Yv9
 FEcer//WLUaROpnUdhWLwa1rGujQb
X-Received: by 2002:a05:622a:1e85:b0:2f1:129b:99aa with SMTP id
 bz5-20020a05622a1e8500b002f1129b99aamr2993994qtb.339.1650142099372; 
 Sat, 16 Apr 2022 13:48:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwt9KSKQzCO3SL1g6pRUSCiJkWiil0JhaE1lYAF2MNELSIbppyoFZIcehwE0xIBZs8EGr4V4Q==
X-Received: by 2002:a05:622a:1e85:b0:2f1:129b:99aa with SMTP id
 bz5-20020a05622a1e8500b002f1129b99aamr2993979qtb.339.1650142099159; 
 Sat, 16 Apr 2022 13:48:19 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 y25-20020a05620a09d900b0069e82fb9310sm619703qky.15.2022.04.16.13.48.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Apr 2022 13:48:18 -0700 (PDT)
Subject: Re: [PATCH] drm/i915: change node clearing from memset to
 initialization
To: Joe Perches <joe@perches.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220416172325.1039795-1-trix@redhat.com>
 <26839195c315eebcd1148d2a3de6a0df9e42dd1c.camel@perches.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <7973fecf-4e51-3ec8-b626-2581e3ad2f26@redhat.com>
Date: Sat, 16 Apr 2022 13:48:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <26839195c315eebcd1148d2a3de6a0df9e42dd1c.camel@perches.com>
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


On 4/16/22 11:33 AM, Joe Perches wrote:
> On Sat, 2022-04-16 at 13:23 -0400, Tom Rix wrote:
>> In insert_mappable_node(), the parameter node is
>> cleared late in node's use with memset.
>> insert_mappable_node() is a singleton, called only
>> from i915_gem_gtt_prepare() which itself is only
>> called by i915_gem_gtt_pread() and
>> i915_gem_gtt_pwrite_fast() where the definition of
>> node originates.
>>
>> Instead of using memset, initialize node to 0 at it's
>> definitions.
> trivia: /it's/its/
>
> Only reason _not_ to do this is memset is guaranteed to
> zero any padding that might go to userspace.
>
> But it doesn't seem there is any padding anyway nor is
> the struct available to userspace.
>
> So this seems fine though it might increase overall code
> size a tiny bit.
>
> I do have a caveat: see below:
>
>> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> []
>> @@ -328,7 +327,6 @@ static struct i915_vma *i915_gem_gtt_prepare(struct drm_i915_gem_object *obj,
>>   		goto err_ww;
>>   	} else if (!IS_ERR(vma)) {
>>   		node->start = i915_ggtt_offset(vma);
>> -		node->flags = 0;
> Why is this unneeded?

node = {} initializes all of node's elements to 0, including this one.

Tom

>
> from: drm_mm_insert_node_in_range which can set node->flags
>
> 		__set_bit(DRM_MM_NODE_ALLOCATED_BIT, &node->flags);
>
>

