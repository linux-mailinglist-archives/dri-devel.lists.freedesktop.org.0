Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4483BAF8942
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EE410E944;
	Fri,  4 Jul 2025 07:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Crc0qLoR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3551010E944;
 Fri,  4 Jul 2025 07:25:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnjG9Ul7vA9XMMbcPiL6s2uVDDIjp+uclmxLAwEGHlNdD5a8GK9GkOGcbQDbbghDPu8B593iEB6hItou64F423Yn9xLFbGQ6Xrr16jptG4kx7bmUjokiwsa9rtvMizjQP59SHHoZp29qSxptujc554i0QHpOLelYHF+GYyYOBCfgiePRtdF6AJX3hfPeGOKiekN/MDwPXDvv8+bZJmpqdb6hoU/PJ6VpPwEVIYAZns7fJA2olwccUf88REbKlm/Z8/iBCrx2yVABBjgPprEIUMmZtFyvWlMuVl+ujlUrWT9AWU3cXQOOypKJnkQj4usk+hkVwN7KLN+AeyG/JSfi2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZYEHIQtj5qisIOvOPz14YfdojCWbTN5Ob8tCJFSQiE=;
 b=l/tDYKPOXLkoax/2dPk8Fz6iqipLVLSH7RbjpmZwGuj88kBTgOqz34Cn140ju204B9Q+PedBdML+mpayiM1RMCLX1bOg01MIi4Nnty5w+iThJ+fw/QBKl55UYeZ7wjnFomEu1y/0JkBMpU4RsRDRhr48vYYp44iw+5jMWYC5MC+X7HzraXSXUJg91eX9D9X92MApyBmxd0lhcReIPO6YVsgBov4KgQMSnpoTHDRb97E0Wg0b7J5x3qo/Vw1ntHc8QybM74gPtnmPRPJiEwcTuVIvsI2aBZddqGiOc2G8q9AiCUyVrvHFnyPG2oPQiReyIXwcr5Eg9w21rLgbcpQUxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZYEHIQtj5qisIOvOPz14YfdojCWbTN5Ob8tCJFSQiE=;
 b=Crc0qLoRf3LH1mGocgpR2Gtk0w613E179SAGYp83FOq1SsgabBBAPb4JL0nrYlGI5QwVo/3U8GdFMPN0Ccf1YEhIeoWsQBTzNZIVSODkdZKN+NoxdVd7zVhvCoKOMceuQlmaZwVVvtkFQ4J4m+MxGESm6QM1cp0OFp7V7Pj1D8NlH5G2fnwo+eTbZEHdwhP8T09HKUwEpbWt/IsJbrPjFvKDkiIZhxKfrqnPJ/SsMGBzIFsMIqB7Ue5JZ710HTnCbN8qSddSKHvqJGTmXDBrtdhMeSabNDJyYzrRQkkAJfWT/2iqwD1aUFbAV0p7NWigry4g4AffO2jqEY6Hslat+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:25:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 07:25:33 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 04 Jul 2025 16:25:04 +0900
