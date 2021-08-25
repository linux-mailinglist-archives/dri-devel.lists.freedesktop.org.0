Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C6E3F6DFE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 06:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5F76E116;
	Wed, 25 Aug 2021 04:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23696E112;
 Wed, 25 Aug 2021 04:03:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLaOpVOkqdVN8G3ufRCQJytBt8Cd3eDgLwIK6t4W+JGLAx1chL4RQ1HpXcDWLfXzcfZEeyOYikFHrLaBKQ3R79Enn8E4eMgKN+b1DMum+Axq9BVjisSFNn0kSZP4ptp8UFOFyGZyVAn2LRh185w0KlDk4mA8sWLVU8G8LUmevSKs+4PttZF/vWoS7EGZE8Iwd/KOxOJHg9mrnMTPhFlkf52zKvIqzCb7EVoRsgRirNiileD+1Dp5PtYOsgJEaRWFR+aaCYbzTIhQ0ROJI4R4yyHN9+JrvuhjJtu8rXII8IJMvDTyjCroMKcLWrxNfyAHoI06yJ9LUrdUMrNIAlmg+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wRbV2DhV8DbE5TzDUTHl0JWq3DdgS2MRaH+D8hi2PQ=;
 b=dG0tH8LP/+wixoHvv8+n23m8UYmi3AmheQ8ZxHnT6hQM4+bxRjA9CPL07eDBjZs9FVB33hZfZxxQPOQeOqyTGa0ijSA1aFGYGj56HDTDJaOGRYeA4CACjdFcDQZxyRwmVKg5/w70Vz5SVnFaYF9FG44TKUme2PYSReL6vhrw3AzqRtcAdTGZ5orI2qZ35K77NkoF9usTR3mQHe/43qmDYBISrL26JXt0tZR0Eia8yDjMXxuGJBr1tZLjaAxGiOJwkugvAgvdXjO/LupvCNMEtLQA6K9BqJce96SYsJaJvqgJPOT0p09extP2qnrWpHlRtn7z3VfjA8tcuo54aV5bZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wRbV2DhV8DbE5TzDUTHl0JWq3DdgS2MRaH+D8hi2PQ=;
 b=VO1VA21Fef/TSMP6ikLHZ69/W48/NmvAYUlgTEzGRf91mmR/6O4511VFM60FKI4cx1pK2XYTexMUri2JftE5Hh6CfpVM5LIya333fdHL2sRwEc9l3ReTDEELTWmNdakkLRXCiURus0OhkbE9a+TdqcHYsnfhaIzKDq7ZzrVTWFk=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4511.namprd12.prod.outlook.com (2603:10b6:806:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 03:48:42 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 03:48:42 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v1 03/14] mm: add iomem vma selection for memory migration
Date: Tue, 24 Aug 2021 22:48:17 -0500
Message-Id: <20210825034828.12927-4-alex.sierra@amd.com>
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
 Transport; Wed, 25 Aug 2021 03:48:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fb6dd18-a0b1-448f-aa24-08d9677b3b0c
