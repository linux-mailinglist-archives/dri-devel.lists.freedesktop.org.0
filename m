Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F414F913F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 10:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED4710E02E;
	Fri,  8 Apr 2022 08:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A5410E02E;
 Fri,  8 Apr 2022 08:59:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGp/qNp3rZfsUzLMBfWTH9M/rFigtXZkEG1+FUGUEKsV+sQryHVjHVurVTfFjp3x5le/Nx9l4wHkYtU5x6iibKUC7HBiFxjkt59pOp87bJE3SSLJyZLyZYqJHwGNyzVFDfLWkUhtrmxHl/bu05akRBaMNU2PGdBTZMlQtYraj03wAwunmWobyV3nI3YCdvsRw6El/6ihs4HunqTxWF8qyyAmyF6aM8CC+is0KlNBnt51p/5hNypmGzVwS2QJcnWNnyotToryKSgbDiuU+YT3FC+v63DeWlIJCk2CJnbrHdrhLsJ9xZKpzX5BkS/9m+yvIwbXecYbcdzAshOX1z4+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAIuFIUQkALvo8hm+Sxm43eSSOvKZfE8ezGnPnkE+/4=;
 b=NcCAzBlyC7Nao+GT8RWbVQm7vL7wwmHQQTGwfMAWH6WneaogRrQhv08rHqW6zG3tLhhWRB5zSuqbB4fz2FDpPN8sSqIcgduqbUP/j0btl0prhHOFrLY5exj62vRxJ+Dy6/IJp6XTRcRqGfWxd1JF/Q6bAeytXw4ak2+R9MjfwwmBPr2t1oYQ57LzHcBeLVsAJy599aVRBIdhTzcs7u5qynJzNpmxqEgIa6uDt7gQek7CqkP7ke3rFCcNwQtweShpvUdomAn95GqSSNPBppxYq5VxFA47Qyeq6z60H/QruZ1CJTqyFP9i1NySdS8oojKDyX5hn2xjbiKV1dHrksE5pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAIuFIUQkALvo8hm+Sxm43eSSOvKZfE8ezGnPnkE+/4=;
 b=KZKTgo7QnTnMXUlYoMwAaI6tyLTYg+q+pBSgZPAI7VDoGN+Dzn1RKXjofA8/Z7lkhtjflGmak8Lu+V08U9jSlGZs8B+wNkYZ/+zvFHn5Iace4YSXavIRjteyf23jKT0gcfXd5u6RKB6XIMQqBtVBmvoqfKlLV67t1Vp4YBHYJ5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR12MB1811.namprd12.prod.outlook.com (2603:10b6:404:fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 08:59:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 08:59:06 +0000
Message-ID: <c2827f30-989a-4d25-4cf5-e252a9ba32ea@amd.com>
Date: Fri, 8 Apr 2022 10:59:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/i915: fix i915_gem_object_wait_moving_fence
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220408084205.1353427-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220408084205.1353427-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0311.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f5a4207-63be-466a-3377-08da193e0989
X-MS-TrafficTypeDiagnostic: BN6PR12MB1811:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1811BA3DF0F0C28C5AC17ED283E99@BN6PR12MB1811.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qV4+wb3rBJSWz9FGhowTFaevuoHswWabURWjMciWIPfzPxLWQQq3y7BF+AJlDYyX0LZKqDQ0D8zBD/3SI4r15xbEeRt4ND+WGQUtf3/FERi3U9gq0VgqWSw0lhxGE/zaw7Fqx/CjXzHTuEHyLI/xqtMxGImd+BF3w4wsu4RXM3En+tk/FLovZlHUpMZcOuw1MH+TFP8njsGOirkpPgOmYawZMsEdV1ZSrdSzSR5rgfpkI49DoD+AHUZb8u3g1afP6umE6hWMdQDDPcTrk29RlVgKMUi9o8H4SwoTecRgqq3r4JEmrHx+aTqpM/4iM0UTNUD2Rg4MPCjtcJxmyzIJ3SMWqA9Rye35nrP3cOpyWgDjHfqgOE/nCTY1G89h8argzOd+bBmc5WV74koZqqasb9fPsglb7BfErz/NFJJXpgbTXQ3EKu4Y5z34r+D6sKfRb8LW1kVHiVNJ6ck4+uGhr/V+zRoti1B28LK9/4La9imNqy/DNCeYXk7EWRPasJ0v0S8M9k8+JMFlcTsPHmgfTkcoUzDMVhJgNG7DJyEX3Dadj+ZJ+oohj0MehaLtxLIcGbl/lUeePTtl8+KSc4IGOoSWY4KYqxbIGQHVlQAji/4UJehJnNHpHhhYFxBm8FvmHdZkhJyfBLy0fI/j/c5BuB8vlWxHTZpOoK/9Xs1uDqhTtQfQQYa8jkO73sNirowzutjHGspmRdkaYJcvoz5Zbmaj7NMozZUzVho7s9GMccRp9GoBSivgdL6F1jDuInN2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(5660300002)(66574015)(54906003)(31696002)(86362001)(316002)(8936002)(2906002)(508600001)(66556008)(66476007)(66946007)(186003)(38100700002)(4326008)(8676002)(6512007)(36756003)(6666004)(6486002)(31686004)(6506007)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVk2Q084dG0waXo0TEZGS2pWaU94VlJSNXNTdHBxZ3UzS0hIUkRVU3NYbFg3?=
 =?utf-8?B?TVRhVFNwejJDazBXdFliRWR0Q3dXcHZxcTlXWmFDUk9RNmxPdUxLZTcrZlQv?=
 =?utf-8?B?U3dpTFpHR2VHdFF3bFVLbUpLS2RhaWFITjBOQXl2QzVlSWJOVGtDVXMyNnA3?=
 =?utf-8?B?ZVBxVjhlLzVWQnBhZWpRT3VKMjQvLzFENEU4ZnJ3cmNQL3pwUGI5WGtyRDNx?=
 =?utf-8?B?N0JEWnRXeGh3aGpJY2J6Z2lpa3lnM0MxVTBtdEQwK2hmKzF4am1IRVBxODZa?=
 =?utf-8?B?UytGQzNjV2dsYzYwOEZjd0cwRGtZYWZuZ0hoOWVkRW1sbXRKRDRXTTRNQjBp?=
 =?utf-8?B?RzR3azM5ZTdnNDRWRzVsOTBFTUdvcmpCcDUzZThMTDl0b3ZLaktmYTVMQ3pI?=
 =?utf-8?B?ODg4WG9YSDdkUTI0c05TeE1kTHV0by9EdHpTWVRaL0VUazZSMms1UnNWL01z?=
 =?utf-8?B?bmhGVUEyMndZeTB4LzVoSndLdGcrWE5LVnF0UGpGVHYwaWU5cWlsRzhnQlNs?=
 =?utf-8?B?Y3hmbldZNnZsUzlhazI0MHozOTZ4a2VRUHFEekFQSURZa3VPbG04andkbWlY?=
 =?utf-8?B?OFIzVjhRd0R2WVpwbkc5Tmh4Qld4S1JuVXUvODVzblR0ay9oZ2ZNMC9ObDUz?=
 =?utf-8?B?Ykg5ZFRuVmdOZFpyUVJlTGxTcDJSSEp3OWxMclZsbUQ3L1BFNjBoSUgzTFZm?=
 =?utf-8?B?ZWhEUHBtSmNhT3pNcVl2TGQ0UWhMNGV4WU9KUFJKeWl5V0pWcEJacHAyaUhk?=
 =?utf-8?B?MXdMZWJ4bzY4NS9qcWZXQVU4cDZ6REZUc0V3ME1TWDNoczViSy9qNm1wSmxE?=
 =?utf-8?B?ZCtyS2VCNDhjeDQ2eFpoRVd1dUY5S1pzdkZxTlROSU9TZ2YxdkNuS1pqMWxt?=
 =?utf-8?B?dk5OcmROZDFiVDMvSlNtUUJUZndmVy9YUTZpaW9jUS9ZZHlQNURsMmpWWDN6?=
 =?utf-8?B?dENNaUI2Q25IUEZic0lVK2doeHlSUlRSalFoYlV3ak1ibklRUXh6dGRpcG9x?=
 =?utf-8?B?algzK011b2hvQnRTeVVCaXRyV2pwVEdXUDN5VUdadWJ1dUFob2RIVkRBcHRB?=
 =?utf-8?B?cXcvWnpSQlJQL1dGVWtuYUpUS0t2bVBFOVRNWXgvTjdUYTJYWVpHSGw1b2o5?=
 =?utf-8?B?UXEwYTgzdVpLVHVKY21QZ29IdWt0dXZyWHBXbGZiVHhYZEJ5Vko3TUQzWVh2?=
 =?utf-8?B?VVc4UkFIOTQrZmpWSkZ0WnVzOHRCVUFXTFk1UWZrV051OWsxRm55cExZekgy?=
 =?utf-8?B?K0pkdStNZkNnVHF1OEtMUHhFdzl1SGxNRFMvb3EvYlVlVjlFVWZ5bGNaZ3Mw?=
 =?utf-8?B?a1FleFdjR0cyMWZ1U0hJSTJnT0hJQzZlbmVTNXJORGVtT3dOcFVFN2tqUDky?=
 =?utf-8?B?am5VbWIvYmRQaURKY3RhdGZmbTV4aXNYRE5NSUdIYy9WMFlSVmxCR1VEak5N?=
 =?utf-8?B?ZmhEK2FOSjF5ZVRYMnpSNG9ISXFvMEFzcHo2TGJBZW5IN3poRC9BVWZNOUVJ?=
 =?utf-8?B?NGszRmFaYVhoL1RzVkI4ZXpka0UxQU0vQk85MTROUGx3QTBYMGlvZkxEUEhi?=
 =?utf-8?B?WGt0ajF1YlNMZkw2U3RVYVJKV24yYnhVaFArUCtmUWR1dncxdnB2d21LR2M1?=
 =?utf-8?B?SnByejYzY0xIb3V4ME9ZOTM2TDZsdklqaEZIelRiWXJ3dFI5NitnTUgvY25Y?=
 =?utf-8?B?RENsT1NqRWdTYVhydUpEZHJkbG1mVmh1ZlZFY1RSL3k4U1htVGJ4bWNjdlUv?=
 =?utf-8?B?VFRCRVNQZHRKeWlDYmZCWDRON1RZb2lLRURMQVV5dW16b1YxNTBlNnUydFlx?=
 =?utf-8?B?UTZmRmpoajhQU1FocDNsajhhR2xoZXh0cWxBeFJOSklDUENTMmMyNEp4UkU1?=
 =?utf-8?B?cGJRUDlycDlKRkN1OHpjeEZSYk1nWWdEUVMySDVDNFVaRjg0ajhReFVNNDMw?=
 =?utf-8?B?bEtLVE5oRXdKY3pqSTYvQ1Y4SXhMOWZpMXN3WVdxNGYvMjdnemJZbUloZE1z?=
 =?utf-8?B?TUtzS1cwVnV1WWk0clBSUkQrMU13YlppdXVyMDlLc0RMc1E0cTN6dmZRVkQw?=
 =?utf-8?B?UEVuVG14TkI0UFVpYnBRTVpNalNmUVVtMWZLOEFQSUZKN0lYSG8yL0RIN0pL?=
 =?utf-8?B?akl3TFU4M3lpRThhTFEwOG42eGw1WHkrbmIzbEo2Tit3TFdSSTRxMnRVRzl3?=
 =?utf-8?B?b3J0dXdZVW5XRFVONTY2SWpPOE5FSjZHdUI2WExEWnVuMHVMV2RNbWtWdjBO?=
 =?utf-8?B?OFEyS0tTbE12N3dMS01QWXZwaVl3QUVsaXBmVnFXTk9INXI4Ny9kdms5OFZ3?=
 =?utf-8?B?Vm9YbEZMaFo2YXZiSEoxbkxhWjFwWHJWQmhkcFY4OXZmdGNOUCsrc1RGaFZo?=
 =?utf-8?Q?7zFn6OCiajFFURZpBnh1ZSxkHucdsGbh3xKWChkXlSOnm?=
X-MS-Exchange-AntiSpam-MessageData-1: 8E21bUy976wzRw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5a4207-63be-466a-3377-08da193e0989
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 08:59:06.7343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BaoxgxqhQITZ4SdT1aOTpn+a0eqhzAi27FPY9z8qRE+TdS7taOvakcysCHXcFTLp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1811
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.04.22 um 10:42 schrieb Matthew Auld:
> All of CI is just failing with the following, which prevents loading of
> the module:
>
>      i915 0000:03:00.0: [drm] *ERROR* Scratch setup failed
>
> Best guess is that this comes from the pin_map() for the scratch page,
> which does an i915_gem_object_wait_moving_fence() somewhere. It looks
> like this now calls into dma_resv_wait_timeout() which can return the
> remaining timeout, leading to the caller thinking this is an error.
>
> v2(Lucas): handle ret == 0
>
> Fixes: 1d7f5e6c5240 ("drm/i915: drop bo->moving dependency")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Christian König <christian.koenig@amd.com> #v1

Reviewed-by: Christian König <christian.koenig@amd.com>

Should I push it to drm-misc-next?

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 2998d895a6b3..747ac65e060f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -772,9 +772,16 @@ int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
>   int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>   				      bool intr)
>   {
> +	long ret;
> +
>   	assert_object_held(obj);
> -	return dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
> -				     intr, MAX_SCHEDULE_TIMEOUT);
> +
> +	ret = dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
> +				    intr, MAX_SCHEDULE_TIMEOUT);
> +	if (!ret)
> +		ret = -ETIME;
> +
> +	return ret < 0 ? ret : 0;
>   }
>   
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)

