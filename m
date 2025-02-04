Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A03A27F71
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 00:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B8210E70F;
	Tue,  4 Feb 2025 23:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="33gu4/LU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD7410E70D;
 Tue,  4 Feb 2025 23:19:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKezvL2QE6V0BsIaljXaKl5a+luLUy4du02AkIJEMnUlnGDAUqfFpYgTY24Z4fAQ8S4sCKe18qlhKbI6E3CLbToyexEQw0BIf2xfIZ7a2WIcbAi4v9b0SWZwm9Zd6hpuUx11jT6A25Ymi6AzZe5bhYZI3vVFR4kqH5Y1NkZamcH0x35+dr5wwDJbpULvZTj+MUNGGV3mFHQqFhukB5bCty1qLQBMOTXykmC29pRzgAVYzZuEh8MiRT4JPzNXjhq4PLdOcM4bYEn2CC8gwccshgpAW4Zl+bPcrroT7F6NDI8pWya4xIa7450c03MRKC7Asd0/VZDULoe/S1YAuTehAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vwe2nd/LX/SzDovCLcqORMgeOlLNQZ9i7xRmuG/eAMI=;
 b=JYRIth33BsL692JFd7DYyDlsUNgv4krvu1k0kqiK55euCl6XDFwZq1P/PjC5DtLVMWv9WAdTqBoB1DjeVRb5QrfkYYbTkgkQeCw9iQBtWVYWOSFwDZW+py/AVH9Eggis5Hztefigf+NSctySgseLn6N7lNiUmn0y/oHKdO2RhF4CBd5s7yBWhB/yV5gK4nMYpRinGxk0YZBmM3u+AwkAJCFhEbukrH4JB291VQEpVfktImkRg5Geez0q3f3fbI1IzRjW7OrgEqVKJ4Wz3zUVvsIPgT3kU5NX120yhsiT86K3eBuirpqaym9uTpVgTMv4aCw5W/hgQzJ9X58emZayHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vwe2nd/LX/SzDovCLcqORMgeOlLNQZ9i7xRmuG/eAMI=;
 b=33gu4/LUv9T4zHuRXQyZC08I0/plL3NuaK01OBGhYNjMIRew4EgacuDEjRQojjW9Nn56ckzcUqxDJfRJ4k31kAcTYSr7byx3SUD/o2D05SBxxXeJenk0EIhVgtCVHbaYSZMVPOS30U5LVMCYfhA5foIaO1UAQyeliH/TLM/SVjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH8PR12MB6817.namprd12.prod.outlook.com (2603:10b6:510:1c8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Tue, 4 Feb
 2025 23:19:06 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 23:19:06 +0000
Message-ID: <65b47db9-883b-46c6-919a-e84c3ffde401@amd.com>
Date: Tue, 4 Feb 2025 18:19:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Refactor find_system_memory()
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250204222140.3883013-1-superm1@kernel.org>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20250204222140.3883013-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::29) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH8PR12MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 078dcc66-02ef-41ac-1f94-08dd457251d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDB0UGUxTkNVWVEwc0w2S2dmWnhnUWtjU2lVd1dqcEsxSit6bCtNRkpPaFBM?=
 =?utf-8?B?T1RWbThTVlRTL1E2eWZIbjBRTzlJalpTL1MrZkFFZ2NYM0R6eG4yTzlwaUlB?=
 =?utf-8?B?cUo4aktnc3JPa2c3VGIxK1dvSlVYank3Vk9PbVlKNklCU1piMHMyVFY3bDlQ?=
 =?utf-8?B?dGJWUkFpTDN5RlRWdTZOVmFySVVjQUhpK0JtVEVrSXNXaXQ3aEQxTmNOekxu?=
 =?utf-8?B?emJQWjVnOUlHdjN0YzdJS1lJWkEvcjllOXlGTUUzV2NPTWZmZGEwSHhWQk10?=
 =?utf-8?B?T0VvZ0hCbGhQN3daZWtqYVNZNldjczU1dHJ6QjVJMHhvajRKNG1SM2tjWGkw?=
 =?utf-8?B?ejBFVzg2ZDYxenRoSCtidzNuTHc5MjV3TTZhSDJacW1JS0FNMG50eXJQRUFC?=
 =?utf-8?B?RWh2UmJDWkpaaEdobnRXU2E5dk1tcytlT1VSd205V0NXcmFRbTY0eUlKUktH?=
 =?utf-8?B?STVraTc3ZUYrY2g1TEVVYVZ1VzVSQWd6YnUyYkVBZnZsZG1ZcFJDUldydlRm?=
 =?utf-8?B?WEZBeFZYdmJwZFA2N0hOWmpscVJqMlRTbExCWVFoUFRlbHF0ZVpvVFZxT2xV?=
 =?utf-8?B?MGtUNFZUaHl6Rnc3K2lqZ2NjK2dobVFleDFncm5qN1B0YU1ZanE2bHppZlNO?=
 =?utf-8?B?eHNLb1NDMENrdXF3ZHZ2ZjBsczM4OGpZcS9nL3llYTRabmt4c0xjaHRDZ3U4?=
 =?utf-8?B?NDZSZ1JtQktud25HWmxaazFSQ3FUZ2dGdzFzb0FqSU8yeFdxSXRVVVNQdnAy?=
 =?utf-8?B?VUxCUnVRbmZCZTk2aFBhUFpwVU9QaFdrZk85VmhPQTcwanVpNVFGR05VUkli?=
 =?utf-8?B?TjhGek8zRWdjRGZOVGs2K0xMMmRGNUhoanB0NjB3YXZVaWlieWpkTDltN3Nz?=
 =?utf-8?B?QXZ4Rm92bk8yQTAxNEMrM1hqYkgwbjF3ZFk1RGUrREg5S0RZNnZFQVlxMDdQ?=
 =?utf-8?B?c2JuT3Z2Vjl2b01uN0JqOGFEZlN3MkQvSTM3a1MrUk9LNXJaV0NaRkpLaHgr?=
 =?utf-8?B?WEFaUk51bVFYYnF1Nk5nTFZpQWJRYWNjdEdaclpFRDZkQzFKOHhvUmhzV3FI?=
 =?utf-8?B?WmRmdGFwRTArWTZhK0NlWXF2b2c2NUQ1K0M1U2lWZ04xb0o0ai9SV05LYU11?=
 =?utf-8?B?RVIvNEI2ZUtiUGJxTlZEMEJJdlJYQjNNWUNzdCt3UHkrTnVLVVRrNVYzaWh1?=
 =?utf-8?B?OGRFR1l2SXBmSVljZkN2T0pHNFFiTFJRVkN0OTRabGdZVCszRkx1b0pyelZ0?=
 =?utf-8?B?b0REUFBjcTl0MlkzOXJzcnRaZnBDN2k3UWpWSTBTdFFvYmMzaHZCeDdkdEU4?=
 =?utf-8?B?WXk2dENsS1lTR2hkTklGUE1HNms3V2ZOeVFhc29RbzlSU3p5V1ZaQ0Y2emU5?=
 =?utf-8?B?eDdUNlh2Qll2aFZZYnJmVzBDT2h1ZUUvMXVBb0h2WFhWb2NBTmQ5b1NRMUpR?=
 =?utf-8?B?dDBFRjhEbEx0K3VsZ0ZVQ09Va2UxOW4zeURmcExiQ1doUW9KQWpHZDJYWlpq?=
 =?utf-8?B?amZrQjlkUkpyblAyR1hXYzB6NjZpT1BVbWpjanJtVmlGOVZZQmJaaDl6dTdu?=
 =?utf-8?B?czNEOVladlNnQm5hL1hxd09mczFTVEZNS2lWWWhXYnBHNVRROW1kN2RwdXNN?=
 =?utf-8?B?SXpNMzJFK1lHY2JMQjk0dnRFS3ZpWlVpT2NtUU9PSU9YMEtKenA5TXNvTTBk?=
 =?utf-8?B?TkxqUDZPZ01OdGxzYi83V2NpNm9IM0M1TlY4UG9iOHhyUEZZLzdvRVRWSmpu?=
 =?utf-8?B?MGR3NUhMZTUyNUJqbkh0NzZRcXp6Y0dYRjdkMGFzOGE5akw1STBGaC9kdEFP?=
 =?utf-8?B?ck9FVi94aU9SbU9FdTlKZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzhtSGc5VFYzY3dheVRGT3R6VVV5bzlMU0tMUWxaekhsVkEyRlhQUzY4MmdW?=
 =?utf-8?B?YUlrdHhVNDRDQjhUOUpUNjdicWc4cHVFOXQrUHlGNGFpUzdtc3RyVE9CQ1NP?=
 =?utf-8?B?eHZMeEk1U0FNK096M2ZpTEdFejVWZjdnSTkzZmRPUjJRQk16YzVUc0dZNU9a?=
 =?utf-8?B?WktjSWkvK3N3cXBhUFhieUxLVVlnMkorM1grbGNkUTlTSWpGNTN3alR5NWh6?=
 =?utf-8?B?MFhsNkNlekpJQlZqQnErNk5aRk42cmk2cmdWUGF5dmZIblBtQUlSZytqbmUx?=
 =?utf-8?B?eWhlN1FhcVVRa1Flc1l1dlRNSE9PRzJ1bVZ4VDRvYkg0TEdCQldzVGx5d3M2?=
 =?utf-8?B?dDNKV1Z3aHJLcWFBaERXTVByTlJqQndCeEVMN3ZoVXZBcHRSM0lFRG5FcEZo?=
 =?utf-8?B?UWN5Mm1BczMreElRRDk3czZ2dXNYR3hGbnZBUHM5QzFEb3pCVGczWlhsSGNl?=
 =?utf-8?B?TDJHVmdrbFprUnFYZ1IyaXBwM2dNcWtKV2Q4aXZacFZSbjQ3SmFEd1Rycm8r?=
 =?utf-8?B?T3hMNmUrd0RmckxERkd1UTlyWWpXbHBERzQ3RHdUWk95dUtLUmFpRFh2MnI1?=
 =?utf-8?B?OUdWbTNpZTUzOTZWYkJwYnNldXFSSjdKaVExRzRSZkZNYThiUlU0a0wyZGF5?=
 =?utf-8?B?SWYrM1craTlVcmtRQkx5SHNNNFlmUWI3NWszMzRUd2RxdjRvZEozQ28va3Ji?=
 =?utf-8?B?b20vWjQ2TEx0V1JwWjNpaDVMZFlmSm1lWVBhNm5qOTlzQm1jRDY2a0dEVld2?=
 =?utf-8?B?eThQTzRpVVZpYnlxQjJtRDYzaEVlN0ZWNHVocUVyNjhBa01uNjdHbXppa2hp?=
 =?utf-8?B?ZHdiYjQzbkMySVhDeVpMWHIzOTJjYlRjaGEzQmlzb0h5T2Rrd2doSmN3RHcx?=
 =?utf-8?B?WHJCdEt6bitFUWp2Nms1YzN6bDlGclFYbytUMy9vSEJuU0hJM28wSmUzUThN?=
 =?utf-8?B?ZEk5SVRJcnhtMDNTZkdydGROT3VJZVNTVU1Nd0E0Y1dvc3NTYjdQZ1cvMy9V?=
 =?utf-8?B?UERHTktnYTJWN3QxQnNjTW9NZm9sSms3MG02eFZ4RWJza2g0MlQwTVZmbHNC?=
 =?utf-8?B?WVVMUTJBOEttVmxnU3k4Z3lVNG5FamVnbDJyeWh0a2hkZVdYREpDeFBQdXJk?=
 =?utf-8?B?VmxoOEhxSzRDa1FacytUM0hjbFgwNGd6UWxiMTEyclZFaXhSeEdhTTIxalJv?=
 =?utf-8?B?QlRmb1JUcllSSmtROGpVNDVJMXVYdnBRREdXYjNZaDAwa0J2a290L2Zsa29n?=
 =?utf-8?B?QmZzVklZdTZsOXNUeDllK2NoZEp6bDBWZ3ZubHNrcGpUUFc3UE5NeldydWtQ?=
 =?utf-8?B?WkFBUFlhMzVaSWt6akpLNk4rSlBqSVRLQ3VSS1crNjRpeGpkZUUvRDNDaUhn?=
 =?utf-8?B?TmxuQ0JBTUw1MUpwUndITUJwSzB3YjVHdGlVWTlQNnNHbWlIRk1GT09rSno3?=
 =?utf-8?B?ait0TFRYNWtpK3ZqTGxuUkMrY3ZjcEk5SUpGUmZiZGRvQjdFdWUyWVQyN3k3?=
 =?utf-8?B?UEIxeWZaMmprZWEvRjgxVUQ4ZTJnSGtEQm8zWExlVEdFdDFBRnBZMkNIS1NI?=
 =?utf-8?B?OUZBdUFqYnBoY2szVlY2R2FkM0w2UWZndnZnS1BMelhZTG1pbE9vT01KVHJs?=
 =?utf-8?B?Z3Q2RGFmK0JWd1dLR2hFWXNhN1l1bFNhenRQUTliNUowQkNveEZla2pHL0I3?=
 =?utf-8?B?amM2M3pzcEZGVUxTR1BSMU9WQkdZekJ5TnJhRlBmeDcyZ2N5MkUyYXJjdHFE?=
 =?utf-8?B?Mzl1UDNycjlhcS9SV21VdHFWL1lNWUJJaXQxNE42U2IyNys2ekorY1FCWHZa?=
 =?utf-8?B?WG5oNHBlWTJVbUxYUU5oYXl2OER6Z2xMUENTTDk2QjQ5VjdFMVpOTFpxSVRL?=
 =?utf-8?B?Nmh1akhiNHh4d0pFZTEyeFllM2NMNGpXZENOVUNXYzVJcTBxYnkzSzhTeU5F?=
 =?utf-8?B?cEJuOEpJd0Q4K0FncW5iVThEc0NHeDRlK0ZVcUZlNDgvU0w4NDcrWkJsRXIy?=
 =?utf-8?B?Mm5sNkpVeWE3RnRkVmUwdlpMd1gxRStFZmcvSnp0VzhBLzhQMFZRZ2d6aVlo?=
 =?utf-8?B?aGtDc2RjS1cxaDZKM3R2b25XZHdBUGpGU01EaStEM2lKbmwyYWNVN05nKzMx?=
 =?utf-8?Q?7o7M0irwKVzn9VJqn5x5XVms+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078dcc66-02ef-41ac-1f94-08dd457251d5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 23:19:05.9679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iukj2i+LKp4O5d8jb6+wuxg19lEFqdbN1HjhMvPgdBZiiKVg8J6qEauY3lV5kqjPiNFgrt2jACXAUjlxSk7m5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6817
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


