Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9281676B4B6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 14:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6DB10E3F9;
	Tue,  1 Aug 2023 12:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E301110E3F9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 12:26:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgReidS3Ep3Uv2atVrOTOCD8CSIky7SCj5/lZAz2W6Fg7G7HjoJBcYoVGdP5cmKcLEanRKbSfCVk9SnHaHzYpoRVIY7vcsSBN9LwPKehhnNANbdQAqONX6I17u4WVX9fDBMEayQpVoAK+QHft7o0cttiILjJYeV9S3TzEhK5zRvQfcLo7hO8+CbCvKZZpoaWh9cO0xAG08yweX2vTaf5/QavAFMiJh87nlnKDjzQTiZhApdk9HT9mSVr0fvbiD9SZ3JuFCqJqI4cYVBQPv7y9cFjlBerBFcKOG5FxlAg7iDa18RaUuw25Z9TD94B3QSed9lJDUC8MgEEopp4ddXgTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXy6pRlNBYKcfiJoQi6kea9bbZOwQY8uZnwcF5vG/WU=;
 b=FqUDU6lQGe4mxcnIGOXGQACgeNdAPById9es78aqM2/Tw7Ugfsz+mg6wvxmOyCDrkXtp1XEUoySItBKECKg89w9UuVrsK4W3bMljyfKy8EZxSPjnhPw4JfTX12nlfqUee0uI1SWlcIZHhCPx+8UUsXBhbSX2HH3ZORxv10CjGg9IeUCxaUQWlFerbUk+QOJaZwVUpiYW5eHuRR0JbUroo0vp02fsbDPRW8F6YtAr6DpEk5HOYmrEWhxWohjVNHMUFQsjRkN5qDGWrKE8YTEvgh5MsAzRHdErManFuoFctTDx03SDbZDCQhlzQWuc0UTdZUM2mF4yOfC4xojxX3pOhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXy6pRlNBYKcfiJoQi6kea9bbZOwQY8uZnwcF5vG/WU=;
 b=DQsjKmOhOYxzPI2lXgm9gI+TJuE7fDX18sd740K7Sik1mt5PPVdfXgcVXbFj+gtgx7mc8VEKsZmRCHJXp/6+3heB1uSOXDqbrhTZezMImOgkxNCQYJL98G+HG0vswKuhWbMvY6mpgmfs4LqaK1I9hCTqB8Yd8MV7iv///Ys9LGEtWMF0pqLvzj3FnOCnIxLQl6t3TXLpXsDbWHnJl/NPCN70dvqKR2841hETE75sqzR3khv/t3wkEXpjf9zLQQ0rovf4XdgusFUl/cNUujy8NuaBBqrMPwDHFicexh99fSJg7n0rNNOX9HqrnCPBNzy8QtX2Y+6Jr+vQjT8AoMAAsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH2PR12MB4070.namprd12.prod.outlook.com (2603:10b6:610:ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 12:26:38 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 12:26:38 +0000
Date: Tue, 1 Aug 2023 09:26:35 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZMj5+7sgkPqHT5Vt@nvidia.com>
References: <ZMBSWxYnWLlzG3+6@nvidia.com>
 <IA0PR11MB71853E11B6C419DC0D043953F801A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMJbywGYN0QLh3vF@nvidia.com>
 <CH3PR11MB71779C83F8A0EC6C2F3F4B0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMbtsY4O3Ho3B69J@nvidia.com>
 <IA0PR11MB71857E9D6C3AD311CF698D13F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMj4Og063T6T/okI@nvidia.com>
 <d4bae5e4-ff92-bee9-d585-9f30e34ef646@redhat.com>
 <ZMj5MvQGk2PQiJn+@nvidia.com>
 <48f22686-2c1b-fd9d-91ba-da6105d410db@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48f22686-2c1b-fd9d-91ba-da6105d410db@redhat.com>
