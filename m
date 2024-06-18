Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471FB90C9F5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 13:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216E210E1BF;
	Tue, 18 Jun 2024 11:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ld+YWd/C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A7910E117;
 Tue, 18 Jun 2024 11:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxoT2L317kLvKfw/pq7aW1mRt6IFqvZpNuF9bQt+brETJYhXh/pqRiCwSUeAKrJcOqjH7o4Z5QFcQKtJkAFaCjcV/2fmWSslA75Hl+ePhjendBbuCdrsXl8xh8A3OiZ9iHQ2MMZHuMvK0iaAOJllaZiSqJTBrf9y17Cg6xdpwhXkkoAIgoA133dE5p8hv2j14IRyuB/MlIup2KOrac0uayKHMH35f3GGunoZYH7VNj5lCYwCyXHwRShP9SDIIjzAy5ppIaht4DIJO+wLK5823UoBIBSVFkcgKAjlwk6isPZePSX9KAmopI0GgrObGkk4qyz4KfG4tF1Hi8RXWX2M6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtsBHxJ5fLpCiI4TkDKVuiVf4QKZFymoD4ozHGZrVSc=;
 b=CZtCydKN1TSU35fuRYsJRf8dBaBOWkZj3G7HpTGRNUs1/F7Hsb3Dpd2ccJzRW8x9uPwbAFt1DafAvAFU2cJ2TV3B86WVXgBjQbvL1QIInebM5cqd3Lyw0LJbxZo4O0liSe1cZV7nmd3v1224MY1AramGnxlbRvq87TLmIATB9fCLJwbvYj3s+9W8SV5f/2NS3z9TjpK+26vVOAz3l4rIt5tQwBGfony1tVQdkQBB/WZ/ALeoc4qafS4aEZ1JvPfoY1sAQt0E5HdxW8cB+EFbaOucebx7vJcXSzxQh7bsNu+MjrOILIUpHzbfmgEWyrkRsbLH3f3Ags5WTFHXZS4ohA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtsBHxJ5fLpCiI4TkDKVuiVf4QKZFymoD4ozHGZrVSc=;
 b=ld+YWd/CJ7bGXPaXkOBmqKI6dsDOn7jVFLAEE4AZ91ODNeIKyAQ+ea9najuZcaEsSSwHBrQiNcbHL9L3+8qKjQtsnYuJCMcY/lWaM2dsxvR3wvFckT7XdcMEYJZ55dXwsyYLP8XhhB86QRnGrfpjXd7GVsik2SSFaZhUJftin38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DS7PR12MB8417.namprd12.prod.outlook.com (2603:10b6:8:eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 11:43:04 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%2]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 11:43:04 +0000
Message-ID: <6b933c16-5ddb-4b09-b367-3cf42ae94304@amd.com>
Date: Tue, 18 Jun 2024 13:42:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH AUTOSEL 6.1 13/14] drm/amdgpu: fix dereference null return
 value for the function amdgpu_vm_pt_parent
