Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811E0C2C898
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C1B10E209;
	Mon,  3 Nov 2025 15:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CqtF9H1a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9191410E1FF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762182122;
 bh=+l8R7qACMN0Y1ot9h+N7aItHecQwG6rW9RotG5PS9Rc=;
 h=From:To:Cc:Subject:Date:From;
 b=CqtF9H1ahKvIF3MLT4HDW/PBVmgI3jbMlqp0VPwyJuT84Scjp7r/Hp3o56gYAGnIk
 a05X9obqkRmmo5Zxuq3a5E7GfreKLVAK1c7LgI2ab4G13U+VgqVbC73vYZ1NtzNbca
 ePMMrt1yx2JzqHolZ+dtlzC77iQAMYZ1yvUdz6q3CCytqm/r7rPl5TWVHe/D6u+Ill
 Fetx918H4QY2NbYjYEuNHLMmdzIJQJaMygg8G0LKprcSbIkGQk4/3kVXH8RO8Z+P6J
 KSx5oG6DL+5YIGCqal5M976ZSllHwkxBZcIXrdaO4jisjs41NVz0P0HD1xPUSoHPf5
 4+DERyeshRo+Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D63C17E1340;
 Mon,  3 Nov 2025 16:02:01 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>, kernel@collabora.com
Subject: [PATCH v6 0/2] drm/panthor: Scheduler fixes for termination failure
 and timeouts
Date: Mon,  3 Nov 2025 16:01:52 +0100
Message-ID: <20251103150154.31056-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
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

This patch series includes previously attempted patches to fix panthor
scheduler issues with spurious timeouts and issues when a termination
failed which would lead to a race condition.

Changes in v6:
 - Re-order changes
 - Dropped the Fixes tag on one patch
 - Cover UAF situation when the timeout work is pending/running at group
   destruction time
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

Ashley Smith (2):
  drm/panthor: Make the timeout per-queue instead of per-job
  drm/panthor: Reset queue slots if termination fails

 drivers/gpu/drm/panthor/panthor_sched.c | 299 +++++++++++++++++-------
 1 file changed, 218 insertions(+), 81 deletions(-)

-- 
2.51.1

