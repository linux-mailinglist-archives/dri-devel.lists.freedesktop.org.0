Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MVGDRZmc2mivQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 13:14:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0B4759C1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 13:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273A310EAD6;
	Fri, 23 Jan 2026 12:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="e7j7uxeS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012069.outbound.protection.outlook.com
 [40.93.195.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A5810EAF1;
 Fri, 23 Jan 2026 12:14:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjZCujp4FjOgFuASgJNGt9XGyNJW1nFm3DkwxZ0doZzx8t7XzudcZ+8O6Oih87nqT8AJoe7NdyDD3gnCymOTSLS1P5eeAjCKluhOT83RR29nzAfy1AWqOm6uK94W+VAd9+k/7HCngU9bw7pdQry/a4K4Wez2L4xOCq7kkkSwKhFRY0LEG2HN86ODlulHWgygENWj0Up1Nd94eGlHtPoDujBJSyGvitEIVX07bJOVITRYZKYs5SXZXrrgCRS5TYChzzBSAUFNGw2f5kboVh+JxYabOGkTj6BG15SMKCJSHv8rjg/IvgdvsLDywpkyrTcVcmUL4ubhiigu3zltb8b8uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4L77ny90WG7EFZHV07yroRY72SchU52VJwu83dEN25E=;
 b=UgwY/JbkwvrdOyj65cbiIm0Je3VAhUvNaAYj1sN2cYjenzR20eYNLqHtOnuAyDJGhHNpNpyq7xvMzDBuWS719vTvKH6N3p+4CVKdZnVATv7g0hHHfUsPq1U32AkutObIR51oRP40MZ3M6luEcOuVkY+Izfr2sw3ug92glojAKNeStgN2RZq1kKg4plrQE6D9jtU2v9E4fs0IoBDRDsUlpbtJnM228F/IM5pSl1fsGQTqROWT3SM27thSKvgbE/x30OjYJFUEmvr9SJ/fFqqe18XamzPqEidpqURxuoFIz1fQs1svsfQcPF65KPt4c69ccOnulWrNwH/Uw9aRzLNX3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4L77ny90WG7EFZHV07yroRY72SchU52VJwu83dEN25E=;
 b=e7j7uxeSGzNbubUk1SHQyNvUKhiBk74GFv7hw4QpHJnmihcK1TgL/xUVWrKTMJBfLhOLhPDa2Zv+30+uE9Sit3aw4IWe23n0MG8gTdfzv14O5zZiuiX8BKmGJw94Qn+BYM193WkiidUoOR22v4m9rbrR7tLQQ5vu0IIAZJgNH57rVqWbEje96No7tLDObp8zwcSuyJzvjd+lEnG8EOznTxZ1vs7rKyLrHdcujTMltAF52fjTGXKFuqAql91AXBiYLETepXxV6gNHns3B0Y6d95MFAekvVpi8tzuVNpghM9YB3W9j4bJEYlPsk8fY43iyK0xqh3PpTgEQeTJ2NYe4VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA1PR12MB8162.namprd12.prod.outlook.com (2603:10b6:806:33a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 12:14:07 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 12:14:07 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 23 Jan 2026 21:12:40 +0900
Subject: [PATCH v2 3/4] gpu: nova-core: gsp: fix improper handling of empty
 slot in cmdq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-nova-core-cmdq1-v2-3-e797ec1b714c@nvidia.com>
References: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
In-Reply-To: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: BY3PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::25) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA1PR12MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: cffff224-5d4a-478e-f3a3-08de5a78e86b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEVmTHFlalNqdFhBYXRJbElQek9Qbm11V2hoWE9PclBQRUc2eXN4anE2dDBU?=
 =?utf-8?B?TmVYYTlVRVViWmJMZVVONlFpeXJqSENVZkdmb3VVaXJ4TG5lb3NtRkVkb2dm?=
 =?utf-8?B?L0cvY1NUMm9RVWcrbjkwVVl3NUlwNlVrMmhCZklhRWR0bnc5bXhTTEY1MUZs?=
 =?utf-8?B?dWRPZWdqcFl0WUhLcnRtb3d0RmNHNEpObVl1NjM5V3ZtTGxpMStVZ09iSzZx?=
 =?utf-8?B?ZGNxaGFYbVZnL0cvYjVXNDZrQ3p3cXR6UGxHMW1KOGFrYkZKRzhlQ3YvQjA2?=
 =?utf-8?B?eWRTdHR0eUhnU2tiRE5VSW5ncFlwQkdPZmw1ckM4VklvWVNZbEo2b3NFS0x2?=
 =?utf-8?B?aEpzM3hkSGhiUitEK2NzdWpXUFBqeExEMG1pMGRDMWhyTS9DU1NBWHFlaHpZ?=
 =?utf-8?B?VlJrRmgzeVBkM1RaYXJYRkxLSkQ3OUxRcE9qM1Y3ZXZjWlc0NjBpdFZ6MC9v?=
 =?utf-8?B?dk44bTQ5M3U1NHFSdUNjdVlCWVlOcm53SkNYdkN3NGJLcjRIWnA3VnlFY0xi?=
 =?utf-8?B?UmFOankvdkVSTnpSZkpiYmk0VWxDSERKSWVCL0FpdERpTEtrT3pwdmhpK3NX?=
 =?utf-8?B?NEhlQ01yYXdqem5yR3NHa2sycjMzQ0hzU3ptL01QeUhJUkNjSVB2S3g1M1Yy?=
 =?utf-8?B?RDlLK1JwMEkxVmpKY0JiMGFkYllQZGZWeXZWWnE1cGFCYUgzRWRpTVJVOHVM?=
 =?utf-8?B?ODdqakt3eHBvVGNldFlTdjdFREs5U3VpeVUzZW1vNE5NT2JER1RXQ3lZZTdV?=
 =?utf-8?B?Wjh1cTZMR20yWUVRbzNGN2tPOW03V2ZNaUxmcEFsSmE1MDc3WHJxMnY0SmtL?=
 =?utf-8?B?aDlrT0RUVWhmb0dnVDZwVkZnSFFHYmc3RWM2eU9QSWdZWGtzalJyZFh1WWs2?=
 =?utf-8?B?aDBxdkYzREh0Y3NNT2R1dGQ2ZFQxcXo3VS9jSFVWRk4xbHVCcVlpUzF2Y0Vt?=
 =?utf-8?B?bmp2ZkwyUTJoRjZwS01UMkhTQ0hBNnRnMFc3eG5GTjliWUJuUU04bE03dU9v?=
 =?utf-8?B?VlZYR3pwMkZ1UGM2b25kUXBoTmJFZzgwaTV6S3lxSldKM29vWjdldHBqeHo2?=
 =?utf-8?B?Ritya2c2SzNKUzdDdDkvNlhMVjlqZzBNd05BYURreEl5S1ZxWEhJTVZCYk1n?=
 =?utf-8?B?TW1tMDFTUUsveERTaEJNUnE3SGRDZHpqRHJBdnEzcWRtTGNuUW44N2g1Ylk0?=
 =?utf-8?B?OGRZM0cvcGJHL1d4YjBXU2pQWFE5dHN5M0NuY0U1bkZ1ZFVHOEdLNHV3TFZu?=
 =?utf-8?B?UnVidWVTak5ZcDBGb0djOFp5akFLc3JTWFBYMSt1SFNHQVpZUm5BK2FjcE9W?=
 =?utf-8?B?ajA0WHJhTCtjMTBaRkVIUFViTUp1cWczcjFPeWdpd3M0OCtCeHFuWkQ2WVh5?=
 =?utf-8?B?Y2F0ZGEvcyt4SFF1aDRFUFFwN3pEaUhSR2tneFdxMWEwQWRVVHFEOWRTbTNY?=
 =?utf-8?B?VG8zWG91U2FEUDlJWU01aUdVckczYjNLM2Zld3F1L0lRaXhSWThaUi91Y3BN?=
 =?utf-8?B?WVloeUdhZmVNQ0JRZTdkMVplTEZCL3VqQTIzZWxUbTM2YzIrNmZnYkJJV0g5?=
 =?utf-8?B?U1o3UHI3YTlSbFYxME84RGt6Yng4aVlNdXcyd1UwdGdNWnJZd0RRd2d6WmU0?=
 =?utf-8?B?Yll6SHBhN3Z3dlRHcGNxRW01RXM4U05Qejg3cDVjYmpJV3ZRbHRWS1R5YzRG?=
 =?utf-8?B?NUtISVZRVXU3VHNtWmZKZVRaRjFodXJBR1NVdEZCMzBvUDh0UmVOeEszQlp2?=
 =?utf-8?B?MUp6d0FpVG9MNjhtYmlSL1hLRzQxTytQWElrTmttTFErVWx5MFBNcDFETEZm?=
 =?utf-8?B?OGxRV25MdU0xTWhUUkpGWXFBa01QMXZaSXVZb016Y0pkS3FXNjhTMlRJQzY2?=
 =?utf-8?B?SHRyVldPbGp6NXJSbjJPZnZJU3hHeDZtQkRKeXdteEhrTkoxNlk0eEREckVV?=
 =?utf-8?B?UWIyRWpZRnovRERDTjU3Yy85SDVUajdpYWhTNW9ENmx0UmdkTWhnajdFcWNV?=
 =?utf-8?B?bldnQTNXbkZIZW1WRkpFcDNadHRtbFJ3dVF5ZkNGSkJDRG9hTCtFNWt5ZDd5?=
 =?utf-8?B?TXpNYUpaWHk5eWVVWVo1NUVFTXowUG1FVm9odVBaaTVhT1BuSGtNbjhTTjNI?=
 =?utf-8?Q?aMWw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjBPbElBWUhNTTFMUHB1SEtaakJhYktiTzVWcjNPdFJ3NitPc1NXcTBhb2JH?=
 =?utf-8?B?RUhVTUt0WFVCVW5PdSt6VVNjcU95TS9KM3hmZzJvOVF6c1ZLdStNeEJpNks3?=
 =?utf-8?B?QlNiNDRGS21rUEh3YkxLTjNWcEQ5djM2ZVFKejdSQ0w4K1VuRU9PRTkxd0JQ?=
 =?utf-8?B?SXpySDJUR1R4cnRNS1liS0Nva2JZZ0h3c3hCeGs0S0FqY1pSZkhVTG1tNWta?=
 =?utf-8?B?aDNBUnlxNVkxbURLOXByM08zS1dPeW11ZmZOajV3K3k4eWFHeDZtN0pPVUpo?=
 =?utf-8?B?by9WNTdCcW1aallrZC9tRkNBQ0l6bUl2MXNCYTVyaDhMN0ZlRCszZnRaTWxV?=
 =?utf-8?B?ckNOKzZzTjlYR29KQ2ZNb0N0dDEzSTkxNGpUc2ZuQS9hL2VhQ1UzR0RDMjQy?=
 =?utf-8?B?czJ4MFBOT3laRkxGaklzZDdtSE1VUTh3aWExVE9zaVErQ20zQUJXVVcrZkUy?=
 =?utf-8?B?Y0xiWmR0b2pyTDZmOXZJNWZQYUZlWGU4MUVBMlNQUFFVUDhiM25aK0pwWTlt?=
 =?utf-8?B?QnpMM1VrMzRCWCsrRWxVbWNFNjJJSEFlSXo1ZEt4d3hMVHZIWGxZMmluRVUw?=
 =?utf-8?B?YUtMTjcyL29RS2VEQnN5aUpHa3FxcE4xa2s2VUtvYjR3ZVgzNU1HVTFITU9J?=
 =?utf-8?B?OVo4aVExb3lISVM0U1JVNlQ3dzdmaVAwMXVSdFpwdXpmT1RmbGVyczgyVUFk?=
 =?utf-8?B?ZFNPRTBLdXdBbnlRL0VzWHZVWWZWVms5NUZDbC9kWG5UTVA1VUhFOXpLOXJ4?=
 =?utf-8?B?Q3hrR1U3RWJ1WUJ6NitxcFltZlp6VXNEQ0I2bncvTzNOdXZyTGlzL0F4cXRM?=
 =?utf-8?B?RXl2Z0tyM2hWN3RLUU5SRjNNRjBlU2JhT1dLL3Y5R2YxWHBDQmpEOXU1UzVM?=
 =?utf-8?B?a1lKNHNOWnJlQlRrMzRINE1laW5aV21MbzN0UmxjUGp5RTJzVW1MWmFxaStS?=
 =?utf-8?B?Z0I3Yys4V241OU4rUWlpZFB2bmEvdEJXUldOOW9sVHJqS0F6YXRtNzg0cEl3?=
 =?utf-8?B?bnFjNE5vZTI1WEcwL0xOQXMyTU9CZzlqbFBTcGI5WVV2dnFMTWRabHQ5WDla?=
 =?utf-8?B?VGVIeUJDU05jTldXSUVZbnpNc3crdVF1R3ZCQm9EZHlvSzczK0o4MzZWemx6?=
 =?utf-8?B?V2xlRC9lRjZwanJZVTVzSDM3MGxGaFlvRmVndFl3R3U4OUozYzE0aTRtbjJU?=
 =?utf-8?B?ZU1LUkUya1c5Uk41bUdWOFRwanByeXNVUDdXY2dHRk1CcE15R3IxNFNMeTZS?=
 =?utf-8?B?Qm1EVTFuZjBzTjNrT1cyTE9oUlVudVEwNkd2NHlSR0ZjUU1vSGFDaGdNLzBn?=
 =?utf-8?B?K29uL3o2ZnAyMFhIZ2ZpaTRRZmlET2tuRmgvUERFcHBJSU1WVzJoaTR5ZHdi?=
 =?utf-8?B?UVBPd28vSElyeWdjc3pMZS80eFNGSHpoNjJoNUNsNi9VR0N0OUpEdks0cFlp?=
 =?utf-8?B?cXh4emlHWkdwWlBqN1JjalA0c1VKTGpUYmwwZFpWRFF0bER1WGsvQmVMV3dO?=
 =?utf-8?B?TmVZL250TzNyc01WS01ONFpneVVtU1h6cnhPL21paVRISk5NUFhSR0xKUVVm?=
 =?utf-8?B?QnlUNzBBdEpmcmxySXNuQTJoNi9iQm51THg5UkRpM2pTTE15bGxoZzk3RTd0?=
 =?utf-8?B?VGlsZFVnK2tITU1ObVJERGUwU05SakhIRS9XWTRSeU1CaUt6V0QrVE1HbzVP?=
 =?utf-8?B?b2xNM0xVVWRTZ1VkYk1RTXNPWFdKTGJQOHdNMUVleTFmRlZpWkYvbkRHSW54?=
 =?utf-8?B?blNzU2Q5Mm5PREFGQTJBR3ZYb0xDZEZtbTU2TWNRVWk1R3ZHNHlWcG1GUjdr?=
 =?utf-8?B?WlIyTWp6cE42cEZRRUxBZEZ5SkI5TEdJQ2pFYkhxMStndzg0bitEeVZaUlpO?=
 =?utf-8?B?QjlVR2VzZmF5ODNHMDMxZExuak1mS3FzUTVnV1E0dTcwTFVwNW9Wc1RMNTlN?=
 =?utf-8?B?QkJIMStWZ3p1WkNEK1BoM2JSTGlKd21FNW9MN1pOenNTQmxQNTBLN2FYMldj?=
 =?utf-8?B?bnZ6RVozTTI1b3AwcEtDUkVLNHFXREtJa3BSOFh4U3VXNzY1aDVFbHNHcW0r?=
 =?utf-8?B?NlJEbGcvdUpSd1NWOWtybHB2KzBCZHdHK2s5ZU5HQXRNeHZBK1dKK1NXUkVX?=
 =?utf-8?B?azlsM1dtUmRUa0ExR3RpdjM4blhFQ2tBd1lKaUZKVTBkZEZ2ZURNeGVQaSto?=
 =?utf-8?B?UFQ1T3hPN1oxSHMwK3BJNEJIV05VK2xpS3hiM2FPSkloVU5DYTdBaTFvdVg5?=
 =?utf-8?B?eG5BcnQ0dlpuclUreTNyTmlpRTZmb2JNS1hEdFF4SmpCU2dMVkF5V3F4akJq?=
 =?utf-8?B?amNERE1DSHVYeFppMzg0ZXdOdlRJbktTZittYzZ5M1d6TDFzM1hSWFFKTWxl?=
 =?utf-8?Q?8rvlCcL2i+zsLIuZqI/Fzcv7QuGXp7BGHIa0KMgFW7TeJ?=
X-MS-Exchange-AntiSpam-MessageData-1: 4SZNgmQZTi6zPw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cffff224-5d4a-478e-f3a3-08de5a78e86b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 12:14:07.6923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tksXpiGkVU30DBge6Gni4B3j4XF+xnn5OAPPh9jjWDIQoXI7w7Dw6UvSLpK2Byu06sbNoSmDnfCkIP/y3VGvQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8162
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: DA0B4759C1
X-Rspamd-Action: no action

The current code hands out buffers that go all the way up to and
including `rx - 1`, but we need to maintain an empty slot to prevent the
ring buffer from wrapping around into having 'tx == rx', which means
empty.

Also add more rigorous no-panic proofs.

Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 09c28eeb6f12..aa8758fc7723 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -227,21 +227,26 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `< MSGQ_NUM_PAGES`.
         let (before_tx, after_tx) = gsp_mem.cpuq.msgq.data.split_at_mut(tx);
 
-        if rx <= tx {
-            // The area from `tx` up to the end of the ring, and from the beginning of the ring up
-            // to `rx`, minus one unit, belongs to the driver.
-            if rx == 0 {
-                let last = after_tx.len() - 1;
-                (&mut after_tx[..last], &mut before_tx[0..0])
-            } else {
-                (after_tx, &mut before_tx[..rx])
-            }
+        // The area starting at `tx` and ending at `rx - 2` modulo MSGQ_NUM_PAGES, inclusive,
+        // belongs to the driver for writing.
+        if rx == 0 {
+            // Since `rx` is zero, leave an empty slot at end of the buffer.
+            let last = after_tx.len() - 1;
+            (&mut after_tx[..last], &mut before_tx[0..0])
+        } else if rx > tx {
+            // The area is contiguous and we leave an empty slot before `rx`.
+            // PANIC:
+            // - The index `rx - tx - 1` is non-negative because `rx > tx` in this branch.
+            // - The index does not exceed `after_tx.len()` (which is `MSGQ_NUM_PAGES - tx`)
+            //   because `rx < MSGQ_NUM_PAGES` by the `gsp_read_ptr` invariant.
+            (&mut after_tx[..(rx - tx - 1)], &mut before_tx[0..0])
         } else {
-            // The area from `tx` to `rx`, minus one unit, belongs to the driver.
-            //
-            // PANIC: per the invariants of `cpu_write_ptr` and `gsp_read_ptr`, `rx` and `tx` are
-            // `<= MSGQ_NUM_PAGES`, and the test above ensured that `rx > tx`.
-            (after_tx.split_at_mut(rx - tx).0, &mut before_tx[0..0])
+            // The area is discontiguous and we leave an empty slot before `rx`.
+            // PANIC:
+            // - The index `rx - 1` is non-negative because `rx != 0` in this branch.
+            // - The index does not exceed `before_tx.len()` (which equals `tx`) because
+            //   `rx <= tx` in this branch.
+            (after_tx, &mut before_tx[..(rx - 1)])
         }
     }
 

-- 
2.52.0

