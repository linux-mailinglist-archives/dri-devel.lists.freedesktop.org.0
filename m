Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB9A57C211
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 04:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C6B12A42B;
	Thu, 21 Jul 2022 02:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267EB12A3A3;
 Thu, 21 Jul 2022 02:06:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PT37RF38uRBCVhQ0IDLXpl8/+7Y1thWFeb4P4GP+Wrcw81+d+U/XQw9VQcfvkUEi0pfSfJrNrrGRyTA0zec+NLSUW2uQaXQGuUkxc+AeT9O6bUs/W9spvfnpKHYtneaVwiLJ+dYkk8XkvAjqQyDNsgAe94tQsuXKrloAufED6wjgFDTlHK766lNlpwopnGLg8PA9asca3xSztX6t3aHYNThvC/77cMQJtYfQjpzVJgoAAHO/RjQom/ynaP/7C4KIyFmoJJZX4TV1a4oSe8WQEoPFeLdFNgfJLN/aov3o2OS8hH6XCc1VaegybFCnnF9lD2yEx9dk84QYSgf/jM5+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYz83FVK4RS0WmDrQO7yBE9ROV4P2MNMAmPLjozOw64=;
 b=mvcv0mk2u5UxSmODmNezPhBLz01Ab1bdCgvipeKPNU/mlS2J3T0NaAAgp0kI7LWbqcl3fUPUm4v2tK0BXEmPFiegFnLonxgwPhEWaQz12WM81fD96SNIGnBU3/iLw77CJJSWv+XjFyUJnd6F0qQWl0GcSPdgiHyaYJnZFHgVSTwCTyTq2k25I4sGvC2ZJsg6B2j2S/7lAEIqFAURdorQLU5NxKy/fVxiF+F5lKEjQfumesoQ5p7f8QXWu3zWJiyesI0/yXddLxLvRKu+8dcdn2QWE+2Su6PCDSuuIhnZO5qHero9W+zrXZgewUvi2d4yAQS4mOFtJpCy6fcD0QjxBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYz83FVK4RS0WmDrQO7yBE9ROV4P2MNMAmPLjozOw64=;
 b=J9sVYuzqY1xa1yP4k1lQm0MNggDihnFvJLKuWpqsU08aHbT/ij11X/PFjWns1alst90n+3VlW/hu41ery7FksXemZDJyCcKF9och3q7znrusfz7Oi6g0vortuFLh/U+dmPiwDmhKePoOsMZgkk3QnvOBoAeq/+Lav3IC0iHYO9kMHJRumMuJ2cQi/IHo1mfDXLePGZ34MM3fdszgiZnsQDEFUA1tJvZjxJTJbMoxv+tjXPWUquaOm+L+tuknhp/njYLOlsPszGj8tnnVXJ0A+b734HE2EJdT0mKx/rIKZ+pTttl+hzbng1echow3aZuTXjhOzHVS37Jtvkezk6HGxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by MN2PR12MB4317.namprd12.prod.outlook.com (2603:10b6:208:1d0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 02:06:00 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::eca6:a4a7:e2b2:27e7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::eca6:a4a7:e2b2:27e7%5]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 02:06:00 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH] mm/gup.c: Fix formating in check_and_migrate_movable_page()