X-ClientProxiedBy: BY5PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:a03:180::32) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH2PR12MB4070:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ca91b69-42d8-4354-265f-08db928a8d78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zCehd3U1E5qPmZ9EOwXJJdK9A+MYqgAsqthHGz9Q8HD/4uXBUOiNlRfjJ4qbkxJWB4XaEuyuBK4oLiV1/0Dj8vDTlQK8vMw+v94Yp1A17gF5MbFocQLymOEKDQ2qQE96YNw9x58t7sNC5ypAZSrWdSVqbS1OCKwddYmR0pcXkuzSe4VdnNyHDDSwCaxOrwONo8XIWCAMvVHYJyncUYVby6Y38kMMYSgSDjrCJul+iL6BbfnkpC4VBpYRetzuY7pJt+cS7wh3iYdWTBm5avd1XAk4BSRwufFntymswgflgpuzB7UwjUbqCSgq8YiAXumtKEo2UhXkhO76HPNqc6E/JTWhbhJef8ILwgx7XetSp4keJZbp3tMfADlWy25YhA7siFBDfAtaYZotFcjUxyLFDf1S8OFLFVZMXJ+UPA2XB3nC0b/ljpS4uGEj8H1zHVbrT18MROaQqSL9NzvHwlmK3FlRflxf+PiTxuu5zyiRHr3jlCMmnlqHcZT6GM4LpZXwIMynorPCQmS+jvvQ+q9RahJER+0MslL0FoLzaeZo4/KReAlI2uYrN7SZxaax6IXvEBUyfVqjyxkXDnSzglge5FjoDqZhsusGacT7t+/wlxk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199021)(7416002)(38100700002)(6506007)(5660300002)(53546011)(4326008)(6916009)(66946007)(66556008)(66476007)(54906003)(6512007)(478600001)(2906002)(2616005)(8936002)(8676002)(6486002)(41300700001)(36756003)(186003)(316002)(86362001)(6666004)(26005)(83380400001)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gNN0DYvGo3fLgibJPuNumk45V+kSMYK8VvguNvOTfGn5wfH8dhAg8Oz0wpjP?=
 =?us-ascii?Q?CSatFpeXzvY/fIw+c9juq/+YZk1Mj20wezwE0iLn7FIDOMM5jtHm1ZrzKgA4?=
 =?us-ascii?Q?vrYDRXGRvw3cVJsfUYjdkfWpg6k9RJOaMkvsOOqtZP/DANMmD6JQxLFpzItA?=
 =?us-ascii?Q?JY2/xF7TAcK5KG/bEeyL48jtgefNukSQ+0wEQYlVgQnpRbIdN/zRqpvveO84?=
 =?us-ascii?Q?EiLlM/HUj8aSaG6B6ikcNChoStnk81fS3BAUlatXpuvbiWb7U2OoFDw1FQ/5?=
 =?us-ascii?Q?+2xkrBbboCx0UhwdkIvJM85R+2++20dXGjOqpITczWSD73PkP5sxW38CWSNq?=
 =?us-ascii?Q?mhxyZNFRaMkZYvrZEmQe+JN/UfAlQZ5FPkuZc22V50CPxr8ceKLPqHzh/djZ?=
 =?us-ascii?Q?5/uQbo2e46dF26YP8GT+raIEnJKv1yxn7mbxtkybmwE/5NMBjZ9H9ZEUUv9w?=
 =?us-ascii?Q?vgcvIBJHNb/1nUzzW6QEkB6ECs6bsiFUO4BSmsMrQlBXSjArwhzyXSpgS8V0?=
 =?us-ascii?Q?ES8BNPBq+ybZM5Ilm/Pxe/5he964GAuYnMtVMD5mTs4XsdRX+e/+BRwUqq+J?=
 =?us-ascii?Q?jzROBIXpDBaeVOL78f82cQqp5rlMqhwkkh4LxxcQsi/bm6hEb+p38+OePvnl?=
 =?us-ascii?Q?1vSeNPdyA3tDcLIXn04Tfhmouflkoy5oL/hlxKa8Z6/a/cM5Tbud6p6Z80rt?=
 =?us-ascii?Q?N2vsDh2gqVmv4juuz/DtiORjLT4pqd6FzU/jVlByFF16EAveZDbw26Fk3vKd?=
 =?us-ascii?Q?blW1Nf7W4yKxe/YG8sgJMXBPAK8rQ3PBCu/5hxbyHmz/cQN0U3+xs9+Ph17I?=
 =?us-ascii?Q?cZjaz06N7rgltgApcU5h4ibNumazR07DUa2O4AfUuijVkMNgvDrTQhFBW3kn?=
 =?us-ascii?Q?2WOnWcmKZGmntxrkc06aiGZLMzRh7OuOHktODv3tUriiXZGNAqPJqCEqgGwQ?=
 =?us-ascii?Q?2Sl6QZuqC8jNVdAeadzT72Wq+aclihKhmTwPHeiVmusU3X1GkmvczSNjPry5?=
 =?us-ascii?Q?8cK+REz1HkykTV1kIBPMboR4WlDvD+2JGjyDxZf9VzagAZVlldpC90IddLn6?=
 =?us-ascii?Q?I3cQyE0pjjMzHWH75S1mvRvzUh1voxVT+djw9Ye+i2x7l/Qq/eft8JLKLr1R?=
 =?us-ascii?Q?S6MQjdIx8bfu6vVP3ORHB7DmyssQprvrNCQEyhuRm+Rons5fBJiBeIiX14w4?=
 =?us-ascii?Q?DvopyhJ1s1v3uFQwP13d9RVJ0PN9bC0G3QJ9SxhtjegIWFaSyD2S9D1KrfBL?=
 =?us-ascii?Q?wm7DcUGejufQ5GzylfM9esiaKCKIpulxk0heNPp8DfK9eZos5XqKd0QTRGwQ?=
 =?us-ascii?Q?MxTh4L/foYpUjyaS+ytcKqUfxc7ccFOVUVeHkoBaf4WGgCTpuvwX1SEMKwOM?=
 =?us-ascii?Q?UsYfMUbcLk0aBgStNlOlmDYj6/aPlFj+tjiUKzMn8hE6XBTd+Omxp1wNxX94?=
 =?us-ascii?Q?Nmzo3rcfL0tCDBmBpES00icGEJ9xX/BjRmMq2THFPeyjQtH+dCNY+Pgb1kUa?=
 =?us-ascii?Q?NkssozfKI7/Aq3wxUG5kPn8CBQ6urLEN5+Uj3ihtQ/0ZGGFpzQNMXtMHg7w6?=
 =?us-ascii?Q?2201tX1w4fKyZ+f24u5d7XVSRBt7IJhV5bHASvLh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca91b69-42d8-4354-265f-08db928a8d78
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 12:26:38.0985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUQYk1Z0UREOY+KkvgtPefqENgd/4XMOQ7t1GXLsiYWseVO9vtUgEbUcXIN3hUQH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4070
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Alistair Popple <apopple@nvidia.com>,
 Hugh Dickins <hughd@google.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 01, 2023 at 02:26:03PM +0200, David Hildenbrand wrote:
> On 01.08.23 14:23, Jason Gunthorpe wrote:
> > On Tue, Aug 01, 2023 at 02:22:12PM +0200, David Hildenbrand wrote:
> > > On 01.08.23 14:19, Jason Gunthorpe wrote:
> > > > On Tue, Aug 01, 2023 at 05:32:38AM +0000, Kasireddy, Vivek wrote:
> > > > 
> > > > > > You get another invalidate because the memfd removes the zero pages
> > > > > > that hmm_range_fault installed in the PTEs before replacing them with
> > > > > > actual writable pages. Then you do the move, and another
> > > > > > hmm_range_fault, and basically the whole thing over again. Except this
> > > > > > time instead of returning zero pages it returns actual writable
> > > > > > page.
> > > > 
> > > > > Ok, when I tested earlier (by registering an invalidate callback) but without
> > > > > hmm_range_fault(), I did not find this additional invalidate getting triggered.
> > > > > Let me try with hmm_range_fault() and see if everything works as expected.
> > > > > Thank you for your help.
> > > > 
> > > > If you do not get an invalidate then there is a pretty serious bug in
> > > > the mm that needs fixing.
> > > > 
> > > > Anything hmm_range_fault() returns must be invalidated if the
> > > > underying CPU mapping changes for any reasons. Since hmm_range_fault()
> > > > will populate zero pages when reading from a hole in a memfd, it must
> > > > also get an invalidation when the zero pages are changed into writable
> > > > pages.
> > > 
> > > Can you point me at the code that returns that (shared) zero page?
> > 
> > It calls handle_mm_fault() - shouldn't that do it? Same as if the CPU
> > read faulted the page?
> 
> To the best of my knowledge, the shared zeropage is only used in
> MAP_PRIVATE|MAP_AON mappings and in weird DAX mappings.
> 
> If that changed, we have to fix FOLL_PIN|FOLL_LONGTERM for MAP_SHARED VMAs.
> 
> If you read-fault on a memfd hole, you should get a proper "zeroed"
> pagecache page that effectively "filled that hole" -- so there is no file
> hole anymore.

Sounds fine then :)

Jason
