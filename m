Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4A239E8A9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 22:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297D16EA08;
	Mon,  7 Jun 2021 20:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE3B6EA0C;
 Mon,  7 Jun 2021 20:42:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyPK6DEdIRwPbYQ3d00NCjGkFGBexRXZqDO6wDWK6IO6dJFxPcrbQao0CYSMG+wNszBANTkqgKdjFDnB7eCwPh28IgsWTNnsPul8OPih1Nyce4xqDpavkCA9ugqvyDI5qp4zwOdTS27C6MHQSxst8GCRDIaRmAkOgnI3bXCbyigg5BtgKf0/c5vN83fTYwAcHwc1CdoRLvjs/AWEgcyIb8cPa3TnDwaISO2NwTYHMsGwcRY47yslxv9S3Es6dx806RQA/bLOYrWWEBfUDtZP2AlvKmIBphugzGfr7M6b6FNeBqn8uYzfbCfdPfMjxwokw++CE9GJlN/T9rUlEX7pXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZgqia54AVI+Kdm1/0jPmLtYO7Hb28fRehM2Aoj8kH4=;
 b=LIOzptCYCVGGJAqYNFf5vQGlUcioze/Jgyf3MGjBVt1e063SardFEUwTQTF1rn9HJmdk7Pb7khLtqTAH0liP7rKBojBVzxJnpSjSRUSkD5HVylW0ZNAmY/Xj20KiEgWhwMAkyYcrfeLPAG2fsUVhRy7SEPQIhr+YyjZ16VzYKMd81xS4qZ8745YhAbhC2RYDvU0pC858az8RD1w2f2xwbiRhcQPAjGj9kqMzZ+t4vLMFC0ByqvPIUyOSni7Yvxei7lLcACGi1zVsNaamN6IvbE7dRF6zI3ocy/qVwHvUekuS+Yiy66vuq4R2V4vGyiVd54VVDRQFRY1ms3UNld+aXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZgqia54AVI+Kdm1/0jPmLtYO7Hb28fRehM2Aoj8kH4=;
 b=u0KT9dVZ+7iY6lQ2tMKi8pVublaBpD8ts9Z/l05X8MED3UXXmpv33UeJhjc6dRhbLuwZwe3mg83OlOrDmHVrdfRnCw/yXFtNt7Kl3jAv5zxaqfXqhFerAl6BpSVXezqyl22Int6hTkTzgyhuerEzpnskIRqw9ZPkPiw64inTtmU=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 20:42:44 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 20:42:44 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com
