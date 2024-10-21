Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1709A6BEE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 16:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E137010E53A;
	Mon, 21 Oct 2024 14:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JXelXbgm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2054.outbound.protection.outlook.com [40.107.100.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E43310E537
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 14:20:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUFFjiI3Q8Xa2oB+Ts+PxGMDGsIGVU/tmkVMq/x8S5I0vVKlKhyg+7eKHDyfC4fcmnZWokn9rInXBiNPcMcrkPRnLYSs/NjV1DC6jsUtXsNt874oYZBbnH4rJosjYIxfszYfWMb0vVj22X/ZpWPpTZqRsEjL9eGmemOGoz/GhCoEPv+FcSExZIFTuAyPWWwxXffgvXAT1faat4QXF9VAv7Aq/ZmT3v0H1TzV4D/8eSSA5vsE5k7df2L/QJQbTa32wTFVc+fXP+dhKiBUx8Mfvjwlb9SlNE/odcAmsoCno55hGEv5O8Cr7EfzUq9Rttc7RfCkwYiLI4LWqNzsWaRWSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUTJOaWuqLadThOdaaqUC9VoqbUCeSQcrwkT5PJRmeQ=;
 b=g9zBpU5SPg8Auyr8DNiGmLn6tAuvE+DEaxq+/mGN4RcMQI9XTGExJHZO/U1TGHTQWJ5SR4xs8tevghRsMdnSgyt7HY8xokGUkUiYA4YxZqaBHkye4Zjar/ZK75bJoOYbKpo1m+SeQaMhkvJmOeFfeaaQgYE14rYcIbdCDM6/OrSbAKKNNptUON5gYmLHnuG7WUSLqZndxQzMQgLi0MRqddPK8MX6CntWZsgurwTcEBUfMMuqPwHE50bryBdV+U0h6/F0fgqdXT7RzYyCeiYb8O/P1AOkcI19C+XWe1FAvWFvxjzYBUrRxV3nZsr/SCeOe6cGNwtDlSnSfH+R+42W9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUTJOaWuqLadThOdaaqUC9VoqbUCeSQcrwkT5PJRmeQ=;
 b=JXelXbgm9/E+7cHXenCjeaSyt1NcWjy1ivSiCrq7G8offJREXjGIKB1cxNv8iP9LIU/iWKuZwIp5Wqj0A6iFyFuViLVEDAu8dUW+AmUe5+xUsjYUwvGd+YBwKyAoLLMm8k33zLsAEcrnMAOPdsE3y2cZPZx0u0GuPazZCo91+8nFSRZzu6BdEDEiJ2U82m315Vj2oMqFN6DHDNTy0By14ZyGWrrT5u4Hq1BODYHuJyhUXVVNnP5Q6jyP31k5IcsRFkfBXYgz2BM45gJHZhi2A2jDyAXh3d7L2lR8TpzH24q+dnCIbkXmAdFSfZ/ChlnDwNGgu4t/26yK0yzEKVwX8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 14:20:05 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 14:20:04 +0000
Date: Mon, 21 Oct 2024 11:20:03 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev
Subject: Re: [PATCH] iommu/io-pgtable-arm: Remove split on unmap behavior
Message-ID: <20241021142003.GS3559746@nvidia.com>
References: <0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com>
 <20241021111758.561c81ca@collabora.com>
 <850c70ff-a7f0-4a0b-83a4-0b03a039831d@arm.com>
 <20241021121724.GN3559746@nvidia.com>
 <d9f64a98-2091-4882-8a2c-115fe24f6f77@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9f64a98-2091-4882-8a2c-115fe24f6f77@arm.com>
X-ClientProxiedBy: BN9PR03CA0952.namprd03.prod.outlook.com
 (2603:10b6:408:108::27) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH7PR12MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c7f3915-f693-4033-e618-08dcf1db7530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GL0aa2RGVrpyopp9X2yRM7AY68cqPLJbSJI2mnLkSKTP+9QZSnUtkeAwz7nn?=
 =?us-ascii?Q?dzZGEs/nUdridjC0njjtfdOIOSJgDS/mmuqifv0FZ53Vg9SAlV7zrYOyflby?=
 =?us-ascii?Q?9lUkW5ICbH/tHxQiqCRx7q58MzeNdRXjwbg53QGKloeI1ZVbhVbUaWqF7ZLV?=
 =?us-ascii?Q?b9an75JbhExruc21P8mlPFBx0PNta//oXUTiKS3GaKM2fNdUmPeg8vPgrvEa?=
 =?us-ascii?Q?SP9oNXZgD/OdNSflinOEEhgy4A36rhZHIXVzwcXF1FSViBAy+cbAaXTaSVZX?=
 =?us-ascii?Q?RUfbCQiAMwQRRuVdA5Mbh/+IgiQxyOr3MlEsUU8rEnlixPERgNpN4MCVxbFi?=
 =?us-ascii?Q?8vXpMSRiJ5AodWxJYLYV0btVVlIWMiqX+rhyHyjhUNwLbUEDKC8Ab/0XxZ5A?=
 =?us-ascii?Q?a5Jbg5zbuoGgByrtxWM1KK8FB/veuBE00chbZTvcfYoLDbUoADpAzxQ2NKmT?=
 =?us-ascii?Q?hq4Zplfu7PGe830wU1v4Ydlc/7xQdFliCCsr/qrccQ2NEIMR5IJInxP36x2n?=
 =?us-ascii?Q?GrtAMNouvQd2MuO07ekmt6/CvH5ShYGYL83Em7Ln/ORHf8jTInd+Rq4vmOcA?=
 =?us-ascii?Q?l3qBqrnAdyUxbPq3W2611Rv3sFJn/wOtvYnx9TqlZXFYA6DYBl08m+i4RCWi?=
 =?us-ascii?Q?U1KphrdSpdOIZvTGriNLs0q5VcD7FrSEsRLWdMtkVR0gUFEjmNwIEbrEI9X1?=
 =?us-ascii?Q?/ni82ClFA1ypjWJnixp9Vr5X89/XFBjVNmqHEVp1T8k0ntCAVt7nJl+guSLS?=
 =?us-ascii?Q?w4Uiey9GErAmRDW1Bug83DtlGKZuGgK544H/6inGbJLKNKKtQVKYXT2C8emy?=
 =?us-ascii?Q?e722nQwixqimJXOtxJ9rigsxUS84Wgi/M8kdXlwp89Z7MYMP/QkO37EPubky?=
 =?us-ascii?Q?4fgDk8vPQmNN9XrYG9wRASjity9SVbIfMGn+xu1o4vMGrgbEnL2nqkkdI40f?=
 =?us-ascii?Q?qtKCSdczO1vnA0ezbyclR6HNcNhsGn6kAFHfaCbWrGfsUBN3fT03ziTqEn+a?=
 =?us-ascii?Q?3j1ImKZoGLcnrfQlTPvknOjmJJ1qzvt4AqsxFVO9fqMJPcbn068GAfg0UBhN?=
 =?us-ascii?Q?bQrFSHi0YKgCVegdjX1OGdHXtkjrfgaRmnJJUduBpYLdWv3r7fzrSp3J7SWi?=
 =?us-ascii?Q?nv7oamRtHbxjEQf73iV+iOZLm/yh+lj6a/Bys+yO86h1hsg4Fs01ObrP/Fv8?=
 =?us-ascii?Q?dTMo3L68Mgxr4kSNgkJGD2MORy8E+t7uLJMAj57nLrjD15P3B1FTcrxGNZP/?=
 =?us-ascii?Q?/b4QiHyNMZpjtLE/OJvH7aYvnwSA1Su7Err33+qU5m3dPkyN+jUeCFDqwT2o?=
 =?us-ascii?Q?3HfSZhkHGwOkVg17TaNBEREm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iBGpauD4WHTjoDCJSy40diO5KxP0QOqmQy2/NJTGn76E82c7bUm5HL9spMcO?=
 =?us-ascii?Q?yroVfnjjKfLuJr96mFXn8D+BsXdLSLK0xfa8SGe/AQBYMuHch4xqL6Ox9pcy?=
 =?us-ascii?Q?meIG3n93RRQykn4LPI/kOOMECkgmuVcoXvg7+OBY88/kheclZYgJY84aS+Fo?=
 =?us-ascii?Q?BFZE/PZw60qItSB8tydacZxfjaNo2S0wDCnWneeB7E5cBAoBf6/YDH2VbF71?=
 =?us-ascii?Q?8l55PHm158SYS8SR2oV7c/lT5mio9RZguzOTRUbesx+QBantEZe6fFJ/NSO8?=
 =?us-ascii?Q?IaVGshcKMg2NeDGLGKXnqVTX6Fzi8r9JAqX+3CT3F8hHMzPFe7J6AKB/Cz5H?=
 =?us-ascii?Q?qznQRw/s3bXOydsiXcpU1ydNDB+0VpstL7n9DAmQrKQYz5yyEcAPKZla8uRA?=
 =?us-ascii?Q?L6oroS4yOEqpMpSMANEr+38xdRAzurybxSz5U1XClXNc1Yn11g4sDLOeTpWu?=
 =?us-ascii?Q?jTMA7WboWjJ5+Jc+z/6BnyXUL5AyN/7NTA4TiDwsp878CbLNn+k6LmQT+x5k?=
 =?us-ascii?Q?MuKHCf+R5xb0yPAMi8vcF59RYE8MZFhBk/VkzKREJaqFdtauESlyE7zJgwFI?=
 =?us-ascii?Q?r/SEC2NoGy0Xbgve0IJVCwL+Ts+guC9+iHwYf85VJSo92CVmy9jZuGg9/rty?=
 =?us-ascii?Q?1aJXOxwCRAfUr//8zxO8vxT6ynD7d6XoPQjeG17BxhRuxwzioqAVi0xKoHAg?=
 =?us-ascii?Q?0FRd5GouW5yDf3ue1RZYa3ZyC6Dx1qAVcexW86b66vVmzh2tIOyz1FWm+t63?=
 =?us-ascii?Q?PuIZu67nfz9q3Q1XahaNt/OB9P3JKhajz33OfDkxrHsOws+Dvgywn1VMlG1U?=
 =?us-ascii?Q?ywXcjU8xs4YQ0Zv8OmwrxHUMh3WgyUvYD/zmkDZSmK6K40zk5dtd+cnHh1sn?=
 =?us-ascii?Q?hBbvoNEGY+LwleErRV11ugy0Typf/dmaoPx8e0OabtsCurizZjFKFypslJ4T?=
 =?us-ascii?Q?k1oeakpSc3VWf/op5ReC0jhBXgHtGBUwGvbxHE/nLmPU6+u8CFdpWhxLdNGA?=
 =?us-ascii?Q?mO2VB/BxXJxWolVQXNxAoQTzRv4jVF5HtFj/SXpE+YyMBHQClw54reaHnRDK?=
 =?us-ascii?Q?7mcUqkhKjrAfg18cyQZQ6Wtn2mISn3Vz4T3vgfj6fGwBJaa5zYqjqBbJrM1m?=
 =?us-ascii?Q?M2EX5SI+js00ISzZCLQb/GR0M+v7/q5m4qXybfTWnWrh4CD8A0jojFxT549z?=
 =?us-ascii?Q?pPy/4LIG1L6R6vs1LvN3YSztq0fmjfUPE0ak32SP7nlUw4dfC6kJ9RPgX1N7?=
 =?us-ascii?Q?fCGNFwjtItzQYTKJi0swoXHPmfejhyCTcOYaEURsKd3jalqVo1TbhXzeaZGl?=
 =?us-ascii?Q?zuC99cSsa/ykjPeWS/U2tlO6LOYTR8ICfhRKgO6JnFGAnSnJlYBfq3dvcXYx?=
 =?us-ascii?Q?CjZpTusVBcpX5hTOnG3VAvEahdmq1CuxmQI1GYvzkDqKqG0bddX14O2h4cKa?=
 =?us-ascii?Q?gH3245zviJd0YO/ixrZkYZBLHUo+B5ArSZxjIys4hptY8dJfvLl5Gso746Iv?=
 =?us-ascii?Q?Iva3aK80lfD6eQvef9eQ7Zdpihj3KUoq6n3DAtFH8DpWJpvEsJncaZ/nONO4?=
 =?us-ascii?Q?gyhZG9N8kBQMKGp7LgU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7f3915-f693-4033-e618-08dcf1db7530
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 14:20:04.8064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXigYFxBlo46MLSjHlSl93KupdQZ9IAX3Bz8SOpYG8SmH+LrnhQiWd4lyFnRNxBf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108
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

On Mon, Oct 21, 2024 at 02:50:34PM +0100, Robin Murphy wrote:

> Beware that whatever the Mali drivers might have the option to do for
> themselves, there's still no notion of "atomic update" for SMMU and
> io-pgtable-arm in general, other than perhaps for permission changes - even
> BBML is quite explicitly non-atomic, as it's defined in terms of two
> otherwise-identical mappings existing at the same time, just guaranteeing
> that while they do, you'll still get behaviour consistent with one *or* the
> other, and not anything in-between.

one or the other is mostly what atomic means in this context. CC just
doesn't want any sort of fault.

> As far as this patch goes, though, I would not be at all unhappy to see the
> back of split_blk_unmap... However if we are going to do this then I'd like
> even more to formally define it as the behaviour of iommu_unmap() and fix up
> all the other drivers which behave still differently (the statement in the
> commit message is incorrect - io-pgtable-arm-v7s still splits; at least
> exynos fails the unmap entirely.)

Hmm, my kunit does cover io-pgtable-arm-v7 but I see there is a
mistake.  I can remove it and test it there too.

Exynos looks like it triggers WARN_ONs so nobody uses it there at least:

	if (lv1ent_section(ent)) {
		if (WARN_ON(size < SECT_SIZE)) {
			err_pgsize = SECT_SIZE;
			goto err;
		}

We just need to delete that WARN block?

I'm not sure what to document here, I don't think we should tell
people to rely on this given we can't test every single
implementation. I'm mostly interested to ensure that nobody has
quietly started relying on split behavior.

Jason
