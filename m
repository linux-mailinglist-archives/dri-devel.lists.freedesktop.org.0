Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E88667C498
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 07:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6BF10E0F1;
	Thu, 26 Jan 2023 06:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E7510E0F1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 06:59:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQM+4CGk1K1XxXL0Pe6oh7FOHkFbHKBxkPnHVqF+9en0V1JieH2UenaP9qpzmyYImdcAxvje+2lIu+Hx1SjnGYicx/xzyS3QrVLCdhsdIPtoek332kJBS9DDnuhHLghZeT2Y9VSDsw4sUpInvBpURSG/bIgHaLF9B7/EZzaskk9DJGCtg3njRN7gNnlhtH7R/fXtXTzP5ey0Cl6sUmX9/0IJFVb+Rj8gG+NmzKTPypSRK+qtg27zuQwddMXTd/DFzAJuCd+ndKZh93HsanxXlvfbOK/8NTo4pPW9deLmJ4P82ossAv/bY5eWAO+D4QT8KvlPKj4buzFJ7rDO82C2mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNuexUBkUh+A6GNqEqHVPsbMDsnacyJLlHRvY8kEjgU=;
 b=FADZ9xwZyFq1WzuQFBmbLlfBjg5LgXyWl9N0u7GV8DbThs4sm8d6kdK9CpnvBguHwbfMCiLEwpVp4X5ZxtdMEtz1xaBlihc/efQGxEG21YbnD7lNPqB2SKCJnQDG6i+XOrB+oqX+ppyme6zYEQMpB+Fiqk4l04yn5dXRUV6GESdAcyFronKH1Zn4wK8jNHEkQI12/tp/6/K9hqDPXQqYLbjtGcAD+MhNeAyncY4AGg7SSjbxvAhNjbbpkNfyjFAtUyVYER3fLfYX/WJWNmnpAH76c+eiitsolmUMouPoTXwr2STEhRj7cxe1qgFoDDMsaDPDOmEgAp/9x7WRht5zvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNuexUBkUh+A6GNqEqHVPsbMDsnacyJLlHRvY8kEjgU=;
 b=sC9QJq0Ldi5HsaLS45mCQIBGK5RHLSenx0BwvzuBd4NNAxaTDQqU6AFLnecE6OKKl1zP6b067hq5qVWd6H0W/8YOjfPyvNsu4Mw+HUuaFQ+IHsHnMjnQl2jPTDNytGbhuban58ti9bUme0FKVfNx4fp16VaQhIgsZxiuaLHGg5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB8250.namprd12.prod.outlook.com (2603:10b6:8:db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 06:59:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.017; Thu, 26 Jan 2023
 06:59:00 +0000
Message-ID: <4b13c48e-1677-3947-42e5-5ba241bcb96a@amd.com>
Date: Thu, 26 Jan 2023 07:58:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dma-buf: actually set signaling bit for private sub fences
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, Arvind.Yadav@amd.com,
 sumit.semwal@linaro.org, gustavo@padovan.org
References: <20230126002844.339593-1-dakr@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230126002844.339593-1-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 33da7f99-88eb-4a1b-04a3-08daff6acd20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bWsJb/KJw/HDtOkEKB8a3rz2d5GSJMMkWHvKJwgOBMSyigzoVuKILtIjgh8xoVNMpAjcWFJxT4EJdit6c7NJH+kMVr/Kz2W1HzR00gEnMTXicmvDWCjtXPhsB/nNTI2IwtPh2ag+85kyx+BZlzXYhCIk1+d8Qm50nASJ4Z7mKDqyRbtu1ZgWtQrJ+e+iWUexDtQK252gAyRUoow9Gg0z0JYm2z9ZRk8i9lgqNK9FO7arr6GipaEWouBzVLu4MrpE0pcF8Sg/YmyV8mlo4Niu4Sqna6BciLBHj8EDpoBqHD/knODLhhiEi2J68+6aWt1btf/lLbP6IXKbHmtZ83pMsGNdxsGmc8ZW+R1atBocdzCD4QqIgVr1JgdUQwJ9gBfZwrlxkt7k7GQxdfyyM/kOof0bCj5lSrbM6vZADfYVy44/mqQU4AGyNXytsbWS8xtUcgm6AxOBU5bjK/zDZeymUigd7XkvGyacmk68y/xvL6jOo17tPOJ9wUtustuHEJQgQqVKArvgN8rpGGB8f6TQgOHHRuHKrIc3YX4NnxXbXvR9utkZW+UooCdtNLYceE1wFXwXj+fl36nlt92jL/MXwfX1ytRmJCyK47lhzhUUBjLWXu6wkGeQJ3oG5mawHQG/w+XlJKxWxuung3zWRIonbUmObkMpW0f/VkNFgFCPVKYQjaMMgevTV9hXI9Z/bo7QcA6OMuNCFm3I6cF6L5h/swpxcwl1/h9A3m0Bs160E0A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199018)(31696002)(36756003)(4326008)(66946007)(66476007)(86362001)(316002)(186003)(66556008)(6506007)(26005)(8676002)(6666004)(6512007)(6486002)(83380400001)(478600001)(5660300002)(31686004)(66574015)(8936002)(2906002)(2616005)(38100700002)(41300700001)(4744005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDdtQmRBWEVhaHoxZCtWQXVSZGNOTHNZTE9QanpPVWc4YUhwbWRaWXlWMnBI?=
 =?utf-8?B?TGlJOXhpWit6WDQrTXJIN2hMS3p3Z0VKWjZIVVVBajhqRmc3NVByc1NGT085?=
 =?utf-8?B?Rkh3ZTRpQjN6RzZRazh0SVYxU25yeDZEK1h5cHluQmxYVWJjeThyYXBtclNL?=
 =?utf-8?B?dTRLTmV0ZDNlbnh5NVJVRStLNkk0ai9QdWFyalgvK2ZsVUpDeG5vcmlHTllp?=
 =?utf-8?B?dzdIc2pwSExRNU5vczA3R05pYTBZVWlhRW9vNzFVNzdkbXhVd0N1MFBZOG1j?=
 =?utf-8?B?RGJUZnRoNzdadko1elJmYlA2N3JSN2NxT3lXTHVDMjJiMHdIeVV1QWE0akNL?=
 =?utf-8?B?NFdoQUp4WTBXVlNQTGRuWVBtUmxobmk3THI1N2xyMzhtd2FWM2dJQWErRHEy?=
 =?utf-8?B?ZWJuejdGY3AwdHZtN3hKa2g2WE8xWTYvSm83WXhnTDI1UnNBY01XdnRCdlRV?=
 =?utf-8?B?cktFT0ppNWZQejRQcXNmbjBMRFNUdHl6eG1lWFpEK1JMcTVVRzAvblg2b3NU?=
 =?utf-8?B?L1FOSjRSNVp2Z3ArdDE4dEc3VVE0NUgvbGMyTURMSXdXaEpCOVd3bVVjcnBp?=
 =?utf-8?B?c1pzemZaS3dZMnJ4eW1EY0VlRkk4NGFDZVRPMHd6M1l2U3VwYkFrTjYvRmxN?=
 =?utf-8?B?Yi9kYU1POUVrYnM4RHhiY3lEek52THJ4TFF2K3VBSW9laktYZGsxQ2JXclNP?=
 =?utf-8?B?c05nalF3OXFIZlU5eGFZZTk5Z3VMNUR3NWZlaFVYdm5yb3ZFY0huY0R3WTZp?=
 =?utf-8?B?NXNoREw3enF6dTVxajdVb29qOWNacFRabTI4MktEZy9PRTlVMmNGNUh4QWhC?=
 =?utf-8?B?K1BmZmQ5NG1DMk1meEY1ekdBT2pqNm05MXJvaHIxemRaeXBpaGx4YlFFN0Nz?=
 =?utf-8?B?ckpNL2N6aWUxaGFHMjQwVUllZW5PWGJaMTBvLzc3OUVWZU5TWmxWZlczbUQ0?=
 =?utf-8?B?cE1vQjIzWnBvdlpKUHQ1Q0hSV3p1Nmw5N0RWK3daczRrMExxWjZLWnJhajRa?=
 =?utf-8?B?RTFZZ2hIUmhsVmZHb0luNVVyTE01Q2pnb09CWEdoVlphVFdlQlRXd1N1ZHV3?=
 =?utf-8?B?cXQ2a0F0dFVmWFF6d2RJS2RkNWdZbk1rSHluSXRYWVhRTTJlbVk0ZXBiNWFD?=
 =?utf-8?B?L25yRldCT0JwOGVNbXNGVkVqdjB2UE01cjJFakFXY2krOU1BbTh4UDMzK3A4?=
 =?utf-8?B?c3FtTmNkQjA5bXlFc2JnUGdIWGNEVlAzL1pxWFF4SHJ1dkRhRW9xSUIwNTBo?=
 =?utf-8?B?dEI5dkdJTFQ5aVprYkVSbDI3RzVMbGQzVzFFUVJZY3FCR1lIMzZrQ0N3RW8x?=
 =?utf-8?B?clZUMnRpSGpTZUlCcmFGYWxHeFJwUExIR3JzOTFmY0ZsYzA3aE44SDFpbzV6?=
 =?utf-8?B?MEFwMFpmaDlLNmNkWW1aTWpOM3kyempiN2EvZlg2enFEOEU3SjhNT2cvcmVs?=
 =?utf-8?B?WktMVzNNQkFFOVVFWFh1eXhUWFpNZm1kbmlPeUZtQUdqaUQyWllXNmZvSjNI?=
 =?utf-8?B?Ky9ZRk8vNG0ybTgwY1h6NXd0eDI4RmtWRXFzTVVxajVLaXVYbEk0WHRUaXJ4?=
 =?utf-8?B?akgwWGpNNENVa0V2cUgyaGpHWDJkdU5DMURFMU9DUDA2NW8rZnpKUFZiNlZE?=
 =?utf-8?B?Q1NjMzZIb2F3M3V2eWV4TmJwMi8yR2o4Y1VEZWFJMXJVbTJ0MTBoSi8xN3dQ?=
 =?utf-8?B?d2JwZllTcFlUaUxYbHV6U0F0MTVnK2U3bzRua3A4elBNcmI3VFdxZmd5Z1BO?=
 =?utf-8?B?cnhQcUJ2S2I0eDdWR2E5bStJZ282bVpWTXQvZ0NqamQ5WXgrclk2UlozaUNE?=
 =?utf-8?B?YlRnNHBiYWpXWFdBNVJGaVlnc0N5Ymd2WFJrNXJpaEVkV2VsZkY3NGY3ZlpN?=
 =?utf-8?B?Q1VwTWFlQ0dLOFhoT3l5VHY4dlUzY3lVbWZhcWZaYVA1Z0tBdkZxVjByekR3?=
 =?utf-8?B?alZmSTJUbWR4bDRjb1BFTWNFUHlsY0hFejc5N09pTTZqY0JJTjFuUndJeEZv?=
 =?utf-8?B?eHZ6NGtSdDNVZ2pIZ1ZFY2YyMkpDaE1uL08weUJxY1YyZm1xMlROSlVEQU83?=
 =?utf-8?B?cHlHc2tTQzFhMXZhZndOYmFObjRPVGU0YWRaa3lxTVVGbWQ0eGs5WVQrdVcx?=
 =?utf-8?Q?/s+KEhE9gxcZeOEfh1Yz1BbvD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33da7f99-88eb-4a1b-04a3-08daff6acd20
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 06:59:00.3296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9RByopz1bg9iiL3LOgOEVg+qvJ9PrzUWhNHMNw+VDNLFf0IEDp8MSSFcwYmI1oC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8250
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.01.23 um 01:28 schrieb Danilo Krummrich:
> In dma_fence_allocate_private_stub() set the signaling bit of the newly
> allocated private stub fence rather than the signaling bit of the
> shared dma_fence_stub.
>
> Fixes: c85d00d4fd8b ("dma-buf: set signaling bit for the stub fence")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Good catch, Reviewed-by: Christian König <christian.koenig@amd.com>

Should I push it upstream as well or do you have commit access?

> ---
>   drivers/dma-buf/dma-fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 406b4e26f538..0de0482cd36e 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -167,7 +167,7 @@ struct dma_fence *dma_fence_allocate_private_stub(void)
>   		       0, 0);
>   
>   	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> -		&dma_fence_stub.flags);
> +		&fence->flags);
>   
>   	dma_fence_signal(fence);
>   

