Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE17D3A7D5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8149810E41C;
	Mon, 19 Jan 2026 12:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WvOuF7hD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE0310E40C;
 Mon, 19 Jan 2026 12:05:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5200360166;
 Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4FDFC2BC9E;
 Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768824316;
 bh=6HyC5gF4ScinHY1gGeYNGGYvsoRZQIoC1BWSJQdTkY4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WvOuF7hDdCBaQHihY9OW2YC1MzFJB74MOokdSvhwGI85VRZ6Ev5ixzSbIBVoGZb0/
 AmbHlcUNZ2uPeFv1VnM9Qa7+zTcxklTBwakBGzeGuORRTwf/v0c317Hhqo3pHRQvA8
 xN0ekp0C1rZw+mLt2vegSQ6so20BWtxxGtdy+loRJ5Q8MNLVrGGWAYazLjJon10GlF
 g9EbikW4yrmdSyIR3ntYNzXo9x6GcoTddi06ePHkoshuq6hlkf1qMgLFNTit1g9/Rc
 7z/wVoOni+N0u5k5pdd+YSlwDfNSmUkHEuPrq6WVsUrAwa34hFYy2oxu1hnL2sshDG
 vxQE1+IuvzqjQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1vho0Q-00000001Zjj-48cY; Mon, 19 Jan 2026 13:05:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 9/9] docs: conf.py: get rid of the now unused kerneldoc_bin
 env var
Date: Mon, 19 Jan 2026 13:05:04 +0100
Message-ID: <c0fa9f561c1dd4370f9096de4195a9214763c51c.1768823489.git.mchehab+huawei@kernel.org>
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

In the past, this contained the location of the binary file to parse
kernel-doc. Nowadays, it is used only for debugging purposes, inside
kerneldoc.py extension.

Move it to sphinx/kerneldoc.py, to avoid needing to handle with it
on several places.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py             | 4 ----
 Documentation/sphinx/kerneldoc.py | 7 +++++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 383d5e5b9d0a..65df81a9e414 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -579,10 +579,6 @@ pdf_documents = [
     ("kernel-documentation", "Kernel", "Kernel", "J. Random Bozo"),
 ]
 
-# kernel-doc extension configuration for running Sphinx directly (e.g. by Read
-# the Docs). In a normal build, these are supplied from the Makefile via command
-# line arguments.
-kerneldoc_bin = "../tools/docs/kernel-doc"  # Not used now
 kerneldoc_srctree = ".."
 
 def setup(app):
diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index afbab458550a..c1cadb4eb099 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -47,6 +47,10 @@ sys.path.insert(0, os.path.join(srctree, "tools/lib/python"))
 from kdoc.kdoc_files import KernelFiles
 from kdoc.kdoc_output import RestFormat
 
+# Used when verbose is active to show how to reproduce kernel-doc
+# issues via command line
+kerneldoc_bin = "tools/docs/kernel-doc"
+
 __version__  = '1.0'
 kfiles = None
 logger = logging.getLogger(__name__)
@@ -95,7 +99,7 @@ class KernelDocDirective(Directive):
     def handle_args(self):
 
         env = self.state.document.settings.env
-        cmd = [env.config.kerneldoc_bin, '-rst', '-enable-lineno']
+        cmd = [kerneldoc_bin, '-rst', '-enable-lineno']
 
         filename = env.config.kerneldoc_srctree + '/' + self.arguments[0]
 
@@ -257,7 +261,6 @@ def setup_kfiles(app):
 
 
 def setup(app):
-    app.add_config_value('kerneldoc_bin', None, 'env')
     app.add_config_value('kerneldoc_srctree', None, 'env')
     app.add_config_value('kerneldoc_verbosity', 1, 'env')
 
-- 
2.52.0

