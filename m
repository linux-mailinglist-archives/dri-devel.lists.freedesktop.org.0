Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACAB56A92E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 19:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4AE11A27F;
	Thu,  7 Jul 2022 17:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F412112AE3;
 Thu,  7 Jul 2022 17:12:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOA2TMoJwhQqk7dk2MaH7pX7OpMCkb983yqolPrTtCBK5Q3QkA5zInsXUWEyLeAJ3Ei22GuC8cbDnq3zIyrl3OC5QIlaqRTMrSjr63/YotUbHS6nsXCgmmtU/xuSeq9boDDvBdYHWuU6IeSCADdYjqA6OtJY4k7h6PjuuctFbLRYigQu5SFV7owqh8jyZb8wzk0bIOidvpiLaJWfyE3rerWAIVE2FRJcWUwYD39nFuml2EgR/WUscClfyRRFRGwPpjyyD2cIJyk2oQdLSd6+cJA5P8PR1FfOi8bKfSx+CJ5WYaYJuZcZw1x/xF0RNX4SKj/8zoqeI4KTHJMEJXXIRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCm6O0YicY8j1qKhujU6AubwGfSH1urWRCyC+VTLzdw=;
 b=lNd6KWSv5ijBFZY7bNvNbgdS5dP47bSUr7Bf2SuEHgseKI76uJe8+TSKVgwlY81qw9zE6f4IQ2DpRPelwDUjRTRjdgGfueeU9JMZPnkhugN+1/TUyM4WBNtHQpXV0wsIwvssXFJ/xvNU6whUAv+zKzzpqi8zzCCBNzOJMG/RCuZVBD2SeyZzYSGSz1M1xDSfwJBMN2OYI/Netor+/tjFE5IisnVoOM3WkFbei0ip6jKAdaNyEUurr8NGueWDetMEeNXIMRYuj0/TLzsFqv+637GxZ8E2J98gEg+2UyE/F9H4cZIGtW/t8cvGA1g07ULDR7qAmBa0h+QA7AL0arGxvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCm6O0YicY8j1qKhujU6AubwGfSH1urWRCyC+VTLzdw=;
 b=B2uak7AWNTdkMEDQeGcqYaPIo2P6AcYAP7pRU3aE7f6Y8RELGR3YDQIa2fD1glwDNVg5tRtmr6E5DmCOoGcxDppWKNnhyQ1i2lDPv+mLg4UTqFvqjv+KdeGU71mFCRwx5fxkjlOplV6mYVC+/DI/QGXivtWqQYDrAdm0DP3XqcpckL1pjWl3uNCKy4fSyUpcJC2hdGldu74UIrHTGoDE+Nn6RYXWQ17ZRzSlPs8zgvQNmNsqrneYe+h3T3qnnbTCKqWcb1O7kCQwnq7fTvYXqnQwOV5Xj9QpyV6l3NJ/OdjkxUAwrZJ2n5GB8DQPMLH3ULTpVMSSrIgRAvxPTTeO4A==
