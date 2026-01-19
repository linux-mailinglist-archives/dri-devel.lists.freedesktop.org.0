Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ED8D3A7D6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E374010E422;
	Mon, 19 Jan 2026 12:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KoB9JclS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D1110E405;
 Mon, 19 Jan 2026 12:05:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 147376014E;
 Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8407C4AF0C;
 Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768824316;
 bh=y5iZGxGixN2k9HnEvZMtqvRXtngWsH3N6Ec9onhRymc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KoB9JclSl2SERqOuHQPj5OWv2vJ0D2IgpAiiq76po1yxaLjUg6ccWM88joknbGGrO
 rkzWB0HdiAIbhFww4fZVwi4fiGze4qT2dfHkbQBB4nDpTcBTJlPwvr+QjL5rSKy+4a
 oAedl2z6+YasaC8XBDqtHeaMt8mfmebhM60valfqIDTTSm+1xXyQn9GT/Tj1ruNMnl
 80+BAU9G3Evl/l5woyEEP2gVGv5CGUdCHiXNS+CvvJHDa5Y6jR9k2PjHDtoHv0p9ro
 sFAuNwh1GhM9zgg1Y8rVA/35EKKeDcyK9KYSUdd/Lw0PDVURzyvdRpfMUBJa5KPQu1
 rH9SM3aIkAi7w==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1vho0Q-00000001ZjQ-3epy; Mon, 19 Jan 2026 13:05:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 5/9] docs: kdoc: remove support for an external kernel-doc
 from sphinx
Date: Mon, 19 Jan 2026 13:05:00 +0100
Message-ID: <a97a8361546648906344457a7e92e4db533048a9.1768823489.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768823489.git.mchehab+huawei@kernel.org>
References: <cover.1768823489.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

From: Jonathan Corbet <corbet@lwn.net>

The ability to build the docs with an external kernel-doc program involves
some truly confusing logic and complicates the task of moving kernel-doc
out of scripts/.  But this feature is not useful for normal documentation
builds, and the external kernel-doc can always be run by hand when it needs
debugging.  So just remove that feature and make life easier.

There is still a bunch of logic to build a command line that we never use;
the idea is to be able to output it, but I'm not sure if that is worth
keeping.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kerneldoc.py | 53 ++++---------------------------
 1 file changed, 6 insertions(+), 47 deletions(-)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index d8cdf068ef35..afbab458550a 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -190,35 +190,7 @@ class KernelDocDirective(Directive):
 
         return cmd
 
-    def run_cmd(self, cmd):
-        """
-        Execute an external kernel-doc command.
-        """
-
-        env = self.state.document.settings.env
-        node = nodes.section()
-
-        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
-        out, err = p.communicate()
-
-        out, err = codecs.decode(out, 'utf-8'), codecs.decode(err, 'utf-8')
-
-        if p.returncode != 0:
-            sys.stderr.write(err)
-
-            logger.warning("kernel-doc '%s' failed with return code %d"
-                                % (" ".join(cmd), p.returncode))
-            return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
-        elif env.config.kerneldoc_verbosity > 0:
-            sys.stderr.write(err)
-
-        filenames = self.parse_args["file_list"]
-        for filename in filenames:
-            self.parse_msg(filename, node, out, cmd)
-
-        return node.children
-
-    def parse_msg(self, filename, node, out, cmd):
+    def parse_msg(self, filename, node, out):
         """
         Handles a kernel-doc output for a given file
         """
@@ -244,7 +216,7 @@ class KernelDocDirective(Directive):
 
         self.do_parse(result, node)
 
-    def run_kdoc(self, cmd, kfiles):
+    def run_kdoc(self, kfiles):
         """
         Execute kernel-doc classes directly instead of running as a separate
         command.
@@ -258,23 +230,17 @@ class KernelDocDirective(Directive):
         filenames = self.parse_args["file_list"]
 
         for filename, out in kfiles.msg(**self.msg_args, filenames=filenames):
-            self.parse_msg(filename, node, out, cmd)
+            self.parse_msg(filename, node, out)
 
         return node.children
 
     def run(self):
-        global kfiles
-
         cmd = self.handle_args()
         if self.verbose >= 1:
             logger.info(cmd_str(cmd))
 
         try:
-            if kfiles:
-                return self.run_kdoc(cmd, kfiles)
-            else:
-                return self.run_cmd(cmd)
-
+            return self.run_kdoc(kfiles)
         except Exception as e:  # pylint: disable=W0703
             logger.warning("kernel-doc '%s' processing failed with: %s" %
                            (cmd_str(cmd), pformat(e)))
@@ -286,15 +252,8 @@ class KernelDocDirective(Directive):
 
 def setup_kfiles(app):
     global kfiles
-
-    kerneldoc_bin = app.env.config.kerneldoc_bin
-
-    if kerneldoc_bin and kerneldoc_bin.endswith("kernel-doc.py"):
-        print("Using Python kernel-doc")
-        out_style = RestFormat()
-        kfiles = KernelFiles(out_style=out_style, logger=logger)
-    else:
-        print(f"Using {kerneldoc_bin}")
+    out_style = RestFormat()
+    kfiles = KernelFiles(out_style=out_style, logger=logger)
 
 
 def setup(app):
-- 
2.52.0

