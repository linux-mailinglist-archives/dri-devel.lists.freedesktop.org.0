Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C56462095F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 07:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD7210E20D;
	Tue,  8 Nov 2022 06:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FC710E1FB;
 Tue,  8 Nov 2022 06:11:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mB77nHgcIwBe/gDrvOuxvZFGTq7XY2Yv2GdUWNBJfu50+beWoMKOW7CLGDuruZJi/zbCBr0yO+NmAhxVjoijWKfxlTOCQ1vYWjQaDQ7vr2j60BLPCNKD7gHOddlTPcVGBLtYRusR5s4sFw7cfAmOhoCqRtnmkz77+g6eTJAD5JzjebCq35yoshpuWj54Yy6nbadKkFPcx3etZFRTpX4LebgA09GdTmi/p68UrW5U4j6uumcLQt/UKbeJOQnXDFL+J+HifL6tBqSu75Vr7b8E8yNifoohjGXIjer2axue8OFudxlvrr+NNU+VvBzWjrM2//KEazAqAKPSCyEIQzGUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WnoioEVcetE6Yu2IPySjPOqBNWEAAW/hHxIXxOXLPow=;
 b=biqu/XT3gOcXP05wI/rItoYuZ9eSUXjndP0OI1sbN/2YsAkOLI6aCXluX5Zmy0TSTUVZpkQAJMJ6S0mww8TPM/CiWihBc8Ywi1LIAyNF7Z+sstvoZwtnkDgEET6pXliLdJ5cLIhmjOIBWg3f3rGhDOB5uplYlv5JdsDPbPeyNwErdJuiuEgzSx++AdJz24vellj0zbRjO/Q50uhG6cDp2YBqtZTDfphbOl2LyH5+bxJgvSWwhwXPE7kGZ0H7wObAuG22DN8sYRhV6t+Ld6JebakwbsyXeHhMc5t8c1kIuCfwVgQqBdrIlbPDcdDDEj8cs2ZM0p8V0MYiBscp+PQyRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WnoioEVcetE6Yu2IPySjPOqBNWEAAW/hHxIXxOXLPow=;
 b=OQTdYViNzy2SXdnmQn79OYy2Wp1KHQjeWvzg+yRucidgTxeO5H3pS85ryTBxSNDTsFJ/9yIFpHLbCgRIMMGrARLqBeuXa80X0+0VdWhVDENlp0byB21off4IhyorIBPteX3RXAEY6yDavJno+GcWGO6iP33J3SonndIpbYq9rrO06cc++wivnHR68+feGoaoKo87RJCm8ii4wh6KrBPEkVBBpfB6sN0HIUn+cTcnfZ6DyU1vCn+ihC+g8BnP8F8dlD+cKaDqbk2PVt93k9Tu9teX7fG9m5yjC6GwetqTxEi1gGGAMDX4ql/MY0ULg4DZloba2O8jVsXgVEsU8gUgKA==
