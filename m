Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 703DE299BD0
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 00:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E806EAA5;
	Mon, 26 Oct 2020 23:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC6B6EA9C;
 Mon, 26 Oct 2020 23:53:30 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62A07221FA;
 Mon, 26 Oct 2020 23:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603756410;
 bh=nv0alUetsUhi2J02Q1vOFwER03xPOHSfPLkUcaPHIuQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ky7i+//D/SjiUWPKZD7Vi7t8y7ZHA6RgWrzIAvZCHnz9IpKvoHipkR6pvNlL7Vp3z
 knXLoP90lX1FBmAjGQvN1b7kGYoyp2XpqvnNb4ZctZ7jhh86i8qYKhk7xNzqHV0gop
 g9vgVXN7ZWP5JOFBfl8ZDzsOxMmr2ZuQdOfNlmVk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 068/132] drm/amdgpu: No sysfs,
 not an error condition
Date: Mon, 26 Oct 2020 19:51:00 -0400
Message-Id: <20201026235205.1023962-68-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026235205.1023962-1-sashal@kernel.org>
References: <20201026235205.1023962-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Slava Abramov <slava.abramov@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Luben Tuikov <luben.tuikov@amd.com>

[ Upstream commit 5aea5327ea2ddf544cbeff096f45fc2319b0714e ]

Not being able to create amdgpu sysfs attributes
is not a fatal error warranting not to continue
to try to bring up the display. Thus, if we get
an error trying to create amdgpu sysfs attrs,
report it and continue on to try to bring up
a display.

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
Acked-by: Slava Abramov <slava.abramov@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index a027a8f7b2819..21c56d5b05999 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3275,10 +3275,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 			   msecs_to_jiffies(AMDGPU_RESUME_MS));
 
 	r = sysfs_create_files(&adev->dev->kobj, amdgpu_dev_attributes);
-	if (r) {
+	if (r)
 		dev_err(adev->dev, "Could not create amdgpu device attr\n");
-		return r;
-	}
 
 	if (IS_ENABLED(CONFIG_PERF_EVENTS))
 		r = amdgpu_pmu_init(adev);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
