Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCE739E8A8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 22:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A174B6EA14;
	Mon,  7 Jun 2021 20:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26266EA13;
 Mon,  7 Jun 2021 20:42:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hs8tsUdwCq2DUDTKbV3qHLz1o5I1Ezfs3KmD/xzfyi0U5fcM2EQH1sRy1HXXT0qcJJZAQS21CULSI7yGrOokSn6XFwM4P0UJaOZJbxHjQaW0v+eeyZLb8jRJHea97JILAMEWUObx3hjpcD197oFO3z7Le9aAyqbC2cVNtxFNyslEgkdiFoFxo720eoXr6tkbo2J4nDbwNepXA7t7ofHGIU9l5fQzw+OvH72HCghYwCcuzvKziwycuR9JjuCyHnPiZhNBUhyXQnaX/ZhRWZhq17Av5kJX4NG6bzVq2HPEnHVoQ1BdbQBKsQQShDbi52wqt8UPkaodeUnmNuXm0DFoRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBCtJUn76duHlCF8zpr+2pt1DTLoFbBMMCEIW6lwquQ=;
 b=BmK3WnsBx01C5PGjvI8BtYTEJJwiuaNStDmUhc0Wvmoe5Qe+vkWPw+Rwq1nWG9VEcsAWoXIE0xzBu8nizcyzB3OcKxs4msXosj9TzbK0Wqq2Utnkl+JwA1Zm8F/LENirn9owWXopl+s1Ci04oWUTedVAowCLoz37MUEX9kGqac73qRbaI4rZt8ztugN2YyZOjFWDqLdudRh7bo8dLvoNd8q9Q96ovC148lNd7RcOOqCDDHoVnCo7OtsusdFMk8FLwBei5ZHlwmfCC6JngyyFsb/5sD3GdHVOLRFaBhBijeEMWJxphAKMHPnKF2V4q4rZlIXDTGcu5it4/8kvWo5BpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBCtJUn76duHlCF8zpr+2pt1DTLoFbBMMCEIW6lwquQ=;
 b=qw/TfNye3OxbcwvnTDPodg+FYTPG/oMKJsqFBh1XaKZF7Tm6axPqLSPuH5CewglpTT39+PwVyi4UTK2w8PZmIw7zuroWeB7dVFv69NFEWJAL1eqaSNb5UIB/ZeTW4IsvKOgJVR9ny2cZ1q66gGyxn9kdXlafBdu+HhnM1RNKrmU=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 20:42:43 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 20:42:43 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com
Subject: [RFC PATCH v2 6/8] include/linux/mm.h: helpers to check zone device
 generic type
