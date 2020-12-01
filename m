Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659D82CB6C5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B1C6EA3A;
	Wed,  2 Dec 2020 08:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479756E02B;
 Tue,  1 Dec 2020 20:38:41 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id CF024E0718;
 Tue,  1 Dec 2020 20:35:43 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id UupzO_AEa56m; Tue,  1 Dec 2020 20:35:43 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 1E575DF932;
 Tue,  1 Dec 2020 20:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id F16q-sWhVsli; Tue,  1 Dec 2020 20:35:42 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id B6EE5E0711;
 Tue,  1 Dec 2020 20:35:42 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 1/3] tests/etnaviv_2d_test: explain the errors
Date: Tue,  1 Dec 2020 21:38:27 +0100
Message-Id: <20201201203829.1735559-2-lkundrak@v3.sk>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201201203829.1735559-1-lkundrak@v3.sk>
References: <20201201203829.1735559-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: Lubomir Rintel <lkundrak@v3.sk>, etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just so that it's obvious what failed and why.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 tests/etnaviv/etnaviv_2d_test.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tests/etnaviv/etnaviv_2d_test.c b/tests/etnaviv/etnaviv_2d_test.c
index 8dd77b66..eb9dfa59 100644
--- a/tests/etnaviv/etnaviv_2d_test.c
+++ b/tests/etnaviv/etnaviv_2d_test.c
@@ -162,9 +162,16 @@ int main(int argc, char *argv[])
 	drmVersionPtr version;
 	int fd, ret = 0;
 
-	fd = open(argv[1], O_RDWR);
-	if (fd < 0)
+	if (argc < 2) {
+		fprintf(stderr, "Usage: %s /dev/dri/<device>\n", argv[0]);
 		return 1;
+	}
+
+	fd = open(argv[1], O_RDWR);
+	if (fd < 0) {
+		perror(argv[1]);
+		return 1;
+	}
 
 	version = drmGetVersion(fd);
 	if (version) {
@@ -178,6 +185,7 @@ int main(int argc, char *argv[])
 
 	dev = etna_device_new(fd);
 	if (!dev) {
+		perror("etna_device_new");
 		ret = 2;
 		goto out;
 	}
@@ -185,18 +193,21 @@ int main(int argc, char *argv[])
 	/* TODO: we assume that core 0 is a 2D capable one */
 	gpu = etna_gpu_new(dev, 0);
 	if (!gpu) {
+		perror("etna_gpu_new");
 		ret = 3;
 		goto out_device;
 	}
 
 	pipe = etna_pipe_new(gpu, ETNA_PIPE_2D);
 	if (!pipe) {
+		perror("etna_pipe_new");
 		ret = 4;
 		goto out_gpu;
 	}
 
 	bmp = etna_bo_new(dev, bmp_size, ETNA_BO_UNCACHED);
 	if (!bmp) {
+		perror("etna_bo_new");
 		ret = 5;
 		goto out_pipe;
 	}
@@ -204,6 +215,7 @@ int main(int argc, char *argv[])
 
 	stream = etna_cmd_stream_new(pipe, 0x300, NULL, NULL);
 	if (!stream) {
+		perror("etna_cmd_stream_new");
 		ret = 6;
 		goto out_bo;
 	}
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
