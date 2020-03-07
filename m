Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 916FE17CEFF
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 16:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51486E24B;
	Sat,  7 Mar 2020 15:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8E76E21A
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2020 14:03:03 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id z65so2564292pfz.8
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2020 06:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=gaIKPIrwCubYADjJu7sbLJYt1zqBedkAptVOYUeebnQ=;
 b=eJVYKpjGNQy3/0jAQG9Yvmmju4EmftP6llatDBOOPcGbKy29auxZvmVwQ+G9vl+BQh
 93rUD5+1vFq6visDWWmiC7Hx4uhVCIQY2Qu4KQLy2aL5Efusmn+k09u0fN/XZp7KSyDK
 d8cZ78hOaQ8blzha43rIxWxmspnIv9+GBLWwSn/xN2kqMKKjr8oS1nwHqiCa2GnGeUyS
 2YNtFB7VqTWNYKuDcGzNGuNFhn/ckhJwOYVkmrvFJMUB0z5mFFrptxFj8P+s7aoIzdlM
 K/Hscvl/bkXTyhS1LJ2gpKGziIJvN1dE9RW/vLY9cuqPdO1OfpKVv3t6HLGyfejvvZ0T
 9A5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gaIKPIrwCubYADjJu7sbLJYt1zqBedkAptVOYUeebnQ=;
 b=kMVKalvB7hBrF+UyTJewqapxlSSC1KLq/ab2ldCTME5sJLtxpq7JUah3KVxitqspe9
 uVfv2VWNPehKXrKg8Lh7hrpDRPafEJitRxGsjPt87yVfxdnNHISzaL0nH9W4qU88Krhl
 gjZoa5wHyz1MDyw23DlXFAVfci08TyB0+UvmAo0znGA+por5iCn/G076iTtUWbIz8eLT
 2avucmT2LiOPfXVQLOTVrhAAzgjiFLgb0tq3kVa4eog5UPYmwpNNb/0JRp1gc0XbtN36
 VFKyz+/IqSrkSELCmJ9bbjw1fSpyf5gxbGhQscBk0i6+EZCO6CJJjeFNO9BUReXlrZ1A
 RzOA==
X-Gm-Message-State: ANhLgQ2SmQIPEo3k9MrF9OWYRz27JCegh616JyFY63ZB+ab6dWtTD0Hv
 pfPp0nHAmyRk8MU5w9+eO7HAB7pP
X-Google-Smtp-Source: ADFU+vtakTVmkQZCG3qPS+GHx36ySsFGc0kyS//oaXdR0rjV9BOP3tvZHFnoLHR0yeJ5lKrymgCgTw==
X-Received: by 2002:a63:7e52:: with SMTP id o18mr8260708pgn.46.1583589782835; 
 Sat, 07 Mar 2020 06:03:02 -0800 (PST)
Received: from localhost ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id 7sm12607320pjm.35.2020.03.07.06.03.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 07 Mar 2020 06:03:02 -0800 (PST)
From: Leon He <hexiaolong2008@gmail.com>
To: shuah@kernel.org,
	sumit.semwal@linaro.org
Subject: [v2] dma-buf: heaps: bugfix for selftest failure
Date: Sat,  7 Mar 2020 22:02:45 +0800
Message-Id: <1583589765-19344-1-git-send-email-hexiaolong2008@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Sat, 07 Mar 2020 15:19:21 +0000
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
Cc: Leon He <leon.he@unisoc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Leon He <leon.he@unisoc.com>

There are two errors in the dmabuf-heap selftest:
1. The 'char name[5]' was not initialized to zero, which will cause
   strcmp(name, "vgem") failed in check_vgem().
2. The return value of test_alloc_errors() should be reversed, other-
   wise the while loop in main() will be broken.

Signed-off-by: Leon He <leon.he@unisoc.com>
---
 tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
index cd5e1f6..836b185 100644
--- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
+++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
@@ -22,7 +22,7 @@
 static int check_vgem(int fd)
 {
 	drm_version_t version = { 0 };
-	char name[5];
+	char name[5] = { 0 };
 	int ret;
 
 	version.name_len = 4;
@@ -357,7 +357,7 @@ static int test_alloc_errors(char *heap_name)
 	if (heap_fd >= 0)
 		close(heap_fd);
 
-	return ret;
+	return !ret;
 }
 
 int main(void)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
