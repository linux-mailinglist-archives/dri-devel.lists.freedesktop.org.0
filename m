Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QUVLI18bjWm/zAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4044E12877B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42AD10E671;
	Thu, 12 Feb 2026 00:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="anK6P6ds";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A3F10E675
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:14:16 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-45ca17ef16eso2095569b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855255; x=1771460055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vld9IFfyvePqt5M1J9/OwioGOqjnLV2rFk+KzTunpXM=;
 b=anK6P6dsd5FbuivMYY4rw/1A8g5JQpbUJ+wtpB7m1ffd3q4fLWjxnaFy4PxXnyYs3l
 ZFMV8ZVAwW0/mS5ONLnhj+FMFHbuS3GJkSpgxvvmPYsgptryQ8ttiNWH8EiXguLAZR7F
 Jfcz326ELncZ1yIiOoNnT9l+zVvZQDQrAEb4w0asmIU3YC/uNg+brbz2bx3b3OooiF2d
 7WcWM/5IsoL6/olgL/g5uUXemlR2gCNy+/iwjbaI1UMW4Hai3lcLPdczFbbR4cnhXAey
 xUEDjUmRhqS82+dDPBOB3dUJ5j9peSHFpoji2IYtpJIqRN9nyFn37XrQZKBRHKbZtE0S
 1pWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855255; x=1771460055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vld9IFfyvePqt5M1J9/OwioGOqjnLV2rFk+KzTunpXM=;
 b=QcJUbJg7ab8EiPT6WrKNSByvNSlKG1yOOTluf454SvzZ181K7vEQ8tz2EawAjG1QlQ
 zQGK0SkoEVnCC8kmcaiO3vpJzDuNMPnnL/81nBYVRUAh5EIratIx6p/P1q6leuKiG0y4
 2V0HUaUXQu5P5p9HsSRu2eqrVO/0641/Mv2WUmcQGX+xug1f2zeDWYmXypvrGubMiq74
 RxBjxxOF+3xZUq54RA/FYdGWWC2CAFYqTVY1StuKUv7TfMMSaLBE/PTyV50hQYCOt06e
 24X9hHHNkGE9A4MvlXAHbkek3c0YQmGvkM3Wqgtr9T2gCqJbBpKtUfSpE9tuk0eo7nj2
 3ajw==
X-Gm-Message-State: AOJu0Yx50T1wohuLIMEIP3GeEQQCXd04ADLVaoF2HjkRpl+ntf++vczr
 CXBw3vyPJb4V4wmdEWh2XnOK4Ll4l1fAnH3z5q92VpWnXjgA6cfvjAy11WHIhA==
X-Gm-Gg: AZuq6aKwTt0YzB5gsTXW3m7g6Dyu3rdE2OUzR/rl6w2fIz8qQyFTxWqNa5ROLlBT7wu
 QJGLY+j/4XTUPbRplgvHIP6qfV58kkaQq6a1fFk14ULyIAz1tFNYrzY85KWCI82TIVn39ULhvYw
 r85VRiD6P4fK8ioym5UdeYAfGRstqSC7g8rLomR4vWfNcf1sVJHuVD4KYHs1UF9GFoBlBj3ytna
 OcHtZ4vHqMcQ9NW4lbfOLso+Iu5kzfxJIDHm1RWkp1lwYzrX1NdwgCP+n2B+234OC3MZpOSL9jy
 9D5oKtlaA0IlVW0aTXoYb+OLpTz6hBjjc1hVSq4CPp0WwPhs0bVrd8/MY+1b/HsPN06bmLt9E8N
 QJoNVjeLT9FCWqkaOcGnmXFZX6c2GphcrK5Wyv3sCwjSgDCu3g8hvF24mP8A+9IYVGnyrGNDh+/
 Cc/VReYUROO7RLrZfANpSL7m82rpGyY3Hzl3d1S3f6ShG1rLse66mr
X-Received: by 2002:a05:6808:1799:b0:45e:fbe0:1bf3 with SMTP id
 5614622812f47-4637b8c6e9amr532472b6e.52.1770855255240; 
 Wed, 11 Feb 2026 16:14:15 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:14 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 04/61] docs/dyndbg: update examples \012 to \n
Date: Wed, 11 Feb 2026 17:12:59 -0700
Message-ID: <20260212001359.97296-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-4-jim.cromie@gmail.com>
References: <20260212001359.97296-1-jim.cromie@gmail.com>
 <20260212001359.97296-2-jim.cromie@gmail.com>
 <20260212001359.97296-3-jim.cromie@gmail.com>
 <20260212001359.97296-4-jim.cromie@gmail.com>
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
	FREEMAIL_CC(0.00)[gmail.com,bootlin.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 4044E12877B
X-Rspamd-Action: no action

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
index 095a63892257..4b14d9fd0300 100644
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
2.53.0

