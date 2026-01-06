Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F4CCF980C
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 18:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1833F10E514;
	Tue,  6 Jan 2026 17:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ac9WHcWM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A854010E514;
 Tue,  6 Jan 2026 17:00:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4410B4060D;
 Tue,  6 Jan 2026 17:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933B6C16AAE;
 Tue,  6 Jan 2026 17:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767718826;
 bh=j6SyhV0DiBPLhIKyOsUP3YiiQFRRU3mowYcDweJvUcg=;
 h=From:To:Cc:Subject:Date:From;
 b=ac9WHcWMRAQqDZ1mwneGVHtHvHAaOAtVdUk/Zr7mX+KBRTze/jgDGmysmGDPkOVKg
 REGVkPcnp3whSsSCOk+O9tHrDgLHMN5JRGKylwD5KLUJC6by817m19x+jetZoOd+aG
 CLAZydFal/LeL/99TPDEdD2oEbubIILza1W2vZ7Sx6nxvQ2U1bOeSWmCZpM4fN3Es5
 JNHtJwBLNnE1PkjJrsgCrBH+peh2oR+8Ids/17CAg/2T14PPlVpiC0lUVfzzc//69E
 k3X2up3WXWdkHiT5DLGdnpqHiHTUsbPT5EuCNZbguxAD0L5T4ToChghLCkoNZndTr8
 0E+2WqRvz5clg==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, harry.wentland@amd.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [PATCH 0/2] Add DRM property for panel type
Date: Tue,  6 Jan 2026 11:00:15 -0600
Message-ID: <20260106170017.68158-1-superm1@kernel.org>
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

OLED panels consume a lot less power with darker content.  However
userspace doesn't currently know what kind of panel technology is
used to decide what kind of image to show.

This series introduces a DRM property for the panel type.  Initially
the values are "Unknown" and "OLED" leaving room for expansion later
for other display technologies like MiniLED or LCD if they are sensible
to detect and advertise as well.

A userspace implementation utilizing the new property to decide the
theme of GNOME is available here:

Link: https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/4029

Mario Limonciello (AMD) (2):
  drm/connector: Add a new 'panel_type' property
  drm/amd/display: Attach OLED property to eDP panels

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  7 ++++
 drivers/gpu/drm/drm_connector.c               | 33 +++++++++++++++++++
 include/drm/drm_connector.h                   |  1 +
 include/drm/drm_mode_config.h                 |  4 +++
 include/uapi/drm/drm_mode.h                   |  4 +++
 5 files changed, 49 insertions(+)

-- 
2.43.0

