Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40877910AAB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D489310EABB;
	Thu, 20 Jun 2024 15:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3rA8fcqe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2055.outbound.protection.outlook.com [40.107.101.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F2B89E3F;
 Thu, 20 Jun 2024 15:50:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PN3SRNkRpryFZHiDGV1XA+pL5ld2ic7+jZQeJydUoNwbw6O1Pt+vXYQijvwS1NTAUj/pyLCSGHXE3EcRGjj6XVd3d6uJubg8e+tYGikZWfiIWTixrQZh/vfIp7lrwhe3DESjT8RXs8+/x2KFXHok4HGPb3V+ZkljwDntT3f0MGxuJzcazPAFeFwb6uueTTc3vkBn/2fZo176g6JETOSvAeYoWPQRgBv8DfjOoLnM9C4mBgZ7ROG2FWmbq1J6tJ90Tx7y9md9wsT+zTeflB/g9m9tOf7BVVLp4QhgNMMGFR/wd9pP2BYQNZJeKj1TXbd4QqH85lDHPadbDb7o3niIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvJoDj5cuFoufXf1+1N1kFZsFYwmybVe/s5Y1FrWs3g=;
 b=Pf3qA0/smDxP1mPTW8X1YVRDt5TFT+YnFCt3JfJrhEZKECpAfRR44cbW4o+j3gM9gYC29cge18Rz9C5G5oulJvnUHGgBb+AUDiSMWb8lfKIsBbEkLE0Y8uAUuWRATS8Ib3rcagJdgjfHbaXabO1fYdeWHKKPJ4o6moUNwbb+/dRUzVRP7LdNt8dHDya9ni6Jku1abdKtVLF81w5ewZY5A2CF5z5EEHuAMWrioitWjobNIEmfejPseKr86xrvix1htc0toF7NjSGlCf/wyDZd9Wk8+Iq5NeHnbwYlITt1AEHXq5wg4kezqOdIKjjIDdI7mxiJAdh1qCKqiCrtVNMZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvJoDj5cuFoufXf1+1N1kFZsFYwmybVe/s5Y1FrWs3g=;
 b=3rA8fcqehRKbiqVgSnaq0RqtaNUxgJUyNErAoLBBqPEC8TZr9NSdZxN2wdf4QRo7EF99t8s4WGTSB0huw0ub+MayrawZT/9gbqG7gSSPgLmSDa82OQH/CXOKi7cXRbJCFbpF4dQpoRw8L83i7C5eHZfb3zi7iInZ2WaPNo4zfUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8319.namprd12.prod.outlook.com (2603:10b6:8:f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Thu, 20 Jun
 2024 15:50:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 15:50:11 +0000
Message-ID: <6f0d5bf4-1cb8-491f-b5aa-119dd6edc6d9@amd.com>
Date: Thu, 20 Jun 2024 17:50:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amdgpu: Unmap BO memory before calling
 amdgpu_bo_unref()
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 felix.kuehling@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240620145238.25295-1-tzimmermann@suse.de>
 <20240620145238.25295-2-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240620145238.25295-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0277.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8319:EE_
X-MS-Office365-Filtering-Correlation-Id: b03404ed-fc74-4a1b-4d5e-08dc9140ab30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TG51bzJ3R2lVU3B6Wk80eEJrdXZFSEZFcG9YSXduTCtxYkw2NGZHQkMvQmt3?=
 =?utf-8?B?Q1VQZVp3dWM0MHd6aDRIRDNRLy80ZW94R2Z0YVlvQm9iOFpCTGZTMW1UVW1h?=
 =?utf-8?B?NGVhVVF0SDc4cmc5ZzdLTTBKSVcycE40aXpmb1ZHY2d6bmtzaXFmWFJzb2xD?=
 =?utf-8?B?Y25mK082TVI4eEVWOWQ5V2ZIdkt4L25uM3g2RGtJUXlLNGVkVDFMczl6NEln?=
 =?utf-8?B?eTBLN0pnRnBaeWx0cXZ5TTNZbnBZZVhvNk1MTmNpem80c3dpWERBdTJJZ1hs?=
 =?utf-8?B?NXBWUzVNSTdlQ1RlYU12YUc5czN5ZjdJZlQveGJQekNnZEhpZVFadVBKZjlm?=
 =?utf-8?B?ZEYxQ0NaWmxsU3I2Ym9OMmJFdkI4RW5neHhibk5pR0dKNUt1YlE3TTlIWDQx?=
 =?utf-8?B?ZENndFRieUgyc0xGQ1NURjM1RlRTY214T21IWmxWWTdQT0dHVlRKdmxkQ3Bo?=
 =?utf-8?B?WGo0MDM3ZGpoejR1L3hsN3BmVDVGR1pWVWRTV3lhZUdSMkJRL3lQLzV1MEMx?=
 =?utf-8?B?Y042Z29xNHRNcGJLNU9rZGtycW9xZWJkZUFpVTVHdlBlVTY5Uk1nZVlYbG1I?=
 =?utf-8?B?eExTa2FrZStnR1gxdUVDM0JFRmJIZEkweXg1Y1Q5UFZIcVc4US9XTm9WMHhB?=
 =?utf-8?B?WDZKblNWZExVdjY0Y0RuRmJkQUovUURURWh6cVY1UmoraXV1R3o0RlZ0V3Fk?=
 =?utf-8?B?Y0puRFpyRTFaR29NMXk5LzZXa3pMZkx2d2IwdkV6b25xZnVwajhxZDFBcFN1?=
 =?utf-8?B?bGRPQkw3NUlMbFU5cFM3b0RJbUxxOEJoTXZBU0dpYTVRQm9yaHBGTldoVFpW?=
 =?utf-8?B?R2hTTmVQZEhQbVBPajY1YTg0K3RNSFdreG1mOW1oa01COHZMdC8xcG00VWd5?=
 =?utf-8?B?eDIzdHJlVWF5Qm5PRUFIbW55OVBFYTJ4R21RaE83U2VKNHVFbkp3Rmkxc0R5?=
 =?utf-8?B?K2xFU1pBbXJ1d3RMTmtTaitRMFZkUVB6NmkzQys3dmI4YmJWZ0FsS3d2cVpq?=
 =?utf-8?B?WmpGRDJGQUtML3hYMG1FY2w5WEdKMmtSRld3NVc2TExUREFrdC9yNWdCWE52?=
 =?utf-8?B?YWs1M01xaEJTOTFib3V6bEdsNXdQM2d1Zlc4YnViSzY3UWNZMFhwYnQzTERm?=
 =?utf-8?B?d0wxVEVXZVhxTkRyVksyM3V5bkExbG9JN3Roa3JsZEYzczdkTzdMcUUxTXd5?=
 =?utf-8?B?OVYvbTIvbkwwZUg4RVpSdExsSXdwUDAvZWcvODBvS1FDaHR4WHdqN1EzSU1Y?=
 =?utf-8?B?bW5KcHV5RGFSbkFVeE5Xdy9hY0k5eGlCUTFnTWxkTlp5dis1NzRxdFUxSW4y?=
 =?utf-8?B?N1kveWJKZGg4TlNCQkFnZW1rbEl5QTJjb3hzQmRNemRDYTNoYkZpNjhKZEdy?=
 =?utf-8?B?MG9zSjRsc1N2SEVpNGhXT1FPbHNySk5ReXFOeXNtMFhKZXEwVThlckhXV0pn?=
 =?utf-8?B?U0ZlczNadnJiODVSdkRBZE40R2FuSS9uOVFWb3RTMEJxVVFmS1NOOUpYTUR0?=
 =?utf-8?B?K0UxMXkrSEMyWVpYbEpRb3RaTG1DR0NvTC8yV3VqQXEraHhWaHp4MHhlNjgv?=
 =?utf-8?B?YXcyTWxuSjJWRERld2puZGJOVEFqSXdVOE5oSmhYNzdOaVFlMnk5NWRzYkdr?=
 =?utf-8?B?b0dhWHVMYWhDWFR0azBYYytlYXdWSnZEZFJNL1FkSU1uRzBBaDJ2Z3hydUo2?=
 =?utf-8?B?NTBpYW9wbEwyc091RnZRODlTUzNxOGoxb3g4RXM0TDEvL3FuY0x6aWVxclBh?=
 =?utf-8?Q?6aaJ2hsFMSxU1zl024HUJev+/fgDGWLVTf5HuAn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUNVbkRISXFzRU9nTVBtT3AyR2hFc0dMeXBHRDhHUFllY3ZjYnMyaWlMcnU0?=
 =?utf-8?B?MHB3SmdDZERmOW1kM2x2Mi8rUXBZSHEwenlRb0d0VVVuRk5DemRGN0k1YlJO?=
 =?utf-8?B?dHUxY2hPWmN3dDM1Ym5uMUtJR250QSt6czBwME1RWU80eGptWmV6Z0VhaEtW?=
 =?utf-8?B?a3crREhwaUdMZWhKT1ZLMnFQSkN5aWdRL3JhaXFISis1UHZodUZ3TlBLRkhx?=
 =?utf-8?B?NlY1dTZlOU1zV2xNOW9qNUF3Q0dEMG1DWEorTzVpZjJhTDBaYU1nczYzTUxs?=
 =?utf-8?B?Q0tIbUZRYUZZY1ozVlFmdmNlWVkrSGE5S0l6YTRBaHp5WlFoRVJRNmdkMmJX?=
 =?utf-8?B?OGJMSUtoWWdqcDkwSUhjMS8rQXl3WWdDNzBnY2dWVHRUYk1xa3RPaXM0dFJm?=
 =?utf-8?B?ZzRhSnJFWEw2RjVReHNIMVV1YzlOTWZobjRuU0FzRWdycWtES2xhQmluem1x?=
 =?utf-8?B?WmFUQ3ViUDd6bnlkaUdwMjhBRU11UzZZSVRPSHRRWmlPM2pTTFNTUDZIaVh4?=
 =?utf-8?B?NGN2b00rZ2QyeW1ybjNlb2ZoV1dOWXZGenByVytEa0ZSTXpLTzhIcmJha2p6?=
 =?utf-8?B?UDJyczgzM2xValdtWFMyZytxcXYzai8xL0c3WFBoVUhuZWIrZDVRQXpVYkV6?=
 =?utf-8?B?UkoycXZjUU83NDYwdmRqMXFydlhiOWpTcVpOd2JMR2owcVoybGMreXlWcG80?=
 =?utf-8?B?R3VCV3g0Y1l3ZjZzcG1KSEp3SjBubFg4Y2l0aWNSTk56ZDJyR21ORVdMVHFN?=
 =?utf-8?B?YTZHQ2laMzhINXZqOG5tR1E5STNlczRFVjZvdGRTSjlrV2toTUlsTUxOVE5B?=
 =?utf-8?B?Q09OTVJQNmVsZFBNZkVVdndtSnJCRHpXWlU3M2pJa2cvQndLYWNrWUliYUlP?=
 =?utf-8?B?V2JlRGViZmttVWZKbzB6ZFl3QTJNU05VZ3hlWW9sQVJyS1VSSEFER0I1T2RP?=
 =?utf-8?B?clk4aHRLUEpCVWJBVWFRdkJtZXlnN1Z0STFqbWdlQXBidFBsWEVZKzVyZUgz?=
 =?utf-8?B?QlRNZ0llczVyajY0cnFUaWNXTllrVzYrVjV2dTZOclJEQk1KY3ZEU0IrZ0dC?=
 =?utf-8?B?VXI1SGRsNFAyT3dmSHNvQXBialJwVnpnWnhVdjNLYkV4M0toR0I3RWI2UkY3?=
 =?utf-8?B?Tjd1WFVqbGF6eTZxZ3hsaUxlNmRBb21qc2ZNVk1vbTZBbUl2bnNlM2dpK3FO?=
 =?utf-8?B?Nll2RzJ0b1ZSV21mMVkxQks3OHg1OEcwYXVJaVlyODhBT3hHRGxWNDNSbHQw?=
 =?utf-8?B?d0t1aGlkWnpYOHNHeFB0dG9UK1MwTDRDcmcyaHlHODd1VlVBWlN3TkpQWjNs?=
 =?utf-8?B?ZXdTSW1GRTdjY2Y3VnNncThNZEN3bGlzc21XYjdvNnJUQ1EwVE84NWlYclIx?=
 =?utf-8?B?YTcxSG9XVlI3bUc1RDJVdFlrRTNqNkFOYi8yTVRQc3hpcHFIWXYwR3pPWExC?=
 =?utf-8?B?dTN1Rk5jU0hHaEhoUi9mOFdmeE9vbE05cjFDYVNzanJFd3NxT0ZScVFaTFdm?=
 =?utf-8?B?M2ZCeG9tN1FuOHFvcS9ybklSZzZ6Y0drd21oRE1McG5HWmpmbkxuYmJONUpy?=
 =?utf-8?B?eEpDTGVtRUEzSGFvTnluSlN1MEttRzF0TFJKMXFBSVBNUUFNVXNyREk4N0w4?=
 =?utf-8?B?SWpVL0RZOXZlV3BzRUl2SkxvWXFrY2o3YS9xUlp0NFlKdDdLNEpNSlN0UG1T?=
 =?utf-8?B?MVlLSE5namZiNnBSM2MwVUV3Z0Q2OTNKTzlvNnNMTnhRQ1FIN1BNRlBRelg3?=
 =?utf-8?B?VU1DRXozVHNCbzc5VkIvaW9jWmFVcFY0VmpXeU1MVXp2V0JtV2RZVllURFNE?=
 =?utf-8?B?L2NpelVFV004eVZ6TDhoenNzQ3dlV1I2OERhZDE0a0p5WXpaSnNPTEcwbzdH?=
 =?utf-8?B?M3hteUc5c0FDWVFyVWQ1NVZzZ2ppWmxnanhIMXFkUDkxK2xLMUl5YmJ1QTVa?=
 =?utf-8?B?Q2E4dGwxVmx1TmlQa1dsdHg5Y3FoWWtXVUxjSmlnOEVtQk9WRitaTU5vUXhD?=
 =?utf-8?B?YVlmRzFSR0UybVNqYlF0ejRJbmdQeVlMdncxZlhScW4zSjVnK2xDRzZRSENw?=
 =?utf-8?B?ZUVkcEMzSWlqdkF0NGFvUTN5Y25sWWsrWlQ5MnlGYWcxWFpTRDU2ZDdxazRm?=
 =?utf-8?Q?fT3P05digSbf5i7BE+usuQ+un?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b03404ed-fc74-4a1b-4d5e-08dc9140ab30
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 15:50:11.7327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oibSiAEFxCLGEHb1tDuCi3KpgeKk5gjH5Vr7jIj5a2TVih9gR5or1PzZF/reFZlU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8319
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

Am 20.06.24 um 16:44 schrieb Thomas Zimmermann:
> Prepares for using ttm_bo_vmap() and ttm_bo_vunmap() in amdgpu. Both
> require the caller to hold the GEM reservation lock, which is not the
> case while releasing a buffer object. Hence, push a possible call to
> unmap out from the buffer-object release code. Warn if a buffer object
> with mapped pages is supposed to be released.

Yeah, I've looked into this a while ago as well and that unfortunately 
won't work like this.

Amdgpu also uses ttm_bo_kmap() on user allocations, so the 
amdgpu_bo_kunmap() in amdgpu_bo_destroy() is a must have.

On the other hand I'm pretty sure that calling ttm_bo_vunmap() without 
holding the reservation lock is ok in this situation.

After all it's guaranteed that nobody else is having a reference to the 
BO any more.

Regards,
Christian.

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index a1b7438c43dc8..d58b11ea0ead5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -58,7 +58,12 @@ static void amdgpu_bo_destroy(struct ttm_buffer_object *tbo)
>   {
>   	struct amdgpu_bo *bo = ttm_to_amdgpu_bo(tbo);
>   
> -	amdgpu_bo_kunmap(bo);
> +	/*
> +	 * BO memory pages should be unmapped at this point. Call
> +	 * amdgpu_bo_kunmap() before releasing the BO.
> +	 */
> +	if (drm_WARN_ON_ONCE(bo->tbo.base.dev, bo->kmap.bo))
> +		amdgpu_bo_kunmap(bo);
>   
>   	if (bo->tbo.base.import_attach)
>   		drm_prime_gem_destroy(&bo->tbo.base, bo->tbo.sg);
> @@ -450,9 +455,7 @@ void amdgpu_bo_free_kernel(struct amdgpu_bo **bo, u64 *gpu_addr,
>   	WARN_ON(amdgpu_ttm_adev((*bo)->tbo.bdev)->in_suspend);
>   
>   	if (likely(amdgpu_bo_reserve(*bo, true) == 0)) {
> -		if (cpu_addr)
> -			amdgpu_bo_kunmap(*bo);
> -
> +		amdgpu_bo_kunmap(*bo);
>   		amdgpu_bo_unpin(*bo);
>   		amdgpu_bo_unreserve(*bo);
>   	}

