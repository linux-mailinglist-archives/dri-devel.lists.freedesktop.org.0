Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 437FA60D909
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 04:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F368D10E2C7;
	Wed, 26 Oct 2022 02:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2063.outbound.protection.outlook.com [40.107.212.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F4E10E294;
 Wed, 26 Oct 2022 02:01:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8qS+10phLnz0xw3pBVWPRFyUF+TXm5pRX/zpeX2rmnTuJyshJZ7gTDfhRzZ42KCrUvONVtgfOVHAaBCPSW2+Hlf+w8Yjg5wZs7/oPjD9nX+PEaHRG8U7pyRenvCPrQFEs+/LiJm51UA68Ys3VN4gozmltNu8QGxbnuhejt33YaaA6e9hXi0kWts0YyQE6NbL9H0zXydm9SP7lDC41/Jq/sVwYl1bQ+lpLNmlbrs0f8pmKhwI0XKHaZMhjLhNkeEnrwZ434jgU5q7BDjbP+1/Hv7KJI1aTpvq6ewf7hah81+zck1+ekkPlqcwmh9wT4hvHjGNX/spHhXr690mgFxnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDoiSwBLEep3TlBJT66KM6dL5czo+5Jx8qM4cKOha0U=;
 b=eyCtZmrajB9Ie/SC1uBJAmaj0AP/ZYjV3VN14PnKs16SRTnaeQtlMo874tM80fwKFqaaiqUlBXnGBZ5Zo3Gcsu9JEppuHugvycgZ7+8mSaTuBsxD5t2QMW8xht8euE+WHeZ3sXju2/4Jn4vIOGCHKB1ju8RAXSM5Yc54WK+8IyAWKuzgCe6AsJhgEhYlALSGXvscdNJfQcqJ6OJNNAIHnKg9qj68RLQGAJ3vwud5Og58OZpinsEKqPy/YRyjOFGadjzQwufwQI1N9xX75AV17REbhqkdruVUZURoUi1eUAxZ1ICxJyixevnHvQuRAq/2xOw4urzGiy1Fm41eXLROvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDoiSwBLEep3TlBJT66KM6dL5czo+5Jx8qM4cKOha0U=;
 b=AYxkAISNJWd4l5Fxp19mP5U/sgivm1FwTPguywIbBAmHnsjSSYwic372J0NL+73iz9cpX61myKG5UDNPLJQTNTScu54sowZrsBM/y9moMi0kT/XJBRpk7L9fKDRyO9wWW3h+2yk50oib31kkpb23+xFD8sdDBXTNAvGq4EnPU9fqlxxLgeQzP0+eFYu+lOh3M2cZWJ6oy1zyQSvlWsUguPLfIxVVzFgt241J3krCSqManDcj2UFRURxGtrQVwcB4nqFuuLy77jCzEsghWn4qqpKREwcnF/A+FEP25HuqCfO5XnxlTe25XVRKAWm/bZq6+7d56JiBugNs1gNiZHc51Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by PH0PR12MB5449.namprd12.prod.outlook.com (2603:10b6:510:e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 02:01:17 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::6ed5:b1a6:b935:a4d8]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::6ed5:b1a6:b935:a4d8%7]) with mapi id 15.20.5723.034; Wed, 26 Oct 2022
 02:01:17 +0000
References: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
 <f36153fe-214c-2904-e155-ab9cee8a2a2c@kernel.org>
User-agent: mu4e 1.8.10; emacs 28.2
From: Alistair Popple <apopple@nvidia.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Subject: Re: [PATCH v2 0/8] Fix several device private page reference
 counting issues
