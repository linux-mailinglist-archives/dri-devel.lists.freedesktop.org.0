Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6957CB54F46
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 15:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2528D10E1BA;
	Fri, 12 Sep 2025 13:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="P5UoZH71";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE11E10E1BA
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 13:20:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757683240; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Po5/1egBXNp4xGZsrJYA8tKqH+i0iesZWhnWwHVYBtW3lsga1tjt5StUj8j5dueV2H0aGcCn8wa/HPSzsi87zu7v132tO7EVYtCraPFD0nIdpPkq1V2QZspPrtBjp4tty1hlqv/+Tt4UJp993Y6ZqaA13b5IBlHj+tUrCR4uluk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757683240;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=QHndbBCfSJRBzBTzOScCJS2U2fT010SvPmxn2g/i2Q8=; 
 b=idYsgCkK590c+YMoLRlFXP0m52FOqby2v1+aJTGLK39poFt94VBgRaH4HLz2RIRByIt7H2fxUX9KpJynO/bYrHaa2i4PoIgYCRl79ZDYj5kZxYMpfUBxi1/Tp5pTOspDebceBE2++638lsEhCIOaNEF6MkzoGmbq2EpSg7MBjqg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757683240; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=QHndbBCfSJRBzBTzOScCJS2U2fT010SvPmxn2g/i2Q8=;
 b=P5UoZH71qQIt2th13/FDLyMxX5pVD6kw6BfDEZVCE0aO5gWCp4SZ802ObDW/6iRR
 25MOX1CpLomb3LkSj3LJWZ8d/gM1Q2xdNae5E+SLPaLrlana7PYMP2McuPakyqIz1/D
 k90SKrd7fwCiQcdz+PxIeP3zfJI6VqaZP7/EiGwY=
Received: by mx.zohomail.com with SMTPS id 1757683238342162.86189655538965;
 Fri, 12 Sep 2025 06:20:38 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v3 0/4] Introduce Panfrost JM contexts
Date: Fri, 12 Sep 2025 14:19:11 +0100
Message-ID: <20250912132002.304187-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
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
to jobs, but at the moment that includes priorities only.

There's a MR for a Mesa commit series that makes use of these changes:
https://lore.kernel.org/dri-devel/20250904001054.147465-1-adrian.larumbe@collabora.com/

Changelog:
v3:
 - Cut down number of available contexts per file to 64.
 - Conservatively restored JS thread priority back to 8.
 - Rework of the context destruction and scheduler entity release
 logic to avoid races and that no new jobs are run after ctx destruction.
 - Refactor privilege checks when allowing high context priorities.
 - Checked that uapi struct padding fields are zeroed in ioctls

v2:
 - Core and L2 cache affinities are not longer part of the context uAPI
 - Individual JS priorites are no longer possible, and the same context
 priority is applied onto all the JS and scheduler entities.
 - Minor changes in the debugfs knob to reflect all the above.

Boris Brezillon (4):
  drm/panfrost: Introduce uAPI for JM context creation
  drm/panfrost: Introduce JM contexts for manging job resources
  drm/panfrost: Expose JM context IOCTLs to UM
  drm/panfrost: Display list of device JM contexts over debugfs

 drivers/gpu/drm/panfrost/panfrost_device.h |  11 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 150 +++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_job.c    | 195 +++++++++++++++++----
 drivers/gpu/drm/panfrost/panfrost_job.h    |  25 ++-
 include/uapi/drm/panfrost_drm.h            |  50 ++++++
 5 files changed, 391 insertions(+), 40 deletions(-)


base-commit: a3ae3384be7704fcf41279f13190bd8a11204bea
--
2.51.0
