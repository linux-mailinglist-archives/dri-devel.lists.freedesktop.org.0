Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94599B352DB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 06:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C12288C3D;
	Tue, 26 Aug 2025 04:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="24jTJE6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DE710E2C7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 04:48:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDgeDy89SnLfVdm2hIsSPct/eMNwgbVEr954Fjtz8miIimR3Kvlt7lOog64TjhHkl2skV2XFOmG0TGE4vD2owbRmEPgIbJnLLrn2AXrPnwxYJGDdGCSDgGZSLVhY8g5IMEXIJ65mbcnBJHrGqtFqtDnzccDJR5gGD4H7hH3XSx5kTqpG4QR40krEGwqwjDXhEk+W6ccXEdnQuYqjRuUs26h7vjarkqJkw0KhEtIiTOBfBGe9817hbdFF+AdAAXmLf8mZ1PhlN5vJRKLa9Vdz3xA7t409zXCr6L6C29fVk+NeWoDgrxLKXFNLsaNvDCLOhWK2OIlkN40UXA5flqIDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivgdCpr8gACzqKIIlrbG7x8Mj119nw10kmcHcy5BIXM=;
 b=Yodx13M6O68o2mmJ37GJ5gg+lUP4+ersYveAFR4hMCDyXbag5kvoW51qJk/iWVvQnURvfxytQ6cPihNuaUJ1wuo/tNUiTWQS/7JMJgeuV/gBPfw1R/lGx5S0uTXIcfdxXwO6An+UGjbwYx/BMLQPT1Q+iao5pfsGWc2nHcwV51sqJ+8ZCkwIdj1hyWjqFrsfjKQXU1gyEqWbz/qVcMCsAjAlo0fjOdKomyF443P8hsFJsl5gSMxtO18w39AT9rSlVd7e9gMJ6sWsKFWHmHxY+cgVmGKgXIvC4ZZ8hwXO65VqTQK/S5Q3o8534O1LpsyRScy2fWDZ4H8Pwsc91FfFnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivgdCpr8gACzqKIIlrbG7x8Mj119nw10kmcHcy5BIXM=;
 b=24jTJE6xBnIOZHR/UfdTzaWcv5mBFgybZ97nuX8sUB/p5nhedoqzBgPgzrRfWzPGw67MMzoce+jAjscs3kJ8ahVaN4zvrn3aUWwDJrflwEqBTAvRigDLmJS8qO7ENEL7W8IavnVGq76FNsmFMi3LHDkbRSd0Upkuy802EK5RicA=
