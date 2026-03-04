Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBJOHgULqGn2nQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 11:35:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E223A1FE706
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 11:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0011A10E9A7;
	Wed,  4 Mar 2026 10:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JZROQfxH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044A710E9B2
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 10:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772620546; x=1804156546;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UgS6V996PdN8AqAnWlEVeUsDMALMiHHFTeLoamvKN2M=;
 b=JZROQfxH5JsI6ujuUKOoxNmj8NLmCzGSNxV69OE0WKA0UT9c5wBk4L4s
 LQkYn6v2CsS37TAHpVGvd+qxQY6QT3yQ8k/ZpL3kQZhoOtptRSqdT49e5
 sYib3qWXWmEVisHrYV8GvXe3hV4A6gJpmWta2jsdU0qd+JlIpjo3b+Y5K
 j/Y40PRgXXH8xOGorYoWwWSVQMBKdB1AkVR/F6rIS8JrNFHilxAw3aJcJ
 HNdEYmzKbzrIShoUbanafF1P+2pkwFN0jLGBzMDqS14n1z7smj09wX+wI
 x4UGlhSTtj5iO6fxpXNJ4DmZS46EnFrRAb2wVjBjmMAx6QTbHtXfNJcx1 g==;
X-CSE-ConnectionGUID: vT30Dj9hR3yrLlQxUO841g==
X-CSE-MsgGUID: 2dcmlQ1YQniXkPhpaFbe2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="77282563"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="77282563"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 02:35:45 -0800
X-CSE-ConnectionGUID: CSiu4bidQii+Dv4ovQ8l6g==
X-CSE-MsgGUID: vXH3rHHYQnqHFa0ezsNgjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="217540737"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.178])
 ([10.245.245.178])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 02:35:43 -0800
Message-ID: <12090ced-c0fd-47db-9f36-9dbf3c4b3ca6@linux.intel.com>
Date: Wed, 4 Mar 2026 11:35:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: David Laight <david.laight.linux@gmail.com>,
 Julian Orth <ju.orth@gmail.com>
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
 <e0f687da-7323-40fc-af50-82abea6e25cc@linux.intel.com>
 <3c969254-ed38-4b13-84b3-5afa365b04cb@amd.com>
 <2b75199f-b78a-4915-8e75-5d186f63f7c5@mailbox.org>
 <CAHijbEXkn3+E_u1+aZgLT+pQ_vLYvKKv9VU_5kOuEaFheLRQeg@mail.gmail.com>
 <bc3417d9-d191-4cc7-95e0-968b0b9bec05@linux.intel.com>
 <CAHijbEXTPSLSADqet1=P1FV6jvoa5yGEprOuYtpQWUq_y5uT2A@mail.gmail.com>
 <c5e2cd1d-05a9-489a-be8a-be4d0d583688@mailbox.org>
 <CAHijbEWoQHTyj_V1dD9UWskPmz0WbrVwzPTD3XqJTczy1ojBnQ@mail.gmail.com>
 <d90d6eb3-72bc-4502-934d-f77dac83690d@mailbox.org>
 <88726fec-3bbb-4ca8-b724-c281b5696324@linux.intel.com>
 <CAHijbEUJkZHw4DeE4wmeD3dvEcnGXVqsHDg7QHHa6i=6LT38bQ@mail.gmail.com>
 <20260303195835.4c23be7a@pumpkin>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20260303195835.4c23be7a@pumpkin>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: E223A1FE706
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:ju.orth@gmail.com,m:michel.daenzer@mailbox.org,m:christian.koenig@amd.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:davidlaightlinux@gmail.com,m:juorth@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,amd.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:email]
X-Rspamd-Action: no action

Hey,

Den 2026-03-03 kl. 20:58, skrev David Laight:
> On Tue, 3 Mar 2026 18:44:59 +0100
> Julian Orth <ju.orth@gmail.com> wrote:
> 
>> On Tue, Mar 3, 2026 at 6:41 PM Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com> wrote:
>>>
>>> My point is that it works for old userspace without problems. It's only
>>> newly compiled userspace with new headers that will run into problems.
>>> The code as written would have continued to work, but if you update to
>>> the new header and don't initialise the new members then it's a userspace
>>> problem. It should not be worked around in the kernel, since it's newly
>>> written bad userspace code, not old bad userspace code that stopped working
>>> when the kernel changed.  
>>
>> But it's not newly written. The example is, say, 5 year old code. The
>> binary that was compiled 5 years ago works fine as you say. But if you
>> take the same code and just run gcc again, the new binary will no
>> longer work.
>>
> 
> Worse, the recompiled version may well work when you test it, and even
> when deployed.
> But you'll get non-obvious random failures - a support nightmare.

I believe in a lot of cases the headers are simply copied to the project,
so it will continue to work.

I don't see a difference between moving to a new compiler. Compiling code
from 5 years ago might also run into new compiler warnings that didn't
exist on the older version of the compiler.

> Probably best code is something like:
> 	case OLD_IOCTL_CODE:
> 		if (ioc->flag & NEW_FLAG)
> 			return -EINVAL;
> 		/* FALLTHROUGH *.
> 	case NEW_IOCTL_CODE:
> 		if (!(ioc->flag & NEW_FLAG))
> 			ioc->new_field = 0;
> 
>     David
Yeah, that is what we do by explicitly checking the size parameter. Any
undefined members are zero'd. If you define the new member in userspace,
you're also taking on the responsibility for having it contained defined
information, even if you only zero the struct.

Kind regards,
~Maarten Lankhorst
