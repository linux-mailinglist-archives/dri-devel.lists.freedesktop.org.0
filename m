Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cExZCBkPp2k0cwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:40:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA371F3F64
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0579D10E860;
	Tue,  3 Mar 2026 16:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qj26QLCC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F238910E860
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 16:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772556051; x=1804092051;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LFge7hCh8BNomYatHofqGMkYz9qIzaDpKU3qy29De2g=;
 b=Qj26QLCCS9dl10DRJxF7DNnrSRAPR4WFFfd0M1uAOSIt7Ak31j164/98
 TAFFgCWa0Yj5mThFJlEChVY4ggSNc7/0WGkxQ4pxbr1dwyI0d7ngDILoQ
 CYeGspdTW/5aNJ3SswQEGf0fdSJt5AL9PRzXatUc3d2Og1EBNmzJUixfp
 p1ZG2LSKM8OAaRuFDTs+WR9qgUi1h5UJdZspsdxVYyMpVXrKHAxxmiIx3
 NBkskcYY7sh2pv8AKyKbaG74kdIv4CJTp5gT3bG8WW0AwJpFe4ns0xFr8
 b4VbkiFxN2VuXrtrQDYZaXgCUJVfy/Yd3sKyPcITPZ/HoWIR1aZPEoTRS A==;
X-CSE-ConnectionGUID: 1KzMKUISQpigARnkKOxGhg==
X-CSE-MsgGUID: rEj/LUkYQ1qShjyR6gVG9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="61176207"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="61176207"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 08:40:48 -0800
X-CSE-ConnectionGUID: ztPfAseESfG+sREecl6Bpw==
X-CSE-MsgGUID: U8wakuLOQoav51u7TWpitA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="248543180"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.25])
 ([10.245.245.25])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 08:40:45 -0800
