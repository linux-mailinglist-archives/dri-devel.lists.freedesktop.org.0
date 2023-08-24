Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CA07877D7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 20:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8AA10E155;
	Thu, 24 Aug 2023 18:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C7010E155
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 18:31:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyuzRqFe+8YvclOCDlJ+xb92LZiZcUiOV4z8E2gApicbz3t0JMDZbZVnutJiQnkMDARwK1KdoeuCVYF+VPlEPosq/5NiqLgtoro6WWu1dzqMY3HLzuximVPpavo+Xx2eFpUNsFCGH3QG4RPx16RGA0vDIgK09Hj3rJ1wDZh91RBWj0qbQGW8S+StlQMkh2LhcldVWklvNmYOMDjjK8+Bg7rOBTeta+RltsnT1hebINyzzbU8c9/GxWnoHxCSA8d2ODrntmnrhxdEPJs5BerhZJSN4cmgJp3pwRkQZBunuIU16sjCcbDvCWMy/YJTCKyqyu0qR8pKNm5T9ZfpJ0Xpjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Karqw3OT5iCVSPA0Maso1WaQlUv00UI4mrCGmdLx0xk=;
 b=iusE+AWejRbFEP/yc5qdAk0JbjPwxk8zUoxQD78rzNSQWMwc0pW1WbQ7740LAD3weY90rea5HdFbLWh9C+47eHLYcWet+oVAYzFf9IFEVsLdLRkOvRgU3FtJ6D2RUKnBWJ3aOOUAcPJpGpRhqEpIFOpxHrXF45vBy+qxnXuinWzNQH957jt5y/Vc3eKpMU8NfvjevptCwFqMPgdrRluJI5cAZUbI4jijxErQIeBV32C1QC3yijgOF46uQxBCXBptWC5quKSWkQxwLs5S9YQaHfra6haVWLCYtaOBo1obqB/SgFsjTiRDuYiP6pnJgf0c8q5TIaJ2rFLwi4jQKPuvPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Karqw3OT5iCVSPA0Maso1WaQlUv00UI4mrCGmdLx0xk=;
 b=H+fyspzw0tu6hqWu8dbVWqAiXfK0S3km7Fr6pUtHnZaY7dqARYeQ3rbpkuBFlZgLclmySgM1s1B+lTpicZk000OXodt4Z4neVG70FkwH1hJZShEIy4meR8E9a3atPutdjJoDjFCenyKmlMvsJNXjZdmY3ale34cbuXRZBPvmPt9llgQwMbyxBkROrP09e+5bCne86ztJcKLx/8mak4QLu8fKRnVWGDcmMXZUdkw7bfqW9o+FdCyna3HHVd1YLG1SyZTskxhuQzZWAMReO/9i/ZrTlUCR42tP0HhT4S/ddbkXbWMmtpAuFaMweDq7LQri1VV/Y1vVgX3LDY0KF4ZOuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CO6PR12MB5426.namprd12.prod.outlook.com (2603:10b6:5:35d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 18:31:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 18:31:01 +0000
Date: Thu, 24 Aug 2023 15:30:59 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
Message-ID: <ZOeh4x58eGel7WwI@nvidia.com>
References: <20230817064934.3424431-1-vivek.kasireddy@intel.com>
 <ZN42XjuXUyma5uE+@nvidia.com>
 <IA0PR11MB7185ABFBB06771B7646F8F50F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZOSo2cuw1ashK3+Z@nvidia.com>
 <8afa35bb-c3ed-c939-46a4-a9a277b6d4e2@redhat.com>
 <IA0PR11MB7185B7B437E98F7F594D3E0EF81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <b35cd8f7-e7dd-e47b-112c-62ee84c92768@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b35cd8f7-e7dd-e47b-112c-62ee84c92768@redhat.com>
X-ClientProxiedBy: YT4PR01CA0089.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::14) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CO6PR12MB5426:EE_
X-MS-Office365-Filtering-Correlation-Id: fb8d5b2e-95ba-4cda-3920-08dba4d0447d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oxUjOIaemz7lsWpX1y32GHdj5N+Q1yo0SA6x7iyN0IqRKzKUaQAu2pFEj3gS+sIgEKgKE6FRowBY1rT2G1zBgvsZj5v9V/fStLzNd/vxOTA796Un9SMod5qC6ITIxGUJjf058chVpsn7gm8MTDs5fx4N0ZZK81XNc3OlxNxShPnKcbn8+HSDBJ8o5BsCI4BqW6JKdA+FhC7vl3rYmoAW32ORuTKmG7drei53XNVrNyHWC60tc1PyJF7o0FYyP2f/yWQEJa0DqLmEciyZ2IOTXLi0oNfg5ezCsiLJm+tX74k3LdsIDYU5YwsAmjnAmjqidX4VOZX254IdRpwQOw1FzH6OsQgxpa3KBVI8mEeXznne3N/frEoRONStB6s0Sq9ZrQZialVbzPcaZiwzN9j7maxEh/X2GVbtY5QtJbDePOMvXymLK7hpE1pSGvJn8qXVjaXEQAW/vBR/D8A4jhPypdFInhZGkFm5WDP97SFo5MqI13VdsTfuXVXr6Gdeve7UWba0klSBDSeVJ18oASvmeIir0Mk41FUIZSURSeiSnD6I4pz6GKwvoOTB9rxT9SF6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(366004)(376002)(39860400002)(1800799009)(451199024)(186009)(7416002)(83380400001)(6512007)(26005)(478600001)(2616005)(5660300002)(2906002)(8936002)(4326008)(8676002)(38100700002)(6916009)(66476007)(66556008)(66946007)(86362001)(41300700001)(54906003)(6506007)(53546011)(6486002)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZpgkmHKUMVkjvm7uTkR8IiJFrvMUeyARuZntDgJLKVCG/ngoo21nAM+iPd4i?=
 =?us-ascii?Q?9Cqys3rCgaaEL+vWIItKWx/lMmA2hxQ7q5haCi8OUm9KSpXl0M0ZWHoblC7U?=
 =?us-ascii?Q?s52tl4o9uAqHHYqC/Z8sa6qqRMixArsSJe07zO+YO4RI3//UMpPdhrQbKzyi?=
 =?us-ascii?Q?+FWa1GVR2XM6FhJLPwWEdRmGrn9kdU9nLeS9+XcWG3avluih5BgNrw0Cg55I?=
 =?us-ascii?Q?Q/gLmvD483BuYHQzV1qesn8p2IYGCu2ttonvWO0YnKIjuxaDsGez7k94hoJd?=
 =?us-ascii?Q?0ocpNrJhMpoztc3DLUNN27m1ClW86yPjQIq+57M9hBkPpKexPYaTOfNPaLdZ?=
 =?us-ascii?Q?N9QAMSR26g8ozydPj65IKujdI602ZF3OoHoreD20QKwgLeJv6WBcdGapMzQU?=
 =?us-ascii?Q?FbhdsOxNfLTEFveP6HAAw/FctVwzEbFVqqPvtjjnmmeUMCs3WWyXIvDKrlWr?=
 =?us-ascii?Q?dyCMogVGmxAczz5Kv8jxinW952H4w0l2gHPLYSf0irE8EcR/Trs6Oe04dYL5?=
 =?us-ascii?Q?ZfTn9e076TAl1ibS3otjc2ImKNIEd6h7WnMUmBioSPgMVFLcRy1s5R9DZD1c?=
 =?us-ascii?Q?t84Dhm3Dj/3c/Fdd6JpaivKr16acRsK/R2JuL63IdgmQtvoSNowvsetRh4fk?=
 =?us-ascii?Q?sXB47oRGTV57fQvxMugKGvc50/X15MYPpkz9ru/rDPAxrqu7L17knwJCuoxF?=
 =?us-ascii?Q?xuo2uWCkS0KTQpcV/ukAX4FufC8qdYMzM1rt6+K5lJxXPEL8T3Tp5GyjGjw1?=
 =?us-ascii?Q?OmpFGs5EG0mnCsk33bFwpwcLxW4Kj23Atj3hOVmql1x2VK4VkkjOXn5FbaoV?=
 =?us-ascii?Q?dBVM7fZanIQ7nsfEk5xbR/dw4joxZlMR430TrIdE5yd3VR0gr3J3sRklQn7/?=
 =?us-ascii?Q?R+Vv1bSSDzpISvUrAbRPkEm8vo+S2ofn8mIky0R14vJPMtq5p1GzJ301CXHg?=
 =?us-ascii?Q?NJtn+cjboiFM0+uYW4n5zBUjlAam2yFn6XIDGIxemcKMKFZ7OtWzMedSrTwg?=
 =?us-ascii?Q?zPo3848va/76dWJz/+m5mYerHfrZzr2sC6EWJWXVgF+/Dvp8si+3Q8s9ofr4?=
 =?us-ascii?Q?71kzG80KPz8yepoyLzh+QXw5L005jeI2iSr2qt6ovWeW9VZ2/lLbo6IYCK7f?=
 =?us-ascii?Q?lwScFGIUFPU86S1AFd00Py9eRulxZydHFCM65M2v+MJZt1Jpzroy3zJOe2Lx?=
 =?us-ascii?Q?/pTP7KOrzSBwoSW7kBTyQoawHxVvz5X03Cd/M8nP5yKrDKbp4AdGOgb30rQn?=
 =?us-ascii?Q?nMwXDZLLwoND6/VJkSO6RhBSoUko2ZMUos7Vk4ZVuoZc10wuyH/1789WKMyY?=
 =?us-ascii?Q?pqEsIf110KUmjDiNTR2isFTD7FqN3uH6D/znDtNQzDqu3kzpXwwCmEbiA6WC?=
 =?us-ascii?Q?69R45oEjD4ULE1nr2p7M5u9MdqOX7YuW5YugrJCZZL4y+I/NUrMT6wWST92x?=
 =?us-ascii?Q?dyz+1icK/CL5A3UcH1DDG0v49vTXX0uXNIKwoD85wc3DLy8F8Rf/AzhYfgtU?=
 =?us-ascii?Q?14l+IXpuLUdbJTjj3WiSMLgEYuR0WV1VKWuR9++E1ytf6HdbyvLYqlJ+xaJN?=
 =?us-ascii?Q?EaW+Ao9+1tLDZACleMk0QN+OtiSXOa0F9qgKDLd6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb8d5b2e-95ba-4cda-3920-08dba4d0447d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 18:31:01.3699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W58N0YptnS7SX6VMsBzLDVVEk4yAmnXRyPWvX5+VRfpVeXiAZpEYy2i3Kvy5pq1O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5426
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 "Chang, Junxiao" <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 08:30:17PM +0200, David Hildenbrand wrote:
> On 24.08.23 08:31, Kasireddy, Vivek wrote:
> > Hi David,
> > 
> > > 
> > > > > - Add a new API to the backing store/allocator to longterm-pin the page.
> > > > >     For example, something along the lines of
> > > shmem_pin_mapping_page_longterm()
> > > > >     for shmem as suggested by Daniel. A similar one needs to be added for
> > > > >     hugetlbfs as well.
> > > > 
> > > > This may also be reasonable.
> > > 
> > > Sounds reasonable to keep the old API (that we unfortunately have) working.
> > I agree; I'd like to avoid adding new APIs unless absolutely necessary. Given this,
> > and considering the options I have mentioned earlier, what would be your
> > recommendation for how page migration needs to be done in udmabuf driver?
> 
> I guess using proper APIs for shmem and hugetlb. So, turning roughly what
> you have in patch#1 for now into common code, and only calling into that
> from udmabug.

This is a lot of work for an obscure uapi :\

Jason
