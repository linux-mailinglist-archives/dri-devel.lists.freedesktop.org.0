Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3751A65848
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 17:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219C610E149;
	Mon, 17 Mar 2025 16:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="imcNWENI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2063.outbound.protection.outlook.com [40.107.102.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44A510E149
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 16:38:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSs2Jmu2t6deLdxIQUaKNEAu8qMpqoO0jCwSHJHVrJ5M/ikCEAi5KfZIEdLJzXZ/CGLKExm4KjBH0AN4RyT53mQU0g7AFG4pIVjcJvwgCoIP9gyP299njdkqh5rFGsfZ+CNdR5aTahzkiky69NA1RAotwaT2Qw1YSRQ2ToimzJKnYhkmJw/+KGbF6w09JBqe5X9WkHrZCklaJERBUgOgVlJCWDR9yalWw5ONFqgMWhkdtol8yYSb2FKakF/YhuyOGcSReKJEpRhPH1hAmH7aagYoF02nWHXTvMH++2sxqMSUs4+QAiiblpEgEvGaCgGMCyesvfp19sOKTDv0BPrGeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMR+033BL8YtE0zJD+p3KFTKRLda1626i4IzJtvXTK8=;
 b=nrCcPlsHkHui4CW/zsOLY361lVAzJH+nl6B9vQ2unYGwOAjTtIfvcF9faCtIxqxBX2iWUMFqtm69vCpUbkmirxDEMlElD930c603J1HbwYqOfeqzTdgh0z8ryMxxrTzEm3ve1KoaDhGCw1kCUEV9HNemR4AI3xCtnAkCHceIjh2Y8zPmZD0YOtyKF6msQg8oBS/p5QhFZN62TiOfq6IrpAXapkIeKdFxtBukjoqLxTzDFQBOizvtjJt1vXO0rqMEdJBYpRCCHdchQNNS1hljEKbT8NraVbomAxbTMfQCJc9iOZL/S4RlkTgCAYILGFWN3s6SF/46yMEUK0brkC23ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMR+033BL8YtE0zJD+p3KFTKRLda1626i4IzJtvXTK8=;
 b=imcNWENITuSQfbkQhaTR3waaZH+V2DsCopTfe9k5uP2och/k1uIcITsD7q0hwRjG5jVvFJIxdRjrmezHPgzN9YhSGXS3CTBMfwPdBj4VVzmaLuwwSAqVXd6jRQpCQU3Bu9RnrFYxRpHiJrgQP2WlBo2Sy7DMOdTUWDEZxZXl1u0+KuhOHUkP1GvfFJRtpTGCdifg6ESXc75F1J72gdrf8f2j/PdjvAzFHExHbRdOEJW0omQc4+NElUXftVimokam/i3KJgtd7OfplDSsEh7JXLC2fqfZoC9RhcxQ3R1d2mGsS7Bor4vVUVJ0+tVUSFsw1X3vDHjwWUJdFvuu90lXaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MN0PR12MB5788.namprd12.prod.outlook.com (2603:10b6:208:377::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 16:38:27 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 16:38:27 +0000
Date: Mon, 17 Mar 2025 13:38:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Alexey Kardashevskiy <aik@amd.com>, Baolu Lu <baolu.lu@linux.intel.com>,
 Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 08/12] vfio/pci: Create host unaccessible dma-buf for
 private device
Message-ID: <20250317163825.GL9311@nvidia.com>
References: <20250113164935.GP5556@nvidia.com>
 <ZnDGqww5SLbVD6ET@yilunxu-OptiPlex-7050>
 <20250114133553.GB5556@nvidia.com>
 <17cd9b77-4620-4883-9a6a-8d1cab822c88@amd.com>
 <20250115130102.GM5556@nvidia.com>
 <f1ac048f-64b1-4343-ab86-ad98c24a44f5@linux.intel.com>
 <20250117132523.GA5556@nvidia.com>
 <835c7751-d8ba-4af0-812f-2b3a9a91d0bc@amd.com>
 <20250120132843.GI5556@nvidia.com>
 <67d0e549d4d27_201f029458@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67d0e549d4d27_201f029458@dwillia2-xfh.jf.intel.com.notmuch>
