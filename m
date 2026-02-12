Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDRpK5QbjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6382112889F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6683510E69C;
	Thu, 12 Feb 2026 00:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EK+EsNQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C69D10E689
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:15:03 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id
 5614622812f47-45efe81556fso4921473b6e.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855302; x=1771460102; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZVrblI6NrsYbkIQp0W5Gw6mbPjdgoChLjYQ3GjjJpJs=;
 b=EK+EsNQ+aSefxbuz79NtzprXZVpzgrtiTn2eDjbUEA42tDDdFFQjnhxRqOonXfbmyc
 1W2Qwe1SbOUBSwoWrHluH7gOWLt6VCCRv8v4T6xEHgqeSZThrIl7XKQS93VIVcXKY8fZ
 RZPu9Lj52mJA2y5tmqWhZjZJt53JUfMN1w8eYE51qghtfv9xyINeJBxnawCCLtcM5QBo
 oW2+OnrudH/jQN1rwdfe3LxL98aHTJOKGG3tt+Ee9iFCgMCpFptLPG63oXqIcGCOnOPe
 t+ILiGDygxx04AeRz7mLltSQuoka4f+YECrHR33tcxMX2EsWvguIHqG5zHOwtQsEfZqp
 jVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855302; x=1771460102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZVrblI6NrsYbkIQp0W5Gw6mbPjdgoChLjYQ3GjjJpJs=;
 b=Y4VeW5QyHHVuIE6HYTzrOb4L82xInADgg1mgGWwscXEr9uLiSdBvH3K+VqudpPxB48
 G884oUJOINGcMntFjPYw3zSttc3JumX8aSmB3rJK6EFSZfxzCcN/XZl4J0j/9akji8KJ
 IZouQ0w3hVPLHQAyBvIjEckxdaBv9yv/w55er3A/XUwYstIMHnjOG9fTrsivRtQmOn82
 K2yYrZbKur8R6fACkKV5sSySz+YZbNjI0/H7TQAR081KCKt0aDvPxHxndn3c4mTyryiT
 cd0Z4SXNwCyYnAiLcmYEQyCGPxM9TimK9ImZfMtduBGdeaT504LsGaCkXhekdx87LnS8
 KsWg==
X-Gm-Message-State: AOJu0YypTt2N2B4ZN2H43rH/lMFlNMb3S12zOnh693KbuQ4yU+mztGi1
 ow+ZMZxPI1Qii7DGBurKZ2HRaZWK8Xd1tjRwf7p0vTwZIamhOMNGJCPbPWrAiN4P
X-Gm-Gg: AZuq6aJWdGW+09vusmhTWkz3l5F6bUqlwwAXJfDXch587jzKBuA9qWyp7pFn0LmJ3ZV
 QAKRB3EdVqw8OKTn3kYjNfqsQkUqU1K2iyMtEJq6DgnX6DKztOIvjS6tAHkKcEQB/BTrVdePvWb
 9VMhR1KtNuKflc9larH8dxblwTkTPRnuDAAGNDgSEoLCGUnHOXMtoJO2SWAr6tlqsj2Vu5QYpJc
 V/an3uz4LFYg0hNfr6cI/5/S1TMhuDNvF8BY2WHT0a1FhaPUT4dVVwtWWwTi3ZOwbgiZtoPlS85
 GZGk1rERIhbDiLnLRxWlQImaFdt9amqZfrgXVHRUde92rHq5j0yB95M2tCke3ZpffO+p555z+N3
 3aV5rGyXYUQBs0RhrjDX51A2BrOqs/1JmLwkIiCh3vDmkpoMgXs8PiAlAwyTylgRZwgcX7rfwNB
 zxsGKzcvjAIsH5K6drOWWGSzgWsPVPrmWkUtCtn0ltMGLcb8sRg8/X
X-Received: by 2002:a05:6820:80c9:b0:667:7e1a:203a with SMTP id
 006d021491bc7-6759b1f432amr486246eaf.58.1770855302351; 
 Wed, 11 Feb 2026 16:15:02 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:15:01 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 47/61] drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
Date: Wed, 11 Feb 2026 17:13:42 -0700
Message-ID: <20260212001359.97296-48-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-47-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: 6382112889F
X-Rspamd-Action: no action

etnaviv has 5 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs as well as plain-old pr_debug()s

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 54ceae87b401..518b73679bda 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -26,6 +26,8 @@
 #include "etnaviv_mmu.h"
 #include "etnaviv_perfmon.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * DRM operations:
  */
-- 
2.53.0

