Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C20A793F5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E230B10E879;
	Wed,  2 Apr 2025 17:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X3OGWk92";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D5610E878;
 Wed,  2 Apr 2025 17:42:15 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-3d5e68418b5so835435ab.2; 
 Wed, 02 Apr 2025 10:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615735; x=1744220535; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d8krvmT3hXiuiccuxDpOYGdDtTsrrIwxKLxWjX0uKEg=;
 b=X3OGWk92xzn9CfwiU3AakSpr9ZQ5mijF7Ewz8AmnovMBlRF2dMVyJTGpi+GNH2Kom1
 5hFxoDJ4IVMrsTyvXFh9Te8LS2YH7MAfi3iowh19HPs9onK/XNlWrfrUMhKK5s7xp6Hd
 RflqZxaYDzzxmk4AYZ8A9K5a8RTtgWgBR8NBlaC3/JlF7SKvp5sXx8LdCrriv/SYOW2W
 pZ3toVDO9zWCJUfaXiNAQ/T2+0ttZ2doRmgHlhaQGZk85Ftp7iAdozMhJXNuLFlcGfgj
 X2ZBH/TQaRn4THgSWS53/Rr8YdEjR5SNYEhPq+VBRaxUEwTM3qy4pg1yJzmUKaysB6DG
 M8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615735; x=1744220535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d8krvmT3hXiuiccuxDpOYGdDtTsrrIwxKLxWjX0uKEg=;
 b=a94HlMHbI9yW4/K9TBPUC1qHplGEnNh9lbllN7A3EMLkhq08I2RLkTufFTvg95J4Lj
 K0ZkKGqYn73uBJ8T6tYifR/Mt1RkMMwq+F/zOTXsfprlq+zxJThAbWx0lJZ/sIT7iMF1
 gYkEGqc5pseTJWLmrxfuKkVHLkpt/Vv1u6B3ocKvThOGVj4KDdejy3UoI4mlHPlKUvQi
 jpnbNzhyv7mfr2bnMZdpCZHrGx6szmtjMoszr0vIabNCmrdabRsntj0sHtoTJoiaqBSi
 unvFLOrn2ZB/m0ePWu+mm2Yo1cM0F3ETMo3IxFQb810sHisiftjJDEqXNKy5yZiJam8j
 qFPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU96+EdrzmUJ3vj1bvWufbif8Rys5mdMTnXo95i/2MM9d8y3C2HGKs/yTgT8h0zd4Pq3R0h9sHE@lists.freedesktop.org,
 AJvYcCV+f9GpBtzb7UoQ0Wfko02NlgpB3As6EW32ROlYSmuL86p3r2WpwPrHpJYxUEyr4H3lEkJbGEYE9T6i@lists.freedesktop.org,
 AJvYcCWLl+HpxspaulygOH0wuhwPXUxhQ0HI7lA/DeUYStR6CSloOXyljm8YS2FS8eylAb8765XbKXvRlMPVL9ogmQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXIW7xte8FOPrTne/Dc6kYmUksivatLJMmro1TKGM07JuU7gvy
 WWFFXp1TZ7q8A7IqzNac7n35wv2tAg7QMaYdXEE1o7oQDU8gELp9
X-Gm-Gg: ASbGnculEuxuobNAp0obMM2yoOsJeIw5BG1DVUkz29LhaNUVu0p4/MsjZgXBhwv6QEg
 mm2A68CXEleB/a08hZ9h+4PxQ9YuKKJgbHCKrZXGi0tRN7tx+R058hytW/3oAix70E9xKUcdJe/
 KbxientdYs1pncgTeiGaUfV4pGDp4NaQziKoeTGiY1LHZvWSaU+BM384hAsFj5s4OhOnqQVPURm
 CotTvYonj9BYV5jaPBX5K5nnUhyl5ZPVq01XT4J+QPXjhiMgVcalhaw6M7f14/EaVFFNC0L4aw9
 m7UuR1kD82zYG/fq8upwzgX89kY0Iz2re4cBeRh1qBwsPxBzFp7VyJf1leAZ8Osjg4fTIxeVLDt
 O1C2VIrX6hFgz
X-Google-Smtp-Source: AGHT+IFfosceATDKvJJ46yRHWVuAnvPMdP3MQ3uyX0/XQ3xbrKDap7g3FuGUZOEfht1KRhM3yUM73Q==
X-Received: by 2002:a05:6e02:1a09:b0:3d4:3c21:ba71 with SMTP id
 e9e14a558f8ab-3d6d5543888mr41235455ab.18.1743615734827; 
 Wed, 02 Apr 2025 10:42:14 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:14 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 02/54] docs/dyndbg: update examples \012 to \n
Date: Wed,  2 Apr 2025 11:41:04 -0600
Message-ID: <20250402174156.1246171-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet<louis.chauvet@bootlin.com>
---
-v2 fix missed \012's
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
2.49.0

