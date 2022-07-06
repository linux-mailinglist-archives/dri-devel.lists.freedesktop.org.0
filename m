Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6F6569199
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 20:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603F310E97E;
	Wed,  6 Jul 2022 18:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F14C10F3D8;
 Wed,  6 Jul 2022 18:18:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPnjCVrLTuBZtzVcFPYDvlqsmB4QBs+9IqVB20z8dcDVGdId67+jfB8/OcmD794ENhSUx9RZxK7sBFZQ9rgDtpfHKMFvI8pwon/Lnhps7d/xa/4AnpukQIeNgiLGt3hvFdxXwarfaq0sOLZXYQsuEze/IRRv+uhj8Rt00WGRRody5yCg8CvBvXtfIABTI5XnH3FENdY/IeAcnbVvNa7c+y0bHucFkO4wIi3rs5wo9tR2rJMAyxWK+8AVha5ewcsL6eWMGIuO57N9DCWaRMlwIBL/y/8AdRjJ93/l7Q86bx3BXQg82FmkmnlWrnWg7/PnVCYfYzxJ5avO4DLQqQE1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMNb6Gd9xeLGsPXvzyvZnidg9BndostaRgV2CEO0VcE=;
 b=OvF2di9g+MtsxYV+mm9u6d++Uer53njfA6cVAcvmI1otEnUtPbgiBwlPrmspQbOd7D64beiUCUcb9NzYs3l4OwhP7C7Y+j/dJFK9KjBHj4cf7/g1mgCVIR/uAg4s6XVmfoESDZwclvuSTuMMEfcBAfzCC+Fhe8+P86+h9n8C0/8q2alQ4ShCjdIo3Pw7WfaVIR+a1Rqql8lig7jN/1Hsk7glVP3Ya75t15Y7vdpn3UAIPPKDKllwgPN9sFTRHQBr4/a4YXBOzBI4eU3C8zZTcgqfrpRsDcSPwCY4Cxic9YGNq1UFg4BfINLJi2sqbjur0x/jNGi8oimdUCs06hMaMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMNb6Gd9xeLGsPXvzyvZnidg9BndostaRgV2CEO0VcE=;
 b=IQ8uR2kQmoeEED9rj9pVWjuVBKbopmrT4roCmBzLA7F9IdwRLtU5sPpoEBlp0i1Ern8MHewoF2PvSNBkqbJ9m1bQVU6w+W3xAKkMTlvlo37ScalPNeXEEgZBVlQRNfnmGOFgj6wQIhUGNh+aGm0qppQKBAPyQczN40VRceyYmakoRXsEuBJuhIfR3KFlHOs2Qqz3XQRZCCRRSKg1lH1oeymRiVKhaPp8LDy1cKUatT8YCIJQ/Ko4igpyXlgKFyiPi1gAhSbjiZ2JCw+Q31QjSrpdTi8cQk8jERPKrV5VlWebCAc6GbV4o8ETYrA81ZM7SMF1qXJSP18nLCxO3TXCzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by IA1PR12MB6601.namprd12.prod.outlook.com (2603:10b6:208:3a3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Wed, 6 Jul
 2022 18:18:12 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 18:18:12 +0000
Date: Wed, 6 Jul 2022 15:18:10 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [RFT][PATCH v2 9/9] vfio: Replace phys_pfn with pages for
 vfio_pin_pages()
Message-ID: <20220706181810.GQ693670@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-10-nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706062759.24946-10-nicolinc@nvidia.com>
X-ClientProxiedBy: BL0PR02CA0074.namprd02.prod.outlook.com
 (2603:10b6:208:51::15) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8207b41e-fbe3-42c2-8022-08da5f7be2e7
X-MS-TrafficTypeDiagnostic: IA1PR12MB6601:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jttkk9mPpHSzsoULSp5i2CvHVEq2kHxnr9j+OSNh2PqecARo1i2xAWgsG++q/0ks9lK+6UTItIKWIFTdnWWxLBFufDxTuCejvSotmr5RkUq3Pzi7wtD9CtTGibntX+Wy59rryA/wCFO0ydDmiJ3Roix2mPYO//d8Fb4kzb0nKaGVww1K0KW86/M25zuQShLYkw3SUpTrRqvKc9IWs1hqS76cM2sYPutnnx7vVHMQ86Pm1+AwLUd+vardl2Ad1kT43S6QYsGnl7WhZtyh71jkVUL0l3J4ERTGJ27qcyclpfuSmcRaC+z+uNpr2ivguCXy5rhREZpMxuPqTvZysuUt+kJBpimtOSKBUEzonqc/Z8mi3XUbFjZ/VFDCcQTMOUgwuF5v6ZWIDv9QW9W22cNJZKoRIYNDDkX3dpWdWccgka2fh9JJzk7Nhg9mWiHnD8xHX4k8nbtqs40zdsdgVfXnq1K6PE080gFWefBZOgOB41IUliroHC1FFhofS1R83tV3EDn8yd0EXGbcefy1bNRfMz2Alarexjwpe3KmUKke/Iuc6hVno5tJPFafcBWVKJ97htY0NrvN4dwK4AddHjg9OmS/dTQ2A67gHSn71T3jeI8Yr6jCG3nUVPk7QJPlc6Z6kQ14/XFmnPIdQIkC/E0os9qCKtBmpTvbwCMobsH0LaluHqoLC4jZwMO9cNOJmIeNih0ERWDa1IqFKX04g/RGTMx9pqho2jDFa5Rhy2VgjeO+HdMRlfOs5kFm/Mm4P96Puf7maFiyGZnHdnmEFqmcX6lmfRW0VQtAe/xQoIDGadC8LSMi9GzUgGtAKtNULABC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(1076003)(66946007)(8676002)(4326008)(38100700002)(7406005)(5660300002)(66476007)(66556008)(7416002)(2906002)(86362001)(6506007)(2616005)(8936002)(6862004)(6486002)(478600001)(41300700001)(83380400001)(37006003)(6636002)(316002)(33656002)(6512007)(36756003)(26005)(186003)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PyhFlks/ERCaJ2+h/dHFP90aRbULkoWUm8LjUuh8nrm9qCx25lftiNk3xkJe?=
 =?us-ascii?Q?KI5/HX0373LR4e+PKVFiX4kHMyQ1xOVXTLxDacpa6aod4amiZblMguuJMz7A?=
 =?us-ascii?Q?rlKJlskseFraz8XLmfe1EhVuKSIkhLfHFwEhKRNLuYkPqzovRCiNleYXyN4K?=
 =?us-ascii?Q?IEqYS30Chpf5xM8I0wLgYdgSHqiwXyGBcebwLGay5eOqXSv7jIafHTsagTlv?=
 =?us-ascii?Q?xAleETOPVuoi8dNmXgcmx7kduJpPHKP52B1W3tBPikwwCeJ0z48sRTkFf8WK?=
 =?us-ascii?Q?6WNmFSNnAJeG1GLpBI/PQVEOTueBjfew7jh3eMWS9pdG+GGlAE3iisHVT/tX?=
 =?us-ascii?Q?Vrn7j2uDc8XIxAAkFVdOpyjb1KZuPFtcJmLuwXitUEqEOKECFWNAo97eQMlA?=
 =?us-ascii?Q?8Mh0kkPR1LYxKdRKKF3cybKi+rKV/c7zcIDqyoxoVGX/bRRRC+6FG6fSiemQ?=
 =?us-ascii?Q?rjK9jG5Qyf4DpZ4fIjzKX4PJVE7VxihOx9B2cyhWvmjqnYGpNA45LN6oh9IC?=
 =?us-ascii?Q?PcXTvG0diPQsYZw1RLlrW+CETiIzVgPovJ5jXQP+MSd9dzXoZJ4ugcN1/tzY?=
 =?us-ascii?Q?fEq2bwK+g+/3W2Z0GKEedizxr/srBZ7Q0bxEbnw5TUTNtj7v6l2/T1PCe6DG?=
 =?us-ascii?Q?SpJuNakUd0fJZ8rqKl7Z5dmdQlE4JnTvpXX3QywDwbCmv1fzmnLv8iYITPWc?=
 =?us-ascii?Q?EZcnAgtMNrH9e/xGJlnR5cbY0jbNVBwcbOW/CcYtGX9Vz1w9RTsZQ6qRu04s?=
 =?us-ascii?Q?9B61mTeqkgTI9qvuo85RqyEiY+FOaug3QoBALfF2oDj0N1QXsZDXaohn+AJ6?=
 =?us-ascii?Q?/YUsPSw3ozLnEp3Ky8mELqwueDC4UxHvuwJ7k7Dv4qWeUUMi+VfRfX2lsp21?=
 =?us-ascii?Q?U8yV2wQS7+RRDHTgnTEC+9pe1/rBSm50TO7vpwSOy/MT7IwT6137ide+Yfem?=
 =?us-ascii?Q?NPy9d1y+OM94NN/5yEGX/b0ptQwe7IlnkPhUea5rveIC6xcTBhntZ9Iq3JNP?=
 =?us-ascii?Q?t3NLBIUAwobyLvxPeyNWNxD1sXQkZtNiNN2IgtoWB7zoiirUL38qrXx2EbWt?=
 =?us-ascii?Q?Wb14HImN1I8BL7mjNTf/M5nnJsL2pUypQI7zVXQF50whH6Ppc992Hu2B4zAk?=
 =?us-ascii?Q?rgeMw8kRUPZkiEPHg7REUoUZOayooetXacfIQqY1PaxuKjxD6E9JAluYfqkG?=
 =?us-ascii?Q?OQ1PiTjqf46/MsTNlagUpaGHqutWlxTtY+YNqgY0wihNWhhWD6O2Kr9Mdm1P?=
 =?us-ascii?Q?TBTaUhVyd1vmwpKlAmQoQLNsEC2myFOp3oapCK951ZzYn0pCzLqm6nj2WrkI?=
 =?us-ascii?Q?PiO6FgiBvX57RmcEFvtDazfQVj0KFqUvyA9HwNmbeAtvaW+aryOYx3E16La3?=
 =?us-ascii?Q?ZIFDcxvvB9pe3z69ARMchfb1SrLSICI289BHNzEOs4uPloIq2Et2ylx0osr8?=
 =?us-ascii?Q?WEfSC75XLx7DTzK9Qv8Xv5e5Tvh+WAB03Mt/wMQx1+uAWFkDoTCMLe8Uem9v?=
 =?us-ascii?Q?VRuTd1fB8nK5iW0jr9zjoPs9lRD9gymF4tN71j8sWNwePtZxqlpuk44Bw0wX?=
 =?us-ascii?Q?cr9nWQM3ErkcnSOmxg75aj3PUy8zuskmnwdHFXbJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8207b41e-fbe3-42c2-8022-08da5f7be2e7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 18:18:11.9878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2eUvxFAUVxGMGVUvHsNX0h6pmRelLngx5jxWHot0QX28txwvBQtpSXyHfZDPleUb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6601
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
Cc: mjrosato@linux.ibm.com, linux-doc@vger.kernel.org, airlied@linux.ie,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kwankhede@nvidia.com, vneethv@linux.ibm.com,
 agordeev@linux.ibm.com, hch@infradead.org, kvm@vger.kernel.org, corbet@lwn.net,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, jjherne@linux.ibm.com,
 farman@linux.ibm.com, jchrist@linux.ibm.com, gor@linux.ibm.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com, alex.williamson@redhat.com,
 freude@linux.ibm.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 tvrtko.ursulin@linux.intel.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 05, 2022 at 11:27:59PM -0700, Nicolin Chen wrote:
> Most of the callers of vfio_pin_pages() want "struct page *" and the
> low-level mm code to pin pages returns a list of "struct page *" too.
> So there's no gain in converting "struct page *" to PFN in between.
> 
> Replace the output parameter "phys_pfn" list with a "pages" list, to
> simplify callers. This also allows us to replace the vfio_iommu_type1
> implementation with a more efficient one.
> 
> For now, also update vfio_iommu_type1 to fit this new parameter too.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  .../driver-api/vfio-mediated-device.rst       |  2 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c              | 19 ++++++-------------
>  drivers/s390/cio/vfio_ccw_cp.c                | 19 +++++++++----------
>  drivers/s390/crypto/vfio_ap_ops.c             |  6 +++---
>  drivers/vfio/vfio.c                           |  8 ++++----
>  drivers/vfio/vfio.h                           |  2 +-
>  drivers/vfio/vfio_iommu_type1.c               | 19 +++++++++++--------
>  include/linux/vfio.h                          |  2 +-
>  8 files changed, 36 insertions(+), 41 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
