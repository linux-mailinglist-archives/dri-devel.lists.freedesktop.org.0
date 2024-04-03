Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A060A8960A2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 02:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D3B11220F;
	Wed,  3 Apr 2024 00:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="UmW0KnuZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BDF11220F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 00:21:06 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-611e89cf3b5so95066987b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 17:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712103666; x=1712708466;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=eXtxUBXD7iooLyZhC2sG2IzmQnskI70ikTtvKYSHue4=;
 b=UmW0KnuZM0/l71avWqLnqTdTeODo8MSe4bFNUx9poQ9vElGBbA+9y/21bNotCjCM0U
 Jdr1WVYgex6nBFHpm8eWvEyxW+X5IXh5PT62FJ840qZYYkpteti+Tw9DIBfo3IHQk3By
 2aA2lRQKT3gXzsiXw4Ou2ECkrh51CPc6POXPpUGeOMN3pSOTrGs/VXvhz8taCNnei2cN
 lxq1L/AXHU0Ol1WM3o9TDkBfr0udbKzFe+dAsLzz+5Ppx1OvUpwh9AffZVaDCKUEGtC+
 2QVMMCXd4R+FfQhAS9jKfWvrihVGi7v9fpBlHwLtpybIq5O43biOCf85l1uwM64qJV7C
 lxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712103666; x=1712708466;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eXtxUBXD7iooLyZhC2sG2IzmQnskI70ikTtvKYSHue4=;
 b=gMsLL6wdU5JlDMha7BtP5aNZ71xBkRZy31WM8n79utleTR5rk1pEROi+nDlvgyMO9l
 mmJMfikM3O5EJDdifZ2bdjjPgYC3B7d7wSIcKB79pYBwF4h+XrGkHHxlKjVQ7ys7UffZ
 nRpgh344ghelkNmGCoakzwimC4NmndFX7zIUf+F8+O5HIvh9T9z/lhZ4/SpadTygtSlu
 byD+N3ZTHXIDK7L8HR7jrNMAOZi2fGThVcmgaOaeGfYhtT8pAxPrV7Ic1P58f4DyHFnE
 B88ws+lGvlIMrAsVXpbUT8vX8yEr50cj0nlAQBJAxoJIF5J/DhoCqsUIuqwPKYJSB5fB
 qkIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe9sydihIvHPhq6gcppZGd5c+EiT1gN1J61nG4yaNr4iHO1ROE8Kqk+SMsQA1CSflLg+adg4ZmIZnFMlD1rAIShOU6wOTO4GOTdlusga8c
X-Gm-Message-State: AOJu0YyHfQ8IgsqJsY6YX7uwm60MBC0fKwKWz7O7xblEYQb/EZYF0ZFq
 KOhgnbspn8zBBKGlL0cg8uI+ydf3O90D1kszFLzIWb9kAsFso6tGZkf1QVu9Wto05wZWauGVKmt
 pkC0SdFoR9pv8UQFNb9PSrA==
X-Google-Smtp-Source: AGHT+IHoaW+htRqZm8yPKrycRs7l5wFzQqTxKosjj/zq3wYGjjEBoSynJ7xr0b8IxFqU+0S52tGWH9KU7a/j6/BQOw==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:1726:7620:90a1:78b9])
 (user=almasrymina job=sendgmr) by 2002:a05:690c:a9d:b0:615:c92:d3ab with SMTP
 id ci29-20020a05690c0a9d00b006150c92d3abmr1126296ywb.4.1712103665733; Tue, 02
 Apr 2024 17:21:05 -0700 (PDT)
