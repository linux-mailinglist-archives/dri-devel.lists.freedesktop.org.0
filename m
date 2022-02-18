Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 334CE4BBD75
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 17:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A079810F27E;
	Fri, 18 Feb 2022 16:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C1D10F27D;
 Fri, 18 Feb 2022 16:28:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvbyBUsTS8ETul7qBAO2z3KdfnUbLDLoF/27zEWqe4iWgffYBGbDhf9MqcYmOPZtCmrYWmMLIsKUzV22NKF1FHbqZbgi3FN5EVK52uzGAwuU0ENgeD/ZeMY0CH1XSrQP13C2ipFqSnebNeO1BykODEe6BHLMfk8asHww3Sdxv3CLrTSQUxLzhmZ7S65wTlVb0phAo3yzhntWAnyAvLBuBMYOUb92gsSQJy+TP21RhepJ2idmUUxzmGXyeKmGQ5vvv+UX7G1mfUtCNe26FLadfiN9eaMCWm4SwXvmyLQvP03c4sQIRVGRtsa2a/OPapuLj7Yqy5CWYbyT2rpWd93XNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rD0kDsK26XDBTU/NVtpWhKxSst/q/bGZGUXTjYzOJ70=;
 b=F9GqMFm+nBP0mVF5op3/RbOJNgfFKDrwhup7KBWXbTLAlil9MFsaHwToKIAdRDnP1RiKkYaECvAYiifLcb3SBOYY9OKp+DiVedbOm8QS0gsTy4sPgzxx3Ekf56jKo88bZC8dL484n/hbPjOBi5TLs2/P5FZsG/BM+PiwUUsaUqQHWMmISYp/P9OL5PS4R9Cl3nu7Nuw6d9gOEEV2hJ8PXm3nx1wfvXVDrxqBNh7YeqOrQsypqTfWjeywhMTkKvudKwIvOxgBkl438CI8FTIVLTkd1/AHul8gzXzY1U73NnQq+gXkngwFr6S66/UAbWdCBw9J/Nxk7zn8heqDFuraUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rD0kDsK26XDBTU/NVtpWhKxSst/q/bGZGUXTjYzOJ70=;
 b=duM2UvlNU69NUyQR+CdtPCnmIZtQ+I4lGR/4hMidI1McHI72S6OoPEqChVXauXdEWem9AU5lWAODlF8u6s2RKpjADe/n/XGc7ubwRCmrO41vEtaeSRhiIOSgzhApjKbcJtEdCT8Ub99bvMucZ4Z7VrDBsTdT+IecNB0R2f+B0Rs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BYAPR12MB3301.namprd12.prod.outlook.com (2603:10b6:a03:130::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Fri, 18 Feb
 2022 16:28:26 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3%4]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 16:28:25 +0000
