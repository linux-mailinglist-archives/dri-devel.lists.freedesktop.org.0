Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E027AAE5FF
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 18:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF0310E053;
	Wed,  7 May 2025 16:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="FaY7K9cT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E1210E053
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 16:07:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1746634047; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iHffJ0Y8NXLOAsVbasAzSVQyUPsYvAUbIb43vbddJ6IqU9RaJwA7XKQiXZCsABwkNUmbI/GaeZL38z5Qv53S09HnlAgPJkh7cZ8SVF4uMeJzLFgHaeUI3bwxM3E0SkGb4GGEk4kMCDON3F9ZPuAYSeMpQ3CPibJdDmlww06UVnA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1746634047;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=VeRE1rp1b8jt+wF2JI9iIDDmMtQzt2VYCRyF+iv1Lus=; 
 b=kLOCY0zyuRpiFcEaI/38vps1D0p+9k6mdLe8z0Y37hqpbdJoDJA37LTOBRvjSX8n3yfs4Qgc4/LhAPACN7bqjCWlA+dSLyHn0zN+uo8ekoDefbcIG+/XYa9RDmt2ORSOWEvXl721zTrOCtqEQQlfwZqBrOrQ0tc5vi4uOOSXJrc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746634047; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=VeRE1rp1b8jt+wF2JI9iIDDmMtQzt2VYCRyF+iv1Lus=;
 b=FaY7K9cTMVorWJI5AoI5RT+px+vVl1V2dLm9PAv1rB8re2M56p52UOZJVx2q81Wm
 YSLhAsk+nyvR5OOhn3wt9bjDnEUqFfFEhoVfwb/rcOZI7Oa0+bfkdyTux2/NMZJSD4l
 As3E9QeQ4VmggllqMY3AJZoEa15Vci/iIDhhfu/A=
Received: by mx.zohomail.com with SMTPS id 1746634044996726.9956872972689;
 Wed, 7 May 2025 09:07:24 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v2 0/3] Panfrost BO tagging and GEMS debug display
Date: Wed,  7 May 2025 17:07:06 +0100
Message-ID: <20250507160713.1363985-1-adrian.larumbe@collabora.com>
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

The differences are minimal. However, Panfrost doesn't have Kernel-only BO's, so all the
functionality that dealt with them has been removed.

The under-discussion Mesa MR that would allow one to test these changes can be found at [2].

The way BO flags is printed is also slightly different.

Discussion of previous version in the series can be found at [3]

Changelog:

v2:
 - Introduced u64_to_user_ptr() for casting user pointers
 - Refined documentation for uAPI bo labelling struct fields
 - Moved panfrost device debugfs struct fields into a single debugfs struct
 - Add BO to debugfs GEMs list right before creating its handle to avoid unnecessary initialised field.

[1] https://lore.kernel.org/dri-devel/20250418022710.74749-1-adrian.larumbe@collabora.com/
[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34224
[3] https://lore.kernel.org/dri-devel/20250424022138.709303-1-adrian.larumbe@collabora.com/T/#t

Adrián Larumbe (3):
  drm/panfrost: Add BO labelling to Panfrost
  drm/panfrost: Add driver IOCTL for setting BO labels
  drm/panfrost: show device-wide list of DRM GEM objects over DebugFS

 drivers/gpu/drm/panfrost/panfrost_device.c |   5 +
 drivers/gpu/drm/panfrost/panfrost_device.h |  15 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  79 ++++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem.c    | 154 +++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h    |  65 +++++++++
 include/uapi/drm/panfrost_drm.h            |  21 +++
 6 files changed, 338 insertions(+), 1 deletion(-)


base-commit: 9ff4fdf4f44b69237c0afc1d3a8dac916ce66f3e
--
2.48.1
