Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7588097CC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 01:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F4910E9BE;
	Fri,  8 Dec 2023 00:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AADB10E9BC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 00:53:22 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5d8da78a5fbso18092427b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 16:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701996802; x=1702601602;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=o2HtSBl/MmwRbvRf64o4B77I6D1fDAMKeKnhqiyczlI=;
 b=Qa0+GSrCoLx5Av0HrcMbd+4g0drpALlvs+xli/FMETPoSm0ZbtsWX6sZg2p6fRgDvt
 NfrhIHaX8NIVNGiT7C2OgmYeihPIiONFRwzNt2AR48ea+6yNBjJ6FpxP0L8GxnDw8XTY
 /s+m4YFVNWHbznREpu3Ko9wNqYUFvO0hR07Yc84EsuZSiy9VQwSTtwPYJ5Sahkr9T8bp
 WwqFIDRBVkksOGsUq6RE1312/roaxDPyZE+Ty9gI8u8rAATSEdwzj3mRS1rgcxsodjDQ
 tKCxRmDnpePupjbZ1swUhWOt/GRk8az924ZhgbN/+Wv//yRGENT+uKie+o2rkUqnIJgL
 LYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701996802; x=1702601602;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o2HtSBl/MmwRbvRf64o4B77I6D1fDAMKeKnhqiyczlI=;
 b=NmxAistJEO2m6OXlR1OFpC61ScfOu4HKoG8BBHsweOQmKHz/65tuCcbL9AM+L6kDgc
 qJ0QtR278FS8tYIgusSV8s7im9OU8g5jcRlnoFP21f2C8/VL9K9F6G61Vc3R+IpRcBcS
 X1YXZJOCAx2GPrPYjbWrew1wO9lzEHVppxRnjLxHEoBdtcplWqz2wFceP61g2WW6yNOw
 un2M3h+BP6tErNu+xTmajWnxfEZs3ewdKibTkPUMOLQNe23rhVwCqgsBLgJIrd+2A6ZD
 8W6DTjiZue/96/32k5KA+Hfes8oGOelKr24sg1Nkf6SuCrvDWHwSuwtYOz3SPmd515EA
 UIPA==
X-Gm-Message-State: AOJu0YznUHk/yWFiJTaPkRA7S07g4yZRidCnaaNOX+RdVMxBkRaERRHj
 yuj+rJY3h0ul/5/fNuL5tKtMxf/Ik1TQB0VCJg==
X-Google-Smtp-Source: AGHT+IGWOe8MiWAkZCA+iQLKZXfZKYY/bh9fGGE/vdscnPqlbi7pHiYt49I0HmZQtMitXM2+GWeFIEQqSaEypsCd9g==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:f1cf:c733:235b:9fff])
 (user=almasrymina job=sendgmr) by 2002:a81:af41:0:b0:5d4:1846:3121 with SMTP
 id x1-20020a81af41000000b005d418463121mr43133ywj.8.1701996801728; Thu, 07 Dec
 2023 16:53:21 -0800 (PST)
Date: Thu,  7 Dec 2023 16:52:44 -0800
In-Reply-To: <20231208005250.2910004-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231208005250.2910004-14-almasrymina@google.com>
Subject: [net-next v1 13/16] tcp: RX path for devmem TCP
From: Mina Almasry <almasrymina@google.com>
To: Shailend Chand <shailend@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
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
 Kaiyuan Zhang <kaiyuanz@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Yunsheng Lin <linyunsheng@huawei.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In tcp_recvmsg_locked(), detect if the skb being received by the user
is a devmem skb. In this case - if the user provided the MSG_SOCK_DEVMEM
flag - pass it to tcp_recvmsg_devmem() for custom handling.

tcp_recvmsg_devmem() copies any data in the skb header to the linear
buffer, and returns a cmsg to the user indicating the number of bytes
returned in the linear buffer.

tcp_recvmsg_devmem() then loops over the unaccessible devmem skb frags,
and returns to the user a cmsg_devmem indicating the location of the
data in the dmabuf device memory. cmsg_devmem contains this information:

1. the offset into the dmabuf where the payload starts. 'frag_offset'.
2. the size of the frag. 'frag_size'.
3. an opaque token 'frag_token' to return to the kernel when the buffer
is to be released.

