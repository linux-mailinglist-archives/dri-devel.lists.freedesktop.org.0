Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CDE11A1CF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 03:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D13B6EA60;
	Wed, 11 Dec 2019 02:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A986EA51
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 02:53:38 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df05a2b0000>; Tue, 10 Dec 2019 18:53:31 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 10 Dec 2019 18:53:37 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 10 Dec 2019 18:53:37 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Dec
 2019 02:53:37 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 11 Dec 2019 02:53:36 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df05a300000>; Tue, 10 Dec 2019 18:53:36 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v9 24/25] mm/gup_benchmark: support pin_user_pages() and
 related calls
Date: Tue, 10 Dec 2019 18:53:17 -0800
Message-ID: <20191211025318.457113-25-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191211025318.457113-1-jhubbard@nvidia.com>
References: <20191211025318.457113-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576032811; bh=x7MvVbQRVwUCvgSjQ/8SlrbWelgqje2hefrKJsxWbbs=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=Ibw6DdhZdycZZBMLmtkubQjMfNd15L9IJ19dKUI6Dhz6vrT6luhJQfGdkq508jsaY
 wEOiOGkd86kV95Ro8XgWXv6Ygmv6FaCDtB1m5sjRw//kUEPo2csdS39+IrfS4xPG5I
 zgenXAokb2kdz1rHFp1NHqTmp3u5xMPh9a6vYGdb2lH/x37lRcToUMxKC2RXbuJ6XZ
 ehqG0x4sEj+5GBtsvwkbMDQW1VS1j5ru8zfymGLbE2geC2e2Gd7HEfR0vj3H96U6AS
 TzIvvVtulWHBubi2LFDHDlPGg3dkNs4T/wTgQnislHfw5R9efVod/9KQ4xIYtce7k3
 l9fb9F3xYFZYA==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Up until now, gup_benchmark supported testing of the
following kernel functions:

* get_user_pages(): via the '-U' command line option
* get_user_pages_longterm(): via the '-L' command line option
* get_user_pages_fast(): as the default (no options required)

Add test coverage for the new corresponding pin_*() functions:

* pin_user_pages_fast(): via the '-a' command line option
* pin_user_pages():      via the '-b' command line option

Also, add an option for clarity: '-u' for what is now (still) the
default choice: get_user_pages_fast().

Also, for the commands that set FOLL_PIN, verify that the pages
really are dma-pinned, via the new is_dma_pinned() routine.
Those commands are:

    PIN_FAST_BENCHMARK     : calls pin_user_pages_fast()
    PIN_BENCHMARK          : calls pin_user_pages()

In between the calls to pin_*() and unpin_user_pages(),
check each page: if page_dma_pinned() returns false, then
WARN and return.

Do this outside of the benchmark timestamps, so that it doesn't
affect reported times.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/gup_benchmark.c                         | 65 ++++++++++++++++++++--
 tools/testing/selftests/vm/gup_benchmark.c | 15 ++++-
 2 files changed, 74 insertions(+), 6 deletions(-)

diff --git a/mm/gup_benchmark.c b/mm/gup_benchmark.c
index 7fc44d25eca7..76d32db48af8 100644
--- a/mm/gup_benchmark.c
+++ b/mm/gup_benchmark.c
@@ -8,6 +8,8 @@
 #define GUP_FAST_BENCHMARK	_IOWR('g', 1, struct gup_benchmark)
 #define GUP_LONGTERM_BENCHMARK	_IOWR('g', 2, struct gup_benchmark)
 #define GUP_BENCHMARK		_IOWR('g', 3, struct gup_benchmark)
