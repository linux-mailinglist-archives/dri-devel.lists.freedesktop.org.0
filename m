Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPtqG4bkp2mrlAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 08:51:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C70E61FBF32
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 08:51:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F63A10E958;
	Wed,  4 Mar 2026 07:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PBYUHWnh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010034.outbound.protection.outlook.com
 [40.93.198.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E2610E958;
 Wed,  4 Mar 2026 07:51:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIZqjh7iB4AUAvDQCCt3idgAYNfAyXWcyTPZMjQKW9I5QPC1YJdSd+2sjDUPivoHrtfE+y6iT3fJ18WnOJigmB2huDtlTYf6wtUUVn8tDDuZGT8Zu+whUJvSHBfNakifj0tsyaHgnKTyLhpaFPQ8fi9/TCCU4AecKikwhCNQxz6I2UY9NrtVNu6fNpapQ1jxfjrhVvI5Iav0kXaaVkdXAixnr8UZXQxr1rhyOKMo1JOTOiV437qCCIN9NlkV7Qv+2dhwfU5GThvZ9inqL6ZAArzejdCJzIrjI0QhoeLXOEpHMExxOha8tqONC3Gl7qoD31DuVdytRaBrz/Gm4kAT9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORhg7CIHLmlsK9iNs0DGFxA527lGv7g2xMt/EfR4S/Y=;
 b=xXhriQZB9zhStoSnFCQttkdJhUSiV/QuhQwWKWEU8ThUJuOh48BZ333FzrukvtBQULhUry0L9I2rXN0l21UaO6JIwPhtO53SGoClr/WZUA027BaVV5RRQK192D8bxWsMmzzeKHjxa9ewRC+/c0UBjCwwC1SCvkSFtjXadY0myXHosCD3tl6etU/JUYumkzB0r2H/5iugjMBUK0KoX6ALXFqFzyG1jHfB1oe+SPcK9uVTyZ7JSPKXgTZW2/OF4uNA/DDP4Km2/67Q7waJmi1XlGMKdp8Mmb6kmV5UlXaXn97vXwNhzSmppF7HHXyOXVmpkgvOB1+424yZF3nXZz2dfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORhg7CIHLmlsK9iNs0DGFxA527lGv7g2xMt/EfR4S/Y=;
 b=PBYUHWnhZUw8ojACNUTsQqxHqi/hwTVUyO4XhyFwKImbcRH+GMWDd38Vk+mUzZ5LBv56ro09Vq3lVzOJ2Y0ylSTFBzX9psCsc7R4VagpYP5sprETXfCH0AtV4ehyzmzhKRVZkKbtqchtpC1/lyjZ932iD+idQF2MxWoZqC7Iyd0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB7998.namprd12.prod.outlook.com (2603:10b6:806:320::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 07:51:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 07:51:28 +0000
Message-ID: <47f265b0-e087-4532-9406-8915abefbd56@amd.com>
Date: Wed, 4 Mar 2026 08:51:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] drm/amdgpu: move devcoredump generation to a worker
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260303161824.7765-1-pierre-eric.pelloux-prayer@amd.com>
 <20260303161824.7765-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260303161824.7765-2-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0863.namprd03.prod.outlook.com
 (2603:10b6:408:13d::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: 9af7ff04-8524-430d-b95d-08de79c2d760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: iTafbMrY/2vx/KRlaGf+nM8IA6vw9bTYcXgWiX1O9cnBJ4tCVbAiMDgi2UkxGqjAStJgFBqJ0NVjlSuQCNRLx7bSIngaJuyXquyHMwfkcf6jqcg+lLrLgeNp/sMZKbS85daYxPkAOECVrRCt3JRJcFMs5t1Ig61opzX41vlXpHRt/0vSxRrVOrxdgvBYFAInJr6uFPoLzb5X+FRm5UzJZ8wzG5yGeCReP3icGjo56G7TRQTpV9E7Hr85JKrUBs+ht85uQNM66LoprkdAin3sLJCKF1W9AnK454h9LITSzXHnhn7DRYXFfpTaFrlVxWMGBWaIuhVhdp+yqr5DcxjrBkqZpzQyrWW+MhS5M7nxsK9nPcXtl03jhJ/YQK9ifYqFNGZ6ztPwFR8K157goYKWvaXeWRCo/Ns774L27Xr3hPcO0iRKew96jTfLCDIooUE6aPHDJiBMwjvhrYHKJa5jB8Xz82U3CPCcS6j1fXgpGaZqG0uC0Gn2n6dXlsR0myGCAk9TCwWlcI+U5xEw+QozfEZnZbqLG1Rmi1A+rMEodjegCGUgyYx6NrxD1f1pAEqAW1lSLPphInGKzgXoI+krTM5PzIYab1KBRA4xVeJl5zDiHp9WjFPsGBl1peKKk5PpNz6y5sSGR2NB3nPI78fohKPOAzK9Gy4/S6QEMRE/9YpjeY4BqiSx3ShQ1n17sO+QS+XeoB9KUPDJWhKcofbIuLq+lEpCddX/G6CzJveG7lQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0dtV3pqUmg3c1ZGL1VkKzVkdSt4VGRSVDk1OUFYaDJ3cGpJNktvaDRhU3Uw?=
 =?utf-8?B?N2lmY1MvL1l6WGxSWGVQQVFINUd5VUhFWGF5anBqMEc0TDc3QXZJWlNmcklG?=
 =?utf-8?B?b1h5QWQxNTQvVGtSRmRWSGl1bWo2cHVqeU05dUJaV2J3SVJqTm1FVVdSVE80?=
 =?utf-8?B?Nk9NcWFlM2FiV0s5b2JIeVBXYTNjRjB1ZlBVbjBUYUZXdTh3TVpWMlkyOWVM?=
 =?utf-8?B?cFpuSDRkc0FUbTgzdHRKYmZJSGFzUlJqYjVGVHR2Q1RtUmdCVEJldEdNNFVp?=
 =?utf-8?B?VVlKUkJhYWxpSGFoSlRvdU56WStJQ3lxaDM5eFNHWHQ4d0E3a1hpNC90YlJx?=
 =?utf-8?B?S2NPb0V5UjZJTzNrTWJiaG9IK2ttMklqVGh3OHJDWTNoYTRDQUM5ZDJoMk1H?=
 =?utf-8?B?TmduZnpZdXlrd2lyNTdZS01vV0JDRGFkeGxUREJIR1NNNVV5SHpVS1kwTGhL?=
 =?utf-8?B?cUcySmk4cmFOQ0NMeXN2V2xiM3huR1lrOGVrN1JGbDhuNldickpIVU5kTWpq?=
 =?utf-8?B?VTVqdVRRNlpuRWk3OE5nOGpGMXdSUkU5NVdhU1pmY2E2SEhoSWZ4Njl0ZENl?=
 =?utf-8?B?cC8vQlRMSEswa0VnMW1qQnpJU0FYTy80UElFSEpaWm1jL3BPbWNIMlNMN1lP?=
 =?utf-8?B?UnAyeHVwOGM0N1R5Ym5ONTJzVlB3Nkpia2pJMTNPc0NxUGViUElrN01tT08r?=
 =?utf-8?B?UGs2RzRTdm43TWMvdXJKRW1VTFU3TjVMRmN0Nld4Z0ZYUS85WjV5NW5zUmp2?=
 =?utf-8?B?THZ5YWpZZjV3b3U0WW40RjZyYTViUm5WZzkwV2hyRU1HVVhubVlYbzYzWGhO?=
 =?utf-8?B?NlZ6SFgrSncxOWpoZ2pwTXdmRWRTNVBGZU1WbjI5MC9MMFNwVkxmdUV3N3F1?=
 =?utf-8?B?cFNSYkJ0Vm1DckwwY0luWlFrc1QyWnFQcDlyMEtLazFkMU1hRVlsSkxJTlpo?=
 =?utf-8?B?bWJqaWVvTDM5eUlmekkrUmppNHBRcEh5Z0JpaG5HV25ZNWsrdXZ3ODlCZmJQ?=
 =?utf-8?B?KzJsbXBRNTFyRCtSaGt3dVRreHNldzBQOUdlMnptWmd0UFNIOTU1MHpVWGF1?=
 =?utf-8?B?Y2RGaExIRnAySDhCQnNHRE9ZUU5mNGZVam5manVmalFmRXhFOTFtWjgzMEcw?=
 =?utf-8?B?Z1ZEMWdCaVhScVA4c2N4SGtnNnova0VWMWxEQXowMldEYnVlTnpMRzQxOXBr?=
 =?utf-8?B?dHlpYWpsMTdmaU9rVGZub3AwZGREQndieWFNVFNJS2FvcTlSNUdZeEtxUmxq?=
 =?utf-8?B?dldlOW95V0NleUN5VEt3bTZWRG1xQmxtUlVIQi9mZkUvSFFrNVlseHR1K2s5?=
 =?utf-8?B?WUhJTkZPMitab0d0azNUMjBaTEtIMGRxblFpU1J6aGxFVndGNjhnQWJPazNU?=
 =?utf-8?B?TWFEUURJRk9Wb3hVOVlFTlJqalRRZms3WDFWQkhxVHIrZ3FtVU84eFJZWTV4?=
 =?utf-8?B?bW4yZk5MZ1hiOG96UUFTUDhyc0ZRTXBqdGhoWnpqZzd4cWorYjZPOUhLYVlO?=
 =?utf-8?B?d2JEOWtvMmhHRzdNSlkrOURMQnJ3eXBtTVp0aU4yRkV0MkYyT1J4VnQ0ZENR?=
 =?utf-8?B?ZlhrTnBnM2lIcXdMM1hBQjgwVGwydjl3U1BjMkpuUURMRHl0UGRJOXJZYTlr?=
 =?utf-8?B?S0JOYS9JL2tZeXJqS1Z2bVpHdTBTTWtSSUhleThWQ3lNWUY2STJndGpjdTV1?=
 =?utf-8?B?SURMeFo2TEs0TXlKejlHY2hLdGhXS1ZxdXVhZWFCQnNiRHRXblBMRk1qR1o2?=
 =?utf-8?B?TUdwbnJ5eW54QUY4M3dzZTUzNzg2dTZDUzEybVQ3ak9tQXhKUFhSV3Z6M2s4?=
 =?utf-8?B?bHJuemdPdVJNWmxUbVVYL05RT24vb2daVVhkSm83cWNQd25JK0pUM2tmNkdh?=
 =?utf-8?B?OXZzb002dnBVR3YrWGI0cklkeXdmcmdscVF2cFVBR3loZ21CS1VyS2Z2VnpO?=
 =?utf-8?B?cFB4d3JqQXFmbGwwRVU3TXdVSDJWSTVwdERLOGxwWTkrTGpHSmppcndVZEF5?=
 =?utf-8?B?elZWUDRhKzlpR29HZXZ6MGJ1eVl5VFR3TkdjQlBhR2N2ek5LRjd2QkNUK0dn?=
 =?utf-8?B?SHNSKy81R3Z4ZGsvN0dJZEN3dUludmc0NnBPdWtMVk5ROXpVcUtPTWMwenJ1?=
 =?utf-8?B?Tm14VjArMS9VRVdmUXZQazFuKy9CRHRwUVY0UHp4bldrbnk1K1B6REkwRm9S?=
 =?utf-8?B?blpoalpxVWFVRFcxWEd4YjRKcUNDUUkvWmsyMWU0ZjEzT29sU2xaaDBTdlNN?=
 =?utf-8?B?cE85Vk14UjBsUEhhYUlmK2ZtTzhoaFdNZWlZdnVBZm9SVkRTazE2WWplN1Iz?=
 =?utf-8?Q?mYfWC/PLzwZ60+CK6Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af7ff04-8524-430d-b95d-08de79c2d760
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 07:51:28.0700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FN3Jb6YpgOVLyiuRaDf+eVUpEzmzP9Xc6IhPUoTH6kB/qHxagn2iOw2WVP2lxgRY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7998
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
X-Rspamd-Queue-Id: C70E61FBF32
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
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,iter.data:url]
X-Rspamd-Action: no action

On 3/3/26 17:18, Pierre-Eric Pelloux-Prayer wrote:
> Update the way drm_coredump_printer is used based on its documentation
> and Xe's code: the main idea is to generate the final version in one go
> and then use memcpy to return the chunks requested by the caller of
> amdgpu_devcoredump_read.
> 
> The generation is moved to a separate worker thread.
> 
> This cuts the time to copy the dump from 40s to ~0s on my machine.
> 
> ---
> v3:
> - removed adev->coredump_in_progress and instead use work as
>   the synchronisation mechanism
> - use kvfree instead of kfree
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  6 ++
>  .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 83 +++++++++++++++++--
>  .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h  |  7 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  2 +
>  4 files changed, 91 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 057c8bd2ad89..e31dac2421b4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -328,6 +328,7 @@ struct kfd_vm_fault_info;
>  struct amdgpu_hive_info;
>  struct amdgpu_reset_context;
>  struct amdgpu_reset_control;
> +struct amdgpu_coredump_info;
>  
>  enum amdgpu_cp_irq {
>  	AMDGPU_CP_IRQ_GFX_ME0_PIPE0_EOP = 0,
> @@ -1200,6 +1201,11 @@ struct amdgpu_device {
>  
>  	struct amdgpu_reset_domain	*reset_domain;
>  
> +#ifdef CONFIG_DEV_COREDUMP
> +	struct amdgpu_coredump_info	*coredump;
> +	struct work_struct		coredump_work;
> +#endif
> +
>  	struct mutex			benchmark_mutex;
>  
>  	bool                            scpm_enabled;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> index 42a969512dcc..0c7fc3800f17 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> @@ -32,8 +32,13 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
>  		     bool vram_lost, struct amdgpu_job *job)
>  {
>  }
> +void amdgpu_coredump_init(struct amdgpu_device *adev)
> +{
> +}
>  #else
>  
> +#define AMDGPU_CORE_DUMP_SIZE_MAX (256 * 1024 * 1024)
> +
>  const char *hw_ip_names[MAX_HWIP] = {
>  	[GC_HWIP]		= "GC",
>  	[HDP_HWIP]		= "HDP",
> @@ -196,11 +201,9 @@ static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
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
> @@ -208,7 +211,6 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>  
>  	iter.data = buffer;
>  	iter.offset = 0;
> -	iter.start = offset;
>  	iter.remain = count;
>  
>  	p = drm_coredump_printer(&iter);
> @@ -323,9 +325,63 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
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
> -	kfree(data);
> +	struct amdgpu_coredump_info *coredump = data;
> +
> +	kvfree(coredump->formatted);
> +	kvfree(data);
> +}
> +
> +static void amdgpu_devcoredump_deferred_work(struct work_struct *work)
> +{
> +	struct amdgpu_device *adev = container_of(work, typeof(*adev), coredump_work);
> +	struct amdgpu_coredump_info *coredump = adev->coredump;
> +
> +	/* Do a one-time preparation of the coredump output because
> +	 * repeatingly calling drm_coredump_printer is very slow.
> +	 */
> +	coredump->formatted_size = amdgpu_devcoredump_format(
> +		NULL, AMDGPU_CORE_DUMP_SIZE_MAX, coredump);
> +	coredump->formatted = kvzalloc(coredump->formatted_size, GFP_KERNEL);
> +	if (!coredump->formatted) {
> +		amdgpu_devcoredump_free(coredump);
> +		goto end;
> +	}
> +
> +	amdgpu_devcoredump_format(coredump->formatted, coredump->formatted_size, coredump);
> +
> +	/* If there's an existing coredump for this device, the free function will be
> +	 * called immediately so coredump might be invalid after the call to dev_coredumpm.
> +	 */
> +	dev_coredumpm(coredump->adev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
> +		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
> +
> +end:
> +	adev->coredump = NULL;
>  }
>  
>  void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
> @@ -335,6 +391,10 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
>  	struct amdgpu_coredump_info *coredump;
>  	struct drm_sched_job *s_job;
>  
> +	/* No need to generate a new coredump if there's one in progress already. */
> +	if (work_pending(&adev->coredump_work))
> +		return;
> +
>  	coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
>  	if (!coredump)
>  		return;
> @@ -361,11 +421,20 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
>  
>  	ktime_get_ts64(&coredump->reset_time);
>  
> -	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
> -		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
> +	/* Update the current coredump pointer (no lock needed, this function can only be called
> +	 * from a single thread)
> +	 */
> +	adev->coredump = coredump;
> +	/* Kick off coredump formatting to a worker thread. */
> +	queue_work(system_unbound_wq, &adev->coredump_work);
>  
>  	drm_info(dev, "AMDGPU device coredump file has been created\n");
>  	drm_info(dev, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
>  		 dev->primary->index);
>  }
> +
> +void amdgpu_coredump_init(struct amdgpu_device *adev)
> +{
> +	INIT_WORK(&adev->coredump_work, amdgpu_devcoredump_deferred_work);
> +}
>  #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> index ef9772c6bcc9..b3582d0b4ca4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> @@ -35,12 +35,19 @@ struct amdgpu_coredump_info {
>  	struct amdgpu_device            *adev;
>  	struct amdgpu_task_info         reset_task_info;
>  	struct timespec64               reset_time;
> +
>  	bool                            skip_vram_check;
>  	bool                            reset_vram_lost;
>  	struct amdgpu_ring              *ring;
> +	/* Readable form of coredevdump, generate once to speed up
> +	 * reading it (see drm_coredump_printer's documentation).
> +	 */
> +	ssize_t				formatted_size;
> +	char				*formatted;
>  };
>  #endif
>  
>  void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
>  		     bool vram_lost, struct amdgpu_job *job);
> +void amdgpu_coredump_init(struct amdgpu_device *adev);
>  #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 48540300b10a..1cb88955f651 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4503,6 +4503,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>  	INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
>  	INIT_WORK(&adev->userq_reset_work, amdgpu_userq_reset_work);
>  
> +	amdgpu_coredump_init(adev);
> +
>  	adev->gfx.gfx_off_req_count = 1;
>  	adev->gfx.gfx_off_residency = 0;
>  	adev->gfx.gfx_off_entrycount = 0;

