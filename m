Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C431639522E
	for <lists+dri-devel@lfdr.de>; Sun, 30 May 2021 18:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EB96E255;
	Sun, 30 May 2021 16:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399186E409
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 16:51:50 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id s6so10648803edu.10
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 09:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=WzR+5Zoohr9K2QO6t/N/KtkomxCSSF0qfRQQde2vIeU=;
 b=MNbjInUkeFw8ntj1Mz19LkiMrtwDraJBk9gUBrm7OijUKwlJ3c8ti3qARHbrk4SHJH
 dK31QlmQ8iOteWb16j+xPfBnHDsWrhCJoUZLBQaoRAkdoLDYE4msSslUPFlJDIcJWsJD
 TetCLR5WikQwFTBEE/p/imEyz6lv0Uzw6p7XxNqQChQZwQFBGjWsQRCoz0lE1jv2HWiB
 BspJxSSRqBCCK0HLuvlA0whELq7uwaFCilH2VeHFGKJLLw3giqKw+5fLiGPnIt3Jb8yS
 cAGD2Q7Qvk+RvFWz0OMBKlTrvmOT3amoZKd9JRcC2x5p9cUSr+08KhG8HzJBIP2jisqj
 D7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WzR+5Zoohr9K2QO6t/N/KtkomxCSSF0qfRQQde2vIeU=;
 b=DlSesiiC/XIpNbVPIzRqgKiuZCP3d8ys9AsJxl0gXm6wvPigS/0RASINjJcQ6mIVjk
 grgutrwOSuUW7iaJqjV1il9uYBUYs8KaO0RLyvpDh0W3UCQ0ShnkPibt4ucziNas9Tr7
 6tmYvJaZj4yHOHqLeb1MJJe+Uc88VGEbtL6w5Gop8EE8xE58KEDw5ot34A7+diYNVAeZ
 3IHEoeM3TQ9ovXXjyveBz08gDoFGQvoQ8AW60v6DyI22rffhg06lVeEs8UW1poAO+wRK
 FVb8jscn4Fm8OvUbF4HBmSgHd6Op8p6PYYW6zJXQicQ2R658BR+9M69CQi5yYrmrcNKc
 zoBg==
X-Gm-Message-State: AOAM530YTMZaCEZWFZMgyZdtBAfYVZ77dp49ccrR/+s7/UHysXZbGGV3
 6365mkegY+q6hFF4EuaGXOw=
X-Google-Smtp-Source: ABdhPJzxW3GfgCgFkneQiPKddDalc+HLWGnZVYo/gYRS34svCFUsFYc0ENOzmud/uD5KZ/aLODYAsQ==
X-Received: by 2002:a05:6402:5193:: with SMTP id
 q19mr20941479edd.167.1622393508884; 
 Sun, 30 May 2021 09:51:48 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7459:84a8:a215:bca8?
 ([2a02:908:1252:fb60:7459:84a8:a215:bca8])
 by smtp.gmail.com with ESMTPSA id r17sm5733788edt.33.2021.05.30.09.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 May 2021 09:51:48 -0700 (PDT)
Subject: Re: [PATCH 06/13] drm/ttm: flip over the range manager to self
 allocated nodes
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org
References: <20210430092508.60710-1-christian.koenig@amd.com>
 <20210430092508.60710-6-christian.koenig@amd.com>
 <f792308b-389d-67da-0cf8-667c1e6ac96d@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7b4129a9-7e12-a3ac-f456-0c18b01a174c@gmail.com>
Date: Sun, 30 May 2021 18:51:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f792308b-389d-67da-0cf8-667c1e6ac96d@shipmail.org>
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
Cc: daniel.vetter@ffwll.ch, matthew.william.auld@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Am 29.05.21 um 17:48 schrieb Thomas Hellström (Intel):
> Hi, Christian,
>
> On 4/30/21 11:25 AM, Christian König wrote:
>> Start with the range manager to make the resource object the base
>> class for the allocated nodes.
>>
>> While at it cleanup a lot of the code around that.
>
> Could you briefly describe the design thoughts around this. While it's 
> clear to me that we want separately allocated struct ttm_resource 
> objects, it's not clear why the visibility of those are pushed down 
> the interfaces to the range managers?

Why do you think the visibility is pushed to the range manger?

>
> In addition to the need for a separately allocated struct 
> ttm_resource, when looking at TTM-ify i915 I've come across a couple 
> of problems.
>
> 1) People have started abusing the range manager interface to attach 
> device private data to the mm_node, or probably really to the struct 
> ttm_resource. That makes it very unclear what the input needed for the 
> managers really are. For examle what members of the bo does the range 
> manager really use and why? Same for the struct ttm_resource. I think 
> in a perfect world, the interface to these range managers should be a 
> struct ttm_placement as input and as output an opaque mm node and 
> perhaps a way to convert that mm node to something useful like a range 
> or a scatter-gather table.

Well I don't see that as an abuse. The backend allocation are completely 
driver specific and the range manager is just implementing some common 
ground for drm_mm based backends.

>
> 2) But that doesn't really address the problem of drivers wanting to 
> attach device private data to a struct ttm_resource, which at some 
> point caused someone to add a bo to the manager interface. The novueau 
> driver attaches a "kind" member to the mm node that it pulls out of 
> the bo; The i915 driver would want to cache an st table and a radix 
> tree to cache index-to-pfn maps.

Driver specific backends should inherit either from the range manager 
when they want to implement a drm_mm based backend or from ttm_resource 
directly.

>
> 3) In the end we'd probably want the kmap iterator methods and the 
> various mapping funtions to be methods of the struct ttm_resource.

Yes moving the iterators into that was also my idea.

>
> So basically here
>
> 1) Would help making range managers with various functionality simple 
> to write and share.

I don't think we want that. Instead allocation backends should be driver 
specific and we should just implement some common ground helpers for 
drm_mm based backends in TTM.

> 2) Would help drivers attach private data to a struct ttm_resource 
> without abusing the manager interfaces,

I don't think that this is abusive in the first place. Drivers should 
append resource specific information by inheriting from the ttm_resource 
object.

Regards,
Christian.

> 3) Would help clean up the mapping code.
>
> But at least 2) here would probably mean that we need a driver 
> callback to allocate a struct ttm_resource rather than having the 
> managers allocate them. Drivers can then embed them in private structs 
> if needed.
>
> Or is there a way to achieve these goals or something similar with the 
> approach you are taking here?
>
> Thanks,
>
> Thomas
>
>
>

