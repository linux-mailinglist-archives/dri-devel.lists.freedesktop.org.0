Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4710C71E86
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 03:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837F410E6D9;
	Thu, 20 Nov 2025 02:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fVr8CmVT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010057.outbound.protection.outlook.com [52.101.201.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9871810E6D9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 02:59:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZeEr/vxvHZjxDs0z4PbZkVlFiRSw2yoUH3acNyEwUnALshAQcyqf7fD5WoQF5Lsa9wle/FRGUzJHagR7KwCQQQviwRwPs8H+B7z9FKSDOEfpCYrzpLPpNNoZA0d3m0UxgE7WpEKFXD8O/sw0LIFzfxpPOABiuf1a/jKVl5/WcMtsGZkfJ4/z4QphHEkpmlpLpVpH+af41og+DkNlIxsbJHqSYsOjUDhgujkisEbr2iN9Lg3uQ3M509Q7Y7ay7zIsHa0IQuBV+THPSbPfL1lxE/XZHm9cvVUFoJzCgYb+u41twd1lCvUEb4zt1kCusBZE10wosGTQNDpdZha9Usn3+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PseCPNCBOqyv1nHZTORm6zuuUqH3PXfSqbbMge9QLwc=;
 b=SJNhQICjGyJPmawV/hZCjAKZA7UCVshxFShBuHUAFcFf4txkhruYmdQ17imdoDrQM38+WHN8itYIVlJ2y7tLEKYV/3cqxPW+PU7Dinhn+n5Fhep0G14+AR7kE+GPAU7Si/JIy6E+Qq/6k/RhsG9/4M33iIaLw9mM6YnbUddtOj+xTL9AeYlKQy/EvSMo9qNZMGlXRJrcXcEgr2tmf5prAHMEw2Ik9ew5CvysRN1PlhVYFcxCDuaRSWSYNf4FSBnf7p6w7/cOXsRM2g7/s0dAOo78BYS14xm4fCG1CLA4BG1Uz/tqBLf/eTpLRE12OTcVHMAF56T10vvOaWrygonLrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PseCPNCBOqyv1nHZTORm6zuuUqH3PXfSqbbMge9QLwc=;
 b=fVr8CmVTZqZJSSg3nHmT8LsGIDcgPJNBc1xBqWumC0UYFoXf0uXmtBJo9lLLcvuOD8L8B6kD5fwC+PH5MIKbCv+7U7mfwMJPqXF6wAXjbriyYNej0KpUudCuSSQExtNUjFCxiz8r4+TeemzqEbd6kdUCBkmCkuyEoWs9qheqJa32lajF7oJKKe7Dor/zRznV+X0rBHjM1UAWGznXFnsQmaLmQv3+Zu8IynuOc9hXtvyajWims9tNRpcdO0sBjg7u3i3lgmlyVIm6tlcvGWGUKg5LzkUi1O+3EG86wKZ8STSHjaQ/E1EQG3lLujaphqf3vVKO7S27dJ44kRAdljRAsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SA0PR12MB4352.namprd12.prod.outlook.com (2603:10b6:806:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 02:59:17 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 02:59:17 +0000
Message-ID: <24d8d39b-5ebe-4f29-93ff-3f7ca2a9b1cc@nvidia.com>
Date: Thu, 20 Nov 2025 13:59:09 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 00/16] mm: support device-private THP
From: Balbir Singh <balbirs@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251008201740.d9507f4807a73058d4da23a8@linux-foundation.org>
 <a5992f11-5841-4bbf-b190-b5df41b68b0c@nvidia.com>
 <aOePfeoDuRW+prFq@lstrano-desk.jf.intel.com>
 <20251111154326.bc48466a6962fbbffd8ebdd0@linux-foundation.org>
 <7a0f2704-80b5-4cbd-8f3b-ac03692eefd3@nvidia.com>
 <aR5/uUFboeeSwN0z@lstrano-desk.jf.intel.com>
 <7ecb3faa-8bc7-4eb1-9342-404a9ff52b97@nvidia.com>
Content-Language: en-US
In-Reply-To: <7ecb3faa-8bc7-4eb1-9342-404a9ff52b97@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::8) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SA0PR12MB4352:EE_
X-MS-Office365-Filtering-Correlation-Id: 969cdf47-2e1a-41a7-7692-08de27e0cb24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUh1aFFrRVA0R011WU9yOWxUZUpmWHNrTUJVL1VHTXR4R2dQNkovQ1BxZjI5?=
 =?utf-8?B?bXhWY0RmN3d0YURERjVGcGhZblJHZ2RzQ3NBa29IRkp0MmJrcXVCdHlISWNv?=
 =?utf-8?B?dTRQM3k0dzkyUjNwUEtodWozNUp5MW9MdzJTK2xiOHlONGpkVEdEUXFTSjlW?=
 =?utf-8?B?K3JEK25sSXYrYlNZTzEvbjZvVUl5ZlBwNGxWd3ByUTBPUGdIWFdIYW9QS2xo?=
 =?utf-8?B?dFdCNXE1emwzVzRhVW00bWpNQ0pKSTl0UzVRN2xBZnFpSmwwODRXTysvdzI4?=
 =?utf-8?B?ck1RUFA4OG1OUkZQc1FKSmllRDF2d2ZqcDlqd2htOE8xU3I1WjJncXEvODZn?=
 =?utf-8?B?R0x2NlJROTRmVlBmMENqT2FCc1BLYWpza3pndFFUMjcyMWcvdEQxSFNkQzVR?=
 =?utf-8?B?MU9NZ041Nkl5MjVMU01xalgwRDhtMjZxOTM3czRndG95THFiOFJQazBLRHhh?=
 =?utf-8?B?QTBCK2tzTkJOd0JBcTJLVTFSd3F6V2p1MzJVTWM0Znp5a0EwcENacHVXczhi?=
 =?utf-8?B?RE9kUXRscU5ldDVRenhhZTZoWW1VMzh6SE1GZm5yM1pwdWdTVnhoVVJIdUJr?=
 =?utf-8?B?NWI0c1V5dHFxZFdxR3RtdEFnRWc4SjRjNVlsY3B3SURyemorK00wR3dFMGhj?=
 =?utf-8?B?VnhwaWtHTkU3SjFNKys4a05VS0hQK2RpeU1qb1k2TXI4RElFZk40d1pXQ0ZY?=
 =?utf-8?B?UHdkbkVDUWVraFJJemY3UFRHNDA4YTBCNlV3emdRMEtQRHJIbHpBcWJTRnlG?=
 =?utf-8?B?Z1ZJdTlSN1NhRTM2VGJLK0t1aEwvSjdIMlFMQXhmYkhFcmZUUEdLR0dBWE8y?=
 =?utf-8?B?NWE3a2JpMDVmUCtHMmErOE1lNTVNMzhmL1dhMk90TkltVEhqRVJKRENTSFJu?=
 =?utf-8?B?OXZDRDBucXVaczdJcFk3TUdJTDRVRTNQck5lelNHcGw3TEJRcGNONVAwN2lI?=
 =?utf-8?B?SUkzL0JvMUg0U1JZNUg0d2FtTXNYSVFibkZXcFFNUzVabHpPNHprY1QraGFk?=
 =?utf-8?B?ZjVrMDFMSWkyYmhpNFFtcTRLY0VlL3VwUUZzTkpqaVlZU3h4VDIrWnd1ZW9C?=
 =?utf-8?B?R1RncW9rbHYybjUrY0RKYmFmTWpxa2Z4eW12em1lMXdlNFRUM1JNaE80Yjh6?=
 =?utf-8?B?WStRNVNDQlJWMzFwbmI0YlJJN1lHNFBaMkFGMFFWR01HUUlsL1BST1JObXNP?=
 =?utf-8?B?TVBETjA3Q0FJZVBNL2J5YXpLZFgxVUdIY1hVMS9xZi9CNWhQMGxWYzB3RGJB?=
 =?utf-8?B?elVLNXh6U0NDR1hsMEJMY0gzazhFZmUzZW01aGwyZWI4NENVcVhzdktJbkdN?=
 =?utf-8?B?NHUwdHZoTW1NaFc3KzcxTDZvSDVzQWtDV2ZhRTMxTndCYTZKMytzdXQ0OHBY?=
 =?utf-8?B?d3J3VDZNaXpsRnNuZW1lRVRacE10VlpMaTIzb0VjMWNCRXJOWWF5czVDeTNC?=
 =?utf-8?B?WmNQZU14T1NOVVY1eEN4ZDZMbm5vbkdxa2xpVlBSbVBEMGNzdzVZYVBtSUVE?=
 =?utf-8?B?T2NaYVBLK2YwQmsyMmpwc08vV3hTQVNMcHV4cVhIR2ZQaHQ5cmFHSG02N3Ux?=
 =?utf-8?B?SFBSSGNzSk9kTTBBZk16TjBxNkJXWGREUFM0Wm1KYzlIRkhScWFub3hXcm9R?=
 =?utf-8?B?R0htd21JSFBnYUN1Uk1sOFlUbkg1T01VSnBJYkV2MHBucEhmUUQySTN3UkxE?=
 =?utf-8?B?OXh1eFFCeVVtNHh3U0xDcVBZVk1Ia2d3N0hOY2RQNE1BZ2U1Q3NWNUlZVWZz?=
 =?utf-8?B?ZHBrem0rY2NPMTZYWXVabjlpSVBIekhtRlNtNVY1ZHdxMmtubHNPV0Mrd1Ju?=
 =?utf-8?B?NW5jMnEwSis1bGJiaWtwaEU5czZzUThKRFFBYmpCY3ZEOVcvMnZUS2JGSkVD?=
 =?utf-8?B?aW16aXNLTmlIZGJLNlFCcVVHWUlhRjNLKzIwK0dCQ3VxcnFRbzJ2S0hTM0gx?=
 =?utf-8?Q?DSYXDFTGVCsTsgH1i3wC474YUrkQI8+W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlptdTYrUHRScGpaZm5CN2dnTGFwSWEvQjNjL2liejVTZ05vck5nNDIrQ2d0?=
 =?utf-8?B?ZHVYNXMrbWVjZlVsY0FoL2ZlRVk3MmRkL255TmZLMXFaMFk1RXYyZWxuWHNx?=
 =?utf-8?B?WlcyTjBFemlDWHYvbGo2Y0xTM21lbURCRHB0a2Q3UVNuaEZ4aGdmUzE2UEh1?=
 =?utf-8?B?V1VMZU4rYWF6V1Q2cjRCbzhPZEkyVlVmdE1QL2VNSDdxbFlEVnNCT2lnd0dO?=
 =?utf-8?B?aW12Yms0cHpNOVZJbjFmT2kyZVdSZ1NzUnR3c1dzeUdUMzJsVEJIcFRWL0JE?=
 =?utf-8?B?aVdtUk9CNVlVODFKV1B0UkZBVDlXcHJOM05wRUZQNGI2dTBMZ2FpOVdXVUtP?=
 =?utf-8?B?QU5qa2RlQWM5YndRK0lKMm16UHZFQmY3cXI2blBVMDBYZEVhUEhtVU1VRXpY?=
 =?utf-8?B?YmtuRmlLSXBGRFlsMWoreGhzc0lXVGJ5ZEp0OXkzMUtOb0dIR2NwMGFjUWhk?=
 =?utf-8?B?TUQvY05Vc21ydEZVWnVZRzJ6UHcwUUlJYkh2WWkvazhsMGZreU5kNktmbnpD?=
 =?utf-8?B?SlRyRnBDbGlGaDVreldneGw0eERQWVFqRUdTNDRHUVcwamhzLyt0TTZJd1ZS?=
 =?utf-8?B?L2VSNUlRU0FhcEVaQmcvOEprV0wvTW13MmRLOWdOaFdXSUlnalhwaG14ZWwz?=
 =?utf-8?B?TnVzWTJWenhjb05MVXUvaXZtOGliVHhRZFFWcWFkaXdQMk9nV2ZjekMvc0Z1?=
 =?utf-8?B?TjZhQndqM3dNakNVZ3FXT3pweG0wNDJ0QTZKZXdocDRjZUpOWEppR0RUbGlV?=
 =?utf-8?B?Um5wVjQ0WWR0Qy8xVVI4SEs3c0MyL3NDeXlNam5WTUhIdnpxWVJzcjRyQWxU?=
 =?utf-8?B?Tk1FRzgwZ2VqTCtBczRvb2hHMW80ZlRwOFUrN2hYQWhoL3IwSWFFd3FDdCtP?=
 =?utf-8?B?VUVOMDR6KytvYjlaTEE1eFArNjFjNVRrbGtFSjZoVHdQcGd0M0Y4REhCa0Rp?=
 =?utf-8?B?V2NTNVZzYitsbkU5em5kUmt5TS8vN3kxMjZlUFduVENlSmZCV0tadVRWOWlI?=
 =?utf-8?B?b0dITFFxTk41KzN1NXZkK3RvL3phbXlnQ3N1TEVPc0xBRHNPVURaRmNpb0d2?=
 =?utf-8?B?eVRpek1lSUFMVzJXUWdOb2FTUnlZN0pwOWlEMGNETDRwV0RLYTYyd3Zmaklm?=
 =?utf-8?B?VkdialpFWFUxL2J5MkJHNUNwZTd2eTh3ZVVrOWtlQTUreGloUE05akN0KzFR?=
 =?utf-8?B?Z1A0SXRUUGtvM1RCbWhMcklOOEplNGREVit5alhmR2VPWDdIaWk0VmxtKy9K?=
 =?utf-8?B?blhRMFhkYTJzMUJzQWZ3ZFJlKzliK0xBbEREUU5qc1RsN3NJSW9sWVlxQ3h3?=
 =?utf-8?B?enA3bE5lOTF2UlpKRHlwTXU2S3hhZmZ4QXVhSGJ3Q1l6WElwRXNhZmtjdURu?=
 =?utf-8?B?dEFxNHMxck9hY2ZRYVRjZWZkNSsyNGxQRnhBcnN6NlVqakR5K0RKcFhxZzk5?=
 =?utf-8?B?RTkyZUcrZ2tKMGxXcEpMUDdMbG1MS1JhZkpWYm9QVU1pU2x6WDMyTUt2S3gr?=
 =?utf-8?B?YnRaRUM3WHRUVERNUlY3MEZnZC9hdVVzZE5HbjBwSmZOa0FuTUV0MlZwcWxv?=
 =?utf-8?B?WEd1akNaUng4eUxITmZFS0RmSjlKQktlZkY4YWwrRE55QkQ0RTlxNjl6cXRh?=
 =?utf-8?B?VVk5M2dIRVc2TnlFcWtYVThpWGFPOVZ2Y0FVN3N0azlHaWZZNG5OVlNQWjdj?=
 =?utf-8?B?SnJ0RTFmZmY2RXRFdVBHdFpOT3Vjb3pjZEtYVE5oQzlYSW9qWGI2NGk0ZlNz?=
 =?utf-8?B?eDlUY08rcTlLSEkrUGlFTThRSTdCREEzK0IvTzJPUThXNjgybUVCM1dWRStn?=
 =?utf-8?B?VHgrZlhISXFCVzg3RlUxb1lESnpxQmd5Nlpka0hHczBZYVVkMmhWYlVpR01y?=
 =?utf-8?B?a2plU2xpNmd6K0pHVEx0K0FZdVNDNlIxalBybWphR1JMUWZTTW16Z25aWlZ4?=
 =?utf-8?B?WGs3ZWgrUGp0eStlN3ZjNW93dWo0OXd5Z21RdnpVb1BKR3hCVVJJZWxFd0dC?=
 =?utf-8?B?bnppeWtIMm1ZVkc5citkQmdsQWxvNzc4UHFyV0FWY2FIZmdqejNKWTRYaVlu?=
 =?utf-8?B?bmY0RWd6RkVzK1VwdW5QcFlOemZ6cGp3RVFEV0Q4ZTdzL3ZaT0hkMVFBdGV1?=
 =?utf-8?B?b2c2MTZOdmdRb3dVZFlYZ3ZhZmhCOGtIWDIrZjJKc0dwWjRwcDhkK2ptTkEw?=
 =?utf-8?Q?udhN0/4iSxDNUBIPXT1IGuN66+AywrdYufylAoKZ3gcj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 969cdf47-2e1a-41a7-7692-08de27e0cb24
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 02:59:16.9199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8cqJbah0hi3rt2COYNThdOiV9E8/jLkaIKnuT0un/xPGtT3Tke9mEbhUE0Fd8dWZwXOrTWeaCpCt/TPpXlRlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4352
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

