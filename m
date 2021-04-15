Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F1E35FF4C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378DB6E999;
	Thu, 15 Apr 2021 01:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5556E98F;
 Thu, 15 Apr 2021 01:24:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5m9NeXT5ZDlbigsOftGP8EJPZ1NunJHrmscvpXRfJO5B/tLhcyFJ1Bc1F3XTIRK5fJWYSK1WOAMLucdD/TT6ng3toiJ3RhpXEL+GP5DtylTM8GjM+EkRwtn/GowPOdV0ShM88miebf3nju/I2MMG7KrUMx9zUBIEugEG7hINT1OxOLSwkeIpBSj+yEFOTe+FS+6hgiTI+1lIG45Izrav+TYbmv1befQml54xFVzPdCcIw9p1Cpsst3+Ws4BviLpHvQcDz+W+jkJE1YPvE6e92wSxBLWekGqnd+jJiSMfOR4h2EGPUmDiTU7PopVIq0Vikyp9s7Lx1vrAAHjBJGq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FgbuWIgiZdll1yEXZTJPKfYTD161PJGQuy2rOSZ4lk=;
 b=dZdADOwQ1mcUbKbTXst38Kev1Zuw08vTQz4wyM5rCzH+jU7M1GrL/2IRPSgpKIZpDiV7XnEKtuWXc21yr0RK+y2uYJSPhBzlsnB+zKuGbnc7Dg2DWSlNmtrNnnvJC6PkB0Wx1m8XRMOO9k4IF5ZvVEIQ6g/HMQYEC2K2NIai0tCz9CiV7qOYF0Zh9MRAyj5Ka7S2hNt8bE9l1HXrdcd1kLLP+Qa6tpi2D1l7qQWBRdim4xZLYIwNZdoEKEwAD7eKIh5+j/H6JvHoTGPgEp7J2mxFEV1rD1AFOm+879yKGOeWmQm/3ySyfhsXoOoHD5eaF9VyoJypJAyge1rTviVunw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FgbuWIgiZdll1yEXZTJPKfYTD161PJGQuy2rOSZ4lk=;
 b=AYspTShjttIHsMw/i1wBcM63vDhDz7bFwftB/3OoPWghYDweQVioHok37IxYReAPIVJKSQm1UG4+Sa7gTrIfAfICxyuIJd96D/PHQP13xrC3WH2+SXhDeN1cTX0afV8RZrk0lHbD9g4ttXbY0nItjYck0RRlTEnmWS6VuR3H/+M=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3839.namprd12.prod.outlook.com (2603:10b6:208:168::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 15 Apr
 2021 01:23:58 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:23:58 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/34] drm/amdkfd: support larger svm range allocation
