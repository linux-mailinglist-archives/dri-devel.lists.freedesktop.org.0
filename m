Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF5FAFE356
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 10:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADE510E766;
	Wed,  9 Jul 2025 08:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T0Avgu9B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A56A10E1F8;
 Wed,  9 Jul 2025 08:57:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJHGRAtsMQEIL5jLzhjh4PanVKGFDMzccAfSMs+9YTc0cFnaEeItzE+mXNhYD28CMjDj/6zPnLtSzM7A9dTutx8micEBt1wOPrY4i5D8EKhIjm6mH0CqSReHkDYS/wbiw5JIy9WGIJTf6v5q6bPq/+KMCoSqyMJKnuB2g8MmSmJFfoMSgQvN765914zShLYCVFhEEFst82ss/TnoddNaRRYO8OQLfgHJe8XOSkxAHu/nmPSmguEzjCBkaVEOIg1clhWdOP3XfPnPE9huQpI/hguSocSpEJqDN4t0+WfLxBorntflHmzqpwirjS2bWF7VS3XXQf5vQv14NPHIyeIdAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IakzEdmMVqjfAmrwu5LVUV/f1/sHvrQ2eDDqOmAS9s=;
 b=T9TPP4LqhXvRA8p0JsencstNTQoTwlEEgm2maEOoaMPHwK1xcWoSLrZdYUlZ3FOffxJlt6IETKIoJvTphKaj2QSyfPNJn2GMI2Ey9+s5E8j/87WCRyRx0RPUVE8/tIGrUx1JgHfygNAwzO6O25ptIu4CUgv+tYrXBKgOdj7wsWnmIm/OkEB7rapJgJ6Uu8OB3Ra2At9GeDsD2zq3ChSmMyC/aC8+DfTPFS7pKBqe4btLo+vUAy3JkCkxTy9PF+1uRZV3dP9As7URSgb8Wqr7sbawdKd7h51QnefutMlK3Le7m9zI3S/a3o0v3g3J8wJPZqpsclc9lcV3SOpGXfRHTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IakzEdmMVqjfAmrwu5LVUV/f1/sHvrQ2eDDqOmAS9s=;
 b=T0Avgu9B6BURKUUbG1ZbM0AwGXWzPFKoHKFmbf6DEOLS7YDYNjSOb+3E16Re0S0AttdeacnVoxvLIWzMPF1rvl5d57ajW3MKnrwbvaByoeS6Tj9mWR274V+987gVbp3TZ97oV37AuEvD1y6kz6LHWmGJMi+pZCXfBz6MKrT1Hcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BN7PPF28614436A.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6c9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 9 Jul
 2025 08:57:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 08:57:20 +0000
Message-ID: <b3f55bff-50de-4bc4-8ed7-a7068ce8d79f@amd.com>
Date: Wed, 9 Jul 2025 10:57:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/15] drm/sched: Queue all free credits in one worker
 invocation
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
 <20250708095147.73366-15-tvrtko.ursulin@igalia.com>
 <cb140d4e-01cd-4cd7-bd7c-5c10b44cf98f@amd.com>
 <95da8a36-8231-4578-ae74-35c8ba7f6972@igalia.com>
 <93c27eec-3c4b-4897-ae85-a2eed266a6b7@amd.com>
 <45c0665d-6b1b-4ba0-a770-8120cfed951e@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <45c0665d-6b1b-4ba0-a770-8120cfed951e@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BN7PPF28614436A:EE_
