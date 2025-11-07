Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC380C40F52
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 17:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DE010E103;
	Fri,  7 Nov 2025 16:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zGHP78wb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011068.outbound.protection.outlook.com
 [40.93.194.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D9910E103
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 16:57:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Go4wpySoH3ry3wUP90OXMkvQnoI3NtXTQxtWUEpZU8fUBOCPNZihWi4kYotYkG9CuGokzDBGkvG0v5iIwRtC3nzF/gze9HG6tV0Kpst7pUmsG1gxMccgoEad9CH4riuLIG23Omgh2xBqK7ee8bNZUJG27iPWYpOs+Nb7lMXUzsaQ8qSigI3X7GLIo5eXNtPwrOcfBpDhO/gl3ITn7O9wpkxztxzXFSq6kUoweWyk9UfsRE9gFKUtNuCyFfY7+jSuAorEBSdwnPTxRoPRMQ2v9XqM2Eq7Buex+12hUONTRdl4cOboyKjwwRneRpdeFZhXivaGkahV180a4sA9US4B4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmWwot1++YJUNzgqkRNs7sJL7Mr7rA5NBk2k9Z07JRs=;
 b=TE9yZ9JqVpLbAH7Nis0C91xwrxgUls3tR4hPobgMKrKmHGThy8xIKzhgMtQ4gcUxHMNUJ/VRtnihnoxuhADSzyCB1YhyPMHFGsR45Ceq3iBl7gpbmfkKa4RwGzmvlGFCF2HV4VHc5LNJ6np8bnTjCFGzZVwxKLpN+3BYluqyseDK8AE0dBbAEfJfbtWKnPFW/DznZwhJ5vqvSwiVKcRX2+L+kvoyFk2qK5i/TZIjqEWFg/IDW3PV5ytQKsptmQp45lCc3/6YTSGbvHga+2TyDIH4Na7FTzxE2yU6HyM0hMlTA5/1jMl4qgMH5ulCh+8Q+3zIG38zifjDV7kK99CsHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmWwot1++YJUNzgqkRNs7sJL7Mr7rA5NBk2k9Z07JRs=;
 b=zGHP78wbxU9zQi9W50TDkQYYiWZpZUFxo7iJSozQj+apWHyGWQ2Ih8tW7ULksTV5dIGgh6jc8YQuk1bsg7x1nmSnIJ6Pbr9FZBWDMfMi3RZDCYKfoinPYVrGVsBkz6eKURRL4KEErCoI/cfeT+MbzO+gp7Pu6B2L+xoHc4HSdO0=
Received: from PH8PR02CA0036.namprd02.prod.outlook.com (2603:10b6:510:2da::28)
 by BN5PR12MB9510.namprd12.prod.outlook.com (2603:10b6:408:2ac::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 16:57:22 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:510:2da:cafe::13) by PH8PR02CA0036.outlook.office365.com
 (2603:10b6:510:2da::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.13 via Frontend Transport; Fri,
 7 Nov 2025 16:57:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 16:57:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 7 Nov
 2025 08:57:18 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Nov
 2025 10:57:18 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 7 Nov 2025 08:57:18 -0800
Message-ID: <2888a0ce-6d30-1911-0870-0ea37e392cbc@amd.com>
Date: Fri, 7 Nov 2025 08:57:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Treat power-off failure as unrecoverable
 error
Content-Language: en-US
To: Mario Limonciello <superm1@kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251106180521.1095218-1-lizhi.hou@amd.com>
 <d21ece5b-d27b-447f-8a8e-5d672fa0c473@amd.com>
 <978dcea6-4d25-3b33-695a-632a9f58884c@amd.com>
 <2dcb4668-2c4d-4c73-9805-1af1338c9e7d@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <2dcb4668-2c4d-4c73-9805-1af1338c9e7d@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|BN5PR12MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 285997f6-47e4-4fc3-4040-08de1e1eb7f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cldUYnRSTTJSMVBEOGxETFM2TXJNMENVVWhkblF4bHdOVnYwUnhoUGNUZDgr?=
 =?utf-8?B?NkpDdGM4U2tBZ0dtRFdhWmtLNG1Bemt4emJKaDBiNDNCNWxJV1ZEZ2l3bnkx?=
 =?utf-8?B?ckpzR0ora3RpcVdDNnRyMHpVRGlNaldyN1pQR0VqU0k3NGtIaHRndHpSYXc1?=
 =?utf-8?B?ZStEMGp4UWhZV1JIall6QWhBTjF5eCtwcXg4dDRzT1dzNEZwbVU4OHhPUkcw?=
 =?utf-8?B?a3lhSVJoMTFMWk5heTVFM2oxVks1WUhHRFFJNGdKMDYxVkcyY3FHaDI0NVJr?=
 =?utf-8?B?RzNITTF6OUxNb21MYzBHZ3lvOUFLbHlncGpKczhOdk92cmhQa1Z0M3JlLzNI?=
 =?utf-8?B?SXhBK3dkZERaNXJSM01jOVExdmpjQURpRHhuYmR4dUVCQk1WaExQZW5NYnUr?=
 =?utf-8?B?OFVUd2tDdEFybnJlYzhzaGlDcUZjVXBpSkFXK2hmVU11TFJyNTdkOGRqR044?=
 =?utf-8?B?cCtOUTF4cnRzaFAwL1c3UFFUSkhlOEdxUzZiREJtV3VYSjdpc0dGT1R6enI1?=
 =?utf-8?B?a1Y2cjlBV2VBazYxQ09TSmlMa1dlRllvanA1blhBTDR5TDJXZnkvNmtreE1K?=
 =?utf-8?B?eXJ5cTE5SG50RzUvSUl5T0kvMS94ZHh1QVdDQmM5d3BxcWJ1L01jSFQ1M1pI?=
 =?utf-8?B?UTdkNmh3N0dSZEZyTm1STHVQeVF0eTFxc1Z0djhkNy9kZkVJYTBrYzdKanZK?=
 =?utf-8?B?ZWcrN0V5d3M0R3VuaTRVMHpQSWVwMDl0WHdSTmxRWnZsZ3FEazJFZHhNeFNm?=
 =?utf-8?B?ZDFrRE9YNHo0RTVzallldXg3N0MybmlHeXBPMzlSZkNwdmx6aWIwZEEyQzU0?=
 =?utf-8?B?TFlXcG5sbmZLZ2VhbTl4bk12SDZ3SzcyYmdqbDFXSmd5TGI0RG9OSTdUQ2Jz?=
 =?utf-8?B?dFZuU3dsL3I0SDF5TzlIay9EVGhMWmM3S2FhM3g3Ti9vNUFCVml4ZEJQWmU5?=
 =?utf-8?B?c1J1M2FXanNKeDNHSm85KzJjaU1zRndnUyt6bm9CaVBCVXlTejEySCtydlVt?=
 =?utf-8?B?em5UUzhGekttQU1ObGdVQzYwMkV5bkFVZmlzN2ZYWlFYVjl4T2hGalo1SDNH?=
 =?utf-8?B?MXZsZ3RndnZiTTBkNW5LczFGRTBkclc1RDN2VndBUXhrS1I1Y3ZBVndDUFVR?=
 =?utf-8?B?M2VaZHkzRWZlS1FGQWJ0QXNoVjIzbGo0a2FXSGt6NmhuZFhxZGFsTmJXTU9X?=
 =?utf-8?B?Qko0OUlNRFg3S0xqNVRZNGpnRlJ0cExQQTRHS2ZMNkxjM05YV2RDWWt2S0VM?=
 =?utf-8?B?VnFnOGdtaUhDRm5LMkNPZXdDeHBHODF3WFYzb1VCMnp6ZUpiTzB6bWFSVEFh?=
 =?utf-8?B?VHppOWRESGZZUmJtVzE5ZTM1TXN2RzN1Q1BzSkR5YXpDQ25ISUoxY2txQ0VL?=
 =?utf-8?B?ejZicHhrY3I3U0t4WVBHcVZsM2NKN1MwT2F4T09Ga0xzK2huL1Njd3ZiTExU?=
 =?utf-8?B?TEUxV1RNNFhIdFhnMHlpOHVnR0dFZU5McWtJOHI2ekhzeGFxOEdWZTY0ck83?=
 =?utf-8?B?VTZHa1VjMmFCSFVraWR4MDd0MC9MSTJQZ0tOMVo0YVhGVjJrT3dVTEtDSUNB?=
 =?utf-8?B?N3BJTmVNZUtoZ0FhTGNnRC9hb3lmb1dvVEZNVWtFWWpRdXgybEVRZVFiVlhQ?=
 =?utf-8?B?YWhvTUhhWW5vcnl2aWtyZlNyRTlqdDFZUUJ1cGhWdFFtSW0yTVRseFh3SVpn?=
 =?utf-8?B?WngzU2UvMElJazQrZXd1WWQ4SEhvdDlhc0Z5dXB0cTBsazBjNFkrU01vMWVq?=
 =?utf-8?B?UTl1TjVHaWQwTk9NR3JxYUhST1NwK2VLMDJDMlA1T2dvVjNoOGY3OHkvZWds?=
 =?utf-8?B?bW1zS2RRMFYzY0FwWEg1Y3MwanE4bE9UR2xHYUhUa0hKZk9qT3RqSy9PK1Jz?=
 =?utf-8?B?ZEVROTFRaU0zaTI5Tmt0cSs0Z1lqMFdZMUp2dlQyZTNHaG1MMmJCZHNrdllG?=
 =?utf-8?B?NjI0S0gyRmI3M2M2b1d3aGJXYXhiNzZBT2Y1cmNUbTl0WUdCR2dUODVtdDZp?=
 =?utf-8?B?d1VaNkdWOGxyUnNmWlo2NTlsMTJYdFZ5Z1ZlR0hFVDRzWTNoV1JpZ2xPcHlC?=
 =?utf-8?B?ZzlsSWwvc3FrK1hTbXhlSC9LSEZnZkJWSXBKNlBZWlp2ZEZHdEhibUtsQXVQ?=
 =?utf-8?Q?wSks=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 16:57:21.6664 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 285997f6-47e4-4fc3-4040-08de1e1eb7f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9510
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

On 11/6/25 10:31, Mario Limonciello wrote:
> On 11/6/25 12:19 PM, Lizhi Hou wrote:
>>
>> On 11/6/25 10:12, Mario Limonciello wrote:
>>> On 11/6/25 12:05 PM, Lizhi Hou wrote:
>>>> Failing to set power off indicates an unrecoverable hardware or 
>>>> firmware
>>>> error. Update the driver to treat such a failure as a fatal condition
>>>> and stop further operations that depend on successful power state
>>>> transition.
>>>>
>>>> This prevents undefined behavior when the hardware remains in an
>>>> unexpected state after a failed power-off attempt.
>>>>
>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>
>>> Presumably all versions of hardware in the wild can handle receiving 
>>> a power off command if they're already powered off?
>>
>> Yes for the aie2 platforms. This was verified by xdna-driver pipeline 
>> tests.
>>
>>
>
> OK LGTM then.
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>
>> Lizhi
>>
>>>
>>>> ---
>>>>   drivers/accel/amdxdna/aie2_smu.c | 10 ++++++++++
>>>>   1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/ 
>>>> amdxdna/aie2_smu.c
>>>> index 11c0e9e7b03a..bd94ee96c2bc 100644
>>>> --- a/drivers/accel/amdxdna/aie2_smu.c
>>>> +++ b/drivers/accel/amdxdna/aie2_smu.c
>>>> @@ -147,6 +147,16 @@ int aie2_smu_init(struct amdxdna_dev_hdl *ndev)
>>>>   {
>>>>       int ret;
>>>>   +    /*
>>>> +     * Failing to set power off indicates an unrecoverable 
>>>> hardware or
>>>> +     * firmware error.
>>>> +     */
>>>> +    ret = aie2_smu_exec(ndev, AIE2_SMU_POWER_OFF, 0, NULL);
>>>> +    if (ret) {
>>>> +        XDNA_ERR(ndev->xdna, "Access power failed, ret %d", ret);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>>       ret = aie2_smu_exec(ndev, AIE2_SMU_POWER_ON, 0, NULL);
>>>>       if (ret) {
>>>>           XDNA_ERR(ndev->xdna, "Power on failed, ret %d", ret);
>>>
>
