Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JTxH2AcpmmeKQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 00:25:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90141E697D
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 00:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D0F10E076;
	Mon,  2 Mar 2026 23:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="c3e5vY+Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CFE10E09D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 23:25:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772493911; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cLMS5XUlhNgUuG5K3A4x3sOiC0RtDo44ItRuiZ3k7RiEK8ruxEsoA1rrgg2HBotFeouJ7WXAvt//vdmJrRDr3RdSEDf/IhisQaa4K69+Hr5KQg+XEzr53tRQc8PV0wGazITWT2BYbFSf8WD+cnCqIsC/3nVi/zN05D4VFw+QVho=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772493911;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vMn4mleYJCwHO/HEaqYDhujRlmyDNEKG8BQE1W/8jVs=; 
 b=OWDp96r6SnWUIwYASx/U+ad+2ZszJ0kHz6M7XnVBWz8aOsp+LU4IVbNHbxcSKR165P2G8CXprF12Ahzmofq0DKZzgaw0kT26QhMRIVcquBMGjm/mswbZ2sxaA2zmjBjiS/EPutc26FlV7HXqIB/0Kwaz/SlOAR3DHIlKFomUpzo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772493911; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=vMn4mleYJCwHO/HEaqYDhujRlmyDNEKG8BQE1W/8jVs=;
 b=c3e5vY+ZNpREo/SPUkDbeMYVVyhQhF3pAsZ9n37t9Hg6P61aaopmJVWf7UFSR3tr
 NPQYRCHtVjcwwWPVoFH/P3OI1XJfQoJElrZByQORg5lSaGI9pFtbIVH4ufFaqOEonTn
 nemM9Buwz7i2ZVUiaDuCdA1lOKLzmnwjBqOF8pqw=
Received: by mx.zohomail.com with SMTPS id 1772493909850979.7698025270312;
 Mon, 2 Mar 2026 15:25:09 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, beata.michalska@arm.com, lyude@redhat.com,
 work@onurozkan.dev, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 0/12] drm/tyr: firmware loading and MCU boot support
Date: Mon,  2 Mar 2026 15:24:48 -0800
Message-ID: <20260302232500.244489-1-deborah.brouwer@collabora.com>
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
X-Rspamd-Queue-Id: E90141E697D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:dkim,collabora.com:mid,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action

This series adds firmware loading and MCU boot support to the Tyr DRM
driver. It includes:
- A parser for the Mali CSF firmware binary format
- A kernel-managed BO type (KernelBo) for internal driver allocations
- GPU virtual memory (VM) integration using drm_gpuvm
- An MMU module and a generic slot manager
- Shmem-backed GEM support for Tyr
- Loading firmware, VM activation, and MCU boot at probe()

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

---
Changes in v2:
- The whole series is rebased on drm-rust-next including v7.0-rc1.
- Each patch has its own changelog.

Link to v1: https://lore.kernel.org/rust-for-linux/20260212013713.304343-1-deborah.brouwer@collabora.com/
---

Beata Michalska (1):
  drm/tyr: set DMA mask using GPU physical address

Boris Brezillon (5):
  drm/tyr: select DRM abstractions in Kconfig
  drm/tyr: rename TyrObject to BoData
  drm/tyr: Add generic slot manager
  drm/tyr: add MMU module
  drm/tyr: add GPU virtual memory module

Daniel Almeida (2):
  drm/tyr: add MMU address space registers
  drm/tyr: add parser for firmware binary

Deborah Brouwer (4):
  drm/tyr: move clock cleanup into Clocks Drop impl
  drm/tyr: add shmem backing for GEM objects
  drm/tyr: add a kernel buffer object
  drm/tyr: add firmware loading and MCU boot support

 drivers/gpu/drm/tyr/Kconfig              |  15 +-
 drivers/gpu/drm/tyr/driver.rs            |  53 +-
 drivers/gpu/drm/tyr/fw.rs                | 270 ++++++++
 drivers/gpu/drm/tyr/fw/parser.rs         | 519 +++++++++++++++
 drivers/gpu/drm/tyr/gem.rs               | 154 ++++-
 drivers/gpu/drm/tyr/gpu.rs               |   2 -
 drivers/gpu/drm/tyr/mmu.rs               | 122 ++++
 drivers/gpu/drm/tyr/mmu/address_space.rs | 493 ++++++++++++++
 drivers/gpu/drm/tyr/regs.rs              | 101 ++-
 drivers/gpu/drm/tyr/slot.rs              | 436 +++++++++++++
 drivers/gpu/drm/tyr/tyr.rs               |   4 +
 drivers/gpu/drm/tyr/vm.rs                | 794 +++++++++++++++++++++++
 12 files changed, 2933 insertions(+), 30 deletions(-)
 create mode 100644 drivers/gpu/drm/tyr/fw.rs
 create mode 100644 drivers/gpu/drm/tyr/fw/parser.rs
 create mode 100644 drivers/gpu/drm/tyr/mmu.rs
 create mode 100644 drivers/gpu/drm/tyr/mmu/address_space.rs
 create mode 100644 drivers/gpu/drm/tyr/slot.rs
 create mode 100644 drivers/gpu/drm/tyr/vm.rs

-- 
2.52.0

