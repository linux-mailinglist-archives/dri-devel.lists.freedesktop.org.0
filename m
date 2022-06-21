Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CF3553D74
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 23:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C898A10F61B;
	Tue, 21 Jun 2022 21:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F01010F52D;
 Tue, 21 Jun 2022 21:21:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9tCpbDH9Fk6Kcr2QUm9x/h1nhltk5oOwp87NCOkB4ec+37hu2fAkhDseRI659gHxAOJV9aV+TsnjCyetZFsULZ4ZbPs7zLOQqZLnuvDRh7HTLYdA9mpF9IlMN0I3fELW2sW7hcM3QYi9jaF1QrutkrBdGU/fReqnCvZPxWEDUvW7tdUbwDpw82Dz6brWMpIOaDtcfZjFUfqdwQ8U/CqrxU1aHMlMsNRwOqwgIU+vVf6s1dujfhHVfYjrH69LH4y8Glr/puCYYDSIIl7TbW4g2j6HNFc95nTlI8muvi3jXIYvKKw1AUXaIjkpQJLsxg5WvdImiI4FJkNsNmvYV1ZgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/csMImmXMS8W+ncO7h86h8MKt61Fpz6P3qybQ1Of5Y=;
 b=LHp3TOwaLQLRotocyO2lyaNUv3a8U/EEUXcd0MxBwEarnvLnxGHB+fp8qYz14arJd7p9SH+Y0eqF4cv9rzyxX/kZ+E5Ge3juwgmt62tTg8FRyy2eEtwlJMIdI20vG/LrkmqEik9R9mbba4pUivCyGOT2Yu03DfTNXvuOV4t7CYZi5v6wmiG5Epc2A8uoIAPh6AeZAPzEM+QoutgN2KNsPJDhW5vt43QoDESOBDrBPXY6RXfhDTJxQDf9kYmeAaCYGerbIyuyAMdhgyDOBxi7h8bP9IpGYCsyoBfcitGjmfHMmy1Zk4BHOlgwaCvRmDPzNfD2M7L5hENxWeZzhQ+LtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/csMImmXMS8W+ncO7h86h8MKt61Fpz6P3qybQ1Of5Y=;
 b=k9BgDV1VBCYyZYTGxHu0L/9ZT3tKKc1n/m8ogiHlM4VE7MGPnw+M14DLuXQoclg1jwTlCt2ghK1UeSGomvVzDieX4TvhIi/bDKDwNbTt3Md4pmWWP4k0rmqwetQDQrA1hjuEQxaYk5K99Z1UWBWVOblGTShPrK6V5npS1Bao+zLxOAmjF/Gd3dBahA3Q46oPd284wP2YDX6geIlWR+QNdvj0rWOi5IP4gVVaMjaPkgfd3oy+/S1sLvAxZDuSd+GWZaW4uDMXbhHyq7nyrCZ6EgNId9h51DM81iOVTXhK6DHS5ZJUzxv466pq2i9AdTPVjM5SUJxD/87agxFkaWZreQ==
