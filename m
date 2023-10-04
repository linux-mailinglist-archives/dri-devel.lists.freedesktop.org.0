Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 160147B7ECA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 14:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5655F10E36B;
	Wed,  4 Oct 2023 12:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2048.outbound.protection.outlook.com [40.107.101.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23C610E118;
 Wed,  4 Oct 2023 12:10:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVeAeTe6O2DlZC+60QaNKqTq9Qagau2b6CvNHp+3kF5vo0eD5vaUyRQqHrx/tR4EG2/U9iO3L0/F2DKAb74tt09MUryrSsZF+YDpn6HqjGc1Bmf/3gZX8Yghqg4N+fCitX5/Jy0eLxQAJzlZdQQp4+uGLPX65mkCkZddvqhYMv/t0jxvTHVLJS7kDX/p8Xf/+EDtG984OMB8l12L/yjR+z0YLiKBjjQBuDkwxITjpiTzTgPR1w+9IVbslz5aUWIunxOx2+jJ05EFDOceRhq1E/RTVdw4uza5Fb/nLX2VKn2FjjjTXc01+gkWgX8dWxwrgEL49jKjmzpHXPEgpoT/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOQKgT9PcxoRXns3bof3ftv3MEaxcqQ3gr2GJv3up60=;
 b=ba44VYb4IIz6jVVTwfeO232ig6dcHvJ8MH6hddpwNp+zM1yvDPIoafmFrV9aCwO6k1grhi4VkcTXIFt9LrMRIet8lnOoiZ8KBMO3UQc8F4zJR0GkmObMmJKTLlH5sfJDkSw9rC3wYFIUS2KGcLoffRw0B9saKoHF7vEo+l+4koyhogflcTqI/KBefVXR3moJ/yFfMENqU4aOe3bYY1vr7FFE0PHW9UhWgDBdSS71FL9/+W9Q5Kax3yhhq4E09vVYFULEyx0EH0cp71V+F+5o8GZFLYatllw4ZPa77L7nBrvfQukDMrEL6FwSCrUGq7pNXyn7UaG6XXRnfjKReg1s8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOQKgT9PcxoRXns3bof3ftv3MEaxcqQ3gr2GJv3up60=;
 b=xAkuXNDVfTuDyf3ERt9baoV2NAshE1gCfF106JXIvNo2OZ5ITIuIIO9TfdyWEHAkWh1+7hr8PRWnqrVb26X9Ggku8r8R3u+8s4Q8u2sPELXdU93VJhXEbp5I4a3cSY3c1CnJAJXMCkgDw/jLT1roy/sjPB/dVWvEi9Qr1Sc9/5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 LV3PR12MB9187.namprd12.prod.outlook.com (2603:10b6:408:194::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Wed, 4 Oct
 2023 12:10:40 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5aa2:3605:1718:3332]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5aa2:3605:1718:3332%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 12:10:39 +0000
Message-ID: <b0afd174-2a52-40f0-9908-6f2e9161ae9d@amd.com>
Date: Wed, 4 Oct 2023 08:10:35 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/amd/display: Remove migrate_en/dis from
 dc_fpu_begin().
To: Harry Wentland <harry.wentland@amd.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20230921141516.520471-1-bigeasy@linutronix.de>
 <20230921141516.520471-2-bigeasy@linutronix.de>
 <ad5179f7-d2f6-4306-b70e-f0ae5cefcff6@amd.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <ad5179f7-d2f6-4306-b70e-f0ae5cefcff6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::46) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|LV3PR12MB9187:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e84c1c6-23e3-449d-18af-08dbc4d2eca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m7KFHJ1NA1m/Cgj5r5sq0K7kAiIkU5l6nBlpTA4YHv6KYKzE6sYDs6DGySbvhapZfog0XXgNLqZWNxe1xL0L3Zm+BgI6Dfw8UvuO90Ufwam8QLQFKIB0ie2m9zpvQg33/03zjZjqT7l/4Ex+mFR0xRxIQGa2NlQeXmveFnqPxW9svPPKRhBuQ2IU81mi1jS7Fed5+kvgLtSyLuCJ/+mXZj2cnFoOzYn7Y5EMsg+im0qbOse4am8eA4RPYVBstIIgv4WM9At49lXPl2oAWUFKpHSptq4cPno7+A+nN3Hbd34NZplI/cetRyoJfQkQuhMw2XJKQB24e9FvXTmyxC3vSqajgMEYFu/7AbGXarp2bc2T7yuE19ZyNmODUycEybDCqvzQXv30jkdGRhmHuweUu93enDc03bB1EUrDb6u9mNmrJt+tDEwE9x2wBnyrmv8Qf+WxpJPIrbGz5I40HsniJzpiDyAOEo1xlr9mEY1+oeeIIf9PvbGohDc2aOdeS1rDvsRis/qwLcA6WfjZuXPI12ENUMCyhoK6iaDLG1PELXFAjHpHy4LAIA4ZV1+QV/2Lh21CAD0ZcLVJ3EBqDNHjuVFV3QBJ8t9nHBJq/JTUj0CDr6RMTdj0BlZc/vlToEzA72DjgBzB+T29d3OjTNQCUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(346002)(366004)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(31686004)(6486002)(6506007)(53546011)(6666004)(478600001)(38100700002)(31696002)(83380400001)(86362001)(2906002)(110136005)(8676002)(26005)(2616005)(6512007)(36756003)(5660300002)(54906003)(66476007)(66556008)(44832011)(41300700001)(316002)(66946007)(4326008)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3BBOHlvM1lzUW14aDdBMlhHV0tLUDR3VXpWRldtSGFyTENYRUh3WGkzMzdu?=
 =?utf-8?B?NXZFTmNtRkhST0xnQ3dMeThhSWVkd2h5RWFiZXdSMi8xMVVlZEVyQzE4KzhN?=
 =?utf-8?B?d3ZMOU1VN2tKampHSWt4ajNTdTBDT2N0RktRNUtIK2FraVpJR1VWMFN0RVJ6?=
 =?utf-8?B?Z2dLSlJnTk00S2JXSCtISXpzUjQvYS84djdlcUswY1VtU0hTdHk5dVMyMjVv?=
 =?utf-8?B?dTA2MGk4K0JVM1VqYVRQL3RFemVucmJSRTVTcG94UEJ2ZWUxbWRTeStGUDB6?=
 =?utf-8?B?YzRSeGd0Njl0V29qSktVdkg3cWdBUVRlZU1mWE9vd3F3bkxOeFlmT0RvbCtM?=
 =?utf-8?B?eDFLZ0xPTWMwNnpMcXZVT1VuaDFWNjIyTzNLNEY3bUtVakdkS3NscklnVjAy?=
 =?utf-8?B?aUlRczI1eTE4WDZER3RmaVhVbng3eGtXT3BCbkd4UWN5WElTR3QxcDd3aTJQ?=
 =?utf-8?B?NHBNT2t2UDBrQnFlWHVHUXliWE1MdVlnZjI1czBJSmVYOFh5ZytOTWExUDBv?=
 =?utf-8?B?TncrTjI3SDZRMjBqRXVKQm5iRFpPYjNYZDNraWp1MnVRSnpzQTdQTStnQlQ2?=
 =?utf-8?B?SXNKYmNFSzRzVVRCcUpvcUVKSWxIY1dsOGcyUUUwYmdrRGFLL3l5R2VkaWZ4?=
 =?utf-8?B?NmdlcDU0eGE1ZFpETGVJVG1QaFB6UGo2ZzcyOFcyR1VwZnYrRFA4a2kyeG0y?=
 =?utf-8?B?eFFSWjludENKWEtTV3ZSNUpxVEoycTFyOEVjM1FSZmZNM2YwNi8vMXdRdHVS?=
 =?utf-8?B?OUVrWnhyY3RGUGhqbkRORVpFYVVEVnFqMWlZdHRZSGpiNUFIVEtXVmJhbWpD?=
 =?utf-8?B?cnRmam0xemlIb0RreG83aURiOGhVODNKa0Nzd2lIV01tUlgyRkNwWVVYcW82?=
 =?utf-8?B?NG1QbTF1MDRablEyNkdEdDRmanhEMytJUHpjS1ZubXM1SHZtelRxQk5CQVox?=
 =?utf-8?B?blI0c0ZuTmplbWRKWnRRR2xkaFlrdkpkUUR6RjI1NDZiR2x6RTcyZHZtKzlV?=
 =?utf-8?B?WGwwdk1ZNGlNZ3E3UVo5c1ExQXBqQThVQXJpdmdnNFVyVmdEOTcydGl4YXFx?=
 =?utf-8?B?MDhEbVo3WnpKWW0yM2owQlVWZk5scTRoZ00zTHRicHVRcEJRNFpjUVZZOHor?=
 =?utf-8?B?c25zWFU1ODRVM2FGc2tGMFBzSVpXZlNSQUgyWTdtMGppTFFKTnplSE5mWldK?=
 =?utf-8?B?MUFCQXhIczVvQ1g4T2ZjOXYvV2RGT0pIQUVydWRqMjdKall6WGwxQmNmdTk2?=
 =?utf-8?B?aFdhWkpRdUhYNWgxOGY4R1dYTTR6SlhJcXFQNTRzdmpBbE8rakhaQzRJUHhO?=
 =?utf-8?B?WDRWU1NnYXhkd280Q2o2Q1JTN2llaCt0K0lhUHF2SUtmM1JZNWY4UHYrWkNw?=
 =?utf-8?B?YjVFTUlsWXNzbW4wK2lhc2d0RlM3elBkTEFZMng1ZEZ0ZlFQY0lUSUpBaWYr?=
 =?utf-8?B?WCtiMzFJb3lDNVpBdVg5d1FWRjdNeU9FeS95Qm9pT2s4cjhQRkM4TnNrNFlu?=
 =?utf-8?B?cGZOMnhudElBZ2V5TmVua245TUIyQm52UHhZRnQ2YWZEQUJoQkJSU1BBN2ww?=
 =?utf-8?B?S0RZNUpSQ1hNYVRkemIyMnpJWUkrbld2c3NvV0dLcTVYZmFTK2J4b3VkeGtQ?=
 =?utf-8?B?Q0FDN1p0cHF1TWNwWFI0dzlKMVVZNlRxMlNmK21DYkZ5NHQxOUVNNE9oY2hB?=
 =?utf-8?B?OExBZUd1dHhnOTdSTnl0SldPYWVkdStEclZqYzVLNWU0Q28xcTE1d1h2cm1j?=
 =?utf-8?B?eEpsZElnYjIvV1JHYnBERS9YcnRTNVdTV2l5UzBhUzRWcWd3aVNjb3Z3cUZ0?=
 =?utf-8?B?VlVYNjdvUXR6c0IzeW5zQS85OFVlQXZENFdFK25mRmx6Wm1INUJJTDV6NDJm?=
 =?utf-8?B?RmE0UWFJRzY1clk2QVFnd2d6VXlyMzZYZmJPaU9uOVFUWkNuQytUbmJrU2sr?=
 =?utf-8?B?bjJrQ3g2MmppOWxtbHZ6UmRHdHE1NHVxUGRzaEFWTFhPL3dySGl5dWExTkpP?=
 =?utf-8?B?dm05ZEFwR2xYYkVTUTRycHFzNVBZNmZZYjRHK255NEJmdmFhdGltVmQ5MVhP?=
 =?utf-8?B?UmJEQkxwWmIzMHdoNmxzOGZ6cHRCTE5wUkYvQ1NUbm02aU1xbWRrNVBRQVlZ?=
 =?utf-8?Q?oHLbg0iTCF4+H1Mysi8Bx+u9A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e84c1c6-23e3-449d-18af-08dbc4d2eca3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 12:10:39.7446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: osXcrXjrFY4zrubc3p+BNEbvoRf9rySXLUjvwfLMD3pi6VgkfcceTqalwzhM0AZhfrKh70LTDPh7bYdDlyz4VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9187
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
Cc: Tianci Yin <tianci.yin@amd.com>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/3/23 15:53, Harry Wentland wrote:
> On 2023-09-21 10:15, Sebastian Andrzej Siewior wrote:
>> This is a revert of the commit mentioned below while it is not wrong, as
>> in the kernel will explode, having migrate_disable() here it is
>> complete waste of resources.
>>
>> Additionally commit message is plain wrong the review tag does not make
> 
> Not sure I follow what's unhelpful about the review tag with
> 0c316556d1249 ("drm/amd/display: Disable migration to ensure consistency of per-CPU variable")
> 
> I do wish the original patch showed the splat it's attempting
> to fix. It apparently made a difference for something, whether
> inadvertently or not. I wish I knew what that "something" was.

