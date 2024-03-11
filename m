Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C81987811A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 14:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63D8112AA0;
	Mon, 11 Mar 2024 13:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tfPtjYq3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44566112A9F;
 Mon, 11 Mar 2024 13:59:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcusqxQY1nBbTh46uj44Ei2FIz/vFnJ3IHgCkNMU+ezpx8Y2yMgSFSaz8aMX/yJyulEIs+lMjeDN35iO2PneadKKEjgLHlBQ6Ym1X1W1OHypNd+hFT1Cvnc7dPAe5Qo1+cULmxfpy3evOIhuiuxUGer5k5OH//BElQnbi3kW7vO2Nq10CmrUtcJyWv5MVSfrvV+07wftD1t/7zjAccoomX2JwHmXcgYCd9duyiNDcA2kpLSOlPI9lP/7HQrA2Jf3y3b6iPQFqMFTrf5ptY5jZaCqX9rfVElEVyQRlKUUdv65jiB5yVyqRAG7OpxBR/W1HPSBM6QcWfygYMWaFNEmoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEpA20NNDDBs75Ec8GcP8R1IC1Q0+KMRTGNo+rQIID0=;
 b=Zh6/LTpb2yje1fABDvH8W+pJRq/xPFwrr0WS9AHnsUhgWHMZNp0MnHACM4vKXpyx+Sfz0Ch55GDWnbIGYj2M6CRYC2a5Rl2I9wwiENJjfF+IbAXo6EtXkf4sNN0SsMV+qVBjwZ29q0NRlZa5t12M+HkLZwJJVUwYbQvpMyRy+jjvq6kyvk7tBRlvwRH3h8z2+ax7OYQc14Hb24UL53OZPXGH7UaUMYS3jHxMVOAAnEH4VCxRrWdBgoUiFp7MhiReF+QsF3p6sXaqDNgMHv0Dv3ZJSLYQs5IQRFYUSqYX5kvOZwDrRlUHJGUfp8hAIb2amiWQCqAE71h93P6Px1Bk1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEpA20NNDDBs75Ec8GcP8R1IC1Q0+KMRTGNo+rQIID0=;
 b=tfPtjYq3oq1SVdRFC5qJ27H+wcffrDxsV3A8A1eP/25D1wPbL+0hoQ/MdM9WvsuIlmlD4tsKGmAKCYkkZCNfNFJ0l2HHwtzXTmoSx8OrDs7g1LjHuXyG349RhJTd7ZvKJpo2bR6KH719PyF87KCMSl+syH29t9/1b81wsYqFsjY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8525.namprd12.prod.outlook.com (2603:10b6:8:159::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 13:59:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7362.031; Mon, 11 Mar 2024
 13:59:32 +0000
Message-ID: <9e1dbcbc-f00e-417c-995e-d9c539292e03@amd.com>
Date: Mon, 11 Mar 2024 14:59:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: add ring buffer information in devcoredump
Content-Language: en-US
To: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240311122212.13713-1-sunil.khatri@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240311122212.13713-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8525:EE_
X-MS-Office365-Filtering-Correlation-Id: 1536601b-3968-42a2-f81a-08dc41d37a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eO12heOxhspDA7mnDtPt0q6fEqvI1rFuKetoaLs+C0dCRpH4BJrwLBQbYNd3n2wJ8vr9zxWpFKH2tt5F7IarVyUV5FOlWPPThPRrOhAOGurE2fX+rqu+e5RrIy0e5SBL1nLRL3SZlYTc6bT9I7LOxZMkpLmdxl3POENi5Xbu5p9xeBPuesPiiKwm429trKncPwurS/t+XJzsJ1iMfvcytDe7P78o+UBQ7p/RKVZFa7qP6uQ+CATOFLoQC4CdJhLy5wWG36Xez0kdC9XPbhPTjvapOpo2dSpcIe8b4df0pQGuwN608HcyZpqFYhF50qhuUrM1panIp4yEnDipMQeRnbdhAtPC0v6SjMLIvDhzhCgAaDfD9KKQmxrMUCyW2qXDPi3LO0Hzd6W+bzaeRpJ4pZH5ghDOXSUiwdC2kDD0ImQ4LsYQdJiBDnfpQ1EvD6snxyMlZPY/NaR0iWQtdCDwvRPtJCZ9IhN0ZC3rrnjfZunyKHRW4xHBfGathRZamefbLofK6Iz0QXgUOomnoiUlHcWBpTAFh8NQcCxIdPkR4CD6ra/CMihMEXbEE86QIdwruOH+dtNTtpsMg6V0fbP7xq/ZGLTM7M/fe6HhUjxaEKWwUgKl2i7yoVjvKlx/NFajCiGkLSkgErTuuRJGtBGJr3JByVVuZcRhaDCq0mSQaK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2lTZlgwWmpMdHhqeTV6bW1PYWJrUitmZmhKUDFmcjh2NHF1THBvR0M2K3dS?=
 =?utf-8?B?d3NCdUFnSzZRbU5lVk5qa3dSUHJyL0VEWFFpQmtYMWdnMzNhZnN5WncrOHVN?=
 =?utf-8?B?b1dIamp6ZVhybHE1NFdudTBCKzRyZXhZRlR5SUFCOVVhSmMrdEtWN1c0MGlG?=
 =?utf-8?B?RVE4TUJJLy9sYm44SUE5VkNRa2FxS1R1NmhGT3FBWUxJVUF4MWprRkcvNTht?=
 =?utf-8?B?cmN6d1pTL1NnV29VSDUxa25jdXc3VjZyNGR3QmIxa2tyd2dmMkkyUXF1VVhu?=
 =?utf-8?B?aC9DS0trTUhycGpsQWxLL2RyM1JpdnlNMjEvekU1YXpsQUtlRjd3Vnl2MXh2?=
 =?utf-8?B?U0Q4RWJjSE1SOWp0RkRDQWMrWDBiNzJSNUwwYzRKSnNDc1dUbXJXSlFVU3Zj?=
 =?utf-8?B?Zk8wdWR3WU1YNFFQa3FObG5wSG5nTHNqck5LZXVSRCswckN5NG96amFaS01S?=
 =?utf-8?B?NTZwaGpJam1WRDd1L0E3UVgxSEtsOHY2ZkxnMnBlN2dCK1VjYW5tSk9VS3VX?=
 =?utf-8?B?YTZkT3lienFRNEFXOVVQbmUzQjd5TGsxL3M5Mk5PRkVBcjBxMW9QOEpOQjFi?=
 =?utf-8?B?Ylk0R2xNZmxOK0kwZVg4QzhFVkpKZ0w0ckEyaE1mQ3VZdGVGQSt1aEhVVnBa?=
 =?utf-8?B?cVpCS241R3NBYlBmUXh6U2RwQnlYdE43Y3VoWlFHMTBlM3IxUXU0bGpPK1Za?=
 =?utf-8?B?TG8ycTB4dDRkOTI1ZTlPazlIMEhpeEc3MGRQdGtUcXBQbkVQMmQydGN2T0E3?=
 =?utf-8?B?NXJmYjd1MklkcmRVVjUzVXFYMklSeXRQcENpMGplTDBCbWpWckNJUmdQNXIx?=
 =?utf-8?B?bHpZa1BtNjRtVk92cVRudjhmRitZK2pZMW5ZeThxMkRudzdsVmh0RlRicXRL?=
 =?utf-8?B?Rmw5R25XQUhXL0w0Qlc3NnFTZFg4dHU5ZDEvemJjYXZSVlBDdy9yUVJZMzQw?=
 =?utf-8?B?dFI4c2FRcXkxL2RDaW1IVGNKUnQyZzYvNEhNK2JJU2U2T0JDVzdjQ2lWbGVk?=
 =?utf-8?B?RDhmZkZJSDlWU0podFRHQldpenJLaDRJbVFlVlliMkVjcnZnSUdwRTN4SEdx?=
 =?utf-8?B?dUNTK3lTVUYrN0hLbW1jNzZ6ZXBHRmROTEZ5cUlTWC85WE54TXEyOUk0ZHkr?=
 =?utf-8?B?UmQ0MHgyNGQ5OGY4ajVHRDJWTDF1N0VVMXZkT3UyZmtVL0VvYWhySXcwMHIx?=
 =?utf-8?B?OEQzOW1PRXVKVTZwMmlnS0tnS3NyRzBHaUEyZCtZS3o1YzdtSVdwL21OYUxB?=
 =?utf-8?B?NmNKamgzZ3phU1l3ZHBTT3VtV1pWRWJFTXRtQ1YrOEJpdDBtaFdoWU5zWVo4?=
 =?utf-8?B?UW9GSmJnS3B4c0huMFUxOWdsKzMrQWdIUWRHRVQ4TU5SQy9XRy9TWDBUMWpJ?=
 =?utf-8?B?SHdRRTBjUGlzbVh1OTZGcllKNk10bkRyWEJHQ21XRmRjc052bXRJaElCZFJz?=
 =?utf-8?B?akRBc0h4VmFMN3NERVJYR0cxandPQjBDR3NZT1NFZ1g5ZVNOeXZrWTV2a2dY?=
 =?utf-8?B?VEVJWjd6Y0xCU1BhQ25zVFh0aytSWUh5VytHQXZmd0J4WmN2TGJGSkxMM29X?=
 =?utf-8?B?N29aVlc0cnJlUmdvREhnRlhPcmxnSDVLekNvcDA1NjAzNG8rb21DOWdDS3RK?=
 =?utf-8?B?emp2RFRTUTlHQXhlYnB1UmxMYjYwNExycW1aVUlqQ0oyL3NOM056NDhZSWdY?=
 =?utf-8?B?L3pUd2dCNWFPT2RQWjF3UTk4MVRhNS92RkdsYTBpKzlDWTNYTmlBMTR4UkJC?=
 =?utf-8?B?eTZFcERzbEQrajBreTk4UkhLUUNSUDErU0RwT1NGUGpkT240WG9IN01nUWl4?=
 =?utf-8?B?cTlIdDFrT3NjeDIwT3oyMzV6aHhMSHRCaDF0bFZmOTR5MlRQRDJKYmdoT1BS?=
 =?utf-8?B?Z1dQaGQzTXRKNE8xQS9LcS9tcUd0MXhETDdyNEVLK0pQRXRtdXI2b2c2RWZp?=
 =?utf-8?B?anNPL0FBQkZ1bGNGRmFYYjJyL1dySE9JeFZZakJTT0FwOE1JWjBFOE9SdGFp?=
 =?utf-8?B?Q0dMeXBoZjE2NFhULzBTdUFqRXlGaGhETFhiSGJxWXNyQjZ0R1J4cGQzejdD?=
 =?utf-8?B?VHdSdmxxNWduY2pGNDEzSDQ5OHEwb0tidTN5M1J6dERjODJxa1pHRTltYk5C?=
 =?utf-8?Q?Rvlez9JwMhOKjKygZRJ9d2cA+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1536601b-3968-42a2-f81a-08dc41d37a53
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 13:59:32.7210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8RtJ1/CHr/w6dmeOtaxDOGuQSh1ygj82x/Q0wS/8OClJfMfLr6/Z/nEmzAsmF55r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8525
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



Am 11.03.24 um 13:22 schrieb Sunil Khatri:
> Add relevant ringbuffer information such as
> rptr, wptr, ring name, ring size and also
> the ring contents for each ring on a gpu reset.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index 6d059f853adc..1992760039da 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -215,6 +215,27 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>   			   fault_info->status);
>   	}
>   
> +	drm_printf(&p, "Ring buffer information\n");
> +	for (int i = 0; i < coredump->adev->num_rings; i++) {
> +		int j = 0;
> +		struct amdgpu_ring *ring = coredump->adev->rings[i];
> +
> +		drm_printf(&p, "ring name: %s\n", ring->name);
> +		drm_printf(&p, "Rptr: 0x%llx Wptr: 0x%llx\n",
> +			   amdgpu_ring_get_rptr(ring) & ring->buf_mask,
> +			   amdgpu_ring_get_wptr(ring) & ring->buf_mask);

Don't apply the mask here. We do have some use cases where the rptr and 
wptr are outside the ring buffer.

> +		drm_printf(&p, "Ring size in dwords: %d\n",
> +			   ring->ring_size / 4);

Rather print the mask as additional value here.

> +		drm_printf(&p, "Ring contents\n");
> +		drm_printf(&p, "Offset \t Value\n");
> +
> +		while (j < ring->ring_size) {
> +			drm_printf(&p, "0x%x \t 0x%x\n", j, ring->ring[j/4]);
> +			j += 4;
> +		}

> +		drm_printf(&p, "Ring dumped\n");

That seems superfluous.

Regards,
Christian.

> +	}
> +
>   	if (coredump->reset_vram_lost)
>   		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>   	if (coredump->adev->reset_info.num_regs) {

