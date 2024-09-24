Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DD3984718
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 15:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EB910E8BB;
	Tue, 24 Sep 2024 13:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gSXnDIGv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153B210E701;
 Tue, 24 Sep 2024 13:55:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rie0RwGHw0lGMRkdAOGNHxt8dbJtilqbevRYD/cFZnqzTqgLB7LLTSXhmJIVK720WS1LAd1LA4MukjzD9vUHZ0vmXzmrGkfwGj1bEHALchvCP+EoDp6v+RM6N6Pq9LXz+sWr2WHhbnljxjXcYcB6LbXrBFAcARNb0OxmLAdIzCyGQMT+EWy0lZaMH3YJHbq72AsVVAKRCkkbSObDILTFmyBs99lsEB/0GztB4XPrX0bTC3VycASQuaL8trGr2ZbmrIx3bA7X0afMofTkP9J59hX/W4o8E0KUmPto3ZLHTTOYSbk8yg1NDZRCWVn5MFT33bMMN1YKPMg5ogy7hsElfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gLXTgJPq3Ej0U5vzPNBDnkkUWK49Y4Z3croy8pzdmc=;
 b=R35sVEwHw+zqLBgqWPTJpSbPfsT7XPpqLqACskyKX1BoiMB9pggvc6C+mKqByjHSjTgAGOGkFmpFveDDhl9pSmMP6r1vzeW+XNvNEPizI0N6Xtaqovemwj4QdRXrDiSIc0FaLshlGoAaDkqMereyYjnPmILQB/UKdlD7uZBVuKEk7hA+TsCpChh3XIgxKIWNFDQ5pavURekUD7sDgmcWaPni5SUiMoMBTCym+CibLwBUkKYG6En2r0ExhwwZRXD/yHj11e1lLZNH9Szcd6piClLcURlREWEjOW/UM4HmfT1bszprv6ipU7L8CBh9tjZN6CWKnWV682g538z/OlFc+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gLXTgJPq3Ej0U5vzPNBDnkkUWK49Y4Z3croy8pzdmc=;
 b=gSXnDIGvvQM2GzU4gEiH6SZDLjlSTPlc1zqNryV6KZLxIPFxilV/wnfOn4gCT/fcfi9cAqvY9A14eF4EM1g5xl0+6aCYML/RYwfD7Iaj0C+xGpHnLBGlBsag+61bTv1LNMH7hnaEDLY+zRzKT4PmivGm9tYCfbIAPX0DPa4jRUk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Tue, 24 Sep
 2024 13:55:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7982.012; Tue, 24 Sep 2024
 13:55:18 +0000
