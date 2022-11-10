Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EAF6248AF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 18:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030AB10E765;
	Thu, 10 Nov 2022 17:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA2510E765;
 Thu, 10 Nov 2022 17:52:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQqKJYgyBiCv/uCZoiy2I4TpDnbVhWEtvmhE7EZwETt+DqpcI/bGx9HDsZmmfaoVSzIJJ4MXxFK1PvRnVgWu0iVhr3xRAfg17bh6PsyCqYdAk7xTj9j5APdRiMVJhKa/5Q+60JhV3qTs9C0gFbCTUaeFgfTT5RhWwoOIXvg3uV0eOcDh8RjnyoyuZpgEZ4Np6Xelbn2Gc4qt/DptXFeBYHrRUSY/Z5CxHGFx7FFuXa/5OCk1zIOqk+GBr1vls8+bmT62hc/snm7FDvG/ehAfKPwgd1E/aL6X8gNp1rqNwLqb5xhqL38QNR2u8MiDnyMbIKfA2KewSKaaUNyKW9ADvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JbzYuTfN+Gc5UEm3r0QzNY3bufN9b77BhYIkCTdv6E=;
 b=gXdvWk1dAokJDt89egr9Q05+J7L8s2m30aLUu0+vrPxazjC9vtpuqrRScrUQr4QMO10/PuPYkybXsioIZcr7hDos1M/gt1VjMuKpZ/Vty9NBAyFiY2fZNnFl83/ksSJ6AcVeLvmFR7hiEIwvT4zogqtRfDo+9R/8fJSyEGD2rbmoSptUKR42ouotYTU1iyINPUmHy4qU88jrVWpMZDSrqbSHb+WExnWF+fGaruFQfs8S0MfCt3wbthKpbsPkxrTCGpyZY/jaCrXVz3e1TezhJyIA4NBpKkiWb3R28wrF5N7qxwQAz5CDjGN69B6+JaB6Hjh8ipjiJMqXrXrD1ou8WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JbzYuTfN+Gc5UEm3r0QzNY3bufN9b77BhYIkCTdv6E=;
 b=cTkaFooUdZlSq7Uhf5oocauX38wQz2N+8qZBBtaYG0S0roVUcVLVUSqdhfg1YFNwLZzKnFJFMD6MfxGVBgnHiql9gkgj4xSq1Cufxx/6LAuiy9pqNGbTkZ5Xczt1IcQNbA5gZW+18vNp3+53XEsUvlPUO26YBg+1pRs+DZHO2N1x0GGaWPMpeljv/h2gdUG3ZKp8EvSp9W9zCpf2qjt3GmUGqcWx7l9TE9pU5mD77mUk5YVhx1DP1lYduSPfaUlPdBdZWhb4SomHc0noidqkov9z2c7eJnM/rmod9GVPezweftYbM5+/ET52Scn6s3EaL3DCewxhAiNruNUKPRv3Qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB8037.namprd12.prod.outlook.com (2603:10b6:510:27d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Thu, 10 Nov
 2022 17:52:40 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%7]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 17:52:40 +0000
