Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA8AC7A5BC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64DA10E89A;
	Fri, 21 Nov 2025 15:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CJRVi+IB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013064.outbound.protection.outlook.com
 [40.107.201.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B46410E89D;
 Fri, 21 Nov 2025 15:00:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vn+Xdihr99oZZEYJaZNDg9SpZl/47T5UVaf2YmqecDkj/jU8Ik7JhUlfdJwJFtQtGshauwzpK9B0e0TOaKwv0B/MPx3jYriILMd32iLh6TUjbJeT6i8ijCwj+5bIzMNsXO4GzkqtP834Kw9bd9t0K7yns/wYWGp+yUbQl/uyCtJXsEf8FfxKx3264/9QF2pNSFQBijoQ91Qxq0h3RzrcrNz4jb1ozHGQCZkS36vHzl/R30Plq0ZDHmxgr3wEyvJvcIfJs/ov68qodrCFhQxdKUl1NjWkvBwrE4SdQqK2cRXy3zD1sISt5vNW6yPAInKHuxqmqZSAxL2TjWFZGc7WMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EY2gm0yCZ1OdfhCyLBv8Acloe575OGlr3BAqn5RHp2c=;
 b=lhTHRkdz2XlhCy8wXotFpQlqo2pqW4hdk4zZvRGs3ohmeW1SOWijSFHxpsNj9+WYMI5V9vWwSn49E3I8OrKJdW2Hr8j2rQqiV2BWCb529/oM+ky70P7mKUIuX1UKs0moNudOP7W3lvmDymt9HthpG7MAEYD41Hh7FuauebFBynItOM5MRWInIufL28cNqF7U2jyZmGQFcWrmJtUjJ7Qedmb2zbj9ZDNRYUd1YRUSNwACtocYkC1lpMfhaXM/5cSrTbI4f2hiFHXRPNMuyuODtj7GZDPUetAK4T4jJJr/9ViVeyXH/out1WMBi7dXtLbhw7TeOQ0JzjrSHMAUdsoKvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EY2gm0yCZ1OdfhCyLBv8Acloe575OGlr3BAqn5RHp2c=;
 b=CJRVi+IB9VLMbKc0l1362mj0apbijsiv77JpZ98NtbjyZAqgTlqFhVY5TDl5mBbyQE62f5zhvOTx2iln9AtN+8pgjtA/3aww+MtOX0uSYJ0lLBUoAkwtbbNV2PxflBtPg/zFHf1dnlQqSDKGvJvKwUSszkSIJWNCeU6gzqW8kXPbstZ1w3AxqY+j0wsOMofFSgpPQm52kPrjVfsh8ZCPc2ewAe+VHl9hpxxXqq12nAnZJlYY9VSTEvnjEkj+59dTR+5ninyowdMBbgbxYZkHjaR4fwqO/VTz6LemCIbb4dTbgoZ2SfEgFGESwTGnFSMg5z+lArECvRtCv7n+6K1JcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9229.namprd12.prod.outlook.com (2603:10b6:408:191::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Fri, 21 Nov
 2025 15:00:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 15:00:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 22 Nov 2025 00:00:14 +0900
Subject: [PATCH 3/4] gpu: nova-core: bindings: Derive `MaybeZeroable`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-nova-fixes-v1-3-a91eafeed7b5@nvidia.com>
References: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
In-Reply-To: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:405:2::30) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 203fde34-ae09-494e-bb27-08de290eb747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlhiWW5nNWtSMGp4NWZ1S0xNaVo2OWVxR3daTldzQWJNdjFzdWgwd3JjSmdU?=
 =?utf-8?B?WFNWdWkxUWdidnBFWllja0RJTms2ak94bWdQWG56R0I2L0FVUDByLzRVNEIw?=
 =?utf-8?B?THZSM2FOQS8rRFUvU2tYRFdnbDd3bTg3WnVaV092NklzRS9tUTFOOGRlb2Nn?=
 =?utf-8?B?eEprOGlicW4vMno1VzhvKzkybmJpR01xTWJ1SVlabzdsZUVUU2hUMmNhc0tN?=
 =?utf-8?B?UTFwUnpJZkVvaU5RMGRubWxuRjBtd293OFBPQzk1THRCZTFOTU1rMUtzWVpC?=
 =?utf-8?B?YXJ6Mzh6YW0wZDZiZnRQTm9yYzdvT0pwSmxjbzVLL1JJdXhVdHhXQ2ZMZE9z?=
 =?utf-8?B?MWk4bzJLcVFDME5xUEtWRXp4QWkzelc0aFJCNTJNck55OVFTV1JQYVcwNHp6?=
 =?utf-8?B?TndlZ0JmVWlsYUVIVkVUNnM1YUZCQ2hKU01pMDdoVEpXNFBJQjRuTnZFZGx3?=
 =?utf-8?B?aTdGVEUwWklFa0Z3SEpQL2xjUVVndCszUTN0QzZIZnRodUx3N1BhMW9pSXJH?=
 =?utf-8?B?bUtzcUZwNWtPMFR6KzRHc0RXZUo0U2NXR1QwVDZoZnBGOWd2MEZYMVBWTW1p?=
 =?utf-8?B?RkdoVjN3d2hGWXNlNGkrVjlrNDhSN3VOSkZLUEZtdzdxbmM0eDh6SnVqeGJL?=
 =?utf-8?B?K2E2bjBUaGJUY0ZlRll3eXdVSTJOeER5bHdPWndXeU03K3JpVE5GdzNYUkdL?=
 =?utf-8?B?TVVXR09uVThxakJQd3VqU3Ayd1l0VTVDWDFsbVEreThBQjlqRlRqZjk1SDV0?=
 =?utf-8?B?cDFtekxMNFA2Ny8xbEJLNS9qTG84WXdDWkhqd0owbDd0a0ZUMnIwZGJnS0g0?=
 =?utf-8?B?SEdlVTF5Z0JkYVVsemNNSFNhcGdkT09Oa2g2aDA1YWt1NU9PN01oamZrV0pn?=
 =?utf-8?B?Yzgzd1gya0l1RE5GMDM4dEQ2a3NuTjRtT0R0ejJpd2pldVNLbjB4YjhCbTBv?=
 =?utf-8?B?YVJ0aTdTdDJBTWIzMURKRW9Uamc3bDFsVmJoTTBpU0ZnaVB3RFU2RkpRWUFU?=
 =?utf-8?B?enlpU2R5K1pyZW0zcStaTGxDOHZ5YkRWdEIvNHhPbWcvSXN2UjA0Mm1KNFhz?=
 =?utf-8?B?a3ZHV1prOWNtQTBGbHpaTFFXNzl1UzJYcHk4bTJGN3R5MksySmxONzFHYVNF?=
 =?utf-8?B?bnFYanlLNis1bzAwcEpEbkpjMDh2citJU0FGZEt4NDlPdTNMbXM5TS9lZkNj?=
 =?utf-8?B?SzkyUCs1aU5FeVdlQWxEVGd1Ym5Lb0lYM05TejAxNHhHWE9DbTR6c1BIMU1X?=
 =?utf-8?B?ZTJzb01MTkVDSnpFYzVuNGFJUnViTVhxT0Z2cEhkZGwrSXlVemoyU0VuZk14?=
 =?utf-8?B?NW5tNDVNZzJhK1dKUnVYRHNxcXF2d082VFViYVhhUUtvNXRiaHB3bmg5YUlk?=
 =?utf-8?B?OU9oRnlCWHlOeWdXWUZPN0s5WTBXWUhIbmJrTGdqaytCZng2dnRBcnd6WnpJ?=
 =?utf-8?B?TjRsM21kSzRISm9tdklHNmhLMytEOFJVZ2U5RjN5aENaTnc4UGRZR0ZYZ1cr?=
 =?utf-8?B?cG50Z0FDb2JFU09GSlhHUkpQaW1BYXRGeXVxNW5FN3Z5eGJvMHE4YVFjSEg3?=
 =?utf-8?B?SkEycHBDend0TDZuTzJUVUVrZ0NRQWNXeDVDY3E4cjIvV1hGd3kva0ZZa3dW?=
 =?utf-8?B?U2V0bmhyTFFXUENiRFY5VHk2dlZwVXhjMGZ1bFlOQ05zVW1OMHRxWkxldmlz?=
 =?utf-8?B?RFhjek55dnRNYTcyMnk0QzBvaUNjOG1xZ0tCVEFJa2U2WFhOVURsemFMZTdS?=
 =?utf-8?B?cWZzUzhoSTdGL2JpdUJJNjh0T2hBWDFMdHdhSXNFWnVLV1lBZ2lvMDFPK3NL?=
 =?utf-8?B?THhFN01OcjZtWHBwT2g4cGlCaW9FM0E3b09hMEZHMmZPcjdVTUJ0N3ZvcXcx?=
 =?utf-8?B?M0lGQnNTbnFoc1BaTFlPOVV3dzUzQnhLVG5yUzdHaDVBV1RlSHUxdFJlNEpM?=
 =?utf-8?B?Z1dyMFVrQkR6d1hyMG8zWGllOWV0dm92dWVDNURGeThEZXRLU1BMdU5UaGw1?=
 =?utf-8?Q?+QAptIpmJuvXFXyRHSarFMXCWbmumg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEFBWlc1S0M1MVV0ZmNjdlFoWG1SanllUkM4WllHdHErY2gxcUtrMEJHenRX?=
 =?utf-8?B?TjMya1haMS9UYUFqT2ZyaStRL3R5cWxvRFNXZ0R4RE4yZ1ZEclVocmZCMDJi?=
 =?utf-8?B?bmZJdzFiWW81VlRwMzg3dVh5SDk2MStOZWR4ZHhNWWFkWDFaRlU2VTV6VDNQ?=
 =?utf-8?B?K3NpN3gyYmF1WWpDbGttWmtFR3BtZ2dvbHQ0MTErcnpRcG9vNnFTNnUzcnVx?=
 =?utf-8?B?Q010ODVJK1puMU9vQTh5T3ZUZVFvV0lPTHd1dG1VUHRUaUpoVkZ0TzQ1SHZC?=
 =?utf-8?B?OGpOQWdxWlluS0tPbzhYcEFxQmJwY2VKSzNuMlNTb1YybzRZZHVJRlJjTFlr?=
 =?utf-8?B?S1pNTUNCQ0IvQlpvOWRMZFlLM0tBMVVwZm85REF6WEVLYW92R3NhdXViLy9L?=
 =?utf-8?B?dU5sZ3pnV1kzWkxVYm1jeTloaG5EWUNISmJrZXZZQVhMZ1gvREs0d0h4VFAy?=
 =?utf-8?B?bHRkME8xRXQzc21DeEpsbTFMZ09xVDVVbFRNeWVGQ1MxdVZrY2JSRXo0UTE4?=
 =?utf-8?B?NFhZT0xzWmZHczJiMjBGd21yMU02Y2dDKzh6dWdzd3A5VnpPQ0YyTFY2MkRi?=
 =?utf-8?B?NUxIeTBRZGNlSHpVcTBTaDJDalVLYkpnL2E1YWF5UXhyNWJDdEhLV3gwRHhl?=
 =?utf-8?B?ZkJNNmJybXphYVdJK05MTDFoNHlDM0xTQzdnV0xWMmx5SGRWVmg0Z3ppZ2ZQ?=
 =?utf-8?B?WWhIbzVBNjN6L3MzVXRXYlBrTGF3YUk5Rmdwc3VmdzNveWt4cGpWNm5jWTZy?=
 =?utf-8?B?Q2xaRTVsM3ZVaUNxMDVRQ1NHRzAyRWNxaTNQS2lZcmRhVlhOL2x2cTV1b3J0?=
 =?utf-8?B?ZHhTZW54R1N2UnFNZlpiZW9OV3p1U2hpZWpkcmN6SjJrcytCS2JmQWhNekNV?=
 =?utf-8?B?cUhOc1RLVVVkUXdmaXRIdzB6eGxkQkswb1RuN3Z1Y0cyN2ZpTkZZSTkyKzhh?=
 =?utf-8?B?ajhQQlh5S1VSZVUwU1FyRDVsWmVDcjVPWEZZWm9HeGJCM3o5c1JFWjBTdFVL?=
 =?utf-8?B?N3NXL1AxNlMxd0xGc1YzemdFczhJT0tRVkYvUk4rTG1raUdpeVp6L3FpMCtJ?=
 =?utf-8?B?eGZ5K1BoRGVja3dtaW1DazZsZlNBbm5UTHJickYyMVlPUGIxV3Qya09xaFdB?=
 =?utf-8?B?YkJpaEE0TEU0REQ1eGVCeG05eVJEUzBlNURsVGhJVjlSREJCa2N1Nksxbnlv?=
 =?utf-8?B?T0ZwR2JWVG01THhJQktXbHp0ZExlLzdlQyt3UjhjWlBZYXNnbXpUNVdaNXpk?=
 =?utf-8?B?L1YwYUNuK3F4ZDc4aldZcEsvNFlsVGxrZmJTK2dFN0oyK3NJaVRPamsxWFFN?=
 =?utf-8?B?bmtIa24zcUZIUmVDRzZ3T2FEVmJ2NllvckdsWDlMOThDM3dXaUJ3T05qZ1NC?=
 =?utf-8?B?akdVbFdpanRwWkRuNFo2NWM4aHJIYlVGaFI4RWErY3JhVmpHQnQvam5yNFly?=
 =?utf-8?B?RENKM01YeHIySFlqQnJ3OHdIOUF3NGRqRmN2c3BVTnNEa3UvenFaSXpzc0hh?=
 =?utf-8?B?Qi9PNTdCaUlLblZmSm92WFpXUThhOS9OQkpzTm1oVXZmbXBsZmRTUlFyQ3ZT?=
 =?utf-8?B?YWdpbVpUeXhCS0thNEFKVWRvZ3pmQXNRbnF1YXdlK1lPZ0RTc1l6YlhBYkRC?=
 =?utf-8?B?OVFJNU9RYU4wYktmejMyeXhGMW5DUjQvTTRnV2dNam9VSmY5R21pM3Rma2pT?=
 =?utf-8?B?UEQza0swdUZ2ZVFjTkJoWkRtMFFvWVB0ODRDN3lTUWFHQzBLUWRqU0UrTW43?=
 =?utf-8?B?RVVYakplMlc5blJCY0xZQ0xjanpra29oNGw2aGhGV040bmMxVXMrNlAyeGY4?=
 =?utf-8?B?V2xZWXEyb1lCQ0trYitRV0kzZ1BPM2xOS3NVZFF3ajNUUit3eGVsckJqUzFC?=
 =?utf-8?B?b09UdytqSWNXZllCUW55SDlGeS94NzZ5ZUl1ZG1DZUsxSzJTVngycHM5cnhR?=
 =?utf-8?B?a0NYUTRLTmxuSW5WRVFRMUFxd05vcVpIM2hqbmdtZVFpZ2lwZm80U0VRQVNy?=
 =?utf-8?B?TllnSUl3cUluUWpsYVB4d01Gc1V1WHZmV0w0aVY3dWI2Vjh2T0hxOVFYbjdp?=
 =?utf-8?B?UnVLOFdCMTlKK2YzSzBxbTI3MldwNzFQOStUSVdSNmlMeGR5cFd0NXQzUXRS?=
 =?utf-8?B?YVRTOTRxekUvdVVHTkI5S0loUElwaFoxVzJEOHRzZ3AyU3hvYkNDZ2pBL2Yx?=
 =?utf-8?Q?qPd6jpkpLn7olMytHHYvA0jRTHShGgyv5c0cc1jC0RzU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 203fde34-ae09-494e-bb27-08de290eb747
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:00:31.7092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2jJxFwkwOJaztsLr0WxJcWHSnSvZ5Ztoc6VxkWiF7r8SB4X/+1bosIu/eyNzX+iJ8hbRVYRAmWUltMoQyjIyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9229
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

Commit 4846300ba8f9 ("rust: derive `Zeroable` for all structs & unions
generated by bindgen where possible") automatically derives
`MaybeZeroable` for all bindings. This is better than selectively
deriving `Zeroable` as it ensures all types that can implement
`Zeroable` do.

Regenerate the nova-core bindings so they benefit from this, and remove
a now unneeded implementation of `Zeroable`.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs                   |  7 --
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          | 11 ++-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 93 ++++++++++++-----------
 3 files changed, 54 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 7fcba5afb0a3..252755dbb73c 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -797,13 +797,6 @@ fn init(cmd_size: usize, function: MsgFunction) -> impl Init<Self, Error> {
     }
 }
 
-// SAFETY: We can't derive the Zeroable trait for this binding because the
-// procedural macro doesn't support the syntax used by bindgen to create the
-// __IncompleteArrayField types. So instead we implement it here, which is safe
-// because these are explicitly padded structures only containing types for
-// which any bit pattern, including all zeros, is valid.
-unsafe impl Zeroable for bindings::rpc_message_header_v {}
-
 /// GSP Message Element.
 ///
 /// This is essentially a message header expected to be followed by the message data.
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144.rs b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
index 048234d1a9d1..e99d315ae74c 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
@@ -24,8 +24,11 @@
     unreachable_pub,
     unsafe_op_in_unsafe_fn
 )]
