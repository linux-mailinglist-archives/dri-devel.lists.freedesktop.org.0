Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C467B4634EB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 13:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED9F6E8A6;
	Tue, 30 Nov 2021 12:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564C86E8A6;
 Tue, 30 Nov 2021 12:56:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="223088867"
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="223088867"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 04:56:17 -0800
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="595373081"
Received: from hekner-mobl5.ger.corp.intel.com (HELO [10.249.254.206])
 ([10.249.254.206])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 04:56:15 -0800
Message-ID: <57df8b0b-1d65-155f-a9a6-8073bbd4f28f@linux.intel.com>
Date: Tue, 30 Nov 2021 13:56:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 1/2] dma-fence: Avoid establishing a locking order
 between fence classes
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211130121936.586031-1-thomas.hellstrom@linux.intel.com>
 <20211130121936.586031-2-thomas.hellstrom@linux.intel.com>
 <c7502701-e85c-39f0-c249-702d029faa9e@linux.intel.com>
 <b440cfbc-2b9a-1aa2-76d6-17337f835777@linux.intel.com>
 <52a7cf8c-59c7-fec0-2274-d19bdc505314@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <52a7cf8c-59c7-fec0-2274-d19bdc505314@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/30/21 13:42, Christian König wrote:
> Am 30.11.21 um 13:31 schrieb Thomas Hellström:
>> [SNIP]
>>> Other than that, I didn't investigate the nesting fails enough to 
>>> say I can accurately review this. :)
>>
>> Basically the problem is that within enable_signaling() which is 
>> called with the dma_fence lock held, we take the dma_fence lock of 
>> another fence. If that other fence is a dma_fence_array, or a 
>> dma_fence_chain which in turn tries to lock a dma_fence_array we hit 
>> a splat.
>
> Yeah, I already thought that you constructed something like that.
>
> You get the splat because what you do here is illegal, you can't mix 
> dma_fence_array and dma_fence_chain like this or you can end up in a 
> stack corruption.

Hmm. Ok, so what is the stack corruption, is it that the 
enable_signaling() will end up with endless recursion? If so, wouldn't 
it be more usable we break that recursion chain and allow a more general 
use?

Also what are the mixing rules between these? Never use a 
dma-fence-chain as one of the array fences and never use a 
dma-fence-array as a dma-fence-chain fence?

/Thomas




>
> Regards,
> Christian.
>
>>
>> But I'll update the commit message with a typical splat.
>>
>> /Thomas
>
