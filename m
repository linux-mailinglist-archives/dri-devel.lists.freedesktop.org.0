Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D85AFDCCE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 03:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE6610E6F5;
	Wed,  9 Jul 2025 01:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hn4wWzmA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C09B10E6F5;
 Wed,  9 Jul 2025 01:15:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRiVXm4/0r6m8k13YWG05vMIMfrODt7F1dPQ6OlIANJgKIa5rnchBWfLAl2bo0qCNXlSbCCaOt20jQYoMttTWy/EnnqZenF5gKqCkUZaz/Fs4tCLdRz65W4x8bpeRDqoOhB5/SPwQeInmJ3lrZLYVKSSpjyvabJFG5+TQh72K630fzkl2FIPO/S/pTsOJuIUzFzgLB3Ahz/75baXQKYLO+E36ZF7kMPYp6g0ABrdzQuXhn9pNSmLrJlCUYJtyVB9xYS283TRh4RvDrfgml5RkPvaZrWZ6W4PgxyFE6N8T1WmAEq/UOKsjPQdO/BZVpiSxf/QKzTK3rwD38GvHSBztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBGJ9Wn4w2MRP6HG/kZomloE3JI/uY+/rd/JAk7uIT0=;
 b=MQFzE5Ym4JOL+RmC+g2L/3eML8JFS2P7YJCH+0SzB95OBKQInFI3X3QIZFEOtMALEfQJtwPTcOdPNOUiJ1hhBQgc+xyLZVrkKmfaOe4MbMqrUQoJfJR3RxIWceertdMRcLpIUogEnBhs5aJUeFL6BjIhEImYiDYnlIByvTJAMW1nkan8e43p19T4mual1mgft/Dhyh4iuRcCbymbE3hlfGFDGjEcTgH1UGL09irEKqImAmCohhnaTl6dtbPRM5O3jOSyfUF6pdCAQ15q7JBc1tKby61NWKzOSedcDefiE3w7xMhsCKw+N/4/g43vzWV2fARvb60l0gw5+CMz/jom3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBGJ9Wn4w2MRP6HG/kZomloE3JI/uY+/rd/JAk7uIT0=;
 b=hn4wWzmADswyxJ1wE4TRwcVxX5T4lu7loGym2JRsTqCffsG7UF5yQ5LN1yueauSJE4vBbdUn9G7N9P/xzxi/kGt3a+Y1Vo3z426s1pf78JXGhMdorJcGGeqCurSbF2rUJKmNgD6TPKodWMlESe/6p+gRLP5ZzGivU/W7PCPJe0zmPSJW1GQJnMHAOUB123dIsUdhK2Z7ktrMNXbVWfLxlv/7+F/M0YZ1Fpa4sZPjNG00qf7r7bBkz9fCKu7VyzuJxn1gRRE8mNmW0Tk+hbSLz7VPHPeoOODZ3rr8lFr91dCbgQNbch3LLOydFe1mMrWB3Cu2B7BPE7OIKSbYh8fnxw==
