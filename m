Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B299D541EFD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 00:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B714410F765;
	Tue,  7 Jun 2022 22:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EA410F756;
 Tue,  7 Jun 2022 22:40:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHVQ2m+4UiTntxNDMxvxeq4d6bUgTqNT6897JH0oqRH7XT3c8bDozB8xIPUlTf4OPKcATi0y2vY3Nhy9+naroNnX6t9CHyz7L0/yZqjgVkt3oqKrdmhG9NAApTyVJ9Qu6qic0oTiDHxAiB1HQXxClEAr4J2JewJL8TR7ifkJPzZFn88C9V5v1q/ygX+Vib8M23KxUypbYvkVayKr6x4nKmyUWzh7ZWL/jgo2kPNVwLL5MvCbBl5KPHgSrbbrV51BQ2tAuUQUOqR70zulv1245LcSjC1rxaaBsaomnDW3JJLhgbD1ByQocPhfRbc8ZVFAQYjNnH3EQJJeyOVib/tMQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dKPhgrcXmw6AIJJfudSaDYgE2dMNDFRLnleDGuRGY0=;
 b=dUAeX489iHcIrNzXHE0jh/0Y217/e5crZUaHl6MouTy9h6ovmZ9t1VH0DMx1f8Qb9w4TdXKtt4ym5nOUgtZ9kHJsKWLTKa+uMw7sS1I32ruRKtqnspAColPfnZnVTwEYnUfbpulXkmhdsAI7zVLxfatkwLoPIQo9cvDoLmO4EiWtNT6h/zBdFScBpb9jxSI60g3WxHElOq7Cb3J4NGfKwFWZJ+dI/Pvs8SmJA5NKkjgyGB/J1+1hk9NKDSRug44XO7EDfVcFbISdJPvqyjyid2zZ38kZM9Ua7O94P7bUD9WhNegiUM8neQA2VWi3rL8FFlJsmSbiQH/7TpW01AYprQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dKPhgrcXmw6AIJJfudSaDYgE2dMNDFRLnleDGuRGY0=;
 b=K+YmCIkEPa3qMo6SqhTzGemNIc8wNvh2egdz7JwmUWdD5yj0KSi331pbKcAqj/lWyP2L82S148afpYfnn+qD1pVANno62kaTtB7+I3lHZE5shf6VBErZ1RPoopqgslx1aL4UzXRgLDIyY1i1cRI36JIX7WfdsR4cYquq2JC3LeGmpCnjH8LGs/WelMY7EAeH7BAjlWms0aVde1rDRPjS4vMLFZ89ycIelNM1gg9Uu1tg/iPShZbbPVxfYISi2cRWXdYN+TCt8vc6DFbxcLdn3uvGSiIyGBqXFu5hJWM7F1IP4HtVbvForCfYbEWZhrypvv98/CQUygw7ILhhrI77OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 7 Jun
 2022 22:40:06 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5%9]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 22:40:06 +0000
Date: Tue, 7 Jun 2022 19:40:05 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
Message-ID: <20220607224005.GA805783@nvidia.com>
References: <0-v1-896844109f36+a-vfio_unmap_notif_jgg@nvidia.com>
 <1-v1-896844109f36+a-vfio_unmap_notif_jgg@nvidia.com>
 <20220607053955.GA8508@lst.de>
 <20220607115752.GG1343366@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607115752.GG1343366@nvidia.com>
