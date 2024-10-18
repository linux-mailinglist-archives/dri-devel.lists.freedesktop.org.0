Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5259A3563
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 08:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C0610E04F;
	Fri, 18 Oct 2024 06:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VLLCGZm6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231DC10E02A;
 Fri, 18 Oct 2024 06:28:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFgpU+h8hKPM9OepobumSgBUFEcW78jxaacg7RNjntF8T9xP9HeR17be4XDplHnJvTl57QuVSmES0Od79Gh0WMr1zq7aG4DxurztNeoCW7lr6UnFTJkeOKI59eLasqxJOw8118FuwUCSy1tqL8+XK8T2qxlRNWhLN+XQcGJlAAWdm2cIHb01TDpefE5zwsSbe3mZessdt1t3sLWQuwNWgkM3xHhwP2TmJtmOg6sHIpgPuy9C88WDEKeSPhJs5OV4PmqoHK0hKUF85/K/igTmwt0TBBLR+bMqwVfLQ/PqEdJMtRjxF4aR04yfCE2TQpqXlx12RD1FJa8UzrZOvLi7gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1N/TyT4O0ncZWWNxnBWicyP7W6P9C94I/QFQ1ch+ac=;
 b=vR/yXxZ7a3UKrYxpwCY50t11+4QLOVR0W3egG/EktjF5yAGxJDAH7Hg8zzLUV7ODJVr+6T55Nq7gwGJkWPrFV5IBq+LCFI6l8qaJ1q9VoULSy6hHFifRDaSzde1XyAbBkBvMQ+UYENJMarqCcUA3aJROmC4+VfRMETfvuKMwT01AvIFXX6zsh1BloxKGjrpM1DmwjlMkTYmmtGwYycYOeqAhyk7pCZ7mNhEosnMhRO51S21ALaHpS41IW2VDAWOabmfaO5WQAnaRyXiAmOIB5mnD/+TyYndhPPFwuPpwq4VBr+YuWklP3t4gMp+sDn0ExQmOy9XcmvPeRC9pLfP/iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1N/TyT4O0ncZWWNxnBWicyP7W6P9C94I/QFQ1ch+ac=;
 b=VLLCGZm6QoTbgSgCOR+s2+Lkew83qgzogHqSX9jTrFFcuxh4MKDhFfEcXnJNSfyw4sDd8mwkAfzxEfUfX55BADEvlLWidcgJkyT11f5SztgKihkdhJvA0VP6wQZs+aUs5bGwLhI1p34puMxw4tHGwF2WhLZX60ssK72q/WqFdcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 06:28:49 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%5]) with mapi id 15.20.8048.020; Fri, 18 Oct 2024
 06:28:49 +0000