Date: Tue,  2 Apr 2024 17:20:40 -0700
In-Reply-To: <20240403002053.2376017-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20240403002053.2376017-1-almasrymina@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240403002053.2376017-4-almasrymina@google.com>
Subject: [RFC PATCH net-next v8 03/14] net: netdev netlink api to bind dma-buf
 to a net device
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
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
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
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Amritha Nambiar <amritha.nambiar@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, 
 Christian Brauner <brauner@kernel.org>, Simon Horman <horms@kernel.org>, 
 David Howells <dhowells@redhat.com>, Florian Westphal <fw@strlen.de>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Kuniyuki Iwashima <kuniyu@amazon.com>,
 Jens Axboe <axboe@kernel.dk>, 
 Arseniy Krasnov <avkrasnov@salutedevices.com>, 
 Aleksander Lobakin <aleksander.lobakin@intel.com>,
 Michael Lass <bevan@bi-co.net>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Richard Gobert <richardbgobert@gmail.com>, 
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Johannes Berg <johannes.berg@intel.com>, Abel Wu <wuyun.abel@bytedance.com>, 
 Breno Leitao <leitao@debian.org>, Pavel Begunkov <asml.silence@gmail.com>,
 David Wei <dw@davidwei.uk>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Shailend Chand <shailend@google.com>, 
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

API takes the dma-buf fd as input, and binds it to the netdevice. The
user can specify the rx queues to bind the dma-buf to.

Suggested-by: Stanislav Fomichev <sdf@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v7:
- Use flags: [ admin-perm ] instead of a CAP_NET_ADMIN check.

Changes in v1:
- Add rx-queue-type to distingish rx from tx (Jakub)
- Return dma-buf ID from netlink API (David, Stan)

Changes in RFC-v3:
- Support binding multiple rx rx-queues

---
 Documentation/netlink/specs/netdev.yaml | 53 +++++++++++++++++++++++++
 include/uapi/linux/netdev.h             | 19 +++++++++
 net/core/netdev-genl-gen.c              | 19 +++++++++
 net/core/netdev-genl-gen.h              |  2 +
 net/core/netdev-genl.c                  |  6 +++
 tools/include/uapi/linux/netdev.h       | 19 +++++++++
 6 files changed, 118 insertions(+)

diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
index 76352dbd2be4..275d1faa87a6 100644
--- a/Documentation/netlink/specs/netdev.yaml
+++ b/Documentation/netlink/specs/netdev.yaml
@@ -268,6 +268,45 @@ attribute-sets:
         name: napi-id
         doc: ID of the NAPI instance which services this queue.
         type: u32
+  -
+    name: queue-dmabuf
+    attributes:
+      -
+        name: type
+        doc: rx or tx queue
+        type: u8
+        enum: queue-type
+      -
+        name: idx
+        doc: queue index
+        type: u32
+
+  -
+    name: bind-dmabuf
+    attributes:
+      -
+        name: ifindex
+        doc: netdev ifindex to bind the dma-buf to.
+        type: u32
+        checks:
+          min: 1
+      -
+        name: queues
+        doc: receive queues to bind the dma-buf to.
+        type: nest
+        nested-attributes: queue-dmabuf
+        multi-attr: true
+      -
+        name: dmabuf-fd
+        doc: dmabuf file descriptor to bind.
+        type: u32
+      -
+        name: dmabuf-id
+        doc: id of the dmabuf binding
+        type: u32
+        checks:
+          min: 1
+
 
   -
     name: qstats
@@ -457,6 +496,20 @@ operations:
           attributes:
             - ifindex
         reply: *queue-get-op
+    -
+      name: bind-rx
+      doc: Bind dmabuf to netdev
+      attribute-set: bind-dmabuf
+      flags: [ admin-perm ]
+      do:
+        request:
+          attributes:
+            - ifindex
+            - dmabuf-fd
+            - queues
+        reply:
+          attributes:
+            - dmabuf-id
     -
       name: napi-get
       doc: Get information about NAPI instances configured on the system.
diff --git a/include/uapi/linux/netdev.h b/include/uapi/linux/netdev.h
index bb65ee840cda..c5b959a0ed6c 100644
--- a/include/uapi/linux/netdev.h
+++ b/include/uapi/linux/netdev.h
@@ -136,6 +136,24 @@ enum {
 	NETDEV_A_QUEUE_MAX = (__NETDEV_A_QUEUE_MAX - 1)
 };
 
