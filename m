Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C24F4B74BC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 20:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC7110E534;
	Tue, 15 Feb 2022 19:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2058.outbound.protection.outlook.com [40.107.96.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FEE10E534;
 Tue, 15 Feb 2022 19:41:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBBPb9HfWDLSRL6WC1DZ+qGPao2AqHtf2CyxYD3H35NSze2R7XzD84auS9ymffCNN6oClrfkuCe2lD5LZ58mADs9077wX4fRsOBKSjsr/UZT3oeUjcm2r1geSzaVkHszo8jtxvzqv6h4wWZ2pyrII++lNqyg1Y4iL0CSHvbaQVMsnPg6pMyZN7tmpCOO8yzJJQvLbqTMqGoZBWlrVviFe+0g4VZdDC3NVaf0z9LYIBIhCru8cNfKkVVabmRobK0yDq2B899Qls7RFVtyLWFukeYy1R/grV4AS9QOd75sXGuxi59Z4x1bRYCC7mnyBVdY9k/XN9uX7Sp8/WUgAqrwew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJbz0ZCca5NKSaM7Pcjkp4iM3CTX8usMCou5X9TauKU=;
 b=edaKARbnaGx9snBIKR1hNic4T5Xbyi0I9vE11+h3gr1tIQuCiyWcCFU4AXG51yXfDp5cN85RGJooYpDe4rqVj2MmWa5cvnsNeg87Zcjr5c7c77BePyLrSMOymni12RNgAjoM4/voyiJbLNFXvWKnxV7uqSYkb5bEQ2Yfpi5txHZJoOVTJFSW8yr35d3ZQB0B/xvfuezVNN1Hi82NPpcTSCEyF5Gy0+SdX3X608Vdpkrk1ArQ5/BhPIRt/8XNKxaV1HZAikdAEu9EXWpvwzBiso1ptpTTDz3RXBtTHeaMuGKkcFMvl4XuTlBGsALSEmvUDZBBLGkEghLdr56KDJdWvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJbz0ZCca5NKSaM7Pcjkp4iM3CTX8usMCou5X9TauKU=;
 b=OiyUaUfcTnAajTj95BFEMVGGsNDMBk2nOVQrU6REo26aHz1S0wibb3Hc4LXA01JB3JFMXc7AYisKMlSy/3dFS3Ej+jacjh4NScZ1MdT87ffpr5Pc5/zYi/IPJ4XWT7Odp44q2ZIHWzSNwpBGma0MQbVBTFNeuXSSu0o26Ox5/WOw6dbB8D8vdYqFdEv7TdujCjj6l95Uv4PvHlYLtmYfIopCMlNu5YtSu2Afyti01XxiaSBIOIApjBJK3JQTMCO7Yuy5wyj7NVA8D4R2FM7r0BdhdAnuf7qZM1zBVW9zOaryhvka1ZCRkJ0TFeYYxjHUKZOGNyNdqSHiR2mlDkfNDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by MN2PR12MB3392.namprd12.prod.outlook.com (2603:10b6:208:cb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Tue, 15 Feb
 2022 19:41:09 +0000
Received: from CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::287d:b5f6:ed76:64ba]) by CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::287d:b5f6:ed76:64ba%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 19:41:08 +0000
Date: Tue, 15 Feb 2022 15:41:07 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Message-ID: <20220215194107.GZ4160@nvidia.com>
References: <20220201154901.7921-1-alex.sierra@amd.com>
 <20220201154901.7921-2-alex.sierra@amd.com>
 <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <f2af73c1-396b-168f-7f86-eb10b3b68a26@redhat.com>
 <a24d82d9-daf9-fa1a-8b9d-5db7fe10655e@amd.com>
 <078dd84e-ebbc-5c89-0407-f5ecc2ca3ebf@redhat.com>
 <20220215144524.GR4160@nvidia.com> <20220215183209.GA24409@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215183209.GA24409@lst.de>
