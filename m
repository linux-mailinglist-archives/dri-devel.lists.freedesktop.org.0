Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C4D65F26E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E413610E7DF;
	Thu,  5 Jan 2023 17:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2073.outbound.protection.outlook.com [40.107.212.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A524C10E7DD;
 Thu,  5 Jan 2023 17:18:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmHyI7P5f8Q+Asnfdc5BwZF1gKOK68j7yBMZCo5aEcE2dB/NlrnpEoRK8Nj0G/0XSLREjFFv+KOKzsNIQlP+/JRve6T7VQna8KNGJF7AtAHNEXokP/GiffeTc5EwzmY2si7/r/ledlhAgxhKi9KntRbcdAG0JnIGoIfK18vYuDKMIRXIWW00MyYjrhXxsPO2lOrjZoqHFHjNqYB9MQPQJv46ORpXPYa/FPf4hsDqhQX3NOWXrRwMSBaR/FrrNJeNszfcdH/ccDaNJQfVkvkBgnyAhfWWInGQx7TSUgv9QkUj7Mu6bH1g4sugNxkwSS21esdDdNZhgWWQxGqs4nAU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dm6hntY6QyRDGHNbXrbOa33KwStu3l/kJisMQ73Vq1U=;
 b=FVmmMyQ2b7AxqYI7hXYxJBLwy5dkeGn6MMXhTj31Hej6uraeFz6+U7T1HQSBzZYu+U3jotInkXBtXXp1Wp+PPFUhemoaM2CgPmNZvRRCQkGlk1EvI7W530x+muXpV+FrGKON4KcAD90dpMgqENlVmI3p0ZLW4JrUlgmOilSMP64iRGRkZXF9iRIEWrK1iM0huq2SjFlIfkwuFP+AepCOUSXsKbaWbksInmko5k8sZQzu0/aYFd5d5aG2IsVzOVgbX5M3h12LSBkQsxfMaOqhXxiYUfLxu1Sy2jqxcYzx7B+eLggarf2uu1BeoJT8GXasOrtUxfr5n5V3/UZY8eiNmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dm6hntY6QyRDGHNbXrbOa33KwStu3l/kJisMQ73Vq1U=;
 b=U6xpm8bjr2Mhk76f8WqQJwhjB59XGPh7vzsp6mF8/RPS9lVgtI1Q6r/8GqVrNFGLvIiy7LBvnA21rSml1UqrxMDABpK5Uw+EbXh6hA585StMAkmDmCjkPKR1fBB2lMhm+v26u0lFM9U8zVSCjTKQCVJKZF3KhlGLaFIJmNgl3Zo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB7966.namprd12.prod.outlook.com (2603:10b6:510:274::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:18:48 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%4]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 17:18:48 +0000
Message-ID: <6c1264f7-3165-d23d-0c4e-d8b992d054c3@amd.com>
Date: Thu, 5 Jan 2023 12:18:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 42/45] drm/amd: Use `amdgpu_ucode_*` helpers for DMCU
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org
References: <20230105034327.1439-1-mario.limonciello@amd.com>
 <20230105034327.1439-43-mario.limonciello@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230105034327.1439-43-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0072.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::25) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB7966:EE_
