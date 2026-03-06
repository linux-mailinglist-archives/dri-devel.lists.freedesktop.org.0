Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFWrEBczqmmNNAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:51:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AD921A663
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3ABB10E2F1;
	Fri,  6 Mar 2026 01:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ns4WzGmK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA53D10E2F0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 01:51:13 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 006d021491bc7-6799774d0fcso5725553eaf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 17:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772761873; x=1773366673; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bv05xjmvI4rIAw60NQ+tAXnn+K45GBBhYovFXo2xASw=;
 b=ns4WzGmKwFcPQRXOEp/XQ+YT/zr2qyN2d5s5Ath7FdNLpk+Z5Gttq8MjRBRJkAODla
 V91ZjvxZMfMyd/qPkheOO3G2cBvMgVWbaK4EqBj07NJY9SNnqM0TuOX05+Xpc8OSCHYu
 3R2RwL18A3ITGWmBckyvK419gSi8WAhwjXWobvkZvxBHKZtGnRu0YNIbj5vf41XTlKGG
 4GYCJqcLuXYDu/tLcDEJb8p4G7kdIL8S1sUGvpk9B5j1jDgdY5KaBts+6oQIMx7Fn7x1
 zRXbBB2q12iFxOE2UIiBLq1qMc6qRD4QwmaH5xoxnlTgidSy8t78+T/p3BQAXfHOWUyp
 zaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772761873; x=1773366673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bv05xjmvI4rIAw60NQ+tAXnn+K45GBBhYovFXo2xASw=;
 b=rGICucr58YkG8cg8621ABik+TihbNTRhE1ele2yYE8PABLeZhT3vi35R8/bQ1yJ6t2
 t9e3fd4Frqhoje30R5235X44g8/iwl/o4qmDGoXptmBEa7fTkBqcuAB4LxgbIHnjJpee
 wCDcUEPcWWhSB6kJyrzAujyvtVT+eSonB3z+DVPIdZKjsHW6+iNOE5kpqJeYSXHDjwqo
 kbRmEgvLZtyIO3wslbKDRLm0mBSLXqi1Y6AtqdJeNuGbEXR8YiL5HG85+tex65IeUoX7
 ggiCcQOjuCIHlAQRkzPxP5fLAZDAg+3e0iDwWncmTtUb2YUS9RfOGhbh1wu8CLw8oD6G
 2tpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/gB5cxakIXE+WfdP2dWeU6ijYcuE/7lR3QQskQFoMKOeKz+cqRboCgeNGq67QdkhTahYFy/dqStA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnjlGxkMQitghQXWrvt1JU8KBjgCQ9+kFogeapdLMAgp+2Hjeh
 YG2aSj96zWhW+6gKxLsBxBI/aR5AbEbKNvdlyR5de1RiL1W4q3d/Xu/d
X-Gm-Gg: ATEYQzzK7bC38fdLc8z7qQb/K7HwHaL00fnHp1WkJb6DnLmO5or14nQ9LNmQNbLdZZF
 y2iliYrCN/Mvz61yC2m/7EN3gBpeUUfxrP5YvthKLH/I9KcnUS4HKQNEBfGUu7SXFLLotIrmJzW
 xZBRbFjvCtWnuIhl3g/p6yE67aMCbrCPkik4mLKwrvQCiI54OmoQ20sDPWSyMvHcCMf7HBtfmbZ
 z2n1FlKpNnX9TVOG/ZP2PXuR7lgklpS3ZcLMtVCWIkSi935oAG59ZJ3BnykgvSGPO8+3xs0oXA6
 66iJjI0z70jJrb4KTjgVpOnsMFfWGlfe4RX3ovU2paURVx2Oq9sM2Pbyuib/hSRbvqbm8ZdJt0G
 fJXBofk6EjbfDbRaZWCLh6r1M6jNYR6TW5K2IjxiS91cI1euXmpc/ncxJz1ZtT17caVL+7lqBuW
 Wgr2XN/eI43vLX9X7/9kreNmTa1hMlvfYVhf4nvxUmRwZxS5E4
X-Received: by 2002:a05:6820:4b05:b0:67a:4fe9:a4ba with SMTP id
 006d021491bc7-67b9bd49644mr410552eaf.63.1772761872956; 
 Thu, 05 Mar 2026 17:51:12 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-67b9cc1a627sm115245eaf.6.2026.03.05.17.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 17:51:12 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Baron <jbaron@akamai.com>
Subject: [RFC PATCH 6/7] lib/dynamic_debug: add negation support to queries
Date: Thu,  5 Mar 2026 18:50:09 -0700
Message-ID: <20260306015022.1940986-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306015022.1940986-1-jim.cromie@gmail.com>
References: <20260306015022.1940986-1-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: E6AD921A663
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:intel-gvt-dev@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:jim.cromie@gmail.com,m:akpm@linux-foundation.org,m:jbaron@akamai.com,m:jimcromie@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,akamai.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

This allow users to invert the selection of any keyword.
For example:

  echo "module !virtio* +p" > /proc/dynamic_debug/control

When I test with virtme-ng, this cmd prevents flooding the logs with
virtio activity.  Its not perfect, because it cannot also avoid
flooding from pr_debugs in serial_core or other potential sources.

