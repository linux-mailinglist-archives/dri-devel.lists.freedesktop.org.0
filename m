Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7963E9E8B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 08:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C896E28B;
	Thu, 12 Aug 2021 06:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A51D6E284;
 Thu, 12 Aug 2021 06:31:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1R3Nd0NeepOVUB1AjMuFbDOnR1XTAArnhQW+J1YP+Emq7AI9CtJ441o53lvhjCTBZcOFuDvQepm9qUedLs+X81jNiWIYjTCEfEa9wLdbyy+9ZJbw/LCv0vtTIHLKIvcXebfjdTMS/EML1B2zeTJ45oM300W3CCnoO+4Or9AA+74eL6/w6lgJ0taNvQUAaptvw6bmW0BByekvdfxcF4q12M3qHGrJar8NMnxD+rFQE9rg8ZFIzqM0qwW8hmAs8chKPi4+VP007xrxGSHZnJKG/tJrcbYbV+8spfdKaJFCCNECOwc9OjoUhQ34fwj0t7F5B+GGvC7ZmEg4z9dhnPcEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbIH0RG19WjqRtYErQGXbqkeBpy9Wm45+s+c0rtHmno=;
 b=fGdM1H3BreFZhfbLK9jgGSEj5k70ulnTbHv5/Y/Osd4Z7DIQN4Xgn0RuNeGG5sZG4dshkFRly8JdDNmRyM7qDTRVpvCT8PWUuOrrLEbFZCVDC0ENZAxgbYZcwBDqJ08dZZv+k//bOJpayMaA53FjFZ91n7mBlmkEJeJ+YRjRWXc9O/n725SoVVyGZMPDEEF7XNyArZ/tjS7ljviqPicKDc+uZvsnRAMLrGGb2IwUUxkZgqOTd4NyGxG5C7LxFHP9tjs38shq0rhHcy96TRjrA6ivV+kL3jp266q5haQLlRKWvDgKSNDDxMbGm8gcTXUZq8/oU2gZLmDDGLv1GVu1gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbIH0RG19WjqRtYErQGXbqkeBpy9Wm45+s+c0rtHmno=;
 b=y4/PM1BH3URJ220U3wtNdtq/toncxWAeKfpL/zZvAZznA5tLSS0QzVdYSvc+Z1elUyOgfBEKrnb26M3Nt1rM5pd32Q7k8XYjTw//fkIYgJnW977vaXFUSWzJxEi4RTWNQ1KeOMaJr+gCycqkBuApDzMS4vVo1kMuLWSD348sQas=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN1PR12MB2448.namprd12.prod.outlook.com (2603:10b6:802:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Thu, 12 Aug
 2021 06:31:25 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 06:31:25 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v5 08/13] mm: call pgmap->ops->page_free for DEVICE_GENERIC
 pages
