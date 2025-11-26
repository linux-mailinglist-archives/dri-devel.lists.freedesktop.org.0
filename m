Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB472C8B130
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 17:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A873310E697;
	Wed, 26 Nov 2025 16:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MZY4AyZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013041.outbound.protection.outlook.com
 [40.93.196.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D1E10E697
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 16:54:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANwyrfTbxgoTDTn6t6ZqtURLtFKqlbkfViH/1iLtXohtHXF9XO+zzvPl0v25juh8kCOITltiFcxTY4UYVPVDjAwbUNPHbESX88wDv5JlFG5Tpb0h7wW3gE05lQNkr+Wpz+zYlbCiFtv73mMHPwgW64dJ/gJbsLx9WVuY1+h/1++r2fI1YdkhBZtXTMiJwDeLdnCY5cMX0DPirYYui28uIukjiXEeL6Vcz3It8Uzn1Ms+xUGVKHgzP5Mjde6YTazwrw6vExy4BpMk9JYJJ9qjjoNd/aRRmgoKCRPKXPPiSZpfqxsboYNnC29bLWwFlP8hOgMyL21i15s2OyA7GTiGlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxZEkH5e2YVADb/xtty+0fsMHBrfT0hSD/MS5Fnx1KY=;
 b=RAYzlTNwmf5GUkLl6nd/Sqr4QuOkjHIHtgPftkfuHG6zhYnJG10yAwCSRIFoFYYCV69ttUV3tJOvL6AVWu7XQZqAT+2ErD/Xy3EVhfoNiRB4cV1Tsxrldikzxrsr/mEhW+XqVeXWSp/pDUNKN5EQ/C9xJYPn75VMasv8fgLvv0K5VJ//8aTeONm16dkD9pQovMmSJkR45MW2hG4wa8FY38I0FWbZH/aIvtGoKL2hIHseCK5TCvMcJqiBnyuOHD2AqKTfToG9Tl7QmjevPr5Mi6UN5tk/EBtm/mCLaydBBRC7iJEsNsKjZwopAoSJUZ4p5iz8W3164gJrvqW7nYjJ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxZEkH5e2YVADb/xtty+0fsMHBrfT0hSD/MS5Fnx1KY=;
 b=MZY4AyZvTpHNfT6rXopKbGuGRhcg1qGyb20ANGEJaWHR8ptiY+l9JLjCjLC3zFT7DiEP3nw6zKJDg9NoFPLB7prjGFzkERFb6TW5r+eZjP8Om+EWELMhsdXMIROunPHe57ugrdTFc2UggtJFOyZ6n6sH+Cg4tktkxPp4P4/Y4lo0nNlhsLjuikYxl1e3o5JLMfcGOV3YQBnXmpnteK8mpcXsMq/CUdEJfz8M4ws+VC9IXf256WwoV56D5zVpKmdiAi1LTv8zoStvehOQc07owflPYTFqvER3P4dA0ckd6uqQN4hudis5HZYj/bJ2PzCVHA+R0/nyVujiwSPk1RzpYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by DS7PR12MB6046.namprd12.prod.outlook.com (2603:10b6:8:85::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 16:54:54 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9343.009; Wed, 26 Nov 2025
 16:54:53 +0000
Date: Wed, 26 Nov 2025 12:54:53 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Mastro <amastro@fb.com>
Cc: Pranjal Shrivastava <praan@google.com>, Leon Romanovsky <leon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org, Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH v9 06/11] dma-buf: provide phys_vec to scatter-gather
 mapping routine
Message-ID: <20251126165453.GJ520526@nvidia.com>
References: <20251120-dmabuf-vfio-v9-0-d7f71607f371@nvidia.com>
 <20251120-dmabuf-vfio-v9-6-d7f71607f371@nvidia.com>
 <aSZHO6otK0Heh+Qj@devgpu015.cco6.facebook.com>
 <aSb8yH6fSlwk1oZZ@google.com>
 <aScl+LCPN2TiN7Pd@devgpu015.cco6.facebook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aScl+LCPN2TiN7Pd@devgpu015.cco6.facebook.com>
X-ClientProxiedBy: BL1PR13CA0399.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::14) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|DS7PR12MB6046:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff12cb8-cfa7-461d-43c2-08de2d0c8584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b8rfNG3d6XXMf9rzORqAtbEuW99wCf87baKMReiYdns6w9nI15hAEOqfGutl?=
 =?us-ascii?Q?GwA+crP2tY78qaUAWmztk33u0E3Tne8RKF6TuK6SjLLdIBy6s5v3ew6/+AsF?=
 =?us-ascii?Q?OHQaYTGWbsYB/l55aiBdcwetnp0bAi9F+kcDH5944mdc3oa7CP2pPJ81STEy?=
 =?us-ascii?Q?kNPGDjQP+UsmLaUiHsTj9X9Dfi0q5EXEyoVSOrsiUZ7t8peCLRN22vuH372m?=
 =?us-ascii?Q?DZner46KuFMLJWhxIbuPfzvUulemNRhiEa5sL49+I2HnjtDHL/7NiMxMma56?=
 =?us-ascii?Q?a2yItfWhRIB+UAOTfjPlhIqafgigpfvrEkk4AbCY60sZNegOT1iJaU+Lygc7?=
 =?us-ascii?Q?+3j7+hfMTF9W3ZwR0hBBgyiSkhUfkrbnserFPNe208gREV51NhMm36Yhhx+y?=
 =?us-ascii?Q?7O8M0gBz8MI8/P3/eTmQ0OYz26O1TLANCXoS5gK7+XFsuaGpITO7hpYmlYuz?=
 =?us-ascii?Q?9o5FQ2UIgdQeMMECcOM0a/akF4nI659Oasgx7OR+nCe8S+5PIPvONH4tPdD2?=
 =?us-ascii?Q?KM0IwROM6RPKEHgM/tOtd9ZRY+NHIciljPBJ2k8qzslfQaXUbD0bbY/jcNIi?=
 =?us-ascii?Q?Hr20zS/3QFmrfbt/HaaVQ3SBGEgsqy/32GNhlv2oissmIdu768gUG9emgSv0?=
 =?us-ascii?Q?8h8Q9EVLIP5lfxCrgLD0yqNKENxktpGEorW2RNdvOhmb9Xb8S+hiA6HvhMp3?=
 =?us-ascii?Q?Iy9c2U9bsd3araoi4qwwioUDWi8wJ5dHfS/LEzEh2XS2RYawb0JVt+SZxRN0?=
 =?us-ascii?Q?un7/57bh/JMNhEbdb+sCpXeGbGZcRBwqCTQL+Dh+trLzL3A8P6lEesvmq16z?=
 =?us-ascii?Q?zxXWb+fY4DEaLSyC9d0FKC2KL+MvM3DMbY5QJsElv2WQIk76/7x6Elri2ZFf?=
 =?us-ascii?Q?ZAgLrjD50uTehbF6Klls53N9yrpxjlGyUdOXsrSS4jrkXZRv8NUa5UnB72e8?=
 =?us-ascii?Q?qfo6IBULw85pJFgO9RiU1mNN8yTsecysRU+qe3tY7XF0RM3fToUQWvC8xEnq?=
 =?us-ascii?Q?ho97WCD5KH37KHqw6Pn6B6jR71uUjwX+SGNK7hbRrb7E6DVkkFJhsUG9VH2h?=
 =?us-ascii?Q?DkGWM0boLCIK2jC/Lckjfq2x1Fe9Ea7QVMcizMPg1j8j0c5EvpGRDsGqpUhD?=
 =?us-ascii?Q?KT01lVv3LhBOsAlqxP72BG0QKGPNCH14acJSU4Nn/Yyx2FNokboSnFvUGfuR?=
 =?us-ascii?Q?t4Xv65TDj5rcYzi0tjU+bbND8JzqvlNgF9/y7j5NTXjr8dry06JLYBTlLE1s?=
 =?us-ascii?Q?EeLHZhy+Hv666HjpRwSNyR0l3qtHMM+1hEj0y2ocqTVr2bTZV2FanMMKTJqF?=
 =?us-ascii?Q?sbNCxJmz2xb2ABaxQD9Zc4HcgbEWv1oOSxGfTV2y/Orijt9msQ4X0RiJ/WJ9?=
 =?us-ascii?Q?Hb78/tx0Ub7xpBT1cKcet0MafeT8KyAVtPlzHfoB50Ntx9IgVJH5gc82iP3F?=
 =?us-ascii?Q?nhLIBr+X2JFbxTjHwGqK2B6eLD1hcbOm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rr8/UggYXFoFXLH6yEBfemvBdigD6gjrHpj6l0/muxh/bDF9QDLG7Eox1fon?=
 =?us-ascii?Q?MWI2n5bEKDU3I8owz1yRQLWnNz9CB5yAHUbqU2PKiY7kC+VmsNR3kijP2TVI?=
 =?us-ascii?Q?/UXumx64nqN1h3VoO1yKLXeqaJKwQGwGWOiPAZL1pNryM8zUbLLiqXMHowT3?=
 =?us-ascii?Q?Hvb5b3HLKGFBoel7lT1v42zZuxJXIVdKXCPIWEcbinmk51lQ3KbTRTHAZTM0?=
 =?us-ascii?Q?kQQWbwgsLddcqN53QD+nNTXbil4nxDJEMffgCUQs+zFPO5l8kvAKRXW3Qu8U?=
 =?us-ascii?Q?dSTV4BPuwv33vqUuzH9vaOgRO9RHTh9T5Y803/gRFWMk/ui1shqBlZ4SEMfZ?=
 =?us-ascii?Q?bKMSTdtR4UDMDE/am3m+ot/eI9VKQ+k8l6Ww+p5gaIwntFAksAn4yjrfr4Pk?=
 =?us-ascii?Q?TqqmuGSB5HvvfcbMs0nB5kFnwaqUh46+BJoL6MqBUr5m0LbmYcbhy8/ZLfss?=
 =?us-ascii?Q?lHPT7Ow//qNK4JgAgKnxFiRtNhujYDSKa2pS7rZz0uCQ87tFQP+zgbfrlaMy?=
 =?us-ascii?Q?DxhJg9ZLsZHg1dElHg5OKrlU8xlHA6tyUAgOdESngs2dl8qHh7NeHA3H+g6s?=
 =?us-ascii?Q?qVDDmFUBcyxI/VFKjf65ttKgpJcCigDYLF6rKBA27YELdymqzXIXYgar8sXj?=
 =?us-ascii?Q?mw8MheK0uxobw2uQwp/OcfhtSha6dB5D4DS/6iLEJBoyP0iGmiCoEuyHztio?=
 =?us-ascii?Q?VxxN3Aq3AA9Ghyi/VZzTiNPQBCxLj6bXgQz1IC7yc6bTofh1OGXsXeF2anS5?=
 =?us-ascii?Q?McXKDIsnkvDBabHHfsZ/isS4t6+QI1AGO3th0rHYM1kZ6zQuGfd+j9rgLinU?=
 =?us-ascii?Q?ETh7J84liJcB21ZbbqNNvC0sVTll6SsX1Xt1oQr2ik+4e6j1Rgz9kx41AWlS?=
 =?us-ascii?Q?4S6YyrKf87Zc5DsUbZLrSKL5/4AjC65OB+7arzM7L3RUm19awUzIsquK3HUd?=
 =?us-ascii?Q?NL+qt9k36dusrhKpD42IrWcqWsavSsw6ZaNshrWIgvff4YL0B9Wv/i4VkoRd?=
 =?us-ascii?Q?a8B4drYr0lG3yXn+puYFc9ZyCoOulFTj0S0wOPMzlhmJoHZGIkmDDxfH0LyK?=
 =?us-ascii?Q?ic6FLXAtDpb0jMrttMk4GgGDGaACDnj996YAKFx5yWrTmpvShBzGDYjVwYWB?=
 =?us-ascii?Q?opKDqMLnQbdomSAyuD5ms2Rw3eaifysuyhGjYRV6ScWjS8HSB59U2qm6wO6C?=
 =?us-ascii?Q?8GhF4cuaE4ouxAnSvgPviMEI4ZJ7gwsHXMGcn6c7Z79FsTv9xnKiQ1/Jm31m?=
 =?us-ascii?Q?jrBVOld83YVu89xcqMIxap19tLnC97GH1/YHYPIXY78iwC1+nUF/25T3T64N?=
 =?us-ascii?Q?AZ3b6lCliKQUDXxjaZ96rmKarcMJK/SmQPWlNde8U2vpfsSe81iM8wNJifG5?=
 =?us-ascii?Q?DBpAjg7MZKGuX6nVm8Ic1+D2P/HdkpMTDHnt/yJVSR56gxykmfyx7ZDfTVKZ?=
 =?us-ascii?Q?zdZxVBQ1mwMZxL1wEDG5UNwfEig2a80XSFLGkZSkxIxRMKEBjsJSbJoDyfNs?=
 =?us-ascii?Q?9J7Xaqw11T6Dcwt+zL03AOsZLG/LNJhVNDfzfDG9BXlYJQlJOBXCaFBBBRGE?=
 =?us-ascii?Q?nTd+61lGY2kln3WycCs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff12cb8-cfa7-461d-43c2-08de2d0c8584
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:54:53.8261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/NLpBmrNNvioecHTBoir7ABAKXX8pH0Xx7Ti8jplfDNwnzvTkUxfFFNlu6zyfIr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6046
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

