Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DSSJl0bjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 440CF12875F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE6410E67A;
	Thu, 12 Feb 2026 00:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VLkzF64A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB1010E670
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:14:17 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-45efde72438so1649312b6e.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855256; x=1771460056; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4wIIBK2xLHmy9ZZczWpP2RzFmOx4bELZz7aMw+RGO2w=;
 b=VLkzF64A+gEP58AA+vQEtRsi8OqMW6zsKHp8/vnEQyHQPmTfFyE6Xk3/qIX3imI88q
 Hv3FPeEsxo+mXX3ekVQnTEQBD3EMQxW/Z4CJ9nUp5EiWpvNjXTvV6gnMAtINjgeDsUgy
 tmz27ImTuRNCn8nVALHs9CMcxzk3usMuGGyhr03kVS8hsV0hl9AuMFVvq10etXa7G3IA
 zVjnd0n+S1qtXNWSRQuk1cOTNkNAnCtyBOomQcU2UI3rxc0a6zXbb15I+212PSOnNvne
 GB6SMhl/ZEcdLc40Y4NL1E3E81+XqFRc/FA9DZCgxSHhbZUsD5G6n5KcVySwFL93WuyU
 IU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855256; x=1771460056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4wIIBK2xLHmy9ZZczWpP2RzFmOx4bELZz7aMw+RGO2w=;
 b=lxrjkjpZVsvYt7mMVlRIUMuHIO6M9qEOlUHRR+Mgnx2NPWs7cc4Wa+926yudJgpUAK
 i7uC3hFbkyIpMM5Ldq1EUqdNbYaB05S2dapSgX8lySe6i1dhoyoEXIVbZaewQvAe/hP9
 1W1zvieEe8fWGREA4EKoobMfVAjp1Wsqyl4IvHdMtkXhMKUwX9N1aU5nkPL3d3Bz5Y95
 stNaPUzjRO8d628lvJsNktJ+X2gLDmV6vlxHGb8Hh2LJnQ10kNbTQJ3PxMCOWaDU4LFK
 snhTx6UTq0YlHhclRWORxhDhFLSaepq4KDq8CHZOKQPgG6mlPxAHTW+kk0FhL1jreNEz
 qUzQ==
X-Gm-Message-State: AOJu0YyDhI0+l8saekS4xPPmz6PFY4gd/Ps6LED+A1+v/iTf05EoMyN6
 DOZoSw8E5TC0JNflqWHNYV59UZqMAncld8RtOzT0VDCcy9WqWSLnEIGPM+r9Gg==
X-Gm-Gg: AZuq6aKgeidpnz4kNMXwklI21KrWFFq/Bk8quGqIfhJVVKPhMb8Y4bmGyXHdIhqguOk
 kRd66DJj+KIo4bKfxnl9iE96fZc+gq8kC/qJ41KyRXYqaV+8oAs/CFjDU/6grKWPddAnWZpktfG
 GbDnkgS9kAxypNIYAcEn9kDuMr4gfenDc8+w+7Ry9Tg5uuV54+pleNq5M0gIgMBiO5oeH706qRV
 I+YCAgFYEPiu0pxy341Oeie0PEQVfuMiL2FEACugAXc1EzKU9wsII0stp9nLjV07d2DQwxBH/WY
 mOaYa7KIj4fJ5zzxjCwgLv2hX76o6DxOFq6bdPXdqlLGwnCYaPrzXyuxG4WsjLYetGPMAQfDGl1
 VoZW3nBs0PhrWDgStfsgxDZGhYxpK7bl30PKq8oJES0lkFRiXvGb5aPcBPd8NykGo+ytAc7Jiuo
 iD/kJNgzaqYlvNLpEDqLZ8THyPsiaYI1Z7RsuwSfBdu9K+hn65S3NO
X-Received: by 2002:a05:6808:c2f9:b0:463:4f2e:c50f with SMTP id
 5614622812f47-4637faed46dmr324169b6e.24.1770855256667; 
 Wed, 11 Feb 2026 16:14:16 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:15 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>, linux-doc@vger.kernel.org,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 05/61] docs/dyndbg: explain flags parse 1st
Date: Wed, 11 Feb 2026 17:13:00 -0700
Message-ID: <20260212001359.97296-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-5-jim.cromie@gmail.com>
References: <20260212001359.97296-1-jim.cromie@gmail.com>
 <20260212001359.97296-2-jim.cromie@gmail.com>
 <20260212001359.97296-3-jim.cromie@gmail.com>
 <20260212001359.97296-4-jim.cromie@gmail.com>
 <20260212001359.97296-5-jim.cromie@gmail.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bootlin.com];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 440CF12875F
X-Rspamd-Action: no action

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4b14d9fd0300..9c2f096ed1d8 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,10 +109,19 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
-keywords are:::
+Note that since the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword and value.  Flag errs will hide keyword errs::
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
+keywords are::
 
   match-spec ::= 'func' string |
 		 'file' string |
-- 
2.53.0

