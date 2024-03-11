Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA1D8786BE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 18:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F6510E8AE;
	Mon, 11 Mar 2024 17:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="txaR7T4E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBE110E7E9;
 Mon, 11 Mar 2024 17:53:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4oGMgune31lH2UEYi3ECF4wuHSRhxnlZ7ifVrjLrYD/74b2hN+hk31vececGZCPw9p6ZVPXSkTNHzWyrzsjbc5H05RDAO0xmx9Uft6XLxmsWpwDgoXQOvkG0p5Z21DWCvhVukReCdXWyHMazL/MS4ML9/xA+xAzKi4Y+ByP6HcxWnoOuCCUYdxWN1NQPkFDsWl3CdygyL7Lv+lcdQ7kr+2dg3OhjiBHCVeyIjQKQDIoFQXX1t00No7zueakTcGR0qBto0NpnWLz4kHkAvRXtt8nDm6FXEIFeqnim2F/3c3MGF83Mf5VGgEiXwhcpeKOnKucNTdtzG27kOdYjHbCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RE93fuFQII58KMsWvEkHZhB7aaBgFa+z1ntygROVoCU=;
 b=XCI6++w7AN9+qGDiQP3XfC/ywTwSLQbEc1pO6UzTpEVIYEu+X781xuSNod7DLZZvkeH51eD/R5KZtuJJkoAT6hZTZy9x5/D94EUtkrVPu3HKxTQl/yO6iInuRB0PfNGm1JQuJcQ37QJjEiKy4YpqCTcnQXqq4kKUzEiV/BYb68j7EFrSRiuC/jvG3cVucPNhshNXxyNHGjq/89TJg0ruSVG9YAcXX6vzhmnV2ZZekOSUWs8bC4qlZ1H365MJhhbhHYt5lfheHSzcdqZ1XXGa/hPS/XC5anGaTFK0twNFPm7+1BiDHD9VTTFxm+cSqGartCoydOr92k1v/vjXU33ZLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RE93fuFQII58KMsWvEkHZhB7aaBgFa+z1ntygROVoCU=;
 b=txaR7T4E1UfzEOdAhJxyno2lLwctKP5TADwmnzgVDVrhkNX4DrO8+Q7/sR0A/WSi7KHvwLU5uEdI0Ox62/jUiz7v54V6W9H93zqvZB5zjqJnt4E4Oxwvb28WyTxFcwWpJxoqdErawpCylpp8Ynky1//bXShXH78/6B+UMxAJmEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW3PR12MB4396.namprd12.prod.outlook.com (2603:10b6:303:59::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 17:53:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7362.031; Mon, 11 Mar 2024
 17:53:16 +0000
