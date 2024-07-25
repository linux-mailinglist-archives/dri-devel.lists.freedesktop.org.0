Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA7B93C738
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 18:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EA310E2CD;
	Thu, 25 Jul 2024 16:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GtoUN4gw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B375810E05F;
 Thu, 25 Jul 2024 16:36:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FA4JxZuMQcO7RiPTcEzGFhtPCBjykYYhvrfcuFqKKD5AszEm0vV75eKWxqf9fEc0iqtv8IBKL5AHQp2NGXpG8cm06kXWMUiI6zxFWfWNcZ32hecYS6MtN3hop0e3vsqFXpdCfijaABDBHCfRGrZajXiS8ZFYH77s/u+kmwfRIIKwMy6Ej4otwU853xZL8DK0OmdpHmjO2O4lRfaJXGYCxM2+4Erinvkmy3zsLxs96pZUg4cy3Pxn6q6K0zu5mJNBpJdKWjWOsTEbuE1MGJBAS99fQhVm1jakSKdPI8qhzQchHeIfAljn8GnMRdHLxwUoe5gNzW2fujZzXC+S321X3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azlI1zpgYRFC4sYtlvmeB4dRYKvKSoL0IFxuAp8qLUM=;
 b=JFz5yplXFO3aeH47ImjszIX6zZjndtsn9wJGJq309xF1LMpTSfT4+dIuSmSIBY0GL/dAhLfU+mY7USy66mqCwJWE48LHl02uAIbt00+QtDmN1nqhjC+t1hXSuHkJE1f/u4z7EU1s+tWBQgGM2PFTTgs+VJwEOxEznXEGuWoJycU5n49HHlJLa/rzCu+t2Sfmmo/yRBo/tJSZD0MVWBeQtcP5oIR/bX3HZuoA57WHMj3dqndpAgUMdCVg68j5inucP0gTEC+Lzhzv6+jRQms6cqNwaXEtB0un5sDzdI4k+qiAY9r6/C48HwCH3l7S1wYvRTCIiEKdWBOCUhDgW28tkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azlI1zpgYRFC4sYtlvmeB4dRYKvKSoL0IFxuAp8qLUM=;
 b=GtoUN4gwFQDGBAs5oipeMwDorJtWffkKHGPHVII27DL9lUUKGgO7S89qd5cJ/gvm3DwqLw75V4B3Gm1rq3PkURSt5bfrfpaqeFzAekAnsVp/yyxcdq6RMxWfm6N71HgTP1X31b7h4WrdGdI9cf81twTNzjD19y/VzgcIfZuYY6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by SN7PR12MB6959.namprd12.prod.outlook.com (2603:10b6:806:261::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 16:36:47 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692%4]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 16:36:44 +0000
