Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D07622128
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 02:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9CC10E550;
	Wed,  9 Nov 2022 01:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74D910E54F;
 Wed,  9 Nov 2022 01:05:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0975iEzpNUV9L+wcZdMB3glaGhUNXn3FFN0lM3nCXC3G3hdLBwpdKwgGrv0IRfYyZa7Y067T7UxqYl6B3+hMRFA2D9bnYJ7FKVHSU258osZPlAlA6yc3UenbkNevlPH+hW92+3goicpmHj5gxNma5rFEqERYXDSeu8Ok60PTi9Yv1AToyfjxwc5xhFBZ8UU+O4YsApjVdapsVgYfRXcnQswDGwg4xA89xOcz0Y189mBdNdRlDH2hYoLBL5swZsgesBTyDodrkw/MVZaJWZMab727gu8iJ+1hlBsHGblgcelzGv4GTVT/zQ3xuH/3dras7JNqXmVCWk8XM+GKFVUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHhhRZ9NeJ3jNGHSeBtbRZH3qJXwmf0nyqbItjt7iuA=;
 b=F1DKXci/Nh2IZEODJbx0tWuZ+ossyxQwU9v/OjLrFdulb4NqpLdJVI6dCv6/gqSlVc7nacRplF7sgB1jKU07YBdWXGvB2jsPtXWJBnKQFfvFwE2QyToRAUwYCLsVB6xfEecs9usUCTrKe4hTt16MAQHtESJLXMZyaC2ndO6zl+iw5L+d8AB4E7agCEHiLlws4cC0zpKy+uiDCSVYwvkzcL1Tow93TOn4K5q8KjVQYqqRcEfvxOiEN0+ooPf9xfoWyis8dNjAGLYdVAa6uMAXEaSQ5Gn3917Pb7+ViiO8YnjHuq92Tfb5LuHCj4Gy7BvliMnrxf9/c2VmLv+CQpO0XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHhhRZ9NeJ3jNGHSeBtbRZH3qJXwmf0nyqbItjt7iuA=;
 b=bqMUOBRw9CL2OYYaR1MAuwBn8q+jfnMMc49IVPZ/y/G/UBWOLvg7qfVRkU2K56Yu6r2bInKPIvdVavTTTg2oy8UYfZCbsx08KVjZmUkcuXyULCY4QrLD0KlI4vdg8mPIlZmQ/YXoZ7jHbABpmbOXWEKy66VsVtzsQhFVexMq84iQU3dyBRBL3NX9m4Umb+ZdXmcJHBYscNABZmwNHo6brPmuD7dOqz7sWuolwt7uyG1ddwHFdPgE+gyIn5xlJvwfdWBsJtTxohdzUI6t5nYJ/UHHz2TMZbhcvhM40luzbzF7veHSSzNGo6CovTe6Xhw6tQpMT/LZutY6ceTkfyRw5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM6PR12MB4500.namprd12.prod.outlook.com (2603:10b6:5:28f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 01:05:23 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Wed, 9 Nov 2022
 01:05:23 +0000
Date: Tue, 8 Nov 2022 21:05:21 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Message-ID: <Y2r80RgytKpPtK58@nvidia.com>
References: <4-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <20221026152442.4855c5de.alex.williamson@redhat.com>
 <Y1wiCc33Jh5QY+1f@nvidia.com>
 <20221031164526.0712e456.alex.williamson@redhat.com>
 <Y2kF75zVD581UeR2@nvidia.com>
 <20221107081853.18727337.alex.williamson@redhat.com>
 <Y2klGAUEUwpjWHw6@nvidia.com>
 <20221107110508.7f02abf4.alex.williamson@redhat.com>
 <Y2lSZwNT8f/RMoZf@nvidia.com>
 <20221108155520.4429c2e5.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108155520.4429c2e5.alex.williamson@redhat.com>
X-ClientProxiedBy: BLAPR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:208:32e::27) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM6PR12MB4500:EE_
X-MS-Office365-Filtering-Correlation-Id: 47019aae-9261-4639-0456-08dac1ee7aa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oc37HMV1tjFDbacUnMBNq8ul01tEyQiq4xKk6rcfFhBTauTvnRxEc8FwPKfehV2sMFLOCRj/Fqdv8UOlU9SdgDu4iIYTloAcb0c0G3XmFHe7c92cu790/10c+2TuX7lgQplE5KHBXUCrKfcGsBIV3Pfu4FKWkaDRQiTdj16VwkgN1WVcTKzM/4G+UA9uu0qduLGmuCGBMzm+7+h9yv9K9kPaPN1HpgH+/rYzhrpcj+b9oIECkA11a5gcdyM7gl0gmou7bLFeypVQw+IrwCxa+G+R9J/xpx/QrWDpm9M60URy3qNs4ssi1Z/tUWA/6lkt5e3lGoVGUWwcICytxiC8zkcxrMH6bCn3B5ScUvcUI/m4xrNbDLP8iGb9LR4dDrlAxUqYu3vs3oo2UNfDx28zjzbKoyRWJ2xuYTGha58vNqGXlWrBInWuDN0jGUXo7e2S1hMxl9/xUtk5D267PTtYkYXrAHayb87ohSn606gMdmdtQwobpJipGYqq5W7wTdeHI4iay2hdn7+RIBzQdI2blt0qrta72bCBXXJHzYFFipnk8VFI/uMTRZhRmDHpE06ntAu9sI33icWIuqvkWQJUV3WKJ65oA7tqjTcIT1xOoctm8b9PWe+ZJ3h+WSG9wtoy+v5Eq4t2NggyRzKmkGL6ED5PmiZsfc50HwoEZrPJDNsaiH8q5BqW/r0XeNqPcCM4DDRnQZFAGzCHes0RQOgXOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199015)(86362001)(36756003)(5660300002)(7406005)(2906002)(7416002)(2616005)(26005)(83380400001)(6506007)(6512007)(38100700002)(186003)(66556008)(66946007)(66476007)(316002)(6486002)(6916009)(54906003)(478600001)(4326008)(8676002)(41300700001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z7gK+r40wJ92wDUofu1z1ZsKUvj7iKBDKDUSG39YieaagVm0JMM0cOuUJ/h+?=
 =?us-ascii?Q?cEWEmpBehASSp5rwKbSFoVeMKy4W2Il0+PsdVacyUNVmFwgfF8S856XGSc9w?=
 =?us-ascii?Q?jUy892hnitcuG/KAATdT6ujbssysSnAunWJoJNd1JURZcap8Xd81pGDQvDTZ?=
 =?us-ascii?Q?VQHInVImb6yiJN/8lK3gDlk8jgDQoADu1lB7XwxNMldm5oKXJuhgl6zZZXHx?=
 =?us-ascii?Q?jsHdgjtDdERBBW7Y2OZqjTdNJWQKTlOmblgwih7Z8DroSH5S03OijU7oXhUg?=
 =?us-ascii?Q?ZtjLwQVcbARpwx0EXZLVRvucaa4NHqfSPQUpUZW6EGyjiev7kKfVMfs0HARz?=
 =?us-ascii?Q?snwQFwPbApmJARa0rA7whY81nMistgGWaY/XHREWAOISB1lJ/cU0sxydBEUc?=
 =?us-ascii?Q?bZCgQEblUtzWtA3JGJ9s75DotEnE3qGvp8eXgNVQopZeHBmbv4NEETakSVU4?=
 =?us-ascii?Q?crPw4d57Vt3xRBmcwN1u5PHBC4sRwljH1u00MyO7+s1qUurYeBWj7vpYnhsR?=
 =?us-ascii?Q?mHvvDhawBkiPrwv99Y+FhDj16I3Qp9EBLmSAJi/bO8YyYV/PL2mYa4tju1Ii?=
 =?us-ascii?Q?92WUyKbytTeK9F4pRjyceLWpxjwiWqoXR3VtTEFAhF4ZnUeurTLjhy4k29Dj?=
 =?us-ascii?Q?Fl0wOr1GhO80a3cpVdvFp9pTpfFS3FQjsdWzbxD9Xp9R1RjTuWbZvi4w0uRW?=
 =?us-ascii?Q?Lt4gskxvOVeiP9WQoC8zkjbBcOCdcm+plHhVcAk2YAJqdtfnBZgobqSDAl9X?=
 =?us-ascii?Q?qPaj5w8CmRaySgtwNFf//ZkxbaLOXS0OEijZ4Rmvu84w8JQL/bOUhILZWqyN?=
 =?us-ascii?Q?tfg4JPijEuVw7sBaRTJsZmve/FF+FG8R4VjeRpqSI48rLqU/UTzcmib12Ppe?=
 =?us-ascii?Q?JR1lTGCnD45t3ttS2YdEuV6yxEtPddwPMZ4mwiV8RSumRX6oGLxPc6A+dsPi?=
 =?us-ascii?Q?6KwrOct/A0W0RdKsYKpWEBR5pchCLewtYWIUfWQe+n1I5pfA2DjOVf/VNFG/?=
 =?us-ascii?Q?YghPqt1vCYLZ8W2pLhuShE/3kJE6FxYOe6iD0f0QsB4jXxP45Qzdom+FdNoM?=
 =?us-ascii?Q?mMTlfAu/MJv0WzVFnfBMgoNLvI0siLjbS66eyttSxnXSH17XBfObtNaajnJP?=
 =?us-ascii?Q?vnZNYfAIsvKphuxOrBPfh4UAOC5RpYxSQdLcTZpHj7vyO1GwtlyAHA9Yyfxz?=
 =?us-ascii?Q?kXeZcXCOR1JNoqlkwUEnTNEI2D05g02LKXQPJavnBUFDGUymMSNqGq2zpgwJ?=
 =?us-ascii?Q?dlQk7ljsNOeehpadK0ZMvaz52LTKhgVa/6esO57cspWu4iNhsjGwCmrjW2Th?=
 =?us-ascii?Q?qglhsGaZV3l+QT1TGz5/Ny2X2yP8PA+30zmzbmRUDwH8KPKGRVpGZy+dpHg9?=
 =?us-ascii?Q?2MZbmQifmC8YMlXhL2/A2KzlWY0+r2Mc83Z0nRtFlZB+MtiSY9BqBCwhJWVD?=
 =?us-ascii?Q?4O93EKG8yO+lrZ8tulHnrOO0VDG7p9CzeNY7+KOkSMRyfxhBHT2Srdy2tFMN?=
 =?us-ascii?Q?RN65gG3c7tRmwfUEM4jUYnZwzcJrKc+gp4QfGKIrhwl9dRecEy9zsypofxBA?=
 =?us-ascii?Q?fM1Du9SmF32XIIW70xA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47019aae-9261-4639-0456-08dac1ee7aa2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 01:05:23.2505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1Uaodfv4Io6CG7M+AYNa42Llokvv/dL0nwrwFuBkGnQEOv7k0AXVIUgrVH4FZ6F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4500
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 iommu@lists.linux.dev, Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 08, 2022 at 03:55:20PM -0700, Alex Williamson wrote:

> > > So why exactly isn't this an issue for VDPA?  Are we just burying our
> > > head in the sand that such platforms exists and can still be useful
> > > given the appropriate risk vs reward trade-off?  
> > 
> > Simply that nobody has asked for it, and might never ask for it. This
> > is all support for old platforms, and there just doesn't seem to be a
> > "real" use case for very new (and actually rare) NIC hardware stuck
> > into ancient platforms with this security problem.
> 
> vIOMMU support for interrupt remapping is relatively new, the nesting
> case is important as well.

This is where we got hit. In the end we fixed the qemu..

> > I'd be much more comfortable with this as a system wide iommufd flag
> > if we also tied it to do some demonstration of privilege - eg a
> > requirement to open iommufd with CAP_SYS_RAWIO for instance.
> 
> Which is not compatible to existing use cases, which is also why we
> can't invent some way to allow some applications to run without CPU
> mitigations, while requiring it for others as a baseline.

Isn't it? Didn't we learn that libvirt runs as root and will open and
pass the iommufd as root?

> > That is the usual protocol for these kinds of insecurities..
> 
> Hmm, is it?

I think so. At least you should have something to shut down an
insecure feature in kernel lockdown modes. CAP_SYS_RAWIO is a simple
way to do it.

> > I think right now we can leave this as-is and we can wait for some
> > more information to decide how best to proceed.
> 
> It's certainly not acceptable in the latest proposal, iommufd consumes
> an option set by another module and when that module goes away, so does
> any claim of compatibility.  The code becomes dead and the feature not
> present.  The option doesn't belong on the vfio module.  Do we need a
> vfio-iommufd module to host it?  Thanks,

I don't know, as I said in the other email, these little things need
work and discussion to resolve. We need to recheck the security stuff
against the 2022 kernel where things have changed. We don't need to do
it all right now.

People who want allow_unsafe_interrupts to work will simply not set
VFIO_CONTAINER=n at this time. Same with P2P, vfio-no-iommu and any
other gaps we haven't discovered.

vfio-iommufd seems like overkill, I think your first suggestion to put
in vfio.ko was more practical.

My only doubt is if we should make it system wide for everything - and
I'm just a bit uncomfortable with that from a security POV. But maybe
I don't quite know exactly what the risks are.

Jason
