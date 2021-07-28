Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33AB3D8C90
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 13:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46EFC6E956;
	Wed, 28 Jul 2021 11:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221866E956
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 11:19:01 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id k4so1153354wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 04:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=IPXR/Gq0Cne9Lo1phqSGvzNhSd4KyAmKoziMCoEDt6o=;
 b=WhNqdBPsgH7aZMXP5nm1vsX6OVgFUmM7uIDGzpuAW9KXY6vzpvZQ8F69ybUlCBxYay
 CbJ96BVv1XvNJ1EZgSmMFZnGJoz50IbMrI//inokkcni3qLKWBTUdhXhw0k590l5jMI7
 AlSuVMi9Hso+NeBGoOkaVX8c3aWmh9+wSx/OE19S6TWbVVBGoe65+oMnhRqQnJ9wM96a
 PYYhyi/IYG59DYLie3diID9bP07NFt9rnuC6f+zlQ+Sl47bdZRqs6zVFSjcWwjwR7yfT
 jcv4hu2C0a9Pg8AI6KYOyQaGREUW6AjbV358Zal3nqD1Hlt/wAcRQmUj4WUAp6wHO9FF
 lEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=IPXR/Gq0Cne9Lo1phqSGvzNhSd4KyAmKoziMCoEDt6o=;
 b=iS6UZ552zMVR0FqthlGPz1vsM2bVVXLjaOs9YFgqQQFLnHjgn5VRQVtP8O/Kx5uoqC
 XD0KgrxRGGeI0QQmKj3t8Qk5XEUPF2IDloqLLhjquPFyEyUiC6x7xeqVbXcPX/Utiw8X
 7JdcKOWO+/9nE9tVAU3olbVP6tRUNX7nU+TqIxFtaOA4pT5nBZqACSWeXZ0OvOUm2QBf
 dc3HmMPLj30lKmcNtCkl3aknmW/ofYEN93yGkes13crkgsVO+NE8M6AAPcmy7mHudb1K
 XCRjnp8fNKYSMbW74Yp8nOx/3gDk4lXe8EmMkS8LmCXozno/eR/+P8ISZE9+zx1rYM9s
 IfRw==
X-Gm-Message-State: AOAM533aCDvxX0EdvkdJvZC1G6MdVjZsduG/A/ynLgjJkxBoCOOuAf3o
 5vIq7p5D6ksx0StEuy/a+3t/ujPfDXE=
X-Google-Smtp-Source: ABdhPJzdks1jqJVmnbzKNEXVcRqP2n4a7ZJnIWnPt9i+2MbKTsohhhD0qsTlPastHtm3bVrgoyr8nA==
X-Received: by 2002:a05:600c:3795:: with SMTP id
 o21mr12903223wmr.90.1627471140456; 
 Wed, 28 Jul 2021 04:19:00 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:6a5d:b580:2891:cbac?
 ([2a02:908:1252:fb60:6a5d:b580:2891:cbac])
 by smtp.gmail.com with ESMTPSA id i186sm1308866wmi.43.2021.07.28.04.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 04:18:59 -0700 (PDT)
Subject: Re: [PATCH 1/5] drm/vmwgfx: unbind in vmw_ttm_unpopulate
To: Dave Airlie <airlied@gmail.com>
References: <20210722124127.17901-1-christian.koenig@amd.com>
 <YPqCBUDiibBWUs2/@phenom.ffwll.local>
 <c83ebc42-567c-4f4c-d6da-53ff21739222@gmail.com>
 <CAKMK7uGVPnsw2o=9E295CobiY_qYdCg5fZQN4Q8Bu22r9E3WUw@mail.gmail.com>
 <4c30a961-0a73-3f69-7733-2491549a8743@gmail.com>
 <CAPM=9txffDPERe_iZ2obsekJcbjfph32bca-18ROCJqEPByQWg@mail.gmail.com>
 <1dd69d33-4b58-e3dd-5598-ed78f2a18ef5@gmail.com>
 <CAPM=9twfAQV60+vmn3WdiS6o4C7GajWS7_a0wLDo6zyBw_kBsA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2269b59d-dac2-e74c-d53f-904e90eeb1c6@gmail.com>
