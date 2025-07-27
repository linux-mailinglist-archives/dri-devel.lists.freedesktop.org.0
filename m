Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9403DB13158
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 20:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E2310E315;
	Sun, 27 Jul 2025 18:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kR6PRQ3A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B10A10E173
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 18:52:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ac2peP7Y73VOTm8lYSE8zoVD1Rxd9xNR29iDEQReUvm47OAIIGBz8Qed8kiOOne96IG1raGvgu4CSFeVdhvDxFx8X7rD1ZJPM1p0SBgFn0jTRW4wv5uK81Avm7XVRp4YgnlgjsuOD9uDGbwq9AJOxZBtVgdDc97szfbFMaVSI9q3S51GeYn0SP0F2b0tXPD+AaptHnebcHrvo3t6HYjtdxccwUs9ebXVG/97qK40Hs9zjve/6bow5r7ozzRNKNEFWS7Uyf8MbzzgV2kaZRymySb47KgJZ6WtzIWxQH4aRqJipEJrkWp1cjkbZM/34qqRnLh/+WY3bLBXG/1kps5kUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYZlVa7D8PnqlaXvAx9kQOv6iPL8lYuR+VcDBR6t4BI=;
 b=HIfXieoqCTA8ZHN+gLKRV2dyo2+UzzHw63/qRx9D7kkdG6UgMyx0O+9xXLQ8AZKOCSJYISUyokJq7R2S0Mow4ttfbHlMb3VMgFvmNiUi84mjMJY1tmoQiaqOO4womFrjjw57Eb/wIGhuT74n5Hoz4Yvy6BiIIQgycyW0wL5DBECL0Rq5GZDj1vYa/lwbYBOMO4mj2PCGHf4R3g2hor7gnjbsoToMiPnG+naZH7J3awhUfWY1lKObJ1iAaa2VqFN8r3fnGfc5m+d8sBCd/P7oAT4qmWJsM0qUVh/wDOOh6TFKeaI+CRLX2i7vRpFd69fnBeUQhTL4I2JBE2flvy1fWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYZlVa7D8PnqlaXvAx9kQOv6iPL8lYuR+VcDBR6t4BI=;
 b=kR6PRQ3A9T7ntMRiIqVIWI7p9QBoIXKMUhY9p325nf73Ycm9E/99/iDclcTphS4CWOss4U9OsNYeC4ygwR5OTcWjYu1XEAYdVXhIH89sYN8pqFi2NLj/J/szNtniZI9atRqzSus6SAVn/A7qhbFxsFBQXw6CMLMWtKZdj5ynVnCvEBYMWhIBbupRtQ3EwuI8z5Bt2kQyFMo9ov1yMt/uzsYCA2qTFnV4E7C9cqMHcOScPijA4eK/7rGhyOG5dHEHzx0DdCBpxf3e3Y4Yw2/C2iVvvw2UBhQb0WxeolWfL1sy3BBdZxzStoOHow9uXt/cdZbHEIPItbMNdy5zl7Iz8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DM4PR12MB6445.namprd12.prod.outlook.com (2603:10b6:8:bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Sun, 27 Jul
 2025 18:52:00 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8964.024; Sun, 27 Jul 2025
 18:51:59 +0000
Date: Sun, 27 Jul 2025 15:51:58 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Leon Romanovsky <leon@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 02/10] PCI/P2PDMA: Introduce p2pdma_provider structure
 for cleaner abstraction
Message-ID: <20250727185158.GE7551@nvidia.com>
References: <cover.1753274085.git.leonro@nvidia.com>
 <c2307cb4c3f1af46da138f3410738754691fbb3d.1753274085.git.leonro@nvidia.com>
 <20250724075145.GB30590@lst.de> <20250724075533.GR402218@unreal>
 <20250724075922.GD30590@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724075922.GD30590@lst.de>
