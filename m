Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C83A2075BE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 16:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E1D6EB65;
	Wed, 24 Jun 2020 14:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4156EB1B;
 Wed, 24 Jun 2020 14:32:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+iRUBFjBL7hH/h11+09npSUx+46aV82eDE4xDIQJ3oJ3HJF14T10r196gTeOFyxVL6DLCillh96CclMNOB0GznNWxxLwrX0WaIAJS4e6/ov1fvsTGBX8omrcie73Hn+LdsNuTH2tIceW2SpcwAAXczHt0VYfIL8ZzkrSfYfzD25u2bPZsq9z0MNxF0Gf/R07AitUW9bmcDLVtn36x1C1wNtSlDfbxvzJD9VCjv5Qf1iXXaJ0j4luWeW7jKk8oQmZIOHf2Uxvx6CvcNaiqmO+xtdJIImMJZJFi/sik2WqFj4R6qEKy7ohMj0Z68Y3Cd+n0G7bYPlC+PX9YNi4fKZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oU+42DMBP85wxKbs2HxzDVKsC5TIRAu3CabOJW31pTg=;
 b=UEk7hrtw1PAG7PaOdnDtdkayu1d0jli0zVu3FpC1yDXrtdkYoQBpRkTixFy2mKB9getjevD6n9Kkv+0uA6ILNJjWSATgFcXQU5PWlyjYbDWPeQzazXU6s2CMXDyKHcml4lZMJMjW8fVdvVtsjTrprtoPdzwYQPNP5Z2tT/VCI4+FocXximtVYFHH6nCbDPFW2A6quJrbu82CnEnbY1MTq02mLSSOn9i+m1l+FZUPGZVHoohD0U/4ET55Z0uyIbz0zrDtHy5YhfmhSz7CECUQMObw+ZLpPLYC3ypdCd9S96C1opf37pE2T9rjS4XR+wNsRWP+Oa1KD0qNyEPnoAE+XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oU+42DMBP85wxKbs2HxzDVKsC5TIRAu3CabOJW31pTg=;
 b=QpJuc6+WAhcqq+yzv7DXKsiPCmlcgwPs0GbTLyImxSpXpdRMlOLzr3K0wyWmP1dxaY3En3w1wX2m0/UJ+C9BCd13Gw8bhnqGA9XH7QgF10GmW/DKP29YsNqUcjRHoTm1Im+MStfzAB1HWVNML5QT5Skdx5rhs76pA6VrPazmFok=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3916.namprd12.prod.outlook.com (2603:10b6:5:1ca::21)
 by DM5PR12MB1594.namprd12.prod.outlook.com (2603:10b6:4:e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.24; Wed, 24 Jun 2020 14:32:00 +0000
Received: from DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::e14d:37fb:a0ca:aa81]) by DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::e14d:37fb:a0ca:aa81%7]) with mapi id 15.20.3131.020; Wed, 24 Jun 2020
 14:31:59 +0000
Subject: Re: [PATCH][next] drm: amdgpu: fix premature goto because of missing
 braces
To: Colin King <colin.king@canonical.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nirmoy Das <nirmoy.das@amd.com>, Sonny Jiang <sonny.jiang@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20200624141423.6307-1-colin.king@canonical.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <f9ceecb4-2679-c0e2-8f64-4dd2a4f5401f@amd.com>
Date: Wed, 24 Jun 2020 16:33:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200624141423.6307-1-colin.king@canonical.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0095.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::48) To DM6PR12MB3916.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.87] (217.86.121.20) by
 AM0PR10CA0095.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.21 via Frontend Transport; Wed, 24 Jun 2020 14:31:57 +0000
X-Originating-IP: [217.86.121.20]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d6d5c25d-2097-4653-c056-08d8184b5ab0
X-MS-TrafficTypeDiagnostic: DM5PR12MB1594:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB15946F9E95C367DB14FB791C8B950@DM5PR12MB1594.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-Forefront-PRVS: 0444EB1997
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KjMM4UXmVPcWQBeZgLXuYA5RbpevW+VhFCoKA+hOntPDyjc063sToHgAmHoeiipHkjCKG+IdDzDEh6usP+3cdRGGEHInLMsJ/c9jNS5ZIZzTow4XNPwA9SX38mXntYipxaLaVwanXkETgNA0aVxy4pHBZ8YXizvgYVrgwzWC28eKLHGwM7L1KeMW3amF0i+yO3vUqO0gPKgP51CbVKj7nGb2HiTU0HJBXfxw0l0z0mY0zXubRe1N8qnhxlMiLTkFRIpit3F2iImmO76Vo2mxer7/U3lkGgRV75L7e7vyIjyLeY8hzoirl7PMFQj3kgOl9gXvaPASp2qnRjtHeq3JbHWHMXgAp0fKM1csue5yx17ow93fpZhqXCbxK8EO8AGy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3916.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(36756003)(5660300002)(956004)(6666004)(26005)(316002)(16576012)(2616005)(31696002)(2906002)(478600001)(66476007)(66556008)(66946007)(16526019)(53546011)(8936002)(186003)(6486002)(31686004)(110136005)(83380400001)(8676002)(52116002)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: K+ir4myYBcp5IK3LAwd7InDc72mCc9LFvg1qOptdr6zhGpyVIyq3vp94NhCU044WSoYO46W+iJXOPZTqhV0c8pdIjhLcMj/sDLLShxlSYYEQogyzXxA29DvtCI7f/0r3D3xYX4DSpyLWUPX5QnU77CKFc3q8aKaG+6l03RSAvzl/v2smvw60r22XaxCyWr+JnODg4OhpAbLLhiPrrEe6TW4u5t9xv5in2i0RSDu5gABNDc9SsAUjRkkVL7fMtihoPXm9Ec6MnEsS5dUjAJUSEagplpXNrikfluESOs32vHnDfDvqiPFdWCsNW4+P5yuHVqvX8n4HEZgv0DFjkecHOX2w8DCrkbBsubkH4FVQOBIrkWZ5OBVWmDhiKagw3/q5U235FqEyV1gJWBjnZPJr/yl57oQDUByt6ENiRRjnIKCYh6SFvHvdFcXdcPxOQ/nfzvtQ6pVq+fndKFjfscMAzmY1KYOS5JzjwA1scj/7AYE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d5c25d-2097-4653-c056-08d8184b5ab0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2020 14:31:59.8820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3M4ACoERRWMfJ0qdALRWCGHTjM07ESzrpUu5p3bAMHPO6/N3JPdBowv+mjpL36eb9ToUoCXsr/KxOghg0vpaXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1594
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Nirmoy Das <nirmoy.das@amd.com>


Thanks,

Nirmoy

On 6/24/20 4:14 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the goto statement is skipping over a lot of setup code
> because it is outside of an if-block and should be inside it. Fix
> this by adding missing if statement braces.
>
> Addresses-Coverity: ("Structurally dead code")
> Fixes: fd151ca5396d ("drm amdgpu: SI UVD v3_1")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> index 599719e89c31..7cf4b11a65c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> @@ -642,9 +642,10 @@ static int uvd_v3_1_hw_init(void *handle)
>   	uvd_v3_1_start(adev);
>   
>   	r = amdgpu_ring_test_helper(ring);
> -	if (r)
> +	if (r) {
>   		DRM_ERROR("amdgpu: UVD ring test fail (%d).\n", r);
> -	goto done;
> +		goto done;
> +	}
>   
>   	r = amdgpu_ring_alloc(ring, 10);
>   	if (r) {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
