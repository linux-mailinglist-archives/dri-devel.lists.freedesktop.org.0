Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D551C9D735
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 01:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DE310E695;
	Wed,  3 Dec 2025 00:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2GRiq290";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012070.outbound.protection.outlook.com [40.107.209.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE63810E695
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 00:46:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Id8ZgW23/hVFd0BGh6/KBfjJuo4p9oH2yRGxKRBlW3/ai3p5oFjRDCTThcGLpv28br2bJLwfsIiTWwjFIEIyW7Tm8DBDmrGlXNQoH33z7s3e+BCJKtaZ3/pPzQ6wvCjf/qNwS3zy+v3JRq3+yi8V92KTJXVGmgfjKTFoGmdJUF+jOnmOS5L6abW/85Xpkx7cffOnAo0u/gKKdBoBkXV/3Nb9D84B8wteOZsewV0PyZIkip5szHOXwgGmpLgfu9OHp132Q0m6hEBsVtKnLRqpQKNG0IKzeHMIU1BR4RzpgCEPt8kEEFK3YrEnk9rrMHPPOeAzIBPjFyAaZfaNyc6RnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQJuVvqpfDgx5pABEgLrxhcDXoWcaTMpwnTf4/0XwuU=;
 b=W/SNOhXtNs1EVEB0SUiFXBb5IZDXVFmOvqm+KV8yKAfR+ZzJHeXvHsrIT14JFNdFFEi6jSOEd0lXEBPMXq6M6rBa9WnooPnhhzRoxrAekCHdsqzIp5c06zcAYIfqjJXah7YQxyZItIgUF9DSE4OcqZmiKe/mLTKEheCIfbV9IM6SvncrmDGIc8IMgR2SNGoqUHMIc5zVBoauT20SZZ4qhWo7XWgPlRrfZJpz8ejW7qaIPnD0PL9ruTQQJGjcEW0N2gszpwB9kQnu1sX9MVyNRfNTxj5VD1tZRRXrHfcnCfePPJh4x5ogMfjreC8n3vGF4qEMT/v4Ib67GTUJACLjow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQJuVvqpfDgx5pABEgLrxhcDXoWcaTMpwnTf4/0XwuU=;
 b=2GRiq290JNqHpmgo8U/UXo5Eo1AGlMxIP6zgQ5b3nN1Ny6OZ0rfpExG4lRq4pN+z4+nU5yoOPKRjVUPfYnxMTjyRKIcNyhRqbuPy8mwfhhWvnh0a0o2OpKspP25SHaR/WA1ydnzJEoqlJb/b8P+4c17NLUHF8Anqk0OYxjqEJSo=
Received: from IA4P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::15)
 by MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 00:46:15 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:208:558:cafe::eb) by IA4P220CA0010.outlook.office365.com
 (2603:10b6:208:558::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 00:46:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 00:46:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 2 Dec
 2025 18:46:14 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 2 Dec
 2025 16:46:14 -0800
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 2 Dec 2025 16:46:13 -0800
Message-ID: <35d1255e-3f2a-b82a-f1a0-014dc7977cad@amd.com>
Date: Tue, 2 Dec 2025 16:46:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2] accel/amdxdna: Poll MPNPU_PWAITMODE after requesting
 firmware suspend
Content-Language: en-US
To: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>
References: <20251202165427.507414-1-lizhi.hou@amd.com>
 <da012e50-692b-4887-830f-d1884df2a4a9@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <da012e50-692b-4887-830f-d1884df2a4a9@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|MN0PR12MB5716:EE_
