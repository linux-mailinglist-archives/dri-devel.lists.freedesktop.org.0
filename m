Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5254988114
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 11:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1B510EC9A;
	Fri, 27 Sep 2024 09:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ox6KIY2s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2067.outbound.protection.outlook.com [40.107.101.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4E910EC9A;
 Fri, 27 Sep 2024 09:07:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIIXwIqHSGhE+RRrp2Wrashw3kpDDqhy5NMh9mNg5r7Zjnz5UAluBK/eExhrVEtMpuQRBgF2IpQdZMMORwf8mOlYu9ph2AWA2RF1MPY1HdLc+i9o03VdsqaeISvjGWBS/xkxICunG6iBu3SFiKlg92GHf19ZTWhX575WivmRHwOnYVd9+qtkdtB2n63//CgfsJPo9dbX3NMLSpCcOTBs1uRy7CBuECk15f0PrrX7rm2GvUqZtVSOWyrkl31u8Ffsrzacuqd4S6ycn7As+vlouLWBRDHkWXctIQNEC4+nHuo9BvAAbUK50BcWRF4k3w0jXtTkBxY1JDlABdM/kmtCsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00j7Yna9a+/LWwqgUHGNxfEhgGeMs6sThTK1dZcrH14=;
 b=V+NDd4nLWwzh6rgyhmm8T/KMFMQECEbbCDoT1A4AOiykxhIMIlTfIKXU8UTWK7I38ibf5riTXMSLcmPrZ2lo3sXB7By/xhVn04IloV/kayS2LhkiPm8ZI6tBthzoo1OkCLUiJPU/zX6BE99mJiYfSR6zuBpdLMdNhmWa0d/m9IwbBPIS3ttw7vMVqyzo2np2XQpRhrqFd8C0ZTmMkWQmohAN/rOKUfuIJ3krWW8/2pN7PkGf4scfK5Y/avMelIuBUKV3XVA3aSPkzkpFKVOIKYrCCUi/Hnwm05oVIyF+phqq5e+qS1cwdh9sY/f3xYC6NfkpNvFGTteOETPip8qFAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00j7Yna9a+/LWwqgUHGNxfEhgGeMs6sThTK1dZcrH14=;
 b=ox6KIY2s7hhJS9o6LOLlXmMCAiaFBPsYu7O6kd+eZrPhoqf3KP4ED63kwygUMLpNs/XN00LXiMlBvU/ToOqamaLPtJ1nWTow+Mp9k7l+cRktYH37jmJU6CIVVGVXZqslvsfmaiVrzL4FZxVrdr7n/kT0kz12VxK94mq996t0YRk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7482.namprd12.prod.outlook.com (2603:10b6:303:212::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 09:07:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 09:07:37 +0000
Message-ID: <33c18e28-de1d-4c1d-8dc9-4be69552dc23@amd.com>
Date: Fri, 27 Sep 2024 11:07:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] DRM_SET_CLIENT_NAME ioctl
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, tursulin@igalia.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, dmitry.osipenko@collabora.com
References: <20240927084848.263718-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240927084848.263718-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: 464b6ce2-a775-4620-542d-08dcded3d529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzBtZFlJQVJGcG5USENFZHIybTJWQ2pIcVlGU054SlZkL1ZVNy9SazloYmFa?=
 =?utf-8?B?SkY1aDNocGFqL3oyNGR5WWx6YkliN2ExdUtmeUp3amYrMjZ0ZVE0VklaMUlK?=
 =?utf-8?B?T0VLWGg3OGdpNURkWVJwVlFzUm5uZTZMRFAwbjBVUG1pUTlqL0wrc0xNQjcv?=
 =?utf-8?B?UElEd1QzOXVPNW1JSmRWckx6ZGNFUHF4RkU5V2tVSElSVEpRcjZLTE12NUNB?=
 =?utf-8?B?TFhqYnpKYzU1NVNIcUJheUJuZGN6aXFETXJhb3UyQlEyU0xMMVdEWS9UVHgy?=
 =?utf-8?B?bVZjQXd3eFVZeGFUSy9CeWJOT3RIczF0RDQyc09KQXJpT2lhc3IwZGw4bW5G?=
 =?utf-8?B?d3NqUFJwM3JsaFRPOXVSaWVIeFZpdHBlOXN2eEdwbm1mVjM5VU1JMnk1WnMy?=
 =?utf-8?B?UFZ3MFdnWGRpcWpnWlhrWEVCR1IzK1ZRSS83eHo0aDZpVlpJL3V1Rkp3MkFY?=
 =?utf-8?B?QWlCNTdpUXVOSG5lQ0V0NFRROTYyUmYrQnVkVmtyVDRNRjNEY2FwMlZweWRn?=
 =?utf-8?B?RlJyWVRrYVMydXZ3SmhCTmpmdk1SUjBmejBTdkZjU1ZXdXdEVjZkNGlOcWti?=
 =?utf-8?B?Z0UzVzJBSWtoTXFsRFpQWVQ0OVhUYndiRWIySkpuSklOcG5QMjV2cTlMWHRx?=
 =?utf-8?B?T2dibndQUmk3WWlsYzgrTWlTUUk4bnU4czNvNy9VNVZwZklvZlBqUm85eXZM?=
 =?utf-8?B?OHRrZ3ExM0VLV3U2R2ZOV0p1UHo4Ukd5WDZ3V1NOalBwSGtIU0g5Mmdjc3ky?=
 =?utf-8?B?SUNDR1I3VFp5bHI4L2k4MjZHa1lMRVNKMGlrYjNwTncwWWF2N2FEc0tyUEUv?=
 =?utf-8?B?b2hxejV1c0NJWHBlYWpxczBkVlBBc2txV1oyckMwREtLR1JqZUczeU5tK3dj?=
 =?utf-8?B?cDNDUkVIYS9kOGkxdS9oL1ZDemFWZ2tYcFl5cVdTNXBKbnllL2MxdUI1OHh6?=
 =?utf-8?B?VGxENTNFUndHMCtEQTBncU5lK00wNXpiaGxDZ3Y4TXNWY2U1bWdjVEJVeU16?=
 =?utf-8?B?STU0SldRMDhTWFd3TDNOYTlDUkVhemw0V1RhVDRIdEFTMVBQVjMwYVJzOWxn?=
 =?utf-8?B?MmE1UzRhQ0RBRytrSVN6c3BoMVp3MHV4OGN2N0l0QWg3Y3Uwekl4Z1Q3TWc3?=
 =?utf-8?B?a1J1VVRFYS94MjlIZ2dDNndPaTFudUY1ZGZCQUlVQmd6S0R3bjFNY1M3Qkxa?=
 =?utf-8?B?QWdjS1pvTTVySHA4UHI5aGpiNVU0WU9GVTUrTnkxbmtuMUJ6NVNYaHgzcWdz?=
 =?utf-8?B?T25GSUkyb2ZkUFJFeFlmU1VlMzBsWWRIb096WmNIdTFIekxaV3BEYXBpcmVS?=
 =?utf-8?B?SGorU3ArdHUrdm1mcmVubXZ3Z2RkRXI4aFZyQm40WmlpbjJPN1RQMDZTOXdP?=
 =?utf-8?B?YzcwYlNZNUR1U3lFamsxbko2NkFsWlJ2RHJlODN1MndyV2FyZzhsWXNJYmZI?=
 =?utf-8?B?bVU0U2tEMHFPTVZwcThPZGZyQ3paQWRJTlErYXg4KzRUMUlER3UreFV4Kyt3?=
 =?utf-8?B?Nk4zNnFmVHRFY3RUZUFvRWhaRS9OazlESkdTNHpkUTJKTitnb2VPa0kxaUEy?=
 =?utf-8?B?RUxBYlRtaU1RWXlrTzZXenhmZUVvYWVGUGIyN0QydUZzc1QxUkNBekFlVHlQ?=
 =?utf-8?Q?lmvfeTubmBH5bPGn9tfqyHOVY4QGIRYZ0ExjinhEf9X0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWFDNW5nMVN1Mkw3czQwMTZjNitEb3ZPVDROY25VcWl1c0VLL2M2U1dTc05s?=
 =?utf-8?B?bkJDcXRoVUpBbmY5aGhQZ1pLVFhEMHBlK2luWWR3OE5WNUM0T2dqcDhpYktG?=
 =?utf-8?B?RGR4cGlrTkpETUxPOW9MWjAxTW9GdCtFamluN3ByY0Q1YjZRZXBNdGNvZE0z?=
 =?utf-8?B?Y2YxZkNEWGdWQmRCc3lST2gvbHhVL3FWMlhoMllVYWtRcGZFb1N2d3laNVpX?=
 =?utf-8?B?OWg1VHlBMU9uSm9RNVl0S1g4cldwci9rNzZ0RGVrZTJJTk9mdmJ0eno2cFlV?=
 =?utf-8?B?bVZkNGdSU0VLR0lYUlFWSk1ROTVlbGh2RW9WQTZrUGJhN21JN1V2azlIb0xW?=
 =?utf-8?B?VU9SQk5TTGFVYVpMR3FGM3pveE1KSWw2YmRteDlEKzVZWjhEZVZSNENhajYr?=
 =?utf-8?B?a2xyWlZhM3RwZ1E1cktJY0t3SXNnRGdabk5FYm5ZQlRQcDY1bEJZZ2hlTXZ6?=
 =?utf-8?B?alB6ZS93UEo5UTNMNSs2RUN4UEh2dXMvTGxUZmh0eEVQdU9QSDVEY04xeTlp?=
 =?utf-8?B?M0h4ZGFQai82WEdlTWJvYUVUT29SS1p2ZG5SQ2t0NThBK2VINHNqWUMybURz?=
 =?utf-8?B?UFExdm9ESTdUbmpYdzkvN1RlTmF4THQ2a2p5aDVGOFI1Y1B1a0QwdkkzU1dX?=
 =?utf-8?B?dzlCQkRvdVlXT09xWkE3STFkT0F3MUtpUjFTY2dtZjhoc2Q5aW5QWVh1eU9m?=
 =?utf-8?B?dmFleTlRYVNodit6Z2N2Y1pDcDdPSzB4aU9xRlhKYWs1K0FpL0pnYmdjMGE1?=
 =?utf-8?B?MWRZUHYxK3ozQXpSL29HUVhmMEhrdGMyeTZLL3dYbFRtbE9UOHQxT2F6WkRE?=
 =?utf-8?B?a3MwYVMvS2c3VGFXQU1sMFRzUVl5Q1JHSmdYdlVRK2Z1UW1IamRCUWYrM2lk?=
 =?utf-8?B?MERPZTduTHE3Kzd5Z0RmOWExQTdSd0lBRFNOQkZWUW1tQmh0MnBoODEzaGJD?=
 =?utf-8?B?aC9COC9aS3pnd2NRaUNhYnVZdStJcW9lVXVmb3Z1L1h6WWRXUllrRkl0ZGV0?=
 =?utf-8?B?eHdLVGh6OWVkSmlxS0Y4d0szQVpCU216eWxGcHhwM1pNaTEyNUswS1lwdVNX?=
 =?utf-8?B?VC9yQ2RIeEFaZUNpYlJkdC95MmdzZlZsNEtXUmtwZ1hlVmxQclNOaWtiMHdy?=
 =?utf-8?B?VUZGNTNIazdLS2JxY3ZBdFJLemR0TzBORDFBT3ZkdHVoS0lxazNHaENoc0Zl?=
 =?utf-8?B?RHhRRjYvZEJxQVYvRzRWbHRpNXpYRENYaGNsT0gyNE5zTzEzbVN6SHRDNzZm?=
 =?utf-8?B?YlVmbVhaZzM0SXFtWnRTMFRkM2cxSDRqekExeVBoNFE2WTNZdE52Vkc1RnhR?=
 =?utf-8?B?QTJhSzRtcFgxaG9oTmw2U3M0NFNGNEFyUndPTXFHV0pMaFhMaVlKdUEyUDRF?=
 =?utf-8?B?M1VoYjB1VU5QVFpYYnRoQ0NDY3QwY2xnem9Zcy9rdGQrNS93YjZjSDlLV2Zu?=
 =?utf-8?B?dUZKMXFBbUg1MVUzbTA3MW9vVkoxSS81MnM1dTg0dmh5eVBkWEFheDZxV1Rw?=
 =?utf-8?B?Zmx6elRJSGUrdEJSdnI2Zno5S24zWXRhY05CREN0bXU5OGxNV253T29OaEc2?=
 =?utf-8?B?VW1PcERBdVRhWklka1liVDJRVEJsVGFmOXhZbzBWQXJiVU5KclMzV2FtajNV?=
 =?utf-8?B?c0hobU83ZUwrbzlLaVZ1clZFR0hUY3lpaE82TExSRmtuWTUrRkhWS0RjdkNI?=
 =?utf-8?B?ZG1BQWRKTmwwYld1elUzci8vWG4rRmZzTjBwQUViSldpZlV0SnJ6S2lQdytt?=
 =?utf-8?B?OWZmL2hFLzNvYjZKQXJDczMwMkFwRFJ2WlhlcVpTSDBhcTZNTWNtaHpPNENa?=
 =?utf-8?B?bDRVcHQzR1hxcTJhVEdoL0YyTnRPcDRuNVZRblhqZXhiVmtzMDVabjFqQXlw?=
 =?utf-8?B?S2NITENTVEZmUjJpbWd1dG1WaG5SQ2FOaXJjT1ZRZTZvR1NwM3VmL2dSYzFC?=
 =?utf-8?B?Zm5zdFErZk1KQ2R3eEh1ZFo3QWd5ZEhFa1hMTE1ReGlLbnErcFpGTVdUU055?=
 =?utf-8?B?WkJmRjJoYjhpYkdGOWhjaEZDT3pyYWF6aVRlTnYvSjllcWxtQ3JHTWw4aUsy?=
 =?utf-8?B?Ky9sZEkvSzF2SjJQWTEwYjV1ZXVLcFB3VkM5OWtGU2gwVUU0VzR2STRWOUsw?=
 =?utf-8?Q?naGI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 464b6ce2-a775-4620-542d-08dcded3d529
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 09:07:37.6427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5B1BheTwPp3jg4vqKLqqoNMTfSGgjmtyCf2SMslpnCV6qbhjLUydxizat3yZNrh9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7482
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

Am 27.09.24 um 10:48 schrieb Pierre-Eric Pelloux-Prayer:
> v4 changelog:
> * DRM_SET_NAME -> DRM_SET_CLIENT_NAME (Dmitry)
> * reject names that would mess up with formatting (Sima),
>    and use a stricter filter (isgraph allowed extended ASCII
>    which weren't looking great)
> * documentation edits, minor fixups (Dmitry, Trvtko)
> * clarified commit message of commit 3/6 (Trvtko)
> * reworked amdgpu_vm_set_task_info a bit in 4/6 (Trvtko)

If nobody has any more additional comments on this I'm going to pick it 
up and merge it through drm-misc-next by the end of today.

Regards,
Christian

>
> v3: https://lists.freedesktop.org/archives/dri-devel/2024-September/470488.html
>
> Pierre-Eric Pelloux-Prayer (6):
>    drm: add DRM_SET_CLIENT_NAME ioctl
>    drm: use drm_file client_name in fdinfo
>    drm/amdgpu: delay the use of amdgpu_vm_set_task_info
>    drm/amdgpu: alloc and init vm::task_info from first submit
>    drm/amdgpu: make process_name a flexible array
>    drm/amdgpu: use drm_file::name in task_info::process_desc
>
>   Documentation/gpu/drm-usage-stats.rst         |  5 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  1 +
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  6 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  2 +-
>   .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 62 +++++++++++++------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  4 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        |  2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c        |  2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c        |  2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c         |  2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         |  2 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  2 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_events.c       |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  3 +
>   drivers/gpu/drm/drm_debugfs.c                 | 14 +++--
>   drivers/gpu/drm/drm_file.c                    | 10 +++
>   drivers/gpu/drm/drm_ioctl.c                   | 55 ++++++++++++++++
>   include/drm/drm_file.h                        |  9 +++
>   include/uapi/drm/drm.h                        | 17 +++++
>   23 files changed, 171 insertions(+), 42 deletions(-)
>

