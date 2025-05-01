Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ED2AA6534
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 23:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0756510E87C;
	Thu,  1 May 2025 21:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hO8b29nx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC0910E87C;
 Thu,  1 May 2025 21:17:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F08065C4952;
 Thu,  1 May 2025 21:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC97C4CEE3;
 Thu,  1 May 2025 21:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746134261;
 bh=ezi9K3Epx60pZdQ7FxZyZ9yVvMN3Di0TUurJQagcf74=;
 h=From:To:Cc:Subject:Date:From;
 b=hO8b29nxu3zuNtZftjLJYD7Ty2mb09NntcFBmVqcgx8ustUAecnsJy8ygRWprSVKx
 dtgs8wigxH91xwGtU9iH6CytaoXBK9VUexlp4yaIF/rBtr5cU6C9+x2t2kfFSbtzZo
 643LL3pB+LM71mBK/YwvnNTeevbOupjYUzKDjpLaHRnEkP4Qqvk4sLyZCXMfSdXjgw
 /bHhUtfen3lETp2K/VRpJn2esqsHN8k2zYa5+HEbg0oMF79oibHa6St/pQdIM9eM7T
 I6r/6SSqxK2BUhExv2wO/+UMA1cUhktLwFBFUEIyXXJxd2AHnuo82RtQmFwMxq2Jjy
 +aZg+6z+BjI6g==
From: Mario Limonciello <superm1@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-pm@vger.kernel.org (open list:HIBERNATION (aka Software Suspend,
 aka swsusp)), Mario Limonciello <mario.limonciello@amd.com>
Subject: [RFC 0/2] Evict VRAM after processes are frozen
Date: Thu,  1 May 2025 16:17:31 -0500
Message-ID: <20250501211734.2434369-1-superm1@kernel.org>
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

From: Mario Limonciello <mario.limonciello@amd.com>

As part of the suspend and hibernate sequences devices supported
by amdgpu will have VRAM evicted.  This has been littered with problems
in the past, and now it is called strategically at multiple times
during power management sequences.

Most recently there were a number of issues reported that were root caused
to physical memory pressure at suspend time where VRAM couldn't be evicted.
A new call was introduced using a PM notifier before swap was turned off
so that even if there are physical memory pressures VRAM could still be
evicted into swap.

This helped, but users using older systemd noted that this could lead to a
deadlock.  This is because user processes aren't frozen by older versions
of systemd and thus if a game is running it could potentially be creating
BOs during the eviction thus preventing eviction from ever completing.

This isn't an issue with newer systemd because it uses cgroup freezing
to freeze user processes. Nonetheless this isn't a good behavior to rely
upon for userspace, so this series aims to solve the problem in another way.

Introduce new PM notifier calls after "prepare" notifier is done AND after
tasks have been frozen.  amdgpu listens to these PM notifier calls and
will run the first eviction at this time.

Mario Limonciello (2):
  PM: Add suspend and hibernate notifications for after freeze
  drm/amd: Use suspend and hibernate post freeze notifications

 Documentation/driver-api/pm/notifiers.rst  | 19 ++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 ++--
 include/linux/suspend.h                    | 14 ++++++++------
 kernel/power/hibernate.c                   |  9 +++++++--
 kernel/power/suspend.c                     | 13 +++++++++----
 5 files changed, 42 insertions(+), 17 deletions(-)

-- 
2.43.0

