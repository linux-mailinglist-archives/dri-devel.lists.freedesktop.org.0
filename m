Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B42A34B9E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:20:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACB610EB58;
	Thu, 13 Feb 2025 17:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uGXomVe1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B31510EB4D;
 Thu, 13 Feb 2025 17:20:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOMMTsInTQVSUyQl6F0w8n2KK4Tuayn0ausVOX7BkkwQ91dweFeGCGgx8jWb7OuHqIBWg8//OiCfcSoV9b9dKKNR+dCP8gFqxX5nD7ynoeZ37S28UfzM3k3WQCqBlvtWp3fYcLTM39MPV5oUp3fCLWu1qqYdRAGMencgWk8ovkg94PQVv6QK/bUWNC/+oxEz3KhFpN1cH9NOrnpu5qz3ubShKO104JtZVYo+3tlvJmTrKtBy1Nk2qqShYadMkbXJwhgSeZXhDRQLN1vxWr2fCN3bgo8KWP6HkMdtfWaPFL0bmDM1m7QBwVcVrfAqVT3GWhFTbdLQum7CfRIsBNqjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtJ58qgNt7pBgAiUo/b/Q1nxwsIUF2S4ge1OvcULijU=;
 b=V2F89HOb0ZUJPhfDmB/umozYr+SZr4HFjyxL7OnBpocQ7BQaT6hOFiz1f+5OhCOz/WBGzeBzsxaB61srmsR0FBNbxTAw9AQbiDIPzU00vFVQz8hGCPjRqXW8h1GueH6FRj2+pU+S1rKQEzkOChUB0/3JWCyHL2odX2TUFH7Sn3dhooC61pchc1mkjx0eFojQk1Bs5b3Jihr/49uJ0+mi3Z/YxkufVeBBQLPrC4VdPJTycoCJzyeDW02X25tp+OI0Z4vT40NCktC1O/29Ppt2IMuFkmxad3N3+Fc7Zwqg0rvbkFcyJSNb41WtVp+2A/bWHqTgd5YsVnLpXKDrl2rKuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtJ58qgNt7pBgAiUo/b/Q1nxwsIUF2S4ge1OvcULijU=;
 b=uGXomVe1jo24JLbS48yTzEeYG7V/6oDfg/z+ITE9IW3aOt4XMdcy1sq2ap8SYx+jSvLMdihpgF+NLMqvqDaaaiJzA/6/J6pZpH/HszbaayrU/ocV+k/l/l1bSKtlYiZiDWvtbAEBGr/LfF2wbmQQfWiYkVsnAEt/l+oKCjJk8lQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 CY8PR12MB7681.namprd12.prod.outlook.com (2603:10b6:930:84::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.14; Thu, 13 Feb 2025 17:20:33 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 17:20:33 +0000
Message-ID: <912e1863-f1df-4fa2-97d1-54bab072a622@amd.com>
Date: Wed, 12 Feb 2025 18:03:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 32/45] drm/amd/display: Add support for BT.709 and BT.2020 TFs
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-33-alex.hung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20241220043410.416867-33-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::17) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|CY8PR12MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fcee664-23f7-43c9-6a5b-08dd4c52b8c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NE1LeVk0VmFsUUYra2ZQMmRKQ3lBTHNhbkhGNEorR1JSZXVocnRlZHV3Zk8w?=
 =?utf-8?B?TytTMEplWWZBT2JwY3ZlaWU1WVd3OXJTMVRnZ3V6dUY2OTZmTGNIZDdHM205?=
 =?utf-8?B?aktBbTF2VnVYOCtiRURYSXAvVnhmWFRXZitZQkNuenpvc25FYkY2eXBkczRN?=
 =?utf-8?B?Um1pUmZVZWYxVW8xTWhnckd2SDlsbHNtV1RCaUcyaVZIdk1vcUxoay9iMnhx?=
 =?utf-8?B?ZDAyb0grQUZkejJxWmxJWUFSOStObjVLb051ZTYzQWxmeXZwRUNES0FyL3lO?=
 =?utf-8?B?dzJPN1RYSTZodFFhczVIbjFEc1FkMW1FbVd4ZFpRSG04S1hJLytNWno5K0Zu?=
 =?utf-8?B?TnRVdThHbWY5VW9hM0xMWUFlRkJsSzlkYy9vRTF4amQxWmNRdHBQeGpUZFNV?=
 =?utf-8?B?Yk1QWDB3NW9JVFY5RzFFZW8xWUE5Rmkxd1paczFieWJDZkttSy8zMHFvbyt2?=
 =?utf-8?B?R2dDRnpFRHhCVUxYaHZpNk5nVlN1RjZpVFFrdzlQcDIvMzRIZHBWbGx1VGJC?=
 =?utf-8?B?L2gvMXNWVDBSN3dJdnhJdnZybkJjUDhqMS9TUWorSlVUTTlnWUtPcUNMNGp1?=
 =?utf-8?B?WkZtcUljek52Qk9zVnVxSUZoM25iZWhDVE1qS2FBR3Q0Rjd4ZEpxWWRnNzRH?=
 =?utf-8?B?U0F0YjA1d3NnZXVYTUNaek9NeHQzSEpkZE9sYXBrdm0wU05UaW8rSFVYUC9D?=
 =?utf-8?B?eE1GQ1lKcjJrbHBpRzZudFAwK0ZIblh4RnZQSGJnVXc1K21jTVNQck9zMXJs?=
 =?utf-8?B?Nlg3OWYzSG9lbEZiQ3hZdkI0NE0zNVhTTzNOby9vaUdReVA0SGVrOStKc1N1?=
 =?utf-8?B?ZUNPYUV6dW5Gc1luaVhza1ZSOWRLUVpJUGl5Y0ZqQmw0ckxnNDRwb04wS2hk?=
 =?utf-8?B?LzlORHIvM3VhUEttWTRUTVJZZXZLZ1JjSjBpM2tDTVVOWWNvMW1mNzJOZUh0?=
 =?utf-8?B?SkhodUZ1aTBiK1lmZDNQTFdYS0xNRFBqU3pCYldJNTBGRXp3R2dZb3VWMUpx?=
 =?utf-8?B?bEhwVVR5Yi9JbWgrL2IybFRaYWNQMUJRTElsOE5yUFFvaFJYV2pjblRDNFJu?=
 =?utf-8?B?S1U2U1dMeXN1ZFpJdlN2VS9MMnBkamVkWHhGeGpLZTY3T3UwSmVTRzB6VUZy?=
 =?utf-8?B?bmlRN2FvazRobi83clJwMTY4Sm5OZG9XWkxSQkNQUFRZT3ZWN2kxRUdYMnps?=
 =?utf-8?B?Sm1KM2NWeFhYTTd2dDhDL01NNStmYnBlNDF2VHE1NWdyWiszSHlTaUlMZ1gz?=
 =?utf-8?B?Y05XQ3hlT0JBUmhQTE94bzF0RUhQQzE4M1V0S0RtTEZ5UGswNjBwUVZqTkk5?=
 =?utf-8?B?UmJ1THlOSWFTNC9ZZnJPa3FoeTZPaVg4bGZJMElKTXp3cGF1Z2c0OFdEYmxj?=
 =?utf-8?B?dGVKeXhJaEw1YnFBK0tkdTR3dHZhWHNDZ0lTeWVwY25OazJxc05jVWozM3dC?=
 =?utf-8?B?dTdScEROMCtZRkRSeEZhR0ltaVI3elZhcFdhWWRwYUJjL3BqR3JOb1d2dHMx?=
 =?utf-8?B?bG5QS0ZZeGNhczJVQlR5R2dmOGRadkwwQk9YY0hOZTlheHFYME9VY2hrUXB4?=
 =?utf-8?B?dm5WT1B6QkUxVlF1c29MZEpiTXhJUTJvRXZBOTVzaG1zNWJXZmJUakFJa1FK?=
 =?utf-8?B?WHpWRE9HTkhRMkttSWpFa3NONzRPbC9SeWY1RENQN3UxSEJqblNvWFpzdVRi?=
 =?utf-8?B?dlp5UjgxNld2YWd4SzI2bzhGRHZwR29ycFJBbmcvVEhiQWlRUHNhRFdlSzZo?=
 =?utf-8?B?bmNpUnlCb0tHbjc5TmRFbGoyNVlCZ1lIUlprcHU3WWVuOWtZaVBMRkUzYlov?=
 =?utf-8?B?NllaMXoxYUx1bENMaythRFV2SEhEb01QejVXU0VmczkrZVlJTUdXZi9RVGZM?=
 =?utf-8?Q?l+MfsL81ek8Oh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VktqcFRCVDhxaHh5R2lIakJnRlI0UVc5L1RvZmxMT3ZFSVp5cnhNR1drb3hD?=
 =?utf-8?B?Mmdvb1ZxTWNUNDNZT1hGcEZQN2t0YUVxY3ZNS2pjZklKWE00R3ZHMnYyZ1FP?=
 =?utf-8?B?NEZXeDE3cDFXMkVqR3VjbDdnYkpuNE5WcHE4WmJkeE10V1kwbkxZQlRYRkZk?=
 =?utf-8?B?SXNvbE5wZ0FFYkNLZ3plNlFsUnZlMnVheSt0UmlManJobVNtVDJWdGROdVNr?=
 =?utf-8?B?OUhtWDAwZnMvTFBid1ljbW91cFNuelN6akFXT3ZEMSsveEh4M2xSblJwamZw?=
 =?utf-8?B?N3lqTnZtYkxsNG5vTzB3ckpBMlFiMURCMWVVZkRQaVVab1lBYVVDSGVqS1Mx?=
 =?utf-8?B?RjJUdDA2a0NFa1hTcVg2WVV5K1psUnQxZWNpdk1uOVN0Yi91a3hHY0ZlNXR2?=
 =?utf-8?B?NDJLTEVjL0lGdkpQUW04cVNQK1Q4Q0E5SmhMYjBYRzBYWTlzTCszNHYvaWpK?=
 =?utf-8?B?Zm5JdTB3L3dPV3NFSlZrekgxempZdlVhRzdUZnVmT0NTb2k4ZDBFQStqbXpM?=
 =?utf-8?B?aFU3V0VaeWErT1J3YW55ZndXMnFxNkcydUVzVUtxVzBSQ09uMUxoODNRYkU2?=
 =?utf-8?B?alVkYi84NFB5RGN5bndwalhYeE5MU2pKVWtkb3NnYTFoWWQ4VVV6cUtYc0pN?=
 =?utf-8?B?bThIazR1ei9tZDJ5bUZITGsvbU9nc0MwVk1DeW5KUFd0eU9KVEY3ajVNNTlw?=
 =?utf-8?B?NmJsQmdyK0pPSmxGVVlSK2ZxR3hjd2NhOStlY2Z2T3pFN2RUbHN6QTh6QSt1?=
 =?utf-8?B?RXlibjlNc1M1REVUWWtJYklDemFkVGZSekZqTGErZHJkcVdRS0F5MG9kOExI?=
 =?utf-8?B?bnM1SWdULzY0dXBtRDQrZDd5b3NodXVZRWNDTnpUMlFJd0k4bzJySkJ0K1Bj?=
 =?utf-8?B?ZmF5enVXVzBUamF0YjVhWXl0VHV0SlVYb2gxSlQxZi9HUFpCZTlzTWNBZ3ZQ?=
 =?utf-8?B?RWNGL1JublRvYk02WWtVQk9SY1NsYXNYcDdFbDMzK1IyT1lyaDVCUWI3UlJQ?=
 =?utf-8?B?b0dvajY0YitHVkxZb2FuYUxYOURiVEhKRUNxSk42VjdReGVxVy9tcDhJcHhJ?=
 =?utf-8?B?RGFlbmp0a1V0bXE1S0tZVmIzRXFUQUxxU1F3c0xHWkE2dkU4anV4Z2VSZytI?=
 =?utf-8?B?RWtwMUlWVmtRZmpXVHZLLyt0d3RSSm1BWWh6cXp6bTNtWllBWHl2clB6TnVp?=
 =?utf-8?B?d2FHZmlWcHlxRERSNGJUSHJhMHBNaGNmWFdOblBLU2lTYUZyZEJodlljRDBu?=
 =?utf-8?B?NXVxVjI1dUJ6enhSb0g3TWRCUXZTT0h4UzRwTm80b1diM1pJYXVHaWRRYm14?=
 =?utf-8?B?MzQyWE5zZ01vTW5DQ0NzUnpYbWQrZWlqbWZFV25EWjA3VDdvaldJMjNvSGxW?=
 =?utf-8?B?cnZBNllFTEhMbUZDbkJjaEMzTXZsTkQrZmVLeXdBZHJtMGJHT0F6VTZuMGNi?=
 =?utf-8?B?VWhoOG9sajFRQTJSamtRQlcxc0x4Y0Rna3FXaHVJdGZHc1dUYjJ2UEwzVGNL?=
 =?utf-8?B?Mmg5MEE4OHNqdGtROTQ4bWpWdFcrc0hnQzFZVStNSkI2TjdrRi82TVAxQWhE?=
 =?utf-8?B?bDdLMlhNUVBEMjcwYlFob25hNFVLTWpBdmtkT2d0RlZVd1pBbFpBMU1RSkw2?=
 =?utf-8?B?Yk5JbWFMYjhPWFRhZVloWTAyOGJ1bytUMWxza0YvOWY1SkJ1RnQvaDd3R0RX?=
 =?utf-8?B?T0JNR3AzUnVPa21pbnkzMVZJN0FSdEhUY0MrMis4TTBQeXhtNjRwUTBvVnlk?=
 =?utf-8?B?ZDRySFhpSHFqb255a3NCcTQ2dlJ5U1Bpc09YYzF5ZGg2cklJWG5kVzh1ZDdS?=
 =?utf-8?B?dHR5eTBZZTZyanpZMklLbmwwTzBQaTN6OTRRUXhjdDk2dWVYMGFzZnJPNVVi?=
 =?utf-8?B?cm8vRERwUFkvOE5yb1IwNUdPem0zWjA3SE1iYlFuaE5GZVV0NVZ4SXUreThr?=
 =?utf-8?B?cEluY25ydG5JUG5tbytPQ29zcUVjVzNqTE0rZ1hSMnlGN2d4eE9KSXNHVGpB?=
 =?utf-8?B?bVF0Tmpnc0pGNFFkemhja01wOE1QVkJQbjZoclZWN1R3ZVZOaUxPc2dHZHU2?=
 =?utf-8?B?cll4clU1QWVubXpxeEorOHJ2cFFlcXdoQktUR0g0WGZTd1k5bHQ4VG1Gb2hq?=
 =?utf-8?Q?PI7o=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fcee664-23f7-43c9-6a5b-08dd4c52b8c8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 17:20:33.0031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVQBSBakpBIFL2S0ZVNYKeSxTS9XsQzZKvGJwQ9foF4tttmWCXAelko0BG8l/aJM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7681
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



