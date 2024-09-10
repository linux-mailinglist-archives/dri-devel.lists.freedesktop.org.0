Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474B8973AED
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 17:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5BB10E847;
	Tue, 10 Sep 2024 15:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n2rbzkGn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2056.outbound.protection.outlook.com [40.107.100.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2324610E842;
 Tue, 10 Sep 2024 15:03:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnU0foWHu5BGms0snqeSg3udB+wz9Ch4HxiSvyyR38kjoPWFI0vm/APrckycYVQfBYaiUfpxhdHeTjtBruk8s665dJZiGThJU2pAWelughoEIrE9qJV9Vt90rebETQlgVSbrCSAGm2GDgGe8tkm7tS+esNlfE/4C5oC1YEchduU72m7UVPVlD1n7k/Hwpor0evHlUZDcsseVnL5L6rpaO124xnQmU51b+1pGWo/GbnUDL4GIQbOhDVnxvmA/gmuysTpHKPquMyJ2lKUWz/jqT45XZb+Dm+ADgns0c3TxmllcOokHrEX6WsmbVURMOqOmmP4qnlfg629E3W1+lxP1Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMDY3F/Xn5PPVFrTcQvmwxA/TpcKgV3JuojQGu9DkzU=;
 b=cNQGFxYiYkAJiRGqcZkuEurYITKU+1MWWB0v9PW+GLN9KiTOc14lSf6A/pKShE/ir0Fl0+d/w6qDPolj6BIt9J0FW03t3I4WXp2+WbxW7VhLWjLEA2cHy64s3RqTjtyES9/WHpBxQuyhYB+5248qeC8Jfq4IgLKb943qpRMvdPib921V3afWX1yT3nEzmt9rDmIBAWhnbyF7/46lqcvkIRmObOKO5A93+zzk0HZa59Yh/WNce45awi/zxpASxE8Pj+WGx5pYfb5lsHewaixZEwav0FfTawZurcWkXbGc/L6AeM7A3/OqvA8necGa7A3acMQagU14ABxhFVilrDVQ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMDY3F/Xn5PPVFrTcQvmwxA/TpcKgV3JuojQGu9DkzU=;
 b=n2rbzkGnNMa/E+Sdd9J+PxlX9fa2Y8IBmXGTbKklZ1uxf5Wo4gWnt7nbYSYkqksWe/gB+b04hWl0OCrwEMx6BSWvyUP9cOB7y2Xololkk3LHuYvyLq0Og08AClfa1QiRVP1Hs7FEBZIyRejK3jdeUgk/gHKIkMPRPRh0mY4gaHE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Tue, 10 Sep
 2024 15:03:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 15:03:49 +0000
Message-ID: <aed37179-292b-41d0-878d-95f248d5ee8e@amd.com>
Date: Tue, 10 Sep 2024 17:03:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/sched: Further optimise drm_sched_entity_push_job
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20240909171937.51550-1-tursulin@igalia.com>
 <20240909171937.51550-9-tursulin@igalia.com>
 <cd0dcdf4-a001-4fc3-9803-3e8b85cbc89f@gmail.com>
 <48b74e60-6e75-4929-aa30-503f4a4cd5e8@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <48b74e60-6e75-4929-aa30-503f4a4cd5e8@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB4399:EE_
X-MS-Office365-Filtering-Correlation-Id: 89b1bde3-84bc-46ba-eecb-08dcd1a9c68a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFZ0MWtwKysyWlRpdU1PNHBkdmQ4NW4xYzdHUlM5SEFwVWFPQXFGc0hkWHV2?=
 =?utf-8?B?bVUza1E2ZTJpdDM5REE0WmZoNngvcUt3Z2ZtTm9zTldKdWdNckRiSzBFOGtU?=
 =?utf-8?B?aU9vRnlQWkxCYm1tcWNxSVMzaC9FVk5IRWIyOTlhZXZ1dUt2aE91eVpZdkpY?=
 =?utf-8?B?d1NqT2RMd0JZZ0xGUmNaTitXTEJ1L3NNdTZxTGNZZ0VaeUxmM0phUURUVGR0?=
 =?utf-8?B?dXQ3a3h5NU1FRVNJUi9jTi9uZC9rWXFaUTFkaG1pejVWMWZtaHlnSmgxS2R0?=
 =?utf-8?B?enpTR3ZuQjIxL0FpY284QjZXanVtRW5jUXQ2L010dVFaNXBab2YzMlgyT2Z0?=
 =?utf-8?B?Nnd0bms5eDljSmtYUFNNUmxBaU0xRVhlYlh5ZE4rUGsvY1ZEMjUwZXNHNS9x?=
 =?utf-8?B?VUQvRHpFQnJveWV0akhCRkYrR0ZqZEhHOCt3S2pQMDNZb1Y3MmRvUEkrU05G?=
 =?utf-8?B?amhCVm1nbUZ4NTJScVcxRmZUZ2w0V0d2ejc5dXNHRklkaFNJMjdJUmdaT1k3?=
 =?utf-8?B?V0pVUEZJV0IrZEszTEx5dDZoS2MzNkliMFBVNVpFZ1NYenZwbHNKblR5Qy8z?=
 =?utf-8?B?dDVhRDJVU0NZUjlHblB3SkNZODRNRzcwQzRxZkM2R2FGWXFMOWxSS0VGbmNa?=
 =?utf-8?B?WHVSUGFuYWl3VkZ6Y2NRcWtEQ3ZpdXk5b3hjSzNIaDZkUEs2WXRoNkJjMDJT?=
 =?utf-8?B?UWJ1TzR6RVZzUUVyc1FlWEdjYjhEaUJTSm8rekxrSTl3Y1dXaDBVc2xYV2sy?=
 =?utf-8?B?enlZSmRmem5EZlJRUG90Rnp5VjEwNzNwd2gwSWdsU3R0L1U2aFFacm1OV3NI?=
 =?utf-8?B?RzFZWUJTSjVTS1FjVVcwY0ovaloycGp0Zjg4Z0Vkckl6L3V1TUlPRFU5TVBz?=
 =?utf-8?B?aitMK0RrRkdqanFwc29teWxCQlpvOGVZYXFvNGlpbjZhVmlVMXB4VVJTM0RB?=
 =?utf-8?B?UHFJaEFVYWlQUWViWExrT1JXWlJyekJ5bFc1aklWaFZFZFkxaVRuZDJ0RmNw?=
 =?utf-8?B?V3c3UUkyQ3Z4bEEvLzhuVkp5ZzZLQWhqa3pXdTJsaDJzN29JdDNEYU1XRVZV?=
 =?utf-8?B?aU5Vcllta3kzYVlVb0RKL0dXUVZNZjB1MkpJTUs5eWg3cUJVRWJiL0tDMVA1?=
 =?utf-8?B?TEIxRzZjZlo4UkQzZDZzTE4za1dxQzlHc0VNTExsT2dlcXhITHBCQ2JtZE9W?=
 =?utf-8?B?NnROMnBDbjdFeUxLc0htdXJWbHVISjBhbFI5TzRLTnlGK210ZzN6Mk5IbGx3?=
 =?utf-8?B?MVZzbHZleXEvTjhqdlVjRmQybk10dXNZMEJwTTJVRmxIaGFReExPM0tMbmk3?=
 =?utf-8?B?VldWVzJXWGFMZnRVUzdFeXFCb3JET2J1VmNlR2VuWkNtM3UzY1AwSDd5RG1h?=
 =?utf-8?B?czNlaFlzTEtKbzJaek1zeTQyeWhDcG0wRkhaUkw2aERyT1hEUjNKdGU5b0Jl?=
 =?utf-8?B?TFk4QktsMzJEenB4Mndhc3owODZNMDJuSE1LQ05TNyt1NFpVOXZMaHVsbDlT?=
 =?utf-8?B?VFNOUEZJYjc5dVVpTXVhcDNyN3FzOGRFREp4U2RRdkVIZDcrNHIwT3R4dHpu?=
 =?utf-8?B?dTdnb09YSGpmaEM2bHFuczlPQlZmc2J3U2FrUWp1M1dKUllEL0EwbWh0a2lQ?=
 =?utf-8?B?bitVTzROZkxoSmtDdk90R1JFV3BOQTl5TU54emZOM0duWXZRT3dMQ1RlVC9F?=
 =?utf-8?B?a3lpeVBGMTRHWFZ4dzgxMG8yTFM4bm5lOXlxN0c0NmtmeU96Skhzb2hSQ1U3?=
 =?utf-8?B?eTNVMTMvQS81Wm1yN1NXeUIzYUZJT040ekZMT1N6NGdZNHlqZGFyMVMvNEpq?=
 =?utf-8?B?b2RwakhiUVBOU3JXbHFSZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmdHbERCMTVkTDRVaEIwQ1EvdlI5aVdpV3VhYmduTUYvbUJvUnFYS2xZRGVz?=
 =?utf-8?B?aXRXTzh6Unp1cXdVZXpVbkN2VDZxRjdtNEZHSklMcElEWU1Yem9aQXY4K1Qy?=
 =?utf-8?B?MENjNSs0UnFEOUZQVkIzN1gxVDNIaklPUjVjdSs5OTJwR01sai9MQm5YWlht?=
 =?utf-8?B?cFprT0hiWExKT241MGNUZ2F1dERYck9GMmpySVdZanp0STE2enFUTGdPUnlU?=
 =?utf-8?B?a1J0RUJOYmdmRVowUUp5VEszWk83T0V3QzZWa0NHVDJiZXFvbytQL0ZhWG9I?=
 =?utf-8?B?NnRTQVQ3U2xPN0pMR2x6STBXU2VFQ0kwYThndDNldUp0a1B4NE1VY1BOQnRZ?=
 =?utf-8?B?QkdsdUxyRlovNDBuOWJHdFhseUFCenM1MWI4SWRyQXJHUlptTlhXTXhHdGs1?=
 =?utf-8?B?OVh1TnNMUW51NTJ2bHI3by9pTGM3WCsrb0R3ajVQVUk1UzlvRGJQOUxQUmcx?=
 =?utf-8?B?ZmdKNkhrMXVQd3YzdEhEKzNFK2VtVU11V2hkSlFQNU1SN09qQkhucmZkMjM5?=
 =?utf-8?B?RlVnNW5acTJuS1JrMVU5SmIwSFNGSUp6Rkg3TkNVOUtqbUVvZ25PdVVLN3dn?=
 =?utf-8?B?S3JkU0R0WlVyZTJmdmwyU0IyN28venRySlZjNGF6S28remJDUE5JYVFZMjZ3?=
 =?utf-8?B?Z2xxY0hpU0xoYUJDVlpBSUNNK3g0NHRhWHZmd2VIN2R2MWpEZHhWbjcwbHVP?=
 =?utf-8?B?MlBma0lDVFhZcXpWSVVhVWhDWHFOK0NtUENTQ2dhOXVHWkk4MXg1RkE3RTdB?=
 =?utf-8?B?WjFqVkV1L0lGWjhjYlJpWWlHd1Y5ci9ERUpnM0luSlhGZGlOcDMrVVV5T2d5?=
 =?utf-8?B?Y2FtRCtPTTFuQWJjV0N3TnFRTmRKNWZvRTdXbGdHbFE4RnlxRC9UL0xTcjVZ?=
 =?utf-8?B?Vi85aU5FL3JXOTFjektZWjhMZmF1ejJjbitTZnpYSlkrY0RObjVvQjhwSUMw?=
 =?utf-8?B?ZEliVXBtVGVWY08wN09GOXoxU0JKckxPYU1LSEVZK3JsSnMzSmlMTEhHbXow?=
 =?utf-8?B?TkRVWjhTZ1dnc0YzNVlXV1J3bTdvclI4Y0FidDBaSkxpa2dEUkk2OTcwT04x?=
 =?utf-8?B?YjdTYjBJZVl6WWhZbGhoaWxIb3pUdVBnWFJZNEFVM09uR3BPYndPVk5uTzVm?=
 =?utf-8?B?cXRROTZLbmFBSk1xL0U5UXVaWStCeWhHYVpnTjQxWlRxVkJNTHRxN09GNXo0?=
 =?utf-8?B?Ynh1RHJGMytYS2xPdU95cVhteXh4MWhpbUNaTmJ4S0pnWU1GdStDdXk0V21P?=
 =?utf-8?B?djF0cnhHV1NDcXdvSWtBUHJsYis1SHFXUUdhUnJ2VGFIN2tnSFFlRjJ6MU1Y?=
 =?utf-8?B?Rkw1VzlzU1lEM0N2ampwWjFLOVFNMlU3Tm1qa1JuNktsUUxGVVJWT1J3VU14?=
 =?utf-8?B?TTNSNWdFVmtvN1Z2OUhBUjNhczFTdnFROFBqSUVvZnFRUE9OTkdnV2VhY1hL?=
 =?utf-8?B?amhTVWlHNVh2S3NSd21id3EyT1F5eEZLYmc2UFJHMG1QNVJSVWJRc0RVcXhz?=
 =?utf-8?B?NjE3RllTRFVPUi9CY1ZScjdRZ3VaWGltSCtxQnBTV3FwUldJeUZvTXVEZWtq?=
 =?utf-8?B?akhxejJCZkhFdVE3dllNa1pJbEhpaXExR3NzeXZSNkpZemJicW1vbmtmYjlZ?=
 =?utf-8?B?bGpMZSs1anprRnZXRVpVMHZWQnNraHRFZjBONHRVSnY5VFVjUnUrQ0g1T3Vp?=
 =?utf-8?B?dWhJcUcrZkFOY1k4d1ZHQVhKNkVKL1ZrZjJCcUxkZFhsTDNwTHVpMDd5VUd2?=
 =?utf-8?B?cXpVTTduS1hLWWQ4QlJTTk05eWl2VDBZamVwRG5RSGxTR09HSHp0REZrU0hG?=
 =?utf-8?B?Y1hud0Z2bHJWUFJpWC9waHlnSzJwN2lpeXdoVjUwT2Z6cDJTZVBoWHRIYTlT?=
 =?utf-8?B?M3N0NkZWMlpwY1ZDSGd3WGZmOUFxTEQ2ci9XNUtyNzVjWkNwUytGN0pncktQ?=
 =?utf-8?B?V2p3MEt4UjIrdjFYZ0dkeFBzTFhraTZ3V3E1MEF6T3hySG9nL3h6VTNyVHY3?=
 =?utf-8?B?djE5YU91bDBtN0NwL21SM29YWmNteEF4b2hZbklYbXUwZmtCVGE3b3A4V2ti?=
 =?utf-8?B?ODNLbURaWGk4eUJOdUlWY0JmSkZnRng0NFVjeXM1TGJ0TU44ZjZIVkVHNXpP?=
 =?utf-8?Q?SR/0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b1bde3-84bc-46ba-eecb-08dcd1a9c68a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 15:03:49.1990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWb8bOULuCHTe/8dPWpI47Hj6INMWWUgsEkcBFD2/1cPYflSjqcBswzU09DJBBd+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399
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

Am 10.09.24 um 11:46 schrieb Tvrtko Ursulin:
>
> On 10/09/2024 10:08, Christian König wrote:
>> Am 09.09.24 um 19:19 schrieb Tvrtko Ursulin:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>
>>> Having removed one re-lock cycle on the entity->lock in a patch titled
>>> "drm/sched: Optimise drm_sched_entity_push_job", with only a tiny bit
>>> larger refactoring we can do the same optimisation on the rq->lock.
>>> (Currently both drm_sched_rq_add_entity() and
>>> drm_sched_rq_update_fifo_locked() take and release the same lock.)
>>
>> I think that goes into the wrong direction.
>>
>> Probably better to move this here into drm_sched_rq_add_entity():
>>
>>            if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>               drm_sched_rq_update_fifo_locked(entity, submit_ts);
>>
>> We can then also drop adding the entity to the rr list when FIFO is 
>> in use.
>
> Unfortuntely there is a few other places which appear to rely on the 
> list. Like drm_sched_fini,

That should be only a warning.

> drm_sched_increase_karma and 

The karma handling was another bad idea from AMD how to populate back 
errors to userspace and I've just recently documented together with Sima 
that we should use dma-fence errors instead.

Just didn't had time to tackle cleaning that up yet.

> even amdgpu_job_stop_all_jobs_on_sched.

Uff, seeing that for the first time just now. Another bad idea how to 
handle things which doesn't take the appropriate locks and looks racy to me.


> Latter could perhaps be solved by adding an iterator helper to the 
> scheduler, which would perhaps be a good move for component isolation. 
> And first two could be handled by implementing a complete and mutually 
> exclusive duality of how entities are walked depending on scheduling 
> mode. Plus making the scheduling mode only be configurable at boot. It 
> feels doable but significant work and in the meantime removing the 
> double re-lock maybe acceptable?

I don't think we should optimize for something we want to remove in the 
long term.

If possible I would rather say that we should completely drop the RR 
approach and only use FIFO or even something more sophisticated.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>>>
>>> To achieve this we rename drm_sched_rq_add_entity() to
>>> drm_sched_rq_add_entity_locked(), making it expect the rq->lock to be
>>> held, and also add the same expectation to
>>> drm_sched_rq_update_fifo_locked().
>>>
>>> For more stream-lining we also add the run-queue as an explicit 
>>> parameter
>>> to drm_sched_rq_remove_fifo_locked() to avoid both callers and callee
>>> having to dereference entity->rq.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Philipp Stanner <pstanner@redhat.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_entity.c |  7 ++--
>>>   drivers/gpu/drm/scheduler/sched_main.c   | 41 
>>> +++++++++++++-----------
>>>   include/drm/gpu_scheduler.h              |  7 ++--
>>>   3 files changed, 31 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index b4c4f9923e0b..2102c726d275 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -614,11 +614,14 @@ void drm_sched_entity_push_job(struct 
>>> drm_sched_job *sched_job)
>>>           sched = rq->sched;
>>>           atomic_inc(sched->score);
>>> -        drm_sched_rq_add_entity(rq, entity);
>>> +
>>> +        spin_lock(&rq->lock);
>>> +        drm_sched_rq_add_entity_locked(rq, entity);
>>>           if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>> -            drm_sched_rq_update_fifo_locked(entity, submit_ts);
>>> +            drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
>>> +        spin_unlock(&rq->lock);
>>>           spin_unlock(&entity->lock);
>>>           drm_sched_wakeup(sched, entity);
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 937e7d1cfc49..1ccd2aed2d32 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -153,41 +153,44 @@ static __always_inline bool 
>>> drm_sched_entity_compare_before(struct rb_node *a,
>>>       return ktime_before(ent_a->oldest_job_waiting, 
>>> ent_b->oldest_job_waiting);
>>>   }
>>> -static inline void drm_sched_rq_remove_fifo_locked(struct 
>>> drm_sched_entity *entity)
>>> +static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity 
>>> *entity,
>>> +                        struct drm_sched_rq *rq)
>>>   {
>>> -    struct drm_sched_rq *rq = entity->rq;
>>> -
>>>       if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>>>           rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
>>>           RB_CLEAR_NODE(&entity->rb_tree_node);
>>>       }
>>>   }
>>> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity 
>>> *entity, ktime_t ts)
>>> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>>> +                     struct drm_sched_rq *rq,
>>> +                     ktime_t ts)
>>>   {
>>>       lockdep_assert_held(&entity->lock);
>>> +    lockdep_assert_held(&rq->lock);
>>> -    spin_lock(&entity->rq->lock);
>>> -
>>> -    drm_sched_rq_remove_fifo_locked(entity);
>>> +    drm_sched_rq_remove_fifo_locked(entity, rq);
>>>       entity->oldest_job_waiting = ts;
>>> -    rb_add_cached(&entity->rb_tree_node, &entity->rq->rb_tree_root,
>>> +    rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>>>                 drm_sched_entity_compare_before);
>>> -
>>> -    spin_unlock(&entity->rq->lock);
>>>   }
>>>   void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, 
>>> ktime_t ts)
>>>   {
>>> +    struct drm_sched_rq *rq;
>>> +
>>>       /*
>>>        * Both locks need to be grabbed, one to protect from 
>>> entity->rq change
>>>        * for entity from within concurrent 
>>> drm_sched_entity_select_rq and the
>>>        * other to update the rb tree structure.
>>>        */
>>>       spin_lock(&entity->lock);
>>> -    drm_sched_rq_update_fifo_locked(entity, ts);
>>> +    rq = entity->rq;
>>> +    spin_lock(&rq->lock);
>>> +    drm_sched_rq_update_fifo_locked(entity, rq, ts);
>>> +    spin_unlock(&rq->lock);
>>>       spin_unlock(&entity->lock);
>>>   }
>>> @@ -210,25 +213,23 @@ static void drm_sched_rq_init(struct 
>>> drm_gpu_scheduler *sched,
>>>   }
>>>   /**
>>> - * drm_sched_rq_add_entity - add an entity
>>> + * drm_sched_rq_add_entity_locked - add an entity
>>>    *
>>>    * @rq: scheduler run queue
>>>    * @entity: scheduler entity
>>>    *
>>>    * Adds a scheduler entity to the run queue.
>>>    */
>>> -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>> -                 struct drm_sched_entity *entity)
>>> +void drm_sched_rq_add_entity_locked(struct drm_sched_rq *rq,
>>> +                    struct drm_sched_entity *entity)
>>>   {
>>> +    lockdep_assert_held(&rq->lock);
>>> +
>>>       if (!list_empty(&entity->list))
>>>           return;
>>> -    spin_lock(&rq->lock);
>>> -
>>>       atomic_inc(rq->sched->score);
>>>       list_add_tail(&entity->list, &rq->entities);
>>> -
>>> -    spin_unlock(&rq->lock);
>>>   }
>>>   /**
>>> @@ -242,6 +243,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq 
>>> *rq,
>>>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>                   struct drm_sched_entity *entity)
>>>   {
>>> +    lockdep_assert_held(&entity->lock);
>>> +
>>>       if (list_empty(&entity->list))
>>>           return;
>>> @@ -254,7 +257,7 @@ void drm_sched_rq_remove_entity(struct 
>>> drm_sched_rq *rq,
>>>           rq->current_entity = NULL;
>>>       if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>> -        drm_sched_rq_remove_fifo_locked(entity);
>>> +        drm_sched_rq_remove_fifo_locked(entity, rq);
>>>       spin_unlock(&rq->lock);
>>>   }
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 5a1e4c803b90..2ad33e2fe2d2 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -591,13 +591,14 @@ bool drm_sched_dependency_optimized(struct 
>>> dma_fence* fence,
>>>                       struct drm_sched_entity *entity);
>>>   void drm_sched_fault(struct drm_gpu_scheduler *sched);
>>> -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>> -                 struct drm_sched_entity *entity);
>>> +void drm_sched_rq_add_entity_locked(struct drm_sched_rq *rq,
>>> +                    struct drm_sched_entity *entity);
>>>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>                   struct drm_sched_entity *entity);
>>>   void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, 
>>> ktime_t ts);
>>> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity 
>>> *entity, ktime_t ts);
>>> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>>> +                     struct drm_sched_rq *rq, ktime_t ts);
>>>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>                 enum drm_sched_priority priority,
>>

