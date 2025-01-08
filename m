Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE56A05CC7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 14:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB38F10E8AD;
	Wed,  8 Jan 2025 13:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="a6+9eKzP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2083.outbound.protection.outlook.com [40.107.101.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AD810E2A8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 13:30:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=To3WkLYgXN7pS4o6V9hAXBOZEo8JuH6sn/f5T9LX6CrsLd6C0azleFlLXDtulP01sxEy/yanpWPqhm9tiLRME9bR+DEcxgTbL84mzLYQQBS1p6YMvJF9YoG57Zy7mSLnJT0fUucRvP+jgv8oJ4DqT7EUS8f9gjediwlzAD0eFbVC06yBDCYi4xF8YuBFNxcUrhaC+whBDZnQXtrb/JTvxQhhfPUWM5r7a8hd1QIvf5fzEliSytL0xd7R6BJnt4KgAMhF0dvdhFgr9uSiFBhDtho+xPgwgpl5vC8+kJGJQnnzCKZ/heKKgDkUCLtoDog0rVhJjU4wSlBwYZrXvaKsmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yozc79SfbiXucW2IjmF/d0EDvndmGlBxkUTffpB/934=;
 b=OCwPkOC5iE8i+Rl0JHXt2VLPRifUqx4zMNy3RFFX5gdZh1CyeqJMBEva6ZKBriyAL+FZleb0NDdmZPvGMzlaCK1jjbmpLRAuHe4d/JxCVSNFTlKepaEeE85sgfI9KwtxbxroMR6RsyZFvT/4+U2qlNl5yrDqa+Ye0UEANK5cpPCNBoZWQOiDssLjspsKgOgR3QcAlROSugkX8vLHMWP4FOGQVKVLZ790UCBmUTjvqgkZlj52oNoWKi/EXdfjmv0hGtoFbZsxYjRpzG6MeySfGMFpqQ8m3ZN5gHoRLb5cWnVz1rAM+ID9VkVDVZhiY0Ysj122QVNVQfiUnZ2UV7UITw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yozc79SfbiXucW2IjmF/d0EDvndmGlBxkUTffpB/934=;
 b=a6+9eKzPyKihNsSH7GKRRGgp3hAhv6V4gm3xytg0TCRVP9g7xuEY+HJlhLLRz5xT07LnTUON3ixOjEqk8xSOlnZozGpUAbjs5C550cKNwXtRjWz3Kkbr3QitbIACDaIcoNquYLNVW0Gec+bW3hvm51uRwtvsgnI0vlnm8O8bPC/H7y+Bl/SoSrced+VKrWo44EtRotbj9heB7VDMKtwF9n0HqI5RPIYtDFng0Y0Cz2jiAe7ig6Qk2xuvstRUHQWNv0eSpbnEaflBsagasabNmehIrw/OyLZ/iiZCdhwi32fAwfwOT+adR06II614z7xBR7EKOTfLsm6qRiZ2I5pnhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CY8PR12MB7658.namprd12.prod.outlook.com (2603:10b6:930:9e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 13:30:27 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 13:30:27 +0000
Date: Wed, 8 Jan 2025 09:30:26 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 08/12] vfio/pci: Create host unaccessible dma-buf for
 private device
