Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFP1Bl5tfGkqMgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:35:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0930B871B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:35:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B88810E964;
	Fri, 30 Jan 2026 08:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X7zJqADw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010000.outbound.protection.outlook.com
 [40.93.198.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A35710E952;
 Fri, 30 Jan 2026 08:35:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0rBbkQ2vO10ZuxdbxCrDDwX6tcKGdmn/IAmHvcDH26mK2A/CJdRjSsD2UNM2Goduz/NOptRvPrbIFyZreG5xj2uX5vZoryrfOJhQG1dNo+pWRwZhYc/tO313MA67uoK4cG3lyQWKbBhCNkrqStGXFP7VUjysE3zwtBbxcdSOuPn47yr04amOcU3qeDqONDUdrwv1sVpHGpnAttfUTuP/2kToofeWG3QIR4SLt+oc8Wpq7yw/bNA/weeGICu34eSoeHfLU1TQk3IzSdB4kpzkPCkWbH57AtXE7OGTgcoW3nhXkbrUR4E4PCf8PamkAIvS8uG/RcUSPsVeMnLRNBRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PVSLl84T6R4bkcOBRJEdC3f6ytQAkcWCVq/xY9WxCY=;
 b=bEgAE3ZdF7wX2nUUhYBZDABwyrH2XME8ZQVGWTajwkp4ExGb/++o6BIFMnDHC+FywFwpRtCH14ShNepCMHh8p1Gf4Ev76J7HyfrXaMKok8lnvAY58vh+kBksd0DlvyKwn4OOgQdbDF1xZvUXRThGX8DM53ZoeXq8gZt/2zvxaR5nS4uX5rV19tz8pCKGhDo3CQdktglMLOuZoD5Prkzh+I2KwO704kmOgdGs8CVF8iWikJUc7UrtWImJDtr0oiqstG6/j0qh8/L4Mk0NztopPY+oPBs63im/SnHrpsmAidwjnCD5/+oSpQphX0j6SSroAQNnzMUhmyNSMc15aFZZoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PVSLl84T6R4bkcOBRJEdC3f6ytQAkcWCVq/xY9WxCY=;
 b=X7zJqADw9TZ1vnO9pec+CqaJZfzB/nWifZ5EuMtLKzdKt9yPlgXQtGM5g+crAF5wWTj/1m4aL9tNMdraFLN39wg3YLPFlKwW78El6VawNvtW57Q0X+wdL8jOKhbIHXVJk4xpZ+V6Su+h7JX6B3CsWJDQZn78ONJpCOacPTkui8NhRaWHPreBqqULs6Ia/bxjmraqKFWTc3Ivr3VE/vtqvZoZn/5Lbqe2b3srCR9g9B0ZI4RxnyXYXA7dYcZxTV6ifO3Vy4LKGUV619kh/Sk7f2vM7GKb0Usl7W42EGUqBQRNtfN9PuESA25T4xpkAnpkJBa8njqz0/hLrFug49jPWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS0PR12MB9400.namprd12.prod.outlook.com (2603:10b6:8:1b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 08:35:31 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 08:35:31 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 30 Jan 2026 17:34:05 +0900
Subject: [PATCH 2/9] rust: dma: parameterize CoherentAllocation with
 AllocationSize
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-coherent-array-v1-2-bcd672dacc70@nvidia.com>
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
In-Reply-To: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: BL1PR13CA0410.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::25) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS0PR12MB9400:EE_
X-MS-Office365-Filtering-Correlation-Id: fb1bc477-8c91-4b88-7470-08de5fda877e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q28rMHU4NHRqdDA0SVlxN0xlU01KUVVvTVVMaFJXS2N3THRqSVFQNWhjcVk5?=
 =?utf-8?B?dnpPUVNnRzJ6TmVlMUI2SU8xeVhHNHZDbkpEL05yWjNFdWtXZVhRMGZOMUtS?=
 =?utf-8?B?ek5xR1AvSG5rTVI5VWVrOWZTNHBqQ2g4WFVDdit2Y0xVQXBBMXh3UGZnL0tZ?=
 =?utf-8?B?bGdwVHpmTUwrdG9OcmFtc25ZMXFlL1FLamRtbklqaW02TDZUV1VZUWdPbnkr?=
 =?utf-8?B?SUhJd2hwWElUcTBQeDdPaEpDZE8xaTlWV1lnTkd4SURMY0p6VVp2UU83UWkv?=
 =?utf-8?B?TldsREdITzN3TDF5ZExJK2g3KzIwTmJGd1IrTy8vT0p2VUlvenQ4ZU9mdEJt?=
 =?utf-8?B?eG14TGVPcHJZQjdrbU9DaE54K2FYMjV2bjV0WHJIQ1FBbVRCa2NqUlQ1aHhQ?=
 =?utf-8?B?cmZzLzl2RUFYR2IvL0krZ2VWWlQ1OWlyaHkxM3l0VDRTb1hiUnJuSmdmSVNO?=
 =?utf-8?B?UDVZVVVHRHMxdGZaTHYxMi9oMTJWM2w1T0RobnZYTjFkOG41eTY2Ym5Eck10?=
 =?utf-8?B?NDBGLzEzZUliMDhsYmprTUdJeE5wWEVSWjBTb050d1ZEU1BEVnVyenhHWG9S?=
 =?utf-8?B?S2pSdy9PTE5YRWtiN1JVUnozdEpXdEFjWXRtb05TNnJkb3pMWGJTY0UrM2NO?=
 =?utf-8?B?bno4N1BLZy9IRVFwd2l5QWhZWVZBa1Nqd0xkWHJhTXJydjZLOWlTQW1tMGNw?=
 =?utf-8?B?MEtJdEd1aExOaHg1VUdTaGFRTVA5ZVkzRHRVa1FKWFBsdG1QckZCN1kxZnZz?=
 =?utf-8?B?TlFIeVpKd2VUdDFVT0VWRWlLMnJhdjVtdXhEUW1EN1YzYkNRRG95WkNUVWc4?=
 =?utf-8?B?ZVpDMWdOSXNidjZQaGphR3Q1ZXNNeGh6K3RjWVIydCtYNE9KUEhmY3ZacS9N?=
 =?utf-8?B?dHZlOE56Z0gzVWJzT1BuSHlleE82ZEhpd2pFajJYd0s3RjRQN0p4WnZlNU5L?=
 =?utf-8?B?UWZLZUMxRkJOTkVGenJ6NnlzeXlONGpnWmZ2bjZmZk1Zc3FWeEh2UEpkWGtX?=
 =?utf-8?B?REtJY051bTFqdnV4eUFjUVJCNzVKb1NxVGpKSG1DbjFqRjFudUNWQnQ1Vm93?=
 =?utf-8?B?OGpxUkFDT3N3YVNkUFU2WGN5YTdndi9kQUJaN2JQS3JaN0FtUjZ6U2F5RlJN?=
 =?utf-8?B?YWgvODgxK25GckRKSGhwOXkvTTFlNkNkSE10M1B2c0pvNmJlQTZLMmZjYUFP?=
 =?utf-8?B?TGZvVFZ4VVJGbzcwREhPWTlxcU1ZaWQrVHp5UWFQaU9UT3Q4SjZzN0JMbFlB?=
 =?utf-8?B?N0ZRbUI1Vkk0ZGFvUWdWc2pYZ1YwRzNsbERYMnJQSkhpZDJJZDFZaTcrdnRy?=
 =?utf-8?B?b3hJMURJeFVMeUhyMThsZmRaM01nZ0RZUHA5MksxL01CbG5nUFFGcGpob0ow?=
 =?utf-8?B?ZCtWNThISzlhRGVNdlEzTDNBUzZZTXBkUWZLZkl0LzNpeXVkY0tmT2x2S3Aw?=
 =?utf-8?B?cTQ0WVZ2cFRCb29lUkJOVytuQkk4d01nR3RXaHlNZHNieU4yNGJOVHFINXVY?=
 =?utf-8?B?bmlQNkovU01LN0wxY25uZEs4bDE1Z2dsUnlSL21mVHY1ZFBPWFlBaitaczlV?=
 =?utf-8?B?bk9LeUtYT0NmUmY1aEI2TklBa3VLVzAvTUtLQitiVHl0N2R3SEEyMFllR3hu?=
 =?utf-8?B?STVYWUpxTGFRSTdvWi84dCtmQzdkNjJHU2ZmNEsxZlhyWWdTdktEN0NMTnF2?=
 =?utf-8?B?RUhzUDRQZzZtSStoU0R2L2dhSzUyQnRHd3pSM3p1eEMxdEFEemlRSFJnOERK?=
 =?utf-8?B?bTF3WloxdTY3Sm94UkwrMzYzcmR4TWZvUGVvbjg0RnpwaWkzWkR3MUxQd1hx?=
 =?utf-8?B?TExhSmtvMTRXNlFPb25NM1NhbWt6bVQxRTRHTkViUk9xclg2bnhreUVNTFBu?=
 =?utf-8?B?cEhyUmlHZUV2aVVwZjZaMFlJYktlYXowdGc5UGE5Zm1ET2tMV29YTVZxUERN?=
 =?utf-8?B?eTJlcHdlSFQyRTkwWFlQWWxsNHJzaVpqbWFPbzdHMGlRWHVETjJWUVNpUmZS?=
 =?utf-8?B?SCtSWTc1V1Y0RTZIYzgrQ2YweFF0aHlqTUZueUpiWGdMSlNQak5tc1R1UmZx?=
 =?utf-8?B?UHlKb3gzdXF6Nng4OUxUeC9HWlZ1Vm96M2grWE5pdUNFMTJweUJ6c2ZBM2Jr?=
 =?utf-8?B?bTgwdmxob1d2c0gxekg5UkZ2ZS9HajkxOFc1U25jcHFmVFZtNmMwbldRVTV1?=
 =?utf-8?B?MXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THZtZzl6Kzhua3AxbXpTS2lLRFVMZ3NxWlRQZUJYSVBoNTdOQ3lYaUw5eVlv?=
 =?utf-8?B?ZHZRSlRLZ3JmZFVSZFV2VnFYaGxleDY2Nnl6c3dzWVpkRzV1a2lodWx5bExI?=
 =?utf-8?B?cmVSOUY0UTY5L0I1S0xmOTFOTnZkUHhwbHpXc3dFNXhHOG4xVWJWSUVKTXNz?=
 =?utf-8?B?WkNCdklhYWFGcU9ZSzR4K0wwUXVxLzZaeGxtK0g1UW10eFRsVWRLTE8wWnhh?=
 =?utf-8?B?eGVRRGNwWDZDOWJPSVZhZGR2SVJpbFQ0VHlyQnpXdFEzbWVBTE1ERDFXb1Zm?=
 =?utf-8?B?V00wcklLU09sNE4vRmF4bUgvaFVXMG9tRHltRE9pLy9GVmwzTHdJQ0gzYjY2?=
 =?utf-8?B?STdnc3d4Z1E5MUQrcTBpRHg5bERCVk5BZU9JMzM2S3BsUVljd0M0K0g1ZGlN?=
 =?utf-8?B?VCtQVlFreHoweDZ4ZUNQMy8vb0ZoMFFXRmFaNjRyeFRFd0ZSYVVJSkJiSzBt?=
 =?utf-8?B?QTRaNVhoRlRHb2taZ1BxQVlHeFNWSlRNQXJIUjVnTno1Wk1HNTBkNXkySnBJ?=
 =?utf-8?B?cnZIZDc3ODhGRGJsdm9yQ0NUdndZMzBXTDZzbUoxd3ZQelVZZ0tpcFdMSi9o?=
 =?utf-8?B?aTBEeWhITUVMQWUraHVuclBpdkVRVU5zdkQ3Y1I5Yk43cnJFVGxDSFVwY0F6?=
 =?utf-8?B?Wm4vczNFY09KcDhKQjY5UERIQWpPbERNQk0wZHI2SURwWDh0RDZ1Y3ZmUmhz?=
 =?utf-8?B?Y2JyZ3RFaVpYNW9yU1UwN1c2dFk4QlF2M0xrdnVWVGZRV0k4ODAvN0FRSDRa?=
 =?utf-8?B?cEpxRTJXc1JuakhMSVJUWlRhUHZRMS9xUXgyVjZNR3BkVzZtZlc2cVdLa3Vq?=
 =?utf-8?B?bWdoNVNOd2pxdmFQdW5BQXE4dXFxeFdEKzJ3Sk1RTjZiTUN4b0RyTDRoN1Fj?=
 =?utf-8?B?MS9Pb0VzOW51b1JqSmMyVHE0Mnk4aTZMMDVVZnhiZ3pIdk1QTDNFWGs0MERK?=
 =?utf-8?B?R2xmRnZjYkxZdzZzQzBBUHA0SkVJSGtvaUhmWjZ3SzBpSlBjaDFtakpuMG9F?=
 =?utf-8?B?SDMzck43Q21EZjY1VEJDK0VpZGh1RlpaQUhoK2c2bHdLVFhHdWFCbFI0L1RY?=
 =?utf-8?B?cjlRM2xQZmQyalFaQVc1L0xKVFphbElGd2hYelRDMlplVEJSQ0tQZWpzWXBv?=
 =?utf-8?B?VnIwUW9JK3NjZXdYMWw0c1o5ekdVa2lyWk5rQ2c2dmJwK2NveHl2bUpkcFNC?=
 =?utf-8?B?QWwyNFJhMEF1M3dyN2dnZmx3TnJ4UHIzRDByYlFETWhORW1kKzEvMERGSExX?=
 =?utf-8?B?Rkt4d01ld1ZrRVlZQStsNWVPZ29iaHBLMmJrMGpsRGNsZlpycWFzejhlMW85?=
 =?utf-8?B?SDVVUTBCYWhwMHNDY2JXUnRCRi9UWE9ndFlwVFNzdkNaTFdBUFhmMGxRdC9i?=
 =?utf-8?B?VjgyUktUREtISWsveE5ORDQrWDBzWWRtYlRkUEFaRWxFNWxUdUloNllXR2RN?=
 =?utf-8?B?Q0xUc0Z5T2NDZ2NpVC9qV2dyMjJ2dGtabnRMYUVETVI5MnpPU1RFVGlsd0du?=
 =?utf-8?B?Z0UvNEkzdk1ZSk1YazhvcXdBbG9pNWlQZUZGS0ZyOG5oU1RtREd6d2RTSnBx?=
 =?utf-8?B?bDNwZ0lJK2svRnBnaE5ybFVlUEcyK3UxSFZjcVB0NnpKM2MxZjBLZEt1U1RQ?=
 =?utf-8?B?Nk5mVHRhWk9ST2gxM0IzK2ZWT3FzeDUySnJjMnFLaStpeEdLUk0rQzdxK1VR?=
 =?utf-8?B?ZXVnRGlLekpjaEwzYnhSNjU3ZHY1a1NQWE9VWG9KWlpZRWx5emp6enZsOGU1?=
 =?utf-8?B?N1JsbTBlaDhHODdTQjdhUjBXR0VDMjZRa2x1c2xSS0h0THUrdnNtUjhRQkdu?=
 =?utf-8?B?MCtEVVExdGFYaXowdFp3M2tMZG9JcnJlNzd0Z2pSb1JOQkMyRHNBR05WbE8w?=
 =?utf-8?B?RERtMStkblZINmNQTjRNaGsyZW9hTW4raHlYbTd2MVNBYWNhQmhMSWNsUHBK?=
 =?utf-8?B?ZXlNWStDTTZsKzNtcEZFNXQ2YU9aWlJYcldTa2VBaHNaU3FVcHJDUFdvUW9K?=
 =?utf-8?B?cmpKNnErOVpvenZLVDRIVDlsVURRTDZTb0tHd2VOTGxWY1RRYkhwenhkV1Ro?=
 =?utf-8?B?b2FML2tpK1dPTjhiS0RjT3BESzIvbldxVDRmRlAyb09TaS94L3lBQTh5Rmpv?=
 =?utf-8?B?dmh5aEtMN2RSV1BCenUra3hKYUZxZVJiaElhSWpDc0lyMTdCVkxyYjBJUkNp?=
 =?utf-8?B?dWJLMUNQVTZoQVRNZlVXSVF6NjhSQjY3UGY3WjM2ZllnYmlhN0dVcmZjbWww?=
 =?utf-8?B?dFIrVndpWG91ZGFxTDR6QnZhdWhMb2gxN0I2SStkWTFCQWtHNkZQcldXSWtt?=
 =?utf-8?B?R0JzTWhHcHNYZjBEekRKMWZWMWFMSXlYcGNjdENraXIrMTUzZ1QxaU5PclFL?=
 =?utf-8?Q?EJa9KT9GdhIbHeeEdZsn/iPjHpa2TX8LAaKi3iqj0DmWk?=
X-MS-Exchange-AntiSpam-MessageData-1: Xz40MZ/xyFuUMw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1bc477-8c91-4b88-7470-08de5fda877e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:35:31.6513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIRXtNaF0R7/GcnAQQaObxgGHugWhcidZyChaHbQ2LIwJqcDrhxJQr4EW+XaIaeFecjYEJcVHYWHo6vCCOIHwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9400
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch,collabora.com,arm.com,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C0930B871B
X-Rspamd-Action: no action

Parameterize CoherentAllocation with AllocationSize. This lets it
carry information about whether it knows its size at compile time.
This follows a similar design to Device and DeviceContext.

This is useful to be able to read/write without having to handle
a Result, and to move indexing errors from runtime to build time.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 rust/kernel/dma.rs | 185 +++++++++++++++++++++++++++++++++--------------------
 1 file changed, 117 insertions(+), 68 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 02321d5f3f06..6e6d91a9cd62 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -12,7 +12,7 @@
     sync::aref::ARef,
     transmute::{AsBytes, FromBytes},
 };
