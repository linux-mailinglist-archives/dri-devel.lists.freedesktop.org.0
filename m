Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AFEAF8947
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2004C10E951;
	Fri,  4 Jul 2025 07:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HgAxT7cC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5E110E94F;
 Fri,  4 Jul 2025 07:25:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mN0w7i6XFLxlgS0h8Vt8Z2JBiUeovPvoRf6t2r0colhFieAAnYWN8Ha+iY/w9a7zDFHOTVIxRkm0UPsZq5vR8ST9rwvONE/Xk3P9PwY/V+0/TFs6mu8J4hQY9yYozc/VQn3h3VfOrO7z4JRzXshnNLKqGJbDme5kuz5LQfv8bI3FKcGoxgyoe0DBNWqrLm7ssCM+naj4oro2Pys7m0r5395un5Kg2VUZQZWNfhM5pyg8dDSkV6lc68qdD48ZwomBQwlqTjxsaL2vYXoosuxr9JSoHIPs/L3BB6mm3BwKZBPtwOaR0ti4tMTmOGmYEZDaiVIgvDFeRbZ6Y6+sy9lxGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4E3MvIR3vm9fOyzfUGkrGnxxMhQffrjxwWmhJ2entOU=;
 b=GLKtFOp96oM+Tlrrs33ZyAgSoIkAFNJX1gN6wzGPGslMA0KLO4T97LPYAvvbeLfDlHoVC7AlKXt7VSuTsYJIsanordm1+3YtQyKJ3A43V31ynbvEktHRE1jgCX6N46I5adMWSTQ4nELFCQd9DnUuBCjkPJDSveXyWHSoEBbMw2uoIANtq5P42lfWReJqBVqQwvglsCp9APnW+J1Fy+RPTUxRxELoNyMRlDblwxDTcU7ydYCl6aiVwosvDoKmdGsgRtfK3KYCpub5HIrQHBFGrZTZwwaTi1Vop/cKcJmcCZYowu2aqai4xJugsUQ93jJwybpD88C/5L5OGL3iFfoV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4E3MvIR3vm9fOyzfUGkrGnxxMhQffrjxwWmhJ2entOU=;
 b=HgAxT7cCYgSFVUWCM2WIq/drZRVyjJbYshlQwAkRSyhHA8nfvZeOsKgyr4PoZLai4/daDkxR8KSZK6bf1qZG3FP14w3B7jLdlsP8m8XDOrynn6P0gKsoeQkUjqBeR42sRXyfhQ6IcC6zcc2HfZdmhw7ynfDfGljGLzQEGFTZsV+Odu9v24+wQywABWoIcXjug5weJoRYSoN1SHKbFmDoDwcl1rmN6xrHXhPQpw6rHjNHbGaoVWJG6oLTVNmbjKIscIqdeuJ95pLXOWxU4JFx1JCJZj/NinvH6hXagWUBvGpoIgqxwZ/7jea68uWkqmshcCHo/U+s9Lhi1w2lL/SvYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:25:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 07:25:40 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 04 Jul 2025 16:25:06 +0900