Date: Thu, 12 Aug 2021 01:30:55 -0500
Message-Id: <20210812063100.31997-9-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210812063100.31997-1-alex.sierra@amd.com>
References: <20210812063100.31997-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR18CA0026.namprd18.prod.outlook.com
 (2603:10b6:806:f3::18) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR18CA0026.namprd18.prod.outlook.com (2603:10b6:806:f3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Thu, 12 Aug 2021 06:31:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe7e6296-da94-4496-94df-08d95d5aced3
X-MS-TrafficTypeDiagnostic: SN1PR12MB2448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2448675FCE4DDF3F7CEBCF98FDF99@SN1PR12MB2448.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jgzVj+zAbabtjuECnCjvLhhZx6yUgUSxfqSpQufxTlg49flzt66VfCSDGUwTlckRjWbAL4i2h2I2hvkHHk3+XtYUmv+tmoYLaz1c1hXJXOND/kSqCFxXhTFajfWfGYcg9nPoAcNoNSydnuw2hkeVJZKhvZgE3kv4zTuGMl9Xytah03Z2RV8ivuByF80llff/V7s+J0YbB7tFCuvDGcHsNdSUPzeNDFmQtQLrUOoRqTHxJ0V6UQt7Tq+baZCLhPxX3do2wglOpUGhOqzzIMtqS/8D5firizLYcxU8d6QaTNDv9LfKs3xrm3IhULC+j697RJfkHjQ8p920bY0PMkxdJQ+uWBC/5luv5wSHO8ElxpRj19qglGDdFn96fWrMTWe3aoX5a6Z6Y2RM3IRfmZSIW7a3rZxROTwj6ytFkjl7A1vEwOTq0axEjYJZPbKjy2XDaJtw8xOL9Vh39nxNwt1bINIqGTl1qmlUeS8/4TOGHaQM+LknFRPPAlZkSISSkHRr2gPoUcXCz+wEIO7kzVcF/UgqVBqnwepUUUsap1Iq2Lhutp0oaREHsNqmdtN/XTHLAm+DSm3iaflK0YxACpskYm87uJxmZQMyOkZ33liSllmF9uv6HIbtYyfeX63SkoGNB+ns5cVEibMxoa/2DiRTnKnDy/sQc/XJ6PDQPlTgoafA9Wdc7FJiOMwgDty0yJ+5Oru4HU/BbmnaXoc/DeTIWbBrEHrVNw4NJVP91J7C+/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(38350700002)(6666004)(186003)(66556008)(66946007)(2616005)(478600001)(83380400001)(38100700002)(8676002)(26005)(44832011)(2906002)(66476007)(956004)(52116002)(7416002)(1076003)(4326008)(4744005)(86362001)(36756003)(6486002)(8936002)(5660300002)(316002)(7696005)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?75T3Xt+E83/XHEtZNlzQ68wKeLm/5awOhobviOBPZ64xyW/0kiLrSROCCRoC?=
 =?us-ascii?Q?35K1rm7M+XjW2nsPAS+/+AoBKOCm30QPFgdgi/o10ySL/Jh3ONongbvERO7e?=
 =?us-ascii?Q?foK6yxQ6fRj5+mwanruRiYxo4BCMMMyvcCkQ8Xdz7jpAxozAm6C0CiZZOI1C?=
 =?us-ascii?Q?Sw+c0Opru9SmBgUSWc0DDSYEk7BiLb3QB1iF+9ip0ZgaH2PDXioPuI/kxhbV?=
 =?us-ascii?Q?1X5AHptQfw85B3jJM1P7fO2+xW/Ab5+gwsJOiY5xxNel+jwWSdnmOJ8LBNrP?=
 =?us-ascii?Q?hkaSiIRaiFPJhOAh+nywzw1qdem6RfUKcdwJdS2GLf9Q3WRzo0CG6Bb2EERW?=
 =?us-ascii?Q?z1tUWko3BkLtmdAlzNwIj7XgAgx4fdvrrrGeYjNm2VXhFa2VP/2G2/o/aZXh?=
 =?us-ascii?Q?NWqpDvk08g87jfc/hO0SM21KYNC25LcGgiMekqVMGaPue7FPh1PmI8HOcvjE?=
 =?us-ascii?Q?mOcZ+ksAu4v4cFRckHzoO2GhnsaxAwd2gaVno2AC1u3aEcB397YZW9Uxne4S?=
 =?us-ascii?Q?CSih4K/azGvlotWRU3MQrRnWcwXNHPrriWb0w/HYEKTE/LH2K+Rb/CuVKmyA?=
 =?us-ascii?Q?IvywMSgf6A184YVEZSwh3Zvc524zRLnRlTugsVuxmYa/zRB94lJxOoWU0+5q?=
 =?us-ascii?Q?+/v4/a/gT2Ck/TFGnvnJEOkVxfFgmF3IGeslRHZ2QHOZrpYsW4QcCq2nIgJH?=
 =?us-ascii?Q?qFY7gdawz9uWYprHwUTualT4dD9qcBBWtu/e0W7FlHXl+0cWTakCuTlPiOZy?=
 =?us-ascii?Q?Qwy84IbWe9mxhW+rsgSIGl2Qo8R52OxvnVNGyoXFIm7rV34HytFwp26hB9Bm?=
 =?us-ascii?Q?TbSbA6hCJt18eCwuZBL+B8pQLN2yCUzk1YBQsijeMi/diopc/PAAp7F0hHf6?=
 =?us-ascii?Q?gzcorf9yKTKFi0O1bCkU6skBHhWY4fSU1ic9kWJbQD5VTgVp1LjjEjQExbMk?=
 =?us-ascii?Q?70kl1WVrNx4pYujh8HJHi8u0J4VoZ7QolDInxZFYUeRup/uCnfT9SAYe2n+H?=
 =?us-ascii?Q?FHOX3lfRnS35DAMTniBqB+X2eKTlFXC18gdgNsvxiDWxKaUHxbK6qaOctXl1?=
 =?us-ascii?Q?mifQGXA0S6bvxt5GIR28XimD420/2oYjakGu+r3+Y8C+JUA66ibOmOiZE672?=
 =?us-ascii?Q?gUkNoJxccrB9cWfDFdbqOyY/U9e9wUBCLvROMEktoTG+FuknBJtt0shNDeF0?=
 =?us-ascii?Q?34OP79fw/+k/jAfQ4Eg/lReiuFP5tbD5WGyOI31IYYKhjtug5sWRCJv3QaQ2?=
 =?us-ascii?Q?4WqqWG610bcEcCZb4v02HqOls3j3Jk2nyzSxynH588uBuLk90prZ+sEaZHXP?=
 =?us-ascii?Q?xeDNdwJ1LK3bfFF907DPh+H4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7e6296-da94-4496-94df-08d95d5aced3
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 06:31:24.9238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XL0ShGrsK+YWunWNFjBl5URZTfMXQq49G7lZk6HZc0IJlDirKNxdXH17Ls9t6xqWfdWVM9O0ObrteXD/k4H+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2448
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

Add MEMORY_DEVICE_GENERIC case to free_zone_device_page callback.
Device generic type memory case is now able to free its pages properly.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 mm/memremap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/memremap.c b/mm/memremap.c
index 614b3d600e95..6c884e2542a9 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -438,7 +438,7 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
 EXPORT_SYMBOL_GPL(get_dev_pagemap);
 
 #ifdef CONFIG_DEV_PAGEMAP_OPS
-static void free_device_private_page(struct page *page)
+static void free_device_page(struct page *page)
 {
 
 	__ClearPageWaiters(page);
@@ -477,7 +477,8 @@ void free_zone_device_page(struct page *page)
 		wake_up_var(&page->_refcount);
 		return;
 	case MEMORY_DEVICE_PRIVATE:
-		free_device_private_page(page);
+	case MEMORY_DEVICE_GENERIC:
+		free_device_page(page);
 		return;
 	default:
 		return;
-- 
2.32.0

