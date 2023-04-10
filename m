Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7C46DC809
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 16:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8896610E3AF;
	Mon, 10 Apr 2023 14:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE84210E3A0;
 Mon, 10 Apr 2023 14:47:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNCFKPXxYy5F1nqpVfbm9m4ij2Dp4wQwJgZotemXk3Cv32LBQECDBONiSJJctDi9kE8sfzFcPm+66dfzeEQRtezjWQCUto7Efwsf2QVw1AKlUTplS/mYs1CJhd7HvvgpDfRc5GEHEdTOblmltr2gsFvtuJOWfS9g+bfGH59P/ueBRPezsZCYYYDznNs3kxFXGjnKH5tia+mdED0ncwlJofebAShRyPW6B2Ne7zjzYDQmlCz9hWvSZF1cUWooxjx0PVmmhSkbO3WwAmJN8eXpQA82sRL4pbe0Fhq9ivzwyBr+/EEW6E2pBvqA+mAUKNVluki5s9Alit2gVA8/etC99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMmEzuy259m9MJGu1sIJOY1M97d39JlZyKes1BDmvVg=;
 b=CTb1W4Q03HsIhVzO3Uc/vQI9xb7QRsxGsyL/MAvURI2kVF27ZOp2QcKnsR7GNGRTC9jsWc1mVYP4nHSAXea4D0AXRbAcgQ+FB2ii9/NhFhhyXYW4OFBkpnrJvxxaVi9zyYkaMfJk+fVTq0rLUbVCBhj67X3zRIv6COFwfO/bLrFS+cHjkjX3xEMAd+VZw7Z4tR03vMfM4X4UGOVdNU6Q1OWUAP2ArCsZez76AfnJhYsRth1kA6u0wGRLFC8ySp2Jo4KTp7MKsh2OKQqYZUElAwEz/F1PSpsVCwZwo9TjkA4V8XvkbfxwFas1yJqKlXhlWEs8L2evqu5IBMBukWYL8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMmEzuy259m9MJGu1sIJOY1M97d39JlZyKes1BDmvVg=;
 b=QlI9pFMKfViCi7o3CxvbdGB/JT7n3WkwqDeo1+dahY6rPlaQ8QtAeyNUWQQEfal1DR42pQIh2EfknwAfpbl4NnX7zoVNfyW9O5YckVdeaQaQImwa/9Nh1OmvJwqpHz7RY8O4GsVQ++JEkw4Jla9sifd+Rgu5Fcu1MC4ntFXEA2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Mon, 10 Apr
 2023 14:47:49 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6277.038; Mon, 10 Apr 2023
 14:47:49 +0000
Message-ID: <2a608e8f-823a-7c01-8dc5-ad6c86e5f306@amd.com>
Date: Mon, 10 Apr 2023 10:49:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/amd/display: set variables dml*_funcs
 storage-class-specifier to static
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Pavle.Kotarac@amd.com, Jun.Lei@amd.com,
 nicholas.kazlauskas@amd.com, Charlene.Liu@amd.com, aurabindo.pillai@amd.com,
 Dmytro.Laktyushkin@amd.com
