Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0K4OO5Kspmn9SgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 10:40:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8964D1EC017
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 10:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A9410E753;
	Tue,  3 Mar 2026 09:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u/Lybpk1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011005.outbound.protection.outlook.com [52.101.57.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6F310E13E;
 Tue,  3 Mar 2026 09:40:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbyqoETcS6IGKyD9wno18J8a6kknY3fSj8CUiLCUR9jYYh4b6M36iiyxII4qjJ/fvQelxPsKQG+lBTyHIXm8Xq7prYuu8uHS68l02ra8s44cp601oxajIj7Pf3tUaiCmayTV3XufVPU9IVMxM4AmCz2ZGpyEQ5cjZax+bRpqJkOc0YKCrEtIfn4Vx8d39PfegTLEuuwajmqDBeI7LLwdSBWXMKtf/WiMIpwgrxPmIEiIRtPpqiBlOKLlur6Jms4zhGWlncP4ZdQSTCzMQ52qWDlMPp29uMDYt75cAHMctoKdPDFIscaH7wEPBNh0SSoEgu47AMWpRSPQppNbNQrvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QHZCzr5PmuInSFn3ve0tB3rdiAWkSSeA0MOVxwLyeY=;
 b=rlkqp2UG1x1esksjeslTe4zZ9wzpqoYhaX2PV6YlnaXbtYh0MitjdCjLpaKsT4VTgHgWZGRhsEWyBHj8W7qcnhf7iNBZIRZyz2Xzs3xj2EZDOJXyWcgN0VsXaM9tyRqEUo2VW8uiJDr0F7qnWkCdAN8EPLW8E0RkTUyoMSf6o3KwewUtwR+oKYTvny62Y8/9ofF6BEFAIkPn5PiIeb7kF91xXOVwGREnduZiEzdfaM26BeAY6eESXYK95BIFkivvvawJFCTLcr4WaPeB6/D9jQwKBa76isq4fvwSyBk9abZcEHSE7bVqnvCMKtakat9wZYlmpDDkLAVV/gJ3NC3WDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QHZCzr5PmuInSFn3ve0tB3rdiAWkSSeA0MOVxwLyeY=;
 b=u/Lybpk1St+b7dXpBlhrVCCJn+gOmWq/Bz94Cy7AEVG4RLQ7e4nbyni5oWjmsFVyOhQLGhDxpFyvsHIhQlCARhkR3uA9VO1+r9Ug4YBVJHNXQVAEQIuAKzOTtFreXHMi+9vrUxebmfPixPbTX93kCGSizvvHcCXc6B/2HS4im64=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB4119.namprd12.prod.outlook.com (2603:10b6:610:aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 09:40:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 09:40:26 +0000
Message-ID: <03f173aa-eb64-43e9-aa1a-570b3dce4b9a@amd.com>
Date: Tue, 3 Mar 2026 10:40:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/amdgpu: move devcoredump generation to a worker
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260226093727.2584-1-pierre-eric.pelloux-prayer@amd.com>
 <20260226093727.2584-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260226093727.2584-2-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0386.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB4119:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af7d161-df2d-45a8-2085-08de7908e5c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: liGvTHXO6GM7p3VSAkzN9iJuXGzAiJfg5GLGXiBWPc93BEodbrx5HfGJDG1R/96y+upXFS+P76oB9NThR79UXtLYi66sJJ0GkXoTej35PzOBifu9e57Bs+2wbWwwfIRH8sANnAGpIuoJwdAQ9mVFYk9jVZ8QItFK4pRAhegKhSCV638WtRjkA0SC4DTeuI+mc0vRB27UzN1UI/lXzr+gbvGA1jto7L83Ii0EaHlK7Uqg4gu1v49YOBLYymF1RpqfmU1eGvUCn/3g7r8rI62LjvvV57OqC3GU+17rM/XCmho8OeksnIm89vh3JuokIXN+DiSTmEJAy4JUSjYWr3Nml+Yfcj+FaCqzW0L/94W5WEYIQbO6wEr70hOfNUoNrCQifM8tfWSHyAYV9vFxS+8QYkdpduPSsUnN3YjuBSUOZPa9xn/M3h7OstBubbOwef2Z4NeFaZD1cSryVmShoRurlsPg4Br7j1fmOtxKjkUZ1L7WW45OYE1Y9mFddPRuwftPbeTvijx0hcKXH+vHZsFkddth0YfIDXNOUbE+Dc6Rkvp9iryg4rttHy6aFTrwAeRypIdsG//WW1l00Nei86jVpko4CUtHbfSRJHJL6dX9U2J7ZXdJF5U2bMAjaCAQpanSeJyY9jJVYaPSSSVSm/1mHs3K77RahCjMoRB7cbqdoCpap9jOAZ5tEvTWTez5aHy+eMN76JnHkqtVYytX213RvwlcxX2oaAy8ZE9/pYV/6uw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFZKdXJrbEtINUNUUjR4QWhYYjE5U2VpV3RWQW5TbzNUUDgrUmpWS3JFZzFm?=
 =?utf-8?B?eHVHaStEVkhFdWpHVHlmeHFCS3BtV0I3M2RqNWJoNGpxZnpSc1BER0UxZ0xZ?=
 =?utf-8?B?TlFiNE1IQURjVkI4KzJzQm8zUXRQNGFQcjF4c25MM1hBbmxtTFBhSFdvaHk4?=
 =?utf-8?B?REJHMmc2d1Y2d0RYZTE1TVZhdlFRS1NxMmFvWTZCWVkyS0p3QnpwRUJMbGRh?=
 =?utf-8?B?SHI2NlpBZCs0MXpmM2dKV1ZWeEkvRzFET0ZvR0MvUlU1bTdULzJIUU40M2dl?=
 =?utf-8?B?M2Y2N1lpcXJoaDRvUjBHaGJraW1NUkFPQzRxVm9jdU8zV1FQck1IMmZOVEx4?=
 =?utf-8?B?NTJhd0ZTS2VGVG9JT3huQjlyNmN4YlB0Q2NxTHVHUkhEOGZHTkJZT1RZU2d6?=
 =?utf-8?B?dzg0MEdwWkU0NjFPY0xpMUxMMmJZcE1kZnNoVFZ0blE5VElPMG9QaW1lQ2Vl?=
 =?utf-8?B?djR1Z0Jsb1NFTEJjaFUxWTZMYlhEVFpKTGphR1R0K2d3dXFWK2VNd0l4L0VG?=
 =?utf-8?B?aE53WW5DcVE0MkpGL1AxeGxFUWtSdGUwclJGbU9sNXNQcmN1RWNXbWdkS2Vk?=
 =?utf-8?B?OUNQb3F0Uk1rYU1aVG12RVpIUUNhVTB2dHM1Q1VxSE5BMitnNHNZSVFIc1dS?=
 =?utf-8?B?WnVETkRVU2tMOElJZ0VLSk14ak1ZU3JsVGFjZWFZUmpEaDNqWEc3cWhDYWt1?=
 =?utf-8?B?aURnZitHRnllUHFncmhDOGRRZ1c5V2srNXVzeW5PdEI1MktPZE1wYTlodnB4?=
 =?utf-8?B?VFlQcFVVVGtFL3lZSGJmdHJUMzhhdEJHdys1WStVN3JldmxnSy9QakE5cjVa?=
 =?utf-8?B?azVSL2dPb21EaXB5cGtFY2FVd01LR3BUeDB0RlY5bS9XM1luR2UrcXNKYkNW?=
 =?utf-8?B?VUJnNjNpcjRsQkNjUThoOHNINUFMY3F4eGwxcWlmSTJzWUZhcjRYU1cvTy9U?=
 =?utf-8?B?ZVN5T2xRWXBlSWYxM2N4ejY5Yk9aTHczZTNOejhORkpYTDhmbnNpTWpzcVNI?=
 =?utf-8?B?anBSYmpKUzBqK3MyaCtmMTgxbEtVdjNLdU1lN1N0dGM1cUludTdSeEVPaXp5?=
 =?utf-8?B?OG9ESWlpSjFWNkN0dU1seDdUcHAreWRYSURVbzM5TnkwR2JEdnZtcjhnUXpL?=
 =?utf-8?B?VmZWQXUwV25sYVdHS1hZWG1LTWhvdW0rRXpOcEx3allleStUVUMzVi9MRjhs?=
 =?utf-8?B?OEF4a1ZSUnRlRTFrU2RQeUt4YjNNc3RzVHphbDNRZll0aERqeG1RMWM1ZE9T?=
 =?utf-8?B?Y1g3ckNLT3J2dzdBUDRYT05DNU9GdnJTT1BpK2FXQ25QSlNiaDRxUXFLQjJB?=
 =?utf-8?B?TnNDQnFNNWxDZlVjMFlHWWh3UGM2RHVzWm1FazJxeWxrMlFneVE5dUZMRWR0?=
 =?utf-8?B?YUMyQ0xQTzlnaUNKQ1ZOblRFWFJjNjZad0h2NmZ5UmFDL3N5S3poa0hteWo1?=
 =?utf-8?B?N05LUmNlNi8wS1N0NVY1VU1WMnRjVkFjNUJJYkxPeDl5a3gvdzRJemZ4YVN0?=
 =?utf-8?B?anpWQ1h6VFNsamJpZWRWeHZUQUNEUVNSeVd2Q3Rob0JXRm11NjdaODhOeUZh?=
 =?utf-8?B?bW00NlZjMXcrRi9FYTEvWDBiMFlJaDhobkdzSDYzUE1OTGtyb2RPemdKKzI3?=
 =?utf-8?B?T3Voc0dMNm80ek8ydGdheEJWdVUyOXFMNkZuL1BlbjJHUUxRb2hNTDFjVklD?=
 =?utf-8?B?Z2syTGw5cjFVWlZRejRwemlseWNQY1JYNHB4T2E2dnJCQ2pjYmQ3T3hTUjZu?=
 =?utf-8?B?LzdIUUpRZlFIQ0JTMFpYZHU1djFPVWxNbks0bFhjRGVmbndxT1R5aytHMEpW?=
 =?utf-8?B?Vlh5Wm5sUjNzVmJPTTZlbHBpS3FlVGpLZEx0clhMaGgzbGxaTDMvSW1EdHV0?=
 =?utf-8?B?YW5HWWJocXNkZmgrRjdlcXB4cHN3NlR0aDJqV0xaWng5dHFzY3RjTzBWa21E?=
 =?utf-8?B?NVBVNVdSRUc3dm1tL1NLaWlObnE5NFF1WVpDQjQ4U2FkbThEL0orb0tOU01F?=
 =?utf-8?B?TC9ybjV2WlhtemlQNGFsU3h2L1FBS1FaUTU3eU5WeGpGOFBBZ3c0Zk4rMlJD?=
 =?utf-8?B?bzNmVEo5VVg1b3Nqd1Bjc2dvT29OOVp5RTMycmlobHBsNzRlSVQydzRnbWhG?=
 =?utf-8?B?VkRSR0lCUmpGWTJuVmJBTmhBRTNzNGt3cXlzZklMN1hqRnJjcTFVTHVrdVgv?=
 =?utf-8?B?eXpzUUVmN3cwTXZwMmE2VFc3dHkyY0lTVm82V0VZNnF0TlRzRkRJVW1KVWVv?=
 =?utf-8?B?SUJiSmJ4MS9DNTI3My9aTzJDMWxaRVJSNVIxbEZyRzdSbXE3ZS9lVnd4V3JZ?=
 =?utf-8?Q?xEZ7psWL2yBlCFsiMN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af7d161-df2d-45a8-2085-08de7908e5c8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 09:40:25.8507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Og7nMA0FT+1c2ImB7LBH43DmMgFsviS3mrVhwH5VjA6IOM+DP1C02m8qHfudPPCT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4119
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
X-Rspamd-Queue-Id: 8964D1EC017
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Action: no action

On 2/26/26 10:37, Pierre-Eric Pelloux-Prayer wrote:
> Update the way drm_coredump_printer is used based on its documentation
> and Xe's code: the main idea is to generate the final version in one go
> and then use memcpy to return the chunks requested by the caller of
> amdgpu_devcoredump_read.
> 
> The generation is moved to a separate worker thread.
> 
> This cuts the time to copy the dump from 40s to ~0s on my machine.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  5 ++
>  .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 66 +++++++++++++++++--
>  .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h  |  9 +++
>  3 files changed, 74 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 057c8bd2ad89..ae81a428cfb5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1200,6 +1200,11 @@ struct amdgpu_device {
>  
>  	struct amdgpu_reset_domain	*reset_domain;
>  
> +#ifdef CONFIG_DEV_COREDUMP
> +	/* If a coredump state capture is in progress don't start a new one. */
> +	bool coredump_in_progress;
> +#endif

Don't keep that as state around, gather it directly from the work item.

> +
>  	struct mutex			benchmark_mutex;
>  
>  	bool                            scpm_enabled;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> index 42a969512dcc..0808ca98ccd9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> @@ -34,6 +34,8 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
>  }
>  #else
>  
> +#define AMDGPU_CORE_DUMP_SIZE_MAX (256 * 1024 * 1024)
> +
>  const char *hw_ip_names[MAX_HWIP] = {
>  	[GC_HWIP]		= "GC",
>  	[HDP_HWIP]		= "HDP",
> @@ -196,11 +198,9 @@ static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
>  }
>  
>  static ssize_t
> -amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
> -			void *data, size_t datalen)
> +amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_info *coredump)
>  {
>  	struct drm_printer p;
> -	struct amdgpu_coredump_info *coredump = data;
>  	struct drm_print_iterator iter;
>  	struct amdgpu_vm_fault_info *fault_info;
>  	struct amdgpu_ip_block *ip_block;
> @@ -208,7 +208,6 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>  
>  	iter.data = buffer;
>  	iter.offset = 0;
> -	iter.start = offset;
>  	iter.remain = count;
>  
>  	p = drm_coredump_printer(&iter);
> @@ -323,11 +322,60 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>  	return count - iter.remain;
>  }
>  
> +static ssize_t
> +amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
> +			void *data, size_t datalen)
> +{
> +	struct amdgpu_coredump_info *coredump = data;
> +	ssize_t byte_copied;
> +
> +	if (!coredump)
> +		return -ENODEV;
> +
> +	flush_work(&coredump->work);
> +
> +	if (!coredump->formatted)
> +		return -ENODEV;
> +
> +	if (offset >= coredump->formatted_size)
> +		return 0;
> +
> +	byte_copied = count < coredump->formatted_size - offset ? count :
> +		coredump->formatted_size - offset;
> +	memcpy(buffer, coredump->formatted + offset, byte_copied);
> +
> +	return byte_copied;
> +}
> +
>  static void amdgpu_devcoredump_free(void *data)
>  {
> +	struct amdgpu_coredump_info *coredump = data;
> +
> +	cancel_work_sync(&coredump->work);
> +	coredump->adev->coredump_in_progress = false;
> +	kfree(coredump->formatted);
>  	kfree(data);
>  }
>  
> +static void amdgpu_devcoredump_deferred_work(struct work_struct *work)
> +{
> +	struct amdgpu_coredump_info *coredump = container_of(work, typeof(*coredump), work);
> +
> +	dev_coredumpm(coredump->adev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
> +		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
> +
> +	/* Do a one-time preparation of the coredump output because
> +	 * repeatingly calling drm_coredump_printer is very slow.
> +	 */
> +	coredump->formatted_size =
> +		amdgpu_devcoredump_format(NULL, AMDGPU_CORE_DUMP_SIZE_MAX, coredump);
> +	coredump->formatted = kvzalloc(coredump->formatted_size, GFP_KERNEL);
> +	if (!coredump->formatted)
> +		return;
> +	amdgpu_devcoredump_format(coredump->formatted, coredump->formatted_size, coredump);
> +	coredump->adev->coredump_in_progress = false;
> +}
> +
>  void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
>  		     bool vram_lost, struct amdgpu_job *job)
>  {
> @@ -335,10 +383,15 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
>  	struct amdgpu_coredump_info *coredump;
>  	struct drm_sched_job *s_job;
>  
> +	if (adev->coredump_in_progress)
> +		return;
> +
>  	coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
>  	if (!coredump)
>  		return;
>  
> +	adev->coredump_in_progress = true;

That is racy, clearly don't do that.

Regards,
Christian.

> +
>  	coredump->skip_vram_check = skip_vram_check;
>  	coredump->reset_vram_lost = vram_lost;
>  
> @@ -361,8 +414,9 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
>  
>  	ktime_get_ts64(&coredump->reset_time);
>  
> -	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
> -		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
> +	/* Kick off coredump formatting to a worker thread. */
> +	INIT_WORK(&coredump->work, amdgpu_devcoredump_deferred_work);
> +	queue_work(system_unbound_wq, &coredump->work);
>  
>  	drm_info(dev, "AMDGPU device coredump file has been created\n");
>  	drm_info(dev, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> index ef9772c6bcc9..4c37a852b74a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> @@ -35,9 +35,18 @@ struct amdgpu_coredump_info {
>  	struct amdgpu_device            *adev;
>  	struct amdgpu_task_info         reset_task_info;
>  	struct timespec64               reset_time;
> +
> +	struct work_struct work;
> +
>  	bool                            skip_vram_check;
>  	bool                            reset_vram_lost;
>  	struct amdgpu_ring              *ring;
> +	/* Readable form of coredevdump, generate once to speed up
> +	 * reading it (see drm_coredump_printer's documentation).
> +	 */
> +	ssize_t				formatted_size;
> +	char				*formatted;
> +
>  };
>  #endif
>  

