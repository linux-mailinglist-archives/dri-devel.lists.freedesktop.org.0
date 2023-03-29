Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 391356CD6AF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 11:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDAE10E510;
	Wed, 29 Mar 2023 09:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A848510E510
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680082962; x=1711618962;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wsUEbabLSJ+xqGqt7Fcvy5Ojm7Y0fRXRafogIThAt4k=;
 b=GsOtpc2Gl8eaTNKg92V9rKTLEf9fbiNsPYmdPfsY528rck2e2M7FFQZ3
 JSx76SvncXEW9B/eTYSk9waY580btsWKgBKD+XzVxEG0Kc4BLydDZZd+j
 XLg/zcwVrPkjUV32kJ6uZhEXJZThkbm1tLHIc1LHp8iogdDLNWSlq7fXd
 PCf7HBzYkBVh3Xll9E+oavrOxiTUlO8lu15wUGnO7fHglBHxbIVg6clVg
 TYM8xF1mljanyLJHoMB3FZlRBQjMAVjE1wwPWcJgKgU3EOKrT+PDnfEal
 HnGSjeviq1ovLnfgBGa+/ArRxJhSjEddOCJdJ38kcGGwMp2ZypbIWj+Fb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="403454478"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="403454478"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 02:42:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="773508919"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="773508919"
Received: from jetten-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.51.146])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 02:42:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: David Gow <davidgow@google.com>, =?utf-8?Q?Lu=C3=ADs?= Mendes
 <luis.p.mendes@gmail.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, =?utf-8?Q?Ma?=
 =?utf-8?Q?=C3=ADra?= Canal
 <mairacanal@riseup.net>, Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH 2/2] drm: test: Fix 32-bit issue in drm_buddy_test
In-Reply-To: <87lejf522a.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230329065532.2122295-1-davidgow@google.com>
 <20230329065532.2122295-2-davidgow@google.com> <87lejf522a.fsf@intel.com>
Date: Wed, 29 Mar 2023 12:42:35 +0300
Message-ID: <87ilej51x0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: David Gow <davidgow@google.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Mar 2023, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 29 Mar 2023, David Gow <davidgow@google.com> wrote:
>> The drm_buddy_test KUnit tests verify that returned blocks have sizes
>> which are powers of two using is_power_of_2(). However, is_power_of_2()
>> operations on a 'long', but the block size is a u64. So on systems where
>> long is 32-bit, this can sometimes fail even on correctly sized blocks.
>>
>> This only reproduces randomly, as the parameters passed to the buddy
>> allocator in this test are random. The seed 0xb2e06022 reproduced it
>> fine here.
>>
>> For now, just hardcode an is_power_of_2() implementation using
>> x & (x - 1).
>>
>> Signed-off-by: David Gow <davidgow@google.com>
>> ---
>>
>> There are actually a couple of is_power_of_2_u64() implementations
>> already around in:
>> - drivers/gpu/drm/i915/i915_utils.h
>> - fs/btrfs/misc.h (called is_power_of_two_u64) 
>>
>> So the ideal thing would be to consolidate these in one place.
>>
>>
>> ---
>>  drivers/gpu/drm/tests/drm_buddy_test.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
>> index f8ee714df396..09ee6f6af896 100644
>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>> @@ -89,7 +89,8 @@ static int check_block(struct kunit *test, struct drm_buddy *mm,
>>  		err = -EINVAL;
>>  	}
>>  
>> -	if (!is_power_of_2(block_size)) {
>> +	/* We can't use is_power_of_2() for a u64 on 32-bit systems. */
>> +	if (block_size & (block_size - 1)) {
>
> Then maybe use is_power_of_2_u64() instead?

*sigh* And as soon as I wrote that I realized it's a local thing in
btrfs. Never mind for now...

...but in the long run would be nice to either fix is_power_of_2() for
u64 or add that u64 version...

BR,
Jani.

>
> BR,
> Jani.
>
>>  		kunit_err(test, "block size not power of two\n");
>>  		err = -EINVAL;
>>  	}

-- 
Jani Nikula, Intel Open Source Graphics Center
