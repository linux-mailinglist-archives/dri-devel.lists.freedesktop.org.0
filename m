Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D3B749791
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 10:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208AF10E47F;
	Thu,  6 Jul 2023 08:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F2D10E481
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 08:36:53 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5979:7b6f:39a:b9cb])
 by andre.telenet-ops.be with bizsmtp
 id Hkcp2A00745Xpxs01kcpyU; Thu, 06 Jul 2023 10:36:49 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qHKTk-000fHu-R2;
 Thu, 06 Jul 2023 10:36:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qHKTp-00Ea8A-5m;
 Thu, 06 Jul 2023 10:36:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH libdrm v2] amdgpu: Use PRI?64 to format uint64_t
Date: Thu,  6 Jul 2023 10:36:47 +0200
Message-Id: <8ffa3be3dc7b27345dde3bb32498c4cd3af050fa.1688632590.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 32-bit:

    ../tests/amdgpu/amdgpu_stress.c: In function ‘alloc_bo’:
    ../tests/amdgpu/amdgpu_stress.c:178:49: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 4 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
      fprintf(stdout, "Allocated BO number %u at 0x%lx, domain 0x%x, size %lu\n",
                                                   ~~^
                                                   %llx
       num_buffers++, addr, domain, size);
                      ~~~~
    ../tests/amdgpu/amdgpu_stress.c:178:72: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 6 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
      fprintf(stdout, "Allocated BO number %u at 0x%lx, domain 0x%x, size %lu\n",
                                                                          ~~^
                                                                          %llu
       num_buffers++, addr, domain, size);
                                    ~~~~
    ../tests/amdgpu/amdgpu_stress.c: In function ‘submit_ib’:
    ../tests/amdgpu/amdgpu_stress.c:276:54: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 5 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
      fprintf(stdout, "Submitted %u IBs to copy from %u(%lx) to %u(%lx) %lu bytes took %lu usec\n",
                                                        ~~^
                                                        %llx
       count, from, virtual[from], to, virtual[to], copied, delta / 1000);
                    ~~~~~~~~~~~~~
    ../tests/amdgpu/amdgpu_stress.c:276:65: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 7 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
      fprintf(stdout, "Submitted %u IBs to copy from %u(%lx) to %u(%lx) %lu bytes took %lu usec\n",
                                                                   ~~^
                                                                   %llx
       count, from, virtual[from], to, virtual[to], copied, delta / 1000);
                                       ~~~~~~~~~~~
    ../tests/amdgpu/amdgpu_stress.c:276:70: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 8 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
      fprintf(stdout, "Submitted %u IBs to copy from %u(%lx) to %u(%lx) %lu bytes took %lu usec\n",
                                                                        ~~^
                                                                        %llu
       count, from, virtual[from], to, virtual[to], copied, delta / 1000);
                                                    ~~~~~~
    ../tests/amdgpu/amdgpu_stress.c:276:85: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 9 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
      fprintf(stdout, "Submitted %u IBs to copy from %u(%lx) to %u(%lx) %lu bytes took %lu usec\n",
                                                                                       ~~^
                                                                                       %llu
       count, from, virtual[from], to, virtual[to], copied, delta / 1000);
                                                            ~~~~~~~~~~~~
    ../tests/amdgpu/amdgpu_stress.c: In function ‘parse_size’:
    ../tests/amdgpu/amdgpu_stress.c:296:24: warning: format ‘%li’ expects argument of type ‘long int *’, but argument 3 has type ‘uint64_t *’ {aka ‘long long unsigned int *’} [-Wformat=]
      if (sscanf(optarg, "%li%1[kmgKMG]", &size, ext) < 1) {
                          ~~^             ~~~~~
                          %lli
    ../tests/amdgpu/amdgpu_stress.c: In function ‘main’:
    ../tests/amdgpu/amdgpu_stress.c:378:45: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 3 has type ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
         fprintf(stderr, "Buffer size to small %lu\n", size);
                                               ~~^     ~~~~
                                               %llu

Fix this by using the proper "PRI?64" format specifiers.

Fixes: d77ccdf3ba6f5a39 ("amdgpu: add amdgpu_stress utility v2")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
On Linux/amd64, the format strings in the resulting binary are
unchanged.

v2:
  - Use PRI?64 to unbreak 64-bit build.
---
 tests/amdgpu/amdgpu_stress.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amdgpu_stress.c b/tests/amdgpu/amdgpu_stress.c
index 5c5c88c5be985eb6..f919351e1f17d70b 100644
--- a/tests/amdgpu/amdgpu_stress.c
+++ b/tests/amdgpu/amdgpu_stress.c
@@ -30,6 +30,7 @@
 #include <errno.h>
 #include <unistd.h>
 #include <stdlib.h>
+#include <inttypes.h>
 
 #include "drm.h"
 #include "xf86drmMode.h"
@@ -175,7 +176,7 @@ int alloc_bo(uint32_t domain, uint64_t size)
 
 	resources[num_buffers] = bo;
 	virtual[num_buffers] = addr;
-	fprintf(stdout, "Allocated BO number %u at 0x%lx, domain 0x%x, size %lu\n",
+	fprintf(stdout, "Allocated BO number %u at 0x%" PRIx64 ", domain 0x%x, size %" PRIu64 "\n",
 		num_buffers++, addr, domain, size);
 	return 0;
 }
@@ -273,7 +274,7 @@ int submit_ib(uint32_t from, uint32_t to, uint64_t size, uint32_t count)
 	delta = stop.tv_nsec + stop.tv_sec * 1000000000UL;
 	delta -= start.tv_nsec + start.tv_sec * 1000000000UL;
 
-	fprintf(stdout, "Submitted %u IBs to copy from %u(%lx) to %u(%lx) %lu bytes took %lu usec\n",
+	fprintf(stdout, "Submitted %u IBs to copy from %u(%" PRIx64 ") to %u(%" PRIx64 ") %" PRIu64 " bytes took %" PRIu64 " usec\n",
 		count, from, virtual[from], to, virtual[to], copied, delta / 1000);
 	return 0;
 }
@@ -293,7 +294,7 @@ uint64_t parse_size(void)
 	char ext[2];
 
 	ext[0] = 0;
-	if (sscanf(optarg, "%li%1[kmgKMG]", &size, ext) < 1) {
+	if (sscanf(optarg, "%" PRIi64 "%1[kmgKMG]", &size, ext) < 1) {
 		fprintf(stderr, "Can't parse size arg: %s\n", optarg);
 		exit(EXIT_FAILURE);
 	}
@@ -375,7 +376,7 @@ int main(int argc, char **argv)
 			next_arg(argc, argv, "Missing buffer size");
 			size = parse_size();
 			if (size < getpagesize()) {
-				fprintf(stderr, "Buffer size to small %lu\n", size);
+				fprintf(stderr, "Buffer size to small %" PRIu64 "\n", size);
 				exit(EXIT_FAILURE);
 			}
 			r = alloc_bo(domain, size);
-- 
2.34.1

