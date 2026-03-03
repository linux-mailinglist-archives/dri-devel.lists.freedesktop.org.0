Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FDkKoZrpmlRPgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 06:03:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7F21E9185
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 06:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011AE10E628;
	Tue,  3 Mar 2026 05:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mN2Zk5Hk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012024.outbound.protection.outlook.com [52.101.53.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5220710E628
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 05:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShPbiPTihr7IfZIUY508Jo+4fv55NSGToNGb9dYh1CdGQv5TiKLXq4KTQDvI4fyFDyZeiSaVRfOwrYAV2wf6gAFHJulIxv36GPmYyU5aG7zcbByqcQ7Czwo1Q4TuzyXUoSwZSVD/ejZ96yLHAZLLIRCfP5bRKRcqbi8zXR4ne2GtrIJGjLTkFA3sSCZgG/YN1GefhXjMNnVkLv8Iu2tkGvjAda4S6STZhFaVDzwhfZAycQM01MW+7IrytLuexYD2VteOMoRePfElwDOZI2q79xYNHaRL9RIOIvwCA877fNmT58+FcyB8n3QzGKJ7pfAPTDKAjGbk6CUKikPuxyDW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84fVI39nJRT7sLAFeI18t2K6d1ZSYalcTjElk+AGlkU=;
 b=PdBCyzsDeYC40y66zwoag1wsVZx7nfrTXZxtMY+jvyM5z/YCqol9prds/PWG4r8F7U2vqSxelw6iiK9IMVrVthvyEkH1RpZdZJHr1PckRCFZmvwh2peDq/IOLY6xzdUi2xaZWidwLNBGIMIXo/wIfobgy0BUJvStQsM5bvjHl/VAy2gDlXmIZcPjSNFXvVxGsfB75xKvWYPaGP4FvFLiwpRe84skXsa5gU1znXBHjq7x5rHAy+AGI48A+DuH8HqblQYEmyXNnp7DCJ/i8LBikF8uoKapgXVBsx99iCJAza4ikJ3rLWL2qxSw7SDL+kj/InL9e3f7BT6WU41jR6Wfmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84fVI39nJRT7sLAFeI18t2K6d1ZSYalcTjElk+AGlkU=;
 b=mN2Zk5HkEU/w4lBAe0C/vct8DpS/KryAc74qMO0avL4GlrypbuDXlJufFDdWvSpG0axSRFMabU1/YV1nX6UfDaSuldLXo2ys58+Y3gu2oweugksSo23z55s0kUzi/GT+BwKM1xIVNIQDN0rf7kH4ZfWtMmVbsAEN1ch7KE0NvKxBmZFlnUoHKzp48Ql9++U0XGv2V06SqthKhQ8ok09LO7oVZ2S0Z5pZapmC+/r4NGuOlhCSNf5zVqt5fFscpwfeA19iMmx0lOjrquHN6UNBMuJWTNRZc8rjsxT5STNZ4m9OxZtBpUQ6xqgL7cKHY3DM9izy4TirQAjlcahIDG0DQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SA1PR12MB7269.namprd12.prod.outlook.com (2603:10b6:806:2be::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Tue, 3 Mar
 2026 05:02:53 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 05:02:52 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/tegra: tegra_drm.h: fix all uapi kernel-doc warnings
Date: Tue, 03 Mar 2026 14:02:49 +0900
Message-ID: <4366904.irdbgypaU6@senjougahara>
In-Reply-To: <20260226215833.989397-1-rdunlap@infradead.org>
References: <20260226215833.989397-1-rdunlap@infradead.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::8) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SA1PR12MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d3e0f05-b43c-41bc-d21b-08de78e21fe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: 44abS3ovJVQs1zNecN7+bvdPPxEl2I6/IkxD+JKrIq+2s6DSEMYq8ezM5LZV5V+YigWDdspTDVgJGD5/pbg973Urbscv6BxU/JwdLiOhXSlh4OxNimkkdo4184qys1N+PpEV9FOTYw86zpDGRaEuedgzhvtT0fxp8Q+mQojly90qajNnrPakWXp7dmonvQppje56HOoJX1nWRLDlrdUELp7F/BriY8JbgiBTxAfOJ6eLTtjawizimMLWEv5rOSK5rGD9e7QS/S1BpIuQBQv5rKhE/wfSrJ4IdwbvoHC46CBGmFwOYElKvBFnE+ZhuOkRCo7wtSHQuYk6B9dyuqt5zGNmP57d+jBuneoEKttEOZOgoDqYfQneCI/OZFg71Oi3GxTPQJhz4RDCxptT5nzRaOJjVg6qVetpeZ+sUXun3MygtZff/rOZFPMsm5YffwxDIRM4UuUF19TXY7mpqTrHFiXWixYC0z2YFdRuCHO0G/48Pw84m6zTr7RdiL7rVLzmS5E8SrFkEjisLHwrC3jvuGFleRsHhEC4d5kV1ybSj81MOSXzfcyBKGxLF9qOoSsM0vceqoTpySiqsFpXzbKjF0rdSphkeoxcC6/twYzzPmro0rhYvDSIWhCwoaLSyf4yEqAdzykdO6SjH3rSWP9c0UWL43EDP74vpdhgIzIMrJKI7B6RBoqV7+XHl/iekjk3JX3MaITU1B3kxZTxx6Ud1Kb0b3uWqrp7SIYkKAas3n0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9161.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnNsYWhCd1k4enF6Mmk3WUtId3hsOGlWbHUxWEppY3VsSXZwdjFWejc1ajFC?=
 =?utf-8?B?eUw4Z2pJdHNuVUpTb3E4ZWEzaHJxcHoxWjdkL3NkMmpVMkVmQUhNVE94QTdU?=
 =?utf-8?B?N2ZKTGp1dkVlek41Q0xSbEpwcHpuMTU4YWU5cjZkY2lXZTFRc2p5ZHhIaGRG?=
 =?utf-8?B?TEtLem9vL3FldzlzcmtwOVBYVUFIc1c3ZURKc0EraDNlcmxnOHhhNFlLbmVx?=
 =?utf-8?B?YUNTc2djb0ExYW9lSFprcURPSWtINVpyMnBSVERhV3lMeDdxcFBZZDh0N1c1?=
 =?utf-8?B?NStVLytkRnMwL3RydG5oTWJJUHVSeCtHaUtxMDBQR2dIc09mN2JjVXNoSlFv?=
 =?utf-8?B?T2NzV0lUcS9UNzRkWmN3VTJLR1BRZ1dDeU02Uitqc0hndzVjcElEV0R0YWx3?=
 =?utf-8?B?TmVMajZZdVNMenBVNWIzWlI0NTNkdWJNeUNoUzh4UjZhOXNVZVlwa2RTRGdm?=
 =?utf-8?B?bm82L05HK1ZXS05QdnFVRm1kL3lHREgwT092dlY4ZnUvWXZDRmZEM1VHWkUv?=
 =?utf-8?B?cmVZNERNZFI3NlMwYkdra0xuQjAvN0VGamx5Mi82YWtYUmN2TFdkVGgzY3dT?=
 =?utf-8?B?QkJGb2g5UGMwcWEyUFFKak9FZWI4R0NLaUM3UmdJS0VBaHVVUlhoVXNaRGM0?=
 =?utf-8?B?NlNyMCtWRDJJd0FBaVVrdEk1WHpZdmdpd1BISEtQeE43Sno2K2t1WkNGUGxM?=
 =?utf-8?B?NnhkQk5mYXNWUkxtUGQzUk9iU2Z4NGg0UUFrV1RlYmtBeDFGTmhwWW5ZV05z?=
 =?utf-8?B?S0pIa0lKS1l5OXJGaURraTNjU3MzWEdtY2gyY2FMb0c4ckI3UjZhTS9xTTdl?=
 =?utf-8?B?U3VqWkxuYnIyaytWa1B6REowdWE0aHBDSFkwSERYaWVNdkkxeG54TEdKZFcr?=
 =?utf-8?B?ZUNIVEtEOVhHMWtNbEM4cmlBMnpwMUNiODAxaVZ6VGVSZzF5cG1FRnM0YTcz?=
 =?utf-8?B?Q3VlQjFMTTJ1L3ZGSHBpanlucU1IREVycC9pdEpybGRybWw1SHVnNGk5NGpm?=
 =?utf-8?B?RDQyemFrN3FZeWNzR0xKYTlKck1ZcEQ2KzdlQ3ViMVU4NGwzTVN5OE1Ra3dj?=
 =?utf-8?B?NkZsR1hucUJudzhDenQrRVVSRkt5NWtDaWhwVm9PREtTL0VFb3JwZHM5UU9J?=
 =?utf-8?B?aktzVysvUFlEMmZtSlQyVGZhTFRIWWVZNDdlOFhWcHZYOTRUUnhiNHFzK2da?=
 =?utf-8?B?Y1pSYVMzWUl3U0QzR0FWUTVxN2c3Z0NqSkdmdEVLRUgyT2ZjL0NGbmRoTFV4?=
 =?utf-8?B?elZ0bjlxU3NPYi94YStEQ3NNcS8ycWZQM3JUTkhkdzNIVFVoSnM5Q1c0cmtU?=
 =?utf-8?B?Z2t0SGtNZlp2WTdYMG5NN3UyeVk4YW5tcUxDREJQWFZxS0VraFFRM21VWTRs?=
 =?utf-8?B?TGhTYTlRSkh4Zk9VSjFDY1FXT3RxZDRBUTRGU09HTlRvZHhQNGRVbjVhQVd6?=
 =?utf-8?B?QmRQdERZL1BKRm0xeG1KS1FDYTRhZVl5TWdraDVJaGJWejhBd3NqbStUbytL?=
 =?utf-8?B?UFRBcTYyWnk1UzNkS3lCNU4vcWs5K2NZdG1FR01CaURrZUY2OHVzRnRXc2J3?=
 =?utf-8?B?UkNRL0gyTno4MUFCaGh4TWwzVUhWc1pxMjFWMHROWG9aRmJCY1RTSWs0NU9z?=
 =?utf-8?B?bnZHWG54L0ZZc1ZkUzNRNTBvQjNRUVhjaVdwQ1Z3SHNOR296ZWUxUEw0TUxN?=
 =?utf-8?B?SWR3QmJkZzdXQ1ZHUmN1T09wZDNCTnNZS0FOQmVxZ1JqYzBuQ2l6aUZlUndI?=
 =?utf-8?B?UzFTckIzaDBIY2FzdjloVGw5YncyY2diKzRlSG92bkROeEk0Sm5sYTlFUmRn?=
 =?utf-8?B?T1VNZDMyRE4renAvRElUNGpXREVzdXhscWRNYmxndzRab05uZGVlRngzbnhS?=
 =?utf-8?B?b2ErenRvSmY5SnIzMS9wdW52T1V0b3AxSEZhTHJUcGJ6Q1g5TDhYbDU0Tk9m?=
 =?utf-8?B?MVBjVS9IOTI2OGUydFQzS0UzdUV4Zm5zZzN6ZXo2eDUxT01ITE5nRmhXT2xx?=
 =?utf-8?B?eU9DN0lmKysxWERpY1lDa0xrazMxWVdVV08rWi8vczNCY0lMTitrWm12bGNU?=
 =?utf-8?B?V3VGR0J2bytwaTYxZFlraFpBdWhvUkVtbExSLzJJTi81MjMwN0pPOTlESkxl?=
 =?utf-8?B?bUNzYkQybTBaL1BVY3pvMTdnTmNrSFdHV1NicFMrZy90d3ExSW1EZm1vUVVX?=
 =?utf-8?B?cnJOOENWclNjMVZ0MWNMYitGR3lveVNhWDN0N09SdXloTVVqQUE5cHRPRS9X?=
 =?utf-8?B?dCtCWlg1SERPN3ByRmFvUkN5UVpXL0ZjdGpIbEIzOG1xSDllVnFOR3QyWHlk?=
 =?utf-8?B?L0tSelVTMTJZMVpQR1VSbW1zQ2txWm15alFrNXQ2Kzc4dGpSSSt1eTdGQnBh?=
 =?utf-8?Q?f2foUfZs7dexvCiZNTJmoASeVqs1vSuRypC8OvmSbDpAY?=
X-MS-Exchange-AntiSpam-MessageData-1: gALXVK7w11K9IQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3e0f05-b43c-41bc-d21b-08de78e21fe7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 05:02:52.8688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMl1K5r19YAkjybWmsYuda8f3w/dC4y02dBIQq4bImIXafJgelrreCCtK2tlAUkybFiaafvu+t3YUsImBhHy+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7269
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
X-Rspamd-Queue-Id: 1C7F21E9185
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,gmail.com,vger.kernel.org,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ffwll.ch:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,infradead.org:email,intel.com:email,suse.de:email]
X-Rspamd-Action: no action

