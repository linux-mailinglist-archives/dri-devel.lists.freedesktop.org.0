Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B00A4610B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 14:38:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBEF10E1D9;
	Wed, 26 Feb 2025 13:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nQCrO4NE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2064.outbound.protection.outlook.com [40.107.212.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCE910E921
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 13:38:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGvQByBskcNlJbocxUfxCoR43eFi1wqPtl2Ihz75P26FAfHI50HKti7FiaDAb5EOvBSOlQUaGYFFA3nBLOUO0WwnWSWRxrKqA+DLURNN9siWHwFaFma5LaNI645p5uZvXgAhXTNGTab1wtMeHr6Vcb1jZi6YfQrrFs9AeJY3P62EoUru4oZ7pbWOtAN6HDA2R7r+WNXvfaTcjg+v+LAasvGYqHXkfSeBNay58v9aNHuRTKTyUM+5DUCemtxvUSbkbOCAwT244UAYsUNsFpOuvdPVYkhGcBHYCfiPY6XHAOEvRg6dd44PpoB9cpZHOGCo5c1kYaa97h0tZE5Iu7lg+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4+QYv4OIJddGtJIa7w+Zq6zcguYyHFa1+3pFRZDsUI=;
 b=ZMPtlxLS4Q2l2Fyl35hdly1r9Ku/d4cow/FbSyr6OqwnmrKiphpFC0I4huF/qyEGGUL//uueyKQmMWQ0UG0RHB1BF5WAn22HyUDB7sdzn7h1WSF9ySnO4fNgf02NKOOHCqf5vEnmbeoc5hiqlzAhhKBbqvAHQgn1LWTZ4DaJomW2LcWtz4tvICOPmKxGaDa5oAjCwBxo+f62ZfATdE8eKP0dG4xkEjMef6d2gi0K0rH59MQnkUSe/NKnBLeldMHP249M7S6/bLtMt4Jyk6tLBlbwaj6fuMD+1ngLM7LSFjIHtkNL31BBo8g8wRBAnjMtgye4Icdio8jf+v6kCZ81ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4+QYv4OIJddGtJIa7w+Zq6zcguYyHFa1+3pFRZDsUI=;
 b=nQCrO4NEji3ZhEVxE7kPAKFWhVsk91C7tdh+9WiIZ0WCtgIvbdhSQfFd6p45+32ex+eExlnP9kNeU/+NLBrAAW/12dKHkZQJFl4k480NeoQO6/p4X/0wfehQ4shhKAcFNkIDHtOSCkUwLuVMszOn5S5fFRKfZIbXlukRL5eytUV4VN0b/nM372TsLUs8VHAICG9TnvNOFGammHmlO3pB8zucWS2gg0rPJhlFOL5d/9Riye5AylxLGVsZ704vurLpxdJzmdSfFES64DIv+HemgUkMyowTAAb39CbrBataiZnBs7hUpOWXlEWd84vTJKbGfJUSiDmkxsHzyuMrIh9+ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CY8PR12MB7416.namprd12.prod.outlook.com (2603:10b6:930:5c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Wed, 26 Feb
 2025 13:38:23 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 13:38:23 +0000
Date: Wed, 26 Feb 2025 09:38:22 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Wei Lin Guay <wguay@meta.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Dag Moxnes <dagmoxnes@meta.com>, "kbusch@kernel.org" <kbusch@kernel.org>,
 Nicolaas Viljoen <nviljoen@meta.com>, Oded Gabbay <ogabbay@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Message-ID: <20250226133822.GA28425@nvidia.com>
References: <20241216095920.237117-1-wguay@fb.com>
 <IA0PR11MB7185FDD56CFDD0A2B8D21468F83B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <924671F4-E8B5-4007-BE5D-29ED58B95F46@meta.com>
 <IA0PR11MB71858B2E59D3A9F58CEE83DCF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
 <61DF4F0E-D947-436B-9160-A40079DB9085@meta.com>
 <IA0PR11MB7185E7DBB9E959A2F40D4170F8C22@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB7185E7DBB9E959A2F40D4170F8C22@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL1PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::19) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CY8PR12MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d83d639-05c3-4717-e1ba-08dd566ad6f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2qiaG7kWjsam3ASTt7L3SZUHqHlbliqLO10s/Lz2NrI13vzzHi57sk1h6t2w?=
 =?us-ascii?Q?j/1A2YU+OF04qdtNw1/T9A0iIt2NoHzTB8HUHye0+ai6MSml18etu0VRJkxD?=
 =?us-ascii?Q?qhTsD0okWAaj0WUGhcGtF19xq5jhGdssiiUzj1llD4wUWXfXyh8n+7j+LBrb?=
 =?us-ascii?Q?fcEJAsKgIGetgILTjXabXZrEbK721OUl4zsgBQcYjkr7GH7d/TksVhZ4b5oF?=
 =?us-ascii?Q?Z+43CXsIHXe6SFwd8AtKqI+IZZuxVUowqJQxSqPG+AElriajij+tVuSJ7cR1?=
 =?us-ascii?Q?PompcvL14pklXnv6po4d6Yxm78jqH65ghoFud5ySTeDXD/CfO8zCpBsL9i5o?=
 =?us-ascii?Q?vIJqkBazXEoaJyWKHwM5+IYbCTsmzLrb20gu96Kw/E2SJDiyrEHi/6hIro4I?=
 =?us-ascii?Q?P8Xgz8ARGRK/Hr5HCwuaUmXH1tcawRxjMoVky5nQfEroarF3xpdTwJjmqDzQ?=
 =?us-ascii?Q?y2WpNiAIY6rVbFVH1RLCL1WwIGBqtlAZ4ZAyGpmejwROcDTXESE3mH7sIT04?=
 =?us-ascii?Q?zRBiIcceMpFwmcjPu5iuOUrGIXZ1qhSl+3kPxVYcVndIkzm6Win0ctzZNLDF?=
 =?us-ascii?Q?6fotinb0IqAJAB4DRguU5okEpBlYupbwqhsOBbitw/nDcEjXeH1L+IuMPV/J?=
 =?us-ascii?Q?s1w17srgj9v14nF/KLlheVskgDw4/3p8g5S4XH0Fb20hXymV9ZGTR6x6R8YN?=
 =?us-ascii?Q?a1nRurcVYQQxgHOl/hmffmGdnHoUoBmG1U7Eu3u/fN8kC35c0O0DTbxLEkTJ?=
 =?us-ascii?Q?qI1PunpEahbU7Oha2D5ZainLcvBAK7Ggo1oofBOXyDHgswmm2yRAWBkOwVvr?=
 =?us-ascii?Q?FUph5RukKYEBqCVZ2Y+kdXjYqHvwcz284WDJakdQFSLhMmWdIeRyUmCPC2bc?=
 =?us-ascii?Q?nSDXibk7I4TchZewGpIA7A96H6enk5Y0maWQM6d6Epk/mWZ6v3auVx4uatH6?=
 =?us-ascii?Q?Uxl+hHrEMz9yOntN0nJE63U2aM1Zmqg8Ldrm7jECp4bZluMxK7bOcR1rkFbA?=
 =?us-ascii?Q?VkS+Jl6cFd3oyMLwZ71MhzPjcQX/LvF35Q//E8cCdxKXi+0iAoVOw7pd1VCG?=
 =?us-ascii?Q?fSXTQf99pH5/KdE/acGeSYjAp7UZ1DWiWlSwaSiO41gnmnFj7/HBtZxC986n?=
 =?us-ascii?Q?fz/arRgZLTXtGqSJcLjrhcTwx12XVWWTyGQMoQPDYH+uh4Ug/GhtP90l1RRp?=
 =?us-ascii?Q?+6hR/JRV/wcKpdPUcbavRR0eN6/BMTonLCPB0P9obj/4NomFwabOWn9PMU62?=
 =?us-ascii?Q?sbWvVQXh557S9dyNpFIaLjpq9XA0IcRPY18WTY1PQeLEnGoDMepvRwcQWaQF?=
 =?us-ascii?Q?u1D0/6mCz1j9BBnEu5KT4dQHcvBhcbWy57G9nhc7pIOGj9IpxbMMekArr/SW?=
 =?us-ascii?Q?buPs2KA61Fwfg/x8rDHT1D9/Ebcc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WdIcg6xDfh9msX7jD1Fp3jrJTH3wf8mk7FHWedNbzHNOIPayhckW6ePZLdKM?=
 =?us-ascii?Q?y+CcQOX2A4wPhf4MZlOP48TC3Kx1PfADcQBsVifbteGmMEb3inNPOy2DIodt?=
 =?us-ascii?Q?98kPfDrs+hstCHCVTc49sSdI1COQyjtPl2AsmGQX7IoA87Trf8qFcPpTkhWy?=
 =?us-ascii?Q?jSDr56R9Pn5qRWNaZts9CDp6uY0JM+vKjWXJMiJqy8X8T9e2JlWzaKtMK07I?=
 =?us-ascii?Q?c/AXL4rxGZK+pFhw+WpgGYs9etBnCdd4hd92WAImy018I6zYpN4KuLtJyx2H?=
 =?us-ascii?Q?neE8TNw66SFgtRRG2SJpptwjXPFu/4TQiSIv+Z1eMCR8tFkZi7qIA5UtXgq1?=
 =?us-ascii?Q?cMKd7SJZMSgh4odDOHNKyZFQaBCFu9WuXX4RRU7yryAryabe7hcGYewWa2lY?=
 =?us-ascii?Q?q2uTZ63DjMnfnYN0DnhytE85Zf19dkHkPr1lHzhW6reLrsnLqBrYWWd6pE6p?=
 =?us-ascii?Q?C1vcmGZIntPFnfGlbIdWcDwHUGbSGuNPrDhpQndxpGDoh+4dFuuWGl9l6U7t?=
 =?us-ascii?Q?yg9bDQggIlu6rvMcrboHXS5zYduFNvn4XS7MoqmzqbmjL7XeUx/1eBKUU0op?=
 =?us-ascii?Q?8QV2woNlqQmsLXamQdIrtbrXIIBFHMuklFYJdl1ZtCyALN9GMUKimkh03TrU?=
 =?us-ascii?Q?cCRuRj2+4D8QaN8An70pc4fi8LyRrkoagQLK/Z5Kr18xvoQOasSayWePm2v1?=
 =?us-ascii?Q?fOIbWKgx/D+GStCX1XyDfRmFVsBLhXlCUbaDNZB5PH1G5y95N2L9PGQWpx15?=
 =?us-ascii?Q?tf8nGZ2+xKCI21ye7vnMyhhazxGpHTSgnFkKarvqsVbDstlZ5zoZEIqzeZWL?=
 =?us-ascii?Q?4n07Y1F851ILsJl+qG+e/WCRWgqBK+3yGaDL2Z28fs/4eEUkECeAgWC+NtSv?=
 =?us-ascii?Q?5cekFrTEXr3knfbJbdWUcw9Q3XpMzFUc/nxrgBKKPUVd8cC9efzJgoiO/IJx?=
 =?us-ascii?Q?A3VDtSl2MIfOLa3IZCgSViOO1ifvk/SY/S4a93Z6gFdVaxzhCKywJrvaZQca?=
 =?us-ascii?Q?Grq592paa4jj+4yfyu1D2U4KKfZGKjGG1BNBvGfy+uSXoffSj/uKK8qBNmEa?=
 =?us-ascii?Q?hPBQ7VVjol1BZZOeL97F24SOnqXU4/VwSCg7vFnr9qXvC3HVUr5tG9dFsz7s?=
 =?us-ascii?Q?srbbUA3x4aJk+qBraj+BVhl6227ZJYMqdD37y/VtpzZZUBECEqZmOsHc5OJe?=
 =?us-ascii?Q?+VXmOSGN7zwxfyz0SleEiIETY38yH9JAhih7P2Vf45lTXRY+fT+f0aQ4vfm3?=
 =?us-ascii?Q?KCtJBToBQil1jeGDp+WEzhWQ/40g+t6sowXR4XFZHfZVWNbBiXn5icM0mNhI?=
 =?us-ascii?Q?p7S2fyEkXUED7CCzlH2YIhp8gIObPS2lXR10GNscVs8WUoK18BYGQsV2r2ur?=
 =?us-ascii?Q?N1ykyZahnReyv7gWJYDSTU8VyHfRrMp//flK8TtEhiTsLIwC/nGle+mFKr7l?=
 =?us-ascii?Q?9at0/nVsGRtpKFZkCwr1t2BQOKhy8WMYJsJdicHMkd2cPuFABX58LBH8zA10?=
 =?us-ascii?Q?Fv5wt/ysVKCUUdeoRoH9t+V9/PqY5GXOaRxZLCNY4PHXCFPt+pfMJQui++7m?=
 =?us-ascii?Q?x1WBn+1cOH9n0xlvYcE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d83d639-05c3-4717-e1ba-08dd566ad6f6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 13:38:23.1497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xtp731U+LAG67b7+6mJ//bvbqyzygVnr35v+lDLmuOFcnAb1mD/+8yU9mSnUSDjC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7416
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

On Wed, Feb 26, 2025 at 07:55:07AM +0000, Kasireddy, Vivek wrote:

> > Is there any update or ETA for the v3? Are there any ways we can help?

> I believe Leon's series is very close to getting merged. Once it
> lands, this series can be revived.

The recent drama has made what happens next unclear.

I would like it if interested parties could contribute reviews to
Leon's v7 series to help it along.

We may want to start considering pushing ahead with this patch series
and using the usual hack of abusing the scatterlist in the mean time.

Thanks,
Jason
