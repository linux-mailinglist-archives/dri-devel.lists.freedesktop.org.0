Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BE244329C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F146573187;
	Tue,  2 Nov 2021 16:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8EE72EAB;
 Tue,  2 Nov 2021 16:19:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ip5cVBViBQq18Ts/4N7oyyVKY9VKoTp6VmBHIYTGXNg57faKI+DMefC3wNEogtKaHzvixp3E49I8m9JzWAmOv8oKIolfQsq5iRuLP6z8o4dvmBcxGfa6WnNvS8J6N1KbK3hYKx5NaV4YpUNGVcUHEmbTCxTio0z2zRwfPDRXZ3H61w2pAHeYqZM4NhQc9oyntWZtyVf8QjkeM0p9FdziJmY5gePoGxyMrK2oWS/ZlAGK/mgr7wTLiWqIY+t+4cCYV9nXMaFBdU6/fqUaK734CWbmYRe+J1U1ock2hC83ssbFpV6A76OlezHaX2xtyGCozFtb473CNNh01W1f7enUog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXh5+bEYDdbrsKNO6jowEw9juCWIYZWPMRbip8T8Z1I=;
 b=ggK6ewfXelNqGtBWPqSzgjwHQrO+J21e6g+S/uprEahkxFYSu2feIaxWWWnWNvR6GAOlFxKcivivslAbtrM3ntheDtAiGIr0+Vj1YXCVCqSFZSn6K/pgdhD4uqHWmtQUvzO9lTxs9t1l40ueBqhOAPa04eFfVjlK46au8wtn0ReicqpcXPev1O/wpGmcMph/qYrz1HvMczYlrzlGXuo8uNukXyxBnUr7qGIta7GbhRZPZJCwVpls1mxNU16FEgiAyhOSL3iNAVXgu3UYxdtlYo7IyzURxzzrYuOlhlkm5s9/Y3jWtOxEkojwOxzL35O/xBF5XqPpx4jJE+igKFSwfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXh5+bEYDdbrsKNO6jowEw9juCWIYZWPMRbip8T8Z1I=;
 b=fPiYzEN9PJ5fORqXlrA0bN21EJ3bRK/8EdUYusawbv+hUnTAU2Uhy6ZjENCG1Q8jcEMPKSejT56YdbGNXPtQHbpmFrjiQya9iDnK4JVDcwv90mbyNEf2Tkw2I+J+FoOMVvs5vYOC/1Prkz4nrVW6xpCCqczklr14Wzp9t8ctNt2RT4fpGlSjH1iMotzs/yyefZzvEzNPboJ0SqusDjGwHU+WwHXowZcGDuzxcJUXL57LrLn1PVMFPSH3TDB3MEXmeyZRMA/cJIhdE4W49IW4az3L8HBB6xk00dx3tje6OZ57JH4Gz+VctGv2e/ZO6I+erryXKmAiM6gDR6z3QgoCFA==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5540.namprd12.prod.outlook.com (2603:10b6:208:1cb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Tue, 2 Nov
 2021 16:19:55 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:19:55 +0000
Date: Tue, 2 Nov 2021 13:19:54 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 25/29] drm/i915/gvt: streamline intel_vgpu_create
Message-ID: <20211102161954.GE2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-26-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-26-hch@lst.de>
X-ClientProxiedBy: BL1PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:208:2be::30) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0205.namprd13.prod.outlook.com (2603:10b6:208:2be::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.4 via Frontend
 Transport; Tue, 2 Nov 2021 16:19:55 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwVu-005Acx-Go; Tue, 02 Nov 2021 13:19:54 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26db1839-a232-4824-6aa7-08d99e1c9b5c
X-MS-TrafficTypeDiagnostic: BL0PR12MB5540:
X-Microsoft-Antispam-PRVS: <BL0PR12MB5540A5CFFF33E1AC39136B1AC28B9@BL0PR12MB5540.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: awpv4+nhHwivbxHVpk7MvWq4ULrdTfmr3afdvGkHg7sAt+2BFbrYiXxFzsKZOydIrUAgwXdlwj2iItnrJX9U+j8B62LSE9RXBCXqiNNYEW7d/14dEr59rxfTchmtxZpPQjjPvMEszrvcnGwaxdixxzLaxoJp1lwgVCsul3Vy3/gMDIwX15bsQKr4xK1uWa2Gmi3W7yI53kpJD0IWa2WmKkdlZvVgNG5R4JkT4CPMyIKd05RpoLZqE29EjLu73PISJ3gDD3sU6nPHx9pEy0pvtqNE6kGZnF6xWdQ6Uwkakd8yyO82iVgOygTNm+sj0pOYpSf6G5tmUeMUz43CIfrObuu1simlp26JDgf+LKA/flIEzZ7NUawdCf53o0dLGSYCwNTnr5tF7sDcQ/9+gW4DSRBHXU4hRmYdkVZ7umSWrpJ2pITPC1sq+23BU8smDw50PWMFF9oTlU4qwX7b0xQ2wTxmBmfHhYwcxLrHvNAmA6i9mlgTTEHplKROlmnVeuDKDfJmUpYEV5SQzONRz48/VElda5OmBVVIg+5W96SBJ7wPwlUDk2XwAct0VPBYN19XEnlLWlhwSdycEErzioeDt0vreWFRe8T+CIy0FiiH8qw6vyoybKFCqjBsLDJhziNvtlm2KpCKNjOUke+bnXkFuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(2616005)(83380400001)(4744005)(38100700002)(2906002)(5660300002)(33656002)(36756003)(66946007)(8676002)(6916009)(7416002)(4326008)(426003)(9746002)(186003)(9786002)(508600001)(8936002)(1076003)(66556008)(66476007)(316002)(86362001)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vIdEEIFI9if5immAKkGaIvF/ANPsNsTFKF8KT49uXBnSuFObCm692BhCQjmS?=
 =?us-ascii?Q?8ih5XbbNCI2rNkjOK+XQRbZwwdcpsbl97Sfp9orU1ESRQUM6E8UUBg5YC648?=
 =?us-ascii?Q?tVwOe91WnjigxpLXT+k5FS9jMzZ21CI8EAeQRj+uO2hYSESSmqqczAg3PopE?=
 =?us-ascii?Q?ExjGyMyNApUdanjmOVTQf5A80+lOT2Jc9lGLUsBOcTtJmTK6RmkzmI0H467A?=
 =?us-ascii?Q?34IeX+XeRqDRt/57uvaUOHJ+yvgv/I5NXUFUTdpXjs5pa5EpTDzgQID9y0HZ?=
 =?us-ascii?Q?PGWqVDd29jBzeaapQlIaVtjluRFponFtbxuY1Mygi+OmL7uPH/5WrMp9SP2G?=
 =?us-ascii?Q?tQIvQO57ti2YBQr/HM1ENHyR1C9A4jCkU+Abgn95yIM8IkuI7itoK8Ucdhlu?=
 =?us-ascii?Q?tuCswyuVrroX7/aZNgpsnU6tuUmEhNu5Ty0hRHtyb5I1RALtQI8+SS6iiPtv?=
 =?us-ascii?Q?NvDjDBvqdnw7QsPf8dN/WIMSDzy3S8aYf3BXvV3OrlCbYiSFG6uoFygEzd2E?=
 =?us-ascii?Q?5THG56b4+yesJMEx4l9J1QxZlkhfiEO8RketopLVCNpjNUg0m8norizxESBd?=
 =?us-ascii?Q?IOujrvYNVwNmQEHw2fMo+LG+b4HXv9pOfAhaeFXaakzlcusvoy2HU0ajVz4Q?=
 =?us-ascii?Q?Dh8czyfmG0U68xlJ5/JXj0REXcbxe1LoKSqj03y7wa5eWuDuj3DmM1Q0FQkM?=
 =?us-ascii?Q?CZddGMR3Zt0zHV1O3iN33KN0kS236wb+Ob830o/SCfY4zzbZRALe4dE4dySX?=
 =?us-ascii?Q?9xvyXGGRJnx7TO3WD0eP8620CWd8CqoI7uZvNJuBKQk8BnON67HVE1No7Ikr?=
 =?us-ascii?Q?ui5tFqeKVjeuWdIIwfr0EHLa9zO419nnQeCFXeXCQX7yTzNxkJ+fJKkR1aZq?=
 =?us-ascii?Q?U1xl9+L0QkCkVs3dYTxK1FS2u/kUoRpOCODtdK4/c4G1rPYg6qkuC9zbjue1?=
 =?us-ascii?Q?wAbpgVZlnJ0G2RVB6/v0DpY6YdkKEr0ofbgp2TAGburqCaPGpvaKhVlZqjiy?=
 =?us-ascii?Q?NDYRUbNAcaM65J1DLECKqXH9nEzDr8B+QhvFsFZLPxZgs+M8UBsa5QSHpEqg?=
 =?us-ascii?Q?oK46NV/2xU3vAQn8rlZ2/7s8G2XpyHwGsOELRZuDi0O+QDVrIjAnQW9nlYvR?=
 =?us-ascii?Q?w/fBtJwqVsyoDEQvmEu3e6fSCdqE3Ie9WrMc2G6XSx5+QhKsoxi2IA4YCbmQ?=
 =?us-ascii?Q?j2cb5EbGlaszn5/doRHXWN0bpxcYwlyvgExcCNWtZSIDTQ3szPB/tgvI0QGM?=
 =?us-ascii?Q?P89/yrZedyzGFaJEjAucnuPQx4DmHIjaG+bwXS3H/YGFMA84ZcG63FwYkxTm?=
 =?us-ascii?Q?7IyLOTjGJC/PIVyvnRuu77MXkepTa9yZz/dkOvo+oyQ1AMuiNukv+d/DufDn?=
 =?us-ascii?Q?a2EAfg6+L4fdjyhgpuDq3EWVYgzxgpY2wJlI+8yvOeY6x8oqg1Xxvb2DyGZv?=
 =?us-ascii?Q?mi75to95DwUJQjpjOLxzbiNrhhi/Qacxizh+Muto9TszbJc+NNtiiyWb5Jiq?=
 =?us-ascii?Q?E7lIDGnbUUxcDeikhrFT7Cl4D2fdYnytL1A909Darq6LrFJGxAT24PD/peqX?=
 =?us-ascii?Q?75i3DoZ9Q0ybtW9+DBk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26db1839-a232-4824-6aa7-08d99e1c9b5c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:19:55.3678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CR/IO/E47LA+QptoBKRxyb6RJGdDbM4DFDpRGSQdvVdGZp6EX/rc8Z25oRDR9Wm/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5540
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

On Tue, Nov 02, 2021 at 08:05:57AM +0100, Christoph Hellwig wrote:
> Initialize variables at declaration time, avoid pointless gotos and
> cater for the fact that intel_gvt_create_vgpu can't return NULL.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
