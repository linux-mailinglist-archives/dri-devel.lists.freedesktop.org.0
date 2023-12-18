Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CD78179CE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185EA10E280;
	Mon, 18 Dec 2023 18:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com
 [209.85.214.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC60110E084
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:35:40 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-1d3c55e0b46so4990235ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 10:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702924540; x=1703529340;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=aoV0tDbNZgYvivQmYBKAP9GCcy/xYSu5tcLB8R1UGG0=;
 b=HsItVowzhHeadeWaLDVAXxG49B/fqCrA5NQ52LRv64V5XYleTPC8GSAh8+KYITgeWV
 DOD+Fwa/dpAQx2PBNTVeB3pgZoier82Zwupi+PrmcGwoAsyIzlE+QSHt/PHLwt7kUz6L
 rm5JmDa++8Qpg9JG57zG+UaUFYsowZiDeGHsYqrck7M3x9sKdyhbrzcAywEPw+HGR2Pt
 vGKxlDjXz+AOBo4Kw2TgBeU+fdlWux0Rq+d0xnZaovkpQXNDOc//Uerkm11ePkjO+Jbk
 DP4uO5x3JuzO9M+g18WDOiWBq4FCBkH9IGLTlPnxm8loiJ0MxA7xw8JLQGtnYl9YYsVi
 qpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702924540; x=1703529340;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aoV0tDbNZgYvivQmYBKAP9GCcy/xYSu5tcLB8R1UGG0=;
 b=xDhvmza4L5YoKvf94vdMN5GbkdTyc2Tm0uTlGpmGdvxd64K5Y/Ab5Z0IZZUjwwmhWo
 Q7NBxwfseIEwtDPHuAmH4HXspXVDCRIAASCLAa+ar34zAImGqb3vb1IomEAE/dqiYRzq
 umRcZdLmUXSu1f1TfxnA+9u5Lz9VhZOTGSXUlKOKO/eAPDKhFjBz4Ttlv9SM6I5E8zuI
 TE/QXvH3v/8yfPtpjausGbTM9uasWuHucMpcHu+JnizutrIP0BdR69sA1XQErrLyAS+w
 O2ThbMMaqMw6XPR1/PX7TNkTxy2z4tcKu/qFJxv3brPzGlyp48JEHYoEQyWGg3LYRs6k
 Va6w==
X-Gm-Message-State: AOJu0YxpZ3xRjriqfIW46WXV/iMeGTEIP6bSHIOeBmBMq3p29Z2klzgA
 ZkSlnKKlAbfpE9K4wChyLPnvZVME84dNIy9/PQ==
X-Google-Smtp-Source: AGHT+IEMfoIa/raGANjVA6sVzaFnIgW/UHU0mTfijiFIW4CyzMvFaY2GqRhlctpqAAwku+Eg67s2p0htTzoKdXQHcw==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:5cbf:3534:fb34:758e])
 (user=almasrymina job=sendgmr) by 2002:a25:b904:0:b0:d9a:e3d9:99bd with SMTP
 id x4-20020a25b904000000b00d9ae3d999bdmr241027ybj.5.1702867235030; Sun, 17
 Dec 2023 18:40:35 -0800 (PST)
Date: Sun, 17 Dec 2023 18:40:10 -0800
In-Reply-To: <20231218024024.3516870-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231218024024.3516870-1-almasrymina@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231218024024.3516870-4-almasrymina@google.com>
Subject: [RFC PATCH net-next v5 03/14] net: netdev netlink api to bind dma-buf
 to a net device
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

API takes the dma-buf fd as input, and binds it to the netdevice. The
user can specify the rx queues to bind the dma-buf to.

Suggested-by: Stanislav Fomichev <sdf@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

Changes in v1:
- Add rx-queue-type to distingish rx from tx (Jakub)
- Return dma-buf ID from netlink API (David, Stan)

Changes in RFC-v3:
- Support binding multiple rx rx-queues

---
 Documentation/netlink/specs/netdev.yaml | 52 +++++++++++++++++++++++++
 include/uapi/linux/netdev.h             | 19 +++++++++
 net/core/netdev-genl-gen.c              | 19 +++++++++
 net/core/netdev-genl-gen.h              |  2 +
 net/core/netdev-genl.c                  |  6 +++
 tools/include/uapi/linux/netdev.h       | 19 +++++++++
 6 files changed, 117 insertions(+)

diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
index f2c76d103bd8..df6a11d47006 100644
--- a/Documentation/netlink/specs/netdev.yaml
+++ b/Documentation/netlink/specs/netdev.yaml
@@ -260,6 +260,45 @@ attribute-sets:
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
 
 operations:
   list:
@@ -382,6 +421,19 @@ operations:
           attributes:
             - ifindex
         reply: *queue-get-op
+    -
+      name: bind-rx
+      doc: Bind dmabuf to netdev
+      attribute-set: bind-dmabuf
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
index 424c5e28f495..35d201dc4b05 100644
--- a/include/uapi/linux/netdev.h
+++ b/include/uapi/linux/netdev.h
@@ -129,6 +129,24 @@ enum {
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
 	NETDEV_CMD_DEV_GET = 1,
 	NETDEV_CMD_DEV_ADD_NTF,
@@ -140,6 +158,7 @@ enum {
 	NETDEV_CMD_PAGE_POOL_CHANGE_NTF,
 	NETDEV_CMD_PAGE_POOL_STATS_GET,
 	NETDEV_CMD_QUEUE_GET,
+	NETDEV_CMD_BIND_RX,
 	NETDEV_CMD_NAPI_GET,
 
 	__NETDEV_CMD_MAX,
diff --git a/net/core/netdev-genl-gen.c b/net/core/netdev-genl-gen.c
index be7f2ebd61b2..3384b1ae3f40 100644
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
@@ -124,6 +136,13 @@ static const struct genl_split_ops netdev_nl_ops[] = {
 		.maxattr	= NETDEV_A_QUEUE_IFINDEX,
 		.flags		= GENL_CMD_CAP_DUMP,
 	},
+	{
+		.cmd		= NETDEV_CMD_BIND_RX,
+		.doit		= netdev_nl_bind_rx_doit,
+		.policy		= netdev_bind_rx_nl_policy,
+		.maxattr	= NETDEV_A_BIND_DMABUF_DMABUF_FD,
+		.flags		= GENL_CMD_CAP_DO,
+	},
 	{
 		.cmd		= NETDEV_CMD_NAPI_GET,
 		.doit		= netdev_nl_napi_get_doit,
diff --git a/net/core/netdev-genl-gen.h b/net/core/netdev-genl-gen.h
index a47f2bcbe4fa..a7ede514eccd 100644
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
 
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index fd98936da3ae..0ed292d87ae0 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -469,6 +469,12 @@ int netdev_nl_queue_get_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
 	return skb->len;
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
index 424c5e28f495..35d201dc4b05 100644
--- a/tools/include/uapi/linux/netdev.h
+++ b/tools/include/uapi/linux/netdev.h
@@ -129,6 +129,24 @@ enum {
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
 	NETDEV_CMD_DEV_GET = 1,
 	NETDEV_CMD_DEV_ADD_NTF,
@@ -140,6 +158,7 @@ enum {
 	NETDEV_CMD_PAGE_POOL_CHANGE_NTF,
 	NETDEV_CMD_PAGE_POOL_STATS_GET,
 	NETDEV_CMD_QUEUE_GET,
+	NETDEV_CMD_BIND_RX,
 	NETDEV_CMD_NAPI_GET,
 
 	__NETDEV_CMD_MAX,
-- 
2.43.0.472.g3155946c3a-goog

