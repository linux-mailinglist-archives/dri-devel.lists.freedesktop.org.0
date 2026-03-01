Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DoeKRGWpWmPEQYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:52:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 021DB1DA245
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF7A10E4F5;
	Mon,  2 Mar 2026 13:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fGu1Nqsh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4305F10E1FE
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 12:36:01 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-48379a42f76so27955985e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 04:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772368560; x=1772973360; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7WTaNKvEWa7tYm/Uesjo1oABC1FIfYN68a3odoPwQR0=;
 b=fGu1Nqshr7f4TQDd5MjhBpv/6/b6tviA+kYSm0vstsvstgPJPzurDQp0XXp0Jl0qIr
 Z9PqilDT1KPO4W+0Y+Ce4rw+Z6VBfKLiUMcT+MW17RbsKELAM8uNrifPBR8C815ugRXJ
 aMmH7Kk7FT13V2zb7BiEg9MM0QooxoPdV6XWzkenjaw4rZPAlRZzH8chN584CEKQUfx8
 Y+xN/abPAkuoOEvExQbjk/zZ7mt7/7nNGQjmyFgPNh+0otQqX40XP6EBNvDqs5+BV8lv
 9hKvIdpe5bpr0EwQY3vWrk88r/N35thWDrmXYdoQoB/sPs9tJ8/MG0nTQuvrtEehS609
 ucwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772368560; x=1772973360;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7WTaNKvEWa7tYm/Uesjo1oABC1FIfYN68a3odoPwQR0=;
 b=bfD1YGmUhHIzlA/kHX+Y1BZPDQLCipVgiHNNMWNYLdrt3+igF4Sq81RCvxQr96ng2W
 Kk2aPdUB2oklA2hTUUp1bB9ZJPh5cR4uRY+44DevvLusyLuEgWWWjAcbMBRCPCEIIBil
 9gtQVENxCiC2fIio0/1g8XFupuD4TN17tsDe1pmmZHYaYRGdgQXWlYjSnb7Xb4NMnqng
 ZO3oisyu2Z0l/uX3ctXhJHxLUBpA23Ad3GpnegDH6ZoNCteCPcJB8hHYKKmuwSqedXCO
 FldDGMQlF1HETb4R2eWBPfWZAgGWgtnXs58FI2dTimwQoKO5LdEaqWLKurQ/dwZDUcjV
 X3Dw==
X-Gm-Message-State: AOJu0YwyhNgDfJwYVLETWRKbYvzFQZvEWO/Alca42Vxjq0KaOHp2dyXd
 I4LuVZW7paTs3X0KmsjW5QdxWgSgSBQ1vVNFcVhM3sdaD8aKDEBO0CUxmDE9nJCz
X-Gm-Gg: ATEYQzyC/scm0kkwv+g+fEIOAeUqFkdChbk5RD+gEbYo6Bk/NXPwU6faargHv6i6+kX
 mwpj9SSV0LoPjMN3JxOc3FtYhz8efTEhWv8+CZnFP4wU1iaIB3/WbIE5EISoX5KdEeoapOHVtNc
 YdlZY7YJ3jFmaCi6w73JtuzujuilyDqqmK2XeoNPfwFMkptAh6rQFRMxsMLAjZPromN1x8/6LYD
 /OAAhVH4yUrFGN45D0iLWL1dSoPfgeP1JIet0B4WDt3vwpI4p3gucsoweT6bPY7kEUH/ji01mvs
 TprYcm/Sqj7oULsIYKkMXOtbqJ+NMRB9/o8089v8aucssq1C2dJJngGJBNUVKktnflnN8CVt99h
 mi1kk8lrWyfF1qe4A2nEI390JTsUHJKQCOiwsHd16vDE7c3go3uTKOvaP22q8dMpqYYh2st0cG9
 ZeDLsIBbLXRQikr2ZGUsr9QY4WrfOa180MuvouLN/+YNu9dGbxWQHJZxWLgNgPaIuo/zyI0XvwT
 gdT++xEZN6yKp1w3g==
X-Received: by 2002:a05:600c:3b22:b0:477:a978:3a7b with SMTP id
 5b1f17b1804b1-483c9bff7b0mr143483095e9.22.1772368559454; 
 Sun, 01 Mar 2026 04:35:59 -0800 (PST)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70e8dasm21164286f8f.9.2026.03.01.04.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 04:35:58 -0800 (PST)
From: Julian Orth <ju.orth@gmail.com>
Date: Sun, 01 Mar 2026 13:34:42 +0100
Subject: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-point-v1-1-21fc5fd98614@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwND3YL8zLwSXRNjA9MkMxND8zRTUyWg2oKi1LTMCrA50bG1tQBQQD7
 ZVwAAAA==
X-Change-ID: 20260301-point-4305b6417f55
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Julian Orth <ju.orth@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772368557; l=2444;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=DxbNewEV8IlsHVmCvNU4nij2VG3FPWOYPR+kY3PZdN4=;
 b=Vd7rGo61uCU2Su434lAUNi/cf7rLnYloe2yqjADQSux9Rf1Rbp+z3OWwHNy0C+tkKHuiSY9zz
 mxyaUTh5cGBBd7fD5VGje0OUnt0doQYcxD6Bnix5vkWKehoBX6LMlRK
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=
X-Mailman-Approved-At: Mon, 02 Mar 2026 13:52:12 +0000
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[25];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:christian.koenig@amd.com,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:ju.orth@gmail.com,m:juorth@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,collabora.com,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 021DB1DA245
X-Rspamd-Action: no action

Consider the following application:

    #include <fcntl.h>
    #include <string.h>
    #include <drm/drm.h>
    #include <sys/ioctl.h>

    int main(void) {
        int fd = open("/dev/dri/renderD128", O_RDWR);
        struct drm_syncobj_create arg1;
        ioctl(fd, DRM_IOCTL_SYNCOBJ_CREATE, &arg1);
        struct drm_syncobj_handle arg2;
        memset(&arg2, 1, sizeof(arg2)); // simulate dirty stack
        arg2.handle = arg1.handle;
        arg2.flags = 0;
        arg2.fd = 0;
        arg2.pad = 0;
        // arg2.point = 0; // userspace is required to set point to 0
        ioctl(fd, DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD, &arg2);
    }

The last ioctl returns EINVAL because args->point is not 0. However,
userspace developed against older kernel versions is not aware of the
new point field and might therefore not initialize it.

The correct check would be

    if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
        return -EINVAL;

However, there might already be userspace that relies on this not
returning an error as long as point == 0. Therefore use the more lenient
check.

Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs")
Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
This patch fixes a regression that would cause conversions between
syncobj handles and fds to fail if userspace did not initialize a
recently-added field to 0.
---
 drivers/gpu/drm/drm_syncobj.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 250734dee928..49eccb43ce63 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -875,7 +875,7 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 		return drm_syncobj_export_sync_file(file_private, args->handle,
 						    point, &args->fd);
 
-	if (args->point)
+	if (point)
 		return -EINVAL;
 
 	return drm_syncobj_handle_to_fd(file_private, args->handle,
@@ -909,7 +909,7 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 							  args->handle,
 							  point);
 
-	if (args->point)
+	if (point)
 		return -EINVAL;
 
 	return drm_syncobj_fd_to_handle(file_private, args->fd,

---
base-commit: eb71ab2bf72260054677e348498ba995a057c463
change-id: 20260301-point-4305b6417f55

Best regards,
-- 
Julian Orth <ju.orth@gmail.com>

