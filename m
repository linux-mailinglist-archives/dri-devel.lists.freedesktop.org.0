Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AC25AC7B8
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AE610EA4F;
	Sun,  4 Sep 2022 21:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CC310E266;
 Sun,  4 Sep 2022 21:42:52 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id y187so5724068iof.0;
 Sun, 04 Sep 2022 14:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=NJv9roPGKnaMDb9Znbql4uMkywSuYywvt+PY8YTJJ6Q=;
 b=HhTTMF5cOvfQxdSZmrczdsrS6DcF+dXJ4prb+yfBwfEsbsV/l8CegD6fvYMQv45pnL
 Lf3KTZjPRQvn2olpOHp+kmaJ4oJHgCOfWsY3FUgvHVffh1+zc352thh9xXYlfcfH2jPd
 WHUvSV9qo/7iWc+93e5dgxNXp0BN7YD7iPq5mLd4Lp375zL2U7/g25FtP4jW0poI3Xy1
 BVe/2TTcrNFKPS3ucVYZJTTlomYi+IjWKzHykbLWJSIGsDYsRKCTeZerO4ouyzRs9apT
 ceUwHG+xksDXgJwO4SLD6ULb2vBG1qGluX6Fx9greabj7IG3dRz5uT820IrbROFlv4PW
 vTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NJv9roPGKnaMDb9Znbql4uMkywSuYywvt+PY8YTJJ6Q=;
 b=Oqz6/PZLld5NHvrUkEHmwZcGvTlOMDHXFonM6HQC1gv2GGcWAIUrBFDweP9Wc1ekJ0
 KLS+sWBL/Tm4bQI4RcrpkpEKqHpZxGXLOlkGpp+N1CK9yoshpnvLxUxd3uTNSn1PNiPf
 h7pQbjVw4mHf0xYZVZMCywtuUv+AAV4zE7klzBT9JMXswGYAbw4ldY69LVERU/4hT6/y
 t/grv1f/SmyqMPKmbEItFFhN5vYUwlUOZAs3mfif+IzM9CSJkz6yU/6WqbomMW1JevyG
 VP/IdL3r4v9d2NO5MvmbUkf9OwBAlPNNPVGR523Uux4kURQQ/3ztQnE13h2ff1aF4ddg
 4hlw==
X-Gm-Message-State: ACgBeo0IeSEal/J7jvQVLWh5Rx6cTQ0/wEbHJ/L2OTJL6KO3GhVZTVBK
 Zuk44yOgrwp/LFYXn3W2lYw=
X-Google-Smtp-Source: AA6agR4MY52KR1Bw1Ot+iK3sIpDRwZTCG1xc7RrkCdtaGzSPJBBL/OV4txxLoofl2HiIy/rTScLO/A==
X-Received: by 2002:a6b:1543:0:b0:688:6fcb:fa76 with SMTP id
 64-20020a6b1543000000b006886fcbfa76mr21261370iov.60.1662327771514; 
 Sun, 04 Sep 2022 14:42:51 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:51 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 43/57] dyndbg: add _index,_map to struct _ddebug
Date: Sun,  4 Sep 2022 15:41:20 -0600
Message-Id: <20220904214134.408619-44-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We now have 2 vectors of data: (__dyndbg, __dyndbg_sites), known to be
equal-length, with _ddebug.site connecting them, like rungs on a
ladder.  In order to drop _ddebug.site, we need to replace the
absolute ptr with a cheap relative-address computation:

   struct _ddebug_site *site = _ddebug_map_site(desc);

1st step: (done here)

add ._index, ._map fields, and initialize them in __debug_add_module()
to N (and = each other), where N is each element's position in the
builtins (or loaded-module).  Then _ddebug_map_site(desc) can compute
&descs[0], and then use container_of() to go up 1 struct.

RFC: Next steps: (outlined here, not done):

1. UPLINK:

Define 2 new header structs, with _uplink fields, pointing at _ddebug_info:

struct _ddebug_site_hdr {
       union {
       	     struct _ddebug_info _uplink*;
	     struct _ddebug_site __;  // sizeof this
	};
};

