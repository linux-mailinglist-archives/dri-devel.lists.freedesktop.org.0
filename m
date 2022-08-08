Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD3A58C386
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 08:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3110210FC42;
	Mon,  8 Aug 2022 06:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8AC14B13D;
 Mon,  8 Aug 2022 06:51:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKgLBpjYxl3ks/LIJkqRL8eCHI6w7KorKQJg5Zm91RuR4O9IA8BfeDThiEnJEJcQkP2dupyw1RTJ9o1kpdAR4e5nYQG3T0M/+NughAJ937mBNe0fNa0l58/brz422KFUWQZaeiAogAo6bc0bc/ZqnydjaRvG4YczcH1795+8LaMKXV7ZAOW3XBbxgvGT9PPsp4c7tqzm+dKAG43mYAxG4XM3NOktjtsPKIEMWgz/tpjEHbqMV89clC6GC4b+CP+Y8x4WTiFPp15XO5eAJmA3nva0ZV52IQVv78NmmB16o+4SQIUl45zD/NnFtO3EYgwC5ua1DH+ik45g2o88L7c/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7PeAeJJhqmCceTi+w+Vs4frEI5RxJaWEEG4PhH/RhI=;
 b=HwoRB6KvJUE2YCvdLrl33kUj9M2K9Zr8pMNJhjQX658Ev0Tsh6rMuZJ/DBVf2A80yRzLHIV4cR4ZQGMEA4WDV0tn0WGftwtLXomLLNxXXV3wXCM+8Kx5CmMVzlScomqq+r2R/LjAdjhkvNoXdSIRHkOND4mh6EI5e6MPrSIhlqPmmh6nRTUFC5Ii+vee9FVFtPIp47eXWXOgd+ij6ebiLRBPzeExSbbhsw988TsGpWd7FmsFmxk48W8RVJ1JNAuAokTSo8b6ffRIzgxXrot6RAk6CLVAnny+1Pvka2nRz6pzyoG7qAqpyv7MDxZiM5t7AVhy0G22opEaufJfG6RzWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7PeAeJJhqmCceTi+w+Vs4frEI5RxJaWEEG4PhH/RhI=;
 b=Y6G3Z0iYSZpaHLDW+C+dHY+P2vDi9e/SWBU9wGkvtzTXSGNYC7Awz25ZrvMDkPPHB5HXgtT0ac6/JqiEyhICquP88n6oRFxG/SAHQbjR/rOPSMC7KoUUaUm9+OX+EkMzTWgw8642qoD+LeGXVAIniO2OS0Ab2kikETn89AQPvx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by SJ0PR12MB5488.namprd12.prod.outlook.com (2603:10b6:a03:3ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 06:51:28 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::a8e9:62b7:e65a:1887]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::a8e9:62b7:e65a:1887%7]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 06:51:28 +0000
