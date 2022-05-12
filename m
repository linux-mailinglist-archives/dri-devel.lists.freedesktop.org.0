Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EF45242EF
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 04:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD8410FEF5;
	Thu, 12 May 2022 02:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF6E10FD9C;
 Thu, 12 May 2022 02:57:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoOUnNAcq13YsTuP3sNLF5JofphHe8u+VypkCnuDuIjcY/EtNh88Wg5q7dwilXCDz0Dq98g37MBS5DPLgvX7S1la+jhXFmzQXCMZCMIzwfgFsNsRfxl7GD07HHMC/WnLeNLlQDKrSdGnhH+3C/w8cn6VTYHeOAkaCkM+HCbPZgNiDCWwVm5DG/wOgUceVn9G1b3AEZtPsIhiWKyIuIpK/Jl4Z/Kz+B8fEZEBRJzLmsi2kMPaXsZdv/vry3FAKp6aV3q5JBUiEe/jUWqxWUOua4YEl96a9lJuvLr/nghLtnc9Ztqe/gOiBTieewhOw6EqfOpjVBvmW79SPbNRzyirAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaexaYEwujO48q287Trhj9X5PhJm400sAtz9sET7r04=;
 b=XrQulxvCOz1fVXdsm8CesgSRl5TVHvtI0rRZztOx+EoHCYMC2V0z0cygI+Vc3wtH8En30CiGdXZbOW9Vn6xTVOn6zUoO4XEHTNpILxAYgLrG3KFC2bZtLBfWoUF+2pHAuT3BrcqbE4N4rL6rhtkC5MmpobjQA3+xuVG4WCI0oQ34MvyZ1piIcchXo2FcyJ/HC2nH/33UHZyvMsYkpqZAvkzjSJaWG/zhcsPEhdsZucM2WVEDAMrrtiKaMrs4vLZHNwcgxCLBvRZufNstcksl8E5r8l7PTUu8itjtlEffxEbU1tEoXVzfjgE7cCaEtnvVuscfcnVrngqUFAV8Yx4WUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaexaYEwujO48q287Trhj9X5PhJm400sAtz9sET7r04=;
 b=Rofs7RfNCoPVwBeQxAdWQicegq4pTvb5UXy3ClJdkeXoWk02a/aZrvo3/0GL8nmY5MK5sruJ63t8CJl0jYXkxuCGNN9GBIfzGsnED9augUWplwwKYLSqwTuBonVNs7BYINXJ6zr8lDZwzxPLzd/kZeyzdJmgV3wNhjzc150Tp65e9QXqiBcvje1m/7TtmKt8LRYeb6HESzttUpLLJhNmNFuyeVDGwPB6IPZt0jp+UWBfnFy7Gccd4UrCzL9uP36vVtuWq4uZcxMYwzWcXdTLZ1QD8D51su9IEhfSs9bJgnmPAGGTtCI3fZdkPBJQBgP2c2W3JkkhL8jeIZURTgRUDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM6PR12MB3836.namprd12.prod.outlook.com (2603:10b6:5:1c3::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Thu, 12 May
 2022 02:57:38 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::2d17:b68a:e101:4c18]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::2d17:b68a:e101:4c18%6]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 02:57:38 +0000
References: <20220505213438.25064-1-alex.sierra@amd.com>
 <20220505213438.25064-5-alex.sierra@amd.com>
 <SN6PR12MB27173F2F37294D6DDBC3457CFDC29@SN6PR12MB2717.namprd12.prod.outlook.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: "Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com>
Subject: Re: [PATCH v1 04/15] mm: add device coherent checker to remove
 migration pte
