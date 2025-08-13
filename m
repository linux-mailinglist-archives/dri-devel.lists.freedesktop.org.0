Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C08FB244E4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 11:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1264310E6AC;
	Wed, 13 Aug 2025 09:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fdNaJdSH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62A210E6A6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 09:03:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rpl5/WQ/8oZyoaApxBwEWGW+d/f48OcjnImg2CFMHXV9tTeTouNcNi/8cSHlT7X9Dfzcdw2tmLkwo12PRIeYDAUA2MgjT/9OaIv58NdB9uyPENl51AoBFX7OEOvFW581MbsqdQ21FcvZXy3YEAdit2Pc1RodMnVpkHQk1f1YkrKO43px4S9jYtkaD6KC4BaF3kdKkoyKRIPbbvLrdm8XvvDEJYc1I2VWgFV1N7Dcrx1j1qFBLlyEBduUDZLpwv9zgExnrzlGH6kErJ1VvInBd5j9uzN/e0FvEq4gx71x7fru2NHwSNYy5HgcsFBMJ+Li5y9vbi+OCQBBNMYC8HxLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fKkahLt9C6Vt16hydKrtz6PkxghzWq2t9ExZ7HM/ZQ=;
 b=jSrvIU7qQdSPqoIfVjdszTLkeXAKMfG6tSnx3S4pVYSjKhOKfTPjiMpkMoDziUOzN6iNSYTBrKMkceZrZ82DySxno0mRnLGvgEgfmWsLPsU1jO5REyMxC3xZfRBZOSsLuN7FAjT8uqEJwFqzmQTdPCDNXEK9OssxBmOY3iqh129J1/2zkCQEuYJnvnTvaL2kIFUNwtqHOSxV53thZDN3WoI/PAfYSlKq8oXAuwdKNNOc3PkmAG1QA7Qc4Vrku5mKSn1DITQqcGODKDfCH9hYYwpeiMTcTLY2iDqRyBJwPpkHrFELvu/zKVynpu9bgibMrACraRRTT/vAbQW8SKwXpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fKkahLt9C6Vt16hydKrtz6PkxghzWq2t9ExZ7HM/ZQ=;
 b=fdNaJdSH8noisQymIPQZe1v51dFmg8DT0jDl86arEsdylc9YSFGldxf56N7TDBS4MJp2TYoiiWYQqS8RQu5P1K6tQxa/KgrOJEx9i0mpH2vb1edZ87LOSg3zDlMFMBWkutxtBIMlzDlZIf4sRvWLwyK1eS9vj8I7ITqAbh78sV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8787.namprd12.prod.outlook.com (2603:10b6:8:14e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Wed, 13 Aug
 2025 09:03:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 09:03:15 +0000
Message-ID: <36f76e46-580f-43d9-8726-fe13e0c1bba1@amd.com>
Date: Wed, 13 Aug 2025 11:03:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Document race condition in drm_sched_fini()
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James Flowers <bold.zone2373@fastmail.com>
References: <20250813085654.102504-2-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250813085654.102504-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:208:329::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8787:EE_
X-MS-Office365-Filtering-Correlation-Id: fe01e5a7-9ae2-4eac-c62e-08ddda483caa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1NsKzVCWGpNOU1Oc0JnZTdNNGJjZnhrT0cwZ2ZNZXZ1Ui9TNURPYmI3K3hz?=
 =?utf-8?B?TVdZd2RxanR2K2Z6TGZOeFpxcThFQVl0bTdDeHpBK2ZpYjczU0duMEpFdEl0?=
 =?utf-8?B?UWRySThZZGtTNnEydFVRS1V0UUg0cFc2Q3o4YXc4MUhmZXppblVOZm91dmxl?=
 =?utf-8?B?YTU5aklWbUwzTDJnRWxWUDAvbmFkK3JYamR3MS9yMzljNHR6RUR2bzQreXdV?=
 =?utf-8?B?emlxZmtGSmhNa29rejFIWkpTMWhIaTZ2cmt4a01UQ0plNnVIeEYvdmhJSDFw?=
 =?utf-8?B?RW5mMk9pamYranIzdTlKVjJjVjJmZzhGb2hmR3RvM1lneXlEUFpDU1hHNVh1?=
 =?utf-8?B?OVZwZDhLWEp0WXpqZ2NCaUQ5VmdOc2hTM3Mzc1VJcUZjVjZFZzdEUzNvQWdK?=
 =?utf-8?B?bUgxTGEzUlhETVBXQ2Q5cllublREYTk5NHp5ZkRSb0hhNDA5YXc2NUNYNCtv?=
 =?utf-8?B?R3cwaWR0YmtFVWd0azc3K3B6Q2NzYVJ3ZDc0SVZONVI2MHc0bUpYNElSdER3?=
 =?utf-8?B?Zlh0ODIrcVBSd1RqRnJTSEdQN2l6MllJRG9JVHBqa2IxZWw2eU9hK0NQczJE?=
 =?utf-8?B?SGluekdEcFVPYmdMLzhLcUdIS252TXRjVktGSWFTQWZxUlRlcUVqeENhRlNV?=
 =?utf-8?B?UlUzc3pHdk5BcVlLVW5vck54SXhFeGdHZGk1S3JaL2M5R1BSbnEzbUF5SHdp?=
 =?utf-8?B?TXRJV3FkNC9VVzFSWmw2dGJEbXZLTVdNTWNJbDFlZEp4QWNBbC9maFhCOUYy?=
 =?utf-8?B?K3hTbFBzZEN0b1hCQUlYemFIN3FCa3Q3VzhzL0YrSVZyaTJDOFJuMnN3dzV2?=
 =?utf-8?B?VklXeWZrQ2lyOE9JSTJyK3pRNWxrU0xyVU1XZjVxU0d1M3NuWTFtQVRTcVpt?=
 =?utf-8?B?L3dwNDFIRWZnNW9hRmxadGpPNjB2dXUrMXR4QlRTQ211NmJBbXVOQWZ3dUxB?=
 =?utf-8?B?MkxJQmpOSzlMQXJZL1NMVURWM2pnS0lOWmVGR3ZRUWYreENEcGk1Mk8vL08x?=
 =?utf-8?B?eDY4NjI5MENkV2F5TEdjVzI0aEJHaHZCN0lGRDhKN2tyUnlHWmNQOWVCOXZZ?=
 =?utf-8?B?MFprbFBMTDUybndoME96VjFpUXg3WUtDelF4Z2gyWEFNcGRHWmM5MUVHdjVT?=
 =?utf-8?B?TWQybWlLbk5iNjA5eGhXYkFoVlR0d0dJR3djUGVhQUZ1S0hGa2FUMFdWalJS?=
 =?utf-8?B?TS9VYU1aeUJEQ1lCVWxHdG94SXkyTlZISCtHQ0ZGMk9vbFRLNEVCOEFoZDl4?=
 =?utf-8?B?TldpSzZjNWNzc05MYnA3Q09Idi93YkEwalQzdHZHTURvMEc0Y3lrS1Q3U1VM?=
 =?utf-8?B?aUxnRi9ET2QySTVnSVRWZmNQOWFtVzhzMjNEeU1vczRjVGZweXBXSXc0aHZV?=
 =?utf-8?B?ckcyVmd2b0R2TXJoUTZ4YjU4SFlqaWpHNWRYcm1MTU5ZM0JqVDI4aVVYMDJR?=
 =?utf-8?B?SW9sT284Y2QwYUJ3VCtKS0tIYlFYVCtMUkhvY0cxMGk4K2x0bGFWSGk3cFN0?=
 =?utf-8?B?Q2szVWhycjk0WEFQN2FJRmJhVnNDK0F1RFJzMWVwUTNIR2lUcWxOYWhCUExQ?=
 =?utf-8?B?cHgyYkVKclowMHo4dk8wUHhCWG92a0dHbUpiRC8rQ2FUK0NYUU4xV3FSVlJp?=
 =?utf-8?B?UGpiZDJuTlk2RGNYRWRyMEJvOGRBd2NYWlFRMjRzT0Y3RVhSY0FnYXdaT0ph?=
 =?utf-8?B?RndPcGpxczFyNkF2RHhpZzdMUHdHeW82UXlIbWMzRlBOa20xOHJwc3BscG91?=
 =?utf-8?B?SVZheGVpM2YrM1lVenF4aDRlZ3I1U0kvdklVZGd0WjNieVFIZU5iOGlrQUNm?=
 =?utf-8?B?N1pUY3B3RDZocEE1YWZ1cUJPeE8xTVVnZTdWN2dXMzBTc0NtcHJKNnFGbzJx?=
 =?utf-8?B?aS9ERVlSVmJnWHdJSmpBcmFNc1Q5ZjBlRVlTMm8xNFprU3NoSlA4YkhCMStz?=
 =?utf-8?Q?uBPS33mPlG8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVUyWGF5N0p1TFY3K2lWWllxSzZYUlRDbmFaTERCODVKcXk5a0I4a2hWS0RD?=
 =?utf-8?B?MDRMYVQ4RVZYQ1RycE0wRWhRODBuWWpJQ2YyM2w5TXp4M2RDS2R0WDdpMC9a?=
 =?utf-8?B?ZXhDbXh2Qy9pZUJLY2wzY29VQ0lpUGFSdFFnR1NSWFB3MVowYXdOSGRRd2Fa?=
 =?utf-8?B?bzJIQVRvTUp6MTJURW1wN00rWEhEK0M3TG5ZY1lDRjhDeExKUEJ5a2xzeFBE?=
 =?utf-8?B?SDlDNVdNT085eG1FejNmTzdzSnFDTmNCQUY1SGFVejN2ZDVRV3Y3dmM0c3lp?=
 =?utf-8?B?Y29ubVJndUxDTTJoZ3VoRHJxMkVYeUVBam9LTE4ybjR4dE90aVY1QU0xenNx?=
 =?utf-8?B?bmdxUURYMEtpOGtaWDNkY00wS0kwc2lmUUxvbVdTR2w3RkJaRW9jelAxdmF3?=
 =?utf-8?B?WDRBeG9vMnZrWUtJUmRxK21WUEwwVElJcjMxS2cxWWgzMjlJVHdESy9QaFBs?=
 =?utf-8?B?YXltL3pTVkVMb3BabmVya2F3RFh2c252NndRalplZlBtTXl4TE1Bc1FVWjJI?=
 =?utf-8?B?SEdvWHFzQTQ2MitwdldkNlFIKyt4bXc2Zk1MY2h6QUxaMlN4eUtOUU1jSFd4?=
 =?utf-8?B?TnY3U0trenVPeXlMZDN6NHZYS0xhbW5jSnNIK0xUS1R6RGZDZnhMMlNrUlFY?=
 =?utf-8?B?VEp1ZmFUYUdDTFByMXNZQ1dCd1FQRkM5Y09DZnVDa3BVZExpdHZzMmlFSjlE?=
 =?utf-8?B?YU9wSjQyOHJURE1lVEZna1psTitvbFJudUg4elF5OEsxYU9EME9IV2NxeGZt?=
 =?utf-8?B?VXVPakVGNU91R3pmTlVpNGI2bDlROC8yT3N5a28yNmpzVkpGMlorZ0JoaXo1?=
 =?utf-8?B?TDF6K3VYS2NZRmdGYzlpdFp4NllMRVE0UVRaWmFQdmJxQnp1WjRWOFdMeGF2?=
 =?utf-8?B?OFNPdE9XSjhJdk1xMDM2d1BQVGFZRWhIV3AremFPekhDSEFsVEh6M1VRblRp?=
 =?utf-8?B?Z1RGTGZFQ1VHYTQ0aUpQSHJRWHdzUGJNbmxLWjgwejBvTG5pZmEyOUQ5RTE0?=
 =?utf-8?B?MzJZRDdEbXVOL0h1YTBtSVdNVnc5OGdRNlE3ajNyOThFKzFUOCtOWkx5WWhy?=
 =?utf-8?B?Y0laSTI5NDJPWE0yRnRhVjBRWmRHbTVNdTNrZEh4cFhiYTJXc1kzMzVGZzYz?=
 =?utf-8?B?dlcrc1VGZDVoUnIwTXNlTGNVMWh5TW1FTlhYdmh2dlp6Z1NmK1l3ZXhFTHp3?=
 =?utf-8?B?anFGQzlKN0RCbUtjWE9sRGEyTHJFdjJkbk9aWkh4czlETnRuT2xlaUxRbGxl?=
 =?utf-8?B?YllQVDdrYnA1Z0lrbXpBUjBKN2RNd0xsWU1xT2YzWXRMUlU3ZkhEcUx6WW4x?=
 =?utf-8?B?enBWaDdWNDd3UDQ5MlE1RDJrQXlJTkF0cTNHTFBwRXNBWkdadlZreWZxcnJx?=
 =?utf-8?B?bHV5UVpybUwyVWdRdjBPNVlTdnp4ZllzTXJ2aXhaQUkxeFB6OHFCbWFHdGxV?=
 =?utf-8?B?eXJaZXVHVkVUTEFHVVdnRVVzeVd3UmFiMkVoeWtJVXFtUFVoSEpieERRM0ZQ?=
 =?utf-8?B?SEZhcXFXaExwRDZZRERjNU9QS2hyWCtXTXZrSnVmUHh4aW9ld1JwY3h5aHE1?=
 =?utf-8?B?RjBJWUhRU2w2MERGejluWEI5dG0vMzQ1Y3h3c1hUdmo0WjVZYVB2MTdXa3Jh?=
 =?utf-8?B?QXlVQTBpWVludlpYeVRRUVhJdzNRc0dlK0JmYWh6dlU0Z2FQRjRVdkxLMWh1?=
 =?utf-8?B?MkFSVGp5bk5kUVZCQUxVVW4vODVzQ2xDTXRrb1k3Nm9GeUNGa25DZzBJUDVN?=
 =?utf-8?B?Nitsc3lUTlBoeHozRUMvYUNuWXpXNnNQNTRMVjRFZmRPMittUm9Pd2cweG1Y?=
 =?utf-8?B?UDdzRG9oWktIRHZERmFVeEswM2ErU3gzdUt1YnkyZzF5Vlo4VEF2QnJ2aWZP?=
 =?utf-8?B?YklERytuYit3cnBaVEFyaGJkbTM5L2VQVTNrTFJzaHQ3TytTY2VERnhuUHhy?=
 =?utf-8?B?L2twZnE5Q3FqM0FJclRTek5VV0dEWXZwcjQvaGRyVHRhU3hNSXdJZHFNQzZU?=
 =?utf-8?B?U1FyYUs0WU5PNGNnQ0lGVWQ4eG9jM2lnMldiYVhYVnVCZHg0ZDBHanQrV2JW?=
 =?utf-8?B?a3YrNmhGREs4UktpelcxY25IYXM1dnhPRWZMNDd1dFA2VTBHSjJMRkkvVXVL?=
 =?utf-8?Q?/Pi+9CxCV5lXbUdS1OesLYnfP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe01e5a7-9ae2-4eac-c62e-08ddda483caa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 09:03:14.9603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zWtctjQZxspwUITfmUZPILoCQ/aHZaPa/q0NUf/BcrJWaMgrzY4wXKa4hwhrxvn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8787
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

On 13.08.25 10:56, Philipp Stanner wrote:
> In drm_sched_fini() all entities are marked as stopped - without taking
> the appropriate lock, because that would deadlock. That means that
> drm_sched_fini() and drm_sched_entity_push_job() can race against each
> other.
> 
> This should most likely be fixed by establishing the rule that all
> entities associated with a scheduler must be torn down first. Then,
> however, the locking should be removed from drm_sched_fini() alltogether
> with an appropriate comment.
> 
> Reported-by: James Flowers <bold.zone2373@fastmail.com>
> Link: https://lore.kernel.org/dri-devel/20250720235748.2798-1-bold.zone2373@fastmail.com/
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> Changes in v2:
>   - Fix typo.
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 5a550fd76bf0..46119aacb809 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1424,6 +1424,22 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>  			 * Prevents reinsertion and marks job_queue as idle,
>  			 * it will be removed from the rq in drm_sched_entity_fini()
>  			 * eventually
> +			 *
> +			 * FIXME:
> +			 * This lacks the proper spin_lock(&s_entity->lock) and
> +			 * is, therefore, a race condition. Most notably, it
> +			 * can race with drm_sched_entity_push_job(). The lock
> +			 * cannot be taken here, however, because this would
> +			 * lead to lock inversion -> deadlock.
> +			 *
> +			 * The best solution probably is to enforce the life
> +			 * time rule of all entities having to be torn down
> +			 * before their scheduler. Then, however, locking could
> +			 * be dropped alltogether from this function.
> +			 *
> +			 * For now, this remains a potential race in all
> +			 * drivers that keep entities alive for longer than
> +			 * the scheduler.
>  			 */
>  			s_entity->stopped = true;
>  		spin_unlock(&rq->lock);

