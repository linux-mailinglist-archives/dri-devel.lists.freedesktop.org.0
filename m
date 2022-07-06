Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 520A7568E48
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 17:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B56D11B0FC;
	Wed,  6 Jul 2022 15:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC4E11B0FC;
 Wed,  6 Jul 2022 15:52:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0QbMcVLv/lgN4P0ttYxrnTL6szYSy2z4ERhUSiUpBiRGVTU9oH6k4JeK/IozYcR1zi2FVisw4YHFnHgVWU6zfG9XjrzVVioLLFhD2t+9X+ORqt3vbfRV/Pa3Yl6E5sbee9QpaQv4bMX8Ff+SDZhsccD5ngBlE9omt7U3GeBxrJXJs0JO104hE9ONL3asU7944khuW/AokK1HQY5oJJmIKqtCR1RxD+33oII5eIEUcac/kurLhwzaCyCHRtFEyglvP6yhnthpyoDK5ngSG+kD+BavPTe55kwDwYeCbL8ohrJKGyS0AteSsMcnCH7D6VY1SNPpR0123MEYbBR1vjpMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHA8NTdDdhgx9P1LM9QYBQEaIXPhazV9+QslQRx+u1I=;
 b=lNb/8G/4L1mni++GFM+y2du8yl5olTtnO/Z1/0UCgwW1xfwBL83vAJT7rvh6tHGAm45UVyja1tnfFyjpDoSmaWPjyx6EtPRB9beLZ54eg/PAreYm5QkbO1pgfsIGX2LSMOMV/HW/sTg8OZuNMIQ0wVX69xutydGtHi5G0PTmqxlWFCcn4ldlHoInXbglS64gtylyYglvYw5kyDkVQAuLFNU9xHFnG4tVDrWa/xSe64ptihaNKxGKqybWd4S9MP/n9VIwnZglfHucXdIf6f0fOB0IbaUeBdr5Z4m/RwxoIt1ks5Ehzby/370+4ICXNkG+rnwNb4+43WACMyFEp1UrDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHA8NTdDdhgx9P1LM9QYBQEaIXPhazV9+QslQRx+u1I=;
 b=gX9ZKOcbJ2/U+iV3+97OffLuIUy1C0xInGrtf2PPtZ3WCsz0sEffg6yEfkAgP/JbEdTABgqUv6GYm3HdQrqaBFBmgg8ghYeCtfw2E4hyitPCKYyLrG5c/4DQtVr3pFhEhOHlaPRjzWPih/hVIUrQzQS0eRV0IiAzix1l5RC3VopjUoA2I0zMMomSUynmZFYYb2A8QjYK5LG+/PuIwiZC7nJKB88K9jN4LGK8gSV9oX2ZMhGvJVMyZw4ZlXizIikZE1C9vekMhbrk/hl5L/LTXd07FGJf0fSuLOrhLeXNtatr3EKRZfrCc+6LQeYp3wobWn8uIzs8Kcbi07sHxE5+dg==
Received: from MWHPR22CA0002.namprd22.prod.outlook.com (2603:10b6:300:ef::12)
 by CH2PR12MB4151.namprd12.prod.outlook.com (2603:10b6:610:78::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 15:52:16 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ef:cafe::bf) by MWHPR22CA0002.outlook.office365.com
 (2603:10b6:300:ef::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Wed, 6 Jul 2022 15:52:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 15:52:15 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Wed, 6 Jul 2022 15:52:13 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Wed, 6 Jul 2022 08:52:12 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26 via Frontend
 Transport; Wed, 6 Jul 2022 08:52:11 -0700
Date: Wed, 6 Jul 2022 08:52:10 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFT][PATCH v2 1/9] vfio: Make vfio_unpin_pages() return void
Message-ID: <YsWvqvlsccxmuhkv@Asurada-Nvidia>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-2-nicolinc@nvidia.com>
 <YsUxurAoglm7GmZP@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YsUxurAoglm7GmZP@infradead.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24a2e8ec-6764-4ee8-79fe-08da5f677fe6
