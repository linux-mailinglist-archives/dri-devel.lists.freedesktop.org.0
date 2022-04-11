Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B73164FC20A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A1D10E99F;
	Mon, 11 Apr 2022 16:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CFA89DDD;
 Mon, 11 Apr 2022 16:14:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sqrv/ai3tUKVBUIroFZHW7xC00Ledf/WN7dRJj/IRCSHem2g+ypRC8IBUa4ZWSJ5mE/wf3hVh6IghHc3hVKMR4ygWGyxSagts83mquSC5RNJIQdy4/Fwl7ll5eKKtW1BBo5QBSKvBuMY0jXRYrOlGm353XbR6L5sK4sZ3Ne7WCIqrd6nAehME0ZiMfgMNKRyWwcxgughuYzv5AgDNRmgjN8yuJzpQRnUyOQNnEq2D07aUw5qVyEfz0GFmFuFFv2gEptFkNoty32Y3LY2OsnDiKrk1fHLSUpp5D3aaSHF/Qilm3Ubjn1KaS0bVQeIKpxTI2WKpj0qLigtDvkIOCro/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxVjTdIP4shPCEt79KNt2AoJygaft0dTSmB5zW8kxn8=;
 b=X7u5ZQ+UnPFL9S5I/HVoVTUy2LMjhc/nLqrPmrWv6059oHG7+0NgW1HK35geHi2BPPpDFRw/2uki6osDQGktC8t4FZdiiYbG1Pc/rxsBqc1PmesvVHzidAJy1l/Da0YohQjN+QnbajU0TATrS7YsVf3TENwvIOyfP+I316092UVY1dZHMlOl0q/yD9l+jW+laSbJbXOb/D5JC0IPyzNhIf9ezrrAjiBgB2kUNK6AFYECRGOCWn/NDhi94/mrjlYD51ni3ZWAuSTKPUp6ayD8+Vlr4i6SjZwoKzOBAP1TOALfYNaGtG6I/ostfrIaM7/eee5WB2oDPlvAOG9A0Cv6oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxVjTdIP4shPCEt79KNt2AoJygaft0dTSmB5zW8kxn8=;
 b=dU7D2LYxteY2Y1PsZONSxK+qPJyiwJQpjZs9Y9U/p/xuPN/iW2kQ/O2iVOQdsAq7g2Y5S2Fk087ppheuD6W0HcDkFFbXU4l52rBMdHovAmxAlTgPo4At5/NYdK4bWGzeLmfpa+cq7rqeeOlCHdIVSctGhjcDtKlsyzz0A2ON3foMPjyztzWj14v7VWmYQeJ4oD5ZVyNZXjmffYWJ5DEzKvqGjgRvYJl8C0DTemckVo7eFl538kzwOgRSBhgqWdDTMv4JuMp49/9+qCMS6O1YCt82NRfhNk9flBvclKL9lCjBEcMlyqrZWqnkCekMcfY0JrjY1/4tZ92sCJqEvNyJfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB4619.namprd12.prod.outlook.com (2603:10b6:5:7c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 16:14:17 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 16:14:17 +0000
Date: Mon, 11 Apr 2022 13:14:16 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 12/34] drm/i915/gvt: remove vgpu->handle
Message-ID: <20220411161416.GN2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-13-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-13-hch@lst.de>
X-ClientProxiedBy: MN2PR17CA0023.namprd17.prod.outlook.com
 (2603:10b6:208:15e::36) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4dbbfc4-a057-49dd-7c9c-08da1bd653ff
