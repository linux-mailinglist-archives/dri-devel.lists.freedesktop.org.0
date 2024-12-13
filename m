Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C12E9F1A42
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 00:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BE910F120;
	Fri, 13 Dec 2024 23:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lnKxZX9d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5192910F120
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 23:43:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uY6RPR47xEnq8RvZ7pch5QQGkq1ZVZ7/9phel97r92rc3Utyc87yWRR3QAzJsfU2wBQtV4DCXHGmSRaiW7wmSTt0yopdlrDkZ6DHR+ESveH69OO8da0zGxhVYnEtmupUyd6qQQUilyNwBLSN4pshEwzgL/HR3K+CjMU4ozyq2Wb1AWTtGCBbSt3Pm/1cn354PCii71z/ASib0dyDyKCKNI8AlWTSpacAAZaJTXm3nAFb5TgyDSJcB8w8t2WEZFK+ou9/Enqtf1xzQCsdQ45xvEQ2EjYLTiQahHEfeeEpoL7dnl2hMTNXKXSaXiZ4IDXybhF9QFkKDQdD02wR2LNXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FG8JmJv8Y/hQ7KXnJIgm28Sf43galGuhUYMjnRaOge8=;
 b=qyrJYnXY7Ygx4K573go6SQmY0zfZuOay9uG63TLjYun5x7HgHCUWd44Q4RjPpl2hkQbRMu7g4UWa7DGLKucqZ9LhH6Qny1NpmfcNkQW7rbnxVkPlRckTTvZ1Z+z+4PzmwPFr/ZbLdIXJJxs0mlb1QRLg8PZvgta4sZaDYywg/7P4fmI23flGJX2U57fSo0tZtYYsHjg/arehrHavc+HnAmlEzNu/mYSJrFGG3AebPEPtnh8VUvdopnhZ//VVI1DY51MjZpn6VHxX9+RBgM/yiI64tqymb/I/gaYgQxohuMzKova+7xnjNaFw8ibV2CWDL5+UchzXzgoC8VnhP+n3bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FG8JmJv8Y/hQ7KXnJIgm28Sf43galGuhUYMjnRaOge8=;
 b=lnKxZX9daz8xjuoKdsqSfVdqgoOSLaZC0j6nrxHMFNe9buxtoq7XGrt37zwWaUlhfSKo5VtGedSgJfGRv9sg5+K5qHLzYINtXSDij0+vqc9xhlBoH7HypOLEbp4YJi6u6JcUQ+4PHFjyfjiSX/OmX8Ga3mDWthlJbyRo1nA6Tkg=
Received: from DS7PR03CA0013.namprd03.prod.outlook.com (2603:10b6:5:3b8::18)
 by DM3PR12MB9288.namprd12.prod.outlook.com (2603:10b6:0:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Fri, 13 Dec
 2024 23:43:27 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:5:3b8:cafe::4e) by DS7PR03CA0013.outlook.office365.com
 (2603:10b6:5:3b8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.17 via Frontend Transport; Fri,
 13 Dec 2024 23:43:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Fri, 13 Dec 2024 23:43:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 17:43:26 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 17:43:26 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Dec 2024 17:43:25 -0600
Message-ID: <6c866fe1-8d25-aceb-8f5b-0f2d40abcf6d@amd.com>
Date: Fri, 13 Dec 2024 15:43:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/7] accel/qaic: Allocate an exact number of MSIs
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <quic_carlv@quicinc.com>,
 <manivannan.sadhasivam@linaro.org>, <quic_yabdulra@quicinc.com>,
 <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <mhi@lists.linux.dev>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-4-quic_jhugo@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20241213213340.2551697-4-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|DM3PR12MB9288:EE_