Date: Mon,  7 Jun 2021 15:42:24 -0500
Message-Id: <20210607204226.7743-7-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: bb5ea137-028a-483b-dd36-08d929f4ccd1
X-MS-TrafficTypeDiagnostic: SA0PR12MB4495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4495F66CDCDA3952804FA542FD389@SA0PR12MB4495.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:156;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0301Scu4T6QGZeANeVnaTlREaZohn7HtvaTwIhsQ9HuQbi71sOZK/DBaOgQJExIlgJVCHhWMKRqxOKPfj1lP+w1fkSBUYVEe+yMZIctFm+4iTgW3ZhVhDWj4iZa0ZqSBLN6Qbt8WkSOpawe3gFnuZTLSzVL+/BB6rzirufbl6dqrf8guXbVt6eRuDKvj9yyEspwb1aWA2LoZuOGBfukzLkoMBNP90lif/iSZMZKZ0M9pxmREeAxKmo60ToCn70Bxn3qLA6Bs9iwKoIaGKRO7Ti5gx1Z2Qt/HtQw3aiU35xORMKg/GTBZItJTOOzQSUSqGefbefXRaSdNrnDG08263ZcAWZaLtN2L5n9h6TNBrNQypaUxKzOrMytM27Ybkjz5jiQnqVQiZiTBpkJIqNFfGW/6QbfqUGiXSEaI5lgx8Y/5wv9SpeUk9JxJacWNHZJnFNRkm663Vuew6BFvBnl2TvkMBWxWaBmBYMHdVYecUahI0i5n4SGQ/77dxoPIeP68qFDx9C67irvVdaTSwvUGLYIbHOtZKIJEKcb4Zy5EuetFdoGyN2UsCL6ngEHvT7rPsBOAvGJZQQ10HfTuULHiHCcxi49SLyocgaMZJaHHG6ynuHd26lFWnkCluEdEkvewwoK7/wKyt7WSka9sj94GKLz7h4cu1J2UZNHPwKx30u8J7wL9ikmvl91n5nznY70x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(956004)(2616005)(4744005)(6666004)(38100700002)(316002)(26005)(5660300002)(1076003)(2906002)(6486002)(66556008)(66476007)(186003)(4326008)(16526019)(66946007)(44832011)(52116002)(7696005)(478600001)(36756003)(8676002)(38350700002)(86362001)(8936002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?y7tPIf8D2KCUAHgm2yzF92Hf7oEACHcLP+GBAsGKbIH/E3sSBAG1MaW9zLMp?=
 =?us-ascii?Q?a27deE4H9OzeWJL2wUd+p0fkITuVpRPDYZnk0b9Sh/WFaKIPHP9H+6GIZx6m?=
 =?us-ascii?Q?lP6SMR2Pz++ssolinAiBpL2ewrfSVibQNPTHVUlaUQWcxxicsByYxiTTmmyo?=
 =?us-ascii?Q?2uXaFWVOd11WAUvStmrRqbgLncEwXJF5v7ssd6Bsn1Itp58o0goMx6qVEkys?=
 =?us-ascii?Q?AiLpCwveOcUhbq+gEsJETP2dnnUOB8QDEeDqzkE53i4qfBKGJP955Dl93TLh?=
 =?us-ascii?Q?+77/uTHgylvW5slXFYXvqRHC/w/TxWx4k5kuj5Mh/7Vt1lSfpP0A2aK4JZzD?=
 =?us-ascii?Q?G5yW8Ur/dD9pshhpf4wsaiPKq1f9NDzKBF8tL/3aX+79ALAIlX5V5bRTaY7a?=
 =?us-ascii?Q?1e9ORNzXHbCn1Um+BVBV54vb5I+WfuOiYYeTPzaXIjtG5uE9wZNWSkJoAErk?=
 =?us-ascii?Q?0kmjgM8eAYyP6m57iVvWcH7k2TRfSHvFsEmdLQqHvB1iBph5XYtx6DqmggnL?=
 =?us-ascii?Q?5dcRRX0gHmR2lGiRTs490Sm9CnRJ13U1m/MfGzt9stnj5Id5xVUa4DOBwVKd?=
 =?us-ascii?Q?F3LjBar84yuLrluG5shiOAHyhuwFoyXELBoLAkm6Uk++QjOIbpWHbqoO3433?=
 =?us-ascii?Q?uAB3Jj2SYxsmzeJyqmOPPUHtGOW6ZOAYHU2XxADFBH8CU7AlEO8r7z1lmhpF?=
 =?us-ascii?Q?tpnpRL4BbfHsqnmVpKlMqgOMB98hj6MUT9rhxovUOlOobaXoF7VYn2gqyJw2?=
 =?us-ascii?Q?xv+i2V4QVU4FLXV/I1wtNttzfZRmuXw9Kl340n/q4SLZyMuBfSN0VkkBlKNp?=
 =?us-ascii?Q?BED1o//JWeoK6DFVcmmh1/V3mHf4eQXmJOaDXoAZjL/bDe6blkJPuDut62tj?=
 =?us-ascii?Q?qZJssZv6thqvRxloND55LCK9Te6zbvrOL+hZysSEhyzAofOOxd1FlZJvnZUl?=
 =?us-ascii?Q?sZ/YH7vXQMHH+smJlZkhgfLckCBqjH7amnQZ8pzPaw0RiihLCQtfjHBbES2X?=
 =?us-ascii?Q?qi6xdgrSZ9nO5vPSVySNXAaTEFZpme5+hhQmzSEYW78RUeFF8f8n+/4i5UFu?=
 =?us-ascii?Q?p5qtLE3+UadAbn3P84oHSVNsoClSrp3JtR1aHVDabYqhMqvroc5eeMqHX35F?=
 =?us-ascii?Q?I0oXzzGWLifJaomw3qHwxnxEq/7mfQptvJO3jjYr1yD7op8AtrrUJ29d3J+W?=
 =?us-ascii?Q?lCy/VFikk2W65YfYfuMLxEkVsOH7080J1ImUhj6NcG6haEMZnCyK0UFyApb8?=
 =?us-ascii?Q?I/msRM7y0vMGqxOy7g1yvZRmK+Rcpg1KZ57l7DQLpW/PHUnTzymcIEnjj7Kl?=
 =?us-ascii?Q?UMT4r8hc3lKOxsjF++4DKlku?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5ea137-028a-483b-dd36-08d929f4ccd1
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 20:42:43.5825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTsbg1DRDakzjUoltl07w7kGltAvRtMHCC9Y5EIV0FwN17lueP/Yr+iDs9B7ViOQsUBSCSMWXkOHAoOIGQ8GBQ==
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

Two helpers added. One checks if zone device page is generic
type. The other if page is either private or generic type.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 include/linux/mm.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d8d79bb94be8..f5b247a63044 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1125,6 +1125,14 @@ static inline bool is_device_private_page(const struct page *page)
 		page->pgmap->type == MEMORY_DEVICE_PRIVATE;
 }
 
+static inline bool is_device_page(const struct page *page)
+{
+	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
+		is_zone_device_page(page) &&
+		(page->pgmap->type == MEMORY_DEVICE_PRIVATE ||
+		 page->pgmap->type == MEMORY_DEVICE_GENERIC);
+}
+
 static inline bool is_pci_p2pdma_page(const struct page *page)
 {
 	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
-- 
2.17.1

