Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E9AD1C012
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 02:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CCA10E304;
	Wed, 14 Jan 2026 01:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Myx0pdNy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94A010E56F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:58:56 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-3f9ebb269c3so3790290fac.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768355936; x=1768960736; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oa5wcVDeV5J5v7vkbrVOxP4Roi/4nUDRF2hheke3WoM=;
 b=Myx0pdNyX65Kjrfb+V/XE0zHq7ktuk2IKuh+HIbsgnBOZcAL1/xxcFtwxSJN49oodu
 ++KfT95vbPCFjLfc4OM+mkR8C7Ztr6CLUM0uBE8B2gsseG4AjMgQH1qcRD7a1JTne+O6
 0Ihm6yBInAzyH56NS7mmkaoPRJgtY+UIRWEr533E6Yj0uq+7jNyftQmnCSVB7DAS/Syb
 qoC8ZdFWbqpo5LAN+C3TJ60dkcgULAH8p7OYeE0l7Nbt8U9N7OuhOt4CjtvfDLzAqg0s
 MTfMsXUwB5SrvFqE5KAkSmLwrEnxTtECxdxIFjR577R90CmocQNykh2wZ9YdNxcaEvE0
 4wxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768355936; x=1768960736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Oa5wcVDeV5J5v7vkbrVOxP4Roi/4nUDRF2hheke3WoM=;
 b=k74n2e0txCl4gN2fvm+ug6ANVFkLImxuAGP/ZebS2rvbNMNUs9kIXQPwF6aNkHp1sT
 gSkUtuaeVAY3glXBeVajMC0B9IgaqOho5ILjN9thn6eDZiOfvqJo+DmYzRV/VP7QydL0
 F19lDyG8RCNImnPD6ztRJFfc/XPIu50f5WlWFfBZ3k59Vroc/KdBX8AbebH6YKySJzel
 4URZKxA72qLv15Yp5tR6quTK5DBpa0yaaHjsbdM1ML0YNHX50TeEv+wdjOqYNGmJNAiC
 A6yxv1z58x7iUSK/BzgbNue6kgqsaY86P2JrxAdUi0Kte0i+mzYsBU/giRzvp7cN0JRm
 bs8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3GUwtQWmxLf67H4zL43M2O/4V+95wjN0D644Isf5w+I0ZaDElpjOM4l9e+MxP8eYZsBVJwszaSYM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfLO91Ceaw+/iWTBclp38nlrBTyaM2gqg+pn9OfbXmiHfq1a6L
 RKkRSWmSLuWMn5UVbaiqlJ7FtBHbnsEq+xACmusWnxBEZWXFNETXTxrz
X-Gm-Gg: AY/fxX4Yamh5A9gTf78mlKbUW8T5Yt+1kFH0wU0WnEaPQe7/hNEUQR5scNRjw6ZkiPk
 VWQZedsU1xQvjrDCmvYPFYzQ1t6a7DsJXxWAJoZ4bX63ldev7tYkiv1MVUreuYB9bJ5M7kOPgQT
 nC+TokUgwr9K5RNRkmFqh/oKV0VYdZ5rGgQBgs1PYvhvnRIZNw/I9/9ZaOahgoQtqHJa1C8Flxa
 jnW9ISLc6CxW5z58Q8fniVmbXob8ifGvaMOOo5Z0I0/WQTAhfG1nDgT4qaifjRnomB51TCYLqHd
 TrYDokF4W8ned0Mco639oDLk49BvZj4YW6izoxgt4DEfyzb7T6Q4kYXMjQZMfA6Zb8Envrab+k5
 znkIjd+70RwksK7wuZhJ2BJwVcRqCFMMtnMLd47UIAk4B7klD5JLIhl0gLrq++60gFz6ZdIS0Yb
 dUtGMJRW5xpg7QAhjs9kqDh1nAJISdeyJmlm7M
X-Received: by 2002:a05:6870:3041:b0:3f1:6dce:b865 with SMTP id
 586e51a60fabf-4040bffc5a7mr412510fac.28.1768355935829; 
 Tue, 13 Jan 2026 17:58:55 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-3ffa50722e9sm15400748fac.14.2026.01.13.17.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 17:58:55 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 03/31] docs/dyndbg: update examples \012 to \n
Date: Tue, 13 Jan 2026 18:57:19 -0700
Message-ID: <20260114015815.1565725-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
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

commit 47ea6f99d06e ("dyndbg: use ESCAPE_SPACE for cat control")
changed the control-file to display format strings with "\n" rather
than "\012".  Update the docs to match the new reality.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 7c036590cd07..4ac18c0a1d95 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -38,12 +38,12 @@ You can view the currently configured behaviour in the *prdbg* catalog::
 
   :#> head -n7 /proc/dynamic_debug/control
   # filename:lineno [module]function flags format
-  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\012
-  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\012"
-  init/main.c:1424 [main]run_init_process =_ "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =_ "    %s\012"
-  init/main.c:1427 [main]run_init_process =_ "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =_ "    %s\012"
+  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\n"
+  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\n"
+  init/main.c:1424 [main]run_init_process =_ "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =_ "    %s\n"
+  init/main.c:1427 [main]run_init_process =_ "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =_ "    %s\n"
 
 The 3rd space-delimited column shows the current flags, preceded by
 a ``=`` for easy use with grep/cut. ``=p`` shows enabled callsites.
@@ -59,10 +59,10 @@ query/commands to the control file.  Example::
 
   :#> ddcmd '-p; module main func run* +p'
   :#> grep =p /proc/dynamic_debug/control
-  init/main.c:1424 [main]run_init_process =p "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =p "    %s\012"
-  init/main.c:1427 [main]run_init_process =p "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =p "    %s\012"
+  init/main.c:1424 [main]run_init_process =p "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =p "    %s\n"
+  init/main.c:1427 [main]run_init_process =p "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =p "    %s\n"
 
 Error messages go to console/syslog::
 
-- 
2.52.0

