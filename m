Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHV6DF2uqmluVQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 11:37:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B99D21EDEE
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 11:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A890810ECCA;
	Fri,  6 Mar 2026 10:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WoTkBhZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF6410ECCA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 10:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772793431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CNok9dmrehJj085xLfY0Qs/d7XMY0KJw2lUvqcVr7uo=;
 b=WoTkBhZBelYn4qeju9Uyfw2oC7UTqp0UAlI3RrsTnVtKj3NgPFbxiXcAIWJd7aKzmTfF6P
 xzdSZCAkrcnms72dzAAUyZiJn3gZJHOURHghL/NuTrWpVy31c/S8MCyc5R1ofB9sTA0y6r
 QLLtkMwiGk7AvGwPKanIUwZFRqTeMi8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-96-fZ85QXqmMvy5WsYgpsd6pQ-1; Fri,
 06 Mar 2026 05:37:08 -0500
X-MC-Unique: fZ85QXqmMvy5WsYgpsd6pQ-1
X-Mimecast-MFC-AGG-ID: fZ85QXqmMvy5WsYgpsd6pQ_1772793425
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6B9FC1956089; Fri,  6 Mar 2026 10:37:05 +0000 (UTC)
Received: from [192.168.1.153] (unknown [10.45.226.103])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 38DB11800576; Fri,  6 Mar 2026 10:36:57 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v3 0/6] dma-buf: heaps: add coherent reserved-memory heap
Date: Fri, 06 Mar 2026 11:36:31 +0100
Message-Id: <20260306-b4-dmabuf-heap-coherent-rmem-v3-0-3d00d36c9bc4@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOTQ7CIBCG4as0rB1DhxatK+9hXFAYhEV/ApVom
 t5d2sQYN7p8Z/F8M7NIwVNkp2JmgZKPfuhziF3BtFP9jcCb3Aw5So4ooK3AdKq9W3CkRtCDo0D
 9BKGjDprSGtGgVJYalokxkPWPjb9cczsfpyE8t7VUrtc3XP2GUwklGGvJVgKbo9LnQMapaa+Hj
 q1ywo8m+J83EwIHWatK1qIV4nD80pZleQFHSBIuFwEAAA==
X-Change-ID: 20260223-b4-dmabuf-heap-coherent-rmem-91fd3926afe9
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, mripard@redhat.com, echanude@redhat.com, 
 John Stultz <john.stultz@linaro.org>, Maxime Ripard <mripard@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772793417; l=4098;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=ExZnC7goEKWKM6Rtl+U4JqZvVGyaRn8TBOjYWQsS5l0=;
 b=UNGgoXKmH542rSOqPbjXTgBDaWRdkdTQo0EoW9KZ1vE/PiAG6Zcb1qM/GgwOycyhucLQJuOwG
 Mtb4/HsYkEWDLTZxjMPx0QbPMjLBfxdVBdXHDeL+WLZ6QFhoR4GGmXF
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: qda2m1sw0xR6X8_amVzQYsJvLq2UHIoAZr_30-qpTH4_1772793425
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Queue-Id: 8B99D21EDEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:aesteve@redhat.com,m:mripard@redhat.com,m:echanude@redhat.com,m:john.stultz@linaro.org,m:mripard@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

This patch series adds a new dma-buf heap driver that exposes coherent,
non‑reusable reserved-memory regions as named heaps, so userspace can
explicitly allocate buffers from those device‑specific pools.

Motivation: we want cgroup accounting for all userspace‑visible buffer
allocations (DRM, v4l2, dma‑buf heaps, etc.). That’s hard to do when
drivers call dma_alloc_attrs() directly because the accounting controller
(memcg vs dmem) is ambiguous. The long‑term plan is to steer those paths
toward dma‑buf heaps, where each heap can unambiguously charge a single
controller. To reach that goal, we need a heap backend for each
dma_alloc_attrs() memory type. CMA and system heaps already exist;
coherent reserved‑memory was the missing piece, since many SoCs define
dedicated, device‑local coherent pools in DT under /reserved-memory using
"shared-dma-pool" with non‑reusable regions (i.e., not CMA) that are
carved out exclusively for coherent DMA and are currently only usable by
in‑kernel drivers.

Because these regions are device‑dependent, each heap instance binds a
heap device to its reserved‑mem region via a newly introduced helper
function -namely, of_reserved_mem_device_init_with_mem()- so coherent
allocations use the correct dev->dma_mem.

Charging to cgroups for these buffers is intentionally left out to keep
review focused on the new heap; I plan to follow up based on Eric’s [1]
and Maxime’s [2] work on dmem charging from userspace.

This series also makes the new heap driver modular, in line with the CMA
heap change in [3].

[1] https://lore.kernel.org/all/20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com/
[2] https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org/
[3] https://lore.kernel.org/all/20260303-dma-buf-heaps-as-modules-v3-0-24344812c707@kernel.org/

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
Changes in v3:
- Reorganized changesets among patches to ensure bisectability
- Removed unused dma_heap_coherent_register() leftover
- Removed fallback when setting mask in coherent heap dev, since
  dma_set_mask() already truncates to supported masks
- Moved struct rmem_assigned_device (rd) logic to
  of_reserved_mem_device_init_with_mem() to allow listing the device
- Link to v2: https://lore.kernel.org/r/20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com

Changes in v2:
- Removed dmem charging parts
- Moved coherent heap registering logic to coherent.c
- Made heap device a member of struct dma_heap
- Split dma_heap_add logic into create/register, to be able to
  access the stored heap device before registered.
- Avoid platform device in favour of heap device
- Added a wrapper to rmem device_init() op
- Switched from late_initcall() to module_init()
- Made the coherent heap driver modular
- Link to v1: https://lore.kernel.org/r/20260224-b4-dmabuf-heap-coherent-rmem-v1-1-dffef43298ac@redhat.com

---
Albert Esteve (5):
      dma-buf: dma-heap: split dma_heap_add
      of_reserved_mem: add a helper for rmem device_init op
      dma: coherent: store reserved memory coherent regions
      dma-buf: heaps: Add Coherent heap to dmabuf heaps
      dma-buf: heaps: coherent: Turn heap into a module

John Stultz (1):
      dma-buf: dma-heap: Keep track of the heap device struct

 drivers/dma-buf/dma-heap.c            | 138 +++++++++--
 drivers/dma-buf/heaps/Kconfig         |   9 +
 drivers/dma-buf/heaps/Makefile        |   1 +
 drivers/dma-buf/heaps/coherent_heap.c | 417 ++++++++++++++++++++++++++++++++++
 drivers/of/of_reserved_mem.c          |  68 ++++--
 include/linux/dma-heap.h              |   5 +
 include/linux/dma-map-ops.h           |   7 +
 include/linux/of_reserved_mem.h       |   8 +
 kernel/dma/coherent.c                 |  34 +++
 9 files changed, 640 insertions(+), 47 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260223-b4-dmabuf-heap-coherent-rmem-91fd3926afe9

Best regards,
-- 
Albert Esteve <aesteve@redhat.com>

