Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F797765303
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 13:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3531D10E572;
	Thu, 27 Jul 2023 11:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1391A10E572
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 11:58:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7CqUcgtvQTXgS2sNk7Kn99WS8n/KmrvVlm79rBDGeT5NR25FFmf9lFPGeGQU8Z5Cxl6h4YooypA3LdtHUgSs6v30AL60sivOCJCQv5yCvvpz+g9kVWUT8YjYrbfcxQcYtdV5QNgJpuJd895EXemyVuXvEY+ByhMzjWD0qa/L5DDk5sHtrgLU3K6fRZA7yL3uGC0ANQ8kHn+xF117wtKvmRpB1pLQIhPRwopSalPyuK4YZtvHJQ6Ma28zDhXbVUqAiNq86giKUpkgSSj30HsI4ysjt+rtX+0UyxDz6bocbinjLKbx2ZPbrh/UyBCZAXjSKFXtRFDb6yTJ56fEANNVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uut7uMdmYBjtt1hPuoVQKl5dpMrnn2AWjQ1CpNvDx74=;
 b=CIwTZNBPZBY/0rEGIOUfMaLtMSIHd31za/GMchvhRLbLSGxPwvJB45yq8TOrBpHIxTCmzl80y0CRCwVdNPVczsi+S/TEtg40P1cKgGOViLzDm82m5A1y/v/2HK6oiPly5HE4mQGlFgwgqfuJhoyOimd7XYZBPrPHGd8VaBMEz6Pe3uaInWt2Fv4apVIVzU+cv1gF74OUkR9emvPzldFs7SJH4GvtGSNumE7slK9eI//G0jtOxU+g8/18/8wUsNuyhOfBwL3jCHjAIq3ZKTQ70mb6EkB6yCeW6VmdJVM4jqRoDmAp6ZJTthXjqtdlCYwtCnqzswnCEBybGu9SHBJbiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uut7uMdmYBjtt1hPuoVQKl5dpMrnn2AWjQ1CpNvDx74=;
 b=PbD+o5uC4pOTMOkO5STcYkcMyPy0fevHaffs+5xlQPuuboZGv1Rzl7hXz3fRaFuWNG2CQTgAAd7sHOOnuvwk+PH6kElbQj1CldneHVuuJDk35c8Lnn5P/9UFhXSEG4F0ADowQcyyc0GVj94nxxO+FSxA2apgzZVbs47KtSEBlYkMAHQ2BhAqqvs01AnkT5/SX1a3oZuSB5iPF1i5bBjb4x4rb9cJximjpQOYaVJCUchh/CzZfBXqcXwMTlUpxtSzZoZc3SK6SU5O1txGJo2s8DCBoRSZYCzFcX2rV+ML+z/Exn6y3LCy6B3s4W3j9TN9Vk2AfZGpGkH7VdweY80oVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by LV8PR12MB9181.namprd12.prod.outlook.com (2603:10b6:408:18d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 11:58:06 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 11:58:06 +0000
Date: Thu, 27 Jul 2023 08:58:03 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZMJbywGYN0QLh3vF@nvidia.com>
References: <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL5+CiZ6w4RdAt5u@nvidia.com>
 <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL/B6yvO1bIkFRcF@nvidia.com>
 <CH3PR11MB7177FA18562FCED8A3171007F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMBSWxYnWLlzG3+6@nvidia.com>
 <IA0PR11MB71853E11B6C419DC0D043953F801A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB71853E11B6C419DC0D043953F801A@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::43) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV8PR12MB9181:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b4c8d33-bbec-4f6b-7293-08db8e98bd3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qgrh5fFCc7Nx844YlJFzFc98hj2gv4Uwb3zLy0wNSNyGE66aLfPf/LJHmWY0a0bo03bvPe2+BhKiskp6dLItA9w1CP8e8rQo7GJMhFlIZK1GnpLgGgqgOW/PPR+Yq/7GJy9ong7P1S1/qiTzTbg5DvSTS888l7bJ2WthmOhKARy2ocqgun0aw6N2pZguH8trsSWmvGH0gS8HsTLqF8yN8koUJ56l9XFbavE93txe4iHvHNp35dg0VgKUZEPJrTes8yJDdGVjbYxHAlFkR+w+iw1T1fJMRXBPJW3pnQdtS08lXzKsgWzaCffpUbHp8W/efw28hUQsuQoK2q0Qhe6WtHaHtQ8IyvQmmaplcH9ts+0twe1zsRCnwfbEFOX6OEhyd3RCUBPed5FZLh6wYjdrw1yDkrcmqLsUHDhf9F9IkBKlgDLLG5VTR5ligpFI8SM6NS40/YIjSbyzRIsMeHWaryEkR31yvEIxrgCkZSlnyi1ndzOEj5Aqn/zx+AKmWWxh2Vf3ySZLM35bS5mO/SvjtNC1jInNlSDkghrDJbYN55nJ6UtnjJamibCKgVYoB3aE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199021)(54906003)(6512007)(38100700002)(6666004)(6486002)(478600001)(316002)(41300700001)(5660300002)(8676002)(4326008)(6916009)(8936002)(66476007)(66556008)(66946007)(2616005)(186003)(83380400001)(26005)(6506007)(86362001)(2906002)(15650500001)(7416002)(36756003)(66899021);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i6DcuQReTwKCsyKCtg6RD/0pxJCCxrTx+SMUTJqfl4HnMduxd2Ek0UJIaDMH?=
 =?us-ascii?Q?wPakHwmDG8zeSjE0bMIlGFBrMnV5BWnmwr1tY6FfgObLZWsfI2eYcsiPEDse?=
 =?us-ascii?Q?PLsIbet4Dec/LEIw5wR+GF/dgxNfcaIE8+LaCJqSW/S2OecgyA/1rbwMpkSB?=
 =?us-ascii?Q?gEThhNwc+20WusWNeF7QsoNDrvBqG4mxzDTwh3O8YCllaJu+y9Qy218N+eac?=
 =?us-ascii?Q?icGkOF9abNAU/UKj35tqTDQIjX4AdIcPsMlpoSl5seu7VhQjeudjM9ZE2zl0?=
 =?us-ascii?Q?l6HHtrx5g02RxWKRrrc+R2Erqvj9co+jygFfQ4ryUklx0P4AYAX15qJ1qn/h?=
 =?us-ascii?Q?OB3olNja+T5LRVCXEgsqGl9ZtfTg8ZEn8aG6oOcAqXEBcL3j18sTNmuQluLs?=
 =?us-ascii?Q?gxck0pKw/j1rKqpH3HSO5mVGGgocgAv56RxWh/YmoaZhyNbiEPKRUFehhbMw?=
 =?us-ascii?Q?i+9IfGlfOsgUdQt69H+ZQmjPocoMFEt90Q0mi8Tp5PIHkb/6iO9fLcqVXHsV?=
 =?us-ascii?Q?UANwEUgXToqJ55NG5nc87dzEHnKVVQ7A2J+xt07cFuchu3/uLG2JbvUZS5vL?=
 =?us-ascii?Q?JfBn71A+Ocs9gsZD+yYSmkBczGTFbMXYJJzqTjRL+Iv2rN0D+IRa+PNirY5+?=
 =?us-ascii?Q?kvG3Crac5ybvaGaa6DcWwXN+TKC+WXeM+HGqVSWjuUrlAuB135v/SvVMormM?=
 =?us-ascii?Q?IyP/2EIl3ztB+hvWbE12Jep+SKEbiyv3QMp0avrvCi81xwH62zGbXL6fSi+Q?=
 =?us-ascii?Q?g4TCESfq3FBWlgHwqJG4g1Bd9748wSBqNm+mpLpuCYv0daeV95SGBEC8nSB+?=
 =?us-ascii?Q?lK6AZ2tNw5iljYuNRtlTfHQYXrhXunAnlFuJRudt8illnRq1Qg2j5D/nET1s?=
 =?us-ascii?Q?WvzxtUADWU+YPGm0EcL1fVtY8jUAOGRe1DdA5ZOSuvDAxmTqA40YNZ6KDx+Y?=
 =?us-ascii?Q?sTups0ejrrbmn92AvfCiF69dkFvXoJdESiMFtuf7rfriStLP1/VA4sA0KwrA?=
 =?us-ascii?Q?fpJCv9hWA5eOznPcDcsM4dXoCJcJ6PO6lLKpQKhbG+8MEg6w/KWKk+74MgH8?=
 =?us-ascii?Q?jb5r+2iOn5PeFnXJWpcT0rLZoacDqUxAAZnDLXJl1wNNVgUwmuYL44+6/3wI?=
 =?us-ascii?Q?CaB+LDKQdVNZO/iUwwbNAbrzogj/IJKIBynQ1uo17oTS/IKq4LyucPVAZuDT?=
 =?us-ascii?Q?pSB9Yl+6LsTqtzTISI9uvM8MdeVCEFcWQMK+ZlbE8h0Py9xj4Zf4kWnmf+9J?=
 =?us-ascii?Q?W24/LSs9O2Iz8wZrEzrFP1P41dcpT/v1zlDaNHT9y+dIc/cs3MwTPRQuzrtA?=
 =?us-ascii?Q?cFfCz1FaE1E7ZIRtkk4pfA3szTPFXQSHKuyvM7zrjkmRipDJIoUzumqx/YJh?=
 =?us-ascii?Q?LvSGFUilI9zLiKb1bzzpVjlITpTCOKHrFSMoIdKCOYsTBIYYMR4yUYg4322X?=
 =?us-ascii?Q?QsavGcHRh+XNGi3zw3i1/5G/mUCp6OYNMAc978HScvnG0K5IBNY2eEg5hQ8+?=
 =?us-ascii?Q?TR5RMV/Q8rdvMlZCShyse+tddiKhN92rkHWUgyn7loBBzDNZUvKNXkj6uaVj?=
 =?us-ascii?Q?oZbxoxtJtn4/kC7yhasPnDj9Ut2Ktl306vb7Zquh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4c8d33-bbec-4f6b-7293-08db8e98bd3c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 11:58:06.5740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fmmcVGZQUk7vWIWHfodG95ECckc0csTboJhLyTDL8b37Ojjpd0UkPsyugVW1pmU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9181
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 07:34:30AM +0000, Kasireddy, Vivek wrote:
> Hi Jason,
> 
> > 
> > On Tue, Jul 25, 2023 at 10:44:09PM +0000, Kasireddy, Vivek wrote:
> > > > If you still need the memory mapped then you re-call hmm_range_fault
> > > > and re-obtain it. hmm_range_fault will resolve all the races and you
> > > > get new pages.
> > 
> > > IIUC, for my udmabuf use-case, it looks like calling hmm_range_fault
> > > immediately after an invalidate (range notification) would preemptively
> > fault in
> > > new pages before a write. The problem with that is if a read occurs on
> > those
> > > new pages, then the data is incorrect as a write may not have
> > > happened yet.
> > 
> > It cannot be, if you use hmm_range_fault correctly you cannot get
> > corruption no matter what is done to the mmap'd memfd. If there is
> > otherwise it is a hmm_range_fault bug plain and simple.
> > 
> > > Ideally, what I am looking for is for getting new pages at the time of or after
> > > a write; until then, it is ok to use the old pages given my use-case.
> > 
> > It is wrong, if you are synchronizing the vma then you must use the
> > latest copy. If your use case can tolerate it then keep a 'not
> > present' indication for the missing pages until you actually need
> > them, but dmabuf doesn't really provide an API for that.
> > 
> > > I think the difference comes down to whether we (udmabuf driver) want to
> > > grab the new pages after getting notified about a PTE update because
> > > of a fault
> > 
> > Why? You still haven't explained why you want this.
> Ok, let me explain using one of the udmabuf selftests (added in patch #3)
> to describe the problem (sorry, I'd have to use the terms memfd, hole, etc)
> I am trying to solve:
>         size = MEMFD_SIZE * page_size;
>         memfd = create_memfd_with_seals(size, false);
>         addr1 = mmap_fd(memfd, size);
>         write_to_memfd(addr1, size, 'a');
>         buf = create_udmabuf_list(devfd, memfd, size);
>         addr2 = mmap_fd(buf, NUM_PAGES * NUM_ENTRIES * getpagesize());
>         punch_hole(memfd, MEMFD_SIZE / 2);
>    -> At this point, if I were to read addr1, it'd still have "a" in relevant areas
>         because a new write hasn't happened yet. And, since this results in an
>         invalidation (notification) of the associated VMA range, I could register
>         a callback in udmabuf driver and get notified but I am not sure how or
>         why that would be useful.

When you get an invalidation you trigger dmabuf move, which revokes
the importes use of the dmabuf because the underlying memory has
changed. This is exactly the same as a GPU driver migrating memory
to/fro CPU memory.

> 
>         write_to_memfd(addr1, size, 'b');
>    -> Here, the hole gets refilled as a result of the above writes which trigger
>         faults and the PTEs are updated to point to new pages. When this happens,
>         the udmabuf driver needs to be made aware of the new pages that were
>         faulted in because of the new writes. 

You only need this because you are not processing the invalidate.

>         a way to get notified when the hole is written to, the solution I came up
>         with is to either add a new notifier or add calls to change_pte() when the
>         PTEs do get updated. However, considering your suggestion to use
>         hmm_range_fault(), it is not clear to me how it would help while the hole
>         is being written to as the writes occur outside of the
>         udmabuf driver. 

You have the design backwards.

When a dmabuf importer asks for the dmabuf to be present you call
hmm_range_fault() and you get back whatever memory is appropriate. The
importer can then use it.

If the underlying memory changes then you get the invalidation and you
trigger move. The importer stops using the memory and the underlying
pages change.

Later the importer decides it needs the memory again so it again asks
for the dmabuf to be present, which does hmm_range_fault and gets
whatever is appropriate at the time.

Jason
