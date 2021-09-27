Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCF54194CA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 15:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F336E84F;
	Mon, 27 Sep 2021 13:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2479F6E84B;
 Mon, 27 Sep 2021 13:07:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gby/lClFveocsFh0mC1zDSwbjNGGqgTx6ms/opFNo7NX+2b1U1Oj06+Zh0KUoVvb14t5TJ6B1WnSapfwZnWbrcYUl2vkZBhbQt7Bf1sNTKmQExGgtMafj06CnFVar5eyZ6BbiiqxsqEpdAw7unITjv71YpJ8Ks/oPQnZusIAOC6t+LSZ42kE1Xt7cKxh0RVUZdSJistPXcZjC9U9T1TwmFdUIAhmaYLDqW2IGSaoXV+CxBSf6GA2py5mwYRCgOodki4DVIe0CNDdYnTmNkguKFwW4SePK3FcZ/kvKHPjhUiRqN1mnxmj0aXy7j/ZpcpFc/MmfBHOTqcwhJfkRSVk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=0nqRpEKdCapp2xp/RdzWt9/l4dCp5s3/DqPy7uP18w4=;
 b=kECpPVQ18nk5QGi8DyAkvrbXB57JREFJlgUc9TPBI2GdcCxXPhtjqQ9f/NAT2P3bGwyQ2FPNq5vDDMvkfxcfuFfLf4Li8BJGX1kxuPQrUlul3WzRXyx17vKASXzrZxFG3NbYNX57nsIqCKUgiyQ/VGOXNQXoIzJ/czYEMxkMADDTdp0K7krv6tpwGGucyXSLr2a9pCdcOgJ0/9FRkDtvxgsknuJN7nFe6K16e0tX8+eiMMW7mlvCulg1Pvf37rXi3dgtvRcDrwjNU/D9SBClMeQADNlN11v81mnuQGTKGWhhvHyD6ULxMpDVz2Vix7O63xPW0f2kBSbSGJVcnTn3ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nqRpEKdCapp2xp/RdzWt9/l4dCp5s3/DqPy7uP18w4=;
 b=nOf6J+4nkFozaOWiw17PVabIxu1hl3lofhBSJwS28GhlFsfsSwkp5r/v3/AH0rtNFAF+RZIc+qIImbX6vtpoOMvK4a/QlGxyjt/fWgBK3HXUW5PGYFfcFt03N+mQPS5BPDD0xs8DGaiwasytzSJ1DCaRRkUMKm1e4og0NpRHUcs=
