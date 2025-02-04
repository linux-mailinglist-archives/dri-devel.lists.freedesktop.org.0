Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26029A278ED
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 18:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D4010E6D5;
	Tue,  4 Feb 2025 17:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jMCSX4/E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9564510E6D5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 17:46:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNNzk3Fdq0oCEcOLgUHoxG+RQtsIju7bVZlE0aYiVviOX3ssGJCE6dFqzFQPRKTdyCJqxBb1wlacbFK7zjyG3sASltXW20Nlh5SGuvuznn0pv9f9ejCM6JnLbkIToiOchGB+VHTmiNupdH74T+j8ZrCRkVw6jcFLLEG7O7zwaN8nqX8I7niJ85Oai4tARD6DzR1/qyfoT75/6gixMjLrdZa26YEgw0UBOP3g54V1YqTndx6L2OUnAnby37fjHmiBIouW50/iNgRhZpwpWu4zHB7ssUnSa54tKotfYcLkPYqTpD1N6i7N2q9WU8miKyH6TOAmrnTpU/BJ7FIzeVZ3eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZyeUl322VlsQXbZjpXAk0k3j13/bW3w4hxrNBgqylY=;
 b=EmMKJK3pjlsEHW+HH9AIzRPSuGOZ6i2dwwET9zbc8PvcMRp82pNx9nbFu/iRJ0lq4WQjLdNwQC9hizC/92hTmFc2NLCLV23cQHJsQs7fJSA9uPSUVu5fvusbbWRPR34tlvtKCcUfckFbUQ7uC6Iq/0O0l5gJY+lZXMVjm2MfouQwLDEUsi1X2GNq7lEVFImWUOerXGNX+DidAJTyc/WjkSJu1N2UuHXVOrQKcXFiukXSK7F5hemHOt0yBsSS/fgIU/TQiWi2d1X0R6zNMewE++87nCXAbQ35ajZMoyJGxoeoxvQJEBS9UGph6Hj3L+yHXdHirNNq1leHzNNQZTGbnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZyeUl322VlsQXbZjpXAk0k3j13/bW3w4hxrNBgqylY=;
 b=jMCSX4/EZv4a/V1lB8W26SHUCJ8Gl4SmULGe9+6q0A7405+3RpH2JAxi1etCi1nk5+xoVTN9O0gIjpFmk5mI6i/KLES4K2z5/Hoi7HKtJVnp33zQJmwxwbh5k2HurOAY9/gTeyIcg2Nd244RbIx3W4jNgHr2gQGCpkbg32AH5A0=
