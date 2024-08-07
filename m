Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C6494A90E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 15:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF3910E529;
	Wed,  7 Aug 2024 13:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="I333yx/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED9F10E531;
 Wed,  7 Aug 2024 13:52:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ig5wfp8A57r+LZRs6s3wOrOaBqzGCncBDhJD8Kh1GnR+KPxhhl/rZX+2b/Y2MVq4dMEmG+2SANv+56GmTIS2xMzjWePgfFvykcpLqmjhYuwe8QiyX+Xe0jF13WXyxcFkAJUvvdClvmYevRBU7VAo6qbkDMoLE0hCtNaWk/lW/BmIMi5vyi1Je2CujB84xuQ5cQc8Uk/ynDfdFmbIixKNyKlY0bQgHhuEFhXBRj/FgXVG++JSeTNHFXCV8//DmDRMcUnFm44hJYXyqiIFfuMphngsbonHO2pMr4zmBkzTq21pxGlNvI6Ob7uTnAro9FXGEKpTJUmGjbPdO9n+hDYBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWWQFfZ3wEsrp5gqm2XGfXrjz8wMzTfIfE7fEFuJViQ=;
 b=ElQeksDrWVY+O9nrIPqfK2tCMJxD1+3dg08HguVIYQbyWAVT6nu9pFcSSXYCvSXLSVVoJBsoIv8o5zERUbFtpB8j0rXeFQsIrnCHzK2i8jhW2qzXqDqVmF1nagTFnCOVid7R4VhyOKfzp5q7/b4dpO5VntkKp0pVbbqvxfMEWdOYxL3t4Z/HEHoqsTTdRBES3VYJdG88MNHK3I5LCaO6QZaHtGfTgIxFTVZHSRuJTAD61lkEJmMqkf2+97up+JpuYC0K9A4mbvPWpzUdIPJT959UgmUTCmVyXdo8UndWJn7I+AsJZxPDsHbJ+3fcu/KwHMvLIGSf4G68fYanj6QM4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWWQFfZ3wEsrp5gqm2XGfXrjz8wMzTfIfE7fEFuJViQ=;
 b=I333yx/JgBH1s3FpmNoHbnFFrVtYkAcnzfSIuP4XJ9V0z7b1Va9GhkdPSn8idFySGXxNwkTGphu2+JjUkA41OCJR4L+aczEzxSVPnOKP9KJvA2gEP7QDzTBHj7bTyIkW+ro5HT8CiNYZrOEPk8AYAxVCcUvZRQscfyHvCvRO+zQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 SN7PR12MB7154.namprd12.prod.outlook.com (2603:10b6:806:2a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 7 Aug
 2024 13:52:53 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%3]) with mapi id 15.20.7849.008; Wed, 7 Aug 2024
 13:52:53 +0000
Message-ID: <dde7f328-3e38-48fb-83b6-f7daacf04b79@amd.com>
Date: Wed, 7 Aug 2024 09:52:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Revert "drm/amd/display: add panel_power_savings
 sysfs entry to eDP connectors"
