Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B129E90DD3D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE5110E0F4;
	Tue, 18 Jun 2024 20:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gTT2pOvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2083.outbound.protection.outlook.com [40.107.95.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE13D10E0F4;
 Tue, 18 Jun 2024 20:20:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7v196tjKB7ZNw9Wj2icf0HVZdQc4IfUgwM8d8tmkSsGg5Oz+QtzSIFv7sQFOUo7D0ZvSB+EQrSBb0RlzxTLJq/jbroXPYD0FMG3EJo48eUh1wDsPl/G7G2IdstrDDbdp8S4PdwffTCrVQPuz0QYajqrmBAaDDmQ5CwhJB6eVRro/UNqKNoLRYWpo2HBlJaS/7OyGSdiy5zvqI6+2mvgPPgYbhsrLZ+sliZ/Z3+B2fKlPo3l8mutvny7RkrsG57dYChlh/t5amunc2811uuJ02ZjkiE6+0JKMhbZq0z3q6DWZLFwh4ewkH2FJhYZM3DJa4n8syBRJSr4xAUBjlySiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvgxZsBCZS/Ao8ajA1bRJoNTwHWeWZ5uspfsypZVGpU=;
 b=TbDeLWsnxM9e6WxPqrFcS5+AkQPLaCmqtClnXaM3WTt4ycA7WKikLFiMkC8dmjPvufrOLEDeH0OH4KRnCBPECepFWlHO2hL6VOyYIDGAtKZyYp2Q8bc87Bl+QuOVSgCE8sOD1nFxQ+xWsz0eVCyA8vFUc1pYK5R+hHD5jtjCvNA8OzysGA02D/LY/gAwKVlKfjL6wIT/SHcFNZmTabUo+993/O5Cn73DN/3GRqlvEWTZZEZZJxP09jzChq8io0I1H8Hry5WQJrNePkbYVt1E33ScxPGBlpDOFuGmIXh+xxGJaEcDEnzcto2gjsjwaFG/xrIeyNjc8SYEIF4EdnLsTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvgxZsBCZS/Ao8ajA1bRJoNTwHWeWZ5uspfsypZVGpU=;
 b=gTT2pOvc0SCiSCOll5IkA/E0x34HdIOwPJk4EpmOmEhhOwUr/jFsThyDMWiWx5JFffANU0yiiZj2n892kKcpRLmMm369xErMfbiCDIrzPDzQ/HUReVHVpG4vBf8obZVIkH9CBh6ot3ByLINXUnropCkd64M+8j5Aw+rtpq9cNNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Tue, 18 Jun
 2024 20:20:19 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%6]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 20:20:19 +0000
