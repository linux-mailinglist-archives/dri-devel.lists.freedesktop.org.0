Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FFC8088C5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 14:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E760D10E892;
	Thu,  7 Dec 2023 13:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA66810E892
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 13:05:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHg+HzOgZ+nWt9R8KPqIz3TPxObWilkHepiNuNn08BN+MNm22q9CCkcWidCbZKIjAl3NtXO/yAsCVO+WRIhlxR88zNy93N+o6fMbjNSur9YJVB9pwaDDG38X1qiZzWMxUn1y7EYnWtZ+pIN8KyeBaGWyv+Ccf9nRm2G2UQoCTJgMCqz39hn0KYmr5Pu/sjZ1quIqwevxIOdHUGKVaHeDkw/Wd1x2oVQdNCWXH+Q8kg1E4cf5ZKjWhIyoC2q03LDGOo6M6pboHlHNmWMRyXefK/gx9X8EhfX7QjlFqmcDqBc6R/6DCT55Fln/3MyFbVFheWGNOi4+UvP93LXOSDF+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tq+U/opIDspIssYyIbogvR0ZXRYpa6+TclCnGzxp+e8=;
 b=Smnec1ojZhfMv++E1Tcg38K358LHP+fYGmReoG9BKJygQk7MhqwuxzOvYc0nz4VCk5kaGNiyGmqdXhS6tq5F4nwScXlNjoVUzPqs3x6R2Cdn7DD0PkhhP0enkFOUl1hgBMVyUAmQyjyQ9CRDw1BxMZyfeQ726LfooqUQDfb/b+Y0/gKKsxlWWhZOQ8fv6/LN9V0FbM3p3WhrpJQcwm5DJ2/9iRll+2ClgyV/BLHl0qwEFZ5Ue6Tlg2HQwa/ihjs7niBsEriG+yzKCPHUoJRgLxh+OpBMGmdfVWeK11VlikZcyDZqjcv2bFEotlyzBdMtg1/o+9eFgxOsEy9fdMgyhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tq+U/opIDspIssYyIbogvR0ZXRYpa6+TclCnGzxp+e8=;
 b=jq4gv89bgxzyonL5OxDz+Zk/G3+2Y6jTGHFy2D4augw7igW2oOT7RWeKgwpFvcHfvroW0UZvnsjczGkLQuvQrLv5RsNGD1EpujlveSs43nez0FyQUlPwW7NFBpoqREg6HHHpLxBSmVsg7sR3GK0FKEuDaYqIzj8bOZLxDS1arl7nSxOXRTkglKm7l3gUArdvmjsmM46L51zkzz1KDmbwmjXAsCBgZ7DQkNpRx68nXFYzZmH8IGT2PmDG6opS57ovX4jveaKF/KFYRNviNIgRmUcfUvbvr+FoVD1R6UjJhytmXpu4bp9aktOKPBfSKkh15bP/ko4WSxvdKo7pzPDhgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN2PR12MB4519.namprd12.prod.outlook.com (2603:10b6:208:262::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 13:05:33 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7046.038; Thu, 7 Dec 2023
 13:05:33 +0000
Date: Thu, 7 Dec 2023 09:05:32 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 3/5] mm/gup: Introduce memfd_pin_user_pages() for
 pinning memfd pages (v6)
Message-ID: <20231207130532.GH2692119@nvidia.com>
References: <20231205053509.2342169-1-vivek.kasireddy@intel.com>
 <20231205053509.2342169-4-vivek.kasireddy@intel.com>
 <5ffe2ea3-83da-4b5f-adc8-af9cd9a57cd2@redhat.com>
 <IA0PR11MB718520192D5885CFCCEE320FF88BA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <b8b82134-36b5-41a2-b0f8-1fb81d65a679@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8b82134-36b5-41a2-b0f8-1fb81d65a679@redhat.com>
X-ClientProxiedBy: MN2PR01CA0045.prod.exchangelabs.com (2603:10b6:208:23f::14)
 To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN2PR12MB4519:EE_