Date: Wed, 14 Apr 2021 21:23:09 -0400
Message-Id: <20210415012337.1755-7-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:23:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6f44274-65fb-4653-be0a-08d8ffad2448
X-MS-TrafficTypeDiagnostic: MN2PR12MB3839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3839DAAA42C7D8F85796CDF6924D9@MN2PR12MB3839.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xzNiBmcPTMM7AhguYr21/mpGlraB8NAo7fpty7upbFUl3DGZEoXTiXEDJQVfIj0NrHXWACKzHlLSWkBWPkYXW5wO0Yr4Mu2JXbyx+gk6r8otey+R+xhOTgWekRVhR+v41yiwmLY/vqVggGx7vWb8TA5SbYeemhwH68TKHToReVhNgFJkx1V/SHu5fhWQqF1EdUkTiJo9DSRY4TwnLOVO78TukuQOtobYfVLrdqAZ2Yvd9p9KuWl7yHlAGs489o4k/cEAnohlCm/6+GbqtWYXEuQDKBCsvV0dLZZbyL9Mev2c+cMpSPuedgI1jt08oATy9L2HEKCpuBAW710aGU+xSOrp/2YbFZCrd3F/1aCxfAt51WcmH1M+TZH1gZZPgMy8OVYJz6QHOrvfwvR7bI/tHq2YfzYxzq1OeWHBJsdBp191pv17T45kuhVT6o0ScuP7K72jQbeKM9FKKfHpu2VL/A6bR0ZpFBoFZfZ1zbQmUUahpo5Kl8WfzLZqPViWXllgwEA9YZ3uGWeq/jzjsfxDqqZGIYBBNJJrHNtwDWeakcVMJFehFZHmf1s6K6t0tjgGhvZreuVdm84INOWN0dDsRae1FDz1kbj8bGHrd+jNz5oxCJaaczvrFGMAdbsZ4oY9JoHay6uUNIbRlpB5y/96093N0VHu5BwHXRQkuSN8ns0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(2616005)(86362001)(26005)(956004)(52116002)(8676002)(316002)(83380400001)(4326008)(5660300002)(38100700002)(38350700002)(6666004)(478600001)(450100002)(8936002)(7696005)(66476007)(6486002)(66556008)(36756003)(66946007)(2906002)(1076003)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kzOnBRbk53wDyUiBHigfuGfJh5qSBUoJyb44RviZvVFEGr7tFuPm19SjY3n0?=
 =?us-ascii?Q?X4bxs5NvizXSYJmwG2WtokAm3f0BJCunBnjFTKeExatTyz7uWsXG0/r0uKLK?=
 =?us-ascii?Q?vf0OUumgQtAZrWqJzzpglIP13Qtsr7VqSzJZlAtqeGYPcxlUh/z+Kw3FSPEk?=
 =?us-ascii?Q?C4zvysoqWSHaC2f0/zAv504nOD8v3ZuqPYkS0Py6jjKEIi9ptBNJG63PgC7y?=
 =?us-ascii?Q?9eQvgFFkbvGzqkhXP3w8ADSTGrnYt7vNJOH9aC6IupTY7aISE/rhrBSKVGl+?=
 =?us-ascii?Q?rwL5pq0AHKN3VNB2z9kMidCsMWP6ggpJlLKk2dzdHJevr7Y320gxYQNnVaVj?=
 =?us-ascii?Q?TLE8pFwwIKpmiDcVIwPuiyVoyO9mlQB6hbz/E2MCFT9WpKbzdpKHLB87Vqgd?=
 =?us-ascii?Q?1SWe1tVqAP+KJnIAlLZ6BJer2q2WB5dtBDhbdlbhSj4GzjBKh+MpgVxbqZk1?=
 =?us-ascii?Q?JROknLSTIAHTA38OoNmhB19Ps7Tj5tdn02nkEv2esU9K5gZCOZPzIm1qIp5k?=
 =?us-ascii?Q?+kQ9wRM9C6ivU2/Gm8nYQFrUjB1lVpABWbSNBO3NsSf1MpnDzPJQXMS6Nizx?=
 =?us-ascii?Q?29kj1r3fVsQVr6eP8+f4pkOf+lbygjlCptvVZu+GFNe+iko/TaL5M7r6li8Z?=
 =?us-ascii?Q?9B82xsVIBGXOz85R7WUjMWEeEgwyAF9oS/Q+Yfme/H+t3Gnqw4rtUgDwC3I5?=
 =?us-ascii?Q?wq5FFUPOpiyBG9FIu4GsMMi6atCt/QizoHjqSUziFv/Lhd+c8iSgLJQ5YfG+?=
 =?us-ascii?Q?UbWqgu9Dp0VHnS+dA5bUc5ly5KYvGthlxAFWkduHypi8T3krOhWsI04GOoWB?=
 =?us-ascii?Q?jmgaeuRuIfnRUCTTNW8GARzamhs/jhnWp4qXCLFcFLLuGPbu6A4X4Gm5qgeU?=
 =?us-ascii?Q?9TqtnCUAdjSu6M1R6f/esLvBmFTbkwdLaz9l0/tGw/REsezMyER7dXE+zhKn?=
 =?us-ascii?Q?VPsYu9ASvi/aLJ2yhu3v08SQ+JRz8ZxAsdH8Zo4HmzGqyDWjCiyQAsBn+qZ1?=
 =?us-ascii?Q?mpiNtzLrrFbtDa2WMY128sxSiXYbWzD9RC8q1TX1D7fBrk/eIna8PFvixv7Q?=
 =?us-ascii?Q?v9ByVC2Yy8zuxT0M3bdhfM3+/IQnQG9MqxIwm8eeUuamPmTQKzQXEWOytH8N?=
 =?us-ascii?Q?C1o8/V1H6XWHkEE0SDE2MRRA//fCIB3iCCoPBHpjiIaNgkLdJgOHcpnq+xF2?=
 =?us-ascii?Q?Cw2l3H/OZNtH5qjtXWEMC/TlTmhAwI5/NsmkolYlvzaN+glvVWh3KuHC1N1n?=
 =?us-ascii?Q?wPym2cy6idliNX+JBRwNbUmdhezgZBfbmtEWEQwNc0FiOXm5d9p7097e3LAm?=
 =?us-ascii?Q?sr8HhFdgVhtFwViizFnupznA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f44274-65fb-4653-be0a-08d8ffad2448
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:23:57.8128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /iTf/jz40cvi4QsWeYI1A5ZSD3FSQgpCtxR4kW79Mvrf+r+kiOlEL6is9IJ/g9NaLK/N3i1t0kQzGicRXEGXWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3839
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
Cc: Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

For larger range allocation, if hmm_range_fault return -EBUSY, set retry
timeout based on 1 second for every 512MB, this is safe timeout value.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
index 997da4237a10..2741c28ff1b5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
@@ -185,7 +185,10 @@ int amdgpu_hmm_range_get_pages(struct mmu_interval_notifier *notifier,
 	hmm_range->hmm_pfns = pfns;
 	hmm_range->start = start;
 	hmm_range->end = start + npages * PAGE_SIZE;
-	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+
+	/* Assuming 512MB takes maxmium 1 second to fault page address */
+	timeout = max(npages >> 17, 1ULL) * HMM_RANGE_DEFAULT_TIMEOUT;
+	timeout = jiffies + msecs_to_jiffies(timeout);
 
 retry:
 	hmm_range->notifier_seq = mmu_interval_read_begin(notifier);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
