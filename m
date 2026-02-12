Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIEVI4AbjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258A0128833
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593A710E688;
	Thu, 12 Feb 2026 00:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TOKBOHv4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74CB10E688
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:14:49 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-404263bd58fso960205fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855288; x=1771460088; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mF3qF56e3AIVkFOnMWzlic6qtkoIT/aDJZfbYDmcBOc=;
 b=TOKBOHv4BS91X09J76MG9KGQx8A0hjke37I78zCHzzC6YcQ85iQEk1hLxoXeMrzS5M
 kTRfS5TKOp3N0U16wsSW5r2/aEov1MENG2SOIqaLYc9qCVyQ18COCoYbMydK24zHHGWa
 Jz2+Aggk9+WQ3sKZkBVNjQBj2k7ax2knJdbQokaiIyEr3WOR30Poit+VlGumsjnYuwDk
 a2wpbHbN+JnhkttYrxH4ME7IhyZMSZqb54aDXEs9RYvrKT36OfrpqHSlhpxKoHcx6CyU
 0ZYpFMYOSsA5vkSDpapn0ZPqmknvBROIvxrsHDprI3fROtRLtKISLhRLjwwtK/Cvqqz8
 BZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855289; x=1771460089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mF3qF56e3AIVkFOnMWzlic6qtkoIT/aDJZfbYDmcBOc=;
 b=lawB+vLx/avCC2gkWz4bUBlcqtDQYz3lL02FW3T74s+AL3yfZtRjD/L1URuE0P1ta+
 l1fWNOjeNa4R/0dhJV0XaoDCJpz338uDrN303BDGVFT8nWAQQCAEVh3nmdypeqsXbY3p
 p4icxAgqNV+C1sB/aQKCFs2Ei1svIftGdGGsM8TzDiQ8+oP8nFN2UOE2fHCQQJRb7j/M
 E1Oywu/9vH0ktpHPIaia3TgKzGmtl7IJLCNzXsb90NNSG9tVOJwRoI2xPJC/zUkL+r1g
 3JKRbS1T3EJA6T1OeYYCht8oULyKn3AsikD31M9I5flxyIkaaFsxPV0zSaSyeFD9ogh2
 0lOQ==
X-Gm-Message-State: AOJu0YwPMG6wnOOYVKI/L3+W6pkxSZsaP7WxDXn6UIPIwF/jmzfv5Bzz
 6Bxc4kQKT2IIP/eip85boaCQFi5pwwc0kircIRLTw8AvYNWxKpydlQo/IVA1xg==
X-Gm-Gg: AZuq6aIrVp9/8kFFb5XvAqwxJW+OR5ur8zTOk3jFxto5+/G2MvUkIBDSkWGcufa3eum
 k6pLvdeOLZBOuvaLokjXGQ9ORadyG0X0QEVTa1O9l8or8tpVzagWi4a8Gc/UQUfUoC5ki5bJP5R
 4aP0cusQIFGOUuxiJ3LCPMmH5ERUrjsVMV7vpsekqpgAv5Bh80gem0IG1b/MsvwB4YcqmPss4xm
 41nasLQuuZ5wLnGjWI8FLbomCOfspAbLzbJGrlnxq1c4mWQXKS2LG6zctNtBmbioNCL4uFLmSMX
 zBwUHn6rsCQ/0oQx3+8O2DhysqurfdegQuVH2chvilTBFKwV/WjHkeDYZKhlQC+gPhdpzCnW0we
 /8zhiybCIZSKOvYl0aQRCRABXS2MJgNCrJMCzuEFHmGLrw00Yj6dkpHf32LxLw27+T6c101omIW
 06mzzQV1xwBdrtlc53EPl6Y1BD4dqffyjYske1k/4f5xuU/z7BdNYn
X-Received: by 2002:a05:6870:8271:b0:40a:5870:98bb with SMTP id
 586e51a60fabf-40ec8a76850mr442132fac.21.1770855288633; 
 Wed, 11 Feb 2026 16:14:48 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:47 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 33/61] drm: use correct ccflags-y spelling
Date: Wed, 11 Feb 2026 17:13:28 -0700
Message-ID: <20260212001359.97296-34-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-33-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: 258A0128833
X-Rspamd-Action: no action

Incorrectly spelled CFLAGS- failed to add -DDYNAMIC_DEBUG_MODULE,
which disabled dynamic-debug in modules built with:

CONFIG_DYNAMIC_DEBUG=n		# 1
CONFIG_DYNAMIC_DEBUG_CORE=y	# 2
CONFIG_DRM_USE_DYNAMIC_DEBUG=y	# 3

NB: this adds the flag (when 3) more often than strictly needed;
modules built with CONFIG_DYNAMIC_DEBUG=y (!1) don't need the flag.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index d26191717428..bba80b25603a 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 # Unconditionally enable W=1 warnings locally
 # --- begin copy-paste W=1 warnings from scripts/Makefile.warn
-- 
2.53.0