I did some digging, and it seems like the intention of that patch was to
fix the following splat:

WARNING: CPU: 5 PID: 1062 at 
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:71 
dc_assert_fp_enabled+0x1a/0x30 [amdgpu]
[...]
CPU: 5 PID: 1062 Comm: Xorg Tainted: G           OE 
5.15.0-56-generic #62-Ubuntu
Hardware name: ASUS System Product Name/ROG STRIX Z590-F GAMING WIFI, 
BIOS 1202 10/27/2021
RIP: 0010:dc_assert_fp_enabled+0x1a/0x30 [amdgpu]
Code: ff 45 31 f6 0f 0b e9 ca fe ff ff e8 90 1c 1f f7 48 c7 c0 00 30 03 
00 65 48 03 05 b1 aa 86 3f 8b 00 85 c0 7e 05 c3 cc cc cc cc <0f> 0b c3 
cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00
RSP: 0000:ffffb89b82a8f118 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff8c271cd00000 RCX: 0000000000000000
RDX: ffff8c2708025000 RSI: ffff8c270e8c0000 RDI: ffff8c271cd00000
RBP: ffffb89b82a8f1d0 R08: 0000000000000000 R09: 7fffff6affffffff
R10: ffffb89b82a8f240 R11: 0000000000000000 R12: 0000000000000002
R13: ffff8c271cd00000 R14: ffff8c270e8c0000 R15: ffff8c2708025000
FS:  00007f0570019a80(0000) GS:ffff8c2e3fb40000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005594858a0058 CR3: 000000010e204001 CR4: 0000000000770ee0
PKRU: 55555554
Call Trace:
  <TASK>
  ? dcn20_populate_dml_pipes_from_context+0x47/0x1730 [amdgpu]
  ? __kmalloc_node+0x2cb/0x3a0
  dcn32_populate_dml_pipes_from_context+0x2b/0x450 [amdgpu]
  dcn32_internal_validate_bw+0x15f9/0x2670 [amdgpu]
  dcn32_find_dummy_latency_index_for_fw_based_mclk_switch+0xd0/0x310 
