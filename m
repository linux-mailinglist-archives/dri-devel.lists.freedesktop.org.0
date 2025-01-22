Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AF0A19268
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 14:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D366C10E6DB;
	Wed, 22 Jan 2025 13:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l4UM4xEB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB1F10E6DB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 13:28:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gszx11+z486Ql5TV3+wXXnxwSsx9GPvb9NNYjUSJt983OeEB3LAfpeNM4RdcWhwTyxymw5GGBjcMndNXWcj9LIVO6Olnk3O4V54sPV4RxAubBxIILtJYRl45B/3oKidjLbUfF1lWmIHBvyZnKobMAawAiPCP8ds5okEknwMeW37A0q9aIKHJh04G4KpIrbBvcrajEcdOXWyh+8mOihVhfY4W8B1IS8ocHuk93sqKB/k0RAFmAEIq/Hzjjjn1JleQHlXX4DQ6Iq9JtBXykpc7AN39U2BQIYlr+P+90/PCcByQ3tmRbSAu5nGHjdOFhxEUm3ErKfENIPmlIpubq623pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2/RGiSoOpxm8xaxM5kKVYpKmstt38nDLpSvZY9dKwg=;
 b=Di+zm/ItqgyIhpZmeH2OyMmWg5WGULvAtSzMeZB7g2CZ6mjIngRVv7DA9J7UB4oz+ArEt2osVG3JOTQdxul3ZrXplbozl+cyugpSFCUTmhEaS5hSwMPJDFyn6FT/v2bPTRHmY8oM8LengjNy6ZFz/n1b+lUr6heDrhnDxukrVKKx7bSBy0Iv28UG1+Q0bKCxlSzzGNr9WL7Dnqr4rpuEoEPjU6Ey4ZMuE/wUrV+7dmwKjctLnqjZJaqmo19Phwk19TZ32UsC2jE56Yc1fczTA6XgUrHlqrB9TgqAFvMLqb2G1Z9U197eX/r7BFJfu9O2MCz7Ks08OEtKhOnX6hOYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2/RGiSoOpxm8xaxM5kKVYpKmstt38nDLpSvZY9dKwg=;
 b=l4UM4xEBeFqVG+q8uceUZAnz+4mvZoZogqRNtDdNKq6Qzav7UE4cC+R4gXNo0ad71M0NLG5YgdzTXokR2y4Ct6SdOGw+YYUavcPVYQn4xLJs0Gp3F5RvR2J0rnkL/gTIs+tuHSKw1HVeBsNeKyFb/PcnpUJMSaPP/tv96SSdgpu/Ef/pEMMdsLlyoqwNgvSF7UbnuabPrRXTjgTuHwd64CoyfO+EyJHaMdydea/NiD2IzmR2QDFcJEstEvcmg3sT19xifApoZlwyB/48PDJkgmgb5uLBnMfeKPPpEhqh75BFW9MoMZVev9fljU3ITWgCg2exW2VRLltkypGp8ChTVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SJ2PR12MB9088.namprd12.prod.outlook.com (2603:10b6:a03:565::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 13:28:13 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8356.010; Wed, 22 Jan 2025
 13:28:13 +0000
Date: Wed, 22 Jan 2025 09:28:11 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <20250122132811.GE5556@nvidia.com>
References: <Z4d4AaLGrhRa5KLJ@phenom.ffwll.local>
 <420bd2ea-d87c-4f01-883e-a7a5cf1635fe@amd.com>
 <Z4psR1qoNQUQf3Q2@phenom.ffwll.local>
 <c10ae58f-280c-4131-802f-d7f62595d013@amd.com>
 <20250120175901.GP5556@nvidia.com>
 <Z46a7y02ONFZrS8Y@phenom.ffwll.local>
 <20250120194804.GT5556@nvidia.com>
 <Z4_HNA4QQbIsK8D9@phenom.ffwll.local>
 <20250121173633.GU5556@nvidia.com>
 <Z5DQsyV0vwX3Iabu@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5DQsyV0vwX3Iabu@phenom.ffwll.local>
X-ClientProxiedBy: BN9P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::26) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SJ2PR12MB9088:EE_
X-MS-Office365-Filtering-Correlation-Id: a21d395e-c76d-4a42-db20-08dd3ae89ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k9Qy0zoEBWg+b50R2DZ29cHR+7bblx8YHuV3riux3bq++gIdH0/bAPiF9qBv?=
 =?us-ascii?Q?JDLjolNe9l7lA6bvN9xPGjypoc6zH1QsKrqbvTwO4Gt1BcWybnLAIhU+wC/d?=
 =?us-ascii?Q?RaiaUyuUusEKUu95S0Rhe225mt0pG8pYNPR/uLQbTBNT4Mo0ZsZCkoaLlFIk?=
 =?us-ascii?Q?CcLIJDI2hWPJB82xuLV6UaPz5N8MXetrU69rafO6r8NKeUg+8oMROwDbTM4o?=
 =?us-ascii?Q?ftJ+v/T3AaAZ76HvagZJYDSsHHb5vwlnrWw0VZPfazrQt5oqVInc/7nYqI5h?=
 =?us-ascii?Q?TWXOv/ObSt7M3sB/xZUG6cvXI+hCQNvw1B/wt1wDuRugd3vGsHRp31eNH4r6?=
 =?us-ascii?Q?rLShgWGKmxBtgbLvbZ1g3pevwDdORcTqqNs1tj7lpVe/avGHxWFgrjw9HQbD?=
 =?us-ascii?Q?X2Iasy/RawWjwg1OYfbzrDuLRe8uttnDrgP5oEx/LIRAwF2IdEaYrpva9WQf?=
 =?us-ascii?Q?ePUzvgsbyT1NmxndkVN6te3tXP3aY/ESqam14nO1UjBC0vzLHg1Dzkd/klGl?=
 =?us-ascii?Q?K3PQ96rRGlLriKUs499Ij25fwNxnNQM8I+jBdbaQLiHwP4qYviJnJLHUAmza?=
 =?us-ascii?Q?cBM0Lo8v0GQAkLSb2432vMsl2ueMEjRXSwAQdKU19G8MnHwm3BDk2+Pk1zOO?=
 =?us-ascii?Q?Aj3/V5Bkll9bEocxdk8kqVwoW/tIai40Ucs0dK1fuVv8uhFtUgfhsxFGyaps?=
 =?us-ascii?Q?uXlFa91q94H/rWmtoSBhuKG/UzNP4IM4vME79lult0tVurwX8Y6cv9Pb+F2E?=
 =?us-ascii?Q?MG7/PSIEz2cCNZGLBkAYisuLBtNLXZStSNLSX7QxFw1fs9IGSeSY/tBSYrez?=
 =?us-ascii?Q?VTq4xYAGBdl6t9ehFfeE65lcrqFU5+KwtZPgNVlwAuBBDwFtrMRzj/IvPVEp?=
 =?us-ascii?Q?YP9UDTe0Y5iRxLZ6tikDPVi9P6pdGN/K925u44HVcxGE7lgTmCO5FdEbXl4P?=
 =?us-ascii?Q?RVdGId65kuKOUhd9PGKLgD+hDvIc30N6ElIE+Z5dMJQbU9ddN3As3kSWSwjE?=
 =?us-ascii?Q?uJWjp2FPBManz/80ELDzWQlEMnupJPNh2nJk1SmQA4yC1lc9a0YsmF7rFeOU?=
 =?us-ascii?Q?aIbATjQcWH9qTMRE4aem1Ocwmh7/w0yz717DPUtKzhNfO65fzUE8Kj+lfZBY?=
 =?us-ascii?Q?eLBYn+Rt+CzAlCHqZzMWq9c0Oqnp9+XWIRuJsbyVy0Ihz74sw3kZ39l+L5sf?=
 =?us-ascii?Q?z2og1DOhPGTCO3T7LKvMUy3zv6tw966WYk/I8f9STUFiRTis9twcrFJZglmz?=
 =?us-ascii?Q?n5+tL/38mzV5jPgy/5xQW635U6peMZWCyOJirTJhzJaZd4Ooy73xCsDhE2S7?=
 =?us-ascii?Q?o8f3/8Q/omc8oyplHHIx2E5TTs6gIgaJ8LCCqdnhcw8I7WNzKW67qmVprT43?=
 =?us-ascii?Q?2Zdym9q4NYMioawg8hFiwbZ3WapSeWehlMTEhqhen8ARz+kKMHv3BBxZHsiJ?=
 =?us-ascii?Q?K+jhaIMoASE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?33wWyGM+oa5W/yc70nbt8GuUsiSxDslvyYDMv9uTv7mMFiMNq9AnIXoGCykE?=
 =?us-ascii?Q?q0DljZY7heKkj4IncVKNjZgPnW5KqY1r1nWlmFsU0+Ga1m0s74kae2zxjqNq?=
 =?us-ascii?Q?tHI35GlWvQTPqrnT8doQC1hysI7ZKMeVp4JzbWSnMA91x7ShyVzc4AisEZuq?=
 =?us-ascii?Q?A3+yVL6Bd7x80FAzugEMid5XaiTqTEmiZ9hdQBQom/HTcjYvf7MrDRP2SBUA?=
 =?us-ascii?Q?cVIgh4zz9I1fX81FXMzrBX7sBxz8DZ/IwlG+C/tzQhj5ToGkTaRLQ2K8IgCg?=
 =?us-ascii?Q?J9YwKMlDT9jyzgPqPkZdOvM71+1NPyIOayOJ4EHWB7LYNBj8dzKNxE2JTkcP?=
 =?us-ascii?Q?X9wjoznRXCKPYuQWJeleZ2P0b6Ir7Rr34B7CL1u6ywNMKFbnQ2K+s+KfpG3L?=
 =?us-ascii?Q?1u/yy8X1DneD4ki018HYrvL+zYhlgq6CHlBUCQfQjqCAUU+DmibrCT/oYxGV?=
 =?us-ascii?Q?TUW5ZaRsrmI5x0kMhwY4WvLQwHVf/7kNFiGU+P2w5LRY6gtIlqfT9YvHzvfs?=
 =?us-ascii?Q?IqSn+Y4hUOuPzRjuC5uAIx1QHZ+X9px/tHznvlApoOsH3N7cv2P2m5lyLEvE?=
 =?us-ascii?Q?OKcR5PMINbMgxLK2nVwXjpiatWl0GVTdLKFyQ2/dQH3S42sFuyLqz59bGPVV?=
 =?us-ascii?Q?eA3QIOhjRIjiHUp5pmrXI7YuIoebOaXgdyy+FgqPY4zMEgTx0JRF2l/AqiXx?=
 =?us-ascii?Q?iub0t1F1cpv1ZvHXWeMXTzqCnEu/2ii5UDEAf54E6QqSvmwxjQ3vb5Si+xrK?=
 =?us-ascii?Q?8gH+IBjWO2nEvp0JcJTJ1LL2+ySvmQHCoM4bVD1gZ8x9AE9JzIDU146oOl0R?=
 =?us-ascii?Q?whOcupunhojx19l0rHBdWqiUHla93upBIem338DRp8XbDOdjRsaEn86jIgFj?=
 =?us-ascii?Q?BrbHtiRMubtoAvuTPttDy4b/yL8q+0V71SOUq3PBE9PxOMH/u1+jCgK9VcgK?=
 =?us-ascii?Q?SbYREHrvSLGhnhUcf37Wqi6vcsqGhAb6O7joxZd6qxm77K1A3UZqnMYCPIbb?=
 =?us-ascii?Q?0/uT1MpcxlDqr85bCd8i/P7p7UrykaKhNvsqy0PuLgRWODfct9d2JV4hRSd0?=
 =?us-ascii?Q?/jntkthLnOv+GyJewUssRLnmkPKouTeo0HPlIWLnvskBwOnbbsH78+gipX3P?=
 =?us-ascii?Q?RMJVgP3f64X5N8nYv1W81GZpV0E7FD1C1+m+dNuEOw9ZBMn6D8f9422E385G?=
 =?us-ascii?Q?VQKpLZsbFCq2CrjPNKewRSk2UwEiymP1WWBVib61xoeDODQw1h9ip4AY+hYr?=
 =?us-ascii?Q?1YYVC12I9TFn/NKZwNrSgCBjT4yDcF9rCmfvTRWIiU88bsrZxOnXFwZAX+n6?=
 =?us-ascii?Q?T83o5hZnVhvbk8YWdTLGkPxKYSFozBrOP5HZcCf4MJ6IuQ4sDBEnV+c5YOF2?=
 =?us-ascii?Q?QA5zoP6lDabWi3n3IO05csVQdnXsNbaoyRoWT0SVp3UNr57cm1OLLo4DAC5+?=
 =?us-ascii?Q?7qVb/Pb3IBvGaIoZaM3vSzs5VT6xUKxrxcLJ/dgxn5y/Hs9+nf3gocGPx43j?=
 =?us-ascii?Q?rlErh6wT2GMsr6UXVLjigpQfm/gzJtHX7/2T/7Y7z3AcRpQAjTJUVrXHOfk2?=
 =?us-ascii?Q?WDvtTcxia/7dFcKQBYnC1pdew69EXs4CgbkWdRK1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a21d395e-c76d-4a42-db20-08dd3ae89ed3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 13:28:13.0227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3z9m2Y8jB51nFyozThohAaZgZsZcDE84lTuLYnsfEpleYA+B0jQZ5rZfn87+JsjQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9088
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

