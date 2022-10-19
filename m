Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC2F604E5A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 19:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071DC10EB3B;
	Wed, 19 Oct 2022 17:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD31310EB39;
 Wed, 19 Oct 2022 17:15:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+6V8vxvRZI+ZQfawB/po2SZjFzYhK+YfB6P2VJrfsfolHIqJFkoMDFwcADs45rJ3/9SZJiyu6tsLQUNb8zDauyayF5TK8ZGm2zmpTynPd/OKD9t7/lA6wkQHA15pwwT8Svlb2jKtixxg8n4BsVmzddknfouOfwQFG/NFgcZbsYe+J9ojiEiWCuHIdnq2i7jztoMHwiudPrgRIPRit4f7cI4o8F8CFPqkaUgkrhkDr9HFCLZjVZbkXC9Y0V9Tb2hbBLV7bbXzMYwkHH9bTRrvNhKHkj57huf9Buk4nTW+kpSy+uRnREn1ckdrsgM0swltDD5llvdjmH+fQa7VPQrfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moa5J+x8ZOwrrGnqC65CPwi0xigEEJOaQhiVe8YwbGs=;
 b=cL31vsr+DXK0MvbHffxby83lo5kh7Zm112hjh4+IBpsFLPGXTqxDdpgZ0usKZsWflvc8JxeziuHLfX4L2wFVi/o0vCNr1yWJ2vP/x9WLI3bcYNNT2kUwYTD1iMfKO5qlYTll3yMnJ8rbzJuH9k3ZkqJBzwmJthfDY96idB0MU4kVqCCOh7OR+HL/lta1GyEujHCfIsi+qAB3X4zNwg6m/aBA1svuC8AsEFUnqK5qDP43QgDbm7z/cFnUIWIXLxwd++VWA/xqqq2XKH8PLgy1VncrfOLfLCZP2Y9SctuZF2RwOwC4zdZSL2EitA73yfYdRHoSCnk3JrxrGgjU409OGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moa5J+x8ZOwrrGnqC65CPwi0xigEEJOaQhiVe8YwbGs=;
 b=StcR7+ve5FJ+TMDjeV/j8Nz+BOpPj76G2Xp1M2wvmG7+d4ULHqk0EuQ8tB86Yod0I+vgmQMMv6iVRJIbvrDgCIZTnZW/cIfZJQIdScBiELxV2AhR/7ZO8bxLrmQLWDtpJTUPNH9RJBZ8NkwZp5XHoPnFB6RWrapQG1SOxkXB8oRU2kGYj1QPTBOfglnPN5L/ZAsKark+MOyuqI9eVmAkG1ExLB6xpT+QotE/ZkJCpgrCoxbjJuxD03suz0v4RIZyg3w40D3B7NPCnvup+d3oxfozsPptAcevxMul5JzIsRt83NvHG2ZLRVQXlkwgxj8RqRlCMwXwNl3y8E7XOa+r4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 17:15:32 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 17:15:31 +0000
Date: Wed, 19 Oct 2022 14:15:30 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v1 6/7] vfio/ccw: replace vfio_init_device with _alloc_
Message-ID: <Y1Awsh56Ur/cDrHh@nvidia.com>
References: <20221019162135.798901-1-farman@linux.ibm.com>
 <20221019162135.798901-7-farman@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019162135.798901-7-farman@linux.ibm.com>
