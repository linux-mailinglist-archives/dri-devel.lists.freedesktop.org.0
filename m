Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBFEABE213
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 19:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE18A10E5D0;
	Tue, 20 May 2025 17:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="X/76UiXD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AB810E5D0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 17:47:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747763231; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=g2ZgPRe4cmwfprE1HFXQDwWM8b4dswdWxsh4WHpAc0CJRtEvE491IC1hHfOaXUdIpoRos0ev5r0oRShCAZqmBkXLRxQD62Hv5pPG7XL937NCWVmDFz5rM5B67IZiD8WrJ2+f88HY4S2QJmMAZnAJp+k5gL4QIvGj9PcSCEE8yDw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747763231;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=aDQ6SrXga+RCXednZeIiLfUktB4Ek6GiCF/l39MvB0s=; 
 b=hVo+c2BpqyBR5Mo3SdYfFm1miWFHzIt8oKM4fT3VrA9Z1QJ2+HXcAlLeiAH5qXHX68cPwuZdV4BPT3MQ0wX8XIbDxpNo00DbNEfdKqpy6xT4WpPo1hgYw3j8EbmG/aLUrBcc5QaOPsm095d6xWnDjSlYTasRjC093STaZ7N4/W8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747763231; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=aDQ6SrXga+RCXednZeIiLfUktB4Ek6GiCF/l39MvB0s=;
 b=X/76UiXDYv1i0WAvYAixIIAeq+Wk5j3M8Lr0nbmSjpDFH/SnWFYnbW7DfrkvrwlB
 TkHNjTeDS1Z4und6Kk2zi6zjPT2Ex7cCgj5B7PhwGWmE5vI0CcnoW2drddZHYBPo0Qv
 8S3g8S5SwmxAf9D3gvL5GQ6lLaO66yMgOuB8Slp4=
Received: by mx.zohomail.com with SMTPS id 1747763230355850.4262977073449;
 Tue, 20 May 2025 10:47:10 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v3 0/5] Panfrost BO tagging and GEMS debug display
Date: Tue, 20 May 2025 18:43:57 +0100
Message-ID: <20250520174634.353267-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
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

This patch series is a Panfrost port of the already merged patches
previously discussed at [1].

The differences are minimal. In this latest revision, the notion of internal BOs, akin to
that of Panthor kernel-only BO's has been introduced, so that the perfcnt sample buffer and
imported PRIME objects can be given a tag.

The under-discussion Mesa MR that would allow one to test these changes can be found at [2].

The way BO flags is printed is also slightly different.

Changelog:

v3:
 - Fixed spelling of Panfrost device pointer variable names
 - Fixed invalid memory access bug when freeing Panfrost GEM objects for PRIME imported buffers
 - Added function for internally tagging BOs (mainly for the perfcnt sample buffer)
 - Added new commit for fixing Panfrost Device variable spelling mistakes.
v2:
 - Introduced u64_to_user_ptr() for casting user pointers
 - Refined documentation for uAPI bo labelling struct fields
 - Moved panfrost device debugfs struct fields into a single debugfs struct
 - Add BO to debugfs GEMs list right before creating its handle to avoid unnecessary initialised field.

[1] https://lore.kernel.org/dri-devel/20250507160713.1363985-1-adrian.larumbe@collabora.com/
[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34224

Adrián Larumbe (5):
  drm/panfrost: Add BO labelling to Panfrost
  drm/panfrost: Internally label some BOs
  drm/panfrost: Add driver IOCTL for setting BO labels
  drm/panfrost: show device-wide list of DRM GEM objects over DebugFS
  drm/panfrost: Fix panfrost device variable name in devfreq

 drivers/gpu/drm/panfrost/panfrost_devfreq.c |   4 +-
 drivers/gpu/drm/panfrost/panfrost_device.c  |   5 +
 drivers/gpu/drm/panfrost/panfrost_device.h  |  15 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c     |  79 ++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem.c     | 186 ++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h     |  66 +++++++
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c |   2 +
 include/uapi/drm/panfrost_drm.h             |  21 +++
 8 files changed, 375 insertions(+), 3 deletions(-)


base-commit: 9ff4fdf4f44b69237c0afc1d3a8dac916ce66f3e
--
2.48.1
