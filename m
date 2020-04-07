Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 209AA1A078A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 08:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDF36E520;
	Tue,  7 Apr 2020 06:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2286E51B;
 Tue,  7 Apr 2020 06:45:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9JQ8Ukg4f9asHjRYVspwvyG/8YrAOGPo6pk/yn5hCcNOsv0DcU8PEKa1aIXn3ZPaOdvxvq6a8GTHRdQiww3txqFwqFa+NYXr+0TRAPmu0BxD8c9yaRB2t45J3FtMZOkfLc/so3RbmtX0N0vbkvIj/n5d5mZa1hnrOt8bWO1ZfzzQ2s82+0Ook5Uk6es1p7iJTkTGRuMNqKJYVfGdYOBWj/xlNxAKD5UCikYTZQjEeShuGcybxElvM/mcFmx3GObxbHUDeuV2WmggvpX61FHsMw0iFvo7MoF1difARvMY33N2UQg/c17KN3JKBKJaUyiGzFCmdd+YNrcKdjgMK7VyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEU6PFw1Qy+6hPLJLZ3fsTp6hhMy0gfNH0XWA6p2gTU=;
 b=lM0mFXSCssF2vYbXgQEvy/6gm5Aq0safBzU0nMD+yXgdtqoQIHB484+GUMXMcOMNaTAsT0M57NBe7vowg5XPgpQ7bJC8m7Sghl8kHqjKpPGmiadapGsgQ7hrPt8m2ZQQoJF8ohixWx8LccVNSV6vRUfLgHiYieJB8EwKOW8IAnZioyA3bmjWXHwAvGywWjBpS/n+BMOgFBmyo2KaJf3ysIWoxBxTKyB8nvgp8gPsGl2gJqhIgpQ4Hqkwmzr85DPJLF8mDQuaCO26czlGOLaJB92/Ns9rwPxEIBpxdLFn1/u6mkr8kGQCDClDCJOIDJ9HiaiN9fnfBbCqIrSv7rvUcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEU6PFw1Qy+6hPLJLZ3fsTp6hhMy0gfNH0XWA6p2gTU=;
 b=auld62+BWNnAiZKilpGtFPeaUVkrNbxrud7+H5lBKexv4NhDvQtEz0onv6tC+bqUaCWVfguzsguJV52fc8+kQg2LF5FR+0fSJvccyUL9s04Zc89H9JAa+hUXg6keto4uxx0tNTBNSQupMp1kMePe6bgBD8sQ+hGX+yEhIcJXmpA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (2603:10b6:208:106::29)
 by MN2PR12MB4439.namprd12.prod.outlook.com (2603:10b6:208:262::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Tue, 7 Apr
 2020 06:45:25 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::6417:7247:12ed:1d7b]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::6417:7247:12ed:1d7b%5]) with mapi id 15.20.2878.018; Tue, 7 Apr 2020
 06:45:25 +0000