X-ClientProxiedBy: MN2PR19CA0037.namprd19.prod.outlook.com
 (2603:10b6:208:19b::14) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d74008-cb3b-42d7-f916-08dab1f586c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aEbATsebNcP7Fg61ktbvHtNSf4VjYbWBwED6ckBY0nGL0qp15sSu5otEa1YDuWeMu/8TPuWU7/SA9LzAKKvaNQSoKhh7tcDcqTx886d2SRPp+nLoITTjzuL8nzEPdAvEqodcIZ9E9b/lTTk1Oa31v2Kl6QmxslKVT1GMbRq+YxQKqymTgqOEYsTXrxo5slj2SZL03bunwwM6KLSCWwkY+HBYqzKQ/XRNCtv6mg3yLfUbf9x7YTsnG9h90C89cvzFJldBoGmlaK8Lm+NEjyeSMBj6pcv4o5ELyGrv2P5R8g78CntUpcOxcfIDvuOcf7Mu9igcPziTgHizbvBHpAs+SyzZM8L/6ryW3W4QU6IaUnjvjZW5u8tk8vb+geEoWO2ZKX5CkI0MCpdqFS1XLdM9g7cQvD6bVR5HU1icz6rYhmmHRhbEtfQJUyVSRRlfrkfXiDUFufhvwqBM+1Ply9EcZG3fl4x4Y/SjG/gW2UF7CZ4+7+cS7IcIb1GYd7MxDsK3wikgcLN7O0BCZs0I9R9cdY02JJciGcWLajYxAeFC/cXJWOEL3lhrfMkyS3K1RxVnCeToHr8clw1N6PzblUuoh2r6JgdavcI+G5k7FCpQwCgAlDWo1uc2Xy66EC+QArKRrAe9h+9dlSnj6eL9MChJq0C897jBDeS3/1MSXgBs1htyhG39ZdPedDa2yrmkWuBKIz/NQPuvX/+YtJ5D8EghiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199015)(36756003)(86362001)(38100700002)(66556008)(316002)(6916009)(54906003)(7416002)(5660300002)(7406005)(4744005)(8936002)(186003)(66476007)(2906002)(6506007)(2616005)(66946007)(478600001)(6512007)(6486002)(26005)(41300700001)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TJnT5/dtaW4Qrq4V6mVMrzYp/tYa5MdjXOvNp3b//J1sHuKEIr7aJrUM96eW?=
 =?us-ascii?Q?DQMcCBM8T2q1spaCSmysQKCvA8FyZ+BgWD6c6aebvNeJgqtWHwwIXvfIhUAQ?=
 =?us-ascii?Q?I17Q6gY3QHS7ABC1e17l3Wo2fpk60cxarf3C4WUekQtCZQI4CwBjBYwaCvFv?=
 =?us-ascii?Q?sxD1dbI8aSfdyjK16JW6NQgaw6Ynz1xhXuIlDbX2GPcJm0lTeXzZnnaiUs0A?=
 =?us-ascii?Q?Qi8veOaCyQZGkuRsi6Z/2r+Rb5NHDZ139a6m5ClS34ErbWMDZJ+/0ybVx3Af?=
 =?us-ascii?Q?aAeerw6tph5wO+orCaTqt/1ml7J1J5b2X92tem119LROemKq+ckdHJ5wPQvp?=
 =?us-ascii?Q?G5dlFyHN7y8AN6YsNUx581zb9Wokd+IR5zJCPixrlC0T+BIcMD7Xfi8QK1Rl?=
 =?us-ascii?Q?P7tFt2lFTBY+jCFZB3H87pYxY6nVli0ggX56HJ6ftvfEDQkR2Ezi34FNzVNX?=
 =?us-ascii?Q?CmrdselhMpiVOW+XzokVOhqD74WjxpzwKWseqagTlVQaWFbbIxkYCn6L4dKn?=
 =?us-ascii?Q?U8/h0JSYcZYQoQdO1D1d8MvjxpRxUigPS242p4lqH0TjkYs8hThXULurfYpq?=
 =?us-ascii?Q?xd/Ixu3qlygrBq+HmVG5x8pKwxg0F7gBEdIUC0rdwAT1TISOrsCQWCWCRcgy?=
 =?us-ascii?Q?ndnIh7hto3y10vKcKoGgdH5UG7p1HrsiQm4rxwaSQ+hk70KnjKM/SrJholDL?=
 =?us-ascii?Q?BgTeCEtvrCvW+BvARxWdzPD8Ml2QG2ejGpArUDJmJqpp+tcezdHB2LVLG3ne?=
 =?us-ascii?Q?XiiAvXOay23zdQSH4X+sqMkG8kTlWecFvgDaL77SKR64EZg/Pv/UvdSSo10T?=
 =?us-ascii?Q?W1Raq2kACl9PVXoxUFBlSQxAqbDBSZesWTrtCYuqp72ek57+Czm7i5N9wrKC?=
 =?us-ascii?Q?LOSSujhc3urweC9yQbZcW6clyZV4DbJE9MrCqSqL3L1hNpFq5HnLumNZoiBF?=
 =?us-ascii?Q?kWlPL/5m/fgErS7VxDKK+pW219j2dQPAxIkK2SfclJAyjb+p5fe1itqCIpOx?=
 =?us-ascii?Q?Oq0v5yNUGt1ZJTee7MIN6JCzhnqXZEcWldsNjoUpa1U9N1SX7Ik101fFdVIP?=
 =?us-ascii?Q?7tL69YATnj2NzqscFbnzVscFA3Yd99dopHneWjGzB0qsEGU/jEHL1ERc9Cr5?=
 =?us-ascii?Q?yUqxlT3ZGWvPW8zCWr8gx5lIQKMRXAsiK68GM1s6fgMiKeayTePwPS4s6WdL?=
 =?us-ascii?Q?sAmjUFVd5LaXlPPCK1oB919PYNz/Hkx7WOiMzS/SRBKey/ttda7PB9vf1AEP?=
 =?us-ascii?Q?8Qh83UCOFd6jeInj0XAGuZnF1EK4buDsphrqeS4rda+wBqsA1ntJqba3eh5y?=
 =?us-ascii?Q?fJ7s1wZKaMHAAxVzEqPVEZXg6GDO50iGz+eO9Q8JPt5iMjwoCcHdC4BB+Y/T?=
 =?us-ascii?Q?KPVIoC4a9XumVnZZQ4MEj1XymLHP2sWBenU9Nc0IVswNenoEyHcscSvvolW8?=
 =?us-ascii?Q?U8xj067uf7zuO4Kvj6WuzxtU/WXGXKK0P+ltOokvR4mWodYUBQQYzqCfFoYO?=
 =?us-ascii?Q?i4srC9UPbEhz5iQ7omtZlMAGrYb80ZWNMkGtXQCmUFiBLx/JKR4uDAYd6Spk?=
 =?us-ascii?Q?wl/e0MdALHPcNQ6AqIs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d74008-cb3b-42d7-f916-08dab1f586c0
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 17:15:31.9117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLBsXjG/earih/mHhaf87AYpyLZueUs1LoTMGTtfJf/ra5/oLKMdwB4GOICsvT4L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 06:21:34PM +0200, Eric Farman wrote:

>  /*
>   * Initialize a vfio_device so it can be registered to vfio core.
> - *
> - * Only vfio-ccw driver should call this interface.
>   */
>  int vfio_init_device(struct vfio_device *device, struct device *dev,
>  		     const struct vfio_device_ops *ops)
> @@ -422,7 +420,6 @@ int vfio_init_device(struct vfio_device *device, struct device *dev,
>  	ida_free(&vfio.device_ida, device->index);
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(vfio_init_device);

Should be made static as well

Jason