Date: Wed, 26 Oct 2022 12:47:15 +1100
In-reply-to: <f36153fe-214c-2904-e155-ab9cee8a2a2c@kernel.org>
Message-ID: <8735bbuyvs.fsf@nvidia.com>
Content-Type: text/plain
X-ClientProxiedBy: SYYP282CA0017.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:b4::27) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|PH0PR12MB5449:EE_
X-MS-Office365-Filtering-Correlation-Id: bd0b2f76-67fb-47ca-9222-08dab6f5f83d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zizsxgbKimTyc6MxHTlDdgT1jxhWy5J5RXCqREvzVnkZyKBPoV10tlRT4y6rHE4pOHqWEU7+MKcaFFblyD0GmEBfLYgnPV6pGYYKfTd01tzifn2uEEiGu1D6muOGKJbbqN5oReoWyZJZuW8orMUWcSvYUvJj63EBMDSNMPOWGq2wMxzTHM4FGlAeARfySXkJhWsAJb2BmchjUYJbNfqn5H1QWQFLyJET6XdMOlD+NfeZ0g+0g+TdSu/XB7DwfXAsM4E+DCZfh3mayDz1ZNzTYReExoIO+5zHB8b4sFnWQpo3eEikGh5S/nrCEOhxBfTyd09RRAP2wo4VgsCP84DGgOPOCV23zvp549eJXiqFv2eoXYcLQpm2VeNSSvoL/83EL+S+MfG8Kv6OmtVyEjvL6ybv/0fQS2d3VU6Cyq6P+UiIg3vQLAw8qo9aCnGIJzuRcxf9Fg2iFAOfRSH1DzF70r9VSLVddQvcYgK/H/jghnwO41KGrf7CQxhb8i+Mg5EZu+Aaz1rxjci0RcUwwU6h18myD4pLjsEv+lpE1FF59+oS2vwXj4BEHiZfBxcTfxmvjgh1OAjZk+R/GnDW89q2lHeArh2B70Dom8deqxCdYiPsuaqmczJWLITrV4Sa8g0UGZsLNC/cTSmjc5mrpXnT9jxB60FCpVBccK/186BbTkAujhvkqyBvjKLFnV6iS5t1cuxJToUMMg+oCmxXcBWnxbhvdoQPQMLj2ECZGW2MVIoeGRj1HrZhPNZy9xhIfuHbMZOcyrTWTUtz8/37QpWM7pNjUU8Wc0mHI/q2DVp0xIU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199015)(6916009)(5660300002)(8936002)(54906003)(316002)(8676002)(26005)(66946007)(4326008)(66556008)(66476007)(6512007)(41300700001)(36756003)(6506007)(38100700002)(2906002)(2616005)(53546011)(83380400001)(86362001)(478600001)(6486002)(186003)(66899015)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W/KvJjU8Xcr3K9y5+iNEFd31gckHzYWsYMxNCUdew/EWdpGTmI6If0kROzhB?=
 =?us-ascii?Q?R3AsQ/0zp9ogDueMXJ/FWrgtbqVskTiX40UNpk/Kpjlik4sruTjvuLBFGiSn?=
 =?us-ascii?Q?FfHnFTBvh5EWGBqQo7NPGsWbl6Q0a/TLKQnf2TiWQRosrAD69iCbKlo1h28m?=
 =?us-ascii?Q?zJJoJjUKW1xEZI5So0bOABqP4lMWYnLlCQaoe5jaSi5OFZ/CLgsOpQ05wQYV?=
 =?us-ascii?Q?a1ZfsVgZbmJbBYN68g7gU2R9gitdS9aa5qcF2YKm0rJlBYUmnb+W3I6E+yh4?=
 =?us-ascii?Q?C1gD06YhdOL11MPBKFuPMQBGu+HBtsUFToIxO6gv5PA/6vQ9FJD8Sy8Dv0qa?=
 =?us-ascii?Q?P4q747BjJm1Uy3rlaCUMCweH6Q5YnLN8xim2HkA5QphSbB1S6U+tjG0/SW68?=
 =?us-ascii?Q?xGgfSWfMnrXce5dcO2cQsCMEA/4OqdnXBRQmDwI2qPRyO1GMWrG0ttRbF3VV?=
 =?us-ascii?Q?zonnzGaqEYqHCQW8n4s1TfHjTxmjgGH1/IiI+6xHy9KqNv81GTy9gt+iCyJj?=
 =?us-ascii?Q?7rp97dr21usS3RfwOQZJ4t6g0fdL/8bINxUutUJ17G+JNU5P2I55442tsDQx?=
 =?us-ascii?Q?b6B8og4QlRvbwpQFY8HH7APChOa17WEgPtpDwgSX1Bj0RoN1e8Judt3he6vE?=
 =?us-ascii?Q?EQvJTZj50uT2zEIXXrhzzusSJg82u9NPKuoMhKZnTJHRTFLz7aJAA7Ogkfxb?=
 =?us-ascii?Q?tR5aqC70eOygkh7DBjZeioHrrPDXIZMOdfZ+3cwYpP9TX7Iv5FHm4qMyb3yZ?=
 =?us-ascii?Q?0OhhRTAFLvKsmUpAfBRvF3wcZkLAaGrb6iEByYvVvuawoS/lXZ+SAgLHNOCE?=
 =?us-ascii?Q?5u8XAlGVDzVkdyg8PQ1a7JNe8CH61AL638FUXqt/DcTNWmyUHl5TJ6fYpFaV?=
 =?us-ascii?Q?UL2xR2n3eav/biNjZRKo0Ko1Kufv0KXAOFQp8HyO1TO9yxhX9W6ziOWKKAeL?=
 =?us-ascii?Q?TxfBRo0tDcWmPI6PrhPBmiCKQtVEuR96/Gt8y8EovMKaGNEF4+4+20FFS2kr?=
 =?us-ascii?Q?MZXhS120rABE7P/uRNMPrx/9e5kl4v9jNviwjOPBBI03XtS3HzsRjTQpzmQz?=
 =?us-ascii?Q?J9LfiK572nWPBw6IFGAQ/fiXfNAwq6WKLIY2t9VEu3d0x1DgjzFmh24TjHnu?=
 =?us-ascii?Q?jDAHe4aj0DQQtgXPp2WhxtmJmulW9TRUqlISmOIQ7k/owpJoRMTE8/HnID90?=
 =?us-ascii?Q?GXEkoMz9WCptFShtBjkj+yb8MTvbujbsvFFo/TIF7674oHGMPZUsn2LfKV4M?=
 =?us-ascii?Q?zZYbCRsDMCR5i9S9aU/uuCmo0BqHgGh1kskHWmwuRgkxTjGk42jJHhnNRjHg?=
 =?us-ascii?Q?TYXAvB2NBTTvTjlRRFfZcAFDrnL9pNsvSw4v5hyvKWgrVh2qi7T9dL2ft0Gp?=
 =?us-ascii?Q?HrTq+ySpaxlAeUTxgFaNaO+pgagM97BVMOLCkE5u8NZnyQj5sKX/y5tbLNJm?=
 =?us-ascii?Q?K6UtqvBuIlg8WiQb/AmtRBn58XCUnP4u4aWcPEKAvI5nsKK7/QEGb+YlL8WC?=
 =?us-ascii?Q?Kxj79ObVRrIzarqnSgHVvmZqUkInqGk9o2M3ncWB4w1A2PIs3/J57s5smd9E?=
 =?us-ascii?Q?roqUFjQjMOyQK/jxcRdrO69aE4A01w2wkpWh3irj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0b2f76-67fb-47ca-9222-08dab6f5f83d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 02:01:17.5936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1E0MOgD32ewC5kgOK/uMg5IX5cNHGnXPfKqXFSQd6E2QOn2UIwnVTABKgvKrlX/Sy8og1+WeUyyeUTtaq0LHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5449
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
Cc: nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


