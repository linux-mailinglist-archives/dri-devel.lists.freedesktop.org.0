Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F10452B7D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 08:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C694A6EDF3;
	Tue, 16 Nov 2021 07:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04256EDF9;
 Tue, 16 Nov 2021 07:20:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="220525962"
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; d="scan'208";a="220525962"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 23:20:52 -0800
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; d="scan'208";a="645376821"
Received: from pheino-mobl.ger.corp.intel.com (HELO [10.249.254.142])
 ([10.249.254.142])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 23:20:50 -0800
Message-ID: <e5e1eb39-10d1-ef24-e307-89342d28ede3@linux.intel.com>
Date: Tue, 16 Nov 2021 08:20:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 5/6] drm/i915/ttm: Implement asynchronous TTM moves
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20211114111218.623138-1-thomas.hellstrom@linux.intel.com>
 <20211114111218.623138-6-thomas.hellstrom@linux.intel.com>
 <12fa8629-d05f-908c-d127-5fe53bc45c1d@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <12fa8629-d05f-908c-d127-5fe53bc45c1d@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/15/21 18:16, Matthew Auld wrote:

Thanks for reviewing, Matthew,

I'll take a look at the comments.

/Thomas


> On 14/11/2021 11:12, Thomas Hellström wrote:
>> Don't wait sync while migrating, but rather make the GPU blit await the
>> dependencies and add a moving fence to the object.
>>
>> This also enables asynchronous VRAM management in that on eviction,
>> rather than waiting for the moving fence to expire before freeing VRAM,
>> it is freed immediately and the fence is stored with the VRAM manager 
>> and
>> handed out to newly allocated objects to await before clears and 
>> swapins,
>> or for kernel objects before setting up gpu vmas or mapping.
>>
>> To collect dependencies before migrating, add a set of utilities that
>> coalesce these to a single dma_fence.
>>
>> What is still missing for fully asynchronous operation is 
>> asynchronous vma
>> unbinding, which is still to be implemented.
>>
>> This commit substantially reduces execution time in the 
>> gem_lmem_swapping
>> test.
>>
>> v2:
>> - Make a couple of functions static. 
