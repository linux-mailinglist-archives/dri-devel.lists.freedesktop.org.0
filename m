Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483C17BCCD9
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 09:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FCA10E00E;
	Sun,  8 Oct 2023 07:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Sun, 08 Oct 2023 07:02:11 UTC
Received: from sender4-op-o10.zoho.com (sender4-op-o10.zoho.com
 [136.143.188.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DB010E00E;
 Sun,  8 Oct 2023 07:02:11 +0000 (UTC)
Delivered-To: uwu@icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1696747626; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=C+xtT5o59yBKvkvdGWfsavbX9C9diMp9oeuM2seXC0xBHilzTEMbcbDl8F+bS7YIKpV0FBxzZ+653IuTcxRzbYlFzopwj93kXE+rT3Lc8OnkcR3r93Iye0takdyWw1oQIMecthhjfQKUFe1mtVpOFLidnQWmi4+bvAAdN+bWI04=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1696747626;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=weMbYxjBW7zsozDxi0+RJ/KB4wodhcAWuB8NhqMRKDg=; 
 b=FptwODOuGy1vS55C08tnghtAV+SRX8CyOpIxTVlhdejcf4TdqlQC9q03olFvDEVu712+v/LLMK8pdOFk5QBlwmYWTcP8BTtCxfDguP7FgPPz1Xw83VRNMHmE1kmcfpTHnsJVcajdBRZmr3Mg3+hElID14prrTDPKhVoKlgUC10o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1696747626; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
 bh=weMbYxjBW7zsozDxi0+RJ/KB4wodhcAWuB8NhqMRKDg=;
 b=SWMpQ8nHWC6r95ZwSYxNM34L/yEvULe14JVMf5xZ5oFaz9+sSdWwskCl4LSqiX4x
 R5OTDr1iTMhTbjCMoUlU1rD7r+WasUQkHTDem4iq8T+w1msVOCdUrfqf78TL5v3GQbG
 ANxOwA9GfXAaZFbsqeueLrEW2Qjkn4gepp/vnKF56Oxs7yw5aKpq3zafRsXMjRSAKf6
 QRL28gUjTGX1m1hi5i25gbj3e0C4xQCt07c/xjQH8YJ0mrt32OKH5orlcgYqmZRGCGD
 cYX8Lz6CWVcrR+NluTwJCFW7F7H2vgts43LMLghntfsnQ83VrzdGBIIrXCVwMHDjgRV
 I+EZoiGesA==
Received: from edelgard.fodlan.icenowy.me (120.85.97.233 [120.85.97.233]) by
 mx.zohomail.com with SMTPS id 169674762483518.300288135038954;
 Sat, 7 Oct 2023 23:47:04 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shashank Sharma <shashank.sharma@amd.com>,
 Arvind Yadav <arvind.yadav@amd.com>
Subject: [PATCH] drm/amdgpu: fix SI failure due to doorbells allocation
Date: Sun,  8 Oct 2023 14:46:49 +0800
Message-Id: <20231008064649.3184677-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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
Cc: Icenowy Zheng <uwu@icenowy.me>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SI hardware does not have doorbells at all, however currently the code
will try to do the allocation and thus fail, makes SI AMDGPU not usable.

Fix this failure by skipping doorbells allocation when doorbells count
is zero.

Fixes: 54c30d2a8def ("drm/amdgpu: create kernel doorbell pages")
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
index d0249ada91d30..599aece42017a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
@@ -142,6 +142,10 @@ int amdgpu_doorbell_create_kernel_doorbells(struct amdgpu_device *adev)
 	int r;
 	int size;
 
+	/* SI HW does not have doorbells, skip allocation */
+	if (adev->doorbell.num_kernel_doorbells == 0)
+		return 0;
+
 	/* Reserve first num_kernel_doorbells (page-aligned) for kernel ops */
 	size = ALIGN(adev->doorbell.num_kernel_doorbells * sizeof(u32), PAGE_SIZE);
 
-- 
2.39.1

