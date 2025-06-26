Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80452AE9D22
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 14:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEEA10E845;
	Thu, 26 Jun 2025 12:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RlyidjHC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3581110E2C1;
 Thu, 26 Jun 2025 12:05:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQyLwJoLoOymYdlOBHDIUDDu0PqSnddX38QnQZrZyB9EeXOt9Gfu1TU1/B86Q1z8p4TTTtLyWcu5irvRikxLF9DA7hi5MdCdAXe87qyWQLh4+IgzpbKCWg2XJAAzay9ubF90qui8aX3hK3dJK3SfXpZN0ppKoIpqDZ29MpB9JixVwqqfHVIg90lUQD6J6OpgSUAvaBT3pltHO+TZFOV7RWH5IYClAWzyQ2cUeOBrQj9Z/SJSWKwgj8TruqFQ6EUfAnplP5cg4Dt3WhzFmjjqNWImZCINalZ2GpaaX/dkrl+PnKm+v+a/yVa7CvHc6CKVWWC6njo6MyfGafDiG7a9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPdAizs/1gychDCM0IXxtwk274NpcYe79hafCMCxons=;
 b=WY08zBM1OizaeGmAslU+efsxqarriBqpGx6KRtd5DKUpC2XduJPo4EKfL0s57v/yIftsuLaSVB+mBn5iABsGKhRyJ70GxZu35gv8kQMrAzbMUksZS/yZ3VnmOxVuAXvMQebcrpPHwYtlutZqhVGsMrOfTbxyncwyKOkZht9w4TfLkH+Kbcz9HuHO9xobsLIGKUAxPYtmddIcDCw3AWdBI1pJWF4CGEab+pkfQ1o7Ub4h8lF/Q3cyTHPAScMnq8XQD4tvcNR19IVlPHOa2Hc3cb6k9MhP6mla7TqbH96JfUGrj4HFDP0ht18sOkiHGcyejezRSrE/gb2TvEhRtat3Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPdAizs/1gychDCM0IXxtwk274NpcYe79hafCMCxons=;
 b=RlyidjHC3QbbW2Rrq9HSA8Q6qsh4lcEvHSUfOAKSgTD9R+JIfFyUvw4G2Pg/DRzQ+PM60B0F2DMvp9DZXzxRFx45JlhSUAxDWsP+iEfMBsc6aVX9ZeOdIClBK+AuFkrSa05AYqqdhzOsLxPIilkyPbhNn206ZNhySVGlVBcePko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6412.namprd12.prod.outlook.com (2603:10b6:208:3af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 12:05:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 12:05:02 +0000
Message-ID: <12f39316-9ef2-4448-a1eb-1fba9da5c8e3@amd.com>
Date: Thu, 26 Jun 2025 14:04:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] drm: add debugfs support on per client-id basis
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250624113454.2322935-1-sunil.khatri@amd.com>
 <20250624113454.2322935-3-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250624113454.2322935-3-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: b5677993-13d8-424d-6317-08ddb4a9ae66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFUzQ25peXJ6WWcwc3hhNzZjVDUrenpJR291Q3NWYVhRN1BHN0RKeWdmSjFk?=
 =?utf-8?B?RjdsZXlteUVsc3ZBRUQ4UGNmTmJhaHhmYjFGaEVtQ0UwN0Y0K3dkWGhSWGk4?=
 =?utf-8?B?NHhtZU82am13dlJJOFNFMnEvQkU4V0NtZnRzT1crOEpRT2hjRWpNaENQWTZV?=
 =?utf-8?B?ZUZtQkRVUk9EVEZiWlNVeHF3ZlFxKzlxc1dqVHcrWEJCL3I4TFhQTkZqa0Za?=
 =?utf-8?B?eGpoMFg0L1AvbVdLNmdRZTllV2xnUDA3R3k2RFo2a2dZdWtrbWlyYlhEeVNz?=
 =?utf-8?B?TlUzME9nSjNLdnhSakJSZ1V6ZzQ0aDVIcUVpeTJlNGU5amxNK2NpdnRHYXRZ?=
 =?utf-8?B?YjRYdE4vM1ZvU0Vpa0syZ2U1TEt2YzJxV3RrRUc2YW8xcmM4U2R4S0dOZ1NK?=
 =?utf-8?B?VzZ0VlpORExBRzg3SHdIR0QweEtQNEt5Z3ZqNUVBd04yZEhEOXZsblVZekND?=
 =?utf-8?B?VkRNdGJaNU1RUWV5Zk1Fd2tpYlJieFNZSWVTSWRuVjhkTlNTVmNsWk9CZHBU?=
 =?utf-8?B?cXJmdG0vZnFhR1RuZTNXeVY0M0x3WkdwbmpNbGRKZUdkUGF6aE8xTXkwQ1Z1?=
 =?utf-8?B?YTBZYVF5dHZ0R0xQSllvN1U3Qk5lN0JuUlRKQWY0cDUzTVRwemRpRTYxSFp0?=
 =?utf-8?B?YnpRS05TTVBYa0ExTzFZQy92VWpubnZlaS81STN0TFBUU3UrTVNwVnNSQjNa?=
 =?utf-8?B?TVRTT05qUFFmUTFueXpVSzh3NFJwM3lkQkVmVVNsZkRlaUROTTIvWHFYL1Vw?=
 =?utf-8?B?Z0o1TzJ6OXFlYnY5eUxRT2Fic2lhVHllOVdVQ1FKVmxUREpnc1A3Y09YZWJJ?=
 =?utf-8?B?VGtubzNHaFZHWHFjUEpvL09YczkwYWNWTFRuOEVKVXQwWWM0QmVwK1EvK2V3?=
 =?utf-8?B?eXBRMC9ybEdJWk1JVit0WW43VW9reXhmbWxqMVN2TFUzNzVtV3pyRms4SllE?=
 =?utf-8?B?SnVRdnFEenc4RGpZQWJKc2lVSWVlSVBUeldpbXAzdnpvVUhNcVhod2JOUllZ?=
 =?utf-8?B?dEZpTS91bGZhY0lSZ2xpSGM5UjV4OGxQV2gyQ0twRGIyQ1g1MjVZbFRRL1BQ?=
 =?utf-8?B?MDhFYndlbWt3OWNqLzNxWHhSc1JKUzF4UkhIS0IwR2lRQU5INjRuVkRzZVF5?=
 =?utf-8?B?aWpwdDdpMHJJSFhHenNtak1wY3JjMzBIdkw1dE0zTmFDZS9wTTl0Wm1ULzBq?=
 =?utf-8?B?VjlIN1lLMm9MVlJZTWRkWmgzbWNVWVdKT0hKVWpGRkVvNG4rdzRWS3dveGM5?=
 =?utf-8?B?eXdOMm9PN04wWGx5REFHc3F0eFFndm0vL0s2SXJJc1JwSWpIZ2hhUUd1Tmlh?=
 =?utf-8?B?Wm14aXF2UWorZy9zVTZmNUxRcWVnWThTZWJBSUFYN2pNYThsc2JneHdGWlY4?=
 =?utf-8?B?eE1WeTkwTGxnMWs5R0dvcjZTc25IS1YrWXVlUWdWek1zcVlEWjR5a3pZaEJp?=
 =?utf-8?B?eVloZlBTdlB1aFFJMDZLa2lZUkZYaVo0MGRvdGFkdzBBRkVVSzlDcnBvdDVF?=
 =?utf-8?B?ZEhEUW1VZ3FrR085TVI0NWRiY2FRUFJIazB3Q1d5Ui9ZZTdVSDdzN3o1YXNV?=
 =?utf-8?B?WFZlZGhTbXhRWDZlRDJZbTdjYUU5WDM2UDY1T0VSUk5ZZzBBRVcyd2xZTU1B?=
 =?utf-8?B?ZWlWNXdxSVQycm5ZRDVCSk9CcEsvRkhuK29yV3JrbEM3dExWOWFwQVl3TVgw?=
 =?utf-8?B?OG5Ib1kzUUNyQmJaVkJna2hBZmtRaXdlK3VmM1cwZWF3aEJaT0Z2eFpaOGw1?=
 =?utf-8?B?QlJsL242WmptV0loaHdLcU0zandrVmxlUUJJWG82SDVsVDJCdEVtaEhuZjV2?=
 =?utf-8?B?VXd1Q3h0cFM4UG1ta1h1cU0yTkRiNzlwOU9uNmFRL0dLWHY0TWhFSWU2WVpJ?=
 =?utf-8?B?TjN5dDZmNWxnTFBQcTFjczVSQVhqSUQ5dlhOMUdrd0hBcGQrdnplQkNqYXli?=
 =?utf-8?Q?uD31g0k7cEE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajVTbVhmbitWb2FmcVlDSjk4SHAxVEU1ci8zbU1zSERFRjJkOFVjU01zN215?=
 =?utf-8?B?Yjc5dUxNMGNzRE4rUkNnbVBWcnFhL1p3cXFHQjM2MzIzM202WDMrMFdiR1NX?=
 =?utf-8?B?NEx2eGFCai80aWd6NGNQeDBqNncyZlRaSVNqVlNnM1ZKL1Myd3dqZWs4K2tP?=
 =?utf-8?B?bXdjZUJtMUZlNy9DUmppT2lFdEZCVHRBV1FtNldxZWptRnkvN2JUckdGRlFZ?=
 =?utf-8?B?cUlTYS9PRy9IZzFpclhEMFF6eHcySDNQeWMvNVc4emZ5cERWVXRiK2gyY1Na?=
 =?utf-8?B?aUJpZDRDUXdiNGplWTVJMnQ4NFAvaldmTkl0RFBjckRWd1FKUSswTnMzT1lB?=
 =?utf-8?B?OVJLSFZyNlBqQktNSUcySk43VXY5cnhocVlVUnZrWHlHeERhOUUrSE1jYVBj?=
 =?utf-8?B?a1E0a1pWcDJSSXdMT1piczlScGRLVmRFQ1ZiajIwUGdIU0JSMFJlSjk3bmhJ?=
 =?utf-8?B?Qkw1T0FJTjBSNlV6dDJmTDhtMmh5N1lHTU1NbUZhMUtZVFR0UUN5akFvN2JO?=
 =?utf-8?B?WVJ3NXl2MUcxcEtkQkN4YVZLRWdzZ2tQeS9xcWUwQUFoRTN1T1lGWnp4b1E0?=
 =?utf-8?B?UldBU1lmQ1hoT09Ydm1MalZaMGhhRHArenhPZUVnZ3FzRmlBNnJDdTdzdmNn?=
 =?utf-8?B?NG9UaWdkQnFYZ3dkS2pNaU05YXZpWmpIeE5kZlhUSHJXc2RXNnMreENmL1dL?=
 =?utf-8?B?MXNFdkx4N2t0eVlRT3JjZmN3YXVxeVRyM1A0WkVEVVJORHRGWGVnekFES2Q4?=
 =?utf-8?B?K0E3alFMaFhGNFloc1Nkam10TmZiSmRUTnFMZWpGR1p0ck1rTFlubThFNk9l?=
 =?utf-8?B?cUlYRGJTOWpIMDcrR2JWZ3RQWnRZS2FSK3JObGpENEU0eXJUTmowdmpWeTh1?=
 =?utf-8?B?dG5odWNDR292MHhHcmFqdWpmZERiSTJlK2FPeG0vcjE4VCtubEcrNnJjQnh3?=
 =?utf-8?B?dXdVVi9jelZwK1JSR0d5WGZ5U0xrcEE4MitSeGJidTRJek9kemdKOE0vazRJ?=
 =?utf-8?B?V3lERDV4SHphdFRERVVWRzNGSC91NjN3ZCtHQWlwWm1POTVVWXZZWnVMZk1U?=
 =?utf-8?B?eWRRMWlGS0tZWWRWMDJ2NWtWNTl0K01XNnBQL29sQXhpYStmdzRFWG93eEps?=
 =?utf-8?B?emh1ZUZrVVlOZGZPRkM1TjltN25nWE5zcFNaWjZnblR5OUMzRm55TXM4Q1JN?=
 =?utf-8?B?UUdEQW5PakZsV01ESkRyQlNhRzlURkIzQU5Kd3JWOWVWQUxnTUZGYlZ4MjRn?=
 =?utf-8?B?MzBuc2NmTWdaeC95UEZPeEhjajN0dTMwcmE4aUhMR3BaRU0xVGptbXVNWWE3?=
 =?utf-8?B?SkdLWjdYcUJnMDZoRlo1VGpIbHJGVW1zMHRSSnJHOG1sNlNqWXhldmNRL1Qw?=
 =?utf-8?B?QzEvOHJWSGduV0w1UVFoR0k5NTFQelQzdU11ekgrRjRMSEpZckVkdTd6ZURV?=
 =?utf-8?B?NGhIQnNCdkNLakc2ekx2RStZNDZKdFRtNWRUam5ZVGg1Qm5wMVM3Y3QrZnZl?=
 =?utf-8?B?cGdLYS92bGJWODNMYVlvZUowSG04RzllQ1ZyZUlyZUVHeHNYMUhwTlY2cTg5?=
 =?utf-8?B?L1pNb0RjcGpLZHVJVE1xYWZCd1ZwbXF6M3ZJS0cva3Q4eThkNW82T3J4bVBs?=
 =?utf-8?B?Y2ROY1ZJQkNnVXZ4YmpJN09SQVFyWmVwbDhHcit6dnNCZkFCUW9HMXBpSm8x?=
 =?utf-8?B?eUI0N0Q4WXVCU2NhZXBUbjFUaUFPRkxUOGllS0lmRHJ4b3NHZFExRzNNaGpu?=
 =?utf-8?B?U29oajBIS3lXTkhQTkVzNEVTcVA4d05XbnVWTWc2OE5Fa0FMN2xRSDZmRDBq?=
 =?utf-8?B?VGM0MjU1enNtakpJUldvcFVkRmFKSE1TSnNCRmp2ZmZtcUo0RFVyTXp5MHFZ?=
 =?utf-8?B?YmhObWpqZFo1bDFLcVdaUlZ5MzFGWDJGT0FiWjNOUnJteFZQRUxkaXNVMm9o?=
 =?utf-8?B?dUNiTUY2QlJpWDcrRU5ZUXFBMmtQaDREdTlvOGp5QUZLQVVUMHVTeHV3M2F0?=
 =?utf-8?B?Mk0vU3lodElPYmRPLytweWZoZlBhb3dneHRUZ3cwWTB6dHBSWXlyR0FON0M1?=
 =?utf-8?B?b0NzZ0o2MmpyOU9kRUpGV05FUW45eUJxdEVNeElCSVhrVk9mZXFLczBqeXQv?=
 =?utf-8?Q?Hyd0qDLyWO1J1lrIvsQVzBtLd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5677993-13d8-424d-6317-08ddb4a9ae66
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 12:05:02.6527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6l9BniTcvsTUbXUrIbUU1tj3eCnoLHVveEWzXXCs2oDB39Tyf2rzrgy1wh2EWS5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6412
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

