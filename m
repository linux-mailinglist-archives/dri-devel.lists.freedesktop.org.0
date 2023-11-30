Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292087FEED6
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 13:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983AE10E325;
	Thu, 30 Nov 2023 12:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4871710E0F7;
 Thu, 30 Nov 2023 12:21:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbrYtRd/m7aeL7wxtVSgoWxcla1sgjQ3evd/MJvNCzpiBdA4Ipvu84YG0TW189c5MjZnX27ErQR7j3/eh0UrzfeuvSeJlwfeeyADJt2WNAGbro08aDH/GNszDzFMHf4DNC0xH9vdB8RuMnrXxhni8iJZt+MZWEaXIHxBr5joU+HNx/d8/0A7X+Efjps48cVyYU3z5H529YEtKtrIZIQ+lZF37r94KGkoPrQxIhuQVgob06HuMLuSAglSXuSK382hZHtmh0LHMzkYAwbZTwZNFBTKo7wHeYGdNpLDx+axmNpR/K+80bX4ixvuRpPYcOXjHR4WzkK1wUe1p2CEw3tT0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJixQ+w47ibikbkMDvSQCF2sK7jVRhZawzlwIjz7Jh8=;
 b=FVYrwI3BqFs6O8JvmQaavPBE2kfDcLYc6T70rQH64s8L0vKSIsyjMjIb60f1hpAJcXm0gYREzNG2NEhQDDrw/GXSFXcea7LKzVJvwPJ7bD75zwXZaQKOo/8ZRs0zouEZiNoCs64MeLQMyqVt0fj2Q5GcBaQKFTlZKdJvhdXsAV8Y4JxpoMcRpXOHfHuhlt6dJ6pOVW+5QT/UdVRztShK78USMwNmzeloEDE1O0vtvaRXIKkx/lfEjSDe1ggTt3CRXbFAVxF8iCLWL7U/mvtqeA7FFrM7A65wzqzz9IGePT6EVrqAdoK+sS5Tcwgm6nOa0e0+VaEQUKBUvXkw4bRt2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJixQ+w47ibikbkMDvSQCF2sK7jVRhZawzlwIjz7Jh8=;
 b=AiT86x1sH4H83A1T+sAtqjfSfze+2wc9rFhL6g6CKdJFbZxaG8ljv3u3rj8RKBVeDtqma7DE+IT6Fw+6Cq1v1TDFOG0EPJkWNVqgIynm8o5m182yR5oRsi7APEcy3XhwQmTI5UktxK1YM18HhwBJp1Xvbg28WUcqcLRsKrcfCSCas1aRxGmKtyHRL+zH9THeMhUt5rSv5VfjgU08zEEQz3sX7P7l1VudS/t7p2X7amc+eEKo1gnBwpUFghy3kDMLjPHfvb/4n1eqen0Eiaz+tdR7V1MVYtkSEJUyerzwnJQ5MIW0lmnNJTy4dq314xGvXAjLSk8K8qFSPqdDGLHtsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 12:21:37 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 12:21:37 +0000
Date: Thu, 30 Nov 2023 08:21:35 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 10/10] ACPI: IORT: Allow COMPILE_TEST of IORT
Message-ID: <20231130122135.GG1389974@nvidia.com>
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <10-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <ZWc0qPWzNWPkL8vt@lpieralisi> <20231129191240.GZ436702@nvidia.com>
 <ZWhuGl1l5V5b+w4P@lpieralisi>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWhuGl1l5V5b+w4P@lpieralisi>
