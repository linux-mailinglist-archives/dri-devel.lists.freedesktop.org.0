Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC923ADB5A
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jun 2021 20:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF876E044;
	Sat, 19 Jun 2021 18:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2060.outbound.protection.outlook.com [40.107.212.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA266E042;
 Sat, 19 Jun 2021 18:32:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csf55AZHbTbbhyfmbkUvTN3Grei+2bPUwfSr/uXC0fQUlCFMUX6eD1CrzMLJEA7eqGhm3FHQ+71ZYrvrtApjoVwFIMJIR0aQXoWEQCTZbCIK4KZxDceeUg7qDZGSq9wrs5fHO58OGQu+F3jDQQla6OQuEC3qvfkh7cEciK05bAtquAoj1FsaHfn9FB60yqIO1dKN6beNN/K01Kvg4D5TM2LmQ3c7+1aX4P0lPpQWElFWa37belE9DS7bTG9Z2y/hEyuVtGI944VoJa1FPxwBquMIcfN8vKOEoovbNjuOhIsr26frjceMYXMxbqxs1FAAt4WuXONK7W8yvJ5fefPrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWRWykmz2xF5HYtWmGb+NCcKO3e4VW1k7YHzpd1oxlw=;
 b=jELwZwvQTpFFbhncmFLPNyFCaqx/TkK4AU1n29CDX5AAdxs4ucwnNGow/RsnBnjEySV0FliCJAj2RvdMCQ5YpUpfpnmsGWgcTjzuWCeOmcJfOIDhCUeNE/qU1sLuQgvWrRscaivGt9s7nKZSskrFJ+vjpImM+Fd/wjDvgokA+8/A9BaMJ/eDxrCvOthB1ovWw1qWhDr17bvTBzaju7e7x13oKpkVdgYq+x0gGgihO4kO98uVcvVVDAh6xnxJGHXEEFJlmoghu4Ek6rAGYFLdwgj5fymjERfh25qXodIJpcoFQEFXj65UMxznNiIe8BnP6n0VQOMkkW6BQIansyPmOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWRWykmz2xF5HYtWmGb+NCcKO3e4VW1k7YHzpd1oxlw=;
 b=HS2ycMY43fGe4vV4DvTjBm1uY7/bLTAqGm4Yb6iDKSbwbE9cWPvUAKxE5u/I4xaviHOp5VV8GdeDXAgttPM+oYM/MU+CFyJRQgUcZyEH0szbCKR19ys9qK8stZeD7j20G4dPMgJnBSoev168OAh5wpOy5rD/3YRQhg++FX6zz4M=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4432.namprd12.prod.outlook.com (2603:10b6:806:98::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Sat, 19 Jun
 2021 18:31:57 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 18:31:57 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v3 1/8] ext4/xfs: add page refcount helper
Date: Sat, 19 Jun 2021 13:31:38 -0500
Message-Id: <20210619183138.26868-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210617151705.15367-2-alex.sierra@amd.com>
References: <20210617151705.15367-2-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.78.1]
X-ClientProxiedBy: SN6PR04CA0093.namprd04.prod.outlook.com
 (2603:10b6:805:f2::34) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN6PR04CA0093.namprd04.prod.outlook.com (2603:10b6:805:f2::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.21 via Frontend Transport; Sat, 19 Jun 2021 18:31:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d17b5f62-de2d-4741-89b9-08d93350853a
X-MS-TrafficTypeDiagnostic: SA0PR12MB4432:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44329C3A6093DD84FE30F98DFD0C9@SA0PR12MB4432.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nPRIpYBSai5Mo0AwFTzD0k3bNiH46ZHAkp7Np40k8djxk6Ubi8tDUllxfzTiUaGSci5xHL0pXn4tytGW3ocTUfb/1a5v2iD5xglFYCiHudqktjAX+gnGbYy/HERN+x6CKVkGBLfzSTbj4yhnXnEDx/O7evMZGsrjMeZDHRMKI/xY/mRkJo8+IcdgUCusqXgLEWE5zK4fOYpxeEWsGPlM7dWhE/m4wR9Q452wmvtHs/OM1hqHF2sBhQZMf0Loq9gTn4EENglc3pvOLGY2gYk8w6tZWJckVpR5K+9H6qHkX0m3OM9BPJD7u+U4PTzGcmdbFXwsLGTf5QL8l1ftsrV12JNlKYz7NbBBWrOFv9ek1aryTErLLDrVIoeykefv4QE3qy7/ukCOSvv08IOqvTmrwkNMolbH+vIecb8Ybs2XQLrxD1J7+xDQ2KgD/4ySqEG4zHtCDzl6/g4rxmxyVKn099qk6PnbXfHoGsbn2mqHYndoRv7AF+ZZ8a+hJfjKfoBWQ9jEUKTFWY3C4ZZxS3NYGGjPmpqoz8pbxlZ0QDvv70UDX2P2MRYO/5afRK1ZS2L2TuJkiTjUi/EEoD1GcfNDWb46QR6uqDV7VyvN9k63UFzOWlxz0IucfLVpW5jso+B+18BZtNV2HhLZjHfo5exz7QvDqbQzG2DxhoFSY0X6G3o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(38100700002)(38350700002)(36756003)(2906002)(6486002)(66476007)(66556008)(66946007)(478600001)(956004)(8936002)(2616005)(86362001)(8676002)(26005)(16526019)(186003)(316002)(1076003)(83380400001)(7416002)(44832011)(6666004)(4326008)(52116002)(5660300002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cU/gDmLnu4VUOHLS8U5qGFM1C440+i91TS5ZqXmRLCV2ywsE5H+XP/nbN4Jl?=
 =?us-ascii?Q?O9mWs6jmrEhUu9lHYTsO1EaXpSvNF5ISpF3BMCjiXaBfG6j46ImetGLG/7R6?=
 =?us-ascii?Q?n2ZffsprUCqqy0063mZWOEipWmzTBEADmS3uuneV7kh1X2FXI1K0TSyKyakO?=
 =?us-ascii?Q?ut9wP0PLomxMWX6+sNYnlriMCqup7N49uR2g3+YOvceTE9joqYyUuHDHnrjN?=
 =?us-ascii?Q?yAsePCLcf8VtAsKEzza4oBESweDuFIUgbFnqKHrGdWVybFoIhVHXhoIyT5BY?=
 =?us-ascii?Q?3rj3S7BLBFCWsSMy899T4g35jgnpuk1qZKCC7L3XDQErqaL/rVu1yavY3oDb?=
 =?us-ascii?Q?fb/Yij9s8PeC/2MM/bzH0IxSmOsH9OCghDN7cq3qMicK2qRjp73Fxi+a5OyK?=
 =?us-ascii?Q?zoBRibChgU6cYCIKhLf9hV6bGPqtwO2qincxeW6qWxbdT1znCxEQyHQ0kbwU?=
 =?us-ascii?Q?Jfz/LSprcOag2yDdhZyPCyayQ4fjNh1EYA4wadousZy7+8W9cGMsLMZn3pM1?=
 =?us-ascii?Q?odBXr2vxgbIBHaK+cPVg9Ahpf4N+FlZflDHq8dIoXhL0IvmFIvSBMMHZzX21?=
 =?us-ascii?Q?xLnj97p5hBzIedhMGfOHe7maePpi764s9XP5GIxB75lpJyxCicDkC6shZTYs?=
 =?us-ascii?Q?hADb7pP6VbqFWc8dGAwmghN5KD6E/uI9xMV0dP/Yg8J5dK/DEXfKnJgeQJma?=
 =?us-ascii?Q?3joCR0AnJXzqoOGk5ZMWYG3m6kBeUnPEfPbZ//mfZsRyQPFAVBWJiusZ24KL?=
 =?us-ascii?Q?kV7E3hyOKrp0hRW4zfYuolxRNvUDZnnlnU4GxTE114vV5sorCpxMEqXB1HfL?=
 =?us-ascii?Q?CA4BnZt4P5hhITBjap8ABwU7U5fa3zoFVP0FTQK/TfGYsSkXPavN5psVArFo?=
 =?us-ascii?Q?TNJtDQAvsqx0UxhmqixOcH41GaeRJH/YGYLl5QMQhHeUN3fApUA6nfXeu4LJ?=
 =?us-ascii?Q?olzs2TNMl6Io7Viyuwe/d5VMSx3P8X3f6o6vIsJxPGKvpmBtm217EDFF8Huq?=
 =?us-ascii?Q?gElIyM16ht1uGe8Dqive/ljJiH85dXVCAak8b0LKXoi2Squjy9Hvhcf8j52u?=
 =?us-ascii?Q?rCdghdcqSZOfECLcSPrQMpiUyvWsz2CbKkfV2Rq0cyhKrmvO207BOqMc7yHv?=
 =?us-ascii?Q?hxa+Ob7PZjpPsxY/Ndri7V05HB9FrLd3eHUX8e0m6ldtRStHJPELq3CB+BRF?=
 =?us-ascii?Q?gZd6scY+jJZ1wuvZhJ6R6khC/LEFbOsngNtCon5rnlTlRj6JfQPydHYRI0o5?=
 =?us-ascii?Q?hA/kaDv1Hxd7wdZNlVqx2EBmZZBbuuGpTn2ZIoU9ROmUv6TGPrKdjfdcidbJ?=
 =?us-ascii?Q?y9hP3FQl+EbgsrnVZVX55BjQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17b5f62-de2d-4741-89b9-08d93350853a
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 18:31:57.6735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQQW5mPlmfkGepmHx0JOI8HSc7vIIywKJNCD/KiKcFUdagxxaGZ2EgVp2DRxUImtghaqrgBBBg67+uQcfyFWXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4432
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
Cc: jglisse@redhat.com, jgg@nvidia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ralph Campbell <rcampbell@nvidia.com>

There are several places where ZONE_DEVICE struct pages assume a reference
count == 1 means the page is idle and free. Instead of open coding this,
add a helper function to hide this detail.

v3:
[AS]: rename dax_layout_is_idle_page func to dax_page_unused

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 fs/dax.c            |  4 ++--
 fs/ext4/inode.c     |  5 +----
 fs/xfs/xfs_file.c   |  4 +---
 include/linux/dax.h | 10 ++++++++++
 4 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 26d5dcd2d69e..4820bb511d68 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -358,7 +358,7 @@ static void dax_disassociate_entry(void *entry, struct address_space *mapping,
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page = pfn_to_page(pfn);
 
-		WARN_ON_ONCE(trunc && page_ref_count(page) > 1);
+		WARN_ON_ONCE(trunc && !dax_page_unused(page));
 		WARN_ON_ONCE(page->mapping && page->mapping != mapping);
 		page->mapping = NULL;
 		page->index = 0;
@@ -372,7 +372,7 @@ static struct page *dax_busy_page(void *entry)
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page = pfn_to_page(pfn);
 
-		if (page_ref_count(page) > 1)
+		if (!dax_page_unused(page))
 			return page;
 	}
 	return NULL;
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index c173c8405856..9ee00186412f 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3972,10 +3972,7 @@ int ext4_break_layouts(struct inode *inode)
 		if (!page)
 			return 0;
 
-		error = ___wait_var_event(&page->_refcount,
-				atomic_read(&page->_refcount) == 1,
-				TASK_INTERRUPTIBLE, 0, 0,
-				ext4_wait_dax_page(ei));
+		error = dax_wait_page(ei, page, ext4_wait_dax_page);
 	} while (error == 0);
 
 	return error;
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 5b0f93f73837..39565fe5f817 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -782,9 +782,7 @@ xfs_break_dax_layouts(
 		return 0;
 
 	*retry = true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
-			0, 0, xfs_wait_dax_page(inode));
+	return dax_wait_page(inode, page, xfs_wait_dax_page);
 }
 
 int
diff --git a/include/linux/dax.h b/include/linux/dax.h
index b52f084aa643..8b5da1d60dbc 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -243,6 +243,16 @@ static inline bool dax_mapping(struct address_space *mapping)
 	return mapping->host && IS_DAX(mapping->host);
 }
 
+static inline bool dax_page_unused(struct page *page)
+{
+	return page_ref_count(page) == 1;
+}
+
+#define dax_wait_page(_inode, _page, _wait_cb)				\
+	___wait_var_event(&(_page)->_refcount,				\
+		dax_page_unused(_page),				\
+		TASK_INTERRUPTIBLE, 0, 0, _wait_cb(_inode))
+
 #ifdef CONFIG_DEV_DAX_HMEM_DEVICES
 void hmem_register_device(int target_nid, struct resource *r);
 #else
-- 
2.32.0