Received: from BL0PR02CA0140.namprd02.prod.outlook.com (2603:10b6:208:35::45)
 by DS0PR12MB7748.namprd12.prod.outlook.com (2603:10b6:8:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 9 Jul
 2025 01:15:11 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:35:cafe::75) by BL0PR02CA0140.outlook.office365.com
 (2603:10b6:208:35::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Wed,
 9 Jul 2025 01:15:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20 via Frontend Transport; Wed, 9 Jul 2025 01:15:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 8 Jul 2025
 18:15:00 -0700
Received: from [10.2.176.62] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 8 Jul
 2025 18:14:58 -0700
Content-Type: multipart/mixed; boundary="------------SXnjpXPG3rN72EYiq7LqReW4"
Message-ID: <25642e5b-25ee-49b2-b08d-4c64fa2e505a@nvidia.com>
Date: Wed, 9 Jul 2025 11:14:47 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] NVIDIA ION graphics broken with Linux 6.16-rc*
To: Rui Salvaterra <rsalvaterra@gmail.com>, <airlied@gmail.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <CALjTZvZgH0N43rMTcZiDVSX93PFL680hsYPwtp8=Ja1OWPvZ1A@mail.gmail.com>
 <aG2mzB58k3tkxvK-@audible.transient.net>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <aG2mzB58k3tkxvK-@audible.transient.net>
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|DS0PR12MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: 72662c91-f864-49ea-a7c6-08ddbe860d13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|4053099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejNnNnZDRFdWTXlhSUx3WkZVZ0xkbkJzTGxZUGRpSWI0L1Zkd2pUYTFaMHU1?=
 =?utf-8?B?VHdVeDROUHFHQkttL0w1eFpldlBiQVdzSTM4blBXRUlxQVN4b3hGdDY4cFFN?=
 =?utf-8?B?VzB0R2lMQTRsek1VYytvME80eVBaRFRLdURTdXNlL0FDdDV4b1podnZ4K201?=
 =?utf-8?B?b1RlUFFmaFgxQnZsRWIyVlh6M2JVc2wxOStJREdBQVYvdlpCNHJWalgydnNS?=
 =?utf-8?B?Y1Q0Vlk4WlNNUEFwa1dpMTF2bWd4YXF1SmhZV2JjSWtrQnBuTUlXWW94aTQ5?=
 =?utf-8?B?QVkybVI4eWlmVUVLUDM0c1dsMTlEYUNIcjQySk5oaGJqNElDNlZ4K2p0SXFm?=
 =?utf-8?B?a2tROE0vSGk4amdTT1dTVElGaVp0azNleEtqcVVHc0wvRWVoN2o1OW1NaUIz?=
 =?utf-8?B?bHNkV3dIbEVYVlVuZnVSY1FIL0J4blJsZmhRZ29UczZISkFJbi9YV1RyVTRa?=
 =?utf-8?B?bHRMc2N6Vm1qSG5BcC9kWWRvbmIzMG90N0dIS0V3cnVLT25TUGttMVJFTmVR?=
 =?utf-8?B?T3VRVWZyd1dCeXNjbHZQdThWVkNrUEtVcE1GYmRMRFlDZHpXTnFKdlByVTBH?=
 =?utf-8?B?NE1ZWFN3SmY0elVJUkx2aDJyenc5ZGtkV3Y1eFdQOFpIUlgwQTNvS2hnOVNu?=
 =?utf-8?B?a2txMXltOThYbDBBM0xiWVE5K1lRd283Y3p4QTdOM3poNGZiVHdLcEwzbnBT?=
 =?utf-8?B?YWdCWkNIMEgxYlByZ1l3b2paNDhUekQ3R0xVVzVBcHF4Z2dUZmxndHpFaXVh?=
 =?utf-8?B?YVdPRHlEVlM1cHZvTzlzS1ZqREZGYkFaTkVwbVBiY0Z6aXN3Q0ExaTByV0lp?=
 =?utf-8?B?OWFrT0VOcUlPM0NXUkpuUEpUcDM0UDVGYjB4UzFVaVdVTGx4WDdUdGtkcVJU?=
 =?utf-8?B?UlFtSmFQaDZqWmtDTGlzT2ZPNTFpOVptWHlBdGkzMlVLbkxsR1IyeEhjKzR2?=
 =?utf-8?B?cEZ2ZEQrOERQVTVmWEkzNTQ1SFY0NHh0K2ZvbmoyekR3aVBEWk15alNuUklU?=
 =?utf-8?B?U2llVytLaXdkaVVUR0dYM2FRc00yNkhrbURIU0x0TSt4MmVoY2szZ3lzdUR5?=
 =?utf-8?B?OW03bW0rMnZOejF5b1piTVZ2b3FKbHBlaGFzUDRKaW91UUZoeHEvNU43Smpp?=
 =?utf-8?B?MmlLamhJa0dLQ0xpSng5aTM2djBjS0tmRU5NV1VIVmkxVU15RXdSSVFDNk1K?=
 =?utf-8?B?emNOcW9BeVBZRUxLQ285MkhaR2xLU1hhZWNuci91ZTRWcFMzeVQ1Tko4RjVH?=
 =?utf-8?B?QmN1N1gxSE42U1QySGhoY0pDOWFlL21FekhsTFVCdXRpSEJZenZaOHMxTVli?=
 =?utf-8?B?bDNCanI4STVHc2Vnd2dXMytVeDZTWW0zbUZtVDdId0NPd3JSSmVJM3VkQWFx?=
 =?utf-8?B?Y2s5MG00UTQ4U25MTk55N1ZuOWFSWSsxa2M5MEZxUU5vQUhndnQrcTJrSTBX?=
 =?utf-8?B?WlRXSmxGOUthelo0ZDBPMWdoSnRSWXk5RitVUjlqNEhlZUVyb2prcmNVUUt1?=
 =?utf-8?B?V1kraVUrZmV1Z1BaZE1jRFJ0VU5BT2taaVIvV1d2NlFHVTVhdU4zcHZSdWgy?=
 =?utf-8?B?MklpU0Fzb1VybjQ0ZlR4cWVtUFNFb2ZXVnJlaHZjNUJBVUNrdDlrRWY4ZWt0?=
 =?utf-8?B?TmRJUVRPa3NyRStjREM3RUMyenlXc3FjeDd3NVRJQTJiZVcvalpGdVJJNlpV?=
 =?utf-8?B?Q0w2Q0ZSWkJ0S3FyUlpOazdHaWxGYUlyZ2Mwc0pGT2hYS284Mms3TW9nblFZ?=
 =?utf-8?B?QlFMZVA5WjhYSDhKczBEUThqMkFuK3YvZ3BVQ0ZSSUxRczloY0I3Y1hPcy9i?=
 =?utf-8?B?elhPQ3I3aDZRN2k3T25ITFZLSHd4ZE9VWkE5eWJtQ1l5TGpkY0dxMVk1TTFC?=
 =?utf-8?B?M2ZPUzJxc1lZRjdXbHd4SUhqYVJVR25kbU9uYytzVklOY3JYOG5IRkRBcXc1?=
 =?utf-8?B?b2xmaXhja3VKQXhWWVpmeFRnTGRBc0wzMFJsUngwWE9hTmkrZFluaEMxeDc4?=
 =?utf-8?B?bHdwQ3BhdEU1b3JGRHd5OE15eHlFbDhIY1I0VjZYWFYrMEt5dUZOLzFQaHpy?=
 =?utf-8?B?WTRzcE5YZ3hZT1hBdFdiZHg1M0lsT2ZoeDk0dz09?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(4053099003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 01:15:10.8907 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72662c91-f864-49ea-a7c6-08ddbe860d13
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7748
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

--------------SXnjpXPG3rN72EYiq7LqReW4
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 7/9/25 09:16, Jamie Heilman wrote:

> Rui Salvaterra wrote:
>> Hi,
>>
>>
>> The machine (Atom 330 CPU, ION chipset, GeForce 9400M graphics) works,
>> but graphics are dead. Dmesg shows the following (Linux 6.16-rc5):
>>
>> [   34.408331] BUG: kernel NULL pointer dereference, address: 0000000000000000
>> [   34.408351] #PF: supervisor instruction fetch in kernel mode
>> [   34.408358] #PF: error_code(0x0010) - not-present page
>> [   34.408364] PGD 0 P4D 0
>> [   34.408373] Oops: Oops: 0010 [#1] SMP
>> [   34.408383] CPU: 2 UID: 0 PID: 583 Comm: Xorg Not tainted
>> 6.16.0-rc5-dbg+ #187 PREEMPTLAZY
>> [   34.408393] Hardware name: To Be Filled By O.E.M. To Be Filled By
>> O.E.M./To be filled by O.E.M., BIOS 080015  08/13/2009
>> [   34.408399] RIP: 0010:0x0
>> [   34.408414] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
>> [   34.408420] RSP: 0018:ffff88800378bc08 EFLAGS: 00010202
>> [   34.408428] RAX: ffffffff82071c60 RBX: ffff888008e6f000 RCX: 0000000000000978
>> [   34.408434] RDX: 0000000000000020 RSI: 0000000000000002 RDI: ffff888008e6f000
>> [   34.408440] RBP: ffff88800378bd18 R08: 0000000000000000 R09: 00000000000003ff
>> [   34.408445] R10: 0000000000000000 R11: ffff88800378bcc0 R12: ffff88800378bdb8
>> [   34.408451] R13: ffff888007dad9c0 R14: ffff888004285680 R15: ffff888007e671c0
>> [   34.408457] FS:  00007f2cc7b2eb00(0000) GS:ffff888149ecf000(0000)
>> knlGS:0000000000000000
>> [   34.408464] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   34.408469] CR2: ffffffffffffffd6 CR3: 0000000008a08000 CR4: 00000000000006f0
>> [   34.408475] Call Trace:
>> [   34.408482]  <TASK>
>> [   34.408486]  nouveau_gem_ioctl_pushbuf+0x10d8/0x1240
>> [   34.408504]  ? nouveau_gem_ioctl_new+0x160/0x160
>> [   34.408513]  drm_ioctl_kernel+0x7a/0xe0
>> [   34.408524]  drm_ioctl+0x1ef/0x490
>> [   34.408532]  ? nouveau_gem_ioctl_new+0x160/0x160
>> [   34.408541]  ? __handle_mm_fault+0xff2/0x1510
>> [   34.408552]  nouveau_drm_ioctl+0x50/0xa0
>> [   34.408560]  __x64_sys_ioctl+0x4be/0xa90
>> [   34.408570]  ? handle_mm_fault+0xb5/0x1a0
>> [   34.408578]  ? lock_mm_and_find_vma+0x34/0x170
>> [   34.408587]  do_syscall_64+0x51/0x1d0
>> [   34.408596]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
>> [   34.408605] RIP: 0033:0x7f2cc7d2f9dd
>> [   34.408612] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10
>> c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00
>> 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00
>> 00 00
>> [   34.408620] RSP: 002b:00007fff6a501ee0 EFLAGS: 00000246 ORIG_RAX:
>> 0000000000000010
>> [   34.408628] RAX: ffffffffffffffda RBX: 000055c7792b3f78 RCX: 00007f2cc7d2f9dd
>> [   34.408634] RDX: 00007fff6a501fa0 RSI: 00000000c0406481 RDI: 0000000000000011
>> [   34.408640] RBP: 00007fff6a501f30 R08: 0000000000000978 R09: 000055c7792af740
>> [   34.408645] R10: 0000000000000002 R11: 0000000000000246 R12: 00007fff6a501fa0
>> [   34.408651] R13: 00000000c0406481 R14: 0000000000000011 R15: 000055c7792ac700
>> [   34.408660]  </TASK>
>> [   34.408664] Modules linked in:
>> [   34.408671] CR2: 0000000000000000
>> [   34.408678] ---[ end trace 0000000000000000 ]---
>> [   34.408682] RIP: 0010:0x0
>> [   34.408691] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
>> [   34.408696] RSP: 0018:ffff88800378bc08 EFLAGS: 00010202
>> [   34.408703] RAX: ffffffff82071c60 RBX: ffff888008e6f000 RCX: 0000000000000978
>> [   34.408709] RDX: 0000000000000020 RSI: 0000000000000002 RDI: ffff888008e6f000
>> [   34.408715] RBP: ffff88800378bd18 R08: 0000000000000000 R09: 00000000000003ff
>> [   34.408720] R10: 0000000000000000 R11: ffff88800378bcc0 R12: ffff88800378bdb8
>> [   34.408726] R13: ffff888007dad9c0 R14: ffff888004285680 R15: ffff888007e671c0
>> [   34.408731] FS:  00007f2cc7b2eb00(0000) GS:ffff888149ecf000(0000)
>> knlGS:0000000000000000
>> [   34.408738] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   34.408743] CR2: ffffffffffffffd6 CR3: 0000000008a08000 CR4: 00000000000006f0
>> [   34.408750] note: Xorg[583] exited with irqs disabled
>>
>> Unfortunately, bisecting is not feasible for me.
> That looks pretty similar to the problem I posted
> (https://lore.kernel.org/lkml/aElJIo9_Se6tAR1a@audible.transient.net/)
> that I bisected to 862450a85b85 ("drm/nouveau/gf100-: track chan
> progress with non-WFI semaphore release").  It still reverts cleanly
> as of v6.16-rc5 so you might want to give that a shot.

Hi,

Thank you for bisecting!  Are you able to try the attached patch?

Thanks,
Ben.

>
--------------SXnjpXPG3rN72EYiq7LqReW4
Content-Type: text/x-patch; charset="UTF-8";
	name="0001-drm-nouveau-nvif-fix-null-ptr-deref-on-pre-fermi-boa.patch"
Content-Disposition: attachment;
	filename="0001-drm-nouveau-nvif-fix-null-ptr-deref-on-pre-fermi-boa.patch"
Content-Transfer-Encoding: base64
Content-Description:  0001-drm-nouveau-nvif-fix-null-ptr-deref-on-pre-fermi-boa.patch

RnJvbSA2OTg3YzFjMjU0Mjg1MzA1ZmRjMjAyNzBlMjE3MDlhMzEzNjMyZTBkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQG52aWRpYS5jb20+
CkRhdGU6IFdlZCwgOSBKdWwgMjAyNSAxMDo1NDoxNSArMTAwMApTdWJqZWN0OiBbUEFUQ0hd
IGRybS9ub3V2ZWF1L252aWY6IGZpeCBudWxsIHB0ciBkZXJlZiBvbiBwcmUtZmVybWkgYm9h
cmRzCgpDaGVjayB0aGF0IGdwZmlmby5wb3N0KCkgZXhpc3RzIGJlZm9yZSB0cnlpbmcgdG8g
Y2FsbCBpdC4KCkZpeGVzOiA4NjI0NTBhODViODUgKCJkcm0vbm91dmVhdS9nZjEwMC06IHRy
YWNrIGNoYW4gcHJvZ3Jlc3Mgd2l0aCBub24tV0ZJIHNlbWFwaG9yZSByZWxlYXNlIikKU2ln
bmVkLW9mZi1ieTogQmVuIFNrZWdncyA8YnNrZWdnc0BudmlkaWEuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L252aWYvY2hhbi5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9udmlmL2NoYW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252aWYvY2hhbi5jCmlu
ZGV4IGJhYTEwMjI3ZDUxYS4uODBjMDEwMTdkNjQyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmlmL2NoYW4uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9udmlmL2NoYW4uYwpAQCAtMzksNiArMzksOSBAQCBudmlmX2NoYW5fZ3BmaWZvX3Bvc3Qo
c3RydWN0IG52aWZfY2hhbiAqY2hhbikKIAljb25zdCB1MzIgcGJwdHIgPSAoY2hhbi0+cHVz
aC5jdXIgLSBtYXApICsgY2hhbi0+ZnVuYy0+Z3BmaWZvLnBvc3Rfc2l6ZTsKIAljb25zdCB1
MzIgZ3BwdHIgPSAoY2hhbi0+Z3BmaWZvLmN1ciArIDEpICYgY2hhbi0+Z3BmaWZvLm1heDsK
IAorCWlmICghY2hhbi0+ZnVuYy0+Z3BmaWZvLnBvc3QpCisJCXJldHVybiAwOworCiAJcmV0
dXJuIGNoYW4tPmZ1bmMtPmdwZmlmby5wb3N0KGNoYW4sIGdwcHRyLCBwYnB0cik7CiB9CiAK
LS0gCjIuNDkuMAoK

--------------SXnjpXPG3rN72EYiq7LqReW4--
