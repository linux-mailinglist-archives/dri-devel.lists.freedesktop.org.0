Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD9D98BDD9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 15:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA9110E61E;
	Tue,  1 Oct 2024 13:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pqpUOwlB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD4810E61A;
 Tue,  1 Oct 2024 13:35:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCn7E5brprPMPJlY+rVwP+OQxyLb8Vqr/boV6EYuk/TNqvHpxGBr247uzi+zre52qEYqZjkb5lrQjRhlzn1VykTwKGgz1Bbq8lZ8jT3RJ+PLfVMk6nlmXu0AbIF9OwM0yV1aM7BrcFnEVVhA3rw4UQf3bdgoRbz2H3N4M7CP3bbZaZrsBxbPbvnJA0pPy2QTikCbiUn66P2A8ptBC8zXgid27hcTm69ddp1DJ6CNL52/UtCfJ7MsSoAZoqRKJeQITTIs1knsWCBgCFYEJn3B/U9PFRYa8diJu9Pibm7BLsTPR2tppDJERtN8MqyLsPaYfzbknLjOh9QsdcLjZWw6sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cb7L+Qv4DGYYD0ynApDR9xQXL2GMLEgZeRFS6KDH5Js=;
 b=tYowGm2cJprI9Wrhf8N/1pkkGMY7rt7MzqOJtdqAkhSkPGAO+QBgVjw5p/RNcIQVA2zmhXujTMKwB6qfUu4PNbwjgngUKtqZxg5kcg797t5Hgbw15lH3Ispa+3A+zso4qD+EsviB55vqQBIY7OgI1/4gytdKM2kTtZJUh3bnBzQ13pn7jaZRQlFumnHuPfN5RyZcng8NfixW1HFRkHSgsO+BhTA4fLGKrxAINrnHCofIihT6A9y4EOO9av4exREMYASkLH3MAOPfg4Lt0m1iUMvNuEDvDSlxzs5odWZEx2yw8wa43jOS6wEDdmn5CkzNVsyYZBLm6gDJ7ah0Ss3HLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cb7L+Qv4DGYYD0ynApDR9xQXL2GMLEgZeRFS6KDH5Js=;
 b=pqpUOwlB+KJCPiFp3fCOdfZekaayyg900xs4bwnmak8+C4Qq98LraWUP3FUUXXOVYeeD9sGKnJ9zLQLS5BUCpmTTS++MwaylV45CdEM12lBUWjBZ/9n7Y2J1Tokknh6/LNsyjrr/GycqfkXv1a4WaoWUsfV57lC2+fKnRaxtPdy08K0NJp6tDqyI/WUaq0Xfk5GPOOVKsGG+yPvQfUDdnIPWhMabX66zK79Ej7AprnzjLqbxw8OcvxWdl6V4tHzuGvWTD8XhAxxT4K9U+4NjStfy7x3xhytK5zkwTA2EjXnXH1XIiGxpFswXwXEw6Hi5KE6iSwNwNU9tNBq9KHa8GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Tue, 1 Oct
 2024 13:35:09 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 13:35:09 +0000
Date: Tue, 1 Oct 2024 10:35:08 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lu Baolu <baolu.lu@linux.intel.com>, Karol Herbst <kherbst@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sandy Huang <hjc@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm/nouveau/tegra: Use iommu_paging_domain_alloc()
Message-ID: <20241001133508.GA1867007@nvidia.com>
References: <20240902014700.66095-1-baolu.lu@linux.intel.com>
 <20240902014700.66095-2-baolu.lu@linux.intel.com>
 <a43c31da6a6989874eb0998dc937d7a611ec542c.camel@redhat.com>
 <20240905132459.GG1909087@ziepe.ca>
 <243808ad949823a0d64cd785ed05a375ccdba096.camel@redhat.com>
 <20240915140806.GE869260@ziepe.ca>
 <eaed20244ced28e17795532967ab444a22c509c2.camel@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eaed20244ced28e17795532967ab444a22c509c2.camel@redhat.com>
