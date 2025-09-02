Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9AEB40E37
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 21:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3603310E83C;
	Tue,  2 Sep 2025 19:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zm8nOdQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2055.outbound.protection.outlook.com [40.107.101.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CBF10E833
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 19:59:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJWWNbTWPFNI+/yIZiL32j/hWpImJXInVPo+zIYuzkZEozGanYnPznhpz5OTBSrgFGaIBxYRhnzCQXxVXh3kSTK1JwRxMNXDLOr/Pqm+DMC/5LyrrpgPAyMPp/nk9n3UjsJ/f3JVEHc7QuaS3fFcmHPRxXCysiQG6lW/ALkzN2es1duR1UopjyNt3z2V1w+tovnyW8JvsSVEQ/LtGClqrh1Aaabw4T0zzTx7YOdg1TS0oR5PuMRh5fVN/q1iFYWjrbAKPD6uAEV1nAQwbc8ANK9baTV/2atiywtxLQx3ifcIfkc/uOyZZ4yDNfi85UTeMh3fKjTdAw3/SWrgqJkuRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtMhYna/5sf/ma/9eSbcqerOQEzLQjcrleOzanHphB0=;
 b=jK9Zf9HRDeUiNn+c+MEawdFFoOtMYZdWCDXI8vNpTZ/NjhgH4fZml53I143ckeD4DKGjsNxDbPTDpp4ZCuzpXoxyCBwIfnalXgrj70A57RaGodO8KhfqP8vabuY6hdhyld2OniSXqD6TJMBW//Z6LqdYb6E8R0vbd9VJqR7rKOIwxjpfGk2iGJt86gMFkOCERmz0A7/C5D9w+FEmZXHyZFzzyQWTa7I8HVdLN77q/R4UX+t3ldZECfWP27vbXhUaqtRieGo62dPWjZLeHWapZxLSWHHzDHXcyicOI0/+5x++o0ErRYvYem+bMAortPDggnh67rwt+uNtLPFSd2szYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtMhYna/5sf/ma/9eSbcqerOQEzLQjcrleOzanHphB0=;
 b=zm8nOdQ1Nr8qrrscLl/qq5CTKQ9Y0utACRxKGoRFnodWUxhgaijFn4PYxcDN6EBgiHgZVx2iWrpplTHYhgrvT2+nRMsTlDpvN9KIEq1pVQ+RHwPjqYXN5KSi3zJwHs3+RaNkBKJrYaBSzjukEwVL44uwOC9LYhfy8X/hKpYZXXQ=
Received: from SA1P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::21)
 by BN7PPFA8145BD40.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6de) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 2 Sep
 2025 19:58:56 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:22c::4) by SA1P222CA0020.outlook.office365.com
 (2603:10b6:806:22c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Tue,
 2 Sep 2025 19:58:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 19:58:56 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 14:58:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 2 Sep
 2025 12:58:54 -0700
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Sep 2025 14:58:54 -0500
Message-ID: <1f4a1d11-e187-a73f-d876-f72a7f799eed@amd.com>
Date: Tue, 2 Sep 2025 12:58:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
CC: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>, <maciej.falkowski@linux.intel.com>
References: <20250902175034.2056708-1-lizhi.hou@amd.com>
 <CADnq5_MvdU0v7uF8hvA=kkopGAEA=M4DDw8wAGSQMnihfSnKRw@mail.gmail.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <CADnq5_MvdU0v7uF8hvA=kkopGAEA=M4DDw8wAGSQMnihfSnKRw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|BN7PPFA8145BD40:EE_
X-MS-Office365-Filtering-Correlation-Id: c191c9aa-7526-440e-dfd3-08ddea5b264c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1hmNDN2aVZCSnI5c1FtUnRZb2VzNVM3MnM1dWtSa1dlR3ZrckJFVVZZU2Ex?=
 =?utf-8?B?RzJwcUlkVDMzZ0RmNjdGMUpQSlFDaXl2T0REMGVnVmpWSnVVNnFCTDRsbDd2?=
 =?utf-8?B?b25XZnNXcnFmU0JId2xrV21jUEh5OHZ0TWIyaUhGU2hoOG40Nks3QTQ1M254?=
 =?utf-8?B?U2tTSjB0b2JXKzc2bnNBUmxrcVhpeTBVZU5KRVlrS09aWmVzWEZtQmJzdWZB?=
 =?utf-8?B?eitGOWRPM0hnRjJ0Rm9SZFExZFcrZG9NSmJsSThiaGNHTXlLci9MWjc4SzlM?=
 =?utf-8?B?OUdhbmVCTUxIaUJudDJmalRtWXZNRGlNdTZZc1dwcFZOallzN2M5Uld0RTN0?=
 =?utf-8?B?Sk1idVNtR25wNDR1T240Nm1JQU5pZFhBaHhqSU11ZWRKbWNwREV4Y3pHSHBE?=
 =?utf-8?B?YkZid0tmbitkbzU4SjdFODhZaWJ1cXZNdWVhR0llQWhGcHdOMDI4bW1DN2ho?=
 =?utf-8?B?bmc1VWMweHNsajdTeUdFbUdjUmtHcHF0SEZvenBwNVFMbkI0MUNqcDVvdmh1?=
 =?utf-8?B?Sm1aU3oxT3ZHVkhHU1pmMmpyUDFnRW1mWTBWbm0yQnVHVVV6Skt6NlEwaGFq?=
 =?utf-8?B?MHBLZG9tS29BSlQ3UFBkLzVTdzZKZlBzN2FEeHRHbVBiaWZVS05WbndQTm9M?=
 =?utf-8?B?aVRsZzRsaExucmVMNTdiSGJuNGg4UjViRWkrZ2VtdmhLSkJIWExWVTFPWjVF?=
 =?utf-8?B?QkFHQmlUSG5pZEV2T1VjR2kySDFwOXd0RUFvaDhOYkhPOUs2cG5yWTBLbU1U?=
 =?utf-8?B?TmIweFZ3UnRZMTdYYkhVbU9QMXAwOWV1b3RvcWE4YitGcFd0eUFYTTdLa2g0?=
 =?utf-8?B?OFV6SkZQRjVtTDUyenVDcmxISk5JSFlWRHppbTZWeUIyWllGLzdiQTkwNmhG?=
 =?utf-8?B?bHYrTENlWmpNa2dLck9GQS90dmxwQ1libDdXeS9LY0FjcFpId0ZvMWc5T3Zi?=
 =?utf-8?B?RVV6MzBRdXVvRW5CRXJtdzQweTF2TXoxWGxSY0JxbzQwYjZZTHQwZG1tV3Fu?=
 =?utf-8?B?RWsveDlsMXI0RzlNTmFxK3NKbUtHU1pqR1pEcGp2RzlBSGZoQ0dzcXg0MEFN?=
 =?utf-8?B?K1VRbjd4dHNVY0ZPbStWKzdISUIrSGxvM2RZckppQ1N1SlVWWFhJZ3lka2dE?=
 =?utf-8?B?ZFNOS3FRcUpycy91MUkxaGZPQkYrRkRXUW1wTDNCdzd3R2VpdDd0aG9QaURC?=
 =?utf-8?B?WVZFL2taRlplblFzQzZJRkg2ZGd6TFJJalVpVWtUeVE3Y2JRQnZRUmtaNlNH?=
 =?utf-8?B?d2RKK3NmWkZiT2VpTDh6bm9EWGwrQm44TWZCU1dQcEFNSEhzWlhIVHdDM0hC?=
 =?utf-8?B?NjliMklqaUpkNkdMMFJQV3dJbXVJOHp1RlhxVWN6UDZ6WTJuZ1BvVU8xQVJT?=
 =?utf-8?B?Q0x3RExrZnFqSVE4WVFpVWQ3ZkNwYTRsakg5bi9UckZmUENDd0twZXZMTUdS?=
 =?utf-8?B?cDFVYzQ1cjIrWnZ6cHB6VUlQRWQybElvQ1NKNFVUMDEvS0ZHb3hNeWZjdHZn?=
 =?utf-8?B?VGZMU1hoMWozTEdDY3EyTUpjbDdkNVVYS0JvMjBrYm9jZ3FGS1RqM3U1cENL?=
 =?utf-8?B?ZThCU1dwbFgxNnUvaTl3KzY0QWdpa3diZTJTTlpyWlQ3Q2dwZzVCVE90T2N2?=
 =?utf-8?B?S3VnYitXRU94ektRV0NmK3hpY3NRai9FcnUreHVYS2U3Q08yT1BLYjFYQUov?=
 =?utf-8?B?ODNOajl6YzNiVm1GUTBJc2lkNGZZalBybTQ0cTh3dVEvcm1LLzkwc0NsZEJV?=
 =?utf-8?B?YjBQY3NRTDV6WG13djloZ2gyRC82dnhGeTNHakxXM2lka2tDeWdhS2tOTW1S?=
 =?utf-8?B?SXVqOXVIc3pUWW1TQ2V2RTIySG1jbys5eGw2ajhJOXRkcC8xOFg0U3lRMWQ5?=
 =?utf-8?B?MEZQR0prVXdaa0JPYzB5N3BNcFBRM011SFpjTXlnM2pVVDV5OGdQUTFIN3hE?=
 =?utf-8?B?dkE0dElYZkU1ZmlQUExtYVBwQlpReWUvenlRMHZjZksrRnZWcGd3bmNrd2lk?=
 =?utf-8?Q?lqTE6zNbjaoDr0qfn0jcn2gYWg7Y5w=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 19:58:56.1267 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c191c9aa-7526-440e-dfd3-08ddea5b264c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFA8145BD40
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


On 9/2/25 12:48, Alex Deucher wrote:
> On Tue, Sep 2, 2025 at 2:09 PM Lizhi Hou <lizhi.hou@amd.com> wrote:
>> Add interface for applications to get information array. The application
>> provides a buffer pointer along with information type, maximum number of
>> entries and maximum size of each entry. The buffer may also contain match
>> conditions based on the information type. After the ioctl completes, the
>> actual number of entries and entry size are returned.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> Link: https://lore.kernel.org/r/20250827203031.1512508-1-lizhi.hou@amd.com
> Do you have a link to the proposed userspace which uses this new IOCTL?

Yes. It is used by runtime library:

https://github.com/amd/xdna-driver/blob/main/src/shim/host/platform_host.cpp#L337


Lizhi

>
> Alex
>
>> ---
>>   drivers/accel/amdxdna/aie2_pci.c        | 116 ++++++++++++++++++------
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  30 ++++++
>>   drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
>>   include/uapi/drm/amdxdna_accel.h        | 111 +++++++++++++++++++++++
>>   4 files changed, 232 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
>> index 7a3449541107..87c425e3d2b9 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -785,11 +785,12 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
>>
>>   static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>>   {
>> -       struct amdxdna_drm_query_hwctx *tmp __free(kfree) = NULL;
>> -       struct amdxdna_drm_get_info *get_info_args = arg;
>> -       struct amdxdna_drm_query_hwctx __user *buf;
>> +       struct amdxdna_drm_hwctx_entry *tmp __free(kfree) = NULL;
>> +       struct amdxdna_drm_get_array *array_args = arg;
>> +       struct amdxdna_drm_hwctx_entry __user *buf;
>> +       u32 size;
>>
>> -       if (get_info_args->buffer_size < sizeof(*tmp))
>> +       if (!array_args->num_element)
>>                  return -EINVAL;
>>
>>          tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
>> @@ -802,14 +803,23 @@ static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>>          tmp->num_col = hwctx->num_col;
>>          tmp->command_submissions = hwctx->priv->seq;
>>          tmp->command_completions = hwctx->priv->completed;
>> -
>> -       buf = u64_to_user_ptr(get_info_args->buffer);
>> -
>> -       if (copy_to_user(buf, tmp, sizeof(*tmp)))
>> +       tmp->pasid = hwctx->client->pasid;
>> +       tmp->priority = hwctx->qos.priority;
>> +       tmp->gops = hwctx->qos.gops;
>> +       tmp->fps = hwctx->qos.fps;
>> +       tmp->dma_bandwidth = hwctx->qos.dma_bandwidth;
>> +       tmp->latency = hwctx->qos.latency;
>> +       tmp->frame_exec_time = hwctx->qos.frame_exec_time;
>> +       tmp->state = AMDXDNA_HWCTX_STATE_ACTIVE;
>> +
>> +       buf = u64_to_user_ptr(array_args->buffer);
>> +       size = min(sizeof(*tmp), array_args->element_size);
>> +
>> +       if (copy_to_user(buf, tmp, size))
>>                  return -EFAULT;
>>
>> -       get_info_args->buffer += sizeof(*tmp);
>> -       get_info_args->buffer_size -= sizeof(*tmp);
>> +       array_args->buffer += size;
>> +       array_args->num_element--;
>>
>>          return 0;
>>   }
>> @@ -817,23 +827,24 @@ static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>>   static int aie2_get_hwctx_status(struct amdxdna_client *client,
>>                                   struct amdxdna_drm_get_info *args)
>>   {
>> +       struct amdxdna_drm_get_array array_args;
>>          struct amdxdna_dev *xdna = client->xdna;
>> -       struct amdxdna_drm_get_info info_args;
>>          struct amdxdna_client *tmp_client;
>>          int ret;
>>
>>          drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>>
>> -       info_args.buffer = args->buffer;
>> -       info_args.buffer_size = args->buffer_size;
>> -
>> +       array_args.element_size = sizeof(struct amdxdna_drm_query_hwctx);
>> +       array_args.buffer = args->buffer;
>> +       array_args.num_element = args->buffer_size / array_args.element_size;
>>          list_for_each_entry(tmp_client, &xdna->client_list, node) {
>> -               ret = amdxdna_hwctx_walk(tmp_client, &info_args, aie2_hwctx_status_cb);
>> +               ret = amdxdna_hwctx_walk(tmp_client, &array_args,
>> +                                        aie2_hwctx_status_cb);
>>                  if (ret)
>>                          break;
>>          }
>>
>> -       args->buffer_size = (u32)(info_args.buffer - args->buffer);
>> +       args->buffer_size -= (u32)(array_args.buffer - args->buffer);
>>          return ret;
>>   }
>>
>> @@ -877,6 +888,58 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
>>          return ret;
>>   }
>>
>> +static int aie2_query_ctx_status_array(struct amdxdna_client *client,
>> +                                      struct amdxdna_drm_get_array *args)
>> +{
>> +       struct amdxdna_drm_get_array array_args;
>> +       struct amdxdna_dev *xdna = client->xdna;
>> +       struct amdxdna_client *tmp_client;
>> +       int ret;
>> +
>> +       drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>> +
>> +       array_args.element_size = min(args->element_size,
>> +                                     sizeof(struct amdxdna_drm_hwctx_entry));
>> +       array_args.buffer = args->buffer;
>> +       array_args.num_element = args->num_element * args->element_size /
>> +                               array_args.element_size;
>> +       list_for_each_entry(tmp_client, &xdna->client_list, node) {
>> +               ret = amdxdna_hwctx_walk(tmp_client, &array_args,
>> +                                        aie2_hwctx_status_cb);
>> +               if (ret)
>> +                       break;
>> +       }
>> +
>> +       args->element_size = array_args.element_size;
>> +       args->num_element = (u32)((array_args.buffer - args->buffer) /
>> +                                 args->element_size);
>> +
>> +       return ret;
>> +}
>> +
>> +static int aie2_get_array(struct amdxdna_client *client,
>> +                         struct amdxdna_drm_get_array *args)
>> +{
>> +       struct amdxdna_dev *xdna = client->xdna;
>> +       int ret, idx;
>> +
>> +       if (!drm_dev_enter(&xdna->ddev, &idx))
>> +               return -ENODEV;
>> +
>> +       switch (args->param) {
>> +       case DRM_AMDXDNA_HW_CONTEXT_ALL:
>> +               ret = aie2_query_ctx_status_array(client, args);
>> +               break;
>> +       default:
>> +               XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
>> +               ret = -EOPNOTSUPP;
>> +       }
>> +       XDNA_DBG(xdna, "Got param %d", args->param);
>> +
>> +       drm_dev_exit(idx);
>> +       return ret;
>> +}
>> +
>>   static int aie2_set_power_mode(struct amdxdna_client *client,
>>                                 struct amdxdna_drm_set_state *args)
>>   {
>> @@ -926,15 +989,16 @@ static int aie2_set_state(struct amdxdna_client *client,
>>   }
>>
>>   const struct amdxdna_dev_ops aie2_ops = {
>> -       .init           = aie2_init,
>> -       .fini           = aie2_fini,
>> -       .resume         = aie2_hw_resume,
>> -       .suspend        = aie2_hw_suspend,
>> -       .get_aie_info   = aie2_get_info,
>> -       .set_aie_state  = aie2_set_state,
>> -       .hwctx_init     = aie2_hwctx_init,
>> -       .hwctx_fini     = aie2_hwctx_fini,
>> -       .hwctx_config   = aie2_hwctx_config,
>> -       .cmd_submit     = aie2_cmd_submit,
>> +       .init = aie2_init,
>> +       .fini = aie2_fini,
>> +       .resume = aie2_hw_resume,
>> +       .suspend = aie2_hw_suspend,
>> +       .get_aie_info = aie2_get_info,
>> +       .set_aie_state = aie2_set_state,
>> +       .hwctx_init = aie2_hwctx_init,
>> +       .hwctx_fini = aie2_hwctx_fini,
>> +       .hwctx_config = aie2_hwctx_config,
>> +       .cmd_submit = aie2_cmd_submit,
>>          .hmm_invalidate = aie2_hmm_invalidate,
>> +       .get_array = aie2_get_array,
>>   };
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> index 8ef5e4f27f5e..0a1fd55e745e 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -26,6 +26,13 @@ MODULE_FIRMWARE("amdnpu/17f0_10/npu.sbin");
>>   MODULE_FIRMWARE("amdnpu/17f0_11/npu.sbin");
>>   MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>>
>> +/*
>> + * 0.0: Initial version
>> + * 0.1: Support getting all hardware contexts by DRM_IOCTL_AMDXDNA_GET_ARRAY
>> + */
>> +#define AMDXDNA_DRIVER_MAJOR           0
>> +#define AMDXDNA_DRIVER_MINOR           1
>> +
>>   /*
>>    * Bind the driver base on (vendor_id, device_id) pair and later use the
>>    * (device_id, rev_id) pair as a key to select the devices. The devices with
>> @@ -164,6 +171,26 @@ static int amdxdna_drm_get_info_ioctl(struct drm_device *dev, void *data, struct
>>          return ret;
>>   }
>>
>> +static int amdxdna_drm_get_array_ioctl(struct drm_device *dev, void *data,
>> +                                      struct drm_file *filp)
>> +{
>> +       struct amdxdna_client *client = filp->driver_priv;
>> +       struct amdxdna_dev *xdna = to_xdna_dev(dev);
>> +       struct amdxdna_drm_get_array *args = data;
>> +       int ret;
>> +
>> +       if (!xdna->dev_info->ops->get_array)
>> +               return -EOPNOTSUPP;
>> +
>> +       if (args->pad || !args->num_element || !args->element_size)
>> +               return -EINVAL;
>> +
>> +       mutex_lock(&xdna->dev_lock);
>> +       ret = xdna->dev_info->ops->get_array(client, args);
>> +       mutex_unlock(&xdna->dev_lock);
>> +       return ret;
>> +}
>> +
>>   static int amdxdna_drm_set_state_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>>   {
>>          struct amdxdna_client *client = filp->driver_priv;
>> @@ -195,6 +222,7 @@ static const struct drm_ioctl_desc amdxdna_drm_ioctls[] = {
>>          DRM_IOCTL_DEF_DRV(AMDXDNA_EXEC_CMD, amdxdna_drm_submit_cmd_ioctl, 0),
>>          /* AIE hardware */
>>          DRM_IOCTL_DEF_DRV(AMDXDNA_GET_INFO, amdxdna_drm_get_info_ioctl, 0),
>> +       DRM_IOCTL_DEF_DRV(AMDXDNA_GET_ARRAY, amdxdna_drm_get_array_ioctl, 0),
>>          DRM_IOCTL_DEF_DRV(AMDXDNA_SET_STATE, amdxdna_drm_set_state_ioctl, DRM_ROOT_ONLY),
>>   };
>>
>> @@ -218,6 +246,8 @@ const struct drm_driver amdxdna_drm_drv = {
>>          .fops = &amdxdna_fops,
>>          .name = "amdxdna_accel_driver",
>>          .desc = "AMD XDNA DRM implementation",
>> +       .major = AMDXDNA_DRIVER_MAJOR,
>> +       .minor = AMDXDNA_DRIVER_MINOR,
>>          .open = amdxdna_drm_open,
>>          .postclose = amdxdna_drm_close,
>>          .ioctls = amdxdna_drm_ioctls,
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> index b6b3b424d1d5..72d6696d49da 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> @@ -58,6 +58,7 @@ struct amdxdna_dev_ops {
>>          int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
>>          int (*get_aie_info)(struct amdxdna_client *client, struct amdxdna_drm_get_info *args);
>>          int (*set_aie_state)(struct amdxdna_client *client, struct amdxdna_drm_set_state *args);
>> +       int (*get_array)(struct amdxdna_client *client, struct amdxdna_drm_get_array *args);
>>   };
>>
>>   /*
>> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
>> index ce523e9ccc52..a1fb9785db77 100644
>> --- a/include/uapi/drm/amdxdna_accel.h
>> +++ b/include/uapi/drm/amdxdna_accel.h
>> @@ -34,6 +34,7 @@ enum amdxdna_drm_ioctl_id {
>>          DRM_AMDXDNA_EXEC_CMD,
>>          DRM_AMDXDNA_GET_INFO,
>>          DRM_AMDXDNA_SET_STATE,
>> +       DRM_AMDXDNA_GET_ARRAY = 10,
>>   };
>>
>>   /**
>> @@ -455,6 +456,112 @@ struct amdxdna_drm_get_info {
>>          __u64 buffer; /* in/out */
>>   };
>>
>> +#define AMDXDNA_HWCTX_STATE_IDLE       0
>> +#define AMDXDNA_HWCTX_STATE_ACTIVE     1
>> +
>> +/**
>> + * struct amdxdna_drm_hwctx_entry - The hardware context array entry
>> + */
>> +struct amdxdna_drm_hwctx_entry {
>> +       /** @context_id: Context ID. */
>> +       __u32 context_id;
>> +       /** @start_col: Start AIE array column assigned to context. */
>> +       __u32 start_col;
>> +       /** @num_col: Number of AIE array columns assigned to context. */
>> +       __u32 num_col;
>> +       /** @hwctx_id: The real hardware context id. */
>> +       __u32 hwctx_id;
>> +       /** @pid: ID of process which created this context. */
>> +       __s64 pid;
>> +       /** @command_submissions: Number of commands submitted. */
>> +       __u64 command_submissions;
>> +       /** @command_completions: Number of commands completed. */
>> +       __u64 command_completions;
>> +       /** @migrations: Number of times been migrated. */
>> +       __u64 migrations;
>> +       /** @preemptions: Number of times been preempted. */
>> +       __u64 preemptions;
>> +       /** @errors: Number of errors happened. */
>> +       __u64 errors;
>> +       /** @priority: Context priority. */
>> +       __u64 priority;
>> +       /** @heap_usage: Usage of device heap buffer. */
>> +       __u64 heap_usage;
>> +       /** @suspensions: Number of times been suspended. */
>> +       __u64 suspensions;
>> +       /**
>> +        * @state: Context state.
>> +        * %AMDXDNA_HWCTX_STATE_IDLE
>> +        * %AMDXDNA_HWCTX_STATE_ACTIVE
>> +        */
>> +       __u32 state;
>> +       /** @pasid: PASID been bound. */
>> +       __u32 pasid;
>> +       /** @gops: Giga operations per second. */
>> +       __u32 gops;
>> +       /** @fps: Frames per second. */
>> +       __u32 fps;
>> +       /** @dma_bandwidth: DMA bandwidth. */
>> +       __u32 dma_bandwidth;
>> +       /** @latency: Frame response latency. */
>> +       __u32 latency;
>> +       /** @frame_exec_time: Frame execution time. */
>> +       __u32 frame_exec_time;
>> +       /** @txn_op_idx: Index of last control code executed. */
>> +       __u32 txn_op_idx;
>> +       /** @ctx_pc: Program counter. */
>> +       __u32 ctx_pc;
>> +       /** @fatal_error_type: Fatal error type if context crashes. */
>> +       __u32 fatal_error_type;
>> +       /** @fatal_error_exception_type: Firmware exception type. */
>> +       __u32 fatal_error_exception_type;
>> +       /** @fatal_error_exception_pc: Firmware exception program counter. */
>> +       __u32 fatal_error_exception_pc;
>> +       /** @fatal_error_app_module: Exception module name. */
>> +       __u32 fatal_error_app_module;
>> +       /** @pad: Structure pad. */
>> +       __u32 pad;
>> +};
>> +
>> +#define DRM_AMDXDNA_HW_CONTEXT_ALL     0
>> +
>> +/**
>> + * struct amdxdna_drm_get_array - Get information array.
>> + */
>> +struct amdxdna_drm_get_array {
>> +       /**
>> +        * @param:
>> +        *
>> +        * Supported params:
>> +        *
>> +        * %DRM_AMDXDNA_HW_CONTEXT_ALL:
>> +        * Returns all created hardware contexts.
>> +        */
>> +       __u32 param;
>> +       /**
>> +        * @element_size:
>> +        *
>> +        * Specifies maximum element size and returns the actual element size.
>> +        */
>> +       __u32 element_size;
>> +       /**
>> +        * @num_element:
>> +        *
>> +        * Specifies maximum number of elements and returns the actual number
>> +        * of elements.
>> +        */
>> +       __u32 num_element; /* in/out */
>> +       /** @pad: MBZ */
>> +       __u32 pad;
>> +       /**
>> +        * @buffer:
>> +        *
>> +        * Specifies the match conditions and returns the matched information
>> +        * array.
>> +        */
>> +       __u64 buffer;
>> +};
>> +
>>   enum amdxdna_drm_set_param {
>>          DRM_AMDXDNA_SET_POWER_MODE,
>>          DRM_AMDXDNA_WRITE_AIE_MEM,
>> @@ -519,6 +626,10 @@ struct amdxdna_drm_set_power_mode {
>>          DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_SET_STATE, \
>>                   struct amdxdna_drm_set_state)
>>
>> +#define DRM_IOCTL_AMDXDNA_GET_ARRAY \
>> +       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_GET_ARRAY, \
>> +                struct amdxdna_drm_get_array)
>> +
>>   #if defined(__cplusplus)
>>   } /* extern c end */
>>   #endif
>> --
>> 2.34.1
>>
