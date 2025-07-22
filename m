Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA0CB0D0CF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 06:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C3110E5E2;
	Tue, 22 Jul 2025 04:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zm37Brpw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C0C10E5E1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 04:10:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 815F645FFA;
 Tue, 22 Jul 2025 04:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43952C4CEEB;
 Tue, 22 Jul 2025 04:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753157457;
 bh=SO48SSCClsG29iB6kfZExF+7QC9O2KIYl8N/lhW/E3E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zm37BrpwNNJGZf7gdSZ7nb4nX5sBFrgvk543/IQLqHvVXizjVJtPpv8ABkBhAkOfY
 4cS4vYR5s8mRTGGHYSG/7EVVvZt5CgWjyHKes7xXj1Ajmm3NI2MYrhXLKJZ+s+WpQI
 bAEk5d9Q/EHBdrDC8Db62c/qYgPYbfEC0AE/pDxtwv2uQkTMeClBnt48MkTHLryodw
 3m8DUwzm0pQ9Qe0KXUQAjoY6bGN3/S4sh2aSlOWWjVb4r9fvwTbD1ZdkmjKARfJ0Kb
 n2h6eaypw5/TJlm1bvp86GcpQ0eJEAAdCz4U6ym9TTAAOOZPgGj5u8obeSdEEv+TCw
 mnvWDDDWfVv0Q==
From: Mario Limonciello <superm1@kernel.org>
To: David Airlie <airlied@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v5 1/2] fbcon: Stop using screen_info_pci_dev()
Date: Mon, 21 Jul 2025 23:10:50 -0500
Message-ID: <20250722041051.3354121-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722041051.3354121-1-superm1@kernel.org>
References: <20250722041051.3354121-1-superm1@kernel.org>
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

screen_info_pci_dev() relies upon resources being set up for devices
before walking and thus isn't a good candidate for video_is_primary_device()
when called as part of PCI device initialization.

The device argument passed to video_is_primary_device() already has the
necessary information.  Check that directly instead.

Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 arch/x86/video/video-common.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/x86/video/video-common.c b/arch/x86/video/video-common.c
index 4bbfffec4b640..e0aeee99bc99e 100644
--- a/arch/x86/video/video-common.c
+++ b/arch/x86/video/video-common.c
@@ -30,6 +30,8 @@ bool video_is_primary_device(struct device *dev)
 {
 #ifdef CONFIG_SCREEN_INFO
 	struct screen_info *si = &screen_info;
+	struct resource res[SCREEN_INFO_MAX_RESOURCES];
+	ssize_t i, numres;
 #endif
 	struct pci_dev *pdev;
 
@@ -45,8 +47,14 @@ bool video_is_primary_device(struct device *dev)
 		return true;
 
 #ifdef CONFIG_SCREEN_INFO
-	if (pdev == screen_info_pci_dev(si))
-		return true;
+	numres = screen_info_resources(si, res, ARRAY_SIZE(res));
+	for (i = 0; i < numres; ++i) {
+		if (!(res[i].flags & IORESOURCE_MEM))
+			continue;
+
+		if (pci_find_resource(pdev, &res[i]))
+			return true;
+	}
 #endif
 
 	return false;
-- 
2.48.1

