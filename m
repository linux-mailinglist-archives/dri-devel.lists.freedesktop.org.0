Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D4993299F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 16:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A9E10E75E;
	Tue, 16 Jul 2024 14:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="18dDWHHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9158710E75C;
 Tue, 16 Jul 2024 14:48:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8ZQFX0aZ8McSvAdx16pblziEhfcBmawEwvJUKQQexguUbcEM96z8PiNK+7BgdJWUD/AqB0xCCfvG6P91htlqH4sy187bi+6cZ0Pa7k/Fwygajtl1fDpDvBOSKswdkhmiyBaDu4bppVuOxvEz99k86MRSdhggDea/HVUhn5UXf3mcaqHUZDRXgY8O9vgboE4ddTjv1ZZl2GaLDdUha4sREdPgVFZCCZUvhtSJiP1QGG2U0Yf7n52z3tO2JXCgDcrVvyTjdAUw2zPBdPcHHxSEPr6STzIfx8M6rzdgXvoastMqvfwmQFd87YAE95v0LLNCN3BX6dG9s4XObbCKlWnwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lRvhb5lOSRNOMtj4S/Bj8zNuHdT0eJeFcFDJTLdSUU=;
 b=b2BkCZT8AqSMqaC5D/qs+wnhBZ/nc6swWkwbwNnvI+PVtShQHyoFRto8mp7Rh8FUwn9sggyT4M2zt6ntI8aB5bv+Vi4LNV8pZzdMkA6jkxn605O9lAPg/RIq9D2aSYyMuvWkPF4RN1VZZcaPZq33dyT9KZJ65SC001e9v17vK+5daOz8ACLBlBjXfk8lbMHK8D5CE8NvbzYchFmW81JVanh5Gyv6WG+AezEJu91OPcXOqrlPFpJCqilwoDDcLQydK1YGEIkrRcga4/R/UmPNVAQGFbsW1yE+TXz4rKvEZ8HoZce3d2f166jlHZHv/pBzkP8poqNU3fF0qmc7zycZtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lRvhb5lOSRNOMtj4S/Bj8zNuHdT0eJeFcFDJTLdSUU=;
 b=18dDWHHlY72PtA0hhKICgmlStr3BBzxvgAVOukvB85QFNJfHD4SOlQiwJ1wXZ/vIt66RA2vjt4L+cMuKzIBFTGae18d55dv36XakAMKLEVZIAKSTwlIQ9Z7Nk1XSvllH2ryoSzktAR2Ma7xG4w6qkqQlSyRY9phvsbd0WQ6jrVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by MN2PR12MB4272.namprd12.prod.outlook.com (2603:10b6:208:1de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 14:48:08 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%6]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 14:48:08 +0000
Message-ID: <aac02f31-ba43-458d-b9c2-a68b7869e2a3@amd.com>
Date: Tue, 16 Jul 2024 10:48:03 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH AUTOSEL 6.9 11/22] drm/amd/display: Reset freesync config
 before update new state
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Cc: Tom Chung <chiahsuan.chung@amd.com>, Sun peng Li <sunpeng.li@amd.com>,
 Jerry Zuo <jerry.zuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, harry.wentland@amd.com,
 Rodrigo.Siqueira@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, alex.hung@amd.com, roman.li@amd.com,
 mario.limonciello@amd.com, joshua@froggi.es, wayne.lin@amd.com,
 srinivasan.shanmugam@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20240716142519.2712487-1-sashal@kernel.org>
 <20240716142519.2712487-11-sashal@kernel.org>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20240716142519.2712487-11-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0040.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::24) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|MN2PR12MB4272:EE_