To: Mario Limonciello <superm1@kernel.org>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Sebastian Wick <sebastian@sebastianwick.net>,
 Xaver Hugl <xaver.hugl@gmail.com>, Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Hung <alex.hung@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Roman Li <roman.li@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240806184214.224672-1-sebastian.wick@redhat.com>
 <20240806184214.224672-2-sebastian.wick@redhat.com>
 <0141fd24-ee8e-4d19-a93c-11e8d54b093a@kernel.org>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <0141fd24-ee8e-4d19-a93c-11e8d54b093a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0322.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::11) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|SN7PR12MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: 01166446-51aa-4950-a871-08dcb6e83b86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTIyVDhuYlpKNWlIMFdTNmJkbG5pbUhXRVl1OWRqWUZkZUVHVUJNTmxSSnVC?=
 =?utf-8?B?YlluYmYvYzl3YVFlbnFLdE0za1VxYXJLRHA3NHhXOTdYNExIQ2NUYXhEYnZy?=
 =?utf-8?B?RzJYS01xQkJYa0g2Y2dNclhRMmlmbFFxTHl4YmFYNnowVStBNmx6bnk2VFY4?=
 =?utf-8?B?b0N6cTVSOWIvNTZTU1JaZ1JWTzltN1ZibEV4ZG4xclZ0R0kxODNJSG83WVZV?=
 =?utf-8?B?bU9qY0NpcG1lT2g1MkpRTWcrbTQxTjFpSnhwdEhXRUlJTmV0T2tIaS9Nb25x?=
 =?utf-8?B?REhyaHdISTRrQjluZlF2MnJNYlNVL21zWUhGS2JNVGJ1NSt5OWkzSHBKbWZ1?=
 =?utf-8?B?Y2lPalB2WXhnL2laMXdZYzVSRU9zLzRkTXFRb3o3SnBoTnh2K05OVFZXOFRz?=
 =?utf-8?B?Zmc2Qkx3Zm9DeVk0WGlBY1RWai93MDFQbFlPSWhXbXVwZ0t0cDB5TURoMEM2?=
 =?utf-8?B?SExsQkRxdlgrOWdmbTBhUUtENGhiV2ZscXpGalBCWDBGaTEwMUN5U2VRK3lk?=
 =?utf-8?B?dFJZdkVza2FYeVlHTkJsNGpNWFE2R1RQbkovNWF4MG1JOUs1dVVCb0s0eGcz?=
 =?utf-8?B?bnI2QW9FSXorajFRZms2NnNEMjBGdEZIOEwxVko4ZWwwM3BpdkVFcklYMUdP?=
 =?utf-8?B?RWJLbWxDdWlmUnhoWUQ5RlNCRTVWbmhJck40M085Mk5KMHkycUF3eU90U3NW?=
 =?utf-8?B?VkcwY3FKQ09vRTRQTlZyUnhYZTJISXN2UXpIQXZpTWJwYjBiUWZOa0VpcXlM?=
 =?utf-8?B?OEZTU1NmVTZGOCtJVHdpcnpVbUJRcVBqSDdRUms1Qmt4SXVTaUU0ZkR5UE01?=
 =?utf-8?B?NkUwTm1VeXA4TmNjaEVUa05sbTBCd1FCMjdhd1FvYVJiYzdnRlllN09EVjJ3?=
 =?utf-8?B?UStSdDY1RHZKaDVoODB5TGFlWUlyOTFkaG1VdWVHeWV5SkpiNmdHSEoyM3J6?=
 =?utf-8?B?RTZ1a3RGbUp1UStpYS9xQ05SRllBUXJLSEV5bzFmbENscFFrMDJNamVmNnVU?=
 =?utf-8?B?Wmd2OGlTdnNCVmFZWnZCWWtmWTZ0SlI2aitoNTExSjFLd2hwVXZ5NGU3T1Fm?=
 =?utf-8?B?NTZYOWIzZ3J0cmNDTWE1dy96ZzZlN2sxdlcvVkxCcEJpT2I3V1lYMHZSUHYv?=
 =?utf-8?B?MEtFbjhpVlJhZDFnNVVFV1RQdUppTlhFSGNob3k0TGdYS2VxREJFRmZHTVlQ?=
 =?utf-8?B?aXBZbDIrUTBJeFhFVEVkK1o1Zk44Z003WW1aS1FSYktzWVA5dzZ6bHgxZ0o5?=
 =?utf-8?B?OTlSZ3dDbmlXb0xQOGt4Qlk1eEVCMFZoWUs4dGNvbnVnM1hiUDgxV2Nrd05q?=
 =?utf-8?B?Y1Vlc0ZFSVJLRWRxMnJuTHQ2c1Y5dWpwR25CdThsYXVvQ2N3L2dvQ3JxRmNp?=
 =?utf-8?B?c0Fvdy9WazYzb3FJTzNYbi9rZTNDODdxa3l3RnZOdGtGR01vSXFwbEdZNmNr?=
 =?utf-8?B?LzVOUWk0QmhKbG5yd3ViTS9HTTdQL25laU4rWDlaTFptMTh1WkVPbXZjL0RQ?=
 =?utf-8?B?V3F3VHdzZDRjQ28yNVR4YTJIM3pJUU13UnREb0UyZkxVdWpnN09sT2xxaHFG?=
 =?utf-8?B?dlRPK0phZitUWW5JWS9ITk9SOGZjT3owV2tMMzNFMFpJandYSXdCYlB3a0U0?=
 =?utf-8?B?MVNqeE9CM0luMWJUbXZOeUczOXZzR2FCd0ZVbGhyMWppemUzbDU5dS9kQjNw?=
 =?utf-8?B?N0RoYWQ0MUt4YXhzOW9acytXUHd4UkdWbncySlN1Z1hIVWRsT29JZlVGNis4?=
 =?utf-8?Q?3SNvSikqltnPg2O8aY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHRkQVZFWlRzS0huVTIyaFd0SFZCQ0NkazJrUldCTEFUVGp0cVF4VEtWOXJn?=
 =?utf-8?B?SmpIMFBoekNocll1YkVRc3lza2dsSkR0eU1LYjB5NFE3cmUvVkQ5aGVtejkz?=
 =?utf-8?B?UEJBM3pUZFdlRHBZZnBOeDYzYUYrbkNYVi9PbFZnOWoybytRUSsrRE9KdkRT?=
 =?utf-8?B?dDBFSXovS3g1eU9HKzQrU1hmMEREcVRWTU9PbFRtcTZwa0MwczRJM3JpbENY?=
 =?utf-8?B?NHdaTmJxREpzekpwRVMxVVFudUdwK0dzblVSVUo5UVA5a3hDQnE4Z3hZMUFt?=
 =?utf-8?B?NG9ZUi96THU3MTlmOHUvWWloenREbDNWbFNJTFFmN0tLUURhZ2ZTODJmR3Fz?=
 =?utf-8?B?NlQ3RGFLMEFkUjFMR2w0Rm9BbUx5VitWaGNTZnZMMTZOQ2RZZnQ0eUV3S1Er?=
 =?utf-8?B?T2QxckNQa0NlZnRVaVdNbWQ5QUYvL3E1Q3B4T2taVmplU3JVSFAvcWJzOUd3?=
 =?utf-8?B?Z2J6ZVFOd1REUnJNSzFQcHRCc3NuU0paS0phYzdhYlMvZVNWaWJVdzc3djcy?=
 =?utf-8?B?eUUvcnpwN2FqTk5rTVl6VVlUVHFWTk8vV2hhRTRGSi9ZZ3EzN2xRamJ1Y3Rt?=
 =?utf-8?B?NlRRUEdmSW5tbXhxOGNNRUxHMEc2Y0JLejlkWmMwUUxXUzFaUXBzMEZaQzNq?=
 =?utf-8?B?K0hSVkFrN3FNTjR6S1VWZ0o5SkJkQzF1WGRhdEpoeVNOTmJWaGQ4bnFIYzR4?=
 =?utf-8?B?am1zdFQxdGxjSmttbzdSQ0ZJRytDdmk0ODB3SEpVQ2FuamxhV1V4c00vTjV0?=
 =?utf-8?B?Wnh5Y1ZVdkxueSsvQUJDOU44Z1FGVXBxVU1MMWd3RndCNkxudytFNFRMSWVV?=
 =?utf-8?B?YUJxTndBL2pxQVZ0aDk5U3FMb1c2UFhCbHpUY3pSUlhnN2tpcUE4eHlnbHJM?=
 =?utf-8?B?RkxXa3pxeGJuQkJjdVhmcFVJTklYUWpoVFllV3pjOEpyY0tPaGR2WXE1b25Z?=
 =?utf-8?B?Yld1NHMyQmI2NHZNbS9rOUJ6TVRtS3ZhZ3dGYUxmTENBZUhjMENHOGtVSGZo?=
 =?utf-8?B?Mi9Jd0xPRWZYSjVSRXlTQXhWQ0Ezc0YycnpPdDN0ZWlhMUsvNk5ORkVFQ3p1?=
 =?utf-8?B?alAvWHNXbjRmeTg4Nmw2K00rU0FKMDUvSnREZlVTUjZuc1RjNHdwWFJSbGls?=
 =?utf-8?B?MGY1bEpkRDBQb2ZGdmFENDR5M2VsemQ4b21nT0paOUVoOVdGSEVQeW1WMDE3?=
 =?utf-8?B?MTJaZytmaXZvY2RwT29KRTdiWnRyMW81bUhpc1dKT0dheGQ4V2RKMXhEeEZY?=
 =?utf-8?B?c0pvcmZqMll0ejVjVXllOS9XM3NyQndhVlJsdXRqRldINkNNTTAzRmpJTkRB?=
 =?utf-8?B?aHNhVGFDWUhDZGpIdzZZRm82MElJaHlubUNlQnUyTk9xSmpGbmJKNWs5d1B1?=
 =?utf-8?B?VFpodmhpNXdnekF4WUxxREdPZGtVWGxWYUh6SjhXWGhOZ2dJYnZ5V0pqZElR?=
 =?utf-8?B?d3BnYUxzOWVVZ01qbWFYVnRwTFVncSs1WWlQb05wWkptNVIzZnQ1aEd3bjJR?=
 =?utf-8?B?eHV1N00xSVdxbVVQend4WjA3SiszTVdYTGt5dFcvTTFQa2pjOWVuMUNTb2Zy?=
 =?utf-8?B?b3FtL3h3dkFIMXdoazdyZ3JPbVJrVGJYSmJXLzR5dzJCY3kzSmc1anFXNDRF?=
 =?utf-8?B?eDJkRjF2SnhzRU43YWl3RXhOdXFsbll4T2NqVGdHOWtnRk85YU52NjE4S01Y?=
 =?utf-8?B?TUZiTHlwb3lPSTEwenpoaHpWL3FqQXAzK2hoRWdCSzY0TzdJd2dKNXNjbm9a?=
 =?utf-8?B?R29acElMaXJDU09HR3dpWjZhQVlMNmVvaHZMNTVPQ2Y0K0w5QTEyZnVKQ1FU?=
 =?utf-8?B?TUVMSm8xaEdueUVkTjdGa0hEQ3dQck1kQXkwWVFMdWYvSEh1YzdldkdIRlZL?=
 =?utf-8?B?eHRnam1rSW8vOEkrMXFCeFJ2d0tYMDVPSHQ3NUhwT1BrbHZCUE9mSjFjajRa?=
 =?utf-8?B?eE56dWdmTjRCUTRJeVB1T2RKUENzbmFhUm5rTFlZZjRRakg4YnhUR3FlOUdp?=
 =?utf-8?B?VXVFeCtnQ0U3bFZCclU1TEV1YXdZZ0hjVEt6RmF6NUVpNEROOHlXSnBkd2Jx?=
 =?utf-8?B?by9LZmhSdWZGWG9ZVkJzUHpHc2JiU3ZPMCthb1o1QkxDR0hGSUZqbEhXc0Zw?=
 =?utf-8?Q?gc+c=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01166446-51aa-4950-a871-08dcb6e83b86
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 13:52:52.8871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ukx56Ds/z8/5u971olObt7bEiIP7hKodAAapTn3adzXNuJkr7JOGE3RF7wK4Xocv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7154
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



