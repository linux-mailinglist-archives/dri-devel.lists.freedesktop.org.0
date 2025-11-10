Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41599C46EA4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BED310E399;
	Mon, 10 Nov 2025 13:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BQb2r9Jv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012051.outbound.protection.outlook.com [52.101.43.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583D910E398;
 Mon, 10 Nov 2025 13:34:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDP/6OzoQuv151b5AAgdarAxAHPpaDXNNSDCtbPhFWhCaBIUAiXFVK1qRZvw8i/N5MOpvFTiB5+t4ySKkg0dxizgYRU8ShUWRuYA61eJnItyUfV73EfWho1emhYhiDy2utRam571K4Z35/6vPTQf9ygZzJosJxSajKVQUsQDlhXul1j0UBBZdF73x4AlP/HW4oh147FTfuDMv5xPDKkuRfNbQKQbL+ByTm5vbh8zEnN44y3iL01UeRet+gG2Ye6YHQOJKJCrOlrX0WhJIEyv65f6LwX8J8L01b9W2XKr753sCSlZsvvCi8KCFPCKbUF6b/z3sdpgqnayIn7NdVC1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YE+4g7TW5PhPQDFJtxzU2S/ge8hsEEFl0gppWg9apc8=;
 b=oTRG4arJqE+ggoPnhuhmayO9YlLjJ1x7Mebe0P8uWuN+X9Qn05iE2cf3a+ewa4Ldr1NuXJKgXG4B/XEFAQxW2s4lI3JqZQgQO4JOI2lNdv4eYiWWim37/V6dmxESftYCJ1nOF1gzEVfXleFkuwDe21AMH8KImRhma09VOVZjl4EyMRE92rhVHNYW7xznRCVd8yl2wwQNFAFajUypGd9bSLzcgHfYw8P24vDUS7IvcsplVRrgtlm9vaJATWv2nm576tNr7tpqCXqEmBupcxoT9CqXTk0LvarGZj1oXrIIMrxlk5HVrNd+EnF2m8XF1NMALEDfrQCXac+aCFZbvBFc+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YE+4g7TW5PhPQDFJtxzU2S/ge8hsEEFl0gppWg9apc8=;
 b=BQb2r9JvdiLypyqGtlyPMcDIQ/aPJRN3IcRQGLOwkct8zcCzB+/q5kfnnQQ6gRUBTwI4k7+q2sj/utzw+xCEER0wivcYRVYvj3AXO2K52y6bB0dNyrHtSJhowqz4Es7VvqPuXQ4xutlPKXdEoNuI6O4VDlWqeiYCToyxcZrouQAGAPTEqONdADeR89PrCTsNXvCsXw+cWbqx4ee0qQUa6QXzBa5jgyUP8SVdB8lzpaa64vYLtK8ErPLJeTBjZoNNDtnhNQXEGA5ec40RTVw6Q4AMvdQdC1FD4lNvwFyOmqJNp49oWOUCJ6zFd+5hp579Yqbncvg0zqLGR2t6qQRHeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:34:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:34:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 10 Nov 2025 22:34:11 +0900
Subject: [PATCH v9 03/15] gpu: nova-core: num: add functions to safely
 convert a const value to a smaller type
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-gsp_boot-v9-3-8ae4058e3c0e@nvidia.com>
References: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
In-Reply-To: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0143.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c804bdc-491a-4b8c-24d6-08de205de123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djlNbVp4Vm54YkZmMDhFNjBhNjJPZUdpcUhyRk80RjlpT3ptczNweDBYeEFx?=
 =?utf-8?B?TkJ2ZXNNMXE5dmNCYlJqR3JDeVBoZ0d2bldTWnAwanlRWTRKWWt3Ty9kd3B5?=
 =?utf-8?B?emljQWcrbjZxUEcwWUpjU0g0cERIRi9PaDRRL3h0dU5reUsweXFDUXM3R29H?=
 =?utf-8?B?cFg3YmdrbXlkeENnaFhHaTRDYm91NS9Ld2dndVR0KzBkc25Rdkdockh0N0ZD?=
 =?utf-8?B?VHdVb3B3aHdCamlXc3lHWnBQQmtackVJQ05JSmxsN3dGZFEzMEtLaHZoOXA0?=
 =?utf-8?B?M2x5dmNGRXdpeENxdW9CeUg0VGRneFJVNkdQUmlzZy9kaG0yVU0vcXI1VDRC?=
 =?utf-8?B?d1JzTDZYMGVBbHpaU0psaUwreEJlZG1aNkNGUm1aUS9TQS95MXZ0eEoydzhH?=
 =?utf-8?B?UVVaTEtGS250VEt0U29pTEJTdFdxdTBpWHZYNlpOL3k4NS9MTmJQNW9CZlNq?=
 =?utf-8?B?NE02bkRHNXBpaHF0bU1VeU83Mlc4R0o0V0JkTjR4VEdONmJYYXFPamlDMy80?=
 =?utf-8?B?N3hlN1VuR1pmb2lHMXpHQVNGTUxWUnV5akJIZ21YbGRvVk9TNnBGZ0d0SGZI?=
 =?utf-8?B?WTZqL0R1eHZZcHFQUVE0U1JOaUlGRFJ6Rm0wN3M2Zy9QaW81dXV5cTBVZUpV?=
 =?utf-8?B?UitGK2hlanNTN1RjK3ZEWkEzdjBacmNaaDFSY0x5dUJyYmJyUDl3Z2l1TDM5?=
 =?utf-8?B?dS9lZFo5T0FCMHBLb2VzODROYzBtaXgvTnZSbEJSNGNvRmQ1ZHQ0NXROZUxH?=
 =?utf-8?B?QVlJcXJXWlpHY0JKYXFDODlobHlRYUtqOFFKYU0vUzFXRTRhU1RRQzE2Y2Z5?=
 =?utf-8?B?ZVVxLzI3SXJxbThZNll2bE4vVTJodFJaLzNLcTBNOGFkaFBsTmt3U3UxMStW?=
 =?utf-8?B?dEVOVlh4L2xqaG1hd1Znb05vbXpGQ1NETHpGTjNpZ2VDWHhSL0Z2cjQrMmVO?=
 =?utf-8?B?eDJNMXdaSk1qNVcxdVlBV3dlVWF4cG5kUm9SVXhuOTQ1Y29vSDFtRUR6RjlR?=
 =?utf-8?B?Z05vdUp0SXFsSmxIT0g3YTdZcWkrdHFzQzFmbGcwY2ZIVGJTVGZUK1hxVnho?=
 =?utf-8?B?M3Zka09XWVBuRnAwa2hLeFJQbjBCZnlWOUFRVmt3NVZvQzNDNkdIaHdrVXNB?=
 =?utf-8?B?VkZXbDZ5Zy9BNks5cytjOXQxT0d5OEsxcnErUSs3OTkvZDMzdWdpUGxBelBT?=
 =?utf-8?B?YUUzbGkySktrd0U2YUp1eUErclRwUXNSdkJhdkxGNWVRQkFwbUpOeVdwOWNo?=
 =?utf-8?B?cjkwemF3Vk4zZEgzNkJIK21sdytLeVl5aUxac0pLRnlFeFBnTUgvYmhKeEFC?=
 =?utf-8?B?MkhtdC94RjFLaFRFNUd2MkFYU2pZN1FSUGFXdGpGZXhqT2ZzY3d5QnM3dHMw?=
 =?utf-8?B?eS96Tng4TmFxREFUQVRRUXkrdmFvdzBRRklvOVFDaFBpbHRoUWdkUGZVVTQv?=
 =?utf-8?B?ckpLMkptYldlL0FkNmZDd2k0SEF4U2l6VmVGSG5NSGc4dkNWb3dseXo4aHQ0?=
 =?utf-8?B?Z09pK0c2bGJ1R3ZSOFQ2NkU2L2tsOUtyVENzUzRoRDJJc1dRQXhUUkZ2aDBC?=
 =?utf-8?B?Z2JldlM1SlBFc2lEK1R3TEFhWFZjbllwaUozemV2dElxbkVGbzdidko2dFgz?=
 =?utf-8?B?bEVUU0lLYlVWbWJsQzkvczZoWTJlQjZZU2FKSkI5Qis1cmdmOWxSbnk5UXhs?=
 =?utf-8?B?Smd5WEJJS1dMcWNpTlV6WTFHSVNlRndrejJZVDJDMk9vaGFHckQ3VG8zbGRT?=
 =?utf-8?B?Kzk1ZW5sbDNnUlMzRlVEbm9DYjRDSXJ3TkVyZWxiWXU3aWtzcHdOOTg0Mjcr?=
 =?utf-8?B?N2xqaHh4OHM0c01qb3ZiUlQ2eGtYZ2J5Uk5yL2V5OHM3S2poWkJGRlkvbExO?=
 =?utf-8?B?WXRMWFh2Yk5kMWJ1MHlFdnVQRVdoM2hacVZVNkJKakQ2YUJzdWhpUkFiYW9Y?=
 =?utf-8?B?dk9MSG9tK1ZWd0lpMHRxSzFjOFQ0SUExZjVVWHpIbHVEMjVJNUowVkJOTitF?=
 =?utf-8?Q?FQYO0AKE2un9yhqP8Hj8F4rGX50aY4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akFQUS9zSnBvYWVwanB2aW8yMUdhbWNDd3gwZERXOVJZeVprWFhsaTZMMWhO?=
 =?utf-8?B?VWhLbU5ObWUyKytkdVlyYVYzZkNPV1JEUnFEWVVCOEtFQk9JSkFRNm9qM3dB?=
 =?utf-8?B?WFhibFViMXE2MTZib3FVam8xN0lKWW9UUm12S2lObGRxUllQRjNkOFlIMkt2?=
 =?utf-8?B?NFNlckVadGIzSlZET1lVUGhHTlFEc2tZRjhiSUtWL3B6cmhqUjF1QVVUR3Ry?=
 =?utf-8?B?ZmJHb1dzRWtxYThheFlYTHMyYlVuZ21Cc3BRRnFseUhrVGRJcnZpdGIzOWxQ?=
 =?utf-8?B?RGpUUU5neTNpSTNJWUFnWEdtalE0RWxCaEIxcEVsNXJIY2UwL0xDTS9HUXl4?=
 =?utf-8?B?VmJQV1Z6cEZhWTJpVittcFgxYkxUeXBOZVpXWGdWSmQ1Y0R2RVhGNGFpa29B?=
 =?utf-8?B?UjNoOWI4NGZlYUtzYmJLKzY1cU5QdURibVA2SysrNFVjMUxaLzRZOG9WR002?=
 =?utf-8?B?QzdhZ3pTTDJCUjVvM1NrVG03a1Bodnl6Zk5Fa3JGdmVZZjhhOHZUdmFBZVo2?=
 =?utf-8?B?Yk1JVFIwakcrM1BxdjN3cVAvZFZob3ZZblgrTmlrdjJDbmhTSkF2TXFqcVQz?=
 =?utf-8?B?aStOa2RubnpuOW1ZMEtCVFdDalF4UEFBNDhIK1NTV2dER0JYVnd1c0xKNkln?=
 =?utf-8?B?YUdhWUxJR1g3WFpIczAxcCt1MjBMMFlmN2RtU3VZL2xpUXBpd01MNCtYaU0y?=
 =?utf-8?B?YXJod2k3SkFqMGYrVkhWNCtXMUVMOUJLbUt4WVRTTE44MEZNelVJOEt5WWs0?=
 =?utf-8?B?aGlJcklJbTdCZ3dWWnJtRmE3VGtWMzZZQ3BHbDRUNVJoanRaRjBPQXJrSHlD?=
 =?utf-8?B?VlJ6bVV6N2txcXlaUCtLK2tockpNTk9KbGZzS0NwRmhxVHF4ck1VSEVWRGVJ?=
 =?utf-8?B?RW1BQTJzb0VBeFI1dVdZRDI0VkdndTluV01LbHltd0dhSWdMTHJmMDZZcFEz?=
 =?utf-8?B?dDRFcHB4RE5aa1haUTMwaXNHQU9vT09yT2Y2czdyeGFOSUc5cDlUZmI3T0tL?=
 =?utf-8?B?ZDlSUzNlWWNIOW5rS25POUdJZVFmczRSWklDN0hoREZrdFJUbDRmOWJBK0sw?=
 =?utf-8?B?eDVGUFpweEhPaW5lcGw5SUJHcVFNN0xWUEIzWkxqdm14aW41WlFqZ2d1a2FV?=
 =?utf-8?B?MHl1cW9jVlBDOXB2R1F2UmRYWGkrbXRMZ0d0Z2sxYnB6YVpJc0NPYWFvd0NZ?=
 =?utf-8?B?QkZtZXVpRXN3S1VIT1gvWVBJNE0vdUVlR1Q5Njc3aE1NbjZQK25JSGNqS2pq?=
 =?utf-8?B?WVkrWEk3ZjEvSWhYZ3Y5WjduOVFkZk9YcTU4YTZpamM1SWFtenhZb0tNa2po?=
 =?utf-8?B?cGlKTklKTjVPd2g3MnA0TUdzYjliMHdUeitRaWZBKzB1SU1nQUlFSHp2Y2hu?=
 =?utf-8?B?TnF5MWFJREJ6N0l6NVh6ejFQSi84OVNMeXZFYWJlTlR0NGlKZVozd1p2bjBq?=
 =?utf-8?B?dHNKdmJYMUdNLytLL2FwMUNieENaVHV2RDlEaU01Q2x4QklXcDFpNTQvM1dG?=
 =?utf-8?B?OTZGRERVVkpVSUdSdW5WR2tKV0tCR1lQYXdZR3pzdnlVK2Y1OHlFdnloRlBM?=
 =?utf-8?B?cDBzYjBtSVJUZXZXcldWNEtXcjB3dWp1aE9kSVk0R3ljOGxxaXBMYVcxZWp4?=
 =?utf-8?B?WFhNbHFPOVlUTU4wRFEvY25xNWowcG9MYk56MXI0a3pQelBFU1h0S3JJZ3N2?=
 =?utf-8?B?YlJvM0NEcURUOS82NytJTDRLRWtEKy9MRURyTkN5bHdobVdXd0E0eTdsRzZq?=
 =?utf-8?B?ZnM2L01FSWVOUWxLeDB5cmhxM3VRMGxXQmJWdTYvamtISkl1REk5S1UwQ3Ri?=
 =?utf-8?B?Ti9MbmdFSWU2MEV0MTlDNHNMUjJCeFJWZENTOHp1Q3RXbk9mTGk3eWNlaHV2?=
 =?utf-8?B?b1pNRk5oYUlXd0NuMndub2JQeDNKVEd2Z1A1SjRUR2dPQWZqdEdrYWtUSVZS?=
 =?utf-8?B?aTB6akF1R1lNSXpGQjZXbFlXaXhuQVlSV2hjaXhHU2ZVOUI5cDBteGZ6aW13?=
 =?utf-8?B?TlZaRlNaWnpoYlQ5OXBTZTJzZEp2bVQ2UCs0ZDBLNlhvcDM1azJQMEIwNWFR?=
 =?utf-8?B?QmFKaWJPOHdZZmxoSGE2cXkvUWpFdllTVUYweUlZaDhOZnVFaG9Tb2JZcklz?=
 =?utf-8?B?K2x3QlkwUnJTWXN3cDEyMis2blMyendObTl6dmxWdkNrd3l1OWhxT3pwQ0xX?=
 =?utf-8?Q?57ftBfrrNPtGO5IJqQfK2gOmROjUVuurS0HOIe1JOFuo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c804bdc-491a-4b8c-24d6-08de205de123
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:34:31.6799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+YuYjggJ13O3ugYHAK1uRdwYkhlGb9K12QUkRVNvpTzcsSVMEEggFpMXeS3lu386MMvdeMLD6ZN2hJELwB5sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784
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

There are times where we need to store a constant value defined as a
larger type (e.g. through a binding) into a smaller type, knowing
that the value will fit. Rust, unfortunately, only provides us with the
`as` operator for that purpose, the use of which is discouraged as it
silently strips data.

Extend the `num` module with functions allowing to perform the
conversion infallibly, at compile time.

Example:

    const FOO_VALUE: u32 = 1;

    // `FOO_VALUE` fits into a `u8`, so the conversion is valid.
    let foo = num::u32_to_u8::<{ FOO_VALUE }>();

We are going to use this feature extensively in Nova.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/num.rs | 51 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
index 92a91b9e30de..f3740ab6cb9d 100644
--- a/drivers/gpu/nova-core/num.rs
+++ b/drivers/gpu/nova-core/num.rs
@@ -163,3 +163,54 @@ fn into_safe_cast(self) -> T {
         T::from_safe_cast(self)
     }
 }
