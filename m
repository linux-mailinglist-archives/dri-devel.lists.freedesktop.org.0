Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A901C553FFA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 03:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A411133F3;
	Wed, 22 Jun 2022 01:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977F81133F0;
 Wed, 22 Jun 2022 01:18:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DzSzju4+YTAu7vWWXUdenqShMCW+XQjWeoKeLhQb6UwzMZyDLcTclRFiro8tsv+s8xDF1VZAgSzSNEhwY+JoPD3PjBPQCzDhz4XdUU7gkkpKkDm3G0LpQP+0PYoiGPzjvpWTfZ8ulMA3J2URMKzPjrLhQYlNLYdX/BOrM9zTJr9O5DHaDEenAgG3/rAU5Gmx9z7HHzpil4fiKpDutHctnHnV2gZv3khl1ZARY4McvI5nIBGw6kXztwVvCYlMlg5H2PaOuYQyJSkykkmt67rBuqEvZXAhvM53xeHw6CbSZgs1bM1JKmBrf5mMqpRUt9SxlqLRy64hFaTe4yqsWITzfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6R7zljjET4b4JFP9tlx1Hg3i1+RDEOLnYjgG7YWpfo=;
 b=bYFB5w50uknWHxL8AGeBSCSfTIuyfvyULTAimBOtjtSe74dqoWTmiHaYTyt8KPqKZWe2474kYOQrUsy8Q/lpONjdjrZ3/wo5juD09lNVIuyuNtXPjVIiGCtKsTGmKPp333ojGHuzy1IpBR6HrVM+wkT69Nm54Lbk6zVD7HC4IyhaT6rmvht3ch7bx50a8+GGhFc9Z/1c/ZaE3ZSE7ObUgIt8m0WuCvAmFgeQEDghNPTtbepR2DEulwr/5m9ykUSwkoacBwXYqgZFaIQ4Xfe54fH/YREfncpJ5FO9GxXpZu2VleY90zjpPcHMLSC4/qaw0bQwbXwlX7IsArtYh3Bawg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6R7zljjET4b4JFP9tlx1Hg3i1+RDEOLnYjgG7YWpfo=;
 b=Dc2749nue6ilL6Jy23nKSMKWjxnukq1m3/69siB7YJ079BeAE/FULesjU8Fs2v4KjlURrZHoyBxv3k8MdcMHNkdGC4fXzbWhGDENoS2wM+Erpkj8bs9R8/UnQ+cmnL25HTQFNWv/2nQ6Wc/fDXfFdxH+d6Qh2F4pD6BB+MRE57TB3b8I8EZ2CHTneQGoF4iqnfBlx0AjiiZAKvRZzvV8NejCHDhZkdm/mz9IdA0FQ+HRjMs9NVstPQ8Jgp17iNuLqw93tLNfvPgtrb0SL66s6l3T3mWJHAg9KxBDPub4ITPq2uedInV3ECdTHFZsfeC6mCEIbnp3DthMqBDMWS3ygA==
Received: from BN6PR18CA0010.namprd18.prod.outlook.com (2603:10b6:404:121::20)
 by MN2PR12MB3152.namprd12.prod.outlook.com (2603:10b6:208:ca::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.19; Wed, 22 Jun
 2022 01:18:34 +0000
Received: from BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:121:cafe::3b) by BN6PR18CA0010.outlook.office365.com
 (2603:10b6:404:121::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Wed, 22 Jun 2022 01:18:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 BN8NAM11FT031.mail.protection.outlook.com (10.13.177.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 22 Jun 2022 01:18:34 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Wed, 22 Jun 2022 01:18:33 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 21 Jun 2022 18:18:32 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22 via Frontend
 Transport; Tue, 21 Jun 2022 18:18:29 -0700
Date: Tue, 21 Jun 2022 18:18:27 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFT][PATCH v1 3/6] vfio: Pass in starting IOVA to
 vfio_pin/unpin_pages API
Message-ID: <YrJt43HQnoKSIIM3@Asurada-Nvidia>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
 <20220616235212.15185-4-nicolinc@nvidia.com>
 <Yqw+goqTJwb0lrxy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Yqw+goqTJwb0lrxy@infradead.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8c94503-4e5d-48de-54cf-08da53ed208a
X-MS-TrafficTypeDiagnostic: MN2PR12MB3152:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB315294CBC9C64879680D7E45ABB29@MN2PR12MB3152.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 16HKa3UYFqh+VeeReqfZbiQ9MSNhYWP8JJL6kgSZiqiWg2MhE5i8iDdGP7Z4ZaEXObooMbvk35kT5SV73zTUun7bM3GzKHNWT6iNOg9OEVYWczJrY3K90RxkaZLoOZ6mn0xQZhSPFQWUq3lyS1naH83IgxAE9/2Fs/cSUEHWIIIy+Xpgb/bK+kKBT14dD9ZUpNuY9CMr8EsuAwmMOvvBXUYOoJsU88Jci+bJLUbVX1hk0VqAPBCEELz2uLfqQkoHrGIde305P2zbu1+qbE2UdCxKhvt+RLqE9G5TUwaqmNvuXAMwwd0zaaaKISHf6OY8JhfIsNOgrnZlB4BSu+/5Z0OSP7m0g14YpnUbfF/VK3MM5/pAHtaILXfDlf0P7zK7jEnh1GFpInkyaOI26SCjA688/1IZXGlPejyvFftptbyWJT2WDZDr1Djx3GEkSza1NTvIZV9vd46k348ymOBnbCX/MjyDPkjo2YOH1pNOXFbrJzpfsJ0XmKa3OqATACk1xPS2V/vCMBnTS4E7zlOgNYywH+yZdhP9wrUat+XGMsrRLLla3SVzjaYYhvPfViWUk7EF+vt0qY3n1UmgNThweq/9MVF0r2tPenbDBagJ95asZsCR64SezuHZ6lqkE7ylS03lW43Ujd6twsqsXy/baysELZafalOI6iG8s1F7LB7lMyyRnh3WYApns6LKGuty/vVEsAwh/9eYILlnQ9Tts1kCH6oXkanmxqyCA+Z1h3U=
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(136003)(36840700001)(46966006)(40470700004)(5660300002)(186003)(316002)(478600001)(336012)(36860700001)(7416002)(81166007)(7406005)(55016003)(41300700001)(33716001)(40460700003)(82310400005)(47076005)(426003)(40480700001)(8936002)(356005)(6916009)(86362001)(4326008)(70586007)(82740400003)(70206006)(9686003)(8676002)(26005)(54906003)(2906002)(4744005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 01:18:34.2919 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c94503-4e5d-48de-54cf-08da53ed208a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3152
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

On Fri, Jun 17, 2022 at 01:42:42AM -0700, Christoph Hellwig wrote:
> On Thu, Jun 16, 2022 at 04:52:09PM -0700, Nicolin Chen wrote:
> > +	ret = vfio_unpin_pages(&vgpu->vfio_device, gfn << PAGE_SHIFT, npage);
> > +	drm_WARN_ON(&i915->drm, ret != npage);
> 
> The shifting of gfn seems to happen bother here and in the callers.

Sorry. I overlooked this line. I can add another preparatory patches
for callers to pass in an IOVA other than "pfn << PAGE_SHIFT", if you
think it's necessary: although GVT still does things in PFN, both ap
and ccw prepare their PFN lists from IOVAs, which now can be omitted.
