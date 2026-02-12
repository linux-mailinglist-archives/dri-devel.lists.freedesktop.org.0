Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPs1OaAbjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6CB128902
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6380A10E6CF;
	Thu, 12 Feb 2026 00:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xwu+yIAJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95CB10E6A7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:15:18 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-40ea611d1a4so641769fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855317; x=1771460117; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ma282zBp0PhyvwmBTk3bIXK8GNy4w8UDFOlpiRePBAY=;
 b=Xwu+yIAJGgvZoPOtqmT8kZa8IaSiot/AmpcCOzq/7KM6t1GNMY/JITI2aZub4FWEIs
 Az7BRrn4UKznECIMeN5FHYpVKbGrWk0aL3MhnxyY36Ix5O1h+LYnKnuZuSUTnlLrZKp2
 o4p303PoChgzf6YcO8HbKKxj9sovD6qUQEHscvO8E8zem293BkiFoso3f/Z8u0dR2bK3
 tdvsNEq7wsuoC3SWfLVMedEUQqlPLoYm7gbQ6R1QDMOgOHwYlgr80qSwVofoGVGM3j/g
 R9I1qOCISdhkZgqGWwMqqNxiHtd9XnNr8D7bZ5U0NWM/96iUOYl/jxr0fQOftIcrDEr9
 LYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855317; x=1771460117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ma282zBp0PhyvwmBTk3bIXK8GNy4w8UDFOlpiRePBAY=;
 b=dqpfTT4Q0U9Vs0wD+XMGND5EfuzWJIbFbjH/2Hw7AVtEI8iHL9TLM5C2ZCsaTLBRI2
 tHfNtq7u0ajwPes7+8fcnPHjUXv9USPBaUwlWJzVb865JAp4b3hRrG5aHCzDJyWunhcg
 qsB4/vMBdoyGhvDobkoKROVxkn2vfcFbZLvqx9wn1VpCUQTrVBZQ0vvSD/EVNeG/t7HQ
 WRur+Xkbi+eDiTvwtxC+aK6mnSraUFKR9aNNcFw4SvGJURrBdy1nRfyrCpOCULk7GXL0
 6XGd5DIuNeDUyaL2P/BUvHLOq8Mbbcnng2CdOo1s6Nf+s7h3Q8BU8KAf7JJy09vPyymv
 IpOQ==
X-Gm-Message-State: AOJu0YwSwr2GqXg7DROmeIkU3q3w0W6rnXALrbrKuJncgOrCYsuWZEll
 I4gsH5uKUnHf1JOtij7c/CdKds1yJdJ/DunJ/0PQp3GW2Rc4weRcCccUoOG3Nw==
X-Gm-Gg: AZuq6aI0rkR1xD5RHjVcX+GTrVxU8LUg8kuos7m6OkkyFmAIDEfyb8zxRRv0hf4SO4M
 nMjgLo+AIk08oB4H9S/UDzr37nRu8ZxqNEHn8NCxE7GHxAmqbGWpcuel7X38O8UvimXvcawPlZr
 +zxauhDj8DJlmJZc8zd+tOjr8wbyZsSongPklX9u8fmeyK5ASYJor1HDoiipP/Ol3dgiyhHamgc
 3ndVsAFtEcaXrVqyDHJfOn8FSb1FnvJQGxU3A/Q5Wi3cKq7aMV7nJ6Y1hJDeKo8WXaApnRm0RiU
 Usg/UREoRTufXubBqcStvYhuDAjgiuLZSP+mcz9WyHR71xWmkrA64oMZAfxu1aeV+O8uOC+J5VE
 3f2YLMdoJdcu7Fi0oloKtiuzMhscyoB03zXWoHXg7X6WV1U/Yii6xyg4PcvxV7h+oaunTczbZqJ
 MRrD4yWEn+9cf2F6qUS3BwPuvae0svLlhXzKrgqwiKQMxDIDtv5ymH
X-Received: by 2002:a05:6870:2104:b0:40a:4391:6821 with SMTP id
 586e51a60fabf-40ec6fc554emr531865fac.26.1770855317465; 
 Wed, 11 Feb 2026 16:15:17 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:15:16 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 61/61] accel/rocket: enable drm.debug control
Date: Wed, 11 Feb 2026 17:13:58 -0700
Message-ID: <20260212001359.97296-64-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-63-jim.cromie@gmail.com>
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
 <20260212001359.97296-60-jim.cromie@gmail.com>
 <20260212001359.97296-61-jim.cromie@gmail.com>
 <20260212001359.97296-62-jim.cromie@gmail.com>
 <20260212001359.97296-63-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: 6B6CB128902
X-Rspamd-Action: no action

rocket.ko has several drm*dbg() calls, it must call DRM_CLASSMAP_USE
to tell dynamic-debug what classmap enables them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/accel/rocket/rocket_gem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index 624c4ecf5a34..5e0f8ac07ab8 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -11,6 +11,8 @@
 #include "rocket_drv.h"
 #include "rocket_gem.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static void rocket_gem_bo_free(struct drm_gem_object *obj)
 {
 	struct rocket_gem_object *bo = to_rocket_bo(obj);
-- 
2.53.0

