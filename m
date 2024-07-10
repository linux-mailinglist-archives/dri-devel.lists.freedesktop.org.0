Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66DE92D306
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 15:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815F110E7BC;
	Wed, 10 Jul 2024 13:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QIGXE8qi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F4410E7BB
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 13:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zgwl6AI/xqmYCYHW3RGVDzdf2RHyRP7mz/Wo4sjK/Rg=; b=QIGXE8qiMupmojXAZ9adKZyU52
 Xci3H4qMaOQgGx6xnAH3C3gASoVyNdGZeVsKeljVu2IZFe1ZjVP4wk6PhAVIzGNkM35CPRiIpVx9d
 SJ/LeU27+DqZVDaahOCSaumC5Dsxvv2FpaEeqdckFnV1PD6gK8tj7T/M0TYrL19/0VzvGlYGzz5jR
 od32layZbZm2LpVGHmeynOBgtiYFnxAfG3wKAsYIJEZFp8HuzSJnHN/DHki9LCfdrpZ0wnbdumt0D
 xWZZFIzlOIpo0ddRQnHR+q0bQqh1qG0gIejHdzFVBDIIpo+L+o/kuvKOR2MQAWFr1aJ3Gnk46riGA
 Qdz2SfvA==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sRXZd-00DH0j-Lt; Wed, 10 Jul 2024 15:41:33 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v2 00/12] v3d: Perfmon cleanup
Date: Wed, 10 Jul 2024 14:41:18 +0100
Message-ID: <20240710134130.17292-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

When we had to quickly deal with a tree build issue via merging
792d16b5375d ("drm/v3d: Move perfmon init completely into own unit"), we
promised to follow up with a nicer solution.

As in the process of eliminating the hardcoded defines we have discovered a few
issues in handling of corner cases and userspace input validation, the fix has
turned into a larger series, but hopefully the end result is a justifiable
cleanup.

v2:
 * Re-order the patches so fixes come first while last three are optional
   cleanups.

Tvrtko Ursulin (12):
  drm/v3d: Prevent out of bounds access in performance query extensions
  drm/v3d: Fix potential memory leak in the timestamp extension
  drm/v3d: Fix potential memory leak in the performance extension
  drm/v3d: Validate passed in drm syncobj handles in the timestamp
    extension
  drm/v3d: Validate passed in drm syncobj handles in the performance
    extension
  drm/v3d: Move part of copying of reset/copy performance extension to a
    helper
  drm/v3d: Size the kperfmon_ids array at runtime
  drm/v3d: Do not use intermediate storage when copying performance
    query results
  drm/v3d: Move perfmon init completely into own unit
  drm/v3d: Align data types of internal and uapi counts
  drm/v3d: Add some local variables in queries/extensions
  drm/v3d: Prefer get_user for scalar types

 drivers/gpu/drm/v3d/v3d_drv.c                 |   9 +-
 drivers/gpu/drm/v3d/v3d_drv.h                 |  16 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c             |  44 +--
 .../gpu/drm/v3d/v3d_performance_counters.h    |  16 +-
 drivers/gpu/drm/v3d/v3d_sched.c               | 106 ++++---
 drivers/gpu/drm/v3d/v3d_submit.c              | 285 ++++++++++--------
 6 files changed, 281 insertions(+), 195 deletions(-)

-- 
2.44.0