On 2024-08-07 01:13, Mario Limonciello wrote:
> On 8/6/24 13:42, Sebastian Wick wrote:
>> From: Sebastian Wick <sebastian@sebastianwick.net>
>>
>> This reverts commit 63d0b87213a0ba241b3fcfba3fe7b0aed0cd1cc5.
>>
>> The panel_power_savings sysfs entry can be used to change the displayed
>> colorimetry which breaks color managed setups.
>>
>> The "do not break userspace" rule which was violated here is enough
>> reason to revert this commit.

Hi Sebastian,

The default pane_power_savings sysfs value is 0, which is ABM disabled, so it
wouldn't break colorimetry *by default*. It would break colorimetry only if set
to a non-zero value by the user, or something in userspace.

That said, this sysfs opens a door to "break" colorimetry. But if we make it
such that it can only be set in a user-aware way, then the user can decide
whether they want color accuracy, or power. I don't think that's anything new.
User already decide between setting max backlight for better color, or lower
backlight for better battery. Setting max cpu freq, or capping it. Either can be
seen as breaking.

So I think the issue is really in ppd (power profiles daemon), which afaik is
the only user of this sysfs. It sets a non-zero value by default without the
user being aware.

>>
>> The bigger problem is that this feature is part of the display chain
>> which is supposed to be controlled by KMS. This sysfs entry bypasses the
>> DRM master process and splits control to two independent processes which
>> do not know about each other. This is what caused the broken user space.
>> It also causes modesets which can be extremely confusing for the DRM
>> master process, causing unexpected timings.
>>
>> We should in general not allow anything other than KMS to control the
>> display path. If we make an exception to this rule, this must be first
>> discussed on dri-devel with all the stakeholders approving the
>> exception.
>>
>> This has not happened which is the second reason to revert this commit.

