Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A477FF3A8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 16:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A82010E713;
	Thu, 30 Nov 2023 15:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A8910E71E;
 Thu, 30 Nov 2023 15:36:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrP3cCKO8O71SL7p/MXN0qrKCJPKw4rIGWpdjK+k1jAMj26xzPVnoJMqtlUVNy0eY2kGpvo31+/e9ANxarwpYv3U9XfyRm5Zy0BMsjHvdxcSYGC1hDY6VcXWVAs1btwWg7ekytuAZIpFYveaK0byj8BJ7+/1R9ndcg6v3+vRv2xHn7kMXMnIktEi/HpxnwAOO9vXZ1++hzDGi4dwqOM6xyp5VrH7UxZTWpwcj5/qzE8siD9z2m6gjeGfpbr8xazPqETPWpshJsdxNpCVc40iddol6NFEjBk2F+7LEP6qbHwgytfybr4EPgny4uWJ4zbMjHTtfWphHwzig0W1/2WdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yg+iGpeFsD329cG0CVnQudByMeC7keQFt7dotbkdYDc=;
 b=iL858/IN1JSH/hl7GNcNhLLAC/8NeaVUGnbX+bWwy3VZCX9IGYZKgYg9Byd+BQSLIuxjLwtzLHZvIK+52JomGquV5+pIMG7ROdSxRnFHi13kDaPosIKwwCoWmzT4fAvirKfAQNvV2pPx6+saMpCzhF5aWETSwrilL7ueaAagAY9W1hudNpNw8djK8t8eJGBXMDZWJLjbE5GiHy93Xy78KIFtn8P3+mHtWWLMtqLd/BpmvjTZKgDybSlZ3M8kC/1Y6QW9gKA0hOlv/qXSW8PleUPbdVz7Oq07ygnq5uc1s1CM+z6lpfq71/ft/KxPcuK/81184pCXc0Bj12kaylA7OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yg+iGpeFsD329cG0CVnQudByMeC7keQFt7dotbkdYDc=;
 b=YdUFck0v/wQP/dQh2YzHV+D9N71jIQTMMuO0OWmwdTX2brvjeclF2u+Trd1zteOQZl5t8WRD92nbsANdYCSIWRvOfxy+LuKl5ZPnXtgv5cqFGiGb/nhBJg7HaXUmcVlAWn2q194KeDQmQ2XSXzIoUu/IHAS2Zk0KaRsVxHJqCqgFl6QtaOxnXcvpRxuhVMRx1/DgHxVU8A56lmtwCbFb6fakdnvOGJBunQhcO2ibAx/8UrgDbtIECEDZOFC3BxpFUO9ZRqiz7QE+PPv5XOKIrT74Nq3iACUswq11eqx0yXmaxMsWmcbiZsMpDigPbBIY+Htmi6iGoJYjg/7JYDNXXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 15:36:02 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 15:36:02 +0000