Received: from BN9PR03CA0474.namprd03.prod.outlook.com (2603:10b6:408:139::29)
 by CY5PR12MB6623.namprd12.prod.outlook.com (2603:10b6:930:41::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 06:11:15 +0000
Received: from BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::6b) by BN9PR03CA0474.outlook.office365.com
 (2603:10b6:408:139::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26 via Frontend
 Transport; Tue, 8 Nov 2022 06:11:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT007.mail.protection.outlook.com (10.13.177.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 06:11:15 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 7 Nov 2022
 22:11:03 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 7 Nov 2022
 22:11:03 -0800
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29 via Frontend
 Transport; Mon, 7 Nov 2022 22:11:00 -0800
Date: Mon, 7 Nov 2022 22:10:59 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 07/11] vfio-iommufd: Support iommufd for physical VFIO
 devices
Message-ID: <Y2ny84qOFQhtYVPF@Asurada-Nvidia>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <7-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT007:EE_|CY5PR12MB6623:EE_
X-MS-Office365-Filtering-Correlation-Id: d97beff8-2244-4707-e96b-08dac1500b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eX/DR9d+WdmomNfqfq9LukMvFhRrxvqoBdlIzG396PRBPZiFVwezyg9OhmdoftZtaMoEnNiDQIuJSs5SiX/cf27tnnuI1xnPyyJh0vlBntzHq5lCyzYk67CJFDY1bzOolIth5MwGvz5Q5fa2E/OJNWjwsH5so5v2kwF6ZbCIISM7P8t6BLUYPiR+vtasm8vZ0M5YoTmjnUwEckKXKk4S9NfUW/6kcWtAAjbdOWgPjmoXMUxsNdEvN/OZpJR+vDZ1t/0Vd+348CKnI66sSFqdQPaR+sePlCY1u/xhLL/VZkpT618hxx8WKQBCzknlWvMnItgEhfrr+C6ZIaj1B+InL5FfAm91ZKwH/ZFOgAMPx7QE87xQg5WqKpYoNMA+27/pt/IiW05vvgoJOGqnak3qEBJN8HiPkho2uOM6SldQi6dTyH1n/6FrwHsJWCcvDtuMjU4jkOCsm/Jg99Hm/5pDGtoRi+QqahA3jZneoC1f1p1oobq5hXTpz+lSqWcKDRXnYqdeffnuH07YpCMk/miwMne4VD+H7mEEBnchz1QXyJQVVgAPoQ9wAaYQ9emhQVrWiuzEDPjxzLqBCs90/Bkz/FTrp9fhheTVjDP2Tp9nMFT14vXroDuCP/QmY/Grn915oe7ZpCSrjIozoFSyR8ngEveTzUrgONUp5mEP3KD+La+6unZlM4ZShQ6jatdEOa4IY3HNsvzYNIAnli0GhzokeS0wRqCVhQAUd9EU6cFHk4ma0M9fcW20qU8m4fsf9fXR3s7T4bjRwpOhCEGvUUKm1A==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(82310400005)(36860700001)(83380400001)(33716001)(86362001)(82740400003)(7636003)(356005)(55016003)(478600001)(40480700001)(6862004)(8936002)(5660300002)(7406005)(7416002)(70586007)(70206006)(8676002)(4326008)(316002)(54906003)(6636002)(41300700001)(26005)(9686003)(186003)(426003)(47076005)(40460700003)(336012)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 06:11:15.3221 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d97beff8-2244-4707-e96b-08dac1500b2a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6623
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

On Mon, Nov 07, 2022 at 08:52:51PM -0400, Jason Gunthorpe wrote:

> @@ -795,6 +800,10 @@ static int vfio_device_first_open(struct vfio_device *device)
>  		ret = vfio_group_use_container(device->group);
>  		if (ret)
>  			goto err_module_put;
> +	} else if (device->group->iommufd) {
> +		ret = vfio_iommufd_bind(device, device->group->iommufd);

Here we check device->group->iommufd...

> +		if (ret)
> +			goto err_module_put;
>  	}
>  
>  	device->kvm = device->group->kvm;
> @@ -812,6 +821,7 @@ static int vfio_device_first_open(struct vfio_device *device)
>  	device->kvm = NULL;
>  	if (device->group->container)
>  		vfio_group_unuse_container(device->group);
> +	vfio_iommufd_unbind(device);

...yet, missing here, which could result in kernel oops.

Should probably add something similar:
+	if (device->group->iommufd)
+		vfio_iommufd_unbind(device);

Or should check !vdev->iommufd_device inside the ->unbind.

>  err_module_put:
>  	mutex_unlock(&device->group->group_lock);
>  	module_put(device->dev->driver->owner);
> @@ -830,6 +840,7 @@ static void vfio_device_last_close(struct vfio_device *device)
>  	device->kvm = NULL;
>  	if (device->group->container)
>  		vfio_group_unuse_container(device->group);
> +	vfio_iommufd_unbind(device);

Ditto