X-MS-Office365-Filtering-Correlation-Id: b31c679a-7524-4c3c-9742-08dca5a64e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUhxcG5SY2lJUE9JKzNrSUk2MUkzOFYyLzhaSlNOT1FoWittZGVPTXFQV0JE?=
 =?utf-8?B?M1lUWTZGa0tSMHJITVEyS3RRV1oxVDVBZFlOTEpQdDNrTG1aN0tDbkxJZ2sz?=
 =?utf-8?B?TUN5cG1WZXpiWG5nNERVY3h1ZlRzQllLV3hLVkE3eVVQZnp2WUpxRHdZWVNU?=
 =?utf-8?B?aU0vWjlVWDlBak1LSndCaXlBcTVpc0p2eVFYRjN3TXJJbkhESmJYMmJhOURR?=
 =?utf-8?B?cXBYT3IwVDRmOStrODlxVDFabUw2b0JwSEVCaWlSWU1oMzBGb2hiWUU3OVNr?=
 =?utf-8?B?YzY2Q1F5OFhhYUc5S3hLeFZLbVhDR3I0NStMbEpXV0lBd0NsRG96L2V0a0Zh?=
 =?utf-8?B?TmRkb2kzcmlGSk9mR3NjZDlucHp0R28vcnBINmZldDlYWk45b3FPeVIxSTBY?=
 =?utf-8?B?U3dsWG4xNmZVUkRpdVZldDM3bUlKWFdBSUVvdnFhWitUdUoyaWJiWWcvOTlP?=
 =?utf-8?B?U1Bhc0F0UmdYdjU4YjlRYkhrd2VQWGRRb05ZR2hjVEdENlNpVjUwOUIzZEMy?=
 =?utf-8?B?VEVBVkJZYlBQYm1jNW01VVJBSDRpeVZSc0x0a0hHOU9SWEo0ZEJBMjV4NzdG?=
 =?utf-8?B?ODlHQmZlbFREQ2wyRitubk1GT3dSQWpnbnhYQWp1RS92UFFoNXowcHd3UUVi?=
 =?utf-8?B?ZHEyTTdtVTFKRGJFTWkvLzRtTTN4SzBIeDNDZzNkM3MrS1B1R3gvUXFSUXJ3?=
 =?utf-8?B?djdzYjhxd0NZUlJIVGpseU9mU0hqMnlWNVpOcktvR0trUEliUDROR0lrUmdX?=
 =?utf-8?B?MDJ2ZUFRVm9hWlg4cldSR0NqUzVIMm5hL3BTZi9xa3FHTjlaZ1NBVUNudDgv?=
 =?utf-8?B?WE1mekFDL2NqQVBaSjAwVjlndkUxQVFERlZ3QXZBV0lrRHNhQVZIdWpET2x3?=
 =?utf-8?B?dUw2UGIvRjdNMnhnTmZ1amdWS240V1MwdWVTYnpNai9Bei9WQVVhRlBJcEZl?=
 =?utf-8?B?dktUeDhENVlobWVCS0pvS0RlVUJwdlRKK0U1Mlluc3hkL0JReXkxODlvb2l0?=
 =?utf-8?B?RVp0NDl6MVVVSTZ6R0NUMDgwSmVtaE9UeXFzWkZnWjJkenFaVEVTRS8xVVZJ?=
 =?utf-8?B?ckVRbXM1MlZJQlMxcHpWSXpuVTAwSVppdEpJNlpWdCtYQmFoT1IrWVNmYVd2?=
 =?utf-8?B?VmN2QU1PaUtEUEhPR2JudWZHc0xFNmEyYVJLZHdIS1FiTS92R3NFQmVHZ0d0?=
 =?utf-8?B?V28yTEVUdFlwelNXOUcxQ3pKWUJyOFBJUDc5MXBlbXFiSi9BcFRCRVFVY3E4?=
 =?utf-8?B?aFNHZmIrR203VjhwWHRFUGl3WGVOV1ZWVmRLbHI0ZGdDbnpoNWY1cmE3TjhM?=
 =?utf-8?B?UXFjZGhYS3l1VnN2VmxsZ0xaVnBYTHpDVHhqeitpQ1ExMTZKYSswMjJuY0Zx?=
 =?utf-8?B?djVpZG5oeFZ3Y1B5bXI5QnRHTkkvT0NQK1JLV1FNSHBYQmcwSkhadnJvaGVG?=
 =?utf-8?B?YTdyT0Vwb2tlQU1FV211dDF5N2xNSEdNWUxIOXhlekZadWt0emRLT2ZHdHRy?=
 =?utf-8?B?UjdlR0UwQSs1MjRxUHVWMWExKzJvcUN0UE5kM0FmWXhNcTBUTFhKQllMZkRM?=
 =?utf-8?B?eFdDV2JRa0FxM0YzQUd1ajgvUkU5WG41WkwyWjVibFM3WG5CRzBpb0o2OTZH?=
 =?utf-8?B?WVRQSDlzNTVaUWw0UVllZmQzWTlmMXpFcDBMRCtvZmVGUURNMmswblUxU1VL?=
 =?utf-8?B?MmsxTExzb0JkM3FwRkY0d3pmWTdYM2tjR2xZOUJ2VTEya09Ya0ZIdm1VenI0?=
 =?utf-8?B?YkZqS2VLbkJId1FTeHVldjVPM2pmY0JNdzRGUDV5Wk1Kc29nSlJ6K3Mxd2F0?=
 =?utf-8?B?R2RwMUxmRG5KcnNRRk9Xdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmhVQ2hLa1NXWlBNeUZsdkJzZEdYaTVmODV1dHJ5UUlUcEY0WFNRK21BaHF0?=
 =?utf-8?B?MVAzME5vUjlnc05jZ2tkdnk4V2RtbTVGaVFjN0dsRjlhaWUzZDMyNXViZERH?=
 =?utf-8?B?VTR2Ly9RZDdrQnpDTFVDOHpQa3VReHZoYVRHM3BaYWhZNW1WVm10VHNkQTVY?=
 =?utf-8?B?Yk4yckdFdGVLTlBUbEViWXN5MU1rVTFPT0FxZVgrZVl3TGg4MVBxV3RDTG5K?=
 =?utf-8?B?VlhWNlFyR211WVYwTXQvZjRXb0tpNmNxcUE2bVQvU0NNRnV4aW5tUXdxSXUz?=
 =?utf-8?B?c3F1d3FjdmhKQnpYVDFkcTNZeDJyVU81MzJJaUVMWFZJREkreHowWXBpcUx6?=
 =?utf-8?B?eElIRTUxTHU2ZDhiTzh0K21uMkt3cUN3UzN3c3kvSW5qZkVqSndzQXU0aU9o?=
 =?utf-8?B?ZHErclh2Q2NnM0JkKzFOTjhJamtYTWpFQzBFSGVIOUREL05lMVhmN096cWJx?=
 =?utf-8?B?KytCcG10S1NZN0hrWmVXaFA0ZTNIRkt2aThlSWdwVDhPUDMzR3VjaGl4cWJy?=
 =?utf-8?B?b0ZDUnh0L3pCeUhyU3ZhRVVqZEtUR05yVmpSeE9wRHUrdVorSnZaakpZWkpV?=
 =?utf-8?B?bXdnTTBvVDRtbnZudUhJQm1oRkRJQm9aUE9jMUltNVI5anFFbXB5Mk9QSVBt?=
 =?utf-8?B?MzBWQVNwNWFMZTR5NEVLbnd4eWNKbE5yK1hEdW8ydWlaNlR5QVp1eWxQbDYy?=
 =?utf-8?B?WGluTFU5ZWpJSExINEhVZktsSXY1Yk95RHdRWWR6NXE1Q3dtaXFmQTRGdVll?=
 =?utf-8?B?ZGl6R2hocWJjWSs2QnFodGFPcTlBTUhIWURwR0tHS0xaUkt2NlMyY0FBYk0v?=
 =?utf-8?B?b0JuT3NJUGttVlZOMmdBQ0h3cmZMVjV4YmRMK3UxT01kWWxHbGhLeCtZSWhw?=
 =?utf-8?B?djRhc3NXZlFkV243UnVzT1UvY3drYU5zeDU3R3p0QXNsT3ZGM3JPTmZpamJv?=
 =?utf-8?B?bFJrZWlEeUVkdmU2dU80NWJwTFVIZGJvSTYvTzRvcTBCWWdOOHZYVEVWbnF2?=
 =?utf-8?B?b1U2VmxrR3lGSFcxY3dKM2tlY3RjanZnWFFWNUUxSHByNzdhakdFZU9mc09K?=
 =?utf-8?B?dTdZQVlscERMSUNrUk5GeXZaU3RIaStkdzA1KzRsZnFlNnQrR01NSFBrU0Ri?=
 =?utf-8?B?d3poU0VhcEFpV0p5Sjd3a0tpMVNuUlYwclA5eUJ4ZmQyMkdUcVM1cXFlQ3BC?=
 =?utf-8?B?am5mWU5VNkZNbXNDdWk3cCtsNHlSZ0ZaUmFEVlRWYUxLOWxhemlIbFRGT1Z1?=
 =?utf-8?B?bG9nZ2hLMjF2WWNkVDlQMzZ1TUNKbzIyNWNMaEp6cGxUMHEySGV4ZlNBcmpS?=
 =?utf-8?B?V01rYWlia0J6MWtzRC9LZnRhMk55ZUh2L2RFcVlxZmg0VzgwTXROWVlWb2kv?=
 =?utf-8?B?ODFPVStSUlZNR1hVMHBWSlZDcWhRZDJGVEh2VlVkM05yL2R6QjBMU0tDeGx4?=
 =?utf-8?B?TkZ6dVkxVFNVbzg2eUdhMTJEQVBGaUNmVkdwaGEyVXdFYmpsUENua09xUVI1?=
 =?utf-8?B?azlRWEd3bmFlaFlsOHI1U1AyNjliY3Z3bVFPaHNSZ0gxMGYxUDQ1NStSdkxK?=
 =?utf-8?B?K3B2R3dlaFdhUWt2MWgyaUJ1Y1hhUHBIQkdOU0FBbXJsTXJ1dkhKYWRvVXJU?=
 =?utf-8?B?MW1LRjZYbitPUTRlRng1VFp2MG1iZmwyZDFzeWJaclZzM3hWV1pVSExLWEZy?=
 =?utf-8?B?ajg3Z080SGVjalRzM0lTOTNYTVMwYmFycVNLbFVBNGdaVnViWHRHUytENlhD?=
 =?utf-8?B?eHVqK0I4TUdBUFUyVXZOaXIxVTc2Z0NkcnJuL2VyUy90WWFkVWN3dlZPdHE4?=
 =?utf-8?B?K0VxbEVaWG1Eb3p1R252ZnZmWWlsU0xzZ2lWWFBPQmI5Zk5KVUkrVVZvSmNS?=
 =?utf-8?B?Ny8wT2FwWTd0eTgxTE03VXZVRk91eE8rOUl2TEJ4U1VtUUlGaGpRdHdsZVk0?=
 =?utf-8?B?YlgrdTh6K2RnaUJLd01Ja0M0SWR3YnVlQmVSc1RIc3pseWs0REQyam5UYVph?=
 =?utf-8?B?ajk3Sm8zR2RWd09laWR5UU41OWtGSHVYRWwwdkhQa2pNRWJNcm5UaEtOV3pR?=
 =?utf-8?B?VFpRQU8yNkdVR0Z0Z2ZxaFBqakE4d3FNbWo2UFM1ZlZ2QkdmYVRlYXBrcU9k?=
 =?utf-8?Q?TidEc8fL7Emb4I4hqoK/XhziY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31c679a-7524-4c3c-9742-08dca5a64e64
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 14:48:07.9957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHBAbjmVV5OskYg/i949WnYAWYYEs+RhtyU8L0VQvIMNGOoA788YyENR6bj4pU6gYIHy+uHLdWq4qDEy1RiF8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4272
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