X-ClientProxiedBy: MN2PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:208:236::15) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53ef0093-7b4c-4257-e7f4-08da48d6ab83
X-MS-TrafficTypeDiagnostic: MN2PR12MB4389:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB438921F42B56568E5DBF197AC2A59@MN2PR12MB4389.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pBpu5xN3n8iMFWHJffm1UxwEkiAmWfuo5zV6/kuzm57q3rRQDD812oNcZ2qKXT77tF2hHwjfqAi7pYJ94Xf5f6v6K3DJXt/j/M/0sEsC9KGd8k0ab91gQfbi4tjn7NTb1FvZBVDKQAWTwJFjfAFdwBeqQoyvW+5NzqAYgU5k3yymQ3SljVORaE9Dok3zxOvc4EOFkvzm79rgS9XhWsaTsGaTa8yNoBnI9YIHosv6wn51ycQmSRIlS1bITszKrSGVnKi1rletgH0K9tmJQeotwKB2om7d1FCTn9zcKYRZDOxOBcXTfrBw7EwgOCvyEEUTeRF2E9BEYvFm6u6ZKwRkQgkU8SI2kpvQ7DZZD+ZxZ0xSVnegZxAYLRoqJEG8rq/gPtKQrUcFEWYS0uojO+D2a3hNAuha7rRbYZcXlBGGPyzQJswcDKuItsEH36r6ai7WLcOiqAgYW/jVCPF7Mly2IK3sMlgmbS9xzcelKYaZ26NzbCjv2wjdB5mM9wzI2JqjgiAwXk0SMMBKESaAKdP/mB+nuTiFOrzB4mV+hCbgTR5NbxqninkCfCdWJ+gSEbqlQZiyuTindjpKqYu0STrUoQUiPz+ORLzIbX15fDS8GnqbKAeZT2Z/NSkHCeqpD4i2pJ6WK6Lu2hHhdR5XXCdyp/4D3Vezji2CIJyweTj5PgmA4rUbt/x62T9Gsbh7dPhizzld5499zg0S+KZ0DaH68g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(36756003)(2906002)(66556008)(7416002)(2616005)(8936002)(5660300002)(186003)(26005)(316002)(8676002)(83380400001)(1076003)(6512007)(6916009)(54906003)(38100700002)(33656002)(66476007)(66946007)(6506007)(6486002)(86362001)(4326008)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F4RYXfppcgKxC4r3ewhH+V0HxgSX4VnLAQMJuQIutYRmPARH5U9ZFdG9PVXn?=
 =?us-ascii?Q?C9ThOWL719RlOmkgYVfnyHq7D36vGUKRKZiMw1hq8z/jqyPSsfNSsmI2YfqN?=
 =?us-ascii?Q?nZqWStrc/UWRwqBdUggJX/gsVv8VWk0E8lFtD1bqX6t/t1XVjuRQIq/Jvatf?=
 =?us-ascii?Q?pPFWPAi1SV7nYAOnjt2/L3Qrcc7jCXgcATAyXzdeY2ObMeI+pasluU8MyWS/?=
 =?us-ascii?Q?bY6eNIRBqBEO7QDHCqO7PusBLz5Sy0N6t5VUk+lHlXctBYXDDAy2Vjikpwpu?=
 =?us-ascii?Q?niSFozQzHowlq7uSI161zlej+K33gikkFkQJUhpDqRgzeUu++dEITmQIYRcw?=
 =?us-ascii?Q?Ko42NVjwmFze5eVs/Szby02isqF7yj0q/zJNqJyD6BG2zVEcXrpktoDY2PMN?=
 =?us-ascii?Q?6jAC5DSEoC/H2yzDR6jnkvpMUhGpsllELYlmU7G3CYS87VO29fAw0lU3JAIC?=
 =?us-ascii?Q?Ebr47aeVoKW//CPCtFelgvtZrr2O03oXyBwExLdDV3vRYjO8/oIlHK/lTc3P?=
 =?us-ascii?Q?iD7SiGU/334vu7LfdZdOToZVAUOWK7MxEXow6FiMeWd4DtfuSdlGyMsWaN0O?=
 =?us-ascii?Q?miaZKe2MPKheQFqdp2Vl/QstUCK8J5FDERYsbjzfgZLGZhSFkr9K3zzrgFld?=
 =?us-ascii?Q?J55CI8I/cQOWqm6ZQ+a0TYaID15ycLj4bCC/YCAS9dmx/os1gUtTWn3W25CR?=
 =?us-ascii?Q?pd7Bq+krbAzOfo5neqhrMuO74N4xY7Vyg+AwRUGbcQmwh2J2beOymmhLoyOu?=
 =?us-ascii?Q?ntXklGPJgPPnNBlfYfaPOcyKtZmdRfN1mAqEBoRz3lHX/rlZZLXUOlibjEGp?=
 =?us-ascii?Q?ubYtT6PXB5BlxM+FkYmHb8PKzewSDX5xRrWUgcnFkvObQQz4zTLtANiekd9g?=
 =?us-ascii?Q?MuSRgAH+MgSQ1AG2iU29spHAMXnvsGVDxS2vUlsuV+MnLx8SZXuZVTI2zdNF?=
 =?us-ascii?Q?M2PteKasfIb/0IK9CD+dblFrIh3T+WC/JQncfTvLzk34ZkB39iS9woJWm4eN?=
 =?us-ascii?Q?0loXNCyCvf4O+95UEQz8oESf4WXeCUVc2MR/BbCa+GFoo5Y8wJEl3Wt2L5Xw?=
 =?us-ascii?Q?99hDedFrxcMZ+7h5Krwh0KWhoiFzw0kZsmw/FM8RZ9iiyIF9Ew1T5HQmPSIZ?=
 =?us-ascii?Q?SzD5jXtqQoMwlnnd4vIiS9d7UjeBoXjM7FzR15EHFFbVoI/QpvQm4ULc7Dcq?=
 =?us-ascii?Q?POceqmCgryJuDSJqaEHvY6bMKtRzG2TelkA2CgobkzCAikHopVTz7mWroHee?=
 =?us-ascii?Q?9SD3vIfBAeY+pfrramdUCuVh+AbNfTagyOqCU+evDv0GrG1dzjRD3iXTzYWW?=
 =?us-ascii?Q?lIY29X1d8rwOZbTEUdhmIQD32pkkEVUdoPaNbSWoZ/3IIvGyvGZFh8meVY1g?=
 =?us-ascii?Q?W3n4aSO2+zIUIxP/51u0pxd/3qj/+s6NMQKFrcurwZHNcncxFakLH+EJx+HL?=
 =?us-ascii?Q?jH8T8gF1gncHBrrXmNt18bYOCRKnGl6Yc58v2g32R0KLse+/WGpu+7sdvA/E?=
 =?us-ascii?Q?FwYmKnfjZLxlw5qdJNNSWi11GO9uS0fjjBNsb6OScSivSrESyDvTbaD2IOfC?=
 =?us-ascii?Q?lvWogkcvWShe7wXFBDGs/V0ARXmsHs+sEf0gRzSpTia8+t2+KpeMntQLA4de?=
 =?us-ascii?Q?FgIO/ZG6o7i0CcO+1zZxKaWFduK26OSO9vLGTVSg3+5dpBjwLt/ez/G2FM8W?=
 =?us-ascii?Q?4NFGAN/C+9pwNmsmhCnE7Q2fdmc3RCEPIogXcmc/Su/PUEkxB2Z1vX8ACW/X?=
 =?us-ascii?Q?hHOelr/AOg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ef0093-7b4c-4257-e7f4-08da48d6ab83
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 22:40:06.6439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYuvMPqa8MJIxshEGc/s+XBM5E8LXYfQeHF7U9Uq4YqcdFi7JV/yHoolQk3uUvVy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4389
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 07, 2022 at 08:57:52AM -0300, Jason Gunthorpe wrote:
> On Tue, Jun 07, 2022 at 07:39:55AM +0200, Christoph Hellwig wrote:
> 
> > > +static int vfio_iommu_notifier(struct notifier_block *nb, unsigned long action,
> > > +			       void *data)
> > > +{
> > > +	struct vfio_device *vfio_device =
> > > +		container_of(nb, struct vfio_device, iommu_nb);
> > > +	struct vfio_iommu_type1_dma_unmap *unmap = data;
> > 
> > Using the iommu type 1 UAPI structure in the core vfio code for a
> > subset of its field is kinda weird.  But we can fix this later.
> 
> Ah, I did type this in at one point.. It was small lets include it in
> this patch

Oh I got this explanation mixed up - forgot about this vesitgual bit

The patch is split in two: this patch removes the
vfio_iommu_type1_dma_unmap from all the drivers but leaves the type1
code as-is and bridges it here, the next patch changes the type1 code
to direcly call the op and deletes this function. So this weirdness is
fully deleted by the end of the series.

Jason