+#define PIN_FAST_BENCHMARK	_IOWR('g', 4, struct gup_benchmark)
+#define PIN_BENCHMARK		_IOWR('g', 5, struct gup_benchmark)
 
 struct gup_benchmark {
 	__u64 get_delta_usec;
@@ -19,6 +21,42 @@ struct gup_benchmark {
 	__u64 expansion[10];	/* For future use */
 };
 
+static void put_back_pages(int cmd, struct page **pages, unsigned long nr_pages)
+{
+	int i;
+
+	switch (cmd) {
+	case GUP_FAST_BENCHMARK:
+	case GUP_LONGTERM_BENCHMARK:
+	case GUP_BENCHMARK:
+		for (i = 0; i < nr_pages; i++)
+			put_page(pages[i]);
+		break;
+
+	case PIN_FAST_BENCHMARK:
+	case PIN_BENCHMARK:
+		unpin_user_pages(pages, nr_pages);
+		break;
+	}
+}
+
+static void verify_dma_pinned(int cmd, struct page **pages,
+			      unsigned long nr_pages)
+{
+	int i;
+
+	switch (cmd) {
+	case PIN_FAST_BENCHMARK:
+	case PIN_BENCHMARK:
+		for (i = 0; i < nr_pages; i++) {
+			if (WARN(!page_dma_pinned(pages[i]),
+				 "pages[%d] is NOT dma-pinned\n", i))
+				break;
+		}
+		break;
+	}
+}
+
 static int __gup_benchmark_ioctl(unsigned int cmd,
 		struct gup_benchmark *gup)
 {
@@ -65,6 +103,14 @@ static int __gup_benchmark_ioctl(unsigned int cmd,
 			nr = get_user_pages(addr, nr, gup->flags, pages + i,
 					    NULL);
 			break;
+		case PIN_FAST_BENCHMARK:
+			nr = pin_user_pages_fast(addr, nr, gup->flags,
+						 pages + i);
+			break;
+		case PIN_BENCHMARK:
+			nr = pin_user_pages(addr, nr, gup->flags, pages + i,
+					    NULL);
+			break;
 		default:
 			return -1;
 		}
@@ -75,15 +121,22 @@ static int __gup_benchmark_ioctl(unsigned int cmd,
 	}
 	end_time = ktime_get();
 
+	/* Shifting the meaning of nr_pages: now it is actual number pinned: */
+	nr_pages = i;
+
 	gup->get_delta_usec = ktime_us_delta(end_time, start_time);
 	gup->size = addr - gup->addr;
 
+	/*
+	 * Take an un-benchmark-timed moment to verify DMA pinned
+	 * state: print a warning if any non-dma-pinned pages are found:
+	 */
+	verify_dma_pinned(cmd, pages, nr_pages);
+
 	start_time = ktime_get();
-	for (i = 0; i < nr_pages; i++) {
-		if (!pages[i])
-			break;
-		put_page(pages[i]);
-	}
+
+	put_back_pages(cmd, pages, nr_pages);
+
 	end_time = ktime_get();
 	gup->put_delta_usec = ktime_us_delta(end_time, start_time);
 
@@ -101,6 +154,8 @@ static long gup_benchmark_ioctl(struct file *filep, unsigned int cmd,
 	case GUP_FAST_BENCHMARK:
 	case GUP_LONGTERM_BENCHMARK:
 	case GUP_BENCHMARK:
+	case PIN_FAST_BENCHMARK:
+	case PIN_BENCHMARK:
 		break;
 	default:
 		return -EINVAL;
diff --git a/tools/testing/selftests/vm/gup_benchmark.c b/tools/testing/selftests/vm/gup_benchmark.c
index 389327e9b30a..43b4dfe161a2 100644
--- a/tools/testing/selftests/vm/gup_benchmark.c
+++ b/tools/testing/selftests/vm/gup_benchmark.c
@@ -18,6 +18,10 @@
 #define GUP_LONGTERM_BENCHMARK	_IOWR('g', 2, struct gup_benchmark)
 #define GUP_BENCHMARK		_IOWR('g', 3, struct gup_benchmark)
 
+/* Similar to above, but use FOLL_PIN instead of FOLL_GET. */
+#define PIN_FAST_BENCHMARK	_IOWR('g', 4, struct gup_benchmark)
+#define PIN_BENCHMARK		_IOWR('g', 5, struct gup_benchmark)
+
 /* Just the flags we need, copied from mm.h: */
 #define FOLL_WRITE	0x01	/* check pte is writable */
 
@@ -40,8 +44,14 @@ int main(int argc, char **argv)
 	char *file = "/dev/zero";
 	char *p;
 
-	while ((opt = getopt(argc, argv, "m:r:n:f:tTLUwSH")) != -1) {
+	while ((opt = getopt(argc, argv, "m:r:n:f:abtTLUuwSH")) != -1) {
 		switch (opt) {
+		case 'a':
+			cmd = PIN_FAST_BENCHMARK;
+			break;
+		case 'b':
+			cmd = PIN_BENCHMARK;
+			break;
 		case 'm':
 			size = atoi(optarg) * MB;
 			break;
@@ -63,6 +73,9 @@ int main(int argc, char **argv)
 		case 'U':
 			cmd = GUP_BENCHMARK;
 			break;
+		case 'u':
+			cmd = GUP_FAST_BENCHMARK;
+			break;
 		case 'w':
 			write = 1;
 			break;
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
