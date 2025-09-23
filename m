Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8225DB95035
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 10:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D976610E5AE;
	Tue, 23 Sep 2025 08:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mAj4Ugzp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A390B10E5B0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 08:36:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnB7VxJMRk+AgB4qytO2S94RwwV6QkBUNp0C2qz02yA9E0oTqTvi2IDjkTNxZQoA96OHYD+7pVIgzTO5pvnAzxfaIsaSfG9e0VV9wZYNPJ2tMwz81MliC0esgf0Utd7Tpl2z6DgrfI5wDDtDXDTzhTsKtdnxsyfjLCDRd/16YuCDGZB5IH8z9KdqzhO3YvI0Lg1hyvmn+EVDWNLrnNEfq8PMpenLTPC2nKdiaElhvmgrfi7uHbJeZp7K3t+kVSwQZFTVhfoBb9CLiwSInTu/r387VfyQtNCjLMSZg+etwuoaM7Bav7SqMpsEClRWROhZTHeomxvdFntZ9lKddNA3xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laMVAutSeGsCZLj3sxfLmlDZE/FIsip8d2xvPPB8oXE=;
 b=G4WP7yrWtSpYN1Um/nwjd19Q64CRDRDgAdBqYcqdCvegiUKMqXeFOCZJ4xlZqESIbPWAU+iccEuSTjS5rAZKIVXUO/+DRhZ/VWSB7zsT/i02Z5Z/OzgkpXtfkAX8Yb0R10OoYHwIA7Ar+UDY/y1UjHSHA/n4LXp8FoYcpfyrLWnzgQVF1MAr2cNT+Eb9gLxzgmOJnlJFq0UZr220eXc/bJ8NemW6pxbtTtVDAyfci6OWy6kPBEcMynIPwKg7elsHDjkSxPZzO5VAwLJZgEjMj5DbSQQcTPVMWmCGQvF4CIXgR5Yjz3qchEhEPFnSCbQfI06Trj1EIIRsC7BFJaD9qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=suse.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laMVAutSeGsCZLj3sxfLmlDZE/FIsip8d2xvPPB8oXE=;
 b=mAj4UgzpAJMLXXJs98J/Ub15441YptB+4bOYZD0nc3jhuLCw0KXEPTiH6SbOvE7/s4Bx/0zqeWuLDi5TwlPrNi/CKifJm50RgplApCT1IzrXMXzyyui2giOTooJbGPkteUXaSwxqqA14FQw/T+zLWq/53g9dzxFXKDGRmeP+dDdL1JisMVq/9fx8eQzNjxZD/+X/s8y++9xjA4D6CQAuwH2bH3R3Lomx8pFMXCrKS0ISh/tLv2FOzm6jeypm50496mOf9qu+cTamzUESazf2MhQp8MGeU0KvVBwdv+yyQq/uoRzsDwGqxDqib6RS8UFkwvlkU/4DyWiwmD6HiBTnEg==