Date: Thu, 10 Nov 2022 13:52:39 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 10/11] vfio: Make vfio_container optionally compiled
Message-ID: <Y206Z5vMwcyQK7d7@nvidia.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <10-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <20221108152831.1a2ed3df.alex.williamson@redhat.com>
 <Y2r6YnhuR3SxslL6@nvidia.com>
 <20221109101809.2ff08303.alex.williamson@redhat.com>
 <Y2wFFy0cxIIlCeTu@nvidia.com>
 <BN9PR11MB5276494548F01A42694E366A8C019@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276494548F01A42694E366A8C019@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: MN2PR16CA0004.namprd16.prod.outlook.com
 (2603:10b6:208:134::17) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: f2f47a69-bce3-4f85-9028-08dac3445c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uSR/TP6Bw3mHEiTS+qI38/blJ+DPwLQGXBB5R1z80o9zfxwmbsrWCtx7yqOn8FCnnnHd2C952SoXE27CKfqaEMN1CukCLddLS0pi8DAaekmrgxbHxK0tRIMWiC8Y+CHsgL6EPTr9vuQlhAXcvt/1nZ6WNZrj8yINhpVVWbczOmR0/n76T5yu7rmqVv735d7Veg3V9/1PMeXD9NEhpm/TzGgvr0PaSRR0w9Dfo8j8EBysYbHUadO3eRCuXnobD8ZbjUcA2wHqedbQo1vgSylEnB9pL/T/XRh7JtXWOtUmckeJbiqo1AS9uhoF4mcWwqyLbc8bJJRHjApk8LGz5z5g35oBC46LKYf6oSvEn/vVyug8iJCN2ZJv+IxKef6oTtPmhplrB3XlBMYmrm/MZuKr/6BkLJSSGUPrZNRxtdSU6krVfekl08cqiy4SwrPNUGbLY/ZZ6F07sdfSB/XC5EUQTj8r4h2VpmUO0X9gtJEjMehJ63ZVaBfh3kdKEEq/O5GCIRxvjovw0il1VH7hLtU8xu+6vwoqRG/9kwZ3ztfcG01/5bg7snpBRutYHkNAeb6y91tZ6n5U//HrBoMqOb9UqaU2LgbBbBYRIwsMrom2NCT30Bi/TH1W0SdqEkiDCuVrm4+OXSoMvtA+vK6iNRymuIQp9zlR0ksf0euvINPpFPjQGSzm2fNViYOerd51b8ZSQJMuffYv7XwHYjPyZm8juQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199015)(66946007)(8936002)(2906002)(36756003)(7416002)(316002)(54906003)(8676002)(38100700002)(41300700001)(66476007)(186003)(4326008)(6916009)(6486002)(7406005)(478600001)(5660300002)(6506007)(66556008)(26005)(2616005)(6512007)(83380400001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EpePv7KkyJyH5m9xB4PlaBxMUZkQZkGfMj9Ge40E/RerqmTsPYLVKZUJNAyu?=
 =?us-ascii?Q?RyW9y8GWr5bSLMRp3/YxkcZKMO4wuDaUmz2+UYDYpJTCOsKzEvcEZaOLNqMc?=
 =?us-ascii?Q?5vusdtMl1S2Wxx0+6UdGm2FrshPz5DJiKs1bxhytsgSYne88Cvrn6+Pit0Uw?=
 =?us-ascii?Q?HE9ZWR0J3Kol41Qjb/pUNbATAUXEFdtNl/P+3uHumJxl6QZmI02K80pe0GSl?=
 =?us-ascii?Q?CSc8gxnnZ6ZHlCr6nW243xm+8cQ81dot0r0kNBFUYt+Kact6ntwO2ocy9VkI?=
 =?us-ascii?Q?/IaHhFLiIxDyWMKdIOmofbn8D9p5RGzJLvnYGrAYFbfL25+UVnoXauW+iTA2?=
 =?us-ascii?Q?hKR8gh9qP0+pRRuWBGRfX7BDF1K6LYrT6Eske4Ge8FPqA67JZmLKh5XXGXGA?=
 =?us-ascii?Q?g8+dYCNh7cG6+w5HiNlTf5bZ858+NL8h0M8aEELXt+abA+jrAY5FMMrwJA7R?=
 =?us-ascii?Q?boxCX1czbXtPvuFuo/1zVsNRp2HKGmUexjy/8bCql0DYD0a+9AVkGI0Uq6ZP?=
 =?us-ascii?Q?J4pZi8ngKLPmysIKTgOUrciKd0nnLBZ2osjvJju0A8axfszZAEbMxYvyu2mt?=
 =?us-ascii?Q?kQl6zx0tDadPj45h5Yc03eXLQHGl90B6jr9jcEOhGyxkBoDIH3icmQYQcsAH?=
 =?us-ascii?Q?ERKDtfj3LshPfPGEgp9PzduS6mJneW8p+zlwW1dVayB3nN/qOhnsgdHgQ2R3?=
 =?us-ascii?Q?3nI1rIsQwgDFND23N4O0K5K00sd/KDio0dUtEFzt7XrU81/G2s9QJ1whMGa+?=
 =?us-ascii?Q?sGUjJuZ1FD1iRKoiL05sa+7g98d4FkfYNHjX43T08dtdxPmugMAiLqXvaNdl?=
 =?us-ascii?Q?VdNqy3a6Baw5lGAxfzK4rnRzuNnyc/25MgZaWd8uHDwkciQzWPrBgCW/mG/Y?=
 =?us-ascii?Q?ol2kGAXkHNWuMwqHmN79Vxy5rItg8J75rsCcifV9fweGr6mhhe+/ZANMqkl8?=
 =?us-ascii?Q?4Jwwo4ye8t6ojMRQLTRl8UdiNVFFGAtpHfZz7w/GLDVs7Qe5X67g9DCewVek?=
 =?us-ascii?Q?s+8DL++PBy+kqvB2h+lLCNvXF/YN0LyxXDhC+S/NZrRxltCS5hOhFt5sQOcy?=
 =?us-ascii?Q?QuYAZaIFEN5jfMpzFKFejZr0/6WU6AxlHh+YrRDYUWDAKpK01avfPlKSAjpa?=
 =?us-ascii?Q?rPHEvLZUIMl39IelHoJ2Mmgwe2m1Dk7EGK1ekLe1D7x50r/2HdoP8biCjFGk?=
 =?us-ascii?Q?JiaWkVHSsQIujQ1zvUmBTPVQTlcN+eUga8X1VS+HOQXrBEGd8j2xENjiM8al?=
 =?us-ascii?Q?QOoJQdbd6KeLJHtX7H6q2jktwVjWokHI6CgmLRx7yHadjRy5ehV8O1Hyzr7o?=
 =?us-ascii?Q?fUIhHCVRaXg6cq1qSH2PRWG62BwyJ795c+L/tx9BskygdtpMZv0KlW8pRyIn?=
 =?us-ascii?Q?GBR73RKEvs8/Nihone0k8aeTf2m6dUtQDhlfQWj51hzOhli3pxTcS2N+WVU/?=
 =?us-ascii?Q?sQgMVWdEBhufCnhzDUmgxkN65b6UpvHnF791P+8sd4lqpQZ6kCxkdpMPNuaN?=
 =?us-ascii?Q?dFlX6+ONBBgzQ6HCIf56KNfxYkyA4PgK+Yv9fdpsOqvFVnj9jBAB2qaqw4fE?=
 =?us-ascii?Q?dd5t/RTFgeFBcLI9isY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f47a69-bce3-4f85-9028-08dac3445c4c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 17:52:40.2247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVKW7GDojg9LWAuPdKbuSkyUDrANaY6OuVZr6K2m6EfIqs3fKI8ZsadPu2noquXC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8037
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 10, 2022 at 06:57:57AM +0000, Tian, Kevin wrote:

