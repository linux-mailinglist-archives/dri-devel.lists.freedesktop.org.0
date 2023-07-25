Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BC6761874
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 14:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A6210E3D1;
	Tue, 25 Jul 2023 12:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2051.outbound.protection.outlook.com [40.107.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B926C10E110
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 12:37:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WH+Yr9r46ABxtLcwW2GX51Bz1tEJOQAFsEpl1scgxfA4qMi9AK4N0lTw0Gnc1y15gDqsH1SVmYI5uUuPMp3a2vUlHlyaXRX3A1WJ5Wk4urZ5J0TuXVYtsOw+0YPErIfVpfiwT4NM9BEjYhQ99jX5sL39uwjv65yQSZ4nnJA77Cb5YdtTYErXz3itTTH4mZpnT02YwGYYXF2Yt7+LoQZmq5HcClThzHjqp+xtYXJcxKlXtiVyERwBSZshbRx/cMczxRok2TeY0pWq3OJh/BFffsyFE/e4h0Q6tQ5lKQcijNztTiBWgVnhFEEwXZQkJo7vtQumU5xNyiy+tyVI8OeXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FypKwbVjkl2qcC9UTGF5pGp+iU2awiJpkdqg2q+b5OE=;
 b=n2zFhFr/5xjMKmhejUGV0qd9pSf/qaV9C/C2/qP9zKJw9YGq0yHuD/cdvspq/O4lqbAXo0wKqS51Sj7XkVIxHnIFOdhJwhOgyh1Vssok8EjV93jvH2EwATrcAk4XsiasAsdg95j2Z5fcn6+dO/8vU8DoCmvRdlRFYJBe8z29aKlZjkvQ4Pwj8fWPsaTlwn6EJftt9wBTpLxtEqfmCbFKBkoR6KzrbBlYwCY3UP7prbpZ+hZAPDeGtxKeZ64a6oz/cJJ38JmXWY5GZi5R2OjhpEMDC5xcBs+xzUFBgE8NGJfKGOX8eaX7ZmZ1SG7H1BO3Da/CLTTrS3V0aGR3zMPREw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FypKwbVjkl2qcC9UTGF5pGp+iU2awiJpkdqg2q+b5OE=;
 b=Tf08WFIVnHk9KS5fF91ZalKYQ2iAR/OMAa+LecPzJM53V9Q8VvCQ7lC47T0KVF7tHwvzxtJvtHlFe/fA78RXKKrqOwQkTidOYTRBMWgcNfioGD+ZQ86hFk7RGGoXC00/JQ7IKepOWRiRSZqIdz7Mc50uwrQ5eWySjHJPin2nPLJxmPurONAok4TJBMpUl5ZamDAVgZ6JVnFksaESJ6cPW96hZX+0a/5x0h49011wmBROHO3PMPyXf+Vybj9FdoI8FBOvo/486FSEE9mjesVFcyhLd5O6Y1nSvoRYSm8vO9q7QZ20dU1VA7XsIwQKUXYjQLsrCQzFdc04Pjzna7PHIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH8PR12MB6794.namprd12.prod.outlook.com (2603:10b6:510:1c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 12:37:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 12:37:01 +0000
Date: Tue, 25 Jul 2023 09:36:59 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZL/B6yvO1bIkFRcF@nvidia.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL5+CiZ6w4RdAt5u@nvidia.com>
 <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: MN2PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:208:236::11) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH8PR12MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: c5036177-9159-41c1-4a7d-08db8d0bd805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PX5eO0TKF2Q02MG5td/uG44alTo8BczDKXPV6AlhEiKsNe4CVjYSitHXS/+zz9Qm9clXs9OOdY6bXqXSGgptQ2HKZrCcGMCSPpp6NkkcVyylmUxWTLXGtYeZGSgaWPO2GCQr4Qu3XTAb1Ul38eW5zZDIcp13jpvb6P5BaB3Dxx81rvgrs1Cz59+1jWWtUQEBwfDBlW7UQgPdmcruS4b/Kv0G5tVQqDjHNuaj4oPQwoOnYLBvQPxlpeIe2uzsfz3zoD/sNs3clLN3YIt9h0wTt+JTCx5clbwi/Qe/BzYH6znxOGRYzoJLKqeOSdHX+HVm+G4gBgX4pzFeUbFF8B6Fy46kyVoX/yQQG4u6gKsX27dsX2eJqYv6ng/o7pGGr7uqA9WqcD6MerRaaOpXMMvvKY86gIaJnnz7CNzRYeFTW332AsffUnEf2RDtCC5gAmKk235719Mnp49z69dtCeRGH4IlWSkSF18zKQguGkBTFZCeWntKO/OoawXf6am+rPF14bQ5eeuTAnEO8YavHxkwz0LdPZ2hT9jBgC6YvXIi/HansdtsnDV+3ZrmUgMwbzAN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199021)(6512007)(2616005)(26005)(6506007)(186003)(41300700001)(66476007)(316002)(6486002)(36756003)(7416002)(5660300002)(38100700002)(15650500001)(4326008)(66556008)(6916009)(66946007)(2906002)(8936002)(8676002)(83380400001)(86362001)(54906003)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/82R9mLtyRwlzBTvEI7I1flVmALUHIMBYG7dRnq51EipRnffopkVBnXWeYgK?=
 =?us-ascii?Q?fRdKuEAisexPMY5K3ZdrTaC/1cHyAvnfXW45jf/vrjVSRwXSfBynSCxpRld4?=
 =?us-ascii?Q?e/+4yK9jrH5vtmqO+klsTdV+uzkoVxf1WYK8UNN6HmwEbI4hay/Zoly3ByXb?=
 =?us-ascii?Q?XDPg/t0XkKgyeg2qHJvMm1titM0hjnkBPl9e4f20i4FigBj0BmLQ43IYPivi?=
 =?us-ascii?Q?PPU1ANH36X2ESrLg+Pb/kgoLe90WeEnrOWF8ACGHNKsT+1Y+vmjSu4x+9K8T?=
 =?us-ascii?Q?qSK5AnXr2ila8rtU4Drd+V2Fehy/vtpbUi9QcuhrDsppLY3+CtZjeTxlLBG1?=
 =?us-ascii?Q?yQC5PoUEWUDaJwS9LWVZTEJs1PXoLdB6+KNbqQU0WK8C7UwOlEVD82YYdIg6?=
 =?us-ascii?Q?Mg2W4Fe71DAavWJ+gHuOPg3rczb3hQhLaWCoWipj32+7qrkQujXMR8167mS5?=
 =?us-ascii?Q?tKnbsKZRUOdhfeUFL3SPmOJn1iFj4PWkCaOjAkXY37tIVNXxcNQAfzvkoVX9?=
 =?us-ascii?Q?+7JLG9QNRjsFhO4hQpZGj4kMtR0+TsFrNReH5/c/d2iZSWKwxmf9oLG2ckXS?=
 =?us-ascii?Q?xeIeiGQxvYZR2D2lqX+o2SJ6SJU1hUTBSPluZzKzAAjc8VIE6jtUR9E/cKVb?=
 =?us-ascii?Q?PI6EwLcuhoNlCSX5QPHbdd+SI0lYSCX8yDvmsHaqwPvRUULBiiukn8BrtLXf?=
 =?us-ascii?Q?bx6WPC5/MRy8BOEZKGRHG3qtU0C3BCEq4vZlYUHUgJVnt24a7hfK2lvm0kHC?=
 =?us-ascii?Q?FHg784bNIXYirBaiRxQaEGRTkmITmurrlPAQkccOkMuhUVRq0bLqX2UsK2/r?=
 =?us-ascii?Q?T9vqHQOU6VPmFVmFxljJudkLtr7Xq22MXz56AeAh/WJvzcTa/jMfaPRqRNVV?=
 =?us-ascii?Q?bybmY5toD0QiA9Gv4Flj+/TdO0E6w+PYl14HRKhIMfzPFmTDQHEl1IvNsmgO?=
 =?us-ascii?Q?McXs+QAOBc3cnFlcBVTvrhun0/ghkGs5KPYAJt/zXpTHIVFF9L6JMnnWsGVg?=
 =?us-ascii?Q?3nHx/Zpbv3RrB8+Pz5mEgqZvWPdRkecZmyopUsJft4g95JE9osg3tVIhcuEH?=
 =?us-ascii?Q?lO0y0El8oj0R8dk9IgJa0sWHftkFl8UANQNpqhcJw23AGJP7dHQnlhIBZJcv?=
 =?us-ascii?Q?VDgkXpFi70tdudztwKACSUOnh4SgphrMOujAMpLLANokLGr60fTH9aaENr0e?=
 =?us-ascii?Q?Ub7PMvqRkGuvAiZc+BRabzMsg4p5zv/4UsssNnQdvymRML4UM2aKVxDZM2Yy?=
 =?us-ascii?Q?bZg2JuY5Ald/FORE1JO0lD8Sj+S/+3zgFyDGPXc92bm7GtmutRx/FXwArX/A?=
 =?us-ascii?Q?7s96iVaKZsHj+C4Inqq64twm+9GS1KlLduL38hAJ1eY04xt6kPHVXnnGxtPm?=
 =?us-ascii?Q?inIs9A4JRjzaHDg5ZT5mOkH/TbPBML8KY8zW50VXpeN08XdBKhUZRmZAldVg?=
 =?us-ascii?Q?45ukvOWUvIBdjlFbfTGnR9Yo7x8JrLOMjc3/Ie4/LaZAPAGxZkCOAl2DsoqQ?=
 =?us-ascii?Q?uzTMFcw/yNPVsyJhCLB4qmqX39j3owMQ/0At8xVCkAxq2ArPlTPLtKHyfCvO?=
 =?us-ascii?Q?Olr05e9oCWBjOltPQBwuQwdpOrezPIELY5iU/OXQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5036177-9159-41c1-4a7d-08db8d0bd805
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 12:37:01.3909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAyCTJ16dKZiv7wq6bl+nUTT056rnEv5oOZ1lxDu7A6CFKYfw4VxDg1FR9ifrxnc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6794
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

