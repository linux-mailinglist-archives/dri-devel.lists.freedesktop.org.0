Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BE8740018
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 17:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2469C10E076;
	Tue, 27 Jun 2023 15:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D8410E076
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 15:52:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2N9qlQaMDMMB3dBm3K98XEk+eBtZpEAZJLmqshB0b0GzIUPtK9pB91uZ/g1YvQ6DMvKWaBhIDhMuzexI+WbV7Vc8Nppo6xlHp9dZ1utz99+4v5jyC9NeWW//mQV8O8Pb8QwyYzGGzT7SNS1/DFOruJr75T6WCcsXjGSglEKf/ajS/py/cpKXcDAjnQEQKj0KWPSNQqjApeLoa2jsaLKsUVn6qlG1FyEJut/0Epq/s/g9qWcTgkYdE58uA1Cbaw7qQc9M1XZdUUNZlEc66hjz4Wi01VPGQYo/bxEiB0lFAhtubR0wifjqdYK9mz2qiFt5gxxrefi5RyUb5NBU0wOtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgeNpD044n+Pf4Upk15bZ73cV6uwBS09tQ6McYRzWJw=;
 b=UGvOEBO+EDxAWXpg2P8e2UyPzVzCR+eIX72Ahf0axbA9/FancOUg8tYQfCdWOr3NHY40S3es5yiRyk5dD+WHAwAO9bT8rQyWjKmLCBlj8ZkXJZMhUuiLCpHFU1bLSNtTjiiGcqckgBaQoLhkh462H5j24AioGMdCKV1W3L9CHXYif+MFrObyQaK5sz58XqDqSPvzh1a2jY+A5FiLtbnhmCAiaq7gU2FMKIW+MGmPSpFZaeUNlkd6KtZC7zTdUJTi2eJ/1knV+kojTEpmtAl2sT7tMt3GUMuZRH/oi80E31arzdPHPyn0CEhzl7ITDQlWTFH+lGfSAbQwUKgxoUH0Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgeNpD044n+Pf4Upk15bZ73cV6uwBS09tQ6McYRzWJw=;
 b=p3P6v+sjNEzwDtL8hlrW0B7k4SXQbPf2RbfbDmmTGIHeBJWJ9yCVfifZHuPx/PGRZytT8FZ+fU46GJ2qjxD78B90eDjoFqaWSzlVLGyBhPkyXS9YjB5bAFS4f+AM0ajhVb9EkS682+EuE62lLyjRGkQjKKF+KuonyWFm3yg0Av4h4DxAtYyuXyBNBjP6PVcPXvKsDp4hs89XhAKUW5GoglK+1vM/ZA6rsmJw6coQFGBlYxDmeV7CsAbsCQRRgleHUT/njZyS+egKmUU7KkbeWylDHWGqp9HcqFYrrTR+HL0i/xCGH9SJ62HI33FhLI0rZDlSjhfof3YUR1VE2Yst2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5922.namprd12.prod.outlook.com (2603:10b6:208:399::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 27 Jun
 2023 15:52:36 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 15:52:36 +0000
Date: Tue, 27 Jun 2023 12:52:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
Message-ID: <ZJsFwis9edi3dWr7@nvidia.com>
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
 <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
 <IA0PR11MB718510999F2C0E2B70914E2AF823A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJXJ4ULRKVN5JPyv@x1n>
 <IA0PR11MB718571BA49F71282368D8649F826A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJnQYmbjWf5cOeFL@x1n>
 <dcccb5ab-1e0d-ac06-0d19-e07512db2cec@redhat.com>
 <ZJnWiDhrmL0lnyUv@nvidia.com> <ZJnhNSmSv8ynHu3U@x1n>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJnhNSmSv8ynHu3U@x1n>
X-ClientProxiedBy: MN2PR01CA0036.prod.exchangelabs.com (2603:10b6:208:10c::49)
 To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5922:EE_
X-MS-Office365-Filtering-Correlation-Id: aa9c51e2-68a4-430b-3a23-08db772686e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9d6CJXjM0XTOJ7HtO6HHf9xCXU4Xds7B5NPK09zZXtddNhulRP89pef+eZ423vKSbwYQfiHN9xqTj2m79/SGwkMVK6ZfGNFWe9u2xevNvsswouyolFb85Ks0XrjvEMsHzcUOF/H8TraTzaIeBy+qRC2ljM3PKUfssBIQyYHYEB1sbrtE7Zg2Raf/hEShhQsXCU6aafcVnNu2fOIjHqyRQtyd2QfY7kSkDdeqtKUyxWIYWuoXG39lxPSNTC8O3hbMWmf+a24H5pZJ8Kie+3k6Bg0urHhF5QkPF2vEp4HIwPa9OI66ZftmrMgieradsJP3Ef0D2nZaHDeLYlH+BgInjyaJrDkxOAQQoy0CtCERyrPoGHjMKNZocYqMEshoEj/8R0A151qNBR7aMRk23cxzGT/U19X9soJ7XoWaGD+vNcDRcD0WdP00IWHk6GtY4JL0II1Uib3Jmfao2WJKkdJErgxNCZbKAXhOHm+wg6j4WvS0eFAf1LdzxQslKs51nu1fC6eGDVg5PUhqKtirVLeIIDU6rK35uPcno7zl3Sv9IU0X8+jA8CB9XIBTOS0pdErk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199021)(36756003)(6506007)(66476007)(5660300002)(86362001)(7416002)(316002)(4326008)(6916009)(41300700001)(8936002)(8676002)(66556008)(38100700002)(66946007)(6486002)(107886003)(26005)(6512007)(2906002)(186003)(478600001)(2616005)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GlSUOlftVARjgcYcps5gSt3RT4gRbHDP3MwYZrGIPrweCdKmO46sjW/U2T/H?=
 =?us-ascii?Q?2oMCkMp5bffxfgAPy2MK9ogP5nRXfbKZP7/vdytslF2VPGMJZsPyX6rDcQhl?=
 =?us-ascii?Q?/9he5QTOQBIcxLaXV3na2Yssxh3+mcKdeW2xyYDejD6QdIYJIanhERpJ2TaS?=
 =?us-ascii?Q?v6udaa+SB2GhG607L0SShK/GLCjAS8XsqywcwIj9DW5891jxfZibOH5baAbv?=
 =?us-ascii?Q?6KbWCumurPoXB1upy3A8zC2iOxzO/aWIuZ4d1qZtb94+HNould1EaVYTYALa?=
 =?us-ascii?Q?vC+mIgcQRUlmRbu/2ElxbViNHRs3kjJIInEE+BdY/p1eHvDS/GdHq7lGbiKG?=
 =?us-ascii?Q?g/4cTRa9+EY5dw4ijAnfDmJ58/T2w1bH9d9Gnjx16/BO09u9Jd2axhK8kw27?=
 =?us-ascii?Q?9G2lIkU0BV4psvYpbWszZN/vyMIJqL9AiNFEI7En0AEI/3ux1m8zQVBhAQ43?=
 =?us-ascii?Q?onHvfsUTe2Lf4i4xAIE1o04zIKQwCjGCZKBoT5q76jtG2ngyrLXQ1kVMatYk?=
 =?us-ascii?Q?gkWwAiRssqmqTd0Z1rI1TN+ETaN90H1z/RNiOPdqf7wXGi0MvpmQHOTF39Yi?=
 =?us-ascii?Q?iVsbeE50IagZXfO4Xmp6i1m2VGDGRK2XR1imaUtDD2+AMFUzMZGCUj5N3L+i?=
 =?us-ascii?Q?z7/Xyi+lc+dDpn21EOcosdMxHdq9OmG0PR/h+kVNslf5xdqXJNN6nuWUhvA4?=
 =?us-ascii?Q?Bi14IDYUNLvODvFbkV9O3HnDim1ME5qCU0KRR0uKyPjWXA3pnHAXzggeRDyc?=
 =?us-ascii?Q?wqU9Sddxy/Mm96OpH7z0+YVyBgYDX9x6q5S1lFk2TLDkVxDTrltLpWZGeyx+?=
 =?us-ascii?Q?OaTNA+PWlGTsXVLa167LNdGZGhL+2pY422I3kfDCMCmFfEb10gV6fGN03dnV?=
 =?us-ascii?Q?BgAheZ89hKTOIMvBoTCBj+EQsyj2lRCQ32ClokOgGedfwKKLTPTDKQ3a3HQB?=
 =?us-ascii?Q?qq6Itl68JssTHp64A4tmfVU4vOThX2hfMyh3xGVGgQIKD3NbUtbMU8N6H2UX?=
 =?us-ascii?Q?hGCrjv8dNR3hIFaD2A3+gWxXfg+v3WoUs0Q/x/iPvB9TBdV2rrUmanGlg6dH?=
 =?us-ascii?Q?bPDTW++2NBSyn7ZAfQUjxaKkRH0sjqSPOKk6emZe4O5KX+c59twEYchhyQHh?=
 =?us-ascii?Q?boutNej+0s1deS6G/4EjYbs69lVSFQb+PjJMccZhuQtK1/PFCeKyTViKEg6t?=
 =?us-ascii?Q?/4kUmQIxz51dTaUlaNmIUP8DNuc187pxuCDU7mlnRbj6YKUm+ZK5oQfELAPI?=
 =?us-ascii?Q?91yzpQe/Hy8Siav7K0gBooBIDak/MpCmJhULma6fxdnIfUANpxZn6FIbtdLm?=
 =?us-ascii?Q?yKCPK9F3XsLwl04VPlrowfFd1prRDnmo40yInx1Wu5MvNrXmZfg8m0VT9wuK?=
 =?us-ascii?Q?ZN02MTKh93WTSy3mm1LIIU2T9RAdtGWU7kX2MwFuPYlX9z1byg12gOHHcyIz?=
 =?us-ascii?Q?D49u3+cgfJ4t9nqkIMiLdQm5+5TyTV79nQbAT3fwx6OdmFMn3YPyMvykvejJ?=
 =?us-ascii?Q?uVdBh2MkzsPfuWObkL5BFv8ea5prAStjd0yKv+o+hPht6cudtSOc7ml+5QaS?=
 =?us-ascii?Q?faBTrDyGQog+MCKZQHlpMs7y7wdPbsX8AedbDAgK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9c51e2-68a4-430b-3a23-08db772686e7
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 15:52:36.0629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cq24ozC3+BFZpufeJJ2IhVDjYNbKpkppRtc9n6p0OA7X4XS0YCopOFgjcj7Gq+iG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5922
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

On Mon, Jun 26, 2023 at 03:04:21PM -0400, Peter Xu wrote:
> On Mon, Jun 26, 2023 at 03:18:48PM -0300, Jason Gunthorpe wrote:
> > On Mon, Jun 26, 2023 at 08:14:27PM +0200, David Hildenbrand wrote:
> > 
> > > So we might have to implement the same page migration as gup does on
> > > FOLL_LONGTERM here ... maybe there are more such cases/drivers that actually
> > > require that handling when simply taking pages out of the memfd, believing
> > > they can hold on to them forever.
> > 
> > In general I would like to see an interface to FOLL_LONGTERM pin pages
> > from a memfd. I would quite happily use that in iommufd as well.
> > 
> > It solves some problems we have there with fork/exec/etc if the pages
> > are not linked to a mm_struct.
> 
> Afaiu any fd based approach should mean it'll never work with private
> memories, while mm-based should be able to work on any kind.  

Is there a significant use case to open a memfd and then use
MAP_PRIVATE? Why would anyone want to do that instead of just using
normal mmap anonymous memory?

Jason 
