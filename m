Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8492861F9CD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 17:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D6310E46D;
	Mon,  7 Nov 2022 16:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4504F10E465
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 16:30:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTreGH4akXCXDCksKGhj7XB3mcSAOzOCmIx2k+aWOsdzivelEjidvNUNNDa0bZBmrA/VqQZyK/DJaJxLyj+ulQ2oHwwbYiBb2TdBcgkK7M6ALcR3PpI6NlinmEydtW6GiIngoeLHfEKrzDiPa230SX1g7+nvtZxqrKVvaJChlqapmDI0GBnsGBV82B8VhTB6s+U9Rk6jpGAKTsUUPmXXrbVucDf5EX/NIzW1pax7BEo2AGOTSntfH9oLD8Xp1yDZfpAOemGwruFgMJhYt3vlFdA2j38OXn0lU2ALO7gbe3Uo0+6zJ5Pf+e4PjiLtMi/60MMob6ZDrdfIRnh6xSsdNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+quksj+g25KXF0kVH1RNu9mWp8wEiFHMR/uINNNPU4=;
 b=F1nHS89MJW98h5fjUvARwnEzH/WkU99TFLB04d74vY9CRuFRrNEMyku1MDPZZb/x9MQnLnle73ysFsdRixavEXnYq7NG4SU4Oqpbut3LwnU5JJBD5FHF2W9uBJ/IWIiHleXMeWKjmRlRIIqUEjCdxS9iEwfvqLjcLiqNmDlTjvCv22CB1s/gJtfC9PTTwYZ6dCu9v9RutvmbF6Qq43SYFtWh328wxyoODBsXuoOxFGkgieizTpX4bmG2CScKW8lkzpqDmDv5TT2fHDWa5Uq1bgQPbhfZ9PKiaQNEc1O/2x6x1IWrrfTv8zNMCu0nBZGKy5lGkn68HjVN57vbluFBag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+quksj+g25KXF0kVH1RNu9mWp8wEiFHMR/uINNNPU4=;
 b=V9ubym101DCMaREkbdg9ZE1gNktNxBuP7Be+h/GO+gpvr9OmMKKwFPL6l/IXdtggUZCq8Mof5sjT/vW/bSQ+qWC91uXME73CjShbkYnj+F1tZOiu7k1WS7/ngm66hjPHIMwK/gPsLpas7kckWd99RO/tOXckkrBsmZ92K0HRpqV8rSB1gXLfHfipX9cQ4YFyPihz+aR9lTM0AcRRG8uDrF4CS2tEw28AKQEKbbb+LqADnnYz3XtcLQzza2Jw+6RgWDCinMyg9L3lpzidseHGFrf5TefOhJe8uvI/+3kWHEuoFoUUsADcksz/6e+YMusOMweJ7sAcl+Ty7Wq4Uh2LNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY8PR12MB7124.namprd12.prod.outlook.com (2603:10b6:930:5f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Mon, 7 Nov
 2022 16:30:55 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 16:30:55 +0000
Date: Mon, 7 Nov 2022 12:30:54 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [RFC PATCH v2 1/3] drivers/accel: define kconfig and register a
 new major
Message-ID: <Y2kyvswuCsO0x1/2@nvidia.com>
References: <20221102203405.1797491-2-ogabbay@kernel.org>
 <Y2MMCIe5wND2XPqE@kroah.com>
 <CAFCwf13uLj=P6u6FAcY8M5qAXoaBdb+Ha-TYj0j2FAZnFAPFYg@mail.gmail.com>
 <CAFCwf12yRUG4593ozJMEwaaJBKyWqXTTCjef9O_fzWdQBxVrtw@mail.gmail.com>
 <Y2kAcCu4z2LUMN7u@nvidia.com>
 <CAFCwf10K-dTu455QfOK8i6thismY-FUN2Rws830EGiqOcGWFgA@mail.gmail.com>
 <Y2kDzPswkKyZyRpS@nvidia.com>
 <CAFCwf10A=-bj2nR8WasNxyQQ07D24Je04tzKxqv2X_XnA0BUSQ@mail.gmail.com>
 <Y2kRvyR8VrZrO/1H@nvidia.com>
 <CAFCwf12E4K7bpLcDvTtG1mKxoy1JnchXGCKDvcKAayCFvGWXXQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf12E4K7bpLcDvTtG1mKxoy1JnchXGCKDvcKAayCFvGWXXQ@mail.gmail.com>
X-ClientProxiedBy: BL0PR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:208:2d::46) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY8PR12MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc7f875-8bf3-44fe-2297-08dac0dd7184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HducEIusSMe6qysnHTXULChCDVcR82a+bXs2bE+hAJLF/MATjFD+amVOY/3zZROPf6XOLzp0soqK+ftKnhDQ6VKwDjZkaNRpXPESwEqYPaLSpyFxKsvHuyfPvjS3AOrOx0GZTCs0d/JZvbCvCnPUx7b/P6kn8wc3IUjvYE6GV00Cj7B9ovzZ8dvZuef/pu8afQ6UQQnZdBD8Ylh2c9Jyclko+oIVkv4PLEYqjVfiJfmV2eIh6Dd+eA57lAOmLmJdJuxd8MtPg4Z+7AHiFzbacvvu0N8Uh7bTcHlkO4z2Q98kutlXpfBKOMo4C8gjx5MKoBeq3PDVO1R4ORRV4pZWu6/bdmde046pJBDdJPquEnZbDPXAi7FZnXZF90QgKq8bktl9u6UbhoyXJMiUaHkCh/ZgSBaq0ZRH7TRxpC//VpPH5keOEH/G4463Iflxkd8bHrASEU78ZwY5SmYduloHSazl+5nNQ5/VVKGGP7mBDmEEHxex6Is1YauWniVpKfdWvLxgDMPPeOqVGP17ALCaXJnlrprEbkNVBzK1YQ2flMgDxlemEm+aPaz/MAxlLqGdnyHxU4Fz+nvtwNrCkAJF2QiK1Wnpx5EpsrMp7k7aVdvVM0a8PIhr7GSrkbE7aoYaqV78lScaTyp0UDKBYUKGDXOPqCt5+1F89nH1tHm26FWoIeJXmfh8Jlg6b+TpGHZAbq9FCK8Tf6iSmSTMT7jHLJrh6+/jx3BYw5+Wny6mGwWoWj1VlA6wwdtmLZ2eeAQDqXsPgkjEo8OYhEJzfh7oJRz3lxAo+Q0fKUmCO2KzxU0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199015)(186003)(2906002)(2616005)(38100700002)(36756003)(966005)(6486002)(53546011)(478600001)(316002)(6916009)(26005)(54906003)(6512007)(6506007)(86362001)(83380400001)(66476007)(66946007)(66556008)(4326008)(8676002)(41300700001)(8936002)(5660300002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mPSZN0wMEzJXcnUETTPuDPcP/RM7yUgGsETdeafSYAc63of3QhMxCHqtsKEF?=
 =?us-ascii?Q?3SkSD1WMKqaxKdL4L9xRkZvoLg+f6jKNJcsPKyjA0A5y/IOnCm+uhksrGm3Q?=
 =?us-ascii?Q?3L7XQQ7ZTSSRiS+IUKbt3hanxDqJr5NEzfHzqxqNi64PH361SYBb/tv7+9W6?=
 =?us-ascii?Q?SLCvghgyXaJMFrA8ZTes8AmaqX79CPHHzW3429ywjvgmut0Xuplf2XUAPVGt?=
 =?us-ascii?Q?QU7guokVnMxtqgAzbUocF7UWChXGcDVNnIEGlJpHY+a00K5i1aHFD2LioELy?=
 =?us-ascii?Q?FUpgTczlxoeW2XTFtD+05rxfXqPJKZ4c0GyaNeSYWZbkbir1uVH/pCXBDJR/?=
 =?us-ascii?Q?Lm2YoYOzRwUqGKY6UPE2Z08L/HOr6RHeJA1EM2F26PUx/igMJa67hms7bjjs?=
 =?us-ascii?Q?7i+ipXGhiU+ECoIMldvwqAVacl0Jo5g5z70kzLYaVhxf8LQUwUqovFIETg/O?=
 =?us-ascii?Q?fx18n9OcyZkgaIwuMTIqsepRZOAX3+CoBqESQF5JE0BM2W93BP42Ezu9NPrH?=
 =?us-ascii?Q?2eDjZL44E+npTy0bMQXfqT914QxXrlJiaN2D6IGxk4BC1FtQVkSn7OUwy2SM?=
 =?us-ascii?Q?JQGCc097l3BvwoE+KfojBANvm+EGzGNxnv33Dv2QOcDwTIlQVKGh0D26oTWT?=
 =?us-ascii?Q?cAGDheuY3TP4PhBxJk04ExYgd0fmB/AlcNCNZyrtYXXFl3jQGhvMfBQ2Uiz6?=
 =?us-ascii?Q?KvMtYJBREr9qwpPKUr7Keg64Mt5+/iy+c3nQSstLQDQL4u6Rjbb1SmSb6B7i?=
 =?us-ascii?Q?h7hco69iYDVvRKaAPZ9v0cA54jl9bht4niR5YSzQbkOxiMHA9g8+5UfgiLUR?=
 =?us-ascii?Q?BrSr9aM+l1R1LNxiRhgxUGEJaKxj3JMUrAmFUeNT/0nSsHlBzoLOCvMGynTj?=
 =?us-ascii?Q?rynVRsK8UusKOKAmD+OS/do/6Dx0Ieaq5AXGY7alchxUjomscr9vt617Ouys?=
 =?us-ascii?Q?SZmemmcXnxE1XnUVVq4tJAJ1y4gzWsvnuWIIsZILVAi1p/oLIH1to2g1knaI?=
 =?us-ascii?Q?Fy7OYQqcEGye4G3ts+ndKkj+p45hfldnQYIWW/i+sx3V4+L3Q9xmTEXpyGyw?=
 =?us-ascii?Q?PGGk0nuuMyAXFN39FFHE2IJYPxJLo8D9e1kxFNM5Dhcn14nLHesvX8vg/JYZ?=
 =?us-ascii?Q?xAW4Rvzx8bENBnJRtE/R3C3zJ3Cj3rnvRAgeBfwB0hA3HvkRSPbKvaLTqZwy?=
 =?us-ascii?Q?cWrIwRrquXJAQCXcZIEaj8L1lVciYFEQy9kHB3lOwUudQaHYdlHZP6vU8ela?=
 =?us-ascii?Q?P6AJ6ygaL90TOgQilNs3RIdqYkrRGQVcRbULOH3XWL2Ix8XlGeY+HRAOQzIW?=
 =?us-ascii?Q?rmimmE3JTV03/oOJnR1hiQsw5ucj49s3mYqHqlUaEO7g1I7llSFQpOg4ulfC?=
 =?us-ascii?Q?0+JPx2Z51l0lpulC4aCejbzsRH0+ufmp2dBvOwijX/oRymDoMe+eRY/3qg3V?=
 =?us-ascii?Q?9JSM/5yF3NN+wDJyrwoF1J96jyvgDEfHmLXlf90o1H8vpBBg/ovyWA7dYJVj?=
 =?us-ascii?Q?k3WDE85UXplbEI1N4QOF67AbPv5KFz+gqvVrq5ADP4JG+S5O/RSFx9IGWWhR?=
 =?us-ascii?Q?IVXAgINciSs2ssXf7wE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc7f875-8bf3-44fe-2297-08dac0dd7184
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 16:30:55.2074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohukoKy3oM8nvmOtcDUdEYMKLuHJ8KdmeaXzEnuYW36l//1kZZeYuRtFhZQTXnNJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7124
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
Cc: dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, John Hubbard <jhubbard@nvidia.com>,
 stanislaw.gruszka@intel.com, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 05:53:55PM +0200, Oded Gabbay wrote:
> On Mon, Nov 7, 2022 at 4:10 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
> >
> > On Mon, Nov 07, 2022 at 04:02:01PM +0200, Oded Gabbay wrote:
> > > On Mon, Nov 7, 2022 at 3:10 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
> > > >
> > > > On Mon, Nov 07, 2022 at 03:01:08PM +0200, Oded Gabbay wrote:
> > > > > I don't agree with your statement that it should be "a layer over top of DRM".
> > > > > Anything on top of DRM is a device driver.
> > > > > Accel is not a device driver, it is a new type of drm minor / drm driver.
> > > >
> > > > Yeah, I still think this is not the right way, you are getting almost
> > > > nothing from DRM and making everything more complicated in the
> > > > process.
> > > >
> > > > > The only alternative imo to that is to abandon the idea of reusing
> > > > > drm, and just make an independant accel core code.
> > > >
> > > > Not quite really, layer it properly and librarize parts of DRM into
> > > > things accel can re-use so they are not intimately tied to the DRM
> > > > struct device notion.
> > > >
> > > > IMHO this is much better, because accel has very little need of DRM to
> > > > manage a struct device/cdev in the first place.
> > > >
> > > > Jason
> > > I'm not following. How can an accel device be a new type of drm_minor,
> > > if it doesn't have access to all its functions and members ?
> >
> > "drm_minor" is not necessary anymore. Strictly managing minor numbers
> > lost its value years ago when /dev/ was reorganized. Just use
> > dynamic minors fully.
> drm minor is not just about handling minor numbers. It contains the
> entire code to manage devices that register with drm framework (e.g.
> supply callbacks to file operations), manage their lifecycle,
> resources (e.g. automatic free of resources on release), sysfs,
> debugfs, etc.

This is why you are having such troubles, this is already good library
code. You don't need DRM to wrapper debugfs APIs, for instance. We
have devm, though maybe it is not a good idea, etc

Greg already pointed out the sysfs was not being done correctly
anyhow.

I don't think DRM is improving on these core kernel services. Just use
the normal stuff directly.

> > > How will accel device leverage, for example, the GEM code without
> > > being a drm_minor ?
> >
> > Split GEM into a library so it doesn't require that.
> I don't see the advantage of doing that over defining accel as a new
> type of drm minor.

Making things into smaller libraries is recognized as a far better
kernel approach than trying to make a gigantic wide midlayer that stuffs
itself into everything. LWN called this the "midlayer mistake" and
wrote about the pitfalls a long time ago:

https://lwn.net/Articles/336262/

It is exactly what you are experiencing trying to stretch a
midlayer even further out.

Jason