Message-ID: <2d51f77d-4067-ca23-3005-87cd72e1a397@amd.com>
Date: Fri, 18 Feb 2022 11:28:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 02/22] drm/amdgpu: Remove pointless on stack mode copies
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-3-ville.syrjala@linux.intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220218100403.7028-3-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 322dcb08-6bad-43fd-4c45-08d9f2fbb01d
X-MS-TrafficTypeDiagnostic: BYAPR12MB3301:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB33015A249D734554BB0D404E8C379@BYAPR12MB3301.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P/WE/aC4xt1Do7WXg9HGDmTaFODUUnypxOBplTnwEggg8MnitBeCkbYKV9ZQNA28dNvlSH1wrgUPMm4ia5m0J1s+1gSoSsCeWYY+cCYaXgwZ/FMXeq3SGFgz3OTNluAqgfUsMO9Kl4+rwKX2QGRVZ/oK8M6PbFIPO8ZdRdeGC3QpQGlmLOmNon9FqIjvkNpeRNvtHT3H1ywfE64MBoG5rjsOb5T93eZwm72PsSWbXwwIrX9r96M2h45t00ECDAkm0JMxLDrRfMqcTbSD5HgXqQ5OF0ybD7Q0tCnsanWhMQEW1z4+q0GtC8cUiruV+dEvOGGc/T4aWvUDnE4JLFfJQvrjGtPLru1/iSmijdoOlGqh/xI2HuR9RnqPZW26pqvaIEaFbBEJw/3jjtgkSUI4cJqeGYu5lf4KwsHYoopjU3hoRpwyKehmmt+JMNhAimIGzNipRXzyAIXEl4m6Nobsymt3pVV+ElyUN0DSYHYwIaJNuR6SIlOgoLmGOZk3G9r9GZbBwi/XQjDyIMuBL/9+u547ImIbaSPeLVqtJDhUT3juqUDXhf5BLGwJGJlDoi+81WmBxYAHLk5O3fVFowrDA1vLL6T5rN4kMXm7wFs71sKvMEzmr3DCjGvXwWGbFQX9WLNF7AdYaOAvWHTr4Hi1KhC0QqZenBtfSASFTzJ1BSDjIW8mZ5gzy0Z+U5n1UlgbzQt30M3d1HtTSmzigjU0a0GPGxsMnUIlKrU+0LoJrdvXPqSa8lY9pi3Z7jfNKf6Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(6486002)(83380400001)(86362001)(31696002)(6666004)(6506007)(2616005)(53546011)(186003)(6512007)(38100700002)(36756003)(26005)(5660300002)(66946007)(2906002)(8936002)(66476007)(66556008)(31686004)(8676002)(4326008)(44832011)(54906003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFYzd01YaENvV1pqRzdQY1R2U3RpMXdUL2hNWFZIM1pGVzdvTXVqY2pnaVJG?=
 =?utf-8?B?V2VIbUF1K0pxeWowcDhwZkw1MmwxeW8zaFdBb1p6aFRIOHFVWk9MWnB5dnVK?=
 =?utf-8?B?eERqUnNhM1VHU2lmRzJROVJRQ3B5dm15eksrY0pvME52c0MwaVdQcitZL3FO?=
 =?utf-8?B?bEFkTWlPVmNNUFZDdnhhdmpIdGcrdDJqYXBucU4vdHhzRXpKdnMvbnpNVWIr?=
 =?utf-8?B?aVIydWFoR2JLTVExMVFuM2xRM1RpQ2pYMzVvR3Faeno5MUJjN3g0aVBPUlNJ?=
 =?utf-8?B?MXE0OUQxR2paakZVYnlmZlNMSU4zSWp5Snd4dG1HQmNoYmU4Z3gzZzZ2QWU4?=
 =?utf-8?B?VkhCLzBpWnFxdHhCTUtxVVlnUlFvRlZDMjFHMEtOT3grM2tsZzcybVhhWkhY?=
 =?utf-8?B?dGJoZkdQTFRtOHIvek1qNnFNVkZJTWxieWVOVDNuWUpaaDNOUXVYbTVzTFFV?=
 =?utf-8?B?RzM1dmtlUm1lT1RrY01ONzcyUDRsMTcwYnNWeVY0bHFDTDlUeWhLV3JrSUdz?=
 =?utf-8?B?VFJBYTVmbGNxZ0NPaE1RYkplQmhYZG11L1MzTk9LWnlQUGRZRnRJNlUvTXRy?=
 =?utf-8?B?S0x1UHBBTEI1RnRMZ3k1cnZ2UC9OVjlwRGRxUDRUZkV3OWNFZU02eU0ramZz?=
 =?utf-8?B?SFdWbnNDM2ljRE5sNUNaR0FmSjdBRkZmbGxTaDZUSnpWcVphQklHSXd6cldn?=
 =?utf-8?B?SGdSN045V01YTUIwYUxMci8zUlU2YjhXMW9WcEVHV3l2Nkk0cmE2bzNrTXlt?=
 =?utf-8?B?WlBXaEluSU8yN1o3Ujc2dkZReE56U1JPWEg2N1hJdUhmdTEyUVBLem1oZDdi?=
 =?utf-8?B?VVNzbXo1SFZqdVZJdTlXVVhuYy9tTnZYcUU0T2Y4ZTRnR09CdStlam5XcWlZ?=
 =?utf-8?B?NFhwUTgwUXZxV1VTNUJBMHhBQnJBbTBOSDlJdWNJMW5yVE55elMweDhBWXFJ?=
 =?utf-8?B?ZlVySXFmTmNUWjU1SjVZeDVGM3Y4K0VHS0RLd0dScWxXRmhZZytkUkxOZzNC?=
 =?utf-8?B?N053eVNVUEFHVmJYdUEyalVnaC9UN28zUlB6bEM3M2xCeVlJT0J6TEVpV1V6?=
 =?utf-8?B?VEs4c1FTaVdmU2ZnM09XY1gyVW02dGxrVUgyWGNxaXBoODByOXg2UzJDd1o3?=
 =?utf-8?B?ZWpIOUdUNXc2ZXBKL3lCSDAxSGxLUHdxSk9ERlp2NTY2R3E3c005aXZoTmds?=
 =?utf-8?B?WVdRWGhRQ1QxbFdmdlVIWHNPSGpJNC9RbzhoM1hlQi9vYUg1R0pGdExrbzdM?=
 =?utf-8?B?ZENDZlM1NjlWZE5FMkFWUlF6STFnVnF1cVN5Ti9BWHl5MlZIWDZpNSthdzlO?=
 =?utf-8?B?ZDIxcG1LV1FSVmt5Zm5QZVh3RkYxZ1h5UFo4WFd6QlAwUmpYK0IxZWdpcGRP?=
 =?utf-8?B?Skd1M1cyenlIZzBFRHFMWmlMVEIzeTd5NzVoaDRQWm1tVDNheTJMc1I2MEt6?=
 =?utf-8?B?YWNlZnVvT1FqRGxVQkdWTloyaC9zbDQyaWFYZVlseW9CUVVVVWt1Vm1jSlVz?=
 =?utf-8?B?MkFJM0xsYXI5TU82dHZqWXhnd05XaGdCbUFBM3F6YVlZbUowcHRjYTZ2NEFn?=
 =?utf-8?B?ZEFjZUFYclZEK1NvUGtBeGtXM3F0RXpLV3VuT3RMbkNtcjFqUmlxMWJYei9B?=
 =?utf-8?B?cUhicmxZWFI0cTJoMmRxT0VUY1Rna1ZvUklDNzl4c2FqZEU3N0VNNXRBR1dY?=
 =?utf-8?B?SldyQjBGd21lM0QvQzkrM1Y3azcwaUJCR3VGNFBBU1hoU3p1K3NLTk52NGlP?=
 =?utf-8?B?SlJxMFhuOTRseDlpZVl1d2NBZ3lRKyttaXkzNzAyblh1UWNEUldXV29XRzVO?=
 =?utf-8?B?Tzh2RnFhelVVNTV1MHN6M2svN1hURWZjazRrc012UUI3NzcwdVR2SFhWZTFq?=
 =?utf-8?B?cHliRFlXK0NxMVY5RXpERXFyZkpKSXByNCtDcDZhYWN0UUFSZFRKSEplT3FM?=
 =?utf-8?B?MDM2RnVPNUZoOUk0eHl6cW8zcFJFczJHSEZyM0g1TTJMSGdYU296MkFjbWlV?=
 =?utf-8?B?RzI4RnZqK1RMSVBqd2pycmN3MWorMFBMVGdVR1lrZ1duSmlsL0ZyZW4yTHAv?=
 =?utf-8?B?UEdQUDVVb2gxbUtEOFFGNlQvdHlWVlpwTGVrM2Y3MWNLTnczYWtGUnUzc0ov?=
 =?utf-8?B?RGgrNDdBV1dLaGhVcXp6RGZiUUxhRTFVS2JGNmdVT0s3enVQYVMySGI2RVpq?=
 =?utf-8?Q?6u4f6K7ldHMxAHFQMz8wxRc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 322dcb08-6bad-43fd-4c45-08d9f2fbb01d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 16:28:25.8183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgm/InjH5fxq8vwcqB8qdKpt3TFg5wHfqkMXZmGPGGe8T/fhIWSLJEZcvlojLWaoYpyLndump02g0HZ7MOwSRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3301
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
Cc: Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-02-18 05:03, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> These on stack copies of the modes appear to be pointless.
> Just look at the originals directly.
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: Nikola Cornij <nikola.cornij@amd.com>
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 32 +++++++++----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 21dba337dab0..65aab0d086b6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10139,27 +10139,27 @@ static bool
>  is_timing_unchanged_for_freesync(struct drm_crtc_state *old_crtc_state,
>  				 struct drm_crtc_state *new_crtc_state)
>  {
> -	struct drm_display_mode old_mode, new_mode;
> +	const struct drm_display_mode *old_mode, *new_mode;
>  
>  	if (!old_crtc_state || !new_crtc_state)
>  		return false;
>  
> -	old_mode = old_crtc_state->mode;
> -	new_mode = new_crtc_state->mode;
> +	old_mode = &old_crtc_state->mode;
> +	new_mode = &new_crtc_state->mode;
>  
> -	if (old_mode.clock       == new_mode.clock &&
> -	    old_mode.hdisplay    == new_mode.hdisplay &&
> -	    old_mode.vdisplay    == new_mode.vdisplay &&
> -	    old_mode.htotal      == new_mode.htotal &&
> -	    old_mode.vtotal      != new_mode.vtotal &&
> -	    old_mode.hsync_start == new_mode.hsync_start &&
> -	    old_mode.vsync_start != new_mode.vsync_start &&
> -	    old_mode.hsync_end   == new_mode.hsync_end &&
> -	    old_mode.vsync_end   != new_mode.vsync_end &&
> -	    old_mode.hskew       == new_mode.hskew &&
> -	    old_mode.vscan       == new_mode.vscan &&
> -	    (old_mode.vsync_end - old_mode.vsync_start) ==
> -	    (new_mode.vsync_end - new_mode.vsync_start))
> +	if (old_mode->clock       == new_mode->clock &&
> +	    old_mode->hdisplay    == new_mode->hdisplay &&
> +	    old_mode->vdisplay    == new_mode->vdisplay &&
> +	    old_mode->htotal      == new_mode->htotal &&
> +	    old_mode->vtotal      != new_mode->vtotal &&
> +	    old_mode->hsync_start == new_mode->hsync_start &&
> +	    old_mode->vsync_start != new_mode->vsync_start &&
> +	    old_mode->hsync_end   == new_mode->hsync_end &&
> +	    old_mode->vsync_end   != new_mode->vsync_end &&
> +	    old_mode->hskew       == new_mode->hskew &&
> +	    old_mode->vscan       == new_mode->vscan &&
> +	    (old_mode->vsync_end - old_mode->vsync_start) ==
> +	    (new_mode->vsync_end - new_mode->vsync_start))
>  		return true;
>  
>  	return false;