On 2025-02-04 17:21, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> find_system_memory() pulls out two fields from an SMBIOS type 17
> device and sets them on KFD devices. This however is pulling from
> the middle of the field in the SMBIOS device and leads to an unaligned
> access.
> 
> Instead use a struct representation to access the members and pull
> out the two specific fields.

Isn't that still an unaligned access? I don't understand the purpose of this patch.

One more comment inline.

> 
> Link: https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.8.0.pdf p99
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 27 +++++++++++------------
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.h | 17 ++++++++++++++
>  2 files changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> index ceb9fb475ef13..93d3924dfcba0 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> @@ -968,24 +968,23 @@ static void kfd_update_system_properties(void)
>  	up_read(&topology_lock);
>  }
>  
> -static void find_system_memory(const struct dmi_header *dm,
> -	void *private)
> +static void find_system_memory(const struct dmi_header *dm, void *private)
>  {
> +	struct dmi_mem_device *memdev = (struct dmi_mem_device *)(dm);

I think it would be cleaner to use container_of to get a pointer to the structure containing the header.

Regards,
  Felix

>  	struct kfd_mem_properties *mem;
> -	u16 mem_width, mem_clock;
>  	struct kfd_topology_device *kdev =
>  		(struct kfd_topology_device *)private;
> -	const u8 *dmi_data = (const u8 *)(dm + 1);
> -
> -	if (dm->type == DMI_ENTRY_MEM_DEVICE && dm->length >= 0x15) {
> -		mem_width = (u16)(*(const u16 *)(dmi_data + 0x6));
> -		mem_clock = (u16)(*(const u16 *)(dmi_data + 0x11));
> -		list_for_each_entry(mem, &kdev->mem_props, list) {
> -			if (mem_width != 0xFFFF && mem_width != 0)
> -				mem->width = mem_width;
> -			if (mem_clock != 0)
> -				mem->mem_clk_max = mem_clock;
> -		}
> +
> +	if (memdev->header.type != DMI_ENTRY_MEM_DEVICE)
> +		return;
> +	if (memdev->header.length < sizeof(struct dmi_mem_device))
> +		return;
> +
> +	list_for_each_entry(mem, &kdev->mem_props, list) {
> +		if (memdev->total_width != 0xFFFF && memdev->total_width != 0)
> +			mem->width = memdev->total_width;
> +		if (memdev->speed != 0)
> +			mem->mem_clk_max = memdev->speed;
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> index 155b5c410af16..f06c9db7ddde9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> @@ -24,6 +24,7 @@
>  #ifndef __KFD_TOPOLOGY_H__
>  #define __KFD_TOPOLOGY_H__
>  
> +#include <linux/dmi.h>
>  #include <linux/types.h>
>  #include <linux/list.h>
>  #include <linux/kfd_sysfs.h>
> @@ -179,6 +180,22 @@ struct kfd_system_properties {
>  	struct attribute	attr_props;
>  };
>  
> +struct dmi_mem_device {
> +	struct dmi_header header;
> +	u16 physical_handle;
> +	u16 error_handle;
> +	u16 total_width;
> +	u16 data_width;
> +	u16 size;
> +	u8 form_factor;
> +	u8 device_set;
> +	u8 device_locator;
> +	u8 bank_locator;
> +	u8 memory_type;
> +	u16 type_detail;
> +	u16 speed;
> +} __packed;
> +
>  struct kfd_topology_device *kfd_create_topology_device(
>  		struct list_head *device_list);
>  void kfd_release_topology_device_list(struct list_head *device_list);