Message-ID: <4dcce6db-cdb1-4378-8fea-8540ec7539ef@amd.com>
Date: Tue, 24 Sep 2024 15:55:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/sched: Always wake up correct scheduler in
 drm_sched_entity_push_job
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Philipp Stanner <pstanner@redhat.com>, stable@vger.kernel.org
References: <20240924101914.2713-1-tursulin@igalia.com>
 <20240924101914.2713-3-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240924101914.2713-3-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: ec48869d-ba33-4323-16aa-08dcdca08614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGl0dkliY3hXSDFPcC91VU00b0hML1VESjI0S3JiL2RCdUZiZXc0VXJUWlpj?=
 =?utf-8?B?SVZmaFljR0o5ZGpTY2JuRGZGWi9Bcm55WEEvUnVONFd1ZCtpak5xM05SdWM5?=
 =?utf-8?B?ajBoTjVJVHNwM1MvZDREZmVYT2RWbHNLaG9jQWlmSm12QllBOVphdnJ0YnAy?=
 =?utf-8?B?MVU4Ly9hTWZhTXAydUNHR00rTmdJY0ZXNzBoZWtEbnQzQjJLS2VHWW96T2NV?=
 =?utf-8?B?U1lUcEtEdkRibWZkTDltNUtPR2d6UGlUTDlHVU9jKzU0RWdWbFQ4RVZRTkpD?=
 =?utf-8?B?aGZRSmNTbkJXVVpvM3JTR2FaVllzcXBxNk5KZHVhMjVFT3RRdUh3M1U5Snkr?=
 =?utf-8?B?Uk1JUlNPdzVFK1cxandONFE5TldONzBxM1cvbWpLWllqTkErVTBZb2t1eG15?=
 =?utf-8?B?d1B4UXFsM3hObTVDWEhnMlVtR1ZXdVRuQk5tVE1uTzZubEthYk4wREl0WWVR?=
 =?utf-8?B?MzBOZzBlZUN1bURhR1JlOVV2azYzRXNjSTJBU1REMUg4UUppNWpTM05WUFBu?=
 =?utf-8?B?bktPMHo5UUw0dkN6T2JJQi9vNHpHQUd2aktOTVJrODJRcW4vZWpXUUpGMWNm?=
 =?utf-8?B?ZjNoMm5LaHFhc0hUZ2hLYytSdXV5KzZGMFY0YWRqNCtJbDBQczNnTytNeXg4?=
 =?utf-8?B?Z3ZLSi9BVFZZZHp3SmRheTczSU9ySTdqeDNqNHRmem9tNFpIZFdHc2t4czN6?=
 =?utf-8?B?MFdnSEJUUnpTYlNCSGZjdm1PZzR5L0duZVJVbGZkQXd0T0RlaDhlNmZ2OHoz?=
 =?utf-8?B?aEhZdW0wV29mY3pKL0YrRFA4QXNGa0QwZVMyemgyT3ZPZmo3QkZuZEVvN3pv?=
 =?utf-8?B?Yk1NaGlqaTQyVURCTFNtSXR3clhQaGx6M1l0Q2M0TUlVcGxLYmpVRVRwL3Vp?=
 =?utf-8?B?b2gxUFRZM0MwNEZHUk1mcE0zTnpqd0pFNWpPbmcybEo1eGljL21MNEdXM0lI?=
 =?utf-8?B?R3ViNEo0WTJwRTdJZXowbzRYNTJiRm14VTNiS1ZMRm4xb2g0VDUyb1E0Vkg1?=
 =?utf-8?B?UFA0cmM0Z3NhazBkMlkwY29VYXdwdTgvWGFmYndKOVdrVW5pZGZHVk45QnpV?=
 =?utf-8?B?RmRCMi9ObjBlaTZtT1ZoT1ZBb0x2UFkyRUZPekxrbmxLd3FxWXk4UTRFNk1p?=
 =?utf-8?B?R0xOd2pUbDlrVDhUaDlBWWRSR3Z6TW9DZVVwOWc2eGJwREk4b3VZMDFVTVdt?=
 =?utf-8?B?MlpsSmNvcmltelE4MXJ3MVcxbyswc0svdzlHVGJ0M05wKzltWFhYc3I5WkVo?=
 =?utf-8?B?Wno3cE8zZ1ZpbkxuYWo1dnJRR2g2MDlxeFhnWUlzUDhtbWlKc05ReTNmejBU?=
 =?utf-8?B?QmJnSmRuU2VIUUVZdll1L2NYNzRTaWNtZmYyS3dnVTBlNlhvTEVpU0Rlc2NE?=
 =?utf-8?B?eENrbmU5YUVoMno3d3haYUpJRjNZbGJYQVZ2bGk5MW9MbzY2VXNuaWJHQlJD?=
 =?utf-8?B?MDU3VXhIRVBweXBzQkhweFhkcW0zdWVZU2tRdE5wZWpSbis0Sk5HaWpxbWZU?=
 =?utf-8?B?cHJXSlluenZsNWtwdS9KMi96Rzc0MDZHNDZtVi9pTkRKYVlZZTdOYldqT0NE?=
 =?utf-8?B?Um1aNmxIaFJFSlZZS0Jjd245cHgvaEFzN2NvSWlnSnlGOEwrank4dFZjalZJ?=
 =?utf-8?B?alIvYnFxMTg5TmFGNnpZTUlaYzhJQTgwNjVydXRZNGFvZjkzMU9uMExIVkZK?=
 =?utf-8?B?UVliVTRkSlUzeHpqVlRDc3dNUzJIcmo4aXd3QjVEeUMyaUJ0N1hRVmxaM3Nm?=
 =?utf-8?B?SjUyWDdmVW85Y2VDUGkzNDlCNXlrZUw0K0kyeGJtUUxNWTA3ZXZhSElGTFJV?=
 =?utf-8?B?N1dZU2ZZMTZNeVpFd0p3UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c25zaXNLUEdSL1Z0SHAwd0drUXhoRmp2SW5qN1J1QmFtbmp3OVd5WXVtSWY1?=
 =?utf-8?B?Mk50Wk1WREQ1VDF5cFhIcUpiRDcvUXJvWGJPa2xNeDNjeUdJcktXaWNUYWlq?=
 =?utf-8?B?Z2swUFV0WlRpbXIrUDZCUEF0VGNlTlVzWXRGNHdESVhueE9hY1hROFh1WVRH?=
 =?utf-8?B?N2JwMFREMkJ2dGZBYkhhb2xDSWRtR0JOeXJCdlJOSklNVzY4ek9uYmtTdXlt?=
 =?utf-8?B?ZzBvTTFubmFaU3R0YTM0Y21rNENqYWo1OGpjKzQ2ajczdEt4TjgyNmpraktG?=
 =?utf-8?B?c25sRHJVQUY4N0IzdUZlanhZYytveG9uSHlSUktIbVNXWTNrWm83RTNoM1NT?=
 =?utf-8?B?bDJBdndtSm5VSGU3Zy85RlpLc3FsY2tCeXBoVXgzNjV4SjZxam9yTzFmTkVW?=
 =?utf-8?B?V0xESWNZMlF1MHA3Zmh4YjNOV3VWNlZrS0t2RmNNUW80QzlDQmU3dzR2ZjJw?=
 =?utf-8?B?d3R6K0xFRENGSnRuM3VCd21CeDl1WDJCZWtWdXFDNFV2ZFZOTnBzd2tnai8r?=
 =?utf-8?B?NVJzUG9TVndRSllML0RhUVhtck5XSlFoamtpa0JENUlIV3VPekdURW9vMVB6?=
 =?utf-8?B?alg2UkFIMnZpTjNaS0RXeGo2bnBGekJ5WVZ3R3BUMFNBenJtQjhKdHZNLzN3?=
 =?utf-8?B?UTZYbzIzeWx4Ymw4TXU1MEhwQ0NmcjZvRDluRVRweDl4U2ltVGZYcnJwekQ4?=
 =?utf-8?B?UjhTTm13aGVVdUZQdG1NamFkbkZzcXFLdXR1Zi9BRDd5cmpVRXFBNnB4QVND?=
 =?utf-8?B?dTJxalpLaENMQjBXYnhEbk9tRmNPc3VrVTE3dTREdFhmSmxMWElTR1BFenda?=
 =?utf-8?B?U1preUVSb1Q2eVVKYnNkU2hUOU4wWWhCSVFjc3NXNWk4UHJlb0krREkvZS9U?=
 =?utf-8?B?Ump6NFk0VmJ1RHhBeGJpTGRhNjJQdDB6ZHBWekJ5dkhwVFJBOHVsY3pTQ1RJ?=
 =?utf-8?B?bHlnTHRnSUlvSlJoN0tkZTFpTmxMREJqN0xWcnZGMnN6UmthMnAyNzFtdlYz?=
 =?utf-8?B?S0hweE04VnM5R1RGdnNKakh0R1lwRklLb0dVUktaU0N5VUVjdDZkN1hVS0hk?=
 =?utf-8?B?dVZaM2FiL3ZiL2Frb0V1R3puazkzenQ3OXQyVG1RdllOY0hlS29TQm9RbXhw?=
 =?utf-8?B?VUdiWmhkV1FaQlEvNlZQT3djRXliNmI5ZTJIZ2lrc291TnE5NEhGdktHempv?=
 =?utf-8?B?cUc1VHZPeklvWndzK3NtdlpXS1hRc21YOEVmbzZtejQxbEJTQTQ4ekJnWWxK?=
 =?utf-8?B?bGtSdHd1OVdyVUtsYmhod05zTURTOVluZm8xSFkyZUthbW1RVzhJVlBBaHJK?=
 =?utf-8?B?TEJpRi9lL2ozdXkwME9NSUlUSWxIQmdyc1RZNDdYT2prQktaKzFWVlphQXZG?=
 =?utf-8?B?aXcwVE40alRYcmlhNG5OR09jZXdTOW8xaTZEdGM0WWoxaDRGbEdJUjhoR0dT?=
 =?utf-8?B?WWxGRHlBbkMyUndybzZoZVg2amtsZ1dhc21keDJnL2VORkZ2QnU2NlM5OEtz?=
 =?utf-8?B?dHNKVit0eWE0aVFDdVhyRWg2c1MrUXB0ZUZ0RXV1d1JFTmF0NDM1cG9CRlpJ?=
 =?utf-8?B?SWlvRFdaNzB2ck5Nd0YrR3pLQnVIUHZrMFAwWlBUSmcwZnk3L0d0UlB1K05j?=
 =?utf-8?B?ZC9nOU1MTkRTMGp1elRWdWxhTVBoRVltV25EWG1XOW9Ud2VlY1RjTWpEa3Vq?=
 =?utf-8?B?MTFlYUtjSUpsNTA2cGZyZkhueU5OR0krQmk3RVNKVDlXRzVvZkJCMEVWZEJR?=
 =?utf-8?B?YWhFMUQyVWVUckNZLzdObVFoMXhZN0NGckVDMzdsRVU1TEg0MjlmRmdmajNr?=
 =?utf-8?B?VGZpbHp3VTEvamdMU1ovSXVKaFBEQjBNV1Jpd0hZdWszZkZkdmEwR1JwdW9X?=
 =?utf-8?B?c3UrMTdLaWZhYUNCMVVUbjROeDVsc0JtNWh1VFJSQlBrVkpod2hTK2I4YVBF?=
 =?utf-8?B?cUtCWlBzd3RMOExOY1ZqUmZ5TXoxbXNkOFU1SWpidUpBdnBSWW5menR0bHEx?=
 =?utf-8?B?TnhEc0JPNTJRb3h1UnZqNnZZYXI0cy9hclo3YkI5TDhJL0FkQVNsN3BrRmtB?=
 =?utf-8?B?eGUrTmdtYmpaanJEUzBSTjczaHBpRGFubnZEclBEOUw1d1JEVDhISnpobWhi?=
 =?utf-8?Q?FfPw6GsRsJJcSWAKJ/vviZCbd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec48869d-ba33-4323-16aa-08dcdca08614
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 13:55:18.4688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: diL5oKAA3CYnV1Q5j7wuXkXqfL1rii5cS4blT/BSBt4JCABUEGNmwnkoGx72Q9ez
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603
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