X-MS-TrafficTypeDiagnostic: CH2PR12MB4151:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aXVZZPtNvCX9FKcwmmGb8hfhwdzryP74DNrE7QZENjJWUI06OlRDVruQvn3gv/vEmFeqD2207mgKe2jfe6f5B32h1dNb6izWzB56fuEB81WZQwM5vry3KzwpC7C/lymOdnhDFtjANfL33IcausV656p6ubkvPsrWtrn2OqCZNn2H60AGyHaerSstfUf90awB9NcbolJFVAq+gjBK96nYyGtBWUr8B77zRAPVViMavEoKzWgpNhOUu52Zd//VuY7M8NGCTJOJ+SvIeHxU4oiM32OOr1iq+bSFC7bGRJBw9bEX8layOQvhjO9/T001hLhEZgtxbFZj7FEbDjpyqUEIkkyoyW/uObP1KSSvNk5xcDHma2QA+COaoeN8lGGCQBakJbbKnl8CbkJRXWjPmUpJyl4IPimQZOFrCirwsCvBxFUMRtmmPPAPd6dnm3jRPhrG52kw/TdAb07swkZwIwgeoagZDN5GkmiZEUgjSoyt8Po0IQFejEg3Ikqfoe50/WvKrpUTKSRNn6SU9WTwiFlYC0/bkXx+syjJkO8XEiVnHI/1I/uORza1zJNb9mafzIrGPfuWr4AV87knnLXLYQzTb5y3lL+CZA2lfsBo5B0+/qhhv3lXfV3d6nSFH/xbi0TALj9qFHSsbS2dMHUORZSJIbJlybXx0tw2hZtO92K0S2n7gXO9sHmB/3+yYFBOAyRvs/chZjM8EDHZJC26wrHWtBN+eIPiFwQYsA4cz1lIombbA0MnsWEE4DPi0ImBtFtYL/iaTLyaR8T3UIlPyGlO7fvmojLTBJZY30tHtF5xDtIGm9Tkj2/GYeo89oiGiZSH+viVO+UiynySkbYNpmqk1GYfpjp7PuJKmHZQ+Strahs=
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(346002)(376002)(136003)(46966006)(36840700001)(40470700004)(426003)(336012)(81166007)(47076005)(82310400005)(6916009)(82740400003)(356005)(54906003)(316002)(8936002)(7416002)(5660300002)(7406005)(86362001)(55016003)(70586007)(40480700001)(4326008)(8676002)(33716001)(70206006)(40460700003)(26005)(36860700001)(9686003)(478600001)(2906002)(186003)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 15:52:15.7646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a2e8ec-6764-4ee8-79fe-08da5f677fe6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4151
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
 corbet@lwn.net, pasic@linux.ibm.com, jgg@nvidia.com, borntraeger@linux.ibm.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, jjherne@linux.ibm.com,
 farman@linux.ibm.com, jchrist@linux.ibm.com, gor@linux.ibm.com,
 hca@linux.ibm.com, alex.williamson@redhat.com, freude@linux.ibm.com,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 akrowiak@linux.ibm.com, tvrtko.ursulin@linux.intel.com, cohuck@redhat.com,
 oberpar@linux.ibm.com, svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 05, 2022 at 11:54:50PM -0700, Christoph Hellwig wrote:
> > +void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> > +		      int npage)
> >  {
> >  	struct vfio_container *container;
> >  	struct vfio_iommu_driver *driver;
> > -	int ret;
> >  
> > -	if (!user_pfn || !npage || !vfio_assert_device_open(device))
> > -		return -EINVAL;
> > +	if (WARN_ON_ONCE(!user_pfn || !npage || !vfio_assert_device_open(device)))
> 
> This adds an overly long line.  Note that I think in general it is
> better to have an individual WARN_ON per condition anyway, as that
> allows to directly pinpoint what went wrong when it triggers.

Following patches are touching this line too. And it'll be shrunk
to a shorter line eventually by the end of PATCH-9.

Yet, I can separate them as you pointed out.

> > +	if (WARN_ON_ONCE(unlikely(!driver || !driver->ops->unpin_pages)))
> > +		return;
> 
> I'd just skip this check an let it crash.  If someone calls unpin
> on something totally random that wasn't even pinned we don't need to
> handle that gracefully.

Makes sense. I can drop that in next version.

> Reviewed-by: Christoph Hellwig <hch@lst.de>

Will add to v3. Thanks for the review!