X-ClientProxiedBy: MN0P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::7) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MN0PR12MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: 117cc56d-05ef-4cd1-e26d-08dd65722482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9BO/lCk2kcMXmq49JmMSS8LGKmIFZHXGm3hXrFwima1giu1gkf9L1N5eQ47m?=
 =?us-ascii?Q?KGXIKbll9oZ5wJOgduwwjuRBhWU1lxcrULWZIshwjJRSLdy4RILEfe+5Z17r?=
 =?us-ascii?Q?UQXglsiJ+7wZZ1qOm5qaMmUKL81lREd1og3GUmKMGPoL1zMNTq6kqht8D1bO?=
 =?us-ascii?Q?Adx8zpdLomTNmr3DGqGoYEuR9X86LqKL9Xg6SgD59pHupidzx5H5vnRUzleA?=
 =?us-ascii?Q?CjtL0VNDKujHM5N/F3O7MoJdkwr42BVTe7k8ecFyN5I9qDQHxdggyBZm+kX5?=
 =?us-ascii?Q?SR51cOS1kvwDOMEkvseTcbhYFIoVQTxuA8vsMoev5LQFUaqvLIq0TO+M99qr?=
 =?us-ascii?Q?3dBlG71Ha32QOnmOfuUvLZpStrzG9+mcsAuJ/Nl0rLXEgF7aaLM+IsTlTcWq?=
 =?us-ascii?Q?U1rNWqReaW3Dj/hgfumTk371elC2/Jg4wU7kP1RjHg6ESDdak9exoI9WIloz?=
 =?us-ascii?Q?Yf4hsYm8RE5ewkG25DljAXXVFedSVu57j77eRmOca/LeOWIpVnDuNV6EuNLz?=
 =?us-ascii?Q?0rO6/TfIexqZudVghMv9JksAmv378/KrvicI+cfoniXFqpc3TipXMAOBa8xK?=
 =?us-ascii?Q?wZSLaLE6lWgkfkSVY8Es8iuQ/7g3x0VrWp8F8cqTey95HioG8rYDDuXrhkcr?=
 =?us-ascii?Q?HcZtN7HAKIFvJOg9IsFnQKoewddhxvOVTj3YZkN2g/T2/4UUZYWoNfK6UJI9?=
 =?us-ascii?Q?vgx/TNqIem4jAw1NIhbGx46pehbmsDDH7QzI5V21gUIOSZQwGv7adja3rWkl?=
 =?us-ascii?Q?UwNKsWjmmRy4QOZ5b7jVAkxIricW5tU9GXvowZBjBK/wJjzDNIVZ1wV79jME?=
 =?us-ascii?Q?hI73tXTgsMqI6AkKFrrznbdHGu7JtjzW72szGYC0DY6wlekO288+vyY7fc1W?=
 =?us-ascii?Q?szeYEwbv8/+wZ9T4xeTw7zQ2Y4INZtUQ3bEw56OTCWU+HnPUEDz9k7mKnSh4?=
 =?us-ascii?Q?LxsfZbNIIkkcZDu4k8AbCokGEmozacJxHxIHAaPYnTn+BULiHAA1zz2NH6BN?=
 =?us-ascii?Q?q9n3cVMydOvwGRhIAdcm6gMKtQII59wZFLTJXH0Ctoe3NLaeyb3UDzizebw3?=
 =?us-ascii?Q?gOP4AvtS5721V3a2sOPNGsyuSIfVQ2vUScJgiocQg4Vh2XrQ2+VWa7zAXNZq?=
 =?us-ascii?Q?oLZYPg9R/bBlzOlHRuHvCQh80nyElYuFhGiPzsuSpe4tfgpP+f+Thn/Xgweu?=
 =?us-ascii?Q?7tY1YKCDoaQ6i9GPwUt66PoIGzl1TPWOMV/CM2c2xoXbiaFMZRFwp++Lsdkt?=
 =?us-ascii?Q?7Ymuvp/Nq2cryybkT0faNLwkXKyQLCMDFNJI5wxr49FBL6TrsUJOpuOwklc2?=
 =?us-ascii?Q?T3DK3qct6wLjILz2GpSEE1Q38ANw85jcH/GXh2jxSiPMDj1AeRNrln54LbRI?=
 =?us-ascii?Q?5RpPunX2UJSmCeAwG4cfBN32/1jR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MAq4S5LX+W1/NrBZwJoU4vC3X6IkdbIgJrsUeI1M74+LrM81YtMJxE2AOBZr?=
 =?us-ascii?Q?Vn97VhyIGSOJaivoy1EuGR4jhBFvRRqW8YzOsOgIMApVwzhEb169CLXLkHta?=
 =?us-ascii?Q?n28eHTNqmmGpg3tu80KyaCQ94qKyzjGcCW6K0io6xFUpDP8PJUuo0nuM1v6Z?=
 =?us-ascii?Q?n1SJfm3Ppilucnb6TEljLIHZWxEbo9XfwaSOLRo3GgWxvLkCy5Gzb6kGrv4a?=
 =?us-ascii?Q?7w7sprX/ncRfwHG28Eu7A3hseUBvL9be0ZRGs4uag4jZ48QaRICniIESR4qy?=
 =?us-ascii?Q?bQB7X7tw6PbARv9qoUOGYkWhRNA3Od/nLS60EIixJWfOzQMH8DHTUZ+1WgC+?=
 =?us-ascii?Q?RFI6Pb5PNtQyCr8AZQQ3xB0TFa/IksrUcBXsPgjLXcbA2sN9JfUVG+GmN4Gu?=
 =?us-ascii?Q?j360LS4OBO2OKcWQqBOPEtXTrvz6MXpl4Mb/E6SP7ar1t7dNBg2qwi0gAccL?=
 =?us-ascii?Q?oV7atC6+u7KYsvFUk4uRx/yhhLI6awWs49pB3l/tCIIyfxfiQ77aQPzQMEhN?=
 =?us-ascii?Q?4wAiaezOisYzOKNYjDmxe4KWHQPwjM+eekjHm407A+dkzxmBSNAGpxhiEYIQ?=
 =?us-ascii?Q?xusgRaitUZgkMjj19eDJxoh3W5BkBl1xn0ZONIdCBIX5u3OB8v3avWI/AsoS?=
 =?us-ascii?Q?OQRpcMZdCaJ/kQdlfvIqzEXQMcV13Gi7PqqigJiEizcpokl05fxmfxcOoJkj?=
 =?us-ascii?Q?UARMKLze4nghlqAtMgx3yC0IRS9Rs3TL+yNQKySHkbV1pmYVDQNAJa7hZG86?=
 =?us-ascii?Q?wCnPaei1WI2iQiwMYq/3rVWjUUiUObgft4IYALjThFRmxJ4MPG3Yu0XYHL3E?=
 =?us-ascii?Q?p7arDsiYExfs15on6/OcD8iSOiKIHk5pIuGwO69l15Xot+V+5VjvHJvEnURf?=
 =?us-ascii?Q?zLZCjlwB/YGfm4+iobIWxwDvgwFFyimeEWQnp6u2BbzB/9FBOccRiA0RuPVr?=
 =?us-ascii?Q?XYO5hK9/ozGie0u8YYp8YwRCtuRLlE9jA08qe5ZES7PQw6bM7PtgqEayTAgc?=
 =?us-ascii?Q?P8ij1XMre3ZnN1M+OLfk70QfKqOYI7DCK3UnZP6U/xct/cI4xm6zYLwTSttI?=
 =?us-ascii?Q?LuaFyk7xYYyMOdF7Y2CzyGOxaUloDVRT2ZBBlmm2OrZZp7qn+aKdYgQLUPEO?=
 =?us-ascii?Q?uia56jv/VH1lLZ/uYIhbcQQZAen5KuguPrak2XuYvo2ECUDpoT3szMl4gAMv?=
 =?us-ascii?Q?SoYP7kTMMSoQESUFdD67HUfg6Xwr+W3RhuBEbGd/CcC/Js4DPQS+nR9bswaA?=
 =?us-ascii?Q?jh/+BPFY2Yk9jH0iugzRDA3MRe9eDuWh76ocXZqNwPrnH67EAuJ22BxrYQ9V?=
 =?us-ascii?Q?s6MNex3OXKqZLZTKrP+CYnRiNShL7rYQh7TOIWBWHJAWVILebcxasP8KSgGV?=
 =?us-ascii?Q?AX9vZEWHJXI6AUHjH4ELTZhUQPiOiYrjMAZeLGML0808E4vEigY6KooZFzaM?=
 =?us-ascii?Q?veazZBnslP3EYDlj+DlDNR2JzdtUM0socs0L5EVf8onX6BAk8jBNeE9AVnco?=
 =?us-ascii?Q?1FTCp9nL7Gg4FJH6yUXwowHtgJY56/mW2F2Jccy0o1IDSOlxw8bELntKne7P?=
 =?us-ascii?Q?+wy5SSghn558wMY4Ct9BRevxLxns4WF6vwWC/FyK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 117cc56d-05ef-4cd1-e26d-08dd65722482
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 16:38:27.2579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8egIt5/ccd0soGnswQUBqEJcQfyIeidvsbw5NNZ3waTnWadJDPHfx1T9sOy80rT7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5788
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

