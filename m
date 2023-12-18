Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E66817BFD
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 21:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7CD10E0B7;
	Mon, 18 Dec 2023 20:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f202.google.com (mail-oi1-f202.google.com
 [209.85.167.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0C310E0B7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 20:32:52 +0000 (UTC)
Received: by mail-oi1-f202.google.com with SMTP id
 5614622812f47-3ba3e8f9f00so4745580b6e.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 12:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702931571; x=1703536371;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=NsLvXzxzNOPiHQjobkRux+OpGRSNf4fEva+dH69h4SM=;
 b=wXv2M/MlPsMnJrah1QC6fs86smW0rWHUYR9chPE/TnKSb6J7QCSZyrW4ozqGRtyKQP
 caErCw8jtMS5rtLtaAjpWWW+9b9d4zWI4ILAn4zVY1OuwcJQUOKMtxGoseT/TLwfSYY/
 cDrRVSwwd4YLTXjycW5bkNmGEO7w2sS25+MiAP+9TadRwv8MQCeEEWjQ1ZsP4zKSDl5y
 fVB3OTQf1BZlRHY77TUQaQf1B7tnF+tgFGp3FRmVzGmVYdtr4+/Hb0cmKQ01i4n++v0q
 lg9ebdjBgIxibBzJ/o6HNlstVOSPnaFhL7fEGtnQURkfnYXdTdNtuLEB1wOawG8yma+5
 CVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702931571; x=1703536371;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NsLvXzxzNOPiHQjobkRux+OpGRSNf4fEva+dH69h4SM=;
 b=a2yR0sTGhOs/0B2LVdOSWwhC1wiMLBTitzTdOTtClEmSEnYMLzhYHX0/YmKR2GPbDQ
 D9wIDxY7DIgZAVd9BPJMEN+TqA0t7tOq8Slaum1ZbcyN+/jwD1l4o3ckRU205LxhqZkD
 zsHW4IgEFaW4NYOx6Nydcp5BKfYr4dHd7ULcMCy7Fa9Hh80+cnkkb1/LDSBE0WNNuEni
 Fp7fe7P5JzxUOZLuBgZe+xOYkUYNzSpiDFrWxSMlvzp+q/8/+fAlQzJXi7jQ2ULT2b41
 jO3AaL6teX/xUSOna0CJSDs4ovA1JgLFDPVOdVM6se68Dom8ipihjbJVkgYGdoCYAAK5
 fcPg==
X-Gm-Message-State: AOJu0YyRJ2vX9fR7SnmWK0ZtcWTbe7tPAvSImEwRLGGp5qc01Tcgnt2h
 +fRran2iyJZHoPRTCFMhpjL06bP6TMCz0vLicw==
X-Google-Smtp-Source: AGHT+IG5vRL6o84xZOZynwxVR30JpLfb7QzBlhG5Dw747riDkw0kZl3ZpSAoeSmDdw4XQ51gEnvSWAPT1/x+CoyNww==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:5cbf:3534:fb34:758e])
 (user=almasrymina job=sendgmr) by 2002:a05:690c:b1d:b0:5d8:394d:a8f4 with
 SMTP id cj29-20020a05690c0b1d00b005d8394da8f4mr1615182ywb.10.1702867254746;
 Sun, 17 Dec 2023 18:40:54 -0800 (PST)
Date: Sun, 17 Dec 2023 18:40:19 -0800
In-Reply-To: <20231218024024.3516870-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231218024024.3516870-1-almasrymina@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231218024024.3516870-13-almasrymina@google.com>
Subject: [RFC PATCH net-next v5 12/14] net: add SO_DEVMEM_DONTNEED setsockopt
 to release RX frags
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
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
 Willem de Bruijn <willemb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, David Wei <dw@davidwei.uk>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Shakeel Butt <shakeelb@google.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an interface for the user to notify the kernel that it is done
reading the devmem dmabuf frags returned as cmsg. The kernel will
drop the reference on the frags to make them available for re-use.

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

