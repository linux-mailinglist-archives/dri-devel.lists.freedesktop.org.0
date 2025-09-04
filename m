Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776D5B443E8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 19:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B727610E33A;
	Thu,  4 Sep 2025 17:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JvcKg8UZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D280610E33A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 17:08:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJHADCvn8byx/OfP3Tc5jBakbDfelpfNZYsUo22gOAAzpCYX6lvNYzXJLr1GsEzvunNGQBHpL6MlfxKX2LzwwcfVvQdkXDUP+BNizSNSIkVp55TsaLI7yEpfUlHl+uz2TLztAp37i5TwZhKheHQlBGEPLuOD0emipolBP3snJ3+ayuewGAIgsLsumFsLU4H320RV3oIO/7E8G2Ap4EPlZexoYdgX+B7oV5kqCdqyvHfhktSKSDS0vVVFGjfLRAN33J+0i35kvxAeiYHPCDvACOT18pardbiArnSASBiJToaSlu0s+1uPLPrfhGE/v3qya+JUGVwe2e2A0p8TG5XyfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0WYUVHwx6wjE48u6+Fv4ALNn5G026B1p4ZRT532FgM=;
 b=RIjilgAWqtbjQA/wq9kMduBLlWv//OPgRnmuCtB4dwoA96U7/8vq7O3LTH6q9mvD4zOkt/AZUoTCFurnCGFbfziW+gIUqSU7F8ddpU0LhJip4DntmkXBwKStjdoUQy3Vwf1Qhu1/QOuRYRTnYh5vshBXpFDaZWIO8o2aEHcISZWUfRetyfn7F0PEKInMCLmI11Z/+xjWcTF6Sdpf5ds96jwL6Hlna4QoyUiv/vnQv0E0uoRQ1Vcw/PTCtCQaAqEmAgOWUqzOYwidJW538CVcCZEX25J0olF17ZNrKxQTurLoVR6dv+TGRiQS0Da125Qhl+c4ETkZi4IJNqD+WO8Rhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0WYUVHwx6wjE48u6+Fv4ALNn5G026B1p4ZRT532FgM=;
 b=JvcKg8UZJ08XL8sAnu6t1j8vkEEaQk5zCJzKIkGIt++bWXt/y7bleAGINIPEH1qX1dT3E3ntuRBhZesSiOaHomO3cWr7IHCVweG3rQr5TvAIkM1UYiKh0CcL07G/m6TgbtS9DlB+z8wSKTn0J2UF2UW0irHQecuDNqWcU897xIA=
Received: from SN7PR04CA0020.namprd04.prod.outlook.com (2603:10b6:806:f2::25)
 by SJ2PR12MB8182.namprd12.prod.outlook.com (2603:10b6:a03:4fd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 17:08:04 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:806:f2:cafe::14) by SN7PR04CA0020.outlook.office365.com
 (2603:10b6:806:f2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Thu,
 4 Sep 2025 17:08:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 17:08:03 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 12:08:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 4 Sep
 2025 10:08:02 -0700
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 4 Sep 2025 12:08:01 -0500
Message-ID: <4efef99a-f8a5-7e59-9a63-a0356378ed83@amd.com>
Date: Thu, 4 Sep 2025 10:08:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V4] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
Content-Language: en-US
To: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>, Mario Limonciello
 <superm1@kernel.org>
