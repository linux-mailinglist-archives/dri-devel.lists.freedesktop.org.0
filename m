Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041039E2028
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 15:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD4F10EA4A;
	Tue,  3 Dec 2024 14:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b8lBP5ig";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEC610EA44;
 Tue,  3 Dec 2024 14:54:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xp0g67c2rjYUGcLTzBUmKVNeDst8PsKWXNUaYAfyNoKtmujCt9ct7B+2FYDN//imvKHZ0UFG8QB4PCgcwqfuHztiwJ0TNUSfN+nQxG/A5bem4SH6qx7K+DaIjBCnEcakhly2OMUY7BGInOkRu+m439saMm5MoSatyU78M8y779BRp1foZAOzfhY0pZYa/bkhKgI0lq6zXMTUh3rlVpQmB1+sNK+uQI/k0VU7/729RIFQRB2n8yDT52KqbQs5fZpdgSrc7VOHzHcDCm55BkLJT8/2kq4R74EorsqU3Qczd3QxNz+HO+TzzFauaCfX1XpX3B3BaP2IayNh6adZz4Staw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4DAjVwDk3fUkkg8/w3/maHZWAuk5MBrBoovzXDeUZY=;
 b=p9PNEaMSTH4aEFQCComXLf0ahRYPnuWztb1ebTTNVYatpdgl2xnPpx0Dy/tSAyD3GzgPcw4I4lch4JNWx69Wbs4iDE3IZL0TX8uFJscsfqks5gVzPximacEI2hg7oj9NhAVQ9u+4OhRSFeXKFAXcp6YQg+n5kt6zS7cppwIKgHrJdozCNEHe740b/SbyCEtCuPaVOHFtApfhJBZGEO0Akq4l6VtmkWb/ucC4KvNPW+wkxbKyumOOTMdduQfBSAMTlSsURlnCm770O0KbJvmYI/ofLqjTIgCWwhx4Vque8/r0cfaeECnDUX6hcI4IkhQlTSCk1QsqYUd07/BEy3p+6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4DAjVwDk3fUkkg8/w3/maHZWAuk5MBrBoovzXDeUZY=;
 b=b8lBP5igivLuTNGc8Pl2SujRPIpCSAKu2Gy/3xxvT4Nhx1FjX2DXUWWButW42vQnL9t6W1suWERcrRE9s3L9cpzgZJ/iYQQLwb86eBPjVIrGr9jZ/AhxBTLnhLjnbjQjduiOkbL8OWMk7T8qSiphOBizqD7auE2TokjD20f5+CQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6737.namprd12.prod.outlook.com (2603:10b6:510:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 14:54:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 14:54:48 +0000
Message-ID: <01a8faae-6a3f-4328-862f-d18046ed982d@amd.com>
Date: Tue, 3 Dec 2024 15:54:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Make the submission path memory reclaim safe
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tursulin@igalia.com>
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 stable@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tejun Heo <tj@kernel.org>
References: <20241113134838.52608-1-tursulin@igalia.com>
 <2757527.mvXUDI8C0e@natalenko.name>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2757527.mvXUDI8C0e@natalenko.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6737:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e3b87d-0d23-4479-6899-08dd13aa6eac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2VqUjJwa1g3SDY1RmNrbXBNV2xnemZQOUE1amdFZzdFMDdaQUlTUys1OVpM?=
 =?utf-8?B?d1FOb0NzNjBCZUNGTndXTDJPOXF5Y1d1TUl5MDg4cWJjSjFWcEVWL09OL0dY?=
 =?utf-8?B?YmJiQXNMVVMzbkdpeHJxK29uanlsTjJldVllSm05YldZMzBqV2lST3d6MVlW?=
 =?utf-8?B?ZHZvV2JLOWswNkJYQVhKaGpSeXlUUTBVVWs5dHVCS2JJbnB3eFo2N2J0U3Zm?=
 =?utf-8?B?UzIzUmZLd0Z2THdGSGFiWFY5TS9uWnM3eE5Cbng5TzFXK3MwaXRCUkpPYnRW?=
 =?utf-8?B?QUxPSjhaQVJ2d3NWWTdhRlNoM0ZZU28rNlpzYVQ0WCt3YS9maG95SklGYU5o?=
 =?utf-8?B?SDlwa3JJM0tjMlRGT2lyU0JrTzRSK2lOWU1YMDVGbGthSHA2Vk9mZVpiakdB?=
 =?utf-8?B?TDJ6UWM2SDhGaEkzTlVCaEw5bGRVZUhwMUpoSWFIVGh1MzJnanVXYStnMEda?=
 =?utf-8?B?d1d3Nit5K0ZobnhwQ3ZqRnRsdmdnQWRZRG03cUp0TWxnRTFmcWlHd0w0bDcz?=
 =?utf-8?B?T1BEK0J3SXlicmUxbTE3eEV0ZFovTEcxU3krWHIrRFduWnFybExDWVVacTR4?=
 =?utf-8?B?enAxMThkRGFQN1ErSE80cytVKy80bDJ5SnRBYXNhSGw3TktRQXZkejVZa3pa?=
 =?utf-8?B?cXNqTDMyQ0htTFF3eWdaWXU0K0FmVGdmdVd4ZlZqQlVNMXl2ckJyUHB3SDBZ?=
 =?utf-8?B?Znh0UHBJZWQwanpPQ2RmNVU1S1dSVERmMWJUeERYczV5KzJaQ3JETVkzeWZP?=
 =?utf-8?B?amVUSE9GVGZSQjFUcHJiTGU0dlV2aUQ2RDdkUk1yeU5FbS9qUTB1NnRBZURi?=
 =?utf-8?B?V0ZZQkdSUVdPTVF3UGZSREJ3QWxtWExvbGpKV1RzUDRTNUVPbGNtUVJIU21T?=
 =?utf-8?B?NFh5anpwYzNYTGlvZWg0SUo5K3RQK1lzYVdXWEp0dlIwSnJuOWcwdGhZV05n?=
 =?utf-8?B?SEF4WWVvUGhORDlIYVprb0tySmVLNHZ1RklBQmdjQktxNy9PMlpsNDV1K200?=
 =?utf-8?B?SXhpTWt1YUhVcEI5OUhaZ0pITnJ1S3hTdW1Wa01HRmd2ZkptTkZUYkRob2FV?=
 =?utf-8?B?MTR6NVRsQXpKR1BIWmpBN0VMTzliTHU1NGxZU1owM1EycmhFRlpTaHc1dWt5?=
 =?utf-8?B?QmN0QnYreEVqUDlVbVlhUzYzWkFXNzlYdXpSbzFwc2c5ZnVaandHRnBPK1pz?=
 =?utf-8?B?MnBCenRsV2FNQ2U2UjlWSTg1WDV0S0dTeENYZ3duWkh1dGNVSTlNT2c4TUwv?=
 =?utf-8?B?c21QRmlpTWxvenUwSW0yeWoxcHJ3S2xJK2V0UHpCV0w2cTdyRXdXMnFBdjN5?=
 =?utf-8?B?RjJZWHMzbDREbVYzYTNuSnRrc0J6K1NNY3hBV1A4VmY1TDIyc3dCMURvelhD?=
 =?utf-8?B?MUt1eGlQNDdMNDB3VzNNQURrRWt5K1gxQVRTMjhzUVJobEFVTHc4VHpEcm1z?=
 =?utf-8?B?Z3JOVUJYQm8yVThZa2tHQWpvNlF0aXpkYWRqSkp3RHNtKy96c3MvdG11cTV4?=
 =?utf-8?B?cjJYcFRaT3ZwbmlZdHN2K1BVK1BTSXR5ajhvVFZadTR2R3BkZkhxUDJmWTIw?=
 =?utf-8?B?bms4WXozSkl1dkcyUGZrRDFZaDlwUWt5REk4UUF3VlduU1QvUm9ZYkY4Sm5K?=
 =?utf-8?B?Rk15ekY5SFFjZUNsZHZac2pGN3Rvb05zY0o2RzFwSVpwd1dkYkU0VVI4dGxG?=
 =?utf-8?B?cnVOZmpMVWk2akVLNXBEVmE2cjR0VjJBemhOV3VGZ1poZXdMdDFXdTBwNy82?=
 =?utf-8?B?QnV2R2dxTmZhYXhTa2I3SC9jQ1ZSY0lvbTdWdWQ2c3ZabStDKzgrRHp3V0pG?=
 =?utf-8?B?dDZnQXBTcmV6bGVnTUNYQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWZhMWhSeUVrbU5BY2VVdFlVMmZMdWtnY25ZV2U5ekNYWERmVE9UZmIvL3Rx?=
 =?utf-8?B?ZkxpZjBDMmQxcEVOR1U4Zld0cHRLSFJmTU9LT0hwRnFjYWo3MHJmZVZCT1RP?=
 =?utf-8?B?MEZnSVZzQmZZalhuRGFFSUtFS1crTzBnNm9acndldzRJZm9nZE1QQ09BQll6?=
 =?utf-8?B?eEhobjV3bEpZU25jMXJrUmdsUVdOLys0MSswWXlCcExoMk9FSGRTazRXL1VD?=
 =?utf-8?B?aG5qL3N5cjIrd2Y4dTdhRFN4dkdFN3R2RXBkK2dKMElSTm15anJjaDRMN0lE?=
 =?utf-8?B?VlRnSEs5WU9jd0RGamlrOEF5a05GN0JiT25lcnZHZHFTckt6aTM3bmoyQ01Q?=
 =?utf-8?B?K1hvS2pwTm1HLzdvVWVmZGNpOWMrMlI1VzdRQVJ4RWVFSW5QdHBrLy9VdjdO?=
 =?utf-8?B?czhtbjI0SVQrSFlZUjFFRndmc3pxdWtyVXQrdXZ5VzVlUWNmYU84bm94NjVU?=
 =?utf-8?B?VXZxUGlwcUFzQVFkdEQ2ajN3K1Ird1VJaXFsbzBMQmlHTncxdTVtYnE4cUZp?=
 =?utf-8?B?ZjZNQVlVMlE0eWp0SzhTeHlRWkJmSzAyWUROb0VCSEt0bjZ5eTRydVV4Ym9G?=
 =?utf-8?B?V09EK2w4Y2lNMGZiU2JUZGJadXJnQ054czRxQmplbWN3SXF0MDQ3TUFqZkt5?=
 =?utf-8?B?VWw4NVRHVlN3dFhidHZIMzhCcmJ5dExxNTJYcTgvSXp3bUFDQjVibTBrUjVD?=
 =?utf-8?B?b1I3am5IcGVQS25ncURraGxjZHM1dnFLUXNmUDF2STFSRE5CeGFXb0VQd3JL?=
 =?utf-8?B?eEhHNW5vR0UvZmVzenA4Y1Y1dXhUMGZPekRtRmhaVC83UjU0U21GUHlOaXBq?=
 =?utf-8?B?Ky9aSHpSQ041UEt1OTRDa3ZndHo4bjhkRmxoVEdUdFJ6T3lZVTZhTmxnUXI3?=
 =?utf-8?B?ajNXR25Yei9WdFpJRFpLSXA1VG5TaXhxb3VXM0JUTjFkSnZ4NXZ1Qjc5OUNZ?=
 =?utf-8?B?YkpVclpaYWl4aXVrdGNJMFZjWlVuYWIvYXkvMmZ6eTFTOTNGdmpYOFVLOElr?=
 =?utf-8?B?NHhUT0ZSdFA3VjlyaHVOL2U1ZWtEVkM5SVpYekxqMHJGckVnTnNNSG05RExR?=
 =?utf-8?B?MU1raWE4ZS9uNy9uVzUwdit2dmFtNWs4bXl5L29ERUtranRxNVkxMmk4UGdD?=
 =?utf-8?B?ZUYrdTVIekFpZUpqcXZsUkd6QlVVanY2WW5JblNWK3V5TERpbXVORi9FM2lY?=
 =?utf-8?B?RlZMTWhoQzZ6Q0lkUUtGVnpaZjQrZlZJdC81Rm84dE8wR2VhQUNRUWh6bTIr?=
 =?utf-8?B?OWpRazNGUUs2a3R4LzFBVDhjMUg4MkhGRTJDNUIzdlRlVEZGKzU1RFFvamxJ?=
 =?utf-8?B?UU1FMWY4WU9ta2hMNlFXMWdGbXNuMEFhSFdUa2FHdHZIamVWODVUa0Jyclp1?=
 =?utf-8?B?WjJTK0xSL2Exb0QyckNndlBLNDFhT1g5N0pYYnRTSy93REpZZ2toTXpISEpz?=
 =?utf-8?B?ZUV2b2lVUWVRZDhId2kxQTJ1MVVpNGx2c0hUTVNabk9MUmYwdmRMVS9ET1Vt?=
 =?utf-8?B?QlluQ0ZKMjliL0ZRZ2Q2dVFybWlxK0lQSTdoRUdLRE02c1duYjdhUEdxWjJv?=
 =?utf-8?B?aGxSM3FSUnB1SEFyN2dPZVowajcwT2JiQzRINWx0c1ZqYWI5blZkd2MzNjY0?=
 =?utf-8?B?d2VyNDdZbzdESytJcXY4VlNueUNwSkVjalVJK2FmWHdETTBwdmVzM25wd0NU?=
 =?utf-8?B?cTJIQkliVzBWUlpDWkYxa2R5VWZjbWM1b1FCWE1ndjM0d2FMeThuQ1laREYr?=
 =?utf-8?B?RHN4UXBsUGZTVFNaUUxOYmJDanVZRCtRSTFVTGY1YzA2NGQ2YlhXOHNaSThM?=
 =?utf-8?B?VjdFbXF0TGVsS0pOMGFCUFhEVVJNVGdLTEN6VnJ0RTJ0b2c3VjYreVpqa012?=
 =?utf-8?B?RGJkdGlaVEk3WG82QmFISUMrSWdZZ0o1RTBWMWFWYXR3cC9vUWpXcnVVQ21S?=
 =?utf-8?B?RW5mSVdwZTdCM3hILytJQmFTaXQzK3NXVVlxOUdGZldxRUFFUm56dmVDSlp4?=
 =?utf-8?B?cDE3bU5tU1d3Rm1sS00vY1FCNmo2MWs0ZkN4TkRQQ2htMkpaekNoRVhYR0Za?=
 =?utf-8?B?VVczKy9yRjQwQkU2Z0FMNnNnN0VFV1l1NXBqcVNzclVUV0UxT0VOaDcwb1BR?=
 =?utf-8?Q?G6edJd9kC6hRVxB5viow7j2Gx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e3b87d-0d23-4479-6899-08dd13aa6eac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 14:54:48.1235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qT2Q/EdiCllQ8umhbCkeZYH9ygBYv/nmjq4IAcQZc/nUm7EfOlxjkSEdeIvdMwPJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6737
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

Am 03.12.24 um 15:24 schrieb Oleksandr Natalenko:
> On středa 13. listopadu 2024 14:48:38, středoevropský standardní čas Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> As commit 746ae46c1113 ("drm/sched: Mark scheduler work queues with WQ_MEM_RECLAIM")
>> points out, ever since
>> a6149f039369 ("drm/sched: Convert drm scheduler to use a work queue rather than kthread"),
>> any workqueue flushing done from the job submission path must only
>> involve memory reclaim safe workqueues to be safe against reclaim
>> deadlocks.
>>
>> This is also pointed out by workqueue sanity checks:
>>
>>   [ ] workqueue: WQ_MEM_RECLAIM sdma0:drm_sched_run_job_work [gpu_sched] is flushing !WQ_MEM_RECLAIM events:amdgpu_device_delay_enable_gfx_off [amdgpu]
>> ...
>>   [ ] Workqueue: sdma0 drm_sched_run_job_work [gpu_sched]
>> ...
>>   [ ] Call Trace:
>>   [ ]  <TASK>
>> ...
>>   [ ]  ? check_flush_dependency+0xf5/0x110
>> ...
>>   [ ]  cancel_delayed_work_sync+0x6e/0x80
>>   [ ]  amdgpu_gfx_off_ctrl+0xab/0x140 [amdgpu]
>>   [ ]  amdgpu_ring_alloc+0x40/0x50 [amdgpu]
>>   [ ]  amdgpu_ib_schedule+0xf4/0x810 [amdgpu]
>>   [ ]  ? drm_sched_run_job_work+0x22c/0x430 [gpu_sched]
>>   [ ]  amdgpu_job_run+0xaa/0x1f0 [amdgpu]
>>   [ ]  drm_sched_run_job_work+0x257/0x430 [gpu_sched]
>>   [ ]  process_one_work+0x217/0x720
>> ...
>>   [ ]  </TASK>
>>
>> Fix this by creating a memory reclaim safe driver workqueue and make the
>> submission path use it.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> References: 746ae46c1113 ("drm/sched: Mark scheduler work queues with WQ_MEM_RECLAIM")
>> Fixes: a6149f039369 ("drm/sched: Convert drm scheduler to use a work queue rather than kthread")
>> Cc: stable@vger.kernel.org
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  2 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 25 +++++++++++++++++++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c |  5 +++--
>>   3 files changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index 7645e498faa4..a6aad687537e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -268,6 +268,8 @@ extern int amdgpu_agp;
>>   
>>   extern int amdgpu_wbrf;
>>   
>> +extern struct workqueue_struct *amdgpu_reclaim_wq;
>> +
>>   #define AMDGPU_VM_MAX_NUM_CTX			4096
>>   #define AMDGPU_SG_THRESHOLD			(256*1024*1024)
>>   #define AMDGPU_WAIT_IDLE_TIMEOUT_IN_MS	        3000
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 38686203bea6..f5b7172e8042 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -255,6 +255,8 @@ struct amdgpu_watchdog_timer amdgpu_watchdog_timer = {
>>   	.period = 0x0, /* default to 0x0 (timeout disable) */
>>   };
>>   
>> +struct workqueue_struct *amdgpu_reclaim_wq;
>> +
>>   /**
>>    * DOC: vramlimit (int)
>>    * Restrict the total amount of VRAM in MiB for testing.  The default is 0 (Use full VRAM).
>> @@ -2971,6 +2973,21 @@ static struct pci_driver amdgpu_kms_pci_driver = {
>>   	.dev_groups = amdgpu_sysfs_groups,
>>   };
>>   
>> +static int amdgpu_wq_init(void)
>> +{
>> +	amdgpu_reclaim_wq =
>> +		alloc_workqueue("amdgpu-reclaim", WQ_MEM_RECLAIM, 0);
>> +	if (!amdgpu_reclaim_wq)
>> +		return -ENOMEM;
>> +
>> +	return 0;
>> +}
>> +
>> +static void amdgpu_wq_fini(void)
>> +{
>> +	destroy_workqueue(amdgpu_reclaim_wq);
>> +}
>> +
>>   static int __init amdgpu_init(void)
>>   {
>>   	int r;
>> @@ -2978,6 +2995,10 @@ static int __init amdgpu_init(void)
>>   	if (drm_firmware_drivers_only())
>>   		return -EINVAL;
>>   
>> +	r = amdgpu_wq_init();
>> +	if (r)
>> +		goto error_wq;
>> +
>>   	r = amdgpu_sync_init();
>>   	if (r)
>>   		goto error_sync;
>> @@ -3006,6 +3027,9 @@ static int __init amdgpu_init(void)
>>   	amdgpu_sync_fini();
>>   
>>   error_sync:
>> +	amdgpu_wq_fini();
>> +
>> +error_wq:
>>   	return r;
>>   }
>>   
>> @@ -3017,6 +3041,7 @@ static void __exit amdgpu_exit(void)
>>   	amdgpu_acpi_release();
>>   	amdgpu_sync_fini();
>>   	amdgpu_fence_slab_fini();
>> +	amdgpu_wq_fini();
>>   	mmu_notifier_synchronize();
>>   	amdgpu_xcp_drv_release();
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> index 2f3f09dfb1fd..f8fd71d9382f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> @@ -790,8 +790,9 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
>>   						AMD_IP_BLOCK_TYPE_GFX, true))
>>   					adev->gfx.gfx_off_state = true;
>>   			} else {
>> -				schedule_delayed_work(&adev->gfx.gfx_off_delay_work,
>> -					      delay);
>> +				queue_delayed_work(amdgpu_reclaim_wq,
>> +						   &adev->gfx.gfx_off_delay_work,
>> +						   delay);
>>   			}
>>   		}
>>   	} else {
> I can confirm this fixed the warning for me.
>
> Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>
>
> What's the fate of this submission?

It turned out that the warning is actually a false negative.

E.g. the warning shouldn't be printed in the first place.

Tvrtko pinged the relevant maintainer, but for far I haven't seen a reply.

Regards,
Christian.

>
> Thank you.
>

