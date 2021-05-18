Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8977F387C58
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 17:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F346EBA8;
	Tue, 18 May 2021 15:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813DF6EBA7;
 Tue, 18 May 2021 15:21:04 +0000 (UTC)
IronPort-SDR: g9jxznvzZFzp4eszGpJ+Hzd/2iexujVquefPTV8MYeIsaHv3Nh61wPmzEZydNLmyeF5/Nw9OWb
 BQ4LRbfr9C9g==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="198787268"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="198787268"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 08:21:03 -0700
IronPort-SDR: VMYsIPugjzcTr2Kd5Ff23dYiSu6h9yAWhpC8LEaNcX5B9hKm9YtAhxa2lT3TiDoRvweaKSTKBf
 sE4otHxCFfbQ==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="439083808"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO [10.249.254.195])
 ([10.249.254.195])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 08:21:01 -0700
Subject: Re: [PATCH v2 09/15] drm/ttm, drm/amdgpu: Allow the driver some
 control over swapping
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-10-thomas.hellstrom@linux.intel.com>
 <c4cd4843-c3aa-1f01-fc73-bc9144fa478f@linux.intel.com>
 <60276369-dbfd-e0dc-548b-a9419ff4c7eb@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <471d8fd5-379f-e95a-4973-c50fadace7cb@linux.intel.com>
Date: Tue, 18 May 2021 17:20:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <60276369-dbfd-e0dc-548b-a9419ff4c7eb@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/18/21 5:18 PM, Christian König wrote:
>
>
> Am 18.05.21 um 17:15 schrieb Thomas Hellström:
>>
>> On 5/18/21 10:26 AM, Thomas Hellström wrote:
>>> We are calling the eviction_valuable driver callback at eviction 
>>> time to
>>> determine whether we actually can evict a buffer object.
>>> The upcoming i915 TTM backend needs the same functionality for swapout,
>>> and that might actually be beneficial to other drivers as well.
>>>
>>> Add an eviction_valuable call also in the swapout path. Try to keep the
>>> current behaviour for all drivers by returning true if the buffer 
>>> object
>>> is already in the TTM_PL_SYSTEM placement. We change behaviour for the
>>> case where a buffer object is in a TT backed placement when swapped 
>>> out,
>>> in which case the drivers normal eviction_valuable path is run.
>>>
>>> Finally export ttm_tt_unpopulate() and don't swap out bos
>>> that are not populated. This allows a driver to purge a bo at
>>> swapout time if its content is no longer valuable rather than to
>>> have TTM swap the contents out.
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>
>> Christian,
>>
>> Here we have a ttm_tt_unpopulate() export as well at the end. I 
>> figure you will push back on that one. What we really need is a 
>> functionality to just drop the bo contents and end up in system 
>> memory unpopulated. Should I perhaps add a utility function to do 
>> that instead? like ttm_bo_purge()?
>
> We already have that. Just call ttm_bo_validate() without any place to 
> put the buffer.
>
> See how ttm_bo_pipeline_gutting() is used.
>
> Christian.

OK, so is that reentrant from the move() or swap_notify() callback.

/Thomas



>
>>
>> Thanks,
>>
>> Thomas
>>
>>
>
