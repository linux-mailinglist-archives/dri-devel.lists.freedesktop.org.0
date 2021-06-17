Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 954143AB740
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 17:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D126E920;
	Thu, 17 Jun 2021 15:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886FD6E914;
 Thu, 17 Jun 2021 15:18:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWnYuBWF0AXgbTXoSg6+otmUbTPXIE520i8gl8+o74FLayFpv5lTO9kX7sTZeM2T71S4QU6UiJOAKKo8LtsMFrwniFJaFz0QZcs4txgyz1gAuJaP/KqOe6cKD5nAtWAqJ9WuCVciOT/EzwAhaKIoWGqz/7BOr6/5+N3VxQRV2ZleVBf9bTZV/X+FqX12NwAf09SfoA2XIN5wzSeKNvPLdTIKz93znqXsHZxQ5OEUTqDxnmnYkvYUPu1UEeCF/3SuCu8q5dl7WLulnv9rVeBqOGTyaIc3KR82D+nGUz0Bj+NaZx6NaINcfuv6YErznyyky1hd/BjpZEKkX6FkVptzfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBCtJUn76duHlCF8zpr+2pt1DTLoFbBMMCEIW6lwquQ=;
 b=IFUSXE9uv3xFPzWo7jQWD0hnw0M4DGhPDOUl0qnilsLJHckHa6DlFRCGE4zG69XeiEtRSRWuSZTZSjFi3DNATCYgLGg0e85ir8+bO//ilUFriPl3EGcsMwlZge+xV7kbo0SeZtQo3t8m33nWhI5fwPnUU2sJbZhCxaK5p9VkXqJS8FU/FWX/zHBOHPrTPHMpOdmytFx51rHYUfG0zooQln06P00s1IKbbjYHN+ByPOWZv5OOU0ELwZKeHOzGusGA4+7+lCsfoOvp70rRu3DqTMPvzEMK4nbmKh1II0GLKJPic2qAdJLLMv9E51HVIq/hUbjbH/+CUSCZ84RFUG0bjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBCtJUn76duHlCF8zpr+2pt1DTLoFbBMMCEIW6lwquQ=;
 b=JVoxOKe6+YpoZn/6bmK9mYOEbeO/PEYhu5pBh5cO7QOHRlqo2i1tIte2SfruDXzAd7dYtayoC4pOkVIo7KC6wQ4i0oXCMOBh+jMhWrGCMY1vmjpz9iB5SH7nlxkK/vRG9s+tYOm5OxUbd5H/Q6OH31/vJy+td38j5/NH29EX4IY=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20)
 by DM6PR12MB2970.namprd12.prod.outlook.com (2603:10b6:5:3b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Thu, 17 Jun
 2021 15:18:30 +0000
Received: from DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761]) by DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761%2]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 15:18:30 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v3 6/8] include/linux/mm.h: helpers to check zone device
 generic type
