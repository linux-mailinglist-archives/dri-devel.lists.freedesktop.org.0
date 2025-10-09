Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7739BC799B
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 09:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECDE10E920;
	Thu,  9 Oct 2025 07:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="q07dPhMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013070.outbound.protection.outlook.com
 [40.93.196.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53B410E91E;
 Thu,  9 Oct 2025 07:01:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMIaq3nkdlY+IB0EHulVS5DLXuUucqP6wR42iJgUNbTJW7MQ25zYbxaFs+YfOtktUEmM5e2gGvAk8BrFKXcBjE5hollPf+j9BLQSZBZgN0/8axtRuqQ3NCDhP9OWBPE/xwzsEtzCSZ4VL48wB3RenoEhfVep0mUL0fMOcSv1NAfUClPUGViifXX+LibOLXw0mKWRPOajLvqCgUhTkakxpwkhLvQnPF36FJf35xkYJIDWV2YjSF+akbuV7MiyQowEAHgAhK42IUiDSIVh12jAgjA9aV3rM3q8wAjE5XNlkBZkXGiBW7JAhr/7b5KI8uzmx+Ir1neVGSEmfbOMsZqjBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcGOBAt7m4EkwmR2wCq4/tK7D+w5ZZY3Noure8pe4cE=;
 b=q8bTd6Z/HLKJw1TrmF2ZxRI63QCYa5Chn4FwfehI2IWbHiBzLDAKNcXD9muV+5EfSVqc5+yMUQHA8RAtNWi1Odkes/1oPGTctir4dVEX3fnJlfsOmyyCGMndU23YO7+5p6yAQHc0yQZXqKFMvWHl5FUAf1CFdey1JPymff6I/PbBeJRbBd3dVQhweujUBOduxieYFUCME6va1F91I0gIm2CQ6y5LUoxB5KYNcwiGSY0wnRC7EO4QionE70T6LQfVHHuCtvCD/S+x3owHClCdqXD5SSF2DQwxcEBqXYgPHBqSBC13D79wOq3gwSla268nGViZh5WDaZcHrAbhGzD9GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcGOBAt7m4EkwmR2wCq4/tK7D+w5ZZY3Noure8pe4cE=;
 b=q07dPhMUcbrvr9Eu9uOwO0/kiukkyctQdG9sOReoMFLhlXdYweU5atDDSGvcsvCPe1QLoe/9aqttK26+BPSbKZ7UpAxpMROSbTRvj1Gk6TkHsb18MGtFOwK2/KntIMxHVyY+rY5sRid/1Cw00sJhRAFX2O0yuQJPl1VXMZAXc2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6444.namprd12.prod.outlook.com (2603:10b6:510:1f8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Thu, 9 Oct
 2025 07:01:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 07:01:42 +0000
Message-ID: <d67cbd3a-5cd8-43b8-badf-3f264885429d@amd.com>
Date: Thu, 9 Oct 2025 09:01:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Avoid killing entity last used by parent on
 child SIGKILL
To: David Rosca <david.rosca@amd.com>, Philipp Stanner <phasta@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
References: <20251002150524.7552-3-david.rosca@amd.com>
Content-Language: en-US
Cc: amd-gfx@lists.freedesktop.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251002150524.7552-3-david.rosca@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0246.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6444:EE_
X-MS-Office365-Filtering-Correlation-Id: aaf728be-8cef-400e-1e08-08de0701b360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWdtZ2oxRzl5a1d6RWhlSVQvQmZzSXZ0aytsVlcrWVRZMWwzenk2MFpnek5v?=
 =?utf-8?B?ODNiSC9nQVFPOENoQ3o5ZzdBRE93VUJ6a3NDb2t2L3pzdDFXamx3QzJSSEQ3?=
 =?utf-8?B?UGlhOEZNZU53cU11VmpqS3hwdEpUNWFiek1aVGpjUmU2bG9VV3NiQWd0cGpT?=
 =?utf-8?B?UjFOWGphc0ozekl5K1FvOHh1bEFQNXUyMFlqODVLMnJzemFTU0NiK0F3R3Ji?=
 =?utf-8?B?V3pWOW5OVWRGK1k2c2hDVmdyZEx2aWtQYWlqZ3dDdk1jTVpTT2s0WHJjOFRu?=
 =?utf-8?B?UTVpNGUzRUsxYnQ0V1FRdGo1STQ2bytTOTFCS0RPdzFremR3Z1JaK2RQblJk?=
 =?utf-8?B?SFBxQjBHNks4UVo4U1FZSlJocWhYNk1MYlI5K0QyOEhkR0x0QWJIM1VzWnNp?=
 =?utf-8?B?UHpiK1dvcHU5THpJUHdaQXNhSThMYWdraUs0THNIQ253QkxiemxhWmd5M3ZV?=
 =?utf-8?B?VTZCeWd5TXkxbEd5dkRsd2x0dGRFRVpRK2ZQODVRbmJBamZzSWVDZDFyRGdp?=
 =?utf-8?B?UkxlZ1ZBR0FsdWhEMUFaN0Q0U0lyQVE5S3hWTVAra2VINm1zS2Q4a0tNdDFG?=
 =?utf-8?B?RjYvWkRIMFMxRTgxWjdzMjFYWm9GUWFtT20wdUVxQ0dpUmtQUmtXZWtUaG1x?=
 =?utf-8?B?Wjl0dTI4blUrN3JvdzVza0FsMEY2b25KeklVVVBnbWhNbXkvMWRNMXR6M29H?=
 =?utf-8?B?VEFMQ3FjbzFJWWM2WlpsTVN0SnRacEdDYkFZNGNqdE54dFZtWWNXdTYzRTVj?=
 =?utf-8?B?ZmxkbEpQTmdMWUVWQUJGTEpENEhqK3JtMU00TDZmamJidzAzaUozM3pacUpL?=
 =?utf-8?B?TkFLaGRTeVJMZC9KelV6eU9OSzI2NkJRUy9QUms5VENJU0FETDZNZmJiZm9J?=
 =?utf-8?B?bDBKRU53Q1FaanppNUtTK083cUFLbVgrV1FFM3pVSmY1Y09RODhrNTJzVWph?=
 =?utf-8?B?QlArK1Y3WXErK1dNWmVtbDRiK2Q3QlNNVHFQckY3Zmc5c1c4dkE3dFRycy84?=
 =?utf-8?B?TUNxOWlCbWNZeW1jK3J6Yk1ZZ2RVVUhRRXB6cVhlL1NJeVlmWkVSWDQ5SW02?=
 =?utf-8?B?eXlwU0p0N1JJa3R0aFdxbW0xT0hja2o4eW02UDFMWG5HdHNJY3pTekNXUG5V?=
 =?utf-8?B?RTMzUVZhbEZHTHJsMmFxbU00UU1Ga1ZEUkNLTlF0NjBkcENTVkF4WUZuRVYw?=
 =?utf-8?B?TTl3NnN6OENhcEpsQlA1Wm1QY1NlbXYybzM4SkNZak1ZTXdqMkxFVnJaZmhz?=
 =?utf-8?B?bWNGWGE4cjV0bGh1WExMdmx4VjZZcHdMU0JuRXdTQ0RuNlRWRUE2WGl6ZDQy?=
 =?utf-8?B?L1FvaTBaNkoxdFd6clBVSndxTUJCamdtdWM0bHhYVGRFakFpU2YrQ0l1UU1D?=
 =?utf-8?B?RUc1cUZjRy9MNkREV2Z4aWZvS2VwMkFPZEFTYmxkNUIwZWlpTkpOUFZtMXFi?=
 =?utf-8?B?d1JoM1pOR1YraE9qb0JzVFRvSUliOWpObmU2UldpdHVzQTFSTm9kemtjVGhH?=
 =?utf-8?B?YUhmVjQ5aUpFd0xZQ3dNbkRxRVNLbkN1cC8rRERLdERMdzZSZHNpd05RajNy?=
 =?utf-8?B?VG04bHhjR0VtSEVuMTNuYytHNXplaTV3THR0cGxzUS83RmtmNGFNYVVTc0gx?=
 =?utf-8?B?ZXFRNVVPNENlUU90aDNHOWpkQjZIWlUrRTlUYW1JWVd6Q3Y0NWRteHl6V0dV?=
 =?utf-8?B?Mk1haG1Fa1hZOHZiZ1g5MGJsQVlkS3lsNHB2dVkybURJNHhIRW4xbmt6SUVH?=
 =?utf-8?B?KzBPZExSclBDRmJ0Z0tJdUFUZFk3a0tLS3JOejBpbkl5ZHBpUDZ6VjhSL2kz?=
 =?utf-8?B?S0s0QWU2WWkvMWVPQWtOZ3dINU1nVkJTWXQ3TmxXK1VmeXEwNVFRb0JaUVAr?=
 =?utf-8?B?MXA1ZGJ5Njg3Y3R5RkwzNlY5ZTV3eno5WVhDVEVzVmpnNkdySys4N010VUEy?=
 =?utf-8?Q?+QgJTf2Khe9TwIhgNdIJfTwuVvjeSrrg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STlWeE1BL0t2Q3MwOHdsU2RnTERHTUxFdjZQTVZyV1hha2ZTRnArQndxY24v?=
 =?utf-8?B?OU01MWNGZHhXdzlIVU1wR2V1UW9TL0QvVFVmWVNINGhjQmUzNk8rbmlFMUNB?=
 =?utf-8?B?VndvRzBiaTQ0YlFKM1RQRWMvY25VTG85K1c2VFBLWWZ6a3ZUMWRDVStaU1Zp?=
 =?utf-8?B?N1lmOVJBSHFpU0Q1VjJzU0ZnTExmUngvVHVuOXM2WFRXU3dtVjAwb2tqNm1p?=
 =?utf-8?B?aXFORHNkNkZSVmpjOWRSejVPZUVkeDF1SlZXYnpkZkMwOE9VVU5tQWxiUXNh?=
 =?utf-8?B?WFB1MkVkc0xkWVF2Z3RBMHk0cE1PWWRINnd5d1g4bllISzRIZkw3dzlYdVdE?=
 =?utf-8?B?VnVrdWcybTVDTTUrZ0p0Zm9MdWs0SHp6OWdaTDQxV1ZhZThyV1YwdEtNVFg0?=
 =?utf-8?B?cGQ2NW1lTkJZd1BMS1YzRmZNZDBUeDZHUE5YME9vbVRHL2NjOElyc0lWb1NH?=
 =?utf-8?B?TE01VXEzMzUvT0E3QnRIcC9wZEc5ajhpK1RDejZFZS81NEtZODF1dDRkSEp4?=
 =?utf-8?B?cy9QRXVGdEtEOW13UWFTQ21neSs5d2ZzaXJpQjgvZkUxL3JadXRMZmg4eTk1?=
 =?utf-8?B?R1FJR1V5bS95MHJEQTh2dHZ3VmJPcURadzMzUjZGZEFiTHdZTTFCWFhWRjZv?=
 =?utf-8?B?U29QVkxVdCtEL1FKdnl5N01iRG4ybTZNUmdiQkpCcWVSY3EwYUZwQTM4UnZ2?=
 =?utf-8?B?ODNnelR4VzJLazNxT2dLQXJabVA1N1RlMHV3ZkU2eVlRVU9qcFhKQ21zeStk?=
 =?utf-8?B?VnhWenBTaUxGa290a3pNcFlxWHhCeUFPbVAybUhPU0Q2dVhraW9UOHNzK2lN?=
 =?utf-8?B?Nmk0QkIwdG1Td3V6SWxnWFBzTjhiVm8wcEgwa0xxM0tIVlZBVlF3SzlVak50?=
 =?utf-8?B?MUhpSUZvYjFuL2dCTzBDWW5XOVdZSzRUc21lTW16RzdkV1ZlbXh4Y0J4bmV2?=
 =?utf-8?B?V3JuSUZNQmV4RXhqdkNtRm5MUjIzeHNaUlg0U2tneU1WTzlxOG1Kcml2eGVv?=
 =?utf-8?B?dHpmbGNnYjduUkR0aHExTERudDkrWjhkVkVvRHI4UUxlbFBjNDZQdWVDdWtD?=
 =?utf-8?B?bEd2WDdkVXRJWXYyNHowYzZaWUpwWFRNSnNXMGY1aTFUOXBqN3FwNzVZbmFD?=
 =?utf-8?B?Vm42SEM5ZUswVnhIZEZtemR4QUlINFE4LytxRDBIL2V5akxPN1ZoMXpYSVN2?=
 =?utf-8?B?QlJoQWVVZW00Y0xCblpPY3IwOG1hR0UxMG1aYlNZQzBnMm9VK1NCN3BPOVor?=
 =?utf-8?B?cU9UVTEzSTlCbTBCd2VlS2pRNEpmRDAzTFBqTXpPVmh3K0xiSmNLVkJBNkIv?=
 =?utf-8?B?SXdIYkRXSjFCQTdIOEpkQzIwdmZHT2RLRlErWnFtWXlCTmhNRFVHcXJCbmRS?=
 =?utf-8?B?RXhtNWh0TU5sMFpBTGYzbHZCL3pHUjNtcVJESUZyWkY2YTYvWkVPL3JLSllY?=
 =?utf-8?B?bkxsdzR3a041VDV3dU9TSW82dTFkYkR4NEtwMnVkMFo4enU5OGJ2UTZ2emsw?=
 =?utf-8?B?T2QzZmdmYUl6OTZlVE1Gc0R0T3RRcFA0aTJSUDlZOFFib0JCSEhIM1ZoSndB?=
 =?utf-8?B?aERweDBtNWhvWEhkMG16SC9EemdWOE9hQnAyc0tWVUg2MlJoU0ptd2orSGJ0?=
 =?utf-8?B?VE1WcVUyMThvWEFGTFNSN0x6K214ZmpTL1RzcC80b3dNZi9zSCthNVE4Zm1K?=
 =?utf-8?B?ajZmNHZIZFkwMmR3dlV1NldKb2xudkdsVmRncDk0L1c3UGFTUHFzRTB6NDdO?=
 =?utf-8?B?bzk0NmhHQ2tpVTFpeXBaejlqYWd3LzAyRnN3aDJkditUSmNZNndScThKQUNJ?=
 =?utf-8?B?THo2M1lCL2VqYkhpZGc4ZjJyS2U2NjdWSVZlQ2NEYVpIeWFjbGQ5OVlKMlhV?=
 =?utf-8?B?V0x3b0lRRjFzMVFHd0ZzZW1QcG1acTRUMFd2VWROR21PRWp2dkcwcHQxamRK?=
 =?utf-8?B?cDQyQ3VZWmpoU3lUcFRLTXpUUnl6OEVVZkZrOThrNng3c0l1RWN5dUMxRkUr?=
 =?utf-8?B?UHMwRFpiMmdrbUt0THd0aTlQMlBzSHdGYWNPYTZIdlZxZmJWaG1acW13cHg2?=
 =?utf-8?B?TGlNRGUyVTNHblRpUGVmZlRqeHVvRkdmZUJBZkJUT2VNQmdrWTZ5cnFTSml6?=
 =?utf-8?Q?f4sbaZRClvDXOn1LxZ7oljde/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf728be-8cef-400e-1e08-08de0701b360
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 07:01:42.2851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n61jMCW+4jechK5c8j5nRlkubZTuS5h7ybTR15UtzClO7EDuOUMaLGSVU4SwFhPy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6444
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

On 02.10.25 17:05, David Rosca wrote:
> drm_sched_entity_flush should only kill the entity if the current
> process is the last user of the entity. The last_user is only set
> when adding new job, so entities that had no jobs submitted to them
> have NULL last_user and would always be killed.
> Another issue is setting last_user to NULL from drm_sched_entity_flush,
> which causes subsequent calls to kill the entity.
> 
> Signed-off-by: David Rosca <david.rosca@amd.com>
> Fixes: 51564e9f06f0 ("drm/amdgpu: Avoid extra evict-restore process.")

Good catch, but in general please CC the relevant maintainers and mailing lists for scheduler patches.

> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 8867b95ab089..a325e4a59990 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -70,6 +70,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  	entity->guilty = guilty;
>  	entity->num_sched_list = num_sched_list;
>  	entity->priority = priority;
> +	entity->last_user = current->group_leader;
>  	/*
>  	 * It's perfectly valid to initialize an entity without having a valid
>  	 * scheduler attached. It's just not valid to use the scheduler before it
> @@ -278,7 +279,6 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>  long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>  {
>  	struct drm_gpu_scheduler *sched;
> -	struct task_struct *last_user;
>  	long ret = timeout;
>  
>  	if (!entity->rq)
> @@ -301,8 +301,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>  	}
>  
>  	/* For killed process disable any more IBs enqueue right now */
> -	last_user = cmpxchg(&entity->last_user, current->group_leader, NULL);
> -	if ((!last_user || last_user == current->group_leader) &&
> +	if (entity->last_user == current->group_leader &&

You still need the cmpxchg() here or otherwise drm_sched_entity_kill() would run multiple times.

Regards,
Christian.

>  	    (current->flags & PF_EXITING) && (current->exit_code == SIGKILL))
>  		drm_sched_entity_kill(entity);
>  

