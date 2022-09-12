Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CDB5B568D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 10:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1E010E139;
	Mon, 12 Sep 2022 08:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133B210E139
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 08:46:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjSSg7wLxVIA1PXV5O0Imb3lrunFex/e2n7MrySB09VosvZSwzZBIsRIfHCjgW6snGQKcfI31OsLT4S7JQ2M7UviIXi8XvUD4Xjlxy15bSpknthbed6k6xVhQQ5QhPTXBvj5xw0t3F9WrSRBV+nH6ep7kCyRMJ6E0e8ZsuL5/dBxWEFULpC/XSWWkfN3idE/4hzWT1ho4mHauVhfNCfwCy2T/S/AolTjYoEo3KR4XmECYapY6igSPIS1VkQs18N+CYDYEwlbviZAvf+v+WqhYzITz5pKS2hInPxImlL1G1QjaARISCjD7SJe9urhR1Lc+4tu97xhwBoQ2gtydu7g0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AvaD+Od7kEpkEcgX8efmRPp2wVyvDO4Q9bF2yB1qa4=;
 b=A3C5NRPx5thzLNtcyEICkLOoSSGHQlboBAMebXM5GPInwISVfSfVr3gnnShKGSz2STQhN+8CO8rcPf1xIYAnQPAuOLGLhuQGLN8STeaDYsXEdejq3xIwzjkCjLBXF1tLeaB1ciiY2jXgtJIKAFO946ERSfuZQhpBqhHd4B6hzdTwIwyXLH09suXgCW0NUIb/D3dHz//uJiNu4uE6uxk6QB14I3mhkv/zNHmRgudRGzZnh+5rAxqadh1SiLTLTA2ILgqIbrCKOJf2L3UN35iZhhwQ8ns+ztUNkt00SmBA4B5OR/sPuaxkgJ3pO23TvQb/SSYx+viODxkT/s8jqxOVfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AvaD+Od7kEpkEcgX8efmRPp2wVyvDO4Q9bF2yB1qa4=;
 b=eHrsVn6DKwbQ7XleXhXwmROqlfZTthJRHVMhAjZqvtGYhC9q0SznoirGZUZFF6pGgYRhcOb12vVtr5ivxmeVWCB5+96HD65hQdHsVzCwYpDvoHRuka1xA7y9J1QWx9MqoeHJdVl2DCqVcKwDlzTevhKeUOZ00thieBc+XwgXEvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5323.namprd12.prod.outlook.com (2603:10b6:408:104::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Mon, 12 Sep
 2022 08:46:54 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 08:46:54 +0000
Message-ID: <df4b1511-f2d8-2e9b-e4ea-78e5671f059e@amd.com>
Date: Mon, 12 Sep 2022 10:46:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/6] drm/amdgpu: Enable signaling on fence.
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220909170845.4946-1-Arvind.Yadav@amd.com>
 <20220909170845.4946-5-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220909170845.4946-5-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0003.eurprd04.prod.outlook.com
 (2603:10a6:203:90::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BN9PR12MB5323:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ff00ee-4e90-4e7f-5eb1-08da949b57df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NeqtDzj20cVXHfHFajdmzXrPbm5yI+LTgpiljtDpledPGNouqZH2aEAIPqoiFBnVNVEwBmDEY5z6X5V6l8z93bR95224U3UG4YQraGnc0VUj74mPWiapOFdz5FGop6Cj3vLMmVr8LFowiLECrwlEbaBNbTSCK/PTdKzKqM2WPRq5R2wroaZnlgrZ03VrXI0WRGmeVLUH81qLLJCaiIUNJUI5tQw+M9+c/vRu502u0xen19wBCMC7VO56YkxpWbFBw01ZAQpYCW5mjAC95FrWI5I6NdvsuWhSOY66doopLvgFGpP2HHxS+jd+E1BLIN9OaANkCC5azi1dnfypc+znzy4SLpwNwXUM8OoSt75uDFaKvpC5uGnoPwByVbdCpSVGqDxS5Vt6RSVOpfS0rrZjl2pG2+mmRKJ41uJVqjoEIsk9bNz4frb9SvyjlagWsfSRcEF++MKz1KGROxoZxvTl7jEiVLXqYxtUIQRgOtMWHgY0YXIfNDP/rDgyjXKqbMuCQa6hWjADSCovMwUhfcXS9sBYjxheKGVKPvoNvGhmw20XkK/Q2+bQm+aXw7ln3Q2eivElik4p6BquhaUdOoQczcv8fqP4n5bcF+fOh35Lljd2AHp+W/xalhhsv0B0T9nTIN6pSasa5JDAhz14JsH/OQSwcbaoLRdig0YKFofg2gTxQ4RVRELAwlF8PZgASpuqDITm6SENM82+0+asJDaeWrF3M3DMrOrKpNntSbbTN/4dnsx1aAjBH7e920OkziUX72GVoJMtv68N3UOQZXt4aYxoPYIx4lyVz95dpkuxFo2i6qQG3VKcZm3r2F/IQTQ0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(83380400001)(38100700002)(5660300002)(36756003)(8936002)(2616005)(921005)(186003)(316002)(66476007)(8676002)(66556008)(31686004)(2906002)(66946007)(41300700001)(31696002)(86362001)(6512007)(478600001)(6486002)(6666004)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aiswQ0FzY1loQ0R2eGtrMmxvME1HVXlQWHZGeGdWM3IrZy9TUm5tU1BQYzFt?=
 =?utf-8?B?dUxJRGk2aFV4TmtSMEFReDEzTXJyNzVhN005cmZZeVZ5dlVjazgxK3hNM2pk?=
 =?utf-8?B?Qk9USnpQN2xZSWlZMW1mWnpzT2FQekRTb1VjTy9MZHYxY3hIa0d2QjY4S29a?=
 =?utf-8?B?VkE5Y1FhOW1oSldUMERVSm5idkJDazBPU29ac2VleS9ZTnB1MHZ4bThwWTQ4?=
 =?utf-8?B?OVRoc0Q2ZlVabHpNdStXblQ4dUhCbGRUdUJXOEVDYkUrK3Z1blUreE5obW5D?=
 =?utf-8?B?aCtTdHZMdnJaM2JSTy9HUG1QSHZhU3FwaE9seFZ5ai9aVTVnVkhBWkdjSklv?=
 =?utf-8?B?ajYxdWFkVGtCa3JlWnFjN2lVeHBXOWpYbG01T2hsbjk4VWp5V0pLUmVmR0lz?=
 =?utf-8?B?dTZtUVBVa2VST2RPanFwbDJuSHJkREN4QkxIZEtweGpMczRPUHFUSXJuUVZF?=
 =?utf-8?B?N01wb1g2RWdDTUxkWVhBbUoyR0l4OW5kY0pmZXRWMjZRNmFIVmlhbDdveURw?=
 =?utf-8?B?TEdDNGVNcnlpd3ZTdXd4UEgrdVlkNEg4VFVFMlFqeXlZS3NqU1RzQVR4Q3RD?=
 =?utf-8?B?SGNHUGxzWXppRzRLYlVtVTFZRG1raE9qSzNGeVZwK1d0VHRrbHVJT2VMMWox?=
 =?utf-8?B?OGN1akVQTCszU3BCZGZEdldQYWl1OVRKdUJRQlUvWlJ3Ykd6YzNHMVgzc0hs?=
 =?utf-8?B?UFE0OElCTUdjdG9IMFRuejd4Y2hQUktnMWZmUjlZOHdPeU9rQlJic0Fvenl5?=
 =?utf-8?B?VDJRSllFRkJqVDU2T1ljQlBabkdpbUJUa1NkTVNZUHVMc1Nmd25NcHhWVzBV?=
 =?utf-8?B?anVQanF2Mk9BVnF0VE1GRko5VzhOUWg4QmZXZWxwWnJEb3ZHZjhKNG0rK0pE?=
 =?utf-8?B?ZWZ4b0dRZmE0NmdrN2hhaThxbU8yZGZlZStRaGZvTlFiaWtJRmNnZzRwWEtt?=
 =?utf-8?B?UC9HbFJ6RTJIbHJYMG1WMmR0bjhNNXdQcGVsWjFubVNWemFhc25GVkVlUU42?=
 =?utf-8?B?UFNhaFFpWDlHUDBJclAzaEt1N1Zpclk5OThEZ1ZkOUtxQlgydXEzNGhDcmll?=
 =?utf-8?B?Umcyc3BrN2RWWW5yZkRxVzRPckZzTzVRWnc1ZnBJS3pKVXMxcU81UnNObEo3?=
 =?utf-8?B?UmVwRlhob0lmMUJEbW1ocVNwazhvMVNTVWJOeFdWK2VtQlBEb084RFNCU21p?=
 =?utf-8?B?UG1ZTktTcWVxNllvZXlBT3BVaG5RRzBTNmxBeHMvSjRBYzVmcFgwb0F2SHR6?=
 =?utf-8?B?VUFlWUN4TWtOUE5QM05memZBNUY2MjVqRmcyenpNUzBMWFNqUWRSWk1sQkF6?=
 =?utf-8?B?bE1SZ1ErbERKUXBQakRzS1B5aUF5ZmJZMU1aUlpncWd5YWg5YjNvYnJ1MjI3?=
 =?utf-8?B?d21xcEJweFR2QnliSy9XL2k1d2JYLzN2VDY0OFpsQ0tKMWRqcWgzNUZSZ2V3?=
 =?utf-8?B?ek5Ja2RnZTNQMVYwbG4vNTh4eVJkNW9SZUhwZFlMcCtFdHRtdkZBR2FtZFh4?=
 =?utf-8?B?UG1xcnNZM2ZyMDFmWmxyZmlJa2hvTGxMVTVUVXcySGJ4MC8wQlZYZGhUZ2Zz?=
 =?utf-8?B?TlpyRlQwazJCWHFrZkZmUHhoYzEzRzhIWEVRNmgzeGJSVHhoTWRDcDFNWjNE?=
 =?utf-8?B?Y2JvRTFwVGZSNHZvMkFDcXlrZGhpZzBLRElGS3NuMG5uUmYwUG9KTnJPK0lT?=
 =?utf-8?B?Y3lVU0FWRmdBa2N5NlhzK1pISGVxMXFHbW9XSEJ6WXRNRm1Qa3R0cEZ6aklo?=
 =?utf-8?B?NXEzWGo3eEpUWHNVZnRXRHdHZm92TjFGVkNiWUNxVXgwUnR2RmRrRXB1Mzl0?=
 =?utf-8?B?QkNuanV3Tkw3di8rWUh3RVFSS1dkdjFSNUF2YXRNZUJZQTlhSmttWURjc1Zq?=
 =?utf-8?B?ZWNWREZsbTV4eFkxT2N0UHlyQ0kxbHYwTUwzRjJ4c1llUkVuN2x6TWhGZ1Fp?=
 =?utf-8?B?UHlvbjV6d3NDd2tRdEI5V2FyU09LZU1OZkoxWjJtUlgxTzZyZVo2UTloWlN0?=
 =?utf-8?B?MlFEeDljaXIwTi9lQ1NOSm1LcUNwaTQ4UkhXVTRIbkxqYmZBRS9VcHdHS1hk?=
 =?utf-8?B?Y3FwZDVWVW9IWnphV1paSFBvekVCZzJPWFhlNWxnblFvbGRFTG9RaThUdm1E?=
 =?utf-8?B?WjB0ejRlWjZKVm9LeTBaSExHSnpIcXVCb3c0NlBqS3EzeXBiMlVFd1hOS2Nl?=
 =?utf-8?Q?h/HZC4q8rBnCwgIxQ5JMfZ2k6kACBNqTqiM1m0apjZnI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ff00ee-4e90-4e7f-5eb1-08da949b57df
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 08:46:54.3788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BIkBHiIQ8RB6k+6/tDdVFvVy5C/bS12EyF0/wEQYY6RYGSIwHqEwJ+Hgn4Q8dYC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5323
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

Am 09.09.22 um 19:08 schrieb Arvind Yadav:
> Here's enabling software signaling on fence because
> amdgpu_ctx_add_fence() is checking the status of fence
> and emits warning.
>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>
> Changes in v1, v2: This new patch was not part of previous series.
>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index afe22f83d4a6..21221d705588 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -730,6 +730,8 @@ uint64_t amdgpu_ctx_add_fence(struct amdgpu_ctx *ctx,
>   
>   	dma_fence_get(fence);
>   
> +	dma_fence_enable_sw_signaling(fence);
> +

That looks like a step into the right direction, but still isn't correct.

The code using this interface should call amdgpu_ctx_wait_prev_fence() 
before calling amdgpu_ctx_add_fence(). And amdgpu_ctx_wait_prev_fence() 
in turn calls dma_fence_wait() which should also enables the signaling.

So when we need this here something is still very wrong on the logic :)

Thanks,
Christian.

>   	spin_lock(&ctx->ring_lock);
>   	centity->fences[idx] = fence;
>   	centity->sequence++;

