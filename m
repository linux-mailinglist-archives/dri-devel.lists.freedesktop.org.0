Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB7CAAE154
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC33410E7DB;
	Wed,  7 May 2025 13:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WvWCgWhv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DF710E7D9;
 Wed,  7 May 2025 13:53:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBT4RUt1hG1/8nVvYjmLe6RzI5a6RUhUWWGeTkq0OXZWZujlWI3xCkelhbo+tWEHvGfUd0SeGz67R6pFAHPEUwNzDh/D5VnEfsv3JIkvGH+wWIpryyQSHR89r6ySUVblt7MDrKxiqeul7RSP2rUdWyrJPE3ZV65T21lfutxQ4jsrQf8JDi1lt/Xgmrx3+Og3wzakktkP6h7w/MKPbiGEv7BmZt7gr3/PyN0L07EQL++7bKoniAXwRCzjVDE4a3gUDPRSFeDhpTk2htHXC2/4zq8jLGb2uaqdMd592Fh9mF89I+Wxev8XQ06otnMtKkeQ9HMO58BmXTu0h6JVxHHn3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFFJOphSDp6CZ40FABybbhRqlsMk8Is5FXvEIFAxR5s=;
 b=T3DWzbDg4lao3H4sf9SCJnvhuEVa1YinSuCg7EMcq4wYjko+ADAyoBLqNEfSBAENdmXT83T/0J4/XbRcaGkq43BIgnrxoBJWMBpetEQc5SebnIuk4crTp05PWo/ninwjlr5fMdVlKnAbsJYAj6yTPLpUZVTnMPvsNEjOAZrRJ1n90WpaCWPM4C2vteHEMZFsjMMnNSV7xyGL5ZQ+EYf6+8EDpCL3WUMcwKUtu3c54dN+aFV/ITMFeITmmE4ZSRsjCQgCeDykDofuU0o9xMaQs9cxLIWYl/9DlK7pNEeY+pdkN+LHHQr1GpCGOkPbKuYyhXLoJ1NMi7kuwtAP3bR8UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFFJOphSDp6CZ40FABybbhRqlsMk8Is5FXvEIFAxR5s=;
 b=WvWCgWhvm9snuAubj+WBpE/gvKULcO/kn0E7TqYL1HQ1utzLlT1bXF+9610f1omGSoBVIMXQKOwhpNK3OQ6qHuWZNkubHUL9WlSRj1TnGgd8515Btd579VdTDUlDeuolr9xJg9j26vMy66v0i1SXiloLx45v1wklJ6B0dANKdshKzPqOf7YVmjpK/9+Cfsmg0GfJsLwj3iXjPqgFTx4GgEyUc9V0AGq1r62GC1cfYT7jQB+yc6bZJQieFFqgOfbDcuogI15mSlLtwWx2iQF1nGYLfgpvjSRTMGAk6lAVOzMZYcCUrV7WSpx7o8KqNVfBs8+NiakPn7NTpTdGcJqTzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 13:52:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:52:55 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 07 May 2025 22:52:31 +0900
