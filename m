Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE767B474
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 15:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE0310E7E3;
	Wed, 25 Jan 2023 14:29:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F94010E7CF;
 Wed, 25 Jan 2023 14:29:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkPRZx9fNnMdYHpfLhXBwuZNQKXRILG6AVIIUEzECnVQI1Z5n4tClKaPeRfZIE0GIz6hObPtIKV1LnoWnaWzhWD1+5PrgmkvAn42hsSaIV4vCNos4f0AK+U2jA2T+Sxid6wKTU7ebJAW6xxI5HUPzdzD+2yKhvptBA7mseQspB6+1N0BkQO5DWGYMzQ9zPRn0Gq4w3ymjw90QmGXCuuiu5gg6g05CV2PspFhy9PzkaMUYbA2m9R2C9SzS2mZo4sVgSOx+8OcIf2e9TciYldo8Xd8M1Q+VBpjkah3oI15tN0Xuw7SCo/muItm221FLf6gFCQ9D+/tPkDE/LJoQD+AGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2+yM7NhPdXI+T2XG6SGPMlld1XUvIHvam+mCU0PnTw=;
 b=NPdQXS23czq05vrv0bq7t+7JU5il55LqDpHpEHg0ykL+NYfeXLAycGUp8Yikxd2bThpVtEjptQinee4LQxkUV0fcGlFsz3s+hoAQ2GqcaWjUMz1g+hYC2d77OcuhZlUUUVZSvA+TTFrJdXf7u/0BnI6RrA1W9NYKTu+ija7HqfwmEHsucBV4KaFh8LpkluM3dDIMaJGHRx/y099YZrLEMJoJF0+2+q77r0Plz/bpitn9fZenqYWMMxLfjtUAdEeSqZHLiIGSoPpQHK7msYnbUTk2rN1xhrxhs8dYy0Z5p0PWB1zAp1UvDXWR3/McBkBU8QX31dQDRwt6zT0+A+kIsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2+yM7NhPdXI+T2XG6SGPMlld1XUvIHvam+mCU0PnTw=;
 b=lUtV4lCl8ACqixuedPlmBCThC7J229m1e8x/qf4fJlydd9KjhlHaLnHXuJ6QugDZNJ94OPZ1RZ30UMX5S2c8iYwGH+Wma+Mfz5QPELKuaEZ9PVp+UsSfHeblFBvSx/FNHFFQfAP5t4gOSGVLwa20H3hdJuAzmOD9b0sb/VAR26s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ1PR12MB6314.namprd12.prod.outlook.com (2603:10b6:a03:457::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 14:29:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.017; Wed, 25 Jan 2023
 14:29:47 +0000
Message-ID: <91e0dbdd-6e78-5c28-a647-16a0305478e7@amd.com>
Date: Wed, 25 Jan 2023 15:29:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 3/4] drm/amdgpu: Movie the amdgpu_gtt_mgr start and
 size from pages to bytes
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20230125142415.18546-1-Amaranath.Somalapuram@amd.com>
 <20230125142415.18546-3-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230125142415.18546-3-Amaranath.Somalapuram@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0143.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ1PR12MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: c94036f1-c308-4d96-3d9d-08dafee09be1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DNeByvhApHO1a9Khwg70g0zvZ4zc3jV5paD/+4Zs1SgL+Cr1EQqjwaD1TakKimiGKSr01QJ7/90GzUloxOP8a7TcqPhBB8TXdTV/olwiq4RCGwwOULLgRtXZyyqQLR/DrhRhkOO++RDF+iDeQSHa37Nr7T75nATGOVYMTFBtJnEONb4LqUbxlKaU7GZEZUN8696p+iO/nTOq0Wf4GLuT5AmeDQSrJcw6AGiVg9w0VFBW/5/4e2MG6nC+3p+2YBvi+sTBWTH+GrMNCnyvFpWc5QRqm7drlZwx+ap7+sAEND2qycaHaSZUCCrfY7WxCqLr98o9fNhp4c9ER3Vr4ECN24u0+AB+mXFa2JwuCND4+KKjrht9LkTljo5diz8gs92w4GHb1RJST4flfmR7eJIUDdlq8z6VFokXcfuwlWFCFRCz5gUP9ViPf4+R6gyxtwG3H5E28omGnZGkPXTwAz5j7PKUDcWOxPT1NW4XfP3+N/3U7WKIH5/0DX40zZkaSC1AxLbOFSSEsu/+by5GbhvpcE4oU+jlNMYJ2F4KphS72Hr3E1Rel0MOa3w5wOp2qK9KsT7JVMH4pQ65LEIAa8ftPQ82FkvpSSuNwYcRkzk45UBMuTK0xmaMcDF/AsOKglDQ8kN6JqUKtj02OIm9y+eQU5l2WRVGIqKkbs8KxbT1Qn8znh6XWzIpL4h4hUuj9Iyi1jlha4ZyhYTrDUrhThzzHEno8aXv4Dpe9Az8rP0NcPE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199018)(38100700002)(31696002)(86362001)(6512007)(6506007)(2906002)(186003)(316002)(2616005)(6486002)(478600001)(8936002)(41300700001)(6666004)(5660300002)(36756003)(450100002)(4326008)(8676002)(66476007)(66946007)(66556008)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OExUZDN3ck9hS0JNTW5qL2ErLytvQXYvaVBPSVJWcGk4TEVnUklNYjM0M3pT?=
 =?utf-8?B?VVFPYStKeklINmFBZU9laTBMNnU4bnZtdmdiZVNsdzdIYS9jMk44OFhJMW4w?=
 =?utf-8?B?bUF2dUVkU2hEVXpINllIT093NS9obXRTN2luU1pnY0hqTXRzQWpJNHlma3Fp?=
 =?utf-8?B?T1l0RkQxUVRlS1ZzZk5oRUw5bW5SY0owa1Q5aWJDZlhpMk5jV1lPMFA4NWxl?=
 =?utf-8?B?Y1VxOTdQckxoN3ZIa3ZVbzNhYURIaGloazRsNGpKY2FyVnZzWEZQampVM2lX?=
 =?utf-8?B?SmRoNGVPTENtNEY0c3pXbzZKQVlaS2lZN2ZKZDRlYThGd2lUUHZ1QnRtUEZa?=
 =?utf-8?B?RXI4NGVSZDRsZnhoQjVNYzg2Y3h4dUVwSkNZVHRRWXZDaWsyS3d4RnBrVDRZ?=
 =?utf-8?B?OHd2dW9TNitDaDZkYnhjL0wrc3pJTEpIYTJmbXphV0xQRnZmTnlPeWZ6d3pz?=
 =?utf-8?B?UFplQ3pndEVWVUE4QzdETUVjRUxBdzBvTXZ6VmYwUnJ6MExGa21zM05zL0Fa?=
 =?utf-8?B?SnZyRDBsOU0zV2JDTWsxWGJ5cXZHSkYzOVh5L1hnZlhIUkI2RmFWL3VNVDNK?=
 =?utf-8?B?MzQzNnphWVNZT1pGamhaVWNDV0kwOG0xNkpEaHVCRHNncW4vMFVEV1VId3Ar?=
 =?utf-8?B?dlNmYUlIdzFwY3hpSHBnWXdmb29JaWZjZUlOV2ZJdXF6dEk0Zmg3ZkJhSmh6?=
 =?utf-8?B?d0RiZjcvMGtwcTZseUZ6eXZtUGdyclVyVHVGK2IvNlk1RkdWZGVzRDBSZ3Y5?=
 =?utf-8?B?ZVBCbU12UWdCZXo0eUQrOS94VjJnUGRiWE42S3ptcTlqNHFhYU9VSjBKeENq?=
 =?utf-8?B?OHpHNWFFWktLWC9TckF6MWtWQ0M4TEwwNkxVa2g4Yk5vUGFkR0RuaUlqcGZy?=
 =?utf-8?B?SWtSWHA4K0ZqOVJhamNHVDVmdy93VFUrK1J1d0lYaHVLUk9lRkJjYnhWcjJB?=
 =?utf-8?B?Wk9jRlZic2RxYkwyaFRzZjNBb0FPTGp5bmdDeFk4Z0lhNnd3dWEyWExwWVc4?=
 =?utf-8?B?TWlqaW9JekFDekgwNUtRZklVb2dUY1N2T1JyRTZQWE8yeHpQcDQxVEgvRmQz?=
 =?utf-8?B?UWNLR1VqbENYajZuV1ZxRVlIa1g4T2tPSXpQM2xSaCtaby94d29uNkxLNjht?=
 =?utf-8?B?VDV5SGczcUpMeDhEZk83aDFNNVYvNlhEWkQ3bHI2VUxZTG95TUFPd0VJTzA0?=
 =?utf-8?B?azRZaTZvcjE4V3pxQXhiSkdXdWJvLzllazdHVzRsUDd0dXJadHNkeWZYdEVW?=
 =?utf-8?B?VmtWNmV2dmRwZ3ZpK2NuSkdJdUNRR0U3dVpqZjdEeFdsa2F6dGJiMDB4WXdZ?=
 =?utf-8?B?KzBpV2d6ZThsQ2JmeUZBTHFaYXRyeDJRNE1tTHJ2c2hEbmhyOGVxTXYrK09h?=
 =?utf-8?B?WEIySWJIWDBHWGEvMDFMNStWeGxNTFAydkkxbk14eG5CdnFFbG5qUmQvSDkx?=
 =?utf-8?B?TnRYRU5FcGZiQUhlaGtCZjBYeE5RUkluSFRzM1VPOTJXaFI2dGFTZ1AyV3Zy?=
 =?utf-8?B?a2orTnRmOVF3aWlmZ056TW1nZGpFbFduWktsemNCTFRuc1pmeTNQZmZVL1ZB?=
 =?utf-8?B?STI0MERUdk5mRlZhM3F5VXhxa3pweE5CSm1sNlBMRmQvRjlNKzF0Y0NpcTJJ?=
 =?utf-8?B?cTVSVjJHc3dIb3N6dVlOdHhKYXp1Vlg4cVg4UDdlTmN1YzFFa3JDVTloMlZT?=
 =?utf-8?B?bDAzR3Z3TVQxUnprbzJRZVV5a3BQcGJRUVNvL2RQMFJiQjlJUVRMa0wxaEw0?=
 =?utf-8?B?czI5dVRGd1JCK04yZE5pZ0p5d0gzQmptSlNqbHUyZ3d6cW5kK0krWVV2Wk5C?=
 =?utf-8?B?Yi9MZUJCd3pPcHplZ2lROTdOK29sU25VVzVmRWFSc1NKck5NSmlGWVFVY2Vh?=
 =?utf-8?B?U2hTblBuSjdMb2t4Qm9rMGRycUZuOFZxeDAyWlp3cXUwandNZm9OOWNqNktp?=
 =?utf-8?B?aDVwR1A0UFlsaERQK01PdmZOdzhwRWVGWDg4a2orWXJoR1ZBM3AwRFdzcEtY?=
 =?utf-8?B?YzVwOFErYURrY2tHT2t1ZW5VTE5oanFlV2tTYXhWb0YxSUZsdEdqV2dxVmV5?=
 =?utf-8?B?and2Y0dXL1lZWkhjUkRZa0JTVVljakQyejFMbC80dHBDbkZoK3lYUDU1U0xl?=
 =?utf-8?B?Q0Z0S2FPam1mZ0ZoQnA1MHVaQWNBc2JFanR3dUg5QU9PQ0RnWXZGTXp3RTlr?=
 =?utf-8?Q?JCt6bn9vK58P3nvFxd8yKFakk3DfEaUucUpal4K7CWNN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c94036f1-c308-4d96-3d9d-08dafee09be1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 14:29:47.0361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAr0ttK1ql0o/Ev32oYUpu2sxUbkYpuqnKYL9YUwfehb+/cur/eu2AGyyEhfFxaB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6314
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
Cc: alexander.deucher@amd.com, arunpravin.paneerselvam@amd.com,
 arvind.yadav@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.01.23 um 15:24 schrieb Somalapuram Amaranath:
> To support GTT manager amdgpu_res_first, amdgpu_res_next
> from pages to bytes and clean up PAGE_SHIFT operation.
> v1 -> v2: reorder patch sequence

Ok once more: You need to squash this patch here together with the other 
patches.

Otherwise this patch would break the driver if applied alone.

Christian.

>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> index 5c4f93ee0c57..5c78f0b09351 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> @@ -94,8 +94,8 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>   		while (start >= node->size << PAGE_SHIFT)
>   			start -= node++->size << PAGE_SHIFT;
>   
> -		cur->start = (node->start << PAGE_SHIFT) + start;
> -		cur->size = min((node->size << PAGE_SHIFT) - start, size);
> +		cur->start = node->start + start;
> +		cur->size = min(node->size - start, size);
>   		cur->remaining = size;
>   		cur->node = node;
>   		break;
> @@ -155,8 +155,8 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>   		node = cur->node;
>   
>   		cur->node = ++node;
> -		cur->start = node->start << PAGE_SHIFT;
> -		cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
> +		cur->start = node->start;
> +		cur->size = min(node->size, cur->remaining);
>   		break;
>   	default:
>   		return;

