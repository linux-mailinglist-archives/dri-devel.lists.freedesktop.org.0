Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528C356A904
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 19:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F7910F0C7;
	Thu,  7 Jul 2022 17:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D436110F0C7;
 Thu,  7 Jul 2022 17:05:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNPbadA3HM6xBDFAGd4BLMTD+8r4WXLe5zs4NMZ4DiSX6PU1DAZIkxZfyl3psQzo1vdf+klsMwInA/S9W+1CLkBTSRnv6s2RSisoNiV0J0ymzFVFXVBcKwFAN8RlnAO9kMqm9Ru95JZRU9yJDtSEJUmknwvdOfKqs64hiFLIJfC9MVeqpRMywBqVPTWHweCMx7adt41q+OwQXV97QvNwnWrUq+fw3bdkk+4t3ziLLaeYVJTMfHz/ygAPNuJgUHfDAdFylQnGyEMs5LLCbJ31rQE8lnF8SxtVzxZVOCCYl/5yS3xeCqJRHj/QU2QbctQqlvs0hQ3iNriLxrGcTk/DQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88UnIf43lwxpdCNhm/ISe+bcIYrn7GgyOosKacYKM+U=;
 b=Kp6HS1tLLKNj3/0jcMVMyhu0XlgKGTimEUIMAe2ABzVzNF9T3s/NnFwh6IahErChQUdU0oYr6/Ej+XPl70S42SghVtgmkJkWUmtGNO/fDJlxj13xT5rqvhmiT4sgPKEwpR3a2Dzt879vcGJLzbgiT8efrZT8aD7oHtVA5t3VsMUcs+8TQgJHxYIuQXL4+cvb4MqSdn0TDxAXfBSEA4Vfj6IFCWwkMzP2ucS0+CWyoHLY8BJDA67qk3pNRs3hldP3I5HokplwIbv/EaJzzVnF2OHUjZpRI4BHKfZmlBYUVwoBFlnXyPZD40JhZiYSNVn+M0F+HwLG1/jVFQmbDQwuIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88UnIf43lwxpdCNhm/ISe+bcIYrn7GgyOosKacYKM+U=;
 b=W1Yvl+J2T0DLGOPEb+KtpETytyYQF/PxMfLhMS3rY0PHzIhHANiJQNd/5Qphl5Lc/6CLiz5NHOA3i4x8lcxw7p+lZ9p30vMl6OPzX9WypeI6yr/vrU59nobAUrYf810eje2XXglPCKRMfXjGlzD0QDcalmXNXW9ajIg2+n1BntcYSiVzs28yvfcplHsoTiZnpOFmFqfj4iwWdi2UfjV3iG7Blqm0ZZpaiaWYr1n4rvtWCpiQsBzL+taPTgcJFvGXiQgEvKQoR/Vt5p86M9cbxJ3zOHBLXKPthzjlqdL0HgqaKGGfkkIPbiMbTAer12kuTnr5J6OHEmmeEmDTywWmtA==
