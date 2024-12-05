Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458BF9E4D36
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 06:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC2D10ED99;
	Thu,  5 Dec 2024 05:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a5qNp1cH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C147E10ED99
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 05:15:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tho+fuoswcbd11dCGd69G+GOahKIXeLFwHqVsxf4/S0MCkWclau/cxTYb/IRW5SCalxMjMlqVrJfKi3IRs0RhZcmsUQfeBnTzVFoAbFAjVL4xYLm9dxqXfqqWDgomf2F3xdGqA2glWe8j9IIXnR3KNflcU09QTWq8n+tlRvBdnQM9Mq9/lUv4EH+E0Fv0koX19KpyMIsNXUkcGZdOrfTk41wCAvmT0vjblA21P1B+iVBqQ+LKFDm8Y+HpgasRDnCLpCkefD4pK2lOKg/5yfQ+pOMkZts3zOh66E2pMIASrCVfh/GEk8o1hN8hOUO2k9WLKkXh5vf5mfWrqi2Bc2/Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysoZTrNM2hasf/TRq4G2a4Pfqt7pCGNTCdMe08VHRVg=;
 b=Y2w5Nxh0QAkPDFjhJWiehdXG6+rwfpB2RLFw4YxglPNMxuwomLQy8mSjDHxea8/mOJ3W1VWiqRT5N8qPSBEvpD77tTerhmzWDKEKFpjgGJaFpKDrf/eKLr9sQHtdQ8686QYm5pjsLSaC+ilTaOtaylU3WdbBlXOSSpVGCygR9AMYwUXx2Xo6rJ5Ysuc9EivL0KEXwr2QIM7iGRVyI22c8mIp8EjztWqoJg6ckxKegDQS5+Vy49MYRIMRTucwcETp017jUa6qYscB9/ofLSvYTKkAq64hcKq+T7erED7lcg6dZvX8ShMQII9BhVIrcUA6yu2vfFq6OfPN89HfBrP+rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysoZTrNM2hasf/TRq4G2a4Pfqt7pCGNTCdMe08VHRVg=;
 b=a5qNp1cHFKJC+G0NsjHwy0ODTlXFS7llkLPLR0E5hA7CRfgt4UublJTNm0vulMmPdJYv77LiJit6jIa2pQETt52D+OStE5D2sdHjTUbZxetlamNK9lvER3E1LfBMa63Qne2j0RyB9WbRsLtiWSB1/SZbHJJEUYfwRfraTtEC9FU=
