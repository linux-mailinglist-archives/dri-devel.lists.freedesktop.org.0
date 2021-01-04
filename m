Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7232E9338
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 11:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A79E89E38;
	Mon,  4 Jan 2021 10:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B190E89E08;
 Mon,  4 Jan 2021 10:23:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBAKkLYGvJMh9fTYkGc7V0Aud8/ITM4X1wp+52lLXhSfWYYhXMb50vADknguX+nFNNWUwRTb27eQcCWUU1fu8IxpG2tEEO+ed625JgPSamVk1f52HmeZMLfvCGf3vilD+Ckg1jBPiFA7H7JaSe3SvQY1JV5CLCehdujBDAMis5013pEXiyyV1pRTA7izLhneUQP9OB3YMHtZHeguLFeeiE5I74LlpxE9fmQJf/EgC1qPRM0DbSOL0IMglBGepo/6aKtQ/fFTow9QQI3cNz5ZzBt16EkgDsADgNaCFR3XEUz/M7AYifolSxiaY6FYMtRtF1vXyHXJy3aqtedT1iPHLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKJc8SW2PGZezNwgzkf4Mu8fS8YG3CtWpqHYlxZSvoY=;
 b=JNsGknE2024GEL12FbR+ln9mHm4WoW61zjrGrxGCxq7VewQnXGRhAsmCyAQRzfaPF9i/bZufccrPuxPLoUdvpcsrO+7eEhd58GsmW/wkTCX003vJ6Ln/q2FH+lFmLZ0Dh4ZWQE7EhtpBO4Cna7vqK4TgzLILXgJNvIMzZP8D479JBUQ/f0atIhqR90/hIAZihTK6aQ8T/uDB6TFrDp4aVwJrrAakD9JS89D21VsXxCpVYRb1PRclGzhkkX7c+B10wt3gO5jrv2P/ixHj7Ef80ZqVfpILun85dr5xaAUfJgcLQtgchrzH6JvxFlyz1Khzaa0tb03pde4NRpXN/q8bxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKJc8SW2PGZezNwgzkf4Mu8fS8YG3CtWpqHYlxZSvoY=;
 b=tkta2sF40WDjQokrIg3y7RfDvcU2Edeh8ElW9nBaAM6aLgcyZuxcgjnqrv/8IACIOqWxw0romVy6a/5ua1yhBRMMLgfJkVB7uhb3nfY1bco5p/yyaBY0M5dk8MCS+W58jFWDo12KSX55JnQyil6P65UTrsOKLPvhQ4GjJqV++d8=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4992.namprd12.prod.outlook.com (2603:10b6:208:3c::22)
 by MN2PR12MB4605.namprd12.prod.outlook.com (2603:10b6:208:3d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Mon, 4 Jan
 2021 10:23:39 +0000
Received: from MN2PR12MB4992.namprd12.prod.outlook.com
 ([fe80::d4e6:dc26:e57f:70bb]) by MN2PR12MB4992.namprd12.prod.outlook.com
 ([fe80::d4e6:dc26:e57f:70bb%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 10:23:38 +0000
Subject: Re: [PATCH] drm: Check actual format for legacy pageflip.
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 dri-devel@lists.freedesktop.org
References: <20210102140235.514039-1-bas@basnieuwenhuizen.nl>
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Message-ID: <7e51dc41-f524-3518-ebc0-f7240b2f73fc@amd.com>
Date: Mon, 4 Jan 2021 11:23:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <20210102140235.514039-1-bas@basnieuwenhuizen.nl>
Content-Language: fr
X-Originating-IP: [91.174.76.219]
X-ClientProxiedBy: PR2P264CA0040.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::28) To MN2PR12MB4992.namprd12.prod.outlook.com
 (2603:10b6:208:3c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.98] (91.174.76.219) by
 PR2P264CA0040.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.23 via Frontend Transport; Mon, 4 Jan 2021 10:23:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8fa9e88e-7de8-4911-8cba-08d8b09acd52
X-MS-TrafficTypeDiagnostic: MN2PR12MB4605:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB460506C78287D6B6D4FD50C58DD20@MN2PR12MB4605.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0HLt5yfdCiWHuU59HcXYMz4YmZ3pr4G3z/rJqv0zatVeNg68XDGolZu5yiEcRB06UToRQEghHEyZXswcS5vN150oX8suBAuFXn/qVx27f0ArtsXk4xLd4L+6NCGFDFy+VqGBPYcjt/K4IzsVVBqwWAVi4wWr5PR2zR0vwvoyCN8GNhtvzdN5gP6/r3iIV9KIMUzDM+V0QwjFIisrX2Zho928Uv+vaim4+9hxNVxh7uWZA6LMJfksZTnnT0hEAldN1tw4nY78mIwXkIh6mpsyZJoA2urXrxkrIpbuHoa+RwB8jDltONIJIKSkIhOX64OwcVxWjUvuTo5rtQtDOkASUNgZjnmgU/jRPCHv0AIDXNY/y/YvquafVHEh/SORKKUjtospuEkC6UeZuELFh3Lxqjd5OgYZIpXZas6+FFrDW8Zfh/NW0heNYRKYmPGxipic1uWeAmXg2g2HFB3ynBblTXLS5WGECRSOxFMJUBreJRGWCEPxE6haCYh+soYvgyzueLw7pn5F/3ljFsf4AFtpIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4992.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(31696002)(8676002)(6486002)(66946007)(36756003)(66556008)(66476007)(16576012)(966005)(316002)(83380400001)(86362001)(4326008)(52116002)(2906002)(26005)(16526019)(186003)(5660300002)(31686004)(8936002)(53546011)(6666004)(2616005)(956004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZWZOSFZlZUdnZG1zVHpQb1ZkRHNBeC8rODIxMFdqeDlGRnkvT3NBcGlDay8v?=
 =?utf-8?B?djlibnZwSC9TbFIzZ3d1UjY5VVlSWnNMWjhwQTVtQVBCdGxJNnhYejRtTXpw?=
 =?utf-8?B?Ty9uSHlnQ1ZqbXJWMW9WQTM0bzRUNUVEcnhwU3BQVU4weDZGV2w2MU9TOTBs?=
 =?utf-8?B?MGpOQWRGSVpFNU1wSmM4U24zcVgrdU9SVHFvR0QrWEFaVDdPMUVMY2RGR28x?=
 =?utf-8?B?aGR2TTd6aHVUYW93TERmczZJWDBYcjNpUXVkMzZNc0Z2cm12d3pOSFptYUY3?=
 =?utf-8?B?SDRmUzZ0ZFk2a0JzNXl3dEh1OUVucmo1MXZPb1JpWmNIYWg5aEQrWTJTZ0JI?=
 =?utf-8?B?Q1dWQXJZM3lybmNHcEp4SjlHNS9sZ1E2UUFIamtySlNKTUZPZkllY1lTUXl1?=
 =?utf-8?B?MzQ1VXhyZ2pEZ202dmtwQjRnVi9VbXNPU3JEdWZwNFlIcURoZExIM0lJcExr?=
 =?utf-8?B?cUg2NS9TUE10VGx3eTN0c0FOWC9MWDUwRGZGd3VCRzNxQ1V4Uk1jeVFHWXNQ?=
 =?utf-8?B?OHliQ2ZwVlVNcFMvUExCTUFWVUJUQUlJd21VMGVuR2lPRitEc3ZWTnpqbnJs?=
 =?utf-8?B?RFU3Z3ZlaUZYbUNnelZHWlMwQllBYUhTODB1VmFwaUJ3NmlqdFNoUVA3R1JO?=
 =?utf-8?B?ZmhGa3JkbytTb0I5ZHJWb0VNYW5FelRxM0FHdzJJaXZHMlQzQmwzcHNvcWhv?=
 =?utf-8?B?NkRyaGVmMlFlSGV1c09lQjRKL3F3cWhUNTViQmpYaGk1QVVoRTJ1VmRTb0Zl?=
 =?utf-8?B?S1V0RzhmTlRvNHdpcWh3aHRSdEQwVDlBTXVQY2s4ZVAyZnhqU2preTcxK05E?=
 =?utf-8?B?U3AvTWNNRXFkMXRUN3lEOUxVSlhGNTA0Z3RhRVJHUGRGa1Y2Mm02QWJEOU5E?=
 =?utf-8?B?SGpyZnpvVklqNVE0bFNuM3lKWjgrUjIvSkVmTkU4U1BvZXIwUzdDNGc0YmZa?=
 =?utf-8?B?VEdPSGl2NnFCeDk1WTg5dExYVHQreFdmb3MwVUtBNktmeG94S0EwS3RjYmdP?=
 =?utf-8?B?UWNlK3hSbUZrRDdYRk1qVGUya2F0MXZTTGdxVExBOFNjR3EwOERUWlZ5alht?=
 =?utf-8?B?elVncG56dTFKWXJjbUdPL0ptRE5Hdm8wRlJJbUMwRmY3Y1hWQ08wVjlrZm5H?=
 =?utf-8?B?UlJXUFBtRHVUdElpazJtNEV5LzZNNTZ0NDhNS1E0TDhVM1hpOE04VTZ6OWJ3?=
 =?utf-8?B?cjNQZUVNRGk3cFlKTDdnQ0hwaWhQam5WdGN4Z01yTm1rMlFadmk4RFRyRG45?=
 =?utf-8?B?S1A2dVJVdk9nc3EzUGRLTUtvM0tQY0t3azFubEM1b1FueStSdVkrb2ZGMFkv?=
 =?utf-8?Q?Vw+fHmjoLAgPOlB25KcW1tO1NhX+pOgCZx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4992.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 10:23:38.8466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa9e88e-7de8-4911-8cba-08d8b09acd52
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2kYAmYehbvp7+uJ1UovLLtr1yzRu1wk+ryiV9IIzes7ENnEQGAoH9/TSnkWfFwmK24Zcm/0vgouxJeFOwgJMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4605
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
Cc: daniel.vetter@ffwll.ch, zhan.liu@amd.com, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bas,

On 02/01/2021 15:02, Bas Nieuwenhuizen wrote:
> With modifiers one can actually have different format_info structs
> for the same format, which now matters for AMDGPU since we convert
> implicit modifiers to explicit modifiers with multiple planes.
> 
> I checked other drivers and it doesn't look like they end up triggering
> this case so I think this is safe to relax.

This patch fixes https://gitlab.freedesktop.org/drm/amd/-/issues/1379:

   Tested-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Thanks!
P-E

> 
> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Fixes: 816853f9dc40 ("drm/amd/display: Set new format info for converted metadata.")
> ---
>  drivers/gpu/drm/drm_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index e6231947f987..f5085990cfac 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1163,7 +1163,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>  	if (ret)
>  		goto out;
>  
> -	if (old_fb->format != fb->format) {
> +	if (old_fb->format->format != fb->format->format) {
>  		DRM_DEBUG_KMS("Page flip is not allowed to change frame buffer format.\n");
>  		ret = -EINVAL;
>  		goto out;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
