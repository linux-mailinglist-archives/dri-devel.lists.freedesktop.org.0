Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41230614A60
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 13:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AA210E3A8;
	Tue,  1 Nov 2022 12:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CDA10E39D;
 Tue,  1 Nov 2022 12:12:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lj4BO/HEdUlIeg6zRLTnfPUjbJR6GHl1jsaeKofzFaNR4Z5jh0viYqkKZR4pkIEnNGHTfV0tUZ3ewpfIF9sM8Vh6iaLnEMMwPf7Hgeo7YsrFWWIHdEGir2pawROdO+eUDMbdhsQLDyotQUFMhiP3jKsylE+FD6t8ZXR0z21UirfsQKHXqWmQ4I9EbQdgAXx80DNoEfYylD+pSOJKlHbTD8rWNUhYJBAkxNIFXTSEFl+bCWxw5ZEnl5R40eybJ9GXEmmli4MfLxdGjsHX5Z6qdQ81s+RfoYaZiH/g/9enXv1r9mPp27yJf38284jk7xFwW2oivykcnc/Yqa+4TBAakQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4Z3ECfNs6hrDf3gWlw3E0Ei3xIHZvn1TEbiliTeMas=;
 b=FuvNZMkPWqvexBU8FYnaQZJ5TLJQzevXcXiEu3rcuSI9AzGbzo8jPhvwLOAdmkdIPm1qTh4UzPXwrMFPrAzV4abCnEwmoC6jV/vMHkmh4cG2i7tUkbH73jYsmrACpxA9Ub+5rNOwUUF71BenPmYXOMVZxP5mSZG2mFnUYgZZbBx2SK32tBUSTuhuJZlZNyrN8/fza+xeJd8fxQvWqwo2cGnL6+DaECtmeaSpFMTEZzIadG7RqBKdE2NC365PiQ4m9mYlTB75OprhvYe1dQry0znJTaHm7AmxDQJbCRWTwQZEBOiVKwbGf/N0w486xtT7rraf4cuzy6NPnCldL9p0yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4Z3ECfNs6hrDf3gWlw3E0Ei3xIHZvn1TEbiliTeMas=;
 b=XBrCPoY491jHBeH+gld1vR/RljGN669i3y8/EfjMC5hdr6Bj2g2gj8QLV4lfpwSSMb2V6nQvzdwtoOodXEHafpjv24GjTAUj//RKkM/SYRrb6bTlF9yz3EHUzN/xVtzzdq7EvJbZkeTkjCKEpN7WGGF78hVmAcaoIVhzRUsks8i0pjLf6fwKFKrWtkhgY2lkmUJeMxKqk5JpQWRBnVGxZwbBeJFDKw2lEISPFSk8jdhMpqhSQkK1qbyK3u31waiiVnuQSMOrCx3mM+MfJEv1F4pHqTOZ201WnjOFyWgFZrKkQBBHCqebhr50svPDwKu5Fo8rpIXmODzuP2vc7PwKVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BN9PR12MB5337.namprd12.prod.outlook.com (2603:10b6:408:102::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Tue, 1 Nov
 2022 12:12:29 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Tue, 1 Nov 2022
 12:12:29 +0000
Date: Tue, 1 Nov 2022 09:12:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 01/10] vfio: Move vfio_device driver open/close code to a
 function