Received: from SJ0PR13CA0164.namprd13.prod.outlook.com (2603:10b6:a03:2c7::19)
 by PH7PR12MB8156.namprd12.prod.outlook.com (2603:10b6:510:2b5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 08:36:10 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::4e) by SJ0PR13CA0164.outlook.office365.com
 (2603:10b6:a03:2c7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9 via Frontend Transport; Tue,
 23 Sep 2025 08:36:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 08:36:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Tue, 23 Sep
 2025 01:35:53 -0700
Received: from [10.221.136.181] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Tue, 23 Sep
 2025 01:35:51 -0700
Content-Type: multipart/alternative;
 boundary="------------nRBzWfplt6CJrtalSr1jciwT"
Message-ID: <d81cc339-43c9-4529-ace5-29a687378b0d@nvidia.com>
Date: Tue, 23 Sep 2025 10:34:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, KuoHsiang Chou
 <kuohsiang_chou@aspeedtech.com>
CC: <dri-devel@lists.freedesktop.org>, Carol Soto <csoto@nvidia.com>, "Matt
 Ochs" <mochs@nvidia.com>
From: Nirmoy Das <nirmoyd@nvidia.com>
Subject: ast "WARN_ON(!__ast_dp_wait_enable("ast, enabled)) on reboot
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|PH7PR12MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: f8194d63-94fa-4263-cd23-08ddfa7c3f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFFGQmxYSldkZTFZcHJ0UStsNnV1TkNOZHpVT05QakIvSnUwcnp2eUxtdUYy?=
 =?utf-8?B?aGUyTWJhSnZKL2lpYXFUZi82aTlIRWdIV0plclZKait4aHptYlBTOWNpS3NP?=
 =?utf-8?B?dVFlbUt2VTYrc1RMY3hFZGhDdS9Dd1o2cExPK3h1TmVLaWpPN1dMR0N0NGVM?=
 =?utf-8?B?bFB0NlhXZnNnYUN2b3BhTG4vZmZ4eVhyRm5iVlhnRTY2T3lENXpLc2owRnhX?=
 =?utf-8?B?WDBrTFVyQkZ3U25HN05LZWdFQlpFNjZWanhLQUJodTVHTUI4dE9rUnhKdGVT?=
 =?utf-8?B?enFHcEZTblFQNjFrc1FicC83b29zY3l2Y3ljdm9xTHo0bTZmSXBHK3gybWFa?=
 =?utf-8?B?L051RTNNeXllYlFwNWI2SmlxOW1Ua0Q1R0hyanlJRnFxWksxNlgxRDAzOG1v?=
 =?utf-8?B?eUJQZWdPejVpYUdXempkV3BENXJ2bFc4V1NqNFNRZmNxM0ZQY1c1WUovZ29a?=
 =?utf-8?B?MXRHbzRsV2xzRWgvOGJIUkFUNkhGQTF6N0lsVlgwV3VLLzhOcWExUlhMcjN0?=
 =?utf-8?B?SjEycGVoWmFRTFV3QlhmNTYxUnFtWTlCL1FRMTN6MUI2enFSaDArVCsyNWpG?=
 =?utf-8?B?WStpVGVkd1lYSGozcGlMYVhiRFY5d0Rkd2NZYVhMNjlKSkpXWkVDa3FQYi9s?=
 =?utf-8?B?MUhoNjNZbForMm9PL2Z6NnhoZ1kwUmZzaytvb3VoY3krUW5zMWZtM0RmUmhZ?=
 =?utf-8?B?bHlNc2IrWDFHVlp2MmJ1Zk81YzNtR3hBMkUvMUV6SCtCQU1aMWJ1dmxRZnpj?=
 =?utf-8?B?N0pBRFh2SHdhOExqZkM2d0FWMXRaS0gvS3dYRjRhWTh0cHpkL0ZHV2FkaEly?=
 =?utf-8?B?MHZBOGNEdnFqQW9LS1IwbWczTmFpcXhaMm9oeHU0TThNQ29JNEoyWUpyM0U1?=
 =?utf-8?B?OFZ6RW0vbmZKN3lQbVkwUSt0MFU1MFI1TmhhclJRblNvU3NlcUhJNTNDQ3dI?=
 =?utf-8?B?eE9QdVJEUFRZSkJINVFianRiYUVKYk52bzE4NTRITjRUQVY2RUtRNGpoNTdG?=
 =?utf-8?B?RHRCWlF3SkdrRWNkazY0bGQwdkJZU3BpbHltS3VrMzh3WUV2bllIdEYrTERR?=
 =?utf-8?B?Sk1rUXlTZDA5V2luMVNJcXYvWU4rNmMzd0RXWXN1QklCQzYxNGN4YUtlU3pt?=
 =?utf-8?B?bkxjZE5PNk9NS3pEN25reFdmM29HNFhMTHlCeC96aXNJb0VjR3hRODd6aWN5?=
 =?utf-8?B?OXFzNXBrbUMzNTVrSXBEQ3VZVU5zQ1pHOS95NkNJN2Z2cVdtdjJ5dnphakVr?=
 =?utf-8?B?alV6c2FMSUN6SXlsNjV4aGhlZWdOZ2NsV2NhWFFQSWdxRDBhZGdHRjc4Nk84?=
 =?utf-8?B?YnVYUm03MTRiVDZtVGJ3YXRhelJyOHpLWFdUN0V2bTBPYnlMaTJjRUl1NUlG?=
 =?utf-8?B?TDY5TmVVa3NlbjVmbWpiSG5SN09pelg1WElVTnpwNkdGdmFZalQ5cmd1eER2?=
 =?utf-8?B?R2pnUkIwdDhJb2tJaUJoc2F4VVlFbXpyTytET3lEODk3UW9OLzNrbGVsWWRx?=
 =?utf-8?B?bGxzWmpSdzgzbWRZQm9UVVE2T2NtS0o4d0dFUU5SZ1ZqcE1VQzQ0em5teVNp?=
 =?utf-8?B?MzhpRE9ERjQ2VXpKSjJ0ZDhrcW0vT2N5dnUxVGJ0MjVBQjc3eHZiV3RkejlW?=
 =?utf-8?B?NkppclpxZXBDcW41a1E4dUV0c1ViSi9ub3dGMzY4NC90VlVQM0k3eThlNU9a?=
 =?utf-8?B?RXNXMTBlTFk4VEt3Y3dlNks4Tmd0QmRNZmRYUUN2amhFQXNIeE1KS0hNc3gv?=
 =?utf-8?B?T2I5TWZOU3Vka3NOUUdGM2s3Y3BaQnR0VjVacGJZRU11RXRza1ZEMDAvYTdE?=
 =?utf-8?B?SFVUenFXaXBLTWlabmVYWG01Z1BEK2NIL0JReklmaFZlaHVaYlFVRVJMS0pi?=
 =?utf-8?B?Um5vMUxBU1hHNTlvRnZYSVZqRVVjSGkzdlg3K25iN0Y0TFJhWGtWZjJrQ0x4?=
 =?utf-8?B?TVhtdlRqRkRaRHBmM0RIb29BODVpMGQzRlZEYW5YN01UWDdTb2xrSVc3VVBK?=
 =?utf-8?B?dVp5WkhEYklqNE92aXFqeVNVMGFlRFV3Zmc4ODkrbWo4N3FxS1V6ZzhnYWkz?=
 =?utf-8?Q?ZOisHE?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(8096899003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 08:36:10.5603 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8194d63-94fa-4263-cd23-08ddfa7c3f92
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8156
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

--------------nRBzWfplt6CJrtalSr1jciwT
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas and KuoHsiang


(Not sure if there is separate portal to report AST issues. Let me know 
if there is one)

We are observing the following trace on every reboot. I tried increasing 
the timeout value but that did not resolve the issue.

I tried to read AST_IO_VGACRI(0xdf) and AST_IO_VGACRI(0xe3) which  
returns a value of 0xff. I wonder if

the device is accessible at pci_device_shutdown().

I have attached the lspci output for your review.  Please let me know if 
you have some ideas how to debug/fix this.

[ 196.248014] ast 0008:02:00.0: [drm] 
drm_WARN_ON(!__ast_dp_wait_enable(ast, enabled)) [ 196.248045] WARNING: 
CPU: 76 PID: 1 at drivers/gpu/drm/ast/ast_dp.c:282 
ast_dp_set_enable+0x124/0x158 [ast] [ 196.277550] Modules linked in: 
bcache qrtr cfg80211 binfmt_misc cdc_subset ast dax_hmem 
drm_shmem_helper cxl_acpi drm_client_lib cxl_port i2c_algo_bit cxl_core 
ipmi_ssif drm_kms_helper uio_pdrv_genirq uio coresight_trbe arm_spe_pmu 
arm_cspmu_module arm_smmuv3_pmu spi_nor mtd coresight_funnel 
acpi_power_meter acpi_ipmi coresight_etm4x coresight ipmi_msghandler 
dm_multipath efi_pstore drm nfnetlink ip_tables x_tables autofs4 overlay 
isofs nls_iso8859_1 raid10 raid456 async_raid6_recov async_memcpy 
async_pq async_xor async_tx xor xor_neon raid6_pq raid1 raid0 linear 
mlx5_ib ib_uverbs ib_core mlx5_core ghash_ce sm4_ce_cipher sm4 sm3_ce 
mlxfw sha3_ce psample i2c_smbus sha512_ce nvme tls sha1_ce 
arm_smccc_trng nvme_core pci_hyperv_intf spi_tegra210_quad dax_pmem 
i2c_tegra cdc_ether usbnet aes_neon_bs aes_neon_blk aes_ce_blk 
aes_ce_cipher [last unloaded: ipmi_devintf] [ 196.355667] CPU: 76 UID: 0 
PID: 1 Comm: shutdown Tainted: G W 
6.16.4-dev-main-nvidia-pset-linux-6-generic #16+f4490439 PREEMPT(none) [ 
196.369453] Tainted: [W]=WARN [ 196.372481] Hardware name: NVIDIA Grace 
CPU P5041/P3880, BIOS FF.04.00 20250422 [ 196.379955] pstate: 63400009 
(nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--) [ 196.387073] pc : 
ast_dp_set_enable+0x124/0x158 [ast] [ 196.392148] lr : 
ast_dp_set_enable+0x124/0x158 [ast] [ 196.397221] sp : ffff80008049b930 
[ 196.400604] x29: ffff80008049b930 x28: ffffa507dbec1b98 x27: 
ffff0000acb337b8 [ 196.407901] x26: 0000000000000000 x25: 
ffff1003985d2e00 x24: ffffa507dbdc45b8 [ 196.415197] x23: 
0000000000000000 x22: 0000000000418958 x21: 00000000ffffffdf [ 
196.422495] x20: ffff100008bac0c8 x19: 0000000000000000 x18: 
000000000000004c [ 196.429790] x17: ffff100008b5f200 x16: 
ffffa508522b5ce8 x15: 0000000000000000 [ 196.437087] x14: 
0000000000000000 x13: 2d2d2d2d2d2d2d2d x12: 2d2d2d2d5d206572 [ 
196.444384] x11: 656820747563205b x10: 0000000000000020 x9 : 
ffffa508523621cc [ 196.451681] x8 : 00000000ffffffff x7 : 
0000000000000030 x6 : 0000000005000000 [ 196.458976] x5 : 
000000000000004d x4 : 00000000000000c0 x3 : 0000000000000003 [ 
196.466271] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 
ffff000081356040 [ 196.473566] Call trace: [ 196.476061] 
ast_dp_set_enable+0x124/0x158 [ast] (P) [ 196.481135] 
ast_astdp_encoder_helper_atomic_disable+0x28/0x90 [ast] [ 196.487630] 
disable_outputs+0x11c/0x3c8 [drm_kms_helper] [ 196.493160] 
drm_atomic_helper_commit_tail+0x2c/0xb0 [drm_kms_helper] [ 196.499753] 
ast_mode_config_helper_atomic_commit_tail+0x34/0x58 [ast] [ 196.506427] 
commit_tail+0xd8/0x220 [drm_kms_helper] [ 196.511503] 
drm_atomic_helper_commit+0x174/0x190 [drm_kms_helper] [ 196.517824] 
drm_atomic_commit+0x94/0xe0 [drm] [ 196.522392] 
drm_atomic_helper_disable_all+0x204/0x220 [drm_kms_helper] [ 196.529158] 
drm_atomic_helper_shutdown+0x90/0x158 [drm_kms_helper] [ 196.535567] 
ast_pci_shutdown+0x1c/0x30 [ast] [ 196.540020] 
pci_device_shutdown+0x3c/0xa8 [ 196.544216] device_shutdown+0x140/0x2b0 
[ 196.548229] kernel_restart+0x4c/0xb8 [ 196.551974] 
__do_sys_reboot+0x148/0x260 [ 196.555979] __arm64_sys_reboot+0x2c/0x40 [ 
196.560074] invoke_syscall+0x70/0x100 [ 196.563907] 
el0_svc_common.constprop.0+0x48/0xf8 [ 196.568712] do_el0_svc+0x28/0x40 
[ 196.572097] el0_svc+0x34/0xd8 [ 196.575220] 
el0t_64_sync_handler+0x144/0x168 [ 196.579670] el0t_64_sync+0x1b0/0x1b8 
[ 196.583411] ---[ end trace 0000000000000000 ]--- [ 196.656701] reboot: 
Restarting system

