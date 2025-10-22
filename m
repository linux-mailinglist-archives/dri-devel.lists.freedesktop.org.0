Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148CABFCFF2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 18:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2D610E8A9;
	Wed, 22 Oct 2025 16:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dtFHhLpP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010028.outbound.protection.outlook.com [52.101.61.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A1D10E8A4;
 Wed, 22 Oct 2025 16:00:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUEIwWqhK/e4mWhcSgxpEgAjOqWy7jRtEb+SO8cBAQkrIl/eeu9H7jwqVEdwpMBBDvGNFraa5SgQlZZdiipjbQ77djml3XtUxJvZ4wWhHLDFTPmFKxTO4LMZJmzUdSfgAzylv+dWz+zoQRQxAJui6Pm9XPmGXb1I/bBz6Qp8V2Ecwp9eMn4+mQYOcnty3EnF/GqklCcacYX17O+eA7hVcb7x63T6pDlvnuVSTQ5s3tFENIGr/dDZ8ahciI/16SQFFXPJihu8epgBVucEf5gCuIlrLqkLGhZ3L8lwXuKbTyLWfn4jviNxvgbONNT5+61xvIbYXKA3nBw67uJ+ezm3jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WLKvWu2JccH8gpfpGEJ5PCXJJd6F2xIx/xWrI6G3hE=;
 b=HCXEK5OY9yBKyv5BTZ245WBzghGOgMzxw5be5Jv1zSCQb2HR5CVeObJUSLHo+cLfyoAiyjPhIHRazyI0ONgVvtAiJSOsz2dP0/ZUL1abdPRGE6d9YAgPMX7fL1CsjMViR+eugpO+HA/PVf/uzqvHEzxB3P4aLWFaH3bofO+X/ONbEDQ+ZM3JGo7UUlnX5EojLOVcO+RpTJdkZQFrwBePcwYX6x7xqGWuavDeL5Clumhd5DbNc3Tatheivnqw6NdsD8eW9BgwSOh9I3GSbYlLPHOtgRxYdM8X8w23gM1fYHJtMG7nyspAu/sbzCP03P3lINUQN8atFbtyHGiDlap0Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WLKvWu2JccH8gpfpGEJ5PCXJJd6F2xIx/xWrI6G3hE=;
 b=dtFHhLpPkSQ3k/ACCyshAbDgQM1pVip8BZLiBwMd4KTnCXFlsXiYB4XQQLPpaeXvGkTjpArbMlx6bpHdZK44o4DecEHRD/OffrmcqIYdWZjCk4EebKmiBOqPqK2UMX+0x/VkaeCJrineVS316jPgqyylnpkArpkrNg5DqJO06pQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS7PR12MB5768.namprd12.prod.outlook.com (2603:10b6:8:77::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 16:00:53 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 16:00:53 +0000
Message-ID: <8567a4c0-f902-488b-88ff-21f0f901a265@amd.com>
Date: Wed, 22 Oct 2025 11:00:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amd: Manage frozen state internally
To: amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 dri-devel@lists.freedesktop.org, Linux PM <linux-pm@vger.kernel.org>
References: <20251022155114.48418-1-mario.limonciello@amd.com>
 <20251022155114.48418-3-mario.limonciello@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251022155114.48418-3-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS7PR12MB5768:EE_
X-MS-Office365-Filtering-Correlation-Id: 34bc141a-c450-48c3-f248-08de11842d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eldKN1BFbW5qL1dPWDUvM3RzZW14UWJDcVMvNGRlOHovNjNZcTVWNzRhdmFZ?=
 =?utf-8?B?OCsyYmVidVdybTVSSG1rQUJtK2dqckR5TmRVaG9kSi9VeHI4TDNnNERta1pa?=
 =?utf-8?B?YVJVT1RBc2todjZ5bVFLeTFSYTBFeHZLWVdzY1FwWWJjdkFNR1RNS1lVeWh3?=
 =?utf-8?B?Z1oreGhrbEZoYjJMYmw2MDFEWWs2T1VTS0hrZlArRGJyQWp3T1VDMUtIb09p?=
 =?utf-8?B?dEljVThNWDRRU1BTSWI0SndNdGNZSW9WZVVteDFiTmVmZEU2RjV4bzloUDZ4?=
 =?utf-8?B?eFdIakxxczY4dU5TaG5qMzVHU050YTI5L2t4QjZvN2NDS3h2ejcyMlhTK09W?=
 =?utf-8?B?UnZnYWs0S2xLL0orQ2QzbzN0RDl1T0k3K1lxc3FQQnVDOFBndC80NWh3RTc0?=
 =?utf-8?B?TnF0VUlTb05qNkdtWkp0WDExQmFxbkNGUFQvWTBJelFDeG9Qa25oSFFSa2h2?=
 =?utf-8?B?V3JmZkc3M0RKMGJPVXN0c2UwVnprb0VHTmhWT1UyNWEybzJ5ZkJPU3Z0UEU0?=
 =?utf-8?B?WENwYmN6Wi9SMFFjWXphUWxxWU1FQXc0V2lZODRwU2hFTUlJaVRDSU1aNFdx?=
 =?utf-8?B?aTJtMjBYd3ZPcjBaNlVqSVNXdCtveGR2c0hWN05NMVg5dGJLelVpS001Y1VD?=
 =?utf-8?B?YkdaeDgrRExYdzZCQkFEZzhHMWFGM1UzeVd4UXpzKzVyTmhZT0pLNis0Tnpm?=
 =?utf-8?B?M0h0K2ViL2UxWjlOeFkyZWI5NDltRGF2YUp1TmhPaC8vaVcwMnEyMHBqSEx1?=
 =?utf-8?B?L3BpUE5rTy9way9vVGFqRmlCeEdIY1VacWMrYUVyWnpMemdxTDRZWThBT2Jw?=
 =?utf-8?B?NGdHRU9kVHN2TktvQVhtSFo5dTdsa0d1MkdGK2pFN2MvdDhDY0VaTUhKZXlo?=
 =?utf-8?B?anluVnkzRWpaeVRNMDIyTUNaSThMVVBGeHRUWFJRV08wNGxCcDJONTkyOEU1?=
 =?utf-8?B?Z0plR0ZraGd1Rmcrd1prOUpZeFdPWWlLYkZhYmJYY0NFZFQ2clZ4ZWMvYTVm?=
 =?utf-8?B?Q2M3Z3NNbVUzWWxCUndWMndDOWZlRCsvek1CV1RPKzJ3L2xyK1Y1clpNSGxh?=
 =?utf-8?B?TFFCaFlaWVNUb1ZTVExZQ1VwZWxlMkZtWFJSc1RoSDczU0NYOE12Q1FjMWRj?=
 =?utf-8?B?K0hyVzl0cTJNeUt0WE5iVlIxSW91YUlkMXZlYUc5YUI5SkJuZ2YzNlZMaWFO?=
 =?utf-8?B?ekk5Q3djMmo3a3hpcG5DNnVwV2k2MCtIZE5xRExuL0JLRm0rdm00Vm9pYUNr?=
 =?utf-8?B?bjZ0VVNHdHYzWEFiNWZwN0RaRmxTSEpnNzBBSUJuSTYzUzZTVGtTTzJEcm1N?=
 =?utf-8?B?TE9peHJ5eWZlVjJQYjF0cURrajhIbkNjQytWaHJpaFp5ekVITWJyb08yalhw?=
 =?utf-8?B?bjRZTDh2Rks2NHVBUXRBaXZheDVFc2kzMnI5ZTF6TWJ3SjRaVWtTYWlDN1gy?=
 =?utf-8?B?cTB0cVNUSysrVER0MWRQMFBkWnN0bVhVT0VzTzJobU1XdDNQZ0JBQ2JPZDNZ?=
 =?utf-8?B?cmFtNzB4VWZPZms2Nk00bGZBaUw2aEExd05jdHlZLy92NHBVVFduTGhlaFpq?=
 =?utf-8?B?cFB4L0wyTmtwRkZSV3JKUk9pbHIzZkpMZy8vUjIyNkFiRDk1U2tWWU5hM3lF?=
 =?utf-8?B?VWJFVERaVUN2KzNGbFM1dWNwZUoxU2pTWm1HcXVZa1NjNEl3MDVyVEhOZ2JN?=
 =?utf-8?B?WnV2b3FpenNkanFMRzJCMGxiWDZyd1RYeVluYmw3QTV3L0pSWVlSdjM0TExP?=
 =?utf-8?B?WkVSSmxiMGwvVUlZbithdzhaZWIyWW51dUJ5L0VVekxoaVNvU05OMUtITHVy?=
 =?utf-8?B?UGZLT0VYbW9ic2RGNEpZSHVobHA5cjZ1RnQzcUxwUWwwMXQ3VElJWEhlOEYz?=
 =?utf-8?B?bkhqd2F2YlZQTEdTSnFYTG9MSzN1R3ZLeEFYVVhaVGFyb0V1MmUxdVBrNUJo?=
 =?utf-8?Q?3RRy/N9nl9HkSdCCSJJL+eqiIjimICXb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmNOeHFaL1E3S09Xa21JeTJiTXlmenYvelNraVFheFJnV1pOU0toa0gveVow?=
 =?utf-8?B?Ty9hVG50R1BwWlA3Y29obnJGMnRrZTRDSFFwWjByQ2s2OWQ2Y1FPZENxUW5y?=
 =?utf-8?B?UkxQVktqZFdSVWJvdlkzLzdSRk5kY1JneXc3amxydzFkTEZuWitVZWpEOWpu?=
 =?utf-8?B?UFh2bVZJVlZSOEtkS0lKeThyMVFiMGpvWW51RCtlZytOV1BSYXZadEY2eTVO?=
 =?utf-8?B?Z2JTR2NidnV6czh0RFZMQ3dFWW9yT1ZmNVpua0JzeGFtcGlRRFNRS1FJSlNZ?=
 =?utf-8?B?RlQvT1ZndDZMeExsb213QlhLcUNkVTBLeVpoQUFUYW1HVi9yYUhjNE9ZeGhM?=
 =?utf-8?B?ZkwyYUx4RGxSNk5zZGRxMmZ1N3VtbXl2ejJMTjBiYWo0cllJN0ZQa3RleXVK?=
 =?utf-8?B?cUxiaVgvWnNCMzlTalZPRHN2UVNFc1VvNlZnbHJlSXFxbFdETjhJZlpuRks5?=
 =?utf-8?B?S2ZZLytkWUFLVTYySVd4UFZwcVljWEJOTXl5VWZMemdXTGs0b0I1b2hiNzlK?=
 =?utf-8?B?U2V4MVFZZ1YwSlF2NEJYRDlac1doc2RhY3RZSm0rVkRzZjhhWDlxdHp6VGM4?=
 =?utf-8?B?MU5pVnhhT3hXZ0R1MTVCNS9iMlMzekNuNno4eksvOVJTQnVVVFdqS0VGbkdV?=
 =?utf-8?B?aHQ5V2pTVHVzRU56NHZRQkJWSTVaUElqQkRVck5FNm1DUlNjRWtyN3R0S0Nw?=
 =?utf-8?B?Mm1PRFJMQ2NxVU9JYlVBMHRyME9aR3JTUExHcFNQa1pLN2tMMGQ4SE5rR1Bl?=
 =?utf-8?B?RmF0cjVEczhsaU9ueWIwOGlIOVNHbUtvVGJINndMT3ZWZlNzOXRFb3k5a09z?=
 =?utf-8?B?VC9oWHhiRU5kaVN2RG9xak0rNzU1VmlhTnVtb2o3VXNJaWxXczY4TmkxbGZ5?=
 =?utf-8?B?b01udDZzSGVwZ2N4cDJ2MzArNDloV1hjSThBOE8rOXNUQWczd1k0dDZZOXBk?=
 =?utf-8?B?ZDNITGh6M0xQK2ZzRkFkZHZ4a2tuR1Nidlh5SUZpN2FBaW9MVk9wNU1PNlVq?=
 =?utf-8?B?TzRFdkZNaDAreVZkZUNlQm9rd3FIcFU3S3JzbGtBU0hPVmdaWFMySXJmaDl1?=
 =?utf-8?B?cTRiTFZ3b1pBZFM3dHl2UVZGVjMvb0VWakdwOEl3eVJ5bjIyT1NIYkozcHNV?=
 =?utf-8?B?cmp6SStSZ1J1cUJ4dVVoL0tZKytmNHIvbUZQSUVQWi9FT0hDcHl1K3ZhZXJ4?=
 =?utf-8?B?b2hMbHJwYnJuOWNodmd2ZUlVUUxUU1Jvb0E1TGE1amY1dlhnaGppMXEzbHF0?=
 =?utf-8?B?UXZKaS9HYjlxVFB3TnhQK3RqUHNyMlFFdDJkcGNQNndIRCtKZmtieVdHTlZi?=
 =?utf-8?B?UkFyZVNMQ3B3cEJpQWcwVzd2bGxhajJrSUxETlFIWFJqS2lXaE5oSFBCSUlO?=
 =?utf-8?B?N0hBRVhXWFltNENXR1FWMG5iU05xUWFZMUQyOXI4eXI5NWdNQUN2VTJyUCtJ?=
 =?utf-8?B?d0pTQjNlN2NBS01WSHJtYUFMcXlKZTNsaDhKSkROMldzM2pubHN6ZlpqWTE2?=
 =?utf-8?B?MzJjOTRRVHRKZys2ZXFkdkQrOWVNY0FxbmZJMlJFeUYvMHBUS25HQkxLRGFD?=
 =?utf-8?B?eXZtbkZhR0NFeGswVm5kSjdxbTN6dFg0SXlGcExObWthQ3pBY1ZaVW9ZQ0lx?=
 =?utf-8?B?V25HWHMvaVZqNU03LzkvSzdHQTZ5UzA4OGNxV3Z3eGRIY1FncjJ5NDEyOXhr?=
 =?utf-8?B?VngrTDRIM3J3cmwycmRKSzRhVVNES0srR25NYWlhZHFJZnFLTDZlcG4rQURH?=
 =?utf-8?B?a200NTFoQnFHeGxNOVlYL205Q2wvSlZMZGpva0dTeGZZbWw5dEdoWjFLV3d6?=
 =?utf-8?B?RWVaWWJzRnpKSU1CaWM1engxVGE5ZlFOcEorWlBuUTF3cWROWkVFV0pNTHZY?=
 =?utf-8?B?bU1pNTAwU25xUi9ZMTI2SFRTNHoxRytkUitVRUlCRW9pemhmQmlmbUdWQnZQ?=
 =?utf-8?B?WGp5N3hJYkdSTzJROHczVEN4THNrSWtmUS9lamR2NVd0UnVRcHdOZ1dNQktF?=
 =?utf-8?B?Rlducno0ZTNERndxV3ErdlNjZXpHSEszRkRKdXdtZXFkZXhrRVV6NUZqYnVR?=
 =?utf-8?B?WDd0K0lKdVp3ZkVDeXpmM0FiOEZMd0lKOHZWdGt6Skw3bDRWK3l6aERCb1kr?=
 =?utf-8?Q?qqXMw0rsKghyOBiYidiKWV9C3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34bc141a-c450-48c3-f248-08de11842d64
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 16:00:52.9560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ov9YHoEPQ9yntXzvmbF18LpeSgVtiqFJb5MNjQGrt2qxLCCb6Lf7XLkhyxtaJw0C8inuerNTDcXYoobdhtP1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5768
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

On 10/22/25 10:50 AM, Mario Limonciello wrote:
> From: "Mario Limonciello (AMD)" <superm1@kernel.org>
> 
> [Why]
> On a normal hibernate sequence amdgpu will skip the thaw step due to
> commit 530694f54dd5e ("drm/amdgpu: do not resume device in thaw for
> normal hibernation").
> 
> If the hibernate sequence has been aborted however after this thawed
> step runs the PM core will think the device is suspended and will skip
> the restore() sequence for amdgpu.  This leads to accessing the device
> while in a low power state and will freeze the system.
> 
> [How]
> Set `dev->power.is_frozen` to indicate to the PM core that an error
> code will be returned for thaw() callback because driver managed the
> frozen state.  If the restore() callback is called by the PM core the
> driver will resume the device.
> 
> Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---

Explicitly add Rafael and linux-pm as kw failed to do so (sorry).

Here is the lore link for patch 2:

https://lore.kernel.org/amd-gfx/20251022155114.48418-3-mario.limonciello@amd.com/

>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 ++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  2 +-
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 3d032c4e2dce..693347eb6861 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5247,6 +5247,11 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
>   	if (r)
>   		return r;
>   
> +#ifdef CONFIG_HIBERNATE_CALLBACKS
> +	if (adev->in_s4)
> +		dev->dev->power.is_frozen = 1;
> +#endif
> +
>   	return 0;
>   }
>   
> @@ -5385,6 +5390,11 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>   	if (amdgpu_acpi_smart_shift_update(adev, AMDGPU_SS_DEV_D0))
>   		dev_warn(adev->dev, "smart shift update failed\n");
>   
> +#ifdef CONFIG_HIBERNATE_CALLBACKS
> +	if (adev->in_s4)
> +		dev->dev->power.is_frozen = 0;
> +#endif
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 61268aa82df4..d40af069f24d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2681,7 +2681,7 @@ static int amdgpu_pmops_thaw(struct device *dev)
>   
>   	/* do not resume device if it's normal hibernation */
>   	if (!pm_hibernate_is_recovering() && !pm_hibernation_mode_is_suspend())
> -		return 0;
> +		return -EBUSY;
>   
>   	return amdgpu_device_resume(drm_dev, true);
>   }