Date: Thu, 30 Nov 2023 11:36:00 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 10/10] ACPI: IORT: Allow COMPILE_TEST of IORT
Message-ID: <20231130153600.GI1389974@nvidia.com>
References: <10-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <2e0f0aac-6287-45d1-ae96-6549c15a8418@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e0f0aac-6287-45d1-ae96-6549c15a8418@arm.com>
X-ClientProxiedBy: SA1P222CA0150.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BY5PR12MB4999:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b55249c-1995-414b-dc14-08dbf1ba0f1b
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qxL5KGbETW+8VNAFa+yAFxiHNsxzKTkhEa1mtpquu4qbY4dj/oWdidOguAA+zraXx8AiH9qDvzSPTYib4QTECykhbAWOPnmLlANTEuXR7+e49oYaBEyhsMXw3JK0qJCTKdiKcIOhkbOZa4jK01K7eqqB1lzJ3jnxxCf/ZGEZMn5ka8CR/WTblJwU5q5SDQnoGEaN0pt5N+Izb8Y5KnWAX/bsCTqnRLVf6V/v2j6stqqJzNzt4J9YO3rXZ8O8NG2wCRbIaWAd63rHuJQhfwg8axjebcQZlEj/4AjDPE9paYsAOvWe4EKQIUxhwSFaT7VFgcMQQJAuZPdymtbSFm43MOsVsx86nj1+fN3MWgBOepfnCWaFMa1KeT45AwpHYZHpD27c0ZTfbYoyLa7ujPnVa5856MARpyT91E4C5S/ouYY3BUUSvY3cNIRt1AtPGw2m2YHTyL7ogXwKzFFOolWafF0C0AEtkOeADjjhLgvRfiqiMIcbpfSMTvQDl12tC3RYZqDpmyzMCA0O1rd8vHlgWJBEWFEgruJio/nFZxnYdYzX7eO0dJjSVbd3USXY40i0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(396003)(376002)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(86362001)(66946007)(54906003)(66476007)(6916009)(33656002)(38100700002)(36756003)(1076003)(26005)(6506007)(2616005)(6512007)(2906002)(316002)(66556008)(6486002)(8676002)(5660300002)(7406005)(478600001)(41300700001)(4326008)(7366002)(7416002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?caei0Cy5UF+TDyu1d/BtLe0eaGTnF0CTgxbf1uVSWylnu4MeOPu0sDqE5OVp?=
 =?us-ascii?Q?b5bHBmW3h3fCQq66Ma6qYMWJ53Zvyc8w64EvByrXIa1UgYU7wvD9XWaDWdSK?=
 =?us-ascii?Q?DlsyxkAyfwBgxysPu942dNosJ9vkV1c9S8uPo8gEV7ETDuyOlLMHoDzVO3mm?=
 =?us-ascii?Q?M3zl1WMxshhtJt5OKBths+QAM/kKDd0tO0Qv0kmwEMUL3Lo/HhQeb78DSwuV?=
 =?us-ascii?Q?OZcZWWa0wXA6Ajvt37Q9HLH9IeHwqx+qzFmbxFN0V9+CWHARSsHv/cjmLVlK?=
 =?us-ascii?Q?fpWruoAwztyPxdN1x5B9YMfofd8jZYszKpUfJThKdEPItXSnpzpm6bKLT4hI?=
 =?us-ascii?Q?//QDTT25yFdoYmVRySDotuiIKxMSJyqrIZeks5GSeE8C17DvyvmLhE4hz10U?=
 =?us-ascii?Q?7IoEYcW5xAAETSiMGEk9uOkiuC8/QIqeglYq61ymiA65I1Vt4EwZDtqT97Qb?=
 =?us-ascii?Q?/6IAVyqcmL0PXtiihKS6ntyF9zDWq4+lh+HVHbFNE99IkZodDYIyEoP15hSK?=
 =?us-ascii?Q?57H1UYklF0el1o6YvMhosjfZkMbaBIW3Fb4oirt9cvlzNQJ/tj+ipaCyjnjv?=
 =?us-ascii?Q?IKNTFHvRU0vhM6wAlXYezy2rRmhYCjHWrLC4ycT5JfZaG/4WlayVulJ6NycM?=
 =?us-ascii?Q?aJbsPz80zYxjvRhIFUEJ8Fzk8Rs4+2VGloDDnZcyOuRzqETB7G2S+nIJmdI3?=
 =?us-ascii?Q?OeOncIOdeNRc2wSdMGi7TYQxcQMwmItWW9bZuC4QX/PWeej/alDurMixs1uH?=
 =?us-ascii?Q?bcLGm4DRe8Yia1GgW2PnidAQS518vkG0GdSVsM1ZKJOslfofaPubfysNMjkR?=
 =?us-ascii?Q?9LXlEyC2R86ngKC08R6oFLEVAY8SByH8wUt0V0IpXXiJUFcftJA3XxvTidsy?=
 =?us-ascii?Q?ATm/8IAzU4FfhUjf0DoJA1JpT3DrIJ2smRKcbb5ELYGq0DgR9hdbCU/RryVK?=
 =?us-ascii?Q?ihxKd4qOfeVOHcBcUUMjEWT3xdB3E2XADvaVxZxq7iOp8aNfP+jat/4wQ87t?=
 =?us-ascii?Q?ITtve5Xy3G9lrAZ4kRJK1c3bSx+2Ci9SpyBbZ8egJ9pq64HN+z6AQ5LEVhBi?=
 =?us-ascii?Q?+/koQlHHuTL8dnKwPD5R5z9r2XoxzJizhTTA+mJpkMlzKKa4RsZvnoPgwvfi?=
 =?us-ascii?Q?nUxcY6uhNjPSKzV1F6TtAYopBQcvNoOBJal4tbjagTR+QTtDC84j0ckJomIQ?=
 =?us-ascii?Q?EK0W7soDBkooK0Ky1/4kGuG7HVHxv/xuS51begtclSYfg86B5TZdPUzL1UEJ?=
 =?us-ascii?Q?LfrJyK0z9nPKcqT37K8/ZxM1IVhGZA3R6QpAFJXgF417qjrBGJyiMPysrJ2+?=
 =?us-ascii?Q?MI+vDqMHQ875DkbhjlrIAZXUjehJ8SvF6Ok3O1o5Sz5HmlppNcoIEwMuW1mN?=
 =?us-ascii?Q?hGleadb8PtQfaVuRbFBNVlP9TKjcMaxwxIdBc4YXjSlaokshC5KxdPwHCCsT?=
 =?us-ascii?Q?JlY6HcT1zSOmt2XRDLUNSGW1jl34faPcm16PpVESd94xaoGbj1+ag6BaJE14?=
 =?us-ascii?Q?6jt0fUtQ0fnMaX4qhpeN/+I+1yh9bMhxQichFiiYwF3SZE2V6SC8juSKjYoW?=
 =?us-ascii?Q?1gPexDaeTVW1GX1I996PWwFN1n6GVufExkN4COyW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b55249c-1995-414b-dc14-08dbf1ba0f1b
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 15:36:02.5907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LTnlNz9icLXiTZJDWxS9wuH1D8XRDWGsPtXpCwOpV1tmhns5DhDddp3Q4CbplUF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4999
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
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Jerry Snitselaar <jsnitsel@redhat.com>, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Laxman Dewangan <ldewangan@nvidia.com>,
 Hanjun Guo <guohanjun@huawei.com>, linux-riscv@lists.infradead.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Frank Rowand <frowand.list@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Wei Liu <wei.liu@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 Jon Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org,
 iommu@lists.linux.dev, Danilo Krummrich <dakr@redhat.com>,
 nouveau@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>, Sven Peter <sven@svenpeter.dev>,
 Haiyang Zhang <haiyangz@microsoft.com>, Vineet Gupta <vgupta@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Hector Martin <marcan@marcan.st>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 asahi@lists.linux.dev, Sudeep Holla <sudeep.holla@arm.com>,
 dmaengine@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 02:10:48PM +0000, Robin Murphy wrote:
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index 7673bb82945b6c..309378e76a9bc9 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -318,6 +318,7 @@ config ARM_SMMU
> >   	select IOMMU_API
> >   	select IOMMU_IO_PGTABLE_LPAE
> >   	select ARM_DMA_USE_IOMMU if ARM
> > +	select ACPI_IORT if ACPI
> 
> This is incomplete. If you want the driver to be responsible for enabling
> its own probing mechanisms then you need to select OF and ACPI too. 

Well, yes, we do have that minor issue today that drivers can be
compiled without any way to parse any FW and are thus completely
useless.

Certainly one could make the case this should be
   depends on OF || ACPI
   select ACPI_IORT if ACPI

And similar in other drivers so they have the minimum dependencies to
actually be able to work. This would be the correct way to use
kconfig.

But who cares? I'm not trying to fix everything here, I'm trying to
allow COMPILE_TEST for more sub components of this one driver.

> And all the other drivers which probe from IORT should surely also
> select ACPI_IORT, and thus ACPI as well. And maybe the PCI core
> should as well because there are general properties of PCI host
> bridges and devices described in there?

Now you are just arguring to an absurdity.

> But of course that's clearly backwards nonsense, because drivers do not and
> should not do that, so this change is not appropriate either.

This patch is about COMPILE_TEST.

> theoretical bug becomes real. There's really no practical value to be had
> from compile-testing IORT.

COMPILE_TEST is to make it easier to maintain the kernel code by
reducing the neccessary combinations required to get complete compile
coverage. 100% compile test is a laudible goal on its own.

I have no idea what you are talking about with "no practical value"
just because you don't use COMPILE_TEST doesn't mean it has "no
practical value". It exists, people like me use, we can make it
better. Why is this even a point of debate? :(

Jason
