Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE54927596
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 13:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCEB10EAAC;
	Thu,  4 Jul 2024 11:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3hd5Gtpw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2084.outbound.protection.outlook.com [40.107.102.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2732B10EAA9;
 Thu,  4 Jul 2024 11:57:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxS/YNXqKoRTERE8nwgvnI0WI90K9jWV1OCk5px8+TjiRIfGTMzgrFDOlClKXU5vzXHvFS21487OgSKMdp8Ct6brej1tkKlVEf8fG58yMKPEnbU7CQEPgvVjaPgEWxGsSvESaP92PIQmYiRdJoCOnxSV5wk1GOKvATNW8YhxoALEfcmuUSz9xK8ptMReVoHNTMjimYU3YzAUvnR8938+msjkOgIiZuYUmS5+5b3LH45tYawcELtraeHp/Wb6NVjpI85kjzsj7yX4gryfxfrrjzqVw8XksKvahRksQDdlDjXmOcmTzHVJGdx3ztg8kkFlvVtjO8qygQDEdMgyybw84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Us0HqI8ddvso9knNAHqKAyyB61gD/la4ywUSZKGBz7o=;
 b=Hl01d9x/RsR4SfHdbh9/FBp8V3bOTV2VwyFLjsJmRJTjbbVvhYd/Q9eHUAYgUYbZuStkm7n815ib1A11p+5a3EJKSiy9MgQv3+t/HqJrmuZd7Ic2pc/4r8Woj2F94rmYA60RCCHPf5ypdeORBJ/Q8PtRbribO6zB5hG0RMIFE50fLCkKBpwvOUvFuTImQxeh6htCnYY1ExVkpp3ntCCep+JtAXGCOhZOV9X2KTZykQSCFyQFTK1XpPO5qrQZkeYXGjF7QBSPG1ca/WpHctTAatHkxOFQgUTp17wsovJhfQDjOiJZoyV8cx7YIrX8uPqXeoIpEJJ1xVqJI1dKLopIgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Us0HqI8ddvso9knNAHqKAyyB61gD/la4ywUSZKGBz7o=;
 b=3hd5GtpwTw1uhn/1lCfTB7XQ1ZKg+DCHSJ2cjS13Wk/jCMZRLFlXXfm5v/+lzMEiWjD5hNE/iJhxX48MF6b+i2RUAAyuhpvrXF9+PF5sWiZDvw+diDcTDyisoonIlgsdMvHJKlAVaTjhk/Lc8jem3r79AmUMEqnH0QVRL+pE/is=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8805.namprd12.prod.outlook.com (2603:10b6:a03:4d0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.30; Thu, 4 Jul
 2024 11:57:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 11:57:20 +0000
Message-ID: <7090d13a-f40b-4cf8-b536-7e8d4a2d7168@amd.com>
Date: Thu, 4 Jul 2024 13:57:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/12] drm/ttm: Add a virtual base class for graphics
 memory backup
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-9-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240703153813.182001-9-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8805:EE_
X-MS-Office365-Filtering-Correlation-Id: 29758e44-358c-4db0-5f10-08dc9c20753d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnBHVTNabWdvOWZiZ1oySjEzUTloajJPd0pFWXFuYW1pL0txZnhvYkluZnd2?=
 =?utf-8?B?QkM1YSttYVhWWmpyN3VROGxoWThNMTEvYU9wSHUwYWhzanVRUkpvWGVtdVFL?=
 =?utf-8?B?T1daWWxic3pFZnQyWjdtQk1HZnFVRG1IbDlndVpsR3dueHkxNWRJSDdLUDBB?=
 =?utf-8?B?aWNXQTM2eEQvMVBXV0U1RjN6ZDRXZXc0cTZQbFA0enkwajZENy90L2tHME1t?=
 =?utf-8?B?UmRhYlZvdldZaFNGMjZrdE5RK1NWTVpMMjdvekhmaS8zT3JNcmFvS2dMbllN?=
 =?utf-8?B?Q0FWR2x6eDRPaHROQmVFZGJQK3pkd2Z2TDQ2RDlUYXpSeExQNWllSmJPNGJa?=
 =?utf-8?B?NDUvQXpDSG5kY215Q0xxOU02V1NTc3RWNWRkM043Ryt4Ym9EUU9LOWx2aHRS?=
 =?utf-8?B?UllMaUZKRk4rUXYzZks3eUJBTmg0MGRtOXM1Y2ZjVEMzQ1p6UEEzMnJWdWFF?=
 =?utf-8?B?NkxJWEpPS3p3d2lCZHBReVF5THc0bkNPb2UwbEpYNVNvOUxvWHpQbVpRbUcy?=
 =?utf-8?B?enVVTGNXZ1JaL2QramdTNDBVN1dsZFNqS0NDL2NtZjMvUHZQKzJIQ1ErczZa?=
 =?utf-8?B?cndWeTVCeVEwNk8zY1ZWS2R6Z25BNzM0b243b2xucGhCeSsyS3dMTlBpcERn?=
 =?utf-8?B?bjViNWlFTFV2ZHp0V2tSdyswd01abmxKeExCOXBTaGlKUVJmUmdWQTFteXV2?=
 =?utf-8?B?enBoM01OQ1JKYjNVUkdtSEFHdlNiSkdSRlVSQ1QzM01CWnFvWDJSbHNvaXJB?=
 =?utf-8?B?TjYwMzNJZjBudzJ3d0JvTExQZGRXTmNPcmx4WkJrd3hydFYxT25LOHN3Tjdk?=
 =?utf-8?B?Z2hoWmdhOVAwSnQ3MWU0WlhKLzJLSkcrQkVMdUVIZWVoU2dTTll0Q255cGtx?=
 =?utf-8?B?bk1xcnpYZENsVlRmTW91WDE0MGx6dGRjUGxLVTY0ck1TbGh2K1k0UURmc044?=
 =?utf-8?B?WDd3QlMvTFVmV0czM3ExTGt0N3pRUHVuN0FJTGJCQXdOaklKRFJXa0EyZnNj?=
 =?utf-8?B?Vll3TEpFNGI1SG9aemtjdXdxb0pkTnMrOUsrUTJMT0NxTmpHNTM1QXhDMXA1?=
 =?utf-8?B?bnV6cjBiekF0OVBOOFRkeHlaNVd4V2VoeUszeWFUUEkyTVJrMUd3TTNwYjhj?=
 =?utf-8?B?VmRrT255WkxKUG15TmNPb1pLMngwL3NlbGJDalpVUlhVMDVkMDY1SHF5d1A3?=
 =?utf-8?B?OUhFM2pYNXUydUVnd244SlVBL0Y4YlNDekhZMXpMU2xuWUhUcTlKL1IxWUJj?=
 =?utf-8?B?ckVxVHlLUHJEVkFsM05ybVFxY2V4eUF5akgrdVJrVnc4bGExeWxsYTRwdUY4?=
 =?utf-8?B?V21ReTg5UWxZdVZMekV1Q2REZEpPL20yWER5eFppT1M3Sy9iRG5zbmc3VW5o?=
 =?utf-8?B?M3hEZFRMUGdyWm53d3hTSkdsbXRQVjRETFNTMWpvNEhwL2xiVmpweklJamFG?=
 =?utf-8?B?UDlLY3Z5UU1UVmFIS1dMcmdNMnJ3VmhvV1BvWjE0ZW56TDRZSXRQUXNxTW5L?=
 =?utf-8?B?ZGpGcllGbnhRY3pTMUU5WlNGQlB3bjZLOWtZUFhXNWVkbnJ6RWtjTzAwV09O?=
 =?utf-8?B?ZlJXTFBYZ3pwNWNtNW5QN2dMVnNWTjRLbE1qTGtaTjZ1SVo1Tm9ycURUazh5?=
 =?utf-8?B?QXN6b1p3cjFJNUZpZ2hxY2JpTit0K1FHaXlhNTYxUDZTZjZGTVBUTFppb25a?=
 =?utf-8?B?d25pTFRQVzNKRUVNY3k3QXh3U1Y3M2IwcHRuK2hYSm5YRXorWHp1T3hnRlNv?=
 =?utf-8?B?dGdnYTZFcXVLWnFnaG9zd2ZtV0lSUzlJQk5lUEtoNWZRT1QxbXBhamJIWStC?=
 =?utf-8?B?cmlRellhL3NGTDRZVHRhUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEhVSDlxM0NaOHZvWGpLZVd2dy9pVHNTQjZReTFLdWErbzJUYkU4TEg3aXNq?=
 =?utf-8?B?Mm92d1FNcG5EWVA0d3g0ZlpUZ2RkV0hacDVpS0JyRHNScjNhbkJiLzc4anVa?=
 =?utf-8?B?OHhUN3FxWTNHZGNQcGlheitVQXhpdUNuSWdhcUZKMXdDUW5wUm5vMnA0eXlr?=
 =?utf-8?B?NUlxQWN3VHBQeFhSblY2alBqTXFMSHczTDdDYUxLbXhZOE9ITk9VQStncEZy?=
 =?utf-8?B?czJ5ZU5QQmlsOG4wLzJnTkR2Z2NkaTlqQlZGTS9ocVhESlJoODl0am12MXBX?=
 =?utf-8?B?LzQ4ZFg2L3NDTVdzZWg2SVh3MWJHdFVCSEVuSWNsS1VPVi9aZFBIVHg2STNk?=
 =?utf-8?B?cDZSMDAzVmxObmEyK09lZmQ2aHM4NWFxNHZEVWhrYnNhMkJqc2R1YmQ5VjZT?=
 =?utf-8?B?NTAyNU81MmNmR0Z5MlNxWllTMTFzblFhNEhVWGw4WHZGdTdLaEwrVWRvTXMz?=
 =?utf-8?B?M1FCa0VHekQzY29ZVTlzRTFQM3BSY3VKL2xsQTR3bGU1SSt2VTY0M2xJTWhu?=
 =?utf-8?B?RjR5bDVUQk9ZSkR1WUhpYmoyMkd3UC9SYWpLN01xcnA1V1hhR3F1K01YbjIr?=
 =?utf-8?B?ck8ybFBNUTRlUE96OWRZa0NMVGlmMWgwdEltUnRPYlNMK2dGSWNFUzZnZ2p1?=
 =?utf-8?B?c3JUVUFjQlJRTVhLb2hwYXlKM0loc00wb0NUUVA4NDdBQkh4aUQxY2syMHZs?=
 =?utf-8?B?ZjRoOXFpaU9Qa2tPOXN4TjVXaTBCRndoREpxMTVxL0ZscWFmbmNYMW52eTlP?=
 =?utf-8?B?am9oNDZqUnhWbm50UkdLV2ttTFRoSXBtV3p1Wm9CWFdPbzZ5dzNnWlJoVit4?=
 =?utf-8?B?RFJNNWM1TzJvQkFzemYxK1RrSWp6c3NhVmtTeGpqdktzdzZaYVhISktybmh1?=
 =?utf-8?B?U1JEYWVHRExtOWNKa0E5SUlnQjAzVTEvWjBQYzR6TFRtTlViRUZRTnQ4TU1q?=
 =?utf-8?B?R1daRzliY1NtNXFCWGQ5NzZySVA4Ri9vNkpBUWJWOEM0YUk1UE54WUoycE5W?=
 =?utf-8?B?U29sdlFDNHNDUUVxNU1MZkJqb21McDV0RUxyY3FsVmRyTkd5MzcyTWdlaHJw?=
 =?utf-8?B?Z29lRlMzdDlvZ0E3S3grR0UydmZuVEFyVmpibEhPYnJTc09YdHF2S3BSRnpS?=
 =?utf-8?B?TDAwcGgzY1hVcjhxanV5SmlZeXJ1RmlheW9PVlhrWUNFUmhkd2FWU2lXcEdL?=
 =?utf-8?B?by9wV09SQnU2RytjZ0QwbTFUL1NyWGRRM00vT0dEMFd1NEpmQS9uaDZiczg2?=
 =?utf-8?B?aDUwa3FMS3BwVmM5Y2dtUmpUcjY4MS9OR2NhRDlPdmtqSnN6SzB5WG96Zmlz?=
 =?utf-8?B?dEVGRkVXYTk0UCs4aXR6UjIySVlQZjRabmdsN25sYWUvbkR2aUNFa1N5V3lC?=
 =?utf-8?B?QXVGcFpoVkYvQ3pIMHJNWHRwbjFSOVc5cUZNYzRqVndoNVhKNkhrZlhqQVBT?=
 =?utf-8?B?eHZzTlJrRU00S1FiK0xCZzZRN0UvOUtGVTFoOVRFd2Q4S1g4NmtYNTBWeVNU?=
 =?utf-8?B?RzZGQWpWSWNUK1FXME1lZDlueTVBRkRqTE04cE8zMzQzNzV0b3hLdjNRRWI0?=
 =?utf-8?B?L0NuVXVBVjdldC9oSEJQck1MeUc5a2svNkljeTRXSnh1cEdycDRZNkd5VFRZ?=
 =?utf-8?B?ZmI5VWxmL3V5OEI1OG1pem1WQVp6QjVHTkRzQXVtNHIxakR1NTJVcFk4SzJu?=
 =?utf-8?B?U2N3OHArR0NTTUdnMHFEZUpMNlZIT0xoaTFTUVA0b2ttRERVWkxkMllwMDJh?=
 =?utf-8?B?V3JEb2xDZEZuYkl1b3pYTXlJbGtLSWhqZHh4OGFNODVtK3ZwTlNPS050US8r?=
 =?utf-8?B?SzVmQXhMNFFNRG1sTmdHYkhzVE9KRG1NNlBWWXREbHJmYWJFM1A2Zzl2Q1NG?=
 =?utf-8?B?UnVVNnNXYURHbnhqZ0U5WStTWWJ6Z3o3anVEVTJuTmF6bGdqYVJpMFNWdUJI?=
 =?utf-8?B?dGtDSmtlWWw0Z3J2dmQ2SjZCUCt6eDhGRVZFVUtQaHRUZzhlaGp2aVNZa2ZQ?=
 =?utf-8?B?RktFdGxIWjFKTHI0UHFtOE9hT3dCNXV4Q1J5RGRxdFIzK1pOcy80VDBzZXhS?=
 =?utf-8?B?MVpndkxwYWVTL2Q3MWtuNUZGZi9wM3A5Zzl1LzA1OEN5R0tmSFRoTjhCc2lX?=
 =?utf-8?Q?2blba6wm6NWhF+MdQFd8CHHIb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29758e44-358c-4db0-5f10-08dc9c20753d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 11:57:20.2387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGD/wN12W2WJw8GzArREburCyjPBOUELbzq+J+uSbwFzzJp5P1W7NKAwnVIg8a36
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8805
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

Am 03.07.24 um 17:38 schrieb Thomas Hellström:
> Initially intended for experimenting with different backup
> solutions (shmem vs direct swap cache insertion), abstract
> the backup destination using a virtual base class.
>
> Also provide a sample implementation for shmem.

Let's postpone this and all following patches and merge the LRU changes 
first.

Christian.

>
> While when settling on a preferred backup solution, one could
> perhaps skip the abstraction, this functionality may actually
> come in handy for configurable dedicated graphics memory
> backup to fast nvme files or similar, whithout affecting
> swap-space. Could indeed be useful for VRAM backup on S4 and
> other cases.
>
> v5:
> - Fix a UAF. (kernel test robot, Dan Carptenter)
> v6:
> - Rename ttm_backup_shmem_copy_page() function argument
>    (Matthew Brost)
> - Add some missing documentation
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/ttm/Makefile           |   2 +-
>   drivers/gpu/drm/ttm/ttm_backup_shmem.c | 139 +++++++++++++++++++++++++
>   include/drm/ttm/ttm_backup.h           | 137 ++++++++++++++++++++++++
>   3 files changed, 277 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
>   create mode 100644 include/drm/ttm/ttm_backup.h
>
> diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
> index dad298127226..5e980dd90e41 100644
> --- a/drivers/gpu/drm/ttm/Makefile
> +++ b/drivers/gpu/drm/ttm/Makefile
> @@ -4,7 +4,7 @@
>   
>   ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
>   	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
> -	ttm_device.o ttm_sys_manager.o
> +	ttm_device.o ttm_sys_manager.o ttm_backup_shmem.o
>   ttm-$(CONFIG_AGP) += ttm_agp_backend.o
>   
>   obj-$(CONFIG_DRM_TTM) += ttm.o
> diff --git a/drivers/gpu/drm/ttm/ttm_backup_shmem.c b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
> new file mode 100644
> index 000000000000..3d23a34d9f34
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <drm/ttm/ttm_backup.h>
> +#include <linux/page-flags.h>
> +
> +/**
> + * struct ttm_backup_shmem - A shmem based ttm_backup subclass.
> + * @backup: The base struct ttm_backup
> + * @filp: The associated shmem object
> + */
> +struct ttm_backup_shmem {
> +	struct ttm_backup backup;
> +	struct file *filp;
> +};
> +
> +static struct ttm_backup_shmem *to_backup_shmem(struct ttm_backup *backup)
> +{
> +	return container_of(backup, struct ttm_backup_shmem, backup);
> +}
> +
> +static void ttm_backup_shmem_drop(struct ttm_backup *backup, unsigned long handle)
> +{
> +	handle -= 1;
> +	shmem_truncate_range(file_inode(to_backup_shmem(backup)->filp), handle,
> +			     handle + 1);
> +}
> +
> +static int ttm_backup_shmem_copy_page(struct ttm_backup *backup, struct page *dst,
> +				      unsigned long handle, bool intr)
> +{
> +	struct file *filp = to_backup_shmem(backup)->filp;
> +	struct address_space *mapping = filp->f_mapping;
> +	struct folio *from_folio;
> +
> +	handle -= 1;
> +	from_folio = shmem_read_folio(mapping, handle);
> +	if (IS_ERR(from_folio))
> +		return PTR_ERR(from_folio);
> +
> +	/* Note: Use drm_memcpy_from_wc? */
> +	copy_highpage(dst, folio_file_page(from_folio, handle));
> +	folio_put(from_folio);
> +
> +	return 0;
> +}
> +
> +static unsigned long
> +ttm_backup_shmem_backup_page(struct ttm_backup *backup, struct page *page,
> +			     bool writeback, pgoff_t i, gfp_t page_gfp,
> +			     gfp_t alloc_gfp)
> +{
> +	struct file *filp = to_backup_shmem(backup)->filp;
> +	struct address_space *mapping = filp->f_mapping;
> +	unsigned long handle = 0;
> +	struct folio *to_folio;
> +	int ret;
> +
> +	to_folio = shmem_read_folio_gfp(mapping, i, alloc_gfp);
> +	if (IS_ERR(to_folio))
> +		return handle;
> +
> +	folio_mark_accessed(to_folio);
> +	folio_lock(to_folio);
> +	folio_mark_dirty(to_folio);
> +	copy_highpage(folio_file_page(to_folio, i), page);
> +	handle = i + 1;
> +
> +	if (writeback && !folio_mapped(to_folio) && folio_clear_dirty_for_io(to_folio)) {
> +		struct writeback_control wbc = {
> +			.sync_mode = WB_SYNC_NONE,
> +			.nr_to_write = SWAP_CLUSTER_MAX,
> +			.range_start = 0,
> +			.range_end = LLONG_MAX,
> +			.for_reclaim = 1,
> +		};
> +		folio_set_reclaim(to_folio);
> +		ret = mapping->a_ops->writepage(folio_page(to_folio, 0), &wbc);
> +		if (!folio_test_writeback(to_folio))
> +			folio_clear_reclaim(to_folio);
> +		/* If writepage succeeds, it unlocks the folio */
> +		if (ret)
> +			folio_unlock(to_folio);
> +	} else {
> +		folio_unlock(to_folio);
> +	}
> +
> +	folio_put(to_folio);
> +
> +	return handle;
> +}
> +
> +static void ttm_backup_shmem_fini(struct ttm_backup *backup)
> +{
> +	struct ttm_backup_shmem *sbackup = to_backup_shmem(backup);
> +
> +	fput(sbackup->filp);
> +	kfree(sbackup);
> +}
> +
> +static const struct ttm_backup_ops ttm_backup_shmem_ops = {
> +	.drop = ttm_backup_shmem_drop,
> +	.copy_backed_up_page = ttm_backup_shmem_copy_page,
> +	.backup_page = ttm_backup_shmem_backup_page,
> +	.fini = ttm_backup_shmem_fini,
> +};
> +
> +/**
> + * ttm_backup_shmem_create() - Create a shmem-based struct backup.
> + * @size: The maximum size (in bytes) to back up.
> + *
> + * Create a backup utilizing shmem objects.
> + *
> + * Return: A pointer to a struct ttm_backup on success,
> + * an error pointer on error.
> + */
> +struct ttm_backup *ttm_backup_shmem_create(loff_t size)
> +{
> +	struct ttm_backup_shmem *sbackup =
> +		kzalloc(sizeof(*sbackup), GFP_KERNEL | __GFP_ACCOUNT);
> +	struct file *filp;
> +
> +	if (!sbackup)
> +		return ERR_PTR(-ENOMEM);
> +
> +	filp = shmem_file_setup("ttm shmem backup", size, 0);
> +	if (IS_ERR(filp)) {
> +		kfree(sbackup);
> +		return ERR_CAST(filp);
> +	}
> +
> +	sbackup->filp = filp;
> +	sbackup->backup.ops = &ttm_backup_shmem_ops;
> +
> +	return &sbackup->backup;
> +}
> +EXPORT_SYMBOL_GPL(ttm_backup_shmem_create);
> diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
> new file mode 100644
> index 000000000000..5f8c7d3069ef
> --- /dev/null
> +++ b/include/drm/ttm/ttm_backup.h
> @@ -0,0 +1,137 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _TTM_BACKUP_H_
> +#define _TTM_BACKUP_H_
> +
> +#include <linux/mm_types.h>
> +#include <linux/shmem_fs.h>
> +
> +struct ttm_backup;
> +
> +/**
> + * ttm_backup_handle_to_page_ptr() - Convert handle to struct page pointer
> + * @handle: The handle to convert.
> + *
> + * Converts an opaque handle received from the
> + * struct ttm_backoup_ops::backup_page() function to an (invalid)
> + * struct page pointer suitable for a struct page array.
> + *
> + * Return: An (invalid) struct page pointer.
> + */
> +static inline struct page *
> +ttm_backup_handle_to_page_ptr(unsigned long handle)
> +{
> +	return (struct page *)(handle << 1 | 1);
> +}
> +
> +/**
> + * ttm_backup_page_ptr_is_handle() - Whether a struct page pointer is a handle
> + * @page: The struct page pointer to check.
> + *
> + * Return: true if the struct page pointer is a handld returned from
> + * ttm_backup_handle_to_page_ptr(). False otherwise.
> + */
> +static inline bool ttm_backup_page_ptr_is_handle(const struct page *page)
> +{
> +	return (unsigned long)page & 1;
> +}
> +
> +/**
> + * ttm_backup_page_ptr_to_handle() - Convert a struct page pointer to a handle
> + * @page: The struct page pointer to convert
> + *
> + * Return: The handle that was previously used in
> + * ttm_backup_handle_to_page_ptr() to obtain a struct page pointer, suitable
> + * for use as argument in the struct ttm_backup_ops drop() or
> + * copy_backed_up_page() functions.
> + */
> +static inline unsigned long
> +ttm_backup_page_ptr_to_handle(const struct page *page)
> +{
> +	WARN_ON(!ttm_backup_page_ptr_is_handle(page));
> +	return (unsigned long)page >> 1;
> +}
> +
> +/** struct ttm_backup_ops - A struct ttm_backup backend operations */
> +struct ttm_backup_ops {
> +	/**
> +	 * drop - release memory associated with a handle
> +	 * @backup: The struct backup pointer used to obtain the handle
> +	 * @handle: The handle obtained from the @backup_page function.
> +	 */
> +	void (*drop)(struct ttm_backup *backup, unsigned long handle);
> +
> +	/**
> +	 * copy_backed_up_page - Copy the contents of a previously backed
> +	 * up page
> +	 * @backup: The struct backup pointer used to back up the page.
> +	 * @dst: The struct page to copy into.
> +	 * @handle: The handle returned when the page was backed up.
> +	 * @intr: Try to perform waits interruptable or at least killable.
> +	 *
> +	 * Return: 0 on success, Negative error code on failure, notably
> +	 * -EINTR if @intr was set to true and a signal is pending.
> +	 */
> +	int (*copy_backed_up_page)(struct ttm_backup *backup, struct page *dst,
> +				   unsigned long handle, bool intr);
> +
> +	/**
> +	 * backup_page - Backup a page
> +	 * @backup: The struct backup pointer to use.
> +	 * @page: The page to back up.
> +	 * @writeback: Whether to perform immediate writeback of the page.
> +	 * This may have performance implications.
> +	 * @i: A unique integer for each page and each struct backup.
> +	 * This is a hint allowing the backup backend to avoid managing
> +	 * its address space separately.
> +	 * @page_gfp: The gfp value used when the page was allocated.
> +	 * This is used for accounting purposes.
> +	 * @alloc_gfp: The gpf to be used when the backend needs to allocaete
> +	 * memory.
> +	 *
> +	 * Return: A handle on success. 0 on failure.
> +	 * (This is following the swp_entry_t convention).
> +	 *
> +	 * Note: This function could be extended to back up a folio and
> +	 * backends would then split the folio internally if needed.
> +	 * Drawback is that the caller would then have to keep track of
> +	 * the folio size- and usage.
> +	 */
> +	unsigned long (*backup_page)(struct ttm_backup *backup, struct page *page,
> +				     bool writeback, pgoff_t i, gfp_t page_gfp,
> +				     gfp_t alloc_gfp);
> +	/**
> +	 * fini - Free the struct backup resources after last use.
> +	 * @backup: Pointer to the struct backup whose resources to free.
> +	 *
> +	 * After a call to @fini, it's illegal to use the @backup pointer.
> +	 */
> +	void (*fini)(struct ttm_backup *backup);
> +};
> +
> +/**
> + * struct ttm_backup - Abstract a backup backend.
> + * @ops: The operations as described above.
> + *
> + * The struct ttm_backup is intended to be subclassed by the
> + * backend implementation.
> + */
> +struct ttm_backup {
> +	const struct ttm_backup_ops *ops;
> +};
> +
> +/**
> + * ttm_backup_shmem_create() - Create a shmem-based struct backup.
> + * @size: The maximum size (in bytes) to back up.
> + *
> + * Create a backup utilizing shmem objects.
> + *
> + * Return: A pointer to a struct ttm_backup on success,
> + * an error pointer on error.
> + */
> +struct ttm_backup *ttm_backup_shmem_create(loff_t size);
> +
> +#endif