References: <20230408134348.2703105-1-trix@redhat.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230408134348.2703105-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0114.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::19) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|PH8PR12MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a36ef29-11a8-4d4a-36d2-08db39d28df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LXDkC+1Z79aVin+ZqMnpK8Fbk/kMOhJZDdr67jRO3T08t99DEcQ54FOICeP14gNC6gWgimO5+LO/tjgjxWt0+D2BgNngEmWUCOGmNBvVpGH5pDiGgjqfsIsbSYqS1dIU/1suxMb4WGHNcViIPgwTYhMEeI6dBdVIKgnIi3DL3D2exMN76Sqaep4FYG0JjtAWfl+YZ0sEf7uj+dKxMAEwU1GIX9zLV8WQpdRQ/JM57Eu22DwMPsvJzwpu9XHQp2/elpSuQ7dWHqhCjXVodKs3onoDfIDuKTKXxzHKejIyoBLw5srJj7okZFvl8c/mjAdZzRP5z7+D/BBrH1rpeHT4WLnDpXSMPkFumORbcyGeVD2AR68I7dpkbobQutj/s4PPK4+mUy6PpDmNdBhAyGXJa2L/2NcEblJC78APA1M7Ggwv2Z4M6X7Le9Npso9Zp/elk6/95t6Z1jTNWkD9A9M1gjmLnEPbXe8Z6RjHEQIzNcBvZRLU3UhRFkgKFK2z9KKheBbGLVIkDyU8VqHQXaPZKyJcP2h91jl5IpEg8hXpxGsjH+ckVYKxB7t4C80ymE9B71PC3VIOuoFGPer2qc9hnzSFIYuhtXFbNvN/3/pwWzCerh1gVlpIPahYQ9Eyfr59dc9T+q1zSNXDZspsYf8IteWX4+m1/CaeQwpSGH3UYA4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199021)(86362001)(31696002)(36756003)(316002)(41300700001)(8676002)(4326008)(6636002)(66946007)(6486002)(478600001)(66476007)(66556008)(5660300002)(2906002)(44832011)(8936002)(921005)(38100700002)(186003)(53546011)(6666004)(6506007)(26005)(6512007)(2616005)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnJJZU5jeVRIbW9zYWMwSlNlRHFEMjhMNjNmR3ZsQUVOZndncHd5b2JOSGlB?=
 =?utf-8?B?S2ZzbTdya1laZW5DN0dvaFdPY0F2YXlEWjlFVXMxamJXT0o4S091QkNMSFZC?=
 =?utf-8?B?Z0NjUGFaVC94bTRaL3VwOTh5Z3d4VDlnbVZWNGlqNmlwMHZXcndhUCtZV2hk?=
 =?utf-8?B?MTd1OENzbnVJbTlWZzhuUDAwdGxySW9DYTNCQ2pkS2xkaWhsNkdMa0NTakxu?=
 =?utf-8?B?VjE1Mm1uWThsMmxGa3JGMjRXZ2RhRDdzRTUvUFQ2QkVwNDI4Q25qTHMvanRM?=
 =?utf-8?B?Y29jQzBNa2o4OGo4bnhQYmtmN1BFaVZTUDFPZC9VL0tROUJqWE9xTmJLR3FS?=
 =?utf-8?B?QUJIT1VDWG0vb3ZlNk8yM1ZCNkpDZUorb2NabUVvTUF1eVgzWitxakI4OVNm?=
 =?utf-8?B?dXhZc0czbFpYb3pKcXdldXBTT1FBVWNjN091RUZkRzJ1YWsxK3p6YWZFNGVQ?=
 =?utf-8?B?TXJVSDh6WG02akhlZjI2cDViaGhSZytGSXlhbzZaWWgzd3cyVHBlNWV4Z1RT?=
 =?utf-8?B?NTVNKzlyZzNJYTZSMjdNVkd5MHRaWUxCQkpkS01pVUlIRVBNajZjWUdncmRs?=
 =?utf-8?B?bGtSZVBKQXEzeEhJZGxXWnlVOVJwSnltT01vT2IyM2RmSkVsN2hRRHBUVkJ3?=
 =?utf-8?B?dXNVK2dFWEw1aXRkVlJyaFhFVmpTbkNoQW56azJUQXBXOUlPclppbWpHRllC?=
 =?utf-8?B?NUZVUDUyQU9SbTVCTCtzTTZaMG9xai9oUE1walRnM3ZkYS9LVkJOK1JzZE04?=
 =?utf-8?B?MFl0cllyODNFSXRpTVhLcTRtV1QxQmxIZUNHdUlOdHJBZDNxTitmUnRmK1lP?=
 =?utf-8?B?aE5oeUJFbEFnNG9VWUIxVEdPQVNmM0M1OFNta29YWXcrK0srSTc2dXltUmVk?=
 =?utf-8?B?THV0K1Zvd1BuMzhkbU03SXFaZ3Y5RTdWaHpzZER1dVdaRGF2cTViZUoxU0hn?=
 =?utf-8?B?YnFxNUhQbXhFb1hialV3ZEtJVzhjQXcyczFJV3dqMmhVVWJGc0ZmVVFHVDlO?=
 =?utf-8?B?U0hOeGh4a282OFBwK09XcnJmcEprZytpcDB4L040K1RVWjZSWU9Nalprb0hH?=
 =?utf-8?B?V3loQmdoNkZOenVjRnVRd0pwUlI1RE9TVjFaUjZGQ3VmUDdkZS9DZG91Y3g4?=
 =?utf-8?B?RWQzeFdBZDUzK083U2g1bGhRek0ycWQ5VUU2MU0vVTZ3Uzc3ZWVUVTlRZzZJ?=
 =?utf-8?B?N0V5eTFyM3JSWGRBcWxua1VSbVFiZVpUbWwvMmFxaG42cGhON1JpRlFuTHZH?=
 =?utf-8?B?MTZWZFlHOEFhMFRiNFNucGtOOUFDcmlxcWx0aWVuSzhWQ0FtWmpDVW9lWm01?=
 =?utf-8?B?b1djeTJ1MlpoZFBsaVh2TnpjRHVRaDhWMUpLVkNNR1E2YnIxMHh4dERmNWJu?=
 =?utf-8?B?K01Rd1FtazZDRE9VVGxsMCs2NjJUMXlhVjVOV3loNEk4ZERMZlpPbVdlK05B?=
 =?utf-8?B?R2paeXVqOUVNSVE2K2hOcTBhbEtJM1YxWCsrTHVtWUV6S21LK24zeitpdnlI?=
 =?utf-8?B?TzU2K21VYUFUSll1Z3J0VUFkNU0rd3VQbG5nMTBsQXM2dzVETnNYcmtkUDF3?=
 =?utf-8?B?ZmttSmE4WFBQQ05sMVBBcFlDL2NuL0dlNzFVaGxPUnRrOGtXN3JJUnVHdVBN?=
 =?utf-8?B?NWxEK25NUFdLVEg1aUt3WDlsbGZmQlBNMUgrdG9CcFdlMlU5dFVVWWx3VVVO?=
 =?utf-8?B?Sk9hL0tjdGc5NVQ5MXk1LzlEZ2lnVWFzZGxrcGlhOVE4QWEyTDdHV280THBO?=
 =?utf-8?B?bzMybDdsRklJMUEyemQ5NHBIVjdUUVU2bnY2YmxIaVZneEw3eDFESTFiaHdy?=
 =?utf-8?B?UTJMWFJCb3ZMWFVaRWlhREQ4N3o3MnpZVUJ6bW1NWk5wZHByaG9YNVVpNW8x?=
 =?utf-8?B?QnEvMUY4R0NzZk9GQVYzQ0JFMFhrL1NISnJsRFFVRkFRS3dTeVBpV1plM0wy?=
 =?utf-8?B?R2VLSU85a2R3REJSVlFOWkhEM3hMWGIxR1hBaDgwWTZyckUrR0FiN29OV1ho?=
 =?utf-8?B?NjEycVVmT0xQMGs3VnNvVWxDaVJsWXlUd1UxR1BnZHZtVjhkQ1pzY0VOZGlG?=
 =?utf-8?B?NnFuRzZadTFTTHd4ZE1xN21rUzViYURES2pqNWlndXlkeVFQVENxeHUrWTB0?=
 =?utf-8?Q?QL9aNSjht4lOxVlTnSDALL973?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a36ef29-11a8-4d4a-36d2-08db39d28df1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 14:47:49.2138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t98YHPHl2fmc8QR3jkBDDY2QJNe1P8QP75vjGn5XoALAPz72r9AIPDAIW8GiAN8ZVAC51PuXcVz2CrqFHrq4aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7110
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/8/23 09:43, Tom Rix wrote:
> smatch reports
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:44:24: warning: symbol
>    'dml20_funcs' was not declared. Should it be static?
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:51:24: warning: symbol
>    'dml20v2_funcs' was not declared. Should it be static?
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:58:24: warning: symbol
>    'dml21_funcs' was not declared. Should it be static?
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:65:24: warning: symbol
>    'dml30_funcs' was not declared. Should it be static?
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:72:24: warning: symbol
>    'dml31_funcs' was not declared. Should it be static?
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:79:24: warning: symbol
>    'dml314_funcs' was not declared. Should it be static?
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:86:24: warning: symbol
>    'dml32_funcs' was not declared. Should it be static?
> 
> These variables are only used in one file so should be static.
> Cleanup whitespace, use tabs consistently for indents.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied, thanks!

