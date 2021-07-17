Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A52C93CC5CE
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 21:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2251F6EAB7;
	Sat, 17 Jul 2021 19:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB706EA9D;
 Sat, 17 Jul 2021 19:21:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aII6i5sIu6n67C5ztvv7a7R+5q+1vTfQwrKp4gbjvEONrRZIs3F9Rwj32uPkVqtIMnvh65naE0Z+2HFRmcrBOrBeKmuQymhYd1C8bD0ZpZKYeCOZD5A4/njalQ8tE5kBwsqrfzbRxRkV2xCPWluNN8+bFJHUj43/7UpUlSQt+km5klFIRFkSi84gQZXka2+hqrBL1EjlQdB9k530Tj/livtZR03YnTS/GjxdAZuJ74Bd35vnp/43OJMjw8M+bpTZ75J5tlIiiM/nkX72HTYlEWDHwF9upiT4remv85Z2Eo5WgcYxqkSpAmZBJheTvieyYFK1saeWZlE2uXBYiluXBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qSk32SVXvhWrJNt560kEQMeseoXBAlRtyocaZ1Jee8=;
 b=It3m5wx1MbnYEb3vMs8heK1pkgJWmzC0wOCeedb5cQ5WQ1+1yWRRn/G5fClspKW6Ojwi4HRqPbxPD74q4iRk9KfVWomi0zPG9jcAAQgJAW7G0NtidwF6L1ucmVafttqdRsC/DkXpdWGEsjfW87OuLIizeK1aq565No/NLILUz5rkuH9INs/hbwbl3ZBsMMC1g0FjD9ESJQtu8zgZjb387EV8deQsLa4fjTMWTyarT1ITPe40bzOujODLO4Wk/1GCCj82QwCi3oMzl59QOmWKrbPLv5Ne/16qpB11GQzOwQn+rLrriaWg8XQ8aoxNJgKsdreismHGgZqvgQ4vL3oaTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qSk32SVXvhWrJNt560kEQMeseoXBAlRtyocaZ1Jee8=;
 b=YZq+uC7dQnXkq3kDuGxY9lW06iqL5IN82ko8hQz8JNJdKcZXgmGudpJosYzEpIkbhrlPoybgA4l5be9hAjdH72Ff1I2z+dza11LJaz9QZHl04qIddlOO0dNNAbeA+eOkH0A4qA+Y8wShj/4nzYv1wDD61JndFAaucLzS6d2ognk=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4670.namprd12.prod.outlook.com (2603:10b6:805:11::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Sat, 17 Jul
 2021 19:21:57 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39%7]) with mapi id 15.20.4331.029; Sat, 17 Jul 2021
 19:21:57 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v4 08/13] mm: call pgmap->ops->page_free for DEVICE_GENERIC
 pages
