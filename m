Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07037AC0C81
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499B510EC12;
	Thu, 22 May 2025 13:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NxZ5fy9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF0F10EB99;
 Thu, 22 May 2025 13:16:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sHBRua2aKAb6IAZ0SYDn4dE0xL8kKYqKzLvQ6pSXoBGFnDz7YJUoSkUlbUA2bJLdTGaLTTyHQjE6WO+xlF3e5q020XFb0zhFqW0RHj1xg929v5FiU6ehyczrQC075iXyVWtIQdPDVfKUV/dQTop35JL97thkffMgmZfNfpao5RjNA6tdBHKWuAisr7c0ll2KTarOZcKpoEwNi/KufZqjEqf+VHY/hNhoO+WDLZItz1KmZ7UyxWlspFxzkA90mj09MtyxschTBoq+11HQ3QcwxM8NUyeNv+QX80rVSoxSLosyFiJivmruqCJgyklV5gZQoq9rU5ioFeKUVU8j74jHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JyISs/1ck/InGhH05p+crhc6x3o1oLTwKeJIXjiucQ=;
 b=nnATq2fmvknisE00614KXRH4v2wbVjkwAZ44ZPG5Cu9WyyNXlJNgYcMi372hAESBqwHhxaBHnY59bwtpCmrYWxWbW3tp3FPCey88y/nt4ibVqMQXq9kZUMw8FSpJJKKH41Tk2qwLO+sjxEMwa5du0/RysP3nl7jr2LSCh/h4gT4XUdYIW+JMtTy7t4ac5AOW5qf4WyZMCWSmQgDIA4LNHZDTYAalTCS95/fXlpSOMQWWzf1V/R+TYS4kjAynlIsblOLJaSiZkNdNV1tDZZDU8e7dODchXR3dOPEVoAYcj95gDz9PqB/xQfl15NuhbC786+5hfBqD02OQ0z9nR0mxQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JyISs/1ck/InGhH05p+crhc6x3o1oLTwKeJIXjiucQ=;
 b=NxZ5fy9h9F8yYr/Lp64a8/YVLZxVWjZdyCHbl0VnQtnMYanaTghLj5qHraWbBl1ftGx8p73SPwDDEgJz0f0w+iDc+OLGotmsiWQArrd+EEvl4iMnOaYdwdPFivfL/U0EWsuEkoCv+Sd2ryy0KgRfNjMfZ4Uz+xze+HWvtG62OXM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6137.namprd12.prod.outlook.com (2603:10b6:208:3eb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 13:15:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 13:15:58 +0000
Message-ID: <a03b5462-350d-4439-b3e9-c69176b1a129@amd.com>
Date: Thu, 22 May 2025 15:15:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@kernel.org,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
 <096c06b8-2cb6-4231-93aa-7091ea558e22@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <096c06b8-2cb6-4231-93aa-7091ea558e22@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:208:530::27) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e009879-370d-4b93-2176-08dd9932ca88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXF1djZqNldPUnVVT01mWHBJZHVqVFNDUFVzc0tuNGswNXFUMGorWERlcERB?=
 =?utf-8?B?SjZuODJMbUxOVnlQcnZUS0ErcGpnVGtCN2NDallBVTJFTXl6d3dNRU5TZWVk?=
 =?utf-8?B?RjdtSkltckZaTHpmb3V4UENrdUhhMUIwUUNUS3R1Zi9lZEg2LzlLNzlqSmxx?=
 =?utf-8?B?Z1BwNHk3YzloTlBZRldTeHpTSmpROWNCUzlDVWpxZW9YUDNjTHdza29ub0RB?=
 =?utf-8?B?aXhkbDF6WmcwUmFlMEJiNWM0aTBFT3VCZkxaOUZqb3BxaGdiSlg2bFVaSy9N?=
 =?utf-8?B?MFNSczlXR3Q2UXFMeDBsTklwWldBMyt0NXVlVTE1N0xzMTQ4aFUweEYvQnVQ?=
 =?utf-8?B?bmx5VDlYcFord013ZGpWSEdBeGRiQUlmcEhsdDBaM1RtNy9wd3JmaWFoWlNr?=
 =?utf-8?B?Z2QrV3JzTmM4aGVvK2ZyRElqaUdMWVJhcmJUUFpzUG9oV2JsejljOHBuZm44?=
 =?utf-8?B?NzQ5cm0wQzYyQ3JaL2gzNVVveVd5R3p6eWVLbTNrY2FtaG0wWHdjYWNJN3Ux?=
 =?utf-8?B?T1gyM0xaSmdUTVBCSWExVENab3NidmVoTnR3VG82L3QvYlNZU1dvQU1aS1Fj?=
 =?utf-8?B?SktDYjRhbmEwMW9xM3NrOE9QMDNUWlo5aERjdnkzSGlWWkYzUGN4WXZySith?=
 =?utf-8?B?a2RTUWEzNzAyM09GT3hFdTdGK3BKbml0QjlCWDRJK2ZGYkJ3ODFZOUxVUFIx?=
 =?utf-8?B?aXMzWTJiWGlzeXNXeGVubElKa2F3SmRSR21WSEpyK0xwTnlwdWRjZkN3VlFG?=
 =?utf-8?B?UG84WDRqQUN3WVlNSzBqbXMxQ3ZtaW9hamd6NFZ5ck9ramJKSE1NQmdjWHhy?=
 =?utf-8?B?SjVDMG0vYjJ1Qk9GZlJhYjA1VGNaSEJ4QkdlU01BU2JySUlOcU92Wkp2UVNz?=
 =?utf-8?B?eUFzYVVlSm9yZzhwY0ZjTWR1ZThjQzBidWhxaGo2MldSUnRLNjN5OUg5RGtI?=
 =?utf-8?B?Zm0xL1NSVWhPaXRRWHlaV1NTdWhDVnQwdkpuNHVWdUNScnkwNmVBMEU0dlFE?=
 =?utf-8?B?YXdZUmhVcnBhMHR1N1UzL0ZValFqaG1SaWpLZzBKSVgzTlJkOGk3L2VOaTBj?=
 =?utf-8?B?K1R5YVNlYjdWdmlpWXp4K3cwU1hGVzJyNUVlK3hKR2JuZWdoZGVjbjk5bUdH?=
 =?utf-8?B?aWR4ejhEbXNFdmZIUDlDNjU1WExxbE5Scmc1dkx4b0JzRDAxbE83VWtvZWF6?=
 =?utf-8?B?Tm9MUnpVRzZ4V2Z1dzJrWVRkZUZvTUlvQkVVTXJGK0FUMWQzMEVWVkJDeEo1?=
 =?utf-8?B?SmdZbmVSWWVQODUvZm9PQnNqOXNXcXFEUFE3YU0rbU4rV0hTQ1Y1TElRanBO?=
 =?utf-8?B?djNOdzE0Yy9rUzIweEpjT3dZL2ppakI3cHI3aHg3MEFiN25veWJHbG5zRG9y?=
 =?utf-8?B?bm1TN0dKTlZWVHBhUVBLVWQrSmxJRGhuNi9qWitDZUhLS1MrTHlSNk9CV2hO?=
 =?utf-8?B?WTd0MmZzUHNLSzA1cTNOd3FSNG8zeUsyaTljd1gwRjR1bldpWWxFeUwwQ080?=
 =?utf-8?B?MHV6Vm4rSkJpQ25yR0hrK1VmSWh6SGY0RFNYdnUwY1FYTGJ5Qk5ndVJMWGYx?=
 =?utf-8?B?ZHN5b0lsa0tZdVNFNWFuSVpFakpEOVhvTnBhVWdzR3V0VTY4R2k5NTdOdTY3?=
 =?utf-8?B?T3BwWGdPOTJtRFlHbFpKZHJuNmE5V1c2N2FhTVhMR1ZXQmRrc0tYYkJScTZT?=
 =?utf-8?B?YUtUVndsZkRxbHRuYmVNS3NKTHRhZUhNOGhXVGc0U2VFUjZjemMwSG5jOGE4?=
 =?utf-8?B?alhsUmJ0OVR4allCNU84TXZZWG9MRnJuUTMwZjE1UGxzbE9hTDUwV3JzZ2U5?=
 =?utf-8?B?OTlnZzNhV2h1Z2dxT3B1c080ZmtpY3oybldOd2NySEF6MFdNK3lhU1VRaWFU?=
 =?utf-8?B?UTAwbTJrWmRzRGM3a1hLd0ZZV1oyTzlLazUwV1kxbXp6QlhvazhTUGFVVVZS?=
 =?utf-8?Q?E4mLF+O68HI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmRsdjB6RGxKZDlnR1c0V0JqTTl2WHRxK20vRUxTcHkxQnUzcVhVTlZSNGt3?=
 =?utf-8?B?MStKTU5iQmxobzBpRDRnOU5EY2YwWkllM1UwWmo4MFZweUlzS0dUaVJ2dEJI?=
 =?utf-8?B?SEhIZHp0TVhLVWZqdzdFVjVaVXJhVXVKejRWaUIySXJSK3UvSXhYVngwa25T?=
 =?utf-8?B?N2xEVDVEa29wMVBOcFlRcXJINUJZNEZ5Nk1OUkhubHZFK3IzVnVRMGJEM3Zj?=
 =?utf-8?B?dHpBcG9oejduNnV5WVpPd2w0MFJLZ3RVMWtGZHZpYkJMcno2aUJUR2VEQklY?=
 =?utf-8?B?cFczY0dxUVNuWEM4dGp1YytzdHNXdU0zRkhjbzVNQUZpckcyaUV6RTVRRlUv?=
 =?utf-8?B?VFo3K0RaaFRNaUJyaGVzTmlrZnFndUNLaFR5MVhPb0ZWZk42anZUSEdsTjYz?=
 =?utf-8?B?aVFmVjB1ek1waFI0dmtNRjI0bFEvejFHOG1jcVNOTERob29JTGh2NENYT2o1?=
 =?utf-8?B?ekZZRUhYd2VJcmkwS3Ftd3ZHRy9KNXpvcWViNFI3cEVVWVVmcGErQ2txL3Jn?=
 =?utf-8?B?VDI3UTRQcEhvcnJnSFl2K0E2Y2wzeGJjVzl6QVZhcGM5QXJRbzZEOGxmbHgw?=
 =?utf-8?B?ZENwNi9MRHM0UStZMXZnQkZ5R0ErOXM3eGU5bVNuT3YxYjVocmZ5RnZuNmpC?=
 =?utf-8?B?QTAzN1Bnbk14eWllUjJZRVRWWW5wYnROQlFnUkJ5SkNKMStYTHhQMllzVGhD?=
 =?utf-8?B?QW54TFZkTzF3VmdXdlBhTWVEaHhBNWgvU0tqcEFDTTl5a0xQeVRrRE1FbFZE?=
 =?utf-8?B?QUVPdVMxY3VHRW9aQjI1dnpCSmxOZnBvQlFTUk1Ba0w1VzdHbHdpSDBjYVZ6?=
 =?utf-8?B?N1NJL0hOMDBydHo0b1VGTmRDazBBaWVaNUtpWTR3blN0S1lzb3ZmOURPRDJR?=
 =?utf-8?B?NytuRzl6dnJIZXhKamhIT3FDNDRoaysxVHQ5cFAvT0VlMW4xZE1LMXZzZ251?=
 =?utf-8?B?WDlQTmorbTl4QnFFaDAxa3JhTENrQUplaEM5Q0h3TVlwWWNNdkhKM01zMUFQ?=
 =?utf-8?B?QVFEZ0NGU1g2b0ZFM2FZN0IwaEFDcDduOG11UXdYSW5JWFU1c2l0OXN2d1RC?=
 =?utf-8?B?TUhTK0IxSWlqSE1WRzZ6R2t3aEg5UzFKeDdxOEVabEROUVdzUmNqNWV4K0gz?=
 =?utf-8?B?V3p0MitOdk9YN0dZT2R0Y212VERSZ2I0SktqSzMyYU9rN0RFSU4zVjY0Vyt5?=
 =?utf-8?B?dTYxOHlUb0ZRSGo0VFg4eHVvMmUwa2EvR0xRWnI3U01OVlJ4RElIN1gyRmVI?=
 =?utf-8?B?c3QrWkZEMy9RVzNrVG0zOHNMSFN1WHdBR0FGOHNNR1c3d1NmZ1FMa0p4RkFi?=
 =?utf-8?B?ZUZSL3ZzK0poUzhRNCtKc2FWVEszcktqVnJKUjNqN2d2U1F3Vk9KajQxWWVE?=
 =?utf-8?B?MTY3WEJnaS9iMVF0UXNDcktkY2pNYy9MYTRTWjZnajBPVjVUano4bkJOUG1k?=
 =?utf-8?B?bFJVWDlxMVJ3TGhXdDlkQmVldUdBVEpEUllZWWVsTHBKY2Z5bU1QUEkyMGJu?=
 =?utf-8?B?UjdlWDVNU0ZiT2NGMHl3anFCWExrZWRyeHdIOW9VWmxpTFZHRlV6UEF4SEFQ?=
 =?utf-8?B?NDNMenVyT3lJQlhyN3pySEtqOG9ta0t3dEFJWHFmcTNKbmU2bDlyOXdjc3Vn?=
 =?utf-8?B?bzA3RzU2alZYbmxkZ3VWWGYrczIrcXdZMmdYa1dxN1pWcFJrTk80Q3hNOGxY?=
 =?utf-8?B?VTcwaGpzMjE4dkFuWWNOTlJHeUFmMGFkemNkS0g3VGZIK1YyWHdsZlN5YTMr?=
 =?utf-8?B?WWpRR09hTXR6c29oTWxkaWRNRzVqdWFnczBxUzZXTVE3Vm9NK1lrbVdtWGZs?=
 =?utf-8?B?bHp3dGxYR1VUT1ZyTmlrbFdHakZJalo3QjNiWHFqV0Q5ajJGcWtCYTdSZlJH?=
 =?utf-8?B?aHdHSW82RmlaSGF0REF3K3JKemNVcDB3ZStGYTdQNmI4bkxRbjBVRTBENG9w?=
 =?utf-8?B?MHZPTTNxUkZzK3dWN0Rmd2lqZlNQQ0dCTzQ2SlVNWVo2d0pWK1F5ZWh0LzVh?=
 =?utf-8?B?MlJ6Z041dUR2L1ltclUydGEycEo4YlFtZFNzQ3UwN2FYcFdKZUNhWG44VDMz?=
 =?utf-8?B?S2Qra2pnV05KbmYxa2ZUY0pLSzVjb2QzMnRSYVQ3OHFhcGxyWmg5RVgwRHVB?=
 =?utf-8?Q?JGE5ZefKAZ/xdN9HLaXSR6h8J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e009879-370d-4b93-2176-08dd9932ca88
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 13:15:58.3875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ArSfO1I06cGU3TRCi9D72EvmeDFHKEmSev9h4Yg2DSoe2FgcYrmt8MeKUIXyN+wx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6137
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