Received: from BY3PR04CA0003.namprd04.prod.outlook.com (2603:10b6:a03:217::8)
 by BN7PPF08EEA05B5.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6c5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 04:48:30 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::3d) by BY3PR04CA0003.outlook.office365.com
 (2603:10b6:a03:217::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Tue,
 26 Aug 2025 04:48:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 04:48:29 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 23:48:29 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 25 Aug
 2025 21:48:29 -0700
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Aug 2025 23:48:28 -0500
Message-ID: <d6a02baa-3b05-73e6-9c2a-66c257efecc3@amd.com>
Date: Mon, 25 Aug 2025 21:48:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20250822172319.377848-1-lizhi.hou@amd.com>
 <2bec1429-4f8c-472c-99a1-420a33a3d316@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <2bec1429-4f8c-472c-99a1-420a33a3d316@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|BN7PPF08EEA05B5:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e28a97b-7e72-4666-59db-08dde45bcd8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sk9yenZISXBrbGQxTnhWMEQ4NGdidkFhdHhuMitpdHA2SVZwNTRkbTVmQTZx?=
 =?utf-8?B?RjJsTlZsM0ZNYS9Dc3I2YlhoZnRGMnFnMEVaVVpYOEpWdzUwbXhsTTRhbzZ6?=
 =?utf-8?B?L3dBUzRycUl1SUxmZk5kazlmaFVtWDAxUitCWlJLTVB5UCtWZUdPckhuNEpy?=
 =?utf-8?B?RTl5R0QycFVTcVZWdk5SVzdJVTZYelRLT0ZkR1FJWDIwWXgzdGQrOHh4Q2Jt?=
 =?utf-8?B?WDJNMUovRU9kM2VENTRabWZYQzZLaDVvYnZmcWdNTnJjMWRrekJLclh5b2xh?=
 =?utf-8?B?d2xCNU96NGxOdDlISVZ4VHREWXM0cmFZdFZoS2RiT25rcU0xUDU5U3VtTHV1?=
 =?utf-8?B?M1hCQUdqS3lCRis4WjhwMGEyTlp0NHpoaVZZODJxNmRnR1RyUVhPOEgrdmFO?=
 =?utf-8?B?WlNSTkNqSG5DdWhKRHZvaUczVWVLQmlERml6Uk52aW9SZUpicWVtMmsvbDg4?=
 =?utf-8?B?SkFuK2pyOUpLOGxhZ21reGE2eUNuYmViNEl1dE9wbEVZelRWWmR1ckhhWXhT?=
 =?utf-8?B?TUlzck1lR0lWTFB0NG5wUnlOODVsalgyRXdXUEtUMkp5bkY1RHdiS0Jxc0Nu?=
 =?utf-8?B?QjN1OVVDSnNJUnZoQVZPNk15WGU4Vmd1MXJaa2JKQkFhZ2tpcmVHNlBoV1VL?=
 =?utf-8?B?L2g0OThaQUdjSlEyd1c3SXRDR2NLR3VTUzZvcko4bUlWUjhINmcwYURxY0xj?=
 =?utf-8?B?MDk3MU4wZXZrMUhQa0ErMWZBcExPMi9nQks5MWtqZW9sSkx4R0thOE5qUUVR?=
 =?utf-8?B?cTdlcS92Y2F1MU9JcGNkemFkUnNqdnVXWC80MDNtUkdETTJFRDdkazZmTEFH?=
 =?utf-8?B?T3RITG9YeW9xUnNuaDBpejFmUmpWUGxIMVV4Vjg4L0ZpS1ZUUXdYdVRaM2No?=
 =?utf-8?B?VTQrVmFnelNsb29pM0F1TGRJaE1ZMHBGRW83Z05FV3pBMGJnZjFscXA1NXgw?=
 =?utf-8?B?bXk3Vm5hNGkwblBZMVZJM2hjYzNnc2tIRzl5eTVGSWhqRHRDWDBmaEU4d0ph?=
 =?utf-8?B?R1QrUUE2RUhIbjFHaGQwaThtZlFDZ3FEbWlzV1BTR016blBwNTlFcnQ4SXpS?=
 =?utf-8?B?WlRJcDJQbnErV3RxVzZCeXRzSXZOMmZwS2hickFZK2ZWcHRWVk9wT0lubEZV?=
 =?utf-8?B?Q1g5ekpTWHFsTDErUFJQdWtSYWlJWWsrbkRqajlMeHEzaGpzdDRYcjFJN3dX?=
 =?utf-8?B?NlRXdWZDZ1JOczQvOXhuT3N5S0dFcG40NDhvcjJYR1ZkZGJUWkxNVnlOanpt?=
 =?utf-8?B?MmxuSW43TXJBVXFnWkx4YXN2V2VnVXBsT3FKbVlSWkQrc2JPalorYVNQRWFj?=
 =?utf-8?B?blhjUHozcE45OUZBLzQvaDRkR3RXR3lBV2J1VDJlM2NkWlBTL1ZxbWNBZDFU?=
 =?utf-8?B?T2VTOE1NbVExakVlVVlUekpPa29aVkplWHh3MDd3dVdZQm16MjR1L29XQng1?=
 =?utf-8?B?K25LeWtHYnR3SHpsOE45RWw2V085ZXltS004a1dWdU9DWHBhV3RRcU91VVBn?=
 =?utf-8?B?ZWZEUVNZKzdUOWV3M0NJcytYZElaaWZIMXdwZ1BvMGVwYUhnSHRxOHpSaEZw?=
 =?utf-8?B?QStpcXh6R3hHK1JUM1VFNGR6d2tRTUd5UjcxTW1QRGhXV1V1aXlncHRGLzNp?=
 =?utf-8?B?UXZGS1o0NlRMLzllYjd2ZkVSbjljb0prOEhrakM4MHRWelUrdndyWjYzZmht?=
 =?utf-8?B?YW94L0dpUVYyb1FocTVOOTNtdXZMSEtZWjNWRkd4bXptOFZCL1pBVkJXa0Fn?=
 =?utf-8?B?Mm5yVGlGMjhvM1pZRGt6NWY0MXBEVDBKY1ZJRzkxdkF2czZYT0srVDhJZllG?=
 =?utf-8?B?aWxydnVWV01yaUVYVGlVUjRuanQyWm1VcVdKUHNqQmJGTDhVUWJhOFlFNUF1?=
 =?utf-8?B?dXpPcTRxbjJVTkg5c0UvMHhWWUlIdndiM29VWndyUkQ1Ris4cFBsUDBWU3Fs?=
 =?utf-8?B?VldFaVBEYy9Qdm8wNXRtdnl0aUpFdE5NMElTcUNhaEhkM3hNS1NHbGRaZ1E5?=
 =?utf-8?B?N2h5VzZQc3VEa2pXZlBnS1dlSDNldklrUm12R2RGTm5pRVFOeGx3eTNDRnVI?=
 =?utf-8?Q?GmnyoP?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:48:29.6749 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e28a97b-7e72-4666-59db-08dde45bcd8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF08EEA05B5
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


On 8/25/25 14:28, Mario Limonciello wrote:
> On 8/22/2025 12:23 PM, Lizhi Hou wrote:
>> Add interface for applications to get information array. The application
>> provides a buffer pointer along with information type, maximum number of
>> entries and maximum size of each entry. The buffer may also contain 
>> match
>> conditions based on the information type. After the ioctl completes, the
>> actual number of entries and entry size are returned.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>
> How does userspace discover whether or not the new IOCTL call is 
> supported?  Just a test call?
The kernel header version will be used to determine whether the 
application which uses new IOCTL will be compiled or not.

Thanks,

Lizhi

>
>> ---
>>   drivers/accel/amdxdna/aie2_pci.c        | 114 ++++++++++++++++++------
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  21 +++++
>>   drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
>>   include/uapi/drm/amdxdna_accel.h        | 109 ++++++++++++++++++++++
>>   4 files changed, 220 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index 16ac0cab4f44..b8bfc0700798 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -785,10 +785,11 @@ static int aie2_get_clock_metadata(struct 
>> amdxdna_client *client,
>>     static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void 
>> *arg)
>>   {
>> -    struct amdxdna_drm_query_hwctx __user *buf, *tmp __free(kfree) = 
>> NULL;
>> -    struct amdxdna_drm_get_info *get_info_args = arg;
>> +    struct amdxdna_drm_hwctx_entry __user *buf, *tmp __free(kfree) = 
>> NULL;
>> +    struct amdxdna_drm_get_array *array_args = arg;
>> +    u32 size;
>>   -    if (get_info_args->buffer_size < sizeof(*tmp))
>> +    if (!array_args->num_element)
>>           return -EINVAL;
>>         tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
>> @@ -801,14 +802,23 @@ static int aie2_hwctx_status_cb(struct 
>> amdxdna_hwctx *hwctx, void *arg)
>>       tmp->num_col = hwctx->num_col;
>>       tmp->command_submissions = hwctx->priv->seq;
>>       tmp->command_completions = hwctx->priv->completed;
>> -
>> -    buf = u64_to_user_ptr(get_info_args->buffer);
>> -
>> -    if (copy_to_user(buf, tmp, sizeof(*tmp)))
>> +    tmp->pasid = hwctx->client->pasid;
>> +    tmp->priority = hwctx->qos.priority;
>> +    tmp->gops = hwctx->qos.gops;
>> +    tmp->fps = hwctx->qos.fps;
>> +    tmp->dma_bandwidth = hwctx->qos.dma_bandwidth;
>> +    tmp->latency = hwctx->qos.latency;
>> +    tmp->frame_exec_time = hwctx->qos.frame_exec_time;
>> +    tmp->state = AMDXDNA_HWCTX_STATE_ACTIVE;
>> +
>> +    buf = u64_to_user_ptr(array_args->buffer);
>> +    size = min(sizeof(*tmp), array_args->element_size);
>> +
>> +    if (copy_to_user(buf, tmp, size))
>>           return -EFAULT;
>>   -    get_info_args->buffer += sizeof(*tmp);
>> -    get_info_args->buffer_size -= sizeof(*tmp);
>> +    array_args->buffer += size;
>> +    array_args->num_element--;
>>         return 0;
>>   }
>> @@ -816,23 +826,24 @@ static int aie2_hwctx_status_cb(struct 
>> amdxdna_hwctx *hwctx, void *arg)
>>   static int aie2_get_hwctx_status(struct amdxdna_client *client,
>>                    struct amdxdna_drm_get_info *args)
>>   {
>> +    struct amdxdna_drm_get_array array_args;
>>       struct amdxdna_dev *xdna = client->xdna;
>> -    struct amdxdna_drm_get_info info_args;
>>       struct amdxdna_client *tmp_client;
>>       int ret;
>>         drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>>   -    info_args.buffer = args->buffer;
>> -    info_args.buffer_size = args->buffer_size;
>> -
>> +    array_args.element_size = sizeof(struct amdxdna_drm_query_hwctx);
>> +    array_args.buffer = args->buffer;
>> +    array_args.num_element = args->buffer_size / 
>> array_args.element_size;
>>       list_for_each_entry(tmp_client, &xdna->client_list, node) {
>> -        ret = amdxdna_hwctx_walk(tmp_client, &info_args, 
>> aie2_hwctx_status_cb);
>> +        ret = amdxdna_hwctx_walk(tmp_client, &array_args,
>> +                     aie2_hwctx_status_cb);
>>           if (ret)
>>               break;
>>       }
>>   -    args->buffer_size = (u32)(info_args.buffer - args->buffer);
>> +    args->buffer_size -= (u32)(array_args.buffer - args->buffer);
>>       return ret;
>>   }
>>   @@ -876,6 +887,58 @@ static int aie2_get_info(struct amdxdna_client 
>> *client, struct amdxdna_drm_get_i
>>       return ret;
>>   }
>>   +static int aie2_query_ctx_status_array(struct amdxdna_client *client,
>> +                       struct amdxdna_drm_get_array *args)
>> +{
>> +    struct amdxdna_drm_get_array array_args;
>> +    struct amdxdna_dev *xdna = client->xdna;
>> +    struct amdxdna_client *tmp_client;
>> +    int ret;
>> +
>> +    drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>> +
>> +    array_args.element_size = min(args->element_size,
>> +                      sizeof(struct amdxdna_drm_hwctx_entry));
>> +    array_args.buffer = args->buffer;
>> +    array_args.num_element = args->num_element * args->element_size /
>> +                array_args.element_size;
>> +    list_for_each_entry(tmp_client, &xdna->client_list, node) {
>> +        ret = amdxdna_hwctx_walk(tmp_client, &array_args,
>> +                     aie2_hwctx_status_cb);
>> +        if (ret)
>> +            break;
>> +    }
>> +
>> +    args->element_size = array_args.element_size;
>> +    args->num_element = (u32)((array_args.buffer - args->buffer) /
>> +                  args->element_size);
>> +
>> +    return ret;
>> +}
>> +
>> +static int aie2_get_array(struct amdxdna_client *client,
>> +              struct amdxdna_drm_get_array *args)
>> +{
>> +    struct amdxdna_dev *xdna = client->xdna;
>> +    int ret, idx;
>> +
>> +    if (!drm_dev_enter(&xdna->ddev, &idx))
>> +        return -ENODEV;
>> +
>> +    switch (args->param) {
>> +    case DRM_AMDXDNA_HW_CONTEXT_ALL:
>> +        ret = aie2_query_ctx_status_array(client, args);
>> +        break;
>> +    default:
>> +        XDNA_ERR(xdna, "Not supported request parameter %u", 
>> args->param);
>> +        ret = -EOPNOTSUPP;
>> +    }
>> +    XDNA_DBG(xdna, "Got param %d", args->param);
>> +
>> +    drm_dev_exit(idx);
>> +    return ret;
>> +}
>> +
>>   static int aie2_set_power_mode(struct amdxdna_client *client,
>>                      struct amdxdna_drm_set_state *args)
>>   {
>> @@ -925,15 +988,16 @@ static int aie2_set_state(struct amdxdna_client 
>> *client,
>>   }
>>     const struct amdxdna_dev_ops aie2_ops = {
>> -    .init           = aie2_init,
>> -    .fini           = aie2_fini,
>> -    .resume         = aie2_hw_resume,
>> -    .suspend        = aie2_hw_suspend,
>> -    .get_aie_info   = aie2_get_info,
>> -    .set_aie_state    = aie2_set_state,
>> -    .hwctx_init     = aie2_hwctx_init,
>> -    .hwctx_fini     = aie2_hwctx_fini,
>> -    .hwctx_config   = aie2_hwctx_config,
>> -    .cmd_submit     = aie2_cmd_submit,
>> +    .init = aie2_init,
>> +    .fini = aie2_fini,
>> +    .resume = aie2_hw_resume,
>> +    .suspend = aie2_hw_suspend,
>> +    .get_aie_info = aie2_get_info,
>> +    .set_aie_state = aie2_set_state,
>> +    .hwctx_init = aie2_hwctx_init,
>> +    .hwctx_fini = aie2_hwctx_fini,
>> +    .hwctx_config = aie2_hwctx_config,
>> +    .cmd_submit = aie2_cmd_submit,
>>       .hmm_invalidate = aie2_hmm_invalidate,
>> +    .get_array = aie2_get_array,
>>   };
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> index 8ef5e4f27f5e..ee89485299bc 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -164,6 +164,26 @@ static int amdxdna_drm_get_info_ioctl(struct 
>> drm_device *dev, void *data, struct
>>       return ret;
>>   }
>>   +static int amdxdna_drm_get_array_ioctl(struct drm_device *dev, 
>> void *data,
>> +                       struct drm_file *filp)
>> +{
>> +    struct amdxdna_client *client = filp->driver_priv;
>> +    struct amdxdna_dev *xdna = to_xdna_dev(dev);
>> +    struct amdxdna_drm_get_array *args = data;
>> +    int ret;
>> +
>> +    if (!xdna->dev_info->ops->get_array)
>> +        return -EOPNOTSUPP;
>> +
>> +    if (args->pad || !args->num_element)
>> +        return -EINVAL;
>> +
>> +    mutex_lock(&xdna->dev_lock);
>> +    ret = xdna->dev_info->ops->get_array(client, args);
>> +    mutex_unlock(&xdna->dev_lock);
>> +    return ret;
>> +}
>> +
>>   static int amdxdna_drm_set_state_ioctl(struct drm_device *dev, void 
>> *data, struct drm_file *filp)
>>   {
>>       struct amdxdna_client *client = filp->driver_priv;
>> @@ -195,6 +215,7 @@ static const struct drm_ioctl_desc 
>> amdxdna_drm_ioctls[] = {
>>       DRM_IOCTL_DEF_DRV(AMDXDNA_EXEC_CMD, 
>> amdxdna_drm_submit_cmd_ioctl, 0),
>>       /* AIE hardware */
>>       DRM_IOCTL_DEF_DRV(AMDXDNA_GET_INFO, amdxdna_drm_get_info_ioctl, 
>> 0),
>> +    DRM_IOCTL_DEF_DRV(AMDXDNA_GET_ARRAY, 
>> amdxdna_drm_get_array_ioctl, 0),
>>       DRM_IOCTL_DEF_DRV(AMDXDNA_SET_STATE, 
>> amdxdna_drm_set_state_ioctl, DRM_ROOT_ONLY),
>>   };
>>   diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> index b6b3b424d1d5..72d6696d49da 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> @@ -58,6 +58,7 @@ struct amdxdna_dev_ops {
>>       int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct 
>> amdxdna_sched_job *job, u64 *seq);
>>       int (*get_aie_info)(struct amdxdna_client *client, struct 
>> amdxdna_drm_get_info *args);
>>       int (*set_aie_state)(struct amdxdna_client *client, struct 
>> amdxdna_drm_set_state *args);
>> +    int (*get_array)(struct amdxdna_client *client, struct 
>> amdxdna_drm_get_array *args);
>>   };
>>     /*
>> diff --git a/include/uapi/drm/amdxdna_accel.h 
>> b/include/uapi/drm/amdxdna_accel.h
>> index ce523e9ccc52..e19e4cd04ffa 100644
>> --- a/include/uapi/drm/amdxdna_accel.h
>> +++ b/include/uapi/drm/amdxdna_accel.h
>> @@ -34,6 +34,7 @@ enum amdxdna_drm_ioctl_id {
>>       DRM_AMDXDNA_EXEC_CMD,
>>       DRM_AMDXDNA_GET_INFO,
>>       DRM_AMDXDNA_SET_STATE,
>> +    DRM_AMDXDNA_GET_ARRAY = 10,
>>   };
>>     /**
>> @@ -455,6 +456,110 @@ struct amdxdna_drm_get_info {
>>       __u64 buffer; /* in/out */
>>   };
>>   +#define AMDXDNA_HWCTX_STATE_IDLE    0
>> +#define AMDXDNA_HWCTX_STATE_ACTIVE    1
>> +
>> +/**
>> + * struct amdxdna_drm_hwctx_entry - The hardware context array entry
>> + */
>> +struct amdxdna_drm_hwctx_entry {
>> +    /** @context_id: Context ID. */
>> +    __u32 context_id;
>> +    /** @start_col: Start AIE array column assigned to context. */
>> +    __u32 start_col;
>> +    /** @num_col: Number of AIE array columns assigned to context. */
>> +    __u32 num_col;
>> +    /** @hwctx_id: The real hardware context id. */
>> +    __u32 hwctx_id;
>> +    /** @pid: ID of process which created this context. */
>> +    __s64 pid;
>> +    /** @command_submissions: Number of commands submitted. */
>> +    __u64 command_submissions;
>> +    /** @command_completions: Number of commands completed. */
>> +    __u64 command_completions;
>> +    /** @migrations: Number of times been migrated. */
>> +    __u64 migrations;
>> +    /** @preemptions: Number of times been preempted. */
>> +    __u64 preemptions;
>> +    /** @errors: Number of errors happened. */
>> +    __u64 errors;
>> +    /** @priority: Context priority. */
>> +    __u64 priority;
>> +    /** @heap_usage: Usage of device heap buffer. */
>> +    __u64 heap_usage;
>> +    /** @suspensions: Number of times been suspended. */
>> +    __u64 suspensions;
>> +    /**
>> +     * @state: Context state.
>> +     * %AMDXDNA_HWCTX_STATE_IDLE
>> +     * %AMDXDNA_HWCTX_STATE_ACTIVE
>> +     */
>> +    __u32 state;
>> +    /** @pasid: PASID been bound. */
>> +    __u32 pasid;
>> +    /** @gops: Giga operations per second. */
>> +    __u32 gops;
>> +    /** @fps: Frames per second. */
>> +    __u32 fps;
>> +    /** @dma_bandwidth: DMA bandwidth. */
>> +    __u32 dma_bandwidth;
>> +    /** @latency: Frame response latency. */
>> +    __u32 latency;
>> +    /** @frame_exec_time: Frame execution time. */
>> +    __u32 frame_exec_time;
>> +    /** @txn_op_idx: Index of last control code executed. */
>> +    __u32 txn_op_idx;
>> +    /** @ctx_pc: Program counter. */
>> +    __u32 ctx_pc;
>> +    /** @fatal_error_type: Fatal error type if context crashes. */
>> +    __u32 fatal_error_type;
>> +    /** @fatal_error_exception_type: Firmware exception type. */
>> +    __u32 fatal_error_exception_type;
>> +    /** @fatal_error_exception_pc: Firmware exception program 
>> counter. */
>> +    __u32 fatal_error_exception_pc;
>> +    /** @fatal_error_app_module: Exception module name. */
>> +    __u32 fatal_error_app_module;
>> +};
>> +
>> +#define DRM_AMDXDNA_HW_CONTEXT_ALL    0
>> +
>> +/**
>> + * struct amdxdna_drm_get_array - Get information array.
>> + */
>> +struct amdxdna_drm_get_array {
>> +    /**
>> +     * @param:
>> +     *
>> +     * Supported params:
>> +     *
>> +     * %DRM_AMDXDNA_HW_CONTEXT_ALL:
>> +     * Returns all created hardware contexts.
>> +     */
>> +    __u32 param;
>> +    /**
>> +     * @element_size:
>> +     *
>> +     * Specifies maximum element size and returns the actual element 
>> size.
>> +     */
>> +    __u32 element_size;
>> +    /**
>> +     * @num_element:
>> +     *
>> +     * Specifies maximum number of elements and returns the actual 
>> number
>> +     * of elements.
>> +     */
>> +    __u32 num_element; /* in/out */
>> +    /** @pad: MBZ */
>> +    __u32 pad;
>> +    /**
>> +     * @buffer:
>> +     *
>> +     * Specifies the match conditions and returns the matched 
>> information
>> +     * array.
>> +     */
>> +    __u64 buffer;
>> +};
>> +
>>   enum amdxdna_drm_set_param {
>>       DRM_AMDXDNA_SET_POWER_MODE,
>>       DRM_AMDXDNA_WRITE_AIE_MEM,
>> @@ -519,6 +624,10 @@ struct amdxdna_drm_set_power_mode {
>>       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_SET_STATE, \
>>            struct amdxdna_drm_set_state)
>>   +#define DRM_IOCTL_AMDXDNA_GET_ARRAY \
>> +    DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_GET_ARRAY, \
>> +         struct amdxdna_drm_get_array)
>> +
>>   #if defined(__cplusplus)
>>   } /* extern c end */
>>   #endif
>
