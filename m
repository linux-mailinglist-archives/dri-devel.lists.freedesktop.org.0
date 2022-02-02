Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 651244A74D5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 16:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140D410E2EE;
	Wed,  2 Feb 2022 15:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F2A10E2F4;
 Wed,  2 Feb 2022 15:42:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LW2+kVh19B3dbfh7lckd8cnCCijYj3WUUFSipPPZsrcM9z/BdXjRC0WG6ag6PSFAPXnFoHWiO8eCrWjg+098biabNq/4bwSwP7BH+odIDdpH3rYp0l9VPuwD+inYCNR3RMCFzFyogsVmy/mPaDWnx2oMcvk68PFfpK8NLvDAUgTJK5ltF/UsgnC1hy2tI7cmwjGA8hVcGBjVDJtS51sG38uVu9el70bTRvGp69ruBkEpu5IDtHF7WxFz+vtkYc1rXEB0qaaO9pwMmDVS3nMg0wJJx+OJtrDIrRYuNOsJhBbphtkzbLZESEsek2nRtARYm4hCif+jLwXsxJG26osT/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84dWaMLqi0sYM3r7jHlhIXKr8PJv4KdwPh7ywKXYAr8=;
 b=al13+AnggNZl+8168U+ePL+Zye5e2RtcGEpfbfjdx/22TBDg4FLq0BoAUfyYeqNGLbwsGp//3ITlumkk4dzHcAF6JQ/PSwmUVU1k4yosox3LlNe0nKP1Ns3T4RCRqxQ3m782ixORal7qXZD6puBDOPmdhligvZea5pwfNywAlZOY6JH3e2kw+Bvvqhld8lsos5vXtFruaW6lsTlUPC4KSaytDBh20WR1bll6Dg3cx5jw2vrx8K2tvYaWLPwwK+0QEBf/pjRxNpvjMJVjV1iruVMlBUTnS1fkcPKkNFqiIOfmA5iHcmKfCDGUlzCrDzZ/O+UFKQuOsg4Fw37h+wGw/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84dWaMLqi0sYM3r7jHlhIXKr8PJv4KdwPh7ywKXYAr8=;
 b=FBsjB0wel/qO9zm0fRbVbfjMx8jmiKCpLY7Az90jmAREft0/qIs6RCRdJnazaDp6kmBScgL78QM4D6bSge6W1yb1XOpg7gr1n5m3a92pEhhihOr2L7/rEKXNBkzdY13Vi/AUvtTG97vPhh+InBYIFdtP+CHGZd2Dizbs6ia1C4EOQ5jsHNZTF35kt0362M/BJVGYlRYHPIdYXv95+tQQZGP+OarR68fZH3m1Sgz8h3tuLHu95ottheBe5Hk0FI+s0uXmz8ZMZ8mImERmROg13ClnZFRbnsJjgTY9tUZHWLgcLrikmS3XuDiNfCLfD7lCuzVwOME9wV+qe9A4+CwQpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MWHPR12MB1696.namprd12.prod.outlook.com (2603:10b6:301:8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 15:42:34 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3%4]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 15:42:34 +0000
Date: Wed, 2 Feb 2022 11:42:32 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v4 00/10] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Message-ID: <20220202154232.GU1786498@nvidia.com>
References: <20220127030949.19396-1-alex.sierra@amd.com>
 <20220127143258.8da663659948ad1e6f0c0ea8@linux-foundation.org>
 <20220202145750.GA25170@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202145750.GA25170@lst.de>
