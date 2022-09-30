Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2745F0E14
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 16:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DF310ED47;
	Fri, 30 Sep 2022 14:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C813210ED4E;
 Fri, 30 Sep 2022 14:53:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JE47XfL5LelLvmmM4VMi30V3tDGnXXFAE64KkN1lQ/xPecK+mKajgRNhe7X9oLMlXo2G1owV7RFFbEBrlkUrM8m4sDqSyTpNCeChlpXK/eV5xK0ZFCPFvXcUH4VH2LV71qTlg0kDD3zRNIdqBBK+aFVsBeDK5/Hj5uzRAaRocV89dsLw+GVo/U3mdIg7cNmk9l9T8OzSt8rmWFK3OXGJmFRg83bMzJdPCM4ZJCXfEi1QvUviusyCRtgBoK9WZwzd8GlyOBJobqMivQMrzyGd5ieQmbBLJxqINsyBoYt3j0oEYHyVCdQ9AC8ldjDMaBG4f1V6OXqeX20/HyFB8AZxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtsOvY6r3yJhtgOe6TMMcpqluv1VGr9MbgVd3Z8/t1g=;
 b=doG3jmlxA+IvmrNgkITK9qHKnNbSx8VhK2fyOgDCEk1AlUO/sxMLW92EGneCENdFF34hNI8e2QjN/PlU9J62qse5kLsNAPWAKUlTWN3ua7Ahit0DvhLExNRBfZQxuYIVLSB8w0i/cnXcU7CQMl9CIpGy6p8Ai5qPrH3DBAjmS2cB1B9EJrnf5Hph1pRaRFgs8qXZ4AwsFHwJiDt2IMJN7d6U1F+xTIv9tbEkeamYGRA0FflKJIVYbmcg97BDCQsNkgr6NqwFGKZBtPa4yRXycUIGrwxaS3FhOpa+F42g0v6hvSWAWQFNGWtkPbPO/aTjguJr+Xwc5FJucKpDWXWpfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtsOvY6r3yJhtgOe6TMMcpqluv1VGr9MbgVd3Z8/t1g=;
 b=ZeUQL93GrbvaW0/f4/2idZxHIKK0n1SRl/a+hw5TiIAhVUzK8d8Ouk2sVjpHb51O4UqAgRRGeSd9giRca82tXGZALOtoA0C5b2VJeo4ut68JGRlcBAAS/AjVnrY9KbTO6N+GJdE1+1pJ5/N+pz7atHfYQ4LIEBVRM+ryuRBLElU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DS7PR12MB6285.namprd12.prod.outlook.com (2603:10b6:8:96::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Fri, 30 Sep 2022 14:53:16 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::8423:8031:a9f3:20d5]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::8423:8031:a9f3:20d5%8]) with mapi id 15.20.5676.017; Fri, 30 Sep 2022
 14:53:16 +0000
