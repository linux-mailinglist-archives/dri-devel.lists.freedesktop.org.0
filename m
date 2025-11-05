Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB20BC3460B
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 09:03:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC4A10E6C2;
	Wed,  5 Nov 2025 08:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jwomuzd2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010066.outbound.protection.outlook.com
 [40.93.198.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C5B10E2B1;
 Wed,  5 Nov 2025 08:03:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLhv87yYmO8UWSBXi25GhPcxRBIQTDnbi45NoQvD0z1UPum02njoSo8ZW1PHIqDytPNmXJBXrpNiDqEN41O0IzrIKObz2mjxoW2pWtrFXeyzgEm4CYMgTZDU/cZkARUrDGSNPfw5PkIRZQ+l9nyMPUSov3piwfE6bw0WhlFElJ8rhkGoeQyVeeOoAQ6D2JJVpDw/d3XXwYpeCC9rmW9Z3BK3l6cwjspgMnPCCFySVxCVpAigz+r35ng+EmQ/8OmV0tZKuR1G+z4osCoM/qqY0yb9r1YV5G7dmCF7VeLxV6lkDZ1YtgV/2Wd3OZquv7CicCF3pY7nYtQfn2K80Ch3Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2h8kRRWOOXfox5J9WhcIpSUGYcRvOzxZvlQZxStJEg=;
 b=UsFzrWlPNztO/wRzwnYlqwjXe7ThUhVHksjpwl5ECOCHnDRf+1ra2NFdxIyHsMLmnAVnSV7DGWW8G8RaLTJBm3H6q0APJbQzw/6PPpC4eLVxcCuWnB2dcY1NgMhJlZ1nmYs24OQBDzdqZUqunyK1eJJMO3FXb1IPrzryLQ5xCsiPw/BqHEo75g0z2aaEwuxc/3oTTN/3XIZzBiNJKot1sHhwjyaGDrJ1iN7R8ZGA1kzMDYTlPXqdQcOiAhp8gANvaz02ZS5k3wej2UXnuQB5U1U51t3Gr9qmX9WuOELiZtFz42ycTDR6UpEfzNC8uGjbUPWbJkmwgXFmLRjFGtcVpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2h8kRRWOOXfox5J9WhcIpSUGYcRvOzxZvlQZxStJEg=;
 b=jwomuzd2t6p6iOwuvyM2VjD5FrYUdsunsucvVHNE5zRE+cjyKyM958VAlpXmBTGyuLVLH+sGL+Ba6NYuUFXggKwjQlmlCW0uBJg8+ncwY+Um3aGLUn328FtnNmIcgY/6sBSVadwSBFj4qsww+9AT2NEpa2pyl+TLcY8NACttB6O+d9L5xgVjNHFYmGUmMaoaHGHvWAbUZdedAJOGS6Y5sDBKcHsczxMwulSSQwOAux1YICKINd9nd9AYHX4jxL8DxyQtJJTbV4++nwnsNZRf/a/Po62mjkd01G2ud0xUECa+ObJNiZfutpLnZdgpwHRo8v8GL4Uv1Z67OY3rLTAk2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW5PR12MB5652.namprd12.prod.outlook.com (2603:10b6:303:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 08:03:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 08:03:23 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 0/3] firmware_loader: make RUST_FW_LOADER_ABSTRACTIONS
 select FW_LOADER
Date: Wed, 05 Nov 2025 17:03:14 +0900
Message-Id: <20251105-b4-select-rust-fw-v2-0-156d9014ed3b@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMIEC2kC/32NTQrCMBBGr1Jm7UgnpIquvEfpIj9TO6CtJDEqJ
 Xc39gAu34PvfStEDsIRzs0KgbNEWeYKateAm8x8ZRRfGVSrOqJWo9UY+cYuYXjGhOMLDVtifbC
 O+QR19wg8yntr9kPlSWJawme7yPSz/2qZkNCMbOjYeWuUusxZvJi9W+4wlFK+RtbUCLMAAAA=
X-Change-ID: 20251104-b4-select-rust-fw-aeb1e46bcee9
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0148.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW5PR12MB5652:EE_
X-MS-Office365-Filtering-Correlation-Id: 0969c97f-a0d4-4cd0-deae-08de1c41ca80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGRMbzYrU3VBc3dEUTBWUGQ3aEhOTUhMVFM4dmJSdTFJVlZQbXVGOFZIeU5G?=
 =?utf-8?B?M3pNcXJ1OEhiVk52OEFRZEs2em9GODIzbzNNMk5sUVY0aXhPbXJVMThZWTVw?=
 =?utf-8?B?dG9mQzR6dkZiK0tUeHRBckpva3dWRmFuZ2pQTmlzRFNkaHJEZkFUaVJrekRs?=
 =?utf-8?B?cWswWVVST0R2OC9QUEZxbEJTRDRPcCtiZUF2R0E3UThMWWtUN0R0dkJUM0hk?=
 =?utf-8?B?S0F2WG5nSU5UV0dIWE45ekQ3SktNWWgyZjc1dmxIZmw1d2EwSlRVS1VRRHZw?=
 =?utf-8?B?WmZpZGFJNG5CYUdHTFFkMVlhQXVVQk1XWUkwNW9aUEkzWHRPN0dGYU5pZElY?=
 =?utf-8?B?ZUZFZDVyVDdsTU1QMGVwblAzcklDNmhDNmxHMUJvL2dCQVAzNWpIZE1MQ2NC?=
 =?utf-8?B?TXptVnpLK1hTWG1FSkhtdU1td1l2L1lSbUp1aXRDa0l1NTIzckc0NnVmMTF1?=
 =?utf-8?B?Tm93QUIxN3NPYVZTN2NBbndEc2RkUS9VU0xpeWNCRUNOUjJsYTh4VEhQSHA5?=
 =?utf-8?B?NTBMaHp4cUJESnJBbHZwR2JyRGpRZGpoVzRlS0pzZmdhYmRGZU5jRkNVaWNw?=
 =?utf-8?B?Q3dsSzBmVEpHV1J4aVJ1VWkyY3o5aWJvdnlUeURNTHJYdVRRak5TUnZiOUo0?=
 =?utf-8?B?a0NublByenZOb1lZT2cyaWgzb2ZXeUVKN3d1R2FPV2tIazFpUVl6bGMzRWl2?=
 =?utf-8?B?Q3dVTndmOURUZkIxV1pISzhVSkpJQmQzaXJXYWcybkZYU3pvRWg5N3JxSHhB?=
 =?utf-8?B?dlZEbWNLTEtucjhpbG0yalgyWE5Od0FaemdkZlFBYTkxUTk2aS9ZMmdkbUMv?=
 =?utf-8?B?TkN5cVJHWEJhWjVTRWljU0ZxUS9VNTI0Z2V1YXZZUkNHKzR4bkhHeXBqc1hD?=
 =?utf-8?B?dW5ZSG9mZ0ZLWGE0UlcwQ2dXVjArNWVIazlOSjRrZjREaHh2YS9ueFo3SWx4?=
 =?utf-8?B?VGgyWE9OdGoxL1dPU0dCb2h0WTVSSFYyenVZMkF1RmFqT2cyUTdaMUYrNjln?=
 =?utf-8?B?VFVuQWIwUWI1a0svMDVsRmJBZFNTakVpVUkwU3pkZjkzaGZiZG8zSjBKSWQv?=
 =?utf-8?B?RFJQSFJPZ3BxMVV0UWFtRFRjaEdyUWdETE15bEVMRlRuOXg2RGxpQTdTaXhC?=
 =?utf-8?B?VUR2MVpja2xnWDJVVkp5cnhBc1JQRGlnZXgyY2tBQUNHTkloQlo1S0J4SlN0?=
 =?utf-8?B?VXNOU1R6dlJxakUxRiswcDkwSW82UnQvMWhqZ3NNcFk2Y2ovUENwTjR0dzBz?=
 =?utf-8?B?RUxjZnhURzkrSDZ1N1E0K2k3YTBnVURxeWxzbGFFaEZOOHluSDlWRzgvUG9t?=
 =?utf-8?B?VS94UWZDMlpFZXFzS1B2c3k4ZElrczJYVzl2RVNWT2E5b0gyNUExU0xCNXBB?=
 =?utf-8?B?N0pxMnQyT1EzWUIyWXkzWXA0Mmw3YXlkSEtHMnlZaSs3T0hrYi85T0NTcC9O?=
 =?utf-8?B?MjFFN2tQZzNyQ05RdWoycTg0S3AwYllRVmxHcWd1SThjRGEwNzB5blNlaGhw?=
 =?utf-8?B?azE0K0FvZDAzSnZXc1owMHpVckNVMVdyLzVQK0VBV2ZwS2ZjTFpmaHFjaUFv?=
 =?utf-8?B?ZXRCelV3Q0JlU3o1SmgwbEFWQ2JCT1hmKzRpcWFwcGtjUnlqbHFlMFNhbFUr?=
 =?utf-8?B?YjRYcW5KajFzeEpiWTU1L0o2QjBNOEtZbXdrcmNFQlRyRGk5L2ZteGJ6M1Fj?=
 =?utf-8?B?ZDBnK1V5c0xhVGZNWXN5b1FkUllyclpmZkwvQ2IwY2JsL0UzNWU2Y2dNcFJH?=
 =?utf-8?B?Wnd6b09CTUI1UkM3eTU1SVJiTzZ3a1AvZTh4ZzRBREkxWGNjVG9UVVVPOFB2?=
 =?utf-8?B?WWV5TllndnJlNHZRMXErcDlLMXBZdUE0N2dRSDNwbDFPbzhuNHB1QUpMUlBs?=
 =?utf-8?B?L25ITVhpTDNCNjZNSnRUNVY3SlNJcnJoY24xQi9FOW1kVm4zdEkvWUI0c25M?=
 =?utf-8?B?N1EySFI5Z0EzQWs3aWRnMFRJWGlMelJ2Ym9URzQ5b1Fkd2VxRkJoa3JLN056?=
 =?utf-8?Q?Ohj8NZ7BdYnFSAdfGI3KLjakqL0BJs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ti8xODN3WDVTUVRyUlduQTdzTE9ZdmNMWEVuUktEY3NZQmcxbmtvWGl3RDR0?=
 =?utf-8?B?UktnTmpBS0U3TndRNlF1aTU1djhTdENPTHF1Z0xFRXo5bWdHSXRvbHIyLyt6?=
 =?utf-8?B?NGtJeE45bnpxcUdubTVLQXJmaVlxbGxCMnN4TXkva1BLQmwyZWNzcERWQTUz?=
 =?utf-8?B?SzRnQk1JMkNLQkQ1ZXJZVFBNbHg5ak00N2owT0RlNDlOMDFuQUgzYUVuQlBM?=
 =?utf-8?B?RVg1MjlQd1J5cjJtS0tFbzFCYkN5d09La00rYVo1REtUT29ncXVHaDUvQTVJ?=
 =?utf-8?B?cDRFdy8wQkYra25lRXcxR2FKSkFQc01VVzVydDNzeW5vSy9SeEYyeXFSY3A0?=
 =?utf-8?B?NjJvYUlTZDhjV0ZVKzRlK1F3aFNKZVAycWVlb01JSGtBWmFvVkJaaE8weWV0?=
 =?utf-8?B?blJxdjVRUXlzK3IvZmg4SmJPWFRzbEZGV3VjNTUrdG9GMzVPVlZRL1FGY0Za?=
 =?utf-8?B?MjRteUtUMDVqYnJod29oblVXVE80bitBaE5oRkt4NHlTVnc3VG9XNzlwQW4r?=
 =?utf-8?B?OStqSW9yRGZORkRPYzE3WlloT3lRcXRFc0h6SkNnNTZScUlSR3dmQ0Q0MFo5?=
 =?utf-8?B?ZTBTbFJEZVpkcVdNKy9oWEVuUXZ5NnlnNWVtd1Rkc0UxNnZEQWJhWkNsM2Fh?=
 =?utf-8?B?WGRRVzVmT3NiTzZpLzNNQmNuenJiQzVzRXBZWm54VDJhRnBFZE04QzJ5bitN?=
 =?utf-8?B?Tmo4T2cyd3E2aWdvVDdzb0RHUkJzSUVrRForemp6eHhqcnlHYVNhdXB0SmZC?=
 =?utf-8?B?Q1ZKME8wV1VWMUxNSVRvK2g5bkV3UWpxbEFtZHZrMUtzakYwZ3Y2bi9IdmhQ?=
 =?utf-8?B?aUdCc3o5ejlWcUl6SmEwL00xVThvU0I5SWRQM2VIRmFGcUx5TkhXYitxcUdP?=
 =?utf-8?B?R1VpVnNEQ2tDUkJxOEtZVko4RFFkZFRnTHlEMk1wMzdJVDN5WkpWMS9RRGxR?=
 =?utf-8?B?SXNSUVdXUUVxVm5pVzdSYWhaNzZ5K0hpcmQxUnY5T09BWmdXMityWUNydnE5?=
 =?utf-8?B?c0MrcTcxVUViRjNrSkdGOFdMZGx2VExTcGR0K0NhWng3ZXBKWlJUTzlrSDZr?=
 =?utf-8?B?SXFEaWRwQy8wRTFoWXlKc0NVeWRONFB3cFZMR0xNeXVuWndxZms4UEpQdUZO?=
 =?utf-8?B?WXdhR1FzUkJUeDBXYkhocVl3bVVKeXRpNEoxUWhiamE1SUZzNzl6UE14b3hm?=
 =?utf-8?B?VzZnNklhVXUvd1o5a2pwRjJ3OXBlWTR2OG1jejQ2QU9TOU5wSmUvdm05cmdl?=
 =?utf-8?B?a29adGpsMSswYVNSU1pUWjdqMDQxeHRVTUZyZm52YWI3Z3huWFhybUtVcld2?=
 =?utf-8?B?enVlZzZhalBCWWRGeTNYM2FHS2pZWEZtY21SWVlrSjZORFhlNEZEbW4yKzRs?=
 =?utf-8?B?eEVibmZUdFBsL3dpVXp5T0x4dlFaaUxhUGhiMURZMDM0dnR1dTg3TzBwdFc5?=
 =?utf-8?B?bC8yS0dCZUg5Y2NLUGcwSTloMis1NFZ5VU5SR3poS0ZUdFFEYlpBbUdOb1pY?=
 =?utf-8?B?bkFvd0dDU0FLNStnZ0cvaDNwNVRpS2UySTRkdlZJTXYyQ0FkRnpxRTU3am5F?=
 =?utf-8?B?M3AvbEZBME1JaE5GdHNNWU5GTlQ4YTFibnZ6N0h6ckVodDRZOWxnVkV0WVNu?=
 =?utf-8?B?K2czbVNnTTFZdFY5WFdoWUxvYlZWL0lILzd2NlQyRHNHTEM2TmFpVlhmWXNs?=
 =?utf-8?B?N2Zmd0lUcE1vSURPWHU3K1NHNHZHWnJOQy82R3Z5S1pJMTdhMm5teDVrdzZY?=
 =?utf-8?B?R3grUVI2R2VMdnlub3pzUUdoZmwybDNIdWdsVFhWSVJ3dzhDTzFhUDdBK3Zz?=
 =?utf-8?B?b1kxdkZjeG9NU1JzNmRmbnJPblpDTC91dXRLVzRsNjN5aFp2eldsUHJvbU5N?=
 =?utf-8?B?QTY2UGx6SUZQYjNXa0o4VkFDR21tVnlqTnF5WkxSMklTS2x1RW9XQk0wUGdH?=
 =?utf-8?B?WC9lbTk4WlB0V3lNd1YvbWJ4Z3hVNEd5TUxIWndPRkxiVWRNZFNJSndxK3pX?=
 =?utf-8?B?cjRreW93cTNicWxud1BEaXFXajd5OGxTRHVnRWtBTkdlMFluYjl1L0dDMkky?=
 =?utf-8?B?QUtBTTd2eDlkYUc0akh5Yy9STnhObEQwZVp5dmd2Q2Zuem9CQ2JQWmpYZnFE?=
 =?utf-8?B?UCs3UXNtSFRFdkNPdGVoR2N1VFdBcTBMcktpRXBzSG9VaUVwREZCL3NRdHp4?=
 =?utf-8?Q?ugwL2xv4vLQyEaoCmlP3fbrfSxTrvuizkfh3oJJmYgEs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0969c97f-a0d4-4cd0-deae-08de1c41ca80
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 08:03:23.2390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4m7/ywtcFbz9wVrrfht7z9ldIQj024RJeSQiFeuz8nnLRFvmnzzbdo9UWqYydaKBq3S6G6Tak3YcX9m6QGwtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5652
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

I have noticed that build fails when doing the following:

- Start with the x86 defconfig,
- Using nconfig, enable `CONFIG_RUST` and `CONFIG_DRM_NOVA`,
- Start building.

The problem is that `CONFIG_RUST_FW_LOADER_ABSTRACTIONS` remains
unselected, despite it being a dependency of `CONFIG_NOVA_CORE`. This
seems to happen because `CONFIG_DRM_NOVA` selects `CONFIG_NOVA_CORE`.

Fix this by making `CONFIG_RUST_FW_LOADER_ABSTRACTIONS` select
`CONFIG_FW_LOADER`, and by transition make all users of
`CONFIG_RUST_FW_LOADER_ABSTRACTIONS` (so far, nova-core and net/phy)
select it as well.

`CONFIG_FW_LOADER` is more often selected than depended on, so this
seems to make sense generally speaking.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Split into 3 patches.
- Link to v1: https://lore.kernel.org/r/20251104-b4-select-rust-fw-v1-1-afea175dba22@nvidia.com

---
Alexandre Courbot (3):
      firmware_loader: make RUST_FW_LOADER_ABSTRACTIONS select FW_LOADER
      gpu: nova-core: select RUST_FW_LOADER_ABSTRACTIONS
      net: phy: select RUST_FW_LOADER_ABSTRACTIONS

 drivers/base/firmware_loader/Kconfig | 2 +-
 drivers/gpu/nova-core/Kconfig        | 2 +-
 drivers/net/phy/Kconfig              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 6553a8f168fb7941ae73d39eccac64f3a2b9b399
change-id: 20251104-b4-select-rust-fw-aeb1e46bcee9

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