On 24.06.25 13:34, Sunil Khatri wrote:
> add support to add a directory for each client-id
> with root at the dri level. Since the clients are
> unique and not just related to one single drm device,
> so it makes more sense to add all the client based
> nodes with root as dri.
> 
> Also create a symlink back to the parent drm device
> from each client.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_file.c    |  6 ++++++
>  include/drm/drm_debugfs.h     | 11 +++++++++++
>  include/drm/drm_file.h        |  7 +++++++
>  4 files changed, 50 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index a227903c29c4..ebdf60665b86 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -309,6 +309,32 @@ void drm_debugfs_remove_accel_root(void)
>  	debugfs_remove(accel_debugfs_root);
>  }
>  
> +void drm_debugfs_clients_add(struct drm_file *file)
> +{
> +	char *client;
> +
> +	client = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
> +	if (!client)
> +		return;
> +
> +	/* Create a debugfs directory for the client in root on drm debugfs */
> +	file->debugfs_client = debugfs_create_dir(client, drm_debugfs_root);
> +	kfree(client);
> +
> +	client = kasprintf(GFP_KERNEL, "../%s", file->minor->dev->unique);
> +	if (!client)
> +		return;
> +
> +	/* Create a link from client_id to the drm device this client id belongs to */
> +	debugfs_create_symlink("device", file->debugfs_client, client);

Mhm, that won't work for accel devices. How should we fix that?

> +	kfree(client);
> +}
> +
> +void drm_debugfs_clients_remove(struct drm_file *file)
> +{
> +	debugfs_remove_recursive(file->debugfs_client);
> +	file->debugfs_client = NULL;
> +}
>  
>  /**
>   * drm_debugfs_dev_init - create debugfs directory for the device
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 06ba6dcbf5ae..17b803ab119e 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -45,6 +45,7 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_print.h>
> +#include <drm/drm_debugfs.h>
>  
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
> @@ -167,6 +168,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>  
>  	drm_prime_init_file_private(&file->prime);
>  
> +	drm_debugfs_clients_add(file);
> +
>  	if (dev->driver->open) {
>  		ret = dev->driver->open(dev, file);
>  		if (ret < 0)
> @@ -181,6 +184,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>  		drm_syncobj_release(file);
>  	if (drm_core_check_feature(dev, DRIVER_GEM))
>  		drm_gem_release(dev, file);
> +
> +	drm_debugfs_clients_remove(file);
>  	put_pid(rcu_access_pointer(file->pid));
>  	kfree(file);
>  
> @@ -236,6 +241,7 @@ void drm_file_free(struct drm_file *file)
>  		     atomic_read(&dev->open_count));
>  
>  	drm_events_release(file);
> +	drm_debugfs_clients_remove(file);

That most likely needs to come even before releasing the events.

Regards,
Christian.

>  
>  	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>  		drm_fb_release(file);
> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> index cf06cee4343f..2b3767ad8f5d 100644
> --- a/include/drm/drm_debugfs.h
> +++ b/include/drm/drm_debugfs.h
> @@ -153,6 +153,9 @@ void drm_debugfs_add_files(struct drm_device *dev,
>  
>  int drm_debugfs_gpuva_info(struct seq_file *m,
>  			   struct drm_gpuvm *gpuvm);
> +
> +void drm_debugfs_clients_add(struct drm_file *file);
> +void drm_debugfs_clients_remove(struct drm_file *file);
>  #else
>  static inline void drm_debugfs_create_files(const struct drm_info_list *files,
>  					    int count, struct dentry *root,
> @@ -181,6 +184,14 @@ static inline int drm_debugfs_gpuva_info(struct seq_file *m,
>  {
>  	return 0;
>  }
> +
> +static void drm_debugfs_clients_add(struct drm_file *file)
> +{
> +}
> +
> +static void drm_debugfs_clients_remove(struct drm_file *file)
> +{
> +}
>  #endif
>  
>  #endif /* _DRM_DEBUGFS_H_ */
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 5c3b2aa3e69d..eab7546aad79 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -400,6 +400,13 @@ struct drm_file {
>  	 * @client_name_lock: Protects @client_name.
>  	 */
>  	struct mutex client_name_lock;
> +
> +	/**
> +	 * @debugfs_client:
> +	 *
> +	 * debugfs directory for each client under a drm node.
> +	 */
> +	struct dentry *debugfs_client;
>  };
>  
>  /**

