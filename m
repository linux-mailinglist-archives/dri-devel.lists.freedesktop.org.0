Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1C6C6B8F1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2D510E523;
	Tue, 18 Nov 2025 20:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="egnAWWsm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABBC10E514
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:04 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-434a80e5463so9057945ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497144; x=1764101944; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2RkJ/qsTnmYtiv2riH5BfVtIzUZjxXWOsaDgvgU+8z8=;
 b=egnAWWsmQ9GQWoeD0gAccUKpsnN3g/tnCKlkZ6dgipbpHZPsT4rinK+ay5f/nHFqrn
 iOdhbcN4cRiXjSew77XTik49mwDKdlVkbqJF3vUrNjhWWtEhSfof/PjvizyV8JnFly7j
 mrzNYis2PVS7163cQVTJM6tEpQV0UPyuzDp4nT+nbe8VsmKGvxNb5Cax+csEEO2mQ6IY
 GtspE7VKl9EHcdpwkx6bz1ce7wCH9L2t+mP7My8Z3CkffUQlOqOJJczgZkUuGZAuqo/e
 6LURBqUCUglmEmiEuOb//9oNOtJoJSbVLky2ySSeKMhoPz81BprYsGpyi9xfTDfjO64X
 cWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497144; x=1764101944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2RkJ/qsTnmYtiv2riH5BfVtIzUZjxXWOsaDgvgU+8z8=;
 b=uVyyypLDUxouUtVQ23d3rO2VuGiEAXoLtjJo0FpDES1/nVe41VY3UqGgy/OfS78JER
 hSxeDoTF4X/uEan1cM2i+Wy9//JrPeEBw01GEa5zLVyXQSI0zgXguLVmJSWhDlw0W35o
 3raOSSmNuC7XvruWeFcc35D2OQEI1eONt9DYw219WA6ZF53LH1lpJoeJHbV9hV8jzEed
 wYnQBjXL2EH6tfqpjrIWf3j47Yq/dE/ZYvHwWM6QfqNp8dZAnh3uVSrwW30y3ucGxH7f
 gn4hb8q9iwy+EgpXkr4XI5Rgfxaa5/iVIOHCUQzN31m45xLdmQmDx4H7NAjbjA6ibUI9
 wXRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSJ1vbcj2YKADSq6HLwUZycFOs0qNrH3m2ndJQYWfbDefxPjj02gnWys0gyDSoO8c8vhuEd7zwUXI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8JAE9617l8BufiUW3ODmaXW4nAHeMeQUsZ104G4vLDaCNxieu
 cMf+eNjmoQil1f/RCe1ceFlH9w0eRb8NXRNu5K6TLsNwEjryGZVITn/k
X-Gm-Gg: ASbGnctJNUKzEBTgr7mI6+FJSIaBOxBB+QrrjVgjc9TVgSqZ1MA1u8E/me6FBYSfn8e
 Iw8wziBDEGfpz1h9HUMnyiOfcX7Lm3GBIinwuy+GRW+h5b7k326rFVIRFsVPdezrfes1eyrRWiY
 7pf/kBt1wl9smw2dzDkYB/oMi3MB+wKqvcUkEADRKjaJHXRtBoMiedmX1TIa5+2TxKUPII1+0JK
 giw1cA6HD+CFGPa7M5b6L3vMbNH7OU6vqtS3YF91BT885CNGzsSa5gqlem1AkEmmmU05BVOuol6
 8GkwNRJjeWfn/2K1fG67jNBwu3uVezYaZTNYC7SvjoaaTqGCHGWVfg/WdRWnbUYkrZrI3DXmDN1
 9EJ7hZhrCSSNAEzq4vYjdOhXl6eSbMygJjGXexkW4bo+3MEdvoRC15OPr3i3k301aHwKMYwNFEH
 W78AcqZQCSy1CpBHEincQso3JNPAha2DkIJHEntjXbqi5FelwsceL7aWn6dwi/4OfXWMM=
X-Google-Smtp-Source: AGHT+IF9PJHPJJT08kehAt07KlJOkieQ3SWDnT+Okbr84dGUYH7BFIPznagaSGfH8TubAKv/krhMFw==
X-Received: by 2002:a05:6e02:16c9:b0:433:4fa4:912e with SMTP id
 e9e14a558f8ab-4348c87b4b6mr178059635ab.4.1763497143803; 
 Tue, 18 Nov 2025 12:19:03 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:03 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 03/31] docs/dyndbg: update examples \012 to \n
Date: Tue, 18 Nov 2025 13:18:13 -0700
Message-ID: <20251118201842.1447666-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
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
2.51.1

