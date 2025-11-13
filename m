Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CACC55B5A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 05:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5D610E0EB;
	Thu, 13 Nov 2025 04:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IVQA4H+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011032.outbound.protection.outlook.com [52.101.52.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CA310E0EB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 04:52:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQmRxpbidjFrPbHb6AHP/NYmACroZ1IsmSR+NwuBvH/JuI4a1W6bMtlmaJzicNnF6t9t09v1vKJMXYNyc+RN7qUC0wQf51v7YpIN2NMsBTKBbvCKIiuG9blbELeSJjdDP0eau7Mw6+Z/KPzvL2w9Q+Tk4P0O7l7OLnvO15ZroQn6AOX+qrdp7T1R0V7HsBLTdorHDBoOFp1QDtiFrz1QOSe1FE0wTPQcWnQH2eep6B4L8DbIis5XnYXJpSQOw2f9/qqob57s5nA36ssU66jsebXr0cxXegCJv6+b9+tWDNkLk1FDWUTiNymdZmxM89tjSvuCwwrZdUfNmW2H5yeMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgMBIIba9QTZacevWa7mrF9whYKGpbUqAsJ7/gl1eN0=;
 b=Uq14YA6My6q1Fv8MKbE4i5piQ/l+pdTIWojCUYg4gWTbboKmq9vxzA70UDh0MF2nvOOk6O6BAiNq7k4nbKjoMWQhRBUsxdJmVrOzIRhZVmMkf5+s+SgFZ16m8aiaBXQFqGKM3CrueZ8QeWcPGeB7eKHMiomX+S1wTm+qkXW3SXpwvMyppXn8XSKp7JwftSrroS9dxdNmj1RxRGKBw8RbZy49sV1W/q/O34mcqlY4HLImTFppf8X9ROFri4zEJPuygveWNeX/jMaShCM1RnkYNP7dz8H3rmrDOxZV9Iep+aFg9OILKbKgvf7ZcQ2jCvz4UrW6t/H+cgZUKO4EGlw4Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=wanadoo.fr smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgMBIIba9QTZacevWa7mrF9whYKGpbUqAsJ7/gl1eN0=;
 b=IVQA4H+2vPK4G/kJn53O1AYo1CCUkvlDwI8UiRoVOkDs/XE6L8svg2Y57eVey/jtUFVXeD06T0OWJUDlkcrOlvk427w3Kjroe767uikO/orNrVds8CCQnspF5Tej3l2clgb0kskQUQmhmwDE6LaMk96uZjUowZ+iS5NioTr0qB8=
Received: from SJ0PR13CA0020.namprd13.prod.outlook.com (2603:10b6:a03:2c0::25)
 by PH8PR12MB6746.namprd12.prod.outlook.com (2603:10b6:510:1c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 04:52:50 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::a5) by SJ0PR13CA0020.outlook.office365.com
 (2603:10b6:a03:2c0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Thu,
 13 Nov 2025 04:52:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 04:52:49 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 20:52:48 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 20:52:48 -0800
Received: from [172.19.74.139] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 12 Nov 2025 20:52:47 -0800
Message-ID: <54c86f57-4200-42d2-8661-123ac097d292@amd.com>
Date: Wed, 12 Nov 2025 20:52:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 4/5] accel/amd_vpci: Add Remote Management (RM) queue
 service APIs
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, <ogabbay@kernel.org>, 
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>, <lizhi.hou@amd.com>, Nishad Saraf
 <nishads@amd.com>
References: <20251111011550.439157-1-yidong.zhang@amd.com>
 <20251111011550.439157-5-yidong.zhang@amd.com>
 <3f40d64a-5312-40b1-890d-68d6c5e5203b@wanadoo.fr>
Content-Language: en-US
From: Yidong Zhang <yidong.zhang@amd.com>
In-Reply-To: <3f40d64a-5312-40b1-890d-68d6c5e5203b@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|PH8PR12MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc838c8-d68a-406d-9ed7-08de22707eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVFXa2NlSlVYSThobEVqWnRqVWttdUgyb0JmaW5rejdkcXdydHlsN1NmVnNT?=
 =?utf-8?B?WXdXcytubHFUb1B1RkxPYzU0V3c2aDRQU2FXUmNuTTRZaWxhZTgwSTNTK3Rp?=
 =?utf-8?B?cmQvN0FlZjE1eHVmV0JaRmVuMUw0Z3ZMblpOZnBQYTIvNVQ3MHBac2F0REQw?=
 =?utf-8?B?M1BoWkJvaTl2Tk03cG1US25jUlZZb3ZSd2d5czJsZ3ptSUdFcVhqemR2alJL?=
 =?utf-8?B?dU1kZTRoZmdUMkQvRkhsMGV4Rk80NHRJZUZTMnlTRk5vdW91RUgvV0NrU2NN?=
 =?utf-8?B?WFZvMDNtUjdsekNLVGtRL0R6c0IxS1NCQm5ROFd5U05GanBQaHRxUThTblF4?=
 =?utf-8?B?UW93TlNIMHUvTkR1alZzN0ZPTngwK3ZQeXdTeFl5dlBnLzVGVDhwTTdrNzIy?=
 =?utf-8?B?OFpRR1o2dGhqbGxrSE1BRm8wdVhxeitoSXpCRU9Jek0zZkZCNThqY1NSZ0cy?=
 =?utf-8?B?T2l0S3EvQ2VBaTN1TFFSandxU295ci9XcWVWcVNFUnNzTHI3SXVIVjdtN0tO?=
 =?utf-8?B?cmRqVG0xRGZzMktiS3E1ZXlLd2JzNE5GcnVKZzErVm9UUDN4bG94bVlUUXVu?=
 =?utf-8?B?amJ0V3NpZWNtOHFqbk5FM2JiWWsyZGs2cHo5WjlrQzIyTk8wQjkvaE5mTlhQ?=
 =?utf-8?B?T2craVpYVkZuMlpUbklJeFY5bDVqa3A0VDBIajBMb045eHVTaFpPTzhSdWsx?=
 =?utf-8?B?UHVoZjh5OVFMbm9uU0l5eWpOYW95Mk02MnF0amp6MzFyUDN4VmY0Q2RqTVh2?=
 =?utf-8?B?bSt2a3A2WU1ISWtWMFFqWlNkY1RBdUlvd0hjeTQvc0NnM0xoQkFBVXJkTDhP?=
 =?utf-8?B?bUJOd1QxN2RyTlBWL2d0alhranVoK2RpSUlRaXpobWRocFlORWg3eXhTcGpL?=
 =?utf-8?B?WlQrY29uQyt2TDE1bWk3ZHlKOHRackRlbk45bXluN1RuM3JqY3R4OGEzYXBm?=
 =?utf-8?B?UDFuVzhjbFNab3NNSllMZnlOQm1yL3prUjhGdDJTRGw5aDd3Y1B0dUNpN08x?=
 =?utf-8?B?eGZweDR6cHEvV0J2NjV2c3B2dlI2eFUxR1kyeHl2YXkycWJFZStycFJQL0Rx?=
 =?utf-8?B?U2hQUjEwNk9JTGVkL1BLZ2RmdkJneTFNVitUYXZNTWdlZExJTW85Y3ljT0x5?=
 =?utf-8?B?WHlXK2IvMC9uMnIxWkczaS8rLzMvUFdNQ2xHNWJlQk9aL3phakJWZ2ViQ3dI?=
 =?utf-8?B?NFFUNzBQYkhRYVZGKy85ZUFtcU1XNEtPak8xY09VcktTNU15a1RBVksvOFFq?=
 =?utf-8?B?WElOQVpRNWxEc1ZQSEwycUdzc1RHMDFUTDc0MHJEdU9qVVhncHh4Wml6cWNn?=
 =?utf-8?B?WVV3TFBsSFNKaWNDSlJsUXNZUHRRVWxDS2NBcGtjVnBoQWY5M1F0L2FUTkRR?=
 =?utf-8?B?a2ZIMlAva3djeTUxV05BRnJPSmZmY29zNHNTUnpvRDFlR3NjazNka2RFVWtw?=
 =?utf-8?B?TGJPR1lIbmRaMk01RUE4dWp3VFdtN2ZMR1M2d2N2VVJYMHY0ZCtReTZObW1z?=
 =?utf-8?B?ajZtTkNTQVFtNTcyRWc3eXhVc2pWN0pLeE5GU01CZWJRbXAxZjhvNXg2OGxO?=
 =?utf-8?B?RzVva1pqTWkwZDVLMGlVQUtVb2JwVWFwdFpOMlpDL3hqYTZydkg5V0wwTVlk?=
 =?utf-8?B?ZG5LWFVoYVhMRGVNdzZVTG40VStldVVtNEh4d0hNV3lyTGNwY25UaE9IVVc1?=
 =?utf-8?B?Nm51MkhITGsxMkN6Mnh4T0tsb1dnaW9aTXhEK094S1d4VXNHVWdQeXBrQjd3?=
 =?utf-8?B?elRQWjR5WVp2eGdCZjlGZTZRVVZUalhnZzhoK1hLTGlra3hpR3lEbGhMemxM?=
 =?utf-8?B?RHpwazNtZWxuRTlhOW54bi9ZUm82K2JsV2wveUQ4bVpwRXYzQ0RqRWwvcDNO?=
 =?utf-8?B?T2ZLSkEwK0pReUpjSkM1Yk9NM0VXVUFuZ0hnSEtpK0Z6aHlBWWY3KzlVdmVK?=
 =?utf-8?B?RGdPc0NHYXEySVhONFh6K1Eyb2RuN1FCeXZOUUtYdlh4TE45M1Zqei9DZEUz?=
 =?utf-8?B?cDVIZ1h5cWd2ZTBSVW04c1dESE9IMkRKanRBbnNxM0VIcXhHUlNXNUZZc1J0?=
 =?utf-8?B?UzdyazAzd3pVb3B0TDlwTEpIR2lsQVZrdHpMYzI1eCtLeVJwdXFkeWtOTlVU?=
 =?utf-8?Q?gdQg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 04:52:49.2968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc838c8-d68a-406d-9ed7-08de22707eec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6746
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



On 11/11/25 01:51, Christophe JAILLET wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> Le 11/11/2025 à 02:15, David Zhang a écrit :
>> This patch introduces a set of APIs for allowing the PCIe driver submit
>> commands, transfer binary payloads and retrieve firmware metadata.
>>
>> Key features:
>> - RM queue command APIs:
>>    - create and destroy RM queue commands
>>    - Initialized command data payloads
>>    - Send and poll for command completion
>> - Service-level operations:
>>    - Retrieve firmware ID
>>    - Program accelerator and APU firmware images
>>    - Periodic health monitoring
>>
>> Co-developed-by: Nishad Saraf <nishads@amd.com>
>> Signed-off-by: Nishad Saraf <nishads@amd.com>
>> Signed-off-by: David Zhang <yidong.zhang@amd.com>
> 
> ...
> 
>> +static void rm_check_health(struct work_struct *w)
>> +{
>> +     struct rm_device *rdev = to_rdev_health_monitor(w);
>> +     u32 max_len = PAGE_SIZE;
>> +     struct rm_cmd *cmd;
>> +     int ret;
>> +
>> +     ret = rm_queue_create_cmd(rdev, RM_QUEUE_OP_GET_LOG_PAGE, &cmd);
>> +     if (ret)
>> +             return;
>> +
>> +     ret = rm_queue_payload_init(cmd, RM_CMD_LOG_PAGE_AXI_TRIP_STATUS);
>> +     if (ret)
>> +             goto destroy_cmd;
>> +
>> +     ret = rm_queue_send_cmd(cmd, RM_CMD_WAIT_CONFIG_TIMEOUT);
>> +     if (ret == -ETIME || ret == -EINVAL)
>> +             goto payload_fini;
>> +
>> +     if (ret) {
>> +             u32 log_len = cmd->cq_msg.data.page.len;
>> +
>> +             if (log_len > max_len) {
>> +                     vdev_warn(rdev->vdev, "msg size %d is greater 
>> than requested %d",
>> +                               log_len, max_len);
>> +                     log_len = max_len;
>> +             }
>> +
>> +             if (log_len) {
>> +                     char *buffer = vzalloc(log_len);
>> +
>> +                     if (!buffer)
>> +                             goto payload_fini;
>> +
>> +                     ret = rm_queue_copy_response(cmd, buffer, log_len);
>> +                     if (ret) {
>> +                             vfree(buffer);
>> +                             goto payload_fini;
>> +                     }
>> +
>> +                     vdev_err(rdev->vdev, "%s", buffer);
> 
> This looks like the normal path. is vdev_err() expected here?

This is the detail info when log_len is not 0, thus err log is expected.

> 
>> +                     vfree(buffer);
>> +
>> +             } else {
>> +                     vdev_err(rdev->vdev, "firewall check ret%d", ret);
>> +             }
>> +
>> +             rdev->firewall_tripped = 1;
>> +     }
>> +
>> +payload_fini:
>> +     rm_queue_payload_fini(cmd);
>> +destroy_cmd:
>> +     rm_queue_destroy_cmd(cmd);
>> +
>> +     vdev_dbg(rdev->vdev, "check result: %d", ret);
>> +}
> 
> ...
> 
>> +struct rm_device *versal_pci_rm_init(struct versal_pci_device *vdev)
>> +{
>> +     struct rm_header *header;
>> +     struct rm_device *rdev;
>> +     u32 status;
>> +     int ret;
>> +
>> +     rdev = devm_kzalloc(&vdev->pdev->dev, sizeof(*rdev), GFP_KERNEL);
>> +     if (!rdev)
>> +             return ERR_PTR(-ENOMEM);
>> +
>> +     rdev->vdev = vdev;
>> +     header = &rdev->rm_metadata;
>> +
>> +     rm_shmem_bulk_read(rdev, RM_HDR_OFF, (u32 *)header, 
>> sizeof(*header));
>> +     if (header->magic != RM_HDR_MAGIC_NUM) {
>> +             vdev_err(vdev, "Invalid RM header 0x%x", header->magic);
>> +             ret = -ENODEV;
>> +             goto err;
>> +     }
>> +
>> +     status = rm_shmem_read(rdev, header->status_off);
>> +     if (!status) {
>> +             vdev_err(vdev, "RM status %d is not ready", status);
> 
> This can be simplified, status is knwon to be 0.

Yes, I will fix this.

> 
>> +             ret = -ENODEV;
>> +             goto err;
>> +     }
> 
> ...
> 
> CJ
