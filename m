Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BACCA6AE75F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 17:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B99A10E14A;
	Tue,  7 Mar 2023 16:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD8A10E14A;
 Tue,  7 Mar 2023 16:55:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcI0bejeqO9HLTRcpxOhtrzGBHWmyICUh1vAC7HPGLaZNz2xEAdZ4WJ+49wYi8lDWpQy3gltABjKJYmvF6r7TrRNmY9MyfEJAj6R6hlBsSYixeg4fEN4mzR+xJPpy+sraYFZ+QDh+14rChWOaMC3RgdjtmixlEYOfqBi4KKykltD+u+OJIw6DouuKVlcUGrFTqXwnRnB1otWCYOTBKFBMQ6OI3FIvqjSrHLGSSMDki+dhACSGlpf4UTIHTKHKlEU9I2eqS6VtWIRHvq03FIu4caEm43XpT341fv5d+SGwZ9PfJK6Zqg4UZqddo4ShpIHJ7YOMI3BFqXy+7HQnBUj5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKc+wbTNzv2KeDvPSCyVQ3hoVRI3sJcbwMjxkTEireM=;
 b=i14AhZbLxql28Fh9G25+kMenq3O/KIr4Nn7aXfnvEUdAe7SRM++Ue5jl908PT0lKB7jrdaimxcQVkCM5BblIGJfJ/5FOdQ3VZ1HoHAnPWx/b7LZbeMWU4LYiIrCtNmxJDE9MsCpC1tCRrZZCilLfdSN3pgtei9gO8iEtZ9oaYH4LenL0eG3vIAZS5ufn5XS424hOMf5l/SwNAb1sY7OUcvM0hXJmh5AysyFOQHGE0SltyS3rcenFq6FJMPzkLgAv+2ErMPf2aNhncrw0AMsG52LQH7RaORgXsjJ6gtzzDCpVmpjHorzfamhBCoSLIzOZW/SKZFg0d4JOKo+jO8rygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKc+wbTNzv2KeDvPSCyVQ3hoVRI3sJcbwMjxkTEireM=;
 b=VX9JuBIxxzazkwEklo3b567O/U3Bkkqn65NgKjg2Vytg2C2SrpAbSQvJ2fth4KIX9qxnTen37xxQ4oiZfyGBU4V+xTtrmWYzZPblJDNe4iXKTi4yw49scf7CLBWGVrtmYKOoXf2YORWUd1Nq3b3bFQYUxXpxwoU52M01cqS43rI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB7777.namprd12.prod.outlook.com (2603:10b6:8:153::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Tue, 7 Mar
 2023 16:55:09 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 16:55:09 +0000
Message-ID: <9383eed5-d3ad-d61f-9fce-6a543890ee83@amd.com>
Date: Tue, 7 Mar 2023 17:55:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/7] drm/ttm: Fix a NULL pointer dereference
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
 <20230307144621.10748-2-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230307144621.10748-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15)
 To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ab1d51-940d-4391-47fe-08db1f2cb5cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FiyAiwPN4lHRJxcXZd/zcDlH7eBRfShJzd6OP0TtXtPyyaiSUbHoRssa7CJx5ffMmwtiotj9WJN5fdAf1fHWDrUrvqu1FH/wXBAmr47Iw6J9jUkGNR2XI8YqdRj3784qTNAkBlHeE29takjnzuXR1Nmf8mJhElU9UceG8sMTbd/9Lz2JT2QmFRZk5Z9FEfqxiyvlIAe5t9l0BCDUwixgFfXQg2xGaVzMnfKopCzqS/YVq9GqRJDA0N7v5/5pWEp2KRPt8cXsW87v2v5vW2nDONuAScEt85KAmXQksoUAHLzlJfwYPbJw10C6dZF7gqpMFGz+mZ5eQHyj2rr9vTVjKjLpQpirvsPPgQhTYcUj6PqyPM0+H6G5gKYPeKRLxibqFKKMv7mXEWMo4zhrQJ7cCTL7TM0cQOwZcZYp4sxhkydclRIDSFQndSkc+jNgm5rSPIzyK8AAOIbkOx56qKKbt3gc5Z0jkdyyLP7x/LIKAHOGn8fia5viG1GP+EFwxCZ/VX/lCBlk4sLzqNm36Y7J2/TRrO8p/fFuo8idDmtI+0OGQYE12X6+TFxTVduQTIvu36YHtquiku1ae6s1vux1lvtUHXN8Mt4yRs5KYJf+qPZo3dVFebsmh4WO1nmt26jXny0KKlyoDDWjEHal1n0exyTGcxZLYqYXU7jfR1Z0iMPMNzWY/jbWr4j0yElyoiAONE9XRe2MLxP2Zj0Sgm05hnzjTOpQtEOVgeSWCE0zqkU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(451199018)(41300700001)(5660300002)(38100700002)(86362001)(8936002)(31696002)(6506007)(6666004)(2906002)(6486002)(186003)(6512007)(66556008)(478600001)(66946007)(8676002)(4326008)(66574015)(54906003)(66476007)(2616005)(83380400001)(316002)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDZORlhBWG96SkFtVldEaWtjMkhCRVVLTm1zNDFRVTJlWWZTSllzT0JxcXNi?=
 =?utf-8?B?UE1Vd0QxOFlnV05ZZmx2TXhOY29MbWErNlhzZnVvNWc5Vmx2Y0cwYVJaU0cx?=
 =?utf-8?B?dUFSd1N6RDJxWWtnaHZTaVRZYmRHdlVvTWkzdXlGS0JrVS9Kd3A4Y213SE9T?=
 =?utf-8?B?Z05kbEppcnk1L0o4dVZFS3pYNExVazlRS2p0M05IVmhhSjRldEtHRWRXeVc4?=
 =?utf-8?B?ZlNQQmlVNnhnZThpNFg1M3RKcmc0STBaeDdSUmIrVm5mZDBtcWlaUWlTckdy?=
 =?utf-8?B?dXZkcDRKV0ptUnVEZlNrM1d1RWt5ZnVuK0xiNWlrYWs0ZDVRUWZXS0p0aXox?=
 =?utf-8?B?SjhxZWprb3YrNHlXa2ZrTS9XMTNrWVc4MDhSUU90UUtTZitJM3F6TzJETk9O?=
 =?utf-8?B?dVlqTVNoSDVrWHoycERJcEswOTZuODN4cTMyalQrekMrYld2YWVkMnBvMUpK?=
 =?utf-8?B?K1p5b0xmdHpDaVAyZWpJbXF1TG12Q0JTc1U1WkRxZ0xYUjhLbGJjMjJ0TTJo?=
 =?utf-8?B?SmdOUE56ZUZURFR5eFBhYVU0MTZadW1lNVlPb1Y5TWRpTFh2YlpwOWRIZ2FQ?=
 =?utf-8?B?eC9vR2twaGh1RFVaME83SjZDUzRBRWJBdWg2M0NaNmREbE1acDNSWkp6aWUy?=
 =?utf-8?B?eG9VWFRsOEtoaWNieGJIM2FoMnFFL1RuY2pYbFMwMEJMcXpxT3V3bkowK3NN?=
 =?utf-8?B?YmZTZDk1VEROOTltTE9RMzd1U0kxcS94ZjRLV3o4d25Lek9CMklMeUtacTEr?=
 =?utf-8?B?MFpVL0tXRWxxRUNhZWpmdCtXeW4xOE9SMjVNNFNSOGI5ck9OSC9qQVNRdE1T?=
 =?utf-8?B?Ti9SZlF4aHdSZHI3ekhxVHpXd1htUDFSREFPNXordU14aGxOMlduZ0dYOHVh?=
 =?utf-8?B?cDJYclNZTWk5NjdjSk0rMDJRUkVRN09GeHRNdWM1eGtVK1VTNTJGTXUyOXpD?=
 =?utf-8?B?WUtDT2RTVThyTEJWYjhsV1hESUd3elpPY2x2dUpibXJtYkZrVW1FZi9wU0pZ?=
 =?utf-8?B?Uk1lc25qUFRubzY5RGpPZGcwVFZTdXQ3bEZmL0ZwdVl6VWF6OGhLSjBWR0Zi?=
 =?utf-8?B?Rm1RNlhMTHFZd0J3OUxIWkhSa0gwaUsvVGpIZW54MVdUWkVOYk5SeCs4RTU0?=
 =?utf-8?B?K2w2amZMQmpyN1NLcE1QRnRmNW1jRnNhUmo5b2IwaGh6c3BpTEMwMHpUaDZT?=
 =?utf-8?B?dHFHZUlKOWorRW5CRm9kVVRLWW90bFJyMlBWdnFIWXlaaWYza1VzN096aCth?=
 =?utf-8?B?dXppYmF4SktwckVHYmdwRTZCbmhiZ0s5a3EvVXUwVXhZZVEvSHhkemNsS0s0?=
 =?utf-8?B?VzFwK0ZPWGFFMzhVOXhxbDVDVlVsTzdBQzh4RHJCOEp0QVdzTTBqQ1lGQUhy?=
 =?utf-8?B?VVYxS2lTREYrMWtGaSs1YWd4a0QwTmI4MXdDMzRDVW9zNDRCVXBaa0IzVEto?=
 =?utf-8?B?c3FSeXdQMWNDZVZKei84M1Fub1NudkMvSTdWaXdSdDlOMUpRbTZyM1E1M0Nu?=
 =?utf-8?B?YUNBbkUxbkwzcTBiR2QveXAyT3ErU2JkdmdqZmpGbjFNVGRaREZFZktqbUVF?=
 =?utf-8?B?a3hGUk9iMDFBcDdYZkpPRFJ4TGM0MU5jTXhzN2dwZ2VuL1FFWExyakdXb05v?=
 =?utf-8?B?aU1PdlduaU1NL1NWN3RCQ0Q0b1ZKN09GZjdJQ2p5WTBJZ1ZUTXJkUnhhRVcx?=
 =?utf-8?B?S1dJajc0dFN4b1JBRnJXanEwQTBNTGRWRTViN1UwVjhOcys5VitZQUpHMWNo?=
 =?utf-8?B?N3FEeGsyVm5jcW11ZHZIYVV3LzhEcDAwQ1c0RXRaMEVFUmJtRzZNdG00aFRn?=
 =?utf-8?B?aGZyMzQ4RUhaWlIxMlAvZTc3L0drVUZHRXNLQ2RTT1hNSHIva2VpV2thODRN?=
 =?utf-8?B?a0ExTXBjTm5wRHpRZFZBdXpqUWJYQy9qc1Y5Tm9iQnovUXgrSEptMnRTekJU?=
 =?utf-8?B?QmFmeVBOMngvUGR0dFJqTkxLZjhZTUtuSVZvaWo4cTBnOWh1WkVMd2k2LytP?=
 =?utf-8?B?M2pRNWpuc3dGaEZxL2N6VVNaUFlINTVDL0dGcVB5bGcvcFo4Y0d2SkF2ZXJx?=
 =?utf-8?B?aFlXak4wamNVSlFVNlRpdE9ZS3NReVdtbkpvdHVGOXJpQkFLRFZpZVMwbk90?=
 =?utf-8?B?VXJnZmh0YW1oNEZCMC93dTFwUkRKQ1VsSU1IZnFOelJ6V043Mk03SHZvYlZW?=
 =?utf-8?Q?iASuj1IaCdQhWjSSE+yZ/RmFQ289k0RShNNMi0fPrmLS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ab1d51-940d-4391-47fe-08db1f2cb5cf
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 16:55:09.4839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7edn/qu5/h60iLHIDZ7bhDXFYCRScYU61Qh63tVOVKe7WXJXnBH7uWu21SWqG5yR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7777
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
Cc: Philip Yang <Philip.Yang@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Qiang Yu <qiang.yu@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.03.23 um 15:46 schrieb Thomas Hellström:
> The LRU mechanism may look up a resource in the process of being removed
> from an object. The locking rules here are a bit unclear but it looks
> currently like res->bo assignment is protected by the LRU lock, whereas
> bo->resource is protected by the object lock, while *clearing* of
> bo->resource is also protected by the LRU lock. This means that if
> we check that bo->resource points to the LRU resource under the LRU
> lock we should be safe.
> So perform that check before deciding to swap out a bo. That avoids
> dereferencing a NULL bo->resource in ttm_bo_swapout().

Please make sure that this is pushed to drm-misc-fixes ASAP.

I've getting complains for this from different sides.

Thanks,
Christian.

>
> Fixes: 6a9b02899402 ("drm/ttm: move the LRU into resource handling v4")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Philip Yang <Philip.Yang@amd.com>
> Cc: Qiang Yu <qiang.yu@amd.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index c7a1862f322a..ae2f19dc9f81 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -158,7 +158,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   			struct ttm_buffer_object *bo = res->bo;
>   			uint32_t num_pages;
>   
> -			if (!bo)
> +			if (!bo || bo->resource != res)
>   				continue;
>   
>   			num_pages = PFN_UP(bo->base.size);