Received: from MWHPR1401CA0022.namprd14.prod.outlook.com
 (2603:10b6:301:4b::32) by DM8PR12MB5414.namprd12.prod.outlook.com
 (2603:10b6:8:3e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Tue, 21 Jun
 2022 21:21:29 +0000
Received: from CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4b:cafe::e3) by MWHPR1401CA0022.outlook.office365.com
 (2603:10b6:301:4b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15 via Frontend
 Transport; Tue, 21 Jun 2022 21:21:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT028.mail.protection.outlook.com (10.13.175.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5373.15 via Frontend Transport; Tue, 21 Jun 2022 21:21:29 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Tue, 21 Jun 2022 21:21:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 21 Jun
 2022 14:21:28 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22 via Frontend
 Transport; Tue, 21 Jun 2022 14:21:24 -0700
Date: Tue, 21 Jun 2022 14:21:22 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFT][PATCH v1 5/6] vfio/ccw: Add kmap_local_page() for memcpy
Message-ID: <YrI2Ul/u6pRvt0rT@Asurada-Nvidia>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
 <20220616235212.15185-6-nicolinc@nvidia.com>
 <Yqw+7gM3Lz96UFdz@infradead.org> <20220620025726.GA5219@nvidia.com>
 <YrAUZ7hXy2FcZcjl@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YrAUZ7hXy2FcZcjl@infradead.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2232a662-aa28-4c05-38f3-08da53cc01cb
X-MS-TrafficTypeDiagnostic: DM8PR12MB5414:EE_
X-Microsoft-Antispam-PRVS: <DM8PR12MB54142DE1CF737009C21BE559ABB39@DM8PR12MB5414.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ju20LiE/hVT3OWFeuo+XyUQ1uwoFM58J1GnhfAZr3Anwt2ev1iTTMiMOAdGuswyUOWoxLkImGWG4VUMC9TlqvcY4qCKej2JHYr57VAW5U4P62dJwTxcnRhj8jg+aqMxfVz6ti55ODxCS2TThuftDhWaMLnxq2Z0Gk9wuq17rnDcZyeJ0VW6jQh2Nz4DgwLLEzYRA/QYVQJuQynMHshOTpitN4m3gQenH/nzxq0HrBW4ZREM1QROPqw9TngEup0yxiHWpYEWOnbh/776lr3pifhAw6tjXm0Pes9KQC6plNfdZo1Dpzq6J8DbUHSBTqvoneXbpZYf16TrON38jmRk8tzMiHJ2S8y7t9eZPMblIR2SHthukrLGL/UuSxgmQaQ4QEUspQPSk3bJnFhJuEgQKdjfkWFvPs1E6mdy51QQqn+rxV28p3nFjSnu699ZX+PxaTbSuZ2Y6OFwx/7MesAZmuUbJns3tUYh775EmMxdD8m4s8u+ZHlIZokKyunb9nUsUBfzG1YXt1vxShjVtqE93P7n9/0/ps7xpBRZNO9F0v5xyzQC2iLduYqu9YDmAumyJq1sQdVMK2PdiZGi5f9/Ph694XgD+RnhiR/VQEo4XbylBdHvUl8cXRyH5I/1VbongYZbGmk2sPWwqUD7AobjD8L3JzHeIfquVoeheCMEASc90UULfSSvw77MBKEyT69WpgoJQSkljAXeOHKSjzonJqNM1jyO42Ugg+PilIEiy2W2ppHLhthAxUbBpYhRpsN+A
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(346002)(136003)(39860400002)(36840700001)(40470700004)(46966006)(8676002)(478600001)(70586007)(83380400001)(70206006)(47076005)(426003)(356005)(6916009)(4326008)(82740400003)(86362001)(36860700001)(336012)(41300700001)(9686003)(54906003)(316002)(40480700001)(26005)(81166007)(186003)(2906002)(5660300002)(40460700003)(82310400005)(33716001)(55016003)(7416002)(8936002)(7406005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 21:21:29.3625 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2232a662-aa28-4c05-38f3-08da53cc01cb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5414
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
 agordeev@linux.ibm.com, linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 corbet@lwn.net, pasic@linux.ibm.com, Jason Gunthorpe <jgg@nvidia.com>,
 borntraeger@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 zhi.a.wang@intel.com, jjherne@linux.ibm.com, farman@linux.ibm.com,
 jchrist@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com,
 alex.williamson@redhat.com, freude@linux.ibm.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 tvrtko.ursulin@linux.intel.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 19, 2022 at 11:32:07PM -0700, Christoph Hellwig wrote:
> On Sun, Jun 19, 2022 at 11:57:26PM -0300, Jason Gunthorpe wrote:
> > The remark about io memory is because on s390 memcpy() will crash even
> > on ioremapped memory, you have to use the memcpy_to/fromio() which
> > uses the special s390 io access instructions.
> 
> Yes.  The same is true for various other architectures, inluding arm64
> under the right circumstances.
> 
> > This helps because we now block io memory from ever getting into these
> > call paths. I'm pretty sure this is a serious security bug, but would
> > let the IBM folks remark as I don't know it all that well..
> 
> Prevent as in crash when trying to convert it to a page?
> 
> > As for the kmap, I thought it was standard practice even if it is a
> > non-highmem? Aren't people trying to use this for other security
> > stuff these days?
> 
> Ira has been lookin into the protection keys, although they don't
> apply to s390.  Either way I don't object to using kmap, but the
> commit log doesn't make much sense to me.

How about the updated commit log below? Thanks.

The pinned PFN list returned from vfio_pin_pages() is converted using
page_to_pfn(), so direct access via memcpy() will crash on S390 if the
PFN is an IO PFN, as we have to use the memcpy_to/fromio(), which uses
the special s390 IO access instructions.

As a standard practice for security purpose, add kmap_local_page() to
block any IO memory from ever getting into this call path.
