Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1820176E807
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 14:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576FB10E002;
	Thu,  3 Aug 2023 12:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BA610E002
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 12:15:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyvHFYmf0aalLxgOnQnjsnR/k+zSR9zSVnb/Q5WuSrnceLeSgKEDSA9isvd1ZV0gu5ssYneWm2ngDgov5SWzIKhHPm1PJ1iWX70QKqDCwUK8UXI2ifRTfi4GOL1LY5UjcZc8pLH8vAN43StuQSpA6ZmSHphfeTjGxczcEjo4uNNDmFmG5Cq2TyBrVlmWoS//AD8hdfflPfvrTlj1G6rGJCS2h5gDH+57Q1w5x2wsbH1YM6eHuVph88PWRbYxWUyfUO7RnSsMs+MqV+6WoM837jJjm6MGaXQ1WikVBbr80auiWCBSzfW95SAWrWYTu4NGSpMSgu7aD6wqjVG0ENQP/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xf/CKmM3vBvkrWBoPbLn8IKFF5wZNYLzVcJQATPi+I=;
 b=OsFtloHBEVdNsx33xWnjzjW08qMv7aJRuwwNkoNYY8RJjsZCG1QsHdEnX8206agHYD7b+q84iKRyCMYJgqmUoA1BOTLoMwQUKzzOkuAPX8VAXF/qCmEXO9SN/nJHppPF4L8aJFuf1By5W6w8cTuziMXR0mupb+d1kIFI9rNa8eQZ1t786/FFE15gM+vUt/gbs7yJSnOKxVFEsPxaNLvHd6Na8QiVlGl0LGs1ALm0QQw8CbFlX/yo9DDVg4rkZhwn5aaQhWI4AUkMhod9D1kC9MpGmzFZywUltqil20amA1aKgj44L3kZeq/PE0NCinE3jNoJFIEuRj2cUCwgNu6voA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xf/CKmM3vBvkrWBoPbLn8IKFF5wZNYLzVcJQATPi+I=;
 b=cxTOlMCO/hOzSuIEW7XxE0hqzDy7vAvsBDz2XA5f5vSDs/KXwkZQ9ud6iBQZqUvWRUBYQvpmwSW8m1QpDcUxAe8mDULUZtef59hjlVBVX3wiOg9YsKypKoJgI2go+ucT6/DUH9fs07MoQ4bwMsa2i6q7toB/DxDPVQwhAEa0x513tTq1Y6KehQORMHIGUWOPHW6AYJfI9ey9KErw7XGoLm8pCss9/f2aABdXOZhBsmaRAHOhgb6wGbXnlza8OG9ATvab/kbSjVRYE6oXVz0URSOTiR8gBK0gHc0U6eDH5aNDMNG5XQlmJnpUmV3/aCWxVTgeB5uwT+iRAJKgvoHpFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5253.namprd12.prod.outlook.com (2603:10b6:208:30b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 12:15:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 12:15:01 +0000
Date: Thu, 3 Aug 2023 09:14:59 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZMuaQ4vpv03GTPbF@nvidia.com>
References: <IA0PR11MB71857E9D6C3AD311CF698D13F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMj4Og063T6T/okI@nvidia.com>
 <d4bae5e4-ff92-bee9-d585-9f30e34ef646@redhat.com>
 <ZMj5MvQGk2PQiJn+@nvidia.com>
 <48f22686-2c1b-fd9d-91ba-da6105d410db@redhat.com>
 <ZMj5+7sgkPqHT5Vt@nvidia.com>
 <3427735b-2a73-2df7-ebd9-0d1066a55771@redhat.com>
 <IA0PR11MB7185CF1FDFA5D5EDE3B6AF08F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMlMoRIkPoO0gG3B@nvidia.com>
 <IA0PR11MB7185304345516521FA3005C2F808A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB7185304345516521FA3005C2F808A@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL1PR13CA0105.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5253:EE_
X-MS-Office365-Filtering-Correlation-Id: 074beb46-96c4-4a08-f358-08db941b42ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +H8Oa70uIRcEKJyP8OpVGaxd7wTDh69BM+i3xEVPgaOZDUEvxns2QoxVusk2qqx+6l+0o0jEwe5rwM9gjgEtBuIZNAN+pZGX12usn+JQSzqdImCbUm9mXYNNjjx0bFLF8F+RmNICcZiMZYOUm/uHukhQhZQsYs6A8/awf7k/eH/JOzPbyimUA46zCHoHjrthJiaHykCU4JJAKqpR9ohNLC++x+e+8bT9+cDZCOKG/wWKNcFWTr2YWZDUPntpyu7bGZqtohibK1W3RiC+oxuGpk8/kJZh8GetY97xLSRBLwsqYclCqvnGrlQLJzIoRWKzKxYQ2nS+EPAHoFB1LUE1ERDFz66X/NBJZMVL4qbZtvKpxc0/G4BIHstTzHZ6bs6hL+oZ6FyU5qSHHQsv8goW0tVdWNayLBCL2CTymBZn/2XYQD4ihy1L8ZnpWB3lAuQUu7OKrhrbb9RHZSyWPN+B3CXPGYGb+EQrX4KK08b7IDVSowk52KWex1wEtVpu+WNqVTGKvdqViaHYMuFh9NfocJHFwAIumKzwSKoOH0YBD96mXL37V4Nc2Tw14AuFbmQd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199021)(2616005)(6506007)(83380400001)(26005)(186003)(316002)(2906002)(66946007)(4326008)(66476007)(66556008)(5660300002)(6916009)(7416002)(41300700001)(15650500001)(8676002)(8936002)(6486002)(6512007)(54906003)(478600001)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n+pC3LzSwK6XI9GMWiEXg7UOv1aY+l4/xEsrE0wSjLw2vlk1EGuMJy0HwSoc?=
 =?us-ascii?Q?KNDiKjcLvjE8QWUOerPSvwczpzRtpgeUmHbeoxfJnX3Ds35bVRmd3MLCah89?=
 =?us-ascii?Q?8qhxUbQq9xS/ApRGXVw7wSkgE9wCIWtw5Ove7mk1cWtR8ID42cSfJ6bH6Zhr?=
 =?us-ascii?Q?y82Z+g4ghcIE3GNVzglTOqaGQm6qw36xvlYi4IenHxNv1NquEXeZq084519f?=
 =?us-ascii?Q?L4ohD0awZSBC/WuCzeRABzi9NiTeNQRq6RNCEu2NQnKPkiIm3ukQ+n1U9+v9?=
 =?us-ascii?Q?VHHA4sFfTwUmmbTxx+0c3zAMFNtlcSZpCNbYN5MeKY9V2p68p/I6o/GG6TnB?=
 =?us-ascii?Q?GDUCpklpe2hMQxdfZIUO1Wdu4LCg+Ay8m13EX2RVxy3fUgOcirskhzP5NqhZ?=
 =?us-ascii?Q?8RZ5Ps6iTCgdIowcxVoib53Gr5mifpXOA11Kk+RwPbRms/VLvKRPJMsN6Z01?=
 =?us-ascii?Q?AKItFFH0BwkWKjKxHwVkv+Uwc/7OOihFXgy/yKVTV/D4TBkQ7SwP+PzzjJQ3?=
 =?us-ascii?Q?RuGE8FuKEd5X3RvU6pzT1SJV3PwnnSRHVkGus1lOl2xKw2QlB3oF5rlSGgze?=
 =?us-ascii?Q?NvN2zNH5hV+ADxhOxCO9K4fcYMdrTwV4yBtikciDrIKiCvMr1HdH14ctB+m5?=
 =?us-ascii?Q?IXzdzymykexXYgORjTeDF2EqAibVykCJdB/NdZhZVhXMxdLgFR5mBFrtz+dv?=
 =?us-ascii?Q?7pEy93mHC2ae3P9sEhqVdznZoSJWJgwgtPv+13Hs+8F0T+ah0D63G8cQix/i?=
 =?us-ascii?Q?hhgiL3neU89KCHiaPfkQ3QsU01yaOHrRzV3LXeQJGclf9TEK4GNiDHvIILEB?=
 =?us-ascii?Q?hb6Ttavsbetx/EtiO2yiAgWHjEeBZ2wyp5IT1NpgmhTOFYh9nWHmzouPc/ZP?=
 =?us-ascii?Q?LOhKGvQu8LJnJQ9QQCo0eL28nIhr4SYZd4OdU74q7tU+sT/S3SmVtjrDWAZa?=
 =?us-ascii?Q?iW8NW8VyY2xvlrmL13N5xfoxhYz5ladpyPEqUw8dgRYoSjyyBX6XZPZxZJBm?=
 =?us-ascii?Q?6iAHHqu1KJ9LtdGYer7d23sq3tbxeOVuG8vSNcuAOLMzJXxoE3VqHnUtmboz?=
 =?us-ascii?Q?vIJyq7tLqD9z5zRLsZkjCAP8EkQeiLZ8iHOWa1TMYutVJM0CcGxsC4JJNUcF?=
 =?us-ascii?Q?YG2eeiQkHtKv5pOYoSCqKoGcCvKPdD8nqKbyrLaNr/6FHz+UVoSuhv8AxCCW?=
 =?us-ascii?Q?YaLdTQv0vhHjIpTB+5pkD1x6z//KSCFEfL01y2x6BSimDsTDlBu3pUgJb1Jq?=
 =?us-ascii?Q?R5X2N0p9Y7oNbcT15Nx5psZ0wLMjw5D+OSiVDlIdd5I10f+lrg7kDbp1+71G?=
 =?us-ascii?Q?61YsJZNAc4LXSxpRJDdtQUP4UWq7/RnXyxKNmYkB42AV9NBhk8vadbFLLFrd?=
 =?us-ascii?Q?NNwk0SAhI3VpQocCURNHRPO3Mm5016efTz7/xSConUXMqtykMz5XjK2WYP0p?=
 =?us-ascii?Q?LkVZv7blIbmkpzrC256y/JF3+D64RlYzGCyILXbGvWii2K9GFCpJv+IeKVfy?=
 =?us-ascii?Q?Mm4qK7mhooUDlcUvGgy+HE2M3kBGMk9IvseTNEBuMWPh9KEYMy8vBrKA10JM?=
 =?us-ascii?Q?/xFnK1AE2PnhGbksiP5zvAy1+O4NH0tvuORhJDXS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 074beb46-96c4-4a08-f358-08db941b42ce
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 12:15:01.0607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jF3NYqeIIDK4t8gv8wNG9D2kvufUi7h+bpL28dJr7H46n9BYKsoW7vuRtJfwrMEV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5253
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
 Junxiao" <junxiao.chang@intel.com>, Alistair Popple <apopple@nvidia.com>,
 Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 03, 2023 at 07:35:51AM +0000, Kasireddy, Vivek wrote:
