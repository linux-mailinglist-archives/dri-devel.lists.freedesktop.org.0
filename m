Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D006143DD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 05:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622DD10E065;
	Tue,  1 Nov 2022 04:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A1610E065;
 Tue,  1 Nov 2022 04:21:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLHh/JGx+RLtaCKG50AvLq2JFy7iSIK61diOkJm2V382O06RxK1ioU/zM0UWasZDJZHNH4p5wc9J7pajbO01K35SQu2mRXup0RBw5ocHG3xF9kUyOJLI/w/uiH0+lPIH2fgA2TkfmD4wvYHMh8nj6LoAb33rS0+9kmT5GX3xcltgg0KaRY1DIRDG2Nli6daBGp8pVpC2t53hAwnXtEPCnWVeex6uGFbxCCX7DVPQjIOcRbLSW7j18wO9o/bCpcRDGzxdWPMl2nxQBPNh7bwulzrduUHuLU2+P6pu0dqmjfu+XwvvHJe9derw6k80xf5HrGHHDQJYJWOWZDO2k9DHEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yh2mFQ+0Cpb5uIGt58jitZB5flsuF1WBGKMrMp7OPsk=;
 b=YdXFblUtCn3N4OPDq+7FzWGjID8plxI1icuaTr7YiN3MfVHugASEoiDnNef/eYiWabM4lt3flDQSfB+JvL5aTgfnrM8iAOpHDEW2ZYHKkBe+A+nnMF9BkMOt5NZbjPmyLAE0338R2eKeKi3GBcttckpahOspcL09YDJHGH5OZs4dU6HGtBJA9OxXiVRbBYQkduNwDKpwsKJagqHvHU3Paw2F/ptffQF9rykoovcdbZuKrFxLLzGxDjed+a2bZq6FpZw2M7sdBapCoWaGQ7a1wsVTuYICFtsr5Pmy3IHa38frzrYJKgowWis/oatWUaIh30jBxNnBJKW160zVHoWuNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yh2mFQ+0Cpb5uIGt58jitZB5flsuF1WBGKMrMp7OPsk=;
 b=m2ryeP5dnAiz2or1B+kuWRl1FZ4EuYazKOwagWjRFbR38Z68kH3VH7V3AgNpffI++VaI/GVrXXPnnOI2i5qWIuYvSIM00H8ujggwGgYvc3Qv2z7xKfsiTMdzFiBKyxzw7ut4XGkff7D6pOF8jiQNHom7VADVG/nWxNiMB3bGtv7Sl4yfBoDKiACq5vGWDZwcu6rQAH9D0LM3X9pEJWmN9qO0Of5IjlIQ0yjYKFGRTqxGlWhgAwPR9Rj9q2Jcs1+vgkxbrM740dLQNKOQHA9YBWKpDPjJqw3RomJyLKbMuZN6I1hIbTfQsTuFkk6/kIl/YKxAT3o+Yt91n3pwhTLJFg==
Received: from MW4P223CA0003.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::8) by
 SA1PR12MB6945.namprd12.prod.outlook.com (2603:10b6:806:24c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 04:21:24 +0000
Received: from CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::ee) by MW4P223CA0003.outlook.office365.com
 (2603:10b6:303:80::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16 via Frontend
 Transport; Tue, 1 Nov 2022 04:21:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT017.mail.protection.outlook.com (10.13.175.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Tue, 1 Nov 2022 04:21:24 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 31 Oct
 2022 21:21:13 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 31 Oct
 2022 21:21:12 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29 via Frontend
 Transport; Mon, 31 Oct 2022 21:21:10 -0700
Date: Mon, 31 Oct 2022 21:21:08 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 00/10] Connect VFIO to IOMMUFD
Message-ID: <Y2CetBTVV1EkvDkg@Asurada-Nvidia>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <39eb11ed-dbf2-822a-dc79-5b70a49c430b@intel.com>
 <Y1+9IB+DI9v+nD0P@nvidia.com>
 <d8a0352e-9e1d-5b01-7616-dccc73a172a6@intel.com>
 <Y2BZHZXJwxF5C4a8@nvidia.com>
 <1ba21eb6-5050-d9ba-d988-a939bf6c821b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1ba21eb6-5050-d9ba-d988-a939bf6c821b@intel.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT017:EE_|SA1PR12MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc92288-8ce6-418e-d395-08dabbc0899a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: akU3VYuHU7cF9OpLKVqZiXZxayYNvJJ7drCffCXEuWSE9r+vbXbKoW9MSGPQDDf0l2jyDVLSOPVQHiLy5QhDUNJ9HwlRgbftt7N2OHN0xUivRV2Fad/j9bA85gRUdJ76Kbewh/QQ/gjyIvD6+XN9dN5FqOQ5UCXcz8rAUzzMHWzsFCeTMmghkOiKo+hrt5OIbqAyeNkImGeX9uOycUmw028xiOZTMO4H5C5t1WnKIeL0Ag085xChlF0+mS2bYnB2/7qr+bcjiKLDldGq8hyBNL2pKb2d6N/RvE5PWBbuGUtZiT5l2ZLPYX7v/tRlNeXfDEhj6pnb0tDEjmhIqygc7cr2qbucq9QzsxMcLkqnSCu0jJuytpitJghjHifjSzb2zAIbRwEPFa4aRa5tWo8kWuEcTzaohwj81D3UPtkbMYlNXvZDv7m6/hBLExileujL/LSmG7Y8Phaz4RJc0vB5LL1ttQ2iI8WmvviETHbWso3b8bPt9FDygyxlunyct7edfrFhiucGBso5oYt7QIHRgKGhzl7sT7GCiCHyqnilmM0b67NJP0s2gGtRJTgWIjlDyMj3gxkVdsCfvDYKDtLQSR3aWjVIDVmzdW4gfcpuINXsKsKrcpe/hvbaRh+Nmpec/M63vMEnXWI+ji5RSCWf2XiCwlN4mBTMOcSkpIHqhJfvKlGRm6e1CNHnz/Kjw7IrfdQOVRiCYeUZOWP8TdWyPdwEkV8NEvZOVq56jC0DhStPDYKK7+h0sJLoOCiT1qUG8D04PF9KEiYv4/I9Od1iCw==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(36840700001)(46966006)(40470700004)(40460700003)(2906002)(5660300002)(7406005)(7636003)(82740400003)(7416002)(426003)(83380400001)(47076005)(336012)(86362001)(356005)(110136005)(186003)(6636002)(36860700001)(478600001)(54906003)(55016003)(40480700001)(8676002)(316002)(70586007)(8936002)(4326008)(9686003)(26005)(53546011)(33716001)(70206006)(41300700001)(82310400005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 04:21:24.2149 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc92288-8ce6-418e-d395-08dabbc0899a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6945
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
 Joerg Roedel <joro@8bytes.org>, Halil
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

On Tue, Nov 01, 2022 at 11:04:38AM +0800, Yi Liu wrote:
> On 2022/11/1 07:24, Jason Gunthorpe wrote:
> > On Mon, Oct 31, 2022 at 08:25:39PM +0800, Yi Liu wrote:
> > > > There is something wrong with the test suite that it isn't covering
> > > > the above, I'm going to look into that today.
> > > 
> > > sounds to be the cause. I didn't see any significant change in vfio_main.c
> > > that may fail gvt. So should the iommufd changes. Then we will re-run the
> > > test after your update.:-)
> > 
> > I updated the github with all the changes made so far, it is worth
> > trying again!
> 
> gvt is still failing with below call trace in host side. vfio_unpin_pages()
> is still in problem. Any idea on it?

> [  206.464318] WARNING: CPU: 9 PID: 3362 at
> drivers/iommu/iommufd/device.c:591 iommufd_access_pin_pages+0x337/0x360

Judging from this WARNING, and since gvt (mdev) needs pin_pages(),
I assume this might be a fix, though Jason's latest change for the
iova_alignment seems to be added for CONFIG_IOMMUFD_TEST only.

------
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 72a289c5f8c9..185075528d5e 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -120,6 +120,7 @@ static void vfio_emulated_unmap(void *data, unsigned long iova,
 }
 
 static const struct iommufd_access_ops vfio_user_ops = {
+	.needs_pin_pages = 1,
 	.unmap = vfio_emulated_unmap,
 };
 
------

Perhaps you can try it first to see if we can test the rest part of
the routine for now, till Jason acks tomorrow.

Thanks
Nic
