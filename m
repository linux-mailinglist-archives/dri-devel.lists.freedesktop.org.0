Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B056918F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 20:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF0610F318;
	Wed,  6 Jul 2022 18:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8C710F318;
 Wed,  6 Jul 2022 18:17:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nD0mZK/iWrilnkplbeolFnPUtzot9Tq48dnUc5hnqqd46ZE7b21+ClT2hQin7nodsLpmRS9gapNJ4CoIW9NuySvUUIarwaBt5zgu6tYGlvfwEea6LiKy2gpMbcoFDt7WatDWn3hvFS7SALc07LObsXkJcMlhwhXNw6axr1wdXpgLNEy+Dv3PqkNEqnKe2szPJbp+a/H7hUNQzW4A9u6weKivC1iI26k8MwanbAkrRqRvamX2O977ecmPgGOsWmjUaOB3v/tHyP4owHQcJAt9lK3TnrAtrANQxoQ54twiuG906FyhmZIx0ONP3jAiz/QkbBGo/rMJ1Zs3V09FnzIu9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqqCaJUTDwkQzINKh1omiIkhvxtSOljICtjbbMkdZYc=;
 b=hCqzOAApaRWSvzsvuPOUXEKyyEer4Kur5uVoUosgduBsvj5/XeOE3TLtJWv4Y0DMpzG/47pQZMoMD6MT6mDyNj75+jmYHXr/v9ol9E7sLR5THp9Izp+BGXsCzXmyCCbY2z3Pn9nXifdJmC8UNANt4MGJmXEM/iI2vZJkCi8CgkXtc3ry/r77Sa48SR2PFfUSf8AVf1YCSd9qQ12NThXuayjXvvuPXe0Xs7ya88oaZVHIHSStPasGOZI2n1vSYdRqLgwE2PJAQvtYun3J3wchYPJv2vr03LgR47G9F0Obe6awbPbfFaUEKv3hG1aePGkZ4fpBF9Wx8oyyymzU5G9RHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqqCaJUTDwkQzINKh1omiIkhvxtSOljICtjbbMkdZYc=;
 b=RkbgEhTQBgjXp0//QP2/R1wDlsDBSNH6WnZKv+kzKmuT92ZDD31wSt1wCwkZtpWCAQyD4Azn2dfmJL3//mO+/AscWhiii5n2Om5KSssUrbUIL6ZGnRPF65jcQ9zypRZa9ufrKxJBH3t8wLKMk0Shh4vZXEObMsEMn9+9Q+Y2nIFTeJH7NKbO2kF0tcxtSTE4TvXnqqm/4AiJnNp8z3ePbUAlTqkxZAfCLtKuSzr3PwezCZKUPFnW6htPWvyBdaXh3sE2J9x630NPkIY63NqBh8wjIEgBfW+WDKeRaVqakxDejAYoJp2O0hNAxn4PzQkN+SbzRZXd++tXE2+ryma/vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BY5PR12MB4952.namprd12.prod.outlook.com (2603:10b6:a03:1d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 18:17:05 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 18:17:05 +0000
