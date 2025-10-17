Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A149BE87A8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 13:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A1B10EBC7;
	Fri, 17 Oct 2025 11:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VXhdKugO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010044.outbound.protection.outlook.com [52.101.85.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA30610EBC7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 11:55:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oa+65+KY5htx5BInWyP/BPZzPKyiPiK+AHeoshTrfE7gxvWg/1qPQX9O55pMgbsnH9OLGPJk/rT9g/uErheo/BdQiRtHn1NBNaUDN8/SR4MF+IMQFjn8uXztMsCp6cxRIYNSpBf6VGRuMKBeQZ2NOHxSJoHGtDmpwrT/ErNe+iqCfCL6bDkVBl2R9pMxkHnRiXUq36LS6FO3v9KDk9wKtdpvRznabvIaIKo0lFjdMwe/UVt9CHtl5XV/8TgGbfD+RHy+BW/sZ6mvxe46+TLrwDA1xvOpiUP4L7hOCaRxIZPUU8OskxC3/R3q4+AZJgomYdYKVoKLkeLJBwUoUguazQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K74F9KGlgPlbL6DMmMBJ5agyEfEeQoSW0boygtkOuXE=;
 b=ckWorcjHpV57VdN5JMinqHVnqJOqZbjz/WNvzNNeEsAyLK/NpMqGm7D2BdbQFPKWChwmK66At07SK/NRUn7uRdzRqdHm3zTyPuQZex4AzvI3HTCJkVdeF3dDEW1hrR34BPs3Rv31pVredYL5+spFXtHiEbGXzIfcqOgGJGyi8uk3o8/TlpoM/4NIOCbif8Nyfc98WqcMkoc25PT/EPV8p43++NExF76FEo/eWdHkoQcGAqoQSNt/D+AFROOd3+Nkj3nelsoLaAUP8x+6Jdfww6Hl2FxcA+6fzLDd7BcHXgA9nRCR44U/aBqnqOyt0sRoYIgyWpxP8A/f7v5aff0kTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K74F9KGlgPlbL6DMmMBJ5agyEfEeQoSW0boygtkOuXE=;
 b=VXhdKugOGK49/nJxhfFvDNWdU2lUPUubcDePQlFjI+9uzFE62XjWkyK1RJvO4/Yf7LmvfXKH0qcFsclyjkf1UF3pKzXWFmWpouQmneb2tt3YTwWRkPIoqxa0wgmO5RKH75WlR4sWWeOM/mCRESQB+suDguRCajSQZxs6AUsxs0Pq/Ph6ai045Rq4tYqmORJG6rc1KUEjnbL6r1jWaXzDh67rnI/wl0x87ILYUYuEx5C5hCKEOtkNU/ur2wnI5+5h4jAa5OEG8wkGQq5U9HJIJpq9K74kCdsSAQI+SUMixMRYIEhgTJE4h4L4cEZLovvjyaQbBOOqbhvEorqLFsXxEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by PH8PR12MB6938.namprd12.prod.outlook.com (2603:10b6:510:1bd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Fri, 17 Oct
 2025 11:55:29 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 11:55:26 +0000
Date: Fri, 17 Oct 2025 08:55:24 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Leon Romanovsky <leon@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 8/9] vfio/pci: Enable peer-to-peer DMA transactions by
 default
Message-ID: <20251017115524.GG3901471@nvidia.com>
References: <cover.1760368250.git.leon@kernel.org>
 <a04c44aa4625a6edfadaf9c9e2c2afb460ad1857.1760368250.git.leon@kernel.org>
 <aPHjG2PS5DVgcG93@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPHjG2PS5DVgcG93@infradead.org>
X-ClientProxiedBy: SA0PR12CA0012.namprd12.prod.outlook.com
 (2603:10b6:806:6f::17) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|PH8PR12MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: 94c7a0aa-69f3-493a-297c-08de0d740f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Lk/JeJcORYBGeY9FyxwzDVo4VFIdFcb8dcteg0duQXkoW+a69ou4kyJZVzv9?=
 =?us-ascii?Q?7FKGl0ujRlOkGQClqet6FTmUlnOVMPCwReDyAA/PFhIk3wzOlucYw6sg5few?=
 =?us-ascii?Q?r3ASUeBbucsM6iCZr/3MvlSWdVV0qsiCyXAyNpnQ0m+5mEVhGzXvtlDWYmRI?=
 =?us-ascii?Q?kT38bne2gJ+mB2ych35ZsoC7RTFHeL/qF8vc2YfuGh25hpZMA2NrPe3TgVbQ?=
 =?us-ascii?Q?AevIGB1UbFpxcRAYNlhtRyqTVKHuuCfTmm3nZ7w749vy+rSnATQ5TqnN+aue?=
 =?us-ascii?Q?f6A2wD4/VJmxJpQgj0t0BlxWxLHThHeZNizqoPBV5m6y4iiHtf/Bxtk1Qv7A?=
 =?us-ascii?Q?Jy1rX1VFnCvvMMjgjxzoWKuqeKzMc8AfDAZveNZksX0VcCd9DSMfkLnHTxtC?=
 =?us-ascii?Q?4V93w4FBFn3EcimrRWUoQ8s+39EIj73nR0kKDP5HajO7AAF3qnrhSPlyKgQF?=
 =?us-ascii?Q?deAVIvF9BZETezFE5sKYEETeY1atUBxyecFtfuYMW5WxbjIbPAPUc5QCqp2y?=
 =?us-ascii?Q?J3U1XykK/idrjkwCeYrw++OYZ3Z1Mzrt7R1/f1L2DRC2TnuCaQjEL844RGAI?=
 =?us-ascii?Q?6/G/PGGcenE7aS1g5CFtSPyIttCWumVfP8fW73HdqH8WpzR4wSZmdJDF3AxP?=
 =?us-ascii?Q?dhIqtp9l1+7vEFo73yQQpbMZfUwtpvEYujRU/F9a058zfKdCHeQaynJcv1Ww?=
 =?us-ascii?Q?VTVbLN36LCseflqtEVfmqsZ6Juben+9NlJQnIzlA1hq4qcUOCf+ij9BfJgrY?=
 =?us-ascii?Q?jaI+SstNdmN+11hlu7peHidfF2koIDkE7MVCAsDRFqxLccFZwNdunFsjNGS+?=
 =?us-ascii?Q?m0zqNtEJXC91te0gmBlfWzT/9/sLBU/PKeNAwyZ8NfAC8/OJxJBr/07has6B?=
 =?us-ascii?Q?LJ8wikBNca8tGPhijPCDkLWIteFxlaKleExfusRfNBGGcjsDPirVCkY2MMsR?=
 =?us-ascii?Q?hZ+KEXUZBXfL2hwKss18s2GDe2rKMicIYVrGU2m5WxVpg+sOOdtj6LDSAnSR?=
 =?us-ascii?Q?oZkv/QeEUWyp13FHCmWHRsry+mkXlq/Wjpq7Duu6iRY3zxVPpSejlwIZO+HH?=
 =?us-ascii?Q?A7OH54VUp88kcqcRzkEHotDQZYoZ8hSRAl3wWOW/iPRJSUWR5SiBl9uiCjIZ?=
 =?us-ascii?Q?7hq89hJkApZFZo0M1augzImYdtDLg4Mi0H9EfN1kZ/Ar3RZcRsDpyIsMiZ99?=
 =?us-ascii?Q?rAhnpZdeHPHfQDwBUUgypB1nFymLnLv7XVaAzh5TQif7sWGQSq1MR7Jryqq5?=
 =?us-ascii?Q?l/warxM5BCqL5TiX13Op2VRre3TginqknwOEY4rTVPlMaTX9O38bNxpfbuHx?=
 =?us-ascii?Q?r300GK1bEUJaAs07Kl81UGVa3AlxU/Bx81Qgt+n2fBNy6+UvfjqC+qKk6MEG?=
 =?us-ascii?Q?++eJWV7jvnC2EAjL93s1xPvdtxO81FN/qhXplP+3BE8DiKAG6DIqEB1r0rrN?=
 =?us-ascii?Q?9FCpMIKxVcp8iZrLmXpH4tKHeUB1IA2u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UE6AbP28Ked03KQKP0GrTGz9UMpYN96NE78+AIdpz2DYIoXcYJYxWlhZXbVH?=
 =?us-ascii?Q?l0mXMrriB9+IeDQ11VPByt/vTx2y0V+/2l5XzgM/b6DJLa1QFWS8jEzPQpFC?=
 =?us-ascii?Q?80zsEi59zXY9IUBAqss9S3eUSoVdAx37w+TzVrS+9SS3PDTsrIRSOmnWF0vi?=
 =?us-ascii?Q?z5I189qFlHJim7cyZUmX3bXG1y06o4I9jrhv1dgxIBJ1K2VrmYmE1f/0GReW?=
 =?us-ascii?Q?0NYLY6IBzpM1D1vmllW5I3owx9m/LV5n0RByWxc4PFpUvZMw4Fma5ex4DwuV?=
 =?us-ascii?Q?UlIouCePpa98LlTnH+Sj5uiZIQbCbEKXHbIZx8D6ZZoC7RFJpmwW0Q2RlLUQ?=
 =?us-ascii?Q?RezlROkpbW24mlC9OacVkXm9VYJrLK5OuBz31HP97moEKex4qf40G5+LGNbC?=
 =?us-ascii?Q?Vxb57ru5zQ3TiJkvHIQK70O60OQApQCZJy3c1VdVJcjB23yXfh8vTgE3Zjh1?=
 =?us-ascii?Q?LDOifzvALF44j0av0uJYd+6kAL9YVxrHJFubhKj4o5cyQZ+3XuhCR1sPiOgi?=
 =?us-ascii?Q?M7sYyXj4q/YsjJShFTz0545kH4zHDy5uIJ5lUFGH+8OqJRMZbIIIwTQldg4m?=
 =?us-ascii?Q?0tKl15ZBfE4aHyG2IuDD9xTGi0n+ZVaUWb2tTVIYUJtI/M091VTPiOT2XgqL?=
 =?us-ascii?Q?5q60G0UC25NtC4nSZOQy0i/+v4Tk4OTFflpUz3UUmg/a23iBL1sR6kw2SOZi?=
 =?us-ascii?Q?EgMayEfca4stjBHumrPYY37BAq2RWPpe1K3cJ72eKDWAIO/hjnT9UPvU1y79?=
 =?us-ascii?Q?jZwqKHIpx0k2RqCr4A7gBwK4vlstJ6sKasgTKBDLZldkBBkuHNRDfvQ0nMgH?=
 =?us-ascii?Q?KtfGIVf9zgRjJ5zDLOLB3QYhaCCHMiBq8gC0RoiqxOU9SnFf+mmutgJt6esQ?=
 =?us-ascii?Q?t2T6MRlZpsBvIaeYCCEpUI7PKGLiKLweY7JiAfUJ1DisFpjGQwp7P07LblQK?=
 =?us-ascii?Q?ChEjtmRVPsmexo3H0By/ObbFN57UePH66OOmV0rIxm20fERMqRkoRMIexr7/?=
 =?us-ascii?Q?F5rkw2QvBi6pdGY4ijfCqIkV1ZvJRoCW4iuKuZkCMZmALbkfdrM0n2HWveDU?=
 =?us-ascii?Q?K8zWRCpUuRZ6NNhuupyhE19kHEMOV2yKmXjtF7HfBIZN8a7M3VnqkKNllfGZ?=
 =?us-ascii?Q?kWcbWQd7T23EAjZpqcLgBkOgmxfddBtNon2dpKJloGYqsDxyabstbsbb0Ks0?=
 =?us-ascii?Q?8K8hWNtQPG3i91xVQOt+N6P8et/QL5dHmf6EuXAuEZupZ0eHhzgfLswUXkYx?=
 =?us-ascii?Q?V36J81ZkFI/TMdpDUI1mKHUHezipV29MTK0DlT/T6Ei0gWqytpSfE2ni8G2t?=
 =?us-ascii?Q?qX/TCtMR8Wm8gXQYlGQ3XkrT2zbCBAfM6r5a/FNKVcpP2NGY7KRr444Jvlp/?=
 =?us-ascii?Q?IRE14GY0ThFujKoQHu+UiMVpO4wSMrVAp81G70t4ahHHmL+IfvjUmyzJSYAs?=
 =?us-ascii?Q?iKTXNGWJxtheJMcdU2f1oYz+vgtFPt6DqJ8MkTIWeTuKlklwbNsybxGK1nQo?=
 =?us-ascii?Q?2YL5/miJGainpMLYVRPRpTIU/iXRJWbTA22BwuEbcjhXW0GArYnri6KVsIYT?=
 =?us-ascii?Q?cxIIXLdJuIK+BWefpty4xFXoz+gpjDwZ6V5+VBGH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c7a0aa-69f3-493a-297c-08de0d740f5c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 11:55:26.1596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOy9aCAjjLmz7OdYPH4lLeue18rXKogU4vpHUvLkh0XxBRw9bcWpmJw+enYz+cAB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6938
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

On Thu, Oct 16, 2025 at 11:32:59PM -0700, Christoph Hellwig wrote:
> On Mon, Oct 13, 2025 at 06:26:10PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Make sure that all VFIO PCI devices have peer-to-peer capabilities
> > enables, so we would be able to export their MMIO memory through DMABUF,
> 
> How do you know that they are safe to use with P2P?

All PCI devices are "safe" for P2P by spec. I've never heard of a
non-complaint device causing problems in this area.

The issue is always SOC support inside the CPU and that is delt with
inside the P2P subsystem logic.

If we ever see a problem it would be delt with by quirking the broken
device through pci-quirks and having the p2p subsystem refuse any p2p
with that device.

Jason