Message-ID: <20250108133026.GQ5556@nvidia.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-9-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107142719.179636-9-yilun.xu@linux.intel.com>
X-ClientProxiedBy: BN9PR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:408:fe::27) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CY8PR12MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: b42ad4a1-b6df-4610-d04b-08dd2fe89d62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pJBGhyPgTa3y3+Rr9N21tPVN5uaHsdSGiBBlaaBHyNor8WJ4oZ+WxIxA/g2q?=
 =?us-ascii?Q?M+7m8l6WB2S2lC6UyzBw+12Hg+PDbIhJTZi2SiLQFscOLO4TdMj8ZLwBTr3H?=
 =?us-ascii?Q?E/insBpwBN3Yt1WStut5BhY2/yniF9iegLeU7ZpAVHBLbCRtbC/1px8o916k?=
 =?us-ascii?Q?SO5RXukoK074x8oi4Fflw9OUmH1EmdrWv/D5FJo0IJ0SE4KkN+ROZUHQjCdM?=
 =?us-ascii?Q?9bH3lG4/nn8lh4hpxDR7tfM/jKf3isJR92iatD1R1qQ+iGVESF+cGtaFZ9+w?=
 =?us-ascii?Q?xJwsWfU3VIpSz/yrNqTYpI2nqxYs2pIzv7/lAE3O9WFudOy0o2hIbjuR0Xgy?=
 =?us-ascii?Q?IQ0UkAUsoWpCVcFT/JCGoArAHx1+ldERuoCpo7BSR1sLHy9kcthvQp5TC29E?=
 =?us-ascii?Q?vYKCgbswG2La9J9pJmo44Y+vDu6Kpz6R+6NUMlCcOD8Mci+BsnXQv0W4/qzt?=
 =?us-ascii?Q?i0v1QMukl+hPY2GDDnAPmx5ne0KHWMhCMCGNvvenpSQUu3y5HBNhxGpA7Ali?=
 =?us-ascii?Q?0chdJcx672u5yOL+kmtDQFHvTUKzdkPQYGjzi/sXxaMblKJDFJ7Ort7o0j8f?=
 =?us-ascii?Q?5GiTVdbxfdu5PBWLqxDEjEp5xetKIAxBIMxwKYFFWjrNtBsj2ZUkzlz1/49T?=
 =?us-ascii?Q?TBQPY3CxZ0GCh//YfBajg9ElPGvMXRXo/bcIOczOPd06K2mZROv1qipU1NZ7?=
 =?us-ascii?Q?3n/wb47gCa1WwZIP6CGSDjkQsno/UetDHbpsR7mVCjHB2xS1aUSWnNaPBx8A?=
 =?us-ascii?Q?x9uYyxpFYhR6jdOvf2/lkrc1I1hpk2j2f5I2Jc3+1s+pimOnCi/Fdvv3bROh?=
 =?us-ascii?Q?GToTf/0yvkOIjU0QIxdx0RwR4mWcChV7nMRiMUzplYXsR+x3KIubjw9Z6dZY?=
 =?us-ascii?Q?pXReut9XoKEXglGR6sdsv/U1kQaiP6nJc71+N+tevoPqp3SGmA1yj/I1WttJ?=
 =?us-ascii?Q?Yaqupvzdq/tgbaFMgTtTYZydotD5DZlQQPBv+9nIUEJsy43Gt3JOdkcjro37?=
 =?us-ascii?Q?W1Myv4kIX6h/UzEiSkTfCU5BwbFpazsOPRCmrRuQM+UwI5Oq8FtCSM0+xLWN?=
 =?us-ascii?Q?wIMxT+qsw3VVzi+gfiHF7Xe5MmgBp47RUP80NfToqwBQu+zxCvRn79Aibr1s?=
 =?us-ascii?Q?jx/AgpdcbkNtU+nxvVJtSd102H3AdKdlzR4Pew9ZWLNG7jJKn0uIW78/UHs7?=
 =?us-ascii?Q?jxwOKnaqSx9ELakizqoPteHJmu+YnAwPOFNUTDS3o7pyzhHqEFFG+qZCm4Oe?=
 =?us-ascii?Q?5+tiSgdV54F6R5XZg+teYAAKaetr5GuLKf7drRjSoQjv7sW9M2KxXCOMi3HI?=
 =?us-ascii?Q?L+zZ2XfPvIStLLrBNRYp6VyD6ECze8urWyTAdDsPRFmeL8zP7qFveT7ue/9L?=
 =?us-ascii?Q?QdOIREaK1xqDkwxwMs7jSFVOiFYv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mtCizJJaKUASIxai0DaE7LIWIZvUBwZUx00DWgsH7tbJn5gq1FFoP3jvEzEq?=
 =?us-ascii?Q?Cughi4nzL7DwDXtm85ntM8qv1xQWz4ktrF27NBrBIurz8HokzsQGJDXQEwSl?=
 =?us-ascii?Q?gjpEHKQXJN42Woxu5PjPggbk/EfE4X2o/IDG/eEI106yAkYHC5gJl1QdxTC3?=
 =?us-ascii?Q?V8GuBSjRpT3b9nb0nCn/ti6SP2nnSWWH+kbuL/8bVx2lEIxm6uPIeKlrAcyy?=
 =?us-ascii?Q?iWpNjzg+7nLUjUlxaBkrOKdyNvSh/B4pZVCqSkRURprMDNeuiO8r3jTfjZDJ?=
 =?us-ascii?Q?b/orq3TRogmpE6gfgOOnwZbMG4EQILCS0ScqfAGwhZGj/4SOeXdLDBaxRkqn?=
 =?us-ascii?Q?2oLG1xRtqN1X/1JT8kbNgQwwfuo2rvTz9MDJUB4TRG/iwwn5zT4tBP1Othez?=
 =?us-ascii?Q?FOiJEudJiZZsDo/v347haUcAqjwqVQ6lF0tRvb4kHvFRPS/yhqG2He3EU3M8?=
 =?us-ascii?Q?vjm9eW914HbQkwVf6qD56x928QrnBdJ+R7NRdScM20OUsi1zjPDoKwOMaxve?=
 =?us-ascii?Q?uachV7OuNUyKpyci8cG/e9WBGb+bhuXEyoMIE8SybouOpjam5h8EcO9uNtH/?=
 =?us-ascii?Q?6TKkRMfwRN2oqC1FgjsR30vm8R62Z5gm1RplCaxd1ovxuKn3UY+y3nthQDZT?=
 =?us-ascii?Q?zbZgl6YZ+yXBvGgnT/ZVxdkZ+1grjv3djTfhn0AUFdIqAeylFE2Em7BwNpF9?=
 =?us-ascii?Q?mUJL4EUE9rf/zYHwfU2P6QlMDDZ04CB8rfJQ8gcL/hmFonoAYhyIir0Szy9Y?=
 =?us-ascii?Q?cAzhubxupojy7Jg+ngqdXQmbRRfWfYuCW5g998RA1CXHSNIAWCFED0uylTa/?=
 =?us-ascii?Q?DFE5jVJ/y3Xm+A5dM3smp2TI0HhrUACybN3GrSpZNPThbs4Gb5ubegaefC5k?=
 =?us-ascii?Q?qlVvNbKAo6DO58VQ1uz1fRl7EY+FfhpVqAVJpH8ejuxVQIfndvcg9YImoCeA?=
 =?us-ascii?Q?icR6TqVI0TwDyKI5Fbz6HbdTDPaeQ0iW94uDkR7MSZtNRNQ/nX0OwULdLu/l?=
 =?us-ascii?Q?ORjZhPIcaO/dIIosniT+2i+Z6poPufamsibd4epslRojJpcOqCbfiQxe6PrB?=
 =?us-ascii?Q?4Rf8o021hi/iRCwfPrB2vIIJK/rbT4dHkRY7JIqtaOPLo924INaHAJMtEp74?=
 =?us-ascii?Q?jpI1zp4Y+RfIdnTxUBN+8m3SCY8Ac4vIszuNKCmKdAztfCEZ1uAhFeoY5fCh?=
 =?us-ascii?Q?aeuR/C1na1vYvTLJePZWx2aek2mtXH269wrq3TV+c/nx0YM7Vc2VHEXdFCx3?=
 =?us-ascii?Q?5UEfwFFGYH5HWKeIBbzjnZk1Xz8RZD2M/d/gAfczIW41NrCm7xo7h68mRwH9?=
 =?us-ascii?Q?ewT3PNJ98ubjoKiKZTaihH4SgdSUKTw+xwaGyV8tn0tVQ44pmyjAFuZh6PFZ?=
 =?us-ascii?Q?ONiP5/C0k0u5pAtw/kHGtM0R5eM5eLqT9Jog8vKql2uoQFL9jlwSsr+trYyC?=
 =?us-ascii?Q?4y/8mH0ZPd782jZ1bO15M1k1ui/W90a3gNjOx3bWK8Opnf1GV0G0pq6OZdeD?=
 =?us-ascii?Q?J5GRQlDMS1BSIrr64LHPxGiS9Mz2vMFQhfRv4PHIE5uRN8Q0JO/87AFc7dzG?=
 =?us-ascii?Q?Vvi1eA85i3g2bKKPIx8ucqtyI2k/FQXQJ9B3qSmL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b42ad4a1-b6df-4610-d04b-08dd2fe89d62
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 13:30:27.7612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxTjV/BtzW5vp5TZYf/Fx9ZjWsE3byJhDk3WgrYFj7JUuuNjE2walttwbkxgMyXt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7658
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

On Tue, Jan 07, 2025 at 10:27:15PM +0800, Xu Yilun wrote:
> Add a flag for ioctl(VFIO_DEVICE_BIND_IOMMUFD) to mark a device as
> for private assignment. For these private assigned devices, disallow
> host accessing their MMIO resources.

Why? Shouldn't the VMM simply not call mmap? Why does the kernel have
to enforce this?

Jason
