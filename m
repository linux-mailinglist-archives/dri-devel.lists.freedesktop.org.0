Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B024F7E18C9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 03:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C06610E263;
	Mon,  6 Nov 2023 02:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE48610E0B5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 02:44:40 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-da03ef6fc30so4642917276.0
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Nov 2023 18:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699238680; x=1699843480;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=1z+RrI0uMm89Nr15H+saN0l/MmritlO+84MwMXJPNRo=;
 b=JyDVuzAelui93QOffV/Hcq9TglMFXh+eJIdvSI1yu5jFvoEp/QFnlaiS22pG+H4Qay
 4kpfYW1Z2/dfXkeBfVQ7d31kVw8KIscCekEh3+2/NeGmkzUT1DoYVgIeILEzAqP2YdS0
 P4+MGUujgqS+wcktSACWbbXyLy/XNJ9+auz37Ca5gCTG4G5tOajRVIShVf1+bi3U450c
 etrDoeHVDla8tNgcgK+NQizQGKKMIHlL9xe3Ay/E5Tr8+kZoDroBLizXNTRqrZOqCihK
 uWJMmFtHfQmiQCDKBCzfvSBzZV7ZB5GwrWSb1pPIWTX/S7K3XIlscoqDgEZbDQl7+JaR
 +7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699238680; x=1699843480;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1z+RrI0uMm89Nr15H+saN0l/MmritlO+84MwMXJPNRo=;
 b=KyE2ihJpcq4srr9a+RIqLDSA1yj72UoL+WrqiqqagmEtSoEBu3k5UcGWP/H7z3Wayu
 Bntlx977/G43fAbK/Mjft6xg0KSCxbrn+IchAAc5VV7yi4hx+7QCD3AIAlUwVO3lg3x9
 BL8eI5CgKGD7uS961EWrZ+FKW6Yvo7IPmuOISsgW/5ytdGsjIYg545og1NuXaRZwD4z5
 oIVzBb7NKWEKhaE+YOuB3QlVNv/Fi7hWcck5Mc3E0y0bgM8zq5kowicgyP+sO3ZFGCo+
 DnrieHDurX4hw2ZFA4Lu+MRgKUGXFwlr7XL8mCUsn+sa+RVEgxkbl/H/Dh/llOlNr2pp
 Cyww==
X-Gm-Message-State: AOJu0Ywf/sqbJ+yPRNafHvTagy1dTkI/P+jUpMdGwjf6vZbpy+NUkkuy
 LvclRq42DKNOGWCK3EV0P5Aww0rAgQIUaFmbHQ==
X-Google-Smtp-Source: AGHT+IHYvV3FnxqZNv9DZD2EwWhxpeGHUrzGBX9GcPxGYqzKiXM4EzwPj51HuZbQ3Xrr4pQ7WbaDuuYiCFHgEcsWXg==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:35de:fff:97b7:db3e])
 (user=almasrymina job=sendgmr) by 2002:a25:ca44:0:b0:d9a:e3d9:99bd with SMTP
 id a65-20020a25ca44000000b00d9ae3d999bdmr506979ybg.5.1699238679957; Sun, 05
 Nov 2023 18:44:39 -0800 (PST)
Date: Sun,  5 Nov 2023 18:44:09 -0800
In-Reply-To: <20231106024413.2801438-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231106024413.2801438-11-almasrymina@google.com>
Subject: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Willem de Bruijn <willemb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Shakeel Butt <shakeelb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>
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

RFC v3:
- Fixed issue with put_cmsg() failing silently.

---
 include/linux/socket.h            |   1 +
 include/net/page_pool/helpers.h   |   9 ++
 include/net/sock.h                |   2 +
 include/uapi/asm-generic/socket.h |   5 +
 include/uapi/linux/uio.h          |   6 +
 net/ipv4/tcp.c                    | 189 +++++++++++++++++++++++++++++-
 net/ipv4/tcp_ipv4.c               |   7 ++
 7 files changed, 214 insertions(+), 5 deletions(-)

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
index 08f1a2cc70d2..95f4d579cbc4 100644
--- a/include/net/page_pool/helpers.h
+++ b/include/net/page_pool/helpers.h
@@ -106,6 +106,15 @@ page_pool_iov_dma_addr(const struct page_pool_iov *ppiov)
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
index 242590308d64..986d9da6e062 100644
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
index 8ce8a39a1e5f..aacb97f16b78 100644
--- a/include/uapi/asm-generic/socket.h
+++ b/include/uapi/asm-generic/socket.h
@@ -135,6 +135,11 @@
 #define SO_PASSPIDFD		76
 #define SO_PEERPIDFD		77
 
+#define SO_DEVMEM_HEADER	98
+#define SCM_DEVMEM_HEADER	SO_DEVMEM_HEADER
+#define SO_DEVMEM_OFFSET	99
+#define SCM_DEVMEM_OFFSET	SO_DEVMEM_OFFSET
+
 #if !defined(__KERNEL__)
 
 #if __BITS_PER_LONG == 64 || (defined(__x86_64__) && defined(__ILP32__))
diff --git a/include/uapi/linux/uio.h b/include/uapi/linux/uio.h
index 059b1a9147f4..ae94763b1963 100644
--- a/include/uapi/linux/uio.h
+++ b/include/uapi/linux/uio.h
@@ -20,6 +20,12 @@ struct iovec
 	__kernel_size_t iov_len; /* Must be size_t (1003.1g) */
 };
 