Message-ID: <Y2ENKxljVLXfxI4i@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <1-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <BN9PR11MB5276DAC741E77BFCFAADB35B8C369@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276DAC741E77BFCFAADB35B8C369@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: YT3PR01CA0083.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::11) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BN9PR12MB5337:EE_
X-MS-Office365-Filtering-Correlation-Id: 16762beb-5f50-42a7-9a35-08dabc0258b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1WuJjM3mtH4MgLVEAW/FadwWV0loWMDr5jgN7Pueqko/TN56EuUnuJGVZzFjRPBQmmFwvksUoDsC/Dhx9xkWEE+ot3IGuIapaz92u6bmLNSAS3UCcPx2/QBksBmmRZ1JVv5pK7qmXTgpWpRqgVlD3NnUmrMgb/JwF1p+M/SCEKOM6rkEm5TYLoV8+T0IMWtzkLtX1s7QBJl8ltAmN5b/VfZrYsSKgIWP+EdUrYJFe7HXDVPjjLN+Z+1WhEgdyL05Q3iRlGaJ6RQTP6JUPMtkfviTYK0FcYMLcMIL0zSoTtSWw1yjWgFExPaPTPE5Rg5cjOU4LJoNustsXS+sH8u615Rq6Eqtz7lOiRmKt7m7x+bZn65CdmqO2k9qN36KUJllpIV0cqN/4YZ5HcjrQPQ6iBXg0VEfkRMavhU1gU53FWGDzM14GQpE8sqvXgFrLfjv/N1in64Fm4KP/y1+rBViYjRapTlcG+I59Ja8K4DNB6mbVqw3803R2ouvhyVtGUJZmmqiDsrXg8/wXGgK0gFJVaoH3x5Lz2gahxjnhiTrHVZ9cnuy2wAWYoBBdInWWp3UKjYzSN1AVKAOAyCMbdvxdlslA09BUzRKjhAdOpocwliPmcasjLKLSGvz13MWiTUD9PcJcBg1/KjyRDTvu2ZG5GLLN4B5l9IyZc8Z1FK4Ei4QjSodlbhGhZyMR7VDdsNrdNYGctZmz+891+nvZlcHaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199015)(2616005)(186003)(7406005)(8936002)(7416002)(5660300002)(2906002)(6512007)(41300700001)(26005)(38100700002)(36756003)(83380400001)(558084003)(86362001)(54906003)(6916009)(316002)(8676002)(4326008)(6506007)(478600001)(66476007)(66946007)(6486002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ft3Z0aYVMDmyobZrp1JMhbokopqQzekU/kAkBK/U8em3Dx2CRVo1g/dW8MTX?=
 =?us-ascii?Q?zzjWboAlrOvs/LMINZC4PKYQn0T6UyFaCq52GfMqpOACpkazf/7oaCJQ6ghx?=
 =?us-ascii?Q?6KXnQALcXcd26wHm9ZGRTprfzObfN49a8liclkRNOUKbh0tSOZRZliYiNmQb?=
 =?us-ascii?Q?8rcRknlg8e+P9NZhLMSO7Y0ueCjhBWKXqQ6UM/1UBLvSL+pabT5i3hbFNsMk?=
 =?us-ascii?Q?Byd0+PjqUKFNcZz2gY/TLAbdyBoV2ZOgsmq5LglDmsbwhxkm+osBkIV/m5qy?=
 =?us-ascii?Q?6vU5saV548TWknuQXqFDD3t+EVes5q11WwO1hMaZh3ZmrnSHeuqyufVvsj18?=
 =?us-ascii?Q?kHIvu9vTRdymFkpQJ7kvRZ22RoI90DvGuSMgE5/AyH+xL3DJHiqcccbgLtBH?=
 =?us-ascii?Q?lwXAnuBM1M4TtH5ztF9yYU7NwzSQqjrHPBfP+YsMmBXFFuVs1Thx/6YWMAel?=
 =?us-ascii?Q?i2+q/DKX6E7Cnb0LP6/C4JlL8CbDxflOBfZJJBN/rN7PnavT3zfqIUgyN1PJ?=
 =?us-ascii?Q?/H5u4jjq3IZYRp+RJdcVK4NCOu6cvlyVNqR5CK1S/5Ptkrmy8IIY3mZmb6Yt?=
 =?us-ascii?Q?Cjmz2un5fiKUK6yddqMJLhAjAW15faY0rc1f2GoVl+XO8svquDYmQsdm9PDf?=
 =?us-ascii?Q?v/fawxKWKAgtp/henpfisKB6xNcf0/yx6JQB/6e/O9IwKY9Nc+AJbCixPJDl?=
 =?us-ascii?Q?YHhbnCKl+ViB+X77XPG6jdV1+H/NHNna4viXNnm14ikIcvwSAPIqQzthlEuD?=
 =?us-ascii?Q?8sV81QiqyLUVO8wAGz4cGU+chAZAF7Em7YT2PUKLQIZOX8w17zlGXIB1QUP0?=
 =?us-ascii?Q?DEa8mzd07vvRmymtoSCV4BuUWD9enrSvMfbHXMBreW65ybnUve81lFSW+0eu?=
 =?us-ascii?Q?66kLR8VUZ0/aAMV3nXuoAxt6AYFimI1E8UZ56rPqA2YcKURTU8AnCcCgsO9o?=
 =?us-ascii?Q?II3aR3/PftA+e7EVlehvxigIHh5FIJ4gcOyU52GvPo+HAfviTmt5oTcdOaEl?=
 =?us-ascii?Q?fdOJqZlbaxpB/6/gWdeGDB71phdtUmJSMzvwapmQAc6PwnXvTH2YQj+e6mST?=
 =?us-ascii?Q?teU8ra1SUZQ6UBJF91r07FJbrKYkTpJYZuxY7mCRWC7RKGRlCEKHAYXB7y8R?=
 =?us-ascii?Q?BnhpH/BcLPbrL5s0G6+Hn70SG9aSkXmYnJMoTl+Ws5bQfTuxqihRejOim0Ge?=
 =?us-ascii?Q?FrbGeoKrYWzO8ajRqX+B1xh1H89J8B8NiS8JSr+71vtDZQVqOU8y1dHOUWPF?=
 =?us-ascii?Q?1AWQNgiI98lcRlKWV0Z4+E9Ioe8bWRkNLD2xXHpKFtgqWx106bhm5pBFrWnT?=
 =?us-ascii?Q?l/DUEKytz/wJK3+EMcjjvxGIWB5CP5NOH652v8jxNfMtzhoANlCmBdW98XuG?=
 =?us-ascii?Q?oJzV21Jd+enUqWmhovsq6HkgRXuUbfK2bO2wP1rzWaijnslTJEj/pf6nb5nP?=
 =?us-ascii?Q?F8WWczNjBZ08bTfFjeU4dt4k7kQDhUyic62L3P4HPZnudu6wGbreA7dAjXsn?=
 =?us-ascii?Q?zqLuKRKUj71nlF+AUQ658vbvbh/x4XDjPnkqGBxvY6FYCQd4M8UifhRFrG/8?=
 =?us-ascii?Q?S3O9ldyDIse8IMcKrHP5L7bIZtlUykz82maEikc0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16762beb-5f50-42a7-9a35-08dabc0258b7
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 12:12:29.4167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L86LMEOdkh4mGVmYXgSiixU8orue/tPbwab+RiOai7e25obtYr2UbggKrmi9vY2H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5337
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

On Tue, Nov 01, 2022 at 07:33:30AM +0000, Tian, Kevin wrote:

> > +	/*
> > +	 * Here we pass the KVM pointer with the group under the read lock.
> 
> Now the read lock is replaced by mutex. Let's correct it when moving this
> piece of code.

Done, thanks

Jason
