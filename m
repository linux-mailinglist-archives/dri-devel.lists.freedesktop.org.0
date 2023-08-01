Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F35D76C10F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3F710E461;
	Tue,  1 Aug 2023 23:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902FD10E461
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:39 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3492ef885ffso5913985ab.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932939; x=1691537739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gFBA7Lr3JItg7OYfOcjW/1QCQzqvPk7XHacFdueAfEI=;
 b=SQht24mSmEgQWvbOPkxbE3yZBA5GBnMMJcxXqsjvCsUmMHzKHdsY6p8ID0gjBbgvU/
 ynU4lm5YmiDlCI7n93LIOk1kkIfDQGjLL3NQJGPtiLHiD4gWbzdasXYmcnAzEdDDZdfC
 oPYRmY4D0EQ/vZz57UBAcvDbnrfHT7DQfkqzVboRNwP64DfdFeGsK7Kfmvh6JJwQeFlL
 5dm6pJcneae30joKroCgYeBnmTZrqMkGcJHm3uO5ToyeclCD7vjSLqb4mikFcPNe5kLp
 D91ziP/faPpKnc0IB1MmcK1qrPyJOL3gtrMo7dDXuoG2e3Am8y9IEZIfP3Pc0tM5pZNG
 bQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932939; x=1691537739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gFBA7Lr3JItg7OYfOcjW/1QCQzqvPk7XHacFdueAfEI=;
 b=XpCxXhfb7a64QY8Pw2uKjQTNmOu8+qzTGpwXBHXRC2LmAmJgD/Lh9tJkSx0oRm++U6
 5WPSYa682SV0kLD4cxCEC/KlUxGVpxGjOPglJTRZHQCA1IUrdVM9lAqUfdTOuet7miGV
 SSWsoxxDA9BQ8jwgBVUodHdf5BkzqB3zUGdBzOFgXH18NVAzUBYG93PvPnilvYqkyTwW
 97bG8d0IW9a0GSa1qe/0MJPOa2iX/1I8q322q3r/+N74rq91xmBuFma13ZLirh5zWNHu
 yQqDuJt7nNTAxmrrOvIfWEdfVKyLBROEx+Yes4DUGsOfHXaHPDWRBQE45FmgXHAUTzkh
 ztHQ==
X-Gm-Message-State: ABy/qLb7YiT0UntuTo9WczkT2nOvnJb2eeIpFunYHotayNPkUyai9PKe
 9hiYOJhgSUOVhkC//38dVYI=
X-Google-Smtp-Source: APBJJlG9nV5WK7lsFPfuqfvhS9Yg+A4rFUFmy2Wp9l0YYTuZE21absrIbWKDg2aUCQHxZBGXkmeqSA==
X-Received: by 2002:a05:6e02:12c4:b0:348:8b42:47d with SMTP id
 i4-20020a056e0212c400b003488b42047dmr13901829ilm.28.1690932938792; 
 Tue, 01 Aug 2023 16:35:38 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:37 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 13/23] checkpatch: special case for file-scoped extern
 linker-symbol
Date: Tue,  1 Aug 2023 17:35:00 -0600
Message-ID: <20230801233515.166971-15-jim.cromie@gmail.com>
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

