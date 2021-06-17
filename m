Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE553AB748
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 17:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F726E925;
	Thu, 17 Jun 2021 15:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AF86E922;
 Thu, 17 Jun 2021 15:18:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Su5TomvLxZ1fLt3A8OEwwaWMJJSMx3V3isNQJOtCk7a0CYu9yzZFDTGjjnjgff8yhbOmMPhCr4hCc+1wbbJRr9B5loZxhXUTcU0IUiQiJDMMlu7Gn9ukDMOjMbFwOr4KTB9cIXqtwK5ZBmGViLApZEC8gD7vgYCogRwrRUcvbBgcx7VlL6xs+PfHTJyH6mBhcrjxsjcZVcZStHshLB0pxamIJOInP/sRt5jrXW5KF/Se4uXB+TOhZ2KW1EmFd3IzJPhVc/THfkaSWgferFyerQMtt3Vaj5HZfEyorWapruGmk2bUKjs6UAxoE6clRkyM5M2oDjooOLE/jLpKBLXe+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fto7oGTXuEchER0GieOzKEfkpiqMw64yv0w2SD6NgAs=;
 b=lGp6Xo2+rlxjzhL2DQOxUhcYiSnr7iFnekeiPDJ0jjz8a+fam4zSOhtEP0mLfmJmaLNPJMv7YTypQBigejbm3SjU/9ph7q1ODFETa98Ch+oGuE4ALPd+hP69TREtFCM8fzy7kdydtzELc3TYzGM15z00W6REzSDPXa8UKOnYePeml6U10UQxG6/ak+SHlmOkyCJL5peU3SZwNRAhHb9H0Z7g/fh0CyTdkhoT9/Lk6t1+VshW0OQ8JuM5mUSpyZwIDNN8zznkj4IFSJuuOrnvfUnQZyjaCW26BptmmwuT7xhXjOnr4DB1bWT1wjn3I/0D90YEQC3BalCbE3iTm2PmbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fto7oGTXuEchER0GieOzKEfkpiqMw64yv0w2SD6NgAs=;
 b=44IyS0h62j/MsTf/k2bizWLW6/XW6Z+BO5f/xxU5m4yH6BGWlHXgA3hVLMSH5Iwn/22BSHRp5K7z+upKLMFELpgZOd2VuQlwFNSuDiJY+qRn6JjDcrqSuMElzZcJvTBC7d7t0mo7du0MwfQOUmAvGEOGjbZo2yybQzG9Gj0GoU0=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20)
 by DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 17 Jun
 2021 15:18:38 +0000
Received: from DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761]) by DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761%2]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 15:18:38 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v3 8/8] mm: call pgmap->ops->page_free for DEVICE_GENERIC pages
Date: Thu, 17 Jun 2021 10:17:05 -0500
Message-Id: <20210617151705.15367-9-alex.sierra@amd.com>
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
 Transport; Thu, 17 Jun 2021 15:18:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c3e5518-b32c-4da1-8587-08d931a32e68