"Vlastimil Babka (SUSE)" <vbabka@kernel.org> writes:

> On 9/28/22 14:01, Alistair Popple wrote:
>> This series aims to fix a number of page reference counting issues in
>> drivers dealing with device private ZONE_DEVICE pages. These result in
>> use-after-free type bugs, either from accessing a struct page which no
>> longer exists because it has been removed or accessing fields within the
>> struct page which are no longer valid because the page has been freed.
>>
>> During normal usage it is unlikely these will cause any problems. However
>> without these fixes it is possible to crash the kernel from userspace.
>> These crashes can be triggered either by unloading the kernel module or
>> unbinding the device from the driver prior to a userspace task exiting. In
>> modules such as Nouveau it is also possible to trigger some of these issues
>> by explicitly closing the device file-descriptor prior to the task exiting
>> and then accessing device private memory.
>
> Hi, as this series was noticed to create a CVE [1], do you think a stable
> backport is warranted? I think the "It is possible to launch the attack
> remotely." in [1] is incorrect though, right?

Right, I don't see how this could be exploited remotely. And I'm pretty
sure you need root as well because in practice the pgmap needs to be
freed, and for Nouveau at least that only happens on device removal.

> It looks to me that patch 1 would be needed since the CONFIG_DEVICE_PRIVATE
> introduction, while the following few only to kernels with 27674ef6c73f
> (probably not so critical as that includes no LTS)?

