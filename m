Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2367B9C55C3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 12:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF0310E0F3;
	Tue, 12 Nov 2024 11:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wf1TARjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B091010E0F3;
 Tue, 12 Nov 2024 11:10:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxTJHp8LnEqi7EYij1Hwfxrma5dNmxQd1fqIxhTk1B0MQzAPgZoqFBUa55QNDlUFmMdWTiH/rliN0zlQ3mIdPok0KL05Ug86F8IQVuA1BV5Hr5uJ8BrWMlvluUKmB/gdR9p+z/c5O+97yKQZlo+e2jbmmMM/s0iDmv8Hrr3gdABxLdgPGPuCYreRt17YdXmEG0TX2MGOuNYyZhYI6AU/8YZ+xrfx5yPTni1mcejgWALmERQ1mLadUV5H4sNufz7kZNb4bQ7UuoUBWzPrJ2tN/ebBW8vzqswEqTuEJW4q/yY1xKR3B4kF9VX+rCP3l9y5upg0SCyFNzjyBKwggtAZtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFAaCKwzdXrCDRL4IEWhqExzvkSWbG3UkfYSQb180wQ=;
 b=nCxB3KCd1cyIUv7/KD26PmarB8HFMjmo/KnwhOV5mA2GGusPwmoZl2Fd4K6x03vbfJmUdNZKAxHuVQCT2YIFQAbvStYexZXh2YSnRSu2FhrLVu5a77H0MkLVMfNsL4tiFxawUhAHEvpVOnTYbSKtdDmDojPqECYnsp0R+kD6CSWHkQTW+dsEhezkPP1hcBX+hUPShWYAHRemxZ5QssjwIMdK1iy37dQc1LzsyIzKuF6n9NHeAB6lULB0+tjqz6dWahfxyfY74L1SdZ7PwzfC1BHtcgYl5UxcT6JJT98GR8T1UwwR0/w4oV+5hogjsRN6YScykxPTiTh+Y+eeb8UoYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFAaCKwzdXrCDRL4IEWhqExzvkSWbG3UkfYSQb180wQ=;
 b=wf1TARjsdPUJIzDsKDoqtSi/m8roynflRsSFEznN2wpyHec7rt2m6LdnpneTINbD3c4kcnmnzcFN/cHU6f7QzJKHhcLc/At3srEUNMoBrac+NOeSgI8Ph/w5HlQoXyFX9SQKBv2lfjrvlht5F2tTEjSByLzYfZskB9m6DKCsmN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV3PR12MB9167.namprd12.prod.outlook.com (2603:10b6:408:196::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 11:10:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 11:09:59 +0000
Message-ID: <0dcd54bc-a1e0-41cc-915f-917f1dbf5729@amd.com>
Date: Tue, 12 Nov 2024 12:09:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] Common preempt fences and semantics
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 simona.vetter@ffwll.ch, thomas.hellstrom@linux.intel.com,
 pstanner@redhat.com, boris.brezillon@collabora.com, airlied@gmail.com,
 ltuikov89@gmail.com, dakr@kernel.org, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
