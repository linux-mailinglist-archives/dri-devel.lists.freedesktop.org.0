Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E21758CCF4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 19:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5257110E23D;
	Mon,  8 Aug 2022 17:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2126C10E0F6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 17:46:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGoHl8y/Ky3YiUXMq1Q8AnMQG6K2F99m/+0QhKrruKUq+Cb8L0cHpU4Nnymau2lxnOjS5PE/AMXTCE/WzDX5o8YSGK9wKRvzum8I0xh127k0SgFfQ77WIGhy5F/AGpMYhPGNHF4PF2N8jGAiQMNe9Kp9KLpo77ckMVJ4BzgcQJOth3k3VSRunA/HJ3rx1mjSD7fPFMBuDTBpsKu0CVKNe4GO7eiN9MCnutCeDKeGJZqV6vn3Pm1TxBkIwFCbE9bDSCgk+K0H3unev7zTNd/8jkk/Kpte68HNLoUJ8EtEeSfj2F0rdcgjQfH7ANTFR9JcqL+VKt+RuZoeynVjn1hQcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=it83voNRN/dEQcPN1ubnKvr8602PLeTZ2Yso5E2zxwk=;
 b=e7JxnfM38nCB+XPn/XJCCmCIe2jKMA85q/IWJ3BNYzJL5NYMXpXyz1WnVLk6k3bsF2cttOlme1Q6xNmN2FSTCUOpyOsDtfcGErAJgCTHWD6yjYw+hhEHPgtaIdCAcXzUDAt/4vamy/i+1BwDXqpwPiSSdI6dK6CDfgYPiFdF5c4z/udeuicneCyAdMRktmTHREfXMlWF7PvrEVcWRsojMGmXog4837EW+CHn01z05o1ct4lsW6Rr/qBN1ggpUK8qkqLRbJxmwOTHFPj5Yg/6raA2sPXWDJa8Dep9WoNi+uP7kEP/zHJsN009e1j/q+Biae7XI3Ie2H21jD1E65PwfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=it83voNRN/dEQcPN1ubnKvr8602PLeTZ2Yso5E2zxwk=;
 b=HP7TvV5+IiIccYTu76YjMI6PPCrM+WgMOqFz42g3ldxFl+boT7PxP4ylw7uIUet+Ys/oYtVX/TUC75Ks3pD01setaq3xJgNbHoajWyQQs1R2F9rluj5tcHtzOWfLrvt4hnK9Wq83ocBRP6y/IFxta3dX7UMdSYpfr04NHqhKfZBaMgvmfGEClQKZc31XHnOCBNuoudPlj0p611Zjf3ppV5IEZb8i1YpDuLKPJrXpRkgjH1i4F4DZ2oCk3tHdykHzKbc6J6bZ32vlQ2fg4EunUSw8XAPgFpHhj4GNOkNO/ONqEGC8Iti2x0QvfYnw4VpjKH+EJaaPO++YfiEzecmh4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MWHPR12MB1839.namprd12.prod.outlook.com (2603:10b6:300:10b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 8 Aug
 2022 17:46:29 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::1a7:7daa:9230:1372]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::1a7:7daa:9230:1372%7]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 17:46:28 +0000
Date: Mon, 8 Aug 2022 14:46:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: New subsystem for acceleration devices
Message-ID: <YvFL8/g+xbrhLzEr@nvidia.com>
References: <CAFCwf11=9qpNAepL7NL+YAV_QO=Wv6pnWPhKHKAepK3fNn+2Dg@mail.gmail.com>
 <CAPM=9tzWuoWAOjHJdJYVDRjoRq-4wpg2KGiCHjLLd+OfWEh5AQ@mail.gmail.com>
 <CAFCwf12N6DeJAQVjY7PFG50q2m405e=XCCFvHBn1RG65BGbT8w@mail.gmail.com>
 <CAPM=9txSKv_xwZJ6SndtqsdQm6aK1KJVF91dB5Odhc_Xv6Qdrw@mail.gmail.com>
 <CAFCwf10CsLgt+_qT7dT=8DVXsL0a=w=uXN6HC=CpP5EfitvLfQ@mail.gmail.com>
 <YuvctaLwRi+z0Gw4@nvidia.com>
 <CAFCwf12wD3uEhr+kxwN9ROXApHzGh_n1je5susZV5NgGR9fCcQ@mail.gmail.com>
 <Yuxi1eRHPN36Or+1@nvidia.com>
 <CAFCwf13QF_JdzNcpw==zzBoEQUYChMXfechotH31qmAfYZUGmg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf13QF_JdzNcpw==zzBoEQUYChMXfechotH31qmAfYZUGmg@mail.gmail.com>