Subject: [PATCH 05/18] gpu: nova-core: register: remove `try_` accessors
 for relative registers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-nova-regs-v1-5-f88d028781a4@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0081.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 520f52e8-7490-4124-4ee0-08ddbacbfa6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RklaOXR1S3VkRHg2c2kxVHZRVlIwMlVFMll4Wnovb1ZpZi94UndMR29tV2h1?=
 =?utf-8?B?eVpRUkRvYnU1ejNmdnhyL3R1TjR2bzQ2cHlwR2tKdjRVNitURk9PYi9XZC84?=
 =?utf-8?B?UExBZ201MVRvYmV2dG5ZdEZBcFVLaEQ2MXVabGFpWnp1RnVDazhrb3ZvaU1E?=
 =?utf-8?B?L2xvVHJLRW15OGhYMnNoUkNSNVRnaWNMajdoL2hvbkZ3UU1zNDZFQUovTTBx?=
 =?utf-8?B?dHdvZWNBZUFyQkxzNmMvcVBibkJ4WGJ2MWx6QXRnMXFnVGNaeGF5R1ZiQUVI?=
 =?utf-8?B?U0Y1R29UbktOdXJNQ21oeGo2WUlPcjlHR0xzU3AxOFlHWHhBcENYQ015eCtj?=
 =?utf-8?B?WUswY3dweVJQcUFITTdQcFBHdkhEaUhTeUcvWm9ZM2FBNlMvVGZvOGtHeUtt?=
 =?utf-8?B?akd2WGdGVmR1UWRzUlZHZXdNNFBpRlpiM21RUTdYdXJsQzZ6RVR2TjlDMEVz?=
 =?utf-8?B?UDcrRitScXc4Ym9zeDV4Wlk0MFJ5QVFZczM2UFRDSzlzQjVJQy9IbTF6aWZl?=
 =?utf-8?B?aC9jb0N4NlZXeUYxRHoyd3VENndaY2hsMytQbWFIWE9xS0VNTWFnc0hZRE42?=
 =?utf-8?B?cElUaU5wL3pXa0tqRkNCQXI5K29XQW4vckpiS0lJWlBsS1BiamlJWGdGd0sz?=
 =?utf-8?B?YU5CN01Mc090U1VOTkdrYW1YYlVHMmFsWG5adXA5d3B6TzFMMmJIcW9lNEEv?=
 =?utf-8?B?cFJ3MU5OU1M3Q2dLUlNDWklyVUhqTFh0T1Y1RzVvSURYSGtPUFFjRmd5dEF3?=
 =?utf-8?B?RHZiVFYxTXlRL3hPenZzSENmV3NkZnlZRzBXTVB5YVdZeGJmdjJCd0ZwTDBT?=
 =?utf-8?B?Q3o0eFBDTjVLc0U4QkJxRWtCNE92aE9ZSFQxTUk0U0dFeWNQV1JGQjQ1WkZ2?=
 =?utf-8?B?VWY5aCt3dzNuS3ZBdW9tNTMvT0FMSkVjdUFaNzI1R1ZQZWM0M295SFMyNTB4?=
 =?utf-8?B?cXlIdEtnTERBZ2Vzd3ZwUFZoZENkajBITDBJcWRuNWxDRXlsb3hmKys2UDBP?=
 =?utf-8?B?cnhaMlF5R0JJOVRGWCtvQzNuMmJaNGloMm5CaEtwaVcyOTVEZUh1U1REZ3po?=
 =?utf-8?B?SmYzT0I3OVJDRFpOeVZoZmZpcnNueHR2Wkg1MUM2M3lzYTRJQ2txN29MbUpD?=
 =?utf-8?B?RUdjRzlUVWJRRC9yaWxxdmtCdnM2NVJHaGIzMm53b21wTi9xYXVpNmVFaUxJ?=
 =?utf-8?B?WndqeDdqSmN4eVljS3IxbXMvZkpSYXhrRVBTL2d6b3J2ZFVKdnkvR0gyUHpC?=
 =?utf-8?B?dU8zRVIzT21WQnVEa2VBdUtkK1RsejVhYk5KaXhPSi9SOVFDTURxUkJkR2pF?=
 =?utf-8?B?S0RtS0poV0kxbzBiSHJsL2xaMnRtTW1aL3NBcVpQUTMrQm5YMXpIY1IyVWls?=
 =?utf-8?B?bExWOTJueEp3c29tOFM1QlBOVDhtbmhIbWtWT1FoeUppUkpPNllXaitVT0Ev?=
 =?utf-8?B?dW5CS0VuMjVWUnkxY0RkRkx4dFlsRW5pdVViSFVjdFFsa1VnQXNPd3VXUzZl?=
 =?utf-8?B?QlU1UHdLNE5FYVM1YmdWK1ppZmhDNUtWb0ZubW5KNjBEVmNoaDNIOTBWNEJE?=
 =?utf-8?B?aFJXdDVQYlcwam5NUndRQnRLTzNMQk5wVnE5MFR5S3MzK2Y5OVBUL2prVGxh?=
 =?utf-8?B?b3ZkQkhUOTF5bE05aC8wR1lFQlp5WWpZenFoSVQ1MkNzb2c0bEJFaHV5NzVa?=
 =?utf-8?B?NGM5eC9CSmVkOGFnOFNxeGVsK05hb1Z5Uk1LSlFMQytPUjE4ay9YVFM0elR0?=
 =?utf-8?B?Z2lPdEhOc1VpMHMrNENuRU1LOVg2bzFBcUQrYmtKM2ltUzdOUGo1SHpBeTZa?=
 =?utf-8?B?YUMrL0FOTll4aytLZWNFWFcrRVRxRHZldGxKSkpGcFZCOG1VUW1aVi8xcDJq?=
 =?utf-8?B?bFp5YktlejRmdE0wRDlvSHlEVU5FU25LdlNueWJ6RS9Rc0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFcxejUxZ25ZUEcxR0haaU9ZcGl2b1NsdHhLeVNFVVhZamZTVDVzQTQrcElE?=
 =?utf-8?B?SzZtcE92WlRjMUdNd0Z1d21aOElCeGw0UWtkL1kyRkJlSml6K044RnhCd3NR?=
 =?utf-8?B?RFFPOWUxalA3bit1RjAySG5FdjVXYS9zTFdqejR0Y01KbUhJZUFKaHVYaHdm?=
 =?utf-8?B?SDFsVlBNRnhJR08wMVVnZDZvL1ZjaFlRdkpwSEdlMkdoMEY1TlNXT3Z5VVBM?=
 =?utf-8?B?cWUwL2RuTWdPTWNwNTZvVDRzd1N6OXpTQ21JYW14bWUxNWZWcXdPRU9yTXFy?=
 =?utf-8?B?blhSektTTGhSNklYaXhGL1pDanFYeW1Jcm02MzJMdFR1cWNTMThPdWFXcXl3?=
 =?utf-8?B?NHNqM01xWTA5cHlNbnE1b090WndGNVNvQ0Jxbk5ablduOWFKTU9EVDBHTlcz?=
 =?utf-8?B?UGEwOS9kR3doVTF3UEpKWHVmYkF1WG1nazREdDI5SmNlWnJZNFZpTmZRN0NT?=
 =?utf-8?B?MUNWQlRkWFErSkZrbkdpcTVTcVBXbmpJd3NhYTRDR0N5TWVFamhMWjE5UHdn?=
 =?utf-8?B?TXFOTXZ4WTdYSngxWS81NE1tdWYyZHE2N3VxczVUS09NUjQvVTFJMmVsR3dK?=
 =?utf-8?B?cWlRcWtObVRBOVBycUppOUtxSEJhaUh2TlNKTlRCT29GSHZDclRuby8vYWJw?=
 =?utf-8?B?YkVDTGloWGdGdEQvME1tYmJBSDZmeTRUdlBKSGFIMmpBbHNPdzQ0VnhTbjNE?=
 =?utf-8?B?RysySFJydSs4NmUxeFRaaTN2T0x0UjkyVVhOWmc4T0s4UDcyNXhZUjdFWExi?=
 =?utf-8?B?VXRTMHRDVjg4KzdHY1VYdnNWdTl3RVV1R2w5NE1oTE5tR3RTN2VzVGtjdW5H?=
 =?utf-8?B?Q3RPcHlJdnhEaENiL3h3SW1lV0hrNGdmemFxa0lETkw1OUlBSjNseXVRSkdL?=
 =?utf-8?B?OTI0WGlZZFpkcVVpVlh3dlpxWWVLTVBLeFZnY2FhcU41WnpjdnVSUS9Vd215?=
 =?utf-8?B?bmowT2tqSG1DOGpPdUZqQjVjcXR0allhMWhJUTlkTFhBUmF2dytjVndMZWZ4?=
 =?utf-8?B?RU5LVS9WZjZJTWdmZ2kvVEFCWTZjV0x5WjM1TVJkUGNoVVVUK1ZjT1VCS3No?=
 =?utf-8?B?a05mVzlTNUNzbWZ3RENnWVFjTkhpQUQwakNKZEhpVkdrTmx1OFI5bkVYOENh?=
 =?utf-8?B?eDBUQlZNODZtSVhxVTlEdlZLQVA4ZlJpYkZxUkE4SGNzUmIya0gzaTllcHZt?=
 =?utf-8?B?Qm9sbkxUMmVoakszUHpWbnZuNWJvOU9SZVVOWU1ldW9nWWhFdm9rNEtMSVo2?=
 =?utf-8?B?bEdNTXpsd0JRaGhDZHVWci9wdmd1YTVTNnZqenNjNWtPd1dPcTF6MEpuRXN0?=
 =?utf-8?B?b1FiS3F6RE42MmlCU2ZCZElMejZTWS9EanRSRkxUYksrendGazdlTHR0TzQr?=
 =?utf-8?B?cXpKVnlpenlDR0xHclI2Mk1NTzN4VndjVjFlTndoZlVaMmhwTXRWbmExTTgr?=
 =?utf-8?B?aGJzOXBJeXlqSk41LzRmVk5KTk9pOFlkV09qaG9yZDMxN3B5eGdDMnoxOXVD?=
 =?utf-8?B?MGFEQnIrRzdGNXVrb25QUXpPTnJHMjRVWVRnQnhQZVNzTDE5RnQvQTJaRE1l?=
 =?utf-8?B?OXh0amp5bVBQQy81Y1NLTXF3d1ZPTnBaUnF4T2NhZVFpcFJFSnhMVGQ0NDV1?=
 =?utf-8?B?a2tFUVdmWmRFVVliSTk4WFVGUzV4dER2WHdxb1pwamFobklwWnIvZkROclhn?=
 =?utf-8?B?cDAzc3licncwWnNhNDUwdjdzVHc3ZVJ1a3BtVFlIQStHeE1SV0VmNXRBdUQz?=
 =?utf-8?B?ZHRucFBPS0dad1hFUE5wWDBNQTQzZE1qYUFpSE5hWHY0RnZ6ZWdWUHZxQUhN?=
 =?utf-8?B?MWZnU1kwemtCc2ZpUjZwYXBVWngydU9lWmJlc1ZhdXI5NkRkdUhPcnlzMVcy?=
 =?utf-8?B?YnZrVXh6eUd5Y2d0Zjg2QlFhQ0dpY2F1SFQ4NTMyTmhDSG5Wb1VjSmpTaXlU?=
 =?utf-8?B?TlFXL2drNWpmTjZ4SFBPcFV2USsxZ0FpeVVWSnQ3aisvQ1E1em14am50RlRL?=
 =?utf-8?B?UUdIbWNKVlVITFAyU0taQWRyWkxpc1N4V3Z0dmVNMFg5bVBpamc2NzNYNzlt?=
 =?utf-8?B?TVNYK0p1SVdEbkw0L1FFV00yL2xXVjFWYm12K2lkK2N4SXVUZEJwR2V3dXZx?=
 =?utf-8?B?bkpYVEJ5SlFtTlp3eTM2UWlobHQ4OGltOTRSUlNIQVNZTGpYeXJ2elJKQmdo?=
 =?utf-8?Q?V9GGOrsYnmNhebT8KgdjSVAQtxBaE8kllhkWv8VmA4Mz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 520f52e8-7490-4124-4ee0-08ddbacbfa6c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:25:40.0194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uLYUwSmbpWkMglmKLFdNMCIYOTj7CwFmLifN/+FunGA9go+nP3EYJyxM05+kNpWblQphXRNGJgkg8ECdvIwIFg==
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

