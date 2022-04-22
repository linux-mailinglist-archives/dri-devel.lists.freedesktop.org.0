Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB4450B3EB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 11:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182E210FB10;
	Fri, 22 Apr 2022 09:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41AF10FB1C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 09:21:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeZ1aKGuSgg+DBE5Eb25HdFxB2Y3DPxHpINOnLdsQV8n+tpKUAQeTrKYk3tOfC/pjwpTFUTFOLk+z4TDZFtxRIoRfEyMiqXTK9p8RjiBLJi/qMSBUMN/qyknd4k3tdPJ+U2IzqyLFxJnO9n90X0tbdE07Sr/3qq9p8LddCjltlDhUU8QnlsTeGRTku4r1NnPH02CIhMYBPAcnchz37ErHe3NlfnURxbCZnBtVmv5oj95e5FiQQzzj7HAdFns+qQTCYThVNniUdxOz0eKKaSVXCXHs1sqLnwZH3Z/GtCnGJ6Q5g2iOPc+k3Dl////9Nf8GUeU62TZ3lvggmRdMoNCEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIADn4OaQq/yw2DTrqZlhb3a82DRTUam6u9S85Fp1Ak=;
 b=ZbbrMjXbD22IL/UO3IvfkyvbjGK6Ple76oTUyWUrWZilI3e019v/WH4J/maX9MT/PCnzZavtEyiPRsHjAaWlCYzOq8DSeRfArL5DmmfbPwas+cgpd6L+7/gci/pISTtMrB8iru1t7jm2TPZp6+vzyWmrrccNugJIm1v/rAPtqlIVghELLeW+V5OebprwhzBXcK+FTMHtSKqzDKRbPWTWOpUMQkPEwAZHXcZxXcMgFKx7NPfQs9Fkh6HhzLQB/v6OBl5JsWl+Ojh+uJrSaRWp2643x2LUh7hLtd6Eg3zbvpDAyl9Fc4VE7+6rBnWaMJLXqIPo80aR4i6pvmFNm58a3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIADn4OaQq/yw2DTrqZlhb3a82DRTUam6u9S85Fp1Ak=;
 b=05JLUmLGeC1WmAJLH3/SwigUMoC5FGiP3x1r+cCyh61nkGM0w+mZH0i24KhdIzRpcM0oafMK3DhXIcCpxA4oSXgAgqdvPXHM0R/LbNrt2clqmmkX1dTaIxQvDw/FWF1atqGrTmiB5sEFZW+q3sMaQJRwk+Okrmc84AI1Wz+4GBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4573.namprd12.prod.outlook.com (2603:10b6:806:9c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 09:21:42 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5164.026; Fri, 22 Apr 2022
 09:21:41 +0000
Message-ID: <2dda3fcb-6edf-3f9e-bfd7-34272eec55e1@amd.com>
Date: Fri, 22 Apr 2022 11:21:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/vmwgfx: reserve fence slots on new resources
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 zackr@vmware.com, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org
References: <20220422092002.32427-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220422092002.32427-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0188.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd890879-4714-44a4-7a6c-08da24418274
X-MS-TrafficTypeDiagnostic: SA0PR12MB4573:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB4573B537D24EFD05D4968A4983F79@SA0PR12MB4573.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gmFIGXyUQS/lQoDXIYLfPUm1piJkRCePP3Y+KcGGY7HTx1wH+mnu/jttgD89P3mZV/LQUj0DnjoOUSShb8Scz5NF1p8TyBczRTuHC6/+UBC8BRzLXQcIpt7tfYiE5Oc6IbHFmwa9RHdWZM8f4hTk+bl1xj7eFNFa5kKnAECZs3Zfu/bja+RE4yTByOA53ZKHJONmdqF/QhgjZZ1DCBzaAgB8OjytR4AveZoIVffqAr1ctpP7MUd7oO52eDFLWA8ayWG4QmdN/ohH8/kP0h4w4vGSaoOFc4s1VyBkpM/BP+kMgs56FmZ4MqQQj2xtyqnuTRFzyCX1bP6Hx72/1dWmq2rQsofahCGYXPaFCHcIGZXpHik38EaAIRzhnpLabKUoG6ukuHRUyaL/6jtEt3NSs0pVb+x+GpSOsrq4CJ9C0RH+UFxvrytkW/G6wCzF4XnWRIw1fW8EejwCqvD/TYFjSbXnSYljD1s9UGugBhFuZvbd6063Koc7waRXpXR7Om+saOmWZZ3recqzQz8AI/l8BJSHfQoF4Bp0whXCdDhL3vXZSnbtXgDIT5agzTyv7sUNJiGSr+VOvbcwgQ6dPqB1oBUKTBReTGVOk1yy0vZGx/xeTsZPXZfUnYLKhg313qXl0jCbGGSBsFVyBCw2mNJpwzji/DlbxEnO0Is8plwjeGmt7kh0XE8zjQRWqbFKCowX6lizOXj73z5SrlRVhtoLbOysoiYGW4mrJsAdKN/EVW0ZcCnfu1cA5sh3jDmRARGv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(66476007)(8676002)(316002)(8936002)(66946007)(5660300002)(83380400001)(31686004)(38100700002)(26005)(66574015)(2616005)(186003)(36756003)(508600001)(6486002)(31696002)(86362001)(2906002)(6506007)(6512007)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWJqcmhZRlBqeUFGYjFmQkowcDdUOWw0UDNEbStYL25JcnlPV2tCNkZ6TVVa?=
 =?utf-8?B?YWxKVlo4TjgvR1FWQjVWczF2ZjhYU0NQWjlSc1pseEI3b3k2Z3hqTlE4OE12?=
 =?utf-8?B?ZXlWVG9uZFZ1OXJ1MFk1L3d1TkkvYjJ5UFdHUThHc1R0bTAydm1YZlcrYit2?=
 =?utf-8?B?RHRZV0J3cnFDRUNSczU4OHFnQnZjQkF2TUNTZ0xIRS9NZHdrZ0F1YmllVGxx?=
 =?utf-8?B?Wm5tNWUyNUJWRzdzcWhWZ0ZVcmJVYlBuZCtJNzRKQXdaRWJCc2RGSXVLczB3?=
 =?utf-8?B?N0dkUTFLdVQvaHZqQkg0eXBUZHZCYUNyOEc2eE9jSkg0bVhzcDM4aTdTS3NO?=
 =?utf-8?B?R1BoRERFS1R0L3ZOOE1nRC9HekU3ZldRY21IQU0rQVdzcE9RQ1FGKzVLa2d4?=
 =?utf-8?B?WDB0a2JGUFhtK01oT0dyR2JHMG5Uak80S2xOQkxjZGc4UGE0TkZVQ2Q5bTBB?=
 =?utf-8?B?T1dQZzhpYXlWeDdSUTI2QU8zNjJONEtUV1ZYVFgyQ1JyeC8rRXZxazh3TmZa?=
 =?utf-8?B?VjQ1TDVLSjhmeHpjUm5oVGQzd3lzT1YwTjJNdTUzOUU3TzJaU2VFRjFJaFdG?=
 =?utf-8?B?WnJ2WC9GbTJweXRrSjAxTDJTUHNZSmpsLzRFRjNiUW1mZExzUzlYTGsrVWxF?=
 =?utf-8?B?cWErR2lwM0FhVDJtSVYwMmJVcDVxaEdWWGFqRnY5SWxWd3haeFF4SU1HUDk1?=
 =?utf-8?B?QThvV0VxZStMbE9aSCtDMHJEWXlBbmgzd041UDhjMnQ1UXV1dUVNSUxkVXlw?=
 =?utf-8?B?N0hxcnJERVZKSEpLVGFkSll1MnUycWYrR25VUWNYMCs3ckVjK2Vtc2RzZEZt?=
 =?utf-8?B?RlVhcHZtUHNsVE9pUUNKUU1xbEM3dmdoUjdSamRFZHRobWhtc3N3QVoyR3I3?=
 =?utf-8?B?Y1llSDk2bEtmbWttSUh5ZXZOZGRoQ3hHSklSQ2E2ZDV5cjB0V0t6VktxRk9k?=
 =?utf-8?B?cXJjb010cS9zOGljdzIxQVdIdk52aHY4YllqeVM1dlZFOW85Y0ZZUmxJM0FR?=
 =?utf-8?B?dnYrT0l5ODh1VkRPbkpPRFZWTXdDSEI3U3JCT0Z5SXp2RVNZOHd4RGxPNHVl?=
 =?utf-8?B?bjFKUWRraG9sYWlid0NuVFVhbE5KMEErY2h0QzYvaDRpZ3A4cjRtZnZRc2l1?=
 =?utf-8?B?VEhGNDVmNU9pYU8zWUlNc2hlTTRWTVY3SGxWV0pCQWUvRGYzcW0zVTVXdHpv?=
 =?utf-8?B?bG1GQllVNENYWm1iUFhSbkRiV3llcjlKSXJ6M0ZXejFRZHJMNjJKaVlyRndF?=
 =?utf-8?B?VlNlSzVJcEFrdC9YUWhPM0NRM2hHUjU4WUJWT1d0aDQ3b0llcnIyekY2UEJZ?=
 =?utf-8?B?dnRUbzZEUEF0eEJVNnd1Z2JJTTVYWklmQUU5RFZPb0REUnhvVHdpZThhUmVG?=
 =?utf-8?B?My8zb2UrQ2lkZkpRa3ROdHUzejFhVWF4RHI1UVEySXdZd0hGbFBCc2dsREk1?=
 =?utf-8?B?c05pQ0FDbkVlZ2V3NjVBZ3ZxSC9ZM2RzU0pzS0tGcGpEd1JFbXFmY25KSUs5?=
 =?utf-8?B?ZXV2cUZtWjMzSm1LZkMxd25IN2ZaOGV6cTRFL2NGRGtUWi85WkpRbnlJK2sv?=
 =?utf-8?B?T2JOclJTaEJjdnNpekprcS80ckszQ2o5ZGZ4WmRySXdBY1FBSmNqYzdNb01E?=
 =?utf-8?B?blFyNW1GeVdWT3c0WEJraVoyU2lVU2VINDFyWmlseDIyMzlpU1JBK1g4TE5O?=
 =?utf-8?B?L25yVHV6WVBtL3VtVEJGSUxjZitPeFJTUkxYT0ZHYVZhVjRmeVR2bXJ2Nlgy?=
 =?utf-8?B?RHNJd1dxRDEvbllXanhUMEt3UkVGaU9UcU5RMDFoVHdoL0d0QytJRDRjdEs2?=
 =?utf-8?B?NS9RNkFKY3BISXZ0eWtIZmoyM3d2TmxraEM3VnpRWFRpTkxreXVLUFNqV0Ur?=
 =?utf-8?B?VXRROEpuMFZIS1JnQ2p6aUZkRlV1NzRBOUVXbXlQWC95RkwyWWp4YWhkczRp?=
 =?utf-8?B?SDlOZUFnRzU2dW1IbkoyWkpOaTQ4NUh6QjhtWDhXelFRZFNhcnRDd0ZnWUlF?=
 =?utf-8?B?eGxsVEMyRjdqQmFBZHliL1lVcnJlQ0QzcGZrakhTTGtxcCtkR25ERUZTRTZT?=
 =?utf-8?B?dnJac2ZHbEV3USs2eUlOeXZocis1bnJwdnBwdXhCQk13b3l0Q3VDUS9ucnVu?=
 =?utf-8?B?eW0zb3UvTGR3c2VTTno0cnN4Zkk1VEZkMHAzclhkaFBWazlic3d4MjZzbW9a?=
 =?utf-8?B?RkVMT2tLMGgrMnkyQVVOUWZ0UWlST1NpamFxZDlrSzU5cFFKVGh3Skg5aW01?=
 =?utf-8?B?ellKTml6QmRoc01yZEUrZkgrZVdJa2N5U2t3SVc4bU9kL0xOdVFXOFVRNWlK?=
 =?utf-8?B?cVdNczluMTgzQ3VuOVM5NUcyWklTZ1pBUGtrZjY3cmhsR21NYUc4dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd890879-4714-44a4-7a6c-08da24418274
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 09:21:41.1804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TAU5sayNVD/b22BQpcVWU3s3y9le6HhdzyVRb8ql4QEPLOqVnEm74I2wpIeg4nc0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4573
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

Am 22.04.22 um 11:20 schrieb Christian König:
> When resources are allocated dynamically during an IOCTL we need to make sure
> that a fence slot is reserved so that the resulting fence can be added in the
> end.

I should probably add that this is only compile tested.

Zack you should probably give it a try for your issue.

Thanks for the help and sorry for the noise,
Christian.

>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Fixes: c8d4c18bfbc4 ("dma-buf/drivers: make reserving a shared slot mandatory v4")
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> index a7d62a4eb47b..edce228f737c 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -399,6 +399,10 @@ static int vmw_resource_do_validate(struct vmw_resource *res,
>   		ret = func->create(res);
>   		if (unlikely(ret != 0))
>   			return ret;
> +
> +		ret = dma_resv_reserve_fences(res->backup->base.base.resv, 1);
> +		if (unlikely(ret))
> +			goto out_bind_failed;
>   	}
>   
>   	if (func->bind &&

