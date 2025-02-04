Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F523A27B07
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 20:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511B210E6F2;
	Tue,  4 Feb 2025 19:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="C2upQGZg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CA210E07B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 19:18:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+zTZ3NhQ9kWFPXs0KDWatZBUoER4t3RHugnKzrr9XX4TB9Q+c5Hr/j+PKYphIYOlcXTPoeEIFpOENkIeNSwGyYEyHJUMnJg5g44JVOVT3pD2O0lPv8+vEqF+K8fnffQweZYQ8z1l9ESuvY9VirWCv4xnIjss6v1rznqkYat82p5Pbe3827b3geVC5jtdebsOj5XfXKe+UuF3a1Huf9cH1ObAvYnJfaRwuVk5KudXQqqiILQY9FlHbx8Nr5F5C4vnslpV/lHcbWHXG6AP7EWMLBRrfW6ErN60k4Ued7BmyX73I8r1LesyimwcillbSSiNQUqqYf4viWN7IeYzR0QVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EK/RAY4n14QYeD3A0kV6ZTFL0ePMSGFDT0U6kS5J/wQ=;
 b=T5arDWf/OYO4Yj9XvN0BidbRANJmwMDrha1CWl8B6/gYRgu/jAl05wMMSBTjtd+gi4Vv3dWgczl5HKSrp7jqBNZXY/iW9IjWdGauZkSVDmMa03zudSKoWgqITCwbLQNDdeNk+qRj3j/3z2epqeWjT0ukYvJM/XSd1qubYA/835shAWAqZlSZWnnx0+GR44lMgcQWOeH9Uc4vdHABd/Ynrssl3A/5QlTdLPo7ymZ27CdXN2E7yYw2I4aPQL50bCwkhptJ7x1hlXpPkadpewZKgNltLl97rVIAW3NE8vlE4fGSTS92lAVPlIU0QMtuRrbj+adoNaMdRoDt2N7uVq/+Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EK/RAY4n14QYeD3A0kV6ZTFL0ePMSGFDT0U6kS5J/wQ=;
 b=C2upQGZgrsGM/wGICu65D2Zj6c1td2hju0dbdxv/aBCcfI6uHoJasPzfRoI2kBOdTomzSgBvaqd7zAsm55ax8lvuZObZDLGc4aIRI60+fAY3I602ev4pL4avFJzMPiMYNbg+6y/JuZAg0KHs0na+kum8/uxcybuGhcMfQaPEg6spT/0u/+W+veR/15m08hgWjRNhKmkQFlDLL/I4yR0Q9xizfEzy1Cga9LiupT92YE1uh5DxjhpI5O1znoUSbCRKqn5waXsJE3hCIHVlZ3mG9FBbft6dG4vpN5gPORsALQNBeG6GrdAs5yD6Rpx1Lv1uiINmaAGi5x8ApryF6I82yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MW3PR12MB4426.namprd12.prod.outlook.com (2603:10b6:303:58::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 19:18:21 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 19:18:20 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Joerg Roedel <jroedel@suse.de>,
 Jerry Snitselaar <jsnitsel@redhat.com>, patches@lists.linux.dev
Subject: [PATCH rc] gpu: host1x: Do not assume that a NULL domain means no DMA
 IOMMU
Date: Tue,  4 Feb 2025 15:18:19 -0400
Message-ID: <0-v1-10dcc8ce3869+3a7-host1x_identity_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:408:e5::28) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MW3PR12MB4426:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7beb3a-c403-4e3e-e41f-08dd4550afb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3VpUSLsizm7vSqoFoGVgS3ktTUGDsY+jbXDWesjlkttiWIgKV2N/rg6lkOtM?=
 =?us-ascii?Q?oAn+G+7RsvikN6s7qmgUu5c1SkNiWtLPMq9VWAzZKdTWc7MrSBgIeLeIGDnf?=
 =?us-ascii?Q?0DvsjW1TRHbRlJontu2C9uaSPDhFSclTwIKXYtfIEJH/YM2y+jvGllG9VaoE?=
 =?us-ascii?Q?ppQGjD/0P5aB6fcUWTqNXmigdqihLstjYZlOwfFnQiHkPnClH45iaeAdcJK3?=
 =?us-ascii?Q?FixnG3N3GK/QpinBLUI9XTmvMPyyU+Ug0OLQiblH1u3lAX6WFN7QFHCGp/B9?=
 =?us-ascii?Q?ga4JFoRaoxmqJs8eIQc+tRGbiQY/qRtYQCB3X1GGrMy3aU8fY/Aoje7QHUBC?=
 =?us-ascii?Q?xa0gBiYb1z4f/TJtrv8VQIJyC3+91moRItoRGtWiohb5MS00dCdwfiS1jQVh?=
 =?us-ascii?Q?P5VpYPRfwiuWxj8I4V35OQ9GA63Pj+zs5Zk2d3/XuwVAiRLZCbC6L92vs0zC?=
 =?us-ascii?Q?tHwsX4F5rvwj4eioxjHarLcBgpgtFQHdZGNkevTZhmTzOio0nkqiMidou0ZO?=
 =?us-ascii?Q?DqHj+hztKPv2Fd3nXmmyJuZLm3oogynLPCMu2b6Qs8+C2fhiKzExeh5whDL1?=
 =?us-ascii?Q?dSNG1aHT5xazXb+o+D1AKodDjkwJzDFGeIJH82BI3i+DZkjFUy3jS2Hr4CSb?=
 =?us-ascii?Q?OGcb/yqPSivfqgO1Y8pUpcUq0hbWC7+Pc2uw06oxYuqQoilLqqljSWfKcIep?=
 =?us-ascii?Q?s7vIBxdKlHfA8UxLI/amWOkS/b0Bxb3Pbq5JsCiee5O1Eb6n8vGcG3cYwjrM?=
 =?us-ascii?Q?OaoLSEnP3O/JcUB5xVIMeIgwHAeLSsGyb9t0FXBSj4hdtT64ykJ8FAYSZF1c?=
 =?us-ascii?Q?u0IpZnl31eRS2FDF0mTzr7FwE0hcVSEnBVt8c0mPdiz9cHaViR2o/TXIy9Kn?=
 =?us-ascii?Q?PicWe0hXjz0mut+jRyDtdorT54tPno5RipswH00eJdAqv7nUDkVEmGE8dSRs?=
 =?us-ascii?Q?JSXnfyTjeZKcGt59Z7u1rMTYy367zrEGmiz3RRI0jK6tpCcPswiWCoCUY254?=
 =?us-ascii?Q?BnPTpoUO9JH3jULgXNZyp6kr5epxM9Al9h8sy13+YNxdV3O84O0ug3YUY/u9?=
 =?us-ascii?Q?awQk3QNr/L4sPyjkJTY2ROXFwysbW/Dc29OTeFE3pHYiMzXn5YdPvXk8LN/v?=
 =?us-ascii?Q?iM4FIBAzC3LZeNbCtYg22vibk2uXmDHd6EnYqbm9ponkx5xl1iBLZsaHVYF3?=
 =?us-ascii?Q?r3kbyhyaZosJoDwLihhSckECVFmSqSrdYtMevb8VSCi0ZQoa6025lBpCsTLF?=
 =?us-ascii?Q?qP79RuiBgWuWxyx4C7ivRFjvkI+edjIH6zBJoBCmFHwcQU0z6KGLcnvCb8U+?=
 =?us-ascii?Q?XPdyW3fd2PdBLO9Mfl2ohz3v+GCNCSkljTwSnqgqcqTpzkUlmt5Woj2xMZ7A?=
 =?us-ascii?Q?6jqbv9La4wk+G5xKsR6Bsc6QiwTL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xUcHQRr1N6FR9RMKNefBHMy0bVEBQ1DqMDc2smZKwY74AvfAVoCLZSK+5vHy?=
 =?us-ascii?Q?aT4xfo3ALmxdYKTZ/q7HaSWrhW32q6XpqTZwJQlAY3FrRafvBu1TUA7gtMCb?=
 =?us-ascii?Q?TC0OYOdDGMjBkBjctMfEw7aEgHkTtV6esW+E+T5LxfZDxVoj+36LKys7Oth6?=
 =?us-ascii?Q?KXszA7+66Qd2nZ7rJE1c9LbcJyC3SPMNe8N0bu6+QivnhEyNdUM7zhLaC1IH?=
 =?us-ascii?Q?oDiJoeuYCR3T8gMfD4hr9CrqsKrr72xZsIbMSD8O8N/scbD2JTpRSH/vLHl3?=
 =?us-ascii?Q?IpNvVhPuYY/2ZXX2HfJAewBhro0qaXSZSkQX9KugPZNHAfqdQAMYa3ISOAUs?=
 =?us-ascii?Q?r/wzwu6f1gonexSAf85rfHny9hzZWf1Fau+WvoL/EO19ZHrchjao48tY2WiF?=
 =?us-ascii?Q?ASoL+BmwzQwv8R3/7YTd+7txUXJNFSuiSQmepXhlzPrJk8Ty2QCG/m9aJOja?=
 =?us-ascii?Q?1yV81sslvftxmGMQpjPLBTzjq6q71pmOAZ+HhJGALgE9xbrIxOdbgdBStQtc?=
 =?us-ascii?Q?w/LWbrnDU90EwlCTrF0ai65o1K3OI3L/nSDA7rCxLWFL3jL/T5++OeAOG7iD?=
 =?us-ascii?Q?tceQ5cypReDg6buqu2NDSBvB4ags7ra1/2hPaMcjJ24vIoRx0RYoL1QYIzpF?=
 =?us-ascii?Q?aL1xdMiYYAn7sXu5C0TZmMSW24HXVcpJvRP3LePLdb1CAom3g2rQU3DV8pX+?=
 =?us-ascii?Q?MvEcRCZX2ybuUzyaKAU4lcpIEH297wtsFCrU8PRJGyf8hP4ZWLXDEhfZTIIR?=
 =?us-ascii?Q?sthM6fcYfeKtIrVTk3bOkztVU0XGQtbO4xyNOJlv3uJzJ08Lalm0ZsYLUjuB?=
 =?us-ascii?Q?wMix5QVBPxplp+Akqx9+NK7MjNQOFQi46Bz1H4QjbEsVvRVBp/Dy7uHjSUZA?=
 =?us-ascii?Q?CSklOv+ci3ySYTDQBh8IUK+ZnHPjdZ/5g+3G+QGfoaqlnGuOBrr/X7v/VE3t?=
 =?us-ascii?Q?p5VVxHjrXxtb+zmVin+isLEEkuKDZViUkhROEtXskF/SmSO1S4qstzewKM5n?=
 =?us-ascii?Q?3a+JsHyOo2YSMs3eNTpZbI8ZWIJhIk6AG2NiiS8O8xRkFlyoipeCvueLscA2?=
 =?us-ascii?Q?GKMj8XywKyG6YG8FN49EkcWVS5F/xRFfHpTCRg+xUqnelNQMZ6yUQEFl1FFa?=
 =?us-ascii?Q?4faE4o90wsBIaEjD0yQUeq8VpUJZ6RNZH/lc7d0crz1lfZZukoQLvAYEUf/z?=
 =?us-ascii?Q?K8PJdktws+5D0/pg3ufkmjS8TNG1tGaTw/jlQfIrSvlKqDM4JAWx7r6t+kro?=
 =?us-ascii?Q?eCbb538m4jBiW38DTie6pKJdrVQuFqiBucED7rHYl2v90waVcFXwH6vc5b3S?=
 =?us-ascii?Q?7ZeAI5LK/5CNieK2j3b9DOGfo8lHmVKw5Vfl49yYYgzL/k2Om5s3g8Z4naIg?=
 =?us-ascii?Q?iWYKjACgM+AHUvxMnteiXD5SyA2kMqHwqpmUxKjd6ZismuJ6G9dl04h7sohw?=
 =?us-ascii?Q?pwnOi2H0x1ibEpEYZszMn7o+v11RVcWsyiAEknVIgZ+6l5KSDtnsgzJD4wzL?=
 =?us-ascii?Q?VWsRIu5VRk3gC7ZENFgIidbtAAjgF3jK8hK9lA6/wikRtUNYKmcQHvUdoSIF?=
 =?us-ascii?Q?vgqWliKH0bTOG0kV2z8=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7beb3a-c403-4e3e-e41f-08dd4550afb8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 19:18:20.5724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8irhnZPFgzIMEGQJT/zuCYXR4llhEHE4emisa5k/+2MvpN52/g9if/HJn1V7zwg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4426
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

