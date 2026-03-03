Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFEkF/71pmmgawAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:53:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635A01F1D39
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866C010E826;
	Tue,  3 Mar 2026 14:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A63110E826
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 14:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772549600; x=1804085600;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1nlvIYv5euBJa0bVyCRXrzDZb9Y+ArrL9TcHZkINM2Q=;
 b=dJYKl80nedQ0U5xqHR/HYIaNgN7OIrU3PaTogYrl7rb4vov0YEx7ofRi
 1y+TQoyC/ISy0I1dOXvcDFr6zLh69ebUia/72QKp2HgHYC2tvzNneizOt
 O46rFzW6Dq7LIgzzgRA+Y1eKWLKp9NLI54d0ezkM6BIaBQMWlwSiJ5G96
 wzLwFZn+SlyX5d3VjoNqi/JDm55pNYaR653eYOicd2rs+3y52K+PfsTY8
 PQdOI4ZSFtG2wAEbd/Xj/n8it0UzlHjR9cV07S8EfIixDau3FH9xWMCtp
 4kF3Bm67ANb9wHqa5WFTn2eHeW0ywFo9O1TLcSqhFKPTxcjdrBZ9pPVU+ A==;
X-CSE-ConnectionGUID: LFK/vCbsSNKIcIBqNMUw5g==
X-CSE-MsgGUID: 9ontS/rrR2a7I5N1fQBJrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="91159154"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="91159154"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 06:53:10 -0800
X-CSE-ConnectionGUID: /lkztj10RNer0pf/lSSpkQ==
X-CSE-MsgGUID: 5yHmc7wZQu684QHMtFrPyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="241031263"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.25])
 ([10.245.245.25])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 06:53:07 -0800
Message-ID: <e0f687da-7323-40fc-af50-82abea6e25cc@linux.intel.com>
Date: Tue, 3 Mar 2026 15:53:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: Julian Orth <ju.orth@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20260301-point-v1-1-21fc5fd98614@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: 635A01F1D39
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ju.orth@gmail.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:christian.koenig@amd.com,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:juorth@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,suse.de,ffwll.ch,amd.com,collabora.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:?];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DMARC_DNSFAIL(0.00)[intel.com : query timed out];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.779];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_TEMPFAIL(0.00)[intel.com:s=Intel];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid]
X-Rspamd-Action: no action

Hey,

Den 2026-03-01 kl. 13:34, skrev Julian Orth:
> Consider the following application:
> 
>     #include <fcntl.h>
>     #include <string.h>
>     #include <drm/drm.h>
>     #include <sys/ioctl.h>
> 
>     int main(void) {
>         int fd = open("/dev/dri/renderD128", O_RDWR);
>         struct drm_syncobj_create arg1;
>         ioctl(fd, DRM_IOCTL_SYNCOBJ_CREATE, &arg1);
>         struct drm_syncobj_handle arg2;
>         memset(&arg2, 1, sizeof(arg2)); // simulate dirty stack
>         arg2.handle = arg1.handle;
>         arg2.flags = 0;
>         arg2.fd = 0;
>         arg2.pad = 0;
>         // arg2.point = 0; // userspace is required to set point to 0
>         ioctl(fd, DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD, &arg2);
>     }
> 
> The last ioctl returns EINVAL because args->point is not 0. However,
> userspace developed against older kernel versions is not aware of the
> new point field and might therefore not initialize it.
> 
> The correct check would be
> 
>     if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
>         return -EINVAL;
> 
> However, there might already be userspace that relies on this not
> returning an error as long as point == 0. Therefore use the more lenient
> check.
> 
> Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs")
> Signed-off-by: Julian Orth <ju.orth@gmail.com>

I'm not convinced this is the correct fix.
Userspace built before the change had the old size for drm_syncobj_create,
the size is encoded into the ioctl, and zero extended as needed.

See drivers/gpu/drm/drm_ioctl.c:
	out_size = in_size = _IOC_SIZE(cmd);
	...
	if (ksize > in_size)
		memset(kdata + in_size, 0, ksize - in_size);

This is a bug in a newly built app, and should be handled by explicitly zeroing
the entire struct or using named initializers, and only setting specific members
as required.

In particular, apps built before the change will never encounter this bug.

Kind regards,
~Maarten Lankhorst