> > +	/*
> > +	 * Emulation for NOIMMU is imperfect in that VFIO blocks almost all
> > +	 * other ioctls. We let them keep working but they mostly fail since no
> > +	 * IOAS should exist.
> > +	 */
> > +	if (IS_ENABLED(CONFIG_VFIO_NOIOMMU) && type ==
> > VFIO_NOIOMMU_IOMMU)
> > +		return 0;
> > +
> >  	if (type != VFIO_TYPE1_IOMMU && type != VFIO_TYPE1v2_IOMMU)
> >  		return -EINVAL;
> 
> also need a check in iommufd_vfio_check_extension() so only
> VFIO_NOIOMMU_IOMMU is supported in no-iommu mode.

Mm, and some permission checks too

> > +		if (!IS_ENABLED(CONFIG_VFIO_NO_IOMMU) ||
> > +		    group->type != VFIO_NO_IOMMU) {
> > +			ret = iommufd_vfio_compat_ioas_id(iommufd,
> > &ioas_id);
> > +			if (ret) {
> > +				iommufd_ctx_put(group->iommufd);
> > +				goto out_unlock;
> > +			}
> >  		}
> 
> with above I suppose other ioctls (map/unmap/etc.) are implicitly blocked
> given get_compat_ioas() will fail in those paths. this is good.
> 
> btw vfio container requires exact match between group->type and
> container->noiommu, i.e. noiommu group can be only attached to noiommu
> container. this is another thing to be paired up.

Sure, as below

So, the missing ingredient here is somone who has the necessary device
to test dpdk? I wonder if qemu e1000 is able to do this path?