X-MS-TrafficTypeDiagnostic: DM6PR12MB4419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB441912594A20546B6CF3D787FD0E9@DM6PR12MB4419.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: prbdEARtjiVwmpoU2ubspx8qA1E4h+bBUheQ66S0xDTjsQeXg5IGKoC3W97gZyYtlQ+LDvuVRaavXsVHxx5gEUKtl6d5IDlWHXsuqrcUXPNVZQPmzpinQdLdqTUY3u3WTK//aVrJ1pFyrFvLu3QNt6kmJ1tJNvDl0iImuN+E603YAgfgYEhS12Hm5eDNlCmSWBrl1gayDlUbYmXanLYdiobg/QwWSPKgyrlKXr/d7zxJ18RDhJz2kejcRr3K4IGhVnvifS4NpyecyNFbXGFskruWnproGBCeh9qGvdXVWn6AOkNR+ZnvGW3SN3oQ9WmyelRyy8CDJ0rR5IHabCr3/QdE7Lpk0KvogMjxyfPdHm+Pr3EP2G081ST9SIRjqH9mCX9ANH6JJVu+5MYbJpqW9fLU6bcI93PYYnkUJKNgrozDRalfB7VsebD+4cgstrNRxa3g195+enCN8yuGWPdO6O/UZwHOSfnwGmvNU8ex8tWpUo8XY2zLe4vofJwAlBDW8RqinlHzP5oCl2851itSRUZslFbWvZzEP2d5dun3FeQPUKP+tvMpvtJS5ArV+Y2mCfWCJ8E1PqDyl+7LVztoHksgqonTlRE2rg18Wvm5O/f5WjEdgVvvDHKPgsCrH0nv1JlggOamd9MCOZ1R6BlmsJ2a6dzLmCZHXYcpt20QhgFPl5yeogjUpL7YhZBT97F5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4419.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(8936002)(6486002)(36756003)(4744005)(478600001)(66476007)(1076003)(7416002)(4326008)(2616005)(956004)(2906002)(6666004)(44832011)(38350700002)(83380400001)(316002)(38100700002)(26005)(8676002)(5660300002)(16526019)(186003)(86362001)(66946007)(66556008)(52116002)(7696005)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AEnLH+l5spL7tf/v6XRUU1tH8GsTIZl5pgLfUQvW/NYQ0vVBAr4BvBUUtiPT?=
 =?us-ascii?Q?pTxR9HU/savzt+OKVsbMpfGEExyGeq9RI+Tvg6vqypAfcwYku3/mWuNbpX5n?=
 =?us-ascii?Q?TcBSoNepMzJc3p//fNXWF4jAdtnVrlkJcGGOwwrMtWIp6ey+l+7IaGJJR9mu?=
 =?us-ascii?Q?OOeElLQtoLVP3AStoFs3nzKvM0EG4TLgMQBp2Uagwef0pO4BgS0owulkRnlj?=
 =?us-ascii?Q?lrlwPFpHmILxXC9uzAiHuYFk57q/7eZoQsZrtObflamWrTDQIbYJfbb5HxEJ?=
 =?us-ascii?Q?IrtgQxXUSvOZm5IljhI7HQ2rjkmAeIGlAHQBy/akQCdi8gsNof0fMoELR34m?=
 =?us-ascii?Q?WNz1gy1wR3LG4ZNRemwqVC+I79GRYHgtrdoVRvOEhzs3TVYTohrwwRxmunAP?=
 =?us-ascii?Q?hgLt73g5NJB1me2ZM8adc/LfbIvYf/DuWSEQmOmUqbFopi0W1/irOiyLYf/3?=
 =?us-ascii?Q?rqXHn1DGWwc7j6fN894H76nmWCvYB0l5Xuu8YR40Srhlr/PbAryBB6RCS3Fn?=
 =?us-ascii?Q?+HZO0+ZlRZZ82DKLUNnji89zApK+3QSLgmvf5dhn6V8JrqKhXt1zjFtk+P5M?=
 =?us-ascii?Q?k5B159MevTVhLGKuh5ql5ZYC64jUQuiqpqRwnqak9WSsBK4IIZXgeGxpKPMS?=
 =?us-ascii?Q?JhTLjudwYP3eU72DaeRrHkdG1cIMtta0op9Welay1orzLU7BRGVDAukvLoUv?=
 =?us-ascii?Q?+b48T1NnsVQ3YOMWx21siKoaoV4UhJvbyWYL5HdH0rLR7QgGYPcuezJC+8Zb?=
 =?us-ascii?Q?UqURMq2J9x2zDqd7z8gecwCaJcDZCRbEETAIQVKLfPr/xVT4YycoP8atLGTk?=
 =?us-ascii?Q?HlvZMRBLMG1Rp3P4wZJnvjJXiRQXQIUZjT/Xr3g1T9EiDK8HF5NCJ4nmP5bT?=
 =?us-ascii?Q?nGyDdtm4hLGnRfcw9NRWdfhiWEk4mQ3oN4Uu4ZJHNXufpagMKGDHu9Pt3L94?=
 =?us-ascii?Q?UiE0y1wkHNhNZAKJHwt975UfV0uusoMMFlLBMn8Ym+fAK9ckvd2dPJMh0BuV?=
 =?us-ascii?Q?nLeSecG9NZCBELr6OrQ720a5QGSmlExLORXc700h0IIdaJj7DdYHzqfb0ZTx?=
 =?us-ascii?Q?wsLUs4lZRkqroi9YJ2TuZkeiZZq2MJtL1rNdC43p6s3LA5OL+eM3ZGrAq1hx?=
 =?us-ascii?Q?UewsO1msibmFBQOYUdaS9xVfl0qRz3cVqQpqsrCDNwYxbKNd8YjPbcr8zme4?=
 =?us-ascii?Q?c9DaolVUyHMGDD1DAM+rcwRwEteM+KcV2TFaVBkS1tO/K6T45KbMf/FLsuUu?=
 =?us-ascii?Q?2pRITin6TMZrGo46MvDTOIBvtF+XfiA9W22OfnTCXRMoMDhfYHTwx+n150Nf?=
 =?us-ascii?Q?BZF0ZGqWDnUlUZI5Owl+dJVK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3e5518-b32c-4da1-8587-08d931a32e68
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4419.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 15:18:38.1361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XEHR6JOUXkYDVCoTv94a7lxLWnsQfXyFrojKHWuYblJ+gCMpVURrYWdox/aiC+OgeGyhWWDGqqLATCMR1hhSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4419
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
2.17.1

