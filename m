Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DD0ACC393
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 11:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127F210E137;
	Tue,  3 Jun 2025 09:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ashley.smith@collabora.com header.b="WfK+i35M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C0010E137
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 09:51:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1748944243; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LnVT/iqQPyVRmIsHZHGR50rsKV32zw5V7CEjuhv0X8H2coCBX/Ycxi4j/6IdFwZ2V+AjJpa7hEQT4CVfeurEKxAyEcyRuRTz8x2Izm8hTjYt18uVzzF4L1nspJ01ceIaefiMU6PjeSEtcxyV0uEd5stNbsjvHyfMwUI4BRhDybQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1748944243;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=bylw4shBB29ahZ+zqubDHkYiBdt8upnwLyVdwCXCX3k=; 
 b=NQ8qCKWPoZ1X1dXSq3CSMplmOiU4WHvsxsVf9lreNEX68U3utDYbPUCy/s8QTM+fRVL0Vyl7J7BUOHAFc/zi+0B4MtFlSWIlGJXvJMQ9R9uB7fgcUEfyb0n8qhMeD2Ol7JAYccwI99Oj6pTfi5uPn475GxPTlGGFWxV3N2sYG08=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ashley.smith@collabora.com;
 dmarc=pass header.from=<ashley.smith@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748944242; 
 s=zohomail; d=collabora.com; i=ashley.smith@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=bylw4shBB29ahZ+zqubDHkYiBdt8upnwLyVdwCXCX3k=;
 b=WfK+i35MbcSGe9Pwe/DSZGVjUtIwS3SJGa+ArIWVLsjsspIHNulqRUz+sIroljDp
 YstWblhEGlVBJCszNmt25vsna7wYasAHxJfQ20W+hh2zh6dUK2Sga2QF8rl9AEzKiqd
 JvkzG0Q52bdm2yvUjniQwZP/ikwgo3I8zVuFBtNM=
Received: by mx.zohomail.com with SMTPS id 174894424081440.5342879966239;
 Tue, 3 Jun 2025 02:50:40 -0700 (PDT)
From: Ashley Smith <ashley.smith@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, Ashley Smith <ashley.smith@collabora.com>,
 dri-devel@lists.freedesktop.org (open list:ARM MALI PANTHOR DRM DRIVER),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 0/2] drm/panthor: Scheduler fixes for termination failure
 and timeouts
Date: Tue,  3 Jun 2025 10:49:30 +0100
Message-ID: <20250603094952.4188093-1-ashley.smith@collabora.com>
X-Mailer: git-send-email 2.43.0
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

This patch series includes previously attempted patches to fix panthor
scheduler issues with spurious timeouts and issues when a termination
failed which would lead to a race condition.

---
Changes in v5:
 - Swiched to a patch series to make sure the patch which addresses the
   bug is added as a requirement on the scheduler patch.
Changes in v4:
 - Moved code related to a timeout bug to a separate patch as this
   was not relevant to this change.
Changes in v3:
 - Moved to a patch series to make sure this bug fix happens before the
   changes to the scheduler
Changes in v2:
 - Fixed syntax error

Signed-off-by: Ashley Smith <ashley.smith@collabora.com>
---
Ashley Smith (2):
  drm/panthor: Reset queue slots if termination fails
  drm/panthor: Make the timeout per-queue instead of per-job

 drivers/gpu/drm/panthor/panthor_sched.c | 244 +++++++++++++++++-------
 1 file changed, 177 insertions(+), 67 deletions(-)


base-commit: 9528e54198f29548b18b0a5b343a31724e83c68b
-- 
2.43.0

