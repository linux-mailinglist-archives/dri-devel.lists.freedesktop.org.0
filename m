Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC739A6001
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 11:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE5A10E0C3;
	Mon, 21 Oct 2024 09:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AvzxokKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5033410E0C3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 09:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCkJJ+6IcdaXh9Olea6E+uPZpiEPRKPfK5oCq6ZoeeaDEwhx8YT1plDQuE1dPRRe3MV35etJ790LqH5oKq3l3YmrGP4K1O3yk7RsLM+jfmPwPx2V1u7tpfI7D4hNYOt2mjaqIFutEE7tVn4PKHR3iUbZXvUSRGpTi98W2xpfwbc58E3bpMFDkuyY3SJcQZIGzHDqTA9q6wW04l9wPW00tV+bqxNrtjyU6E49kV7Ft7rjrS/8J7PojeIqXYcz6cZP8PCt7D70XjovbRJG9jnYS6F3tK/TsirXDYuGbhzwAD4SPpojuSyIR5sRgCAEL+Vd3ML3QUmZ/9PZ7Gwmxn4q7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiImrWA9gkjoY22MfMjkB+fsAlgRfn1kXFIHpvEibC4=;
 b=DApfSHjg9ptQNxwkKO/vXQ+w3vRKQzvEsFrfbFmBfDk47uSswb2DKmZ4XRXz3RjXY87KiF7UZbseIjKn7Vq2WPb0XKJqtqTjqmqHZ/KiS3cjpCnPKrFKUMpcLNlzv2gHTLJ4T9V3dz0Q4FGrlLFz5rwPKnNMLHAVEALiOCbqfVBLkrclYjg1RXwBzN3230+YKEYQ8cRJ9SMLcgyh1RbjzN6zmL6M6gEC/aOAyQOp+YQMgjFR463IdfoxydKiFabqQoDInkqeCInwWWZ8UdyfbfGfmKqTZcSV1f2YeSCrpZ1UnXMcXtmgyP1AtRXFuMxMr7Zqq2hGh3AMEu43wvsgLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiImrWA9gkjoY22MfMjkB+fsAlgRfn1kXFIHpvEibC4=;
 b=AvzxokKgQsku6RxS5Sypg1U1T7TkEHZUQ4nTbnkDQDr5ZU4cSyknDeh7t/dqgZFcQEb2y8/mUXRX/Hg3D9PfoUpVmSE9+mTUta9+PfBCJ6DVDFgvmMPgu7+xuFFtLZ59tNBQnGVYCI84DJuU7owhFn/sinZ1OtnUbW/SzafjtxY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6029.namprd12.prod.outlook.com (2603:10b6:208:3cf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 09:31:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 09:31:16 +0000
Message-ID: <da07b73d-71d2-4086-a071-c7827c6c8fca@amd.com>
Date: Mon, 21 Oct 2024 11:31:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Eliminate all duplicate fences in
 dma_fence_unwrap_merge
To: Friedrich Vock <friedrich.vock@gmx.de>, dri-devel@lists.freedesktop.org
References: <20241018054608.6478-1-friedrich.vock@gmx.de>
 <b2832f2b-16fd-4c1f-864e-ecc32f7e8009@amd.com>
 <d1887b83-001d-4901-aa76-056bb82c9dde@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d1887b83-001d-4901-aa76-056bb82c9dde@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 6acd3d49-e995-45e2-a1e9-08dcf1b31cc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmVmU1hmeE9XT3lTNzluUXRLU2NlYW11OXNxaW5IRXRNV0JObWpjNURiWlJw?=
 =?utf-8?B?ck01N3FJeGFvYVk1K0w3c3N1TWFYMDBxQ2FjekxKSktJNmd4SEZpa3owQkZq?=
 =?utf-8?B?YSt5Uzl4S3M4NSs4N2hocWt4MGZCT0Q5OXdQSGN3c1FpdTZmaVgzWTNwMW4r?=
 =?utf-8?B?WFI1UmFQRjF0TDVEeHJLeEUrQ2lWN0JvS1lqTGRhbzJtZmtRSUkrL28zemVv?=
 =?utf-8?B?aHBhSnlKKzd6R3p5Z1VQTENITjJQcGJJUWx6ZUJmNDlPeHpZS0pmVlIxUkdk?=
 =?utf-8?B?SEk4NFVGWjdVRmxjZ3JUb3JGMmViY3lhdTk5RWxOUlkyUjdFV0ZZaGtGbnA4?=
 =?utf-8?B?WG82Mzg5Q3FHaVRBcGU4U0hKMkt5QXFPTTNmbEdYMmszbXp0NmV1TmZYemIy?=
 =?utf-8?B?WGowMHBEMmEwWWJzQ2JkcUpBMlJJNThlQ3ZYclIrRWVXaklmZWp3Qkp3Z1FP?=
 =?utf-8?B?aVgydU5zWi9SYmZWdDZueGdSdFQzTm4yQzZkTUNLVVZYR04yV0RUU1dMbG1N?=
 =?utf-8?B?ZnhsTWNCa05ScVFLOU5RUzlEQkdpZ2RrQm1UbndaL3ZyVE93LzZ1Z2VjZy9B?=
 =?utf-8?B?T0I0WWxoVWtxcElQZi9lN3V3U0R0UVlVcWpmeThvME92dmthUE15czByTGVw?=
 =?utf-8?B?dGx1QXA5S3dHZkRPL1Y2OFhJcGo4dkJIcjJtN3gyaWRrYjFFZGlnNzFxUS96?=
 =?utf-8?B?OERwYks5QVhoYURRVXltdHhIM1NwUSs3a3lMWVd4L0RaQXRvR2ZXZ081SG5R?=
 =?utf-8?B?TFlHTm5nNWEyVGR5RmpIeVBQaStEZEs1cURGMlNaZkxTY3E5SXVWMXJKZWVP?=
 =?utf-8?B?aFNIK284emJIa3R3NmMvZjBRVEFhSndJUkNqYUYyVXFUSldZNWhLdXdENDZs?=
 =?utf-8?B?cExFVzV4Q2dnVFdHejR0cFF1VWxEMVBNV2hQM25WSk9YbmdVMzVaanhYaU1F?=
 =?utf-8?B?eXgwMTRoNm1yRTZiMlpsdU5sbFhvYTYxQ0F1S1hnRElMcU14UnNkaS92NnNG?=
 =?utf-8?B?ZlMwdnBjeWQ0RTExVFlXVU9JZ2ZaODNYOHlUZVNnMEF2Z3ZVVUxZRVA4LzFD?=
 =?utf-8?B?UEpqOHRlK29CYU9jZjRjVXBnaWJaY0Y0eGlaQUtoNGg1VlQ0WWdPdEtmTWVj?=
 =?utf-8?B?R0ppcW9YQWtuYXZ2aHR6OHlkbkNTMS9vNTN0VngwRkoraVJhN1NFTnVzL0RE?=
 =?utf-8?B?enBLMnY4QlQ3b1VBSWIvTitOUkJnaWMvK0taWGE3akdrMm1kSVZQT1FjTXVa?=
 =?utf-8?B?aFlYUUhkMkNGVUJuY2RKWUt0WHdlQTh6cnYyUFZWbUY5WVpOcFFvK1EveU5s?=
 =?utf-8?B?NnNvUkQrMldVZ0locTdWbUdXSGlPSUNMTytLYXhuaWx3cG5nbUswUmZRcWFa?=
 =?utf-8?B?T3dyQjlHM1F2YzFrbGU3Y1RUU3BlS3JsS1BZRHdHcTREWlI2cnlBRngxVU1u?=
 =?utf-8?B?b0FLMHF2VWRmSE9HYmdsRWFyNkVtaFcyTldSRGh3b041N2RwOUFvV0pWYVFP?=
 =?utf-8?B?VVU0QmZ2T3VjTCtTa2JxZEFUWHlFWTQzbnpwOFJ5YnpQUlpxRE5lcVBYS0kx?=
 =?utf-8?B?Vng5N1hzZERSNEVRUUowb1NNTklnSENobzlzOW1SdVl1ZFlzT0lCTXlsNVZQ?=
 =?utf-8?B?WjFnNGlSdkIrZldiN3dmdnEzRlVzcnNLcXhjWG1jRWFTMmtRdVlQUTN1NkJy?=
 =?utf-8?B?a2dqQzNDSTdNNnBFSVJEcWgwZkMvS3hSUUtRWjYvZ0hvWVB3UjFvOG5zL282?=
 =?utf-8?Q?hr6jHiHWviKacqpwOKgVIqXRIx1ZJkfGjzJG9FA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjdOZ1ZhVlFjOGNCNDdRQlpvdTBqNE11VHg4VGQ2WGF2cm5icjcyNUxJQ0lQ?=
 =?utf-8?B?NDkrWVdWTXZyZ2ZhRWovQS95U01JLzlEd3ZUZmZzWnpvWWVlNURKVFl6ZFl1?=
 =?utf-8?B?R1h3VlpNZHhvREpGVm1hd1JGUW1GcktZQzR3U3k0b0U3cjRuMjVjczBKYXBD?=
 =?utf-8?B?RHBhS2lZZ2ZRcWlwbnl6R1lOaWdjVEFSNGRxN2pMWnBPdks5WHgwV3pjak1x?=
 =?utf-8?B?WE55TkF6WTlKZXZzVkhDM0MwS1NLamtab0xYamt1Tm1BZlNmOGpVRkRqYnZB?=
 =?utf-8?B?WGxrSEIxeVhjb3piQnhUc0VTdm9JTGhrRUgvbHJQcjJLTUNQUUgxdmpuVDZw?=
 =?utf-8?B?OWxkUDJzdkJCQ0pDcWNJaHYreVJtNVJVQlNYSEkvak9rU3BubWlVR3VUWmg3?=
 =?utf-8?B?K1pQK2dNTXp5MHhrSGFPSHVUVG1HSEJGT3ZPcDlzSTcyRFhjNWVsc05CZlRB?=
 =?utf-8?B?ZDFrUWZBSS8xWEVrWVJUYjA0LzRsUjRjUVlvSzIxREo5UklmK013SkpyNkdq?=
 =?utf-8?B?Z0dTYnk4RFRBbnhqQmFZUVdxVEE5bEYvekwzd2REdmZPU1pLbWtXRitJTkV3?=
 =?utf-8?B?eXQxZUhyQVcrOGxieUxyRzMvdmxCVzdvQ3YwU2c0dytrTzBEUDFjRnMrVXpi?=
 =?utf-8?B?WFJ3S0hqOWxycTRLSDhudFVLcmliN1MySmVSMERONWFLcWpHam9NZWhITEZU?=
 =?utf-8?B?dHoyeTU1d25KRTU3b29NeEhpSmlPblVLRWVJNnNURzZQRHRoSDVBcjZRQk0v?=
 =?utf-8?B?ZDhlOGM2b1d6T1A1WWNVQU03NlJWUDBBbHJxc3AxMGptWnZwSDZIRnN1eXVs?=
 =?utf-8?B?Ulpvak5ORG5yTFpINE1UZ3V2aXZJNTBveWFrdVF5WnljZ1lZNkw3QVhhWnpv?=
 =?utf-8?B?Z3M3ZnpSbmlkeTlZQjcyY2c3Z2tsdG5QNkIydVFNRnZZL2QydU10d2M5SEJ5?=
 =?utf-8?B?NGFGZzNiMDZOODA5cjV5UU5ZQlVzQUYvM2xIcHJEejJ1ZXd1enFKMTM2M0hy?=
 =?utf-8?B?QmxuKzk0eHltZllDZ1hRUXl3MHpKcjNEMWNJQjNjOVczVlplK1NyZWhkNUc5?=
 =?utf-8?B?TE9ablNNdWRUd3JKRzFxUklhU0FBbmZrR0p5bjNNc3cyWmRUT0FKeG9pVENV?=
 =?utf-8?B?UkhqSkF2bzNzaTBFaVlxNUpiczA0bHlwL3BISUZNbFJYaUFLR0E3N2s0WE56?=
 =?utf-8?B?VWhxcG8xWjAyaFFwQ0xLU1JOUHVUVUd0Z3YvZnBCWlQ0NmFnTFVrTWs0S1lj?=
 =?utf-8?B?MExPK1hURzMvY0hZKzY5NHM4eUVMSFdzbEhCNnNGVU91OHBiTHBnTHlRRnFV?=
 =?utf-8?B?dndKTU01YnNQNXhXWUh5SlZUUHNtdzlLWWsxRnp0a1pxUnFNMStwY0VodjdU?=
 =?utf-8?B?MFpJNXArSlZOVEtSS0d1MVgzbW1UOTZRRTVSNGZuanNPL2RuMUZuVlFtcG51?=
 =?utf-8?B?ZWNycVpDVzF6QkNUaWlXUXBKU3cxMldlWlFOaW9mcmJ2SlMwTzNBRzFRSkE1?=
 =?utf-8?B?ajM2ZmdEaDdEZ1VXaDVncnk2eW9LRkozdDZyUVh0TG5rTS9ja0xiSDZGMzhh?=
 =?utf-8?B?ZXNFUnU0b1kxNmFTdURxdkluMURDZ0lKMGNmRnE0NFZmNGcvSVY2cm1kOTd3?=
 =?utf-8?B?V01ISVhMSnBvWFlETGVWczNuWTVNdUx4TzRCM0xxcmdwMFcwdFZzSDFzendj?=
 =?utf-8?B?ZUVhdFBXRTJ0R2dsWnVvdHNoci81TUpIdGtBNzh3NmJvTndSN0RDUE9pcmFS?=
 =?utf-8?B?YzVGT3pNYjBXNlBVUUZpZzNYRmxSaGYzSHlzK1h6QU13VUVtNnNvTmhMYUVz?=
 =?utf-8?B?a0E4WW95NTF2UVZnc2hNUGwwazhJSVk2Vi8vQTN5YlpzcXNOS2g5WDVxUG9h?=
 =?utf-8?B?NEpteWUremVjN3l0azdlKzNJRU43TThDeEM2ejJVdElxUmhlWUsvcTJwTWFP?=
 =?utf-8?B?clFIaUJNT0FTR0VTZTlUa3dNWWt1dko0eVB0MFlwMjZnSE5rcGVuc1VZb21K?=
 =?utf-8?B?OCtPUnZCcTliM3NDajVaVlhHZHJ1QmdlaGdCL1NLU0pTNGkwbjluVCs2WTVY?=
 =?utf-8?B?b2VsUGRCMGxtRUxJalJKMEFTcW9Ma2Mxb3BRT0dSbUl3S2I1Z0Y1YUJZM084?=
 =?utf-8?Q?way3+C8Bw12euUOufJP1Q2d3a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acd3d49-e995-45e2-a1e9-08dcf1b31cc4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 09:31:16.5009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqYoa5SN0m6pmR+Q9mt1xRw4ukTHnY1M4UPaGhec2OYEnXswJc+NWNJgOY96B5Pa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6029
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

Am 18.10.24 um 21:17 schrieb Friedrich Vock:
> [SNIP]
>>>           if (tmp) {
>>> -            array[count++] = dma_fence_get(tmp);
>>> +            for (j = 0; j < count; ++j) {
>>> +                if (array[count] == tmp)
>>> +                    break;
>>> +            }
>>> +            if (j == count)
>>> +                array[count++] = dma_fence_get(tmp);
>>
>> That is clearly not the right solution. Since comparing the context
>> should have already removed all duplicates.
>
> Sadly, not. This is true as long as the fences are ordered by context,
> but this is not a given. The error manifests precisely when they are not
> ordered.
>
> Imagine we try to merge two chains/arrays that contain the same 4 fences
> (I'll call them fences 1-4), but the second one has another fence with a
> higher context (fence 5) in front of it.

Yeah, the problem here is that the code originally assumed that we only 
merge arrays.

And most of those arrays were previously created by merging other 
fences, so they are supposed to be ordered.

>
> [SNIP]
>
> We can't assume the fences are in any sort of order w.r.t their context,
> so if we want to check for duplicates exhaustively we'll always end up
> with some kind of O(n^2) algorithm. I see only a handful of ways we 
> can go:
>
> a) Don't check exhaustively (current behavior). Obviously, this doesn't
> work that well in practice.
>
> b) Eat the O(n^2) cost (this patch). I've kept the current merging code
> since it's an easy way to reduce the amount of times we have to do the
> expensive duplicate check, but other than that I'm not sure we can do
> much to reduce cost.
>
> c) Enforce order w.r.t. context. I don't think we can require that fence
> chains order their fences by context, they should be ordered by timeline
> point (maybe it would work for arrays, but whatever). That leaves us
> with having to sort the fences by context just before merging. That
> would reduce complexity to some O(n log n) at worst, but in practice I
> fear it might not be worth it compared to just iterating over the result
> array a few times, especially given that once this bug is fixed, we
> should be back to only a few fences to merge :)

Yeah, how that happens is rather obvious and we indeed can't require 
fence chains to be ordered.

But I don't think we always need this O(n^2) cost either, we just need 
to check from the end of the array if we really have the highest context 
at hand.

That's still O(n^2) in the worst case, but for the case where we merge 
two sorted arrays it becomes O(1).

Give me a moment to hack that together.

Thanks,
Christian.

>
> Regards,
> Friedrich
>
>>
>> Going to double check the code.
>>
>> Thanks,
>> Christian.
>>
>>>               fences[sel] = dma_fence_unwrap_next(&iter[sel]);
>>>           }
>>>       } while (tmp);
>>> -- 
>>> 2.47.0
>>>
>>
>

