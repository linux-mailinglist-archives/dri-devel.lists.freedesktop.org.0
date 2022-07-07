Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686E956ABEE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 21:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA98514A0EE;
	Thu,  7 Jul 2022 19:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE4C14A0E4;
 Thu,  7 Jul 2022 19:38:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwoRsytEuwtSNxaVT7Zn9thspwO5RAzWKNov3fjFlo6XETQS5WB88tOBl25jX+VBHl+0lY0EmcXtfbuButeX3B9RCkdFdsnC6rT4RIJBm++g/x7leAY52SEwB9DX74e7QrsH4qmdNzkMeJSatxvGMy1xxeFStSdkAfYE9TpKVYH/VMbBXWjhJ3t1I6txbHQ9RJhcSp/GF8fp8yzJWeJjdKychNiHtN0qt7dqffOfuG8hPM3vHTZyKfFy2p5qPxu19ae6rb7b4XrkCDy+ix2C3XvB/LXFqRwXbmExlXmsZtdRMgrNtW3XXaoLIXX4SQ775YkHwXVtwJK4Rko7vejS1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1r2MXbwEU03ktEYKpbwsl7haoYcDTi0f+THMD5LQyI=;
 b=GegeAxHsdtuyzTae440EIRWL8sKdDFn5ENTs3kGUnyPnbrWHYh0VHdreG5x0oCigiQzIQ1LQPg2HOPSquhsIov+msB8Ej5ZA3b6VS82e/xYCXXKN6wVALqgtEkjGPVcJFwRCfd9LVwShZVelR7vskG/XqEfKw/XdiQI9idbxPfh0EiskaxG/glZfri+xtskraFMGIXWzXGpJVY2ndD/1EY3wtGIdUddSbYsIwAs/VNRAJdXlpkbhA1MDaN/g/nWhCNTBYKNSn8zR5Kz3zPmFAzcNHOfFn9/fHW6PItsCA7AvKsOQY8Jns4KMU3eV+Vc0fcsFwwv2pKb93B0Ipm3oTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1r2MXbwEU03ktEYKpbwsl7haoYcDTi0f+THMD5LQyI=;
 b=EqjDfcbpK2o10ltQQntOQWUemMvWiHjdjrPD2gLaGq9GyxirN5VY6nClIrJWhU1GdY/hSqFQTUIu1g6yCvr7zeeL4PjrmbxRXTV6YviLc1znHHaQRaSgeRxdaDjpwkDCw1iyCY2SCUZtRwm2qFV547WDGtF4p38jw+89BjhfQTESnmviQCyly3LdCq6RxMKp/MAPJYg4bn0z+gn/HPNtkOfgDXPMrhzQgGaDC9zP9cyD3qHaGhdXN1R5j+lxyHoJSJ4iTUZdrp0yM0KirXvxpLwH7SkhyHRbeyHAyiniOO5QY22Q3laRz7AryyeQQ4ZBkpPFJlX2EFUHWLXdRRf1gA==
Received: from MW4PR03CA0352.namprd03.prod.outlook.com (2603:10b6:303:dc::27)
 by DM4PR12MB6135.namprd12.prod.outlook.com (2603:10b6:8:ac::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.22; Thu, 7 Jul 2022 19:38:50 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::bd) by MW4PR03CA0352.outlook.office365.com
 (2603:10b6:303:dc::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Thu, 7 Jul 2022 19:38:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 19:38:49 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Thu, 7 Jul 2022 19:38:49 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Thu, 7 Jul 2022 12:38:49 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26 via Frontend
 Transport; Thu, 7 Jul 2022 12:38:47 -0700
Date: Thu, 7 Jul 2022 12:38:46 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFT][PATCH v2 1/9] vfio: Make vfio_unpin_pages() return void
Message-ID: <Ysc2RnPC+CsyhPhf@Asurada-Nvidia>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-2-nicolinc@nvidia.com>
 <BN9PR11MB527643D01DFF0AFCED1614488C839@BN9PR11MB5276.namprd11.prod.outlook.com>
 <YscUCe+2sXdDiQWq@Asurada-Nvidia>
 <20220707192210.GC1705032@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220707192210.GC1705032@nvidia.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53b255a2-ec61-46d6-b2c4-08da6050510a