On 11/20/25 13:50, Balbir Singh wrote:
> On 11/20/25 13:40, Matthew Brost wrote:
>> On Wed, Nov 12, 2025 at 10:52:43AM +1100, Balbir Singh wrote:
>>> On 11/12/25 10:43, Andrew Morton wrote:
>>>> On Thu, 9 Oct 2025 03:33:33 -0700 Matthew Brost <matthew.brost@intel.com> wrote:
>>>>
>>>>>>>> This patch series introduces support for Transparent Huge Page
>>>>>>>> (THP) migration in zone device-private memory. The implementation enables
>>>>>>>> efficient migration of large folios between system memory and
>>>>>>>> device-private memory
>>>>>>>
>>>>>>> Lots of chatter for the v6 series, but none for v7.  I hope that's a
>>>>>>> good sign.
>>>>>>>
>>>>>>
>>>>>> I hope so too, I've tried to address the comments in v6.
>>>>>>
>>>>>
>>>>> Circling back to this series, we will itegrate and test this version.
>>>>
>>>> How'd it go?
>>>>
>>
>> My apologies for the delay—I got distracted by other tasks in Xe (my
>> driver) and was out for a bit. Unfortunately, this series breaks
>> something in the existing core MM code for the Xe SVM implementation. I
>> have an extensive test case that hammers on SVM, which fully passes
>> prior to applying this series, but fails randomly with the series
>> applied (to drm-tip-rc6) due to the below kernel lockup.
>>
>> I've tried to trace where the migration PTE gets installed but not
>> removed or isolate a test case which causes this failure but no luck so
>> far. I'll keep digging as I have time.
>>
>> Beyond that, if I enable Xe SVM + THP, it seems to mostly work (though
>> the same issue as above eventually occurs), but I do need two additional
>> core MM patches—one is new code required for Xe, and the other could be
>> considered a bug fix. Those patches can included when Xe merges SVM THP
>> support but we need at least not break Xe SVM before this series merges.
>>
>> Stack trace:
>>
>> INFO: task kworker/u65:2:1642 blocked for more than 30
>> seconds.
>> [  212.624286]       Tainted: G S      W           6.18.0-rc6-xe+ #1719
>> [  212.630561] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
>> disables this message.
>> [  212.638285] task:kworker/u65:2   state:D stack:0     pid:1642
>> tgid:1642  ppid:2      task_flags:0x4208060 flags:0x00080000
>> [  212.638288] Workqueue: xe_page_fault_work_queue
>> xe_pagefault_queue_work [xe]
>> [  212.638323] Call Trace:
>> [  212.638324]  <TASK>
>> [  212.638325]  __schedule+0x4b0/0x990
>> [  212.638330]  schedule+0x22/0xd0
>> [  212.638331]  io_schedule+0x41/0x60
>> [  212.638333]  migration_entry_wait_on_locked+0x1d8/0x2d0
>> [  212.638336]  ? __pfx_wake_page_function+0x10/0x10
>> [  212.638339]  migration_entry_wait+0xd2/0xe0
>> [  212.638341]  hmm_vma_walk_pmd+0x7c9/0x8d0
>> [  212.638343]  walk_pgd_range+0x51d/0xa40
>> [  212.638345]  __walk_page_range+0x75/0x1e0
>> [  212.638347]  walk_page_range_mm+0x138/0x1f0
>> [  212.638349]  hmm_range_fault+0x59/0xa0
>> [  212.638351]  drm_gpusvm_get_pages+0x194/0x7b0 [drm_gpusvm_helper]
>> [  212.638354]  drm_gpusvm_range_get_pages+0x2d/0x40 [drm_gpusvm_helper]
>> [  212.638355]  __xe_svm_handle_pagefault+0x259/0x900 [xe]
>> [  212.638375]  ? update_load_avg+0x7f/0x6c0
>> [  212.638377]  ? update_curr+0x13d/0x170
>> [  212.638379]  xe_svm_handle_pagefault+0x37/0x90 [xe]
>> [  212.638396]  xe_pagefault_queue_work+0x2da/0x3c0 [xe]
>> [  212.638420]  process_one_work+0x16e/0x2e0
>> [  212.638422]  worker_thread+0x284/0x410
>> [  212.638423]  ? __pfx_worker_thread+0x10/0x10
>> [  212.638425]  kthread+0xec/0x210
>> [  212.638427]  ? __pfx_kthread+0x10/0x10
>> [  212.638428]  ? __pfx_kthread+0x10/0x10
>> [  212.638430]  ret_from_fork+0xbd/0x100
>> [  212.638433]  ? __pfx_kthread+0x10/0x10
>> [  212.638434]  ret_from_fork_asm+0x1a/0x30
>> [  212.638436]  </TASK>
>>
> 
> Hi, Matt
> 
> Thanks for the report, two questions
> 
> 1. Are you using mm/mm-unstable, we've got some fixes in there (including fixes to remove_migration_pmd())
>    - Generally a left behind migration entry is a symptom of a failed migration that did not clean up
>      after itself.
> 2. The stack trace is from hmm_range_fault(), not something that this code touches.
> 
> The stack trace shows your code is seeing a migration entry and waiting on it.
> Can you please provide a reproducer for the issue? In the form of a test in hmm-tests.c
> 
> Have you been able to bisect the issue?

