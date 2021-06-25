Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 912DA3B4881
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 19:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D6E6EE2E;
	Fri, 25 Jun 2021 17:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6F66EE2D;
 Fri, 25 Jun 2021 17:52:37 +0000 (UTC)
IronPort-SDR: YfOI9sG85FlZvLk8HI7IP3AQe9g74uI6dkEXDjXJZVbFlSgOXK9Hn7Yk9qlWglMfJP7eQkNice
 urHsilI6xk9g==
X-IronPort-AV: E=McAfee;i="6200,9189,10026"; a="195011826"
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="195011826"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 10:52:34 -0700
IronPort-SDR: cQ16GZc9Pqc0rvymdcrJw1hhojInv7WYueZE/TwYZXeI3UdHZZY4Fef/+PnRu8htEvtiw+DZ+u
 IWCEtNRNQPXg==
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="455514711"
Received: from liordavi-mobl.ger.corp.intel.com (HELO [10.249.254.242])
 ([10.249.254.242])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 10:52:30 -0700
Subject: Re: [PATCH 4/4] drm/i915/gem: Migrate to system at dma-buf map time
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210624183110.22582-1-thomas.hellstrom@linux.intel.com>
 <20210624183110.22582-5-thomas.hellstrom@linux.intel.com>
 <5304ae661abb43a0816a485db9d3bbb5@intel.com>
 <cd90ba70-15f8-af0a-8810-2ee7939622a2@linux.intel.com>
 <5e9a46340f254928be6264e4e61eeab8@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <8cffb2f2-4401-2cdf-1ab3-98cc2d879b00@linux.intel.com>
Date: Fri, 25 Jun 2021 19:52:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5e9a46340f254928be6264e4e61eeab8@intel.com>
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


On 6/25/21 7:38 PM, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Sent: Friday, June 25, 2021 12:18 PM
>> To: Ruhl, Michael J <michael.j.ruhl@intel.com>; intel-
>> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Cc: Auld, Matthew <matthew.auld@intel.com>
>> Subject: Re: [PATCH 4/4] drm/i915/gem: Migrate to system at dma-buf map
>> time
>>
>> Hi, Michael,
>>
>> thanks for looking at this.
>>
>> On 6/25/21 6:02 PM, Ruhl, Michael J wrote:
>>>> -----Original Message-----
>>>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>>>> Thomas Hellström
>>>> Sent: Thursday, June 24, 2021 2:31 PM
>>>> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>; Auld,
>> Matthew
>>>> <matthew.auld@intel.com>
>>>> Subject: [PATCH 4/4] drm/i915/gem: Migrate to system at dma-buf map
>> time
>>>> Until we support p2p dma or as a complement to that, migrate data
>>>> to system memory at dma-buf map time if possible.
>>>>
>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> ---
>>>> drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 9 ++++++++-
>>>> 1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>> index 616c3a2f1baf..a52f885bc09a 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>> @@ -25,7 +25,14 @@ static struct sg_table
>> *i915_gem_map_dma_buf(struct
>>>> dma_buf_attachment *attachme
>>>> 	struct scatterlist *src, *dst;
>>>> 	int ret, i;
>>>>
>>>> -	ret = i915_gem_object_pin_pages_unlocked(obj);
>>>> +	ret = i915_gem_object_lock_interruptible(obj, NULL);
>>> Hmm, I believe in most cases that the caller should be holding the
>>> lock (object dma-resv) on this object already.
>> Yes, I agree, In particular for other instances of our own driver,  at
>> least since the dma_resv introduction.
>>
>> But I also think that's a pre-existing bug, since
>> i915_gem_object_pin_pages_unlocked() will also take the lock.
> Ouch yes.  Missed that.
>
>> I Think we need to initially make the exporter dynamic-capable to
>> resolve this, and drop the locking here completely, as dma-buf docs says
>> that we're then guaranteed to get called with the object lock held.
>>
>> I figure if we make the exporter dynamic, we need to migrate already at
>> dma_buf_pin time so we don't pin the object in the wrong location.
> The exporter as dynamic  (ops->pin is available) is optional, but importer
> dynamic (ops->move_notify) is required.
>
> With that in mind, it would seem that there are three possible combinations
> for the migrate to be attempted:
>
> 1) in the ops->pin function (export_dynamic != import_dynamic, during attach)
> 2) in the ops->pin function (export_dynamic and !CONFIG_DMABUF_MOVE_NOTIFY) during mapping
> 3) and possibly in ops->map_dma_buf (exort_dynamic iand CONFIG_DMABUF_MOVE_NOTIFY)
>
> Since one possibility has to be in the mapping function, it seems that if we
> can figure out the locking, that the migrate should probably be available here.
>
> Mike

So perhaps just to initially fix the bug, we could just implement NOP 
pin() and unpin() callbacks and drop the locking in map_attach() and 
replace it with an assert_object_held();

/Thomas


