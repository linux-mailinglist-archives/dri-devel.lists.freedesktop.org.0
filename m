Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB37C51A103
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 15:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B642B10EC98;
	Wed,  4 May 2022 13:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687B310EC90;
 Wed,  4 May 2022 13:36:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oH2mo6hXcBgq2UUcrcl6d4SlY7U5yZEiWYkZH2u3HYi9Ru8FaNxi3wF0YFWimzOJ3ON2gk8x+YlsxBBtk5G88BsmK73NzZOEPtOR1ueZyi8qOmIY3l4u6XYA8K7T1cyGcVPCEPSJ3/PzL0S6+aeuqTZ2q81kWDXhY0eRvX5a1mXmu6FjC4neN3rKoF/i7PCbu2ORafuo0syU1WffznXruQIk9FNe809on/H/6tkXG7hrzojsa5sW/Rynb1kRqlZgXjMZTuPt6zeEY6hrL5RHTafnkzjjTACbSM2uYNISb4ZTPnFnHIfPnGgn9zkcuSrefNrmsruzc9/jFnJzZUbM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNEwRkM/oeT/JZA1BHdLz+fGM1EKplmX67+VQp95irA=;
 b=ChyCw9MIy7x2W9ny2zRntOAtOwLl6110JVz2kEyeSRtzYIwd/SxG4CrDLbFv/jT7fge370rqryg2OksZBqm80qiH2WCt9ft1dRVANDHP9V5Q3EUH0SlyNScc0O7iX0RRqd3VjvX/Ju1uK0navUuetVzVoN+GShC/HAagB1Zb7vTJWpjRFmy6pbuKvBf8DTO8D0Xf/VOOmNHOlJmB06TPzseUAkRtYA0l0T02h9mkSZ5XYnbl6Exy958fUXgmb8gH1JvgSI6AIKeM0iAjQK3moTLJCPhXzQNqNQFMudGlKdP6D54D7e6kiJ+tKtweOLsJmP3mGUmu8kUuStWcvx+EsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNEwRkM/oeT/JZA1BHdLz+fGM1EKplmX67+VQp95irA=;
 b=FjLVPG3Zn1bvSJFqA5TbzopLRid+QABmNzE6h9RHQHINR59OnYpUay86n+24m9PtdigiIcqU4y7hR+DsGhOGM3N6/TPQ22TE4jwYkvc6D8vB+B9bLb7hrLQu7ll1cjdeDwmqYcD6mvM6WT5mUfE9iunfEYzd1TAlEPKCZtXpKgM=
Received: from DS7PR03CA0227.namprd03.prod.outlook.com (2603:10b6:5:3ba::22)
 by DM5PR12MB1163.namprd12.prod.outlook.com (2603:10b6:3:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 4 May
 2022 13:36:31 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::98) by DS7PR03CA0227.outlook.office365.com
 (2603:10b6:5:3ba::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25 via Frontend
 Transport; Wed, 4 May 2022 13:36:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 13:36:31 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 08:36:30 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] Revert "fbdev: fbmem: add a helper to determine if an
 aperture is used by a fw fb"