From: Huang Rui <ray.huang@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/ttm: abstract all ttm prefix into ttm_debug header
Date: Tue,  7 Apr 2020 14:44:45 +0800
Message-Id: <1586241885-25422-2-git-send-email-ray.huang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586241885-25422-1-git-send-email-ray.huang@amd.com>
References: <1586241885-25422-1-git-send-email-ray.huang@amd.com>
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-intel.amd.com (180.167.199.188) by
 HK2PR06CA0012.apcprd06.prod.outlook.com (2603:1096:202:2e::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2900.15 via Frontend Transport; Tue, 7 Apr 2020 06:45:23 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [180.167.199.188]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f299b8cf-0860-425c-8f5e-08d7dabf403d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4439:|MN2PR12MB4439:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB44392B232898815F692D7019ECC30@MN2PR12MB4439.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 036614DD9C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3309.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(956004)(2616005)(8676002)(81166006)(6486002)(54906003)(4326008)(86362001)(16526019)(186003)(316002)(478600001)(36756003)(2906002)(450100002)(66556008)(6666004)(52116002)(7696005)(26005)(66946007)(66476007)(8936002)(81156014)(5660300002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D+2qi+3/cCtBpfASviLN8Rg2RPisUiJt+UTeMgQDuw6J9VeWZXsl+IB3tJfEOgVOhecijXTG3NsH/EqtRPK9+KCyewYnQwmMHb47UofFGXt56ILX2Hf16QDj9eAh7G0rPEoSGiFr7vKaSgtw0UcUGEmSNukp+jeYs0+FqpGnNRPHeyceNeNhmoI1SPjuJzg8M38muZf9IGIxKA1lPnblLiixjSlkZbaXacWhly3npjVOBMFtuNsMf5tBoduAYSLKBCU43n0myXdb5n/nyHw4b2entMzkYKX1rGx7Oe0AHkw/kM6mVk/HW7tndd2DRVEE1x+5ofwipQrEAXmAIKoQ3gghd1oLPiT3fGxXY/4ThpKsHNWLr+92YnQsMv5/AIddb47jfKY24QLkToB3hXpLNQr8cYS65UOWXCzd6RNUkq7AeJuK1hEVolf8epdWI7SO
X-MS-Exchange-AntiSpam-MessageData: KhscPhH/Z9KvX3x+XBBVrB/7rtp0mlspW8R6ZacaStCO07ikVTr7Z4/yRsyqd6tRX+nbio3/PGaYBawWDE3RAAKwWyaJGTTCTpN+uzNzUCP0Y+Dn8puT9zchrkP2iIIzhbhw9hmj2iVKFFMTbBR4lg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f299b8cf-0860-425c-8f5e-08d7dabf403d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2020 06:45:24.9568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ssgN6Z2uRp2HHa+Ga/87A2Fp+W4J090v74GtRP6pUcQ35a0L+zNDLH9Mosr+E435hYVbYXvjTzGti/dDDtD+4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4439
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
Cc: Huang Rui <ray.huang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using the debug header instead of macro at the start of the files.

Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 drivers/gpu/drm/ttm/ttm_agp_backend.c    | 3 +--
 drivers/gpu/drm/ttm/ttm_bo.c             | 3 +--
 drivers/gpu/drm/ttm/ttm_bo_vm.c          | 3 +--
 drivers/gpu/drm/ttm/ttm_memory.c         | 3 +--
 drivers/gpu/drm/ttm/ttm_page_alloc.c     | 3 +--
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c | 3 +--
 drivers/gpu/drm/ttm/ttm_tt.c             | 3 +--
 drivers/gpu/drm/vmwgfx/ttm_object.c      | 3 +--
 8 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/ttm_agp_backend.c
index 6050dc8..53fa96f 100644
--- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
+++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
@@ -30,8 +30,7 @@
  *          Keith Packard.
  */
 
-#define pr_fmt(fmt) "[TTM] " fmt
-
+#include <drm/ttm/ttm_debug.h>
 #include <drm/ttm/ttm_module.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_page_alloc.h>
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index ca5a8d0..469a3f1 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -29,8 +29,7 @@
  * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
  */
 
-#define pr_fmt(fmt) "[TTM] " fmt
-
+#include <drm/ttm/ttm_debug.h>
 #include <drm/ttm/ttm_module.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index eebb4c0..fa5e237 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -29,8 +29,7 @@
  * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
  */
 
-#define pr_fmt(fmt) "[TTM] " fmt
-
+#include <drm/ttm/ttm_debug.h>
 #include <drm/ttm/ttm_module.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
diff --git a/drivers/gpu/drm/ttm/ttm_memory.c b/drivers/gpu/drm/ttm/ttm_memory.c
index acd63b7..f51d70f 100644
--- a/drivers/gpu/drm/ttm/ttm_memory.c
+++ b/drivers/gpu/drm/ttm/ttm_memory.c
@@ -26,8 +26,7 @@
  *
  **************************************************************************/
 
-#define pr_fmt(fmt) "[TTM] " fmt
-
+#include <drm/ttm/ttm_debug.h>
 #include <drm/ttm/ttm_memory.h>
 #include <drm/ttm/ttm_module.h>
 #include <drm/ttm/ttm_page_alloc.h>
diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
index b40a467..4363420 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
@@ -31,8 +31,7 @@
  * - doesn't track currently in use pages
  */
 
-#define pr_fmt(fmt) "[TTM] " fmt
-
+#include <drm/ttm/ttm_debug.h>
 #include <linux/list.h>
 #include <linux/spinlock.h>
 #include <linux/highmem.h>
diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
index bf876fa..0017d6d 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
@@ -33,8 +33,7 @@
  *   when freed).
  */
 
-#define pr_fmt(fmt) "[TTM] " fmt
-
+#include <drm/ttm/ttm_debug.h>
 #include <linux/dma-mapping.h>
 #include <linux/list.h>
 #include <linux/seq_file.h> /* for seq_printf */
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 2ec448e..4fa8a51 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -29,8 +29,7 @@
  * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
  */
 
-#define pr_fmt(fmt) "[TTM] " fmt
-
+#include <drm/ttm/ttm_debug.h>
 #include <linux/sched.h>
 #include <linux/pagemap.h>
 #include <linux/shmem_fs.h>
diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
index 1607778..cd77370 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
@@ -57,8 +57,7 @@
  * for fast lookup of ref objects given a base object.
  */
 
-#define pr_fmt(fmt) "[TTM] " fmt
-
+#include <drm/ttm/ttm_debug.h>
 #include <drm/ttm/ttm_module.h>
 #include <linux/list.h>
 #include <linux/spinlock.h>
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
