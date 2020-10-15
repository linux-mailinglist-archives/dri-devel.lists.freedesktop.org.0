Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF5A28F9BB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 21:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFA66E0FD;
	Thu, 15 Oct 2020 19:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630656E0FC;
 Thu, 15 Oct 2020 19:51:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auxFyOgfEfJcFpa2ZVjGx7+OlGkn68k+2QS0k3ecf+NpUfW8YIBGy+XjMW7BFDEbDxQb0U+GXcZMw0VF8BxvfrzCFWmgoiqqQKQi7Aa4SR6o3BnUY/PBxgZ9Z3d7X1dDgtecT79mhNl1brmoJykXvd27kVwE3us13H31i3ByJxLI5I3jZlU+PsOUn1HTwfMk1ZbMiit2qM0jWBD0QU/03vBBW2DtejdYkhJ+sSRjclwdfUkllL8kWYv1kD3mqlp3Es+pYO2TIOwD88oo24kbm39rO9GnEGI7fqdSNHO9KdV4EDGqTCFF9yn99ny5trhCQ7y8GyHRHXVPL4ebA54HUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTVEN9lPhOXoquKhYOkl3DDWB5i6xKrpB3akFUita4I=;
 b=jgZJiSonxypfFskggyYRJYm2PpYKKF1S8MbuZuhd7r7SPB6wbDRgK3c1cmUku6OtaFa+AqGLRotldUvUkqzcch6hl0wGlV/DwekJRfBZr6H+JSvF4W4BvMLwQ0EiytDxtqHzpGbtMoiPdANjRv0094Y1c6BALABLsavMiTdS2LkbhYPYJ0pgfd4xjULkKRAURmE7TzM6e+OuGt6CVdjKtPKro1hpMfYE6WIGECkInxmZUoJSA9ykYbQXE0GIeq4sTITK8bbVjd2kLNtSi2JDGF+rbjoy9Ul0scUf5vZp+c7WfzZpS9a7P3kVPRIDzqE47m1oQdzAlzr1uqevGkQDRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTVEN9lPhOXoquKhYOkl3DDWB5i6xKrpB3akFUita4I=;
 b=C59Lw5W2KW1kezes1mGzCQ3JMuQz4C07Q428Xi+eAn+HAubSE1ecKmEMX+8Xep1JdAiAHzrqIZSZVp7j95ZIaFgWjKijQzlv/nwVSuSYUYxBTYrC7Ri44RyiRwb/C6UBRiIiW2LYOGbXP0Xzks5UA6b0UR4u8WOJvLBNw6qEgPc=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR12MB1293.namprd12.prod.outlook.com (2603:10b6:300:9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 15 Oct
 2020 19:51:07 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::5dc0:bafc:6040:a8fe]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::5dc0:bafc:6040:a8fe%2]) with mapi id 15.20.3477.021; Thu, 15 Oct 2020
 19:51:07 +0000
Subject: Re: [PATCH] drm/amd/display: Fix incorrect dsc force enable logic
To: Eryk Brol <eryk.brol@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20201015194053.355335-1-eryk.brol@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <6014fe5a-5816-b131-efcc-35a102cfcd11@amd.com>
Date: Thu, 15 Oct 2020 15:51:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <20201015194053.355335-1-eryk.brol@amd.com>
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YT1PR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::30)
 To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YT1PR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Thu, 15 Oct 2020 19:51:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ada37084-a1b0-4874-2c42-08d87143a823