lspci:

0008:03:00.0 PCI bridge: ASPEED Technology, Inc. AST1150 PCI-to-PCI 
Bridge (rev 06) (prog-if 00 [Normal decode]) Subsystem: ASPEED 
Technology, Inc. AST1150 PCI-to-PCI Bridge Physical Slot: 2-1 Flags: bus 
master, fast devsel, latency 0, NUMA node 0, IOMMU group 24 Bus: 
primary=03, secondary=04, subordinate=04, sec-latency=0 I/O behind 
bridge: 40000-40fff [size=4K] [16-bit] Memory behind bridge: 
40000000-410fffff [size=17M] [32-bit] Prefetchable memory behind bridge: 
[disabled] [64-bit] Capabilities: [40] Power Management version 3 
Capabilities: [68] Express PCI-Express to PCI/PCI-X Bridge, MSI 00 
Capabilities: [b0] Subsystem: ASPEED Technology, Inc. AST1150 PCI-to-PCI 
Bridge Capabilities: [e0] Vendor Specific Information: Len=20 <?> 
Capabilities: [100] Device Serial Number 00-80-5e-00-00-10-0b-b0 
Capabilities: [10c] Secondary PCI Express Capabilities: [150] Virtual 
Channel Capabilities: [1e0] Vendor Specific Information: ID=0001 Rev=2 
Len=010 <?> Capabilities: [1f0] Advanced Error Reporting 0008:04:00.0 
VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics 
Family (rev 52) (prog-if 00 [VGA controller]) DeviceName: Embedded Video 
Controller Subsystem: ASPEED Technology, Inc. ASPEED Graphics Family !!! 
Unknown header type 7f Memory at 650040000000 (32-bit, non-prefetchable) 
[size=16M] Memory at 650041000000 (32-bit, non-prefetchable) [size=256K] 
I/O ports at 40000 [size=128] Kernel driver in use: ast Kernel modules: ast