On Wed, Jan 22, 2025 at 12:04:19PM +0100, Simona Vetter wrote:

> I'm kinda leaning towards entirely separate dma-buf interfaces for the new
> phyr stuff, because I fear that adding that to the existing ones will only
> make the chaos worse. 

Lets see when some patches come up, if importers have to deal with
several formats a single attach interface would probably be simpler
for them..

> For the existing dma-buf importers/exporters I'm kinda hoping for a pure
> dma_addr_t based list eventually. 

IMHO the least churn would be to have the old importers call a helper
(perhaps implicitly in the core code) to convert phyr into a dma
mapped scatterlist and then just keep using their existing code
exactly as is.

Performance improvement would come from importers switching to use the
new dma api internally and avoiding the scatterlist allocation, but
even the extra alocation is not so bad.

Then, perhaps, and I really hesitate to say this, but perhaps to ease
the migration we could store a dma mapped list in a phyr using the
meta information. That would allow a dmabuf scatterlist exporter to be
converted to a phyr with a helper. The importer would have to have a
special path to detect the dma mapped mode and skip the normal
mapping.

The point would be to let maintained drivers use the new data
structures and flows easily and still interoperate with older
drivers. Otherwise we have to somehow build parallel scatterlist and
phyr code flows into importers :\

> Going all the way to a phyr based
> approach for everyone might be too much churn, there's some real bad cruft
> there. It's not going to work for every case, but it covers a lot of them
> and might be less pain for existing importers.

I'd hope we can reach every case.. But I don't know what kind of
horrors you guys have :)

> But in theory it should be possible to use phyr everywhere eventually, as
> long as there's no obviously api-rules-breaking way to go from a phyr back to
> a struct page even when that exists.

I'd say getting a struct page is a perfectly safe operation, from a
phyr API perspective.

The dmabuf issue seems to be entirely about following the locking
rules, an importer is not allowed to get a struct page and switch from
reservation locking to page refcount locking.

I get the appeal for DRM of blocking struct page use because that
directly prevents the above. But, in RDMA I want to re-use the same
phyr datastructure for tracking pin_user_pages() CPU memory, and I
must get the struct page back so I can put_user_page() it when done.

Perhaps we can find some compromise where the phyr data structure has
some kind of flag 'disable struct page' and then the
phyr_entry_to_page() API will WARN_ON() or something like that.

> > However, soon we will have encrypted P2P MMIO which will stress this
> > hiding strategy.
> 
> It's already breaking with stuff like virtual gpu drivers, vmwgfx is
> fiddling around with these bits (at least last I tried to understand this
> all) and I think a few others do too.

IMHO, most places I've seen touching this out side arch code feel very
hacky. :\

Jason