The pages awaiting freeing are stored in the newly added
sk->sk_user_pages, and each page passed to userspace is get_page()'d.
This reference is dropped once the userspace indicates that it is
done reading this page.  All pages are released when the socket is
destroyed.

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

Changes in v1:
- Added dmabuf_id to dmabuf_cmsg (David/Stan).
- Devmem -> dmabuf (David).
- Change tcp_recvmsg_dmabuf() check to skb->dmabuf (Paolo).
- Use __skb_frag_ref() & napi_pp_put_page() for refcounting (Yunsheng).

RFC v3:
- Fixed issue with put_cmsg() failing silently.

---
 include/linux/socket.h            |   1 +
 include/net/page_pool/helpers.h   |   9 ++
 include/net/sock.h                |   2 +
 include/uapi/asm-generic/socket.h |   5 +
 include/uapi/linux/uio.h          |  10 ++
 net/ipv4/tcp.c                    | 190 +++++++++++++++++++++++++++++-
 net/ipv4/tcp_ipv4.c               |   8 ++
 7 files changed, 220 insertions(+), 5 deletions(-)

diff --git a/include/linux/socket.h b/include/linux/socket.h
index cfcb7e2c3813..fe2b9e2081bb 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -326,6 +326,7 @@ struct ucred {
 					  * plain text and require encryption
 					  */
 
+#define MSG_SOCK_DEVMEM 0x2000000	/* Receive devmem skbs as cmsg */
 #define MSG_ZEROCOPY	0x4000000	/* Use user data in kernel path */
 #define MSG_SPLICE_PAGES 0x8000000	/* Splice the pages from the iterator in sendmsg() */
 #define MSG_FASTOPEN	0x20000000	/* Send data in TCP SYN */
diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
index 2d4e0a2c5620..e7e2e89d3663 100644
--- a/include/net/page_pool/helpers.h
+++ b/include/net/page_pool/helpers.h
@@ -108,6 +108,15 @@ page_pool_iov_dma_addr(const struct page_pool_iov *ppiov)
 	       ((dma_addr_t)page_pool_iov_idx(ppiov) << PAGE_SHIFT);
 }
 
+static inline unsigned long
+page_pool_iov_virtual_addr(const struct page_pool_iov *ppiov)
+{
+	struct dmabuf_genpool_chunk_owner *owner = page_pool_iov_owner(ppiov);
+
+	return owner->base_virtual +
+	       ((unsigned long)page_pool_iov_idx(ppiov) << PAGE_SHIFT);
+}
+
 static inline struct netdev_dmabuf_binding *
 page_pool_iov_binding(const struct page_pool_iov *ppiov)
 {
diff --git a/include/net/sock.h b/include/net/sock.h
index 1d6931caf0c3..01029c855c1b 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -353,6 +353,7 @@ struct sk_filter;
   *	@sk_txtime_unused: unused txtime flags
   *	@ns_tracker: tracker for netns reference
   *	@sk_bind2_node: bind node in the bhash2 table
+  *	@sk_user_pages: xarray of pages the user is holding a reference on.
   */
 struct sock {
 	/*
@@ -545,6 +546,7 @@ struct sock {
 	struct rcu_head		sk_rcu;
 	netns_tracker		ns_tracker;
 	struct hlist_node	sk_bind2_node;
+	struct xarray		sk_user_pages;
 };
 
 enum sk_pacing {
diff --git a/include/uapi/asm-generic/socket.h b/include/uapi/asm-generic/socket.h
index 8ce8a39a1e5f..25a2f5255f52 100644
--- a/include/uapi/asm-generic/socket.h
+++ b/include/uapi/asm-generic/socket.h
@@ -135,6 +135,11 @@
 #define SO_PASSPIDFD		76
 #define SO_PEERPIDFD		77
 
+#define SO_DEVMEM_LINEAR	98
+#define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
+#define SO_DEVMEM_DMABUF	99
+#define SCM_DEVMEM_DMABUF	SO_DEVMEM_DMABUF
+
 #if !defined(__KERNEL__)
 
 #if __BITS_PER_LONG == 64 || (defined(__x86_64__) && defined(__ILP32__))
diff --git a/include/uapi/linux/uio.h b/include/uapi/linux/uio.h
index 059b1a9147f4..ad92e37699da 100644
--- a/include/uapi/linux/uio.h
+++ b/include/uapi/linux/uio.h
@@ -20,6 +20,16 @@ struct iovec
 	__kernel_size_t iov_len; /* Must be size_t (1003.1g) */
 };
 
+struct dmabuf_cmsg {
+	__u64 frag_offset;	/* offset into the dmabuf where the frag starts.
+				 */
+	__u32 frag_size;	/* size of the frag. */
+	__u32 frag_token;	/* token representing this frag for
+				 * DEVMEM_DONTNEED.
+				 */
+	__u32  dmabuf_id;	/* dmabuf id this frag belongs to. */
+};
+
 /*
  *	UIO_MAXIOV shall be at least 16 1003.1g (5.4.1.1)
  */
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 5a3135e93d3d..088b2b48bee0 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -461,6 +461,7 @@ void tcp_init_sock(struct sock *sk)
 
 	set_bit(SOCK_SUPPORT_ZC, &sk->sk_socket->flags);
 	sk_sockets_allocated_inc(sk);
+	xa_init_flags(&sk->sk_user_pages, XA_FLAGS_ALLOC1);
 }
 EXPORT_SYMBOL(tcp_init_sock);
 