X-MS-Office365-Filtering-Correlation-Id: 38e85d0f-d937-4cc8-71e3-08de32055cba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkhSbmkrdHJtVmdDL09vNVUwMU5OVHA3VlFZYXVqWU5kUm94SzExVG9Ua25q?=
 =?utf-8?B?c2FMUmhaaGNVU3llR3VLdjF3TjJxT094cDErUkF3YUhUV0RkdmdlRnNqYjJO?=
 =?utf-8?B?bGllTEZpNXBVM0NDSWh4elAwZzJTaDVSTUJ6NGJ4aGhTU1ZYNElBemh2UGRP?=
 =?utf-8?B?NkZGMit2WE56SVRnSmJZTzFPbHZRMGEzeHhmRWJlVEZzRUROb21HWmZReWJ4?=
 =?utf-8?B?TG9kK3ptS1N0cUZoVmFZVGJiclBoRTNkSnl6OTZUZTIrSlExUHJsWndFMkkv?=
 =?utf-8?B?cHdsZ1RCTU55ZkZUOW1OcHB0TnlPajMwR2pJVlFRUDhraWcxdEllam9VaFN0?=
 =?utf-8?B?T0pBZG02Zk1ZZXJHUTFmRytkWUtoSFBkdk5nS0h2NmpLUHJzNm52a2t2NThX?=
 =?utf-8?B?b1RNazYxVGFSSkRTeGVtR2tnRzlRN0M2eHRhb2xLazZPUlUxWFJjb0IwRWpX?=
 =?utf-8?B?dlN5T25qdG52WkpSRHZvRE5BcG5SNDFVc2xGZ2tVcnZmOXhiOVFydzRPS1gy?=
 =?utf-8?B?U3RzN25lL1IrYWZ3WXdxUkw4aTZ1NityTGdERUtOL3ljMm5lUlRxSXVuMUtF?=
 =?utf-8?B?a2dOQUVIYWY0bVFmM29vV3hmN2dJUzlQYmRlVkVQbE8yOHMvQm10MG1ySnpL?=
 =?utf-8?B?d0Uxd3BhckJlK3VyMkIrNWdVbHBNMmVETkxuQXVlUHZmeHhENXVMenlKMnVD?=
 =?utf-8?B?NHlOTjlXMTFjRnhpWDgxdHkrZ3ZDUDB1ZmdwK3FHVXZMK2hFY2g2VGhNaUdW?=
 =?utf-8?B?dm1DTHFIdk8rYUVKV0RzbytxRnBOYll1NDE4YlBmLzB1NWNpSFFwbjNXSjFo?=
 =?utf-8?B?d3BJYVhvYVA1RWNQbk1SSVljRkR3RnhielVtRUZOYlUvbm5sbnZmQ1psSUZm?=
 =?utf-8?B?UzdvUWVCOWVUVWNQS3diRW9QMjVSUlNaZGZIbGcva1BLUVlSSDdmem54aXFz?=
 =?utf-8?B?SXk3SFBGSGJZSHRodkZSTTJqdldZTVAzenZxcVNWQU1KYTJvWFRIdUNOOTVv?=
 =?utf-8?B?dnlMQ1VSTlJuTzQ0dE1jaDRBUDFwQS9Tc3VDYzl1KzQvN1pjcDJzOG9pb1Bz?=
 =?utf-8?B?RG5uUmFqbU1NTkZBR1hJZ1RYWnpNWVFkQ0pNYkZVNWxMWUU3ejFidlJHaDZG?=
 =?utf-8?B?ZExRL2tlUUcrOVVnK0k1SFgrU1V6cHRNUSs0ejBnMFNWa252UFh4NEVBRUFp?=
 =?utf-8?B?YmFDUUxzYW1CSCtzQ2VCZUtCdzY0N0s4cnZLVis2bllZcTV4eWRFanQ4b2s3?=
 =?utf-8?B?OEU3cFVTZDNNZzdPNFd2Z3U1REhJUEE0RkpkQlJjQmtuUDdZMmVUcWtWQ0dt?=
 =?utf-8?B?MlJDNFVsbTZwaG8yYi9SNEcyRkN4cUZ2eTFTK2VHRUp1M0hvUkdrSmw1UHJs?=
 =?utf-8?B?RmhndWxaeEZXb084Y1V5cC84dUtHWUh2UlFIY09tSE02alNVZUJCZVJtSlJC?=
 =?utf-8?B?UFEwV2lqR1FLTHlSa0ZzRXdyTEhHZUMybFl4c1lTdUZMOXRwamIzODlOUzlw?=
 =?utf-8?B?bnAyZ2xUNGhIS1JwVWNsbXU3TUpIYjlHMTRNcDQyK0VsSXg3SEh2SDd6VzM2?=
 =?utf-8?B?TjhKMDNTKzduU2I5RC9kQWc4MVZsSHYyS3M3Zk5QTDdTM3VXaVdEZVliemdQ?=
 =?utf-8?B?TmlwdTZSUXQwTU00RHl2UFR3NXVjcUY3R1dTS3RjYTV1cGMxSTlLYnpEcWU4?=
 =?utf-8?B?Zy9KMWduSWpiUit4VmluS3pmeE02bXpMc2FhOUQyaU9Ya0djSm9JRWtJZUMx?=
 =?utf-8?B?RXo0eExBc3RxN3J6anVHQ0Y3OTlDYVZFejg0MmdnYzN2aGxselVtdThxZWF5?=
 =?utf-8?B?am9uZjFOUnBJUlpub25zbVpwV05XM0Z6T1F3Tm1VN3pSekExY2loeWNhbkhk?=
 =?utf-8?B?RUFmZk1adFNVaklCRCsvclJLOVhtVWZPOGFLSUp3N0dvYU9yWXZkT2hwakwv?=
 =?utf-8?B?WDVhbHA1bkNydTdoWUdKRVlGNHgxckJqQSt2bkZZVm9ncXJYRG5KaFJNRmgy?=
 =?utf-8?B?RTllS2F4VW1YRlJjTG9mVmd3MlE0aFMzRXhUOEc0QzNZQWdrbW1XODVvUzBr?=
 =?utf-8?B?dzVnWlhxQVZQY1BsSis2STZXZnoyQ2pQUDdiZ2ZGeUFMcXdLNmVYV0RZUm9R?=
 =?utf-8?Q?wdMI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 00:46:14.4714 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e85d0f-d937-4cc8-71e3-08de32055cba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5716
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

