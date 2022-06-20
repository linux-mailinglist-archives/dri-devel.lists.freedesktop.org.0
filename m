Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A2E55212A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 17:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6209110E5D1;
	Mon, 20 Jun 2022 15:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B1110E218;
 Mon, 20 Jun 2022 15:36:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipm6XsXR3XMoRqJncOojL2E6Fv+VSYsgOPT2CLtTxArq0W0v6GpxYJLt3EMKwZag8KPzZmIUnsZQWwSW2KKpQ9hxIsMWmj340VzpLZxGyKX6bRg6WVjKhMx+orEFAjmGW7Zp96bCJJ4aJn9VtLYTe6yVWbFm8oJV+1AivDg95CqtvZdexSJyC4RAgmuJBoU6aX80gZT02U5vsMzFipIkAabrUFP7bFs+SHp1s+xh3+xqb7eotjVT+DUOOOnZbMHdw1CcVAMGi76NtdPL+ImMNhmlQ+cAWTA4Cm2EdaSjzcBx5JXjOwp674F4QaPnzs11fDGL+2b25tHtMs0leqJexA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxExLSLje0IsPubQt3DEVni75/KwiaOILS42XzkUvGY=;
 b=Ilas+esHwLm8+FLwwQYGiWoZvuP2JWDy9idEBnJeUyDlI7uTPkDU5M3xT7jToghL68wZxBRzZT4MfsqAWcoAfP7DnB3Zzp5GUT1k+cm+w8X6uTMocdCL1fUCJMxo1N5vnHklatq2NO1x0LBAvv78NL6ZJdGTovnOvQeq240xUPQNlM9hfMWTez2hd61Jv3UzOrO8f8dB9CwV+RJ8o/xuOZKql7ZEkEg3pnfKvwRJ0YNL93Ztw7yqk2YN3UbPx2IlMO1l/Y1rQYt9P777tR8VqpoPIsrVI1tAURpFlWUrS1W859bA1mhAI4yurE0quePumD2+pkmJLMMJ7dRK45OPpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxExLSLje0IsPubQt3DEVni75/KwiaOILS42XzkUvGY=;
 b=jxASaIkrt8oJ1etwInaRX0uwuKHHLplY+FMPVq/s4UYOg/BvXlCaxuHEGA0Fsxp0zNFl7aXxA/dtxbiuuDjoXYWv16r3e+gOf/LKr8O2W8Pd7HCcjcFdV6+2Ak/JrOiBKH/sCu8gXUo9WZbSeT4TcdcZ+/Z4XcZAI//ta62ERxIqOa9G+VKlZd8cKSwGO/TgAEbTiTxSqoFVcTawfJnP6RZ6hJvgWxktShMVT6YcbdRGdtO26H+4D+w7FsCa+5Drokk2Cl43XUroQqI8Q4957mephX2h5GRkcUba85fJR6WlWF8pokOhtv//w9MztyMzaTYqGMDi9cubjEYUOU95fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BY5PR12MB3794.namprd12.prod.outlook.com (2603:10b6:a03:1aa::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 20 Jun
 2022 15:36:31 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5353.022; Mon, 20 Jun 2022
 15:36:31 +0000
Date: Mon, 20 Jun 2022 12:36:28 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFT][PATCH v1 6/6] vfio: Replace phys_pfn with phys_page for
 vfio_pin_pages()
Message-ID: <20220620153628.GA5502@nvidia.com>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
 <20220616235212.15185-7-nicolinc@nvidia.com>
 <YqxBLbu8yPJiwK6Z@infradead.org> <20220620030046.GB5219@nvidia.com>
 <YrAK87zjdOqUF6gB@infradead.org> <YrAVuxMEkV4Wytci@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrAVuxMEkV4Wytci@infradead.org>