References: <20241109172942.482630-1-matthew.brost@intel.com>
 <2d634baa-89cc-4b83-a4c4-4d2ca6a4f2b7@amd.com>
 <ZzLLq3IKLnOGSea/@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZzLLq3IKLnOGSea/@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::16)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV3PR12MB9167:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dc3bdb0-0ad4-487c-df8f-08dd030a8c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlJ3dEVlMFlyU0FmTFB0dmdHM29GdW8zMFdFRUUrS09iWld6OWRFZjN4eHZY?=
 =?utf-8?B?UTQxREtmcDNTd2plTGtPeEd3bk5hWmJzYVJuU0pTaDNhb2ZLTjJKWXdTekdB?=
 =?utf-8?B?a3VjUGgwOHJVa0hUMHkrWFRwTURGQTFPd0xZTUQzQTY0NVFiYlRtSzZTekJw?=
 =?utf-8?B?S3d3d0k3REw0ZmJvenU3NWo1dC9qVlJRY285Zm93bjF6VXd2dnBYakgza0lv?=
 =?utf-8?B?NnRYbXR0NEZkMnBEelRXNkRUWTNZZkYwY0xFNkJwNUlybTdNYjlrTVp1UlpB?=
 =?utf-8?B?MjVZTjd3dWN3MjdDMWtJVTAvWHJQak5idnhuZStSZ1A4ZFA4L1ZncGlVSFBH?=
 =?utf-8?B?VEtPcWJhNldJUDZCcDlDeGZBUTNCU3NYamw3dTl2ZkJFSjZCY2czUVY0Q2xr?=
 =?utf-8?B?eFA5N2J6VXlaMzdIbFBKWUtVMndocjZvcE9UMDlTMEZlMkxHTkZxSVdDUjMy?=
 =?utf-8?B?KzRqdVJVdVpQTG94SGJZY3NsZmdEaFY4ZVpFMk9tc1lKMGpra3E3TGxRSkVJ?=
 =?utf-8?B?UFRtRXFycGc2TkZXOTFXUU9QdG9jV2M1Qk1qaXR3RTJTSTN3YkhGMnlsT3Q3?=
 =?utf-8?B?UG5KOEtXRVNjWVpSWUpkWnhqREVldHJ0VjBTZldBUjJYSjN6TXB5aDNwV3RK?=
 =?utf-8?B?L0oydWkyY3hBcm8vbDBzV2VIUmJlczN0aFlKYmFBV09pdzV2ckZUeHN2aXly?=
 =?utf-8?B?MzhXZHhHVU9jaytpYzNmQnljVUJFdHp4MVVFMXAydDFaZWh1N0NyTm02UUpJ?=
 =?utf-8?B?RTd5SjJNYjU2b3ZpTm1wR3BVakowM1VaTUxjZ1NwUTI2UktSeXZ2NnA3d1Vm?=
 =?utf-8?B?aWM1cEJ2ajI3TXZZQlE3RXoyWUR5WGVpcDdaZy95dHBPeEhiMTJ6NlJHQ3Ez?=
 =?utf-8?B?UGtDZWMzREp3NXlnQUJBVVZGUjlMZUtMaDVMd0Z5RndhVkMxRFJQcVAvN1Nt?=
 =?utf-8?B?WjVCNEwyUUJMZ01Tckp3ZWVnbGdhdytHYUxOMFVuUDR3K3FLRllveTNqaGhD?=
 =?utf-8?B?TXF4QmdmL29FeXFKL2xuaU1MVktKeGpnU2FMQW9IejRVOXhER3JhRXdnZExM?=
 =?utf-8?B?R2NUNjAwWlVjV2I0d3I3TFJ4SUdYSW5iRDluSUhRSzNlVVYreHVpTnBJV0VQ?=
 =?utf-8?B?UHFFV3dKK1B6cnNqck53a3hleHNvS2RzTVNTUm1ZUEtSQXVlK3lKZlhQbmlW?=
 =?utf-8?B?d1QyNHYyWDBqU3MvemlUb1NsWWVwMm9aeTNpMXJVWkF2aXF6bWhGRExlT2R3?=
 =?utf-8?B?eEpkc25Uek1Nc0ZKSTMrUzhDakhvRTRnNy83ZGd5N0JhbjlUOTEwT2MxQTlH?=
 =?utf-8?B?L21pYjVVVU02Q2g1OXBSSkZQbFVOUlRrZFp1U3ZiaklBUjNhMy9RakdIMHU4?=
 =?utf-8?B?cHd5eGNNQlNrOEl4YXp0RmRsenp2Rzk5VmJCMFlxNnNxeGZjSmlONEV4MjJH?=
 =?utf-8?B?YXNzYnJDKzROR3pvdlNYVFBkU2FaK3B6MWpZbFRlTzgrZTVxTjVGSTM1SDRM?=
 =?utf-8?B?NXhqL1F3dEI4ejlKREdyemliUk1qaXFLUzJDWGpMK3grazc4TU1sQjRrU2JY?=
 =?utf-8?B?N2c4Q0xRdTYralpOTEtLdE9WaVgzbzE3MzVBdXdIRzdta0sraDE0dXBDc045?=
 =?utf-8?B?MW9JV2htdnNtSHhlLzY4ZTU5akpWc3pCUWZMaUZaM3crZTQyYWppa0NGalc3?=
 =?utf-8?B?Y1NDazhNdkNnV3V5ZXVzOURmWlp1VG5YZ3hKVngreUQ4R1QwNmN0OTR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXlrWXpqZEwyMkFLSHhjOWo5U2plMmtWNVV4c2xscHYvRDJIVkoxT3NaN1Mw?=
 =?utf-8?B?eU92TlVTS1BjcEpkbUd4WXdrMHdlcE01RHJHc2p1VG93OGtETmVab1B6ZTNi?=
 =?utf-8?B?ZlJVNi9pVjU0b3BsTlhxMkxtdjQyeEFlRWgreTgyM2JwcmRWQ1EvZEZYMTdD?=
 =?utf-8?B?eWY4Q0wxOHl0TWZDRlJIK2FMUmo1VlJSckJHZ25tSXVlbjB3Mm9CSlhreU1w?=
 =?utf-8?B?SGY1NTRmWEdzd3dTNHl5QUVydzc5M3dwa2drT1ZTY1lZc0xqTm9hbVFuMkNm?=
 =?utf-8?B?aGQ5ekYyQTNRYlNyUkxiZWVWenF1aGVYVUxBcDNuWVZ3MVNpWkxOZW1NMXZ6?=
 =?utf-8?B?MTE5Vm85RlprakczdUl0RzdlVWI0WXNCUHcwc3FEdU9kQUIvRE9OK0p5ajhU?=
 =?utf-8?B?SlBJUVVOZlpaUmwrbWpRQ3E1aXJQbE4zUzR0Nm9uN0JjeXBOb21RbDFxR1B3?=
 =?utf-8?B?OXBNV1hKbXBEOW1FU3NqSVJYbkJ2UnB2VmhPSkQ0dUlrWTdaaHlFOWhNdFZF?=
 =?utf-8?B?NHFLRjNaNlRkSnJGZ1VaZlBDaEhUcFlVVzREZUJwK1dESUxIUmxqQmtMNlJx?=
 =?utf-8?B?MGN1eW9GaXVpdG1HNE5mZXBsRndvK2dqWm1MNVdxOE1aMUd4M0lJcmxmTjNx?=
 =?utf-8?B?eGMvZXZsbVRlUjNJRkx0SEc5dmpHelEySnJ4aVc2K0o2WnpDdW9XRU01SEU3?=
 =?utf-8?B?MGtqZkNpclFDc29ZbGpMUVhzNGtlY3h4UnMranFrMWx6K0c2SE4vbkpWM2Vn?=
 =?utf-8?B?OGFzUUdCd092ajBXL1lzZ2JKczR6T2lITk95d1B6LzRiUWREY1BIMUV1U3Vs?=
 =?utf-8?B?OGxsb1NCZ0hyQ3NtOHhjSzJ5SzBHK0FWb3ZMWW13V0o4VWM0MmthUDJZeDJa?=
 =?utf-8?B?T0U0aXErUU1xeEE5ZHBsekhFMVlQZzk0a2tOTm9sN0pzb2dJWkVmdmlhZEh4?=
 =?utf-8?B?dGJ6eVp5R20zRSt2ek1jcFRmNDJqUnI1eHJhSHBsSnc5ZkRRV0p0cmhIa1ph?=
 =?utf-8?B?d0tpQXNTZ2toWE1IdVR4czVLdC8yZGtCUU5mZzJnSXhyM3JCcUhhNGxaRFlS?=
 =?utf-8?B?Zk9ybzZGYVliVFQvUkRwWGk1dlc2cVB3NWZraExZdFpDK0x6KzlNcGIxL0g3?=
 =?utf-8?B?a3pUWkZOb3FGeFhVT2NXVktMemdPZ21UYVk3N0JZZ3FoSTFDcUw5Mk1LTURu?=
 =?utf-8?B?MmpicDRFT2hrK3RJQjgzTVFma2VldlpuUTZ0SExRWDJkT01ieW92ZG92RVNa?=
 =?utf-8?B?bEM2SHdRM0NyK1doZHZKQjVtRmxFNnA2M3FKc1lpR0ZsRkhrZlBNdmYzWE0w?=
 =?utf-8?B?L0c3TTZ6OUhSNWx1QzZ3T0l6Y29tcmYyUUNRVk8zVlhqQzh2bE53S0dLd3ZD?=
 =?utf-8?B?eXl4UzhnNmx0L1dYV0xuZGxMOERKeHNwOHRRYnpNbDNrQVpnckhHM3dLM0Vl?=
 =?utf-8?B?UXlSaklGMUhWSWx0S2laMmdDYUpXUGJ0QzdUSW5qSHoyejRHcS9DK3lnZEZH?=
 =?utf-8?B?c1FFVG5HWGc0RU1zMWFNb2FzQ1Bsa2lUT3B5RzZsRUZRUWFVYW1ReU9pbFk1?=
 =?utf-8?B?bVNRUDhEbnQ2alJxa3l3a2JjWXRwWjgxcjRiemxHOUVZOUp6anptWjBKTzZG?=
 =?utf-8?B?MUppWjl6MnJqRVpEM2IvUGx0Y1dBOExxR1FNMHNxdUt1a0FPT085MEFRQ3hv?=
 =?utf-8?B?Q3ByTFVaZ1ZaYnN0NWN2UUg5THBjYWRKcHlFN1hpMmhneW9hbldIbTZiaEs4?=
 =?utf-8?B?eDUrd2gvMjA0OU8yTi92OGo1dENJYTc3TFN1bmN3WloxWVJxZ1RFV21CdCt2?=
 =?utf-8?B?TElIbFFseFZzM2hwMmp3NHdydVBwR3RVRlc4amJQbjEydW8yUzNtNW9rNDJm?=
 =?utf-8?B?OVRsOTJRNzl4MjJxTU9EYlM5UHQzRis4S0l0QVpoYnhveUJmTjNFZUZEWHpz?=
 =?utf-8?B?bnV4VGtrSnI3WFdSbVE2ZjNFcTZnNzVtOWRUaEsvdWdEa1pRUDE1aGdHSDVL?=
 =?utf-8?B?MzlHckZ3N2cyTjU4K01PVDJwdHk3TnIvSnoxT3FuY1VlandlSkt3WE1HdVVn?=
 =?utf-8?B?VldEQ21EaDY0dW5pbkQ0RHMwc3BKVHZTWStiVkRhUHVwZkd4dHhqcUVMeXRD?=
 =?utf-8?Q?mGiEpyxZuNccStQp43B7o/I+R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc3bdb0-0ad4-487c-df8f-08dd030a8c59
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 11:09:59.8124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90sT/t21pzQJk+wj0YT/EPsgi0feUMBi7cKXXtW7PfPAN+zxOi0X1n6UvRlT1Oq5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9167
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

