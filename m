Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8963F614A99
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 13:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2F310E207;
	Tue,  1 Nov 2022 12:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75ADB10E207;
 Tue,  1 Nov 2022 12:26:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsjAy1KIY4Se5ggWIP9qe0U/RMzjrmKxZ6r1q4kpdPjuViLHol7geITXImOM6kZUVuiVm+OnChL07+IZfxa8fPd/8RBV1/RTdlr8wQEh39buq99c7piS4yMumXxwEBJND+LClyyDkC2cZ/zpzj5bB0jxvmdKwkZGHnm/Diwj+cXXmEGm04ME4bHa0StswVEFGfz0muDQzwv/ZKjgXo3OrKNS8HSPbo6TZVu/MRTY/zFK/Kv30J7Kgh4fi5dgH/j1qgKW00kPU2HCrRRW+dBekc/4Q78g3IL7URTb0YEiOUgftI0KRd1LiX5m7HDjsKbtaV89Stxw9MyrVps1f0mT6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYYKe+rBteTxbQAio7aZ8iNUDpdo09Tskml7MAsZkvU=;
 b=YCCTMB8rbnhMZ9xTYW33kNhGdy64EkK1RXLNAHGFFNYey8qjXvLFkNOUmsNxu917BrPFSFLRoR+f8cR8qMHxLhBCjd1/CdPlA5Tj/MPJiJmpLqXjBhnOReRe10zkv2zgdhmmO5VOeZE4y4qVFCvyaWbpTHSszA0/bs0t3dC1TkjFOkgUsFUzMnCmEg8cNB5BpEldzO+DZO1CnZn5t95vCL9IfE3xJOXVkGtXLy6SP4f9EO+6CHJDka9+UgifqVq2iD5u8lpJYqHaFQ6H7wU7qeiEzD51d/ASTolzsOz58XDXxWB7OaBdxFwkoX0JWbSXz3X/oNVrMAwcANr1Mi/1Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYYKe+rBteTxbQAio7aZ8iNUDpdo09Tskml7MAsZkvU=;
 b=m6PMPNlkD/KiiLOUdf7UDuYUEAKvY8msgPecD9NLH8JCfC4QbapxWTL0qkebyeDmhgtGXSZ0nqdw3jWk+szdHGhOQbQotq7agXC0ufmkEaAYWsh9jzYg4aUXsc/GhT+gHV8GM8a2yYx8SgB2gloActiPLJKxZDXE33jk5T8hDT3kFoAXdk5CLCreMt5MqJd+vAvF32wstyR5aIBjqyvts68dYXDlWYKMraay+qwePkqPh7KlYkfecXL3qYSQFA8x0YUIme44wAdZWQv5QRqie3UsRyWUE+GO3l7i9MpixiPhY/VWpYOPPz9kJFJsNf/2vg8MFiDXERM1Lz0b7njY7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB5104.namprd12.prod.outlook.com (2603:10b6:5:393::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Tue, 1 Nov
 2022 12:26:31 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Tue, 1 Nov 2022
 12:26:24 +0000
Date: Tue, 1 Nov 2022 09:26:23 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 05/10] vfio: Use IOMMU_CAP_ENFORCE_CACHE_COHERENCY for
 vfio_file_enforced_coherent()
