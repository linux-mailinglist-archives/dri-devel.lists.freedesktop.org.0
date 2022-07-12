Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DACD857226D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 20:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5382D95B3C;
	Tue, 12 Jul 2022 18:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064C795B36;
 Tue, 12 Jul 2022 18:20:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juVHQNeoz6dJQ3JMdwMUmRVRXngIWkIaf9LgakPRvng4mK6veadFkHaa8kKLerZptQ6poldLfpBDaqUgkKnG55rjSCnH6ze223UexWHY3Xi+/X1kZxZfjG3PYbZGTu2OAQHo7bnMvSLwZUkMMVcAuUwthRmAAYX/ntZPzsaBvB+yNBdLA8tTPzwA2Fv68kAVWchbsN4SjirOBMmoahek8SwnTM1o7o4+AO5PjmUkisbUlEs2ZeyB5csPRjspHToh+eaA2Wmdzr9mqHHPsQqbl3FktJwU1Q13fgwh+vqmPAbuKZN4h5zmR21ykSQunI77S70KFOTlqNHZIZwaubZc8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbTtax5xbKOdmwQhi+CND6utj8F7L6oK0/d//wZC6tU=;
 b=T9eV8LEheSM8VwdxP0BEimbw258PXJX93AzR7/OtLUkkDo9ogKSmOiPdj52Ix+q4b0mDsGvcrfrp6h3C1iFt+VQMBE8T53gqlgfRRkMwdK3KCev4EWDErsNz5Ib9Vc4jipzPC5SmYjxH/V0Nep410s3L6Ek44zj0ugx10qzuqa8alqm843mE+rDXJbqTOWUixNhGwYrzJEgCigvZ63bWYEqKgAHshowl85xrxQWh9LO2pRqRghz0HXx1OuWmhI0MZ5sWgbEzX2GRwDgLzftGZ22BbG3vFcr0FmRk4sChlBQz1S6/xsYpa/0BJBPOTdQmZklUeIqWzcNW6PmKkK5m4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbTtax5xbKOdmwQhi+CND6utj8F7L6oK0/d//wZC6tU=;
 b=NYk55HyjxYm+cYvXZQ+9XDlwjjypYZyCzM6tnyHMZ0CaLJH6iS0NIrVisBxNm5fnO2x/Q99yZvp3Ge+poc/jXrJvSS6+E738sbAsgkSclcvYpJ0aZcaWr2uW68+ERENmPWpx4jMi2h7RoReSCl92SfAYX24kISc0wjtDT9O7mT4xqmTU4gEBTxeEihCYZQNal84kWEQQEancho5vIQSLLJVb4HzJwMGTyb2IoNxOIC6/oPEVOepz8AtCdBPWOqjj+G0fbOLNGF3drWXwx1rQVnK3g+8GgU7W/A/xz/385H1+MWhl+ksGuI1Pnu+YjRUBEXH/vgiLRNh403Koe95cjA==