Patch 3 already has a fixes tag for 27674ef6c73f. Patch 1 would need to
go back to CONFIG_DEVICE_PRIVATE introduction. I think patches 4-8 would
also need to go back to introduction of CONFIG_DEVICE_PRIVATE, but there
isn't as much impact there and they would be harder to backport I think.
Without them device removal can loop indefinitely in kernel mode (if
patch 3 is present or the kernel is older than 27674ef6c73f).

 - Alistair

> Thanks,
> Vlastimil
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2022-3523
>
>> This involves some minor changes to both PowerPC and AMD GPU code.
>> Unfortunately I lack hardware to test either of those so any help there
>> would be appreciated. The changes mimic what is done in for both Nouveau
>> and hmm-tests though so I doubt they will cause problems.
>>
>> To: Andrew Morton <akpm@linux-foundation.org>
>> To: linux-mm@kvack.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: amd-gfx@lists.freedesktop.org
>> Cc: nouveau@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org
>>
>> Alistair Popple (8):
>>   mm/memory.c: Fix race when faulting a device private page
>>   mm: Free device private pages have zero refcount
>>   mm/memremap.c: Take a pgmap reference on page allocation
>>   mm/migrate_device.c: Refactor migrate_vma and migrate_deivce_coherent_page()
>>   mm/migrate_device.c: Add migrate_device_range()
>>   nouveau/dmem: Refactor nouveau_dmem_fault_copy_one()
>>   nouveau/dmem: Evict device private memory during release
>>   hmm-tests: Add test for migrate_device_range()
>>
>>  arch/powerpc/kvm/book3s_hv_uvmem.c       |  17 +-
>>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  19 +-
>>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   2 +-
>>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c     |  11 +-
>>  drivers/gpu/drm/nouveau/nouveau_dmem.c   | 108 +++++++----
>>  include/linux/memremap.h                 |   1 +-
>>  include/linux/migrate.h                  |  15 ++-
>>  lib/test_hmm.c                           | 129 ++++++++++---
>>  lib/test_hmm_uapi.h                      |   1 +-
>>  mm/memory.c                              |  16 +-
>>  mm/memremap.c                            |  30 ++-
>>  mm/migrate.c                             |  34 +--
>>  mm/migrate_device.c                      | 239 +++++++++++++++++-------
>>  mm/page_alloc.c                          |   8 +-
>>  tools/testing/selftests/vm/hmm-tests.c   |  49 +++++-
>>  15 files changed, 516 insertions(+), 163 deletions(-)
>>
>> base-commit: 088b8aa537c2c767765f1c19b555f21ffe555786
