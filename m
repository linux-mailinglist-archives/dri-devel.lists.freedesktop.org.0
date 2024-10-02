Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA93898D23C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 13:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6908510E6F9;
	Wed,  2 Oct 2024 11:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Pylyy0hF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6940610E6F8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 11:32:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSLjwrvmEXTcvyD6oJmfHONAT3tDwLOu4TLdM++OlNSynAiIXr8gyVYlYTmmQv7sI+g4qSR3NlGIs1f1aiCAXx9bh6ovtGYrg4pIAfBwIop7EMJ88oWD0JvYmqM2Bpno601KNs/62eSiM4hgPaXuBgUC8KLYgWyAFN1nEgk/mJIpf2vNpsHy59MD2WwtWUR5I6npwv8WiQcM6gW0UmV1kgYj0T7Vrq9LHkPCKVsv9Kr/lkKkn+Lu3RwnnCWs+pc/uSaZ/zUc+Zd+O4Y7RhV2RcUP3ian9uKo5aQy+mmH4UX3blNYBWQr3sW/CblLTap5yD8v3LUBwrDB1Qr5zcBA/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSJXf+xOwtK3cCZzQU7EnE88iTMAfV9xyQWviCV9PEM=;
 b=NG3EVFlUtLrCqgJnCbUz2xN6NeOduQxcRtiMS17rWZJegMc03THQMawr7PgYDwkcb5kf22oYXVa/KNU3c+SSRXzJSa83aLG+rQVu6qSdv2HVUbL7C9lMMrcMAKAmXsSlIKrZ8z9ygztrR5s6K00yJ1SH/3CEsUxEh9fN3mXINyYBzYbXuNx98ElkW0C88EWkCYe4a/rvmgp0IQmPWzYp2oygPKgpR3ISRKhgfS+pYg8gKsz/mlFYni4U+Xb1t3yI+ufeYwazieffKXvky6zwYMMqQnGuFtqOlSj+7VvXHBeaoK18pjuRZSz5Q4boT6paBZqcQs6I8YcrRYiwRgbelg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSJXf+xOwtK3cCZzQU7EnE88iTMAfV9xyQWviCV9PEM=;
 b=Pylyy0hFyTw5AQeH5khWo52ZTiCxQSTj6NkE6lMTjG+fmSBE0b2fD18WaFBzmPLn/fZE4XYoIHsMx7YGy7L13+fKkNyLGKLqokEPlC4LeNXCCW/EBnKQWgRCXPdp6NFv3ySchfeox9OvfPO45Mt5ZB14haSR+Dgqh2dh2pq5I1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7299.namprd12.prod.outlook.com (2603:10b6:806:2af::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Wed, 2 Oct
 2024 11:32:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 11:32:13 +0000
Message-ID: <44e10dcd-db02-4ad1-a706-5713f33c9478@amd.com>
Date: Wed, 2 Oct 2024 13:32:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
 <ZscDox5KoiNHXxne@phenom.ffwll.local>
 <3afe3ab2-4a58-49a9-acd7-c989980c68f2@amd.com>
 <Zs4EPT1DR7OrE5X-@phenom.ffwll.local> <Zs4Ss8LJ-n9NbBcb@phenom.ffwll.local>
 <c890ecbf-e7eb-479d-bb54-807edd1f66e6@amd.com>
 <ZtWca-cpqUsE8WTZ@phenom.ffwll.local>
 <4c634e5c1bd9907f315d8b3535ebb6154819d5ea.camel@linux.intel.com>
 <4966db2ca3009967de47af018c3e10a30dbacd08.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4966db2ca3009967de47af018c3e10a30dbacd08.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0248.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ceebc8-0bd1-4438-9d21-08dce2d5dc60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTAxNk5uY3BZWGsyWmNGZHhmZ2RaUjBrRkNOMFMrd2xBMW04T3BqMlpOTlNm?=
 =?utf-8?B?enpmWHdwMWlhdTd6UGxickFHL0I5aVkvZEJ1ajhwZHhhSzZweC9ib2IvTHlC?=
 =?utf-8?B?ei9JTFdFME1RZHd6VTJhclVTK0U5VmZiOUZYRFk2RFBGS0lXUkdRQ1BzdmRh?=
 =?utf-8?B?T2tMbEUxejdWbXR1NnBlWWJKaExoQ2ZtMWx6SzNCeDRDdlJDZWpZTThTR0x4?=
 =?utf-8?B?Nit4eTduak5yMXIrM1BXbytDODd1MEhaaWNJNGl1VklSa09oODQwdjFXNDEw?=
 =?utf-8?B?clp4ek1kajUvcGJ3akd4ZjV1VlBvUUM5VFVIaS82amx2aVVnOWcyNlpjUHFP?=
 =?utf-8?B?R0JDb1BjWVo3R1poUThFaFQ0VmMwTjljMW5McVNXQzE3WXlMbkx4cmUvN05o?=
 =?utf-8?B?QW8zMUxTSi9IMWNMRGI2UjAzejNVMVZzNkg4dGVQZTZJc09mcnlYeXY2S3Ry?=
 =?utf-8?B?OHR3dmNDVzllZ3A0K3kwUlJtbXIrdCtUbWtaWVg2d1B2RmI1MEk3bmJBajVO?=
 =?utf-8?B?bHlDelk0UFVDdlZORDdyTHlLQnpnTHVHb2ZweVFLZ21oVDBFZWtISXB1L3ox?=
 =?utf-8?B?Rkh5S2pZSUg0S3JuYXpxMW5OVDZPRmdhL05VenBaYjZJSXVrMmxqaytuWFor?=
 =?utf-8?B?Tks4VGdwUXZweWM0L3RCVEYrWXp1Q3o4Z2JyTnF3b0lGcXhJSHcweVhPdjJi?=
 =?utf-8?B?Tm9RdTlnZ0htMkswZnk3aStsSkIvTlVQaGtnS2J3NDE1TFNta3IwZXJUVU01?=
 =?utf-8?B?Vi8xRHNuMFRSaTZ4eWtJNkFOK2RrUVRValIvWWp6dk5lejM0U0RNb2ZVdnZC?=
 =?utf-8?B?V0xMTlRrbHlEMDl5a0s0Q2JneTJ3dTRtUlFUVlVJRU9kdVBsWTVPWkVMRmJF?=
 =?utf-8?B?NVltTnZoS0NKVUk3cFpwSENSNFI2bnBsNmdRV2EzTXByaEFGQ1JTUGZsbUFs?=
 =?utf-8?B?VldFOXhxYmxxbDF6MDR6Vk5xcUtKY3dnbUpJTkVCWUYyTnBXVDIwL2t3WFF4?=
 =?utf-8?B?OER4TFFFVk5BUG82dFRkWGxpelF4aWRxZjhkbzJTbU5zQmR4WWlVY2cvZ253?=
 =?utf-8?B?OVdpWExqVzEzd1ZVVndtdzFhOTVXelZpeFU1czJZbnQ2Y29DNmNsK0s4MHJh?=
 =?utf-8?B?VHdpQ1lsUU4zZCsrK1luYjd2Wkx4WjE0Q3dJMm82ZFZUcm9zcUxETXU1VDVK?=
 =?utf-8?B?a2xDZkVMUm9TMTdqbGFYdDZoRHZmN2tmazh6R0ZXclJNQzVWYkZLRWNUdGZD?=
 =?utf-8?B?NDdkenFlMDhpclBzbGtKSExrcklkNW1vQTJFNjV2emVQMnhmV0Z3MnNoVVhI?=
 =?utf-8?B?eFVIM01IbDRLc3JWdW1WbklKakRzY0lKenh5eHNYVWhqR3pzdndNSjNDK2Qv?=
 =?utf-8?B?bTVXek1ESGFKYmtQeThldHNpTWVkSkxKVi9QamhkOXNPTWRIWjY0djcyR3Qx?=
 =?utf-8?B?bDkyK2dMTHdNMlNyelB0OUZIcyt6aE1nTHhrekE3UGFKZjQzY2FDOGlpWVF1?=
 =?utf-8?B?aUU0SWpENW5mclVSUE83RCs4QzFGU2w4di84a1lya25ZaWZnSkhaRkw5alZQ?=
 =?utf-8?B?R242UnM5K0doNzVIV0lVaUVhempzODVGV2hUc3JXWktsVDNPTTV1OFE4Yktm?=
 =?utf-8?Q?R62XZHGzRG9jV/89sJUUw4rQgsIpvk9G5YwuFamKu0Fc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFpHUmRtNHpTNmJkSjNqYjQ5Y1k4KzVBb2lLYlhTZmpaZDF0RG5JbDBhNzhM?=
 =?utf-8?B?dlBPVGZlRXl4UkVia2tRMzBBbEVRWkxZbnNmelB1aWg1bGtyQ2YxdkxCbHNk?=
 =?utf-8?B?YjdtWWlFNWFiNXozczA5ZVcrVnF4WkNxdWUzYXBya3hVNUxITGk0WHVJZ1lm?=
 =?utf-8?B?Z0l4ekM1cTk4MHRrNXZuUFlPNU5SZjNYY2lxVG1NVVk3Q3NaQkNsRnJ1a3Vm?=
 =?utf-8?B?a3BVa3BCeVpoRTJVamk5eUNjUVQ0OU8zSWw2cjNta1hGOEtzSStvTGN3R0VV?=
 =?utf-8?B?dHZ6MVdBRlIyQ1lKRUI2ei9DV2Vzb3ppU3NLYk4vYlFRNU9hOFpqYmdERGFa?=
 =?utf-8?B?ZFlsanhzS0pleW03YXJSNklidEpnQTRoMTltbUlhaWdBKzl3Ny9reXFaL0d3?=
 =?utf-8?B?dmtWL2FvM0tMR0JKU3BDWUZvL2FlK1BWZkw5Vi8xL0NIWVN3WWRsUWpKYmUx?=
 =?utf-8?B?ekRLTlgwZEQxZ0t6bHRVcktZYzRlTkIxYXc5NUo3ZGRVWlBSNGE1b2V4dTJN?=
 =?utf-8?B?c2hIRXI1MFlQb21wVkluVzB5NVEvSi9FTmJuSlEwREFwRjZJYWF4RytmMXVM?=
 =?utf-8?B?QVhMNmxGek9ORzU5QVlXMHhnelpZbUNmOGRhNU9Gb014R2wwem1acDJhUkN2?=
 =?utf-8?B?R2tyVE9BRGR6dkhxS2lEZWlnZDZHMjg1MFpqZ0hBTTFmeXBQSk5iNWN0VmlO?=
 =?utf-8?B?VWh5WDRjeEdIYmFuN1NrR0RScHUrTDRGcEhuU3RnaGNrOWdzTEpHT3JON29K?=
 =?utf-8?B?WVdyR0VNVXRMWW1pdm05SlVndlNtY3JWSE9Vc1lDVE5nRVZpa29aM21kS1hp?=
 =?utf-8?B?eFhEMUxRSlpxbVJCSHhjUlltZWJRMzlEVkMvTkNNSnQxR3FBVk5HTWlZWjVL?=
 =?utf-8?B?c2UvaWhmN2hvWCtrQzJZU01SbEZQWUs5ZW9pMnVQV29nbUswb3dzM1JRQWlY?=
 =?utf-8?B?Z3FocnlzZERTYXM4b3dBNjNmR2VFbHVRWkFOMEpFTmIzcEJiMUEzNEdxT0Zx?=
 =?utf-8?B?NkpEOGNnNEQ2M1FVSW1MS21UYlFWZExzbyt6cHY3a1VrKzhwR2Z4VWVJOTlW?=
 =?utf-8?B?aWdHQ2pFM3poZHlGRUROYWpqbnduWW5iSTlTT2NHQ1Npd2pld25raEd2Y1Zr?=
 =?utf-8?B?YjhzaUJVMXNHeEhLMGlTNXNqSHBnellFV2pEWm5XV3Nka1dqUVNYMmdyUjNT?=
 =?utf-8?B?REdBUXZlcnV0RmR1Z3MvK2llQkJFcUdkdXlzbnlVM2g3Q1p0UzZaay9LaXU1?=
 =?utf-8?B?S29VR3VEeit5a0k4YUllMzJpZXNzTUlCT3Nqc3B0dEY0M0s1RTFiNHBVR3Ba?=
 =?utf-8?B?eCtqNGNaM2VXaVVFSjI4NVNZQkpyVFNWVFVpVHlOazhzSm9nYWt5WlVJajE1?=
 =?utf-8?B?bWpmRUdXNXpQYXEyOXBOcXlGNGNEUWhNcC9BNHRWZkk0ajJrYkw3SUR4RENL?=
 =?utf-8?B?UEQ2cWFoNUR0cGxIUlBraFNxV216eXhRZCtRN2xhd1hpVXZiYTUyalRFNktK?=
 =?utf-8?B?dWtTMUhwN0srUk4yK1NyQUQ4YVI3aTQyWG84SmZyRlpOYWhNZGl6c1VvYkhV?=
 =?utf-8?B?MFV4cXlXZTJlTzlSQ09USGVMNjZQU1N2SE9TcXlaeVJaOWhpeHhJOFhqcWhS?=
 =?utf-8?B?cWdEbXlQZk1oUmxsOUw1cnpIendFbUh6YUtXMFJuNVlMQ0h2WjRJWTVsZHVU?=
 =?utf-8?B?Ulk3c0JjdDBna1crUEtaaTcxdjVUOC8zMWxwMVJQaHlhc2tyZ3VrWkU0NFdJ?=
 =?utf-8?B?L2dJc05xT29EV0YwRXZrSjBRVDRzK3czb0d0aStkVE1RUlFXaldQNTdKY2t4?=
 =?utf-8?B?THEvUnJBQ3BadnB4WjRTQzFTWFJOaUg4SG9HUmQxdzl5YmF5azVuUko3WUZI?=
 =?utf-8?B?aTRwOUhwZlJMTVAxeFB6d0UxSnJyT3RsOW1SNkEzcXFKaUowRWdNRWI2VE9s?=
 =?utf-8?B?TEtDMXlydWlOZXVXbFVZVEowRlpiSW9oaitXM0J5Vm9iV0duYTU5RkFYOEcx?=
 =?utf-8?B?RGxLTGltdy9MRjB4RE02elppUDNyc3JidFZvN1hKY2RybjRHV2lqZEp0R1B6?=
 =?utf-8?B?ZGt6bEYxcHd3U1RBNTRzSDhEeG85MUhHZ0ZUNmNvOWFKSFJsRkIyYnFzdG1n?=
 =?utf-8?Q?JpH0uN/sBfxH+7pwucd/HQtZK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ceebc8-0bd1-4438-9d21-08dce2d5dc60
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 11:32:13.5265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuxblCgJOQFVHoZnWHqqkYJS8Zxj/hsSTdia8vJr2tzbqvFeQO130fDIoJHuATdn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7299
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

Ah, yes sorry totally forgotten about that.

Give me till Friday to swap everything back into my head again.

Christian.

Am 02.10.24 um 13:30 schrieb Thomas Hellström:
> Hi, Christian,
>
> Ping? Can i get an ack to proceed with this?
>
> Thanks,
> Thomas
>
>
>
> On Wed, 2024-09-18 at 14:57 +0200, Thomas Hellström wrote:
>> Sima, Christian
>>
>> I've updated the shrinker series now with a guarded for_each macro
>> instead:
>>
>> https://patchwork.freedesktop.org/patch/614514/?series=131815&rev=9
>>
>> (Note I forgot to remove the export of the previous LRU walker).
>>
>>   so the midlayer argument is now not an issue anymore. The cleanup.h
>> guard provides some additional protection against drivers exiting the
>> LRU loop early.
>>
>> So remaining is the question whether the driver is allowed to discard
>> a
>> suggested bo to shrink from TTM.
>>
>> Arguments for:
>>
>> 1) Not allowing that would require teaching TTM about purgeable
>> objects.
>> 2) Devices who need the blitter during shrinking would want to punt
>> runtime_pm_get() to kswapd to avoid sleeping direct reclaim.
>> 3) If those devices end up blitting (LNL) to be able to shrink, they
>> would want to punt waiting for the fence to signal to kswapd to avoid
>> waiting in direct reclaim.
>> 4) It looks like we need to resort to folio_trylock in the shmem
>> backup
>> backend when shrinking is called for gfp_t = GFP_NOFS. A failing
>> trylock will require a new bo.
>>
>> Arguments against:
>> None really. I thought the idea of demidlayering would be to allow
>> the
>> driver more freedom.
>>
>> So any feedback appreciated. If that is found acceptable we can
>> proceed
>> with reviewing this patch and also with the shrinker series.
>>
>> Thanks,
>> Thomas
>>
>>
>> On Mon, 2024-09-02 at 13:07 +0200, Daniel Vetter wrote:
>>> On Wed, Aug 28, 2024 at 02:20:34PM +0200, Christian König wrote:
>>>> Am 27.08.24 um 19:53 schrieb Daniel Vetter:
>>>>> On Tue, Aug 27, 2024 at 06:52:13PM +0200, Daniel Vetter wrote:
>>>>>> On Thu, Aug 22, 2024 at 03:19:29PM +0200, Christian König
>>>>>> wrote:
>>>>>>> Completely agree that this is complicated, but I still
>>>>>>> don't
>>>>>>> see the need
>>>>>>> for it.
>>>>>>>
>>>>>>> Drivers just need to use pm_runtime_get_if_in_use() inside
>>>>>>> the shrinker and
>>>>>>> postpone all hw activity until resume.
>>>>>> Not good enough, at least long term I think. Also postponing
>>>>>> hw
>>>>>> activity
>>>>>> to resume doesn't solve the deadlock issue, if you still need
>>>>>> to grab ttm
>>>>>> locks on resume.
>>>>> Pondered this specific aspect some more, and I think you still
>>>>> have a race
>>>>> here (even if you avoid the deadlock): If the condiditional
>>>>> rpm_get call
>>>>> fails there's no guarantee that the device will suspend/resume
>>>>> and clean
>>>>> up the GART mapping.
>>>> Well I think we have a major disconnect here. When the device is
>>>> powered
>>>> down there is no GART mapping to clean up any more.
>>>>
>>>> In other words GART is a table in local memory (VRAM) when the
>>>> device is
>>>> powered down this table is completely destroyed. Any BO which was
>>>> mapped
>>>> inside this table is now not mapped any more.
>>>>
>>>> So when the shrinker wants to evict a BO which is marked as
>>>> mapped
>>>> to GART
>>>> and the device is powered down we just skip the GART unmapping
>>>> part
>>>> because
>>>> that has already implicitly happened during power down.
>>>>
>>>> Before mapping any BO into the GART again we power the GPU up
>>>> through the
>>>> runtime PM calls. And while powering it up again the GART is
>>>> restored.
>>> My point is that you can't tell whether the device will power down
>>> or
>>> not,
>>> you can only tell whether there's a chance it might be powering
>>> down
>>> and
>>> so you can't get at the rpm reference without deadlock issues.
>>>
>>>>> The race gets a bit smaller if you use
>>>>> pm_runtime_get_if_active(), but even then you might catch it
>>>>> right when
>>>>> resume almost finished.
>>>> What race are you talking about?
>>>>
>>>> The worst thing which could happen is that we restore a GART
>>>> entry
>>>> which
>>>> isn't needed any more, but that is pretty much irrelevant since
>>>> we
>>>> only
>>>> clear them to avoid some hw bugs.
>>> The race I'm seeing is where you thought the GART entry is not
>>> issue,
>>> tossed an object, but the device didn't suspend, so might still use
>>> it.
>>>
>>> I guess if we're clearly separating the sw allocation of the TTM_TT
>>> with
>>> the physical entries in the GART that should all work, but feels a
>>> bit
>>> tricky. The race I've seen is essentially these two getting out of
>>> sync.
>>>
>>> So maybe it was me who's stuck.
>>>
>>> What I wonder is whether it works in practice, since on the restore
>>> side
>>> you need to get some locks to figure out which gart mappings exist
>>> and
>>> need restoring. And that's the same locks as the shrinker needs to
>>> figure
>>> out whether it might need to reap a gart mapping.
>>>
>>> Or do you just copy the gart entries over and restore them exactly
>>> as-is,
>>> so that there's no shared locks?
>>>
>>>>> That means we'll have ttm bo hanging around with GART
>>>>> allocations/mappings
>>>>> which aren't actually valid anymore (since they might escape
>>>>> the
>>>>> cleanup
>>>>> upon resume due to the race). That doesn't feel like a solid
>>>>> design
>>>>> either.
>>>> I'm most likely missing something, but I'm really scratching my
>>>> head where
>>>> you see a problem here.
>>> I guess one issue is that at least traditionally, igfx drivers have
>>> nested
>>> runtime pm within dma_resv lock. And dgpu drivers the other way
>>> round.
>>> Which is a bit awkward if you're trying for common code.
>>>
>>> Cheers, Sima