References: <20250903053402.2103196-1-lizhi.hou@amd.com>
 <d7e57a9e-ace3-4f92-b421-fa3a3b1ab276@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <d7e57a9e-ace3-4f92-b421-fa3a3b1ab276@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|SJ2PR12MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e19268-c79a-4354-1a77-08ddebd59be2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUZYZjhNU25DbGFzM3o1YU13ekI0RzVDVlJHM1BWcjJseTM4cFc5SkNBZE9Y?=
 =?utf-8?B?L2JMM3kreEZ0R01XOEl6cUdDSHVtUzAvcVJMWkFuNGRYZWNHV3V4UTI5dnFo?=
 =?utf-8?B?NHFDalV3RkFxMlZBZ3Y5dnlHTkpVOVhzL2ZiZGFvQUJZZ1FWa2hmZ3NZVDhO?=
 =?utf-8?B?N1RwWW8yZTRCYks2YllOL1ZKQ0IrbHkweTgxa3BXR0MyVUVkUWhEZUcxSXZo?=
 =?utf-8?B?OGl1Z25sbitpdmszTEtRbHU4eUZvNExBTWNsSkdLUkxqMHJIT1ppbDZ6QTlS?=
 =?utf-8?B?bGhvZnMwSEdqRUZESzB3dWhKWjhSK1VSTTAwYzR3Y1dSWFN0eDhxak9ZSzhK?=
 =?utf-8?B?akdXYUhiNGxNQ0Y5eDZ5b3k4Wm1NLzRWZEw2TXhmc1hZTnZMUDdDb0E3bSt5?=
 =?utf-8?B?MG5UK21sS2VnMThJVDdiUnBZTnlsTXJhSTJETmI1TE82bVZ4SG1NS0JkQjQ0?=
 =?utf-8?B?VlBuL002Uy9oWkNRbVZHdTRjckVqazRpRWtxeWZzYVlwUExMUUV5VENxNWwx?=
 =?utf-8?B?SFpVNzJMejZjajcrTjFCc3NwelNBYkJleDFnZk9WQnFYV2Y5c0pEWHY2eHFG?=
 =?utf-8?B?ME5SR0ExdFhiTkJQdFc3VjAzdjdHdjUrZTFQb1FvWWVqS1lmYWNBRWloRll6?=
 =?utf-8?B?QTk0TU9sWmhhMmQ0UDd5Q0lBOWo4SkJTMUFMbjlWR1JVTVFzUnAxSjFaK3VD?=
 =?utf-8?B?Ulp5WWw1ZFo0R09XYnlqTlpqYjU4M1FVSlUzVXkyMGdKRm9JcmY5eHRlSGFP?=
 =?utf-8?B?aWlHOWRPam13cHg3MHJwelhwYUo3RkdFRmxIbjRmRnNFUmZEZ0dBK25Dd05V?=
 =?utf-8?B?emlZb1I3TnA2WnZ0YW5BQmg3TXFhcXJEcmZCZGtnRzR2TmJHTWx6RlFXM01p?=
 =?utf-8?B?SVBaOFl4Mk4wT2FuUjY1MWlWSjV0emVPUDhobTlhSS9Pbm0xRlVpVFNYbHR3?=
 =?utf-8?B?aENVd1lDVitJSXRwT1oxQU81WWxCNWRid0FSRzVSc1J2eHcxOEUrMTNJWlhQ?=
 =?utf-8?B?enBac1kwTjlXam55UTg2N3Z5eHhqNEMxNjRCaWNZMExGanh6NHR6WTBFWmdI?=
 =?utf-8?B?YTZjTEgrMFM3Y2xRL3k2Z2daZUplWXhFMFB0UnRiczk0Y2RSZ0tBY0YrTThy?=
 =?utf-8?B?UDgwZkMrSFpmUGZvbkt2Mmt2UnpTUy9ZRE5Va0VMSklmY2s4N1RYY3pmWVVu?=
 =?utf-8?B?RmxJZUFxTUt2c0FheWh3ME1UckVTdXV6aitmeDRBZ2l4RUo0UnIwZDN3cDdW?=
 =?utf-8?B?U0xoOU9TVThmZTNmTlVzamxPNFEyWjYrU3pCWWJDNXNyNDJjL3NaZUs4OG5L?=
 =?utf-8?B?VVE0R245TGN3SDNkbU5NYVlkVSt3N2JyU2ZPalRVeUVYcmdpZVk0SEpjL1FW?=
 =?utf-8?B?MDhxY3pWa1RtOSt5dlcyUE1ZYWl0M0FGaXpEbHNNK1NWS1ZDU1EwbE5peHdB?=
 =?utf-8?B?MGtPeXdXM1lyZGZIYzBqekl6VnpIOG5MT3UrOFJZQzVkRk1TMkY0dVNIZmZn?=
 =?utf-8?B?dUVDbGZKYVFTRU9KSHRkYVFOV0xsdzZOMkhRMS94a2x4V2FSTGFpWjZmc2tM?=
 =?utf-8?B?ZU1KWGlIRndSUlExai8ybjB3NzBkdDJEbXVPSWZBWlpQWkNpT0ZDZDdEd2lC?=
 =?utf-8?B?Yjk5Z1ZmVEFSMVpDMkQwTUpzUmE5UU1VZmRvb2s4cnJ4K1dMWDlGTE5EWjFO?=
 =?utf-8?B?aDM4MTRTaU9pSENhNFFjK0hwTU9xSDBWWWpxMHZDSXJwN1BFVkVrVVVwSzAx?=
 =?utf-8?B?RU5jeENDeWlvK2E5aE10cWJpVWlId2hCQWxJWG9WaWg4TXB3cVppMU1DZGdV?=
 =?utf-8?B?ZFNtbEVIbE1ZWncwSHVtWWN2SnRyQi95UUI4VWpYV3VzYXVZOUZvTUhBSXBs?=
 =?utf-8?B?TXlxT2tjWW1KcjFIY3gzcmtuRXlmYk1JbUNUbHBvZldPRHA5czBPbGNlWitV?=
 =?utf-8?B?Vng4Q0ZIejg2R2VDbW1yMVlyOGJFYzBIVlh6YXRFOG9EejdGNGp0b1VoSzRT?=
 =?utf-8?B?Umh1NXpsVk13PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 17:08:03.1683 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e19268-c79a-4354-1a77-08ddebd59be2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8182
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

Applied to drm-misc-next

