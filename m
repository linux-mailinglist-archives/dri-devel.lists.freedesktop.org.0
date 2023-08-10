Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C92AC776DB2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 03:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97DA10E14A;
	Thu, 10 Aug 2023 01:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A15E10E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 01:58:02 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d4b1ec7e918so462425276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 18:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691632681; x=1692237481;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=GDnXmpYx8eP78AYOg4pkJM7yEm1cliNyt0IkWPt0PrI=;
 b=Aen8uuD4LiwHFY+bqurb7Vas9R8zhA/qtZnKjesyLr5JuM44D+DP+E9C2pLLGayB4g
 ZHE3IbXDsPjq2PBUhtJpp6RDzAlwJIBXUkAkhCESoOGN06urfoEq3SPiOZ/0DxdeHDe9
 cKpNOPyZi4KD+Uyb5xB1xqoLt0nopqAT9+3zz26lS5SVCyx5dMwrGgYtzEg/ThuoZi8Z
 A7MRxVyO2om7JHDsm6cznmmiBzQwd253XlogVzlnSGnSPXy8XRVlvMZL6sgnSVKi5Scv
 ymTwa9moql6bqYLKe31Hu9IUfhwlQFc2t0h6dlR6On5n3gZzuiV535Xp13oJ8tDzJzgO
 B2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691632681; x=1692237481;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GDnXmpYx8eP78AYOg4pkJM7yEm1cliNyt0IkWPt0PrI=;
 b=P/UQ9B44ly/lru9xxzjJDpk+fZkD7tCVDAOw5LZRzyWzB2VttFdr2zZSFJ2buhNaDI
 CO2fjbAzCvboKbDIhvybjrZHszJ/ZPDkA8+3AyqIy++FVNQAywhFOHRlEdD5EdYP1qYM
 XNSdnnVKyEb9zd39DVX/qJzm5xcrsfDenrc90UnzAlQucdNySorsAgC867snqNFBpcmm
 3Iaw15E+oXI3OSxTAYfaDAje3RbDrNyEK3mfVCa+dXvLmiGO3HiRyIz9Y4SUlQgJhRgT
 CkFDe1N2BF/CT3OTC4+wu8dfICKMsE4w3hsfsrcK9tJ4zfj1HfFdQSKztribk66+YFO4
 dbBg==
X-Gm-Message-State: AOJu0YzAEeVPAwaIYH5m7LoZB25Hf9B15QtAfNVbDWtuY5eJ1s7YLgPf
 Boj68nVUWsPimm9KFyuhsbk6iDS7h3sowauwtw==
X-Google-Smtp-Source: AGHT+IFdKYYGNPKm4yIJ3i7lDukNoxcqgTIDgeuPYnSb7xY53ojSb6n324Dq4HxTw3OmxqB5uOVGQp26su1wnD96Rw==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:73ad:9ed5:e067:2b9b])
 (user=almasrymina job=sendgmr) by 2002:a25:d711:0:b0:d4a:7656:a680 with SMTP
 id o17-20020a25d711000000b00d4a7656a680mr18846ybg.2.1691632681568; Wed, 09
 Aug 2023 18:58:01 -0700 (PDT)
Date: Wed,  9 Aug 2023 18:57:37 -0700
In-Reply-To: <20230810015751.3297321-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230810015751.3297321-2-almasrymina@google.com>
Subject: [RFC PATCH v2 01/11] net: add netdev netlink api to bind dma-buf to a
 net device
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-media@vger.kernel.org, 
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
Cc: Mina Almasry <almasrymina@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, stephen@networkplumber.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Eric Dumazet <edumazet@google.com>,
 sdf@google.com, Andy Lutomirski <luto@kernel.org>,
 Hari Ramakrishnan <rharix@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

API takes the dma-buf fd as input, and binds it to the netdevice. The
user can specify the rx queue to bind the dma-buf to. The user should be
able to bind the same dma-buf to multiple queues, but that is left as
a (minor) TODO in this iteration.

