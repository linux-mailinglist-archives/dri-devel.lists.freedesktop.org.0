Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610A3A1C189
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE6F10E29C;
	Sat, 25 Jan 2025 06:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lCLJulp9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D8C10EA68;
 Sat, 25 Jan 2025 06:47:12 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-84cdacbc373so84591439f.1; 
 Fri, 24 Jan 2025 22:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787632; x=1738392432; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kn9t7zpPYa6nVFkxjXtk64MWrHKDx8bG5odGszaJqIA=;
 b=lCLJulp9q9ssJra8v7tdQGNQmyNBKqeBkpN6NGRqjuHcebN5GB9aL3fGymlMeg5JnX
 /CdLn01m4x0gbNLQzOusHlHZzBg5r0+Qu4IWAk28qui6vYBX5eaUckBYFpfYoU0vuFZ+
 zfwQS2vsYQ4HLFHP2pQKbydoL6G53Kc8DerCn/iJjaUhPc+iPqcMR7wpdNp5C3g2k4Hc
 1eNJmel76fPY41frEezCRaL6J4PGVxTaPvQkGmuQ8Xu3HVO3AmWj5V0Z8owEJ3jm+/r/
 6rq8fEzJyI1HV1dGZmKVkQjSpLekhkS6D3MGLVqkoaLnhhzJDyR8gJ/M0nFdbpRm5AwV
 H1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787632; x=1738392432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kn9t7zpPYa6nVFkxjXtk64MWrHKDx8bG5odGszaJqIA=;
 b=FYxsyZHNuZKM7ShWCYTdVXMCXxbmrVKrS/UuzNtkS9Xt4ae+jD6vCMVtim20iN6ZmC
 qBxSuRKdQOBsiCiRXnLMn09iZs6/RGT2GT9OXjuqYhK82a2TIkgld81p/8I+8Q9Y2gnP
 LsC2REAQ/jt5lCMuKB281zR1J0Mymsj3Okf+8VwYzFC1O3fpdw0z9Pkw6ExrxHWZcJL1
 wl404yGkfhfocCjt2p6fEyZP3yljLqdJjecE646+qcv2F0WXNq5OygJ/7mAzzh0eyR/0
 5XbNf6WcuwAYwmvmTTHD5XNl+90wye3duGnyBrsS7TcZXDGrXMeW1UXz8ZOOIYPCM0GT
 iGfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy6su4ymiBUjPYOlqlyijyV56q6chT0XYLpoqBGZLM+kNlgDj9HeCvvFmjGYvcCSrAn2PsO6WEtfc1MX2+vQ==@lists.freedesktop.org,
 AJvYcCX/EjIGq+dFMbHbkVFlRDusP8gWk7E2IWqPu0DRFpGBuEXoHp6ucB0eu96Isyg4GD74e/eb2CYpLBUO@lists.freedesktop.org,
 AJvYcCX2zUmsxcsvo5UrklM+H8538ZkkSwHxomAATSH4oRk1BpjWkJsyLSJlbcShnroYS8mIY21HI1hgsY3P@lists.freedesktop.org,
 AJvYcCXchvKH1CZI5IpM/3L/njHRAMba/IDHsSXmrpFpWSgL+oRQsZ5xIWdGrSa7Ew8kksGcze38i0l+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiGGtKxM+XQWj4QJlA6aDJNhBVp8K4wmu5C1ILvgsvi5AR/D9c
 /DJCo/wWMar4Ha/xWCAlVodJ+EEUBy9onsobiDQaO7U3jZw8duTD
X-Gm-Gg: ASbGncs/qi0CSZzReaKIDZ6coPR/9xxBCeDjJXD+BXf9lo+nbik7UCtbbqPrNTl6z0E
 Bx5/aV+mUv6LL8/bxElZPyP2QYvkVX1zTBc87c29dui8G8XIGyMcyybzRsIC30tqqY7htRV/3ym
 j0iFikGELyB8Ov3OmucxQpweAPqcVABrys1/Q/dN9TZeRKiEO03U0zJab9n6TquFeyd1z+1GENA
 CmrvSRrlX0pAaHDNX9WNjfpRuZ7NNktTGybNm329TN+gjymaDF82eXzlHA7naGFnvC3mXzh6JVL
 OLVX/e+WHwA+5PCjmFo0ShEAYNluZi7rebbRUg==
X-Google-Smtp-Source: AGHT+IGbYt0eBv6uLTOumt0YrUKOyuE08ZMm9674V/UqKTNiWTiUDNTl45IgSuA0rftCQLWNy6OU9A==
X-Received: by 2002:a92:cda5:0:b0:3ce:6758:2500 with SMTP id
 e9e14a558f8ab-3cf74418e88mr205433465ab.13.1737787631964; 
 Fri, 24 Jan 2025 22:47:11 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:11 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 32/63] dyndbg: split multi-query strings with %
Date: Fri, 24 Jan 2025 23:45:46 -0700
Message-ID: <20250125064619.8305-33-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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
index 56e09e878f80..68b5a77c2d79 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -599,7 +599,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	int i, errs = 0, exitcode = 0, rc, nfound = 0;
 
 	for (i = 0; query; query = split) {
-		split = strpbrk(query, ";\n");
+		split = strpbrk(query, "%;\n");
 		if (split)
 			*split++ = '\0';
 
-- 
2.48.1