To: Pavel Machek <pavel@denx.de>, Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jesse Zhang <jesse.zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 Felix.Kuehling@amd.com, shashank.sharma@amd.com, guchun.chen@amd.com,
 Philip.Yang@amd.com, mukul.joshi@amd.com, xiaogang.chen@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240605120455.2967445-1-sashal@kernel.org>
 <20240605120455.2967445-13-sashal@kernel.org> <ZnFPL2BeQOEGPO6Q@duo.ucw.cz>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZnFPL2BeQOEGPO6Q@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::17) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DS7PR12MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d33b3ba-2550-4724-d52a-08dc8f8bd07f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M21XMWNRMkY5VVJnbGhMQTE0RllSaEpidmQ2VmpWUmNYRFliVjF0ZGxQeG1w?=
 =?utf-8?B?YTBGK1hjYW9ITWxNdU0rMXNRRXFnSllKWnNqYkFwcnovcWVvNHJhb3dlcGQ3?=
 =?utf-8?B?djlnbW01ZmZXWnFiNmpoa1BSblF4WDBCNmNCd2pyM1FkY21CYnV0amRXQmxM?=
 =?utf-8?B?VWo0VWdORU9uQ3UxVlRtOFhQNFRLdjloYStkNWdHMUg0RTdSRjZDQzdJU2JV?=
 =?utf-8?B?cjhGQk9yU21OQTdpV08vUWdBcGV0NHdOMWxnU0pXOUhHdlpvQU9qVE9LT3NY?=
 =?utf-8?B?cnJ2amdLT21lTTR1dWtXb0Roelo0U1BRSVBxaUxIWVp4djczSlRFTDViWWp6?=
 =?utf-8?B?RG1vQlprZWRzNTRoL1lCN0M2UktHTm9pcExCQkxGdGxBQUgreVFIQ2N1eWYv?=
 =?utf-8?B?YzBDbmI1TkQ4TW5FeTN5Q1hNWFdCdVcvUEFDMHpjVmFMbU9xcStHeTBqdXFn?=
 =?utf-8?B?MXUrNUk3Sm9EckFvZFQ4c0lvTlBtTG1McWR4RXpVSytQT0FIeHlWSXBrYlhM?=
 =?utf-8?B?dnUrUTJUV0hxWVZoejNNdUNRNGhrVVgwTzhTUXJ3RE5pWS9RUjRDM3ZEcjlZ?=
 =?utf-8?B?c0I5aDFXTGgzWjhZakw2eEczTnk3YVIyckk3dGdQL3JXZTc0bXJtNW5WN21M?=
 =?utf-8?B?RmpFVDdzTjc3aUplanoxVlE0U2kzTmdka0lPM3o2dExBRXBVZ3dkeEVIUzNC?=
 =?utf-8?B?bmdqUWhUTXd1TnVRZndtRDU5UUlOV1NseHVvZnozTzQ5aVYzRTN1ejkzdzRt?=
 =?utf-8?B?VllqOGV6VFFkUUJKdXpvS1lMZWJWUm91UEFWNWtjOFprR2RuK2gwS3RzREUw?=
 =?utf-8?B?UzBjeWdRR3ZWUjRVQTM2cHQ3dGM3UjdwcXlHa1BBYUFHbE1wVGJWQ0swMjJy?=
 =?utf-8?B?OHcrcGw3QXk3ZEVwVmdmbFYxQjZaMGt4R1JoNElJZHFFcE91b3JzV3JCeGI5?=
 =?utf-8?B?NThBeW1ZTVlNdmQzYjRyT2YwOER6ZDQza2g5aHdZcnlhWUQwUVdlQkdyeTVq?=
 =?utf-8?B?bXJMT1o4R0xwZi9Iam1JT3ZqTDdreU13dXlmYTJ4WXV4UXN2dXlWcXd4cDEy?=
 =?utf-8?B?c21BaStac3V1anREQThScHNPU01lV3Q0eXhHNFJuckVjVHFLVGxBdDV3aWg0?=
 =?utf-8?B?ZmRYYnVtSThhMUZnYzFVSmEyVGhsdjlrbTVnZlMwUmZUb0l3VUFBZHZ3ZlZX?=
 =?utf-8?B?YlAyaEN3b0xLZmFiSm5sYVNVbS9oUXg2ekxZMGNJWHB5RnBjNi91VEJ1TnUz?=
 =?utf-8?B?RFlSVFNKTnhsb3N6amVlNXJYRms0MUxna2N3aGZmd1Y4RklURkI5QVRMbWhO?=
 =?utf-8?B?NjRDM3FQNzJJV2Y3VGFnYWpWNFphQ3VXbmVSOGJMcHAwd1RnNElGNE1BK0Fv?=
 =?utf-8?B?MjRZcFNaNVhDdHF4ODVPeTBwdzBJK3hab3pXYXpYOUJRUWZBbnlZMDNDL25B?=
 =?utf-8?B?WTVUWDczRGxuckxpRE5PUkpQQldxeHdzY214ckRqQmcxWTlVRDJkbG45Y3BV?=
 =?utf-8?B?MnBhY3AzdjRuSmdPMnVSL1c0YnZKTVJxK3p1cFlobnFhUVZ3NjhPZWNQTFJR?=
 =?utf-8?B?N05DNmMwcEN4VEdvVit5cWFRY1R6ZU5ZSTlHWVgzWG9sWlFBTVIxNHIrMU8x?=
 =?utf-8?B?eXd5ZlE2emUzVUVYSmZvVjcxYnA0ZCtZSmp1b2QzamFpbjBkWHlOVjVLdlRz?=
 =?utf-8?B?aWdtendFSmpDMXpCWERuWGRjVGFsdGFWOHVtV3BMNkxzVjV2OWpqR1ZLOFll?=
 =?utf-8?Q?CJDLmh1gMYgM67W6V7Q5izFYpnvnf1iyP9J8hj0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlpneHhNREVKaEpmcW1yZkU3U3MwNTI1NnYwZU1CUEVxdDBEQVlicnNUUmFa?=
 =?utf-8?B?T0c4d2JUeWhYRVBuM2NWVXJwT0hITndUZ1NVOG80bEViRUFGczhheURHUU4r?=
 =?utf-8?B?SFFDRTRHajJWOXB3VVYrL3dCYTV4NHNnV254b0NvZ2gxa2dWc01wYS94cGVS?=
 =?utf-8?B?YlN6R1p3MFB5RWRHY2puemhzcTYzbmZyQUVzTVQ3aVVYQjFYejV4VUF4ZFg4?=
 =?utf-8?B?TUN0QUtzRkZXOEVnZVF2cHprWU1zR3Q3MWQzajlwanZvNmQwam5RNnphMmt6?=
 =?utf-8?B?Nml5a0VkQkpyT2xjSzd5WjV2Yjl4ajJKVzl6SWFmczdQQUc5V2NPUGhaSDBE?=
 =?utf-8?B?emZScDYrOWdZOFNGVTNJdjBzbVdHbjc4TEJRUS9USEhoM214aUhEQnNqTjVj?=
 =?utf-8?B?VTZEN3gzSWtNNStwbUttNmIwclBNQ1VyaUFPTm1LUUpsZlNqUDQzZEpHaUU5?=
 =?utf-8?B?VUhsazhBbWNTWGplSnhIcEljK1FKVTFYOWZ5cTErS0RXTDVucW02NUNjOUVY?=
 =?utf-8?B?bEY5UWs4eUJNS2FIUHlQbEhtZWRvc28wRWtFQmVqczZ4bXd3MlhLbkNFZ05n?=
 =?utf-8?B?QTNFV3pocjl3L2swSTNYUFNjVlROTGxuK2lEYzl1dmMvOUJWOTFyV0FPL2Z6?=
 =?utf-8?B?ckJnQWRtcW4zckZzdFlmdVVWZDVVdmpyL0c2R1dnNFhFL3ZsVVFrc2llU2J2?=
 =?utf-8?B?endXRk5qdTltOXF6dDN3dkxueWwwV2x2NUIwZ1MzcnQrSUs5NHBTc3ZBakhF?=
 =?utf-8?B?T2dzVi93ck1PSmtiek9ZZzlPSWM1SVRNenQvZGNjZnlIblh0Nkt3Qjd5M0hs?=
 =?utf-8?B?Tmgreklab3BPUEpWV2JBRWFuQWhUR1c5THE4alVIb2hXV0FRUkNjT3RsTWJo?=
 =?utf-8?B?a0NWaU9OWkZhMXFxcVRBMjJxNFFUbktwL1Z3TURBS3hxdUVZQTJZZS9mVDRh?=
 =?utf-8?B?QzFPUlhxT3F6UHF3ZHgxK0J3QVRvZVNseGJaang3N29jajlySktsV2dpSmZv?=
 =?utf-8?B?RnRCYmxQSGRqNm4yOEhJTjJlV1diYURxamh3WGdxZ3BHaDluTkRocXN4OFdk?=
 =?utf-8?B?TWZscC9YL29WbkFvdVRhVHVxeHprRVIrZE0zZ3RSZ2JUOStlMVFtaDVzZ05v?=
 =?utf-8?B?a1FQLytRUUFLazh2emdMTjE0S3ZRQzl5L01TeDRvMU1YK2dvbFkyb0tXM0Fa?=
 =?utf-8?B?L2pKaTUvNzczR2NhSHlTc3VlNllHUS9UQjN6WVJPK0ZyQ1E4Q2JLaFZRR2Z4?=
 =?utf-8?B?eVd1eW1qZTdiTWVvdkFiMEEwMnpVYUFua0NQWHZvWDQwbWFqSUVHMUtqbTZG?=
 =?utf-8?B?V1dybDQxYS9JZnRKazBnS0JCT0NKQ1hNS3plTGtMd0M5UlF0TGlmUFgzUGpI?=
 =?utf-8?B?NVVRZXV6Uk9ET05BT0lqS3ladCtQWEhGVHlzMHlPMkkrU0xGZUxMVWJ0cVNz?=
 =?utf-8?B?dEQ5MDZSQ0oxR1VCUVJEQXl2Q3dmNFFVZXQ3Y21PUUMrZ0pBekltQVBCZWxj?=
 =?utf-8?B?M0V4Q0pBdUxtellPa2RFU2VIajdiaittVmF0ZVdGc2VWMFNmQTFZUjlwWUhG?=
 =?utf-8?B?M2ZlcFMydGc0RXNEWUxmVVN6dU52QWVJQ25aNmhaUnFPTkduRjMzaFN4RUVj?=
 =?utf-8?B?NmRlV285Y2RHemdlRmtwZlU1U3JPZEN3UW1Ca1lGcmUxUVd6NVFwb2ErSWtl?=
 =?utf-8?B?WS9TUDlkd0trWXNaZW04R3J0RmM3MUVtVlJJMFFPQlA0enU5R3VSWU53R1Zn?=
 =?utf-8?B?Nk5KeXRVZU15K1E4MXJjUWk0Z0l6bHlMRXl5SzJKcGlWd3FPUUJmVjJsekY4?=
 =?utf-8?B?cUN0MWFHaXh5YkdQVWRhTHE4UllhSzNsR2MxdXNxUWtrbmJYaUI1em1kdzJL?=
 =?utf-8?B?WFdyZzl5OEFaK21TUzNaNmVac3E1RkxSSjRBdUpsTGN2OGYzK0VQK2JTVklG?=
 =?utf-8?B?elRVdlRnQmpBY2VMYmJuZUtUL09BcEpVVmhNRG9Rb244ZHI1RFlMdk5jd3V4?=
 =?utf-8?B?cG5KK3FOMEdPVWNWNDJrN2cvMFY5QkhycEtRUFcvRklzUnFLeGhxK0JRUDRB?=
 =?utf-8?B?c3pxWDM0S0dqOW1RZUZCQTZDRXVLbUV5M3MyT2ZRMElkbFR3TVJSWXFCOVdr?=
 =?utf-8?Q?PORm1vk3754cx0y3fYwB1PYe6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d33b3ba-2550-4724-d52a-08dc8f8bd07f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 11:43:04.4204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWuQIBIJOauKA6U2PORI08+mYs2RlFXNcDg7/Nl2WTzLVkDyCCi2c89wAFixy/fT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8417
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

Am 18.06.24 um 11:11 schrieb Pavel Machek:
> Hi!
>
>> [ Upstream commit a0cf36546cc24ae1c95d72253c7795d4d2fc77aa ]
>>
>> The pointer parent may be NULLed by the function amdgpu_vm_pt_parent.
>> To make the code more robust, check the pointer parent.
> If this can happen, it should not WARN().
>
> If this can not happen, we don't need the patch in stable.

Right, that patch shouldn't be backported in any way.

Regards,
Christian.

>
> Best regards,
> 							Pavel
> 							

