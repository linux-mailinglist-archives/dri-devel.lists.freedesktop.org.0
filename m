Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D631F569111
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 19:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2403C11A295;
	Wed,  6 Jul 2022 17:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5B911A1B9;
 Wed,  6 Jul 2022 17:49:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cB5SdIETHRGYkFI3tgV9fPsnElHfdKTk2ZdXCb7jzIlE1zNsfpLOJyPj7jDdf2vW/fjBV4GwhB2arwxsrWKBVVTLMIdPFJPBYeJv4HT0/KiEIwjAdDzFnwMBqVgMVPrM6TnPNb4nUb2qTz1WqJ0K3AbrZY6jjY9DJ6qy/rjNnCzOSXnspSRPzhddoWz9EYJavuacky7APqJ5e3mwKYkFhg/n8kcwTnY9P1VHaFdf0dC4cNMspmXmkf8uJnzACkAbSYk8884/NVGN6DEmSjI3O24+hzWq9gIYQF1lqGqzoyS+CmM24DcxBGQlG4NoqUhe+n/dQhTrdxd5dwT62Ad7xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkGUNaPgBfrHEINrHxbknatFmfH7HqvpCq2TWtVLctE=;
 b=czx1zhQb3OkrDjWBiBnt7Q1LMvLNMLUIgpb59rizbLvpLUuE+tDBX0StVzA7800SqY6DOHj7eedBriTIYyBCGq7Hseqv9OzZa9xgjQhc6fs82sdHGSsUWKwfh4JWxKv16F9GWhHcN5RphjgxYTwfJ5FT94w1dFuutG1MrCIXPzZFeHoiHAca8Q3uKE9iw1zYK5zZQb8Lf4vbAUXKvEijr83liop2MrE4EgO0xNEs5sDprcJrLtkAyqL7yuNvuGCGCgYx02xya4/8KCfhrS23qGvsPv0DFosCLZxTVu8l89c1JcZkKmXtN/2hztpYHVFY++IDLk7xoPpZqtvFDofulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkGUNaPgBfrHEINrHxbknatFmfH7HqvpCq2TWtVLctE=;
 b=BKfBuaWcnllwddx/CIzZMymNkrbtewVn5I/zhKjDhpuFK5f6u9/kZbmTlBNoadg6cVX9QMTSJJ7+MuD4RAvfJhkTxgD9UqS6eKCKS4JZhie0oCghlsmJslmhNQNQEgiYHFOBOrXI3wwAFhQa0FUeT6p573qxBWNmKpZsMaUFMn76ZXJGM5FsJdTl1dVw335gngMZmIQavMzaQWQcUw0SlTkWF5Reyna9qGPOZwTSG7pbytvVf1wesUyHLhs+dzMX+Gk4ICG200a4n9bxraEkGOAtuBycLDRvP+CvkS/yf2Scv8B0glyuTKBbD/Z58ayJuLOAGuen8+3zCIUYecIw9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB3821.namprd12.prod.outlook.com (2603:10b6:208:16f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Wed, 6 Jul
 2022 17:49:24 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 17:49:24 +0000
Date: Wed, 6 Jul 2022 14:49:23 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [RFT][PATCH v2 4/9] vfio: Pass in starting IOVA to
 vfio_pin/unpin_pages API
Message-ID: <20220706174923.GL693670@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-5-nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706062759.24946-5-nicolinc@nvidia.com>
X-ClientProxiedBy: MN2PR15CA0056.namprd15.prod.outlook.com
 (2603:10b6:208:237::25) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ace99795-eb19-4b8b-fb0e-08da5f77dd58
X-MS-TrafficTypeDiagnostic: MN2PR12MB3821:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fWKd+BL1eIkRJUcqLNvSA0XzvqxrDDNPLb2CAhWSvBr7q+vcXh2t/NFR/nKaluU2cJhl2+VEG98o1nhTw4EJvMJRO/dCC2CgDq7A2McQDW3d+BX4rzzxHflWaHf4+pSnL5M/4TowzbRkWntNm8wG3FIjZxj40B/MogbRIH50IztILD79rrdeKsNXhs8qS9bCRmsNc5v2IJZMiA+yNhM1OjY9bT4o+6NAqVXL/AI9rgg3D20NVnhhaCtvUDAvuWhFHkODeCCLoEy2Xtf39JQN7D2m55EoAi/FCFN+B6TuDZfThHW8HOxDA7vWjZPodSRCUfmKvbM4Qh+PeWerxnBczbB0ij4U3vUfUnLL3LhrKt8X+KyWzpsDSz1Ec9s04cIPbB5DXA+eKoo52qZaTPT6ZOsxmuYjd1gBXhz+gIMI2OBCFJ3zN1ZLpxMfQEOrB3AfLI1JTAQIqkY9GJ1XAxbbabrT3uzd79VZshhQIqlGThscPPyqNKfzH72EP27Ae+u09HqUswXN3ayzm8d9QKHH39HaSR4pEQg2CAx/rC/jQOLieshI8FS8sY9TpmKyfAwWqeOXO1Mhdobsx8QmWhye/31R8UsKF9ePdyTmE9jR+Bp2WspdGT5xOWTuwZdBGaVJC+Jt/3I59CncdNRgF5WKQMvgvKZmMdm347qkTmz8AufIQZGxcz0L0Ilseaa3qOSiLVivzTwtjSsr/a5YBrN9+9u5G4r6Kjuc8Ny/MqAeyc/jLhoLnPXy1bfWu6IzYV/KUFVBILXCJdtMJE/1+OODQnld5KUXFOLfDXz7AdmS3mRWNIOOGQhMmnbmJXck6EEx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(366004)(396003)(39860400002)(376002)(136003)(186003)(6512007)(7406005)(26005)(2616005)(7416002)(86362001)(316002)(38100700002)(5660300002)(1076003)(41300700001)(6506007)(6636002)(8676002)(478600001)(66556008)(2906002)(66476007)(66946007)(4326008)(33656002)(6486002)(36756003)(37006003)(6862004)(8936002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ylebMxc3sFSRYR5L7t99831UOIxTJn5R9Gm/CM3b21W90NPOZ+NOUUkVdyAC?=
 =?us-ascii?Q?CGGjQMerbQsY5be2Cj3soX1Zk0cKhlAsnhK6WOU7/b1O5OQ27HWbC+4p0/Bm?=
 =?us-ascii?Q?TdO3aWFl2VLxSbd9/Mk5w7FdZ0Pi96Dg1Shu/i3MC5R9IC0Jam8hjDvuSe5h?=
 =?us-ascii?Q?kVryj3Ori4UrPvji1Mq1Slr2PhavgFzn3DKA6VcQvEhudihPE6vfweTReDek?=
 =?us-ascii?Q?cRjl7BNa0WXbXz7pu/lrpH8uUR4q6IR1QqNgirRRN8EzTQFM3Lspv+/oOd9E?=
 =?us-ascii?Q?eDAgt6lq9MJfogAAOAwNhvPeHhpOpF729iXVTJTRndFnTySHo0cN1CfhxAiW?=
 =?us-ascii?Q?COt4COsaTSl7VXgZINHqAv1f9HgiW/kHmvFdMVK9OtPwOHb05XV3dX0yadw6?=
 =?us-ascii?Q?iPmssrrnSpP+UhranGso6XjZOVlCsgllsV8hijdw8y1bS7FVIxjV3qwKxKR7?=
 =?us-ascii?Q?FGvtTM8Rzbok/h/Ua5Qyfr7v7AjAwnvJCGtAlZVf5vLcRRM1jCuJtNP/KbzT?=
 =?us-ascii?Q?PN5l7kgTpqSYnayxawU1JPeUCp6TVlS0pVao0iMMU74myyhaDrHZ/Rcho1YC?=
 =?us-ascii?Q?Jn/gIPWLkKwe8J0WH2YGuSMjvhUMw0bwWFAlJcmlNS5aSyDM+FwaX1Eyn65e?=
 =?us-ascii?Q?fwO0IfO/BH0r1ujWC9eaGTGyKPOFpTXFooD0UIZq6KjkfSFIiHuGTglfEus7?=
 =?us-ascii?Q?RYHHonL1rUYUJUF8YRhcRVkTnSRHNgDAQMHfYBOOBicglsrnghxvnh0Vyk79?=
 =?us-ascii?Q?4NFATfog4Eg8T0KeUFZgC++LB/X2RBWtc0jfREDvuvsJ4Q44XfLjfY1XT5De?=
 =?us-ascii?Q?d9GJDLq2cPPiyxMoGwxkMBn1hlcJFN+LifNENlVkG57rRNXYSegL4HltQvZq?=
 =?us-ascii?Q?WRhdM3CpfPx5cWhzOYrWQHor91EGmZd4+TFvohuCDwNQ7wa1hTY+3RTog22O?=
 =?us-ascii?Q?t2t7dIxRsLTHBs2VsUTxAUUxJskdmiTvIzLzuLVMYHsGsOcBfMq753uG/NdB?=
 =?us-ascii?Q?nB4fcGn8WNvONFUdO7FiPiwn+Zgz8i7fhcPJEtW5aqb0YLAlXjCAkParTYcE?=
 =?us-ascii?Q?AeIZKcHxvxrD7Cjci+qkFpKs57IEDYY9J8xQRtLveD0sbQDzHZON5KWheMlI?=
 =?us-ascii?Q?bkHxWN8od1uyshplSSVzTUdUFL/fwByUouhhs6tZYxqbl5S/UMDhxPdn/zA/?=
 =?us-ascii?Q?AroffvMWZOylDXcXKcjx1x0D8T244CxueIx/ByaSMWEF88cLcJ+dTgkfrxxq?=
 =?us-ascii?Q?KHBpkBzXpwmgOHUy8ndlob8dGKz6h0t021oT92NcvjXq3fWknl8hyPdfpwVo?=
 =?us-ascii?Q?Go5sf8/mqDi2ZJjKJn14Y/RmTzdhQhpMULaWBK+qLAdlTbKL3Kv1FC8pI6Eg?=
 =?us-ascii?Q?aKuXPwbDzXTL1RlSsxdQ5JdlZWiT5mW7Dqe8K4g59T29qlQN1v2gRfM5Xgf6?=
 =?us-ascii?Q?iBgEzJGwEtojdDdQEzofqP622Sw78Fjlu7gerYYAQkA0HaRHIatVjxsDRqAO?=
 =?us-ascii?Q?1RF57o2thKhtK90s+bh6vThrn3Mh2rhzYz7sH/4HM39rOIkXSlSlD/NBc7N/?=
 =?us-ascii?Q?2DsE5U811KH5PrxAmSX3chAEf79pmoSvAT7+7HBS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace99795-eb19-4b8b-fb0e-08da5f77dd58
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 17:49:24.6939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JGywEs8Hvg85+LJcvQDzceikp8L5gx9lpNBIhK+GccnBX/2CQXBLWdy2bKTUqXr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3821
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

On Tue, Jul 05, 2022 at 11:27:54PM -0700, Nicolin Chen wrote:

>  These functions call back into the back-end IOMMU module by using the pin_pages
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index 8c67c9aba82d..ea6041fa48ac 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -231,16 +231,8 @@ static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
>  static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
>  		unsigned long size)
>  {
> -	int total_pages;
> -	int npage;
> -
> -	total_pages = roundup(size, PAGE_SIZE) / PAGE_SIZE;
> -
> -	for (npage = 0; npage < total_pages; npage++) {
> -		unsigned long cur_gfn = gfn + npage;
> -
> -		vfio_unpin_pages(&vgpu->vfio_device, &cur_gfn, 1);
> -	}
> +	vfio_unpin_pages(&vgpu->vfio_device, gfn << PAGE_SHIFT,
> +			 roundup(size, PAGE_SIZE) / PAGE_SIZE);

These maths are DIV_ROUND_UP()

Otherwise,

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
