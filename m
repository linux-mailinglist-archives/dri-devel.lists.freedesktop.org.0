Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C8137942F
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307E96E8C7;
	Mon, 10 May 2021 16:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2083.outbound.protection.outlook.com [40.107.101.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F7F6E8C5;
 Mon, 10 May 2021 16:37:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObCBA/iEVVokAklFfgiqo5mEDQqpuCAWZ8mKNVwZpGaFN/g8xY6aUZW+m/s9gyvJ9Jk7rfA/J+rB7Xikd7OLzWA6OETHanJrnAnxOkRbriZOd14Kl5ql29ByGXIyQNOQuSWTNbDDPtwJbwuZHNd1vOmbo0NRKQYqZNGMfDsmgT/NHrRJ819cULumkUSCzHrNSO4LlAQBFVUT3URxfIVwukYGhiH17BBXmjdZGQ0oNZ/olCYTHK2jOIYQLo1joJsOBaFdePhGykpbQ48H2TxGRID9yAGjDlRjrdAtI8IZTxF9OV5IUwBaGNglG3UWo/oPZ2jbdRHfECvgEItdktIxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TW/TKpFRu1X4rRTXhKdo8M0et9MXFShEHfYdvlK6R68=;
 b=Hj1bOzu3i9NlOs5NAyRV71Aa3fwe7eKZ6YJu/9rQZd8FbZNMnrRfecoh9O9ZvrHWd0kkeBp9U8dY7iKvjXzdhxgmz04+9Xqcx3Xi1XnMt0z7x60VyXBOpGiVxwEk5sbQr/x6MTJUAowC0AO9NqnsF2zwzHwJS+DyIZnmrRylmWB4Zm8eZgGmraOkwnczfLPV1ETnG+i3ONN508fi5MNk3QUpUu2pxE2PN5fi1owE5TmzocVP6YY4hGaZylWzwRj7knWi2Qb4HInKyoMSSNyFI18F8NSIRQqsfmBinHztMy3lw7FwF+0TssVJkSdJeaPp+aGgcDzetSQo6GydpWZRVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TW/TKpFRu1X4rRTXhKdo8M0et9MXFShEHfYdvlK6R68=;
 b=EOriBtda1zGRrKxlaTjyVau2EXODh1ZYQUJguN0aQK7K3eoo/qNVOQjRvPJMJbUuubR/JZPbJXe8rJJLho72Oam4kRrGhT54lMTjtlhPxaFELSuPrB6WRM36/u4QhDur/nV+NIH2MzwEXhb/oIKWdaIt0a++Gt5rB5z5P1zE1yA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4717.namprd12.prod.outlook.com (2603:10b6:805:e2::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Mon, 10 May
 2021 16:37:13 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:37:13 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v6 16/16] drm/amdgpu: Verify DMA opearations from device are
 done
Date: Mon, 10 May 2021 12:36:25 -0400
Message-Id: <20210510163625.407105-17-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Mon, 10 May 2021 16:37:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 511bbdbc-0f0e-4b6b-2529-08d913d1dd34
X-MS-TrafficTypeDiagnostic: SN6PR12MB4717:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4717D199FA60DBC3B533C3D0EA549@SN6PR12MB4717.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /L9CmCspkysqpaQBheakBvPIM26S+qtk+vh0d+N+6DbkQtKNIsDCxUJN3YilM3t+nbBa6c3w40Kh7kSknxhr/Dwkjo55D0Gzv2jzwu/ANJMcq1r35vNOcYEUBD9Uz3j4P3c6sSBHXGim2fBPCk2mQlT/satTSL4YAjP45kIjKcEVOoxbZrtWz8Y/TYYzkh7XqPeNvMRrOolg7VbY7Ikt+PJACuNYiIaUrtS+RzzRdJcXMU04BK8H/+f/ysWft9H3H6FjhJz+zXXcTchEo7e2ys5loLDq695grqluW5uzBixtEg+xAbZgFpm8dGIYVHO1b8QgpkWqA5wshFR/vVTJCAlXipF6U/5TiqQXzbR3T6CC5dhIe3lDYg6WNT35NgBlKDvhs5RXRwKMx7Du/BTwIdu9mN/aC1MVTMRXuvdM/zT5Oda6wG6bDkmv7rC9rjNNm3ai462E39j9Vu52+3ByhUTpR5CUrCFKUybhGvM2/sfi+t2ZnGsOds5KZotivLSvD3jMXHJFySUtMh4ggA/FvgZ0mUN9ts+Zah1BiaweIWyoEzEQOo6FOMOZ5aBp1+kaXFdUMcJ8/MZVIBWTCURF2LFceSt5qUrrHyKajwOh7DU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(6486002)(44832011)(83380400001)(5660300002)(2616005)(8676002)(1076003)(86362001)(6506007)(478600001)(186003)(16526019)(8936002)(6512007)(6666004)(38100700002)(36756003)(4744005)(15650500001)(52116002)(2906002)(316002)(4326008)(66946007)(6636002)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ENnE1pL4eiFcR5j57zgoDX9ao6yk8PB+wJbFBSAR1ve1rab4skd3QnSBRlcw?=
 =?us-ascii?Q?IFPUMqLw2uPMFCz+XfXPyfHYeUCBX46kb9ZLb27KsSoPirSFdMio/d4fQ5JR?=
 =?us-ascii?Q?7dIZjsRVOxYr+QaiK3OC3d43msyndGONX0icAOel0NM0faIUHjtylRNQZjwI?=
 =?us-ascii?Q?Lv4LI7mfaWCnUKtUQRYSflV1GpRECxCHLUT+DzTzXFe6s/aR5ek3uOv3d6eu?=
 =?us-ascii?Q?vjvrAXMOLpXLfWYvC+mQjp3keNBtLFoCK9ihRBhcmynKkxxc5v70sHaByVEV?=
 =?us-ascii?Q?71gqvq8U6Wq1Q8L9rdo3b3g4XcrFX9ZLZuschnt4fbJLGh4/blFrwfB3qgT8?=
 =?us-ascii?Q?gtKKQMUFuvUz304+TD5hTlAnepLNgagXC66Sm+TcQIXtQa7AafQ4jE8UuAoe?=
 =?us-ascii?Q?ZqyWrppqvG5Kw2nqPYgN/r/Ux98BlKxZImhn6MUuo+rEK3IugsFK9aYWeVKi?=
 =?us-ascii?Q?9VJIDFU0yhPvXJXpd3yikZV/ph2AnrPN6eDeRhn6KoNzTvoX00aKKTuj4w5n?=
 =?us-ascii?Q?UZegWorDm1+RoMEHHTPM5M3w9BU4kgCsiwzuIXrPjQXSoCzOiqEQvaJXcoeV?=
 =?us-ascii?Q?Z/rssoS6Hcg8SFuAlqa5I/uVWj2T2lC3yH0eBJnGdgQd2lbZhkqOfB/G7AJj?=
 =?us-ascii?Q?VrogD+WFF4hVZiyBPckCb+4FU/7yW3Y4kX5YawYjq3B6IAffdNkZYz0XY3sx?=
 =?us-ascii?Q?qqlLiLTMpFuXOSwGfCthDJ4FoGcBGQnvAMDD4NNaFFlZgrO86+E7qrpW+Lof?=
 =?us-ascii?Q?PUX/JPVhfleeUN2es6FvklAaybVDx6FMgG7zLPFK4QivpwMfEK3sJmgOa+rV?=
 =?us-ascii?Q?VoK+JXREBZz2MVJuEfG2ffqHLhAO/mTzpDUEi6rnxmP1aJMcd+18Cakjz/l1?=
 =?us-ascii?Q?7dJZySDBze+ExBRPDYzNQgtGY6jkqd2XJNUawGu1ZIBJnzgNC1A1DGnjATGq?=
 =?us-ascii?Q?quBtjPF/w5VWSomz3xek4Tb7EbWfwKC5FY0wNekrxAK4v1hatgKcoxDeuR38?=
 =?us-ascii?Q?ZHtbulSxP6vMK14E28CoRORmG77x+HHOv/+6DrvL86qbHvK7+8hTfZFA6+Sk?=
 =?us-ascii?Q?1KAQMT26IVahdFTzzaj/7Nuiyt1TmatjoyIimmKaphGs1H6LsdODCTaBhhDu?=
 =?us-ascii?Q?IRB/OAMh2PeYDfLr9xBc2SmsOYxNqUlm69EoNSybfxFteQd0C+PT3SJI/U02?=
 =?us-ascii?Q?8DArIjlDKXF79I3mC6QgGpSOUl+JMzeMDPr3XOGWRQvnJpRy5vdVTZYoP0qb?=
 =?us-ascii?Q?nfCdJheyKhRMmhVZDEHPm2JrisqN9hOEDs0vFFy207EMKVT/yKpuXmpMKzNF?=
 =?us-ascii?Q?UaBLAfGH573YtIdEqeSDz+WDPS9Jf5zwECV3vEpdJmOX3YD9eJqozYPmFzH/?=
 =?us-ascii?Q?90HpSVNq8ZtJKKHFX4YBEIo1ek5s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 511bbdbc-0f0e-4b6b-2529-08d913d1dd34
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:37:13.2089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pDQbXBjLz/JM3DU7CAZO4gsYsS9X8xJkbIFcM5o06SMbK1ULnUTyWUuFy80rk83tMc+smPDQh7ganAC4hI9gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4717
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case device remove is just simualted by sysfs then verify
device doesn't keep doing DMA to the released memory after
pci_remove is done.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 83006f45b10b..5e6af9e0b7bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1314,7 +1314,13 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 	drm_dev_unplug(dev);
 	amdgpu_driver_unload_kms(dev);
 
+	/*
+	 * Flush any in flight DMA operations from device.
+	 * Clear the Bus Master Enable bit and then wait on the PCIe Device
+	 * StatusTransactions Pending bit.
+	 */
 	pci_disable_device(pdev);
+	pci_wait_for_pending_transaction(pdev);
 }
 
 static void
-- 
2.25.1