@@ -2303,6 +2304,155 @@ static int tcp_inq_hint(struct sock *sk)
 	return inq;
 }
 
+/* On error, returns the -errno. On success, returns number of bytes sent to the
+ * user. May not consume all of @remaining_len.
+ */
+static int tcp_recvmsg_dmabuf(const struct sock *sk, const struct sk_buff *skb,
+			      unsigned int offset, struct msghdr *msg,
+			      int remaining_len)
+{
+	struct dmabuf_cmsg dmabuf_cmsg = { 0 };
+	unsigned int start;
+	int i, copy, n;
+	int sent = 0;
+	int err = 0;
+
+	do {
+		start = skb_headlen(skb);
+
+		if (!skb->dmabuf) {
+			err = -ENODEV;
+			goto out;
+		}
+
+		/* Copy header. */
+		copy = start - offset;
+		if (copy > 0) {
+			copy = min(copy, remaining_len);
+
+			n = copy_to_iter(skb->data + offset, copy,
+					 &msg->msg_iter);
+			if (n != copy) {
+				err = -EFAULT;
+				goto out;
+			}
+
+			offset += copy;
+			remaining_len -= copy;
+
+			/* First a dmabuf_cmsg for # bytes copied to user
+			 * buffer.
+			 */
+			memset(&dmabuf_cmsg, 0, sizeof(dmabuf_cmsg));
+			dmabuf_cmsg.frag_size = copy;
+			err = put_cmsg(msg, SOL_SOCKET, SO_DEVMEM_LINEAR,
+				       sizeof(dmabuf_cmsg), &dmabuf_cmsg);
+			if (err || msg->msg_flags & MSG_CTRUNC) {
+				msg->msg_flags &= ~MSG_CTRUNC;
+				if (!err)
+					err = -ETOOSMALL;
+				goto out;
+			}
+
+			sent += copy;
+
+			if (remaining_len == 0)
+				goto out;
+		}
+
+		/* after that, send information of dmabuf pages through a
+		 * sequence of cmsg
+		 */
+		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
+			skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
+			struct page_pool_iov *ppiov;
+			u64 frag_offset;
+			u32 user_token;
+			int end;
+
+			/* skb->dmabuf should indicate that ALL the frags in
+			 * this skb are dmabuf page_pool_iovs. We're checking
+			 * for that flag above, but also check individual frags
+			 * here. If the tcp stack is not setting skb->dmabuf
+			 * correctly, we still don't want to crash here when
+			 * accessing pgmap or priv below.
+			 */
+			if (!skb_frag_page_pool_iov(frag)) {
+				net_err_ratelimited("Found non-dmabuf skb with page_pool_iov");
+				err = -ENODEV;
+				goto out;
+			}
+
+			ppiov = skb_frag_page_pool_iov(frag);
+			end = start + skb_frag_size(frag);
+			copy = end - offset;
+
+			if (copy > 0) {
+				copy = min(copy, remaining_len);
+
+				frag_offset = page_pool_iov_virtual_addr(ppiov) +
+					      skb_frag_off(frag) + offset -
+					      start;
+				dmabuf_cmsg.frag_offset = frag_offset;
+				dmabuf_cmsg.frag_size = copy;
+				err = xa_alloc((struct xarray *)&sk->sk_user_pages,
+					       &user_token, frag->bv_page,
+					       xa_limit_31b, GFP_KERNEL);
+				if (err)
+					goto out;
+
+				dmabuf_cmsg.frag_token = user_token;
+				dmabuf_cmsg.dmabuf_id = page_pool_iov_binding_id(ppiov);
+
+				offset += copy;
+				remaining_len -= copy;
+
+				err = put_cmsg(msg, SOL_SOCKET,
+					       SO_DEVMEM_DMABUF,
+					       sizeof(dmabuf_cmsg),
+					       &dmabuf_cmsg);
+				if (err || msg->msg_flags & MSG_CTRUNC) {
+					msg->msg_flags &= ~MSG_CTRUNC;
+					xa_erase((struct xarray *)&sk->sk_user_pages,
+						 user_token);
+					if (!err)
+						err = -ETOOSMALL;
+					goto out;
+				}
+
+				__skb_frag_ref(frag);
+
+				sent += copy;
+
+				if (remaining_len == 0)
+					goto out;
+			}
+			start = end;
+		}
+
+		if (!remaining_len)
+			goto out;
+
+		/* if remaining_len is not satisfied yet, we need to go to the
+		 * next frag in the frag_list to satisfy remaining_len.
+		 */
+		skb = skb_shinfo(skb)->frag_list ?: skb->next;
+
+		offset = offset - start;
+	} while (skb);
+
+	if (remaining_len) {
+		err = -EFAULT;
+		goto out;
+	}
+
+out:
+	if (!sent)
+		sent = err;
+
+	return sent;
+}
+
 /*
  *	This routine copies from a sock struct into the user buffer.
  *
@@ -2316,6 +2466,7 @@ static int tcp_recvmsg_locked(struct sock *sk, struct msghdr *msg, size_t len,
 			      int *cmsg_flags)
 {
 	struct tcp_sock *tp = tcp_sk(sk);
+	int last_copied_dmabuf = -1; /* uninitialized */
 	int copied = 0;
 	u32 peek_seq;
 	u32 *seq;