X-ClientProxiedBy: BL1PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::35) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a223d97-1ba9-42cf-4881-08da7965ebd9
X-MS-TrafficTypeDiagnostic: MWHPR12MB1839:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GpF4RhGMz1AEdHYzYJKN4eoF0bC1g+KoNKmQFUaAQ91wvQk1Y46XvyibgvTgAtcMfTr9bOZc37lQ3xHhLwgz4A/j68CA11RLKZ1yFQzgBok/6SpmmfWKIYBVruWm82jU4wOXAtywB6BBaYRntGG1E+Mev6fljshPPOTvKd5ZoiMksHUzkMTuzKrgLrGbOsmvgyoCNU0pw4bOs9+9KWYN5dkKppcMm2x+k6r3Zy9wMuVDG/FU5Q3mTX7brdsGlAYCDl/sCpfCmRaLVEUc+Nu+1bDl8qbto0sTOX5CJeg8dNwx2Z0cWoeIvqdFVn7GgaDm2QPjxsHEc0a/90aUBlOahEg9Csg1iuGYtowILpHLwunaGW1bMzEXWffS3P+xZWdlrpxftljXkRUk6NRIf+xeVjiQW1bTE9cYckjtUW5Q27HFOLs/BUcIcTHT1jJQyMycHGATxoLQPc15LqAKTrwBrgnmdqjf9gIIsIy+SOP10wbwywRM4FBMJyxYR/VhcFe2sHQ9hThLQVPKW03Pvfx5+XBBPYQW2kLar0ToRTwLF7xnZJeRAdFPEHMz3cImjD750+Ojlb5bS1LjqKxRZ03Om3D9M4PLNVBflycuY3N9+s73gzZFM+XsCeXBTO2J47yO7zdnh5kXkPmKMoyAYDsYK9Xg+8wYQJS9oKwXx/oGg1SbYlU+/V/mju7kSQyxXteZn/cgIR1mEKDe/DnHMwfhvUX+pQ/ZKh40s8GXINKY1IiGha2L9Vjw+zeeMx8hR1Aa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(54906003)(5660300002)(8676002)(41300700001)(26005)(6916009)(2616005)(66476007)(478600001)(86362001)(36756003)(186003)(8936002)(316002)(66946007)(6506007)(6512007)(66556008)(4326008)(2906002)(38100700002)(83380400001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4WsFmn0wqSDZp31SPRgHlkk6Vov18gz5MCXdXbJYI8qXU4VRPpcCPIo6shcm?=
 =?us-ascii?Q?tCshUr96uk3f+hiNaX/V12nERhMWbos83oDmYOeGxxIK8OqOedofqqznu4gP?=
 =?us-ascii?Q?D6qEYcop9Cz6lz7ZcdVMK2HfEltQrqlt+kpS7BKmjySihM9TXp+ZjsJe+VN6?=
 =?us-ascii?Q?ZQyAsysxT1HqNtU/xPbFgnq3LXbA6AtL7SwNuQBn5EmRDcMYcxf1t3fg7yHV?=
 =?us-ascii?Q?Jxoxm3G6SN8LdhArrRZVrFlbdavGvfkUs3tYymc0PdJKJIi3Ip95J3JBg7rc?=
 =?us-ascii?Q?BKoGgw1nQFladsCAAVjJYNVdUbm0uYlFm8Oq7dPZrdMZFUhxQuB99A14cZ6D?=
 =?us-ascii?Q?6np3VNfGG3v/XkFsHyCBGByNAvH0MYO952zVuMpj5tPbI641O9eLmzzMVK5q?=
 =?us-ascii?Q?ucJAtTfTbi4Dj0RUE/1lR5kH1OYuSVsh6QezzJYjACbwnmQ/7fQYhmjYRQau?=
 =?us-ascii?Q?T23Y1yd3GTKWbcB7UcfUVJkprReHLuYmy6NT7PAaQW7eB0QfCyxiOM5Nibc7?=
 =?us-ascii?Q?1kqDG0zy9b7xKFNx0YWPnkp3Fr61npCgkTt4yKZSvzyoElLYQtPhtmV6bjkn?=
 =?us-ascii?Q?ZN4uuG61jdHmKsIaRLl5W19yFujPfkyfcAH2FivTj9tn43yUg6ixEw8oY9C1?=
 =?us-ascii?Q?1aIdDCzaXr+lq8XNb30bwUWybWa2tHsmsr9UE0zEBkpHlebJFJz7nAT05GUQ?=
 =?us-ascii?Q?4PMhHfMrR7OcLZZLnDcZ+t7lo6ZRjNnHytFKF5dsyfHWJ+izVBUQE0OQr2Jg?=
 =?us-ascii?Q?fDEoDq7GgYaXY1n03mifLEeYCMenYiZsaWIPpXA1xr4wG1mCyzKP2nmLnj+Z?=
 =?us-ascii?Q?fk8AdZE1turYqUTi+p82OmBrOjYhXp7bwHCPcIfjHmlg9yl5yVqmDlIJVW0s?=
 =?us-ascii?Q?MadV6/zbI2oXc/dEj73dfuNiOLegc55OP0yTFBnC7id5PWH3gglgFVlNMwhr?=
 =?us-ascii?Q?nU/ovGZ66ZeY78IdrqVN9lESuhXldCnyTSoouy5CnsN3xasrr/Knt431hVmG?=
 =?us-ascii?Q?Ak5qZ+IEwQlrY2SvzgAjzRD9VRqxZrmmWcftDsYR6J33BpDFs6m7cVkJNaJW?=
 =?us-ascii?Q?y16p4Rth6OIFzO3iOrVBnG6twGNWKO40bYiB7xEyq5pH7281QWfanA2g74Jv?=
 =?us-ascii?Q?wqwNyFXBZ+bEDc2DH4AtYvosoBbp++49qH84Edg6d106LnqdtAGidvE02q+L?=
 =?us-ascii?Q?pw0MqSce9gSsmIlLn7tO45YxiUah13DPoI0ZXsQmlTZIFhxdp/rzVZszaDXy?=
 =?us-ascii?Q?/euPTzrnTfCGWgzFU4NeFHvHMVfEzd7wehzK9V4h+k5ymU/j7/aezisVnt1X?=
 =?us-ascii?Q?23qoE1SguKhonqklLSKfRkAtuLNzs4V7mgDlXAtoRrIX1u3XCMgpcZ8uW9EJ?=
 =?us-ascii?Q?rv53t5ajZkULIEpNhp8oCPlCIRrUl7R6aJlJTfZk+2X9SsG2/7QQ2K76xkAV?=
 =?us-ascii?Q?JfJCanZrApJ+9321WdIgg+TSg1drUGvNUqoDX0HuI3CBQKbwZV+OLPRGpU0I?=
 =?us-ascii?Q?yyyLH0toqHiA1H1enPSKMFyOkXfPuqyIkMDz9JgNChca+JasPlquaYr9Tn0n?=
 =?us-ascii?Q?Jvls9gpV/zXLX0miC/z7hsEakDMU8PFNI1ivnLVP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a223d97-1ba9-42cf-4881-08da7965ebd9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 17:46:28.3608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qqxNMXthWEbEyvtjyBOwr/uWAQYypKUDIT4V+EvXIEa27EPF3OMTJX0+/zu70m2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1839
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiho Chu <jiho.chu@samsung.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 07, 2022 at 09:43:40AM +0300, Oded Gabbay wrote:

> 1. If there is a subsystem which is responsible for creating and
> exposing the device character files, then there should be some code
> that connects between each device driver to that subsystem.
> i.e. There should be functions that each driver should call from its
> probe and release callback functions.
> 
> Those functions should take care of the following:
> - Create metadata for the device, the device's minor(s) and the
> driver's ioctls table and driver's callback for file operations (both
> are common for all the driver's devices). Save all that metadata with
> proper locking.
> - Create the device char files themselves and supply file operations
> that will be called per each open/close/mmap/etc.
> - Keep track of all these objects' lifetime in regard to the device
> driver's lifetime, with proper handling for release.
> - Add common handling and entries of sysfs/debugfs for these devices
> with the ability for each device driver to add their own unique
> entries.
> 
> 2. I think that you underestimate (due to your experience) the "using
> it properly" part... It is not so easy to do this properly for
> inexperienced kernel people. If we provide all the code I mentioned
> above, the device driver writer doesn't need to be aware of all these
> kernel APIs.

This may be, but it still seems weird to me to justify a subsystem as
"making existing APIs simpler so drivers don't mess them up". It
suggests perhaps we need additional core API helpers?

> > It would be nice to at least identify something that could obviously
> > be common, like some kind of enumeration and metadata kind of stuff
> > (think like ethtool, devlink, rdma tool, nvemctl etc)
> Definitely. I think we can have at least one ioctl that will be common
> to all drivers from the start.

Generally you don't want that as an ioctl because you have to open the
device to execute it, there may be permissions issues for instance -
or if you have a single-open-at-a-time model like VFIO, then it
doesn't work well together.

Usually this would be sysfs or netlink.

> > This makes sense to me, all accelerators need a way to set a memory
> > map, but on the other hand we are doing some very nifty stuff in this
> > area with iommufd and it might be very interesting to just have the
> > accelerator driver link to that API instead of building yet another
> > copy of pin_user_pages() code.. Especially with PASID likely becoming
> > part of any accelerator toolkit.
>
> Here I disagree with you. First of all, there are many relatively
> simple accelerators, especially in edge, where PASID is really not
> relevant.
> Second, even for the more sophisticated PCIe/CXL-based ones, PASID is
> not mandatory and I suspect that it won't be in 100% of those devices.
> But definitely that should be an alternative to the "classic" way of
> handling dma'able memory (pin_user_pages()).

My point was that iommufd can do the pinning for you and dump that
result into a iommu based PASID, or it can do the pinning for you and
allow the driver to translate it into its own page table format eg the
ASID in the habana device.

We don't need to have map/unmap APIs to manage address spaces in every
subsystem.

> Maybe this is something that should be discussed in the kernel summit ?

Maybe, I expect to be at LPC at least

Jason 
