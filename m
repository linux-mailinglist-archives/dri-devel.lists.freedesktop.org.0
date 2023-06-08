Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7E0728637
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 19:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F9F10E5FD;
	Thu,  8 Jun 2023 17:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10F810E5FC;
 Thu,  8 Jun 2023 17:21:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHgUu3HsR/rPUWOnz8nF9nEnoCfvZcfRuUQH+KIam8jxv+z+CG4UHwNosqCrmB1pqUkLxongt3R6uV/0RSNN26qp3tjzIGT3nK40pLfGBRbFJmyAc98YlIKBXS9fgrGFRUqLleU+EUCPVa+mf+aamjuTqe2HdqvBK5aSF/pgpdsWLjZEh+c6/CZH+rIDL/ZBHC8bFW/ReCj3YCI7Qg9GwFTZ3Unhofp1vBaPo2qf8LwdpGWL8zF9wlAR0WZJ9H3VIcNPswZaSgD7Z33mLWww+j3KF2KGdZGY3FB+/DMpTQu9dsPij1wF8ywfcBRXA30wx6Lc9d43Z0IowkZw+qqFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rR6QPWwwSgd9JdZ6oiFM1eUKJ4/xl3D1dmoihqFzrI=;
 b=DhESneuma4NZ/pCsBUamEA8Fs3Eh/Q8Cyz4W4K39rIyYDymPJ7Pr7Aavl1qwVf4dOFm5Hg+sb6oldhpliU6ezauFg0RS0oZwANek8d5xaG1Ruwc4dxd0/94+MX4h2BqqcevL63KM7aWd5Ch/fMdEhcIZn0eMeHBrBfLcfJvoZ3WUAJQ+vZqowTfAtzss6VRssFnriMsgw2VjoBzjAZjbFWkVkeidIWK2GQ3ke8ClR8pX5FFaQFekMr7SPZQlzTDl6rBcgITCCMTJdviJ2tZk0JpZNegcNLyzrX9OaXFuMperZgJyWqVfyBpT/8CMBrRkTx7Oc2OIG9s9b4rVcDGzqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rR6QPWwwSgd9JdZ6oiFM1eUKJ4/xl3D1dmoihqFzrI=;
 b=mHjxoIkfvP2SXTPX0mXEqMCOgCMaaO2bK01G4jwN7B3QvVSXcawikofTWwsDqqZ3f8WUceqWYImIyOJVTl4Cxp5LLXruVtSNoCv+Q0NZmfDOARm1Finj8Lig/vD/AHBFrQkMRlpsri+DlK7vvyu7uiEI2T2+TLSsx6DRZH7yZ8w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DM6PR12MB4927.namprd12.prod.outlook.com (2603:10b6:5:20a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.32; Thu, 8 Jun 2023 17:21:14 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%7]) with mapi id 15.20.6433.024; Thu, 8 Jun 2023
 17:21:14 +0000
