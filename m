Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEC59F1B7D
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 01:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F7B10E25F;
	Sat, 14 Dec 2024 00:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rt1vaKFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DD110E25F
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 00:50:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5dYCjJmN4VqgHg89dH169z0bBKlnQ8U+o8GykBxXcegZAdv3oXLVBQV0/rxBVCg2l+RubqsyGFFCKwUTm9E6e8i5uhCmFx1LMPQUs+36IBvszSIYYDT3jKurpf90OdEP8GnuZJunuF7/LCsBhng9u53cWP3jWGnJP6zVr5FgnuBaj6RlOwRRvi3h6kkIYbedysAbyS+90lBEqKK8pK/DoxnLrtoNxLEd5NYjJNlwslIiQ8HekCJ/f8NqW0iudOncVpRx8huwBG8rW5lyIl1sNkeQozr58iiRB/UMBDJWcJjNbQCiTp+Veq+8al+7PlPRQ202Rk4wdP/aQy4sFkKgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/6gDZVWX+zfbuNzHnEJI80WNK3GqCTAFvVCUjdcO04=;
 b=eJNQKKYScTGuDXKhQWeq7dpJih1DI176/BCeFntJdwbsi76/8l/ZkIWGSed4kXP335fgMLGWNACLQTEQ/rGQlAAMTltp5la5VNSbD63n/J2UizhgIIquztBBJEXPoT5Zp7BIzgda3XQyHoKWUWd/7fSSmv6eTF5lN2N9+lm9F47TftUfC/UcvmExF9U/3wjkfQLDlRdvpgzJMlMrleBvlE6f7IbgFUeWPqTVBq+dz8zkFHXj4/TGwO1uxGMHgDxcjy6eExPDt2SVIhgX6KAdmI8D4vc3hFAkb/u4EJ11lxQCWAVr+uhC3PjpbhcH0F6h4VFP8NybkuFB0yad0xN4Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/6gDZVWX+zfbuNzHnEJI80WNK3GqCTAFvVCUjdcO04=;
 b=rt1vaKFz4nEzjkp4kygnt4/QB5ZVDJgG0Q+GUw0+Jy7ad0SoBkjZKu5muRzfqtT9uLQ68NyisXACJXTkYkq2vlSR+0d3jrmDNQCBiMEFM3cmPg3+xCQv3oDy1UADyQhtZY2TOJxLDJVfqTo0qyqAdquSfiBki/IWqLuIh3bxiW0=
Received: from CH0PR03CA0320.namprd03.prod.outlook.com (2603:10b6:610:118::25)
 by SJ2PR12MB8783.namprd12.prod.outlook.com (2603:10b6:a03:4d0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Sat, 14 Dec
 2024 00:50:05 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:610:118:cafe::b6) by CH0PR03CA0320.outlook.office365.com
 (2603:10b6:610:118::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.17 via Frontend Transport; Sat,
 14 Dec 2024 00:50:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Sat, 14 Dec 2024 00:50:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 18:50:05 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 18:50:04 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Dec 2024 18:50:04 -0600
Message-ID: <65a59247-f028-28f9-1a65-5e4dd62dadec@amd.com>
Date: Fri, 13 Dec 2024 16:49:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 7/7] accel/qaic: Add AIC200 support
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <quic_carlv@quicinc.com>,
 <manivannan.sadhasivam@linaro.org>, <quic_yabdulra@quicinc.com>,
 <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <mhi@lists.linux.dev>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-8-quic_jhugo@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20241213213340.2551697-8-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|SJ2PR12MB8783:EE_
