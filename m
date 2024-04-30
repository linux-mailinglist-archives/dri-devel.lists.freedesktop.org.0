Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635A58B7F63
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 20:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CAC112DE4;
	Tue, 30 Apr 2024 18:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HmGtBKX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9EC112DE4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 18:03:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkWoSznXRTTkQFv7tRH5B5iFmx/irROJxLfMgd2QTCJ4O8dveKsMUnS8YtYBU4RHLGTrE/hz+J+BIWhta+qy0DNA2ccYbxt29CxY+WKIIXxtt7y47Ezwl1f5irIjylEd/LEWv0qNl959/rkv+5rowK8K9F4bDBnBYbTZkPCLAWw6vmDLEERU8F4+nrGwt8dLJnzhpToRsFmB3jVSfGV44OaH4D1pZbJ8K8sKvZqCm+MPprU2OEbs0wzXSwnTE4u098PSbGWUhSqCtVL4UPhZ0/nvVJnVOcp1KLpE5R/Wr2JDl6XgNayzaERaW288Byz3hNcLyuYAALASpS+NpGjiaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIxtmoI+Ih5KVsOVt2lZSPYF4RkB4n4raf0+lPERi28=;
 b=eRxJY+Eza8FjE9B++sfdDwFm98qdqPhq/ZoGD7nGkVgTIZcEXDqMcF6A2cLWmc6ZD6riQ4dv1tVL2w5g8gdWSXNLPF6SA9aWtc+UEDPNvd0MpxIHLExp/moMIVEs6MsUK0o7O6p5emKGWrHHdqUq4WP1lg9YD2wtZXt4p5FliqmrradcUOBajv0+jaQ/ZUJ9b30IlQ1ejHTwazqELtKI+96TpUmXPOAy6byDmQWE9gJNB5fImi2mkGl8V/sHGZ08F//9HoJS98laBtbg8g/+qvAwdjUEPaCO4LfrJ7zNPYKJ2o3zKelhF+Ugfsbwurm5YlxXMPPmaIVD84I51gejeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIxtmoI+Ih5KVsOVt2lZSPYF4RkB4n4raf0+lPERi28=;
 b=HmGtBKX5RTPQji+KkHQMHioG9MRC8idWSrqj2crjzUMvELJuBHqD48DIiDhJ0vmpXo59DpcatMuhKLAtdlAXexrqn1S+i0TwwLdxNTk48/UqL3rFKvbECwtLv+JuwWQf1/clxbA6gEr7qqLA2Spyv1iMWk6SEl9m9HU5gQpwFV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB7113.namprd12.prod.outlook.com (2603:10b6:510:1ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Tue, 30 Apr
 2024 18:03:43 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.7519.035; Tue, 30 Apr 2024
 18:03:43 +0000
Message-ID: <9d4578f0-fedc-4c6b-877e-1d6da55a1322@amd.com>
Date: Tue, 30 Apr 2024 14:03:40 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/uapi: Move drm_color_ctm_3x4 out from drm_mode.h
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Joshua Ashton <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
References: <20240422085857.17651-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240422085857.17651-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::27) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f7ae48-9d15-4ee4-2ebe-08dc693fdf80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUYwQkZYM1Q0RVNweUt6WFdjR2o2T1MxNGQ2RWcwQVA0WUNjNjFGdHdmb0hX?=
 =?utf-8?B?Qm1RdTluQ3BiZjVYT0NLM1htOTZHeXNxSVVuWUxVeVNvbExhS3BtT05ZUzZE?=
 =?utf-8?B?R3hLQk9MTVB5eHJDY1RYN256SEFOSVZRUkJHMllxQUFwU29Zak02UDN0Ylh2?=
 =?utf-8?B?OThKSzlwbmN2UHVlUkdIOXBOK0U0Unh1RkRiNUlZcERtenBHWnR3emp4aVpX?=
 =?utf-8?B?dnFYaGpZazhncjZmNHlSMWdTdnk5YUxuaW04SGxhbS8vQ2cyQk9iU2RHKzI4?=
 =?utf-8?B?V05ucWx1ZjZDSktJQ3R5c05ySStVU3c4TWhIRVpicjRkcW1LSWR4Wkx5MnZx?=
 =?utf-8?B?c1J6V2hEVXZmZFZSekFvRi9keG80SWQyaFFRNWpua21Ra0NwSlFkc3BDT1ZG?=
 =?utf-8?B?bnF6dG1TY3VmRjU2dVRtb3lSeXVFT21ORDdUdXBuM0pwYjRNTUFzY295enJ3?=
 =?utf-8?B?ZE5tNkhiWG9FNnoyME9wVndFQmhtSWJORmo0M0dxNnp1MHdobEZZRjJGV0Mr?=
 =?utf-8?B?RXBMQkY5WGNnZkJJNitNWFlick5xdUt3Wjlka2NwZStoOTVhOUhqQURQWHN6?=
 =?utf-8?B?bEJLUmdKbFdqZk4xQjg4OVpNTG83NGF3SyswVUtNbVVidTYvWk8vM0FsWk8x?=
 =?utf-8?B?SXFTTm1LN1ZrQ3hUSzY1bEUwalZPdnA2UVhVanVMWmhocVhTM2s2ei8wcEZr?=
 =?utf-8?B?RWdKSzVoY2x1bU9YOFpDYi9SbmRCVy9POGszK2pJejZmTEVSdGVZYWNEZnhk?=
 =?utf-8?B?VmxicTBGUHpYWGF0NXJtZmJhQUFkcXpJRm4yelhFUjJDcE9qTTZBR0hVSXI1?=
 =?utf-8?B?dlM5UmYwanhRTUtJUXRCUFlLdkxKZkR4UlAwdlZRZzM2MVZ4UWcrQ2h6TUR4?=
 =?utf-8?B?bW1Zd01PdTJEbDBPbzdUK2ExR2lmUjdsQ0FTWmlPajg2MVFrbmJjWGdzNjM4?=
 =?utf-8?B?OTJYWXBDc0JlY1h6a0FYSmp2WHFhbnNrV0d2NzBYdExPakRXQ0NpOXJ0UXIy?=
 =?utf-8?B?MmxOM2tBbVRQNmJ2SHovMFdHOTRrejRTY3d5Vk5ZNEdKK2o3RVdoVEhZMUJy?=
 =?utf-8?B?Qk9hR2hmdkpIbE5TVEFlVUo4WTJHVmROL2p6VVJRdVlONUlHMVVldjZkVmFw?=
 =?utf-8?B?dEZSelZmS2FJb2JIT3dhUU42OEU3SG9aclhRbFN4dHRtZFl5alZLVFRhUit2?=
 =?utf-8?B?U2w5NnBLMUhLdEpUNWxGQXVnUlRPNE95bkNSL0E5WkJ0NWcxaWNEZlAxSnEx?=
 =?utf-8?B?am50VVdmeVI2MTZmZXprbDJQY3Q1czdJZnNJY2h2c2lLVUV0T3JaeGphbHNq?=
 =?utf-8?B?Z0E0a3cyeEdlNkI1R1JmTWd2UjdvZVV5R0FyWVdSMmVSNW9zbk91RXM1MlY5?=
 =?utf-8?B?aHNSTTFLRjl6RTJVbjUrc2VZU1hhZjB0VlJIeCthRjVWelRscDBNbUdEU1p3?=
 =?utf-8?B?MVBYcVhUYVowMldZcWNHZ21WTWVYcUl4c3AxeFYybDQzQ0NpOWlqRXQvMmg4?=
 =?utf-8?B?VjNsb3hXbDREeWduK2JCMUgrMUd1ZTM2WjR4YTJ5bEZOQWtLVTN5NzFTaEhB?=
 =?utf-8?B?YmNOb253MlorVXhnUzZ4SCswekUwN2JKbHdISDdpT0pmb0JEY0k1L0M1Vmd6?=
 =?utf-8?B?L0JIQjl4dDFpSnRGbHVMR1pZLy8xU2NrbzFmMXF6bTgvRVhqcVl5eStGVzhE?=
 =?utf-8?B?YUZ3eWVnQWU5WE1aNlJ5VkI3djdUbzNuMzcwdWZSQTJXNE9XeWtOV0tnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEtaUG1RQTVTaklPcTRuTEJUcXArR2RwOWtXanNPbmg1SmE3dCtqRVorTzVh?=
 =?utf-8?B?dTFSWGpadTJ4TlJhMVNyUlFmTldKMWtqK1dna1pOQ0NXTG9sOHBmZ2JJUURG?=
 =?utf-8?B?U1BYSXRTM0dJaGRRc2FpMmxpVVVsanVneFBDQkRtTjFhWTRjM1dlSVB1OE5q?=
 =?utf-8?B?ckRCcHoxcEhwcmtrdWNPNjZ4RExOYVhPdDZGeUlLVGhEbE9Ya1hJTTB0aTdx?=
 =?utf-8?B?bGN3Qm1pM0VjbmszMDI3TjJLeGNWVk44dDFRRUViSllVMTQvem1LRGhMUGxH?=
 =?utf-8?B?dVM5cXlpOGFOekhxZjR6cXozWWprdkg3UGlrbGZVKzZ2SE9ZaCs5RS9NS2ty?=
 =?utf-8?B?SDNHQndxQ0hXOE5qYWo3a0J1TkpBeFk0QlRXNkw0RTI4WE83dkQ2MXFjODBH?=
 =?utf-8?B?NjNqZWdtVkpRQ2ZNaVNBOExmYUNBYUM0eWdSSFMycGJWWDVGWW9Kczh6NitL?=
 =?utf-8?B?MGg5RTVHUUtRMnJuMDJLM25OZ25pMHNYdk5TOTE0RG80Y3BIQXA5MzNWUTly?=
 =?utf-8?B?aXhvNENhMmF1aGxVZE1JaXFLY0VMRmxGcVZSaENnc1dMaUVPODZpQ3h0NGRW?=
 =?utf-8?B?V0VobUlLUURTcC8zTytTVmZyZkpqTktOSzZVUERacGF5OTlwQjEvTWJYZklP?=
 =?utf-8?B?a0pVaFVzdEdLdXJXcE9Ldy9MQlhBKzN3S0ZpOXFUYklwRUd4S2cyY2wyNDZr?=
 =?utf-8?B?b2I2LzdZM2tvTHFaZEo0M2lIR0F6cVU4bjZFZnBRT0tWcnp4dG5leUNkUVU3?=
 =?utf-8?B?OFVHYWpJTTljUlkvWlIvNHJnaFF4UWI5MVZ2RVhVTVhERk9DTFA5MGUxdzAx?=
 =?utf-8?B?eGRLR241SWw2TlBUVzFya3EycUlUZy9BMGpBWVZOeHRpbkVwZGZMRFk4K0NX?=
 =?utf-8?B?bzNGVTdWK0VORW04blpPVGVCeXZMRDVmZWFtUldoaE5xeUxTNHFVT05RTWZP?=
 =?utf-8?B?WGxhUVN5ZkV4V2FFYWtncjhmWmMxcWdTbHBtMWUwcUw2SnVUSmlUakltOHR1?=
 =?utf-8?B?UnNVbjBKTktDUnNnMW12U1RCT2lWS05uM0daYUVhVGg1RFNXY1pjaWVHWFhN?=
 =?utf-8?B?bW9EUFd6U2pVbjJhT3UyTmduMDUwOFVxb08rVWpJSVNoZHNTZUQvLzIzc240?=
 =?utf-8?B?d2pmNUlEamt0ZnN4S1RibjcxdStPYUtuc3Y2dVR0OXg5eG1pc2JWMWZqQ2Fw?=
 =?utf-8?B?Y3hORkgyeUt5dVBxM2pocGQvSG9uNnQwQjVmS1M5SXNPUGpucDhVNnhyUkMv?=
 =?utf-8?B?NjhjTlJiZnBGQk1JcEVVRmNIWTRiUzBlbnJmUUxGZmw2cjhZelg2R2dNN05l?=
 =?utf-8?B?SkdkZ2hEVENJRW55VkQvZW1XbUZZL3pWbGR6YnhQaUllN2loSG13K0UrN3Fk?=
 =?utf-8?B?K1l2VUU2SEU0azNjRXQ5aFI0TnJOaGlEV3h6NnBiMU9iR1NqRjNza2kvdTJs?=
 =?utf-8?B?K3Jsb2c1eGV1YTMyekl2Q2pwMHJHY0tWakYvUmsvZmRZVU5JS1dVVHlad0d0?=
 =?utf-8?B?bDd6SElvVWh4M0NLS2wzeTl5YVJJWUk1clY4SFBIaHZ5WWRYSW5QK1VDT21u?=
 =?utf-8?B?bVorT3oreTd4NEZsU2haOGt5Qmh4aERsOThXWXZOZGFvcFpad0t4enpIZkxK?=
 =?utf-8?B?OUNjSitaR2tIcmZQb1ZSNVNQSElxODg0UGRQK3NzQnR4WitkVmZlSjZxWnVh?=
 =?utf-8?B?VlNWSjR5QVk2Q3NOMFprL2UvYzFZNll4Y0pDQU1qRFRjdlFQUVkrN0EzSEI4?=
 =?utf-8?B?U2RhckUzVzFiTzFZVDJaRFFWaUQ3ZjdDWXpiUG5haXp6d2p5OU5HV21xWFJS?=
 =?utf-8?B?OXJDQTZJcmo1UTc1WnpDNzlZYjVqaWg0UFhNbUxMSGc2cXZhbFN2OENFSU9N?=
 =?utf-8?B?R05VY3QxRXdacUwyd1NXZEE1Z3RwY3FOR2Y4dGlVQXVqUWZZTXUxTWxtOFRU?=
 =?utf-8?B?U3RnSHJYSGJkWEdxWEh2RzNOUFdqaW5zNi9HWEcyVmc1M2tvTjE1bDV5cVRR?=
 =?utf-8?B?N2xndmVURHFlR2RBVjdZa0hhMEhNZ0pSeC9BRUJaTjkzREV4QmFhN2JkejhL?=
 =?utf-8?B?YWkweHYvc3dKWSszdVpPRUIycjFyQkcvcGZxK2tGUGdIT09ZNEU5T3dTWjdi?=
 =?utf-8?Q?+OJSn/ncoxXCl5mnKREeRtCfP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f7ae48-9d15-4ee4-2ebe-08dc693fdf80
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 18:03:43.6262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UpDUzvQZi1FAmuuhrtyaDU4ERZXhhwu5gQt1q+Njd1beMMJvmgjePKhgiy3+72DsDS3dEcx1vPYFXpAjkafnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7113
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



