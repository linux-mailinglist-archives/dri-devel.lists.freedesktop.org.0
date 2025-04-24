Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C63A99EBF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 04:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9135F10E2E1;
	Thu, 24 Apr 2025 02:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="DOS53LJm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A091F10E70B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 02:21:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1745461310; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HS+JIbwettNsea9n6EpYGog1DWJpy+n3pI8g6zpGFAQishCECEtJ9E0jzVW5CTXzx9zVO7S1xt8YSwSJJ18oelcWxIzU2peU4vvW00g2Rxgh1WXjP+gSAXatDCGUj6XWxl/cj4XoKIi5frIScsJRzIrQ6YP8QOSflvIH48+i6Sc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1745461310;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IFiWuHh+UYKiZ42ck1JhhLNyYdFv0tjwhkuTB826oeo=; 
 b=PRcXuoReQNepsnfNMTB4RGHmBao6x1KIKmSByzr0xoQmdZjIubaLXTqAlYMJQ1PqGT/Kd8b2ph0Dt0b3Vl3FLZ1YHk7MciY8oojyX8y1Re2UJKOEY7EMbi+vYo2OVbVJnklIuAesdCZYxlKnUXf2wZL48DGVMUurRrfp8E6UvNE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745461310; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=IFiWuHh+UYKiZ42ck1JhhLNyYdFv0tjwhkuTB826oeo=;
 b=DOS53LJmKb6UGjzyM8mpnwFGgm80jYPJlgk2ftniE8bI2fQadrqTKScxZw+1iU0b
 dZKmR1gAFSfrIdEkvC4wfxuXSnQxHhFpS0VLWlgGPasjoUjozYLgbsSwxk+kBSBTB6R
 tKmM92pqZI2U826re5wfUO58VBYCByzsK8ffE56U=
Received: by mx.zohomail.com with SMTPS id 1745461309172606.1112618542678;
 Wed, 23 Apr 2025 19:21:49 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH 0/3] Panfrost BO tagging and GEMS debug display
Date: Thu, 24 Apr 2025 03:21:29 +0100
Message-ID: <20250424022138.709303-1-adrian.larumbe@collabora.com>
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

[1] https://lore.kernel.org/dri-devel/20250418022710.74749-1-adrian.larumbe@collabora.com/
[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34224

Adrián Larumbe (3):
  drm/panfrost: Add BO labelling to Panfrost
  drm/panfrost: Add driver IOCTL for setting BO labels
  drm/panfrost: show device-wide list of DRM GEM objects over DebugFS

 drivers/gpu/drm/panfrost/panfrost_device.c |   4 +
 drivers/gpu/drm/panfrost/panfrost_device.h |  11 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  81 ++++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem.c    | 156 +++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h    |  76 ++++++++++
 include/uapi/drm/panfrost_drm.h            |  20 +++
 6 files changed, 347 insertions(+), 1 deletion(-)


base-commit: a3707f53eb3f4f3e7a30d720be0885f813d649bb
--
2.48.1
