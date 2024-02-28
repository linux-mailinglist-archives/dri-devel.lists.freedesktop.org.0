Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD6286A88F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 07:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5AF10E606;
	Wed, 28 Feb 2024 06:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eITcBrGt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202BD10E585;
 Wed, 28 Feb 2024 06:51:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tl9iEmabyg9RVIaH1lAI2/WEvtEF1WipgbDYGDTSAD/O2GZO4DeiXzLqQVNOP7o3Mmmi/J6vZt5WlwM9clTZ88gqd0G+Ay6cNVOlcWzjEmz89yRdCy90mEM+i93aBxXII9g0M3oSsbiRE30A+Jlg0CvNFkp0p0eMCya43qr3SWjOBXTYV21LBbvuacpJfNhR2o5VDA60JZ4Q8gdi1HzQdJAdG0S+vLpBtptAMufiJ4T7bpCjldmKnQdIrfwa4fBCoPRPktRq4cUgBmxCIeu1KmM7Y4mri27Wzt1gymxG/DY5eI3pWuD/Fx1jNzqbC0AdWcMTlcogK01gGRRNgFOY5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bAvWq99iZxlznVrDJOLReMSqLtbHWrNmL2gAGOj+Bo=;
 b=Ft39UQP8zAkB9oy4eXnMNDB1KX+M3oZZn1VgFCfEGg7dFAHjYt8jNcOqK1gu5XPSwAePelfNOc51DBF2+UMHrdf9Ic/EeBJy7/h2/60ZkIe4lDk4uY4rCOJDhPoqR+9FwhdA8Rn3QHvz+/6YBVnnTR+18F0VzUjoi2f4jw2PVqFqnkLckmVo5ho/ZWWvhDUrezXSNwVGAbpf+qPbQxCJxmQiggyKsoDQ8jH6a34dBwiCoNBD45+w6Ovzze+wEEqBrCqS2I1hKxZHLPscEIrtevcyprlIZOLc/ar8Q32rsm5GE6I+JR0cyL8bB82vUsdcS7A0AH/UoI0vC47McviYeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bAvWq99iZxlznVrDJOLReMSqLtbHWrNmL2gAGOj+Bo=;
 b=eITcBrGtlyS9YsFM/8lF2PZ1eBaCIsD0JFdXZvoRy2XD3dbAqWKBjBn30JohMMhOtpA0mpC3X8a+8exnQMXOIkSv2v2B1sbjNWOJ1kqdWPjQWf1qgLCjGxOWUodYZHqjfj/HR92/bJRYhP+QM1u2Lk2KAtHmMex8fG12RKr7l8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6028.namprd12.prod.outlook.com (2603:10b6:a03:489::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Wed, 28 Feb
 2024 06:51:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7316.031; Wed, 28 Feb 2024
 06:51:42 +0000
Message-ID: <8ccab1ca-428b-4812-b46a-671e816dd34d@amd.com>
Date: Wed, 28 Feb 2024 07:51:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fix assignment errors in
 'si_common_early_init' functions
Content-Language: en-US
To: Lu Yao <yaolu@kylinos.cn>, alexander.deucher@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240228014435.7234-1-yaolu@kylinos.cn>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240228014435.7234-1-yaolu@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6028:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d60516-ece0-4ddd-47f8-08dc3829b8c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ha/gA9LFaG0DA4+n/+DuDDBZXJ6WPLka+UBSPX9tSmHhboIIoARsKXSXInOxiBWzOfpYZ3G8QIFuqpAtjJEUPyFUwkXhD3hnJw0hF0qY+2G/g9v14lxV5uQLYg311N+GxBrK5e46G5IZKe9twiFrTVtYLZEfz9TJ+vTPhQI1d6Aid6ceFmDEsSePaxDO2ZN/hyZWl6Bkf8ehiA+MZiRdmry10+xgx3Ck9xH4ItEqirEbnuzu3UgPFR8IlsrfT2C3mlrLsjFx1KAbDkcWZ+f58bDr6ch+rd0NDo3fFXGRj1Uwjy6Md77T+5vS/KwXHx+ktuf/9VHkKWGSEcvIfFxTjd3+Hn4T9FhYW2bhRtFwLbWTYwIarQ6uPDJq1lGVGR8GjlI2cxgIALjjMJVt65KmNiseRtxoJTS4U/j7G6vgd+lBl8xVjKKgBO3AKN/GFwPy0GH4guald92deIqpkK/j0IHZaiPDyFGZZ7Cv1eHvHmdVmPKO00q1ql2amoDq+PLPHKukhwEuR+J154zc/UTKtHRMV8hTFzHLBbqMOwAEgKtUzytdNi6aPqLhc63aiazTTyeMlHmcFTkgm/D8omj6C/WrpmIKlEG54FMDz/TGp4/s8H53DzZm1lhSdLxU/0JLJnMeVh/6rd9HDYAnO4wDSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHVhRHN4YkRTaGpDZnpzbE4za0d4NDVaODZ4OEplTi9jRFRvRWdvTGhuMnpH?=
 =?utf-8?B?dHRKU2NJeGZmU2lSV2NaaDVDMDJJSWl4eWorUit5WU5CWCtjZVB5cC9GZ25X?=
 =?utf-8?B?TEVRWFFMN3llWk4yeUZ1VHVjUVdUMXIxSkprK0RvM1hxT05mNGUvaTFyYWJx?=
 =?utf-8?B?aDdHUGlxbEFtSzlNSVh0b29OYVBiUDVkNndYYmRnSCt5cUF0RTZMd0FqNk9E?=
 =?utf-8?B?UzREVHJhTjRvQWM0Q2VkR0Rjc2tqLzNOZnNLTURMTlZLVkZRVDYxTGs2NzhH?=
 =?utf-8?B?UTFzZWZyWFp3NWhtbkpSTVV2am4wVGI4Ui9RdHBadWFOUC84d2FqVmlhM2VJ?=
 =?utf-8?B?WEdOWFhXYnFGRHdTdFpMYlhaaEk1S3pCYm14b3BkWHVjTXVrb3gzUFdqNTYz?=
 =?utf-8?B?dVpMRkxkSUZsT2VGQlAxK2pZeFd2TUZQQ3RjN0FuSzJzZW1iMmxGQnJPZjZw?=
 =?utf-8?B?NWRmQ0Z2S0R0V3RDRzBxK0pUTzRTN1BQOWhOZGlXMmdtbmtaWlBQZE9HMEUy?=
 =?utf-8?B?bmdjU0VlY1BmRFVCTFdSdUJQd0UzYlVla3FtcXNyU1JmeE9DMTNaQndtaERZ?=
 =?utf-8?B?eEphbUJIMlYrem5hakxXUFlvckp3VkVqM053elgxYmxLdkY1bEFNdmJQSkE5?=
 =?utf-8?B?M01NZzQ4QzlrQllpRFJmc0RGWkFEdG93dlRYZjhtVTZOVXJwTmNpY2luaDJs?=
 =?utf-8?B?MElGVHRGTkdkOFNqVkVEV29sZEk3ekE5NmNqUkpid01wYUF4WlpLT3lSVE54?=
 =?utf-8?B?NXA2dlZOaE1NdTlVRHVyMmo4THFqdytLaVBJSjIzMzZ5dUEyNlJrUGRpTWtF?=
 =?utf-8?B?dVpTYkhzTmF0dE5EWEhiUzRJZlp5YlRxM2RSOXpaMldxdVdiM3dzd3B3cldo?=
 =?utf-8?B?bEZHaWw5VjZUT2VlWDFWeWE0dEw4dEl3WkNHTC9SWnBTelVLdjFoc2hqeXp5?=
 =?utf-8?B?dHJoQVMzTnFzZUdhSEUxc1U3WXBzVlNFNWpXNWQzcmtZKzBJL1hBbXNFR2sv?=
 =?utf-8?B?aTQvT3ZNci9wY3IrNWhTRFl1NkZOSmEvbmJ6d2RlSVRTSHdSdS9rM3o1RDE5?=
 =?utf-8?B?dTU0NFZRc2hGTW53R0hPdlRZMmtFaEZVWjJlcVVKWGo5K1pQWGppa3BVOTJn?=
 =?utf-8?B?SnRuWVRIV2NpRnBZTHRRY1RxSWs4LzN4REhOWHc4b0x1V2pZSW1YYWNSUVpy?=
 =?utf-8?B?MjZ3eWZIdW4xalB5cG9HMnZCeC94V3crVTAvckhtckhkWlhrMzlNZmwvM2My?=
 =?utf-8?B?WlViZUE3ZjVWODQxa2FzaU42dGFVQTNFN2o3MnpUcC9EbFJVU2FYNFJTZkJl?=
 =?utf-8?B?Z2FvYzhsblc5WTVnOWs3Rlg5Q3RCZzhyd3BQcEhzc2dQck1wNm1ibDl6dmZ5?=
 =?utf-8?B?OHZNTi9CWjk2UjRHeldhREpaNVk0QWx3Z1RGYXhEWTdPYThnTytDc0RUY1RK?=
 =?utf-8?B?Nnh2OWR2RS9FSDl0ZWlsNHUrMFE0UC9BVmRnWDl2RXZjTEMveHRLdHcxTEtU?=
 =?utf-8?B?MTRGYURQOHM1T2ovbVk0VkxyNSt1Z3Q2d3hJams2ZG1KKzJwQVJGemtDZVFL?=
 =?utf-8?B?WWJZTVlzZG1VWWdITERiM0ZUeFNxVnBzd3JudkYyT3B0cGxFbGswOGZOTHh1?=
 =?utf-8?B?WUU3eHh6a1RNbkJVZFVmZjdZTTFGd1hoTEVrTlQ0UGQrTU41dWpNaVBMTktK?=
 =?utf-8?B?VlR1Ujd2cFJuc0I4Y3F4RS94MjRrb2RZOTNObFd4VFYzZVh3NDk4WjE2RnB2?=
 =?utf-8?B?TWs3elpJZ1AvQWZTL2VJUTZkZmtvM3RHenN3djBuL3hSaW9hWkVrWXptL2Vm?=
 =?utf-8?B?QmVTYXNMQytva3hNVWFRVWRXZzdvOG5iZVkrMEJGenpkYm1uTXlkUUdKUGNM?=
 =?utf-8?B?V05WL1pxa2U2c1pXOHp6dGNwdHo2MVBaMVZXYWYwS2dpOE42WjlvTk10QlVG?=
 =?utf-8?B?UUFTVFZQUndMYk5WbFJYNkFuWG10SlZCS1FoMHlweU9HQ1JSWlVPNFdWejFo?=
 =?utf-8?B?YmNDN1JmbElHL1RqWTJqRVlsc0Zva2NranBsUFpDZWFHYmhIcUVlM1N5SGZ0?=
 =?utf-8?B?b0VMSTIzNnp0M00yY0Q5ZUdaNkZ4WVc3Tm1HZXpQc1VoM1h2UmVHNjZTVSs1?=
 =?utf-8?Q?yewyQC/qmeOgi63xajv6YJXkh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d60516-ece0-4ddd-47f8-08dc3829b8c5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 06:51:42.7374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAodHW57hui/ffXLxb+iC+4KBHf9ZakxWtYYfMaOW658tKMfPYX8EO8azlsXIl0P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6028
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

Am 28.02.24 um 02:44 schrieb Lu Yao:
> uvd_ctx_rreg/uvd_ctx_wreg correct value requires function pointer.

Yeah, but that is completely irrelevant here. We usually don't use the & 
for function pointers since that is unnecessary in C.

Regards,
Christian.

>
> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
> ---
>   drivers/gpu/drm/amd/amdgpu/si.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
> index a757526153e5..455d49f7bd9c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si.c
> @@ -2032,8 +2032,8 @@ static int si_common_early_init(void *handle)
>   	adev->pcie_wreg = &si_pcie_wreg;
>   	adev->pciep_rreg = &si_pciep_rreg;
>   	adev->pciep_wreg = &si_pciep_wreg;
> -	adev->uvd_ctx_rreg = si_uvd_ctx_rreg;
> -	adev->uvd_ctx_wreg = si_uvd_ctx_wreg;
> +	adev->uvd_ctx_rreg = &si_uvd_ctx_rreg;
> +	adev->uvd_ctx_wreg = &si_uvd_ctx_wreg;
>   	adev->didt_rreg = NULL;
>   	adev->didt_wreg = NULL;
>   