[amdgpu]
  dcn32_calculate_wm_and_dlg_fpu+0xe6/0x1e50 [amdgpu]
  dcn32_calculate_wm_and_dlg+0x46/0x70 [amdgpu]
  dcn32_validate_bandwidth+0x1b7/0x3e0 [amdgpu]
  dc_validate_global_state+0x32c/0x560 [amdgpu]
  dc_validate_with_context+0x6e6/0xd80 [amdgpu]
  dc_commit_streams+0x21b/0x500 [amdgpu]
  dc_commit_state+0xf3/0x150 [amdgpu]
  amdgpu_dm_atomic_commit_tail+0x60d/0x3120 [amdgpu]
  ? dcn32_internal_validate_bw+0xcf8/0x2670 [amdgpu]
  ? fill_plane_buffer_attributes+0x1e5/0x560 [amdgpu]
  ? dcn32_validate_bandwidth+0x1e0/0x3e0 [amdgpu]
  ? kfree+0x1f7/0x250
  ? dcn32_validate_bandwidth+0x1e0/0x3e0 [amdgpu]
  ? dc_validate_global_state+0x32c/0x560 [amdgpu]
  ? __cond_resched+0x1a/0x50
  ? __wait_for_common+0x3e/0x150
  ? fill_plane_buffer_attributes+0x1e5/0x560 [amdgpu]
  ? usleep_range_state+0x90/0x90
  ? wait_for_completion_timeout+0x1d/0x30
  commit_tail+0xc2/0x170 [drm_kms_helper]
  ? drm_atomic_helper_swap_state+0x20f/0x370 [drm_kms_helper]
  drm_atomic_helper_commit+0x12b/0x150 [drm_kms_helper]
  amdgpu_dm_atomic_commit+0x11/0x20 [amdgpu]
  drm_atomic_commit+0x47/0x60 [drm]
  drm_mode_obj_set_property_ioctl+0x16b/0x420 [drm]
  ? mutex_lock+0x13/0x50
  ? drm_mode_createblob_ioctl+0xf6/0x130 [drm]
  ? drm_mode_obj_find_prop_id+0x90/0x90 [drm]
  drm_ioctl_kernel+0xb0/0x100 [drm]
  drm_ioctl+0x268/0x4b0 [drm]
  ? drm_mode_obj_find_prop_id+0x90/0x90 [drm]
  ? ktime_get_mono_fast_ns+0x4a/0xa0
  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu]
  __x64_sys_ioctl+0x92/0xd0
  do_syscall_64+0x59/0xc0
  ? do_user_addr_fault+0x1e7/0x670
  ? do_syscall_64+0x69/0xc0
  ? exit_to_user_mode_prepare+0x37/0xb0
  ? irqentry_exit_to_user_mode+0x9/0x20
  ? irqentry_exit+0x1d/0x30
  ? exc_page_fault+0x89/0x170
  entry_SYSCALL_64_after_hwframe+0x61/0xcb
