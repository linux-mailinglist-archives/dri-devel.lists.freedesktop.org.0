Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1682A9EC0B9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 01:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B6D10E057;
	Wed, 11 Dec 2024 00:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GBgUjrsu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DAE10E057
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:28:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4JyNDH2Ib6A5wbWgJsFuyTxq8/Vp4fAqPdpL077xdGnH4yYrp8xJqBR2hxnC8cEHCurwSx8mhGdXRPoTQhEgjxQA7mWMVyoU61AhxB3PgcTKnT1Rxess5Ka3jNDCk03RG5cSjVe+2IsiML0M/m986+OF2skp4xW5hz/BUHMtXc3Gi9bNBUFzfcCHvoXYxG6Zp59sZFVWoJdWjO3e4HNgjgwT8x46seKpQAOodio3UAnNMUOBawru2hgypr/8DaSZeSnd0czVQScGCRT6Go197lOpSMa7xiDaeuiPckpbLlzyVNwzsgz4O/UxvInMwQIsglOUtEBquwkKhspY/HsjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0xMav75OJkeDdaHrzb9Eh7bO9kcAHWbke4T6SUSPOU=;
 b=WAHcozogLr2UnZrEkC15+J7QyNclwZHla4uCecAOI0LcS+sv4okCAJNP59pvM6fNiO9FSwiGlirAZ4K84f9EyG86QFxjzOO05z06LnjvEByFSJyz7PjdjejjoFJR87gIp9XLWQ6Z5U7TT6xUaTNsmoOr+5pApGktQlJl4/Duz3W/JTiWuurHZ7AS0ubZkvCQSbn6nQMtYrpYhAMUx0nqSRkrIdqs9+mgaxaS7zyTat9rypp8lPv1VoE6Z6tl2gojmoEfOd1pDZL1PjUEGjXruAmqNZogacCv4RyMiReUkN78dfod4Aw/UJwivX8lH+dFvHxC23qJ2lPSC/4tsA2hwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0xMav75OJkeDdaHrzb9Eh7bO9kcAHWbke4T6SUSPOU=;
 b=GBgUjrsuGY4/qtgMu6ym5o4ht/7oMpoV1cJWf2k4GhGSvR6h9bCD8s/oSY6v38sVnPOn4fG9jp5QJ8JmtpJVllJxD5CekUHQN+9wU+ROWCZCmWUkpxYAGd+2DiLlgAleNgd1JGb13b3aJQT39JayUAzITHUggMhO2FK0nE5DOU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH8PR12MB6772.namprd12.prod.outlook.com (2603:10b6:510:1c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 00:28:48 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 00:28:47 +0000
Message-ID: <6efe4174-6317-4000-8bbe-66be4bab7d63@amd.com>
Date: Tue, 10 Dec 2024 18:28:45 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 5/8] accel/amdxdna: Add query firmware version
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20241206220001.164049-1-lizhi.hou@amd.com>
 <20241206220001.164049-6-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241206220001.164049-6-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:806:130::9) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH8PR12MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: 4facf445-7472-4386-d026-08dd197ac751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXRvaUwxaWN0ZlRab0gvNzhYZ1FLWmpBRENyakU2UHdkemRSR3N3MEdQZk1X?=
 =?utf-8?B?RlNjZDRMSnloakNiR1pnMTJaZURWcFlwdXVmNFgzU2xlbWw5amtSRklFQ1di?=
 =?utf-8?B?WW9zOURIakpvTFdrNTY3YjlLRUZacDNDNldIU042ZnVGNE1UekRWdUg1L1hC?=
 =?utf-8?B?WTM4Mi9iRDQ2ZVJpeGR4dzMzbXBpay8wUmM3SkFwWGxyazViTmcyRjB5NWUr?=
 =?utf-8?B?VTd2azFmb1dZVStjV3dwRDZ4MFVuRC8yMGpwUUp0UlpoYkdmaUpGMFNSendj?=
 =?utf-8?B?QlRpZGw0T2lXU2hRWkNIcm1Fb3IxZVFOM2o1K1pQMzEyQ1JKeVhGVnluWkhx?=
 =?utf-8?B?KzFxRzRBYzVJQWxUT1pPU2w2Q2gwSVc0akhJdTJkMEFLbGhmczY3Q2VkQXA2?=
 =?utf-8?B?bkMrMWU1aE5IOFhoSDlMWm45cmpCWWZqQkllT1JycnRwQTV2czZ3QXZUa0xK?=
 =?utf-8?B?Zi9aeFBQSGV6dmxrbXVtZGs1dHptVzBURGpISGFsZUxDbmYrVk02d3FwRGtj?=
 =?utf-8?B?a0RSRmF3SzdOSjdNeGJpbENQbnY3VlBXOFpQRWdkb0FkMllJT21hK2ZqdVdL?=
 =?utf-8?B?OGtXUmhmUzlYOHBPT1M0ZEVybnliUlpzRDY3ejZnK2dONW8wSDMyVVlkMSt3?=
 =?utf-8?B?Q2ZQWTFrZmFBM0dtTmVoSE91YzdIWEpVd0VlK0JmT2p6T0hwRFBDK3ZRWURa?=
 =?utf-8?B?UXA4RVhDM3Y1QVlYejg3UXErSDdLbXNPQ3dSVnJqNkRQZlFNalNXZTl4bmps?=
 =?utf-8?B?cXFPNTEvV0tZckgzSnM5YVllUlNkVE9qMUtVL0dMWEx0N3V0ZERiVlFpUHVH?=
 =?utf-8?B?YWJaZ3c1UXA5YVBPQmVSbkJESDFNUU9JUXJWNjJKSU1rNy96QThLSE1pVFV3?=
 =?utf-8?B?bnhGNEFtWFdZWjU4bzh3RFNRT1FMLzlBUGl0NHR4MjZPOU16UXZtT2pieGRI?=
 =?utf-8?B?VDZTZkYrd1l2Z2FUYzdQQ25YZ3VzOTF6SC9NamI5amtMd0RuNlFyV292Ky91?=
 =?utf-8?B?RzY2UXN0WGpUaXZJR2dJOTU1WFJqUHExTXNGUUN0R0dHWjJwRWgvUFFTeGkv?=
 =?utf-8?B?Qi9aWXZ4bTRuK1laaUcyZld3WmV0ZUw2dTE1MUJUWHB0V01rU0UxZit5bGcz?=
 =?utf-8?B?eUZxdzhpQjJ5VmVpOHU2ZkVvMkEwbnNuNGU5dXg4U2JDNE1uTjV3Y0xIUDgx?=
 =?utf-8?B?NXhZKzJlbWVuODE3cCt1RG1mRHAybGFzMVorU0p1cWRZUmhoanYxUkR2NUw3?=
 =?utf-8?B?N0QvYmFESmd0Vys4TmFoZzA3WlF4NFUvZG0rcTd3RmY4ejA5TEo3MC9kcGpq?=
 =?utf-8?B?RWpYNlNBa3ZFZXZhaWQ5N3pYb3p5ZmFWbjlMSHlFMVNGQ0JhQnRwSjJiRmc0?=
 =?utf-8?B?eE9hVEZJdWtyYjBmaEpINnEzYzdscHFPMkNyWlEyRlk2TE10NUNnRlBXZTV3?=
 =?utf-8?B?bVZtVlVQSUVpV0dpSTNXY205a1VWR3g1ekhmV0xtWktiamc0ZFpPYUl1M1RB?=
 =?utf-8?B?Z1VSdm50UzlYYm5iMXVEbzhhd1JiWmJvOXJOWjBkaysvSGFYL2tINGhXdEpF?=
 =?utf-8?B?czhQWUZDNWY5MFY4anFQZFdXQlp6Y3l4TXFDb2ZXMUQ5Z1FyUVRVT1dzK1NV?=
 =?utf-8?B?TGMrVXVDQkZEVFVoSEVyekdjRG9HZjNiVnpDaEpqVTZxZUtGNWo4RmhZOEZt?=
 =?utf-8?B?cGw3NnNjMjZPVGJJTFhhanFwZVdvTnVNcXBETE15RHUwS1kvSGdHQTJYK0pX?=
 =?utf-8?B?ekt1dE1MOCtBcXVZSjVXbnRCNHk2YjEvbHp5WUV3N1VPUnR6U3BXbUJwZHl1?=
 =?utf-8?B?d2lkZXpTRS9WY2c0c1ZjUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTJ6VGpya0N5ZjBpQVZSbkdYZmVRY3o0K2txeG5YeGc2c1FUTVhOU2N5QUNs?=
 =?utf-8?B?NE9WMmhxS3JmVTVhOWRDM3gzZjk4bzZzeXJxOTUwTjByNDMrMWI5TEhZR3VY?=
 =?utf-8?B?NFVSQkUzZGhEZTFub1QvVG5YTjZKazNrUXQ4NVhxcDVjdFhBL2lxTU50bCth?=
 =?utf-8?B?TWprOEV3UHFINjk3T2pVQ0VWUk9ITGh0ak94TzFFNlVBSGNnaWFkb3Jvam83?=
 =?utf-8?B?dm9uSlBHUVpNSTZFOXJHbTArdTFXbmxDVk5Ka1V1UHVZeDlhb0FFeHBKdUxw?=
 =?utf-8?B?cVJaamVPQWd6SDVqS1pvNmIycFpPWXF4eUl3bUxlckE5c2hSbnQwL0pTK2cw?=
 =?utf-8?B?TEZLVW5KZytyUmhIK3pKUGJUNTNrZVptcmxRdW1HQlJRZCs5eHBxc2VOWVFn?=
 =?utf-8?B?ZlJGaG0wbXNTb3Y1YlhBUFZJK1kvL3JEYkhpaHNEcVRaRWQ5NWNKVDJwR2I3?=
 =?utf-8?B?TkxOUitpZ0sydFFtL0pMVVFiN0x4UG1yKzd3UDF0NG03QU8zYWIrM1ZOcCs2?=
 =?utf-8?B?aTRsWTR4UzF3ZE96NkxCcHFOdXA1bDkrR285blJHNm9TLzFSUXQyYjN2N0k2?=
 =?utf-8?B?aFcyY3JJcm9QMTRjV2lDSE1LR2VhUDdsc3Q0VDEyL081NjdUeW9SZ1MrM2Zj?=
 =?utf-8?B?dVE1WGZJVmFrR2NCVTBCdEEwZ3BERStJY1VoV2tpZ2VUV3VlUktnZ2Y4ZEIr?=
 =?utf-8?B?a0hBcENnTFBnN0RmZS9iY08zekdMMW1BakpOVGhRTDBUdXBmdGxNM1ZmbTcy?=
 =?utf-8?B?VGpYMW5WRGQzM0hRK2JsTTNVWHM5SGRZVDNIQTUxL1B1bysycEtRRkE4SjND?=
 =?utf-8?B?ZlE5RVFGTnVhZTgwT09yUHBJRk14VkZFNGlqVHpkQXhldDYxbWRUQ3habVdM?=
 =?utf-8?B?ZTNTSFlyemtJVVNuaTAxLzdvUmQzV25WT0QrcEcvc1hXYlk3RXlpZUVTVjJi?=
 =?utf-8?B?Q0hPN2FXbnRxaWQ0bUpscTRmTjF5Ulk4NlRldHg5VHZnbHBoVGxrSGt5YVdl?=
 =?utf-8?B?VnNzc2F4TGh5d1JzOXdWVTkzbjd2MUZQRzliM0FIQlhtU2g5dXp0MlE2UFRy?=
 =?utf-8?B?VWpXQnhhOXlVakZOVlNKK1lTV1pnZDM3dlEwaThsb2VjamlQc1c5UlpnanRW?=
 =?utf-8?B?dFA0dFlSay93N2R0eU5GTFovWFlTOXdqbXhpKy9TTEhqUHJ6LzNiTkpham1Q?=
 =?utf-8?B?dGNQRzVub1kzL2dIbVhmOEVHTXZCa3pjVzNOaEpYenNvMFJiUUhHVHNxQ242?=
 =?utf-8?B?NDJXNEdDTk5ZYUZXVVphb1RnZk9IKy8yTWwzaE9IbDIweUk3V1lFOGNFUmNm?=
 =?utf-8?B?Y1h1d2dFOVJtNTRJbTcyZXVtL3Zxd2d0RFV0Mlh4dmtLT1MzWlBramtJM2xs?=
 =?utf-8?B?NjNzOU1pVGdtY1hFTGZ2UTk1YTRzSHF4cUhLQkVWN1doc01CTkNhZko4STVh?=
 =?utf-8?B?bVpNdE1YUmk1QVRnVDJ5YnlRUkxyNlFqbnY5VitNVUVUNGR2RmJjWTU3NTky?=
 =?utf-8?B?UnNYNHNwTWNnNmlMaHhvSlFxdmkxV1ZleVpMWjlVYnhVSjExU1h1bDhWSGRY?=
 =?utf-8?B?NHM2RTdEai9rMHhTNEJIK0NrWldGZUw5cytFbllXNGk2dStTVlRLR1EvbG1J?=
 =?utf-8?B?RzJ4WkZBZExRTWpkT3dVdTBGWFQyUllTWVBTc3N2TTBMSVRGVXFTYVZwU2dO?=
 =?utf-8?B?TVUxNVJMVVo5Z09EaGFiMFFqU05rbHlBdTIxTUF3ck96RHhPWmhBZTRNV1V2?=
 =?utf-8?B?OGF2Nys1M25oSHpXcVJUa0MvbWhPMjVmYU8zOHpwU0V6dnY0SWs0bEZLbmJX?=
 =?utf-8?B?Q3dsYWJCeXJ2U2dHUDkwVjRERnFUWnZNVm1QSjZpdGdHWHM0T2NhK3ZiSUY0?=
 =?utf-8?B?dEhLWk5pSDBkZ2FRSjluWkxGcDV4RXJwc0R3d2hGWGRMTlZKaUxsY2ZzMWFm?=
 =?utf-8?B?MjZwcUtoTTEzTkdSNEIzaDI2KzkyeGVpaS9yN1BhbFcvQkp2WnRrUVR5SFJI?=
 =?utf-8?B?cEl3QVE0VHRDSDdzaTVKNGp0RnU5VVRlcWgxM3JHRytQVmxlNGJ6eG14MUNs?=
 =?utf-8?B?Q3ZlbGNsQ1o1a0UwM05PcEFpeSs3WTNINjlnZjRibC8wOXFEZFYzQjNjRXg3?=
 =?utf-8?Q?zdVHZse/RhWHjo/3xPTG56vaA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4facf445-7472-4386-d026-08dd197ac751
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 00:28:47.8702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bD/jZg47hKq2TzxoreNwC5vvEIGB6wRnQ/TF+30XZNFKwln2BGxARc7Mdo288EmN+nuhkAD/97vMR5bI6jtj8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6772
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