On 2024-04-22 04:58, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm_color_ctm_3x4 is some undocumented amgdpu private
> uapi and thus has no business being in drm_mode.h.
> At least move it to some amdgpu specific header, albeit
> with the wrong namespace as maybe something somewhere
> is using this already?
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Fixes: 6872a189be50 ("drm/amd/display: Add 3x4 CTM support for plane CTM")
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

We'll bring this back with the color pipeline stuff but for now it doesn't
need to sit in drm_mode.h and probably shouldn't.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  include/uapi/drm/amdgpu_drm.h | 9 +++++++++
>  include/uapi/drm/drm_mode.h   | 8 --------
>  2 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
> index 96e32dafd4f0..d5ebafacdd70 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -1269,6 +1269,15 @@ struct drm_amdgpu_info_gpuvm_fault {
>  #define AMDGPU_FAMILY_GC_10_3_7			151 /* GC 10.3.7 */
>  #define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
>  
> +/* FIXME wrong namespace! */
> +struct drm_color_ctm_3x4 {
> +	/*
> +	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
> +	 * (not two's complement!) format.
> +	 */
> +	__u64 matrix[12];
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 1ca5c7e418fd..d390011b89b4 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -846,14 +846,6 @@ struct drm_color_ctm {
>  	__u64 matrix[9];
>  };
>  
> -struct drm_color_ctm_3x4 {
> -	/*
> -	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
> -	 * (not two's complement!) format.
> -	 */
> -	__u64 matrix[12];
> -};
> -
>  struct drm_color_lut {
>  	/*
>  	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and

