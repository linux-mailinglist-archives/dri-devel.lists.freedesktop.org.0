Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D671F6150E2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 18:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D615D10E40F;
	Tue,  1 Nov 2022 17:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E879610E40C;
 Tue,  1 Nov 2022 17:37:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kv9erb83lTcpuhqa+HJDSb73ku8ZxCVHLoMqy4jXU0+i5g7ie3XQ5Ra8GAnrhzpbvKrY1vzBNF50oIbVvbYEdWO5n5IaegjkykhOymu9A0/Sb4ri0XLDt+QdZukB95ZR+5ga568VnmMVl6EGbGZTeVjoNBXrc0IkCQbTNOuAC7BpQRA743vWdaRDwB7Sgoheu5onRRq5p6QZ6e6DrCy2THObsjO7XbDmM36tC+E20k0+87W9fIHgOSuppY0AvUL6XVzcuR+B4QjsRnuVRXzJQiWkaPByukYWOswjRJ46rGwqglhTcj4KUML41/5hyCj4NtINjSORQbQowBvixbw4nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARvkSKMuFA7eODox5SQi7aol0zwaxZFrQV38XH4/FXg=;
 b=ORZUxYV22uX6oTljSnyJR0ehPJduPShUSsSLc643bakRL+ykY7rklV4so9zBRv16X9qcFCI2+cHop79p/mhlXInXABfqEk2ra+bmqHKTHLCaRKUlsENxWKiu6XeQRnqj64/5SKm45n8PubMcd82Qhmn16kX1ArGwtm9WGqMpDIG7N7YyLHWSUABBYL7dWdP1HEN1H2Uv79td0WkXvOG5rq+MulvdsQElADMQG9QLfP+DsWlcx2ldTayYDIcjN8+8AM0RuKdLX/fcB5i1qUpQXyjOOID3zz+GGcfyvP/d4Ebh4muj8BI2aj+D0D/cNqluguDuNO4Q2rW13bI2OfiH3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARvkSKMuFA7eODox5SQi7aol0zwaxZFrQV38XH4/FXg=;
 b=m1H6UWg32le7OCdzRaPu9IvGMxaq/WyHLxQHHTb73mBODXE7XQ4FD/1Ov/sLd8dHP6WDhL2eFCCdPH7ulBR2gd3WHTiV7Q69H+sNXKZVK4FHxygsTjz+5Ox7YCZgpg+Nb2TnXR1m1u+Ag8ybMlcZpm+4rTgTi4DDoVSgT4mFET1WtXV6Z+aN6So3ZMvGJ/ytuob6y5MQZPjThimnhnVG0cWJXE+F2LFL2M8ZWr8B3V8uoyRHew6/1C+ghZ2cLs8qeFkolgTmyQGI13aVHcaOx0nfqvLeN64nJEoimSIMsyYKhG1lcc/X2+ZowsfV2q//BBvnI7wt/JIvFJoCf39BGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA1PR12MB7128.namprd12.prod.outlook.com (2603:10b6:806:29c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Tue, 1 Nov
 2022 17:37:52 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Tue, 1 Nov 2022
 17:37:52 +0000
Date: Tue, 1 Nov 2022 14:37:51 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH 02/10] vfio: Move vfio_device_assign_container() into
 vfio_device_first_open()
