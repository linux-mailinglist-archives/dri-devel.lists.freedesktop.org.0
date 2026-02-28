Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LmOdNhleomnf2QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 04:16:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD0F1C019A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 04:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484B710E160;
	Sat, 28 Feb 2026 03:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lxRb3wBq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010018.outbound.protection.outlook.com [52.101.46.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E6C10E160
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 03:16:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhNtalYr9TTycvNK4u8lA1F9fWXLT7vtHk+6b9q8Le7esT6OS6XqkyL7V7NUU8ffCQOptLp/U2dznqbiTxje9MqZrtKeJJBs9rBrZw19sfFP6XVVRGdh3fnN7vKmkEFHtdAwnzydPpq/ieCtZZX8qspV39elOu4CNz2ewLa44HUBDrQTKFrqiNi2znkpZbwnPEpC6nmUUGGITN6l4UpnMknwXvSxn3N3Qw4tSgui8azN+ok+po7ARhBOChrVE8XOqmLGbl//IE7grn1ALWkLcAVxoOonUb95xUvnmTGuzOukYINanX4pef156W84Ax+LNqeXX+JVdl86cCcqvPLRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdyT81aPGxRT/nabqZZkkU8w70Ufb9jZpny1F61rsCM=;
 b=xueMtFbCK7dX3dCn5lhVXoxq6BfwgatqrT3MJkq1ep2VQfhNb/pKqqYJHbwjKzcN/y7uo39FDww6APLFp4LiJ6e+5PYQFi9CI/qUzCa2UDdPRlZIuOshPjQsaF1X11e5Z/1u0zuq/Jaw4YSvrDod+QrpyXaMk9QYna6IfMLsfcCso14wfaKWdoXFBl/tlpFRd/L59jz4ojSRFhLdZX+RZrs6822dClkQrn2S1NOD0LxDekyclVGSXDinNRZLKfoAEbFkF5b10vp7rJkxpOJZaV8PIjCyKLbfvZ1HV+MPUmwY1L6UmiEetHBk4fvWWCkVLNR3XiRFCLHqTtx9qDx5fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdyT81aPGxRT/nabqZZkkU8w70Ufb9jZpny1F61rsCM=;
 b=lxRb3wBq/lwrMaSGlUMUKiyVqv9hqrYEmYz91BBbSte8heTtz0/vESXQY2s7HOzGEYTXDVOoJIwEzxeDLzwQxSt2u45IBPNq8H3nKaVuZ+c1GG4VXl64EwU0tLBFEKzhr88a61KP/wjRbxpq9PZGS/QLJD7cLmkpcox1T9e3F58=
Received: from BL1P223CA0032.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::15)
 by CY5PR12MB6226.namprd12.prod.outlook.com (2603:10b6:930:22::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 03:16:32 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:208:5b6:cafe::5b) by BL1P223CA0032.outlook.office365.com
 (2603:10b6:208:5b6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.27 via Frontend Transport; Sat,
 28 Feb 2026 03:16:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Sat, 28 Feb 2026 03:16:32 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Feb
 2026 21:16:32 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 27 Feb 2026 21:16:31 -0600
Message-ID: <7806bdea-7ec4-23c2-aef9-6da395cc181d@amd.com>
Date: Fri, 27 Feb 2026 19:16:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Fix NULL pointer dereference of
 mgmt_chann
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20260226213857.3068474-1-lizhi.hou@amd.com>
 <e666947b-30b7-444c-9400-966009373e8c@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <e666947b-30b7-444c-9400-966009373e8c@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|CY5PR12MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: 3730e32e-b78e-4918-9101-08de7677c5c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: ZyoKu/YkfxvvaWoHigG6/PzXAOXyR7itphNudkPP07X+BZS/Lw2vNpOoqldm1enbt8eCd1tp4XsdhEDT6Nz4ZFH92ZOfKNDCAVNOtWm41ADiBmjyJ5F1vt/Nsa5AdAFgYlyeBmmHpkUfwxGTu85TCq4xk1wnc28wLg0UIhL48A6K2o8Ubhk5DfKzPvyxCnnM8VY+l+Wm5BDpeYJGHEkQsurHmzHtTbpTEBnIg+3EhnpSooBSqn/XNi/JYAJr9EAe6OuiyP/5vOjjZ+6GDGf0+B9ocloX0K90mOzUdbh3A35Kzcwd6WPCKRrtKjYvsUYcbzmhuf9w3DMdKd39Cuzx5Mew43ZEr4pzO33JsxaGqaS0zfAktdOaYV0PjXO6nltOvI97Tqw5QDxpl1mJh6qd+128odOuZ0c6GRF4ETHKr0kvjw5NMNmV6HUkwjELL3Oe9n42PmvhMOay+JeGc6hlIajgPJYql8kgQzP87jfZ0zQeP9zoymVVnAYFPcWFrv06FjpmLb07kXi/cCcjCPFD/FW7dXHGWeWDIrQ6KPvDsEVekidkIbp53+Er7fOtCwswLbNzGnSXeB//XaqB3z5nxH95SpW2akRBTxyvUKmsix8p/04Jx1BhgtPyoyhzTdTQPjpN1OlvmnB/i0j0EhkIC5K9iufC68nLBhAE1E3Kav2iRArBA8pnl70tRhzSNbK+CykB8jPJ0/lPUB8bi/jYreEz9y2zR76e1vgtGoFT3BKUymeBLNY0wcJG/zl69cUoJU89grmzdqfBFrVVXVluXpA+vPF+3+my0mnx2/mihCzaX714qnv5FXyveDjh6ejH
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kla5YionJkIiT1kP2c/fLxcV38CjhKepQmHRRsyb/Drc+svc4NmcYKykSKox8qP/AGZSAG18RRP4bL9i1QJKwWf9hGDGPpFoEUmzesbcYlpRxcsWItIZHu3/3rUuMwCqAGeQgQSHQkNaAyxYfowQ74qDA/j3ExyuS37C9y7ak41K0CR8s8orSMYv1MwPz61jB0+MkMUoPlo3X7hKnAecOewsY9zRG3cFdbzuYogC0kDmVUYw/fkuVhwrG0RYfiai3sue3sahJ+X9DAfkrGjJR9sxVj8BRmVzAswWs3QopQf6xH96tgbiEMiVzG8S8P3ZV88AfSgtipCwCtEylzlJao069jc4GxHjNkafb9/5xHwpJP+qck/sCd0Xu5KntGd/vdigPnvZbq8R9Z9r89MlVLhCaolFoM/RTzPlwDZ93c8Ej/jj493y17D38t//h/Mv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 03:16:32.3782 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3730e32e-b78e-4918-9101-08de7677c5c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6226
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1AD0F1C019A
X-Rspamd-Action: no action


On 2/27/26 12:11, Mario Limonciello wrote:
> On 2/26/26 3:38 PM, Lizhi Hou wrote:
>> mgmt_chann may be set to NULL if the firmware returns an unexpected
>> error in aie2_send_mgmt_msg_wait(). This can later lead to a NULL
>> pointer dereference in aie2_hw_stop().
>>
>> Fix this by introducing a dedicated helper to destroy mgmt_chann
>> and by adding proper NULL checks before accessing it.
>>
>
> Is this actually going to fix it?  It sounds like a concurrency 
> problem, no?

It is not concurrency issue. The code is protected by dev_lock. That is 
why I added

       drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));