A more robust command is:

  echo "module !virtio* +p % module serial -p" > /proc/dynamic_debug/control

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 76 +++++++++++++++++++++++++++++++--------------
 1 file changed, 53 insertions(+), 23 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 80fa8d2143e8..a283d12fd64d 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -59,6 +59,10 @@ struct ddebug_query {
 	const char *format;
 	const char *class_string;
 	unsigned int first_lineno, last_lineno;
+	unsigned int filename_neg:1;
+	unsigned int module_neg:1;
+	unsigned int function_neg:1;
+	unsigned int format_neg:1;
 };
 
 struct ddebug_iter {
@@ -163,11 +167,12 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 			fmtlen--;
 	}
 
-	v3pr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u class=%s\n",
+	v3pr_info("%s: func%s=\"%s\" file%s=\"%s\" module%s=\"%s\" format%s=\"%.*s\" lineno=%u-%u class=%s\n",
 		  msg,
-		  query->function ?: "",
-		  query->filename ?: "",
-		  query->module ?: "",
+		  query->function_neg ? "!" : "", query->function ?: "",
+		  query->filename_neg ? "!" : "", query->filename ?: "",
+		  query->module_neg ? "!" : "", query->module ?: "",
+		  query->format_neg ? "!" : "",
 		  fmtlen, query->format ?: "",
 		  query->first_lineno, query->last_lineno, query->class_string);
 }
@@ -268,32 +273,34 @@ static bool ddebug_match_desc(const struct ddebug_query *query,
 			      int selected_class)
 {
 	struct _ddebug_class_map *site_map;
+	bool match;
 
 	/* match against the source filename */
-	if (query->filename &&
-	    !match_wildcard(query->filename, dp->filename) &&
-	    !match_wildcard(query->filename,
-			    kbasename(dp->filename)) &&
-	    !match_wildcard(query->filename,
-			    trim_prefix(dp->filename)))
-		return false;
+	if (query->filename) {
+		match = match_wildcard(query->filename, dp->filename) ||
+			match_wildcard(query->filename, kbasename(dp->filename)) ||
+			match_wildcard(query->filename, trim_prefix(dp->filename));
+		if (match == query->filename_neg)
+			return false;
+	}
 
 	/* match against the function */
-	if (query->function &&
-	    !match_wildcard(query->function, dp->function))
-		return false;
+	if (query->function) {
+		match = match_wildcard(query->function, dp->function);
+		if (match == query->function_neg)
+			return false;
+	}
 
 	/* match against the format */
 	if (query->format) {
 		if (*query->format == '^') {
-			char *p;
 			/* anchored search. match must be at beginning */
-			p = strstr(dp->format, query->format + 1);
-			if (p != dp->format)
-				return false;
-		} else if (!strstr(dp->format, query->format)) {
-			return false;
+			match = (strstr(dp->format, query->format + 1) == dp->format);
+		} else {
+			match = !!strstr(dp->format, query->format);
 		}
+		if (match == query->format_neg)
+			return false;
 	}
 
 	/* match against the line number range */
@@ -345,9 +352,11 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 		struct _ddebug_class_map *mods_map;
 
 		/* match against the module name */
-		if (query->module &&
-		    !match_wildcard(query->module, di->mod_name))
-			continue;
+		if (query->module) {
+			bool match = match_wildcard(query->module, di->mod_name);
+			if (match == query->module_neg)
+				continue;
+		}
 
 		selected_class = _DPRINTK_CLASS_DFLT;
 		if (query->class_string) {
@@ -514,6 +523,16 @@ static int parse_linerange(struct ddebug_query *query, const char *first)
 	return 0;
 }
 
+static char *check_neg(char *src, unsigned int *neg)
+{
+	if (*src == '!') {
+		*neg = 1;
+		return src + 1;
+	}
+	*neg = 0;
+	return src;
+}
+
 static int check_set(const char **dest, char *src, char *name)
 {
 	int rc = 0;
@@ -558,10 +577,15 @@ static int ddebug_parse_query(char *words[], int nwords,
 	for (i = 0; i < nwords; i += 2) {
 		char *keyword = words[i];
 		char *arg = words[i+1];
+		unsigned int neg;
 
 		if (!strcmp(keyword, "func")) {
+			arg = check_neg(arg, &neg);
+			query->function_neg = neg;
 			rc = check_set(&query->function, arg, "func");
 		} else if (!strcmp(keyword, "file")) {
+			arg = check_neg(arg, &neg);
+			query->filename_neg = neg;
 			if (check_set(&query->filename, arg, "file"))
 				return -EINVAL;
 
@@ -572,6 +596,8 @@ static int ddebug_parse_query(char *words[], int nwords,
 			*fline++ = '\0';
 			if (isalpha(*fline) || *fline == '*' || *fline == '?') {
 				/* take as function name */
+				fline = check_neg(fline, &neg);
+				query->function_neg = neg;
 				if (check_set(&query->function, fline, "func"))
 					return -EINVAL;
 			} else {
@@ -579,11 +605,15 @@ static int ddebug_parse_query(char *words[], int nwords,
 					return -EINVAL;
 			}
 		} else if (!strcmp(keyword, "module")) {
+			arg = check_neg(arg, &neg);
+			query->module_neg = neg;
 			rc = check_set(&query->module, arg, "module");
 		} else if (!strcmp(keyword, "format")) {
 			string_unescape_inplace(arg, UNESCAPE_SPACE |
 							    UNESCAPE_OCTAL |
 							    UNESCAPE_SPECIAL);
+			arg = check_neg(arg, &neg);
+			query->format_neg = neg;
 			rc = check_set(&query->format, arg, "format");
 		} else if (!strcmp(keyword, "line")) {
 			if (parse_linerange(query, arg))
-- 
2.53.0

