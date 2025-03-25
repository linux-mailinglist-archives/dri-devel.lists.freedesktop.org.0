Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921BEA7053A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 16:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE8510E593;
	Tue, 25 Mar 2025 15:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qt3IXXLx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2042.outbound.protection.outlook.com [40.107.212.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90DF10E593
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 15:38:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MygzuG3/hMliFtDqT2VKwVtmzJ04wG01j7L1B976YxOa1EISvYcUobuyY594mf0Rz8NuUwcbss+67nH9v+2SkJDKwI1NzSgHxMnJ3AYK76S9XZB5pIKA6gTiU3GnO9HWI3jf0PeC1uQ05y5jZPPs3mf+ZFu7QMpHTqO0aEmOiTpoAjWSsd3m6KVDG4utIjVhqlCBPTDb/uUkS8hyp848NEF80HFdkqcvlYJ6GR1yVl3gkPpDGkU/+Vsl+6vTfzRN86pZNh72difag1LWzx6MYKJQW/Bf6Ej1JVtEUiUEINIO/X2EACgOcpvsRTiaBWLnQJM421xb+lAXF+dQXWumjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8Nq9zdEpa/2d8x6aG8WyoPwtBs82XfyXoETMSpejVA=;
 b=yobL+rplBJVHfu4cDiSE00J5Jh4oLXirlvDV8vHDXtH5rCX4tLKQ2zxY60nxReumB+CkfhT+N6Ndk9mU7audnJBxt81wGoTMILAZbGXwFR//OGSVulfl8xmI2eJUkjXW5GxVPlLE2FZTKRNOHiV0ugC9BfceHynoHOmfuCzTFuOlxPKPmEIJItU9paOWhDoqSsJLDSkoPnS5WhX2GEvjhXiSWVldx9FYFQYCLJdA3t3bJ1R+YByHpgXaa+8CZMeBjzHYZ0NUXSfRExEJrQb3wd9spJflla04D7rSeyLbPledZEw3vDYdM/n9GDfsG4kJkFWbBw6gm4fBSXWVZtwMeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8Nq9zdEpa/2d8x6aG8WyoPwtBs82XfyXoETMSpejVA=;
 b=qt3IXXLx8pL+NfdRfboN5szTL9Z55qQhNvDrwsClKAQdVc4Ez6lZ8GQR3u74aPZSAZmSn4rfsVI5g2X2XBGGKgVkxvCTR78QRyjUrOkmvPFtOTGrPlcqG5xveHIR8MYvUlM7n/MiyiVYk8INyUx+H4POCq3hiP/Wb94oR3jOavA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6860.namprd12.prod.outlook.com (2603:10b6:510:1b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 15:38:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Tue, 25 Mar 2025
 15:38:35 +0000
Message-ID: <7ab02657-370f-4d97-883d-705324f884c3@amd.com>
Date: Tue, 25 Mar 2025 16:38:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem-shmem: Optimize DMA mapping for exported buffers
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: sumit.semwal@linaro.org, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de
References: <20250325133744.23805-1-jacek.lawrynowicz@linux.intel.com>
 <92f87a44-931a-44af-9acc-65f0d062b611@amd.com>
 <47542c02-4c83-435e-811a-904e202d3dfa@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <47542c02-4c83-435e-811a-904e202d3dfa@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: 73f8e777-faf3-4ba8-4378-08dd6bb31b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3AwSEJFc29VVkdOYldHYnRJTmZnUEhWcGNBY3hXWkg5Wm1DUEZoZUdNcVhj?=
 =?utf-8?B?WnVSTzc4cGU0Q1hJYmQ3UVN5MXhuN042ZjI2WFpaR0lwSUVJMjVka2w1RGp4?=
 =?utf-8?B?cTZOM1BVUEZ6WDFaQjRJNURRUk16UXMvdmVsWmdxaE9oVE5LbTR3cUYxeU1j?=
 =?utf-8?B?RUt0bmswYlhWdStnZFlGb3BPUEU4Nm5zWlYwSHRCZkw3L0lxOVhKYnNIT2VF?=
 =?utf-8?B?N2hwSml0c3pxc1VSckI2Wm5yMTJXQm1XeEVENnptcWpOSEFmcW5mSmZRYWFW?=
 =?utf-8?B?L3czRFU5U0pjOC93RWhzVG9TQ0NSS0dzaDVvWWtsa3RHNWdmQllwSTBzVXF4?=
 =?utf-8?B?ZmpPVm5rVExQR2NuWmJjU1RDRTc5cUdvbmRHUS83YWc2NUN3aER2N0JkRElE?=
 =?utf-8?B?Wm5EL0dSSTlGeEFzT29YT0Jmdmo3aDBTMjU3RURZR2lZZlRBR09uVXd1VkhV?=
 =?utf-8?B?dVVDUkJXYzFpSmJEYXNRT0NBTGRPU1Rjdmwxay9adHpud0V4OFNCVWlwSU00?=
 =?utf-8?B?UGpSbk9iSFNpSS9FVnNoeU53bWZCWkhRTnQxWmlia3lZTzdZNDZWR3JNRVB3?=
 =?utf-8?B?b082ckUwdExBeFovbW5jRGhsYk1HNHVsN0thMmhIYjh1Q3psc2t2aVBDVHhL?=
 =?utf-8?B?N1A3dlR3S3N5RXRMQnovOHROUVpkMWZpVngzelY4K01VdDFmdU5DcEFuam44?=
 =?utf-8?B?bytqa1BVZ29JWGgvNkhJODdlaGprZU1kRENuUXVEcHJDRThySWJ2dkRQd0RJ?=
 =?utf-8?B?MWFRT3BTK1dlQjZ5YUdUc2k5MHl0aUJ0RU0rRzNEVDhEdlJsOGdoZDY1ZGJw?=
 =?utf-8?B?RXZtYWFkV2VmWlNvc3pBZjJzKzJZNUVKcmpubGl0S2F6Ungvd2R5bFNkVTdU?=
 =?utf-8?B?NTRZS3hnU2dJYjllNENuTWs2aVJObFFaWTl3dnQ2N1NuTzU4TEZ6Z3IvUm5x?=
 =?utf-8?B?Q28za1puMFQrUG1xZWxHaWZqc1dSSjhLaG9HUnJUMlBTSVFzR0IwYzlLQ1Vo?=
 =?utf-8?B?RHNTdTU0Y2o1b0Nlak4ycWpzTkluRDNybkZ2RjNibkNTOFlGSlMwa1VLUU9H?=
 =?utf-8?B?K2VzeUo4LzJXcjhkRXhJU0tGS0hiL1N4aU9HNUZIcW9EM0p0NEF3YklxaXhD?=
 =?utf-8?B?bFdLcUFTTGdlcit5RC9CU1FYSnpjTGhtcHNKSmJVb2ZrZit0bnVIWGJtUFNO?=
 =?utf-8?B?V09NRFZvVU10TXNHb1pqYzQrY3Q3djJ5NVM1QWhSZUpnVVZoSm1EQ2VKa0xH?=
 =?utf-8?B?ODA0NnF2Mk9qdkJZamdHeEVlUHpYRTlkMy95Nm9jQ3dtKzVLa2R3NU5kRW9F?=
 =?utf-8?B?ZU04eTd4M0ZQc2NkYkthcFZYSit2YUduWk45STFQL1R4dGhTM0hzZ2RmR2ZY?=
 =?utf-8?B?U3ZMVFJudGV3Yi9VdXBkWUQxTUs3RkVaRDhnL1NzdmhFNDhmdzhFRm45V1d5?=
 =?utf-8?B?Z3J5bEpIT1NwYnNkUnQ3UStSRVFPYzY3eW4vaVNRQU01ZTV4MHhDbGVMaHc2?=
 =?utf-8?B?ckdndWMwdmhmTFF0aThzR3RxU2twd2cxVDZmTjhLWml6bTVHa0VzT1g0d3pu?=
 =?utf-8?B?WWFSUTlsakd3VndTVUVZS2VLTFpaaVdtWHRYOTdQQUp4RlpZTVI4TkJaV0pF?=
 =?utf-8?B?OS9Fak9zcnJmdTFnN3JMU3Y3a1oza0dyZk9uV1NHK25rRWZZa0l1RkoydTJr?=
 =?utf-8?B?bjQzMUZKaEZkR3NEMjg1cklONkpnSzFEdy9iOVhBR0ZjZUpYYm5TbmZLRlhN?=
 =?utf-8?B?eURDT0I5cTFpVmphWVlFWW4wcU5KdWRwQjFnYUtxbjRCdjBCTE4wMXVna1Ry?=
 =?utf-8?B?bWV2VWdlRGU4TlNyaHNpUDBaSnN0bkEreUt4VDhYQnA4emliV1k2WHgrT1ox?=
 =?utf-8?Q?EL4dDtmtx2iQu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGt0Y2s2cjVIdmtFa1hzeGZZZUl2TFc3LzdpZnM4T1dRaGhKaWN5NHVOY1BO?=
 =?utf-8?B?dDY0bjhkbEF1R3JVTXZjOVFIUEVWNzRxVzVzWmpLRFgyTVpyOXNoRUZpTkVV?=
 =?utf-8?B?OG4ybFdaejlKbjRvWmxhL3h0U3JRd3prSlRINjQ1M1QyMlo5UXMxZHEyNkx1?=
 =?utf-8?B?cHl5UVJzUUFXN0FLQTNQL2FmQW95Nm5MQ2NPVGRhNEhHRWQreVI0YU01YmFE?=
 =?utf-8?B?VjBjWDR4M2ZTTGFLRk12cFprQXV4WlFhYWNldHBkaWtXOTNIMHFlT2s1eXZE?=
 =?utf-8?B?NXk4ZFA1NitOZW53cENSZHBGVGhhT21JamNTZXJTV3VDWXdvRFJaQk1vZk1F?=
 =?utf-8?B?NFN1L25lRExCdUUrU3hhK2h4MnhDdDZOb0xUS2ZuNEg2UUhheG1oM1BZaW9x?=
 =?utf-8?B?Z2NNYVlHdWV2eTU0KzFzaElRUTBXU09jcDFtWHRrME5aVW55dEVoSzNpWDBh?=
 =?utf-8?B?SnBDcm8xSXFNV0ZnSW91SVduMmJ5bml3WG9veTR1c09SMDZjS0NHb3hJMUxt?=
 =?utf-8?B?WnE5YlNCUXA4THFFZzU2MDRrdmRWQmQ5MXROcGNDWGdjazJxcm00RncvYzU3?=
 =?utf-8?B?b3l4RXZ4MDVuamRsUkhnMFlNRlM3Y3NBVURxNGN4MGFtemtDek9VUllCcGxW?=
 =?utf-8?B?YWdRZjBuRmtSK0YwM1pDdzNTK2xZMndEcmFuRm15MGNNWXErcWJQQUlhWk1t?=
 =?utf-8?B?bkVsOGFPTUFxU3ZZYW9ML3diSUdKVEtMYVhhR1h5U1VadnlidzlWQnFRQ2Vv?=
 =?utf-8?B?OGlBNHFJSDk0K0QvSDNrb3QvQ1hpMnVWczExdWRWdmJuampzN2hKMTNVTDVC?=
 =?utf-8?B?WFY1UmFJZFJ2YjdrMElpVHVsOFA4ZG1JZEx3c0RSMk02QTJDZUtDQTFHY01D?=
 =?utf-8?B?RlFVUU1UK2hFeGVYd3JRMkJweDZvM3dpZXdVREVEQ2VpazQ1blMwTHVpbjUx?=
 =?utf-8?B?c2NEZjREWEIzVzkvSS9YMXQ0MXpUR2JQcWt6RGpvQk44bFY1QzRTY3lLSzZD?=
 =?utf-8?B?dTd5UHJVRnQ0QXQxUVJjRzB0UGFvSXFqdmVvVm1NNVJpUit4TDdxSGVOdXF6?=
 =?utf-8?B?TEphaVQyNkJVVmh2Y08vNWZFTFZDNmpMbmh1S2VTNmNTZHJTWmZ5dnMvTWpi?=
 =?utf-8?B?a1FPQVkwV2k1WGp1ZXdlNnpkRk95OGpyeWg1bzVVcjUwbnd2cWFnVUUyWi9X?=
 =?utf-8?B?VE9xQUNsYUxKNkJVT0h6QmdXQ0REb1JOclJZNHlkNmdZTUNZRFhhYThsRGkw?=
 =?utf-8?B?WE82YnJpUUt3YmExMjF4OGxiYmlZRzZKUFhRU1ZqUzk5cTFsN0tzYVBJczNG?=
 =?utf-8?B?amx2Y3cvQll0Z3NHTlZnQWNSaFdKUGNIZThLdUM5OVJ2N0greC96YnhFZG9D?=
 =?utf-8?B?czEwWWY5RW5KNXpsVnRHT2ZlTzlHbmVCOFRRS1hTZm5EQ0d6MlNyVS9uMFZP?=
 =?utf-8?B?bkduSEVsMmNEWHMzMDJlalZsamxPMUEwUkEyaTd5WjNtaksrUythMW1hU3Jl?=
 =?utf-8?B?aExNZ0RRNkJjSGJmZ0RsbjdXVjdOYnY4Vk1WUno5V1pwcFk4cXdEV2pSVzJM?=
 =?utf-8?B?NERTeTRtRkhST2c2WXVNT2g2am5DVW5SdGpXNW5QbDQ4aXNpZkFFSjJ5YVlF?=
 =?utf-8?B?RFpiZGZOc1B4V2EzQUFZOHlmdFVRdGRDeEpSNjJSOWRmNTROSHhtVmIvT09y?=
 =?utf-8?B?TUJMTGM5T1haejMrdzA2VDJUQkZESWszeU9SaHlKZ2kxVU54SFUxaGoreUQz?=
 =?utf-8?B?TnprY2ZwNnliUUtwTjlFb3lVMkw0bFJaWXdSZlN6TWlLZ1dUMkV3ZENWQk9q?=
 =?utf-8?B?eU1lU21ZdWUrTkFZeFZITmg3MEowTEdiTWlCaFVkWDZ0bHdCYVNNNnFLSGps?=
 =?utf-8?B?cDZaSFpoamRwenhUTkZweG9RWVV4emg1REhJVFAybThBd3VqZndTcjRyM2g5?=
 =?utf-8?B?T1FMcFVkUFdCVlRYMkFyVjNvamdoYXUyR25nMGI0TzRqUFRCY2g0WG1RM3lp?=
 =?utf-8?B?dFV2cTQ1L3pYb0ZrYVk3SmtMVi9UZ1R1NW53YWMycE5qVm1lR2x5K0hiNjRO?=
 =?utf-8?B?dkpCUUpoOTFMOG80SkhpbDhyRUNGejJabUpaNGJ2UE95ZU1ONTJWaWM2V29E?=
 =?utf-8?Q?RmUaFOFBNsw47alW+3wQKfezd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f8e777-faf3-4ba8-4378-08dd6bb31b10
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 15:38:35.6376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dHr/sQX6Uk1Lr+dZj5VvBvNNOFzZob9oMVBNZDzk03457Nf3o0O/KzKoLwnI53U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6860
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

Am 25.03.25 um 16:33 schrieb Jacek Lawrynowicz:
> Hi,
>
> On 3/25/2025 2:53 PM, Christian König wrote:
>> Am 25.03.25 um 14:37 schrieb Jacek Lawrynowicz:
>>> Use DMA_ATTR_SKIP_CPU_SYNC flag for exported buffers during DMA mapping.
>>> The same flag is already used by drm_gem_map_dma_buf() for imported
>>> buffers.
>>>
>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> ---
>>>  drivers/gpu/drm/drm_gem_shmem_helper.c |  8 ++++++--
>>>  include/drm/drm_gem.h                  | 12 ++++++++++++
>>>  2 files changed, 18 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> index d99dee67353a1..8938d8e3de52f 100644
>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> @@ -699,7 +699,7 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
>>>  static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
>>>  {
>>>  	struct drm_gem_object *obj = &shmem->base;
>>> -	int ret;
>>> +	int ret, flags = 0;
>>>  	struct sg_table *sgt;
>>>  
>>>  	if (shmem->sgt)
>>> @@ -716,8 +716,12 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
>>>  		ret = PTR_ERR(sgt);
>>>  		goto err_put_pages;
>>>  	}
>>> +
>>> +	if (drm_gem_is_exported())
>>> +		flags |= DMA_ATTR_SKIP_CPU_SYNC;
>> We should probably just unconditionally set this flag or not at all.
>>
>> Otherwise we could run into quite some surprises.
> I see that this flag is usually set in drm_gem_map_dma_buf() and similar callbacks across drm drivers.
> Shouldn't it be the default on x86?

Not really, no. If you can skip CPU sync depends on the platform.

On x86 it's correct that almost all devices are coherent with the CPU cache, but that isn't always the case.

The device driver using the GEM shmem helper needs to decide if that is ok or not.

Regards,
Christian.

>
> Regards,
> Jacek

