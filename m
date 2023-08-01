Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1280276B49A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 14:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7F710E33F;
	Tue,  1 Aug 2023 12:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2057.outbound.protection.outlook.com [40.107.101.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF45310E33F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 12:19:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntFnS+NffxJ6eBFfNuA1XoEXVmF5FRLfUZm7kENJInvb5S1WkmlEqskuioH1HNFiZs4RpXmmo/RfQVv64xOPsM3GTFwHuy66ZsYzFtpdsHkHYL8zoaFjqw7C7BbukHQh97S+Fwr3q24Y9pCYq7Le59APuWk3pLLQObIght/wZ+gc80DnsYxsbx22AcwQAkz1rBkDMELfXEuQKg1BOp8BDDjAXcFlxN1AcHRG4+Q3bhBda+DuG+u9dtFRlqQUxXSbxlFEkT6Ipf2bJN41rtJ1vFpLHudCAJyaaSE/otg4KVH9l7WfAKl//PO5/6h7Pwy0FOvXAzLu3x7Ey0ltvEdOcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fARPPYcg/95LqNbKnelTDk9/wxn/JOsOJ4/5kBapy5M=;
 b=KF/OupPNyExFpUapA74sH0fHht9h1VSfxERG9pgh6qq5Lsn4FCF+Q/amW0XaNoenRLC+WMFJJjZkXg+ct6yCOx4j+noN50cCSwo5BQtDVJO23L8TCdayI98T45RqogsC+qt7rb66rGqHgWd2RuIB8CrT6H38tIM2wME1XkSD0uNuKWNQh+DRZyBfEOSfu+boxepqwomZNekuNSYoFEx0/CONajMf0OrflU2MnIgNxIHm96hQ+No2Y7FSWrpP/Y6ZgqIqullWKo0fvzsf1RiJPNCdmbWKWeQ4Go8b4lP8Rd83pCn+mGxJFnebKCiWc+Gu7jicfL6NPnXn0kDrJyJPYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fARPPYcg/95LqNbKnelTDk9/wxn/JOsOJ4/5kBapy5M=;
 b=Qwj7TI2U7OOa0Wjsh93Wu0UDleDf2f8pK6eCLAtk7/NazTfv3DzZWSZnZPsGBvABKAqIibCzVZsOPwWNK3vbDcDL+0qnj4dufga76VNXIKbH+lfArbCjZfA65FyHPWQBovriEaH6Q4kO9vn5A4MW3I2QGLQWYGFZ8JAIoOBCP9PGU/TBkv/4LESSb/oNCrinUuCF/tQRxRqPgD1yTNo5Yu2CbyHXr0h6wixSrc/xqOUDUa99jBMeOOVJlnEQQ8Ul/DR26EVHQb9rdjAxiRqqrQNib5AuDNt5TV9dQLOrigbJlPf8TW7Fmb2oOCapsVMYAJUF/vLjg6+ChNpxaV7pog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH2PR12MB4120.namprd12.prod.outlook.com (2603:10b6:610:7b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 12:19:10 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 12:19:10 +0000
Date: Tue, 1 Aug 2023 09:19:06 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZMj4Og063T6T/okI@nvidia.com>
References: <ZL5+CiZ6w4RdAt5u@nvidia.com>
 <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL/B6yvO1bIkFRcF@nvidia.com>
 <CH3PR11MB7177FA18562FCED8A3171007F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMBSWxYnWLlzG3+6@nvidia.com>
 <IA0PR11MB71853E11B6C419DC0D043953F801A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMJbywGYN0QLh3vF@nvidia.com>
 <CH3PR11MB71779C83F8A0EC6C2F3F4B0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMbtsY4O3Ho3B69J@nvidia.com>
 <IA0PR11MB71857E9D6C3AD311CF698D13F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB71857E9D6C3AD311CF698D13F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0135.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH2PR12MB4120:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c03d303-f90c-430c-ac92-08db9289826a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mPCihgnS13tBgxmskPKcfVaGk7pjnlw5jU36UMIEWeHxbvJXhW1nVHL+bQ1vR3S6BQ6at5LEkpgIxBI0OqVJu3QTHlv3/FNWLdZgE6Oi58DW6SeI1lYNBTQWAgijJPG78PLFXNJY/y3UBux4QwwNfkWsJenTG1w0S8SsBBTdOhlXgba/v18zvJM5p9UDn8W/Te76dqgkxusbeIe9g69OY2Hc5HSuWztSxEX1/AqlJTEVLyrybmq/2uRxFlglJrS/80AwzudNw+wCAUE4hpogYhzynYZUL0/2H5zzzbQhNoeCDu3AwKd+7YCc2aAwO8tMpIU5y4dR5j1HvwsCxTmGyyJBD9Di4I7IwcXl2TzpeaGUOMz/s9nfHYgU2yS5oNhn+AUeOfFfKzM+jNdkgex4N3Wori+vYk7u2STRhMrh+Bg9Gt4H71x4TKxfMNlmge7fyPnpEKin/MD2XblohK7CIRPAp3XYTIx+Nwt1883HuOW+x2YkJ4+u4biky+JE5g72qSLC8xf2pnv8VSphtrhp7sM44sc079PQBg9q+opLoOK95oGzihgD9X10228DP+vI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199021)(6512007)(6506007)(2906002)(186003)(26005)(36756003)(38100700002)(41300700001)(5660300002)(316002)(66476007)(6916009)(66946007)(4326008)(66556008)(8676002)(2616005)(6486002)(86362001)(54906003)(83380400001)(478600001)(8936002)(7416002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wrUUG6aKZRbdui1uDMIrRwVkbqPwx6Pc2yY2CxBx98Y1JlFA0nPl/zVOt+1c?=
 =?us-ascii?Q?xwAYTpiSDd3azdm4GCwdC9moOBHQw8XrWUs4iZTC/tqJx7dJB+mSZCctMku6?=
 =?us-ascii?Q?FDDL7dz+xPBQ4M+1OhlRRAgYDigXPGLmtRSgJYsMhGDFfrEKe++s4tlU9J1d?=
 =?us-ascii?Q?Tb5xIC3H4eqAZhytF6FiUQcEEySzYSVwO1eZnzkYlZlFUGLaWTmZwhOEDg04?=
 =?us-ascii?Q?lS+zcKqCIn5OlONjC4DaqYwWjFBEdXIzteee9X9bzopYRqtFKMy/jDCQOjRQ?=
 =?us-ascii?Q?bDYTWy5F/1ces3qlJ11NJvwBtqomH9vJrYw1WkEdWx6bs/5w8rJJu/CpV9GR?=
 =?us-ascii?Q?kGxgAERY5sUnVNqEGXrXaMzIzHrYtXLzQUsPSqPP14q9bPSXLcET/wOUi4Nt?=
 =?us-ascii?Q?LUV29S4ET01+slJUpWRupj+PTay3oJXw7mUQ2LL+GgXQ0OLBkgIuoorcsdIn?=
 =?us-ascii?Q?QpBtAs9ToTzg3c/3Lx+QnTiYHyYRMOkyXI3JgbnpVyBeVA8gKdNRjadSbYEK?=
 =?us-ascii?Q?H7AYImmrLwbkWsH4J5wqX371OsqbUH7+ZWMnFoRVMd2qCufml7s5htkz7pnZ?=
 =?us-ascii?Q?deZzqYuBVuvJOyMVpIZzdlz6ZpOLZyj5NGw8x4IlZX4iqD39LHopUsk3DS8l?=
 =?us-ascii?Q?lTOIR4yME2/O+8gin6ACjRKbMNVBv/MrLL6WKbxajG8Deij3cfbB6ZW6RguP?=
 =?us-ascii?Q?MYvYVtudz6/NU3OvDhO8dhjyJKks6q1EcSDUaxwC+9VTLVk8TRfKJiRF5fdS?=
 =?us-ascii?Q?S60ydOAE5uyGH1YOGuniUdQZWbOHuwfYmF09dxIauVTN4Tf1VWcdpTwjdF8r?=
 =?us-ascii?Q?oO659Do21LgeblUk+2VLBu7KrugT4S38lc9ecJ71RMccURPw/0SYfsa4kGyw?=
 =?us-ascii?Q?bbCvwiKWkiAtsfVHEUrL/CiqrdeiUdrfeJnxgG6XkeVZJj0mm8Ns9DYdOSmG?=
 =?us-ascii?Q?NzQ7A04iwuzNlUW7WlR42FX6kJ7QNZc4SFIDfBBi86Ob4K6e/EQqdSUv32ZM?=
 =?us-ascii?Q?DyjL7C12OHQ0V+6Wdoj5ZJopitOhD3NaKtuy2iAaZTt0icLVsFOUZmkSiKm5?=
 =?us-ascii?Q?qUtF1/al2ijTkB3F2IlyTEiQQQAE9ZcJE64qm4jp13BjDyU1riZJk4da5772?=
 =?us-ascii?Q?ZWfWNVlU7IdkN0BZlhV+hFjNMC3uNOcB0LW0EC4TspwNl/ONMqiNmLRD5kRB?=
 =?us-ascii?Q?5lYRJ5LMIXALVO7Am3yu3O02RaYGN/+FpprJ4oeIc1/yILA95gR0pmP2fi0O?=
 =?us-ascii?Q?QM3zwhOQBLF+Sk6QtsEG2pkFYQPXXwFaGXqcjIefsaGCYWoZb3SVi7inFYmi?=
 =?us-ascii?Q?lzu/5u+PgCFmrrNiA1vJgr/V9piHv7zrlI5YFB/3gt7frzsWvTrUw3t6TbV0?=
 =?us-ascii?Q?eEbgKGrQtyKQenq0Lup2MZeDdoZv8Z4NM13mHPB671Evumc2A/sh05i8T7rQ?=
 =?us-ascii?Q?/UY3LoUovWntxXLLIjPe7xVhFj3Ml7qoQyA0SP/jbZ+H8edT5A6ksjZK5U54?=
 =?us-ascii?Q?ZD4RNH+WW3bFQKN8CBXN8lqKSOaSr1yJJqxzcagb89jVHNhCNm76M8JQiOUY?=
 =?us-ascii?Q?2+M21i1GNjeHHUnOh9TtkoiKRhEhremYOvTkg7dt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c03d303-f90c-430c-ac92-08db9289826a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 12:19:10.0873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FysNZAPoPyqFKnqqiN3oAGFd0MKHpnWY8vQPpwPLNj+yNw9WLUnYjClLpx9GkZu5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4120
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

On Tue, Aug 01, 2023 at 05:32:38AM +0000, Kasireddy, Vivek wrote:

> > You get another invalidate because the memfd removes the zero pages
> > that hmm_range_fault installed in the PTEs before replacing them with
> > actual writable pages. Then you do the move, and another
> > hmm_range_fault, and basically the whole thing over again. Except this
> > time instead of returning zero pages it returns actual writable
> > page.

> Ok, when I tested earlier (by registering an invalidate callback) but without
> hmm_range_fault(), I did not find this additional invalidate getting triggered.
> Let me try with hmm_range_fault() and see if everything works as expected.
> Thank you for your help.

If you do not get an invalidate then there is a pretty serious bug in
the mm that needs fixing.

Anything hmm_range_fault() returns must be invalidated if the
underying CPU mapping changes for any reasons. Since hmm_range_fault()
will populate zero pages when reading from a hole in a memfd, it must
also get an invalidation when the zero pages are changed into writable
pages.

If you do not fault in the zero pages to the PTEs then you may not get
invalidate callbacks.

Jason
