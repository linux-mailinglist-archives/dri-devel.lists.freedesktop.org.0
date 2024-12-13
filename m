Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D780A9F1A49
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 00:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D124410E164;
	Fri, 13 Dec 2024 23:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="t5XfY9Nj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2056.outbound.protection.outlook.com [40.107.95.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE3410E164
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 23:49:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoIdGOJo3edCtusAkefliHwqmw+IlpMFYu3fGxyS6FhpATP0h9J2c6KLEa4QPlZG0PtPnN8DHkePasnGTJB5GlcTHXh3pD5Xgdf1pdliZDx1Nnom0wh1kxay1giD2Q35SHUl+QQMwys4unxQC4/MLCYGXtcjB+Hw5wsZLsVKbKVdjH+jteLYhmzFgbPJl8tP6RrcFvIB7nfrHSFidMM4F3QcOtn6yccTN+Ybfl534GhQzkStyaj4v1+QvxiHF9FBseck5j3BN9jpnWsodbQupYG7vJYe9i0AGKchIT/n7gyeWn2JAXzKXjQ6DBV33A/fzfJUy/hqWAs3fCiQAfNTiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbcysCWtXDff3S2yVd66QZuQXB8jtLaoCbrrCqjU3Fs=;
 b=Twc03otlR887QuxnyROsDk8Z/9CekF+MnecL0hOxp5Iw9/uU40axLHvppin/vyO6NkdKxJFn/w3f8liHLY7iU3ZluS8dP42BegPEObGCpvF3HA+2vn+XK89KpteA6S6FMS51Elwdm56ktAb1wj6XMkfC4LLiPQWjg5xp4Qj0PoybFze0/OpEleywj2WipjPhL/DOD9L4vTvFOLqUR1gpTegus6zQbnpYnsOjzd8F/5s3xM177+pYmraARPloo7ZAhL8cGk7afGq9LCTXnE0AuZR5F9cZvjtgXEuGOxDFb/H/ujsGuTcmYzyXmOSGFMJms461DZ5l16pZEkvJP8d4xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbcysCWtXDff3S2yVd66QZuQXB8jtLaoCbrrCqjU3Fs=;
 b=t5XfY9NjKA3RSxZl8NCGTjPrOXwIAlBmwS3PV1ojQdOSZY6VcuwQl4hAvno+wknp+4fT/tux65WUwzT61HoWF2TipyMuYopuaXht9UXUrfUf6zns6Bt1rYwPN48fTQoJU9CIZ3Fcg6nYxZzV56M7uX0x/LuNQjXh9XXRIhQjKp0=