Date: Wed, 4 May 2022 09:36:18 -0400
Message-ID: <20220504133618.1670080-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504133618.1670080-1-alexander.deucher@amd.com>
References: <20220504133618.1670080-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b69d8bc-34f6-4ea6-ac34-08da2dd319a9
X-MS-TrafficTypeDiagnostic: DM5PR12MB1163:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1163B9319B9A4A5D161CE332F7C39@DM5PR12MB1163.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJtC6+MhpAv+XDu+ptUQ1jIp96Xmrxz8NYf036mEUh3PXaKspgtavFC5VYza5UbSerUWmwKDnnQ7HszhC0AA4mQQ+kZkHxiXGj0IcImP6k5IaQaXPzgGh9kh3IUn0e265gNoK19LcQJMH2E3diHQPjWR6PhX7s5VZgiptGcPo98Z6cmktFEz0xIEddPhvOLPOHE2I5UcJT+gvBTG/MmfljYma0nTyG2dJFIJvZADweR5zsU0eDRgrNB+JTsYi7y1XjOdwCYhod2eLNL7ylJ/gU3mPptvyTFQ5CCgGYLEEG21OoFHUQR69tJ+eVROyqRfKuIez9IJUM0NXQMXQQAn6jtnP04+mpqqNfuA2DXh0RAAoEzZsdQutjgfYfc2RyVhZORrfbNNko3EZrIftDuHAbgApf5ml8PfKRdkDVXf9eGUeaTWM2dazVDu9kAUvqg4m3B815oJfS7aY6VrDfy8f+SCy4Hy2s8Hp/nGaOUSdAa2DY+34oRhQ0AnnUBRyJiNbzjKF2lomQgjbTIhywk/1VEeM0MXrIHFRBenE8t/XKObcm61kGL2xVKyJQRlpUYGtjnRlhYkgkvqjNjdw+rDDLMO5aYgdirFYWGFhX5xw8Cn4lUcs8YdEfAY6NqpCw+aoPc2TQQy/QkIwamF+s36ztMkkdWfVbUO4IjP7rSNlYXdGzIz3oS8Gzct/dkgT3jHDk+252gjKX7DZc8JWWKdBA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(508600001)(86362001)(8676002)(70586007)(4326008)(450100002)(70206006)(36860700001)(110136005)(316002)(82310400005)(2906002)(36756003)(83380400001)(40460700003)(186003)(47076005)(2616005)(16526019)(1076003)(426003)(336012)(8936002)(81166007)(356005)(6666004)(5660300002)(7696005)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 13:36:31.7152 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b69d8bc-34f6-4ea6-ac34-08da2dd319a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1163
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 9a45ac2320d0a6ae01880a30d4b86025fce4061b.

This was added a helper for amdgpu to workaround a runtime pm regression
caused by a runtime pm fix in efifb.  We now have a better workarouund
in amdgpu in
commit f95af4a9236695 ("drm/amdgpu: don't runtime suspend if there are displays attached (v3)")
so this workaround is no longer necessary.  Since amdgpu was the only
user of this interface, we can remove it.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/video/fbdev/core/fbmem.c | 47 --------------------------------
 include/linux/fb.h               |  1 -
 2 files changed, 48 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index ad9aac06427a..700ac4a83329 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1783,53 +1783,6 @@ int remove_conflicting_framebuffers(struct apertures_struct *a,
 }
 EXPORT_SYMBOL(remove_conflicting_framebuffers);
 
-/**
- * is_firmware_framebuffer - detect if firmware-configured framebuffer matches
- * @a: memory range, users of which are to be checked
- *
- * This function checks framebuffer devices (initialized by firmware/bootloader)
- * which use memory range described by @a. If @a matchesm the function returns
- * true, otherwise false.
- */
-bool is_firmware_framebuffer(struct apertures_struct *a)
-{
-	bool do_free = false;
-	bool found = false;
-	int i;
-
-	if (!a) {
-		a = alloc_apertures(1);
-		if (!a)
-			return false;
-
-		a->ranges[0].base = 0;
-		a->ranges[0].size = ~0;
-		do_free = true;
-	}
-
-	mutex_lock(&registration_lock);
-	/* check all firmware fbs and kick off if the base addr overlaps */
-	for_each_registered_fb(i) {
-		struct apertures_struct *gen_aper;
-
-		if (!(registered_fb[i]->flags & FBINFO_MISC_FIRMWARE))
-			continue;
-
-		gen_aper = registered_fb[i]->apertures;
-		if (fb_do_apertures_overlap(gen_aper, a)) {
-			found = true;
-			break;
-		}
-	}
-	mutex_unlock(&registration_lock);
-
-	if (do_free)
-		kfree(a);
-
-	return found;
-}
-EXPORT_SYMBOL(is_firmware_framebuffer);
-
 /**
  * remove_conflicting_pci_framebuffers - remove firmware-configured framebuffers for PCI devices
  * @pdev: PCI device
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 9a77ab615c36..147d582dab41 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -612,7 +612,6 @@ extern int remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
 					       const char *name);
 extern int remove_conflicting_framebuffers(struct apertures_struct *a,
 					   const char *name, bool primary);
-extern bool is_firmware_framebuffer(struct apertures_struct *a);
 extern int fb_prepare_logo(struct fb_info *fb_info, int rotate);
 extern int fb_show_logo(struct fb_info *fb_info, int rotate);
 extern char* fb_get_buffer_offset(struct fb_info *info, struct fb_pixmap *buf, u32 size);
-- 
2.35.1

