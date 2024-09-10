Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0368972B0E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 09:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7169910E72F;
	Tue, 10 Sep 2024 07:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mMJjKGhl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229DA10E72E;
 Tue, 10 Sep 2024 07:43:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQUmRkQIKT9nkN47oDmY/nZcnUkg27msBLlr8RElIDAEmBypIOcOWVfCtxvGgi9Hyt6eoJTNMfLu9ZyXaZC4VIpRPoP0nJCDZU0r/abqLSW4e9NwFDPmX+Ky32egIN8xvxVEdeMeIRtq8nbT0yP8LyCMV/WboZ4hrAGCYqe6Z7JOMcWPFH4c61tpQs2FS7w2vF3bB5BbaPMjZDYkLeIsh+9CpkZAzqt4M85U3BEoGWBBgZEALGSQQCHHC0+2aC28xYN/9J+we0u+zsFxopsEHzJGM3thKgOwMF/G5pycGVcFSHlCTVofjVthOSizUWleUnLO0PCZSNF05+cqxGg/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkTjva8BIblzCi45OmngwGM0RG8NfbZFaxnwxNztLVQ=;
 b=LevO34tv8VmptB93tCulqJDrD+/XXtb3QnG7EjBSCpqnDp01cYeDNHB2pwqTJ3236oClUz8jN7U7pbfDOjSEABLprIEJJcDB/BA7/ZMjiNrC+xoJ4zfHCf59Xzx6zHfeaKbrXoq2lVBOLJIoKL3pG66OIYHjfcUZ2AI/GTJ97rW2yirU3wsVdoGSnAWRLvINUiLooyKiwOAMtbxCjj0DpdZYIj68oVp5EJl/tJlCCOU9c9Nj6Qbn4U7TTGo42FcfjJkj8daHDkj+WhrcpIV2CiihqJqrYNQNna53tjCTshkv02CsM45a8/kfbPRrJ4QEoU4YUOEMTy8enQ1yNSXYxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkTjva8BIblzCi45OmngwGM0RG8NfbZFaxnwxNztLVQ=;
 b=mMJjKGhl94Qm98M8ctAXY/H1eTAdGhrw5dR8/NkWpahK0iY8ABvV7W8lJ9ssyuQniRiZ9fGWPxLNNupcavUqP2hvSxD0TVxDhE3eBW1+uiX7piyHWBSUgp5hQq257VuRkIm+JnPWJn2IIm636bYtQZ/jBMZIExr2nwGXAb/tS1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7344.namprd12.prod.outlook.com (2603:10b6:806:2b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Tue, 10 Sep
 2024 07:43:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 07:43:00 +0000
Message-ID: <7615a599-e85c-49d8-bf9a-1b36f0ed1f00@amd.com>
Date: Tue, 10 Sep 2024 09:42:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/sched: Always wake up correct scheduler in
 drm_sched_entity_push_job
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Philipp Stanner <pstanner@redhat.com>, stable@vger.kernel.org
References: <20240909171937.51550-1-tursulin@igalia.com>
 <20240909171937.51550-3-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240909171937.51550-3-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: fc5185db-911f-431f-1ad4-08dcd16c31ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bllmSEtDMDg4UXZLV2tBT2hueklZTHdGS21rRVhhKzh2a1VOWjZQcmJoQTJ4?=
 =?utf-8?B?SnNadjZXczhIUDJhcUVuR2pYcC9LdGlmMHNwbnhjTFVEZnozN1RYNzVFSng4?=
 =?utf-8?B?WkR6ZlhzOFBtYzNOR0hvSkVuTzNkSVNBWU5LcUt1VkYvcXN2S0YrMVJsUnhX?=
 =?utf-8?B?Q3JxSU8zNFowdERhcndrd3ZDRXJURlRGS0tDaktWSEptN1BYYW0vbCtwT3g4?=
 =?utf-8?B?VnMzZzMxZ0xMaXpWdHB3ZTdOcXYrN20zQW1HcnRxYTNEb1F4TlArbkZBRElK?=
 =?utf-8?B?RFQwNXZ1RXJNdHR6eTZ1T1JXd1JVamxJQ0tUdE5mZ2JsWWJCTUZ4a1o4TTk1?=
 =?utf-8?B?T1gxTUVXdXg3a1hLRk5uaEFBR1lPUXVJTkZJSm93MGMxQ29pYk4reGdwQzl4?=
 =?utf-8?B?ZnpJNkNETkJyaVd6RXAxUDFIZzAvUHVNZUhwMTc0b2NKMndHRGRYL084ekpL?=
 =?utf-8?B?UDdVdTVWWElQUlBtRzc5MHlxQ1MrR2p3L201ZHppTjF4THdLQitjbXMreUJq?=
 =?utf-8?B?ODRXWlFFMFo0Z1ZRd2dUdzVGMGNIVzFuUTRZcFA3QXZCV1daWnNQL0tSUG94?=
 =?utf-8?B?MGtoN1hoMndJZm16amljVFBzRzl0ZG5pMW5nd3NtYU5iMzJCRWJuWGNLR3VC?=
 =?utf-8?B?ZXJHYlZXb3htTzFKMkhYQ0UzdTRxaWErNmNvZHRiNEE0Q3ZEVjdpT1Y2ODdI?=
 =?utf-8?B?U256S3JMakpwcWtLMFh6TUpZUmVhYVdQYmlrRUJlR01hOGJmRFp2dFFERVpu?=
 =?utf-8?B?UVhNbmZUaEl5QlhSa25WaTRuamFmS0xWVkxjSzB1ckpieXAvdFR6ckdZbFhz?=
 =?utf-8?B?Z000bjN1dkFidXREaU1zMTBleHo2b0Y3K1VDNzRGL1lNOCtSanlyUUF0a2xO?=
 =?utf-8?B?OUt5TzBmQVI1Q0xZVkQ2MHVwL0c4aTF5bGNsSFpNZm9ZdGtEdldobG1jSUls?=
 =?utf-8?B?NDhkUEw2bDNoR0JPdVlUWEttSlRZS2EvZzIwTUVFY1Z4RitRc0g5ekZQK1BQ?=
 =?utf-8?B?WEFhSVJaKzRhRzFlL29PQ3hZdUdnNXV0UFR3R3dQcXZsclRtOGpDYnBzNUhv?=
 =?utf-8?B?c1dZK3RDdjk0eEJxY1JFMzZRTUlEdFlGcitZS2hyS3VNMzR3dVVTM3FxTTVq?=
 =?utf-8?B?RjdvdmQ1UnVSNnJuTmNSSGI0dXRPazg2RjZxMFo1MW95Z0loQm5haDlpYUp6?=
 =?utf-8?B?MU1kRStsaTUyaVhERlhPeFZPZzhMamNlTEkzNFZaVVVjRGpIUEhubW9OSU0w?=
 =?utf-8?B?UnRHc2I5cHN3VkdKUmV3dFoxUTVHa0hmUExDU0ljWUxFTW50azNodVpyY0Yx?=
 =?utf-8?B?RHBxQmJEcDZUOTZNYlRRVWxna2lzWjBUT09Nb2UwRGp4ZlVZTnpnc1pjVjZk?=
 =?utf-8?B?T3cyYXpjVENBckEvTjRMenY1ejJtQ3J1U2w5WVpYNElzZG9IUjBWeEhqUGp6?=
 =?utf-8?B?cExWVVJtZDhGWDByWkI2V3ZDYmZFZFk1YXRtS0NyQXp2MWxhVDEwUUZPdTRx?=
 =?utf-8?B?eCtQK0RoalhnT29DRWJsRnB0YnJ3bDBHd3RrK1MyMXNTQjJoRHlHK0J1cE0w?=
 =?utf-8?B?NlBOR3dKQlRGYVdYTlpxN3M4TERDajZQSDB1elBvT1psK1JvR1BEcndVK0I4?=
 =?utf-8?B?MnRZTEN4SnRuMDZ2OTQ4ZmxtM2F2ci8xOUlBaFFrMGF0SmpuRDVsNzloQWJo?=
 =?utf-8?B?NGd0MFdxSEN6ZVFKeWFvemNvYXNKUldYU1RzWGhqNDhBY0R1dFM0UkdTQkhq?=
 =?utf-8?B?UkI5a1ZzMWNXM1BRZmlDSE45dC90ekhyRC9vMU1Ybzh2bVRWYURkKy9jWVpQ?=
 =?utf-8?B?ZnNZMmJ1aFBTdnpjWk9FUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WU9WVFd2MUQxanNTUFA2TU9wSnFMYzdxR3ZLdHR3Uk83NjQ1YmZ1NFVLdy8v?=
 =?utf-8?B?RXZEaU5nZXdSQmVua1VkTDJHSDE0bHhWaENWVWlnNlhFUklBTjVrNjhhZ0NF?=
 =?utf-8?B?MzRvRGd6YU84c1NkOUJFNkc4cnZuc1NWdytXNkJjZGhEWTZkWGpCeklQQWdx?=
 =?utf-8?B?SzZVaDRaZmFPWkRlT3gvZVViREQzSnBPUGRwdW5zMDhjSGRzNjZTSU9BYzVG?=
 =?utf-8?B?OGZhZzZBUkgwRG9kVXduVThBT0pBVEVJUDZiOG9JSUFQTHVTSzUzc0JDR0Vq?=
 =?utf-8?B?dElHbkNEd1IraW1BYkRRMGlWYVVoSVU0WTFDSlN6V2VDditGemFkYkhTd0VO?=
 =?utf-8?B?UllPK1JSTmcrUzZLOERKaDJIMEUrSVQ4cEpnbUN2dmFKRjcxMDlsRXc1NGZi?=
 =?utf-8?B?Szdlc3duTXpOTzBScmZwb0VlTlplQmtVODRGTTFPRFNNYUxnU0cwcVRhQmNS?=
 =?utf-8?B?UDFRTGl6bnE4cXM4YnR4TFJPVy9UV01KclJCRmNidHF3cmtxemZTa0NCbUg0?=
 =?utf-8?B?N3hRK0hjYTZsOTdRMzFIUkVlNVVXR1k3c0dmVkRDanZaQVhtcytCYmNmaktM?=
 =?utf-8?B?aHJNMG1ySVp4YXNvL3hUU2xtQTNjcktabktqdDFKaEJ5K0VoZ0FmbzE4dzFv?=
 =?utf-8?B?d1FLUGhobUxad0xYS214QkpOdWJITktrVlp0UmRueVFSZ1BMVXdQV01CeVFw?=
 =?utf-8?B?NGxwSmNaV2NEREc2Uzg4Wi81c3pnSk1abkEycEJZSUNoa051ckdVNmQ2RXBk?=
 =?utf-8?B?YlRZV1gzUElsU3JQeU5HS1ZlUG81WkNrUEsrdWNGMlhRR3BNNzZUMnlRdU13?=
 =?utf-8?B?VXFjdEJEaHQxMFRubTBvN3dpKzJlTmJwSDFtQWsxY0ppSm1BbmJvcVpaZVlF?=
 =?utf-8?B?RWRmK2tzMVdxb0FVN3poWjRoSkhDYnREODgvTkhNd05hd2dtREFZTDdpd0hz?=
 =?utf-8?B?ckN3eDNudWhHVVpTbVNmT21mcmlkZWlESXdLMy91VTZ5M002Q1M0S2dHSGhq?=
 =?utf-8?B?TnJzUVI3OEZwQjFTNHIrK2orNHRWTTUwMVVtWXRhd2tGOUswQTF1R1BzQ2Ew?=
 =?utf-8?B?SGlvRy9BSDI4UWY5NW14bksrckZxdlhwN1UxeDI0N2F3Mk9NVEhWenlUWUlV?=
 =?utf-8?B?OHRDOCs5Nnptc3EyMzhsVW44WEF3cGF0eis0c0lmMWd0SXI1RzhNTTRteFpv?=
 =?utf-8?B?WVhpUCtSYnBvZFVOc2VwNXBlVFdCcUJIeU50MU85aVJkam1WS2ROaTh4bmhh?=
 =?utf-8?B?QnVRNDRiNDZVZEM5aFlTYUFBN1JZNDIrSSsxNHdrMGEyZGc3ZnRqMnRKL2RF?=
 =?utf-8?B?SEp0TllLMW9ldmQ4TDJna2NaWWFmeU1Fa0FtdU8wZCsrd1JHdmZyeTByendC?=
 =?utf-8?B?aDV0L0JCeG13bXdQNWlVVUFHWEZBcjBpZmJtRnUyRnRKMW1JR2tXaGhhVm1o?=
 =?utf-8?B?bEFETjk2RXJ2Y2VYWkRIZHNCWElLQndzTStRMFlOTFNwM3N2MDJ5TGF6N3Bm?=
 =?utf-8?B?SzdOR0xPS0xtT2JYUG9YYnViSmZsTUFNM01teCs3NWRIZU5sY1Zaa1BTc0NP?=
 =?utf-8?B?QmtRM2FnTkJmS0paOVM5YjBUbkZHQkliWGdqUzc0U256YXdZY2VQSEU3R0R2?=
 =?utf-8?B?ZkZrbnZreE0wbG0wQ3NJNFJ4bExRQmpzL1IrMEVXRHBpdkRleDgxNDdSMUUw?=
 =?utf-8?B?RXFkRXdnT21ZUTZJcjllNVJoeG5vempwWGZUR010c2xMWFV2dmFaaFdJL3dB?=
 =?utf-8?B?VHJXY1lJWTRleXBvZVZPZ2IvRGVhbGh2SXJDc1B6dHBKS3RKQ2NHaFNTSTMy?=
 =?utf-8?B?M3RJZVNPbDk0ZW93UjZoSTVTMC8zVm1vS2NFbkptQ2FqUTVIQTlPcldWTlhy?=
 =?utf-8?B?RkFuTWpIbHBGcEg3NWg0Z2lSME5vTnEwVXI1cTU0bURPWG4zeWhHMmJyS3Rr?=
 =?utf-8?B?MWlBUk0zR1p3UXRiQlVnaDVWL3V6UmR6elJDNnJqdTUvUUdrdkV6SEZsSGVz?=
 =?utf-8?B?US9GQXIzMVVxYldVWFVvcHFQd1d0RWd5cjhtYzNlVXJGdnlvcHk3b2xBR1My?=
 =?utf-8?B?S0JrUzB4T1IvaXE2Zit2QnBqcm5nblRkdFRTYmNYNVluNHhhSWV5c1o3SFM0?=
 =?utf-8?Q?QvhQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5185db-911f-431f-1ad4-08dcd16c31ac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 07:43:00.2266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkCg75V8Rzh8gTwPv8mss1cOMKcXOGRow5WgRCaifQ1+JxTLItkev/5QCh8yL3pZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7344
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

Am 09.09.24 um 19:19 schrieb Tvrtko Ursulin:
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
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index ae8be30472cd..76e422548d40 100644
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

The rq variable is now not needed any more except for getting the 
scheduler, isn't it? If yes I would ditch that as well.

Either way Reviewed-by: Christian König <christian.koenig@amd.com> to 
this patch.

Regards,
Christian.

> +
> +		drm_sched_rq_add_entity(rq, entity);
>   		spin_unlock(&entity->rq_lock);
>   
>   		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>   			drm_sched_rq_update_fifo(entity, submit_ts);
>   
> -		drm_sched_wakeup(entity->rq->sched, entity);
> +		drm_sched_wakeup(sched, entity);
>   	}
>   }
>   EXPORT_SYMBOL(drm_sched_entity_push_job);