Applied to drm-misc-next.

On 12/2/25 09:29, Falkowski, Maciej wrote:
> Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>
> On 12/2/2025 5:54 PM, Lizhi Hou wrote:
>> After issuing a firmware suspend request, the driver must ensure that 
>> the
>> suspend operation has completed before proceeding. Add polling of the
>> MPNPU_PWAITMODE register to confirm that the firmware has fully entered
>> the suspended state. This prevents race conditions where subsequent
>> operations assume the firmware is idle before it has actually completed
>> its suspend sequence.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_message.c |  9 ++++++++-
>>   drivers/accel/amdxdna/aie2_pci.h     |  2 ++
>>   drivers/accel/amdxdna/aie2_psp.c     | 15 +++++++++++++++
>>   drivers/accel/amdxdna/npu1_regs.c    |  2 ++
>>   drivers/accel/amdxdna/npu2_regs.c    |  2 ++
>>   drivers/accel/amdxdna/npu4_regs.c    |  2 ++
>>   drivers/accel/amdxdna/npu5_regs.c    |  2 ++
>>   drivers/accel/amdxdna/npu6_regs.c    |  2 ++
>>   8 files changed, 35 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_message.c 
>> b/drivers/accel/amdxdna/aie2_message.c
>> index d493bb1c3360..fee3b0627aba 100644
>> --- a/drivers/accel/amdxdna/aie2_message.c
>> +++ b/drivers/accel/amdxdna/aie2_message.c
>> @@ -59,8 +59,15 @@ static int aie2_send_mgmt_msg_wait(struct 
>> amdxdna_dev_hdl *ndev,
>>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev)
>>   {
>>       DECLARE_AIE2_MSG(suspend, MSG_OP_SUSPEND);
>> +    int ret;
>>   -    return aie2_send_mgmt_msg_wait(ndev, &msg);
>> +    ret = aie2_send_mgmt_msg_wait(ndev, &msg);
>> +    if (ret) {
>> +        XDNA_ERR(ndev->xdna, "Failed to suspend fw, ret %d", ret);
>> +        return ret;
>> +    }
>> +
>> +    return aie2_psp_waitmode_poll(ndev->psp_hdl);
>>   }
>>     int aie2_resume_fw(struct amdxdna_dev_hdl *ndev)
>> diff --git a/drivers/accel/amdxdna/aie2_pci.h 
>> b/drivers/accel/amdxdna/aie2_pci.h
>> index a5f9c42155d1..cc9f933f80b2 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.h
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -70,6 +70,7 @@ enum psp_reg_idx {
>>       PSP_INTR_REG = PSP_NUM_IN_REGS,
>>       PSP_STATUS_REG,
>>       PSP_RESP_REG,
>> +    PSP_PWAITMODE_REG,
>>       PSP_MAX_REGS /* Keep this at the end */
>>   };
>>   @@ -290,6 +291,7 @@ int aie2_pm_set_mode(struct amdxdna_dev_hdl 
>> *ndev, enum amdxdna_power_mode_type
>>   struct psp_device *aie2m_psp_create(struct drm_device *ddev, struct 
>> psp_config *conf);
>>   int aie2_psp_start(struct psp_device *psp);
>>   void aie2_psp_stop(struct psp_device *psp);
>> +int aie2_psp_waitmode_poll(struct psp_device *psp);
>>     /* aie2_error.c */
>>   int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev);
>> diff --git a/drivers/accel/amdxdna/aie2_psp.c 
>> b/drivers/accel/amdxdna/aie2_psp.c
>> index f28a060a8810..3a7130577e3e 100644
>> --- a/drivers/accel/amdxdna/aie2_psp.c
>> +++ b/drivers/accel/amdxdna/aie2_psp.c
>> @@ -76,6 +76,21 @@ static int psp_exec(struct psp_device *psp, u32 
>> *reg_vals)
>>       return 0;
>>   }
>>   +int aie2_psp_waitmode_poll(struct psp_device *psp)
>> +{
>> +    struct amdxdna_dev *xdna = to_xdna_dev(psp->ddev);
>> +    u32 mode_reg;
>> +    int ret;
>> +
>> +    ret = readx_poll_timeout(readl, PSP_REG(psp, PSP_PWAITMODE_REG), 
>> mode_reg,
>> +                 (mode_reg & 0x1) == 1,
>> +                 PSP_POLL_INTERVAL, PSP_POLL_TIMEOUT);
>> +    if (ret)
>> +        XDNA_ERR(xdna, "fw waitmode reg error, ret %d", ret);
>> +
>> +    return ret;
>> +}
>> +
>>   void aie2_psp_stop(struct psp_device *psp)
>>   {
>>       u32 reg_vals[PSP_NUM_IN_REGS] = { PSP_RELEASE_TMR, };
>> diff --git a/drivers/accel/amdxdna/npu1_regs.c 
>> b/drivers/accel/amdxdna/npu1_regs.c
>> index ec407f3b48fc..ebc6e2802297 100644
>> --- a/drivers/accel/amdxdna/npu1_regs.c
>> +++ b/drivers/accel/amdxdna/npu1_regs.c
>> @@ -13,6 +13,7 @@
>>   #include "amdxdna_pci_drv.h"
>>     /* Address definition from NPU1 docs */
>> +#define MPNPU_PWAITMODE            0x3010034
>>   #define MPNPU_PUB_SEC_INTR        0x3010090
>>   #define MPNPU_PUB_PWRMGMT_INTR        0x3010094
>>   #define MPNPU_PUB_SCRATCH2        0x30100A0
>> @@ -92,6 +93,7 @@ static const struct amdxdna_dev_priv npu1_dev_priv = {
>>           DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU1_PSP, 
>> MPNPU_PUB_SEC_INTR),
>>           DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU1_PSP, 
>> MPNPU_PUB_SCRATCH2),
>>           DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU1_PSP, 
>> MPNPU_PUB_SCRATCH3),
>> +        DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU1_PSP, 
>> MPNPU_PWAITMODE),
>>       },
>>       .smu_regs_off   = {
>>           DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU1_SMU, MPNPU_PUB_SCRATCH5),
>> diff --git a/drivers/accel/amdxdna/npu2_regs.c 
>> b/drivers/accel/amdxdna/npu2_regs.c
>> index 86f87d0d1354..ad0743fb06d5 100644
>> --- a/drivers/accel/amdxdna/npu2_regs.c
>> +++ b/drivers/accel/amdxdna/npu2_regs.c
>> @@ -13,6 +13,7 @@
>>   #include "amdxdna_pci_drv.h"
>>     /* NPU Public Registers on MpNPUAxiXbar (refer to Diag 
>> npu_registers.h) */
>> +#define MPNPU_PWAITMODE                0x301003C
>>   #define MPNPU_PUB_SEC_INTR             0x3010060
>>   #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
>>   #define MPNPU_PUB_SCRATCH0             0x301006C
>> @@ -85,6 +86,7 @@ static const struct amdxdna_dev_priv npu2_dev_priv = {
>>           DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU2_PSP, MP0_C2PMSG_73),
>>           DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU2_PSP, MP0_C2PMSG_123),
>>           DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU2_REG, 
>> MPNPU_PUB_SCRATCH3),
>> +        DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU2_REG, 
>> MPNPU_PWAITMODE),
>>       },
>>       .smu_regs_off   = {
>>           DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU2_SMU, MP1_C2PMSG_0),
>> diff --git a/drivers/accel/amdxdna/npu4_regs.c 
>> b/drivers/accel/amdxdna/npu4_regs.c
>> index 986a5f28ba24..4ca21db70478 100644
>> --- a/drivers/accel/amdxdna/npu4_regs.c
>> +++ b/drivers/accel/amdxdna/npu4_regs.c
>> @@ -13,6 +13,7 @@
>>   #include "amdxdna_pci_drv.h"
>>     /* NPU Public Registers on MpNPUAxiXbar (refer to Diag 
>> npu_registers.h) */
>> +#define MPNPU_PWAITMODE                0x301003C
>>   #define MPNPU_PUB_SEC_INTR             0x3010060
>>   #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
>>   #define MPNPU_PUB_SCRATCH0             0x301006C
>> @@ -116,6 +117,7 @@ static const struct amdxdna_dev_priv 
>> npu4_dev_priv = {
>>           DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU4_PSP, MP0_C2PMSG_73),
>>           DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU4_PSP, MP0_C2PMSG_123),
>>           DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU4_REG, 
>> MPNPU_PUB_SCRATCH3),
>> +        DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU4_REG, 
>> MPNPU_PWAITMODE),
>>       },
>>       .smu_regs_off   = {
>>           DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU4_SMU, MP1_C2PMSG_0),
>> diff --git a/drivers/accel/amdxdna/npu5_regs.c 
>> b/drivers/accel/amdxdna/npu5_regs.c
>> index 75ad97f0b937..131080652ef0 100644
>> --- a/drivers/accel/amdxdna/npu5_regs.c
>> +++ b/drivers/accel/amdxdna/npu5_regs.c
>> @@ -13,6 +13,7 @@
>>   #include "amdxdna_pci_drv.h"
>>     /* NPU Public Registers on MpNPUAxiXbar (refer to Diag 
>> npu_registers.h) */
>> +#define MPNPU_PWAITMODE                0x301003C
>>   #define MPNPU_PUB_SEC_INTR             0x3010060
>>   #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
>>   #define MPNPU_PUB_SCRATCH0             0x301006C
>> @@ -85,6 +86,7 @@ static const struct amdxdna_dev_priv npu5_dev_priv = {
>>           DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU5_PSP, MP0_C2PMSG_73),
>>           DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU5_PSP, MP0_C2PMSG_123),
>>           DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU5_REG, 
>> MPNPU_PUB_SCRATCH3),
>> +        DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU5_REG, 
>> MPNPU_PWAITMODE),
>>       },
>>       .smu_regs_off   = {
>>           DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU5_SMU, MP1_C2PMSG_0),
>> diff --git a/drivers/accel/amdxdna/npu6_regs.c 
>> b/drivers/accel/amdxdna/npu6_regs.c
>> index 758dc013fe13..1f71285655b2 100644
>> --- a/drivers/accel/amdxdna/npu6_regs.c
>> +++ b/drivers/accel/amdxdna/npu6_regs.c
>> @@ -13,6 +13,7 @@
>>   #include "amdxdna_pci_drv.h"
>>     /* NPU Public Registers on MpNPUAxiXbar (refer to Diag 
>> npu_registers.h) */
>> +#define MPNPU_PWAITMODE                0x301003C
>>   #define MPNPU_PUB_SEC_INTR             0x3010060
>>   #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
>>   #define MPNPU_PUB_SCRATCH0             0x301006C
>> @@ -85,6 +86,7 @@ static const struct amdxdna_dev_priv npu6_dev_priv = {
>>           DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU6_PSP, MP0_C2PMSG_73),
>>           DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU6_PSP, MP0_C2PMSG_123),
>>           DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU6_REG, 
>> MPNPU_PUB_SCRATCH3),
>> +        DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU6_REG, 
>> MPNPU_PWAITMODE),
>>       },
>>       .smu_regs_off   = {
>>           DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU6_SMU, MP1_C2PMSG_0),