diff --git a/drivers/iommu/iommufd/vfio_compat.c b/drivers/iommu/iommufd/vfio_compat.c
index dbef3274803336..c20e55ddc9aa81 100644
--- a/drivers/iommu/iommufd/vfio_compat.c
+++ b/drivers/iommu/iommufd/vfio_compat.c
@@ -26,16 +26,35 @@ static struct iommufd_ioas *get_compat_ioas(struct iommufd_ctx *ictx)
 }
 
 /**
- * iommufd_vfio_compat_ioas_id - Return the IOAS ID that vfio should use
+ * iommufd_vfio_compat_ioas_get_id - Ensure a comat IOAS exists
+ * @ictx: Context to operate on
+ *
+ * Return the ID of the current compatability ioas. The ID can be passed into
+ * other functions that take an ioas_id.
+ */
+int iommufd_vfio_compat_ioas_get_id(struct iommufd_ctx *ictx, u32 *out_ioas_id)
+{
+	struct iommufd_ioas *ioas;
+
+	ioas = get_compat_ioas(ictx);
+	if (IS_ERR(ioas))
+		return PTR_ERR(ioas);
+	*out_ioas_id = ioas->obj.id;
+	iommufd_put_object(&ioas->obj);
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_vfio_compat_ioas_get_id, IOMMUFD_VFIO);
+
+/**
+ * iommufd_vfio_compat_ioas_create_id - Return the IOAS ID that vfio should use
  * @ictx: Context to operate on
- * @out_ioas_id: The ioas_id the caller should use
  *
  * The compatibility IOAS is the IOAS that the vfio compatibility ioctls operate
  * on since they do not have an IOAS ID input in their ABI. Only attaching a
- * group should cause a default creation of the internal ioas, this returns the
- * existing ioas if it has already been assigned somehow.
+ * group should cause a default creation of the internal ioas, this does nothing
+ * if an existing ioas has already been assigned somehow.
  */
-int iommufd_vfio_compat_ioas_id(struct iommufd_ctx *ictx, u32 *out_ioas_id)
+int iommufd_vfio_compat_ioas_create_id(struct iommufd_ctx *ictx)
 {
 	struct iommufd_ioas *ioas = NULL;
 	struct iommufd_ioas *out_ioas;
@@ -53,7 +72,6 @@ int iommufd_vfio_compat_ioas_id(struct iommufd_ctx *ictx, u32 *out_ioas_id)
 	}
 	xa_unlock(&ictx->objects);
 