X-MS-Office365-Filtering-Correlation-Id: ce47ee31-4138-464e-fe96-08ddbec69ce8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlBwSnNDR2IreEpwYWkzdlBHcmJNY3kyTENDMGFlZ3VSaFdGSDVBeGcrS3RI?=
 =?utf-8?B?akJCaWNybWZxVHlFL3R5V3FwYlZCeWFveEd1NTRJbEFUaGlqQnNzbkdzNEhh?=
 =?utf-8?B?UjhXVjl0Sjlxd3A3UDdPbTM0SmwxQnpVUDRLTDd4UmVWeFc1L1hzYlJLN08x?=
 =?utf-8?B?VDJBWEQxajRrT0dqRGRzeStUckdKdjFONDZXZCs5b1dwcEtnWGtxbFR6dEFq?=
 =?utf-8?B?UFY0dGdxeWswd0tKMW04bW80U01KM0lCcHpYR1FjZ0lrYnVqNWJwd0NadVRQ?=
 =?utf-8?B?ZHdSY3JEazFwZmltam1ETmIzT3Vlb0ZueG9uckZvMFIrL3kwTmxiL3g3WHY0?=
 =?utf-8?B?QnZzb2dHOUYxWm1JbisyVFQ2VjA3aFlMekwyeWJ5RzFxL3ZTRS8velhKQVRC?=
 =?utf-8?B?c0ZKRlRHbUpwZDcxTU50VVJwRVNqWUdKUzhEWHFmMmxvdlQ5YWZ4eWVTekdN?=
 =?utf-8?B?eXp0R3BtMlp0dWV1YUpSejZqSnpNaElhYWlpTkttMGErQU1jaDR3emhKMlFZ?=
 =?utf-8?B?V3NjbmNTTFlkb21ZYTVxK1ZQWkVRYnhJV29lL2ZjNnBJLzRtOE8wdDhIVTlI?=
 =?utf-8?B?alJKTzVheTQ0OWxLOWh1b1JsZGJpaWdmS3o0YjNjSWs0R2hHdkc4WmZIR0tH?=
 =?utf-8?B?NDFJbkJkSzdreHRPdElCTXNmWlNraDdHUmtDaWMrZUNIU3IyS1BBSEtOU0lC?=
 =?utf-8?B?TVgzQWlrTjZqRkVmMytkY1NDSHJ0TC9kZjd3SnFVVUEyN0V3WEVmYWpCY243?=
 =?utf-8?B?Vldoa1RVTXRPUVVaQ2FDMlZ3SE5CM2JUdHZ1bmNnWnRnVGI0ZEVtMmpmUlIx?=
 =?utf-8?B?WUZ0dFFGOGkvczNndUdLV0Z2bVlSVmQxdDZFNE13czJFY1BiYUpuOVV0YVA2?=
 =?utf-8?B?TG8xUWhqL0ZKdThHNHdkcTYwU3pmWUhsYzN6LzRzZ0ZaalAxTlA5akFCdWR1?=
 =?utf-8?B?V2NZdnlhcDZWME0ySlhvRVIrbkJQbmlFbEdjNzlaTDVVZ3lBRkxmMDZ2dXZ6?=
 =?utf-8?B?Nm9PaTF1ODYvQ2p4S1ZGSGJINVRzU0hzcm41ay9zcE10Yy9BdnV3cys4dEpq?=
 =?utf-8?B?WnE5d20wTU1Pd3JtcHk4VTZZeUZQc0VDaXpqYTFLSHBkNVlFNlpHdDFzOFgr?=
 =?utf-8?B?ZTFzQ3Foa0dCTEp6SlBBTlQxYjlDUzNZK1AxMXFqTzdacmtCWExvODNXYVVN?=
 =?utf-8?B?ZXQ3eGpXM3lNRGZTbkEzdHFXL3orcXh6SHpyZUFrc1BsSmhkelBRWGZTVFE4?=
 =?utf-8?B?dzBQYnRTZWhrWXFua1ZlbENDaFVpS1BXN1p4bEUxS1oxUkNyZ1FYOEFpa09T?=
 =?utf-8?B?dGF2djJueXpKVHkvZU5FK0JacjVJeHh4VSthVWs2elU4enc2NVFQd00rVWlG?=
 =?utf-8?B?YWRoU0pHdUpoN1ZndkFsMG12Uk9hWUFnR3gzZjhqb0s1by91SDJSZEpiZEFs?=
 =?utf-8?B?ZVdySnpwSGoxa2J2VkkvQzNJMEwwdkN2Y1lVOU10SmVsdDdJb2NuNm5nNVJ3?=
 =?utf-8?B?OFFXUDYzc0MyM3g3WEpSS1FpU3Z4OTBpaTFwcjliYnlUUWo5ZFViRytiRXc3?=
 =?utf-8?B?WnhXYXZzSTVYMkQ3SmZnQVZseENHR3RQSjlQaDNUUmFRWVRZdzFWWU9iR3Vp?=
 =?utf-8?B?VFo3S0EvTjlSeXNtVVBEVE5HTUtrT0poVkhtYmZySCtDbDAzUkpGdTFtM05y?=
 =?utf-8?B?NmRBU1lHb1JuVllneVZhRERkTmZTN21mQnBzNjNYUDE5ZTlyVEZVZmtyMHBL?=
 =?utf-8?B?VE43VFhVYml4dVRwdFBWMklZOUt6b2hRUExXcUlFMlhTNWw3TDJibzFQdFhk?=
 =?utf-8?B?SDFkaEV6TjJ4QnI2QmR0bUUxRTA3OTFuektqZjVZaksrbUdRSVo0NW9BNUpz?=
 =?utf-8?B?RVJxVzlPMUtWY01nSWxxMTRtdGlPL1BlVmpLTHhsdDV1MFYvczNmdVR4OW93?=
 =?utf-8?Q?d8fyEO5PdXs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXY5eHg4SkQ4NlgrcWo0M3gzTlhJME1FckZVM1RnRGd3dHl2ZjlIQnN2VHdG?=
 =?utf-8?B?SDhMNGQwODI4aVllYnpWdkZVajVpR3JaS2tVM0ZHVDBSRzBQSXJCZzBUSENJ?=
 =?utf-8?B?YWd3Z2dERHVyNTk3L0xQSFJuVTM0dXM5Y0hIa3NxR1FzOXhjMmI0ejExSVJI?=
 =?utf-8?B?Z0w2VDZqWVJIS3E1U3ZQWHFxcFFieWtwRWVGaXE3M01GMjRxeUZQU05sb1Ji?=
 =?utf-8?B?Zjh4Sis1bFR6aWV2eXVDYmJRYnpZTUxqdU1ZVmVpVU0wckhYREc1bDl2SU9F?=
 =?utf-8?B?RnVxZi82YkwwN0tZTmh0cHlCcVNXRkFqcW5UVnY1RWwvRmZJZ0xMSUVmYnhX?=
 =?utf-8?B?a29kdDBCYTFGSnN0SU50RXRkeUZrcHdTWDc4N3JyYmpIS0pITHZGd3hZSHE1?=
 =?utf-8?B?Z0E5MzRkQkc1V1puOEk4VG8xd1hzM2Jzd2QwLzNlK09HbGVVVzNzVXQ1MGNP?=
 =?utf-8?B?R1NvSU45dENDU1hlYnMzWVZ0TTRqdDhZVlhUSHViMXpsMXpaYVpNZzVzcU0x?=
 =?utf-8?B?WEoxV0tOUk9tV2E2UUt1T3h4a1VDcFZpL0p5blNqUVdtTjM4cGpQWDRmZ3Q5?=
 =?utf-8?B?ZUwycDJTRlRaU0tqb1RiQVdsQTI5aUcra1Mxa2hLRWR2dlFpUkdPbVR2a2tH?=
 =?utf-8?B?L2JNLzFtRTIyZ0w4RFl6OUNxdGJzOWdWK3NNaS83WEI0a0hZNlBOUkRTTVhW?=
 =?utf-8?B?YmdmRzJnb2pnNTA5M2xYZ28zamc5eUg1U0kwRS8vNFlLSU9mVjlCV0czamF0?=
 =?utf-8?B?YXYyaFBlaExHQ0V1S3BZR1krNE9qbE1POUN0aVlaNHBQdzhlUHVFVThDN3VK?=
 =?utf-8?B?L2UyMVlUekM1ckhVRWV5VFFHSmt0UitmbWtwaWMvOVJLUXE5UXhCR252KzVk?=
 =?utf-8?B?MHIzcGs2c0s5YWlKMERiMHJwcXFKOFJjdDhTK1A5Yi9MYXIvM3VodTIyZmtO?=
 =?utf-8?B?b3h0RDY4N0J2SFdjZ09ia1hSVTlSdC9GMllSUzdGWi9YWFlZTHprUC9lOUJl?=
 =?utf-8?B?SVp6a1E1RisyS0RMY2M4aWF3YUQ2cUtsTEd3RXo4STF5NGpOU3ZwZ1ZETXpm?=
 =?utf-8?B?K2dxNmFVYzdVNWNsZlMvSmlkMUdzRzVKemxSNU5PK1pnMytBVUhPU2xNT3lS?=
 =?utf-8?B?R2N1MGlHeGFHdys4U05jNXpwK3ZXY0Jyb3JWOHR1OXUrbzNZUld6c29nOStr?=
 =?utf-8?B?eFBndHQrUXlHK0dFZVQzb1pmbnE4clZ5NmszWUJKQzBWVXZCcnRIQTI2NGpJ?=
 =?utf-8?B?R0FzQndOVUJKeXlubnk3UFAyWFJwWi8xVVN3b2c5RlcvVWFBRVlIVzMzMExT?=
 =?utf-8?B?dFBxcXlRZW43OUdlUUIwZFFqb2l6aGhQODY0VEJva2FOMnBWQWxaUmM5Qko3?=
 =?utf-8?B?UGRMbjVDek8rYy8xQys2b2NJeDB2QzQyRmFGeWdsVHFib0pqcEJWcWhDL3dC?=
 =?utf-8?B?eFhSZzJHU21EODltWEI2SEs1c0R4S0o4MDNDSmUrUnBIblNjZk5RSzhhQ2Rx?=
 =?utf-8?B?eUFDcFMzZnVNVjZXdVNYbUM4YjcyYk1KQXg0UDg5amZ5ZE5WSDNiR29xVFNS?=
 =?utf-8?B?SGdtM3hCZ2hxNU1kSGVxU3p1T0kxeFkxRjE2YmYwWkVrdXRUaUE2cTU5b3po?=
 =?utf-8?B?Z1h3NlR2bDdXbmZOZXdwNkJydVFQQW1BelBpODBDSFFlOStpYmwvYUticWVK?=
 =?utf-8?B?UzRjM0YzUFB6V0R3MXAzUzkvRFg0eGJaMk81dGFkblJaNkpaMGR0ZFRpRS9i?=
 =?utf-8?B?SnZNeitoUmlDVStjdHZ6T2JkL0t4L2dodFE2UWZGRHh6OUEycnY0VXdUaTBx?=
 =?utf-8?B?N28zbEwybHRLNkowZ2dwQkdaNFhIWVkxdGsvMEg3UXc4VmVPdXRwbGhXK0V1?=
 =?utf-8?B?QU1lYVI2WHZTQTM0MkFtbllrYmduWUR6OTRZcXRmb1NNQWhITUZNV3diTm0v?=
 =?utf-8?B?QlBaQ2Q5UFpSQTMzQ0Ewc0RSeHY5QlVFUUR5UUZrT21wdk9ncXN3c05McGJx?=
 =?utf-8?B?WjYyT1cyd2ViTmFDUW5WWkxLQkwyMjdleThqRUFndXAzVkVtK1BNSUxITkl1?=
 =?utf-8?B?cmxTU1hyc1JpVjdEZ2ppTk4rajRQNFd2b3FSSkpDSElweXg0L25uRXl3Wkc1?=
 =?utf-8?Q?YMeefwybULF0YchH0QzCaMsM+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce47ee31-4138-464e-fe96-08ddbec69ce8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 08:57:20.4887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GsjFDiqsuriwwTA+2P8fjCO7N92aQDvL54Dya4RfgWW5KgZsb1IU8R2cX1rFrxPn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF28614436A
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