X-ClientProxiedBy: SN7PR04CA0044.namprd04.prod.outlook.com
 (2603:10b6:806:120::19) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: c56a3fcf-77c8-480d-4e3a-08dbf19ee5ee
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 39FFJvs4blwieyKepVr5RR0vYatdHBvCBb9hFrGowdz0BtQ0tVmCh3QDzaU54xor4zGD/pG3D5aQB3M9uOCicc4qbN2RUTajGFko2au/K19O3GcVhgW9R5FD4BAuF0jRNbir+o5GRQ+ZkB073U+MdMAan8BHs14AJjN4fUU3Da/34Jn4CaYyncmyGOxKyFu4Z6vwDGmhO5HsoP4UZfSC8Rt9FYXvh/NbzOcRw7eCODzcJbYzEYumoJ0RJswjWRAgQTrNBILXLSnVCSzTAbnJwMVYuJH1gdzPoHNaw6hlj6aSqPRyTf4/K8ATMyetMq3srP19UEZS7vLLYJ3UCyW8RY2LphTvuA3RjS3FCDzGYzire27e4vaoCFyAE+Fb71YwDpDE3gaeOux2G4k71O4C9/01y5TGhjDQ2LVG1FHY6fM6cg0JLQSlbB/3uDKIk90wv0XOOJOqhgYxXSZ3ua4jbsrVYi7kspkV/N0ai4AeZTXfc34MFcVeYZeefScV+v0IiPD9kGrtRfWmZOWpfanv7EhVzrZIQjMs3gKQOvJTL4sSVHdy4awo1KXRh+m3DimbxQ4nBlsCLvs2bs0wteRNCOnxwI8RPKaKKCdV5XDhy9Ymxjb0pyhQyaYnw1f6pa0C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(26005)(1076003)(2616005)(66476007)(66946007)(54906003)(66556008)(7406005)(7366002)(316002)(6916009)(7416002)(2906002)(8676002)(4326008)(8936002)(86362001)(5660300002)(41300700001)(6506007)(6512007)(36756003)(33656002)(478600001)(6486002)(202311291699003)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Q7CRmLAOPiTqvKa4MushueP6OP8H9hIZQ6Te0DL2gWMKU/iv6R82N5TRtvk?=
 =?us-ascii?Q?SvnkdJ4yaOqIrtrsCOZL/c/tk9ffutF/khz0rtIuTu19sTZVkyHocI7uFRyb?=
 =?us-ascii?Q?g91G7Gbx3QSi5ip0eIs8pz7GIp0yAsjXqpTGQI+Ns5SqnLDPSNPtb8Hz4tiL?=
 =?us-ascii?Q?+oR+1VRcZb6S+j+gXxyeRHwGUyPtxpSrlfSwVfRb5Z9pAhuWmRRk/hokCgyQ?=
 =?us-ascii?Q?SnPhvdu7hFXD9LI4p6bdYYLgQa4TIKe6RyLh3JflHX24/oGEtcAlCELdaDlH?=
 =?us-ascii?Q?7usCpFs/wbHteN6xLSUCokxDJ0IYOiVpXO1APUE+uwAHHMDgIkhL7pa5/58F?=
 =?us-ascii?Q?IoV9HZFlQVSZrIyhqwF1/BfBBMjJqJ+ZaYo8kWBuxyt4A61RL4lo6AHkKUz/?=
 =?us-ascii?Q?WATqc988SA13uf8+JL1eh2Yg4g3HlqUXZyshb+x6nYxDEh2MkYau7JJ8YwP/?=
 =?us-ascii?Q?9mxVVODNoM0umEJWXT0KN6a1mPCRPlp7AWzbYU8YzLVunPMyYInZ3Re3VIXU?=
 =?us-ascii?Q?knglSLO6mG4K5gVMYxujP3prkuRBzk7IZOFbBTfob4ypYF8Imtbxhza7jgUs?=
 =?us-ascii?Q?N7arU1R2GuluqVmK2g1QGzGCkRCF+zpm2E8H7s/GKrvI0qlKimlEqd5TM5mC?=
 =?us-ascii?Q?b3YutF8/PRG0Otip9tn1O79Z2j6Q17hxUmMgU4+UP4khMHwPKfxOhIltdgRS?=
 =?us-ascii?Q?0uq/TyvfY/NsaZoVKvR31r9JTDbS6KwL87eIKfJ5A6pSb0+9E+lWT5E+Jekh?=
 =?us-ascii?Q?k0DVzfvseOTBtwnscMzZnz2iSVDAmRfK9lK/BWyYq/T60M62YnxX4khhOazm?=
 =?us-ascii?Q?1UBoavCZX2OKHzPDc3BmQPNcTsCmg7eL0n51J8MPLL9hZJ/ijF5EISHqsSB2?=
 =?us-ascii?Q?WwwUnCNNsM18EL+S6Nrg8LWbTCKzVYeGqG58R1Beh0TXT1ZrrZcOW/tzOuI5?=
 =?us-ascii?Q?xl65s89OdshmQ2Z+26vu03QJRbWWiSpZp7NBBiEQRO6nnFdsNrnPRQx1isn4?=
 =?us-ascii?Q?h/cyVO7k2oJ34gxD1dJ7HDeZvRULCwmcNuAAP0629F7yw+vGOnhsVL7wL8p3?=
 =?us-ascii?Q?RrUIYS4ITjjF6SYKdKXpqswOwY3stNsz3Aaw0nuxznHMHRYRY3Rc8sGlUnxk?=
 =?us-ascii?Q?HJAC7RFdIKTWOdURMx2KhMXsb+0r3fE85TQ9TtbzTS0DoyIgxg0IcCKcuGiU?=
 =?us-ascii?Q?Z9K3ShSiXVqXrckwtBMDteA+v2/+4+jBDaR4TJY5vfDPn2ZiyV4m0nGoqzuS?=
 =?us-ascii?Q?fTY6cPUK39xNePVTBG9+wQR82ac9m86kcn18hex8XB5yN1HctG1mFkv9vcnQ?=
 =?us-ascii?Q?hF+oV8S7AcsGjjUF8rE6vCulz8Ns0v1gGUEbOVpDotqn9nM/u77L5rKbqZic?=
 =?us-ascii?Q?e9/GW7NiAM3M64unOzbRAsaydlqqzg6pZnLAiEJz+miFRaBEh+G03zb/JF8J?=
 =?us-ascii?Q?s35/S8NfrhoyrgjAobq/CKyMIqp5e5mquTexI5teWFjP66fQSbETceSq2hal?=
 =?us-ascii?Q?6gHQTIYilnNCustLzHFAJhF+Ri2bNcHmjfPOcFcmLhGdQvIZwCdLkVosY8TK?=
 =?us-ascii?Q?VsgDO12aG5oWGjMoOPTmcuvxZNCjeOS7R9o4RSRS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c56a3fcf-77c8-480d-4e3a-08dbf19ee5ee
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 12:21:36.8906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tr94XYyL/1BPueDwYPWzJnAyAKGBEQmBCWZ46SEOUfaMp2CKrqq1JyDvvSPchVYF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6839
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
Cc: linux-hyperv@vger.kernel.org, Karol Herbst <kherbst@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jerry Snitselaar <jsnitsel@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laxman Dewangan <ldewangan@nvidia.com>, Hanjun Guo <guohanjun@huawei.com>,
 linux-riscv@lists.infradead.org, "K. Y. Srinivasan" <kys@microsoft.com>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Wei Liu <wei.liu@kernel.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 Jon Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org,
 iommu@lists.linux.dev, Danilo Krummrich <dakr@redhat.com>,
 nouveau@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Sven Peter <sven@svenpeter.dev>,
 Haiyang Zhang <haiyangz@microsoft.com>, Vineet Gupta <vgupta@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 David Woodhouse <dwmw2@infradead.org>, Hector Martin <marcan@marcan.st>,
 patches@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 asahi@lists.linux.dev, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sudeep Holla <sudeep.holla@arm.com>, dmaengine@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 12:12:26PM +0100, Lorenzo Pieralisi wrote:
