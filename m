Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2277B1B62
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862A210E629;
	Thu, 28 Sep 2023 11:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19FE10E629
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1u3aj90DI/mZaoyggOQv7vylZ+5B704T4EL2GRNfewk=; b=dYh3s6qNOFR97dG9oHTsMvJuC/
 2SBzacMZss0YilPZBL1oQDJq8ZndzbNKY/cisRSF1oGhObA8m1M5qINb77+3ZthPJepfJWlwDxl9c
 LLTPY9i9tl45/yAL1+7FJz8/xob7u9S9UqvONwENs9ppZqDB6xAsRjfbUWJUiulENHKHJ9xxRwGJg
 VU15NgG8B0f9W3WqFQjMbpHXpe8U8h6Epa0Tc9AUQPcz6QjbP8BAvm2nemhKM0jKNtbRVnEAqQ/73
 /NyJ+BZ3UVllQ5XvyqnqEbJr0ScQbjPRZ3RSu4V9vGd/nEo/L+B6Tp5o4APorBdJtJD8AziGFRUFB
 1/Geh6LQ==;
Received: from [213.60.48.236] (helo=vega.mundo-R.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qlpSq-009FgI-TE; Thu, 28 Sep 2023 13:45:52 +0200
From: Iago Toral Quiroga <itoral@igalia.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] V3D module changes for Pi5
Date: Thu, 28 Sep 2023 13:45:29 +0200
Message-Id: <20230928114532.167854-1-itoral@igalia.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Maira Canal <mcanal@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series includes patches to update the V3D kernel module
that drives the VideoCore VI GPU in Raspberry Pi 4 to also support
the Video Core VII iteration present in Raspberry Pi 5.

The first patch in the series addresses the bulk of the work and
involves mostly updates to register addresses. The second patch
adds a small uAPI update required for TFU jobs and the third and
final patch matches the 'brcm,2712-v3d' device string from Pi5
with the V3D driver.

The changes for the user-space driver can be found in the
corresponding Mesa MR here:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25450

Iago Toral Quiroga (3):
  drm/v3d: fix up register addresses for V3D 7.x
  drm/v3d: update UAPI to match user-space for V3D 7.x
  drm/v3d: add brcm,2712-v3d as a compatible V3D device

 drivers/gpu/drm/v3d/v3d_debugfs.c | 173 +++++++++++++++++-------------
 drivers/gpu/drm/v3d/v3d_drv.c     |   1 +
 drivers/gpu/drm/v3d/v3d_gem.c     |   3 +
 drivers/gpu/drm/v3d/v3d_irq.c     |  47 ++++----
 drivers/gpu/drm/v3d/v3d_regs.h    |  51 ++++++++-
 drivers/gpu/drm/v3d/v3d_sched.c   |  41 ++++---
 include/uapi/drm/v3d_drm.h        |   5 +
 7 files changed, 206 insertions(+), 115 deletions(-)

-- 
2.39.2

