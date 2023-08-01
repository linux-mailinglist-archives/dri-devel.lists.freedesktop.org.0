Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7821176BA85
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 19:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C2F10E44A;
	Tue,  1 Aug 2023 17:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF43110E433;
 Tue,  1 Aug 2023 17:03:34 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1bc479cc815so2495747fac.1; 
 Tue, 01 Aug 2023 10:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690909414; x=1691514214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gFBA7Lr3JItg7OYfOcjW/1QCQzqvPk7XHacFdueAfEI=;
 b=fyEaICFFhma8ZDWVxdrVdT9mRYJOqU4wwrKqayrPPIzSX0jgeT8MHqKihpTqpfkPX0
 AuU1FrgxAstF27oCCP7HObML0aANdtcIuVhVQy/6BcY3Za+6CfR6UZD9RyDXKFmdjeDd
 j9eVLnXhi+TVfFDHPVlzTPS+WxSeS2sS8V9+k8g2M60r0Yqn//MxO8UkjHL97X1DitKa
 uNwYK93r5TRV5sMkgolxy0OA7ewh9gqSDelFGBzucaO/d8T3YLjIFtMpJp7R/uIwxsaT
 QhEiR5Rykzc2qmm1yk+lqFHMii8Za4P2+ZIQ7Ul1pBHT+nM3Di1EFuIgHltaIVEDKoNN
 xoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690909414; x=1691514214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gFBA7Lr3JItg7OYfOcjW/1QCQzqvPk7XHacFdueAfEI=;
 b=WSq859gS/kmtHbdhljzbQt+EdLpdS5c1neTs/iwETcIoE7ayERqVaDjupejSW0bq8N
 CRK61zQlx/3V5WRMFyxN1x5lOUbhW3PQHC4TVNiswYR34cR8nPJ0tPZHOGHeCXbWXwpJ
 PtUDBg6W3dv8sKHFmBHshIEJ8pDXNrdQF0z7E9jcCrznK5/PZc5+QoTWhw9zpVC85SpO
 fG4V6DqOyZUSqbYqrzlmNr6wZ0w4bgVYS3J40fwdn5L0GWVWFq9XohrgBBy0LboduwCQ
 S44gJXWrXj+kFCbQ/weDh7Wadmg5e+gM0D5r/PBA6htrMHmO9oahEcj/6xIYvk/QDuIY
 myRw==
X-Gm-Message-State: ABy/qLZnGAVy8sWvcdktJ5vocqUEGGz6bt4Wp1lesNE5gAEIAkBO9nrR
 NeD93x/9BNdoZMSpz2+Y+pbIpurZkmvIoihl
X-Google-Smtp-Source: APBJJlGssyyVGAfHxBiKUeWr+27L5iBh1gEWtkvxA15BwySavPliopjND05fY7zX72MTh1+f20XCag==
X-Received: by 2002:a05:6870:a548:b0:1be:e066:acc with SMTP id
 p8-20020a056870a54800b001bee0660accmr7146920oal.50.1690909413929; 
 Tue, 01 Aug 2023 10:03:33 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o20-20020a02c6b4000000b0042b144abf71sm3768577jan.179.2023.08.01.10.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 10:03:33 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, daniel@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 13/22] checkpatch: special case for file-scoped extern
 linker-symbol
Date: Tue,  1 Aug 2023 11:02:46 -0600
Message-ID: <20230801170255.163237-15-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801170255.163237-1-jim.cromie@gmail.com>
References: <20230801170255.163237-1-jim.cromie@gmail.com>
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
Cc: apw@canonical.com, jani.nikula@intel.com, linux@rasmusvillemoes.dk,
 seanpaul@chromium.org, joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"externs should be avoided in .c files" needs an exception for linker
symbols, like those that mark the start, stop of many kernel sections.

Since code already checks REALNAME to avoid linker-scripts entirely,
add a new else-if block to look at them instead.  As a simple
heuristic, treat all words (in the patch-line) as possible symbols,
and save them to screen the WARN quoted above.

For my test case, this included BOUNDED_BY (a macro), which is extra,
but not troublesome - any extra words collected would have to also be
symbols the script would otherwise complain about.

Where the WARN is issued, precede it with an else-if block to catch
one common extern-in-c use case: "extern struct foo bar[]".  Here we
can at least issue a softer warning, after checking for a match with a
maybe-linker-symbol parsed earlier from the patch.  Though heuristic,
it worked for my test-case, allowing both (start|stop)$symbol's,
matched by $symbol, it wasn't thrown by noise (BOUNDED_BY) in the
maybe-linker-symbols.

NB: git diff ordering dependence on vmlinux.lds.h before c files ?

Cc: apw@canonical.com
Cc: joe@perches.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 scripts/checkpatch.pl | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b30114d637c4..f6b6b2a50dfe 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -74,6 +74,8 @@ my $git_command ='export LANGUAGE=en_US.UTF-8; git';
 my $tabsize = 8;
 my ${CONFIG_} = "CONFIG_";
 
+my %maybe_linker_symbol; # for externs in c exceptions, when seen in *vmlinux.lds.h
+
 sub help {
 	my ($exitcode) = @_;
 
@@ -6051,6 +6053,9 @@ sub process {
 
 # check for line continuations outside of #defines, preprocessor #, and asm
 
+		} elsif ($realfile =~ m@/vmlinux.lds.h$@) {
+		    $line =~ s/(\w+)/$maybe_linker_symbol{$1}++/ge;
+		    #print "REAL: $realfile\nln: $line\nkeys:", sort keys %maybe_linker_symbol;
 		} else {
 			if ($prevline !~ /^..*\\$/ &&
 			    $line !~ /^\+\s*\#.*\\$/ &&		# preprocessor
@@ -7107,6 +7112,21 @@ sub process {
 				     "arguments for function declarations should follow identifier\n" . $herecurr);
 			}
 
+		} elsif ($realfile =~ /\.c$/ && defined $stat &&
+		    $stat =~ /^\+extern struct\s+(\w+)\s+(\w+)\[\];/)
+		{
+			my ($st_type, $st_name) = ($1, $2);
+
+			for my $s (keys %maybe_linker_symbol) {
+			    #print "Linker symbol? $st_name : $s\n";
+			    goto LIKELY_LINKER_SYMBOL
+				if $st_name =~ /$s/;
+			}
+			WARN("AVOID_EXTERNS",
+			     "found a file-scoped extern type:$st_type name:$st_name in .c file\n"
+			     . "is this a linker symbol ?\n" . $herecurr);
+		  LIKELY_LINKER_SYMBOL:
+
 		} elsif ($realfile =~ /\.c$/ && defined $stat &&
 		    $stat =~ /^.\s*extern\s+/)
 		{
-- 
2.41.0