> On Wed, Nov 29, 2023 at 03:12:40PM -0400, Jason Gunthorpe wrote:
> > On Wed, Nov 29, 2023 at 01:55:04PM +0100, Lorenzo Pieralisi wrote:
> > 
> > > I don't think it should be done this way. Is the goal compile testing
> > > IORT code ? 
> > 
> > Yes
> > 
> > > If so, why are we forcing it through the SMMU (only because
> > > it can be compile tested while eg SMMUv3 driver can't ?) menu entry ?
> > 
> > Because something needs to select it, and SMMU is one of the places
> > that are implicitly using it.
> > 
> > It isn't (and shouldn't be) a user selectable kconfig. Currently the
> > only thing that selects it is the ARM64 master kconfig.
> 
> I never said it should be a user selectable kconfig. I said that
> I don't like using the SMMU entry (only) to select it just because
> that entry allows COMPILE_TEST.

So you would like each of the drivers that use it to select it?

> > SMMUv3 doesn't COMPILE_TEST so it picks up the dependency transitivity
> > through ARM64. I'm not sure why IORT was put as a global ARM64 kconfig
> > dependency and not put in the places that directly need it.
> 
> Because IORT is used by few ARM64 system IPs (that are enabled by
> default, eg GIC), it makes sense to have a generic ARM64 select (if ACPI).

IMHO that is not a good way to use kconfig, it is obfuscating and
doesn't support things like COMPILE_TEST.

> > > Maybe we can move IORT code into drivers/acpi and add a silent config
> > > option there with a dependency on ARM64 || COMPILE_TEST.
> > 
> > That seems pretty weird to me, this is the right way to approach it,
> > IMHO. Making an entire directory condition is pretty incompatible with
> > COMPILE_TEST as a philosophy.
> 
> That's not what I was suggesting. I was suggesting to move iort.c (or
> some portions of it) into drivers/acpi if we care enough to compile test
> it on arches !ARM64.
> 
> It is also weird to have a file in drivers/acpi/arm64 that you want
> to compile test on other arches IMO (and I don't think it is very useful
> to compile test it either).

Why? Just because the directory is named "arm64" doesn't mean it
should be excluded from COMPILE_TEST. arch/arm64 yes, but not random
directories in the driver tree.

Stuff under drivers/ should strive to get 100% COMPILE_TEST coverage
as much as practical. This makes everyone else's life easier.

Jason