Message-ID: <e5b145ed-22c9-f641-1d8b-7b34ecf1fc9f@amd.com>
Date: Fri, 30 Sep 2022 10:53:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] drm/amd/display: Fix mutex lock in dcn10
To: Daniel Gomez <daniel@qtec.com>
References: <b21aa2e6-1b47-cdc1-307c-21fb331d4afb@amd.com>
 <20220925215320.644169-1-daniel@qtec.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20220925215320.644169-1-daniel@qtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR08CA0003.namprd08.prod.outlook.com
 (2603:10b6:208:239::8) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DS7PR12MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e75286-6bee-40e0-27bf-08daa2f38156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YR4k0wzG65pcmIOpavsca9YFA0cGI0/2vT3BSBsr0a3MhJEX7CGZKgzqfIWHqtErvstzvSE3PRlC0Xfw4CPpnzMOmCyn8eP2DGSel2gygPkj3N4bVug0qDRnPntuFkxiGfhaG7H5lJAq3efmYQOhnOUGfLSSIj0zue7XMnu0AJmp34XZiP43dQWlkyktil2r/TmsGsjqL3AH0VbM0nBZkw2ELUHUiTuquToxowVcXiEmrFt4A9vEQaL1aibAam5S851K7PaAfPwMevwqpoWghoahjXXTv64rvdTGlOElDLCbEj+EQ2iyTJNWVthGy3Atv4FJHzW/lVRbQ26ws6BylP+Q41Rrl/y67CO+9TxYa9O38LiE6zFN1IAEkJEOozjnQlXCU24MupzlCOT/bFcvs36Z5mLJGXGE6swKujwJgsAgPCr7Xd14RxaMylkQROmjJxAmme6ko3NpA9v3754k+CxKfg59uygF4bd97Fz5EgCzbhPjLdu0qRY/f1+h50Q77UubbfxiGxXjFCoXcum2Ui1NGZvxZXBU2WNovg2v0lrG05+41lHgBceCV/QRlRRDykGN6VeoZlLSq3dmJuLg79l/0ri38bfzuGsWpLNG5aETF+eJPczUFBGgu5e8F1hDa8v3PWChrGsWGSPH+2pLwvK4DP7pYgkKYkYg1yWyEYTVvC/i24pj3qoMExp39O+WtRMyKeqdsCx9PV+DFi9Mj0/J8S6mfZhgHRnINIzAyF7bbBEg0D04064WycQVl/m2tPSgrZviWNpcpsoAqXaFHolp9DotS37nrP0/9mRfv1U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199015)(83380400001)(8676002)(86362001)(2616005)(26005)(2906002)(36756003)(4326008)(6506007)(66946007)(66556008)(6486002)(478600001)(6916009)(66476007)(8936002)(316002)(44832011)(30864003)(38100700002)(6512007)(41300700001)(7416002)(54906003)(53546011)(186003)(5660300002)(31686004)(6666004)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akp6N1h5Rit3ZTFIVjNwVm4wWENCTURsb3pVQzJLbWZ2VW81ci95dFZNSDhy?=
 =?utf-8?B?cHVwZ0Zoajg4S3U1UE1NRWNjRW9CRkpGOG1RSlZ0WjZYdklaQzlwNXpJY3pH?=
 =?utf-8?B?Vml1UGQ4OFpKTzdRYkwwLzg0K3ZrMzRMRGZBaVBrUmdZVlVBVkpzVWlURnM4?=
 =?utf-8?B?bFY1M0lGbHFzTlRtc0JuL2NJdENCQUh6SE1zcXRhZUI5ZlVvUTBSd0pXRlc1?=
 =?utf-8?B?RUtaZDJzS281bXZTdHJYOElod0UzUUNYNnBZZmEyTjQycmJKMTA1bDFmT0V6?=
 =?utf-8?B?WS9tOFhEQlRwUyszOUROTFRrSnlNVlVIajdoRmcwVXBhcVA5YW5OTkdrL1Y3?=
 =?utf-8?B?cTVSZDhCelZUZ1FrVm4yMGRpSlZzdXBsWExtc0JmYmNKVnU5RmhySVhWQ1VX?=
 =?utf-8?B?Vm5CU0ZRLzBFMEtydThjQUhWbThZNlB0UW1sQ0VlQThBLzAvQXlOVFJSWTR0?=
 =?utf-8?B?WTJUcVJtQjR3QkQ3b1FKWGhNNW9qVjNuQnR4d2xaOWhmS2oxNUJXUFlzcDgr?=
 =?utf-8?B?K2lxMzZnNENQWE1Vdy9JNnc3bWp0WTZRQysvY0MwWkxWQ1BWU3BKTFlGemlW?=
 =?utf-8?B?K2RYckQrMjJ0RVVvTUUzRXlOQ1doZHZ2WXZob2pDajVpempoazI4d2ZIUHVE?=
 =?utf-8?B?aSsxNWJJcWExRTBMakhpVlBwVlZPZDFrYWxHVm4zSTE5c1dDLy9QOVVqV0U0?=
 =?utf-8?B?cDBkbTJJRFRtVlQxUHR2U1QwWkU1bzl4ZTJQRkZKQ29RWmdJc2QvbUhtWUNi?=
 =?utf-8?B?aXZuOVhPVmpRbzlUSkRCSWtOVzhIUngvenpkQ1hCcFZBdS9FTXBuVFpoSVF3?=
 =?utf-8?B?blV4VThiMzRlQmtNbEIyV0VJM1ppaUdHdUJWaGFrc2sybmhJL2FPVk5VVjhL?=
 =?utf-8?B?aTY5OFhVK3lFMTNvNXhaZTZmUmRxTHpWT1BSbDlCN3FwbmFYRUNRRnJpdXo1?=
 =?utf-8?B?cE9jZGFLQWJ5NGF1aEM5c0RjMGk5QmxIT0NLYk8vZTBXcldSczZ0K1FQYWI4?=
 =?utf-8?B?RU8rQUdhZms3K1NrYXVIS0JmQmU1NlNLVjd3Y0owV3BYZGViY001NWFYZlVC?=
 =?utf-8?B?QmZuZzQ0OUVEN3FOblJseFpobnJDQkhiQnpIaGJkVnBpbGpNbFlKeEFtdHA5?=
 =?utf-8?B?Z3VtcTk4OXI1TmpZSUxIUHM0dWNxR0NON3dRSXM0aDFHcExBR1VFMmlVblhj?=
 =?utf-8?B?WkZFWXFWdjRBZVozYTYzbmU2dUJzVjI4WGxjU1pEem9oajZpUk0vdC9RdTcx?=
 =?utf-8?B?YmVlWDd0M3hlY0RsRGtNQTk3aGlNbGk1WDlWZTdhamVmTzluK1NIaUs0RExp?=
 =?utf-8?B?SzcxWTVJcVJmSFlsL0ZYZjBQVmFCTGtHUkM5UGk5eU1tZDk3STU3NnRISDg5?=
 =?utf-8?B?SGpuUjRmMCt4UXBSbktONEpQTkQvSklrdU11ZUZhUUhkbmRjQVFVajBDNkZu?=
 =?utf-8?B?R0xIRkJFZUFWUHNMcjRzbjh3ZFVyTXpWN3kvMXJJejgyMi85S0RFdnNPZXhQ?=
 =?utf-8?B?eEFnVWVhbE0zV251WVlDdUdoV3ZaLzBRRDdvVGdEdUlPUk1JY0VrUUNXZTZG?=
 =?utf-8?B?VzZhcGM4UkVTa0FxY3dYd1RBdC9haW1TSTBiTWZkYWo4V2Yrc254Y1NuanBv?=
 =?utf-8?B?M1lCelkwd092VEh2RzhDN3FlQmE1bkR6WUluMGMxMVREanlMbGoya3lQTGIv?=
 =?utf-8?B?MDZoaGk0N0c3OVBxWVFmcTB3dEkyc29UZk9nSWMyNlhYdElxMndCTDBiRTdW?=
 =?utf-8?B?Y1J3RlR3dXkrZ3RvaEs2dUM2ZStsZDNpblJIS2U5QTJnUGYwN1Q4ZlJyclcz?=
 =?utf-8?B?empKeENhMzVhNm5JNE1iUlliUlVhV3ZXQUVVZktyNTh5OGl3NUdISGZvUCto?=
 =?utf-8?B?UTRON3I4MVlJWGZRY1NhZjE4MDI0c0cvTkZacVIvdjlJWS9ZN1RwOW1kM2xX?=
 =?utf-8?B?WDZnK3RLaTFuRk9ZWnNqN04vTHJ3c3JBUTVwcG1hN0NkRGx4VU92N2dJdDd1?=
 =?utf-8?B?ZlIvVWVDWkwyUG96RFBtUitaVkxrMWVSU0UzV2N6UkRzOG01b3g4S1VxSy80?=
 =?utf-8?B?eXpEYmdRTloweXlPRzlCZUxpcFhDL1FtMW5NOU1vZllRQUZ2WFFsL3FFN25v?=
 =?utf-8?Q?oT8dGkoudZL9jbr72GutrcH8q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e75286-6bee-40e0-27bf-08daa2f38156
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 14:53:15.9175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSnf2hKzQK66MDIKT9YyedzFXqvzlQhwAUgWja+yAwLQTy/9F7T8u+R5Fb16zevR6IY9yVAzDZhePfboOUtFxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6285
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
Cc: Bernard Zhao <bernard@vivo.com>, dri-devel@lists.freedesktop.org,
 Roman Li <Roman.Li@amd.com>, Yi-Ling Chen <Yi-Ling.Chen2@amd.com>,
 Isabella Basso <isabbasso@riseup.net>, Anthony Koo <Anthony.Koo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Ahmad Othman <Ahmad.Othman@amd.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Alan Liu <HaoPing.Liu@amd.com>,
 Alex Hung <alex.hung@amd.com>, Duncan Ma <duncan.ma@amd.com>,
 Becle Lee <becle.lee@amd.com>, Melissa Wen <mwen@igalia.com>, dagmcr@gmail.com,
 "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>,
 Agustin Gutierrez <agustin.gutierrez@amd.com>,
 Sung Joon Kim <Sungjoon.Kim@amd.com>, David Zhang <dingchen.zhang@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Zhan Liu <Zhan.Liu@amd.com>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied. Thanks!

