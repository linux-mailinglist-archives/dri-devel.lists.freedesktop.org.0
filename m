Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3FDD3A7D4
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8A310E421;
	Mon, 19 Jan 2026 12:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pU0+yURc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9335910E40C;
 Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1D4C8444D8;
 Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2953C2BCAF;
 Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768824316;
 bh=kGt9gNhMuRj9+jM9PcGfmUvM8H3qve1/pTvOonlpy+g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pU0+yURc1Q45u8r1PvFHHPODmTRWMuC9YrkASEB967Elx3REu6QhasyY+7FBLquMj
 SGUO+N+BnEdM7QH4q7SzrZuijRYoPNaX3zw5p56FJQ2ylQXCTLJKvfHpm+zYSZu7gG
 /hpSC9wYb6vV6NfQ02yuPdVFxTKrFGqVqLMpnuXqODZA5xGm0u0GVVEzE08kdmPh8L
 6/ar92+aciGUNsWmT1d+qnov7ZCrkkbc8bdgC2pHe2Wq7pmGLfDJVCKm41jGZNzPEm
 iu60r+QYUlbLB34qzOZ5BJ6HIhw4s1HckZur1X8zUVZrrVXLR5/IGY/XiqXpM6xzIY
 I1F4kXhuFzG6Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1vho0Q-00000001ZjY-3uFL; Mon, 19 Jan 2026 13:05:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 7/9] docs: kdoc: move the return values to the helper message
Date: Mon, 19 Jan 2026 13:05:02 +0100
Message-ID: <3bcfa48016770929fcd073376515e3ff0b777ea8.1768823489.git.mchehab+huawei@kernel.org>
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

It makes sense to describe what kernel-doc is expected to return
on its help message. Move such messages to argparse epilog.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/kernel-doc | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/tools/docs/kernel-doc b/tools/docs/kernel-doc
index a19a92566780..902397804e80 100755
--- a/tools/docs/kernel-doc
+++ b/tools/docs/kernel-doc
@@ -166,6 +166,20 @@ This option is kept just for backward-compatibility, but it does nothing,
 neither here nor at the original Perl script.
 """
 
+EPILOG = """
+The return value is:
+
+- 0: success or Python version is not compatible with
+kernel-doc.  If -Werror is not used, it will also
+return 0 if there are issues at kernel-doc markups;
+
+- 1: an abnormal condition happened;
+
+- 2: argparse issued an error;
+
+- 3: When -Werror is used, it means that one or more unfiltered parse
+     warnings happened.
+"""
 
 class MsgFormatter(logging.Formatter):
     """Helper class to format warnings in a similar way to kernel-doc.pl."""
@@ -178,21 +192,10 @@ def main():
     """
     Main program.
 
-    By default, the return value is:
-
-    - 0: success or Python version is not compatible with
-      kernel-doc.  If -Werror is not used, it will also
-      return 0 if there are issues at kernel-doc markups;
-
-    - 1: an abnormal condition happened;
-
-    - 2: argparse issued an error;
-
-    - 3: -Werror is used, and one or more unfiltered parse warnings happened.
     """
 
     parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
-                                     description=DESC)
+                                     description=DESC, epilog=EPILOG)
 
     #
     # Normal arguments
-- 
2.52.0

