Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1120357C210
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 04:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F74112A4A4;
	Thu, 21 Jul 2022 02:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2070.outbound.protection.outlook.com [40.107.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47F112A482;
 Thu, 21 Jul 2022 02:05:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Exhr+zsB5gXuoqvBZWZqy/vIvfM8vjliuMKL6pavopDVw3PCoAPLXDeG4+qIJGV7Cd2Ixv3RsVtKYhwsDRehcYHgOvGGf6pAZhtpe4fwd7SwbyYvbh+3C6U6sYyZnTBn+5xwmm3q5GeHR9mP9+u1eMnXn17dmEOW22u4mwQfMjms2swZ9+vSQoaTuMS/z4PEhOT/30wkyAfOAVRqahDdZXNy7LqL8uJXWjBbJ19Rw98DsuJJSwv8LIIt5WNV23Ztn2H49s6lYkCLSy/wFkFI5/yCLoJ6it8H8GNbcDEwOjgE7NojLEdxpkmZDwrx/9Ac2qajZA2jSGocJxFgiznblQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYz83FVK4RS0WmDrQO7yBE9ROV4P2MNMAmPLjozOw64=;
 b=TNNuRBEPFjLqwaKsxcgGpil0eMGEkz9iX1zxwHQ7Gj8C63updIwV8iZSwFE6NVnd52s4S4cV6QcoE9exJFT6pWQZ31elAhk08BNQRpaND6TEyz7rsumO+OXgjiwrCGDlbvff2/8onS0N0BiWQY49IQeA56RPEJZpKZcJqtDTvaQOmdlRSrZ4ym+9n0dYFizYK2jr3XN6G8bOjIbFb+pVAjjwuRBhXp9OxO7JUbweaXnTtudM8MGGOFY0ZIXDPPZj2EJnkr7oDkjlynj3aCwcKiGR4chpBu0xIaaQNZTZVBcGRvAjoYx7bplOu56LPeWJm8LTZlJFWkKEHWULX4kMTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYz83FVK4RS0WmDrQO7yBE9ROV4P2MNMAmPLjozOw64=;
 b=SSDFJmcLbOPh5apJ5F6dZw/2lWAQhOkPZTgdXTe7s+zurZuPJ3efxvfcg2U1X5h9LHTBEYXRwfPiF9ciRS3s7GDzbrPiyiCGNZ1kyKIRcdNkbCZQ5GQI36fNW6Af4gPHmvB5at9O3CLz5uKe2O+wiB5mv+Ukj9VUCoe2CoKI3i5BSRXeqf9zb/HwIDa2vmJmaQAbrmdisebVpAmTSZUO6VK4EfDGIs2aa8+N8fX2NYi02Xy3x0VNFhA+42iZCj2av9UCQZMrjmUMZaerSnn9WoUQ6z1afKspvgnDha6TvdEzfcx98TXWtzKXo3xqJQeMfvyXA13uPuRaG2jegqKpMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by MN2PR12MB4317.namprd12.prod.outlook.com (2603:10b6:208:1d0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 02:05:57 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::eca6:a4a7:e2b2:27e7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::eca6:a4a7:e2b2:27e7%5]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 02:05:57 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH] mm/gup.c: Fix formating in check_and_migrate_movable_page()