Suggested-by: Stanislav Fomichev <sdf@google.com>

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 Documentation/netlink/specs/netdev.yaml | 27 +++++++++++++++
 include/uapi/linux/netdev.h             | 10 ++++++
 net/core/netdev-genl-gen.c              | 14 ++++++++
 net/core/netdev-genl-gen.h              |  1 +
 net/core/netdev-genl.c                  |  6 ++++
 tools/include/uapi/linux/netdev.h       | 10 ++++++
 tools/net/ynl/generated/netdev-user.c   | 41 ++++++++++++++++++++++
 tools/net/ynl/generated/netdev-user.h   | 46 +++++++++++++++++++++++++
 8 files changed, 155 insertions(+)

diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
index e41015310a6e..907a45260e95 100644
--- a/Documentation/netlink/specs/netdev.yaml
+++ b/Documentation/netlink/specs/netdev.yaml
@@ -68,6 +68,23 @@ attribute-sets:
         type: u32
         checks:
           min: 1
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
+        name: queue-idx
+        doc: receive queue index to bind the dma-buf to.
+        type: u32
+      -
+        name: dmabuf-fd
+        doc: dmabuf file descriptor to bind.
+        type: u32
 
 operations:
   list:
@@ -100,6 +117,16 @@ operations:
       doc: Notification about device configuration being changed.
       notify: dev-get
       mcgrp: mgmt
+    -
+      name: bind-rx
+      doc: Bind dmabuf to netdev
+      attribute-set: bind-dmabuf
+      do:
+        request:
+          attributes:
+            - ifindex
+            - dmabuf-fd
+            - queue-idx
 
 mcast-groups:
   list:
diff --git a/include/uapi/linux/netdev.h b/include/uapi/linux/netdev.h
index bf71698a1e82..242b2b65161c 100644
--- a/include/uapi/linux/netdev.h
+++ b/include/uapi/linux/netdev.h
@@ -47,11 +47,21 @@ enum {
 	NETDEV_A_DEV_MAX = (__NETDEV_A_DEV_MAX - 1)
 };
 
