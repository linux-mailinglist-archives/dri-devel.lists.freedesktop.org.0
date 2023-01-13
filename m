Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA6C66A355
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5F010EB13;
	Fri, 13 Jan 2023 19:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D74910EAEE;
 Fri, 13 Jan 2023 19:31:03 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id u8so11214261ilq.13;
 Fri, 13 Jan 2023 11:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uMbqFdT/JDbk6t20JvgexRk0zFVQ3CnaOgmAmhMmoxs=;
 b=fKgaTMeKfzcqUfAoemEcsC8YuW2QdVhaDfa6TQ7dB9H++nXnzumgfjDbDOaSXTlsiI
 8l2owubojC/NE1uAXHlOSh6N7FChBcCf5jPSaT1lfB98BZm89yNIJ+IvYRUPl1C2wcEc
 bMF4k8sPQB9TtECRFYzDFROaP3Dk4ZBn9M89opTudqwUuQsLOx0pY+Gwai7EbueylZ7z
 HTYZ27hIsC+v/TAhy5OFLTsAHB3rbwSTXW70Zl1NM4ZzSb/+oHctn+IdG3/DwnhJXzBF
 OtnQKGdkAxIYZmqUWiu5JdLVXtBVGrXrt0rVEvp6zXxt7zDyhkfeWq2A13rOHoMJbN1s
 WEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uMbqFdT/JDbk6t20JvgexRk0zFVQ3CnaOgmAmhMmoxs=;
 b=bCRRPyft33sR9MsWFEWMb3qG6RzKSkN+oqUsXySqnKp6kBuHstEjHWCYuZNJ238ogy
 VoZ22t+vEfeaiJIwH9cK3wa9LoPHzBelud1kdkzpe+xWkK/K0P+aBuZEC4RZLz97RXGp
 b38HayTOrOEAMSPsLt9mlkgV26D9HFDELiL9NFuePvIW1LCppxRvt/RNhDdAjpBPOGEY
 qhkqgKUNENWgWk5bP2WHobXLv44dNL4cjcEikT52zbGu4Ko9plVqp+Z2seNWIPS8JOgs
 1s160vGuWZ2RSpZ8Xehyd8qIciyYddTHLeXvQxhQ7cd4CtFuB+YmEMbx+/E5eXe7E9l0
 Fu6w==
X-Gm-Message-State: AFqh2kp0T1CmJD6RnGWLXqKG9nqnMz+HmXncc4NcVY3xpYNlM9VhEiyc
 n/8Exxbh1QQEalfB4EpuvDQ=
X-Google-Smtp-Source: AMrXdXvGslnAVKLoPH+t01+Ripv46/ISSZmTMAWZank9F3QWH6C5s89RkS8L/E/8JmO84IbTeA0dtA==
X-Received: by 2002:a92:c26f:0:b0:30d:6de3:268b with SMTP id
 h15-20020a92c26f000000b0030d6de3268bmr36191703ild.19.1673638263209; 
 Fri, 13 Jan 2023 11:31:03 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e32-20020a026d60000000b0039e583abceasm6497289jaf.68.2023.01.13.11.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 11:31:02 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 19/20] dyndbg: unwrap __ddebug_add_module inner function
 NOTYET
Date: Fri, 13 Jan 2023 12:30:15 -0700
Message-Id: <20230113193016.749791-20-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113193016.749791-1-jim.cromie@gmail.com>
References: <20230113193016.749791-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, jbaron@akamai.com,
 seanpaul@chromium.org, gregkh@linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The inner func has a base arg which is unused in the body, so theres
no point in having the inner fn.

Its one-time purpose was to expose a wider interface to the internal
caller: dynamic_debug_init(), to allow communicating each module's
offset in the builtin _ddebug[] table.

That purpose was obsoleted by cited commit, when ddebug_add_module()
was converted to pass a *ddebug_info, which is used as a cursor by the
caller.

TODO: the cited commit gives another reason for base, to provide an
index in support of de-duplicating column data.  Refresh that patchset
to see if its still true.

Fixes: b7b4eebdba7b ("dyndbg: gather __dyndbg[] state into struct _ddebug_info")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 19bf66229d45..eb1fb10d7272 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1348,8 +1348,7 @@ static void ddebug_attach_client_module_classes(struct ddebug_table *dt, const s
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
  */
-static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
-			       const char *modname)
+int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
 
@@ -1391,11 +1390,6 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 	return 0;
 }
 
-int ddebug_add_module(struct _ddebug_info *di, const char *modname)
-{
-	return __ddebug_add_module(di, 0, modname);
-}
-
 /* helper for ddebug_dyndbg_(boot|module)_param_cb */
 static int ddebug_dyndbg_param_cb(char *param, char *val,
 				const char *modname, int on_err)
@@ -1538,7 +1532,7 @@ static int __init dynamic_debug_init(void)
 			mod_ct++;
 			di.num_descs = mod_sites;
 			di.descs = iter_mod_start;
-			ret = __ddebug_add_module(&di, i - mod_sites, modname);
+			ret = ddebug_add_module(&di, modname);
 			if (ret)
 				goto out_err;
 
@@ -1549,7 +1543,7 @@ static int __init dynamic_debug_init(void)
 	}
 	di.num_descs = mod_sites;
 	di.descs = iter_mod_start;
-	ret = __ddebug_add_module(&di, i - mod_sites, modname);
+	ret = ddebug_add_module(&di, modname);
 	if (ret)
 		goto out_err;
 
-- 
2.39.0

