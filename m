Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D142BCA719
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 19:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E454A10EACC;
	Thu,  9 Oct 2025 17:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HLWLzPwF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553EF10EACE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 17:58:45 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-42592472031so3579885ab.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 10:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032724; x=1760637524; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7BFoISqrXfzunSW6Z4lpDyEbHwjrfmpqrwUs/T2P0T4=;
 b=HLWLzPwFjDVlA8/LiQVysznL9yTgnC3IGb5NHs3sEFmIAP0/rcys6dm/HzSQSA/aiX
 QD8aRHEmzKGwzWZ8JYal5ACE8sPIPwB5FsLnnYoHv8iqshdJ1D+LiY+xe/3+ddLIWA5p
 cqn4htZmyCkjfHG/v7p8PXXM07DOIu/nq1F69EBCtEwI/XLUEQ87t0+ushp1gQf2icvE
 qbz13D3H6Y3eIEeNBJWw73CIls45EU1qrt8HBgEtSis2IBBtoVu6FKOlE+XopYIzbHnp
 v+AVZx3SLt9iuslpRpnRQiFFPhKUrPFotanqOPcotr69BNvQEXIXH0lEO05Vx5M16dFA
 iiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032724; x=1760637524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7BFoISqrXfzunSW6Z4lpDyEbHwjrfmpqrwUs/T2P0T4=;
 b=DLQW9MDEAC98v+KyovC0FK1X3QcVS4m1ItIEKM/4UJ7nL1UKPQL4W6Rt3O2+nx9siY
 g8w7xtlTStBwKlpG6huYldaeU5+bAxnLszFOPeUf+fuuI+0nrTqyNtq1sGtesFuJU4XK
 wX8v1WzziebmMfNvefbvaooIinVnVW2DnaUFEs7jVVmqQtLPI37zBe0jJlBPkGKSFVlB
 rAkV0szQSiBnHqfLc2Hn2L0xB63yKpvMY+BWZznW2dvrA22CFwtg7BoAUfOFrYC5MSg/
 ZzLRq/9z84CqyrLBD9+R5qf8FA1FZpZsyTZ8t70Wy6BOlO3THEVRS5pm6Rhm+sBLpnP8
 crRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnNo1Dic050HBldV1UK8VVgzIZZ6qkat25R60SnTFfHv7PpEiIASQak7WK47OSH0zAMVUgm4Mq9TE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh20cUJ7UguTK0EJpGVilB7h+FetLxilZW1yaipWfvzihKTRcy
 gU3hzY0KHOuc/x+LBdPUZI/c9xcUlTxHdOFNiKk6jY8eCp+xl//f/bFe
X-Gm-Gg: ASbGncuK6PWOjRlAhCwz1TSiL39Td8Jyd30S0Pr+AgSh0sKkszLCsjUYbSa4tBc8Tjq
 2jORiaj7BRhoulvwkhtPjCyMk41rS3cSnSJG2+GSt1UqxjQlTJA7wm7tfv+qO1l/gJOOPF747fI
 rYlNITP2gpmuim7aeKQ9pBtl1thYXKjRLRwonSHwUJwW96YR6OXJ5E2HfPJiI46/2Bx8sq4oDGp
 JPPOudfr7VBuec+VbNHSyRGokJkYNJXKGcEg6QjIXH19tTQqk/bf5bEaCeyYWEOmYH9Pj7UReMX
 AJ+5TUC6RX4ke+97u0j/bVrs3B9sU060jaouT5YA5hBn5HXjJMUC3TaP8nKiS1flwk5KAk0Ck78
 4ZNW8/DQFdHS2YO5caSdnoUyG1FwEMISTcwQx08fD0RP1rWKc11q3qkrFTcrMdKw3T2f4Tbt8tS
 ANTpk3jD4fshsVJvHOtRXoCU//5Ks=
X-Google-Smtp-Source: AGHT+IFdvzN/Qe3kT6LC4KV36Vpx8Hont4QG2a9m6SfK0vqpuJ8k6n9bUCxYy5aRpvHqGEB15mxCww==
X-Received: by 2002:a05:6e02:1946:b0:42f:96ec:50a5 with SMTP id
 e9e14a558f8ab-42f96ec51a2mr14056415ab.20.1760032724385; 
 Thu, 09 Oct 2025 10:58:44 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:58:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 01/30] docs/dyndbg: update examples \012 to \n
Date: Thu,  9 Oct 2025 11:58:05 -0600
Message-ID: <20251009175834.1024308-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
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
2.51.0

