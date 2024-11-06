Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3550E9BF529
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 19:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BAD10E1FC;
	Wed,  6 Nov 2024 18:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E60LVyOc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F036A10E1FC
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 18:23:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkeLLqP8YHY6xXSjBA7xZB8iShqtXHyshSyHkZ2H4InDiJXXBVZ1kwVL0vRLnaaM3aa0ogP16lqWJQ0teafnGjIGb35jM5sZ7DtqebJrCT22Oke4IvrIz7Skri6bopUVKbnvC7A+AT3HRAxupJJCGFq4h7VYXxmIXsN8hShfIlBiyEjuwxob9PRssxxaRs/cFS8CG0Hgm4K6Bt3BHGauXo3iox63f7Xq2E0yaL+xUO0Q4ixsSriBAXYoW2K9+3kb+98CJAknWjzg3At177Zthp1SUWxgfqGzFQtZAAoQwg12fFIWvL7mLBK65EjffXHwwqvmXijIsvCEnyZCbMJEUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=darlBpLEB1CtoeF2MIoSqYzUWfpAQWsg4MRreBz9vWM=;
 b=UTxSW/loW7600qiYGLodSkOZ8chbAdKopegVXTQwxTyDSxPikW6gccbDmcnbUsABfln+3KdDrEQSJL5tUOxW43J3yT2AcvhR8udUhE3I1rm98lPEug3GOv7IGU2VvOBX3elvcOEJQlOeD/Hhq1NISQZK/oz32dd0fPYwWUWq7pw0FP6kSKxut6letyr/6G3SQvNEl2Nr+UCH0ceJk/3dxolzGmNF0zYziErbKKnmIR+WQXoSQ7U7/Hnn6VSg+Qq3hhnfauTKDGF/aGkg0KRKLDhGHJiTQhLcc7yBNitrq44vkz4hzI9zftq70fmzXf+BkVWIwA3EbCMe9DBv6hSiRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=darlBpLEB1CtoeF2MIoSqYzUWfpAQWsg4MRreBz9vWM=;
 b=E60LVyOcpiIfbUiaXrCJOydUsnbqbip9/NAJHqfD+HOYa2RRTudpdPXv9aEUpFLataFDbRhWLMpFYj57T8M3ccFDDpCIeVosgGKVVFcvpl0uNt7HCZeW6no+KMn7rL5NUx0q0pEPtQMfcUiTF7TYhCYOhL+VYJjvOibNR7FBhec=
