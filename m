Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKTAJdKScWlZJgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 04:00:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4758C611FB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 04:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB1C10E8D8;
	Thu, 22 Jan 2026 03:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CKy3C3K9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013048.outbound.protection.outlook.com
 [40.93.196.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B56110E8E8;
 Thu, 22 Jan 2026 03:00:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foHeqZPHfeiXd6D8gJ7oQeZoK8nTEEB3x2ehTKVTPtxzEkYRpiW1TaMVxmhH214RPi4I6ZCxfaro9ZFDaZCOHT85OwslGkFQuUFfVB2rdWKYdIHrKgQW/PQ81wbq1DTMNKA99df5jsEAZrgRXbAB9iLsZ4lVZ6I7A9e3kRRFSe9Xw6asmLRKsZ2zBKuqArdG1A9FJ2NdFuXqbG2/nxqywH8bIwb2SkgEszoWPBCBnlqNDMcPCTrnjmFk2HT20/n+xv3laS5J/HM8g4K6DQMmrDCRew4EgRfetzReebaJkbuGLWN+Yp1NHq+UmfrYDMY4ZeiDHJMIh1ZPk05bDrLYbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DownGYYaCqYynl7Fe4boCCGRgn+1L3jhfdPMc+jCq98=;
 b=WPTU4GewYwUShPYZE1yBLat4pQnVaPmIS27nSjHW95OMyHhekGhs/LQngRsxPGmeZs4wzJGgdqSyndD+QOO8FmQptTWnNiwWZLhRX6RXdmqK0y0cYNVplWzRPl8PWp9fYh34vNNCXtKzpykdil+wxpPQjKH0R/Bu7nCafmIdGi49zAjDj/+jrGCYCKPVyGDGxNy0bUBnPaoflb8grVB+EDY20JDZK0xI19/X/9mqwANaFmeyF5oegoxEenmdzlBFDvD9NHq2W2NR1xLKBslbFe/MjjqureoZWzUIpFHCKyiVKinTMC2Z/M8xpggB8zYGkQ8NHp+/kTtQF5+LDd4Bmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DownGYYaCqYynl7Fe4boCCGRgn+1L3jhfdPMc+jCq98=;
 b=CKy3C3K9sFDWb/zek/MgqvRXDG5c4Nv/SC9TaDRRZwI409h01pjhubyjnSm18A2Rt3K32syhfZ6X/655BtuvOHfsL+sgpji4qz+PSuxG8Pdfu/cH87ATrMyAG8rgnK+338WpPfBaB4YsQlrbt3LO2E71KiRwW7HxgDIPCo9nxqy14C3xpidL9direOQ1OsxYSrmJ/od/1KsZWzXf0HJRhvICw7Y2ujiE5E/pgqWtkaWJtlcHxuVeQKcj5CuwhThlCD5GrVjq/4q0Q6orDIqnbknHqjtRSfBvesHeX2xnbqwMseqhwRc2MiSXaWhjpadqQx+x3uoHoS8YeWFB27XGgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA5PPF7D510B798.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 03:00:26 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 03:00:26 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 22 Jan 2026 11:59:06 +0900
Subject: [PATCH 3/4] gpu: nova-core: gsp: fix improper handling of empty
 slot in cmdq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-nova-core-cmdq1-v1-3-7f8fe4683f11@nvidia.com>
References: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
In-Reply-To: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0160.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::7) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA5PPF7D510B798:EE_
X-MS-Office365-Filtering-Correlation-Id: 6979a878-d0f4-4cc2-0deb-08de59626485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUJsS3hRWjlKRXpRZTVxVTJFK0k4RnpUakNKN2s3SVFrN2VDdHM1Y0VnaWVv?=
 =?utf-8?B?ZGtXZjhqYmJzdGlPSk9PNTNkZ2t1TEFVTlFPOVRrNm9mRnljNlBUdm9oUDZw?=
 =?utf-8?B?dFVOS1pJRk1lOWVFSXlSdGE1anFjUlRaejAzVnplY2VlMHdhb0R1ay92U3JR?=
 =?utf-8?B?RmhUdTZFSmRrMzdtemZCTlpoWW9tc05SaEhHcDJmNFJLdFlSd3RnUHJTZjlM?=
 =?utf-8?B?MjJNQmR0MENhdmpaMTRYWHpHZmM5R1QwbVJoRXdxNTFDK28vUVdSbWV3VC84?=
 =?utf-8?B?LzdrYTk2aitGTEl3ekhyNWFwS1hEN1doL1NWcm9senhHZFBVOUZIeDNvWlhk?=
 =?utf-8?B?bUxxbzc0UEdQTExwd05lSW1XOUJaN3lzcTBxSVl0TDlRUEVuUzY0OEVSKzhR?=
 =?utf-8?B?WDlqOCtvd1d2Z0ppTHQ2S3pTaXV2MEdNeFgwdXlKUC80eUZqQ0c1cjRhWTR0?=
 =?utf-8?B?SnI3akp1cVhhQnFmS0hUNDZ4WDlPQy9oODdZcFlzWUR5TWU0ZmUzUTIxNTdo?=
 =?utf-8?B?dVYyZUpKU3poZTYyWWdwVEIxaUdkdDFWUS9WcHh4ajVINWRPVXkwTVRwTFM3?=
 =?utf-8?B?UExLOXRrci9RWmhvOVlOM3FNbmd4UGZZdGtLc1ovcnlQd2IvT2t0TjI3Y2Vv?=
 =?utf-8?B?RHc3SFcySUdzV0JOUkoxNGxKdFZOWFEzV09TU09lK0RFaUNZcXN0eFlDTHd6?=
 =?utf-8?B?U09XRk9KcFAzMHVRbUNFMnhnTmtIRlhoc0VNbDR0eTlxalpqOHArK1U4Y2xH?=
 =?utf-8?B?YUN4K1EvR0VCSkd0RTZaOHpsRlNCRE1HUHliWFc1c2JMNUIzdHowL0sxM0Vk?=
 =?utf-8?B?dnZ5cHJvcHFsaXBxZUphQ0JBYklPdW0vS2RUZGpsWjBIVTRZTkNVeE4ycExJ?=
 =?utf-8?B?MFRtcXYxWFZIQnQ4eUNCclZUTHYzYlBsMmN2c2lveFBUdXhFQXoyZDBaR25L?=
 =?utf-8?B?TXN3Wnh4SWRHLzdLYlBNWm1vaCtaZjUyaGI1aER3aUVIdTk2YWpxSUFjZ0N6?=
 =?utf-8?B?QWhOcjUzcTR1K1U2WUNKdWwyeFBEaDFJT1laUHVPR29VejNSVWs1ZVJ2bmxi?=
 =?utf-8?B?UzBQS2Y3Ni9GQ2hNMFRGc3Fzb2FhVHlQTnhqYWZCZFRiS1lsdW5qRGpydlFo?=
 =?utf-8?B?R3R3QWkxSk5WaWg4eUF4eXJpOEg1UHlJR09mYzhPclJlZXNKMk11V0JFN0x0?=
 =?utf-8?B?dnZ0eVhXOVh5ZXdmbWNRby9jVy85STUrT0lzRHQzYTRSc3h2dTBIZm9KRGo4?=
 =?utf-8?B?bGZ1VlhvY2c5Vnp2bTZJNTZ0SXVPbnFtYjNOYU04MDh0cUhzUU5veGtUS0Q0?=
 =?utf-8?B?eGZMd3I5WS8reFgzNExsQ1NPZHZIaHpkZkVPb3habEp3c2JXUHM5MmREZldN?=
 =?utf-8?B?aFBlSFFDOFNoeVhhMjd4Vm5sc1RYZXBYQktJSXRlNDI0QzVGV2NhVXRpZTFN?=
 =?utf-8?B?Zi94U29EVGU4OEdhS0JlTWRlOENFQlUwSWlUWCtGcTFxUWgwSlN2Q1FWd0Jm?=
 =?utf-8?B?WWRxeFdpbVY0d2llQjdtcnVtM1d1ZjI3aU82SGtLZzlNcDNzVHRNNHduTTZ2?=
 =?utf-8?B?ZnpEaC9TUUMybXNkWGdNNm5PQ3k3eTlDdHZKYjNxWFh2Z3BQZ1VTK2dScG5Q?=
 =?utf-8?B?ZFRMQVEvYld0TFd3Mjk4dlM2dzJkd2k5SlQ5WUpSTVlsdU9GMlRaOHl5VEFI?=
 =?utf-8?B?TE0yeTBlNXV5SXoyWExhd0RrTDFneUJRWTBtMSt1cVJtaDg5dEZuQllTUzhG?=
 =?utf-8?B?MUY5cFV0T2VTRm1ma1hxMEt4THppL0tzUFIrV0pKb2hRZjkvenQyY2drUVdu?=
 =?utf-8?B?VXdMYTRJT3VZNjJyNUZjeUd1emlQaUVNaUMxNWRtR3lDb1Y3SlhLNklHTE5m?=
 =?utf-8?B?RVNWNFZoNFcwUHFwL291dkZKQ2FkWEdScFNrTWFVZkh1ejAvOUxxZ1pneHZu?=
 =?utf-8?B?d2lPYlNuNUh1SFo4WHppN0xxeTFjdGtTWDYzUTFVdXJhQk8vMlBzVEpaQUlH?=
 =?utf-8?B?QS9LR3RkTjFhQU5hWE40WTJvSEQ2NnNxTWFPWlpqc0FDTUl3UnNCaGdGU0pH?=
 =?utf-8?B?MWJCSW1kbVQweVFZYVZyWTJvQjlCQzdJYUVGSFh3bVphTXhiZi9kUDBFV3JH?=
 =?utf-8?Q?PGLw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YURUOTNrdGd0a3dhR01PT1Z3MGxmUGxDd1BBRkd0VCtxcTlacCtQUnU2QjN0?=
 =?utf-8?B?REU4RnBDSTUxTEJRU2wrRmhsS3VIWDRmVldRT2kzMnhYKytoOWgyM2d5M3NI?=
 =?utf-8?B?dkxaRUdkYVRGR0pWTFpPeGtwc3d6OXZDbjJEWmV5aEJUT0lTNU9zYmhpL3VT?=
 =?utf-8?B?NXBiVm1hYVQ1ZGNuYVFwSUliMzBzSjBUemVYd0xaOXgyUG1nVlNDRVBYYzVk?=
 =?utf-8?B?MVlIWGlWUWcxb3ZocllkTlFCcy9oc2FXY3RXUXJIR29lbHpCWEh1R3dTMkFF?=
 =?utf-8?B?MXhhbW5XV0xJT2daSkw0NFNwMHBaQmFtZXFZNXdvVm5mdlprNkZab09jaitz?=
 =?utf-8?B?U3NQS1R6RlJBY2RyZlV0YVlTMFJoRzNCRkhmbXZhL0xncTlwM2VNNVVxTVlr?=
 =?utf-8?B?RXBraEJQNzVobkcyUnFmZFNxSTZNZ3p2d09jU1NqdnRGL0c5akk5TStHSzc1?=
 =?utf-8?B?d0RVMVZKckltYnZjUlF4NHpkTmV2ZkV1TVNTVkVxdDYzdlFrUzhScW1MTGVT?=
 =?utf-8?B?NlFQeFpKYWh2YnBrWU1ndnB6YUttQVZJR1RndkRWYVNOWWFHdFVCQmkvSjVH?=
 =?utf-8?B?OHArK2xON0dMUW1Tb0dsejVaVXkyT05FVktDK1JEM0p3UVZ0RHJpeFczT3NT?=
 =?utf-8?B?RUZ5VE9zcDVGeUlBZGdMdnZsRFlsQW15TzNBU2E3dktlbFFFZHNXQkcxY2Zu?=
 =?utf-8?B?cXkrZDI5MGtnM215cE1JZWxPUHQzdjZDcmJRL3I0UktOVG1TdHkyRnlnanM0?=
 =?utf-8?B?NWg4Qk9rbGlzM1lZaHNmT1p2RVpiSDh0TDFvN3VwVkV5QkpLUTlFSWtYZG53?=
 =?utf-8?B?bG8veDJIUG8vOXZzZWVZL3ZaQmF2MGJJL3lORldpK2hxVW5MSE1yZFY1UlUv?=
 =?utf-8?B?MjdrOGV0NzkwamlYRjhaMnlEenl2T29GTE5uMkY3SXFrTFNWMmZtdkRnaHM3?=
 =?utf-8?B?R2dvTUlSLy84cjRoSkRKbk9UUVBPWTRFMDhkbXVPb3ZzZ05pdlMwZ3lvQjVX?=
 =?utf-8?B?V0gydUl4L2lxbXZqWkhURlZXbExnWVlnL1F0UmFMTG01RmU2dXYxUVZ2RFRw?=
 =?utf-8?B?T1p6M2RHMDY2SUljNy9YYjlLYWhnQWtyTlcyWmdSMDRUdDdGOXFuVVJuRnBj?=
 =?utf-8?B?NUVKT1hrMENOQ2x3OG5iUEp3UUJWdzA0ZWt6TzFod3FVaDc5WU1kU2x2cWN6?=
 =?utf-8?B?UFU5bmlHbjgwMTRZVUtmb0tBbkRkYkx5RTdza2lscG54d25QVU5WeFIvdkxn?=
 =?utf-8?B?RXFzamtscEovZUF1cWVoVy9kVnhFbi8vRnZ6Q1ZhbU5FdTRieU0xUjVnRVk3?=
 =?utf-8?B?Q2ltRnQ2aFp5ZmtiaFh5VENkMVVhaHdmU1VVUW9ZSVNYTXRHb0hNdkhZNTZ2?=
 =?utf-8?B?ajNLM2FKMTJseFI0eDZuQXlDV3VnZU9NWENPb0p0TXF0R0hpdGhPWk9yUUNv?=
 =?utf-8?B?ak9WVHBDUTF2TWZNTjVFejB1Z3JWdklYVmJMMGU3TERCWk5PMHhZdzRIaGR1?=
 =?utf-8?B?Y2o2eDh2QzFFZmZ1OUdSaUxEWEs5VGtyYklHbzN3MjdHZnpQWXhxV1pYT3FT?=
 =?utf-8?B?QnFRSEZFTEJQODJBbUozeUpDdVRRSHZRbjhScHpRZ2s1cHI3TUF1ODI3ZjNx?=
 =?utf-8?B?L0JIWGYxbThvOFRxRVRjRXRQeFg4SG9qVmEwdDd4TUI3WG1yQWMxWmhyY1pG?=
 =?utf-8?B?TTl2a25lVllEaGtvMytvRjZYT0VYSUFqZ0gxYWZoL2FSZW96RmVjS2VFSGUr?=
 =?utf-8?B?TG41QVBSTHVONllyNFU1aU9NL0I5dHdlNmFRaStvbFVjNlg4endORVNmdVJj?=
 =?utf-8?B?a0R6SGY0YUJCalB3dkJla0o5Mnpjc2hlemhEcUs2MFFDQSs1Y2pYY0VMTnFw?=
 =?utf-8?B?d2hGamxkUjlDdlpGUEdjaXZaVkZKNkhwbFJHRE03QWZSMGF6ZFRCYnRqWHpJ?=
 =?utf-8?B?VEdQYVhISDFmSnRyclV0ZmpDR09ZOGdjNmdubW9VMjlFNzJ2a2RvWlRhbzli?=
 =?utf-8?B?Ym9ta0xBMm5IRkVjZ1NHWW1XWHg3WjB1M3pTUWt4RUdESVp2cFlYa2dNSUt3?=
 =?utf-8?B?b0ZPbTZrY2RaeGE2eTU5NDMwS1NCRWZ4WUpDbG5ySVBkZW9XS0ttV3NqSW1k?=
 =?utf-8?B?Wm9PV2ZIZDRQK2VXQXg5aFZUTk1tRHZqN0tlOWJ6dk95SzFtVmR6T3VxM0Qx?=
 =?utf-8?B?bEhYTkY4bVFiOCsxOWlIMjNad1B2WXhBaXZQSnlWTUVhaS9sZ0NaZTlrS0lj?=
 =?utf-8?B?WHJvQTZLZVRYT3g0VGhHWlRRYWZ1ODUrT1daaWozM3gyUXJUUmU3VHZRWWtk?=
 =?utf-8?B?aUsvZHNENE9BWkwrZVBiMnhSSEN4dFQ2Rjdvc1YrS2dMZVBjNXQ4VE9JV2JO?=
 =?utf-8?Q?kRqypLBkbQxo2tLq92aQlwVeZiY+jkLwfzDO/zh//RD96?=