Date: Wed, 28 Jul 2021 13:18:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPM=9twfAQV60+vmn3WdiS6o4C7GajWS7_a0wLDo6zyBw_kBsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.07.21 um 22:03 schrieb Dave Airlie:
> On Tue, 27 Jul 2021 at 05:35, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 26.07.21 um 02:03 schrieb Dave Airlie:
>>> [SNIP]
>>>> But you know, normal human: Only equipped with one head and two hands
>>>> and not cloneable.
>>> I'm the same, but I'm not seeing where this problem happens at all, do
>>> we have any backtraces or demos for this?
>> I've stumbled over this while working on some patches which accidentally
>> broke delayed delete and caused random memory corruption and was
>> wondering how that even happened in the first place.
>>
>> Having stale PTEs in the GART isn't a problem unless you break other
>> things. Which is also the reason why I haven't added a CC stable yet.
>>
>>> I split bind/unbind into the driver, but the driver should still
>>> always be moving things to unbound states before an unpopulate is
>>> called, is there a driver doing something unexpected here?
>> Possible, I was only testing with amdgpu and the GART handling is rather
>> special there (which was one of the reasons why we did that in the first
>> place).
>>
>>> at worst I'd like to see a WARN_ON put in first and a test in igt that
>>> triggers it, because right now I'm not see that path through the
>>> drivers/ttm that leads to unpopulated pages ending up happening while
>>> bound.
>>>
>>>   From 5.14-rc3 unpopulate is called from ttm_bo_pipeline_gutting in
>>> non-ghost path and there is no unbind,
>>> pipeline gutting is called from evict/validate, when there is no
>>> placement suggested for the object, is this case getting hit somewhere
>>> without the driver having previously unbound things?
>> Yes, that will hit absolutely. Most likely with VM page tables for
>> amdgpu which uses this.
> My thing is here we moved binding/unbinding to the driver, if the
> driver has a bug
> I'd expect the fix to be in the driver side here. I think giving
> drivers control over something
> and enforcing it in the core/helpers is fine, but I don't think we
> should be adding back
> the midlayering.

Ok, then we are pretty much already on the same page here.

I've just reverted the patch because I thought it would be cleaner for 
eventually backporting it.



>
>>> ttm_tt_destroy_common: calls unpopulate, everyone calls this directly
>>> after unbinding
>>> ttm_tt_swapout: calls unpopulate, we don't swapout objects from TT
>>> directly, we should always unbind first, this used to have an assert
>>> against that,
>>> ttm_tt_populate: call unpopulate in failure path
>> unbinding was moved into the driver, so ttm_tt_swapout() won't unbind
>> anything before calling unpopulate as far as I can see.
> But we won't call swapout on BOs that aren't in SYSTEM and to be in SYSTEM,
> the bo would have to go through the driver move function which will unbind it.

Ah, good point.

>
>>> So any place I can see unpopulate getting called with a bound TT
>>> should be a bug, and fixed, we could protect against it better but I'm
>>> not seeing the need for this series to outright revert things back as
>>> helping.
>> I'm not reverting this because it is offhand wrong, but making sure the
>> GART is clear before unpopulating the TT object sounds like the much
>> more natural thing to do and the state machine is something I certainly
>> don't see in the backend.
>>
> I don't think that's the core's responsibility anymore, I'm fine with
> adding code and
> even an flag that says if the the TT is bound/unbound that unpopulate
> can WARN_ON()
> against so we get a backtrace and track down where something is
> getting unpopulated
> without going through the driver move function to be unbound.

I was not talking about bound/unbound, but rather unpopulating before 
destroying.

The requirement we have is that the tt object is unpopulated before it 
is destroyed and the state machine of that object is essentially 
controlled by its BO and not the object itself.

I will prepare a patch making that cleaner.

Thanks,
Christian.

>
> Dave.

