Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA97876893F
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 01:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5834710E148;
	Sun, 30 Jul 2023 23:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E68E10E148
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 23:09:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfvTQ3YV9cc3DdpMAMam9Afh4OG12EaHo+rJCuy7COLq28N/+uf19NiAqRdtPHfcRChR/llWrfMKLn8b6/YiJtYz0zSg0ViHUTBYjGOzzR9xe562Kpy+efZL/7+PhpFVV43c195a1697+BWpqmogIOQsV7hr2bVPl7iNAn/7/F/AK8/OnYW3ZwbIg5OPZNSQ0jeVusLYCZ82K9yTBwFIPAVOsPErkkp/z1enTOBDvdr4Ll9xSl4EVdlwYwDZIvro1b5Bo5HAUODUOSXP9R9+mDJn0PCA9JcChTYBtZdDcxqXatcVxiKMAm9Qth/vkLCfoumkaa6ekP6Kt5M1BtJVlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5ECq/IPXrJDIh/ws7hb6ukLjCZ1Em84bICo+I2nT8s=;
 b=gf1oHBlL128ioopkjll/psVzd7XGvO+Qx5gy7MbtNDYd4W01j1zvxh083GyKmZbxx2ekTyCZISGmjHgpuHDaIcMJmdvZP4oFM4BeIWBBzSuU5/NT2kcdPK1L/ai07Npx1CE+V8nzIxNvfr3Vf9YgUfNnMc3mNCev9DiKpmfXlMgZQe67ZQZeiT72aEDSAHCSniUBeb3jX7q/tnU46mYsfSwZa4/4haZ7lXU8VM73KZ/a2/GymUEswEhAO7t2A62MVemVt3jELojIdt2KUTWAODp9UL4+ZRSofVGsctwGlL4pnqJ6KDoUZOfiYjaDKxjk+GvVa+rdAmlOyI0CZlwlLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5ECq/IPXrJDIh/ws7hb6ukLjCZ1Em84bICo+I2nT8s=;
 b=JtKLoIAUqcxSDW2BCJQSFPGCVwpOg6duIG+AU0k8wtyLIV2L/PhcHVTKEnENrhL5N8A5qTLEO5HIP8bE0hAdHRQb9xAH66DyUrNLgG2x1TjZefnZhL4wRMrTVUOZATf8dTsbJ55JhM/Ugl//DhpRgaEqlW7wH4hhx53oR5nliT+90U5CRtMHNQ0ZIy5FfLNxY1EOAg27X+o34o33qq+DgKlSW6QcirKvxNLd5sON3ztPqSLBTa6TBSNtzreYg0NvtRALE+WKV7PBNuPbG03yaGTxkGyZJIhoa56Uqc6AAJcOO89kCKmM5no6s0wwNkefKCGO93RpPYCs7Nnyv6vEjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB5748.namprd12.prod.outlook.com (2603:10b6:8:5f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Sun, 30 Jul
 2023 23:09:38 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.043; Sun, 30 Jul 2023
 23:09:38 +0000
Date: Sun, 30 Jul 2023 20:09:37 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZMbtsY4O3Ho3B69J@nvidia.com>
References: <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL5+CiZ6w4RdAt5u@nvidia.com>
 <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL/B6yvO1bIkFRcF@nvidia.com>
 <CH3PR11MB7177FA18562FCED8A3171007F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMBSWxYnWLlzG3+6@nvidia.com>
 <IA0PR11MB71853E11B6C419DC0D043953F801A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMJbywGYN0QLh3vF@nvidia.com>
 <CH3PR11MB71779C83F8A0EC6C2F3F4B0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH3PR11MB71779C83F8A0EC6C2F3F4B0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