Am 12.11.24 um 04:29 schrieb Matthew Brost:
> On Mon, Nov 11, 2024 at 02:42:02PM +0100, Christian König wrote:
>> Am 09.11.24 um 18:29 schrieb Matthew Brost:
>>> The motivation for this series comes from pending UMD submission work by
>>> AMD [1], ARM [3], and the Xe team, who are also beginning to look at
>>> this. Sima has suggested [4] some common driver preemptive fences and
>>> semantics, which we all agree on. This is the first attempt to implement
>>> them, based on Xe's existing long-running preemptive fences.
>>>
>>> The semantics are fairly simple: preemptive fences attached to a
>>> dma-resv must wait to enable signaling (and thus preempt device
>>> execution) until all fences in other slots have been signaled. These
>>> semantics are necessary to avoid deadlocks when preempting a device
>>> while a user submission is pending, and resuming device execution
>>> depends on the user submission completing. The semantics align with
>>> Christian's view [5], which I also arrived at independently (with a
>>> little help from Sima).
>> Ah! I was really wondering for a moment why you wanted to add a separate
>> dma_resv usage for that. But I strongly think that this approach won't work.
>>
>> The assumption that completion fences which depend on a preemption fence are
>> always part of the same dma_resv object is most likely false in some cases.
>>
>> At least for the AMD design what can easily happen is that we put a
>> completion fence only into a drm_syncobj for explicit synchronization and
>> then engines or different devices which still use kernel submissions depend
>> on it. That can go boom really trivially.
>>
>> What we do instead is to wait for the latest issued completion fence while
>> holding a mutex to prevent creating new ones before stopping the threads and
> wrt to a mutex...
>
> A current code reference would be nice. I looked some of the code on
> list and dma-fencing rules are broken...
>
> e.g., This patch [1], takes 'uq_mgr->userq_mutex' in the dma fencing path.
> This patch [2], takes 'uq_mgr->userq_mutex' and then dma-resv lock /
> allocates memory. That is clearly not allowed.