Date: Wed, 6 Jul 2022 15:17:04 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [RFT][PATCH v2 8/9] vfio/ccw: Add kmap_local_page() for memcpy
Message-ID: <20220706181704.GP693670@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-9-nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706062759.24946-9-nicolinc@nvidia.com>
X-ClientProxiedBy: MN2PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:208:160::24) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f95bc4ff-7b64-414a-86fc-08da5f7bbaf5
X-MS-TrafficTypeDiagnostic: BY5PR12MB4952:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2bxRzMFuYYft40WJXyfzt0IkuKUb2W6CkHcVeeagcsTs8/UkPIJhTaBEl8O1AJMfbqOJg3cpeGkZx3gI2szskQIMzwyt4fFcqm8kHOr9nEGbKKYOQN9XInuszWPXSRef57gLqjcScNB0IHsYw5pEOkBB1J6i6xAQ9TPB+lk5UfRS7GuF18W3ie9+5IMQRDoPWdTXiOrtY+Oxg9boKZO/6i6UH+BPh+NExTqEdpwWjFRlrmpPRr2iWsMjCmofWZKNcStDDs8ycsFTHCf6+IKOxUeF0SWAxUP7h7TO8obSQ/tAZPlighgQ3rJ584Ark62mj4cIWe5zUBeWZrR/LGCXzF066UPoA0q5hIRngCL3js+I2y/mT7AfwhADARHsw+BkEm0HMcPkUf373NrlorgswSqKF7NdGQZNonLVJsJYLfdz9+9U2vq6KH4zQiZWBJil88ZFZg4JAeHDtcIReDFFLfPB/UWar0LLcUVL1mCaH6XdepIo9T34U6eYX73JMD+G0b+tjGn6xErea8yQHd9xRON72MWv73wPWrl/Tkwj4mkG0wxe7a1qsV2aOVSP+gpZ4ECCkHjXLJl/ZBQfI0VblhJpgjFhWGf/J1eEZ55BSZqW2JRnFXQ8TKSCG7aucjGBONb5mvc6AhfGGihfxA7eT2NMECIAo0X9UnFjDsasr+xgCj42JjjucYBd7BHhxRHjjycla5zhJ+AI+1dy+zVe1ztQT17ILTzGqLGMKoIHT7hFcq6okbfVj53Z6ZiEx5/yZXXBW1PmO3qI2SvHsFSyqsG7yHESOj9yYz0/Q7TvovXEQxEO6SfQv8gHR9AQFDYR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(478600001)(6486002)(38100700002)(2906002)(36756003)(2616005)(1076003)(33656002)(186003)(6506007)(66476007)(41300700001)(316002)(6862004)(86362001)(7416002)(5660300002)(7406005)(8936002)(6636002)(37006003)(26005)(6512007)(4326008)(83380400001)(66946007)(66556008)(8676002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FW25mylLFsUnbbLT8GuwYAGaEQioW664t5vCnay2iSu3OQd+2u6/DkDH7qjI?=
 =?us-ascii?Q?Ek0cV7i3JV3XfPNAQiP0fJBSpBlDjcMfj3vjEw8J5EglI8S4rNWf3Q/6CcD0?=
 =?us-ascii?Q?PKphuhVwMhW/zIJ8P2fyM4mSXn2XhdP0gVGmlS6JiJ5JsnwatjmqQXzLqW6/?=
 =?us-ascii?Q?8oZZlNx0v1M9XcZUibQ0QGddVr+er4SdkukNda4sWU0Nsti0x+mCxm1SFLFa?=
 =?us-ascii?Q?zmPPMrul1K1850oHJ8W93Ka/loHPflZsVweFobJvR6Nb826D7qD9O2eF33wF?=
 =?us-ascii?Q?9WhAkDEymGOuIYTV7C+y52GdbHkQufFhhfSXp+zmNh2Iys7DHbPEcKl5IkRZ?=
 =?us-ascii?Q?jrMXPUDUjV2zPnIRRUqpn6Bgei2Hyr7bh6kv97rlOW7x9BTytq6T5gFIBpMn?=
 =?us-ascii?Q?O72FqHPxLPdxI9FN1T5RF6U8RILFYSa8YxA+LyVuphpf3oV6RosFpL+PxU26?=
 =?us-ascii?Q?zRzkRWMYkyNS+BIEcKCifVW5FzYaWDlyDtnL+AW2ULPNXS0+GL3zNS+hVqfA?=
 =?us-ascii?Q?5X6YZc0lWm4KkYNKJHlnYMdlOAhUeNWCQrZsjvI/SSd3m03MmS/zhAJrxLlg?=
 =?us-ascii?Q?9Kx4RV54uVqTCCGe0quqNkvENMv2Yg9fKI+DXWHOZOOC9MYiYbP0gVlzowxJ?=
 =?us-ascii?Q?J7qb2tfS5rJY86+i0rOd1QsmvMkyHh+GsxB382TB10kP8jf+3OA95njmd2ZY?=
 =?us-ascii?Q?QrY8DcKYGSpAnK4msb+4657yOkD6dWVArRy/uXEo/kgsG87u959niHCmwE+6?=
 =?us-ascii?Q?EoZ71IgHr8niNW3a07Wt7Hb+ciDBBxI6iy7NYiG25kZd6LXFDKv7qdHabrzJ?=
 =?us-ascii?Q?eBRbe3mczesu2zUY/76Ru701DXuipJsGCD4Wlo+nSN9fFy/Ssz8U/INbJeth?=
 =?us-ascii?Q?14vk3iAxp6Baq9u7hPYeQjKnUMuYof+Fg/nwyMDyOSTcavDMieO2gegvqC8k?=
 =?us-ascii?Q?ugJJJSTDhnyf1PrQKcbTTHhGOd5hV1l+BhrGwAiuEXldi9VTovGXi8BO86a2?=
 =?us-ascii?Q?J8V/APElEnYOVpD8G80jckvZFC58djyjJ5Gt1c9XL7vKOV/ef/vHXkkEMA6p?=
 =?us-ascii?Q?sdMgTlyrmYMUCitcmUVJScnqc4/IVXd5kBtFSvS8tE13cpgmPtDqbC9kBTkp?=
 =?us-ascii?Q?ylikwLBxW7QyngWXxjwnj5InqZeQPC99Gk0WBVwTtYkcr7Rea5jBi1U53gwP?=
 =?us-ascii?Q?ujCBJyZo0tACXECoFdKdhPR6RTafIkGRrpnyzCBLvnT7hdK1ZRESfaZmR95A?=
 =?us-ascii?Q?KQeHbq74sUkqs9yeCLmdgOEG3it+pYLB7iqJ8QTV/Lm51L4j210r0oNBQx3Z?=
 =?us-ascii?Q?XK0VsxaOSwGuAGr+Lh2Z+AR8eHK0n7e30iHOhI0VFBTVswsMJuRfHqGJpL+s?=
 =?us-ascii?Q?obc1VyF8phOecCuFcV4xMdbo202FhqdDgDO7vWRIottkcaLHcfOsEerXlwwq?=
 =?us-ascii?Q?k8K1OCvuEDvCmscIzpcGzO/JTV5kH1RJzHyU7IIZoHMTqboq4akWZOM25q9K?=
 =?us-ascii?Q?YYIPndM/Z+c0yigTr7ox8EYtwduj5Yazolf4jkt5Qu2IP39T+FbsI6KPNQsF?=
 =?us-ascii?Q?DJROoXT8hGBDA9SENdb66Bl7G0HQFRtP/QevXP+M?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f95bc4ff-7b64-414a-86fc-08da5f7bbaf5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 18:17:05.0646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3a+ZyPY2LJd01cSjVrtFF5jWPWm/L5Fn056qIPPu+4tBX7vzDUfK4Mn7/tBjEKq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4952
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

On Tue, Jul 05, 2022 at 11:27:58PM -0700, Nicolin Chen wrote:
> A PFN is not secure enough to promise that the memory is not IO. And
> direct access via memcpy() that only handles CPU memory will crash on
> S390 if the PFN is an IO PFN, as we have to use the memcpy_to/fromio()
> that uses the special S390 IO access instructions. On the other hand,
> a "struct page *" is always a CPU coherent thing that fits memcpy().
> 
> Also, casting a PFN to "void *" for memcpy() is not a proper practice,
> kmap_local_page() is the correct API to call here, though S390 doesn't
> use highmem, which means kmap_local_page() is a NOP.
> 
> There's a following patch changing the vfio_pin_pages() API to return
> a list of "struct page *" instead of PFNs. It will block any IO memory
> from ever getting into this call path, for such a security purpose. In
> this patch, add kmap_local_page() to prepare for that.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/s390/cio/vfio_ccw_cp.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
