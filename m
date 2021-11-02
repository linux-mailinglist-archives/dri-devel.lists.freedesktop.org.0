Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E105E443275
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CB96E037;
	Tue,  2 Nov 2021 16:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A9A6E037;
 Tue,  2 Nov 2021 16:13:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5amJnG2Xrap2YnMX15Rf2IzQ9HHFBKBA/AjbQj0dbERsQ40KXE5SVYrfHO3fmxVm5Y0H+xQtrN7rld9vFrcF18nebpmiLfG5cjEzV+H1o799Nx32enqs6afLl3hz0r82EHEcZITchIjzcUMPKBtqOUw91MWiJP9R3ppWts2mbkIkPs9Bodiuj+d4O/+gfuPmu3qckBUQv2PpRlZ32WpEZmeUcD4i5w90k8B5IiFg2lEYpZa/bFUC5SoytFPZ0OCKyAhQjuCWf6+zrJYMHgzfefor2XIlhUpJIt8ZRIaVScHxXbEKS0KBIx47yzc6/gq7JmA3UPBW1NxabVu0k2OxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZcCnK0FXaDLucRcwEowRsLvK3nZiR+Ov7RcXtvMPt0=;
 b=nNpWr9IBQU/eQXwErbPdychNwJAkv2X996BDFATIApzPDEGBUQVbIAvx6mDDe92F7V3QXGnU1kXhTU7VftwDCuSwBHStPJ5ALdaIAMZIL1AS3SAollGfscGLnrQrJDovrgO3bru1MkG0D/2uLRUR3nc5e7HgnwgOO7fDF2SiNsuX82sxBZKvGxCJNSz4twh2IEwWmzex37DrMUwr/+3KR/aQb6FPhQive4nNnL65SqGn+wvArj14Tj4tAnv00fYEjWE+6a+8f9vTPbMlJ+vEY+d+wqPYSi89t/43b6kecpeBJmZgoG1+/BB2ghOGBIaWNjpYqkXEAl9LW5w3Gv12qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZcCnK0FXaDLucRcwEowRsLvK3nZiR+Ov7RcXtvMPt0=;
 b=ZTNwOS2EyuN5eX55nu4MhkOv75Hr6l7c1hAxJwD7g4Zhxzv0+UbkXSxRCHz8awpWtdCYkOU7YXZoYSgpRRHJllEUqHD0a9Iob5j3W2bAK5cRlk+YFSzfxnMMXBR0MSWEzruncnzjrmkkQU+VDNvvIgwrBjjLNH19ncDJ4PiSVp6JUfvIh7sA1InVyG+A2hcsAebKyn6etWlUvOhZ1o+8U7pZ9zrBf9A4grL90llW3znILZ9VAn+9aDie63Plt7S+62wzvRJk+pQQ0d2cClXoolxEJZwTSxM8Sanolnm+Q5r2JH9Z0uNThxeB5k9rAGF74OZ7wAbMOYLXCg1lp7y2Xw==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5063.namprd12.prod.outlook.com (2603:10b6:208:31a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 16:13:36 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:13:36 +0000
Date: Tue, 2 Nov 2021 13:13:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 17/29] drm/i915/gvt: devirtualize ->inject_msi
Message-ID: <20211102161334.GW2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-18-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-18-hch@lst.de>
X-ClientProxiedBy: MN2PR20CA0036.namprd20.prod.outlook.com
 (2603:10b6:208:e8::49) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR20CA0036.namprd20.prod.outlook.com (2603:10b6:208:e8::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.17 via Frontend Transport; Tue, 2 Nov 2021 16:13:35 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwPm-005ATR-JC; Tue, 02 Nov 2021 13:13:34 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9eaff96-1f57-4949-3977-08d99e1bb944
X-MS-TrafficTypeDiagnostic: BL1PR12MB5063:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5063729128F4C6862CA1E5E1C28B9@BL1PR12MB5063.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X9tazJemlVDZ8eMIsk0wxqK5tsQ3qBd8e4iCQ2StFLNhDPUmG8xSVKKN8Qm1gtXbo7RfOQvqQu0RuOPV7xm7zoK7VrbvEvUma/Nv6XCsJY9qxHlfv38efR0gCSGX6Z+5YB6q27ava3jPGCBVYW+ZNm4vU4QCbjM8FTvyTt41Km1Q78kHskfvgQ0Vzj9eASc6JlrqJUOy8e8IHGbyz4Rzgtr6ZJTwvk5o5ZGMn2goeimbOP//e8i0lGKh86AOse4K+oHrHe7K/FwMxKGg3+QLzauakhlLlmfNQFAZxu6ikKWDw12yXCP2q9Ty3coEJrGLH4R8lbESIYPutMJrYCbTMfmBSQXMdAZF0sbWRijeDkCrFD372UPQqyA6pia8guB2YUWFBAnjWCPbPZ3YPz8fpdoRAkTe2VCVUcZI1CuH43FMZ8NjULUuzTC7np0tiWrJ8bFaoYy123O1kJ9byIsQXeDBSlWZLTyVkMoB1/B1MTjI8kaVtvMEaIxs+6tHYs7YEKHklZNjekGiDke2bBIyz2pEhATgQEFX9K5REdXph2GeumYbx4E01+A2gjQa/Ne3G537bG47zh9uUmiPy5Gl18P6j0zw25lmt+0/cMmyWcw2t+w6ScbNjHDG29g06k5+SLySFFld4cYl940Gbml7Bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4744005)(2906002)(316002)(83380400001)(1076003)(33656002)(54906003)(2616005)(66476007)(66556008)(8936002)(426003)(8676002)(66946007)(6916009)(9786002)(36756003)(26005)(7416002)(4326008)(9746002)(508600001)(38100700002)(186003)(86362001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a44g4N0D9sjtGPEbq6jjTWAGiOuWNFGjFfX63OUe3GF7y5tTJZZW1022oAyJ?=
 =?us-ascii?Q?tOdcZJHaOZpfe4gXA7/EDMIZ56GW7I+tnANBpQ4bERSlH7toUVDQYRYeWEMM?=
 =?us-ascii?Q?qIzscSb/OJbuuHi3zzatFpgwIlRO5rdMg6TvoemgTjbLxBljWoqGpIFsezqK?=
 =?us-ascii?Q?WCrmukqoCKm9IMa4TeWrIOFBNpwt+R8guDEPkESAK21a85C3ftwZBXwKjI54?=
 =?us-ascii?Q?GHnvRKPQTYXY0jyqH7fV6TTNgOipxHD/QE+flnlTMPir7g6rWyfRFSuNRazk?=
 =?us-ascii?Q?y+yaHojNVdRt4MKwxqiZ0CRGT9e/VeA6O1P66vOyhmjFPnswKgU1P+2OxVNr?=
 =?us-ascii?Q?Pa0mq+2301497P9B7EDWan8CPFawxM2wMlnAbUGcK/Gp5ZTNdSdLUtKiNFI7?=
 =?us-ascii?Q?MLrjMD9HtPNbMpVaW/Z4wTOGicXSUvFjKWRleLJIt4MUJzWboAwDadQMYtvD?=
 =?us-ascii?Q?XEhLfjWcy2NmvBcgVvZRpQn3+wtYJ/Rr0QZEXbj2/8MSIiJ+jIcJHTHcm4vb?=
 =?us-ascii?Q?9xpY8EkuQhsjo4KQfghnopt3HEJoUerYQxXNQ/gEji213atcnc+K9HLIM77K?=
 =?us-ascii?Q?9V/X4FV8c8nJ83sKKhr3HQDWwD+saZLRVW00/za32QYyDcvI/AhPSmFyevBt?=
 =?us-ascii?Q?IbDk0667YVN/e+wo8UTq/1zW4C/y+x3SjLbput2h3zN82HQb2MBf13IJQ7ji?=
 =?us-ascii?Q?AZKlKB05HUXX3BhWsEvlPdncRpaUYPCjymstYReHGMBobBJhkdog0MBp22tP?=
 =?us-ascii?Q?Tw1MOYL/0w1XnvnkZPLqJhuJypYtwp1I1LVC2heGHUpppOafxmos7iHOGfzk?=
 =?us-ascii?Q?CHGCZ/2HlBR6L7pocdFp0lvy0toO1tN9eZerAI52MnfhAKUoie4KahIF/SfO?=
 =?us-ascii?Q?EK0DsSRDjbCETniJgQ8jH504o3w194TTNguoazUToq3Shy59ytZWI5Vo55oI?=
 =?us-ascii?Q?m4+qrG4QB8lId42kwHasNjUjWL8TTfAyh6whkHIJDk2SL8GrIRT3FU3N2A0I?=
 =?us-ascii?Q?kqEzXarap4w6svr5xX0o8rsGCt/uuskCj2y3D79SUa13Hbq/0yEeyb/Ayy89?=
 =?us-ascii?Q?+KoMybDwBHzjqEeOR6/GP0AlkBRL3w4i9K67hVsJf3fEdwZkcBDMXJH0rwbZ?=
 =?us-ascii?Q?OHn/Src7OoOhTJGeb5tO7oUazKOa0eCshaEkeNo5m8w902bjrU1WnmJenZnc?=
 =?us-ascii?Q?WFDkVoop6HeWx3RUKbPrW7nv2weypb5pukrOtr6mZxPKR31HE9tShfUHlVJe?=
 =?us-ascii?Q?qIrQ1PGY6eFTBV8bVG+otcxH+oCtIBxSkMu7tVrX5Kys2nbmDPnLsXjm7iP1?=
 =?us-ascii?Q?4AxJPfnBejk8PEeyzBfVuVBmpTFSyQdQROVA/Le8PkdwdqM0ELmbGkgpA9ID?=
 =?us-ascii?Q?FyRl25FHqW/ZkS2QD0ycGLMjQVNuOFXuGLYECW1tXPk4oXDknbZQpjvUtBm4?=
 =?us-ascii?Q?Qc31oeHP3DWOBHUyBrUsskV+K2e0dHZmx7bl4cHwxsDn1jwEopEfneD8O4Mm?=
 =?us-ascii?Q?1xnJwj/tNG8h7Ct3GVVavJxenedMED9ITO82vNCSD5AyAd9i/0Ms27IPJ0TW?=
 =?us-ascii?Q?EwucIOexLIK5sUSM2VA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9eaff96-1f57-4949-3977-08d99e1bb944
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:13:36.0442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzsMIsidoDRBY5eipSqa4zlSblGnE/7NNl3H07HOXCih/hcfxB6wS6GH0H5rXcb1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5063
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

On Tue, Nov 02, 2021 at 08:05:49AM +0100, Christoph Hellwig wrote:
> Just open code the MSI injection in a single place instead of going
> through the method table.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/hypercall.h |  1 -
>  drivers/gpu/drm/i915/gvt/interrupt.c | 38 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 24 ------------------
>  drivers/gpu/drm/i915/gvt/mpt.h       | 37 ---------------------------
>  4 files changed, 37 insertions(+), 63 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
