Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD3B73E7C1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 20:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502E910E23D;
	Mon, 26 Jun 2023 18:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2066.outbound.protection.outlook.com [40.107.96.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8503010E244
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 18:18:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/Dudq1iHrWU3tGccKCXHx2RUL/JptBZ83KGQIEOpCiSyDJCENgiDZcR0MOR3UMTN6JQ/RqtDiKJ4WkztI5DP+M0cIcbajLwqlVdTWH4W7GA9nTMYMG47itdbU+jleqaTHSMqeJOfk1Dli4J18MuIHmDMMAfpaB/Bn1MbCeByL9PjW5ujU5wVfUkIyUfjIhgYLDqaPGe/ivhbqfexeDM6yCUTa2tWCF+XELZaEBfIbxAFVBRSbroSLBOWTrVjK/40xf5AHrZYGOY+y9aR2vyCOhGV+VS/XRc8hzbEW9iDn425SADJEMkBccrfPSHf949AGWsZ51aaiw4TXaDD7QV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJVCXA3PjWeb49xwn6zdYLR20Jp36+gkkSXKZVB9Axo=;
 b=WZFcvuVJDEhjXCuW0xvsv2GFzQsWf/ELHNyN3zm9oR29qhMdvZXmOsBBLPaMzg7sJJfBwNq0NAwC2yqhqr3Y76TW+kw+VHMBWNJEiROw551dIXqXLnL7RKixjE0QFFDRjd/yEM1FJaxXBmXQC/sG9RU+qYpI3ER3pZw0GkLhQ9xj3JmZSDO0WqeVcyrbCnniBxFETj+EuR3ZNkUss73CqByBQjApzAnCHhZtHhymeu1ClmdN601dzpfbrPvSRVjbx5r3wBX7KM5Ju6r+4S+w6QXSYHy3WMJhUwrh/S6o8qFBvGr8pVtV8P1QZ1qzxxkK4KB1lDrL9u1n66tpS0KpHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJVCXA3PjWeb49xwn6zdYLR20Jp36+gkkSXKZVB9Axo=;
 b=n7gv9HiqWpFnI0cMCiV7t+q3+wskMJjQDlyVcvZAEi5jrdrOGnraOtmzsza7vKwNALRa4WsRntcYUQAMgkyKlhTDVrE+01qQpYXbISvdUzvj3ViEwEy8bB6QbS/0Yqjmko+KX94JeALV6ssGJQ2nYP537NKDBRICWDnkr+dICGg9fae+7UNn3km2kJFL1fI1ITGvR+NtgNf/TGFU0bac8pFG2ceqesT4n1kYcl2R4jsUFJbHy6eaQuD+Gimc1dmOQn3ZbaqgMNedQh6f0Ol/vqQNzqGHEulYecUKEKHL5/NjLwoqMWkJWBBlH8PdsqUyVcmJIQ+e70EqtuObXrAygQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA1PR12MB7247.namprd12.prod.outlook.com (2603:10b6:806:2bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 18:18:50 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 18:18:49 +0000
Date: Mon, 26 Jun 2023 15:18:48 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
Message-ID: <ZJnWiDhrmL0lnyUv@nvidia.com>
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
 <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
 <IA0PR11MB718510999F2C0E2B70914E2AF823A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJXJ4ULRKVN5JPyv@x1n>
 <IA0PR11MB718571BA49F71282368D8649F826A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJnQYmbjWf5cOeFL@x1n>
 <dcccb5ab-1e0d-ac06-0d19-e07512db2cec@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcccb5ab-1e0d-ac06-0d19-e07512db2cec@redhat.com>
X-ClientProxiedBy: BL6PEPF00016413.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:b) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA1PR12MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7b78b3-98ac-473f-d0e6-08db7671ca23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7pRR8mAykw1iY5C2tARLA0XXpSFCGI+1/J8xVdSWuxM2KcA1dJ1cn+HGP/pISFsNa/UrHUe4ZZrWerCp/LL8eHpF/ygm85jEe3FT8mSEY+p+2SONVVcGymGwvB91N3OZEUNSb91T8sJ/WWG//X77y0ghIAgrQipqBSZgPKq6w0OAnCANnrEhWpZ9kHfr6Wcu/DRRO6dH4zRaVRPJhA2NtGrE7kaRf+Q5QcfHmj6o4HiQrtd6GGLZkKtWURerpZzc+DdihcvFUUVNq+FTTDrM5gh+jrkH0svUjuLrDY/0UDEgTi73ArbxRmnIfvCJoIO6tIdpnXmDIVfcnssoth4xD5Hs5/8kwYSPV6Jgo6M62eNZH4nE1fX4FcAnV8dBlQ7PwQ9ijgRcQwmRTy7XIoCi9W2TK4NAwmxkbF7zw8tXtdoe+i1ubcYCJpTuUdaFOzFsHYfvEgH6VQL0ME9VT5CZLJd1O9/WvETv2uq6fQDWwNtOT8glAIa7Y635YKOGdTIryRPGInRh51UQBdcRUXFA0xN7/sVlWskC1q7np06CYtvxpJLZCVXxV/eb8lhZPXSI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199021)(26005)(36756003)(66946007)(6486002)(107886003)(478600001)(54906003)(2616005)(6512007)(2906002)(4744005)(6506007)(186003)(5660300002)(7416002)(316002)(38100700002)(8936002)(66556008)(8676002)(6916009)(4326008)(41300700001)(66476007)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1a8x1PCJXXmDFQXYPGMX9RmUO3NFxzC4Ljidb8hXvI/WBTtDCVUmIwdMqv7h?=
 =?us-ascii?Q?VrUezkDCvwxEgamsNiEipDVlN/mExHQIwDiABnOnk1+G18NsLxqrraqqhTgg?=
 =?us-ascii?Q?m1sI7v0fgZbTPXNY9Jzo4byeEgscRHsvIDJL8IxicE8Nww7vF2/bt8B8e+EJ?=
 =?us-ascii?Q?W1f83YRRzDavC8tr6h6FdfvU/no0kNCjxXnbDIjWdtKVm2SyQcCxA1BahI8k?=
 =?us-ascii?Q?56IJoN+NV2KejdBHrMStM7v+RK8pjmhC0cndcLpi20gVZX3AudRstOBjkL8M?=
 =?us-ascii?Q?VIFjE+JrT09F3XspJyxUYA09Y4gFIIEPLDlegt5vpbg64nBfbX5u9jSF919C?=
 =?us-ascii?Q?EpHdlDCCAnNw9Uuzzy6lXIfDs9/MCo1GN4XOAVbOxobT780w+AXLJoq/zoBB?=
 =?us-ascii?Q?k6VM2r44OlQkw/iIRxQ493lUxxyarBdyuSVbIosoi6b63x4xS7efW8mBcpN4?=
 =?us-ascii?Q?x9slj8Nrh5Y+p2MwTCs05tx5gXHOUgm3VNVPJ3eDJ3pf8fqBjcrlft2sWEfC?=
 =?us-ascii?Q?bK7LO2CysyTAbntZEspWcY01kKjMoDdU657lXw4G08B3M0+K256QVn7LCxQk?=
 =?us-ascii?Q?rT2boHdQ3c6NY0CtDfZBIHIAwWZNsh4FkXh+eelSxdHOAdCh0kNgdNeRg7S5?=
 =?us-ascii?Q?gcugosfMT2ugzM7jIuCoYU2oaZbBzoPl1d3nb3Awc1UUQsqZ1ZKi+EbdMinv?=
 =?us-ascii?Q?fdbiP1d5jpo9HBtdeQAtoR+M7yG0YzNr5zFHpZ1Ut/DF90hvDHAjBLb7xIyU?=
 =?us-ascii?Q?92iSHjUsMjRxm7wKXNHGbF26Li8DXbAePsXbzVEz3ufBga4+MyTYNPOJE3uK?=
 =?us-ascii?Q?U3dTm8UoB1deUiVbEZLu+OfPmQdxzwJ9odlpMMfV0JZc1xLvLaR2oLMOgsR/?=
 =?us-ascii?Q?h27QzQHS6GeaMHjUeLw8tIbtV2//bEft6rtlxIeOR85pw0daGycYJ8sIF6g4?=
 =?us-ascii?Q?IwS5z+SLmk6cFwWJfO0H8DR4hkXxdH/Ns/c7TeWUyxqm3JTpIHYSfwDPJ163?=
 =?us-ascii?Q?A+e1lnn55a4AsAtlcEEaJ4CihgRle3u+w2h35ZYMCGiSL0Ka33uECa/xgXHZ?=
 =?us-ascii?Q?iPa1AnTCUn6n+VaZDL3/DuREVcM9Vw5BzkC8rK/Zj7NmjZC5I189DW5ynTcC?=
 =?us-ascii?Q?+r0JFkuKfpetci+7jUNBNZkW3NpymsGde3btEMO3msq13L7qQUs3dz+skZWx?=
 =?us-ascii?Q?o5ZvL/pa3agGwZzf7OsYSygC125GfiHQF1Dm+bawxG4M4MAofsPOor2GjLme?=
 =?us-ascii?Q?QaZFcs+P7KqZl4VURIlN6D8RnvHcbMYh6q9rdbLUczXmZx/97g254mVUA+Ky?=
 =?us-ascii?Q?CEl1RqlgoR/HPHCbxiZ2m6SW44mA7EoA4r9deNUhMFisFE9RNcI6ScAJ/TRe?=
 =?us-ascii?Q?97ZQjZS+HX4eYxONzrhkSlkGtD/p8kuZ0F8C4r4eeqH7xdOKs3iOPytyxjHi?=
 =?us-ascii?Q?4r8HMmZgwcD9XmSoaUZ/djHkaG4Ss8eok8pOOwloTyJ9mbvrGe2Iv8oe+FPQ?=
 =?us-ascii?Q?T8XT8/BJlhgw8U1acDGQbN6ftCPPzo7lE6kVMa0P0ENBHXeWGSkCIe4Mhs/F?=
 =?us-ascii?Q?h/x1OXdgDQpJAs4LmC0hlA/XrHw2WKfF/s6gcVLj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7b78b3-98ac-473f-d0e6-08db7671ca23
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 18:18:49.8934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BS5zI5hNVqdOOHPeQZK/Ro67G70JJ/5Zqceol8tlOpLnysj49xsfMF6mX3hnCXrw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7247
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
 "Chang, Junxiao" <junxiao.chang@intel.com>,
 Muchun Song <muchun.song@linux.dev>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 "Hocko, Michal" <mhocko@suse.com>, Gerd Hoffmann <kraxel@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 26, 2023 at 08:14:27PM +0200, David Hildenbrand wrote:

> So we might have to implement the same page migration as gup does on
> FOLL_LONGTERM here ... maybe there are more such cases/drivers that actually
> require that handling when simply taking pages out of the memfd, believing
> they can hold on to them forever.

In general I would like to see an interface to FOLL_LONGTERM pin pages
from a memfd. I would quite happily use that in iommufd as well.

It solves some problems we have there with fork/exec/etc if the pages
are not linked to a mm_struct.

Jason