On 9/2/25 23:54, Falkowski, Maciej wrote:
> Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>
> On 9/3/2025 7:34 AM, Lizhi Hou wrote:
>> Add interface for applications to get information array. The application
>> provides a buffer pointer along with information type, maximum number of
>> entries and maximum size of each entry. The buffer may also contain 
>> match
>> conditions based on the information type. After the ioctl completes, the
>> actual number of entries and entry size are returned. (see [1], used by
>> driver runtime library)
>>
>> [1] 
>> https://github.com/amd/xdna-driver/blob/main/src/shim/host/platform_host.cpp#L337
>>
>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_pci.c        | 116 ++++++++++++++++++------
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  27 ++++++
>>   drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
>>   include/uapi/drm/amdxdna_accel.h        | 111 +++++++++++++++++++++++
>>   4 files changed, 229 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index 7a3449541107..87c425e3d2b9 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -785,11 +785,12 @@ static int aie2_get_clock_metadata(struct 
>> amdxdna_client *client,
>>     static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void 
>> *arg)
>>   {
>> -    struct amdxdna_drm_query_hwctx *tmp __free(kfree) = NULL;
>> -    struct amdxdna_drm_get_info *get_info_args = arg;
>> -    struct amdxdna_drm_query_hwctx __user *buf;
>> +    struct amdxdna_drm_hwctx_entry *tmp __free(kfree) = NULL;
>> +    struct amdxdna_drm_get_array *array_args = arg;
>> +    struct amdxdna_drm_hwctx_entry __user *buf;
>> +    u32 size;
>>   -    if (get_info_args->buffer_size < sizeof(*tmp))
>> +    if (!array_args->num_element)
>>           return -EINVAL;
>>         tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
>> @@ -802,14 +803,23 @@ static int aie2_hwctx_status_cb(struct 
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
>> @@ -817,23 +827,24 @@ static int aie2_hwctx_status_cb(struct 
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
>>   @@ -877,6 +888,58 @@ static int aie2_get_info(struct amdxdna_client 
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
>> @@ -926,15 +989,16 @@ static int aie2_set_state(struct amdxdna_client 
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
>> index 8ef5e4f27f5e..569cd703729d 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -26,6 +26,13 @@ MODULE_FIRMWARE("amdnpu/17f0_10/npu.sbin");
>>   MODULE_FIRMWARE("amdnpu/17f0_11/npu.sbin");
>>   MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>>   +/*
>> + * 0.0: Initial version
>> + * 0.1: Support getting all hardware contexts by 
>> DRM_IOCTL_AMDXDNA_GET_ARRAY
>> + */
>> +#define AMDXDNA_DRIVER_MAJOR        0
>> +#define AMDXDNA_DRIVER_MINOR        1
>> +
>>   /*
>>    * Bind the driver base on (vendor_id, device_id) pair and later 
>> use the
>>    * (device_id, rev_id) pair as a key to select the devices. The 
>> devices with
>> @@ -164,6 +171,23 @@ static int amdxdna_drm_get_info_ioctl(struct 
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
>> +
>> +    if (!xdna->dev_info->ops->get_array)
>> +        return -EOPNOTSUPP;
>> +
>> +    if (args->pad || !args->num_element || !args->element_size)
>> +        return -EINVAL;
>> +
>> +    guard(mutex)(&xdna->dev_lock);
>> +    return xdna->dev_info->ops->get_array(client, args);
>> +}
>> +
>>   static int amdxdna_drm_set_state_ioctl(struct drm_device *dev, void 
>> *data, struct drm_file *filp)
>>   {
>>       struct amdxdna_client *client = filp->driver_priv;
>> @@ -195,6 +219,7 @@ static const struct drm_ioctl_desc 
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
>>   @@ -218,6 +243,8 @@ const struct drm_driver amdxdna_drm_drv = {
>>       .fops = &amdxdna_fops,
>>       .name = "amdxdna_accel_driver",
>>       .desc = "AMD XDNA DRM implementation",
>> +    .major = AMDXDNA_DRIVER_MAJOR,
>> +    .minor = AMDXDNA_DRIVER_MINOR,
>>       .open = amdxdna_drm_open,
>>       .postclose = amdxdna_drm_close,
>>       .ioctls = amdxdna_drm_ioctls,
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h 
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
>> index ce523e9ccc52..a1fb9785db77 100644
>> --- a/include/uapi/drm/amdxdna_accel.h
>> +++ b/include/uapi/drm/amdxdna_accel.h
>> @@ -34,6 +34,7 @@ enum amdxdna_drm_ioctl_id {
>>       DRM_AMDXDNA_EXEC_CMD,
>>       DRM_AMDXDNA_GET_INFO,
>>       DRM_AMDXDNA_SET_STATE,
>> +    DRM_AMDXDNA_GET_ARRAY = 10,
>>   };
>>     /**
>> @@ -455,6 +456,112 @@ struct amdxdna_drm_get_info {
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
>> +    /** @pad: Structure pad. */
>> +    __u32 pad;
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
>> @@ -519,6 +626,10 @@ struct amdxdna_drm_set_power_mode {
>>       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_SET_STATE, \
>>            struct amdxdna_drm_set_state)
>>   +#define DRM_IOCTL_AMDXDNA_GET_ARRAY \
>> +    DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_GET_ARRAY, \
>> +         struct amdxdna_drm_get_array)
>> +
>>   #if defined(__cplusplus)
>>   } /* extern c end */
>>   #endif
