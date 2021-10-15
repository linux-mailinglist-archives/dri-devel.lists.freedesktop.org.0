Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A84942EF4B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 13:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1306E255;
	Fri, 15 Oct 2021 11:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205556E2B4;
 Fri, 15 Oct 2021 11:06:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aC/MPjo41yw3BkMOTqDRcxkwrVq1S+gP3tTXKMAO/Owx2LjhlYPvhC0YdW9Mw+yY45DsQ/kfQo75Aqk7KNBdqvYtdMrLLr2xCYMMT647BdR0js+/xddW5/310wud4zfXe8draqmTgnDL5L+jX+1AQPSvyGxIt3ryIpshrTDUbDqw9JjevE0SSLRzPG2CHHS7HL/rhLA2lz2OfojZ0EMMOwnz7ck15e9bd+13xa59R7CQ4Q6aCXMwMNHF8FQw21sixqnwDdwx0NjpIWvzciV146j3wnB5kGLvN+IWgy5Pju1QOGzMRKqVy1ay7rAuGyyVKaNk4WOXdNZhdN8BI9vNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wH+eKHqT/mWRhaZKzQIOI3JRIXw6LvNmBR1ztmMIRFg=;
 b=kQVtHIprtH/80kZbbbMOJHkXVAGt0aubmDWVYsN2b5J68+azlXaseTQY3/gx8g1nDa9Tz1BWivlgI6vVi8aWIS+dQZA+z8a4Qbn6+yVIMNwXUj4QlD94bZrsgozwQ31O/7Md9KxpfE4Gwc+rIceegHUJuCNvev72HvunfBIk6ftXi7/B5YLMLQ9bZUa6BLMfi2qIo16arIWT5EJS5JrspTc1Sk7Z+LO2h09KDQd/iORpobeZvgjkz7LHmJzN7KJ4LD6c7X80l/Gxfi3REtH1du0t5R3UFsjOPGSQ8Np7wqJFsExK0NXzVx40mduuhKDIsGx9wcleDx42RDgJoVphcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wH+eKHqT/mWRhaZKzQIOI3JRIXw6LvNmBR1ztmMIRFg=;
 b=lpDF9Jt/nTK+OcSw79LtDMdICQFfE//9w7fJ+Da0JZDorAYhyQ8K2cBu59KFiOx+JGetavAViLt1fsN2Ecc0UoIVY6a/p9aHWTCXhH62Bl7jwUzaJq6MXeNHzzJ63C6KDnJ8+mKme1xt5Vv4p6geMRvxpHbRrYDy4OzGCTrPCMlLiDy3BVCVKQMZqWhImQ/Qm713DdIW9lscOreGOlgSJXbX6XLTaZ6glgwn/GbbUBtKauALp+g2iIFwctZfrs95yRoRWAuJ5Irj7UYwtu5lEfQghjdoXSypVm/DDE8Wg8cZxgSUd4viT0cAQCjT5G+mFAhN6onZ+2hHlEiPNvXjiA==
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5380.namprd12.prod.outlook.com (2603:10b6:208:314::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 15 Oct
 2021 11:06:50 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%6]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 11:06:50 +0000
Date: Fri, 15 Oct 2021 08:06:49 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>, akpm@linux-foundation.org,
 Felix.Kuehling@amd.com, linux-mm@kvack.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 hch@lst.de, jglisse@redhat.com, apopple@nvidia.com, willy@infradead.org
Subject: Re: [PATCH v1 2/2] mm: remove extra ZONE_DEVICE struct page refcount
Message-ID: <20211015110649.GB2744544@nvidia.com>
References: <20211014153928.16805-1-alex.sierra@amd.com>
 <20211014153928.16805-3-alex.sierra@amd.com>
 <20211014170634.GV2744544@nvidia.com>
 <eafbccb5-f94b-0ddd-bb46-7ee92ed36ee8@nvidia.com>
 <20211014180132.GA3567687@nvidia.com>
 <b8b57851-674a-956d-0d7a-779e601bf6d8@nvidia.com>
 <fe418973-5086-e13b-2e58-c786dbdd9d0f@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe418973-5086-e13b-2e58-c786dbdd9d0f@amd.com>