On 12/6/2024 15:59, Lizhi Hou wrote:
> Enhance GET_INFO ioctl to support retrieving firmware version.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_pci.c | 20 ++++++++++++++++++++
>   include/uapi/drm/amdxdna_accel.h | 16 +++++++++++++++-
>   2 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 1c8170325837..83abd16ade11 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -640,6 +640,23 @@ static int aie2_get_aie_version(struct amdxdna_client *client,
>   	return 0;
>   }
>   
> +static int aie2_get_firmware_version(struct amdxdna_client *client,
> +				     struct amdxdna_drm_get_info *args)
> +{
> +	struct amdxdna_drm_query_firmware_version version;
> +	struct amdxdna_dev *xdna = client->xdna;
> +
> +	version.major = xdna->fw_ver.major;
> +	version.minor = xdna->fw_ver.minor;
> +	version.patch = xdna->fw_ver.sub;
> +	version.build = xdna->fw_ver.build;
> +
> +	if (copy_to_user(u64_to_user_ptr(args->buffer), &version, sizeof(version)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>   static int aie2_get_clock_metadata(struct amdxdna_client *client,
>   				   struct amdxdna_drm_get_info *args)
>   {
> @@ -752,6 +769,9 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
>   	case DRM_AMDXDNA_QUERY_HW_CONTEXTS:
>   		ret = aie2_get_hwctx_status(client, args);
>   		break;
> +	case DRM_AMDXDNA_QUERY_FIRMWARE_VERSION:
> +		ret = aie2_get_firmware_version(client, args);
> +		break;
>   	default:
>   		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
>   		ret = -EOPNOTSUPP;
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index af12af8bd699..4f15e53a548d 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -375,6 +375,20 @@ struct amdxdna_drm_query_hwctx {
>   	__u64 errors;
>   };
>   
> +/**
> + * struct amdxdna_drm_query_firmware_version - Query the firmware version
> + * @major: The major version number
> + * @minor: The minor version number
> + * @patch: The patch level version number
> + * @build: The build ID
> + */
> +struct amdxdna_drm_query_firmware_version {
> +	__u32 major; /* out */
> +	__u32 minor; /* out */
> +	__u32 patch; /* out */
> +	__u32 build; /* out */
> +};
> +
>   enum amdxdna_drm_get_param {
>   	DRM_AMDXDNA_QUERY_AIE_STATUS,
>   	DRM_AMDXDNA_QUERY_AIE_METADATA,
> @@ -382,7 +396,7 @@ enum amdxdna_drm_get_param {
>   	DRM_AMDXDNA_QUERY_CLOCK_METADATA,
>   	DRM_AMDXDNA_QUERY_SENSORS,
>   	DRM_AMDXDNA_QUERY_HW_CONTEXTS,
> -	DRM_AMDXDNA_NUM_GET_PARAM,
> +	DRM_AMDXDNA_QUERY_FIRMWARE_VERSION = 8,
>   };
>   
>   /**

