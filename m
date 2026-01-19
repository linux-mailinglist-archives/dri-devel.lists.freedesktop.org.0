Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75503D3A7C9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5FC10E411;
	Mon, 19 Jan 2026 12:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RzyRKDQB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1FD10E40A;
 Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1A062444A3;
 Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC637C19424;
 Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768824316;
 bh=gswQgvIkCvCKkiNyrJA/gedBlbjViDDQyImQR0Lwtf4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RzyRKDQBKZ8Jd5mO530fmCqsSgPVKGTrzQlo0SAFbAu3XO+BVGDp0v53+SCfKNdCt
 CCpLlB5i4uwnLACxND1kGaKiPd/6DrKPu8UGfBPubqVllKHQxg+e4wrnmpMrW6WXIp
 BU4Kdnkhjw+Vg1BYLQ5ZAWOGhQDeCjdz2eB+VDrSLYp2q+1yLXbS3YaSDCtREmOQx3
 PeqUYx5SKCo+jGk5JoSxWH17jq6ujjtyvvzmssbAiYLhchZNIwdQaPmwOkFutOxae/
 99142H+xXfrRjd+vzmaxQvZSTzk3wR5uNv0YK7s2D3AKZJ75i+0v6Irh3qLVOQ2CWF
 StaZatb/RdONw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1vho0Q-00000001ZjE-3Jmu; Mon, 19 Jan 2026 13:05:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 stable@vger.kernel.org
Subject: [PATCH 2/9] docs: kdoc: avoid error_count overflows
Date: Mon, 19 Jan 2026 13:04:57 +0100
Message-ID: <233d1674db99ed8feb405a2f781de350f0fba0ac.1768823489.git.mchehab+huawei@kernel.org>
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

The glibc library limits the return code to 8 bits. We need to
stick to this limit when using sys.exit(error_count).

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: stable@vger.kernel.org
---
 scripts/kernel-doc.py | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index 7a1eaf986bcd..1ebb16b9bb08 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -116,6 +116,8 @@ SRC_DIR = os.path.dirname(os.path.realpath(__file__))
 
 sys.path.insert(0, os.path.join(SRC_DIR, LIB_DIR))
 
+WERROR_RETURN_CODE = 3
+
 DESC = """
 Read C language source or header FILEs, extract embedded documentation comments,
 and print formatted documentation to standard output.
@@ -176,7 +178,21 @@ class MsgFormatter(logging.Formatter):
         return logging.Formatter.format(self, record)
 
 def main():
-    """Main program"""
+    """
+    Main program.
+
+    By default, the return value is:
+
+    - 0: success or Python version is not compatible with
+      kernel-doc.  If -Werror is not used, it will also
+      return 0 if there are issues at kernel-doc markups;
+
+    - 1: an abnormal condition happened;
+
+    - 2: argparse issued an error;
+
+    - 3: -Werror is used, and one or more unfiltered parse warnings happened.
+    """
 
     parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
                                      description=DESC)
@@ -323,16 +339,12 @@ def main():
 
     if args.werror:
         print("%s warnings as errors" % error_count)    # pylint: disable=C0209
-        sys.exit(error_count)
+        sys.exit(WERROR_RETURN_CODE)
 
     if args.verbose:
         print("%s errors" % error_count)                # pylint: disable=C0209
 
-    if args.none:
-        sys.exit(0)
-
-    sys.exit(error_count)
-
+    sys.exit(0)
 
 # Call main method
 if __name__ == "__main__":
-- 
2.52.0

