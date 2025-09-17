Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC36FB81AFC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 21:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707CE10E58C;
	Wed, 17 Sep 2025 19:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AS1qCNTt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012061.outbound.protection.outlook.com
 [40.93.195.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CCA10E58C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 19:51:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAkDHZEujAsnNvrjsR6l+lM2peKcc6+mtg1nu94iti0pwDho0NqNx53NreQmNaP53Gvx1Vtc/iLDkLU7QTtYFA1QAVeG7cUVRNiviIB+E5J5l3kSfxPZZoX4Wj8eYZvE0M68QfReoktFrXuiLQYil3Gn6JpogtAvALdz8nonhtp9/dx2NZfsbb9xlp5Kc67L2Ga/E2CgC46sVg/787hyevQLqyWVLuC+aRoP2u5AqF48j7kgCi4NqTKU0WQYgnz15QxRQlT7LhmO2mzsKuYFQ8tU2dky8QqbH7IcLEFdfSJ3M8QlO7KErfkcUuWK2t3ZXhIGdn0h0C66gkbC7v54Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w31t9sLk9kcODGgjkW0/9aw5F3Eg6xHIB4WvHyLN788=;
 b=jQDludbgZCy6MI6ezx7w6w1xF8/69dTRpxtEi5/XfVwF+HRC6x+Ws2bcvbyLDkYUcEUbE171XztIjw2fWAofKDdu4D+vKmLv8WqKpTxzmIHyIJU+8MQMUQTpfTVqvOCmC88Ei2+Znb+nF//hTRr0zP0uOljIZjKmht8NdPRwBkR4pAsNoBmpIiTt2Tyrt+LZ854PydcHVjGsDtGCkJKSTvHANtaJEiz9m0JUspZijQs06mqDoApu2q7nynx/H4+Ytf6TjNGJtbjhZWusZXDZJhQJm6DrdUs9P7a0rlN0gj4miEEESZK1ibjtFsQVwHLU+6o/5BPhycD9vpSDSsFO9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w31t9sLk9kcODGgjkW0/9aw5F3Eg6xHIB4WvHyLN788=;
 b=AS1qCNTtke1ZS3QOYs6jdey64eGffpS0toTCETLTZ0x9l98tIlwxdnvLhW0rkNJXETBggU5vSHjqWZMNq7mi1uWO2N9r9v2bAH6xAObqW3SQy3M/z1mZQWP0rwflq5KrFFjrHGo8sqOP5rVGl7vYLn6DkCpw/Axrbj3p6MW9N2klxORvLhZrEp/Lls5mmVP3fh0ObCaBB8OxC0GGD/tTgdJ66KKKQv0EJkCDNQ84WvIC5Y3nlX5nKzksf5ETL5MhtQRcDf0NkTZxUb8gp06LYNPa8mrI5wcnD1ERVr0q2bPdogiUdGfgffF7TXQ7v3fecz4NWWWN7bfOcHuFeGYOYQ==
Received: from CH5P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::15)
 by MW6PR12MB8759.namprd12.prod.outlook.com (2603:10b6:303:243::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Wed, 17 Sep
 2025 19:51:12 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::fd) by CH5P221CA0007.outlook.office365.com
 (2603:10b6:610:1f2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Wed,
 17 Sep 2025 19:51:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 19:51:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 17 Sep
 2025 12:50:56 -0700
Received: from [10.221.136.181] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 17 Sep
 2025 12:50:54 -0700
Message-ID: <6e8e4821-f811-4bee-a5dc-2a6e8f4dd9a6@nvidia.com>
Date: Wed, 17 Sep 2025 21:49:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/ast: Use msleep instead of mdelay for edid read
To: <dri-devel@lists.freedesktop.org>
CC: <tzimmermann@suse.de>, <jfalempe@redhat.com>, <mripard@kernel.org>, "Carol
 Soto" <csoto@nvidia.com>
References: <20250917194346.2905522-1-nirmoyd@nvidia.com>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <20250917194346.2905522-1-nirmoyd@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|MW6PR12MB8759:EE_
X-MS-Office365-Filtering-Correlation-Id: 7facaf00-aa39-4632-23f2-08ddf6238dce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXhDRC9JUmh3c2pCQ0tSdklsb2JYRTNYK0tyZllIRDg3czJydmJIM3p6SWE5?=
 =?utf-8?B?ekpwNFNQUEpnYkdrZURSTjN4UElKdVZCdk9nSnVRa2dXaTREdjBpQ2FYdkc1?=
 =?utf-8?B?dTBzZWlTNE52MnRpY0RsVUtPbldnUjNiY1hocDRGbEtWRGRrQjZXZVQybXZk?=
 =?utf-8?B?VzhxSWxGUVJUbGw2SUtraGVyRjJJVnN0NkZQQ2dLM0VYOWxnYzZhdmV3cEFC?=
 =?utf-8?B?QkZLYnJDZUNFbU5qY3E1Y2hvSFZTb1lGalNUbzU5STFhSkhNd251alA4WEVW?=
 =?utf-8?B?bGJiTFRoVEFpU3dQYWNkeCs5UjdxZnp6RGg5MjdyWlhkbXJyQWpYbytMVmF3?=
 =?utf-8?B?NVBrRittTTlLTkF3dy90THhMTSsyM2NHWHRYSDNBamt4bTJMM0Q4MnNpREF4?=
 =?utf-8?B?NE5VNkIrblZmTmh4bnBkaitQY3FJeWNXQzVFOE13NnJRd0k3R0VJbWpGSGRi?=
 =?utf-8?B?b1ZqSEN0Y3BBcUJaMGtpN2x3dHRZNlhWSENPam02ODVBcEJVSzk2V3BIcVl3?=
 =?utf-8?B?RkxKRGdWaXZiL3poeFozeC9JZ0xmQ0N2S0IzNXFOUVJ3dmdOblFUaytKamdE?=
 =?utf-8?B?dVNBRnllVmFpdUh2Y05ld0NQQlBMcGprTDF2bDBGN2N4dTFXdEFYaTh5RWYw?=
 =?utf-8?B?L1I1TzJPZ0M1ejJ6YUxhdUUxeWE5YzNwRzRtcjFGSmw3NkNCT1ptVHFwMDI1?=
 =?utf-8?B?R24rRHJhcnpiRXVMS1dOUDFpMFlJR0g4MkFHWm56Uk1oaE91RnhlVnFvOHdL?=
 =?utf-8?B?em1jRVdYV1NKSDUzTnlJUjNuNzFFdlBYUm5ibmlIQ2p6TmN6b3c5Z2dkT0lY?=
 =?utf-8?B?ekdIaElTeTZNYko3N3hUdGZRZXN4cUNyWjE0ajFycjJabnhBOTBCYXFNL3Rl?=
 =?utf-8?B?eUx5ZFhOOHhOOFZoZGhTZVIyOXRrajJSV1BHOTNMKzB3bU5GRUpJcm16UnE1?=
 =?utf-8?B?Y3Q0TWNsSVo0K1RGSTREajAza2ZIdWIvY0F5cGNrZ0pxSFRXRVVncE9teWFj?=
 =?utf-8?B?eXBBY3ErNUlYOU5wUWNyM2Q0elMxRmNxdXlQcWNPdEtadUNqUHk5a1FSSnZy?=
 =?utf-8?B?Q1hueUpwVFhBR1dwUEVaQ3FzQkt4bXdtanBUSUppSzU3bWM0S2hPMVFPTFEz?=
 =?utf-8?B?QWpuazlFQzZCWlN4NlkreHJ0L1FaRnIyek40N0dMY3lFNXJ5ZFhFNmVIaWZN?=
 =?utf-8?B?bVQ1UTJCNUlwb3hnSm9TcnhzT3hFN3FScHRtYVdwYTByeUQwS21FMUo1Tmwz?=
 =?utf-8?B?b3I5TzMwQjBiNHFOMVQ0MVVzRS85Y1NWNmNpZnp2d1E3QWorSG4zM2VpcnN3?=
 =?utf-8?B?QjF0Wm51cVM0b0dHNVlESm5LSVFUd2RNaGJvcmM3Z0ZDODlENUwxTElxOVlC?=
 =?utf-8?B?aHZzakdYdmQxQlZqUXZhUEtLSXV2Wkl6M2U3N2ljajRKTFFPcmZzNkVBbXNk?=
 =?utf-8?B?WHpidnZHbmpHVnVHTGdSZVNXdkdOSnQvM3VoKzhXOC8wV1RtdDRBaGQ3aUpS?=
 =?utf-8?B?YmEzNXZoVjBRbUtSRHZONTFIenArZUpSdXl3dk1Za0ZKdU12ZzA4eTZCWjZX?=
 =?utf-8?B?aDF6eGY5RW14bHlZdC80M0tJMG9McXhjWDhrOVFYL0FvL0JLTUJ1aXZBVkF3?=
 =?utf-8?B?MkJCTXN6ZXVhK0JORml5UzJlbHNYY25oQjJWTzhGQUxTL3oyNnBmRHNwcHAy?=
 =?utf-8?B?NDJLYUlzanVaWkJiSTcrS1N2aW93aktuZmZkdmZlRUxmeStWQXdyaEFpd3li?=
 =?utf-8?B?SFllVWJ5d2JYWkJ2aUZ0YnFIMWNLN0VPK0U3UzZEbThkbHB5WWxxVHA0OFVt?=
 =?utf-8?B?U1lHQ3Jjc2RTZzQyR2hZOGxvcWZQckxuazNKdnpYZXhUSmx0aVJZTGd1MFkw?=
 =?utf-8?B?OGpBK0orbHlVeEJlZDlYTWI3WVpwbnhTVGRGQXY4b09BRFNrV2Exa0RNUENy?=
 =?utf-8?B?N3lYRXpoSEFhMlAzVHhRRU1BZmRyWXRrci9Pck8wU2JBY0hHSWlJTGxmSFU5?=
 =?utf-8?B?SHc3cWh5TmE0RzIwMW5WMFd5NFJIR0NFaEVlbUtrUTA3c01XbFUyUjhRSWFF?=
 =?utf-8?Q?RUZxUw?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 19:51:11.8416 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7facaf00-aa39-4632-23f2-08ddf6238dce
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8759
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


On 17.09.25 21:43, Nirmoy Das wrote:
> The busy-waiting in `mdelay()` can cause CPU stalls and kernel timeouts
> during boot.
>
> Signed-off-by: Nirmoy Das <nirmoyd@nvidia.com>
>
> Sending this as RFC as I am familiar with the code and not sure
I meant: I am not familiar with the code.


Adding more details:
Seeing below trace at boot time:

[   49.908436] Workqueue: events work_for_cpu_fn
[   49.908440] pstate: 83400009 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS 
BTYPE=--)
[   49.908443] pc : __delay+0x6c/0x118
[   49.908449] lr : __delay+0x74/0x118
[   49.908455] sp : ffff8000848af830
[   49.908460] x29: ffff8000848af830 x28: ffffc42fa1fb2d70 x27: 
ffff8001288c03d5
[   49.908468] x26: 00000000000000ff x25: ffff000080a2e980 x24: 
000000000000009d
[   49.908472] x23: 0000000000418958 x22: ffffffd0004105a0 x21: 
0000002fffc08100
[   49.908475] x20: ffffc42fe7b1b348 x19: 00000000000f4247 x18: 
ffff8000848c0088
[   49.908478] x17: 0000000000000000 x16: ffffc42fe72655c8 x15: 
0000000000000000
[   49.908482] x14: 0000000000000000 x13: 20706f6f6c20726f x12: 
6620676e69747261
[   49.908485] x11: 747320646964655f x10: 0000000000000000 x9 : 
ffffc42fe72654ec
[   49.908489] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 
0000000000000000
[   49.908492] x5 : 00000000000000ff x4 : 0000000000000000 x3 : 
0000000000000000
[   49.908496] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 
00000000000485c0
[   49.908500] Call trace:
[   49.908501]  __delay+0x6c/0x118
[   49.908504]  __const_udelay+0x30/0x58
[   49.908506]  ast_astdp_read_edid+0x690/0xc68 [ast]
[   49.908510]  ast_astdp_connector_helper_get_modes+0x90/0x158 [ast]
[   49.908515] drm_helper_probe_single_connector_modes+0x1ac/0x628
[   49.908522]  drm_client_modeset_probe+0x22c/0x1558
[   49.908528] __drm_fb_helper_initial_config_and_unlock+0x60/0x550
[   49.908530]  drm_fb_helper_initial_config+0x4c/0x88
[   49.908532]  drm_fbdev_generic_client_hotplug+0xa4/0x110
[   49.908535]  drm_client_register+0x64/0xd0
[   49.908540]  drm_fbdev_generic_setup+0x134/0x1e0
[   49.908545]  ast_pci_probe+0x310/0x898 [ast]
[   49.908548]  local_pci_probe+0x4c/0xe0
[   49.908552]  work_for_cpu_fn+0x28/0x58
[   49.908554]  process_one_work+0x17c/0x448
[   49.908556]  worker_thread+0x360/0x480
[   49.908557]  kthread+0x11c/0x128
[   49.908562]  ret_from_fork+0x10/0x20

This also cause timeouts in other drivers  because of this long udelay.


Regards,

Nirmoy

> if this transition is safe.
> ---
>   drivers/gpu/drm/ast/ast_dp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 19c04687b0fe1..8e650a02c5287 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -134,7 +134,7 @@ static int ast_astdp_read_edid_block(void *data, u8 *buf, unsigned int block, si
>   			 * 3. The Delays are often longer a lot when system resume from S3/S4.
>   			 */
>   			if (j)
> -				mdelay(j + 1);
> +				msleep(j + 1);
>
>   			/* Wait for EDID offset to show up in mirror register */
>   			vgacrd7 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd7);
> --
> 2.43.0
>
