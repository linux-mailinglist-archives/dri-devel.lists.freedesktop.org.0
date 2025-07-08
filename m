Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C84AFCE19
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 16:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A5110E665;
	Tue,  8 Jul 2025 14:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="M+YCwN1Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C27910E665;
 Tue,  8 Jul 2025 14:46:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4k2S/nCn2FcbCG84p67z0TiLxZjdC35pTRHPmGwFACGvLhf2QvjBGy15zYoB9K3LVIXBtCSHIshvKIRuVcMxsio8cz1m4xRLIByv4S5slugIK7XxqCsml/nLSRC70byC2GqP+nBXejmglK2JgvhpkK5Yxr/T1cXKkmA88NvaMsBykH8Z3LnD0O0NvpK7t/6cSfoFy8QMfWcXdjG6cK62LZM7ChvuE92WHL1cWlbZaRNn2Gzhjx7d8VWcbfAi3ZLV8LaeXwMCBzrVVdpNRckEkV7UbDAejwr5aP+D9I3WAAo8xrNx4NLsIFllZ/UTMe1YbWvPKCKLULRQuNgod+unA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woipq0b1rHVB/0TP4Xs5/lqECq6jA/bsT+EtV2kxB40=;
 b=i1lNLnBkxzZGsc7vWbPeULq2dHPKgYQvuy5jLZZvxhTvQXi4/KsBkL6Ed9TG/qgev/gSZpD4+nlmBIRBdnUnJGP/IUL5gGD0UkwjvVusDsEQxzDREriRCK9Z+i/9kzOq4CN+FFoGAR8+A1EXMTyGxnNhRqNS8PJFuKd4PZF3XqERLs5VMSSCaSvyWZotMs06lZsMoHnx/fwIm/fYmD/oTERaNDUkAX6aM95YRm9Tv5GSTDZPZM6ZzbaedNw6FxiKzscvnJhxfds44c1jLC3+nkCGYVhOcyKjAwQEYBoQ8jwMvjx39jgqCtR/mrrGC7OlJ3Zs0hzIM9H7ZR19DeDtbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woipq0b1rHVB/0TP4Xs5/lqECq6jA/bsT+EtV2kxB40=;
 b=M+YCwN1YYmXpqaCI5/31Zz7PlFWTgOopd6lHQbN69dyDuyfY4HKEFWYSGWMKMLOr0+qNjysp5lnscLUjnnFvgrVDuFuT/ViAVZ43KT8QmweF8Dv0JVnz3JjsZzjfkCoxKMdcy7sSJqbO5ha3ID/xsbFwfXup76cn79IueBjmtOCUvUXajr3Y2xdyId1pUHqk/40gJha6XkxAN+eCzDyYLSMB5f8ykhyVy0xly/Ox8lxC1acCUiDSxJJQt45rbieZrf7lOc5IGdQtwWK6zuK1hzNOqq0/F7YKnFwbaK8YUrz6rD7qTt8SP8ViJnJP4rDGcMwm3pzv04HX/LipQTsbUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA1PR12MB6797.namprd12.prod.outlook.com (2603:10b6:806:259::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 8 Jul
 2025 14:46:27 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%6]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 14:46:27 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jane Chu <jane.chu@oracle.com>, Alistair Popple <apopple@nvidia.com>,
 Donet Tom <donettom@linux.ibm.com>