Previously with tegra-smmu, even with CONFIG_IOMMU_DMA, the default domain
could have been left as NULL. The NULL domain is specially recognized by
host1x_iommu_attach() as meaning it is not the DMA domain and
should be replaced with the special shared domain.

This happened prior to the below commit because tegra-smmu was using the
NULL domain to mean IDENTITY.

Now that the domain is properly labled the test in DRM doesn't see NULL.
Check for IDENTITY as well to enable the special domains.

This is the same issue and basic fix as seen in
commit fae6e669cdc5 ("drm/tegra: Do not assume that a NULL domain means no
DMA IOMMU").

Fixes: c8cc2655cc6c ("iommu/tegra-smmu: Implement an IDENTITY domain")
Reported-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Closes: https://lore.kernel.org/all/c6a6f114-3acd-4d56-a13b-b88978e927dc@tecnico.ulisboa.pt/
Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 7b1d091f3c090c..5d27662019d28b 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -361,6 +361,10 @@ static bool host1x_wants_iommu(struct host1x *host1x)
 	return true;
 }
 
+/*
+ * Returns ERR_PTR on failure, NULL if the translation is IDENTITY, otherwise a
+ * valid paging domain.
+ */
 static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(host->dev);
@@ -385,6 +389,8 @@ static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
 	 * Similarly, if host1x is already attached to an IOMMU (via the DMA
 	 * API), don't try to attach again.
 	 */
+	if (domain && domain->type == IOMMU_DOMAIN_IDENTITY)
+		domain = NULL;
 	if (!host1x_wants_iommu(host) || domain)
 		return domain;
 

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.43.0

