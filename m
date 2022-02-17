Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D874BAB98
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 22:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7EB10E32C;
	Thu, 17 Feb 2022 21:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2068.outbound.protection.outlook.com [40.107.212.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B190610E310;
 Thu, 17 Feb 2022 21:12:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqFyTRtELTbRs6ohMk0HxJB0+Qzm9F4ft3ZFwCSbXJsFj8JVaHof10KPAiyipiU3yxyGOoB+zYyknFaKYhJUPOyvokLAr1mB+/hQ+9FBq8VNcCfvGunrJBQTWs+Db4NZxgheOqNjghgZRexFt+3CpOXENyx9ZacOIh1jbobefqzpuQs+mAfsyGtxV+hUye8NSxuGFb33esEx+OabnZBsjm3ys0HmddDObY5ksUWJiwhq1cMMW6euvV2BS3NBYnHbfEhLr1g4/K5z3pdZWVQfpSzurMnB5jhIPmYpOkia+0rHQxznqfXpx5XSOLuaxJQ+88HfN/2Id+hLkcRHvtOqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1CaQ9AQyu0EzgPpRO2O6YTWss6qQUxdJHlR5k/XSvo=;
 b=c5XnrXi4kHvnEUYXDdlNtyjgYpOwh6N9Lyuk2XvnOVfpf2qUwB6IQFcv30emNIuT7gBpCNfJvLru/DOLCywggQuZYLQxC1StxG0Vs8sQogFZbTr57tAMIKXhByMdyb9x3NqFrRfafC5ZGmC9BZKT1QfS1l1pTUSkKbXmKYRA4Vfnfw15O8RjUNemup3Jx1Fe7zfvuMGEkCP2u5r7pxViYSIYzw5w6eLQiePVeDzHknrWvboeV8teAGWZpWxGqV+ZDFFvdFVuMIKIlZ1PWmlf7ZgPslIMDWzi92Z1QEVqpSyT/ZiMFEfN3sZjrQmA6STGXluwI3c6zh1u2hOTXXG2Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1CaQ9AQyu0EzgPpRO2O6YTWss6qQUxdJHlR5k/XSvo=;
 b=2Hzby+IGM7ZCxBLP3/gI1i7izqpwcwJFWidVf9n8qVbIUOxcxRlK9xWqaeGPUNCPu1GNhAgvYX098aM+SwLO8WY1MlkGSUfzD5HFL03DHrzEc+2gvu6Xv3fGjBiSjawx9uhN5eUhrWVAhLqHes8MPN6o39cg90DmQvnDlGD9OR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM5PR12MB1500.namprd12.prod.outlook.com (2603:10b6:4:11::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.16; Thu, 17 Feb 2022 21:12:24 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa%4]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 21:12:22 +0000
Message-ID: <bf16195e-2570-3687-2b53-3f597ebfcfec@amd.com>
Date: Thu, 17 Feb 2022 16:12:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, David Hildenbrand <david@redhat.com>
References: <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <877d9vd10u.fsf@nvdebian.thelocal> <20220216020357.GD4160@nvidia.com>
 <6156515.kVgMqSaHHm@nvdebian>
 <98d8bbc5-ffc2-8966-fdc1-a844874e7ae8@redhat.com>
 <20220216122600.GG4160@nvidia.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220216122600.GG4160@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::35) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83202489-23e7-4b52-3dce-08d9f25a306d
