Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B795F550327
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 08:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9833E11ABEF;
	Sat, 18 Jun 2022 06:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2056.outbound.protection.outlook.com [40.107.101.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B5210E09A;
 Fri, 17 Jun 2022 21:59:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OflNo3jDnJNidw/r0YtCzpBU55Nn+htBY36Hm1/LcotBqmo5hBqHUvuY5XGCg3wDm6hCvPLQ/NPVJ0FTFecGjkUmGbHWPdqnYAVN5bthmpjz5u3mDrlbG1a9MUSu2v9SicwTeT3L54oWjPJKW3B+R3o3n3jK0mnlZZaiFFT6GZg2uUCT3+GSe2ku2xOh+yFEbs1NrhubICQg65QE9ITdPWvBCQ0k7py8Eeu/DZ9LIc5CTeOUL00t3kCaV5U6WYo1sqFaqX4CDXhex1/YrOk1OxPVz8U4jL+xux/9MBL7NuQ5oi7qlg+FwZWLlY5q+kpJF+dS0U8ir4wpUwXbI5kG1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+UytayUE50D5D30vtn4u5gV4acLR7VfhT3JtSbaoZQ=;
 b=N+xiPfajyjzFBt8XIrB+kKP82WRpz+rG1RDWPX+zkX9MIc2k9Z2aifYFqAln8udq2YNdB/2KaP7bn0qmQUQJyDueCU3WSyd5OY71KZAOzm8wA05vw8QmzOgipETDB7XfP2kP92hJG8iNKy0Ouj1jKo7p+vEPiQkk0auc5M4Me6lDJ637+c0W98llUGhNGcwB/mV5agAcSeuv7Ggr3MJ9a3bEyyDUwzUlp9tWRc6Svyfq3qcfj76j3Ys8ygntneDz5ipOMC4INFU/bhZyt91TfzXdaO7xJcG0TdQqntWcNBdN62W3Yn9BM/uPN/DRbRjOxU+fT0pRcL/35RaFwmmJRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+UytayUE50D5D30vtn4u5gV4acLR7VfhT3JtSbaoZQ=;
 b=ax6xEiZg/TXTdtP4i13m+tDjFEjKgfcSYBpOBBa8q/1XMHoa9mUTniWa2gvZETzEOenBOZFIBdlzAkrSsGmzZaqX8pY8D84M5VEaPiJ3CfZ4uY9n6lro2BB4WdbLmHqtl45pu4F2HHGfzPmGhbiAeHKOMMG9FQn07wxthYkKUyo5T58I9UooJKy/j+v5c5z+ySFr4cLsaP0rqp5kYCOn+davARiXNzuxZSZdbjhGA0/cKrkFWlznQlwuK24UOy99efxMeeCbD+OBa1LP0vLFg2eRM1xuEv0N6lpdYE2SJFFjMUTmP590GCitDWPX+s20SQvlAuuAjuLGOIJ21V7qUQ==
Received: from DM5PR19CA0020.namprd19.prod.outlook.com (2603:10b6:3:151::30)
 by BL1PR12MB5109.namprd12.prod.outlook.com (2603:10b6:208:309::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Fri, 17 Jun
 2022 21:59:00 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:151:cafe::48) by DM5PR19CA0020.outlook.office365.com
 (2603:10b6:3:151::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.17 via Frontend
 Transport; Fri, 17 Jun 2022 21:59:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5353.14 via Frontend Transport; Fri, 17 Jun 2022 21:59:00 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL101.nvidia.com (10.27.9.10) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Fri, 17 Jun 2022 21:58:59 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 17 Jun 2022 14:58:59 -0700
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22 via Frontend
 Transport; Fri, 17 Jun 2022 14:58:57 -0700
Date: Fri, 17 Jun 2022 14:58:56 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFT][PATCH v1 5/6] vfio/ccw: Add kmap_local_page() for memcpy
Message-ID: <Yqz5IHqDrLNW0htv@Asurada-Nvidia>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
 <20220616235212.15185-6-nicolinc@nvidia.com>
 <Yqw+7gM3Lz96UFdz@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Yqw+7gM3Lz96UFdz@infradead.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e5aec02-7951-43ed-ef56-08da50ac95ba
X-MS-TrafficTypeDiagnostic: BL1PR12MB5109:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB510976D2E5AB58461DABD4E1ABAF9@BL1PR12MB5109.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NEYljIqIDBNiK1eEAsgT1M9f1MCldFeVJThfCiWAsidmc2pwnrAPYEx0ta75SXyArJPe4rcRXSuhdCkPEpNxUIUxs2CoHmUrcJijdK2PmL1wDY0BvEBGKu7IH9gyY8CbRahZfCAajh4fMpi3/S3sqjXjOB27mprY7jSRMWXGP/igwx+prA2+WdSfU7JMAzCovvv/dUVQ5MBE9zKDKCUCHISwjjw1fsI++MJLI73Pl3BvrWpK+hf7mVj94B+5sVQzsZxaY17jzHJb/cRvwHRTP/UdX/PANNKZ15/bITZcOii5rZJwe1Tm7mwjrbPSWm7ErYuC5u2VG0M2z9rvEfErQAS5puu7CODZLgHIBM2YTIxTJRgIH8ieZcFFteaQ4a4SUeEfqSpp8KQvQkPie4jh/RPmoGRbUV4yBBFHxr4XweuyuSTo9LS8Q8f2mfGBcX6Rslu37FGCAUHs+YYWNMQtJC/Z1bzQ5qrx1pTighf5MM7nsoN+xiSYBtNt17mp4g36ds1d88IfjMVCdYXgp3nDw6e9VSJWV2XFJLyUp3izrKuiiEEc8peLDzesP5oscrTLlXmLD+HmwY+4amGhFREq+WRtiekxlkHAUEGxZ8skGR9x/9s/zEv+HUGw82QV0pvfypeGZa3500XoxGzGqSG/4n8OBI+dpBt+HIRZqs8phNoo283w4zILb++AFht9PYhgRS/PbdmedyiF/Us7LgLJ5Q==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(46966006)(40470700004)(36840700001)(9686003)(54906003)(26005)(426003)(70206006)(82310400005)(86362001)(5660300002)(186003)(336012)(6916009)(47076005)(7416002)(4744005)(7406005)(55016003)(36860700001)(316002)(40460700003)(498600001)(356005)(83380400001)(33716001)(81166007)(2906002)(8936002)(4326008)(8676002)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 21:59:00.1905 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5aec02-7951-43ed-ef56-08da50ac95ba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5109
X-Mailman-Approved-At: Sat, 18 Jun 2022 06:16:44 +0000
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

On Fri, Jun 17, 2022 at 01:44:30AM -0700, Christoph Hellwig wrote:
> On Thu, Jun 16, 2022 at 04:52:11PM -0700, Nicolin Chen wrote:
> > The pinned PFN list returned from vfio_pin_pages() is simply converted
> > using page_to_pfn() without protection, so direct access via memcpy()
> > will crash on S390 if the PFN is an IO PFN. Instead, the pages should
> > be touched using kmap_local_page().
> 
> I don't see how this helps.  kmap_local_page only works for either
> pages in the kernel direct map or highmem, but not for memory that needs
> to be ioremapped.  And there is no highmem on s390.

Oh..I will discuss with Jason once he's back, to see if we should
simply drop this change. Thanks!
