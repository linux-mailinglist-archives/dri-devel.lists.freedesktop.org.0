Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B2A6D02AF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 13:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163D010E232;
	Thu, 30 Mar 2023 11:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8F910E232
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680174764; x=1711710764;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Hlo3O44M8BngBpuXPetDOZID6/wfbPZbTYhMPgpcDcU=;
 b=Z+jb4eICt1u1mgPGuqWsd/V26r+pNnE33u+0dCp/t1ofWX2hHrUn/Fss
 QAh7OqNDIHOGAl93byP3BBISBnVBOZkhlMpmxVOHzqjqzui/4vmqGIaRE
 WEkB0oelet0k88JA0DH3NOavff83HGS+HGRuC3LcM4+EkAUq3O3e7f48j
 MAHQW2rUp5hI6JuVg8GAl1x96i5rj37dgqPJCX9RbKgQG/jEfoNvFH7qM
 Mh7rEa7zc+0nVQwj5CISwEF6mqnsPhLgqv7Id3pJCChf6bYomlMK94eTv
 ui67ThG0UB5/YI70AYk2m8i6swRKcQ6KUTJ339qC1fbIZmVn8+8AniKY2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="368917540"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="368917540"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 04:12:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="714946982"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="714946982"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 04:12:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, David Gow
 <davidgow@google.com>, =?utf-8?Q?Lu=C3=ADs?= Mendes
 <luis.p.mendes@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, =?utf-8?Q?Ma?=
 =?utf-8?Q?=C3=ADra?= Canal
 <mairacanal@riseup.net>, Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH 1/2] drm: buddy_allocator: Fix buddy allocator init on
 32-bit systems
In-Reply-To: <e1af591e-a183-9b22-f533-297934e15e30@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230329065532.2122295-1-davidgow@google.com>
 <878rfe4iis.fsf@intel.com> <e1af591e-a183-9b22-f533-297934e15e30@amd.com>
Date: Thu, 30 Mar 2023 14:12:17 +0300
Message-ID: <875yai4hny.fsf@intel.com>
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

On Thu, 30 Mar 2023, Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> Am 30.03.23 um 12:53 schrieb Jani Nikula:
>> On Wed, 29 Mar 2023, David Gow <davidgow@google.com> wrote:
>>> The drm buddy allocator tests were broken on 32-bit systems, as
>>> rounddown_pow_of_two() takes a long, and the buddy allocator handles
>>> 64-bit sizes even on 32-bit systems.
>>>
>>> This can be reproduced with the drm_buddy_allocator KUnit tests on i386:
>>> 	./tools/testing/kunit/kunit.py run --arch i386 \
>>> 	--kunitconfig ./drivers/gpu/drm/tests drm_buddy
>>>
>>> (It results in kernel BUG_ON() when too many blocks are created, due to
>>> the block size being too small.)
>>>
>>> This was independently uncovered (and fixed) by Lu=C3=ADs Mendes, whose=
 patch
>>> added a new u64 variant of rounddown_pow_of_two(). This version instead
>>> recalculates the size based on the order.
>>>
>>> Reported-by: Lu=C3=ADs Mendes <luis.p.mendes@gmail.com>
>>> Link: https://lore.kernel.org/lkml/CAEzXK1oghXAB_KpKpm=3D-CviDQbNaH0qfg=
YTSSjZgvvyj4U78AA@mail.gmail.com/T/
>>> Signed-off-by: David Gow <davidgow@google.com>
>>> ---
>>>   drivers/gpu/drm/drm_buddy.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index 3d1f50f481cf..7098f125b54a 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -146,8 +146,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, =
u64 chunk_size)
>>>   		unsigned int order;
>>>   		u64 root_size;
>>>=20=20=20
>>> -		root_size =3D rounddown_pow_of_two(size);
>>> -		order =3D ilog2(root_size) - ilog2(chunk_size);
>>> +		order =3D ilog2(size) - ilog2(chunk_size);
>>> +		root_size =3D chunk_size << order;
>> Just noticed near the beginning of the function there's also:
>>
>> 	if (!is_power_of_2(chunk_size))
>> 		return -EINVAL;
>>
>> which is also wrong for 32-bit.
>
> Yeah, but that isn't vital. We just use u64 for the chunk_size for=20
> consistency.
>
> In reality I wouldn't except more than 256K here.

Right. It's just not pedantically correct either. ;)

is_power_of_2() is pretty scary as it is, since it just truncates.

BR,
Jani.


>
> Regards,
> Christian.
>
>>
>>
>> BR,
>> Jani.
>>
>>
>>>=20=20=20
>>>   		root =3D drm_block_alloc(mm, NULL, order, offset);
>>>   		if (!root)
>

--=20
Jani Nikula, Intel Open Source Graphics Center
