Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C287C747E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 19:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D1810E54D;
	Thu, 12 Oct 2023 17:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A770A10E54B;
 Thu, 12 Oct 2023 17:22:03 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-79fa416b7ffso49071839f.2; 
 Thu, 12 Oct 2023 10:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697131323; x=1697736123; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tXsSOg8f2yCgJEL2pCIM6ReAyW7r5JJg4FpT0/i3350=;
 b=dZABFM3YWGQX1VymbGB14d19ltkq2haIZink/DnUf29vu+aj3p8mqo/VF2PLRIil+p
 C3OCnX0kopCGjJlLIuwdnUrSYVuhW76IcvYEqbcO+sMoM43Kz3ITWNjRxlALDoQwc+Nb
 MRH+0SOpBtFqj8dTCTQ6PTXS8kLNy5cM8TSn1rryEjI65odWzBo0zydXDb46TJOVIhPC
 Yyib7UOMkhqUMWt+Y7pVAmvlMsxGY04wHbrWUhX1lpIjtRlocqZGtnVHZK/CsrEa/iIu
 h8BOM08vq5OWJ8cXJONn8t3gFSStKWJv36YJjOWXm0/iXQEOqH/hSaTAGFzurNHlsk6z
 ErqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697131323; x=1697736123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tXsSOg8f2yCgJEL2pCIM6ReAyW7r5JJg4FpT0/i3350=;
 b=If/z8Qeoz0k9GVuwWo8jhZpf9z1VS1UuCCPO0vnhqDTIvBnWtATwO/9Lw2LFq0pUV4
 UnDBs4HjNDg/vK5LtnShtVJix3jTS1JmHWXhy01hyMpqwHVeImueNzqhT0dEuk1uZZEo
 n8kHmrSgOPKtXepzGzGx0zZPgBO8za1i5zumHEwwWFzFFTgW9W1FCKOmA3wUrw20qDjQ
 bXzeRumc0lSg/tqI5/skcEJlYOGpgMgOFE1xDNUuzo88RDyqiBJMR7CllTrxbUFo00RU
 1tAMJmInPUFlhW3KQiIN8UdhvBfOhPVR9U5+es2w/NZDDXLwhe8tfHsLNByd7v011m+7
 k3HQ==
X-Gm-Message-State: AOJu0Yx78YmmhGiSt1/0CnWF48XDO9VY3Q5o0YmvxuV3iUgFjrmd52Aw
 32GIJkYuRnx3Qz7/ebdAdFA=
X-Google-Smtp-Source: AGHT+IFvPv3WahLattI3Z9DATQrgOpUiuRGT6o72xHqhOmKh1w/IoezmQ3hvyN0mUkLMOf0ICZBBLw==
X-Received: by 2002:a6b:5c02:0:b0:792:96e5:962 with SMTP id
 z2-20020a6b5c02000000b0079296e50962mr25893270ioh.6.1697131322893; 
 Thu, 12 Oct 2023 10:22:02 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 r25-20020a028819000000b0043cef0711c1sm3992211jai.158.2023.10.12.10.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 10:22:02 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 15/25] dyndbg: add for_each_boxed_vector
Date: Thu, 12 Oct 2023 11:21:26 -0600
Message-ID: <20231012172137.3286566-16-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012172137.3286566-1-jim.cromie@gmail.com>
References: <20231012172137.3286566-1-jim.cromie@gmail.com>
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
Cc: groeck@google.com, linux-doc@vger.kernel.org, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, yanivt@google.com, seanpaul@chromium.org,
 bleung@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a for_each iterator to walk a counted vector member in a struct
(ie the box), and use it to replace 8 open-coded loops.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v5- parens-on-box-force-precedence
---
 lib/dynamic_debug.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index be49e104ec76..c11feca70d6f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -158,6 +158,9 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 		  _dt->num_class_users);				\
 	})
 
+#define for_each_boxed_vector(_box, _vec, _len, _ct, _curs)		\
+	for (_ct = 0, _curs = (_box)->_vec; _ct < (_box)->_len; _ct++, _curs++)
+
 #define __outvar /* filled by callee */
 static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
 							const char *class_string,
@@ -167,7 +170,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_user *cli;
 	int i, idx;
 
-	for (i = 0, map = dt->classes; i < dt->num_classes; i++, map++) {
+	for_each_boxed_vector(dt, classes, num_classes, i, map) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -175,7 +178,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 			return map;
 		}
 	}
-	for (i = 0, cli = dt->class_users; i < dt->num_class_users; i++, cli++) {
+	for_each_boxed_vector(dt, class_users, num_class_users, i, cli) {
 		idx = match_string(cli->map->class_names, cli->map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + cli->map->base;
@@ -1058,11 +1061,11 @@ static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp
 	struct ddebug_class_user *cli = dt->class_users;
 	int i;
 
-	for (i = 0; i < dt->num_classes; i++, map++)
+	for_each_boxed_vector(dt, classes, num_classes, i, map)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
-	for (i = 0; i < dt->num_class_users; i++, cli++)
+	for_each_boxed_vector(dt, class_users, num_class_users, i, cli)
 		if (class_in_range(dp->class_id, cli->map))
 			return cli->map->class_names[dp->class_id - cli->map->base];
 
@@ -1216,7 +1219,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	struct ddebug_class_map *cm;
 	int i, nc = 0;
 
-	for (i = 0, cm = di->classes; i < di->num_classes; i++, cm++) {
+	for_each_boxed_vector(di, classes, num_classes, i, cm) {
 
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
 			vpr_cm_info(cm, "classes[%d]:", i);
@@ -1230,7 +1233,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
 	dt->num_classes = nc;
 
-	for (i = 0, cm = dt->classes; i < dt->num_classes; i++, cm++)
+	for_each_boxed_vector(di, classes, num_classes, i, cm)
 		ddebug_apply_params(cm, cm->mod_name);
 }
 
@@ -1250,7 +1253,7 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 	 * module's refs, save to dt.  For loadables, this is the
 	 * whole array.
 	 */
-	for (i = 0, cli = di->class_users; i < di->num_class_users; i++, cli++) {
+	for_each_boxed_vector(di, class_users, num_class_users, i, cli) {
 
 		if (WARN_ON(!cli || !cli->map || !cli->user_mod_name))
 			continue;
@@ -1268,8 +1271,7 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 
 	dt->num_class_users = nc;
 
-	/* now iterate dt */
-	for (i = 0, cli = dt->class_users; i < dt->num_class_users; i++, cli++)
+	for_each_boxed_vector(di, class_users, num_class_users, i, cli)
 		ddebug_apply_params(cli->map, cli->user_mod_name);
 
 	vpr_dt_info(dt, "attach-client-module: ");
-- 
2.41.0

