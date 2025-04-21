Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBFEA96084
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 10:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F3810E527;
	Tue, 22 Apr 2025 08:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nppct.ru header.i=@nppct.ru header.b="Dij3bC6l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B8810E26C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 15:09:35 +0000 (UTC)
Received: from mail.nppct.ru (localhost [127.0.0.1])
 by mail.nppct.ru (Postfix) with ESMTP id 271741C0CEA
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 18:09:28 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
 reason="pass (just generated,
 assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:to:from:from; s=dkim; t=1745248167; x=
 1746112168; bh=Mxlmt4OMFp+4CmM5qiqrCkALSFahEOttbOImrEbkWRQ=; b=D
 ij3bC6lGnm6Q3iujMwVbFqCxRts3jzWT0mOGpdPt+L2bfm0AG2hq7YiFU7oInpso
 MpI09cfrTU4wOZGXEnvXscAJP9g8s47MwybKO8m2Kh+niewmrleNMNF/0U0PM/p5
 7Q49UxdlLkRq+2iPEIjkzedEIo2ERzmq+4yt+wV+r0=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
 by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gVpclyEOvpjP for <dri-devel@lists.freedesktop.org>;
 Mon, 21 Apr 2025 18:09:27 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
 by mail.nppct.ru (Postfix) with ESMTPSA id D4DA01C08C3;
 Mon, 21 Apr 2025 18:09:11 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Alexey Nepomnyashih <sdl@nppct.ru>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sasha Levin <sashal@kernel.org>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Friedrich Vock <friedrich.vock@gmx.de>, Victor Zhao <Victor.Zhao@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 stable@vger.kernel.org
Subject: [PATCH] drm/amdgpu: restrict the hw sched jobs upper bound
Date: Mon, 21 Apr 2025 15:09:03 +0000
Message-ID: <20250421150905.732842-1-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 22 Apr 2025 08:06:43 +0000
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

The amdgpu_sched_hw_submission parameter controls the number of hardware
jobs that can be scheduled concurrently per ring. This value is later
multiplied by ring->max_dw to compute buffer offsets or command patch
regions.

If amdgpu_sched_hw_submission is set too high (by user input via module
parameter), the multiplication can overflow, resulting in corrupted memory
offsets or ring buffer overflows.

Clamp amdgpu_sched_hw_submission to a practical upper bound (e.g. 2^16)
to prevent arithmetic overflow when computing ring buffer offsets during
initialization, especially in jpeg_v1_0_start().

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Cc: stable@vger.kernel.org # v5.9+
Fixes: 5d5bd5e32e6e ("drm/amdgpu: restrict the hw sched jobs number to power of two")
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 018dfccd771b..69217a021b0e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2056,6 +2056,10 @@ static int amdgpu_device_check_arguments(struct amdgpu_device *adev)
 		dev_warn(adev->dev, "sched hw submission jobs (%d) must be at least 2\n",
 			 amdgpu_sched_hw_submission);
 		amdgpu_sched_hw_submission = 2;
+	} else if (amdgpu_sched_hw_submission > 65536) {
+		dev_warn(adev->dev, "sched hw submission jobs (%d) is too large\n",
+			 amdgpu_sched_hw_submission);
+		amdgpu_sched_hw_submission = 65536;
 	} else if (!is_power_of_2(amdgpu_sched_hw_submission)) {
 		dev_warn(adev->dev, "sched hw submission jobs (%d) must be a power of 2\n",
 			 amdgpu_sched_hw_submission);
-- 
2.43.0

