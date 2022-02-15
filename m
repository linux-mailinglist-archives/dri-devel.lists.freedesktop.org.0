Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E35E4B796A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 22:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A399D10E561;
	Tue, 15 Feb 2022 21:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FE010E56A;
 Tue, 15 Feb 2022 21:47:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gk9/hYoZjLLa5YRxGR2+uXQ96Y5aL/NvEbgYf3sCJ+8nZQfksxsx0JgSzioEuDxxRbiIIpHGBscHH7pw4kV9NvVB5lEuKxd1yUs7f0V2jkfc/SU5+v6nL1E5RXrxFAqoBR/hr9J+kupv/bJd/3sAjVtjFHl3ThJl89K4xkEREHii7MY9EvVksW+qApLVrjjigoYHpCfCbmb7+ZcqAxrJSaIvwEHZr+ZU6wqMHe7rhq0PkKdqVkqW/p4ns1N3p0c1wOqYYZDiG/ANy3hzc3w0twmcImlOnO+j3muGV4tHw59D+PXjbnk1MpAuu4u9tYzBuoGUMLpbcas+7iz939qEeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+Ia2MduhHwDl8RlZcxpMeY8sMz2eLMp9xGxf/FSl/E=;
 b=U3V5GL34Np4ZYsCwW1TZ80kM3140SY4YCZ4um4juJMn9Ep40nSJeYfcfExIf1+br5VLOi0T0HSIxlB4FNGrLkiQgGYjXhxgJ0VV/4kH6s6WazZbOTppCYdesoJDRy9XPlm+XjBmUzjmBeMSpsDT/SlCUMjhjFw2bNkEbB+xZrxPZUzjLpuvfj7o1JJ3rjS09Zm8AJ8OmHfWHl03dmV6V7xzg1rJ1RCnj+W6/fui+R3VdvyufFCXTQF8x0O8t5dmUgJzxAebtrt7LYNWjOh6JabgLJHRyPf0yBvyHT/l2+WAkwGWzMdQ4ENPJeBTn8juBj06cLXowpwCV2k0StSo3QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+Ia2MduhHwDl8RlZcxpMeY8sMz2eLMp9xGxf/FSl/E=;
 b=Qp7NqG5gvkiT7Mv1NkHFEnNGwv/TW9RhYMPLbKYnfaSg4GIt2zc9qZN1CYMBpZZ4DiRiycMyLtaUkUr4/wobCxNNbam8Gx5T0wt+wYLIYSKR9p0wVxl0g1NuCPR+5Hc7YAvHBUk7YQSU6xn9bfgrkiWjhCtPBEr2/u72h2UW6sKAVsr5BP2XwY1iuna76zYTou0B1Kq3WKTzp6w7+krF8eRE4vlV9ShHmJS21NcAWQ7VmhbKKV1n3dORo2G2Pztdas/r//mufpazwEXqkXSbLFxhUE3cFabWUMKCTXOvTh74PljXI+rNIv0ptFToLfk163eiFoHAcL+SA0sCc4NZQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by CH0PR12MB5217.namprd12.prod.outlook.com (2603:10b6:610:d0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Tue, 15 Feb
 2022 21:47:50 +0000
Received: from CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::287d:b5f6:ed76:64ba]) by CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::287d:b5f6:ed76:64ba%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 21:47:50 +0000
Date: Tue, 15 Feb 2022 17:47:49 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Message-ID: <20220215214749.GA4160@nvidia.com>
References: <20220201154901.7921-1-alex.sierra@amd.com>
 <20220201154901.7921-2-alex.sierra@amd.com>
 <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <f2af73c1-396b-168f-7f86-eb10b3b68a26@redhat.com>
 <a24d82d9-daf9-fa1a-8b9d-5db7fe10655e@amd.com>
 <078dd84e-ebbc-5c89-0407-f5ecc2ca3ebf@redhat.com>
 <20220215144524.GR4160@nvidia.com> <20220215183209.GA24409@lst.de>
 <20220215194107.GZ4160@nvidia.com>
 <ac3d5157-9251-f9fb-a973-f268ce58b4e0@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac3d5157-9251-f9fb-a973-f268ce58b4e0@amd.com>
