Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE519622BE4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 13:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2EA310E5B5;
	Wed,  9 Nov 2022 12:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B01E10E0A9;
 Wed,  9 Nov 2022 12:48:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvKyIU9lXZkxRQyPD4TymicjopxDxEmvuvVU2LMV3ZCGCFAkAtduO5wuzBZqEH0L8sRMuocex3C2eSW1gDLcHosXRzQzEOCFNbY7GsLQBfaDNNcZ1UrZiRtfLYcGuKAXL1BexxS2AVZbpAiI4Q2DuzvyuLU1WLBTZw0+YUptnCE99EFId4lHO6IpdP7MBj2FM28Qtg720vsPHD5UPyW1X4WTDvyvXIs0wxG/RcPVx0AOPcVMgekeqSadPvsdvRfpHJHKYGBdvHyXamzZjdEfuwSO2Hiej+LcSH3R9YWoSllc7SbUOX4vPvSEI8q8+v8DWHrshmWjp3IIYIMGZDMlyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBA9DlRD4oqGOK1OIdvtAXoZ4VOeMxpPcSc1dVjYsGg=;
 b=Vh9pYieh7k6IYOpUIxbZBCzSLpowUjpfgIhYSIej4QDATLc41gHdIurvORNg8i5GiTBbpK6TbbptPlhrkuMe6OnGNahd1hi+6v3miQcNwNyJL26uyihDbvsbqmnQz8erdRoz1ALqCBuV+g5UFiqPktWYtSB+Y5DAgRtAy08uoGkNYiRqI+ZlCx9xtnYxaukTihvPFQbEpiyP3qGHCsRaITCUpAcVnJyw8ZaBHK6vB1yenu45+K49SvVe1/XUiet+p+5JBCxOtpnOPPIl4GdJxecgNFI4gcf67wgbkfM0bg6GO9UzFusIVWpIhxNy2cF8c0UzA02HnfFbKY0+1PBvKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBA9DlRD4oqGOK1OIdvtAXoZ4VOeMxpPcSc1dVjYsGg=;
 b=bZw/EswJRxvxU5hrQoSuUT9Lvk/XOffM/el4srjbp3ccTcN1dx17qZlv+G1CGg7GSLI+bVChGrCOz2wn5BLULllG5pV187RNPHHSh2WS1BrrSAP0201B+4JmGcHIh38rsVP9sF2z4f9t/OPkVE43gv+U0n3TdtrksxVXPskElyEXYdCKkAfzW4CrSO2R3DV/eNFD0PfLYLPRi8bapOomJqe5M6bSh84AMm+Z18cK9f1VnTYvFuWqYUnqwpRJEcRP8gqrUtB+vY7BJgjf2lA1m9NFKzPGNxhdR2Dbz75FAnw+wEqTZeG4RAcAcY4rSVUcHQt/XcfUNdFg9xKPmvPLAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB7323.namprd12.prod.outlook.com (2603:10b6:806:29a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 12:48:30 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%7]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 12:48:30 +0000