Also could you please try with 10b9feee2d0d ("mm/hmm: populate PFNs from PMD swap entry")
reverted?

> 
> Balbir
> 
> 
>> Matt 
>>
>>>> Balbir, what's the status here?  It's been a month and this series
>>>> still has a "needs a new version" feeling to it.  If so, very soon
>>>> please.
>>>>
>>>
>>> I don't think this needs a new revision, I've been testing frequently
>>> at my end to see if I can catch any regressions. I have a patch update for
>>> mm-migrate_device-add-thp-splitting-during-migration.patch, it can be applied
>>> on top or I can send a new version of the patch. I was waiting
>>> on any feedback before I sent the patch out, but I'll do it now.
>>>
>>>> TODOs which I have noted are
>>>>
>>>> https://lkml.kernel.org/r/aOePfeoDuRW+prFq@lstrano-desk.jf.intel.com
>>>
>>> This was a clarification on the HMM patch mentioned in the changelog
>>>
>>>> https://lkml.kernel.org/r/CABzRoyZZ8QLF5PSeDCVxgcnQmF9kFQ3RZdNq0Deik3o9OrK+BQ@mail.gmail.com
>>>
>>> That's a minor comment on not using a temporary declaration, I don't think we need it, let me know if you feel strongly
>>>
>>>> https://lkml.kernel.org/r/D2A4B724-E5EF-46D3-9D3F-EBAD9B22371E@nvidia.com
>>>
>>> I have a patch for this, which I posted, I can do an update and resend it if required (the one mentioned above)
>>>
>>>> https://lkml.kernel.org/r/62073ca1-5bb6-49e8-b8d4-447c5e0e582e@
>>>>
>>>
>>> I can't seem to open this
>>>
>>>> plus a general re-read of the
>>>> mm-migrate_device-add-thp-splitting-during-migration.patch review
>>>> discussion.
>>>>
>>> That's the patch I have
>>>
>>> Thanks for following up
>>> Balbir
> 

