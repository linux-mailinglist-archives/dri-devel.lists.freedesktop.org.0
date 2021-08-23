Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ED73F4BF0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 15:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62D489E59;
	Mon, 23 Aug 2021 13:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2082.outbound.protection.outlook.com [40.107.95.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD8889E05;
 Mon, 23 Aug 2021 13:54:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDMG8AvDfslNRafDwmXV/EfNk9ZOhHvr0vscqAweIChN4ZiZH6uusQRWofo1l77uzVFL6IdLX047fc5kWtYNJFEjrGTYSxzEY+Np/CNdbDbXZX7728VgQ96i8lZCkQq1Yt1sLlXy/pI77th0argsP3XPoCZ66r2FWbKV+9FGvP0HOnPeocIBqwBO8rU0mHezX+vKStrPu5zD6FUrW+5UDl7PebPKmyhNDoFl78zBy4upPtbZbaq6hsj7s11+iDbRLXdgZYnhgg8mysPQoF1F6UNvK9nPjrvJY8fjn5m4pkfPeX38t5NIuD7uEjb2GiXqtJ1PMk0dsGhISKAeeFFVmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8E2FlfnzgBWz8gKnDNQnCFom2qUpOZvrQM14eUbWJ4=;
 b=MPXfKZbneL2xw0cXNuX439AjkME9J070lorxCGxYK7TsBuaECaWXE/fEtJmJkwGxDbN3eZGtbIEG1Ya4Vxo0d4ID2NDPYTCVr+KfFRS+m3s3sQ7WD9pE/DYpU7fEXEme2HJFQgGwQ8hBhpoYoBAgGEk1p9ZLOnft4mzQN0kE8DsiGYNfNV3vtnA++7b9BRUVKpydgF87Qcejo7asiPdW/njZpuxJSaRijHnbZQ6F3Mofcx2g7jGRnNhHQCWwYHFCaVFdNzwD6mZel7fU5MA8FacITvgt6S5VxXOkM4VAL2OJWSBlleRxN8NZLKk+Gv3uNf8lnYmnVGkcgcReEveo0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8E2FlfnzgBWz8gKnDNQnCFom2qUpOZvrQM14eUbWJ4=;
 b=rHMpI86Ko/nQjgQ28aUDAq83tB36090PFXrPrfSqJ39vZYfd7ls8nRE1fL4eCoQ84P7NZTfzrRGSpWg+qVce/PvzupXc86R8uA3GY6WU3GSRhTA2iiGE19Ug3E77xlIWSFKtMNe/oVt6mhTW9tkHc0x1ns9AaA49O4NNtNNmETJMYwPVlBBBamwBCS2zqykX6IPzxTYTvayqriC6R7t1LVr8T/7i6y54A7k3Y80R6007kI3k8+lGWrB3YyMjm98jHMR09zejfMjX67Lj3kD0qRX4+oCSsjZ3GTA2VBLE2tEXjRi9OF1qIFx/d2eeB6dfolwNclliFQUZ/jum7farLA==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Mon, 23 Aug
 2021 13:54:39 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%8]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 13:54:39 +0000
Date: Mon, 23 Aug 2021 10:54:37 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Maor Gottlieb <maorg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>,
 Christoph Hellwig <hch@infradead.org>,
 Ariel Elior <aelior@marvell.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michal Kalderon <mkalderon@marvell.com>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Mustafa Ismail <mustafa.ismail@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Weihang Li <liweihang@huawei.com>, Wenpeng Liang <liangwenpeng@huawei.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zack Rusin <zackr@vmware.com>,
 Zhu Yanjun <zyjzyj2000@gmail.com>
Subject: Re: [PATCH rdma-next v3 2/3] lib/scatterlist: Fix wrong update of
 orig_nents