Received: from CH0PR03CA0024.namprd03.prod.outlook.com (2603:10b6:610:b0::29)
 by PH0PR12MB7792.namprd12.prod.outlook.com (2603:10b6:510:281::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 18:23:28 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::10) by CH0PR03CA0024.outlook.office365.com
 (2603:10b6:610:b0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.32 via Frontend
 Transport; Wed, 6 Nov 2024 18:23:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 18:23:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 12:23:22 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 12:23:22 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 6 Nov 2024 12:23:21 -0600
Message-ID: <a100b35f-ab8a-e7f6-325d-b29953c756c5@amd.com>
Date: Wed, 6 Nov 2024 10:23:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V6 07/10] accel/amdxdna: Add command execution
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
CC: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
References: <20241030155147.103908-1-lizhi.hou@amd.com>
 <20241030155147.103908-8-lizhi.hou@amd.com>
 <ZyhqSDch6JY48FUU@lstrano-desk.jf.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <ZyhqSDch6JY48FUU@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|PH0PR12MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: ad7ae658-aaea-4075-f888-08dcfe901afa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDU2aGhTUXRJbjhma21ZN3pCRUFEQ2NLZTdLTG1LbnZpZ1R6ZUFuV0ZWQU04?=
 =?utf-8?B?Yk41M0V4czMwaCtwUUZTZFRpRHg4bnhxWGhudVo4MWc3WktYYnR5Z0lGL0dl?=
 =?utf-8?B?WE1OQ3VNTVBMZHFkNFkrUUpGV3VwNjVGVXlJeUQ2eVF0dGhZTkdBS2s4akVn?=
 =?utf-8?B?cUM2WGhNd011VmFlN1FSa0kxdUxNbVpOZ1U0NkhTT2RRUm9aSFlmNDFqRUl4?=
 =?utf-8?B?NDRaYjdVZlpxTUZJQjdRNXVxZ3M0VUg3NkZ5WUdBUWtzN2NSY0ZIUVlBQThP?=
 =?utf-8?B?YjVSa0FndnZvbXIvUHM2NDkxYWlWZDhCOTVYZE55U3g2OThFckY2RDZ0ZWFL?=
 =?utf-8?B?RXppOEFSa1FiOUZMOFJ5N3JZRzhKbisrbGxaWHdDdmpjUUZNNFBvYUE5VTBn?=
 =?utf-8?B?OEdQaXRMdmZOeE5nOHBnZDlCU0VjVXVnZ21zTUZvRXdVcmNFN240SWxnekpM?=
 =?utf-8?B?V3Y1bjdpRzN2cHhQdjZPTnlNR2dhR1g0ME9LNzhtaHVEeiszeVhIamp5Q1JO?=
 =?utf-8?B?bzEyY3dYV2pCMGNFMmpVMm02emg4ZzZrQWVNR1ROSzFvL2Z3QVBOZlQ2a0tu?=
 =?utf-8?B?YklaeFJJVHRPSEFnS1pIRTRxdG5CZ3RBOGFWdDlKQ3h5enVIMEFGZkJmektI?=
 =?utf-8?B?RUNvaVE3VksrUUZrdjl3NjRmdFFqanNjd1JlTnVUa0RlTE1VR0R1TzlxL3c5?=
 =?utf-8?B?OFd6OVBxQTcxOENkdnF5MkxiTzc1Z0dwcTJGSGx0ZFI3RGR5eWdWMnJzL1BK?=
 =?utf-8?B?UUlnOUpUNEd1cVFtZnU3NkR6Q2xzYS84eXZrQWtkYmU3NG5EZ3JkZEtXNUpI?=
 =?utf-8?B?UFkzRHk2WWlPdHdLNS81U3d4YzJidWtoVmpOcUd3aVRuTkdZbWpVbzRvcmMv?=
 =?utf-8?B?VEFyTjVlS0NmZFd1b3cwZzNNa05DM05YbDR0RU5RV1hIOHFMYWNhSkRpRlZ4?=
 =?utf-8?B?TURncVdvMW8wcXdRd3dIaThCUXNvTkxvNUlGL21ZSEI0cStoZEpKNXpqMUI5?=
 =?utf-8?B?ajJiWk91ZHE4RklvLzk2enlVOUlXL004akxCR1VSRzVjTVhRYjZZRlIzaE5P?=
 =?utf-8?B?NDhpTzFVOFh0Nkw0cVhEdUpyaE9CK21LTEdpRlRBYXkyOUd0bzVPZDh2dTk4?=
 =?utf-8?B?RXVVZEFlbFVkRjJUK2lEaEpZditEL3JtZkE2Z1FGSHVtZTE5UU81TG1iUTNZ?=
 =?utf-8?B?K2xXK0ZLRjRTNmFwS0EvTXhJanZMa0NPZm9SaTlTZ0VqUnh3SUJRM2YrMVg0?=
 =?utf-8?B?YUxnRSt3R2VrS1JhclJqKzRaaFEvZXMwY3MrTkNhTmZPbHBIRmhiSXVaSFVp?=
 =?utf-8?B?dFE1NC9LNGdxSG9mWVdqSEVZRUVTWnV3UkJyTFBYVTRiOEU1dTFabE9TdnJu?=
 =?utf-8?B?ZkkvRnkwWk11ak00MDl2c1FTbFBIUXBXN3pMRGpNMHMxOUpNWC92YzlzVnYw?=
 =?utf-8?B?NVJ1a0FVaXo4N1VTRjVYWlZGOEw1TGk4d3oyKy9sdHZuRFlDbWYzSTRNMnNk?=
 =?utf-8?B?WUJlWWc3VFl2dVpFNXVvcitQQUlNckt1VFpGQXF1NkpocndHaVlZSWFaUmE2?=
 =?utf-8?B?RUowL0pjdWkxbS9PS285MnAvaW1vYnhoNTU2d3NDMkpQU2tMcGpCWG81TWN5?=
 =?utf-8?B?ZUFxcERtd2pwSjA5RmtmbG9pdkZ0VU5wQWdzTjlmdHh3dlkrdzRKR2NCY0Y4?=
 =?utf-8?B?ZXB3MGFyUUpVWVNWSWIyK2k4UytXa0pTL1NFTnpjdDBDUEFzaGc0ejhNYVRs?=
 =?utf-8?B?TjhNTkRQTW9BeTZEKzRSaWhPZy9sS1c2SWFzdDJQQm43TTdhNG84ejlMM2dM?=
 =?utf-8?B?SkRUTlNQQmFLZEhQNzZxVUJUblphWjhGV3hpSHNWSjV3R1c1dkt3YXF2OXNC?=
 =?utf-8?B?aEZsV2ZyL3F4a3hmbUFDbk9yT3FKekp1NnNlY0ZWSEs2bFE9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 18:23:26.0231 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7ae658-aaea-4075-f888-08dcfe901afa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7792
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