Subject: Re: [RFC 08/11] mm/thp: add split during migration support
Date: Tue, 08 Jul 2025 10:46:24 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <CA01F061-79D7-4957-8D58-ED019558C55C@nvidia.com>
In-Reply-To: <fd22621c-ad89-4ae2-bdee-b0ec6a828059@redhat.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
 <20250306044239.3874247-9-balbirs@nvidia.com>
 <fd22621c-ad89-4ae2-bdee-b0ec6a828059@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0404.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::19) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA1PR12MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c57f276-afef-4643-9141-08ddbe2e37b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1JtvftUMHLkV+0JIedCCxmWRYo6I1urOjvhmz5TnQK4bZCqqDWGmawvnmPfR?=
 =?us-ascii?Q?EsQ6qcMoExFCF7vpj5KZrKa+FN292kQ7Agt+YFfzsC3Gywc0LaEixIqVDEgy?=
 =?us-ascii?Q?HPMhNlzWP/l5XGgAt23/FEWtMYS7OWs1a9ZRvo7T1yS+N/KNjPllfCr5hX2j?=
 =?us-ascii?Q?pTg/v+K5MXbqr01Q84gZe/nUTr/ZWv9rZFskBtKybMSk04iuNsTM/39PQyxa?=
 =?us-ascii?Q?EejQKTidn+4ZwUcl5pxDRUep1p50dVCX1xD+2cB0w2ObkGIOb+Pw4iu7XKLA?=
 =?us-ascii?Q?Y0iNqZVHJalxvTToUe64h9q+sYOJQ+8mZzJybE54Wp1F2D6Tvj4dE+oA9pip?=
 =?us-ascii?Q?mcjyOT5aEak7d3KQ7eA9L9fWYmNnCYdPkYgFVAiJZvnUOhJM9I+A8GKKfX0E?=
 =?us-ascii?Q?AzBTgMYuFBqsfbDExk2ULSj/0ry78rB5cz/oX2zDQQ1XaE5XyHAjBYrZBoND?=
 =?us-ascii?Q?1rguBL+BHAgvGdse7+fG00lYKomy+wzVhZxnDD0MdD9wBFbYZraHX9QZu57/?=
 =?us-ascii?Q?1d7AkDlEZ1WFd2Ym+1I7ZYYDHLQU9lORicyLxOm2voc87wrd5B5OLrWoZ41y?=
 =?us-ascii?Q?IwbkvjlYr6/jcDNk/wkKekjhnzE1ZZO2A1f/wcAU0I+sNebU4WIrRvRi3Avr?=
 =?us-ascii?Q?dPoMvlnc0jxTgHzDkqWjznfskFh+AV8OjFFJv2LaepbWC4dCHEokWQ+sEc0w?=
 =?us-ascii?Q?RJ5Tzkitjy1ApzzgLrvh/8LuyiKnEhuSremWn939eOfPWsJuoK3pBxA9HW7d?=
 =?us-ascii?Q?9ztuzTU3WhMDd+czhfxdQCxyE90OdjhMF5jvzZWsF31QdACU4Q1UqkVCtlMG?=
 =?us-ascii?Q?3+d3b/o6XvxTotZkfVFJT9I4IIzscvWW+1ywmutG2s/XgB+bGpnHPRv4mLFu?=
 =?us-ascii?Q?9x3GlTn/IlNKNdY52osPi36Uj3gbMXN3lSB7P7xkSCXChMWLbwt8uTAWPnV5?=
 =?us-ascii?Q?QUElyHtTjxNWJHwPPIfMPZ7qOTDGAGiUz8e7lIpTtR5R2dHAMV4h1quOfBmk?=
 =?us-ascii?Q?TbtSBf4aZ3WjL4RkiuFgYYbPno8RYzmNC1O9n46N9foARwMIIGd4wzfrH/a5?=
 =?us-ascii?Q?MdQpeomRYDw98j3ebopWZk82A9FGlp28BqR5kwmfC/MXxm4qrb6m8MHlnCOE?=
 =?us-ascii?Q?g1/Yg2tNKNPi4UycgLeHV7WqxZbW4kPGqhA3sONpJbjrZk9tjPRLk/QwR8YQ?=
 =?us-ascii?Q?lciixu3bN1F7QwGIKxf8y+im8BHiDcupcB7EQFi/4AImTmpl2/cAw20DYNRQ?=
 =?us-ascii?Q?gaS+3XAy4UPCZ6OPeBQs39IfvJCXcWqYmtJZqmTyMjMRovq/3rRy0mIsR2kJ?=
 =?us-ascii?Q?2GR5BJ4gf7kBDdlXYKMlmaVWB38SC8c1ITAJckPH8pZJdGDM1u1fWWJwHNS8?=
 =?us-ascii?Q?1xdg05gxgoyMS2zHxdPVd8zhWYq/KDWqR/hpD9d0sl+nnzDTIKsm0GYASy62?=
 =?us-ascii?Q?qzgp6+Z2bYs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HqVZWa9MR8D7GcEJl94AwnjjM0HZdzoATXQOBme5L8DK4yxjH2/DUbXQPSV9?=
 =?us-ascii?Q?t6WPn1LTvIfQAmPRH3zvkK5VOOdPU1QUwq6Bu6hOBlfVYioxmbgM/g7wtEHT?=
 =?us-ascii?Q?BRRDDYyXlufRCbkWIDPk/Ehjw1Z2v/hRJURSxt9zaGTx/8xPRvkrrW903h/w?=
 =?us-ascii?Q?Mw6aTKFdquirNb+KMtWDJN3Ws4azh5C/Ue1rOkQ1XWEt4VlcB7pF+5EV6Sdf?=
 =?us-ascii?Q?gG7AEJZ9aqVXe+6atFPskzKgtHs8eYLYDZlk/kf+RD/rUFOImjKdbLn3GykI?=
 =?us-ascii?Q?TK52bMweJJ1P7IC/pfqllQ2EKelwV9KjYFCV/8MKoeuLy3n2p8aDdXE/32T6?=
 =?us-ascii?Q?aMJXvy6WLOiSAL7c2uwiPr92C6/EUzwpjilR99yoWgfzhRXg/RML4GPtXvqk?=
 =?us-ascii?Q?NGAI9r9m2RKQSzpyVpx6RPSaxOY2y2X2tdZ64d1aecxRpX0c6TDp1I8ZLvX7?=
 =?us-ascii?Q?5y0oW87j8qPfnvay7XfcGGN4rpF0aXTB73HQOXkeVDlDqDw7hvcXGP29bT8O?=
 =?us-ascii?Q?hrzPY65UHgvs/m1LRyCGotkNg/Wwd5d/l9Dp79LaBWyLQ52GOhLYk0EO5VOL?=
 =?us-ascii?Q?0Ib0Z7/hs2fGmBVTzT2gjrYjAVym4MSepBXHWtMhwwHnqAOeP7wRjxurQ1iL?=
 =?us-ascii?Q?UZ6PejZ6IDAukLnakKNc/fzsHyXWzqc3Ja99z0nYW0vS9+Vpdq6h5QbN4/8J?=
 =?us-ascii?Q?iMq3Wh742zXfCxDE85EAAtqbwqmdk0NXfTFkTGTUMTrgrmfr6y54OC+9z7oW?=
 =?us-ascii?Q?B0t5oEiZk+PXVjxsvdIDL2M6YfpijH0SQMOUm3LCQ+/K50xJHwStdEohRDQa?=
 =?us-ascii?Q?5GG/OOnCiZlPWilKWp7dU3R3+LFoS05PQIVo/YyBUqpLs4cOjiOx3/tWKKRG?=
 =?us-ascii?Q?jKvSdiadX7xX9C4peQ7pQBAGpoGfSb8HE/x2Kb5CbfO8YY74DlD46Sb56+A7?=
 =?us-ascii?Q?v4gr+XiD+5b9W6/K2d3a/Av0t1hP2ZioFEo1IkTbZgMbex4N9sZZGVgVUpFa?=
 =?us-ascii?Q?NSV+LCe42ZirPHTDx8RpqauRhZoRDg6+4h4Vku7SeclhwbXX+c8zhJKbQQdB?=
 =?us-ascii?Q?PWbsZcpds3bZqauVqsBX2wlG91YKkD3MMTJ2magV78ByhFz0jzLqeLOfpg8c?=
 =?us-ascii?Q?6VvP0R2D2ZVEePjXB3olx5pdCQMBCAIK/q2Ju3nRV9WHijhqC9bwFEaNG715?=
 =?us-ascii?Q?9fhC2T6fprePn6FINmwwO65UaBC6uzI1OhBCqAJTL6W62n7ry07QQRhgLt2y?=
 =?us-ascii?Q?pWiwX3t6aVGIG7bqdehArg1Dyu2tOOsTPVYp4II4B/UB/griwtIaJ84YuHft?=
 =?us-ascii?Q?NtYrdzm1HT87G1YKErlgQoitXI9rSCBnvQmCOrVqDgyYUGre1G5yV/i1W/lV?=
 =?us-ascii?Q?2yU2zYlzC2qWdIEKqpbn498y4melsWoRYPyJFgzLFqwjsWwX4I9SFh12PF2s?=
 =?us-ascii?Q?c6/4Vib11seaHIHCPrEz2S37SCrBgV2Kekev+DQdhj3Bq96isU9syQbOTxWu?=
 =?us-ascii?Q?/B40QfhW2YnCOcVn2sNaE9CafR9nwMT4TpgckQ1Hy2Ko/rUrky0EIN0NxU/g?=
 =?us-ascii?Q?HPSPD+v5RVbzr0P4cK0fHxdJH36u2zvRr4LhEqXl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c57f276-afef-4643-9141-08ddbe2e37b3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 14:46:27.0322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXZzJVP2F7KtTqLTPynzq5TrU8r4CwlI38otc3gObCgwcrGJ9TBWYeTI2WpD0/D7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6797
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

