Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DBD5AA0A0
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 22:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2530410E19B;
	Thu,  1 Sep 2022 20:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E2D10E19B;
 Thu,  1 Sep 2022 20:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662062773; x=1693598773;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aC86vRTMKViicNNXan0jfP5ri1vcGhCaKviFF5PrVB8=;
 b=RozljZxqBbYD4mW8ZSUJOYGNt+Fa9P/j7qPAjX20DVSa/bH2GO2Q04cE
 26tfliYqh+h0F0VseH04cNxfBOsDEbrI2Ht9dPIAqvDPYLUEacIBTtH+4
 w8G67m+WMmTdXSsIPOB4cMR/nJWCTlB5RYbbwuqEZ+hzBmXay++WCzxs7
 Vc3wax70faKjTYBrfV8qQqTvWG8Yex9lTQjDOxeiOKIKIIs8+CqCvlf0U
 Vmuv9VYiZzQdPDkHcG417fqvquoU9HpenhW3xUmPfqdqB8pvLFwyvrKkC
 5IAw0cumfyFiWaULVcQ1odzaQg7+80SvAvjsgm8RHoiatd75C2yXK6GGQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="293394602"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="293394602"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 13:06:13 -0700
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="563602899"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 13:06:12 -0700
Date: Thu, 1 Sep 2022 13:05:51 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [RFC PATCH v3 04/17] drm/i915: Implement bind and unbind of object
Message-ID: <20220901200549.GI10283@nvishwa1-DESK>
References: <20220827194403.6495-1-andi.shyti@linux.intel.com>
 <20220827194403.6495-5-andi.shyti@linux.intel.com>
 <CAPM=9twz1mcWiVBvNXHeVqg6phF96jNtpwtPp46ncc7yHCBo-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAPM=9twz1mcWiVBvNXHeVqg6phF96jNtpwtPp46ncc7yHCBo-w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Andi Shyti <andi@etezian.org>, Ramalingam C <ramalingampc2008@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 03:31:13PM +1000, Dave Airlie wrote:
>On Sun, 28 Aug 2022 at 05:45, Andi Shyti <andi.shyti@linux.intel.com> wrote:
>>
>> From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>
>> Implement the bind and unbind of an object at the specified GPU virtual
>> addresses.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>> ---
>>  drivers/gpu/drm/i915/Makefile                 |   1 +
>>  drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  21 ++
>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 322 ++++++++++++++++++
>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  10 +
>>  drivers/gpu/drm/i915/gt/intel_gtt.h           |   9 +
>>  drivers/gpu/drm/i915/i915_driver.c            |   1 +
>>  drivers/gpu/drm/i915/i915_vma.c               |   3 +-
>>  drivers/gpu/drm/i915/i915_vma.h               |   2 -
>>  drivers/gpu/drm/i915/i915_vma_types.h         |  14 +
>>  include/uapi/drm/i915_drm.h                   | 163 +++++++++
>>  10 files changed, 543 insertions(+), 3 deletions(-)
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>

<snip>

>> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
>> index be6e028c3b57d..f746fecae85ed 100644
>> --- a/drivers/gpu/drm/i915/i915_vma_types.h
>> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
>> @@ -289,6 +289,20 @@ struct i915_vma {
>>         /** This object's place on the active/inactive lists */
>>         struct list_head vm_link;
>>
>> +       /** @vm_bind_link: node for the vm_bind related lists of vm */
>> +       struct list_head vm_bind_link;
>> +
>> +       /** Interval tree structures for persistent vma */
>> +
>> +       /** @rb: node for the interval tree of vm for persistent vmas */
>> +       struct rb_node rb;
>> +       /** @start: start endpoint of the rb node */
>> +       u64 start;
>> +       /** @last: Last endpoint of the rb node */
>> +       u64 last;
>> +       /** @__subtree_last: last in subtree */
>> +       u64 __subtree_last;
>
>Was a drm_mm node considered for this or was it overkill?
>

We already have a drm_mm node (i915_vma.node). But currently in i915
driver, VA managment and binding of vmas are tightly coupled.
Ideally we want to decouple it and then use the same drm_mm node for
persistent vma lookup as well, instead of this new interval tree.
But decouple it is not trivial I think it needs to be carefully
done in a separate patch series to not cause any regression.

The new interval/rb tree here is an optimization for fast lookup of
persistent vma (instead of list walk) whether it is bound or not.
Eventually though, with above cleanup we should be able to use the
i915_vma.node for vma lookup (even when it is not bound).

I was briefly discussed in earlier version of this series (though topic
was different there).
https://lists.freedesktop.org/archives/intel-gfx/2022-July/301159.html

Niranjana

>Dave.