X-ClientProxiedBy: BL1PR13CA0256.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::21) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA1PR12MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: acfed832-8a8b-4c4e-e4cc-08dce21dde64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s5/i21SUVZ/xAGd2CwRkzU+1xtLOJmlha6y16D4PRQLbFHWZR2vJuGa6s3V5?=
 =?us-ascii?Q?WNFTLzKOct8fLGeFe7AH+PMhABVRFo/Is4P5t8XWT5SBk5NI72on3mzHSeJM?=
 =?us-ascii?Q?9zln5em09rwyWQ+T7R2GsupVBb191nC4p3M2gZjVRCaTJSpnTxYFs0S6xs/h?=
 =?us-ascii?Q?tUK/3fVHqk2A5+oEH2RUJLl6vmGmgMt8AMb38bs0f5b2G5nHUIMiF2K5zPYz?=
 =?us-ascii?Q?04UlI0xDtRitK6tHJZ5IC8uEtyabxM79wi79sLEghCln65JuXBwlx0oAIiDG?=
 =?us-ascii?Q?O2lDY6qAbdfwg3GCacnqOP5pawfi7Xb0ld3PZc0ujnM/uizUOhwfydZpiuwe?=
 =?us-ascii?Q?gNy5Ruowci6KYKqh93yQQ31IXPud3lSZ+G5U6ZxxvdMPPWw7XyPjR9lX3IhM?=
 =?us-ascii?Q?wtj1QYKlH1wBiSCVhoRWuqi5yHRi36a8GloAloS6Yq2rDb68ERFsfboioo3o?=
 =?us-ascii?Q?Nje2iecp/IR3C5uEHz/C2tgK/PP50i4hXVAD4AeQbrwvqWioqPdeXkql0o9a?=
 =?us-ascii?Q?c+NLKNN3xGg4cwZJ/EmNJtrv7i7PAJW92fmJkPOvigihSd0gI7nhRXIKe74F?=
 =?us-ascii?Q?pObM6wIQR3Xm/BsPtvqgeQApdGyHuPjVjN7LcnwGhd7GTe4aS4bvK4t0G386?=
 =?us-ascii?Q?3Pfx31BVvevLRV6F5qY5yapwVTW5MkWNRYk7tX9OQJtzHeQNA8CXCvxpXtav?=
 =?us-ascii?Q?sbvBnwXdXXeWx+mg+aIjTP3D22GZmagQwksnv36D1Wz7uI/Dz3Erufv4r5aA?=
 =?us-ascii?Q?Hay997jMxmVxZA/4ZJg9gq0eT5rEokurlGewwH254relZtmrpt90Rm1ojhsM?=
 =?us-ascii?Q?XdLUqVHYB/BXrLJ6TBrn3mrCqU1cAEQqylngVGRNUlhpr4Pw9IpuB0bgtMH8?=
 =?us-ascii?Q?p8CTem4ZF6c3QWkIJbM+p3RJ0mLgL7hXTSSWbMzwTz60Ytjbjc/Btyl98faN?=
 =?us-ascii?Q?MouJFY+L3OyO8Lbx3ZP/wadDpkmjB3Kvygy37EXy9r1G65Ky8XFFBdhW9K+c?=
 =?us-ascii?Q?SIuxnltQCcaSREHp2KHmsksCQYt50OZo3Qny+4cCy80fkmFT1YLJwP88HWKB?=
 =?us-ascii?Q?Sg+6zO+E3TMEk4/3m241ysQYCRj1vB/ZFgcYWmxXiCGeA6ht7KdIrgDpEuvy?=
 =?us-ascii?Q?3NtINVXVNzLbId5/0+2TutDB4cUiON1ljr4w+46cx5u+GyVg2oEDIeSPeCGp?=
 =?us-ascii?Q?K+hb3yisIkXZHFe0b6ZZK5UeWJXolH4UR33CQoWKbSJDBEoDRCXJG80Ua3n0?=
 =?us-ascii?Q?DAC7AMI9SIlZv9K6+k/9DiYr0RN6mrNXzMyOfp2RZebm4lUeuvMnaHmLm+3m?=
 =?us-ascii?Q?mcVeDUgilEw4BBd6qG0kXQ0AV0x9WxruoTl22xkNVvl+nw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DRB4aO7Vt88e638aA6yqb3SdzbY6SJkPh2n6eXVrcECdrWGa5UjDCxX6obBo?=
 =?us-ascii?Q?JpSOJ2RzLTDgzz5eJkrj/aKv4nqyqo2pGA/k1RuFBa9Pkm8dWLd3FRAl6GYs?=
 =?us-ascii?Q?/Da5GeS1QXxg+j2WQVw1DFPreyub0J5u8W24WbL89Vv3vf/H0Q3NderYy95G?=
 =?us-ascii?Q?tLdexf31ylopOvy2rA5ATabUUp+DlcmKHP34LMs/qLbRr7X8n/jW4iaHpipy?=
 =?us-ascii?Q?WdLUaUN6VEliW/A5x+CoO4qfLgMNkazlCDPZC0eJuldt4oViA8GpFCkrti/W?=
 =?us-ascii?Q?uAMu8UK2EPlG7y3e4tqLSqHDk+VE2mY8XgI7eDGZNrtFikJH68LHL3U6yfh7?=
 =?us-ascii?Q?YGWn6ZmKzhcBX3AMvZEsn6RZwjoB48w8a2t2qGBo04cDGujyit4Tnu5BP1fa?=
 =?us-ascii?Q?fiz8Zt4NRrlFB9Nd+y1PnnU1tPFQ4zK0rd6Zt7BD1gcd+M6oI7BiWuvL1PGh?=
 =?us-ascii?Q?yhUPcmYJAm66xgYubgxtZLBhFpC3gPFnhaOOlT/9HOosMELd6kaKdko6GKLH?=
 =?us-ascii?Q?b5fYoSVynKRDKPkOmDS4b0D2CViZx2+DWXHfR3i+pgIvWwnKbkQqfeFQI5x9?=
 =?us-ascii?Q?3OqHev7oIlbnM87GBTO3ypW36pFIdX7l0ZFUSg26yvwR7MsdsO553tmymDlZ?=
 =?us-ascii?Q?r4RlYHkAT4JDwdwEvtZD5NzGMlyFaeH3XW+d4pKoJHpdYHmjTEF8Zzl4vR/g?=
 =?us-ascii?Q?JIh0kW31jxC/PjTxEPdmQ8FjFH4e07lRGq9Ma0nCbr5zZzQ7yog+e+AF/dtQ?=
 =?us-ascii?Q?fmP47aigxxoPNh/N59WlWvqCacdV5E0K62/qD8pWstsP2+Hep2s0Fs0M0QOU?=
 =?us-ascii?Q?hL5kaKaHqEcqqy6O5a8Od6wzyMBesxx5DkdjYGnhksAhtPgTjT2L8C4m1Cn0?=
 =?us-ascii?Q?XLohtOM7j+KRSz/VhieYrZvoLgMdJcFaRelpCcAxD7jmXHDGSkKqnto0GfmC?=
 =?us-ascii?Q?rByqDN3l3lSf6s/NSt/P6D4HIoQdVezw0AZkSPn5UujFV5CqV6TdNUoauLJK?=
 =?us-ascii?Q?z04jfn15xhe55AAZYmoXa2hf9j0c9bFjL+6vq5T7s9EriaaS1Y7RNzREFB8+?=
 =?us-ascii?Q?4N2zroDF3uUViZ+cv+kdb/906ydo4Ym48oyNvfA1hroYMLPbQAmIzhSg7lNz?=
 =?us-ascii?Q?CXYspATMkjKU0O+bv7hAU8Ve4Y14KBJyIfUmoQ2PGciuHM8+1h6In4JEqJo2?=
 =?us-ascii?Q?O49YN0Cex3YqzQYPPAjw/n/GLNAws4OXYZLES6GJHkjICU3DuendsJMGk2K8?=
 =?us-ascii?Q?EMJoiK79nYZbPtVU1S3psdV+MQ5fGQfiLcLeT1OT4Aws1/8P81nZC0FbNqKB?=
 =?us-ascii?Q?aqgmPL/svqPf4YbsiPJ8bkZ57egmztEAMyvgoVTzz2xZKZUVJvHo1IRNK8fH?=
 =?us-ascii?Q?abZ7XJKKsAOXn0nn8IJjKxgM3K3BrZS6HUDxR7X7ii8XNqaBnBuA3KzQMQ/d?=
 =?us-ascii?Q?mulwJnZ6t4jIu5DmtH6AvZU6MiWEdcWLwSCX92zp63rtlQxK2Vbll0yvbaO7?=
 =?us-ascii?Q?hTx/o4Eh/d0h+jhD2O6Ny8+vQvgMhmSRMpADrNwCyUHGFVu+sARIF+Wp/FLz?=
 =?us-ascii?Q?Ck2OnNiih30xZRAlQas=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acfed832-8a8b-4c4e-e4cc-08dce21dde64
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 13:35:09.4643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: haSYGZMrnC6iQtjVUQC3cCCnN/eMPwD+6hErfMJDCLZHE6+qwEjARxlEp8SXtnsh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6870
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

On Mon, Sep 16, 2024 at 04:42:33PM -0400, Lyude Paul wrote:
> Sigh. Took me a minute but I think I know what happened - I meant to push the
> entire series to drm-misc-next and not drm-misc-fixes, but I must have misread
> or typo'd the branch name and pushed the second half of patches to drm-misc-
> fixes by mistake. So the nouveau commit is present in drm-misc-next, but
> presumably drm-misc-fixes got pulled first.
> 
> Sorry about that - I have no idea how I managed that mistake.

Three didn't make it to rc1, including this one:

drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c:             tdev->iommu.domain = iommu_domain_alloc(&platform_bus_type>
drivers/media/platform/nvidia/tegra-vde/iommu.c:        vde->domain = iommu_domain_alloc(&platform_bus_type);
drivers/remoteproc/remoteproc_core.c:   domain = iommu_domain_alloc(dev->bus);

I prefer we send these through the iommu tree now so we can make
progress.

Jason