On 8 Jul 2025, at 10:38, David Hildenbrand wrote:

> On 06.03.25 05:42, Balbir Singh wrote:
>> Support splitting pages during THP zone device migration as needed.
>> The common case that arises is that after setup, during migrate
>> the destination might not be able to allocate MIGRATE_PFN_COMPOUND
>> pages.
>>
>> Add a new routine migrate_vma_split_pages() to support the splitting
>> of already isolated pages. The pages being migrated are already unmapp=
ed
>> and marked for migration during setup (via unmap). folio_split() and
>> __split_unmapped_folio() take additional isolated arguments, to avoid
>> unmapping and remaping these pages and unlocking/putting the folio.
>>
>> Since unmap/remap is avoided in these code paths, an extra reference
>> count is added to the split folio pages, which will be dropped in
>> the finalize phase.
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> ---
>
> [...]
>
>>   	remap_page(origin_folio, 1 << order,
>>   			folio_test_anon(origin_folio) ?
>>   				RMP_USE_SHARED_ZEROPAGE : 0);
>> @@ -3808,6 +3823,7 @@ bool uniform_split_supported(struct folio *folio=
, unsigned int new_order,
>>    * @lock_at: a page within @folio to be left locked to caller
>>    * @list: after-split folios will be put on it if non NULL
>>    * @uniform_split: perform uniform split or not (non-uniform split)
>> + * @isolated: The pages are already unmapped
>
> Isolated -> unmapped? Huh?
>
> Can we just detect that state from the folio so we don't have to pass r=
andom boolean variables around?
>
> For example, folio_mapped() can tell you if the folio is currently mapp=
ed.

My proposal is to clean up __split_unmapped_folio() to not include
remap(), folio_ref_unfreeze(), lru_add_split_folio(), so that Balbir
can use __split_unmapped_folio() directly. Since the folio is
unmapped and all page table entries are migration entries, __folio_split(=
)
code could be avoided.

My clean up patch is at: https://lore.kernel.org/linux-mm/660F3BCC-0360-4=
58F-BFF5-92C797E165CC@nvidia.com/. I will make some polish and send it ou=
t properly.



Best Regards,
Yan, Zi
