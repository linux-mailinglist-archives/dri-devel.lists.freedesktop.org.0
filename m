Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4657E2B72
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 18:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C9C10E39A;
	Mon,  6 Nov 2023 17:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A8310E39A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 17:48:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAvLlKtLzdOoF60qQVCvXpYP6SpiGbNqjArL3f1BtkMzDlyTVSuaWTojJcIKy/ZkUuWN6uVQoHUvi7EyAgDTkgeNKGT89DQZ2S7M6ak2KySf86Mt5ldHy4x3fBsk5Yc24iTX76qbtYqCIAAoVNUK01CVBCi/Lj+6sKVZvcRdbpHrcwqMx93AZxpDjdELSw7UIjkHJgFIAySQUXA8P1KNEAmpuRKeafjj1d32BjG6Xr+ECYTMAuCYxqxkyKhdd78KRI6sImH8faVP3WBo/zNjLOVZ9ENDO/1SN/s0K+xw2BUKi0Lsis2bIpVcTtmqfwDyhFZd3pCoV4H+nUUhQy6Dyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1JwcJtZ1IlQN7oq/ZmG3+HAd8xRsx26kGSj3ESxnwo=;
 b=mH5HdeO/t9CzJbwTE2fRkNBfYERiBhOJHiZCH8+8nl4CQ28kdcbzH+tjV77GjZXuuTN2VeTqtoFz1/XR6XFEl7p3dC0xBAkIqQf3DypTtSopDTg1sCfTkkbYeq9G2jnB5ct0uIpaycsNDG+M0guv7WH/XdNV2oFKAwmIyV2MaAV/iB4IFRs96CTI1uG4bjMNRYzKHE7ira/uN9FNuHpEt0UdlPz13V1eGSgFzvqoTFKWjg7hMkrJF9RVR+u2RLsMZOoBtUE09ykcr7mGJTqQoE5fHeP0ubiOCeZuqmVmZkGc3PY86OyBVtgzlsklFuolHKCzzuDzfpNRJTso5dgnRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1JwcJtZ1IlQN7oq/ZmG3+HAd8xRsx26kGSj3ESxnwo=;
 b=DMg8cls4b4TEj1dNgi2UCiHSmjJ+55mPLzCbFWSgD8ImN9hNqSWGiVUZ+wzlJG3uY5Y/upGDz2zHrrx4gGwVc3qDyj7LqLG5hgWEH1Q738byYINrdGylC/y/a0QFs/iHEJIyPpJO8x3ZpxUEYs+EuLOqQWh21wJuftL2725TWeKPBN/tc1MU6q+0EhKHk4GYmciJMEXNyF/H1T1mgB/5tHyeGurNkXSGFWommpLHDS/C5WwUiBoaZkU2wblS08BfqDZ94d31XNT0KOyv160lnmqxcnTNZOl1FUV82fzxu6DkYx3zZkfqjS3Mar4Lm7Des3g7CmU2RYn2yE6dtv5lWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB9256.namprd12.prod.outlook.com (2603:10b6:510:2fe::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Mon, 6 Nov
 2023 17:48:12 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::b53a:1092:9be2:cfb9]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::b53a:1092:9be2:cfb9%5]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 17:48:12 +0000
Date: Mon, 6 Nov 2023 13:48:10 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v2 1/3] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages (v2)
Message-ID: <20231106174810.GI4488@nvidia.com>
References: <20231106061541.507116-1-vivek.kasireddy@intel.com>
 <20231106061541.507116-2-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106061541.507116-2-vivek.kasireddy@intel.com>