X-ClientProxiedBy: BL1PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:208:2be::21) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5eac08dd-255c-4284-cf40-08d9e662a18d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1696:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1696FC1069AEE966727D8130C2279@MWHPR12MB1696.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S6OdVtNV6mAIBc/ZdOJQ9CA4luomRVpuL6ZnfLkPSoFSFi7XdgoiphsLUqRsfNNrc5eEos2hEMEb6j24pWj5BNCA+DutcGZWYH8WO0Vb3KDdtJ9qvlcbkJa7WKqcB45VnSwbLkM+sVWQQ7ZjCyHko4gvb/xhaSf7iO+UQ/9sdZ6XDsz6etJZxPI4lBF9BSwnUgbM3N/V1qPLvrKQoWYZ4IRO+H2I2FD3JMRaMDWcJuuCPbrrBnylw5fvxgBA8lc8YvzuAf6Dd2CQuwkK+rXpgGer7J8GLxQDTxUvDa90hoEBlYG5pOv2R0xL6uaFuImR6oS95Tp+6TuJ0wmWA9hk/TRIz4eb3Lif25O/kzz1hTaOWSRN1AGaPk5couIs+ogEYFF1hBGqWwxH+S6GvufUFjupF1HxWmJvYWNJ5JjOnKhIgMCvkZ9aoLGcjgm/rnclrnR27OyZ0rHuggJKId6IdZMwHCcMEEzIJWEeRn0UWgKS2QeQ4oIdzMcaSYENwBcAon0b4fRVUn6pbsEp6RWv0Hxs+hdxO7Zp7YWMGEHjqS50MZEjMR9V3MrlxI73mmH9Ehy7IHhc10aOpin66YDKcSZZ/TwCg8s77OAiNzzWiLF29yoOgyGA54Q9/3+gOgnJIdA3BQAgN8kGI9VcDPkYhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(36756003)(83380400001)(38100700002)(6916009)(26005)(186003)(1076003)(316002)(6512007)(6506007)(2906002)(66946007)(66556008)(4326008)(6486002)(5660300002)(33656002)(2616005)(7416002)(86362001)(508600001)(8676002)(8936002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MljZgnSbz9CVZMjFl6sTom3jpOuzhcAXSTSgTD+EbEzrBwU/onXe0F1o5NVD?=
 =?us-ascii?Q?GVUVqFl621IUg74hGYs5LrFh9mWcNDDFyFmm0Uu8Q0/YCk1T4QSjudzFdEOs?=
 =?us-ascii?Q?rALVI/Dd3mNWEyyQU1ZuazRhlXK9gU5+QwAIrx0ytjpbilW+EXKOfONWypqR?=
 =?us-ascii?Q?umoS2+L5OxMqqATD4i2rukhBNhArxwnL106TZ4wlIqjZEUTMO82EqeG6yOdz?=
 =?us-ascii?Q?EvvvRptWgRSWViC/u1LhjPVpaixIo8IPsowSopHAypRM/R/Rdhv8tuxqXOgq?=
 =?us-ascii?Q?UFfrldMAvTUBtP4VbQcYJcm3BZWdVY+N1QSL/UoVl1h3FRC5fjtkMAjjPfob?=
 =?us-ascii?Q?DepWo73R0q9mjrFjH83klN1RaBjoWdQqePhpBFSovklnG/H+MArn4/kyp6tT?=
 =?us-ascii?Q?gmazBREiP3h3eKf904BVBbxmY27eYGRHZy1Lx+v3RVMVgMakJo0NmCcX9pfW?=
 =?us-ascii?Q?E4CibTIxuQ3wOdyJXiHnohfkCSdRtaUjCaGmMx/34DhsjH0IaQHBImoN69ea?=
 =?us-ascii?Q?YNA9o39q7s/a0jAqX3j3EviMw+4e6mn/Kmv4P1wRds6S23Cd5nOXjqi9nFUU?=
 =?us-ascii?Q?zVEyr5t32qLYVt7SiRWefv+4E4mWWcE8gqoitmcZV4W37c+av2kIgFMJkb83?=
 =?us-ascii?Q?g5zXZKyfhVBxaLXCZjkL0nylPG2VbGsaVprNKApW3kE/QuVWiCWwg1bj0VA2?=
 =?us-ascii?Q?Kq5sQJoaauwd8IHOktySAm+1vNrN7MwK7CnSGUeWrODnRoUkD4sR+RDzagse?=
 =?us-ascii?Q?Waoi4CTNEgCgNQmvYYDwLdgOT+I2NiIJsMSfbz/Pi6kxOZOmp4Ue/VqbvMKe?=
 =?us-ascii?Q?69JIdMYndRh0T36ocNNjbqhF3pMvtmkjunHqJ5d1mWnFoDMRVi0bBW0NEwzp?=
 =?us-ascii?Q?i2otHx4jEsDHiyXu1em+17v1jq48Us9qKDP9Mzz96XICm0ZS2EitIn0FEnA+?=
 =?us-ascii?Q?pDLyDZLN9FihiZFqzMDjsLIEjU6UVqu1w88+FSMy1kDMW4Hd+cMt5ZURf+bh?=
 =?us-ascii?Q?zkiptZ4i5ffHX4r/M2fZoxGBxZi4jNBxk61y+hhlNXKvDWuwVv2i0XewCZMR?=
 =?us-ascii?Q?nXjDJHD223HvamZw+XfjhjSfNEs5oRJE32owu717m6HSe68iNS0HN0mavRD/?=
 =?us-ascii?Q?/3kMZUYKb0MnwiIS/q7xbeJRJ61FQeHqj3HDLekkD5dFM1vgY1UbGIkYkwat?=
 =?us-ascii?Q?TfE7/1rwprcDWSqE5CEyTJNS44JcROgdRh0q3+VmIyqexXqNb3UEBIbW0HD4?=
 =?us-ascii?Q?X0cS74l2xG0AQ0yCnbtLBE25FvyWmJyY644gxcv04eNZwU1hlYbW5j6cbPn4?=
 =?us-ascii?Q?DfIAWSKHH7/P9MIM/HWgql8UHBF3f9oldmct8A4W3XNBCTAUX29VV4r+gHj+?=
 =?us-ascii?Q?eWb0MTqajNT8+Fs+kbzYMLVvcsFduPbRXSbm0WzcrJga7TuGirMPNpE2LK7k?=
 =?us-ascii?Q?9TVZn9CVy4jFXVvMj7D+Lmxmb1VRR4GhGwlClvXCAd8KcBxnvJlvKZvVPtcz?=
 =?us-ascii?Q?vZFgKT4Pzc8RgllmKj7NpvFZXRqHCmAMOWkkqbpSx0BQQYNTg0arBflbUo/E?=
 =?us-ascii?Q?p8AqFVefrRUJ2oiHVng=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eac08dd-255c-4284-cf40-08d9e662a18d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 15:42:34.2650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61Tsx9IQ4xXRZnK+dqbFW5xS98Lz02L8rtzxtpy3ioSKafm7h4W0teCJz8Y9Txpu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1696
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, Felix.Kuehling@amd.com, apopple@nvidia.com,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 02, 2022 at 03:57:50PM +0100, Christoph Hellwig wrote:
> On Thu, Jan 27, 2022 at 02:32:58PM -0800, Andrew Morton wrote:
> > On Wed, 26 Jan 2022 21:09:39 -0600 Alex Sierra <alex.sierra@amd.com> wrote:
> > 
> > > This patch series introduces MEMORY_DEVICE_COHERENT, a type of memory
> > > owned by a device that can be mapped into CPU page tables like
> > > MEMORY_DEVICE_GENERIC and can also be migrated like
> > > MEMORY_DEVICE_PRIVATE.
> > 
> > Some more reviewer input appears to be desirable here.
> > 
> > I was going to tentatively add it to -mm and -next, but problems. 
> > 5.17-rc1's mm/migrate.c:migrate_vma_check_page() is rather different
> > from the tree you patched.  Please redo, refresh and resend?
> 
> I really hate adding more types with the weird one off page refcount.
> We need to clean that mess up first.

Is there anyone who could give an outline of what is needed to make
fsdax use compound pages/folios for its PMD stuff?

I already suggested removing that as a way forward, and was shot down,
but nobody is standing up to maintain this code and fix it :(

We got devdax and the DRM stuff fixed now, so FSDAX is the next
blocker on this work.

The people who want this to advance have no idea about FSs or what to
do, unfortunately.

Jason
