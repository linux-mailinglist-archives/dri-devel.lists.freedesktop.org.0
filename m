Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5058E3F6E10
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 06:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49FE6E138;
	Wed, 25 Aug 2021 04:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (unknown
 [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8E76E138;
 Wed, 25 Aug 2021 04:04:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhPaDGX5Cea/oUtn0F7k9hH2r48Xr1+c4dTapomHIL+sFk00Uqwtx2tiJlSu+z6azfSgWCS1J05nwrTzdvzh0l+/HlV5OeHpYA4xiW0TjOeX8QVNPuQBoydAqUebhjSCMjgDFhbpQhScupO5WrDbRZFDQgC6HyQ9S7cwviWskFT8Q5QAGfR5F7kAxq/3rOy5ad9jYA+AZKDEo6xDrNS9Ms1ZP/I20dv5GyX/5diUmyH8mGbs8LB2V6UOPuO7cj0Nura/AOmx07o8WF1zCEwtVrsHpe3XpbosRmvXrS0PwUaW8HG4ZFIlRpFj3kw2wN5YGTKJ00a2V/rb36/4SMsRzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIi/JPdMEuV9PNEmF+4MUIlbfqIvI8LucDuxAdl7G80=;
 b=f0TNPMUIH2IvI9ZawjVRNva8lNCFj7qDOP4f3LmzNI9tpmdRzLC/r64DKoZ+Oz8E4zrILE0BxZ+buMZIb0v39EJWKP3gC5vFYpMxjsb4JGOrFAy0upWO+gtWSsN+CxPfAESl8noauz2ppWRo0r3RQ44nuaR780zNulnZKkkzpg9vYMC+y8HKODSnO3eEIEI9IPlYKR+a1mNLaPBPcjO6njiI0SnUpMAdoLZp/c59TYcA+CQZGF9bSYnls0Rtjq6Gi3PYitcz3XpDVMFbVeUuMNo568dO9BFSVtqoe8Ard7ONO9X2lNGaNXZb9Pv1EChXOUeedRrRzOQPfdpUio0qtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIi/JPdMEuV9PNEmF+4MUIlbfqIvI8LucDuxAdl7G80=;
 b=zBS0Fd9Gzn+gImfP7nY5MqyUt0ccnXHWrC4T7kLar5UhYeqC0wJabczkbr8Md5dzUngu8HV7We+MLBrTwpwIHNsFFEtAq6kuyjEwJGOuxqeawyrad1rPtkqDys0dVOG3vxyV/tI0LMhuTwOTFVPvy99nL9umfWHrwqViqXKe17k=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4750.namprd12.prod.outlook.com (2603:10b6:805:e3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 03:48:48 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 03:48:48 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v1 09/14] mm: call pgmap->ops->page_free for DEVICE_PUBLIC
 pages
Date: Tue, 24 Aug 2021 22:48:23 -0500
Message-Id: <20210825034828.12927-10-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210825034828.12927-1-alex.sierra@amd.com>
References: <20210825034828.12927-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:806:126::15) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR04CA0190.namprd04.prod.outlook.com (2603:10b6:806:126::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 03:48:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07e13742-1283-49ac-c7e5-08d9677b3eda
X-MS-TrafficTypeDiagnostic: SN6PR12MB4750:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4750A78BFD401F63B349C40EFDC69@SN6PR12MB4750.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IOzwYaUoFGa/UVAmWj4Y20MDKxcOKors/9tug9DIslOFhb0aPWWFVlrvjXwyhbcXJEf4hBpQTG7Bj+SqV/i0qhEv0jgDRfbuMYMkQpbE74WoZf9nVEPd52Z0u0076RIQ/R2PprEEzvB40dRNaWpjw2ZBkLzclRCvf08OsA/1eekfROxlYj9SMgFjfVnABugajy14ZQZ7f2U2uYB3BFYdGYQnRF4jwKZDBWbTEmTDMvv+xRLJLM+4wp8JqamLQcmTZndViI7kDuzsQwh4p0ovolNibSrMBAAGsb0sl4VsHTiG7qjbtN6NOeQxgUjbOOgIkxy5+iA+CftFyZys2xg4ZaHVtVIn1y/kCxUVylUlbIbjJbeV72/kdwNZSvsd1YCn9r/D4l2Uc0OAaawIDku11Y/gDah8kHz8MRmSdTYFSY7DOiKBHYWHBP6emGtpazK+QMk5nu5jHdP//6ah+6a9jmG/dshKC45az8Zh7yTSnmlxm9AL1is96nkwPrPuvyFAGhbCeW1b51b1gTD1GhosZcPFXYZtZ8qdCheH8rAWzxZ3BDdB1hG142uk0baDC4F4BNiXErSMOfwxKM01vjhRRIYVlmD9fGHmo7lEdoujDLtgtkZH0trMIeII8IdkXY+4ezqjGm4Zl3jU5/9KE7+6LuUl8gjgeMgC3ynwrz8Guf13ZYrjzgJ5I/ZPEnhuelCJComzrxfBlqRW1w4Txca53w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(7416002)(6486002)(1076003)(4326008)(86362001)(7696005)(44832011)(52116002)(186003)(2616005)(956004)(38350700002)(38100700002)(478600001)(66476007)(66556008)(6666004)(316002)(26005)(36756003)(8936002)(5660300002)(8676002)(66946007)(83380400001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zM+l6m9ewFv9GDdKrr4FzY9egveAXoCrmBAs400kxk8bndNvhI9+Ay+aXVUI?=
 =?us-ascii?Q?XqSPxKVRaDMgzQvIRiu/Ryey9GSMHHrmTghV195u6SAisyPS2uNHggZOHgeu?=
 =?us-ascii?Q?Koa8lChJY7tQ+/E/fqsm0lFeDCwCqoq+KSawR9QKFR96JnbJj7KHawEPq0WP?=
 =?us-ascii?Q?0YlE37/j2vCOwDhUQnfcRQnOUiv5a2EU6CPP8VsjKgcJhOfYjaOq6X67EVRL?=
 =?us-ascii?Q?pGfOrQ4GdhtumbP9OMV4U1e27f82/eFR85sJpi9kXubkTk1ji3+p49eeRlnQ?=
 =?us-ascii?Q?Y4IqErJ7re/2qFIZD5ECuxD152F8OYBnbGUNm0rP9JV/+jie0nCvUW+iFLpo?=
 =?us-ascii?Q?AItkou3ZWRdWhig2O+L8h7OVtKaifAxgPxGwgeBZd6ZnRzkUQtNGCEVqfFCC?=
 =?us-ascii?Q?28pJeQ8kKJTEZg9NJCqiPsDTiIdeGw7ZABRCU6yTL7+tXL9A0z9YVKOdGA4r?=
 =?us-ascii?Q?EVSmtYJV2ehQYp5UFVsiaY8JNfKR3TzK1IkbwyUZyJzu/91kiHpMtRzm1SBo?=
 =?us-ascii?Q?XaE4TDEvBt5Jt5oTIFJfbE7p+oIO4Kxw0bxRxYRLd9Cr9DbmrlxV1mTVovQD?=
 =?us-ascii?Q?hZwGJCFRo37lmH2iYJzed5HjJevkmhMyByodsEafMuMCTe+rNx1yYJJlhw95?=
 =?us-ascii?Q?qDWsfhIvc7W1RAt//ttlgXst13h/HnKnu1ftNOi1IuPFKl3iK26eqTVOkW4b?=
 =?us-ascii?Q?T0tXJQppvDS+Jq3eKhVvzmWhXljn+cIncFxgKiMBaq3skWJJtIMjQtWjFz04?=
 =?us-ascii?Q?BoZAGPHOpv0ryTIUVECC8mwem2/TJdf1Fk7eKZhcgp2SS7OKYFSK8+zKp3HX?=
 =?us-ascii?Q?IoQEAPGUtzVRyaLC1h0Uwgkwpi+LNpOCBEFaWzMHCns81whmhm8P1JQONZxC?=
 =?us-ascii?Q?DqKNV+1J8W1wFZR+RM2ciXSQDAA8gb9oJix4An7dNYFtaROTRpqwkgM5rtwv?=
 =?us-ascii?Q?ZdtJVHo/TKfhjf/8OvIBn22/8K+Bk473/E7oBNO/+0LIHe3Na/nZFoEDAvU1?=
 =?us-ascii?Q?pKltN994WETlz4LwoweJoGT2RH3bU+g4RCyWHjkVp2TCrxMVMRYCmjxxF63l?=
 =?us-ascii?Q?OGMTeK3zMqyrHI52a3qGqmRff6+C3RIbK2FAEPpCI84X3k2hSybyWZab7gxw?=
 =?us-ascii?Q?axY/02jYJvbd1fr8bWqwvm5DzjO0EPszm01DK8I2zNP0yUNBg4fyZbUoFzow?=
 =?us-ascii?Q?qo5M8udRdmUcs5L6maS9meOfE1u9ShB668zm1aUiHjsCeZcuADkN9BMqAbmT?=
 =?us-ascii?Q?bXXsoaQKW0z5omQ/34jpUjhSWHMC1FlA7DGXjEV1N3cGfmRFh5x245cjavIU?=
 =?us-ascii?Q?VHNAsDg3veCoKHyDdGBg2S1z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e13742-1283-49ac-c7e5-08d9677b3eda
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 03:48:48.5119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUi43sRiTWqOZ9Jk6uDKa68OxIZ5JLfrUFTKR0vyjLgI/uUDOOAkQGj9cDwiNv18GrV1QWfWGPDp/WkF2XdigQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4750
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

Add MEMORY_DEVICE_PUBLIC case to free_zone_device_page callback.
Device public type memory case is now able to free its pages properly.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 mm/memremap.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/mm/memremap.c b/mm/memremap.c
index 2c8898ed006f..b9a8ed089cc6 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -460,7 +460,7 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
 EXPORT_SYMBOL_GPL(get_dev_pagemap);
 
 #ifdef CONFIG_DEV_PAGEMAP_OPS
-static void free_device_private_page(struct page *page)
+static void free_device_page(struct page *page)
 {
 
 	__ClearPageWaiters(page);
@@ -494,13 +494,14 @@ static void free_device_private_page(struct page *page)
 void free_zone_device_page(struct page *page)
 {
 	switch (page->pgmap->type) {
+	case MEMORY_DEVICE_PRIVATE:
+	case MEMORY_DEVICE_PUBLIC:
+		free_device_page(page);
+		return;
 	case MEMORY_DEVICE_FS_DAX:
 		/* notify page idle */
 		wake_up_var(&page->_refcount);
 		return;
-	case MEMORY_DEVICE_PRIVATE:
-		free_device_private_page(page);
-		return;
 	default:
 		return;
 	}
-- 
2.32.0

