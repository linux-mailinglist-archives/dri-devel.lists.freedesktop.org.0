Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD084776DC1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 03:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED47110E49C;
	Thu, 10 Aug 2023 01:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC8410E49C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 01:58:28 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d47d125f5afso419235276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 18:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691632707; x=1692237507;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=/4QeO+pagKrTYOIfbZJRrXpwc/dNI+RJG2rrrCnM7Sk=;
 b=QOGVvS1pbyhBQujGmuVNxv+/RrIDY5iWys+aLMNejmgkPzbwbsQ39t7Ryf0s6uiGEV
 +XJsoLagljlLbHu4+IIsQZcLz/1h0S2ktpRk8BFOpe0tHuX0RzFFrJGBfqeL1uu9Fw5m
 o1xkhCmM8JO7BW4LqDZ9cRQT2LS10ZCbkFc7bTRUF/S6uJwdTsIKQ8YjP+1edPCNHEJB
 VKLNg7O/tdQ+pZiMw2WQOueY3Pw9UjkUhegULxMkoAeutnNdrTGl3v7afyzgTxi1nkwD
 3ASZcw5xdSozHd1Hh/yUiZqUPrFO+yrdEoAFiaPgkznP4h/24CK+RZ9Xypyq2g/k0hFm
 hdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691632707; x=1692237507;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/4QeO+pagKrTYOIfbZJRrXpwc/dNI+RJG2rrrCnM7Sk=;
 b=FSrpgWvxnBiaSy7MWVvT7dD4tafQ6OS85Jg50OrzoLB0u/pZgwcAfpVHsb3OvCTduA
 VyvXBHxeadNPWVeQUYvJIb8FlWRd0IHF2raR/48CI2WQeHHevnbnTdI6E3cpEEbxgOY2
 xlMoSXmyIK7J/+VDWnfzAWyqE+1WJss43PmNlDKN3/4LN+LnHGUMyN8J4UU/v4LeCvLb
 xSgFs7pFNPf7z0xq7eXU87YKdIQx7gwKfgyM2jnWbGr1imzcrXzQY+hZL1N4P3XNF0Ss
 DdxZpriqg+ms5OaRFXUfFaBWvrP5NOxVKev40gK8CHqX5kgEcfw5XSRZAB2yItn/r4OI
 aI8A==
X-Gm-Message-State: AOJu0YzRJRN8vwaDhTfJk1D0rYD4um10RUTotDS3zs9Hgui7SPF3B2dn
 wAicLUYOyckUi8gdY4i5Uz1rRhe2leFYoHKTGw==
X-Google-Smtp-Source: AGHT+IG6tqnzv0CWLPyFfi6YUDF997bmI60WCtTuPYwi+ZupJbatUqvnXIgWHRoDy1fJOcPQx7Y9AftVpScO5FVfEQ==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:73ad:9ed5:e067:2b9b])
 (user=almasrymina job=sendgmr) by 2002:a25:a2c4:0:b0:d62:e781:5f02 with SMTP
 id c4-20020a25a2c4000000b00d62e7815f02mr17141ybn.13.1691632707331; Wed, 09
 Aug 2023 18:58:27 -0700 (PDT)
Date: Wed,  9 Aug 2023 18:57:46 -0700
In-Reply-To: <20230810015751.3297321-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230810015751.3297321-11-almasrymina@google.com>
Subject: [RFC PATCH v2 10/11] net: add SO_DEVMEM_DONTNEED setsockopt to
 release RX pages
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
 Kaiyuan Zhang <kaiyuanz@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Willem de Bruijn <willemb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 stephen@networkplumber.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, sdf@google.com,
 Andy Lutomirski <luto@kernel.org>, Hari Ramakrishnan <rharix@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an interface for the user to notify the kernel that it is done
reading the NET_RX dmabuf pages returned as cmsg. The kernel will
drop the reference on the NET_RX pages to make them available for
re-use.

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 include/uapi/asm-generic/socket.h |  1 +
 include/uapi/linux/uio.h          |  4 ++++
 net/core/sock.c                   | 36 +++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/include/uapi/asm-generic/socket.h b/include/uapi/asm-generic/socket.h
index aacb97f16b78..eb93b43394d4 100644
--- a/include/uapi/asm-generic/socket.h
+++ b/include/uapi/asm-generic/socket.h
@@ -135,6 +135,7 @@
 #define SO_PASSPIDFD		76
 #define SO_PEERPIDFD		77
 
+#define SO_DEVMEM_DONTNEED	97
 #define SO_DEVMEM_HEADER	98
 #define SCM_DEVMEM_HEADER	SO_DEVMEM_HEADER
 #define SO_DEVMEM_OFFSET	99
diff --git a/include/uapi/linux/uio.h b/include/uapi/linux/uio.h
index ae94763b1963..71314bf41590 100644
--- a/include/uapi/linux/uio.h
+++ b/include/uapi/linux/uio.h
@@ -26,6 +26,10 @@ struct cmsg_devmem {
 	__u32 frag_token;
 };
 
+struct devmemtoken {
+	__u32 token_start;
+	__u32 token_count;
+};
 /*
  *	UIO_MAXIOV shall be at least 16 1003.1g (5.4.1.1)
  */
diff --git a/net/core/sock.c b/net/core/sock.c
index ab1e8d1bd5a1..2736b770a399 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -1049,6 +1049,39 @@ static int sock_reserve_memory(struct sock *sk, int bytes)
 	return 0;
 }
 
+static noinline_for_stack int
+sock_devmem_dontneed(struct sock *sk, sockptr_t optval, unsigned int optlen)
+{
+	struct devmemtoken tokens[128];
+	unsigned int num_tokens, i, j;
+	int ret;
+
+	if (sk->sk_type != SOCK_STREAM || sk->sk_protocol != IPPROTO_TCP)
+		return -EBADF;
+
+	if (optlen % sizeof(struct devmemtoken) || optlen > sizeof(tokens))
+		return -EINVAL;
+
+	num_tokens = optlen / sizeof(struct devmemtoken);
+	if (copy_from_sockptr(tokens, optval, optlen))
+		return -EFAULT;
+
+	ret = 0;
+	for (i = 0; i < num_tokens; i++) {
+		for (j = 0; j < tokens[i].token_count; j++) {
+			struct page *page = xa_erase(&sk->sk_user_pages,
+						     tokens[i].token_start + j);
+
+			if (page) {
+				page_pool_page_put_many(page, 1);
+				ret++;
+			}
+		}
+	}
+
+	return ret;
+}
+
 void sockopt_lock_sock(struct sock *sk)
 {
 	/* When current->bpf_ctx is set, the setsockopt is called from
@@ -1528,6 +1561,9 @@ int sk_setsockopt(struct sock *sk, int level, int optname,
 		WRITE_ONCE(sk->sk_txrehash, (u8)val);
 		break;
 
+	case SO_DEVMEM_DONTNEED:
+		ret = sock_devmem_dontneed(sk, optval, optlen);
+		break;
 	default:
 		ret = -ENOPROTOOPT;
 		break;
-- 
2.41.0.640.ga95def55d0-goog

