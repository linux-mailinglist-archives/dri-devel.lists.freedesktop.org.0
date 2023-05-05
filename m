Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29996F8974
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 21:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920DD10E008;
	Fri,  5 May 2023 19:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868D210E008
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 19:22:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKwrBp/3OW1qbAeRPPBD9rVPDb6yduJ6UoksHfXolhjG7ZGo28JwgoNqRQkU9ytscbcdqyozQW/t72HXBGVL4nPYQe01xqVRw48CRVSziBvrsJBnSZQwKX+7DeAWrVyEv55Xk2pAxfyU3dZcWvPtbNEiHVXJN3cTG+WX4iAJSJ+o9nE2PsxxxGUfrITHJN8bDyWse3C5Rnqwx+LpCscZlGETkCFqV33KcBVL6zqEXz3OcUKnCDBhRtU972U5kKpKPZWsNtL6cavajiVu8azQHW4jShkqqIqKJBtN+Ah3jXgwpTM5ORbUNJ2ZiYjpNqXL/JLfkYj2xZKiZka8SImvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCSl5Wo1lKziz2hPlN4uAHuv9IIghfAI0uBO6RgFY9A=;
 b=QluPLqF6E3aU1k+XrOHfcILD+wsiBdDp7obCgiH6zCDfyY2LLTAEfhBJo+IbOqHKUf/Tz+Ly0vsVbjF/DSHgqHP2YKSjXQcdWym3fwLlWvjF45raEOoat20V8UX+IGNY2vPuGeMoDqD4K9NTBVep9DnTKQQXoWS16/zRZ+5rYNk+bidcqSYPXp0QSL/IzmcDIVsavBIkwaP+24d0vf8TpHUbws8ADB1dLNvaZadCr2bBWmp8Xj6Ylb85sgtdFEUgWDrNHcCtTY7rxq1v+Q+bl+p7YfeAJghdtNw3l2SnkmROP9erFmaxynTE5KA6GBzGJC+rEF1IYaspDdsofVfE4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCSl5Wo1lKziz2hPlN4uAHuv9IIghfAI0uBO6RgFY9A=;
 b=b4/DHHDfuGPnEUo8oOC1WZ/ZLapYH4yhU/RgcfZHE1WpYEqUONvp6hS80SPvT7v4n57xmljL66H2s4BMsmXUuIOJ+RPAx0gs1lwS0tmDly5HkVq5vCnGRMSXuz92tI0ONgguOMsmKwlXCSyY6hLVzKRpi1TKNVsAbKK2ocIYGAQu7l6zFyxVK00q1QfX/OsWPi2KS7rKmHAC9/AjyBXfMxZP/3tPd15iJtEUjUHmGYfN/1qZ7P4ZW9cLMMosYMpgAEbZTC9hiUENQpoI1BjKMInwpL+05Q/tFuvEIM3dsDsfc8j1R+l35Q2RewsVONHgO7qco1uoiiKVxM170EJYeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BY5PR12MB4100.namprd12.prod.outlook.com (2603:10b6:a03:200::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 19:22:37 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 19:22:36 +0000
Date: Fri, 5 May 2023 16:22:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/3] iommu/dma: Clean up Kconfig
Message-ID: <ZFVXeoNsa0w8KoJm@nvidia.com>
References: <cover.1660668998.git.robin.murphy@arm.com>
 <2e33c8bc2b1bb478157b7964bfed976cb7466139.1660668998.git.robin.murphy@arm.com>
 <ZFUXmH9vndGZFuPr@nvidia.com>
 <8eab6d63-1fa1-704f-279b-83b2df7fa808@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8eab6d63-1fa1-704f-279b-83b2df7fa808@arm.com>
