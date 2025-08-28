Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C498BB391BB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 04:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E782C10E922;
	Thu, 28 Aug 2025 02:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Lc2rwN1t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F71810E922
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 02:35:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756348503; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IBKrafhpz/+6faHHFrXVSzsS7vuhdJBIAUDLPtiBZvopqN87ZOh3gefQnL2HMB8za4InRngzXSfw+i3Ep8EFMRT4G3rn3FNFaC9vex/yTscArVdGbvDOk25o/iad/pZg8b6C+Ir0Y1aRddhPMWbbFSJkeLZkcfYrA1tbg7goPO0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756348503;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=8Q7OTYSNjYnaiJukdzrTqRn402H4JDcPMAA2S6KRFdo=; 
 b=TiNryiQ/68qpAPNeBx9cEU6L2hlUc0tENJXd/+LG4otUVs5WzWlQ0MNINqXJ5kXMpWbHMtuG4HZINxrYKqkpUWvyi5sUiZtIQXOSmYoKGTIxA6OBaTpR31AAtOG67415Zh66SygrJuHtY92AfdLeXZupsceJswP+lMi32fpl4og=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756348502; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=8Q7OTYSNjYnaiJukdzrTqRn402H4JDcPMAA2S6KRFdo=;
 b=Lc2rwN1tPYWvyvObc0sht+qWAjW14+wyRCqknv8HvvBPr8q9hRthXvEqWkLuGBZ3
 5mdwjt+Vik7k7frGgGKO+0CBeqIwxl9+wggGfN9CyGRVz8bvu/0ibDsNUSlMUPtmCK8
 XXzVszg/HNH1ZjbwcLpHkwS/MDV2mtaOxPjBLmDM=
Received: by mx.zohomail.com with SMTPS id 1756348500386647.143849521538;
 Wed, 27 Aug 2025 19:35:00 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH 0/5] Introduce Panfrost JM contexts
Date: Thu, 28 Aug 2025 03:34:03 +0100
Message-ID: <20250828023422.2404784-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This patch series brings the notion of JM contexts into Panfrost.
UM will be able to create contexts, get a handle for them and attach
it to a job submission. Contexts describe basic HW resource assignment
to jobs, and also their job slot priorities.

A Mesa MR with UM changes that leverage this new kernel driver feature
is still in the making.

Boris Brezillon (5):
  drm/panfrost: Add job slot register defs for affinity
  drm/panfrost: Introduce uAPI for JM context creation
  drm/panfrost: Introduce JM context for manging job resources
  drm/panfrost: Expose JM context IOCTLs to UM
  drm/panfrost: Display list of device JM contexts over debugfs

 drivers/gpu/drm/panfrost/panfrost_device.h |   4 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 152 +++++++++++-
 drivers/gpu/drm/panfrost/panfrost_job.c    | 270 +++++++++++++++++----
 drivers/gpu/drm/panfrost/panfrost_job.h    |  27 ++-
 drivers/gpu/drm/panfrost/panfrost_regs.h   |   6 +
 include/uapi/drm/panfrost_drm.h            |  93 +++++++
 6 files changed, 494 insertions(+), 58 deletions(-)


base-commit: 5c76c794bf29399394ebacaa5af8436b8bed0d46
--
2.50.0
