Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 315304C8FB6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 17:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2911310E6E5;
	Tue,  1 Mar 2022 16:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F39410E6E5;
 Tue,  1 Mar 2022 16:08:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lnd1XRPfmt1V7fbF8CWy/khJE7R/J/LpQF3Qa1KEROxXLNRKVffbhhuHsL8+eO7SlcP2dSw9CfS6RQDflLrQOYJ/YHeJubHexKewTPVWyBcSJF8OG2zDHY5ouz4l2cdXRv4kxIrbo8QJpnC3IIs8+99oafAzooUudfDOUeaoXYKgneLGprNpRplxB4xGJxKoYaA0OO6giRXVUE3z3rRUm6v0mFAkkJkaRtuS2yTdcztO1WUD+BbZ58gKYwjAljYcOubUa2+9hQHdzq1XStFPBeILZaO79LYrAVTvHJqQLxmFyRRRU5pXXOAsZpt4fY2VY5Qw483Qis5bDcCj01e1OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DrwHqEo1wCplkscXH3yfvREylTDjAN7RqbkOfJpFQ4=;
 b=TtFC0bGgUAgCZ1JRzWQ/Z4E2LRNWtvKFmY1d0Ad7R8PRB9Git0htxgb+qyurFqfOiIzC8aRVAgUFp6HAK1gCsCItXd87i7G2dM+J336iHyY32rE6NzL86OqYLyreOLTzYTVrpPmpQC4PTJRKX+6ZIzQ88z7xexIqH4ANJabEb5Mo767ykke0XJXSvc+Sg/wzFFkUOY53+7bm9mQvdvqsNHIOM0LQlK23bHY9zxv3Kmg9Fdn55lnsSSj/gZIdNKyuZCd9byD2qkV0xRkpbb1FuvZu0OAkf8tqSXT5djC084UuxRWAR4lBIi/3hhMJu9vOGV0f0mK4tmVZP87CYzgMzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DrwHqEo1wCplkscXH3yfvREylTDjAN7RqbkOfJpFQ4=;
 b=fXXX52IEntkOICHO7XgWPKp6CSDX8EI1B0KTJuurUeO1LQGqS68iJcjpLlzazXuOkg/ymYNVe1PN7B7otn3ZyNzkM3l3FXp9Nq8rc4jwH/GslA84gMr+G4F9zkwCGc5tmKrnnRHl4pFw3obvH+aqIxKjeQZEBf02KelCsqakYvY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN0PR12MB5882.namprd12.prod.outlook.com (2603:10b6:208:37a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 16:08:52 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::410c:b456:62cb:e3f]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::410c:b456:62cb:e3f%5]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 16:08:52 +0000
Message-ID: <41469645-55be-1aaa-c1ef-84a123fdb4ea@amd.com>
Date: Tue, 1 Mar 2022 11:08:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] mm: split vm_normal_pages for LRU and non-LRU handling
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Alex Sierra <alex.sierra@amd.com>,
 jgg@nvidia.com
References: <20220218192640.GV4160@nvidia.com>
 <20220228203401.7155-1-alex.sierra@amd.com>
 <2a042493-d04d-41b1-ea12-b326d2116861@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <2a042493-d04d-41b1-ea12-b326d2116861@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT2PR01CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::21) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0b45391-2d47-4e94-83ef-08d9fb9dc738
