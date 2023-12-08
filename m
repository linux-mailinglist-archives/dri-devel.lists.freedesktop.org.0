Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F21458097BB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 01:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C3910E0BF;
	Fri,  8 Dec 2023 00:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16EC10E240
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 00:53:01 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-db5463707f9so2076336276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 16:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701996781; x=1702601581;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=V1r8ZXlyktFk/hR6LvKbeClNyv61T/bWHclepM8Rp88=;
 b=xE+vA0xsEiya5Hv1lkb6FxLYHecHQizhdwJyWa4YxBzkX4pZ5zDE8Dv0EtO9ZwrTma
 0MApmLRPsdAX5MKrWJpkEkc2oAwmDE8MZU2SRoiI+0wJI5DT67S84aiuDLUrCt9zp+IB
 vfQHv43j+m3Rem4cdnaRW6yd3AG667FxPwIScqa8C4pnR56Xadlmx9Hg4iRWsxvRoCr5
 yEXnyZoc7C7PBu1Qn8Vu6OgfXNgz4aebhDzV1s2TsvKZwpfbZVYfE4yFuoC0rCIkWbbI
 59o9NrAkPaW+/E0HZdCoqdT76nW52dBeAmTAzDabnAgTZNwwezz0+MRT1VKRl4+/2KW1
 QMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701996781; x=1702601581;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V1r8ZXlyktFk/hR6LvKbeClNyv61T/bWHclepM8Rp88=;
 b=U2Ag9/MrDJBz6yJ4qK4VO8PpjPPIYRY+sWXbAc6uqIYBESNKI/qzGSLUJo/ITwgH8K
 F5Ta67m/l96Fc4sbcOXafC7dJS6YUygxFBFcNwJSIzjvARJ+JsfSUHw7qWzDrHb3UCKc
 5nmnhg3Fq3YIsEuO48j5hNg2KSzDWffxMbIMglRMcbqvPt6Vfwvf1bJiIM9rPo41v9Kr
 XBlYATV+fqF00O66/c2EVow5I/O6ME1s1Vtce1T9102J0MpL8zr59UUpWKqRoxBhID4M
 8gYDZ1o6KXPfN3ZDKlcUCfccqmmxeMupzWomuGBgEegZ0Hvlh9hktJPGZ9qx+uYsa6JX
 1sgQ==
X-Gm-Message-State: AOJu0YwarUf+ziHddxkfQnLsLhyMDxbpsP2Iq2+qeYFuDAwRGsc9HUqm
 uMAUf5cafrhNCAK5YHOE38Ex2dD6PfKpAlTC2A==
X-Google-Smtp-Source: AGHT+IEj1VqfFnBiOaXdk3C7zQ8oyWSVZPqGPRw04iIGc/p6HTi+O3QytptJH8qJW9Cs/Vxkfvehw/gsxCl4ycls9Q==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:f1cf:c733:235b:9fff])
 (user=almasrymina job=sendgmr) by 2002:a25:cc4b:0:b0:db5:3bdf:ff55 with SMTP
 id l72-20020a25cc4b000000b00db53bdfff55mr39860ybf.6.1701996781080; Thu, 07
 Dec 2023 16:53:01 -0800 (PST)
Date: Thu,  7 Dec 2023 16:52:34 -0800
In-Reply-To: <20231208005250.2910004-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231208005250.2910004-4-almasrymina@google.com>
Subject: [net-next v1 03/16] queue_api: define queue api
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
 Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Yunsheng Lin <linyunsheng@huawei.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This API enables the net stack to reset the queues used for devmem.

Signed-off-by: Mina Almasry <almasrymina@google.com>

---
 include/linux/netdevice.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 1b935ee341b4..316f7dee86ce 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1432,6 +1432,20 @@ struct netdev_net_notifier {
  *			   struct kernel_hwtstamp_config *kernel_config,
  *			   struct netlink_ext_ack *extack);
  *	Change the hardware timestamping parameters for NIC device.
+ *
+ * void *(*ndo_queue_mem_alloc)(struct net_device *dev, int idx);
+ *	Allocate memory for an RX queue. The memory returned in the form of
+ *	a void * can be passed to ndo_queue_mem_free() for freeing or to
+ *	ndo_queue_start to create an RX queue with this memory.
+ *
+ * void	(*ndo_queue_mem_free)(struct net_device *dev, void *);
+ *	Free memory from an RX queue.
+ *
+ * int (*ndo_queue_start)(struct net_device *dev, int idx, void *);
+ *	Start an RX queue at the specified index.
+ *
+ * int (*ndo_queue_stop)(struct net_device *dev, int idx, void **);
+ *	Stop the RX queue at the specified index.
  */
 struct net_device_ops {
 	int			(*ndo_init)(struct net_device *dev);
@@ -1673,6 +1687,16 @@ struct net_device_ops {
 	int			(*ndo_hwtstamp_set)(struct net_device *dev,
 						    struct kernel_hwtstamp_config *kernel_config,
 						    struct netlink_ext_ack *extack);
+	void *			(*ndo_queue_mem_alloc)(struct net_device *dev,
+						       int idx);
+	void			(*ndo_queue_mem_free)(struct net_device *dev,
+						      void *queue_mem);
+	int			(*ndo_queue_start)(struct net_device *dev,
+						   int idx,
+						   void *queue_mem);
+	int			(*ndo_queue_stop)(struct net_device *dev,
+						  int idx,
+						  void **out_queue_mem);
 };
 
 /**
-- 
2.43.0.472.g3155946c3a-goog