Message-ID: <Y2EQb6mSTKOvASlp@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <5-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <BN9PR11MB52766FB4EFCFB2197ACDC1F98C369@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52766FB4EFCFB2197ACDC1F98C369@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: YTBP288CA0006.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::19) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5104:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c25f726-99b0-44d6-a4d6-08dabc044a96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I/VnIamb96JbTAGZUXJf2svqTSN3W8jd3eLiUoRU7rhDd1B7PED7gxg4mfOM3y8RE4k5ADCs4C62FLiP95aycu0T4JBRRsSsLAE199zrJqdM30taIHQH5Jy2daYdxKFR+HqzN9OyHCVQTL7ntqxAzcCxxSusm39WBt2O+cTcIdNGKdSsE7cZMekvhjXfRbY61FvCMpKKmlJwpEjfUOR100B4yWcAdAVo0P0s9ojsiongoTglu5sgrYWmAGpU4rlA4aj8sebLsFAJCqSOExpXwusvUQIYSEZWoVCAVrl8KdVpKMAtqxSDcj2gSWCoKp1C2BTU6fXr07ZKE7Pao3i1AkPqRwbLK8vsYmwPynX14bqzZzFGY6LQguytK3KUsg81dgcnGzHS3ZFsDw8NL0WSU4ueEweJZ9ek4qPTrJGFP/BK5514JSih2832tbRFe7RGYvVvMoo+3wF+CoYfsy6x9wFcG0th6dtAXvip4/4HMouAIpM8OYR3JQJGfcxP6uoVZvce8503ta+0wIfIC0mgf/Wi6Aym55C/YXT360dsy4gVj3ruzxqcIburLNi+t8B/d3tNZP5BWizSb5c409SFls+gqTdlmc00m5NkT0FXL1fu8oyIYIK303OIEbu4VAv/73JGKRXMlkm2tgROODZg+3i7qcRBhhuZSHRnBRRaZt6h7r6lL1EF7BjYGojZDoujicAbZLD7kw/gK4RDcGS4/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199015)(7406005)(7416002)(8936002)(478600001)(316002)(6486002)(66556008)(26005)(66946007)(8676002)(66476007)(4326008)(6506007)(2616005)(2906002)(5660300002)(6512007)(186003)(41300700001)(36756003)(83380400001)(86362001)(54906003)(6916009)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cjQGFPOiua4018pgLJvkBltJkSV0DL/xspVhS86wTzQTeTQb4RPn2kbf/vZ8?=
 =?us-ascii?Q?qWOSsBXO0i+nd4gIs+msuqar8i8O1JkPQGbf32RYkwa+IfC1p44bgfXit7Jd?=
 =?us-ascii?Q?6NcaBafVzBQz3/QpJAxKSSmWjIjtAb2B6WZzheYHdLqvLGWnW2AuN0tzvDrP?=
 =?us-ascii?Q?AQNKb6wVTXl9TQUHaFrTAj6FD8BiPlRCzeqeVzbeIGzhhrb7Wwg39xbWiR5d?=
 =?us-ascii?Q?FsJcJDL/dDZ9ewq7oxl29LGK1hPgCbWciFNww8aQk/e/MHfbICwrOhi3j3E1?=
 =?us-ascii?Q?kHq2ooXWMAQ7K15KMD4Xa3oAp55vL0QvlytlDuyEH8iECjnm0+MsOYNJXtJH?=
 =?us-ascii?Q?tuASbKLsAYK7/ZdD3HRC3lh1SxWDSI17mj4bK4UxPAmyLKSN1GCdr00wGPVG?=
 =?us-ascii?Q?/BWsXmJh4SUF/oVUrgTSoNRlUKgfHGe13ABoHfTXE1ZxgMAfYQhCWN+1reAl?=
 =?us-ascii?Q?4QX2kOVRkN3oeSBVqEye5GGtkzS10DUlp/rER1QgnR/A/vTzT+PqE65jMYVy?=
 =?us-ascii?Q?biznuXIMHRx9cTgHBWfh7XnmCEYrLMls4GYtSMMqnswizaVwDfzHV4ZtWg2/?=
 =?us-ascii?Q?Y6LTljrPhiMfl2wK34yuq7t/9OSLOdDEdZqycdOe0k1I3ibyInmugHZo4Hfe?=
 =?us-ascii?Q?Sqk0KcicgowEvJ0FRhdaP+bFExsi7RP4nbp8FfnuN22pHag26n/pv29J5Rc8?=
 =?us-ascii?Q?scVAM90z/S4oatuctiNQdt08a0onvVD4yuttFMvKbg95Bwb8lMas0L+r9QNJ?=
 =?us-ascii?Q?OlEmlSszXlvJ+A/GRWzck7Mx5CJWf7542Mq5AhtYPC60K7BnS/sMEh6RhVZ4?=
 =?us-ascii?Q?qIfnQ/WVaOSLDbPRfJOjbGdy2ztbUKwAAiSJYr+3OZ9OQdraSgRTwlZs0JA0?=
 =?us-ascii?Q?cuu74Yf9G16jL8i1T7jXgZ17+jtaUh/FgPxIJFLAR8CCp5b7dM+xMpFlW1Xk?=
 =?us-ascii?Q?o+9qTkTMkW+Wv9DG0N/oycc/BZw+yOZLDoMnGjDN93NQTL5u0OOaNN3UhAmm?=
 =?us-ascii?Q?z5JrJ5kIrgVybU7rk2//b7UsesfgsyrKgRwFS22gyNzu9khVQkA4bxqacOP4?=
 =?us-ascii?Q?Hj5EnKmyHpGX8r5NoXgB/wUd5nhIBjBhQg0eCk/Saw0dHsLlUjtw2kHyxYYh?=
 =?us-ascii?Q?1YRwoPc/3EsuVq3cA8ix4BCaQxxnoG/64xsQUjPFU//7kiuVVXSJtZfZ3Ru5?=
 =?us-ascii?Q?wVnqxtO6ia2U7CwC4prprkhg5IAO2eqmbsUHM9OANbc3H+DCMTm7Bkn9yRA5?=
 =?us-ascii?Q?cLB6ynDE06iQUUOVVjr548HRDEcmS9761U6JEmQYhMdU4L35s9MLRGB5BduG?=
 =?us-ascii?Q?qo78fASCDFq+AkMN4OXOxTmYH+oecH+N2uWxCsFavWr5WwPGEfmhxs0yJT5H?=
 =?us-ascii?Q?oYdF5llz0mSpwTSJou49E3+mRk8g/wD7FolPW349xA5TmCuoY4la0Qs3aYMt?=
 =?us-ascii?Q?R8EoQyX1v2nostchjrDxr8Ceq+g6FFmxEsTH0Ay5jup+uvG097smkjTs8+m5?=
 =?us-ascii?Q?5QJN3IK8pGBttPCAd0fKgP4NsTA4u1fmoVD34W75pu0riYnHm9+iRheOa3Bs?=
 =?us-ascii?Q?YCueO+OEoI1i87QsVOO+PnVyC4iyesPFkXYzP8jv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c25f726-99b0-44d6-a4d6-08dabc044a96
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 12:26:24.6436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZgYa5qSq9tG+V6WCuYTgTR960rMPwhA08+N1jie7hSQZnZGy9x4aIKZGvam+yKA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5104
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

