Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJ95MCz7pmltbwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:15:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAF21F24E4
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0916110E82E;
	Tue,  3 Mar 2026 15:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lKm3jC6e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D029C10E829
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 15:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772550952; x=1804086952;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iN14tmk/LeqeMLATUqWDvPQDeVABVHnUxh5ifvTVHIg=;
 b=lKm3jC6erR8ycnajuttBGGHeXon93CDo76sTJWnhLLkBp/a+PkRDsxtw
 V77nHBRR0AbxGJ1mYju5vDlPdMOzX951Aav8DWCLjbEmoPzLwHnR6ilnW
 U1a6DHHNliavt58tQlmBYW6/YoyEf+0nbcTKf19FFpOwTiiktJIPWV4aH
 a8ILdsfBmSZn3wW0As5P9ZlFab3u3GY2SA0midQyU6xH05NkrtXM9GfXJ
 nQJrA/VHbuEpqRjM1Sm9o7+FdQq3SEjM4xD8FbDYSDz2qftX7cl0dXt0/
 yAXAwtMmdJ3Q8XzjfpGf/SWkFuGp7YRd+cKDg0KtNz8v2JMGNd47a0uZv Q==;
X-CSE-ConnectionGUID: 9e9wlaDRQxKmyKCMsuXxQg==
X-CSE-MsgGUID: m98FjDVfTraEEuHXAXomMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="72791972"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="72791972"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:15:51 -0800
X-CSE-ConnectionGUID: HWFJ/aNXS2G4wsURjA49pQ==
X-CSE-MsgGUID: RFX4PN3oROaNTXai2Qyf+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="218002524"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.25])
 ([10.245.245.25])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:15:49 -0800
Message-ID: <5a816b1b-fae3-42d9-95eb-b1706a91d138@linux.intel.com>
Date: Tue, 3 Mar 2026 16:15:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Julian Orth <ju.orth@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
 <e0f687da-7323-40fc-af50-82abea6e25cc@linux.intel.com>
 <3c969254-ed38-4b13-84b3-5afa365b04cb@amd.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <3c969254-ed38-4b13-84b3-5afa365b04cb@amd.com>
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
X-Rspamd-Queue-Id: ACAF21F24E4
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
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:ju.orth@gmail.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:juorth@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,kernel.org,suse.de,ffwll.ch,collabora.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim]
X-Rspamd-Action: no action

Hey,

Den 2026-03-03 kl. 15:59, skrev Christian König:
> On 3/3/26 15:53, Maarten Lankhorst wrote:
>> Hey,
>>
>> Den 2026-03-01 kl. 13:34, skrev Julian Orth:
>>> Consider the following application:
>>>
>>>     #include <fcntl.h>
>>>     #include <string.h>
>>>     #include <drm/drm.h>
>>>     #include <sys/ioctl.h>
>>>
>>>     int main(void) {
>>>         int fd = open("/dev/dri/renderD128", O_RDWR);
>>>         struct drm_syncobj_create arg1;
>>>         ioctl(fd, DRM_IOCTL_SYNCOBJ_CREATE, &arg1);
>>>         struct drm_syncobj_handle arg2;
>>>         memset(&arg2, 1, sizeof(arg2)); // simulate dirty stack
>>>         arg2.handle = arg1.handle;
>>>         arg2.flags = 0;
>>>         arg2.fd = 0;
>>>         arg2.pad = 0;
>>>         // arg2.point = 0; // userspace is required to set point to 0
>>>         ioctl(fd, DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD, &arg2);
>>>     }
>>>
>>> The last ioctl returns EINVAL because args->point is not 0. However,
>>> userspace developed against older kernel versions is not aware of the
>>> new point field and might therefore not initialize it.
>>>
>>> The correct check would be
>>>
>>>     if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
>>>         return -EINVAL;
>>>
>>> However, there might already be userspace that relies on this not
>>> returning an error as long as point == 0. Therefore use the more lenient
>>> check.
>>>
>>> Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs")
>>> Signed-off-by: Julian Orth <ju.orth@gmail.com>
>>
>> I'm not convinced this is the correct fix.
>> Userspace built before the change had the old size for drm_syncobj_create,
>> the size is encoded into the ioctl, and zero extended as needed.
>>
>> See drivers/gpu/drm/drm_ioctl.c:
>> 	out_size = in_size = _IOC_SIZE(cmd);
>> 	...
>> 	if (ksize > in_size)
>> 		memset(kdata + in_size, 0, ksize - in_size);
>>
>> This is a bug in a newly built app, and should be handled by explicitly zeroing
>> the entire struct or using named initializers, and only setting specific members
>> as required.
>>
>> In particular, apps built before the change will never encounter this bug.
> 
> Yeah, I've realized that after pushing the patch as well.
> 
> But I still think this patch is the right thing to do, because without requesting the functionality by setting the flag the point should clearly not have any effect at all.
> 
> And when an application would have only explicitly assigned the fields known previously and then later been compiled with the new points field it would have failed.
> 
> It is good practice to memset() structures given to the kernel so that all bytes are zero initialized, but it is not documented as mandatory as far as I know.
I know that in case of xe, even padding members are tested for being zero. For new code it's
explicitly recommended to test to prevent running into undefined behavior. In some cases
data may look valid, even if it's just random garbage from the stack.

Is it too late to revert?

Kind regards,
Maarten Lankhorst