X-MS-TrafficTypeDiagnostic: DM4PR12MB6135:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D0weu0ebx0jct5GHyy/fUkzDLKHwsyeH9+JTP4amYNPBOiZAkBPUjw/pMI2jksSZBAWsd9/Ve1SoB+vtw1xlUgxTqfYtUZWCCjWUU56YFfIzudZGEUuah6AZCu1K9UKa3Xt60/H9OfQjdla0axGV5Kk5Im3Uip2w2MK9mmoMZoVr2iX7X53XGfwPsYqN89Njjz2Tq4WjR364RcSRuZ9JsycGF33ZunuID3PWEe9QMsAUFm1grUntH6jx3BRT/sw4wOv6lG+8eFfOPz0P+oFtqYQHSNv3ZIsSxHiN1woQMI4y/csvEijHYFwMsvT7DvUirp11QKPbjFDYhnEPmt5jXZXcDJNVUYMhzSZizYBfHGk3pfLqY9zL8PPuh1JJxReLx4XXT+Ig8eyI3SN3AZ6hCbYpUEVD9Vxh/Ew9Xne4WdE2FLMKtx1tqjxaY3hDXczZ9AS12o7ArUKxgifR0vHqztYyUDppRFUrg1wlV005cqhh/+65J+Gv/IiNSBpAt1DsH0aa/4MI2Q5b7/4dxjgbOWKE1ItPoZxg9LPwsIjKA5Xtd5ogCHOU/KJlDTn5eWD0Ph13Not8QpBqGhLXbo1W4IOUfenp56oaQhBQgaSqo8bn+ylLFZhI62pEY0ccvUHdfr2rlnSuA/g5t24EhIHpj3exQvtiONAgZvmkgDB5TBwKVY9ZU3um7OMYFY2lNaXcl/U41H7BNvz9Hr3WpBu1Gz2cPqP/jN78BbuZnyejGMOaTpnYH3oGKqc+TqmsPpczf9Wv1nEd6/5OBwJsaQr/WlUSFID9ulFDzR6sI+rx3PzRm3pqnaOx57cLg4BNmqmDccYtLgCgTqt9GelvQzCrH1kStcrli+uSHty0+zygEbrWqpS+wYDRrCRdtu0arSCj
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39860400002)(396003)(346002)(40470700004)(46966006)(36840700001)(40460700003)(33716001)(7416002)(54906003)(4326008)(40480700001)(6636002)(7406005)(9686003)(356005)(55016003)(5660300002)(6862004)(26005)(86362001)(70206006)(8936002)(82740400003)(70586007)(316002)(81166007)(478600001)(82310400005)(186003)(8676002)(47076005)(41300700001)(2906002)(36860700001)(336012)(426003)(36900700001)(67856001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 19:38:49.8402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b255a2-ec61-46d6-b2c4-08da6050510a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6135
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
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "vneethv@linux.ibm.com" <vneethv@linux.ibm.com>,
 "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
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

On Thu, Jul 07, 2022 at 04:22:10PM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 07, 2022 at 10:12:41AM -0700, Nicolin Chen wrote:
> > On Thu, Jul 07, 2022 at 08:42:28AM +0000, Tian, Kevin wrote:
> > > External email: Use caution opening links or attachments
> > > 
> > > 
> > > > From: Nicolin Chen <nicolinc@nvidia.com>
> > > > Sent: Wednesday, July 6, 2022 2:28 PM
> > > >
> > > > There's only one caller that checks its return value with a WARN_ON_ONCE,
> > > > while all other callers do not check return value at all. So simplify the
> > > > API to return void by embedding similar WARN_ON_ONCEs.
> > > 
> > > While this change keeps the similar effect as before it leads to different
> > > policy for same type of errors between pin and unpin paths:
> > 
> > I think it's because of the policy that an undo function should not
> > fail. Meanwhile, indulging faulty inputs isn't good either.
> > 
> > > e.g.
> > > 
> > > vfio_unpin_pages():
> > >         if (WARN_ON_ONCE(!user_pfn || !npage || !vfio_assert_device_open(device)))
> > >                 return;
> > > 
> > > vfio_pin_pages():
> > >         if (!user_pfn || !phys_pfn || !npage ||
> > >             !vfio_assert_device_open(device))
> > >                 return -EINVAL;
> > > 
> > > It sounds a bit weird when reading related code...
> > 
> > Any better way to handle this?
> 
> They should all be WARN_ON's, that is the standard pattern to assert
> that function arguments must be correctly formed.

OK. I can change that. I assume that, not confined to arguments,
we might want to have a WARN_ON for the return value check also.

> I would also drop the tests that obviously will oops on their on
> anyone, like NULL pointer checks. This is a semi-performance path.

OK. I will simply remove those NULL pointer checks. Actually,
that !user_pfn check is gone anyway in the following patch, as
user_pfn is replaced with iova.
