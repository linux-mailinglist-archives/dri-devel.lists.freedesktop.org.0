Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD606B818EC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 21:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6C110E064;
	Wed, 17 Sep 2025 19:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="A6bOL42y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9595F10E57A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 19:19:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758136754; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CFXqqsEzdlDQ8CYNVRMfOa69ih4jTFJ6mjpxBhZbKi6RfC3rJsMRGes8ih9GC0diSsqAaqWHxwJC6LQrnhLp/abZdqOCyVMX7avfEULlg3UXLy3bnEUOgISv6MTtEQil46wU+66BGSrfqd9Nzb5gu0Tp8ehNC3dAoqEUWSEuik0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758136754;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=sfusrheosWlV+dZvZITI2LHNCR/+f7VloSWM8+KsWIQ=; 
 b=HnOucdcDGzgfzQim6NOvqBo4KCb8F2kDCKKhNuqXxC/50kc7MS3uPl4Q0075pjBmK16J1KIvklk0sgQyQVrmQofXMBl/rHlz0CEcgq3bh1+fAfI5CbpuWudR6H76MYEtNQHjh7p9v9nrdYTFPeSnIGwQX7zkw0JLfPYIFDeU/Gc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758136754; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=sfusrheosWlV+dZvZITI2LHNCR/+f7VloSWM8+KsWIQ=;
 b=A6bOL42y6MCoxgO3feM6bhS/1Vi+EZ+H4osUFftcDqdXvZ7FnlYFV2ZMMRZcU0C7
 /dQFhIsYxNHf0Opj4cQbJnTsPeXi7rauzRTqcMIVqyuUYWGCNarv02avEBofkPpK64C
 Ask/ye0mnExM/D5gk1Ut7VmBSHYJucU3o5TziebU=
Received: by mx.zohomail.com with SMTPS id 1758136752272980.873728931391;
 Wed, 17 Sep 2025 12:19:12 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v4 0/4] Introduce Panfrost JM contexts
Date: Wed, 17 Sep 2025 20:18:36 +0100
Message-ID: <20250917191859.500279-1-adrian.larumbe@collabora.com>
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

Discussion of the previous patch series revision can be found at:
https://lore.kernel.org/dri-devel/20250912132002.304187-1-adrian.larumbe@collabora.com/

Changelog:
v4:
 - Iterate over all the indices for the scheduler entity array when creating,
 releasing or otherwise destroying a job context, in case someone would want to
 implement compute support in the future.
 - Add R-b tags to other patches.
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