struct _ddebug_hdr {
       union {
       	     struct _ddebug_info _uplink*;
	     struct _ddebug __;  // sizeof this
	};
};

the union forces the allocation to be the bigger of the 2, with the
expectation that the pointer will always fit.

2. Reserve a record in front of the __dyndbg* sections.

can be done in {module,vmlinux}.lds.h, something like:

SECTIONS {
__dyndbg_sites : ALIGN(8) { *(.gnu.linkonce.dyndbg_site) *(__dyndbg_sites) }
__dyndbg       : ALIGN(8) { *(.gnu.linkonce.dyndbg)      *(__dyndbg) }
}
KEEP( *(.gnu.linkonce.__dyndbg_site) *(__dyndbg_sites))

3. specialize DYNAMIC_DEBUG_METADATA_CLS as DYNAMIC_DEBUG_TABLE.

This special macro version creates header records, and puts them into
.gnu.linkonce section.  Unusually (uniquely?), it is tacitly invoked
by dynamic_debug.h on behalf of all printk.h includers.  This can
result in multiple "declarations" in the same scope, so macro uses
__weak and/or __unused to suppress linkage & errors.

This created mumble-RELATIVE linkage errors in a few parts of the
kernel, I worked around this by just suppressing the declaration if
cflags includes -DDYNDBG_NO_TABLE.

The up-link is init'd in 2 cases:

The file static struct _ddebug_info builtins is initialized by
dynamic_debug_init(), with the 3 ELF sections addresses+lengths
composing the builtin dyndbg-state.  It will be able to also
initialize the header.UPLINK fields, as long as the storage space is
available.  Then rel_map() can rely upon it to provide the &site ref
for a callsite's desc*, if it is enabled.

Then at runtime (assuming initialization is correct):

 - use _index to get &descs[0]
 - container-of gets .UPLINK to &dyndbg_info
 - info->sites[_index]	- replaces .sites
 - info->sites[_map]	- allows de-duplicated vector position. M<N

But thats all talk; this patch just adds and initializes the index and
map fields.

._index:14 allows ~16k entries, more than enough for ~3k built-in
callsites, or ~4k in amdgpu (with dyn-drm-trc commitset).  It is
initialized in __ddebug_add_module(), a new refactorization.

ddebug_add_module() is called from kernel/module.c, that interface is
preserved.  It just passes 0 to inner fn when loading modules.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 3 +++
 lib/dynamic_debug.c           | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index c05148dab367..268e903b7c4e 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -31,6 +31,8 @@ struct _ddebug {
 	/* format is always needed, lineno shares word with flags */
 	const char *format;
 	const unsigned lineno:16;
+	unsigned _index:14;
+	unsigned _map:14;
 #define CLS_BITS 6
 	unsigned int class_id:CLS_BITS;
 #define _DPRINTK_CLASS_DFLT		((1 << CLS_BITS) - 1)
@@ -60,6 +62,7 @@ struct _ddebug {
 #define _DPRINTK_FLAGS_DEFAULT 0
 #endif
 	unsigned int flags:8;
+
 #ifdef CONFIG_JUMP_LABEL
 	union {
 		struct static_key_true dd_key_true;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index f1f354efed5a..506a7e2e59d6 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1344,6 +1344,7 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 			       const char *modname)
 {
 	struct ddebug_table *dt;
+	int i;
 
 	v3pr_info("add-module: %s.%d sites\n", modname, di->num_descs);
 	if (!di->num_descs) {
@@ -1364,6 +1365,7 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 	 */
 	dt->mod_name = modname;
 	dt->ddebugs = di->descs;
+	dt->sites = di->sites;
 	dt->num_ddebugs = di->num_descs;
 
 	INIT_LIST_HEAD(&dt->link);
@@ -1372,6 +1374,12 @@ static int __ddebug_add_module(struct _ddebug_info *di, unsigned int base,
 	if (di->classes && di->num_classes)
 		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
 
+	for (i = 0; i < di->num_descs; i++) {
+		di->descs[i]._index = base + i;
+		v3pr_info(" %d %d %s.%s.%d\n", i, base, modname,
+			  di->descs[i].site->_function, di->descs[i].lineno);
+	}
+
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
-- 
2.37.2