Message-ID: <84780b0d-aec1-4674-9e54-8d1997a2d4fe@amd.com>
Date: Tue, 18 Jun 2024 16:20:16 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] tests/amdgpu/amd_abm: Add support for
 panel_power_saving property
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@google.com>, Mario Limonciello <superm1@ubuntu.com>
References: <20240522220849.33343-1-mario.limonciello@amd.com>
 <20240522220849.33343-4-mario.limonciello@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20240522220849.33343-4-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0122.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::22) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|SJ0PR12MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c01884f-99b4-4d4a-6997-08dc8fd41297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlZuUkE3SkQ3YU1IeEtUNWZZVVRGb0tUZWtEc25Bb3BkWmh4aWhzQkFqRmM0?=
 =?utf-8?B?Q044ZFBKVXMwUnZrVkZPZjRUbW8wTjdzNU5hZU1mMnVpNmZWWEt2MHhEOVhw?=
 =?utf-8?B?NE84dXV0VS9WdThIMlE3ZnJsQjRTZDFxQ3F0bWF5cXRFRkJMWStSaU0yZS90?=
 =?utf-8?B?ZEV1T09adndUNzhGcjNJTkdWUzFCeDFQZnB6a21rdTVTaG4zZis0Vm5weTRj?=
 =?utf-8?B?clhReERib1VzZGNUMFhZdDlQS24yNVU4WExhTnFJY0RCYjVFSDFLOUlqSUov?=
 =?utf-8?B?T296cGVjOEEzV3ZZNXE1UzRuYzE4VW8yMnJuSkd3M1M0OTRpbmVsVTRjdUVG?=
 =?utf-8?B?SzZ3ckpvc2M5RmNjTW0weGxvUHdsMXRCZ05QVGg2U1RPRG9LSExRSVJWWkdC?=
 =?utf-8?B?WjJ5bXErWkRscGlHR1RrZGV4OW5xRDhqd1h1SEFPeGFhaGE2TjltWkltVU5p?=
 =?utf-8?B?TWxPUDM2SStUUTJ0S0cxWVpBeDhUVXZJZEUvNVBlZndwZE9EdHEzNXRRSHF0?=
 =?utf-8?B?aVRSdkpuMFN4MTdqRGsxQ3JZZFY5dUlrYzhTcjQxcFlUb3NScHEwTUljT3Qv?=
 =?utf-8?B?dytaWnUvRWtGM29BQ0phRzlzaU5PbGMvRTdkK3dpLzBreVVoNkFIc0xjRXdH?=
 =?utf-8?B?bUg4MDBXUFN2UEhwMDhrTDV0MXRrdnFlR2lPcVk5M1RmMzNBcGVZV2pLakFM?=
 =?utf-8?B?ZmpNeXJHVlAwd1EzZ0lwRmFabUhtSHh4NVN0NytsV01BemxjVGdpYmVIWTNs?=
 =?utf-8?B?TU53Y1lYeWxJUncxZDI5UVBZZGtMemt3ZWZzdXYxMWZTeS8zenQ3WmY5SFZ5?=
 =?utf-8?B?VEV6MHNHc2M4Z1I4Z0lXK0ZGeGdPcDZDR2NZOWM2TFpmb0w5eTNEd2FYMGs3?=
 =?utf-8?B?Y1U2cWVZZGNsRE9wUnh0bUZLVDZpOS9ZRml0UVI3YThKVnRxV0NMa290T1BZ?=
 =?utf-8?B?UGJSWmI2NEhRbjh2K1VIcnlUWDRoc21RSGVCbElkTTVhbGU1Tzg3MzUvQ0xr?=
 =?utf-8?B?S1ppTit0MUFzUUlVS2U1MEJlNC8wUExOMWZxZGxFQkV6V0hLZlEvb1NPb3VI?=
 =?utf-8?B?b0UzTjNCYjczNmRtSTJpNWpSeFplTkx2TTN3eVJvMWt6YmNHY1ZWVkpBSW0z?=
 =?utf-8?B?MVhtWXlqK3A0OHdOZXAzQ25kZk5wK1F4b2gwdXBYMFZvaWQ3L3FML0N2RmhN?=
 =?utf-8?B?d1V4WUdkZU1WVTYrY2JPL3dTbnc2YTdmeUV0Q0J4TGs4WmpsN1hCZXVaY3pK?=
 =?utf-8?B?NnBYTzZZN0Z3WDB3eDIyM05sVnVVN2U3NmUxMFZPYUtjSlZ2VHJNZUpFRVhV?=
 =?utf-8?B?WU1WZjNnSVJsZGJOMlMyNEFEK3A2WmpMN3ZLVlZyZ1FUcitXMnBsUFNCL3VP?=
 =?utf-8?B?QjI2VEpuWHlSQ0dSempoMTBPK2xBd3hJUTRjbHlkdmE5c2s0U09NWDkybmR4?=
 =?utf-8?B?Q3ZmQnpRdk5ZT21QVzVUWk5FSC9VRjcwNjc3TDNvNEhKZTNKMFZxYzlSRC9n?=
 =?utf-8?B?Z284QkxDWTZEWWh4dDdUZ2pReUZjdEQzVmpDVFlOQXFBZXJxUXp0TG1ON1E0?=
 =?utf-8?B?c2RSQkhmdCtRN00rNzBBcHFpVzdQb3NMVHRlWEFEdDFaWm9yQ0FvTVFkQnRj?=
 =?utf-8?B?aXlUR0JtQ21uTUhtdk5vaFg2U0xvUFZBZERORWdZMXMzU2crei9iMlpuV3lD?=
 =?utf-8?B?YmJ5Z21KRW1HWFdGajNMUGZmUVdmdDN3R1Vlc2tHV3VRVXpxQU1mbXhuS1I1?=
 =?utf-8?Q?L1V8IhWBCcyXTNMsIJE2aHW0xIRBj6Uw1Poa0x1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmE1KzBMMlA4clBBekdRbXo0RnRhekJUcmEyVU94cFNTbFpOcWM5RFVBTlpk?=
 =?utf-8?B?RjBOZTFybWxPTkdPeXUrMytzdVdmdGgrakhUejRaVWhMSDdra0krdHR2UitR?=
 =?utf-8?B?TloyUzJqdW1mdXJ6SzNTVWpGbS9rcVc4OTQzU1IrSkErZDd1Y1I4dmc1b3N0?=
 =?utf-8?B?VVU2QUJHYnV3dCtoL1VNZzVVenNOYjdJZTlHeFQ3dFRTY3hmMFloSjJDWThG?=
 =?utf-8?B?UHBubmEwS2NFcno2RW5FbEFYaG11Q09SNkhlQUtGaUt3N2lrRVpBek10QTZL?=
 =?utf-8?B?ZXVYK1p5YTZLbFFoNDhMT1pFRkd0Rmg2TmI2TTZWNUdRUktQRmJkd25GbFRG?=
 =?utf-8?B?dEVvWnlqMzhqNy9DcndWU04xMXJTRGJ0TUw4T2UzNFUvdDNJeXcxaGpXdDNI?=
 =?utf-8?B?Q1BHN3Q4UFdNdit1bDJLSzN0eEdmSWxoK08vR0hGdEVEYTZIbWRqWUc0VzVT?=
 =?utf-8?B?UXpDbjdNR1IzcHZQNG15M29YcXNTSUpkbE1UYzNpT2pwcUZqYVJxTGhLcXpk?=
 =?utf-8?B?c3d6aDdWcDBuVjNtUXF2K1hlSnhtc1FnbnB1OVhuMjd2d0lhMThPNlBmQjRj?=
 =?utf-8?B?dE5OWHh6U0NJWVd4dlNSMDU3Z25wU3BsdE5PMCtkTVRwK0FKWWVwYnY5empE?=
 =?utf-8?B?RjRJR0NSUHNFZjJnMmFaZ3Myam10bUd1WGhQNkVlbWlUMm9CSDFKODZBSEEx?=
 =?utf-8?B?bjJLZHVJd1ZSV0hWTE9tRWxjOFU5bG12TExEWFA2UnRpYlJrSnh0UDI3dnhQ?=
 =?utf-8?B?Qi9FVG9KRjR3WlJLWGxMNHpUYS9RdjJNa0RoWjZVOTNNZ0IvVEdFYXNJbmxv?=
 =?utf-8?B?Q2s2UjBoOGVqOVZ1UFRLOXptTThmQjA4a0RaT1dTNEVEbk5MS1BENGl0Vncr?=
 =?utf-8?B?UkgvZFRYZzd2NkNDS24rN0NsVjdwNGtTTndVdUExTThCMGp3ZFY2bEdvSHps?=
 =?utf-8?B?WHlxRC9ZY0ZTTG9vTndaTU0wOHl4aXd2VlM0UHdIdUlNSDVDQ3NTLzI3UkNl?=
 =?utf-8?B?ZnR5R0kxZkhsNG5PRlV6czUwWHhRRk4vUUJ1WHFwVmNRRzBPam1CZ0hPRS9x?=
 =?utf-8?B?UzVhdU1LM1NMMVl5elVFZTVpUmJJZGlZV2h1VXVjdjgzcExQU3N2cGhwd2M5?=
 =?utf-8?B?VCtrNW1iOGo0WC9Ea0hPcStScEVickhsMzQ4ZVNyV2ptTElEcUlNVkpLeFhh?=
 =?utf-8?B?S0xCdW5WQXoxdE1GVjdHbEt1cWMraXE4WCtLSUhzTjQ1UTNUOUpZeU82UkdK?=
 =?utf-8?B?TVY1TWIwYUpzbEZCOTZlMFZBOG9Kb3kyTTR2Tm5tOVZLNEZTcmJjNE9BNEVy?=
 =?utf-8?B?VEppZUhFbWF0dzZnQkJTbmh1Tld4L2pHcEZHWlgvS2s5T1k3NVZvN0pMUHBt?=
 =?utf-8?B?eU9nSEUxajV6WTc3blljSUtldVpkNkwxUXFqL1lnVVpndG9XQm5Td1k2dXR5?=
 =?utf-8?B?VnJ3ODBoL0hNM1ppUW83a21kRkVNd3ppSGs1dVRWbWJyRU0wV0NRZEhPOU92?=
 =?utf-8?B?bE54QWJpNVh3VjRKUm9RQ25zWGpyeWtBQTE1MVo4Tm5JSVBON2pJNzIzdThX?=
 =?utf-8?B?Q0ZkaExJM3I4dlVZZUVWQTJlcEtJdUhYblRWVG9TOE9meCs4RzhkNnNtczJs?=
 =?utf-8?B?VG1zU3cyOVVkekozUTYwWk1HamxWUmJCcU5zckU2QzE3Nm03VGhXT21KYXFL?=
 =?utf-8?B?cnJjc0pJSjl5dnFGMmw1Z0w5ZXBXWWNUajR2T2U4MzJvTHg0VEplbXJ6ZU56?=
 =?utf-8?B?OVR1SUlPTUI1S29KM09kOVViUHM0M1pIRHpsWVhkcG8rQzBCaVJna3RDYkhr?=
 =?utf-8?B?OVhCWUNzSjVBbkF0Qk45VUZUWStqZ01WWmEyV1FMQnhnU0V4ZzBqMjYzY0hk?=
 =?utf-8?B?ZzBROTJnSHlOSU5zWmxJRG9rUm0rbFk4dTNMYnBtYklxaEJwdnFzVFMzdVlK?=
 =?utf-8?B?b3grd0tUekJjcU5jMEFMcC9RaGhyYWttdDA4alZBbzlQYTYvWkxjUXhmazhG?=
 =?utf-8?B?a0tGMkQwQmxDZzhvUm9MZFhyTWNFRHdXZ2NqRkI2SVFlYjBRT1B0MFZLeE1M?=
 =?utf-8?B?WWRjRGIzenZTdW14Y3Q3NGgvZE82eVpWN2N0RHNzNld0WnJqN0Vad2xuWFUw?=
 =?utf-8?Q?HuYdSau2QoE2K+TjtJYFxlvZZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c01884f-99b4-4d4a-6997-08dc8fd41297
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 20:20:18.9480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLU6jJd85wwBfi12ja761xJEmOD1QItGM4Nl68jYY5igC04mnVFM3gmNVbjPsVNP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6760
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


