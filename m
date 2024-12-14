Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED16C9F1B4C
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 01:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14F010E111;
	Sat, 14 Dec 2024 00:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EQKIIosT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E94A10E111
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 00:20:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HoVNPJDkWdpzB99GEq0pNOSz5htRowS/IV4bLBMmjJJXpjOJflO6chyLtWErb5lF7kL8JXRI5DWpXFiFg2s6Cj/lGt7uV6XMrvx4cmtxi4q+5e2wfEYsXikAS6RAL6NMFhlkKYlAfHmohyLH5u+FykNYTYMZC2uRYaFKtAeOIH19Qo+oaVJMEzcOb/JIFcMBAy4Ry3Oji67rW2HJqGNQ+lbMe/nzRQQWlDTGf0z4s2w3mVp+KTM1CqKgQPrrzLIiV4vgc0/irhUfoUptWkQtMji4KimiVDym2uxkkEU1giEwWidOyZH96SZ+24h6tS1494pZjJUvW7HGFt3+CnDkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xX97zkA2rTC2NexnNGIn5iHT676cOL+OghAfgA5qcLA=;
 b=gmhkDNdtEUHItgfNxmbjl4ZDtV0QjC49Gy9QtY+W9023PuaWflUpfQwMoui+dFmpHuNFmAXZkbLPioputwghUvQKfZrViaKm/f0EgDobTDrWcU0B7AwwLMQJWoDDWkv4dwQoyvMkjhvJL9QzSWsX4lrrHUQzQm+qBY2D8eNjmoPwYKifFX2ROwq6x5PLbZKwDkuCbNVJnhNMPBV/3AKLHmOVqv0rFY9KeAh6GQVWZ+FqzwpPLtT0XbmieAZN5dKl/rkyhJ20jp/SMs74uMSPqwFxK/hKN0zzdMRq3FdmvDYlyhjaLWFDRXx+tAMaeq4h3tHqkGTwC+W6s9QsVTEOag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xX97zkA2rTC2NexnNGIn5iHT676cOL+OghAfgA5qcLA=;
 b=EQKIIosTB3bfwWDYOXO4xvB286jG00SwArusjz5UXcIQuYHxCZNB9CSFo7UVSYOOYS69WEguVHFnhPY8vCXKjepIxQWglTueljMG5QHzeJvQ2nCiOsI4x1fxtY16+py7FdPBtuP14N/jLc5PI9HXzGx06bTGdyC+u4pTmmWRM1c=