X-MS-Office365-Filtering-Correlation-Id: e96e652c-a7f5-4d04-f34f-08dd1bd94052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|7416014|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0UvNUllY3JWSk8zbmtZeDQ5bDZPM1lyZWlvL1BTTEpNMTZPV2gxTVJrblBI?=
 =?utf-8?B?MTdaVW9wYk5qcUlJV3FMQVQwaEl0b09YaXMrMHlna3NDQWVza0MwUkxJUVYx?=
 =?utf-8?B?NnRURnBXSGQ4bWEzb2Z4bnVqMjRMd0U1WE84eGxqclFzbjN0dzJNRXlGcFdP?=
 =?utf-8?B?YlVKSnhpMHkwMzFadVVTUXhlWlhXV0FnaDZDbEN2Q2duN2xvUDgrT05MY3Bp?=
 =?utf-8?B?TW9wejlQYjNNblVmTW9obktZVFhVTVE3MlIyTnArMWRpZDZPRk40U2Vlbzg0?=
 =?utf-8?B?STQwNFNzUzRtMU5mY0VWY2k3WjkzVlRSR3RZT1RzL3plVnV1M2tyUjNQT2J1?=
 =?utf-8?B?bUNueS9IRFZ3MWQ4cUs0RlJIbWU3RHRmYjJnM2I5K1l1ODM0SlpPZFFHUHAx?=
 =?utf-8?B?a21TUWhvY3pjc3hmNHJFc0dscHJEZk0rSFV3RGM4ZnpJUlcwVlZwbWExSExy?=
 =?utf-8?B?NjlLRldMNFZ1VkJTNHlMMXI4cVRFUWs4YjRYL3h2QVVvMzFuYWJoenNack4z?=
 =?utf-8?B?dFhjVHNmRWtqRjZVY3E2RzlUODdqb1hQMVo5WnJ1cEpQcTl6NWtFcUJSampO?=
 =?utf-8?B?MktQMjVVT2dlajd2VTNNS3RIamJtTlF4NDR3L1U0dmZCclB5b29FaFlVeHI4?=
 =?utf-8?B?dW9xTUlkQlJ0NmFrUkFoRU9tam12bm1pQzdwREZ1RzF5ZXpQMTUxK1FiNGEy?=
 =?utf-8?B?dXAyRnkyendaOXFXUDdseUxaV2VXeDU1bGZiNTZPaU5vWUlOYmJLbklsdmZ5?=
 =?utf-8?B?MlVZL1dFWW04eGVVc1dhOTZBRmRRWW00WXJ6RDNGQlJtN0RwRVJNeThjYmlO?=
 =?utf-8?B?U0ExdTFkalI4M3drSHordnJIYWp5MEhtSmptcTdLcEkzY21zRGNrUWJjRlM1?=
 =?utf-8?B?ZXRuS1JzeVVNM0RiMkpjbDNMb3JtMGF2TlZPOXFEbHB5L0pSaTFQYTdzejE4?=
 =?utf-8?B?VzJJbHpsSVk0UWpOOGx2YTB0Qng5dWhIMHdqRGlMOEg0K2QrYTBMVUVPenZn?=
 =?utf-8?B?OWF0U2ZtYWpFRUphd05NMDREdkRHT3VsMEszRTIwbmxYUHNBTHdpYlhTTWxC?=
 =?utf-8?B?OTdOZWFRN1N0djFUZU9pdmRwdk5ISGJNY3VDUXlRT1lROGxFUjY0cXFNNnY2?=
 =?utf-8?B?RFhLZVBCZVVpdjByaWc1K0FpQnNPVTFodHNXVlNOUkpDdkQ2YlREVmtwT3h0?=
 =?utf-8?B?TjNBL3pXY2ZFdzhXNng5MTErT3hiaVNwd0NHVldlcittRkwvZGltK05FVEUr?=
 =?utf-8?B?WUlUT2VvWisrdWhwRzdVeHBzQm1IS0xUSW1nRGl0c0dobW50cyt5OWJHSitl?=
 =?utf-8?B?emlWdFY5R3J0dVpXVnY0QklaVzZuZmt6dE1NaFNvaEx3d1E3a3BRUk5QNFlY?=
 =?utf-8?B?K3pTdUh5dmJDSHl1b05IRFRiSDFTT05ISWJNM0R5dytaVWdPcU45TWlJeXc2?=
 =?utf-8?B?OFlxVEQ0TFhsWTN2OURSMjIvaTdNTFFLb09CZndHWmlSbnFqZDlvcXhDZWk5?=
 =?utf-8?B?Q1BOYXpjeTM5VFBEODlCdE5jcm1RaUtKVmd5bFhXQXRoajAwYW0xTjVyeDdr?=
 =?utf-8?B?MldINHFUNnFUR2l4SnpkSFk4MzdKQXYrb3dKQUxYS1U0TTRtQUwzSGRFWFVT?=
 =?utf-8?B?YTVYS1BWaVJpSDdGT0RvOFZkMnJRQ29BYStwdkFRMlVNVngyaXIwdWVCU1M3?=
 =?utf-8?B?ODhsQTJjZTcwNXRQODlzVElFVEJweEZZQ29xMk5ZRjIzSDVlSFROWXg2azBE?=
 =?utf-8?B?SmErQ05ZS2c3YnMwZm9YeEgwNnBKR1dGaDRsL080K1MyNlJuc2NDcFBTeG5k?=
 =?utf-8?B?NGpZSERzaUdidTgzVG5hV253VkxUSTRWS0hGTThhUHJlRmx4aVp0SkpNRzRR?=
 =?utf-8?B?bTdxRUJCaGFJOThLZGVuL1FNQ3hUZFhhR2JFL1YxQk1ZYVNobExrbzg3TG5E?=
 =?utf-8?Q?wKnwQOlz9L61Oszu/EZnYq/z8zYyNgJh?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(7416014)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2024 00:50:05.6572 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e96e652c-a7f5-4d04-f34f-08dd1bd94052
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8783
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