X-MS-Exchange-AntiSpam-MessageData-1: SMvRb+TaMX2tDw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6979a878-d0f4-4cc2-0deb-08de59626485
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 03:00:26.4063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7daNxVtJ8XgYsjD7S3nWFi3uOnU0MJAcwT0JqaH6nYbZVKRqQOBKblk9roxM0mQOysQ37EP0y36kCAWyWuq8bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7D510B798
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
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 4758C611FB
X-Rspamd-Action: no action

The current code hands out buffers that go all the way up to and
including `rx - 1`, but we need to maintain an empty slot to prevent the
ring buffer from wrapping around into having 'tx == rx', which means
empty.

Also add more rigorous no-panic proofs.

Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 09c28eeb6f12..b6d6093e3ac0 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -227,21 +227,24 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
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
+            // PANIC: since `rx > tx` we have `rx - tx - 1 >= 0`
+            // PANIC: since `tx < rx < MSGQ_NUM_PAGES && after_tx.len() == MSGQ_NUM_PAGES - tx`:
+            //   `rx - 1 <= MSGQ_NUM_PAGES` -> `rx - tx - 1 <= MSGQ_NUM_PAGES - tx`
+            //   -> `rx - tx - 1 <= after_tx.len()`
+            (&mut after_tx[..(rx - tx - 1)], &mut before_tx[0..0])
         } else {
-            // The area from `tx` to `rx`, minus one unit, belongs to the driver.
-            //
-            // PANIC: per the invariants of `cpu_write_ptr` and `gsp_read_ptr`, `rx` and `tx` are
-            // `<= MSGQ_NUM_PAGES`, and the test above ensured that `rx > tx`.
-            (after_tx.split_at_mut(rx - tx).0, &mut before_tx[0..0])
+            // The area is discontiguous and we leave an empty slot before `rx`.
+            // PANIC: since `rx != 0 && rx is unsigned` we have `rx - 1 >= 0`
+            // PANIC: since `rx <= tx && before_tx.len() == tx` we have `rx - 1 <= before_tx.len()`
+            (after_tx, &mut before_tx[..(rx - 1)])
         }
     }
 

-- 
2.52.0

