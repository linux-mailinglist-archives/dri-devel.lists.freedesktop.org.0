Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJmIElDVpmnHWgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 13:34:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF48E1EF7F5
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 13:34:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00BB10E7AC;
	Tue,  3 Mar 2026 12:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FU+1ke5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A977410E7AC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 12:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772541256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U6xhLiQFL+mbcgfrby6QpV2yp3OnQ8VMri8wk6ood+Y=;
 b=FU+1ke5TUtOAVxArozDxDeBNMYoaGH7POrsOFamq1gsxePKKvvuwwBY8mWLgMZd9FTS7vr
 mG/QtY9AnGOhZ5k7JayBpp05f0c3CiZSH6Rqe14hTnivCqQJVK7CsaoOY4V0G6weKEh2fM
 aNO19pL3DovDWuKBNAcD03LOy5ePHUc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-470-cN6t_CJ8MaSdHHuavs01GA-1; Tue,
 03 Mar 2026 07:34:13 -0500
X-MC-Unique: cN6t_CJ8MaSdHHuavs01GA-1
X-Mimecast-MFC-AGG-ID: cN6t_CJ8MaSdHHuavs01GA_1772541251
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 827351956089; Tue,  3 Mar 2026 12:34:10 +0000 (UTC)
Received: from [192.168.1.153] (unknown [10.44.32.231])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DBF6530001B9; Tue,  3 Mar 2026 12:34:03 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v2 0/6] dma-buf: heaps: add coherent reserved-memory heap
Date: Tue, 03 Mar 2026 13:33:43 +0100
Message-Id: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ7CIBCF4as0s3ZMmTaNuPIepgsKg7CgNICNp
 undxSZuXf5v8b0NMifPGa7NBolXn32ca9CpAe3U/GD0pjZQS0NL1OHUowlqelp0rBbU0XHiuWA
 KHFAKazpJg7IsoRJLYutfB38fazufS0zv420V3/UH9//hVaBAYy3bviN5UfqW2DhVzjoGGPd9/
 wAJXkgtyQAAAA==
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
 Albert Esteve <aesteve@redhat.com>, echanude@redhat.com, mripard@redhat.com, 
 John Stultz <john.stultz@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772541243; l=2748;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=IPXiwZtCc7P08ZgUjvcnSviyFkXkojb59Nxf4/tXsiE=;
 b=UoJm8cOUwDbUZaGCu/6/A2ZEkCDOViFBfczvAM5knasQJRy7s18G7gsVP6zwFOy1FBwWL/nXj
 M/F79L4YdOoCAv3QZE2oXpL/jmdtEbuyArFvtu7fbTfA4XBopk6UHWV
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: -WJgR0A2H47lhkJ5ZIhcUAeLQIuUxCdAzWArKUkrMzA_1772541251
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
X-Rspamd-Queue-Id: BF48E1EF7F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:aesteve@redhat.com,m:echanude@redhat.com,m:mripard@redhat.com,m:john.stultz@linaro.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[gabe.freedesktop.org:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

This patch introduces a new heap driver to expose DT non‑reusable
"shared-dma-pool" coherent regions as dma-buf heaps, so userspace can
allocate buffers from each reserved, named region.

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
      dma-buf: heaps: Add Coherent heap to dmabuf heaps
      dma: coherent: register to coherent heap
      dma-buf: heaps: coherent: Turn heap into a module

John Stultz (1):
      dma-buf: dma-heap: Keep track of the heap device struct

 drivers/dma-buf/dma-heap.c            | 138 +++++++++--
 drivers/dma-buf/heaps/Kconfig         |   9 +
 drivers/dma-buf/heaps/Makefile        |   1 +
 drivers/dma-buf/heaps/coherent_heap.c | 429 ++++++++++++++++++++++++++++++++++
 drivers/of/of_reserved_mem.c          |  27 ++-
 include/linux/dma-heap.h              |  16 ++
 include/linux/dma-map-ops.h           |   7 +
 include/linux/of_reserved_mem.h       |   8 +
 kernel/dma/coherent.c                 |  34 +++
 9 files changed, 642 insertions(+), 27 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260223-b4-dmabuf-heap-coherent-rmem-91fd3926afe9

Best regards,
-- 
Albert Esteve <aesteve@redhat.com>

