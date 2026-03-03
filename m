Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLo6JuDxpmnQagAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:36:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A5F1F1999
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0727589A1F;
	Tue,  3 Mar 2026 14:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3fIhrkJB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011023.outbound.protection.outlook.com [40.107.208.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA92789A1F;
 Tue,  3 Mar 2026 14:36:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEf3Sd14oBxNxv65C+aIpo3T2FFFj0VUIr1pBGtJwWk7YbLrZgzUkezmoDBFk6px+AA3s1k2j4BIQkva/JeoxxeyNvSenSbN+vxvzTkepyEQsF84jVQ/TXBYT3HSAO0R0QG1wzBw40XndyuLm23nGmcdt3Ton0nGmUQIrnt3V9Kjf5jnXNKf5ToYvMyaMrnoLW4CBmu+nnMZWjQ/6lsicLloE7xHxk+FtEZASoqByAwg7ZoB3TskKnM2P2541gkDE7Iqs2Lj5Nd1rAeF/cIObLxqp80Uc7140k731yUhW9drhkuJ/pV+rIevR/qUHMu43dbbHqOBEm/tbVaghFayLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGLUSLsOlLb6U08NhazK+81A1hkzfjXosPS/RGh+/mo=;
 b=UrADs+ZYA8VCfsvbjKXFXR3EdWWBa4uXGWIQdQySd0bx4v7jXZMMVZl7+jzlTVYf5VPljAGBnDHxl6pQ28qRVJRzOAZpxNu2pSkUVTtRB3d4xZn2Ijqu5435KfA7vcLZrwU+y4iv1z2njKYvD0iiDbya3ow3L1w5eUbogRt7KtGCcPlOYrKXBjJvpQEIDbdVcO6JY5Xklc4ZBmjoR3jssS2oCnzBlvyum7o1TO0n6eqU/jxIfPqrNtx/LyXQA0WyWcZRz9NrT3i2KnsGtTdr/RvQaCHgFe4mdVFwNEy8Ir3IVYu4Rl8GaPlwtbg0SqPJ0tWWjvCPyPKxStmHfoF2IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGLUSLsOlLb6U08NhazK+81A1hkzfjXosPS/RGh+/mo=;
 b=3fIhrkJB4lcVrphGmvJtA9cKg6wA71GY5GBImBfHuqNMyZMZXThBnNN1nJvQJGrN82FEqZISKnrpeXuRfcVOMbfBDlpi+v+eLsKUjp5Q60x7TNum1VC6lORSSMAkWaIFVMM+Ox7U+AP1t1c3by/vHkmQzVmQf5+i50bO1/NYOmY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB6463.namprd12.prod.outlook.com (2603:10b6:8:c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 14:36:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 14:36:06 +0000
Message-ID: <d5bf93f2-04e1-4126-a526-b2672865bb94@amd.com>
Date: Tue, 3 Mar 2026 15:36:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/3] drm/amdgpu: Remove redundant missing hw ip handling
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20260107124351.94738-1-tvrtko.ursulin@igalia.com>
 <20260107124351.94738-3-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260107124351.94738-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: c81c1b8f-826f-4ef2-2009-08de7932340d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: +ZDH+QkXDTC8Ei/eTLMQsZctzYqYAsBF+V58lF1DuQZu7zBt3ahB1eabt+ctv4CRLT0SVgYR+uwaFa4LtGL8bVgmtZ3W0fTSZK9BWBGJBqMg9dkNw32Ls0kDNHUT6eO8zxB0rsXjrhWqlvFhyb3qsodW8/70y8R8bLfBZaJ9Nj2pRA8s+yfHzn1OfCNOsEVYimcNtdZUh13QdKd1aS39vEspQzshuk8GMvzw50YhFAYathHrhU8aU2MDjyt9nPbBM1a8avX3fmBIJ0pgwO5/ROtt9ZRcHbBwh0K303ylDttibgDer2s9hgE9H9fSE/W3PAzF/AysgdaRUSaxkLHHwzTwqJjYtR/2DC436rLky2Us2l3JZgK3SZl5/KdYBFCfOGiv8N8KeQgQRA/d9AdMDpEtb+t4VrsUMa7vL/m9cO0xrK5Pgmf2VhJT8+4HJaFjTpSRPSsoOc9qBexN0rdBJShzl4/rFgVTgBaoP2r4X2HezkUwnV0DkpzKL+FD+LpTsYbt7HD7uD4Z1EksqiPtnR4wy5jpqEP6oWleUMz1QJFFdbZ2wY6C86KGphkH2wQAUreWQDDsiboKGgri08dfv/yN7oSc3tBmnsjDpBYFidcEavh7uadz/e0HhaFI5xBPngBBu68ClpfdXmCwBOic3Cz2zUAe4ex2sj7xzI0rYdrRDGxp9Rgbde8D4Y+WSHWLCy0I4LnpNP+mPYUeFx/4/xNvs9vS+wSaLcJ+bgwPySg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3RtMnNPcTJXcGlGemQ3VzBVRytDcEZ1MUk0S1Y4V2dJcFRoNlpVUmo5OTZa?=
 =?utf-8?B?UFdaT0trekZyaWt5NWlxOVJwNUhFc0o2cEY4T01ScmFPbmI2VXR3UVhFSnQ5?=
 =?utf-8?B?K0llbE5YdUVaRWJNSkMvamJMMWlraysxZGNiUTF4MStqQU1DcUNVYW41aWR0?=
 =?utf-8?B?OERlNy9LUUFHKy9RZU1LL3RIS3p0NURUYWhpbnhhRUkySUZ2MEl6TkhDYzJp?=
 =?utf-8?B?N284S2x4TFk2M2htaml2NG90RFVBWkhBaGk0bGVHbFdablhaM2NVc29FaWdZ?=
 =?utf-8?B?Uy9xY3lLQjlaWXJXWkhTVFB2M2xrZmlGY2FRSWVkaVNZeG1ETTloVElPRHBB?=
 =?utf-8?B?YTV0eUhOY0trR1JDTzhhd3d4cGhyMkpTZDBpSVpjUEtXYkNKQjRxR1Y2N1ZT?=
 =?utf-8?B?enRocnprbmVyczAzY1dacmR3cTc0WEh2UkxrRkR4V3lkK2ZReGoyRkhiZmxH?=
 =?utf-8?B?b0JQZGVib3RuMmVBUjFjMkdUTUdWNXRwNVZ1ZGlPZWgvRDUwOVNlZ3FUQklo?=
 =?utf-8?B?dHZaSktSKy90dW1TeHFNdncwRzhXLzNwRWdDUFUrWFpiaXc2QVpWanhnT29F?=
 =?utf-8?B?NFlXNlVQN0huYXE4SmxhcDlXeFFjWGlWN1dRS1kzQ3ltL3piRlpLLzR3dzBk?=
 =?utf-8?B?U1dRQi82a0YyblIvQ2dxTkRhamh3citBRkZVRWRNZTVuQVlWRDlQNUhKdm8v?=
 =?utf-8?B?Zit5OGUzVWdvMzJubiswbEtKZlV1c0hWV2MvdXgwVmdwZXhXaUtvNzBVdXlC?=
 =?utf-8?B?RnRyK1U0Zml0Wjc1OUh1M2tud3VHaHQrb1B2TkFlaFJyWGpyMDRqQ0dKcC9R?=
 =?utf-8?B?bk9EZFB6cGFzVkxyUk5RZ1pLSU5PVzNpM0R2c0c1bnVYeXNqOUxudjZwSVJt?=
 =?utf-8?B?aUx4NmRFRFpkVDFSSlJHekdmaXFPSjRHVzhEUVc3K3VIc0d5SGVkdHhNblhW?=
 =?utf-8?B?YUoxd0pkRnF5MEhjdUczL252emdRZExQa0FoV2g0Y0dJYUc5YUNTV0s2TU5P?=
 =?utf-8?B?ei84RGV3aGg2S3ZHbVh5cC9HV1ZpeHVLM3E0bXNrbWJOWFM2SUJVTEdPNmYy?=
 =?utf-8?B?ZzdKUVYyNkRxQkEybjZCbmRuV1M0RVNka3h3SUJLblNoUDlHcDg5SXMyMWw0?=
 =?utf-8?B?Vkl0K2cwU1lhT1hqTTdYZW5GVllkcUFIZ3hIMmhCc2ZDTkNzS3lBVGozSW55?=
 =?utf-8?B?Q2lXRnUvdHc0TFVFT3pyd0xSdkZmbzEvcms2YXYrUTArVzNYRjduUFZzcTVD?=
 =?utf-8?B?dk9TNHpHK1dhMVRsZjhSMG0vc0RXN1ZwUXZsaUJ2bEFzQXV5b3pOTEsyVXZD?=
 =?utf-8?B?SGdBRWgvNlBPQ1pQNlhEbHhSVXVCS0lLS2lSdDJMOTUxK1QzVTFicWN3ME1O?=
 =?utf-8?B?SGxubGNZdTJtdXk5Vkl0MVRuOE54WU5xVU1CZDZWRzN5ajdBQ1ZNZFVOL0tJ?=
 =?utf-8?B?VnFrM0FGcGRjYzh1V2I1Q1lFcE9JbXE1cXkzTWs5UE5Bc1IybDl6RlBQTjU1?=
 =?utf-8?B?U2NCV29SWks5MVdLUXduWlJQeVdWQURNcitzd2R5SHpJbkNZQzFIOHhaSFRR?=
 =?utf-8?B?djdIR0NEdmpHeTZPMGhUTHROZEhjeGM2T2t0c2JyWU9rcU1TOXFmVEoyTDdx?=
 =?utf-8?B?eDA5c25qSlJUU3FNUFluTmc5anM2Wm13MWxoeElkcFg1RUFYWitJWmN6cjhL?=
 =?utf-8?B?S3V2SkpyL1MxUjd1R0h0eUdNcjg4b0tROUxSWXZlYjNHRGhzanBGbTQybkNa?=
 =?utf-8?B?TTJXUmtkdEdNZmxnd3BDa240bStmdUM3M003clVBMnFDY2JlQ3lXMTB6d0lF?=
 =?utf-8?B?NlFoMEZVWXhkZTdTeHg5eEQ0SEgyVXhnbXJGVUlrTjRVdEc4aE5qU2M5ODZ5?=
 =?utf-8?B?T0pPU04zcWgveWoxcVdzMUJETHRoOWJ6cU5pUEh6aEE1YjRSK1JiT094SEtp?=
 =?utf-8?B?K3djR1g4K3pKVGtHWklEeFJQYjZvb3QxbWRHbTBDRlRrUXlRNGhQNmk2eFlD?=
 =?utf-8?B?STBqTWpRVlpyOGJZVzcyeDZzNnVBekVISUpLWldjM0NicmtJVWc2bmljL2FY?=
 =?utf-8?B?cXVKQkhrR284bkZNS2c1eUc5dVVYajRxU2wyRmxCbWtJdnlObEtDRnN1N3Yv?=
 =?utf-8?B?L3hLTmNyV3lnYTJoYnk0ektnOFpiY3hqcjNJRmhsN1RKNHl3aHB6dityQURs?=
 =?utf-8?B?OExKRC8rbGhIcGRHOEFZV3VmWWwvc0lCVyttWjhTYlhDZ3FhV0wyMDF1eEJH?=
 =?utf-8?B?eEtqSHpLUm5ydXlERmxvalJ4RlhVVkRxOVd6R1ZwcjQwcmU5ZE1MVHQxaDMz?=
 =?utf-8?Q?A0KoHy921tTOf/36rw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c81c1b8f-826f-4ef2-2009-08de7932340d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 14:36:06.4690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6BfG8EBtXL8YKqQPtDR+F2k6/s+aiCWmR0UlAVxR0njEM0e3n70DHklSRKzIRaX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6463
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
X-Rspamd-Queue-Id: 37A5F1F1999
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Action: no action

On 1/7/26 13:43, Tvrtko Ursulin wrote:
> Now that it is guaranteed there can be no entity if there is no hw ip
> block we can remove the open coded protection during CS parsing.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> References: 55414ad5c983 ("drm/amdgpu: error out on entity with no run queue")
> Cc: Christian König <christian.koenig@amd.com>

I've gone ahead, reviewed this one here as well and pushed the first two patches into our internal amd-staging-drm-next branch.

It should appear public in the next few days if our CI system is happy with it.

Thanks,
Christian.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index ecdfe6cb36cc..82bb70167f5a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -84,13 +84,6 @@ static int amdgpu_cs_job_idx(struct amdgpu_cs_parser *p,
>  	if (r)
>  		return r;
>  
> -	/*
> -	 * Abort if there is no run queue associated with this entity.
> -	 * Possibly because of disabled HW IP.
> -	 */
> -	if (entity->rq == NULL)
> -		return -EINVAL;
> -
>  	/* Check if we can add this IB to some existing job */
>  	for (i = 0; i < p->gang_size; ++i)
>  		if (p->entities[i] == entity)

