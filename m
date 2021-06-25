Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB85D3B474F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 18:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5237C6EE10;
	Fri, 25 Jun 2021 16:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EB76EE10;
 Fri, 25 Jun 2021 16:17:50 +0000 (UTC)
IronPort-SDR: Oi9jhA8O/J2lNzZM25P4uGiKStW4T/rmd9ku1EHK7lysEwT/qZ6wdmtA39nPSS39YYz+baCZzZ
 kogU59oUV1Vg==
X-IronPort-AV: E=McAfee;i="6200,9189,10026"; a="204691476"
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="204691476"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 09:17:50 -0700
IronPort-SDR: 5O/pnIz2dcFOVpvq39rMnkbAAlDo+wq7nQF1/ixCF7oLEhHTXEpmsn9HmGtOyHFJhMXyu8gPwI
 5E8aLP5EtaAw==
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="453863460"
Received: from pjthomps-mobl1.ger.corp.intel.com (HELO [10.249.254.221])
 ([10.249.254.221])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 09:17:48 -0700
Subject: Re: [PATCH 4/4] drm/i915/gem: Migrate to system at dma-buf map time
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210624183110.22582-1-thomas.hellstrom@linux.intel.com>
 <20210624183110.22582-5-thomas.hellstrom@linux.intel.com>
 <5304ae661abb43a0816a485db9d3bbb5@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <cd90ba70-15f8-af0a-8810-2ee7939622a2@linux.intel.com>
Date: Fri, 25 Jun 2021 18:17:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5304ae661abb43a0816a485db9d3bbb5@intel.com>
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

Hi, Michael,

thanks for looking at this.

On 6/25/21 6:02 PM, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>> Thomas Hellström
>> Sent: Thursday, June 24, 2021 2:31 PM
>> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>; Auld, Matthew
>> <matthew.auld@intel.com>
>> Subject: [PATCH 4/4] drm/i915/gem: Migrate to system at dma-buf map time
>>
>> Until we support p2p dma or as a complement to that, migrate data
>> to system memory at dma-buf map time if possible.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>> drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 9 ++++++++-
>> 1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> index 616c3a2f1baf..a52f885bc09a 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> @@ -25,7 +25,14 @@ static struct sg_table *i915_gem_map_dma_buf(struct
>> dma_buf_attachment *attachme
>> 	struct scatterlist *src, *dst;
>> 	int ret, i;
>>
>> -	ret = i915_gem_object_pin_pages_unlocked(obj);
>> +	ret = i915_gem_object_lock_interruptible(obj, NULL);
> Hmm, I believe in most cases that the caller should be holding the
> lock (object dma-resv) on this object already.

Yes, I agree, In particular for other instances of our own driver,  at 
least since the dma_resv introduction.

But I also think that's a pre-existing bug, since 
i915_gem_object_pin_pages_unlocked() will also take the lock.

I Think we need to initially make the exporter dynamic-capable to 
resolve this, and drop the locking here completely, as dma-buf docs says 
that we're then guaranteed to get called with the object lock held.

I figure if we make the exporter dynamic, we need to migrate already at 
dma_buf_pin time so we don't pin the object in the wrong location.

/Thomas


>
> I know for the dynamic version of dma-buf, there is a check to make
> sure that the lock is held when called.
>
> I think you will run into some issues if you try to get it here as well.
>
> Mike
>
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	ret = i915_gem_object_migrate(obj, NULL, INTEL_REGION_SMEM);
>> +	if (!ret)
>> +		ret = i915_gem_object_pin_pages(obj);
>> +	i915_gem_object_unlock(obj);
>> 	if (ret)
>> 		goto err;
>>
>> --
>> 2.31.1
