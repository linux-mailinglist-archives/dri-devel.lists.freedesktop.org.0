Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOYmFlwbjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0900E128756
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0852810E673;
	Thu, 12 Feb 2026 00:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q4VE42Bp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C08910E670
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:14:14 +0000 (UTC)
Received: by mail-oo1-f67.google.com with SMTP id
 006d021491bc7-662f9aeb782so4519144eaf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855253; x=1771460053; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AAl9+PvQAj0gWNHtBaTmlj5ZgTYMrxMbOjBXxAyMQwA=;
 b=Q4VE42Bpi7T5x2rG84PgA5Sk9h5l/JXP5xQDdjwdn8lXpddV9sUBqNKPPTO26JfCiN
 H1LBJCbVORqYoM1L08mc3QdaA+TSZPdRA8/MwatYDCA2bGyA8sJ/cJDOiOs3e4mCNOBU
 8jksWUnprnglh2v2fKvePiYy92N2zLzhrexJdl5P/8MalZl2QlXsUPefMA5Ggv4er+nV
 0w+CtS02PflHtAhzSB3hyKYRD1ClGK8Kt0OqnZjujwxADTeeQYjxpYSr1ZWJ8PI8ZEPP
 gN5UYA4io+NvpfoJPGMsi1Lq7WZ3rVeGXDWbY1CYqb5rk/O4f9YH2u22uwvNWZ1u3gBT
 kn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855253; x=1771460053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AAl9+PvQAj0gWNHtBaTmlj5ZgTYMrxMbOjBXxAyMQwA=;
 b=NFpXYrL0VceB3AtgQCk029BOKF5FxeuzoSQJLAkAXwG6Z3XECBNcQQMCruWXdUBtsV
 TRfnQgSUb7zWv1hzy7CtLohfqBBPp64t1xQFMYD6KXErv4rsosBAol5QHNa/NJv7y88n
 E5QQiAMfO4qo3ZiEXX1QBKB67TVfezq7uPg04YPmUQo3h2YYPmPQzEZbm8O/tIocJ/D4
 U+zcUQQb0OcbOBU1eJKA9BxfgrfOwgkQ3nmkn8IeMIt3UEm+3WnnPAJaVJZmjty3pJrn
 27RuyZ2Uapdfs8h/SuKtYzWUJ/7/Cmemh0xRTVmz4i6aMcy5nTJcsfOkgcHp0XllxbeO
 pzpg==
X-Gm-Message-State: AOJu0YyOHUIKJldQYVL/aHBCLY0wP24ZQZcBBdcwdpdPw6SemWEzdGtv
 Hj99kWSyde56sE7pzeoWOtrksWemVdDHUHL22aq3ZJIzRhXpDsQCAfqhcvLIp/BP
X-Gm-Gg: AZuq6aJlNfFivP9Q4WFOhW1Q7PFTa/3sFbc+QFIMQlRnXczsQrN1+L2q0j+MOitYsWD
 xx/ETRZrWjvnjLgjmmLkd2w2eNGhxCvqqX+XH9bZt3ROTyNDDULc0E3Ma6S8G7uzCm8XQ4dL3n3
 p7/X34hg+1StROmx+v8Sex7BgRb6VEK43kOVYyaE3LTOYEwXHHZ0kNKnwb9Nulhlr/iIz6z4A5m
 2yN/4N0ebJSBCztrWv/olMyfhmMz+T7vzvZK0UHAcT+cAGRYOoL+ziZ97JEf5meNlS+9Hw8+ypp
 YyVlIXJ6DXPvjEKwfP9BcKg5Nu0kKQ1l4SVcokehd9a8GLaugOLJ8taFgaLxD6QOWkiH1C2hF2g
 d1j+O/xL494fIyqvWl2vRqnHQzaVh+mIc5yRKaro85Oc2dYfTb3yziNAn45H0d7XWLrClou3UfS
 1p9ds9kR8YL/J4LGJd9zeIngwE1kTE66QnxgRLXgE7XkZGAsJmRuHa
X-Received: by 2002:a05:6820:205:b0:662:ef26:1505 with SMTP id
 006d021491bc7-6759a55a306mr468101eaf.46.1770855253442; 
 Wed, 11 Feb 2026 16:14:13 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:12 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 03/61] dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
Date: Wed, 11 Feb 2026 17:12:58 -0700
Message-ID: <20260212001359.97296-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-3-jim.cromie@gmail.com>
References: <20260212001359.97296-1-jim.cromie@gmail.com>
 <20260212001359.97296-2-jim.cromie@gmail.com>
 <20260212001359.97296-3-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: 0900E128756
X-Rspamd-Action: no action

Add the stub macro for !DYNAMIC_DEBUG builds, after moving the
original macro-defn down under the big ifdef.  Do it now so future
changes have a cleaner starting point.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 43 ++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 05743900a116..a10adac8e8f0 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -93,27 +93,6 @@ struct ddebug_class_map {
 	enum class_map_type map_type;
 };
 
-/**
- * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
- * @_var:   a struct ddebug_class_map, passed to module_param_cb
- * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
- * @_base:  offset of 1st class-name. splits .class_id space
- * @classes: class-names used to control class'd prdbgs
- */
-#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
-	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
-	static struct ddebug_class_map __aligned(8) __used		\
-		__section("__dyndbg_classes") _var = {			\
-		.mod = THIS_MODULE,					\
-		.mod_name = KBUILD_MODNAME,				\
-		.base = _base,						\
-		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
-		.class_names = _var##_classnames,			\
-	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
-
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
 	struct _ddebug *descs;
@@ -138,6 +117,27 @@ struct ddebug_class_param {
 #if defined(CONFIG_DYNAMIC_DEBUG) || \
 	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
 
+/**
+ * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
+ * @_var:   a struct ddebug_class_map, passed to module_param_cb
+ * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
+ * @_base:  offset of 1st class-name. splits .class_id space
+ * @classes: class-names used to control class'd prdbgs
+ */
+#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
+	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	static struct ddebug_class_map __aligned(8) __used		\
+		__section("__dyndbg_classes") _var = {			\
+		.mod = THIS_MODULE,					\
+		.mod_name = KBUILD_MODNAME,				\
+		.base = _base,						\
+		.map_type = _maptype,					\
+		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.class_names = _var##_classnames,			\
+	}
+#define NUM_TYPE_ARGS(eltype, ...)				\
+	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
+
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
 
@@ -314,6 +314,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
 #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
 #define DYNAMIC_DEBUG_BRANCH(descriptor) false
+#define DECLARE_DYNDBG_CLASSMAP(...)
 
 #define dynamic_pr_debug(fmt, ...)					\
 	no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
-- 
2.53.0

