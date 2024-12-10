Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34AC9EC531
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 07:58:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688A610EA73;
	Wed, 11 Dec 2024 06:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fRVbyarr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06CE10E923
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 16:39:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3Hq4jKF4AO7HmOXwuB4rmr/tCUkATpc+NgeFayO2KTBn98OqBlhasaCQKE2Nl0Bv0XRCd8QK5wU8kb4WkmJ4L9C2l1Dk5tbqim6FYkJyPHc57RdW6lhJ0qVsNLm53P+afBgvYAgpNcaJuyRXDKUrnA0UOx8uz2y5FoCaS6H9VTDitn8gMUeMIa/0t+mrLLll0nxvmGEfBFF8q725WHyulw5/Y7LBitao+RZlIg3mmyh7w0Z11XAjySVWk3WWLVnOmnboIDmKDB5EhuIfh7vYhB+Gs3WdzTN3i0eLckHyco5fxB0MOoZzlg9EoC+x2NRGCiJmfqAOrN6gWI0zQl90g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqofNulxMQ+Q4nARs8TiaffFwkZYFZIqBGOTb25Y3TI=;
 b=D7jcTr4tjF4SLWYVBNkchfkPiI8MBDnDvWxG3ZZgbj6VOZYFkaDr88s4r6Bj6dlrRDAgQumgevr2bQWv19g4q5FX0kdz/wwGjC1bUx5iMVfUCyhToNEktvM0swYuPtZAOlFJ6gvFZgRyXwQ5HW9rgSVlNfIodzxfn1kOuBJxSRGl9suSoPYsdDgCLnoL8BUR8Bf23vKzJRu7oBXz1+K48ZhsmxM6HuO1sDWzvYs6m70X4igXUDo4NYkS7rzQIct0YviTUlU8FfaBr7xXx9fkV03UaEkhlWFVxavScoH9Sa03UKm8wh/7U4md1NZbDJXOf7R14dxlpfEERPjqzIe/OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqofNulxMQ+Q4nARs8TiaffFwkZYFZIqBGOTb25Y3TI=;
 b=fRVbyarr2gLuibxOOdCAdG08F6VbyTwk4MbQatk5pKbh6zRwzHObH3bdApEN4ah0uQar+8YqgUkCWvO9Z4NUEseTK6z0tawPMNF6nC8zAghLNAeRaK3IkZOBLHOh8K9crgP4pHbbDVyFldq84Pe+phgSLexDZzCXwrMOjQv7i/s2US1neomLMTDl1cXuAqN3BEz0anvXjW152zKBBsXWYX36ENJgp00FLuechbvEIzq8BvA9ESw7Gdao5rXavGUzD7fEPd4P9PU2qwe9bvmxZEaUp/YNjdfax4tWpqEjcLt8wSpsF3ADNCZ61ceNl8c61smS8zoC686BdvyJXBNduA==
