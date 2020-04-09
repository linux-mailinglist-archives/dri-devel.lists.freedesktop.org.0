Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B278F1A44A4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 11:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62826ECB6;
	Fri, 10 Apr 2020 09:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 399 seconds by postgrey-1.36 at gabe;
 Thu, 09 Apr 2020 17:20:10 UTC
Received: from vkten.in (vkten.in [104.244.73.96])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3245A6EC1F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 17:20:10 +0000 (UTC)
Received: (qmail 1341 invoked from network); 9 Apr 2020 17:13:26 -0000
Received: from unknown (HELO localhost) (vkor@vkten.in@117.209.168.92)
 de/crypted with TLSv1.3: TLS_AES_256_GCM_SHA384 [256/256] DN=none
 by vkten with ESMTPSA; 9 Apr 2020 17:13:26 -0000
From: R Veera Kumar <vkor@vkten.in>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] staging: android: ion: use macro DEFINE_DEBUGFS_ATTRIBUTE
 to define debugfs fops
Date: Thu,  9 Apr 2020 22:43:18 +0530
Message-Id: <20200409171318.1730-1-vkor@vkten.in>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 Apr 2020 09:45:19 +0000
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
Cc: devel@driverdev.osuosl.org, R Veera Kumar <vkor@vkten.in>,
 Todd Kjos <tkjos@android.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Joel Fernandes <joel@joelfernandes.org>, Laura Abbott <labbott@redhat.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is more clear to use DEFINE_DEBUGFS_ATTRIBUTE to define debugfs file
operation rather than DEFINE_SIMPLE_ATTRIBUTE.

Found using coccinelle.

Signed-off-by: R Veera Kumar <vkor@vkten.in>
---
Changes in v2:
 - Give correct explanation for patch
 - Adjust git commit tag and msg accordingly
---
 drivers/staging/android/ion/ion.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
index 38b51eace4f9..dbe4018a6f83 100644
--- a/drivers/staging/android/ion/ion.c
+++ b/drivers/staging/android/ion/ion.c
@@ -554,8 +554,8 @@ static int debug_shrink_get(void *data, u64 *val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(debug_shrink_fops, debug_shrink_get,
-			debug_shrink_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(debug_shrink_fops, debug_shrink_get,
+			 debug_shrink_set, "%llu\n");
 
 void ion_device_add_heap(struct ion_heap *heap)
 {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