-use kernel::{
-    ffi,
-    prelude::Zeroable, //
-};
+use kernel::ffi;
+use pin_init::MaybeZeroable;
+
 include!("r570_144/bindings.rs");
+
+// SAFETY: This type has a size of zero, so its inclusion into another type should not affect their
+// ability to implement `Zeroable`.
+unsafe impl<T> kernel::prelude::Zeroable for __IncompleteArrayField<T> {}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 5f0569dcc4a0..6d25fe0bffa9 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -320,7 +320,7 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const NV_VGPU_MSG_EVENT_NUM_EVENTS: _bindgen_ty_3 = 4131;
 pub type _bindgen_ty_3 = ffi::c_uint;
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
     pub totalVFs: u32_,
     pub firstVfOffset: u32_,
@@ -344,7 +344,7 @@ pub struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
     pub __bindgen_padding_1: [u8; 7usize],
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS {
     pub BoardID: u32_,
     pub chipSKU: [ffi::c_char; 9usize],
@@ -360,7 +360,7 @@ pub struct NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS {
 }
 pub type NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG = [u8_; 17usize];
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO {
     pub base: u64_,
     pub limit: u64_,
@@ -372,14 +372,14 @@ pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO {
     pub blackList: NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS {
     pub numFBRegions: u32_,
     pub __bindgen_padding_0: [u8; 4usize],
     pub fbRegion: [NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO; 16usize],
 }
 #[repr(C)]
-#[derive(Debug, Copy, Clone)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
 pub struct NV2080_CTRL_GPU_GET_GID_INFO_PARAMS {
     pub index: u32_,
     pub flags: u32_,
@@ -396,14 +396,14 @@ fn default() -> Self {
     }
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct DOD_METHOD_DATA {
     pub status: u32_,
     pub acpiIdListLen: u32_,
     pub acpiIdList: [u32_; 16usize],
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct JT_METHOD_DATA {
     pub status: u32_,
     pub jtCaps: u32_,
@@ -412,14 +412,14 @@ pub struct JT_METHOD_DATA {
     pub __bindgen_padding_0: u8,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct MUX_METHOD_DATA_ELEMENT {
     pub acpiId: u32_,
     pub mode: u32_,
     pub status: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct MUX_METHOD_DATA {
     pub tableLen: u32_,
     pub acpiIdMuxModeTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
@@ -427,13 +427,13 @@ pub struct MUX_METHOD_DATA {
     pub acpiIdMuxStateTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct CAPS_METHOD_DATA {
     pub status: u32_,
     pub optimusCaps: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct ACPI_METHOD_DATA {
     pub bValid: u8_,
     pub __bindgen_padding_0: [u8; 3usize],
@@ -443,20 +443,20 @@ pub struct ACPI_METHOD_DATA {
     pub capsMethodData: CAPS_METHOD_DATA,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS {
     pub headIndex: u32_,
     pub maxHResolution: u32_,
     pub maxVResolution: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS {
     pub numHeads: u32_,
     pub maxNumHeads: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct BUSINFO {
     pub deviceID: u16_,
     pub vendorID: u16_,
@@ -466,7 +466,7 @@ pub struct BUSINFO {
     pub __bindgen_padding_0: u8,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_VF_INFO {
     pub totalVFs: u32_,
     pub firstVFOffset: u32_,
@@ -479,25 +479,25 @@ pub struct GSP_VF_INFO {
     pub __bindgen_padding_0: [u8; 5usize],
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_PCIE_CONFIG_REG {
     pub linkCap: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct EcidManufacturingInfo {
     pub ecidLow: u32_,
     pub ecidHigh: u32_,
     pub ecidExtended: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct FW_WPR_LAYOUT_OFFSET {
     pub nonWprHeapOffset: u64_,
     pub frtsOffset: u64_,
 }
 #[repr(C)]
-#[derive(Debug, Copy, Clone)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
 pub struct GspStaticConfigInfo_t {
     pub grCapsBits: [u8_; 23usize],
     pub __bindgen_padding_0: u8,
@@ -570,7 +570,7 @@ fn default() -> Self {
     }
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GspSystemInfo {
     pub gpuPhysAddr: u64_,
     pub gpuPhysFbAddr: u64_,
@@ -627,7 +627,7 @@ pub struct GspSystemInfo {
     pub hostPageSize: u64_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
     pub sharedMemPhysAddr: u64_,
     pub pageTableEntryCount: u32_,
@@ -636,7 +636,7 @@ pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
     pub statQueueOffset: u64_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_SR_INIT_ARGUMENTS {
     pub oldLevel: u32_,
     pub flags: u32_,
@@ -644,7 +644,7 @@ pub struct GSP_SR_INIT_ARGUMENTS {
     pub __bindgen_padding_0: [u8; 3usize],
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_ARGUMENTS_CACHED {
     pub messageQueueInitArguments: MESSAGE_QUEUE_INIT_ARGUMENTS,
     pub srInitArguments: GSP_SR_INIT_ARGUMENTS,
@@ -654,13 +654,13 @@ pub struct GSP_ARGUMENTS_CACHED {
     pub profilerArgs: GSP_ARGUMENTS_CACHED__bindgen_ty_1,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_ARGUMENTS_CACHED__bindgen_ty_1 {
     pub pa: u64_,
     pub size: u64_,
 }
 #[repr(C)]
-#[derive(Copy, Clone, Zeroable)]
+#[derive(Copy, Clone, MaybeZeroable)]
 pub union rpc_message_rpc_union_field_v03_00 {
     pub spare: u32_,
     pub cpuRmGfid: u32_,
@@ -676,6 +676,7 @@ fn default() -> Self {
 }
 pub type rpc_message_rpc_union_field_v = rpc_message_rpc_union_field_v03_00;
 #[repr(C)]
+#[derive(MaybeZeroable)]
 pub struct rpc_message_header_v03_00 {
     pub header_version: u32_,
     pub signature: u32_,
@@ -698,7 +699,7 @@ fn default() -> Self {
 }
 pub type rpc_message_header_v = rpc_message_header_v03_00;
 #[repr(C)]
-#[derive(Copy, Clone, Zeroable)]
+#[derive(Copy, Clone, MaybeZeroable)]
 pub struct GspFwWprMeta {
     pub magic: u64_,
     pub revision: u64_,
@@ -733,19 +734,19 @@ pub struct GspFwWprMeta {
     pub verified: u64_,
 }
 #[repr(C)]
-#[derive(Copy, Clone, Zeroable)]
+#[derive(Copy, Clone, MaybeZeroable)]
 pub union GspFwWprMeta__bindgen_ty_1 {
     pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1__bindgen_ty_1,
     pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_1__bindgen_ty_2,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_1 {
     pub sysmemAddrOfSignature: u64_,
     pub sizeOfSignature: u64_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_2 {
     pub gspFwHeapFreeListWprOffset: u32_,
     pub unused0: u32_,
@@ -761,13 +762,13 @@ fn default() -> Self {
     }
 }
 #[repr(C)]
-#[derive(Copy, Clone, Zeroable)]
+#[derive(Copy, Clone, MaybeZeroable)]
 pub union GspFwWprMeta__bindgen_ty_2 {
     pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_2__bindgen_ty_1,
     pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2__bindgen_ty_2,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
     pub partitionRpcAddr: u64_,
     pub partitionRpcRequestOffset: u16_,
@@ -779,7 +780,7 @@ pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
     pub lsUcodeVersion: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_2 {
     pub partitionRpcPadding: [u32_; 4usize],
     pub sysmemAddrOfCrashReportQueue: u64_,
@@ -814,7 +815,7 @@ fn default() -> Self {
 pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_FB: LibosMemoryRegionLoc = 2;
 pub type LibosMemoryRegionLoc = ffi::c_uint;
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct LibosMemoryRegionInitArgument {
     pub id8: LibosAddress,
     pub pa: LibosAddress,
@@ -824,7 +825,7 @@ pub struct LibosMemoryRegionInitArgument {
     pub __bindgen_padding_0: [u8; 6usize],
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct PACKED_REGISTRY_ENTRY {
     pub nameOffset: u32_,
     pub type_: u8_,
@@ -833,14 +834,14 @@ pub struct PACKED_REGISTRY_ENTRY {
     pub length: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default)]
+#[derive(Debug, Default, MaybeZeroable)]
 pub struct PACKED_REGISTRY_TABLE {
     pub size: u32_,
     pub numEntries: u32_,
     pub entries: __IncompleteArrayField<PACKED_REGISTRY_ENTRY>,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct msgqTxHeader {
     pub version: u32_,
     pub size: u32_,
@@ -852,13 +853,13 @@ pub struct msgqTxHeader {
     pub entryOff: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct msgqRxHeader {
     pub readPtr: u32_,
 }
 #[repr(C)]
 #[repr(align(8))]
-#[derive(Zeroable)]
+#[derive(MaybeZeroable)]
 pub struct GSP_MSG_QUEUE_ELEMENT {
     pub authTagBuffer: [u8_; 16usize],
     pub aadBuffer: [u8_; 16usize],
@@ -878,7 +879,7 @@ fn default() -> Self {
     }
 }
 #[repr(C)]
-#[derive(Debug, Default)]
+#[derive(Debug, Default, MaybeZeroable)]
 pub struct rpc_run_cpu_sequencer_v17_00 {
     pub bufferSizeDWord: u32_,
     pub cmdIndex: u32_,
@@ -896,20 +897,20 @@ pub struct rpc_run_cpu_sequencer_v17_00 {
 pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME: GSP_SEQ_BUF_OPCODE = 8;
 pub type GSP_SEQ_BUF_OPCODE = ffi::c_uint;
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_SEQ_BUF_PAYLOAD_REG_WRITE {
     pub addr: u32_,
     pub val: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_SEQ_BUF_PAYLOAD_REG_MODIFY {
     pub addr: u32_,
     pub mask: u32_,
     pub val: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_SEQ_BUF_PAYLOAD_REG_POLL {
     pub addr: u32_,
     pub mask: u32_,
@@ -918,24 +919,24 @@ pub struct GSP_SEQ_BUF_PAYLOAD_REG_POLL {
     pub error: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_SEQ_BUF_PAYLOAD_DELAY_US {
     pub val: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_SEQ_BUF_PAYLOAD_REG_STORE {
     pub addr: u32_,
     pub index: u32_,
 }
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, MaybeZeroable)]
 pub struct GSP_SEQUENCER_BUFFER_CMD {
     pub opCode: GSP_SEQ_BUF_OPCODE,
     pub payload: GSP_SEQUENCER_BUFFER_CMD__bindgen_ty_1,
 }
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, MaybeZeroable)]
 pub union GSP_SEQUENCER_BUFFER_CMD__bindgen_ty_1 {
     pub regWrite: GSP_SEQ_BUF_PAYLOAD_REG_WRITE,
     pub regModify: GSP_SEQ_BUF_PAYLOAD_REG_MODIFY,

-- 
2.51.2