Thanks for the tests! FYI IGT patches should also cc igt-dev@lists.freedesktop.org

Some comments inline:

On 2024-05-22 18:08, Mario Limonciello wrote:
> From: Mario Limonciello <superm1@ubuntu.com>
> 
> When the "panel power saving" property is set to forbidden the
> compositor has indicated that userspace prefers to have color
> accuracy and fidelity instead of power saving.
> 
> Verify that the sysfs file behaves as expected in this situation.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   tests/amdgpu/amd_abm.c | 39 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index f74c3012c..3fa1366fa 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -365,6 +365,43 @@ static void abm_gradual(data_t *data)
>   	}
>   }
>   
> +
> +static void abm_forbidden(data_t *data)
> +{
> +	igt_output_t *output;
> +	enum pipe pipe;
> +	int target, r;
> +
> +	for_each_pipe_with_valid_output(&data->display, pipe, output) {
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +			continue;
> +
> +		r = clear_power_saving_policy(data->drm_fd, output);
> +		if (r == -ENODEV) {
> +			igt_skip("No power saving policy prop\n");
> +			return;
> +		}
> +		igt_assert_eq(r, 0);
> +
> +		target = 3;
> +		r = set_abm_level(data, output, target);
> +		igt_assert_eq(r, 0);
> +
> +		r = set_panel_power_saving_policy(data->drm_fd, output, DRM_MODE_REQUIRE_COLOR_ACCURACY);
> +		igt_assert_eq(r, 0);
> +
> +		target = 0;

Is there a purpose of setting target abm to 0 (disabled) here?

I suppose it should fail given that we've set REQUIRE_COLOR_ACCURACY. Though I'm
not sure why we can't keep target = 3.

Thanks,
Leo

> +		r = set_abm_level(data, output, target);
> +		igt_assert_eq(r, -1);
> +
> +		r = clear_power_saving_policy(data->drm_fd, output);
> +		igt_assert_eq(r, 0);
> +
> +		r = set_abm_level(data, output, target);
> +		igt_assert_eq(r, 0);
> +	}
> +}
> +
>   igt_main
>   {
>   	data_t data = {};
> @@ -393,6 +430,8 @@ igt_main
>   		abm_enabled(&data);
>   	igt_subtest("abm_gradual")
>   		abm_gradual(&data);
> +	igt_subtest("abm_forbidden")
> +		abm_forbidden(&data);
>   
>   	igt_fixture {
>   		igt_display_fini(&data.display);