@@ -2493,15 +2644,44 @@ static int tcp_recvmsg_locked(struct sock *sk, struct msghdr *msg, size_t len,
 		}
 
 		if (!(flags & MSG_TRUNC)) {
-			err = skb_copy_datagram_msg(skb, offset, msg, used);
-			if (err) {
-				/* Exception. Bailout! */
-				if (!copied)
-					copied = -EFAULT;
+			if (last_copied_dmabuf != -1 &&
+			    last_copied_dmabuf != skb->dmabuf)
 				break;
+
+			if (!skb->dmabuf) {
+				err = skb_copy_datagram_msg(skb, offset, msg,
+							    used);
+				if (err) {
+					/* Exception. Bailout! */
+					if (!copied)
+						copied = -EFAULT;
+					break;
+				}
+			} else {
+				if (!(flags & MSG_SOCK_DEVMEM)) {
+					/* skb->dmabuf skbs can only be received
+					 * with the MSG_SOCK_DEVMEM flag.
+					 */
+					if (!copied)
+						copied = -EFAULT;
+
+					break;
+				}
+
+				err = tcp_recvmsg_dmabuf(sk, skb, offset, msg,
+							 used);
+				if (err <= 0) {
+					if (!copied)
+						copied = -EFAULT;
+
+					break;
+				}
+				used = err;
 			}
 		}
 
+		last_copied_dmabuf = skb->dmabuf;
+
 		WRITE_ONCE(*seq, *seq + used);
 		copied += used;
 		len -= used;
diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index 86cc6d36f818..986398cc2f65 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -2501,6 +2501,14 @@ static void tcp_md5sig_info_free_rcu(struct rcu_head *head)
 void tcp_v4_destroy_sock(struct sock *sk)
 {
 	struct tcp_sock *tp = tcp_sk(sk);
+	struct page *page;
+	unsigned long index;
+
+	xa_for_each(&sk->sk_user_pages, index, page)
+		if (WARN_ON_ONCE(!napi_pp_put_page(page, false)))
+			page_pool_page_put_many(page, 1);
+
+	xa_destroy(&sk->sk_user_pages);
 
 	trace_tcp_destroy_sock(sk);
 
-- 
2.43.0.472.g3155946c3a-goog