X-ClientProxiedBy: MN2PR14CA0004.namprd14.prod.outlook.com
 (2603:10b6:208:23e::9) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BY5PR12MB4100:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2eaef7-31db-4b6b-8062-08db4d9e153c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ddxmPo52/bTZDX5bNihtVvpfxW4boY13ULd3zOgkxvvP/xSXNviogN/Kyd8v021GaGtYYHEq6pKlPpwwrZiCp818mc26m3d35iYmc6bivjrPTpdkHa86fKnd1iWOyYMOOmIPYLly0KlEeoLG0xkp0Bzj1NmC8G6ElGFa0AuXZSvM02WA/jzwy3z0bMtd0Dj/8WrylqAIZ8WAwMMm4DKehLX/ENZUq5xo7aMGYlPN1FMNnk+rm8etCw3f97x6pzmtGc9/hcK+lrO0ttKjNMvMigdC01sS+Nesx2K5/nE8f8ZE16pAcvCnbnHCjNYih3KB4mfxPpNn/9tu52rYa85sWr678Ghmu4ffXSxDWv/ififTHOThKPRunx8zDttAFoVKFofRzLkLXJWkaMNtuY+iSKc5grfhbWlUXMVOx0g82RcwqBUzAYbbmfSlB5J/0+s4fakwjcINauhJBnFGW9rN240AO/ZWcfT3QKhdaiKk+QthNu/Qaz+tMJ7GlR4oGWLQzrYqVlGY0mFyVBuhCTtYrj/N9B/2Pu6ga3Ty4WissCDADHfIbuL3TS5H+FZWV3b/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199021)(6506007)(26005)(8676002)(6512007)(2616005)(7416002)(8936002)(6916009)(66556008)(5660300002)(66946007)(66476007)(316002)(4326008)(6486002)(186003)(478600001)(41300700001)(38100700002)(36756003)(86362001)(2906002)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RDajSX71FUNj+++9Zsl0ZCtgloS6JWospXwheVUVydRspRoM7ydUuukZFWD5?=
 =?us-ascii?Q?0+Vfg4yVIBxsvO2e7G9kKs7IoVINH+FGifXeGHGOKZXyrgB357ubxkjk4cLI?=
 =?us-ascii?Q?fyU6RHpqHRqRbwl/UgWC+fPQhkxDkAf5bveEed3O6ozDoOvkvAQgcgydehK0?=
 =?us-ascii?Q?BJuTMSXRCx6z3sRgj8A1vZHoX8yBIIPgdf8ppjG6n0iInRn19ViFSfEJjd17?=
 =?us-ascii?Q?YEAAaQj6vZO7qOq16XnpZ6Y1rXjd4tclXEyIuAPoBobCY8KiLFeUhnDZbDOx?=
 =?us-ascii?Q?9UTo9gftyxosowlpupdrUpuQDPmyRpGPGYGJGYrJ2Uko3QSjyRuPhJJY/CHe?=
 =?us-ascii?Q?h0UtlCP/5lhF/vapzZB2SUs26hqiS2jBUWEv/Rlu17yMj5ZPkL0k0WFwKkWQ?=
 =?us-ascii?Q?Wzag4G9zuKXEtALEHFhWe1WFJzfdD1A4NRQQRH2L2phHNMnZyt1iSSlcIpzO?=
 =?us-ascii?Q?PXKZGP93ZY+UsPbh8q/lQCER7kwpVkRq/WhZuktqsCTdRvIUTJj4P3r9lotL?=
 =?us-ascii?Q?4SauUwJfZwRITB2XWQvlHJ00xGTzmOnBeTB9gfWMtvdltfSZk77+T+DgIxBY?=
 =?us-ascii?Q?kKLhmpZ/itzOInnYuCetFSmu8JsXlFIJtGE39Ss2inyzz4rl+EjyD0w3fZan?=
 =?us-ascii?Q?z9M5nwMXV8lhJc3K7dMPwC2bPJMdZ/KOQhHMXwQ/YdY4ivIB0K7l8P/NUrd/?=
 =?us-ascii?Q?AKPvox8qD7giM8g5DWsfpWldVjvnGR0XWM69t1tnUujSUslq2EWzZDZ/SI2R?=
 =?us-ascii?Q?+p7hJU8Xtt93MrJWqMHqrQuBgGhEhY8w2HCO7RyeO2MYgAAUawFzGtnhSpSQ?=
 =?us-ascii?Q?86UPl1TE35bHfxbsSxNE7JyrGNVBthepPizS754vRY/HzUhBC6XaiwL5rM7x?=
 =?us-ascii?Q?Ak9EGlVgb7Rwgp8llWolnIEP0hyx6hIEq45GqiJ3m9pu54qk0cvqfThA1TIN?=
 =?us-ascii?Q?X/RMO2Z7rVJrm62mqEkGvrx9n7Nnk4MwnoS7utlV4lYutuye0IIYIDQ7gUXW?=
 =?us-ascii?Q?6G9Sy5WIvlCtgUKYX601h23pPlSkCyIxR0NbMGf7LCyV6v+hEgdTW8icQ+rv?=
 =?us-ascii?Q?0tyG8Su1uQw+urrXwhUX1VrHudl6/FJoMqcXAqxLCiC1WZIO1kgA9Y0S3R6d?=
 =?us-ascii?Q?5JHuRq2qypxPsTmRafPzGNFSAAVjiFPXbxm6dUeukwMZv+YR6gzB+ElWxx3v?=
 =?us-ascii?Q?QjnwQ8ECSvg1qgkXG8VbPv6Jz4j76tSRW99kV7xeEymHIcwHBE2BZZPNikrj?=
 =?us-ascii?Q?FSH7yZChXa7CyzvphonFk/r08v1ekHAKo2O1jHD568XlX3KTbEV0bvTP0EtF?=
 =?us-ascii?Q?iyy+tF3zd2LLdIpzRgKIBjwYsPLPPVuw125wbSDjejZtx4jOnnyCRodWeQdL?=
 =?us-ascii?Q?6ymbtgUyra69Fj1IoSYNkb6WfNC6PfDCYtnoJjcxTATEaEAim0n8CUfRfYbF?=
 =?us-ascii?Q?QHdiVvZ5YIZq5YTddP6SX6+lS17uJgrtyH22uF2BHSwLjtSu64KbdaqyPv0G?=
 =?us-ascii?Q?xHf2M7+HtoduikL3Ctyp0b8IO1FNuBv3qFj5OVPJcGieCkYQBb3pd+yvqh0a?=
 =?us-ascii?Q?1Axr33SNPqTrEwN7vng=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2eaef7-31db-4b6b-8062-08db4d9e153c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 19:22:36.1106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBKHYcuG+MjYnz/QUHJnUbb20X+Lk4mBFmRvE8LKJjo/WaT8XyVhQuA6UmxiddFc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4100
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
Cc: jean-philippe@linaro.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
 catalin.marinas@arm.com, joro@8bytes.org, cohuck@redhat.com,
 sw0312.kim@samsung.com, alex.williamson@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, kyungmin.park@samsung.com, maz@kernel.org,
 tglx@linutronix.de, will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 05, 2023 at 03:53:54PM +0100, Robin Murphy wrote:
> > > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > > index 5c5cb5bee8b6..1d99c2d984fb 100644
> > > --- a/drivers/iommu/Kconfig
> > > +++ b/drivers/iommu/Kconfig
> > > @@ -137,7 +137,7 @@ config OF_IOMMU
> > >   # IOMMU-agnostic DMA-mapping layer
> > >   config IOMMU_DMA
> > > -	bool
> > > +	def_bool ARM64 || IA64 || X86
> > 
> > Robin, do you remember why you added IA64 here? What is the Itanimum
> > IOMMU driver?
> 
> config INTEL_IOMMU
> 	bool "Support for Intel IOMMU using DMA Remapping Devices"
> 	depends on PCI_MSI && ACPI && (X86 || IA64)
> 
> Yes, really :)

Wowo, thanks!

Jason
