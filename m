Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TIyGCqwtgmnzQAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:17:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF9FDCA52
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1805310E724;
	Tue,  3 Feb 2026 17:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="GiUgvs7w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO3P265CU004.outbound.protection.outlook.com
 (mail-uksouthazon11020106.outbound.protection.outlook.com [52.101.196.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBAE10E71B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 17:17:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dd/NKeDJe0LklV/ZndEQn7sa86yavFxzSRJRecLcmqYhYcrvPIRqwUrtL4i/rOhafprOex6xAMjer3XJQodYbOC+aQqukKGcO7xzlYyYsGhJQDeu0v03IPlbJVcgUIeY3jPzs/KJwa/3mWnXdUjxbwPSN5KdnTXnZwodcVPekj80HRK8B5pozeVplWs0k6W59IloT4iD/RsEvF8hXd1nirNDupWIsVfL4qGCX7lk68nYE4Rw6NqW+KGdBj946vVymIuZ63YHRdK12g9iFrTSghONu2/8W0RLgkUHY8/GRIYPQaryUC0RbsiJXaDi4RFw3jX9Rbb/GT5bhNZ2u5fnug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neIQZ09vhPDwcsHJQ19y0AcGlkDUvyYKkBgZiPVLb3g=;
 b=y32ScMJJt/KK68rAM7PaFMeuiGcxPvDCtxC/6ksWHIJxfEb7VnONvpNZbsKHX23S8U/Cd3bVO2mLfkA+x4ut6i74IqMu9772omWSnf3llNNsWCL7FD75fHDlpEC94TxQ4aogu1hhwgROrHWCD5KTkTYFSWvSYdU2/64ewJtYomYq9E9u+pUPoHEWpklc6D3ps5OsIYUSsAWZiEq97km8yL4UDL4px9bBFdVKzitG50+Muxb4Z1rqqifH2JrZveMk7aE5BHJGCAHXspYK+K87ekC8WX2Qs94yKTgXodByWO1bZGW7d0eMy8c3U8WgQBITtUbQClWgaebXOoYRq53EtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neIQZ09vhPDwcsHJQ19y0AcGlkDUvyYKkBgZiPVLb3g=;
 b=GiUgvs7wmKJKBAHdFk6qirxfLtuh2cq2cPMbLdwpLVFeEJmn7PpVW63hNAbPwM2zkIHAHis9pU+X3cGDHyScYn+ljGHcpJs42l2LfAVZisk4fathPumfFM79Yjka9WUrmfOtlL79mJT6looYlCXqzGAF35vbR4VjZLHjsKZjatU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB2318.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:113::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 17:17:23 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 17:17:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 17:17:21 +0000
Message-Id: <DG5HX5K2T371.3JGY5PQIV554K@garyguo.net>
Subject: Re: [PATCH v2 6/6] soc: qcom: socinfo: Convert to Rust
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: "Matthew Maurer" <mmaurer@google.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Satya
 Durga Srinivasu Prabhala" <satyap@quicinc.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Michal Wilczynski" <m.wilczynski@samsung.com>, "Dave Ertman"
 <david.m.ertman@intel.com>, "Ira Weiny" <ira.weiny@intel.com>, "Leon
 Romanovsky" <leon@kernel.org>, "Trilok Soni" <tsoni@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-pwm@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-6-d6719db85637@google.com>
 <2026020315-conch-trickle-2d84@gregkh>
 <DG5H119NY68Q.TWLCK3W36CM5@kernel.org>
 <2026020347-sneak-embark-1b36@gregkh>
 <DG5HGZG62NNS.18BCSOO6TR70G@kernel.org>
In-Reply-To: <DG5HGZG62NNS.18BCSOO6TR70G@kernel.org>
X-ClientProxiedBy: LO4P265CA0143.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB2318:EE_
X-MS-Office365-Filtering-Correlation-Id: c88eedd6-fdc5-42ad-a98c-08de63481835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0t3aUdRa1pjVVlqTDNLRG1jTE1uUThYQnZqVkhLWU9kdnRSWTgvQUtBaTY3?=
 =?utf-8?B?S0FnNWRka1lsZWVNZmpVWEt4ck93Z0lDTi93cFN5Y3ZLdjBKUHpIb3UxbjJI?=
 =?utf-8?B?K0hUZEJFL0VVcnF6Q0djZDNtTlhvbE8wZm9nTldVaG4xMmVpL3JkY0xpRzFN?=
 =?utf-8?B?SmJaVU83TVk3dUdWWUxqSVJsSGNjdlJFYndiV05ZUnFWWEc2czNGMUVIdklJ?=
 =?utf-8?B?aFRZZ1NVK0tmMkVqWktwQSs4Yk9EUXNHMmxvSCt2cHQvYWZpUTd4aWFJV0pL?=
 =?utf-8?B?R2I0Qmg0Ly8xVEVyeHVlY3hYT2lYNHFLQ29HTTRaYmVtYVhTRmVNbTMxQ0oz?=
 =?utf-8?B?L0VvMHkxR1U0UUIxZE83d2t0Qkh4UDJnME8rR3hXZXpxSy9NclROZm9iTzlW?=
 =?utf-8?B?SHgyV2R3c2l0S09FYjFoL2dMUmtxM0g3dXVBRU01b0RGbzdSaGg5bXFsQlZM?=
 =?utf-8?B?d0ZlR3FZMW5rOHhTZjZyQi9lSkxydG5YdTJqR3RQbFJLcjIyU3JieUQrSlJx?=
 =?utf-8?B?OUNUUTIzN2Z5MFFRSDM4Q0wrOU5yV0c3T1pVUnFwVCtzOFMva3VBTjdqUTBV?=
 =?utf-8?B?cWpiSnlhZ3ZRSFovaWVteitYRlR0cVRUb1o4WDd1NUVpaVRkckhjZ0oweXho?=
 =?utf-8?B?bmtkTnZQZVJVWlY2U04ybTBEVkgyMXV4NllHVFZDV1gxRUs1eHY4WmRGemIv?=
 =?utf-8?B?UWwzdlVSdzU4a3crbXZRbTlObzUydjJ2TlZsSGdGUnkvM3d5L1pzV0RGelBL?=
 =?utf-8?B?bUFRRlhFdGtjTWtFRzNtbnhHWHZvSTNnUWxPVWV6amZpbUlxUUNVOHFqcU4w?=
 =?utf-8?B?djhZUVRRQ3UrOXFFOXlweHU2bnJScUlUYmlGY1JTVTlZdnVmeXUxam9aZWtJ?=
 =?utf-8?B?UTB3WTBkcnA3bGc1K0kvc1QvSktDZ08zMDJ5blFBVnZiU1FzUXBCZzJJb1JD?=
 =?utf-8?B?bTlpd1FwbWZiTVgxQTRwZnlGUnU4ZTJRVzdBMHdaV1VrSnVabjdIWTNtcFJJ?=
 =?utf-8?B?Tmh0K3VDSlNrcGJuVEFOUzU2K1UvWU5UMFVpaHhWUVZlQko1Ymsxc1N5RU5P?=
 =?utf-8?B?WFNMS2I0eCtCaWV6NTNkd25PYnRHYjhzUnk5Ky9sY1Q4NWZWWldCaExVTXFK?=
 =?utf-8?B?R1MyZWpldWF3eWtvbjRLV2k5WGdrL3NuWDZhQTlGY293SzZ0aWJqYUJSWUkw?=
 =?utf-8?B?a3pSSlJxb1B2M2N3TjRwZ085cTFuTWYwOTNRYzFQTlBjNCtLejRLVSsraHhy?=
 =?utf-8?B?RG1EUjB5OHNYdHRIR1M0S0VXY2RmaERQRS9DaU9iSUhTMTZvdllteENZVlNa?=
 =?utf-8?B?TkdqcWNEaEhVYTBiZEF4N0h0cWdBbmZRSXk2YVRhdGFjelMvWFdzS0dlQm1Q?=
 =?utf-8?B?cGJZa05BUnZoOXpVc3hJcmF5eGhrMDFUUjNQYUx1VkZNL21LNXhjTjR1VXBa?=
 =?utf-8?B?SW1hL1lpQ09kTnd5dnhvV3ZNckh1VjRva3RLSm5TRUpZdG1lV25ZNGxSQ1kv?=
 =?utf-8?B?TTV1a0R0aGlqTjhhWTdYSU41MTZrbzFUaWtmUjV4YXdXQ3h1bERERkx1ci9T?=
 =?utf-8?B?T3poRTY0WTBiZElBSWxEclRXblR5SDQzRHlvNmRXNnp1YkxTN2N3bDUydkU2?=
 =?utf-8?B?alhyNGRzMURCcVREalVHbVhpV29jZHhZY0t1bi9lVlFmZWxwVWEvSndYYU5j?=
 =?utf-8?B?VS9kQTZPMC9LNUkxRW10T21LbWVVRndZMkFJcFpmS1FtZy9BRDBoUDlGb0NU?=
 =?utf-8?B?K29Mc2pVM3BPWVRIQkJmTTVaUDVOTkVzT0ZQQ0FCQjJ6Y1VQN0lISzBzR0RZ?=
 =?utf-8?B?RmZ6SW9tSGZwV2JXSnMvRVMrSHgydHZGc3p5bWdKRDBiVGdZNDU4eHZhWVpU?=
 =?utf-8?B?K2lSUjRWak5XS3M2dW5Eb3Nrbm53ekxxbjMrUk1LV3Z0QTY3NWNKQ1RmWEpC?=
 =?utf-8?B?c3pwQXovSk5jek9CTnpkUStkMUdwOHJLQStINXVycEs1bmRQbnRvSkdqNE9v?=
 =?utf-8?B?OHJmL1UrK0s3WHNXYlNMSW9LcnR2TFV5SG96ZWpZYUg1eXc0TnJMSE9uTG5L?=
 =?utf-8?B?RFJ1VDlXQ0tFQUMwbWc1UzVMK09nZkRMT3VWbjBUSVdLd1J5dGVFYzJKb0dB?=
 =?utf-8?Q?lVC8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHBMOFBWS3NwRUlMS0xkSFZFaDlnaDdXVGFtTGJCcVpiRy94YmtNQzMrVm1n?=
 =?utf-8?B?cXZPRnUxcmFuUXh0THpEVG9aZmJOTU0xQTRzUitTem1RUXRyTm1KS1ZlZDNk?=
 =?utf-8?B?T0FqWWo4SnlONkRQZWp1QWdoZGtObDgxMGhqM01MTDRJRHhXemxnai8vVStZ?=
 =?utf-8?B?MSthdVhUdnZIMlRVUnltRGp5QVBacFZZRldjeW12Tlg2Z0FneTYycTN4eW9O?=
 =?utf-8?B?LzdhVTBZbGZUanJiZUdmSVhXNXdtVUE3OVlRSnBva3pKS1JkTnVSa0kycEtP?=
 =?utf-8?B?akkzV21neGJRN01STW9CVGROaFY5WlVjUDBXdFZyYkdHaFBzRFhOaGNDTkhE?=
 =?utf-8?B?RVZablJpT0xadENVbmkvTmh0VCtESkQ2WERRdGc5Rjk5eHlYdWd0a0ZuaWdl?=
 =?utf-8?B?Y0pkak83WWVZeEprUjlhbE9TSW4zakJWNXlIdjRkbFdwSDcwS2ZSTmpJV3Fx?=
 =?utf-8?B?c0x3ako2VXZySzZESENsZUc4ZkxMZHE5WnJPUU1aUEREd1hQTjk3aUdGaHdj?=
 =?utf-8?B?S254ZFhNVk5LOXd1ajQ4dGZSTWdQY2RtdlhGazFuZXFsWDFONENOMzM5Y0Zk?=
 =?utf-8?B?M2RzOEdwV1ZTV283T0JBK1FlaFUvS3N5VjZURlJjRlJHZGpIblBsME5lUzZo?=
 =?utf-8?B?c3VINnJHZTBxZGt3bFplZWJCclZZaVRWUHFIMmNUMjFZOTBXUWtMdmxvRHhz?=
 =?utf-8?B?R0ZYN2FBbHEydkJlNVh4N3V3bmp1QjE1ZUpjYXgxcE42YjR4bGF6UjhCUCtn?=
 =?utf-8?B?QWVuM21ORzdpSmh1Q00yM0NSdzlrR09xNVhBY0kwclQ4ZUczOUV2SUhsY3FI?=
 =?utf-8?B?RmdlM0U1VVNTUCtRM3ptcGF0U1gzV0hjQjFaQVFFRkd0TVRNMWhYZjJCZDQw?=
 =?utf-8?B?M3oxZUUxc3ZnMGdMeXhuUHhRblFpc0hlWW14c05qWS9RNUlGdTloYzBvMEN0?=
 =?utf-8?B?VXIyTklFQXowRFQ5VEFkdzZIWjI3dWhSMy9ROVN5THpPWnJBeWltVVIzdHZ0?=
 =?utf-8?B?TnNFSHRzZGMxRlVuclJvK1grNE1Xb29Xa1RwWW8xYU1ZMUdqUGpDMTVROTVK?=
 =?utf-8?B?MmhaVzNmZHBBZlE4RzVaU2xQbXViUE84Q0pFOVZUeFg0T3NweFdFNmZhbTlR?=
 =?utf-8?B?L0FuazF0eWNYYWp5bTJTNlcxL05HbG16TysxRDgwN014L2p3MkxWSCtma2F5?=
 =?utf-8?B?SzZHYS9ITW13eHlSQXZETGlmRDJkQitobEt0bm8zWDlSYk80OHJudTJsNjJD?=
 =?utf-8?B?a2YxWGVuYUZJVlhGd1BmNkVSSTYva2RyemxLeFNFdEl2OGV0S21IeEVsai8w?=
 =?utf-8?B?UFA0Qk1MOUNBM1I4S2FQUEplUy9YVTltNjNHd0JLa01Yd2JXaHdTMWtucHhH?=
 =?utf-8?B?elRlb1VmUFdwdEdrd0V1MWQ3YVlXYy85SnhOWnA5NE5sbXFzU05TUmVoVnM0?=
 =?utf-8?B?VFdnd001d1R2WDBXOHhpdkZ5aVdyeXFlLzVyY09lQkFGMC9rY3o0bk02NFNF?=
 =?utf-8?B?Y3M5NEpHcERIeE54YnNhblpZdURPTDE4bXhiRGtHQU13bzFqWkVpOHFFM3ox?=
 =?utf-8?B?VWZHUUN4VXZWaWh0Vmg0VGIrV0kvWk1lVTVubExFanZjZXBWOWtFcTRCRTJX?=
 =?utf-8?B?cFRpZE54eTVKVWl2R0JmN3BlWEZmemtBbkRaUENzd1FwdmFETTRYNXpMVUhH?=
 =?utf-8?B?MHIrM2RBYWY0VUEyUDFJQXZ4RDkwT0tGdmFsMkcyRVZ1QW5ReFQ3dlBnOStv?=
 =?utf-8?B?R244RS9iODI2VU1vVEtpQTFNRGo0OGprMFJwaktUSmpNNjhYQlFTdzk5N1k5?=
 =?utf-8?B?bHNwd3ZlK3l5Vlk3bnppSkNCZUdnUmlqM3h3SGQvbXNTbHRXWDhzY2pHQnZs?=
 =?utf-8?B?RjNWQ0JkSkVEZVpzM1U3RksyQlJFN0MrVXJYM3JzOXFhV0JVdldJcE5aVjdy?=
 =?utf-8?B?S3R0WnNsSFNlTnFoQTRBVWhLRkNSUi9yRU41dGNseTBSZjVaWHFEZjY4eTlO?=
 =?utf-8?B?cVJDWXZEbHlaZElTY2tVZ21Ta1pkUXZtNjR6RDZ0b2tyeTArN3FydS9WMVhv?=
 =?utf-8?B?dHZja1FKYWRwb01lcTlLOUZnVHhZbE5XcG5CQkM2K3QxVEZvdmw1TytPdDB2?=
 =?utf-8?B?WVYvMEZseHlVYnBLMXRUUVlNdE5PYktzSXJtWEY5RUtwa0pRUzFXY0FVdTdD?=
 =?utf-8?B?bitGRXdCZ0k4bmpHSE16ZTJXemVRMTZzcDd4ckRNa2pqalpDN05xbkJNK1NV?=
 =?utf-8?B?NFVKOFI4eU5ZNUlOOFBwU1Z5ejJsWlZPeU1oSDh5REE5WnFuOXlPRU54OHJX?=
 =?utf-8?B?MEdveW5FZE5UNVlxTTN6T29CSEpnM0VzYm0zWVhjcnlWcG9MenZzZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c88eedd6-fdc5-42ad-a98c-08de63481835
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:17:22.9438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CrrGvqovBOnTelD4xPlicU2/KsFCMxNFpAu7EQ74A2Nhan+P3spD9+iOSBr6LFLDeqzlJ9i0hNvwoqgs4k0ljw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2318
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
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:mmaurer@google.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:satyap@quicinc.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:m.wilczynski@samsung.com,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:tsoni@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-pwm@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,quicinc.com,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,ffwll.ch,samsung.com,intel.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8EF9FDCA52
X-Rspamd-Action: no action

On Tue Feb 3, 2026 at 4:56 PM GMT, Danilo Krummrich wrote:
> On Tue Feb 3, 2026 at 5:48 PM CET, Greg Kroah-Hartman wrote:
>> On Tue, Feb 03, 2026 at 05:35:24PM +0100, Danilo Krummrich wrote:
>>> On Tue Feb 3, 2026 at 5:28 PM CET, Greg Kroah-Hartman wrote:
>>> > On Tue, Feb 03, 2026 at 03:46:35PM +0000, Matthew Maurer wrote:
>>> >> +impl Smem {
>>> >> +    pub(crate) fn access<'a>(&'a self, dev: &'a Device<Bound>) -> O=
ption<&'a Mmio> {
>>> >> +        if *dev !=3D *self.dev {
>>> >
>>> > How can this ever happen?
>>>=20
>>> You are right, since this resource is local to the driver, it should no=
t be
>>> possible to have another devce from somewhere else (especially not a
>>> &Device<Bound>).
>>>=20
>>> However, from a Rust perspective I think not having this check would be=
 unsound,
>>> as the method by itself would not be able guarantee correct behavor any=
more.
>>>=20
>>
>> I don't really understand this last sentence, sorry.  If this is "not
>> possible" why would that at the same time be "unsound"?
>
> It would be considered unsound because the function itself can not guaran=
tee
> that it does not produce undefined behavior, i.e. it would otherwise beco=
mes
> unsafe.
>
> But I'm not an expert on this, I'll let Benno and Gary jump in.

Yes, in this code, `Smem::access` is using the passed-in `&'a Device<Bound>=
` as
a proof that the device is still bound.

If the check is not present, the user of this API can give in a reference o=
f a
different device, and now you're pontentially providing access to the MMIO
region to a device that is not bound anymore. A important property we want =
to
enforce is that UB cannot happen no matter how an API is misused (it may st=
ill
oops, which is bad, but better than UB).

This particular code, though, probably should use `Devres` as Danilo sugges=
ted.

PS. Personally I think this check (and the one in Devres::access) should us=
e
assertion rather than `EINVAL`, because it is a bad driver bug when this is=
 hit,
and adding failing code path for something that is a bug is something I rea=
lly
dislike... It should at least be a `WARN`.

Best,
Gary
