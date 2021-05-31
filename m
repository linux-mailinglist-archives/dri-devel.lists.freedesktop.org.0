Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2258F395799
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 10:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C559F6E88E;
	Mon, 31 May 2021 08:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C9C6E88E
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 08:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 159DC3F81F;
 Mon, 31 May 2021 10:56:25 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="QAD1Fwmd";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DZMSWBhxE-3a; Mon, 31 May 2021 10:56:23 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 64B1B3F6BE;
 Mon, 31 May 2021 10:56:23 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id D6EE73600E5;
 Mon, 31 May 2021 10:56:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1622451382; bh=ZyjN2WjRXZGywvgYky29yAxkgeipqslP6W3dwl/jP9A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QAD1FwmdTbk2XaKWEr5IOydobKMqfnd6HBg5ftS+/Z9gZtLcgQTtXxD9aKlIdbdas
 MDGG7HQl5U3QV00LZvYytZKknD2ypRhFRlx4ia7XzvNSCU17tjXux+rF6IJJ1Ot/rv
 52XxRv89vxBu3M4vQEPuZLfG1W1fYssYHt5I3E5Y=
Subject: Re: [PATCH 06/13] drm/ttm: flip over the range manager to self
 allocated nodes
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210430092508.60710-1-christian.koenig@amd.com>
 <20210430092508.60710-6-christian.koenig@amd.com>
 <f792308b-389d-67da-0cf8-667c1e6ac96d@shipmail.org>
 <7b4129a9-7e12-a3ac-f456-0c18b01a174c@gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <416de9a8-f169-7195-f247-0cce27e3c507@shipmail.org>
Date: Mon, 31 May 2021 10:56:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <7b4129a9-7e12-a3ac-f456-0c18b01a174c@gmail.com>
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


On 5/30/21 6:51 PM, Christian König wrote:
> Hi Thomas,
>
> Am 29.05.21 um 17:48 schrieb Thomas Hellström (Intel):
>> Hi, Christian,
>>
>> On 4/30/21 11:25 AM, Christian König wrote:
>>> Start with the range manager to make the resource object the base
>>> class for the allocated nodes.
>>>
>>> While at it cleanup a lot of the code around that.
>>
>> Could you briefly describe the design thoughts around this. While 
>> it's clear to me that we want separately allocated struct 
>> ttm_resource objects, it's not clear why the visibility of those are 
>> pushed down the interfaces to the range managers?
>
> Why do you think the visibility is pushed to the range manger?
>
>>
>> In addition to the need for a separately allocated struct 
>> ttm_resource, when looking at TTM-ify i915 I've come across a couple 
>> of problems.
>>
>> 1) People have started abusing the range manager interface to attach 
>> device private data to the mm_node, or probably really to the struct 
>> ttm_resource. That makes it very unclear what the input needed for 
>> the managers really are. For examle what members of the bo does the 
>> range manager really use and why? Same for the struct ttm_resource. I 
>> think in a perfect world, the interface to these range managers 
>> should be a struct ttm_placement as input and as output an opaque mm 
>> node and perhaps a way to convert that mm node to something useful 
>> like a range or a scatter-gather table.
>
> Well I don't see that as an abuse. The backend allocation are 
> completely driver specific and the range manager is just implementing 
> some common ground for drm_mm based backends.
>
>>
>> 2) But that doesn't really address the problem of drivers wanting to 
>> attach device private data to a struct ttm_resource, which at some 
>> point caused someone to add a bo to the manager interface. The 
>> novueau driver attaches a "kind" member to the mm node that it pulls 
>> out of the bo; The i915 driver would want to cache an st table and a 
>> radix tree to cache index-to-pfn maps.
>
> Driver specific backends should inherit either from the range manager 
> when they want to implement a drm_mm based backend or from 
> ttm_resource directly.

Hmm, OK so in our case a driver that needs a driver-specific struct 
ttm_resource, but still wants to be able to allocate either from drm_mm 
or from the buddy would then either have to re-implement the TTM drm_mm 
allocator or live with a pretty awkward construct?

struct i915_ttm_resource {
     union {
         struct ttm_resource res;
         struct ttm_range_mgr_node range_node; // Let's hope the struct 
ttm_resource remains the first member.
         struct i915_buddy_node buddy_node;
     };
     struct i915_private_stuff common_for_all_backends;
};

/Thomas