X-ClientProxiedBy: MW4P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::10) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e282e9b6-c05b-4e66-1963-08da52d2a5dd
X-MS-TrafficTypeDiagnostic: BY5PR12MB3794:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB3794099CB9611D2E36FD1B7DC2B09@BY5PR12MB3794.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wt1ZsE06Wa31OUiH/4sISpZcCjPh0ORWltRH8WiWERo1OD8NBVYjopikouY1IbRHV3T26ykAoZ8Iq7L0s94fSQnqpeoZMQrlzdisHN+/5gtQb9pP2g0AcqKG2YwNwqBTQIYyr1W8I6oiq00DQLLcenb90ekC9XlKeIFMOO4Jm6EPVfST4W7q+WlWxw5Y4IWPBYqDYhuGZ/HXIZerYYBwI/rW5wZxvjid1wjjF6Jf6Z+yloAxhOFNihydZtMspvAVIGs1JYJ66iFVhKQGX1D2dep1s/ykWlTl+1qsKExposcx65OzgvBuFeWfHw4NNgBkTU8BCaip7EBotf+wy06b9XYwUUhjiL64GLpu3fAbGG6RBBUyXgWLRdRcQgDGzghtQE00CLoBdSNR7qJkDuh46tmpwpYhw0LLeK74BvJgCiEMh+PEtC0cCiBFNKm8wDN+W0mMI5y0pmqonXg1nH/gvgTgNucfDGm8tih7J0zWAvPeDNYQOTKENogEAAyyNFD0P7CbGX3/eaUmZtua0cD4sX1zN+PwN3j0HjSfddO3pv6o6dnHvpQXG7KRL13vr0E63znT0hbN9SS7PNXRYUVOVvWDcGeKR5UCgRephcjm+CyjR1xz+CWH3ljht4ZmWFmOOUXNkLb5y8CFUtgknUKhtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(7416002)(5660300002)(7406005)(186003)(41300700001)(66476007)(6512007)(26005)(33656002)(38100700002)(66946007)(8676002)(4326008)(66556008)(1076003)(2616005)(36756003)(6916009)(316002)(6666004)(2906002)(6486002)(8936002)(478600001)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MFrMjvpYjPTzQhVzhXqeHisd1VLlV/VyeEXaP+smyVNdHEJVKk5ACx8jICZ0?=
 =?us-ascii?Q?seYauzwjkrj60rwhKZzR5f38hogWoQNRfqFh53Evvu/d13AixiORokWVVG8d?=
 =?us-ascii?Q?dbFZfQi/WLTBiAam+7v8/xGJmWaiP99/lnhyewH1GapBXnF6SALPUqiB0FHB?=
 =?us-ascii?Q?0cbF5L21iHqVzf3Bk2jd7/B20w22cYMhcSPZH66KOBcNdkBXtztFdH12kqPe?=
 =?us-ascii?Q?P/75VIRmLUA7bFlsmlSFHBayNNRkc1v1gKQ6CdaTDdrlsCDjb3gWIcKd1114?=
 =?us-ascii?Q?MmeUUxoaizikPx5PQDIOVd4Bly6zFl0jwxYHJrXYCbnhjBkLdctqm5KOAdyG?=
 =?us-ascii?Q?7SbcYln+AO+UWqyYdkJsEI7gCCWzI3B5P39SRuxZYn7aHIVAgUDLPVJf8Ksi?=
 =?us-ascii?Q?5XAVtk75GQ7eJAaBFWLokC+xddyR452jySL7+ZRv7fd9LmB0L1644lpRoohF?=
 =?us-ascii?Q?W1Qk2ZWQDTFdOz/pxDXQULnkx11E7OEOa1b9NzPO55+e2SmsfMvabNSgizlF?=
 =?us-ascii?Q?FYF66isIfB1Ies4gQYnU3yj0rE4ql/mEWyB3kQifanDA+UnqeigzyaK8Kox/?=
 =?us-ascii?Q?9AW5FUtR/T304rAUqwCVjxWwJ2mqqFqYjqTtvPCQIWZ0BPfGsLKJ5lbVxmq9?=
 =?us-ascii?Q?oycpwWUD1w4tYL0hwKMdmhu8HUam+kbFPwTexR9qvvni6g46JBBXX60MRtjw?=
 =?us-ascii?Q?SZ35IQFw2YRsliA4O1NjxFeGJU3L7rBB4k1yAIHPLnFGktkCT8I9CeWDa6ll?=
 =?us-ascii?Q?QPI0g8EbdCcEqUdHgCb6LGDbCbCwRFOwJ46EpklyJZ20aLT6j+yJG0Fg/vjH?=
 =?us-ascii?Q?zNw0NmtvRNCXkrSCvkSKE5t4DSVEIHwC+kNlr60yIs34tSEcz1X5ikL9HHjJ?=
 =?us-ascii?Q?39zjKeumI03T1SYqTfZW89BBUza7ceIhT9gaGfQ6Y6xz4oCbCtBwTaTM0NL/?=
 =?us-ascii?Q?n55AqyOhHPTNK0/2kipdXvPG8p5ECkKb/+kCtGyfbQk2/YBDr4AAq2nrHjJ+?=
 =?us-ascii?Q?UVYI/nH2Pu1dTII7RzcoB5JQp97hfoQ0Vt2XUHhzbFA+p0fxo+W4XxI1zOfy?=
 =?us-ascii?Q?yLn0tCb19XkeIzv0nHwWwDxSGCHXzyNtCl5RlvAJ5vxZdH+U4YVk9muzasM5?=
 =?us-ascii?Q?ZTay6lGFzcYSgKVJiB5OfyNrVMKB3FI8kNbAQXoOLF6dvr3I7KiZ9+Y7wbnZ?=
 =?us-ascii?Q?LxdwosQZvGoM+P6fBsAB1VCQetXLbIFY4Mnfunvd7RXKyaW3yGmFtccSXSr2?=
 =?us-ascii?Q?iAmMniGF0FNCq7m+hZsX6rqIxhH6iEBXfoUaAH1rCU9R7AxNNg8801xCkrbU?=
 =?us-ascii?Q?PC7yYLgrcjenlrC/8M82tOeXDuxanSYgP9JbHMTMps3ZwE8q1WFZezp6klj4?=
 =?us-ascii?Q?mJcq4+HktNtxozPDID89VpHz8v1l/J63fQMCqt7IgdS3SHSdbg8oAtRNuXa4?=
 =?us-ascii?Q?dyXi9AwyrrozeVNGsPJ/B9WqaxbIZeBrAkCG5I9EFZ7Qtx/tUJrOQreChaOR?=
 =?us-ascii?Q?BKuKm1UrZzHqMbDWUgPo94LKp+c0rtmz4So9Cgi86AQYdRsH3Rxe64lBEUBC?=
 =?us-ascii?Q?BvVsW+EsQVVS1Y0REmWqGthpZW67+1AfQKiNnJ4PBrg0KBNBGz703REI1OI7?=
 =?us-ascii?Q?sdM7YNh6+lob5Pie4VEmzVYy/1ihY9+W/RQaa4RkKuC5gX7TQ8t4owzXXmBZ?=
 =?us-ascii?Q?5DfmjNwZFE2bVujaLukvZrFeADGi+m0K0RHtRRHE4XEIpp76Nd2znDUnbFp/?=
 =?us-ascii?Q?nXEaa7iHRA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e282e9b6-c05b-4e66-1963-08da52d2a5dd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 15:36:30.8186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqmMCY6R9ngDAW1/DoezGpwxppoHEaXlifgiXmdUvpbMS4IpKaReVgYzE21BqcC9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3794
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
 corbet@lwn.net, pasic@linux.ibm.com, Nicolin Chen <nicolinc@nvidia.com>,
 borntraeger@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 zhi.a.wang@intel.com, jjherne@linux.ibm.com, farman@linux.ibm.com,
 jchrist@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com,
 alex.williamson@redhat.com, freude@linux.ibm.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 tvrtko.ursulin@linux.intel.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 19, 2022 at 11:37:47PM -0700, Christoph Hellwig wrote:
> On Sun, Jun 19, 2022 at 10:51:47PM -0700, Christoph Hellwig wrote:
> > On Mon, Jun 20, 2022 at 12:00:46AM -0300, Jason Gunthorpe wrote:
> > > On Fri, Jun 17, 2022 at 01:54:05AM -0700, Christoph Hellwig wrote:
> > > > There is a bunch of code an comments in the iommu type1 code that
> > > > suggest we can pin memory that is not page backed.  
> > > 
> > > AFAIK you can.. The whole follow_pte() mechanism allows raw PFNs to be
> > > loaded into the type1 maps and the pin API will happily return
> > > them. This happens in almost every qemu scenario because PCI MMIO BAR
> > > memory ends up routed down this path.
> > 
> > Indeed, my read wasn't deep enough.  Which means that we can't change
> > the ->pin_pages interface to return a struct pages array, as we don't
> > have one for those.
> 
> Actually.  gvt requires a struct page, and both s390 seem to require
> normal non-I/O, non-remapped kernel pointers.  So I think for the
> vfio_pin_pages we can assume that we only want page backed memory and
> remove the follow_fault_pfn case entirely.   But we'll probably have
> to keep it for the vfio_iommu_replay case that is not tied to
> emulated IOMMU drivers.

Right, that is my thinking - since all drivers actually need a struct
page we should have the API return a working struct page and have the
VFIO layer isolate the non-struct page stuff so it never leaks out of
this API.

This nicely fixes the various problems in all the drivers if io memory
comes down this path.

It is also why doing too much surgery deeper into type 1 probably
isn't too worthwhile as it still needs raw pfns in its data
structures for iommu modes.

Thanks,
Jason