On 5/22/25 14:57, Tvrtko Ursulin wrote:
> 
> On 22/05/2025 13:34, Christian König wrote:
>> On 5/22/25 14:20, Philipp Stanner wrote:
>>> On Thu, 2025-05-22 at 14:06 +0200, Christian König wrote:
>>>> On 5/22/25 13:25, Philipp Stanner wrote:
>>>>> dma_fence_is_signaled_locked(), which is used in
>>>>> nouveau_fence_context_kill(), can signal fences below the surface
>>>>> through a callback.
>>>>>
>>>>> There is neither need for nor use in doing that when killing a
>>>>> fence
>>>>> context.
>>>>>
>>>>> Replace dma_fence_is_signaled_locked() with
>>>>> __dma_fence_is_signaled(), a
>>>>> function which only checks, never signals.
>>>>
>>>> That is not a good approach.
>>>>
>>>> Having the __dma_fence_is_signaled() means that other would be
>>>> allowed to call it as well.
>>>>
>>>> But nouveau can do that here only because it knows that the fence was
>>>> issued by nouveau.
>>>>
>>>> What nouveau can to is to test the signaled flag directly, but that's
>>>> what you try to avoid as well.
>>>
>>> There's many parties who check the bit already.
>>>
>>> And if Nouveau is allowed to do that, one can just as well provide a
>>> wrapper for it.
>>
>> No, exactly that's what is usually avoided in cases like this here.
>>
>> See all the functions inside include/linux/dma-fence.h can be used by everybody. It's basically the public interface of the dma_fence object.
>>
>> So testing if a fence is signaled without calling the callback is only allowed by whoever implemented the fence.
>>
>> In other words nouveau can test nouveau fences, i915 can test i915 fences, amdgpu can test amdgpu fences etc... But if you have the wrapper that makes it officially allowed that nouveau starts testing i915 fences and that would be problematic.
> 
> But why? Say for example scheduler dependencies - why the scheduler couldn't ignore them at add time, but it can before trying to install a callback on them, and instead has to opportunistically signal someone else's fences?

We had cases where people tested the signaling status from time to time and were then surprised that the fence never signaled.

> I don't see it. But even if there is a reason, advantage of the helper is that it can document this at a centralised place.

Yeah, that is basically the only argument I can see which speaks in favor of that approach.

Regards,
Christian. 

> 
> Regards,
> 
> Tvrtko
> 
>>> That has the advantage of centralizing the responsibility and
>>> documenting it.
>>>
>>> P.
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>>> ---
>>>>>   drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>>> b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>>> index d5654e26d5bc..993b3dcb5db0 100644
>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>>> @@ -88,7 +88,7 @@ nouveau_fence_context_kill(struct
>>>>> nouveau_fence_chan *fctx, int error)
>>>>>         spin_lock_irqsave(&fctx->lock, flags);
>>>>>       list_for_each_entry_safe(fence, tmp, &fctx->pending, head)
>>>>> {
>>>>> -        if (error && !dma_fence_is_signaled_locked(&fence-
>>>>>> base))
>>>>> +        if (error && !__dma_fence_is_signaled(&fence-
>>>>>> base))
>>>>>               dma_fence_set_error(&fence->base, error);
>>>>>             if (nouveau_fence_signal(fence))
>>>>
>>>
>>
> 

