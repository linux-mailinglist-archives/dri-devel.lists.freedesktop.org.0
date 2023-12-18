Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E51817A80
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0788410E2C7;
	Mon, 18 Dec 2023 19:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FE710E2C7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:01:55 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-5cf4696e202so44318847b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 11:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702926114; x=1703530914;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=8LAFahE4f6lW6U4R0EfMD5JqvdtDASlh+SiOPl8ncLM=;
 b=x77B/u/hKiTc1LH3lNmKr0fcGHAg3tlZWbCFm2vYqUDfmXx00Nwo+Ccvvj64eXol3e
 X4Yroj5Mmz6JKlB1HGofhGFkErJlR/3Fc6HfqdPGmdnpQSj4sqVKEgOQRvOt46NMHaTp
 xXEiocW1GZT7kp1xw2voI3ZoUTdjTDV8RyQOM1VcLjnLo0rSijmNF+lHUwiLy/sZPA1i
 eoEFYV88U+6thu/ZuCIzmYy6N48SI57xBHuFRaJQrMOWv3euQyxWIhB61Ce5rDkLlDv0
 quBXTOMyUBJOD7toSdhoYlEz9k9um8imFC56O8QCY7KCawPcc3uu3w6YL9cuUJp5Nj4z
 Yx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702926114; x=1703530914;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8LAFahE4f6lW6U4R0EfMD5JqvdtDASlh+SiOPl8ncLM=;
 b=qKyDwLb06Pfz65Wttnq9PMc2HDrBklHq8Ka/iLHFq3Dd7fFIuOcPNr0wYu7kYuHMIs
 ZBBQLPFnd8RZ1N0dJ+j1yDbEJ0ZopRko1ItIERvP2q9FnoT2K9uosuhGCJR4Sq3Tfhzz
 82fDwHHk4rlTCyzm7JW6hgt9A2i67WyC6tqA3AfC3RzcJ0rgapdKBfjDX5m/weAXb18F
 PqMeFJRwJvwPt6uBWGEOfAssEHgL9DS6BZ4CK2pg1ReEXHDkvEU0G6nAeZSQujTWrt6M
 GRInMUAz3Zf8z5cx4f0C6+P83XhJ1/fSSIsw1V39IGAS7MqhZDhVaX8LnPzr5CZzbUkj
 9RgA==
X-Gm-Message-State: AOJu0Yywg6dxXu0xiSLCIrMV84jwrdjxOIa0QLzzxE8/uJmPfPGU9hhX
 owFmsDzlAHeYUc8fmMT4cwToPXA87KEMb+G1SA==
X-Google-Smtp-Source: AGHT+IE+mKe5kI1oND9o8b7zy1UQKcmWI5mWhhLZcE2jCGCm3x7Shhj6VZla/AEAeNGMRXkhXdH8Fy6OR+6LWqaHEg==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:5cbf:3534:fb34:758e])
 (user=almasrymina job=sendgmr) by 2002:a25:a28c:0:b0:dbc:d494:57d9 with SMTP
 id c12-20020a25a28c000000b00dbcd49457d9mr1424862ybi.3.1702867259140; Sun, 17
 Dec 2023 18:40:59 -0800 (PST)
Date: Sun, 17 Dec 2023 18:40:21 -0800
In-Reply-To: <20231218024024.3516870-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231218024024.3516870-1-almasrymina@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231218024024.3516870-15-almasrymina@google.com>
Subject: [RFC PATCH net-next v5 14/14] selftests: add ncdevmem, netcat for
 devmem TCP
From: Mina Almasry <almasrymina@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Pavel Begunkov <asml.silence@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Eric Dumazet <edumazet@google.com>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Mina Almasry <almasrymina@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>,
 Andrii Nakryiko <andrii@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jakub Kicinski <kuba@kernel.org>, Matt Turner <mattst88@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Shailend Chand <shailend@google.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, David Wei <dw@davidwei.uk>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Shakeel Butt <shakeelb@google.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ncdevmem is a devmem TCP netcat. It works similarly to netcat, but it
