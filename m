Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B545941EB32
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F0E6ED90;
	Fri,  1 Oct 2021 10:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D8B6E516;
 Fri,  1 Oct 2021 10:50:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzuOCtgCMM9ehnnqe3KKbc9ScQQeVZBHdIZZElb8mYIyyyj+wayBcjT6sWzzn15wcsZTLWIPhOmN05d9nVOP4rRwDnWLFgI0CctjO4O9Tv1cP5bt5UFJCtLhmb/vzFwsSjAn/5YWq7Cha8FeUto57YX09zCHbFDph5MJnZnLsOr94dA3rIFUxTTQiYp8NBCsnOuuKFPtPD0vExHQDBJpT4D5zKRXE0Cveifle5qXMQJ3n+8b8P1UHoQZUucMKJzaht1NudZi2QbYAu6rfvbPZ5jDqbUfu8OoE5dat/8rvmAGd3BwGkcDXO3irEqpq+haGw5xPcb0fN/gKxiwAuwg2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/oPkoQlHUgQMLtUkii7oTUCSBWk/59M5yJTNF4Tg+A=;
 b=TED1m/3r+R09022i541/gq6ihrKmq9sSMUbeH8YWGHjcgq8GreWG3fwfCwb5iYPCysuJr93MuFWePzbJkjXVaExXnpLVIrQ6cTJQXVVMWB7pyfeXXN3NbLsBgRSzpDANLG/hsXlCvWCrjxI5shb28kbWKFjryyANElsIGGcMlmrIPQ21UruvQtvXKelKv03pUtufkP2sUMqafkKn/CL6cPHy/4XIpxGBo186k12dBQsa6pQM6zK0lVXwd98ufjuIdZbbGtGk5tqqrtF0yH9+ED/QX8K9ZSMq/Q8ulf4jmDR4BDi7/iKXb78RSJr2S2Q3dsCUhPs3pD+x0/kLvKM5lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/oPkoQlHUgQMLtUkii7oTUCSBWk/59M5yJTNF4Tg+A=;
 b=Hj6zIBKLm+VJGAnsyW8Z0rTQKUJCbz1QzQMmMgqEnZ250FADixwrQDqdINDu8KGQTkzrNxwUVGFIXobO6y/Vi1HCMQUU17gL38XCJrkVqyK1fvukE+qj0uf1xG8TkBLejfjMYVkQxqK7SoRXH5dxhxV1zJHtlgzCCmmsjeUS0Vg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com (10.174.101.14) by
 MW2PR12MB2489.namprd12.prod.outlook.com (52.132.182.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15; Fri, 1 Oct 2021 10:50:41 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 10:50:41 +0000
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Subject: Lockdep spalt on killing a processes
Message-ID: <73c163b4-1917-1cde-b75f-831ac66f6ea0@amd.com>
Date: Fri, 1 Oct 2021 12:50:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR10CA0003.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::16) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM6PR10CA0003.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15 via Frontend Transport; Fri, 1 Oct 2021 10:50:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9f26edb-6cb7-4096-2b4f-08d984c94fa4
X-MS-TrafficTypeDiagnostic: MW2PR12MB2489:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB24890DF89E44238965C38DE183AB9@MW2PR12MB2489.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:133;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r3gg30GRdnC2DaoqyR1+2TCGUSsnAb8lj66Vp94bF0ISq8+NZlN+PSg5+k01SvXIi2fAc3b1jb9mTVt3YPO1tsgk7qQlVG+flH4uvCxq3bBchUNKi31wKddcMRZi53Mksws8HY95Ja0Nn+RGmf3GqdHsLWhBKPTx9NVfvdsWmr+TjsUFiZqhx57PdsgxbYVFXUYQ6auVtKiIlQRU9xtMNRtWxv/sAtMqwicdIrMXA6C5rkTVZrDqvfqdyezJNgsTzsSXGPVNS+19lH95kJ8AIXqVM7v63rticmPYfYZG44SRmgWl6ow8Hci/iKllGWa9PfMZwqtkVIoyfZzLnQYsv1cpdYnHdb5fVbaxp9jifhEaRFx9+ihfhJi0GDdlj+3o4OrhGvA3BwEsxTrTkyHB1IVh6u56I2XhExqhqh4xoJlGYPjr/A9iFieIUVucMMhMQy/Vsu0En2VTVM/c3+ppT0Z4j5wYcvNqvPVb3o9btNvvIUf9iph7wJh6o5GZnyWrs1dilh+qclBMKBj8HRkUSkjuBxFCncVjD2YBYyIZG8ISddfJtIcHEdrDWFv4yKSjVKrCaMILOubQ+/DjiN7gFQoZLxL6VOuskywDxlBeXnxW3BhNAIys3tNh5dMYOQ0JIn5hIUFhL61x2gtG4m4TOhVR0jJxJL3SUGpFDLXEUmgcEgD2VbgImBf/xj6QSL85CGozjgx7rlF6UjhYf6S7HiTu2+9xOjW+wlkNdgK/0uvu48hokRCftInZ7HiLjb01
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(316002)(2906002)(8936002)(26005)(110136005)(38100700002)(31686004)(508600001)(2616005)(31696002)(86362001)(66946007)(83380400001)(16576012)(956004)(66476007)(6666004)(66556008)(450100002)(186003)(5660300002)(6486002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVI3SjRmaFlSUUNBTlE1VWkwOWRYVERETkM4N1V1aHBHWkdZSWYrbmJTTnpU?=
 =?utf-8?B?aEZPREJpUDc2aEMzZmxZWkEvM1VwaElqN2J6TDUrMktTME5CbGFlQWU3NGM1?=
 =?utf-8?B?ZW51TUM3akN2cDlFbGRMbGtRRmFFSGdOTkZUaGFSRlZBaFpIN1E5TldTZWdt?=
 =?utf-8?B?U0Y3WlhwSkZoQy9nb0FNV1kra09tNXpQRWM2bXNrZXFRcFJzTUZBclhWM3pr?=
 =?utf-8?B?UEwwZ2ovb201QlNWM0NPbGhTTnZ4a1Z4bFZjZ0xLSWRqcHRSMWFlUGNOU3RD?=
 =?utf-8?B?ZmZteVBQNlUrd3Y2QzVNT0tHcTNMUlpjVFQxZUpaT1JvZHd6MWY4ZW1acjJS?=
 =?utf-8?B?UFNmZ0V5MzQ5ZkhMWXdmUldPUzVOVU1leFFvZ2Z6cVV2OXRRaUo5VzFKbWIr?=
 =?utf-8?B?eEhPRUJlRlAyNG9yc2tTZVMvMGxKejlmWkxEMWJzSXJQNHl5UUgxbUhEMUFq?=
 =?utf-8?B?SHBsTG1iZE42eWJ3L3MxbHFhWXpoUERRMFRkSkovby9QQUtUKzJwOG41alVQ?=
 =?utf-8?B?ZVlKbmJGUEo4NUMyWi9RcmY0cjVGVXlXRGVEN1MvU1NvdlpPWUNwb2pVU0JT?=
 =?utf-8?B?RERCWkhYMmZmcUlkRWNrRmdJVFZ3V3BxdWpuTVNMVE5janZZUU94ZDFpR0JX?=
 =?utf-8?B?MnZSMVlrYWF6RnpiQ3JKNlk3UmpKV201bE5GdmRQYTBONm1zWU90Vks5VjV6?=
 =?utf-8?B?RjdudVJhUXlHN05vV1dPSER1dTdLc0JEaTZlSC9CNnhJeG5nY1lBbGZIUGk1?=
 =?utf-8?B?dUswN2ltWDVCdk8yeVNRNlpZc1IwazVBUXRBVWtWMUhnc25HSFRxWEU4ZjFE?=
 =?utf-8?B?VlNvcU40cFlCaWZDWVVFelZtNDR6VVRIUHBXVFROWVpGTnV5Z3psTUtxcnJz?=
 =?utf-8?B?amVSY0xqV3ZTdHNrZTdQV3B1bjFsZDc2RDlFVGNGTGp2MmNFZUNhSDNranI0?=
 =?utf-8?B?eHl3b0RmRHdDTUVWSDJBaFhkRnpnSzY5VmdrM2k4MGlMMkNLbStZaWpqTElD?=
 =?utf-8?B?bUdHcDdQZWREcnRtenlSSXVwRTA2em9aRjA0M2V2WDRtZWcwVEcyaW1kd0NJ?=
 =?utf-8?B?em1aY20xQjYwU3lEcVZIV1FpT1l6SmVINEdGdk9Ga25kRTFHZCtPR0duMTh5?=
 =?utf-8?B?d2daVFJaY2w3K1cxL1lsVGRzZHc2V2JvY0t6T0ZEcnlGc3pBanZKdnpsZmIw?=
 =?utf-8?B?bUJndUJBRDVnRnBzbW4vQ2ZWZk9zMGVqZlpQYjlpeTVxTm1nNW9GbTZMNnhB?=
 =?utf-8?B?d0dyU2U5eVZ6NGx6Tzhzcks4MUhCWkxpUXRDeGtvUmZSbm44T2RMaUd6aG03?=
 =?utf-8?B?RVRQODNsQXpDYWozdmFnSCtaa0xEMWdveG8vRjJoSkVmVW14Q2Q1ZmlDcmM3?=
 =?utf-8?B?NTBGS0JTV0ZPSklJdExmUFlHSXhPYTFOZlhYMlM2cFdVUFhmNXhKbnJiK0VP?=
 =?utf-8?B?WEZpaU5Pc21UdWtoZ2xSdFBTaWJZRmFrcjJSbG9hQ0pENU5EendFWTVBbzgz?=
 =?utf-8?B?YzNLcFpza0tWQ1RqZFNEaS9XL3QwSHMwS0xBUm9jSzQ3RUx2bGdmY0FNV1Rv?=
 =?utf-8?B?NXNHSVoyM1lORC9wUFFPc0R6UnVIeFFjem9QU1ZIRkVIeWhOZ1R2TUZhb2Z3?=
 =?utf-8?B?M2gzOHgxRlJGWlhTdGJSQkdMQ0I1YitJc3Jma3M0SHlHS292c2EyVS9SSVhS?=
 =?utf-8?B?cm92TC94azFxcmlPajRCYXN2bFNNb1VOTjg0akYzSGF4M24wZG9tcDZCL2J4?=
 =?utf-8?Q?otndc3g8onrOXhxsSs0Eu/hyu9e1ywqBFY85vh+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f26edb-6cb7-4096-2b4f-08d984c94fa4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 10:50:41.1536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trkOGpyIX30d5VQmb5ywGfrmqZ3OKOj4yzm6S4czn5DjlccQy7JK+FcNZyFW2Xo4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2489
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

Hey, Andrey.

while investigating some memory management problems I've got the logdep 
splat below.

Looks like something is wrong with drm_sched_entity_kill_jobs_cb(), can 
you investigate?

Thanks,
Christian.

[11176.741052] ============================================
[11176.741056] WARNING: possible recursive locking detected
[11176.741060] 5.15.0-rc1-00031-g9d546d600800 #171 Not tainted
[11176.741066] --------------------------------------------
[11176.741070] swapper/12/0 is trying to acquire lock:
[11176.741074] ffff9c337ed175a8 (&fence->lock){-.-.}-{3:3}, at: 
dma_fence_signal+0x28/0x80
[11176.741088]
                but task is already holding lock:
[11176.741092] ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, at: 
dma_fence_signal+0x28/0x80
[11176.741100]
                other info that might help us debug this:
[11176.741104]  Possible unsafe locking scenario:

[11176.741108]        CPU0
[11176.741110]        ----
[11176.741113]   lock(&fence->lock);
[11176.741118]   lock(&fence->lock);
[11176.741122]
                 *** DEADLOCK ***

[11176.741125]  May be due to missing lock nesting notation

[11176.741128] 2 locks held by swapper/12/0:
[11176.741133]  #0: ffff9c339c30f768 
(&ring->fence_drv.lock){-.-.}-{3:3}, at: dma_fence_signal+0x28/0x80
[11176.741142]  #1: ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, at: 
dma_fence_signal+0x28/0x80
[11176.741151]
                stack backtrace:
[11176.741155] CPU: 12 PID: 0 Comm: swapper/12 Not tainted 
5.15.0-rc1-00031-g9d546d600800 #171
[11176.741160] Hardware name: System manufacturer System Product 
Name/PRIME X399-A, BIOS 0808 10/12/2018
[11176.741165] Call Trace:
[11176.741169]  <IRQ>
[11176.741173]  dump_stack_lvl+0x5b/0x74
[11176.741181]  dump_stack+0x10/0x12
[11176.741186]  __lock_acquire.cold+0x208/0x2df
[11176.741197]  lock_acquire+0xc6/0x2d0
[11176.741204]  ? dma_fence_signal+0x28/0x80
[11176.741212]  _raw_spin_lock_irqsave+0x4d/0x70
[11176.741219]  ? dma_fence_signal+0x28/0x80
[11176.741225]  dma_fence_signal+0x28/0x80
[11176.741230]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
[11176.741240]  drm_sched_entity_kill_jobs_cb+0x1c/0x50 [gpu_sched]
[11176.741248]  dma_fence_signal_timestamp_locked+0xac/0x1a0
[11176.741254]  dma_fence_signal+0x3b/0x80
[11176.741260]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
[11176.741268]  drm_sched_job_done.isra.0+0x7f/0x1a0 [gpu_sched]
[11176.741277]  drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
[11176.741284]  dma_fence_signal_timestamp_locked+0xac/0x1a0
[11176.741290]  dma_fence_signal+0x3b/0x80
[11176.741296]  amdgpu_fence_process+0xd1/0x140 [amdgpu]
[11176.741504]  sdma_v4_0_process_trap_irq+0x8c/0xb0 [amdgpu]
[11176.741731]  amdgpu_irq_dispatch+0xce/0x250 [amdgpu]
[11176.741954]  amdgpu_ih_process+0x81/0x100 [amdgpu]
[11176.742174]  amdgpu_irq_handler+0x26/0xa0 [amdgpu]
[11176.742393]  __handle_irq_event_percpu+0x4f/0x2c0
[11176.742402]  handle_irq_event_percpu+0x33/0x80
[11176.742408]  handle_irq_event+0x39/0x60
[11176.742414]  handle_edge_irq+0x93/0x1d0
[11176.742419]  __common_interrupt+0x50/0xe0
[11176.742426]  common_interrupt+0x80/0x90
[11176.742431]  </IRQ>
[11176.742436]  asm_common_interrupt+0x1e/0x40
[11176.742442] RIP: 0010:cpuidle_enter_state+0xff/0x470
[11176.742449] Code: 0f a3 05 04 54 24 01 0f 82 70 02 00 00 31 ff e8 37 
5d 6f ff 80 7d d7 00 0f 85 e9 01 00 00 e8 58 a2 7f ff fb 66 0f 1f 44 00 
00 <45> 85 ff 0f 88 01 01 00 00 49 63 c7 4c 2b 75 c8 48 8d 14 40 48 8d
[11176.742455] RSP: 0018:ffffb6970021fe48 EFLAGS: 00000202
[11176.742461] RAX: 000000000059be25 RBX: 0000000000000002 RCX: 
0000000000000000
[11176.742465] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
ffffffff9efeed78
[11176.742470] RBP: ffffb6970021fe80 R08: 0000000000000001 R09: 
0000000000000001
[11176.742473] R10: 0000000000000001 R11: 0000000000000001 R12: 
ffff9c3350b0e800
[11176.742477] R13: ffffffffa00e9680 R14: 00000a2a49ada060 R15: 
0000000000000002
[11176.742483]  ? cpuidle_enter_state+0xf8/0x470
[11176.742489]  ? cpuidle_enter_state+0xf8/0x470
[11176.742495]  cpuidle_enter+0x2e/0x40
[11176.742500]  call_cpuidle+0x23/0x40
[11176.742506]  do_idle+0x201/0x280
[11176.742512]  cpu_startup_entry+0x20/0x30
[11176.742517]  start_secondary+0x11f/0x160
[11176.742523]  secondary_startup_64_no_verify+0xb0/0xbb

