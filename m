Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A7BCAB486
	for <lists+dri-devel@lfdr.de>; Sun, 07 Dec 2025 13:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A3410E032;
	Sun,  7 Dec 2025 12:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cuWmninz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3423A10E032
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Dec 2025 12:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765111189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=GspPLneNRfjxjLHV+P4c99mYW0S2jOEzAxTTs5yzofc=;
 b=cuWmninzmLG5YrYmI5LT6gnI84te8kZ+UbW5j5ErKP7KtlwV4ItPDnWYee1v++IQApg7hv
 YgChdai7byHjIRc5sEkqjLZrqzG3zmmtZKPacwLmkVMq3jFMPRVKHPjGk0+i/7Ef11gPFW
 kexWvgX/ihKDnWGxtNtxS65PtN+eQ/A=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-314-4yRwVArNN0eXDh1QrB5yKA-1; Sun,
 07 Dec 2025 07:39:42 -0500
X-MC-Unique: 4yRwVArNN0eXDh1QrB5yKA-1
X-Mimecast-MFC-AGG-ID: 4yRwVArNN0eXDh1QrB5yKA_1765111179
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 74B3E18001C6; Sun,  7 Dec 2025 12:39:38 +0000 (UTC)
Received: from fedora (unknown [10.44.32.50])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP
 id 48A00180044F; Sun,  7 Dec 2025 12:39:27 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Sun,  7 Dec 2025 13:39:40 +0100 (CET)
Date: Sun, 7 Dec 2025 13:39:28 +0100
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
Subject: [PATCH 3/7] drm/amdgpu: don't abuse current->group_leader
Message-ID: <aTV1gPQ84Q9fZ2cy@redhat.com>
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

- Use current->tgid instead of current->group_leader->pid

- Use get_task_pid(current, PIDTYPE_TGID) instead of
  get_task_pid(current->group_leader, PIDTYPE_PID)

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index b1c24c8fa686..df22b54ba346 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1421,7 +1421,7 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 			goto create_evict_fence_fail;
 		}
 
-		info->pid = get_task_pid(current->group_leader, PIDTYPE_PID);
+		info->pid = get_task_pid(current, PIDTYPE_TGID);
 		INIT_DELAYED_WORK(&info->restore_userptr_work,
 				  amdgpu_amdkfd_restore_userptr_worker);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index a67285118c37..a0f8ba382b9e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2554,7 +2554,7 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
 	if (current->group_leader->mm != current->mm)
 		return;
 
-	vm->task_info->tgid = current->group_leader->pid;
+	vm->task_info->tgid = current->tgid;
 	get_task_comm(vm->task_info->process_name, current->group_leader);
 }
 
-- 
2.52.0