+enum {
+	NETDEV_A_QUEUE_DMABUF_TYPE = 1,
+	NETDEV_A_QUEUE_DMABUF_IDX,
+
+	__NETDEV_A_QUEUE_DMABUF_MAX,
+	NETDEV_A_QUEUE_DMABUF_MAX = (__NETDEV_A_QUEUE_DMABUF_MAX - 1)
+};
+
+enum {
+	NETDEV_A_BIND_DMABUF_IFINDEX = 1,
+	NETDEV_A_BIND_DMABUF_QUEUES,
+	NETDEV_A_BIND_DMABUF_DMABUF_FD,
+	NETDEV_A_BIND_DMABUF_DMABUF_ID,
+
+	__NETDEV_A_BIND_DMABUF_MAX,
+	NETDEV_A_BIND_DMABUF_MAX = (__NETDEV_A_BIND_DMABUF_MAX - 1)
+};
+
 enum {
 	NETDEV_A_QSTATS_IFINDEX = 1,
 	NETDEV_A_QSTATS_QUEUE_TYPE,
@@ -162,6 +180,7 @@ enum {
 	NETDEV_CMD_PAGE_POOL_CHANGE_NTF,
 	NETDEV_CMD_PAGE_POOL_STATS_GET,
 	NETDEV_CMD_QUEUE_GET,
+	NETDEV_CMD_BIND_RX,
 	NETDEV_CMD_NAPI_GET,
 	NETDEV_CMD_QSTATS_GET,
 
diff --git a/net/core/netdev-genl-gen.c b/net/core/netdev-genl-gen.c
index 8d8ace9ef87f..bbaaa1b36b5b 100644
--- a/net/core/netdev-genl-gen.c
+++ b/net/core/netdev-genl-gen.c
@@ -27,6 +27,11 @@ const struct nla_policy netdev_page_pool_info_nl_policy[NETDEV_A_PAGE_POOL_IFIND
 	[NETDEV_A_PAGE_POOL_IFINDEX] = NLA_POLICY_FULL_RANGE(NLA_U32, &netdev_a_page_pool_ifindex_range),
 };
 
+const struct nla_policy netdev_queue_dmabuf_nl_policy[NETDEV_A_QUEUE_DMABUF_IDX + 1] = {
+	[NETDEV_A_QUEUE_DMABUF_TYPE] = NLA_POLICY_MAX(NLA_U8, 1),
+	[NETDEV_A_QUEUE_DMABUF_IDX] = { .type = NLA_U32, },
+};
+
 /* NETDEV_CMD_DEV_GET - do */
 static const struct nla_policy netdev_dev_get_nl_policy[NETDEV_A_DEV_IFINDEX + 1] = {
 	[NETDEV_A_DEV_IFINDEX] = NLA_POLICY_MIN(NLA_U32, 1),
@@ -58,6 +63,13 @@ static const struct nla_policy netdev_queue_get_dump_nl_policy[NETDEV_A_QUEUE_IF
 	[NETDEV_A_QUEUE_IFINDEX] = NLA_POLICY_MIN(NLA_U32, 1),
 };
 
+/* NETDEV_CMD_BIND_RX - do */
+static const struct nla_policy netdev_bind_rx_nl_policy[NETDEV_A_BIND_DMABUF_DMABUF_FD + 1] = {
+	[NETDEV_A_BIND_DMABUF_IFINDEX] = NLA_POLICY_MIN(NLA_U32, 1),
+	[NETDEV_A_BIND_DMABUF_DMABUF_FD] = { .type = NLA_U32, },
+	[NETDEV_A_BIND_DMABUF_QUEUES] = NLA_POLICY_NESTED(netdev_queue_dmabuf_nl_policy),
+};
+
 /* NETDEV_CMD_NAPI_GET - do */
 static const struct nla_policy netdev_napi_get_do_nl_policy[NETDEV_A_NAPI_ID + 1] = {
 	[NETDEV_A_NAPI_ID] = { .type = NLA_U32, },
@@ -129,6 +141,13 @@ static const struct genl_split_ops netdev_nl_ops[] = {
 		.maxattr	= NETDEV_A_QUEUE_IFINDEX,
 		.flags		= GENL_CMD_CAP_DUMP,
 	},
+	{
+		.cmd		= NETDEV_CMD_BIND_RX,
+		.doit		= netdev_nl_bind_rx_doit,
+		.policy		= netdev_bind_rx_nl_policy,
+		.maxattr	= NETDEV_A_BIND_DMABUF_DMABUF_FD,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
 	{
 		.cmd		= NETDEV_CMD_NAPI_GET,
 		.doit		= netdev_nl_napi_get_doit,
diff --git a/net/core/netdev-genl-gen.h b/net/core/netdev-genl-gen.h
index 4db40fd5b4a9..ca5a0983f283 100644
--- a/net/core/netdev-genl-gen.h
+++ b/net/core/netdev-genl-gen.h
@@ -13,6 +13,7 @@
 
 /* Common nested types */
 extern const struct nla_policy netdev_page_pool_info_nl_policy[NETDEV_A_PAGE_POOL_IFINDEX + 1];
+extern const struct nla_policy netdev_queue_dmabuf_nl_policy[NETDEV_A_QUEUE_DMABUF_IDX + 1];
 
 int netdev_nl_dev_get_doit(struct sk_buff *skb, struct genl_info *info);
 int netdev_nl_dev_get_dumpit(struct sk_buff *skb, struct netlink_callback *cb);
@@ -26,6 +27,7 @@ int netdev_nl_page_pool_stats_get_dumpit(struct sk_buff *skb,
 int netdev_nl_queue_get_doit(struct sk_buff *skb, struct genl_info *info);
 int netdev_nl_queue_get_dumpit(struct sk_buff *skb,
 			       struct netlink_callback *cb);
+int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info);
 int netdev_nl_napi_get_doit(struct sk_buff *skb, struct genl_info *info);
 int netdev_nl_napi_get_dumpit(struct sk_buff *skb, struct netlink_callback *cb);
 int netdev_nl_qstats_get_dumpit(struct sk_buff *skb,
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 7004b3399c2b..67711d29d0d4 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -674,6 +674,12 @@ int netdev_nl_qstats_get_dumpit(struct sk_buff *skb,
 	return err;
 }
 
+/* Stub */
+int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
+{
+	return 0;
+}
+
 static int netdev_genl_netdevice_event(struct notifier_block *nb,
 				       unsigned long event, void *ptr)
 {
diff --git a/tools/include/uapi/linux/netdev.h b/tools/include/uapi/linux/netdev.h
index bb65ee840cda..c5b959a0ed6c 100644
--- a/tools/include/uapi/linux/netdev.h
+++ b/tools/include/uapi/linux/netdev.h
@@ -136,6 +136,24 @@ enum {
 	NETDEV_A_QUEUE_MAX = (__NETDEV_A_QUEUE_MAX - 1)
 };
 
+enum {
+	NETDEV_A_QUEUE_DMABUF_TYPE = 1,
+	NETDEV_A_QUEUE_DMABUF_IDX,
+
+	__NETDEV_A_QUEUE_DMABUF_MAX,
+	NETDEV_A_QUEUE_DMABUF_MAX = (__NETDEV_A_QUEUE_DMABUF_MAX - 1)
+};
+
+enum {
+	NETDEV_A_BIND_DMABUF_IFINDEX = 1,
+	NETDEV_A_BIND_DMABUF_QUEUES,
+	NETDEV_A_BIND_DMABUF_DMABUF_FD,
+	NETDEV_A_BIND_DMABUF_DMABUF_ID,
+
+	__NETDEV_A_BIND_DMABUF_MAX,
+	NETDEV_A_BIND_DMABUF_MAX = (__NETDEV_A_BIND_DMABUF_MAX - 1)
+};
+
 enum {
 	NETDEV_A_QSTATS_IFINDEX = 1,
 	NETDEV_A_QSTATS_QUEUE_TYPE,
@@ -162,6 +180,7 @@ enum {
 	NETDEV_CMD_PAGE_POOL_CHANGE_NTF,
 	NETDEV_CMD_PAGE_POOL_STATS_GET,
 	NETDEV_CMD_QUEUE_GET,
+	NETDEV_CMD_BIND_RX,
 	NETDEV_CMD_NAPI_GET,
 	NETDEV_CMD_QSTATS_GET,
 
-- 
2.44.0.478.gd926399ef9-goog

