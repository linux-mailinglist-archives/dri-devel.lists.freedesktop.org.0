Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91296628335
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 15:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B91C10E0BA;
	Mon, 14 Nov 2022 14:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D234810E04A;
 Mon, 14 Nov 2022 14:50:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVr8SHNIrJWR7k80YGqCoDjosbmIi+GcFk6oQ4XE7Vj2ngP8Q3NgqPa43f9r+TG4w3dHx0JYavc+m2f3AQq5TZmb82y0N+AV4s/fGQDb2zQIdMMem4GIlagzAe0Fcgmo7pNX5KMLRiTYRO4JNunyo5eDndPNn7cFkqn6IZ0feDu9Rd2hEHlX7lnxAMaJFNi8bwZKIepKkdU09D/dOGrCOt7CssKjVA+DMb46mlpOopcMxCg26xQz5nUrUEpYRy/mcGS7x9DVS2fpGVQylgVsuxSUjkRl11z19LLgGcaLK3x3dBaZa2X37Ee3mvLPPAcbejG6uI0k01o5CecAk0pN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Uy0AGuxR/a+dcIAdcog0DCFe5Jtp73ofhVNN5KKpeU=;
 b=csXgpmZoz4GWR2WDYpjIXGtC+fFS/zmvFVSjlAliT+C0xByHorJCrXVgrCno9AV8JWtpbg104zWT8kKaKoilQfDnUoj5QuS8hxEX40gU+nU4aZNMf8GgfG8WFP31FMH5rs/gi86Tn6qaksi4MuJv7ckamIpJhn+5KBW8/6nQ4Zi85KzEWA5xmeB3CUCe8aInQdL1u5Zs7vpdGpCx9lxB/ihleIMNYkS7+uUd3pxicbUB47dDZZp7aJKihj/9kvcjebbHtvQShaO91VooZkDtMzkuhDRbwe2UYpVeXxfTmpT7igNDj1j9uQlPSOiMm8ZWugvSUCY0dx54FWnzFLC/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Uy0AGuxR/a+dcIAdcog0DCFe5Jtp73ofhVNN5KKpeU=;
 b=crHZWkRCHrens1o+4p34FyEl91i2dpVkm0NR3U7K8B0rVFPpupWwdw+1Jnfql9XQ+JxGZBVvfbYSxxdN0H5mjL1ZfdMzrxPf2n1OtAVhzmwdJkN/URYoUJhlDNxALtHWLU9zVG0WCGAH5RUYxkvkx1k9Te8VEQ/2sQuXIoMiLcJSpNwzw6HGYrRpBG0WwyDtVmNbaZXdOSTNGGSOCEdDkup5BxA2rTVkqUd/hudW+6PYKz0tilatqpH8dfF8gwZJ5FZKSVUZrfcaVIwI4T/rseg5WmsWgexXRWaLkAUw+X8oYIaDJMe1sNqBS3L9Fj+3wfdwPoEsu/qtZeNQS1yBcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6249.namprd12.prod.outlook.com (2603:10b6:930:23::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Mon, 14 Nov
 2022 14:50:12 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 14:50:12 +0000
Date: Mon, 14 Nov 2022 10:50:10 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v2 11/11] iommufd: Allow iommufd to supply /dev/vfio/vfio
Message-ID: <Y3JVoiHRFjRZPdbq@nvidia.com>
References: <11-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <9a47347a-c4b2-e589-c54f-b193d105c4ca@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a47347a-c4b2-e589-c54f-b193d105c4ca@intel.com>
X-ClientProxiedBy: BL0PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:91::29) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e6b669b-54e9-4de3-8217-08dac64f8854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OupiEByLysxeytQcYeiXpOuqowimOQJ8FzH4fQL2Szx+DVpcR1TcabCgkr1EM43oVFt+GLNh0WEGFpVOe/zqzVGQAo2oJgOx7FgU76XODVNUtMxjwSLQ21X4sL8jIQcYBjzGkEYxFaAYU79DD7OM15xxFZQzbknfkN4GTsfeMeTc9A241HhwX9WzcOef+DTZbXpYt11gKDGIFSD0s3okf1wbHe+NGswEPJqySWov5xQxDDeQVJfVmWneiPBUoJwRnifmLdcHK3F6TU1iaLCZvCFxBTUhD7BDjfi+7ivMjxy5xvBL4nuAEKCzF6IN2WAfwFCqK4icrL81ylzdGSURCr7Loop0GaXzQPCtgVJxCZ3HLBCev2vQEnkfoaqicax1tvFiH+dEWG6lLs0LOrTgTKQmTDFtmUS4Kj490yAQp+I/BnOcI+xHWScSPYZ6GLtq+gBqBvtNwTg6WPFR6P+jd3t0QyUW69blkvjbhd5DdOE3CX7cIrnkv7JbBgmkHjsbZPeOAjFG1sqGnsp3LU3h3+XvklWhqYjcdXfoQQgekdYQvSACE4JidlUq3+Yz2QqYt2Ub3CUOx7PTIW2kNyf8gPJ1KKU2M5FF6jJpO+grRuv933Kb0BB4ZxkqEowJAM5mrh6uFngvLp9cuUZYJ9x+4k8ptWjMDhq6FD1u/SeiHmciTk2rcrzRVfaHOwwt2Ux3OOZN1vQy99xGXGbmFHx3uA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(107886003)(86362001)(2906002)(38100700002)(478600001)(6486002)(5660300002)(8936002)(54906003)(66556008)(66946007)(66476007)(186003)(41300700001)(6506007)(316002)(7416002)(7406005)(6916009)(8676002)(2616005)(4326008)(6512007)(4744005)(26005)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DQKmUil3aSAivZRoCzPNyz+TdQw0/7+im1d7Zh6oPg9Uhwx4HqJ+Odz78jC0?=
 =?us-ascii?Q?hWPBCOVLqkpPJIJdkx95MLokxdo1OFP4SGPZmJG2ifz6SFAxSW5bjlMyfNX/?=
 =?us-ascii?Q?NX5fND8+4xsDEHeMKNHG3Fly5tptYaDgUrKGI7jD69OUWsy7LvGyx+ufKcEN?=
 =?us-ascii?Q?79UPevZJ1df3Mxtgbergc73euw4zUPd9n0gceOmhA0tv6F/t83Fzpdl0Uke1?=
 =?us-ascii?Q?RNcgR5mSu8/s6Cz8yFkYhmPM11Z2iZeWTVOqL1HCeUn3zMwBzWjWF2pa4+Pc?=
 =?us-ascii?Q?RSKJMquLLgSe9VNDsnjX7vsA8QcowOKiLU3sGNdYHPF0H5r3Xr8ql3Yf8mjj?=
 =?us-ascii?Q?PDupUbAyuBOU/bYN0EPWVofm9nFd9nkS0Ixa4gY7m+l5upBw5903CSOMJnQQ?=
 =?us-ascii?Q?u3mDiZtowD5Uf+O7bt0x1vcHB8ZhnrddFBWqQplc71AUgRWKx6pVTwSMmns3?=
 =?us-ascii?Q?zTD9zJtxmyO8fs+rcXDAeVVMnznoS3aD/xTY0XGQA5lBCHhMSjtxIc2/xWo9?=
 =?us-ascii?Q?6dnxVJvlFvBTV+NOdXX8ZGzOwPEjlqYGCI84Tc70ji/zTWMKPf6o2h0m/Tih?=
 =?us-ascii?Q?H7RqfFyC+zBE7Z33+GpqFhn7/XXVxX7zGo5FHJkE/s/NFJ2BjPynyv9qqr3Z?=
 =?us-ascii?Q?gR0btB2XQ6lRw4h5Mx1UEPOTIy56NDIWAB98VtWNnSUAzA3vjnlgkgHqopAN?=
 =?us-ascii?Q?hZrvWZsY0UA3m4Vn0vnZatrxYuWu9S7w1oW1skcgWiHRZ2iT97yWm3yigTx8?=
 =?us-ascii?Q?aQkeafiuNMn4oo24gAEZiAaHGzGZoFvKffOBEf/DsOrRIIz85MZy8kGxqZLq?=
 =?us-ascii?Q?M1UPWrZHKTGb70PivuAlPW5CzAzqWxK2XS2YAe8UGPCNZzBLTnnxrhrsgitr?=
 =?us-ascii?Q?JJCY75cdXkMv5iumWT3EyyxGwq4F3SAYBhiltmKGXEjBR279ggcGhuk3aQ84?=
 =?us-ascii?Q?CicMDa2DdFhiQUR0CJ4ArSSI6YK/5dWzAGJycV1YjJxIRyIO9tKVCrlBWv8L?=
 =?us-ascii?Q?6SOdmLU1dQdBfMfl6amr6Lx/ZtE1j67njOlOHLTNCvFWFOhKjDamjioAj1fZ?=
 =?us-ascii?Q?gBxVPsrdd+vnX3EjQE863eRuobKwoF7bWK1VFU1DEesmeyV9o9ydiR1X9QW5?=
 =?us-ascii?Q?PPgT+4JBq1voOVWMeWYuXJMuMJ6fvksxbuNQnuCqHl5wlql4t4cv/B/zq9IV?=
 =?us-ascii?Q?IxTUV87zLKt4ejJqdfVk4uhFG01s9QBytu48iYIOAcd25/7t8zQo9tqvY3Y6?=
 =?us-ascii?Q?pN4AziNCw85f9solNVhqwZG7kYSYWkkyBinQUcB9yQZwRPgPdbqWl7CdbmO/?=
 =?us-ascii?Q?+H/CjsPTIONq5XUoXOgWSXYw5awxY2zEZ/71TvHWCb6sHhQ6SE8PJ7YsFWXd?=
 =?us-ascii?Q?AiLr+HN8cottGrPikhDitV7Hwo2334i0wcxkVgH1o1dTuRrKjVXTNzpxqMhf?=
 =?us-ascii?Q?se+t+DH1HWueRYZSCtowqYXPd/hTf7ycYSQrxMsdpcUVPRmdd32+XWmjTk7e?=
 =?us-ascii?Q?56FdqMaBYRryWOqDW+WYHcub1nKlZM9k/Grj/HnSoDPzYsiM9DF9CtpZBBhE?=
 =?us-ascii?Q?S25SNwX7nZbfnJwZbLs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e6b669b-54e9-4de3-8217-08dac64f8854
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 14:50:12.1270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zlPaMI1GXJ7qYsHM+OXPrFXk7WFODddDt/tLMFMD6o8pvPIPUBqEBWg6x+fRDI/x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6249
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
Cc: kvm@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 iommu@lists.linux.dev, Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 11, 2022 at 12:16:02PM +0800, Yi Liu wrote:
> > +#if IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER)
> > +MODULE_ALIAS_MISCDEV(VFIO_MINOR);
> > +MODULE_ALIAS("devname:vfio/vfio");
> 
> will this line also result in systemd to create this devnodes at boot
> based on the module info even if the IOMMUFD_VFIO_CONTAINER is not
> configured?

No, it is contained by an ifdef.

The MODULE_ALIAS mechanism works by inspecting the compiled object
files for special ELF sections, if the code is discarded by the
preprocessor then the sections will not be created by the compiler.

Jason
