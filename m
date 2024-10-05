Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DA8991416
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 05:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BC210E2A1;
	Sat,  5 Oct 2024 03:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cxU7GfVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A2F10E085;
 Sat,  5 Oct 2024 03:35:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMpcluZOz4wmbk5DyaNDDI8+56BF5c6MyYpDmIecLNpIOnQtovj4Zh+s46A21KtEpzHI2F5tTbqvHOa7itBDun/kEOsojGHzzt0/Rjee45rTgWwtJwM8sYwmank11D0UYJ2dQiDZlN/fibWZhgbzExh2HhaeoekaM4W+ahs7CLM5moPf5dzJMFmqk5Ufdlc9YhPMxX7IR3v1GBVPNoV7By8IjeEQXe3dnEMF4caTaP4xnTP4QZFxiRgWUKQUbqIZhep5r4FmxIngb80USCFNtR7iSPlGkCkJeQ/fHXgd+kXRALth8yMd2rbeGc1YQwgfCPs+ccyCE63oDorqXdzqbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4gMcPOGmFn7SjgZ+nMWbt2gts8044c7hnU8J7PfWc8=;
 b=NU5OeIMTB61tWt8RYWrA28rntj+ejvQPByJLEnScOZ3/av+7O83YjMJhwe/H4TlAtJSlBbeI/NlvnTM1u8JA10dUkbShvxZ8VkLmMd4d/gBCJVB2HkoMqzdTwNC6ENoXPT68uBmtJipYCKle/gHD2o9ig4yfe2ikLtOzyR2B1fMgTUh7k7MQNdeJiD0CbPsrGwKlQBdB1dHZRbMQJuNk4KJaXQESBJBdP7658PutfS5EKhOR3DscmgPlZ3tUPdhqYebpD+6JCEoNi5uK6T3DpTdnjrW5k4QPn3kKor6SrENQYv149sB2spGvammridGIlzu7ZHWqx3EK1C/kh9R4aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4gMcPOGmFn7SjgZ+nMWbt2gts8044c7hnU8J7PfWc8=;
 b=cxU7GfVt5VVyj53D5Lzio7B7gJBqJk/IlJyt21GbBtVYuw+tUHhJ0rOeigg4XRRRzR65ejyLj4FI93gyRKs1R3BdliqF7x4bbpeIsEgNiLVGDO0J2CBBX5dHzuV5XpfoOlbfUgb829izgH6EX+xHLkDq1MSAcV+3EjaZ1wZ0vZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6293.namprd12.prod.outlook.com (2603:10b6:208:3c2::22)
 by DM4PR12MB8523.namprd12.prod.outlook.com (2603:10b6:8:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Sat, 5 Oct
 2024 03:34:59 +0000
Received: from MN0PR12MB6293.namprd12.prod.outlook.com
 ([fe80::49ac:e84e:ea32:d743]) by MN0PR12MB6293.namprd12.prod.outlook.com
 ([fe80::49ac:e84e:ea32:d743%4]) with mapi id 15.20.8026.019; Sat, 5 Oct 2024
 03:34:59 +0000
Message-ID: <007679b9-b7b6-4385-9a2e-2be392cb5f58@amd.com>
Date: Sat, 5 Oct 2024 09:04:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next] Fix unintentional integer overflow
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Advait Dhamorikar <advaitdhamorikar@gmail.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, leo.liu@amd.com,
 sathishkumar.sundararaju@amd.com, saleemkhan.jamadar@amd.com,
 Veerabadhran.Gopalakrishnan@amd.com, sonny.jiang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 anupnewsmail@gmail.com, "Lazar, Lijo" <lijo.lazar@amd.com>
References: <20241004081618.27599-1-advaitdhamorikar@gmail.com>
 <00761132-75f3-41fd-b571-30b0cbe5565d@amd.com>
 <CADnq5_OKww1YZ1R_OytEMLcNVwdq=-ckc2gqQ+WMyOv6AZ9kqg@mail.gmail.com>