+struct cmsg_devmem {
+	__u64 frag_offset;
+	__u32 frag_size;
+	__u32 frag_token;
+};
+
 /*
  *	UIO_MAXIOV shall be at least 16 1003.1g (5.4.1.1)
  */
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 5c6fed52ed0e..fd7f6d7e7671 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -461,6 +461,7 @@ void tcp_init_sock(struct sock *sk)
 
 	set_bit(SOCK_SUPPORT_ZC, &sk->sk_socket->flags);
 	sk_sockets_allocated_inc(sk);
+	xa_init_flags(&sk->sk_user_pages, XA_FLAGS_ALLOC1);
 }
 EXPORT_SYMBOL(tcp_init_sock);
 
@@ -2301,6 +2302,154 @@ static int tcp_inq_hint(struct sock *sk)
 	return inq;
 }
 
+/* On error, returns the -errno. On success, returns number of bytes sent to the
+ * user. May not consume all of @remaining_len.
+ */
+static int tcp_recvmsg_devmem(const struct sock *sk, const struct sk_buff *skb,
+			      unsigned int offset, struct msghdr *msg,
+			      int remaining_len)
+{
+	struct cmsg_devmem cmsg_devmem = { 0 };
+	unsigned int start;
+	int i, copy, n;
+	int sent = 0;
+	int err = 0;
+
+	do {
+		start = skb_headlen(skb);
+
+		if (!skb_frags_not_readable(skb)) {
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
+			/* First a cmsg_devmem for # bytes copied to user
+			 * buffer.
+			 */
+			memset(&cmsg_devmem, 0, sizeof(cmsg_devmem));
+			cmsg_devmem.frag_size = copy;
+			err = put_cmsg(msg, SOL_SOCKET, SO_DEVMEM_HEADER,
+				       sizeof(cmsg_devmem), &cmsg_devmem);
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
+		/* after that, send information of devmem pages through a
+		 * sequence of cmsg
+		 */
+		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
+			const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
+			struct page_pool_iov *ppiov;
+			u64 frag_offset;
+			u32 user_token;
+			int end;
+
+			/* skb_frags_not_readable() should indicate that ALL the
+			 * frags in this skb are unreadable page_pool_iovs.
+			 * We're checking for that flag above, but also check
+			 * individual pages here. If the tcp stack is not
+			 * setting skb->devmem correctly, we still don't want to
+			 * crash here when accessing pgmap or priv below.
+			 */
+			if (!skb_frag_page_pool_iov(frag)) {
+				net_err_ratelimited("Found non-devmem skb with page_pool_iov");
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
+				cmsg_devmem.frag_offset = frag_offset;
+				cmsg_devmem.frag_size = copy;
+				err = xa_alloc((struct xarray *)&sk->sk_user_pages,
+					       &user_token, frag->bv_page,
+					       xa_limit_31b, GFP_KERNEL);
+				if (err)
+					goto out;
+
+				cmsg_devmem.frag_token = user_token;
+
+				offset += copy;
+				remaining_len -= copy;
+
+				err = put_cmsg(msg, SOL_SOCKET,
+					       SO_DEVMEM_OFFSET,
+					       sizeof(cmsg_devmem),
+					       &cmsg_devmem);
+				if (err || msg->msg_flags & MSG_CTRUNC) {
+					msg->msg_flags &= ~MSG_CTRUNC;
+					xa_erase((struct xarray *)&sk->sk_user_pages,
+						 user_token);
+					if (!err)
+						err = -ETOOSMALL;
+					goto out;
+				}
+
+				page_pool_iov_get_many(ppiov, 1);
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
@@ -2314,6 +2463,7 @@ static int tcp_recvmsg_locked(struct sock *sk, struct msghdr *msg, size_t len,
 			      int *cmsg_flags)
 {
 	struct tcp_sock *tp = tcp_sk(sk);
+	int last_copied_devmem = -1; /* uninitialized */
 	int copied = 0;
 	u32 peek_seq;
 	u32 *seq;
@@ -2491,15 +2641,44 @@ static int tcp_recvmsg_locked(struct sock *sk, struct msghdr *msg, size_t len,
 		}
 
 		if (!(flags & MSG_TRUNC)) {
-			err = skb_copy_datagram_msg(skb, offset, msg, used);
-			if (err) {
-				/* Exception. Bailout! */
-				if (!copied)
-					copied = -EFAULT;
+			if (last_copied_devmem != -1 &&
+			    last_copied_devmem != skb->devmem)
 				break;
+
+			if (!skb->devmem) {
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
+					/* skb->devmem skbs can only be received
+					 * with the MSG_SOCK_DEVMEM flag.
+					 */
+					if (!copied)
+						copied = -EFAULT;
+
+					break;
+				}
+
+				err = tcp_recvmsg_devmem(sk, skb, offset, msg,
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
 
+		last_copied_devmem = skb->devmem;
+
 		WRITE_ONCE(*seq, *seq + used);
 		copied += used;
 		len -= used;
diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index 7583d4e34c8c..4cc8be892f05 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -2299,6 +2299,13 @@ static int tcp_v4_init_sock(struct sock *sk)
 void tcp_v4_destroy_sock(struct sock *sk)
 {
 	struct tcp_sock *tp = tcp_sk(sk);
+	struct page *page;
+	unsigned long index;
+
+	xa_for_each(&sk->sk_user_pages, index, page)
+		page_pool_page_put_many(page, 1);
+
+	xa_destroy(&sk->sk_user_pages);
 
 	trace_tcp_destroy_sock(sk);
 
-- 
2.42.0.869.gea05f2083d-goog