I also agree that ABM/backlight related things that affect colorimetry should be
under KMS control. However, from the way things are going, getting there will
take a while, and an interim solution is desired.

We (mostly Mario) proposed a KMS connector property to limit control to KMS as a
way to improve on the sysfs, but that needs more work with compositor folks.
After that, each compositor will need to pipe it through to users. So I think
having something like ppd provide generic support is beneficial in the interim.
It just needs to be 100% opt in.

If we decide to revert this, I think it's worth noting that ABM will be out of
reach for users for a very long while.

On the modeset thing, it's not clear to me why ABM needs a modeset, and I wonder
if it's really necessary. I'll go and find out.

Thanks,
Leo

>>
>> Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
> 
> For anyone who hasn't seen it, there has been a bunch of discussions that have 
> transpired on this topic and what to do about it on [1] as well as some other 
> linked places on that bug.
> 
> Also FWIW there was a discussion on the merits of the sysfs file on dri-devel 
> during the initial patch submission [2].
> 
> If this revert ends up going through, please also revert 
> 0887054d14ae23061e28e28747cdea7e40be9224 in the same series so the feature can 
> "at least" be accessed by the compositor and changed at runtime like the sysfs 
> file had allowed.
> 
> [1] https://gitlab.freedesktop.org/upower/power-profiles-daemon/-/issues/159
> [2] https://lore.kernel.org/dri-devel/20240202152837.7388-1-hamza.mahfooz@amd.com/
> 
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 80 -------------------
>>   1 file changed, 80 deletions(-)
>>
>> diff --git ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
>> ../drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 4d4c75173fc3..16c9051d9ccf 100644
>> --- ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ ../drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -6772,82 +6772,10 @@ int amdgpu_dm_connector_atomic_get_property(struct 
>> drm_connector *connector,
>>       return ret;
>>   }
>> -/**
>> - * DOC: panel power savings
>> - *
>> - * The display manager allows you to set your desired **panel power savings**
>> - * level (between 0-4, with 0 representing off), e.g. using the following::
>> - *
>> - *   # echo 3 > /sys/class/drm/card0-eDP-1/amdgpu/panel_power_savings
>> - *
>> - * Modifying this value can have implications on color accuracy, so tread
>> - * carefully.
>> - */
>> -
>> -static ssize_t panel_power_savings_show(struct device *device,
>> -                    struct device_attribute *attr,
>> -                    char *buf)
>> -{
>> -    struct drm_connector *connector = dev_get_drvdata(device);
>> -    struct drm_device *dev = connector->dev;
>> -    u8 val;
>> -
>> -    drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>> -    val = to_dm_connector_state(connector->state)->abm_level ==
>> -        ABM_LEVEL_IMMEDIATE_DISABLE ? 0 :
>> -        to_dm_connector_state(connector->state)->abm_level;
>> -    drm_modeset_unlock(&dev->mode_config.connection_mutex);
>> -
>> -    return sysfs_emit(buf, "%u\n", val);
>> -}
>> -
>> -static ssize_t panel_power_savings_store(struct device *device,
>> -                     struct device_attribute *attr,
>> -                     const char *buf, size_t count)
>> -{
>> -    struct drm_connector *connector = dev_get_drvdata(device);
>> -    struct drm_device *dev = connector->dev;
>> -    long val;
>> -    int ret;
>> -
>> -    ret = kstrtol(buf, 0, &val);
>> -
>> -    if (ret)
>> -        return ret;
>> -
>> -    if (val < 0 || val > 4)
>> -        return -EINVAL;
>> -
>> -    drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>> -    to_dm_connector_state(connector->state)->abm_level = val ?:
>> -        ABM_LEVEL_IMMEDIATE_DISABLE;
>> -    drm_modeset_unlock(&dev->mode_config.connection_mutex);
>> -
>> -    drm_kms_helper_hotplug_event(dev);
>> -
>> -    return count;
>> -}
>> -
>> -static DEVICE_ATTR_RW(panel_power_savings);
>> -
>> -static struct attribute *amdgpu_attrs[] = {
>> -    &dev_attr_panel_power_savings.attr,
>> -    NULL
>> -};
>> -
>> -static const struct attribute_group amdgpu_group = {
>> -    .name = "amdgpu",
>> -    .attrs = amdgpu_attrs
>> -};
>> -
>>   static void amdgpu_dm_connector_unregister(struct drm_connector *connector)
>>   {
>>       struct amdgpu_dm_connector *amdgpu_dm_connector = 
>> to_amdgpu_dm_connector(connector);
>> -    if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
>> -        amdgpu_dm_abm_level < 0)
>> -        sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
>> -
>>       drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
>>   }
>> @@ -6952,14 +6880,6 @@ amdgpu_dm_connector_late_register(struct drm_connector 
>> *connector)
>>           to_amdgpu_dm_connector(connector);
>>       int r;
>> -    if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
>> -        amdgpu_dm_abm_level < 0) {
>> -        r = sysfs_create_group(&connector->kdev->kobj,
>> -                       &amdgpu_group);
>> -        if (r)
>> -            return r;
>> -    }
>> -
>>       amdgpu_dm_register_backlight_device(amdgpu_dm_connector);
>>       if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||
> 
