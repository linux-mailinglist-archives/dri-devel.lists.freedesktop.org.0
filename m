Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C26AD13A21
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 16:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8269210E1AD;
	Mon, 12 Jan 2026 15:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="nh89DPR9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5583810E1AD;
 Mon, 12 Jan 2026 15:25:34 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dqbmV6YPCz9tbt;
 Mon, 12 Jan 2026 16:25:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768231531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hP29uxTqEYKFHGcWUc6BuUnuj+pmslLcfo/YmbcLelM=;
 b=nh89DPR9/khwuAKLVblZ5xa73pOsOakZfJzzJxB1eKbxidP9R1eMCmun/ggUDB33LyY4us
 n92JlWhBxNXsQoR6PZUGLkTAw5umDPXh0KVm63/wT28MvihXx8FuWI+LeKziHoOJcvF4TZ
 4bbKPBcFg7ZigtLOGmf5DKOJaUiwQu0o9JIlIuUBA+ptOioq98i7LPIblz/bSm1UM61Xor
 IYbGWoIF81m89vU0k4XDfZNfRgzuDmVFdXI0AE63+jCjtL+iTOkI+o6/WcVl4XJDItjx/y
 SUJT9i0+PUDl1IjJeYcuIjtw7sjTUlkYm1IY7GM1XYkFZodrH80BkU0XoSBkuQ==
Message-ID: <dfe336b7-3d96-4e63-91e7-0eb9c23512c5@mailbox.org>
Date: Mon, 12 Jan 2026 16:25:23 +0100
MIME-Version: 1.0
Subject: Re: [PATCH [RFC] v3 5/7] drm/atomic: Allow planes with NULL fb along
 with async flip
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "xaver.hugl@kde.org" <xaver.hugl@kde.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "Kumar, Naveen1" <naveen1.kumar@intel.com>,
 "Syrjala, Ville" <ville.syrjala@intel.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
 <20260108-async-v3-5-e7730c3fe9ff@intel.com>
 <6316ba11-0660-419c-afb6-a1588f6efef5@mailbox.org>
 <IA0PR11MB73076D91D60F168B9D112051BA82A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <05ac3e30-b3dc-48ea-96db-1cbdb4454730@mailbox.org>
 <385071a7-15c9-4265-87b0-fe30dcf6f87e@intel.com>
 <702511b9-28bc-4ea0-809c-f14135a80af1@mailbox.org>
 <63c2c8b1-d695-454b-ada1-b79d61018bd6@intel.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <63c2c8b1-d695-454b-ada1-b79d61018bd6@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: mixo78356i5w6c8h8a7njq1jy4worxan
X-MBO-RS-ID: 0fb8ede8d1bbdff355f
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

On 1/12/26 16:20, Murthy, Arun R wrote:
> 
> On 12-01-2026 16:54, Michel Dänzer wrote:
>> On 1/12/26 09:26, Murthy, Arun R wrote:
>>> On 09-01-2026 16:53, Michel Dänzer wrote:
>>>> On 1/9/26 12:08, Murthy, Arun R wrote:
>>>>>> From: Michel Dänzer <michel.daenzer@mailbox.org>
>>>>>> On 1/8/26 10:43, Arun R Murthy wrote:
>>>>>>> Along with async flip if there is a request to disable a sync plane by
>>>>>>> providing a NULL fb allow them.
>>>>>> That could result in async changes to other planes taking effect in an earlier
>>>>>> refresh cycle than the sync plane being disabled, couldn't it? In which case the
>>>>>> commit arguably wouldn't actually be "atomic".
>>>>>>
>>>>> This is the request from the community to allow disabling of a sync plane in an async flip atomic ioctl.
>>>>> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834
>>>> Can't see any such request there. I suspect there might be a misunderstanding.
>>> Here cursor is a sync flip.
>>> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2855843
>> Not sure what you mean.
>>
>> The cursor plane is disabled in KWin's atomic commits with DRM_MODE_PAGE_FLIP_ASYNC, so it's irrelevant for them.
>>
>> In the comment following the one you referenced, Xaver (one of the main KWin developers) agreed that KWin not setting DRM_MODE_PAGE_FLIP_ASYNC in the commit which disables the cursor plane is fine.
>>
>> I see no request for being able to mix sync & async plane updates in a single commit.
>>
> Sorry maybe I might be creating more confusion or my words are not giving clarity.
> 
> Let me try to put it in simple words.
> The comment(https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2857640) from Xaver says that disabling of cursor plane along with a sync flip should work.

Honestly can't see how that comment could be interpreted that way.

Maybe Xaver can clarify.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