> Hi Jason,
> 
> > > > Right, the "the zero pages are changed into writable pages" in your
> > > > above comment just might not apply, because there won't be any page
> > > > replacement (hopefully :) ).
> > 
> > > If the page replacement does not happen when there are new writes to the
> > > area where the hole previously existed, then would we still get an
> > invalidate
> > > when this happens? Is there any other way to get notified when the zeroed
> > > page is written to if the invalidate does not get triggered?
> > 
> > What David is saying is that memfd does not use the zero page
> > optimization for hole punches. Any access to the memory, including
> > read-only access through hmm_range_fault() will allocate unique
> > pages. Since there is no zero page and no zero-page replacement there
> > is no issue with invalidations.

> It looks like even with hmm_range_fault(), the invalidate does not get
> triggered when the hole is refilled with new pages because of writes.
> This is probably because hmm_range_fault() does not fault in any pages
> that get invalidated later when writes occur.

hmm_range_fault() returns the current content of the VMAs, or it
faults. If it returns pages then it came from one of these two places.

If your VMA is incoherent with what you are doing then you have bigger
problems, or maybe you found a bug.

> The above log messages are seen immediately after the hole is punched. As
> you can see, hmm_range_fault() returns the pfns of old pages and not zero
> pages. And, I see the below messages (with patch #2 in this series applied)
> as the hole is refilled after writes:

I don't know what you are doing, but it is something wrong or you've
found a bug in the memfds.

Jason