Message-ID: <16c80cd7-9b1a-4361-bf00-9b1ae49ff653@amd.com>
Date: Mon, 11 Mar 2024 18:52:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: add ring buffer information in devcoredump
Content-Language: en-US
To: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240311151109.5336-1-sunil.khatri@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240311151109.5336-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW3PR12MB4396:EE_
X-MS-Office365-Filtering-Correlation-Id: 811de83f-acb4-456b-8f99-08dc41f42127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xVeyoAleG6BZX64HK6hq6vWbrQDrxdxu+pwd0hSjJbx+VthTbskP89yiUnA/dxgxa8bR/AMEJ7fk6SvIsbKNcDu5UaqzHicliOJEYlAM7SBDpBOO4G+NKqLO2kWvIpZszGaQu3F7pdMCzyvH2DB0SnkbDfRAQr/sr7gPg45i/kgICwKUsVtrI0H9xrLMC+wahgdPXelRpWocuwHe1vTPnE8OK7pdZ00/VCwYt6fNOIOL4d+Rxf/g5HV9maKEcMP360sulT5oDYOk4UJCVGEx/xDTEHNA64t39RvDS2/CJSVDopW+B2h3B6s0SuXldwOoTT+X4HNLj781uPotwQfC3xqx+AftdI/7MxW5UW2BEgK1tC1zRy4eExRMzXiX53rV81MjlIqoFNxjecDYNytV171LlKCUUyQzoXGI8ucvBY0WPs/GJE2/FmEbORXJK4dTxUIG1qcaM52dAp6t06lPLzXrg0g5DjoVuc8GdUEYxF/VCMAhqhAJr7g752XNZ0MWBPX0G2ZgMa+PMjuZ3D3/T0kQ7gtjZRv0dtuorJZ5BdJllEmNUoJieT5p6EC9GQweylLUBu4iHShKjRGBibuWZmqWqJzQE6w1yKhdwPZ+zNBoB+UmsDDcgRxvUm3VLz14Rv6pHOVglgktsMTQTTYcPG0332SqhYMNjvLoVqWWtXg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0RqUTdjTkFVaHU5ellPSWNGUTBqNktKc0dURk9jVC9kODU3c3hxZU5hbE9D?=
 =?utf-8?B?dmRiUERGdWxzTnh6VlFFcCtXVnlrcnMxYWV5ek5nbFBGYXlBWWtOdTF2ZXVw?=
 =?utf-8?B?VnRSRElrWUJiWnNseXlpRzJZYmw4ajFhYTJ5a250N1F2b0pzNkRmQTRBdTY3?=
 =?utf-8?B?WDR4SWNTZnEvUy9oSmQ3YjRObnRFM3ByejQrbzU4MEJpZzIxaVZwL3o5ZHND?=
 =?utf-8?B?RFh3TDl6ViszM0EzTStWVlByaWJqcVdyRUlMa01wbnVEc1NNNUFhenBjOG5q?=
 =?utf-8?B?RGNPdkxVV2RwK2RjSDBpNXNHVGJxNUIyM1lHdElDcW9WNUVXNlpCTUJIaVlH?=
 =?utf-8?B?eXVOZFZsbTRmZmt0cy8ySjdBU3pkNnRJMnljS0NWRnkxTWphNkoySDlkNk9Q?=
 =?utf-8?B?dXZRalJoSzUzLy9hVHRPZFoxSTd4c3ZmMHlCNlc2YTNxNFU5WHFaVHhsMmQz?=
 =?utf-8?B?ZVVxRzFrTFZnUXVRRnBBOTNUMTVVaTd1eUU1MDJEUGRjS0ljTlRyajJRcVBO?=
 =?utf-8?B?ckVCOW9INnZhQW5LL1gwRi9GRHBnNmVNbks3cjF5WGhNQjltMjhIcGUyU290?=
 =?utf-8?B?Zk5ySlBGVDVJRDNxdXpTbXp6WWxGK3c3S1lmMUNUeUhVOGJYZkY5bHllZXJ2?=
 =?utf-8?B?cGQvVU4vUTdGbkx3T0xwZVZ1SjcyQlFselRWaElzaDZ2ekFxQktIa0RkalAz?=
 =?utf-8?B?bDJ2NGdTUFZRWGgyRlFoTzc3NkVGenoxWjRvQ2l4RkNYMGgvSzhPRkRYMkdv?=
 =?utf-8?B?N1dnR0lLR2FZb0U4eGUyR3NWNzdtNHBFbmNMTnVSRUVlVWQ5N2ZKcjRLMXE0?=
 =?utf-8?B?Z3AxUVdocmgwaHRIK3VveHloMzRCWHVyRjZBQlFnRVpEREc0UnhoL0dJTUV1?=
 =?utf-8?B?MzdGRjFmZzZZWXc2VnJNVGZKekFLczVoR2dsVW4yYkJoQm9jRldXUTB5bEJK?=
 =?utf-8?B?QU80TEdNNWxDeUQwK2d3T0ZSdjk5ZXdIM2lNRVlDOWMyZUxVYzI3SlpPUndx?=
 =?utf-8?B?Y3MzZ25Mc3NmRTB5WEQ4MWczZFdsdDBzcmFVNmdIenAwS2dXVnVMZE9wMUpV?=
 =?utf-8?B?QlRuQyt1VWppSEdYOThvOXVVbHl6eXhTYkdiYWNzcjFhVDNZOEs3Z3RoM1E0?=
 =?utf-8?B?TFhDMU94eTV3eTFic1p2eEU4bUEvVjRrU0NOZGkwOXJtczROM2FjT1MzUW1F?=
 =?utf-8?B?NDMwMXAwWjZGQUM1WHhVY1Q0d25NeDJiMTd4bHk1NUdTbTlQODA4bmIvRjRz?=
 =?utf-8?B?dnpkUzcvUnhkUFVlTmV4UzhGT3p4aXVvQmVBYUZDRUloZE1SZlR5b2lvbTNS?=
 =?utf-8?B?MEYySksrQUUxK2I1SU5nL3R2VzRObzRzeEh2aFBISllwOGlPSnNzamtCNmZT?=
 =?utf-8?B?QjFnTnBkQjFYMmRrMm9wNlN2OHJzVXM3RUNNa2Z1SE9zMWZUK3BVaXUwL1Fj?=
 =?utf-8?B?UjZIZ2h6SU1JVzVNS1VKMEFzdVUyanVPZVBMVlhPZmpsZjk5YW01akxoM1dH?=
 =?utf-8?B?bnprUW1tS1plQXJYZm93Mnl2QWxXS3NXUjhVL0tNMWU0Y3pWektEcTRKampQ?=
 =?utf-8?B?UDlUOTNLU0lJbFVzeWt4WUl1UGhnL2lqOE1EcUNpcWtDVnp6NUIvRElrdGh0?=
 =?utf-8?B?bndyd2JjcWpFZ3ZTc0tvMkJ3UXdNVCtVUmZUdmhZRWpDSWRiT2RjQWlrbGto?=
 =?utf-8?B?S2NlWWFIVTlBSVZhblBta0JyTDVJazFPTHpQUnFzc1JETU4zMUZXNCs4MkJY?=
 =?utf-8?B?RTVNWnZzQ2tDZFpoY1ozNlV6QnBNK3crcEZoV1gwekl2d25MSDJ2bUV1aGY1?=
 =?utf-8?B?SWdHTHJsYWhPYWNKR0hwU0V2RmxJd21CK2VURjE2ZXJkZE1FL0pVOGUyRFVh?=
 =?utf-8?B?MDRCNW92YWlCQ1RmOVZkT0VuL2JpNkV0Ym1oN3M4MkM1dG9Na1UweHRYUWVB?=
 =?utf-8?B?SEJSdUk0OEZycnhESEJLRlUxL3p4dGJ1ZERsSXFNWW1jMXpRREhzclJhTkJN?=
 =?utf-8?B?MVFnYmNmOHB4bE8zY3BRUmg1R3RRVmw0YkpKemZoR3lhQjFCdkZjT2duOUdk?=
 =?utf-8?B?UnRTQ2VFYWdlRG94bUZQVWFCU3QwN1ZIUHl3a2FZb0cxVzdkWHRZY1Y0QVl2?=
 =?utf-8?Q?dn3egcX2Pwem55tDN+XKD86yu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 811de83f-acb4-456b-8f99-08dc41f42127
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 17:53:16.5850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5cR+V0oMfLUvkyqpfSh73vqT9sb1N92wGsPC0JUk77uWBnfYo01/Ls2TvnGIHx4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4396
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

Am 11.03.24 um 16:11 schrieb Sunil Khatri:
> Add relevant ringbuffer information such as
> rptr, wptr,rb mask, ring name, ring size and also
> the rings content for each ring on a gpu reset.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>

I think printing the mask still might be useful, but that's just a nit pick.

With or without it the patch is Reviewed-by: Christian König 
<christian.koenig@amd.com>

Regards,
Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index 6d059f853adc..a0dbccad2f53 100644
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
> +		drm_printf(&p, "Rptr: 0x%llx Wptr: 0x%llx RB mask: %x\n",
> +			   amdgpu_ring_get_rptr(ring),
> +			   amdgpu_ring_get_wptr(ring),
> +			   ring->buf_mask);
> +		drm_printf(&p, "Ring size in dwords: %d\n",
> +			   ring->ring_size / 4);
> +		drm_printf(&p, "Ring contents\n");
> +		drm_printf(&p, "Offset \t Value\n");
> +
> +		while (j < ring->ring_size) {
> +			drm_printf(&p, "0x%x \t 0x%x\n", j, ring->ring[j/4]);
> +			j += 4;
> +		}
> +	}
> +
>   	if (coredump->reset_vram_lost)
>   		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>   	if (coredump->adev->reset_info.num_regs) {

