Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D55B1E0AA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 04:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE5A10E8AD;
	Fri,  8 Aug 2025 02:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GvK3jRpi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614CB10E8AD;
 Fri,  8 Aug 2025 02:46:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulw1ydwndsqo6DkuU+o/G/yP58aHQbQ0Ab7gut4qh+ntTN4XqQPJV9DFdpAR6vnW+QNKZLkAUgj2A43koKB2sed8DrYAYh8ZHnSKl1sSEi83iGLKglZbT6rh7Jsy8eqzRdMNJl7DiEfSltIoLbXO47G4mpdsun09qH6Zg25DNujf6nsgjA9rJuDgdidJ1FzN9XmYRNBQmwqQxDv6rPk69hR00IhHW0+SJFsBQj96MiZUwy5K11x6TZ4E2iw7vrJiMrFYjx6P80z9Lj2PIw5K7ja3yVlhRxo362hQ3tq6yG7hV/RPwgYDo9cihT/EyT/ags1BQ+UE3UjR3GDHpObNmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjPQhx3J5sLiSUwe4sm7aDZtf5w14HfIZPQ3xoLQiAg=;
 b=x73WmFbNA/VMkFrCBj50fm9pzV3HCXzzEhj7ney5nGi2ibM5ZiVMSq/hAd9M0iwAjKKw+tpJMgeZP61D/7hSoHY0b39+Mz8GhaBh8u5bYmwTYStqZzzpZz5nDUACTaPSYBawN/mcVS05DSZbUhiV9A51kfW7em+FVENf0TTVSjCZ/r+3auUI5xPVD2H2okLwwPxU76GLyvwRkc5Abu5xoe3UeOsf2Y8OfvDwPYLe4An8O1zWMZhAsO5sS6i9l71om3c/VD/Elj1zJIsjnr21vjSAFkI7h9eqGojPQ9yjE67h1/lr0xszvH6XwIvtOy5BRIq3u2gV/bF1MNe5Pg8HEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjPQhx3J5sLiSUwe4sm7aDZtf5w14HfIZPQ3xoLQiAg=;
 b=GvK3jRpiGilcPJsKqsIAhZXizBCzDbixPMr1RgoUO3cpSC/TKKW2rdAuRRTOPdL2XfhMaHeaKlG1rQRweV29nLkUUKpPZrSeHAMgcVoZbmMogZLgtTbKWH1rafil9f/fSOQ9JgFGVbkvre1z6GfU53cbpGHMfctC0eLPJlnvAuiV30OLOgioqTHz1A7hOiz49KWV3NTVegYLpF750FdUd5IoVVsKWbZP6ylSspkEAgOv124XzG2iuA/0S+QzPRgm/1MuZKc438kAQff+8g1UbE+1JtBQqdbgaV0W0U5zUAjp6QO4iLI6a7lz1DloMOy4O7+0DdSEKHVtVB2oWun0FQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW5PR12MB5600.namprd12.prod.outlook.com (2603:10b6:303:195::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Fri, 8 Aug
 2025 02:46:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 02:46:49 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 08 Aug 2025 11:46:41 +0900
Subject: [PATCH 1/2] gpu: nova-core: vbios: replace pci::Device with
 device::Device
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-vbios_device-v1-1-834bbbab6471@nvidia.com>
References: <20250808-vbios_device-v1-0-834bbbab6471@nvidia.com>
In-Reply-To: <20250808-vbios_device-v1-0-834bbbab6471@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0161.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW5PR12MB5600:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f5839c-e31b-498a-2941-08ddd625d26e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGNNMnNFd1lRekVJOS9aejRERWhOZEpEdDduTTF0MmlpdnkxNjlPSGxxdXJ4?=
 =?utf-8?B?TlNBYlFndVJucUhHNko1OFkxSGlIVU1DcjUxdGt6eVoyelQvS0o0L052M09B?=
 =?utf-8?B?dWFIR2RxSjVjdkYyYmNXeUdtY2dSbno0ZFBnVmtvL3Z0Zi8zd24xOHJCWnZF?=
 =?utf-8?B?TVI2d2hUUE1rN0hoaC9OVEtLd3NCWGlvakVhS0hKZ0hDNlVCRVp3K0ZydmF0?=
 =?utf-8?B?V3FLdGZCckZkOXp0eEplYUdEZjlKM0R3MFpnaDZJWTA5RzBtZlN1L3pwMHVn?=
 =?utf-8?B?L0FNNGtkOXUrd3h0RU5SNTFSdERyZ2ZNTmdSdmVlMG1rTTBsNGRFUUV3Q2Nt?=
 =?utf-8?B?MDdnd3JLTjhXNXVveExwcTA2bU44SmJBb1JhQWdLU0tnWjNLRFJqZHpqbFFR?=
 =?utf-8?B?LzcxTlM4Um1RaFJDLzJiYWZtMDZMUWJpY0lVZW9iZURIaEx2dXNZZWU4dFRS?=
 =?utf-8?B?TXFlQm5vdHJqcmYvQWxmN2Urd3VjYlh5Rk5LeURDbHBsRGhoQy9NckhKeXly?=
 =?utf-8?B?QVdkSGZIVDhNZWxCV0UvelpFYVBxZ0d4SEs1S3ovZnhFeTY3bVdBZDMzVGpL?=
 =?utf-8?B?MzBzaTdNbVpTZUw4dWZTTUlvNkc5alZEVlV0RXk0Ky94Znp3M3pncEVQblY3?=
 =?utf-8?B?NWZNM0Evb3F4UkhJMTk5aTJzdUs0YmJHTm10WmVjQllyU3pMUk1sVURCdHlD?=
 =?utf-8?B?aWRIS3prYUlNOGttQ3dlaDJsVEMxa1lpemNyekZxTmtjcUwwbGI5USsyRXBx?=
 =?utf-8?B?UGVGVm5FYjN5M1ZXZ3BuRmFrNXM3Qm1rd1BRamlnTVhscWQ5S3kyRVZKdlJU?=
 =?utf-8?B?WXlON1hMOUxCRlBoR1dyQnBkVkhKNGV1Unc3bnFpMDF3c1hraktsM2s2Umkv?=
 =?utf-8?B?cmRDUFlFZ01GaUlOSGovUDFMUjdpVDF1enNncVNnVjRORE1NY1huN2NEUWg4?=
 =?utf-8?B?QlJwcjRVUzhyRXc1VUdHS0FLR1I1TDFUL25xeTJWM0Vob1dpaHdrZ2R2eVVV?=
 =?utf-8?B?VGQxeTlOWFhRNGVOZjQ5QklaZ01pQS9nY1psSU91dXR1eHRZbmpLc1gyTUtn?=
 =?utf-8?B?NkhtV2p0NWpZZVpSQWN6Q3lmUFk2Qmd1UmgwajM1NXI3VVpGUDJQckExQW94?=
 =?utf-8?B?S3g5T1VZUENKWjRIWXl3aFlwc3Q4bittNmtUZjhNN21Cb3gvTXdPU0loVGhp?=
 =?utf-8?B?T0pRdUN0UU85Ui93L0lTNFVyRE5UclZGczJkQ0crbU85Y3VUZExoWXI4bkxn?=
 =?utf-8?B?bmFsM0M1RkRYdWhzdjRZY3pzbWpWNURJZ3ZlT3Ewd003OWVtZ1JTbE05ZWw3?=
 =?utf-8?B?aGl1V1ZIV1FCY21QQURBVXExcUdTWTAwNElwcXQ2MllONDNFRk1ISkpGbDNC?=
 =?utf-8?B?MlBLYkdQL0gyRSs1QVJ2RTlWS2drd1B1TlhLdFV3N3JtTmFuT0tibUFFN1dV?=
 =?utf-8?B?dG51RGFZSDh4R2dyYjVtLzBDejQraXZZQ3E4ZG9GK2FxR1BiNDBYZ0Nucko0?=
 =?utf-8?B?YWZLbDNEdkNhWE9FRXdlcWRUTkxvdzAyK0h6OERPZGhFTkV6OFl5bm4zdzRE?=
 =?utf-8?B?dERXV01wc3RicEFKNUdKeUtsNGw3dGh2TWl2RlpmaCtZb3BobENFK21JeXlK?=
 =?utf-8?B?akVNVG5ZTDdYM2k4VDJ0aWNvRHo4MDRPb0w3SDVvUk03WTdpNjZtRU9VNjRD?=
 =?utf-8?B?blRGRnhJbk1kcFZvcUc3SEppVi83VkxDRGFaUXljcndxdExNQzRXa3RrRGxl?=
 =?utf-8?B?UzE4WjZUQW5tY2Nkd1A2UG1DbWthSlRHZzdrbDN1YlFOcWlKeXVwVXR4R3VS?=
 =?utf-8?B?K0thN0V2UkZwOTBJSDB5ajlmT20ycksreFBXT1F6ZkJqWml0MjN4NUEyU3lm?=
 =?utf-8?B?WEpyalRDT3JBa0E4OGJzVTNHcGY3Q2JweVlOZFJJcC9nNGhHTExzQ0duVFJ0?=
 =?utf-8?Q?DhHdzqOfHMY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHp4dHc1ZnEvL0Q5bjBmY1d5QlJBT1dhL0FNL1hQR1l6bmUybVptWkZXSjlW?=
 =?utf-8?B?NGpVZmJkZDY3QUZYNHByR1JxSTNOb2k3eXk5dHQ2NU9EOW0vNW5iWWZEZEc0?=
 =?utf-8?B?a09hazdwQlVUT2Z4KzRwazBucVZFSkJCY2ptb2FHLytnMkJxSDZVOTZvVm5Q?=
 =?utf-8?B?ME1IR2RYaDdSWDl5VTdPN25LQ1Bnc1lyMnJqYWpMSUxOWFoxUnZ2UDlkS0NH?=
 =?utf-8?B?MEErdWxpTWNSUnVZZ3FXdk5iOGo5amVCRFY5NUJSM2pGQ0VpQTBmVnVRa0Jv?=
 =?utf-8?B?TkFja1JsQk84S1NVMnNNTk4zdTByL2RCelRnR0hOVUptMFhPMUhpSTdDRE5Z?=
 =?utf-8?B?eCsxbjFZVVdDQlRUVHhiTS9pellIK2o5RTdYeWJSci9OcFBsU2YwYTNGanRI?=
 =?utf-8?B?cHhQOW4vNDR2a2xGTWVXNlN2OTR4Zm5zcW1iUSt5NEtlQ2ZDM2JBakdFS2FE?=
 =?utf-8?B?T3BYV2lGeWV6bjJ1eU5NK1dScXFrd2ZoUmhkQy9KckRYVXZHS3BJczBqOExh?=
 =?utf-8?B?WE0wN1JnRkUrM25aNmpxUUp0WEcveTErSmR1R3grMGg4ZzE3SG5Tby9nYmpI?=
 =?utf-8?B?M3lnU1NvelQydzBCM2xoeHp5TkE3Tm92TUtpanRRWWRKNC90TjdQNlBhYkJ2?=
 =?utf-8?B?eEFQaGM0WFlCckxwY2wzN2RBdzlTbFVlUlljV3NKaWVQSlphRTdDMEI5dnpu?=
 =?utf-8?B?SHpxTW90YmMxclppaXloZHM0Yy8xcnZYMk8zOHBBN2gvYy90QVp6QVg2RC9W?=
 =?utf-8?B?UGlPWTNjWkdPbWlGRENKTHUxWEEraTJWdmJjN1ZzRUlYWm9ZWXFnWWE4WUc5?=
 =?utf-8?B?dk5GV0NFYTZBek1zdXdJOG0rYkhUTncwd3AwV010cnltUy9GcHhZQkFOWTR4?=
 =?utf-8?B?RHhVTGhOYVFqRWcxQ2NjZjF3MDErYjJaVnVHWkkySXNCRDVjQnAvMGt5ejV6?=
 =?utf-8?B?aGJjL2N1LzBBVWxHWmxPUWM0MzZ6dFdlUnFjYmhzNGhXc2h3YWovQnZKM0VB?=
 =?utf-8?B?QjFBaGxJUTNlQkJyRzYwZXZINzFoeHoyMXpqYnZpMjFwWEJqZ2ZVdngvSTJq?=
 =?utf-8?B?TDRSWm1teHdzY0RWSlQrUFl5enlMRmluK2VYQU44VDJQNWRZTDZPZjI2cU5S?=
 =?utf-8?B?TVNoSTJkaGJBbXEya2M4Z29obWFBVC9QeDYzN3BicXRkUEcyZ2I2WUpJakwy?=
 =?utf-8?B?Z05PR1B0M0laS1I5UzJIYmIveDl0OVI1ZDMxbnNtMnVvdXdJLzRROG1MQ1Vi?=
 =?utf-8?B?TWZ5TGlBSTV0c1F2djM1VUZPNGc3Zkt2Ry9NN2RNL3JvNmZBUlNUbTVLZG5n?=
 =?utf-8?B?cDdHVVlJSHRDWWIyS0hJclFLNGRieW5ZN21kWUNQeGZLMlpFMTk3QzZYN1dH?=
 =?utf-8?B?RmlkNmZTeEwyREsvNDBUbjFnK0tCL3FMOU1rdTZaSTRSVHRHQzhCMmxjdWFC?=
 =?utf-8?B?RmNVcnZScnpFWld0ZGFKNHdSVkpwS1dhcWQwT1VwZENzLzJ3NnhzQXZGMUl1?=
 =?utf-8?B?SytVYTByYzhCOXczRDE3bjY3dGF2Ujh3TzhkWlZBT0hLY3lZUW9xZGRKU1hV?=
 =?utf-8?B?OWFFTGFYdWlCZVc0U09DM1hDdEJYMS9SNUdkdloxSXlKWndvSEg2NXV1WTgw?=
 =?utf-8?B?MW1mRzlGNFJucmxsM0N4Zlk3RE00WnBqYUhOZktwS1VPZzhTeVlGQ2FPSUhP?=
 =?utf-8?B?c3F5Q0R4ZGFvWGNOZGR0bTVyR3lMYmRMRVpWSGI2Unp0S2hFdzg2cXkrazJa?=
 =?utf-8?B?YWxFTXZWQmxHclFOTEhsU2UxMkR1UVFBckh4NjQ2b3pGd3hPRXZVMmhFYWZE?=
 =?utf-8?B?Ulo4WEkvQitHbU15bWN0azQ1N1V5T2RZNTlxZGVsU2JJaFNaWFZuakZZUGpu?=
 =?utf-8?B?bGV2WEVrbDJLUTVxejhRVlFIbGdILzZrbmJ6K1VrbVVNbUczK1Q1ZjhBZ2ZS?=
 =?utf-8?B?cVlEQkUrbjhGdW1ZN2pxalJWQ2xaV1NFS2gzUk9ZalFDUkcrdkJFYm1wM00v?=
 =?utf-8?B?a2NhOEQwTW5pWm0xNmF5ZzNTSStJVDgxMlRVWXFqNUJ0SVpUdE55M2Q4MjYy?=
 =?utf-8?B?dnIvWXVIS2lSc3MwWnRJamJBOEtrdmtlbUhnZkthZ0Zqd1ZmM04yamRlVzBO?=
 =?utf-8?B?bWc3TFQ3NjgzMGpIRnpCMTJRQ2NENkJCdmgrQlNoSG9zc3QzTnFEK05rOHRY?=
 =?utf-8?Q?S4wUHk+O9yOeeWaue/6//p7RfJ+p8JB4A2sq/fwEW0TG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f5839c-e31b-498a-2941-08ddd625d26e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 02:46:49.0307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I//AyUt/ENiBNmGNMB1C97dcYzcvLb9ntnNdCX3Oo9Aa/stBacc6m1nabG+YL/EUellZEyrwsClnJRKvJL5vjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5600
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

The passed pci::Device is exclusively used for logging purposes, so it
can be replaced by a regular device::Device, which allows us to remove
the `as_ref()` indirections at each logging site.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs   |   2 +-
 drivers/gpu/nova-core/vbios.rs | 135 +++++++++++++++++------------------------
 2 files changed, 57 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 72d40b0124f0c1a2a381484172c289af523511df..33082ac45873ee4cf91d7d8af499efa984af4ba9 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -298,7 +298,7 @@ pub(crate) fn new(
         let fb_layout = FbLayout::new(spec.chipset, bar)?;
         dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
 
-        let bios = Vbios::new(pdev, bar)?;
+        let bios = Vbios::new(pdev.as_ref(), bar)?;
 
         Self::run_fwsec_frts(pdev.as_ref(), &gsp_falcon, bar, &bios, &fb_layout)?;
 
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 5b5d9f38cbb3a6b1c374c1e0eee2509eb8d5660c..b5564b4d3e4758e77178aa403635e4780f0378cc 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -8,7 +8,6 @@
 use core::convert::TryFrom;
 use kernel::device;
 use kernel::error::Result;
-use kernel::pci;
 use kernel::prelude::*;
 
 /// The offset of the VBIOS ROM in the BAR0 space.
@@ -31,7 +30,7 @@
 
 /// Vbios Reader for constructing the VBIOS data.
 struct VbiosIterator<'a> {
-    pdev: &'a pci::Device,
+    dev: &'a device::Device,
     bar0: &'a Bar0,
     /// VBIOS data vector: As BIOS images are scanned, they are added to this vector for reference
     /// or copying into other data structures. It is the entire scanned contents of the VBIOS which
@@ -46,9 +45,9 @@ struct VbiosIterator<'a> {
 }
 
 impl<'a> VbiosIterator<'a> {
-    fn new(pdev: &'a pci::Device, bar0: &'a Bar0) -> Result<Self> {
+    fn new(dev: &'a device::Device, bar0: &'a Bar0) -> Result<Self> {
         Ok(Self {
-            pdev,
+            dev,
             bar0,
             data: KVec::new(),
             current_offset: 0,
@@ -64,7 +63,7 @@ fn read_more(&mut self, len: usize) -> Result {
         // Ensure length is a multiple of 4 for 32-bit reads
         if len % core::mem::size_of::<u32>() != 0 {
             dev_err!(
-                self.pdev.as_ref(),
+                self.dev,
                 "VBIOS read length {} is not a multiple of 4\n",
                 len
             );
@@ -89,7 +88,7 @@ fn read_more(&mut self, len: usize) -> Result {
     /// Read bytes at a specific offset, filling any gap.
     fn read_more_at_offset(&mut self, offset: usize, len: usize) -> Result {
         if offset > BIOS_MAX_SCAN_LEN {
-            dev_err!(self.pdev.as_ref(), "Error: exceeded BIOS scan limit.\n");
+            dev_err!(self.dev, "Error: exceeded BIOS scan limit.\n");
             return Err(EINVAL);
         }
 
@@ -115,7 +114,7 @@ fn read_bios_image_at_offset(
         if offset + len > data_len {
             self.read_more_at_offset(offset, len).inspect_err(|e| {
                 dev_err!(
-                    self.pdev.as_ref(),
+                    self.dev,
                     "Failed to read more at offset {:#x}: {:?}\n",
                     offset,
                     e
@@ -123,9 +122,9 @@ fn read_bios_image_at_offset(
             })?;
         }
 
-        BiosImage::new(self.pdev, &self.data[offset..offset + len]).inspect_err(|err| {
+        BiosImage::new(self.dev, &self.data[offset..offset + len]).inspect_err(|err| {
             dev_err!(
-                self.pdev.as_ref(),
+                self.dev,
                 "Failed to {} at offset {:#x}: {:?}\n",
                 context,
                 offset,
@@ -146,10 +145,7 @@ fn next(&mut self) -> Option<Self::Item> {
         }
 
         if self.current_offset > BIOS_MAX_SCAN_LEN {
-            dev_err!(
-                self.pdev.as_ref(),
-                "Error: exceeded BIOS scan limit, stopping scan\n"
-            );
+            dev_err!(self.dev, "Error: exceeded BIOS scan limit, stopping scan\n");
             return None;
         }
 
@@ -192,18 +188,18 @@ impl Vbios {
     /// Probe for VBIOS extraction.
     ///
     /// Once the VBIOS object is built, `bar0` is not read for [`Vbios`] purposes anymore.
-    pub(crate) fn new(pdev: &pci::Device, bar0: &Bar0) -> Result<Vbios> {
+    pub(crate) fn new(dev: &device::Device, bar0: &Bar0) -> Result<Vbios> {
         // Images to extract from iteration
         let mut pci_at_image: Option<PciAtBiosImage> = None;
         let mut first_fwsec_image: Option<FwSecBiosBuilder> = None;
         let mut second_fwsec_image: Option<FwSecBiosBuilder> = None;
 
         // Parse all VBIOS images in the ROM
-        for image_result in VbiosIterator::new(pdev, bar0)? {
+        for image_result in VbiosIterator::new(dev, bar0)? {
             let full_image = image_result?;
 
             dev_dbg!(
-                pdev.as_ref(),
+                dev,
                 "Found BIOS image: size: {:#x}, type: {}, last: {}\n",
                 full_image.image_size_bytes(),
                 full_image.image_type_str(),
@@ -234,14 +230,14 @@ pub(crate) fn new(pdev: &pci::Device, bar0: &Bar0) -> Result<Vbios> {
             (second_fwsec_image, first_fwsec_image, pci_at_image)
         {
             second
-                .setup_falcon_data(pdev, &pci_at, &first)
-                .inspect_err(|e| dev_err!(pdev.as_ref(), "Falcon data setup failed: {:?}\n", e))?;
+                .setup_falcon_data(dev, &pci_at, &first)
+                .inspect_err(|e| dev_err!(dev, "Falcon data setup failed: {:?}\n", e))?;
             Ok(Vbios {
-                fwsec_image: second.build(pdev)?,
+                fwsec_image: second.build(dev)?,
             })
         } else {
             dev_err!(
-                pdev.as_ref(),
+                dev,
                 "Missing required images for falcon data setup, skipping\n"
             );
             Err(EINVAL)
@@ -284,9 +280,9 @@ struct PcirStruct {
 }
 
 impl PcirStruct {
-    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+    fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
         if data.len() < core::mem::size_of::<PcirStruct>() {
-            dev_err!(pdev.as_ref(), "Not enough data for PcirStruct\n");
+            dev_err!(dev, "Not enough data for PcirStruct\n");
             return Err(EINVAL);
         }
 
@@ -295,11 +291,7 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
 
         // Signature should be "PCIR" (0x52494350) or "NPDS" (0x5344504e).
         if &signature != b"PCIR" && &signature != b"NPDS" {
-            dev_err!(
-                pdev.as_ref(),
-                "Invalid signature for PcirStruct: {:?}\n",
-                signature
-            );
+            dev_err!(dev, "Invalid signature for PcirStruct: {:?}\n", signature);
             return Err(EINVAL);
         }
 
@@ -308,7 +300,7 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
 
         let image_len = u16::from_le_bytes([data[16], data[17]]);
         if image_len == 0 {
-            dev_err!(pdev.as_ref(), "Invalid image length: 0\n");
+            dev_err!(dev, "Invalid image length: 0\n");
             return Err(EINVAL);
         }
 
@@ -467,7 +459,7 @@ struct PciRomHeader {
 }
 
 impl PciRomHeader {
-    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+    fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
         if data.len() < 26 {
             // Need at least 26 bytes to read pciDataStrucPtr and sizeOfBlock.
             return Err(EINVAL);
@@ -479,7 +471,7 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
         match signature {
             0xAA55 | 0xBB77 | 0x4E56 => {}
             _ => {
-                dev_err!(pdev.as_ref(), "ROM signature unknown {:#x}\n", signature);
+                dev_err!(dev, "ROM signature unknown {:#x}\n", signature);
                 return Err(EINVAL);
             }
         }
@@ -538,9 +530,9 @@ struct NpdeStruct {
 }
 
 impl NpdeStruct {
-    fn new(pdev: &pci::Device, data: &[u8]) -> Option<Self> {
+    fn new(dev: &device::Device, data: &[u8]) -> Option<Self> {
         if data.len() < core::mem::size_of::<Self>() {
-            dev_dbg!(pdev.as_ref(), "Not enough data for NpdeStruct\n");
+            dev_dbg!(dev, "Not enough data for NpdeStruct\n");
             return None;
         }
 
@@ -549,17 +541,13 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Option<Self> {
 
         // Signature should be "NPDE" (0x4544504E).
         if &signature != b"NPDE" {
-            dev_dbg!(
-                pdev.as_ref(),
-                "Invalid signature for NpdeStruct: {:?}\n",
-                signature
-            );
+            dev_dbg!(dev, "Invalid signature for NpdeStruct: {:?}\n", signature);
             return None;
         }
 
         let subimage_len = u16::from_le_bytes([data[8], data[9]]);
         if subimage_len == 0 {
-            dev_dbg!(pdev.as_ref(), "Invalid subimage length: 0\n");
+            dev_dbg!(dev, "Invalid subimage length: 0\n");
             return None;
         }
 
@@ -584,7 +572,7 @@ fn image_size_bytes(&self) -> usize {
 
     /// Try to find NPDE in the data, the NPDE is right after the PCIR.
     fn find_in_data(
-        pdev: &pci::Device,
+        dev: &device::Device,
         data: &[u8],
         rom_header: &PciRomHeader,
         pcir: &PcirStruct,
@@ -596,12 +584,12 @@ fn find_in_data(
 
         // Check if we have enough data
         if npde_start + core::mem::size_of::<Self>() > data.len() {
-            dev_dbg!(pdev.as_ref(), "Not enough data for NPDE\n");
+            dev_dbg!(dev, "Not enough data for NPDE\n");
             return None;
         }
 
         // Try to create NPDE from the data
-        NpdeStruct::new(pdev, &data[npde_start..])
+        NpdeStruct::new(dev, &data[npde_start..])
     }
 }
 
@@ -669,10 +657,10 @@ fn image_size_bytes(&self) -> usize {
 
     /// Create a [`BiosImageBase`] from a byte slice and convert it to a [`BiosImage`] which
     /// triggers the constructor of the specific BiosImage enum variant.
-    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
-        let base = BiosImageBase::new(pdev, data)?;
+    fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
+        let base = BiosImageBase::new(dev, data)?;
         let image = base.into_image().inspect_err(|e| {
-            dev_err!(pdev.as_ref(), "Failed to create BiosImage: {:?}\n", e);
+            dev_err!(dev, "Failed to create BiosImage: {:?}\n", e);
         })?;
 
         Ok(image)
@@ -773,16 +761,16 @@ fn into_image(self) -> Result<BiosImage> {
     }
 
     /// Creates a new BiosImageBase from raw byte data.
-    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+    fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
         // Ensure we have enough data for the ROM header.
         if data.len() < 26 {
-            dev_err!(pdev.as_ref(), "Not enough data for ROM header\n");
+            dev_err!(dev, "Not enough data for ROM header\n");
             return Err(EINVAL);
         }
 
         // Parse the ROM header.
-        let rom_header = PciRomHeader::new(pdev, &data[0..26])
-            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to create PciRomHeader: {:?}\n", e))?;
+        let rom_header = PciRomHeader::new(dev, &data[0..26])
+            .inspect_err(|e| dev_err!(dev, "Failed to create PciRomHeader: {:?}\n", e))?;
 
         // Get the PCI Data Structure using the pointer from the ROM header.
         let pcir_offset = rom_header.pci_data_struct_offset as usize;
@@ -791,22 +779,22 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
             .ok_or(EINVAL)
             .inspect_err(|_| {
                 dev_err!(
-                    pdev.as_ref(),
+                    dev,
                     "PCIR offset {:#x} out of bounds (data length: {})\n",
                     pcir_offset,
                     data.len()
                 );
                 dev_err!(
-                    pdev.as_ref(),
+                    dev,
                     "Consider reading more data for construction of BiosImage\n"
                 );
             })?;
 
-        let pcir = PcirStruct::new(pdev, pcir_data)
-            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to create PcirStruct: {:?}\n", e))?;
+        let pcir = PcirStruct::new(dev, pcir_data)
+            .inspect_err(|e| dev_err!(dev, "Failed to create PcirStruct: {:?}\n", e))?;
 
         // Look for NPDE structure if this is not an NBSI image (type != 0x70).
-        let npde = NpdeStruct::find_in_data(pdev, data, &rom_header, &pcir);
+        let npde = NpdeStruct::find_in_data(dev, data, &rom_header, &pcir);
 
         // Create a copy of the data.
         let mut data_copy = KVec::new();
@@ -848,7 +836,7 @@ fn get_bit_token(&self, token_id: u8) -> Result<BitToken> {
     ///
     /// This is just a 4 byte structure that contains a pointer to the Falcon data in the FWSEC
     /// image.
-    fn falcon_data_ptr(&self, pdev: &pci::Device) -> Result<u32> {
+    fn falcon_data_ptr(&self, dev: &device::Device) -> Result<u32> {
         let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
 
         // Make sure we don't go out of bounds
@@ -859,14 +847,14 @@ fn falcon_data_ptr(&self, pdev: &pci::Device) -> Result<u32> {
         // read the 4 bytes at the offset specified in the token
         let offset = token.data_offset as usize;
         let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
-            dev_err!(pdev.as_ref(), "Failed to convert data slice to array");
+            dev_err!(dev, "Failed to convert data slice to array");
             EINVAL
         })?;
 
         let data_ptr = u32::from_le_bytes(bytes);
 
         if (data_ptr as usize) < self.base.data.len() {
-            dev_err!(pdev.as_ref(), "Falcon data pointer out of bounds\n");
+            dev_err!(dev, "Falcon data pointer out of bounds\n");
             return Err(EINVAL);
         }
 
@@ -928,7 +916,7 @@ struct PmuLookupTable {
 }
 
 impl PmuLookupTable {
-    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+    fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
         if data.len() < 4 {
             return Err(EINVAL);
         }
@@ -940,10 +928,7 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
         let required_bytes = header_len + (entry_count * entry_len);
 
         if data.len() < required_bytes {
-            dev_err!(
-                pdev.as_ref(),
-                "PmuLookupTable data length less than required\n"
-            );
+            dev_err!(dev, "PmuLookupTable data length less than required\n");
             return Err(EINVAL);
         }
 
@@ -956,11 +941,7 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
 
         // Debug logging of entries (dumps the table data to dmesg)
         for i in (header_len..required_bytes).step_by(entry_len) {
-            dev_dbg!(
-                pdev.as_ref(),
-                "PMU entry: {:02x?}\n",
-                &data[i..][..entry_len]
-            );
+            dev_dbg!(dev, "PMU entry: {:02x?}\n", &data[i..][..entry_len]);
         }
 
         Ok(PmuLookupTable {
@@ -997,11 +978,11 @@ fn find_entry_by_type(&self, entry_type: u8) -> Result<PmuLookupTableEntry> {
 impl FwSecBiosBuilder {
     fn setup_falcon_data(
         &mut self,
-        pdev: &pci::Device,
+        dev: &device::Device,
         pci_at_image: &PciAtBiosImage,
         first_fwsec: &FwSecBiosBuilder,
     ) -> Result {
-        let mut offset = pci_at_image.falcon_data_ptr(pdev)? as usize;
+        let mut offset = pci_at_image.falcon_data_ptr(dev)? as usize;
         let mut pmu_in_first_fwsec = false;
 
         // The falcon data pointer assumes that the PciAt and FWSEC images
@@ -1025,9 +1006,9 @@ fn setup_falcon_data(
 
         if pmu_in_first_fwsec {
             self.pmu_lookup_table =
-                Some(PmuLookupTable::new(pdev, &first_fwsec.base.data[offset..])?);
+                Some(PmuLookupTable::new(dev, &first_fwsec.base.data[offset..])?);
         } else {
-            self.pmu_lookup_table = Some(PmuLookupTable::new(pdev, &self.base.data[offset..])?);
+            self.pmu_lookup_table = Some(PmuLookupTable::new(dev, &self.base.data[offset..])?);
         }
 
         match self
@@ -1040,18 +1021,14 @@ fn setup_falcon_data(
                 let mut ucode_offset = entry.data as usize;
                 ucode_offset -= pci_at_image.base.data.len();
                 if ucode_offset < first_fwsec.base.data.len() {
-                    dev_err!(pdev.as_ref(), "Falcon Ucode offset not in second Fwsec.\n");
+                    dev_err!(dev, "Falcon Ucode offset not in second Fwsec.\n");
                     return Err(EINVAL);
                 }
                 ucode_offset -= first_fwsec.base.data.len();
                 self.falcon_ucode_offset = Some(ucode_offset);
             }
             Err(e) => {
-                dev_err!(
-                    pdev.as_ref(),
-                    "PmuLookupTableEntry not found, error: {:?}\n",
-                    e
-                );
+                dev_err!(dev, "PmuLookupTableEntry not found, error: {:?}\n", e);
                 return Err(EINVAL);
             }
         }
@@ -1059,7 +1036,7 @@ fn setup_falcon_data(
     }
 
     /// Build the final FwSecBiosImage from this builder
-    fn build(self, pdev: &pci::Device) -> Result<FwSecBiosImage> {
+    fn build(self, dev: &device::Device) -> Result<FwSecBiosImage> {
         let ret = FwSecBiosImage {
             base: self.base,
             falcon_ucode_offset: self.falcon_ucode_offset.ok_or(EINVAL)?,
@@ -1067,8 +1044,8 @@ fn build(self, pdev: &pci::Device) -> Result<FwSecBiosImage> {
 
         if cfg!(debug_assertions) {
             // Print the desc header for debugging
-            let desc = ret.header(pdev.as_ref())?;
-            dev_dbg!(pdev.as_ref(), "PmuLookupTableEntry desc: {:#?}\n", desc);
+            let desc = ret.header(dev)?;
+            dev_dbg!(dev, "PmuLookupTableEntry desc: {:#?}\n", desc);
         }
 
         Ok(ret)

-- 
2.50.1

