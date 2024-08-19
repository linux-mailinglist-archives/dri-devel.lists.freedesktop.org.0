Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D4495651E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 10:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040D410E0C8;
	Mon, 19 Aug 2024 08:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="OwN/wTzp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9318F10E0C8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 08:02:48 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724054563; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=F+aHLvqM9zhqrszCW2u2orE+61M4gpadZfNPHrWJTs3aW68cK8jWjF+tsMI1npsCocJ6idf7t2TK5sMi4NaKln3a9rgLkJHw0Jo8p4nEdex8F8RshFGft4+Wir3FJ0j1oZYSQceatg6eDiHHA+Nzrf1utI3korCyrSBPxMZVZXQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724054563;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=aGM52OwWaSooqo/uVTXBAszQkcvYzLAzmkE020PQmws=; 
 b=jeWVDRnqO4DR1Lx/Sdon2KKGqCQFS7Fu5tRyRzCBixy3zi2QuDmegy7Hiq7dnabvWM9r5NACF6sEmcP9pxdL9xIIO2tU0POU3uYeE96vQ0wg0i7/51QjEPtG5tKMR6HoDtCVFAGwbHpnBZRXkK3ZPW4piVbB0rWJJ5j2kAe2gGU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724054563; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=aGM52OwWaSooqo/uVTXBAszQkcvYzLAzmkE020PQmws=;
 b=OwN/wTzpo2fMFKmJsgcqP4mDbEwv4gSJkXk33ufGlA9Tpzsf0ciuAWRGeYClDwfd
 8UAMbtkmkOGDJ8YXUTylzjm36v4B3se55eQCpbzfcuOJfWS7UMrhVIseGlmVLVv/CwT
 0MpV9+nMoM1lZ/N0W4XWEW/Y/I3hi70Lu/vHW5mY=
Received: by mx.zohomail.com with SMTPS id 1724054559948931.2584917515253;
 Mon, 19 Aug 2024 01:02:39 -0700 (PDT)
From: Mary Guillemard <mary.guillemard@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Mary Guillemard <mary.guillemard@collabora.com>
Subject: [PATCH v3 0/2] drm/panfrost: Wire cycle counters and timestamp info
 to userspace
Date: Mon, 19 Aug 2024 10:02:21 +0200
Message-ID: <20240819080224.24914-1-mary.guillemard@collabora.com>
X-Mailer: git-send-email 2.46.0
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

Mali has hardware cycle counters and GPU timestamps available for
profiling.

This patch series adds support for cycle counters propagation and
also new timestamp info parameters.

Those new changes to the uAPI will be used in Mesa to implement
timestamp queries for OpenGL and Vulkan.

The Mesa MR using this series is available here [1].

v2:
- Rewrote to use GPU timestamp register
- Add missing include for arch_timer_get_cntfrq
- Squash job requirement uAPI changes and implementation in one patch
- Simplify changes based on Steven Price comments

v3:
- Address Steven Price comments in the first patch
- Fix a codestyle issue in the second patch and add Steven Price r-b

[1]https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30553

Mary Guillemard (2):
  drm/panfrost: Add SYSTEM_TIMESTAMP and SYSTEM_TIMESTAMP_FREQUENCY
    parameters
  drm/panfrost: Add cycle counter job requirement

 drivers/gpu/drm/panfrost/panfrost_drv.c  | 45 ++++++++++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_gpu.c  | 12 +++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h  |  1 +
 drivers/gpu/drm/panfrost/panfrost_job.c  | 28 +++++++++------
 drivers/gpu/drm/panfrost/panfrost_regs.h |  2 ++
 include/uapi/drm/panfrost_drm.h          |  3 ++
 6 files changed, 78 insertions(+), 13 deletions(-)


base-commit: 3e828c670b0ac8a9564c69f5c5ecf637b22a58d6
-- 
2.46.0