Received: from SJ0PR05CA0125.namprd05.prod.outlook.com (2603:10b6:a03:33d::10)
 by CY5PR12MB6201.namprd12.prod.outlook.com (2603:10b6:930:26::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Sat, 14 Dec
 2024 00:20:10 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::c2) by SJ0PR05CA0125.outlook.office365.com
 (2603:10b6:a03:33d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.14 via Frontend Transport; Sat,
 14 Dec 2024 00:20:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Sat, 14 Dec 2024 00:20:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 18:20:08 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Dec 2024 18:20:07 -0600
Message-ID: <730f1e2f-d69b-e142-62aa-3f9971129a8b@amd.com>
Date: Fri, 13 Dec 2024 16:20:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/7] accel/qaic: Mask out SR-IOV PCI resources
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <quic_carlv@quicinc.com>,
 <manivannan.sadhasivam@linaro.org>, <quic_yabdulra@quicinc.com>,
 <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <mhi@lists.linux.dev>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-6-quic_jhugo@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20241213213340.2551697-6-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|CY5PR12MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: f53afad6-00ed-42cd-7cb4-08dd1bd511da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dW9OMVRqZVhsY3ozVzRJT0UxQUVhcXc4MDVWeVNNSjhzOUNrNDdtWGxmVnQ4?=
 =?utf-8?B?a3lVZm8wVWJSdk1IRlBuSEk0T1gxRHlzOHJvVTRhdkk0WWFkblI4VlNRL2NG?=
 =?utf-8?B?MGsxMjdRUTUwYjJYb0htL1MwQ09zRUlmZHlJMTd3MHJBWFdFdGo2ZWxJNVo1?=
 =?utf-8?B?aGY3STJwK20ybnVlWWRKTXFVVU82UVZwbEhlSzBIVVZUWXN1d25aeUkyZ1Aw?=
 =?utf-8?B?YWF2Rnl6NFp0bWxJbTdrMHBVSXVqTmNsWVFhbitZVUdkd2NnZm1KV3V3VzZl?=
 =?utf-8?B?M0R4dThxWHExRTZUSzExSDQ4UEd1cUIxMW5HcWx6YkgyaHNzd3MrWW9FeVQy?=
 =?utf-8?B?RElncU9YRkpNdmF2UlFvNVJPU2thZGZRQVorN3dPVGtGUENzRjhyRjVUVHBM?=
 =?utf-8?B?UkJBb0JqeG9RQzNYOEQwcFlLbE5nbUtnWnZQVXNBc3NIWkZBUzJ3QmlicXJV?=
 =?utf-8?B?Wmxoa0dZVVg0OFhiUCtZa2kwd011RmVXc0Z4d2RWT0xpZVpLN1JXWEJyTEFi?=
 =?utf-8?B?SUFVRFYwd3lXUENZRlY0VmpsVFAwUUJ2b205V0xud2w5UmJoZEwyWlJpakRM?=
 =?utf-8?B?TXo4dS9ML1IwWjMzUFlpZlp0YVhoR0FuVzZoTTJac0Y2OG10aXA2WTdrVG0w?=
 =?utf-8?B?QjVnaHlhUTRyRU5icmZwajFlMGRXWE54eVFQbklCV08ybjF1ai9NZ0lOcFd5?=
 =?utf-8?B?Z1NxODM3V3I4VkxHY1pQSVdUN3V3ODJSVzc2QUJpVWc4UEszSjdIazBmNy9L?=
 =?utf-8?B?V0ZxSWFoSXBBS1hyNDh4Sjdtd3lybjlmUDJuTGM5UFpYd3RaRWl5S2dQSHpk?=
 =?utf-8?B?dFVsQlFKSFdsazNkTDhzRVU0b2YwY3JsZWtyTzlhcFlPQ2lGOHVzMWtMVEtt?=
 =?utf-8?B?dTgvNTM0d3VPR0o0R1pIY21SZVRsUmU5TlVxRG52TWltcWdDTEZ0RGxwaFdk?=
 =?utf-8?B?UFVWdW43YzEyTW10TFBoTVRNMUVDYm1qQU9zMi9ESitSSXJVUnpCWEljT1h6?=
 =?utf-8?B?QXRySFdiMDcxQXZJMUxpOXJYakUyWWpRdGJoWU04L3VBWUVxcUM5MnlUTnpm?=
 =?utf-8?B?eEVHcjdON1pkMUJYN1Erdnc5ZkJJczB5UldNRy9HTWQzemxOMFk1NWh0MHcv?=
 =?utf-8?B?UTRWOVllQURtTlRkdzZINFJFRTBjV3JOZE0vdzVLc2RtemIyVUlZT21rMTZQ?=
 =?utf-8?B?clNVM1QvcTI5NEsvQmdSTUFVdGxTSzBrcVdJWWZiL2NQZ3VoVldLSzh2Q2I5?=
 =?utf-8?B?aURyc2hoUkJYNWNadkQvZnZpejlGZ2d4Y2V1K2Jsdm9xV1M5cFNtaE9qRDBB?=
 =?utf-8?B?VzhsNWdoMWMyN1dWZGNRcGpiMHBIZlRVK2RDV0pHcGlxa2cwK0p5QjJIU0w0?=
 =?utf-8?B?eEM1TEZVS1RrWDIyZjBNZm1GdXl0bUF0S0NPVmZSajNLdmxUT2xBZXVhWk82?=
 =?utf-8?B?WUcyWWlnNEhWVy8wc01QdVF2cHJ3MDF4dTBTOUl1VEdSRzl0RU1tTUhEVHhF?=
 =?utf-8?B?dDRzMUN3MGFaRmx3OXJpYWJpeHBROWNtSFA0cm8rNzdXOW5hRGF6bzdxOXc4?=
 =?utf-8?B?ajgwb0tmUkJwaXc4ZGs3NURZN1AyeWxyTm5YRHhSZzlaNWxXVXZsQWpram55?=
 =?utf-8?B?WExsSWt2SUJOL3RXazF5UVczWGZmbTVVS1o1dUJvWU5TQ1ZUU3U3SDEyVE4y?=
 =?utf-8?B?R2o3TFY3WkdZQWgxUlBZbEZjUlFKSFo1V09udkFzRk41TUV3QWxXNDM0UXFI?=
 =?utf-8?B?aE9ML2JGZk5QcENkSW1vRWhBTHdZdVZpMm5WMS9jd29FcDJzVUJhalJMS2Iy?=
 =?utf-8?B?TTREV3EwMFdqWnZqMVJuQ0RPL1g3VWFLODRlK2NqUE9TL0l5OThWcGlmUUFR?=
 =?utf-8?B?bkFOSDlPM2hlMW95MW5DamFUbmZmK25DMllKVGs0a3QxQlAyTUhwOXc1aTUz?=
 =?utf-8?Q?q9ji2E7YpkBxbV++h1Yi16K83YNnouVO?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2024 00:20:09.6743 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f53afad6-00ed-42cd-7cb4-08dd1bd511da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6201
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
> During the initialization of the qaic device, pci_select_bars() is
> used to fetch a bitmask of the BARs exposed by the device. On devices
> that have Virtual Functions capabilities, the bitmask includes SR-IOV
> BARs.
>
> Use a mask to filter out SR-IOV BARs if they exist.
>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>   drivers/accel/qaic/qaic_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index ce0428f6cb82..00fa07aebacd 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -431,7 +431,7 @@ static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
>   	int bars;
>   	int ret;
>   
> -	bars = pci_select_bars(pdev, IORESOURCE_MEM);
> +	bars = pci_select_bars(pdev, IORESOURCE_MEM) & 0x3f;
>   
>   	/* make sure the device has the expected BARs */
>   	if (bars != (BIT(0) | BIT(2) | BIT(4))) {
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
