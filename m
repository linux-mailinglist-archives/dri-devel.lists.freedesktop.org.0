Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKz1NfFdn2lRagQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 21:39:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7B619D568
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 21:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83C610E82F;
	Wed, 25 Feb 2026 20:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BmRHU6Ms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010020.outbound.protection.outlook.com
 [40.93.198.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9B510E833
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 20:39:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBS+L0LMyMsqebSodIMTx23TESRCzbMDMN676hgBf7zmhZc8F51Si5alJyCA5sGZtretK/9CNAX4QGsco4dRwp8TnqVivKIkGLLhg9PPObEhy7PFheGf1gWGQKnwMjOYd2zbjo93CzXS40ee/C9y4IhlDy7PTAZWkyhqmzvw1OB6OzlmqP+X+6vBqlKP7SDhIKhW5qKYtnBR4YCRROhMS/NmNB6Swcz7CzSHzVdmxzcFg349Dko0VC7B/lUs7U9HVdiUEem0xrmMIoaQhTez7hahpjMVMTCwY6VR2AhdsKYzBVmx058bF7E+eQ17hgbb/4EPs6p0MbK7sr7TBM4bQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5u4E44Hnrct23J5mOxMcMYUYI5Yf0lQQuoZ0IlyRE8=;
 b=rIvDzo3GUkJI/uGAwVuuph8Izb13X9Bx2ri4wU/R6/0eSCm5Q3ipmqvqcWEyig/YaUmYPbx5EGVykFq57SY+gi+pc3APwHf18BGlv9lyAtLRH7767kKGMges6P+OZhD0P1Qk65bBm0WkS8izQaG9/hxwbxXwO/ljKIWk27EtjHAtUDP5KXJpAf9YbQ3V53Tz7vc10tvLLCXBiFuMUQXixSeSuozsCksaetq81/bsbnWi4I6DZBVPOIsIY0tsVO53euZMdGIQWcHN7ec9nn7Z+BxNosq5YTxpLdhi/KoMBt9WjXaI0EsySP3BPcKgeZ+g4GYM4v2rdYLmEgt5NtzHNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5u4E44Hnrct23J5mOxMcMYUYI5Yf0lQQuoZ0IlyRE8=;
 b=BmRHU6MsS1r6YqpJd7QhAoQb2nfKAtIJQFZPxtxbqY141rM7hLcZUeNcywnSt4L52CMGlqoDZFYuS7JqwbqK7UZkjAAhfP6JRJr7yz0Gc1BwAXPuu8NtAXxUUHPo+WFePkyfHoM946YHPWGf/duZI0W9Q0db6HPlcT3PS9NRY2k=
Received: from SJ0PR05CA0163.namprd05.prod.outlook.com (2603:10b6:a03:339::18)
 by CY3PR12MB9607.namprd12.prod.outlook.com (2603:10b6:930:103::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 25 Feb
 2026 20:38:58 +0000
Received: from MWH0EPF000C618E.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::15) by SJ0PR05CA0163.outlook.office365.com
 (2603:10b6:a03:339::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 20:38:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C618E.mail.protection.outlook.com (10.167.249.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 20:38:57 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Feb
 2026 14:38:57 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Feb
 2026 14:38:57 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 25 Feb 2026 14:38:56 -0600
Message-ID: <d5ebd594-bb89-dfcf-ce93-3b73befc5895@amd.com>
Date: Wed, 25 Feb 2026 12:38:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Use a different name for latest firmware
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20260225193022.2707525-1-lizhi.hou@amd.com>
 <8fda54f7-5b53-4d43-b98e-727f85820119@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <8fda54f7-5b53-4d43-b98e-727f85820119@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618E:EE_|CY3PR12MB9607:EE_
X-MS-Office365-Filtering-Correlation-Id: b218f5b7-0312-4065-4cf1-08de74ade68c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: HUAYl01S2h/fGg28dy+cZzctGo8XW9DtFnA5hCihKXHPdnBEjNBVXBizeiiN9gxl55kfjCVR62oAOifAv+TyEmWJwb8AFKwxlrRyP9nf0bHjKEOuaz6T6bY/a3+b6xoYN/86NIi52VaAKyJKsSKRn14osQUczc1hwUHVA9AG4Ip3JG8uuMfdXNNkQxX6pAiMk6mWchm4yfNtm4EF7QA7U2e+abdeBDO96Zlw+Gys410eKx1wYvhbQ71aVJDQxMtdaTfg5n2EnAo6aDhWhMX7xNfA9aZCfs66pLmKXbcizvNawwJqGYloI+whG1PCb6XbjQc3ipnhJGsRTL3iAdgmkGV9EvBFxoc/F2UdYQZWIGLT6CHwCaAFdK2/VEWhSXBsrJxw9x1j8NdtbgUmL3AlNm1it9yDLkOxpcCQs0ZZV+pImMQxKfQvPcmAcIRpmvWF4h5zwesF0LZL4S3cSSWhxuYH54fNyKgILrnUl1URDikyvIpUj9YLPp15YqDjMJCmc0NQrE58UWelRXeMMKQuAx1L0Y4s5HP1M5EkmtQc9N0zP1KxQUjBwy4WXNz4k6OT8jrZ9fTTeXNiHCj+iagx5/iveg/jnSYcVuwzmbb0rcj8Wk0svBZgWNPCpozxp3kaxl7ZN1EAPDArYIe8AuHbhUbLD9iwgvzgB1CEwu5A8cTdMyYyB30Q8FphXzquk5hBf0vRgrq8lh+PhnLMQ16YfygaNytoq8TbwQmkiACNNoJwfzdRw69M1WntLJeVo9BglID7Jtixu1lwTz6cUSU4fA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5GFwt+CwnV8+hYh9uHJ+z3MvH9vcvZMlxLrWeX48DlAkM0gDFBP9/FCAYpwb4smzWNLStTarTfuyAD0kbrRismBjgbYhqNxxoIO9ukaTPzuONhJiBSMCrGfz/56PV8KetV6iguYkDCjYrZiYmoAtPol62HO6HzMLiJRC22Piq9k2JXvThgz8MtxVFabUkWxiaUrJaO4ZUqcwXtsl2hXe44iv2I3p0dTAd6ccexuq4CO9uTdS2DVBUp+f+15AtmGnn78aSha5nvoddUozMkSI1VkbcmA5QibZCLr2s/nonpbFeYWxiQjh1U8TDDRwHz6cGL1dPpr3QUn1a2WJurwLYc5rw/kA6rclBmCyed826LceIn2IeYbFXSbrfLnkGKU2WoYZWjLDaC4jkAtjqvhLRruIaH32jLVr+gwklZqeKmSI18EsYLnttJHi/8Uy5wMs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 20:38:57.8607 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b218f5b7-0312-4065-4cf1-08de74ade68c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C618E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9607
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
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
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: ED7B619D568
X-Rspamd-Action: no action


On 2/25/26 11:46, Mario Limonciello wrote:
>
>
> On 2/25/2026 1:30 PM, Lizhi Hou wrote:
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
>
> Thanks for the quick response on this one.  A few comments inline.
>
>> ---
>>   drivers/accel/amdxdna/aie2_pci.c        | 21 +++++++++++++++++++--
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  4 +++-
>>   drivers/accel/amdxdna/npu1_regs.c       |  2 +-
>>   drivers/accel/amdxdna/npu4_regs.c       |  2 +-
>>   drivers/accel/amdxdna/npu5_regs.c       |  2 +-
>>   drivers/accel/amdxdna/npu6_regs.c       |  2 +-
>>   6 files changed, 26 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index 4b3e6bb97bd2..884e7702b674 100644
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
>> @@ -503,10 +509,21 @@ static int aie2_init(struct amdxdna_dev *xdna)
>>       ndev->priv = xdna->dev_info->dev_priv;
>>       ndev->xdna = xdna;
>>   -    ret = request_firmware(&fw, ndev->priv->fw_path, &pdev->dev);
>> +    for (i = 0; i < ARRAY_SIZE(npu_fw); i++) {
>> +        fw_full_path = kasprintf(GFP_KERNEL, "%s%s", 
>> ndev->priv->fw_path,
>> +                     npu_fw[i]);
>> +        if (!fw_full_path)
>> +            return -ENOMEM;
>> +
>> +        ret = request_firmware(&fw, fw_full_path, &pdev->dev);
>> +        kfree(fw_full_path);
>> +        if (!ret)
>> +            break;
>
> Since you're falling through two different binaries, I think that it 
> would be a good idea to use firmware_request_nowarn() and then have 
> your own warning if both are missing.
Good point. I will send V2.
>
>> +    }
>> +
>>       if (ret) {
>>           XDNA_ERR(xdna, "failed to request_firmware %s, ret %d",
>> -             ndev->priv->fw_path, ret);
>> +                 ndev->priv->fw_path, ret);
>
> Looks like unintended whitespace change.
Will fix this.
>
>>           return ret;
>>       }
>>   diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> index 4ada45d06fcf..d5c699e1afe4 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -22,7 +22,9 @@
>>   MODULE_FIRMWARE("amdnpu/1502_00/npu.sbin");
>>   MODULE_FIRMWARE("amdnpu/17f0_10/npu.sbin");
>>   MODULE_FIRMWARE("amdnpu/17f0_11/npu.sbin");
>> -MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>
> I think this should be separate commit.  It's actually a fix for this 
> right?
>
> Fixes: 3ef93841033ed ("accel/amdxdna: Remove NPU2 support")

Correct. I will remove it from this patch.


Thanks,

Lizhi

>
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
