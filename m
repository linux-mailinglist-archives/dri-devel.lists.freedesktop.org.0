Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872FBABF86F
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 16:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9CC18AFBC;
	Wed, 21 May 2025 14:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4s+34Tx9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772FC18AF8B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 14:56:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yh97d1hv3x0jnfDxLkv2z9slALWGWArjmE6q9heyWm2mxYbdm/+EgVo2f6y84zJBhRqkdm1BULTzqQ1MX+YPD2/kXGVO/ODLv3dwZRIUzj7ASOV+RyT4AfKNzdECvoydX0LTb9K0yHgDfW+PYa+8lcOOLuuvHZ6IiaRK0CU5dgg2Hrx7rxlJKc7K+Ws/JbHff74NQ2EbPWx7XO54SEDaeXEpL7MDjBN06cyZeMTcZ8GZCbHqwGqduqRCxUjgv4vCsR0nVvHM8svGDgkIzcHld20bMkjaUVKR7pX/MyN7tuhw0LcsBN9nJRYAVxyN7BhYLnI6bMkn545+X9nfZLMnGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgyWPfDDN4tNgOIa1Dsh+5Rk9szFBaLUMhO+k+eHGiA=;
 b=TYjWzcGmNw3DWopkXxylJ115eKclukNIkQ91Iy1M9Dysw28zkdVuR9Hq/6XbM38iyc+igsUuWALyVHf7/cTMT6b7ZPx8xbjAUnlOb4koqfdmRqZg2JmNg2ueMJ+VX4KuNFlIWMV9FQFnO9PYgv7ALkE3tqyoZ//GiZ8D7CprMaCvaleuimK+/Ek+kBwRfpVP67abSyAwRFXcX2nr85o/8OKojoO8ZixICXnfDfZU+XcxEY9zHqnMIRimY5KWrRk3Vzd/Yl706ESivZ6PQk+kkd55GUEb2Z5Tu3TIVx5BpaOQLhKDamw1VpT7N8zLJYB/3cqthu0n4UN7fRXpGPIiUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgyWPfDDN4tNgOIa1Dsh+5Rk9szFBaLUMhO+k+eHGiA=;
 b=4s+34Tx9Um2brerS9tdPHtOkrYTAW4+ZSXTEI8uJeHnIoRcwYaYoH4AU2qlSyx8brDPMd/BvMQ8aK5luigTYWOTPuTCV2yC1cH2XkmB7RB7bYxZbWn19+JcIyiwE3ieWMTQ2WToWAUL3O8/4mFbg49mAaAO+kYG5NIaIhXvbZQs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7770.namprd12.prod.outlook.com (2603:10b6:8:138::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Wed, 21 May
 2025 14:56:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 14:56:38 +0000
Message-ID: <854e53d8-621f-45f6-aa4a-c6157350b89b@amd.com>
Date: Wed, 21 May 2025 16:56:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/amdgpu: Adding amdgpu CRIU ioctl
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Cc: tvrtko.ursulin@igalia.com, Felix.Kuehling@amd.com, David.YatSin@amd.com,
 Chris.Freehill@amd.com, dcostantino@meta.com, sruffell@meta.com,
 simona@ffwll.ch, mripard@kernel.org, tzimmermann@suse.de
References: <20250521140649.4058526-1-David.Francis@amd.com>
 <20250521140649.4058526-3-David.Francis@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250521140649.4058526-3-David.Francis@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 0060bde6-6c79-46fa-d6e6-08dd9877b00d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUkvMGcxUk9kQ3d2RHFOaURHY1NBYUFRcHJHN0orZXRyMmFTM01BV0RjbW15?=
 =?utf-8?B?MkQ3VFM1TGdvMGVNNzVjL0lnTnJ5bkx6QTlvSE1jdllKZUttRGFIUzZ6bWYy?=
 =?utf-8?B?Vm53eWhMZUpBanFjVkFnUFplaGZwVG5oNkN0b3NMaTRmcXpKYWt1QUtGZmRh?=
 =?utf-8?B?a3NxeFBrZzJaYUdnTVpzWjhJWVVxb3IxTFljYXBZZjhPS3hNcjE1RGk0MHJR?=
 =?utf-8?B?RFZVamtrSi9ReC9sZmdTckhqZGFDYjkyZTZKUUpCSHNmZk1CTEkweW1wM2lT?=
 =?utf-8?B?eHhxeWhyN2xheUM0ZnhiTEVZWkV6KzJ1eHF1MWM4SjZSN1EzTHhkZVo4WEh3?=
 =?utf-8?B?bllNUUk1UFJ6cHZKbHpQaVNrRE9lK3YvdnFaMHF0SFdtNDdSUEVxRTFPYk5S?=
 =?utf-8?B?T1k4Qk9oS1ZNUGMzTzM3c2ovNGR0aHRtM0VFaXRNeUh3MmdWZUdKVkNjbmwv?=
 =?utf-8?B?OTdXOWIwdXptZGZmR3JoOUhaemJCdE1PdjcrVHBXRzdBSEdzM0pBaG5VY2kz?=
 =?utf-8?B?emhIZnNQakNvallOU1IzUmUwTDJlcUk5Yk44K05HZ0hIWERpa29xZy9JRU5s?=
 =?utf-8?B?Z0QwcWdMa2EvS1FLRXpvdmxENHc2bVRWQU1wN2FUSVpZdWs3WldlcGlEb0FX?=
 =?utf-8?B?djdZb21jU2dBQk83MmVUcGJ0cTFIY1YyWVZiWWFIU0M4b2tYUDBlSk1TLzFS?=
 =?utf-8?B?TUZ3NjJwRDVnYTJvQlloZTN5ZkMyWFNsZ0xQM1ZQeHY2QlBMNHFtZklCQVRj?=
 =?utf-8?B?aGVYc0YvTTJ2M3FxUE5mMHRBWDRxK2dPK0pwUXhWWkhzMVg0N1dzcm5VV0dK?=
 =?utf-8?B?U29yWVh0Z0xKMjFYQ085OUpRMEZSTHhQdnp0NUFQK2pNVlRGWWROK0NKLzFT?=
 =?utf-8?B?S1k2L0hnK09wOGpWYzNvZ0MwYmlHU01DQUE3VGE3SDVVRWFENmlNMGV2Wkdj?=
 =?utf-8?B?bWl1RjBSK20vbUtUOWNBQTJhamIwT2Z5R0JaZHRoeDY3UXhVU3hvN3NCUkpq?=
 =?utf-8?B?UTlEbGdEbGdKN0JtT0dsSnhYSVR0bjQ5Q0hLWXFabHhsVTdKSnJRTWxNbGZN?=
 =?utf-8?B?cHh0NEJVVjJuVkJObCtXaEkxYmx3ZkhPMHpSTmRNWXVOSitHV29wRzNrVEty?=
 =?utf-8?B?VGNvUmdnd0xzWGU1dzJMWm1RWlAxV05oVHU5VmlQN0hXWWVMNHRsdktjQVpy?=
 =?utf-8?B?cFVabXN5UnJxbzlZb0xEb2lHNkZXa3EyYjA4NGQwbzJXZjloWGdlVjJMWklF?=
 =?utf-8?B?bUxUaFpIblV5L01xRTBhdHU4ZS9ZVStpb00rZURkcytNc2tXSWZRVjJxS3dk?=
 =?utf-8?B?WXp5SFFpemkxUXhJdzkvS05mK3BISGRHdjhsYS9UR3pKWjdZUGlPY1N0c1VE?=
 =?utf-8?B?M0xKTmdzSi9xUFArejNrVjZrby93cVR5RWpPajMzcjZhc0RReFlkYzZuWlhC?=
 =?utf-8?B?L09BaEt6WmF4ZytFL2kwdHRXbjRJN2xjTTdsNDFUMnliYWFQb1ZkQXM5S0pP?=
 =?utf-8?B?MlREUEdhNUhyUWFQV2RueHlrRGY5R25VQWtWbnpKWFlxUjRhVTRUeG9GWWNK?=
 =?utf-8?B?a2JaQWpFdG1pRGlHenZNNVVWbkRxdUhUdnB0MzJUTlU1VzFDeVBhQURCMlAr?=
 =?utf-8?B?eTFGY1hZazFRVzlabURTSFkzTlZXcmxUbk9RMmVLMXJaZ1U2dm5POW96bDk5?=
 =?utf-8?B?Y3BsRy85VGxDbHNxMXlWNzRNRDlWZzhkUHlxaTY3aldCYWJqaE5IbGtUZDc1?=
 =?utf-8?B?OVhsWCtWc1VnaFhUcWRTYmRhT2MvTTJISjMwVEtESWNlYzBlbU4zakpxMFRV?=
 =?utf-8?B?aHllR1NVUVVvdjhqTWJ1Y3pDOWVKVjMvWFZ1L2VBZ3FWVGVnN094aHIwanNn?=
 =?utf-8?B?VFR3UkRzWFVWU2h5WTYrMzJrNHdZQStEeFRCYlJvenNqa0g3bnlSWXpXalI1?=
 =?utf-8?Q?EEkW8zy7Dhs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUROeW5NdnR2a3J6NzJzeFcvcnBYeFY3ZGZaU3pZRmxnR0ptT3hQb0dUUHVu?=
 =?utf-8?B?NUZFY00yNUdicjR1WlY2OG92KzJyYjdqSmJJWGJZN2YyOEZqN1hjSVFaUnZ6?=
 =?utf-8?B?Vzd0TUhxNTU1U2pxR253blJ6TFRmS1AwYzhoOUxKMzVjbnRwTlIwVi8wdzBm?=
 =?utf-8?B?WnJ6QWpsMWZubUhXS0VwT2R6L05uRFBYejZGOWd0cmxSV0FoNkJYNU8vK2Z1?=
 =?utf-8?B?NVZGR2s3RHFCL3UyTW00L2lJOFJCcFhUNnF3RFRnTFE0Vk0zcGFIN0lxSmUz?=
 =?utf-8?B?MDFVTEV6WExGQkpmbFljWXhMS2tOVEMvOGdOUy9SZnE3UmRtTG8rYW1jbkRU?=
 =?utf-8?B?YmVML3VISDVXbnR4TzloR0hpeS9CVVRtMDRzaDkweER2YUo3VWswdUpDNWp2?=
 =?utf-8?B?emo0aVlMdDkwTFcvMXJqcGV1bklFeXYrRWZKdWt2YnY3RDl4eUFDRkRTckky?=
 =?utf-8?B?L29wY2JlbHJjaFpSZGRORGJTK0p0YVcwUnZIQ2JvVHBOTkRCRUczRzk4Zmpw?=
 =?utf-8?B?OGJaSCthLzRBWTAxMXA5UzEzMmM3Mjg3TmY5d3RzV2kvZUpjeThka0d1cDdo?=
 =?utf-8?B?TnJ3ZFpsNUxXcmV0S1FoMzJuN3YyZjVGcGV0ejRYV2NEZmxNYjBRT3cya283?=
 =?utf-8?B?b2ZkRmE2ZklDTmlyMHdxRm5URzhaazBVODNLODhoU0Q2RCtjaG5ic1QvTWVI?=
 =?utf-8?B?ZkF1QW1zMTdKakJ5SzcwNU5IK2xjbFFIcDF5YlpLTlVlVDV2cEVzWG81T2pT?=
 =?utf-8?B?aTB1am9IOTA2TDFOQ0hlUm5mRTdHMVM4STFiSU5kNWFtSHRLNVh1eWNzdEZy?=
 =?utf-8?B?RDdERFdLSDJyTnRoSjFWNDByNUx6VXRVWUN2OVpJaFBucHlCS3pvRXdkNTY5?=
 =?utf-8?B?TlZuQk5BM0h2eXB5cWszZjFWZlNodVl0Qi9YRitFQ2R5WEJWQkxoMWx3QVNu?=
 =?utf-8?B?eG56bzR4amZyUXJQYlZKT0Z1VmJZclIrWDZGTDJzRDN2SC95cTcyUURZZHFI?=
 =?utf-8?B?d1lyNjJRK2orUyszQitRd1BreDJ3K0pNU3RsWFRKUHZzazhVNStqQzFmQk53?=
 =?utf-8?B?cm1obmkydWJ5dFpPUjJEcDdmRllQaGYyZ2ZleU9TMG9iQ1JES0JMeHpwOEN1?=
 =?utf-8?B?TUJOZEJKL2xHV2Z2UytleTFqSExQeFI4U2pLMFRYbDYxU1dCNWJnUlQrUmtZ?=
 =?utf-8?B?ZGxmcm1ORWtyL0R1OVRNYnBKYk5yU2VGdWh5bUZ2QkVtVDdPOERsRkdpS2Fa?=
 =?utf-8?B?cFNLL0l0ZklUa1p2OEovdnpISm9vVEw1RTJnTk5UL2pPMXNkWWUzNEhXZ3lk?=
 =?utf-8?B?am01VitySktGZWRyK2RrbVp4cDdodHBvK3BpV3FWTzAxYlhidU01V2pzSGJH?=
 =?utf-8?B?N2pFMFFqQTZJMDBmUnBGbjIxNFR1ZiswOE0zZFdtUVcvWEh0STFUZDZ5Y3kr?=
 =?utf-8?B?VEFJZVM3ODZzS2pZYWNXeE9VZEFBTUMvcGpEY0pXL1AySTE3RnJwZ3lmWS9H?=
 =?utf-8?B?VkViV3pZOGlEOTB2ZThZakFtT0kyRENaTGhZTThBMmM1QkxWTkY1c0ZVcVFv?=
 =?utf-8?B?emNGOUxVS05qOEFXYVB2VjdHRldyT29tNDBoODY3TTErdVZta1EzWlUrTGN3?=
 =?utf-8?B?dTRwRWMwV0g4d3hpMkpGMkV3dGo0b0VWUjBjZXRGSXdnU1RWYngvUEpPZk5o?=
 =?utf-8?B?cnUrakw4T014bm9lRFhWOFdHWWJscllOWkJJaTdjRW5aZkcxMTllL3hWYXNG?=
 =?utf-8?B?UVF0UVZzM0MraU91YmROYnlnNUdNbHBrVnBLTkQ1OTVmQXlPc1J4QzdRQ1lX?=
 =?utf-8?B?dkp6TEJnNHd3ajYrKzZaNXphOXpUclg1NjIxZzVpaFBRaktmV1JZd0lMNVNs?=
 =?utf-8?B?d2lQcGNhWU9KaC9mTjkvRks5dTVUVlp0R0xsdWVGN09nKzd2UFUxclVQdWVG?=
 =?utf-8?B?UFJZOU5VMGZyRzFaNXVsYitRRkRmNUxwbDAxSXVqb1d3RG03WEVrdHYxUkJU?=
 =?utf-8?B?Rm1CK3BhRUxyaGNTZUorck5BNVdRY2JQY2ZrS1JiblR2Y1Q5TkxBdlRoRWo3?=
 =?utf-8?B?dUxYVmo2SWdKdnQ4bUxtN05KU0lwY3VwRWRRMy9PKzJkcXBkSTBZZ0tSTDdq?=
 =?utf-8?Q?cDpKmyLUgxZP98RfiYjC/uz8s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0060bde6-6c79-46fa-d6e6-08dd9877b00d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:56:38.0252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RvG3IGVno1QFTUtl0Q4JWXYHkmvQhhaEiQfkMm3De9q0W3qza12l0OIZYhH6ARuL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7770
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

On 5/21/25 16:06, David Francis wrote:
> amdgpu CRIU requires an amdgpu CRIU ioctl. This ioctl
> has a similar interface to the amdkfd CRIU ioctl.
> 
> The objects that can be checkpointed and restored are bos and vm
> mappings. Because a single amdgpu bo can have multiple mappings.
> the mappings are recorded separately.
> 
> The ioctl has two modes: PROCESS_INFO, which sends to the user
> how many bos and vms to expect, and CHECKPOINT, which copies
> data about bos and vms into user-provided buffers.
> 
> Restore is handled using existing amdgpu and drm ioctls.
> 
> The new ioctl lives in a new file amdgpu_criu.c with its own
> header amdgpu_criu.h
> 
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/Makefile      |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 247 +++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h |  35 ++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |   2 +
>  include/uapi/drm/amdgpu_drm.h            |  45 +++++
>  6 files changed, 332 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
> index 87080c06e5fc..0863edcdd03f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -63,7 +63,7 @@ amdgpu-y += amdgpu_device.o amdgpu_doorbell_mgr.o amdgpu_kms.o \
>  	amdgpu_xgmi.o amdgpu_csa.o amdgpu_ras.o amdgpu_vm_cpu.o \
>  	amdgpu_vm_sdma.o amdgpu_discovery.o amdgpu_ras_eeprom.o amdgpu_nbio.o \
>  	amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
> -	amdgpu_fw_attestation.o amdgpu_securedisplay.o \
> +	amdgpu_fw_attestation.o amdgpu_securedisplay.o amdgpu_criu.o \
>  	amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
>  	amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o amdgpu_dev_coredump.o \
>  	amdgpu_cper.o amdgpu_userq_fence.o amdgpu_eviction_fence.o
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
> new file mode 100644
> index 000000000000..dbd2d5049eb6
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
> @@ -0,0 +1,247 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> +* Copyright 2025 Advanced Micro Devices, Inc.
> +*
> +* Permission is hereby granted, free of charge, to any person obtaining a
> +* copy of this software and associated documentation files (the "Software"),
> +* to deal in the Software without restriction, including without limitation
> +* the rights to use, copy, modify, merge, publish, distribute, sublicense,
> +* and/or sell copies of the Software, and to permit persons to whom the
> +* Software is furnished to do so, subject to the following conditions:
> +*
> +* The above copyright notice and this permission notice shall be included in
> +* all copies or substantial portions of the Software.
> +*
> +* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> +* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> +* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> +* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> +* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> +* OTHER DEALINGS IN THE SOFTWARE.
> +*/
> +
> +#include <linux/dma-buf.h>
> +#include <linux/hashtable.h>
> +#include <linux/mutex.h>
> +#include <linux/random.h>
> +
> +#include <drm/amdgpu_drm.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_file.h>
> +
> +#include "amdgpu_criu.h"
> +
> +#include <drm/amdgpu_drm.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_exec.h>
> +#include <drm/drm_gem_ttm_helper.h>
> +#include <drm/ttm/ttm_tt.h>
> +
> +#include "amdgpu.h"
> +#include "amdgpu_display.h"
> +#include "amdgpu_dma_buf.h"
> +#include "amdgpu_hmm.h"
> +#include "amdgpu_xgmi.h"
> +
> +static bool is_import(struct amdgpu_bo *bo)
> +{
> +	if (bo->tbo.base.import_attach)
> +		return &bo->tbo.base != (struct drm_gem_object *)bo->tbo.base.import_attach->dmabuf->priv;

Please only check import_attach here, the other check is not really valid.

And BTW please make sure to use checkpatch.pl on those patches. That looks like something which might be complained about.


> +	return false;
> +}
> +
> +static int amdgpu_criu_process_info(struct drm_device *dev, struct drm_file *data,
> +			    struct drm_amdgpu_criu_args *args)
> +{
> +	struct drm_gem_object *gobj;
> +	int id;
> +	int num_bos = 0;
> +	int num_vm_mappings = 0;
> +	struct amdgpu_vm *avm = &((struct amdgpu_fpriv *)data->driver_priv)->vm;

Please sort that in reverse xmas tree order.

E.g. longer lines first, smaller last.


> +
> +	spin_lock(&data->table_lock);
> +	idr_for_each_entry(&data->object_idr, gobj, id) {
> +		struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
> +		struct amdgpu_vm_bo_base *vm_bo_base;
> +
> +		num_bos += 1;
> +
> +		vm_bo_base = bo->vm_bo;
> +
> +		while (vm_bo_base) {

You are not even remotely holding the necessary locks to do this. You need to grab the VM lock for that.

> +			struct amdgpu_bo_va *bo_va = container_of(vm_bo_base, struct amdgpu_bo_va, base);


> +			struct amdgpu_bo_va_mapping *mapping;
> +
> +			if (vm_bo_base->vm == avm) {

In general please don't mess with code in a different component. E.g. for that here you should probably use amdgpu_vm_bo_find() instead.

> +
> +				list_for_each_entry(mapping, &bo_va->invalids, list) {
> +					num_vm_mappings += 1;
> +				}
> +				list_for_each_entry(mapping, &bo_va->valids, list) {
> +					num_vm_mappings += 1;
> +				}

Using the BO state machine is a very bad idea, probably better to walk over the VA mapping tree.

> +			}
> +
> +			vm_bo_base = vm_bo_base->next;
> +		}
> +	}
> +	spin_unlock(&data->table_lock);
> +
> +	args->num_bos = num_bos;
> +	args->num_vms = num_vm_mappings;

Those informations become invalid as soon as you drop the looks. Stuff like that is usually not an acceptable design without explicit documentation.

> +	args->pid = avm->task_info->pid;

This is not something userspace should know about.

> +
> +	return 0;
> +}
> +
> +static uint32_t hardware_flags_to_uapi_flags(struct amdgpu_device *adev, uint64_t pte_flags)
> +{
> +	uint32_t gem_flags = 0;
> +
> +	if (pte_flags & AMDGPU_PTE_EXECUTABLE)
> +		gem_flags |= AMDGPU_VM_PAGE_EXECUTABLE;
> +	if (pte_flags & AMDGPU_PTE_READABLE)
> +		gem_flags |= AMDGPU_VM_PAGE_READABLE;
> +	if (pte_flags & AMDGPU_PTE_WRITEABLE)
> +		gem_flags |= AMDGPU_VM_PAGE_WRITEABLE;
> +	if (pte_flags & AMDGPU_PTE_PRT_FLAG(adev))
> +		gem_flags |= AMDGPU_VM_PAGE_PRT;
> +	if (pte_flags & AMDGPU_PTE_NOALLOC)
> +		gem_flags |= AMDGPU_VM_PAGE_NOALLOC;

That won't work like this in some cases.

> +
> +	return gem_flags;
> +}
> +
> +static int amdgpu_criu_checkpoint(struct drm_device *dev, struct drm_file *data,
> +			    struct drm_amdgpu_criu_args *args)
> +{
> +
> +	struct amdgpu_vm *avm = &((struct amdgpu_fpriv *)data->driver_priv)->vm;
> +	struct drm_amdgpu_criu_bo_bucket *bo_buckets;
> +	struct drm_amdgpu_criu_vm_bucket *vm_buckets;
> +	struct drm_gem_object *gobj;
> +	int vm_priv_index = 0;
> +	int bo_index = 0;
> +	int num_bos = 0;
> +	int fd, id, ret;
> +
> +	spin_lock(&data->table_lock);
> +	idr_for_each_entry(&data->object_idr, gobj, id)
> +		num_bos += 1;
> +	spin_unlock(&data->table_lock);
> +
> +	if (args->num_bos != num_bos) {
> +		ret = -EINVAL;
> +		goto exit;
> +	}

That approach is complete nonsense.

The input arguments should just give you the maximum size of the buffer, never an excapt size.


> +
> +	bo_buckets = kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL);
> +	if (!bo_buckets) {
> +		ret = -ENOMEM;
> +		goto free_buckets;
> +	}
> +
> +	vm_buckets = kvzalloc(args->num_vms * sizeof(*vm_buckets), GFP_KERNEL);
> +	if (!vm_buckets) {
> +		ret = -ENOMEM;
> +		goto free_vms;
> +	}
> +
> +	idr_for_each_entry(&data->object_idr, gobj, id) {

You can't touch that without holding a lock.

> +		struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
> +		struct drm_amdgpu_criu_bo_bucket *bo_bucket;
> +		struct amdgpu_vm_bo_base *vm_bo_base;
> +
> +		bo_bucket = &bo_buckets[bo_index];
> +
> +		bo_bucket->size = amdgpu_bo_size(bo);
> +		bo_bucket->offset = amdgpu_bo_mmap_offset(bo);
> +		bo_bucket->alloc_flags = bo->flags & (!AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE);
> +		bo_bucket->preferred_domains = bo->preferred_domains;
> +
> +		if (is_import(bo))
> +			bo_bucket->flags |= AMDGPU_CRIU_BO_FLAG_IS_IMPORT;
> +
> +		drm_gem_prime_handle_to_fd(dev, data, id, 0, &fd);
> +		if (fd)
> +			bo_bucket->dmabuf_fd = fd;

Complete no-go to call that here.

Regards,
Christian.

> +
> +		vm_bo_base = bo->vm_bo;
> +
> +		while (vm_bo_base) {
> +			struct amdgpu_bo_va *bo_va = container_of(vm_bo_base, struct amdgpu_bo_va, base);
> +			struct amdgpu_bo_va_mapping *mapping;
> +
> +			if (vm_bo_base->vm == avm) {
> +				list_for_each_entry(mapping, &bo_va->invalids, list) {
> +					vm_buckets[vm_priv_index].start = mapping->start;
> +					vm_buckets[vm_priv_index].last = mapping->last;
> +					vm_buckets[vm_priv_index].offset = mapping->offset;
> +					vm_buckets[vm_priv_index].flags = hardware_flags_to_uapi_flags(drm_to_adev(dev), mapping->flags);
> +					vm_buckets[vm_priv_index].gem_handle = id;
> +					vm_priv_index += 1;
> +
> +					bo_bucket->addr = mapping->start * AMDGPU_GPU_PAGE_SIZE;
> +				}
> +				list_for_each_entry(mapping, &bo_va->valids, list) {
> +					vm_buckets[vm_priv_index].start = mapping->start;
> +					vm_buckets[vm_priv_index].last = mapping->last;
> +					vm_buckets[vm_priv_index].offset = mapping->offset;
> +					vm_buckets[vm_priv_index].flags = hardware_flags_to_uapi_flags(drm_to_adev(dev), mapping->flags);
> +					vm_buckets[vm_priv_index].gem_handle = id;
> +					vm_priv_index += 1;
> +
> +					bo_bucket->addr = mapping->start * AMDGPU_GPU_PAGE_SIZE;
> +				}
> +			}
> +
> +			vm_bo_base = vm_bo_base->next;
> +		}
> +
> +		bo_index += 1;
> +	}
> +
> +	ret = copy_to_user((void __user *)args->bos, bo_buckets, num_bos * sizeof(*bo_buckets));
> +	if (ret) {
> +		pr_debug("Failed to copy BO information to user\n");
> +		ret = -EFAULT;
> +		goto free_vms;
> +	}
> +
> +	ret = copy_to_user((void __user *)args->vms, vm_buckets, args->num_vms * sizeof(*vm_buckets));
> +	if (ret) {
> +		pr_debug("Failed to copy BO information to user\n");
> +		ret = -EFAULT;
> +		goto free_vms;
> +	}
> +
> +free_vms:
> +	kvfree(vm_buckets);
> +free_buckets:
> +	kvfree(bo_buckets);
> +exit:
> +
> +	return ret;
> +}
> +
> +int amdgpu_criu_op_ioctl(struct drm_device *dev, void *data,
> +			    struct drm_file *filp)
> +{
> +	struct drm_amdgpu_criu_args *args = data;
> +	int ret;
> +
> +	switch (args->op) {
> +	case AMDGPU_CRIU_OP_PROCESS_INFO:
> +		ret = amdgpu_criu_process_info(dev, filp, args);
> +		break;
> +	case AMDGPU_CRIU_OP_CHECKPOINT:
> +		ret = amdgpu_criu_checkpoint(dev, filp, args);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
> new file mode 100644
> index 000000000000..01677072f0ed
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> +* Copyright 2025 Advanced Micro Devices, Inc.
> +*
> +* Permission is hereby granted, free of charge, to any person obtaining a
> +* copy of this software and associated documentation files (the "Software"),
> +* to deal in the Software without restriction, including without limitation
> +* the rights to use, copy, modify, merge, publish, distribute, sublicense,
> +* and/or sell copies of the Software, and to permit persons to whom the
> +* Software is furnished to do so, subject to the following conditions:
> +*
> +* The above copyright notice and this permission notice shall be included in
> +* all copies or substantial portions of the Software.
> +*
> +* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> +* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> +* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> +* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> +* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> +* OTHER DEALINGS IN THE SOFTWARE.
> +*/
> +
> +#ifndef __AMDGPU_CRIU_H__
> +#define __AMDGPU_CRIU_H__
> +
> +#include <drm/amdgpu_drm.h>
> +
> +int amdgpu_criu_op_ioctl(struct drm_device *dev, void *data,
> +			    struct drm_file *filp);
> +
> +struct amdgpu_bo *bo_from_criu_global_handle(uint8_t *handle);
> +int insert_bo_at_criu_global_handle(struct amdgpu_bo *bo, uint8_t *handle);
> +
> +#endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 4db92e0a60da..1b8154395615 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -53,6 +53,7 @@
>  #include "amdgpu_xgmi.h"
>  #include "amdgpu_userq.h"
>  #include "amdgpu_userq_fence.h"
> +#include "amdgpu_criu.h"
>  #include "../amdxcp/amdgpu_xcp_drv.h"
>  
>  /*
> @@ -3021,6 +3022,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
>  	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ, amdgpu_userq_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_SIGNAL, amdgpu_userq_signal_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_WAIT, amdgpu_userq_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_OP, amdgpu_criu_op_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>  };
>  
>  static const struct drm_driver amdgpu_kms_driver = {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index a2149afa5803..a8cf2d4580cc 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -45,6 +45,8 @@
>  #include "amdgpu_dma_buf.h"
>  #include "kfd_debug.h"
>  
> +#include "amdgpu_criu.h"
> +
>  static long kfd_ioctl(struct file *, unsigned int, unsigned long);
>  static int kfd_open(struct inode *, struct file *);
>  static int kfd_release(struct inode *, struct file *);
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
> index 45c4fa13499c..f7c3b160f396 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -57,6 +57,7 @@ extern "C" {
>  #define DRM_AMDGPU_USERQ		0x16
>  #define DRM_AMDGPU_USERQ_SIGNAL		0x17
>  #define DRM_AMDGPU_USERQ_WAIT		0x18
> +#define DRM_AMDGPU_CRIU_OP		0x19
>  
>  #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
>  #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
> @@ -77,6 +78,7 @@ extern "C" {
>  #define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
>  #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
>  #define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
> +#define DRM_IOCTL_AMDGPU_CRIU_OP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_CRIU_OP, struct drm_amdgpu_criu_args)
>  
>  /**
>   * DOC: memory domains
> @@ -1626,6 +1628,49 @@ struct drm_color_ctm_3x4 {
>  	__u64 matrix[12];
>  };
>  
> +/* CRIU ioctl
> + *
> + * When checkpointing a process, the CRIU amdgpu plugin will perform:
> + * 1. INFO op to get information about state that needs to be saved. This
> + *    pauses execution until the checkpoint is done.
> + * 2. CHECKPOINT op to save state
> + *
> + * Restore uses other ioctls.
> + */
> +enum drm_amdgpu_criu_op {
> +	AMDGPU_CRIU_OP_PROCESS_INFO,
> +	AMDGPU_CRIU_OP_CHECKPOINT,
> +};
> +
> +struct drm_amdgpu_criu_args {
> +	__u64 bos; /* user pointer to bos array */
> +	__u64 vms; /* user pointer to private data */
> +	__u32 num_bos;
> +	__u32 num_vms;
> +	__u32 pid;
> +	__u32 op;
> +};
> +
> +#define AMDGPU_CRIU_BO_FLAG_IS_IMPORT	(1 << 0)
> +
> +struct drm_amdgpu_criu_bo_bucket {
> +	__u64 addr;
> +	__u64 size;
> +	__u64 offset;
> +	__u64 alloc_flags;
> +	__u32 preferred_domains;
> +	__u32 dmabuf_fd;
> +	__u32 flags;
> +};
> +
> +struct drm_amdgpu_criu_vm_bucket {
> +	__u64 start;
> +	__u64 last;
> +	__u64 offset;
> +	__u64 flags;
> +	__u32 gem_handle;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif

