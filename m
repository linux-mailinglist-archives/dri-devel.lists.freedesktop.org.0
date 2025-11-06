Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D8FC3CBAE
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 18:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717ED10E986;
	Thu,  6 Nov 2025 17:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vlfNva2f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010020.outbound.protection.outlook.com
 [40.93.198.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011EE10E986;
 Thu,  6 Nov 2025 17:09:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7NiZcozXWLQC7tkzZAtE8ucgKkxPPopQxK6xmfcqh16ah/pGj8+bivIyoT7f0cQcWpSTbBB736aicFHeAeU+t+hEspwVyXs6UNQt6PO+ZEyEuTQDuoFII1zS1W/ClQJHS0QUbHCUZKLQ7i8ropGOzp5v7jLRYyqdaqTzcTdzrdxbOBchJqaeqoKfpzQ/ye9YTqI1OiiJc1pDplAFeWwQLf/6zppGf81/OXBLNop+9EM+wFxz0EbsZp9gY+wuW+y+UjiL8iUcp85yA/mKxLApGEmSo8j0jyJn78dfiTL7JwcBWMKJ8+XdeV5yi6Xn5ktcFEBcSK7SlV7Xt7FctO/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gA6ZXqPQIeZTZ+F5qcHaK/4GfGszguiwiOQC2Ojf4fA=;
 b=OGnKVq+rdvBmqLuLgdqgX9NdrybTh1c8fpqVVt+6+kOE8xGgmSLaPKjM5whY33mA26Z9ROD8sse+96QMQSLwJP2T2dmIpVEHimxbc8JlVc9fSBqqpP/5ZLU0WAB31Nm/wNPdMvCJkarbCkZLej6+bfXl8YXPmcVKUcw6leiuQoQjJ6IcnyDNM0NEJ0+C/BeKSmoqSPaylBjsuCIf4b/Voy0/M1zLYod2xNBlZlXBpoHtlJJBVC1cRIcueD5sZBCWzrNZkXiyOfm50XYpixR2XLH88ebb4Eut4kuodH0N37+SfStJB2HfZtTPgOQfxJFe+w9h6+dfp9CFgKncAWipHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gA6ZXqPQIeZTZ+F5qcHaK/4GfGszguiwiOQC2Ojf4fA=;
 b=vlfNva2ffsq5eZL1trgZDNLe0K8rkkSoKVvyVsasDp2bU2ypccPFpftz+TOUhTiprnNjPPew13uTqeiWBrdS47DjGJThwFYsF+8rz7dNj26zuQEG+V04Q5S01BOcFkjNWxDmcKD2iIor2LWcaQ68Joj10g0eya/8BLxVbq/xTIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB7035.namprd12.prod.outlook.com (2603:10b6:a03:47c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 17:09:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 17:09:56 +0000
Message-ID: <a01fa221-401f-4548-80d8-5d687e93dbee@amd.com>
Date: Thu, 6 Nov 2025 18:09:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/20] drm/amdgpu: fix KFD eviction fence enable_signaling
 path
To: "Kuehling, Felix" <felix.kuehling@amd.com>, phasta@kernel.org,
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net,
 airlied@gmail.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-12-christian.koenig@amd.com>
 <febe733b667c1700333044bce8649c6520d69148.camel@mailbox.org>
 <5a770cba-9fbb-4645-a987-afe25e446942@amd.com>
 <887de3dc-f6a8-46c7-baef-862fe1acaf02@amd.com>
 <9484fec0-ca36-4968-9edc-ca517825fe68@amd.com>
 <5ddb1da4-84e6-48f6-a9d4-10560f58ab90@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5ddb1da4-84e6-48f6-a9d4-10560f58ab90@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: cfd7771f-f19e-4f52-5d40-08de1d574f4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1cwMVcySWcyUVNEVGdRbHhyS2g0R3czdWpZMDRUbXlNUmxCQmYyMlA0ZHBU?=
 =?utf-8?B?cVVRbUpPclpZNzNOQW40VGo1OHAvQVczRkZtQ25YUVIyK2FSS1hVc283YWJH?=
 =?utf-8?B?ZGdEOUdqMDlWemZxdkgwQnlLOThMcnV1TWg4QTFIUVRTTW5leVpKNEcyMVBP?=
 =?utf-8?B?SERGRlF1VVBMQXU0MnhhSHgxVFd1ZmV5bHJGWElQT1UyTmVOdHZOdXRyK2wy?=
 =?utf-8?B?WGRkbkl5NC8zZEE4aC9MY1pJMUtraEJMNWVPZmh6U0JYSnVNcVFZZWhZV1ZI?=
 =?utf-8?B?UC9jNnQwVjJvM3FMOXNCcXJ4anlMR1NRTjZkNzZqSVA1b1R4SEx2S3liWjhO?=
 =?utf-8?B?bTlvbGJ4ODJDYnF3by9PWkh1c2ErYkZBQjhiQVFDWXBxWU9DTWRzenBDd0E4?=
 =?utf-8?B?a2lwa0hmbXhTREswbzR3VDVOWkRKaE44Y0hqTEg1V25XNmpscWNQWS9VZDZ1?=
 =?utf-8?B?b2s3dTVzajJLMTcwQXZlT3p1WU1FemdoakJaNGZndlg3ZFJSYU5ISkZtQWM1?=
 =?utf-8?B?ZS8yUUkzR0tYblcxeEJlZTJCRnhLaEw5L1JuVzhEcG1haGQzenJrT0xYTGJt?=
 =?utf-8?B?SmJVMWVEaEkyRS9HZlB6NnBybjNIUUJOVnhNbTIzUFVXRnlvOGUwRU9QSDFP?=
 =?utf-8?B?Y2dVTnY0OFBTTitJd3JIY1JCR0ROaVFDYitlaTFQaUdQZkZsM2VPTExNZ2hq?=
 =?utf-8?B?L3JsR2EzVGVYb3R4QUpGRU5ncVFHbmozYS9FTGFUQkFFbmZRWDkyRTVndkli?=
 =?utf-8?B?bVRaanoyNmRRMTdVemFKeHdrNDZLMnUrRTBqcGpQNVh6OFQ0SnYvMXpVM3BC?=
 =?utf-8?B?WFZQUGczdGo3dXRobzQ2ejVnQUxmemc5ckNJbFV0NzhPNzlIaXpKbHZrZ1VZ?=
 =?utf-8?B?c2xpclMwbVRHN3hPaGlmT1hnWUUxU0ZkOW43cTJLYkZOQzdSM3M3ckwrcFRM?=
 =?utf-8?B?OWwzY3NjRGFRa3p4MHBiT1o1OU9kK0drTmU3bnlsZ1NMYmU4YzNsRjkwREVo?=
 =?utf-8?B?T2t5cGNLUUtjeTNqTGZ3Sm9nS1BmTGRQMUhFWG9FSGNHZ3cxeXh1SURqL1N6?=
 =?utf-8?B?c2trcGlkVUJZYjR2Y0xJdCsvQUdySHRIRkV1YXRFZ04wamQxUHVRSVlqbE04?=
 =?utf-8?B?ekM4V3VYS3RGMjJJTzVwOXVjU01Ya2lUSmtsa1YvZ1lINm03Y05VYkxVS1Ro?=
 =?utf-8?B?UXVqV1ZPZExQNWlnTklmcklnR245Nmk0enowV2VGS0VWYTNSWWlYYzNjbFFP?=
 =?utf-8?B?dDFCYjIwTGFzb21mVmpYaFZoNEN3Z0tXS2E4MnF2MTJrVC9PSnJJamZjTW16?=
 =?utf-8?B?OHFJaS9JSVl6eFEwYVBUVnhvaUlCSXBpUzJHQ2R3eXBNQldUcytrWlV2cWR4?=
 =?utf-8?B?aWdxWWNUd0gycm9pcmFaOWpjVzdhdTNBbnByWHlJQ0xjTTVuUDRpWEVLMzU2?=
 =?utf-8?B?U3dGelZhcmVXVE1vTHNXYk5JaDAxNk9Qb3Y0RkkvQzJqOVV1WlJraTg3T2Rl?=
 =?utf-8?B?dGpTL1NmQnZUL3FUVFdPNXZ1RFErN3RrTUNhUjA5OEVlRU41NnlpQkpmRHpy?=
 =?utf-8?B?Wmh2eVlYUC8wcWlyQ2FSS3U5SU1nOFlLaklhenBxeVdXdFZaZW9KRys5WlR5?=
 =?utf-8?B?Y1RJeFVvczVaVzBINnNSUDJEcWpxOXg3L2R5ejVRU2ZJYnJnYU9qbnlPOWJH?=
 =?utf-8?B?cUtXUFFtTDQ0eFBRaUFoV09MakhuMWJGYzVZUDRTUUloZEJQVy9xdi83eXlO?=
 =?utf-8?B?ODMvRzNFZXI0Yk1HOEhLMzVFdTJaNnBTWUpabUR1eHVFVEd5eTdDN3R0KzMw?=
 =?utf-8?B?aDkxYjFVd3FTbTNMUWFlYVhHbXdTaWR6WlUrSVRlMWJlVW00MXpvRXBvNlda?=
 =?utf-8?B?cEFyWm5ESGVUSVFkQUpGQVlHbkNRSnBRVHhKVHZPZUE5aXE2SVpnKzF3MFVI?=
 =?utf-8?Q?U5t5hnrnk0hqQv2WV82g6hyuPPIOXJwK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFFzQmc0N0VVUktMVTVkWWVGZmxqdFRUNlY3OG1RWXVsbnFUR0ZxcnZmMHA2?=
 =?utf-8?B?RjdDRDVvYzZmV2NTa0lqVDZVdkdIUFZRSGRFT0NtMlJHd2FjN2NnOC9zbW81?=
 =?utf-8?B?NEwwdCt3U0QrNjhleFE1VG4xcjVLbzR3NkdKbFVQWC9IdFBBdVM4QmtoY2Nq?=
 =?utf-8?B?TjNmd3hmckhLamxzSzZnRlQ3TFZieUJJN0F3bXp2Yy9DTHVINERsay9QWGpT?=
 =?utf-8?B?Q1J2bzNMZVV1T2p0ZDc3YWpVNTZxRUxQWG4yRFBHd2l3bEtkUHNDenpDbjVJ?=
 =?utf-8?B?Vi95QS9jYURjU2JwRWNwam1zajZScDVyZzFiUjB1UEcwc1ltelhGRmd2Zkxv?=
 =?utf-8?B?VXUzOUhocDdlSHNOK2xncGJ2QkF0SWtMSWNXM3NLM0QzQ1daQnFueW9BcERh?=
 =?utf-8?B?VnJTQ1R1M1JrTnVnRDB1WU1BYjlrQktYZGV3VGpCckVmTWxwaEVVN0FNVmpl?=
 =?utf-8?B?MkZoSnVMdVRObjA1Z3lSTFkxdlkrZ0tWOVR5S3VxWHc1T0J3QUtnSFMwOGlt?=
 =?utf-8?B?bDk2ZGlYTEZtUjZuUlIySDNVQS9DMngxSWV2NzZvOHBPSVJBU0pSK2pJMVlN?=
 =?utf-8?B?QTdVdWFRMHFWTjBSMXBsdndnV3UwNkk2UGhrL1dtN2ZlcW8zeTk1K0Mzd0s0?=
 =?utf-8?B?RTJQWmFEVWNXeFJNaHlKTXFXTHFVNVk1VGVCUy9IVGhtazRyZzhRUm9KT0hU?=
 =?utf-8?B?TENYbzRYbFE2TCsxMmdXbFJOc3VCeWlwdHNDWDhjN0h2S25YbzhGYW0zc1FH?=
 =?utf-8?B?RExmNVZGUTRLZkVUK011YVROQWJiTTEyNlhUdGZmRURkNnEwdzcwQlFhd0dy?=
 =?utf-8?B?b1R1R1YvU0c3MXdvaVFOVFQraXJJRE4vTktiUHB0TEJxVTdYVENkMXJHZ2dY?=
 =?utf-8?B?TzMyZGFBSFlnUXVTY1llKzE4R0tHYzdpWE5zYVI1amorU3UrL0l2ZVpxV2Qv?=
 =?utf-8?B?OWdGK1Fmd0h0U3RjTXZLSEFWSDAxOVRaUWtHNklhV1ptTmNQcTNEc0pOcjVI?=
 =?utf-8?B?VHlFMGZBKzNnZGZQWGNEL0ErNjNyeENyREFManF3amdDZENwRU15aDhmTUpI?=
 =?utf-8?B?OTNma2xXVkdLZG9OK1ZieGNJbnh1SWEwYUp5aFkxRVlYV3dlT1UzeXEweFVE?=
 =?utf-8?B?bDVMUStwbktBa0ZvQ2NON0tKK2IycVptcHVJUDNXQVd4eWtldnFOMVlvR24y?=
 =?utf-8?B?MUo1UnZMbFBzMVJXQ2lkU3RFSWI0NUNMZTBQSW1uZlQzaXlYUTNOajVBa25L?=
 =?utf-8?B?Sy9lY2JJcUMxakcvUk05SFVVM0pFbEtUMlAraDkxQ0FYdnowSnZnem5SRmpJ?=
 =?utf-8?B?WC9zWDd3ZnJmVlJCSVRvWXZyc0pBbHRVUzg2QktzdUpXL2w5ajdWVVZzWGhy?=
 =?utf-8?B?S253QnlZRWRtTnJBbWpWTnhHdFF6ZnpHSWYxZ2M4bXQ2ZXNtbk8vWk9iV2pv?=
 =?utf-8?B?WXZ2ZFFyZ1l0eUh6NXdiUTFzVURCK2k3V3FyS2YyNDMyZmVlYzRLYmpNTUw4?=
 =?utf-8?B?UWUxclFrZ0FLSHZMc1hpNmMrL1hhVithVmdWU2hjWjFyZ2xuVXBWbCtZS3pR?=
 =?utf-8?B?dUMvR3VWMXdXcTRGZ3pJQUxRY3FRQitqMEtCVWt0eTJIVDg3T05zSU9LSDQ2?=
 =?utf-8?B?NXM5NVZqVDh6TkxJVmlKOEVXdjBLQXozZ094OStSR1Iya0ZNOC9wWDVLUkMx?=
 =?utf-8?B?ZkZsMWNYVk9HbTllRmMyMkcwMzVHejd2TmN2R284ellvSFpnYU5DR2U2QUhp?=
 =?utf-8?B?dkNpc1JWdDcyTFEwbzNnc1JScmdwS1FkMUNMYS93WHFZaTJrcWkyWmtPNXk2?=
 =?utf-8?B?dTlRWUZwL0l4QXZ6dzlQY0RyNy94MEtmbi9DNFIybjhta3RqMlBubU9NSkRy?=
 =?utf-8?B?ajRQeVJYVXhvQmovaUtlQjBybmd2QlNwTUpaVXhtL21RSTYvUlVLV3FZT0JW?=
 =?utf-8?B?bHppQVprRURaZTdwcTJyZzZJTmlHRnhzb0NRTDc2dkpVbXZPMTN3TjgwRW5T?=
 =?utf-8?B?ampKWDA0bWZvUlU2SzExb3N1dTRZclRkYjVaUXlPa1hlQ2NaYWl0R2lJUFVs?=
 =?utf-8?B?TmpoQUJtOVg3dU9ZQzZLa2oxdUFvaHo5Mnd3OTFFWnREblZTNnZMa1RzN1lv?=
 =?utf-8?Q?MGbU5NEsaPhYsN9KJbBG6lfTp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd7771f-f19e-4f52-5d40-08de1d574f4f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 17:09:56.5650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iweXOkfhHQ7bkD+x4armWKzckv2j4PZ7dbTw5BmmZxdIWjDTX4eoivRmhhdqDN4n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7035
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



On 11/6/25 18:07, Kuehling, Felix wrote:
> 
> On 2025-11-06 11:46, Christian König wrote:
>> On 11/6/25 17:37, Kuehling, Felix wrote:
>>> On 2025-11-06 08:43, Christian König wrote:
>>>> On 11/4/25 17:28, Philipp Stanner wrote:
>>>>> On Fri, 2025-10-31 at 14:16 +0100, Christian König wrote:
>>>>>> Calling dma_fence_is_signaled() here is illegal!
>>>>> The series was sent as a v2. But is this still an RFC?
>>>> I think when Matthew came up with the XE patches we pretty much agreed that this is the way to go.
>>>>
>>>>> If not, more detailed commit messages are a desirable thing.
>>>> Good point, how about:
>>>>
>>>> The enable_signaling callback is called with the same irqsave spinlock held than dma_fence_is_signaled() tries to grab. That will 100% reliable deadlock if that happens.
>>> I guess we could use dma_fence_is_signaled_locked instead. That said, it only tries to take the lock (in dma_fence_signal) if fence->ops->signal is set, which isn't the case for these fences. That's why this has never caused a problem up till now.
>> But when fence->ops->signal isn't set then why are we calling this?
> 
> There is no need to enable-signaling (and trigger a preemption), if the eviction fence has already signaled.

But when the evicted fence has already been signaled then enable_signaling is not called in the first place:

        if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
                return false;

        if (!was_set && fence->ops->enable_signaling) {
                trace_dma_fence_enable_signal(fence);

                if (!fence->ops->enable_signaling(fence)) {
...

So the extra check is actually completely superfluous as far as I can see.

Regards,
Christian.

> 
> Regards,
>   Felix
> 
> 
>>
>> Regards,
>> Christian.
>>
>>> Regards,
>>>    Felix
>>>
>>>
>>>> Thanks,
>>>> Christian.
>>>>
>>>>> P.
>>>>>
>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 6 ------
>>>>>>    1 file changed, 6 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>>> index 1ef758ac5076..09c919f72b6c 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>>> @@ -120,12 +120,6 @@ static bool amdkfd_fence_enable_signaling(struct
>>>>>> dma_fence *f)
>>>>>>    {
>>>>>>        struct amdgpu_amdkfd_fence *fence =
>>>>>> to_amdgpu_amdkfd_fence(f);
>>>>>>    -    if (!fence)
>>>>>> -        return false;
>>>>>> -
>>>>>> -    if (dma_fence_is_signaled(f))
>>>>>> -        return true;
>>>>>> -
>>>>>>        if (!fence->svm_bo) {
>>>>>>            if
>>>>>> (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
>>>>>>                return true;


