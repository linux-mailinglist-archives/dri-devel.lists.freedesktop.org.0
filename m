Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D86BF1729
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 15:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECDE10E434;
	Mon, 20 Oct 2025 13:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="D7RjNzIS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010020.outbound.protection.outlook.com
 [40.93.198.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FCE10E434
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 13:09:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKWseUfnC17mKzppVR5Lqfiaqj2+ivOK+Dj/FUAoro10bB5qBPyl9hc/B4vApF/JOcMapSDuIBDYzbg5Wt7tBE+luspq4OO1LSz20Oi2uf9eb8cYNSUE5DUwiEyz5ziy5xCuuShk8BPEmKAjM9+nqd9hBBICXnJsI/mYA4aytsEl6bqv2vwDPfvmSKjzTEH8EvHzG9jTUWHfL0bldnB2Wqx4Kl1wv8OGkFHNc9aMfeMrKAaaZJtvZFazJUTVE2/jpytNRrFWCT2QsnVYYu7IAyzEPTfagK0s3JWnBnkJ3hnAVt2nl8kndwT+WcI4DivnosGu3bBgqTkYZc/P444HPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ylouh+fdV1DgclFnsJvbCGe2nlaIvyQ7WBAp/TyoiI=;
 b=Ha8iP74NxWZ5dTqqXSoUJk1kAWCIP9m5GFB1YQYULZX/1KfofOUK7gHOajuw++Bz7HhzkQckh9dTyRbAW2abyujHmuPvBp1Cm1UkyhRV2jjF7BK68AzbOZtb2IqzSme5+JgAs9fJuAO/k+qdiNhdTKIGbEP5n6+AFk00QeUviUDbVbSoqtcDEpdhIjIn8dw2g4ejRR2fNYpjZ/EUuZdkXUmx5iLve6x5iSqr7GvIZGc9MUxscuPpQQ9zotyiM4iMkufihHAfR9A2G00RS8dJx64hUU73u//kyXNSkDHDjc4+1m7CYVXv6Vg7nZE6rSxC8NVUxbB2LmXDCUn0msVDdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ylouh+fdV1DgclFnsJvbCGe2nlaIvyQ7WBAp/TyoiI=;
 b=D7RjNzIS2Egge2En8+WT6PDZmwIrf1o4KmQF9UfTGqZt2uGO+b9velyp8tvBsK4l0++Zncq7vfiJs4g0DK6w3gZnG5ldZSbev5FC59zpEW0KbnYEjWnhhiLEIeHmxxD/6D53QUqlI2+sUz+SGqvkKvGKwgqd1i95smtMjCo9Lb7Nu1hnoVlt4gd2dtH8Qjfo5aSLbdF4bzMhuh2AO2gV3+qDSV0fCgod0LQDF039F3jKYkRLQsKh8MOTNVZh9J3v/A0WnoSpVvzyoBODYZHR9I2VEDnbC7uFxquOu5aS8qk0/nXtiro7JZ52yagBXibsVOmDY8ykOiOuTF6KUaE2LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by IA0PR12MB8280.namprd12.prod.outlook.com (2603:10b6:208:3df::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 13:08:58 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 13:08:58 +0000
Date: Mon, 20 Oct 2025 10:08:55 -0300
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
Message-ID: <20251020130855.GM316284@nvidia.com>
References: <cover.1760368250.git.leon@kernel.org>
 <a04c44aa4625a6edfadaf9c9e2c2afb460ad1857.1760368250.git.leon@kernel.org>
 <aPHjG2PS5DVgcG93@infradead.org>
 <20251017115524.GG3901471@nvidia.com>
 <aPYq0jQZOrn-lUJW@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPYq0jQZOrn-lUJW@infradead.org>
X-ClientProxiedBy: SN7PR04CA0053.namprd04.prod.outlook.com
 (2603:10b6:806:120::28) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|IA0PR12MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: d5cf29c9-4d9d-4c5a-8c93-08de0fd9d437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h1xACQAtvn2TWK9f7Nl4bpGr7MwvrySl+v0BLiWzNzCfUWJtS+1G+uHQHafa?=
 =?us-ascii?Q?eYMrsjnOUXAhGJBz7MM0Q6hckLxc1Z6T9ktp5vNMCB5s7XsgJnQDSRDSqnfX?=
 =?us-ascii?Q?T4eSdaVcqjzOUVS4cSqAgUhfNfD3HgLNLbZqOpyOor+VVnqv6nK1oATjjixq?=
 =?us-ascii?Q?sCVt35o/FDSZjXqcRQA02wIOmZ1iIzuXukJd5u96tr4P2qnozElY5QF+A+EG?=
 =?us-ascii?Q?KFh3OgJQqUxEpnDxKP7hUfo1z2jT3ftJHuqCstNyCxMj2wf3+AWYWOB8PENd?=
 =?us-ascii?Q?WmM6287JcnqJU1mVTG3dfGTkK9dwAeeEDbFtArZm9tuVo1k5IvxEpC3V555E?=
 =?us-ascii?Q?x2pCrXVMvbtZG2jdypBtUros6hQrJdk843H1J8MP1wkSpM/QdYzZ67A1Lfto?=
 =?us-ascii?Q?krdCdBXRk5Z0xO4EbBbg4zn6cUavqaxp5k065h+rc58QI0Ymv1ntSLiJKYAY?=
 =?us-ascii?Q?H2n8yxIuwTSd5S1xoCVX6Ux2jbuGRFmy+ZijV0lElQOwWS9z2RlCAsdp3avP?=
 =?us-ascii?Q?lpqYuEVPinfGjXjAyiXKtqCnRNRMcg5VoffmfYyp+SkWdgpvigA+NnQ+I+Vv?=
 =?us-ascii?Q?KEYj1wDHGBR/zBi5IwcN0WNnggPcs6VZk+cudGEUkOrP7jB9A/jhOzk/x5g6?=
 =?us-ascii?Q?z8nTOorg//iYI2nvIJS3hANyNSVzExowFeajh917W2H0EKemvJuMnNHkUlvY?=
 =?us-ascii?Q?YqwU6TT19TFvXqfpNssGmnsHP1LFFA6R4sJEo1wOWpYsVjKeke+l+8Z1ld88?=
 =?us-ascii?Q?BfJnnb+oaObjfGfZZEdmLxJAWTXQNznAOpdIIivFXa4DPApZ/eQ2NoM1VQeY?=
 =?us-ascii?Q?CG70T9owZN9/oJZkCW6STxszjSf4VQxyBh8bypH4BRPHVPli/DYsHfPC5XFm?=
 =?us-ascii?Q?OKCY85P0OdPrvLUMw8vHfACC3iiCKCpHOpq5gM/E+aV7UWzgCItghjf4gUOs?=
 =?us-ascii?Q?+QaUgY/rmZzttoVRks4KUOh62LW11BSsebgixLJNQKcE+dQp8TX4Sermxtv/?=
 =?us-ascii?Q?8qzyAJ4bDF0fZRUx9sS5TS0H4cyWa8AjfKwlKOVr+K6vpFTd1t7IRXgLpvQB?=
 =?us-ascii?Q?UGWmuOWdZDh+ewZZmd76cBddozjHxIrFySmXwxU9WleKfN1mGs0+17vw+U6S?=
 =?us-ascii?Q?ZuBndcNEQtbCr3lgOxvWLuHFIFh0IQPaTlSoy6rxirXHbs++Fmr7PEv6jb8K?=
 =?us-ascii?Q?J5ym3sOwt/r7N6VcKtryvGTYwI3cb8RIqSaykmj9Yl2vNbVeOOkWs+v9dUib?=
 =?us-ascii?Q?jrOscjO54N1i7CtVUcXRzE8BCOa4ZJJNRs0wEpIiqnGBThRJqt7o8HpxQGqP?=
 =?us-ascii?Q?b+AX1gX+m5yawrKAaB0+ihC0DgEp4JH7JGgTnO2EfyDBSXde3ea9pgSAbBeQ?=
 =?us-ascii?Q?IcGDr6SUAfs7f3iQZ8u+TsEhje8gcAxQzsfELnurxkOZ7dwtXwW1azHkzmrX?=
 =?us-ascii?Q?4UCmdrMRqXnpFXKceTifDBb2rLUw73M3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kWsT5OPuUM90Y0GJJOVqqNv4ohcp7IH7xVeHC687C4hvpM8BEReNDiGCInNk?=
 =?us-ascii?Q?swit2RadDlegdAkHH4bwl23ybl2n0+3th2sX6pVXkiUy1difGwoYpfGzFd0m?=
 =?us-ascii?Q?tbZlljNee590bs6nm2V2oKjkDuDyJgCPDm332ahJlHvrrMnQuoO0yXytdZRO?=
 =?us-ascii?Q?QgnmH6dh28nWU8vYccl2TSkTdhkawJtAxyz3F664CM2x6rtPzHg4VR1+JkQA?=
 =?us-ascii?Q?C3cdjWij7RbAvkKjekmmMI9Qy8SZgziuh/QxVnp/NLRm3t7/jw0e+ifAV/AD?=
 =?us-ascii?Q?SZ5h8Jchmnym5W9aitwKIv9Mjkkh2WZ4CMueX+SxLutuTLrGyep0wQKVjRDh?=
 =?us-ascii?Q?54Q4w07Z0iLefGShS37TPzvzod4ssYwUbZ0OE3VkFDddQ5peD2AXC9GyRaEj?=
 =?us-ascii?Q?oAvT2rBqxCGRd0/JaVolzqpUWpjW+5AjoxBtMdD7b0RK3TnYGQsUp/DvzciR?=
 =?us-ascii?Q?u7zK5vkepwO3is8E0oxfQFTZ3T9yQZDmHXq5jm1ayLqjLiT+jHoQsmhahzc3?=
 =?us-ascii?Q?DeMZrPlWmUhACpzuFXbwru4OqWGvBPncRb7Po97nDZT8C7MNwjXFCJH8YzDw?=
 =?us-ascii?Q?1ItoqaQQZCYcIBxHVvPFsQlTAVF23wl3dseC0j136B9XEd7HnQ0HlnfQH2Fz?=
 =?us-ascii?Q?D/JPA2gQEO4/kTg20cUuIqyiHo+A5FT6XbL5xnML3ied0ubWVBzHzNKcIB1j?=
 =?us-ascii?Q?O0CFj/NBnOhuLqtI2AihkPMtjeV/f1pAj4xIXhcSlqpd6DgAZ1E8N8bel1xH?=
 =?us-ascii?Q?EGgP8rHuM/1LYEa8uYaXgoy0Dk3kXG7wLwwtgNjMuZAT7EIaLm9P7nJorJ5A?=
 =?us-ascii?Q?ceRGs1mihQXLonkexQ8/G2zkmX7oL5qinD2y7b8PHsPvJqegUHmYhT0wXcgg?=
 =?us-ascii?Q?NbRG1oC5NamGwUp2FzNi1rOwP86akWQ0VcKCuDyCNl3k46n2jgAfRAUXW2vb?=
 =?us-ascii?Q?5aLE/+dRee6M72RQ+yLPMFuiNxuwoCR3JxsvpEXzL4GZYq8uWjixlrk/VFYt?=
 =?us-ascii?Q?ahfz4l5WZW5MfTMbSWs4oSLjkemXkwVLaUFkqWJ45fSlHuW2eJ4G8oQpuDoM?=
 =?us-ascii?Q?1uE8DSzP4Sn2xCVqoOQQDZ2d4vdrYfNyiF2DGis36Ekws1jYs4B2KwYOgROz?=
 =?us-ascii?Q?YGNgzOnQo0LTYyh1V8LJQDsoBNq2huJTECzcf/NyPL3AqnBm8KHb26wU942E?=
 =?us-ascii?Q?B6a4KqzqgGTD36aLKSV/P5G2vlcJzuWu/OPfQ/5Fldywjbg84lXAkoAtz3YC?=
 =?us-ascii?Q?TAdmJxKcQBDBA64gAsibwf4SbXwEYCCFv05eduJeKW8w6TNnZ7W5+9rNuAmy?=
 =?us-ascii?Q?l33Thh1fZFuCcSB0z1snx0nfpz7CRmcsauFfWVNn+HoalGq5Y9ugvnh3v/Oh?=
 =?us-ascii?Q?ICnmbsBpuBcjdqklS1EDQNtqaFGYHrEqK3C3J4F/oH2ErX0LLcbW8jqZL793?=
 =?us-ascii?Q?XmYdLgMvWspqgaz3ZYd/wry91vNWt5W4FK7f61uyhViywJTjy5dxhOjPnFC1?=
 =?us-ascii?Q?+1xf8TRD/twtXlOdizyq2KqN/cVSnS3CugoXhHVEPeaDPFJXIFehrvSr03ed?=
 =?us-ascii?Q?T1wCMuYpr6EvVk9YnPw+kHSYrlQRDOpJJwKuvcgG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5cf29c9-4d9d-4c5a-8c93-08de0fd9d437
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 13:08:57.9786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYOXm0OFNjKtidZ5WonpJNZASmcOLa+We2q+b2MY0IvjwpInd7yQTZPgmXC7NDUr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8280
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

On Mon, Oct 20, 2025 at 05:28:02AM -0700, Christoph Hellwig wrote:
> On Fri, Oct 17, 2025 at 08:55:24AM -0300, Jason Gunthorpe wrote:
> > On Thu, Oct 16, 2025 at 11:32:59PM -0700, Christoph Hellwig wrote:
> > > On Mon, Oct 13, 2025 at 06:26:10PM +0300, Leon Romanovsky wrote:
> > > > From: Leon Romanovsky <leonro@nvidia.com>
> > > > 
> > > > Make sure that all VFIO PCI devices have peer-to-peer capabilities
> > > > enables, so we would be able to export their MMIO memory through DMABUF,
> > > 
> > > How do you know that they are safe to use with P2P?
> > 
> > All PCI devices are "safe" for P2P by spec. I've never heard of a
> > non-complaint device causing problems in this area.
> 
> Real PCIe device, yes.  But we have a lot of stuff mascquerading as
> such with is just emulated or special integrated.  I.e. a lot of
> integrated Intel GPUs claim had issue there.

Sure, but this should be handled by the P2P subsystem and PCI quirks,
IMHO. It isn't VFIOs job.. If people complain about broken HW then it
is easy to add those things.

I think the majority of stuff is OK, there is a chunk of
configurations that will have clean failures - meaning the initiating
device gets an error indication and handles it. Then there is a small
minority where the platform crashes with a machine check.

IDK where Intel GPU lands on this, but VFIO has always supported P2P
and userspace/VMs have always been able to trigger these kinds of
bugs. If nobody has complained so far I'm not inclined to do anything
right now.

VFIO has always kind of come along with a footnote that if you
actually want fully safe VFIO then it is up to the user to validate
the SOC and device implementations are sane.

Jason
