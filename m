Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAD0Cm7Gl2lg8QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 03:26:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B51571643F6
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 03:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A7610E76C;
	Fri, 20 Feb 2026 02:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yd9jqYEb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC91C10E768
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 02:26:47 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-43591b55727so1525393f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 18:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771554406; x=1772159206; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pJloV9r3ybizJNpOABCJHtRr3/jWkPGIyeA16Sq8DIo=;
 b=Yd9jqYEb9ikPeki7zI0LdBCKqb0ueacLu6/9DfAIxNLFZiatyRPxeVucDfQWatVNWn
 duGna2gaPU+LbUct6DOMcR8OUHeh99V097e1d/7Q3+LnMCejKaFiCsTeY5Bdm+J7hPIr
 fGGk5pu9cdlARVZ7yTuNEhGsHIkgf0ryO8IU29godDxhkIxIE93w00Yo7R1Y/o8T1py6
 zXLqJ2AQdqmdBkvyvrGPPZ/NIYig/RWAqxMCJvtyW0pgkgIyARVQduMrQ042XhOx4NH3
 s/8osBi81MFolauD0FurYpY1WoNItJF2m6PW6xQalSth0GvpLrraUVeMLxzJmpnW9E9c
 f+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771554406; x=1772159206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pJloV9r3ybizJNpOABCJHtRr3/jWkPGIyeA16Sq8DIo=;
 b=rEWztOyigtQ4Z4bqzoDZvfkCNBiWbL49KD8N3OMAkpefnl9QY+gVIvOAqcB7yyOT+c
 DOzRzOlxHV/LLCsUgkboGl3hgkD2zsiltmcIzycDt94xloaYJUO3QHmkDDCNMhV3OYZw
 OWanR1aAUM7KsYYgGWBfhknPU0smeYf95WpCPLsC76h7/FdM++d6GJA/GlQ9pMuo7I2O
 MYNR/EC7xsQ8hhS4iSjuadkRGcYvk1suXkPjXohrxcfLFXOThfBFh2uXHBV7oJ32s1pO
 wTWOdKcBrk5z//Ctjc/Xfwf+W8BPEesN2Af6zbvU4kuSF8OPgegV8SuTCIBEwrAqB5dt
 p+bg==
X-Gm-Message-State: AOJu0Yw6v/lVcwW2V1UvHOwJvxiEfytt8mPTbd4+4qiGwhSbbK+aWb6i
 qJWjSd2T95yOa00FdG7jITQCVgz4RazqKgO70mJMzfs3eTYm6lgg/M84
X-Gm-Gg: AZuq6aIWhuQxsXWybtNZKZOg+ozlZdhf8CAQf4p+f0Jk5LJLXKs3duH/L1IxxO4Qqc4
 j0y+phMk3TTWatMl6OMO+P3Iqs4BhtDdTDhjhpnLo0wWM/Tg017ku7WWmwCpsDjYPo5Fcq7WGIx
 z6Cqdgv+HfWnRQTmOb/Cwy07saU6uu7cUPhxH8klqfALlktjykfH3XzIjtm0yx1tKlvtoJbdwpG
 S5dJGtKfRj1GEMY6DblKjbA+fOIvbILX8ngPzq21hURMi6SVTXyCKwVLT4yx23PIkikIdWRZDkq
 xG5q7HBcKmQfEP/KE8irlh7ORDZp/hX/dWkz+1JNXrxYgwxfg706C//IDgAhyjdkUn+NzAWr7l7
 NYEQbhci1MOkY+LtXWetIAqRIaz+o4JzvaqRNEjYA6gde3lb35o+wVEQe/31NKzuUqmpNT/5OKz
 ZY5GbQZD4xMvamg496ptb7L0HUEdd2qW6Fi83u5b60jo0DAUq5hfSqk8m+jLsB2K5IfE1MYi409
 63+9zU=
X-Received: by 2002:a05:6000:2601:b0:436:3707:2bfb with SMTP id
 ffacd0b85a97d-4379db934a8mr33089800f8f.34.1771554406141; 
 Thu, 19 Feb 2026 18:26:46 -0800 (PST)
Received: from Arch-Spectre.dur.ac.uk ([129.234.0.168])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ad0166sm53446975f8f.35.2026.02.19.18.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 18:26:45 -0800 (PST)
From: Yicong Hui <yiconghui@gmail.com>
To: christian.koenig@amd.com,
	michel.daenzer@mailbox.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Yicong Hui <yiconghui@gmail.com>
Subject: [RFC PATCH v2 2/3] drm/syncobj: Add
 DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR ioctl flag
Date: Fri, 20 Feb 2026 02:26:27 +0000
Message-ID: <20260220022631.2205037-3-yiconghui@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220022631.2205037-1-yiconghui@gmail.com>
References: <20260220022631.2205037-1-yiconghui@gmail.com>
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:yiconghui@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: B51571643F6
X-Rspamd-Action: no action

Add DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR ioctl flag for the
ioctls DRM_IOCTL_SYNCOBJ_WAIT and DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT, which
will make them abort their wait and return the error code and its
associated syncobj.

Suggested-by: Christian König <christian.koenig@amd.com>
Suggested-by: Michel Dänzer <michel.daenzer@mailbox.org>
Signed-off-by: Yicong Hui <yiconghui@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 25 +++++++++++++++++++++----
 include/uapi/drm/drm.h        |  1 +
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 322f64b72775..fb55fd46fb84 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1139,6 +1139,13 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 			if (!fence)
 				continue;
 
+			if ((flags & DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR) && fence->error) {
+				if (idx)
+					*idx = i;
+				timeout = fence->error;
+				goto done_waiting;
+			}
+
 			if ((flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE) ||
 			    dma_fence_is_signaled(fence) ||
 			    (!entries[i].fence_cb.func &&
@@ -1242,8 +1249,12 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
 							 wait->flags,
 							 timeout, &first,
 							 deadline);
-		if (timeout < 0)
+		if (timeout < 0) {
+			if (wait->flags & DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR)
+				wait->first_signaled = first;
+
 			return timeout;
+		}
 		wait->first_signaled = first;
 	} else {
 		timeout = drm_timeout_abs_to_jiffies(timeline_wait->timeout_nsec);
@@ -1253,8 +1264,12 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
 							 timeline_wait->flags,
 							 timeout, &first,
 							 deadline);
-		if (timeout < 0)
+		if (timeout < 0) {
+			if (timeline_wait->flags & DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR)
+				timeline_wait->first_signaled = first;
+
 			return timeout;
+		}
 		timeline_wait->first_signaled = first;
 	}
 	return 0;
@@ -1332,7 +1347,8 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 
 	possible_flags = DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
 			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
-			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
+			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE |
+			 DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR;
 
 	if (args->flags & ~possible_flags)
 		return -EINVAL;
@@ -1376,7 +1392,8 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 	possible_flags = DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
 			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
 			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE |
-			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
+			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE |
+			 DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR;
 
 	if (args->flags & ~possible_flags)
 		return -EINVAL;
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 2640cc0a09fe..bc958af5a910 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -977,6 +977,7 @@ struct drm_syncobj_transfer {
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time point to become available */
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE (1 << 3) /* set fence deadline to deadline_nsec */
+#define DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR (1 << 4) /* abort upon any fence failure return err */
 struct drm_syncobj_wait {
 	__u64 handles;
 	/* absolute timeout */
-- 
2.53.0

