Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA3A641776
	for <lists+dri-devel@lfdr.de>; Sat,  3 Dec 2022 16:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90DF10E0EF;
	Sat,  3 Dec 2022 15:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C4710E0EF
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Dec 2022 15:15:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEFazOz/ybXhrqWDMD9+d5nwEAPlV6fbo9e0IfyimTMXTdXsuDPx4gcwGm4ZzVwhm9AvzDT9w6+6OYZ4A9eRVAKKnmJVYtzRXlPNOIfvjBqLVmLsvYB1CLYUccfJMxU0MloYbHlNoBX5NtV7qYouhonaf65SR1WiE7TFCHdEYtZSau1FgXvVUA0RUMtamqI0hhcNI1VbZxMNJjBoCUVjCrmDQblRCPMPPvi34GeXVCaxbwfk62qBWE6A5dCgvCBz6jPme6XfEMO3FaDd2VA4jwbJHbxDT/uKZ62hRakjsQw1B4e9nOCxzflYr66QaI8WCuMkRwapYNLAyCzUhWZf4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQh0oTcQNs5hszR8v76miAb2s59UAMgvm1oTMqQo348=;
 b=CFeSWQJbri2d2m8LnDtcAwZGcjMiDUdWJXq1nDlrEBSjNtta2P+eJiWkNnaBH2wlbiyJrL2mnPdeT5S3PhZ+YB/sd5mdSsZQZHDTqqWPJrHMEpzMgsG59cD4ZiXxecD6pENNkyI29E3l8lMiya5HGyM2BmWauix5fPUmQc8CKk5f0muS8meIJ5JVMhpCdkNMpszNp2wOApVGbXXyaIoeY91R26f7lPad1+yV1H5saBK8uV8qKU+X6+k7X/FbOcLPXHeGakakscieeORMRrBTUlMvJUMXEdfgRHZVuH1hUv3Gnd7fxhP0yKr5ZqAy8ap31A4WXHNdVVmoG77xj59WjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQh0oTcQNs5hszR8v76miAb2s59UAMgvm1oTMqQo348=;
 b=K2hhiYdi5pvYOBmzZW+g7sCnfbvh+uIkc1e9Yj3iWOb0VFyuMyETrJsUDWVHCkJFyn7+wfcZ/q/0JWGU9Vt3t7HLlGBQHX9xiWZQDnCDHWAaLeO9tZ4E+kfQ85hJIuCNVZ7qPSM4jskLtVDr66yx5sNuJht/t24Up+ClRH1ESXg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB6221.namprd12.prod.outlook.com (2603:10b6:208:3c3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Sat, 3 Dec
 2022 15:15:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5880.010; Sat, 3 Dec 2022
 15:15:05 +0000
Message-ID: <ccc81e11-e1e1-557b-6777-c1ed109c0e83@amd.com>
Date: Sat, 3 Dec 2022 16:15:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] Revert "drm/sched: Use parent fence instead of finished"
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy.Dong@amd.com
References: <20221202172330.39219-1-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221202172330.39219-1-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: df498334-a6ad-4f46-d3a6-08dad5412862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z96MuehnEHKMkDHAXb0sAuQdLAI3QlltuAIdsbGduvRs8nUKvGaEf1FSAplUJEXFJyiHG9utFIwGoxRSkxaLQbi6BvbTrM7xT8fylogRrh8frFxgASyvrRrzUiBvkZ4AKtxq0WCcJZH1BZdVqhTJOl5P/TTve9RdnaY3gbDK22ETnmCyXoWsdUduSiEbv7FMOcOlrclxreiJIWVqzjFhOryBacyXGVH3SsmVOXpU3EerJhOjVS8I6SMzecxbOcvOPZ9QvvSJbS8a3wgRpVCg1zzva1KnKBfpWw9BTdbRUFSrkgGPtq4jDkqM8gvw+7/C3yr39XPCwVScwli9t7VSaBM2m7evhDM57hN2UPWEmsC1Qd08fWKCl43KxQ+3smCTe+c0MYT1gZktkmbCGlRv86OA4iAa9R6p5nIwH+JFmp63w3cquF6XUH33EC2Ta/HRD1SdwxRY8gVkcncQ+ojl8VF1yQsEKS7dIPz2V9kilkdzPbs90+6mZ+MCEnLyDKDKoFIrH6oiHkxvNGtPOv1G0Iacc7bTb1XTICOZmMsjePIK2gbGgtXtMv7pQCYV6yz34+Pm+fGuWj1eusmG+HM0fYwEBfLDoeiaFzARjoj+OfcbqZtguTxfzm04pjqskNDb0z3WC2KTTvv7VGef+P15A6sN2+RsNBUl6v1XvH5aqoGT+YA97ENXDY8mRvix7RvMfubjFlUaWAnw7tmnwkG5pBpFh9AtCZ4gL677wf5GOO8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199015)(2616005)(31696002)(2906002)(186003)(86362001)(5660300002)(6506007)(6666004)(38100700002)(36756003)(316002)(6486002)(478600001)(8936002)(6636002)(6512007)(66574015)(31686004)(41300700001)(83380400001)(66556008)(66476007)(8676002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2Q2bWZoUUUzcmt1QVY0dVhCUkZuYXMwOG50c0l1SnVrZXltZDRQQXpXWUhu?=
 =?utf-8?B?YXRZaFpoUlBLNmhJS2x6U0xnRG5uMXZQSWVmUnYzTWc0S21Bd1Y4ejl6MW9U?=
 =?utf-8?B?bzVjd25XY0NLc2s4Q3l3N2hFRktaeDZyeURqR0toMndyVWFwQWZzM3NPalFw?=
 =?utf-8?B?bmpEaEZSeTFoeTdua3p1bGtteG5CdWJaaXhtQk9hdDFZdUFZWkdSYlFTTHlZ?=
 =?utf-8?B?NFdabVFObFBFb09RZkVmdWo3aFQ2c0FFeksrWmtMNXYzME0yNnBOOXlmdGFi?=
 =?utf-8?B?VDJ3Q2hlVlNUU2JnUGt4Sk0zMWZuWWdJRjhMSGJMTmFuZkIvYUtBV1R6MXEw?=
 =?utf-8?B?TlRnQzhLOHFmeDZnb3g2T3p3ejBNeTdvRm00UE82eHp1dFVDQWszN2M5TEU1?=
 =?utf-8?B?VmdjY3l2WGdKSlJWRXlvQWdSakxibnN5aU42S2hzdUFJTjBLSVZNR1hBWk5m?=
 =?utf-8?B?T3pia1ZScVh4T3ZaclNGU3RwVUFqemx3djZYVVNaZGV0V2Nmc1FuMmJzd3lO?=
 =?utf-8?B?NmZqVlJqT3o2eHpUSFpzcXNRSmNDWUpzMGV0cVZVSTIrczZDR0JacTFEektL?=
 =?utf-8?B?RDFzWDI3Qit4WSszSHRHeGdYcURkUUI3amtEUm9sZWdWNGNKSDFEbEo1TGwr?=
 =?utf-8?B?NS9vUTdHdmErL3REbHN1M3RaNzZrRU12QkhUNTJJK05CbkM3UzNJaElHSUhS?=
 =?utf-8?B?WHZXWWo2aFM3bmNvbU43em5oaG42V2lweGZPMFFhM0VuUjhDM2ZNRjN4ejV1?=
 =?utf-8?B?UlRtRU1Rb0NrQ09jVGh1elRHVS9aMCtJTm44eThmTGRXb2V1WHFocFNnTytu?=
 =?utf-8?B?a2xqQVZmdmhCbGQvY3FxVVViUlNvbGVBK0dWUkNadXR5ZlJaMnM3OFo0My94?=
 =?utf-8?B?bXNXVTNwYjY5Y1hDMG1lYmZJS0w4SUJydTMrNDF0ZkRMSHg0SG5iWERqSDJN?=
 =?utf-8?B?bnFJaHNIbUM5N2tBV0JHcVFJNGJQdDlVNnpkOHl0aC9XdG1CQ21sOEwxNXlq?=
 =?utf-8?B?NHYxa3F1OFhYSU56d2lpMlRySFRkWjNqTWQ5WWRxemp2bjdQd09JUW1LUUww?=
 =?utf-8?B?ZnYzdExjdHpuYVFMbWFCSmFKWjVTZjhncVFSYjhnblRNVUN5amNSTHh5anVn?=
 =?utf-8?B?YWpVbmtZRWxWMHZQRFp2YU5NZFFDazdXVnNpVHIzM1JpekpZSWc1OWxTSHQ4?=
 =?utf-8?B?Q2J5YmJmQmJLRCsvUzUyaEJhODFKYmczUHVVWmlsZDhrTE9RTEdUTWsxK2NL?=
 =?utf-8?B?Y3cxWjFIZEh6TEhFQW5sSk9uT1g5RXErM0h1RGN0TVl0aWVMQkRXaWdpekVE?=
 =?utf-8?B?RStrcmhyNWpoR0RXd1dXTGhlYlZvN1RYaEdZT2l4TkRpSDMwTnhzaDhGVito?=
 =?utf-8?B?N0xnZXIzWGU4eVVnNk9TQnRyKzduNXdVc1g5K0p3SVhRTnFjZnVUZ3VVRUdL?=
 =?utf-8?B?ZzVNdmpqV0s3NGNtZVB6Y2RZOVhiQngybXcydFBhUjJXVmFuM1c3Q2xOQi9x?=
 =?utf-8?B?ZVlKcGVpM2xXU1Nkd0Nrem83Y1FGZjhqYkZBM0doUGxia2JyRHJ0THpVRTFr?=
 =?utf-8?B?MUdNZUFMN3NiVUJDWEFCS0VHWXJINlNaUEhkK2VMSzh0Z3pkNnArQmhPejI4?=
 =?utf-8?B?UFZuOGQyb3VnM0NPUm1MSk9CQVFmdXFzdlZUQ0R5UkU3OEtPeGhwNDlUNzdN?=
 =?utf-8?B?L2FLbW9Vc0g2Rm1jNjkvc0FVN3pyOTJzYVpBbFA4amtqNC9vdkgzQnFzUno4?=
 =?utf-8?B?cTZRYktxdDc0ZnhuclYxc0MrK0RwTVpKTk5ONUJMWE1IcFRiYUZ5bWE1R0FP?=
 =?utf-8?B?S1J1a0VVaUxEV0U2UVVLNklKdTdrVDY5dnFWaVgwaTR6K2g2LzhiKzJCaXB3?=
 =?utf-8?B?WGYzRFJObWtBckp4TUxXUUROK04veE9NaEcvNzlIRUJicFFSaHgzN1A1eVRQ?=
 =?utf-8?B?dERWQVZFcjNqZi9rL2tKdU9vQmZ0TWJENUlwTC9SVWg5NitXN0Y3dkdCeFdN?=
 =?utf-8?B?YVE2TGNQSWx6UEFOSVJSZEx4SmM3dFdqTkxNRSs5aWZTU21CVFZtejg0ODFr?=
 =?utf-8?B?SEYxZm5MUEtXWFpmR1BvRlUrcFo1THhTeDRqTWxMU29HeHVPUkYzMXZBczRr?=
 =?utf-8?B?aCtJZStHVktibGhjdWduMTU4RjVtTDRCdEYzd0pSMGEvbnNMUk9HS3VhZU9D?=
 =?utf-8?Q?Fm0RkG4TvhR5FQNPRw4e92iOUqd4IRk7wK26ipKGktbv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df498334-a6ad-4f46-d3a6-08dad5412862
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2022 15:15:05.5064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FlYJ6Dczbbu7F1M71uQrh0psL+SZAEwG5fxFpeDaYzdeAx9P/3Zwc6tQH8yQNo4S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6221
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

Am 02.12.22 um 18:23 schrieb Arvind Yadav:
> This reverts commit e4dc45b1848bc6bcac31eb1b4ccdd7f6718b3c86.
>
>      This is causing instability on Linus' desktop, and Observed System
>      hung  when running MesaGL benchmark or VK CTS runs.
>
>      netconsole got me the following oops:
>      [ 1234.778760] BUG: kernel NULL pointer dereference, address: 0000000000000088
>      [ 1234.778782] #PF: supervisor read access in kernel mode
>      [ 1234.778787] #PF: error_code(0x0000) - not-present page
>      [ 1234.778791] PGD 0 P4D 0
>      [ 1234.778798] Oops: 0000 [#1] PREEMPT SMP NOPTI
>      [ 1234.778803] CPU: 7 PID: 805 Comm: systemd-journal Not tainted 6.0.0+ #2
>      [ 1234.778809] Hardware name: System manufacturer System Product
>      Name/PRIME X370-PRO, BIOS 5603 07/28/2020
>      [ 1234.778813] RIP: 0010:drm_sched_job_done.isra.0+0xc/0x140 [gpu_sched]
>      [ 1234.778828] Code: aa 0f 1d ce e9 57 ff ff ff 48 89 d7 e8 9d 8f 3f
>      ce e9 4a ff ff ff 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 54 55 53
>      48 89 fb <48> 8b af 88 00 00 00 f0 ff 8d f0 00 00 00 48 8b 85 80 01 00
>      00 f0
>      [ 1234.778834] RSP: 0000:ffffabe680380de0 EFLAGS: 00010087
>      [ 1234.778839] RAX: ffffffffc04e9230 RBX: 0000000000000000 RCX: 0000000000000018
>      [ 1234.778897] RDX: 00000ba278e8977a RSI: ffff953fb288b460 RDI: 0000000000000000
>      [ 1234.778901] RBP: ffff953fb288b598 R08: 00000000000000e0 R09: ffff953fbd98b808
>      [ 1234.778905] R10: 0000000000000000 R11: ffffabe680380ff8 R12: ffffabe680380e00
>      [ 1234.778908] R13: 0000000000000001 R14: 00000000ffffffff R15: ffff953fbd9ec458
>      [ 1234.778912] FS:  00007f35e7008580(0000) GS:ffff95428ebc0000(0000)
>      knlGS:0000000000000000
>      [ 1234.778916] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>      [ 1234.778919] CR2: 0000000000000088 CR3: 000000010147c000 CR4: 00000000003506e0
>      [ 1234.778924] Call Trace:
>      [ 1234.778981]  <IRQ>
>      [ 1234.778989]  dma_fence_signal_timestamp_locked+0x6a/0xe0
>      [ 1234.778999]  dma_fence_signal+0x2c/0x50
>      [ 1234.779005]  amdgpu_fence_process+0xc8/0x140 [amdgpu]
>      [ 1234.779234]  sdma_v3_0_process_trap_irq+0x70/0x80 [amdgpu]
>      [ 1234.779395]  amdgpu_irq_dispatch+0xa9/0x1d0 [amdgpu]
>      [ 1234.779609]  amdgpu_ih_process+0x80/0x100 [amdgpu]
>      [ 1234.779783]  amdgpu_irq_handler+0x1f/0x60 [amdgpu]
>      [ 1234.779940]  __handle_irq_event_percpu+0x46/0x190
>      [ 1234.779946]  handle_irq_event+0x34/0x70
>      [ 1234.779949]  handle_edge_irq+0x9f/0x240
>      [ 1234.779954]  __common_interrupt+0x66/0x100
>      [ 1234.779960]  common_interrupt+0xa0/0xc0
>      [ 1234.779965]  </IRQ>
>      [ 1234.779968]  <TASK>
>      [ 1234.779971]  asm_common_interrupt+0x22/0x40
>      [ 1234.779976] RIP: 0010:finish_mkwrite_fault+0x22/0x110
>      [ 1234.779981] Code: 1f 84 00 00 00 00 00 90 0f 1f 44 00 00 41 55 41
>      54 55 48 89 fd 53 48 8b 07 f6 40 50 08 0f 84 eb 00 00 00 48 8b 45 30
>      48 8b 18 <48> 89 df e8 66 bd ff ff 48 85 c0 74 0d 48 89 c2 83 e2 01 48
>      83 ea
>      [ 1234.779985] RSP: 0000:ffffabe680bcfd78 EFLAGS: 00000202
>
>      Revert it for now and figure it out later.
>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 820c0c5544e1..ea7bfa99d6c9 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -790,7 +790,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>   	job = list_first_entry_or_null(&sched->pending_list,
>   				       struct drm_sched_job, list);
>   
> -	if (job && dma_fence_is_signaled(job->s_fence->parent)) {
> +	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>   		/* remove job from pending_list */
>   		list_del_init(&job->list);
>   
> @@ -802,7 +802,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>   
>   		if (next) {
>   			next->s_fence->scheduled.timestamp =
> -				job->s_fence->parent->timestamp;
> +				job->s_fence->finished.timestamp;
>   			/* start TO timer for next job */
>   			drm_sched_start_timeout(sched);
>   		}