X-ClientProxiedBy: MN2PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:208:23a::33) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: baa9f4d1-c3ba-475f-a94a-08d9f0ccd02b
X-MS-TrafficTypeDiagnostic: CH0PR12MB5217:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB5217EB09DCA1D8AC2E0BE7DCC2349@CH0PR12MB5217.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e5ee25wSOcV6kWxZUY3hwES7JMnboFXq08KQ5TQizd6gysRokBHhQl9H0K9Quw7uA3SQ/z2CBO7tbKZxxKI8LLxRz2iRcbGMKql4fnThrEOksmSbxf3F7oYJDWciH4rMOyncgitkkB/LbcNMLTDPGHTi/A5BCwOyw3WpJMbAUpmgSUmlBxZRqVFCjI/17Lwl77ZWaT+8bFCwExxGphlJbNm79xQou37udLffCy4W2b4VhEuMf8UtqEpMCAHb5roVq1MfiiBp7ppgiR5xEjcBBN1+UXTj0O8cZ84sLVIDAwREw58fpBg1BocGQEF7g+vrC6eM5O2NL0CRxRfUZlfkSvd4rXOksa2DF7T7t9d3b00IaT7I3Ob26dSmM3fV0Bnor9d+2mLsX6VDGu34ha6z2xRBxWK165SRtPrwlQMIf+R/NHAGLv8CjHaFuEJ3wraSx0IxbQS3srpAJsLg/ndT/b1wpEof4B6kRzH1pTmtYFNTaJEe3MgbIOHS+ZGa1lZmNjZdmCBTl/+SrzcBgHPx09PVNeGuEuV2ddtFjUsuQT9gbx4S10IMC+FUlgvmXRQ/nKaORrzmrwnsi7GP3gEQBPHhPVqMEe5+D9ob9Sscm1CQoJtWwKeDc0AR7oyqnJ0qky0aK2Yshg+RouYdnqc6jA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(53546011)(2616005)(6506007)(186003)(1076003)(2906002)(26005)(33656002)(508600001)(36756003)(54906003)(8936002)(86362001)(8676002)(6486002)(6916009)(7416002)(66556008)(66946007)(5660300002)(38100700002)(66476007)(4326008)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rjpNj1cq1+6ZHekg0bJvkKUDj7Nq3SUkHwbV+z/Xnry+C775vbj+vGQ16HKU?=
 =?us-ascii?Q?2FcF97X6HPqRxTlhgpVi8LVaUgz4mYB86zPMLrcGAQ4E0Gn2xttdkr4LaUvj?=
 =?us-ascii?Q?F19MSde4Si6KeRHJ+CN6v5JX+0piNtN8yhLExJ72RoqS6aL+G7qFHMplNmm0?=
 =?us-ascii?Q?6eAhWvFiLLZDGy0bYySaL7V3urC1OCk8u92rmPgXeZThu96CvFS0xPtFAlCI?=
 =?us-ascii?Q?zEkCupY7wmY3Y4wGaXlXiM8q3gg7JXKa3+7bkybx7oAcvbnd5CegiRUfEt+Y?=
 =?us-ascii?Q?LfQe4dxo6PuYEm1GxOv4NeOPG7FLobz57nW/THbr4ykc74oVqek23w/n/9Ye?=
 =?us-ascii?Q?9Wkwdkt5Ne87TCxLOL62YwFkACUEbNyE8z+gNYp+7OusM7f2EgK7QByqJlZg?=
 =?us-ascii?Q?Hc7hYU/FDn92szsb/lKcGgVC2lLHLZ8ttJyQfLcXXr/09+Jc3yYTB0PQptez?=
 =?us-ascii?Q?YOj78uu2O/wekvUP9UgTkLuvT65UnkGne1PIXsBHR/2geNg0P80QvFMij29I?=
 =?us-ascii?Q?mBOIKfxnKTntuiIOi0+RuVfOZajrtmaBAh4qkHrNOvbkwyIT3xj3rvO4vTsV?=
 =?us-ascii?Q?yxWAKiXZQjrBoEdt/0NgC+3/oSk2UoQGyl2usESjDh6yrbMFMQb2iW5wcv2h?=
 =?us-ascii?Q?V3cBP/1jpiycp3saN7MAoIj2ClQEDjnpk8nXr9t1ydzZ28XmAaMNPn1NUC8O?=
 =?us-ascii?Q?qTb4hZdGpzyix6Z/REtZLMMYm4ihhT/xH29iww6Fqu7VEBAJVhvVHKBqOx8Y?=
 =?us-ascii?Q?W9CeNZiCdaYUpfyDwpmpfCwRLJH756ODOI9Zd46BY+U5FKLWHBRE0ePuDZyl?=
 =?us-ascii?Q?E958EV+VznWzK0VrMWnlZufnYLrDwtbjp+oDHXld1Yvh6g4koJiqWBB+3k4d?=
 =?us-ascii?Q?a6Kmeytv1idpZZcuCymeJr/MNvCY13h2SiL5en1S0KyuAoZ413YPHYWiRkZ+?=
 =?us-ascii?Q?nJbmWVq+s7zpos/Jc0CLLCtheQXr7YmXjFwr7mCpY0hsWdxy4ZEhT+yk3269?=
 =?us-ascii?Q?RpfyUnyOlDofLO4OSmaW4zqvhB0bqcXsiYeKxxvmJw2T27qOEZ3T/4HcbLMo?=
 =?us-ascii?Q?edQRqIeB1xdh18KFS/XyXaPNr93WJpYHxB1BTupL/RjertdCwRN7X8PYaKVE?=
 =?us-ascii?Q?ZWNi4AHl87UsZorUGJw35CVe7gtGuggcufo9DNfRDhX5oi1a7ntbz8IOIbfN?=
 =?us-ascii?Q?bjBzti5CEylZtXSlI1QwN2xBHqaWFC99Csp6dIc3ps9i76Ik25ze0XQ3fQ7g?=
 =?us-ascii?Q?K1QwZ3VCg46urj+jfIkI3OIc/fRHqkmqNKrUxbcvXvP8qz/2pjUdvjuOOtDz?=
 =?us-ascii?Q?PHzk4uG52ONp6aKW9HLEByOx3Mfibm2Qaqt7BdyVwzuyDBF0Jw0vHayKbTQL?=
 =?us-ascii?Q?T89SPicSz6M14SUjTMkW/J7jaHNOUVYAPaNevXiYPc5JoX2xNcyi1DttsjG2?=
 =?us-ascii?Q?56NQhO6xeD/EcVF9H3UgOwGnFjYbIad5dBVIgcqBLy2BejyaSMXaq/45ThQ3?=
 =?us-ascii?Q?xYD93KeJU/e0do352kxWPiSpyqXDufBYaeowbSSlKKXpVc+FpofXV3TmXD/k?=
 =?us-ascii?Q?70rNCF3oHpe1tIh8MHw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa9f4d1-c3ba-475f-a94a-08d9f0ccd02b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 21:47:50.8351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhoZ4gE7jeglok5iYA+44CwEXi2iabe4Qob6thHMAiA/XS7CjxBgKl0/qaM2oGIu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5217
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
 willy@infradead.org, David Hildenbrand <david@redhat.com>, apopple@nvidia.com,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 15, 2022 at 04:35:56PM -0500, Felix Kuehling wrote:
> 
> On 2022-02-15 14:41, Jason Gunthorpe wrote:
> > On Tue, Feb 15, 2022 at 07:32:09PM +0100, Christoph Hellwig wrote:
> > > On Tue, Feb 15, 2022 at 10:45:24AM -0400, Jason Gunthorpe wrote:
> > > > > Do you know if DEVICE_GENERIC pages would end up as PageAnon()? My
> > > > > assumption was that they would be part of a special mapping.
> > > > We need to stop using the special PTEs and VMAs for things that have a
> > > > struct page. This is a mistake DAX created that must be undone.
> > > Yes, we'll get to it.  Maybe we can do it for the non-DAX devmap
> > > ptes first given that DAX is more complicated.
> > Probably, I think we can check the page->pgmap type to tell the
> > difference.
> > 
> > I'm not sure how the DEVICE_GENERIC can work without this, as DAX was
> > made safe by using the unmap_mapping_range(), which won't work
> > here. Is there some other trick being used to keep track of references
> > inside the AMD driver?
> 
> Not sure I'm following all the discussion about VMAs and DAX. So I may be
> answering the wrong question: We treat each ZONE_DEVICE page as a reference
> to the BO (buffer object) that backs the page. We increment the BO refcount
> for each page we migrate into it. In the dev_pagemap_ops.page_free callback
> we drop that reference. Once all pages backed by a BO are freed, the BO
> refcount reaches 0 [*] and we can free the BO allocation.

Userspace does
 1) mmap(MAP_PRIVATE) to allocate anon memory
 2) something to trigger migration to install a ZONE_DEVICE page
 3) munmap()

Who decrements the refcout on the munmap?

When a ZONE_DEVICE page is installed in the PTE is supposed to be
marked as pte_devmap and that disables all the normal page refcounting
during munmap().

fsdax makes this work by working the refcounts backwards, the page is
refcounted while it exists in the driver, when the driver decides to
remove it then unmap_mapping_range() is called to purge it from all
PTEs and then refcount is decrd. munmap/fork/etc don't change the
refcount.

Jason
