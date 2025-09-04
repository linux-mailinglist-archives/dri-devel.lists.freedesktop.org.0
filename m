Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0C5B43400
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 09:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D73110E993;
	Thu,  4 Sep 2025 07:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="fJmEpBPV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EE810E992;
 Thu,  4 Sep 2025 07:32:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756971141; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DohdtRdsnWm+FTyceYTJ1ADB2Cu4BDb1acLuTd4SkmAWJE7xnDdnSJc2Mwa+DXakk4L+tYo3jZ3vfJPtoGaY/ES6YnB3yk4Qf3gfhZXM50Z+xWAl7tk7CFwx+yCY5Q2dmf/VMXmBQJpcZ07zN7gMhyTmZdM2fC6kW6/6qvOgOZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756971141;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=aTE4qhWLj97cE91FZu0gKB2lFf3oxunWOUcVgs6SaiY=; 
 b=CQzsD7s5mdKui9tWAxYTf59KjgQCG5QxG2pn9Ckh63Yd98snZqpAptfhid9wB0u2s5C65F9dFa21Dhq9yPAsaHWw+8tr9VRM7ESoPLOhx1Jirx6VWSpzaXNl4dEDpLxrBfRyqUWzTpEudyabVcLUgzn87UfRImIOpsgNVRk46vs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756971141; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=aTE4qhWLj97cE91FZu0gKB2lFf3oxunWOUcVgs6SaiY=;
 b=fJmEpBPVk/LMbZ5euOWMiJw4miTmtW7Msgj9kucoLU6iL98BN14/ytbyQZ/ZvNbL
 LjS1jBL+WRG0CEKWrk43+v8W2dssyyHb6zeDjdSbotNJft1JcVZEp8IfZYk0Bpf9dsf
 CUbmT7MX4vKA+iUTtH8fcsc5n0y5CceQjn5MlTeFIpJy2mySjx+c3UXhOAGTZWpgypa
 srIc2bzCiqvi7BAC9vkfaAS2j85E0P1cn2IYboFcgjkzcXavYuIYlfAR6AMEll0Z5x5
 cLcsWgrO0L7jbhILOL8a0HGVB0sxOKlSN7Tkxnizc2IMskk2B8kuOAzMuzYNZdKBT8Q
 9Lw+h2YHwA==
Received: by mx.zohomail.com with SMTPS id 1756971139231102.77951280999105;
 Thu, 4 Sep 2025 00:32:19 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 0/7] drm/etnaviv: add support for GC620 on T-Head TH1520
Date: Thu,  4 Sep 2025 15:31:44 +0800
Message-ID: <20250904073151.686227-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
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

Tested by both the etnaviv_2d_test program in libdrm tests and
xf86-video-thead 2D-accelerated DDX.

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
 drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c | 26 +++++++++++++-----
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c      |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.h      | 24 +++++++----------
 7 files changed, 99 insertions(+), 29 deletions(-)

-- 
2.51.0

