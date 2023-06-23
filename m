Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C5873BCBE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 18:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977A210E677;
	Fri, 23 Jun 2023 16:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A51310E677
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 16:38:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBQFplLKpfGhC18vd4W9UPypP3RqoqaF1rNFxJZTl28OiuYYL7A/3URuyFHZEDnGWnH4IuCT4YRDA/qGBd+tFhHuhWIfzt3oPQdyG1+ZJNEmSN7Wo+/eMFMTWweDMJ5DEO9JZO901BntYIPmaVWcbdDty2OO9Sy3ZJPiC6KqMVQqMlFUXkv4rBn5KDrRJPeSgz+pR4VmzWy5Cb6N77ATjm4xr3hE3CiyPfwRrR9IANn6UY9WDL09XG4sVrZWKYVNHTu3OI7cHbpRsvEJzro+lZoES1mf8kwYoroaqSnJshgaFHDCbUD7NZaFIvO1emUwN/4CiqYwjV4HiGQj5STr4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lypI+WPp0qCR6UgZQBoFhsFADNaan/psXzLEMjiwNRA=;
 b=amRMTgYwL5XG2SrogwIMhyfwz64Tvt+2fXeufaVaM5kH7HAojpozYxYyEmctG+7MmK/spyH+7mfWcq9DQ7ZUxI0uzBEj8XRRdGQNmHg1D1qMP3wwmyfvDsjcqXmHzrTaAZNnSUwjK+yvTpg//XeVwRxBBGhHS5kH+EVhpjeTyxodWGTssqoRxM7aK5ynauDrz3OHXi4VHnoS5lnArtR4yi08PYnEATZznmxRd2XTBvbds8CpNjarsg+uDHeIUaqT6vgHH1roL9ETaH+4WSyA+E30MzyfBqj34ZgeHsqNuT2PAJZzF8m9RUENiVAFlKI9XcPMRAEUg9y1W5h+d4c2pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lypI+WPp0qCR6UgZQBoFhsFADNaan/psXzLEMjiwNRA=;
 b=KwtzTbzbOI7rc2CDJrlrwrbqRvEsYF2hy7xcW9iCOl2VUiorwi5pj5KsL1JSpbw1uP9BSp4o6PzO1++6QEFFPezQeCk6xRKXLTEqjsVX9cREFuSeyjOCwtirBwd+JKEsPlpLuUk8al2VZs4m3GQ7aQIxZLDupSmukgwtvP3IvIjEGAcFQ87NCp+RttqvtP1YvWmzQX49nfiOaZBuaIsohSRDatFaZZOorjME0ZWxXJy5GmLbpxSHv0K3iph3rEZNHlgg4T61HEAj4ZHAQk11Liwm7xA5sRqvuUsHF+ymv6DXzKYtTUQ1e9z6IlGODnjBTy3i9G5cLpS2Rrb9lO2hjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB8014.namprd12.prod.outlook.com (2603:10b6:510:27c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 23 Jun
 2023 16:38:00 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 16:37:59 +0000
Date: Fri, 23 Jun 2023 13:37:58 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
Message-ID: <ZJXKZkxDKYxaJI/1@nvidia.com>
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
 <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
 <IA0PR11MB718510999F2C0E2B70914E2AF823A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJXJ4ULRKVN5JPyv@x1n>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJXJ4ULRKVN5JPyv@x1n>
X-ClientProxiedBy: CH0P221CA0046.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::19) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: e2390ab8-ce88-4a4d-55ad-08db740834ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bDFtZofFr7ksPlgjJOzvYWIcSpfGZbNfdhd2yjQeATB32wDXvGWhsQAL0+gsRkc3fSUzZgtJ+6KzYsTGs+rUQ8EHWZ7pSrBzxODHcJuCy3XgTOLRfPFY97t7hfSNhWtivgfff/XGNyX2mCewl/IEEo7ZWLd7xVln1yiX3TUQSXxAtbE3RhdCfBbioySKY++Dz8NPefZi/5QgrE7DCQbfJGWCKoVpRHPqFoTFaT+6WZKJL+2IrRuBy7kq7/KCAiZnfUzkR8zrrJ4jVt+yY9q/FbUzwyD7yGkVN0fsQ9VoLZff/3Wq8jK4F2Zdy95XCHON1IuyeEpcCktcmim3esyRP9ltdxub1CwrKtZ3WKqphC1pMeHmBK4oS+Ry2lBGaDX0K6l1sqNMIV8jaUFzLZiKAZWastJUQC+tPpOekWPTWMHzEdalQYWOHDPbS1hOz/tu5XUaiO2vw/RjHTMR9Bpa3DBttShnHXgwxh7cGaZXYD+XKeF6gedQfwdhO+vptvgzxDhEWpYrLtkCbNEhyOc/oMWGKD9zkrGacxWBxE1Tly6RHIKTvbhy4Pve0eYSRLdp255Ri5wAW/HqgUt7HuByWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199021)(478600001)(4744005)(2906002)(54906003)(38100700002)(2616005)(36756003)(5660300002)(966005)(6486002)(66946007)(66556008)(66476007)(6916009)(4326008)(316002)(41300700001)(8936002)(86362001)(7416002)(8676002)(6506007)(6512007)(107886003)(186003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YYDHj+d91MMI/VIlxHh1mJipjj7hsXxhVscnjMcClMsdoc3Jn+J8syoNvM+B?=
 =?us-ascii?Q?pRViWXDsVNbTjinRbqDlNYN/02BLJtwxL6RZDK/2VsNwD88gg49KTDSC2UjL?=
 =?us-ascii?Q?m2RrYdZDbsACv1LU+0LkuYC/8xy3dNznx6mF0zdtMyaPLOWCA1OUq2RsA7ls?=
 =?us-ascii?Q?7rD+0xjOUNMj2kwbrQ0/OdwnZWVfOl5F8Z+8rNDQ6gwuvCbu580stonxI3UA?=
 =?us-ascii?Q?JgzuSYCOj+wIHVJni/la5MJoQO849aErvMC0Sx480TlRSEfjn9stshWLDMAF?=
 =?us-ascii?Q?eeFPSWP5SAQ12h4BvCTg2dIogqqM4JG3DgVj/Ei407761Nh+QvNaiH6OLZgw?=
 =?us-ascii?Q?Pd15bcTa2WRT3wQKSvuGL4A5h28018JJTDvt0mjbbtXurfSsFyugZNqjZilG?=
 =?us-ascii?Q?g+rAqDJ698ZGSHcQHsLCADecxH868nXVVsEgo/uLQEDVNdDkqDPghqa6DuDh?=
 =?us-ascii?Q?LWGi1Z4nsRJiaF3TgZ9zvmjKry1hneXtaQoMcB4EbL74w3qEppuwt6N5QTbp?=
 =?us-ascii?Q?qAmf2khDxMkw4oav8Rv2+vRtSRDEvsj4AhL7RpETPFWB1KxWKF0y4nTez7OG?=
 =?us-ascii?Q?kkRf1FfNpWxVLlyA4s+iGVruZEkQFcuifbOBzgE86jghtFHkYy14D6JeQNXK?=
 =?us-ascii?Q?7yx0ox1+msIK+MBSx9xdUUP0IAqgU8tGECzOOXcRo31ssreo8xameZrJ5+5O?=
 =?us-ascii?Q?+kaI0D+0XRz5USXn1nfInXVW5mw/MUvKgs2VWEVt1/fh3XfjrZSkkt6LMGxW?=
 =?us-ascii?Q?/ABwbe+MkMhp+0Lp6zn8ng2XwKEC515JgbBbcBGB9skM6QkAl5kxBXh6rMXI?=
 =?us-ascii?Q?/Tc8VBfosn6Ew8lKgwBUpdvKh1Q05FTNFXPFWF6Li9QXHRQ1MOpZKmnAoNsx?=
 =?us-ascii?Q?ein2AjgaM+Je7N5bysTJU+3TRkyrrDcYvvw4n7MkKgnD1XGBrsSgPfjoDmUw?=
 =?us-ascii?Q?QoWEz2XhvPBMj1untZMAqJM0APVfyln6xXGqmobyF3SzNadXvMnNzW2in6wb?=
 =?us-ascii?Q?LcqTSoJ2VGt5OMBu9PMPDXL8lCf90IQrJeFT+IW2h16hkBZxZXabRfCcpTHM?=
 =?us-ascii?Q?woL4EB3amPvU3/P+0aYcU/JSFB6FWD5U9c9z6ZAvCMsN32WgHGBcg7F4zJ3Y?=
 =?us-ascii?Q?+75iPHY01u9s0FrFgR6aVDCUO9qbRBgHOAqkHiNU1kW3XsGdSJNfkZ6gaNcA?=
 =?us-ascii?Q?4VuTB4a8ur2+pp0kKz9LPwos8451RjMTkURSSP9g6YXoVDEds3JUGtjopPL0?=
 =?us-ascii?Q?TQtH+919r3sePDa1jNi+IA3N5JsBG785Fz5pZkVVto5yGG/4TZUVbRRr6FNm?=
 =?us-ascii?Q?GD1sR7PVhwZdBU9MTevZplEMksrrUJBzK4L6VV1fpdt2we5c/+f3QBPiphvU?=
 =?us-ascii?Q?UPNJBIRAsrc0bpVyJ7se3vFAkBFW6AuzfEkBlqpaj8VfAFDsjEN46dxalB65?=
 =?us-ascii?Q?MfTTf3KTR4qx+23shkZulq/7kBluzwGUWTVNmXfBMwXzfzqlyNva+OskmA2J?=
 =?us-ascii?Q?jfSpaL0Z3HH7F4Maae7H33j1ZNeFD4TWZireQptPoq4Ycz1iLU6YBKSWQhFp?=
 =?us-ascii?Q?8Qe1XJ0X++d3BZr8W/vcw1PkNr5QB0Wvq5bJr+Yc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2390ab8-ce88-4a4d-55ad-08db740834ae
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 16:37:59.6685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5sAW2S9O8veYqGKI4pJi6mOYTUKhs/iWrrNAnIKr+HQVN6MD0KUOOKu69Yid/uk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8014
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
Cc: James Houghton <jthoughton@google.com>,
 Jerome Marchand <jmarchan@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Muchun Song <muchun.song@linux.dev>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Hocko, Michal" <mhocko@suse.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 23, 2023 at 12:35:45PM -0400, Peter Xu wrote:

> It seems the previous concern on using gup was majorly fork(), if this is it:
> 
> https://patchwork.freedesktop.org/patch/210992/?series=39879&rev=2#comment_414213

Fork and GUP have been fixed since that comment anyhow there is no
longer a problem using GUP and fork together.

> Could it also be guarded by just making sure the pages are MAP_SHARED when
> creating the udmabuf, if fork() is a requirement of the feature?

Also a resaonable thing to do

> For instance, what if the userapp just punchs a hole in the shmem/hugetlbfs
> file after creating the udmabuf (I see that F_SEAL_SHRINK is required, but
> at least not F_SEAL_WRITE with current impl), and fault a new page into the
> page cache?

It becomes incoherent just like all other GUP users if userspace
explicitly manipulates the VMAs. It is no different to what happens
with VFIO, qemu should treat this memory the same as it does for VFIO
memory.

Jason
