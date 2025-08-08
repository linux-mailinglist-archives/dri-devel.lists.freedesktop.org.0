Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23FFB1ED7E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 18:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047A910E034;
	Fri,  8 Aug 2025 16:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dZg06iPB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACC410E034
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 16:58:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+BJqinrH9DKmOE9S3n8TAGSHSgA6ggU5SA3bEHxy7ayj5wf7T4R5MgpQbZUp7GQsF75nVOeZooB7HOsN0l4acZrt3xW9k/lp/GAH23D+BzKRX+MA5XHU4ccB5ngWeUDBgYhjNMl5zv81Hes3wWGGMZhlWw+Kb1fZTt2EQTYMPXRui35nU/ybTDmgdzG0IMorET8k3jehfe0bQcsP1lza5n1KIaBNj5A/3UBTE0DA2Zw4jko095OD8xqiQfpNx5b6z+Bw47jYvxC7xX/1CrudCy6nDP015O3Hmr7qeXdRSBrykM+m+lqv84KDn3YcbvXeuE8KjSp/v+sxVdBHwOhbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ql1LGu946d802kVcZjJshvRvQSDkS34J/6nx02J4sIw=;
 b=rx4a//Sth4u6+KBcaI957k/h/5Cp9CLOo7wlZ46bna9vznOWcPLcpFnn7XyInnvXtdeSChF7vBpFLfPvfa3CEvkayszp58lc/Q2cB9gOnA7HRVsgf6g6Qc6DKh1MtXh4IWdR/1/SQh9pcZw56tE8RyyKYzISxCntqHVftED0U9y1fj08tjS7TsSGDq8Kpzraovb73/Jbk0jyJXfQf0LlyJSXNnX29ROQiWuhYGnulLWhDHYtzLALgMOMCzpgFt5/L3vSjSpgu/DpaxMEKVy/3vJDRBV8J2rzJAZSKJN+O8grYGZkS2y8yLI16chRdpQpzZh+zlwOsv1BcJgnUUW6QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ql1LGu946d802kVcZjJshvRvQSDkS34J/6nx02J4sIw=;
 b=dZg06iPBDjsx4SPG3Fuww5msujmUDHF1bdV50rIb2oNhkddGmjvAHnqNZa7TNIfswgspXw+lha3IcaAXq2kn1sIbFFK9CxCJNfBIJVzzO1ZPE7/bDNuhXEFmiCav7HJR7CoUo0AqaZwXYMYSPS75a0nTMmm2BvMHkYotg0+OgqE=
