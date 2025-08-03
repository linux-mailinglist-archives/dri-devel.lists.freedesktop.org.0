Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F070DB191B8
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A0B10E1B7;
	Sun,  3 Aug 2025 03:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jVAbR6kB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8D010E05F;
 Sun,  3 Aug 2025 03:58:32 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3e3faafe30fso25237635ab.0; 
 Sat, 02 Aug 2025 20:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193512; x=1754798312; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=beSu7CSL3w07WglnJy1Z2nCCA3tI3eTc18tKf1Tqulg=;
 b=jVAbR6kBd7FEzyfTcJh8FYzrvls4Hs8a5ijBvpnDIL7AHpfUoY+BlOmKUFl2ggqmaK
 Y4NsredpEx7KFmXSBETGCWOiPEcHO17dHxVTQ2cB5h6CupGbjCTHmjzUyPzrJS6ETggZ
 NLz+YHmJIbJBfrJxcvVYoo4JWKzFdbqH7zn+2vdv7TgnXlTuK3IBPGZY3wCb8PhtITKv
 r0WBWoYFEvqJ9/xqBcD1htal4LYtjWZNMRJueC+PXfujhwglhSZ1lQ+YfWtgLkde0D5j
 5bNEjy/BgoYfUE61pylxJYsJ33xs2oqujhPCQnCRCl4Gy98Ee5WGE+O5af3yTIpoftdP
 PJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193512; x=1754798312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=beSu7CSL3w07WglnJy1Z2nCCA3tI3eTc18tKf1Tqulg=;
 b=NisW0sAVx9MEwHHqQDq8LbHAjYguWWB6ySENgVucmcDuWZIsi2fUedij1DyE4ayeDx
 ck6Fyau/Vq8ZJTRZofQ12MRreEspMcAq4Sy929v5akR/N/d82I5rfoVW52gP2YaCSQY7
 2m32XVMYMSFhG0Qy7v8Zz1f2RvSrcNigg0YntUqPXhluReeIduLcn75CirvPPw+CU8Ct
 S4+UyL3yqDRP8VVDA6CPhScPI3bgesrF4FhEQPFmU3QRgOu9C4fubr21HXlx7DsVisYu
 olXzpfv+1YnTMmZR2d1QbtSNfizBr8Vt1e6eKeqBo6Y+MbQ2s9e4kZpsR52wO2kpPetk
 4iMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp6waV0r7WT3YZhAIuPuOK7C4aumIGmo2jWePeMNvnKNCVZ236wj7JWRBMEiGaFeyIckcn07c5@lists.freedesktop.org,
 AJvYcCVQvybxjKG9tZS8TxStBw+vnLGlccwmOzXOHVj2+95XddazNMFqopknN4X2iozaytBWd6w9hDkA4rYP@lists.freedesktop.org,
 AJvYcCVuvW9roUyegpTgEO/u1OsJ/LoGorQjhqNM+6C5PuTmPA+1SSxgKJYWgs9rpZjRJZVidoXv8VJ/viC5/1Qk2Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7JrckFMZdUUSHRE2Hc+FjZP3RKajeJS4fP/Xr1ibgWubmC3lI
 IDcOvQpgwnIYnuaDsKbVS3AbFqGiB/oXaOqNBM/U11lmrGPGwHOrmVeCSvybxMi7CNY=
X-Gm-Gg: ASbGncvqjb1iJbGRGtHvnLL11c3Q1aPvUX/+utIgNzs2xTAlqNTb5GnOZnF8UHsGxTF
 KyTztYXAEiwt6oL/Rdam+R7J49M5ETK3WAPYBnS2SKRLKCYvdUV7qF6w1FLZkfM3fGRTkevyV4h
 VX0bPEsFLJ0fRiCXu/+PYuTgD9W69YtXZqMnn3LTISmbsPuHWgjkUSMdfSB1lFZ3SHoyApynRHZ
 ddDAMRHYKrtmDdmWH5UH2OE4HA9MDb1Ji1Szg4ZTzAtepa44LdQiVatYWLi4XDJXwuwskZkeCdw
 UrkOILc66ZFsWheJyn1C3N+7e4eO7EBg1vuMxk6eCFu/MUxueq8qQX1R5AA4PvSTwhnJ/wvFHvG
 X6ONrNrMjcy1UD1wlxRj40sT0RnbDTtRE3n/rrSLxOQickvrDUJJvvdYK6kJMchL0QO2W81yXap
 p2KQ==
X-Google-Smtp-Source: AGHT+IGPxms8wwqy9B3Lg0t/TQmY+5ADcF8m62tHbLa+p0mv2IAzywY5OepZnyyKE5NE6pgPzLJclg==
X-Received: by 2002:a05:6e02:2608:b0:3e2:c345:17f2 with SMTP id
 e9e14a558f8ab-3e41610a08amr92075105ab.3.1754193511817; 
 Sat, 02 Aug 2025 20:58:31 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:58:31 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 01/58] docs/dyndbg: update examples \012 to \n
Date: Sat,  2 Aug 2025 21:57:19 -0600
Message-ID: <20250803035816.603405-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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
index 7c036590cd07c..4ac18c0a1d953 100644
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
2.50.1