Date: Thu, 21 Jul 2022 12:05:52 +1000
Message-Id: <20220721020552.1397598-2-apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721020552.1397598-1-apopple@nvidia.com>
References: <20220721020552.1397598-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::8) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01997833-3089-4b14-7d38-08da6abd8eb3
X-MS-TrafficTypeDiagnostic: MN2PR12MB4317:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9oeL9b38MZU3jiQTmlqlQJaddb97LG+2leIRhTG6Piz0sCwieQTp4tyKf43s8QrxE1l4YDGbugutkN/bTQQoyoUrn9jkWTiHD2cTaLSqRpH2M0t+SFzdizX0jqTz0bq4iPD8/SMBiCCqCN6h7dtcelKeuR9OiNNr/AGnzWudhe97OW/F6hpb7+vGSs8G8eNMZaD/Sg/xKJ7/JCd2QGCrx0jigq8JmBHeKIETycrsBnva2kwGk1e9JirCcC+ZHv5Jo6ObQKPanTBwRd/eMMpzS/OnDrgmENo18+1pR7SPFScIkrhH9zyvJtDO2N3QdEuN61BlHRJAMAkeFQgyyoBC0RCSngIBEYCkDDc1PqnRz/9l00XDvOfuBwZn3NWjW8kHNGKMHd5tjMkRBkCq/CiHXWJvXnJHimNhVAe6TkouKipmcz0Ioh5VsI+C6sGhnbK1bLWxprth+NKAf0z+NwAJdfJRcHINhPHw8ToIjtnz/YW4f/s1DJ76yNqOk9B5zrQhL+QiTKViJ28V3EGVXA2JmpKBKbIVCq089icOJO8SDJJ1jRBIOGq+ovLSnf40qun8FCxWoICj9sqINNSJRdKad5VCAltYwhUs0CoQ0EQuz47x0j67nhnuD9XO1Er6r4CcrloSa2qnuYKqaFzq/FmD4TwsPTYS5zUGWIJT9+gYGe/fX+6oxOYfux8kJfMUrzsbQkVHKD6kCkH7EGR5YR3zyQmBEL1UxKo1oOF9GkMPajpDwW+hpDpZhF5/rqiQ725Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(83380400001)(186003)(107886003)(2616005)(36756003)(1076003)(38100700002)(66556008)(8676002)(6486002)(4326008)(26005)(6512007)(6506007)(66476007)(66946007)(478600001)(41300700001)(316002)(5660300002)(2906002)(6916009)(86362001)(8936002)(6666004)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zt+55peuzLkbv0cJTQypCCOt9YWfwVcJRB1/V/tgCjfuxcMPHjHWTIzwkNra?=
 =?us-ascii?Q?2nR7lVMAa5ABZd/prpjHaPHl4rrpYsJ0za+W6i9+/4CzZ03W7tOuDrWb/NNt?=
 =?us-ascii?Q?TJlrGdfTvueLsuPqwci8437odCfDOhlPQNuWnYYf/qjN5MIZdqrWBEsly6Mc?=
 =?us-ascii?Q?DINU7jMBpmQyjEaeYnMkfuf3XyTWkl58fCpVa3JV0uj/Hnh4WdOznS+UEhmv?=
 =?us-ascii?Q?+TuXCqiz2egstn9r3opz49oIvzV9TqTGDfiH1x6hpg/sBBsB3BL5oNDgvFn7?=
 =?us-ascii?Q?2eapuU326wpd2jVSp+pqV+EBBDRGJOOsmFXZYG8O0Bd8lyXhyw9anUr1m1AF?=
 =?us-ascii?Q?i/OucIiSErkrCSA5KqTaTUDnZOh37jLNfCYL+GRA90cYFdr3YdFJMmZ54w72?=
 =?us-ascii?Q?UyKjzjcSAuTrUoaZYyDHQ6N2Ut7Q7F4xZFONPsWhKiJMH2aZtp+qHKP2LeI9?=
 =?us-ascii?Q?qfS6buYIVh6LSeWGZI29isdYeXQSbvHFAyS1gwoOH32WHVZmVTQ86dFHx/KQ?=
 =?us-ascii?Q?wn+GdPpHxEdUKfh2m6kqkz7kYBFdNuBvAeoc6xCuEbeylEh/UJ3k/WqM47WO?=
 =?us-ascii?Q?5WAsSOfXzHgsfJLRlWHjeuUcVoalR45aP2f17Wr1xFW47+RMrz/CvAwvxFwT?=
 =?us-ascii?Q?FxFzLT99/ttyXPg8XUSuOZfZ0ijhmOgwZMI0VVItL00mFD35KLlYOJaYVv5O?=
 =?us-ascii?Q?kE+t7A4+PV0wgz7GYxQgaQ4/iMiCat0//KHUOClDdqwloWe+T3Kni8MRooAk?=
 =?us-ascii?Q?1f3nyY58Xz+NAPZFl2rr+jkmLWbGXMqtgRcs8dbMLJ6b0mb/yzkaiWElai59?=
 =?us-ascii?Q?PsD2r7VKDsAw725BYmqRgy/iaxAaiH/Romcpiov9od48sgWtRQxfDnbNpfZJ?=
 =?us-ascii?Q?6lsP0ghzJ3I83wedU57UB3mfMv8QT0yfb1nhrpAu8reNjqC9CdlTMkAPG4k+?=
 =?us-ascii?Q?eKfGsCuWVNVp2oyJwxA6u3an2G6zcfQ3gSRy/UKFqVwDpp9xGpPIzGKyAB/j?=
 =?us-ascii?Q?YJAba2aCPrDJCKP3p7Ys36Jsw9AGUHYQAjrfmLrctiF6vuxP8nCvFEk8YWR7?=
 =?us-ascii?Q?xs9FXSPaLjMCHrG8sax0VMTrkkyou80F7OYdmgsrFvmXLZ7atZwIaiCIGCI0?=
 =?us-ascii?Q?kClNCH+nY0C8/Ovmx2zH+yDd2bFONLcHpsnzNl2/9turjb2rP8ykQxB8sxCA?=
 =?us-ascii?Q?WYJz7odQek+U32rS2anC2DCGu7xbCjWdF8SSqQRBOgNDK78C6dtPRhDJObiQ?=
 =?us-ascii?Q?YQZh7h22sUwboiXwyba4WfEYZkhxoeu2PUwyMBADA7xKxujE1jB6ONqE4UQO?=
 =?us-ascii?Q?kYZdGpIUGaGsNyNbF2vrTDqsN0o2laN0lh1iClEFhHklN816SFaNePL02YZ5?=
 =?us-ascii?Q?DvBdB0dMVtYs2IdOQkGx1a3obqAgV34o/F8neWjUAXKvYI+QEFK76ZAOz5lF?=
 =?us-ascii?Q?HpJqNikVIUO952sUQ05Ug7ZplNmZuKtuIW/XxxqLJQynfdISJkLpZaMcYiEU?=
 =?us-ascii?Q?6aWNDTSFdmQxqNrq5QqJGsGR745rzi2UHOHb7lA1C9HULrpQMesInCePVdj3?=
 =?us-ascii?Q?+RpTzv4figtCGaJNfh3IBNcP8305b3rCopteAVSn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01997833-3089-4b14-7d38-08da6abd8eb3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 02:06:00.4180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxGYAhz6yP57xVuIZ60qps3KfscXpkU0Df2WX2U/eDCKAYShyKwrVm+GOSa9t57ADh1r+5B//wcX8eGwrKLJJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4317
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
Cc: alex.sierra@amd.com, david@redhat.com, Felix.Kuehling@amd.com,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit b05a79d4377f ("mm/gup: migrate device coherent pages when pinning
instead of failing") added a badly formatted if statement. Fix it.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reported-by: David Hildenbrand <david@redhat.com>
---

Apologies Andrew for missing this. Hopefully this fixes things.

 mm/gup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 364b274a10c2..c6d060dee9e0 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1980,8 +1980,8 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 				    folio_nr_pages(folio));
 	}
 
-	if (!list_empty(&movable_page_list) || isolation_error_count
-		|| coherent_pages)
+	if (!list_empty(&movable_page_list) || isolation_error_count ||
+	    coherent_pages)
 		goto unpin_pages;
 
 	/*
-- 
2.35.1

