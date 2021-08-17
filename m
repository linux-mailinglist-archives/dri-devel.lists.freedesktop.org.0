Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 281D63EE172
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 02:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5186E086;
	Tue, 17 Aug 2021 00:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644A589F6F;
 Tue, 17 Aug 2021 00:42:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzAXRwwYxWVd2C7Njd9z3/Qi9/GkNgUUXAwmwjWxU+ubIHrDYwZEizhbaGr6XQSsv2z+vMqAu95th2GYp1aiU5W3Gx7XunSMUrqfXaUU/7XSG+QuK719i0dA4/aaTl9CyaYst18wDpPaBi7IC2Gxyvj8pctvF9v07K9CNM3C3PaHE6IGm42QSj7fDNKWLIWWiiWRuz2MMHK8S5a4HwSeFNsfgFRMD7xKY93CtiDRnuhe73U7PiLyozuIcFOZu0oOFR0uc1Au1N/U+ZSc8RAAuxvkDqFUiX39CoNWM12ngaIxxRzUKp1SMnemXbKepaADIOmmlgJAg67M/+QOfm6PBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWujEKxUIya+IDDKvwsoxAXIzzfs0U77W0RgfmSaw9c=;
 b=jmfzbYWeD+C2KxCs2Egx44XEnXnBr3pN7nrLizWgMIyusjxvahIIIJsxZDoDQEpMdfbgFtX59SWGFZn7oawljb5P4xzBl1VXPuefyq7L8tOd7arqsQvarC1UvvCPSYt6fdMEWJSX8+xLunFe93PEFo3HltFrtWY7sD6hdwHOxF5kbzK5u94fhg4U9thTz6CBJSXbA04/WTtzEr3M0JvU7QRedJhbAb5L++jkC0VU7M064s95R1+k2zN91/HEhEnNWWAFhBiEt5SSTyixBeWkD9hoDpA0t7o80LDZnHuNIKwFw9t47m88UMW2SjZqwUvtbssLM2DJs362Lz9lcjvt1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWujEKxUIya+IDDKvwsoxAXIzzfs0U77W0RgfmSaw9c=;
 b=hHYalWn1qq+qUs5q498zH1l9ponXCQy2FoHOsnDaO5ycWxvfdc0GOukFBc69qfHvQDjevz3ZDM38DBstkMEBA8L/U/FiILLW+YSu8g3hlcUqdTQSVYuYXVmDL4F/tV1cSSFpvQhCjouhV+3yMqnWm+cFyrh5HLxgbzEjt6yi+Ms=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5100.namprd12.prod.outlook.com (2603:10b6:408:119::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Tue, 17 Aug
 2021 00:42:43 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%4]) with mapi id 15.20.4415.023; Tue, 17 Aug 2021
 00:42:43 +0000
Subject: Re: [PATCH v6 05/13] drm/amdkfd: generic type as sys mem on migration
 to ram
To: "Zeng, Oak" <Oak.Zeng@amd.com>,
 "Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com>,
 Christoph Hellwig <hch@lst.de>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "jglisse@redhat.com" <jglisse@redhat.com>
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-6-alex.sierra@amd.com> <20210815153825.GB32384@lst.de>
 <694ea624-9dc7-7a25-78a6-308ee0debaea@amd.com>
 <771FC2D4-15CF-464B-96FF-837533A85886@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <ec85f720-7628-35cb-3e76-c19ca25e9af6@amd.com>
Date: Mon, 16 Aug 2021 20:42:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <771FC2D4-15CF-464B-96FF-837533A85886@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::26) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.47.3) by
 YT3PR01CA0067.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:84::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Tue, 17 Aug 2021 00:42:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9eb97e19-ebe0-4271-9851-08d96117ec6e