Date: Thu, 17 Jun 2021 10:17:03 -0500
Message-Id: <20210617151705.15367-7-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210617151705.15367-1-alex.sierra@amd.com>
References: <20210617151705.15367-1-alex.sierra@amd.com>
Content-Type: text/plain
X-Originating-IP: [165.204.78.1]
X-ClientProxiedBy: SN4PR0501CA0088.namprd05.prod.outlook.com
 (2603:10b6:803:22::26) To DM6PR12MB4419.namprd12.prod.outlook.com
 (2603:10b6:5:2aa::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0501CA0088.namprd05.prod.outlook.com (2603:10b6:803:22::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.9 via Frontend
 Transport; Thu, 17 Jun 2021 15:18:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ada8e25a-b3cc-4228-4012-08d931a32984
X-MS-TrafficTypeDiagnostic: DM6PR12MB2970:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB297021B1CF23140FBF0E9481FD0E9@DM6PR12MB2970.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:156;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BoN90s0+0UUQppTlKZvpKHkrzpjAXwaPOc4bV6vb58x/HPmqj/ElTJMPCrwrRQ+K+akucbIp45aYtu/zFri8mUI+5Mg2P9QaICoWLdYLsdH9cX3QS3wf/C526TN48Czb3RJD/RsLuluVx7cGhc0OAgOIT0KAQx3nXXQJfBfUg8pBtdysDBGiUghf2lGJjkZwNy8uWbag/d8xkX5nbBcKEVGMUH4wQloffNvvfSTm82HngR+So0ogloX0w4kRcQ+Kn7VuT1bnZ5+LTfpDihwAKE7PGzkLnAQiWHXvWQy0ojiZLZ1r26Xe+qcUfcys+1rdSiA/UxjfVtUkgS2Gb7NrJz6X+mdfK40D0zPaAxbzrs8cmI9DMFzryzR/K4kHzk31uENN2zVV3ST6sMCD1urYxKLFjXfi6d0MKBYQzPE8PyGESEsBQIZkbdz4hhxgTb+12u38EkON4iyXvUnGm+qHCnzJd4z0DU/hdDz5yYIYuTfEozB86veXrgxoUh7Gm2kw+2PnsdIHlj5IpC9ghzJ6wGvxF3rGwg8nKVeYzvjKbW+u33xvRGP5c3IhxOpVFVsyYCIUM4SvZ1AMxI49In/r3WXbkRzFEYhADKkiF7t0M5+3QC+pb4GfC9npYnGU7XZtBaVTcNbJWxwXHO54A+oa3zSu1OtMGHWtIWmmV08PuTJbT1Bs/rMXj98LfgxBRTpp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4419.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(8676002)(38100700002)(86362001)(4326008)(26005)(316002)(4744005)(2906002)(2616005)(1076003)(38350700002)(956004)(16526019)(66946007)(66556008)(44832011)(478600001)(36756003)(6666004)(8936002)(7416002)(52116002)(186003)(7696005)(5660300002)(66476007)(6486002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3E8j/8gIW/7G0bA8ARrMswlF4y54oK7Cip6C4IwQWU/IXhSaXmVqNMbDwy2B?=
 =?us-ascii?Q?fYQ6nxXGnItEwWSx1ZzYJQdrEBzjAQZUEUvZaQswitgiPrIzVP4CmOVfrS0v?=
 =?us-ascii?Q?Wyo0Xd1+G71kJY635ZIZkLq3ds88s8pjC+QMNiAOqgogmM0G178eCRlm+GpZ?=
 =?us-ascii?Q?C04w8K1xUl99v7kHgL/hzh3kTquZK5dpEwk9YmlPO++PHQ0h9WjWbUi2rgN+?=
 =?us-ascii?Q?trAtAEbmcuwXB9VA7dw9w7yM7y5AVSK2JDQiByFUnGwlt/8F9GGMSjNO+AbN?=
 =?us-ascii?Q?IB+Pcl3Q/d5wPPxu7IB5QG2gFqWucpggVXislU2x/d9ASnUe0kQ8fMRpSO3A?=
 =?us-ascii?Q?+LMMEjd5hNuhQya/0M7UNliPHCUQmDZMUwIU8150JIZnSbzMufq2Sdt/ysS7?=
 =?us-ascii?Q?U+VtzVExj9N8Vy+6kmLN5DCCJG/oKROXTQyy20cCb3l68jHe4JHyrYeTAkLT?=
 =?us-ascii?Q?pZU36w5MMH6p1S4HOtBA9V9ZEq1GUTwn2DZ6g6n9xsQnENqo6IzVhGOiCtJu?=
 =?us-ascii?Q?bkngoxXLqTESzBQ1NJAiMAzAmaOoaHyc+SiHmtasluQ7dPDeUQs8SCdqXEcN?=
 =?us-ascii?Q?N0ssJZhKUE2SEmhYG5VfaHV8+qYnt5VnHjJZgVIKO78cmJzgCYiFEOxM2WrV?=
 =?us-ascii?Q?CKFUU800iW6IQjLp13jhayAemzywOTfZ0RGmC6l2msqvZnR+0hjBKz+q0Bv7?=
 =?us-ascii?Q?TyOh52t1ES9YGSxKIA70h3TEbAjf+gVjYtK3/5GMmVYW5MQxIZsKcdKPWjmS?=
 =?us-ascii?Q?GiQHY7tChVx++LkaB0CLa0hxZQYggxpnEKg+Ahh21/YZ+ukF4CPbd+mqDxBq?=
 =?us-ascii?Q?rQv1sPabHpwoDHxV7Iz3ToVPIgFUVZFPr/tX5j1t8r3pWw/rIWdPCpfHs8AZ?=
 =?us-ascii?Q?wTTQbDN1WsGthEq3yHBjkA47y0hzr2I7zuq6Xd/BufcGDEL/Cd7k3ozJqzhR?=
 =?us-ascii?Q?N5W6mhhxIN9zB5mAFfH02zCz8FV+oRCI3vAfsneVm4xkOjxRjJa2WCi/zbPe?=
 =?us-ascii?Q?T8e0XSZtxAHYn6RXgVNd57lOj1prO+61RbwJPsyMDN4+o0EObVkDRcLFQe+g?=
 =?us-ascii?Q?2tUlPPg+D/+LT86BMfouVkJgh5+6JGckVc4OXbdQ74g+wtGyzgmZdCkiNZ/d?=
 =?us-ascii?Q?ZiRDC5sbKR9aEIh6rVaewe1OFufvBgYM89eEV2LlroNk2ilcYRyj6U3ifO8V?=
 =?us-ascii?Q?1Uw36Hvz+RVxP0SgieP4NnkEvNUi/WnzPgK0LZ6IiXIZpYZuiRpANABR25lx?=
 =?us-ascii?Q?yrVRV2E/x6NEAr0qsYbF0UgX2KIUFdujsCDfqV7TttUjO5wL0Gu4vMSGAEnK?=
 =?us-ascii?Q?jXcUHPT2xggd/tG/gSWMEmcb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada8e25a-b3cc-4228-4012-08d931a32984
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4419.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 15:18:29.9651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/tS81a/zUIjXckCdeV5/T28s8/iILr8eZZWQRTemEyFhO/boyNqu6UiVrPs961LzphWIocADRgSXCsCw7YsCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2970
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
Cc: Alex Sierra <alex.sierra@amd.com>, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
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