X-ClientProxiedBy: YT4P288CA0024.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::25) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DM4PR12MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: f2ccb71b-944f-4b5d-43b9-08ddcd3eaaae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SVyc+xWY9UHrPpi8vgdGgKN8Q0aNcOttk+3Sb6tZHlHGrO8uatNB/AN+ZvxZ?=
 =?us-ascii?Q?FN3OaW7iG6Ge7iBFUFXvA8BMq8PNmkTcdlH2J5Jc/MzSEVAedPc9D+YMRb3M?=
 =?us-ascii?Q?PcxkaTPmaG8BQ0cd1vx1jB/CeXtgp3H2xrHaGgAKWfMg9cGY30EhtFJOkf1W?=
 =?us-ascii?Q?laQDW+kTdzvb4DVzDMt4kahLLJyHJ14Y256RExYSMP1BJfsJleX2XJWIEO4p?=
 =?us-ascii?Q?3PBBV7821TU0IhjXHDiDx6uf6q1F5Y4cUltpMVHPa9Zm88sMTFKxdSk/lDts?=
 =?us-ascii?Q?Qx5k+1kfbJEN+Vf0BGzg4Kj7HqeL0PkRg5f/E7rQI46R733oFcWJAyUVzaAu?=
 =?us-ascii?Q?h2VjkPW7RMiuoN4AYu84HA3/Lpwcdhrr7zfAKfh+AHFgccNRIWdcQkgdqbOW?=
 =?us-ascii?Q?FWtfkoJK9xzJgnt9MhMZWGZuUBKOLN6da+++73bnzuYr76jNl6Ya6pDjgSbP?=
 =?us-ascii?Q?yzCYY0ayn03c1gY/IhqnxPaGinFbUdduxd9kX6/l5nzqVFOl+m7znt1tIrcK?=
 =?us-ascii?Q?FCag6kYpqRVXgFefRVEnevmmHSBrAsbRQiutf1qIdi5pIB9tNNQkhp7DvVQV?=
 =?us-ascii?Q?IDwZ/98OWwHKZmXc2nTDGSo1yep/PEygt8LpPAKIVd7Gs7ovmx0iuVejXTQ3?=
 =?us-ascii?Q?86EX0pL2QHN/89W6J5E4TtrlA8Qnl74f/8cYypKVt/Y6uUCUAoorpsMCLrRa?=
 =?us-ascii?Q?JN9MqXRMH/MF5MlTFvMABbA4zHeirxZtd/qDUbsn5+w4mXsWXXut41r11wUt?=
 =?us-ascii?Q?AIkiVtxqFQt1HnnjWJq1kX9aOMIZA2af62n3IlNUZynhkyIv/AiwLP2aplR3?=
 =?us-ascii?Q?fr8OgSIqejHcdAK24P/Ro9LwtQbA/JZW3KrhkmevGUccFc1oOIRYtpM+ojj3?=
 =?us-ascii?Q?Ets2NfUH5ZbVAWbPjQph9j3bNVXjBGz9Okng8unB9Yj4TJ1pqwgcy7ud0n7V?=
 =?us-ascii?Q?F5StMOjsqri7hSVLvMF4rOlsCzbj4rI5bz9z4HqrB7oYH/WQk3kT3U3yBTWN?=
 =?us-ascii?Q?7sdX4GpqLlpIQibMLsCrT5T9wEKTEievHfv3o7vJyjfHOC5ATiIkTdVJrhUg?=
 =?us-ascii?Q?cF7laKvj39rQcGH8vBtjF6XhSYcjBqRtJr5bkRdA3H0sW56p5xmtUWELsv0M?=
 =?us-ascii?Q?pdb+p/6ocsQAX/oghPo8hHMaPh7JEJ2LrE+Puq6ILgo0FiUieBzw8qqeRuGJ?=
 =?us-ascii?Q?EZwMKRImc9W/NL0f8pEKOcsd+sbsm3IYStcTACslGlHtv3hhl3OEb9bQ3dzj?=
 =?us-ascii?Q?tWoHtYnQyJXm+wC3shTNf0wKclKZ52cx9qF46PuFWxKCTotEkb3ZNwYDPKUe?=
 =?us-ascii?Q?oiinn7s7r3WosTBqBZs2D1+rydXrZUOvwG88vKoY4zBJvhPPVhuEn49nwle0?=
 =?us-ascii?Q?ma2GQq+dsHQr7QWIKJWkeg65D09pRHmp4vzTPRXFZHphtEaozqsWl421/KZs?=
 =?us-ascii?Q?AmlNDQwcebk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?84BfwGefl3IGZA/vgfkEnUX5Wjswl/6XUdX8RHNPRHX+exh22SOleOZbSb3f?=
 =?us-ascii?Q?adsV7Z5BhT4RiG+SUHQVlXC7C/OTOUWZoFFX6gv/FtjFQu9Z3KDQeRxwOtHb?=
 =?us-ascii?Q?6G4khWK58hk8Hr4elLtsRhGP3VrMfsMHDKaedlj+W16C8UyexRbd8bFi3jvu?=
 =?us-ascii?Q?IcMh1td6Yn85N7rEDDFgrnl3mPnoWfJWxizQUnbdXTUwCu+IwwjrGCQNfXzS?=
 =?us-ascii?Q?KkIj4FwLvHAtsHPf3zd78xJY6MM3rIJoIqUcTYSbtfFdzCqo4s4b1jMm5Cvu?=
 =?us-ascii?Q?JfWnyx2voQ9cD3f7qGxh69dUGuAQqoCzTCCei8YyGe/imux4X4T2jEuKcACq?=
 =?us-ascii?Q?1IgEsdRm63uuKiOK46ZesXcdk/55ELmksdhhcE9hf6gMNDVOhk5ntrgLWjc+?=
 =?us-ascii?Q?8KZwqBTZmqiqmnUvTkbYgvsKgbDtjP/ny1wIa0Nt/V3RpEMc+/ouUwhWtIkt?=
 =?us-ascii?Q?5kcgeC+cNay/teu8Bwu2tkicG++XXdOuaSg61fxzATAw9JuPgipRWNXrp69J?=
 =?us-ascii?Q?vVMWO+iC3QLh9uoqMBSEMLL2hXmEsJ6RN4ObIZdn83tygwoOIMDm1tfN6oyf?=
 =?us-ascii?Q?VlnYf0dQDIf/qCqXeLRsMLaH8mihVgKrUxYYLJ/aprN+wXTDeaIzuVg3AFeK?=
 =?us-ascii?Q?bCJCiufqz8i3VbAwdj4woxFi7eEY13UU41k5edY9I447/xH7LalC+jE92fNe?=
 =?us-ascii?Q?vldDstAOC2BDdeN8Z7APYB0rjYZXzhQ51AyKYVBZB8TsTm9X+jwYr2C+gyia?=
 =?us-ascii?Q?UT5Xspw2o9uNzV67GMYBUlBRv8r21n03pW6e48AVj2UGBs5WB/BpWh7HNDfo?=
 =?us-ascii?Q?XO0b1lGoGApQCt42RreUW6xYjJEO/+91njJxKDvUSegv1QZukwxW6iqs/m0g?=
 =?us-ascii?Q?zyxp/M70pKacy8vU+6whrrSNMXsSu6dRXMI9NoCdmWSsY6HLAtYiTSPAH58z?=
 =?us-ascii?Q?DpWkkIoems2GkLIsWxNVCAvlnNHygXnQPZmp8A8A7/GXJN06APt7khxOD2yA?=
 =?us-ascii?Q?rzSdxfLvS+yd2psa1W84hR23gZLAC0EyFQGP9Z8pTep+oV7Cgp6bHmcR8Uc7?=
 =?us-ascii?Q?ISoM2FjmDOFVmayuS/bXjtQ57vVMt4g7i+vnK9RJw7Zf+A/SxcOcstg+inf8?=
 =?us-ascii?Q?TFfU98kEfjfwOXOjRgMos/D75QWj0hTBUi94v5bv0r2nr0eNDfRCEMNSt8RE?=
 =?us-ascii?Q?CbS10oehGeN0k4iGkpS+nSTw5IaWJCCta0MTPrzutr2/buu2C6FFqA3Gg5SQ?=
 =?us-ascii?Q?X5X7MsYDANQ1WDgwVroIvUlNIm08TL7v7Ph0+O0QrHTfznCv9hJbIsuYsDh3?=
 =?us-ascii?Q?S2PoINbiDUWv1K2b5Zv92HRM77lzjLG+WT8hmoveMpOJxIxZROKc30UMrqcs?=
 =?us-ascii?Q?Vr9AKvTXMIhCKfTRz7x11lncT+/RMaZ4d6yDzymgEsUVw7w8R7dWb0ZbTMsI?=
 =?us-ascii?Q?Te0wE67KPbXlWEfXbRnzLUl73wwP8SHZiGjr+QE1spU3E7cv3JAwAPflLAev?=
 =?us-ascii?Q?VkbpeSTp3v1DT9BbQd7Mvn+dk2ZxWLrp/3F9Bb9Lstuuo815xIWzbJPJ/ZN9?=
 =?us-ascii?Q?jhBsqjsLgWnD5ZooAxA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ccb71b-944f-4b5d-43b9-08ddcd3eaaae
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2025 18:51:59.5549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+aP69I2KaD/Yuo6JEylaARXBcZmtYozb1lfklLTyRix68g8B7z2hNfCNwpVq02k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6445
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

On Thu, Jul 24, 2025 at 09:59:22AM +0200, Christoph Hellwig wrote:
> On Thu, Jul 24, 2025 at 10:55:33AM +0300, Leon Romanovsky wrote:
> > Please, see last patch in the series https://lore.kernel.org/all/aea452cc27ca9e5169f7279d7b524190c39e7260.1753274085.git.leonro@nvidia.com
> > It gives me a way to call p2p code with stable pointer for whole BAR.
> > 
> 
> That simply can't work.

Why not?

That's the whole point of this, to remove struct page and use
something else as a handle for the p2p when doing the DMA API stuff.

The caller must make sure the lifetimes all work out. The handle must
live longer than any active DMAs, etc, etc. DMABUF with invalidation
lets vfio do that.

This is why the DMA api code was taught to use phys_addr_t and not
touch the struct page so it could work with struct-pageless memory.

The idea was to end up with two layers in the P2P code where the lower
layer only works on the handle, and then there is an optional struct
page/genalloc/etc layer for places that want struct page and mmap.

Jason
