Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8E1xHp0bjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED7B1288E6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014A810E6BE;
	Thu, 12 Feb 2026 00:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VE3nbpgz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9267A10E69F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:15:14 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-45e934bb51dso2181329b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855313; x=1771460113; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aTe1P/1av2l3o1DxK4yPXMvFpz4eZQngU8uqJXpCLxM=;
 b=VE3nbpgz2nOa1b55kQ1BbN4iPdG+7wk4KZct6Us8bDV5H7kOnr+ajRXfKeVCeoJkrt
 XQpLraXU14O916UkxFoT6K3/0EgvCPHf3qP8nHBuxZzXcUbMaafb7IvG8K2LREtQLy4M
 JXEyUrC8GSI5HlQcEpuJNinYSV+NBplFuh0cMrpsfFnhU4MxzpS6uJkmUSTdtQW5m9d1
 h3oxQrloOYcbF/YJDPs+/Nb7MVlwYCCcZi+oHJVTxvKFE+Y7yrFzwU1MiBbrkPsKWYB+
 vkm5RrekzF4En96cCI80AO0tiuGCKQHJlYHtSl5dN1pdUWe4sxbcsC2q0YJhjEm1FqUz
 4P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855313; x=1771460113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aTe1P/1av2l3o1DxK4yPXMvFpz4eZQngU8uqJXpCLxM=;
 b=JnhnKwZNF9/gmgztjYXHV7dxFl71WtCKYaOteXJz7DYpZmy5uR69+10+nm0T+Rqy64
 J7oi1z7M0aHlU6ACn/yChHMGb/mZfen9CLbbihdyTq7x0j0EUQCg/xdK4IjVcP/2wmNG
 X4DiD30m84PkIiCRNyvhz0b5nLeCrwFnyqK5VO1Pn3jzqChMHGWGR1wFf4hT11WiqjIO
 ufODfAZ/KzG9ORgf6+l2jKejOgHsFlo8fjVcwiss5zT2sXMdlpO860faLnFyr6P7d065
 m5C2a100kSGu31j87BKPPeYcueNzbHtz1gRTYUZ7+8XHcfMpP9oh/bPpbWoCeLrw9U8Q
 wTsA==
X-Gm-Message-State: AOJu0Ywi29IUK1nlhGKr8+Yk7nfz6adnsEdj8n0q2tTsheTtfFYGUyoA
 qnJ7auPdasfL3ImNZNIpuOpopynKTpKOMc7wAANT4vrDWlToJHDWVVZsEPbyLw==
X-Gm-Gg: AZuq6aJpOnN/CHnFy/HUix78nwh3na97cmw5SvOYxdKA7a+kCfBU5ubp3ZGqEcpA6uo
 YS8KE4nYenbC0TOwxG6FeWl54umjxAW1vrwP2KdwIrYtk8mSeKnaEQGSnTrVaOzc8KOVHHhrXNC
 Mri2kbQTJxqI81qqT3xK0FOaVJcMAFsER8ZTjOagozXaRCEjcdtbpOFH6WPYc2V3uRHNc7LiVoz
 MBotXZ8xqpoCTcPgnxgK5aZ1tKw2cI21QJ/zo5tgBsr4hljEgMjeqwIV4wzC4eckf33sy09Iju5
 ldH/Y9E+HCmR6j2Tozo1ccpCzKLIMCiXwV7crB1+qV/dHVrajHW5/PavW/x6FNRCxzAftfOe23a
 8tPhIWmlAmlCaix/ZNyltx8fFTVhwjYLWaeioK3u3W2EFSkJgyWv6vMOrrqZF+ysAGrVDOpesMF
 vKXawtmv9CDK75XkwiDAO4kSess/yahrWE3ee9Fhy/eXA/bYwaoXLX
X-Received: by 2002:a05:6808:191c:b0:45f:2719:32a0 with SMTP id
 5614622812f47-4637b87876fmr541031b6e.42.1770855313653; 
 Wed, 11 Feb 2026 16:15:13 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:15:13 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 58/59] accel: add -DDYNAMIC_DEBUG_MODULE to subdir-cflags - RFC
Date: Wed, 11 Feb 2026 17:13:54 -0700
Message-ID: <20260212001359.97296-60-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-59-jim.cromie@gmail.com>
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
 <20260212001359.97296-52-jim.cromie@gmail.com>
 <20260212001359.97296-53-jim.cromie@gmail.com>
 <20260212001359.97296-54-jim.cromie@gmail.com>
 <20260212001359.97296-55-jim.cromie@gmail.com>
 <20260212001359.97296-56-jim.cromie@gmail.com>
 <20260212001359.97296-57-jim.cromie@gmail.com>
 <20260212001359.97296-58-jim.cromie@gmail.com>
 <20260212001359.97296-59-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: 2ED7B1288E6
X-Rspamd-Action: no action

with DRM_USE_DYNAMIC_DEBUG=y now un-BROKEN,
accel/amdxdna gets macro breakage, with configs like:

   CONFIG_DRM_USE_DYNAMIC_DEBUG=y
   # CONFIG_DYNAMIC_DEBUG is not set
   CONFIG_DYNAMIC_DEBUG_CORE=y

DRM_USE_DYNAMIC_DEBUG is possible with just DYNAMIC_DEBUG_CORE, but
for this, dynamic_debug.h also requires -DDYNAMIC_DEBUG_MODULE before
the user gets the "real" macros, else its just the stubs.

drm/Makefile already adds -DDYNAMIC_DEBUG_MODULE to cflags for all the
drm/* drivers, do the same here.

NB: With the CONFIG_DRM_ACCEL items, accels are DRM modules.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/accel/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index 1d3a7251b950..20656e6d13a0 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+subdir-cflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += -DDYNAMIC_DEBUG_MODULE
+
 obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
 obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
-- 
2.53.0