Date: Sat, 17 Jul 2021 14:21:30 -0500
Message-Id: <20210717192135.9030-9-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717192135.9030-1-alex.sierra@amd.com>
References: <20210717192135.9030-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0067.namprd02.prod.outlook.com
 (2603:10b6:803:20::29) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0201CA0067.namprd02.prod.outlook.com (2603:10b6:803:20::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Sat, 17 Jul 2021 19:21:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5841aa5-394b-4dd2-3937-08d94958212f
X-MS-TrafficTypeDiagnostic: SN6PR12MB4670:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4670012E785F59C7E9E0694DFD109@SN6PR12MB4670.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJaS3fBE5cOD/1p6E3ge1WDWZtTwXh431P267OBQUHlv7cQ0RPSDus84Rok9PXRt2gSqzdfnGjcTYmhoA4cTwlaRqxGjGW6fVdpUj/xi94qC6SGpFqulQhJq8ASx3dJALG4VhcjfOJ0OAslvpn+Z/SG/3f9isf3EMAMxFm+X1kjzM76238t5KzQ2mpBN0qPYOyefbPYIFG9g3S2wAJBDkMZZYrGm19T2R/YaoWs4lS9O6XHstvUiB3C8DJKQzLKQ1419hSBbZfRC8CxKznrKzaW1i1SL2bXmBR6dwcJgagcKjTmusLjLwPxanBUjZr4ttUyty1rezETGpZzHEaJKVtjG69kUDh7pt+F3qwiNDtqKrxTGGOwh5hY8sATiAYydR3ZyQ9jh4WavcWwYCqVspjbNOC5ZrhkxLEzR0lM+FVMe4W11V47NReQkTmbBDWAkSo4AFE/Wkf3uCm1Z9swsIltDlt/07JquecPBt+EGU2RY+jOdg/1ZKE6gK64pm88TgcCNjvIa0/7LRFbBLt9nop9Q1ZLZHZSKHwBmYuHJJqkyQKYg99EJsToGAeZtKaoNrw7mzcRUqbMWxt5/WH3mfrUA+mH4WyTFGD4fLDRPy7Zl7PMqgzAlaUnOaxGJh8km+y+RJ/qaVbbVEyOtnRByREBKyXXN/7jM9AVydCMcFDPAS+pcNWTwVeamKzDFIcMEkjFQypiKvP79FOk6rqplx3cGWNyYTyqVihwUxMhq2OU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(2616005)(26005)(5660300002)(2906002)(7696005)(7416002)(1076003)(4326008)(6486002)(6666004)(186003)(8676002)(4744005)(956004)(66946007)(86362001)(316002)(36756003)(44832011)(8936002)(38350700002)(38100700002)(66476007)(83380400001)(508600001)(66556008)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?whzrJ2i7grHu6gRiRJWLWyad86I3x5Zk9apSsGYArhaQqBnfyAgr2CULkCzr?=
 =?us-ascii?Q?gF8Jzu47NP8ftCunnSB+WR09fBz9VXfshL1vU/eZK7EZxQlikz4Z6VRYkt2x?=
 =?us-ascii?Q?nORYzPRA+WRfkQTDML0nO/Usc+0zXI4qzJoLWeezXtlR/J4owT9WKBiMQFRG?=
 =?us-ascii?Q?UixOJHxHlaX/0yYh5dnaxrDKia0KCr8wQfMtsL7hy/x6Aji2ywbgJf5ufzbO?=
 =?us-ascii?Q?d5ykbkHrQHd1/M5drPe7k0VTKv/QwJjLyU0QmeSkHPvHOWzxvonrEQJeZhMS?=
 =?us-ascii?Q?8Q9DrXOg7RAQytGxfM2bIfYBcHslfb8I3RsYribP4ClsaycYsV0oIkbv45Ze?=
 =?us-ascii?Q?YXnLJlHLTU7B+gyL2c42MJgWRuA3KvXenyAn1m0PXe02CngvhT8qhoW5+qL6?=
 =?us-ascii?Q?M2L9eZ+HiS3fgXM/ddKkKzjRF5CVoFjtdzet8DeklORMPE6xacts40kvlDoS?=
 =?us-ascii?Q?8QLF6+Ji2p8A/A+4yqoy9FO/KKYVuOML9XkgyEXraCVWzJgCIvtdOy9QWED9?=
 =?us-ascii?Q?8Z9u06FGS0Ea26Miv/HWPzA54+42IDexH7+gCvsdoAwxuFQvY0eYQZWqEuXv?=
 =?us-ascii?Q?NJt9+sxHyZ72BSfiR0cvCr7SMkFpJh+NykSlN44sOdZherGEP/xDpYHqAGWK?=
 =?us-ascii?Q?iq26xGPBUtZ42BkNE2716pOzk+ZU2Q9Q/GqsAwwBIHg/zLY1pZQn6pjAnkiz?=
 =?us-ascii?Q?Hg/OZKyOc1lUdJjBGpTuv4BEPDNjEp7NX2RPebDeiCPocdX6EbbrLzk0dWfv?=
 =?us-ascii?Q?8dUP59HtWKOo3/01ejh/SrLvknnoXi430SIjCPNM4GHqBY4vYFyybgFdVdEy?=
 =?us-ascii?Q?8suLUS4XhSlDP3wsC0cP5hHI+X+yJk8+FM47jktPqhoFwzMRp6ZHlvfnrIIp?=
 =?us-ascii?Q?3LR0FISacVUgYzTCFjoA0Tz7wiF/wt94cHZ6Iu4gOQsDq7UlSexTZeefuC/1?=
 =?us-ascii?Q?gXDUG8ePsekIvU3Ix2dEEIggTPCzUT5hj1GfHymS1JWqqX+e4Nfd49CWXt6Y?=
 =?us-ascii?Q?WDECV+C31ToTNM3t2LquYwzSqjR1fo2qUI95EBJRfAoEdH5hKQPsGlqO9uAi?=
 =?us-ascii?Q?AnYZKOycHPiuGuI0ytzJl6BrWMTLjVkWHucgQO1SaSj4bMr9Ue8USRDX0ehH?=
 =?us-ascii?Q?R8q5QzUQDo7yG0Odq515nN/Kfp7vWY6Fixoezx5645UqO/vcvQkCqvHjAoGt?=
 =?us-ascii?Q?txmEQpYINrBiWIde99tqiPLyhh2BXk/eE0aTgVph0HXNBjLifDlEwAz+8Xuw?=
 =?us-ascii?Q?xQGb98lNQN1YrR7RNd3T3Uez4QDLgC1BTm2bA69571Lds7J2lK30Z0mEn0f1?=
 =?us-ascii?Q?CsKpdouGrRpi6TCrt0NeWNrR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5841aa5-394b-4dd2-3937-08d94958212f
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 19:21:51.3931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+PpAt2L0MlCIdeh1XNkgJO6tBC+udxNQcWCGzp5iqzntP2O2+wXjGNrUN3Yrt/yzhnzlIS1e+DbR4td5Y0uiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4670
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

Add MEMORY_DEVICE_GENERIC case to free_zone_device_page
callback.
Device generic type memory case is now able to free its
pages properly.

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

