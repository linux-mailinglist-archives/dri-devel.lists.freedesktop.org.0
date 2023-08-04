Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F5C770086
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 14:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B08610E6F1;
	Fri,  4 Aug 2023 12:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2088.outbound.protection.outlook.com [40.107.96.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D251610E6F0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 12:49:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJ3oJm/rGjlzfwwf0Fq0/USH5076WgiS0ROvhYeLQd117vmGu+VCgnA9mgw0ThS3Bh40wJm3CmC4ClQYpI51ToW8z7fl64FgpL3XFrXaRcUHh6fb1PktSG0TfLs4rpDP9hIuJzsDtC5Ot3cb8/Y0l9rTJ1k5anztd61JOKI3rJZGNCItOfKCNC07onSzSRGaitoIJT0wfFuec5Rz1FgYgZSbuY+ZdSAsUEO75OE4VaIzFvwQCdUdz+2mAhFGCH1i9HBNOWWAZnZGXKyTyQ1PrkndOTxqQGs53x86FqxRBTIL+ylMoSzmbfdk3w8AYSm/L/rN+hM9cCsOmCjFut3jBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4jQwjNrlVgbYyMmMV+hiOCOKiYKRY1pCiASrw2DJOM=;
 b=OD66iDlTXtQ6oyzg0bxNM5JZQpkRFaHIGRaxLq2Qb0FrYiGNTjsESFbx+Jggo5XtKD71LPILVEWkri/5TmRRWlSG+iXPiIj+Z2rtkA/uXHSzSKBJPptr7Mvn28N29TH3m0pvnDDtrZlL/2ESilSfXV34YVIk+PLAB5XQqIOPwXmt7xE6DMal9NnGllsMZfqqBOcfKqMP00ib+mtCl7IbD131ExHDgpYBiaNqIcFBCdDgZaqcbvpwETYPDoOd+s6Kfi5LCRkGXGrdgsBhHWzPoMP6HvI9GQz/h9Mii5VEiHriIsNJUw7XqSAbDcnw3yjWt44+OO9RDOjiON+BFsW5sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4jQwjNrlVgbYyMmMV+hiOCOKiYKRY1pCiASrw2DJOM=;
 b=Marm16MNMUOnQfz3UYj1XEYYnk7fyWY0wMFqrIpO76LA4LOccdozgM9OimfYi0tGivbkDbLLBibt36EwGgAoCol6odISeRMDkym5ktTWVrA2XljIYN8fsXmH6yVBlbm0MHuB8YWyiFzUrR0rgpY7uJyJlDjWg7em+PRuEnaZfQr4d9QWwG8IsHqeL9w0RcMYBBNhleZb4fJFyqu6/laY0KTC+Vz2v/W8IBpblJ0jPolq74S1aDtmaQN6J2nW6ZQbAJ0V8qnREKgXNzLZ8tw9mwBbGcq3M9v0r9pjdWdWvaprs62eONqo0Hw24JlwzL4ZzzEzSvbapMJUI5L9FvrpNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ0PR12MB5437.namprd12.prod.outlook.com (2603:10b6:a03:302::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 12:49:29 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 12:49:29 +0000
Date: Fri, 4 Aug 2023 09:49:28 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZMzz2OKbmiD6SKPE@nvidia.com>
References: <48f22686-2c1b-fd9d-91ba-da6105d410db@redhat.com>
 <ZMj5+7sgkPqHT5Vt@nvidia.com>
 <3427735b-2a73-2df7-ebd9-0d1066a55771@redhat.com>
 <IA0PR11MB7185CF1FDFA5D5EDE3B6AF08F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMlMoRIkPoO0gG3B@nvidia.com>
 <IA0PR11MB7185304345516521FA3005C2F808A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMuaQ4vpv03GTPbF@nvidia.com>
 <2aee6681-f756-9ace-74d8-2f1e1e7b3ae6@redhat.com>
 <87cz0364kx.fsf@nvdebian.thelocal>
 <IA0PR11MB7185974FA204015EA3B74066F809A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB7185974FA204015EA3B74066F809A@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: MN2PR05CA0066.namprd05.prod.outlook.com
 (2603:10b6:208:236::35) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ0PR12MB5437:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b61035-409d-4949-d65f-08db94e93e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nqs+QlZ6kZlYfGa6+fla4GgYuWBRLPt8Rvyl6Nx66t+Nkg9AfmtYLF/j9MwU8BIlGMUkmAbXc0/k6q1C+gW0YXvbIilNf6gSz5bFzTsojwDMGrFhlnq3AI98gUSTek+dFGVDYJ/NRM9kQVWlba03npZDMMeEVNlOYPmSTJCzZx3rMdab8fShIDbkijTA2BfirSG6+YjYCGEoxP80N1juHi3EOYmFwcQ0UnsIuKWgxuXC+E+fkqf/4p79snk4bP1w1vHZWAO7YdD1jbTQ1QP8UrliaVjUlvHHt99dL+i7gEhbusChdY3apYGP4XvzME4zBryK/h88Kpiww4VuoQ2/qkEE5VcupM4ZaQThIHRcf6iSNd9Hh8YOuO+JmLoUca6xQHqyJ7zvAYglV0MXs46y0L+IFTujdAHWCKNty3kPNZdZ8Kt6LjgI8VS2K88nTF8PVkKV9CoMmeRRROVRjCMcas6H5xGjG3dYciPqOHTxAfXvcWfQ5masEmAqTckxeGCflc7OgPyMRCT96N+uGVPRgEXHF/0FW+5XzoRQPY/QbIpFsubN9ZBKz6ye3Jzyqpre
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199021)(1800799003)(186006)(41300700001)(8936002)(8676002)(83380400001)(26005)(6506007)(38100700002)(2616005)(86362001)(316002)(6916009)(478600001)(6486002)(6512007)(54906003)(66556008)(66476007)(4326008)(36756003)(15650500001)(2906002)(5660300002)(66946007)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qX+R6qB7OLru6NXSrvu6MIElACB6DUDuZHfgUQRHXkfOIGu8zxf/bb8PToUo?=
 =?us-ascii?Q?snKwdAuvdu+zUzlJV9ZmQUAg9UUj9m2rCwsrwykOdV8Kk8v9oekxmbJVvsH7?=
 =?us-ascii?Q?e3XTypxPt1Me0v7JTgyd4sR/0Dj3qQS2KAfC3vorxLwrYMvsL/9wBmlGf/kw?=
 =?us-ascii?Q?z+XWTUIJSoQG3FUYYN3PcYFvaanBhYFGladR80aRFz/tMzf+WErOGoKiQ/G/?=
 =?us-ascii?Q?KOTttMm7BXcbCVK/kVoJcg/X6VkpbtVH/QkmxcZtPV5wdg3wBHAPhMigNJUH?=
 =?us-ascii?Q?WTpBTDoFjRQpHSQSCz75hh7wH0pZU/jkHfUd9lBhddFXP0CmgwS+JfO832zR?=
 =?us-ascii?Q?Zz02PGIdk1hRfAO/41UXiJ0R2ej8jlp8/UhV6VFN0S+BycryuKGnD9U7YRNd?=
 =?us-ascii?Q?82KGpIXzZm9zuyPOgQ9kj6vSOL7rSAQ6wucgZPD4mB9qLwYYilfOmegXKQep?=
 =?us-ascii?Q?XnjqBPVIqCiWGxZ6ZBP4iHamXo+/6HA8+nwMbvGBKlFCbUzmEVxfnq1Hfa0k?=
 =?us-ascii?Q?ItamcyGsZmjiqWvcwFwoR8ltTS+IdmsVLi1GnNnVUUWLnvSsewt8dP3ai+Io?=
 =?us-ascii?Q?57W5GuUEyDzW0/iIO3jb6Mvph9iOWGPuUHF17vpggBDhecHQi4nHJYkkmWDX?=
 =?us-ascii?Q?+hJmM0bTpGKnGV3mFEh4J24Bvxq/7yYdOxul4XsoOm42SVMlm/h44W7w/H6+?=
 =?us-ascii?Q?ySSGxZv733XVjl+QoQukGT34gjd0FzXluY7J/27x/QCdrz5EDeV+miRErWAg?=
 =?us-ascii?Q?bjbg01K2VmOYQdpU/u+Fnlk1CGUa6bl+ctfpnugojcfJtMPNvwylrAL59UQS?=
 =?us-ascii?Q?jOiSZ2bQwSvCu4AogqiqylhJDMzz5oh62agBgFCjGEPZsp1y+pQYWioETMry?=
 =?us-ascii?Q?LwX5kH2Dh1Kn7fpYuWjT17cCBKEKDrF74hsgJem7ZAEzOGUAC9RCZjApQOvB?=
 =?us-ascii?Q?85OE/HZEuc6xqz2JS/Nh/u7cIZxrgzIEtz+vWD3GXIIwWBzepH2JREOrVBvy?=
 =?us-ascii?Q?szjQ0ZXNwf/pOxAJqSQPk0tgKR1olN0R3hMHNRcsX3KJUtPHXm4D+D6MhmIk?=
 =?us-ascii?Q?0JIG/kbPZVcvV+UdK65NGog7DoKKL8lKb8vHo13jWYDjw1AAlYuRn5FX8xXH?=
 =?us-ascii?Q?Qn/tj1Z2c2DaIcy4cuzI04LrIcThGse/sqoLdl2W7DpJRRlGlxm5DlG4ABfy?=
 =?us-ascii?Q?20mi6a5SoQ3pJycFG2D7fyosPOa6l/z8mVZgiiNPiBo81UkcHWzzMrW2vlcX?=
 =?us-ascii?Q?9J4HPclKjVQBKhVv9lJOrcNRRqAymnzfiH7JZRZ+vA7DFPrGF7OYXQhVd1o1?=
 =?us-ascii?Q?YD1sJ4nDECI5g3syiSR+t1GFJz8WbHcLIJ9byX+QCFv0fbUU/SrLcRYRL2Yh?=
 =?us-ascii?Q?MCYzWqa8X7BA00fR5PPqWuuA+Rd1Mb76YQpj/5AysvsixKv4xfm2+TslBoXy?=
 =?us-ascii?Q?PefERuSIbhY+h+L1VN9dFWBsF3R62Qg/aWZdzbVOOwi8IaUikeSv8qF3Ea2O?=
 =?us-ascii?Q?6ljD0t2sr0b8Ml6Dz5lbstJdmilc9EtyEthM046jdcYYeRVu7tCY1k6s5dse?=
 =?us-ascii?Q?FNzhp6BkDbs6XmwSfJMk8G0wNfPizo6WRMfTnZ2E?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b61035-409d-4949-d65f-08db94e93e2d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 12:49:29.6988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5cGi2NQuCo7rAffXu79arhguPoZn6LqojISd3D4jBhJNobTZC/J4fRYZ8JFKAVt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5437
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

On Fri, Aug 04, 2023 at 06:39:22AM +0000, Kasireddy, Vivek wrote:

> No, adding HMM_PFN_REQ_WRITE still doesn't help in fixing the issue.
> Although, I do not have THP enabled (or built-in), shmem does not evict
> the pages after hole punch as noted in the comment in shmem_fallocate():

This is the source of all your problems.

Things that are mm-centric are supposed to track the VMAs and changes to
the PTEs. If you do something in userspace and it doesn't cause the
CPU page tables to change then it certainly shouldn't cause any mmu
notifiers or hmm_range_fault changes.

There should still be an invalidation notifier at some point when the
CPU tables do eventually change, whenever that is. Missing that
notification would be a bug.

> If I force it to read-fault or write-fault (by hacking hmm_pte_need_fault()),
> it gets indefinitely stuck in the do while loop in hmm_range_fault().
> AFAIU, unless there is a way to fault-in zero pages (or any scratch pages)
> after hole punch that get invalidated because of writes, I do not see how
> using hmm_range_fault() can help with my use-case. 

hmm_range_fault() is the correct API to use if you are working with
notifiers. Do not hack something together using pin_user_pages.

Jason
