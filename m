Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E5256C136
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 22:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3C910E694;
	Fri,  8 Jul 2022 20:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2076.outbound.protection.outlook.com [40.107.96.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F4210E673;
 Fri,  8 Jul 2022 20:21:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQyT7RuOUR92xr61lTUB2crKcRWp2yNBdY0s6zmAsoGBl6FLewBV4Pr9raMgHlubkYNj10l6Oiinu8FQM7yAncg8xiuaPbh3+CkHPAsJ31Fr9rQE8cU2mtquQgYYKI6TiPJe1nrrADgjxy5jj4cKruwQWyPBKFXQD9+qA5N5Z9aljwuq9V+YxScb0BpdmLFl9i3WGepGiAh6rOVQ/xzIkcV1ro48F3MkEfA1wFD+aW9LwIjRNDZX4GfzBUqYCqu/bYzGAu0HzBMYhMSd3+vme/9l4dpzjtWDalmPZlNXZ5Cu3XW/TKPXUOLeV8hE7MdzjtDreNLxFW5d6pre1DnQhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Msy7ukrW3OuKDfK2Eh/XWirbhx5hE5hPR+8wu6tVeo=;
 b=B85OFlcyy2mX7/gGgZS9ftYRqwi8pZn8A4keA6MjokJaQlHNrdb3IL96vujPW8aKEjP17WszQHlE5dBsaK3KSdBpQOxKzjzBQLV0A0KE51pu+g5ylDmLr05PPLBCByE1Hz8+C4xnuHxkKA0gYmhO4Tx36JANT/pvSrhIuRnnAz8tSFBLk1dP6H480hMtcX51GR3SGPO8a/+4Y8uB0flC06t8NsyDDteEh2AK5lQ4rwbnMh4HMa4jOSvc+1K0O8fWcBP7KSNd2RLdG9TC9JdJ0HweQx6V9ROfOUw0XZHb+WrRHBkf9eCSI23bkg09dazfd4+M4waNveQ0bRlIgokbkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.ie smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Msy7ukrW3OuKDfK2Eh/XWirbhx5hE5hPR+8wu6tVeo=;
 b=p6Mp1Npa72dJMBn6+ZzSAP3YOeL1FDRieuG3UTk0pZfeAt6/DvuSmmDForAOKoxlmmbtZ4MUbCBfndAGv62rcw0X8nmfGZk5XKzVB4wfejg4aAFGiVhlM2TeLyO3n83ySJ08kMaF04Y2q4/vuG/GIQYwmIcK0eR0QxMhBqdxZV1YcRDhH9XNoQfDsAjIiqzubdHJ2rfZk22f5Om+Mm6rr3F9zN6yrft/gvlekOFkOqStUQyQynvXXofeSkkGXzSLv0bcKija6MmgWs5jYkppfrQJCzxHG2VnyMWV6tW4DQpCMfynvl2MmqFq6eBJw+lG0dgv1VBiwUJ05tVuJaH2yg==
Received: from BN0PR04CA0046.namprd04.prod.outlook.com (2603:10b6:408:e8::21)
 by SJ1PR12MB6049.namprd12.prod.outlook.com (2603:10b6:a03:48c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 20:21:12 +0000
Received: from BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::3) by BN0PR04CA0046.outlook.office365.com
 (2603:10b6:408:e8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Fri, 8 Jul 2022 20:21:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT020.mail.protection.outlook.com (10.13.176.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 20:21:12 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Fri, 8 Jul 2022 20:20:09 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 8 Jul 2022 13:20:08 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26 via Frontend
 Transport; Fri, 8 Jul 2022 13:20:06 -0700
Date: Fri, 8 Jul 2022 13:20:05 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Xu, Terrence" <terrence.xu@intel.com>
Subject: Re: [RFT][PATCH v2 0/9] Update vfio_pin/unpin_pages API
Message-ID: <YsiRdT0SMOlpAAYn@Asurada-Nvidia>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <BN9PR11MB52768822A11C158214C6A6A48C839@BN9PR11MB5276.namprd11.prod.outlook.com>
 <YsZ6h/XGX1RpXQQL@Asurada-Nvidia>
 <SA1PR11MB587341B9F173B87A8459CC7FF0829@SA1PR11MB5873.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB587341B9F173B87A8459CC7FF0829@SA1PR11MB5873.namprd11.prod.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17d5f056-6e79-4ec4-e3a8-08da611f66d4
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6049:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KZbMHPBA4DBNC5mL2rT6Dg2m9qrxElYiHFoU8F4SpzmXuadBr7w8TMnf1PKOlxJyxLtlWXfGKtbejhgN0JaZJWUDKw8bGZ2jXQ2px6pvEk5x6IQcJh59cZqtqUtm0I2T/JrTCVcrmk2m7ZsiWMYsHQsnFejpRASNOGfohwK7Mz6yKFPdY49QocUz3NnFWIOlJGbxY3OI/M22JbGjYd5f4egAB0kY/inYUYh0bb+2eHDG7I4gJI8ank9d9DC7j/o/biIgg7hmLU7yvC90k25CQq0KJ8xgBqmn8LqEj01aJttVvXqJHUzQ3bHY0Pj9gEa8ennz9SmF+x3chScqKfk4qNgLvh3izckmxukiudQEFdHmRWbGy9N0nbjRVBeBv97WdzvzBoUN6LK3cyp7iz0q8D05TGXhDLRRDz5m7FLho5B15S2GGU0xix8daqmc2rv0gWAOck22l5XuP+azmGkASBCUASlSZBpH01MUA5aifEGTh+C0Kzm69LrX8l1ppkhZf5Csljg0c6HvYyZRzPrQ7cFOhbSitoxF6a7kmWrKrQCNePpDr6hekQuYvWG9FhPK8JQI/55z3y39NWeYT9agLnic3DnACbODCY1oIGRN5QRg6E05BU0vCgh6Vy5bN9p3UOeVfAot7YI10xPPWV2PTCiN1lJTCWVlW9I51EIddgH0ac6EC5Z/pK1hBncoPUMAFFU5HJk2wpgCcUIOOVZ+V26xhoExmKcq97YnoFQnQXNIGLE+E38faUYdlEa5qhNpTJ8t665jitD9bmV28te2vqmbpMh94gIvjuPPVgi1tErI+V1VLkiFk8yd/oR/MlXMUPDhCGZ/s6s51/B8DHdApvsomnULYLJ8niHGD+l6yIgB/8YZxgKUyTQdYyS4CUoSt0cpoLzeqo+Jq96gGRCikgH2s/58KOxA5FcOq3+x3hKCT5oc+RjcA0ttwJ5Shky4
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966006)(36840700001)(40470700004)(336012)(7406005)(7416002)(70206006)(55016003)(40480700001)(9686003)(83380400001)(5660300002)(40460700003)(70586007)(54906003)(82310400005)(426003)(316002)(186003)(47076005)(4326008)(36860700001)(15650500001)(8676002)(81166007)(2906002)(33716001)(478600001)(6862004)(8936002)(356005)(82740400003)(966005)(26005)(86362001)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 20:21:12.1736 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d5f056-6e79-4ec4-e3a8-08da611f66d4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6049
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
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "jchrist@linux.ibm.com" <jchrist@linux.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "vneethv@linux.ibm.com" <vneethv@linux.ibm.com>,
 "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "hch@infradead.org" <hch@infradead.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "Wang, 
 Zhi A" <zhi.a.wang@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "svens@linux.ibm.com" <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 08, 2022 at 07:24:30AM +0000, Xu, Terrence wrote:
> External email: Use caution opening links or attachments
> 
> 
> > -----Original Message-----
> > From: intel-gvt-dev <intel-gvt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > On Thu, Jul 07, 2022 at 06:08:45AM +0000, Tian, Kevin wrote:
> >
> > > > Request for testing: I only did build for s390 and i915 code, so
> > > > it'd be nice to have people who have environment to run sanity accordingly.
> > > >
> > >
> > > +Terrence who is testing it for i915 now...
> >
> > Hi Terrence, would it be possible for you to pull v3 to test on?
> > https://github.com/nicolinc/iommufd/commits/dev/vfio_pin_pages-v3
> >
> > They are basically same but there's a new DIV_ROUND_UP change, which
> > shouldn't result in any functional difference, IMHO. If
> > v3 passes, I can simply add your Tested-by when I respin it.
> 
> Hi Nicolin, I already completed KVMGT key feature testing based on
> your v3 repo, VM booted up successfully and run smoothly, but there
> is a call trace during each time VM booting up, as the attachment.

Nice! Thank you for the testing. I will add your Tested-by in v3.
