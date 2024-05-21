Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341978CB3F9
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 21:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B44710E752;
	Tue, 21 May 2024 19:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b+UsNRJh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2064.outbound.protection.outlook.com [40.107.95.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226AB10E752;
 Tue, 21 May 2024 19:04:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4J18LMOC5Sn2QnoTaq7k3HdoP342OVbQnXRfpkA4pxN1vGuSCjX9icBDaL1wkf9VhhgK85TEBOFHwHmsv4vgXadHYzZRWrrJEzFU3FhvkqYHfsk/mjpm8CxVXIIQc3/fUYNkQpHRUjLU6zL5CPK4Xae5+5O0EP89oTk7/kaJBYN4K+phSHix7Kn0nf+2yxyrRN5lis1JphW+bVNIMhzUp7DS2KgyrPkEnrFxqaq8UlkO/nJadeSxV2dfNCYopjYsDsSIRus+9MVzadEWDfwARg02cbjm4yOq9NWU7fYSxSmzrUANazgnASSV6Ljc1GbV6xFWf2uAvENNiIZP2jfPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqCQoH+cH8laJp4LOdYfB91k8nSbzCOdASW+yxBqb/4=;
 b=IEEwlKnR980a+fsZsLMIIkWOeKm8QwXK6e+AIYsFulOSvvFbIgmtFbbAeiBIuNzmBmfn4S2UmD8e86/yJHtEKpyvP4FE/FWuHk83CMOOWH8q3YFPvHmelSEcM1srxkftru3VbCeAXUFBUFZ+6g6nqWuZT3GBGzL0JtZfhvCgLiL60kR1Xup/2yGEajQmdatGMp0dvgt7ykIJqNu60cPFo0tVqGmrCA6PfHjA9eTLGQX//o4GakJMcgGxVFSsazMuTCgaPNggpReEIORW4CJJy0GMRVI2+cyMe6BANF974EXeWgqBqaHd8vSBO5Y7gXIH7p184O1besmDdlQmmckzQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqCQoH+cH8laJp4LOdYfB91k8nSbzCOdASW+yxBqb/4=;
 b=b+UsNRJhpJbG/1y20Ilw+R9xTMUpoxhS130IxR5XP2Rzskk5FbPgjd+knDI0IjCL3x4xRNjqIUxsLKE2ViseWPlBhfYHknK+C29KwtMCsMZYfmEFFyM7f9lf3l4Wy8ytjyWhk1C8nzinj8nwVdMnceIZvjKpbSnYEO4oAkqTuEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7537.namprd12.prod.outlook.com (2603:10b6:930:94::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 19:04:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 19:04:08 +0000
Message-ID: <17782a6e-db84-4c20-874a-342b9655ffc5@amd.com>
Date: Tue, 21 May 2024 21:03:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: Add pixel encoding info to debugfs
To: Rino Andre Johnsen <rinoandrejohnsen@gmail.com>, alexander.deucher@amd.com
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <fa885eca-d7e6-415a-8a08-9103b002c6bb@amd.com>
 <20240521051140.30509-1-rinoandrejohnsen@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240521051140.30509-1-rinoandrejohnsen@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: 49546291-3b42-4a6d-7575-08dc79c8ca80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFczYmx6UE1RTWlHNU43TDNQS29OMWNIczJva0grMlVZUVpjWjZLMUVGZ1FM?=
 =?utf-8?B?NzNxcXo4b2RXbjFxcWw3aUlCVWZQNXlHY2trcnBRWUhFS29ibER5dzNDeXR3?=
 =?utf-8?B?OE54cWVJallyb0ZXZy8xTnRFeVJXNG5oR1RGL2VENU1SNFhvMnZqREQ5MTYw?=
 =?utf-8?B?aUIzZmFNa1hKc2R1cS9yanBVWWNzR0NMRUp4M1lQeHZwaGlsNDVrU0ZzR2x1?=
 =?utf-8?B?aHZpb0F0QTI2aXQ1K2hwd3V4SDU1NEJPWVdubE5IdDB6aUlWSkx4UWd3MUJF?=
 =?utf-8?B?OGkrVVAxZGJVekJVR0g5WnhOQmdEc1BiMlV3enZXR3ZTT3VVd2xUdFpYKzFw?=
 =?utf-8?B?SG1YalR5enRVbWMzTzhOSDRWU1I2R0N5YzJ5Y1MwT21FNnNOdTBIREtRK3Rl?=
 =?utf-8?B?azlLTEhLekltSE9hSGZNWDFkdjVLNVM5Z2dZajFlSDZRQm0yeDN4NXAweHAz?=
 =?utf-8?B?MkN4ZXhVTit4VVZ0SnJidEo2VFlkVG5obmdrSG5pSStRQ2JFR0ZQWk9Ma0I1?=
 =?utf-8?B?K0lpMlpmQjJ4K1BKTW5FSVZzczBaQjgwSmdXcmsxNjU3VHBTZU5KdWt0azVE?=
 =?utf-8?B?VVVYWWZNNGJNYUVwK09TMkUvSldaN0VLbkc1VktxY25BVjRHT0hXS2JIRkU0?=
 =?utf-8?B?aHEwWE1xNzV6a0FoSTlWTVlEVnA4UHE0ck45bVdkemRaSXplcFpRME1UK2tr?=
 =?utf-8?B?dkRLUXU4SVgvWjJtL0poTmgzNGNRQVhRa3YrK3ZIUEhQTCthTkZOME43KzZX?=
 =?utf-8?B?Ui8zYnJxUi9CYjRpYUJpOVdOaWlNVHJMOVN5MnRESThKQ3JYaHozbWo3RDlL?=
 =?utf-8?B?RE5GL3U2U1RDcDlkVGRoNndrK2pFRGU2aHdEUExBcUVuTC9lK25wdEJERDhp?=
 =?utf-8?B?VDhKUmY0dkNpSndKTlEzTUZpck5lV21Jc3g2WElERWF4dm9aZ2RkTm9QQnZy?=
 =?utf-8?B?Y0tJTSs0RzJWa0FQWDU1c1JaVUtWZ0crS0lEMnlVd0c3blNzdWVLcHhaazFu?=
 =?utf-8?B?S2JGWnhyK1FiMEVqTjcvZ1MvRTRWSGxNYms5VWdJU1lHUGpCSUFzM1pPTitI?=
 =?utf-8?B?ODF6Lzh3LzFXNml3ajhwdEpjQXdyd0lJNUxsNlZwa205S2FXNkRVUGhrQTlU?=
 =?utf-8?B?RmFkWDJ1RzlHK1p5M1RNOUJxVlo1NWltSHAyZEZlU1NwUkI4WFMvb003aDJC?=
 =?utf-8?B?cktGNW9DQmhMU0VqWEpGTE5PMzM0SGxoL2dIdWxSQk54UHVGWldvOUliKzUv?=
 =?utf-8?B?QTgrQS9WdGVhazZ0RlJzL0VXT1ZWTHhvd010OFE1Z3hhbXBremVVUXY3Mklp?=
 =?utf-8?B?SlNGTHI5a2cxdUhjNzdaM2o1WHorQ25ML1phWXVnMjNVM1pqVnlhOGlPVHhm?=
 =?utf-8?B?SWVndlQ4YVlNdzJIbVZmTExBMCtMVHpiWmlJbFBIbTFpOVBUeFU2TDNaV3NU?=
 =?utf-8?B?NUNEZ1oxc2QvSUxmYU9EcDk3a2ptMDYreEpnVGNvQzJKL2R2VllsUUlsdzV6?=
 =?utf-8?B?bXlEbjhsV085TEcyVUZJczhiQVFqSWl5bjVncVFSN3NSOHNzUU1EN0dPckhC?=
 =?utf-8?B?ck9qUFZRaE5nUnpDWkJVN1krNkdya2t2L0pReWJkYWJRVUNEQWJUdlBJZ0Zs?=
 =?utf-8?B?cVBjbU95ZDlFNm1tQXNkVEJtdUZ2ZFAwMFh6aFdlemtnMGtmcklVSWRycUYx?=
 =?utf-8?B?OWRPVnNFR0s0RUtGcWFJUE9BWmFlMnlUNEFjNzBmc0M0UTJPSEtDU0F3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlhqZGxtSC8rVEFQRTdlQU1wNXB6Qy9FNnZYQzd1YTB4N3VBbFRwUG80N2Ru?=
 =?utf-8?B?NS90MHlOdk9GQkw4Y0V4dityWHBkM1N0UWUzWUVTOUk5eWgvT05VRnRVRG03?=
 =?utf-8?B?Y2p3VkRjMkNBMnhtUU5qdCtCdlZwamtCUU5zeW43RXZQQXRTS2tyUkc1RlBa?=
 =?utf-8?B?WGVIZ1NGNGhnQUlOMC9samQ3Nnp4aGVpbEZVZ2tIK0pkTUZwMUQ5TlFFd2Za?=
 =?utf-8?B?WFY1clMwaW1wQWlCK0ZSMmF2b0gzT1ZpOU9YenZuanZlazc3T2s4TStaYXZ0?=
 =?utf-8?B?cFoyeUFqT01PNytOSG1WK21YUDdxYU5vNzJWNlg2azVISjNTNWNrOHMxeGZX?=
 =?utf-8?B?a0g0cDRZTCt3SUVZUGNQSEY5eUJJeklEMFBBdVVUWVVReHZmeEJObjFMRlgr?=
 =?utf-8?B?ay9xRU5OZWxMUWRFZXRxZGpMYWtFNzc0MEY3RUVqSjkwdFRHbmlOdDIzc3pH?=
 =?utf-8?B?TWlsRmlFamk5QktIZXVpZXMrMGpsYW1HMmtPcnZubkhleEwyTjRrY2V6MVdU?=
 =?utf-8?B?NXNhZ2x0TTFLRkFSbXl6S2JCblQvdm5aWUVIZE90c29qKyswNWg2dlZ3cXRt?=
 =?utf-8?B?WEI5L0RUTVRuRDladWFuY1kyeWVJVm1keXBQd3lIaE5qeDRxQWZTMkpXMEd1?=
 =?utf-8?B?U3poalNUQkFUcGZQc1hrUUVnOU03RUFKU3pySEc2NDJsZE5STWwvd0ttWmxU?=
 =?utf-8?B?bnZLVk9VNGlRN1h6dlVwc3NhMjJQVGNUUlhaZWNMMXBRQkszUDBZSXJyeHZZ?=
 =?utf-8?B?WHBYWlBSVFdsRWxINEpNS3FtYURnOTBrTnlhazVad0JXclc5Ylp1cFkweThZ?=
 =?utf-8?B?L3B6bDlYbUxiZmZZdWdJaDJhbGkrZUYveE1MOTdUVi9YUHQxQ29FcExPQ2tL?=
 =?utf-8?B?L1lMemVSUzAwM0NLQ3REQW5PbkhLRmFPbHRoMGVaSVNpUW9PV0x3b00zcmI0?=
 =?utf-8?B?ZzN2RUFoRkVERWNEVlFzSUR6bkFRM2VhdFRxeUxpa0ZCSWdqVkdHSmhzSjVl?=
 =?utf-8?B?SWxIZVh0aTZIVExlWTN3akJwc2hDdlVwdkRCZUFrVld3akEvNG1sOEhBclFG?=
 =?utf-8?B?cW9yK2FCMTRmUVNicXU5cEpoTkk0K2I1UnVEWkRFci80cnQ1SkdPenNmMVlo?=
 =?utf-8?B?NU1uQ04rdjNzVHdIVHFaVnROYTJEYlhiWDVwUWI1dnNwbCtWUjdVQk8xajNZ?=
 =?utf-8?B?SzRUalBsN3JzblFiTVdGLzlKaUQ3OFVTU1RqaVZVL2dxMEdHY1FuZFUycW5v?=
 =?utf-8?B?Y2F5cUQ1THByTDdBYUtxb1RMeFRtK2oyVzZZWm5xY3lTcUMyV0h6SVBGR1k1?=
 =?utf-8?B?alJHWnE1ZjhDUXBkSkh6VHl5cGtRWDRJZEVkZ2QzVTI2ZHlmS005a2QzMUNp?=
 =?utf-8?B?cmpaQTJCMzEvRlg5Zjc2a2NzZ2dhcHVpVDRpUWtnYWpGcGlKdWhxSWJPY1Zu?=
 =?utf-8?B?eWZXbTV3emplcUNIWWluTVNiZXptR01WYWxsRXN1ZDJROEw5QUlKbkJBL1hJ?=
 =?utf-8?B?dkZJWkQ1dC9sUzBKVVpzYXE3cW9nRHEyQ3FNR0JLdm0rZlVDVEFQSzNvc0dk?=
 =?utf-8?B?WEpYcGlUQjNYdE1VRitZRmNKZDA5aGZYVmR4aHBFbXJxcmc4RGJaaEJncStk?=
 =?utf-8?B?WHAzSUlRbGFHeldJWHdjTW5ZSGlWcHNWVWFDN2hQM2hkbU8vWUhVZVJBUnB0?=
 =?utf-8?B?elpsU21BTnhWdTVsNFlvMDlKYXVQVlhQcWh6VXRFeGFwRnFLMHBoU0h1Mitz?=
 =?utf-8?B?TldjZ1VhWTNBL0VUWTRoNE1pVHNGZkZ5UVp4U1NMWFRGOUtlbk1COFhIeUlO?=
 =?utf-8?B?TVlJYXBUTGJSalRGeWpsYWZNdGw1bmxzU1MxcDBxa2t2SDlmc1RNUzlUTjY4?=
 =?utf-8?B?bExubTl3YVIycTlkMWdrRGwzVEtQbE9YNjlIRXh0czZHVE9VZnFzTG1veWpQ?=
 =?utf-8?B?UHpWcUJzUHlEbUxtb2JubTlod0lIVmg4dnRJRk0wc2U1dkQ4dUxWR0pPdGdj?=
 =?utf-8?B?eERCQ1VpY2ZMUmMxQVNENU1LU2FHSHFnQUJ2NEhiL0RLRzlzOFo2aWYzZVF1?=
 =?utf-8?B?anRDWnRZQ1N5MU1kWXd3aHpoQ0dTU0dWU1VvcE9jRmVONGNxb3ZiWUNicUM4?=
 =?utf-8?Q?lUN9SmjTOQewbRAvY+iVoft9r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49546291-3b42-4a6d-7575-08dc79c8ca80
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 19:04:08.0629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZ3owDklt4l2REPplDtJyw3rsqgIVftoqZ3EGXPwv32lwkVu7UNTq52o64u57KRs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7537
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

Am 21.05.24 um 07:11 schrieb Rino Andre Johnsen:
> [Why]
> For debugging and testing purposes.
>
> [How]
> Create amdgpu_current_pixelencoding debugfs entry.
> Usage: cat /sys/kernel/debug/dri/1/crtc-0/amdgpu_current_pixelencoding

Why isn't that available as standard DRM CRTC property in either sysfs 
or debugfs?

I think the format specifiers should already be available somewhere there.

Regards,
Christian.

>
> Signed-off-by: Rino Andre Johnsen <rinoandrejohnsen@gmail.com>
> ---
>
> Changes in v2:
> 1. Do not initialize dm_crtc_state to NULL.
> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 47 +++++++++++++++++++
>   1 file changed, 47 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 27d5c6077630..4254d4a4b56b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -1160,6 +1160,51 @@ static int amdgpu_current_colorspace_show(struct seq_file *m, void *data)
>   }
>   DEFINE_SHOW_ATTRIBUTE(amdgpu_current_colorspace);
>   
> +/*
> + * Returns the current pixelencoding for the crtc.
> + * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/amdgpu_current_pixelencoding
> + */
> +static int amdgpu_current_pixelencoding_show(struct seq_file *m, void *data)
> +{
> +	struct drm_crtc *crtc = m->private;
> +	struct drm_device *dev = crtc->dev;
> +	struct dm_crtc_state *dm_crtc_state;
> +	int res = -ENODEV;
> +
> +	mutex_lock(&dev->mode_config.mutex);
> +	drm_modeset_lock(&crtc->mutex, NULL);
> +	if (crtc->state == NULL)
> +		goto unlock;
> +
> +	dm_crtc_state = to_dm_crtc_state(crtc->state);
> +	if (dm_crtc_state->stream == NULL)
> +		goto unlock;
> +
> +	switch (dm_crtc_state->stream->timing.pixel_encoding) {
> +	case PIXEL_ENCODING_RGB:
> +		seq_puts(m, "RGB");
> +		break;
> +	case PIXEL_ENCODING_YCBCR422:
> +		seq_puts(m, "YCBCR422");
> +		break;
> +	case PIXEL_ENCODING_YCBCR444:
> +		seq_puts(m, "YCBCR444");
> +		break;
> +	case PIXEL_ENCODING_YCBCR420:
> +		seq_puts(m, "YCBCR420");
> +		break;
> +	default:
> +		goto unlock;
> +	}
> +	res = 0;
> +
> +unlock:
> +	drm_modeset_unlock(&crtc->mutex);
> +	mutex_unlock(&dev->mode_config.mutex);
> +
> +	return res;
> +}
> +DEFINE_SHOW_ATTRIBUTE(amdgpu_current_pixelencoding);
>   
>   /*
>    * Example usage:
> @@ -3688,6 +3733,8 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
>   			    crtc, &amdgpu_current_bpc_fops);
>   	debugfs_create_file("amdgpu_current_colorspace", 0644, crtc->debugfs_entry,
>   			    crtc, &amdgpu_current_colorspace_fops);
> +	debugfs_create_file("amdgpu_current_pixelencoding", 0644, crtc->debugfs_entry,
> +			    crtc, &amdgpu_current_pixelencoding_fops);
>   }
>   
>   /*