Authentication-Results: lists.linux.dev; dkim=none (message not signed)
 header.d=none;lists.linux.dev; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1214.namprd12.prod.outlook.com
 (2603:10b6:300:e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Mon, 27 Sep
 2021 13:07:23 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4544.021; Mon, 27 Sep
 2021 13:07:22 +0000
Subject: Re: [PATCH] drm/amdgpu: fix warning for overflow check
To: Arnd Bergmann <arnd@kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Chunming Zhou <david1.zhou@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20210927125824.1583474-1-arnd@kernel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a27a9db3-1186-8fea-8952-fca4171bcee5@amd.com>
Date: Mon, 27 Sep 2021 15:07:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210927125824.1583474-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4P190CA0012.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::22) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM4P190CA0012.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.14 via Frontend Transport; Mon, 27 Sep 2021 13:07:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c614c8bf-630f-415c-daa3-08d981b7be0c
X-MS-TrafficTypeDiagnostic: MWHPR12MB1214:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1214CD92309C8CD285EE229283A79@MWHPR12MB1214.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4bqRG2u9bYM75OwNaDrRvD36tWlKFf1LjhSpns0QVucr3RBqwG+83VMJRdYefn1XE0HwK1Ja9LmQwCLGwCzoNQ2p6oDAqCfjm3Gz9U13kACPEEXUoln2YQhbBeZjTsMiL50tna2oOReGzcyoLtE+0Hh3UBpTFWg9QJZQjVC9VWobbp2MFVyPud/Od+dKE3kBHXvRbbjxvmoHVOSlAVHh9+T3O1J+iRr5nlw0GbCFPADSksnERouhBFt3LrXk6itHXRf2N3ayWB3KXA/fRa/UTVJB2zLl83GuUqbz+zjz0QdzNc7iVZM4sgCNsIitgDWIbdT0OR+JEJhEgYPd5EyZUqhm0ZAFS1S84avulzwx2fjIBHWRCoOrE/3R8W/IgvCpNtk+YmBS7X4koq+eTtQjgu9ddE1J991r5nGT5X9MJ2RZds0HoKFxNtU+YHX6R43HBO62pjYK5e/Bdqor4/0a+JJh3ErNYQe9q/zSLdseJjTG14HMqH1o+9wMuDvayxf41ToCN5L9D/7m6J26beAI1EJsM8BARvV1PMEd6a4MCJlkb5mOCSEaW8LfdTibCl3WsiyxMlBv35e1U1XfbV1LSKYM/gAF0sSFdaWQI87yXEmhpaD3Y06JJUi60DxVBpGC+KjlyOspgiXbFVG74+csNyyB/vI6mD7HLbQb5rw0SQPHIUa2YeAsCkTAQ5qofZU53Nd72z3mS4X6sluuuw36sDtlphNc1P5i6Q5cHOmoBI74YRXxyMqbomzTNzIMn0KA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(36756003)(6636002)(31696002)(86362001)(26005)(110136005)(316002)(31686004)(38100700002)(186003)(5660300002)(8676002)(16576012)(508600001)(6486002)(2906002)(83380400001)(7416002)(4326008)(66574015)(66556008)(66476007)(8936002)(2616005)(956004)(6666004)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGdOTW5ISTJ6Q2lLcGhsdUg4R0loWTVCbTVVT1E4VjNCZ3J4aEgzek5VMDlh?=
 =?utf-8?B?bzJZV1JQUmlyVlRwY3d2RW9tYXZQTDJDZUt1Tm5qSU85RkhEVU5mYlp0QzJk?=
 =?utf-8?B?MHBGZEpRZmYyR01wQk5vaStFbDNibTVFZFhybjJGZ3oweHlnck1kc2swRnVL?=
 =?utf-8?B?MHVKejhlMDVVd0szM0ZFSUlmUVNqUytHRFdPMlNvYmlDcEdUTExHMW4za0Mz?=
 =?utf-8?B?RHBsTjdkb2FhcWRQcGs0Ukk4NElVRDE4UitRQ3E4d2RqbHpuVWZ2ekdXb2Zx?=
 =?utf-8?B?L0NzZ29wdFBhdUpVZXpZaDVDb01EeE5rc3ljUGtrenpva0FyakRVLzNTcDdE?=
 =?utf-8?B?Z0xOL2hxZXZoaW82WC81QjRqYzVoOHZpRXpGeDZCdWxXb2lIaXdqYjBLclhq?=
 =?utf-8?B?ZU9jd0JZMG5yWHVqeGJYYWx5S2I5cExZQzZ3OVFmTmJ1OE8rYU95MDlWSnhQ?=
 =?utf-8?B?bzBkMkVUV3Y2L2Q1VnRIS1FrQ2pWT282UE9mellkcU9sNzlPRUJlYVp2K0ZT?=
 =?utf-8?B?a3cxUStHamcyUkp3amZFdFlsTVhQQi9XRXJIZCtRVTNZeGlmditYbXo2djVH?=
 =?utf-8?B?Y3dmamw0a3dDR1gzUmp2OTBMM0p4TjJ1Ny9iWXFLUHlNYjV3UXNEbGpTUmxa?=
 =?utf-8?B?S1A5R3Bxb2hwMnU3ZDRaUCsyZnNuZ0FXSGYvZERYSU93YXpKY3E5SklocXZ0?=
 =?utf-8?B?WjRhWk1IeUNtbndib2YwQWFvQkx4dUhKM1JIUWE1bVVlNlZJeGxCd1FYblFY?=
 =?utf-8?B?SEN6cTc1WFI3US83c2d2aXdoSXl4bXFJTFcyd0tVeFF1NTRLbEdySjAwaThE?=
 =?utf-8?B?UHduSzBMWFpFSUp5NW9Wcm5OTktTdnpvSkhWTDQ0Y0VyYlFKbjdUZ0dEZWNs?=
 =?utf-8?B?UDVhRS83M0tJOVVuTndsb1RaRHMzcXJkZzdaa3BDNmJIMWhtZ1czZ2ZhYm5v?=
 =?utf-8?B?RlNXSTRJMFBJOXJKVTIwTlRSUjJ0K3I0aUFVSG1uYXcrWE5qeDMxSUo0bXNx?=
 =?utf-8?B?V3R6YXZiVHZ6VmwxdHhzdmNDNDRFb2VWUDUrVWRtRDFRZzFzTldnd1dkVmFN?=
 =?utf-8?B?ZDNCWDVlMVA5K3RmbXNFSzk0UEpGdDdWTzZjbXR1Ym4zeDdTWG0rNXZpTEJp?=
 =?utf-8?B?MnY2QTUrbmR2d0ZudktmWE9USE9KVkRaV3YxODFiYUNoYlZ2TE1JTGMxbnRG?=
 =?utf-8?B?TkgrNmtFTWdjOVV6N1EvRWhJemh1SHNORG1WMWI0dHdySkVqK3Y4cVdNelA1?=
 =?utf-8?B?aUdxSGZaaEFabDRPUnBaaTVsR1EraTRrWjA3RFVqUytNaDZzUlVNUTlSNnNv?=
 =?utf-8?B?NDZWQ3VQYWk0ai9uTkhncTVYMHN4NWtJdTVtN2hmdkFienpmeURpV3diTW5Z?=
 =?utf-8?B?S3BQY3NWc3d1dTdYS3d4Nkk3TnBvVHI4MjY0TW8ramlQTWlCVkV6cC9YQW5U?=
 =?utf-8?B?bktnbWRXaXI0b2Znc1lJOTQyMnhvdU1sSWtieW1URTNYT0o4bEROajFORXJt?=
 =?utf-8?B?RzJydWxtb1cxaXNKc0JtY2VhZUdjY0JZdTFKZTZibWZLR2ZuaWZ3NHJQTWtX?=
 =?utf-8?B?OEMvaDhxYlVXcURzSkRiN25BT2pFRFFCOVR3Y3d6TXROalh0RWszS3k2Wk16?=
 =?utf-8?B?VVV2VFRpTk4wRDBrYjhuQ1pnVzd4bnQ4K3BlQXBFYW43T2FET3cvOTJDTm12?=
 =?utf-8?B?SVU3OVVXRm9QWldwaWNoVnZhbzBpN2haeHpRR0tlVllRVWlNMWpaT3ZFWm92?=
 =?utf-8?Q?fRscZfKJHczFmo4ASB6hiKwxHnnCwc++sRtvSLM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c614c8bf-630f-415c-daa3-08d981b7be0c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 13:07:22.1865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18j7vu7pt+Tg0B35T2AN+WfWf/ms0W05jvlvfR2SRHQYX0WYKBTPsFtgJFF50RZZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1214
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