Received: from BN9PR03CA0989.namprd03.prod.outlook.com (2603:10b6:408:109::34)
 by DM4PR12MB6565.namprd12.prod.outlook.com (2603:10b6:8:8c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Tue, 10 Dec
 2024 16:39:31 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:109:cafe::bc) by BN9PR03CA0989.outlook.office365.com
 (2603:10b6:408:109::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.14 via Frontend Transport; Tue,
 10 Dec 2024 16:39:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Tue, 10 Dec 2024 16:39:30 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Dec
 2024 08:39:17 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 10 Dec 2024 08:39:17 -0800
Received: from thinkpad-t480.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 10 Dec 2024 08:39:16 -0800
From: Johnny Liu <johnliu@nvidia.com>
To: <krzk@kernel.org>
CC: <airlied@gmail.com>, <bbasu@nvidia.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <johnliu@nvidia.com>,
 <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
 <mperttunen@nvidia.com>, <rkasirajan@nvidia.com>, <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: tegra: Add actmon information
Date: Tue, 10 Dec 2024 08:39:16 -0800
Message-ID: <20241210163916.1192-1-johnliu@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <b4c49587-00ed-46d1-adc0-f82edd15a0a2@kernel.org>
References: <b4c49587-00ed-46d1-adc0-f82edd15a0a2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|DM4PR12MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a8477c-fba8-4c22-7309-08dd19393887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yvBDzMrllucThhgmLihpTlmTp6wllJ/cnF7gcXTwtUHvqCPFN9m9LKo5C3zP?=
 =?us-ascii?Q?WmGfi/DHB/Ewgx511MT4PgmxmpyKZCDmuRnqLdU9wGGW/lVpXRZeFEyphuCH?=
 =?us-ascii?Q?WO7sQe6VvC7BjfY70TqaIhyQhPo8+KhVyGAVdczZ7o2oyV234NzJLJnz8VR/?=
 =?us-ascii?Q?7DY1AyL9rvuV10uW5dsdlruNEYmnTSo/bi+ecJLp5nD/L4D7hkL2cHnBEEL6?=
 =?us-ascii?Q?5hbo5BdJ95uyECEidZCJYeIjyMqZg3FAoOwBHxD5Ho7Ph9nurEOAVNnmdEbp?=
 =?us-ascii?Q?Zr3YdQEw+nYkI8/QWazx2oPqjHOOvLqS4sweFde7uTXMu9In+/r7h21YIk4V?=
 =?us-ascii?Q?oeAeCpM/cK31nfRHF0xAxswcMAN+QJELYsJSW7DR+G+dmRicZl7zIY3sNHtZ?=
 =?us-ascii?Q?2zwMP6J8CTloKNA529Q622LKjcxTEjhP0Jx+hLgTtulbieDAvlscvnrG3owF?=
 =?us-ascii?Q?hW6VejhYLdUzNmlmwjDETC6LXkPGK9qTmcf1TMylNA2/vEYEut4MGsL9RNmv?=
 =?us-ascii?Q?N8fsTkMWqaDC98Ci6OQkrf8LCp9X13Tr9CiSdSbRDknvYjV/aQ6sESewhe2P?=
 =?us-ascii?Q?HbQ19o4sochx7QY8xYJOitZJf7lGRS4fqHUlOxspLOLqULTcFLXy/OZegEoe?=
 =?us-ascii?Q?XAp9I60a0rXCuOYHWIUQp9Xfp4JEQXX5fG254SrKXK7UtV16fiZNKt9tOSY2?=
 =?us-ascii?Q?30FMpEMDMIDUrCfBKdkoBDTrO7TpK+mJo01jSDNyc2Pyb5nXH6E7bDV8cx1b?=
 =?us-ascii?Q?Iy1gU4sMEVvZ66ry9CuXO+HsIVxPQ5h3Vdg/q2wBPG2Nxt7xptN0jYra6zFZ?=
 =?us-ascii?Q?vuH55HHNRCSnoB0Hwo4t4XzauZPYdwMc1D4Xh/oZKfoW64I23C/F44zgwzob?=
 =?us-ascii?Q?j7f6y0vhzjSx0hR5UoKrTiiUGesYNKqrtoaRFa1CuuTL7NicB0wvbegcoblY?=
 =?us-ascii?Q?c9uGfv3DsXzXCaSGjl4o8y+vnjafyK5vi8xmonJVaSp3/1BXq3ex1QuaTrW+?=
 =?us-ascii?Q?z1o14R6VR261iyBfp5KVqYQVTv6FtJiup9WtEOuRer/aEviMfv39hf9P1MT4?=
 =?us-ascii?Q?2VKqVq/dNC+v2elVe/pw4y3rd8hIntj8MVbwi1C6Em2wRdVhhzim9XPHJqU1?=
 =?us-ascii?Q?zCX5Ut+F00PPCUcRhJqGMwZUoeH8482expVl9FQWus8s1fvlR6nx7aNTtQnK?=
 =?us-ascii?Q?87Zji2yIIs8TVarc0Ggusn9cpM7T1PrjkhuGcWPm/lkhSFylG73gr7D+CqsC?=
 =?us-ascii?Q?TBKnv6O5xlAtSb0/4crKB1RcbUSiYx43zjQSnISsFsnaA06H19C4Bpj8D6oQ?=
 =?us-ascii?Q?jaTINpiNPd+59SXRRru1a8QwEIdnJs1GCgvNWnrbA7MLnZdJPU9mKgOBgPFh?=
 =?us-ascii?Q?h5aaTmXWYel1t1yzyM5et/dvZ2iiYhDolSy87/v7gRKQ1clLKyTezcwaBT65?=
 =?us-ascii?Q?IuxkLIQqYxjNXzrQF0bBW1OZUniMMWMK?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 16:39:30.6834 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a8477c-fba8-4c22-7309-08dd19393887
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6565
X-Mailman-Approved-At: Wed, 11 Dec 2024 06:58:14 +0000
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

>> An activity monitor (actmon) is used to measure the device runtime
>> utilization to help drive software power management policies.
>>
>> Extend the reg space to include actmon aperture for actmon configuration
>> through host1x.
>>
>> Extend the number of clocks to include actmon clock, which is shared
>> between unit actmons for different host1x clients.
>>
>> Signed-off-by: Johnny Liu <johnliu@nvidia.com>
>
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.

Thanks for your correction. I will resend the patch and add necessary
people in the to-list, and add mailing-list to cc-list.

> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.

Thanks for your guidance.

> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.

Thanks for your information. I will cover devicetree list in the next
patch series.

> Please kindly resend and include all necessary To/Cc entries.
> </form letter>

Ack.


Best regards,
Johnny