Message-ID: <4ba2d1a9-2bf7-a25d-754c-c1d1d640baa5@amd.com>
Date: Thu, 8 Jun 2023 13:21:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amdgpu: Wrap -Wunused-but-set-variable in cc-option
To: Nathan Chancellor <nathan@kernel.org>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
References: <20230608-amdgpu-wrap-wunused-but-set-variable-in-cc-option-v1-1-48ca005f2247@kernel.org>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230608-amdgpu-wrap-wunused-but-set-variable-in-cc-option-v1-1-48ca005f2247@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0322.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::24) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DM6PR12MB4927:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c879026-2129-4b33-eaa1-08db6844c2b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J1JBtgmssqSYaJyTI5eOtgIm4Bbg7wMtzYbFoDrQkYN2w5taTK6oX6Qku9UtUWgyhil9pG3GefbK8ddebGMJa91ZC2HlnQS9JJ8nCXiAsTGSdJz0JOeN41au3xJ7pMIInquxMfcm53vU39Z21k+iHm8rWIm4icoMHiRwOe+QBzUcoqXmzPmIQQ5htXVE619FVsnEq0IJLEeoFyE8okD/aVvsPECBU9ipJ5FVHBUlhKNPZeDhT2seKW8obOf+FcN6UwOjU8+vVsYq+WvKtBkTn+ms38P6sgWaF9oKDpBqQ692StHD5g37prBvebTZN44+GWqeuymPisn2+965KUk6+bAfGd+NRUhYEtnwvDIvvJ4wLH9Fu6UF4LsRM8gGz6ueSl414oRNLyKjh3oxt431PzBslS7Z48HKWdoEhJN4ovNlvNfLI7/Q96/dSr9KR0SHrxfxs7tQXy9AQ9n9K77yx1ckOp41C2RqtsSN7sTcxBDm23f11xLRUv7DZay9/IFxlpVr5S83Sz+iFoJ3++Ys442ga/WXD4A+5Q2JCIzWBCeltsz4WZ7DmEVJ4tQ75prZ0VnCsuTVA990jfYiD/4URMqCiqCe/dOCkRHg8hJF6GMu4aqyQgEBSFOvkCA21AximfAinx0Ql5EwA7RDrDU+AA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199021)(41300700001)(316002)(478600001)(44832011)(8676002)(2906002)(4326008)(66946007)(8936002)(66556008)(31686004)(66476007)(5660300002)(6636002)(6666004)(966005)(31696002)(86362001)(36756003)(186003)(6486002)(38100700002)(2616005)(53546011)(6506007)(83380400001)(26005)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OG8wUGRnSEV0MjJHaEYvb3FvamVTQUNwZWJyVzdtOW9wZHdHNjREWDdYSWZm?=
 =?utf-8?B?NHhGNzlpWFMrQk1DbWhuZ01BSHBpM1F3TXV1TGJyTjJNUVdmdDRzK3MvY2Mv?=
 =?utf-8?B?Q0NnRFF1eldOT25yUVQwNmNtQXJYT2xhR2phMWw4YWUrUHlKS2FHT1pSZmJu?=
 =?utf-8?B?MCttcG0yUU8yVnAzY1FLZktrek54dDMya0toY2JoS3pCK2llVjVsK1ZnTXY5?=
 =?utf-8?B?MitqR0M5VWV2d1F5eG9tbnNnaU1EMDRpYkwvdUVVbUZrbUE3dUVVbUwwdWk0?=
 =?utf-8?B?NEw2Wjhacm1zdTZvcU5RcUpwNENWM2k3MEFJSHpOTURnVVhLcks0ams3Mmt6?=
 =?utf-8?B?WWZ2dDZpTzBqL1ZGNUtiSTZCcTN3TXlTaUE0U004dFJ5SzhQU0JVSDR5WEhC?=
 =?utf-8?B?VEEvdmNlSDhkY2ZsVlVBa0pMV29ieE51OExnK0dqVEs4L1RMYy9Vbng2ZEF3?=
 =?utf-8?B?UVJnL3B2d3FFUnVZWEtNQlN6dnFNcE9Qb04wMWN3RUtNMDAxbzA5Z2FmNmt2?=
 =?utf-8?B?OHJmRE9adXozN0RQb1Q3ZkJVTlNuWVRJOU9vNkk0RGwySUFNcmlZd3dMSHZM?=
 =?utf-8?B?VXVuTW9hbk5DZzhXakpCKzIvcklYQjRNUS8rbS9JRmJCRDR0SG5mWEFQc254?=
 =?utf-8?B?QnlyMnU3bWNiZjhUcTRqTHhUVDViNE4yakViL1ZwSUVYc1lyVThVc2lXRXV3?=
 =?utf-8?B?WVZFRjVkYWpIaGlTQnkzMUlXUXN3ZlFoYWdmSTZ6RlIxKzM0ekRYazFJdjdj?=
 =?utf-8?B?TERTV2s4T1MwTDV2VytkV215ZkJlaVlpSHJNV0dRNHlEOE5zL3hZTEVUYzBJ?=
 =?utf-8?B?eE1LNTJnWkUzN3hEWlJuYzAraDhyTzdHZGZGZzlicXR2VnNMOFZhek9Ua3FT?=
 =?utf-8?B?Qkw3eXAveTFvTityNWJjc3Q3WkprRGFEUlNlT3p1em1ZcG80VmNXVlU1aldi?=
 =?utf-8?B?OUhEakgwSTlhNUdHbWdhMzFUTjhkajhhV1NVek1DQWFJelBUKzlwUE1vN2V2?=
 =?utf-8?B?UkF3NWZxYzI3NWNDSlMvakxySWV6TWoybkdkWWR1a1lCbWMya0NvM2FkM2Z1?=
 =?utf-8?B?NTU4ZmhnQ1RzZzNiQ3IycnBRaTFmOVh6UjRwd3NGUExtSEZiRWM1QWtOSXdN?=
 =?utf-8?B?bXoveEVWNWYrMnY0NEtKOWFVcmhWVEFrbEtDVlU0cWRiU0pvU0lVOGdWaHAv?=
 =?utf-8?B?YUtiWU5WbWZBbmRrYmo2Wkw2TjIrS0s2cGNxaDVxdjUzNDN4RWpodGxWS0hJ?=
 =?utf-8?B?Rk1DdnNqeUNlNlpzR3I3NTIyclJPMlV6bTYweHJpeTArN0U2STJ4Wk5YNzRH?=
 =?utf-8?B?RFVkSWpkUURQK2ExOTNqUkM1aWV0aUhSaC9kaG1NR3MranVTR2N3NVlZZk5K?=
 =?utf-8?B?UGVKemVqWit1c1Y2QnFpYW02aUJHMXVoK2hTT1ZhSHZXemtZbDRqTzBRbzQr?=
 =?utf-8?B?WUlkOHY2MVVKRTJQZC9Ic3dibUhScVNLd2NFYmJVSFdqcHV0SmpzNDJ0dTJQ?=
 =?utf-8?B?QS9Maml0Q3ZvSnpBUmFlanpmdjZIb1ZVYkM3cHVwSVpUK01XSW9TTEJoN1R3?=
 =?utf-8?B?aXo5WEd6RnRoMXQyUys0NUxGYzF4bU5RLzNkaCtsRkhOK01IZ3RwSzZPVXhM?=
 =?utf-8?B?cWFKMmJkSVdmakFKNXVDbklZMjJZdEJFN0syUzFWcXdKb3pMK0dNUktsWVNp?=
 =?utf-8?B?aHFHVG9wWDhKcGJKUCs4QmQ1akFsQnB4UFA1dFB2dVlsOEZhTmo1OEVGRk8w?=
 =?utf-8?B?eFM0aXlUQXl4ZW5pWkxxa2NFL0tNY3JZSEhFOERKQ2ZtZlp2Z2cwNzVocFNY?=
 =?utf-8?B?bFArSVhGSXkzOGFuUjV3bkQ5RjFzMCtUVFRsWSt1VkIwU043YS9QN1MzZWxl?=
 =?utf-8?B?RXduR0dOVWNxV29RTWtQd0gzUnMvaVlmNlRjMUpDaXhqdTlZRm9YYU4yb3pm?=
 =?utf-8?B?Q0UxdGZ1dk1qK0RJRlc5b21yQlZuODhVTVNMUHNNQkZXQTVLd0tyRUluUmYw?=
 =?utf-8?B?VkFiTWhoUi94NTF1aHZpdWZXN3ZoVXZ1bzhmZzloL1NjUnpzQTlJRXl5Uy9T?=
 =?utf-8?B?dXZxdHNrV0NSMFJOZzVkWG1LbTJlSmlhc3RvZEo1QVpJbkFGcDVmTUFsVU1T?=
 =?utf-8?Q?z3+zI/JJL5SGR1zGyBLCiGyyU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c879026-2129-4b33-eaa1-08db6844c2b9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 17:21:13.8865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXy5DCKpxNd7ebCY0lT+ALWDeI7/GxLSBC5+s2MEzNtOgJ//XmbuAPOacuG22HeZBR3ZlQkiK0LNmU4TlOqbDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4927
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
Cc: trix@redhat.com, llvm@lists.linux.dev, ndesaulniers@google.com,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Kenny.Ho@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/8/23 13:01, Nathan Chancellor wrote:
> -Wunused-but-set-variable was only supported in clang starting with
> 13.0.0, so earlier versions will emit a warning, which is turned into a
> hard error for the kernel to mirror GCC:
> 
>    error: unknown warning option '-Wunused-but-set-variable'; did you mean '-Wunused-const-variable'? [-Werror,-Wunknown-warning-option]
> 
> The minimum supported version of clang for building the kernel is
> 11.0.0, so match the rest of the kernel and wrap
> -Wunused-but-set-variable in a cc-option call, so that it is only used
> when supported by the compiler.
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1869
> Fixes: a0fd5a5f676c ("drm/amd/amdgpu: introduce DRM_AMDGPU_WERROR")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/amdgpu/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
> index 7ee68b1bbfed..86b833085f19 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -40,7 +40,7 @@ ccflags-y := -I$(FULL_AMD_PATH)/include/asic_reg \
>   	-I$(FULL_AMD_PATH)/amdkfd
>   
>   subdir-ccflags-y := -Wextra
> -subdir-ccflags-y += -Wunused-but-set-variable
> +subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
>   subdir-ccflags-y += -Wno-unused-parameter
>   subdir-ccflags-y += -Wno-type-limits
>   subdir-ccflags-y += -Wno-sign-compare
> 
> ---
> base-commit: 6bd4b01e8938779b0d959bdf33949a9aa258a363
> change-id: 20230608-amdgpu-wrap-wunused-but-set-variable-in-cc-option-0be9528ac5c8
> 
> Best regards,
-- 
Hamza