Changes in v1:
- devmemtoken -> dmabuf_token (David).
- Use napi_pp_put_page() for refcounting (Yunsheng).
- Fix build error with missing socket options on other asms.

---
 arch/alpha/include/uapi/asm/socket.h  |  8 ++++-
 arch/mips/include/uapi/asm/socket.h   |  6 ++++
 arch/parisc/include/uapi/asm/socket.h |  6 ++++
 arch/sparc/include/uapi/asm/socket.h  |  6 ++++
 include/uapi/asm-generic/socket.h     |  1 +
 include/uapi/linux/uio.h              |  4 +++
 net/core/sock.c                       | 45 +++++++++++++++++++++++++++
 7 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/uapi/asm/socket.h b/arch/alpha/include/uapi/asm/socket.h
index e94f621903fe..00146c243037 100644
--- a/arch/alpha/include/uapi/asm/socket.h
+++ b/arch/alpha/include/uapi/asm/socket.h
@@ -10,7 +10,7 @@
  * Note: we only bother about making the SOL_SOCKET options
  * same as OSF/1, as that's all that "normal" programs are
  * likely to set.  We don't necessarily want to be binary
- * compatible with _everything_. 
+ * compatible with _everything_.
  */
 #define SOL_SOCKET	0xffff
 
@@ -140,6 +140,12 @@
 #define SO_PASSPIDFD		76
 #define SO_PEERPIDFD		77
 
+#define SO_DEVMEM_DONTNEED	78
+#define SO_DEVMEM_LINEAR	79
+#define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
+#define SO_DEVMEM_DMABUF	80
+#define SCM_DEVMEM_DMABUF	SO_DEVMEM_DMABUF
+
 #if !defined(__KERNEL__)
 
 #if __BITS_PER_LONG == 64
diff --git a/arch/mips/include/uapi/asm/socket.h b/arch/mips/include/uapi/asm/socket.h
index 60ebaed28a4c..9a71ee8f36db 100644
--- a/arch/mips/include/uapi/asm/socket.h
+++ b/arch/mips/include/uapi/asm/socket.h
@@ -151,6 +151,12 @@
 #define SO_PASSPIDFD		76
 #define SO_PEERPIDFD		77
 
+#define SO_DEVMEM_DONTNEED	78
+#define SO_DEVMEM_LINEAR	79
+#define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
+#define SO_DEVMEM_DMABUF	80
+#define SCM_DEVMEM_DMABUF	SO_DEVMEM_DMABUF
+
 #if !defined(__KERNEL__)
 
 #if __BITS_PER_LONG == 64
diff --git a/arch/parisc/include/uapi/asm/socket.h b/arch/parisc/include/uapi/asm/socket.h
index be264c2b1a11..6b8674399363 100644
--- a/arch/parisc/include/uapi/asm/socket.h
+++ b/arch/parisc/include/uapi/asm/socket.h
@@ -132,6 +132,12 @@
 #define SO_PASSPIDFD		0x404A
 #define SO_PEERPIDFD		0x404B
 
+#define SO_DEVMEM_DONTNEED	0x404C
+#define SO_DEVMEM_LINEAR	0x404D
+#define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
+#define SO_DEVMEM_DMABUF	0x404E
+#define SCM_DEVMEM_DMABUF	SO_DEVMEM_DMABUF
+
 #if !defined(__KERNEL__)
 
 #if __BITS_PER_LONG == 64
diff --git a/arch/sparc/include/uapi/asm/socket.h b/arch/sparc/include/uapi/asm/socket.h
index 682da3714686..ecfc8bfa9fe0 100644
--- a/arch/sparc/include/uapi/asm/socket.h
+++ b/arch/sparc/include/uapi/asm/socket.h
@@ -133,6 +133,12 @@
 #define SO_PASSPIDFD             0x0055
 #define SO_PEERPIDFD             0x0056
 