X-ClientProxiedBy: BL1PR13CA0418.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::33) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0418.namprd13.prod.outlook.com (2603:10b6:208:2c2::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.8 via Frontend
 Transport; Fri, 15 Oct 2021 11:06:49 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mbL33-00FHmv-0T; Fri, 15 Oct 2021 08:06:49 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52ccf95b-ae17-40f4-a8a3-08d98fcbe308
X-MS-TrafficTypeDiagnostic: BL1PR12MB5380:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5380650CDFC0FCE2BD09B7B3C2B99@BL1PR12MB5380.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2kb0EaNNzyojE4TJ7sDyRcVGHOHqdSeiIf9G09VgTK6rOkvbu0UAvXGdJ38E4dIB1h5ZdBCBM6bbZTayIrjOJDNI5YxEA7V/IXp9tnIUS9lNVOehwVRFoGzZoqwJfzBJgd9gG2GvQBQHteQGLkwFPW+jZlS5h9A2aU5UuZNhDd4KBlJF532GJAfc9aN+8fm1vX79/1nhJYLUJ+V77mxHZDrX+vqTIoh36/6OWlYyPaC3tLpY6c4IGyV33G6z7ac8TdPNzeq+9bdKWktwTftsQztPOfBTzx/sHq/NbYb+c2S6MCH+8qdOntq1sb5b1xZ+wAdDh2Y7Qne7gA2ebuRyXS+Qvtl+vQCZAIeU3D2Tyjx47hZL3kEC3G8XH5tyjRF18ikJaT7tq2efKW7RVniBebgptJmWMbs9QzgYUvUYvDHSrplDwzo7oONGGHX2sBOcuIshi0NhA2e0NlYHwOZuFavvntc4up0z2NZnEai4PWLKS/pcQGYN4dooeO8JF+YGZGmr51c4NscqQ6L3SbpzTU57kdHqZ+O0Z3Q2G3L6N3R9MplIGW1yJwlmbSfhMMIL8tyWM5L9iwB8ceCaaA08+SkddYmfto0BnV+30misGPTd0ScAl54N5AW/gRGYsXF90Dd6kKFsXFy4RQD6307msQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(8936002)(36756003)(2616005)(8676002)(53546011)(66946007)(508600001)(186003)(66476007)(2906002)(66556008)(316002)(5660300002)(6916009)(426003)(1076003)(7416002)(83380400001)(9786002)(4326008)(9746002)(33656002)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Eca/MatAIOryC6mdEg4TRQHFDKQjtl+/+EN/9aoOb3o0D5NngNjjcBoSZHO0?=
 =?us-ascii?Q?c3OGJzsInnaw1W2yvXNjAynPrO/oDgaM8AMnm6IR/tmfXgDE4YeMKYe8XEL3?=
 =?us-ascii?Q?gemfNkSactc9PdBbjyBLpeUXcQgu88065r5P3MGcnZOTqbr2GO4wB+m/Eg7B?=
 =?us-ascii?Q?CWCjot422Nze0cGodKgwnIut/mez+9V055nmFO8nD8H3PlXAY+f4NYgNADDB?=
 =?us-ascii?Q?XX+Dg51TIInkf0i0nSlTbUWUZknf7/cGkvR9EPNguFNylXSVHc4dtQDGp1i5?=
 =?us-ascii?Q?bX9tWNl59H9yx/pdFHIjTnQqUcYpCXF57HYZXPKjY3ZZefvyFT91rQNbfq0B?=
 =?us-ascii?Q?PeX8T0FgKMffFWnPfSOtlcPV4JqPHcS9NeSMjibFzbXhLWt7FBrAuYAndfAd?=
 =?us-ascii?Q?mbudDv6B871LTeh6/BRQtpMKqr8BkNIqwaehzyTJT/BGmBShIjN0ozUxEt1S?=
 =?us-ascii?Q?bq9+rnKvADEMmyph+JoYUABJThcmi48xD0sbE/c1YytOAhroBuwKTFTpxKwe?=
 =?us-ascii?Q?qE0le0NeYO+gY6DSJmewq0KwGrBoc79E2mRTMc1yp+uBQdQefetzTwXLw6W6?=
 =?us-ascii?Q?MBL1ZM8CtBBsio1147TX18xrGXe0uHOvpNXxu4beluqAb/HjGKQEc4IQMbxa?=
 =?us-ascii?Q?GapDeZ/P4OKUtP/DXyKlKAjfUSFx6OshtoMRLt0ryMITwGMls4q0GdQvMOce?=
 =?us-ascii?Q?YOoZYO79rJP/7LXI6B0vGHUS85MP3myYqu8t28gL2QeIgB8OZmWNGRRRZ37R?=
 =?us-ascii?Q?WlBU3+nsmCwrrky85ra6olRxeWaMrdEw+ZFG2kudTCLISvTNKMnnOBBq+OdC?=
 =?us-ascii?Q?9XtgqUkwuJGouPP/f89cTfNHM9lzLcsNFuwNuKLlLW+eao72dS3KtoyfDq7j?=
 =?us-ascii?Q?m23B11KXch8cwvY9FbL0jgcGgD6XSFAn/4W1op+KvYxCtGLlYvWEwkIeYXBz?=
 =?us-ascii?Q?8nYU4Ff4Lp59S/GHVKAerla1OI19tcJ4RFUxLCpN55flhaHfUdXo2tN63710?=
 =?us-ascii?Q?+H3qX1Feex3vVI/GF8V4N7LPQfT+rUIx6Gtm4HS674mXV7Fycm9Vi2di/FIG?=
 =?us-ascii?Q?JIQehiF+YXsH2wIjOl2JVaMiN8P2qlTGubaWTzmlUX1sH0maw8SiiBUTa6SM?=
 =?us-ascii?Q?dpHjZqZfgNdm2COhTVKCC0ggntctJijlKqLhl1cztwu8nhuBgTDXp9equ6TO?=
 =?us-ascii?Q?PgOQBWMtMdF8OuSV3MSpKRgXm7nHRCHz94SDW4DwdxY36aXAjrTiVlYwjjxG?=
 =?us-ascii?Q?ZRwOAugNANuws+61FglNAt/CA0tfAljEiAHjXsKN69AaxVyOhUKp50kKr48e?=
 =?us-ascii?Q?a+k57YangsaJFP/5HwuAogkp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ccf95b-ae17-40f4-a8a3-08d98fcbe308
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 11:06:50.2293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hH8DO3Qn6mZkXbv9wHMQbd4333K6t/QLgJRFrU5B7cq7rQqCD5iBbMsRi90CMUR5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5380
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 14, 2021 at 10:45:52PM -0500, Sierra Guiza, Alejandro (Alex) wrote:
> 
> On 10/14/2021 3:57 PM, Ralph Campbell wrote:
> > 
> > On 10/14/21 11:01 AM, Jason Gunthorpe wrote:
> > > On Thu, Oct 14, 2021 at 10:35:27AM -0700, Ralph Campbell wrote:
> > > 
> > > > I ran xfstests-dev using the kernel boot option to "fake" a pmem device
> > > > when I first posted this patch. The tests ran OK (or at least the same
> > > > tests passed with and without my patch).
> > > Hmm. I know nothing of xfstests but
> > > 
> > > tests/generic/413
> > > 
> > > Looks kind of like it might cover this situation?
> > > 
> > > Did it run for you?
> > > 
> > > Jason
> > 
> > I don't remember. I'll have to rerun the test which might take a day or
> > two
> > to set up again.
> > 
> I just ran this generic/413 on my side using pmem fake device. It does fail.
> I remember we proposed a fix on this patch before try_get_page was
> removed.

Thanks so much, that confirms I've read everything properly!

The fix is to incr the refcount at the proper times, not ignore the
broken refcount

Jason
