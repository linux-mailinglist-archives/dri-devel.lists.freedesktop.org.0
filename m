Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149DBCAB49B
	for <lists+dri-devel@lfdr.de>; Sun, 07 Dec 2025 13:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A8810E357;
	Sun,  7 Dec 2025 12:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ALhBBNJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9F410E358
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Dec 2025 12:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765111222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=/HKvmdPqRZHJ9/v9r83b5lWZWkfSL/6IdXrUhiE9JhQ=;
 b=ALhBBNJz+HUdIJUmaWhVGG+FuWjR9Q9506/yLTH4qWkeR38nNXo/vGF7cFMOf6TwOoH3LR
 sgDWMpgralPpsA0TBawx+5FdbEHcWhAbSz0862y532PlR+Z3DlDOw5utxinSc7+LBRutXr
 rD0Zd6RtvbXcu/8CHCxqioYGlSeB9bM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-628-lKGezg7JN4ahQWbzy3fjVQ-1; Sun,
 07 Dec 2025 07:40:18 -0500
X-MC-Unique: lKGezg7JN4ahQWbzy3fjVQ-1
X-Mimecast-MFC-AGG-ID: lKGezg7JN4ahQWbzy3fjVQ_1765111214
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 98FA018002EC; Sun,  7 Dec 2025 12:40:14 +0000 (UTC)
Received: from fedora (unknown [10.44.32.50])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP
 id 852F6180044F; Sun,  7 Dec 2025 12:40:04 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Sun,  7 Dec 2025 13:40:16 +0100 (CET)
Date: Sun, 7 Dec 2025 13:40:05 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH 6/7] RDMA/umem: don't abuse current->group_leader
Message-ID: <aTV1pbftBkH8n4kh@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTV1KYdcDGvjXHos@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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

Cleanup and preparation to simplify the next changes.

Use current->tgid instead of current->group_leader->pid.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 drivers/infiniband/core/umem_odp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/core/umem_odp.c b/drivers/infiniband/core/umem_odp.c
index 572a91a62a7b..32267258a19c 100644
--- a/drivers/infiniband/core/umem_odp.c
+++ b/drivers/infiniband/core/umem_odp.c
@@ -149,7 +149,7 @@ struct ib_umem_odp *ib_umem_odp_alloc_implicit(struct ib_device *device,
 	umem->owning_mm = current->mm;
 	umem_odp->page_shift = PAGE_SHIFT;
 
-	umem_odp->tgid = get_task_pid(current->group_leader, PIDTYPE_PID);
+	umem_odp->tgid = get_task_pid(current, PIDTYPE_TGID);
 	ib_init_umem_implicit_odp(umem_odp);
 	return umem_odp;
 }
@@ -258,7 +258,7 @@ struct ib_umem_odp *ib_umem_odp_get(struct ib_device *device,
 		umem_odp->page_shift = HPAGE_SHIFT;
 #endif
 
-	umem_odp->tgid = get_task_pid(current->group_leader, PIDTYPE_PID);
+	umem_odp->tgid = get_task_pid(current, PIDTYPE_TGID);
 	ret = ib_init_umem_odp(umem_odp, ops);
 	if (ret)
 		goto err_put_pid;
-- 
2.52.0

