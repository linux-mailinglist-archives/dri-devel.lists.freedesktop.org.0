Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 003506BA611
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 05:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECCD10E90E;
	Wed, 15 Mar 2023 04:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5EC10E90B;
 Wed, 15 Mar 2023 04:14:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbg8AHOlwyOIGjr7pyLyH7230c2QrVyUh4aCgOcQHfGTy9O+M9SkpZl38Njcf7VQWA+X6mNMLqwqlAGfseSTyyvZ955Jy6nGkQwlzhGOgTNWR+8AM4Cr8aTWPVbX6VtZl5EjQjlUZO1MgNT+q7PqkYVA/tkusY9f6jUxHc1dg2HfRDe7Ge/CDfVTz/WPifYa5BTHlQ7wfyv67z+6IsQYiFAAQFUFiCoqwm0CrxYAruCB4x/KCCE15BRylgtu5Iu1rIWcQ5RCLG0zguL9fYGEJvni1J1zcC+pAJAY1LLfaEOklu0Z+6x6rTt7EunisE8IBZsvZKAVDGzkdbdKTFrd9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBL5jDxTxT9M+2E4VZd/QbF/oEcq+3gCJZfcAsVMS0k=;
 b=PRvK3+QYCKQ0kUg141LjbjHpYWJSrM1JE404kS3LeB6ut3dcuUvWpG07Q+QkcuKowi6CJDdpvRMxqSXBK+mVspBx8yynFzuZ+esVANg6KxvOKJvE4ZwKU1exe6UGYn9xNfX316Fa17tjawPuCuFn4bm05cH2dq9f0kMmk8Wx6U4rT+/ACrfgEU9FMzR8bw2AFSqmIz2d2KSLw6BsVBROmkAbyIE2sugOLe4NzT24P/qkEtmJdDMf4+fTHY06xwZyM1BJmOdZ/tbBUUgiSv3GH7QkZumHqF1g/i+EvfW8BOa6TgSPuGqTjLyufbtEiGQ69AW9hwEEF+w7Y/wg8M79Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBL5jDxTxT9M+2E4VZd/QbF/oEcq+3gCJZfcAsVMS0k=;
 b=H6SXqlrK0nyV68EmwlXPc4I8WzCdAX48NYtVbd58vEPA9S4+4Mr7izVYQwL2FTLTtiC/BGzczMx+lnhohiJo4E9/bufGTjQd+CpaicSB9w7xspVCXw1fEtlwH5Lmdxyn6SGnV4XAUOjK7llGtMceGIMgkEbMKmziyjJbHkk5B1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 CH0PR12MB8507.namprd12.prod.outlook.com (2603:10b6:610:189::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.24; Wed, 15 Mar 2023 04:14:55 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.022; Wed, 15 Mar 2023
 04:14:54 +0000
Date: Wed, 15 Mar 2023 12:14:29 +0800
From: Huang Rui <ray.huang@amd.com>
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
Message-ID: <ZBFGJUE0ahA4R9gr@amd.com>
References: <20230312120157.452859-1-ray.huang@amd.com>
 <20230312120157.452859-2-ray.huang@amd.com>
 <ea0e3852-87ba-984b-4010-5eeac3d6c507@suse.com>
 <alpine.DEB.2.22.394.2303141747350.863724@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2303141747350.863724@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|CH0PR12MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: 294de6ca-5332-4c24-7867-08db250bd4a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GhpyozA3OI2h6uVXYpH65ljn44XngP4OkcMqRgxfLSZ0Z55crJYH+W6ffcmSX9jDZQ2WOTuQAVYL7TxXjKJaP8LFVgO8T6AqA3KRmgqMZj1qMHG7ZiDOwQzNh0j1R+E0OP5Lomia+o0Ga1WUmk5OEIZn2jxMq8+zoFEfHOMuhoE/ljaOXnVrG5/9jdoX+ZTLSRRKwAmeLjKkYpb9XvVVqlHJAXI6HAGTUns9wakBizqV2WH0FhIyCC1WddT0ENSrf+tdsUnVMAWvUYRjGMS+UMeKxYtGci6W/0YEDE6J4tT9mfA4HM+jZ++1APJJ1zcjiMNRJC52N398+rOLqVfmWIuwgWngV2x1Hf7O6kCllpz27NIGIyg/nYzjK46a65CcnjrpcBCKtH9hmATP3eO1nM+SZHuWYa/Q//nqGbL0yJuDIUYebZU7bZ1yANqFmXTuQUxbv6ug8YKTSxhb5mWj4FE2uDsC25geOxEzIGSnq4uMD7RoHdKqgdNIJuuqt7I/ZfwtQZSpEIfTjHaD59JqliUQ0ZNccPXgWjLZlRxjzTvYZL7efOXafLRLtarqBsCc6A6ckQhQ3/fcxz5TwXFekizZPooYWwlvQGRyL9ynssxC2crURckXGYqy3Hau8A7qsEM+b6OBAVXVihXa6IQ/aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2504.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199018)(6636002)(110136005)(478600001)(41300700001)(8936002)(66476007)(66556008)(66946007)(4326008)(54906003)(8676002)(36756003)(86362001)(38100700002)(6666004)(6512007)(186003)(53546011)(26005)(6506007)(2906002)(5660300002)(316002)(83380400001)(6486002)(7416002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NifREuM7fqiWloKmSGHWuP1iOJZdSVHeOOeCP28pnosmFWeRWIgTyLJvqU0X?=
 =?us-ascii?Q?wufo7b/LpMKPoS+HsVw//uKLlqG/BZ59LRBGsIFk7dhgLDfjTJLH2EM1XUwj?=
 =?us-ascii?Q?D/gMMIFt5xWOD+Nv0LTJrUnTObbv7vMf9fI9oYCyUD7JXLE19fIhbBsmRlEB?=
 =?us-ascii?Q?nZcB/U7oelJ12tuAWkDEo3HuuXA6hRK0DXeu3CMPCwz/nBenmul+NLlPa2my?=
 =?us-ascii?Q?MAADW3LNPGhs37APrAO5sw2uWCRVXezd0ii5gQv2BZRIjijW5PI5+Gsgna+H?=
 =?us-ascii?Q?Z7kwRQ2+olq9TM89T9NBpheRZjibEF3ooehzZGrdIjvEUeFdKbOFKulkB7DQ?=
 =?us-ascii?Q?B3sUVyK2kFdvm71P1VyojF3gg+sBEukP5/bbDvbSuTGQAq9jMvduQV4XAoFF?=
 =?us-ascii?Q?Qkt+kf8nbC9N76w5s6NY0U45gPwFDQ/oY7nuoQIDeTPwXxSXC/PINyLGzBEC?=
 =?us-ascii?Q?Z7QVoDyU1kzs+/z2KhNxy1N7KHKwbhm+XISa50OWamKT2dwjEbz8dPtYnPaF?=
 =?us-ascii?Q?AEeRsGJgfBbWemm5B8lAglZZByYIltbNZDWvlVnx6b3Be4lnHnKUJYWDtnDU?=
 =?us-ascii?Q?s5U62dFFYWJxBs+5nuvm6Im3BCcf2iUGM9usXbH0pGx1N1jPy1dAXY9CWlGM?=
 =?us-ascii?Q?X/1g5otfo94h5GUGZw/V7Yj/RNeDrre9be7rwRVdB4QtHfHbN1lTZ/4qu9Yh?=
 =?us-ascii?Q?RxdSGF/x54gEUbEThDd8NcaK4xhYrcY6bs9/PH/w7vm5UBmF6fGWwGcBYvZN?=
 =?us-ascii?Q?u7F6WUFxXoVTCDBjks3KWn1nGYyTu1CTD8bIJ//GatqQBWvYJ9AOat5m+JiR?=
 =?us-ascii?Q?I1KlCF2BlNydps5M2/xLGEfn/aVnqmULOL3fAgvJ28ZwaBnL6C27B6MJlCKZ?=
 =?us-ascii?Q?QOAlvUAEUmQ++dggyRg4cqV2lq77wgsKToA4+UPnHhuXpJM2cZTbQ8mU3Tmw?=
 =?us-ascii?Q?mipsgp7HFFDtisUqVcKIKw5gbEhP3YDRg3YAgi/80JLhkDixAT5cBqPHonJO?=
 =?us-ascii?Q?OmgwUxs/jru0W8l7OtIN1+XW+Hk+M+dt3VSh0ZmNnfNBnqAU4qJA49EeCnNd?=
 =?us-ascii?Q?by5f7tmrMVALMTyczjhrdOz754fzeK2g7qa5IAnZy54s4+TpWvw329Phu7UN?=
 =?us-ascii?Q?7WBOhbNWsh/3NLg3rauOdilw/yESKoLj9PWsBzVdCZHjTV4kfzQVYedSkR2n?=
 =?us-ascii?Q?sIkoK2cN4L4AuUpOpOxPUSuXoS2uqSqmmWAH2SGMWIvuncQS51iVwr6oCKzm?=
 =?us-ascii?Q?L828kk4pvtK0rL+avU8lkdD/1ii8ww/iIQZsXZkuIdQrkPs1h1VHOGEo3V0I?=
 =?us-ascii?Q?9ssDYjLYZUig0CbFt6eTjuJba6X/Gnf34ESyD6+56L9FWTvcepAf76axYtj/?=
 =?us-ascii?Q?VMI1TdExH6Xr/fPd98P1Dj/7MtbrwuaedXNOmJEyp/thdGmR4OG6NajW05d7?=
 =?us-ascii?Q?CKBvsJsHac5mlSrpH6E9noIpgA0JcGKc5By11EDsEZevP8Gx4gMyd5BCb2wH?=
 =?us-ascii?Q?KsyYNXLyuHiwoKs9ok4ckR2et4c4+Gho/G+RyihhI4Ko0pHtkXG2FtvmUwSC?=
 =?us-ascii?Q?l19I1YblrWMWH6YRfXyYXRYL3jd+tv0vvaJN295w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 294de6ca-5332-4c24-7867-08db250bd4a4
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 04:14:54.7661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcQBx1bew9fj0EvUx0Vk6NtDjrBWYxVxqru6tvnOuDM/5YWEeVtKxeg3UXjcek1zVRGrYub+TnQoRVIG6bzT/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8507
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
Cc: Juergen Gross <jgross@suse.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Xenia Ragiadakou <burzalodowa@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>,
 Roger Pau =?utf-8?B?TW9ubu+/vQ==?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 15, 2023 at 08:52:30AM +0800, Stefano Stabellini wrote:
> On Mon, 13 Mar 2023, Jan Beulich wrote:
> > On 12.03.2023 13:01, Huang Rui wrote:
> > > Xen PVH is the paravirtualized mode and takes advantage of hardware
> > > virtualization support when possible. It will using the hardware IOMMU
> > > support instead of xen-swiotlb, so disable swiotlb if current domain is
> > > Xen PVH.
> > 
> > But the kernel has no way (yet) to drive the IOMMU, so how can it get
> > away without resorting to swiotlb in certain cases (like I/O to an
> > address-restricted device)?
> 
> I think Ray meant that, thanks to the IOMMU setup by Xen, there is no
> need for swiotlb-xen in Dom0. Address translations are done by the IOMMU
> so we can use guest physical addresses instead of machine addresses for
> DMA. This is a similar case to Dom0 on ARM when the IOMMU is available
> (see include/xen/arm/swiotlb-xen.h:xen_swiotlb_detect, the corresponding
> case is XENFEAT_not_direct_mapped).

Hi Jan, sorry to late reply. We are using the native kernel amdgpu and ttm
driver on Dom0, amdgpu/ttm would like to use IOMMU to allocate coherent
buffers for userptr that map the user space memory to gpu access, however,
swiotlb doesn't support this. In other words, with swiotlb, we only can
handle the buffer page by page.

Thanks,
Ray

> 
> Jurgen, what do you think? Would you rather make xen_swiotlb_detect
> common between ARM and x86?
