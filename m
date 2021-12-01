Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E80464ADD
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 10:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146CE6ED92;
	Wed,  1 Dec 2021 09:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CA16ECAD;
 Wed,  1 Dec 2021 09:44:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="216441972"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; d="scan'208";a="216441972"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 01:44:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; d="scan'208";a="747457963"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga005.fm.intel.com with ESMTP; 01 Dec 2021 01:44:33 -0800
Received: from [10.249.132.125] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.132.125])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 1B19iV0d018520; Wed, 1 Dec 2021 09:44:32 GMT
Message-ID: <2476fd01-b5a1-7958-45c9-2fa9a29fda9b@intel.com>
Date: Wed, 1 Dec 2021 10:44:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH v4 2/2] drm/i915: Use to_root_gt() to refer to
 the root tile
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20211128110926.2569-1-andi.shyti@linux.intel.com>
 <20211128110926.2569-3-andi.shyti@linux.intel.com>
 <20211130210730.wbuy3znor6jel3cc@ldmartin-desk2>
 <YaaohLkiuWsPSqWq@intel.intel>
 <20211201003808.isoxka2qpccetl5w@ldmartin-desk2>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20211201003808.isoxka2qpccetl5w@ldmartin-desk2>
Content-Type: text/plain; charset=UTF-8
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Michal=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 01.12.2021 01:38, Lucas De Marchi wrote:
> On Wed, Dec 01, 2021 at 12:41:08AM +0200, Andi Shyti wrote:
>> Hi Lucas,
>>
>> fist of all thanks for taking a look at this, I was eagerly
>> waiting for reviewers.
>>
>> On Tue, Nov 30, 2021 at 01:07:30PM -0800, Lucas De Marchi wrote:
>>> On Sun, Nov 28, 2021 at 01:09:26PM +0200, Andi Shyti wrote:
>>> > Starting from a patch from Matt to_root_gt() returns the
>>> > reference to the root tile in order to abstract the root tile
>>> > from th callers.
>>> >
>>> > Being the root tile identified as tile '0', embed the id in the
>>> > name so that i915->gt becomes i915->gt0.
>>> >
>>> > The renaming has been mostly done with the following command and
>>> > some manual fixes.
>>> >
>>> > sed -i -e sed -i 's/\&i915\->gt\./\&to_root_gt(i915)\->/g' \
>>> >     -e sed -i 's/\&dev_priv\->gt\./\&to_root_gt(dev_priv)\->/g' \
>>> >     -e 's/\&dev_priv\->gt/to_root_gt(dev_priv)/g' \
>>> >     -e 's/\&i915\->gt/to_root_gt(i915)/g' \
>>> >     -e 's/dev_priv\->gt\./to_root_gt(dev_priv)\->/g' \
>>> >     -e 's/i915\->gt\./to_root_gt(i915)\->/g' \
>>> >     `find drivers/gpu/drm/i915/ -name *.[ch]`
>>> >
>>> > Two small changes have been added to this commit:
>>> >
>>> > 1. intel_reset_gpu() in intel_display.c retreives the gt from
>>> >    to_scanout_gt()
>>> > 2. in set_scheduler_caps() the gt is taken from the engine and
>>> >    not from i915.
>>>
>>> Ideally the non-automatic changes should be in separate patches, before
>>> the ones that can be done by automation. Because then it becomes easier
>>> to apply the final result without conflicts.
>>
>> OK
>>
>>> This is quite a big diff to merge in one go. Looking at the pending
>>> patches from Michal however I see he had similar changes, split in
>>> sensible chunks..  Could you split your version like that? at least
>>> gt/gem and display would be good to have separate. Or sync with Michal
>>> on how to proceed with these versions Here are his patches:
>>>
>>>     drm/i915: Remove i915->ggtt
>>>     drm/i915: Use to_gt() helper for GGTT accesses
>>>     drm/i915: Use to_gt() helper
>>>     drm/i915/gvt: Use to_gt() helper
>>>     drm/i915/gem: Use to_gt() helper
>>>     drm/i915/gt: Use to_gt() helper
>>>     drm/i915/display: Use to_gt() helper
>>>     drm/i915: Introduce to_gt() helper
>>
>> I understand... will follow this approach.
>>
>>> This first patch also removed the `struct intel_gt *gt = to_gt(pool)`,
>>> that would otherwise be a leftover in
>>> drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
>>
>> One difference from Michal patch is that I am not using the
>> wrapper
>>
>>  to_gt(...)
>>
>> but
>>
>>  to_root_gt(...)
>>
>> which was introduced by Matt. To me sounds more meaningful as it
>> specifies that we are really looking for the root tile and not
>> any tile.
> 
> yes, I think it makes sense, too.  Michal, any comment?  I think you
> also had other plans to get the root gt by another helper... ?

The main rationale to use generic "to_gt()" helper name in all existing
i915->gt cases in (other) Michal patches was that on some upcoming
configs we want to distinguish between "primary" and "root" tile and use
"to_root_gt()" helper only when referring to the root tile as described
in Bspec:52416.

Note that since current code baseline is still "single" tile, you can't
tell whether all of these functions really expects special "root" tile
or just "any" tile.

Thus to avoid confusion or mistakes I would suggest to keep simple name
"to_gt()" as in most cases usages of this helper it will likely be
replaced with iterator from for_each_gt loop and any remaining usages
will just mean "primary" tile or replaced with explicit "to_root_gt()"
if really needed.

Michal
