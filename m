Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EC2B28B83
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 09:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6741410E2DC;
	Sat, 16 Aug 2025 07:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="Ejc61UXZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A30A10E089;
 Sat, 16 Aug 2025 07:48:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755330499; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=A3Z3+ERcLsXTZoUMsAKaue8d2lHMezKapHDW7CIAizHx7DFRfYlxDHl+oVMKxnmPZY92upxn8WP/kd4f+7bf+jsr1MnwPaJcr8/jIOcz3+GNX0aQ4IJ4fqVaxzRc3JfmxSBluUTF+yRkWlC0VTRHWhhUNjiGrObr/M4mTFUAnV4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755330499;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ZvPMHxn9L7TiQAMN2zR904XCsjoFl4D3E0wwP1N3GjU=; 
 b=bIO4+m8a1j6drs3qvNV5RvzSKhP+SZUi8yeO98ZXPG+TBg5VKrHp/Njbb/5iI7gsCD65Q/zm6ocF7VE9SKPhyNhsMyAnJlyC5vqutdkj9BMITfuE/Cr50OYT3+MhtIATV6I/N+9MLyBLy2LEVM8PZVf9ox4t95At6GA1DtkLJWU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755330499; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ZvPMHxn9L7TiQAMN2zR904XCsjoFl4D3E0wwP1N3GjU=;
 b=Ejc61UXZtgJgtPUu0kbjrf9a3gMGZBwkNEp6GNXbaNY9cd5k5v4MN4OUPJjCST4P
 vJN8xP6j2quoP+UiX8rOPTDhpmQnuK7Ca4VoiCwf6BwMohPt4vXBZPMyL3+ugPn0b9i
 ATAD/sVL2HgXoQASdKdxOM9iCXCGoRJ2YVlrcA37+Otde/CsMDzREbQSi2+UMXaWEOu
 bc5y0Bxy7VrFu0J6Uh0IWJt84uFla/nVJOI0ZWnDF68SbRdbcf4rtTsUWqBsxdbUacv
 IPzTuUPVP9O4Da7Joos9Te4/Pvrpl4RUT0Z00JnjGCuQZZ7aQaQJxIi8PwtiVwQXa0M
 uk4u/S+V8Q==
Received: by mx.zohomail.com with SMTPS id 1755330497800252.9936948125818;
 Sat, 16 Aug 2025 00:48:17 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 0/7] drm/etnaviv: add support for GC620 on T-Head TH1520
Date: Sat, 16 Aug 2025 15:47:50 +0800
Message-ID: <20250816074757.2559055-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

This patchset tries to add support for the GC620 2D accelerator, which
is a quirky thing -- it has quirks on both MMU and DEC.

The DEC quirk is bound to the model number and revision number
currently, and only involves writing to some DEC registers at specific
situation.

The MMU quirk is more weird -- it contains a broken implementation of
PTA, which blocks directly writing MTLB address to switch MMU context,
but loading page table IDs different to the initial one does not work
either. A shared context practice, like what's done for IOMMUv1, has to
be used instead.

The DT patch isn't ready because the VP (video processing) subsystem on
TH1520 does not have proper clock and reset driver yet, and the DT patch
included in this patchset uses fake clocks and ignore resets.

Tested by the etnaviv_2d_test program in libdrm tests.

Icenowy Zheng (7):
  drm/etnaviv: add HWDB entry for GC620 r5552 c20b
  drm/etnaviv: add handle for GPUs with only SECURITY_AHB flag
  drm/etnaviv: setup DEC400EX on GC620 r5552
  drm/etnaviv: protect whole iommuv2 ctx alloc func under global mutex
  drm/etnaviv: prepare for shared_context support for iommuv2
  drm/etnaviv: add shared context support for iommuv2
  [NOT FOR UPSTREAM] riscv: dts: thead: enable GC620 G2D on TH1520

 arch/riscv/boot/dts/thead/th1520.dtsi      | 19 +++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c      | 19 ++++++++++---
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c     | 31 ++++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_iommu.c    |  8 +++---
 drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c | 23 +++++++++++-----
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c      |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.h      | 24 +++++++----------
 7 files changed, 96 insertions(+), 29 deletions(-)

-- 
2.50.1

