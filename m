Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4076451523C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 19:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3561310EEBA;
	Fri, 29 Apr 2022 17:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08E710EEAE;
 Fri, 29 Apr 2022 17:31:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFYbaTyV4UoiAlILjj4p1gO9C1ncR3ajqbU9SryplQeGRCzFcxktL33rZnGMft8lznNd/E5QAxOMN4qA1z+RlfoXLJZ4cLkSd9GmH9TjZc9VEgJal1dr+4iYY87u4WX8xQ6e0DjIc3ypdxntDRlEOdZr+ucZo+dyvamchPHml0uEiM438uJN8Hnz2jn99EpI9lYrcL9bDVcelU+jZspE77EXuS1fr08DwEnK4Mt7enaMUYTyz4DQqFGDAtMneA43fEFq8HrpXmPV4HYEg7FtWILicZEhKVZdN6TD2ALlDdRW0o6+ayT8fBZQZrRikVURvy92i259g6onPv9rnQnJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loBg8TDRU/AJEwntPMV/vSCsD62+uhauWWmP8B7p+OQ=;
 b=XGQej5Oy5z7IL2ngIPgCXJEgALicGn0O7ZfpcG6Yy/M5A+6eeWaRKD4nLDdjRpvcdtyKruvsYeR2RKc2Z1oppaUODAMUbsPvtFrF3HskZFQQLfE6bKvshWw8/KzkyRkSi/hNzvXn3la7EkmXxPWI/doibdnad2hIE9n4xdBzsNNmEHdV1AsFTmduscP+uxytAX+T2LbLVRhj71OLWMZBUEBTA257F9etd0Ubw/xipWsahiLaGmUKSzXEHj9GmxBKtvee43tOw852RYV6qth32pJXBoOLS2YiaeRyHuw+mAZltPiGkWex4lZmgqlIlQuGMzeVsHV0le0a1DTEQNlslw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loBg8TDRU/AJEwntPMV/vSCsD62+uhauWWmP8B7p+OQ=;
 b=L52v8ySEwibv3uM3S4rvf7Mm1lfj4Ev+5SYl7REJwf6LgxIa9gM6j5DjCscW6Eb5HYdzmJg47Y5LpuVolRGcV7fuYE3NKsJ+8aWAZ0crbRxE2R56ZHn5mIeraxBw//2Hd7rcLyeQCB331bU1Oz+LmJ63AhbJRq6g0tfgmUlCq4Zr3aAN2poyL+O0XTfFrOWO/0TDPSba91O74li9uCSXocYOStWW3pPDPHPaDbaUQWg1x4Kib0YOdGx5kw0D8A6gJoTyQ/BdBw4AKofAJ6DNHxtme+xxFe0KsmmZV41d/XftmY25NvUTKtmUbQKcFYHqGedQfDqXscoqBuD5b0cETQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB3872.namprd12.prod.outlook.com (2603:10b6:208:168::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.17; Fri, 29 Apr
 2022 17:31:50 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 17:31:50 +0000
Date: Fri, 29 Apr 2022 14:31:49 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 0/7] Make the rest of the VFIO driver interface use
 vfio_device