X-MS-Office365-Filtering-Correlation-Id: c10694c8-7576-43af-1bf4-08dbf725325e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6iCKahEgGj6y/dw5di1za4vv4MmYDCeqbgrdgdLeDNtmu0zYWrmuWeiZPsV/S1+f8pRYLDR/V1qqaWojtaMjZoYVZ6csPfDzIfeI8xleM6wicPfYjVeZ5X7cpIajQmDf0rVw+lI8OHqqyRky5iC3l/30koD6GKkVxCLr86nmEg6ybF4SlSkIjbma6otQLIbpcigr4wO3U7Bmge7Xd1u/4XMAV9Y+r6PFmcx+M1eoVWzc1swCozxlTsSgZMn4ZGVELJvGfZ7s37lTCXSMlF//NGbk6KGfpgNgUb51Zc6Qa0SiWmD40kxNad94ps5ooRQH0BAh1gBcIfRE8GIMkhjxN9XFNrp0Wl7d8Fy1vMxo2ndZWHqUJvv614aLAqQEyAYTcppSu85vzJpXFizBkYyNBdA+mj6WQV3YAqelGYfQyyNo5Qj1COC56saE12j6m16xlOgD4BUFNxA9BY+TUQ8K5tfni32WFMHlcCgbLCHf2sqDj3Z8Gf7bUyHzlci4BnlpUOmwxDh+KWu2TM1XzvfGsvWnxi3r9gpOJL6KG3UzAfEghVXh6esjjRnP2STHsqv2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(136003)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(83380400001)(478600001)(2616005)(7416002)(6512007)(2906002)(26005)(1076003)(6486002)(6506007)(4326008)(8676002)(8936002)(86362001)(66556008)(33656002)(5660300002)(41300700001)(36756003)(54906003)(6916009)(316002)(38100700002)(66476007)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TXKhZr0AEWCkk8JicuD91mVwUolhmO+nXCCwRV1Tt8XRS3xU4fNnO00sEbeb?=
 =?us-ascii?Q?3+E75dJDX/DpzfKAHeYYfy/wahmgVgPjd9l6Ryxh/bYHB6357R+9bzdukEz8?=
 =?us-ascii?Q?2aSw3b1GpIM22buDyzJqjzh6/YBLyXS452nr5glnTJIUMrl+VUadc94Tf81R?=
 =?us-ascii?Q?ip4kVGF1nvgz8klVhQfNY05wQAb31oiXbaFQ3kJbjmh0TX93aRcQu64C668H?=
 =?us-ascii?Q?IFTFrrDB5aSshC6mYAnDrazStHGsSfCuN77+TStsVa8GhZqWCBJwykE+NnJ0?=
 =?us-ascii?Q?Ig3kmy2iRkUaZOj+kuLwFEgiRr4LL6qr6pSNkfo/WC4o2bWMmptaoCGUOpby?=
 =?us-ascii?Q?KR3SJ/lMdyQo6ueYeGivzWliyaIMlZZhgVTQWThG2ZwQJK+hbzy7zUpxO56B?=
 =?us-ascii?Q?/lQW3Vwhx1t9bhflUqWrAjbYHKOAfmrSrxfB/xm9Xc9mI8OA4bfejxWTBojC?=
 =?us-ascii?Q?LIKkqm+hrIRm7rYrarTvs9E0NR+BmNAfc8KgGyihua+wWiOq8apHxef0vWuj?=
 =?us-ascii?Q?bhLefvsosGfpjVhLb21sXDxKIXaryGcGdDUrB6Pa1x15PZr6hIkuaTgjF0GO?=
 =?us-ascii?Q?gaFZi8EjkwJXRo1/aLMeiu0MyoNfj9nERo/J2WiJER0qMjUWe0McBTqyFnnD?=
 =?us-ascii?Q?Zoe2fbqMBaFuUtx2EbxqHzbms76siHwzjXNZbuLrmKB7kNB/WSgRcTYuIU0q?=
 =?us-ascii?Q?7TyzQTgu2ykJH4U1mMsrvQzdZNuwfhz26tV8x6QVMlG0tjcH1WrrfbY3Br4o?=
 =?us-ascii?Q?URI/7Tq1eE9MTxiSC7p481vCcmy1zg9Nts3M7UwZhZ90cI6ivX6tJ8nrMe62?=
 =?us-ascii?Q?dmdcZqgWgc4inM0R1VpB2nIQzX2VqRBFaNF1RNaqIXlinknLPdj8QZRz7CWp?=
 =?us-ascii?Q?ykMzpidmtNCyZjDPQkKE4bdz+PPFmi4U5Tsg6A/JIbP2EEt2LV5b1cKktl+5?=
 =?us-ascii?Q?OHX2lz2jELg4XJ2GgyVdMeytnO+20idX2Vhb1PRfAkI2c9BVWfPGwz5bnOya?=
 =?us-ascii?Q?waU9oQRHOGR0XUCGRP7TbobM3o2YVrJ1vvsx4PrHqXsfLo+0biyA0OzabDOT?=
 =?us-ascii?Q?JkGvnTCcA7K4rjGtCsONw2IuBAZ/n3q/z6h1cP/FGPhHcjz0adZsRVhIeIQm?=
 =?us-ascii?Q?L3tUnO1jgJg3PonZfky2R80GSyLOb3J9rWNdI3May9n+Tb3+iYPjB4M+XQEf?=
 =?us-ascii?Q?j+UgSEolEoAHgjGl+xH8Io6BGNQaEMscOiuVj0F5vj7rmSXITLZYVWD3iDEc?=
 =?us-ascii?Q?RFu9mZOFEsOtc7CWFrHi4b5Z+A8pxnZYzuETn1LWgzC9GhnxFU1EJTDNzKPN?=
 =?us-ascii?Q?fjbYJ5EkrpSR6pMwMa9/F4ndbY4UY6e6iX4JZSCSYNmwyr6vRuGldT1kHhLQ?=
 =?us-ascii?Q?QQuG4oL3S37YoT1ObL8duhG+hbTIG1RWEm9vqxKqTjBqgkYE5CALpGXxjTcs?=
 =?us-ascii?Q?yUvK9TXCwhsRYzo5MZdMoNCpntMDMgWvlS2l5NWgNuLmuVfBnzFBMRAiGkxu?=
 =?us-ascii?Q?dpQkUCv7xhhUyNC+eiLSUJtWq5ERORSltJ/i/xVIMIO/aGgPfI7cY/iHW1eb?=
 =?us-ascii?Q?HaWbsd1Vst5s0GaYTcZ+Ubwh5NUtu/VPIPpGaCFA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c10694c8-7576-43af-1bf4-08dbf725325e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 13:05:33.5253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvbXPsABTDKhlTn6hJ8SwNByvIiXbDkXciDwEkzv0qmVqmXh/9XJytIU+EPsosOv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4519
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 "Chang, Junxiao" <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 10:44:14AM +0100, David Hildenbrand wrote:

> > > If you always want to return folios, then better name it
> > > "memfd_pin_user_folios" (or just "memfd_pin_folios") and pass in a range
> > > (instead of a nr_pages parameter), and somehow indicate to the caller
> > > how many folio were in that range, and if that range was fully covered.
> > I think it makes sense to return folios from this interface; and considering my
> > use-case, I'd like have this API return an error if it cannot pin (or allocate)
> > the exact number of folios the caller requested.
> 
> Okay, then better use folios.
> 
> Assuming a caller puts in "start = X" and gets some large folio back. How is
> the caller supposed to know at which offset to look into that folio (IOW<
> which subpage)? For "pages" it was obvious (you get the actual subpages),
> but as soon as we return a large folio, some information is missing for the
> caller.
> 
> How can the caller figure that out?

This can only work if the memfd is required to only have full folios
at aligned locations. Under that restriction computing the first folio
offset is easy enough:

  folio offset = (start % folio size)

But is that true for the memfds here?

> > I can make the udmabuf driver use folios instead of pages too but the function
> > check_and_migrate_movable_pages() in GUP still takes a list of pages. Do you
> > think it is ok to use a local variable to collect all the head pages for this?
> 
> I think you can simply pass in the head page, because only whole folios can
> be converted. At some point we should convert that one to use folios as
> well.

It is like that because it processes the output from GUP in-place
which is a page list..

Probably what we need to do is make the migration checks happen while
accumulating the pages so we don't need to scan the output list..

Jason
