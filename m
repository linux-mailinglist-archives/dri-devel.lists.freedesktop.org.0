Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFtwGqMbjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAAF128918
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED32410E6A5;
	Thu, 12 Feb 2026 00:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JWua1lSD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f68.google.com (mail-oa1-f68.google.com
 [209.85.160.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF17A10E685
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:15:06 +0000 (UTC)
Received: by mail-oa1-f68.google.com with SMTP id
 586e51a60fabf-409de4132b5so3579394fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855306; x=1771460106; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qT+1Jjuu0i1uSCRHq/WSFFBo6g2W6jJpvEHIrMJpdJM=;
 b=JWua1lSDguuS97lMSqc0emfhWDFSBFnnIGufcOdsoHEfMcvbQ2UCH51CRs1IbJRi0j
 lUB6IkwvmbZlL8i3plA7PqSZ40cTDrI/cFtCPBqGgDreWTsE4HWBfraJZWsC+P5+jZ8C
 rLspmAHvyTLjG3rDhZEpjmW5Rx1cIkoCyzGYu95OePwqZbLzwo/lk/0E9aioiAHF2M4d
 RNemGv1r8HKkJQPftQ/Clu3eUVxzv1wADRKw8Uex1el8Mko26aWTVRXaXFEGFzauEjqN
 /w8uYXYnUlZfDxvMjgWNY76NZu4O69kvO0DZS5JLPKz3mcdrBQ+QSjhlr+TGZ1jO5JBw
 zB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855306; x=1771460106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qT+1Jjuu0i1uSCRHq/WSFFBo6g2W6jJpvEHIrMJpdJM=;
 b=Eev1jLy+GqeCPMByrblkoXAwJrCnP1+UeazLBWnqx1I7lsBR7Nelk9hfXCE5HuTcZE
 EbtfqsM3bgxdqz7a7NpU5ZtN056GgO9Ibd4g5EqIFnvWrYiio8JNcqsnsh5fti9J88A1
 mKy6lF5qTx/c6rBX+EdHeiDsRv0qIlqXVtsdjPCc67bHw397hKFkZ38gLjjtW7+slCOZ
 y5qRwiuRpKkXFdK/TC+WJIyPcA/OkNBAC5KBI8OxOA2L6aqfO/FqCxY4JkG21Xa/QjIv
 PlCuJtSf+J+kHsd39PxaKvKrWd8r5e091S7n/wSMDUm+/wXUz/tnUXrB9DzXm84n6fLs
 /fWg==
X-Gm-Message-State: AOJu0YwVs++4jd9gHgGdRGBkmiabUJoaxes/aTmEFscnWKw9u8esi/oR
 XsqODvaSxb4fLjX5xhXWMIi6jIfMauobFRPvcsbQL5JAEGyC7I95G+eq5fgMtHDk
X-Gm-Gg: AZuq6aKH7QKrLYuRv9sy7HZCXIQvHgqfNVCKIYRVqTKTJo8RP8/k1Ek5woqA4vkKE2s
 Y5QgIoCFA0BUIA2bsOHNhvtinEnDe/PR0gLF3Fqv4AcYGRWmzDxSME+VKeX++U9BepeA1sN1Syl
 oPwng/b6KmcPQOkDXd2uTUuf+f4k9vcJQt5y2OpfrjEgylALvzvZb2WeNPhDKvmvJOE2uWjY3TU
 r5tOt8bEpBI+//3NEOjG5U+q+1hfB/rnGO2l8FD1IgMJ1CeY2eoycUv8BLxKHluymnRfX2115it
 EK/2rrcHgVUNTuBovvbWwJzC69Oh0ZNKNJjRN5VIYEwP/CjZWOaPoX3/pqruyAhaoloJmxnX9Zs
 GNpel6fqQN3eJ6vEEmswb0yL+ZRBVZFJkCqP2m004kKHLmwxpzIjCpvdAwoU4Q107UYwt42FE2v
 Ryrf4jO9F17Bpph4sGW1YsypIP0yLwdtZ8gcev+5Pvo0D6WcssLGIR
X-Received: by 2002:a05:6871:4181:b0:3e8:92a5:3287 with SMTP id
 586e51a60fabf-40ec6fb81c1mr646272fac.1.1770855305968; 
 Wed, 11 Feb 2026 16:15:05 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:15:05 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 51/61] drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
Date: Wed, 11 Feb 2026 17:13:46 -0700
Message-ID: <20260212001359.97296-52-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-51-jim.cromie@gmail.com>
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
 <20260212001359.97296-41-jim.cromie@gmail.com>
 <20260212001359.97296-42-jim.cromie@gmail.com>
 <20260212001359.97296-43-jim.cromie@gmail.com>
 <20260212001359.97296-44-jim.cromie@gmail.com>
 <20260212001359.97296-45-jim.cromie@gmail.com>
 <20260212001359.97296-46-jim.cromie@gmail.com>
 <20260212001359.97296-47-jim.cromie@gmail.com>
 <20260212001359.97296-48-jim.cromie@gmail.com>
 <20260212001359.97296-49-jim.cromie@gmail.com>
 <20260212001359.97296-50-jim.cromie@gmail.com>
 <20260212001359.97296-51-jim.cromie@gmail.com>
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
	FREEMAIL_CC(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1CAAF128918
X-Rspamd-Action: no action

The vkms driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index dd1402f43773..c0d9e7624bfe 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -39,6 +39,8 @@
 
 static struct vkms_config *default_config;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
-- 
2.53.0

