Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4828B9B1B1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 19:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7417D10E79E;
	Wed, 24 Sep 2025 17:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bGeyoRDG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010058.outbound.protection.outlook.com [52.101.85.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B311A10E79E;
 Wed, 24 Sep 2025 17:49:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxXwpD60hL7S9eN3BRRT8IulUg5kyjisH9tYvw3sd9G0pC3R7Y/+FFhMAd+zGG/go6ptQ4NxYB/PXatsIWBwEinDjzMX31uVmq9bpwOOd3PJfqZAia7ru3P7wKzperhGuXu4rnjjznPVHNsRk6YlcrNfpRKFqndtmbEIxmpffar843TBpSayRtzY8QBTC6Dl9OErxC9U0wNyB72cOLHHXKwuh3oIpl4h3oYKDau9tNcGw6J8DGOKbHGLs3xxxSOXKke7Njqm1UIIRv1HSXoxyIRPq0NjMR5/oyC/yB1XqBTLOplUw0JrMhDbslLXWzsBtcIlReH5bVQ46VqFHyLffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75VgPazCsRhrv/0RWmNjdJr8sqYrXbU49MhiGHIbeZA=;
 b=nDoR8hhu0tKfw/fCCCIHE8Iz0nQigEj6D6ApeV7xKBruHnuNnJQbdVmVTJ9+332cfQimW6vmWlmgL25gOetAzgEi+vR/s+qMNH3m+xmnvSwmTD9yiVlxNaTC/BYu/EEDo7xQq/S5jEEWSumcz/TF8GVpCWNgASkA806Hy/fCEHOuHBpbCDvaUW+Po9NBjdqcENnEBg+7WuxR6tX1hzMVV9wdCZAP+S/04uUX23trZCvimTFk5esAUVyxzUoQVPruGoOdcxj9AOQmeWd33SxLKNp1BJtatsuCseQn4gN3k2S79fglXacezWhnE6t35whfWfTvLd11Y6wAepYiqtP7jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75VgPazCsRhrv/0RWmNjdJr8sqYrXbU49MhiGHIbeZA=;
 b=bGeyoRDGeiUBny3tWsxUU2Y+DjRWrl6YMskvap/J2MAX6QCDWf/adRKh0flQyUWSa4uwWOTqBG8AjWLvO7S5ayz8kx0mGhTdR9RuKvOROcNphDTunLTG/vqkyND3zmRihBuFK4fkw7ALdafSdOZ470F6obPb8OKmc/OFHcKNMG6s/aZCMKeEn4+xhsmpu27GW45NmNV67KwTUnyUHg+9zzGcmlafN6LYKTu3jGkRbfI7RedK4aS4bTMWmJnYN+TcQXvX4bBeXyTvkJg3eBv3gsRPorBMQDkHTv2ykNBmzrrnpu7IvN71me3JZuY6eAQNdmCY0PXsCaUKUnUFGQfk/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by MN2PR12MB4456.namprd12.prod.outlook.com (2603:10b6:208:266::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 17:48:56 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9137.021; Wed, 24 Sep 2025
 17:48:56 +0000
Date: Wed, 24 Sep 2025 14:12:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Christoph Hellwig <hch@infradead.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <20250924171250.GH2617119@nvidia.com>
References: <20250922132720.GY1391379@nvidia.com>
 <fbb6bbe7-8141-4532-812e-2b93cc2fcb1b@amd.com>
 <20250922122900.GV1391379@nvidia.com>
 <4e3919c3-3d1b-4f34-a1e4-5e9e7a5e6e14@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250924161356.GA3273841@psionic12.psi5.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924161356.GA3273841@psionic12.psi5.com>
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|MN2PR12MB4456:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b50fe8-d479-4704-9701-08ddfb92a246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YyuwUtssaS9AVhgy/dvbyZ6SFEDz/faZvlRmHdZyp4999PB9U7qr8heCAINT?=
 =?us-ascii?Q?fdd3oh+nJ/SgjtuC7Zc7HbrQTJT4TRwFONSVgSja1PHHSn3bVDty9VbP/xmD?=
 =?us-ascii?Q?7HB8kTJY+8e7mwyI69KxPwZml8nBflyASA70drApMEO7JXecVxGNO/mHObuY?=
 =?us-ascii?Q?YUJgEi3wB/zeGOKOfuqrdOcaBuKTlHxk0BcJ5vqA5Pn8XBgn3hmva0Zm4WHI?=
 =?us-ascii?Q?BdUx/y/OZuP3xIuLrQnMwUGJupv0gxzzDkyVfKEMUXh3ltTZKLtfyBjCs+YV?=
 =?us-ascii?Q?bYtS7/mJ+cDdlaEJc34bck+I9NUB60hAFGHU4Rfts3nMaETNnVAHR7PS2zrv?=
 =?us-ascii?Q?WzGyNPfNxS3oe/Pwaa403TfoHCf3rTX2goKk1LvP8xT43grTEHAcJwbgbpGv?=
 =?us-ascii?Q?RQKgmTM9dSQHK04SMTtnjzXNoLJMNALQnF0BeNVR945uAmQz2vz47N5UboL1?=
 =?us-ascii?Q?qukzFRiiC2MlGC1i+MlB5PksAVGF4cmsRRp/LNBEtkzUBqdGghS61h99OWYh?=
 =?us-ascii?Q?WepuiWQ0yL5KmlY8l+a7/9grUD1bljU4Y9/ULCWK2nHFC6yL2K32iOKroHDx?=
 =?us-ascii?Q?RsUN9ra9qzk8CyAbCqeDpkPYtIrSsPnKR1c3J1C7DinTlJue6Uf7VpRbMpJP?=
 =?us-ascii?Q?vcTC63UWnM+EV3S6Ezz9WJMykw0hFEaBblvDrExa3xgBJhJGfKW4kmFo6Gef?=
 =?us-ascii?Q?pP1o+OibGZR6uKPCCWoORlIjRWBPp+2JovkcIU+muGQQX0xRQ3Umu50ljF/n?=
 =?us-ascii?Q?sC/MyDwAFtzXunhZq5C2h1SMaZtr/kzzM+Dfc9aEwS5WjljafXBEXVqoXtu/?=
 =?us-ascii?Q?nR8Qom3YCqtsbZxJ7g3l/e4d4EPVUUJkylY6LDBk2Bqq9uVBw/S9PIDvfTj0?=
 =?us-ascii?Q?W0waOrWu5NXO+P2XNJjGOdStKEvk6hAQmXWlRQ0Dg9+qUMRW2lWcAUMrlLrs?=
 =?us-ascii?Q?aE9kXqUG0nf54dsUB134dRc4ywoXLybt9NsLDMSXZYR0aBpwWPWYS6+Tv4kA?=
 =?us-ascii?Q?Z6OIWjG2Tj6rEWIzjqjTTXOmhkAqnsQ8Ovp1R0Nvvpp5qLFD5JQj2pXSAF6g?=
 =?us-ascii?Q?so9Ks2nWECFtHe2lvcs0n6RygosC77sYHpUl/h6R0tA2INPeN/pqt7khQRrl?=
 =?us-ascii?Q?gBdKI9rPA64ERnTRNGf8HAuuZZppQZNHANqXvnvOUPWVSSW6D3SgydqgW528?=
 =?us-ascii?Q?kUZt3sXOgXmrSxa5Z/y3ce5sN7ahcJCZZIzB/JGBvStzF5L4eRL4rmh2ML4f?=
 =?us-ascii?Q?iPlIX7omSCFhcNyOAPUSDIDiDiknEBsJjCwWihJrYzsZjpRb1reNJBBIO1Uu?=
 =?us-ascii?Q?24v55MhCIKRwGT0XSguYGef/Z/JAj+ESOveMAzOS/S9IIs1yDG6PRDPs/274?=
 =?us-ascii?Q?rFfMNRPFNbmMr5AmhylA/1jhTkVC4g7i1YzhaU1a4jHfjJPCcw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5757.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eoSbsxbo5RaQERmiHOWXcm77dOBIs5Y5D6daRNGUrkm5yekd6jEIMQxovfBS?=
 =?us-ascii?Q?YlfH/PXMP8cMt3htsMnycJsYypwxBQEQ3XwDV5bZsMFIWwqSTjjKbFy220dQ?=
 =?us-ascii?Q?R8NwzqZUz+79t3df9YQyugMrdqrdEtkIK3XUlBN6mTeszuDjLtf2dx4VRqG2?=
 =?us-ascii?Q?DtD39G5oODXZicBLl1+BZmpSoz6zngkc7x46UGibRFgdYdfGLVEYLp+wU62v?=
 =?us-ascii?Q?U3qJpE2xGaZ5eIAWOEdTP97lsGNVzPd8dG2HExvVkrzq2UCAGFnZ9Kwz3GjV?=
 =?us-ascii?Q?jgXL8IKPzD7moW1WpxdIgEkMEBdMyqbvGxFBCas9pm33xoBIUrs5nIqXemin?=
 =?us-ascii?Q?vuqiGO0txJZuBWGMaezKRbsaX6mh1er+y72LqJdXL966aSDUIWOiylTz2Fzf?=
 =?us-ascii?Q?eutxdnF38Q/RnKLdpFXZWHOFes9Q2Pbjla8yaeP1keW2DHBdprCqiluEcs2p?=
 =?us-ascii?Q?kMt43BZc8kuWhyA037upaUVzwM+EVp7lunt2zahqzBw6g/203drhP1p/6kPX?=
 =?us-ascii?Q?rMHMaaHvfgtoDAcfJB1LpgiDgRUVdKmIoxmRJAWdN1turbyVBw8czvXN3wnt?=
 =?us-ascii?Q?qhMN74ax+F2dBV2cqMBoZdr7MfuGbVjZeZfZ8CvGcfnjBGykhXyHEWvDYsqB?=
 =?us-ascii?Q?kXLHGX/ZCWvJDUSpWp5KrvwljEgUD9XQxrmROm5lqI2rPtr21ZLvp8iT98mv?=
 =?us-ascii?Q?zZpV1pn9chJ6K/avxNx1QYYRnoHfkqlD6OrTkxCuiSyPyTNuQW5hBIrr5HpV?=
 =?us-ascii?Q?aawmjE+U73vM9OprUfaveWRHLgllud9DtqKxvulz8NExV4Ek0EozamFqWjDL?=
 =?us-ascii?Q?XHaEEPKHCAE6CZTaXT/n4waPvwAw69jLWVc3KsE5hJiUUHVwzQ34mmOtWLvC?=
 =?us-ascii?Q?jdKvkRATZyDULDH1x8SNvxwZKdfXAX/MuQ8ooXuLwAzzTkkwMDaUvULrOgw4?=
 =?us-ascii?Q?QDNLb+Rr1+IV/A2TkEfoTYfjWMlNPwjsoQxrRGSr6WsorAVIAPw9keVMQ5S/?=
 =?us-ascii?Q?5ETdMehKWHDantKqh8bTIJeoq27O7/VSoKZOlf5FQ7ni84HvBnHeWDy4j16l?=
 =?us-ascii?Q?Ag8bv21bwEzsSJLIFb96JQ23fEhSXtDKgE6xPkkuuRJxTUlKoyiNML2JuooE?=
 =?us-ascii?Q?Ibkj4e2kh9rIrSWNeeOTXo1TF1Kb08tYUbLY7cvTTHZApqt15pKVzaSYSKPO?=
 =?us-ascii?Q?sNNWYdJqBpghC3fSPkDqmdNrcW2CHHlLaPtupaqlnGpKQMzmOGnmcPRkrryg?=
 =?us-ascii?Q?jIj4Q6JVMg1IGpjI53cNwfoGKMuZLBfNTvrMRUNH6sHcGibXaExgoqJUiI+k?=
 =?us-ascii?Q?mL2R2f/S9LXRKhOgEKGm8kq7DwzVlw9NUI+OFMtJdoWa3COR/AQxkdG4KE6F?=
 =?us-ascii?Q?uZf7Ig0eVmI2JPYkh+XsEoP+6vZ2eDD0FyiAuEtL/BrZLWsOG81/j1Hr2gjB?=
 =?us-ascii?Q?b12iPpJ7XtgI53oMEd/XArqH/tAZPnZURNLlrCirTNxZ97RNnuINuZukEKLZ?=
 =?us-ascii?Q?Isw/KGl/0EymJi/rBLy+6bBaP5jpvHw6IYdWr59pT1KfbOKw3lR+3SeLCjDk?=
 =?us-ascii?Q?uM3TJmlLSDfd29sF7A0GtcQ1KFHC7soLx5/TGVGh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b50fe8-d479-4704-9701-08ddfb92a246
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 17:48:56.5811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNscCfeTTAwZaFSQ9jQQ/8oGiJtpwp2HFOYW6YIZCWECejI7WfqDflbIkMLHGEs4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4456
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

On Wed, Sep 24, 2025 at 06:13:56PM +0200, Simon Richter wrote:
> > The problem here is that the CPU physical (aka BAR Address) is only
> > usable by the CPU.
> 
> The address you receive from mapping a dma_buf for a particular device
> is not a CPU physical address, even if it is identical on pretty much
> all PC hardware because it is uncommon to configure the root bridge with
> a translation there.

I said already, you cannot convert from a dma_addr_t back to a
phys_addr_t. There is just no universal API for this and your examples
like PPC explain why it cannot work even if some hacks appear to be
okay on one x86 system.

I think Christian's suggestion is to pass a
(struct pci_dev *, bar index, bar offset) between dmabuf
exporter/importer

That would work for alot of use case, we could make iommufd and kvm
work with that.

The Xe PF driver could detect the vram by checking if the pci_dev * is
a VF of itself and then using its internal knowledge of the
provisioned VF BAR to compute the VRAM location.

If it is not this case then it would fall back to the normal 'exporter
does dma map' fllow.

Jason