Date: Thu, 12 May 2022 12:39:16 +1000
In-reply-to: <SN6PR12MB27173F2F37294D6DDBC3457CFDC29@SN6PR12MB2717.namprd12.prod.outlook.com>
Message-ID: <87fslfqwyo.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0259.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::24) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73d153d8-e246-41f9-25a6-08da33c32c47
X-MS-TrafficTypeDiagnostic: DM6PR12MB3836:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3836F69B82E47FB2C1FE9E78DFCB9@DM6PR12MB3836.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w/pPmjDfbxu3ft4PrCPoAJpYKVUdyoKgAATBVvg8dKkLJYlaujobsFJKG3LbbYmlgXHh2CJIXatw0lNp6aOsl6h4+qyFRGO/TSDV8TlU3FN5949HdC9BAc3xFHT2kusVtqc1boldRPSImsZ0L38oOKG6k2fgxvpoUOc4Z6t35b6rpvGS/YNTS75kAAr15nRt6CeCxH8Xr4l3ZxZhsLZqQEtl3lCpiSbpuXIrqFLuAr5fu3v0Iw3gBmO0ReAhZsh1iHvYTJtLrJh8aZ/nf0sVQA1TNrlvQovgkB6UaOEXsRBLS9lpF3Cee1tefi6eIElX51s7zmB9k1b+F7pfQngKsgMyleyojW41u8HaFSr+L3GpU/llx3LPz0YeKgLjZbpFPDOB4NzxoMgSs0wpw41+VAYKO1Ma+ef1RKeoC78N24lSRBQsfmSe1j+U5dVVzYVeZAMiilnBue20lIEyfdmxzvyTLA0rOjRM7vXxzEwo1QGKh7N1lGanSUrrxXKWfrfDHCZKQ1WU3GkpIrHVR2EQLRWfEebAt3lhyqNeGsURuMRPm7XGoBafd2qoEoRV6n985LXi4L3rgnADy5ADp+AQ0ejpr48ERSwmu9CSjsROwcFceBV5VKFvNY7G/25u8IpJOXkd4ksivf/k/XZYin7Hof9d+zDKJdxFgZhNKYQ2a3TaTyAg8OhI+YqbDQlVIqXeMYnydP69UJ90xgz9dm9I2hn1KY6Zkyx4WpQ/El2lrcs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(66476007)(6486002)(66946007)(54906003)(508600001)(4326008)(8676002)(66556008)(6506007)(6916009)(6512007)(26005)(9686003)(6666004)(38100700002)(86362001)(2906002)(8936002)(316002)(186003)(5660300002)(83380400001)(7416002)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P+O5kbRwh0tJFrP7gNfNVaD/xRBVVkGEHYZjDJPhxgqRkuQ3IrTj9QY2UkC3?=
 =?us-ascii?Q?ZKuqN4kNiSiNet0yMJBBGapBnIj0LUHHBcEBHvO3kufYljOqyjpHM5zDNJf6?=
 =?us-ascii?Q?sx3nU0wsw3A4Zfu6pYeAQctjqxk7Y4ColL6qTvbSaYGk7P1iNc565qVjBLV+?=
 =?us-ascii?Q?hjsQ2bgeX9u25bTAFOXEudAjtvJqMjDvwab5q4+N1jbyyKxXI7SiZhplAWOQ?=
 =?us-ascii?Q?1F5rzp3jSuJxjFwY160MS2Qu/oCylmkAM3gTFU0OdYb1qzIyPY5thmdUK8fM?=
 =?us-ascii?Q?zaTXoO9uV5aeJp2D17KBTQ53dHmqTlDMOFejuMrzivyiBG14PO7g79CkDJcD?=
 =?us-ascii?Q?THYOIHWuDRwwBEnvT66wYbhkl4ngwGij9Pv8ilu3XKWBLjgUR4QGH03IitqB?=
 =?us-ascii?Q?dV0ODFNpBItkz8DHCngsfFs5QCTKKbpLtr9vF1d+ABNaQbK16HZLO9bcvwH5?=
 =?us-ascii?Q?+eWBCzM0SkNpACRV2BbXIjw5oqldkwHPRNgUVr1OcDWPClVkbsr5AnYAW4VC?=
 =?us-ascii?Q?q+K+NI/K3+S8UkHRiWAALLKyqdCKvYErtRgsQ9yVsbKsDNUOeN7GFnFqod0J?=
 =?us-ascii?Q?gXKXsiUYCINDYK21Esa+lbkNgWX2k2dovh9e15Tcw+YlTrbv6oamyuFOt1oO?=
 =?us-ascii?Q?Z3A5CUsVshnUKzQc+zYFVOSCD15L57E9RvtW35hhZTqXSgizVfLyVO6qBeBV?=
 =?us-ascii?Q?daQauYhBEcPvmetHI99O6hCA5/rwShWqYzIIk4YfzBw+3IeCeF6+6kFAIMNq?=
 =?us-ascii?Q?p1MOlsllQUWsF3xq4EPXhCsoBm8SSA/HLFUXQrFng0BHlb4C5P8uPaAsmCg6?=
 =?us-ascii?Q?sTbnLPqhUQGVfUv0BHzfFdjYenbtbrMgHZrRyAgyPHA/XCxEEClVrzXKX3Lf?=
 =?us-ascii?Q?Y7gc90G0CXbFgYAuoRij/RMRjKlbJNapxpGhGUwvxkRVggrbM06TIu5f/rtc?=
 =?us-ascii?Q?glQJZlnTvAI5JE8K2fy0oKIzwb17dNitOBcWVuZTKwwoQU2wg+X4Vp9iTYVY?=
 =?us-ascii?Q?EysTTnNsnZM3uN6G61zdSQ6iXzqvreW/1wmGd6FeQLKvRxxIZK8qhItlqXpN?=
 =?us-ascii?Q?CgrU2/WbDYh3XE8M+RRbtfS0F8/Al8rEaZCVGChfvuhVnRbV8mwo9pJPBgsT?=
 =?us-ascii?Q?CxjyhgRtYNz3QaXDD7DR9n40VpNovGu67fssyXjSnuofKETWiBDBmdlfs9De?=
 =?us-ascii?Q?zG3r6mxVzy6iCsnVT/OLJmESXZykLHo8F2QGHAexFA6njIeNriKv7ou0faCZ?=
 =?us-ascii?Q?lhFRjYP2+aNX2OOO8a2qLED7W87qHBf9ZP8GJZ7LuZxV2tA/EXrLSCXtCu/B?=
 =?us-ascii?Q?rC4jCw6mH9RnkMQ9Ls/3UTTFb1jU6mO6M2NmCDq4RLV/ZcP2tTHjL59frp5A?=
 =?us-ascii?Q?/Ly1zY7KE6311RKtXjuqMt5ydTVUFyvrLs6sNT8X0KTmLjA7dE/Eut99Yi11?=
 =?us-ascii?Q?RCA1C6MqNZcpGfNza2IiqdORKPFfxBagpIVUrm1QPCuQnKvYMB7LHrZEYgNI?=
 =?us-ascii?Q?RSUfp9Jfv5fJ88NKkB8VmzjdrsPRu9AP8tBX/+9UqZ14GOmRbmYiVuYAfuPM?=
 =?us-ascii?Q?GGWDzT014xZxg8IF3J1YQ7S1NXPGWRXmM1LxEXm9y+K9HVszvttRkPPnUThP?=
 =?us-ascii?Q?1yfEjkJADdaTw00DL1wIQW3GJAkXcm/vYM7XIuIgaEXmTUf2e4dPdzGQK0dj?=
 =?us-ascii?Q?wxZy9t1s2PJCIQs9zm8gk+6RsyiPkmtNXoVC4OlRAFW/FGw11eoS0Os4WOZg?=
 =?us-ascii?Q?0BvEjoRmLg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d153d8-e246-41f9-25a6-08da33c32c47
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 02:57:38.4908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qDQ2HV38/aF3MMNFuDDqDNoSUEBtv9J2drnDa+Z7zhbMM1neZw5lh1hApa91kri7xq57Kr2HVfQCoBj7Vsr5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3836
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
Cc: "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "david@redhat.com" <david@redhat.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "willy@infradead.org" <willy@infradead.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "hch@lst.de" <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


"Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com> writes:

> @apopple@nvidia.com Could you please check this patch? It's somehow related to migrate_device_page() for long term device coherent pages.
>
> Regards,
> Alex Sierra
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex
>> Sierra
>> Sent: Thursday, May 5, 2022 4:34 PM
>> To: jgg@nvidia.com
>> Cc: rcampbell@nvidia.com; willy@infradead.org; david@redhat.com;
>> Kuehling, Felix <Felix.Kuehling@amd.com>; apopple@nvidia.com; amd-
>> gfx@lists.freedesktop.org; linux-xfs@vger.kernel.org; linux-mm@kvack.org;
>> jglisse@redhat.com; dri-devel@lists.freedesktop.org; akpm@linux-
>> foundation.org; linux-ext4@vger.kernel.org; hch@lst.de
>> Subject: [PATCH v1 04/15] mm: add device coherent checker to remove
>> migration pte
>>
>> During remove_migration_pte(), entries for device coherent type pages that
>> were not created through special migration ptes, ignore _PAGE_RW flag. This
>> path can be found at migrate_device_page(), where valid vma is not
>> required. In this case, migrate_vma_collect_pmd() is not called and special
>> migration ptes are not set.

It's true that we don't call migrate_vma_collect_pmd() for
migrate_device_page(), but this doesn't imply migration entries are not
created. We still call migrate_vma_unmap() which calls try_to_migrate()
to install migration entries.

When we have a vma migrate_vma_collect_pmd() is a fast path for the
common case a page is only mapped once. So migrate_vma_collect_pmd()
should fairly closely match try_to_migrate_one(). I did experiment
locally with removing the fast path to simplify the code, but it does
provide a meaningful performance improvement so I abandoned it.

I think you're running into the problem addressed by
https://lkml.kernel.org/r/20211018045247.3128058-1-apopple@nvidia.com
but for DEVICE_COHERENT pages.

Based on that I think the approach below is wrong. You should update
try_to_migrate_one() to deal with DEVICE_COHERENT pages. It would make
sense to do that as part of patch 1 in this series.

The problem is that try_to_migrate_one() assumes folio_is_zone_device()
implies it is a DEVICE_PRIVATE page due to the check in
try_to_migrate().

>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> ---
>>  mm/migrate.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/migrate.c b/mm/migrate.c index
>> 6c31ee1e1c9b..e18ddee56f37 100644
>> --- a/mm/migrate.c
>> +++ b/mm/migrate.c
>> @@ -206,7 +206,8 @@ static bool remove_migration_pte(struct folio *folio,
>>  		 * Recheck VMA as permissions can change since migration
>> started
>>  		 */
>>  		entry = pte_to_swp_entry(*pvmw.pte);
>> -		if (is_writable_migration_entry(entry))
>> +		if (is_writable_migration_entry(entry) ||
>> +		    is_device_coherent_page(pfn_to_page(pvmw.pfn)))
>>  			pte = maybe_mkwrite(pte, vma);
>>  		else if (pte_swp_uffd_wp(*pvmw.pte))
>>  			pte = pte_mkuffd_wp(pte);
>> --
>> 2.32.0