On 2022-09-25 17:53, Daniel Gomez wrote:
> Removal of DC_FP_* wrappers from dml (9696679bf7ac) provokes a mutex
> lock [2] on the amdgpu driver. Re-arrange the dcn10 code to avoid
> locking the mutex by placing the DC_FP_* wrappers around the proper
> functions.
> 
> This fixes the following WARN/stacktrace:
> 
> BUG: sleeping function called from invalid context at kernel/locking/mutex.c:283
> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 227, name: systemd-udevd
> preempt_count: 1, expected: 0
> CPU: 4 PID: 227 Comm: systemd-udevd Not tainted 6.0.0-rc6-qtec-standard #2
> Hardware name: Qtechnology A/S QT5222/QT5221, BIOS v1.0.1 06/07/2021
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0x33/0x42
>   __might_resched.cold.172+0xa5/0xb3
>   mutex_lock+0x1a/0x40
>   amdgpu_dpm_get_clock_by_type_with_voltage+0x38/0x70 [amdgpu]
>   dm_pp_get_clock_levels_by_type_with_voltage+0x64/0xa0 [amdgpu]
>   dcn_bw_update_from_pplib+0x70/0x340 [amdgpu]
>   dcn10_create_resource_pool+0x8c8/0xd20 [amdgpu]
>   ? __kmalloc+0x1c7/0x4a0
>   dc_create_resource_pool+0xe7/0x190 [amdgpu]
>   dc_create+0x212/0x5d0 [amdgpu]
>   amdgpu_dm_init+0x246/0x370 [amdgpu]
>   ? schedule_hrtimeout_range_clock+0x93/0x120
>   ? phm_wait_for_register_unequal.part.1+0x4a/0x80 [amdgpu]
>   dm_hw_init+0xe/0x20 [amdgpu]
>   amdgpu_device_init.cold.56+0x1324/0x1653 [amdgpu]
>   ? pci_bus_read_config_word+0x43/0x80
>   amdgpu_driver_load_kms+0x15/0x120 [amdgpu]
>   amdgpu_pci_probe+0x116/0x320 [amdgpu]
>   pci_device_probe+0x97/0x110
>   really_probe+0xdd/0x340
>   __driver_probe_device+0x80/0x170
>   driver_probe_device+0x1f/0x90
>   __driver_attach+0xdc/0x180
>   ? __device_attach_driver+0x100/0x100
>   ? __device_attach_driver+0x100/0x100
>   bus_for_each_dev+0x74/0xc0
>   bus_add_driver+0x19e/0x210
>   ? kset_find_obj+0x30/0xa0
>   ? 0xffffffffa0a5b000
>   driver_register+0x6b/0xc0
>   ? 0xffffffffa0a5b000
>   do_one_initcall+0x4a/0x1f0
>   ? __vunmap+0x28e/0x2f0
>   ? __cond_resched+0x15/0x30
>   ? kmem_cache_alloc_trace+0x3d/0x440
>   do_init_module+0x4a/0x1e0
>   load_module+0x1cba/0x1e10
>   ? __do_sys_finit_module+0xb7/0x120
>   __do_sys_finit_module+0xb7/0x120
>   do_syscall_64+0x3c/0x80
>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7ff2b5f5422d
> Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48
> 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48>
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c3 ab 0e 00 f7 d8 64 89 01 48
> RSP: 002b:00007ffc44ab28e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> RAX: ffffffffffffffda RBX: 0000555c566a9240 RCX: 00007ff2b5f5422d
> RDX: 0000000000000000 RSI: 00007ff2b60bb353 RDI: 0000000000000019
> RBP: 00007ff2b60bb353 R08: 0000000000000000 R09: 0000555c566a9240
> R10: 0000000000000019 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000020000 R14: 0000000000000000 R15: 0000000000000000
> </TASK>
> 
> Fixes: 9696679bf7ac ("drm/amd/display: remove DC_FP_* wrapper from
> dml folder")
> Signed-off-by: Daniel Gomez <daniel@qtec.com>
> ---
>   .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  12 +-
>   .../drm/amd/display/dc/dcn10/dcn10_resource.c |  66 +++++++++-
>   .../drm/amd/display/dc/dml/calcs/dcn_calcs.c  | 118 ++++++++----------
>   .../gpu/drm/amd/display/dc/inc/dcn_calcs.h    |  19 ++-
>   4 files changed, 138 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> index 5b5d952b2b8c..cb1e06d62841 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> @@ -2994,6 +2994,7 @@ void dcn10_prepare_bandwidth(
>   {
>   	struct dce_hwseq *hws = dc->hwseq;
>   	struct hubbub *hubbub = dc->res_pool->hubbub;
> +	int min_fclk_khz, min_dcfclk_khz, socclk_khz;
>   
>   	if (dc->debug.sanity_checks)
>   		hws->funcs.verify_allow_pstate_change_high(dc);
> @@ -3016,8 +3017,11 @@ void dcn10_prepare_bandwidth(
>   
>   	if (dc->debug.pplib_wm_report_mode == WM_REPORT_OVERRIDE) {
>   		DC_FP_START();
> -		dcn_bw_notify_pplib_of_wm_ranges(dc);
> +		dcn_get_soc_clks(
> +			dc, &min_fclk_khz, &min_dcfclk_khz, &socclk_khz);
>   		DC_FP_END();
> +		dcn_bw_notify_pplib_of_wm_ranges(
> +			dc, min_fclk_khz, min_dcfclk_khz, socclk_khz);
>   	}
>   
>   	if (dc->debug.sanity_checks)
> @@ -3030,6 +3034,7 @@ void dcn10_optimize_bandwidth(
>   {
>   	struct dce_hwseq *hws = dc->hwseq;
>   	struct hubbub *hubbub = dc->res_pool->hubbub;
> +	int min_fclk_khz, min_dcfclk_khz, socclk_khz;
>   
>   	if (dc->debug.sanity_checks)
>   		hws->funcs.verify_allow_pstate_change_high(dc);
> @@ -3053,8 +3058,11 @@ void dcn10_optimize_bandwidth(
>   
>   	if (dc->debug.pplib_wm_report_mode == WM_REPORT_OVERRIDE) {
>   		DC_FP_START();
> -		dcn_bw_notify_pplib_of_wm_ranges(dc);
> +		dcn_get_soc_clks(
> +			dc, &min_fclk_khz, &min_dcfclk_khz, &socclk_khz);
>   		DC_FP_END();
> +		dcn_bw_notify_pplib_of_wm_ranges(
> +			dc, min_fclk_khz, min_dcfclk_khz, socclk_khz);
>   	}
>   
>   	if (dc->debug.sanity_checks)
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> index 174eebbe8b4f..a18a5b56ca7d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> @@ -1336,6 +1336,21 @@ static noinline void dcn10_resource_construct_fp(
>   	}
>   }
>   
> +static bool verify_clock_values(struct dm_pp_clock_levels_with_voltage *clks)
> +{
> +	int i;
> +
> +	if (clks->num_levels == 0)
> +		return false;
> +
> +	for (i = 0; i < clks->num_levels; i++)
> +		/* Ensure that the result is sane */
> +		if (clks->data[i].clocks_in_khz == 0)
> +			return false;
> +
> +	return true;
> +}
> +
>   static bool dcn10_resource_construct(
>   	uint8_t num_virtual_links,
>   	struct dc *dc,
> @@ -1345,6 +1360,9 @@ static bool dcn10_resource_construct(
>   	int j;
>   	struct dc_context *ctx = dc->ctx;
>   	uint32_t pipe_fuses = read_pipe_fuses(ctx);
> +	struct dm_pp_clock_levels_with_voltage fclks = {0}, dcfclks = {0};
> +	int min_fclk_khz, min_dcfclk_khz, socclk_khz;
> +	bool res;
>   
>   	ctx->dc_bios->regs = &bios_regs;
>   
> @@ -1505,15 +1523,53 @@ static bool dcn10_resource_construct(
>   			&& pool->base.pp_smu->rv_funcs.set_pme_wa_enable != NULL)
>   		dc->debug.az_endpoint_mute_only = false;
>   
> -	DC_FP_START();
> -	if (!dc->debug.disable_pplib_clock_request)
> -		dcn_bw_update_from_pplib(dc);
> +
> +	if (!dc->debug.disable_pplib_clock_request) {
> +		/*
> +		 * TODO: This is not the proper way to obtain
> +		 * fabric_and_dram_bandwidth, should be min(fclk, memclk).
> +		 */
> +		res = dm_pp_get_clock_levels_by_type_with_voltage(
> +				ctx, DM_PP_CLOCK_TYPE_FCLK, &fclks);
> +
> +		DC_FP_START();
> +
> +		if (res)
> +			res = verify_clock_values(&fclks);
> +
> +		if (res)
> +			dcn_bw_update_from_pplib_fclks(dc, &fclks);
> +		else
> +			BREAK_TO_DEBUGGER();
> +
> +		DC_FP_END();
> +
> +		res = dm_pp_get_clock_levels_by_type_with_voltage(
> +			ctx, DM_PP_CLOCK_TYPE_DCFCLK, &dcfclks);
> +
> +		DC_FP_START();
> +
> +		if (res)
> +			res = verify_clock_values(&dcfclks);
> +
> +		if (res)
> +			dcn_bw_update_from_pplib_dcfclks(dc, &dcfclks);
> +		else
> +			BREAK_TO_DEBUGGER();
> +
> +		DC_FP_END();
> +	}
> +
>   	dcn_bw_sync_calcs_and_dml(dc);
>   	if (!dc->debug.disable_pplib_wm_range) {
>   		dc->res_pool = &pool->base;
> -		dcn_bw_notify_pplib_of_wm_ranges(dc);
> +		DC_FP_START();
> +		dcn_get_soc_clks(
> +			dc, &min_fclk_khz, &min_dcfclk_khz, &socclk_khz);
> +		DC_FP_END();
> +		dcn_bw_notify_pplib_of_wm_ranges(
> +			dc, min_fclk_khz, min_dcfclk_khz, socclk_khz);
>   	}
> -	DC_FP_END();
>   
>   	{
>   		struct irq_service_init_data init_data;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
> index db3b16b77034..7d3394470352 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
> @@ -1464,81 +1464,67 @@ unsigned int dcn_find_dcfclk_suits_all(
>   	return dcf_clk;
>   }
>   
> -static bool verify_clock_values(struct dm_pp_clock_levels_with_voltage *clks)
> +void dcn_bw_update_from_pplib_fclks(
> +	struct dc *dc,
> +	struct dm_pp_clock_levels_with_voltage *fclks)
>   {
> -	int i;
> -
> -	if (clks->num_levels == 0)
> -		return false;
> -
> -	for (i = 0; i < clks->num_levels; i++)
> -		/* Ensure that the result is sane */
> -		if (clks->data[i].clocks_in_khz == 0)
> -			return false;
> +	unsigned vmin0p65_idx, vmid0p72_idx, vnom0p8_idx, vmax0p9_idx;
>   
> -	return true;
> +	ASSERT(fclks->num_levels);
> +
> +	vmin0p65_idx = 0;
> +	vmid0p72_idx = fclks->num_levels -
> +		(fclks->num_levels > 2 ? 3 : (fclks->num_levels > 1 ? 2 : 1));
> +	vnom0p8_idx = fclks->num_levels - (fclks->num_levels > 1 ? 2 : 1);
> +	vmax0p9_idx = fclks->num_levels - 1;
> +
> +	dc->dcn_soc->fabric_and_dram_bandwidth_vmin0p65 =
> +		32 * (fclks->data[vmin0p65_idx].clocks_in_khz / 1000.0) / 1000.0;
> +	dc->dcn_soc->fabric_and_dram_bandwidth_vmid0p72 =
> +		dc->dcn_soc->number_of_channels *
> +		(fclks->data[vmid0p72_idx].clocks_in_khz / 1000.0)
> +		* ddr4_dram_factor_single_Channel / 1000.0;
> +	dc->dcn_soc->fabric_and_dram_bandwidth_vnom0p8 =
> +		dc->dcn_soc->number_of_channels *
> +		(fclks->data[vnom0p8_idx].clocks_in_khz / 1000.0)
> +		* ddr4_dram_factor_single_Channel / 1000.0;
> +	dc->dcn_soc->fabric_and_dram_bandwidth_vmax0p9 =
> +		dc->dcn_soc->number_of_channels *
> +		(fclks->data[vmax0p9_idx].clocks_in_khz / 1000.0)
> +		* ddr4_dram_factor_single_Channel / 1000.0;
>   }
>   
> -void dcn_bw_update_from_pplib(struct dc *dc)
> +void dcn_bw_update_from_pplib_dcfclks(
> +	struct dc *dc,
> +	struct dm_pp_clock_levels_with_voltage *dcfclks)
>   {
> -	struct dc_context *ctx = dc->ctx;
> -	struct dm_pp_clock_levels_with_voltage fclks = {0}, dcfclks = {0};
> -	bool res;
> -	unsigned vmin0p65_idx, vmid0p72_idx, vnom0p8_idx, vmax0p9_idx;
> -
> -	/* TODO: This is not the proper way to obtain fabric_and_dram_bandwidth, should be min(fclk, memclk) */
> -	res = dm_pp_get_clock_levels_by_type_with_voltage(
> -			ctx, DM_PP_CLOCK_TYPE_FCLK, &fclks);
> -
> -	if (res)
> -		res = verify_clock_values(&fclks);
> -
> -	if (res) {
> -		ASSERT(fclks.num_levels);
> -
> -		vmin0p65_idx = 0;
> -		vmid0p72_idx = fclks.num_levels -
> -			(fclks.num_levels > 2 ? 3 : (fclks.num_levels > 1 ? 2 : 1));
> -		vnom0p8_idx = fclks.num_levels - (fclks.num_levels > 1 ? 2 : 1);
> -		vmax0p9_idx = fclks.num_levels - 1;
> -
> -		dc->dcn_soc->fabric_and_dram_bandwidth_vmin0p65 =
> -			32 * (fclks.data[vmin0p65_idx].clocks_in_khz / 1000.0) / 1000.0;
> -		dc->dcn_soc->fabric_and_dram_bandwidth_vmid0p72 =
> -			dc->dcn_soc->number_of_channels *
> -			(fclks.data[vmid0p72_idx].clocks_in_khz / 1000.0)
> -			* ddr4_dram_factor_single_Channel / 1000.0;
> -		dc->dcn_soc->fabric_and_dram_bandwidth_vnom0p8 =
> -			dc->dcn_soc->number_of_channels *
> -			(fclks.data[vnom0p8_idx].clocks_in_khz / 1000.0)
> -			* ddr4_dram_factor_single_Channel / 1000.0;
> -		dc->dcn_soc->fabric_and_dram_bandwidth_vmax0p9 =
> -			dc->dcn_soc->number_of_channels *
> -			(fclks.data[vmax0p9_idx].clocks_in_khz / 1000.0)
> -			* ddr4_dram_factor_single_Channel / 1000.0;
> -	} else
> -		BREAK_TO_DEBUGGER();
> -
> -	res = dm_pp_get_clock_levels_by_type_with_voltage(
> -			ctx, DM_PP_CLOCK_TYPE_DCFCLK, &dcfclks);
> -
> -	if (res)
> -		res = verify_clock_values(&dcfclks);
> +	if (dcfclks->num_levels >= 3) {
> +		dc->dcn_soc->dcfclkv_min0p65 = dcfclks->data[0].clocks_in_khz / 1000.0;
> +		dc->dcn_soc->dcfclkv_mid0p72 = dcfclks->data[dcfclks->num_levels - 3].clocks_in_khz / 1000.0;
> +		dc->dcn_soc->dcfclkv_nom0p8 = dcfclks->data[dcfclks->num_levels - 2].clocks_in_khz / 1000.0;
> +		dc->dcn_soc->dcfclkv_max0p9 = dcfclks->data[dcfclks->num_levels - 1].clocks_in_khz / 1000.0;
> +	}
> +}
>   
> -	if (res && dcfclks.num_levels >= 3) {
> -		dc->dcn_soc->dcfclkv_min0p65 = dcfclks.data[0].clocks_in_khz / 1000.0;
> -		dc->dcn_soc->dcfclkv_mid0p72 = dcfclks.data[dcfclks.num_levels - 3].clocks_in_khz / 1000.0;
> -		dc->dcn_soc->dcfclkv_nom0p8 = dcfclks.data[dcfclks.num_levels - 2].clocks_in_khz / 1000.0;
> -		dc->dcn_soc->dcfclkv_max0p9 = dcfclks.data[dcfclks.num_levels - 1].clocks_in_khz / 1000.0;
> -	} else
> -		BREAK_TO_DEBUGGER();
> +void dcn_get_soc_clks(
> +	struct dc *dc,
> +	int *min_fclk_khz,
> +	int *min_dcfclk_khz,
> +	int *socclk_khz)
> +{
> +	*min_fclk_khz = dc->dcn_soc->fabric_and_dram_bandwidth_vmin0p65 * 1000000 / 32;
> +	*min_dcfclk_khz = dc->dcn_soc->dcfclkv_min0p65 * 1000;
> +	*socclk_khz = dc->dcn_soc->socclk * 1000;
>   }
>   
> -void dcn_bw_notify_pplib_of_wm_ranges(struct dc *dc)
> +void dcn_bw_notify_pplib_of_wm_ranges(
> +	struct dc *dc,
> +	int min_fclk_khz,
> +	int min_dcfclk_khz,
> +	int socclk_khz)
>   {
>   	struct pp_smu_funcs_rv *pp = NULL;
>   	struct pp_smu_wm_range_sets ranges = {0};
> -	int min_fclk_khz, min_dcfclk_khz, socclk_khz;
>   	const int overdrive = 5000000; /* 5 GHz to cover Overdrive */
>   
>   	if (dc->res_pool->pp_smu)
> @@ -1546,10 +1532,6 @@ void dcn_bw_notify_pplib_of_wm_ranges(struct dc *dc)
>   	if (!pp || !pp->set_wm_ranges)
>   		return;
>   
> -	min_fclk_khz = dc->dcn_soc->fabric_and_dram_bandwidth_vmin0p65 * 1000000 / 32;
> -	min_dcfclk_khz = dc->dcn_soc->dcfclkv_min0p65 * 1000;
> -	socclk_khz = dc->dcn_soc->socclk * 1000;
> -
>   	/* Now notify PPLib/SMU about which Watermarks sets they should select
>   	 * depending on DPM state they are in. And update BW MGR GFX Engine and
>   	 * Memory clock member variables for Watermarks calculations for each
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h b/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
> index 806f3041db14..9e4ddc985240 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
> @@ -628,8 +628,23 @@ unsigned int dcn_find_dcfclk_suits_all(
>   	const struct dc *dc,
>   	struct dc_clocks *clocks);
>   
> -void dcn_bw_update_from_pplib(struct dc *dc);
> -void dcn_bw_notify_pplib_of_wm_ranges(struct dc *dc);
> +void dcn_get_soc_clks(
> +		struct dc *dc,
> +		int *min_fclk_khz,
> +		int *min_dcfclk_khz,
> +		int *socclk_khz);
> +
> +void dcn_bw_update_from_pplib_fclks(
> +		struct dc *dc,
> +		struct dm_pp_clock_levels_with_voltage *fclks);
> +void dcn_bw_update_from_pplib_dcfclks(
> +		struct dc *dc,
> +		struct dm_pp_clock_levels_with_voltage *dcfclks);
> +void dcn_bw_notify_pplib_of_wm_ranges(
> +		struct dc *dc,
> +		int min_fclk_khz,
> +		int min_dcfclk_khz,
> +		int socclk_khz);
>   void dcn_bw_sync_calcs_and_dml(struct dc *dc);
>   
>   enum source_macro_tile_size swizzle_mode_to_macro_tile_size(enum swizzle_mode_values sw_mode);

-- 
Hamza

