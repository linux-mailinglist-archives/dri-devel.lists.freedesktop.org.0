Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCDcLZYbjWm/zAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DC21288AD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E400F10E69A;
	Thu, 12 Feb 2026 00:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QcveR8Vg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f67.google.com (mail-oa1-f67.google.com
 [209.85.160.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C08610E69A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:14:57 +0000 (UTC)
Received: by mail-oa1-f67.google.com with SMTP id
 586e51a60fabf-409440b98b5so1582442fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855296; x=1771460096; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KknoaiukeGEe4An4ohd5M0Lm80HJakPdnmTQHwfgJnI=;
 b=QcveR8VggF2kCtKrN2ozSTbwpEne8nBqrmWXBW27xTkV7HouzQ3mcQjpbbLYCIKWDV
 0m2ZfxZAkAXJ68UxIsOl32bNnrHj7uBBx+K2nsBDLawJN+OSKl+1lqC+Ai2TFlrS+krB
 G0WkRW/bq//k/hEYymsPRMf6+PnjPnnwp4cZ821IrGrcAZTZDbkj6l0U9Jn9CVH10Ij2
 74044QrfSsEHeMYt8ft6z/SOShXmpsWzC0+7VWqTvpJi6WlHcMN5BOa66O+Gc3WTDd7s
 SF2nKNamPYa+KuL8kwwkS9Jd0kCecP3/5ONy9tQ0op2asxexnYrX3IaZL3ZTzBkCiIe0
 tTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855296; x=1771460096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KknoaiukeGEe4An4ohd5M0Lm80HJakPdnmTQHwfgJnI=;
 b=Zu8JujX9A5TMDskqEvfBfGrZF2B3edFp2q6OqsOV6xC2LwIpfv2weBHBQNY8Yl6Ibx
 un0DQTo75TFY68FXX+5ERSeEVTQ6ht5ADIhQbB/v0iauiNG8rF2spEFY+RkAJx2Lp4qL
 EkA7Ws0bhBxtq3Pz2YOv9WzurzrquZVcKFTF1wX9ccPAgzo/P0AT7/qNnOP7bO9Gx4gR
 gyGaBxshmTSMGo1IWDIr+FnNMZXJ1sLhgPoNdqbulu1zElIGaSN1Ptx8YF5ALGQqsPwm
 pTW5HvXTAxrpCeZ3Xwu4Y51sqU07yPEh1rOjUnkfqAfMnQOiTSsP9aBI7/UK138zkWfe
 8Hrg==
X-Gm-Message-State: AOJu0Yx2XEmReJPwNtqJZXcAfRFMvtqxA8rPlKm+rGCGgah9zPR2B3Tt
 D9VL6HTmTeq/6HIsJudXzKKeulZ/bpBfiIH0wIMt9A6SpIudzCaqYGpwE5yF9c6c
X-Gm-Gg: AZuq6aJ+WkI+k5gKTGiyuXaUaiGVxCwunCNrjXJNAO3d/TPABva29y+RnxdKwwX8WtJ
 Eeunu/GYfaACrTSY2AmjlxwceXrvkcZ9jlOWdna+14N8Atj6QKFZ9RRdAA3I736ThxqyfS/jpnH
 cLLVURLlSt0Vnck5hpcc5yp7kMidxxCzmtJLZGk6fioU4SZE7l+55K8fFz06e4Yq7M1MPfpDXFD
 rUCgBskfUq5mf0w6EHEBszb53t+3vwYRKYJwSi0hUQpOnH8mXf/ZIKD6CMRAQG+pE1voGr/DEaj
 x5VWAAHQGmtkEiIPnLtULCVjx66WUVYL0jgpk9xDzuFdkoKXzGHeTPYqlsB6w9g8x2ORW6WElDZ
 Tl+q+BCT4b5UisRi1P5FXQi2okpJcLj9CM06ZU15vpUPuitfrYai2XS9g5eALAJYt3r1jhq2CEu
 4Ai4lvyTGkGfESRZyfJu0VZRFesKPKMnRaV+lrY7p4R97hGuXHgNr/
X-Received: by 2002:a05:6871:283:b0:3f1:6d93:4386 with SMTP id
 586e51a60fabf-40eca030617mr303718fac.1.1770855296073; 
 Wed, 11 Feb 2026 16:14:56 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:55 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 40/61] drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
Date: Wed, 11 Feb 2026 17:13:35 -0700
Message-ID: <20260212001359.97296-41-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-40-jim.cromie@gmail.com>
References: <20260212001359.97296-1-jim.cromie@gmail.com>
 <20260212001359.97296-2-jim.cromie@gmail.com>
 <20260212001359.97296-3-jim.cromie@gmail.com>
 <20260212001359.97296-4-jim.cromie@gmail.com>
 <20260212001359.97296-5-jim.cromie@gmail.com>
 <20260212001359.97296-6-jim.cromie@gmail.com>
 <20260212001359.97296-7-jim.cromie@gmail.com>
 <20260212001359.97296-8-jim.cromie@gmail.com>
 <20260212001359.97296-9-jim.cromie@gmail.com>
 <20260212001359.97296-10-jim.cromie@gmail.com>
 <20260212001359.97296-11-jim.cromie@gmail.com>
 <20260212001359.97296-12-jim.cromie@gmail.com>
 <20260212001359.97296-13-jim.cromie@gmail.com>
 <20260212001359.97296-14-jim.cromie@gmail.com>
 <20260212001359.97296-15-jim.cromie@gmail.com>
 <20260212001359.97296-16-jim.cromie@gmail.com>
 <20260212001359.97296-17-jim.cromie@gmail.com>
 <20260212001359.97296-18-jim.cromie@gmail.com>
 <20260212001359.97296-19-jim.cromie@gmail.com>
 <20260212001359.97296-20-jim.cromie@gmail.com>
 <20260212001359.97296-21-jim.cromie@gmail.com>
 <20260212001359.97296-22-jim.cromie@gmail.com>
 <20260212001359.97296-23-jim.cromie@gmail.com>
 <20260212001359.97296-24-jim.cromie@gmail.com>
 <20260212001359.97296-25-jim.cromie@gmail.com>
 <20260212001359.97296-26-jim.cromie@gmail.com>
 <20260212001359.97296-27-jim.cromie@gmail.com>
 <20260212001359.97296-28-jim.cromie@gmail.com>
 <20260212001359.97296-29-jim.cromie@gmail.com>
 <20260212001359.97296-30-jim.cromie@gmail.com>
 <20260212001359.97296-31-jim.cromie@gmail.com>
 <20260212001359.97296-32-jim.cromie@gmail.com>
 <20260212001359.97296-33-jim.cromie@gmail.com>
 <20260212001359.97296-34-jim.cromie@gmail.com>
 <20260212001359.97296-35-jim.cromie@gmail.com>
 <20260212001359.97296-36-jim.cromie@gmail.com>
 <20260212001359.97296-37-jim.cromie@gmail.com>
 <20260212001359.97296-38-jim.cromie@gmail.com>
 <20260212001359.97296-39-jim.cromie@gmail.com>
 <20260212001359.97296-40-jim.cromie@gmail.com>
MIME-Version: 1.0
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,bootlin.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 35DC21288AD
X-Rspamd-Action: no action

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_crtc_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 39497493f74c..8d169a6d7053 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -50,17 +50,7 @@
 
 #include "drm_crtc_helper_internal.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 /**
  * DOC: overview
-- 
2.53.0