Message-ID: <fc8c3406-8aa2-d3c3-f133-7e2f15889adb@amd.com>
Date: Mon, 8 Aug 2022 12:21:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] amdgpu: add context creation flags in CS IOCTL
Content-Language: en-US
To: Shashank Sharma <shashank.sharma@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220802135558.6324-1-shashank.sharma@amd.com>
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <20220802135558.6324-1-shashank.sharma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::9) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5693f673-9027-4a77-fb52-08da790a6af1
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5488:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GIn0yZAjC7kyIujNTTEV2Xnul7qMv1Wan/K7t9cm46cz5WvMuLgUvKEcvzR4l+w2xjwnkbaJnitDrq61/Zgfu42y8L5K0br+hVms12drkXymFfy3OJCV6cP3H4ndcN0jERsVU64Jx3aKtdwc2F6MXOb/znn01WhLn78ktQMvYyMNWvWVkFFvnBGTfgK8hGN9D3P20cY1O3idpMCNkG4PUlpYxVIjO8d3No0v6654NzXVgRB9GzLTgNPCDTpXhAtoFOUoP9QqIJTP0e6cJY/FuoWSnUcL25Q3dNzkbyg0wf2YYAL7yJ0PBU6whWo/ZlEWDwLry7n3BadIS7PV32asHyemhIkKWxJQpBOEJery46tizGrsEzUbAvoXcXX4wZj2jNH3ut8Dlqb7S4lIPFQGcNXbUz2Q4wn1mCIio3rq+I0yBJgSbmU4k+uB79WlPXgGF234bIkqycbwVBmyRivt9scLFEqcLVmKsGk1pgna/OeonMTGQ3RjLjjoS2Dcn/8GN1T2ktekv31DadqkVN4fjwhmVT/TFQrdjM2cxndXUyn3VCL4giHITRWUYlpKvBsmN0HCXzfd632rx/ON+sfy+VlGMb8PygdpzrCPLSKY/T8nrd5nqiz+5wO3gsL08iNDiJuTxDAvbN+BKlOM22McFB3WHfPmEAjpwyj4Gm/ysu97UQg64Yz7EC2P1uBwn2T1pJIEYwWn8qHkzXp7qwXPvTZ/OQ2diD4a2fVtIVekH6MCk8r5aBCYkwNpY5c6XSflCrxolOOMZFBJ8SRc37a4JJCxN8R6oBJ90x2FzHn2Z0yyO/KUcW5PZuNTNcct5453NoFOPtvYwjQcZ71H7i2nvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(6666004)(2906002)(53546011)(6512007)(41300700001)(6506007)(83380400001)(38100700002)(2616005)(186003)(6486002)(478600001)(4326008)(36756003)(450100002)(8676002)(66476007)(66556008)(8936002)(66946007)(31686004)(54906003)(316002)(31696002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q29iNDh1ZjU4K0dYcFl5SWt1M0g2WmFXN0tYdlhiWnpRcEU2bnZJN2FDNTdV?=
 =?utf-8?B?amVTTnRyK1lhNVdBbFc4UU8wR28vMStpSG51QlZVVHVYc3E3WS9OUzJBTnoz?=
 =?utf-8?B?ZVBpaWFZSWpZeGxTWDR2dFhpS1BHSjV5TXJ3SFlBZWlManE4SUl6RG9KMUhu?=
 =?utf-8?B?eUI4RDRYdGRBVXlUTW9RdDFRU3JtQXlTR05yZ3ZoL0JaSU91RHMzMVRaeXgx?=
 =?utf-8?B?Ykh3NkJXOExJenNZSUVrajJScVRMc3RReTJVZzRxNkQ5bkV2YUJReGZUSFdX?=
 =?utf-8?B?dEJ3cUhBWlBJdzVMVjV0OWIxd1Z3elY5WW9uL3paQmlqRFo2YVNXQ1hzdmpK?=
 =?utf-8?B?TnBLQWpnNElmcTJBNWRJUDFXTzl6WFo3cUhoOVdxV21vdFBQejZxdU1rOVFZ?=
 =?utf-8?B?SU4xTUtOY2E1SysrZ0dEMzRHN1JvNnFQZU4xMjVHRFdOdVdzYVpzQTNMQ25o?=
 =?utf-8?B?UzdkRU5BNk1HU0lLKzZYM2tSckZZZzZHVStJNjMrRVhZZnZFUDJHbndDM29y?=
 =?utf-8?B?M3BOMjBuVDFnQlJMUUpOUndZVGM4YlphcDhvTDkvV2Jja1NtWDI2cWNLWlha?=
 =?utf-8?B?THpjcVJLSFVNMVAyMWV0WW4vM0F0M0laa0c1cW94aGFQcVhHdnpwYWdodWpK?=
 =?utf-8?B?eUVjUkwvOXdyNWJlQ1JtRmtTaDVKcitVd2c1MUxZTUx3aDZKekwrdnQ2NTM3?=
 =?utf-8?B?SEtEVW9icWQzY285Z1E1dDQ5WTZjWEJTMGh2STlHQVNMd1gvSnJaS0NNMnVr?=
 =?utf-8?B?cHNZWW1HZGRPbXY3eDJKZEMrdW1IWXcrQ2Nva3lvbDZiSGo4NzNSNFM0dzZp?=
 =?utf-8?B?L0dQREt2S0k0b2ppUU1SS2tmaGh6VHhRN2QvQ0VoQTdEUVQ2NUtodXhsWDZv?=
 =?utf-8?B?Q0ZvNEtuMXo1UzMzSUhsQjlwZXRrbUlRTXpPUHNuL0Rxd2JJaElYS3pINGVt?=
 =?utf-8?B?K204ZWZpV0FPTUVaOHVGV0Z6T1RSR2J1bjEyL0lBcGlUVTVranF1b1E0ZVM5?=
 =?utf-8?B?T3pBeTlUdVozVHhlNVN3L0ZIdkQyZkRVSTRLVTRhbmNMSUduUFp3bHlyQ3c5?=
 =?utf-8?B?YkRXQ1B2RTNNc0pYbFNFVkZFc1ExQ2ZXK0Q4emVwMXJKMkRaUlJQc29CeXZQ?=
 =?utf-8?B?dS9Gd21IZUhXSms0MXBEbTA1UCtHT2NXdThPQjZ3N3h1OXZRYUR4WW5tellJ?=
 =?utf-8?B?Y0J4bTlGOStjM0kvR3BHamlKdk1pdkYyR1dFNmQ5ZUhiRVNacjJSVEJrV2dk?=
 =?utf-8?B?bTVMOEprUEliWms1Nk4xZnR5K25VaU01MHlBUCtwQXkvT1JGS1lrbURydENN?=
 =?utf-8?B?UXhYRG9ZdWZQZHh3U01NcU5lVzFoRjM5YUZpbFNiYkhrZlg2YnZHTzBudFJT?=
 =?utf-8?B?UzdDVXNzR2QwRDRLTjJFS0FGRFJqWVFjb2d4amtwdHE5NDVKZXJxVEJWaTlD?=
 =?utf-8?B?NkJHSWdwa3cvLzlNL0VVZ2c3S2FSc3NnNUNuSXBXU3pVRm9hSnM0S2FaRkhN?=
 =?utf-8?B?dzQvS0RjaHAwakxGZldkdFA3Si9SUFpuUXZZNU1BR2wxUWtRbDJNWmMyMzFt?=
 =?utf-8?B?aWNiMkloSjZwZTFGM1FqUTFDaVlheWJlSTcwcllRWmpKMlRGcnlpbWFDUTFu?=
 =?utf-8?B?THhGejVVSVluL1RXS1lvWGZKNzNqclZFQi9mS214N3cxck5QY0RvZzlHNzFt?=
 =?utf-8?B?eGJOM2F5SDRSRnVneDd0a05Ua0piWm90OXRGZUQyVWpKc2c4OTFEUzlpYXBj?=
 =?utf-8?B?ejZpbnNYTHJNNnBNZ0wyWWw4VWNKT0hkek1KTmx1YzJWMzh1RUJlVGEzWjQ1?=
 =?utf-8?B?N2VpV2hSU1V6Y09iM2t6S0FZSWtZQlpPVDJPaG1qOXc3OERVL2liK3BRbTFU?=
 =?utf-8?B?VmI2L0RvWThtVWR2bFdpQTIxbWg3Sm9KTnozcy9CRUtFKy8vTjBCYW9OMVRw?=
 =?utf-8?B?ZFcybFpBSkdtY1VUQ2tBT3ErL05lbU1UTkRqcmY0T3ljNlJaVU55Mit5VDFz?=
 =?utf-8?B?V1hOMWhReWFabTRwZE5oMk1mNDhiZ25yT3Q2N0tMOWdPeDNaNC95SHYwL0pM?=
 =?utf-8?B?Y1R3VU9PQjBXa2IxbFJmS2UwV1dvMFdaRTl0ajRaZnNlNlJ6RzJqUldOTElW?=
 =?utf-8?B?TGRSYmV6RkZrQlprSU5VS1g1TUV2cnJyRFkrWUVKOFRCV1EyQjBmcUNPTW9D?=
 =?utf-8?Q?2SiUq41k09omU+nOphcFWaKRNS6szfMrb+FTQnLPqW2g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5693f673-9027-4a77-fb52-08da790a6af1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 06:51:28.1285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJQT1VoCG5uD1Y4X+diQiSQnmSXHFkKpMBJ4iScu7On6agQQW+plrctDapKiZuoauaFuT0QJXVJwPcCKwm3fCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5488
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Marek Olsak <marek.olsak@amd.com>,
 Amarnath Somalapuram <amaranath.somalapuram@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/2/2022 7:25 PM, Shashank Sharma wrote:
> This patch adds:
> - A new input parameter "flags" in the amdgpu_ctx_create2 call.
> - Some new flags defining workload type hints.
> - Some change in the caller function of amdgpu_ctx_create2, to
>    accomodate this new parameter.
>
> The idea is to pass the workload hints while context creation, so
> that kernel GPU scheduler can pass this information to GPU FW, which in
> turn can adjust the GPU characterstics as per the workload type.
>
> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Marek Olsak <marek.olsak@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Amarnath Somalapuram <amaranath.somalapuram@amd.com>
> ---
>   amdgpu/amdgpu.h          |  2 ++
>   amdgpu/amdgpu_cs.c       |  5 ++++-
>   include/drm/amdgpu_drm.h | 10 +++++++++-
>   3 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/amdgpu/amdgpu.h b/amdgpu/amdgpu.h
> index b118dd48..1ebb46e6 100644
> --- a/amdgpu/amdgpu.h
> +++ b/amdgpu/amdgpu.h
> @@ -874,6 +874,7 @@ int amdgpu_bo_list_update(amdgpu_bo_list_handle handle,
>    *
>    * \param   dev      - \c [in] Device handle. See #amdgpu_device_initialize()
>    * \param   priority - \c [in] Context creation flags. See AMDGPU_CTX_PRIORITY_*
> + * \param   flags    - \c [in] Context flags. See AMDGPU_CTX_FLAGS_*
>    * \param   context  - \c [out] GPU Context handle
>    *
>    * \return   0 on success\n
> @@ -884,6 +885,7 @@ int amdgpu_bo_list_update(amdgpu_bo_list_handle handle,
>   */
>   int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
>   			 uint32_t priority,
> +			 uint32_t flags,
>   			 amdgpu_context_handle *context);
>   /**
>    * Create GPU execution Context
> diff --git a/amdgpu/amdgpu_cs.c b/amdgpu/amdgpu_cs.c
> index fad484bf..d4723ea5 100644
> --- a/amdgpu/amdgpu_cs.c
> +++ b/amdgpu/amdgpu_cs.c
> @@ -44,12 +44,14 @@ static int amdgpu_cs_reset_sem(amdgpu_semaphore_handle sem);
>    *
>    * \param   dev      - \c [in] Device handle. See #amdgpu_device_initialize()
>    * \param   priority - \c [in] Context creation flags. See AMDGPU_CTX_PRIORITY_*
> + * \param   flags    - \c [in] Context flags. See AMDGPU_CTX_FLAGS_*
>    * \param   context  - \c [out] GPU Context handle
>    *
>    * \return  0 on success otherwise POSIX Error code
>   */
>   drm_public int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
>   				     uint32_t priority,
> +				     uint32_t flags,
>   				     amdgpu_context_handle *context)
>   {
>   	struct amdgpu_context *gpu_context;
> @@ -74,6 +76,7 @@ drm_public int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
>   	memset(&args, 0, sizeof(args));
>   	args.in.op = AMDGPU_CTX_OP_ALLOC_CTX;
>   	args.in.priority = priority;
> +	args.in.flags = flags;
>   
>   	r = drmCommandWriteRead(dev->fd, DRM_AMDGPU_CTX, &args, sizeof(args));
>   	if (r)
> @@ -97,7 +100,7 @@ error:
>   drm_public int amdgpu_cs_ctx_create(amdgpu_device_handle dev,
>   				    amdgpu_context_handle *context)
>   {
> -	return amdgpu_cs_ctx_create2(dev, AMDGPU_CTX_PRIORITY_NORMAL, context);
> +	return amdgpu_cs_ctx_create2(dev, AMDGPU_CTX_PRIORITY_NORMAL, 0, context);

How do we set workload hint from application, amdgpu_cs_ctx_create show 
have flag ?

Regards,
S.Amarnath
>   }
>   
>   /**
> diff --git a/include/drm/amdgpu_drm.h b/include/drm/amdgpu_drm.h
> index 0cbd1540..d9fb1f20 100644
> --- a/include/drm/amdgpu_drm.h
> +++ b/include/drm/amdgpu_drm.h
> @@ -238,10 +238,18 @@ union drm_amdgpu_bo_list {
>   #define AMDGPU_CTX_PRIORITY_HIGH        512
>   #define AMDGPU_CTX_PRIORITY_VERY_HIGH   1023
>   
> +/* GPU context workload hint bitmask */
> +#define AMDGPU_CTX_FLAGS_WORKLOAD_HINT_MASK    0xFF
> +#define AMDGPU_CTX_FLAGS_WORKLOAD_HINT_NONE    0
> +#define AMDGPU_CTX_FLAGS_WORKLOAD_HINT_3D      (1 << 1)
> +#define AMDGPU_CTX_FLAGS_WORKLOAD_HINT_VIDEO   (1 << 2)
> +#define AMDGPU_CTX_FLAGS_WORKLOAD_HINT_VR      (1 << 3)
> +#define AMDGPU_CTX_FLAGS_WORKLOAD_HINT_COMPUTE (1 << 4)
> +
>   struct drm_amdgpu_ctx_in {
>   	/** AMDGPU_CTX_OP_* */
>   	__u32	op;
> -	/** For future use, no flags defined so far */
> +	/** AMDGPU_CTX_FLAGS_* */
>   	__u32	flags;
>   	__u32	ctx_id;
>   	/** AMDGPU_CTX_PRIORITY_* */