--------------nRBzWfplt6CJrtalSr1jciwT
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Thomas and KuoHsiang</p>
    <p><br>
    </p>
    <p>(Not sure if there is separate portal to report AST issues. Let
      me know if there is one) <br>
      <br>
      We are observing the following trace on every reboot. I tried
      increasing the timeout value but that did not resolve the issue. </p>
    <p>I tried to read AST_IO_VGACRI(0xdf) and AST_IO_VGACRI(0xe3)
      which  returns a value of 0xff. I wonder if</p>
    <p>the device is accessible at pci_device_shutdown(). </p>
    <p>I have attached the lspci output for your review.  Please let me
      know if you have some ideas how to debug/fix this.</p>
    <p><span
style="color: rgb(209, 210, 211); font-family: Monaco, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(232, 232, 232, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">[  196.248014] ast 0008:02:00.0: [drm] drm_WARN_ON(!__ast_dp_wait_enable(ast, enabled))
[  196.248045] WARNING: CPU: 76 PID: 1 at drivers/gpu/drm/ast/ast_dp.c:282 ast_dp_set_enable+0x124/0x158 [ast]
[  196.277550] Modules linked in: bcache qrtr cfg80211 binfmt_misc cdc_subset ast dax_hmem drm_shmem_helper cxl_acpi drm_client_lib cxl_port i2c_algo_bit cxl_core ipmi_ssif drm_kms_helper uio_pdrv_genirq uio coresight_trbe arm_spe_pmu arm_cspmu_module arm_smmuv3_pmu spi_nor mtd coresight_funnel acpi_power_meter acpi_ipmi coresight_etm4x coresight ipmi_msghandler dm_multipath efi_pstore drm nfnetlink ip_tables x_tables autofs4 overlay isofs nls_iso8859_1 raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor xor_neon raid6_pq raid1 raid0 linear mlx5_ib ib_uverbs ib_core mlx5_core ghash_ce sm4_ce_cipher sm4 sm3_ce mlxfw sha3_ce psample i2c_smbus sha512_ce nvme tls sha1_ce arm_smccc_trng nvme_core pci_hyperv_intf spi_tegra210_quad dax_pmem i2c_tegra cdc_ether usbnet aes_neon_bs aes_neon_blk aes_ce_blk aes_ce_cipher [last unloaded: ipmi_devintf]
[  196.355667] CPU: 76 UID: 0 PID: 1 Comm: shutdown Tainted: G        W           6.16.4-dev-main-nvidia-pset-linux-6-generic #16+f4490439 PREEMPT(none) 
[  196.369453] Tainted: [W]=WARN
[  196.372481] Hardware name: NVIDIA Grace CPU P5041/P3880, BIOS FF.04.00 20250422
[  196.379955] pstate: 63400009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
[  196.387073] pc : ast_dp_set_enable+0x124/0x158 [ast]
[  196.392148] lr : ast_dp_set_enable+0x124/0x158 [ast]
[  196.397221] sp : ffff80008049b930
[  196.400604] x29: ffff80008049b930 x28: ffffa507dbec1b98 x27: ffff0000acb337b8
[  196.407901] x26: 0000000000000000 x25: ffff1003985d2e00 x24: ffffa507dbdc45b8
[  196.415197] x23: 0000000000000000 x22: 0000000000418958 x21: 00000000ffffffdf
[  196.422495] x20: ffff100008bac0c8 x19: 0000000000000000 x18: 000000000000004c
[  196.429790] x17: ffff100008b5f200 x16: ffffa508522b5ce8 x15: 0000000000000000
[  196.437087] x14: 0000000000000000 x13: 2d2d2d2d2d2d2d2d x12: 2d2d2d2d5d206572
[  196.444384] x11: 656820747563205b x10: 0000000000000020 x9 : ffffa508523621cc
[  196.451681] x8 : 00000000ffffffff x7 : 0000000000000030 x6 : 0000000005000000
[  196.458976] x5 : 000000000000004d x4 : 00000000000000c0 x3 : 0000000000000003
[  196.466271] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000081356040
[  196.473566] Call trace:
[  196.476061]  ast_dp_set_enable+0x124/0x158 [ast] (P)
[  196.481135]  ast_astdp_encoder_helper_atomic_disable+0x28/0x90 [ast]
[  196.487630]  disable_outputs+0x11c/0x3c8 [drm_kms_helper]
[  196.493160]  drm_atomic_helper_commit_tail+0x2c/0xb0 [drm_kms_helper]
[  196.499753]  ast_mode_config_helper_atomic_commit_tail+0x34/0x58 [ast]
[  196.506427]  commit_tail+0xd8/0x220 [drm_kms_helper]
[  196.511503]  drm_atomic_helper_commit+0x174/0x190 [drm_kms_helper]
[  196.517824]  drm_atomic_commit+0x94/0xe0 [drm]
[  196.522392]  drm_atomic_helper_disable_all+0x204/0x220 [drm_kms_helper]
[  196.529158]  drm_atomic_helper_shutdown+0x90/0x158 [drm_kms_helper]
[  196.535567]  ast_pci_shutdown+0x1c/0x30 [ast]
[  196.540020]  pci_device_shutdown+0x3c/0xa8
[  196.544216]  device_shutdown+0x140/0x2b0
[  196.548229]  kernel_restart+0x4c/0xb8
[  196.551974]  __do_sys_reboot+0x148/0x260
[  196.555979]  __arm64_sys_reboot+0x2c/0x40
[  196.560074]  invoke_syscall+0x70/0x100
[  196.563907]  el0_svc_common.constprop.0+0x48/0xf8
[  196.568712]  do_el0_svc+0x28/0x40
[  196.572097]  el0_svc+0x34/0xd8
[  196.575220]  el0t_64_sync_handler+0x144/0x168
[  196.579670]  el0t_64_sync+0x1b0/0x1b8
[  196.583411] ---[ end trace 0000000000000000 ]---
[  196.656701] reboot: Restarting system</span></p>
    <p><span
