Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F00A469C4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 19:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C509A10E1E3;
	Wed, 26 Feb 2025 18:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="RVNkjYjx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBC310E216
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 18:30:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1740594653; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PrsOkTAFcwIU6IFxSVRJn0RSe7CA646ZyjzBGP1z/smgj0sCIsB1qEInB4o0vZi5kdmP5EcuX4VktWgIWRSaKMkKFnsW+9s5s3T6yaRDyLxQncVgPIOsGjDu8Lk3XEHMioCw10O1WaqumaXC2jBtQ+zSanyDKdOKJNP0MIMi198=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1740594653;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=so5Ya2sNVzVdPATWv72yqrbwqb2T7dEICsjtp1FE3Ao=; 
 b=RyfScPZAyl0cLhkmX1a7T1i+C23INECA3j83ke5KgWeL27OGkcaAxixs2HmcjWVbwQ0ot8Sm6GE97kPLvn1E25/PXWGf9ZOUxGK6nfeQN6DEckAfp1kCzn+iw1UwJRlf7VordwOR2LJF5gfY7LwxIs5bo9KSqgxTvBDQsujXbfM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740594653; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=so5Ya2sNVzVdPATWv72yqrbwqb2T7dEICsjtp1FE3Ao=;
 b=RVNkjYjx0Z9MkF/tTe5Jrq6xfJ/GgtE3d4LW1Sop47qRyRU4X6uaYwyMyvtL6ncY
 ZpHacDaXWzUnXYkr48rbaYwfK46i16JqK5vP4i0lbFZkviJl+C5qnFOBkfztiFh53XM
 T86Fe0/ggPzjzxR9JhdkclkfZd7XwV9dKWI7qEFU=
Received: by mx.zohomail.com with SMTPS id 1740594650931636.5193849645846;
 Wed, 26 Feb 2025 10:30:50 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [RFC PATCH 0/4] drm/panfrost: Support ARM_64_LPAE_S1 page table
Date: Wed, 26 Feb 2025 15:30:39 -0300
Message-ID: <20250226183043.140773-1-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
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

Hi all,

This is a RFC related to AArch64 page table format support in panfrost.
Currently, only MMU in legacy mode is supported, but Bifrost GPUs use
the standard format LPAE S1 page tables.

There's a previous similar thread on this topic from 2019-May [0], which
got stalled. This RFC is an attemp to bring this discussion back in
order to properly support this mode.

So far, this patchset has been tested on a Mediatek Genio 700 EVK
(MT8390) board, with an integrated Mali-G57 MC3 GPU using
`glmark2-es2-drm` OpenGL 2.0 benchmark tests.

However, Mesa CI dEQP tests for GLES2, GLES3+ and EGL already reported
possible regressions on this patchset, still under investigation.

Due to the possible impact of this patchset, exhaustive testing should
be done before merging, but in any case, let's start kicking this thread
for discussion.

Any comments, feedback is welcome :)

[0] https://lists.freedesktop.org/archives/dri-devel/2019-May/217617.html

Thanks!

Ariel D'Alessandro (4):
  drm/panfrost: Use GPU_MMU_FEATURES_VA_BITS/PA_BITS macros
  drm/panfrost: Split LPAE MMU TRANSTAB register values
  drm/panfrost: Support ARM_64_LPAE_S1 page table
  drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature flag on Bifrost
    models

 drivers/gpu/drm/panfrost/panfrost_device.h   |   1 +
 drivers/gpu/drm/panfrost/panfrost_features.h |   3 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c      | 124 +++++++++++++++----
 drivers/gpu/drm/panfrost/panfrost_regs.h     |  50 ++++++--
 4 files changed, 149 insertions(+), 29 deletions(-)

-- 
2.47.2