Received: from DM6PR06CA0069.namprd06.prod.outlook.com (2603:10b6:5:54::46) by
 SN7PR12MB7787.namprd12.prod.outlook.com (2603:10b6:806:347::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 05:15:28 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:54:cafe::75) by DM6PR06CA0069.outlook.office365.com
 (2603:10b6:5:54::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Thu, 5
 Dec 2024 05:15:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Thu, 5 Dec 2024 05:15:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Dec
 2024 23:15:27 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Dec
 2024 23:15:27 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 4 Dec 2024 23:15:26 -0600
Message-ID: <b354b25a-219b-70d6-3626-bd2137edfaf6@amd.com>
Date: Wed, 4 Dec 2024 21:15:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1 1/7] accel/amdxdna: Add device status for aie2 devices
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20241204213729.3113941-1-lizhi.hou@amd.com>
 <20241204213729.3113941-2-lizhi.hou@amd.com>
 <e551fe89-6e39-4393-9e50-cae4a819e947@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <e551fe89-6e39-4393-9e50-cae4a819e947@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|SN7PR12MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c28efa-ba7f-4c98-ee0b-08dd14ebd509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wld3a1JlZTZNVGJxeDIwQjB2UElnUENuT0hBNmd3VXc1Qk01Qzk4Qi93OWpP?=
 =?utf-8?B?YStWV0lBSmw4S3pVY3k0ZVFKSDVBMHlIMSs1cWE3UTJKMHJ4VVJ6MXFDYzJ6?=
 =?utf-8?B?dis3OTlxQ2haU2JHcit2RUZhNDl6L1ZCYmdHWkpEU01sZnc1Q3hKaVBNVnBy?=
 =?utf-8?B?QU1yZGNsZ0NyZkhJckRBSXdFSHZaRW10YzZLTEovaGZ2bmVrVWk3aFcxa2l0?=
 =?utf-8?B?SGZsM0gwTTdicC9DOVJ5SE9DK0JGQmpFWTY3cXVzNThNWHRydmlqb0w0MEpG?=
 =?utf-8?B?dlY4bU5rb0NFU0pScHM0ZHlSS3pGK3l0L3IxbzVVQ3lFQWVPd3l6NlhWbmZq?=
 =?utf-8?B?QTFzci93VnczeDlsQ2V1UzdRbU5GMDBhRmNJamxySFBrNGFTYnBJdGJiTnlL?=
 =?utf-8?B?dXY3UTk1bUFOTzduUEdkVmlSSWMxRlIxT1NGQkVmdU5yYW1hYnMrWHU0T1Bx?=
 =?utf-8?B?UGNFdWZNc1Q0TmtPSHFhelplZEN1UVBNOGQ0TXRXZVJtWkhqaVZpRlI4bEZs?=
 =?utf-8?B?aVVkUDlTNE1oVllBdXpsZU40UTNhVWw3d0FCZW84WE0rUkh0ZTdnMGVtdzRu?=
 =?utf-8?B?eEVzdHpsUUIvWVQ5QTVDOEU3OEh4WjV1b0gyWW51dnB3UGRQMTZIc1JnZ25u?=
 =?utf-8?B?c3VKMXRIQWZSRDZlOVB1cC84L09JL0lOTG16VVFyVjdSWld1OFVUd2JxMjBG?=
 =?utf-8?B?cFpjYkZmV0ppSEFVR1ZYVHJscnZURmd6V2ZqS3FyTHQyeTRIckZ1alcza2Yx?=
 =?utf-8?B?MTNaUFU1MThyVHVYWWgwMzlJZEdZbmV6NC9YbWQxTFUwSFBRWHNEQ3JQWklk?=
 =?utf-8?B?UEk3RFlRMEttMVc0elNXMFBYSWZ3OWViOGhJQ3o0RW5McGR0am9xbW5OK040?=
 =?utf-8?B?UnZaSUF3d0hHcWpOVE45M0ZwMjlJUGY2K0RJMWFqbG9QcmVzbjJCZGI3cXJt?=
 =?utf-8?B?OUZjb0VzamdzUmF5aEpRdldhY2p6cmdUSlE2THdzaHNHdnFPcm5jSjA5MFBO?=
 =?utf-8?B?V0srTCtKZnN5ZkxGblptMEtIOGE3bFNtcXFTenEzczZkMVNmZnpybERYSFU2?=
 =?utf-8?B?SmJhWEhraUVuR3UyQXRuOU1ITHlsemVHbWhhcFZHb0g1NkJqVFpqL1NsVUNh?=
 =?utf-8?B?TXAvbkE3WS9kVnhkM044aENQM1ZlN3lodmNLaTBPU0h2VEE1MFc2dEwzcEcw?=
 =?utf-8?B?SVVMRkFCWUdrYk1iaFA5Z3BjMy93b28xM0tPdXdJSzdPRjc0ajVPTHJlQ2Z0?=
 =?utf-8?B?bGZ3Q1ZjYWRMdERpOWpGVWtGTnE3cldTaCtCQVNUQ3ZTcUdDQnpaR3ErcnhO?=
 =?utf-8?B?MzNEeFpCNk5OOUVKdDIraTZjQmhzMnVCQkdkNUdGTXRPM2tyYjVCbmFXTFR3?=
 =?utf-8?B?eVBoMzFiWlRRK2RDNkdSK2lUZEtnaVBGU0Y1SHFZLzRyZmhHNExFZFE4TDZn?=
 =?utf-8?B?RlE0ZHZzblB3RCtrWk82UUMwMXFrcVExVVhveGFoNHk3TmowWThlVzFHVHFH?=
 =?utf-8?B?eE9tMXUwYlRhUEFHNlppRHJUYm0va25Db3diUXM0VXMvdFVqaytFN2RMQ2ZC?=
 =?utf-8?B?QkRMd043M3ZmWEZiK2V2eFVRNzc5UGJ2OFRzayt2TytSMW9YMEtUZVM4eXlw?=
 =?utf-8?B?RGxMbDJRK3c1Rk41N1QvbWJIVk5JM1M0dHRjUmhhMVlUSWx4TjdnWkJ2d1Jw?=
 =?utf-8?B?RldSOGFJaFdleUhsZkhNTitjRHNGcnlQUmhjWXQ3eXNxWU5melVzOXJSYmVN?=
 =?utf-8?B?aVpsME1CSzlzbTExUEg1VmJhL3B6Y0lKUFo2cUNwYlN4blk0bmRYWGx6Tmw2?=
 =?utf-8?B?OEhnVElsd3lhaG9scmdqTllIVS9sWkpqREo5L1U1Yk9xYkU5SDZRVXdDeHBH?=
 =?utf-8?B?amV3L01wMGZzVFRCT3RXUEtaUWg2R2RPQkphaUxhUUFseEhBN2owaUM3TW9O?=
 =?utf-8?Q?9CEcRiiVV/xfPkhjwsLIzlwuJIeHTP9r?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 05:15:27.9608 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c28efa-ba7f-4c98-ee0b-08dd14ebd509
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7787
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