Received: from BN6PR1701CA0013.namprd17.prod.outlook.com
 (2603:10b6:405:15::23) by BN6PR12MB1812.namprd12.prod.outlook.com
 (2603:10b6:404:108::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 17:05:03 +0000
Received: from BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:15:cafe::5) by BN6PR1701CA0013.outlook.office365.com
 (2603:10b6:405:15::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.19 via Frontend
 Transport; Thu, 7 Jul 2022 17:05:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 BN8NAM11FT014.mail.protection.outlook.com (10.13.177.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 17:05:02 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Thu, 7 Jul 2022 17:05:01 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Thu, 7 Jul 2022 10:05:01 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26 via Frontend
 Transport; Thu, 7 Jul 2022 10:05:00 -0700
Date: Thu, 7 Jul 2022 10:04:58 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [RFT][PATCH v2 4/9] vfio: Pass in starting IOVA to
 vfio_pin/unpin_pages API
Message-ID: <YscSOo/3tLrBX8hz@Asurada-Nvidia>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-5-nicolinc@nvidia.com>
 <BN9PR11MB52769E657ED58B29677AC4F88C839@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52769E657ED58B29677AC4F88C839@BN9PR11MB5276.namprd11.prod.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90c632d3-b3bc-4859-c623-08da603ad545
X-MS-TrafficTypeDiagnostic: BN6PR12MB1812:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x5Cngu0YlMH740gvU99zar3UvqQX7QtFGFeuXfqdvEnTH3IdZs+PvmVVvPbaPYJkVLF8oceVxb4zR1PhO4qAeEBiywlpvN26cuO25BZcsCdgvnSQBKVyQXs4aFdgxmqRMRpi6eTi9CSwi/BaHRtfvvtLF+x8qfX4msq3Cg536ahY7uHYm87oo3SqNcYfzNKkEyZ+LhTwikwGKXFEHy08l/5s+6w44vDA6Y1FIvl6qHk26N8gLh4lSopgtUQUIRP6s+SxbFRm3B+6se04Y00OTjHW8Vrff6VmpBDcJU7Cb6Tf8ebrjxUsOvCf2JbQ9Si+/kzaK1XLindz9baL7nHBS+j66R95MbB7ApxFuSZrnjACjcPHKBmgyxOW4EqTD4qpC7B//TM+jx/WRZXXg1WfA+rV0zVBQcRS6U6zkFSkLZW5rrdWrOYKygx5WunR6jX/RrEeI6jh7MH9/jnFrE67OADJLsZxcnWBitC1A9XgL0Tb1RQQU8wFnEBpxTVM6AQEDJS2O4CnMSXqK3mqr0X8NtVZ57K7BnS/vWE3jymGoaSsEotozFQsTc68Z00bT+Mmv/mNeY4evJ0ir3AuSFaQTUBjnkfaaD5ZRVwIKDDqgCAK4mKHvVX//toqmV58NZI9TsGMIjWo4uAUrOSjAj5gMkx2qF6X5w6naEIwhHcwTU0VFQ43c5KJbv9v8X8Vg5YXAT1g4hREmagDNpPwFN8Vn/NLaD659maiiye6Hr5nst7fVLVL3kjBaHsitO2FBVE0TULXcGoPq75QrqV7s+yulRQ0TQRFGP1QkwjLz9ZmBfNRKTILOKzGlRzkAkYeMr76r97rMvPfcX/1gs5xLPKwgydBcahgZ+3MMR5F7n9T6Lg=
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(136003)(36840700001)(40470700004)(46966006)(41300700001)(40480700001)(54906003)(36860700001)(82310400005)(7416002)(316002)(2906002)(33716001)(55016003)(4326008)(6862004)(70206006)(478600001)(86362001)(82740400003)(5660300002)(83380400001)(426003)(186003)(8676002)(70586007)(336012)(47076005)(26005)(356005)(8936002)(4744005)(81166007)(40460700003)(7406005)(9686003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 17:05:02.6961 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c632d3-b3bc-4859-c623-08da603ad545
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1812
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

On Thu, Jul 07, 2022 at 08:46:12AM +0000, Tian, Kevin wrote:
> External email: Use caution opening links or attachments
> 
> 
> > From: Nicolin Chen
> > Sent: Wednesday, July 6, 2022 2:28 PM
> >  /*
> > - * Pin a set of guest PFNs and return their associated host PFNs for local
> > + * Pin contiguous guest pages and return their associated host pages for
> > local
> 
> can we replace 'guest' with 'user'?
> 
> >   * domain only.
> >   * @device [in]  : device
> > - * @user_pfn [in]: array of user/guest PFNs to be pinned.
> > - * @npage [in]   : count of elements in user_pfn array.  This count should
> > not
> > + * @iova [in]    : starting IOVA of user/guest pages to be pinned.
> 
> remove 'guest'.
> 
> > + * @npage [in]   : count of pages to be pinned.  This count should not
> >   *              be greater VFIO_PIN_PAGES_MAX_ENTRIES.
> 
> greater 'than' ...

Will update them in v3. Thanks
