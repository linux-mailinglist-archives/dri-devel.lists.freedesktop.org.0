Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143E593A02E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 13:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B533510E588;
	Tue, 23 Jul 2024 11:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="V9NIuU0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94CE10E581
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 11:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721735368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2ZZ7xf/f12+Tr6LA6vgO8m70M0xzWtORCsg5GqY5FWM=;
 b=V9NIuU0GjgVQc8bh3z1slKWDtXlBZMczataOr0UU9BQbff9TaSSCaoJ/K57ne2j4v58fwM
 T7mZ5cIiJGhRThkvhFK87EXIsOYE98+n4LqEUCeRcOpXHEVk9pLJondaJX0Y05HroGpwE6
 qZ35Wh9mfZhozd/DZsuUSdjKS4GE564=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-539-lzkINb5QNrO5cKrvekHW6Q-1; Tue,
 23 Jul 2024 07:49:22 -0400
X-MC-Unique: lzkINb5QNrO5cKrvekHW6Q-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4387D19560B6; Tue, 23 Jul 2024 11:49:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.104])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AC9FB1955D45; Tue, 23 Jul 2024 11:49:15 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: gurchetansingh@chromium.org, tzimmermann@suse.de, mripard@kernel.org,
 olvaffe@gmail.com, kraxel@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@redhat.com
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Sergio Lopez <slp@redhat.com>
Subject: [PATCH 0/2] drm/virtio: introduce the HOST_PAGE_SIZE feature
Date: Tue, 23 Jul 2024 07:49:12 -0400
Message-ID: <20240723114914.53677-1-slp@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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

There's an incresing number of machines supporting multiple page sizes
and on these machines the host and a guest can be running, each one,
with a different page size.

For what pertains to virtio-gpu, this is not a problem if the page size
of the guest happens to be bigger or equal than the host, but will
potentially lead to failures in memory allocations and/or mappings
otherwise.

To improve this situation, we introduce here the HOST_PAGE_SIZE feature.
This feature indicates that the host has an extended virtio_gpu_config
structure that include it's own page size a new field.

On the second commit, we also add a new param that can be read with
VIRTGPU_GETPARAM by userspace applications running in the guest to
obtain the host's page size and find out the right alignment to be used
in shared memory allocations.

Sergio Lopez (2):
  drm/virtio: introduce the HOST_PAGE_SIZE feature
  drm/virtio: add VIRTGPU_PARAM_HOST_PAGE_SIZE to params

 drivers/gpu/drm/virtio/virtgpu_drv.c   |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 ++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c |  5 +++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   | 13 ++++++++++---
 include/uapi/drm/virtgpu_drm.h         |  1 +
 include/uapi/linux/virtio_gpu.h        |  5 +++++
 6 files changed, 24 insertions(+), 3 deletions(-)

-- 
2.45.2

