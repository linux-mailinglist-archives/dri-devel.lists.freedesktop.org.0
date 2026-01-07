Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6B6D00496
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 23:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD19210E107;
	Wed,  7 Jan 2026 22:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pZWX6Y81";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012012.outbound.protection.outlook.com
 [40.93.195.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC1510E107
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 22:12:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J38OcGhI3Q7o8o2MijMS7mN/PLQKFU7PogXjk5fl1BexpDUkaXzKrlLgx0JIijXKpqshMqcmxvoyvxgpz++p0JE+MB6B6+ypSvWhv3nPYvVu61sK9QBU//rraH6K5DGfmM3r7uTPFIrD4UJC11z0bXs7YWYF9Us0tZ3BK/Lx+mI4y5Aa/8UxGV7wkOmwjd7eDRQxwgAW8mGBMQNbA5fRe0R5hLrK6xdu8GoD9WnXFUaIhB4TV8ka8Lzm8M31xejhGlWd8ghcCHRm/w7G2uZ2uSABSnS02SrKGJlI91XUQBjvKtt37EU4TNTAls4HwKm4HQxSc85jhtURJDHljucZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRmC/ziFhscjLaCX9cqiWLcgJyXMc+381fGWeH4eEH0=;
 b=xLONCW7CWdBbnXiHPHeyWbdKPXBh3zU5+pz4NZatdIgdFgHFNq8q2mHe+/WZh8kWL15y4pczM3JP7jm3uM9cVPJvBeyxzSN4RCDkSf54Yftyl8h0a/gJV4SwsZqxSDYxSnS2M2PMbstazT2eJ0MPT6+zAJcxOf9l1FTPdzpAdjQgfdoWS3yB1Rc2nK+M9IIEEjORMEcpGj69zJ22heIB+ttgJK8b5F2HVTIWNAs91FxSZ2yWtb1LvQ+Sg9edNUR7+dA4DOZ1yNqI4OHFQIfP7O2JMYLw0SKD7e+eMGobCmU37fcu5yNqiRa3SSkJ5bdZDLpyIsu42W8756ibL8ZzmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRmC/ziFhscjLaCX9cqiWLcgJyXMc+381fGWeH4eEH0=;
 b=pZWX6Y81RKSPKcWq3ELING013QFh92CQYosEY8jP2LGwL8LaWMWohFdlWip9jIejkF8+ZiIacLGmaH02XpyxCT5Su5NAUnn57HQcQsbEQfF7x1XVhQXntCaXDRP3rR4V6IUXWLPeqrtH2SpYpoaZF+/F9osP5TTYWMR3IcF0cEQ=
Received: from PH8P220CA0058.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::32)
 by SJ0PR12MB8616.namprd12.prod.outlook.com (2603:10b6:a03:485::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 22:12:07 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:510:2d9:cafe::cf) by PH8P220CA0058.outlook.office365.com
 (2603:10b6:510:2d9::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 22:12:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 22:12:06 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 16:12:06 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 16:12:05 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 7 Jan 2026 16:12:05 -0600
Message-ID: <2cb7bd75-79b8-1a45-8945-0e86f86ede08@amd.com>
Date: Wed, 7 Jan 2026 14:12:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1 2/2] accel/amdxdna: Update firmware version check for
 latest firmware
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251219014356.2234241-1-lizhi.hou@amd.com>
 <20251219014356.2234241-2-lizhi.hou@amd.com>
 <0eb1b06c-72be-409b-b49a-e340bf49453d@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <0eb1b06c-72be-409b-b49a-e340bf49453d@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|SJ0PR12MB8616:EE_