Received: from SN6PR16CA0069.namprd16.prod.outlook.com (2603:10b6:805:ca::46)
 by SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Fri, 13 Dec
 2024 23:49:37 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:805:ca:cafe::c8) by SN6PR16CA0069.outlook.office365.com
 (2603:10b6:805:ca::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.16 via Frontend Transport; Fri,
 13 Dec 2024 23:49:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 13 Dec 2024 23:49:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 17:49:36 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Dec 2024 17:49:35 -0600
Message-ID: <b37593bc-e311-b1d8-4ff0-f7b4c65f5eae@amd.com>
Date: Fri, 13 Dec 2024 15:49:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/7] accel/qaic: Add support for MSI-X
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <quic_carlv@quicinc.com>,
 <manivannan.sadhasivam@linaro.org>, <quic_yabdulra@quicinc.com>,
 <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <mhi@lists.linux.dev>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-5-quic_jhugo@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20241213213340.2551697-5-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|SA0PR12MB4413:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ee91826-1161-4bd7-cd64-08dd1bd0cd6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHpZR0trSmswV1Q5N0FSSlFPRy9HdU1hYkJSODFPcEhmZE42cTQ2Ly9uQW5K?=
 =?utf-8?B?OTlDV0Jsc09McURpOXRjeldDYmdaY00wdkxTN2NhQVJNUjRhd1dsdk5Obmxo?=
 =?utf-8?B?SGNaUWJhUDA1dU1vYkVLY21taytHUXJhU1NUWDRTOHZnQ20vV2xneGJaSWc5?=
 =?utf-8?B?S1Evc3hTTWNrTmVKd0diSnY0eTFTNERIMlVvWW1JMk41N1RTakJuejZLaktX?=
 =?utf-8?B?c1UyZTRwWmlJeEtwS2lxUXlORTVwcXkxc1FMU0tSTmZDM21PZlN0b2l0THdV?=
 =?utf-8?B?VjQyR0Ercm5HL2pyT0lzWHRuejRmRXBuWExpalpnU2NFYlF4bnNoWFRtcThh?=
 =?utf-8?B?MHZacXVzVjJWMmpRNnN0Zm1yL0toRGxyNGVtSWRkc0NIbERYdG1PZm1aaW1D?=
 =?utf-8?B?djV3L3grVEsxUmNEbVJlU214UkROOEJJblZuYjNBcDlSZ0k5OXpFMnRyQVl3?=
 =?utf-8?B?dzJjTmV1MWhSVk9LdzJtOWpMNnIzZ3YyNWtJZXlPZENWUnlVdERFM2NIM2pv?=
 =?utf-8?B?MHFONWt6OFI0RmczcmVPU0xIb1JnNXhxSlM5RlNuT0pKRmFDV2FNOUkrTG1J?=
 =?utf-8?B?TG9FU0gvMU5HUjN3LzErM2VTK1dSM3A0N3JRYUNTdDZzNTRybW1icUVobU9Q?=
 =?utf-8?B?WTljbi83YkpKVnFmQWVJYlkzRzNQTFg1ZktxWnVnN3VCZFpReUVjT2ZraytP?=
 =?utf-8?B?dDdWbHVlTWdrQVRnZGg4ZTZjeDFva3FRajJ6MWhQdStZWmhVRVVtM2xtQ1ZO?=
 =?utf-8?B?ZXg4eThzZmJTNE5TeWxEenZLZExjdjQzWTlJOTBPYkovcFczNmVUVVp1YWlx?=
 =?utf-8?B?NHByT1dNUkc4YzMxVXFMZHE1WFpaSFZIUmgrcXdpNHFxazJ2cS9SdEpiYkNz?=
 =?utf-8?B?Z1lZNWxyMXNFaWg0Vlh6MHRYNS9NOUd0SzY2Vk54ZnBKOUM0SWVSc0JZQUVF?=
 =?utf-8?B?VjJGVi9DcFN2anBpc0pmQU93YUZwazZma2QvWDJBTkVYNHJNVE5QVHRxaWZL?=
 =?utf-8?B?dGFYWmxoTVpDV1dDU1Z2YTJVVW1wQ05oTTVKQkErSVhoTkNGSWJ2OVYxT2FP?=
 =?utf-8?B?ajN4UkFJVUdtT0creGp3S3BtZmw1VTJJeWhvTHZrK3VrRm8xVURtVUV6QVRT?=
 =?utf-8?B?RFo5bXQxSHNmaEpiM3JJN3Z3SUd6VkVxNi9ndEhRSUFVV2gweUxiRXhIV2pn?=
 =?utf-8?B?YmVBR0JNc0tRTnVXakEvME8rQTVrWmZJQTZia2JwSGJESlRlcHhMK0YwbnZv?=
 =?utf-8?B?TUpmWTZDcnpwNTljYkNPY0xUMkt6eTZuRlcwbmdYWHNYLzVSWXdwTXNZZ1Rt?=
 =?utf-8?B?YXNzbk5aTE5KeTJwcG5zK25DMk0zOE1IRXd2NWYzMDdRU01KR2czRHlkTVBE?=
 =?utf-8?B?Unh2VHd0MnpEMWEyNVZkWW1WdzBkZ21VKzBYZy9UV25GOTJZdkE2QnJkVTBH?=
 =?utf-8?B?cTk1Q09iZ3VOYWR0ZzdRZWF1TkMrdVYzakMyTjl2R1hKenJ5eHRUMGtWRm1p?=
 =?utf-8?B?ZkhlRW90bXdTY3l2NTlwM3orV3VzNkZGNFcreU9GREIzdGJwT0RWLzRISjJQ?=
 =?utf-8?B?MDdvdWVHQ3VqMmVYSjhhdUxmZFZtMUpvcnpZdzZlSHhXa3BEYjZrODNDb1BF?=
 =?utf-8?B?QnZkTGUvWXJGc1RuZXhuR0gyOXgxWmdaWFpMOWtVRFpoRkx1VUJvQ0xmWXht?=
 =?utf-8?B?UkFzeks1OW93ZXZjK0xYVFNDS3dBVEpLbVBFeXg5bk1NNHVqQ0JQNHp0d1Nm?=
 =?utf-8?B?WUJvTkU2dlFKeHVySis2M1JEWFRKeDk2WFc5cVhkazdha0ZUT2ZZN2lWZnUw?=
 =?utf-8?B?czFiYndwRFNpWEthN1l1emZ0Z2o4S2VES1RueG96UFRXLzN5cUVzVjQrQ2Nq?=
 =?utf-8?B?aUVTMm9wWHIvOWQ5cmNhS211UHdTcGVTSzdSSjU2VWZJVXZ1eTVLK3dVdXU4?=
 =?utf-8?Q?v+gqx/CmYId0ht5CUn8YuSN7HhyYI111?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 23:49:36.9303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee91826-1161-4bd7-cd64-08dd1bd0cd6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413
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
> AIC200 device will support MSI-X while AIC100 devices will keep using
> MSI. pci_alloc_irq_vectors() will try to allocate MSI-X vectors if it
> is supported by the target device, otherwise, it will fallback to MSI.
>
> Add support for MSI-X vectors allocation for AIC200 devices.
>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>   drivers/accel/qaic/qaic_drv.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index 6e9bed17b3f1..ce0428f6cb82 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -471,9 +471,9 @@ static int init_msi(struct qaic_device *qdev, struct pci_dev *pdev)
>   	int i;
>   
>   	/* Managed release since we use pcim_enable_device */
> -	ret = pci_alloc_irq_vectors(pdev, irq_count, irq_count, PCI_IRQ_MSI);
> +	ret = pci_alloc_irq_vectors(pdev, irq_count, irq_count, PCI_IRQ_MSI | PCI_IRQ_MSIX);
>   	if (ret == -ENOSPC) {
> -		ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
> +		ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX);
>   		if (ret < 0)
>   			return ret;
>   
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