+#define SO_DEVMEM_DONTNEED       0x0057
+#define SO_DEVMEM_LINEAR         0x0058
+#define SCM_DEVMEM_LINEAR        SO_DEVMEM_LINEAR
+#define SO_DEVMEM_DMABUF         0x0059
+#define SCM_DEVMEM_DMABUF        SO_DEVMEM_DMABUF
+
 #if !defined(__KERNEL__)
 
 
diff --git a/include/uapi/asm-generic/socket.h b/include/uapi/asm-generic/socket.h
index 25a2f5255f52..1acb77780f10 100644
--- a/include/uapi/asm-generic/socket.h
+++ b/include/uapi/asm-generic/socket.h
@@ -135,6 +135,7 @@
 #define SO_PASSPIDFD		76
 #define SO_PEERPIDFD		77
 
+#define SO_DEVMEM_DONTNEED	97
 #define SO_DEVMEM_LINEAR	98
 #define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
 #define SO_DEVMEM_DMABUF	99
diff --git a/include/uapi/linux/uio.h b/include/uapi/linux/uio.h
index ad92e37699da..65f33178a601 100644
--- a/include/uapi/linux/uio.h
+++ b/include/uapi/linux/uio.h
@@ -30,6 +30,10 @@ struct dmabuf_cmsg {
 	__u32  dmabuf_id;	/* dmabuf id this frag belongs to. */
 };
 
+struct dmabuf_token {
+	__u32 token_start;
+	__u32 token_count;
+};
 /*
  *	UIO_MAXIOV shall be at least 16 1003.1g (5.4.1.1)
  */
diff --git a/net/core/sock.c b/net/core/sock.c
index 446e945f736b..77497dbb9022 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -1047,6 +1047,46 @@ static int sock_reserve_memory(struct sock *sk, int bytes)
 	return 0;
 }
 
+#ifdef CONFIG_PAGE_POOL
+static noinline_for_stack int
+sock_devmem_dontneed(struct sock *sk, sockptr_t optval, unsigned int optlen)
+{
+	unsigned int num_tokens, i, j;
+	struct dmabuf_token *tokens;
+	int ret;
+
+	if (sk->sk_type != SOCK_STREAM || sk->sk_protocol != IPPROTO_TCP)
+		return -EBADF;
+
+	if (optlen % sizeof(struct dmabuf_token) || optlen > sizeof(*tokens) * 128)
+		return -EINVAL;
+
+	tokens = kvmalloc_array(128, sizeof(*tokens), GFP_KERNEL);
+	if (!tokens)
+		return -ENOMEM;
+
+	num_tokens = optlen / sizeof(struct dmabuf_token);
+	if (copy_from_sockptr(tokens, optval, optlen))
+		return -EFAULT;
+
+	ret = 0;
+	for (i = 0; i < num_tokens; i++) {
+		for (j = 0; j < tokens[i].token_count; j++) {
+			struct netmem *netmem = xa_erase(&sk->sk_user_frags,
+						     tokens[i].token_start + j);
+
+			if (netmem && !WARN_ON_ONCE(!netmem_is_net_iov(netmem))) {
+				WARN_ON_ONCE(!napi_pp_put_page(netmem, false));
+				ret++;
+			}
+		}
+	}
+
+	kvfree(tokens);
+	return ret;
+}
+#endif
+
 void sockopt_lock_sock(struct sock *sk)
 {
 	/* When current->bpf_ctx is set, the setsockopt is called from
@@ -1534,6 +1574,11 @@ int sk_setsockopt(struct sock *sk, int level, int optname,
 		break;
 	}
 
+#ifdef CONFIG_PAGE_POOL
+	case SO_DEVMEM_DONTNEED:
+		ret = sock_devmem_dontneed(sk, optval, optlen);
+		break;
+#endif
 	default:
 		ret = -ENOPROTOOPT;
 		break;
-- 
2.43.0.472.g3155946c3a-goog