Content-Language: en-US
From: "Sundararaju, Sathishkumar" <sasundar@amd.com>
In-Reply-To: <CADnq5_OKww1YZ1R_OytEMLcNVwdq=-ckc2gqQ+WMyOv6AZ9kqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0188.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::11) To MN0PR12MB6293.namprd12.prod.outlook.com
 (2603:10b6:208:3c2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6293:EE_|DM4PR12MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: a7df6b11-0892-4aa1-f66b-08dce4eeb00a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azBhc3RnNUNCN0p6OVFwa2dEVTVaZEQyNFFrVmVidkVrajFiR0xqcGlnbkFR?=
 =?utf-8?B?NGdWajVHSmJtWTV4azQ1a3BvaVgvSGc0MmFHeU4zVE5wbXNSaWl1RFB6N2NR?=
 =?utf-8?B?dVNGeG9HRmVnYitPTmhnVXppcXhSS3lQZVM3ZyszWXJCOGI1SUdSNXZ0L0hU?=
 =?utf-8?B?VmZaT3RWMnRqY2QxRUdZWEdLMTRnZHNDMWxqQlZUTzdpUjQvNy9oemlUNEY4?=
 =?utf-8?B?VG9oK0t0dk0rejY1RkszWm1PeDROOFY3dGxoRG5INHllbnJsNjZDZEx2T0hr?=
 =?utf-8?B?dXFpZWZzSzlyK1pyaTY5M0ZpRlZjTFdqR3F2Y1k5R2pHRzhPemw1aHZJSjNG?=
 =?utf-8?B?Q0ZCNXJlSjY5bFFBUG9SN2tFTkdMUHprUnlHTWpXME9nVWhvZkJDeGhHMWtm?=
 =?utf-8?B?cGRlM2h0OXpCMVQxQUtWOWw1NHJEQmUvOGR1dWRCVnZkbHpNSVJobmxWOXM5?=
 =?utf-8?B?RTBOQWNnb2hLdEg1TTk0eUJ4RWdCc1Z0aUgydjExV1JpYTBLSVBzc0F0QTdG?=
 =?utf-8?B?Ym9FZUdXakdkMlBQZS9ZYWp4WGxvcXVxek9CVEo5Z3NRNk9LWWpucWJmSElP?=
 =?utf-8?B?RHJnemJJYTVuZWlxdjRVVDBJbm5rbmw5aTVTQngrNE1sMXN2OUhnYm1vWmN2?=
 =?utf-8?B?ek1sOUQ0ZVNaNDFiVnE2ekxPRWZmcXRjblZmcHdYVkZDOENSK3FJaXp3Z09L?=
 =?utf-8?B?ZUNxeGhDUUFyVy9WckgyUWdwd2wwVVhkUWhFZjZ1TU5RYzNZbnVpMDJweWxw?=
 =?utf-8?B?dUw4LzI5TzZRWmJDemxCSlBkM0ZUOGNGK25SQndKOE5yN0VMRlJxQTJxTkhV?=
 =?utf-8?B?cVJoWnE0T2pzS1AzL3I4RjZBandLcFVqdVkvWWhPZHVmOHYzNzJoUElCWWpL?=
 =?utf-8?B?UDhwdXdvVXpyMGpRWTBMVUZvL3l6YmdybGExVzZpb203UkVJWXJoeGV5eWdU?=
 =?utf-8?B?WUhKSlhqWnFvMUZPMjJ5SjNrbmRXODg2MjZBVXBYN2NNRndhODA3bVc5UEJH?=
 =?utf-8?B?ckhWNjhmZm8xOW1COWRKS3pJaVJtVGpUd2tnREhZcFdzMXhRYWJzMTY5VG51?=
 =?utf-8?B?azMyeUtwL2t2K0xZYU01RldyS3lUTXNFUGMxcHovcDB4QkpWdHBnZURnanFz?=
 =?utf-8?B?NFZHTlNIWDhWaVREZk9wbmRPSUtNZzNMemRYVk1kT3lOM1ZWdDhRZUNBUlZr?=
 =?utf-8?B?MnpYNUJKY3dVRUVIczZyZnkzTTIyTmliU3k5eFNETjFYaThhd0kzVlRQREpq?=
 =?utf-8?B?TDNoT3hlMXpLSVgwM1RIMWhMdjhPZzNIbE85MTdCVUo1SXR3N1hiTlJvaENE?=
 =?utf-8?B?ODhwVjRsaW5yTUpFQ2Y1M1g1VncyNWVOZzh3N3JRM2lMWUxiRXNyL01sNis3?=
 =?utf-8?B?MlNCTkNtYVVTRGF2Z3lTZUFGZWhEVWNadG94RkkrOWg3WnRGVnZKWU9KVDcv?=
 =?utf-8?B?aTF1clBtcHdwQ2Z5Vm9wMHg4ZFgrZEFEYlJrcnpvRy90ek5rL2tROW1QLzd4?=
 =?utf-8?B?ek91UXdUeUFTTmg3L2xzbVA0TS9jdVFHMlk5Q2h5cmtyaXRmT1QxTXNWOHpJ?=
 =?utf-8?B?NnIxb1Q3UkE0b1ByUVVZNkw4TmVxWUsweDZpWHhkTHBKSzZhU293ZWxpamJs?=
 =?utf-8?B?WDJwOHM1eURocHVVM2phN1R4ZG44WnBndFFKdUNFcHY5eENCdTlNck5UbDY0?=
 =?utf-8?B?RnkwSU9LTHJDNEpjU3VJdGkvcUxNekF2TlpDQkNIRytFTFV5YkZsMEFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6293.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTgzdVpXNHJuWDUwOHlNZzVmbXg1eGdEMnMvNmNZZW8wNEdQU25FeTR4dlgy?=
 =?utf-8?B?UUFpS0Z1Zy9vc1liUHNLR0tNb0YwWmREQUhQbjh5QysxaXNaeldMOEtiNjNr?=
 =?utf-8?B?dmV4Qk9ab1Z6d2dmY21sK1hrZFc4QjkvS3hHK3BWUXBJTTFBZW1peWptZDFK?=
 =?utf-8?B?M1gwaHFWY2hsTHFHR09EL0tmSTRnWEZJaDlVZ2lDQjJjM3lvKzcweHl0YVN1?=
 =?utf-8?B?UDQyN0ZhakpFcERYTlBwYnVUMXBsZ3MwZFAwaWpYUXhVQ1ZURUNxOHF1SDRL?=
 =?utf-8?B?OFBVcFU4STZjWTh2d3ppSGkxa052ZlJUYU5LM1M0VjZ0WlJsUW4vTXBvYjkz?=
 =?utf-8?B?cTA4L0pyb1NtM0VaM29QT1V4cHhWcFNyWEwzT0M2SHp1ellTeFdINlp2VGJW?=
 =?utf-8?B?dXh4bmFwaUh0K2NQKzJBZGZGdHlzK0hpV0lqdlNwSEpXV0RNMVo1a25hYTc0?=
 =?utf-8?B?UlF3UjUzUUJEMVBXRFF0VlFnYkgyYit5V05raUpESWVmZTZaYi9RTjVwMldS?=
 =?utf-8?B?RGEzdDdONE0xQ25kWlJiNzNjM0VCazhoOVV0L2EycmFCaDNDb3hjZTlqMVJK?=
 =?utf-8?B?cW8xOU56aTdVbFlrdkZad0o2WlFqK3ZIcmtpR01mYnhjTUl5cnFvOVZTUUZa?=
 =?utf-8?B?bytVeEc1QkV3U0ZlenArMExTQVZKU0tRblhGRDVzc2liQ3BlcHpZVlJ0NmZR?=
 =?utf-8?B?U0xaNTVyWkQ0U2kxUUMvQzROdnFkYjJGUWczanNjRWtZYjV0ZzBSK1VWdEhk?=
 =?utf-8?B?Y2pnaFZxby92WG15d3llZnJkVDVpdXZyTUh4bmtVczB6SC9LbVBGSmYrbVQ4?=
 =?utf-8?B?QVlFRDh3YWZ4elhCN0NmNFB2KzdkZDYwTkt0dStEZUVPbWhFU0lkbXBBVmR5?=
 =?utf-8?B?Y3FvM2cvYTFVYytLTzlad1dMY0dXNGhBRHRCTTZGSXpSTjBQQlZYMzQ2K3ZF?=
 =?utf-8?B?V1lXT2czWmhYU3VwdEVmY1Y2WDRDOEpFazM4UzJRTnFiTnhnZ1F1am5idTAw?=
 =?utf-8?B?YTFaK2xybkZHT3pveU9VeGtpZkNMM1dkTXlxSnVFeHFkdzRUK2c1NG9JbDdK?=
 =?utf-8?B?cGNkV1RQNFdZbEhwWlM5Vy9uKzdZMkxXUnNPcXpQaXk0UGI2aUpGbG5LSWt0?=
 =?utf-8?B?Um9BUWswN2txYzBGdUFTMW50aW1WNzhmaUFxcm81Lzh5TCswQlFjTW50UnN0?=
 =?utf-8?B?Y21EbmhFOUc0ampUUlZmdXNZbVZ6TGJ1UkMwdVJwZ1FzSXVIQ2drQmVmbWRn?=
 =?utf-8?B?YkgvUHBBVnVad2JBOGNsR0xOaVVWbTZ2bXIwRW9NZ1lBYjJOd25USkVMYzk1?=
 =?utf-8?B?QUF3bDJodFFVclY1WDNoV0t2ZW1rQ3ptejZOSHRZdUJRR0xzanMvZm1EYmJ0?=
 =?utf-8?B?Mkl2VHAwa2xaTHFGVzBJYlBWbWduVTJwM1hGTWltUEx3NUNPSk13U2pzTzRs?=
 =?utf-8?B?cmR4WVhyWEhxbUwrbmxqUlNFLzRMUzJvc2Fpa0RRU094andIanNBZko1SDFN?=
 =?utf-8?B?b3NqS0xpd2lDbEpTNUI5RytsNjJtRWlVTXUwQmhzbFF6YWdKeGpHUVc5N0VB?=
 =?utf-8?B?Zy8zSEI0cEQzK2YzVXNjMjk1akxRSUxibmRDdS9iQ3RHdDZXY2Jaa2hIS1J6?=
 =?utf-8?B?ZWNBWVBQdytHUVhKMW5wblAvcm5tcm4zQzRJdEs4czhMc1ErSnQ2dzNjeTRZ?=
 =?utf-8?B?bStUajRrMWp4TDVtWHBhZFkxLzFyTE5XdTZLZWxleUtSYmN4R0ZmQXdKZm1h?=
 =?utf-8?B?bVRmWVY4bHV3cVp3bTVaR084MWpqZmRncC90cjRybGZnalFlTW1tbkZvZnR2?=
 =?utf-8?B?UnJHdE9Zek9PRnI0czFuL0RSUGhCQVB4aEZLdXF0TVQyNVhob3hQek1aQ0J3?=
 =?utf-8?B?UkcraHJaUTVJODV1MFF0dW9GUHFUbzJkN0xhNDk2c2VFU1lGTkVBWTBNMHpO?=
 =?utf-8?B?VWpleWppV0x0MHVMT2xINFVzeFBMcWV5akFlQ2RFcmJkK0J3NjI4Q3VrWnoz?=
 =?utf-8?B?b0dLaENjYkpMNW1Ob0V0K0ZkaGhJNGh0Q0N1dW9qalhWaXNrSkdSN0NMR2Q5?=
 =?utf-8?B?Nkc1TXNMUU1pU0NxT2pnTXZKRlB3NHhUdFVXRGJja1RHbEFjYUo2ZjlEV3ow?=
 =?utf-8?Q?AsS+bRgAWG86FDYL1ogLwGs6q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7df6b11-0892-4aa1-f66b-08dce4eeb00a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6293.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2024 03:34:58.9978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XykecEVVM540VWBj42jzuWaAD0s9gEMZm+J+EWSYnyy1skVq1UBQd09ufXUJM0FFiFVtXoiaxDgeh3o6t97S1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8523
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



On 10/4/2024 11:30 PM, Alex Deucher wrote:
> On Fri, Oct 4, 2024 at 5:15 AM Sundararaju, Sathishkumar
> <sasundar@amd.com> wrote:
>>
>> All occurrences of this error fix should have been together in a single patch both in _get and _set callbacks corresponding to f0b19b84d391, please avoid separate patch for each occurrence.
>>
>> Sorry Alex, I missed to note this yesterday.
> I've dropped the patch.  Please pick it up once it's fixed up appropriately.
Thanks Alex.

Hi Advait,
Please collate the changes together with Lijo's suggestion as well, 
"1ULL <<" instead of typecast, there are 3 occurrences of the error in 
f0b19b84d391.

Regards,
Sathish
>
> Thanks,
>
> Alex
>
>>
>> Regards,
>> Sathish
>>
>>
>> On 10/4/2024 1:46 PM, Advait Dhamorikar wrote:
>>
>> Fix shift-count-overflow when creating mask.
>> The expression's value may not be what the
>> programmer intended, because the expression is
>> evaluated using a narrower integer type.
>>
>> Fixes: f0b19b84d391 ("drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs")
>> Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
>> index 95e2796919fc..7df402c45f40 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
>> @@ -388,7 +388,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_get(void *data, u64 *val)
>>    for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
>>    ring = &adev->jpeg.inst[i].ring_dec[j];
>>    if (ring->sched.ready)
>> - mask |= 1 << ((i * adev->jpeg.num_jpeg_rings) + j);
>> + mask |= (u64)1 << ((i * adev->jpeg.num_jpeg_rings) + j);
>>    }
>>    }
>>    *val = mask;