X-MS-Office365-Filtering-Correlation-Id: d7ef01a6-1f53-43fa-b42e-08de4e39cb7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0VyNTZRb2NkZmpWa3R4S0JacWY0NURnbEd2WlMxOEZ6S2xDMzFGSnpta0Er?=
 =?utf-8?B?bjljRjlxcnZyd3I4Ny84Q3E3eUVxQW9vKzhTb2NSODBsdmI0VnF1dFplV3Vw?=
 =?utf-8?B?cFBRWVoxKzRMQ3N0SjVHZmp6T2RhY2ZtbDFrOG5mcVZmekFhSUVndlJUYzBQ?=
 =?utf-8?B?d29JSGNwVi8yZ015OXlPQ25UdWxBZnBSbloyd2pvZ09UZ0c4Qy9IRHRCSm1V?=
 =?utf-8?B?Uk1RN0x1aitlTHhhZHgyVzZaamMvZ0dRZjNwYllCL3VqUVp1VHQ4N09TSGlB?=
 =?utf-8?B?ODE3UmJDQlBxZE9VdVF6TzlLWW43eFBWRkJKK0tYS3ZGcmpleThXd0FHeGpN?=
 =?utf-8?B?WkF2UFZSNVF6VXJEbGZnS2lYNVlKbWlEUXkvRTZnZ1Jnd2xibzZKd0UyWnJX?=
 =?utf-8?B?aVV0UThQVEJkbUpGdkk2WjU2amNzNThlSUtaZXNkMENkNkYwZ2NFZDZVRzlL?=
 =?utf-8?B?ZEdzR29WYVhDSWpXQ1k3Zmk1OWNuNUkwRzkwWnlKQlVURi94em4zMDJZYWxJ?=
 =?utf-8?B?MHo0d3NXTXExQ2l6R2N2WHJLNjZKbG9IL2FzQXVVL3VNRVpBejJSTnV0TDZr?=
 =?utf-8?B?L2pjRHRORXB5dURmNzd2SWNHaHhvd1ZnSUE2S2hRUUExRjNBZ1N6Q0MwTXpx?=
 =?utf-8?B?dlo5RnZ1RmxEWVFTamdoYnVwNlp0d3N3K1NNdEEvMHIwaWVLanNpb3h3Q2ZH?=
 =?utf-8?B?VDVBeVEwd1lnTWFKdTJUVS94Zjl4bUlhdG02dWQzcVE0U3dvRC8yQlcxa00v?=
 =?utf-8?B?NXVSb0s0b0d1cGZDWElqVURxeVZ4eXVtUEhHaDVva2YvSnl6cVpsdUFtU2NS?=
 =?utf-8?B?Rmc1Mm1rd3pUL0lNTzJWK2x2SWNaSXN4SXlBSnE1ZmNDU0RjbFlmZUl6YVVi?=
 =?utf-8?B?YVlNL2UzNDJsWWtuYmlZd2dRTlpSeXJpZEFqRXN2YzVrSElNeUpocmJQSTd4?=
 =?utf-8?B?V0UzMllGZm5SSC9rQm9QQktFSjllOSt0MExlOVpiNGVpSml1ekdKWXdZOGZC?=
 =?utf-8?B?eVFWVmtIMVlmN2xDckNQTjlLK2RBc1dSUzdJeGI5OGwvZ3I1OUxJaGNJOUhk?=
 =?utf-8?B?bjNwUmZRdUhaRzNsV0VuQkllVnRPNnZYY2F2VEZvN2VlSzh1RWxDSnhHYXMx?=
 =?utf-8?B?SXkrWTFWem0vbGR0aVdUYXMzb2tlTk13R3FuTGN2MktCTDlFdDhaTEd2L3BZ?=
 =?utf-8?B?MUFxVld3U3JPTllVUmFpcDhPTU1pTEowNmVJbkNGRWpPZUZyQlNtREtFamlh?=
 =?utf-8?B?VUtKRytKejFNNlFZZXQ1SkRWYXBuY1JEQlFmREVWb1RIenU0V2gzeE9NbmM5?=
 =?utf-8?B?bWwveWsxQVFDU0hmZmFGeGhvbE1CUnZTaWppdEVwNVVad01UZTV1OHFkUmhD?=
 =?utf-8?B?ZXZDK0dodm5ubWhMbzVkZjRhUXZQUnpCZ2NjYmpMVlZCUnpQcURyMVRNbnJz?=
 =?utf-8?B?b3I0ekE3SHpyWmg0cTdhckowRER6S0N2MjB1M2hab3dZRGUvMDFNZDRTUkpP?=
 =?utf-8?B?NG5Kb0xueHptbVU3OXZBVlJ4ZXFaN1R5SVVvdE9GeGErSVBMWDdtYUhZL3l4?=
 =?utf-8?B?c2lWRWhNUzV0QXlWeU4xVEVpa0lMdWhDTmRDZTM2L0hHRDhSRW5NM2M3VjdZ?=
 =?utf-8?B?OEgwQmRsVVZpUXY3WHhXOCtSODFPcFFmYTJzaVFScm1PQWg1MGVkN1Z6Qy9L?=
 =?utf-8?B?K1hPbmJkdDA4NUZib25iNnkyUHViRWx5eFNsTlIzZ284bE0zMjV1RGVBaHd4?=
 =?utf-8?B?cWtDdHcvM2JNaFBVdmhEQWdNaUpDQlJyVzI5a3g1eHVlcEIzNTFkYUFwdFFj?=
 =?utf-8?B?UnVORGpNTkJoZmdtMStXbGkxMVFaRmhLMURXSnVqMGZQaDIyaG5jYmtvUG9q?=
 =?utf-8?B?QjdIYzcvRUYxSVJpNkIwSHY5UWZqMG16L1QwelFoSTNXaDVVaTNvZk4yRzQr?=
 =?utf-8?B?MFBucWlCSGNKWW5ZTFd3UWZGcmp6ZGJTcUo3MkxTQTV2ZktiMDUyMEpzb0xz?=
 =?utf-8?B?bHA1WXR1SmgzYTBqQ204Q3VoZ1lTTmxQNTJua25rZkY3OHJVemlrTmlNTVRL?=
 =?utf-8?B?U3M0emEwZGtkS0NyOGk2NFFFb2hRQlFsNHFySzVnNkpuVndjdGR2azBHeVFU?=
 =?utf-8?Q?5VX0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 22:12:06.6641 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ef01a6-1f53-43fa-b42e-08de4e39cb7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8616
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


