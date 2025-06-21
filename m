Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BF2AE29D3
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 17:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5585210E2CA;
	Sat, 21 Jun 2025 15:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hZkbo5fw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC39C10E2D1;
 Sat, 21 Jun 2025 15:27:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6205343DBB;
 Sat, 21 Jun 2025 15:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCFBC4CEE7;
 Sat, 21 Jun 2025 15:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750519625;
 bh=CvCERDEzn3syglXj16wieN007k8bSRG02FREjtN9NmM=;
 h=From:To:Cc:Subject:Date:From;
 b=hZkbo5fwCYRutqdBZLR2xzzT+VrzIwWDPRmnpeT1QDL/eaf0+Pbl7CkCESbMx+FRJ
 FklzA7slcjMxyN3DiBFjL6MSBxHJDmCXZ+6RE1NSfaXrGPBJhsnj5fRwa2jrJvcQfy
 +CWT1+9c3YHTMrZvJg19WT3daMgwEPxOwRLh/JaM/mXnJljkmVYaChmeGkOxTo/w2Y
 yi54ao/sOsW7Fz8iaD50r3eDJqqsfX/WS/8I2bxsBqj64FICPKlZZI4Wp8ut2cWKXv
 C+NlUNK8Jv2KT32UaNNTCSClY1lVXqKj76nLOnKYa+cJgEhN51gY0VOslCnuvz3S8j
 0DKUvQKqpvPYg==
From: Mario Limonciello <superm1@kernel.org>
To: amd-gfx@lists.freedesktop.org,
	Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 Sean Paul <seanpaul@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v5 0/2] Add support for 'power saving policy' property
Date: Sat, 21 Jun 2025 10:26:55 -0500
Message-ID: <20250621152657.1048807-1-superm1@kernel.org>
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

During the Display Next hackfest 2024 one of the topics discussed
was the need for compositor to be able to relay intention to drivers
that color fidelity is preferred over power savings.

To accomplish this a new optional DRM property is being introduced called
"power saving policy".  This property is a bit mask that can be configured
with requests of "Require color accuracy" or "Require low latency"
that can be configured by the compositor.

When a driver advertises support for this property and the compositor
sets it to "Require color accuracy" then the driver will disable any power
saving features that can compromise color fidelity.

In practice the main feature this currently applies to is the
"Adaptive Backlight Modulation" feature within AMD DCN on eDP panels.

When the compositor has marked the property  "Require color accuracy" then
this feature will be disabled and any userspace that tries to turn it on
will get an -EBUSY return code.

Compositors can also request that low latency is critical which in
practice should cause PSR and PSR2 to be disabled.

When the compositor has restored the value back to no requirements then
the previous value that would have been programmed will be restored.

This was previously accepted at version 4 but reverted because userspace
didn't have a matching implementation.
One was now created for KDE:
 * https://invent.kde.org/plasma/kwin/-/merge_requests/6028

There was also a bug reported that Xorg crashed with this change. It's
fixed by this PR:
 * https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu/-/merge_requests/102

Mario Limonciello (2):
  drm: Introduce 'power saving policy' drm property
  drm/amd: Add power_saving_policy drm property to eDP connectors

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 52 +++++++++++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
 drivers/gpu/drm/drm_connector.c               | 49 +++++++++++++++++
 include/drm/drm_connector.h                   |  2 +
 include/drm/drm_mode_config.h                 |  5 ++
 include/uapi/drm/drm_mode.h                   |  9 ++++
 7 files changed, 118 insertions(+), 5 deletions(-)

-- 
2.43.0

