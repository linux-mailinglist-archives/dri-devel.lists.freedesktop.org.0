Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D626FB03F3F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 15:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED52510E08F;
	Mon, 14 Jul 2025 13:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4Q1nh1k9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4697710E08F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 13:08:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMxsMWYqXJSrnzw/gdbiludzfkW2YD30APi/TnONXws10Op/voyEwi4weCBfxKgXpqc9gVLmTbtUrLxyrvv12ALhQ4SyN6cUF9ghcV4M31OZ9vhN4yuO0t9Rfh9UhoC4xoC4AUCnC1xpmByUQO4dsW6b8s0KO1UpmtBUVO6mUbw+lJiMspnuyIQXnX4oOJ7BixNFBLYKgzO/NnAtw7WyaVojfup+O3iWawt1n0ppVleZpgd8SMkSRb10xj4H8SGyuCt0a8i0z0EUkRgc8lOImAoySRdTgniM3vYMOEki62B4Q+N6tda3Wa6AX+cTE1Nlbjb4fC94921P5N5t2EeoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6m/hc9zQurBDXW1aqq2WY1Bh47aDv/WQCaxvgVQpvx0=;
 b=XkE4NZNHMaPpgT1DFZsXwDIjjsl5Mt7mlcsGvz/pow1RKFfIPsqY/T7IO0HeQS1r4GrxhP7hiIwcsNiCKXwSV5KvsbDCN0ZecJSa6pivr9BkutehpPM4tI9b4PGipOKVyKKGx3TjKv/EpEY82L5g4LxxZ0tOsp94uqgmBCI75bE756w3DNL/6UdcQolNfzJqAJCffqI2b+I7tr280D2j+tm+aAEkCzBrN4B/qk/Kaisx4qGZA2/rryyF9GZGTQl0aKhETXFn10UxMtlDfdVdUC+yRNFSfy8JyThEhG/pZZ2KoqY/Q1xAx6ZZOumKIf8id4poGilH3WkOekLZtbe6Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6m/hc9zQurBDXW1aqq2WY1Bh47aDv/WQCaxvgVQpvx0=;
 b=4Q1nh1k9B4NK9gA0/MFko9p+lIlmrdfPiILDxMnNzukfuox109bYEf4ymmBNm2RrH2D8BUak4DBRtXNOJj7TBHRYn9s0PmYtYcZrH03+CR3FOgqK9q3DJI3+sBIi40000s6t464EnB/o8CmHuYhmSA+60C8ERuvUz0zC2UZDWNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9642.namprd12.prod.outlook.com (2603:10b6:408:295::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Mon, 14 Jul
 2025 13:08:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Mon, 14 Jul 2025
 13:08:17 +0000
Message-ID: <a8e473bd-6ea8-41e0-b5b2-10c420e5a935@amd.com>
Date: Mon, 14 Jul 2025 15:08:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when killing app with
 dependent jobs
To: phasta@kernel.org, "Lin.Cao" <lincao12@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: zhenguo.yin@amd.com, Emily.Deng@amd.com, dakr@kernel.org,
 matthew.brost@intel.com
References: <20250714062349.588235-1-lincao12@amd.com>
 <87d61f5b7809828a55caf779b10a90be802fe83a.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <87d61f5b7809828a55caf779b10a90be802fe83a.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0363.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f99be1-e8ca-4d65-03bd-08ddc2d77fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnEyZU0waDMrbnk5VkFaZE0wZ2IrdDZ1M0RLcGpaNVdVbFBPVU9IZEl0QkZD?=
 =?utf-8?B?Um5kQmlXTkdPb1hoVG5lN2U3MUtKWTJ6QnVCdW96dnpHYzljbDBiK0xwSGlE?=
 =?utf-8?B?YlJuSzc2YkhwbFpkM252dXhEU2ZNbEFCeTM5MkswWm5LekNzVGQ1MVppRE1x?=
 =?utf-8?B?S2NPcmxFTU45Sk9iNTJjL05zbFIxeWNmOFpqRHU0NUV6QmczbDZON2FxTGF3?=
 =?utf-8?B?RGM1Uld5NTNBTXhsWlZ2djBkalA3V0FmdWRNT2U4c3ZqalJmWlpRbXFza2pt?=
 =?utf-8?B?Y2tvbGVLM1FnRTU1U3c0V2ZpVExDd1RkaGdZbm5OclhMdHl5RXhqSnNIaXFD?=
 =?utf-8?B?TlhHS1RJVWc5Qk1hQ0E3OUwwQ1FCQ3Y4bThhRGQvZlEzSmZVSG56cEhYVTk4?=
 =?utf-8?B?U1BPdUR4ZVVZeUtKM0VVMnNRSm96RmVxOHB4bEdpcUtpNzlZNzI4dmozMmhI?=
 =?utf-8?B?Z1ZSSzlHemhZTnJuNTdCQTJLS1huQ1hIZEVSNzZ2MWRlWS9GL2RNQTZEV2Y5?=
 =?utf-8?B?bmowU0t3S0Zzb1BmMyt1TE5jRWNYN1FlcEZ0MWtaZFl5QkJodzE5ZndzVEJa?=
 =?utf-8?B?ajRjNFJZYWVDK3NibDhGaEFlaGQ4eWpjYlk4SWlVTUJ1V0ZvNDFCRE5OL1p1?=
 =?utf-8?B?anBOTndOSmpPYVlIc1JyNktmRGJJYWppd0I3NmplM0dLV2lDNWlYRDlSNHN0?=
 =?utf-8?B?MVE5ZnFxUGszMnlmZkxrKy9mRkljckZJV1VPYlRLRjl4RW1tK2VCUUZHMWlj?=
 =?utf-8?B?SDFaM3RXVmR4T0x0ZFhjYVBKaXdlcjBUT2dTSElkak1jOHZScUN5WFJkaWVZ?=
 =?utf-8?B?TnFnSFA1c1pEUXE5S1NXTFd6NHFsc09Kd0pXWUQ2cXNxVTJYRW9HZFI3ZVZx?=
 =?utf-8?B?TVBTdm5XUFRKYzJBc0kvL2hZcnB3VjJnV2hacEtxaUEzald5V0NjSFZ3UnlX?=
 =?utf-8?B?OGhJdTVPV3BucTFzKytVWGw4TGZ1Y3lrZTBJc1BKcXJESzNkZE5OYVdWK0Vs?=
 =?utf-8?B?RkZBdkdEM01oZUkvd3R5a0VtSDlhazNSUnV4NGJMaXdteG9DanIrTDY2Mk91?=
 =?utf-8?B?cmVHdFc1Wis4SXBEeGV4a2kwYkpBK1paUGhwaE12TWxxRE1vc05FN3dpcFZH?=
 =?utf-8?B?RG16QUw3TUlJVWpYSkpjM1EvL1lpZWkwWXhWQzFUOTFtd0JPc25yOXFJMXZ1?=
 =?utf-8?B?VFpacDFtaFRVc2lES08zR0V0d1pZcjBtcFpXTW9sdUQ2ajBCOHp3djYvajg3?=
 =?utf-8?B?VVNWdVkyRU5UZGhGay84bkZHZzFUMXVOTUhyYWZFb3Mzb0tPbVE0eTBkZVk2?=
 =?utf-8?B?OEFkY0wvZU9PWldyZnRuQXlRRlFnMVMreHlzdmZ0Sk9RSFI5RGFSZ3lhVkd1?=
 =?utf-8?B?a1U0R1ZRWkF5MVFwTHI1RW1vb29YMHR6YzZXdnlUMXdCNG9TNHNXLzN6bkU4?=
 =?utf-8?B?aExrOGxOVG9zblVMVFJlWmloLzVRNnRyUHVFUTI5Y2xsUy9pWEdNemRuNUNJ?=
 =?utf-8?B?dFpGVmhQdVNwc0laeXZjWlpxWHBrZlYrM2dHMTJINjBlMXp4RHhwQzFUYXgr?=
 =?utf-8?B?VTA3NStFZUhvY1YvaUttNm9nRVNxOXlHdG85bjYySU03b09QOFVIc1R0Tlo1?=
 =?utf-8?B?eEVSdllJMHdseERaaE8rbEVyeGZ0ekdONTN2eGFQZkdYdEdBSjN3L1BLZjZP?=
 =?utf-8?B?SGxFeEdKWWFyeUg5VlByTWtuNkpzSXBXeDIvaW9TcllzL29JaU9LQVhkMVZG?=
 =?utf-8?B?anllWkgxRTVEYnpDQ3hCUlNSTFRIeGJ2dGN0Q1JPSXlwQVo1MHJtdk9VT3pX?=
 =?utf-8?B?T0NmZVZNcnRZNGR5dTdCNHdZZXNCNUw2MHJVa28yTkcyVTUxcWRGdEVTS3Zl?=
 =?utf-8?B?TVBQTXlGYW5ZTldLQ1hpaU5UbnhDM3RMa00xNWpLRmNxRjk5Zi9iUDhEK0U4?=
 =?utf-8?Q?fGLuZ+s79kU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVNpWDZZeU4xY1ZnVDM1NUg2cW5ieXBjYVlTMnR5all6RnJ3QVd4SENxZW5F?=
 =?utf-8?B?aEZFdWVCVGJpN3ZnbFdDOGwxMjkyNnRHRCtKM1ZCaDBNZXE3MGRUWkRNU2x0?=
 =?utf-8?B?UFk0eWx1eGVyK1IyNnQ3RnMyVlpNV0dQT3lMUlFaa1lPZWlvWHRxSHBBbUNv?=
 =?utf-8?B?eS9wSm51aVFaWEtWeTJUTTI1d2MvS0RVMXRCQVFXa1ZMc1NxTm8rQjRFcFN6?=
 =?utf-8?B?enZEZi9idlJIbGU2TEVaVTFlR0xTZUF5UDlVd09Yd0dCeWNhR0pHMytueWUw?=
 =?utf-8?B?OWN0WTdyYWg3NmxjbTE4S01NWVpaVFJpcVlydEtRSCtNU2FVdzdla2tTbGZa?=
 =?utf-8?B?ZHRhMUQzRW5HRUhlcWZEWWd4Q2hKUytvRzFwYjhHd2x6azBMV3ptRXQ1dmNK?=
 =?utf-8?B?MnhEOVI4RlpFYlZNcFhsbXM1UDY0UW1McVlKWFZIb2s3VTJVU0dVaGROZStT?=
 =?utf-8?B?bmxSWGd2c1huS0dMdDBRQ2FZRlpmT25WM09hbFJjVEE0dTdCZUo3YTkrMURm?=
 =?utf-8?B?bjFNbEU2d1hZYk9YN29iK3MrZjRUYStsZ0NxYnJtTlp4YnkwU29vNnN5c2ZX?=
 =?utf-8?B?c3pBdmhTWWRXMmdIQk1RcVJLRnpWVFVzOUhwd3RqTlRMWi9ySE1WYzh0dTVP?=
 =?utf-8?B?S2pkT2dxWDRIK1NKNkFIWEdVRVZtWnQwa3V1aG12cGlMMmR1c0MzdUp6ay9m?=
 =?utf-8?B?ZXpPNG1mMDFxTTBFckdJTjFTRFhOSXFub3lMcDJTR0xWK3Zjd2V5VFovNm15?=
 =?utf-8?B?TmlEWlQxeTA3cExLb0lTR3BJSDZjb3BaL21uVzNpaWphZFN3Ny9NV1dHZ09G?=
 =?utf-8?B?U1FoRWRndy9qOWxLd0ZBNEswQXRrdHYyc2dwRkhsZzk4QUdWSG5RWHowOElt?=
 =?utf-8?B?VXJjcitDM2YwQ3RYVW9Hc0J3OEVCbk5BWjV5b1FFbUpFSmUycEwvM2ZRUStQ?=
 =?utf-8?B?QldIRWRZWkpVZlRNUW1IaElQL29wZDRML2xQVVl6cDhxdFRrckVab0xZVGFx?=
 =?utf-8?B?S20wYUhrTjE0bko3OWJ1UTlIaTdCN1Frb0UxUjh6d3NRajFqcFhmcDZKYXlO?=
 =?utf-8?B?cFVZVlF4U3RWd08zU21GdUs0Nk5RZmFPUUFjeDhkT3ZuOWJHVjdmM3dsdlZF?=
 =?utf-8?B?ZnNLWjM1eGFVTU5HTlJNVG5YYU1OaVJ2dS95K1duWDdvVHdZMEZ5U1l6anFY?=
 =?utf-8?B?R2ZGUENEREhpdlVSbDVyZFY3dmhmR3ZQcWZxRXlJRHlDbWltdlh1S1RVdG9R?=
 =?utf-8?B?WHp2WEtlb3ZzY1E4Q3FYUVJBd2QrclNhZHcyMXVDM1lua0xua0p1QXhQRHZa?=
 =?utf-8?B?MlRqTi9DVDBBYjA2N2FaaWRIemhHT2dyQlgvUzJwRk54OUg4VVlFVm9iWDBT?=
 =?utf-8?B?a3FzcFFqWUJlRGtmT09KR1pBUzJObFErSWYwNmUzYkk1V3phYUlLTkl1TFRI?=
 =?utf-8?B?ZHBsU3RzTmE0cFhONlgxN0dHcEtEdjYwYXBPVmpqYWpsWTVkWGszSStLWE81?=
 =?utf-8?B?cUxueE4vaUFlSk1DbkN4SjRDNTBJUXRaeGsxcHJWUXk2NUNiU3ptRFBPekQv?=
 =?utf-8?B?VnBveVhEZnYyblJFZ1VYby91LytNd1pzbEJmb1FNazZsOEsyNUVZMXBtTU16?=
 =?utf-8?B?YU13emFrcWFtN1JMc0E1cjRKajNZNlppcDhoUzhrQTRkdWxockllK093S3VE?=
 =?utf-8?B?MkZtamRnaXM5WjBNMXo3em93QWVSQWJyNnNRSWs2NmZYSUpydjEveE5YaEtu?=
 =?utf-8?B?U1lwK0hxM1lzeTNIa2lFSmZkM2s2VlpBWFFOUWlEdjlWVVR5Qmw3eGR0a1hY?=
 =?utf-8?B?cnBaZFdWTldLZlV1VXlCUHRWVnhaTFUxRHVaeXYwWS9qNHFxOEdPYkVSK0Qz?=
 =?utf-8?B?STFzYytkbGIrSmgzYXJBVFJ2RFVDdlBsbWpIbzZ5cXJIampsQjJOTE0yUGZ1?=
 =?utf-8?B?QlY5ellYUmloWUo0UFdXOEZKRUpiQWtLc2ZNSlYxa3FFQy9sYmpmTGJYcUp5?=
 =?utf-8?B?cHhWejRXWGRuMnNhNFBEMXVKWGZ6M2J5QXAyeFRYMm9WZWtieDVvQWN6b1RE?=
 =?utf-8?B?dVhiZ20xYTllY0g3azJRb2NJZGdrRGpzdVFJblE0RVlGMU5tYjcrWDRsL2JP?=
 =?utf-8?Q?gCkVw/n4uQAfaGpmEGBut593a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f99be1-e8ca-4d65-03bd-08ddc2d77fb2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 13:08:17.4279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BW+NmxwKUySUGIrGdlVTJF5+Y2oK4YV3fu0VxcwwrkkaLRE40F/rtbQtbQkfYgnP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9642
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



On 14.07.25 14:46, Philipp Stanner wrote:
> regarding the patch subject: the prefix we use for the scheduler is:
> drm/sched:
> 
> 
> On Mon, 2025-07-14 at 14:23 +0800, Lin.Cao wrote:
> 
>> When Application A submits jobs (a1, a2, a3) and application B submits
> 
> s/Application/application
> 
>> job b1 with a dependency on a2's scheduler fence, killing application A
>> before run_job(a1) causes drm_sched_entity_kill_jobs_work() to force
>> signal all jobs sequentially. However, due to missing work_run_job or
>> work_free_job
>>
> 
> You probably mean "due to the work items work_run_job and work_free_job
> not being started […]".
> 
> However, the call you add, drm_sched_wakeup(), immediately only
> triggers work_run_job. It's not clear to me why you mention
> work_free_job, because drm_sched_entity_kill_jobs_work() directly
> invokes the free_job() callback.

Yeah the description is rather confusing, took me more than one try to understand what's going on here as well. Let me try to explain it in my words:

When an application A is killed the pending submissions from it are not executed, but rather torn down by drm_sched_entity_kill_jobs_work().

If now a submission from application B depends on something application A wanted to do on the same scheduler instance the function drm_sched_entity_add_dependency_cb() would have optimized this dependency and assumed that the scheduler work would already run and try to pick a job.

But that isn't the case when the submissions from application A are all killed. So make sure to start the scheduler work from drm_sched_entity_kill_jobs_work() to handle that case.

Regards,
Christian.

> 
>>  in entity_kill_job_work(), the scheduler enters sleep
>> state, causing application B hang.
> 
> So the issue is that if a1 never ran, the scheduler will not continue
> with the jobs of application B, correct?
> 
>>
>> Add drm_sched_wakeup() when entity_kill_job_work() to preventing
> 
> s/to preventing/to prevent
> 
>> scheduler sleep and subsequent application hangs.
>>
>> v2:
>> - Move drm_sched_wakeup() to after drm_sched_fence_scheduled()
> 
> Changelogs are cool and useful, but move them below the Signed-off area
> with another --- please, like so:
> 
> Signed-off by: …
> ---
> v2:
> …
> ---
> drivers/gpu/drm/scheduler/sched_entity.c | 1 +
> 
> 
>>
>> Signed-off-by: Lin.Cao <lincao12@amd.com>
> 
> This fixes a bug. Even a racy bug, it seems. So we need a Fixes tag and
> put the stable kernel in CC.
> 
> Please figure out with git blame, git log and git tag --contains which
> commit your patch fixes and which is the oldest kernel that contains
> the bug. Then add a Fixes: tag and Cc: the stable kernel. You'll find
> lots of examples for that in git log.
> 
> 
> Thx
> P.
> 
>> ---
>>  drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index e671aa241720..66f2a43c58fd 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -177,6 +177,7 @@ static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>>  	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
>>  
>>  	drm_sched_fence_scheduled(job->s_fence, NULL);
>> +	drm_sched_wakeup(job->sched);
>>  	drm_sched_fence_finished(job->s_fence, -ESRCH);
>>  	WARN_ON(job->s_fence->parent);
>>  	job->sched->ops->free_job(job);
> 

