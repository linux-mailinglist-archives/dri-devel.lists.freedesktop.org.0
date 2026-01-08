Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2139D0533A
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 18:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E45610E7AD;
	Thu,  8 Jan 2026 17:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kAqUMR4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011037.outbound.protection.outlook.com
 [40.93.194.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE5610E7AD
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 17:52:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4TULi0ANtOybbM3Iop1/TgGIpWMO8KjY1jxYIPt6O1RVLinJMONn0/7pRIvK9dzKZBMIx23SIY90wriXqqKrlK0LlLPSfUlrSOiOeZXeZIta7daqsUqQGBwiAka/J138u0cpVPAPG2ZbHVxxZcyLok4o/JeT0T4iPNa35kyqheLVb1T84yA96mEMZIol5yhAHQiGQUAofSylTItHpcanvwvmEClLYKXGiTnu+zXW63IBIRoJO8Yp6Zfx9EbLJqmas0nt/QWcR/1IXb8oZOk+CS/noW5wwG+TX6/4nlJKZ58uH6MW+3acS7dMlunQIINIgm+7EQENRdagFOpzrdL8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uR/AJHbg3roRVC8iASbXOowufS9V4UWEFwbcGBQcJlM=;
 b=ZVEZgrQsr9gsSXY1gTv+SBESV/vjZWLSjOSNE6ZsAqsZWT00jR77Bbh5wVXy4doPebRtFe356kAMb798h42NH7hTk7WFjUhoVD4nkITBzvaMcrT1RaZAqqVN1MfdsCgnCr7RiMe5or5nucxAsTpoFtH/wQtWCEiHkAD3vYAore8jS66ix9Mb2fc09G7O60vXO3WOHFbuypeJMOe4xQqnrNruNQjhjNkzovPjZWS1HmsV0sRATVth9sDnDxT6v6UojUYxX/Y3yDpILJmeGW+uPPKJ0swOvx9UbiwOJbDJ+WUrAFPNWFiYjZYmsFmUtuU1wXmrpCizPkhFLwmCdGhiCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uR/AJHbg3roRVC8iASbXOowufS9V4UWEFwbcGBQcJlM=;
 b=kAqUMR4rfb/bD+QJIpD12RgCTtWL8WwYZLEwup/azz+kirgIxezcTeVponpsbvpGbDx9DrHEGMqMi68sUx/STkLN3OS2jQbMk4PJYTNvU9x48KHoT339VEqe9grF2r39/W9ceYzFEer3rFcCpIbNw8s1gy9ryjvEVSIc8l36JX8=
Received: from BY5PR13CA0014.namprd13.prod.outlook.com (2603:10b6:a03:180::27)
 by PH7PR12MB8178.namprd12.prod.outlook.com (2603:10b6:510:2b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 17:52:20 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a03:180:cafe::98) by BY5PR13CA0014.outlook.office365.com
 (2603:10b6:a03:180::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.0 via Frontend Transport; Thu, 8
 Jan 2026 17:52:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 17:52:19 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 11:52:19 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 8 Jan 2026 11:52:19 -0600
Message-ID: <c552e101-c1f6-fe84-9364-1ad752c1c8ff@amd.com>
Date: Thu, 8 Jan 2026 09:52:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1 2/2] accel/amdxdna: Update firmware version check for
 latest firmware
Content-Language: en-US
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251219014356.2234241-1-lizhi.hou@amd.com>
 <20251219014356.2234241-2-lizhi.hou@amd.com>
 <0eb1b06c-72be-409b-b49a-e340bf49453d@amd.com>
 <2cb7bd75-79b8-1a45-8945-0e86f86ede08@amd.com>
 <dc741e29-19bd-4de1-86bb-6bbf5799a9a4@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <dc741e29-19bd-4de1-86bb-6bbf5799a9a4@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|PH7PR12MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: 76fd1b30-ff86-4c17-0fc7-08de4edeab8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFBCbGRDOFdSWCtCVHloZ2hydmFLS0xEUUM1Uzl2a2tDbVh4VFZCdmJBaGph?=
 =?utf-8?B?S0Ezc1hnVHpJUVlSUGlUOVl6c0FqemlvdVgxZElxUDd0aGN6bENpTGNNTHU2?=
 =?utf-8?B?WlNuS2pTWURvZkZxMFppYWJBSFBZRUp4T3ZHMURadzhIUGJoSVh3ZUduSk5Q?=
 =?utf-8?B?S0VPcjdpMXRCdDRqaWtldGVieDlKRy83Z1dDaVhtVFZ5dnNkRDI3VU9kaGhW?=
 =?utf-8?B?Q3g1eE5URXp3ZFBQTWU0SzBxZE5JUFdPcisrYnk5d1Jiakg4aG1sYlhxeWds?=
 =?utf-8?B?ZGMwczFrcEhGd3ZtUjNTN05XMDRHZUNSU2tHeFgxUk56TkY0SEFJZFRmUFhz?=
 =?utf-8?B?cTg3d3dMWFEyNVA0cG5QUVhOR1FCZ3NwQy9OdHRnU2dvdzNTUUtXU00vMENh?=
 =?utf-8?B?ekExd3U4ZHlhNW4zSzNwTmY0YXlyY20xYlZQUk13VjBqMGVCYjQzUDN4dDIr?=
 =?utf-8?B?N01oVXBFak5ZOGQxa3JzZzdxK1R2SnhqWEpGRk4rSVoxSlcxU21ITzR3VFVY?=
 =?utf-8?B?bUhua3hQRVc2b0NIci9EMjJmRVBCTC9PcXR3YmhPVmhVeUtnMlB1Ulp4aThu?=
 =?utf-8?B?L1N3RFVBWWttQm1FMUlFN09CRjFTN2NnUDluem9YeU1jNzdtQnNIN1R1U3BT?=
 =?utf-8?B?b1F1WllweURKbGpIVFF2OVlaNEVtWGZtTml5bGtBdWFmNmpmeWtwRWYySUl0?=
 =?utf-8?B?RlEyUTBaSFdDSThIUXdYcEJtYmdtc0k4MXk1cUp4WnJZZzR6N1BVVzh2Kzhn?=
 =?utf-8?B?S05iTGdFQ3ZpYVRQSks1TStTN015d3NOMVA2VDB2dUpIc1NCcG1GS3hQbXdG?=
 =?utf-8?B?LytoRHE4QjFuWUhFTlBvNmtQdnl4Z1ljVlphUXFNTnBWMlpqYXdTdUlMOHlT?=
 =?utf-8?B?MEJEYXpFMGxIR0RZalQrdkpVUUJ1aE8xSEU1c3B4eXZQZHMrNHl6WlhMa29h?=
 =?utf-8?B?cFZFZHo5dmcvM1dBbzlzaHJ4N2pTdHcyS21nTEdIMTVHMFQzS1pzU1NWWitS?=
 =?utf-8?B?UTVLSFcrUUp6S1llcENjMWtHbkZ6TU9VUlpMRzlXMDVldGtETHlFRmx2N2ty?=
 =?utf-8?B?MTJUbUxwVTdSTi9UV21HZmVjUmZKcC9VRXlTcDU2OTBpVFlBL1FPekZuMmpH?=
 =?utf-8?B?eGNRcitmdmcxYkFWemNabFVQOUEzeEZDdmdCVENuUTgwOGRMNlJWOVFDZkd6?=
 =?utf-8?B?Y2xmN3pJbk5ScWx4VE9CdUVzcHAwZUNHRnNHR25JWlpmMDdqTHRqaGkxZ1ZO?=
 =?utf-8?B?eDhlRkhNUTk5SWNNWHptRXQyZVQ3SlNJU0dSeE8waC9NM0R1YU1FQ0QySmVZ?=
 =?utf-8?B?bjRlYUxBVmJKNjhsd045bFREM0drWExrMnBBYldJVnFSS25ITW9oMmp6Qmts?=
 =?utf-8?B?cmthR2NOdHBUcFRSaVgzWkV1OGNManBISHlrY1FFSkF1c1FqUDFpZ3NNRGFJ?=
 =?utf-8?B?UUtsVTZ0ZnR6TlBDTjgyTG8xaTByV2dFaFBmU3cxTkNuMWUxb2RaQmRPdTgv?=
 =?utf-8?B?a01mRHV4MkVmdlk5MElPZml0alJqbXdsTlN2UlBXVHNBdUhmWDlaZFF1SnFT?=
 =?utf-8?B?aTVzM1VVM05KMTFuUVRUZWYrYjBOVkFxUzJMMzJBUElmdHVpWm14TDlJWjlx?=
 =?utf-8?B?anFjR1lKRys4V3duY2VGL0xMVEh6dndlVDZ1dHZRNDkvWGp1U2d3U2VVUldv?=
 =?utf-8?B?RGtMK3Z0OWpxeUFyWldBSTZHQmhoNnU1cXZsakI0ajY4UW01NVBidXNJVHhr?=
 =?utf-8?B?NWFEZFUzclJtUDVmVUNOd29kUjZpU0xyc3p6MTZXQlRtYWsyZWFtVi9neSsx?=
 =?utf-8?B?d3NydGZzblJXRnhmWFBQL2Q4U1dpeGRkbjAwR1FvUTFCdnB4NHQ0NzBJUDVs?=
 =?utf-8?B?RVEzVUpLUGhWTEZRMlY2aWNaQjA2MkVLYTYrT2dISnZFNFBwcW9tTkNER2xv?=
 =?utf-8?B?U1h1UDNqVm9LaHgwODkrN2lRdzE2NUlKemxCelE2dDlkL0p2K1AwZVdCYXJN?=
 =?utf-8?B?ekJRSzc1dzd5a2d2U21mNWRmWjA5anN1ZGFVQkk0WkxtMGF4TFAwOXB3ZUVr?=
 =?utf-8?B?TzBmcVl3eFFpejZ4cVpBMnJadjMrSG5ZOEJxRUk5UFp5V2YwZHhXWlBzZHpM?=
 =?utf-8?Q?93NY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:52:19.9555 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76fd1b30-ff86-4c17-0fc7-08de4edeab8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8178
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

Applied to drm-misc-next.

On 1/7/26 19:26, Mario Limonciello (AMD) (kernel.org) wrote:
>
>
> On 1/7/2026 4:12 PM, Lizhi Hou wrote:
>>
>> On 1/7/26 13:20, Mario Limonciello wrote:
>>> On 12/18/25 7:43 PM, Lizhi Hou wrote:
>>>> The latest firmware increases the major version number. Update
>>>> aie2_check_protocol() to accept and support the new firmware version.
>>>>
>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>
>>> I know it's painful and tech debt; but I suggest you add new paths 
>>> to handle both versions of firmware at least until the next LTS kernel.
>>
>> With the patch 1, the driver works fine for both current firmware and 
>> upcoming firmware.
>>
>> Lizhi
>>
>
> Thank for confirming, no other concerns with this patch.
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>
>>>
>>>> ---
>>>>   drivers/accel/amdxdna/aie2_pci.c  | 36 
>>>> ++++++++-----------------------
>>>>   drivers/accel/amdxdna/aie2_pci.h  |  5 ++---
>>>>   drivers/accel/amdxdna/npu1_regs.c |  6 +++---
>>>>   drivers/accel/amdxdna/npu4_regs.c | 11 +++++-----
>>>>   drivers/accel/amdxdna/npu5_regs.c |  2 --
>>>>   drivers/accel/amdxdna/npu6_regs.c |  2 --
>>>>   6 files changed, 20 insertions(+), 42 deletions(-)
>>>>
>>>> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/ 
>>>> amdxdna/aie2_pci.c
>>>> index 81a8e4137bfd..181fdbc10dae 100644
>>>> --- a/drivers/accel/amdxdna/aie2_pci.c
>>>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>>>> @@ -56,41 +56,23 @@ struct mgmt_mbox_chann_info {
>>>>   static int aie2_check_protocol(struct amdxdna_dev_hdl *ndev, u32 
>>>> fw_major, u32 fw_minor)
>>>>   {
>>>>       const struct aie2_fw_feature_tbl *feature;
>>>> -    struct amdxdna_dev *xdna = ndev->xdna;
>>>> -
>>>> -    /*
>>>> -     * The driver supported mailbox behavior is defined by
>>>> -     * ndev->priv->protocol_major and protocol_minor.
>>>> -     *
>>>> -     * When protocol_major and fw_major are different, it means 
>>>> driver
>>>> -     * and firmware are incompatible.
>>>> -     */
>>>> -    if (ndev->priv->protocol_major != fw_major) {
>>>> -        XDNA_ERR(xdna, "Incompatible firmware protocol major %d 
>>>> minor %d",
>>>> -             fw_major, fw_minor);
>>>> -        return -EINVAL;
>>>> -    }
>>>> +    bool found = false;
>>>>   -    /*
>>>> -     * When protocol_minor is greater then fw_minor, that means 
>>>> driver
>>>> -     * relies on operation the installed firmware does not support.
>>>> -     */
>>>> -    if (ndev->priv->protocol_minor > fw_minor) {
>>>> -        XDNA_ERR(xdna, "Firmware minor version smaller than 
>>>> supported");
>>>> -        return -EINVAL;
>>>> -    }
>>>> -
>>>> -    for (feature = ndev->priv->fw_feature_tbl; feature && feature- 
>>>> >min_minor;
>>>> -         feature++) {
>>>> +    for (feature = ndev->priv->fw_feature_tbl; feature->major; 
>>>> feature++) {
>>>> +        if (feature->major != fw_major)
>>>> +            continue;
>>>>           if (fw_minor < feature->min_minor)
>>>>               continue;
>>>>           if (feature->max_minor > 0 && fw_minor > feature->max_minor)
>>>>               continue;
>>>>   -        set_bit(feature->feature, &ndev->feature_mask);
>>>> +        ndev->feature_mask |= feature->features;
>>>> +
>>>> +        /* firmware version matches one of the driver support 
>>>> entry */
>>>> +        found = true;
>>>>       }
>>>>   -    return 0;
>>>> +    return found ? 0 : -EOPNOTSUPP;
>>>>   }
>>>>     static void aie2_dump_chann_info_debug(struct amdxdna_dev_hdl 
>>>> *ndev)
>>>> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/ 
>>>> amdxdna/aie2_pci.h
>>>> index e1745f07b268..b20a3661078c 100644
>>>> --- a/drivers/accel/amdxdna/aie2_pci.h
>>>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>>>> @@ -237,7 +237,8 @@ enum aie2_fw_feature {
>>>>   };
>>>>     struct aie2_fw_feature_tbl {
>>>> -    enum aie2_fw_feature feature;
>>>> +    u64 features;
>>>> +    u32 major;
>>>>       u32 max_minor;
>>>>       u32 min_minor;
>>>>   };
>>>> @@ -246,8 +247,6 @@ struct aie2_fw_feature_tbl {
>>>>     struct amdxdna_dev_priv {
>>>>       const char            *fw_path;
>>>> -    u64                protocol_major;
>>>> -    u64                protocol_minor;
>>>>       const struct rt_config        *rt_config;
>>>>       const struct dpm_clk_freq    *dpm_clk_tbl;
>>>>       const struct aie2_fw_feature_tbl *fw_feature_tbl;
>>>> diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/ 
>>>> amdxdna/npu1_regs.c
>>>> index ebc6e2802297..6f36a27b5a02 100644
>>>> --- a/drivers/accel/amdxdna/npu1_regs.c
>>>> +++ b/drivers/accel/amdxdna/npu1_regs.c
>>>> @@ -6,6 +6,7 @@
>>>>   #include <drm/amdxdna_accel.h>
>>>>   #include <drm/drm_device.h>
>>>>   #include <drm/gpu_scheduler.h>
>>>> +#include <linux/bits.h>
>>>>   #include <linux/sizes.h>
>>>>     #include "aie2_pci.h"
>>>> @@ -65,14 +66,13 @@ const struct dpm_clk_freq npu1_dpm_clk_table[] = {
>>>>   };
>>>>     static const struct aie2_fw_feature_tbl npu1_fw_feature_table[] 
>>>> = {
>>>> -    { .feature = AIE2_NPU_COMMAND, .min_minor = 8 },
>>>> +    { .major = 5, .min_minor = 7 },
>>>> +    { .features = BIT_U64(AIE2_NPU_COMMAND), .min_minor = 8 },
>>>>       { 0 }
>>>>   };
>>>>     static const struct amdxdna_dev_priv npu1_dev_priv = {
>>>>       .fw_path        = "amdnpu/1502_00/npu.sbin",
>>>> -    .protocol_major = 0x5,
>>>> -    .protocol_minor = 0x7,
>>>>       .rt_config    = npu1_default_rt_cfg,
>>>>       .dpm_clk_tbl    = npu1_dpm_clk_table,
>>>>       .fw_feature_tbl = npu1_fw_feature_table,
>>>> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/ 
>>>> amdxdna/npu4_regs.c
>>>> index a62234fd266d..a8d6f76dde5f 100644
>>>> --- a/drivers/accel/amdxdna/npu4_regs.c
>>>> +++ b/drivers/accel/amdxdna/npu4_regs.c
>>>> @@ -6,6 +6,7 @@
>>>>   #include <drm/amdxdna_accel.h>
>>>>   #include <drm/drm_device.h>
>>>>   #include <drm/gpu_scheduler.h>
>>>> +#include <linux/bits.h>
>>>>   #include <linux/sizes.h>
>>>>     #include "aie2_pci.h"
>>>> @@ -88,16 +89,16 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
>>>>   };
>>>>     const struct aie2_fw_feature_tbl npu4_fw_feature_table[] = {
>>>> -    { .feature = AIE2_NPU_COMMAND, .min_minor = 15 },
>>>> -    { .feature = AIE2_PREEMPT, .min_minor = 12 },
>>>> -    { .feature = AIE2_TEMPORAL_ONLY, .min_minor = 12 },
>>>> +    { .major = 6, .min_minor = 12 },
>>>> +    { .features = BIT_U64(AIE2_NPU_COMMAND), .major = 6, 
>>>> .min_minor = 15 },
>>>> +    { .features = BIT_U64(AIE2_PREEMPT), .major = 6, .min_minor = 
>>>> 12 },
>>>> +    { .features = BIT_U64(AIE2_TEMPORAL_ONLY), .major = 6, 
>>>> .min_minor = 12 },
>>>> +    { .features = GENMASK_ULL(AIE2_TEMPORAL_ONLY, 
>>>> AIE2_NPU_COMMAND), .major = 7 },
>>>>       { 0 }
>>>>   };
>>>>     static const struct amdxdna_dev_priv npu4_dev_priv = {
>>>>       .fw_path        = "amdnpu/17f0_10/npu.sbin",
>>>> -    .protocol_major = 0x6,
>>>> -    .protocol_minor = 12,
>>>>       .rt_config    = npu4_default_rt_cfg,
>>>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>>>       .fw_feature_tbl = npu4_fw_feature_table,
>>>> diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/ 
>>>> amdxdna/npu5_regs.c
>>>> index 131080652ef0..c0a35cfd886c 100644
>>>> --- a/drivers/accel/amdxdna/npu5_regs.c
>>>> +++ b/drivers/accel/amdxdna/npu5_regs.c
>>>> @@ -64,8 +64,6 @@
>>>>     static const struct amdxdna_dev_priv npu5_dev_priv = {
>>>>       .fw_path        = "amdnpu/17f0_11/npu.sbin",
>>>> -    .protocol_major = 0x6,
>>>> -    .protocol_minor = 12,
>>>>       .rt_config    = npu4_default_rt_cfg,
>>>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>>>       .fw_feature_tbl = npu4_fw_feature_table,
>>>> diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/ 
>>>> amdxdna/npu6_regs.c
>>>> index 1f71285655b2..1fb07df99186 100644
>>>> --- a/drivers/accel/amdxdna/npu6_regs.c
>>>> +++ b/drivers/accel/amdxdna/npu6_regs.c
>>>> @@ -64,8 +64,6 @@
>>>>     static const struct amdxdna_dev_priv npu6_dev_priv = {
>>>>       .fw_path        = "amdnpu/17f0_10/npu.sbin",
>>>> -    .protocol_major = 0x6,
>>>> -    .protocol_minor = 12,
>>>>       .rt_config    = npu4_default_rt_cfg,
>>>>       .dpm_clk_tbl    = npu4_dpm_clk_table,
>>>>       .fw_feature_tbl = npu4_fw_feature_table,
>>>
>