Subject: [PATCH 03/18] gpu: nova-core: register: fix alias documentation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-nova-regs-v1-3-f88d028781a4@nvidia.com>
References: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
In-Reply-To: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0085.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: a089e4c0-840e-495d-bf80-08ddbacbf652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3NzdE00Vzhnb3llRHJ0SXdvbzVIS25kMTRNeGlVcm1ldkk3a2ZQVm9zMjBD?=
 =?utf-8?B?eXJ6MGRlWndlbW5DZWpPcVFUTXZvQVJ6ZVJ0NXBTbHdNY2Q0RENvUHlZY1dX?=
 =?utf-8?B?NG1WMDYxV1V1SEd4S3U2bU1GTHQ5NWhkQWQ3L1diKzF4dzlxczBlWmF4bnhI?=
 =?utf-8?B?V1Yxc0hCUmp1dHJHdjhUbzR1akZLbk11TmsxYld5UHNCdFBUbFdCVjNVWXk3?=
 =?utf-8?B?eSs3YzJidU9FN3BHNVhERmhad21ycFFoM2txNkoyT3BndXVDb0pZOHVkZlFG?=
 =?utf-8?B?Mzd6Sk1nMnNvdzgwcE5CcmdaRnZqV1ZsY2Rrc1JCWXpudHA0V25JbUx0RStn?=
 =?utf-8?B?VzUvU1QveWZITDFYSldRdy9EbHpzS3NLNmpNK3RzRXBrRFU0UjF4enhFaXA1?=
 =?utf-8?B?amNRZVJ2akduWUtDNFR1a2IzbU9kMjNwQlBZQ0o3T1FWS3JaQkpFdW9EaHhL?=
 =?utf-8?B?N0RMVGhYaVFBRzdud01ldTdiNnpJenc1VFNhK0JINmpPRXNXVmlMbHRTcnhR?=
 =?utf-8?B?cXc2M3ExSHoyTlVPNFNjTDFhSUt1dndQa2JnTFVRd0FWVzd3RmhvY1BsRGk1?=
 =?utf-8?B?VzdGTjFRcGxRVkxEalQxVXFDaGFBSkx5N25YYkxtL2treFNPM3BiNVpLWGV1?=
 =?utf-8?B?TFRhNmEydHFhR2ttdEViRXlUcDZPVFNmbGFsNDRRdjRnYUlUUjJodWQ0Q09W?=
 =?utf-8?B?QVlRWXFBbkhTcWw3dnN3UDc3c2w1Z0ZJMUFkWm90ZlZodEhiQVpnWGxUYS9k?=
 =?utf-8?B?RU1oWU82Z3d4RC92bFhRQ05ybXh5UTlBVTNKOTdXZFJjSzExeDJ3WS9SOWVT?=
 =?utf-8?B?SnNaU3dwZ1p1V2FhQm1ocitxTmgvOHY3MHRhd0g3TldvUzVWNGtacTdBSXdO?=
 =?utf-8?B?U1FjNVhQVWNXVWpCcVMzN2ZIbGxHcURHWU1DbC9ac0hSbTJ6TThDOS9kVHNT?=
 =?utf-8?B?SENTekZyMmdDZWMrZFUxL01mRHlGYWNIVjFTMS9nQVhmeGhYUHlrWWtWVVUy?=
 =?utf-8?B?WFZuWmREdTBleUpHS1ltTDlIQUNERkRwU2FSSWRNdTR0SCtSUmdrRGxDMDB2?=
 =?utf-8?B?VndYaG5Pc094bUpBRFF1V25OZk9oRDBteVpoZVVtbEZrRUY0MUpYaDFPN2tD?=
 =?utf-8?B?Z2U4UzVjc3g4RWpIbUlWa1h4T0F3MHBZb2V4RjgyamhpNkJpZjdDNjVOMEZh?=
 =?utf-8?B?UmpUY056bUNGMkFmaGxhWlNIUVh0blVYbERGa2NXZHdaUGRmR25HMzlMNTRQ?=
 =?utf-8?B?b29nSllSR0M1WVRyU2Z1NnBpTWgrNzIyeFcvdjE4TlNUTWZQKzh5ckdZeDhB?=
 =?utf-8?B?YlNxY0Z3M3l6NWZxV3VMM0dNMFFJc0lUbENkRjlWTnF6VlNaajlvcUt3RzVo?=
 =?utf-8?B?WUR1UW9zclVQaXU0QTkzaVFDTkNGV2UweE44RzlPd1orc0hNb2FKSHB2SVRH?=
 =?utf-8?B?dGlKaUFsZFliODNMSzNuMEdoNWozRklRNmhNdHA3M0tNMjVnRk9zOEFjZCtX?=
 =?utf-8?B?cGNuUWgyeTRCOTNBR2FRNzZsSjhlRUVvVmpuS0FLVkhzc2lqclNLc1pCTnNQ?=
 =?utf-8?B?NjRBZ3Q1YlFSVDBXYmVQT2pLVjMvRHlMeTViWTRuM3RqbU4xZ21maE9FdHZE?=
 =?utf-8?B?bDdJZmlWNUZVQUJZZGlJMEE4ZjRacEtSTGtML3I2U3EzWm5ONVZYQVRKY2I4?=
 =?utf-8?B?eGV2Z25rVkJMR2RSK3Y5VlpRRnh0dGFkOWFlT2FLRmFEbXJYQVFYVjB5WUhi?=
 =?utf-8?B?cnpKZ1M0WW9FQ0NsUEUyWitQbXhlMmdmTXlucHBBem1KUExvaVlnK0FyTklM?=
 =?utf-8?B?NVRrTit3TWtlUjYwVEE0bFhmQW9kN001SGVtV2o5RHNGR0hCUG5PT2NxR2VR?=
 =?utf-8?B?NkROWDVZQVVRQkVsNUJuV0NjQTVtVzRPUWo4WnNVWWNCWUI2T0NQZzBuYXBG?=
 =?utf-8?Q?IvdqVgddBP0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkFUSVJ0NjNOZXNCNE4rUFJBRFJNcmJNbzhkYkdUaDJ6VUtuNzRVbXlEMjRH?=
 =?utf-8?B?bmRtV2NFU05CNndYOGVYOXRQWXh5UCtuRHMyd3pDSnNXREVMOFA0T3pxdFU0?=
 =?utf-8?B?a1pZQ2lsVG9kVGU2amo2d21kK1JrVERsbUxSL0V1aTQvZzJEQWR1YU5kS2NJ?=
 =?utf-8?B?NGpZNWp2dkpSNHJTWC9pVmtuc2pQbTYwV2htenRNKzA3RnllUWdKVkFaVGVj?=
 =?utf-8?B?N2lIdTFab0d0UGU1RG1SZUhjaG5kVVR0VDZYYzk4R3IzVkZGelE3SmZZcExo?=
 =?utf-8?B?aTI5VndIRWM5aE5vcEdWSGhZUDdqVnY4cjVGUnFobEQwd2FuSy9JQzJ3dWVW?=
 =?utf-8?B?blJUZXlvNjJ4b3BrYVQzb01rL0R0OTJoL2M3U2JkTTJjYldKejZzOG9LMFYy?=
 =?utf-8?B?Qzd4S08wa1VaazJ6dHMzU0hkazN2Z0NueU1NQ1hnL05Da0N0dzBnWWZNMU94?=
 =?utf-8?B?TUZXcEZFcmhTd2RRSUg0Unlzd2hueHB1M25VWXNVT1RGZFZGek4vbW0yRTBG?=
 =?utf-8?B?SzZneUMwU3JEUnczN3FXL2pYTk94bldaekVzeTNuNG9CbFVjUWJsS3F6amQr?=
 =?utf-8?B?RUpSS3ZZeHJ3VXRWT2QwQWNHcnZXVmk0ZkZ6dlpPV24xTkxsQkpDZG5EUWR1?=
 =?utf-8?B?RStENGlqdjQwYmcvaDVhelFmOGhHVWJRUVIyZjFIdFhaeTVCdGtNbzhJeVRV?=
 =?utf-8?B?cnJsMjdiR28xWlg5N20xd3VhVVRMQTVrNURNNU5aOTJuaXVUYXI4TmNSY1l2?=
 =?utf-8?B?MG42QVFTT1IvSm9sbVVxV1cwS2x5dzdnQmpDZHJsNGQrRUtNZUdIdXJnNCt3?=
 =?utf-8?B?QmlNR2MxQ2pTc2pLb3hZZytlRkJtdCtpVXlva0x6L2JtMUFORU5pWHJKbVJn?=
 =?utf-8?B?LzlzYmVIcm01RXR5bi9TWU1yaWZFUmRQSUNFSGJkQWtFNVRwdlVMaG54ZXdB?=
 =?utf-8?B?akZzUG9oZlZ2VWNFZktrM3pHUUo2UmQ5em9FRUFJWnNycnRvRTdMN2pGa0lD?=
 =?utf-8?B?ZUgzcWE3OSt0cW9ZbXNVWFlWOXYwaGVYODZTQnp1aGd3dUd3NWQ5c2NkWUlY?=
 =?utf-8?B?LyswbzNITzBYSndUejJhYnlsdkZsaW5GUjdJRldVZjFOYUNrWmFDaVZOQmtX?=
 =?utf-8?B?UEhybFkzKzYxZzNZek1TOEFMQW95a1RQY0dYNVFhUkJhWE90b1BiSXFPYXdx?=
 =?utf-8?B?SWV0eW1zSk1OM0Y2WnlhaHVPckwxZkVMUXRaTnZ0QU1kNnJ1K0lMTzBhem5S?=
 =?utf-8?B?eDlzQzVOcENOS2t1VFNrbjh4bHowblVxeVBLN0NYNk10aUswbkw0eFlqNWVV?=
 =?utf-8?B?TlZKazhLWHo0SjlmbDFIRThqSnNjdnpZUy9MQ0l6dW1XdkxmTUVUcmQyNVp5?=
 =?utf-8?B?QzhXMjNuS2tuN0pMcDFKZ2FWNzgxL25IT3hZL1lBc3JjTDV3c25tMDdzRjM4?=
 =?utf-8?B?VkROSUV1RWF0TVlaaGdydlNTYWkwK1EyRmlna3JiVXBLa1BmVExGUXhmcjkw?=
 =?utf-8?B?Tmc5eXdhRlZJZnFyWXYwZU92aXAxQktTM1hDbitsZ3M3eTU3aXU0RXVNZmo0?=
 =?utf-8?B?TStvaXZJRFhQVU5kU1BYWHBPaXFuTlQ4aEVGL0swT3Z2UCt6MHRKdU1PVnpI?=
 =?utf-8?B?T2VBNVpyejYxWENhdk1rSlcvZWluVmppd1dNOHdOaFd6b05pRUx3UlRwUVVk?=
 =?utf-8?B?MFFoYnNVbUdCVnFER015UjVOVHdZVk9IQ3RHMFh1eGs4ZUg3bkRkVUs3S0ZT?=
 =?utf-8?B?S2FWL1R6WklPS29YNCtYV0N3NVZvMTNVSVlQMGJTWk9YdTIrRFB0NnVxeGo1?=
 =?utf-8?B?NzllL2J6SlFVTEFXY3dyck9SeVJkU05kelA5RzF6Mll0bSttcjBwN3NTV2RR?=
 =?utf-8?B?R1Rib0grRHZJRWJCdXpiYUdBTXNvVXdXWHp6WjNqZ1VGY0VaMDJLaUdhZGhr?=
 =?utf-8?B?ODc1TnA0bDRNSkk5Y2lJbXhtNTdnM3ZlRXZQd1NzMk9XUGpKc2JwUlA5MVhv?=
 =?utf-8?B?cHorUStsT2cxZUNZdnphNjlMUm0vdE53RmR6SS90TXZpbURxZ095Um5hc3p5?=
 =?utf-8?B?Q3NENWlEVmRUNEdETVhkRWNjdGFqcFlxQnAzenU5U2l4SUkyeDVERmVQaVNU?=
 =?utf-8?B?TUUrcXZHbkd0bis4eVFnZk5lb2RmSzkwd0xaNmNqK1c0cUEwQytLU0ROMktn?=
 =?utf-8?Q?B1idi5QYB9xoBgFcSEISvg5LCNu/yZCWNWej29LzuE3Z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a089e4c0-840e-495d-bf80-08ddbacbf652
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:25:33.1761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcR/e2sfXP8A5J7fylcJtSoVsD410v3dRA57H3lnMkHZDl5shnAVQgNG1FtVK9kPHFRsHnjSGRozwpohCU+8og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6341
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

The provided example had its matching closing parentheses missing. Also
simplify the example itself and reword the explanation a bit.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 93e9055d5ebd5f78ea534aafd44d884da0fce345..8a2001c07654cd6516b09be330e7a595695b365b 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -76,15 +76,17 @@
 /// for cases where a register's interpretation depends on the context:
 ///
 /// ```no_run
-/// register!(SCRATCH_0 @ 0x0000100, "Scratch register 0" {
+/// register!(SCRATCH @ 0x0000200, "Scratch register" {
 ///    31:0     value as u32, "Raw value";
+/// });
 ///
-/// register!(SCRATCH_0_BOOT_STATUS => SCRATCH_0, "Boot status of the firmware" {
+/// register!(SCRATCH_BOOT_STATUS => SCRATCH, "Boot status of the firmware" {
 ///     0:0     completed as bool, "Whether the firmware has completed booting";
+/// });
 /// ```
 ///
 /// In this example, `SCRATCH_0_BOOT_STATUS` uses the same I/O address as `SCRATCH_0`, while also
-/// providing its own `completed` method.
+/// providing its own `completed` field.
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     (

-- 
2.50.0

