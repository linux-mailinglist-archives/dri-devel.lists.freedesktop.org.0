Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D083CA63793
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 22:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C7C897FB;
	Sun, 16 Mar 2025 21:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Gmakg9V2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (unknown [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC44D10E103
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 21:52:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742161946; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JowPB6SIVkG4fTsYXcWiZOcFNiOP+d/ysK9ktZeLTZN95vLDS7o3MWOByno/J7vWNdhsA/WW5NimYnanClM6nUo/FHbEPM85qkyfZdV5moU4ANkAci7dI4YSnjWLLTw3o6pe3+mpREjnZYuyUtj2+ZlEnd392ylfb/GLuRvB0M0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742161946;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=aAicki8o0dcPGsCDGnk1JMD1P/KiyJERoLKGn0P0zSQ=; 
 b=JFYv28ixUE6Wb9DiogMSrhR1oNqNgdTXEhYTgPJHsWMXONEyOEECaDP1z+DCeBuDUZCbr3I8iQRCFzGXhXIxApqUH/UQSBG66q2guaJ3tXThRDxzOyAb1pZaauyXqWkkvt1FCmpDk5/ZAf7oOgKTYgjM6hc8jhubNHeVxAM1rEA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742161946; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=aAicki8o0dcPGsCDGnk1JMD1P/KiyJERoLKGn0P0zSQ=;
 b=Gmakg9V2GZDEiyYvzE35WtJ3yXYfXZ6Xl0ETCPkClguUeSXqooWlRTQcsfcRyJhI
 teejeRY3XNdH4VoP8kwGhHqOfNSIPZmkztnhY8BiCrF45mr+RcAJMXdLTgBOXSRQLcS
 kTUy4nPErkA6R0JdmrU/ZjjFye1VajqY06popXzU=
Received: by mx.zohomail.com with SMTPS id 1742161944404241.90075270214368;
 Sun, 16 Mar 2025 14:52:24 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Panthor BO tagging and GEMS debug display
Date: Sun, 16 Mar 2025 21:51:31 +0000
Message-ID: <20250316215139.3940623-1-adrian.larumbe@collabora.com>
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

This patch series is aimed at providing UM with detailed memory profiling
information in debug builds. It is achieved through a device-wide list of
DRM GEM objects, and also implementing the ability to label BO's from UM
through a new IOCTL.

The new debugfs file shows a list of driver DRM GEM objects in tabular mode.
To visualise it, cat sudo cat /sys/kernel/debug/dri/*.gpu/gems.
To test this functionality from UM, please refer to this Mesa patch series:

https://gitlab.collabora.com/alarumbe/mesa/-/commits/bo-tagging-panthor-gl

Adrián Larumbe (4):
  drm/panthor: Introduce BO labeling
  drm/panthor: Add driver IOCTL for setting BO labels
  drm/panthor: show device-wide list of DRM GEM objects over DebugFS
  drm/panthor: Display heap chunk entries in DebugFS GEMS file

 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_device.h |   8 ++
 drivers/gpu/drm/panthor/panthor_drv.c    |  57 +++++++++++
 drivers/gpu/drm/panthor/panthor_gem.c    | 119 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_gem.h    |  34 +++++++
 drivers/gpu/drm/panthor/panthor_heap.c   |  15 +++
 include/uapi/drm/panthor_drm.h           |  14 +++
 7 files changed, 252 insertions(+)

--
2.48.1