On Mon, Jul 24, 2023 at 08:32:45PM +0000, Kasireddy, Vivek wrote:
> Hi Jason,
> 
> > 
> > On Mon, Jul 24, 2023 at 07:54:38AM +0000, Kasireddy, Vivek wrote:
> > 
> > > > I'm not at all familiar with the udmabuf use case but that sounds
> > > > brittle and effectively makes this notifier udmabuf specific right?
> > > Oh, Qemu uses the udmabuf driver to provide Host Graphics components
> > > (such as Spice, Gstreamer, UI, etc) zero-copy access to Guest created
> > > buffers. In other words, from a core mm standpoint, udmabuf just
> > > collects a bunch of pages (associated with buffers) scattered inside
> > > the memfd (Guest ram backed by shmem or hugetlbfs) and wraps
> > > them in a dmabuf fd. And, since we provide zero-copy access, we
> > > use DMA fences to ensure that the components on the Host and
> > > Guest do not access the buffer simultaneously.
> > 
> > So why do you need to track updates proactively like this?
> As David noted in the earlier series, if Qemu punches a hole in its memfd
> that goes through pages that are registered against a udmabuf fd, then
> udmabuf needs to update its list with new pages when the hole gets
> filled after (guest) writes. Otherwise, we'd run into the coherency 
> problem (between udmabuf and memfd) as demonstrated in the selftest
> (patch #3 in this series).

Holes created in VMA are tracked by invalidation, you haven't
explained why this needs to also see change.

BTW it is very jarring to hear you talk about files when working with
mmu notifiers. MMU notifiers do not track hole punches or memfds, they
track VMAs and PTEs. Punching a hole in a mmapped memfd will
invalidate the convering PTEs.

> > Trigger a move when the backing memory changes and re-acquire it with
> AFAICS, without this patch or adding new change_pte calls, there is no way to
> get notified when a new page is mapped into the backing memory of a memfd
> (backed by shmem or hugetlbfs) which happens after a hole punch followed
> by writes. 

Yes, we have never wanted to do this because is it racy.

If you still need the memory mapped then you re-call hmm_range_fault
and re-obtain it. hmm_range_fault will resolve all the races and you
get new pages.

> We can definitely get notified when a hole is punched via the
> invalidate notifiers though, but as I described earlier this is not very helpful
> for the udmabuf use-case.

I still don't understand why, or what makes udmabuf so special
compared to all the other places tracking VMA changes and using
hmm_range_fault.

Jason