X-MS-TrafficTypeDiagnostic: DM5PR12MB1500:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1500D615362886C04E95032392369@DM5PR12MB1500.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IUN0qHmKDQhv/gvMa2TfKVgtz0vm02zWU8WVSqnPNiL/s5zCCoooIp9agUFy1DW9BmxsHRNGOdRaefTN4qeLSexc2dWPXwVX+D0iJKVjSixQMaDNw9oBKysm5wqA3rK6Iu3DIuFIxSHZliyzD+0OIc3jZHqa477GNzD4cb78Xo2nzaZ/M6bKicQdxfCJJJlJ3GG+Cp2jOtFwzkc0Nn8lflHWle4muPvEVsYQtjgp5yFS/7uYDs45v5YhrvOxRUaFI+5fuiyFZ/ptk7Gn+QMpAhXTcsY0BKWsmeW/ZzLNRMND9EJDLmmQPAblQ9KPb8cv92PfbNDVVjcfqYucbt02xFVD/V6Oyx87GevFW/nWv583oWwp7VKIlxLl3aNBdvdMWX8l5ijb2gnjpNjWerrO4qIc7m6WfxGU4Yp7KcFPblNZ5uWuw1mxYvAh5E3LhP6fyQLSYwbEBd3iNUivJHwKDDMxA1pSRCmvYNW0Kf3aeGbQqdli6X67+ES8Dfg5Y1RSzsY3lGz8ezTNt1FFeYV3o6Htras9mrWOvrMF5LG8OOqiE0QKxgKGybyOqfTrQ5lsh6hYdAkRoKzcJOVWsMeVztHY8EiK2nqLIOFGIiSKyV2Ac6CbSzj6/5JeFTL2yOjdCJ4GYqH5CsOQWDVXD+aBhM2gSjBCzTmyvhdDJmzWCPAPfszfsh5eIiuiBx5awax0KO2xK9qbDd240kvHZAxs6aYGBT9JW/BPqDnrS6FPlUhFbJ+0hVgVvYybABStdQDl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(5660300002)(6512007)(6486002)(54906003)(508600001)(8936002)(83380400001)(31686004)(31696002)(26005)(44832011)(186003)(2906002)(38100700002)(6506007)(8676002)(66556008)(4326008)(66946007)(66476007)(316002)(110136005)(36756003)(2616005)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGgvK0hBTWcwa1Zac3I4NkVvTjY2S1lKUllZbEg3SUFnRG5iLzlHaFk1ZWUy?=
 =?utf-8?B?QnNlM1BFeWhVcDhkMTNMekxQaGV3bzdHNFBQZDNJYXN4SEVXOXIxUEZIV3NV?=
 =?utf-8?B?YnZxRzJrT3NtSDZxLzl5dkd5UDRDUXV6U3Ryc0xUS1RBTGNDVXh1eE1nMUd1?=
 =?utf-8?B?YmgzcGNKVm8wWUVwVEZ1bWFMTWMybExMNlg2Z3NmRG1jVGhEbWhjYWNYM2pR?=
 =?utf-8?B?S05yTWhteFJxekhwb0RNOHlwaHZqa2ZwWVVYUE5MUDYzdDVVQ1F2UkhNendU?=
 =?utf-8?B?dHRRVlBoalRXK0tCdm1QdTQ0UWlCMEc4UHFmWVhYT21PVVBmMktaVUUvOGxj?=
 =?utf-8?B?ZEk2VFU1cGpIZnZwdUFMZ296bGd2dlRuRGszbzVOQ0lOVzd1dlhUVjd4ejJI?=
 =?utf-8?B?Q2ExVUh1QmtGUHJRZkhkbTdvbVBrakRUMGFTa0JOWEFWS0dscENsMWhndGk2?=
 =?utf-8?B?SWVvQUp0b2w3SDlHUkpqaVJKNmN4cFhUZUx1TGFmWDE1VDBTdm95TS9pbHlM?=
 =?utf-8?B?ZVhYd2g1WDVaSlJlTC9vS1MzSlBZZVIyVThLUjJkWHF0Z2tSVzVMd0FRODlC?=
 =?utf-8?B?d0ZscklVMEVFbWwzVUY0ZHBiZDd5dE1rVkhKR2E1RDVtcUp5QllNSjNEOURJ?=
 =?utf-8?B?bFRQWTFaa3Z3bFJwYlVKdUFOc1FidGNJZUhpRUFlMjZBMzhiNXdDRkdYUVAy?=
 =?utf-8?B?RVlYb1VnUkdQSlZHWFgxbjFkUlc1R3dXMHoxaU5GU21TU3ZlTFdiNVZhZFV3?=
 =?utf-8?B?S21SWEVUbzBrVVlJUHIwRnhEMWJmS0x5TStvTTZVK1ozZFh2Y0d3L2RvR3dX?=
 =?utf-8?B?dnN1a2F1bXBUeDBpZU1pWkdrK3V1YStST1pBdm1lNUNyRVc2bHRhZGMzampJ?=
 =?utf-8?B?dFNxWEdvdXlWNHhhaElkR3JCQUFoNEd6TGowMktJN2Z1WTJhZm9aK0JSaGtu?=
 =?utf-8?B?YzNXaWJpMk1Gb3dESlFzK28zajRJbGFoNkROQXI1Q2RmR3psa2lRK2t2dFNw?=
 =?utf-8?B?ai9KR1RreGdtSXlEdDd0UmgyR3dia0YrWjR2dk5FcDJ4Tk9mbUFqYVhVTmw2?=
 =?utf-8?B?Z2NxMThONURwV2VYK1h1cUs4Rm1qdTdpK2dQakFWSFhFT1g3R000dkJXSlNw?=
 =?utf-8?B?UXUvaEdFWGZoLzc2ZnYxSVA1ZXlGTWRqd3g5cG56THUxK05yYjh2bUE3eVZP?=
 =?utf-8?B?VVc0NjQxd3d0alk2S21RN2RQcjlXTzQ2OU52bVN3NVF0NnFYOGZuRk5uVWZ6?=
 =?utf-8?B?TmFOdlVKUjJPOXVKZDBEL3NnRmpObzduSkZ2NzRIcjI5cVVNV1JIVjIybHpW?=
 =?utf-8?B?MXMzelhqbkxjWVU4VzVEL3hzQ3JJNkhnM2NvZm5hUGFic0pqZTV5cnJUMWpu?=
 =?utf-8?B?MllwcUtPMnp6V1pzZHZNTjBmRTc5bWJXUHZ0VjNWQ0ZSUzNhaFNpSFpQdFZ3?=
 =?utf-8?B?a3N0THEzdDB4QWcra2xQZ0pVSnlnUTBPdWJrTjBaNU5lNkxIbFAvZFlSOEZj?=
 =?utf-8?B?VXBrSE9LeExjb1lWNzJ5TTZwOGs1V1YycHB4MG8xK1o2WmEyOGdHTWcwWFNP?=
 =?utf-8?B?L2tPcEhmdGRlMDErdk9hS2srNzBya2x4YW1id2RxRzBHMS9rNlhlOEt3QVFk?=
 =?utf-8?B?WWtMcFBDVG04VHFOdXoybDRQVWdVRkRTMmRPTE9JMWtoQ0JGYVlYRHluZDZQ?=
 =?utf-8?B?M0xvSWY5cEdwemxHOXBJRi9CamlCMlpGQU1GdHhNcVFJN1RhU1ROUnJVdlZk?=
 =?utf-8?B?UUVBbStoWjRydStIMVJ2LzRUM0FpMnR5cDBuWDFoOXlWTUJ4MTFOc0dYbkQw?=
 =?utf-8?B?OElvSk9ad1JPdnlJWG16RTRIK1oxYmhnbEsxMWpUdjBMQTFMUTF3MGNuWXZh?=
 =?utf-8?B?dkhUZjg1Z2lBdFBjMU1MLzUyMUNPS0JLYzNWZVE0eDc0bmU5ZEUvaDYra2ZB?=
 =?utf-8?B?K0o5bnc3S2tTWlpxVGlGMkVRUmtPUTBpZyt3MlByQXc1dzlkUE5xS3ZYeEZh?=
 =?utf-8?B?TXFRQWhmYXlNTzIxZWpYR3JlWk9OcjRLMUZOWWFOb3VjZEZrM2Z6U3kxMzJn?=
 =?utf-8?B?YlpQWS9Yenh1RjVMTGI4b2JaTWM3dS9qR0QzdE9SbWxTY3BTZkIrcU9ZNXY0?=
 =?utf-8?B?R3JRQUtiMFF5MHFUVThWUGpGM2FuRmJlZDhacDNEQmg2VHlEdXU3QnFMdHJM?=
 =?utf-8?Q?cDM7DF/yrdi82qo0TrLi3FQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83202489-23e7-4b52-3dce-08d9f25a306d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 21:12:22.4498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XS+SgGaKTdizF99QaQObmvMvQmPDzfSwaDoANF8w4s6LTwgpubJCDcEcQpgYO55qcK9PiPs8DrS2K1S3Ko/SDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1500
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
 willy@infradead.org, Alistair Popple <apopple@nvidia.com>,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-02-16 um 07:26 schrieb Jason Gunthorpe:
> The other place that needs careful audit is all the callers using
> vm_normal_page() - they must all be able to accept a ZONE_DEVICE page
> if we don't set pte_devmap.

How much code are we talking about here? A quick search finds 26 
call-sites in 12 files in current master:

    fs/proc/task_mmu.c
    mm/hmm.c
    mm/gup.c
    mm/huge_memory.c (vm_normal_page_pmd)
    mm/khugepaged.c
    mm/madvise.c
    mm/mempolicy.c
    mm/memory.c
    mm/mlock.c
    mm/migrate.c
    mm/mprotect.c
    mm/memcontrol.c

I'm thinking of a more theoretical approach: Instead of auditing all 
users, I'd ask, what are the invariants that a vm_normal_page should 
have. Then check, whether our DEVICE_COHERENT pages satisfy them. But 
maybe the concept of a vm_normal_page isn't defined clearly enough for that.

That said, I think we (Alex and myself) made an implicit assumption from 
the start, that a DEVICE_COHERENT page should behave a lot like a normal 
page in terms of VMA mappings, even if we didn't know what that means in 
detail.

I can now at least name some differences between DEVICE_COHERENT and 
normal pages: how the memory is allocated, how data is migrated into 
DEVICE_COHERENT pages and that it can't be on any LRU list (because the 
lru list_head in struct page is aliased by pgmap and zone_device_data). 
Maybe I'll find more differences if I keep digging.

Regards,
   Felix


>
> Jason