-	*out_ioas_id = out_ioas->obj.id;
 	if (out_ioas != ioas) {
 		iommufd_put_object(&out_ioas->obj);
 		iommufd_object_abort(ictx, &ioas->obj);
@@ -68,7 +86,7 @@ int iommufd_vfio_compat_ioas_id(struct iommufd_ctx *ictx, u32 *out_ioas_id)
 	iommufd_object_finalize(ictx, &ioas->obj);
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_vfio_compat_ioas_id, IOMMUFD_VFIO);
+EXPORT_SYMBOL_NS_GPL(iommufd_vfio_compat_ioas_create_id, IOMMUFD_VFIO);
 
 int iommufd_vfio_ioas(struct iommufd_ucmd *ucmd)
 {
@@ -230,6 +248,9 @@ static int iommufd_vfio_check_extension(struct iommufd_ctx *ictx,
 	case VFIO_UNMAP_ALL:
 		return 1;
 
+	case VFIO_NOIOMMU_IOMMU:
+	return IS_ENABLED(CONFIG_VFIO_NOIOMMU);
+
 	case VFIO_DMA_CC_IOMMU:
 		return iommufd_vfio_cc_iommu(ictx);
 
@@ -259,6 +280,17 @@ static int iommufd_vfio_set_iommu(struct iommufd_ctx *ictx, unsigned long type)
 	struct iommufd_ioas *ioas = NULL;
 	int rc = 0;
 
+	/*
+	 * Emulation for NOIMMU is imperfect in that VFIO blocks almost all
+	 * other ioctls. We let them keep working but they mostly fail since no
+	 * IOAS should exist.
+	 */
+	if (IS_ENABLED(CONFIG_VFIO_NOIOMMU) && type == VFIO_NOIOMMU_IOMMU) {
+		if (!capable(CAP_SYS_RAWIO))
+			return -EPERM;
+		return 0;
+	}
+
 	if (type != VFIO_TYPE1_IOMMU && type != VFIO_TYPE1v2_IOMMU)
 		return -EINVAL;
 
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 595c7b2146f88c..daa8039da7a8fa 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -18,6 +18,21 @@ int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 
 	lockdep_assert_held(&vdev->dev_set->lock);
 
+	if (IS_ENABLED(CONFIG_VFIO_NO_IOMMU) &&
+	    vdev->group->type == VFIO_NO_IOMMU) {
+		if (!capable(CAP_SYS_RAWIO))
+			return -EPERM;
+
+		/*
+		 * Require no compat ioas to be assigned to proceed. The basic
+		 * statement is that the user cannot have done something that
+		 * implies they expected translation to exist
+		 */
+		if (!iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id))
+			return -EPERM;
+		return 0;
+	}
+
 	/*
 	 * If the driver doesn't provide this op then it means the device does
 	 * not do DMA at all. So nothing to do.
@@ -29,7 +44,7 @@ int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 	if (ret)
 		return ret;
 
-	ret = iommufd_vfio_compat_ioas_id(ictx, &ioas_id);
+	ret = iommufd_vfio_compat_ioas_get_id(ictx, &ioas_id);
 	if (ret)
 		goto err_unbind;
 	ret = vdev->ops->attach_ioas(vdev, &ioas_id);
@@ -53,6 +68,10 @@ void vfio_iommufd_unbind(struct vfio_device *vdev)
 {
 	lockdep_assert_held(&vdev->dev_set->lock);
 
+	if (IS_ENABLED(CONFIG_VFIO_NO_IOMMU) &&
+	    vdev->group->type == VFIO_NO_IOMMU)
+		return;
+
 	if (vdev->ops->unbind_iommufd)
 		vdev->ops->unbind_iommufd(vdev);
 }
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index f3c48b8c45627d..b59eff30968a1e 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -747,12 +747,13 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
 
 	iommufd = iommufd_ctx_from_file(f.file);
 	if (!IS_ERR(iommufd)) {
-		u32 ioas_id;
-
-		ret = iommufd_vfio_compat_ioas_id(iommufd, &ioas_id);
-		if (ret) {
-			iommufd_ctx_put(group->iommufd);
-			goto out_unlock;
+		if (!IS_ENABLED(CONFIG_VFIO_NO_IOMMU) ||
+		    group->type != VFIO_NO_IOMMU) {
+			ret = iommufd_vfio_compat_ioas_create_id(iommufd);
+			if (ret) {
+				iommufd_ctx_put(group->iommufd);
+				goto out_unlock;
+			}
 		}
 
 		group->iommufd = iommufd;
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 7a5d64a1dae482..bf2b3ea5f90fd2 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -61,7 +61,8 @@ void iommufd_access_unpin_pages(struct iommufd_access *access,
 				unsigned long iova, unsigned long length);
 int iommufd_access_rw(struct iommufd_access *access, unsigned long iova,
 		      void *data, size_t len, unsigned int flags);
-int iommufd_vfio_compat_ioas_id(struct iommufd_ctx *ictx, u32 *out_ioas_id);
+int iommufd_vfio_compat_ioas_get_id(struct iommufd_ctx *ictx, u32 *out_ioas_id);
+int iommufd_vfio_compat_ioas_create_id(struct iommufd_ctx *ictx);
 #else /* !CONFIG_IOMMUFD */
 static inline struct iommufd_ctx *iommufd_ctx_from_file(struct file *file)
 {
@@ -93,8 +94,7 @@ static inline int iommufd_access_rw(struct iommufd_access *access, unsigned long
 	return -EOPNOTSUPP;
 }
 
-static inline int iommufd_vfio_compat_ioas_id(struct iommufd_ctx *ictx,
-					      u32 *out_ioas_id)
+static inline int iommufd_vfio_compat_ioas_create_id(struct iommufd_ctx *ictx)
 {
 	return -EOPNOTSUPP;
 }

