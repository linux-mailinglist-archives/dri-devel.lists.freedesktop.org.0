Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A3FB89A0F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 15:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD9510E9C5;
	Fri, 19 Sep 2025 13:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FJzxxWtW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77DC10E9C5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 13:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/grIeRzG1itsRgeguHkGdHVORJFMAIBu+z8kt+JNjms=; b=FJzxxWtW7WPy97i8nZD9Jyh9NK
 mFOqusRqPohT+aa8SJxCffx20+Sq3xLnkfr8wydvz8TdOOOK0y8XgsRwpyT5CrIqcUlFS/Ll/FEFk
 CosEThwyQatVxZV7FmZKEYThWLcO/mXEGCf0R2mRiMrYyfHjyr4jmdV04SWld+7JmGn/mz2AdxD6h
 M/Cwc6UFK+293E3MyEuYz/c7UeleSUFc1q0vJOK5N18WXV0qdiEC3gfL61n3NMpixNmHsOct+898X
 mdqnJ/YKst7chBUDeOd+v5kylhlcmhJdp0rJp3W4S8sIpFPmIbIF2ZBEkWd9uarlsxhrMLt4fmazR
 BFVf8eBw==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uzaxd-00E6Nb-Ve; Fri, 19 Sep 2025 15:15:38 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 0/4] Some small TTM cleanups
Date: Fri, 19 Sep 2025 14:15:26 +0100
Message-ID: <20250919131530.91247-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some small cleanups, nothing intentionally functional. It is mostly about
applying some consistency to when to use a local variable to cache something,
when not, and making the code use the ones already there.

Tvrtko Ursulin (4):
  drm/ttm: Make ttm_bo_init_validate safe against ttm_operation_ctx
    re-ordering
  drm/ttm: Resource cannot be NULL in ttm_resource_intersects
  drm/ttm: Tidy ttm_operation_ctx initialization
  drm/ttm: Tidy usage of local variables a little bit

 drivers/gpu/drm/ttm/ttm_bo.c       | 64 +++++++++++++++---------------
 drivers/gpu/drm/ttm/ttm_bo_util.c  | 57 ++++++++++++--------------
 drivers/gpu/drm/ttm/ttm_bo_vm.c    | 12 +++---
 drivers/gpu/drm/ttm/ttm_device.c   |  5 +--
 drivers/gpu/drm/ttm/ttm_pool.c     | 26 ++++++------
 drivers/gpu/drm/ttm/ttm_resource.c | 14 ++-----
 drivers/gpu/drm/ttm/ttm_tt.c       |  2 +-
 7 files changed, 83 insertions(+), 97 deletions(-)

-- 
2.48.0