RIP: 0033:0x7f05704a2aff
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 
44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 
3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
RSP: 002b:00007ffc8c45a3f0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ffc8c45a480 RCX: 00007f05704a2aff
RDX: 00007ffc8c45a480 RSI: 00000000c01864ba RDI: 000000000000000e
RBP: 00000000c01864ba R08: 0000000000000077 R09: 00000000cccccccc
R10: 00007f05705a22f0 R11: 0000000000000246 R12: 0000000000000004
R13: 000000000000000e R14: 000000000000000f R15: 00007ffc8c45a8a8
  </TASK>
---[ end trace 4deab30bb69df00f ]---

> 
> Harry
> 
>> it any better. The migrate_disable() interface has a fat comment
>> describing it and it includes the word "undesired" in the headline which
>> should tickle people to read it before using it.
>> Initially I assumed it is worded too harsh but now I beg to differ.
>>
>> The reviewer of the original commit, even not understanding what
>> migrate_disable() does should ask the following:
>>
>> - migrate_disable() is added only to the CONFIG_X86 block and it claims
>>    to protect fpu_recursion_depth. Why are the other the architectures
>>    excluded?
>>
>> - migrate_disable() is added after fpu_recursion_depth was modified.
>>    Shouldn't it be added before the modification or referencing takes
>>    place?
>>
>> Moving on.
>> Disabling preemption DOES prevent CPU migration. A task, that can not be
>> pushed away from the CPU by the scheduler (due to disabled preemption)
>> can not be pushed or migrated to another CPU.
>>
>> Disabling migration DOES NOT ensure consistency of per-CPU variables. It
>> only ensures that the task acts always on the same per-CPU variable. The
>> task remains preemptible meaning multiple tasks can access the same
>> per-CPU variable. This in turn leads to inconsistency for the statement
>>
>>                    *pcpu -= 1;
>>
>> with two tasks on one CPU and a preemption point during the RMW
>> operation:
>>
>>       Task A                           Task B
>>       read pcpu to reg  # 0
>>       inc reg           # 0 -> 1
>>                                        read pcpu to reg  # 0
>>                                        inc reg           # 0 -> 1
>>                                        write reg to pcpu # 1
>>       write reg to pcpu # 1
>>
>> At the end pcpu reads 1 but should read 2 instead. Boom.
>>
>> get_cpu_ptr() already contains a preempt_disable() statement. That means
>> that the per-CPU variable can only be referenced by a single task which
>> is currently running. The only inconsistency that can occur if the
>> variable is additionally accessed from an interrupt.
>>
>> Remove migrate_disable/enable() from dc_fpu_begin/end().
>>
>> Cc: Tianci Yin <tianci.yin@amd.com>
>> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
>> Fixes: 0c316556d1249 ("drm/amd/display: Disable migration to ensure consistency of per-CPU variable")
>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>> index 172aa10a8800f..86f4c0e046548 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>> @@ -91,7 +91,6 @@ void dc_fpu_begin(const char *function_name, const int line)
>>   
>>   	if (*pcpu == 1) {
>>   #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>> -		migrate_disable();
>>   		kernel_fpu_begin();
>>   #elif defined(CONFIG_PPC64)
>>   		if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
>> @@ -132,7 +131,6 @@ void dc_fpu_end(const char *function_name, const int line)
>>   	if (*pcpu <= 0) {
>>   #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>>   		kernel_fpu_end();
>> -		migrate_enable();
>>   #elif defined(CONFIG_PPC64)
>>   		if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
>>   			disable_kernel_vsx();
> 
-- 
Hamza

