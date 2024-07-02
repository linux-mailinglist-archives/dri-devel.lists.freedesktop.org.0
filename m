Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0349E924A63
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BD510E6CA;
	Tue,  2 Jul 2024 21:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ma7wu9lS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24C310E6D0;
 Tue,  2 Jul 2024 21:58:41 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-7f3c5af0a04so246283839f.0; 
 Tue, 02 Jul 2024 14:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957521; x=1720562321; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VIvOBtUs6wwUYmdF+Bm1LKjLjq3TMDH2Ljy+h6N5XvY=;
 b=ma7wu9lSnSgZ+pP5vJE82Eo++ycWBLgB/lDZG0mBwUbeHTTjn3exehbIhitPMSAZec
 E0ToH614E9vE4vrFQ+qFc1Tj5zfoeDgqjH7bf3mSZzg3iAfi1Nc2zIdBUonat1SNs+eF
 5SjInwwc+CrMjp13M/WpAw39OQy1EWEzbYNzXaANzoq14jzJQ80Opjo95ViOo4KYdo5q
 pgCO/0vXAaCem+K9MwrnRWvm21f88OkKx+daZZ0sdHgqQjCgVBafuwqfkcryGoE1zSxN
 aYVg9SVPfB2yDQ5pai7lbTmVpwrjcXdjGX0h20XlnWCVZFnedP0jlBTIcNsQmWHCAKmC
 UF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957521; x=1720562321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VIvOBtUs6wwUYmdF+Bm1LKjLjq3TMDH2Ljy+h6N5XvY=;
 b=uo83AYtDzUJ6CL3+rjOrVdJqFQ32ENP8x/LAMtCTTpPBvX2sBPQoglfbKBJbZkk0Ah
 s8WFQWP8sf4Jh7ATC/mIIhlj/n7gMVfN03SpmvEcIvdboi0O5znOiub+xW6qvjVl0Ni6
 VDdE3nEzwBRSHiJCTO9FGnevgY5FVEA3UKJUSJ4xk3hv+47jdjL6I0DHFZ7nQAfhwdkK
 BEUivDTQX5Ri46/17DoYKcBteCt7sKk0ohaQW+8xa7k+y0bZSP+X2lwRtnKICyMbeIi8
 DAmQ4H6o8AkLJlJRePEoVaAcAQqEZBZclQU7JhdTyLWrnZO0SXigbN1SXOvyOihKGGcV
 BTKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtoApsMwh/uk0a7aimKhITUj781NZyKx5o/qyKGrOuk0jMlyWOLrIUeaa0qytr91W8O5/RpGYg+ChWAOmhqrBtOGViO5r/HR+XOtYqrtt5gUnhvQMgwt/AySzytQFR3K7vTB0CLBeF4wapeBS/C4ixBafydra3SbJDN/FTohsnp2evhOtdXad7KSoovkHpne641S3EH0xgh6k+UDGoJKmi24pJ9qHZxsV4e/MrgUFKhYJHRbU=
X-Gm-Message-State: AOJu0Yw+Znxo4hEr+g+GC0padUZO3co4+NgiuEkq+5ZGoxAmSWKNa8cc
 TpgJRGWw4PKd6ZduwldGvrhnAu80uC51mAKi80NA6z0embwDMQ/Y
X-Google-Smtp-Source: AGHT+IEk2c1hL6ZUgrQgYe6v2wFx5FJYF6vj0/kQsd1seeLP/2lOU4aeFAE+8OqE7VHd9h3YIT7KPg==
X-Received: by 2002:a05:6602:1209:b0:7f3:c683:2266 with SMTP id
 ca18e2360f4ac-7f62edff7b4mr1072199639f.4.1719957520998; 
 Tue, 02 Jul 2024 14:58:40 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:40 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 21/52] dyndbg: split multi-query strings with %
Date: Tue,  2 Jul 2024 15:57:11 -0600
Message-ID: <20240702215804.2201271-22-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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

Since commit
85f7f6c0edb8 ("dynamic_debug: process multiple debug-queries on a line")

Multi-query commands have been allowed:

  modprobe drm dyndbg="class DRM_UT_CORE +p; class DRM_UT_KMS +p"
  modprobe drm dyndbg=<<EOX
     class DRM_UT_CORE +p
     class DRM_UT_KMS +p
  EOX

More recently, the need for quoting was avoided by treating a comma
like a space/token-terminator:

  modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

That works, but it needs the escaped semicolon, which is a shell
special-char (one of the bash control operators), so it is brittle
when passed in/down/around scripts.  In particular, it fails when
passed to vng (virtme-ng).

So this patch adds '%' to the existing ';' and '\n' multi-command
separators, which is more shell-friendly, so you can more fully avoid
quoting and escaping hassles.

NOTE: it does break format matching on '%' patterns:

bash-5.2# ddcmd 'format "find-me: %foo" +p'
[  203.900581] dyndbg: read 26 bytes from userspace
[  203.900883] dyndbg: query 0: "format "find-me: " mod:*
[  203.901118] dyndbg: unclosed quote: find-me:
[  203.901355] dyndbg: tokenize failed
[  203.901529] dyndbg: query 1: "foo" +p" mod:*
[  203.901957] dyndbg: split into words: "foo"" "+p"
[  203.902243] dyndbg: op='+' flags=0x1 maskp=0xffffffff
[  203.902458] dyndbg: expecting pairs of match-spec <value>
[  203.902703] dyndbg: query parse failed
[  203.902871] dyndbg: processed 2 queries, with 0 matches, 2 errs
bash: echo: write error: Invalid argument

The '%' splits the input into 2 queries, and both fail.  Given the
limited utility of matching against the working parts of a format
string "foo: %d bar %s", nothing is actually lost here.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 235d85765b63..dcec7b3657bb 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -596,7 +596,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	int i, errs = 0, exitcode = 0, rc, nfound = 0;
 
 	for (i = 0; query; query = split) {
-		split = strpbrk(query, ";\n");
+		split = strpbrk(query, "%;\n");
 		if (split)
 			*split++ = '\0';
 
-- 
2.45.2