Message-ID: <bc3417d9-d191-4cc7-95e0-968b0b9bec05@linux.intel.com>
Date: Tue, 3 Mar 2026 17:40:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: Julian Orth <ju.orth@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
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
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <CAHijbEXkn3+E_u1+aZgLT+pQ_vLYvKKv9VU_5kOuEaFheLRQeg@mail.gmail.com>
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
X-Rspamd-Queue-Id: 4FA371F3F64
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
	FORGED_RECIPIENTS(0.00)[m:ju.orth@gmail.com,m:michel.daenzer@mailbox.org,m:christian.koenig@amd.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:juorth@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,mailbox.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Action: no action

Hey,

Den 2026-03-03 kl. 16:36, skrev Julian Orth:
> On Tue, Mar 3, 2026 at 4:29 PM Michel Dänzer <michel.daenzer@mailbox.org> wrote:
>>
>> On 3/3/26 15:59, Christian König wrote:
>>> On 3/3/26 15:53, Maarten Lankhorst wrote:
>>>> Hey,
>>>>
>>>> Den 2026-03-01 kl. 13:34, skrev Julian Orth:
>>>>> Consider the following application:
>>>>>
>>>>>     #include <fcntl.h>
>>>>>     #include <string.h>
>>>>>     #include <drm/drm.h>
>>>>>     #include <sys/ioctl.h>
>>>>>
>>>>>     int main(void) {
>>>>>         int fd = open("/dev/dri/renderD128", O_RDWR);
>>>>>         struct drm_syncobj_create arg1;
>>>>>         ioctl(fd, DRM_IOCTL_SYNCOBJ_CREATE, &arg1);
>>>>>         struct drm_syncobj_handle arg2;
>>>>>         memset(&arg2, 1, sizeof(arg2)); // simulate dirty stack
>>>>>         arg2.handle = arg1.handle;
>>>>>         arg2.flags = 0;
>>>>>         arg2.fd = 0;
>>>>>         arg2.pad = 0;
>>>>>         // arg2.point = 0; // userspace is required to set point to 0
>>>>>         ioctl(fd, DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD, &arg2);
>>>>>     }
>>>>>
>>>>> The last ioctl returns EINVAL because args->point is not 0. However,
>>>>> userspace developed against older kernel versions is not aware of the
>>>>> new point field and might therefore not initialize it.
>>>>>
>>>>> The correct check would be
>>>>>
>>>>>     if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
>>>>>         return -EINVAL;
>>>>>
>>>>> However, there might already be userspace that relies on this not
>>>>> returning an error as long as point == 0. Therefore use the more lenient
>>>>> check.
>>>>>
>>>>> Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs")
>>>>> Signed-off-by: Julian Orth <ju.orth@gmail.com>
>>>>
>>>> I'm not convinced this is the correct fix.
>>>> Userspace built before the change had the old size for drm_syncobj_create,
>>>> the size is encoded into the ioctl, and zero extended as needed.
>>>>
>>>> See drivers/gpu/drm/drm_ioctl.c:
>>>>      out_size = in_size = _IOC_SIZE(cmd);
>>>>      ...
>>>>      if (ksize > in_size)
>>>>              memset(kdata + in_size, 0, ksize - in_size);
>>>>
>>>> This is a bug in a newly built app, and should be handled by explicitly zeroing
>>>> the entire struct or using named initializers, and only setting specific members
>>>> as required.
>>>>
>>>> In particular, apps built before the change will never encounter this bug.
>>>
>>> Yeah, I've realized that after pushing the patch as well.
>>>
>>> But I still think this patch is the right thing to do, because without requesting the functionality by setting the flag the point should clearly not have any effect at all.
>>>
>>> And when an application would have only explicitly assigned the fields known previously and then later been compiled with the new points field it would have failed.
>>>
>>> It is good practice to memset() structures given to the kernel so that all bytes are zero initialized, but it is not documented as mandatory as far as I know.
>>
>> Even though it may not be documented, it is in fact mandatory. Otherwise it's not possible to safely extend ioctl structs in general.
> 
> The intention of the original patch was to ignore the args->points
> field if the flag is not set:
> 
>     if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE)
>         point = args->point;
> 
> Using args->point unconditionally later was therefore a mistake.
There is precedence in the ioctl, the pad member is checked against zero for the same reason.
The check was there because it is invalid to pass when IMPORT/EXPORT_SYNC_FILE was not set.

This is what I would recommend instead:

----
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 2d4ab745fdad9..176fac24a3198 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -857,7 +857,6 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 	struct drm_syncobj_handle *args = data;
 	unsigned int valid_flags = DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE |
 				   DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE;
-	u64 point = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		return -EOPNOTSUPP;
@@ -868,15 +867,14 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & ~valid_flags)
 		return -EINVAL;
 
-	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE)
-		point = args->point;
+	if (!(args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE) &&
+	    !(args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE) &&
+	      args->point)
+		return -EINVAL;
 
 	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
 		return drm_syncobj_export_sync_file(file_private, args->handle,
-						    point, &args->fd);
-
-	if (args->point)
-		return -EINVAL;
+						    args->point, &args->fd);
 
 	return drm_syncobj_handle_to_fd(file_private, args->handle,
 					&args->fd);
@@ -889,7 +887,6 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 	struct drm_syncobj_handle *args = data;
 	unsigned int valid_flags = DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE |
 				   DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE;
-	u64 point = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		return -EOPNOTSUPP;
@@ -900,17 +897,16 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & ~valid_flags)
 		return -EINVAL;
 
-	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
-		point = args->point;
+	if (!(args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE) &&
+	    !(args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE) &&
+	      args->point)
+		return -EINVAL;
 
 	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
 		return drm_syncobj_import_sync_file_fence(file_private,
 							  args->fd,
 							  args->handle,
-							  point);
-
-	if (args->point)
-		return -EINVAL;
+							  args->point);
 
 	return drm_syncobj_fd_to_handle(file_private, args->fd,
 					&args->handle);