Date: Thu, 21 Jul 2022 12:05:51 +1000
Message-Id: <20220721020552.1397598-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0189.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::14) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca9cc825-4009-46ea-3783-08da6abd8cff
X-MS-TrafficTypeDiagnostic: MN2PR12MB4317:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H7NaxNE471NCgqreJe1Oy8VBQT/TBVJF+pTWMuNxxOrnJJRtOK9+vAy4sEib0NZwWTjXtZ28Q5m2YiMEHaJYq8B7AsNBVs8nBiFsGpabqXYL9rL2QBQKZRhZtSUdOXC+0gN2hQJE2DKtghSKGdug1fcMfb3PVH5PJY1ljMq727Ek0IlaLI+yCfIsco3WjWpim6R04ijW9UimD/Uv0UZGB9DAgBsBxCnt4V5CcdTDavvwkKk3A/NoJxim52S0x9xApiJFxRSATxTua2oNliQdJTaSQ+MHg3XjVCeAypKMeRAvkXIg6UCUgsxe0LalZxgdsGfeoWx5qOY0q9AiaENZ2+74tYOrbUwn1KSjYDgPHAlb3Tffe1jgXAbb/HzPudK96nnqYCRVzKa+h9y5HXkcYInNodsXNukAqzQeF52Gsj5EDijUs/5E1aISxK6klpyjNFBTnNwrW+cHcwGSNJMIC9hgUA9TPnXelkYF26A5zPOcdJclCWXTvbuB08ycSUmImwjQGkyqTrYdIvrHfi99WaEtyG/gBtRI14ZzECai3kp5TBxw+Nq/ks5wZ1GaRpAH3nzFynqULsOphMPU9oVsH1x35qZzOpFiy+OEquU6ap3zaEE/tGWbkjqlESF3mZ71L0UPlEKlNA3w63NZApB3NAbuB9WKIftlEgJWFZiFHjz0G+fHMaEjCoCsZ8M7Dg477tyPM0BbN7tp5TRndeDjqr0kL8Zx5uIpRevu/DRcprB4mEjKCakyf6ps8sDVtkNc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(83380400001)(186003)(107886003)(2616005)(36756003)(1076003)(38100700002)(66556008)(8676002)(6486002)(4326008)(26005)(6512007)(6506007)(66476007)(66946007)(478600001)(41300700001)(316002)(5660300002)(2906002)(6916009)(86362001)(8936002)(6666004)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WAjzoIRWV+p4m9S+oqZcZGkhYhW3dLafgZ5yiLB61ha+BRIg3UtS2Jiworr1?=
 =?us-ascii?Q?kM0KODeq2yntg+VdDNMsqDd/VEUlMsCZWPE1CJ2JnOllskUdhKEoQELHLDAe?=
 =?us-ascii?Q?t16j7SYhEVmGObgVbnYqLsEQ6eWakj4U9YiUqDD1e7NMTov85uwMhW6mbwBi?=
 =?us-ascii?Q?qr1yWnAxL6hpEfXglTj5dauja0tRAKIAh09I3Q5I5k6ZQDQituBVVnmjwe6M?=
 =?us-ascii?Q?fPVqKN9Ze08fBWD/JaplipDgzK0dGwAFl5VjIZf0f3x9JjUjlxBMljhbpb4r?=
 =?us-ascii?Q?cenwttzU0Kk4Ko92J6wEcfRPKdkuDvBHQUe1f0kFjab86GcfGpd9xVEH7BT1?=
 =?us-ascii?Q?At2cIeogbMi4+iQ/9XiXP4LIrLRidDitzVtTi1TnwNRZwTuy/vJqTdyG7/y6?=
 =?us-ascii?Q?H+FWcfvz7WZ42zM65OxLpgj3S9iucUxltYIoGiOS8U2lccfpJxnMSEi0nELC?=
 =?us-ascii?Q?01AQvRcniQLoQN6S+grqG4dpQ231+DEkbuuY+5/uUCBXKVep6SmzvBnViw3V?=
 =?us-ascii?Q?TOvIweg+NKYoDnOVei4/VlM6WLqDS58dKqYBLkTK3w/AQqKlC4NgQESmXes9?=
 =?us-ascii?Q?0ZfC8mOBVnKD7HDZmlkaQkN9h62furntgeeNH/anIqaFpQI//dyZWW/rRAI4?=
 =?us-ascii?Q?tan7K+r+96DgNXUZ+xMyAldKhyyJ3kkN5xzz8rMtubZRljEwAdAhQUbmJoog?=
 =?us-ascii?Q?WkFJLwKWnm4dc7LpxFZEl2UHXAo0e6S1t8MFaeGdJsPxAYCXC4uALv8jO2nl?=
 =?us-ascii?Q?CzYIDo0ePWGpfA0wz69LBKu6pbycgwdwJ5TAuLdmwaQzEXwEJpVLd+33Z/2T?=
 =?us-ascii?Q?G9yidE2WCbHlKNe+LlpgCXa8S/8SnkkASDtOZVtlFDeYdoXGa/53Z+ghUt2i?=
 =?us-ascii?Q?MAqs5o71eMyhbMOcAd3bFwhYdhxBf3oaSJweUClTCR9LOc9BSmnkwvnV/Rkh?=
 =?us-ascii?Q?W0/PqLhLabvMLSo7nyBw2WRpcILci1NgEA1ZrPLWuA+KynHWSsAmVKCcJU2s?=
 =?us-ascii?Q?w/sxN4zHpfkU/K2/XzXt2e9Og6qt9IQFfAb4L0HIFONHtIWUdsWVhbPEQPW0?=
 =?us-ascii?Q?cA4fCX0KSBHzoVwXpc1pM3BY4Wva+Q80OHXOO62DTB+v0RRPhDSfY6XPldmG?=
 =?us-ascii?Q?Lv6vWUuFsPTzzbU2gzx16KiQjoMQevcz8cQR1OlSyfk4rh0MrvNCY7MmeUnB?=
 =?us-ascii?Q?QM7A/VVrYU6QckWM6OG7pxpCsztIZzRUEjPI0AbiJcrLz3/N2jxedLHHcBiK?=
 =?us-ascii?Q?dOn/Jsq9cBI1MUQTfw8jPO+6O2Lcg9AedVyfoXoZCEZ1qLiG8/mN1gGXE4jO?=
 =?us-ascii?Q?CAKel5k8sad0FgtrGtiB+ckYMOn9xRkzWFt68yA+btQ+bBZ974BZmWFJPiR/?=
 =?us-ascii?Q?tnGikToAPQDcNmEFvO+u/mwmdrJIB3WO++YWKQc0uQjDvKkVtMuc1iseSg3h?=
 =?us-ascii?Q?6eFY9xuKsmZaDvk0InLMlqwlfQ/E/S/AKZg1KLqrJkHVY51RaDOEeVQP9xzK?=
 =?us-ascii?Q?1UpcVJ10IVNkEZUYEOm/qu6yobiFlRmbii+w1vqELST2w/8hVfSFrVsIsRBm?=
 =?us-ascii?Q?4iJzP4BJZZl6aFnvE8nqSliLjvbD7BiMJTvQPnJy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9cc825-4009-46ea-3783-08da6abd8cff
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 02:05:57.4964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yIkiQiqmcNzO4b929pnlTDdHY+vuX/rndPSyiY0c5VIukL91r13Iufs7o6C4arpuHOrXRoXxxCyb5Q+PmwskPA==
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