Am 27.09.21 um 14:58 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The overflow check in amdgpu_bo_list_create() causes a warning with
> clang-14 on 64-bit architectures, since the limit can never be
> exceeded.
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:74:18: error: result of comparison of constant 256204778801521549 with expression of type 'unsigned int' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>          if (num_entries > (SIZE_MAX - sizeof(struct amdgpu_bo_list))
>              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> The check remains useful for 32-bit architectures, so just avoid the
> warning by using size_t as the type for the count.
>
> Fixes: 920990cb080a ("drm/amdgpu: allocate the bo_list array after the list")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> index 15c45b2a3983..714178f1b6c6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> @@ -61,7 +61,7 @@ static void amdgpu_bo_list_free(struct kref *ref)
>   
>   int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
>   			  struct drm_amdgpu_bo_list_entry *info,
> -			  unsigned num_entries, struct amdgpu_bo_list **result)
> +			  size_t num_entries, struct amdgpu_bo_list **result)
>   {
>   	unsigned last_entry = 0, first_userptr = num_entries;
>   	struct amdgpu_bo_list_entry *array;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> index c905a4cfc173..044b41f0bfd9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> @@ -61,7 +61,7 @@ int amdgpu_bo_create_list_entry_array(struct drm_amdgpu_bo_list_in *in,
>   int amdgpu_bo_list_create(struct amdgpu_device *adev,
>   				 struct drm_file *filp,
>   				 struct drm_amdgpu_bo_list_entry *info,
> -				 unsigned num_entries,
> +				 size_t num_entries,
>   				 struct amdgpu_bo_list **list);
>   
>   static inline struct amdgpu_bo_list_entry *