Message-ID: <20220429173149.GA167483@nvidia.com>
References: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
X-ClientProxiedBy: MN2PR15CA0007.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::20) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7005c64f-b4d1-4e11-4d69-08da2a0624bd
X-MS-TrafficTypeDiagnostic: MN2PR12MB3872:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3872CA8C6BD99BAF2557A5ABC2FC9@MN2PR12MB3872.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8szwqHaWxjvocDem/yW6NjZag/0TK9hRDYmUNMdViYygFCJrMSCPJDe3rhr3lLL7qdl4653ssbv51DVjBnp2Et/BgPMsQFBzHTCQhVwFKCDizqaWl0/C0XIbNigeDBqsIeyajbN4CGpDL34Q6RallMB8oeSYBqrqJWtP8gmN7Ps4dSgjCKqX3qmbm3OFg63KNLISGqH1kvO+5bT054s5obXJfGZp+Jp0Qw/zodsAoDy3WGmsM2e0g/DMskVrJBEX38+0Yw4mfawR674Ol2hdC60o4zf2upsXAllVlBxssYGrpGxcED0YIs9c0cabbj6crvhl77e9D2IX1Wk2ziohUJW6r1WDkC29YHt1lMBbVASgfpHTOjwn9BwS1dntbuZTjevo7nx0eWdWqLhPmrhMPdL2Q30gbyKFW5PrdYdssQmFugYzvBk6ZoLc12VNDlHoHCREUr8cMHegt45N9f/6l2AP3wn23RduVpIRsM3IMWoouoz0u398rd1RHT9TmD0cAcOPtM1pLyd2KgMjw7HBs4Ezy1oJeSpdamNeVwAcUbfxCW1n1rADkUsUPNnEZ8adUGY1e1KOU3g9jhDo18T+EvXlcKqdN075awR9C2iVYRCHMuS8XAqxWT2juqpZGk9FSleetoJwZ2R1f0GXE0IvWAGAw8L5758EmV43OWq+uzXAC6/Mn1EGTF1Adm+CnSSBg8G4/RaUmkj2Me3QO24x3V4IsCwx6q+BLF0ANYN5iWTd2QIcHmzspWA2cgH2lt+WeKy15ph2KGOJHWylusy/tNbd9FrPSnHtsyFzsvg/3IgojmwqcZkm1OlTHyFdOX1g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(8676002)(4326008)(36756003)(66946007)(66476007)(6512007)(54906003)(8936002)(2906002)(7406005)(7416002)(6916009)(316002)(66556008)(5660300002)(186003)(508600001)(6506007)(33656002)(83380400001)(2616005)(1076003)(86362001)(26005)(6486002)(966005)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4DIksMqoIaFFSqO9n1WsmEQtB6Po/mnyZy1fnVOFBX038zyNU0OSfyT53acu?=
 =?us-ascii?Q?8DStCscojglan6Z/FgkN315mVCZ6ESjLlZ3Is62jYj8PgMuW2xCBKkJuxAX+?=
 =?us-ascii?Q?G/HHX2UtkP7f1F/Xv5ioTEIfQNSUwXgHmGFM9w6228l7sUkxZl5N5zO6hO53?=
 =?us-ascii?Q?WGK/F9hzpsAxmQhMf5HZ6nC9HImfO812RO5Yc+Phe8l5d2nNAl3xrtU2BF9z?=
 =?us-ascii?Q?9wEBpIBhy6jPQSrA+Y7IW7d4hHfshmzqGL2ly8ji/6SlFHo0iR2GSg9rXJIP?=
 =?us-ascii?Q?KRfEOaHRYXVkTGqSmBrS02ADCOPEjQE4Di673We2chXk5TGTUeUd4pCB2QEn?=
 =?us-ascii?Q?pV1NVw9fuXtlMFQ3t38vveQp198n4P/iVIa58br7SP28lvk8qtJ56pIZsTNR?=
 =?us-ascii?Q?PMt819EPzu/uexTqT7gp+wKAo9Q0dqTug/3p+UYSWCia2oFWQLPXFLFzoTy+?=
 =?us-ascii?Q?JQXVre7v9Gu0MtBxK1Nm0H/6gtgCxYGkG7KJNTAmZZVAa3NckJUhlzVX5k2e?=
 =?us-ascii?Q?+YlR0kf+Wk0pSMNwMVN4+6GLO1xLkSYiBoUTpj/hqvMTa2jkDVud1z9XWOdm?=
 =?us-ascii?Q?UMD3h/IS3sN+fyrXguHyspSN2nI+K2fKXxceJPIoe8MfsI9DxOOQpFXhjtqL?=
 =?us-ascii?Q?3rw09mnFyloJ/BFBgu8wkgKoBDUaELVC1JmRPD/WAZJLlDaO95D1NyhegnRt?=
 =?us-ascii?Q?dMZWrzd3+Q8iTJZeQQhT15wFhwtgF6iA732TiOiD8IZbAt9e8txrI8oaA8TG?=
 =?us-ascii?Q?rk85tlLlAJdiVPZmIC6YKilZNyGiZ/ZXgGgMi8TiF5FVxeCoAJQfNbCpovj6?=
 =?us-ascii?Q?T57oUFNGKMY7e4N1AZGMvM/Ej70Ile1Fgcjmj98N6F4TGBaSA2+lxw2fAza/?=
 =?us-ascii?Q?pVYPm/J/cG3lE3PXxeudnWCtxpjGpwwa5z/GO0/oDzkkQr3v0qsllsGDwcWr?=
 =?us-ascii?Q?spHlKLrYcsvyROH9wH4y9QLqFCXUxI/1ge3Pa6LCb9V42v37yPJQeLGXRYzf?=
 =?us-ascii?Q?NIv+oM+COlfGgsBwLwwEbOJ9PaBKMcataN6VCtftgXhfQF7JSwUOmcK7ek5i?=
 =?us-ascii?Q?hEbCBE6Fy8SDgkaqu113RynQZOEiwacJQ5iiCW/0fr1369nyNCYlQOxPquch?=
 =?us-ascii?Q?R6+P74ExHNL4S3XH0ZtUCqG2iag/KJKhdcG+ru/Zgc9nLO2FvbpkAHz/TRyA?=
 =?us-ascii?Q?DySEfedRHkXjkF+nj4E9Gl4aSDLQyCF+5Um2ne35gQmgdLq0XLweu6/pfwNo?=
 =?us-ascii?Q?rJ3rBIIIcK1Ld2xpHorwvsbbab/3hdcpLueDYrVw9qUvHf2jNdHdts16JaCb?=
 =?us-ascii?Q?5ky9EsKscvOMSV6PTGIx+BJnCCT6NAoXPcjHxCFHk7BCIwQjN++XfCZSnbq4?=
 =?us-ascii?Q?xJ8oT9HnCd/beioqeDIYUFdJ7kkkVo4rh8iPaML//AafNXgjZGahJSne7blN?=
 =?us-ascii?Q?pE/2uM7HhvKvO49UOXHx9c5psU6Fq52+g8J4Fgr8aYNhjLCZc9qkqeffQfpm?=
 =?us-ascii?Q?O9o9wWI/4SmHDdCO+iVmiKchnXpHDczoOCXh5rflT2rutrFU9qDxqJv48F1Y?=
 =?us-ascii?Q?WHIBXLPN1qmLtHxoIBs17v0JqN7Br3V8u0spcOv+ygprUCoUa+ZMrwmA5t6+?=
 =?us-ascii?Q?yP6HnsqLNP5GThCOE5EtgKDiV1jQJt+Ja4OnxBIfJ6bBuvRqT7OiGnVDd1Tx?=
 =?us-ascii?Q?a5qEZfWZh0XkKKL2REJy9nC1PqU0ZCOKA32iXD4fFMgZLVMBZgxJ4v0cCvdi?=
 =?us-ascii?Q?5iBWSAaVaQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7005c64f-b4d1-4e11-4d69-08da2a0624bd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 17:31:50.3089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIOuZY0Wzo9E/Ruyrcq8ERjVyRhSsvIuyprTKRqStEsoKgn/rwGTNTzaHs3IJKEo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3872
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Eric Farman <farman@linux.ibm.com>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, "Liu, Yi L" <yi.l.liu@intel.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 21, 2022 at 01:28:31PM -0300, Jason Gunthorpe wrote:
> Prior series have transformed other parts of VFIO from working on struct
> device or struct vfio_group into working directly on struct
> vfio_device. Based on that work we now have vfio_device's readily
> available in all the drivers.
> 
> Update the rest of the driver facing API to use vfio_device as an input.
> 
> The following are switched from struct device to struct vfio_device:
>   vfio_register_notifier()
>   vfio_unregister_notifier()
>   vfio_pin_pages()
>   vfio_unpin_pages()
>   vfio_dma_rw()
> 
> The following group APIs are obsoleted and removed by just using struct
> vfio_device with the above:
>   vfio_group_pin_pages()
>   vfio_group_unpin_pages()
>   vfio_group_iommu_domain()
>   vfio_group_get_external_user_from_dev()
> 
> To retain the performance of the new device APIs relative to their group
> versions optimize how vfio_group_add_container_user() is used to avoid
> calling it when the driver must already guarantee the device is open and
> the container_users incrd.
> 
> The remaining exported VFIO group interfaces are only used by kvm, and are
> addressed by a parallel series.
> 
> This series is based on Christoph's gvt rework here:
> 
>  https://lore.kernel.org/all/5a8b9f48-2c32-8177-1c18-e3bd7bfde558@intel.com/
> 
> and so will need the PR merged first.

Hi Alex,

Since all the shared branch PRs are ready, do you have any remarks on
this series and the others before I rebase and repost them?

This one has a few changes to the commit messages outstanding, but v2
didn't have any code changes.

Also, what order would like the different series in - they conflict
with each other a little bit. I suggest this:

- mdev group removal (this one)
- Remove vfio_device_get_from_dev()
  https://lore.kernel.org/r/0-v1-7f2292e6b2ba+44839-vfio_get_from_dev_jgg@nvidia.com
- Remove group from kvm
  https://lore.kernel.org/r/0-v1-33906a626da1+16b0-vfio_kvm_no_group_jgg@nvidia.com

All of them seem to have got enough reviews now.

I have one more series on this group topic and a few little patches still

It would be great if you could merge the gvt and iommu series together
into your tree toward linux-next so I can post patches against a
stable commit ID so the build-bots can test them.

Thanks,
Jason