X-MS-TrafficTypeDiagnostic: MWHPR12MB1293:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB12930B622D9AE65B79DA8CFC8C020@MWHPR12MB1293.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4r+TFzDCJNTJmIXLjKw6sRL8uDhqqU0Kd1hYXB+s4BM8HdyE0ybeBLHoP9aC+HgMYHjjxuc1P23Hv/Gt6xD7iSkVgA/wyLYdCImgvLdInK/RMKA4R6DTSCxKv5snNY30mzr5GfMwRpz5cQDGe3wcf5lauVBn7RdHkyOyCReDVznfP31+9c4QWkXMyP+LtY9AqKwQWkb6kKcCSMtjtMJWvCI83ZrJ8Sr+Jqqj2jcesQSZVKQYCwlEYgOp06S7FT6WusWliwoT1G0RDRD1N9XEwSiEUBO08dk26IXaZTIWEcAMUl5JYXW/XW2RgXn+dj+QZo0xB+4eNxX5lTuGYoWFeeEBA5ZuzceFRl4rydbLQQFsrNBpRGG7gmSSRvT1YwozUMA+EyR9ZmZOXtYKFzgHor44zGpI/qahxq3cSYlOlXg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(5660300002)(956004)(53546011)(6486002)(478600001)(86362001)(31686004)(34490700002)(2616005)(83380400001)(26005)(4326008)(52116002)(6666004)(186003)(16526019)(16576012)(31696002)(44832011)(36756003)(66946007)(316002)(8936002)(2906002)(8676002)(66556008)(66476007)(4001150100001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: g+OKyXz8sTlSsgWZ+MwGGfnENQp0i0BMF30Fnn0KwQXlo3vodKBt02Vo6pyEAhyJF07ti4oJHRBi8izheDdnNWIfd438l7cIv4aMvjXWmc20FBdRzfRvxohDZWxzULe2irwRxSgL2vt7IMBD8fHvcfxocRyW2Xfmr2YLG51zHqO151WjGvsqVgVs6LgzvOFcL1NyLoIO4pRfpfO4bm9ccgGDx8sL65/8tBbc92thU3M3itRhfPqruiUrKfiS30RAMBppjSph0gV4Ce1XwW8DqvM4dgM+aZNtLzj9JB+sdmLIQ8nyb3y5riMH+mTvuE9URcVEz4g3kgu1sHrc6pdSa1B7WxIKJUhtR6sBwpJVo7bJCtofPBVnzJok/pxy1r8n975RYBV+9mNt0LmqfOXoq4316PuXnWWZEfRlfXnvQ1hNsn23ycuYahPKfVlrVOJ9qHyYX3y7sRmvPgaaia34Ha7UrAKeIyxKNt3CK43rocIzyXok189chLHmgwUNJ8WoKJ9AQnnUillDOdSvwOSfPbbmX5PkF1MUu9cp4cRS4rDVzSvc6KiT5oaRExVWIAmt4f7pgs3aptQ4AIPiIFqOrrGCHswJsKP5mhmcSlDTPeWRnh/t7zkhfxEOgehrcGiju1Qgq3X1OdUmrdfN/fPqbw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada37084-a1b0-4874-2c42-08d87143a823
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 19:51:07.6055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZC7PlQrMC6sLWmKhxFHc7B1PjXQ2gOvjRTkrfKH3fVzlMO3hTWR6Tcu3LIvTlbHuVmg3uN8vEOzdaWdRHcUbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1293
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
Cc: torvalds@linux-foundation.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-10-15 3:40 p.m., Eryk Brol wrote:
> [Why]
> Missed removing a '!' which results in incorrect behavior
> 
> [How]
> Remove the offending '!'
> 
> Signed-off-by: Eryk Brol <eryk.brol@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 98b4d5e2e336..fc87b9faec92 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -644,7 +644,7 @@ static void try_disable_dsc(struct drm_atomic_state *state,
>   	for (i = 0; i < count; i++) {
>   		if (vars[i].dsc_enabled
>   				&& vars[i].bpp_x16 == params[i].bw_range.max_target_bpp_x16
> -				&& !params[i].clock_force_enable == DSC_CLK_FORCE_DEFAULT) {
> +				&& params[i].clock_force_enable == DSC_CLK_FORCE_DEFAULT) {
>   			kbps_increase[i] = params[i].bw_range.stream_kbps - params[i].bw_range.max_kbps;
>   			tried[i] = false;
>   			remaining_to_try += 1;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