Message-ID: <Y2FZb3Fj94pOJhrV@nvidia.com>
References: <2-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <57cb20a3-b80c-25c2-ab27-52134982d7ac@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57cb20a3-b80c-25c2-ab27-52134982d7ac@intel.com>
X-ClientProxiedBy: BL1PR13CA0263.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::28) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA1PR12MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: 058fb961-f9a3-43e7-0de9-08dabc2fcd5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RXU6pTGoLcKi0GILMFj0t1LPCqquBA7RiW+trdB0U+MPboIcLdjPwan6NmBGqoelGBMwJ9eTOcEYgILAl3U3avvnGPuLTJLWBiS8HQxHKnPIjJKoddTa2ijLYmAndaa1FmynawvJb7GV6Nmts4RAde9drrNnaMK6p7i6amLZ05dEdGGXCstrKw5ebu9ZplP2XusACQUZBww2ePeXGBPn6y68hzdmmzHj9oaopm9IRo0k5ZeJZumr/BffgUGQCVgieaNAa7RqHN45sNKWesKuSLThl7BALvNfYBcwJiAg0+OD3u2BipR0+1ezmWZCbZip2DABd71D39p+u6PRlMfsC5QT0qCfv1R/f009qGVjbkPA5B4kV9592r0rXuoKDu4kHyyeslgcV3UE+nEgOM3+7VYkn9QT5slCRS4fOFp3aZpiL6Jpcv+sj3JY0nuQB3yBsQOQzQxSsMoJogAm0YPoygfeQ+zbRKLe//FVH7exEoZrJ/ySZKoDYu0FMugrlu1/FNRWt3aEDFcR9+2ZCWvrPkWh7KFt+r4J+2bJbZzy1iq4Wc1RfCAvD/qFsDwl/50zlRRRBnYGB0NXPo0Dm0RwmV8+aD9b+Kjbmj+fNBRFvv+cRTF/yqTwQ7HOKU4aILXRNAxi3wq7Y4SzwcfTno2y59kIQ4NUnc2rixTTJN6Hw8u6Rw61ZttPIdsyEwN7WC7M0hEITdBF1i5z+60gxUbPIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199015)(83380400001)(2906002)(36756003)(86362001)(6506007)(8676002)(6512007)(41300700001)(4326008)(26005)(54906003)(38100700002)(107886003)(7416002)(316002)(6486002)(8936002)(4744005)(66476007)(2616005)(66946007)(478600001)(66556008)(7406005)(5660300002)(6916009)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Veg2M4IV2v3ouaq+Cx24bGyxAD9hLsQSbQIY/nJYemOKRYyZWzjSDRy9h1/D?=
 =?us-ascii?Q?IuadAmgBayyiGVgv6yuxrmKMmuwA9oEb6+2yrpLvlH1xi1Z2g8ZTTecLn3oy?=
 =?us-ascii?Q?VvwhK6t7nkvEpRDGTx7/V2LIn0vuouFKsAQry9tfI/tdez/1j/pttD9l1sZG?=
 =?us-ascii?Q?QmVbVypIv6KiRnUquJkS7rdRW2EDtDIb669f3kY92mDUNe9bsxQoLtPG+wnZ?=
 =?us-ascii?Q?/Ee5DYar0s0XzFjmPuFahd4MGdw66XI3TpHN8GrczbMJ1aTwHD8u4A78reky?=
 =?us-ascii?Q?/xtteC2gABGKWjWvb627Q7fXudzdMZTAx2sZrBKz7a6/Olm4JyQxITq63wQX?=
 =?us-ascii?Q?AA1EkJ5g95greO0OlfRpKWYAPpv+M0rraa0WbYpzbjgueHEEf7tqQzLciToW?=
 =?us-ascii?Q?g/9p/Yd0cxYmkzDT//pyv6gRdWk2uuQZQf8quYf09L6TrxeezG14cNPid+1y?=
 =?us-ascii?Q?lUsgGOhLAd87fB6JI+c4Xd0ACHm0TPMaAZFdMB2LDC+o2WpzZEP2QZrDkfIu?=
 =?us-ascii?Q?k1i4nh+OVOZeJPrAko7TKVAE8c60wp1ljWnbZcTqmLCPZM0YRZj2iGRdRjPo?=
 =?us-ascii?Q?Hs8XktXLRgUTGLjmpELSGLBh1IFot8sVuEJpvHBZs+FzzjeVSutcqnQ8uDTI?=
 =?us-ascii?Q?Xn8QHHF4N0Weec3jQV+tZK3vztfVpSm2ZfwbxLkfySOqpE+Cdy/Mn+M4htI8?=
 =?us-ascii?Q?xdd45lMen44979FnzbgSuAOdz9GqKGINmdZN6zkGxhC0yIMeQ2QpBDdcbxF6?=
 =?us-ascii?Q?Jbh5otqOqdsSxZnAWDKPE2pbYygJQnBuIt4Q8womburKx5lvphLOqHfR5cKA?=
 =?us-ascii?Q?1ywzW4+QkQchP/p6DFbTSRPxrAnq6jZksYpcqbF2l+Iisbx7ivUCNxUGSpTX?=
 =?us-ascii?Q?n54yO5cyqWGN/QYyL+AWD2vfBKPuu5zA2q7PLw6UtXDGqnFdq+SP9uGU1RZa?=
 =?us-ascii?Q?vzHQ/90kB2XtIUKQPsjh+9gxxtQPGVfkjPCDSopacMYxRVKz/576p5GXlARy?=
 =?us-ascii?Q?csQnkv6+GU8XW1tj6UZQfmjm5SuIRhf//Pkda3qtoVgbNa3flcaGF/muXBTc?=
 =?us-ascii?Q?Ol26/UEzcaWEx4o9Y2Z36MPMpdCe/VZ19i2BvSY4K7L5sJPuXRaDzMNwrKyJ?=
 =?us-ascii?Q?Xkp00KhOMgGIOzyArA7N2CkRf8NzGMn6ra5nRep/Kco7YvVR3SugOLlYvU9U?=
 =?us-ascii?Q?Jgn+raoNFkP2+rfgSa9A8EP1LJWSMptA7i24wEmSvdPC/LrsQQJ9yB7fOTfF?=
 =?us-ascii?Q?RKD0V2NCuTrjv/Wkw4EY/SLqkQe5n0t9Wh08Iwi21AzNx0UMtpmy8ROX1S2P?=
 =?us-ascii?Q?BraYguvkEQcUHIGt9h1OOUeRCEVFQcKRLOEkXQlPLvSw0K8pIe99Zg7Tzcc7?=
 =?us-ascii?Q?qBVNAkppvTW3jg+1uMefaBjwJ+i+vgy2Ql1ruf3OAcMtaa+gap5SaaF6ZusR?=
 =?us-ascii?Q?6z+dtDT2iCYctjHKVAFcU+ST8x0lmuBq25pAtVo9957bPWGoYZkqxWLlqnsf?=
 =?us-ascii?Q?BNIQU/+ZSXW2OWdnG7WlepDUYEUO4DLpoPvP3RC09aFig0394OeuFGYiuxTj?=
 =?us-ascii?Q?L1owfFOgZaqqaj35szs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 058fb961-f9a3-43e7-0de9-08dabc2fcd5d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 17:37:52.4070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWKtRIB0SNC74fUMyKnN70AS+LhXivrdNezqYpm/txNYIoWqSWBfPtXfISDQpPlE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7128
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


On Tue, Nov 01, 2022 at 10:37:14PM +0800, Yi Liu wrote:
> > @@ -784,12 +791,6 @@ static struct file *vfio_device_open(struct vfio_device *device)
> >   	struct file *filep;
> >   	int ret;
> > -	mutex_lock(&device->group->group_lock);
> > -	ret = vfio_device_assign_container(device);
> > -	mutex_unlock(&device->group->group_lock);
> > -	if (ret)
> > -		return ERR_PTR(ret);
> > -
> >   	mutex_lock(&device->dev_set->lock);
> >   	device->open_count++;
> >   	if (device->open_count == 1) {
> > @@ -833,7 +834,6 @@ static struct file *vfio_device_open(struct vfio_device *device)
> >   err_unassign_container:
> 
> should the err_unassign_container be renamed to be err_dec_count?

Yes, I went with err_unlock

Thanks,
Jason
