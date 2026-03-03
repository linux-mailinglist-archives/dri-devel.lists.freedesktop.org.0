Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF5FKXn+pmk7bgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:30:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D091F2A3C
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64C910E072;
	Tue,  3 Mar 2026 15:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="FCcSq/zY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000CA10E072
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 15:29:50 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fQKVJ4lC8z9vBx;
 Tue,  3 Mar 2026 16:29:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772551784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pM6lNqsskE7KRAVsbcEdawR3cIC0eusGPaA5IKKWiUM=;
 b=FCcSq/zY8HUNqE6/6wNjHi9mudJ1YuJjnHHQGEYFApLeUcKnfB5YkSjrLi/UXXAp8/PzEJ
 04+P+4tgaykBrA/M8PNL6vKd6cTgsttz6xtyCsgoE+yTAq3Oc/GuFLF7OeQrt9AaqhTvR8
 o8OFSfTOSHQbqC0K/HVLW3PtwbXB/cxjE5txQ1KfV3k+q9g9dlbUZjb+1Q39/EQtilAXk+
 lvxZnJwuaetXhdhg+MBh4fv8X8JuF8p3b034TKs5vj9jW7pDUMpo8u5PMjAPzzcId0UQwG
 TcynDsutRTXXmnzSUQzfWAqyLZioQvxH9i4F3EjZTb2Vek+bTvAXUu558E6BMg==
Message-ID: <2b75199f-b78a-4915-8e75-5d186f63f7c5@mailbox.org>
Date: Tue, 3 Mar 2026 16:29:35 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Julian Orth <ju.orth@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
 <e0f687da-7323-40fc-af50-82abea6e25cc@linux.intel.com>
 <3c969254-ed38-4b13-84b3-5afa365b04cb@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <3c969254-ed38-4b13-84b3-5afa365b04cb@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a6d17d73f2ec7df31ed
X-MBO-RS-META: p49ack64wm7b6753dknkbui9359mtx3c
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
X-Rspamd-Queue-Id: A3D091F2A3C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:ju.orth@gmail.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:juorth@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,linux.intel.com,gmail.com,kernel.org,suse.de,ffwll.ch,collabora.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/3/26 15:59, Christian König wrote:
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

Even though it may not be documented, it is in fact mandatory. Otherwise it's not possible to safely extend ioctl structs in general.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
