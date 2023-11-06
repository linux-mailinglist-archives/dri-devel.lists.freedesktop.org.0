Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 782A57E18CD
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 03:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2382F10E0B5;
	Mon,  6 Nov 2023 02:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0142D10E263
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 02:44:42 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5a8d9dcdd2bso81252187b3.2
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Nov 2023 18:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699238682; x=1699843482;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZeiiEJbRtsTNAyw99p8ZCn3Vjnqo19hTPl7OEJ2oi/s=;
 b=wfvb0D7SkhOsslYQ6pzZtgXmsfNv/TkESwLW5QZfO6+/YUub3BQwRqhstGGHo5Qh7j
 iEJIrvVho0UgVRV4TZJ0fLzcObVcTWJozEd0nKDum+dFxJDzAfNDuUr0RAa9WBEBh+3S
 1Csl8Hcf9eAguvlDuMa+uMA5BY+fRi/H+d7Ydd+eVo5aKxJlypPNsUWIYUl0I5ltM2Cn
 YqzECp0gSSVigkTJbQv8K43zuR8keherVcLp1+bZ4kX4qx9qAlyN9zIJPj8teE1wN4zo
 QCjUH/iqGQDi6L7vAKAtGFNZnaUVuBusCruPFtcer0nbgwK3LRe2IvQ7QnreQsS41izZ
 KlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699238682; x=1699843482;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZeiiEJbRtsTNAyw99p8ZCn3Vjnqo19hTPl7OEJ2oi/s=;
 b=eURshGypE/KUbApNBW73kUXlOOTvr/nay/By6BjtSsFacOLE5mRrvjfiTdd1IAlsIL
 lYshkQCDZ0CAxowGh0/ztbRZbodLO1F2YuxPGZTp9xvdbPM0v5ycM8LytF8k8/EKs8C8
 UL0+5iotaAcaqplkDFwZhYGrkpzvEw75Xml0iYtLrso6bVzJ1g9bhcOObwALEaGfL9kI
 6F8/2RBTcIaQdO1nEhhgOmlA2w9cib+pPgEB6og+up/I+CSIudEnOxjmpA/GUiJUYPqS
 VjlzQhFUjl7liYPP3XurTbYt3ku9XycIyjmswGJFKtz/R7fKmffy+2U8Ut2YBU0YRyPV
 n5Yg==
X-Gm-Message-State: AOJu0Yz7ns8vz332zRDcoeGmGqzn4pXOAQHbufMFHQ2y5kXqW8VLSnY2
 ByGzTQ+n2KgZ2xOxXY8M6Aks6W/HY27ve2LcUg==
X-Google-Smtp-Source: AGHT+IGXB1Wk5WKMXZr8HTN6imbMYrfy8ASdQjy/ozkx0p4xonXE7b4iNBr/Mhu3s45eIhJrmpU89xDxoCb7QfNOog==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:35de:fff:97b7:db3e])
 (user=almasrymina job=sendgmr) by 2002:a25:828d:0:b0:d9a:4421:6ec5 with SMTP
 id r13-20020a25828d000000b00d9a44216ec5mr537997ybk.3.1699238682207; Sun, 05
 Nov 2023 18:44:42 -0800 (PST)
Date: Sun,  5 Nov 2023 18:44:10 -0800
In-Reply-To: <20231106024413.2801438-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231106024413.2801438-12-almasrymina@google.com>
Subject: [RFC PATCH v3 11/12] net: add SO_DEVMEM_DONTNEED setsockopt to
 release RX pages
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
index 1d28e3e87970..4ddc6b11d915 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -1051,6 +1051,39 @@ static int sock_reserve_memory(struct sock *sk, int bytes)
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
@@ -1538,6 +1571,9 @@ int sk_setsockopt(struct sock *sk, int level, int optname,
 		break;
 	}
 
+	case SO_DEVMEM_DONTNEED:
+		ret = sock_devmem_dontneed(sk, optval, optlen);
+		break;
 	default:
 		ret = -ENOPROTOOPT;
 		break;
-- 
2.42.0.869.gea05f2083d-goog

