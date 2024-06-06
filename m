Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5638FE778
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 15:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B41A10E124;
	Thu,  6 Jun 2024 13:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="q78Q3dKF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F5810E124
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 13:18:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTlltC6UNafavOvph5XHRyiygXKTLCyK5Brc6B/RPPB/XRJEDgwnFHfBK25GykyoaDbIpHr2KXYa4Wi52bcRDBkYQaOQn4PHVBMTTN3efl9v11cjpHkB/jEjSPv4XxV8pfTiRmtEvJyWPjy9SEeHw63Oy0LCbfuASr4s7DIxiC6X02bF1U/b/Z21zlZlCRFK7YkjHeM5EPmMs1K9+/J7Ahq4FH7hFNaEaoPG+Judr8COCFM+85N9ijkgwdQwg9pIlDpyCg72SIoIHTo7SqalVrSNEN0tI2yRkqrdG1GvRRNwysmMElpOWAVj/Xe6dMM4UebR9pTWwNVDe03FCXn8+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJSi18ZcNRre0MefyB/Hmgz1sEW79xyKD6DnA17eJ7E=;
 b=IV0mM6Q1Z3FTBM7z3HWB44tPJnCdPFlWqG3+NreUHNiWXIee3laCzcmVf9YVI26OeSclySpsls3v2EpMyKaebzGhj840UmxNO0iorBqw7jfADULh/drX3eHY/NyV/Dd5EFYjs4vCYqI0RraI9K4pZgPXyB7Nv1V12T/VMMH2C0lH+fKOABoN6uoz6Yxn0QrCXycabUwvV+gzUdPJ4atujN1kUdzvnD8ebdZskUsbMJHYUGEY/6OvZqJfvoJwHumAQe3Dr6AJcp6fWoQA9sL9wHTcbHF9IyhiRsZExXeC5Qa78yOA3NCB/bpGtWKxETtR7mXv9iP8RW/eoiZairXSew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJSi18ZcNRre0MefyB/Hmgz1sEW79xyKD6DnA17eJ7E=;
 b=q78Q3dKFUd5YOv4GeplWTHedrNcgGlIBoVUHRU0nB+QnzFlwgxFGqbUcyBIQbxLE58Aslt6bVcWmg3k138x/bId6ggcpaLyn9GqhXmKUEA2RGt/C5ubsbNdClBPUUanVxBCt2GBmdn3RMSxQhtYI41wkTX92QfWGQc3vLX/euFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8288.namprd12.prod.outlook.com (2603:10b6:208:3fe::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Thu, 6 Jun
 2024 13:18:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 13:18:20 +0000
Message-ID: <6f4e7b5f-7af8-4245-a927-37ebc2789868@amd.com>
Date: Thu, 6 Jun 2024 15:18:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/sched: store the drm_device instead of the
 device
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, ltuikov89@gmail.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, rostedt@goodmis.org
References: <20240606130629.214827-1-pierre-eric.pelloux-prayer@amd.com>
 <20240606130629.214827-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240606130629.214827-2-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0244.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc00c90-fb65-42e1-7a4d-08dc862b22e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|7416005|366007|921011; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjU4Z1ZXTDE4RWg2c3BTR05lbnpLeVkvaXh0Rm9NMVhPd2NhQlNRTnc2Vjhh?=
 =?utf-8?B?TkEwZDREZkJqTit4YVFsWUZvYmVCd3A4OW5EUWtzVFlnbjRldkhDNUxoWGxS?=
 =?utf-8?B?cHVoaEFPK2s2RFFKc2FEMEtvdU03bWxQYlB4MU9iTXpxY0luZzl5djZML0ZP?=
 =?utf-8?B?eVpwaHFmeXNRQ2EyQ0FBZ2t2RFIrR1MwVGVObGV0RzRTbVIra0hKayt4V1RZ?=
 =?utf-8?B?Z0xHUm5NaGxGU1NIOTFNeXE5cnA5VVNEMU1ZZmpCb2xoU1pncTJEVStrYmJF?=
 =?utf-8?B?d09qd0ZIVkVyTHVNUWFsTmRTN1FqOWl2b1hxcDNwREdWUUwycllDVHR0YUk4?=
 =?utf-8?B?SFMwK0paVHFuc0RhTndRdDQ2a2JFY0NJUU1GbUdGdm9MNjR1WHpZbldJWXpP?=
 =?utf-8?B?MHRhWHBibDZsaUhFWStpSHNZN29jOVFTcjhwTGpUMjFBVHV6QWxjM2kvUjBu?=
 =?utf-8?B?WGpleVVwaVE1U09aWGRsdUZ1eitBa2ViejVuQkg2Q2g2VHdGbkJ3bTNGSVZC?=
 =?utf-8?B?Qm5hdFJPa0xCOTE0OTVZZ21sdElxemY2TDlrOGNKMmx4VDRCUE11eTNOdUl6?=
 =?utf-8?B?MXV5MFU2OHpZMjdBWExReVpWaTYvcFV4Z09GYWpHaUpLMXp2a25TemhoMGt0?=
 =?utf-8?B?dGxHWXNuU1d1d0VNUGNnMFdxMklwMlRpV01lOWI2UUtpandYQ3dxWFA2eHBM?=
 =?utf-8?B?ellNUElZV3JxZjFGekgvZzhmNTBuWGNzU0Qxb1lJOHdwajFWU0NNZVdZL2xJ?=
 =?utf-8?B?UTFjeGVlN0Q5cXNZRmpyK3B1dkkvZFdBbjlscSsvb3ROeVV4ei94cDRNYlBn?=
 =?utf-8?B?YzdPcGNNS2d4d0pKM2ZaUXVnWHBHMk9uU0swTWlQSU1qUW4rZ2RGbzZVdlFj?=
 =?utf-8?B?Q3ZiTk04K2taYWlEcVlKTXhvVDlVQlh4WWEvTHJ5UXpiU2c4L3lsRjdHbUx1?=
 =?utf-8?B?R3dOemJxTVpVVlAySEcyN3labEUzek5DdElQS0I3d1VMZ0xCYjRScW1JeTgr?=
 =?utf-8?B?WC9iN1BNT2xlenhXOHltWlRHd1g4czRFV1RaZU0rZHdyb0tad0U0TDZuaGNw?=
 =?utf-8?B?SngrNWFudUZYcENtS082MERDcEFVNys0a2gxRlRHV3lCZnBCQnZCY1hKbnJH?=
 =?utf-8?B?MlJ5M2w2d1MydzhMUGNkaXBqK2poQzlRaHovVlNFVGdTVUkyam1RTHZHTEJ3?=
 =?utf-8?B?SmpiRDdId2xOQlYxMmMrQVp5d2Yvd2dqM3Jtb0dRcHg4VzBRTloxUURZMjNF?=
 =?utf-8?B?K09ONlBjMlprYUo3Vjk2WGRMMDlhNWlyZkVCNnpERWQ3K0dLVDhjT2hVY1VG?=
 =?utf-8?B?NmhSbEdlZ3M5WnYrd2dsTWtNN2pnYXdhNE45cXorVHo5bjhRUXRSZjJYZjJK?=
 =?utf-8?B?WUVWU1doQ2N3L0NTK2dwSnV0M3dXb3FOelFLdFFiZHpXZHR1YjB2L2RERG5T?=
 =?utf-8?B?ZjN6VHpIR3dINGJaYzRjSytqT2E1SXFucGt5RWJUVlVVbjE2cHJsaGhaazg2?=
 =?utf-8?B?R1ZURWtORUtLOGdVbmIxMkJyaFJGeG5UTDB2aG9NWWt0ZERXVGJheGJIYXNt?=
 =?utf-8?B?SVYxSU0xSTk3eklSOFJrZVFjRnRTVWhRRnRORzB0RVdPYmNEZUtLNU9iWS8v?=
 =?utf-8?B?d2RsSzFMMmh5STI4TmhvY0l5RDYyeDNKS1BVeXpPRnd6NEtKclJCY1lCWElI?=
 =?utf-8?B?dENzMnRwZXEycGxpTnJMLzRQUTlIZFhmOC9PdVlwU1pwbWhUOHlzWC80SU1j?=
 =?utf-8?B?U1pRRUdUUVlpbHhZTE1WUlVKYjVlMnZYeis3R3N5UGZvUUpSR0dMN2JGSTcz?=
 =?utf-8?B?RzJRbHp0TFZIMGl3ejJMUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(7416005)(366007)(921011); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWtVNVlIL0cvak9vRmFlbzRjcGhhcVc4dkU3bHJBTTA4KzVvcFJUaDBNcHBu?=
 =?utf-8?B?WldCaUliUVhYcG5SR1lnejdBRUFGS09hUDlFU3VseWIzSGw5ZmsyZktPaDE0?=
 =?utf-8?B?ZEFMUDJrbmRYYmVEZnR4UERCL2NxZTMyeFhXMnQ1OXNheWl5S256SG04QklV?=
 =?utf-8?B?NlNDMU5VR05qL2tmTGRPeHZHY0I2RWc0KzhIeHE2eUhEN240UnE5K0dKelJD?=
 =?utf-8?B?VVFXemJnYno3bkVJVFNCOXRmbzFCTlp6L21uS3hqZWluMHdYdS9zaklqd0R4?=
 =?utf-8?B?VHIwa0FFQWsvOHMvTkNmYVhZb3JITWlVTEcrRzJ1c29XYXBnSFdxbVdGRFBZ?=
 =?utf-8?B?b2xHRlB1TVRlQTVrZE9zRTBOU01DaUdqV2VLSEFmNW9tdnB4S0dqUy9vVHNS?=
 =?utf-8?B?Uld0NVBzOWdVRU54bWZhbFM4aCt0ZXJIUHFzdkhEZE8xVmhUTlc0R0tXVGg3?=
 =?utf-8?B?SWVDWkxEZ3FEWVAzb2pad1phSE5OREhjL3RKOXRNeGUyUzMrbXVwNTRKZzZi?=
 =?utf-8?B?dGloMEVSbyt5UitxcWhyMmh3bDhRY05UME9KNFRwOGVrOEVWOWNqVlNZdHp1?=
 =?utf-8?B?aGU2bm1UVXJHYTFVQktwTkRSOXNQUWV6aWFpaStzcndERkFkdHhpQWtVbUJF?=
 =?utf-8?B?Slg2V2dxazlnN1dNL2Jpam5GU2JZMmY3ZEtSTWtsdDRYRzc4NnUxOEN2V2FK?=
 =?utf-8?B?eEdoc3hIWDZ1RnluRTdXSktRK0E3Y1p3S2J3dXNJMXRGVVRVNWtDK2NTQldx?=
 =?utf-8?B?SDgrN3dIbEJ4YnRMd0NXcHZQUHQyV2pNcTRCZEsyZnJUZFgvbHJJTCtBWnh6?=
 =?utf-8?B?MEJQNUgycDErUHlmQlExZXlxanJXSFFZSmVlQllXQWRmc0Y0R0hmSTJUT1lv?=
 =?utf-8?B?UWRkMnBmM0cxZDl1MTh2b2U5OHRkcHNaUE8wcjlmYXI3bUc5dk5pMExRRk12?=
 =?utf-8?B?djlWUjYzK1VYM1lTTTRkeDdmWEYvZ3o0d2EvbTZDenlvNkhxaW5GUDB3Kzd6?=
 =?utf-8?B?NEppWnhtK2ZnOFd0Tm4xU2tieU5BczBVcG9SYUYrdFY0L3BEeVB0ZHRFTkN1?=
 =?utf-8?B?aDMwRkYxdTZveTdHR09FeEM5T2c3bW1wZzlMSEF2QStTLzNzTXE3aDVaVUFO?=
 =?utf-8?B?SE5wV0d0bFJkVGViK2hGckpsSXA5SUp2NEtLeVJ6NGtDdlFRN0ZFREtLWEhv?=
 =?utf-8?B?NlJvTUdZd0tRRWxqbmp4M3hsS2REWEd5UEFFOG9TWjl5VkwyK010a2NwU1c0?=
 =?utf-8?B?Rkd3SlZXZUZaQUxXdVlEVnlmck9pcjRPYms0aEd5cTcrdVYzb3hiM2RUQ3Bo?=
 =?utf-8?B?SkFFQTVBeGppYklLOVBVTWlRWnBNSWpZcDVYTlpGR2FhTGFYMUttN2JKbGhy?=
 =?utf-8?B?M3lYZWp5QVk2SzZ6TU1ZWUlFZVc5YWZFNU1wcHhlTXJ0eXU1MVpYYmpKaFIv?=
 =?utf-8?B?NjlYSVNLbjEzNGpkQkxxMGZCZU82bFJjN284T24rYm56RC9mM3IyZ1k2WU56?=
 =?utf-8?B?VS81SnA5WXZ4MWl0TEFqaXU4aER6YXBSZjFpNWZQeFZSeFJ5V05DK2pWUitv?=
 =?utf-8?B?RzdDaVA4cWtBZkd4T3ZQS0NEODdUcFkvRVEydVFNbmg5aVRvaXorYmN3a2JV?=
 =?utf-8?B?elVKZG1uRi9aT3NyZlVudzZhV09XWFRZYW03SFRZYnRvNEUvZmEwK2RhV1VQ?=
 =?utf-8?B?K0ErZitFOWhnMitiZ3pReU9aeGsvUnVGZ0c5SHo0Wm9mTS9xdi90S1lQa1RO?=
 =?utf-8?B?WkF1MFpuN1JUTkV4ZjcvQWpZZ3ppdHJiK2FOdVN4K01ZdlFMOGJZeEpGVS96?=
 =?utf-8?B?OUdHN20wcmlqSktJMTJRQm52ZDhEOC9TVmlYQjF2dXlXY0RPU2ZKYTY5eTli?=
 =?utf-8?B?WXBYNVQvQkY4QTdxSldpeHloUzYvNHVkRU9sNDlXMVBhcHhYZThBZjY2Nk00?=
 =?utf-8?B?QTEyc09kUlVNS3dzN0RMMVQ5TENGdjZGSkpFVW1iWEZKNGdIZTYxNGQ2cGsz?=
 =?utf-8?B?d0U2RjAzWS9KUVRQdVV6a3V6ZHVCR0EvNnE0cGlBQmZHZURweWw5RnJxTFN2?=
 =?utf-8?B?cHF2dDBoZkFYREp1VXhFSmJhRXF3cUZvS3hRNjQvZXgwek53U1hsVDJpZzZ6?=
 =?utf-8?Q?STYlP+oMWhS3rMJrvjKiy9w88?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc00c90-fb65-42e1-7a4d-08dc862b22e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 13:18:20.7970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5wLRSnbqHfyk274FcKVq1UOm1FGM83h7ZEXfDQe/MoMdDyMsvkSBfOrlrnaJ3/j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8288
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

Am 06.06.24 um 15:06 schrieb Pierre-Eric Pelloux-Prayer:
> When tracing is enabled, being able to identify which device is sending
> events is useful; for this the next commit will extend events to include
> drm_device::primary::index.

That sounds like a rather bad idea since the primary index is really 
just an arbitrary number and not defined for all devices.

Why not use the device name instead? This way you don't need this change 
in the first place.

Regards,
Christian.

>
> Since the device member is only used in the drm_* log macros, we can
> replace it by a drm_device pointer.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  2 +-
>   drivers/gpu/drm/imagination/pvr_queue.c    |  2 +-
>   drivers/gpu/drm/lima/lima_sched.c          |  2 +-
>   drivers/gpu/drm/msm/msm_ringbuffer.c       |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_sched.c    |  2 +-
>   drivers/gpu/drm/panfrost/panfrost_job.c    |  2 +-
>   drivers/gpu/drm/panthor/panthor_mmu.c      |  2 +-
>   drivers/gpu/drm/panthor/panthor_sched.c    |  2 +-
>   drivers/gpu/drm/scheduler/sched_entity.c   |  2 +-
>   drivers/gpu/drm/scheduler/sched_main.c     | 26 +++++++++++-----------
>   drivers/gpu/drm/v3d/v3d_sched.c            | 12 +++++-----
>   drivers/gpu/drm/xe/xe_execlist.c           |  2 +-
>   drivers/gpu/drm/xe/xe_gpu_scheduler.c      |  2 +-
>   drivers/gpu/drm/xe/xe_gpu_scheduler.h      |  2 +-
>   drivers/gpu/drm/xe/xe_guc_submit.c         |  2 +-
>   include/drm/gpu_scheduler.h                |  4 ++--
>   17 files changed, 35 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 932dc93b2e63..7f2a68ad8034 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2738,7 +2738,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>   				   ring->num_hw_submission, 0,
>   				   timeout, adev->reset_domain->wq,
>   				   ring->sched_score, ring->name,
> -				   adev->dev);
> +				   &adev->ddev);
>   		if (r) {
>   			DRM_ERROR("Failed to create scheduler on ring %s.\n",
>   				  ring->name);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index c4b04b0dee16..c4345b68a51f 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -138,7 +138,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>   			     DRM_SCHED_PRIORITY_COUNT,
>   			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>   			     msecs_to_jiffies(500), NULL, NULL,
> -			     dev_name(gpu->dev), gpu->dev);
> +			     dev_name(gpu->dev), gpu->drm);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
> index 5ed9c98fb599..cdbb6c01e952 100644
> --- a/drivers/gpu/drm/imagination/pvr_queue.c
> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> @@ -1287,7 +1287,7 @@ struct pvr_queue *pvr_queue_create(struct pvr_context *ctx,
>   			     pvr_dev->sched_wq, 1, 64 * 1024, 1,
>   			     msecs_to_jiffies(500),
>   			     pvr_dev->sched_wq, NULL, "pvr-queue",
> -			     pvr_dev->base.dev);
> +			     &pvr_dev->base);
>   	if (err)
>   		goto err_release_ufo;
>   
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index bbf3f8feab94..db6ee7650468 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -526,7 +526,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>   			      1,
>   			      lima_job_hang_limit,
>   			      msecs_to_jiffies(timeout), NULL,
> -			      NULL, name, pipe->ldev->dev);
> +			      NULL, name, pipe->ldev->ddev);
>   }
>   
>   void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index 9d6655f96f0c..3a4b3816f2c9 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -101,7 +101,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>   	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
>   			     DRM_SCHED_PRIORITY_COUNT,
>   			     num_hw_submissions, 0, sched_timeout,
> -			     NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> +			     NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev);
>   	if (ret) {
>   		goto fail;
>   	}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 32fa2e273965..386839bed8a2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -419,7 +419,7 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
>   	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
>   			     NOUVEAU_SCHED_PRIORITY_COUNT,
>   			     credit_limit, 0, job_hang_limit,
> -			     NULL, NULL, "nouveau_sched", drm->dev->dev);
> +			     NULL, NULL, "nouveau_sched", drm->dev);
>   	if (ret)
>   		goto fail_wq;
>   
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index a61ef0af9a4e..28c7680a8dbf 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -875,7 +875,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>   				     nentries, 0,
>   				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>   				     pfdev->reset.wq,
> -				     NULL, "pan_js", pfdev->dev);
> +				     NULL, "pan_js", pfdev->ddev);
>   		if (ret) {
>   			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
>   			goto err_sched;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index fa0a002b1016..b9c5b500b7d1 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2293,7 +2293,7 @@ panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
>   	ret = drm_sched_init(&vm->sched, &panthor_vm_bind_ops, ptdev->mmu->vm.wq,
>   			     1, 1, 0,
>   			     MAX_SCHEDULE_TIMEOUT, NULL, NULL,
> -			     "panthor-vm-bind", ptdev->base.dev);
> +			     "panthor-vm-bind", &ptdev->base);
>   	if (ret)
>   		goto err_free_io_pgtable;
>   
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 79ffcbc41d78..47e52f61571b 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3043,7 +3043,7 @@ group_create_queue(struct panthor_group *group,
>   			     args->ringbuf_size / (NUM_INSTRS_PER_SLOT * sizeof(u64)),
>   			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
>   			     group->ptdev->reset.wq,
> -			     NULL, "panthor-queue", group->ptdev->base.dev);
> +			     NULL, "panthor-queue", &group->ptdev->base);
>   	if (ret)
>   		goto err_free_queue;
>   
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 58c8161289fe..194798b9ce09 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -92,7 +92,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   		 * the lowest priority available.
>   		 */
>   		if (entity->priority >= sched_list[0]->num_rqs) {
> -			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
> +			drm_err(sched_list[0]->dev, "entity with out-of-bounds priority:%u num_rqs:%u\n",
>   				entity->priority, sched_list[0]->num_rqs);
>   			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
>   						 (s32) DRM_SCHED_PRIORITY_KERNEL);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 7e90c9f95611..74a2fe51e653 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -103,9 +103,9 @@ static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
>   {
>   	u32 credits;
>   
> -	drm_WARN_ON(sched, check_sub_overflow(sched->credit_limit,
> -					      atomic_read(&sched->credit_count),
> -					      &credits));
> +	drm_WARN_ON(sched->dev, check_sub_overflow(sched->credit_limit,
> +						  atomic_read(&sched->credit_count),
> +						  &credits));
>   
>   	return credits;
>   }
> @@ -130,14 +130,14 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>   	if (sched->ops->update_job_credits) {
>   		s_job->credits = sched->ops->update_job_credits(s_job);
>   
> -		drm_WARN(sched, !s_job->credits,
> +		drm_WARN(sched->dev, !s_job->credits,
>   			 "Jobs with zero credits bypass job-flow control.\n");
>   	}
>   
>   	/* If a job exceeds the credit limit, truncate it to the credit limit
>   	 * itself to guarantee forward progress.
>   	 */
> -	if (drm_WARN(sched, s_job->credits > sched->credit_limit,
> +	if (drm_WARN(sched->dev, s_job->credits > sched->credit_limit,
>   		     "Jobs may not exceed the credit limit, truncate.\n"))
>   		s_job->credits = sched->credit_limit;
>   
> @@ -701,7 +701,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>   			if (r == -ENOENT)
>   				drm_sched_job_done(s_job, fence->error);
>   			else if (r)
> -				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> +				DRM_DEV_ERROR(sched->dev->dev, "fence add callback failed (%d)\n",
>   					  r);
>   		} else
>   			drm_sched_job_done(s_job, -ECANCELED);
> @@ -797,7 +797,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   		 * or worse--a blank screen--leave a trail in the
>   		 * logs, so this can be debugged easier.
>   		 */
> -		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
> +		drm_err(job->sched->dev, "%s: entity has no rq!\n", __func__);
>   		return -ENOENT;
>   	}
>   
> @@ -1215,7 +1215,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   		if (r == -ENOENT)
>   			drm_sched_job_done(sched_job, fence->error);
>   		else if (r)
> -			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> +			DRM_DEV_ERROR(sched->dev->dev, "fence add callback failed (%d)\n", r);
>   	} else {
>   		drm_sched_job_done(sched_job, IS_ERR(fence) ?
>   				   PTR_ERR(fence) : 0);
> @@ -1240,7 +1240,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>    *		used
>    * @score: optional score atomic shared with other schedulers
>    * @name: name used for debugging
> - * @dev: target &struct device
> + * @dev: target &struct drm_device
>    *
>    * Return 0 on success, otherwise error code.
>    */
> @@ -1249,7 +1249,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		   struct workqueue_struct *submit_wq,
>   		   u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
>   		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name, struct device *dev)
> +		   atomic_t *score, const char *name, struct drm_device *dev)
>   {
>   	int i;
>   
> @@ -1265,7 +1265,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
>   		/* This is a gross violation--tell drivers what the  problem is.
>   		 */
> -		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
> +		drm_err(dev, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
>   			__func__);
>   		return -EINVAL;
>   	} else if (sched->sched_rq) {
> @@ -1273,7 +1273,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		 * fine-tune their DRM calling order, and return all
>   		 * is good.
>   		 */
> -		drm_warn(sched, "%s: scheduler already initialized!\n", __func__);
> +		drm_warn(dev, "%s: scheduler already initialized!\n", __func__);
>   		return 0;
>   	}
>   
> @@ -1322,7 +1322,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   Out_check_own:
>   	if (sched->own_submit_wq)
>   		destroy_workqueue(sched->submit_wq);
> -	drm_err(sched, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
> +	drm_err(dev, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
>   	return -ENOMEM;
>   }
>   EXPORT_SYMBOL(drm_sched_init);
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 7cd8c335cd9b..73383b6ef9bb 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -740,7 +740,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   			     DRM_SCHED_PRIORITY_COUNT,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_bin", v3d->drm.dev);
> +			     NULL, "v3d_bin", &v3d->drm);
>   	if (ret)
>   		return ret;
>   
> @@ -749,7 +749,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   			     DRM_SCHED_PRIORITY_COUNT,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_render", v3d->drm.dev);
> +			     NULL, "v3d_render", &v3d->drm);
>   	if (ret)
>   		goto fail;
>   
> @@ -758,7 +758,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   			     DRM_SCHED_PRIORITY_COUNT,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_tfu", v3d->drm.dev);
> +			     NULL, "v3d_tfu", &v3d->drm);
>   	if (ret)
>   		goto fail;
>   
> @@ -768,7 +768,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   				     DRM_SCHED_PRIORITY_COUNT,
>   				     hw_jobs_limit, job_hang_limit,
>   				     msecs_to_jiffies(hang_limit_ms), NULL,
> -				     NULL, "v3d_csd", v3d->drm.dev);
> +				     NULL, "v3d_csd", &v3d->drm);
>   		if (ret)
>   			goto fail;
>   
> @@ -777,7 +777,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   				     DRM_SCHED_PRIORITY_COUNT,
>   				     hw_jobs_limit, job_hang_limit,
>   				     msecs_to_jiffies(hang_limit_ms), NULL,
> -				     NULL, "v3d_cache_clean", v3d->drm.dev);
> +				     NULL, "v3d_cache_clean", &v3d->drm);
>   		if (ret)
>   			goto fail;
>   	}
> @@ -787,7 +787,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   			     DRM_SCHED_PRIORITY_COUNT,
>   			     1, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_cpu", v3d->drm.dev);
> +			     NULL, "v3d_cpu", &v3d->drm);
>   	if (ret)
>   		goto fail;
>   
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index dece2785933c..dc81e9f39727 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -336,7 +336,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>   			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
>   			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
>   			     NULL, NULL, q->hwe->name,
> -			     gt_to_xe(q->gt)->drm.dev);
> +			     &gt_to_xe(q->gt)->drm);
>   	if (err)
>   		goto err_free;
>   
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> index e4ad1d6ce1d5..66d36cac82a0 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -61,7 +61,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
>   		  uint32_t hw_submission, unsigned hang_limit,
>   		  long timeout, struct workqueue_struct *timeout_wq,
>   		  atomic_t *score, const char *name,
> -		  struct device *dev)
> +		  struct drm_device *dev)
>   {
>   	sched->ops = xe_ops;
>   	INIT_LIST_HEAD(&sched->msgs);
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index 10c6bb9c9386..9a75457813f2 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -16,7 +16,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
>   		  uint32_t hw_submission, unsigned hang_limit,
>   		  long timeout, struct workqueue_struct *timeout_wq,
>   		  atomic_t *score, const char *name,
> -		  struct device *dev);
> +		  struct drm_device *dev);
>   void xe_sched_fini(struct xe_gpu_scheduler *sched);
>   
>   void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index e4e3658e6a13..b9c114f2c715 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1208,7 +1208,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>   			    get_submit_wq(guc),
>   			    q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES, 64,
>   			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
> -			    q->name, gt_to_xe(q->gt)->drm.dev);
> +			    q->name, &gt_to_xe(q->gt)->drm);
>   	if (err)
>   		goto err_free;
>   
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 5acc64954a88..0ba8716ec069 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -539,7 +539,7 @@ struct drm_gpu_scheduler {
>   	bool				free_guilty;
>   	bool				pause_submit;
>   	bool				own_submit_wq;
> -	struct device			*dev;
> +	struct drm_device		*dev;
>   };
>   
>   int drm_sched_init(struct drm_gpu_scheduler *sched,
> @@ -547,7 +547,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		   struct workqueue_struct *submit_wq,
>   		   u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
>   		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name, struct device *dev);
> +		   atomic_t *score, const char *name, struct drm_device *dev);
>   
>   void drm_sched_fini(struct drm_gpu_scheduler *sched);
>   int drm_sched_job_init(struct drm_sched_job *job,