Subject: [PATCH v3 04/19] gpu: nova-core: take bound device in Gpu::new
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nova-frts-v3-4-fcb02749754d@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP301CA0007.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: c044d045-167a-4feb-265b-08dd8d6e77ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1FGOVM3dGYrSTd4L1IyOGtYVEkrajkxeTRnT2l0TGJtSE5jMmN5cmpiOVFu?=
 =?utf-8?B?SklPaVAvekJ1UjFYOXJWVUpNSnFRaFExVW5xcEJ1T1V2ZWVodjRtOUxKdElQ?=
 =?utf-8?B?dmUrSXA4MUpIWHZWSFJWRmczSHVHc3lSZGZJSUtGb3piclFUTXVYQThyQ0xs?=
 =?utf-8?B?TkNjQUhsdzBDUEFaVWhhd2lnY2JVRXU4czBxU0VsNzY0RWJydk9nNGJqWVkw?=
 =?utf-8?B?aWN4ZXpweEFvVkx1T2JMZ2FKNTZ3VjlKL0VENzZVV01udWdTZlNEaTAxTHQ4?=
 =?utf-8?B?OGY1ZzhKMHJxSEw4UWFNRWdqdVBGeUQ4MVJhQS9wa2w0TmxaV1prKzJBZ3pm?=
 =?utf-8?B?YkJXUTh2cVJjamhWeVpwNUNxVlBydEx6di9LV3lwZjhlV0pUK1NSTzZvZnhl?=
 =?utf-8?B?YUdnYmZHbUtoeTZJVVN6MUJTYjFlN0Z5Q1JJdkdsSmlYamVFY05vUDBWUFpw?=
 =?utf-8?B?SGZtN0J0ZDgzZitMRDlHcXdLVG9rZHM5cDdyeVlBR3ZQSDlPVW5PTjJZRnJU?=
 =?utf-8?B?a2pQbkZtRTlTeUJleVJ2MlJDbVdBU0VZYU9TZldMV252OXc2SU5xZ0RsYWJU?=
 =?utf-8?B?bnVHdjVDdUN1bnFvcElwR09hNzlTUGJoU2IzMDBxcnpkNFJtNUVnWjB2c0g1?=
 =?utf-8?B?MDFxYXQ4Ull5QXFyWWVNSFZ1dE9STi9CUWpTN01UVldZZGRUTXVGY1hMQ2ho?=
 =?utf-8?B?S2pBeWUyelNLSUtCYVVmRnJYSzZDYU1xMjZ4K2tBUFpRL2hYZkltQTllcDdq?=
 =?utf-8?B?UTBZWUlNcys2dDVWMUlrb1NkcXgrY3ZJMVl1bXhsMXdpTmZyT3Vadys4Rld3?=
 =?utf-8?B?d1pUa3cxYUg5OFZBbmZJWHFDK1FLSkV6dFQyeWY5eXE3NlBQa3UvMlRDQ01K?=
 =?utf-8?B?R3R3bFdUS2dzekxjM2Q3ZTd5OUtwNnVUbXNHM1JIUCt1TjRMS3R4NDk1WDc0?=
 =?utf-8?B?a2M0WXUveWhRWmVUbDJ5RHF1a3U0T2c0TTRXTlF3THpyWEtrOEhvMDRSdWtn?=
 =?utf-8?B?QnViVFFvMllZL0JZcFAwMEFOVmdqRUNnWGMyaWpWbGpKYVZ3REs3MEZ1eElF?=
 =?utf-8?B?NE1CazRya24yODdvUTR1bmhjUUJsSDhqaGtweHlIc1lxVFZ0b3Npak1veElp?=
 =?utf-8?B?S0MwaXNYWWtaL3dLMEpOOVdVTDVSSGtvQjJDNFp6ZGNpMkc2MHlTTE1jSzdM?=
 =?utf-8?B?UHRzVkEwYWc3NW1aVXpJYmlMSUZUUEpRdHh0V0FpNUpnUkpTNGQzdWdZcEt2?=
 =?utf-8?B?d3hKeWVQSDUzQmZaNXVlZ0Y0ZUhKUlBtYkwrckZjNnA3bUlwcUt1MitlSVdK?=
 =?utf-8?B?WkIyZzNUSzhOUHZYclhhbSt5eE9KNmVGRmNFcmM4ZW02eldJeW10Q3VZK1g3?=
 =?utf-8?B?MTNLQ3FFR0M2U0xwUTJMdkFJVHllNjN6Y0F2dHh2NlA0QWJjL0ZsSnVLQjBD?=
 =?utf-8?B?WlpMeURQbDRmaENJMkNKdTJCVDRqdi9oV2l4R2NqT0RYK0xkRG5OdFM5WENr?=
 =?utf-8?B?V1M3ZVU3RVdXNGc5RXZvK1BZRGxkOUZmeU5UM0hvSkR6RXUxNWtpdVZ3SjRZ?=
 =?utf-8?B?SHhRN3d5UTQ2N0pMZTJBUnVMa1IwNitXM1ZTMDRSU0o0ODdKNG1uVGx0ZVFV?=
 =?utf-8?B?SmRLQllWVWNFWUt5S0hUTE9yRTJWSVE1V25GME1GSWxSeWZrZEltSUo2eDlG?=
 =?utf-8?B?K0FLdkJnelhRcUl6dXU4K0IxaTJtbVFRbS95L2lrcVRjUTkrbnBLbjFpVWZk?=
 =?utf-8?B?Zkc4d2IrVGVlaDlpVlprZ0ozZVp1QmVXYWJNT2p4aUlUL3lYR3dOekg1cnN5?=
 =?utf-8?B?QS9ZL0dGVHdML1Q0bC9QNHcrZHJUNHVsUXNWQmtxUm5Ib1BXY2JjYzRvZXhW?=
 =?utf-8?B?OGN0SmhhanA3SXE0TkJIc2tIUGJwNzh4eFJMUm9sQmJMK2orUGFOVHZOWG9D?=
 =?utf-8?B?OUFMYzFnWmV1ckxOL1lqTWZjTjFZTCs4M0xnUXl1SmN5QTJiOVFWYVBhcUZT?=
 =?utf-8?B?Rk4xb29YRWNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFozRiswN3FhcnhYWGhlajhnK0llcWsxRjRRQUpCcDhHK1pzNGxCaWRTdDBF?=
 =?utf-8?B?NU8rZWd5MzNYWXM1eS9WT3ZrbjZqMzcyZzZtNVRicXZmSFBiQ2NPVW01ZWsz?=
 =?utf-8?B?Z0lqOFBLSURYUHVENEtETERpRElxL0tCM1RIQWlBaHRwSTlFcnhqazFJYlFa?=
 =?utf-8?B?Z1VLdEQrQ25HcW5ZUGpCOXFUZU05S0w2RWFJd2hHZk1YZkNGN3NyMG1DTzZH?=
 =?utf-8?B?UHNkQmRIZjlrVGNMNExGU1dXb3JWejFoQ1lieTBFQ0FMUXFaR3ZTRjFvdTl0?=
 =?utf-8?B?NFBsR25Hb05DWTJjYXdBcWY5Y1ltQVFQOWliUUlZdDc1M3U5YittY3lCam5o?=
 =?utf-8?B?VlYrd2xZQzZWS1NtV3hjWUxFNVprTXlQWEpZN2xndnJ6QitEVmtZUFVzaFVI?=
 =?utf-8?B?SDhNdzk4RUNrbWlDbUpJTklpWjNueUhYODhFRXRETnowMlpMS05HemFoYXJW?=
 =?utf-8?B?Nk1abjY2Z25iOEM5RUxUV1ZJL2d3UWl3a1FmOEZEMGhlWFdKc1VPWGcwNzha?=
 =?utf-8?B?WnRsQWx5NDNhZXNFaldUUE9CVjkxSkFUbmJFVG9lVkRHMFV4Z1JUQnBmSkVp?=
 =?utf-8?B?blRzQ09YcW4xdlliNFloM0MxazhlUW83bHdVMUFFNHBvenJTNGlSdFhsUk5v?=
 =?utf-8?B?UzFSSDZ4NjNUSUlOUFZwUUdtTkZxbDFXOXIyTU9xakIwdkNxWE9PZ093cUt6?=
 =?utf-8?B?V0tvSlAydzlUZkM0dWV2bC85eG9kMjJ4b2R0K3ZKS25NUUUzeEIyODdJKzlj?=
 =?utf-8?B?VXo2YWEzMWwwb1ZvR3dUZGlHdVd3ZElLcWlvVlBiS1RLd2l4citwWlZRaXd3?=
 =?utf-8?B?OWdtYzhIeFFlbitGaFZ1WmVYTGdFV2JERjRyMDNaYy9qcjVmZTFSTnIxZ2Mr?=
 =?utf-8?B?WWZIM2ZvckpDSzVGYS9ubksvY21EbnN3UHFldnVvRVpXY3dQNVZMQ2trQUhK?=
 =?utf-8?B?Z2dFYXVSNU5EOVBSNmM4cDRXR2VkZ2cyMmlEL0xxTGFoRWNZRHptdXhkbUVT?=
 =?utf-8?B?Z2Q0b3lZRkFsck5iemYwYmZTK2F3UFZIN1VjZklFTEZQZXFaSnNtZzJBVDdM?=
 =?utf-8?B?R0d6MFVzVlRtREFZTEtmNWI4ZTlNaDc5bGpFMEFNdWNEbWFMTGcwMVpSSWda?=
 =?utf-8?B?eVcvR2h4K0d3dVpIY1ZQY0dKQ2o2TlYzcXdjN3l3M1YzbjVSOEprSkwvUXQw?=
 =?utf-8?B?S0RETldDcFJsdWFsL3BVOUo4QlMwYjdNc2RleE1PRTNRVkdDcnYxZTBvR2t6?=
 =?utf-8?B?aE5QU1N0ZkZaM05hdnpCVHVMQ01JU2MxVFRxejdncHQ4UVZHcFhXSWp6bEFx?=
 =?utf-8?B?SkxobU1JNHdUYWdkakZoYWtFK3NINXRoLzBSRUFFNjdQVVkvRmxEaGVUT0RS?=
 =?utf-8?B?UDZaUGE2MXFESXdmV1hrVE5TQVgzOG5ZZk54R0YxZEV3VWtZRDhHUC9xTWFY?=
 =?utf-8?B?WWd3ZmMzQm5JU0dRRFp4ZjNhUDA1QmpZVzNMaXpjUVhvZytzV2tJSFl4NWdk?=
 =?utf-8?B?dm9vNnRBOXQrblU1b0lRK0RjR1hncjYwVFljVGt4R0dGWCtIRGE5dlkzTElF?=
 =?utf-8?B?alNMNGEyY2xBWGZNSXB4Ykg3d0hhVXNKREpmaGpZdFZBeW04ODYyZytaNVZC?=
 =?utf-8?B?YmRPeC9TaFd0cllTUXl1VnhtR1Z2SnNTN1pCaGpTMmxtRmg5cnhXQlRLeCtH?=
 =?utf-8?B?QjFMNk1XUXJ3cjVZeVpFbTNKbFdqa2lOWDlaZnJSL3E1Z1pOS2k0R2N4d1V2?=
 =?utf-8?B?OFNoc0pNQndTcE1YR1hiN3ZnN0RGL2hGYXJyWEtnYi9wV280MDJVMGdRREc5?=
 =?utf-8?B?VzlpdkRMc1NwYVhZSjBPTnZoZ1QyWmZVYWh1b20wTzl1NDdRWVFxeVczMEVm?=
 =?utf-8?B?ZFRReFkvQVNPRWlqWGU4L0RRQkFCNURPci83Z1RTdktJeW50L0dWMnRHZ0VO?=
 =?utf-8?B?ZGpSNlFoZGFDRTcva1BkYnM1OHFDL1VWYlFvdnA0NWI0eldibEZBbUNPemtm?=
 =?utf-8?B?T3JZTUJ6emhyUTBZb1dnYzhleldRNmxXT1lTQlBQSFBXL05YTUNnTUJDK1Nm?=
 =?utf-8?B?R1o4dFVGVkpIWUI5a1BHWkN0ZDVSVWxRUzBodTJOSXRiclNKQnVlZUlFRGRP?=
 =?utf-8?B?dGhNbVJMWnBKVWo0bVdTRlVGZkpQVWVEVktkRlBUS25EQkZaUnk4dzlsL2sw?=
 =?utf-8?Q?ij8Ya+uiraFZKswfvTAdxcUABwIdDy1XBEouzs6rvhew?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c044d045-167a-4feb-265b-08dd8d6e77ff
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:52:55.8352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IeYfmfwjk+o6swDcf69ZrtA/ftZABzbrisKDIZCGNuZpQchfqWtSbgxed94sSxdl7y0los+Y9fkSC7DG3AMIKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761
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