+enum {
+	NETDEV_A_BIND_DMABUF_IFINDEX = 1,
+	NETDEV_A_BIND_DMABUF_QUEUE_IDX,
+	NETDEV_A_BIND_DMABUF_DMABUF_FD,
+
+	__NETDEV_A_BIND_DMABUF_MAX,
+	NETDEV_A_BIND_DMABUF_MAX = (__NETDEV_A_BIND_DMABUF_MAX - 1)
+};
+
 enum {
 	NETDEV_CMD_DEV_GET = 1,
 	NETDEV_CMD_DEV_ADD_NTF,
 	NETDEV_CMD_DEV_DEL_NTF,
 	NETDEV_CMD_DEV_CHANGE_NTF,
+	NETDEV_CMD_BIND_RX,
 
 	__NETDEV_CMD_MAX,
 	NETDEV_CMD_MAX = (__NETDEV_CMD_MAX - 1)
diff --git a/net/core/netdev-genl-gen.c b/net/core/netdev-genl-gen.c
index ea9231378aa6..2e34ad5cccfa 100644
--- a/net/core/netdev-genl-gen.c
+++ b/net/core/netdev-genl-gen.c
@@ -15,6 +15,13 @@ static const struct nla_policy netdev_dev_get_nl_policy[NETDEV_A_DEV_IFINDEX + 1
 	[NETDEV_A_DEV_IFINDEX] = NLA_POLICY_MIN(NLA_U32, 1),
 };
 
+/* NETDEV_CMD_BIND_RX - do */
+static const struct nla_policy netdev_bind_rx_nl_policy[NETDEV_A_BIND_DMABUF_DMABUF_FD + 1] = {
+	[NETDEV_A_BIND_DMABUF_IFINDEX] = NLA_POLICY_MIN(NLA_U32, 1),
+	[NETDEV_A_BIND_DMABUF_DMABUF_FD] = { .type = NLA_U32, },
+	[NETDEV_A_BIND_DMABUF_QUEUE_IDX] = { .type = NLA_U32, },
+};
+
 /* Ops table for netdev */
 static const struct genl_split_ops netdev_nl_ops[] = {
 	{
@@ -29,6 +36,13 @@ static const struct genl_split_ops netdev_nl_ops[] = {
 		.dumpit	= netdev_nl_dev_get_dumpit,
 		.flags	= GENL_CMD_CAP_DUMP,
 	},
+	{
+		.cmd		= NETDEV_CMD_BIND_RX,
+		.doit		= netdev_nl_bind_rx_doit,
+		.policy		= netdev_bind_rx_nl_policy,
+		.maxattr	= NETDEV_A_BIND_DMABUF_DMABUF_FD,
+		.flags		= GENL_CMD_CAP_DO,
+	},
 };
 
 static const struct genl_multicast_group netdev_nl_mcgrps[] = {
diff --git a/net/core/netdev-genl-gen.h b/net/core/netdev-genl-gen.h
index 7b370c073e7d..5aaeb435ec08 100644
--- a/net/core/netdev-genl-gen.h
+++ b/net/core/netdev-genl-gen.h
@@ -13,6 +13,7 @@
 
 int netdev_nl_dev_get_doit(struct sk_buff *skb, struct genl_info *info);
 int netdev_nl_dev_get_dumpit(struct sk_buff *skb, struct netlink_callback *cb);
+int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info);
 
 enum {
 	NETDEV_NLGRP_MGMT,
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 65ef4867fc49..bf7324dd6c36 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -141,6 +141,12 @@ int netdev_nl_dev_get_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
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
index bf71698a1e82..242b2b65161c 100644
--- a/tools/include/uapi/linux/netdev.h
+++ b/tools/include/uapi/linux/netdev.h
@@ -47,11 +47,21 @@ enum {
 	NETDEV_A_DEV_MAX = (__NETDEV_A_DEV_MAX - 1)
 };
 
+enum {
+	NETDEV_A_BIND_DMABUF_IFINDEX = 1,
+	NETDEV_A_BIND_DMABUF_QUEUE_IDX,
+	NETDEV_A_BIND_DMABUF_DMABUF_FD,
+
+	__NETDEV_A_BIND_DMABUF_MAX,
+	NETDEV_A_BIND_DMABUF_MAX = (__NETDEV_A_BIND_DMABUF_MAX - 1)
+};
+
 enum {
 	NETDEV_CMD_DEV_GET = 1,
 	NETDEV_CMD_DEV_ADD_NTF,
 	NETDEV_CMD_DEV_DEL_NTF,
 	NETDEV_CMD_DEV_CHANGE_NTF,
+	NETDEV_CMD_BIND_RX,
 
 	__NETDEV_CMD_MAX,
 	NETDEV_CMD_MAX = (__NETDEV_CMD_MAX - 1)
diff --git a/tools/net/ynl/generated/netdev-user.c b/tools/net/ynl/generated/netdev-user.c
index 4eb8aefef0cd..2716e63820d2 100644
--- a/tools/net/ynl/generated/netdev-user.c
+++ b/tools/net/ynl/generated/netdev-user.c
@@ -18,6 +18,7 @@ static const char * const netdev_op_strmap[] = {
 	[NETDEV_CMD_DEV_ADD_NTF] = "dev-add-ntf",
 	[NETDEV_CMD_DEV_DEL_NTF] = "dev-del-ntf",
 	[NETDEV_CMD_DEV_CHANGE_NTF] = "dev-change-ntf",
+	[NETDEV_CMD_BIND_RX] = "bind-rx",
 };
 
 const char *netdev_op_str(int op)
@@ -57,6 +58,17 @@ struct ynl_policy_nest netdev_dev_nest = {
 	.table = netdev_dev_policy,
 };
 
+struct ynl_policy_attr netdev_bind_dmabuf_policy[NETDEV_A_BIND_DMABUF_MAX + 1] = {
+	[NETDEV_A_BIND_DMABUF_IFINDEX] = { .name = "ifindex", .type = YNL_PT_U32, },
+	[NETDEV_A_BIND_DMABUF_QUEUE_IDX] = { .name = "queue-idx", .type = YNL_PT_U32, },
+	[NETDEV_A_BIND_DMABUF_DMABUF_FD] = { .name = "dmabuf-fd", .type = YNL_PT_U32, },
+};
+
+struct ynl_policy_nest netdev_bind_dmabuf_nest = {
+	.max_attr = NETDEV_A_BIND_DMABUF_MAX,
+	.table = netdev_bind_dmabuf_policy,
+};
+
 /* Common nested types */
 /* ============== NETDEV_CMD_DEV_GET ============== */
 /* NETDEV_CMD_DEV_GET - do */
@@ -172,6 +184,35 @@ void netdev_dev_get_ntf_free(struct netdev_dev_get_ntf *rsp)
 	free(rsp);
 }
 
+/* ============== NETDEV_CMD_BIND_RX ============== */
+/* NETDEV_CMD_BIND_RX - do */
+void netdev_bind_rx_req_free(struct netdev_bind_rx_req *req)
+{
+	free(req);
+}
+
+int netdev_bind_rx(struct ynl_sock *ys, struct netdev_bind_rx_req *req)
+{
+	struct nlmsghdr *nlh;
+	int err;
+
+	nlh = ynl_gemsg_start_req(ys, ys->family_id, NETDEV_CMD_BIND_RX, 1);
+	ys->req_policy = &netdev_bind_dmabuf_nest;
+
+	if (req->_present.ifindex)
+		mnl_attr_put_u32(nlh, NETDEV_A_BIND_DMABUF_IFINDEX, req->ifindex);
+	if (req->_present.dmabuf_fd)
+		mnl_attr_put_u32(nlh, NETDEV_A_BIND_DMABUF_DMABUF_FD, req->dmabuf_fd);
+	if (req->_present.queue_idx)
+		mnl_attr_put_u32(nlh, NETDEV_A_BIND_DMABUF_QUEUE_IDX, req->queue_idx);
+
+	err = ynl_exec(ys, nlh, NULL);
+	if (err < 0)
+		return -1;
+
+	return 0;
+}
+
 static const struct ynl_ntf_info netdev_ntf_info[] =  {
 	[NETDEV_CMD_DEV_ADD_NTF] =  {
 		.alloc_sz	= sizeof(struct netdev_dev_get_ntf),
diff --git a/tools/net/ynl/generated/netdev-user.h b/tools/net/ynl/generated/netdev-user.h
index 5554dc69bb9c..74a43bb53627 100644
--- a/tools/net/ynl/generated/netdev-user.h
+++ b/tools/net/ynl/generated/netdev-user.h
@@ -82,4 +82,50 @@ struct netdev_dev_get_ntf {
 
 void netdev_dev_get_ntf_free(struct netdev_dev_get_ntf *rsp);
 
+/* ============== NETDEV_CMD_BIND_RX ============== */
+/* NETDEV_CMD_BIND_RX - do */
+struct netdev_bind_rx_req {
+	struct {
+		__u32 ifindex:1;
+		__u32 dmabuf_fd:1;
+		__u32 queue_idx:1;
+	} _present;
+
+	__u32 ifindex;
+	__u32 dmabuf_fd;
+	__u32 queue_idx;
+};
+
+static inline struct netdev_bind_rx_req *netdev_bind_rx_req_alloc(void)
+{
+	return calloc(1, sizeof(struct netdev_bind_rx_req));
+}
+void netdev_bind_rx_req_free(struct netdev_bind_rx_req *req);
+
+static inline void
+netdev_bind_rx_req_set_ifindex(struct netdev_bind_rx_req *req, __u32 ifindex)
+{
+	req->_present.ifindex = 1;
+	req->ifindex = ifindex;
+}
+static inline void
+netdev_bind_rx_req_set_dmabuf_fd(struct netdev_bind_rx_req *req,
+				 __u32 dmabuf_fd)
+{
+	req->_present.dmabuf_fd = 1;
+	req->dmabuf_fd = dmabuf_fd;
+}
+static inline void
+netdev_bind_rx_req_set_queue_idx(struct netdev_bind_rx_req *req,
+				 __u32 queue_idx)
+{
+	req->_present.queue_idx = 1;
+	req->queue_idx = queue_idx;
+}
+
+/*
+ * Bind dmabuf to netdev
+ */
+int netdev_bind_rx(struct ynl_sock *ys, struct netdev_bind_rx_req *req);
+
 #endif /* _LINUX_NETDEV_GEN_H */
-- 
2.41.0.640.ga95def55d0-goog