Received: from CH5P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::21)
 by SA0PR12MB4415.namprd12.prod.outlook.com (2603:10b6:806:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 17:46:28 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::e1) by CH5P221CA0011.outlook.office365.com
 (2603:10b6:610:1f2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.27 via Frontend Transport; Tue,
 4 Feb 2025 17:46:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 4 Feb 2025 17:46:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 11:46:27 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 4 Feb 2025 11:46:26 -0600
Message-ID: <f26de849-0805-75fd-7234-3c2116be14f8@amd.com>
Date: Tue, 4 Feb 2025 09:46:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Add MODULE_FIRMWARE() declarations
Content-Language: en-US
To: Mario Limonciello <superm1@kernel.org>, <mario.limonciello@amd.com>,
 <min.ma@amd.com>, <ogabbay@kernel.org>
CC: Renjith Pananchikkal <Renjith.Pananchikkal@amd.com>, Alexander Deucher
 <Alexander.Deucher@amd.com>, <dri-devel@lists.freedesktop.org>
References: <20250204174031.3425762-1-superm1@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250204174031.3425762-1-superm1@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|SA0PR12MB4415:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a645f2-2b9f-41b2-89c9-08dd4543da1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2V0dUJUc1JHT2JJdmQ1ZjZQREpZa2Q4NmZzSHpjN01vU0FVY0dvVk0wMllp?=
 =?utf-8?B?dm4rRllFREZtcDZEcmt3YVZjTzVzbFN0NVZUWHJOdUFSV2FLR3lqS05qcjl1?=
 =?utf-8?B?VmZBNGIzVTM0clhRY3NzR1hPNmdscUZXZmV6M283Z1BjSnp4V28yUG5DWXFD?=
 =?utf-8?B?T3ppWjN5OE4xdlpYM0x5YkZEV1ZpcUZJQzhwbEUrVFduQ29nMlhVeGVlNWUw?=
 =?utf-8?B?eGIrMnYveDA0RVJpR2plQk5JeVBHaFViVzZPSnZpOXR0cXpRQXZjTi9CKys2?=
 =?utf-8?B?bjIrcmh3WE1KTldRZUphbkhEUExvNmxwWjFqK0xhVXN6VW5Kbm0wd3pzUUh2?=
 =?utf-8?B?VnJtNDNDeXptS0pCMXRaeGNuNUdMcGhjQkhyenhQMk9uQ1dlMitmb2FReFJX?=
 =?utf-8?B?Q1M5MVhydHE3TlZkUjZ1a3VDU0RoUFRTL1drNjdjRlZDK2dWSmtVeHlaY2Rs?=
 =?utf-8?B?ejVQRTMwZ21XWlpUT2FNVGJFWWlSaGcxbGpVYWU5cXFQaUVuL1AvdStobUh2?=
 =?utf-8?B?SXNFdHJoYk16ZEV0cTR4MzB2TmZQaWI0M09zcDZGRVBqT3B2SW9DQk5EcUhw?=
 =?utf-8?B?Si8wU1hCc1dzZzVFQXJwK1Z3MkJkVUJuYmZRV0xLdjZ2T3hiUXdiRHF4SUR6?=
 =?utf-8?B?R0F3S0dpb2swaWY3R2g0dTFOc1BpM2VyY1FSQkE2L0FDWjVONVhxZ1JKSFk4?=
 =?utf-8?B?SUJEQ1NLQnRMMVF1L0JtM3lsRHNPbjFDaEdZcTk3MVJ1dXRoMExMNVBHY1Rw?=
 =?utf-8?B?eGxYRE9pMks4QTlhNWliTEZ2N2JaRFllcmVCNzcyemZDVGRZMHpFQ1BKb0tI?=
 =?utf-8?B?VlAzZjRiVHUxN0hkbjdkajcyYkpTNkRtL242SnNaNFhhclc1bm5mR0FKeW9y?=
 =?utf-8?B?Rm1ob3dNVjZ0b0YrS0l4QUN1VHBNb3V3Um4ybndlVGp5cytYK01SR3VoY1Jt?=
 =?utf-8?B?ekpzbFMvZnFTMzVHYS9aamNxd0NmeGJsRnU2NWl5TWNWckFXa0VKaHdOVXVL?=
 =?utf-8?B?THNSY2YxSXNlb2NaeVNIalEvdDVHV2p4SVNHM1Zqc0JOTDFiQ0E0MFN0NVdP?=
 =?utf-8?B?RC9wQy81Q0cvL01vRU5UMFRHMzNiRlc5clVaUjM4ZjZTMGdFdDdmSVlJWUlp?=
 =?utf-8?B?YUpZdFRmYStkeHR4WklGYldHNnpoV2ZMMHZ1RlMvZ3FBRDBwVXJoTFpqR3Jq?=
 =?utf-8?B?c2o2bUNPRFRwRHQzNVZseEgvYVM5UzN5dnZ5NTE4bWt4eWRQU0lkNnpoQlRH?=
 =?utf-8?B?eHFHTG8yaXpkNnpkMmxCTml6TXp3aWN4VUJBTUtUakJ1RDhyNC9ycnJsb2RK?=
 =?utf-8?B?b3NYQnhzTUJ0T0F0NkJ6UUZsQ2owUlJZTDg5QXgvSE9xTU5Oc3JLd01zNUs5?=
 =?utf-8?B?K3BwSXNmWm1MWndjaC8zOUdkR3BwMGFLdFhkamNURW40UFJDVTNTNkU2TGx6?=
 =?utf-8?B?UUsyUHJSR0pDT20wbGhaV0ZZM2NsdGI0bEN6bVdwdjc1dnMyQWRuVFdLTzE0?=
 =?utf-8?B?WERLZlU0YTQxN29xMms4YUxMM3pxQVdScTdESHBVM2JZZnhsNTliYUlvNnF3?=
 =?utf-8?B?TEZtMmtvaE1CWURSaWVodnMveXBPU05HS29yaHdybVJVMHRabWZUMmErMDBT?=
 =?utf-8?B?elZGOGZvZElMclJNMzlqeTNhNVJKVCt3S1c2S1JjWklxc0ZpaEpySUNqdDEy?=
 =?utf-8?B?TTJWS0hXalA4WkRUL1MvcEcyZVpDTnFXd2F4WERvckNQV0FoWE56bThveDR2?=
 =?utf-8?B?eUc3TVFoZWJ6cnBtaDRuN3ZadG9sTmRJV3VrODNxeHU0TW1XR2wzc2xuMU5Y?=
 =?utf-8?B?ak1TZ3dxVVkxa1p2UVlMenZMVllYOUdoajlTZGYrZUxYQXZzTFlGNlg1b0Zs?=
 =?utf-8?B?RC9FK1hSUEZ4WVB1RjNTK0NlbWI2cTNkQmMrdkNWVU05cFJydU1KeDA4azdM?=
 =?utf-8?B?RytsZzJYdXRKdnBmSkhwQVJQVGswR1NqejRxU0VTN1dUdkFsd3FQclFFOUY3?=
 =?utf-8?Q?JJPzqmjGcPnfhD64cz19wh4EDkKnwE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 17:46:28.0100 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a645f2-2b9f-41b2-89c9-08dd4543da1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4415
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


On 2/4/25 09:40, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Initramfs building tools such as dracut will look for a MODULE_FIRMWARE()
> declaration to determine which firmware to include in the initramfs
> when a driver is included in the initramfs.
>
> As amdxdna doesn't declare any firmware this causes the driver to fail
> to load with -ENOENT when in the initramfs.  Add the missing declaration
> for possible firmware.
>
> Reported-by: Renjith Pananchikkal <Renjith.Pananchikkal@amd.com>
> Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index 97d4a032171f1..f5b8497cf5ad6 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -21,6 +21,11 @@
>   
>   #define AMDXDNA_AUTOSUSPEND_DELAY	5000 /* milliseconds */
>   
> +MODULE_FIRMWARE("amdnpu/1502_00/npu.sbin");
> +MODULE_FIRMWARE("amdnpu/17f0_10/npu.sbin");
> +MODULE_FIRMWARE("amdnpu/17f0_11/npu.sbin");
> +MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
> +
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   /*
>    * Bind the driver base on (vendor_id, device_id) pair and later use the
>    * (device_id, rev_id) pair as a key to select the devices. The devices with