Message-ID: <20210823135437.GN1721383@nvidia.com>
References: <cover.1627551226.git.leonro@nvidia.com>
 <460ae18dd1bbd6c1175e75f5d4e51ddb449acf8d.1627551226.git.leonro@nvidia.com>
 <20210820155425.GA530861@nvidia.com>
 <85542c97-c7e0-3db3-baa8-2413c00f75a4@nvidia.com>
 <20210823124541.GM1721383@nvidia.com>
 <2aab4d71-c6d3-d24c-ed81-7ded355a1592@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2aab4d71-c6d3-d24c-ed81-7ded355a1592@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0190.namprd13.prod.outlook.com
 (2603:10b6:208:2be::15) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0190.namprd13.prod.outlook.com (2603:10b6:208:2be::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.10 via Frontend
 Transport; Mon, 23 Aug 2021 13:54:38 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mIAPN-003Hac-F8; Mon, 23 Aug 2021 10:54:37 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9109e96-7b4e-42da-0f42-08d9663d8cb8
X-MS-TrafficTypeDiagnostic: BL1PR12MB5157:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5157C7B41DA8A16F31598C2DC2C49@BL1PR12MB5157.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j5X5tlkYnKDgnb/1eX53LstvGfTm9npHmnnF3QhwdUluLy/hmxPIOKHDijTW59ZlYddsI54JPUgbseKJPdkbysXS4zVh/q52drwdWQFqRTk8qtswveBE8BdedZow381lfFtUAVsHVqnESaaGqrFqsNUR2TY/ZO58pwU5OSAwgXpYSfN7xhp63Q5D6htoOa0vWl5baCbYez6AQ6ifme0HqqtdRbcGSF8vlP9XVRahJOdKg9EX6SmlBFzNJidaMvGGGrRDvyp2+xYSYUBrETBPnhwY50IHFALfwZkpmUNtzTGatXhpfNh86lKbJe0iJ6/+h+1HuPY5804M7PN0MfmvSlyz4dUzt6hkh1GpX9pc8jkqKkSw1RxOs6JLB/ur5jxeeHYRzysOuPmIoCg3M3GUZ60JfvAOGxEOQ2QN6rAWoLGNx4Tdvnsp+1FxSebLxpED5zssKH1d3ng8fJM1GPQfZYEqeka3SgAmIVm/fdR/hmxlxLXA0jjBqpCE4oIJsZ5XbGald7xUwFZe/0FOgYLJ9DNcAObqOfxh1zoYf1Mi+I6+tuain5am1daARYn1DA5KZJWJKVDuslRRU3SKFOtM/ueE0kYtOUEKxy7SC3JUhrNbbIEnnoTUySroM9nyunLiftOo4/BeejyAdADAt+w/nA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(5660300002)(86362001)(426003)(53546011)(478600001)(186003)(2906002)(8676002)(37006003)(316002)(54906003)(66556008)(6636002)(66946007)(1076003)(66476007)(4326008)(33656002)(2616005)(8936002)(9786002)(7416002)(38100700002)(9746002)(26005)(6862004)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnlFSGxQVFMrUlpFZWZvSERYUWh2NWhMdC9DbktleExEQ05UV2I4TUdMdFlG?=
 =?utf-8?B?cW5FZzNVemZabVpTK011Vlo4N2JCWWtBakdBbXArc05qK2dKY25wNFo4QXdr?=
 =?utf-8?B?cS9tRVNaWVZqNTd5eHI0TTFSeExkMmpPcW0xVFpvVU8wc1FUTmN6Zkxya0No?=
 =?utf-8?B?TUpxcE03azk1ZFFwV1ZwUHAxaUYraVFaVEk0ZlBkOFBTZ1U5U1J4OE15eGVh?=
 =?utf-8?B?R2VLbFB5M0l0T0NmamZWWlFQaG5rT0RneER2SzFiRTZwQzNDbUxrUnlnVGV4?=
 =?utf-8?B?MEdOdndIVEcwOUtiWG9way9xTENleitNZkNLeEM1bThGdXVSMGV5RmZRUGlr?=
 =?utf-8?B?K2lkYWpONVJvTUczdnd1VGJPd0hWMGJjTDBrU2E0dmpaSXRReXdiVzB2WnZ5?=
 =?utf-8?B?TTc5RnFaVDdmNEJ5WVRKeDdQVmIyeklNVXdCWm0vN2tXWUFQYkZ4eHdpcU9V?=
 =?utf-8?B?Z2dZeERHa0lyWHJwMys4R1FwUU5rUWxUSkhlZ2p3bTBQT0RCaG9rQzRJOHhB?=
 =?utf-8?B?WmpiYmU1YmI3UnAxeXdoSU5HSjdvemo5M0M3c2ZHbnBGQ3d4K2FnR21GLzdq?=
 =?utf-8?B?S3F6U2pqbVJhL0R2UnVFT1lRN0ZMdnJnNWdFbEZ1QnBSaVc0WU9MNTRvUVBX?=
 =?utf-8?B?TUFCSEVZcHptNHh2VS82Ymx3S3ZNbFJ5d21nOXp4U2l2aHBsdWJ0a0FVS2RS?=
 =?utf-8?B?RjhENVF0WU5acEJZdlRWRVhzNnVURkxsSVdISGNiWHdsSDQzZ29zbnFzZE52?=
 =?utf-8?B?cFYxY2ZTZVhIYzNOa1R3SUFiQzZyanFXKzl2NmhyMnM5azAyRlV6N2hBYlB4?=
 =?utf-8?B?M2pkYUZNNzl2cTZySXpuRzluTmZUdWtNZXJyc2RTaG5hVlZsVnVLRSs2RXU0?=
 =?utf-8?B?d01wenhlbEwwRjBuVUVXOFkyWFpieWRnNGhFRDFoR2lMSWpkSWs2VEZ6Nmow?=
 =?utf-8?B?eEhWOTFRbnNQc0UyTm5xTHREQnpWbFlCamtFRlB5b1ZyK2Q2dXg0bHVNUHlC?=
 =?utf-8?B?Wm9rbmJsaG03WUk2b1IwVjRkVGIzaDhZcEhjbU9Rd1kyaFdrR3FvTHdMRFQ3?=
 =?utf-8?B?bEJDOTFWNTVENVNvcEd4eGc3SXlHdnZWVnpSUE5zWlowcGJsVWlzRGk5bnpB?=
 =?utf-8?B?WVd5ZUkxYUNXazlSOGQ2TUd1Zy9WZ1VFbk8wYVRRSXRwTnR4clM0Yzhrc05R?=
 =?utf-8?B?QXlSZERwdFBudnJ0V2ZnUDFtd3NZeE43R3dNelRzRGZ1UnFGWjNWVlJvRE5o?=
 =?utf-8?B?MmFhR0dzSHowZG1URnAxeUtjTlN4aXg4OEVjcCs4NEZVbkdqQUg0N1NUdGJj?=
 =?utf-8?B?dG9FNndyTmxncE5mTFJ1ejJ3WDBtdmNhMkQ3ZFhZRTU0VjhvZ1NPVVplVEc3?=
 =?utf-8?B?SjhDRzJmOWZpWjE5SnVKOFFmRVZBckVNRithM1VBWjhiMWlMZHZXTkh4ekph?=
 =?utf-8?B?QVM0amRTd25ocXlCWlZXSVVrdWdkRExvdCtsRm1IL3d3MVR2c2pqSW9KZVNU?=
 =?utf-8?B?R0NkNXQ1TlJ6QW1ZTy8rQW95UXd5enRnc044VlNmTkFqOC9BZWFoMVpaYlRY?=
 =?utf-8?B?YmxQejJESTFqcjJrKzFSblZXcmxJRW9xYnllWjR6M1BPbUFHVTQ1L3QwZDJI?=
 =?utf-8?B?NnM1UVlBbVUzYVpEazJpeXN5L29waVBDWGYrbG1YTFp1Zjh1Mi9NZ0RWS2Fj?=
 =?utf-8?B?bm1aZlBiM1gzSk9BVTk5bjFybkwxY2cycWU5Nkxwa09HZ0wwNUxHV1UxcTNz?=
 =?utf-8?Q?ye7+P/IxCRe92dX8JMnM01piUIUpDCbhlP81s53?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9109e96-7b4e-42da-0f42-08d9663d8cb8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 13:54:39.4365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTqA+B+Zf7ybNB4jt6o30DQ6bCZG67ADuhOfE5up9/yPvjWKdkuec8cXiSP1gwxl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5157
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 23, 2021 at 04:45:45PM +0300, Maor Gottlieb wrote:
> 
> On 8/23/2021 3:45 PM, Jason Gunthorpe wrote:
> > On Mon, Aug 23, 2021 at 02:09:37PM +0300, Maor Gottlieb wrote:
> > > On 8/20/2021 6:54 PM, Jason Gunthorpe wrote:
> > > > On Thu, Jul 29, 2021 at 12:39:12PM +0300, Leon Romanovsky wrote:
> > > > 
> > > > > +/**
> > > > > + * __sg_free_table - Free a previously mapped sg table
> > > > > + * @table:	The sg table header to use
> > > > > + * @max_ents:	The maximum number of entries per single scatterlist
> > > > > + * @total_ents:	The total number of entries in the table
> > > > > + * @nents_first_chunk: Number of entries int the (preallocated) first
> > > > > + *                     scatterlist chunk, 0 means no such preallocated
> > > > > + *                     first chunk
> > > > > + * @free_fn:	Free function
> > > > > + *
> > > > > + *  Description:
> > > > > + *    Free an sg table previously allocated and setup with
> > > > > + *    __sg_alloc_table().  The @max_ents value must be identical to
> > > > > + *    that previously used with __sg_alloc_table().
> > > > > + *
> > > > > + **/
> > > > > +void __sg_free_table(struct sg_table *table, unsigned int max_ents,
> > > > > +		     unsigned int nents_first_chunk, sg_free_fn *free_fn)
> > > > > +{
> > > > > +	sg_free_table_entries(table, max_ents, nents_first_chunk, free_fn,
> > > > > +			      table->orig_nents);
> > > > > +}
> > > > >    EXPORT_SYMBOL(__sg_free_table);
> > > > This is getting a bit indirect, there is only one caller of
> > > > __sg_free_table() in sg_pool.c, so may as well just export
> > > > sg_free_table_entries have have it use that directly.
> > > So I can just extend __sg_free_table to get number of entries. What do you
> > > think?
> > Isn't the point here that different paths to __sg_free_table require
> > different entries? What do you mean?
> 
> I mean that  __sg_free_table will get the number of entries. sg_pool will
> call it with table->orig_nents and sg_free_append_table will call it with
> with total_nents.

That is sort of what you've done, just renamed __sg_free_table to
sg_free_table_entries in the process, which seem fine enough

Jason
