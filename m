Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHV+LO1LcmnpfAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 17:10:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070AF69A6C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 17:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D8110EA11;
	Thu, 22 Jan 2026 16:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gxw0zSYC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4E910EA11
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 16:10:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6AF6B600C4;
 Thu, 22 Jan 2026 16:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95341C116C6;
 Thu, 22 Jan 2026 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769098216;
 bh=ha3JA4N/2sbTZoLLt9Hk+/O5tkj/IAzHDfElKjAoOuU=;
 h=From:To:Cc:Subject:Date:From;
 b=gxw0zSYCXNJ4FcqwQQa7I3h3D2XukR/5aI8fAthL9DSmSmnm5KNPPfNGJ1op1BP4Y
 MQ8cVwzVPjLYouTp/7uYsWSzL1ur0vhAi8L6FpMUXjN04ub6UPMiSU3ZiH+XtPFwfk
 VDdZWO7EoWXGrXVNri26ANlTn29LcOna1OgwmoqrgPHF2Z+DlEJR1wAkHWsZ6kesJv
 qbLK+3OIqfHgL9efAc72qE3r7O1STboGXJlBPqou0qcXN6QKZkFhWF6pvcrQDPFrx/
 MqiNydzq8TzcExsRUkFNe+MEx6i7Rghos0E8UwfsefR6oollk4PXYz9/GzaS+tOntT
 OxAMHTZ4pQ6Hg==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Sumit Garg <sumit.garg@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: [PATCH v2 00/10] dma-bug: heaps: Add Tegra VPR support
Date: Thu, 22 Jan 2026 17:09:59 +0100
Message-ID: <20260122161009.3865888-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:akpm@linux-foundation.org,m:david@redhat.com,m:rppt@kernel.org,m:sumit.garg@kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-mm@kvack.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thierry.reding@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,ffwll.ch,linaro.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 070AF69A6C
X-Rspamd-Action: no action

From: Thierry Reding <treding@nvidia.com>

Hi,

This series adds support for the video protection region (VPR) used on
Tegra SoC devices. It's a special region of memory that is protected
from accesses by the CPU and used to store DRM protected content (both
decrypted stream data as well as decoded video frames).

Patches 1 and 2 add DT binding documentation for the VPR and add the VPR
to the list of memory-region items for display and host1x.

Patch 3 adds bitmap_allocate(), which is like bitmap_allocate_region()
but works on sizes that are not a power of two.

Patch 4 introduces new APIs needed by the Tegra VPR implementation that
allow CMA areas to be dynamically created at runtime rather than using
the fixed, system-wide list. This is used in this driver specifically
because it can use an arbitrary number of these areas (though they are
currently limited to 4).

Patch 5 adds some infrastructure for DMA heap implementations to provide
information through debugfs.

The Tegra VPR implementation is added in patch 6. See its commit message
for more details about the specifics of this implementation.

Finally, patches 7-10 add the VPR placeholder node on Tegra234 and hook
it up to the host1x and GPU nodes so that they can make use of this
region.

Changes in v2:
- Tegra VPR implementation is now more optimized to reduce the number of
  (very slow) resize operations, and allows cross-chunk allocations
- dynamic CMA areas are now trackd separately from static ones, but the
  global number of CMA pages accounts for all areas

Thierry

Thierry Reding (10):
  dt-bindings: reserved-memory: Document Tegra VPR
  dt-bindings: display: tegra: Document memory regions
  bitmap: Add bitmap_allocate() function
  mm/cma: Allow dynamically creating CMA areas
  dma-buf: heaps: Add debugfs support
  dma-buf: heaps: Add support for Tegra VPR
  arm64: tegra: Add VPR placeholder node on Tegra234
  arm64: tegra: Add GPU node on Tegra234
  arm64: tegra: Hook up VPR to host1x
  arm64: tegra: Hook up VPR to the GPU

 .../display/tegra/nvidia,tegra186-dc.yaml     |   10 +
 .../display/tegra/nvidia,tegra20-dc.yaml      |   10 +-
 .../display/tegra/nvidia,tegra20-host1x.yaml  |    7 +
 .../nvidia,tegra-video-protection-region.yaml |   55 +
 arch/arm/mm/dma-mapping.c                     |    2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      |   60 +
 arch/s390/mm/init.c                           |    2 +-
 drivers/dma-buf/dma-heap.c                    |   56 +
 drivers/dma-buf/heaps/Kconfig                 |    7 +
 drivers/dma-buf/heaps/Makefile                |    1 +
 drivers/dma-buf/heaps/cma_heap.c              |    2 +-
 drivers/dma-buf/heaps/tegra-vpr.c             | 1265 +++++++++++++++++
 include/linux/bitmap.h                        |   25 +-
 include/linux/cma.h                           |    7 +-
 include/linux/dma-heap.h                      |    2 +
 include/trace/events/tegra_vpr.h              |   57 +
 mm/cma.c                                      |  187 ++-
 mm/cma.h                                      |    5 +-
 18 files changed, 1713 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/nvidia,tegra-video-protection-region.yaml
 create mode 100644 drivers/dma-buf/heaps/tegra-vpr.c
 create mode 100644 include/trace/events/tegra_vpr.h

-- 
2.52.0