X-MS-Office365-Filtering-Correlation-Id: c6afd317-45ab-4415-e5ba-08dd1bcff0fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0NwOFJzVDZoRFVtTVJzenBOaFUzY21GdGFzVi9qcTJvTS9lQUw1aFMzRVV6?=
 =?utf-8?B?Y1ZMWGh3cmlyR0NnMzNFR1NtUktrZldnZUZnSzZEU1hOMlMxaUdwdlVKeXdo?=
 =?utf-8?B?a255UUgxR0x5RU1RR2xiK3Zna2JLUlJTNmNyUm1TdTRkUUxhNWo4OWUvakh2?=
 =?utf-8?B?bUhJSEk3UlhCcVBDUnNHVnE5WTB2emVKMDlnNU40dit2NmxIS1M3eXd5QmxQ?=
 =?utf-8?B?aUswVDNEOFE5ZmZEblhlOFNsR25RSFJIeXVsbnNYU3kya2tPL2dCaE4zaDZl?=
 =?utf-8?B?QTJqSnVkdVBQMWtDWHgrbkdsMU5kZmE1Q2dSM3dIS0l1QVNjUGVlVnNEYnhS?=
 =?utf-8?B?aEhoMzdRNXlkNCsyTXNLNzFZc1dVTEltTlkvRnk5M3E3RXVqT1lVVitqS3ZG?=
 =?utf-8?B?YUpzNk1oVGZVaG9raTZqUWNpWUNyQ2RIVjhBV3UvQmcrSml5MXNLWlBtOUh6?=
 =?utf-8?B?TUNyeGtsbk54WDA4UFROREptZEpBTHR3RndYc2JWUkJzaHpGMllvMWRxTS82?=
 =?utf-8?B?Wk82Z0tGVG90T3FBZVU3Wkx1MkpuZkQ0ZVVNTjNoS1c2cUZibUpGWmRGSnFy?=
 =?utf-8?B?Umh3ZnQ1MnVTQWxwWm9pbTh2aFNkeUlwL2FHQ1VWRWxiZTN5RUV2QTF2RGls?=
 =?utf-8?B?UGFoSWlVWkRyZm5xUjZPQWRwWWZlWVJYNmJpaVpvdHJkWHFOL2g4QTJ3NlJy?=
 =?utf-8?B?MC9PeWg0SnFDVTQyRklySEV1dVBrTDJWdVk4VzdvV05Gb2NRMkc1OENGS3pw?=
 =?utf-8?B?K0lPTnZDcGhWazdmbWp0ZExJcXM5OUl6dno3SEVqWXVlb1F5VmdNd2d3WEMx?=
 =?utf-8?B?dFJwNVh1NS83bk1pblNZOGdtazQ5SExNQXVWU1VhNlFrRWpBR044dWUxaUhp?=
 =?utf-8?B?UnNjcnBpTkFtSUNMR3JNOEIrdjZ5eC8reXJlR0UzU3JaMWV1YWJsZlA2aTk0?=
 =?utf-8?B?cENaTk5FVnJIbENDVWZ1by9BMlYzb3VXQllwWFNIWVI5eXpFVG5CTHl3Zm51?=
 =?utf-8?B?WnFhbmpkdXQxTzY5SlljM0RaUjJSSlAyZHBSTU9VcTJYRXRHdkF0dWRKTzA2?=
 =?utf-8?B?YVV0blRPN0h6L05VUHZaMzQyMDR4MU10SWhrYXRRaWFUZzJFTklVRGNJZDVk?=
 =?utf-8?B?ZHE5UjMzR2MyR09rUk9LMVg3QjFuVTVGbmQvWG1Bb0t6UmFJcG8rcS9UZDh3?=
 =?utf-8?B?ZitOQzU5dWVHQUxSNjR4NWlXUVArWXNMcEpZVll6cUduc05LdU56TmFEdmox?=
 =?utf-8?B?YTRBeS85d1JsUmJsNUpRUldLWUlWY0ZRbDR1dDNOSkkyamlFd1pQQ3NqU2Qv?=
 =?utf-8?B?VmFuVTFhNGhUN2hmaitnZC9QOVlBdzZWaGZDSGdNTGRSYXlVSER0UXN0UkJE?=
 =?utf-8?B?bzZzVWlFYUI3M2tScFFlZ0FYWmd1eVI5amVHWGljVXRLdGxhbkRBSnpWUEhB?=
 =?utf-8?B?QytZakNVS3BoQktZOENtc2RyVnFXcDJlSW9NSndPL0Q3UXFpZ3R1bVZxUDd4?=
 =?utf-8?B?c2dsb1BNbE9Bcm02SVF0WXk1cHJKbmNMcm9CUjI0U2RtMHNXREk2REEyVkxP?=
 =?utf-8?B?VTIrMkJFWTBMc1pKQVNURlp3T0txemJHRXRJL1ZObE5lWXgvNTFUaW9DN1BT?=
 =?utf-8?B?bFpWY2NpOHpvV0Q4Z3lIdmR4ZEhRVDIzRlVWcStENDRIMGRuQmczbEtnbVRR?=
 =?utf-8?B?QUdtZy94Z1JUQmJscndabHdXd3VZTjdRRnFjL2s2SW56d0hUK0s2M3dzazc3?=
 =?utf-8?B?UGxqNlpjVm9pVndqYmVhTVMrdlVmMTZiWlRYRzlZQjMxWFozOHBxS3ZkMFJH?=
 =?utf-8?B?SC95NFgzRHMvUzNubVhPVXM1TjNBdVlqVGlsczQ3ekRPRUhEUTZMNzRVSXNO?=
 =?utf-8?B?dm9rYnhyS3l0TFBzd0lwK2dUYlNjOUZFWnJLSmxEcVBFSnRwVjFTQ2x3Znl4?=
 =?utf-8?Q?KzfutjeA9H9dKgAU93Tw3X0lfB+s+Ttq?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 23:43:27.0957 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6afd317-45ab-4415-e5ba-08dd1bcff0fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9288
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
> From: Youssef Samir <quic_yabdulra@quicinc.com>
>
> Devices use 1 MSI vector for the MHI controller and as many vectors as
> the DMA bridge channels on the device. During the probing of the
> device, the driver allocates 32 MSI vectors, which is usually more
> than what is needed for AIC100 devices, which is wasting resources.
>
> Allocate only the needed number of MSI vectors per device.
>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>   drivers/accel/qaic/qaic_drv.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index 81819b9ef8d4..6e9bed17b3f1 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -465,12 +465,13 @@ static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
>   
>   static int init_msi(struct qaic_device *qdev, struct pci_dev *pdev)
>   {
> +	int irq_count = qdev->num_dbc + 1;
>   	int mhi_irq;
>   	int ret;
>   	int i;
>   
>   	/* Managed release since we use pcim_enable_device */
> -	ret = pci_alloc_irq_vectors(pdev, 32, 32, PCI_IRQ_MSI);
> +	ret = pci_alloc_irq_vectors(pdev, irq_count, irq_count, PCI_IRQ_MSI);
>   	if (ret == -ENOSPC) {
>   		ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
>   		if (ret < 0)
> @@ -485,7 +486,8 @@ static int init_msi(struct qaic_device *qdev, struct pci_dev *pdev)
>   		 * interrupted, it shouldn't race with itself.
>   		 */
>   		qdev->single_msi = true;
> -		pci_info(pdev, "Allocating 32 MSIs failed, operating in 1 MSI mode. Performance may be impacted.\n");
> +		pci_info(pdev, "Allocating %d MSIs failed, operating in 1 MSI mode. Performance may be impacted.\n",
> +			 irq_count);
>   	} else if (ret < 0) {
>   		return ret;
>   	}
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