On 08.07.25 17:31, Tvrtko Ursulin wrote:
> 
> On 08/07/2025 14:02, Christian König wrote:
>> On 08.07.25 14:54, Tvrtko Ursulin wrote:
>>>
>>> On 08/07/2025 13:37, Christian König wrote:
>>>> On 08.07.25 11:51, Tvrtko Ursulin wrote:
>>>>> There is no reason to queue just a single job if scheduler can take more
>>>>> and re-queue the worker to queue more.
>>>>
>>>> That's not correct. This was intentionally avoided.
>>>>
>>>> If more than just the scheduler is using the single threaded workqeueu other workers, especially the timeout worker, can jump in and execute first.
>>>>
>>>> We explicitely removed submitting more than one job in each worker run.
>>>
>>> I wanted to ask why, but then I had a look to see if anyone actually does this. And I did not find any driver sharing a single threaded workqueue between submit and timeout.
>>>
>>> The only driver which even passes in the same workqueue for both is PVR, but it is not a single threaded one.
>>>
>>> Or perhaps I misunderstood what you said. Could you please clarify either way?
>>
>> You correctly understood that.
>>
>> The argument was that submitting more than one job in a worker is simply not beneficial and other work items can jump in and execute.
>>
>> I have no idea if that is actually used or not. You would need to dig up the discussion when we switched from a kernel thread to work items for the full background.
>>
>> But in general to do as less work as possible in each worker and then re-submit it is usually a good idea.
> 
> From the point of view that the single work item invocation shouldn't hog the worker, if the worker is shared, I agree.


