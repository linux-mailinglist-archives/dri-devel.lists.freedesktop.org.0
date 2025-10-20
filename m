Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4770ABF289B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 18:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5775310E482;
	Mon, 20 Oct 2025 16:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V31gZRXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33A710E482;
 Mon, 20 Oct 2025 16:53:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 731634349F;
 Mon, 20 Oct 2025 16:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF85FC4CEF9;
 Mon, 20 Oct 2025 16:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760979209;
 bh=lSpNsv9v6YOmH4+DfxjS+7hp9aTjSqVplCul5KPB2Rg=;
 h=From:To:Cc:Subject:Date:From;
 b=V31gZRXYFgWtn+tcQgu3Ix3cijzMWjCCuedzMlAUgG36jMV+EOpmTXGIROWsVJK7A
 Ia5oMtvHMQVWIYj5DzoSS/o8hM1gd3jlxeHztxtZDzZhdEK16sdYjHak7bjW4aIUnd
 vEGQickJhtw7i14VcYniLON+eSRsFCeE8aJnF6wR9ybL9bSbB3l0BBCBjRbUfm/Rkj
 h51tiFm8TsweNPRwSlVUtv8/3e6fe6Ap/IW4kbO/IhMRhGlxI2gtMofKh1x0t1iTXk
 zO5YcEWzyvcETckzniGqPJAXbt08wu4CQ6uV2XDROtaaE4Ps5RvHFci6GDfdbe4YLO
 5glPNahM29RFg==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, dakr@kernel.org, gregkh@linuxfoundation.org,
 lenb@kernel.org, pavel@kernel.org, rafael@kernel.org, simona@ffwll.ch
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Subject: [RFC 0/3] Fixups for cancelled hibernate
Date: Mon, 20 Oct 2025 11:50:46 -0500
Message-ID: <20251020165317.3992933-1-superm1@kernel.org>
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

Muhammad Usama Anjun's recent series for being able to cancel
the hibernate sequence [1] exposes a bug with amdgpu handling for
skipping the thaw step.

Because the thaw step is skipped in most cases, cancelling the
hibernate means that the device is left in an inconsistent
state.

To fix this allow devices to return -EBUSY and adjust the PM
core handling of this case.

Link: https://lore.kernel.org/all/20251018142114.897445-1-usama.anjum@collabora.com/ [1]
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
Mario Limonciello (3):
  PM: Mark device as suspended if it failed to resume
  PM: Don't pass up device_resume() -EBUSY errors
  drm/amd: Return -EBUSY for amdgpu_pmops_thaw() on success

 drivers/base/power/main.c               | 7 ++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.43.0