I've pushed the first to drm-misc-next, but that one here fails to apply 
cleanly.

Christian.

Am 24.09.24 um 12:19 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Since drm_sched_entity_modify_sched() can modify the entities run queue,
> lets make sure to only dereference the pointer once so both adding and
> waking up are guaranteed to be consistent.
>
> Alternative of moving the spin_unlock to after the wake up would for now
> be more problematic since the same lock is taken inside
> drm_sched_rq_update_fifo().
>
> v2:
>   * Improve commit message. (Philipp)
>   * Cache the scheduler pointer directly. (Christian)
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: b37aced31eb0 ("drm/scheduler: implement a function to modify sched list")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.7+
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 0e002c17fcb6..a75eede8bf8d 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -599,6 +599,9 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   
>   	/* first job wakes up scheduler */
>   	if (first) {
> +		struct drm_gpu_scheduler *sched;
> +		struct drm_sched_rq *rq;
> +
>   		/* Add the entity to the run queue */
>   		spin_lock(&entity->rq_lock);
>   		if (entity->stopped) {
> @@ -608,13 +611,16 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   			return;
>   		}
>   
> -		drm_sched_rq_add_entity(entity->rq, entity);
> +		rq = entity->rq;
> +		sched = rq->sched;
> +
> +		drm_sched_rq_add_entity(rq, entity);
>   		spin_unlock(&entity->rq_lock);
>   
>   		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>   			drm_sched_rq_update_fifo(entity, submit_ts);
>   
> -		drm_sched_wakeup(entity->rq->sched);
> +		drm_sched_wakeup(sched);
>   	}
>   }
>   EXPORT_SYMBOL(drm_sched_entity_push_job);