On Tue, Mar 11, 2025 at 06:37:13PM -0700, Dan Williams wrote:

> > There is a use case for using TDISP and getting devices up into an
> > ecrypted/attested state on pure bare metal without any KVM, VFIO
> > should work in that use case too.
> 
> Are you sure you are not confusing the use case for native PCI CMA plus
> PCIe IDE *without* PCIe TDISP?

Oh maybe, who knows with all this complexity :\

I see there is a crossover point, once you start getting T=1 traffic
then you need a KVM handle to process it, yes, but everything prior to
T=0, including all the use cases with T=0 IDE, attestation and so on,
still need to be working.

> In other words validate device measurements over a secure session
> and set up link encryption, but not enable DMA to private
> memory. Without a cVM there is no private memory for the device to
> talk to in the TDISP run state, but you can certainly encrypt the
> PCIe link.

Right. But can you do that all without touching tdisp?

> However that pretty much only gets you an extension of a secure session
> to a PCIe link state. It does not enable end-to-end MMIO and DMA
> integrity+confidentiality.

But that is the point, right? You want to bind your IDE encryption to
the device attestation and get all of those things. I thought you
needed some TDISP for that?
 
> Note that to my knowledge all but the Intel TEE I/O implementation
> disallow routing T=0 traffic over IDE.

I'm not sure that will hold up long term, I hear alot of people
talking about using IDE to solve all kinds of PCI problems that have
nothing to do with CC.

> The uapi proposed in the PCI/TSM series [1] is all about the setup of PCI
> CMA + PCIe IDE without KVM as a precuror to all the VFIO + KVM + IOMMUFD
> work needed to get the TDI able to publish private MMIO and DMA to
> private memory.

That seems reasonable

Jason