No that is unproblematic. The dma_resv is only locked after the 
preemption fence is already signaled.

The problem is currently that we have separated the signaling worker 
from the resume worker. E.g. the mutex is dropped in between.

>
> Perhaps this is fixed in your current code base though.
>
> [1] https://patchwork.freedesktop.org/patch/593210/?series=133345&rev=1
> [2] https://patchwork.freedesktop.org/patch/593211/?series=133345&rev=1
>
>> signaling the preemption fence.
>>
> Right, that works and is functionally equivalent to the intended purpose
> here.
>
> I left out a key detail: when a user fence is converted into a dma-fence
> and exported in a syncobj or syncfile, it must also be installed in all
> of the VM's dma-resv bookkeeping slots (i.e., in VM's dma-resv and all
> extobj dma-resv mapped in the VM).

I don't think that this is something we should do.

> Before exporting a dma-fence, the VM must be validated + resumed, and
> you must hold all dma-resv locks, so the above is trivial.

Hui? Why should we hold all the dma-resv locks for that?

We only hold the userq_mutex to make sure that no user fence is created 
while we are in the signaling path of the eviction fence.

> If you're using gpuvm, just call drm_gpuvm_resv_add_fence. I assume AMD has a
> similarly simple call.

Nope, we try to avoid locking all BOs in the VM as hard as we can.

