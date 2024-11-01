Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148739B948D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 16:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4752B10E2EF;
	Fri,  1 Nov 2024 15:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qRbMXwGQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D524B10E2EF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 15:37:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PfKA1Tsd9ryyLYH2d0+/Do5FgQTgpXVdJfC+keN5SW8FX0PVWOE2JEudrP20k3an7WSvZhDA0M8vqvVANpyYIMUjE59j4XK/qJlrkXwWQODprsgi5w/5gAqj/0CEQACwrt7PRe0CUUBqIwzD2Oqc04q51laq3fJe9PPTxJ8Z7WUGitryx366IuIQYw2Ve4MsDJvFi81QjNswfEU9sxCArEnBt/ekfwTBAm6rDr7eblKoyHpUHW/jqJO/cFF2ixdGJa1gDrL08IG+U+Rg/yKOtYj0yJ3SukP7nbFsmRRS29g3Gff/+9Fxg58XmDXUSGWeq8ru3BIUE5DNUM6UZJItdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=el2SmeZRqhbLDGrcN/+ssvbiTDMJWwrEpv6M2of/biE=;
 b=x8fgTqban/sCHc4n2JGJeTIXXZmbPch6vawi6rfMfv61/id+mkHVRAevV5pSE4nYbWdy0bcJR5g0PH8sXBk8hfWgSQc4cjW65wDOeD26Tb3qOFLwe7qqtY/So9CHza5X2j07uMR7EKiLFeFgiIsvKI/sMw1UF0hQ9UATWsh1UxwUCrRU2jmSn/dIDE07VHE97YWemf+Me7Y+PWHWPpp26Vd5Ej9MSc5uLV3dgi3XXTsNneK3KvHZD+keIxeslUvK8NkYMjx7Y7GN5pjLQk8u7nWzhR9NiJzxix4pftoMqnd3ArR6eOVr1Wjbk4rGFYmVRNMExHhCBeqpknbFUea8UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=el2SmeZRqhbLDGrcN/+ssvbiTDMJWwrEpv6M2of/biE=;
 b=qRbMXwGQ+SyHx0qHUHGBMtbcgLl2SSWY54h7J8PKeBSR5ZXy3fXmnCbm+bMoNoEQgSXa2aa8sI91CTS6AZKEnJDGVUJxjtFKj11YL5fr99eAkqgqSaYthlkv2de00sAEq46s8UEhXOsVyvC9/6wX24XjcU8zBHYXVJXLukxLV32odBnCpDx2dGljJN3GuNK7suquW2QU8bS4f1QqvcfDnLhA9ElWF3RximZI1PoMwWu/82tyRlQJOojhPjeZTqYnnYaAtOrI5VpcPI4O4honwtAoj6Gmdiuep7NPZON9Be+w/Zz8jS+1WbtjjfJNUSYaTmuYW+C4C3x1ra+twDasXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH2PR12MB4264.namprd12.prod.outlook.com (2603:10b6:610:a4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.26; Fri, 1 Nov
 2024 15:37:51 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8093.018; Fri, 1 Nov 2024
 15:37:51 +0000
Date: Fri, 1 Nov 2024 12:37:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Remove split on unmap behavior
Message-ID: <20241101153750.GV10193@nvidia.com>
References: <0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com>
 <20241101115828.GB8518@willie-the-truck>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101115828.GB8518@willie-the-truck>
X-ClientProxiedBy: BN8PR04CA0045.namprd04.prod.outlook.com
 (2603:10b6:408:d4::19) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH2PR12MB4264:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd9c83c-9d44-4dc4-a5f1-08dcfa8b2523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M7O26CT8AypiDtDwEPNfD5fY3mp1qlu5uKOMEi9b+G+GJe+Z1ghdCOnpO+Sk?=
 =?us-ascii?Q?igjqQSyWe/EkogcD8AjAO6N2MPPbgFJBS85ljdMZS8KJKHmGApnET/IGVgNA?=
 =?us-ascii?Q?rfmdXCp/699zezrrz1rbdqyiq545pispMwSlbN9zvrFgXxTNMvXkIHJ0H3Jv?=
 =?us-ascii?Q?E5TtNJNJL4cpGCCv/M5AXo/lL5Ztub+8E/PBqyh6fJJnaBAvQ23ULpLLWr9z?=
 =?us-ascii?Q?9SnnMvwKgDfL1qBI2o0dDuNqx72rnYa3UnQQ8n1NJQpOqXmecjrr7ocwYBfp?=
 =?us-ascii?Q?+UAKpu2G1KiMbCHctKcWSlQ5ox6cJXKx51+7B8y1DoEVvksO6xFwsgBYFYjX?=
 =?us-ascii?Q?jR1iy4ap/qft7c7HxV9zThi3Etf0vsxTOalR1fzaNMF42nzsiTTpxIsdCz89?=
 =?us-ascii?Q?ID8K2NM991dkOoSB2nrPzRrOynJsxPV3XlxoNrIPQ5TA2JFvcQ22zCxQ5BJB?=
 =?us-ascii?Q?YTBc304nZUR+QBVinSIQhBvhyourmqVcMWp5kTOwrY0plaHlFehjtNMcYxtk?=
 =?us-ascii?Q?A6rpyJQZ6xiVUQTkDq3hK8lHaabhWNWu//KYeySfSN4fFmhsEyF/maGeiZHU?=
 =?us-ascii?Q?I34l7NyPCd3DyaUyPS9SNEpiEMCXibvmcWHqG3Yln6PQyy1OFwJuPEkHGQG2?=
 =?us-ascii?Q?6P447nNY+dn/wiv0Y8g89skej1WNaWplmhNs0Wzf0uB7c1+C2pcA7IMNvouP?=
 =?us-ascii?Q?RfEm1YQiKp3o1WVsJVKT6eBfiXasrNUcjJ3r8nF9VQC21AmPcMUHjwEOns8g?=
 =?us-ascii?Q?mek3WZOp+WMo21Rc8MTdEFtQesKxXxzdzqv/TFHWvE93b1g0CJeTgv6dtuY/?=
 =?us-ascii?Q?jThS2/bQUH3K83ZsC1WbJDDSMU+du/4f/FMhUmJtoE2C+J91y7P5oBK5EqgJ?=
 =?us-ascii?Q?5s3EklU9TG7J3PR2UrF7Q2oWCcdbz+fyJgvIP0ID30hbU/bX80kS51m0IxMp?=
 =?us-ascii?Q?2dM1Qdz50S5V+qz+4hwA2iRLS208oRN3Ck1VF+WZ3qnqpAaeifBlJcO7l0n7?=
 =?us-ascii?Q?IIcHWFQg+ILLlV54J19n8QOPHmmDkGtH6vWgIOplhAm9Ad3lLmb+F9Eg2md1?=
 =?us-ascii?Q?rNwceRKwKepmYCiHqzYi/25KXqRHtV4mnWcFGAX42RMFNhPQjyvHip8mqqgw?=
 =?us-ascii?Q?xmuVaNK612tFM41p9ZuJEAV5676KSjwKCkiY4ZHBFv3cYKkq9Ws4qTL/ZkOm?=
 =?us-ascii?Q?rT4m+5mKF80UwsYaObxPKpWVV78NBALL/AAQZfxK1EW8ZnOyNKGrEX6ohwVb?=
 =?us-ascii?Q?RuEcQe0RugQ82bgK+zc1YbPjQuce4nrM2iFPJCHCe3ReMtu4TrqsiD47i5Aq?=
 =?us-ascii?Q?Z9I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6k1rW26CAZ0nRPr4Za3Di1oJs1gs6qUW2Av1GnGXvwIE57OY6fEf2s3sC9y5?=
 =?us-ascii?Q?r8ZF3vB0qlV+MyeXMyYaZbCJ2gcUip0mahu5ym30gW4NtcvQ5t8Hkm+mbloW?=
 =?us-ascii?Q?B8K3seTDtRdztvkeNv4jsb/AUg9LJg9jZ6X6+aGmKejHmUUJqrdJqWIcrBY9?=
 =?us-ascii?Q?AOgi9ax80agHr9NZ6+XkAEm7xiG7iuLgm1QbHiOMZWFeO4kiZ5Si/nssUWnv?=
 =?us-ascii?Q?Gl5uHPTTX0r1HUn0crks3LkpC07vn+PZOyxQK8WDlcBtvyxGLiLYzdXX8gwD?=
 =?us-ascii?Q?scJ9LX5sNEoQid6M+7d5rBV8PPKbfF5k9vYfdah98SYVPeFyLkS33iTk/ZNP?=
 =?us-ascii?Q?mSxJwDDWqXB6fFkO77iCT8SFsTBywjwsOskeDcvKe3g8rrzKj/cVoKdqCmX5?=
 =?us-ascii?Q?lGILRJLvloC24q8/LSnkVXFIP+fkuae9ERsf+b9SzMumjZoq4EzBsy31a/Hj?=
 =?us-ascii?Q?imsPPNsGc4KXuiScPZ85i5F7n6DSzpvS8HgoPagtanlE2oFcKMul2TdYsX7a?=
 =?us-ascii?Q?KUR0BAWiOqSyG52wVaOckvDbtS7WrbVrCwK8OziEVmxvugxjt9Nxlgdj4adS?=
 =?us-ascii?Q?TCjQs2mOqpqBTW/09TtOQkUc07O2woExRdH95j3IsOOyH3pUKxbcPMcIes0t?=
 =?us-ascii?Q?A/o2GPHpjK/a7zes+xite2oVldL6ozu3RrJfl3xknR0pHZhki93K2BvbhUKC?=
 =?us-ascii?Q?M0Y0v/OyarnUMF4MapFXyzmm/x4oeLOEhi2JQcolScW3Spi7DIOLc1170kZf?=
 =?us-ascii?Q?FreZIFAaiwQLsAg4p3g228MiMIgnIjfBmr7i0rE/htlF0AN10ByJq7mYO579?=
 =?us-ascii?Q?G0WAD4nys4W2BrYsTzfTlRHu2NzqrNrzG5o1o2SvqZ7mgu81mR0j/E1zvE0F?=
 =?us-ascii?Q?83MKMj3qi97gUyBhM3tcl12j/cSWgzRKv2CfLtcfBa0APfIOnx3U45jkrYDt?=
 =?us-ascii?Q?khv1X2LW25UB6siMQ8PIoevcB+ZyjFzLL86aaXYo065vVqITTUBWEHzntAkS?=
 =?us-ascii?Q?nnj80AAqSIuZIDvIxia/Gtwj4HBjVaGAeA+2+IEHbnlfVBmYx7/v8snQcy2q?=
 =?us-ascii?Q?EnUrDTDTyM6hZSrwoCV/1VA/gmIWsY4aTSHejmQX7QwU9wKFtbk/2flUuAIj?=
 =?us-ascii?Q?mxrYlJx5JoRZpkzu5BpHA841swm2HYKMCBw+V4zQztnU0iq22UN4poLW1bmE?=
 =?us-ascii?Q?IIv9/LA7gLygVqD2RKcl8Dikq9/OwpUsu8PATQ4dBV1pjO3Sab7zZ0TGQeSC?=
 =?us-ascii?Q?R28tELEk/vE5j/OuzjQSB3fFe9WrSk+wz4C+t7E3amzvnVZJKRyKAFE6646W?=
 =?us-ascii?Q?XsOPLLamnkgDkKqaj8xU7PgJCYmH3377kohvNDXByxxI92bunqnWQUyHx5q+?=
 =?us-ascii?Q?XtpaGSbV+mDkxu5m6+twe32nZt6kHs5LK6p1hKciqIUqEAp9nNgNQfs/uj6z?=
 =?us-ascii?Q?5VG4TH7GUEWZAgMOkGCws/YFn+LpVXbt44pOyQmnjYOaFdee2ibU0x/Dw+EQ?=
 =?us-ascii?Q?0YV5Hr+ckh4zQgTgCZzNFS4X05gSg1hPBVe8SY/bKOK6CqQeCVOTcDHX+wbZ?=
 =?us-ascii?Q?OyjJS1TZeZ96i8MlicA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd9c83c-9d44-4dc4-a5f1-08dcfa8b2523
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 15:37:51.4194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZeJgzvvjJXfcULQm1KjI2ajOuQHhPP+K9rf8EhhLJqQrnPzFt82AG71aaIfy1xF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4264
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

On Fri, Nov 01, 2024 at 11:58:29AM +0000, Will Deacon wrote:
> On Fri, Oct 18, 2024 at 02:19:26PM -0300, Jason Gunthorpe wrote:
> > Of the page table implementations (AMD v1/2, VT-D SS, ARM32, DART)
> > arm_lpae is unique in how it handles partial unmap of large IOPTEs.
> > 
> > All other drivers will unmap the large IOPTE and return it's length.  For
> > example if a 2M IOPTE is present and the first 4K is requested to be
> > unmapped then unmap will remove the whole 2M and report 2M as the result.
> > 
> > arm_lpae instead replaces the IOPTE with a table of smaller IOPTEs, unmaps
> > the 4K and returns 4k. This is actually an illegal/non-hitless operation
> > on at least SMMUv3 because of the BBM level 0 rules.
> > 
> > Long ago VFIO could trigger a path like this, today I know of no user of
> > this functionality.
> > 
> > Given it doesn't work fully correctly on SMMUv3 and would create
> > portability problems if any user depends on it, remove the unique support
> > in arm_lpae and align with the expected iommu interface.
> > 
> > Outside the iommu users, this will potentially effect io_pgtable users of
> > ARM_32_LPAE_S1, ARM_32_LPAE_S2, ARM_64_LPAE_S1, ARM_64_LPAE_S2, and
> > ARM_MALI_LPAE formats.
> > 
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >  drivers/iommu/io-pgtable-arm.c | 72 +++-------------------------------
> >  1 file changed, 6 insertions(+), 66 deletions(-)
> > 
> > I don't know anything in the iommu space that needs this, and this is the only
> > page table implementation in iommu that does it.
> 
> I think the v7s code does it as well, so please can you apply the same
> treatment to arm_v7s_split_blk_unmap()?

I have that patch written, I'm not as confident in it as it is much
more complex, but it passes my simple tests.

However, if we make it fail and WARN_ON that should simplify it alot.

> > @@ -678,12 +618,12 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
> >  
> >  		return i * size;
> >  	} else if (iopte_leaf(pte, lvl, iop->fmt)) {
> > -		/*
> > -		 * Insert a table at the next level to map the old region,
> > -		 * minus the part we want to unmap
> > -		 */
> > -		return arm_lpae_split_blk_unmap(data, gather, iova, size, pte,
> > -						lvl + 1, ptep, pgcount);
> > +		/* Unmap the entire large IOPTE and return its size */
> > +		size = ARM_LPAE_BLOCK_SIZE(lvl, data);
> 
> If I understand your other message correctly, we shouldn't actually get
> into this situation any more, right? In which case, can we WARN_ONCE()
> and return 0 instead? Over-unmapping is filthy!

VFIO won't do it (except on AMD), I have not tried to figure out if
something else might depend on it over-unmapping.

So, OK, let's try the WARN_ON and it is very easy to put the above
hunk back as a fixup if someone hits it.

Jason
