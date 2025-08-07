Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4FCB1D8E8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 15:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797D210E84D;
	Thu,  7 Aug 2025 13:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jOucBXVj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF7110E849;
 Thu,  7 Aug 2025 13:24:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/dkAXxdevkBV1krRw7NU/DdV29xY6+qL2sWt6DuqSSlwL+jLk55eFkz+phtB6fHCk1dv3A/LiyiS4vk+ibd96uvBHYQTgQutdLOJGu2COOF8g9SXRC/yZwckPJDTrLeh+WEQyi4S3Fz1N8jZklPoJzHvg7bXDowBeTjbXxZ4DITE3L+q+uGgb5VN7/licSxEm0VGSqM6x9EWI3ozbVCrdJpwry0e5Z6Q1YBBvMe7xAS8fW5hPgoSgxFGfIKjxFSuUu8lQvKPWWLVfvGrRWrYDxjT5mmQdW6b73tfE/W2rAm92ouiu8gQfscvw9zmDBY5A32Xnn/2TqtkS94DTRJ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxC1w00Ua8AEi5e36cmLaiqoJ8oHvBBu6bB7PWnDyak=;
 b=pa2tudwGPEc97/CsEsjLqUuOG8GC3PEulbtZl8Rn9Ij2yeo9zpDXJxWpJUnmBjzqNQj9hlqnCz2OoHEKCtPyk763Z1wApqSMJsDRKGsmIya05L89V3Y4kjxGhqZnpme1VTaivOcsKIb0vAurznOniwaL2fb3uygqiuHLy1jUyk0bNjMHAcWSbJ4rUX8GLikFzgICW4JuUO3Vmhr0kNqRXJRQGGGQjYbht/ZFuZy2uTq9NGmQ4IOlgCvv3F2VReQSaHsGbnBwTQG785SDnu4qcFhqnuh2TSNQ19ALxISflAX2BX0+Z4xAjGb39LAPD8iCSpcYBZvnTCF3FWcPTvQl+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxC1w00Ua8AEi5e36cmLaiqoJ8oHvBBu6bB7PWnDyak=;
 b=jOucBXVjpXXXF/Tnhx7WVJc1X4mV36bScDHWkxtpUuaYqH3t1PRZic+t5H6ei42Ps6sLkyjtKFwVfjYsiEQn8ZrXsDDI+OftxgYyUDjTvU2kIWeorPMpU89RFXc32VjYD9PBeL1V8SJUWLS4U6CKRigQI/FQdimDt5RfDUBETJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4043.namprd12.prod.outlook.com (2603:10b6:5:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.17; Thu, 7 Aug
 2025 13:24:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8989.018; Thu, 7 Aug 2025
 13:24:12 +0000
Message-ID: <93561b1e-0410-4e21-804a-bcaa8f2585a7@amd.com>
Date: Thu, 7 Aug 2025 15:24:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: skip disabling audio when device is unplugged
To: oushixiong <oushixiong1025@163.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Alexandre Demers <alexandre.f.demers@gmail.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20250807094719.56145-1-oushixiong1025@163.com>
 <9a632900-4ebb-40af-8bf8-bf55f8e25c7b@amd.com>
 <c6cc5a81-ed5a-474d-bd2f-29d1cfde34e2@163.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c6cc5a81-ed5a-474d-bd2f-29d1cfde34e2@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: IA4P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4043:EE_
X-MS-Office365-Filtering-Correlation-Id: 77eb82dc-0348-41ce-c22d-08ddd5b5b2e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTl2REErNjdJZkVwdDhHWk1XK2NzRklUK1N3R2dza3k3VUVpMUtzVzF0ZlZm?=
 =?utf-8?B?YkxkbDQ0WjZmV01XdzRldEtYTXpIem92T2pmTkorcXBhZWZ0RWR6cldNcTRp?=
 =?utf-8?B?Q0ZYNUZYNDcwTTF2VUIxc1RUbWFyVi9NUkQrRk4ydWFhV3c2OHo1emdNQW0y?=
 =?utf-8?B?TWY1QXdKS2JJUHgwZmFXaUFPQUlsKzYyZ1Mwa29BY3U4OVdXRlVKYUQ4SVk4?=
 =?utf-8?B?REk3MU43OFFKa0tqTXhUSWhSakFWNkhKTnlsenlHak50QndRdWNBY2lWb0Jw?=
 =?utf-8?B?SGNxSEpXTTNHRDRPUFF3dnFKS2g1dmVmb3ZBVGs1QXJMY05yZU5QeWlaTkQ3?=
 =?utf-8?B?dkJYZXl1RHhoWHY1RzZvMU5UNHA2RFI5N21ZVW5QUklrZ1J6OU9rSWRTQits?=
 =?utf-8?B?clVkOVVicWt0L2hlYUlUK2NZZTBub21XdGdLVHd4NW5aSGhRamQ0YWVuM21F?=
 =?utf-8?B?aWVWbGV5WmlNcE1qR0k5bTZ5UjJuN2h6eDVkRHI4ZkE0TzVScjNpTjBXeGd2?=
 =?utf-8?B?R3pLTEQ3bVJJUmdwZFZPakhYaERzNlF1VllUN3Q2Zk5VU1RmYXAzeUFZNTJl?=
 =?utf-8?B?MnNSL2pVcEdZaDl2SzE4ZVBtdjRram9tcUtZRml3ZHQvVzRTdGdoekVueUJh?=
 =?utf-8?B?ODZTaklqeUdyZXdqdUV3Zm91Y0ZLM3FxeVlRdlZDQklHWEQvMjNaMGMrbVJs?=
 =?utf-8?B?dVY4c2MzUDdPazJpRXVWVFRFSFJTS3ZEdWxtcmgxV3hueW5OYktmcjRxb1BV?=
 =?utf-8?B?YWxUNGFscytRTFB2R2pqbDRRLzliZFJDQWpUS3FmK0pSa0FuOHYvTGRpc1o2?=
 =?utf-8?B?L2xDaHJvRDVSbUZaL2tBY05jRmNxUUkyNTJWZEEwK0tkRXllRXAwNzN0cjAz?=
 =?utf-8?B?ZE5rNVNmSUlXU3hUYnFxekZXQ1p2M01aQjdQanVLcDZ1WXlsWEhJeFZMSnA2?=
 =?utf-8?B?OU9kRHQzWGxSTDJNZGFWUEdVTStBMnl5dkFmZVNBTlBEMnRkSTR6Q2NJREtk?=
 =?utf-8?B?MVpzbnhwRittTlNpanlUaWpnd1RiUHFudGNuakxTS0pTQTFKbVJhRDlQU2xO?=
 =?utf-8?B?QzErUkR3ZzE5NWVKNGFKenloMW9vSDRyMSs2MitpL3kxZHc4QUZkODZZT3Ir?=
 =?utf-8?B?SDZEYVlIbnByT1VHS1NZYnBZWGdCU3dBdDY0dDd2SGtrcmZpMjR6SmowMytH?=
 =?utf-8?B?bU9uSlVQVlZnQThmSFQ0Tmd6ZFFXRVBEZnhxVUEyRDFFdE5lRm1DMlJJOEV6?=
 =?utf-8?B?L2dlbnV5NzhsWVBuczN5a2taV25jTS93dDJjcFFQSHRzZTd6N0JGRU9lSHgy?=
 =?utf-8?B?Qkl4c0lTWUc4TzhyYXBybWpPblI5QmtRZ2t1Smw5TS90d3hhSVdYbXI1WVAz?=
 =?utf-8?B?WFhjTjF2WmVBZ3JWQmRiSEYrNTZvZUFaZEhlbVFEYXZKcktQV1JVRG9oODUr?=
 =?utf-8?B?aVFiaVZIM0F4aUloQ3VmVkVwYUZYYytvYnBjSituckc3WitzOVlRNWNEYVZ4?=
 =?utf-8?B?RVFsdll6VTZTRnNGMWpkM2V6SEsxN0d6QXhiVDYveUJmSlh6WXBzVzZRQXcz?=
 =?utf-8?B?TU5ObUpoeGhqZnJQYXFISFFBQ25zQmFVcnNvVWpjYWlxUmxmaWprN2h3Z25k?=
 =?utf-8?B?NGpjZFoyVWgwb0tTY1BxcjJLMk1BTFgrVXlzWm9Eb0tocFhZR3ZPMGNvWHE0?=
 =?utf-8?B?cjJnamJYbHV5bEpVdThFR1ZNNEpodkY3Mk1PVHJYY3lmQ1VtZzArdThNS1Vn?=
 =?utf-8?B?TmtISTN2MDZlUkxieFdKTGtaMjBRQldWOHd0NVgyV0o1R0xwcFNzcXAyZUE0?=
 =?utf-8?B?dThOZXVGd2t4U0xRdnVvZ2tGSDF3SHl1QXV4QTNLRm1EQUJnSWJyTGxxWkxZ?=
 =?utf-8?B?eW5qZ0VUY0Nrbk01UDNINjBvaGJzWVlnYVg3dTJaVzE5a3NrNUNtOUE1cWxV?=
 =?utf-8?Q?Apt5FSxO1vs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dExFK1JRMVY5cC9lNUZ5Vlhva0JCWVo2TWRFR2JmeFVzM3ZKaTVQcWRaZ2Jl?=
 =?utf-8?B?TUxaQVRXRVdHUTV4Nk8rT2pjNUpPMzJTZ2xPLzcyR0VSeDNhV3VTTW04SjNH?=
 =?utf-8?B?SWZ6Y3IrOG9EZ3NpdGw4ZllVVGFUdzZzM1hoL2xnN0dWaEZGSDRsRTdNZmZr?=
 =?utf-8?B?ZGdBVjYwd0JHb0M0emJRY0U1aEhiR3RnN0o4TldmaVpzcGp4bVd6V2hoVXNn?=
 =?utf-8?B?T25hZTV5QkEzUnRNNitmN2JITHgwc29iRTdBTUY1U2NUWE5JTWhFcEZRYTlp?=
 =?utf-8?B?dTE5TjZja29Eb0t3aWoxK2lvaGt2K1BPRkVoQ3ExU2I0VEthOG0wVlF6QUZP?=
 =?utf-8?B?SUVHMVhSaUpudnFpalJHUjFFTnVKRFlPaFhSbytyWno1eDFvbnNZNG1CVHA1?=
 =?utf-8?B?bGljZTJmVHgvSmgvODBBMzU2TXQ3T0FSV2Y2bjhzVWN6UDV1bTArTlF4VXh5?=
 =?utf-8?B?b2RKUm5WbkFVSnJvajIzL3lEc2dGZWZLQStUZGFrblk1REI1RHUvd2NaNGZK?=
 =?utf-8?B?bVlPbTM5OVZIZWNuUjNQN3lTRWszSTdXcHV4WjdaZ0xnTFhSNG1pdTBnZXFl?=
 =?utf-8?B?ZDJoaU04RzVGUmpOdzZLdENGSVM1SlJvdHhSSjdRWVdldkUyUzJrclBKZ2NS?=
 =?utf-8?B?Wm43bGlMNU5qRW9BcVNqN2xuaFB2VVRsalE0emExblZ3dVpCVm9nWXR2UmtO?=
 =?utf-8?B?RHFrU2UyS05Qc0tQQU5zVGFmMjdsUVplQVRrdHVFZzgrWGV2UUtyaERRcjB6?=
 =?utf-8?B?OGVmUGorN0JST3ZmTEZrZ2ZWazA4WnlYcVV2TExLREdCNEJXNlJOUkhRTkdI?=
 =?utf-8?B?dUdxOCtDb09yQ3JUb2hFcFpCK2t5S3lJSkRIM2NuRXA3NUwvRTFGcHlKK2lW?=
 =?utf-8?B?M3BhaUY0c3dJZ0ZYb21VWjM4UnhMWm1JRExWVGhTY3lianIvS3IvZDhsY3Zw?=
 =?utf-8?B?S2JYMFlYSXJuYUFJSExlWnBjcDkzR2NINmhZQk9uN3IvM3RJYXVvY3IrOUNO?=
 =?utf-8?B?bDRqVjNkTlZ1cEFCdndTR0Ryem82TmdEWmQ0TENTUXVnaEtaYkYyK0VUQ1Zt?=
 =?utf-8?B?ZnovajBSeW1aWnRubHc0OEFjR2dacFQweGJGUnNPRjlvbCtGbEhWNi9zeVFH?=
 =?utf-8?B?STNubGtHOE4xbjgyUWl0MlFxTklSNDVIY1M5cEorN3B0bGVEYjNvY0ZUK1BY?=
 =?utf-8?B?eGtaVkFhQ3A0VUo0ZG16dmc3WGRsbW1xRm81bEVab3ZJUzNEditxT3p5SFlS?=
 =?utf-8?B?Q3RkQnp6a28zcUJOWHIzUzEvMEZiRittWGlnR3RuRzZOMHd6ZW5FdzMzczVN?=
 =?utf-8?B?OGM2czZ4ckJONWcxSFQybmhhb3lJeXpUSHVoYjIwbkxobURZeHE5bmZ5c1dF?=
 =?utf-8?B?c25LOE8vaVNTc3VKVnMrcjJRR2IxQUNIeEtpTkR5aWtBU3BrcUZMMFdSUVo2?=
 =?utf-8?B?ZnBhZFhVeVVndG9GWmU0QjBXa0Vqa2JGNlEybThvc1NSUnlxUW9xYXE3VSt0?=
 =?utf-8?B?RksrSTBZTlZBK25QQWYxWk9kd0ZEY2ZraUgvYkg3bzlyVWJzaXd0K1FSVXNY?=
 =?utf-8?B?Uk4zbG9YeUFIQVE0bEhHdUp0b2RoMjZ3OHo2RkZaL0FQbzdWVmtUMzl0aXNy?=
 =?utf-8?B?UEpuVkkySUN1WG1GelZoZkhSemxlK1ArRjNwWHlzdTlaMGZQL2Z6enEyek9p?=
 =?utf-8?B?clRrQUtxQXowZ1hSaE9TckgvWWI4MW5VZlovQXVvOVFoRjBHK01jdE5TcHBt?=
 =?utf-8?B?TSsxcTlyTityaVk3YzVyaFVLVURkVEZDMCtMeDh5djRBRkp3WXVUc3hsRXll?=
 =?utf-8?B?ZlNDeFF3cFl1cGw1MG1TUTUvSWZtWTdvalJaS0M3S1FVR3Vmd3crb2xmRnA1?=
 =?utf-8?B?c2puc3cyQy9UbDhzblBNU3ozZ0ZKWFF6V21zWkxwVDJyaVVrNDRZTjJ1Ulpm?=
 =?utf-8?B?MjlYSFhIalNOUXRpK2svdVd1MnhwdDNaSE9wREJ0L2h2K2FQeUNMdE1kcjEr?=
 =?utf-8?B?ZkF4WnZqdkR1UkVvWU91YlRkWmhOM0RqbWlIa2tzalAvUGQ0QVZSSWthQ2p6?=
 =?utf-8?B?Si9WTnlWeXVuODZKVG81WERxeGUyQ2RoYW1HLzV1VHF5Mm1FNWUzRVprN0xk?=
 =?utf-8?Q?vJV5Ng555fDDThCZMFGm6RC2D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77eb82dc-0348-41ce-c22d-08ddd5b5b2e7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 13:24:12.5712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: giQU9FEtRT363PjIYOVgsI2wX3iGz3d4amY3DRWyJicnzq7nPoybfK4xYCv9Vdv9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4043
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

On 07.08.25 15:01, oushixiong wrote:
> Should we move audio disabling to hw_fini()?

Yes and when you look at the patch Alex pointed out that is pretty much exactly what it does.

So still good catch from your side, but a fix is already in the pipeline.

Regards,
Christian.

> 
> Regards,
> Shixiong Ou.
> 
> 
> 在 2025/8/7 18:03, Christian König 写道:
>> On 07.08.25 11:47, oushixiong1025@163.com wrote:
>>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>>
>>> When Stopping lightdm and removing amdgpu driver are executed, the following
>>> error is triggered probably:
>>>
>>> Unable to handle kernel paging request at virtual address 0000000000005e00
>>> .....
>>> [ 2] [T10084] Call trace:
>>> [ 2] [T10084]  amdgpu_device_wreg.part.0+0x58/0x110 [amdgpu]
>>> [ 2] [T10084]  amdgpu_device_wreg+0x20/0x38 [amdgpu]
>>> [ 2] [T10084]  dce_v6_0_audio_endpt_wreg+0x64/0xd8 [amdgpu]
>>> [ 2] [T10084]  dce_v6_0_sw_fini+0xa0/0x118 [amdgpu]
>>> [ 2] [T10084]  amdgpu_device_ip_fini.isra.0+0xdc/0x1e8 [amdgpu]
>>> [ 2] [T10084]  amdgpu_device_fini_sw+0x2c/0x220 [amdgpu]
>>> [ 2] [T10084]  amdgpu_driver_release_kms+0x20/0x40 [amdgpu]
>>> [ 2] [T10084]  devm_drm_dev_init_release+0x8c/0xc0 [drm]
>>> [ 2] [T10084]  devm_action_release+0x18/0x28
>>> [ 2] [T10084]  release_nodes+0x5c/0xc8
>>> [ 2] [T10084]  devres_release_all+0xa0/0x130
>>> [ 2] [T10084]  device_unbind_cleanup+0x1c/0x70
>>> [ 2] [T10084]  device_release_driver_internal+0x1e4/0x228
>>> [ 2] [T10084]  driver_detach+0x90/0x100
>>> [ 2] [T10084]  bus_remove_driver+0x74/0x100
>>> [ 2] [T10084]  driver_unregister+0x34/0x68
>>> [ 2] [T10084]  pci_unregister_driver+0x24/0x108
>>> [ 2] [T10084]  amdgpu_exit+0x1c/0x3270 [amdgpu]
>>> [ 2] [T10084]  __do_sys_delete_module.constprop.0+0x1d0/0x330
>>> [ 2] [T10084]  __arm64_sys_delete_module+0x18/0x28
>>> [ 2] [T10084]  invoke_syscall+0x4c/0x120
>>> [ 2] [T10084]  el0_svc_common.constprop.0+0xc4/0xf0
>>> [ 2] [T10084]  do_el0_svc+0x24/0x38
>>> [ 2] [T10084]  el0_svc+0x24/0x88
>>> [ 2] [T10084]  el0t_64_sync_handler+0x134/0x150
>>> [ 2] [T10084]  el0t_64_sync+0x14c/0x150
>>> [ 2] [T10084] Code: f9401bf7 f9453e60 8b150000 d50332bf (b9000016)
>>> [ 2] [T10084] ---[ end trace 0000000000000000 ]---
>>>
>>> The adev->rmmio has been unmmaped in amdgpu_device_fini_hw().
>>>
>>> So skip disabling audio when device is unplugged.
>>>
>>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 7 +++++--
>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
>>> index 276c025c4c03..48b29990da7f 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
>>> @@ -23,6 +23,7 @@
>>>     #include <linux/pci.h>
>>>   +#include <drm/drm_drv.h>
>>>   #include <drm/drm_edid.h>
>>>   #include <drm/drm_fourcc.h>
>>>   #include <drm/drm_modeset_helper.h>
>>> @@ -1459,8 +1460,10 @@ static void dce_v6_0_audio_fini(struct amdgpu_device *adev)
>>>       if (!adev->mode_info.audio.enabled)
>>>           return;
>>>   -    for (i = 0; i < adev->mode_info.audio.num_pins; i++)
>>> -        dce_v6_0_audio_enable(adev, &adev->mode_info.audio.pin[i], false);
>>> +    if (!drm_dev_is_unplugged(adev_to_drm(adev))) {
>> Good catch, but that looks like a workaround for something done in the wrong place.
>>
>> A *_sw_fini() function should not enable/disable HW.
>>
>> Regards,
>> Christian.
>>
>>> +        for (i = 0; i < adev->mode_info.audio.num_pins; i++)
>>> +            dce_v6_0_audio_enable(adev, &adev->mode_info.audio.pin[i], false);
>>> +    }
>>>         adev->mode_info.audio.enabled = false;
>>>   }
> 

