Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FD0569142
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 19:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBEE11A366;
	Wed,  6 Jul 2022 17:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2041.outbound.protection.outlook.com [40.107.101.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6978011A150;
 Wed,  6 Jul 2022 17:58:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFK7IyUHyt3CfZpNhbrKdABOa7ipKpgm4yOB4KuTG1zAs9IQgg70rhtW7GiJD7em4CRvQScAvIGLDgtFkHufGF8tONWegJr+OK/h036zHgnE9Vrbrwc1CJe4YOSIoaNnjNP8RrnrUzjceGEHJndzgAJIXIVsgUJmrjEip3Mdh4zU8vaofFETgKdIKd+rWDzt8DUBiK7wfuyaYYL/Q4JjboAtKr5imTciP7QpalB4ClNc0uiZX8a7O+SGyZIr9v+7dQ7qr5Ul/0GocrxzxWrTCj0uTzobU6JpMlspKocKWdTIvszPDJma54uOx7Z//2SFtOHyyy84BA7SfUiSHhNnbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPy/J06G6hX0SzmKPcheFJ+8XyKc8qGgFAkOrPhloHs=;
 b=EbpMEiXJsn93F0Y9dBLvaUEw2wTxu4yotURBD1cjjA86V90S8yFitRbObTrKYuRwj7HMuhr71X04psOVPvEho7GWbHwiVRlgMLd8cdm1Pi8Fa6H06rb2URGeO8mjM3tTGRTvBk+cT0bcX7kXqDQFeju/TeAxtDAgpv4LW7F6XBPdS+aGK+ByucUOk59xHil+mn8qL3FMMazWRvwkzTqDazeArMEn+SNaAHPAOztN1Xid+2agx4S1L04WeWqcYKRyvdu8XQplX2/ToL8MQ01bxxFVRa1BxKeWstJ/CLiPQyi90CV1KK18h+phxg+DmAauAvbeN+v5Sn3bIt5uSagXPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPy/J06G6hX0SzmKPcheFJ+8XyKc8qGgFAkOrPhloHs=;
 b=SEFuceibK6l+l8d0L7YC6tkhbulKWv9AqzI7TBHjkMMZ85poXkBuKtenjTT1wUzn8wfvwGWZ4N7ASzW8RFcVPwQzztlf+FBdDCWGTZvi8+dXG4Z5rnOCx/XakwmbnwhjtBWNwM4XNGgBlTjlf55INeKywMFkVqr34Ll/iq6Uyl3//tFM4zc6witPQ3BGwckmLKvzdMLK+ISCQYwkxhg9/ARt1aZOMsd7dQIYduOGbqUGrgO6L2ThgMsbjw9CtIaWghXGB9dd3imDsQ0UqU60T4DhjnZe4NuNpPKHFiHq0sDoEmL5hZY5arl9PoNBSTG4TYFhXqL747+gNS2qFpSOng==
Received: from BN9PR03CA0082.namprd03.prod.outlook.com (2603:10b6:408:fc::27)
 by MWHPR12MB1646.namprd12.prod.outlook.com (2603:10b6:301:10::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 17:58:55 +0000
Received: from BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::ab) by BN9PR03CA0082.outlook.office365.com
 (2603:10b6:408:fc::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Wed, 6 Jul 2022 17:58:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT031.mail.protection.outlook.com (10.13.177.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 17:58:54 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Wed, 6 Jul 2022 17:58:52 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Wed, 6 Jul 2022 10:58:51 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26 via Frontend
 Transport; Wed, 6 Jul 2022 10:58:50 -0700
Date: Wed, 6 Jul 2022 10:58:48 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFT][PATCH v2 4/9] vfio: Pass in starting IOVA to
 vfio_pin/unpin_pages API
Message-ID: <YsXNWEanlfb+XliN@Asurada-Nvidia>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-5-nicolinc@nvidia.com>
 <20220706174923.GL693670@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220706174923.GL693670@nvidia.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01a0b431-32da-4efe-86f4-08da5f79314b
X-MS-TrafficTypeDiagnostic: MWHPR12MB1646:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NOhePn7xL9rxZ+DVL0zJp9UHo+CONGkkyXJ6THMAz2X8kzXQXVa/fE/4KL4caqdH3J4jTifXAkHVncnAzi+SOWriUAeXWSLqi4RC2gucNEEvYGMheIZ5yVM0HY7nFA8BLv3q2vfYuPCziLjUp31hf8z6jObPUDJSm6p11NsePDSL4EMcp4gOHFwhZln68/I53Vt6dmwU9Bs/Y9cObmBIV1A2E4sLsrYzymhZNtGKNcCOFuNkLxiAlhI5E6c4yKtz1ylCIYVd6pPhEWMDhTFzetPO2uGs7Sa/Pn9pxwZSdlgVeFG7uXIi3ZNR/jVubpmOMqb6bxpKoWQps+rkrewwltq8jYh7fK4CpO9bBCzEL17jkSNqO5zOumVIzDblg7PjKY4ysCEvtqWKp/1lWRQWBHad3syWiI5j9qiEwdtFVKmW4ZoJ6ha1kctmLPdyDbdoRyHMIaLO1Mlj6w129v0ABSKx9die0DMmxvlD51V22ZSQFugHVeePWVvXDNPQSXpoJYIMibdnTJvrHcCO7hKbvNsE4BqEw5PrCcUCpNY2B5MEvCF1hZR9D13/6d1cpoOCqA2yebseTUfO0hWND5cHBpPfiHZOGFOylYzXPSOo+nIMiPzg2TDzMaVEskzR8506kQyEkBm1Ip4rqN2EhKhQgdtxwGSrx/vxGNHWCQ9ih0qoDgqVE0LsfJGFHwK1q0dAgVDBbql01EHkH2YE9iRlBZGfubQbQWCBCfyMz2qjcLlQuEV7CT//7BTzXCoWQh1HJITrCUV/759YK12dPhrCkdJWpM+FPaBpJqsAFkigNyBxXxkl7yEJBukulh9oH9SC4mmK29T9mJrA0AAkZmTdkh/68y2IdJRtkQ2g3GEytI6VOTCK20vm4lZIGdO+np3u
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(396003)(40470700004)(46966006)(36840700001)(41300700001)(9686003)(478600001)(186003)(26005)(81166007)(2906002)(426003)(47076005)(7416002)(55016003)(33716001)(40480700001)(82310400005)(40460700003)(7406005)(5660300002)(6636002)(8676002)(8936002)(316002)(4326008)(70586007)(336012)(70206006)(6862004)(356005)(82740400003)(86362001)(36860700001)(54906003)(36900700001)(67856001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 17:58:54.7186 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a0b431-32da-4efe-86f4-08da5f79314b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1646
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
Cc: mjrosato@linux.ibm.com, linux-doc@vger.kernel.org, airlied@linux.ie,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kwankhede@nvidia.com, vneethv@linux.ibm.com,
 agordeev@linux.ibm.com, hch@infradead.org, kvm@vger.kernel.org, corbet@lwn.net,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, jjherne@linux.ibm.com,
 farman@linux.ibm.com, jchrist@linux.ibm.com, gor@linux.ibm.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com, alex.williamson@redhat.com,
 freude@linux.ibm.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 tvrtko.ursulin@linux.intel.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 06, 2022 at 02:49:23PM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 05, 2022 at 11:27:54PM -0700, Nicolin Chen wrote:
> 
> >  These functions call back into the back-end IOMMU module by using the pin_pages
> > diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > index 8c67c9aba82d..ea6041fa48ac 100644
> > --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > @@ -231,16 +231,8 @@ static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
> >  static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
> >  		unsigned long size)
> >  {
> > -	int total_pages;
> > -	int npage;
> > -
> > -	total_pages = roundup(size, PAGE_SIZE) / PAGE_SIZE;
> > -
> > -	for (npage = 0; npage < total_pages; npage++) {
> > -		unsigned long cur_gfn = gfn + npage;
> > -
> > -		vfio_unpin_pages(&vgpu->vfio_device, &cur_gfn, 1);
> > -	}
> > +	vfio_unpin_pages(&vgpu->vfio_device, gfn << PAGE_SHIFT,
> > +			 roundup(size, PAGE_SIZE) / PAGE_SIZE);
> 
> These maths are DIV_ROUND_UP()

Will change in v3.

> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks!