sends and receives data using the devmem TCP APIs. It uses udmabuf as
the dmabuf provider. It is compatible with a regular netcat running on
a peer, or a ncdevmem running on a peer.

In addition to normal netcat support, ncdevmem has a validation mode,
where it sends a specific pattern and validates this pattern on the
receiver side to ensure data integrity.

Suggested-by: Stanislav Fomichev <sdf@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

Changes in v1:
- Many more general cleanups (Willem).
- Removed driver reset (Jakub).
- Removed hardcoded if index (Paolo).

RFC v2:
- General cleanups (Willem).

---
 tools/testing/selftests/net/.gitignore |   1 +
 tools/testing/selftests/net/Makefile   |   5 +
 tools/testing/selftests/net/ncdevmem.c | 489 +++++++++++++++++++++++++
 3 files changed, 495 insertions(+)
 create mode 100644 tools/testing/selftests/net/ncdevmem.c

diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selftests/net/.gitignore
index 2f9d378edec3..b644dbae58b7 100644
--- a/tools/testing/selftests/net/.gitignore
+++ b/tools/testing/selftests/net/.gitignore
@@ -17,6 +17,7 @@ ipv6_flowlabel
 ipv6_flowlabel_mgr
 log.txt
 msg_zerocopy
+ncdevmem
 nettest
 psock_fanout
 psock_snd
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 14bd68da7466..d7a66563ffe7 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -5,6 +5,10 @@ CFLAGS =  -Wall -Wl,--no-as-needed -O2 -g
 CFLAGS += -I../../../../usr/include/ $(KHDR_INCLUDES)
 # Additional include paths needed by kselftest.h
 CFLAGS += -I../
+CFLAGS += -I../../../net/ynl/generated/
+CFLAGS += -I../../../net/ynl/lib/
+
+LDLIBS += ../../../net/ynl/lib/ynl.a ../../../net/ynl/generated/protos.a
 
 TEST_PROGS := run_netsocktests run_afpackettests test_bpf.sh netdevice.sh \
 	      rtnetlink.sh xfrm_policy.sh test_blackhole_dev.sh
@@ -92,6 +96,7 @@ TEST_PROGS += test_vxlan_nolocalbypass.sh
 TEST_PROGS += test_bridge_backup_port.sh
 TEST_PROGS += fdb_flush.sh
 TEST_PROGS += fq_band_pktlimit.sh
+TEST_GEN_FILES += ncdevmem
 
 TEST_FILES := settings
 