-use core::ptr::NonNull;
+use core::{marker::PhantomData, ptr::NonNull};
 
 /// DMA address type.
 ///
@@ -344,6 +344,29 @@ fn from(direction: DataDirection) -> Self {
     }
 }
 
+/// Marker trait for the size parameter of a [`CoherentAllocation`].
+///
+/// [`AllocationSize`] is a marker trait for the size parameter of a [`CoherentAllocation`].
+///
+/// The specific types of size are `RuntimeSize` and `StaticSize<N>`.
+pub trait AllocationSize: private::Sealed {}
+
+/// Marker type for a [`CoherentAllocation`] with a runtime-determined size.
+pub struct RuntimeSize;
+
+/// Marker type for a [`CoherentAllocation`] with a compile-time-known size of `N` elements.
+pub struct StaticSize<const N: usize>;
+
+mod private {
+    pub trait Sealed {}
+
+    impl Sealed for super::RuntimeSize {}
+    impl<const N: usize> Sealed for super::StaticSize<N> {}
+}
+
+impl AllocationSize for RuntimeSize {}
+impl<const N: usize> AllocationSize for StaticSize<N> {}
+
 /// An abstraction of the `dma_alloc_coherent` API.
 ///
 /// This is an abstraction around the `dma_alloc_coherent` API which is used to allocate and map
