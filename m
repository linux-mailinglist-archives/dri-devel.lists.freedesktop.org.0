Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C329C76C10E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9260610E45D;
	Tue,  1 Aug 2023 23:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8EA310E45D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:37 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-348c6696960so23937855ab.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932937; x=1691537737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HTIptaY1Q1Cw8tbq8hqtoZUus2V/66qWUMbxjps5ClE=;
 b=YGt+pOeMIzgeQcFKk1YoIVPGiUv9d0ApBsHpn8m7sbQCe1q/7jHeSG27FCuk5D0GeJ
 Z4us8ZNEBRqoPzoE67UFbHDJFWsq67bTIGeb6hypCdPArAdOmKLezg+i1kvabyIa3qdc
 uiuCAVOQvnfE9zdgVCJ5RnAN4FJKJTWJR9wDhoCVp7SMwp20Qrg33LYlVVsF82tw4eyi
 pjyGlA9F5mU0qcpCNRCosDqgNo9f0LuqKP7Hykpdme5PMThnaZPsiRqPisaSdNVqgA6i
 vcDontxbUduDaherfLGH2txkEqjB7kRnggpqMQxqcjLKqF06iGkt66UdInccVT6Wa5f2
 LduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932937; x=1691537737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HTIptaY1Q1Cw8tbq8hqtoZUus2V/66qWUMbxjps5ClE=;
 b=GLUhEtmgDljTGn1vZFQuu3ZpZ4EmdHoP7TfJr8egrRq/Pgy/1qwlE9W2bzqvKqFe+6
 ozaQikZmRmT+jZOK1M1hKwXY3oFlCwj+Ol7tUBVsrFqpBUNOHPIZnulofcLv7wjAPDUL
 ohMhqPADbIcW0N/zTY3XHsEh7jUPMRRz1D9rA+2/5tnuoVE/7wQI18EQ8LesMaM93Ar2
 fvS+bZrr1DciqOZlIJqIGmaJOpG/9qw6P+27hFLVtt1A+AypT9QHHoddcSZMkCOOi4PW
 ZJOVwfewhrKglSGPuU7PMNNbhtQVWaM9blygeong3/BWDZhRAUPvO/FHKNFF2qJVWACK
 V5FA==
X-Gm-Message-State: ABy/qLZXNzVQVUwm93zx2RF47krtckjki0GQGB5BByoHrn+jGEksnN7N
 RsaFRuMeP480yDzTBd3VRNk=
X-Google-Smtp-Source: APBJJlGN+x/KB7c1yI/91XJhbKctJVvsDjeF1RKQJgnXMkRh2D3oqpaVWMNLvhoUNPahRSakxP2hYg==
X-Received: by 2002:a05:6e02:1b8a:b0:349:2c56:a474 with SMTP id
 h10-20020a056e021b8a00b003492c56a474mr5458284ili.30.1690932936931; 
 Tue, 01 Aug 2023 16:35:36 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:36 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 13/22] checkpatch: file-scoped extern special case for
 linker-symbol
Date: Tue,  1 Aug 2023 17:34:59 -0600
Message-ID: <20230801233515.166971-14-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801233515.166971-1-jim.cromie@gmail.com>
References: <20230801233515.166971-1-jim.cromie@gmail.com>
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
Cc: apw@canonical.com, joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"externs should be avoided in .c files" needs an exception for linker
symbols, like those that mark the start, stop of many kernel sections.

Since code already checks REALNAME to avoid linker-scripts entirely,
add a new else-if block to look at them instead.  As a simple
heuristic, treat all words (in the patch-line) as possible symbols,
and save them to screen the WARN quoted above.  For my test case, this
included BOUNDED_BY (a macro), which is extra, but not troublesome.

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