style="color: rgb(209, 210, 211); font-family: Monaco, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(232, 232, 232, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
</span></p>
    <p><span
style="color: rgb(209, 210, 211); font-family: Monaco, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(232, 232, 232, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">lspci: </span></p>
    <p><span
style="color: rgb(209, 210, 211); font-family: Monaco, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(232, 232, 232, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">0008:03:00.0 PCI bridge: ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge (rev 06) (prog-if 00 [Normal decode])
        Subsystem: ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge
        Physical Slot: 2-1
        Flags: bus master, fast devsel, latency 0, NUMA node 0, IOMMU group 24
        Bus: primary=03, secondary=04, subordinate=04, sec-latency=0
        I/O behind bridge: 40000-40fff [size=4K] [16-bit]
        Memory behind bridge: 40000000-410fffff [size=17M] [32-bit]
        Prefetchable memory behind bridge: [disabled] [64-bit]
        Capabilities: [40] Power Management version 3
        Capabilities: [68] Express PCI-Express to PCI/PCI-X Bridge, MSI 00
        Capabilities: [b0] Subsystem: ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge
        Capabilities: [e0] Vendor Specific Information: Len=20 &lt;?&gt;
        Capabilities: [100] Device Serial Number 00-80-5e-00-00-10-0b-b0
        Capabilities: [10c] Secondary PCI Express
        Capabilities: [150] Virtual Channel
        Capabilities: [1e0] Vendor Specific Information: ID=0001 Rev=2 Len=010 &lt;?&gt;
        Capabilities: [1f0] Advanced Error Reporting

0008:04:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics Family (rev 52) (prog-if 00 [VGA controller])
        DeviceName: Embedded Video Controller
        Subsystem: ASPEED Technology, Inc. ASPEED Graphics Family
        !!! Unknown header type 7f
        Memory at 650040000000 (32-bit, non-prefetchable) [size=16M]
        Memory at 650041000000 (32-bit, non-prefetchable) [size=256K]
        I/O ports at 40000 [size=128]
        Kernel driver in use: ast
        Kernel modules: ast</span></p>
  </body>
</html>

--------------nRBzWfplt6CJrtalSr1jciwT--