X-ClientProxiedBy: CH0PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:610:e6::8) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5748:EE_
X-MS-Office365-Filtering-Correlation-Id: 99d7181f-483d-46e4-5914-08db91520c87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cHZvrWLXgGViDDQatDfe9MdtRbKSN9xT2hsNce71E9a0vMjChbiWpxsXUnSjAc2nTbv9n7Eyid43APVKv9J3ZLv88OIRbQiBD4M/Mf4kgAcM0IS52jFh0zmqQ4W8SotkMDqk8uZyAFQK8izxkuI/Goa1WmoD7l6jdxBDSvV9hzUrpVML6VS+nD8HK8Tg2qD3Yvam3uwShvFeGE9ck5d+MUMKIOBBomXfDMzQrBo+okdoO4ApF6ozufLyVIK5AGrTDZ6apfQDQpXaJW6Ynqb+pNeIGDcwgfTvOuWpAmkz52lw8T6Hd9a6iS9tLSoioPDbQiBzODG0hcdOa/AMXaaKdCCwHFUAGdlxGVf6PRNajamv/OgZYVyCMOZ3h31H2bIYA+iGjngYYVdx84wXSVJHVVYu3XeOd0CT4HyrdMFfA7R0H8JYxWN1PIYunAwtCbb6ZpL3CSvu3QAZQ0+VXwKDptKF8MgChBpeseW53NmmrMlI77iXMVY43PVZPm67dWTO9oyBb56AQ6lbo6qVyhiQrRJ0lIw/cUEoxdp+m6XGozzMbuu/tE+flc4xwiUlNAks
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(38100700002)(86362001)(36756003)(6512007)(478600001)(6486002)(2616005)(186003)(6506007)(26005)(8676002)(8936002)(7416002)(5660300002)(4326008)(6916009)(66946007)(66556008)(66476007)(2906002)(54906003)(41300700001)(316002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I9zydEy3vtsOIvOojuTSrQcddVwJhqQOUbh/+un7hDSYZywXXAvxiixfjcEq?=
 =?us-ascii?Q?tVtRO8xeefT1772v2MNqeDPd0RrHDRH85FsUL5C6xJ6I3/gfEmVIefH4CDC/?=
 =?us-ascii?Q?2pF4CebNQsxJDce+AZ1YECgu5/n+JFcletdUVJlESL19vPxKzCK+Ab25LFYe?=
 =?us-ascii?Q?1ip3XqtrUDwgJR/wPdIxcaPBW/R3gZwdMts9pJDMBJlB2OcYk+ea0DjTQgqP?=
 =?us-ascii?Q?PRbI+llkSGxrCBE0Q/Pa8fYaHnKVAY50BLIjFumkW8QM5DM9oIXGz9PqPpro?=
 =?us-ascii?Q?SSElQdsLx6nVtJnrvXvJH7QDj7ca8v+M9CirksahogE0X4/ch7kNXS0XKV6C?=
 =?us-ascii?Q?cumy+NzOVss4EJgRzIrn53L1JcQzSaVbAIwnS89Lx1AUt4YPLD1duOWX8A9J?=
 =?us-ascii?Q?poby9Rz1MViXT7DEeNOYX81rdPJJ+TPVr0e3NAgJZFEM60koO2eQScMOM5CE?=
 =?us-ascii?Q?dbHK/F19QKJFp3yE3+nr0Xpldslm8ob5oZ/nPLLRs3SYKvraItSRdjM5A1au?=
 =?us-ascii?Q?jyvq13B5F23DPzkueeUGmOZr/AlAnAWCo5GMqZH8jGhIZTST1bEOp+9gMqAr?=
 =?us-ascii?Q?8x8SPFI64lJTJ8HC11sDZGmHg+BDB795tQu9HXdcPHJHqBWPxeGMAKWYIclq?=
 =?us-ascii?Q?E3Yref93Oe9bJQNjXXDiQ07yp5ki6gNGbNpPLR4irdiRirwuQgtFFi9bWnUW?=
 =?us-ascii?Q?z4YMr7vbF7JbeR4B3eo8+lBc90NsQb0HtiZ026sXc9U19wqw07Pl5rJs8XZn?=
 =?us-ascii?Q?29d5DceCBbhUgyZD8Kv1N4A+fRafNrjjpFFReZGmj476bcwopkQ+mI7rhEO5?=
 =?us-ascii?Q?RkNOc/Uyd74q7MWEwwGTiyTWu8w4hYgB6MeU7NbzO62VnnlsqSTLNYLgQuWC?=
 =?us-ascii?Q?VxQfdKtaYj5T1yyzGxMgmL4EWuEs06ZMsRvTUKt/4EaKroJt/7mi9HUglPkI?=
 =?us-ascii?Q?KBOVYj2CAUOZSqhooYLIljD1ifsyVqj1N50oQK6oQF6v/7bFFJSq+9Rz4SeM?=
 =?us-ascii?Q?wWdDRdk9+lEFH++OBHrG/P7cQ7AN1a3tEBVhvChMd/nxP99RBPe5cbrz+EhW?=
 =?us-ascii?Q?KOcVU2mSxTw0hoEHeTNTpIrCXh2fap7vlYNFloyPAU0SyS4eRBa1mc+g4Kfg?=
 =?us-ascii?Q?EFFvwyo7+4DVWtrb82iZK/n5WJrI4f34MUwucWlk024sn2n7izvi9UvMqblS?=
 =?us-ascii?Q?94hYe45QdkZ8lsbEs0RrdNfcRtLTWZEoPOqexOrpBgsTDm3FcPOZOewuTVUh?=
 =?us-ascii?Q?zakoNuvTV081tp+McAdQNqAOUIIg0aqckZ6MrqGGC6ccTDQbpZ5WdU4cGQQ/?=
 =?us-ascii?Q?lHCshpu2MLJ2Jt84YGM+xj3yEg1kuio3e35w/bFg55I12fEpUfM7PZ/Ktz5E?=
 =?us-ascii?Q?obArR/REnpF8iah5Ljaln/Z75u+kTuQt+GClYUCrjzbzYB1kcm+5XITn54y9?=
 =?us-ascii?Q?aaYiHZIP6EZg9vi828xkmB85cVBtRwY22EeyJZn9v/y+fVWtWmo0cA4aNAVi?=
 =?us-ascii?Q?PytttnjdOkmktAj9n9dYFMrepwecDT673h2YQEH/NLToHXnmeb4NIx0ZtBOx?=
 =?us-ascii?Q?9ujpc+D/7Yog0rbjeWXsgyN7QrzAUK/zu+Uuqzmm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d7181f-483d-46e4-5914-08db91520c87
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2023 23:09:38.8148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kezs92cgSM0hh4Ucy7HC0nG+cLGwrH2lR236mSVGOEN7SWMEyxZrmR4MCdtcQO8r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5748
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

On Sat, Jul 29, 2023 at 12:46:59AM +0000, Kasireddy, Vivek wrote:

> > Later the importer decides it needs the memory again so it again asks
> > for the dmabuf to be present, which does hmm_range_fault and gets
> > whatever is appropriate at the time.
> Unless I am missing something, I think just doing the above still won't solve
> the problem. Consider this sequence:
>      write_to_memfd(addr1, size, 'a');
>      buf = create_udmabuf_list(devfd, memfd, size);
>      addr2 = mmap_fd(buf, NUM_PAGES * NUM_ENTRIES * getpagesize());
>      read(addr2);
>      write_to_memfd(addr1, size, 'b');
>      punch_hole(memfd, MEMFD_SIZE / 2);
> -> Since we can process the invalidate at this point, as per your suggestion,
>      we can trigger dmabuf move to let the importers know that the dmabuf's
>      backing memory has changed (or moved).
> 
>      read(addr2);
> -> Because there is a hole, we can handle the read by either providing the
>      old pages or zero pages (if using hmm_range_fault()) to the
> importers.

You never provide the old pages. After trunctate the only correct
value to read is zero.

>      Maybe it is against convention, but I think it makes sense to provide old
>      pages (that were mapped before the hole punch) because the importers
>      have not read the data in these pages ('b' above) yet.

Nope.

>      And, another reason to provide old pages is because the data in
>      these pages is shown in a window on the Host's screen so it
>      doesn't make sense to show zero page data.

So why did you trucate it if you want to keep the data?


> -> write_to_memfd(addr1, size, 'c');
>      As the hole gets refilled (with new pages) after the above write, AFAIU, we
>      have to tell the importers again that since the backing memory has changed,
>      (new pages) they need to recreate their mappings. But herein lies the problem:
>      from inside the udmabuf driver, we cannot know when this write occurs, so we
>      would not be able to notify the importers of the dmabuf move.

You get another invalidate because the memfd removes the zero pages
that hmm_range_fault installed in the PTEs before replacing them with
actual writable pages. Then you do the move, and another
hmm_range_fault, and basically the whole thing over again. Except this
time instead of returning zero pages it returns actual writable page.

Jason