On 1/7/26 13:20, Mario Limonciello wrote:
> On 12/18/25 7:43 PM, Lizhi Hou wrote:
>> The latest firmware increases the major version number. Update
>> aie2_check_protocol() to accept and support the new firmware version.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>
> I know it's painful and tech debt; but I suggest you add new paths to 
> handle both versions of firmware at least until the next LTS kernel.

With the patch 1, the driver works fine for both current firmware and 
upcoming firmware.

Lizhi

>
>> ---
>>   drivers/accel/amdxdna/aie2_pci.c  | 36 ++++++++-----------------------
>>   drivers/accel/amdxdna/aie2_pci.h  |  5 ++---
>>   drivers/accel/amdxdna/npu1_regs.c |  6 +++---
>>   drivers/accel/amdxdna/npu4_regs.c | 11 +++++-----
>>   drivers/accel/amdxdna/npu5_regs.c |  2 --
>>   drivers/accel/amdxdna/npu6_regs.c |  2 --
>>   6 files changed, 20 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index 81a8e4137bfd..181fdbc10dae 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -56,41 +56,23 @@ struct mgmt_mbox_chann_info {
>>   static int aie2_check_protocol(struct amdxdna_dev_hdl *ndev, u32 
>> fw_major, u32 fw_minor)
>>   {
>>       const struct aie2_fw_feature_tbl *feature;
>> -    struct amdxdna_dev *xdna = ndev->xdna;
>> -
>> -    /*
>> -     * The driver supported mailbox behavior is defined by
>> -     * ndev->priv->protocol_major and protocol_minor.
>> -     *
>> -     * When protocol_major and fw_major are different, it means driver
>> -     * and firmware are incompatible.
>> -     */
>> -    if (ndev->priv->protocol_major != fw_major) {
>> -        XDNA_ERR(xdna, "Incompatible firmware protocol major %d 
>> minor %d",
>> -             fw_major, fw_minor);
>> -        return -EINVAL;
>> -    }
>> +    bool found = false;
>>   -    /*
>> -     * When protocol_minor is greater then fw_minor, that means driver
>> -     * relies on operation the installed firmware does not support.
>> -     */
>> -    if (ndev->priv->protocol_minor > fw_minor) {
>> -        XDNA_ERR(xdna, "Firmware minor version smaller than 
>> supported");
>> -        return -EINVAL;
>> -    }
>> -
>> -    for (feature = ndev->priv->fw_feature_tbl; feature && 
>> feature->min_minor;
>> -         feature++) {
>> +    for (feature = ndev->priv->fw_feature_tbl; feature->major; 
>> feature++) {
>> +        if (feature->major != fw_major)
>> +            continue;
>>           if (fw_minor < feature->min_minor)
>>               continue;
>>           if (feature->max_minor > 0 && fw_minor > feature->max_minor)
>>               continue;
>>   -        set_bit(feature->feature, &ndev->feature_mask);
>> +        ndev->feature_mask |= feature->features;
>> +
>> +        /* firmware version matches one of the driver support entry */
>> +        found = true;
>>       }
>>   -    return 0;
>> +    return found ? 0 : -EOPNOTSUPP;
>>   }
>>     static void aie2_dump_chann_info_debug(struct amdxdna_dev_hdl *ndev)
>> diff --git a/drivers/accel/amdxdna/aie2_pci.h 
>> b/drivers/accel/amdxdna/aie2_pci.h
>> index e1745f07b268..b20a3661078c 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.h
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -237,7 +237,8 @@ enum aie2_fw_feature {
>>   };
>>     struct aie2_fw_feature_tbl {
>> -    enum aie2_fw_feature feature;
>> +    u64 features;
>> +    u32 major;
>>       u32 max_minor;
>>       u32 min_minor;
>>   };
>> @@ -246,8 +247,6 @@ struct aie2_fw_feature_tbl {
>>     struct amdxdna_dev_priv {
>>       const char            *fw_path;
>> -    u64                protocol_major;
>> -    u64                protocol_minor;
>>       const struct rt_config        *rt_config;
>>       const struct dpm_clk_freq    *dpm_clk_tbl;
>>       const struct aie2_fw_feature_tbl *fw_feature_tbl;
>> diff --git a/drivers/accel/amdxdna/npu1_regs.c 
>> b/drivers/accel/amdxdna/npu1_regs.c
>> index ebc6e2802297..6f36a27b5a02 100644
>> --- a/drivers/accel/amdxdna/npu1_regs.c
>> +++ b/drivers/accel/amdxdna/npu1_regs.c
>> @@ -6,6 +6,7 @@
>>   #include <drm/amdxdna_accel.h>
>>   #include <drm/drm_device.h>
>>   #include <drm/gpu_scheduler.h>
>> +#include <linux/bits.h>
>>   #include <linux/sizes.h>
>>     #include "aie2_pci.h"
>> @@ -65,14 +66,13 @@ const struct dpm_clk_freq npu1_dpm_clk_table[] = {
>>   };
>>     static const struct aie2_fw_feature_tbl npu1_fw_feature_table[] = {
>> -    { .feature = AIE2_NPU_COMMAND, .min_minor = 8 },
>> +    { .major = 5, .min_minor = 7 },
>> +    { .features = BIT_U64(AIE2_NPU_COMMAND), .min_minor = 8 },
>>       { 0 }
>>   };
>>     static const struct amdxdna_dev_priv npu1_dev_priv = {
>>       .fw_path        = "amdnpu/1502_00/npu.sbin",
>> -    .protocol_major = 0x5,
>> -    .protocol_minor = 0x7,
>>       .rt_config    = npu1_default_rt_cfg,
>>       .dpm_clk_tbl    = npu1_dpm_clk_table,
>>       .fw_feature_tbl = npu1_fw_feature_table,
>> diff --git a/drivers/accel/amdxdna/npu4_regs.c 
>> b/drivers/accel/amdxdna/npu4_regs.c
>> index a62234fd266d..a8d6f76dde5f 100644
>> --- a/drivers/accel/amdxdna/npu4_regs.c
>> +++ b/drivers/accel/amdxdna/npu4_regs.c
>> @@ -6,6 +6,7 @@
>>   #include <drm/amdxdna_accel.h>
>>   #include <drm/drm_device.h>
>>   #include <drm/gpu_scheduler.h>
>> +#include <linux/bits.h>
>>   #include <linux/sizes.h>
>>     #include "aie2_pci.h"
>> @@ -88,16 +89,16 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
>>   };
>>     const struct aie2_fw_feature_tbl npu4_fw_feature_table[] = {
>> -    { .feature = AIE2_NPU_COMMAND, .min_minor = 15 },
>> -    { .feature = AIE2_PREEMPT, .min_minor = 12 },
>> -    { .feature = AIE2_TEMPORAL_ONLY, .min_minor = 12 },
>> +    { .major = 6, .min_minor = 12 },
>> +    { .features = BIT_U64(AIE2_NPU_COMMAND), .major = 6, .min_minor 
>> = 15 },
>> +    { .features = BIT_U64(AIE2_PREEMPT), .major = 6, .min_minor = 12 },
>> +    { .features = BIT_U64(AIE2_TEMPORAL_ONLY), .major = 6, 
>> .min_minor = 12 },
>> +    { .features = GENMASK_ULL(AIE2_TEMPORAL_ONLY, AIE2_NPU_COMMAND), 
>> .major = 7 },
>>       { 0 }
>>   };
>>     static const struct amdxdna_dev_priv npu4_dev_priv = {
>>       .fw_path        = "amdnpu/17f0_10/npu.sbin",
>> -    .protocol_major = 0x6,
>> -    .protocol_minor = 12,
>>       .rt_config    = npu4_default_rt_cfg,
>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>       .fw_feature_tbl = npu4_fw_feature_table,
>> diff --git a/drivers/accel/amdxdna/npu5_regs.c 
>> b/drivers/accel/amdxdna/npu5_regs.c
>> index 131080652ef0..c0a35cfd886c 100644
>> --- a/drivers/accel/amdxdna/npu5_regs.c
>> +++ b/drivers/accel/amdxdna/npu5_regs.c
>> @@ -64,8 +64,6 @@
>>     static const struct amdxdna_dev_priv npu5_dev_priv = {
>>       .fw_path        = "amdnpu/17f0_11/npu.sbin",
>> -    .protocol_major = 0x6,
>> -    .protocol_minor = 12,
>>       .rt_config    = npu4_default_rt_cfg,
>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>       .fw_feature_tbl = npu4_fw_feature_table,
>> diff --git a/drivers/accel/amdxdna/npu6_regs.c 
>> b/drivers/accel/amdxdna/npu6_regs.c
>> index 1f71285655b2..1fb07df99186 100644
>> --- a/drivers/accel/amdxdna/npu6_regs.c
>> +++ b/drivers/accel/amdxdna/npu6_regs.c
>> @@ -64,8 +64,6 @@
>>     static const struct amdxdna_dev_priv npu6_dev_priv = {
>>       .fw_path        = "amdnpu/17f0_10/npu.sbin",
>> -    .protocol_major = 0x6,
>> -    .protocol_minor = 12,
>>       .rt_config    = npu4_default_rt_cfg,
>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>       .fw_feature_tbl = npu4_fw_feature_table,
>