On Tue, Nov 01, 2022 at 07:52:23AM +0000, Tian, Kevin wrote:
> > IOMMU_CAP_ENFORCE_CACHE_COHERENCY we know what the
> > iommu_domain will be
> > capable of without having to create it. Use this to compute
> 
> it's worth noting that the prerequisite is that vfio always enforces
> cache coherency on a domain according to the iommu capability
> of the devices attached to that domain. There is no mix of attaching
> a device supporting the cap to a domain which doesn't enforce
> coherency. With that we know what the domain will be w/o having
> to create it.

OK, I added this:

VFIO always tries to upgrade domains to enforce cache coherency, it never
attaches a device that supports enforce cache coherency to a less capable
domain, so the cap test is a sufficient proxy for the ultimate
outcome. iommufd also ensures that devices that set the cap will be
connected to enforcing domains.

> > +	/*
> > +	 * If the device does not have
> > IOMMU_CAP_ENFORCE_CACHE_COHERENCY then
> > +	 * any domain later attached to it will also not support it.
> > +	 */
> 
> also add the other part i.e. if the device does have the cap then any domain
> later attached to it will have the cap enabled. Only with both clarified
> we can safely use the device cap here.

And this:

	/*
	 * If the device does not have IOMMU_CAP_ENFORCE_CACHE_COHERENCY then
	 * any domain later attached to it will also not support it. If the cap
	 * is set then the iommu_domain eventually attached to the device/group
	 * must must use a domain with enforce_cache_coherency().
	 */

Jason
