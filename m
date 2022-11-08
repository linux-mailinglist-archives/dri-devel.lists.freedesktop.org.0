Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1EB620BF8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 10:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4F910E272;
	Tue,  8 Nov 2022 09:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B4310E272;
 Tue,  8 Nov 2022 09:20:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGa7zg0/DGGbm6UeRV9/J08ouG9AuY9Ml8yw+riD0GuNxMkwV48pYmIM/1wR87g+E6xhzCLOXAb1MHmWnHq0b8gkGfik4q60Z2pjoOY7IwtTYXwfsGJlrNtW+y4DBajGcCjl1ulgvaSSxXfzL7lkkKs6dODB/WKMF6aOlv0xRy5LE0ImDQtAjg3TSpg7Xn1jn99vNZhH7m5lFWcjabtISMEJpXe3qPhJu2CckHAyvs7vqH9ZzynOJFjYt3zz3OtLpuAPFzJ/rJADDe/2tR3bLhSr2ayaDW2ci2+wGrDPwwJ8uf4avjyHdrmqITWpf6OeScC303Sj6XxkRrfay4Q0MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gACs/mcCcJ43oUOSadZwVFXG5Pc6F2WUBxUWZXAC8KI=;
 b=QEH928VBn9dAScc15ZMFFjlU993q5GPvCv0M/b8li4VQsHsKTmtlFJT+OaYYjswGytw/GPS4cZcd1YdFY59/B9IgScHlBxsZ9Y9Qb+qDqPaHZiwbU7inFJ4G9pzWCCLvJu9G7qc+B7jJBfHux9fqRSReM+T5JerIMq0JFNxLAe/DdRH/F6NKJ5kC2LxVlYIIUSmeby3n7en5iKxVgmraPp6M2s5vIUPvDh9nEFZgYjhs8kyO5LjEbBaaB7K4UT8VJwodwfPTL9lYDYtYCmPUyjYKXnbAXt/2ThqbCiDQb6I0NWi1EWMHdA/palvByJGUqRGJ4ZrYNyEBmOEPhz7NeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gACs/mcCcJ43oUOSadZwVFXG5Pc6F2WUBxUWZXAC8KI=;
 b=JUFt2nXErJeoxu0+foZFme4EMG0gslIPxvI5nHLMdNvAaG4MsQS7DY7sX3yDhVViWSZOlQnkS/vF03u/53xk3Xq+KcRpWTfU4d/eCa8/ZJ2fRmPtKqdraNYryhiahI1VS/sNDeE+1ilheXmEu33H0c1tggxm5Og9ULPGqnNOiC9AWKOKir2xy/TMVxk6748E5KYsLUWlMzSEW7mYWbjZCJfAqo9ez6D17Afihir2z2114V0kN4GkBQfxBKpIZRxPdtoZWcsqj4ZGVXGCs5ZcOK2B73rq21PklUAq4+3LtkjxPbYGNrPtRnNoy91MPXQO81UpD/uZkXjDlPymY44eYg==
Received: from MW4PR03CA0338.namprd03.prod.outlook.com (2603:10b6:303:dc::13)
 by SJ0PR12MB6944.namprd12.prod.outlook.com (2603:10b6:a03:47b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 09:19:58 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::83) by MW4PR03CA0338.outlook.office365.com
 (2603:10b6:303:dc::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Tue, 8 Nov 2022 09:19:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 09:19:57 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 8 Nov 2022
 01:19:52 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 8 Nov 2022 01:19:51 -0800
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29 via Frontend
 Transport; Tue, 8 Nov 2022 01:19:50 -0800
Date: Tue, 8 Nov 2022 01:19:48 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 00/11] Connect VFIO to IOMMUFD
Message-ID: <Y2ofNKmmAIMGYLFK@Asurada-Nvidia>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT030:EE_|SJ0PR12MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b1b581-7bb5-4908-52cd-08dac16a67ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jMW6FPbZJBXl/zfNVyXd2mtKnvB+gisbpt6xcvyvFllyIjLVcVhJoQDwqwcvW1iQjXTnDgPTjjV9K34r1FigQTTzjufFqySE21JoKeaddM98NgvR7xiXz97Wx7hXNTQht3/W2ylmPJdCeP50WaFpm0yVlByLYcsnfXYp05iA4rhFU/U27v8olgmrgXMe3oAve+4tJZdtjA+WvZenad5AfnuDCv16IBa2rAdb303m49tg11K2if5fY9ARWsHU2WpW8jr0d5uzal9DJqqmMJupTUNur1uFiTN94KLDIMtgbCfVwL8rWwT7z0mVUaCDE/7ALSYlLBhXzWD1E5nNhPndzV4X9JAbFt0AbemlsiOzOqBhsU7IWzUajnUojirDc0dsA/dI1H8mWYEZRZGED4Libjiw2H/g0sGA1ioaFKXOUZ/GH8op1qC6LQA0BOlvhmz28TfV9DOENt6Pvj86Sq3m7E7LzjBMvIwmz14WuO2hVQXP8uw/fgieFiVvZwNSNgngp8ZDbpl8KB1sACSAtF5rAa8qcdKIY8ZHpK163wY3ox7RJVjt5by0IaniTEwX70baeXKDBwhz30DKqpuHTosjl1rknuZ0Yz0Bz+JXJhvuvjVQL2Cb/dDerDzOJzEYyar698L8uEMkyPoT2BGQrjIta5qoitMN48TT2I1S1VlS7yrvoZQT0sRTyLaW+m4FXDfSilIKcXLp0IAjCz274lq/4EyxvYsmiv0/5qYLHo+Lj17WP6/Pebl3Bs6UHE6Oz+VHUFAeFKJ0ixl8DQLTMIzEhrFi3T+XkASMfS4dCdC6snl3DaMMOc0/c/utMyYLZ8/UKY8/A5ngQvMWBANDfUq/IXII8QThv+KkhTeU7V0V5m0=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(46966006)(36840700001)(40470700004)(356005)(82740400003)(7636003)(86362001)(83380400001)(40480700001)(40460700003)(4744005)(2906002)(55016003)(336012)(186003)(9686003)(426003)(47076005)(26005)(36860700001)(70206006)(4326008)(8676002)(7406005)(54906003)(6636002)(316002)(33716001)(7416002)(70586007)(82310400005)(8936002)(6862004)(478600001)(966005)(5660300002)(41300700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 09:19:57.9397 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b1b581-7bb5-4908-52cd-08dac16a67ed
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6944
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
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Halil
 Pasic <pasic@linux.ibm.com>, iommu@lists.linux.dev,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>, Jason
 Herne <jjherne@linux.ibm.com>, Eric
 Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 08:52:44PM -0400, Jason Gunthorpe wrote:

> This is on github: https://github.com/jgunthorpe/linux/commits/vfio_iommufd
[...]
> v2:
>  - Rebase to v6.1-rc3, v4 iommufd series
>  - Fixup comments and commit messages from list remarks
>  - Fix leaking of the iommufd for mdevs
>  - New patch to fix vfio modaliases when vfio container is disabled
>  - Add a dmesg once when the iommufd provided /dev/vfio/vfio is opened
>    to signal that iommufd is providing this

I've redone my previous sanity tests. Except those reported bugs,
things look fine. Once we fix those issues, GVT and other modules
can run some more stressful tests, I think.