Subject: [RFC PATCH v2 7/8] mm: add generic type support to migrate_vma helpers
Date: Mon,  7 Jun 2021 15:42:25 -0500
Message-Id: <20210607204226.7743-8-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607204226.7743-1-alex.sierra@amd.com>
References: <20210607204226.7743-1-alex.sierra@amd.com>
Content-Type: text/plain
X-Originating-IP: [165.204.78.1]
X-ClientProxiedBy: SN4PR0601CA0018.namprd06.prod.outlook.com
 (2603:10b6:803:2f::28) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0601CA0018.namprd06.prod.outlook.com (2603:10b6:803:2f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 20:42:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9729f883-244c-4de4-019f-08d929f4cd40
X-MS-TrafficTypeDiagnostic: SA0PR12MB4495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4495A26A750F881BA4822E76FD389@SA0PR12MB4495.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7+F4taDjcnpxGos1jOTygB8i8JBXXCjUxCmOiva7gm2sFu2aOpT4lavmWKvyRRkAqk0qDu6TL2PO54CfMLj29BKmr9Eua2kIJhjMV2WYovBE5IB0AzfSGkcD9PIX9E5q9dawvfihQxhdNt0uGCRtfYQyUqNQT4cc/m1jS/I+dVRClY/uTihfv70K9/g6pbFUpWHZj8XfRSm/bbOUCAjMcnzd5uSGnU6FtOLR6mj5lFUvf47JtzFsMWwXombcgJXU6xO/8VGLCb9kykMKyhv7oYUmsqoD+Eg5u0zCwsSRMKYv9udEGdJ7FfeElmuk+JbO5EHGQJ/wmnb6MAiHY9vNsVyE0s/d0BWt46MkwgKVunPzZp7Y+d/HLm5nOwcfjqy1mtzC1DCqNzgrdkipsXTUJAGQR4LscOibP7JPtQz941dJN2klhK96YpiA2CEpke1yZwfl0xXm6pfGkOm1wWFo32g6RGwJZJeoy12Wg7WACuVhdzUHXo7dWCgh7oErXWq6dQR5fKBViXMFGWEkScVS3keGW/zCpYbGixfmzpDDgaQKakQSyt91nnCkFd/68ZMgkZCtMDTthTJzS9xiSrTpIkrieAyFtX5cuFmvmw0uu3hacY4PDlKkf1TAO4bbqMyl9Avu49OTCoiNQ2FdATSMKdNcaPGUO5xX0PFeI+hJaY7CUecqk9cjuMULKFa+a98l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(956004)(2616005)(6666004)(38100700002)(316002)(26005)(5660300002)(1076003)(2906002)(6486002)(66556008)(66476007)(186003)(4326008)(16526019)(66946007)(44832011)(52116002)(7696005)(478600001)(83380400001)(36756003)(8676002)(38350700002)(86362001)(8936002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZWwl0pS1xLJYD5/4OH3cHACNY0L5uNfyMQxNoSVIQywZyn43+4RnPwfb3OY0?=
 =?us-ascii?Q?/dbOh+sFsFxJ0AVK9SwvFtAt7wj5m0ECuy9TWMuH3cS3NBuV/fVQxIV81/uK?=
 =?us-ascii?Q?W+EgZqKvzEB1ls7VAjV/WQ6RQRUjMo+KTV5mah1axHoJ5L36d6tQzHjuQAYN?=
 =?us-ascii?Q?myHOBAVzADst6RYWt+7X7GayqsuLOxapCS0gI0kHrDI1ATVg5tgbgf+GJGpU?=
 =?us-ascii?Q?jcWAeJiogRMbI+LC0CE5jTRcyyR3IDwoW+fpSjT8Ddif/LocY/Lzot9mQyDJ?=
 =?us-ascii?Q?nFFdP2ckq3X7qZ9CSyTBaX59OwtDD2SwQE5sFJX6W/rjkeifWNfSfHP6Ggjn?=
 =?us-ascii?Q?kmCMdVzICfH5GTygEytJlYR0I9SlxkZ4ZchpmxVKLQRV1OdcxfUgT8YL+aty?=
 =?us-ascii?Q?0oEHQeYx/XCQKQDJ8xNQgTQTh8dLViPduzEvWgbEqyEHVvp5S4dnbvF9sdSJ?=
 =?us-ascii?Q?C2azfOR5SBuYVQpP5aQB6vOa/R7TokzC/XBTSGv5XXjoC25xkCCxi0P95hUZ?=
 =?us-ascii?Q?NlWdNpFSlWE5xZFohyeN2b2n0+lV0muk/ep+NXr8xdOBxQVxYTeBHP3Gp6vr?=
 =?us-ascii?Q?fDHhs4zlODMdiZTdr6Ogh+qzs7suQbPinEPhiJNiks7QAXUSjyRnumwngtQ1?=
 =?us-ascii?Q?UvesbrqLL5agD2IwgBoqScPiPwk5+oHnPAP0vN2fIOfLGvsvfjOAegnkV1yq?=
 =?us-ascii?Q?jq0Jd1NgHRbCWaLHc7fj9ystWEZsuWOkiNjtPF68FtbQls2+FH1Mi7fqP9kV?=
 =?us-ascii?Q?grMu/Y312SU3/wEOGgkGC67ZKNuK4tcYQluaNMTPHe1j9VYf4vONGQsOomnY?=
 =?us-ascii?Q?nhgWtWFgmSlCh20JrX0+0XzMelhaVsvOsi8DzOBo72vpFjfNAdmFD7REQ0vR?=
 =?us-ascii?Q?xa4mjo+tuxcc9M8mFc51wrPEOq0SLFBLNqCqqlnrIAOnIBP9p+ECULZE5br7?=
 =?us-ascii?Q?kUsswwL1gfjxOeLCG/KgoW5QUxk/DqJe4mW4X2MT+PkM74ij7rPsdHuVGfmB?=
 =?us-ascii?Q?uyqe7Aqa6VBjKqXoNMtsfVyslQhvmexFTIYGCklhWmUiOLbqTS/kXmtcdx2K?=
 =?us-ascii?Q?5pZVqWUNAQJ0FQj07HTl05+OIiTl3Zml2SGYWhibKwbcndL2gtOPnRUJT/Pf?=
 =?us-ascii?Q?2spUyHs2rwxqNUcDNht3WWdWXLNMHAYl3/g7Ev8WRHl2JTbs+q4GhVK0MAno?=
 =?us-ascii?Q?uigj6NgBfnQukQzUXT7HQrUA9XQHJ5IXdVCqr4fA33PvaiX9rtMg7XbGdfrT?=
 =?us-ascii?Q?WA+kvsGGV3wM02utmbdgaOm6Ffyvdm2WvS7GAkliqlkpWknUDCXG1HojfEel?=
 =?us-ascii?Q?4lIHEHEwTZAR1Gxzc8C4vqz+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9729f883-244c-4de4-019f-08d929f4cd40
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 20:42:44.2864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFFaOo99AJqY71LR22eKHRH33NXUoL9iYIlpOzI+BVMFouvAYTsPrSHZ9IvlT9LAky219ofSA/7H94bVtY324g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495
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

Device generic type case added for migrate_vma_pages and
migrate_vma_check_page helpers.
Both, generic and private device types have the same
conditions to decide to migrate pages from/to device
memory.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 mm/migrate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 8c2430d3e77b..3b6aaba96fe6 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2602,7 +2602,7 @@ static bool migrate_vma_check_page(struct page *page)
 		 * FIXME proper solution is to rework migration_entry_wait() so
 		 * it does not need to take a reference on page.
 		 */
-		return is_device_private_page(page);
+		return is_device_page(page);
 	}
 
 	/* For file back page */
@@ -3064,10 +3064,10 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 		mapping = page_mapping(page);
 
 		if (is_zone_device_page(newpage)) {
-			if (is_device_private_page(newpage)) {
+			if (is_device_page(newpage)) {
 				/*
-				 * For now only support private anonymous when
-				 * migrating to un-addressable device memory.
+				 * For now only support private and generic
+				 * anonymous when migrating to device memory.
 				 */
 				if (mapping) {
 					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
-- 
2.17.1