+
+macro_rules! impl_const_into {
+    ($from:ty => { $($into:ty),* }) => {
+        $(
+        paste! {
+            #[doc = ::core::concat!(
+                "Performs a build-time safe conversion of a [`",
+                ::core::stringify!($from),
+                "`] constant value into a [`",
+                ::core::stringify!($into),
+                "`].")]
+            ///
+            /// This checks at compile-time that the conversion is lossless, and triggers a build
+            /// error if it isn't.
+            ///
+            /// # Examples
+            ///
+            /// ```
+            /// use kernel::num;
+            ///
+            /// // Succeeds because the value of the source fits into the destination's type.
+            #[doc = ::core::concat!(
+                "assert_eq!(num::",
+                ::core::stringify!($from),
+                "_into_",
+                ::core::stringify!($into),
+                "(1",
+                ::core::stringify!($from),
+                "), 1",
+                ::core::stringify!($into),
+                ");")]
+            /// ```
+            #[allow(unused)]
+            pub(crate) const fn [<$from _into_ $into>]<const N: $from>() -> $into {
+                // Make sure that the target type is smaller than the source one.
+                static_assert!($from::BITS >= $into::BITS);
+                // CAST: we statically enforced above that `$from` is larger than `$into`, so the
+                // `as` conversion will be lossless.
+                build_assert!(N >= $into::MIN as $from && N <= $into::MAX as $from);
+
+                N as $into
+            }
+        }
+        )*
+    };
+}
+
+impl_const_into!(usize => { u8, u16, u32 });
+impl_const_into!(u64 => { u8, u16, u32 });
+impl_const_into!(u32 => { u8, u16 });
+impl_const_into!(u16 => { u8 });

-- 
2.51.2

