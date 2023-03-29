Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107196CD875
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 13:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C97110E166;
	Wed, 29 Mar 2023 11:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A665D10E166
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 11:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680089332; x=1711625332;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=JGMbh0J3Ep4ALl5fvP9kT9Pq4VuAVtH2X+HHgJvfgKY=;
 b=TGDuu2ZTOju1ra41NqurTVy7llTrCwpk7A6KnmrvyAgGnAJOYAAoVros
 YZqX7bJ1tb/wLMq4tzXgiA+z1SD2YbJnckpw7DIQnDif1caWbQWBTyoSh
 xCKx8zE7KYhlI+7k+UZNYOw5Wed0kp3G9YPQDLBT3Gds1SMzuFufGs06m
 Spq4OnbercGbvKeWxhsoLjic2pazhKyDKaA8ATHJ4WJi9GV5S8wvS/a7e
 XXgAEgCEmDh2joEs0+uAI1heMukIV+wUJeVFc0qBv7CmuPK6Matg0xv9U
 UOrP9g7Yl4EmVrLJ5AMT5wzHHzkpCVYtgdZ0CFhbpQIX372K0tBBiDLwq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="342444275"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="342444275"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 04:28:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="634436238"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="634436238"
Received: from jetten-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.51.146])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 04:28:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, David Gow
 <davidgow@google.com>, =?utf-8?Q?Lu=C3=ADs?=
 Mendes <luis.p.mendes@gmail.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mairacanal@riseup.net>, Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH 2/2] drm: test: Fix 32-bit issue in drm_buddy_test
In-Reply-To: <ceb0b1e8-6c7a-8564-156f-fcf0f0e4a95e@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230329065532.2122295-1-davidgow@google.com>
 <20230329065532.2122295-2-davidgow@google.com>
 <ceb0b1e8-6c7a-8564-156f-fcf0f0e4a95e@igalia.com>
Date: Wed, 29 Mar 2023 14:28:45 +0300
Message-ID: <87fs9n4x02.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Mar 2023, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
> On 3/29/23 03:55, David Gow wrote:
>> The drm_buddy_test KUnit tests verify that returned blocks have sizes
>> which are powers of two using is_power_of_2(). However, is_power_of_2()
>> operations on a 'long', but the block size is a u64. So on systems where
>> long is 32-bit, this can sometimes fail even on correctly sized blocks.
>>=20
>> This only reproduces randomly, as the parameters passed to the buddy
>> allocator in this test are random. The seed 0xb2e06022 reproduced it
>> fine here.
>>=20
>> For now, just hardcode an is_power_of_2() implementation using
>> x & (x - 1).
>>=20
>> Signed-off-by: David Gow <davidgow@google.com>
>
> As we still didn't consolidate an implementation of is_power_of_2_u64(),

I just cooked up some patches to try to make is_power_of_2() more
flexible. I only sent them to the "CI trybot" for a quick spin first,
will post to lkml later. [1]

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/115785/

>
> Reviewed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>
> Best Regards,
> - Ma=C3=ADra Canal
>
>> ---
>>=20
>> There are actually a couple of is_power_of_2_u64() implementations
>> already around in:
>> - drivers/gpu/drm/i915/i915_utils.h
>> - fs/btrfs/misc.h (called is_power_of_two_u64)
>>=20
>> So the ideal thing would be to consolidate these in one place.
>>=20
>>=20
>> ---
>>   drivers/gpu/drm/tests/drm_buddy_test.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/te=
sts/drm_buddy_test.c
>> index f8ee714df396..09ee6f6af896 100644
>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>> @@ -89,7 +89,8 @@ static int check_block(struct kunit *test, struct drm_=
buddy *mm,
>>   		err =3D -EINVAL;
>>   	}
>>=20=20=20
>> -	if (!is_power_of_2(block_size)) {
>> +	/* We can't use is_power_of_2() for a u64 on 32-bit systems. */
>> +	if (block_size & (block_size - 1)) {
>>   		kunit_err(test, "block size not power of two\n");
>>   		err =3D -EINVAL;
>>   	}

--=20
Jani Nikula, Intel Open Source Graphics Center