diff --git a/tools/testing/selftests/net/ncdevmem.c b/tools/testing/selftests/net/ncdevmem.c
new file mode 100644
index 000000000000..7fbeee02b9a2
--- /dev/null
+++ b/tools/testing/selftests/net/ncdevmem.c
@@ -0,0 +1,489 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+#define __EXPORTED_HEADERS__
+
+#include <linux/uio.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <stdbool.h>
+#include <string.h>
+#include <errno.h>
+#define __iovec_defined
+#include <fcntl.h>
+#include <malloc.h>
+#include <error.h>
+
+#include <arpa/inet.h>
+#include <sys/socket.h>
+#include <sys/mman.h>
+#include <sys/ioctl.h>
+#include <sys/syscall.h>
+
+#include <linux/memfd.h>
+#include <linux/if.h>
+#include <linux/dma-buf.h>
+#include <linux/udmabuf.h>
+#include <libmnl/libmnl.h>
+#include <linux/types.h>
+#include <linux/netlink.h>
+#include <linux/genetlink.h>
+#include <linux/netdev.h>
+#include <time.h>
+
+#include "netdev-user.h"
+#include <ynl.h>
+
+#define PAGE_SHIFT 12
+#define TEST_PREFIX "ncdevmem"
+#define NUM_PAGES 16000
+
+#ifndef MSG_SOCK_DEVMEM
+#define MSG_SOCK_DEVMEM 0x2000000
+#endif
+
+/*
+ * tcpdevmem netcat. Works similarly to netcat but does device memory TCP
+ * instead of regular TCP. Uses udmabuf to mock a dmabuf provider.
+ *
+ * Usage:
+ *
+ *	On server:
+ *	ncdevmem -s <server IP> -c <client IP> -f eth1 -d 3 -n 0000:06:00.0 -l \
+ *		-p 5201 -v 7
+ *
+ *	On client:
+ *	yes $(echo -e \\x01\\x02\\x03\\x04\\x05\\x06) | \
+ *		tr \\n \\0 | \
+ *		head -c 5G | \
+ *		nc <server IP> 5201 -p 5201
+ *
+ * Note this is compatible with regular netcat. i.e. the sender or receiver can
+ * be replaced with regular netcat to test the RX or TX path in isolation.
+ */
+
+static char *server_ip = "192.168.1.4";
+static char *client_ip = "192.168.1.2";
+static char *port = "5201";
+static size_t do_validation;
+static int queue_num = 15;
+static char *ifname = "eth1";
+static unsigned int ifindex = 3;
+static char *nic_pci_addr = "0000:06:00.0";
+static unsigned int iterations;
+static unsigned int dmabuf_id;
+
+void print_bytes(void *ptr, size_t size)
+{
+	unsigned char *p = ptr;
+	int i;
+
+	for (i = 0; i < size; i++)
+		printf("%02hhX ", p[i]);
+	printf("\n");
+}
+
+void print_nonzero_bytes(void *ptr, size_t size)
+{
+	unsigned char *p = ptr;
+	unsigned int i;
+
+	for (i = 0; i < size; i++)
+		putchar(p[i]);
+	printf("\n");
+}
+
+void validate_buffer(void *line, size_t size)
+{
+	static unsigned char seed = 1;
+	unsigned char *ptr = line;
+	int errors = 0;
+	size_t i;
+
+	for (i = 0; i < size; i++) {
+		if (ptr[i] != seed) {
+			fprintf(stderr,
+				"Failed validation: expected=%u, actual=%u, index=%lu\n",
+				seed, ptr[i], i);
+			errors++;
+			if (errors > 20)
+				error(1, 0, "validation failed.");
+		}
+		seed++;
+		if (seed == do_validation)
+			seed = 0;
+	}
+
+	fprintf(stdout, "Validated buffer\n");
+}
+
+static void reset_flow_steering(void)
+{
+	char command[256];
+
+	memset(command, 0, sizeof(command));
+	snprintf(command, sizeof(command), "sudo ethtool -K %s ntuple off",
+		 "eth1");
+	system(command);
+
+	memset(command, 0, sizeof(command));
+	snprintf(command, sizeof(command), "sudo ethtool -K %s ntuple on",
+		 "eth1");
+	system(command);
+}
+
+static void configure_flow_steering(void)
+{
+	char command[256];
+
+	memset(command, 0, sizeof(command));
+	snprintf(command, sizeof(command),
+		 "sudo ethtool -N %s flow-type tcp4 src-ip %s dst-ip %s src-port %s dst-port %s queue %d",
+		 ifname, client_ip, server_ip, port, port, queue_num);
+	system(command);
+}
+
+static int bind_rx_queue(unsigned int ifindex, unsigned int dmabuf_fd,
+			 struct netdev_queue_dmabuf *queues,
+			 unsigned int n_queue_index, struct ynl_sock **ys)
+{
+	struct netdev_bind_rx_req *req = NULL;
+	struct netdev_bind_rx_rsp *rsp = NULL;
+	struct ynl_error yerr;
+
+	*ys = ynl_sock_create(&ynl_netdev_family, &yerr);
+	if (!*ys) {
+		fprintf(stderr, "YNL: %s\n", yerr.msg);
+		return -1;
+	}
+
+	req = netdev_bind_rx_req_alloc();
+	netdev_bind_rx_req_set_ifindex(req, ifindex);
+	netdev_bind_rx_req_set_dmabuf_fd(req, dmabuf_fd);
+	__netdev_bind_rx_req_set_queues(req, queues, n_queue_index);
+
+	rsp = netdev_bind_rx(*ys, req);
+	if (!rsp) {
+		perror("netdev_bind_rx");
+		goto err_close;
+	}
+
+	if (!rsp->_present.dmabuf_id) {
+		perror("dmabuf_id not present");
+		goto err_close;
+	}
+
+	printf("got dmabuf id=%d\n", rsp->dmabuf_id);
+	dmabuf_id = rsp->dmabuf_id;
+
+	netdev_bind_rx_req_free(req);
+	netdev_bind_rx_rsp_free(rsp);
+
+	return 0;
+
+err_close:
+	fprintf(stderr, "YNL failed: %s\n", (*ys)->err.msg);
+	netdev_bind_rx_req_free(req);
+	ynl_sock_destroy(*ys);
+	return -1;
+}
+
+static void create_udmabuf(int *devfd, int *memfd, int *buf, size_t dmabuf_size)
+{
+	struct udmabuf_create create;
+	int ret;
+
+	*devfd = open("/dev/udmabuf", O_RDWR);
+	if (*devfd < 0) {
+		error(70, 0,
+		      "%s: [skip,no-udmabuf: Unable to access DMA buffer device file]\n",
+		      TEST_PREFIX);
+	}
+
+	*memfd = memfd_create("udmabuf-test", MFD_ALLOW_SEALING);
+	if (*memfd < 0)
+		error(70, 0, "%s: [skip,no-memfd]\n", TEST_PREFIX);
+
+	/* Required for udmabuf */
+	ret = fcntl(*memfd, F_ADD_SEALS, F_SEAL_SHRINK);
+	if (ret < 0)
+		error(73, 0, "%s: [skip,fcntl-add-seals]\n", TEST_PREFIX);
+
+	ret = ftruncate(*memfd, dmabuf_size);
+	if (ret == -1)
+		error(74, 0, "%s: [FAIL,memfd-truncate]\n", TEST_PREFIX);
+
+	memset(&create, 0, sizeof(create));
+
+	create.memfd = *memfd;
+	create.offset = 0;
+	create.size = dmabuf_size;
+	*buf = ioctl(*devfd, UDMABUF_CREATE, &create);
+	if (*buf < 0)
+		error(75, 0, "%s: [FAIL, create udmabuf]\n", TEST_PREFIX);
+}
+
+int do_server(void)
+{
+	char ctrl_data[sizeof(int) * 20000];
+	struct netdev_queue_dmabuf *queues;
+	size_t non_page_aligned_frags = 0;
+	struct sockaddr_in client_addr;
+	struct sockaddr_in server_sin;
+	size_t page_aligned_frags = 0;
+	int devfd, memfd, buf, ret;
+	size_t total_received = 0;
+	socklen_t client_addr_len;
+	bool is_devmem = false;
+	char *buf_mem = NULL;
+	struct ynl_sock *ys;
+	size_t dmabuf_size;
+	char iobuf[819200];
+	char buffer[256];
+	int socket_fd;
+	int client_fd;
+	size_t i = 0;
+	int opt = 1;
+
+	dmabuf_size = getpagesize() * NUM_PAGES;
+
+	create_udmabuf(&devfd, &memfd, &buf, dmabuf_size);
+
+	reset_flow_steering();
+	configure_flow_steering();
+
+	sleep(1);
+
+	queues = malloc(sizeof(*queues) * 1);
+
+	queues[0]._present.type = 1;
+	queues[0]._present.idx = 1;
+	queues[0].type = NETDEV_QUEUE_TYPE_RX;
+	queues[0].idx = queue_num;
+	if (bind_rx_queue(ifindex, buf, queues, 1, &ys))
+		error(1, 0, "Failed to bind\n");
+
+	buf_mem = mmap(NULL, dmabuf_size, PROT_READ | PROT_WRITE, MAP_SHARED,
+		       buf, 0);
+	if (buf_mem == MAP_FAILED)
+		error(1, 0, "mmap()");
+
+	server_sin.sin_family = AF_INET;
+	server_sin.sin_port = htons(atoi(port));
+
+	ret = inet_pton(server_sin.sin_family, server_ip, &server_sin.sin_addr);
+	if (socket < 0)
+		error(79, 0, "%s: [FAIL, create socket]\n", TEST_PREFIX);
+
+	socket_fd = socket(server_sin.sin_family, SOCK_STREAM, 0);
+	if (socket < 0)
+		error(errno, errno, "%s: [FAIL, create socket]\n", TEST_PREFIX);
+
+	ret = setsockopt(socket_fd, SOL_SOCKET, SO_REUSEPORT, &opt,
+			 sizeof(opt));
+	if (ret)
+		error(errno, errno, "%s: [FAIL, set sock opt]\n", TEST_PREFIX);
+
+	ret = setsockopt(socket_fd, SOL_SOCKET, SO_REUSEADDR, &opt,
+			 sizeof(opt));
+	if (ret)
+		error(errno, errno, "%s: [FAIL, set sock opt]\n", TEST_PREFIX);
+
+	printf("binding to address %s:%d\n", server_ip,
+	       ntohs(server_sin.sin_port));
+
+	ret = bind(socket_fd, &server_sin, sizeof(server_sin));
+	if (ret)
+		error(errno, errno, "%s: [FAIL, bind]\n", TEST_PREFIX);
+
+	ret = listen(socket_fd, 1);
+	if (ret)
+		error(errno, errno, "%s: [FAIL, listen]\n", TEST_PREFIX);
+
+	client_addr_len = sizeof(client_addr);
+
+	inet_ntop(server_sin.sin_family, &server_sin.sin_addr, buffer,
+		  sizeof(buffer));
+	printf("Waiting or connection on %s:%d\n", buffer,
+	       ntohs(server_sin.sin_port));
+	client_fd = accept(socket_fd, &client_addr, &client_addr_len);
+
+	inet_ntop(client_addr.sin_family, &client_addr.sin_addr, buffer,
+		  sizeof(buffer));
+	printf("Got connection from %s:%d\n", buffer,
+	       ntohs(client_addr.sin_port));
+
+	while (1) {
+		struct iovec iov = { .iov_base = iobuf,
+				     .iov_len = sizeof(iobuf) };
+		struct dmabuf_cmsg *dmabuf_cmsg = NULL;
+		struct dma_buf_sync sync = { 0 };
+		struct cmsghdr *cm = NULL;
+		struct msghdr msg = { 0 };
+		struct dmabuf_token token;
+		ssize_t ret;
+
+		is_devmem = false;
+		printf("\n\n");
+
+		msg.msg_iov = &iov;
+		msg.msg_iovlen = 1;
+		msg.msg_control = ctrl_data;
+		msg.msg_controllen = sizeof(ctrl_data);
+		ret = recvmsg(client_fd, &msg, MSG_SOCK_DEVMEM);
+		printf("recvmsg ret=%ld\n", ret);
+		if (ret < 0 && (errno == EAGAIN || errno == EWOULDBLOCK))
+			continue;
+		if (ret < 0) {
+			perror("recvmsg");
+			continue;
+		}
+		if (ret == 0) {
+			printf("client exited\n");
+			goto cleanup;
+		}
+
+		i++;
+		for (cm = CMSG_FIRSTHDR(&msg); cm; cm = CMSG_NXTHDR(&msg, cm)) {
+			if (cm->cmsg_level != SOL_SOCKET ||
+			    (cm->cmsg_type != SCM_DEVMEM_DMABUF &&
+			     cm->cmsg_type != SCM_DEVMEM_LINEAR)) {
+				fprintf(stdout, "skipping non-devmem cmsg\n");
+				continue;
+			}
+
+			dmabuf_cmsg = (struct dmabuf_cmsg *)CMSG_DATA(cm);
+			is_devmem = true;
+
+			if (cm->cmsg_type == SCM_DEVMEM_LINEAR) {
+				/* TODO: process data copied from skb's linear
+				 * buffer.
+				 */
+				fprintf(stdout,
+					"SCM_DEVMEM_LINEAR. dmabuf_cmsg->frag_size=%u\n",
+					dmabuf_cmsg->frag_size);
+
+				continue;
+			}
+
+			token.token_start = dmabuf_cmsg->frag_token;
+			token.token_count = 1;
+
+			total_received += dmabuf_cmsg->frag_size;
+			printf("received frag_page=%llu, in_page_offset=%llu, frag_offset=%llu, frag_size=%u, token=%u, total_received=%lu, dmabuf_id=%u\n",
+			       dmabuf_cmsg->frag_offset >> PAGE_SHIFT,
+			       dmabuf_cmsg->frag_offset % getpagesize(),
+			       dmabuf_cmsg->frag_offset, dmabuf_cmsg->frag_size,
+			       dmabuf_cmsg->frag_token, total_received,
+			       dmabuf_cmsg->dmabuf_id);
+
+			if (dmabuf_cmsg->dmabuf_id != dmabuf_id)
+				error(1, 0,
+				      "received on wrong dmabuf_id: flow steering error\n");
+
+			if (dmabuf_cmsg->frag_size % getpagesize())
+				non_page_aligned_frags++;
+			else
+				page_aligned_frags++;
+
+			sync.flags = DMA_BUF_SYNC_READ | DMA_BUF_SYNC_START;
+			ioctl(buf, DMA_BUF_IOCTL_SYNC, &sync);
+
+			if (do_validation)
+				validate_buffer(
+					((unsigned char *)buf_mem) +
+						dmabuf_cmsg->frag_offset,
+					dmabuf_cmsg->frag_size);
+			else
+				print_nonzero_bytes(
+					((unsigned char *)buf_mem) +
+						dmabuf_cmsg->frag_offset,
+					dmabuf_cmsg->frag_size);
+
+			sync.flags = DMA_BUF_SYNC_READ | DMA_BUF_SYNC_END;
+			ioctl(buf, DMA_BUF_IOCTL_SYNC, &sync);
+
+			ret = setsockopt(client_fd, SOL_SOCKET,
+					 SO_DEVMEM_DONTNEED, &token,
+					 sizeof(token));
+			if (ret != 1)
+				error(1, 0,
+				      "SO_DEVMEM_DONTNEED not enough tokens");
+		}
+		if (!is_devmem)
+			error(1, 0, "flow steering error\n");
+
+		printf("total_received=%lu\n", total_received);
+	}
+
+	fprintf(stdout, "%s: ok\n", TEST_PREFIX);
+
+	fprintf(stdout, "page_aligned_frags=%lu, non_page_aligned_frags=%lu\n",
+		page_aligned_frags, non_page_aligned_frags);
+
+	fprintf(stdout, "page_aligned_frags=%lu, non_page_aligned_frags=%lu\n",
+		page_aligned_frags, non_page_aligned_frags);
+
+cleanup:
+
+	munmap(buf_mem, dmabuf_size);
+	close(client_fd);
+	close(socket_fd);
+	close(buf);
+	close(memfd);
+	close(devfd);
+	ynl_sock_destroy(ys);
+
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	int is_server = 0, opt;
+
+	while ((opt = getopt(argc, argv, "ls:c:p:v:q:f:n:i:d:")) != -1) {
+		switch (opt) {
+		case 'l':
+			is_server = 1;
+			break;
+		case 's':
+			server_ip = optarg;
+			break;
+		case 'c':
+			client_ip = optarg;
+			break;
+		case 'p':
+			port = optarg;
+			break;
+		case 'v':
+			do_validation = atoll(optarg);
+			break;
+		case 'q':
+			queue_num = atoi(optarg);
+			break;
+		case 'f':
+			ifname = optarg;
+			break;
+		case 'd':
+			ifindex = atoi(optarg);
+			break;
+		case 'n':
+			nic_pci_addr = optarg;
+			break;
+		case 'i':
+			iterations = atoll(optarg);
+			break;
+		case '?':
+			printf("unknown option: %c\n", optopt);
+			break;
+		}
+	}
+
+	for (; optind < argc; optind++)
+		printf("extra arguments: %s\n", argv[optind]);
+
+	if (is_server)
+		return do_server();
+
+	return 0;
+}
-- 
2.43.0.472.g3155946c3a-goog

