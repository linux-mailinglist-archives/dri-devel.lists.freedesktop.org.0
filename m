Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACC8C15562
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 16:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0505510E5FB;
	Tue, 28 Oct 2025 15:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jKbeYWnU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011032.outbound.protection.outlook.com [40.107.208.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBE910E5D9;
 Tue, 28 Oct 2025 15:07:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyY7AOd+ttk3F65LMS48aJw3q2ADvV+52AJF2rrOKsU3ydLTS7W9BIb21PrPz6cKJOAmqBqM+ul2kL1gxJVu9IScOnPcDDF1MFdbz0/a9q+OGNnYHYXqP4wlDK0IeatfnGRuP0ADpm0P/g892AqfyCmcls0e6Wkdvvcw20B39nv4O4fLRrAQLiiAX79M9y2tg8ZQ54YK8JSAF2qKpuM71qs27SvFcWrodlGLuy8Wpn3XmjjsW0WxaPJkYBaQj3p34KvnESl/Qah7VYFmy3P3TQNxyFvVaUSdzGkrEsxettrOymDf7q5fDGVktrR5uXqyHSQkw12goXBkaAFpxwUTpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUsM3bdAzewwtEhA/Sa310RpDK4L/GVvwRgeZymV4MM=;
 b=CezdHZWV6X5dyYADit+2pObdYtastTZZMBJtfYmsidHojP7xlpiAT6RafmJjsA8WQnZVMnVWCJ7uR6VAWiRcidaeVXsfNzWcNaGadiHJRmDD7hNloX80e5zyGDYbMeoesLvQPErfD3IuVGpEOg0EMUmhKZaTET5BRnmdZhqwRE3NOfPoenNklOfia3OdCuzsOd5O3SLvrROWkYZ5hkdx7gyJChA9c1bN7zNhkpHCySFbL3fm4RbVeThcBlQ6HFNSDNbOua/2icGmvwB7mnHypri5puCCcVaXhBJ2X6SA2EJwQ+0+vmF7RlgzACulfntrqysP9rUv9AuVY6qIuIFEXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUsM3bdAzewwtEhA/Sa310RpDK4L/GVvwRgeZymV4MM=;
 b=jKbeYWnUyH9y6zjmHkS6hrcSur7hPx0Vv5T3nlMGSOsT+IfGzFS8g39StoVc7itNaueqe9qG+t9JN/BNb8NkHPke4KlXRrN7j9HRDzCEEISpd9pimjEhbId+dvUrIcwf9Kda/CHOEv38OiY0e6Yy7A5gtWwrJBa10phOe4BdPm+pmgZL2eKUWt2BRD2X5J1hSW3WhZnHZ9H3LzoLI6qETI+iT0/3F2Nn9U08otT/ZQUDJIp1iPuinGxLDY5ilvlig+2GYkOZFRtLEpQTO2IaiWvy9OK+wqZvumHpxMEaJgFCwkGaDOwYTvLU+c/Kg9+zJ/m3QZYksxe0dKb4HwIVFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8924.namprd12.prod.outlook.com (2603:10b6:930:bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 15:07:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 15:07:55 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 00:07:39 +0900
Subject: [PATCH 4/5] gpu: nova-core: vbios: use FromBytes for BitHeader
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-nova-vbios-frombytes-v1-4-ac441ebc1de3@nvidia.com>
References: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
In-Reply-To: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0111.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8924:EE_
X-MS-Office365-Filtering-Correlation-Id: a65c1340-a938-4ce2-cdd1-08de1633c601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzZ0Yk1SdXRpRkFITWc0Q1pzMEg1cWZTMytpZXNUczJzVmQ1WHJOYmpaUE1t?=
 =?utf-8?B?RnZuQjl5S3dyaHF1dUFwZlZNQjNXbFY2WFpKS2lVQTNHckFMNnJDbTgycEZX?=
 =?utf-8?B?SEhDeHh2MUlCWm5NeW5CdDFVZ051Q3YzS3UxMm9Ka09VRFNCZHA4dS8zUEd1?=
 =?utf-8?B?R1BTMFhsK1dTTndJS3lsb2ltL3pFaDNsSDJ3OEJ3WnVkZ20xK3VaQ0gvc0dQ?=
 =?utf-8?B?Q2RLaHpUVVZIc09KVWZYcCtCbUlhdkk3aTVmT0hNMXo2MG1xekN3akVOdHpa?=
 =?utf-8?B?RzVlaGV5TzdnV2s4blFoUk1jOHYzNEVyN3prM2crb05lTkJtOUxqNWVxY3Y5?=
 =?utf-8?B?SUNXeXA3d2NicnRySTRhaytrdjQ4SnNYMjFXR1lCNFUxYjRmL3dOZVpvN0FT?=
 =?utf-8?B?Vm1KYmJxdnBFaTNLZ1NKYnBmNk1jb3RPU25FQWc1MXdkRDZWNzA3NUFwenZw?=
 =?utf-8?B?NjV6V0pMYmtYNmxXcnVFV21VS0VBVENONXZnazFjTmtiNEZFRUVBY1ErUmVZ?=
 =?utf-8?B?czdkTHBxL1A3QTVLdjRPbnh3TExvdXhHTWp1Y2lRWjlsQ0hDRHJxUGtlVHlH?=
 =?utf-8?B?RSs4aC9nZStWMU43ODY4UGFGWmNVSGxUNWI0RER0Szk3SWN2Q09NcUJpQTAx?=
 =?utf-8?B?QWZvSFpPOHZsRkFOSnNMQ3dkYmE2OGh2Z2FRUVk4S2pJdUtFdHRRNjdJYkdC?=
 =?utf-8?B?M3dZamNXSzMvNXNxeW5HbXlRTFZHdVhlMDhabUxOTnpwTloxZ05mQXJuZ0pu?=
 =?utf-8?B?MCtwNFBsSjdCa1FSamxsdU9pbU1raDlpSjdOTWR5ck9lcXJRWWxBL0FmWm9r?=
 =?utf-8?B?cUVldXNDYk5KUW5VRVFOMjZUdEhia0xHQmY1SGY0bElYY2g5RmVxUnkxa2Zj?=
 =?utf-8?B?NzJKTVl1OGhSTmtTZ3FYZ2pDQWE4S1JEeGpNRFRYT3dFMHRZU1ROSGZUd2NX?=
 =?utf-8?B?MWgrbnpNYlhQeElPVEV1WjVIclZWQmg2SVJsVkhORmxPWElFV3UvQWcwOWZH?=
 =?utf-8?B?SWxQcThyai9KZFpqeDlRV1RNRUdWRmIyUG1ZcEJuRHRuQnhwemdSUFFwUmlE?=
 =?utf-8?B?RkdodW9NUUMrWWZWQWFSZEc5cjN5S1BzcnRPZk0yaTM2RWdvcTZuODN1VWpC?=
 =?utf-8?B?cm5VZFV3cUFNeklDTHI3SmhRSjhQNjlSWkN4dVlRUG9DamVXeUZvdGgrSCsv?=
 =?utf-8?B?S1NLMEhJbmhLMWo5L1NZbk12cW16andMQjJ1YUgvMjVDUXVnYU1ocFZ0WmtI?=
 =?utf-8?B?TkFUZ21FNG9UbENrQlBJeDNLLzlUeVBaWkN6bUR0dit6TnJCVTRvVmYrbzh6?=
 =?utf-8?B?a1VidWl3T01pek5obk12TEQvZE1SVEU5bktiWENFdmNxMDdHUm5mZ1QxYjFL?=
 =?utf-8?B?NHlPZkthN1VoVXhjdGdFcG1QUWdxT0Nna1BjZ1ZsRjZYUGZmLzlmN1RuTlZk?=
 =?utf-8?B?THFjUzV3NDlGbDlkRGJ1c1o3a3BqSzByb3VTcTQ2M2ZEUFBQUld2QzRLaFpE?=
 =?utf-8?B?YktJK3pSdVFFQzRMMTZnTkZoMFJYQkp1aTh0dk11UjRzNitzL2hiUHI3TnIz?=
 =?utf-8?B?d2l0MTM2U2hNcmxmdjlTY3JuWjdkVTF5djdoS0lvWDVOOWxESzh1S3dRM25F?=
 =?utf-8?B?K3ZaMTNUYnN5MEd6UG14Uy9lU1BHUndDWGQwWlgzTFBmT2s0eHM3WnBBcVFm?=
 =?utf-8?B?RXlGeitMVVZKTGo0c243aVJaZ3dNNFFSQ2NFZVB0YTdoVVk2dnl2bUhXSEh2?=
 =?utf-8?B?WDFTZVJsckEvemZ3cmkvalRobnRMRWxhb0wyRktnZmxtQndEejJ2aG84WGlJ?=
 =?utf-8?B?TEo3OGNBRlgxKzQvekpXYXFTVDBzVlhsZlhBUGI1NUdYdWFXZ0hkRHFhN1Mv?=
 =?utf-8?B?MzFQNml0NGhFaDByM25aakRvem1yMnJVQnFkaWdtcnp6QmZRSGp6dnhXT09J?=
 =?utf-8?B?TTFvRDExN0FXMlh6Z3Q2YklRWm9PQlJlRkt6YXJsWUVWRWxFb1VPWG12R3FZ?=
 =?utf-8?Q?G98RgqHI5KH2xfdVRjiPDYIylK1gG8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjZPOVNBWXlZVGwwbjdGU1dMdGdJMGJ6R1d5RnY1VlFrSmxWcjdJNy80b3NW?=
 =?utf-8?B?LzFONDNsZzREVkk3aUUwU3FJOGtGai8vMjVLdGppWXI3d0RTZXVjckFYUlcw?=
 =?utf-8?B?WXV3LzF0T2Yza0Q4Umh1UFB1YjlZL1pBWlhJREFlS2Q4dWVHL1B2U2Rib1RL?=
 =?utf-8?B?d2ZpUGxGSWpkRUg3WW1kVnA2eUJOVlhnVlBJL1dQR2hickk0bTRoTlJwejcz?=
 =?utf-8?B?RTJ3bFFPdW0wZlpUOTBHdUtQT2tVMDBRQ0dDZm1DRGFiK251aGcwOCsvLy9I?=
 =?utf-8?B?ZU8zTzhzTTUzNTJBbC84ZXliQnFtTk1oNG5peVRPSm1hUTNiVDRCZEdEdFlO?=
 =?utf-8?B?UzcyaHZRSDFkMGtLMTF4NDFBWDIxclVJWWJDelAwbkZ3N2dFQTNOOSt5UnhB?=
 =?utf-8?B?K3FpNlV4ejFPSER5cENCZ08xWGJrYW1PN3FKODNkNjVlczZBQTEzQ29QR3JR?=
 =?utf-8?B?cFk1Uk9ET3Z5a2pwam9aZjg4VUVPOHN2TnE0YU8rc0gxWS9XeTBEbXMwMXpL?=
 =?utf-8?B?RzJWOCtNRE9yQ050YWdxMC8zVGREMXVkNmN6ODVWNTJOZ2plbXRvQVJOU3Ez?=
 =?utf-8?B?VGlIMkF5NU1lTGV6VWtjRzMxTnQvNGNBdzdvT2VrRU14cVgvU2draEp0Nk13?=
 =?utf-8?B?ZjRpT0tvNEJZTXp2MlZ5WUhPVDJqT2tIczVQV3VFYjBFNjVqaDFWZUdvd2Vl?=
 =?utf-8?B?NytDQy8ydk44L2U1aFZyZ3FycmdZVDZ6STZHb0xYQjJXRStVdFVCMDJ5VzVs?=
 =?utf-8?B?cHBKeFU2aFdmSDNRc1pZTjVFTFdoanZ6bGVicU1ISEdzdU1GTzBIYnRzKzdH?=
 =?utf-8?B?bzgxNWZGTXZ6aTZUVTZBRGpqVW9SVzc4ZEdJbUVJNFhsMC9kZnY3UUpkaW9V?=
 =?utf-8?B?RzVxa2NZZ0JQaHl1M1dxSWl1TEZxc0JTcnFvRHJzTFJOTlZaNUVnNlpYQjdq?=
 =?utf-8?B?bW1EOW5TTGZMUldOSU5EbkNoUXNSU1BDQ25zdE5XczRWZldkQ3pFeXU0OGtH?=
 =?utf-8?B?N1hhcnZpWSsveG51N0pRMWRHTUpOYkVzRUd3UDE4dVBqVll0ZGhIeXJNM2xs?=
 =?utf-8?B?Q1dYY09vWDJjMGVoTEJuaUJPaGFWblUzeCswUU9HZUhiYVloUHZQMUVyRTdI?=
 =?utf-8?B?Skk0bnFVS1hhU0VXMG1pYkY1ZnJ2QjlLdEVQU25Db3VUSi9mS1MyQlB1S0pP?=
 =?utf-8?B?Mjl6VDdremorUHVtenJORC9Ga1RiUHB3ZWxWaUtScEMzOHBJNGo4QW9LSjIr?=
 =?utf-8?B?RGR4b0FYVERzZFhNQXhGL1BqZXlVWEllWnNlK2pwSnlJSTZ3MmNCckxHUSsr?=
 =?utf-8?B?MEhsSWV5dGJTZzR6OEx2NGhUT2dIbGdMR0I5Rzdjem9oRGVLdFIxY0tFV0Vp?=
 =?utf-8?B?RHJ2dW5vb3hsM3ROQ3Bac0c2NEpBOFB5VExYNzJybTI4WEtMNHJsV0FSVjJ0?=
 =?utf-8?B?TjVqcW41ZmZxVmFreFJzRlozVFZuZTlLeVZaMGNzdkFIcmhpZGl5SmlvR3RV?=
 =?utf-8?B?NlZoZ0k1aEVJSXNkdE5DU2F3L0hJRlBMQ0hXWmJ3OGdhSGNvSHR6dW9EUjFH?=
 =?utf-8?B?MzdIV1FOM3dMTFRHRlU2OFBhcUJWWmdFS1k3aGZIWStubFBUMTVGdDlaQmFn?=
 =?utf-8?B?bHhWRnBFU3pZR1g2VXBEYzJEZTkvSWVHT3dpbVhDdUVpZnVQemRWbkdOY3Zu?=
 =?utf-8?B?QTkyWXVrbHBVdlM1V28vMlRVTEVlZ1kxeGQ4clkzU1NOMWRMakJYRUpKNDNx?=
 =?utf-8?B?KzJCTFFYaTZROU9xRUVXMEhhMHM1WGNHVEE4bURRUWR3eVdSam1kcUE1YjJC?=
 =?utf-8?B?dEtkSHlIdUJsU21vWTYyRGhZeEdlOVZMVTY4cjNjMy85LzFIZ0lwbUUyVTFx?=
 =?utf-8?B?VHFOTGVBaGZRU0xuUHZZVTdGTmZpWTJSa0lBZmRPMkcwVjd3b3poMTYrdWQy?=
 =?utf-8?B?ZU9pbUdQdDE0RmdnWldQWU9nMkgzbTQvSURoSkpLSlJKRVg3blZMMzdMcTFJ?=
 =?utf-8?B?a2dvYUNmMXEyRm9yZ2NNZmluT0pRQkNyckZiNU91WnJkKzVrOXZobDRtQmQ2?=
 =?utf-8?B?MURyRzhDdFJsUldZRE5JQXhGcG44MStHeEpoSWxNZnloK1BtMFEvY1E1dzJJ?=
 =?utf-8?B?c0lpSkhacjlGTGU5NDBZaFR2dGZiQldpeGpGdmFaRWwwSnZtMjcvT1hHZEhN?=
 =?utf-8?Q?6aSz8NXc+Crz0v42mA4uPaNqd+eppJeIyZQPL3nFikIF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a65c1340-a938-4ce2-cdd1-08de1633c601
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 15:07:55.5748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUZv+F5ii7s1zK/ntZtmC56NLOsNwHW8aaJHQpGeDEW7dfOtJJ51DmUroi4UwYDwlcilzMFtOWAuj1ZMJYbh4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8924
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

Use `from_bytes_copy_prefix` to create `BitHeader` instead of building
it ourselves from the bytes stream. This lets us remove a few array
accesses and results in shorter code.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index b02a1997306f..ade99c90dd3d 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -374,30 +374,19 @@ struct BitHeader {
     checksum: u8,
 }
 
+// SAFETY: all bit patterns are valid for `BitHeader`.
+unsafe impl FromBytes for BitHeader {}
+
 impl BitHeader {
     fn new(data: &[u8]) -> Result<Self> {
-        if data.len() < core::mem::size_of::<Self>() {
-            return Err(EINVAL);
-        }
-
-        let mut signature = [0u8; 4];
-        signature.copy_from_slice(&data[2..6]);
+        let header = BitHeader::from_bytes_copy_prefix(data).ok_or(EINVAL)?.0;
 
         // Check header ID and signature
-        let id = u16::from_le_bytes([data[0], data[1]]);
-        if id != 0xB8FF || &signature != b"BIT\0" {
+        if header.id != 0xB8FF || &header.signature != b"BIT\0" {
             return Err(EINVAL);
         }
 
-        Ok(BitHeader {
-            id,
-            signature,
-            bcd_version: u16::from_le_bytes([data[6], data[7]]),
-            header_size: data[8],
-            token_size: data[9],
-            token_entries: data[10],
-            checksum: data[11],
-        })
+        Ok(header)
     }
 }
 

-- 
2.51.0

