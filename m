Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F109AE991
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 17:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57ABC10E957;
	Thu, 24 Oct 2024 15:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1UDlS4bZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE9210E2A0;
 Thu, 24 Oct 2024 15:00:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LxzJ22Zfo1z3Yo+Nbr2KNpzPl2BvXWrZnLYpLgolpT31YQFd4uGCgKOxw+1yneymx0krmkTwi7DIM3cX4sN8qdYB5NU50AhZlj5vceWITZ3mVdzKX41b1z/E4RIjiIrIxPX7G7RZ6n+jJZDDNSE43fFtDAQ78mxS1ClGVDBLDL7xj6C2Jc9oSXHVFDtvswvsAUNf05JuFyRiuD2x/g6DZsxsZTyyMJXALkCJbFL+rFbMy5Tr3f3wwrjRjEGEv2qgeGY/3hQ6msck+dS5eeTkHDt4uV/Xva1l4lqQJ/8bAsJzBL57SogJKeMx41bKXouoQVR73mu9BkTf2ctPkGGWMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vl3hRFlKeGGtlcBNqW9iXAOj+20lVGcVGg7QLPosKfo=;
 b=BBoXmMP2Jocwd50zIt7tso/iV+uOQCCya++He28JEQDkbJy6R0NiAN6oBgc96oh4mJy0DUwZd39vJiZbfdre6sArHcWucX0FMBRXEzQvWV/SEMCmpZCpC/BUvL7TZqf5K3G+nzIt53ZXar6N2dmgGn0ecpLLUow/gsioLkZduqNU2EL42WzG0sFWb/jfkrYilCmx/k11cei0S1QfqEXvG3iUbPtsbJ+2O0PA9cPUNTD+007Qm0rSXCg8dV06vsjlKqfdqv8kv5W/OANWSMafyNxWPHBVk6eFSBzPCYHBwx+7o0qsdr7ni9I8JRwmzfz0vrVtUCldniqU9NvpFEzddA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vl3hRFlKeGGtlcBNqW9iXAOj+20lVGcVGg7QLPosKfo=;
 b=1UDlS4bZBrO9F/8uUJtt6PIG3brJyK8wwGq51W7TcBk8IlsGJQNNy8qtJjmdxN676bZnS0nTfRPZoobfMtPiO0WJBuiUOcCFOc0OsIFigYDLSH9zUOWmRfaWxUrxplO/uzHWgg1tRDW6PoGxbbW9FGs5uE7f4jR3zQdg0hGjtws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB6855.namprd12.prod.outlook.com (2603:10b6:a03:47e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 15:00:29 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 15:00:29 +0000
Message-ID: <d99db508-3f45-4a9e-b28e-58248b5fc4df@amd.com>
Date: Thu, 24 Oct 2024 10:00:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] drm/amdgpu: Fix amdgpu_ip_block_hw_fini()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lijo Lazar <lijo.lazar@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Victor Lu <victorchengchi.lu@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <f4fc849e-4e76-4448-8657-caa4c69910b0@stanley.mountain>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <f4fc849e-4e76-4448-8657-caa4c69910b0@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:806:130::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: 976ddcde-2498-473e-e5cf-08dcf43c9978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUk0N1FHZEJrb2hudVlRTXVVRkNJblpOTUhyMERwQXQ5VjMyZDNtVWdheFl1?=
 =?utf-8?B?ZElsbjhtK2xiU2FUSk9QNngxUE9FVEYyYTl2TEs1RTgvZGNGbWFoMWtUdjhM?=
 =?utf-8?B?ZDlHL2Z6dXRocnpZMnRXQXo3V0JtUzBxN2F5SGZ2STJhVm1ZRmMwUFBpQ2ZP?=
 =?utf-8?B?clFHYy9kQ3FwYWtUYk5FVWkwMlJBdnZjKzNCL1FHR0FlTWtBTlI0Ylpydnh5?=
 =?utf-8?B?aDdnSlcyTGhxaE1aSEM5MkNPTXVQdEJtSzZGTEg3ZzlCMzhyNG9DSVNvZUs0?=
 =?utf-8?B?NENVVkJPQU0wSnRoSWY1ZDB6cElPdndPSk9Ya0dxVUZ5cW4rY0E4QTBGOWV1?=
 =?utf-8?B?eW1NYWMrMVgrTHhZQzFnRnpZMStjWkNQcXlqTHNiWnlGSzZZdWkzb21McHNS?=
 =?utf-8?B?MnJHY1crWXlyQ1pyb2hjcXVtekJzRjN3dDBhN1B5ek90TjRMRTlkb1JxM0dZ?=
 =?utf-8?B?N2pHRFNtRGUwMkJxRkxielpKQjFPZ2pBbjFxM015a1hIL055d211TmZSUVR0?=
 =?utf-8?B?ZDJsTFNxUWFqclhwQUljMnJrc1BUTWZoV3JMVk1ObmFwaTRNSWVFSnhxa01w?=
 =?utf-8?B?U1MwaVJ5S3Btbk1mdEtYSks2ZXNra3J5dG5IMWJrNG9RNWtyRXJlWC8vTGdj?=
 =?utf-8?B?b00vOHZGeVppRkw4NUpGWmNjVVYrSVJ0YXhCL2llOUF4REF0ZUpCdGRLVGRu?=
 =?utf-8?B?SkNvN3o1ZFJnNDBIeTBSNXM5UGZDMmxwWG1VWlI2UG9pb3BCQ0lFYXlja1B5?=
 =?utf-8?B?aUlxc1o3di9ocmVKSXVYZnFEWTF6WEh0YXlNa0FJbk5wYmJJNjg0YVM5N0pK?=
 =?utf-8?B?WGZWSTVzNENjTnBTU21rQ2hUNTVrYTZlOHBQamxLUGVxMEhWUlM4NElrUzhE?=
 =?utf-8?B?dlkyY3hvSHk3dWgwa2dRalgrdTRvZCtpSHV6cWdVS1BlWS9mNjdTcjc4MkIr?=
 =?utf-8?B?Q3RWWjFPM3JDYXhzQmp0WlJtTkR0aFk5SFNYTHAyUzZJbnNmQ0F6cE9NVlBS?=
 =?utf-8?B?REFUa0RRVndUTUNtY25EbjhsY3ZRcWROR1I0eEN5b0tkd0JLOEJWZS8rMjNt?=
 =?utf-8?B?c01ETzlVR3RZWWxkdVMvelRjVFN6VGg0RXFhVy9hK3h0V0Jqemk3Rm5RdWpE?=
 =?utf-8?B?SCtRL2pWMUJzV3JGdmtrbloxM3RtblcwcUhWWERlb0dlYnE2KzJ1QVhWaVNT?=
 =?utf-8?B?YXZiQW03bFZkMUVURG5rSEh1eGZtemF1VEhQWHJlZURvdU95M0piZ3BQTXF2?=
 =?utf-8?B?UHJab0wveFZtZVlRQ1VCNzM4QjdTS2pmazgrUk1sSFkyMzAyOFR5dVZhS0VI?=
 =?utf-8?B?RWlBZVJ3MTlRMEJIMWNSMjRqK2JIaFlGa29jcG5UZ0M2eWNZOXBGOU1uQXd2?=
 =?utf-8?B?Qzhya1FXcjdiV0dUV2srMFQ5K0l3OFhheVBJNUt3anlKK0IveGdoY2NHNTha?=
 =?utf-8?B?b0VXc0FDSzRzalJqc29BOFA0MWh3TG1zNnVSWmZmV1drMXJvZ0Q5SFpvYkhC?=
 =?utf-8?B?T3ZzSmVPUFFiRi9BZGRkODh0YjAzVDRtazlrdkpRZmp3ckV5OGpmWGhjeURT?=
 =?utf-8?B?VFI5eEVGK2ZmcUNvREF3eXNrZHlNcnNNMURLM1BIRyt3RHU4KzJiL0Q2THFE?=
 =?utf-8?B?OVROM3FIMUM2aTljeTM1SzBIYm1pYzc3bUVsb0xPbU90M0pUNUc1cnB0dHJG?=
 =?utf-8?B?bTNJSzFkU1doWTFZVkFKUnJLdXpCTGJ0N2ZzSEZMVVBDRC9YbGxzWmd3RXBn?=
 =?utf-8?Q?hxtAStlatYePApv5q6TRtcT5ExOBqPL50oA0dyb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzI1T3czUCtzY3FhQ0VIQkZ2SDNYUCtGN0ljS1ZBbkFRd0ZWVW0xSFZuOVRF?=
 =?utf-8?B?Q2pPeExOZ21zZXBkbUxubFgyWlYvODdHRUNVdzFZbmZ5cUM0V1JQWnU0cTZW?=
 =?utf-8?B?M1hlcXUrR3hRWkwrTnhNZnZ2bkdFMXF5Y1ZjbmZEYnVQT3JOMVlnL0VjNEwx?=
 =?utf-8?B?WVFTVzRzOFJMc2dCbnNpb0MvRjNROTdxajFoQXZtbjVYMDcvb3VkTDMrRXBC?=
 =?utf-8?B?eUF2U0MrWWNBZjdpT0M0Wkg5R3hkRzRMaUJ4RjJEcHc1QXZEb3JYTEN2b1Yw?=
 =?utf-8?B?SVk5YXZzeENqWnRkL2V5Vk1sOFZOem1wVkYvcnBBYXhvTmhoQ25vUHBGQVFQ?=
 =?utf-8?B?RG5nVm1Jb29zZ3pjV2M4NkluRUwwQmwwaTA2T0tqM3E5dWs2T0FjQnVTOVN2?=
 =?utf-8?B?MW9icFU3WkpNampROEFmNHMrNi9KTDZCb2Q1Z05oc2c1TWU5bGdNRHZmOGZr?=
 =?utf-8?B?bjlhcDVNQlNqMUMwYXQ4SzBFQUF5UkhyV1Z5RzBiaklXMnIyWW05MzdIb2Zy?=
 =?utf-8?B?SVVFRFZVcDlHdWpvWlN1aUxwazJxVzNkTVg2K1NCVURzVkZjWmZxQURLRUdl?=
 =?utf-8?B?SGRoSGZoRUlESThqdVJGVmx5eWJmKzRwUkU4NUJhZEFFbkt0dk5qeGRpUTdp?=
 =?utf-8?B?S0JLdnVpcEpiSmk1eGFSV2Zoak45dHhkVURKSnZCVmJYYk50R3FCQ09QdG5F?=
 =?utf-8?B?V1RvVjVwYzJjaVBGcXhZS09jc1RQUTFVaGtLZXRZa2VydGJ3aVphWUtkL1Mr?=
 =?utf-8?B?L2J3VkowSmRFdlI3bEltbUJJZjROTlNLeURzUHJEdVY3UStlMkROYjZ1WG83?=
 =?utf-8?B?VWlJcWFPYWxNQzF0ZHQybDI4ZHBYUEtYaFFoTVdESXdDbGp3Z1FFKzFtWUNO?=
 =?utf-8?B?czU2bU11b2VkSkFXK3VwSlByalhoaXFYb0VCSjRFSFJJYVdFazllaW93WVVJ?=
 =?utf-8?B?TDFCSHlaeDFOY2l5UHNVcFpOdHVlQWxIbXhiclp4YXgvTVl6Z3VNblJTam51?=
 =?utf-8?B?a001V05RLy8rSnA4endyU0EzQUpzWEw1bnVSaVYwZlRjc0c0SXdIOFRVUTlO?=
 =?utf-8?B?M2g1SmlPdUF5bkY5WGtmWGw1N3djbXZxUG41Q2tRSVM2dmRsK29FM1E4b2VO?=
 =?utf-8?B?S2hXRjVyZm1LT0VndjJISTRPRkgwcmVURmNHMkhNbndjZnZXbWhDay9pQXpm?=
 =?utf-8?B?ejhrcmVOUFA2Q0M3ODJqM0xiQjcyWTFFdE5KSTM2MjVZQVJ3WnJkditOaXJo?=
 =?utf-8?B?QmpwK1dNa1FoNzFkeCtGeVEyVmt2a3Q5cVowWG5peStxTmtBUHU5N2krejdQ?=
 =?utf-8?B?Q1FwSi9vMlREMEhldFFlTkRmYXZoY0VYWXB2bS9NOUdmN1U1OVFHQldWOTVx?=
 =?utf-8?B?b3FYcU5GRkhIaXBlNDU5V2FtY09MVDc5NzhubERXTGFVYkR1eThvV2d0dVZZ?=
 =?utf-8?B?S3RuSkJmcktHQ3UvcFNuYWtCbWRTaHROMEsrbG1heUszTUNkUWd0cUdCc1Vp?=
 =?utf-8?B?NDJyRkJ6ZUx1SXQ3L1NKdjVhZVp2bE0yVkxiYkJvamlIR29VRmZDV0tEVHhX?=
 =?utf-8?B?Vmd0Nk4wL1lFdVVJMlpFMlMzTTdLaWpkY052ZFFNUEpHeXZCSTdxYUhQL0p6?=
 =?utf-8?B?dk9aRWluYnRONmtlZXdxbjhPOTNiSVh3L251aVdKUkxsK0l0eGwyakxqcElG?=
 =?utf-8?B?dHJRTXNWb1BjQVRtMXA3ekp3S2ZYL0l2NCtnT0E4SitVZWZEcm85YTJxV3F3?=
 =?utf-8?B?OHE4Vk5PN0tYZDNYblFHbnNXdzhWN1dTeUlNWVJXcHdxUHRtK1RYaTRaVDVB?=
 =?utf-8?B?MThKdzRvVkU5UGtCZm12TWJpTDY1QzRGTUVHYXVTTzY0UExyTXhVeWlIQnIy?=
 =?utf-8?B?c28zUHBac3FjWFplMGM0aFNWY3phZUFXWkw4QXNxOTlQSVlsZndwYjROQ2Iw?=
 =?utf-8?B?bDJvRDhsTVhHSm9LbnphblU0dGNML1FMVzcxZHZUY29kWkYxS1FkOXJ0bEdQ?=
 =?utf-8?B?QmRnaVB6TE40N0FFa0VKOW1MQjJDSVVVT2dtaE8zdmFaazY2bWY4ZmhXTnA1?=
 =?utf-8?B?NExkaU9zRHZKZWd0TEZqbnBTcDdjUDVhcHd3LytReHROZC8xUEZqMCt6VUtj?=
 =?utf-8?Q?PAoMCgHIiHILsErY0oMd8AbMn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 976ddcde-2498-473e-e5cf-08dcf43c9978
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 15:00:29.1735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3as6r/44pT/ofy37AYsTT7Lx1RjFQn6BnX2wc/8yopO/6oJ4NStsq0cCxqQBk5iL+7GF4TTtF2+i4MK4aCoXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6855
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

On 10/24/2024 03:17, Dan Carpenter wrote:
> This NULL check is reversed so the function doesn't work.
> 
> Fixes: dad01f93f432 ("drm/amdgpu: validate hw_fini before function call")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks!

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Also applied to amd-staging-drm-next.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 91c1f2188498..f12fab13386a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3309,7 +3309,7 @@ static void amdgpu_ip_block_hw_fini(struct amdgpu_ip_block *ip_block)
>   {
>   	int r;
>   
> -	if (ip_block->version->funcs->hw_fini) {
> +	if (!ip_block->version->funcs->hw_fini) {
>   		DRM_ERROR("hw_fini of IP block <%s> not defined\n",
>   			  ip_block->version->funcs->name);
>   	} else {

