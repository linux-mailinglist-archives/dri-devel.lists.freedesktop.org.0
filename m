Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CAZGG96pWm6CAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:54:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7621D7E7A
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC8A10E259;
	Mon,  2 Mar 2026 11:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="QKlP1oVh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D8C10E259
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 11:54:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772452448; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Qx/U5d4zq7OZvOUj4nlRjuBjA9abva6SrJxP0+mVkysUsjhh7cCjJhtiX0SjUffR/yuPSiN86DyYNxJ2eEQ7lui7Via1USBzmcoydPSwu+ijfwl1Vp8Rei9QBGbnzEHnlG/nGQVnh5Km+kGKkfNkBERuaa16P3vf9GR5OI8jn+0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772452448;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=c7A0Webn6wO6R8jzqBsp6CdmNMvKUwy5JtEAW5UOr2k=; 
 b=dqPoNkBdQl6fJndO5XkV9sNFLGGM/Oc7qLYAdKNkL3UmJ1r2kJ8Iwf3XPGIrJkOt43pHMsHeh/+0qudryIUWhLNAT4VgeAC2L1IItAU1JRlrgtI+MAcKFgdNqmfrAsPdvIF/Oydii4L+aWted6TnT2AmiMaP8mtF0afpLBy3I+0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772452448; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=c7A0Webn6wO6R8jzqBsp6CdmNMvKUwy5JtEAW5UOr2k=;
 b=QKlP1oVhpUWft7FxPnXrl4uDChBo47m90bQjs+HdIExuFiqYCEY1RNGf3zMKnoiB
 hA6eC8qciAD2CgYUTFDuaFQXMQSxZOw2YvzCqDxHtVvMuHq09LcwqEFSip6DQZf7o/r
 yOrFtmKkQBE297fBqIwVG/1E9n/QvHRMAt6rKdtA=
Received: by mx.zohomail.com with SMTPS id 17724524465011020.2808739219737;
 Mon, 2 Mar 2026 03:54:06 -0800 (PST)
Message-ID: <75cdb128-2928-43e1-9a7f-e3c4dc40ee1b@collabora.com>
Date: Mon, 2 Mar 2026 14:54:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Julian Orth <ju.orth@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
 <93f2c5b5-4f5e-46f1-a7f3-c388ab762592@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <93f2c5b5-4f5e-46f1-a7f3-c388ab762592@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:ju.orth@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:juorth@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,oss.qualcomm.com];
	FORGED_SENDER(0.00)[dmitry.osipenko@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DA7621D7E7A
X-Rspamd-Action: no action

On 3/2/26 14:27, Christian König wrote:
> On 3/1/26 13:34, Julian Orth wrote:
>> Consider the following application:
>>
>>     #include <fcntl.h>
>>     #include <string.h>
>>     #include <drm/drm.h>
>>     #include <sys/ioctl.h>
>>
>>     int main(void) {
>>         int fd = open("/dev/dri/renderD128", O_RDWR);
>>         struct drm_syncobj_create arg1;
>>         ioctl(fd, DRM_IOCTL_SYNCOBJ_CREATE, &arg1);
>>         struct drm_syncobj_handle arg2;
>>         memset(&arg2, 1, sizeof(arg2)); // simulate dirty stack
>>         arg2.handle = arg1.handle;
>>         arg2.flags = 0;
>>         arg2.fd = 0;
>>         arg2.pad = 0;
>>         // arg2.point = 0; // userspace is required to set point to 0
>>         ioctl(fd, DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD, &arg2);
>>     }
>>
>> The last ioctl returns EINVAL because args->point is not 0. However,
>> userspace developed against older kernel versions is not aware of the
>> new point field and might therefore not initialize it.
>>
>> The correct check would be
>>
>>     if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
>>         return -EINVAL;
>>
>> However, there might already be userspace that relies on this not
>> returning an error as long as point == 0. Therefore use the more lenient
>> check.
>>
>> Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs")
>> Signed-off-by: Julian Orth <ju.orth@gmail.com>
> 
> Good catch, Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> As long as nobody objects I'm going to push this to drm-misc-fixes later today.

No objections, thanks

-- 
Best regards,
Dmitry
