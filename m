Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAVAOTEdp2kUeAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:41:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE871F4C02
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED8C10E0AB;
	Tue,  3 Mar 2026 17:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZLhX24f+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA51D10E86A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 17:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772559660; x=1804095660;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KrS08w0c+cWlr7a6Ai+aVzpbCdyAH1bR2Srd/74O8cY=;
 b=ZLhX24f+la9sGRlmfq8rK6ALQWEb5Dfr7dPFdBgZnHtARctThex9Bea0
 XWTPjI4iR0oI1oPxZTXC8UeqLYJHnePT7bMp2ys7FpZeJJx8Zrxtra2xH
 qrM9XU9LbDBrS+H0aUwJkvhvPFc2HHOFfwz1/yZdWEhHqv68YVgSXTkq3
 Ln9Zr3YqPh1p2k5aQsegaEomxAf8kNZJr/UyQ7M77ZL/JZK7MDc1kBfMj
 rHpoRUJIcEVO8uOZsckY38elvvLX+XGSu9/xcesmzeXCVhsxRxZtLpV3W
 dIIY5fdJvy9raSSfszF0SPsE/lvUI8eN3SG9I36bhx5sR0j9YMLDvgFPQ Q==;
X-CSE-ConnectionGUID: lj1XVY6zQ+qJuQ9SPUNQyg==
X-CSE-MsgGUID: LANWzYieRdKwip1jcTFa4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="76208994"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="76208994"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 09:40:58 -0800
X-CSE-ConnectionGUID: 3fSIjPObS/y/zsGv8lguAA==
X-CSE-MsgGUID: epnrKxTXS7m1J9YoOpsO4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="217237522"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.106])
 ([10.245.245.106])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 09:40:55 -0800
Message-ID: <88726fec-3bbb-4ca8-b724-c281b5696324@linux.intel.com>
Date: Tue, 3 Mar 2026 18:40:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Julian Orth <ju.orth@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <d90d6eb3-72bc-4502-934d-f77dac83690d@mailbox.org>
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
X-Rspamd-Queue-Id: 3FE871F4C02
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:ju.orth@gmail.com,m:christian.koenig@amd.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:juorth@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[mailbox.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,mailbox.org:email]
X-Rspamd-Action: no action



Den 2026-03-03 kl. 18:18, skrev Michel Dänzer:
> On 3/3/26 18:11, Julian Orth wrote:
>> On Tue, Mar 3, 2026 at 6:04 PM Michel Dänzer <michel.daenzer@mailbox.org> wrote:
>>> On 3/3/26 17:54, Julian Orth wrote:
>>>> On Tue, Mar 3, 2026 at 5:40 PM Maarten Lankhorst
>>>> <maarten.lankhorst@linux.intel.com> wrote:
>>>>>
>>>>> There is precedence in the ioctl, the pad member is checked against zero for the same reason.
>>>>
>>>> I don't believe that this is comparable. Developers of code developed
>>>> against an older kernel could look at the kernel and see that the pad
>>>> field was checked against zero. They could not see the same for fields
>>>> that didn't exist at the time.
>>>
>>> "Initialize only known fields" isn't a valid approach here. The full struct must be initialized to 0, including any fields added in the future.
>>
>> It worked from the introduction of the ioctl until the new field was
>> added. How could anyone know about this requirement if it is not
>> documented? Some people might not even know that ioctl numbers encode
>> the size of the argument and therefore assume that the argument
>> structure is fixed. I think this is quite different from syscalls such
>> as clone3 which make the size argument explicit and where it can be
>> expected that the developer knows that the struct might grow when the
>> application is recompiled.
>>
>> The new flag was added so that userspace can detect older kernels that
>> don't support the point field, such kernels return EINVAL when they
>> see the new flag.
>> Then why should the kernel not also use the absence of the flag to
>> detect older userspace that might be unaware of the point field?
> 
> I wrote in my first post in this thread that I don't object to your patch, so you can relax and stop trying to convince me not to object to it. :)
> 
> 
> I'm just pointing out that this is working around broken user-space code, and that there are other similar cases where that kind of broken users-space code couldn't be worked around in the kernel, so it's better to also fix the user-space code anyway.


My point is that it works for old userspace without problems. It's only
newly compiled userspace with new headers that will run into problems.
The code as written would have continued to work, but if you update to
the new header and don't initialise the new members then it's a userspace
problem. It should not be worked around in the kernel, since it's newly
written bad userspace code, not old bad userspace code that stopped working
when the kernel changed.
