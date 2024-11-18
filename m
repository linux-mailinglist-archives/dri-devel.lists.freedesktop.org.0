Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08ED9D1561
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 17:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102EC10E25F;
	Mon, 18 Nov 2024 16:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oBk29yea";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2058.outbound.protection.outlook.com [40.107.212.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A21710E25F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 16:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eY6ciCykRCG6HgL/7BVmrJnyEC8zqzeS+ysbeFoImFM4iJ75/pKoJcduz8iRZ0M6N2jCoBLypXfJXIVZYBUVT5KKL6sSl1PZJtnxobJ4sQBZtqqIt95CpN6ojfBRYG3t1CwiboZWP5aD0gQ8h8UiKpXCa/MNWeAKy70WBMeeZcPjT7gVY6EfY2C24FLmi5aqftxeRCpYrbZTjuExm+0Nm4oHLbHvcu2E+fWEhLkUEKQNleOJDzmiKz3Q/9A7gONEbBK6tgwGSVQAq3oXhVmHhpolP2NuDioCSl9YLyQ2VWZDLXKEzu6FyYGLQslCA/hIF4Kp6+KDXGJ5aoTCE8yCkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrqpW6SOIG5GfjLRUe8drriiOwIeklpTxVMqgXOtarc=;
 b=chMV0Xi2VPJBeFTe9M/h9xv5BqI0nZ+YUTvfhOc6juxLjPze3hepUdCX1J5yj465V9LBBsUeNgYxt6KborOugHYk3EGb2fkY7dITGOjll/UHlVfk8HwNm/uNW/SMx5IHKXQJQJE77aCJz96XTYP366oHXqhB+ox8vv4x4SUDtuW29phteQBhcK+iy7i584to8Ak+z2ypKVKurpqy+OtFhIqp4s8C+jK3whS7IYKofGFor6/bG3YUxlhIZFn3pDYO4kTZh6SdxOhXZv4IPoATtoyy6tgSWP3FRKdwelck8NafH9xg/RXnMry/8YVrcWoAYc21w6bksWVFWjoff54cPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrqpW6SOIG5GfjLRUe8drriiOwIeklpTxVMqgXOtarc=;
 b=oBk29yeaJKmJRc2F6CdGJixzd0xi7ptuTNqf+cZAW+ccTNN7+JmK1nB1bcAbjJaakdKkcnRJJuJYNP/6fIniKQQ5/lDahmBWvtRMGXGZ+5dekZ5DhVn9cv1qvElmaGINmWwaUd/a4S638wOSPUuUsuOYcFTDxgdJD7aHqZ3a4/w=
Received: from MW4PR04CA0146.namprd04.prod.outlook.com (2603:10b6:303:84::31)
 by SJ2PR12MB7797.namprd12.prod.outlook.com (2603:10b6:a03:4c5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Mon, 18 Nov
 2024 16:31:14 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::a7) by MW4PR04CA0146.outlook.office365.com
 (2603:10b6:303:84::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Mon, 18 Nov 2024 16:31:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 18 Nov 2024 16:31:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 10:31:13 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 10:31:12 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 18 Nov 2024 10:31:12 -0600
Message-ID: <aabe8b73-32e0-7123-bcc7-6b6515815047@amd.com>
Date: Mon, 18 Nov 2024 08:31:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V10 07/10] accel/amdxdna: Add command execution
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20241112194745.854626-1-lizhi.hou@amd.com>
 <20241112194745.854626-8-lizhi.hou@amd.com>
 <749e9a1d-7bcf-0c04-41b3-e0a4b89068bd@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <749e9a1d-7bcf-0c04-41b3-e0a4b89068bd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|SJ2PR12MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: 653e08c6-9362-493e-c995-08dd07ee6b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czVQamRWK28va0NXalExeEg2WVg2ekdXKzZlU2RPdDB1WVBCbDV2MCt6UGpm?=
 =?utf-8?B?SExycVRsbk9EZk1mZnNVaWtra2FJQzdZSlJkN0Z6S0k0OW5xYXhSYnZONTlo?=
 =?utf-8?B?eXF0Q2EycFZqbk5JNmh3cUJoLys2dkZKQmU3ejVrbTJHcXZjT1NLSnZQQlNR?=
 =?utf-8?B?dGVoN2dHUmxtRTI2YTJPWHVRa1R0Qm51OGlwK1pRVmJhMUV2M0ZObE95R0l4?=
 =?utf-8?B?WWhQY29BeCtuR09USXJsSCtjNEwzNGRPeFZHMlJMMCtrTjJXdFEwVkw1ejhF?=
 =?utf-8?B?QkRwWEFLWjZyMkxvSTRuM0w5YnV6eWVOb2J4czJ5NkdiVnJIWEw2Ti9UdlNN?=
 =?utf-8?B?THg5TWVsR051SXo2WlNmc3l1SEZGTUJaOEdBYmljL2lyclU0RnZuT1pUazJY?=
 =?utf-8?B?YlV0T05TaVM2YUpJdVBMSXJHT0xiblpCQjZRSHlycGxod2s5S0s1cnVCTjZ3?=
 =?utf-8?B?WHJ4eVJtVEVIWGFGdjFCWWdmU1VsTzI4eEFKaVBKQVBJQ2szbDZKVmdZcmxQ?=
 =?utf-8?B?eEl3d0ZTM2UxcVk2TGdDb1Q4SkJOMzVUcjhMYXdNWG1uVVVyZWJmT080MUVu?=
 =?utf-8?B?Y3ZJV1lXczVYZFBMV0JIQVY3M3hlcUJlcDZmYURhTVJIbXBXa3JaSGR2MFIy?=
 =?utf-8?B?MWFpb3JtajJmb2xleVBTUmRGcTJSZ1lZOXl2UlJFU2J1NUFhMHlLdGxuTmFx?=
 =?utf-8?B?R3E3K1FVZGVva3duallQVGFwakJvNjVMMmNNcHQ5TWtZVGh1Zmx5dTZyRmpk?=
 =?utf-8?B?NjRaN3dMNUxoMGJ5ZzN2OWgxRDE2Vngxa05TSkdWWXFOSCtiUkl5UndDUGFi?=
 =?utf-8?B?UTVZMW9idnB0ZlZYTldubURPa2l2aFFDSWErdmxUSnBoeGd5ZXZoTFZEQzBK?=
 =?utf-8?B?UXliVXppQ2FMUnVlMGpFRDAxVlVWK3UydVBVeVFUYmh6UGwyM2UzS0dkOU9o?=
 =?utf-8?B?UGhjeXhNSUtLOXQyYjg4bk1RWFBNM0ZHeGRwdDlDNXdWaUxNK3hiVUM5ejVl?=
 =?utf-8?B?eEhYQlFlZ1pzSTFDKzZiTGJKbG9QNFFIK3A1L0JncTAxRmpEaTVnRmxjNjRR?=
 =?utf-8?B?MnRUT2kreSt4QVVMQUIyUzQ3dDRUWGxWalNBamV2bkdncG9HbE40eEtYdE41?=
 =?utf-8?B?WmI1T0tjR0hQRTh4enl1OXdPbVlweUY2WXRtN2p4dVJkMXhyVFBDbkdHSzg5?=
 =?utf-8?B?NTR0Q3hHSHdQR00wN3VxdVYzY2F1WTdISEJ1d1poeStsaHpoc0pra0V3MEVu?=
 =?utf-8?B?eGk1OGN0OUl6MVZxNUhPVXBpemlLVXBqbDBqWXREbUZmdFZiTEI5ODlabDBV?=
 =?utf-8?B?MzJNRURGdlkvbjlLUHRGVVVXYndjSEdzVVptYy94VWRkV0tWNCtOd0pZODlO?=
 =?utf-8?B?Wm9pdzFQUUk0eDZOc1JEVU9VcnRuVUZ4Y3BGTkgvaFE1d1NyczhDdy93UGd3?=
 =?utf-8?B?V2ZiMHlVc1lwMWdMZXh3clMxRnVYRCtxV0tjejZ5MHdtODQ5NmZsNUtYUkoz?=
 =?utf-8?B?MnczM2NhK1FNUC9mNlo2ZUpyWE1Ba3ZaTExSQ0V4TVlzT3pFSlNOZFd1bGdi?=
 =?utf-8?B?czRsenY0ZnZKRHlzQU9pK05KVWRQSTdvWFpLR2orSytCUFM0M1hCYmJMdUVv?=
 =?utf-8?B?bVJiR0w5aDZ1MkJTVTFvTVRRQzZFMWVVR1NPSFJRcHFvZXRaZDA1czNJNFdy?=
 =?utf-8?B?VVhaYTBFVGRaQU1nYnZjVWh2Vm9UK240WDAzUStNQWhHdHNtbnpoU3Bvd0h5?=
 =?utf-8?B?YkJEZnFRYm5PdS80b3BpK0VnM21ZemN4SjFuMEl1M1JrNWVJemFDMW9Ebllp?=
 =?utf-8?B?L3ZUTXE5MUgwbEVWc2c3VnppUUFlSUJmRUUrcWhDVFA3d2N5MEVnQ0d3Tmox?=
 =?utf-8?B?MlhXdlRDUTE0VCtXZ05uMGhiQitKZEtqOEtvQlhJQ080UGc9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.12; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:atlvpn-bp.amd.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 16:31:13.9800 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 653e08c6-9362-493e-c995-08dd07ee6b66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.12];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7797
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

Sure. I will fix these two and post v11 patch set.


Lizhi

On 11/17/24 12:03, Jeffrey Hugo wrote:
> On 11/12/2024 12:47 PM, Lizhi Hou wrote:
>> @@ -88,6 +91,8 @@ struct amdxdna_client {
>>       struct list_head        node;
>>       pid_t                pid;
>>       struct mutex            hwctx_lock; /* protect hwctx */
>> +    /* do NOT wait this srcu when hwctx_lock is hold */
>
> do NOT wait on this srcu when hwctx_lock is held
>
>> +    struct srcu_struct        hwctx_srcu;
>>       struct idr            hwctx_idr;
>>       struct amdxdna_dev        *xdna;
>>       struct drm_file            *filp;
>
>
> The significant problem I see currently is that this got merged -
>
> commit b2ef808786d93df36585cee42cfb973fc41636eb
> Author: Christian König <ckoenig.leichtzumerken@gmail.com>
> Date:   Mon Aug 26 14:25:38 2024 +0200
>
>     drm/sched: add optional errno to drm_sched_start()
>
> I can no longer compile this patch.  Specifically I see -
>
>   INSTALL libsubcmd_headers
>   UPD     include/config/kernel.release
>   UPD     include/generated/utsrelease.h
>   CALL    scripts/checksyscalls.sh
>   CC      init/version.o
>   AR      init/built-in.a
>   CC      kernel/sys.o
>   CC      drivers/base/firmware_loader/main.o
>   CC      kernel/module/main.o
>   CC [M]  drivers/accel/amdxdna/aie2_ctx.o
>   CC [M]  drivers/accel/amdxdna/aie2_message.o
>   CC [M]  drivers/accel/amdxdna/aie2_pci.o
>   CC [M]  drivers/accel/amdxdna/aie2_psp.o
>   CC [M]  drivers/accel/amdxdna/aie2_smu.o
>   CC [M]  drivers/accel/amdxdna/amdxdna_ctx.o
>   CC [M]  drivers/accel/amdxdna/amdxdna_gem.o
>   CC [M]  drivers/accel/amdxdna/amdxdna_mailbox.o
>   CC [M]  drivers/accel/amdxdna/amdxdna_mailbox_helper.o
>   CC [M]  drivers/accel/amdxdna/amdxdna_pci_drv.o
>   CC [M]  drivers/accel/amdxdna/amdxdna_sysfs.o
>   CC [M]  drivers/accel/amdxdna/npu1_regs.o
>   CC [M]  drivers/accel/amdxdna/npu2_regs.o
>   CC [M]  drivers/accel/amdxdna/npu4_regs.o
>   CC [M]  drivers/accel/amdxdna/npu5_regs.o
> drivers/accel/amdxdna/aie2_ctx.c: In function ‘aie2_hwctx_restart’:
> drivers/accel/amdxdna/aie2_ctx.c:84:9: error: too few arguments to 
> function ‘drm_sched_start’
>    84 |         drm_sched_start(&hwctx->priv->sched);
>       |         ^~~~~~~~~~~~~~~
> In file included from ./include/trace/events/amdxdna.h:12,
>                  from drivers/accel/amdxdna/aie2_ctx.c:14:
> ./include/drm/gpu_scheduler.h:593:6: note: declared here
>   593 | void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
>       |      ^~~~~~~~~~~~~~~
> make[5]: *** [scripts/Makefile.build:229: 
> drivers/accel/amdxdna/aie2_ctx.o] Error 1
> make[5]: *** Waiting for unfinished jobs....
>   AR      drivers/base/firmware_loader/built-in.a
>   AR      drivers/base/built-in.a
> make[4]: *** [scripts/Makefile.build:478: drivers/accel/amdxdna] Error 2
> make[3]: *** [scripts/Makefile.build:478: drivers/accel] Error 2
> make[2]: *** [scripts/Makefile.build:478: drivers] Error 2
> make[2]: *** Waiting for unfinished jobs....
>   AR      kernel/module/built-in.a
>   AR      kernel/built-in.a
>
> With the above two things fixed:
>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>
