Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28863AE9957
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 11:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F252D10E86E;
	Thu, 26 Jun 2025 09:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TvTCzBmO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE9E10E86E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 09:00:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfhMH6HHjfk9Q6lofk8ijiGIWApIDapSziKnHPYI+zXxDkIxkIHAZTC5TfPahacQMYm01JqV/QUnfoTjJZQM1NyCZbcSxp3uakmXSbgVOTNzCRrYAmAKVHw065gR3jvs8u/5pqgULsPlStTToYEiwODayJeMqyHIAxtwCXyxg5q/9g7MF5OVVFTRmv8Hai9ZzRulrsbJm1o2NVB4cDxZd7CVzWSIkjCdc7fCY/JCesz4k55VcQPehhgykwAY0N0O2SjDNncPiV4lfbNCPmoqBIRx53OHFdi/bEl6YwbqL2oM08mWUcjQX15dSVPE+vv4o33laJYRy4Ebyndx9A6x2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQRAvFS76sB45cthuK/pS6s+j1wpbsDaC0a2nQ0RCJE=;
 b=E7KozDbJFXLvCDxCkUhBiBWG40ekE3TjN+Th2pToW8eeu7W4I8E5N0p9n3ckwA12Z+GiWEYyVorzVK7AfJNz5UXuxMdf11I6zqf/v8obamuCHhz+ODfuJz0Z6ed59qcwGa68QnmLQT6YUPVoyaAfNLAjbxyuSbyRQ3qxJ5YVF1qMxKj13ewOPL7WtbPXbwZ4qCQCoMJrdnfnHKbiZNdfWKpgmnXYq0e6ox4kd1MPbNE0tr1VuU5JVYA+8zvBfv1mfuK/kqbV3cETrtcJhXjoPZEjLP/k+6ntRj5fEOYpjtmNfSYakvs8cSlhXXfkek7uEJxajwc3EbK3ynBtkw09GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQRAvFS76sB45cthuK/pS6s+j1wpbsDaC0a2nQ0RCJE=;
 b=TvTCzBmOxYei1TJS0ak1j5kxd+1zcggA1aq3iH3QG1m5awOAI3PIGvpGvjqp6feUVIn/EHiYXUhttyJxWATysjW/SjMhQ/e2Y+boin7KamRElRwPPgK80gHWPn2mK+vaweLarx6eJK7mz8JwW5fUmFIoEctEuF1HTMVZsGA++eM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7160.namprd12.prod.outlook.com (2603:10b6:510:228::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 26 Jun
 2025 09:00:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 09:00:31 +0000
Message-ID: <6fe45a83-576f-418e-9fb7-1a9a65d35db3@amd.com>
Date: Thu, 26 Jun 2025 11:00:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm: add gpu active/reclaim per-node stat counters (v2)
To: David Airlie <airlied@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, Johannes Weiner
 <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250619072026.635133-1-airlied@gmail.com>
 <724720cd-eb05-4fc0-85a1-f6b60649b1ad@amd.com>
 <CAMwc25ruHtW165VRuDv5_tjaZGcL5H9CWeTjcCstXK09bDPhdw@mail.gmail.com>
 <7dd0885a-7e7c-41a9-ae81-811fc344caf5@amd.com>
 <CAMwc25ohBsMO=VUJzk+_DLdWLN448P63udwx0Zf0CktTgca4UA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAMwc25ohBsMO=VUJzk+_DLdWLN448P63udwx0Zf0CktTgca4UA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR22CA0014.namprd22.prod.outlook.com
 (2603:10b6:208:238::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: 01bbf26b-2b6f-45f4-2dea-08ddb48fe779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3ZlRzVodW94dzJwQm5CSmladlZTbFpQRForTnBZcVdMalQwRXcyd2dPSVNK?=
 =?utf-8?B?M0NXeGVhN1ZWMUNlVUk2c0E3S1pCM2JQeEpoQnQvSW14UDY4TE9LN1pXU1dE?=
 =?utf-8?B?OFhma2ZHMU9qNXBqcTFBbUxFME1BUGoxRnBzNDk3OUhRQjd3NTliUHJzcisv?=
 =?utf-8?B?OWVWNGMvblZXaTBUekg1QlJxcDV1RDlhWTFNWjRWMk1pSHJkL1c2QmtCNzRE?=
 =?utf-8?B?NFdRNDlEWWtMRi9zSEJYZ1F3RU5zSDN4VHpDOHJxRHdCYklzbEZIckJaT1N6?=
 =?utf-8?B?akt4alRpNDZQMjlhRldxaXRXblpmRkNtZnQzWklxYnNyakJqWnBMeHVzYitw?=
 =?utf-8?B?Mmx4NGRoR1MzZ00xdWFYQlNrMVlpWUJjeXdUd0dGdnlSbmFNS1kwdDBoMFB5?=
 =?utf-8?B?ZytJbjhwZ2c2WmdrNy9wZDJYNTg5TkFZbFA1T1h5N2JrdlozRkhFeGo5d3BX?=
 =?utf-8?B?SE4rRU9DYUo2VFBmek5OMlhLbGU4eC8yakRQMGlTWEVhQ3RXcnhvN3NUaWkw?=
 =?utf-8?B?a3BGQTI2ald2Z3FZazhYKzVmZDJ5ajdGMnphb2E1bEF6RS95eTNjN1VMM3dl?=
 =?utf-8?B?TlVWbXpzNlpKaU42M0NoeUNObnphN3BQc1BjcElJbk03Q3lUMzdGaFpUUHpY?=
 =?utf-8?B?M0hIU2RFTVVQTTIxR2hXK3V6VHhsTEZCNDh4dUh1Nlh1TGIzaTFhOElrN0x2?=
 =?utf-8?B?cFVkRUxqL2oxZlhORmt0Ti9FY2QzVGJVNGVZeWpoQnRsL1lOQ3IzYmRYTUM2?=
 =?utf-8?B?eFBlMjhWRFdJMFFCMTU3UzI4N0VtOHVqa3dvVnlFckJYNWFlUXdtRUU3RGh3?=
 =?utf-8?B?OVVzQjVxdXRCU0JkZ0tPYWtzdkVNd3liUkZ0Y1NFTGRWRmd0d0szNUVtR0pC?=
 =?utf-8?B?bmNCR1FkRkkrV1YraktpZnhnUDRZR1FHYUltbUR5ajExY3ZSNWlhNjZ3d0g5?=
 =?utf-8?B?N3EwT0hweU5QRWMrT00zNGpvc0RlM0ZnWFRwOGo3eFVld0RLNTZ5QVZ2S0ZJ?=
 =?utf-8?B?UFZnOGU2WndDUURwU0RPSkRWL3M3N1FnaytqRDNWT0VUbzRTd1FTdnBhemxY?=
 =?utf-8?B?WG53RFAveXE1K2Jjd2hyeFNhMlJ5YnlNZ3lxLytuUXJDMHVDTDRYNTZ1WFJV?=
 =?utf-8?B?dWJrenh1bDdGUGJ4VytmVzBXQjlQYjVPcDZqQ1VlSUFOTlpva3M2ZUxlS3JQ?=
 =?utf-8?B?dTlBRm9wQ1AzckZwMkxSbVQ2aFRoNFJvLzQvd3o1RmcwQkpoaDZMMld1dVhp?=
 =?utf-8?B?MzdzTW9MM1ZPNXJNUzY5aTVaekN0cXJ2T1M3UTZiTzZ3S296Tm95ZWtGVmxy?=
 =?utf-8?B?OHNKT01XbHBSSWRtT3lTbjVRMXZoZzI1QTliV1pETG1nc1dBaWRidWZXT1Fo?=
 =?utf-8?B?TnRmb0lvcXFNbjBCbHV4Lzh6VVBqSUM1WGIrZys1ekdwM0VXcTU4NTVkaUVz?=
 =?utf-8?B?cmhtc3BqQkVhU2JpN2VRaG1lTTNPNmpkMm5ORG1zRlg2UGo1bGdKM1kwZVJL?=
 =?utf-8?B?aUJ2MzNhUVF3R050bE5idVlybnFCWEk5a1M3cXUxVDdwVHNObEZvSTVtQnhj?=
 =?utf-8?B?Q0REcU9KRTZUNXBkazd2a3o1OERkaVgwK3czZFhTcklFZ2RiWkk1dXErbitw?=
 =?utf-8?B?VE5jTjNHVW1SSG1FVk5RcmxlWWxQMWx4SFZodDRoMUpNRGs0MHVJT1gxM1p3?=
 =?utf-8?B?V2MyeTFsb25qT2cwN3JITWR0MlMrMjMzVTE5NG9qZHY3bDhhMDlGRWxsSWpC?=
 =?utf-8?B?V2lSbFZEUm5EMjhRWUJYd05DK3N6WmhVS2xndEtuMVdiMy9NbXBpUFFjekRv?=
 =?utf-8?B?bHB4bHM2aVRDQzhUTk9KUVBvOE5reW1xaER6ZkNGSHVlRG5wRnNvSGU0bWlt?=
 =?utf-8?B?VXlaZW1KTFo3QWpaVEVBbDZhZnpxR0thNktld3BBQXQwb3cyWHpQeHcvNTlI?=
 =?utf-8?Q?+WwM5oh8oNk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUlzNU1CRTYraEVEVUloa3BnSEtXTTZlMnNINHYwaDVTTWdpOWFJaE9kbXIv?=
 =?utf-8?B?dlBSSFpuTnhCWE93WUtTaFBVdEFWalp0U1BkZ09BRWRVMFl3MStPdUpnVkhG?=
 =?utf-8?B?bnBpazlOcWlyRHBaNlpqN3FuNW83bkZpNTI2REYxMzYxdFc0ZmdFZ3dlQ3F1?=
 =?utf-8?B?QTAvYjVscFJPR2t1RnIyUm94UHNub2ZwY3ZiQ3dQcUcwTjdKTDlINlV2WExv?=
 =?utf-8?B?T000ZTBNZ0FTMXJnU2gvdXdxWDdiaVRoR0FNNkg0Uk1GdFA1VFFld2JoMXIy?=
 =?utf-8?B?SnFOZXdSb0QrQzhJaTc3TUlCU25KQ1pNdktlWDlBUWYyRTNnQ3V2T3A5d1N2?=
 =?utf-8?B?ajJYODJWalcvTUkvWTdpb09HK08wcjFzTUdUa2tDZ0JFanh0R3NMNzZXUi9Z?=
 =?utf-8?B?SVNzZ0pYTTNjdUgzSmpFQWJVSUJjZndlT1F0Z0UxRHYzWk5IaWU0VHI5eUM0?=
 =?utf-8?B?OS95dEc5YmppWEZmZXV1QjdIZlZCNk5WNW5QN3U2cGE3Y01td0V4QVo5UVov?=
 =?utf-8?B?cy9OemRYQ21VTENSSXZvL3VtUzlPd0cwbHFXWDNhakFXRjhIc2RoTE9nK2lO?=
 =?utf-8?B?WGx5S0RWY2UwelZTK0RCTnczVG5CQUJJSVgyOVpGaUsyTTNGMHNpZSszWVg2?=
 =?utf-8?B?WUNJY2hjaEpTN2t3V1hsWG5iYm85bHJxTElqRldSY3hQU3VxYkRBT2FVYWcz?=
 =?utf-8?B?TGpIUy9IY0pTS3E2Y3NiM082bXNmR2drVXdaNEhoWWoyWTRrNm1laWJRNitL?=
 =?utf-8?B?dndLUkRvNzdFYitZcXp3cFNEV05pN0ZUYTdKYUxqQ1luV1NZWXY1NXVXQlJN?=
 =?utf-8?B?VCtpSEJiSjFIdW9ZajBGMDErVFVmR210UXlIS1hWVWZWTkZsSFN1eEUzc0Y1?=
 =?utf-8?B?SXpkK2RLd25EWERqL0tUQTBMZC9MUCtjRWxjQnc5alMwMit6cjh5ZUY3R0pW?=
 =?utf-8?B?bHVuT3NVT0FzSU15V1Y4TlkxUkpNRm1mOUJzNDQzQTlQbmMzTFI2QmRtL3Uw?=
 =?utf-8?B?dzlxVzVQYWdPY0lGNGZOVjJWWE0wVlhvdHFvVVp1b0ZjOGkrOTBPYjVDeW1N?=
 =?utf-8?B?a25xbk1qV00vaWw0MWEzeG8zdkcrbHVXak9QcUo1K09JbllYMUhic0t4OTJS?=
 =?utf-8?B?OEFHRXZwdWQ3OFZLRHVMQ1V2U2FBdFJvNzByTmVYVG9tQ0lVUG5aVVlPeDRq?=
 =?utf-8?B?R0RRcFVVZjgvVXltaGl3VklwdnhDaXg4QkdNZGV0TWNGNWE4REdTNWdLTzNB?=
 =?utf-8?B?U01ESTFiRjd6UjZrSit5THVJS1p1M0diMVN3MVk2RDByZFp3TGJxQkZYY0lw?=
 =?utf-8?B?ZDVJZ2ZzQVBMajhIeG4xeURzMlhqc20wVFVjM0xVVlJhNEhKQUlhNE1qdCtD?=
 =?utf-8?B?T29CR0I1aW9EdHpSTFQ4aHlxNDBLWEZRUTRYMjh4WUJvL2ZvcVBPRXdNYVJ2?=
 =?utf-8?B?OW56UG5zTTNsVlpEazdvTjRGbHBvaTVVOUQ1N01NQ09IcFpUNUMxajlzZ213?=
 =?utf-8?B?dkxWMkY0djc2M1Jab3ZlMnN6a085ek9WeWp1ZWo2Q2xSQTdVVllTNmdieW5l?=
 =?utf-8?B?VmFCNFVDTGNNbVRyWHM3Y0dpT1NGQ0UxaWFmdU81YjFjdWk1VDNPaHQ3K04w?=
 =?utf-8?B?QnBscEtLOW85bFE1Z3JhZGtuUFVDRzJkN016QWErOVBEUmFUeFlMVmtoUXly?=
 =?utf-8?B?MEczUmdrMW5KZ012bFFjMTJ0ZmxTOUVPVmh6THkrMEgrS2R5L2F2NGMzek9Q?=
 =?utf-8?B?ak9hY2VwR3lxTXhKRzBjVUhwei9Fc3hDZEw5ZGZsbDJWaDNwMTVJRy9yN094?=
 =?utf-8?B?c3lXSUxwTWRrMk5KaGdQaWxkTnRSMEMramF3cDVzVURWZ2RoOGRKM3REL25x?=
 =?utf-8?B?WldteUs3V1g4N2ZaeEFtZUpYQ1lWRm8xakpQWURqMXg1YTdvdkZJOHZCa3Za?=
 =?utf-8?B?RXY1czVLbTJBWVJubDAwOUZDaUs2cmp4OGNoUXN4S09ZSndmV2NVWUhCNTB2?=
 =?utf-8?B?Vkl0KzcwUVI0eXQyaWNUWEFMOHAzalYyUHZ6U0lTVFBBRWxNNnFsZzFEMHF2?=
 =?utf-8?B?Z1NIcTBtNkNJODhxUkI5K2ExU01Zbmx3ZVVoNHpXZEpyQjhYTHQwR2JsWXJn?=
 =?utf-8?Q?EM/Q=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01bbf26b-2b6f-45f4-2dea-08ddb48fe779
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 09:00:31.4645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUUeIh5O//sqkQXPN1wvAlGgmh7orycyrwdsMOFJecquuwgLALvorgEhu848ltKt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7160
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

On 25.06.25 21:16, David Airlie wrote:
>>>>> diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
>>>>> index 5236cb52e357..7cc5a9185190 100644
>>>>> --- a/Documentation/filesystems/proc.rst
>>>>> +++ b/Documentation/filesystems/proc.rst
>>>>> @@ -1095,6 +1095,8 @@ Example output. You may not have all of these fields.
>>>>>      CmaFree:               0 kB
>>>>>      Unaccepted:            0 kB
>>>>>      Balloon:               0 kB
>>>>> +    GPUActive:             0 kB
>>>>> +    GPUReclaim:            0 kB
>>>>
>>>> Active certainly makes sense, but I think we should rather disable the pool on newer CPUs than adding reclaimable memory here.
>>>
>>> I'm not just concerned about newer platforms though, even on Fedora 42
>>> on my test ryzen1+7900xt machine, with a desktop session running
>>>
>>> nr_gpu_active 7473
>>> nr_gpu_reclaim 6656
>>>
>>> It's not an insignificant amount of memory.
>>
>> That was not what I meant, that you have quite a bunch of memory allocated to the GPU is correct.
>>
>> But the problem is more that we used the pool for way to many thinks which is actually not necessary.
>>
>> But granted this is orthogonal to that patch here.
> 
> At least here this is all WC allocations, probably from userspace, so
> it feels like we are using it correctly, since we stopped pooling
> cached pages.

Well what the kernel does is technically correct, it's just that userspace wants to use WC because ~15 years ago that was state of the art.

On today's HW using WC has not the benefit it used to have, but the kernel still has to deal with all the complexity and overhead....

Just ignoring the WC flag when userspace sets it and only setting it when the kernel finds that it is necessary would still be technically correct.

>>> I also think if we get to
>>> some sort of discardable GTT objects with a shrinker they should
>>> probably be accounted in reclaim.
>>
>> The problem is that this is extremely driver specific.
>>
>> On amdgpu we have some temporary buffers which can be reclaimed immediately, but the really big chunk is for example what XE does with it's shrinker.
>>
>> See Thomas TTM patches from a few month ago. If memory is active or reclaimable does not depend on how it is allocated, but on how it is used.
>>
>> So the accounting need to be at the driver level if you really want to distinct between the two states.
> 
> How the counters are used is fine to be done at the driver level on
> top of this

But then you have double accounting. E.g. the allocation backend says that this memory is GpuActive and the driver says that it is GpuReclaim.

Maybe making GpuReclaim a subset of GpuActive isn't such a bad idea? Alternatively the driver could decrease GpuActive in favor of increasing GpuReclaim when it has a separate shrinker.

>, though I think for discardable there is grounds for
> ttm_tt having a discardable flag once we see a couple of drivers using
> it, and then maybe the counters could be moved,

Well it is certainly a good idea to have a discard able flag in TTM, but it isn't used that often and the last time this was brought up it was abandoned as to much work for to little gain.

> but it's also fine to
> use these counters in drivers outside TTM if they are done
> appropriately, just so we can see the memory allocations as part of
> the big picture.

Yeah, that is what I'm worrying about. In drivers we need to be super careful with that to not come up with incorrect numbers.

Christian.

> 
> Dave.
> 