On 11/3/24 22:31, Matthew Brost wrote:
> On Wed, Oct 30, 2024 at 08:51:44AM -0700, Lizhi Hou wrote:
>> Add interfaces for user application to submit command and wait for its
>> completion.
>>
>> Co-developed-by: Min Ma <min.ma@amd.com>
>> Signed-off-by: Min Ma <min.ma@amd.com>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_ctx.c              | 664 +++++++++++++++++-
>>   drivers/accel/amdxdna/aie2_message.c          | 343 +++++++++
>>   drivers/accel/amdxdna/aie2_pci.c              |   5 +
>>   drivers/accel/amdxdna/aie2_pci.h              |  35 +
>>   drivers/accel/amdxdna/aie2_psp.c              |   2 +
>>   drivers/accel/amdxdna/aie2_smu.c              |   2 +
>>   drivers/accel/amdxdna/amdxdna_ctx.c           | 330 ++++++++-
>>   drivers/accel/amdxdna/amdxdna_ctx.h           | 111 +++
>>   drivers/accel/amdxdna/amdxdna_gem.c           |  10 +
>>   drivers/accel/amdxdna/amdxdna_gem.h           |   1 +
>>   .../accel/amdxdna/amdxdna_mailbox_helper.c    |   5 +
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c       |   5 +
>>   drivers/accel/amdxdna/amdxdna_pci_drv.h       |   4 +
>>   drivers/accel/amdxdna/amdxdna_sysfs.c         |   5 +
>>   drivers/accel/amdxdna/npu1_regs.c             |   1 +
>>   drivers/accel/amdxdna/npu2_regs.c             |   1 +
>>   drivers/accel/amdxdna/npu4_regs.c             |   1 +
>>   drivers/accel/amdxdna/npu5_regs.c             |   1 +
>>   include/trace/events/amdxdna.h                |  41 ++
>>   include/uapi/drm/amdxdna_accel.h              |  38 +
>>   20 files changed, 1596 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
>> index 617fc05077d9..c3ac668e16ab 100644
>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>> @@ -8,8 +8,12 @@
>>   #include <drm/drm_gem.h>
>>   #include <drm/drm_gem_shmem_helper.h>
>>   #include <drm/drm_print.h>
>> +#include <drm/drm_syncobj.h>
>> +#include <linux/hmm.h>
>>   #include <linux/types.h>
>> +#include <trace/events/amdxdna.h>
>>   
>> +#include "aie2_msg_priv.h"
>>   #include "aie2_pci.h"
>>   #include "aie2_solver.h"
>>   #include "amdxdna_ctx.h"
>> @@ -17,6 +21,337 @@
>>   #include "amdxdna_mailbox.h"
>>   #include "amdxdna_pci_drv.h"
>>   
>> +bool force_cmdlist;
>> +module_param(force_cmdlist, bool, 0600);
>> +MODULE_PARM_DESC(force_cmdlist, "Force use command list (Default false)");
>> +
>> +#define HWCTX_MAX_TIMEOUT	60000 /* milliseconds */
>> +
>> +static struct amdxdna_sched_job *
>> +aie2_hwctx_get_job(struct amdxdna_hwctx *hwctx, u64 seq)
>> +{
>> +	int idx;
>> +
>> +	/* Special sequence number for oldest fence if exist */
>> +	if (seq == AMDXDNA_INVALID_CMD_HANDLE) {
>> +		idx = get_job_idx(hwctx->priv->seq);
>> +		goto out;
>> +	}
>> +
>> +	if (seq >= hwctx->priv->seq)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	if (seq + HWCTX_MAX_CMDS < hwctx->priv->seq)
>> +		return NULL;
>> +
>> +	idx = get_job_idx(seq);
>> +
>> +out:
>> +	return hwctx->priv->pending[idx];
>> +}
>> +
>> +/* The bad_job is used in aie2_sched_job_timedout, otherwise, set it to NULL */
>> +static void aie2_hwctx_stop(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hwctx,
>> +			    struct drm_sched_job *bad_job)
>> +{
>> +	drm_sched_stop(&hwctx->priv->sched, bad_job);
>> +	aie2_destroy_context(xdna->dev_handle, hwctx);
>> +}
>> +
>> +static int aie2_hwctx_restart(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hwctx)
>> +{
>> +	struct amdxdna_gem_obj *heap = hwctx->priv->heap;
>> +	int ret;
>> +
>> +	ret = aie2_create_context(xdna->dev_handle, hwctx);
>> +	if (ret) {
>> +		XDNA_ERR(xdna, "Create hwctx failed, ret %d", ret);
>> +		goto out;
>> +	}
>> +
>> +	ret = aie2_map_host_buf(xdna->dev_handle, hwctx->fw_ctx_id,
>> +				heap->mem.userptr, heap->mem.size);
>> +	if (ret) {
>> +		XDNA_ERR(xdna, "Map host buf failed, ret %d", ret);
>> +		goto out;
>> +	}
>> +
>> +	if (hwctx->status != HWCTX_STAT_READY) {
>> +		XDNA_DBG(xdna, "hwctx is not ready, status %d", hwctx->status);
>> +		goto out;
>> +	}
>> +
>> +	ret = aie2_config_cu(hwctx);
>> +	if (ret) {
>> +		XDNA_ERR(xdna, "Config cu failed, ret %d", ret);
>> +		goto out;
>> +	}
>> +
>> +out:
>> +	drm_sched_start(&hwctx->priv->sched);
>> +	XDNA_DBG(xdna, "%s restarted, ret %d", hwctx->name, ret);
>> +	return ret;
>> +}
>> +
>> +void aie2_stop_ctx_by_col_map(struct amdxdna_client *client, u32 col_map)
>> +{
>> +	struct amdxdna_dev *xdna = client->xdna;
>> +	struct amdxdna_hwctx *hwctx;
>> +	int next = 0;
>> +
>> +	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>> +	mutex_lock(&client->hwctx_lock);
>> +	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next) {
>> +		/* check if the HW context uses the error column */
>> +		if (!(col_map & amdxdna_hwctx_col_map(hwctx)))
>> +			continue;
>> +
>> +		aie2_hwctx_stop(xdna, hwctx, NULL);
>> +		hwctx->old_status = hwctx->status;
>> +		hwctx->status = HWCTX_STAT_STOP;
>> +		XDNA_DBG(xdna, "Stop %s", hwctx->name);
>> +	}
>> +	mutex_unlock(&client->hwctx_lock);
>> +}
>> +
>> +void aie2_restart_ctx(struct amdxdna_client *client)
>> +{
>> +	struct amdxdna_dev *xdna = client->xdna;
>> +	struct amdxdna_hwctx *hwctx;
>> +	int next = 0;
>> +
>> +	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>> +	mutex_lock(&client->hwctx_lock);
>> +	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next) {
>> +		if (hwctx->status != HWCTX_STAT_STOP)
>> +			continue;
>> +
>> +		hwctx->status = hwctx->old_status;
>> +		XDNA_DBG(xdna, "Resetting %s", hwctx->name);
>> +		aie2_hwctx_restart(xdna, hwctx);
>> +	}
>> +	mutex_unlock(&client->hwctx_lock);
>> +}
>> +
>> +static int aie2_hwctx_wait_for_idle(struct amdxdna_hwctx *hwctx)
>> +{
>> +	struct amdxdna_sched_job *job;
>> +
>> +	mutex_lock(&hwctx->priv->io_lock);
>> +	if (!hwctx->priv->seq) {
>> +		mutex_unlock(&hwctx->priv->io_lock);
>> +		return 0;
>> +	}
>> +
>> +	job = aie2_hwctx_get_job(hwctx, hwctx->priv->seq - 1);
>> +	if (IS_ERR_OR_NULL(job)) {
>> +		mutex_unlock(&hwctx->priv->io_lock);
>> +		XDNA_WARN(hwctx->client->xdna, "Corrupted pending list");
>> +		return 0;
>> +	}
>> +	mutex_unlock(&hwctx->priv->io_lock);
>> +
>> +	wait_event(hwctx->priv->job_free_wq, !job->fence);
>> +
>> +	return 0;
>> +}
>> +
>> +static void
>> +aie2_sched_notify(struct amdxdna_sched_job *job)
>> +{
>> +	struct dma_fence *fence = job->fence;
>> +
>> +	job->hwctx->priv->completed++;
>> +	dma_fence_signal(fence);
>> +	trace_xdna_job(&job->base, job->hwctx->name, "signaled fence", job->seq);
>> +	dma_fence_put(fence);
>> +	mmput(job->mm);
>> +	amdxdna_job_put(job);
>> +}
>> +
>> +static int
>> +aie2_sched_resp_handler(void *handle, const u32 *data, size_t size)
>> +{
>> +	struct amdxdna_sched_job *job = handle;
>> +	struct amdxdna_gem_obj *cmd_abo;
>> +	u32 ret = 0;
>> +	u32 status;
>> +
>> +	cmd_abo = job->cmd_bo;
>> +
>> +	if (unlikely(!data))
>> +		goto out;
>> +
>> +	if (unlikely(size != sizeof(u32))) {
>> +		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
>> +		ret = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	status = *data;
>> +	XDNA_DBG(job->hwctx->client->xdna, "Resp status 0x%x", status);
>> +	if (status == AIE2_STATUS_SUCCESS)
>> +		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_COMPLETED);
>> +	else
>> +		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ERROR);
>> +
>> +out:
>> +	aie2_sched_notify(job);
>> +	return ret;
>> +}
>> +
>> +static int
>> +aie2_sched_nocmd_resp_handler(void *handle, const u32 *data, size_t size)
>> +{
>> +	struct amdxdna_sched_job *job = handle;
>> +	u32 ret = 0;
>> +	u32 status;
>> +
>> +	if (unlikely(!data))
>> +		goto out;
>> +
>> +	if (unlikely(size != sizeof(u32))) {
>> +		ret = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	status = *data;
>> +	XDNA_DBG(job->hwctx->client->xdna, "Resp status 0x%x", status);
>> +
>> +out:
>> +	aie2_sched_notify(job);
>> +	return ret;
>> +}
>> +
>> +static int
>> +aie2_sched_cmdlist_resp_handler(void *handle, const u32 *data, size_t size)
>> +{
>> +	struct amdxdna_sched_job *job = handle;
>> +	struct amdxdna_gem_obj *cmd_abo;
>> +	struct cmd_chain_resp *resp;
>> +	struct amdxdna_dev *xdna;
>> +	u32 fail_cmd_status;
>> +	u32 fail_cmd_idx;
>> +	u32 ret = 0;
>> +
>> +	cmd_abo = job->cmd_bo;
>> +	if (unlikely(!data) || unlikely(size != sizeof(u32) * 3)) {
>> +		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
>> +		ret = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	resp = (struct cmd_chain_resp *)data;
>> +	xdna = job->hwctx->client->xdna;
>> +	XDNA_DBG(xdna, "Status 0x%x", resp->status);
>> +	if (resp->status == AIE2_STATUS_SUCCESS) {
>> +		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_COMPLETED);
>> +		goto out;
>> +	}
>> +
>> +	/* Slow path to handle error, read from ringbuf on BAR */
>> +	fail_cmd_idx = resp->fail_cmd_idx;
>> +	fail_cmd_status = resp->fail_cmd_status;
>> +	XDNA_DBG(xdna, "Failed cmd idx %d, status 0x%x",
>> +		 fail_cmd_idx, fail_cmd_status);
>> +
>> +	if (fail_cmd_status == AIE2_STATUS_SUCCESS) {
>> +		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
>> +		ret = -EINVAL;
>> +		goto out;
>> +	}
>> +	amdxdna_cmd_set_state(cmd_abo, fail_cmd_status);
>> +
>> +	if (amdxdna_cmd_get_op(cmd_abo) == ERT_CMD_CHAIN) {
>> +		struct amdxdna_cmd_chain *cc = amdxdna_cmd_get_payload(cmd_abo, NULL);
>> +
>> +		cc->error_index = fail_cmd_idx;
>> +		if (cc->error_index >= cc->command_count)
>> +			cc->error_index = 0;
>> +	}
>> +out:
>> +	aie2_sched_notify(job);
>> +	return ret;
>> +}
>> +
>> +static struct dma_fence *
>> +aie2_sched_job_run(struct drm_sched_job *sched_job)
>> +{
>> +	struct amdxdna_sched_job *job = drm_job_to_xdna_job(sched_job);
>> +	struct amdxdna_gem_obj *cmd_abo = job->cmd_bo;
>> +	struct amdxdna_hwctx *hwctx = job->hwctx;
>> +	struct dma_fence *fence;
>> +	int ret;
>> +
>> +	if (!mmget_not_zero(job->mm))
>> +		return ERR_PTR(-ESRCH);
>> +
>> +	kref_get(&job->refcnt);
>> +	fence = dma_fence_get(job->fence);
>> +
>> +	if (unlikely(!cmd_abo)) {
>> +		ret = aie2_sync_bo(hwctx, job, aie2_sched_nocmd_resp_handler);
>> +		goto out;
>> +	}
>> +
>> +	amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_NEW);
>> +
>> +	if (amdxdna_cmd_get_op(cmd_abo) == ERT_CMD_CHAIN)
>> +		ret = aie2_cmdlist_multi_execbuf(hwctx, job, aie2_sched_cmdlist_resp_handler);
>> +	else if (force_cmdlist)
>> +		ret = aie2_cmdlist_single_execbuf(hwctx, job, aie2_sched_cmdlist_resp_handler);
>> +	else
>> +		ret = aie2_execbuf(hwctx, job, aie2_sched_resp_handler);
>> +
>> +out:
>> +	if (ret) {
>> +		dma_fence_put(job->fence);
>> +		amdxdna_job_put(job);
>> +		mmput(job->mm);
>> +		fence = ERR_PTR(ret);
>> +	}
>> +	trace_xdna_job(sched_job, hwctx->name, "sent to device", job->seq);
>> +
>> +	return fence;
>> +}
>> +
>> +static void aie2_sched_job_free(struct drm_sched_job *sched_job)
>> +{
>> +	struct amdxdna_sched_job *job = drm_job_to_xdna_job(sched_job);
>> +	struct amdxdna_hwctx *hwctx = job->hwctx;
>> +
>> +	trace_xdna_job(sched_job, hwctx->name, "job free", job->seq);
>> +	drm_sched_job_cleanup(sched_job);
>> +	job->fence = NULL;
>> +	amdxdna_job_put(job);
>> +
>> +	wake_up(&hwctx->priv->job_free_wq);
>> +}
>> +
>> +static enum drm_gpu_sched_stat
>> +aie2_sched_job_timedout(struct drm_sched_job *sched_job)
>> +{
>> +	struct amdxdna_sched_job *job = drm_job_to_xdna_job(sched_job);
>> +	struct amdxdna_hwctx *hwctx = job->hwctx;
>> +	struct amdxdna_dev *xdna;
>> +
>> +	xdna = hwctx->client->xdna;
>> +	trace_xdna_job(sched_job, hwctx->name, "job timedout", job->seq);
>> +	mutex_lock(&xdna->dev_lock);
>> +	aie2_hwctx_stop(xdna, hwctx, sched_job);
>> +
>> +	aie2_hwctx_restart(xdna, hwctx);
>> +	mutex_unlock(&xdna->dev_lock);
>> +
>> +	return DRM_GPU_SCHED_STAT_NOMINAL;
>> +}
>> +
>> +const struct drm_sched_backend_ops sched_ops = {
>> +	.run_job = aie2_sched_job_run,
>> +	.free_job = aie2_sched_job_free,
>> +	.timedout_job = aie2_sched_job_timedout,
>> +};
>> +
>>   static int aie2_hwctx_col_list(struct amdxdna_hwctx *hwctx)
>>   {
>>   	struct amdxdna_dev *xdna = hwctx->client->xdna;
>> @@ -126,13 +461,66 @@ static void aie2_release_resource(struct amdxdna_hwctx *hwctx)
>>   		XDNA_ERR(xdna, "Release AIE resource failed, ret %d", ret);
>>   }
>>   
>> +static int aie2_ctx_syncobj_create(struct amdxdna_hwctx *hwctx)
>> +{
>> +	struct amdxdna_dev *xdna = hwctx->client->xdna;
>> +	struct drm_file *filp = hwctx->client->filp;
>> +	struct drm_syncobj *syncobj;
>> +	u32 hdl;
>> +	int ret;
>> +
>> +	hwctx->syncobj_hdl = AMDXDNA_INVALID_FENCE_HANDLE;
>> +
>> +	ret = drm_syncobj_create(&syncobj, DRM_SYNCOBJ_CREATE_SIGNALED, NULL);
>> +	if (ret) {
>> +		XDNA_ERR(xdna, "Create ctx syncobj failed, ret %d", ret);
>> +		return ret;
>> +	}
>> +	ret = drm_syncobj_get_handle(filp, syncobj, &hdl);
>> +	if (ret) {
>> +		drm_syncobj_put(syncobj);
>> +		XDNA_ERR(xdna, "Create ctx syncobj handle failed, ret %d", ret);
>> +		return ret;
>> +	}
>> +	hwctx->priv->syncobj = syncobj;
>> +	hwctx->syncobj_hdl = hdl;
>> +
>> +	return 0;
>> +}
>> +
>> +static void aie2_ctx_syncobj_destroy(struct amdxdna_hwctx *hwctx)
>> +{
>> +	/*
>> +	 * The syncobj_hdl is owned by user space and will be cleaned up
>> +	 * separately.
>> +	 */
>> +	drm_syncobj_put(hwctx->priv->syncobj);
>> +}
>> +
>> +static void aie2_ctx_syncobj_add_fence(struct amdxdna_hwctx *hwctx,
>> +				       struct dma_fence *ofence, u64 seq)
>> +{
>> +	struct drm_syncobj *syncobj = hwctx->priv->syncobj;
>> +	struct dma_fence_chain *chain;
>> +
>> +	if (!syncobj)
>> +		return;
>> +
>> +	chain = dma_fence_chain_alloc();
>> +	if (!chain)
>> +		return;
>> +
>> +	drm_syncobj_add_point(syncobj, chain, ofence, seq);
>> +}
>> +
>>   int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>>   {
>>   	struct amdxdna_client *client = hwctx->client;
>>   	struct amdxdna_dev *xdna = client->xdna;
>> +	struct drm_gpu_scheduler *sched;
>>   	struct amdxdna_hwctx_priv *priv;
>>   	struct amdxdna_gem_obj *heap;
>> -	int ret;
>> +	int i, ret;
>>   
>>   	priv = kzalloc(sizeof(*hwctx->priv), GFP_KERNEL);
>>   	if (!priv)
>> @@ -157,10 +545,48 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>>   		goto put_heap;
>>   	}
>>   
>> +	for (i = 0; i < ARRAY_SIZE(priv->cmd_buf); i++) {
>> +		struct amdxdna_gem_obj *abo;
>> +		struct amdxdna_drm_create_bo args = {
>> +			.flags = 0,
>> +			.type = AMDXDNA_BO_DEV,
>> +			.vaddr = 0,
>> +			.size = MAX_CHAIN_CMDBUF_SIZE,
>> +		};
>> +
>> +		abo = amdxdna_drm_alloc_dev_bo(&xdna->ddev, &args, client->filp, true);
>> +		if (IS_ERR(abo)) {
>> +			ret = PTR_ERR(abo);
>> +			goto free_cmd_bufs;
>> +		}
>> +
>> +		XDNA_DBG(xdna, "Command buf %d addr 0x%llx size 0x%lx",
>> +			 i, abo->mem.dev_addr, abo->mem.size);
>> +		priv->cmd_buf[i] = abo;
>> +	}
>> +
>> +	sched = &priv->sched;
>> +	mutex_init(&priv->io_lock);
>> +	ret = drm_sched_init(sched, &sched_ops, NULL, DRM_SCHED_PRIORITY_COUNT,
>> +			     HWCTX_MAX_CMDS, 0, msecs_to_jiffies(HWCTX_MAX_TIMEOUT),
>> +			     NULL, NULL, hwctx->name, xdna->ddev.dev);
>> +	if (ret) {
>> +		XDNA_ERR(xdna, "Failed to init DRM scheduler. ret %d", ret);
>> +		goto free_cmd_bufs;
>> +	}
>> +
>> +	ret = drm_sched_entity_init(&priv->entity, DRM_SCHED_PRIORITY_NORMAL,
>> +				    &sched, 1, NULL);
>> +	if (ret) {
>> +		XDNA_ERR(xdna, "Failed to initial sched entiry. ret %d", ret);
>> +		goto free_sched;
>> +	}
>> +	init_waitqueue_head(&priv->job_free_wq);
>> +
>>   	ret = aie2_hwctx_col_list(hwctx);
>>   	if (ret) {
>>   		XDNA_ERR(xdna, "Create col list failed, ret %d", ret);
>> -		goto unpin;
>> +		goto free_entity;
>>   	}
>>   
>>   	ret = aie2_alloc_resource(hwctx);
>> @@ -175,6 +601,13 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>>   		XDNA_ERR(xdna, "Map host buffer failed, ret %d", ret);
>>   		goto release_resource;
>>   	}
>> +
>> +	ret = aie2_ctx_syncobj_create(hwctx);
>> +	if (ret) {
>> +		XDNA_ERR(xdna, "Create syncobj failed, ret %d", ret);
>> +		goto release_resource;
>> +	}
>> +
>>   	hwctx->status = HWCTX_STAT_INIT;
>>   
>>   	XDNA_DBG(xdna, "hwctx %s init completed", hwctx->name);
>> @@ -185,7 +618,16 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>>   	aie2_release_resource(hwctx);
>>   free_col_list:
>>   	kfree(hwctx->col_list);
>> -unpin:
>> +free_entity:
>> +	drm_sched_entity_destroy(&priv->entity);
>> +free_sched:
>> +	drm_sched_fini(&priv->sched);
>> +free_cmd_bufs:
>> +	for (i = 0; i < ARRAY_SIZE(priv->cmd_buf); i++) {
>> +		if (!priv->cmd_buf[i])
>> +			continue;
>> +		drm_gem_object_put(to_gobj(priv->cmd_buf[i]));
>> +	}
>>   	amdxdna_gem_unpin(heap);
>>   put_heap:
>>   	drm_gem_object_put(to_gobj(heap));
>> @@ -196,11 +638,44 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>>   
>>   void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
>>   {
>> +	struct amdxdna_sched_job *job;
>> +	struct amdxdna_dev *xdna;
>> +	int idx;
>> +
>> +	xdna = hwctx->client->xdna;
>> +	aie2_ctx_syncobj_destroy(hwctx);
>> +	drm_sched_wqueue_stop(&hwctx->priv->sched);
>> +
>> +	/* Now, scheduler will not send command to device. */
>>   	aie2_release_resource(hwctx);
>>   
>> +	/*
>> +	 * All submitted commands are aborted.
>> +	 * Restart scheduler queues to cleanup jobs. The amdxdna_sched_job_run()
>> +	 * will return NODEV if it is called.
>> +	 */
>> +	drm_sched_wqueue_start(&hwctx->priv->sched);
>> +
>> +	aie2_hwctx_wait_for_idle(hwctx);
>> +	drm_sched_entity_destroy(&hwctx->priv->entity);
>> +	drm_sched_fini(&hwctx->priv->sched);
>> +
>> +	for (idx = 0; idx < HWCTX_MAX_CMDS; idx++) {
>> +		job = hwctx->priv->pending[idx];
>> +		if (!job)
>> +			continue;
>> +
>> +		dma_fence_put(job->out_fence);
>> +		amdxdna_job_put(job);
>> +	}
>> +	XDNA_DBG(xdna, "%s sequence number %lld", hwctx->name, hwctx->priv->seq);
>> +
>> +	for (idx = 0; idx < ARRAY_SIZE(hwctx->priv->cmd_buf); idx++)
>> +		drm_gem_object_put(to_gobj(hwctx->priv->cmd_buf[idx]));
>>   	amdxdna_gem_unpin(hwctx->priv->heap);
>>   	drm_gem_object_put(to_gobj(hwctx->priv->heap));
>>   
>> +	mutex_destroy(&hwctx->priv->io_lock);
>>   	kfree(hwctx->col_list);
>>   	kfree(hwctx->priv);
>>   	kfree(hwctx->cus);
>> @@ -267,3 +742,186 @@ int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *bu
>>   		return -EOPNOTSUPP;
>>   	}
>>   }
>> +
>> +static int aie2_populate_range(struct amdxdna_gem_obj *abo)
>> +{
>> +	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
>> +	struct mm_struct *mm = abo->mem.notifier.mm;
>> +	struct hmm_range range = { 0 };
>> +	unsigned long timeout;
>> +	int ret;
>> +
>> +	XDNA_INFO_ONCE(xdna, "populate memory range %llx size %lx",
>> +		       abo->mem.userptr, abo->mem.size);
>> +	range.notifier = &abo->mem.notifier;
>> +	range.start = abo->mem.userptr;
>> +	range.end = abo->mem.userptr + abo->mem.size;
>> +	range.hmm_pfns = abo->mem.pfns;
>> +	range.default_flags = HMM_PFN_REQ_FAULT;
>> +
>> +	if (!mmget_not_zero(mm))
>> +		return -EFAULT;
>> +
>> +	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>> +again:
>> +	range.notifier_seq = mmu_interval_read_begin(&abo->mem.notifier);
>> +	mmap_read_lock(mm);
>> +	ret = hmm_range_fault(&range);
>> +	mmap_read_unlock(mm);
>> +	if (ret) {
>> +		if (time_after(jiffies, timeout)) {
>> +			ret = -ETIME;
>> +			goto put_mm;
>> +		}
>> +
>> +		if (ret == -EBUSY)
>> +			goto again;
>> +
>> +		goto put_mm;
>> +	}
>> +
>> +	mutex_lock(&abo->mem.notify_lock);
>> +	if (mmu_interval_read_retry(&abo->mem.notifier, range.notifier_seq)) {
>> +		mutex_unlock(&abo->mem.notify_lock);
>> +		goto again;
>> +	}
>> +	abo->mem.map_invalid = false;
>> +	mutex_unlock(&abo->mem.notify_lock);
>> +
>> +put_mm:
>> +	mmput(mm);
>> +	return ret;
>> +}
>> +
>> +static int aie2_hwctx_push_job(struct amdxdna_sched_job *job, u64 *seq)
>> +{
>> +	struct amdxdna_hwctx *hwctx = job->hwctx;
>> +	struct amdxdna_sched_job *other;
>> +	struct dma_fence *fence;
>> +	long ret;
>> +	int idx;
>> +
>> +again:
>> +	mutex_lock(&hwctx->priv->io_lock);
>> +	idx = get_job_idx(hwctx->priv->seq);
>> +	/* When pending list full, hwctx->seq points to oldest fence */
>> +	other = hwctx->priv->pending[idx];
>> +	if (other && !dma_fence_is_signaled(other->out_fence)) {
>> +		fence = dma_fence_get(other->out_fence);
>> +		mutex_unlock(&hwctx->priv->io_lock);
>> +
>> +		ret = dma_fence_wait_timeout(fence, true, MAX_SCHEDULE_TIMEOUT);
>> +		dma_fence_put(fence);
>> +		if (!ret)
>> +			return -ETIME;
>> +		else if (ret < 0)
>> +			return ret;
>> +		goto again;
>> +	}
>> +
>> +	if (other) {
>> +		dma_fence_put(other->out_fence);
>> +		amdxdna_job_put(other);
>> +	}
>> +
>> +	hwctx->priv->pending[idx] = job;
>> +	job->seq = hwctx->priv->seq++;
>> +	*seq = job->seq;
>> +	kref_get(&job->refcnt);
>> +
>> +	fence = dma_fence_get(job->out_fence);
>> +	drm_sched_entity_push_job(&job->base);
>> +	mutex_unlock(&hwctx->priv->io_lock);
>> +
>> +	aie2_ctx_syncobj_add_fence(hwctx, fence, *seq);
>> +	dma_fence_put(fence);
>> +	return 0;
>> +}
>> +
>> +int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq)
>> +{
>> +	struct amdxdna_dev *xdna = hwctx->client->xdna;
>> +	struct ww_acquire_ctx acquire_ctx;
>> +	struct amdxdna_gem_obj *abo;
>> +	unsigned long timeout = 0;
>> +	int ret, i;
>> +
>> +	ret = drm_sched_job_init(&job->base, &hwctx->priv->entity, 1, hwctx);
>> +	if (ret) {
>> +		XDNA_ERR(xdna, "DRM job init failed, ret %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	drm_sched_job_arm(&job->base);
> Again drive by comments.
>
> This looks wildly dangerous. This typically should be called once
> holding all locks at the point in which you cannot fail. I get that
> you signal the jobs fence on failure but that doesn't seem like a great
> idea nor do I think how the schedule is designed.
>
> The flow typically is:
>
> acquire all locks and setup job...
> arm
> install fences
> push
>
> ^^^ With not being able to to fail between arn & push.
>
> Your flow is...
>
> arm
> acquire locks...
> install fences
> drop locks...
> acquire different locks...
> push
> drops different locks...
>
> Seems dangerous, I would reconsider.

Ok, I worked on this and will send out v7 patches to follow the 
suggested flow.


Thanks,

Lizhi