> But what we also want is to feed the GPU as fast as possible, ie. put the CPU to sleep as quickly as possible.

Yeah, that I clearly agree with.

> If we consider drivers with dedicated workqueues per hardware engine, or even per userspace context, then especially in those cases I don't see what is the benefit of playing the wq re-queue games.
> 
> Anyway, I can park this patch for now, I *think* it will be easy to drop and will just need to rebase 15/15 to cope.
> 
> In the meantime I have collected some stats when running Cyberpunk 2077 benchmark on amdgpu, just to remind myself that it does happen more than one job can be ready to be passed on to the GPU. Stats of number of submitted jobs per worker invocation (with this patch):
> 
>         1    2    3    4    5
> gfx_0.0.0    21315    541    9849    171    0
> comp_1.3.0    3093    9    2    0    0
> comp_1.1.0    3501    46    2    1    0
> comp_1.0.1    3451    46    2    0    0
> sdma0        4400    746    279    481    7
> 
> This is for userspace contexts only. Quite a good number of three jobs submitted per worker invocation.
> 
> Kernel sdma appears to favour deeper queues even more but I forgot to log above 2 jobs per worker invocation:
> 
>     1    2   
> sdma0    8009    1913
> 
> I can try to measure the latencies of worker re-queue approach. Another interesting thing would be C-state residencies and CPU power. But given how when the scheduler went from kthread to wq and lost the ability the queue more than one job, I don't think back then anyone measured this? In which case I suspect we even don't know if some latency or efficiency was lost.

