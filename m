Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1F946CF3C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 09:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CCC6E471;
	Wed,  8 Dec 2021 08:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8936E471;
 Wed,  8 Dec 2021 08:39:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236524974"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="236524974"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 00:39:49 -0800
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="479829474"
Received: from sbogar-mobl2.ger.corp.intel.com (HELO [10.249.254.43])
 ([10.249.254.43])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 00:39:47 -0800
Message-ID: <508f76bc-4afc-4029-fc8a-eb8bb464a973@linux.intel.com>
Date: Wed, 8 Dec 2021 09:39:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH v9 2/8] drm/i915/ttm: add tt shmem backend
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20211018091055.1998191-1-matthew.auld@intel.com>
 <20211018091055.1998191-2-matthew.auld@intel.com>
 <1a8431eb-566d-ac2b-85b7-31c590ec84ff@linux.intel.com>
 <52fadb30-bdc2-6432-931b-ef1bbf3be0ba@intel.com>
 <64b203a7-b09f-2982-ef3b-b33da7708d0f@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <64b203a7-b09f-2982-ef3b-b33da7708d0f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Oak Zeng <oak.zeng@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/8/21 09:30, Tvrtko Ursulin wrote:


...


>>> Apart from the code organisation questions, on the practical level - 
>>> do you need writeback from the TTM backend or while I am proposing 
>>> to remove it from the "legacy" paths, I can propose removing it from 
>>> the TTM flow as well?
>>
>> Yeah, if that is somehow busted then we should remove from TTM 
>> backend also.
>
> Okay thanks, I wanted to check in case there was an extra need in TTM. 
> I will float a patch soon hopefully but testing will be a problem 
> since it seems very hard to repro at the moment.

Do we have some information about what's causing the deadlock or a 
signature? I'm asking because if some sort of shrinker was added to TTM 
itself, for the TTM page vectors, it would need to allocate shmem pages 
at shrink time rather than to unpin them at shrink time as we do here. 
And for that to have any chance of working sort of reliably, I think 
writeback is needed.

But I agree for this implementation, the need for writeback isn't 
different than for the non-TTM shmem objects

Thanks,

Thomas


>
> Regards,
>
> Tvrtko