Received: from SJ0PR03CA0247.namprd03.prod.outlook.com (2603:10b6:a03:3a0::12)
 by CH2PR12MB4296.namprd12.prod.outlook.com (2603:10b6:610:af::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Fri, 8 Aug
 2025 16:58:04 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::9a) by SJ0PR03CA0247.outlook.office365.com
 (2603:10b6:a03:3a0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.16 via Frontend Transport; Fri,
 8 Aug 2025 16:58:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 8 Aug 2025 16:58:03 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 11:58:01 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 8 Aug 2025 11:58:01 -0500
Message-ID: <a87b5e17-2219-96fc-31d1-cdac3db8f1fb@amd.com>
Date: Fri, 8 Aug 2025 09:58:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Make function parameter names consistent
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <jeff.hugo@oss.qualcomm.com>
References: <20250808111014.328607-1-jacek.lawrynowicz@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250808111014.328607-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|CH2PR12MB4296:EE_
X-MS-Office365-Filtering-Correlation-Id: f785c4c0-9cd4-4e01-d058-08ddd69cbd35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHRtdm5QaGtaTFNwUHgvSFlqQ1pJcDlrdW1RcVgrRVE1SXk0OE5GYmlRVXVO?=
 =?utf-8?B?Q3hEWWg0dTNLUlZEWW9SWEhZZko2a2ZOcXMzWkV2WG1CQXlXYXVVZGg3Ukhu?=
 =?utf-8?B?VzRteFVVRFdWMDJPSGVDQmxHcWdFNCsvQlhPeDVPTHh0eVdSeXROb2ZudG5D?=
 =?utf-8?B?S2lwOWxTeVZ5eWlnTDZlOHhob0ZuZE1iZitaV3IzVWg1RUF5MXRLcjNkRVFN?=
 =?utf-8?B?S2I2UHR1Z1N3WDJMcGEwU09kbHkybGZTeTZkRm1FaGladWVXT0ZnZU0wNGJP?=
 =?utf-8?B?L2V1VFBIR2dXVFhmVTltd2syemtnbE5idEpFaDdrcXh4amtDZDdPT05DMnlw?=
 =?utf-8?B?RzE5ZGxlWGNSUGF0UWYrUUxRRGJreFY1UG0wc2hCZ1daNmFiaGVBQlZXODJp?=
 =?utf-8?B?RXV2M0M2L2UwZ1pjc0puWVgweS9TSEVUdWhxaEd3Q1RxdjNyVnJLeHhWRk5X?=
 =?utf-8?B?SjROWVBNSnRHcUtlaHVWa0c5d2pnWnQzd3ZFZEJnWVMxd2VCZnVHU3o2Vk9V?=
 =?utf-8?B?eSsxa3NTQk9CWWxQb1F6WStHN2lqa1dyV1lqRUJUYVV4dnVQVXFOUDkrYkJ2?=
 =?utf-8?B?NlN2YjRuVFJqVmVzZGY1K1RZMzFsNXJCbGdYZHNnOW1vL2R1eGV1OTNCV3FM?=
 =?utf-8?B?YjFkbVVxYkExMDJSU0l0U3A1aEhNMTNZOWVxT1ZsM29CaUtWQTArdTh6UXpC?=
 =?utf-8?B?eXVLMTJENW54WmtQaGpwdTN3R3NETTY3OEc5bDJaWVNxcExobGtqOVI5Wk95?=
 =?utf-8?B?VDJ1M3pQUW9oRkxiTTk3eEZPSTVRS0NYM3ByMjNGRVhtSWNuN1RGRDBnakha?=
 =?utf-8?B?RVlibVVRZGdXZjFITGVVWXZjTXUwQWRxdnFZU3JUaSt2Qk5wcy9hbXRvcVlF?=
 =?utf-8?B?YmVRNmRCSkIrQXJpWW5vYkFXMUd6ZVl4ZVRSWEdKS2RTSkd3TkJsWXAydjAx?=
 =?utf-8?B?NW5lbktnTk9ZK0VTOWhxVnNvUURuVjBQcnl6Qk92QldmZ25YUVhiR09EMGhL?=
 =?utf-8?B?QktzRWZsSzFrRllmYzFYaVBZdSs5cU4wSDZpNWswL05xOCtoWEQ2c0ordVJn?=
 =?utf-8?B?U2RET2FRZjVLZENtclJjRUFZNTdjRjZRNkNsSmlMSTFndjlFSFR2bW9vSTEx?=
 =?utf-8?B?TFdlRmUxQnRkK2NCakFpd2wraG52bndxdVlzQW1LaGFZNkpPUWFGOU5uY3dt?=
 =?utf-8?B?ek16QVNMSzZNc05sc2dYY1FLTVArQU0yUWUrM1NMLzJPS1JuYW94bEx2U0pZ?=
 =?utf-8?B?ZmpLaXpPODlMcGtWaGxiR0pBZHdBbk5WeWJZdmVpQWlBR3dFQmhldm80RFYr?=
 =?utf-8?B?UEtQSVZOSU1rd1V5Y1NYQ2lWbTNpb2xOOTBvaCtNRzVNalh5LzZZTVlRbnFi?=
 =?utf-8?B?bnhUdlRvWnAwY25BTFVOYTJ5WnRkT01wZjg0WXJ1eFl4NnBlcXZnbVlhSEU4?=
 =?utf-8?B?amdqWnYzd2RkUWlmN2JwekwvMmFTUnZyOS96VmlkVlAxWWQySzl0N3BDeTJ1?=
 =?utf-8?B?WjRyR0RjOVdPdE9kTnNsbURicnV6N1cvQnRmdlRDd1MyQ3VMSVkwVHFGalFT?=
 =?utf-8?B?VEpCUlhjUWVVQjBmYkpMbE1xVzdEU0h3YTAzajVER3JZSmlhb1NETlV3UjQx?=
 =?utf-8?B?QjFaemlvOGxsYkdoYkk1L0hZUDNYRklmRXQxamEzUW8yYXU3dzJYakV1VmIy?=
 =?utf-8?B?STUyelFYQ2daQTdwTGJTMTZLaVJoRDJTUW5rK1BrVGUxcHJhR3pQbkRpV1Fa?=
 =?utf-8?B?djhPNDNDMVBoYm5xRUczVHM5SUJQcEE0U1hEVUg0QTB3bEI2b0taZVJCTkJH?=
 =?utf-8?B?d1JxVGdLNDBzU2RFTUdpWW03dkhmaElwNkordFZKMEo3WC9UcFBTdi9aRUQw?=
 =?utf-8?B?ekRFM25aYklZVUFtcUdsTXNRTERvN0ZzMW9PdGpEdW1FRndMZ0F3V0FLVDhP?=
 =?utf-8?B?NmVQRmErc1VvWkVxdnZ0dzkzTVBKSUVHZEJXV0NSTTA5Mnd3b0h3Z2RUdzIz?=
 =?utf-8?B?NFhhdHd2c09Lclc2VzJ6Z1pSOTRFbmVNK3hReHo4UCtnU3N0N0lLTVhLOTI4?=
 =?utf-8?Q?XlNkY7?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 16:58:03.2793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f785c4c0-9cd4-4e01-d058-08ddd69cbd35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4296
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


On 8/8/25 04:10, Jacek Lawrynowicz wrote:
> Make ivpu_hw_btrs_dct_set_status() and ivpu_fw_boot_params_setup()
> declaration and definition parameter names consistent.
>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_fw.h      | 2 +-
>   drivers/accel/ivpu/ivpu_hw_btrs.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
> index 9a3935be1c057..7081913fb0dde 100644
> --- a/drivers/accel/ivpu/ivpu_fw.h
> +++ b/drivers/accel/ivpu/ivpu_fw.h
> @@ -45,7 +45,7 @@ struct ivpu_fw_info {
>   int ivpu_fw_init(struct ivpu_device *vdev);
>   void ivpu_fw_fini(struct ivpu_device *vdev);
>   void ivpu_fw_load(struct ivpu_device *vdev);
> -void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *bp);
> +void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *boot_params);
>   
>   static inline bool ivpu_fw_is_cold_boot(struct ivpu_device *vdev)
>   {
> diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.h b/drivers/accel/ivpu/ivpu_hw_btrs.h
> index d2d82651976d1..032c384ac3d4d 100644
> --- a/drivers/accel/ivpu/ivpu_hw_btrs.h
> +++ b/drivers/accel/ivpu/ivpu_hw_btrs.h
> @@ -36,7 +36,7 @@ u32 ivpu_hw_btrs_dpu_freq_get(struct ivpu_device *vdev);
>   bool ivpu_hw_btrs_irq_handler_mtl(struct ivpu_device *vdev, int irq);
>   bool ivpu_hw_btrs_irq_handler_lnl(struct ivpu_device *vdev, int irq);
>   int ivpu_hw_btrs_dct_get_request(struct ivpu_device *vdev, bool *enable);
> -void ivpu_hw_btrs_dct_set_status(struct ivpu_device *vdev, bool enable, u32 dct_percent);
> +void ivpu_hw_btrs_dct_set_status(struct ivpu_device *vdev, bool enable, u32 active_percent);
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   u32 ivpu_hw_btrs_telemetry_offset_get(struct ivpu_device *vdev);
>   u32 ivpu_hw_btrs_telemetry_size_get(struct ivpu_device *vdev);
>   u32 ivpu_hw_btrs_telemetry_enable_get(struct ivpu_device *vdev);