Hi Sasha,

On 7/16/24 10:24, Sasha Levin wrote:
> From: Tom Chung <chiahsuan.chung@amd.com>
> 
> [ Upstream commit 6b8487cdf9fc7bae707519ac5b5daeca18d1e85b ]
> 
> [Why]
> Sometimes the new_crtc_state->vrr_infopacket did not sync up with the
> current state.
> It will affect the update_freesync_state_on_stream() does not update
> the state correctly.
> 
> [How]
> Reset the freesync config before get_freesync_config_for_crtc() to
> make sure we have the correct new_crtc_state for VRR.

Please drop this patch from the stable queue entirely, since it has
already been reverted (as of commit dc1000bf463d ("Revert
"drm/amd/display: Reset freesync config before update new state"")).

> 
> Reviewed-by: Sun peng Li <sunpeng.li@amd.com>
> Signed-off-by: Jerry Zuo <jerry.zuo@amd.com>
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
> Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index f866a02f4f489..53a55270998cc 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10028,6 +10028,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
>   	}
>   
>   	/* Update Freesync settings. */
> +	reset_freesync_config_for_crtc(dm_new_crtc_state);
>   	get_freesync_config_for_crtc(dm_new_crtc_state,
>   				     dm_new_conn_state);
>   
-- 
Hamza