X-ClientProxiedBy: BL0PR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:208:2d::46) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce9ed6c9-e468-44c2-58eb-08d9f0bb1d04
X-MS-TrafficTypeDiagnostic: MN2PR12MB3392:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3392684A8A92FAB6B931B772C2349@MN2PR12MB3392.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IgqSA+qiXqF3nXUXvxDONwDlh6n3fWb2g4mSNNCpUn5eRRmt9WFHaTuO5omMBHcs6TkA3sIsmh31sUk9IgRp/n2EYJevTDJGB+416swtnNVL0IOopV9AcFtQENdDyN+KdF8ls8C1MCurOYXI2xRTmRUjQEFjZ8cNfXNSgUrOcE96wWScs5YFBdhGlhqC0JhdPodmHprWchc06W9r6HnXd1jkq8Cu8RQTSzOnmQnPn9VbaLWlgFlq/fOM1tjIv0SmQ2xzJ0+ASKVth0vQontjfWNupyLmmsIyn+U6HfV4OtmxesOrrAGoACNw/ytfB5i33JkfiUEIcPvfEdEFEhZvLJAFTYzz9eBJa09Ne2CfsDLpNuJF1JNPxmeUUxZ/N3jHIs7dpLird8GYCsk0y8gBkih3ycDYxv9eOqI/tXpzVbEn6MZ/NTyjkSEIsimSoCm7ViFM4mgw3yVF7gYneXrv+a0FM8Ye6sHi0VAS3RkPzbzk7mkkUT/7QA6AtXKmG8KV96K0AF9gEI4x27InZyA/ypDNNsHamrHXDgmdheTtqm5JfZvgLdtYyDVwJgR2KQi0533gIuvSXYGywTqbby6xF05wcCpYjNyYf4/0h0PongwKpIAvKgaP0nKbfff5IIAyH9rKJKOwsSpWCimlT7+ETg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(6506007)(6512007)(1076003)(2616005)(508600001)(66946007)(5660300002)(54906003)(38100700002)(6916009)(33656002)(4744005)(7416002)(6486002)(66476007)(36756003)(8936002)(316002)(4326008)(86362001)(8676002)(66556008)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SiapKLedQeE9EysQ6XrDY/lsLa3JvPcxTNb7eas6QVYwk6akpt7qXDeQ0gB/?=
 =?us-ascii?Q?mBuHyoplPSAMubwbqeLt4zlDoN0V9ZM+J0DwTUXndPvJ/TCOiGd5TMoULbID?=
 =?us-ascii?Q?kYB4QysaBQz7J/Bav4On1/EZpaMTlJpS4BWGBds1YZNeZBXJMY768AL+Xd7y?=
 =?us-ascii?Q?ugHWkQaCmmULUZORiipP9zBwomF+pL7eZNiF0uQI3uRgKO0HHkd2dErvGvpP?=
 =?us-ascii?Q?+6lWWdDaluzI3ibs22qaoRqP4aLZ4OWPeSbayTg8oUaqgsh9Pbi/e1FRo2/P?=
 =?us-ascii?Q?uNRJB3NGaPhBluW3FXbDliM5jkxI8MMwGxxEX0wuAAdtMpI6RV4eKI5zeGUZ?=
 =?us-ascii?Q?EnOFBuaS3rVaKODhkxh7qhIs4hkLBrWQZn16wBFguiroIIJgrN60ByXldIHs?=
 =?us-ascii?Q?C7Ps5qRhATKgdF2av4UByZcIz25/0VwA0TbnP9yngyM+svsWAu+hEDamjmzd?=
 =?us-ascii?Q?iLprd07sHLSxpAixvanvobiNc9n3gcKzUUgwTiVK3kvs1ozg2joPp9BA1Cxj?=
 =?us-ascii?Q?iPRWpKs4sLi8EFaC/p43dlZmJV3ZqEM71VcvzJ4kEc2+yb+a9B2skaASC+wQ?=
 =?us-ascii?Q?6zKHK9jjU4RsFPbDfHqv3dypCZ8orv58t5aTOu2LAAt4Xfaly4OQlgCc2Ixp?=
 =?us-ascii?Q?8fBMYo7plv6CVztLjQIcEJG2kK88Nh9yAfPjtb3chdIdc/ccN1L1fj8JVqjN?=
 =?us-ascii?Q?vedkYOnloY5+l1v6ZPE5zK3/suXzQf5aFvULhJEZtx/js6yozDynszk6n2jb?=
 =?us-ascii?Q?YOUAN/kt9Ejb/WkmdcKtldNR0KoaEap1lu57jnIfq4+FEAZ/PfU/CzPndrPq?=
 =?us-ascii?Q?1Thneji1+XPkjpvZh2bwHoSK0P9RJgFmqeT1tFAbTHG94T2wIZkCYd2uk3Yl?=
 =?us-ascii?Q?yfzX+LtHGRt9p8JByhcMbtv785HAcAflKetEr50B0utqCHNSNmcrFpF/TWVl?=
 =?us-ascii?Q?yB9zlE1+LEKTlStvbfn5dPj+Nx332FYq8P6yi+oIojIiuTi7WpyK9viH7n94?=
 =?us-ascii?Q?cVdItTxXXhJb5q3eoebn6mWtvrDGnbxuzkBCtqUDxRIm/Bxr/rsa1Vt5KBVH?=
 =?us-ascii?Q?2ul1RZmoED106VK7SYSgi13+56yZx07GH1tIkiwE6hxByFlNIjWtYQZkStzF?=
 =?us-ascii?Q?JUSiQDSreoeskZxWrxS3UMbzYVPur7LYZH5admzumKQo/RVqa81lqEHQuolA?=
 =?us-ascii?Q?zzj4ppsmoKnU7xJvpBNLbOew1sknHEajXqMez14/MbeR4/kkdZg7IcFnkzQC?=
 =?us-ascii?Q?73RLlG17XegvrgwmC498yfhwcYLyqIoTUSDaVIJkJoRmf/4+CDrPx6/LR38R?=
 =?us-ascii?Q?z1w5Aw02vT888VBjfOJzHBT+d/m/jPPRcX21ht9NFLYog5EsSbgfxP8NulSU?=
 =?us-ascii?Q?5oyXemPc2xyo3IbozwwpSlN3Kf04Kw0+AlxQNsbU9TwfsdKAZHjbuI908O5t?=
 =?us-ascii?Q?uM1y8VLgTXLUTCAxrG/7NMBeInVpW9/FFERP2sNZ5geUTRtiRxKaB3UWx8P+?=
 =?us-ascii?Q?rubt+G86FzYAr26OK0+TKCKWTxYyitFs85b8Aw97b8wKr2piF8imNSXKD7dj?=
 =?us-ascii?Q?5AjdeiMZoDez3JFsTvU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9ed6c9-e468-44c2-58eb-08d9f0bb1d04
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 19:41:08.8055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebfX0zdAcAyLd5D0mp7ojeMRgTcF6hXiIlUekifakEADrQqGmK/LCkAdmMmx9XXW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3392
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
 willy@infradead.org, David Hildenbrand <david@redhat.com>,
 Felix Kuehling <felix.kuehling@amd.com>, apopple@nvidia.com,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 15, 2022 at 07:32:09PM +0100, Christoph Hellwig wrote:
> On Tue, Feb 15, 2022 at 10:45:24AM -0400, Jason Gunthorpe wrote:
> > > Do you know if DEVICE_GENERIC pages would end up as PageAnon()? My
> > > assumption was that they would be part of a special mapping.
> > 
> > We need to stop using the special PTEs and VMAs for things that have a
> > struct page. This is a mistake DAX created that must be undone.
> 
> Yes, we'll get to it.  Maybe we can do it for the non-DAX devmap
> ptes first given that DAX is more complicated.

Probably, I think we can check the page->pgmap type to tell the
difference.

I'm not sure how the DEVICE_GENERIC can work without this, as DAX was
made safe by using the unmap_mapping_range(), which won't work
here. Is there some other trick being used to keep track of references
inside the AMD driver?

Jason