Date: Wed, 9 Nov 2022 08:48:28 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 00/11] Connect VFIO to IOMMUFD
Message-ID: <Y2uhnLeivWBR0wZV@nvidia.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <BN9PR11MB5276F10DA6C223B78CA5F2458C3E9@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276F10DA6C223B78CA5F2458C3E9@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL1PR13CA0157.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::12) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aec6f0d-7d6e-4e8f-5828-08dac250b3db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5hMvUDtokNzvRykELYDPUUTI+gbx2b4gieeIQiqsUWzbuqbOk3cPqW3NcJTIBPUBMyDuq1+EwuaPmGagleVjx8pszLcw4bhMb1wBOf/oJophudUvJCdktbGOBfmmEqqXlfiLCRfo6ZGe8Z+PO3iOp0DByIHq6rADdtR6AGoOIH5WRm4kgm3gGbU4Iqf5fiLHYnXw9e46H3RFfiIZ9ttzGycXNVn/IrAiMLoWXRnkPK94dB9lbLGf0DhPN74E/TjyZJoQ8gAPvU0ezfp1LqUKF5r+BP1nEdH70KqUFQqFKrdcvxk9RCkjUp7G0y6fee0s0gGoaX8F7tUb3xGlhHPi8ETI+UfBKJqonbI8Xl9C1qntFEile+jDs7jBFCoda2zCCgMY8lUFF954lduL1IGo5a6617T7eZyBXKISyTMPOjgvnthDNFQErzFbAuZ54vEzU7tdbqifN+HGYcY5uWkm3IISj637h5T5itmn0mhH0r63Kv6OBZY15n0YV2acxeTGR02I+1FWstXAdomq6mR/nih2bnSt9ysvoKIMW1EPY/0Z7OBh6KSYoYDEjc9Q5TyKITI9QpTnwtK6CI9gvpMX+BRXaooYpgaoBz9nQW1Ye5uP+WqG59Y+9BsRqiWZru5D8Wk0GbyGCHlu0CXM+gugbcDy9AGtCtsDdEMS0OrrrCggFapIaJyl54fLn2IlLLGd8ArLLDxQ0cUDwU6LTfDsH2J/GtkS57thY8dz6P9O04Q4ezIyqlmQRUM1KWUWD8duY+62srVagYPDvB38wVmZe1yvzB6MLTbXJ8tHfeejmmw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199015)(4326008)(8936002)(83380400001)(38100700002)(316002)(6506007)(66946007)(8676002)(66556008)(66476007)(86362001)(26005)(6512007)(36756003)(41300700001)(54906003)(186003)(6916009)(7406005)(4744005)(7416002)(478600001)(2616005)(6486002)(5660300002)(966005)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HVALhhWeknwqz5we9yN/R8qlJ6vUb+eWB33WfjlEMsKKZYn9bbT//LqpzgrA?=
 =?us-ascii?Q?29ZfrjO2MXPzseOy/k5S1JAKwFAoIV3MGQ7T+cp4wvksN06avewGH5/fjCbx?=
 =?us-ascii?Q?J7F802wh6ELn2lt50SQ2DdE1YSyrwsbdTH8j56LQtpklephRo9NUMj/Mxxrs?=
 =?us-ascii?Q?dEzuQmCMkV3rsl9b4d+ROtiyQ0Me21+qvrlu1H0JK4BzfwLG95pe2pBlhxYF?=
 =?us-ascii?Q?dcCYE6f3ImgbPP/cowhE5d0JmdgLBtMWoaEI1in6edfMqTLtz7HqD/Zb5q7Q?=
 =?us-ascii?Q?lM/oBB9dWe+WNwsCeyTFJo/00q04GaWwCqCK6BC6H7lEhy0lmAEl+vWGBSjI?=
 =?us-ascii?Q?g4HojTB5IJ9toTn9HwqJgp+b0GgXNPTfo+0HwdyxrmOc39bm0bfP8QSFgpJr?=
 =?us-ascii?Q?TQnQCJUTsV1ETMStm7ja5Kld/TziTjdB6tlw8U7t7fHc2wBZOFf34ZGJGHF4?=
 =?us-ascii?Q?utS7fHvWgyMPy8IF7oqRT23WKTy4D9DrnEMPRt59QRkYw66GP2DbB4uBcrUb?=
 =?us-ascii?Q?mj0dMFi2KDpuMOG2arvs82qJ7uzAu+yGtv971axrc2JQcbb8wm09kfofhiBo?=
 =?us-ascii?Q?S+lsyPGX/DIN9mZgTX42SWl9ueLRZtYS5IZ050ISlYzNEEGMWZ33/s2J6yox?=
 =?us-ascii?Q?Fj5yr7dvQm/ttwaX2Fzn6W/0IaUaNFzlBb/qs3MnuzrGWddOTASD40hPsCLe?=
 =?us-ascii?Q?kI3YqqbkM3NMT5WrjPrcTosciOydTD51JkdUkxYIXsvu+qXY4FcAxLL44Q6I?=
 =?us-ascii?Q?JsSU/O2c7aWU4atlzjNtI6qfVO58tKOnJg+vjjXxJZlyIsg0g49C3lAS9pQ4?=
 =?us-ascii?Q?NPOHO1UcHxvU9mbBjtLPmhzkM672zrZU7WPmCy7uQ1e1SGdq7mutHqbJhUa4?=
 =?us-ascii?Q?GhYV+3tyuiHxCh8kjPSwrwp7ODDztApWEIaZZmwQT0nyyWlCoAYUI8RmnnDI?=
 =?us-ascii?Q?/6R9yEw9TcZOS0DZR1IsYIWSu6JFfXCLA0McKcwpDXIH71W+RDg9544+jfuM?=
 =?us-ascii?Q?kkfFQS/iQZU7UIeAUBnbuySfDqAAQZTipHhKiXOyI4MeuEaQxdLnrOA2yKdS?=
 =?us-ascii?Q?TNrnopUUqjPhmlbDYdanudvlJQSbD0sN4LK3qJBlCutQHUldVj2aszfJL0ge?=
 =?us-ascii?Q?iyJPhMKJ/U/fmHD27Uw8YrDcfOO9nf8LtwYL8KwdQfLls6mXa7tGomjaWIYj?=
 =?us-ascii?Q?XjYO4XHNs+OXhQlcm6blULPGzlvQjmr0eEfD6Yz5vKOoObi87mFhF/QEcDG6?=
 =?us-ascii?Q?oy2pg4bTByVvdveoWzJ/qXUGLrxheG9WnI91IMkTM+76tEzOGmoTRGEjWckh?=
 =?us-ascii?Q?3nFFJpK7M9v4Yauj+fL+s96LSRSspVZnaJ4pXGTMleVu09RQ1cUcide8hpJ7?=
 =?us-ascii?Q?hrPn5jGjjravl4ypt9oGZO6xHcWmrU4AC1Jgk1KdskqMK2wMPm2R0OK9fRW+?=
 =?us-ascii?Q?hxPhSD4y0EdQyIJfQEDTe7WUtMf+fq1Z8eYYTQDcuVs/EAzGeT3PTLhulQD+?=
 =?us-ascii?Q?lADlrxgBccHl9kqOv08PX9eJ34+cbr24SFfmmp8Mje5zd0hAdKQV4aOStnOw?=
 =?us-ascii?Q?Ph4zI3MTw9R6NQqGGTo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aec6f0d-7d6e-4e8f-5828-08dac250b3db
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 12:48:30.1558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gphR/cRuUa6doQXrrZ3JY3/8Bp1D3VACikQP3BKMRFaqDFT287kUwkLNvkJZjqW9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7323
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

On Wed, Nov 09, 2022 at 09:03:52AM +0000, Tian, Kevin wrote:
> every mail in this series is shown thrice in lore:
> 
> https://lore.kernel.org/all/0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com/
> 
> not sure what caused it but it's annoying to check the conversation there.

It is sort of a lore issue, it only combines messages that are exactly
the same together. Several of the mailing lists on CC here mangle the
message in various ways, eg adding trailer or whatever. This causes
repeated messages in lore.

The trick in lore is to replace "/all/" with a good list, like /kvm/
or /linux-iommu/ that shows the original non-mangled version, and only
once.

Jason
