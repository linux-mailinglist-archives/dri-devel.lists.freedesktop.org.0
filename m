Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG4NDQdwn2n5bwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 22:56:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C0B19E0DC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 22:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9A810E83A;
	Wed, 25 Feb 2026 21:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZdWunw9t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011046.outbound.protection.outlook.com [52.101.62.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6B510E04E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 21:56:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACqGGpXKo52afVrtP7wAsUqVBG0Eo45sCZuwJMrnYUrFKRqXuGEt9f0Mi0m2B7nQTLHJ11l0fUnO0oZ5EHCR5o1mVIBMflnEFGD+tLkYEIGPOJO5soIyvOrxC1MhWW8eZui7Fuv6p0bHuCcPKNOqXM9pVno44Vzanm+Kr7ApMJPEcIbHFVI3JEE/NqXex4QHKTq76eIo1o3xgXEQ8gzP+LTZhVsEdsiQowi47m8Nj9rK+5M+slztHSj+QSQWXA4ynwTHNio8LhQW9DjEC3S8pyrczW/y8JYer4YdRf+KKXj+trVpwbXDhCFcQgDr15/8S2IXpFfFyLwq9i6bu5n+Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAs8g/SjjeU6gpnaA5USk/duZtkLzLiXmGbMGc/hZnY=;
 b=iafNihD74bsr+8AYDY5eQDTxv1lmfWvH92Recqp6O71fqOrnw9+7vRa/ejbehkJt4lqadeqqdiDsB/ndolaSb8DgGoTGt1J5ODFoq5Yz5l2xXfHbSKuKPSU2ATxVteJCwbQefNWPOeMVKvtqkoEKhvjrVTzmeDmGxgD8yDsGYdVDVRngi9mcYpqYYKsNR+KAL2cM549UKO6/aNZPoSRwg46ufnF8AVRg3J7lWpfxJkztjKhhNuRmiKyQ5RNDUEOQ2OJCQVY5jQPv1FaBedxkdJ7rnG5oHdXzoDQHHbD4a3GuoBkutqqwgmrYfkCwsogyqiEidZXCUz8acVhQ1g8O1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAs8g/SjjeU6gpnaA5USk/duZtkLzLiXmGbMGc/hZnY=;
 b=ZdWunw9t/FPPWMXZY0yJRC/ymqgMn7wQX5xOp6LNMVfYBD8s5MuUE+3azhXM68w1gM/5ILKrZWA3+aE7bTs2iTaDFSi4onVVd37AO5VgZZf8KX3/PzjB5Xj78pdWXYyEa4l668WXtypw9XTsUVFcKkphS2L1ifsbig9HngCa+dI=
Received: from BN9PR03CA0491.namprd03.prod.outlook.com (2603:10b6:408:130::16)
 by MN2PR12MB4423.namprd12.prod.outlook.com (2603:10b6:208:24f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 21:56:13 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::48) by BN9PR03CA0491.outlook.office365.com
 (2603:10b6:408:130::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.24 via Frontend Transport; Wed,
 25 Feb 2026 21:56:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 21:56:12 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Feb
 2026 15:56:12 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 25 Feb 2026 15:56:12 -0600
Message-ID: <1d746378-c8cc-c464-f7e6-3c9a02d6f735@amd.com>
Date: Wed, 25 Feb 2026 13:56:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2] accel/amdxdna: Use a different name for latest firmware
Content-Language: en-US
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20260225204752.2711734-1-lizhi.hou@amd.com>
 <c856ee59-215e-4bb3-a1e2-cd07139275fb@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <c856ee59-215e-4bb3-a1e2-cd07139275fb@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|MN2PR12MB4423:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dff4c9d-899f-4c3a-0241-08de74b8b139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: MSt62e2FXjWSM5HeqRcUHHX5d8cNoIoMAyB7bG7iEumix6QW7CvyMqwL5Nq/MkhTbb/Cw07w3+/JEEWMA5ZiuA2p6Lxi1C4USWH6EqOV1CqhIUeMeUvKftuCc3PnuADJKFBmims7b6h4Ppwm+MQfca8N8NaOEtZVGEUvV539AD1mR05Z0KsPqufro6//iyin7tu9kfHojTt3PLtJhlZSx5H5cjz3JG32j80Os3PYZXtTcvzVkvTBda0GSq6zCw8qt6nHCsN5cINpR9BBXap7OAiAtG3IHVcwl9ks3goB/F7COG+gKyHvRZLUllNp7qoQWDrPgLXhadGSB6qE7NqIw+ZJp4rg/YrZcVVA62qmuUobQ/vxNmoCn3HI8WnUh2myYTZxqYuEP1Pks2o9Anzexc7wmf+f+7dxxphycy+UCHqBwqzja02TVGFgyVpR9Pq6quz6DsA2mFMrJ4duPoc5Gd1JSiz1ou57P3i8l2ExPbevPaczRcoh3kkefExixLERdpfh5PVTTE2RABGWvNYWJatJKhVlof7a+IUbF7QgqQgmup+RPQyYZwAGmz22ZZsAj4gPanZy70DTNjZLLi8n+FAAO9T6ZeOsJ6xylDWFzjY6kb8pgqPSxRwrl1RCw7hEmKmuMRCBFuvnZ4q+adOskWGVTPMZAtRXpwZq4RDiQPackBwL5hVDRCEGXhj2Le4X5i42/rZGTz95xLezrGkaYoh5ur8lNsYDnYQz+B8fta9u4DW488gHW9tHq2YSvHr6ptJanAZzGotWA3qtzBTjHw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BTG6Z9P5u7E/jP9W8fQ925w7rWgc7pUDZi+i3Ri7fvXBr6x67eqR7I+dZn0Kqt5Ezo9kgTD9yNjQUknLyPCpAH/xhOOlVUXuUK07xNM0DwhTkUJtAC3HedbgxsxG/fYLv29Gy0gmlwo823mww9eyBw+/wMpKvBvX5GdD+2H1l8A1BvoLZ8WqPRDtesdKvQO90WCzi+MGS6qagDSpYkLGIfyOaRYGc5w6HVq0+lu+TUP7uDU9VeVMFo9hHYkUIRUEXozDC2DIvyDQfjuWb+8S2Og05k7bqG+mK4+4qWXuc4GiRGc5pk6/Dt3gf9bSCWpJ3dKY26wU3qKaMC1GhQc8Zp/eflvACg3fqYRwLcYC4Enx03z1TOgXptmQn5sEjQRKB6Ns/U5znOYSzZHk3AVoJBtsAJI+FQUhVMPV6ePaMXktfy4rXXuzxVbr6Y4quhhA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 21:56:12.8899 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dff4c9d-899f-4c3a-0241-08de74b8b139
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4423
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS(0.00)[m:superm1@kernel.org,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email,gitlab.freedesktop.org:url];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 73C0B19E0DC
X-Rspamd-Action: no action

Applied to drm-misc-fixes

On 2/25/26 12:49, Mario Limonciello (AMD) (kernel.org) wrote:
>
>
> On 2/25/2026 2:47 PM, Lizhi Hou wrote:
>> Using legacy driver with latest firmware causes a power off issue.
>>
>> Fix this by assigning a different filename (npu_7.sbin) to the latest
>> firmware. The driver attempts to load the latest firmware first and 
>> falls
>> back to the previous firmware version if loading fails.
>>
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/5009
>> Fixes: f1eac46fe5f7 ("accel/amdxdna: Update firmware version check 
>> for latest firmware")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>>   drivers/accel/amdxdna/aie2_pci.c        | 20 +++++++++++++++++++-
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +++
>>   drivers/accel/amdxdna/npu1_regs.c       |  2 +-
>>   drivers/accel/amdxdna/npu4_regs.c       |  2 +-
>>   drivers/accel/amdxdna/npu5_regs.c       |  2 +-
>>   drivers/accel/amdxdna/npu6_regs.c       |  2 +-
>>   6 files changed, 26 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index 4b3e6bb97bd2..85079b6fc5d9 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -32,6 +32,11 @@ static int aie2_max_col = XRS_MAX_COL;
>>   module_param(aie2_max_col, uint, 0600);
>>   MODULE_PARM_DESC(aie2_max_col, "Maximum column could be used");
>>   +static char *npu_fw[] = {
>> +    "npu_7.sbin",
>> +    "npu.sbin"
>> +};
>> +
>>   /*
>>    * The management mailbox channel is allocated by firmware.
>>    * The related register and ring buffer information is on SRAM BAR.
>> @@ -489,6 +494,7 @@ static int aie2_init(struct amdxdna_dev *xdna)
>>       struct psp_config psp_conf;
>>       const struct firmware *fw;
>>       unsigned long bars = 0;
>> +    char *fw_full_path;
>>       int i, nvec, ret;
>>         if (!hypervisor_is_type(X86_HYPER_NATIVE)) {
>> @@ -503,7 +509,19 @@ static int aie2_init(struct amdxdna_dev *xdna)
>>       ndev->priv = xdna->dev_info->dev_priv;
>>       ndev->xdna = xdna;
>>   -    ret = request_firmware(&fw, ndev->priv->fw_path, &pdev->dev);
>> +    for (i = 0; i < ARRAY_SIZE(npu_fw); i++) {
>> +        fw_full_path = kasprintf(GFP_KERNEL, "%s%s", 
>> ndev->priv->fw_path, npu_fw[i]);
>> +        if (!fw_full_path)
>> +            return -ENOMEM;
>> +
>> +        ret = firmware_request_nowarn(&fw, fw_full_path, &pdev->dev);
>> +        kfree(fw_full_path);
>> +        if (!ret) {
>> +            XDNA_INFO(xdna, "Load firmware %s%s", 
>> ndev->priv->fw_path, npu_fw[i]);
>> +            break;
>> +        }
>> +    }
>> +
>>       if (ret) {
>>           XDNA_ERR(xdna, "failed to request_firmware %s, ret %d",
>>                ndev->priv->fw_path, ret);
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> index 4ada45d06fcf..a4384593bdcc 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -23,6 +23,9 @@ MODULE_FIRMWARE("amdnpu/1502_00/npu.sbin");
>>   MODULE_FIRMWARE("amdnpu/17f0_10/npu.sbin");
>>   MODULE_FIRMWARE("amdnpu/17f0_11/npu.sbin");
>>   MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>> +MODULE_FIRMWARE("amdnpu/1502_00/npu_7.sbin");
>> +MODULE_FIRMWARE("amdnpu/17f0_10/npu_7.sbin");
>> +MODULE_FIRMWARE("amdnpu/17f0_11/npu_7.sbin");
>>     /*
>>    * 0.0: Initial version
>> diff --git a/drivers/accel/amdxdna/npu1_regs.c 
>> b/drivers/accel/amdxdna/npu1_regs.c
>> index 6f36a27b5a02..6e3d3ca69c04 100644
>> --- a/drivers/accel/amdxdna/npu1_regs.c
>> +++ b/drivers/accel/amdxdna/npu1_regs.c
>> @@ -72,7 +72,7 @@ static const struct aie2_fw_feature_tbl 
>> npu1_fw_feature_table[] = {
>>   };
>>     static const struct amdxdna_dev_priv npu1_dev_priv = {
>> -    .fw_path        = "amdnpu/1502_00/npu.sbin",
>> +    .fw_path        = "amdnpu/1502_00/",
>>       .rt_config    = npu1_default_rt_cfg,
>>       .dpm_clk_tbl    = npu1_dpm_clk_table,
>>       .fw_feature_tbl = npu1_fw_feature_table,
>> diff --git a/drivers/accel/amdxdna/npu4_regs.c 
>> b/drivers/accel/amdxdna/npu4_regs.c
>> index a8d6f76dde5f..ce25eef5fc34 100644
>> --- a/drivers/accel/amdxdna/npu4_regs.c
>> +++ b/drivers/accel/amdxdna/npu4_regs.c
>> @@ -98,7 +98,7 @@ const struct aie2_fw_feature_tbl 
>> npu4_fw_feature_table[] = {
>>   };
>>     static const struct amdxdna_dev_priv npu4_dev_priv = {
>> -    .fw_path        = "amdnpu/17f0_10/npu.sbin",
>> +    .fw_path        = "amdnpu/17f0_10/",
>>       .rt_config    = npu4_default_rt_cfg,
>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>       .fw_feature_tbl = npu4_fw_feature_table,
>> diff --git a/drivers/accel/amdxdna/npu5_regs.c 
>> b/drivers/accel/amdxdna/npu5_regs.c
>> index c0a35cfd886c..c0ac5daf32ee 100644
>> --- a/drivers/accel/amdxdna/npu5_regs.c
>> +++ b/drivers/accel/amdxdna/npu5_regs.c
>> @@ -63,7 +63,7 @@
>>   #define NPU5_SRAM_BAR_BASE    MMNPU_APERTURE1_BASE
>>     static const struct amdxdna_dev_priv npu5_dev_priv = {
>> -    .fw_path        = "amdnpu/17f0_11/npu.sbin",
>> +    .fw_path        = "amdnpu/17f0_11/",
>>       .rt_config    = npu4_default_rt_cfg,
>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>       .fw_feature_tbl = npu4_fw_feature_table,
>> diff --git a/drivers/accel/amdxdna/npu6_regs.c 
>> b/drivers/accel/amdxdna/npu6_regs.c
>> index 1fb07df99186..ce591ed0d483 100644
>> --- a/drivers/accel/amdxdna/npu6_regs.c
>> +++ b/drivers/accel/amdxdna/npu6_regs.c
>> @@ -63,7 +63,7 @@
>>   #define NPU6_SRAM_BAR_BASE    MMNPU_APERTURE1_BASE
>>     static const struct amdxdna_dev_priv npu6_dev_priv = {
>> -    .fw_path        = "amdnpu/17f0_10/npu.sbin",
>> +    .fw_path        = "amdnpu/17f0_10/",
>>       .rt_config    = npu4_default_rt_cfg,
>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>       .fw_feature_tbl = npu4_fw_feature_table,
>
