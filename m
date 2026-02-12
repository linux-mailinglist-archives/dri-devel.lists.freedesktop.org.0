Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SP7TDWgbjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5081287AB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E188F10E67E;
	Thu, 12 Feb 2026 00:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PQ8Xyrhb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5539810E67C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:14:23 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-45c9f47e1e8so2508016b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855262; x=1771460062; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+Ch5Eo+sxiIG0Ekkq68Q1lkMg0ctuAbJcN+Vnr631o=;
 b=PQ8Xyrhb8BSwsrRISJPiBFDw6nuHdaqZGkhVT7/TMluzSSbzPgsAT6PTfnM5YLIiz/
 0TYY8h5ZaS3guRewI17vzj6FgVNGR/qHJC5pzsZ50jlUF3rlhg8n7IaJXZuqsXx0Il06
 tmOGbCDyCuLtRuaKPvfAI04Gjju1rO5AcUmcIGpt6f4MURvX2osstgj4O02D99VEnBL5
 5DvSdZljdU2p1KPYB/kGrxU+TrbMUWE5PTphxzDnGhj1rX+AWchIWuQJbJlBNAI4YcIo
 bOQb77nrW5lioIwTNTCz7RG6O0PE1hmEY1TkBmd0nyx0C3Q6o0gFBHdhl2KzM9/faki1
 E6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855262; x=1771460062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B+Ch5Eo+sxiIG0Ekkq68Q1lkMg0ctuAbJcN+Vnr631o=;
 b=MdY4OXiUYQcWkAZGy2mCLR+laUusws79Js+gpZxbavMRxgKHqBcnLZ5fHAw1Hd0cen
 6jIqvLcwNu854z/GbVub3NetciogewYkr01J1fVTacOFEwPWj7I/2qJhZ47lYNB78z8I
 28aK6QnLnLJzPailYwusQMg0UXYw9JJdXoESl6i6iLbK62jVG/OcRZw8AApyO3+DxmZo
 TKAvUG/3lmpG8WqkG4JMOnnrax0dWg5pRMA8E7dZgV0sXZpZoSgPMjOLyA1hyVPSBBLn
 6sw3FFkBfoWB//jHh0SdILGGDdbgfrsKbaoEgu0JjuKOt8R+KQxY7Aw5/uodMAdB1+Xx
 4h2g==
X-Gm-Message-State: AOJu0YxRdGFnnjkuraA9CXQdZBWvLQQ+Iuxqebil29AASCrDMGGlzDGq
 NIo7xMh+g/Fwl91O4gl+s/NC6R690RgTtKzEBhgkyi6I1Eq0Kba89kJIuJjOYw==
X-Gm-Gg: AZuq6aLz0TH/8ZdUipCdLqAOTURV6llX8IRLYmvESDCrcGal1q5w5T5ihCp3aj0wb2q
 /k5trLO6ustQQFC4nryLWMhNNIgROEUBYHttyzaH6FD/JU/IJLg3/Rw5p26J40faBm1pp4tKnJX
 eVtkyIC0kNwOPRxBn6MEIYTcm7U57LHdofBMdzRMGP1Rs97AgjHG1WIOBi7PFtPXxhTVLEdV4J8
 fauObpjD3jwKMrOMe7l6RzgQTHvSKVcEZ2mml1aQs+C2S0kfPtSsazQieKhd78sa8o1rf1o4RNP
 ROhZmtQQMDLIxy994SZFYTzqw+W2rU6S3pF8IVX+h4fwgbWP6xa2dI62LVyjPuxDwrX5pgloHw+
 GeeJtLq0eu1fdgSHi+f94bzxKUfyDRhTbEf1q4sXwieG2j+v6C0/5JC/uUXYnjZZY6hDjWM6Dkh
 +b1HHtuytqlOfhDxxC/xZTjiUl+19bqOQD9RK30ypzItldUSzcTcon
X-Received: by 2002:a05:6808:6602:b0:45e:9c6c:c7d9 with SMTP id
 5614622812f47-4637b67e1c8mr580583b6e.19.1770855262463; 
 Wed, 11 Feb 2026 16:14:22 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:21 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 10/61] dyndbg: tweak pr_fmt to avoid expansion conflicts
Date: Wed, 11 Feb 2026 17:13:05 -0700
Message-ID: <20260212001359.97296-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-10-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: DB5081287AB
X-Rspamd-Action: no action

Disambiguate pr_fmt(fmt) arg, by changing it to _FMT_, to avoid naming
confusion with many later macros also using that argname.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 1d13e3ee3e12..fbe18b1f0b73 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -11,7 +11,7 @@
  * Copyright (C) 2013 Du, Changbin <changbin.du@gmail.com>
  */
 
-#define pr_fmt(fmt) "dyndbg: " fmt
+#define pr_fmt(_FMT_) "dyndbg: " _FMT_
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.53.0

