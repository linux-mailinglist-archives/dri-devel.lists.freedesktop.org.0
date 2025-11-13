Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C6AC57F8B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C366910E134;
	Thu, 13 Nov 2025 14:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SOx6ijjj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013070.outbound.protection.outlook.com
 [40.93.196.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2A010E134;
 Thu, 13 Nov 2025 14:38:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGaE+NnUkEAPRrj5Z5FZ+yMfAXbUWmCE1VU90JO+kiaFihV58OpUJ/PLkVmbvzVp53/NDtU5DMgQv5yFLZz7plYTmkXO27i7CW04bH/VFLeoyQdA5Dv5wUKgjaBaaeoX9SqhuGCXufDNM2M1lCHSMvTFLnGavUdZE7hs0AGLjj0JsSTwbyZus6ZVjeAEkB0qZh0tJ2oMQYjqY3n8ZuGbQwyaGhSI0aecVv7UW3QH2JZVqTmxj919YmkM3l2pqlETaCWBRFiZ11ZDk72aiPIXdWWC+dS1SLdIl52lWrecXzsnBB1Rf8c1cL75BvVyYyVh20XzomDJPor0b8m7ZM/cow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABYZFeS1M8rbtpR3vQ6phhrDZepDXK6qX+aZwnbAN94=;
 b=K3bqupTRRKMx6mAC3QxdiK87LI1FHh9MquU5vt0NTfgdNqSy604Exu/9WZWeWwd35AmZ+E6MdYZF0FoTZ63yYv/pn8GMaT4MiOTOsg0ZrweZcMo6iis1PwuW2gnE+u5ClNf8eV9DQxQK6BirJL+EwkH//T7QulOHdeHsZNH8//eNF/1j3L9+gZNlchjV91S7gaFMzXih7BRVYjboOlNoLBlbNDjPzeyhCjpP5BoLB5DgJq5SOLfO1LMzv4JAQWzitNXSPeqjWrSMfv8ntnJjd4q0jvdHWXJk02ltehezTbO/XmN99FTcuA+GJ+bA9LksTYrveQlxxcdr5gKiatQxsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABYZFeS1M8rbtpR3vQ6phhrDZepDXK6qX+aZwnbAN94=;
 b=SOx6ijjjh6uI79cAES4+y5pIBWVgLHt/wgjWTh2suGVWEXXdGr9qA5BdEUIq+NrKouJNHnZWBkrCdpZRC+bRP4JRErRok/bmWiszl0yEcIMMDZ12BRk/J4cRkrx43jQb/B11bbb+z9wjCESbAeBTAvzYw6EgrwCbAjdzpH3urOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB4383.namprd12.prod.outlook.com (2603:10b6:806:94::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 14:38:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 14:38:02 +0000
Message-ID: <6404ddfd-6bf0-4496-af0d-f5168e0c98d8@amd.com>
Date: Thu, 13 Nov 2025 15:37:55 +0100
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
 <a01fa221-401f-4548-80d8-5d687e93dbee@amd.com>
 <2715246b-42a5-443a-b4e8-9a67920f5fec@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2715246b-42a5-443a-b4e8-9a67920f5fec@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0509.namprd03.prod.outlook.com
 (2603:10b6:408:130::34) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB4383:EE_
X-MS-Office365-Filtering-Correlation-Id: 693ea9d0-a0be-4f48-a5f7-08de22c23f6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWZ2anAxd3JuSG1nYUZ6aTY4Q3FsV28zdzUwRHBxY2o2M2NHQUxFSVZrWGZH?=
 =?utf-8?B?aVFpUm40eWJhRzZvRW05bEFXdTZha3BlMGJzUGtBTzZ1b09tNUZQbytsQVRY?=
 =?utf-8?B?dU9vU1F0U2FPOVZTN0J6UnNJNkhReWpkNXZzMFNwR2NqOElLZDFha21YZnZP?=
 =?utf-8?B?M0JwNDlGTW5vcEZ6S3ladkRrZEUzc210WGdmUHk3ZUxvK2Vtd3ZqRitBVmFk?=
 =?utf-8?B?ek5FTWVkZGJkOTVLVnRIaWV5UXB4cFhCUVBLWlUwMDFpaC80S1Y4cGpmb1do?=
 =?utf-8?B?M3FueVNVTnJGS1ViL1pJZThMbnpoOTIzK0tINjhUazJ0eUR5eGZWMzNpSy9C?=
 =?utf-8?B?SURZVzhqUWp0eEdSQWdTcEh6c1lNSWZzQnpGTkRESWtDSlMrczV2SEx5TTVj?=
 =?utf-8?B?cWlZWHJ3cDJ1dHpUeGlzZHRYM0tiMU4rQmJsKzNUaURrUlpDb3p2U2Izcnlx?=
 =?utf-8?B?dUFyT0dUQk56UEJKM1R2dk5SZC9TL2R2NkVDTXNCNzc0ZUoyUmRBTlJDZk1P?=
 =?utf-8?B?d1RKdmFVT0RIVjNNVWNZTVVUcktudHErZ0tqbHFSYWMyaWkzRE9nSW5FQkZ1?=
 =?utf-8?B?WnB1N1I1UXFWc1ZGWDNqUkhsT1ZMODJkV3lDd2hDdCtHZUJXU1Q0bWJqbVgr?=
 =?utf-8?B?dkdqZDdHRi9MUnZwMHJJK0luOGN3THVSREtJV09xVTV0bE51MWVoT0hGRDFv?=
 =?utf-8?B?RVlxSUt6ditDSW9Vc0Uwbjc4OW80a21qVFJqMlc4eWFyNStnODZwS04zRHFH?=
 =?utf-8?B?bXNCMWpaVDdHL2wrSkFvY0g5ZERlT3pVUkttdjNxY3AzOEVuR0djbkEwci9i?=
 =?utf-8?B?YTZubWt1WXRrQi9iaHYvbUlDckJYT2pyRXFRbk5XZW5WMVYyZzI4MENsZEtG?=
 =?utf-8?B?MzBPYm5xZWZBQ0k1MmM4a0wzOFBBQ2xUYXpKMzZRYVUxcXhYVjdWd2xadThr?=
 =?utf-8?B?Y0ErSjN3bmQyYTNVMGVpSmxaZERkV3ZLU0xkc2p6SEwyaXlWWTFRRDB6Z3NK?=
 =?utf-8?B?NzZ6MmE1UjJlV1BKZUVFU3ZuWnVzUDRBZWlXN0RoaENlRlRxOURKL2JFUGJI?=
 =?utf-8?B?NVF0RzRldjdJRWRlRnlBYysrVUkyMnNPcnp5TG0yT3pxcEx2UG9YdFFaNHp1?=
 =?utf-8?B?d01sM21FODlWVC91MHZYeFhrdWIzdk54ekhhVGZrOE53SEFSRnhZT0x2OXNp?=
 =?utf-8?B?MnFmTU4xcUpwVEc1K1pGcVN4Ly9nSW1oYmU3OWVtNEtKTXlObnY0ZE5xUTdH?=
 =?utf-8?B?SGx4MjVnRWRWWmplSHNoR0w0SkE2WlFZUEIwT0NDV1ZMb0E2dkFMNERzYW83?=
 =?utf-8?B?dnBaNTJiaHJVNDVONURoNHNDZzAranl1VG5MU1FZbWFVakxpM0JBU2RPS3VC?=
 =?utf-8?B?V2dWY3hhUXBNWlJVaURIb2tkWDY0Ky9qM3BYWFpxMnlwS1pnUTF6NC9ReUQx?=
 =?utf-8?B?cWZhTXNDK1ZLbWFnd09tazFWa3Y0QU1IcCtsWXdseGNMeWh2UDN4dmJrZE5B?=
 =?utf-8?B?akJxNWJyeTBXSXE4T09kNjZWSjZKZFVlZkxUbGRMUTZtdk5uNDZIeWpiUXcz?=
 =?utf-8?B?OGFVSmc4L0hhRHBCcU5WUHN2M0dKSlJVNitmdlJKdEZWNXpDcGRsRW0wdHNW?=
 =?utf-8?B?Skh2LzBOZGdBbUgvYnZmemlwaGFSTm5NS1JLa2hEZ3JiclJsenBJY0ZPT1hF?=
 =?utf-8?B?WCtWdkpSMmJBSDRScm1BQ3VhdmNKK25wUlhGcjJBSWxQYlNkSXFob3hGSENy?=
 =?utf-8?B?OGN1UlprbmQxcVV4NXJsQU1DcENPZUhoc296MUt2TERPUkhoQ0xwU1NzYzcz?=
 =?utf-8?B?d3JLUkVxc0UycWZRaGlYY1VXRURPSFUvVERyUDM0aEJtSDNSYnRvVnltSTIz?=
 =?utf-8?B?OGlldWhoakxxY2o4VllhSUtUWnY5WDZ3b2N5TWJDUXJkN1psbzVMRGVxWnlq?=
 =?utf-8?Q?6jS3Qi2DCMoR6R5QOvSy5YzT7MQYh9VJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW9NQlhzczV2NzhtZkpOWGN1NytIQTNOK1dEaklERHVQeDFZVnZIa3FFSnZI?=
 =?utf-8?B?WEVBMjVCZzZxMEtwTjNuRUg2Z1c1dzdaa2ROelhUcnp4U1VraTZCblRzaGpR?=
 =?utf-8?B?RUs1dStuMlU3T0lkbTUrOWJnaHhsVWM4cWZoL283cDZaR3N4SjNaZFlNajg2?=
 =?utf-8?B?UnZNdkRHUkJUUUNUdXNzZGw1SUNISG1yZFB3RmpRNEl0eDloZjhGUk4zVSs2?=
 =?utf-8?B?V0tNTEEwZlVZSXFuRU4xeFBIYWFOTnVmck82MURhQmp5eEtENmd6VDJvcnRF?=
 =?utf-8?B?VkZ2QmlIVUYxM29Rd0NPR1FRYkJPNE9NalI4N0d1Q3oyNHh1dmppV1R4S0pZ?=
 =?utf-8?B?dVV5a2dYRWptTzJlOXhkbUZHMjJuMWJCWVEwUHprZHJTZlRMeERLVUxWMHhs?=
 =?utf-8?B?b2lSSmlGd1ZvWVRtcmVGQ0V0TG1HQzdwVTJBZ3dIRGlqak1RRjZVTVNWckdx?=
 =?utf-8?B?UnhHTmhwNThmSnNPQ0MyQS9PYXhvWFdxN0ZDbldMOEZIbERWdUR2MVBUNnlr?=
 =?utf-8?B?YSs4c1RMLzB0bXlId0JBWkZFZVZjM1NZZXlXMmlZS2treEoydG9lTnBYTmlD?=
 =?utf-8?B?em4zS0NOQ0FHd09jVHFGZWp1dUNZcXVZRUdUdnJ4M01NSk4ySjFQdko3OCsz?=
 =?utf-8?B?R1I4b3MxM3FYbm5EWEpOMmJBYS9pUE1TT1RxNitRaG5VMXNVOEg2TFl2cis5?=
 =?utf-8?B?OGNyUHZZb0tTdmR1R01jT0NUTURlOEhVVkg1eWE3RXl4RE1kUS9YOFdQOFBa?=
 =?utf-8?B?alZHQmppNGs4bHdhdkFYSkFRUTRaUEdFUnpYWXJwU051Z3VVS00yREdIZlJs?=
 =?utf-8?B?bVgzUU9tTzkvem9NMyt0RFdTcG0xek1CcG9laUs0cjBkMjgxYnVTa0l3Rm5i?=
 =?utf-8?B?WWNhNnNpVldFWUNxQklQd21taEg3cTNwUlV1TW5FcmFXUmVhUjc4RUJUQ2xY?=
 =?utf-8?B?OUF4aFE3TEpjdjFWZVVIUndtZGRHSEFUUngyYzRjcUNWZFd3RnJtajFDNFlu?=
 =?utf-8?B?U3FSSUtlc2pmRDlIYkZaMlFHWWw3bVBRemQ1WUM2WUx1eC9YSjlhalV5cWRQ?=
 =?utf-8?B?dHFGMVJYVVpBbTdPNGV0VnBoL2xXTzlHQ3o4Zlc2ZGI0dXVRTDRlRWtxTElx?=
 =?utf-8?B?ZmhYQjBlYlcwQ3JIWTlCYzJ3SUEvRkJhSEQ0ZHRPanlKVHVtWVdUNzJubkIx?=
 =?utf-8?B?c3ZvUllNTVpJejM4ZzlMb2RIdTdDUTFFK3VzcURqUHJxWXpUTTJTUktGYmJY?=
 =?utf-8?B?VDM1bmZuWWhFRUlmbW5XTTNlQktnSFpvQmNKZ0s2azlWSTZyMW1NbWxSSFBy?=
 =?utf-8?B?T0RMWVNEdmNLWnUrekdsbGREZTJvR1Bsamt3aW9IWUpxcHVyVm54T1gzQWNm?=
 =?utf-8?B?YkhHdm95dmU4bm9vbk1maUxaYUVVa0lxSG9qRlFmMFFZWlZRUkd1U3RkT3c5?=
 =?utf-8?B?TGp5NmlldDJpTGlTL0xUMDBWMGEzREZGNXp1OWxkODArNURKMk9UaWpGZkJQ?=
 =?utf-8?B?MGI3TEs0c0lxekdwdnkxVzJBaFRpQ2FGTUhqUFUwSE9CQlpKTXltbzhqQzM0?=
 =?utf-8?B?YzRZdDVDNGttanVqZGVmakRvN0JWQURqcGgxTXNaN0hOWHE4YkF6OW5tSUpv?=
 =?utf-8?B?WHMya0UwVkFwT1Jtem91YzNXYkZmbnVCamJ6ZXJEN2xtK0NhenV5KzV0V0dG?=
 =?utf-8?B?QkZwc0hPMmFhdEE5WXV3ZmJrUEh6NFBqN0VodDZodXhHTEZ3SURqdFB4Sk0x?=
 =?utf-8?B?cmRxaUo2dUluNEpzL3Z5SE1RbUhocm5uSFNCNmp6bjlRbmF1OXEzUDJFc01l?=
 =?utf-8?B?NC9CdDRneGgzSGNabFRpNUdJSUdRMEJhMCtvTTllNlNNOHN2dTJUemNmSlNu?=
 =?utf-8?B?WHlaSy9vcGg0Z3ZGSFJPYk1HSk1uMHVobjNSZVZmRnV1cnRrWWptdURUdUkw?=
 =?utf-8?B?LzJqMVJYa0lPWWpDMXlQeEs3YUdrM3lkN0JBSkRwUDYyNlNWTlhORXBoTWJY?=
 =?utf-8?B?Y3dGRlBTQ0ZUaGpqSFZIRDFqS1E3N2pScTlDcVp0aUZLTEpPUG1hNE4wU01O?=
 =?utf-8?B?MEN5RmNBTUZIWHBjRG4vN1FWMnJHVGlHZW5rSEpLWkR4QzBUVTM1eGhnWlpB?=
 =?utf-8?Q?g8pNV+NZ2vJVw11V4OMqVL2kB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 693ea9d0-a0be-4f48-a5f7-08de22c23f6c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 14:38:01.9819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfahBj81nA6kDj9p04qPGOLOzFstn+OBm8/QItSTq5JgbFpRQX6lfV/B4fZguxRY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4383
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

On 11/6/25 18:25, Kuehling, Felix wrote:
> 
> On 2025-11-06 12:09, Christian König wrote:
>>
>> On 11/6/25 18:07, Kuehling, Felix wrote:
>>> On 2025-11-06 11:46, Christian König wrote:
>>>> On 11/6/25 17:37, Kuehling, Felix wrote:
>>>>> On 2025-11-06 08:43, Christian König wrote:
>>>>>> On 11/4/25 17:28, Philipp Stanner wrote:
>>>>>>> On Fri, 2025-10-31 at 14:16 +0100, Christian König wrote:
>>>>>>>> Calling dma_fence_is_signaled() here is illegal!
>>>>>>> The series was sent as a v2. But is this still an RFC?
>>>>>> I think when Matthew came up with the XE patches we pretty much agreed that this is the way to go.
>>>>>>
>>>>>>> If not, more detailed commit messages are a desirable thing.
>>>>>> Good point, how about:
>>>>>>
>>>>>> The enable_signaling callback is called with the same irqsave spinlock held than dma_fence_is_signaled() tries to grab. That will 100% reliable deadlock if that happens.
>>>>> I guess we could use dma_fence_is_signaled_locked instead. That said, it only tries to take the lock (in dma_fence_signal) if fence->ops->signal is set, which isn't the case for these fences. That's why this has never caused a problem up till now.
>>>> But when fence->ops->signal isn't set then why are we calling this?
>>> There is no need to enable-signaling (and trigger a preemption), if the eviction fence has already signaled.
>> But when the evicted fence has already been signaled then enable_signaling is not called in the first place:
>>
>>          if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>                  return false;
>>
>>          if (!was_set && fence->ops->enable_signaling) {
>>                  trace_dma_fence_enable_signal(fence);
>>
>>                  if (!fence->ops->enable_signaling(fence)) {
>> ...
>>
>> So the extra check is actually completely superfluous as far as I can see.
> 
> Thanks. I agree.

Can I take that as reviewed-by you for this patch?

Thanks,
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
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Regards,
>>>>>     Felix
>>>>>
>>>>>
>>>>>> Thanks,
>>>>>> Christian.
>>>>>>
>>>>>>> P.
>>>>>>>
>>>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>>>> ---
>>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 6 ------
>>>>>>>>     1 file changed, 6 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>>>>> index 1ef758ac5076..09c919f72b6c 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>>>>> @@ -120,12 +120,6 @@ static bool amdkfd_fence_enable_signaling(struct
>>>>>>>> dma_fence *f)
>>>>>>>>     {
>>>>>>>>         struct amdgpu_amdkfd_fence *fence =
>>>>>>>> to_amdgpu_amdkfd_fence(f);
>>>>>>>>     -    if (!fence)
>>>>>>>> -        return false;
>>>>>>>> -
>>>>>>>> -    if (dma_fence_is_signaled(f))
>>>>>>>> -        return true;
>>>>>>>> -
>>>>>>>>         if (!fence->svm_bo) {
>>>>>>>>             if
>>>>>>>> (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
>>>>>>>>                 return true;
>>

