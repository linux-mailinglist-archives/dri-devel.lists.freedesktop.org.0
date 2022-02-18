Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84014BBD82
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 17:30:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5817310F2B2;
	Fri, 18 Feb 2022 16:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2067.outbound.protection.outlook.com [40.107.212.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCED410F2B1;
 Fri, 18 Feb 2022 16:30:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/rjrNt13XrrjcckYeoKwRu+ZpE+GlSWW7BEC5O8V5Z9qXil4vmNPeTSsUP9bHVZNqUvlqfIlzcRmfIRwWDQtxOOJDv9UxslRebZ3xHPcd0YWWk5//7DnA6mC1b6w8YorCZJUxv/Tvuc8ttonk/mztsMwV/YVsVFJV+bcznKSbH3FoyMWg2mwwWHYjXe0i2zmSATaukJicfWIqytCSIbsGFEKTf2S6lXQI+yXtYxZ9q7gXcHz95WEcGQFu2RupQqzvEsGzGK+NoXHg84ev6TEi/GMCwwi8/naGl+UlnSs/1708ItV9OK945hAIFWX+xIHVt29J881ww4zKLlp0GbWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DY0I+lmW2XlO4hfA+YX2fNkty2SAvtOCH8loMmZNtE=;
 b=PVrv8VUdGQLvg5pS2vech1GPse2ZyosG7X1RJCo4qWMD70fk/JvBhju3c6FqcG0UPSzfeKDXglJt/z3YKshk8SoNpmoVW5tcdF9QhgJNJnMLeG4o/kZREVkAuN7SZ4mEhSOXSdBmWyYxDUMTFQdLublVLIwDnm+qv5C6uPIuOeZ0g5l+YxDubkghcCnw0Vm21FbNT/VyGslZiw0s6bQaTJ49dBg0XAZpea0bzf737XZxkXEjkIzSy6wFY5uTT7mG25/W2YS5xmGpKFHPRfVvuuFiGvntS3nwltDjx68Vy1H4VGGpZHZnopdegmOVAi+oTqojHEluA+7yYMWJUbyTsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DY0I+lmW2XlO4hfA+YX2fNkty2SAvtOCH8loMmZNtE=;
 b=EXNYmb1xOAdPnfIigxXwb8PR8w/MqDnrBzMNV6yl3onMyNNrJt1JZrTR1pYy5xnhLNlSheLV6/nnct0+mH3mbI+kuCScv1Qyg6x3t6Lt9smJudemVU/xT6MVABuofbJdx6XtmNLLyTPj6exfKFbDVSPAwcujZtW6NvxKUYabSc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BY5PR12MB4888.namprd12.prod.outlook.com (2603:10b6:a03:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 18 Feb
 2022 16:30:33 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3%4]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 16:30:33 +0000
Message-ID: <bf64d0c8-4294-eb0a-1edf-b86f07e206fb@amd.com>
Date: Fri, 18 Feb 2022 11:30:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 03/22] drm/amdgpu: Use drm_mode_init() for on-stack modes
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-4-ville.syrjala@linux.intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220218100403.7028-4-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0268.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::8) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9f80fc6-c5ad-4a17-c91b-08d9f2fbfc02
X-MS-TrafficTypeDiagnostic: BY5PR12MB4888:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4888C39017F6B13B2805BF0C8C379@BY5PR12MB4888.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bPst9pbehqmaSTg3vteE/8mszU7QvIgBCqHkHlRVaeJXygsuUEMid/xXuaKYeBt3IlpalRO621mrx/Vvx+71x9Jz+qDurVXPlrQAHPIdSfqAy6juhInXDpzxuuQMzk9Q1pGCOICk41TofuXpkgySqsF49I1KPz/zG292ZkOD6m7TQVbZv1/uWCC3rbckWvALeqHIKr5tR/bWkLncDXQLIYdOggjBBnbSmTHGOTrr1icOVAZfb7XT7M/NWAwc4O4Tc1p/kfAlrc9GOSY1NhYJHqDQFU52Fjg+QSDu/Oc/zaaQdaNOf3QJLAQwWhWuJo/eah6F3GBWZSEVfcySUyP7DawfcUpdDuod/OXahtNde6kelfDSYSCyauvvHCSd5wmnqYGS8d8b4wAqUYpH8wVLnFcQXPXT6c4hcqfW6SyDIy4jD9Z+VYRDfWVteyaiQmITedPI+xJFdyfAPNRTy5DB4acJJ4UjJIIoZt5gE/B9TqOtfKNmHVQYNznSGvZ8NLCcg5vAcW5yEavgiQAsqcmKdRX+E39Htxh7X6EIdQNoFxlsMDLjoz6R/Tz1Hhj5KdEjicymJdMkQ8cHqC4eSNuF/RiSlyC7/ZLC7lxnLz1jctPABB5gEtc4TpEZCimzG+SINjJmsxpjkdQRMvGeeRp6/fFPOJKROA4HKmrfAmA5uJ99Z2NgcvVVZn2hfwIAPhPXq/HlIErPtuAxAV1nxBxjxq9uNUkggwsAP7SyIYv8ho+LUoaW2heaahIPTVMuZ9ptMnF8Fjo08wYemza0PN0LPmufeM7Y0wQgazg8sNWK4kQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(31686004)(2906002)(36756003)(26005)(186003)(66574015)(44832011)(508600001)(6486002)(31696002)(86362001)(6512007)(2616005)(8936002)(5660300002)(66946007)(66556008)(66476007)(38100700002)(53546011)(6666004)(6506007)(8676002)(4326008)(316002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFU2VnJUUHdLeFdDUGV3TGRvbWlRUmVwbEdweUVSdjlhL0FhU0c1ZlpnVnRM?=
 =?utf-8?B?ZTRjTXNKWUdibkp0cXBEWmU5clp3MklGK1BqZW1haUN2aFNqV3pRWFQxVDRJ?=
 =?utf-8?B?bEdhOGRjK0VucXhtaVVPWkNLRWV4RDJka25hZ2FOUnlNSENwZVQwVnB2WFYr?=
 =?utf-8?B?YTM0T09BSlNkRy85Y0N4bWdlMm42enhEL3ZzaXlJNHU0Y2FKdE1zRUFtMmZW?=
 =?utf-8?B?Ykd3eGxCNHpZVXdTZ3docXRJY2NVUWpvaFRNWDMwUE9JMnpXUnI2MDlSOU05?=
 =?utf-8?B?WVhWdkkyekpFZWxDVEY4WlN1RWJ6eHlQODFDWnhCdzhlUUlFcXZtMERhNXdQ?=
 =?utf-8?B?LzQxUlkzMnkyZnpNdk5rVGhOU3p6a3EwV1VRRXJjaXJXUHBiOU1QTFptY3lq?=
 =?utf-8?B?QlpGOGszSWJjdHVEbC9IUys0TWhYMVoyL0hLdWQ2cDl2enRVVTRyTWlKRDBS?=
 =?utf-8?B?L3hmaG1VTE5QWEZhci9ZdDNBWDZLWFhyVm8zZjByMEZtRUZkQmg2WUc5V1B1?=
 =?utf-8?B?RUJYWDJiYkJGZWJZVDVwbGlCQUpNenRpd3hKRHRFTzdvV2UxQ2RqN2NkRi9K?=
 =?utf-8?B?SE5acmFZMmdjMFY3Q21Yd2JKOFZ4ZnhwV0loSXA3SXFybm53cFBOcXVXYlU0?=
 =?utf-8?B?RkJPVFl0QTVUZTdaRlpEZXFyb21TazJwNktGQWZyMFdEd2hiOTFiRHFFWTV2?=
 =?utf-8?B?bU1YdnQ3RmcvMDFPTkhiZFJ3VElKQ2VYWkMyRlFjdUlrZjNwU09WbnNLS0Np?=
 =?utf-8?B?V1p4amdJN0lEVDFkMFdxSDAydXAzQ2pxZlltUS81YXRsU2lJWFdka0x5WHZU?=
 =?utf-8?B?TjJvN0hqTlo5ZEFpVFN3NDRpckY0VXNOanpGUjBYRkR4Y0QxSHFIMXUyRmti?=
 =?utf-8?B?dEVRQ2hnRWpFeGRQaTk1dy9WTS83Nk5zdUdvZGRRdlVXcWpUSTlIc0FwaTBM?=
 =?utf-8?B?M2Rua3M5TFJXVUpzeEd6Ry83dlFvdXF4enBQSDVmcDdFcFZEM1BhN0JIQjF0?=
 =?utf-8?B?ejRLaWRKWVozcmpDYVBYaEVCNjlFWUU5OUIzR3dzcHNQVVlUMkJTZHZGcUh0?=
 =?utf-8?B?SFdxV01tN2FzZDM2b05LbndCK204ZWFtdDhPc3krMUtoQnNOM0lpQWZyQlc2?=
 =?utf-8?B?cTRxbmtvVjFxQi9XZDBqdEVyYVNGNW9SNHU0UW9xc1kvcEVGVHp4R1J0clZB?=
 =?utf-8?B?M0UrOXhkVUt1Nkd4UXR0YmdBMVVVNG5RS2RoRlp4ZXNNK2hEWGFNR0R4SXZL?=
 =?utf-8?B?VlpPdTNRcU4xVi8vaXdzdzBaOVZZQzZZOVJNV2l5Si9oUktpMkdPUjkreWpZ?=
 =?utf-8?B?NlZ6N2FhWEtFdGYrY0JCWDlHTllVdm5vYU9DYU5hZXFNdVR1Q04wSjVibWJJ?=
 =?utf-8?B?SFVBKzliZWRZNm5hMjRZWGxWWGo5UlJmb0FMTUR6amx2OU1NZ3NVbEZueHh2?=
 =?utf-8?B?SThpQ2VxMjdjZTFpejN2RmdoeDZubFpyenRWQWZXaFYrVnN4bTdlOWloWDNW?=
 =?utf-8?B?eTZFTkVTcmNDNDA3K0xHSHBIMzdoZzhPRVpTMVFiSDM4cStqMUxuNkdtbWpo?=
 =?utf-8?B?cGxuMmlSeVFFbHNxMmF4SUg0OTNDVlVGeXJ1bVNwYnFsWjJpMmxkcElXYnFX?=
 =?utf-8?B?ZWpiVEVlSkhEdHNVblFOaVRyWUw3RktjOE53clNETkhqUys4Qityc1JJL0ZO?=
 =?utf-8?B?NFVPL1FLNXlFVk95VTFacmVUcDZLdHcxbUwzdWlUSDMyeFIxa3hDelpDTTJ1?=
 =?utf-8?B?ejcwc01kK3dXU1puZ0dVcFd1YjdCdERRK3M0V0ppcGJDbUlrcERvaFBZaVQ5?=
 =?utf-8?B?SHV4eXYzSnA2eUVFT29OMmE0MS9PamhjZEk0ZVNad1U3NldGOUV6bGxSQjhq?=
 =?utf-8?B?THE3ZkxJWmVPYmNpaVFhQkNPdmVPWlBlN2VmdmdoOXdUb0dRZ3VYNVV6Yysx?=
 =?utf-8?B?aWVvb2xydW12NHd0ZXBrYjVPNVJQQ2dKa2hZK2lsNFptbzQzUXFQUWsrdWdU?=
 =?utf-8?B?cW1hUDg4M21wd216L0NKZmJCRDd0U1E5eFc0SkJWUndYQWI3VGFVR3JLNFBD?=
 =?utf-8?B?S0xydituc25OeTNFR3lieDl0ZWNSaXhzUGIxclB4VmJGVUlsVU9Qb2VyTnU1?=
 =?utf-8?B?UGtwUXh3L0pYdHdrQ3gxVzVrUWNIZm9sZWFhbGkwSDcrdkZFdFY0Q0hJVWhj?=
 =?utf-8?Q?w8lHcrggHtQDupg8uSEUkE0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f80fc6-c5ad-4a17-c91b-08d9f2fbfc02
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 16:30:33.0284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmD7sCPLt0hz2BWRf8k15cV+/WQjny9O+hsfDjfjz8cB+nRQ0dIF1RuHfrrzmVQbLMKaDk9r5lr2LoI7/VtbCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4888
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-02-18 05:03, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Initialize on-stack modes with drm_mode_init() to guarantee
> no stack garbage in the list head, or that we aren't copying
> over another mode's list head.
> 
> Based on the following cocci script, with manual fixups:
> @decl@
> identifier M;
> expression E;
> @@
> - struct drm_display_mode M = E;
> + struct drm_display_mode M;
> 
> @@
> identifier decl.M;
> expression decl.E;
> statement S, S1;
> @@
> struct drm_display_mode M;
> ... when != S
> + drm_mode_init(&M, &E);
> +
> S1
> 
> @@
> expression decl.E;
> @@
> - &*E
> + E
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 65aab0d086b6..bd23c9e481eb 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6361,7 +6361,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
>  	const struct drm_connector_state *con_state =
>  		dm_state ? &dm_state->base : NULL;
>  	struct dc_stream_state *stream = NULL;
> -	struct drm_display_mode mode = *drm_mode;
> +	struct drm_display_mode mode;
>  	struct drm_display_mode saved_mode;
>  	struct drm_display_mode *freesync_mode = NULL;
>  	bool native_mode_found = false;
> @@ -6374,6 +6374,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
>  #endif
>  	struct dc_sink *sink = NULL;
>  
> +	drm_mode_init(&mode, drm_mode);
>  	memset(&saved_mode, 0, sizeof(saved_mode));
>  
>  	if (aconnector == NULL) {

