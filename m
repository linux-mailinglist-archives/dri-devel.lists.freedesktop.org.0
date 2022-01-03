Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA9A482FDD
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 11:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF51E8973E;
	Mon,  3 Jan 2022 10:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB24B8972C;
 Mon,  3 Jan 2022 10:20:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YX8DWc1hTgZ1LQAz/1xJ/5LxoxuBSwq1igBI5Z4E31GuBiYjuF1dXr3wLhCh45STpHGJpVphrOzYpr9Ttzk2X78Dwhj65JJ/84vXNzfhMerWMcdkk3h4N+fcymDVy8r2wrBcQ/SaDWHmWpdgUIhjQaP/I2UbSMbzZq6NHBjN5TnSvXCQIpaB20SPajzWAajC0+LUz9Brn9gl/xBsPnT++ozWmXzWNui1BsHU/S7rrd40+TTO6F3ktxO2o5Z7INx53feg/anZj5lps5pGxaDPboMqq+TpMDRxsYwbMJ8DXOi8M3LHagn9WFy3LmN3Oky6XH1JFMbg+k2blPwUs6jPCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYlxQmB+i15sZ1B2HP+Out9l3WpaEw6R/Kr3sAClojc=;
 b=j4u3LPqyZuJu+Q/5J94G8ec9jzp4SC0g6jyeH7Dl8BZUeiyQd0j3lOHbiPkOvOjpWVXn4F1vctpeNNBuLAbzU5SbTfeyJUO2uHVNPKt75wnLj13QTVdFrg5QzvPnEPZyJ29CE5z0sE9GrNQhoK8/y5meZJhPak8FtFRmjf6Nmhp6h/n8pzqQ8liOwwlhvkrlymw5dgnNI0HhjBszR9pg6Vx8SzrUi360+ry6qcLJ7WWnMJJdq1/I1SCU06OYD0rx35z00KOwzC6CsRprZ4sxBtaWRCrmTBQotudLiJ3UZJ/YWb4nySJ8vscqD5yC5TBCNU3RfAmU0pLk5M21bdocgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYlxQmB+i15sZ1B2HP+Out9l3WpaEw6R/Kr3sAClojc=;
 b=sTBzMlH8lFsgwVh/iua2j9ziUaBrrOs4tkNlDLhP/GrhtZ+BT7kEZKAnhE0n+L45uLsXj1SFJ1EuXWt5Le6nuqaoQ7xhiM77PrmOXbRrbJKH+HW9ycn7q3iG4/1srNDOhZy0ZqFNG5phEPfBtvUyWrwAmWp1lyGQxbuNNdnTgGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1936.namprd12.prod.outlook.com
 (2603:10b6:300:114::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Mon, 3 Jan
 2022 10:20:53 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4844.016; Mon, 3 Jan 2022
 10:20:53 +0000
Subject: Re: [PATCH] radeon: add a force flush to delay work when radeon
 suspend
To: =?UTF-8?B?5ZGo6Zuq5qKF?= <zhouxuemei@wxiat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, amd-gfx <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <AFYAowAGB9CyGd23omXNsqrq.1.1640400988663.Hmail.zhouxuemei@wxiat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ea22a832-b3e9-1997-fd4f-a5932f670074@amd.com>
Date: Mon, 3 Jan 2022 11:20:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <AFYAowAGB9CyGd23omXNsqrq.1.1640400988663.Hmail.zhouxuemei@wxiat.com>
Content-Type: multipart/alternative;
 boundary="------------F9946FA4F079D8D5B556E0D5"
Content-Language: en-US
X-ClientProxiedBy: AM6P192CA0011.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::24) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 897469b4-ff57-42b2-e4e2-08d9cea2b8a7
X-MS-TrafficTypeDiagnostic: MWHPR12MB1936:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB193665205F54033E97DA5B2683499@MWHPR12MB1936.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 65jrnqnSjOtXuExmeAxb2fYtQ5xUTtSl9bx+ncpAFILNKUP53y2yHuHh8GUEgKc40Mrx1JUXFlkysvF0obukyC+LKBkWJwFm4Gp9pTeDpbJL18KHwnMv8A/czEL4hbunYPpU2kT6Y6BEQQY0Ao30TEZEqu/0/esXw4TUK3889pHPNMb4QMQBSRv52Vwlaw8P/9tlAGLihtkgReqL7x83SnlVt0lr3gxN7ZZI/zrTpbi9KjdJyn9rNKwmqHcvyPYRKslRWGFsACmD1OfesOibZidPSoMq1XJqYJ0sKaqYHj/t9k8hXItC1e5TotURd9io3fdfDEV4MBpl4qa+aWFdxLSeVQ2X0yLgUWvQvtFJ3qZmfiXiCB033bRh358mxSpqhggYLPTQiZKmAZwfEFySJamZcGginNYy2mBZxqzldIP0Qb4PZQPgrYhjXYJZ5kF7tGuKZfiO9gw5PpRhUgghH+654UHl9YY6G7kotvx+xrKxPMDzHc30GFOWX4WlSYryTm6VkC3U3dXpvmw8rpzTOQ69Hl4NFsZFzQcvfuTqJuFAAc0C7e/PM8wWKBrsmrbx4A2HGYfHHGfs9d0b1A2GasxZFjuoTLDHTT8rUhH7B31R7mutqMPnRjncUHzscu251gAZsCv0jkwvCuEI6w7Jxl1vieUlr5z7EeciapHlhnK32QyguaklSn71FAZLQ/ZsdapZubKzvovkKPYXEtAtjhLt7YAV6cDNbBaJWKL6z9M8Hq2gqJOV/neWAyqI7AOG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(8936002)(66476007)(66556008)(6666004)(15650500001)(316002)(31686004)(2906002)(110136005)(8676002)(38100700002)(66946007)(31696002)(6512007)(186003)(83380400001)(36756003)(5660300002)(86362001)(6506007)(2616005)(6486002)(33964004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTJXck9CWnR3S1ZpTWwwWTVHSnpiQVgyNUVJamU4MzRwL2NXU1BoMnJVT0ZR?=
 =?utf-8?B?K0VQdEUxTDdyS0NYdlY5VWI4Qk92NXRQUFRmSDd1VVEwenZmT0NYOWo1WTFG?=
 =?utf-8?B?SmFqUWhPMi9HTVlvZmJydExDVGdtdkV4eDZ3Nm1vSjc0U2NMcGtUTWZCS2s0?=
 =?utf-8?B?dkp4b1FxVnZMR2xPZ0h3RnU3L0lSY0hDaHo5TnJBWlZwRlRiNVpkRzRQM1NH?=
 =?utf-8?B?NCtMaG1XREZZSUhSZjdkV2xaZ0VMdkNCdGVRcE42bFVYTVhlVDljK1g4RlBW?=
 =?utf-8?B?VjhrRU9iZUZyc1haMmdnSXpTTkk2T2hRMG9ZV1JRKy9YM01NZEZiY0FRa3Bn?=
 =?utf-8?B?bko4S0c2NVdtSlJtMDNndTdiZGZHWkdiOXE2NjVIbWkxUVgvZzRnL0RVZGcr?=
 =?utf-8?B?a01Sd0JMZWljdElxbVd2WFFndHhac1puNDRQMTdwMGd4MlYxNU93aVhtVEpW?=
 =?utf-8?B?andDMG1wVlZNR3A1cUZXZG0zaUt1YnZTZ1lnem9JNHU5bG5tV3dRRXRabi9q?=
 =?utf-8?B?a3NlVm44aWRZc3J3bWZuVUQxS05BQ0RLZzFwL0ZadzUrUGpBUU5BYWZtRG0z?=
 =?utf-8?B?OHJiWUFlTERYSERDNnlxVm5CZ0wzT3o3a1QvYjUyS1FXZ0J1ajI2SlJvT3px?=
 =?utf-8?B?cndkNWhXZ0ladlFKNFdSWHlDdzlrOE9EdHMyZHlTcEh0RVJXZ3E3NHk4Uit5?=
 =?utf-8?B?QUxTaXhuRUxndVdwa3dtRFdzNzB4VWNXdnRJWUVMKzN1TmhSME5xSGVkTWE2?=
 =?utf-8?B?b0pIekhpMG9qdHo2REZoVzFrREExd0ZLNUJJbG43ZU1rL29VZjZOTjlTWDls?=
 =?utf-8?B?RSt5d2hJYVZZb3RSeTlzalFneStxWW4vMzh6NVE2Nks5WTA4emRnSXF0M2hl?=
 =?utf-8?B?cy9RZ092bFZ0ak5YbXc4TkdBNWpDK3QxTGVRRmZjVFV0cjJKc2VPWHNoR2lF?=
 =?utf-8?B?L2NJS04yaTZGb0RMM2RuNW5rRTFXLzFURE1KL1dFcnczZjFGTmdiWVRURk5K?=
 =?utf-8?B?ejhIMGNCZnV1NXpsY004QXBGMlVDYUp5TUUrNUMyK281QzJTd2FqVVoyRS9F?=
 =?utf-8?B?MGlHRXk3YmE1Y3hJL0U4cGdGWUgzMHlNTlFyYjFUU0VUL1hYQUpXeUtkM1pr?=
 =?utf-8?B?TTlRZzNQQnU1RTF4TGVpZnlDYjZMM3ZqK2c0OG42NDVNOXVRQ3ZWeEdaODVq?=
 =?utf-8?B?cmtwb3RGYXh5S2l4bUFjNUh1ZXMrZkpDN2xSMEI1NjRRRDJhTHRPUWpnSzB0?=
 =?utf-8?B?ZC9sNlF5NjdwL0paQ2VqNG1ha1c5eFZvK3pWQjJ3a294WWtQbE04UHhCS3pL?=
 =?utf-8?B?RGdDUHZNekMxamh2ckNHRTdLaFdaRG9HZUd1UnEvRVlLdVVwTjdCTWNLZFVV?=
 =?utf-8?B?QUVWRDVmMkxuWjRMckF2RHNoVEcwM3NhUk5BYk8rNytWTkd0bXF1T1pXR3R0?=
 =?utf-8?B?NEtyYjBxUWVoMmdWNXVxc1h0dFNLckF6SVVFdWp5Skk0ZFpuelZIL0VaZFpK?=
 =?utf-8?B?L055TDJZNjd2VWdSRC9FV3h6NklkeFFhakprVy81RFBFTExnUVlRK2FqYjll?=
 =?utf-8?B?U0JOais0RlhPOFNnMDNCcExhSmZLOUVIdjM1cUNyU0xMQ1FKVGRDbU1nczlZ?=
 =?utf-8?B?b3UwU0NFdllDWGR5UkZWRXZqK3JtQW1NRjhyazlmcW02TWRtTjlFM3JNRW1B?=
 =?utf-8?B?WkhaWEd3dkFXYVUxbzJ1d1lBQ21WcElLZUVWcFdmSmxBd21VSXR3bFAxWEVY?=
 =?utf-8?B?SGNENjYzTGdwTit6VTF0RkZPSEYySlppek5Od0h3Rk5wODFwbENXclVrS2hm?=
 =?utf-8?B?VlMxSHFpRE5xMmdRa2tkRm1jSTZveVBURTY3MHBuT1U2YXVzOGZ5aXhYLzRk?=
 =?utf-8?B?MEcya1QrWTExNEFkV2xSMDZDVzZHRHlYc0hEMFZraU96SEtoYS9sTDZxVWVq?=
 =?utf-8?B?V2dlNVFWd2c1QzBJVGVWUFB3ZXJrOUVQUVRXTmE2b1hzS1JCak53MFVCRkN3?=
 =?utf-8?B?SFRlbE95T2dRaVNHVDZkWi9IN3pReXhmZUY2OHJ5blJzOFpTUzYyZEJUU1Bx?=
 =?utf-8?B?cTI2NjZCT1FGRUlZUVhkek5wbitaNmtYRTY0eTQwbHZtb2k5dWxVbkpJQklk?=
 =?utf-8?B?a1JGYWJXUTE4MXRNZExGcHFkQ0NtWkVzU1FXSEpTRjFpMHEzME5MZXBXWkRs?=
 =?utf-8?Q?mQgJWDbjvsBu6FcDZwYuisc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 897469b4-ff57-42b2-e4e2-08d9cea2b8a7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2022 10:20:53.4076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vltYZA0paP74NJsMU3AN/z00Hyjwf9DyXAs59/lLfuPqQOnyKj3qc5VqBb2wuzTn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1936
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

--------------F9946FA4F079D8D5B556E0D5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 25.12.21 um 03:56 schrieb 周雪梅:
> Although radeon card fence and wait for gpu to finish processing 
> current batch rings,
> there is still a corner case that radeon lockup work queue may not be 
> fully flushed,
> and meanwhile the radeon_suspend_kms() function has called 
> pci_set_power_state() to
> put device in D3hot state.
>
> Per PCI spec rev 4.0 on 5.3.1.4.1 D3hot State.
> > Configuration and Message requests are the only TLPs accepted by a 
> Function in
> > the D3hot state. All other received Requests must be handled as 
> Unsupported Requests,
> > and all received Completions may optionally be handled as Unexpected 
> Completions.

Well first of all this is the completely wrong place for this. The flush 
belongs into the fence code and not here.

Then I don't think that this is a good idea since it might cause deadlocks.

Christian.


>
> This issue will happen in following logs:
>
> 1Unable to handle kernel paging request at virtual address 
> 00008800e0008010
> CPU 0 kworker/0:3(131): Oops 0
> pc = [<ffffffff811bea5c>]  ra = [<ffffffff81240844>]  ps = 0000 
> Tainted: G        W
> pc is at si_gpu_check_soft_reset+0x3c/0x240
> ra is at si_dma_is_lockup+0x34/0xd0
> v0 = 0000000000000000  t0 = fff08800e0008010  t1 = 0000000000010000
> t2 = 0000000000008010  t3 = fff00007e3c00000  t4 = fff00007e3c00258
> t5 = 000000000000ffff  t6 = 0000000000000001  t7 = fff00007ef078000
> s0 = fff00007e3c016e8  s1 = fff00007e3c00000  s2 = fff00007e3c00018
> s3 = fff00007e3c00000  s4 = fff00007fff59d80  s5 = 0000000000000000
> s6 = fff00007ef07bd98
> a0 = fff00007e3c00000  a1 = fff00007e3c016e8  a2 = 0000000000000008
> a3 = 0000000000000001  a4 = 8f5c28f5c28f5c29  a5 = ffffffff810f4338
> t8 = 0000000000000275  t9 = ffffffff809b66f8 t10 = ff6769c5d964b800
> t11= 000000000000b886  pv = ffffffff811bea20  at = 0000000000000000
> gp = ffffffff81d89690  sp = 00000000aa814126
> 4Disabling lock debugging due to kernel taint
> Trace:
> [<ffffffff81240844>] si_dma_is_lockup+0x34/0xd0
> [<ffffffff81119610>] radeon_fence_check_lockup+0xd0/0x290
> [<ffffffff80977010>] process_one_work+0x280/0x550
> [<ffffffff80977350>] worker_thread+0x70/0x7c0
> [<ffffffff80977410>] worker_thread+0x130/0x7c0
> [<ffffffff80982040>] kthread+0x200/0x210
> [<ffffffff809772e0>] worker_thread+0x0/0x7c0
> [<ffffffff80981f8c>] kthread+0x14c/0x210
> [<ffffffff80911658>] ret_from_kernel_thread+0x18/0x20
> [<ffffffff80981e40>] kthread+0x0/0x210
>
>  Code: ad3e0008  43f0074a  ad7e0018  ad9e0020 8c3001e8  40230101
>  <88210000> 4821ed21
>
> So force lockup work queue flush to fix this problem.
>
> Reviewed-by: Su Weiqiang <suweiqiang@wxiat.com>
> Reviewed-by: Zhou Xuemei <zhouxuemei@wxiat.com>
> Signed-off-by: Xu Chenjiao <xuchenjiao@wxiat.com>
> ---
>  drivers/gpu/drm/radeon/radeon_device.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c 
> b/drivers/gpu/drm/radeon/radeon_device.c
> index 59c8a6647ff2..cc1c07963116 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1625,6 +1625,9 @@ int radeon_suspend_kms(struct drm_device *dev, 
> bool suspend,
> if (r) {
> /* delay GPU reset to resume */
> radeon_fence_driver_force_completion(rdev, i);
> +} else {
> +/* finish executing delayed work */
> +flush_delayed_work(&rdev->fence_drv[i].lockup_work);
> }
> }
> -- 
> 2.17.1
>
>
>


--------------F9946FA4F079D8D5B556E0D5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 25.12.21 um 03:56 schrieb 周雪梅:<br>
    <blockquote type="cite" cite="mid:AFYAowAGB9CyGd23omXNsqrq.1.1640400988663.Hmail.zhouxuemei@wxiat.com">
      
      <div style="">
        <div style="">
          <div style="">Although radeon card fence and wait for gpu to
            finish processing current batch rings,</div>
          <div style="">there is still a corner case that radeon lockup
            work queue may not be fully flushed,</div>
          <div style="">and meanwhile the radeon_suspend_kms() function
            has called pci_set_power_state() to</div>
          <div style="">put device in D3hot state.</div>
          <div style=""><br>
          </div>
          <div style="">Per PCI spec rev 4.0 on 5.3.1.4.1 D3hot State.</div>
          <div style="">&gt; Configuration and Message requests are the
            only TLPs accepted by a Function in</div>
          <div style="">&gt; the D3hot state. All other received
            Requests must be handled as Unsupported Requests,</div>
          <div style="">&gt; and all received Completions may optionally
            be handled as Unexpected Completions.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Well first of all this is the completely wrong place for this. The
    flush belongs into the fence code and not here.<br>
    <br>
    Then I don't think that this is a good idea since it might cause
    deadlocks.<br>
    <br>
    Christian.<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:AFYAowAGB9CyGd23omXNsqrq.1.1640400988663.Hmail.zhouxuemei@wxiat.com">
      <div style="">
        <div style="">
          <div style=""><br>
          </div>
          <div style="">This issue will happen in following logs:</div>
          <div style=""><br>
          </div>
          <div style="">1Unable to handle kernel paging request at
            virtual address 00008800e0008010</div>
          <div style="">CPU 0 kworker/0:3(131): Oops 0</div>
          <div style="">pc = [&lt;ffffffff811bea5c&gt;]&nbsp; ra =
            [&lt;ffffffff81240844&gt;]&nbsp; ps = 0000 Tainted: G&nbsp; &nbsp; &nbsp; &nbsp; W</div>
          <div style="">pc is at si_gpu_check_soft_reset+0x3c/0x240</div>
          <div style="">ra is at si_dma_is_lockup+0x34/0xd0</div>
          <div style="">v0 = 0000000000000000&nbsp; t0 = fff08800e0008010&nbsp; t1
            = 0000000000010000</div>
          <div style="">t2 = 0000000000008010&nbsp; t3 = fff00007e3c00000&nbsp; t4
            = fff00007e3c00258</div>
          <div style="">t5 = 000000000000ffff&nbsp; t6 = 0000000000000001&nbsp; t7
            = fff00007ef078000</div>
          <div style="">s0 = fff00007e3c016e8&nbsp; s1 = fff00007e3c00000&nbsp; s2
            = fff00007e3c00018</div>
          <div style="">s3 = fff00007e3c00000&nbsp; s4 = fff00007fff59d80&nbsp; s5
            = 0000000000000000</div>
          <div style="">s6 = fff00007ef07bd98</div>
          <div style="">a0 = fff00007e3c00000&nbsp; a1 = fff00007e3c016e8&nbsp; a2
            = 0000000000000008</div>
          <div style="">a3 = 0000000000000001&nbsp; a4 = 8f5c28f5c28f5c29&nbsp; a5
            = ffffffff810f4338</div>
          <div style="">t8 = 0000000000000275&nbsp; t9 = ffffffff809b66f8&nbsp;
            t10 = ff6769c5d964b800</div>
          <div style="">t11= 000000000000b886&nbsp; pv = ffffffff811bea20&nbsp; at
            = 0000000000000000</div>
          <div style="">gp = ffffffff81d89690&nbsp; sp = 00000000aa814126</div>
          <div style="">4Disabling lock debugging due to kernel taint</div>
          <div style="">Trace:</div>
          <div style="">[&lt;ffffffff81240844&gt;]
            si_dma_is_lockup+0x34/0xd0</div>
          <div style="">[&lt;ffffffff81119610&gt;]
            radeon_fence_check_lockup+0xd0/0x290</div>
          <div style="">[&lt;ffffffff80977010&gt;]
            process_one_work+0x280/0x550</div>
          <div style="">[&lt;ffffffff80977350&gt;]
            worker_thread+0x70/0x7c0</div>
          <div style="">[&lt;ffffffff80977410&gt;]
            worker_thread+0x130/0x7c0</div>
          <div style="">[&lt;ffffffff80982040&gt;] kthread+0x200/0x210</div>
          <div style="">[&lt;ffffffff809772e0&gt;]
            worker_thread+0x0/0x7c0</div>
          <div style="">[&lt;ffffffff80981f8c&gt;] kthread+0x14c/0x210</div>
          <div style="">[&lt;ffffffff80911658&gt;]
            ret_from_kernel_thread+0x18/0x20</div>
          <div style="">[&lt;ffffffff80981e40&gt;] kthread+0x0/0x210</div>
          <div style=""><br>
          </div>
          <div style="">&nbsp;Code: ad3e0008&nbsp; 43f0074a&nbsp; ad7e0018&nbsp; ad9e0020&nbsp;
            8c3001e8&nbsp; 40230101</div>
          <div style="">&nbsp;&lt;88210000&gt; 4821ed21</div>
          <div style=""><br>
          </div>
          <div style="">So force lockup work queue flush to fix this
            problem.</div>
          <div style=""><br>
          </div>
          <div style="">Reviewed-by: Su Weiqiang
            <a class="moz-txt-link-rfc2396E" href="mailto:suweiqiang@wxiat.com">&lt;suweiqiang@wxiat.com&gt;</a></div>
          <div style="">Reviewed-by: Zhou Xuemei
            <a class="moz-txt-link-rfc2396E" href="mailto:zhouxuemei@wxiat.com">&lt;zhouxuemei@wxiat.com&gt;</a></div>
          <div style="">Signed-off-by: Xu Chenjiao
            <a class="moz-txt-link-rfc2396E" href="mailto:xuchenjiao@wxiat.com">&lt;xuchenjiao@wxiat.com&gt;</a></div>
          <div style="">---</div>
          <div style="">&nbsp;drivers/gpu/drm/radeon/radeon_device.c | 3 +++</div>
          <div style="">&nbsp;1 file changed, 3 insertions(+)</div>
          <div style=""><br>
          </div>
          <div style="">diff --git
            a/drivers/gpu/drm/radeon/radeon_device.c
            b/drivers/gpu/drm/radeon/radeon_device.c</div>
          <div style="">index 59c8a6647ff2..cc1c07963116 100644</div>
          <div style="">--- a/drivers/gpu/drm/radeon/radeon_device.c</div>
          <div style="">+++ b/drivers/gpu/drm/radeon/radeon_device.c</div>
          <div style="">@@ -1625,6 +1625,9 @@ int
            radeon_suspend_kms(struct drm_device *dev, bool suspend,</div>
          <div style="">&nbsp;<span style="white-space:pre">		</span>if (r) {</div>
          <div style="">&nbsp;<span style="white-space:pre">			</span>/*
            delay GPU reset to resume */</div>
          <div style="">&nbsp;<span style="white-space:pre">			</span>radeon_fence_driver_force_completion(rdev,
            i);</div>
          <div style="">+<span style="white-space:pre">		</span>} else {</div>
          <div style="">+<span style="white-space:pre">			</span>/*
            finish executing delayed work */</div>
          <div style="">+<span style="white-space:pre">			</span>flush_delayed_work(&amp;rdev-&gt;fence_drv[i].lockup_work);</div>
          <div style="">&nbsp;<span style="white-space:pre">		</span>}</div>
          <div style="">&nbsp;<span style="white-space:pre">	</span>}</div>
          <div style="">&nbsp;</div>
          <div style="">--&nbsp;</div>
          <div style="">2.17.1</div>
        </div>
        <div style="color: rgb(0, 0, 0); font-family: arial; font-size:
          14px;"><br>
        </div>
        <div style="color: rgb(0, 0, 0); font-family: arial; font-size:
          14px;"><br>
        </div>
      </div>
      <!-- jy5ContentSuffix --><br>
    </blockquote>
    <br>
  </body>
</html>

--------------F9946FA4F079D8D5B556E0D5--
