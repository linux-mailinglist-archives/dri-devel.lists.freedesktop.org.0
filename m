Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFtbCGMbjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4AA128799
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E99910E67B;
	Thu, 12 Feb 2026 00:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gm0By/9S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com
 [209.85.160.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3FF10E678
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:14:18 +0000 (UTC)
Received: by mail-oa1-f65.google.com with SMTP id
 586e51a60fabf-4043b27ddeaso1479920fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855258; x=1771460058; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R/SjSwC+RMF8YRDI51sil3K6xHtCNjZlX0uljPPVd8o=;
 b=gm0By/9StIUZuWvcX6y1jUrwpz5WYHshMbeJBinTRBUZBN6UVyEXWKmjVpV7KSrEn5
 E+7gVm8ZPaN33BXO0ijQLicsFBOMjuQ2sQTkX5dCDYOQLRD3mEa1psMy6lyGJiGdZhmU
 VrRxHVVb6IpcMZy0hYyKfuArRMj/1GjHHn7/Kd0Y0XAPdWOVVgu5CCA/dUZaj0KhCW5B
 gt7y5zGOk8vjV+D4I9Bi5uQu+LIMWTjITr6K6jx0cJ+6RoPVGuPaLnYIYEMKQ9YHV9KJ
 +9IMkBBUWpMh0OcovJTFRQpqAJORxBXxScGBFdELKuufS5cdzpmfECl5Qk7Rc2Gxy+R5
 6RdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855258; x=1771460058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R/SjSwC+RMF8YRDI51sil3K6xHtCNjZlX0uljPPVd8o=;
 b=EGPuhTkmucBEXYztg/AQa+NoqxFCgNDsP2wp3UWk3lRm7/rhl1lqAuTqyTvuGYAM+2
 cEktUkGFQgwQ8fq0SZUXOnHfqN4yqaaTGxbQYMYWcosNHcFvmpzkjwcNDBHX3cPQxhuG
 pfY8uM5KbvrZdqe4ppaK5bl6GA13rqQa0SlaKaw+35GeQsK5MKAt7gQiwqpSacVxcusv
 cHeelR6GKs6GDE0yUlW7Ti0l46bm1k4aQSRgQIR49VIH7IcO9F/jQ/HuPBjnAhXKl3H7
 P71em5bC3Mtb1zhcs9/xptCkHHsHN0aEB58Z4pai/gKbgA1BBetXh/eY5kXa5LzFmgt4
 HDKw==
X-Gm-Message-State: AOJu0YwYfqLj8LRVSvNYB7mxIuG4Fy/RHXqe/SWd2gf4z2+xj3iI7s8n
 3gDmqpXHFV3BF2Lf+Ht6YkWhtvOL9HjDyQQCUGsjo7hyg8H6JPm6gieqkJG7AYeO
X-Gm-Gg: AZuq6aKSWrVZCexDCUzwxuHwGdAtvLAfzfsUXkk8GCBdHMsHxQys4dAojfHgfJHeiWy
 EYnyIgTMyIVuKmn30xetc72VUTDST2HKr/vyiRtnhJHHjIMf3wH3GGxdkjvdt/7WpemcTPEt3e/
 LydLQaNq9hktsl8muc9UAY7QbotCWYfcFncp+spbVkceOvhzROWqGs8P8M6j7Wm4vYrJA8+1tqr
 ltjceFAuOPq5CdRWo4cndpoGYLv+lUwIyRo7jagrUEzBYVUIuv+A8I0cIokkFTGkp60ZJB8XZbc
 2oQemXSYgfG7pMao+cys3sdNtwaOWWyUzkW0sNxI8Xd892OLWfESDihT3RC8mBtJNo0jOynsa+l
 HRQlFw2SLdkjswbj/+2gBw/iGwFp9cJJur2isnEYzNh5Bw4v5XEMq4kT4AMbAQgAyR835scQSnv
 wOccTXMTBEMyFSM3qzrOf/LWnv381Y05SkaMVBaCCIWnq5lXJ33H0a
X-Received: by 2002:a05:6871:3603:b0:409:5241:8aad with SMTP id
 586e51a60fabf-40eca291522mr376254fac.44.1770855257774; 
 Wed, 11 Feb 2026 16:14:17 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:17 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 06/61] test-dyndbg: fixup CLASSMAP usage error
Date: Wed, 11 Feb 2026 17:13:01 -0700
Message-ID: <20260212001359.97296-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-6-jim.cromie@gmail.com>
References: <20260212001359.97296-1-jim.cromie@gmail.com>
 <20260212001359.97296-2-jim.cromie@gmail.com>
 <20260212001359.97296-3-jim.cromie@gmail.com>
 <20260212001359.97296-4-jim.cromie@gmail.com>
 <20260212001359.97296-5-jim.cromie@gmail.com>
 <20260212001359.97296-6-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: AC4AA128799
X-Rspamd-Action: no action

commit 6ea3bf466ac6 ("dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes")

A closer look at test_dynamic_debug.ko logging output reveals a macro
usage error:

lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

107 says: HI is unknown, and 105,106 have a LOW/MID and MID/HI skew.

DECLARE_DYNDBG_CLASSMAP() _base arg must equal the enum's 1st value,
in this case it was _base + 1.  This leaves HI class un-selectable.

NB: the macro could better validate its arguments.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 77c2a669b6af..396144cf351b 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -75,7 +75,7 @@ DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
 /* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 11, MID, HI };
+enum cat_disjoint_names { LOW = 10, MID, HI };
 DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
 			"LOW", "MID", "HI");
 DD_SYS_WRAP(disjoint_names, p);
-- 
2.53.0