On 12/4/24 14:26, Mario Limonciello wrote:
> On 12/4/2024 15:37, Lizhi Hou wrote:
>> Add device status to track if aie2_hw_start() or aie2_hw_stop() is
>> re-entered. In aie2_hw_stop(), call drmm_kfree to free mbox.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_pci.c        | 17 +++++++++++++++++
>>   drivers/accel/amdxdna/aie2_pci.h        |  7 +++++++
>>   drivers/accel/amdxdna/amdxdna_mailbox.c |  6 ------
>>   3 files changed, 24 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index 349ada697e48..19c76b2b204b 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -267,12 +267,22 @@ static void aie2_hw_stop(struct amdxdna_dev *xdna)
>>       struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
>>       struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
>>   +    if (ndev->dev_status <= AIE2_DEV_INIT) {
>> +        XDNA_ERR(xdna, "device is already stopped");
>> +        return;
>> +    }
>> +
>>       aie2_mgmt_fw_fini(ndev);
>>       xdna_mailbox_stop_channel(ndev->mgmt_chann);
>>       xdna_mailbox_destroy_channel(ndev->mgmt_chann);
>> +    ndev->mgmt_chann = NULL;
>> +    drmm_kfree(&xdna->ddev, ndev->mbox);
>> +    ndev->mbox = NULL;
>>       aie2_psp_stop(ndev->psp_hdl);
>>       aie2_smu_fini(ndev);
>>       pci_disable_device(pdev);
>> +
>> +    ndev->dev_status = AIE2_DEV_INIT;
>>   }
>>     static int aie2_hw_start(struct amdxdna_dev *xdna)
>> @@ -283,6 +293,11 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>>       u32 xdna_mailbox_intr_reg;
>>       int mgmt_mb_irq, ret;
>>   +    if (ndev->dev_status >= AIE2_DEV_START) {
>> +        XDNA_INFO(xdna, "device is already started");
>> +        return 0;
>> +    }
>> +
>>       ret = pci_enable_device(pdev);
>>       if (ret) {
>>           XDNA_ERR(xdna, "failed to enable device, ret %d", ret);
>> @@ -345,6 +360,8 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>>           goto destroy_mgmt_chann;
>>       }
>>   +    ndev->dev_status = AIE2_DEV_START;
>> +
>>       return 0;
>>     destroy_mgmt_chann:
>> diff --git a/drivers/accel/amdxdna/aie2_pci.h 
>> b/drivers/accel/amdxdna/aie2_pci.h
>> index 6a2686255c9c..5d262ae5c9bb 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.h
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -149,6 +149,11 @@ struct amdxdna_hwctx_priv {
>>       struct drm_syncobj        *syncobj;
>>   };
>>   +enum aie2_dev_status {
>> +    AIE2_DEV_INIT,
>> +    AIE2_DEV_START,
>> +};
>> +
>>   struct amdxdna_dev_hdl {
>>       struct amdxdna_dev        *xdna;
>>       const struct amdxdna_dev_priv    *priv;
>> @@ -171,6 +176,8 @@ struct amdxdna_dev_hdl {
>>       struct mailbox            *mbox;
>>       struct mailbox_channel        *mgmt_chann;
>>       struct async_events        *async_events;
>> +
>> +    u32                dev_status;
>
> Shouldn't this be "enum aie2_dev_status" not "u32"?

You are right. I will fix it.


Thanks,

Lizhi

>
>>   };
>>     #define DEFINE_BAR_OFFSET(reg_name, bar, reg_addr) \
>> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c 
>> b/drivers/accel/amdxdna/amdxdna_mailbox.c
>> index 415d99abaaa3..eab79dbb8b25 100644
>> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
>> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
>> @@ -530,9 +530,6 @@ xdna_mailbox_create_channel(struct mailbox *mb,
>>     int xdna_mailbox_destroy_channel(struct mailbox_channel *mb_chann)
>>   {
>> -    if (!mb_chann)
>> -        return 0;
>> -
>>       MB_DBG(mb_chann, "IRQ disabled and RX work cancelled");
>>       free_irq(mb_chann->msix_irq, mb_chann);
>>       destroy_workqueue(mb_chann->work_q);
>> @@ -548,9 +545,6 @@ int xdna_mailbox_destroy_channel(struct 
>> mailbox_channel *mb_chann)
>>     void xdna_mailbox_stop_channel(struct mailbox_channel *mb_chann)
>>   {
>> -    if (!mb_chann)
>> -        return;
>> -
>>       /* Disable an irq and wait. This might sleep. */
>>       disable_irq(mb_chann->msix_irq);
>