@@ -361,6 +384,12 @@ fn from(direction: DataDirection) -> Self {
 ///   region.
 /// - The size in bytes of the allocation is equal to `size_of::<T> * count`.
 /// - `size_of::<T> * count` fits into a `usize`.
+/// - If parameterized by `StaticSize<N>`, then `count == N`.
+///
+/// # Allocation size
+///
+/// [`CoherentAllocation`] is generic over an [`AllocationSize`], which lets it record a compile
+/// time known size (in number of elements of `T`).
 // TODO
 //
 // DMA allocations potentially carry device resources (e.g.IOMMU mappings), hence for soundness
@@ -373,79 +402,19 @@ fn from(direction: DataDirection) -> Self {
 //
 // Hence, find a way to revoke the device resources of a `CoherentAllocation`, but not the
 // entire `CoherentAllocation` including the allocated memory itself.
-pub struct CoherentAllocation<T: AsBytes + FromBytes> {
+pub struct CoherentAllocation<T: AsBytes + FromBytes, Size: AllocationSize = RuntimeSize> {
     dev: ARef<device::Device>,
     dma_handle: DmaAddress,
     count: usize,
     cpu_addr: NonNull<T>,
     dma_attrs: Attrs,
+    _size: PhantomData<Size>,
 }
 
-impl<T: AsBytes + FromBytes> CoherentAllocation<T> {
-    /// Allocates a region of `size_of::<T> * count` of coherent memory.
-    ///
-    /// # Examples
-    ///
-    /// ```
-    /// # use kernel::device::{Bound, Device};
-    /// use kernel::dma::{attrs::*, CoherentAllocation};
-    ///
-    /// # fn test(dev: &Device<Bound>) -> Result {
-    /// let c: CoherentAllocation<u64> =
-    ///     CoherentAllocation::alloc_attrs(dev, 4, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
-    /// # Ok::<(), Error>(()) }
-    /// ```
-    pub fn alloc_attrs(
-        dev: &device::Device<Bound>,
-        count: usize,
-        gfp_flags: kernel::alloc::Flags,
-        dma_attrs: Attrs,
-    ) -> Result<CoherentAllocation<T>> {
-        build_assert!(
-            core::mem::size_of::<T>() > 0,
-            "It doesn't make sense for the allocated type to be a ZST"
-        );
-
-        let size = count
-            .checked_mul(core::mem::size_of::<T>())
-            .ok_or(EOVERFLOW)?;
-        let mut dma_handle = 0;
-        // SAFETY: Device pointer is guaranteed as valid by the type invariant on `Device`.
-        let addr = unsafe {
-            bindings::dma_alloc_attrs(
-                dev.as_raw(),
-                size,
-                &mut dma_handle,
-                gfp_flags.as_raw(),
-                dma_attrs.as_raw(),
-            )
-        };
-        let addr = NonNull::new(addr).ok_or(ENOMEM)?;
-        // INVARIANT:
-        // - We just successfully allocated a coherent region which is accessible for
-        //   `count` elements, hence the cpu address is valid. We also hold a refcounted reference
-        //   to the device.
-        // - The allocated `size` is equal to `size_of::<T> * count`.
-        // - The allocated `size` fits into a `usize`.
-        Ok(Self {
-            dev: dev.into(),
-            dma_handle,
-            count,
-            cpu_addr: addr.cast(),
-            dma_attrs,
-        })
-    }
-
-    /// Performs the same functionality as [`CoherentAllocation::alloc_attrs`], except the
-    /// `dma_attrs` is 0 by default.
-    pub fn alloc_coherent(
-        dev: &device::Device<Bound>,
-        count: usize,
-        gfp_flags: kernel::alloc::Flags,
-    ) -> Result<CoherentAllocation<T>> {
-        CoherentAllocation::alloc_attrs(dev, count, gfp_flags, Attrs(0))
-    }
+/// A coherent DMA allocation with a runtime-determined size.
+pub type CoherentSlice<T> = CoherentAllocation<T, RuntimeSize>;
 
+impl<T: AsBytes + FromBytes, Size: AllocationSize> CoherentAllocation<T, Size> {
     /// Returns the number of elements `T` in this allocation.
     ///
     /// Note that this is not the size of the allocation in bytes, which is provided by
@@ -644,10 +613,87 @@ pub unsafe fn field_write<F: AsBytes>(&self, field: *mut F, val: F) {
         // the UB caused by racing between two kernel functions nor do they provide atomicity.
         unsafe { field.write_volatile(val) }
     }
+
+    // Allocates a region of `size_of::<T> * count` of coherent memory.
+    fn alloc_impl(
+        dev: &device::Device<Bound>,
+        count: usize,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<Self> {
+        build_assert!(
+            core::mem::size_of::<T>() > 0,
+            "It doesn't make sense for the allocated type to be a ZST"
+        );
+
+        let size = count
+            .checked_mul(core::mem::size_of::<T>())
+            .ok_or(EOVERFLOW)?;
+        let mut dma_handle = 0;
+        // SAFETY: Device pointer is guaranteed as valid by the type invariant on `Device`.
+        let addr = unsafe {
+            bindings::dma_alloc_attrs(
+                dev.as_raw(),
+                size,
+                &mut dma_handle,
+                gfp_flags.as_raw(),
+                dma_attrs.as_raw(),
+            )
+        };
+        let addr = NonNull::new(addr).ok_or(ENOMEM)?;
+        // INVARIANT:
+        // - We just successfully allocated a coherent region which is accessible for
+        //   `count` elements, hence the cpu address is valid. We also hold a refcounted reference
+        //   to the device.
+        // - The allocated `size` is equal to `size_of::<T> * count`.
+        // - The allocated `size` fits into a `usize`.
+        Ok(Self {
+            dev: dev.into(),
+            dma_handle,
+            count,
+            cpu_addr: addr.cast(),
+            dma_attrs,
+            _size: PhantomData,
+        })
+    }
+}
+
+impl<T: AsBytes + FromBytes> CoherentSlice<T> {
+    /// Allocates a region of `size_of::<T> * count` of coherent memory.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::device::{Bound, Device};
+    /// use kernel::dma::{attrs::*, CoherentSlice};
+    ///
+    /// # fn test(dev: &Device<Bound>) -> Result {
+    /// let c: CoherentSlice<u64> =
+    ///     CoherentSlice::alloc_attrs(dev, 4, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
+    /// # Ok::<(), Error>(()) }
+    /// ```
+    pub fn alloc_attrs(
+        dev: &device::Device<Bound>,
+        count: usize,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<Self> {
+        Self::alloc_impl(dev, count, gfp_flags, dma_attrs)
+    }
+
+    /// Performs the same functionality as [`CoherentSlice::alloc_attrs`], except the
+    /// `dma_attrs` is 0 by default.
+    pub fn alloc_coherent(
+        dev: &device::Device<Bound>,
+        count: usize,
+        gfp_flags: kernel::alloc::Flags,
+    ) -> Result<Self> {
+        Self::alloc_attrs(dev, count, gfp_flags, Attrs(0))
+    }
 }
 
 /// Note that the device configured to do DMA must be halted before this object is dropped.
-impl<T: AsBytes + FromBytes> Drop for CoherentAllocation<T> {
+impl<T: AsBytes + FromBytes, Size: AllocationSize> Drop for CoherentAllocation<T, Size> {
     fn drop(&mut self) {
         let size = self.count * core::mem::size_of::<T>();
         // SAFETY: Device pointer is guaranteed as valid by the type invariant on `Device`.
@@ -667,7 +713,10 @@ fn drop(&mut self) {
 
 // SAFETY: It is safe to send a `CoherentAllocation` to another thread if `T`
 // can be sent to another thread.
-unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
+unsafe impl<T: AsBytes + FromBytes + Send, Size: AllocationSize> Send
+    for CoherentAllocation<T, Size>
+{
+}
 
 /// Reads a field of an item from an allocated region of structs.
 ///

-- 
2.52.0

