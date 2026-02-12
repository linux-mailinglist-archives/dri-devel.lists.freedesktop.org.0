Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFZQHOEujWk/zwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 02:37:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77CF128FF5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 02:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB7110E1F6;
	Thu, 12 Feb 2026 01:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="lSAxoZxu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DD110E1F6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 01:37:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770860251; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=H0WlVURYpy2/mC0SPJqxHKAw/rnKQ+FK2pF93K54dbcncVpDuD/9awYbHM6GN8Lhe5p1CTN9yz4WyoH/c8Sb1JEY3H40HozJTJE0lr5nvsnDsEy4jWe7eoM22dNdmo5AGataCdOAeZqLEAVFZau4bi+C9m1UG3Ej4cpJB9kXV8M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770860251;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=uiiQ+IyRtEcFu3hMOuMAl/TVVEreyjJcOibwZTp3arQ=; 
 b=RxET7OwSHXDgHZLcysmF+ASP8kvW0quIgyXS3LisrwmRmJl0/2+4+9UhayQfywd6trAOO75Chh/QOgtQ2GrUYiPrVxndUplYxv5/E6o035zpk6605VUTHOrn3lWJbWgJeZmHyWIR8+qImTpvRIYvOCC03AFYI0f7/vslMtv22Eg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770860251; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=uiiQ+IyRtEcFu3hMOuMAl/TVVEreyjJcOibwZTp3arQ=;
 b=lSAxoZxulvN/ma9a1Mb1EcD5OxYgzj4GQ8uSW6djfZWUHwHDOBY/mfn8hdf4nI2h
 LHpeDnVDNvnFQ7qZRvKQFN3oFw6SKWGItwqQuYM9ApRN2KgV2tGqs+99y22fgX2KAUE
 QVGPO6us58+/a7vL50xbNFf1Gr7W2l9JWeQBMQQ0=
Received: by mx.zohomail.com with SMTPS id 1770860250640823.5812933409642;
 Wed, 11 Feb 2026 17:37:30 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, beata.michalska@arm.com, lyude@redhat.com,
 Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 0/12] drm/tyr: firmware loading and MCU boot support
Date: Wed, 11 Feb 2026 17:37:01 -0800
Message-ID: <20260212013713.304343-1-deborah.brouwer@collabora.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: D77CF128FF5
X-Rspamd-Action: no action

This series adds firmware loading and MCU boot support to the Tyr DRM
driver. It includes:
- A parser for the Mali CSF firmware binary format
- A kernel-managed BO type (KernelBo) for internal driver allocations
- GPU virtual memory (VM) integration using drm_gpuvm
- An MMU module and a generic slot manager
- Shmem-backed GEM support for Tyr
- Loading firmware, VM activation, and MCU boot at probe()

Base:
  drm-rust-next-2026-01-26
  commit cea7b66a8041 ("Documentation: nova: update pending tasks")

Dependencies:
- [PATCH v7 0/7] Rust bindings for gem shmem + iosys_map
https://lore.kernel.org/rust-for-linux/20260206223431.693765-1-lyude@redhat.com/

- [PATCH v4 0/6] Rust GPUVM immediate mode
https://lore.kernel.org/rust-for-linux/20260130-gpuvm-rust-v4-0-8364d104ff40@google.com/

- [PATCH v5 0/4] Introduce DeviceContext
https://lore.kernel.org/rust-for-linux/20260131001602.2095470-1-lyude@redhat.com/

Other Prerequisites:
This series also depends on additional prerequisite fixes not included in
this posting. The full stack (base + prerequisites + this series) is
available here:
  https://gitlab.freedesktop.org/dbrouwer/linux/-/tree/dbrouwer/fw-boot

Development history / discussion:
  https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/56


Beata Michalska (1):
  drm/tyr: set DMA mask using GPU physical address

Boris Brezillon (6):
  drm/tyr: select DRM abstractions in Kconfig
  drm/tyr: rename TyrObject to BoData
  drm/tyr: add MMU address space registers
  drm/tyr: Add generic slot manager
  drm/tyr: add MMU module
  drm/tyr: add GPU virtual memory module

Daniel Almeida (1):
  drm/tyr: add parser for firmware binary

Deborah Brouwer (4):
  drm/tyr: move clock cleanup into Clocks Drop impl
  drm/tyr: add shmem backing for GEM objects
  drm/tyr: add a kernel buffer object
  drm/tyr: add firmware loading and MCU boot support

 drivers/gpu/drm/tyr/Kconfig              |  14 +-
 drivers/gpu/drm/tyr/driver.rs            |  55 +-
 drivers/gpu/drm/tyr/fw.rs                | 263 ++++++++
 drivers/gpu/drm/tyr/fw/parser.rs         | 469 ++++++++++++++
 drivers/gpu/drm/tyr/gem.rs               | 117 +++-
 drivers/gpu/drm/tyr/gpu.rs               |   2 -
 drivers/gpu/drm/tyr/mmu.rs               |  90 +++
 drivers/gpu/drm/tyr/mmu/address_space.rs | 322 ++++++++++
 drivers/gpu/drm/tyr/regs.rs              | 101 ++-
 drivers/gpu/drm/tyr/slot.rs              | 358 +++++++++++
 drivers/gpu/drm/tyr/tyr.rs               |   4 +
 drivers/gpu/drm/tyr/vm.rs                | 782 +++++++++++++++++++++++
 12 files changed, 2548 insertions(+), 29 deletions(-)
 create mode 100644 drivers/gpu/drm/tyr/fw.rs
 create mode 100644 drivers/gpu/drm/tyr/fw/parser.rs
 create mode 100644 drivers/gpu/drm/tyr/mmu.rs
 create mode 100644 drivers/gpu/drm/tyr/mmu/address_space.rs
 create mode 100644 drivers/gpu/drm/tyr/slot.rs
 create mode 100644 drivers/gpu/drm/tyr/vm.rs

-- 
2.52.0

