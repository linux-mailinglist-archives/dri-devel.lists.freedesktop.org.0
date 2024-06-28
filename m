Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F35F091B39D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 02:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C9C10EB97;
	Fri, 28 Jun 2024 00:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jhS/SsL9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7C810E518
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 00:33:21 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-2c7a68c3a85so123423a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 17:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1719534801; x=1720139601;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=HtAkC7dc7eD7owfI6upy3bTZg9Fqg9IfLoFV+/ACewo=;
 b=jhS/SsL9Dd6Qco/ntXtXdHU2j60zJdA5db69qIYcaX3CaZVig4hPP+3hhVTUkvWX2e
 NtZfS5FdOrZI0zBpU5eq59TVoIbYc3KeTyX/SWlm1KGOPC7ySxaHRE4bu+BGwVBhdy2f
 Mc5SpEl/bPIQxVt3nE100xTmHaCqeBqhE7k9UOx42xfhXfAzYtjJbIo2Sfo5qfKWm84t
 CWur5kOdtCETOl4JsrZVIQ+VmLZoHQZifPIZ0uhH6H06ugm2tkiMkyvL1qkE9uviJZto
 Bu6RvPHBeaND7mQTjpqJMWb9u0A5CvWcqWhSAYRkhwbZDiDZoOu6nderpzplnR5KQxln
 sTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719534801; x=1720139601;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HtAkC7dc7eD7owfI6upy3bTZg9Fqg9IfLoFV+/ACewo=;
 b=nQ0k9DJt7aZoPIo2/VdZEOlIlESs/ff6vBT8aPrnkckiSvt4TXnM+X0yw9AeAWSVlQ
 JSOW74xGakmv9xvFyoSoer4ngYN31F1By+SRz/3Zs1CEejslY5OM7Q3uMvSByxLkWACH
 RGvS22cKCU+aqTY7FYX6S/Qqd9cMKeML7G2fao11MIvr8+yAOEIggQkwd+5rrefhxCji
 CjzrLuKI9t34BKb7P1mQNl7Ev4u4PaG5hd1fOlDhhBxX+J7PPfCUHq1w1FY0hj0/QCyU
 RlscbCRv2w+ZzATREFwZZwERQbUs2l2yCQ2/69Ntxe+oRr9Qoc0kymPaPLgBSQhOsSxc
 CZGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTepssOqJG2H7dD7PdO6+Yg4tJNYNRopAo1TSPuyfBuOHSOsO6NSpKUTJohpPFg2Or6aEMlVf4T1wBt0XA8x+xoUf/PdW2Bbs0Kq7Ml8fz
X-Gm-Message-State: AOJu0YzvQastK+w3g/jqBQfE3tFHVb3LbrgKCj6G6k56DP7hiDOatkJq
 8bugtql7UTYUFoL6Ejxrvl6e0Z5wy/D9q60C0TpuE7QObvkcrv2GDtYqxNyhNOtHbddwNSvv0J5
 pcKe2fI8hsilUsYaQ6NNhlw==
X-Google-Smtp-Source: AGHT+IGLRaLTSytcMUc42cO5VbPk30udJR/OWLWuA3cZvbicGZ/TcfoTV4BSYF/3gyDoC1Kg15GgKgYZNfdRX/OyyQ==
X-Received: from almasrymina.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a17:90a:6fa4:b0:2c4:bb9e:fcdc with
 SMTP id 98e67ed59e1d1-2c86144e0femr168873a91.9.1719534800464; Thu, 27 Jun
 2024 17:33:20 -0700 (PDT)
Date: Fri, 28 Jun 2024 00:32:50 +0000
In-Reply-To: <20240628003253.1694510-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20240628003253.1694510-1-almasrymina@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240628003253.1694510-14-almasrymina@google.com>
Subject: [PATCH net-next v15 13/14] tools: net: package libynl for use in
 selftests
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, 
 Christoph Hellwig <hch@infradead.org>,
 Nikolay Aleksandrov <razor@blackwall.org>, 
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jakub Kicinski <kuba@kernel.org>

Support building the C YNL userspace library into one big static file.
We can then link selftests against it for easy to use C netlink
interface.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v15:
- Added this patch from Jakub to fix linking against ynl.
- Squashed fix from Jakub to support O=xyz builds.
---
 tools/net/ynl/Makefile             |  6 +++++-
 tools/net/ynl/lib/Makefile         |  4 +++-
 tools/testing/selftests/net/ynl.mk | 21 +++++++++++++++++++++
 3 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/net/ynl.mk

diff --git a/tools/net/ynl/Makefile b/tools/net/ynl/Makefile
index 8e9e09d84e269..d1cdf2a8f8266 100644
--- a/tools/net/ynl/Makefile
+++ b/tools/net/ynl/Makefile
@@ -2,9 +2,12 @@
 
 SUBDIRS = lib generated samples
 
-all: $(SUBDIRS)
+all: $(SUBDIRS) libynl.a
 
 samples: | lib generated
+libynl.a: | lib generated
+	@echo -e "\tAR $@"
+	@ar rcs $@ lib/ynl.o generated/*-user.o
 
 $(SUBDIRS):
 	@if [ -f "$@/Makefile" ] ; then \
@@ -17,5 +20,6 @@ clean distclean:
 			$(MAKE) -C $$dir $@; \
 		fi \
 	done
+	rm -f libynl.a
 
 .PHONY: all clean distclean $(SUBDIRS)
diff --git a/tools/net/ynl/lib/Makefile b/tools/net/ynl/lib/Makefile
index dfff3ecd1cbab..2887cc5de530f 100644
--- a/tools/net/ynl/lib/Makefile
+++ b/tools/net/ynl/lib/Makefile
@@ -14,7 +14,9 @@ include $(wildcard *.d)
 all: ynl.a
 
 ynl.a: $(OBJS)
-	ar rcs $@ $(OBJS)
+	@echo -e "\tAR $@"
+	@ar rcs $@ $(OBJS)
+
 clean:
 	rm -f *.o *.d *~
 	rm -rf __pycache__
diff --git a/tools/testing/selftests/net/ynl.mk b/tools/testing/selftests/net/ynl.mk
new file mode 100644
index 0000000000000..59cb26cf3f738
--- /dev/null
+++ b/tools/testing/selftests/net/ynl.mk
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# YNL selftest build snippet
+
+# Inputs:
+#
+# YNL_GENS:      families we need in the selftests
+# YNL_PROGS:     TEST_PROGS which need YNL (TODO, none exist, yet)
+# YNL_GEN_FILES: TEST_GEN_FILES which need YNL
+
+YNL_OUTPUTS := $(patsubst %,$(OUTPUT)/%,$(YNL_GEN_FILES))
+
+$(YNL_OUTPUTS): $(OUTPUT)/libynl.a
+$(YNL_OUTPUTS): CFLAGS += \
+	-I$(top_srcdir)/usr/include/ $(KHDR_INCLUDES) \
+	-I$(top_srcdir)/tools/net/ynl/lib/ \
+	-I$(top_srcdir)/tools/net/ynl/generated/
+
+$(OUTPUT)/libynl.a:
+	$(Q)$(MAKE) -C $(top_srcdir)/tools/net/ynl GENS="$(YNL_GENS)" libynl.a
+	$(Q)cp $(top_srcdir)/tools/net/ynl/libynl.a $(OUTPUT)/libynl.a
-- 
2.45.2.803.g4e1b14247a-goog