Relative registers are always accessed using a literal base, meaning
their validity can always be checked at compile-time. Thus remove the
`try_` accessors that have no purpose.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 38 +-----------------------------------
 1 file changed, 1 insertion(+), 37 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 7d5cd45d3e787301acab0b4d8ce1002c2dd2cab2..087f92f78788a013702cbc0a6e156e40f7695347 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -57,9 +57,7 @@
 /// definition, or the field getter and setter methods they are attached to.
 ///
 /// Putting a `+` before the address of the register makes it relative to a base: the `read` and
-/// `write` methods take a `base` argument that is added to the specified address before access,
-/// and `try_read` and `try_write` methods are also created, allowing access with offsets unknown
-/// at compile-time:
+/// `write` methods take a `base` argument that is added to the specified address before access:
 ///
 /// ```no_run
 /// register!(CPU_CTL @ +0x0000010, "CPU core control" {
@@ -386,40 +384,6 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
                 let reg = f(Self::read(io, base));
                 reg.write(io, base);
             }
-
-            #[inline]
-            pub(crate) fn try_read<const SIZE: usize, T>(
-                io: &T,
-                base: usize,
-            ) -> ::kernel::error::Result<Self> where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-            {
-                io.try_read32(base + $offset).map(Self)
-            }
-
-            #[inline]
-            pub(crate) fn try_write<const SIZE: usize, T>(
-                self,
-                io: &T,
-                base: usize,
-            ) -> ::kernel::error::Result<()> where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-            {
-                io.try_write32(self.0, base + $offset)
-            }
-
-            #[inline]
-            pub(crate) fn try_alter<const SIZE: usize, T, F>(
-                io: &T,
-                base: usize,
-                f: F,
-            ) -> ::kernel::error::Result<()> where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                let reg = f(Self::try_read(io, base)?);
-                reg.try_write(io, base)
-            }
         }
     };
 }

-- 
2.50.0

