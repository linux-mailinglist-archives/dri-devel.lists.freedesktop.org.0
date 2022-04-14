Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74782500FB6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 15:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1611710EC9F;
	Thu, 14 Apr 2022 13:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B804010EC9F;
 Thu, 14 Apr 2022 13:43:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwavpmVH2kmZ6WUMXOU8Q2zUNr0KlvjL0ACEgg5eiUyriCUSghE9zjH5Cd4sL5DdzUfSyOlE5bMchnF9KKZp+FAVBpjYuTT7n7AkWIKfIbo6q6MeLCJSlQtSj3R9kLTzSqO/eYGjLY+2aymwc7jcEhyFT6Zku68q2wJUsNDoAfVCPPoziQ9Mugu2+qMssTV7iXlMX/pNecrRidv+o5/PdwKrW0NAbD+Rz8qy7YH0Oo3aJd7xlJjDaN7ce4PevhacOC0/OPGSq2ChGipVGtzuzH7xKgpBHGWIgIUW9ee0w5YHDxYdsHyn7b31immLJG5k3MHFaJ+GAI99EMHQHss3lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wb2CE7f3W6b5Vc35+i0KJ/2Rx+s5Zke0g9Er7Ck2lZY=;
 b=MJZkhHg+Hly9owyzSC/mq+A3fRg1zSEDGykUp4F+HutCAQBYks/jWuDBFEvBX+Kly5y1TGetM6CkJquFh5+DKUHDhZGgwpF8GFebxG/7aus+Gv3koQ6LPpNJ2qa/VOCu2DhIcfNmMG8YS+mt2Rih8eUE3/BmrUubqf+jUHBlWkvYy4OMrUVyZtyOemzr7dvUhfvjYTDeikt++yXUUhLvcp1Ml3mzh93aXOtUDXXO4wQSlP6ILUE2JxhMXbZvOFA8TbVACYTX8Ceg6rP7FErKlktDu3iCyu2qj3W4RG5u6WW6iK03AW9TLi4T7TeQnNmNIKV1u56Hlhgij008ybtHRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wb2CE7f3W6b5Vc35+i0KJ/2Rx+s5Zke0g9Er7Ck2lZY=;
 b=Ssk0vNfCPFR2JS0HS14kPdoViCWyvq5litmoFToQQZ9tJAjW1jXeA3Tlk+M9DMYtoPbayu7AsYAMLddkThgvhsRmw4IN0mNotvcl+1tEYzcdB79lQi0h5ghzWv1ghWD2NYhI3cA9Cy6gidWusofMhi4IlEZXk52bO9amy7qkAF7F2mt8O4v0MYyJpZ6rSILoEe1avLZ8UZ/AxMYD6QVgTuR4ND25Qdwqidp4jwsPI7KUBPmjN18MuHW/JhXIFGrFupcNCB7Oieu7FAykqudT95q2KRxxQBZ6dC42Dg24lCPPfSuQiNk7YPwk+An7zc97XAw6q1NxcrqNwo6y1ArbHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB3050.namprd12.prod.outlook.com (2603:10b6:5:11a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 13:43:22 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 13:43:22 +0000
Date: Thu, 14 Apr 2022 10:43:21 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v3
Message-ID: <20220414134321.GD2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <82c13d8e-1cb4-2873-86e9-16fd38e15b27@intel.com>
 <20220413154642.GA28095@lst.de> <871qy1geko.fsf@intel.com>
 <5af7726e-920e-603a-bad3-8adb09d2ba89@intel.com>
 <20220413232053.GA2120790@nvidia.com>
 <1c3aaab9-3bd4-95d4-9f9f-4be9e10e6516@intel.com>
 <20220414133427.GB2120790@nvidia.com> <87ilrbeqbo.fsf@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ilrbeqbo.fsf@intel.com>
X-ClientProxiedBy: BL1PR13CA0139.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::24) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfd9d733-49e9-465f-a9f9-08da1e1cbe30
X-MS-TrafficTypeDiagnostic: DM6PR12MB3050:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB305028F2B9A48DF5A5D5C285C2EF9@DM6PR12MB3050.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y8dR7tk54tnmX/jEyOEa1ndJTowDNtdgaCta5vrzUrzNEccU9x8hkIrxcrRBnl+ONDpWJOL8aFoNg5DM2nPrROFJRlfV6Zx4rVXnUJSnOHjibYv2rnBggkZ7stiYIjegbA177MmhQQsVrKx5fTk4cV5HrqtdAlGS3vcXSgwAx6lrOFf9qIRkBtPkxNj8dQ405kjI4/rSU7fvMcHnA7Cj1761mIIM2tLtV0ipJUD4Y6HFCZLGROgmL4Q93NlJ4aARV0wWsPEldDYpTXycarXYJjT+LvxL8CR5NUzlf1tRhq76sFz1aQEYlmB0V2PL75OHVXZkCy6bTAElnni17+AWFnY7oFayK93QZ2gwwF1DpZAemq3lyIx/uK3jIWG80Ieh0QYOlGrV2Nyo9e5ifNY9/VCxd8WrHLp6FbgwNEV3R+pV8NQFdirg7ZpHb4Ezh2WdSvET/YGJl2YK1zqrn8YyPfgQblW4OFn34aVhrQpp9Maqa8CA3KrOHjwpgaEoroKOmxS2F8AR4V4ijp/acZkUGSfFJ1GXnyRw7Vk1tV5boGfIIUoqINej+su0rjFj/R7ucOmMLa+ey2Ag3yDIQ7779qzvDSUWo+HncieWE2/AIpdhumWOllQuXrDuZ05cSayo3+jqOGqADBn+YmAdTYtcr3uk6HPyB4ZyCiw4C8nhUqhi4TN1eN54cmZV1MS/e5BB7hMX/28IrLln0ypK2GfAael7TlAPRa/l/Paq8YThnkA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(1076003)(4326008)(5660300002)(316002)(66476007)(8676002)(66556008)(38100700002)(2616005)(8936002)(26005)(83380400001)(66946007)(186003)(6512007)(36756003)(7416002)(33656002)(6506007)(6916009)(2906002)(54906003)(508600001)(966005)(86362001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZBbkgbVaCs4iyNHi9UlR5XRVi4QdUjNfVb0DF05w5365kLEo6YEypxvfMMLH?=
 =?us-ascii?Q?dw1FNCTHdUfdQfkkb+zHbbzddrCg9GqdccjOoeb4N36buanXinzKuDpzFkds?=
 =?us-ascii?Q?c9aspx/srsH3Z0EN/dQpaUx9xxGDNU2B8N5zLcdp+chcph0V9CAK2V8ld+Ta?=
 =?us-ascii?Q?wuqgEtUG9BILCNVDImcj7e1SbyFa3q7IFTmntCFB/oCn1psFnU3LLOg2MvGH?=
 =?us-ascii?Q?/hQTiUyurb5pomzDdMsUjES4cbJJx3ZUjnU/I5nPOlNOoa0Dq/2HnQhac6Gi?=
 =?us-ascii?Q?rKhyUpL28nvfeenk/EtQnmVdgEoZvfGS7iEXZcbl2vepdkF94CpGH3lA1LWR?=
 =?us-ascii?Q?v7J9r3OKTMUu3M4AD+B0a8ofemi/WOlIJ/3UsEi+ndbtdn+g3aX0nBllGqaY?=
 =?us-ascii?Q?hc96T8GCG00LR3RXhVxt+XQCH5ybvK6m1GX10ejJGmdXBzFSwzQXnjr3tAtD?=
 =?us-ascii?Q?eXA6pJrop4t4mjAD9hoEzZbb3D+J+YPbbUwjAvv7nldGCL05/yreJkUpEJNw?=
 =?us-ascii?Q?Ap0RhyGD8a122HcWTfbAFnkpDKTJuocBGPdS3kphYubPpr06vIjaL6QgMZcU?=
 =?us-ascii?Q?dPllPr3wyj0i5fMN601XHTx3zp1tiaiWvOiA1m2dMBPUQdVyROx37sj786uI?=
 =?us-ascii?Q?Ub7+GLCM1ZFTEuddSs+ErAWLKXe3qHrTxdXhudqbuedfVWaYFj/clNEDRNJU?=
 =?us-ascii?Q?P81zlWrE+5UA0BrXTmrFknfQ5ynGrPkEOuOu8J9uckDbZ8kWaiXQmMwEbNiF?=
 =?us-ascii?Q?wP2pIbM32m7wC+OQx5W0M0/K4xTIosNwc9lGzB777XCSa5YMosP/svk7HRSA?=
 =?us-ascii?Q?W1Qrakh2fIYdAtltbLUwyFGbKuCuO12/yczIgzxPnTjj0L00LuvwkWtPBKLl?=
 =?us-ascii?Q?uq6d2wy39Xr8jCfCqERLONyWXS49on6kWXnvXHOMZ7m9cgrJRolGH6HNN8i+?=
 =?us-ascii?Q?3NbD2zmG20ni/SLvrAPuSU+509uaTxBewWA8mP2uoYvF8BukEM6rur5Ft7qT?=
 =?us-ascii?Q?+o4W67X5HN66beKUl0zsz+g2g8OMYTh5OyktUN0svT3l9pONw80iY81na052?=
 =?us-ascii?Q?5/dNaHHeZ0JnTnl7YZbRw6t6K/Wh5o3fef0dpenFVj83+rlMxuTrdfiYW2+8?=
 =?us-ascii?Q?TZUdQDnvqj0HBHuajepP7WpkET41kfpghPL+EJRsLNJkuHB9ktTo8cgP/4zE?=
 =?us-ascii?Q?hpYaXetuZiMr5zf843PtUU2OV4VAQGoCaDBBXdW3i8Xkh7y2d2O4GSs3Y9Z6?=
 =?us-ascii?Q?ZYMCnSbeS3dTYwTFgA+FfrQ7yjHqF8VH/BFOCNhrgxFTIZ1NTJsJ3ViY5QuY?=
 =?us-ascii?Q?7odpZWWZRiX17RLfEy6vr27PvCXDHW78/3F2+gGYd26tcyj6mkWsi5IPGhuw?=
 =?us-ascii?Q?Ivpazo7M3/XWrBu8x4RPRN2U6/oV1dTnu9N9XH+YLv2K89mGmdpmQnMQKwLs?=
 =?us-ascii?Q?WnTO8jkIO1WM4VzGuPOKKfc2st85FEvEXV+EC4U80AEF/RSpkxOew0vGw3+k?=
 =?us-ascii?Q?0J7asNeR8/6d2ei/4u57je+9Z34qOgPiGBqFNpUR6gb9MWTfoCL43ynrFa1c?=
 =?us-ascii?Q?75QirQD+tKXn1WIIqWzlw0cCUykg6p5MHMCPmbFidGS14Xf/rvxsvS8jQfDz?=
 =?us-ascii?Q?550l881sEDR10KBOJRSB1klO1MspJ6XG7UIMojQrv6yg0cWeEOUeTsGLGjYy?=
 =?us-ascii?Q?0eja4382zwlhHUQj3m1v3YKNg53dsHkrpCc2UikmuvWlR9aDOPw3A5Kk4XjT?=
 =?us-ascii?Q?QNm3bKr0Bg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd9d733-49e9-465f-a9f9-08da1e1cbe30
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 13:43:22.6530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0zEvvzm6w6OiDKoQ1ftMgAYYpKjLgkrCK+ziD8HwZSgMttYlxK4VoYiFoUQaVYP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3050
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 04:40:11PM +0300, Jani Nikula wrote:

> >> >> git clone https://github.com/intel/gvt-linux -b for-christoph
> >> > 
> >> > There are alot of extra commits on there - is it possible to base this
> >> > straight on rc1 not on some kind of existing DRM tree?
> >> > 
> >> > Why did you choose drm/i915/fbc: Call intel_fbc_activate() directly
> >> > from frontbuffer flush  as a base?
> >> > 
> >> > Jason
> >> > 
> >> 
> >> Hi Jason:
> >> 
> >> I updated the branch. You can check if those are what you are expecting. :)
> >
> > This is better, except for the first commit:
> >
> >  [DON'T PULL] drm/i915/dmc: split out dmc registers to a separate file
> >  THIS PATCH WILL GO THROUGH DRM-INTEL-NEXT TO UPSTREAM
> >
> >  Clean up the massive i915_reg.h a bit with this isolated set of
> >  registers.
> >
> >  v2: Remove stale comment (Lucas)
> >
> > Clean the commit message and send that as a proper PR to
> > drm-intel-next, then everything else is OK.
> 
> It's already in drm-intel-next, I guess the problem is basing the branch
> on something that doesn't have it. I'd probably just base everything
> cleanly on -rc1, and whoever does the merge between the two will need to
> account for the missing include in the result. It's just adding one line
> in the right place.

That makes sense to me, especially if you can do the merge fixup
internally in DRM.

So drop the '[DONT PULL]' commit and send a PR to the next DRM tree -
when that is confirmed send the same PR to vfio,

Thanks,
Jason