X-MS-Office365-Filtering-Correlation-Id: c34fe745-6585-45f3-32b2-08daef40e858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qTQs81W4WZKGf1p+sFeTOsVRayQz4x3bdEGlpvCxLz5ni/CXKc44hwnGr/Za7EuBdmDgGRNH0Q2y314VeQ51M5qBcCAzqgk1z11JtGuCksfnes/rzYl9hqAtGDHEvWj9N0eYuNOs5ez+SOEG0fK4CO5vObfga7lrXg17O/ODCb/l4UXjS1hy6ukCKGguNJdEl+Y4oqjBAlAYSfN73NA+hvZFeAMczRy3q5YvEetv6mw39z4Gia88cJ34SAImiDAqwA+aVpbTlk/oFIxBb7j1rK9T2zyj+PXL1RbmXXT3t+lwG1WUUaQKzbA+7l3WEbpYiffN1OmElTFUS89aFPXCjvWos7mTkYGiCV71WaYM8viGo7whi07nOsCL9iQqoKguCZh3Jo/14RnKXRhp3pLuWzv6IymjyFrxR4iBA74/jSYdu/oVQ0cmMqGmfAkd1hDLNGTS52o+/75yblGMKceGFYnoosTrbtlbgas9f/II3+c+f8WhMh7pMbe3nul1/Gjrv+tRspxFuCD325XTCtfr8eFg2Ucgt4l3zOJ2HbXZl7OaCiEFkL1j/ZDucTQOnr9p1lk/zAB78olWDPr2QyE0lOpL/2gCX3V6GlCUeRP3MvdDQq1z8vAJbmoUtdaikVodXwgd0t1VN2WJj64quvpX0VSfpcupK3p6Rf0TD/qF3jr+kMkkwIU9pBBrpvPm108PGAfKh4xqq1letCl+xw9JWszYRzrP5Lx0Nu01dJ/178bzwxdoUNmL9bb/uw+RisWC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199015)(2906002)(8936002)(66476007)(44832011)(6666004)(41300700001)(38100700002)(4326008)(83380400001)(8676002)(66946007)(31686004)(5660300002)(66556008)(186003)(478600001)(6512007)(26005)(6486002)(316002)(2616005)(31696002)(53546011)(110136005)(54906003)(36756003)(86362001)(6506007)(81973001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnBJZmxKaGNzUjBqZlRyTzdiYWwzV2JlUmltTFVzRUJmRVI5UzZYcHZGTXM3?=
 =?utf-8?B?amw1YTI0WEtKOUJPVnhmQlFuZFpwc3dzRk5rU0FSTE5xdGl5dUR0SjNRUWxI?=
 =?utf-8?B?bnd6QlludEFlbUxObk9XQkdtYUtSYUR6S1lZZEY0bGxKdlVEbXNuZkdTU0dv?=
 =?utf-8?B?L0lDSDhLdXlYVVJ4R3o2dFZXVzJJaEtDS0NHeVJWQXV0YkVHSXc0ZEVVZ0R6?=
 =?utf-8?B?dkZNUWNpN0JJSGp6bGhZZlRYeWxwcGFNeE9xWkdhY3phT2cwVi96YkpQOXFM?=
 =?utf-8?B?ZE95RDhRUXhJRkdPU0V6ZDFlb0JPV0dSc2kvcUY5a1UxcDdCUUdaSjBDT0NU?=
 =?utf-8?B?NWk4MmRRS2lJRmhxa3dsZDBXWTZIalJUZVVKRkh3WjNFeHRsajNhM0JvZFh0?=
 =?utf-8?B?dzZLT2x0b2NHUUNhZVd2WHBXa3h4ZTNud3dMSE1OMUhSaEZlbWYyUEVBbVlB?=
 =?utf-8?B?VHA1OGRsWWw2dTNLVDROZTk3UUVwMW5weElwU1owY3U2R2dyZTNYd0xMeUla?=
 =?utf-8?B?L0NzWSt0a1JUbGx1U3h6Mlp5Mjl2Z1ZKaUVGbmN0SDZkUldTNDNMZFJkZ3Fh?=
 =?utf-8?B?OUFKZE9PTklaYXc5Nmh3TVd1YXFBbWNOUi9JOXZWS3ozU2VPVk9STFYzMlJk?=
 =?utf-8?B?bnFrTlRPZFBxRHUwR2xJbEZzaFlYTTY3ckhFSHM4T0N1VzhxWG5NamNZQ3Rm?=
 =?utf-8?B?UlZ6VjlGdXEyZUVBSWJCdjdGM2dXVnF1aTdmL2UrR1h2VTBHZGM1ZXJsWWFk?=
 =?utf-8?B?cE9LK3E3UVM4UzB5aGlVaWFNMU1XRGlsZE0wbkpIbU9GYy83RWQ0SGprbS9x?=
 =?utf-8?B?UDBHZjd6d0lLQkZ5dEZ2SFlxNVVCSHFOVUorYkZZQ1hvbHRaa3dad05CNHQ2?=
 =?utf-8?B?cU5LVUdFa1JySVNBZjdMcDRqVG9IRXUxeGtmRlhMdVRuRUFmYmJyWi90c21U?=
 =?utf-8?B?eTlRUCtDV05RY3JUaW5oRGdSUDhlRVhxM2NHcHVLUUxMMEE2TUhYaDNQOCtB?=
 =?utf-8?B?MG96anR3Q1c0RFp2bWZKR2lMQWpPSkxQTG1jQW5ZQkJ1R3J2NDRwYm50WUE4?=
 =?utf-8?B?SXZBL1ZjelkwVUora01lclYzS3o1NWU2N2h5ZUV6TkpmNVdDdm9oejJWemc5?=
 =?utf-8?B?YTg4Z2JQem5LSk9hYjdpdEZ0Qk5mc2RncFdUTS9CelE4WXg2Tk8yQ3dFdkFi?=
 =?utf-8?B?dlFvT25jWlBmMGliRFlyZ2lEOVU1VEVhWXQ1U3J2cGU3RDVyRCtpT0dPNk9B?=
 =?utf-8?B?NFJDSUxGRGZ3ajhUSE5LMlhVR1Nlak1DOWxyUmEyYUZ6elYveFhIcEE3bkhp?=
 =?utf-8?B?V2NlbjBITCt3MHY5NmJUSzBRRVRUaWpFWExUU1lQajVnZzB4YzlTTCtyRDFG?=
 =?utf-8?B?WTdjSU9OTnA0ckIvNjBHbGRNT0JXdlNKL3lQcHg2ZERHeDJQbWtIVkJ2bkdS?=
 =?utf-8?B?VFMxME56OGtOem9NTDlNb2djUTVueldMSkhNYkM5N01tZ3Fycm9DZldpcTQy?=
 =?utf-8?B?L2xVZVJneU5ZTXhoTWovT3BoQjhENG9hVDBDRnVWMHp1YS9qYlAyRkJWd0ow?=
 =?utf-8?B?YWdXNHJnQmhvVU45SUtKZEgzSHRsWkF6RURhN29HcUlWSHR0ZlQ3UXhhUElF?=
 =?utf-8?B?dTVDMHJCN3NSaWVBT3MyOGU4cTZsOUpKaHgxbVBqNTI2OGZ2MFgrTmF4b2ZV?=
 =?utf-8?B?ZTBtUEhZR0ttVlpkSGNXWkdTbTh4YUVsbWxVcXhXWm02RWtRcnV1dUpxR1F6?=
 =?utf-8?B?U3huK0lIMld2VWRWUUJnZGZGekR6Um1FN1lhRHB6c0t0RGJERmkyaFpVaFlC?=
 =?utf-8?B?WUdtZEJLbEE1MFgrVzhsRjNPNEppaTVpNG9NK2JodmhFUkJNaXRwRFBLMVEy?=
 =?utf-8?B?ZzRGY3BPNXlFWDVGamJLRGJFWVU2YWExbmFESVBWQXZrZ2ZEWnBVNUJiY0dq?=
 =?utf-8?B?S1RXQlJRWmQ5SCtQSmxmYm81Ky91R0E5bEJwRXF1SXl5VUU5bUtqVUluQjRq?=
 =?utf-8?B?UVFmL1h5UFJ6RFZWVG4yVEFxUkxCeUlrQVQwTk5tSTFlQ2Q5U0FWOVhjN2pw?=
 =?utf-8?B?dDg4MDBCQnR0QWFZMUkxbHcxbnpna1Jqb1FlOW83MnZCcHVuWExaeFpWeXFU?=
 =?utf-8?Q?e+FVxaEC4XFvWu1LE8ZIFRP92?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c34fe745-6585-45f3-32b2-08daef40e858
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:18:48.3417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CS7JjDKpdcR1viw6cdvU/SRQwwsZbASUxuwfkYuneUczYe9HY05ko+NcFZzqqtoRupZc3z7N3SiGyJymtVlqUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7966
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Lazar Lijo <Lijo.Lazar@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/4/23 22:43, Mario Limonciello wrote:
> The `amdgpu_ucode_request` helper will ensure that the return code for
> missing firmware is -ENODEV so that early_init can fail.
> 
> The `amdgpu_ucode_release` helper is for symmetry on unloading.
> 
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 61c192ead62f..79c4652e8e40 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1881,20 +1881,13 @@ static int load_dmcu_fw(struct amdgpu_device *adev)
>  		return 0;
>  	}
>  
> -	r = request_firmware_direct(&adev->dm.fw_dmcu, fw_name_dmcu, adev->dev);
> -	if (r == -ENOENT) {
> +	r = amdgpu_ucode_request(adev, &adev->dm.fw_dmcu, fw_name_dmcu);
> +	if (r == -ENODEV) {
>  		/* DMCU firmware is not necessary, so don't raise a fuss if it's missing */
>  		DRM_DEBUG_KMS("dm: DMCU firmware not found\n");
>  		adev->dm.fw_dmcu = NULL;
>  		return 0;
>  	}
> -	if (r) {
> -		dev_err(adev->dev, "amdgpu_dm: Can't load firmware \"%s\"\n",
> -			fw_name_dmcu);
> -		return r;
> -	}
> -
> -	r = amdgpu_ucode_validate(adev->dm.fw_dmcu);
>  	if (r) {
>  		dev_err(adev->dev, "amdgpu_dm: Can't validate firmware \"%s\"\n",
>  			fw_name_dmcu);