It's been a while, but I do remember that we have gone back and forth over this when we switched from kthread to work item. I'm honestly not sure how much overhead a work item actually has, but I guess it isn't that much.

But I'm pretty sure that we burn quite a number of CPU cycles in other places, e.g. the VMID management for example. It would certainly be nice if we could profile that and see where most CPU cycles are spend.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>>>> We can simply feed the hardware
>>>>> with as much as it can take in one go and hopefully win some latency.
>>>>>
>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>>> ---
>>>>>    drivers/gpu/drm/scheduler/sched_internal.h |   2 -
>>>>>    drivers/gpu/drm/scheduler/sched_main.c     | 132 ++++++++++-----------
>>>>>    drivers/gpu/drm/scheduler/sched_rq.c       |  12 +-
>>>>>    3 files changed, 64 insertions(+), 82 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
>>>>> index 15d78abc48df..1a5c2f255223 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_internal.h
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
>>>>> @@ -22,8 +22,6 @@ struct drm_sched_entity_stats {
>>>>>        u64        vruntime;
>>>>>    };
>>>>>    -bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>>>>> -             struct drm_sched_entity *entity);
>>>>>    void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
>>>>>      void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index 35025edea669..1fb3f1da4821 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -95,35 +95,6 @@ static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
>>>>>        return credits;
>>>>>    }
>>>>>    -/**
>>>>> - * drm_sched_can_queue -- Can we queue more to the hardware?
>>>>> - * @sched: scheduler instance
>>>>> - * @entity: the scheduler entity
>>>>> - *
>>>>> - * Return true if we can push at least one more job from @entity, false
>>>>> - * otherwise.
>>>>> - */
>>>>> -bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>>>>> -             struct drm_sched_entity *entity)
>>>>> -{
>>>>> -    struct drm_sched_job *s_job;
>>>>> -
>>>>> -    s_job = drm_sched_entity_queue_peek(entity);
>>>>> -    if (!s_job)
>>>>> -        return false;
>>>>> -
>>>>> -    /* If a job exceeds the credit limit, truncate it to the credit limit
>>>>> -     * itself to guarantee forward progress.
>>>>> -     */
>>>>> -    if (s_job->credits > sched->credit_limit) {
>>>>> -        dev_WARN(sched->dev,
>>>>> -             "Jobs may not exceed the credit limit, truncate.\n");
>>>>> -        s_job->credits = sched->credit_limit;
>>>>> -    }
>>>>> -
>>>>> -    return drm_sched_available_credits(sched) >= s_job->credits;
>>>>> -}
>>>>> -
>>>>>    /**
>>>>>     * drm_sched_run_job_queue - enqueue run-job work
>>>>>     * @sched: scheduler instance
>>>>> @@ -940,54 +911,77 @@ static void drm_sched_run_job_work(struct work_struct *w)
>>>>>    {
>>>>>        struct drm_gpu_scheduler *sched =
>>>>>            container_of(w, struct drm_gpu_scheduler, work_run_job);
>>>>> +    u32 job_credits, submitted_credits = 0;
>>>>>        struct drm_sched_entity *entity;
>>>>> -    struct dma_fence *fence;
>>>>>        struct drm_sched_fence *s_fence;
>>>>>        struct drm_sched_job *sched_job;
>>>>> -    int r;
>>>>> +    struct dma_fence *fence;
>>>>>    -    /* Find entity with a ready job */
>>>>> -    entity = drm_sched_rq_select_entity(sched, sched->rq);
>>>>> -    if (IS_ERR_OR_NULL(entity))
>>>>> -        return;    /* No more work */
>>>>> +    while (!READ_ONCE(sched->pause_submit)) {
>>>>> +        /* Find entity with a ready job */
>>>>> +        entity = drm_sched_rq_select_entity(sched, sched->rq);
>>>>> +        if (!entity)
>>>>> +            break;    /* No more work */
>>>>> +
>>>>> +        sched_job = drm_sched_entity_queue_peek(entity);
>>>>> +        if (!sched_job) {
>>>>> +            complete_all(&entity->entity_idle);
>>>>> +            continue;
>>>>> +        }
>>>>> +
>>>>> +        job_credits = sched_job->credits;
>>>>> +        /*
>>>>> +         * If a job exceeds the credit limit truncate it to guarantee
>>>>> +         * forward progress.
>>>>> +         */
>>>>> +        if (dev_WARN_ONCE(sched->dev, job_credits > sched->credit_limit,
>>>>> +                  "Jobs may not exceed the credit limit, truncating.\n"))
>>>>> +            job_credits = sched_job->credits = sched->credit_limit;
>>>>> +
>>>>> +        if (job_credits > drm_sched_available_credits(sched)) {
>>>>> +            complete_all(&entity->entity_idle);
>>>>> +            break;
>>>>> +        }
>>>>> +
>>>>> +        sched_job = drm_sched_entity_pop_job(entity);
>>>>> +        if (!sched_job) {
>>>>> +            /* Top entity is not yet runnable after all */
>>>>> +            complete_all(&entity->entity_idle);
>>>>> +            continue;
>>>>> +        }
>>>>> +
>>>>> +        s_fence = sched_job->s_fence;
>>>>> +        drm_sched_job_begin(sched_job);
>>>>> +        trace_drm_sched_job_run(sched_job, entity);
>>>>> +        submitted_credits += job_credits;
>>>>> +        atomic_add(job_credits, &sched->credit_count);
>>>>> +
>>>>> +        fence = sched->ops->run_job(sched_job);
>>>>> +        drm_sched_fence_scheduled(s_fence, fence);
>>>>> +
>>>>> +        if (!IS_ERR_OR_NULL(fence)) {
>>>>> +            int r;
>>>>> +
>>>>> +            /* Drop for original kref_init of the fence */
>>>>> +            dma_fence_put(fence);
>>>>> +
>>>>> +            r = dma_fence_add_callback(fence, &sched_job->cb,
>>>>> +                           drm_sched_job_done_cb);
>>>>> +            if (r == -ENOENT)
>>>>> +                drm_sched_job_done(sched_job, fence->error);
>>>>> +            else if (r)
>>>>> +                DRM_DEV_ERROR(sched->dev,
>>>>> +                          "fence add callback failed (%d)\n", r);
>>>>> +        } else {
>>>>> +            drm_sched_job_done(sched_job, IS_ERR(fence) ?
>>>>> +                              PTR_ERR(fence) : 0);
>>>>> +        }
>>>>>    -    sched_job = drm_sched_entity_pop_job(entity);
>>>>> -    if (!sched_job) {
>>>>>            complete_all(&entity->entity_idle);
>>>>> -        drm_sched_run_job_queue(sched);
>>>>> -        return;
>>>>>        }
>>>>>    -    s_fence = sched_job->s_fence;
>>>>> -
>>>>> -    atomic_add(sched_job->credits, &sched->credit_count);
>>>>> -    drm_sched_job_begin(sched_job);
>>>>> -
>>>>> -    trace_drm_sched_job_run(sched_job, entity);
>>>>> -    /*
>>>>> -     * The run_job() callback must by definition return a fence whose
>>>>> -     * refcount has been incremented for the scheduler already.
>>>>> -     */
>>>>> -    fence = sched->ops->run_job(sched_job);
>>>>> -    complete_all(&entity->entity_idle);
>>>>> -    drm_sched_fence_scheduled(s_fence, fence);
>>>>> -
>>>>> -    if (!IS_ERR_OR_NULL(fence)) {
>>>>> -        r = dma_fence_add_callback(fence, &sched_job->cb,
>>>>> -                       drm_sched_job_done_cb);
>>>>> -        if (r == -ENOENT)
>>>>> -            drm_sched_job_done(sched_job, fence->error);
>>>>> -        else if (r)
>>>>> -            DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
>>>>> -
>>>>> -        dma_fence_put(fence);
>>>>> -    } else {
>>>>> -        drm_sched_job_done(sched_job, IS_ERR(fence) ?
>>>>> -                   PTR_ERR(fence) : 0);
>>>>> -    }
>>>>> -
>>>>> -    wake_up(&sched->job_scheduled);
>>>>> -    drm_sched_run_job_queue(sched);
>>>>> +    if (submitted_credits)
>>>>> +        wake_up(&sched->job_scheduled);
>>>>>    }
>>>>>      static struct workqueue_struct *drm_sched_alloc_wq(const char *name)
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
>>>>> index e22f9ff88822..f0afdc0bd417 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_rq.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
>>>>> @@ -197,9 +197,7 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
>>>>>     *
>>>>>     * Find oldest waiting ready entity.
>>>>>     *
>>>>> - * Return an entity if one is found; return an error-pointer (!NULL) if an
>>>>> - * entity was ready, but the scheduler had insufficient credits to accommodate
>>>>> - * its job; return NULL, if no ready entity was found.
>>>>> + * Return an entity if one is found or NULL if no ready entity was found.
>>>>>     */
>>>>>    struct drm_sched_entity *
>>>>>    drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
>>>>> @@ -213,14 +211,6 @@ drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
>>>>>              entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>>>>>            if (drm_sched_entity_is_ready(entity)) {
>>>>> -            /* If we can't queue yet, preserve the current entity in
>>>>> -             * terms of fairness.
>>>>> -             */
>>>>> -            if (!drm_sched_can_queue(sched, entity)) {
>>>>> -                spin_unlock(&rq->lock);
>>>>> -                return ERR_PTR(-ENOSPC);
>>>>> -            }
>>>>> -
>>>>>                reinit_completion(&entity->entity_idle);
>>>>>                break;
>>>>>            }
>>>>
>>>
>>
> 