X-MS-TrafficTypeDiagnostic: BN9PR12MB5100:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5100BECD5A820F2782B7F52992FE9@BN9PR12MB5100.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z1QR+TsAa+3dxtWXAvxYqhG5MtlvWBv/ue8ICEE/dicPKtoSwRKB04IYVtjY+nRUEdqxtQZV54n30nZ4i3lBkQrcLZo6NeMpIJrZwgl8qZXkbumIqdNYDO3t2VN+WFDICsF14AP/fLj62nCkjVAMSovG/enJeTrWnJW7N4qa8q8B8F9V6lDd+IBJJOWw6uRsQMW8pqe2Hkkn4KPAvzQNBdSph9WKaO2bbO38YNXAH9aLXdwGKNmt6zDsutA1dODUfKhfG/qakf6izXvZElS0UsXxr2Dhndpnn/ivwHs5EtOG4RcnHk6DdUrRxKMKc51oRllyzUw1Lpbl0hyx2b7xblZDRSxsBVqTNGCSyzhHupP8NTzgkwVYxXe4jdarRhJaisziV1sTlDuu3Tg5kvwHDhIV4KTGhdeXz7h1bpk3n54pA/ZrB1NRL6wBniXLBCCxOeZkQK1cYb/x/77NLABtarfd6NtTmczpfVT1AYVq1rtqqLjzhKeq0d65u/+GkMG5d2fkrKAm13gu9KTTvI1m9JpWoxKyobWDwLM7GBI4gJybKWrHARyHHSjysVAGookxM0YxRXhOodfeTcC93x4RqHt9hPUDzi9GiaXLpdfYnRWC3WAwZ5zJ4sOB324lDD5Ij+s9kZsW0xcAd+8hc+LvzLBrjP40pt8k77iqVepQRw4pGwJD0e7cMaGJllCv85ZiDFqSuAetg6/jraC+YLYg/hRFmK2OuCDxmwzD4p65Myl2zuVXmiutIkHi8Ju4WPkRdKTiN1L1k5eARfzwyqlBWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(31686004)(66476007)(66946007)(54906003)(110136005)(86362001)(316002)(53546011)(66556008)(31696002)(16576012)(44832011)(4326008)(83380400001)(956004)(186003)(2616005)(478600001)(36756003)(8936002)(7416002)(26005)(38100700002)(6486002)(5660300002)(8676002)(2906002)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjdOK3BFakNQWVk2QmlSUmZ6UnJjL245Z2hoajdIOWxkMzh6UFVTUGxPbUhM?=
 =?utf-8?B?a2VKN2NMbVdkUXFsQTRKV1lURFNrSmlMOEVScFROWHhTN0o2YWlaWURBV2tx?=
 =?utf-8?B?bnZrOWI1ZzFidGREaEJGeHAxNDNmSzZzV2M3RmdIYVNNZ3ZmY252OXV3VTlw?=
 =?utf-8?B?V2o3ZmxEcHEyRitGc0t4UExqbUhaU2ZaaVdtMFNtZGE1QURFRmR1MnIvNUov?=
 =?utf-8?B?MVN2VG5Ia2dXKytLNFdML0w5SFRENW4ycG45L3Qyb1RGWGRwcG9JUkdFZ1Ay?=
 =?utf-8?B?QU1DdjRjNktEN3p5cTlreFVKQURtVmxibUEzc3M1YmJFdVFDcXpjYnNKR2xW?=
 =?utf-8?B?MmM3TklESW9MRXhydldxOGlQdGo2a0J3bWlrYkFNM00rYWswdWpyYUFxU2FW?=
 =?utf-8?B?TmRxczNFRjhJbmo0QnFCVHo5Q2szT0t2OVIrTjlLcUc1ckNQNUdydzJVVWpj?=
 =?utf-8?B?MWlDemJlZ2E5SVJCNHhkMTMyOFVuVFh0WElNb0w0N3FETmNpNVNjK0VUSTBo?=
 =?utf-8?B?YnY4WW1SazhoR2R0VGR0K0hXRkhlVkVYOVRQTmdKbjBaTGF5OEpwc1VjMTFj?=
 =?utf-8?B?OEhlSEZaalIyV25aYUdEbGpzMUwvMFhOeTRWbEllV1o5UWVIWGp1U3U2RWd1?=
 =?utf-8?B?bGlhV0Y4WE9RMGg0VGYrL1FYbzgvRGo0Vi9saWFyUkxKUUlrWjF6SFZ2N2Iw?=
 =?utf-8?B?cTlVaFFtTUhBMUNJQjVkcHFpMGJvdkhWYVRBbnZ5QWptQ0pveW5nMkFVbVVj?=
 =?utf-8?B?QmNycHltL1FlM1VzeXRtdTZrTm8zWjJGbThkRlpaL0g5NmlUQnQ2M2p0ci9O?=
 =?utf-8?B?WHM1cG9abjdTTERFWUs2YllRMkNEZ0ZNMGNLRWx1VHZNeVJ1K0hXMDBJMG5a?=
 =?utf-8?B?cktydFUxQ3ZMNzhvVUh5VmplcSs2YkFMZVo0ckpSKzQ0UzJaUzRlUWRsSkhJ?=
 =?utf-8?B?c1ZnOFJHYnNxaHlWS2hyZGdQU3V5amtUL0xQZld3OGN1QWxYVWhtUU1aL1dz?=
 =?utf-8?B?Z3ZBdUxTbGY5a3FuSG0vUklMNHNlUmUxbFI2MzFPVTMvbG9RZkJOVDMrNENw?=
 =?utf-8?B?ZjJTVDR1d3VRUDN5U1NIajlVdk93LzNRSlRSeDhMYi95OUZyQ2ZIV2orNzRv?=
 =?utf-8?B?cWpkeDdVWXpVaGlNYjFEVFZKTTQzZ1BucjRJUm9TaVZIZVBiRXl5OTdERm5I?=
 =?utf-8?B?Z0d3dGoxV3p2NTZoMCtkeFdDVS9uMk0vSWpRQmtLcDhXOStEL0FNR1lBeFAx?=
 =?utf-8?B?Qk5iZEIrQ2crYmlscy9TQnI1NzI0L3o0VWM5dGhjVVdSUUZWUTRoMmtsSUg5?=
 =?utf-8?B?RTBoTWU3ZHI5NzFGQVYxeVRxdHF1N2w0eFRLcWpoaGczSVpHMmFnbG5MYzFC?=
 =?utf-8?B?ODlCSFU1d1JhZjhCTng0aTFIY3J2M0hSUCtOcjVjRUxMcE9YY1p1aHBITmVn?=
 =?utf-8?B?bHZkdnNwN3p2TXc2MDNCTUxqb0grVGlpbE8wbEJGbzNXRFJVK0N2a05FMVN6?=
 =?utf-8?B?aVZld3FXVUpiWG9pcDBYNWlsUVkrdkhvM09GSm5VTGREbDdYdHgyTy96anNP?=
 =?utf-8?B?QnNOUjdPbWpjSi9KSjhuNWVCWFhmQlR4TjU0NXM1eHA0OFo0YmFjNzNiQzdN?=
 =?utf-8?B?dXkxMTR4VFJGNDFMdkxseGcrN0lOcStxcndYdVJFcEtsVFk0UWdtOEFXUG9k?=
 =?utf-8?B?M0dxa1h4MEtuQ203aFZqMTVTbisxQ2hsU1B1MWIvUnlkeStRcjNEb0V4S1Iz?=
 =?utf-8?Q?Om8fpo/gHkhPqE+CXOAovPngn9AL87qsiRmY0pw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb97e19-ebe0-4271-9851-08d96117ec6e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 00:42:43.0161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33SussHXnbbHfQMgqzrMWgAqMh521pIUOmQEZsuFY+VHi0C565Nf4zVTsO9uG14PfZHDw6Jy+WByP8bo5DVsbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5100
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