On Friday, February 27, 2026 6:58=E2=80=AFAM Randy Dunlap wrote:
> Add 2 struct member descriptions and demote several comments from
> "/**" kernel-doc comments to plain C "/*" comments to eliminate all
> kernel-doc warnings:
>=20
> Warning: include/uapi/drm/tegra_drm.h:353 struct member 'cmdbuf' not
>  described in 'drm_tegra_reloc'
> Warning: include/uapi/drm/tegra_drm.h:353 struct member 'target' not
>  described in 'drm_tegra_reloc'
>=20
> Warning: include/uapi/drm/tegra_drm.h:780 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Specify that bit 39 of the patched-in address should be set to switch
> Warning: include/uapi/drm/tegra_drm.h:832 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Execute `words` words of Host1x opcodes specified in the
>  `gather_data_ptr`
> Warning: include/uapi/drm/tegra_drm.h:837 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Wait for a syncpoint to reach a value before continuing with further
> Warning: include/uapi/drm/tegra_drm.h:842 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Wait for a syncpoint to reach a value before continuing with further
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
>=20
>  include/uapi/drm/tegra_drm.h |   10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> --- linux-next-20260226.orig/include/uapi/drm/tegra_drm.h
> +++ linux-next-20260226/include/uapi/drm/tegra_drm.h
> @@ -304,6 +304,7 @@ struct drm_tegra_cmdbuf {
>   * struct drm_tegra_reloc - GEM object relocation structure
>   */
>  struct drm_tegra_reloc {
> +	/** @cmdbuf: cmd information */
>  	struct {
>  		/**
>  		 * @cmdbuf.handle:
> @@ -321,6 +322,7 @@ struct drm_tegra_reloc {
>  		 */
>  		__u32 offset;
>  	} cmdbuf;
> +	/** @target: relocate target information */
>  	struct {
>  		/**
>  		 * @target.handle:
> @@ -777,7 +779,7 @@ struct drm_tegra_channel_unmap {
>=20
>  /* Submission */
>=20
> -/**
> +/*

Looks like kerneldoc has syntax for documenting defines, so it would be bet=
ter=20
to change these to use that rather than demoting to standard comments, I=20
think.

For example,

/**
 * define DRM_TEGRA_SUBMIT_RELOC_SECTOR_LAYOUT - \
 *    Select sector layout swizzling for in-memory buffers.
 *
 * Specify that bit 39 of the patched-in address should be set to switch
 * swizzling between Tegra and non-Tegra sector layout on systems that stor=
e
 * surfaces in system memory in non-Tegra sector layout.
*/

/**
 * define DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR - \
 *    Execute Host1x opcodes from user pointer.
 *
 * Execute `words` words of Host1x opcodes specified in the `gather_data_pt=
r`
 * buffer. Each GATHER_UPTR command uses successive words from the buffer.
 */

/**
 * define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT - \
 *    Wait for syncpoint (absolute).
 *
 * Wait for a syncpoint to reach a value before continuing with further
 * commands.
 */

/**
 * define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT_RELATIVE - \
 *    Wait for syncpoint (relative).
 *
 * Wait for a syncpoint to reach a value before continuing with further
 * commands. The threshold is calculated relative to the start of the job.
 */

Otherwise, looks good to me.

Thank you,
Mikko

>   * Specify that bit 39 of the patched-in address should be set to switch
>   * swizzling between Tegra and non-Tegra sector layout on systems that
> store * surfaces in system memory in non-Tegra sector layout.
> @@ -829,17 +831,17 @@ struct drm_tegra_submit_buf {
>  	} reloc;
>  };
>=20
> -/**
> +/*
>   * Execute `words` words of Host1x opcodes specified in the
> `gather_data_ptr` * buffer. Each GATHER_UPTR command uses successive word=
s
> from the buffer. */
>  #define DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR		0
> -/**
> +/*
>   * Wait for a syncpoint to reach a value before continuing with further
>   * commands.
>   */
>  #define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT		1
> -/**
> +/*
>   * Wait for a syncpoint to reach a value before continuing with further
>   * commands. The threshold is calculated relative to the start of the jo=
b.
>   */