X-MS-TrafficTypeDiagnostic: DM6PR12MB4619:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4619859B7E7DFEA880D9CB39C2EA9@DM6PR12MB4619.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a/3JezaX/TY6cFPtpfBv0RfEN5lLdLz5iA07MiZagl7CIdJhU5Z77CM8bgY5Blj+PzF4kU+c2/MRXXFWe2OZVKu02KeE7NU7qaM9eZrkrmCheBGBAFLAM/kl78bIgIGHJKcN8kHApbZ22Zv8b2L0xasDpkvnSin7SbAz9OQft73ap28gTjLKhB7DHMvDm1DFd1XyoXz2B4uFhrNK8yHVotICttiDUZ5GzcTkueppOz59U4rwmX/JlLGGakg0bBwVobZgh1HBLZBdTPGHUV3Wt8h637rlVmPAf38FKEBKnhI0d/hzKZPe6o0FEIRZZmkMpiFpkzjFjsos3z+amUK87scYZXkCWTbvcAX6uOOU8X47vg4xl9ZNGnVl5Qp75OV1z3QuTer9FX8VCtkPkt5KNdKm2jvMvdo0WkGUyAzXl0ePIA0Bf+hXl9i09zXQHHl0Jh7+lcybmrK7o5A8iJnwybkDC8+QfNz5GbSaf4m7OkVVs9E7aZVFeEcAfzYRN7uhwfxa+cpwJXqKuHIf4tK89WcPnhRTp61jYjKACV5OijYEZH2Mascuc8SqW0ZKE5s/dyR0UXKLCHUEnNkY23tnf0sUpl2hqvwp0t3fqkTlxTAjYeldsr9gQR2+qIU7QLekoxJlRnvF6o6aM2C6ojFE5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4744005)(38100700002)(508600001)(6486002)(6916009)(86362001)(8936002)(66556008)(7416002)(5660300002)(4326008)(316002)(54906003)(8676002)(66946007)(66476007)(186003)(1076003)(26005)(83380400001)(6506007)(2616005)(6512007)(33656002)(36756003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vGQM1zN2k9TaeD2J6HRKjcZ/gxIImoxbQ0yoqvIahE3aV7MZXpDNywNWJWnh?=
 =?us-ascii?Q?mHcHYuYd1Mhqy1G5HSy/MIc12+bqY5JY/g7bvdEPGvuAwlDW2EC1euL2mJUy?=
 =?us-ascii?Q?2VpHoabDfs++M+KTSZ9Fw+uR02h6Q+bFyB6/ush3TvQphLckiWyuOBbbyQNW?=
 =?us-ascii?Q?/TNeDnL9eG7xNPQ6yUYOp/+qtV1ivnilxX0HXTBKeUIclpjyxInb6/rwnUha?=
 =?us-ascii?Q?se66+hwPDyfCIefUD+ghdkusfPThee/DXmGk9HyH0goyHeI+T2UGpn/LP+xA?=
 =?us-ascii?Q?x+QSUYWfs1qm0JN8bw+aDPV+6T+V1p+BPdoggbkGdAoPplHkE6RevQ0cLosa?=
 =?us-ascii?Q?JIzFXPCd5VF79MmsBx5NIvmkY5xuIu3eJRR7XH6WvMFCQBEPv/6J+r7IlOOt?=
 =?us-ascii?Q?SYVBT4x913/ZgkTVD5f2sZD1vYOlObGmHqmI0EyHnP0AdZZcII5JIzrHr416?=
 =?us-ascii?Q?ca+drZNbIGlUnxoWrgoo6zpjP3fDI+HBYveuEj9M75MiFdTqym8xYi9YpoJl?=
 =?us-ascii?Q?a3T0LD5mNXJ2P+5EWvDnAr8V5DzEbF2cK5VOCTJ0WX8ixJhF9Wn3yOhy1K5Y?=
 =?us-ascii?Q?lIuPcCWbQ7JoPhaAu8apHAWk6FL1freuECna5nuJ2piDAluKzb1hME9IA9aC?=
 =?us-ascii?Q?fMr9iyMeWil/0tzve+Dj++CHPhJYrxe8qe1Fu2Gy1XOty1Ewz8HC87iKLNyc?=
 =?us-ascii?Q?HWmCgFyfJMlKVTcB4sabCMAWLlLOpcaqeZvyf4eDENyyqUqeKA/MiNXEXp4z?=
 =?us-ascii?Q?/qaiz4D0oUh14YogBoQbOq4OcMM1mU/ZQKqK/Zo+Uq8Kmb9UikRZnxvNq1TP?=
 =?us-ascii?Q?NlJ+n8JIw0soVdtzl/eQF2aIXthJOUYn0+OGtHkLJmKQ5VlJ4pCFTxo3OQ5J?=
 =?us-ascii?Q?o53JWQcFWLB3kWjBcVL0nBRRpbeqIHf7UptceURIz+AEroIn+5bE5ktzILb2?=
 =?us-ascii?Q?rIjZBDp3sdywVFzhc863IjWnrnI58qEi6aGI1g45DLzk1JynfFSb/3J4MNdD?=
 =?us-ascii?Q?40O2eFnTKzCQHPKTETPSgAboO5tv9ucLP01lNkKwZtX3grkB18/SRv02xl8e?=
 =?us-ascii?Q?iGWx1brarSMxnSBb2aGZRJJ61ZE8VBcZzRXJnrDw0yi8H9d6o3zG5ui5HkG9?=
 =?us-ascii?Q?ghJf3+L62JXKKDfcycItccFgO2pCn//WbgZ9x4X/WrfCp1JU1QnT7fQNzqV3?=
 =?us-ascii?Q?6OpTbmUuov4enw8r3+CQD9b1XtiBAI16s8EImVdJ8jynJbccLWfd91ZizGws?=
 =?us-ascii?Q?0B8IMLN2EUdvrQTiP88RL7U6h4P0y0R/xKvDuepsS+dhSDJbmoaSOadtqdlh?=
 =?us-ascii?Q?sd2YWFuiiKFZimAExeMpyB3ZsxL62o2OQxjI61zRPbmCeUH64bH9L79ZCLEc?=
 =?us-ascii?Q?4sA0z5rgnpwn9buWOXLvTydtIixfWqE665rkHRSqSNVfpTS6/B2nqLlkUVcn?=
 =?us-ascii?Q?4w/TcdRZdqH8hf0DNHoqqIX0tsUhGfD2ZvwZu2ZjdUnDruGLpBLhklgprB1U?=
 =?us-ascii?Q?EyqC1txa7Er/R3gy/sqtbzPCCIXvCrWixd+dJvMSGYpcHSkpSLJ2eDtLlCio?=
 =?us-ascii?Q?IbDgsWGcl0vq5htsbtNSqB/t8+8m3ZwNLcn03lmDFSsym8BrtJVxMkqsVNtQ?=
 =?us-ascii?Q?19C/z/RTW2aS5+v7GwAuxi6pqjVMBZq9PqEfCwZOEeb76B/V+9xkjjzvHhAF?=
 =?us-ascii?Q?Zb1ihg3Yf9wxw3/am5al4SwR2xq5t89A+1nGK9pinmaK1a8qex+5laZ2gCwd?=
 =?us-ascii?Q?r3f539v03A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4dbbfc4-a057-49dd-7c9c-08da1bd653ff
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 16:14:17.3487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uvuo6u1hbBVqLOp0lEKqV/lBDIP+Q29bniMUNGArwAsCItZHqUyEQcyFvpte9f9y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4619
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 04:13:41PM +0200, Christoph Hellwig wrote:
> Always pass the actual vgpu structure instead of encoding it as a
> "handle" and add a bool flag to denote if a VGPU is attached.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h       |   3 +-
>  drivers/gpu/drm/i915/gvt/hypercall.h |  32 +++----
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 126 +++++++++------------------
>  drivers/gpu/drm/i915/gvt/mpt.h       |  20 ++---
>  drivers/gpu/drm/i915/gvt/vgpu.c      |   6 +-
>  5 files changed, 71 insertions(+), 116 deletions(-)

Yay typesafety!

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