Am 2021-08-16 um 6:06 p.m. schrieb Zeng, Oak:
> Regards,
> Oak 
>
>  
>
> ﻿On 2021-08-16, 3:53 PM, "amd-gfx on behalf of Sierra Guiza, Alejandro (Alex)" <amd-gfx-bounces@lists.freedesktop.org on behalf of alex.sierra@amd.com> wrote:
>
>
>     On 8/15/2021 10:38 AM, Christoph Hellwig wrote:
>     > On Fri, Aug 13, 2021 at 01:31:42AM -0500, Alex Sierra wrote:
>     >>   	migrate.vma = vma;
>     >>   	migrate.start = start;
>     >>   	migrate.end = end;
>     >> -	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
>     >>   	migrate.pgmap_owner = SVM_ADEV_PGMAP_OWNER(adev);
>     >>   
>     >> +	if (adev->gmc.xgmi.connected_to_cpu)
>     >> +		migrate.flags = MIGRATE_VMA_SELECT_SYSTEM;
>     >> +	else
>     >> +		migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
>     > It's been a while since I touched this migrate code, but doesn't this
>     > mean that if the range already contains system memory the migration
>     > now won't do anything? for the connected_to_cpu case?
>
>     For above’s condition equal to connected_to_cpu , we’re explicitly 
>     migrating from
>     device memory to system memory with device generic type. 
>
> For MEMORY_DEVICE_GENERIC memory type, why do we need to explicitly migrate it from device memory to normal system memory? I thought the design was, for this type of memory, CPU can access it in place without migration(just like CPU access normal system memory), so there is no need to migrate such type of memory to normal system memory...
>
> With this patch, the migration behavior will be: when memory is accessed by CPU, it will be migrated to normal system memory; when memory is accessed by GPU, it will be migrated to device vram. This is basically the same behavior as when vram is treated as DEVICE_PRIVATE. 
>
> I thought the whole goal of introducing DEVICE_GENERIC is to avoid such back and forth migration b/t device memory and normal system memory. But maybe I am missing something here....

Hi Oak,

By using MEMORY_DEVICE_GENERIC we can avoid CPU page faults triggering
migration back to system memory on every CPU access on the Frontier
system architecture, because such pages can be mapped in the CPU page
table. You're right that this is the reason for the whole patch series.

But we still need the ability to migrate from MEMORY_DEVICE_GENERIC to
system memory for reasons other than CPU page faults. Applications can
request migrations explicitly (hipMemPrefetchAsync). Or we can be forced
to migrate data due to memory pressure from other allocations (evictions
in the TTM memory allocator).

Regards,
  Felix


>
> Regards,
> Oak
>
> In this type, 
>     device PTEs are
>     present in CPU page table.
>
>     During migrate_vma_collect_pmd walk op at migrate_vma_setup call, 
>     there’s a condition
>     for present pte that require migrate->flags be set for 
>     MIGRATE_VMA_SELECT_SYSTEM.
>     Otherwise, the migration for this entry will be ignored.
>
>     Regards,
>     Alex S.
>
>