X-ClientProxiedBy: BL1PR13CA0341.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: 895a49e0-aad7-44c9-577e-08dbdef08b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OTXw0wu7lRsR42jgcImJp5GgQICjiQM/6N7IVl1sayNreeE9nhOXA6NA4zr/YV5L4/weCgNKWqyvuUpEK5lIx6+icMYtTPvetY7y/b5sj/40XjIjl+r03JHpvidVdkLHVbfbFTkiGu2KgXH4mOhENEiRWZqeBs69jRT80uVW8/9BBboBX0cJyvGZPzotoxZJ6+53MJupf4r7xuNoKuqVViMvhWDzHftJbk1Wc0VU6/N2ZA4N6I6k6Gw/3+Zp3iNXKPpF33HOPbGA6Clqz9KjYN6ug1wdZh8BSlznlza/6UseG+a7CAcA0RBfAu25QOnbtc9WmtMwgXup3akjCPOiBRYovD9kfVC3QDxrZJQKHdxEPtFwPmnhMwTC19Tw7Nfioq59MWOnK919a6fgTCOp+RjkwKBG8AdJepEIt83PCnVNApsLyf73m/KbROGZ0CbQzSFsddt6XsJrs4Qr8nkmejmiYhhVP55y/1sG5a+sL11osTbX3Zf6TtUlKJxt4vFPZ4TmsiBFOSgPRSflu/7jD+A7BNJHZIoWK7BInjDrQCueZ27QUyVnI229oEqL2ZBg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(396003)(136003)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(8676002)(1076003)(2616005)(6512007)(5660300002)(26005)(6486002)(478600001)(36756003)(66946007)(6916009)(66556008)(54906003)(66476007)(316002)(6506007)(4326008)(2906002)(38100700002)(33656002)(8936002)(41300700001)(86362001)(83380400001)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CvaJFK3MzvJxnf50iCOkZKOfUysSGVzY42R4GFjt68QgAhAi4RXqo/3fwIEm?=
 =?us-ascii?Q?zyvNJ/BOkck00fI+aSzfbEeQfCPzqQ1GWnMES9j04C36vqO1lFJZ+uMomndb?=
 =?us-ascii?Q?qFIYgrDCR4fRd4d9Eds97YNKYR3hCt1ffwfmsp5ZVQN3g/+PNIVGnqYDmLhB?=
 =?us-ascii?Q?crKZhrpUpTMGN0uV3nXRjjC5iwQg18RdOAiqmRPTniQOcEyzY5531EXvDFQX?=
 =?us-ascii?Q?Z7FndQYxWJBu7uPqKUdpl0PLpVw5o4ClQgVHY6fqdSNfbpLHGYvEKy1Py3Pf?=
 =?us-ascii?Q?oXzVB2w+WdhLr+zxCVhdkMZ6GxQEAWh8TMGznRcC/uACl4aHIBPds0nl3d3C?=
 =?us-ascii?Q?2LPMPkan80QIBRZFVDi20asfyyZl65ufhNwWG+6ueCJ4eWrtGzGcI8Uwn5sA?=
 =?us-ascii?Q?Yd045zYp3TcmrAKQZPPpWSgBuNUaEyY5kavuWf8460QaonMu+GnelYLDcRJV?=
 =?us-ascii?Q?wK+/mmU5er3GwCaHGBu9jmkHSXkBPtdVYxDaFYPjGf+4TVsKkjBdGTsKX6KE?=
 =?us-ascii?Q?UOef9rv6Wlfv/5hMQx+l0ocy9+JRfGAJxTvth26x3rw6FfPFsd+0s8Bzp0LG?=
 =?us-ascii?Q?Q8VVvuXfVLoe17eouYjdIo9E2MNEWXfvR17Ia2E6OYWC5H7zGXjwin/XYXmp?=
 =?us-ascii?Q?fkeokK0H/rU22yFoor5Ql0OPxE6u87nLfz1jgTQUdJv6wqipPY38/47J0BNw?=
 =?us-ascii?Q?+Xq5Eq+3SredanC63CdmlUdGLR0pq8P1zGwy/gwFdybbpG0eFmu+Vbp7ya07?=
 =?us-ascii?Q?1Z/L0LWTvSqyMVsHg+F/hQWSRrNZfrhW1ugyMa9EwFqf2/5UEjglCV59qYZh?=
 =?us-ascii?Q?pEsqCjiY1Mtby5ztNjEaGUbPsDcAKrLdH0CzRXqJXIJsdjwDa6uqSKWfZONg?=
 =?us-ascii?Q?bTwJRsF5ndl8sOxFdvCFhyCXFptHQlFTBWUsB2CQjkMlx9Rdmd663ROVmGNw?=
 =?us-ascii?Q?N6iWWQJ8k/MrL5NIJuzT0zQBMj/or/cJ+iDAYRP4TYgs5+Ma/VgsoeNHCwgh?=
 =?us-ascii?Q?dap09uI+5d/U/oqhFY4AlG251Gq/fhdDNvOsGYbMv4Kfu/8JruO2BfE1E7CV?=
 =?us-ascii?Q?D4j5s7hIbyQyoTPr4XYb9nQoBR9HHo72CH7Ta0jtums2drezQkk9bYyD0xma?=
 =?us-ascii?Q?+Dm+86AAgbZXDTWWbu3sZUxeDwdFQv8Bn3BFu78Lz7E5QPwmq4JCxHvnROyz?=
 =?us-ascii?Q?iScJuk/3TYtq7s6VubEJN/ldNty08tftiedDh3DIgfO2RgXmU4PzrSEUCu57?=
 =?us-ascii?Q?bVpvqOUGf1rLXFJ5hiUuVNpZT4GJ3QcLZSqAcsxSVPeSp3RR0B2cKmRIOunL?=
 =?us-ascii?Q?o5h5lrjM6TGNRwKkzLdfgfkc51BwEp5nc07IpgPT0LXLgymfRqUzvWr2CWGd?=
 =?us-ascii?Q?9KGBGM4oTvApYNtNBOXofnlQhnpTGmTX+cUFmX8IhOZVfZDodlkgyXobej1K?=
 =?us-ascii?Q?zEi22UQi0LdpZvNChPe5UtN5JHJRJ0l7kDHX9+9XlTifJa4LYBm5t7XVnwE2?=
 =?us-ascii?Q?8JbxtR9onk9eohKTFEeAlshVjQVso+YNFpx+x0+7I+ikFSAWD6z8trVnBNoJ?=
 =?us-ascii?Q?70Wo4y+CluweSOIj6/FfCJ263MLO8+L9NQCGVlI3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 895a49e0-aad7-44c9-577e-08dbdef08b7b
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 17:48:12.1131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHWAAXrs3NsGqFFRYiHjbvDUvvnlcYQN1I7Pi4UNCdkvUkzb+OvkUGGHuammyA/T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9256
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Peter Xu <peterx@redhat.com>,
 Junxiao Chang <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 05, 2023 at 10:15:39PM -0800, Vivek Kasireddy wrote:
> For drivers that would like to longterm-pin the pages associated
> with a file, the pin_user_pages_fd() API provides an option to
> not only pin the pages via FOLL_PIN but also to check and migrate
> them if they reside in movable zone or CMA block. This API
> currently works with files that belong to either shmem or hugetlbfs.
> Files belonging to other filesystems are rejected for now.
> 
> The pages need to be located first before pinning them via FOLL_PIN.
> If they are found in the page cache, they can be immediately pinned.
> Otherwise, they need to be allocated using the filesystem specific
> APIs and then pinned.
> 
> v2:
> - Drop gup_flags and improve comments and commit message (David)
> - Allocate a page if we cannot find in page cache for the hugetlbfs
>   case as well (David)
> - Don't unpin pages if there is a migration related failure (David)
> - Drop the unnecessary nr_pages <= 0 check (Jason)
> - Have the caller of the API pass in file * instead of fd (Jason)
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Junxiao Chang <junxiao.chang@intel.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  include/linux/mm.h |  2 +
>  mm/gup.c           | 99 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 101 insertions(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