Message-ID: <66c222c8-deb9-402d-ae05-632a47ce7167@amd.com>
Date: Thu, 25 Jul 2024 10:36:36 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] drm/amd/display: switch to setting physical
 address directly
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240706034004.801329-1-mwen@igalia.com>
 <20240706034004.801329-4-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20240706034004.801329-4-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0204.namprd04.prod.outlook.com
 (2603:10b6:303:86::29) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|SN7PR12MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 2964b429-80ad-4cda-9222-08dcacc7f873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHNkKzh4RklyOTlEM0kxUUhvS2JiVVl1SDBsMlplU2VvN3Y3YTlxbnVkZjdV?=
 =?utf-8?B?ZXNIM0t5TFJJaEpUbkhaeXdNckl3K3VrcFFNNGlPcHRIU3grbjB0NTZFVFRL?=
 =?utf-8?B?cnJCTnpLTFg3enNyNGtDSHhBbFdUZkpqR0d5emF3S3UvcHNKd0FhNjV3ckJw?=
 =?utf-8?B?MFBIM1BrV0xZSlc3NGljQW5qdCt2Rk1Uc1pUUk5XUlMyMGh6TDBsR3lFQXVs?=
 =?utf-8?B?NTZDM1U4R1J0ZEhaNTQySkhyekJBZm12cWFTRXZDcm42TUNLQzdwU201QU5X?=
 =?utf-8?B?aEhBQ1FWL2JqaUFiTmc0aGc2VlRoQ2Rmb3VXMy9Tcnp4dGRoZjRNQlVkcDhl?=
 =?utf-8?B?WDR1OHVBWTBQaEVCaGZMQUlUaTUxWkQwbGpkVCt0UEVoc1g5cjlwa1NmajI1?=
 =?utf-8?B?cEd0Y0NtN0x6bmdiNDNLVU1DZmRmc0ZnVGZDUnB3dkJPVFFxaGNGYzAyQ1Ji?=
 =?utf-8?B?NmlGbUgyRElWVS93d2dmaEQ2dCsyTmI1MkREdStpL2hjc2I2YmFsZFB2VmtW?=
 =?utf-8?B?MjZ5dld3N2Q1SEZLTVBYZ282L3hJVHJZakNiZ3JpN0t5bXdWRTNrSC94aHFZ?=
 =?utf-8?B?MmlWT1o5V0RJU2daeDBxRUdVSVhDSTRkOHpFWHVBcHhYUGZ1V0ZnTkJnQkhU?=
 =?utf-8?B?V1dyb2ZjYnV1SURCK2k3SlZXckZtaFJOTmZnQ1F6L2JBcGtENTNaMTBEazg2?=
 =?utf-8?B?Mkg1UWM0azhYQTR5WW5va2R4bUo0TlNhNmFDSmdOVlNESlNRM0dXRW9MTktZ?=
 =?utf-8?B?dnU0R3VYcUc0Y05ZOEdHbVJjWjJmN3JNSUZzSFROb2JONkZRWCtCdjM1a0J1?=
 =?utf-8?B?SWl3dHJzWGlybS8vMk9kOHFHMlZ4ZmVJOEg0NXVSck9PT0hRWnFNWGVDeG52?=
 =?utf-8?B?SzRoUEp6cU01V1hFUEE4d1JQWFYwQmozZ0F0T3Bwa2pxc29aQ0FSRlg4RjhF?=
 =?utf-8?B?UVpvSWZ0bWFLUmpDTmZaR2lIaVNHWjJOWkZYRXMwV0J3ZVo4N0Y3d2I2RXpI?=
 =?utf-8?B?dXE0WUNWUm1EMS9kL1NmOWUxS0JPSS9oc1lCUExDdTVCdE9yM0pGdWt5VmFw?=
 =?utf-8?B?aXFCU2g5c0hsemRGK2hQUGJBWWhiVUVZRDZOTGdaVjJvQTVzZVp5MGF0M0x0?=
 =?utf-8?B?RjVzbVJyODFJOGhuRWNoQ2FQK1NxMG5HU3kyY29DRVE4RE1RMkhzVFhRRDJB?=
 =?utf-8?B?UEpzbjNjQktSZGd4cldYeGhsNUxJbVRhcmo5a0pjVTdMNThaWm5RN2RnVnVn?=
 =?utf-8?B?eGxka1NWbU0xRHVlUW1JbGRqQy9QOUtoK2k3WmlwVG9HYWpKbEJnUUxjeTRK?=
 =?utf-8?B?K2kwRGxFak43SFhtazlSZmtqSUZBTkQrN241MGxtSllhV0RubXdTdnd2bTRN?=
 =?utf-8?B?b2kxNFV2Y0JaK1FEQ0lLVmRXYklRRG42ZlRaYWFJTHl5WTEzeVQ0TEFXWDg4?=
 =?utf-8?B?N25KTkw3c25Yd2R0K0FPN1RoNnBFalpHaVpyMklqSWQyMjZnWUR4QTMzK0Nn?=
 =?utf-8?B?UVlWczdjSWp0VzZnRG4vMUtDcXc5VDJvbWExTXEwUGJ6ZTFxc2dDRDk0RzhG?=
 =?utf-8?B?SjlHeTFQV1E4NmZGenh0dllWNmxkbjNsWjVwenNpSkE3bTJsNG9BK2NyUVNU?=
 =?utf-8?B?QWZKa3pMZk45NjBWNTl2UUhlMTlRNkhpOVpyL09EdWNPTExNVm9GNVhHMk5n?=
 =?utf-8?B?Q0FzN2psbHlqMHdyMWQvWjRXTHZqOHQ3WWNiRDJrVE01YzEyQ2hvWndhSzVD?=
 =?utf-8?B?TXkrTlhRVTBoKytVTjRZNllWaStsVGFKK2JWY0FkeDNhTW9zVWYrZjg1NER2?=
 =?utf-8?B?ZVlRVld1YnVUdVduQWxyQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8495.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qmh4UnJhRUM4Ykx3L1NFR2RVNitKN1pBSkRuRWJPT2xvMlkyN3Q2dnJIbXpJ?=
 =?utf-8?B?ZElkVmRmZUZNSEhQMm0wbUVwUUNkRkpDUVFCZkJvdU81V1RSN3lXUUVIYjU4?=
 =?utf-8?B?ejU1aWljYkY0K25XbUlIUlNTNGNQS2pzazdvWTcrNEM0ekM5bnNsc1FVZFhH?=
 =?utf-8?B?SEpBdDJRSG1tQjVOZU9QV2M1emxhdm56YXpuRnNPeTJPaEtrbjM0Y1RsaVdW?=
 =?utf-8?B?R1h5RFh3VmMrRVEwMjRTeWZZcklrUmtUaUZKbGFMV0pCNHZ6aHd5MjVlaXFT?=
 =?utf-8?B?eG9wdmp5aC9XMCt1aVJqYmhRNGZCTjJJUkhkQzB1eC80SFBaTlBzTUlzUEtV?=
 =?utf-8?B?L21QOXVDWVlraDk4T2Z6L05PcmpVNG83K1FaL3VYL01MQ2d0L2hqOUI2Q0dn?=
 =?utf-8?B?SnhrQlNwSDg5eW4ySHBOV2NIZmpoK29pSWNYMjIreGw5Mzl3SytFcmx5TlBC?=
 =?utf-8?B?OU5mTjdNM3JmdmtWcjBESG0veHlmTWRpUG12cWplcEJZemJzWVp1d3lSczYw?=
 =?utf-8?B?N1JPU2UwVWJLZEkybS96ZHFrbkkzVWNsU0JNT1FoS005M1NSU3VGL2lzUzBH?=
 =?utf-8?B?MmtTUTgvUzdMcGExMmVhNlAvTThLNStDTnF0SkxzbjBmU1VYdHN5dURodkcw?=
 =?utf-8?B?YXZUcVIwcWlqeUVXVWtFdUYxSE1DMUFJb0U4RlJJclJwQkNORWEyVnhQb3Za?=
 =?utf-8?B?WlozMytnb2pjWk82WndpTjVRdElWQmVOZVpmN2tpUTVLYlJNTGllQ3pZdzBS?=
 =?utf-8?B?WnJWRGdSNS92Y2JnNVR6dTBkSHJ5VHVWZzZuMTRuNlVKeVBJRkRIWEhtRWN6?=
 =?utf-8?B?RUFlRDdkV0xHMW1BL3Yzajk2OWczd0RWc3J4ckVKeFlGS3A4bWdnREpPUnNn?=
 =?utf-8?B?ZzJyYk93clF3a3p2OHpqOGp1NHQ4WDcySmtiNlhVam04UzVucWRwSkUwa0lD?=
 =?utf-8?B?OFNuMFA5TjJnVDdFa21VQkY3WEF6WkxJZy9MVVRNTDlGbGNVZDI3azJOM2tr?=
 =?utf-8?B?S2pyLzVsZXowcHl3UkgyN0UwamxKQnZTU0k1UWVTaUZUTDY4UjNaRUF1MTBS?=
 =?utf-8?B?ZThnZlV5UUdPMG9WcENuL0JvTFpSZnduTkozZDdlSDhUY0pjV2VPTGt4aHp0?=
 =?utf-8?B?bm44ZlpScG5IUTdSVnF3U2dxTUEzakRtZVlGVGF3Z0JOdDlyUFk1a3N6TG9x?=
 =?utf-8?B?RFIzYi9NSmJOWTBxKzBmMEtzN2kvUUQ2NGVrNzdxVUZFNjlvVHplYXBJVHFL?=
 =?utf-8?B?N3hwNE9jaU9wZDB6cjhPUkl1QnNyakxlOGlRY0hCWmJ0ZjFTNSt5TGlUWGcr?=
 =?utf-8?B?cUJqRUFIVG03dVZWL2RSRHVCclJhK1NBekF3M2k4V3lWZFFTMkNHbVJncTIr?=
 =?utf-8?B?TWc3bWNzQW9yb2xNVWZoanlEVjZxeUp4Uk50V0RELzlpRjh2dHBSOUpsTkRt?=
 =?utf-8?B?bnNaYWNrOFNZL1Q4OThiYUVNZDQ2YnFpQmdHNUVXR1dTQkxMOThJeG5GN2FC?=
 =?utf-8?B?bjhRVCs5OFdUZ2VJYllXOVNQQ09JUWtiNDRUdUsvNlVIMkgreU1acmRnVks3?=
 =?utf-8?B?NE1BUVhYb2hUKzFOWlJPZFZaSzVQS0d5MjhYTWdvNjZkRk5VWjhtWDJvcm1o?=
 =?utf-8?B?Sy9ORG1QWXErSzNXQUQyVWJ2N29BcDBvNEJLY1NuQzBxcXlScU9hUUNJazR4?=
 =?utf-8?B?TWlqbzhudmFzL0phYVBWcU83RmVsc3gvZ2cvekJVaDFUcmo1NUdDSkRVYXNO?=
 =?utf-8?B?ZGpTdThkbnBCcWEzMnN2T1VGT0IxVjBFVzBBMWpvMUtMVWFUZFQzREJZTEU1?=
 =?utf-8?B?aENwamd5b09aQjBheXNwQTdmMlV3dEpjN1BvUC9zeVVCaXprRlZ0S1RmK1Zk?=
 =?utf-8?B?VEpMbTJZL2FyaEJRSzgxMlNKb3BBaUZ6V0dOTXJ4QW9Qcks5ZnM1YVJpNUU1?=
 =?utf-8?B?S29wRUQvYWVwVWMwK29aOFpQVFlYandhSXhQS1NPNUdGRnIwendNc2E5dFZi?=
 =?utf-8?B?VXo5bm5lZGlJV004c01iNFR3czFkVDhlek5ldWpGYVdveWhuRFJGL1AyYW1v?=
 =?utf-8?B?UFdab3poQ25PSDdqTW95Mk1OaWJ3a1VUalFiUFRuZWpudUxlQkxSUzc4Qlp2?=
 =?utf-8?Q?azck249NLOBJpRh/zFjxkGJzz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2964b429-80ad-4cda-9222-08dcacc7f873
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 16:36:44.8350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wciNLYjL3P2EPVldp/3I+8us5Nq5MA7fD4hdRQ7yU01Qq1V/QgWsH2XTcKMUT5r5oQHoOi2ylrSRsCMKS1ZXyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6959
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



On 2024-07-05 21:35, Melissa Wen wrote:
> Connectors have source physical address available in display
> info. Use drm_dp_cec_attach() to use it instead of parsing the EDID
> again.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 49b8c5b00728..163850aeac4a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3477,10 +3477,9 @@ void amdgpu_dm_update_connector_after_detect(
>   			aconnector->drm_edid = drm_edid_alloc(edid, sink->dc_edid.length);
>   			drm_edid_connector_update(connector, aconnector->drm_edid);
>   
> -			/* FIXME: Get rid of drm_edid_raw() */
>   			if (aconnector->dc_link->aux_mode)
> -				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,
> -						    drm_edid_raw(aconnector->drm_edid));
drm_dp_cec_set_edid is removed here. I guess it doesn't matter if edid 
or drm_edid_raw(aconnector->drm_edid) is past here.

> +				drm_dp_cec_attach(&aconnector->dm_dp_aux.aux,
> +						  connector->display_info.source_physical_address);
>   		}
>   
>   		if (!aconnector->timing_requested) {
