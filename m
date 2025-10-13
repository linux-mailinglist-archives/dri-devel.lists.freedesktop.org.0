Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C30FBD5A27
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 20:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9290B10E0C1;
	Mon, 13 Oct 2025 18:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gyHaMzwl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70DD10E0C1;
 Mon, 13 Oct 2025 18:04:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8FDE961608;
 Mon, 13 Oct 2025 17:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC636C19423;
 Mon, 13 Oct 2025 17:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760377702;
 bh=rDKkST9tqltd0Ny8fDT010gtFjkEG2+9tPi6uazi6LU=;
 h=From:To:Cc:Subject:Date:From;
 b=gyHaMzwlTgMJtX2fHdfT0YV+acAVS/02MFd3ytPgYy96cSpAXOWb4KPRfOR72owXz
 goCKHn6oy+vkgfNj+QCBEENnIRM6oUzFjTA4oxnqf2llo1kAboxjSDQQf9IUbhexdU
 EZX3Gskx/LvKWFDVOeW+koGCJfIuzfZnsJz1zdtrXdvt5YLYFnShF9H3dyz0uKNfo2
 6OTWf/hw3eRkjXHnZNG6XhR5yI0T9ypsACxzHRzyyJoEyuviQP9Ve+QeUrwkImyhGD
 PNsyGuN5Ny3IkNU9XxDzkDefr/YXDQlipuZzHq6FnaMrpiKhSiTH+bRJzzc6yb0ZSB
 K0KxJB10QXFTQ==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, dakr@kernel.org, gregkh@linuxfoundation.org,
 lenb@kernel.org, pavel@kernel.org, rafael@kernel.org, simona@ffwll.ch
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Subject: [RFC PATCH 0/3] Skip thaw sequence for all devices, not just amdgpu
Date: Mon, 13 Oct 2025 12:47:08 -0500
Message-ID: <20251013174729.1101186-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
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

As part of looking at the hibernate code recently again I was considering
whether we really need the thaw stage at all when things are working well.

So I wanted to explore what breaks if we just skip it.  This should speed
up the S4 sequence since nothing needs to resume.

If we do this we can drop the special cases in amdgpu and the exported
symbols too.

Mario Limonciello (3):
  PM: hibernate: Nominally skip thaw sequence for all devices
  drm/amd: Drop special cases for thaw() callback
  PM: Drop pm_hibernate_is_recovering() and
    pm_hibernation_mode_is_suspend()

 drivers/base/power/main.c               | 20 ++++++--------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  4 ----
 include/linux/suspend.h                 |  8 --------
 kernel/power/hibernate.c                | 24 ++++++++++--------------
 kernel/power/user.c                     |  3 +++
 5 files changed, 19 insertions(+), 40 deletions(-)

-- 
2.43.0