We will need to perform things like allocating DMA memory during device
creation, so make sure to take the device context that will allow us to
perform these actions. This also allows us to use Devres::access to
obtain the BAR without holding a RCU lock.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9fe6aedaa9563799c2624d461d4e37ee9b094909..a64a306e0ec87f96e7aab47cfe00a5c280c95a64 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -134,9 +134,8 @@ pub(crate) struct Spec {
 }
 
 impl Spec {
-    fn new(bar: &Devres<Bar0>) -> Result<Spec> {
-        let bar = bar.try_access().ok_or(ENXIO)?;
-        let boot0 = regs::Boot0::read(&bar);
+    fn new(bar: &Bar0) -> Result<Spec> {
+        let boot0 = regs::Boot0::read(bar);
 
         Ok(Self {
             chipset: boot0.chipset().try_into()?,
@@ -183,8 +182,12 @@ pub(crate) struct Gpu {
 }
 
 impl Gpu {
-    pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<Self>> {
-        let spec = Spec::new(&bar)?;
+    pub(crate) fn new(
+        pdev: &pci::Device<device::Bound>,
+        devres_bar: Devres<Bar0>,
+    ) -> Result<impl PinInit<Self>> {
+        let bar = devres_bar.access(pdev.as_ref())?;
+        let spec = Spec::new(bar)?;
         let fw = Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
 
         dev_info!(
@@ -195,6 +198,10 @@ pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<
             spec.revision
         );
 
-        Ok(pin_init!(Self { spec, bar, fw }))
+        Ok(pin_init!(Self {
+            spec,
+            bar: devres_bar,
+            fw
+        }))
     }
 }

-- 
2.49.0