Received: from MW3PR05CA0027.namprd05.prod.outlook.com (2603:10b6:303:2b::32)
 by DM6PR12MB3452.namprd12.prod.outlook.com (2603:10b6:5:115::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Tue, 12 Jul
 2022 18:20:14 +0000
Received: from CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::a5) by MW3PR05CA0027.outlook.office365.com
 (2603:10b6:303:2b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.14 via Frontend
 Transport; Tue, 12 Jul 2022 18:20:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT061.mail.protection.outlook.com (10.13.175.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 18:20:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Tue, 12 Jul 2022 18:19:00 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 12 Jul
 2022 11:18:59 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26 via Frontend
 Transport; Tue, 12 Jul 2022 11:18:56 -0700
Date: Tue, 12 Jul 2022 11:18:55 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Anthony Krowiak <akrowiak@linux.ibm.com>
Subject: Re: [PATCH v3 01/10] vfio: Make vfio_unpin_pages() return void
Message-ID: <Ys27D6/S6gQipMhv@Asurada-Nvidia>
References: <20220708224427.1245-1-nicolinc@nvidia.com>
 <20220708224427.1245-2-nicolinc@nvidia.com>
 <99c92c99-cd60-4034-8729-a90ac9a80a7b@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <99c92c99-cd60-4034-8729-a90ac9a80a7b@linux.ibm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8648e357-4c85-4d5f-1e10-08da643328b3
X-MS-TrafficTypeDiagnostic: DM6PR12MB3452:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nq7K+qT5ba6g0mFE7BfIznnZEIMkf+3kd5nbR77o6m7fplGvbuzgPa1/cbtxcCXyk5vPXS5xpKRMKP63p9cO7mdazSUKlW/9yBvkITNw+PsN19xYwPcGbHuFhO+wT7inemWPC19G2zaoUEpZNeWwlptNGvbFl3Gflbl9Q6jxfOfrHTGWbUaSEDIKmMdVTtRcyVKwVvi6EGluxfk5vT0W8xC0rr6nJ0i9HkYQlDdL2jmIK8IEKIZBNfZXe9zSjRqZUr+qSISU/EjCPPu5EeFnp0RA6gEolQZ/VMpW/H7gJcxHIAZGgYwfLalJyB83xYva8OGQGTPdcnwjGmYVExZZKQtuDX4OPCIc48pmsmZNen8w9F5MeCPuw+qtxJJJJAnC6slf63ia5RMfF/BwffskYV4gw+iGjdpAoySyb1in6mzjPsDX7/SfP4bCZWAzTxxrRf/gyk8OrY7uD2J53HfQgyIDwbQoKyEmsv8OeL23bH5G0iHh0lf/l00wQIKN6m4BR/E8tQq9lMif3sJS1B97YZfCeZwvBokKKdZDcl1BnAd7Z8kAjWL5d7izpQzEb3kYu37QpAiO442/ZQMqG3hzt6YxGeJjxNXJqNhVOU7yntmrn8IxWNk584cp2E4kANQ1Rf8PAmJNgNqbBBdrl3ekMuLgPWgekk5zlXnBhWzkxMyUlbgHMurA16oN8Yy/bietyCVFFgsTSB/ocQUcN3mImUHqcuFzpEzcVf+eZD/1kW/9rHDS43HRVVqWGQJGylaba+EXrzG2lLrQcIok5QhFozgiY5FtqSR5i9RXqLUfEwxz+ZnDpfHtPnJT6hFDQgHw5MN2yVjvlKJet1IIIvx1JaY9GWymaAXjXyh7/j9UVVLulbrFPxpoSR3Bk0Uwig7dLk3ef3mmlxMYeLQWLh4qG5CKOYrce38Jikf9fSaSuFWe4LJYhUebZP0iqc6G1lQ2
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966006)(40470700004)(36840700001)(36860700001)(55016003)(54906003)(40480700001)(81166007)(26005)(82740400003)(6916009)(9686003)(40460700003)(41300700001)(5660300002)(86362001)(2906002)(8936002)(7416002)(7406005)(356005)(70586007)(966005)(82310400005)(70206006)(186003)(336012)(33716001)(478600001)(47076005)(4326008)(316002)(426003)(83380400001)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 18:20:10.9658 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8648e357-4c85-4d5f-1e10-08da643328b3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3452
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
 pasic@linux.ibm.com, jgg@nvidia.com, borntraeger@linux.ibm.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, farman@linux.ibm.com,
 jchrist@linux.ibm.com, gor@linux.ibm.com, linux-s390@vger.kernel.org,
 hca@linux.ibm.com, alex.williamson@redhat.com, freude@linux.ibm.com,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 jjherne@linux.ibm.com, tvrtko.ursulin@linux.intel.com, cohuck@redhat.com,
 oberpar@linux.ibm.com, svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 10:21:14AM -0400, Anthony Krowiak wrote:

> > +void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> > +                   int npage)
> >   {
> >       struct vfio_container *container;
> >       struct vfio_iommu_driver *driver;
> > -     int ret;
> > 
> > -     if (!user_pfn || !npage || !vfio_assert_device_open(device))
> > -             return -EINVAL;
> 
> 
> You left out the check for !user_pfn?

Yes. I mentioned in the commit log. And it's in response to Jason's
remark: https://lore.kernel.org/kvm/20220707192210.GC1705032@nvidia.com/

Btw, user_pfn is removed in one of the following patches anyway.
 
> > +static void vfio_iommu_type1_unpin_pages(void *iommu_data,
> > +                                      unsigned long *user_pfn, int npage)
> >   {
> >       struct vfio_iommu *iommu = iommu_data;
> >       bool do_accounting;
> >       int i;
> > 
> > -     if (!iommu || !user_pfn || npage <= 0)
> > -             return -EINVAL;
> 
> 
> Is there a reason the checks above were not checked for WARN_ON?

For pointers, same reason here.

For npage, it's checked in its caller vfio_unpin_pages -- mentioned
in the commit log too. The VFIO core is the only caller and it is
unlikely to change. On the other hand, the plan is to replace this
vfio_iommu_type1_unpin_pages with IOMMUFD implementation.