> ---
>   .../drm/amd/display/dc/dml/display_mode_lib.c | 24 +++++++++----------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c
> index 4125d3d111d1..bdf3ac6cadd5 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c
> @@ -41,51 +41,51 @@
>   #include "dcn32/display_rq_dlg_calc_32.h"
>   #include "dml_logger.h"
>   
> -const struct dml_funcs dml20_funcs = {
> +static const struct dml_funcs dml20_funcs = {
>   	.validate = dml20_ModeSupportAndSystemConfigurationFull,
>   	.recalculate = dml20_recalculate,
>   	.rq_dlg_get_dlg_reg = dml20_rq_dlg_get_dlg_reg,
>   	.rq_dlg_get_rq_reg = dml20_rq_dlg_get_rq_reg
>   };
>   
> -const struct dml_funcs dml20v2_funcs = {
> +static const struct dml_funcs dml20v2_funcs = {
>   	.validate = dml20v2_ModeSupportAndSystemConfigurationFull,
>   	.recalculate = dml20v2_recalculate,
>   	.rq_dlg_get_dlg_reg = dml20v2_rq_dlg_get_dlg_reg,
>   	.rq_dlg_get_rq_reg = dml20v2_rq_dlg_get_rq_reg
>   };
>   
> -const struct dml_funcs dml21_funcs = {
> -        .validate = dml21_ModeSupportAndSystemConfigurationFull,
> -        .recalculate = dml21_recalculate,
> -        .rq_dlg_get_dlg_reg = dml21_rq_dlg_get_dlg_reg,
> -        .rq_dlg_get_rq_reg = dml21_rq_dlg_get_rq_reg
> +static const struct dml_funcs dml21_funcs = {
> +	.validate = dml21_ModeSupportAndSystemConfigurationFull,
> +	.recalculate = dml21_recalculate,
> +	.rq_dlg_get_dlg_reg = dml21_rq_dlg_get_dlg_reg,
> +	.rq_dlg_get_rq_reg = dml21_rq_dlg_get_rq_reg
>   };
>   
> -const struct dml_funcs dml30_funcs = {
> +static const struct dml_funcs dml30_funcs = {
>   	.validate = dml30_ModeSupportAndSystemConfigurationFull,
>   	.recalculate = dml30_recalculate,
>   	.rq_dlg_get_dlg_reg = dml30_rq_dlg_get_dlg_reg,
>   	.rq_dlg_get_rq_reg = dml30_rq_dlg_get_rq_reg
>   };
>   
> -const struct dml_funcs dml31_funcs = {
> +static const struct dml_funcs dml31_funcs = {
>   	.validate = dml31_ModeSupportAndSystemConfigurationFull,
>   	.recalculate = dml31_recalculate,
>   	.rq_dlg_get_dlg_reg = dml31_rq_dlg_get_dlg_reg,
>   	.rq_dlg_get_rq_reg = dml31_rq_dlg_get_rq_reg
>   };
>   
> -const struct dml_funcs dml314_funcs = {
> +static const struct dml_funcs dml314_funcs = {
>   	.validate = dml314_ModeSupportAndSystemConfigurationFull,
>   	.recalculate = dml314_recalculate,
>   	.rq_dlg_get_dlg_reg = dml314_rq_dlg_get_dlg_reg,
>   	.rq_dlg_get_rq_reg = dml314_rq_dlg_get_rq_reg
>   };
>   
> -const struct dml_funcs dml32_funcs = {
> +static const struct dml_funcs dml32_funcs = {
>   	.validate = dml32_ModeSupportAndSystemConfigurationFull,
> -    .recalculate = dml32_recalculate,
> +	.recalculate = dml32_recalculate,
>   	.rq_dlg_get_dlg_reg_v2 = dml32_rq_dlg_get_dlg_reg,
>   	.rq_dlg_get_rq_reg_v2 = dml32_rq_dlg_get_rq_reg
>   };
-- 
Hamza