X-MS-TrafficTypeDiagnostic: MN0PR12MB5882:EE_
X-Microsoft-Antispam-PRVS: <MN0PR12MB5882242A54BB3E9E0EBF6AFC92029@MN0PR12MB5882.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3b0EVFF4Is2hd2j5s7Vjua7d52tjTJ1ig5jOluNatRSx9UXo4DUetaEL1BCEOKgmXbqWWQoGBS6C6NbzE7jU0nze3YhAcxDpSbfurSNxAgsx9PEl0p30ebtQ9P0NqGkhvfqtYEw3KFbifSoCb3lAhmjS6n2o1YJfkBwaNuoPMct2nx2HBWB33TNc8z+S1X/ql0UbH+Ni+LmLICQ8bS4eUhURa93hnZ4Ce9jip/nn1Lj5oYYuvRCE1pKqX7xg2hy9lRCciN9ZzQLm5IRaCzdiyRC739aElPuaJk5exAKK7nK6zvDW+5RtpxD02fnhw1KH5bMta4YgOf89mHyWB+0VRMfXKYlwbWV3Bu5ARxNTA8hX1h18e/Yj60iw9RW2UiMcfXRXUDS0dS7yBrimQziP1OlflhvbJeaTHIQy3+ngRjhyo+eYW/ZTLnhPM9aVBHypobfGD/xrb0kLO+0kIaTvF/8H01E/DxoGeEqSopyKjc2bg0TLR2/tz3oop/0vJtF2ZsoWEmVZghPBdbimC90+wrF8KgBm/7WUulZ7ZPvbg8J8v8EO6mLiRKD70ddKLWtTLjbCgeAdP78tJlBRm3CURgxcDR+edrs9RV1BmOqfJaZ5dS6Eh4DwDTkNsmc6ZQo/lRndjh7XVyrvrIVW1qJUY985/dgAkTY9SWnfqQJ3f7oLxjyUL6aZ7+QULueP1QqcRkPaZRdWV8i1QTjq2ScxIWmV4HaNYwucyyKowXWEM9KmRTcez4muOFX1qLIQzZ0I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(38100700002)(2616005)(44832011)(83380400001)(66556008)(6506007)(8676002)(8936002)(6512007)(316002)(36756003)(31686004)(2906002)(66946007)(4326008)(66476007)(86362001)(26005)(110136005)(31696002)(6486002)(5660300002)(53546011)(508600001)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm15UXpzUVlFU0pRRDlWNmNKWmZTK0kySzVhcGJkVXRnUFpDdVZEaitpalV4?=
 =?utf-8?B?TXMzdTB1elc2Nkg2elk3MHB3U1JJOHJYSjlQdUdzNnVubDBFY3FtTlZXRFFw?=
 =?utf-8?B?NHRmSjlpR1IyL0Y0R2c1RnNadTN3VGtyK1d1WkNyNnduREhjdGlmdFJ3eHlK?=
 =?utf-8?B?OGtqZHlKMHZxZ2lDZXdNWWRtRyszLzQ0U1hueUZyWjJXUWZHK1ZBR0ZGdnhs?=
 =?utf-8?B?MEIvRnMxTTFrZ3BWaDJRU1BZa2JaeHdYMUtGWC9Kb2xIcjRlekFtbTFOTExw?=
 =?utf-8?B?bHNHRkpaNDRxY3pYTm1mS21SeFUwbU1wYjh4S0ZyWHU0Mkx1clEwMmQ4NHRx?=
 =?utf-8?B?N2RGS3FkM2tzVHhHQ2ZvV1hsOGFXNEdua2tkSFJkcEJzemYrcFdpTlVGRElx?=
 =?utf-8?B?Mmk0ekNXUUxscDIwdXloakp3QjM0K3A4NVRBbFpYOUxMbnpOM0ZoM1hBTkw5?=
 =?utf-8?B?cU5xVVA3SGV0eit4OFUxdGNFdDV2KzdEOFZUTERNZ0ZnbDdFTWcxcS9reTg4?=
 =?utf-8?B?LzhVQlQySHlzVWpEUGxzMUlkSnZ1aFU4NGlaQXRsVFFjWTE1QjFqUkg3aTFm?=
 =?utf-8?B?UkxWOUZKMjBNMFl1T1dYaWQ3U3U1SHNHZjV6ZUwzNm1MYUtid1BsbTUyalc5?=
 =?utf-8?B?MDhXK3pUbWU1eW5seVBhbDltN2M5UmE1Z08raENGRGtsQ2QxZSs3bVVkZVNE?=
 =?utf-8?B?RUgwdkplcG9NeWV1WmpHZjFGR0cwYlp6Zy8wbXA0bXV4OHljUWtlYUVsTTlV?=
 =?utf-8?B?OWw3aUUxTExoVXNIZXdNQW4vdHR4UnFZM3VibU94T0NqRS84Y2Iyb3FuK2dD?=
 =?utf-8?B?R2x3RVBraS9XZUFpcjd1NG45ak9ML05pT2dXR29VK0VCU2d5SS9RcVgwaFdX?=
 =?utf-8?B?c0dtbGNtSGVBbXhyT0ZUVUU3V2FVbkt2TGMzeElKWnY2QlV6YkxEeTM2dUw5?=
 =?utf-8?B?cWVoaURDeWMvcE9oWHArMDNhRVRhRkFKWFB4aXZYbnNJQ0lXZ3RqbzVpT1Jl?=
 =?utf-8?B?SVE3Ym5yR2dFWUhJQUxUd1pKT3M5U0VVMHN1K0dBWXZHakdUSlBIL09MQlJ1?=
 =?utf-8?B?U1BzbDF6R0RRT25LUzlsS3YwRDFOTFE2dTlka0owN0gzMHJLalJYRk5BWVJU?=
 =?utf-8?B?bENpK1F2MnpUbDlub2ptWFZ0UFVYWUcvOGhQczlIelZ5N0VWU0tKRW44dkpx?=
 =?utf-8?B?Sit4T1lLelRWOU5JUW5ZYmcxbHppakFaVWY0bTAreWhaWnhadEFRV2dYVndN?=
 =?utf-8?B?V2tLdHJLTk9YZS9tZjkyOWNlbjU4U2lhVTNrL3hTUmVMZEc1ZmxvQTZxTk9Q?=
 =?utf-8?B?R2w4ZVE4MnBTZ0YveTY2U3BaOFgxZFEyY2E2NHRiRGhZOGl4SWpaT2didFlv?=
 =?utf-8?B?NHFKT2dPL295TmdwT2szdXBJcDk0ME9lTlVhaExsaEMvUlNCZng5b3hIZVI4?=
 =?utf-8?B?cjEweVJJOCtGa2M2cDM4dzJuTWkrVjgrNjVLcTZWYzlHcjhpK3ovMVBGaFND?=
 =?utf-8?B?UTBMWE1waVBhQzAvb1RNS0pmaHVSeWZaUStjVUlJT2EvcEJjaGYzR2c4c0po?=
 =?utf-8?B?d1NlOWpadnREOGdVbWNTRkJXdlJqcWM5ZVVJbzY1RzZlSWlWSFRSREUxYWUw?=
 =?utf-8?B?d0RJK0xuYW04WmU5NmRialYyWFVyU1BTM2lNbmtPNFV6b0kwUEk1QmpZOFBw?=
 =?utf-8?B?NzdNV2E2bU5WZnBtQ1QxZ3JMY0VCdXFxL0ozQ3F2aVo4NkcwMVM4SzJSd2VM?=
 =?utf-8?B?cVlWcXBBYUh3UjRkanhjR2lKRndJOFpwOFJmQi9wbmplc2I1MVN6aEQ0Qmxq?=
 =?utf-8?B?Q1dnbk96ZUhneVNLUmVrWDUrMmZQRjljTUZiR1hybGZqUVhZSEtJeWFUQnRn?=
 =?utf-8?B?Q3dOQVE2ZzNib3AwWVdxNk5VdjBub2F2S1lBTDBKK3ZheGRDSmxMUjBJL3p6?=
 =?utf-8?B?TVMvc1VqSGJZcVFMYVlIOWNIOTJ1dDJaRjNOM1VsNVpESkFxRFhhNXZLaWNs?=
 =?utf-8?B?VlpMaTBXK3FoSHV2ejNIZzFRS0laMzV3M0FqWUtXZWtPMHdHSGZTZVgvdzN3?=
 =?utf-8?B?bllsM1pzbHBEV2gyZjZJVXdqYUJjNExPVmZjaWwzN2JNNzYrcDVZZi9nVzho?=
 =?utf-8?B?OXBVZkUwOW5RUFdIbHUyaVF3SWRMRGFRYWwxK1d3ZmdXUU42ZFFXR0ZYZkZ6?=
 =?utf-8?Q?WFCzLH+g2ALe6gZI0uVcNxY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b45391-2d47-4e94-83ef-08d9fb9dc738
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 16:08:52.1379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0NNHQeDiwaJ3aLhP+vqujpi43DuF2hGVjF8KR/rJ6ZZWnrXbhY8eHJv23UyMsJkudXQLjeMIk0hnpg3deA28Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5882
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
Cc: rcampbell@nvidia.com, willy@infradead.org, apopple@nvidia.com,
 dri-devel@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-03-01 um 03:03 schrieb David Hildenbrand:
> On 28.02.22 21:34, Alex Sierra wrote:
>> DEVICE_COHERENT pages introduce a subtle distinction in the way
>> "normal" pages can be used by various callers throughout the kernel.
>> They behave like normal pages for purposes of mapping in CPU page
>> tables, and for COW. But they do not support LRU lists, NUMA
>> migration or THP. Therefore we split vm_normal_page into two
>> functions vm_normal_any_page and vm_normal_lru_page. The latter will
>> only return pages that can be put on an LRU list and that support
>> NUMA migration and THP.
> Why not s/vm_normal_any_page/vm_normal_page/ and avoid code churn?

I don't care much, personally, what names we end up with. I'll wait for 
a consensus here.


>
>> We also introduced a FOLL_LRU flag that adds the same behaviour to
>> follow_page and related APIs, to allow callers to specify that they
>> expect to put pages on an LRU list.
> [...]
>> -#define FOLL_WRITE	0x01	/* check pte is writable */
>> -#define FOLL_TOUCH	0x02	/* mark page accessed */
>> -#define FOLL_GET	0x04	/* do get_page on page */
>> -#define FOLL_DUMP	0x08	/* give error on hole if it would be zero */
>> -#define FOLL_FORCE	0x10	/* get_user_pages read/write w/o permission */
>> -#define FOLL_NOWAIT	0x20	/* if a disk transfer is needed, start the IO
>> -				 * and return without waiting upon it */
>> -#define FOLL_POPULATE	0x40	/* fault in pages (with FOLL_MLOCK) */
>> -#define FOLL_NOFAULT	0x80	/* do not fault in pages */
>> -#define FOLL_HWPOISON	0x100	/* check page is hwpoisoned */
>> -#define FOLL_NUMA	0x200	/* force NUMA hinting page fault */
>> -#define FOLL_MIGRATION	0x400	/* wait for page to replace migration entry */
>> -#define FOLL_TRIED	0x800	/* a retry, previous pass started an IO */
>> -#define FOLL_MLOCK	0x1000	/* lock present pages */
>> -#define FOLL_REMOTE	0x2000	/* we are working on non-current tsk/mm */
>> -#define FOLL_COW	0x4000	/* internal GUP flag */
>> -#define FOLL_ANON	0x8000	/* don't do file mappings */
>> -#define FOLL_LONGTERM	0x10000	/* mapping lifetime is indefinite: see below */
>> -#define FOLL_SPLIT_PMD	0x20000	/* split huge pmd before returning */
>> -#define FOLL_PIN	0x40000	/* pages must be released via unpin_user_page */
>> -#define FOLL_FAST_ONLY	0x80000	/* gup_fast: prevent fall-back to slow gup */
>> +#define FOLL_WRITE	0x01	 /* check pte is writable */
>> +#define FOLL_TOUCH	0x02	 /* mark page accessed */
>> +#define FOLL_GET	0x04	 /* do get_page on page */
>> +#define FOLL_DUMP	0x08	 /* give error on hole if it would be zero */
>> +#define FOLL_FORCE	0x10	 /* get_user_pages read/write w/o permission */
>> +#define FOLL_NOWAIT	0x20	 /* if a disk transfer is needed, start the IO
>> +				  * and return without waiting upon it */
>> +#define FOLL_POPULATE	0x40	 /* fault in pages (with FOLL_MLOCK) */
>> +#define FOLL_NOFAULT	0x80	 /* do not fault in pages */
>> +#define FOLL_HWPOISON	0x100	 /* check page is hwpoisoned */
>> +#define FOLL_NUMA	0x200	 /* force NUMA hinting page fault */
>> +#define FOLL_MIGRATION	0x400	 /* wait for page to replace migration entry */
>> +#define FOLL_TRIED	0x800	 /* a retry, previous pass started an IO */
>> +#define FOLL_MLOCK	0x1000	 /* lock present pages */
>> +#define FOLL_REMOTE	0x2000	 /* we are working on non-current tsk/mm */
>> +#define FOLL_COW	0x4000	 /* internal GUP flag */
>> +#define FOLL_ANON	0x8000	 /* don't do file mappings */
>> +#define FOLL_LONGTERM	0x10000	 /* mapping lifetime is indefinite: see below */
>> +#define FOLL_SPLIT_PMD	0x20000	 /* split huge pmd before returning */
>> +#define FOLL_PIN	0x40000	 /* pages must be released via unpin_user_page */
>> +#define FOLL_FAST_ONLY	0x80000	 /* gup_fast: prevent fall-back to slow gup */
>> +#define FOLL_LRU	0x100000 /* return only LRU (anon or page cache) */
>>   
> Can we minimize code churn, please?

OK. I guess we could unindent the FOLL_LRU number to avoid changing all 
the comments.


>
>
>>   		if (PageReserved(page))
>> diff --git a/mm/migrate.c b/mm/migrate.c
>> index c31d04b46a5e..17d049311b78 100644
>> --- a/mm/migrate.c
>> +++ b/mm/migrate.c
>> @@ -1614,7 +1614,7 @@ static int add_page_for_migration(struct mm_struct *mm, unsigned long addr,
>>   		goto out;
>>   
>>   	/* FOLL_DUMP to ignore special (like zero) pages */
>> -	follflags = FOLL_GET | FOLL_DUMP;
>> +	follflags = FOLL_GET | FOLL_DUMP | FOLL_LRU;
>>   	page = follow_page(vma, addr, follflags);
> Why wouldn't we want to dump DEVICE_COHERENT pages? This looks wrong.

This function later calls isolate_lru_page, which is something you can't 
do with a device page.

Regards,
   Felix


>