> Now the ordering works inherently in dma-resv and the scheduler. e.g. No
> need to track the last completion fences explictly in preempt fences.

I really don't think that this is a good approach. Explicitly keeping 
the last completion fence in the pre-emption fence is basically a must 
have as far as I can see.

The approach you take here looks like a really ugly hack to me.

Regards,
Christian.

>
> I'm pretty sure if converted your code this solution it would work,
> there are however a couple of bugs in this post which I have fixed.
>
> This is a common solution based on existing components which I'd lean
> towards rather than some new component.
>
> Matt
>
>> That code could of course be made some driver independent component.
>>
>> Regards,
>> Christian.
>>
>>> Implemented via the new dma-resv slot DMA_RESV_USAGE_PREEMPT, a common
>>> embedded base preemptive fence class with driver operations, and updates
>>> to the scheduler to adhere to these semantics.
>>>
>>> The current Xe long-running preemptive fences have been converted to the
>>> new common code, and UMD submission is expected to follow (hopefully)
>>> shortly thereafter in a subsequent series.
>>>
>>> Not intended to be presented as the final solution, but rather to
>>> kickstart serious discussions on this topic.
>>>
>>> Matt
>>>
>>> [1] https://patchwork.freedesktop.org/series/113675/
>>> [2] https://patchwork.freedesktop.org/series/114385/
>>> [3] https://patchwork.freedesktop.org/series/137924/
>>> [4] https://patchwork.kernel.org/project/dri-devel/cover/20240828172605.19176-1-mihail.atanassov@arm.com/#26011577
>>> [5] https://patchwork.kernel.org/project/dri-devel/cover/20240828172605.19176-1-mihail.atanassov@arm.com/#26011853
>>>
>>> Matthew Brost (6):
>>>     dma-resv: Add DMA_RESV_USAGE_PREEMPT
>>>     drm/sched: Teach scheduler about DMA_RESV_USAGE_PREEMPT
>>>     dma-fence: Add dma_fence_preempt base class
>>>     drm/sched: Teach scheduler about dma_fence_prempt type
>>>     drm/xe: Use DMA_RESV_USAGE_PREEMPT for preempt fences
>>>     drm/xe: Use dma_fence_preempt base class
>>>
>>>    drivers/dma-buf/Makefile                    |   2 +-
>>>    drivers/dma-buf/dma-fence-preempt.c         | 102 ++++++++++++++++++++
>>>    drivers/dma-buf/dma-resv.c                  |  43 ++++++---
>>>    drivers/dma-buf/st-dma-resv.c               |   2 +-
>>>    drivers/gpu/drm/scheduler/sched_entity.c    |  29 +++++-
>>>    drivers/gpu/drm/scheduler/sched_main.c      |  50 +++++++---
>>>    drivers/gpu/drm/xe/xe_bo.c                  |  22 +----
>>>    drivers/gpu/drm/xe/xe_guc_submit.c          |   3 +
>>>    drivers/gpu/drm/xe/xe_hw_engine_group.c     |   4 +-
>>>    drivers/gpu/drm/xe/xe_migrate.c             |   4 +-
>>>    drivers/gpu/drm/xe/xe_preempt_fence.c       |  81 +++++-----------
>>>    drivers/gpu/drm/xe/xe_preempt_fence.h       |   2 +-
>>>    drivers/gpu/drm/xe/xe_preempt_fence_types.h |  11 +--
>>>    drivers/gpu/drm/xe/xe_pt.c                  |  12 +--
>>>    drivers/gpu/drm/xe/xe_vm.c                  |  22 +----
>>>    include/drm/gpu_scheduler.h                 |  15 +++
>>>    include/linux/dma-fence-preempt.h           |  54 +++++++++++
>>>    include/linux/dma-fence.h                   |   1 +
>>>    include/linux/dma-resv.h                    |  24 +++--
>>>    19 files changed, 326 insertions(+), 157 deletions(-)
>>>    create mode 100644 drivers/dma-buf/dma-fence-preempt.c
>>>    create mode 100644 include/linux/dma-fence-preempt.h
>>>

