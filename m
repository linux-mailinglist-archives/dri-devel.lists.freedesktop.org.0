Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7899B4DD3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 16:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0669C10E286;
	Tue, 29 Oct 2024 15:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="W6GVsBFV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2083.outbound.protection.outlook.com [40.107.100.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CAC10E286
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 15:24:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rvl1+I3Nk5Dj3N49xB5lUZrLmJPqFLVJOJB3XVOWIyKeTjytocm+Y9EBJuwBmtG1eIFcBivFSbYejUylGmUEsSrNPNVHvYDhR4BMSriwQ8ISTZbAVlP0tKlSapY1CZ/eh+HVirliN0owDIap2g6O2Qb3YvoC8uRf7vYnDJXC0aP4XRLQrTckGltQVobG6fDyscdv/LaQEYnR77xd3yraMZiEV8qp6C7YyoRvA34P8FgFNZYksRQz3Ls5QZB9aPAKqzPzsQ+NSX84gb9kGOhlF7xOeGGBJ60SKvV5QUkiIgl9KqLlC8RKq5S/hrKGQOi0dmPES6ewZwrgwvkszY13zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvIcGJ5yAUJqDO0HpQbASfAuaWzxwk4f0pSqK0y8yhg=;
 b=i/RSWx2RZdHQI0dfa70EIm7yktOSSRWIGOM/QOGx93iLXWVQdkvDHGY0tYLlfO4xEl6lUYUc2Wku4l2SZ1pv86EU6srQcBWd+PPliXGD+FTJUuDCJvWtPXgNzByO09vyGhzbr2+cNIT4YBWoc9Q5eKGSQHcokalkpigTLQHDm9eSmnfZhqLWw8h2kE5MLJq7ZnFSet8Q0VjW06OvSAo4gWJqVmRerz88PgJCqu6rEFDrQvT3VP+sYzQ08M1aSMWJtxIJLHPGBCcYD7eGVAGenTuuf4G9LFUANEX64Plwgrvw+Pyy2VhJvQRbFXSHctUMOUQ7mFe8pHJma3ExangT7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvIcGJ5yAUJqDO0HpQbASfAuaWzxwk4f0pSqK0y8yhg=;
 b=W6GVsBFV8fXdpPQA65N+P9aFM6YGDH+SDkmHB4cB2PQ2w6g21hQTM93v4Gu/cdBqeH2YiWSTUrJp+PQiQqzS5OfGWI0NNZgOON5ZgUmUOzVw/+IYX/CfrTF1OwFLsAjsM2Yy1k3v8oeqhTQitHhQF6AoSmRZXfWNjZZSoptzJk0=
Received: from BN9PR03CA0618.namprd03.prod.outlook.com (2603:10b6:408:106::23)
 by SJ0PR12MB6829.namprd12.prod.outlook.com (2603:10b6:a03:47b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Tue, 29 Oct
 2024 15:24:39 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:408:106:cafe::df) by BN9PR03CA0618.outlook.office365.com
 (2603:10b6:408:106::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Tue, 29 Oct 2024 15:24:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 15:24:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 10:24:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 10:24:38 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 29 Oct 2024 10:24:37 -0500
Message-ID: <43cb44d6-86f2-66a3-0167-6c75a97b3c9a@amd.com>
Date: Tue, 29 Oct 2024 08:24:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V5 00/10] AMD XDNA driver
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20241021161931.3701754-1-lizhi.hou@amd.com>
 <de895a18-e40f-4996-b799-0a957bd3ca48@quicinc.com>
 <28047f7a-ee20-0b5b-5bdc-5dea8e0bd412@amd.com>
 <49b76568-572d-b3ef-da79-36f1a3c44f27@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <49b76568-572d-b3ef-da79-36f1a3c44f27@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|SJ0PR12MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d96e57-4e3e-4d81-a491-08dcf82dcdd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmVSdDRVbGRXbmlvbGNoSGwxWkwwL25KUDJpM1lSTzVvOFpLVERBUUNRU05H?=
 =?utf-8?B?Z2lNelVmSkpVMW5ZY2lvRWVqa3htWStVSUZnM21MeTJFb1NVeFE1VGRnV3Bw?=
 =?utf-8?B?MGdsZXJRRHJPYkNZQnlJZHNLNzhuUGpaeWVwbVlDbXY3ZERjODI4dFdLVXly?=
 =?utf-8?B?cEd6TE1mQzh6SGxwaWkxblhYb2syQU91c0tIclVpbHhZMytPbnRaR1B3aGc4?=
 =?utf-8?B?ZUw1RFBVUkl2NmJzMDVMUFQzRjA5K28yNVV2Q0FOR2RYcHd4TDI0MDlpMDhn?=
 =?utf-8?B?empOUVZJVTBBNDFnemVzSXkzQlJ0SDFxVzZKWFErY2ZwWHJIbkpud3FyTlJo?=
 =?utf-8?B?elNyT2hqWDQrZnFIaG9CUGNzOVp4UzQ4dTYwSkJCNXRWZnZ0ZHhIM1R4MjRh?=
 =?utf-8?B?YU1IaTFtdm1nOFkyeTZkL3h2N202MGFFYlhvaTdJL3hMWU5NVTFpU1NGU2VR?=
 =?utf-8?B?K05LSlRrTmgyRFVFVlROQVpRWmJGVnM2OXA0ZG8vVHN4OUdZVGRaS0k3ZFg5?=
 =?utf-8?B?SitRY0pibzgvVHdpVUVpdW4rcC9sM0JLeC9iK3dmNHdBOHREbWlkdUoyVzVB?=
 =?utf-8?B?K1Y0K3ZJMUNMdUdoUlpOaWQyTUtURVIyc3ZmMmNxWGh4bkRETXYyLzdhdit2?=
 =?utf-8?B?SUlDTENMR0ZHUmI2OEpxV29yak5FSWVST1pTM0t0NmFZUlFTUTFtSzNuOUpu?=
 =?utf-8?B?SWMzUTcrUk5Ed2xRUDdQN0FXU2Fjd1B4dWdETnpDdWROZkd2THhjcFFYcG5l?=
 =?utf-8?B?VUcwc0ZUVExsR01zM2JsK1RRQ3Rwcm9pMXFPNmUwVlFnMmoxV0VNMkhzVEdW?=
 =?utf-8?B?VTZ4THdzUHRwUDVkSGtTQXdCRE95UWU4NGNRK1lBNnAvcENMMnJyQ21yTVhm?=
 =?utf-8?B?L3JRb2E3OFpxV2d0ajAzeW9VWUdvaUc0b2JiTnVZWFFoT296bGp6TWRvY2RF?=
 =?utf-8?B?NWxWSzBCeDYya3J0Y3hTT1J1SFcyUWJwK2pveXloSzMvdkdNOC9UaUl1ZU54?=
 =?utf-8?B?c283d2xkSWZ6WTJqQ1MrQ3BabXZvWVVCREZ3SEdsQi8wSWtaYVBvSWREMXZZ?=
 =?utf-8?B?bUFTNVJkT0NHWkkrcUZ1UEs4T2FCdXZySmZzZy80K3hNTkNTV0traGFyWmVM?=
 =?utf-8?B?aXZNSTR5UEpQMVB0eWFSMmloNGVVMERVSUMwcHhSYlVKUkhpa0QwUTFod3d3?=
 =?utf-8?B?eEVZeTdjQjhqMmp4ck9QMFRwMFlnb1B3Qm5laEEwVnltYWRBc0ZjUlJVWDhJ?=
 =?utf-8?B?VFhsc2IwVk0yTlJEMmpFTUZRUCs4b2VlclBkVjBwS0VXQWRvRDVNczIraFhR?=
 =?utf-8?B?L0xpcnNydnlFRDVDVVVMdEdwWEdxNmE4aWxPNjU5OHRkUWNOUWl0TFhrS3pH?=
 =?utf-8?B?biszS1k1Uk01Z29GS3hZVU5qeWcwWVR2THV1UE1Da1VUQmhla2xlR1NJUjVx?=
 =?utf-8?B?ZTJLU2QwM2Fnd3pVbUF6ZE5DdlNnWGkzd0lBcGdva05SRmN5VkJGZDhvUloy?=
 =?utf-8?B?WTNBbnI1WUs0WG1LY1NWaTA4TFdqMmRDVnI0cUQ4VVBwNEFvaFZYRUlXLzRi?=
 =?utf-8?B?R2l5OEVubVdXUFBEYTQ3VzVuMEMvT09FRXRZMTV2YkZvcEhWZUNQcDRXRlBZ?=
 =?utf-8?B?L2MwWW1SMVFqRjM3SUl2aWNEQ0c4cTdiQ3lRb0hmMGNSSHJBQmdHOUN6b2Vm?=
 =?utf-8?B?WURMOTk0WjVQOTA4WG5HbVhQVmNqQUxMdFpITW00NWNmR1NIZlZUWGV5Q2My?=
 =?utf-8?B?U3dGSlNlU3g5dTM5ZEI3eUtkN0hUSFdnV2dBWFNFYmpUSTVCOUxxU09BL2FT?=
 =?utf-8?Q?hWxeqtIJ9GsM8Vag5UHzp1tCf1HrDkx5G6MzY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:24:38.9755 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d96e57-4e3e-4d81-a491-08dcf82dcdd6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6829
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


On 10/25/24 15:02, Jeffrey Hugo wrote:
> On 10/25/2024 3:28 PM, Lizhi Hou wrote:
>>
>> On 10/25/24 10:55, Jeffrey Hugo wrote:
>>> On 10/21/2024 10:19 AM, Lizhi Hou wrote:
>>>> This patchset introduces a new Linux Kernel Driver, amdxdna for AMD 
>>>> NPUs.
>>>> The driver is based on Linux accel subsystem.
>>>>
>>>> NPU (Neural Processing Unit) is an AI inference accelerator integrated
>>>> into AMD client CPUs. NPU enables efficient execution of Machine 
>>>> Learning
>>>> applications like CNNs, LLMs, etc.  NPU is based on AMD XDNA
>>>> architecture [1].
>>>>
>>>> AMD NPU consists of the following components:
>>>>
>>>>    - Tiled array of AMD AI Engine processors.
>>>>    - Micro Controller which runs the NPU Firmware responsible for
>>>>      command processing, AIE array configuration, and execution 
>>>> management.
>>>>    - PCI EP for host control of the NPU device.
>>>>    - Interconnect for connecting the NPU components together.
>>>>    - SRAM for use by the NPU Firmware.
>>>>    - Address translation hardware for protected host memory access 
>>>> by the
>>>>      NPU.
>>>>
>>>> NPU supports multiple concurrent fully isolated contexts. Concurrent
>>>> contexts may be bound to AI Engine array spatially and or temporarily.
>>>>
>>>> The driver is licensed under GPL-2.0 except for UAPI header which is
>>>> licensed GPL-2.0 WITH Linux-syscall-note.
>>>>
>>>> User mode driver stack consists of XRT [2] and AMD AIE Plugin for 
>>>> IREE [3].
>>>>
>>>> The firmware for the NPU is distributed as a closed source binary, 
>>>> and has
>>>> already been pushed to the DRM firmware repository [4].
>>>>
>>>> [1]https://www.amd.com/en/technologies/xdna.html
>>>> [2]https://github.com/Xilinx/XRT
>>>> [3]https://github.com/nod-ai/iree-amd-aie
>>>> [4]https://gitlab.freedesktop.org/drm/firmware/-/tree/amd-ipu-staging/amdnpu 
>>>>
>>>>
>>>> Changes since v4:
>>>> - Fix lockdep errors
>>>> - Use __u* structure for struct aie_error
>>>
>>> One nit, when you send the next version would you please either To: 
>>> or Cc: me on the entire series?  I only get pieces in my inbox which 
>>> is mildly annoying on my end.
>> Sure.
>>>
>>> Looks like we are getting close here.  One procedural question I 
>>> have, do you have commit permissions to drm-misc?
>> No, I do not have commit permissions yet.
>
> You should apply for access.  Assuming this series is ready before 
> that goes through, I'll apply it.
>
>>> I applied the series to drm-misc-next and tried to build.  Got the 
>>> following errors -
>>
>> Could you share the build command line? So I can reproduce and verify 
>> my fix.
>
> The command is simple:
> make -j20
>
> The system details, incase it somehow matters:
> Ubuntu 22.04 w/ 5.15 kernel
>
> $ lsb_release -a
> No LSB modules are available.
> Distributor ID: Ubuntu
> Description:    Ubuntu 22.04.3 LTS
> Release:        22.04
> Codename:       jammy
>
> $ uname -a
> Linux jhugo-lnx 5.15.0-89-generic #99-Ubuntu SMP Mon Oct 30 20:42:41 
> UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
>
> The kernel config is probably the relevant piece.  When I first built 
> after applying the series, I was asked to choose what to do with the 
> new config item.  I selected =m.
> .config can be found at 
> https://gist.github.com/quic-jhugo/4cc249b1e3ba127039fbc709a513a432
>
>>
>> I used "make M=drivers/accel/amdxdna" and did not reproduce the error 
>> with drm-misc-next. It looks build robot did not complain with the 
>> patch neither.
>>
>> $ git branch
>> * drm-misc-next
>> $ make M=drivers/accel/amdxdna
>>    CC [M]  drivers/accel/amdxdna/aie2_ctx.o
>>    CC [M]  drivers/accel/amdxdna/aie2_error.o
>>    CC [M]  drivers/accel/amdxdna/aie2_message.o
>>    CC [M]  drivers/accel/amdxdna/aie2_pci.o
>>    CC [M]  drivers/accel/amdxdna/aie2_psp.o
>>    CC [M]  drivers/accel/amdxdna/aie2_smu.o
>>    CC [M]  drivers/accel/amdxdna/aie2_solver.o
>>    CC [M]  drivers/accel/amdxdna/amdxdna_ctx.o
>>    CC [M]  drivers/accel/amdxdna/amdxdna_gem.o
>>    CC [M]  drivers/accel/amdxdna/amdxdna_mailbox.o
>>    CC [M]  drivers/accel/amdxdna/amdxdna_mailbox_helper.o
>>    CC [M]  drivers/accel/amdxdna/amdxdna_pci_drv.o
>>    CC [M]  drivers/accel/amdxdna/amdxdna_sysfs.o
>>    CC [M]  drivers/accel/amdxdna/npu1_regs.o
>>    CC [M]  drivers/accel/amdxdna/npu2_regs.o
>>    CC [M]  drivers/accel/amdxdna/npu4_regs.o
>>    CC [M]  drivers/accel/amdxdna/npu5_regs.o
>>    LD [M]  drivers/accel/amdxdna/amdxdna.o
>>    MODPOST drivers/accel/amdxdna/Module.symvers
>>    CC [M]  drivers/accel/amdxdna/amdxdna.mod.o
>>    CC [M]  drivers/accel/amdxdna/.module-common.o
>>    LD [M]  drivers/accel/amdxdna/amdxdna.ko
>> $
>>
>>>
>>>   CC [M]  drivers/accel/amdxdna/aie2_ctx.o
>>>   CC [M]  drivers/accel/amdxdna/aie2_error.o
>>>   CC [M]  drivers/accel/amdxdna/aie2_message.o
>>>   CC [M]  drivers/accel/amdxdna/aie2_pci.o
>>>   CC [M]  drivers/accel/amdxdna/aie2_psp.o
>>>   CC [M]  drivers/accel/amdxdna/aie2_smu.o
>>>   CC [M]  drivers/accel/amdxdna/aie2_solver.o
>>>   CC [M]  drivers/accel/amdxdna/amdxdna_ctx.o
>>>   CC [M]  drivers/accel/amdxdna/amdxdna_gem.o
>>>   CC [M]  drivers/accel/amdxdna/amdxdna_mailbox.o
>>>   CC [M]  drivers/accel/amdxdna/amdxdna_mailbox_helper.o
>>>   CC [M]  drivers/accel/amdxdna/amdxdna_pci_drv.o
>>>   CC [M]  drivers/accel/amdxdna/amdxdna_sysfs.o
>>>   CC [M]  drivers/accel/amdxdna/npu1_regs.o
>>>   CC [M]  drivers/accel/amdxdna/npu2_regs.o
>>>   CC [M]  drivers/accel/amdxdna/npu4_regs.o
>>>   CC [M]  drivers/accel/amdxdna/npu5_regs.o
>>>   AR      drivers/base/firmware_loader/built-in.a
>>>   AR      drivers/base/built-in.a
>>> In file included from drivers/accel/amdxdna/aie2_message.c:19:
>>> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_get_op’:
>>> drivers/accel/amdxdna/amdxdna_ctx.h:112:16: error: implicit 
>>> declaration of function ‘FIELD_GET’ 
>>> [-Werror=implicit-function-declaration]
>>>   112 |         return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
>>>       |                ^~~~~~~~~
>>> In file included from drivers/accel/amdxdna/amdxdna_gem.c:15:
>>> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_get_op’:
>>> drivers/accel/amdxdna/amdxdna_ctx.h:112:16: error: implicit 
>>> declaration of function ‘FIELD_GET’ 
>>> [-Werror=implicit-function-declaration]
>>>   112 |         return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
>>>       |                ^~~~~~~~~
>>> In file included from drivers/accel/amdxdna/aie2_psp.c:11:
>>> drivers/accel/amdxdna/aie2_psp.c: In function ‘psp_exec’:
>>> drivers/accel/amdxdna/aie2_psp.c:62:34: error: implicit declaration 
>>> of function ‘FIELD_GET’ [-Werror=implicit-function-declaration]
>>>    62 | FIELD_GET(PSP_STATUS_READY, ready),
>>>       |                                  ^~~~~~~~~
>>> ./include/linux/iopoll.h:47:21: note: in definition of macro 
>>> ‘read_poll_timeout’
>>>    47 |                 if (cond) \
>>>       |                     ^~~~
>>> drivers/accel/amdxdna/aie2_psp.c:61:15: note: in expansion of macro 
>>> ‘readx_poll_timeout’
>>>    61 |         ret = readx_poll_timeout(readl, PSP_REG(psp, 
>>> PSP_STATUS_REG), ready,
>>>       |               ^~~~~~~~~~~~~~~~~~
>>> drivers/accel/amdxdna/amdxdna_ctx.h: In function 
>>> ‘amdxdna_cmd_set_state’:
>>> drivers/accel/amdxdna/amdxdna_ctx.h:121:24: error: implicit 
>>> declaration of function ‘FIELD_PREP’ 
>>> [-Werror=implicit-function-declaration]
>>>   121 |         cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
>>>       |                        ^~~~~~~~~~
>>> drivers/accel/amdxdna/amdxdna_ctx.h: In function 
>>> ‘amdxdna_cmd_set_state’:
>>> drivers/accel/amdxdna/amdxdna_ctx.h:121:24: error: implicit 
>>> declaration of function ‘FIELD_PREP’ 
>>> [-Werror=implicit-function-declaration]
>>>   121 |         cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
>>>       |                        ^~~~~~~~~~
>>> In file included from drivers/accel/amdxdna/aie2_pci.c:22:
>>> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_get_op’:
>>> drivers/accel/amdxdna/amdxdna_ctx.h:112:16: error: implicit 
>>> declaration of function ‘FIELD_GET’ 
>>> [-Werror=implicit-function-declaration]
>>>   112 |         return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
>>>       |                ^~~~~~~~~
>>> In file included from drivers/accel/amdxdna/aie2_ctx.c:18:
>>> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_get_op’:
>>> drivers/accel/amdxdna/amdxdna_ctx.h:112:16: error: implicit 
>>> declaration of function ‘FIELD_GET’ 
>>> [-Werror=implicit-function-declaration]
>>>   112 |         return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
>>>       |                ^~~~~~~~~
>>> drivers/accel/amdxdna/amdxdna_ctx.h: In function 
>>> ‘amdxdna_cmd_set_state’:
>>> drivers/accel/amdxdna/amdxdna_ctx.h:121:24: error: implicit 
>>> declaration of function ‘FIELD_PREP’ 
>>> [-Werror=implicit-function-declaration]
>>>   121 |         cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
>>>       |                        ^~~~~~~~~~
>>> In file included from drivers/accel/amdxdna/amdxdna_ctx.c:16:
>>> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_get_op’:
>>> drivers/accel/amdxdna/amdxdna_ctx.h:112:16: error: implicit 
>>> declaration of function ‘FIELD_GET’ 
>>> [-Werror=implicit-function-declaration]
>>>   112 |         return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
>>>       |                ^~~~~~~~~
>>> cc1: all warnings being treated as errors
>>> drivers/accel/amdxdna/amdxdna_ctx.h: In function 
>>> ‘amdxdna_cmd_set_state’:
>>> drivers/accel/amdxdna/amdxdna_ctx.h:121:24: error: implicit 
>>> declaration of function ‘FIELD_PREP’ 
>>> [-Werror=implicit-function-declaration]
>>>   121 |         cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
>>>       |                        ^~~~~~~~~~
>>> drivers/accel/amdxdna/aie2_ctx.c: In function ‘aie2_hwctx_restart’:
>>> drivers/accel/amdxdna/aie2_ctx.c:114:9: error: too few arguments to 
>>> function ‘drm_sched_start’
>>>   114 | drm_sched_start(&hwctx->priv->sched);
>>>       |         ^~~~~~~~~~~~~~~
>>> In file included from ./include/trace/events/amdxdna.h:12,
>>>                  from drivers/accel/amdxdna/aie2_ctx.c:13:
>>> ./include/drm/gpu_scheduler.h:593:6: note: declared here
>>>   593 | void drm_sched_start(struct drm_gpu_scheduler *sched, int 
>>> errno);
>>>       |      ^~~~~~~~~~~~~~~
>>> make[5]: *** [scripts/Makefile.build:229: 
>>> drivers/accel/amdxdna/aie2_psp.o] Error 1
>>> make[5]: *** Waiting for unfinished jobs....
>>> drivers/accel/amdxdna/amdxdna_ctx.h: In function 
>>> ‘amdxdna_cmd_set_state’:
>>> drivers/accel/amdxdna/amdxdna_ctx.h:121:24: error: implicit 
>>> declaration of function ‘FIELD_PREP’ 
>>> [-Werror=implicit-function-declaration]
>>>   121 |         cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
>>>       |                        ^~~~~~~~~~
>>> In file included from drivers/accel/amdxdna/amdxdna_pci_drv.c:18:
>>> drivers/accel/amdxdna/amdxdna_ctx.h: In function ‘amdxdna_cmd_get_op’:
>>> drivers/accel/amdxdna/amdxdna_ctx.h:112:16: error: implicit 
>>> declaration of function ‘FIELD_GET’ 
>>> [-Werror=implicit-function-declaration]
>>>   112 |         return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
>>>       |                ^~~~~~~~~
>>> cc1: all warnings being treated as errors
>>> make[5]: *** [scripts/Makefile.build:229: 
>>> drivers/accel/amdxdna/aie2_ctx.o] Error 1
>>> drivers/accel/amdxdna/amdxdna_ctx.h: In function 
>>> ‘amdxdna_cmd_set_state’:
>>> drivers/accel/amdxdna/amdxdna_ctx.h:121:24: error: implicit 
>>> declaration of function ‘FIELD_PREP’ 
>>> [-Werror=implicit-function-declaration]
>>>   121 |         cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
>>>       |                        ^~~~~~~~~~
>>> drivers/accel/amdxdna/amdxdna_mailbox.c: In function 
>>> ‘xdna_mailbox_send_msg’:
>>> drivers/accel/amdxdna/amdxdna_mailbox.c:444:26: error: implicit 
>>> declaration of function ‘FIELD_PREP’ 
>>> [-Werror=implicit-function-declaration]
>>>   444 |         header->sz_ver = FIELD_PREP(MSG_BODY_SZ, 
>>> msg->send_size) |
>>>       |                          ^~~~~~~~~~
>>>
>>>
>>> You also have the following checkpatch issues -
>>
>> Could you share the command you used?  I tried to use 'dim 
>> checkpatch' and it did not find out the misspelling issue.
>
> ./scripts/checkpatch.pl --strict --codespell *.patch
>
> Note, --codespell requires some local setup.  I beleive the comments 
> in the checkpatch.pl script are fairly straightforward. I use a copy 
> of the database from the github that is rather recent.  The Ubuntu 
> distro package is really out of date and I don't think I looked to see 
> if there is a pythong pip version. Grabbing the one file from the 
> github repo seemed simple emough.

I was able to reproduce with your suggestions. Thanks a lot.


Lizhi

>
> -Jeff