Message-ID: <51a348b3-8b37-4546-9514-97d94b782d28@amd.com>
Date: Fri, 18 Oct 2024 11:58:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] drm/amdgpu: Fix a double lock bug
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Vignesh Chander <Vignesh.Chander@amd.com>, Shiwu Zhang
 <shiwu.zhang@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <2e19e095-c022-45a3-8bb3-9a9321bc1905@stanley.mountain>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <2e19e095-c022-45a3-8bb3-9a9321bc1905@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::7) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|PH7PR12MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 48edc706-2001-46d2-cd52-08dcef3e2087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHNxMUUxVENQZHB2N1BkK0hudzFRWW1jQklTTnhvaFJLbXpyRkdIY3RTR0Zv?=
 =?utf-8?B?UlhVazhPSmVEM2pUZEZiNnhzZFZmYTJsOHN1REl4aG9MMjZXcjZ1TzJuSGRT?=
 =?utf-8?B?R0xVVmNlbklmb0lUVlp1KzUrdENWMGJjRHFCdlhxNHZvb2U2V2MvNHR3MlJR?=
 =?utf-8?B?eW9BOVBFaXIrakV5aWVnNERORC83SkcxeFRBYkJEVk4vaDBkdmNwSVZCcHhF?=
 =?utf-8?B?S05Dbk9vT3JrakxFZUkvcjRJMlhqNnE3aFppNEVwdUl0K3cyN1VzcWg0WWl3?=
 =?utf-8?B?UjNidWtBZ0pwQ0t2Q3pmWFV0VjNSNVNWZndWZVAyekRCeDMvWTUvMmR5VzN6?=
 =?utf-8?B?YTBsTGQwZHJMZ0o0blUxVmlodEhYK2NFQUN2clRPMkVhWGVVVjdKd2RDY25C?=
 =?utf-8?B?aFdQdWxTSVUzUWc0cXlpeS9kaDEwUmw0dlhnT3dBTFVuK1VKNVZPaG9JRlhh?=
 =?utf-8?B?RVIrVURubm5LVW5HbStuQnAzOWV2RStSUTVyQlIzOCtlTzJ4M2duVEhndjl4?=
 =?utf-8?B?Y21ZRnZEOHVNT2NZZkZ2Yzd0WnozblFSOFpuUDVtTTNBM2xNT1dCdVpQTVNk?=
 =?utf-8?B?NCs1aUNUVVlHLzdoU256OTdCRnNRbmsvV3VJSVNyV0tCWDlVR1Vac1ZNNXQ0?=
 =?utf-8?B?M0MxVnhTOVRQU3lTdks3L0dSeE5oY3V3VjRvWG9zMzBZUE54bmpTSG5zdzM5?=
 =?utf-8?B?eG03T1ZiWDE5ekozdFlSbGtBaWtOSll0TDJ2ZkdTZ2tSUkZMYU5OdWZzQis1?=
 =?utf-8?B?b1YrTDBENnowSWVZdmpGdS8rTE1jQ25XUGNpSlM3NXkySldPRVlCRjd1ckVu?=
 =?utf-8?B?Q05HWG5xTWoyU1ZSbFRvdFJHUTFvVkVjbHlCdXhwQ2hodDNacFcyVE9HVHND?=
 =?utf-8?B?TDQ5RmkwWkJYWWdwQ2FCbzV3Rm1hSExnTUMvdVZTZnlZcGh0T1VrbmpZMThX?=
 =?utf-8?B?MG1OREZCcHdFM3ZkM0F4aHRsOUdFN0owTmNWOVRZMmdyUWEyNHV6b2dpSGY5?=
 =?utf-8?B?emFVN280clV1bllxYW1pTFF3TllqWEdNK1NXVWpDd2JRS3NZQzc3aC9QcFJV?=
 =?utf-8?B?RDduQ2JLODhDdHowWTdIdWhJbzV4bmhHdWZJSi9rcUFRVmJRTEpxcnJwelh6?=
 =?utf-8?B?bEY0QXRWeHB4aHduTzF4WTFKekMvTmhjUWlHekhZSlg1dVUydWtzU0xPWk9i?=
 =?utf-8?B?WFl1YlpOZWo2Mnd4YTUzQmtOTXh0TEYwQThWOHRqVkdiUzNXanpZOTRnbUJN?=
 =?utf-8?B?Ukc0MmgxRXMvblpOVEFSNzlGL0NCWmZHbm8xUFpGNVZVL3hmWlQvWlRMSDJS?=
 =?utf-8?B?SlJNV0x3NklNNzlUSGg0RUtPMnBCbS9Dejd5Y08wZE1CSnZuUytUekJHQlZ6?=
 =?utf-8?B?MDFFMEFIWGtaM3BFUC9HYm8wVXZwWldUN2s4T0I3LzdSMHpaLzJFRW1Pc1Iz?=
 =?utf-8?B?S21yQ3ZuKzIzTXFWRHFJT21VOEZSeHNXOXp2bkxaRVcwaDNQSXdienhyeEtu?=
 =?utf-8?B?OVZDMUsvMWFqWHJtZndtQ1ZNZ3pKNDJMS0pqYUdHZ2NqOStUMTAwaUJQWXB5?=
 =?utf-8?B?elMvWlZkMDVSODJScktIMzNTK2lsZERaY3FxWC9BUGlLRmhIc1NkOTBLMHhG?=
 =?utf-8?B?S3FDOURKOW1JUlpldlgxdk4wT25oV2plcHM2c0V6Z2ZhNWh5T0hINXhtMnF6?=
 =?utf-8?Q?NHuULXLHiLwmZ6TV2VZn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VklzYlNsTnkxcTZNZWl2a011amp5dXVLSkE4emJVV3RvQ2Z6cy94OTdkSFZL?=
 =?utf-8?B?VEZkVDhHbEo5VERPMjNjMDNzUVhUMkZoa1lhc3ZDZ0w4LzE3TWNEc3QyS2xG?=
 =?utf-8?B?TUU3aUg2UFdhZmtrU0tDdHk3cDVFRTlmZFlEczgzVnJiYUZENlVkQWpMSmts?=
 =?utf-8?B?QVlMbTZIdUppOGZqdzBlVWhSOEZ2eWlZdVNRellkanAvbDZvcVJ0T1NFQ1ha?=
 =?utf-8?B?R21tMGRObmhqQW1GUUU3eFRvK3NlRElpVTF3V0FEWTF5bUZULzM0RzFBOHRF?=
 =?utf-8?B?WkFaTE1ITzNUMjlnb0tITTFhVUszY3lVOENwTWt1Ty9yQytab1p2SnRrVGFR?=
 =?utf-8?B?a0ZjckJjRWU3SjlzM0NuOVRsSldKSld4eXBqeDR0N2E3QjU4WEtwekE5ZGJ5?=
 =?utf-8?B?SVRiOG5TSlZlSjh2NS9uL1FBMXd1Znk4dnFydWVoV0lvMFhET2pHOVhtdGpo?=
 =?utf-8?B?NVFzZE13Uit4R1daOG8xRmhpK0xWMGhkNjVJSWwxR3Z2b2pBT2gwMWhHMlNM?=
 =?utf-8?B?eUpDVmRHL3BwL3psWUNyaG0rejdwalFxb1RlcE1ZbmhldjFPQmRlTWZvRUFk?=
 =?utf-8?B?K0Z6S3JFUGM1S1JoNWRoK3U0b3NLZDhJQU5maUd1dnRKaVY4Tm10MHYydmFS?=
 =?utf-8?B?WkVGZ1k4c0p0YTR6byt5TUJhK1hSRnB4QkVhRE5vRWhHQ3Y1VmdPQXJiemJB?=
 =?utf-8?B?cnY3bDhRYVE2VlFCYi9IRU5Db090cG9mT1dOM0pCQ0RLQnNRT2dhZWhGcm5T?=
 =?utf-8?B?VS9KSElDdW1jMDBiNzVydnd4UUtMa0xqMHl5RFFUbUcrTXkwalRFRGlWeVdX?=
 =?utf-8?B?eHlheXM4aVNYR0JnMExjQUMxSFFpQ0ZmM0NXeVdVV0g4QTNxSjlXdUZ0UEdz?=
 =?utf-8?B?VWNGR1AyZFMycTlGa2hoYjFDVjFSd1lrS1ZvckVScHBOS1JZMGlxTWphOC9P?=
 =?utf-8?B?NVFwQmZhZWZPSGo5TE5hV2JGaC9PU1o3cWxPSEk3SFhQSkVabWhXSTc5Njlp?=
 =?utf-8?B?cS9hVnkzd2RETkpXL3JLald5bU5uWXJLR1p0cm1jUmlMRTd3eTl2cHdzNmNT?=
 =?utf-8?B?YjRZL3JyQVpJR1pVMVFyV0doTEkrb3RJS1VDa0xqTytvRXB5V0RoZmNtQy9B?=
 =?utf-8?B?dDFTbGYvUXJXQnVTSGl1VFZzSFByR1RSSVNwZU1CZFJkN05vdlRWMUd4dzd4?=
 =?utf-8?B?eW9yQUV6M1NHNDEyYnVLWnFKL1ZIMGlkTzdaYjd2UWFZZDhnWS9jTG5KL2xU?=
 =?utf-8?B?Vkt6ZUgvK05JRlNCTGdmRXhmdjFkMmxwbm5kd09CVDI5WExCS2RlMW5WbnRr?=
 =?utf-8?B?RC8xU1g3OFl4alpvK2VsUEtUbmpQVlI3akZzSWtjN2ZNU2Zjb3F5d1Z0OTJB?=
 =?utf-8?B?NVJEYzBNM3p0ZzlXd1YzWWRpSjFFa1hCMGNKdmtMWXQvVVdwTXZFYlYzN3Vi?=
 =?utf-8?B?TXltcDY5UmtLSlcyaVJYS25KUzlEdm9iNlVOdHZZbGZVKzJxWnZNN3A3VzJh?=
 =?utf-8?B?alVrTnpsVklTZGc3SXEvWVNpZHZWR2xHMFJwbWpMTGFuclppNnFEV010YTZp?=
 =?utf-8?B?WEwyOWpuUm9BNWx3KzZsN3JFK0gzV1B4VHUxZXJGcHUrTWNiNVlDYlBSWDUw?=
 =?utf-8?B?ai94MTdYNVNsUTJNTVpPOVBzaUFacjBWNkRkU2pNNEZ3MDVLQW8yZE81MDBM?=
 =?utf-8?B?cnRQa3ZXbEl3Z05HdGwyOXRmMnBhNUp6bTNHcjl5ZFVsN1pUeVFtK3VxblFk?=
 =?utf-8?B?Y1JzSlFUQXV4Ynk0bzJxb0VkbG5aeFJBb3o0TXUrNUhRbGNHOEdrMk1WWExm?=
 =?utf-8?B?eEVRK0h2NUV4THhGT2FIOUNCUC9Qb2VvYVB2Nk9raERoR1NPMzRDcnhrQm1r?=
 =?utf-8?B?N2gvbTlaSE5iMGtzTVVMUTFvbk4vMDlNRVFPZWQ1MFUwcTNGeHJGZVEvMzFQ?=
 =?utf-8?B?YkZhYjh5MWptb3YvaE9IOTZIR1BSNnAwalgzLzFwaG04LzVxOGNLRTVESElj?=
 =?utf-8?B?VDFleko5TTJBVU11dmZpV1ZCbEZWSlc3RWNNYXNoaHl0UHF0ek9lMzkyTXNT?=
 =?utf-8?B?Zy9ueVYzd0xoVzJsWDR0SmlMU2tnNXI0cjBBdVNnZVhCeHhpMHd3WW0rZmNP?=
 =?utf-8?Q?jv6/bH275dEDs5vTCXynhC9++?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48edc706-2001-46d2-cd52-08dcef3e2087
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 06:28:49.6344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtegICJxmqngNtd4iP22fs+PkJWvW4nKONTeEHcyZ7USnaElx33qEIGw/Fi+Hv55
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787
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



On 10/18/2024 1:10 AM, Dan Carpenter wrote:
> This was supposed to be an unlock instead of a lock.  The original
> code will lead to a deadlock.
> 
> Fixes: ee52489d1210 ("drm/amdgpu: Place NPS mode request on unload")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks, this is being taken care with a follow-up patch -

https://patchwork.freedesktop.org/patch/620162/

Thanks,
Lijo

> ---
> From static analysis, not testing.
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> index fcdbcff57632..3be07bcfd117 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -1605,7 +1605,7 @@ int amdgpu_xgmi_request_nps_change(struct amdgpu_device *adev,
>  					     gmc.xgmi.head)
>  		adev->gmc.gmc_funcs->request_mem_partition_mode(tmp_adev,
>  								cur_nps_mode);
> -	mutex_lock(&hive->hive_lock);
> +	mutex_unlock(&hive->hive_lock);
>  
>  	return r;
>  }
