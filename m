Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0033F3B6952
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 21:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C635F6E546;
	Mon, 28 Jun 2021 19:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56ECC6E544;
 Mon, 28 Jun 2021 19:51:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="229644651"
X-IronPort-AV: E=Sophos;i="5.83,306,1616482800"; d="scan'208";a="229644651"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 12:51:46 -0700
X-IronPort-AV: E=Sophos;i="5.83,306,1616482800"; d="scan'208";a="641032325"
Received: from danielmi-mobl2.ger.corp.intel.com (HELO [10.249.254.242])
 ([10.249.254.242])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 12:51:44 -0700
Subject: Re: [PATCH v3 5/5] drm/i915/gem: Migrate to system at dma-buf map time
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210628144626.76126-1-thomas.hellstrom@linux.intel.com>
 <20210628144626.76126-6-thomas.hellstrom@linux.intel.com>
 <1e17b84df802428197e348afa460cdb7@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <eb284e98-ade2-39bb-6473-424e03038b41@linux.intel.com>
Date: Mon, 28 Jun 2021 21:51:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1e17b84df802428197e348afa460cdb7@intel.com>
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/28/21 9:45 PM, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>> Thomas Hellström
>> Sent: Monday, June 28, 2021 10:46 AM
>> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>; Auld, Matthew
>> <matthew.auld@intel.com>
>> Subject: [PATCH v3 5/5] drm/i915/gem: Migrate to system at dma-buf map
>> time
>>
>> Until we support p2p dma or as a complement to that, migrate data
>> to system memory at dma-buf map time if possible.
>>
>> v2:
>> - Rebase on dynamic exporter. Update the igt_dmabuf_import_same_driver
>>   selftest to migrate if we are LMEM capable.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>> drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c           | 7 ++++++-
>> drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 4 +++-
>> 2 files changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> index 1d1eeb167d28..5207aa3af009 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> @@ -29,7 +29,12 @@ static struct sg_table *i915_gem_map_dma_buf(struct
>> dma_buf_attachment *attachme
>>
>> 	assert_object_held(obj);
>>
>> -	ret = i915_gem_object_pin_pages(obj);
>> +	if (!i915_gem_object_can_migrate(obj, INTEL_REGION_SMEM))
>> +		return ERR_PTR(-EOPNOTSUPP);
>> +
>> +	ret = i915_gem_object_migrate(obj, NULL, INTEL_REGION_SMEM);
>> +	if (!ret)
>> +		ret = i915_gem_object_pin_pages(obj);
>> 	if (ret)
>> 		goto err;
> With the caveats of the previous patches this looks good.
Yes, this sort of sucks, but knowing that we have a correct 
implementation in the works...
>
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>
> Mike

Thanks for the reviews!

Thomas


