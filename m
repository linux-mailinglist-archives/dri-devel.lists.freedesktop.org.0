Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE299F1B55
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 01:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903C710E288;
	Sat, 14 Dec 2024 00:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JX49Cvvy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2073.outbound.protection.outlook.com [40.107.102.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A5B10E25F
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 00:35:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrWiOveSWGvIeQBfTPHRHCwk/g/S8HrSzFBii5Jv+C5J8iLFxo4t5AH7hXFS3JvsbbASCK1UJmmeKyH8LNyHhF37YlwqQn5praoaYPtJyty5eSZfwyHYZVH7hqu3dwlsnfV8zSCDu6pBGFzfC8Se1Ui94ZKU6aXZiwHMDjLxLDMUhc5Cf8N5aguDQqIoZ+s8eaS+VJSYmVHW894nWnNwktpXJP5SnHNW3IkvLDf8UGcJwysmwdZTTfndGa3mjLoTWdr1WIt+9zu+0xZc4RRq2gcF+VSYt7GFw6NwndyIrHJOE4j48vHWT8D08mIVB3VJ98kakfl5KJ83YTYnVKwy7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+VoZrzR+sxHGnm8EYcH6gtD1fcx7HOku6Cd7FTEikc=;
 b=ZLdNOVxA5hMWNNZnkBDj7Hm/h7DQ61ES8nO5Nr/bbXgmPxWDAh9g5kIz012EAIOyHrhu/SDTEX6s6/qDBWrYRUT8ESlDHuROg7HYQDLsXkq8oD1yuSzTYIv0MGAt8akDFWhylvLlZcyohW+4PA1Pw/ADU9Hh0fEZD8Zd8AkePaCHmIB/Q6uB/HbIE7q0OI1WuHHUWA6qRva7r4PmgiPgfrNqsgzBW7KOO8GgaAlcmykqE8igCZzjHBDRgVLxi2GJg4XbT3SdYWtw7817/MR6x05Sm4G7bPwOGcU6Kee4PffH9hudQf8Vg2hbvlCDJu0vJMYpJeWa2a9Y9aEF7kAZ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+VoZrzR+sxHGnm8EYcH6gtD1fcx7HOku6Cd7FTEikc=;
 b=JX49Cvvy3Dm0CKXhja7gl6BOO/8NnOqtZW/N8CZn3OEKS6AjxGsBPo49JwjCXGnVQ4R16bChdsG5oUnK5iApX4yov0tU7fU5Oadxj0f3hw3vN0oAn/CRNJDySCBqGfaWQNJrnsdgNKcnAiKSw3nQx2FpwloDqLD73kdMz0UmvjI=
Received: from SJ0PR05CA0096.namprd05.prod.outlook.com (2603:10b6:a03:334::11)
 by DS0PR12MB8042.namprd12.prod.outlook.com (2603:10b6:8:141::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Sat, 14 Dec
 2024 00:35:29 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::22) by SJ0PR05CA0096.outlook.office365.com
 (2603:10b6:a03:334::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.16 via Frontend Transport; Sat,
 14 Dec 2024 00:35:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Sat, 14 Dec 2024 00:35:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 18:35:27 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 18:35:27 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Dec 2024 18:35:26 -0600
Message-ID: <cd442cee-a37d-7d3b-8acf-59a3b5138bf4@amd.com>
Date: Fri, 13 Dec 2024 16:35:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/7] accel/qaic: Add config structs for supported cards
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <quic_carlv@quicinc.com>,
 <manivannan.sadhasivam@linaro.org>, <quic_yabdulra@quicinc.com>,
 <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <mhi@lists.linux.dev>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-7-quic_jhugo@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20241213213340.2551697-7-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|DS0PR12MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: 1389bd9a-ca9c-4b1a-ef75-08dd1bd73577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q29OZFZkdmt3dlpHNnZXU0lNNXNVVDg5V0xVWFkremlCWE5KZU5YLzNSd3BN?=
 =?utf-8?B?R20zRGZ5MHRncHBjeE82U1RNSHVUSnNaMWlkSW1xWUc0OE9iSWt6cDErSElr?=
 =?utf-8?B?OVdyaUlqQ0hucTZvdGNWZ2Rtd0hYcllBWnoxbE15VWZ0QkF1a0R3NTE5Q1hr?=
 =?utf-8?B?c3kwMnp1NXdSRzY0alVTeFh3MGlrYnJaSncvR01PRFF3TC9mSTZRRkE4eTN1?=
 =?utf-8?B?QzRqbi90SzZaczd2SzFMUE1maFBOMWZnNGVQazBzR1Q5L0ZIbHliQVlPYjJO?=
 =?utf-8?B?Tm9MOE8rdlh0ZlMvaFhFUC93YjNWT1hkNU9IUW1valowWWc2cHBjcGRJTDg2?=
 =?utf-8?B?dEQ5UGF1Z24waEoreFhXWVIyaWJmaksvZ25DeUhBTkRDRnZodk1zUWdDRE53?=
 =?utf-8?B?amxYQzhRUzJLYnlESllYKzJ0aHRMS1RyOU1Cb3U5dzdKREFFTklkWXFFQ0Rh?=
 =?utf-8?B?anJpa2diTEN2RkgxY1JWbXVTMkRXR1kvY2JQbFNGZ1FLcFFIZFZCZWdnUm80?=
 =?utf-8?B?TGw5ODRVZXdKYkE2LzRJTGZTN05meDJBOEJjOHI4ZU9keHI2c3dmSE1EUjdx?=
 =?utf-8?B?YnJJYWxUaHlBQnk0UjNlS0xNL2kzaDRlRktuR1lCNXdLb2cxN1ZYMS9LN2c4?=
 =?utf-8?B?bGhldmFHYWdJdXRONm9Kd1RuT09HdDZrSXhSUG8vRWZwbHBsTkpiSE1RaFM1?=
 =?utf-8?B?L2VFMzBTWUplWVdYc0w1OG9ydmtyUjJ3a04rbjhTU05TbHJSOHo0RlVDcy83?=
 =?utf-8?B?cFI4QTJtekJwaDgvMGs5ajlzWnhCZHZwb3Myc1VRWUJZL1I3N2U0VEpkeU5v?=
 =?utf-8?B?cHVVMjlxQnpDTWNlZDFPM3pVQ0ZYSUJzQyswMmR1WlhBTGkyN0VJSnIvMjZk?=
 =?utf-8?B?a3ZRV2VXK2JGLzJ0V1doVG5yd29wb1htM2FhY0JWckd6S21xU202eFZBUkQw?=
 =?utf-8?B?ZkEzZy9oYVBYb1JyWnVkUTg5OVkxMnYvM1U0OUg5Z2IwUEx0N3lSTkRZUEZt?=
 =?utf-8?B?Q2tQZ3FKMHVUeTg0Q0tDL1NlUzNJMXhXZHFHWlRweXRSQjlGU0F5LzVBci93?=
 =?utf-8?B?dUlPUEhtbmIxVVd1TGxmMDZPUitNaXR2SVZveG9hTG5Gb0dwdlZaRVlFRmIy?=
 =?utf-8?B?K1FJWUFETzNnYTlidmNDZ1ZVWElrUWtzZGtlaWtCTXptbUJuYkNxcy9tM29J?=
 =?utf-8?B?VFpDQzVXaUV2VGIwTzdYaE12bTZPdTJnUGMwc1BJNmJrTXVFUmswRXBRVFRx?=
 =?utf-8?B?eXNBQXp2VVZRTE5LME5RNFJDWTJsZUlWSC9CeFUvZ3VJMko0dmp3cmlUa2No?=
 =?utf-8?B?YTlac1VSK2hrelloT1YxL0RFUFU0anZmRmFKdFJtVnBTVHJWdTlhVGYrTmRG?=
 =?utf-8?B?L2VxS3llZVMza1Y4WjEwR1ZMYkdvcWhJTWdjOVJkWFpxVWNBMDlDY1ZxaGY5?=
 =?utf-8?B?b0llSzU2Z1BBU3lTN3ZLTVFidDU3SWZ4bVpCRXB4SGhjdXhpSU1FNk9ObjFB?=
 =?utf-8?B?eDRaWnVFdlQxYmVqNnljaStoZSs1MDhyR3Q2OTVxOWJXRHFYN1g4N3lXS1Yw?=
 =?utf-8?B?N3ZRUCs5UUxmTkNzdGJSU2E1TUx0ekRmU2tRckNkYTlzcGwrbmZla2toRm1F?=
 =?utf-8?B?bWw3c2xZb21YVGdndWFlcTAvMDdlTWRseXZGa2ZHUExhdlAzWVY1YVVzaG0w?=
 =?utf-8?B?eHZnT2VTeGNxeEhoZVBpRzRmUFd5a0d4Q0IwOUx5TENISmdWS0hic1JmYWth?=
 =?utf-8?B?SW0zamlna2ZhUnBtRHpVbEtWUDVZRjNDQ1ZLcWhqV3Q5Z1BscFRUd1Q0dUVl?=
 =?utf-8?B?YUx4RlcxZnBHMEsyTmU1V2d6MFJSRjVjRW44M2Ixc2JhdWcvNDNoSnJyMklt?=
 =?utf-8?B?MGt4dXkxYXo0MmxQZ1Y2Y3NIK3NsSnJrUmVFRlR4ZzNZcUtVblpkSDEza1I0?=
 =?utf-8?Q?ToM+35g3j+wFt4WBKa1eeIe2W/OzzDiT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2024 00:35:28.3887 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1389bd9a-ca9c-4b1a-ef75-08dd1bd73577
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8042
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
> As the number of cards supported by the driver grows, their
> configurations will differ. The driver needs to become more dynamic
> to support these configurations. Currently, each card may differ in
> the exposed BARs, the regions they map to, and the family.
>
> Create config structs for each card, and let the driver configure the
> qaic_device struct based on the configurations passed to the driver.
>
> Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>   drivers/accel/qaic/qaic.h          | 13 +++--
>   drivers/accel/qaic/qaic_drv.c      | 76 ++++++++++++++++++++----------
>   drivers/accel/qaic/qaic_timesync.c |  2 +-
>   3 files changed, 61 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
> index 02561b6cecc6..cf97fd9a7e70 100644
> --- a/drivers/accel/qaic/qaic.h
> +++ b/drivers/accel/qaic/qaic.h
> @@ -32,6 +32,11 @@
>   #define to_accel_kdev(qddev) (to_drm(qddev)->accel->kdev) /* Return Linux device of accel node */
>   #define to_qaic_device(dev) (to_qaic_drm_device((dev))->qdev)
>   
> +enum aic_families {
> +	FAMILY_AIC100,
> +	FAMILY_MAX,
> +};
> +
>   enum __packed dev_states {
>   	/* Device is offline or will be very soon */
>   	QAIC_OFFLINE,
> @@ -113,10 +118,10 @@ struct qaic_device {
>   	struct pci_dev		*pdev;
>   	/* Req. ID of request that will be queued next in MHI control device */
>   	u32			next_seq_num;
> -	/* Base address of bar 0 */
> -	void __iomem		*bar_0;
> -	/* Base address of bar 2 */
> -	void __iomem		*bar_2;
> +	/* Base address of the MHI bar */
> +	void __iomem		*bar_mhi;
> +	/* Base address of the DBCs bar */
> +	void __iomem		*bar_dbc;
>   	/* Controller structure for MHI devices */
>   	struct mhi_controller	*mhi_cntrl;
>   	/* MHI control channel device */
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index 00fa07aebacd..4e63e475b389 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -34,13 +34,38 @@
>   
>   MODULE_IMPORT_NS("DMA_BUF");
>   
> -#define PCI_DEV_AIC080			0xa080
> -#define PCI_DEV_AIC100			0xa100
> +#define PCI_DEVICE_ID_QCOM_AIC080	0xa080
> +#define PCI_DEVICE_ID_QCOM_AIC100	0xa100
>   #define QAIC_NAME			"qaic"
>   #define QAIC_DESC			"Qualcomm Cloud AI Accelerators"
>   #define CNTL_MAJOR			5
>   #define CNTL_MINOR			0
>   
> +struct qaic_device_config {
> +	/* Indicates the AIC family the device belongs to */
> +	int family;
> +	/* A bitmask representing the available BARs */
> +	int bar_mask;
> +	/* An index value used to identify the MHI controller BAR */
> +	unsigned int mhi_bar_idx;
> +	/* An index value used to identify the DBCs BAR */
> +	unsigned int dbc_bar_idx;
> +};
> +
> +static const struct qaic_device_config aic080_config = {
> +	.family = FAMILY_AIC100,
> +	.bar_mask = BIT(0) | BIT(2) | BIT(4),
> +	.mhi_bar_idx = 0,
> +	.dbc_bar_idx = 2,
> +};
> +
> +static const struct qaic_device_config aic100_config = {
> +	.family = FAMILY_AIC100,
> +	.bar_mask = BIT(0) | BIT(2) | BIT(4),
> +	.mhi_bar_idx = 0,
> +	.dbc_bar_idx = 2,
> +};
> +
>   bool datapath_polling;
>   module_param(datapath_polling, bool, 0400);
>   MODULE_PARM_DESC(datapath_polling, "Operate the datapath in polling mode");
> @@ -352,7 +377,8 @@ void qaic_dev_reset_clean_local_state(struct qaic_device *qdev)
>   		release_dbc(qdev, i);
>   }
>   
> -static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_device_id *id)
> +static struct qaic_device *create_qdev(struct pci_dev *pdev,
> +				       const struct qaic_device_config *config)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct qaic_drm_device *qddev;
> @@ -365,12 +391,10 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_de
>   		return NULL;
>   
>   	qdev->dev_state = QAIC_OFFLINE;
> -	if (id->device == PCI_DEV_AIC080 || id->device == PCI_DEV_AIC100) {
> -		qdev->num_dbc = 16;
> -		qdev->dbc = devm_kcalloc(dev, qdev->num_dbc, sizeof(*qdev->dbc), GFP_KERNEL);
> -		if (!qdev->dbc)
> -			return NULL;
> -	}
> +	qdev->num_dbc = 16;

Is it better to put num_dbc in qaic_device_config?


Thanks,

Lizhi

> +	qdev->dbc = devm_kcalloc(dev, qdev->num_dbc, sizeof(*qdev->dbc), GFP_KERNEL);
> +	if (!qdev->dbc)
> +		return NULL;
>   
>   	qddev = devm_drm_dev_alloc(&pdev->dev, &qaic_accel_driver, struct qaic_drm_device, drm);
>   	if (IS_ERR(qddev))
> @@ -426,7 +450,8 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_de
>   	return qdev;
>   }
>   
> -static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
> +static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev,
> +		    const struct qaic_device_config *config)
>   {
>   	int bars;
>   	int ret;
> @@ -434,9 +459,9 @@ static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
>   	bars = pci_select_bars(pdev, IORESOURCE_MEM) & 0x3f;
>   
>   	/* make sure the device has the expected BARs */
> -	if (bars != (BIT(0) | BIT(2) | BIT(4))) {
> -		pci_dbg(pdev, "%s: expected BARs 0, 2, and 4 not found in device. Found 0x%x\n",
> -			__func__, bars);
> +	if (bars != config->bar_mask) {
> +		pci_dbg(pdev, "%s: expected BARs %#x not found in device. Found %#x\n",
> +			__func__, config->bar_mask, bars);
>   		return -EINVAL;
>   	}
>   
> @@ -449,13 +474,13 @@ static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
>   		return ret;
>   	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
>   
> -	qdev->bar_0 = devm_ioremap_resource(&pdev->dev, &pdev->resource[0]);
> -	if (IS_ERR(qdev->bar_0))
> -		return PTR_ERR(qdev->bar_0);
> +	qdev->bar_mhi = devm_ioremap_resource(&pdev->dev, &pdev->resource[config->mhi_bar_idx]);
> +	if (IS_ERR(qdev->bar_mhi))
> +		return PTR_ERR(qdev->bar_mhi);
>   
> -	qdev->bar_2 = devm_ioremap_resource(&pdev->dev, &pdev->resource[2]);
> -	if (IS_ERR(qdev->bar_2))
> -		return PTR_ERR(qdev->bar_2);
> +	qdev->bar_dbc = devm_ioremap_resource(&pdev->dev, &pdev->resource[config->dbc_bar_idx]);
> +	if (IS_ERR(qdev->bar_dbc))
> +		return PTR_ERR(qdev->bar_dbc);
>   
>   	/* Managed release since we use pcim_enable_device above */
>   	pci_set_master(pdev);
> @@ -517,21 +542,22 @@ static int init_msi(struct qaic_device *qdev, struct pci_dev *pdev)
>   
>   static int qaic_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   {
> +	struct qaic_device_config *config = (struct qaic_device_config *)id->driver_data;
>   	struct qaic_device *qdev;
>   	int mhi_irq;
>   	int ret;
>   	int i;
>   
> -	qdev = create_qdev(pdev, id);
> +	qdev = create_qdev(pdev, config);
>   	if (!qdev)
>   		return -ENOMEM;
>   
> -	ret = init_pci(qdev, pdev);
> +	ret = init_pci(qdev, pdev, config);
>   	if (ret)
>   		return ret;
>   
>   	for (i = 0; i < qdev->num_dbc; ++i)
> -		qdev->dbc[i].dbc_base = qdev->bar_2 + QAIC_DBC_OFF(i);
> +		qdev->dbc[i].dbc_base = qdev->bar_dbc + QAIC_DBC_OFF(i);
>   
>   	mhi_irq = init_msi(qdev, pdev);
>   	if (mhi_irq < 0)
> @@ -541,7 +567,7 @@ static int qaic_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	if (ret)
>   		return ret;
>   
> -	qdev->mhi_cntrl = qaic_mhi_register_controller(pdev, qdev->bar_0, mhi_irq,
> +	qdev->mhi_cntrl = qaic_mhi_register_controller(pdev, qdev->bar_mhi, mhi_irq,
>   						       qdev->single_msi);
>   	if (IS_ERR(qdev->mhi_cntrl)) {
>   		ret = PTR_ERR(qdev->mhi_cntrl);
> @@ -609,8 +635,8 @@ static struct mhi_driver qaic_mhi_driver = {
>   };
>   
>   static const struct pci_device_id qaic_ids[] = {
> -	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, PCI_DEV_AIC080), },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, PCI_DEV_AIC100), },
> +	{ PCI_DEVICE_DATA(QCOM, AIC080, (kernel_ulong_t)&aic080_config), },
> +	{ PCI_DEVICE_DATA(QCOM, AIC100, (kernel_ulong_t)&aic100_config), },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(pci, qaic_ids);
> diff --git a/drivers/accel/qaic/qaic_timesync.c b/drivers/accel/qaic/qaic_timesync.c
> index 301f4462d51b..2473c66309d4 100644
> --- a/drivers/accel/qaic/qaic_timesync.c
> +++ b/drivers/accel/qaic/qaic_timesync.c
> @@ -201,7 +201,7 @@ static int qaic_timesync_probe(struct mhi_device *mhi_dev, const struct mhi_devi
>   		goto free_sync_msg;
>   
>   	/* Qtimer register pointer */
> -	mqtsdev->qtimer_addr = qdev->bar_0 + QTIMER_REG_OFFSET;
> +	mqtsdev->qtimer_addr = qdev->bar_mhi + QTIMER_REG_OFFSET;
>   	timer_setup(timer, qaic_timesync_timer, 0);
>   	timer->expires = jiffies + msecs_to_jiffies(timesync_delay_ms);
>   	add_timer(timer);
