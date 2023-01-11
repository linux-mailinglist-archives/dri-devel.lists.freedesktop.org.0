Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4EE665716
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 10:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCC110E521;
	Wed, 11 Jan 2023 09:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C281210E4F3;
 Wed, 11 Jan 2023 09:13:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bceLJI3c1ols3g2d89G2SdXRBisQ/VBRdq68NBLkGFl2Nypf7XLotuRQylrhi2xgvQLbmTegCtRYoqt5cmLGrzvOr40N+L8jfDVceiL5JIQjbIrz7DRs0DEV2AmrD4VeqKnuukwBMBKp9NI1nYdLjkjC8i2qm+vXUermPnBGftsgKj68YXUdslA4JGBoQ3Pl1D/2F0JnMgWMEd2Eb5r/2R4DLHxY9nmAfe+hCzJ06g3QFHQJ04zrAE4RSGp5u1GmKsZVevRZhdb9N/TqFw0I8p95mp3DFwPlTtrv1CUev7nrUGvbQuhcUL2dKzXRBmtEQjeej+bwMj8Bcxck4PFSBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AgQkLRvz5mMVMXSbradrP+Ps5nlrbtyTqfNDbb7Oj4=;
 b=XmJIVjHFh/YqyiLDffZ3/C6Hh8rTb7PMKre1dlizUyX/Oe6thyYJLnZ4Xj9Dn4hPRPXeME3Mfa+pnBvY5NBaArQ3ytlHaWn6C1+ih1/YFdovkShfY+4mztD7DS6Emw91E9mWb82oiTYcN82p/ezNxrz56S1SEmia021F95wkOBAskbe+mrj9ihFsP+MftjDAUxTJdRyCd2Nc3/PjkE4j6U3jJU5pEV+lEmsTXw/XyOYZRPs2mRTrkh92g+UsfttCAMm8qw9mMu5trIIsbQUP789Cb0usgmpk7YRKPuR+r4AF7HJKCcGJBtETHlDAHKqE76ooPEgrNx19essV/dzETA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AgQkLRvz5mMVMXSbradrP+Ps5nlrbtyTqfNDbb7Oj4=;
 b=ilLzEDqkFQfaRjSV7Y/+91QEsX+N/k46nkelqckz9tTi0p/6tQlU79WVqw3Ss6YgZ8e6t/t3gMbHvffCDIef/w6+bt15fOge/4DNgXhjj+aRdzrtG3qBBvtWslIXfKbpZZh3YPNzT9M8EiSZpaAgHenj2+H93UyIsPHmEeVA+n4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4551.namprd12.prod.outlook.com (2603:10b6:208:263::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 09:13:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 09:13:55 +0000
Message-ID: <cebc4772-4b1d-4131-d152-7498116f56a8@amd.com>
Date: Wed, 11 Jan 2023 10:13:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/4] drm/ttm: Clean up page shift operation
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20230111063524.2374038-1-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230111063524.2374038-1-Amaranath.Somalapuram@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4551:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d9768cd-f03d-4bae-9966-08daf3b42a06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jg5VMfDfWKvHLbYb+vHH2vwKQTODyE/F/YBq7QsaNNNQn6nqTKrONjyEH4Mf/KdxNaepyAb8WQgUzwF0+dNZhZgpdSXbH2gBEWSHdJHjsr38YrBNPiM7yb503Ax8/O2qgzJbTUSNRMDd2egCuBBilMFlW5Fq0zQpakcHj4Ie9myJCr7J2yZkUc17WpwaQL0XdH22B/AfEOx0aX/a/srogkf8xQUO4mspgsSX+n2U4hvGlXr+YVm/+VTGNIUMGOsg6iP8C0y92Z8OCJ3hQ5CAJddx39nCwAJtkMW0mRcAkQvOzcrWrvZRaI9saoZ1NayPJQRPHFgK0gD3Bvq7D69bKl66ohh65w4HrUPTnFCPqdPWv8IBqpIbDEKvaeJmJIT/29qN0b4beW1vSdZvdEb7or6huO8mS/aXQag+mWVsTUVeQqwBRhoWQMY8eF4NX+krSxPuNBZdQmna6I2bC6z3B8uYLq6WFJy2eebXW3TdfP6PmR8kJrmWISp1a3ZQQhMYfjWPyriyINlJJW5pXoy16dwfr4IkMWgkTKPw+MDpCPlmVg17jvk0txI2y05ofQ3HzyZKvdwGgAXCYAzZRr5sW1uRq3DO6aqGBy2FZMsWY5iXIKmf1T6TlKEemginulLZYue/dkE+VuJFTXcZsX1TlyW480TRVvVAjnETVhSwSPL2L9GNLCoZvZhxbCFnxwp0q0fm9gFaECxcdWPtaOAA3/iPHZF2lqeqwPgmW01G6jI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(451199015)(36756003)(186003)(8936002)(6666004)(6486002)(6512007)(31686004)(6506007)(2616005)(66946007)(5660300002)(66476007)(66556008)(450100002)(316002)(4326008)(86362001)(31696002)(38100700002)(478600001)(8676002)(41300700001)(83380400001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXFELzhyTmxhQUlqOFZLRTllUmk1VFRwQ2MxK3dyclFqeVZVeGpINlN6QUZL?=
 =?utf-8?B?YkRNS245Yk14ZVBEQzZsdlFickRMVmdzbjVrS2lDVk5Tc1lkUEtTKzF4L3Fr?=
 =?utf-8?B?cHcySVVwc3hweEZVaGpLUzRhb3JOVGxydjd2Y2h2VmxhRVk3QjNEZTFQZXZu?=
 =?utf-8?B?cmhCTXJHbzNmVWxRcVBoQ0NPbUYybENqSDRLT2xjb3VuYXd1M1lSMUJmVTBB?=
 =?utf-8?B?ZTNHTlg3M0hNa01GSEltN2JZVGNnNTd2K0ZZMUp5K05zSTlvendtN3ZRQldE?=
 =?utf-8?B?aVUreHFrZG55YVNuaTA0U2tGQ1hoaVE3VFR1WFZRazNibUN6RGZmUmhpQVpx?=
 =?utf-8?B?TWtLM0k2eDkzdm8vWmkxcjFCOHJnT0J1YkxENER0bTNVKzh4a2RQano2bHhX?=
 =?utf-8?B?ZEJkVFBOZWdOeno5T0pWenpncmpTWnEzU25oeFlHaGx3dTZ1UDg1V2ZVajlG?=
 =?utf-8?B?T1oxb1orL05kbXl2WHUyU2VGekZIbzZvSTd3M29Dcm1qc3JUV1lJRklMTjVV?=
 =?utf-8?B?RHFKWHJicTRlMzdsbVhQV2JES2owdUxIT1FKaGY4ZmhpSzNBTnV1N3dCRkhU?=
 =?utf-8?B?azlwVDhzZktyNXltTTl4cXNtM2Y4MzlzYTFlV0NJazNmczYxMXF4TnM5S0xl?=
 =?utf-8?B?c1pabFN1ZUMvZklRQUdBSGhiT3d2SWJKclgvanNUK0lnSUpzQmIranI3UDFC?=
 =?utf-8?B?U0NYZk9LRHNxWVJpZ2c2YjliRGlJT1NCNHI3cHlncGU4b1p6cCtGSEJ5d3dS?=
 =?utf-8?B?ZHRUNUpTT0ZWdGdOOUZBMXdZMVh3L2NmWDVPQlJYN1VtTi9QZlpURWJQaGhX?=
 =?utf-8?B?Rm13STJ2RWRJUjkvbDdIQWxhZjhxOEdvbEE4akM2Z24zc0xLb3JWU0ZSRUlZ?=
 =?utf-8?B?cyswQ0JwQktnWE9Ea0tVQjF3RzQvRThEYVREZVhqd3dBamRtZlYwV3owWVJi?=
 =?utf-8?B?OFZuL3J3RHNhMzYyT2UxczhtcUdlcVY0c1hld2RYdW12SWp6OFRwZVJJeVhV?=
 =?utf-8?B?NllGUS9ZYzFKNjdTaTdtR3lxMk95WDZjRjVkbW5OU29yYmxVS1lNQnQyREtY?=
 =?utf-8?B?aUFxdmRXK3J6b3JaYXlKRCtkcm9WUEh3bWw5L3RsdFJxN1VsNVNYV1QvQ3FS?=
 =?utf-8?B?RzNJb2lNNk52eFNTNUtlakJEMnV1R2dRTWNodllDeS9oYTBEVHk4dXVJVzBW?=
 =?utf-8?B?cllpbW1WNlBFN3V5WThkZTBDUGxmb0VueXg1am9ZbkFJMXEyQms2UmNPeXA4?=
 =?utf-8?B?Sk5Yb3o3aHBpbHRMaDFEampvVDBoemY5SHo3RUo3TzhrQk54c1BBY1BqNzFS?=
 =?utf-8?B?ZVlyUkxYc015SXhibjYzenlWUmdMTUsyTWQ3c1RacHNTRDI0bUZ2YXFVN1Z1?=
 =?utf-8?B?cS9uZC93S0x2QjNoakFUSktwYmU2WmpRZVM3TGErSGJnZ0V6MWpHelM4U0JK?=
 =?utf-8?B?R2pLN1JNUHpnMC92eXRmS1NXM2RTRWdxaDZtNWFzS1cxLzNjMWhpaEp4azN0?=
 =?utf-8?B?cjE4VDNGOXVYYW1Jdloxc0FrVnFTRllDb0Z1ZGdrYk02cnlURGhDTW51VTJw?=
 =?utf-8?B?RlB5Q0IrQzRKaFBydjBhejBzTzFoUVFlaFRoM3JoeVpYY3YxZGw0cGg4ckc2?=
 =?utf-8?B?VENiUVJmNVI4UG9RWStLMHpnU1p4dW5LWkcxWHI4VzBzTmh1eThWL0VGV09P?=
 =?utf-8?B?QWVSMG4vQnhzZlVkOWFSQkFLZU5hSWJFMU5vSGp3U1NweXNlNzVRU0NyVFJk?=
 =?utf-8?B?VTl2SjlEZjlyZG1RUEcxaTRBMm40bmtaeVNlUW53TlF2S3ZPMnZzUnRNMVlw?=
 =?utf-8?B?VGU2Y2JiQnJhQ2x1M3lSNDhIMnpVRzg2cDVWallTSXMwYlBHMW1HcjRxTlZz?=
 =?utf-8?B?OUlLZU9tOTAyZ1R5bFd4Ung0d2k4WFdvNm8rUkUxaHNrRVJHdzJOK2ZDVjZn?=
 =?utf-8?B?SFUxQmdrVkp6T0tINmdOaC9qUFpqcndaTUM0REdKQjJmUEpsYmZqZDczVzkr?=
 =?utf-8?B?Z1VHakNaRnpqMjdPaWRxNDgvVldkMWpKR2NlWjdFc3krek9PSjNoamQrT0ZB?=
 =?utf-8?B?RUdidjNHcGUwVU5RNHJDdFlndjIxVEpkV2RuQTBxQVAvMURUVjV0bkM4VFM0?=
 =?utf-8?B?VjZIOWVUd1JoanFSalBZaHQ2aHNhKzk1ekpTenl0cG5ISFVMNG5NeVVFc1M0?=
 =?utf-8?Q?rZnt3NfHlE5WDvI2Mlzo7iXF1jhjDqYCSvZZSUAXbMbO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9768cd-f03d-4bae-9966-08daf3b42a06
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 09:13:55.2178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DzwImJQv3LhA+jlSw8GSQoFU2L59dEPS3SMfxIrN62nr0XUmPt58ytpZeMpmIId
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4551
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
 shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This needs to be squashed together with patch #3 and #4, otherwise you 
would break the drivers in between.

What you can do is to separate the GDS/GWS/OA changes out of patch #3.

Christian.

Am 11.01.23 um 07:35 schrieb Somalapuram Amaranath:
> Remove page shift operations as ttm_resource moved
> from num_pages to size_t size in bytes.
> v1 -> v2: fix missing page shift to fpfn and lpfn
> v2 -> v3: separate patch’s based on driver module
>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_range_manager.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index ae11d07eb63a..3703cbc6d368 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -83,9 +83,10 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>   
>   	spin_lock(&rman->lock);
>   	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
> -					  PFN_UP(node->base.size),
> +					  node->base.size,
>   					  bo->page_alignment, 0,
> -					  place->fpfn, lpfn, mode);
> +					  place->fpfn << PAGE_SHIFT,
> +					  lpfn << PAGE_SHIFT, mode);
>   	spin_unlock(&rman->lock);
>   
>   	if (unlikely(ret)) {
> @@ -119,11 +120,10 @@ static bool ttm_range_man_intersects(struct ttm_resource_manager *man,
>   				     size_t size)
>   {
>   	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
> -	u32 num_pages = PFN_UP(size);
>   
>   	/* Don't evict BOs outside of the requested placement range */
> -	if (place->fpfn >= (node->start + num_pages) ||
> -	    (place->lpfn && place->lpfn <= node->start))
> +	if ((place->fpfn << PAGE_SHIFT) >= (node->start + size) ||
> +	    (place->lpfn && (place->lpfn << PAGE_SHIFT) <= node->start))
>   		return false;
>   
>   	return true;
> @@ -135,10 +135,9 @@ static bool ttm_range_man_compatible(struct ttm_resource_manager *man,
>   				     size_t size)
>   {
>   	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
> -	u32 num_pages = PFN_UP(size);
>   
>   	if (node->start < place->fpfn ||
> -	    (place->lpfn && (node->start + num_pages) > place->lpfn))
> +	    (place->lpfn && (node->start + size) > place->lpfn << PAGE_SHIFT))
>   		return false;
>   
>   	return true;

