Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBC2B201C0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 10:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3D010E2F1;
	Mon, 11 Aug 2025 08:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lNug0YO7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894DC10E2F1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 08:25:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddIfRoKeqFc/9BhBu2znfQFCslEhEfHbKj6iFl9DYlfD8VVpV2IHDdSHjOcuENkp+ViSxw7ZD3YZ4vB4uns+R3B95Qx/wMu5zSYLitF7U5Z2Lx+0S8Nb49/Qm3LxIYLBv8DeOeSeEXu+5nmZy9iVBohNqT7cIvbkUgsOcZPmQdYabS7HnVJ1jznXfYiWW/FkRvo9h1gGAZwXDd137JOZ3yMETpHEipLCuwtdHTcHrZh6p82djHYOJ23kIEj76ym/8dwVCPn/d+41smZuNxD9/7cQEOG87e84xJfvgbMUIV7FhJtHz/bcjv6DA5Pa+8ZfoT2l7tHOQff4aplNt+2jlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=934RRQK9DTVxK+mU/5za46+Ny6QdT6iBHVTP+NLXXsU=;
 b=hlyXJo7LH+qR7sCVmtPkLyWgzsuOSpc2gXr9BGcEJ4FGnAfsxqDwPJQaxLwdI1QmgPBHYWpOv3pd620n+tOoEYgCl9N/Tev0Gtl+0P4m4jChZKQVxXGpz+hkMeQZNZVsxMTlp2bWJ6v53hbniW4XF1VTCnbw8dXC+rdL5Wo5boJo48BrrD6OMTH1GqZn3DKdOkPpu0bWDREmYa1bICKQlPgthZDWNKpoOV5Ko6Uijo4AqQr4Fs7l5M6b8VIEX2/vIbYXPY22OHxIl26W7g6Dd2ndjvaYnlowF7S+O9OM8v9Jcudr1fbK1qNt6mFl0kTwpoX+eMD9yuz6jJVfSpxVXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=934RRQK9DTVxK+mU/5za46+Ny6QdT6iBHVTP+NLXXsU=;
 b=lNug0YO7J8H29grc1b8s0OAwYb7Ev31K8xhS6xyz/9HxTOnVKABaI+pnVmQxmJNrHtYLjyZPwjqOl0nYLSS8vfyVGu8egr7F+bvlOA6vf62EIstn1RfPrD+btF3y7ajAPAloKKAaNlkxTzknw4Il6n0VGXFF9iqlN4ciYF6IJHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB6264.namprd12.prod.outlook.com (2603:10b6:8:94::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 08:25:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 08:25:19 +0000
Message-ID: <b2e02500-0d50-4d84-8ec5-fb8cb753c91a@amd.com>
Date: Mon, 11 Aug 2025 10:25:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: fix task hang from failed job submission
 during process kill
To: Liu01 Tong <Tong.Liu01@amd.com>, dri-devel@lists.freedesktop.org
Cc: phasta@kernel.org, dakr@kernel.org, matthew.brost@intel.com,
 gang.ba@amd.com, matthew.schwartz@linux.dev, lin.cao@amd.com,
 "Lin . Cao" <lincao12@amd.com>
References: <20250811072050.3838241-1-Tong.Liu01@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250811072050.3838241-1-Tong.Liu01@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0245.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f7cf10-357f-451f-93a5-08ddd8b09b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUxOUXhTdm9KMmRKazltK281WnR1aVZmQmI4R2czR0NtZUNUakl1Tmp5WnlM?=
 =?utf-8?B?NHJEQU1JVERFYzBsTzdFSHhGdVdaWllKbGZ1NXlyY3Fya1VnNHNpa21USXll?=
 =?utf-8?B?MnZZc013OGxwQUhlb3VvZWMydnJReVhuZ0lIakZFbWc1aHRQem5YTTE2TThx?=
 =?utf-8?B?ZzlQcTNOeEFuS1VXRzcvdklLWDFNTWt6Vlg1RGVRcE51UXZuYUpTYm5sbndu?=
 =?utf-8?B?TlQxem92c1RoR3djYmNwS3hDcU9mQVd5V0hRQjRFMkM4K3JoYTh3REpwVDAz?=
 =?utf-8?B?UWhkaFVna293ZlpJdXFudTlKd0dxSVg0YUd0WGtaTCthbCtoUVRWV3AyQW1S?=
 =?utf-8?B?dmdYa09Yc3FiYjk1UG0rWGFmRFlhMW1HNmNCeTczVVVBQkx1TlhBeVJOSEQ4?=
 =?utf-8?B?djlsYVJSZUlzZUhlMUFKTFNYYThBNkFqcW9LbTRmWmFRNTFJZWgvNDRDUm9N?=
 =?utf-8?B?Q2s4M1A2LzM4azgxU3M3WW4vN25qdEhhT1lRSk5HZjhJRDIraUVWSU82bjMr?=
 =?utf-8?B?RWlEeko0K1E5T0tsVENPTHdjSTJ5OFhqNmNVVFJsMHNGU2VCWjZadjAvd2l3?=
 =?utf-8?B?a2NxbzhSQ1Arcm9PTURZRzFsRytPRkRnYVVRSTR6dzNoR3VsZHNQckRqNzlV?=
 =?utf-8?B?UUhWS01EbXpYQmE4ZXBiMGR1RFFNemNFSUR5ZTNseEorb2Y4QXRWOXVqeWZ0?=
 =?utf-8?B?ZGowMXJkQ3RTN1RxY0trMGQxa2YvOWFqb3FYcW1wa09wRFRySlgwRXR0YWwr?=
 =?utf-8?B?NkRLanQwK21kMmpTazUxVjByYlJHZGhWM2FRWGl6M0FoeWxjOWFzbUUxNnNI?=
 =?utf-8?B?eCtqbFlmMGxFQy9MN3VKYitSTm9RcTkwWjVqYTVyL1RxeUFobnErQjU3cm0x?=
 =?utf-8?B?NzlpZkhHQlhYVTFsTklvU1pXQ0orbmF0QnI1OHh2dkdNMHVEYmNsZ1Vwam1x?=
 =?utf-8?B?MkRGMkNycTdqUnhabTN4ZzdOZWtrTEFISWh0TWs1OWhxT2hjMXV3RSsxMk5V?=
 =?utf-8?B?UUY0QmhLTFc4cGJRR3ZsSmV6aWRDblhtc05jYUZkK2lwWWl5LzM4UDc4MVZ5?=
 =?utf-8?B?VkhzUVJGUjBVV0JvbjF1b1paWS9DbGo3T0VlbVZVUmo3Zi9UTHo1bDM1Q3g3?=
 =?utf-8?B?V1lWc2dmUkNuOXc3RUNQYmh5VC9YT1QxQWw0M3QyaUxTd0pOem1pVnRlYlJ3?=
 =?utf-8?B?RTBvbnRJeDlUVCsyWmxUOHZxbExEcmNsU3I3VjQxZTBGQWc5QlBPUVE3LzR6?=
 =?utf-8?B?QjU0Y1paSVZnZGh3akYyT201Nk1qejFGNHNzVkoyRGpMUDhDTC8xM21xdWdU?=
 =?utf-8?B?RlZkeTdOdXN2aUtSVW0yOUwxSENLOVhrbWhPTmpiTVJGd3NEV2wxcnc0em41?=
 =?utf-8?B?MjI4TVZ3a25lM3BPMVQ3K3VjSEM4eWZDcVRDa0NBL05CUWdZUURtS3p4RE5X?=
 =?utf-8?B?WDhlOGFoVTl3WHNXN056emNwVlFoM3Q4djJFM1lYZ09XWEVCdlRKMytBVHRG?=
 =?utf-8?B?QU9MaURKRmxmak9SdUZqTHh6RnJIMVc0ZkNUWnFiVkVWMkZvOEUxSkt6OW9U?=
 =?utf-8?B?dmNMY1BTSGNiTlp3K2R0ejhlaVR4UjBLYlc3akpvWEtKa3hnRzNQMFpnQVA3?=
 =?utf-8?B?VTRIVG5ZQVhIZCtmMG9LcDVoNEJLaFAydXIrWTVBVzZQTGNXMVE0d2ltYjQ3?=
 =?utf-8?B?SHhZdngwRnIzK25nU0dwTHZpWWVxNTlSc2tQQkNKQlMyb3lUdk1FYlJwKyt3?=
 =?utf-8?B?dWlhNzJLWGN2WXBaY1E1MXZmWkZwV0tJNXlDVEhtV3YrM1d1RHZJVTJaTDhP?=
 =?utf-8?B?Qk15Mk9IWFZ2QzZxdHJTS3RwY1BRRGRjSDdCV01hSlJvU1NmTi9FK1d3bit2?=
 =?utf-8?B?WStDUUpCeUd1NzUwekI1M1JVdjg4UnBZSzJ6eSt1cWYxRlo4alF1cThHQ01t?=
 =?utf-8?Q?qwJhSWDFeYk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWd1aXVDT3JTUXBnSzQ1cUtrbUtNanVWSmdwdlFEUDNsTVdiV3A3eE1CdnMw?=
 =?utf-8?B?eDdxZUZzdUJBa2RpV0xBcVRHQms2NHd2OFdwaE5uYWV0dXQ2R3hBdndITGdH?=
 =?utf-8?B?Q2ljdnlIZisxUE1UT20wejQ3UmpCTnJWYm1SWlRDK3RKKzAzelNHeUs5Y21S?=
 =?utf-8?B?cU00a0wvcUQxZWR0V21yMlRKZWhaSzRobzBtZ2xuVDBMUm1uSDlrMmpsNHpt?=
 =?utf-8?B?UHdzR3I5Q3FVNldQVTNUems1NGpqejFGdi8rSE4zdUdPaVlUR3ltK2JhS0k3?=
 =?utf-8?B?ZUJBTzNVMHpTWG5KbjJpM1hwUjhKYzVabjd4NjFoeFRJaDFTOWMwSG95YzU2?=
 =?utf-8?B?aUhiZjVDdkhoOVBJSzRvRHJVM2hoL2tlRXNxZkxNeXBkVmw1N0g3OUw0VWRm?=
 =?utf-8?B?ZmcwV016Mmd3d05kQ3F4QjlUZzUwMWp1eHI1cS8rUVFPS0Jnc2Z2RTVXVVQr?=
 =?utf-8?B?ZjRxUkhVeGMvOXRPNldvOHlrTWlKSitKUHkwdHBXMEs4R1RoMGVERGt3NUJl?=
 =?utf-8?B?N2lBbFBzQzFMY2ZNOC80ZThkWWJhaUcxUFIrZTF3bWFsM0tJTlRVOW96Y2hH?=
 =?utf-8?B?NCt5Y21YMUM2Q1Job29DWURaNmFUZ25xb0RvbjdYSG1KT0ZSTUN0S0V2a0N0?=
 =?utf-8?B?bnlhTVFJMjdiUW5ZRVU2UzBCZm8xVE1SY0pmOGRxdG9xYjEwQkdhQnMrUTJE?=
 =?utf-8?B?U3JiNDVXbHl1MXlSb0hGU2QzRlZmbWVsRU4rRFJEU2hBdDM1d3lhSmh0a1lu?=
 =?utf-8?B?MWxrdzFIOVZBSFc5cnl6d0RGSGRGVW1vMDAwY1pobXhWWGNUUVRJbzZ2UlhH?=
 =?utf-8?B?QUx3c2haRWw0ZkI0TTdqTXZCcUExZkVkSHdKMkhSbmE0Q1g2azNCUVdxWEdr?=
 =?utf-8?B?d3BVMVlENnNCUTQ5UFNLTnU4cFpQMnJwclJpOUtVSFNaeWxXcTlPMVNqWUt6?=
 =?utf-8?B?a0NwRWFzOVQxdmg4UHFRdk5tNjVnWC9KcnM0UHJ4YzJzeEc0MVgwVG9vMzVh?=
 =?utf-8?B?ZGFqc0t0RmR5dU5FamE2dnNxd0JSVFF0WDhnYW0vNjc3aWNQRkhoVENYNzFw?=
 =?utf-8?B?UWZwQmdpMjJNM0piWTNFVFZGTGphdUpkcEVOT1FzalVsZXEwaWI5dHR0L1Iw?=
 =?utf-8?B?cjZQOE1EZW1sTUsvd2U2NjB3WGNJZTBrT01lOUlBWHhwaTdMWk9PUTBqdGJs?=
 =?utf-8?B?Ty81NTNjQXplRkNSTUlML3ViUzkySnJDMjRWajM4QTlWbmxsK3JFQkFtcFhk?=
 =?utf-8?B?S2VEMzNiWlExOXRQaG9NSnFiTWd4blNLbnhjb3g2MlVCTllmdllZcFNueDN6?=
 =?utf-8?B?aGE3dkl5ZlJmWEs0Zi9YRTR5Vk4wU2NQSDlJVU44ZXExNVAwc21sWW9qOXV2?=
 =?utf-8?B?b2VuNDRGb0NqRGdUUWpvMlVIUGFFKzA1QjAwVStOWFNNdlZPUXgzNzVPM0xs?=
 =?utf-8?B?UXlqQjFqaEMrdUozWXAyeUxDWE81aVNhc2hBQWdxSHV5alExNFFtc3llSU9G?=
 =?utf-8?B?QnAyT3EzYmFldUlXM01FUkJlbHRnOEQxNU5SZjByTURZWUVsVDNpb2tEK0Ni?=
 =?utf-8?B?T3RSUGY1aXl5cS9WM0srVGUvTkE5MUFyQ1R0MW9JQmVnb1VHTFR3UUp6cnNY?=
 =?utf-8?B?YkF0V2ZYNlJLMFR0bkpaK2FKV2xwUTllODBEait5VUpmWjhxSXpkbjBwdWtW?=
 =?utf-8?B?TTBwd2ozM3JpNVkzZVZBT0JyNnlrZ2h6VERYcGhBZzVDeFlQUmhuMTBzakc4?=
 =?utf-8?B?eHFId29SUktzUjBPVlE2ZlRsOURiVGlyRisvaUErNDRRdzhteWV4VXVlLzJE?=
 =?utf-8?B?YWw3MFl4RXB0RUptYjZqSGlDRXRxMHgzckNGd081T094a1BHa3ZIWTNjRHY1?=
 =?utf-8?B?Q3BSSnp4Qm1KZll5QndJV2dJRklJWWhsOWh4cTh5MmFtTUE1S09STWFLZ1ZI?=
 =?utf-8?B?TkdxZlk4dTMrU2YzTlB1UWJWRURXdGFqajZXTlUzdFJNY2ZmSE5EbENvYWRB?=
 =?utf-8?B?T2xEcWVXRWlwSEdhSmthaElYZHNJb0NEQlBaUWpxR1Nvc1JLRmpIc2h4TEw4?=
 =?utf-8?B?MGlvS3AwTkYxa3pvaEhDbmZWRi9FRUFjbDBydEZpSmZRZ0FmZkJxaXJpVzFG?=
 =?utf-8?Q?2WTWbNTrmJw+MtAcXtoIK3bP9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f7cf10-357f-451f-93a5-08ddd8b09b82
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 08:25:19.5152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: to5JMWCuP2T0iVaFANsimXOMLLmb2i7YqsAwcW/6+sd3XuChpjJApVpECeEwMup5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6264
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

On 11.08.25 09:20, Liu01 Tong wrote:
> During process kill, drm_sched_entity_flush() will kill the vm
> entities. The following job submissions of this process will fail

Well when the process is killed how can it still make job submissions?

Regards,
Christian.

>, and
> the resources of these jobs have not been released, nor have the fences
> been signalled, causing tasks to hang.
> 
> Fix by not doing job init when the entity is stopped. And when the job
> is already submitted, free the job resource if the entity is stopped.
> 
> Signed-off-by: Liu01 Tong <Tong.Liu01@amd.com>
> Signed-off-by: Lin.Cao <lincao12@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 13 +++++++------
>  drivers/gpu/drm/scheduler/sched_main.c   |  5 +++++
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index ac678de7fe5e..1e744b2eb2db 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -570,6 +570,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  	bool first;
>  	ktime_t submit_ts;
>  
> +	if (entity->stopped) {
> +		DRM_ERROR("Trying to push job to a killed entity\n");
> +		INIT_WORK(&sched_job->work, drm_sched_entity_kill_jobs_work);
> +		schedule_work(&sched_job->work);
> +		return;
> +	}
> +
>  	trace_drm_sched_job(sched_job, entity);
>  	atomic_inc(entity->rq->sched->score);
>  	WRITE_ONCE(entity->last_user, current->group_leader);
> @@ -589,12 +596,6 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  
>  		/* Add the entity to the run queue */
>  		spin_lock(&entity->lock);
> -		if (entity->stopped) {
> -			spin_unlock(&entity->lock);
> -
> -			DRM_ERROR("Trying to push to a killed entity\n");
> -			return;
> -		}
>  
>  		rq = entity->rq;
>  		sched = rq->sched;
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index bfea608a7106..c15b17d9ffe3 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -795,6 +795,11 @@ int drm_sched_job_init(struct drm_sched_job *job,
>  		return -ENOENT;
>  	}
>  
> +	if (unlikely(entity->stopped)) {
> +		pr_err("*ERROR* %s: entity is stopped!\n", __func__);
> +		return -EINVAL;
> +	}
> +
>  	if (unlikely(!credits)) {
>  		pr_err("*ERROR* %s: credits cannot be 0!\n", __func__);
>  		return -EINVAL;