X-MS-TrafficTypeDiagnostic: SA0PR12MB4511:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4511A5189E2D75C1E98D1DCFFDC69@SA0PR12MB4511.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ecMg3UaGjxV6r6jukGl7zrzu6qc+WHgAGpoGBhIt74g0g4Ikrc5IIOBCnIdpD/8n0o2a6zlVOSkv6wo9+epRAd/K0p9qT6bAMnQldnYdNUhx4pJsSEdeMzZyKKp+0a/XBCUu3oUvC1fbkkGmXaMC0JX14LGk9weqBwk7HSK9O+EuaV2w/a6LX2ZQzx3Gr6e0+j9skxTgZYOH2eZSXjyAbx3y/Sj3/5JMWkZCeZ8DDbH/jCaS7kHEC6zopd3YkJvFaJQkm5Nd26cMPcvmsLqKO52yKPaY0f96RZNN/jx3DoLTfMrHllkv3kRCHoSmYFWqGzAKtMckoaCuDqf5pcjBclvmWcxXtHspUAsz476PTe4TOP8wCiZ7hJsIsK8Qi265iRdq5jVrnR92vQ/OXM3yhY9txrvOnpzB9mn9642EpLI0QyrrmPAPFlXRxk3olE/QtsG6q9JkGeoC+6kyeMAhpynt8Da+Dki+X/3gVCrLytm16dVsUnLvyuTwdB1t/9McKBwkrIIRk3CbjbJWYIU2Xlaxn0ceJh4stx3Ar5rPCx43yEnM0QYDWXSNtjInQmIcqpjKK73MSyGBH/DX9XMYtykG/DttmaiC4jTCaYE9S65x+VpPdgdzxezdM3QyGrSDu+L6LCSSm/vqebiLCGIFfcwNXnWaY/k/QY0VmRCs/Y2YFvNT2xEW6ewiHspKuD+Of3I9+E6W3NUcksfDFXnDZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(316002)(478600001)(186003)(1076003)(83380400001)(8936002)(38100700002)(7696005)(66556008)(8676002)(66476007)(66946007)(6666004)(956004)(36756003)(52116002)(2616005)(4326008)(44832011)(7416002)(2906002)(6486002)(5660300002)(38350700002)(86362001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6NfkD9rq7lw91ZDyR5Qq1waoUiJfPkG/uIQLI/xhXt0Kq5bQCg1LMD3XPCRi?=
 =?us-ascii?Q?rIT3vLt5qyVkolpg2WVmw3Fas5RhP5T0t29duZRHC9YmpajwbTh4uFtFk2rD?=
 =?us-ascii?Q?3GV35W0p612YgGsvrnICsu1HOaBK/q1NENNNCg5PJ4MF07bZwqSjs1p0fQJL?=
 =?us-ascii?Q?krMt+66J9A9MvadNQRKvOQeYtIVQ011nAkP3wpcY9k7C0EpVq81JJ8MBSxh+?=
 =?us-ascii?Q?MJTWtvbqG7s23Ni49w9RRLPAyQ2Xuz6MU0FuTq76Ib8OsLXJGPiGpzf5+2iy?=
 =?us-ascii?Q?CJQt+PWwjzyDrKMHMd7GHJZfVfjE7V/NaKuTL/9Bp+nURy1P+V7sevZjEriR?=
 =?us-ascii?Q?DfWSeeAyIm7kmJUsS9F3/A2XGuQqrnnTQ1c/mj28qrKK4K3YIK8TnfUliR//?=
 =?us-ascii?Q?+KKV/vjDvhhXmgM8ltdihlnSNhkOSrMjNnyiyc0BHU4C3yhcIPe7U6SEebhh?=
 =?us-ascii?Q?geOzJXjy7f2gjUZBpHN+RfCBKdoLTG4GuvndKp/6uYk/KXA5BjolOQdDqA/I?=
 =?us-ascii?Q?rRaAC2WgivnqeMxv3qXh3G1keQ0iLtHsS3R/AzNyIToTmvPZB5llnQeJVc2g?=
 =?us-ascii?Q?7/V+l+7g0JdnA7O2n3If1QmbHjQGYpSr/R3kcFS/KttwmnmWlDMD2pHFDjyp?=
 =?us-ascii?Q?zOPhDcduZOUYld5GA7NgUD8FNuJgSWlL6OBf1rUfYMy83kgGTQD/+0DcGprw?=
 =?us-ascii?Q?E1PcrarUItfKXTOBvFDDHIA2mIHI1c7D9IQ6cBQ/twJwHeQsAIc4ySwtDJqp?=
 =?us-ascii?Q?iKHnGVMBb4Jnq0UYrriweu4mqu6BXH27eKs8POiLPEVpfDeRHM8mjlgW9yYK?=
 =?us-ascii?Q?gofNPF66hoFebCwCKzp1aaoBhW4690F5E3501DiJMqHq1GpH2kRfBqzf3Bpi?=
 =?us-ascii?Q?v2hKJM+ptY0uM8IQID4hVWaj1iU1mGhJoS6USJimg+ACrghWbUhyMj1WLTD4?=
 =?us-ascii?Q?pcV3RRiJ0uewtyuVdc3LpW6/kXjgO7lZPSUIarnObpnbmB69/vyUi/9lJfG8?=
 =?us-ascii?Q?5rR/j9LessU98tspS94mD9xUZZTx8hEZz4P2TdStpKnsGs+5gMt70jX0Uxzw?=
 =?us-ascii?Q?bEyYyY7tE6lFEI0H2QNp9qUMLpRqQf2I1P2ZsXc83Ps7usfGo3HZBi3vjXBH?=
 =?us-ascii?Q?vMoYxhb0E6sYnIb3qppYXWrFHNx1cfdZBf0iEjsFnKaEqPlMn3tgbDuxJlia?=
 =?us-ascii?Q?EY/gPn08wuENgAb4p3oHKCwSKj51WeMkvxZBMuogT0T9/CnPaukaeew5BMeh?=
 =?us-ascii?Q?6sgwgMtk+zzWNBVFcMpT5R/awMe2LCEdVLrdOPylIy2cxJGcHzyQfh4jl7yq?=
 =?us-ascii?Q?6yoVeHfbwC/gWZLX/0FAigDR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb6dd18-a0b1-448f-aa24-08d9677b3b0c
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 03:48:42.1249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yEbHUz2A8M/xPc1ww8ORfcSoq50hWfbE/UOu+DrT7yHg05NbiuNYgjUkCa/nUpW/+vOgAaW1MrHxvFfvf3ekQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4511
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

In this case, this is used to migrate pages from device memory, back to
system memory. This particular device memory type should be accessible
by the CPU, through IOMEM access. Typically, zone device public type
memory falls into this category.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 include/linux/migrate.h | 1 +
 mm/migrate.c            | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 4bb4e519e3f5..6b16f417384f 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -156,6 +156,7 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
+	MIGRATE_VMA_SELECT_IOMEM = 1 << 2,
 };
 
 struct migrate_vma {
diff --git a/mm/migrate.c b/mm/migrate.c
index e3a10e2a1bb3..d4ae2da99607 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2406,7 +2406,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			if (is_write_device_private_entry(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
 		} else {
-			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
+			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM) &&
+			    !(migrate->flags & MIGRATE_VMA_SELECT_IOMEM))
 				goto next;
 			pfn = pte_pfn(pte);
 			if (is_zero_pfn(pfn)) {
-- 
2.32.0