Received: from BN9PR03CA0550.namprd03.prod.outlook.com (2603:10b6:408:138::15)
 by BL0PR12MB5537.namprd12.prod.outlook.com (2603:10b6:208:1cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 17:12:51 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::dd) by BN9PR03CA0550.outlook.office365.com
 (2603:10b6:408:138::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Thu, 7 Jul 2022 17:12:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 17:12:51 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Thu, 7 Jul 2022 17:12:44 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Thu, 7 Jul 2022 10:12:43 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26 via Frontend
 Transport; Thu, 7 Jul 2022 10:12:42 -0700
Date: Thu, 7 Jul 2022 10:12:41 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [RFT][PATCH v2 1/9] vfio: Make vfio_unpin_pages() return void
Message-ID: <YscUCe+2sXdDiQWq@Asurada-Nvidia>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-2-nicolinc@nvidia.com>
 <BN9PR11MB527643D01DFF0AFCED1614488C839@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527643D01DFF0AFCED1614488C839@BN9PR11MB5276.namprd11.prod.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e1701f9-9a97-420b-a2bb-08da603becb1
X-MS-TrafficTypeDiagnostic: BL0PR12MB5537:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E3EtjXtySVw3iVeC8HyiwgH+GKSQdY2D8G1Z1uIA8rJprqRgHtvkPdg8LmBSW2yRshP+LUXWq5YXekymlB3Uqe1+9j2GeBElOFeUYinAQ4/TuWZ+GUNCOqONr1L28g99oVfEkI0Gifj/9OX+D1/OlF4VP107R7SrMXGKKPD1z24FUzKSl8e4oZ6jndIoXqiSxUt4WuEjSpefcX8l14r6Z275lq786cPLUQEikndm2aZEX8+ptJ0zLB0d+jwplY0XRhmU+mQSrfG9GoDQf+3nu6aI3LbEm4gB/5GuiC1XGqAqtRkMdVVHLVSHyuWK3frp6ZcDaHPS3LI+2sM+WhN1iRmBtk6wzsBAMMnZWZZ107OwAgwL2BSgwS/csuPzgUQ47qIaJaMEEjE8n4YsKwAtxj/1xeEmzc9mSfJ3heI0iKr1MTlDArrbRw3c711feX37ZgjXUoF0baafOCQrzUL1mS9QqwpJBpY7R+T3ybsHEUxDkaHB+NhFN9R5bReezutEusQ8PvIuVN7IKX98Q0KISATmPHjz3Zi9E27ruwB3CeB49DydcDlqfhhHf5QH1i6AyED/z0ZCmmf607ZXDyOba9g58NUBjnAKQ/hNOmOe99H6XheYesk0zlJD/c7iz3L2ANhvO7Wu8Zn+BAIu3Po9sGRTr4/2Xn7z7YEJoR4JurhLI7QiCWftlcs5aG5H+M8dV21VtPSvduw2zCXifdIY6R/bW1QdFihXv/+DLboNHCPeuQbkmj6WxH/PYXU+z4W0xV9/myO7PAMoxqPRKo+BoFdioo9y2DssvlEIIrqGANedBRZoy7/h7MOCQKqRmJHnFrf9cxyu4Rjae4hYopuHxZ3IxzbUeJ4ZXWCFN3eVyItaamohRaNuR2UPOIF/OH6O
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(136003)(346002)(376002)(36840700001)(40470700004)(46966006)(7416002)(7406005)(8936002)(82740400003)(186003)(70206006)(70586007)(5660300002)(47076005)(6862004)(2906002)(426003)(336012)(33716001)(8676002)(356005)(4326008)(36860700001)(26005)(55016003)(9686003)(82310400005)(478600001)(41300700001)(81166007)(86362001)(54906003)(40480700001)(316002)(40460700003)(36900700001)(67856001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 17:12:51.5029 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1701f9-9a97-420b-a2bb-08da603becb1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5537
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "vneethv@linux.ibm.com" <vneethv@linux.ibm.com>,
 "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "jchrist@linux.ibm.com" <jchrist@linux.ibm.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "svens@linux.ibm.com" <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 07, 2022 at 08:42:28AM +0000, Tian, Kevin wrote:
> External email: Use caution opening links or attachments
> 
> 
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Wednesday, July 6, 2022 2:28 PM
> >
> > There's only one caller that checks its return value with a WARN_ON_ONCE,
> > while all other callers do not check return value at all. So simplify the
> > API to return void by embedding similar WARN_ON_ONCEs.
> 
> While this change keeps the similar effect as before it leads to different
> policy for same type of errors between pin and unpin paths:

I think it's because of the policy that an undo function should not
fail. Meanwhile, indulging faulty inputs isn't good either.

> e.g.
> 
> vfio_unpin_pages():
>         if (WARN_ON_ONCE(!user_pfn || !npage || !vfio_assert_device_open(device)))
>                 return;
> 
> vfio_pin_pages():
>         if (!user_pfn || !phys_pfn || !npage ||
>             !vfio_assert_device_open(device))
>                 return -EINVAL;
> 
> It sounds a bit weird when reading related code...

Any better way to handle this?