On 12/13/24 13:33, Jeffrey Hugo wrote:
> Add basic support for the new AIC200 product. The PCIe Device ID is
> 0xa110. With this, we can turn on the lights for AIC200 by leveraging
> much of the existing driver.
>
> Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>   drivers/accel/qaic/mhi_controller.c | 360 ++++++++++++++++++++++++++--
>   drivers/accel/qaic/mhi_controller.h |   2 +-
>   drivers/accel/qaic/qaic.h           |   1 +
>   drivers/accel/qaic/qaic_drv.c       |  11 +-
>   drivers/accel/qaic/sahara.c         |  39 ++-
>   5 files changed, 395 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
> index 8ab82e78dd94..d68df2f6a7e6 100644
> --- a/drivers/accel/qaic/mhi_controller.c
> +++ b/drivers/accel/qaic/mhi_controller.c
> @@ -20,6 +20,11 @@ static unsigned int mhi_timeout_ms = 2000; /* 2 sec default */
>   module_param(mhi_timeout_ms, uint, 0600);
>   MODULE_PARM_DESC(mhi_timeout_ms, "MHI controller timeout value");
>   
> +static const char *fw_image_paths[FAMILY_MAX] = {
> +	[FAMILY_AIC100] = "qcom/aic100/sbl.bin",
> +	[FAMILY_AIC200] = "qcom/aic200/sbl.bin",
> +};
> +
>   static const struct mhi_channel_config aic100_channels[] = {
>   	{
>   		.name = "QAIC_LOOPBACK",
> @@ -439,6 +444,297 @@ static const struct mhi_channel_config aic100_channels[] = {
>   	},
>   };
>   
> +static const struct mhi_channel_config aic200_channels[] = {
> +	{
> +		.name = "QAIC_LOOPBACK",
> +		.num = 0,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_LOOPBACK",
> +		.num = 1,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_SAHARA",
> +		.num = 2,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_SBL,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_SAHARA",
> +		.num = 3,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_SBL,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_SSR",
> +		.num = 6,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_SSR",
> +		.num = 7,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_CONTROL",
> +		.num = 10,
> +		.num_elements = 128,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_CONTROL",
> +		.num = 11,
> +		.num_elements = 128,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_LOGGING",
> +		.num = 12,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_SBL,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_LOGGING",
> +		.num = 13,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_SBL,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_STATUS",
> +		.num = 14,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_STATUS",
> +		.num = 15,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_TELEMETRY",
> +		.num = 16,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_TELEMETRY",
> +		.num = 17,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_TIMESYNC_PERIODIC",
> +		.num = 22,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_TIMESYNC_PERIODIC",
> +		.num = 23,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "IPCR",
> +		.num = 24,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "IPCR",
> +		.num = 25,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = true,
> +		.wake_capable = false,
> +	},
> +};
> +
>   static struct mhi_event_config aic100_events[] = {
>   	{
>   		.num_elements = 32,
> @@ -454,16 +750,44 @@ static struct mhi_event_config aic100_events[] = {
>   	},
>   };
>   
> -static struct mhi_controller_config aic100_config = {
> -	.max_channels = 128,
> -	.timeout_ms = 0, /* controlled by mhi_timeout */
> -	.buf_len = 0,
> -	.num_channels = ARRAY_SIZE(aic100_channels),
> -	.ch_cfg = aic100_channels,
> -	.num_events = ARRAY_SIZE(aic100_events),
> -	.event_cfg = aic100_events,
> -	.use_bounce_buf = false,
> -	.m2_no_db = false,
> +static struct mhi_event_config aic200_events[] = {
> +	{
> +		.num_elements = 32,
> +		.irq_moderation_ms = 0,
> +		.irq = 0,
> +		.channel = U32_MAX,
> +		.priority = 1,
> +		.mode = MHI_DB_BRST_DISABLE,
> +		.data_type = MHI_ER_CTRL,
> +		.hardware_event = false,
> +		.client_managed = false,
> +		.offload_channel = false,
> +	},
> +};
> +
> +static struct mhi_controller_config mhi_cntrl_configs[] = {
> +	[FAMILY_AIC100] = {
> +		.max_channels = 128,
> +		.timeout_ms = 0, /* controlled by mhi_timeout */
> +		.buf_len = 0,
> +		.num_channels = ARRAY_SIZE(aic100_channels),
> +		.ch_cfg = aic100_channels,
> +		.num_events = ARRAY_SIZE(aic100_events),
> +		.event_cfg = aic100_events,
> +		.use_bounce_buf = false,
> +		.m2_no_db = false,
> +	},
> +	[FAMILY_AIC200] = {
> +		.max_channels = 128,
> +		.timeout_ms = 0, /* controlled by mhi_timeout */
> +		.buf_len = 0,
> +		.num_channels = ARRAY_SIZE(aic200_channels),
> +		.ch_cfg = aic200_channels,
> +		.num_events = ARRAY_SIZE(aic200_events),
> +		.event_cfg = aic200_events,
> +		.use_bounce_buf = false,
> +		.m2_no_db = false,
> +	},
>   };
>   
>   static int mhi_read_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr, u32 *out)
> @@ -545,8 +869,9 @@ static int mhi_reset_and_async_power_up(struct mhi_controller *mhi_cntrl)
>   }
>   
>   struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
> -						    int mhi_irq, bool shared_msi)
> +						    int mhi_irq, bool shared_msi, int family)
>   {
> +	struct mhi_controller_config mhi_config = mhi_cntrl_configs[family];
>   	struct mhi_controller *mhi_cntrl;
>   	int ret;
>   
> @@ -573,6 +898,13 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
>   	mhi_cntrl->nr_irqs = 1;
>   	mhi_cntrl->irq = devm_kmalloc(&pci_dev->dev, sizeof(*mhi_cntrl->irq), GFP_KERNEL);
>   
> +	if (family == FAMILY_AIC200) {
> +		mhi_cntrl->name = "AIC200";
> +		mhi_cntrl->seg_len = SZ_512K;
> +	} else {
> +		mhi_cntrl->name = "AIC100";
> +	}
> +

Only AIC200 needs to set 'seg_len'? Maybe these hard coded settings can 
also be in qaic_device_config?

It might be better to move after the following check at least.

>   	if (!mhi_cntrl->irq)
>   		return ERR_PTR(-ENOMEM);
>   
> @@ -581,11 +913,11 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
>   	if (shared_msi) /* MSI shared with data path, no IRQF_NO_SUSPEND */
>   		mhi_cntrl->irq_flags = IRQF_SHARED;
>   
> -	mhi_cntrl->fw_image = "qcom/aic100/sbl.bin";
> +	mhi_cntrl->fw_image = fw_image_paths[family];
Maybe fw_image path in qaic_device_config?
>   
>   	/* use latest configured timeout */
> -	aic100_config.timeout_ms = mhi_timeout_ms;
> -	ret = mhi_register_controller(mhi_cntrl, &aic100_config);
> +	mhi_config.timeout_ms = mhi_timeout_ms;
> +	ret = mhi_register_controller(mhi_cntrl, &mhi_config);
>   	if (ret) {
>   		pci_err(pci_dev, "mhi_register_controller failed %d\n", ret);
>   		return ERR_PTR(ret);
> diff --git a/drivers/accel/qaic/mhi_controller.h b/drivers/accel/qaic/mhi_controller.h
> index 500e7f4af2af..8939f6ae185e 100644
> --- a/drivers/accel/qaic/mhi_controller.h
> +++ b/drivers/accel/qaic/mhi_controller.h
> @@ -8,7 +8,7 @@
>   #define MHICONTROLLERQAIC_H_
>   
>   struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
> -						    int mhi_irq, bool shared_msi);
> +						    int mhi_irq, bool shared_msi, int family);
>   void qaic_mhi_free_controller(struct mhi_controller *mhi_cntrl, bool link_up);
>   void qaic_mhi_start_reset(struct mhi_controller *mhi_cntrl);
>   void qaic_mhi_reset_done(struct mhi_controller *mhi_cntrl);
> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
> index cf97fd9a7e70..0dbb8e32e4b9 100644
> --- a/drivers/accel/qaic/qaic.h
> +++ b/drivers/accel/qaic/qaic.h
> @@ -34,6 +34,7 @@
>   
>   enum aic_families {
>   	FAMILY_AIC100,
> +	FAMILY_AIC200,
>   	FAMILY_MAX,
>   };
>   
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index 4e63e475b389..3b415e2c9431 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -36,6 +36,7 @@ MODULE_IMPORT_NS("DMA_BUF");
>   
>   #define PCI_DEVICE_ID_QCOM_AIC080	0xa080
>   #define PCI_DEVICE_ID_QCOM_AIC100	0xa100
> +#define PCI_DEVICE_ID_QCOM_AIC200	0xa110
>   #define QAIC_NAME			"qaic"
>   #define QAIC_DESC			"Qualcomm Cloud AI Accelerators"
>   #define CNTL_MAJOR			5
> @@ -66,6 +67,13 @@ static const struct qaic_device_config aic100_config = {
>   	.dbc_bar_idx = 2,
>   };
>   
> +static const struct qaic_device_config aic200_config = {
> +	.family = FAMILY_AIC200,
> +	.bar_mask = BIT(0) | BIT(1) | BIT(2) | BIT(4),

Will this pass the BAR mask check in init_pci()?

Thanks,

Lizhi

> +	.mhi_bar_idx = 1,
> +	.dbc_bar_idx = 2,
> +};
> +
>   bool datapath_polling;
>   module_param(datapath_polling, bool, 0400);
>   MODULE_PARM_DESC(datapath_polling, "Operate the datapath in polling mode");
> @@ -568,7 +576,7 @@ static int qaic_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   		return ret;
>   
>   	qdev->mhi_cntrl = qaic_mhi_register_controller(pdev, qdev->bar_mhi, mhi_irq,
> -						       qdev->single_msi);
> +						       qdev->single_msi, config->family);
>   	if (IS_ERR(qdev->mhi_cntrl)) {
>   		ret = PTR_ERR(qdev->mhi_cntrl);
>   		qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
> @@ -637,6 +645,7 @@ static struct mhi_driver qaic_mhi_driver = {
>   static const struct pci_device_id qaic_ids[] = {
>   	{ PCI_DEVICE_DATA(QCOM, AIC080, (kernel_ulong_t)&aic080_config), },
>   	{ PCI_DEVICE_DATA(QCOM, AIC100, (kernel_ulong_t)&aic100_config), },
> +	{ PCI_DEVICE_DATA(QCOM, AIC200, (kernel_ulong_t)&aic200_config), },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(pci, qaic_ids);
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
> index 09c8b055aa81..3ebcc1f7ff58 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -188,6 +188,34 @@ static const char * const aic100_image_table[] = {
>   	[10] = "qcom/aic100/fw10.bin",
>   };
>   
> +static const char * const aic200_image_table[] = {
> +	[5]  = "qcom/aic200/uefi.elf",
> +	[12] = "qcom/aic200/aic200-nsp.bin",
> +	[23] = "qcom/aic200/aop.mbn",
> +	[32] = "qcom/aic200/tz.mbn",
> +	[33] = "qcom/aic200/hypvm.mbn",
> +	[39] = "qcom/aic200/aic200_abl.elf",
> +	[40] = "qcom/aic200/apdp.mbn",
> +	[41] = "qcom/aic200/devcfg.mbn",
> +	[42] = "qcom/aic200/sec.elf",
> +	[43] = "qcom/aic200/aic200-hlos.elf",
> +	[49] = "qcom/aic200/shrm.elf",
> +	[50] = "qcom/aic200/cpucp.elf",
> +	[51] = "qcom/aic200/aop_devcfg.mbn",
> +	[57] = "qcom/aic200/cpucp_dtbs.elf",
> +	[62] = "qcom/aic200/uefi_dtbs.elf",
> +	[63] = "qcom/aic200/xbl_ac_config.mbn",
> +	[64] = "qcom/aic200/tz_ac_config.mbn",
> +	[65] = "qcom/aic200/hyp_ac_config.mbn",
> +	[66] = "qcom/aic200/pdp.elf",
> +	[67] = "qcom/aic200/pdp_cdb.elf",
> +	[68] = "qcom/aic200/sdi.mbn",
> +	[69] = "qcom/aic200/dcd.mbn",
> +	[73] = "qcom/aic200/gearvm.mbn",
> +	[74] = "qcom/aic200/sti.bin",
> +	[75] = "qcom/aic200/pvs.bin",
> +};
> +
>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>   {
>   	int ret;
> @@ -748,8 +776,15 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>   	context->mhi_dev = mhi_dev;
>   	INIT_WORK(&context->fw_work, sahara_processing);
>   	INIT_WORK(&context->dump_work, sahara_dump_processing);
> -	context->image_table = aic100_image_table;
> -	context->table_size = ARRAY_SIZE(aic100_image_table);
> +
> +	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
> +		context->image_table = aic200_image_table;
> +		context->table_size = ARRAY_SIZE(aic200_image_table);
> +	} else {
> +		context->image_table = aic100_image_table;
> +		context->table_size = ARRAY_SIZE(aic100_image_table);
> +	}
> +
>   	context->active_image_id = SAHARA_IMAGE_ID_NONE;
>   	dev_set_drvdata(&mhi_dev->dev, context);
>   
