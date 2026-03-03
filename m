Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFzWEWDDpmn3TQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 12:17:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B17D31EDA07
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 12:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9D210E04B;
	Tue,  3 Mar 2026 11:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Gc5wS6iA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9AF10E04B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 11:17:46 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fQCvV5tTZz9tdm;
 Tue,  3 Mar 2026 12:17:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772536662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3K6W7oNK2OPo9cE9jIdVYJw+yMU/74yDhidybo+WdvY=;
 b=Gc5wS6iA3yK40Um32L6I5Vqaw+WsG9rNDbJCv0l0EERQ+6AgB8vcw5kyD/U9Uh3bCZYZy+
 7TZWPWUNftZOcpZUijMaHglkCKAyweGXXIW97PKyW9+Th4RGbKFf5uJqF0kZwqodm1wQZR
 hnVqCJI0+HiQ3PgRGn+Tp5IbD91bKxM6mOM65UwLtGNFPiJN1H1g1YUgiYJNpc77GLqiiI
 nk73K26NqWIbFbufHFRzYAVL0VwBrFp+72dahAb8+y0Iylddo/aFzUBo2fbtDYfwzsRabo
 LCfV1USbsvJn23M1C8VooQMDmHib7urU9FdcQ1WLrCWgv+/OfgiKoSPp2US/Mw==
Message-ID: <637a138f-ee6f-4940-843f-0ec873997de3@mailbox.org>
Date: Tue, 3 Mar 2026 12:17:37 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: Julian Orth <ju.orth@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20260301-point-v1-1-21fc5fd98614@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2b5b15e3f77313718bf
X-MBO-RS-META: 141euosyqzsi38o548x9147ak5obqgqo
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
X-Rspamd-Queue-Id: B17D31EDA07
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ju.orth@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:christian.koenig@amd.com,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:juorth@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,amd.com,collabora.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/1/26 13:34, Julian Orth wrote:
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
> ---
> This patch fixes a regression that would cause conversions between
> syncobj handles and fds to fail if userspace did not initialize a
> recently-added field to 0.

While I don't object to this change, I'd argue that this is really a workaround for broken user space, not a fix for a kernel regression.

User space must initialize the full struct to 0, except for the fields it wants to have other values. This kind of kernel-side workaround for neglecting that won't be possible in all cases.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