On Wed, Nov 26, 2025 at 08:08:24AM -0800, Alex Mastro wrote:
> On Wed, Nov 26, 2025 at 01:12:40PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Nov 25, 2025 at 04:18:03PM -0800, Alex Mastro wrote:
> > > On Thu, Nov 20, 2025 at 11:28:25AM +0200, Leon Romanovsky wrote:
> > > > +static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
> > > > +					 dma_addr_t addr)
> > > > +{
> > > > +	unsigned int len, nents;
> > > > +	int i;
> > > > +
> > > > +	nents = DIV_ROUND_UP(length, UINT_MAX);
> > > > +	for (i = 0; i < nents; i++) {
> > > > +		len = min_t(size_t, length, UINT_MAX);
> > > > +		length -= len;
> > > > +		/*
> > > > +		 * DMABUF abuses scatterlist to create a scatterlist
> > > > +		 * that does not have any CPU list, only the DMA list.
> > > > +		 * Always set the page related values to NULL to ensure
> > > > +		 * importers can't use it. The phys_addr based DMA API
> > > > +		 * does not require the CPU list for mapping or unmapping.
> > > > +		 */
> > > > +		sg_set_page(sgl, NULL, 0, 0);
> > > > +		sg_dma_address(sgl) = addr + i * UINT_MAX;
> > > 
> > > (i * UINT_MAX) happens in 32-bit before being promoted to dma_addr_t for
> > > addition with addr. Overflows for i >=2 when length >= 8 GiB. Needs a cast:
> > > 
> > > 		sg_dma_address(sgl) = addr + (dma_addr_t)i * UINT_MAX;

Yeah, and i should not be signed.

> > > Discovered this while debugging why dma-buf import was failing for
> > > an 8 GiB dma-buf using my earlier toy program [1]. It was surfaced by
> > > ib_umem_find_best_pgsz() returning 0 due to malformed scatterlist, which bubbles
> > > up as an EINVAL.
> > >
> > 
> > Thanks a lot for testing & reporting this!
> > 
> > However, I believe the casting approach is a little fragile (and
> > potentially prone to issues depending on how dma_addr_t is sized on
> > different platforms). Thus, approaching this with accumulation seems
> > better as it avoids the multiplication logic entirely, maybe something
> > like the following (untested) diff ?
> 
> If the function input range is well-formed, then all values in
> [addr..addr+length) must be expressible by dma_addr_t, so I don't think overflow
> after casting is possible as long as nents is valid.

It is probably not perfect, but validate_dmabuf_input() limits length
to a valid size_t

The signature is:

bool dma_iova_try_alloc(struct device *dev, struct dma_iova_state *state,
		phys_addr_t phys, size_t size)

And that function should fail if size is too large. I think it mostly
does, but it looks like there are a few little misses:

			iova_align(iovad, size + iova_off),
	return ALIGN(size, iovad->granule);

etc are all unchecked math that could overflow.

> That said, `nents = DIV_ROUND_UP(length, UINT_MAX)` is simply broken on any
> system where size_t is 32b. I don't know if that's a practical consideration for
> these code paths though.

Yeah, that's a good point.

Casting to u64 will trigger 64 bit device errors on 32 bit too.

// DIV_ROUND_UP that is safe at the type limits
nents = size / UINT_MAX;
if (size % UINT_MAX)
   nents++;

Compiler should turn the % into bit math.

Jason