On 2024-12-19 23:33, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
> 
> This adds support for the BT.709/BT.2020 transfer functions
> on all current 1D curve plane colorops, i.e., on DEGAM, SHAPER,
> and BLND blocks.
> 
> With this change the following IGT subtests pass:
> kms_colorop --run plane-XR30-XR30-bt2020_inv_oetf
> kms_colorop --run plane-XR30-XR30-bt2020_oetf
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c   | 11 ++++++++---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 10 +++++++---
>   2 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 63044e0296cb..1765402bc122 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -676,6 +676,9 @@ amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
>   	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
>   	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
>   		return TRANSFER_FUNCTION_SRGB;
> +	case DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
> +	case DRM_COLOROP_1D_CURVE_BT2020_OETF:
> +		return TRANSFER_FUNCTION_BT709;
>   	case DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
>   	case DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
>   		return TRANSFER_FUNCTION_PQ;
> @@ -1284,8 +1287,10 @@ __set_colorop_1d_curve_blend_tf_lut(struct dc_plane_state *dc_plane_state,
>   	const struct drm_color_lut *blend_lut;
>   	uint32_t blend_size = 0;
>   
> -	if (colorop->type != DRM_COLOROP_1D_CURVE &&
> -	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
> +	if (colorop->type != DRM_COLOROP_1D_CURVE)
> +		return -EINVAL;
> +
> +	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs))
>   		return -EINVAL;
>   
>   	if (colorop_state->bypass) {
> @@ -1321,7 +1326,7 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
>   	/* 3nd op: 1d curve - blend */
>   	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
>   		if (new_colorop_state->colorop == old_colorop &&
> -		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
> +		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
>   			colorop_state = new_colorop_state;
>   			break;
>   		}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index a9d94018a207..ff5828a1e8cd 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -33,14 +33,18 @@
>   
>   const u64 amdgpu_dm_supported_degam_tfs =
>   	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
> -	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF);
> +	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
> +	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
>   
>   const u64 amdgpu_dm_supported_shaper_tfs =
>   	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) |
> -	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF);
> +	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF) |
> +	BIT(DRM_COLOROP_1D_CURVE_BT2020_OETF);
>   
>   const u64 amdgpu_dm_supported_blnd_tfs =
> -	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
> +	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
> +	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
> +	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);

Should the PQ_125 bit + the changes for __set_colorop_1d_curve_blend_tf_lut() be 
moved to patch 30/45 "Enable support for PQ 125 EOTF and Inverse"?

- Leo

>   
>   #define MAX_COLOR_PIPELINE_OPS 10
>   

