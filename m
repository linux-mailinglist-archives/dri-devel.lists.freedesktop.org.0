Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA547487A7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 17:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311DD10E388;
	Wed,  5 Jul 2023 15:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6095310E38C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 15:17:42 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5979:7b6f:39a:b9cb])
 by laurent.telenet-ops.be with bizsmtp
 id HTHf2A00345Xpxs01THfTt; Wed, 05 Jul 2023 17:17:39 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qH4G7-000ceC-Aj;
 Wed, 05 Jul 2023 17:17:38 +0200
Received: from geert by rox with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qH4GA-00AwT1-SK;
 Wed, 05 Jul 2023 17:17:38 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH libdrm] amdgpu: Use %ll to format 64-bit integers
Date: Wed,  5 Jul 2023 17:17:35 +0200
Message-Id: <e77836236dfb6724aa95a8c2305a2d63762367be.1688570228.git.geert+renesas@glider.be>
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

Fix this by using the proper "%ll" format specifier prefix.

Fixes: d77ccdf3ba6f5a39 ("amdgpu: add amdgpu_stress utility v2")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 tests/amdgpu/amdgpu_stress.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amdgpu_stress.c b/tests/amdgpu/amdgpu_stress.c
index 5c5c88c5be985eb6..7182f9005703f1a4 100644
--- a/tests/amdgpu/amdgpu_stress.c
+++ b/tests/amdgpu/amdgpu_stress.c
@@ -175,7 +175,7 @@ int alloc_bo(uint32_t domain, uint64_t size)
 
 	resources[num_buffers] = bo;
 	virtual[num_buffers] = addr;
-	fprintf(stdout, "Allocated BO number %u at 0x%lx, domain 0x%x, size %lu\n",
+	fprintf(stdout, "Allocated BO number %u at 0x%llx, domain 0x%x, size %llu\n",
 		num_buffers++, addr, domain, size);
 	return 0;
 }
@@ -273,7 +273,7 @@ int submit_ib(uint32_t from, uint32_t to, uint64_t size, uint32_t count)
 	delta = stop.tv_nsec + stop.tv_sec * 1000000000UL;
 	delta -= start.tv_nsec + start.tv_sec * 1000000000UL;
 
-	fprintf(stdout, "Submitted %u IBs to copy from %u(%lx) to %u(%lx) %lu bytes took %lu usec\n",
+	fprintf(stdout, "Submitted %u IBs to copy from %u(%llx) to %u(%llx) %llu bytes took %llu usec\n",
 		count, from, virtual[from], to, virtual[to], copied, delta / 1000);
 	return 0;
 }
@@ -293,7 +293,7 @@ uint64_t parse_size(void)
 	char ext[2];
 
 	ext[0] = 0;
-	if (sscanf(optarg, "%li%1[kmgKMG]", &size, ext) < 1) {
+	if (sscanf(optarg, "%lli%1[kmgKMG]", &size, ext) < 1) {
 		fprintf(stderr, "Can't parse size arg: %s\n", optarg);
 		exit(EXIT_FAILURE);
 	}
@@ -375,7 +375,7 @@ int main(int argc, char **argv)
 			next_arg(argc, argv, "Missing buffer size");
 			size = parse_size();
 			if (size < getpagesize()) {
-				fprintf(stderr, "Buffer size to small %lu\n", size);
+				fprintf(stderr, "Buffer size to small %llu\n", size);
 				exit(EXIT_FAILURE);
 			}
 			r = alloc_bo(domain, size);
-- 
2.34.1

