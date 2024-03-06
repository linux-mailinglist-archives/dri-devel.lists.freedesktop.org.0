Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F757872C69
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 02:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064A310FA61;
	Wed,  6 Mar 2024 01:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="xWcUMi01";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF7910E813
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 01:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709690306;
 bh=NDJHWMFByDMvSMmiIQpuUnrq3/RJFevyjBzAN9KgNjc=;
 h=From:To:Cc:Subject:Date:From;
 b=xWcUMi01dIt7Gnw8Ju2UlKoh3JVJ82I8z55YVnaiYg92ZprRNQIeVQmUz77VlU03c
 qv3y3B3q6hj9x+IoXGWnXMHfQExM5C8IlRxPKxOdVzP4LRtcqn+TpAez88hXamTEKj
 0rnj3llG0amZ+nBpS6fM7/goOCJFQOhsRrM4d8I/d4wdqBWpytgpOYThImqB8N+Iwf
 xfTTX2h3Txfd2J11i1yvoag3ia9iAivAxZGo7i4cIl35XDZPKqTrumtp5/AJdsdXIZ
 cyY6jI9OZTmceQutPhlHWMeAyR9f/Gm2wxeGDTxW846Fyri0p/cTRb2/YQfZkfEo/p
 SadjSk9IE1jgw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id CE8A63780B5F;
 Wed,  6 Mar 2024 01:58:25 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net
Cc: kernel@collabora.com, adrian.larumbe@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Subject: [PATCH v3 0/1] drm/panfrost: Replace fdinfo's profiling debugfs knob
Date: Wed,  6 Mar 2024 01:56:35 +0000
Message-ID: <20240306015819.822128-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.43.0
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

This is v3 of the patch already discussed in [2] and [1]

Changelog:
 v3:
 - Replaced manual kobj initialisation with a device attribute
 - Handle user input with kstrtobool instead of treating it as an uint
 v2:
 - Turned the profile mode atomic variable into a boolean
 - Rewrote the sysfs file's uAPI documentation to make it more generic
 - Improved the casting of the profiling variable inside the Panfrost device structure

[2]https://lore.kernel.org/dri-devel/20240302154845.3223223-2-adrian.larumbe@collabora.com/
[1]https://lore.kernel.org/dri-devel/20240221161237.2478193-1-adrian.larumbe@collabora.com/


Adrián Larumbe (1):
  drm/panfrost: Replace fdinfo's profiling debugfs knob with sysfs

 .../testing/sysfs-driver-panfrost-profiling   | 10 +++++
 Documentation/gpu/panfrost.rst                |  9 ++++
 drivers/gpu/drm/panfrost/Makefile             |  2 -
 drivers/gpu/drm/panfrost/panfrost_debugfs.c   | 21 ----------
 drivers/gpu/drm/panfrost/panfrost_debugfs.h   | 14 -------
 drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       | 41 ++++++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_job.c       |  2 +-
 8 files changed, 57 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-panfrost-profiling
 delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
 delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h


base-commit: e635b7eb7062b464bbd9795308b1a80eac0b01f5
-- 
2.43.0