in my fix.

This is actually error code path issue. Normally, xdna_send_msg_wait() 
will not time out. This only happens with broken firmware. That is why 
it was not found before.

Lizhi

>
> Do you want a mutex in the helper perhaps?
>
>> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_message.c | 21 ++++++++++++++++-----
>>   drivers/accel/amdxdna/aie2_pci.c     |  7 ++-----
>>   drivers/accel/amdxdna/aie2_pci.h     |  1 +
>>   3 files changed, 19 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_message.c 
>> b/drivers/accel/amdxdna/aie2_message.c
>> index 277a27bce850..22e1a85a7ae0 100644
>> --- a/drivers/accel/amdxdna/aie2_message.c
>> +++ b/drivers/accel/amdxdna/aie2_message.c
>> @@ -40,11 +40,8 @@ static int aie2_send_mgmt_msg_wait(struct 
>> amdxdna_dev_hdl *ndev,
>>           return -ENODEV;
>>         ret = xdna_send_msg_wait(xdna, ndev->mgmt_chann, msg);
>> -    if (ret == -ETIME) {
>> -        xdna_mailbox_stop_channel(ndev->mgmt_chann);
>> -        xdna_mailbox_destroy_channel(ndev->mgmt_chann);
>> -        ndev->mgmt_chann = NULL;
>> -    }
>> +    if (ret == -ETIME)
>> +        aie2_destroy_mgmt_chann(ndev);
>>         if (!ret && *hdl->status != AIE2_STATUS_SUCCESS) {
>>           XDNA_ERR(xdna, "command opcode 0x%x failed, status 0x%x",
>> @@ -914,6 +911,20 @@ void aie2_msg_init(struct amdxdna_dev_hdl *ndev)
>>           ndev->exec_msg_ops = &legacy_exec_message_ops;
>>   }
>>   +void aie2_destroy_mgmt_chann(struct amdxdna_dev_hdl *ndev)
>> +{
>> +    struct amdxdna_dev *xdna = ndev->xdna;
>> +
>> +    drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>> +
>> +    if (!ndev->mgmt_chann)
>> +        return;
>> +
>> +    xdna_mailbox_stop_channel(ndev->mgmt_chann);
>> +    xdna_mailbox_destroy_channel(ndev->mgmt_chann);
>> +    ndev->mgmt_chann = NULL;
>> +}
>> +
>>   static inline struct amdxdna_gem_obj *
>>   aie2_cmdlist_get_cmd_buf(struct amdxdna_sched_job *job)
>>   {
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index 85079b6fc5d9..977ce21eaf9f 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -330,9 +330,7 @@ static void aie2_hw_stop(struct amdxdna_dev *xdna)
>>         aie2_runtime_cfg(ndev, AIE2_RT_CFG_CLK_GATING, NULL);
>>       aie2_mgmt_fw_fini(ndev);
>> -    xdna_mailbox_stop_channel(ndev->mgmt_chann);
>> -    xdna_mailbox_destroy_channel(ndev->mgmt_chann);
>> -    ndev->mgmt_chann = NULL;
>> +    aie2_destroy_mgmt_chann(ndev);
>>       drmm_kfree(&xdna->ddev, ndev->mbox);
>>       ndev->mbox = NULL;
>>       aie2_psp_stop(ndev->psp_hdl);
>> @@ -441,8 +439,7 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>>       return 0;
>>     destroy_mgmt_chann:
>> -    xdna_mailbox_stop_channel(ndev->mgmt_chann);
>> -    xdna_mailbox_destroy_channel(ndev->mgmt_chann);
>> +    aie2_destroy_mgmt_chann(ndev);
>>   stop_psp:
>>       aie2_psp_stop(ndev->psp_hdl);
>>   fini_smu:
>> diff --git a/drivers/accel/amdxdna/aie2_pci.h 
>> b/drivers/accel/amdxdna/aie2_pci.h
>> index b20a3661078c..e72311c77996 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.h
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -303,6 +303,7 @@ int aie2_get_array_async_error(struct 
>> amdxdna_dev_hdl *ndev,
>>     /* aie2_message.c */
>>   void aie2_msg_init(struct amdxdna_dev_hdl *ndev);
>> +void aie2_destroy_mgmt_chann(struct amdxdna_dev_hdl *ndev);
>>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev);
>>   int aie2_resume_fw(struct amdxdna_dev_hdl *ndev);
>>   int aie2_set_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, 
>> u64 value);
>
