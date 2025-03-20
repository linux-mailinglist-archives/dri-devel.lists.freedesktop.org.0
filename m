Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1E8A6AEE5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 20:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0B510E6A8;
	Thu, 20 Mar 2025 19:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N2jolfMR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2050.outbound.protection.outlook.com [40.107.95.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851E610E69E;
 Thu, 20 Mar 2025 19:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ki1NbCS2Lv2MUBOQuzMBnZefTRMD/rcQohM8BOIqrzP+s6drZaht5UwBSZCFBnD4c4qkTKdIbWq0/3oLJtp1RXt+DWP72QkGilvGd08Kw4IN5JxDPVx/vANxqFCkZrxg+8XZB8061c7C0IerfQRilHOF7XxSdaRNkPLCV+7o3YvbCuz6v/aoRx6T6cqFRDYhO+FjgS6wEBG1N+JvzZP6GhWl5lca2LQsagkCBAdQnuKdnhW6qneGABh/P4inS4/pwZ57Qxwboldd8fQ7+7blxmh2tnyDHM3HjOSdEIo9nHyN1EJohoUDLuV/8P884qy01DS00CrhawxB4cScYbx/Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02hni1Xo/FnAKpR5JETjB/pUBcBCdkXecsHSE4jLNM0=;
 b=B/Uxv2qAi1wJOyuAJhtPLH0FwntmgMzrS0eFiXI12WnuEATXQrrO0jDBFDbE0V3aj30NQuJYfyrmT59r5Zfo9jHgAY1iavQyMcluJroKNHn3sfk8TIdZvb6aDeDH4qSq/ddSbw89meBeMp0mZb+7hm2xb7So4utxB6fj8n2BgL5zFyTZJgY9fTZReeXPPbg6HxRo152IU588F5biFkIbbGJfsC3EdUxyUgofaYLPHZVmLBj+y7WCdayoe+Yw+cQTA9i7/XAMeYFCEhMpLxsNsSUmToRP+b7Bsva3gch4w1+tZdHwnbnaKoXOcLlDHJgFSwEZuno1cpTs1UQyivzFYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02hni1Xo/FnAKpR5JETjB/pUBcBCdkXecsHSE4jLNM0=;
 b=N2jolfMR5l9snCwVxKKUOxyaO80YyPk3eeYRSyhH+9xxP4TJuPHcJ7s0lUV5b+qIbAirZmBzwQHwD9BXZeN60xdTXuHu4ccR2bHOWFMwQLHaBdqYFN21Wk4El8gF1SpZcUwP9SaDdAhJZGKnnrzYHX1itOvblexNp8ikNk0qNs65ERVJEC4SJDCpGkzRkftjX1aNOmsGGjcvTH5ysIYLqiartQOVtC8SJCbOddhVYLdXIPQAhCYadl09Hj0qV0fVW/ZEI4p8o1/xvvxncxqEPHdwYMXQO//EnD5bChvgqWOoOdh9CCxGvpv8ZOdh8O873VmXll9RrBz7Ycptvqt/fA==
Received: from MW3PR05CA0005.namprd05.prod.outlook.com (2603:10b6:303:2b::10)
 by CH3PR12MB7572.namprd12.prod.outlook.com (2603:10b6:610:144::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 19:58:21 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::3b) by MW3PR05CA0005.outlook.office365.com
 (2603:10b6:303:2b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 20 Mar 2025 19:58:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 19:58:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 20 Mar
 2025 12:58:04 -0700
Received: from [172.26.153.250] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 20 Mar
 2025 12:58:02 -0700
Message-ID: <abcc6ddc-47d5-4970-8fc1-e82c150fbfd9@nvidia.com>
Date: Fri, 21 Mar 2025 05:57:55 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
To: Danilo Krummrich <dakr@kernel.org>, Mel Henning
 <mhenning@darkrefraction.com>
CC: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, "Faith
 Ekstrand" <faith.ekstrand@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <Z9xb5SABWcwYnV-x@pollux>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|CH3PR12MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: b9c5bd6b-8e73-4216-dce2-08dd67e990d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGVyUDhVTERSaTN4MTFjT25QK21oZHZTSllDdUk0RXVQYWdMTUNNQmF2dmJ2?=
 =?utf-8?B?c0FHYXBJWTZiazN6K0VHS0ovMzJ6UjIxeS95WHBnQ3hGeFJaczFSWGxhaUFj?=
 =?utf-8?B?SXI2UEFWQUc5cHNiZE8wbWRIUU43VVBvaU9QUG5ZK2VCQ3hMeXBaSGR5ckd2?=
 =?utf-8?B?OFlBSDRaYU9CZVpOcjdwYnJXTVZoaFNrVHd2RHViR3Jqa21veEp1T0NNemVB?=
 =?utf-8?B?dXFMcFFwdU1IUG5GK1BGcXg5YVFxT2VTNURNZC9vVnc2bFRUVEg3T2ovS2l5?=
 =?utf-8?B?dGR6Y3hYekZTYVNCWGwySXNHK2VWWnlNMXN1WFJIQ1RQaWdiRDQzS1BVaXVY?=
 =?utf-8?B?bm1Xb2pUTnFpV3luRm43eVB3bGdKcTdseUZ1MGZ3d1U1S1NvbTFJTWVVTHcz?=
 =?utf-8?B?OSs5ejN3QlprL1Y1cWlvQnQvT1BTc3Axd0pDV0R3UXhCenc1V2VMM3kzTHY4?=
 =?utf-8?B?Qi9SLzZvTlFwMWRFNStXTUNYdFVyNUNkUTBmUkRwbEh4dmQ3OEYrWVNxbUNy?=
 =?utf-8?B?eitpM21VVm9aSVQ3NGZxdWtjYjQ0VjFmSXB1VlcxM0tLS1hvR25SVG5VVTIz?=
 =?utf-8?B?clRZOFZKSW1vTldoZkZUd1hEM1NWZ1NMdnhtWW5COVcrejlKZ01yakcrVFhC?=
 =?utf-8?B?SWFOK0srV2R2VjJaeVpSR2d3OGpma2xJWUZ2RjkwRWtseElJWWlNRzN1dk9G?=
 =?utf-8?B?dmlwSXl5d2lJb1Y5V2hvMVVTaElZVGdDcVpLMVpkWi8wUmNPelZ3Z01xalIy?=
 =?utf-8?B?MUhEQ0RVU2Nic09YY0hNTy9FTjRWOEt1ckZHU1NqUFVpTGxSOE1LeWJ4a3lm?=
 =?utf-8?B?QkNyajZrakh1amVxK09VRzFyWVpkc2w5a21kSjErTGpHcjZTbS9NRmhoMloz?=
 =?utf-8?B?MHdYazhucXNsUFg0dnFSTkJpcC9KNURFbUIrdTdIRmpQRCt4dnRZMjhOd1du?=
 =?utf-8?B?MzNJcWRCWGRSTkRjaVduVnpHSmhYK1BVczcvL2xob2xwVEgvS2I5djBVRGR5?=
 =?utf-8?B?MTBOSHZwUzBOVDRmS0Q1QThSMWhqK3FNS0REU1V2dlVZSzVpMEMvVmh5WXpz?=
 =?utf-8?B?U0VJYng1dmd2Vm5vRFhENFp6V1dSZ2NuNDFIbERUaXE1dDRqQUZ2bHg3WDQ3?=
 =?utf-8?B?SUo2clcxZHpEUTZ2YUZBOERPVjd0dlZaQytkSVM2MXp4Z3R6cEd1cmFsazU5?=
 =?utf-8?B?R0w4SzRLZlc3b21FZ2p3ZWtCcXl5MHdkSlBCNmZZTEs4ZDdIUVM0ZGt5RmdE?=
 =?utf-8?B?cktQWEtJMFdQYURNOTJPT3JnU25TRFhSMlEwNEJYcENtU2JJLzdhQlIyZ0t5?=
 =?utf-8?B?TURhb3RVWjV6eHFWNWFYaWRTT3F1WElmQlZTYlRUeVJKNklFR001WTIyOXZO?=
 =?utf-8?B?QkZiYWg5T2ZDQVgyem5iRnNxalBJQ05CK1RtbVA5bzlnMEJVNVVGVlNFbDJk?=
 =?utf-8?B?VVAvYWZoK05ITkZ1VC9wMW8zRi83REl1RklzVGNCRmJXaFl5ZThkRzE5Q2pI?=
 =?utf-8?B?ZzVTZ2pjbHlaZGlGTFFva24yaldQVUQxVDNXQ2Z3WW0vdG9aOGxja0pVbjZC?=
 =?utf-8?B?WFhyV1J5UzVUVVJhTThPbVo0VWkzZHNiTlJ1Q0dsM0JabEREL1VNNkhMeCtt?=
 =?utf-8?B?L3NkTnE3MlFBV2U0clJzWGZLLzVQMlgrNTEvOEFZU3VDU0YyS2U3VmJFTi9z?=
 =?utf-8?B?dktPbFlLY2ZPbjBYZEZlYWwvcUN2YTgxV3NsaTNuMHNhUnZOVTBsYUJqdlJX?=
 =?utf-8?B?R09TWk9vNW9JdXRpZmh3N2dUZktLZVY3YjJ4eHRkbGR5ZXhDVEJuRFhXWUY0?=
 =?utf-8?B?bjNxcnZsS2Z2TUhxNG5GZ0FRZXBlSnhnV3RGMnczMnVocG9GUHhINkJmellK?=
 =?utf-8?B?OVVyZmV6MjdWU1haZXJWckQyQmJ6bnUxakd4Uk5rbVRhL014V0ZxeVNmenlt?=
 =?utf-8?B?ekh5VWRIdnpuRnNQTW9tcElMdi9Cc3BvZ0tucG9wOC90akhSR1g2VkpsZjda?=
 =?utf-8?Q?MBDlCl6abg9hOhHND2ob3F8f18z3kY=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 19:58:21.0970 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c5bd6b-8e73-4216-dce2-08dd67e990d0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7572
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

On 21/3/25 04:18, Danilo Krummrich wrote:

> Hi Mel,
>
> On Wed, Mar 12, 2025 at 05:36:14PM -0400, Mel Henning wrote:
>> Userspace needs this information to set up zcull correctly.
> This is a very brief motivation for the commit, please also describe what the
> commit does using imperative form.
>
>> Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
>> ---
>>   .../drm/nouveau/include/nvkm/core/device.h    |  6 ++
>>   .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h | 69 +++++++++++++++++++
>>   drivers/gpu/drm/nouveau/nouveau_abi16.c       | 15 ++++
>>   drivers/gpu/drm/nouveau/nouveau_abi16.h       |  1 +
>>   drivers/gpu/drm/nouveau/nouveau_drm.c         |  1 +
>>   drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c | 34 +++++++++
>>   include/uapi/drm/nouveau_drm.h                | 19 +++++
>>   7 files changed, 145 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
>> index 46afb877a296..d1742ff1cf6b 100644
>> --- a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
>> +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
>> @@ -3,6 +3,9 @@
>>   #define __NVKM_DEVICE_H__
>>   #include <core/oclass.h>
>>   #include <core/intr.h>
>> +
>> +#include "uapi/drm/nouveau_drm.h"
>> +
>>   enum nvkm_subdev_type;
>>   
>>   enum nvkm_device_type {
>> @@ -72,6 +75,9 @@ struct nvkm_device {
>>   		bool armed;
>>   		bool legacy_done;
>>   	} intr;
>> +
>> +	bool has_zcull_info;
>> +	struct drm_nouveau_get_zcull_info zcull_info;
> This is bypassing the nvif layer entirely. I think you should store the contents
> of struct NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS in struct r535_gr and have an
> nvif interface to access the data.

I agree here, though nvkm_gr would be a better choice for a couple of 
reasons, not least that it's possible (and should be reasonably trivial) 
to support this on earlier GPUs - should someone desire to at a later point.

Ben.

>
>>   };
>>   
>>   struct nvkm_subdev *nvkm_device_subdev(struct nvkm_device *, int type, int inst);
>> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
>> index 59f8895bc5d7..01884b926c9c 100644
>> --- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
>> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
>> @@ -26,6 +26,75 @@
>>    * DEALINGS IN THE SOFTWARE.
>>    */
>>   
>> +/**
>> + * NV2080_CTRL_CMD_GR_GET_ZCULL_INFO
>> + *
>> + * This command is used to query the RM for zcull information that the
>> + * driver will need to allocate and manage the zcull regions.
>> + *
>> + *   widthAlignPixels
>> + *     This parameter returns the width alignment restrictions in pixels
>> + *     used to adjust a surface for proper aliquot coverage (typically
>> + *     #TPC's * 16).
>> + *
>> + *   heightAlignPixels
>> + *     This parameter returns the height alignment restrictions in pixels
>> + *     used to adjust a surface for proper aliquot coverage (typically 32).
>> + *
>> + *   pixelSquaresByAliquots
>> + *     This parameter returns the pixel area covered by an aliquot
>> + *     (typically #Zcull_banks * 16 * 16).
>> + *
>> + *   aliquotTotal
>> + *     This parameter returns the total aliquot pool available in HW.
>> + *
>> + *   zcullRegionByteMultiplier
>> + *     This parameter returns multiplier used to convert aliquots in a region
>> + *     to the number of bytes required to save/restore them.
>> + *
>> + *   zcullRegionHeaderSize
>> + *     This parameter returns the region header size which is required to be
>> + *     allocated and accounted for in any save/restore operation on a region.
>> + *
>> + *   zcullSubregionHeaderSize
>> + *     This parameter returns the subregion header size which is required to be
>> + *     allocated and accounted for in any save/restore operation on a region.
>> + *
>> + *   subregionCount
>> + *     This parameter returns the subregion count.
>> + *
>> + *   subregionWidthAlignPixels
>> + *     This parameter returns the subregion width alignment restrictions in
>> + *     pixels used to adjust a surface for proper aliquot coverage
>> + *     (typically #TPC's * 16).
>> + *
>> + *   subregionHeightAlignPixels
>> + *     This parameter returns the subregion height alignment restrictions in
>> + *     pixels used to adjust a surface for proper aliquot coverage
>> + *     (typically 62).
>> + *
>> + *   The callee should compute the size of a zcull region as follows.
>> + *     (numBytes = aliquots * zcullRegionByteMultiplier +
>> + *                 zcullRegionHeaderSize + zcullSubregionHeaderSize)
>> + */
>> +#define NV2080_CTRL_CMD_GR_GET_ZCULL_INFO            (0x20801206U) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_GR_INTERFACE_ID << 8) | NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS_MESSAGE_ID" */
>> +
>> +#define NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS_SUBREGION_SUPPORTED
>> +#define NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS_MESSAGE_ID (0x6U)
>> +
>> +typedef struct NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS {
>> +    NvU32 widthAlignPixels;
>> +    NvU32 heightAlignPixels;
>> +    NvU32 pixelSquaresByAliquots;
>> +    NvU32 aliquotTotal;
>> +    NvU32 zcullRegionByteMultiplier;
>> +    NvU32 zcullRegionHeaderSize;
>> +    NvU32 zcullSubregionHeaderSize;
>> +    NvU32 subregionCount;
>> +    NvU32 subregionWidthAlignPixels;
>> +    NvU32 subregionHeightAlignPixels;
>> +} NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS;
>> +
>>   typedef enum NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS {
>>       NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_MAIN = 0,
>>       NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_SPILL = 1,
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
>> index 2a0617e5fe2a..981abea97546 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
>> @@ -333,6 +333,21 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
>>   	return 0;
>>   }
>>   
>> +int
>> +nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
>> +{
>> +	struct nouveau_drm *drm = nouveau_drm(dev);
>> +	struct nvkm_device *device = drm->nvkm;
>> +	struct drm_nouveau_get_zcull_info *out = data;
>> +
>> +	if (device->has_zcull_info) {
>> +		*out = device->zcull_info;
> This needs copy_to_user().
>
>> +		return 0;
>> +	} else {
>> +		return -ENODEV;
>> +	}
>> +}
>> +
>>   int
>>   nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
>>   {
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
>> index af6b4e1cefd2..134b3ab58719 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
>> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
>> @@ -6,6 +6,7 @@
>>   	struct drm_device *dev, void *data, struct drm_file *file_priv
>>   
>>   int nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS);
>> +int nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS);
>>   int nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS);
>>   int nouveau_abi16_ioctl_channel_free(ABI16_IOCTL_ARGS);
>>   int nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS);
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> index 107f63f08bd9..4c4168b50e60 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> @@ -1244,6 +1244,7 @@ nouveau_ioctls[] = {
>>   	DRM_IOCTL_DEF_DRV(NOUVEAU_GROBJ_ALLOC, nouveau_abi16_ioctl_grobj_alloc, DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(NOUVEAU_NOTIFIEROBJ_ALLOC, nouveau_abi16_ioctl_notifierobj_alloc, DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(NOUVEAU_GPUOBJ_FREE, nouveau_abi16_ioctl_gpuobj_free, DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(NOUVEAU_GET_ZCULL_INFO, nouveau_abi16_ioctl_get_zcull_info, DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(NOUVEAU_SVM_INIT, nouveau_svmm_init, DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(NOUVEAU_SVM_BIND, nouveau_svmm_bind, DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_NEW, nouveau_gem_ioctl_new, DRM_RENDER_ALLOW),
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
>> index f4bed3eb1ec2..6669f2b1f492 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
>> @@ -34,6 +34,7 @@
>>   #include <nvrm/535.113.01/common/sdk/nvidia/inc/alloc/alloc_channel.h>
>>   #include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h>
>>   #include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h>
>> +#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h>
>>   #include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h>
>>   #include <nvrm/535.113.01/nvidia/generated/g_kernel_channel_nvoc.h>
>>   
>> @@ -244,6 +245,8 @@ static int
>>   r535_gr_oneinit(struct nvkm_gr *base)
>>   {
>>   	NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *info;
>> +	NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS *zcull_info;
>> +	u32 zcull_ctxsw_size, zcull_ctxsw_align;
>>   	struct r535_gr *gr = container_of(base, typeof(*gr), base);
>>   	struct nvkm_subdev *subdev = &gr->base.engine.subdev;
>>   	struct nvkm_device *device = subdev->device;
>> @@ -418,6 +421,11 @@ r535_gr_oneinit(struct nvkm_gr *base)
>>   		}
>>   	}
>>   
>> +	zcull_ctxsw_size = info->engineContextBuffersInfo[0]
>> +		.engine[NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_ZCULL].size;
>> +	zcull_ctxsw_align = info->engineContextBuffersInfo[0]
>> +		.engine[NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_ZCULL].alignment;
>> +
>>   	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
>>   
>>   	/* Promote golden context to RM. */
>> @@ -450,6 +458,32 @@ r535_gr_oneinit(struct nvkm_gr *base)
>>   		}
>>   	}
>>   
>> +	zcull_info = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
>> +					 NV2080_CTRL_CMD_GR_GET_ZCULL_INFO,
>> +					 sizeof(*zcull_info));
>> +	if (WARN_ON(IS_ERR(zcull_info))) {
>> +		ret = PTR_ERR(zcull_info);
>> +		goto done;
>> +	}
>> +
>> +	device->has_zcull_info = true;
>> +
>> +	device->zcull_info.width_align_pixels = zcull_info->widthAlignPixels;
>> +	device->zcull_info.height_align_pixels = zcull_info->heightAlignPixels;
>> +	device->zcull_info.pixel_squares_by_aliquots = zcull_info->pixelSquaresByAliquots;
>> +	device->zcull_info.aliquot_total = zcull_info->aliquotTotal;
>> +	device->zcull_info.zcull_region_byte_multiplier = zcull_info->zcullRegionByteMultiplier;
>> +	device->zcull_info.zcull_region_header_size = zcull_info->zcullRegionHeaderSize;
>> +	device->zcull_info.zcull_subregion_header_size = zcull_info->zcullSubregionHeaderSize;
>> +	device->zcull_info.subregion_count = zcull_info->subregionCount;
>> +	device->zcull_info.subregion_width_align_pixels = zcull_info->subregionWidthAlignPixels;
>> +	device->zcull_info.subregion_height_align_pixels = zcull_info->subregionHeightAlignPixels;
>> +
>> +	device->zcull_info.ctxsw_size = zcull_ctxsw_size;
>> +	device->zcull_info.ctxsw_align = zcull_ctxsw_align;
>> +
>> +	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, zcull_info);
> Please move this to a separate function.
>
>> +
>>   done:
>>   	nvkm_gsp_rm_free(&golden.chan);
>>   	for (int i = gr->ctxbuf_nr - 1; i >= 0; i--)
>> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
>> index dd87f8f30793..33361784eb4e 100644
>> --- a/include/uapi/drm/nouveau_drm.h
>> +++ b/include/uapi/drm/nouveau_drm.h
> Please do the uAPI change in a separate commit.
>
>> @@ -432,6 +432,22 @@ struct drm_nouveau_exec {
>>   	__u64 push_ptr;
>>   };
>>   
>> +struct drm_nouveau_get_zcull_info {
> Please add some documentation to this structure.
>
>> +	__u32 width_align_pixels;
>> +	__u32 height_align_pixels;
>> +	__u32 pixel_squares_by_aliquots;
>> +	__u32 aliquot_total;
>> +	__u32 zcull_region_byte_multiplier;
>> +	__u32 zcull_region_header_size;
>> +	__u32 zcull_subregion_header_size;
>> +	__u32 subregion_count;
>> +	__u32 subregion_width_align_pixels;
>> +	__u32 subregion_height_align_pixels;
>> +
>> +	__u32 ctxsw_size;
>> +	__u32 ctxsw_align;
>> +};
> What if this ever changes between hardware revisions or firmware versions?
>
>> +
>>   #define DRM_NOUVEAU_GETPARAM           0x00
>>   #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
>>   #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
>> @@ -445,6 +461,7 @@ struct drm_nouveau_exec {
>>   #define DRM_NOUVEAU_VM_INIT            0x10
>>   #define DRM_NOUVEAU_VM_BIND            0x11
>>   #define DRM_NOUVEAU_EXEC               0x12
>> +#define DRM_NOUVEAU_GET_ZCULL_INFO     0x13
>>   #define DRM_NOUVEAU_GEM_NEW            0x40
>>   #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
>>   #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
>> @@ -513,6 +530,8 @@ struct drm_nouveau_svm_bind {
>>   #define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
>>   #define DRM_IOCTL_NOUVEAU_VM_BIND            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bind)
>>   #define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
>> +
>> +#define DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO     DRM_IOR (DRM_COMMAND_BASE + DRM_NOUVEAU_GET_ZCULL_INFO, struct drm_nouveau_get_zcull_info)
>>   #if defined(__cplusplus)
>>   }
>>   #endif
>> -- 
>> 2.48.1
>>
