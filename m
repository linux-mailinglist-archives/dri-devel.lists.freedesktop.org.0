Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24AFA8A7A1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 21:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E887A10E37D;
	Tue, 15 Apr 2025 19:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="c3MPuJj7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2D010E37C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 19:16:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744744569; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jIx/hQPlI9naOuEN2w9nWt+sDRe1p00O1CoGQjnuDL8Ny+FL2Em0Ds+ih8259Io+jN3TSxkz9EoTZNmWktFH1bjGVd/3hJ44UGqnwM6HA24DuJmxGte8rSIYN4k2CzesqZ5sIk/vBN5+b1268Gmr3y1kDOEQ/AH34HhhBh2B8H4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744744569;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=RB+6VwPlFco2XShowQzQ5YIEKg1jbjAFPOl51DJy2gg=; 
 b=hiE2MLjNPOp97s0zKffOAUKTRfCwlSMpqEEaV/LRUFl9O97YZ+cHDsDuspmf12sEqZEhGVIFzBuyGJEfzqNjMYbzE1QBSOY+mHfSEMfHwygxIb0b4I59UM6fHS7z7ETio73jm/XWkkoOhuvwDXIE5O5QB+mXZzvPyGqeTxBWttY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744744569; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=RB+6VwPlFco2XShowQzQ5YIEKg1jbjAFPOl51DJy2gg=;
 b=c3MPuJj7ZeFz7P8jLMHVsNc3WsaRIJoZgBl5ntl5j7jspr8jBVpFgcERMJ3Lb/1C
 Iv7hIiDZf8I4RZ8s54gUzAoozLfs8uf+GGUrMBPmoVZxxJsWNbPSssw7CzIpQ+MagTI
 e84Ax4swon1c9xCYJNaxOFdxBCz8GJDfW6lXciUQ=
Received: by mx.zohomail.com with SMTPS id 1744744567531821.8147122118951;
 Tue, 15 Apr 2025 12:16:07 -0700 (PDT)
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
Subject: [PATCH v8 0/4] Panthor BO tagging and GEMS debug display
Date: Tue, 15 Apr 2025 20:15:34 +0100
Message-ID: <20250415191539.55258-5-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415191539.55258-1-adrian.larumbe@collabora.com>
References: <20250415191539.55258-1-adrian.larumbe@collabora.com>
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
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34224

Discussion of previous revision of this patch series can be found at:
https://lore.kernel.org/dri-devel/20250411150357.3308921-1-adrian.larumbe@collabora.com/

Changelog:
v8:
 - Renamed NULL to NUL in comments describing NUL-terminated strings
 - Removed 'size' parameter from labelling ioctl() as max length can be
   handled by the kernel itself
 - Made sure to use kfree_const() everywhere labels are freed
 - Replaced maximum label size with numerical constant rather than page size
 - Added some warnings and checks in kernel BO labelling function

v7:
 - Improved formating of DebugFS GEM's status and usage flags
 - Deleted some spurious white spaces
 - Renamed usage flags setting function

v6:
 - Replaced some mutex calls with scoped guards
 - Documented data size limits in the label ioctl
 - Simplified GEMS status flags treatment (Panthor doesn't use madvise)
 - Fixed some array size and string bugs
 - Improved the naming of GEM status and usage flags to reflect their meaning
 - Improved the formatting of the output table

v5:
 - Kept case and naming of kernel BO's consistent
 - Increased the driver minor after new ioctl
 - Now adds BO to debugfs GEMs list at GEM object creation time
 - No longer try to hide BO creator's name when it's a workqueue or modprobe
 - Reworked the procedure for printing GEM state and kernel BO flags
 - Turned kernel BO flags and GEM state flags into bit enums
 - Wait until BO state is marked as initialied for debugfs display

v4:
 - Labelled all kernel BO's, not just heap chunks.
 - Refactored DebugGFs GEMs list handling functions
 - Added debugfs GEMS node mask to tell different kinds of BO's

Adrián Larumbe (4):
  drm/panthor: Introduce BO labeling
  drm/panthor: Add driver IOCTL for setting BO labels
  drm/panthor: Label all kernel BO's
  drm/panthor: show device-wide list of DRM GEM objects over DebugFS

 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_device.h |  11 ++
 drivers/gpu/drm/panthor/panthor_drv.c    |  90 ++++++++-
 drivers/gpu/drm/panthor/panthor_fw.c     |   8 +-
 drivers/gpu/drm/panthor/panthor_gem.c    | 233 ++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gem.h    |  80 +++++++-
 drivers/gpu/drm/panthor/panthor_heap.c   |   6 +-
 drivers/gpu/drm/panthor/panthor_sched.c  |   9 +-
 include/uapi/drm/panthor_drm.h           |  20 ++
 9 files changed, 451 insertions(+), 11 deletions(-)

--
2.48.1
