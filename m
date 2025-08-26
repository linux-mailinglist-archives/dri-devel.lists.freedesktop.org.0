Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7076EB35283
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 06:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C347F10E2C6;
	Tue, 26 Aug 2025 04:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YMPCmvPP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CAF10E2C6;
 Tue, 26 Aug 2025 04:08:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fn3CxG8G4rB4ShNhyrSRLDPCMhS/k6/lUFqffzW+5qhjQzP6jczztxtRpRmwxrZa4+ja350s5NhGq30VhUR51eoGs66EFDCPxaoIvpA4UraBReVe3DmfqRzFNRSmspz/ukcxwFSmib6xkaC1+NyFuhoJIUoP2/Ab5/34y+Fl8T3ug8gAfDda7rzkkVz8PtjAhVpZvZMmsVlSoSiesC8SzThxWU+E1eVJfX1lrNzIxHyw4lRyPtEEW8xFUPuYRoF7ZQCUvxPg/ptNI7rewecL9PYDVpCs8RubEam6vEdOv24AQrxbBKSoH3CFf6H5kAusSwYgEnrocUxLUs/JsLQFDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrYqeTPiMwfaR8Z6zutaLPf1nxcxfFq303ew6rs6llk=;
 b=ZfPZjnFSnuqCRawiSYVfG6B0jbuVQ6i2sECauuqAoY5w+feEd5jWIUpsaxh8WlP0cS7fnWQTl4k+U74leg0KJ/tA337yw1Ro2GefylW93pUTOK/E+RvnEu3A7+Iul0vMEXBmo9B0iyRWPf3mfq/KUNh1z0jSuUj4VgH1qTklahUChNbvlX3d0LYbGvB9ej5qv0We6XYmwpNmC+ZfSULXzTixTPxcGfuraP2hPfWLASBwHGBBqSNTPQ9X0R3Hx2SwQ3/hGxwhfarWnIZt4i1U9iYfx5vo9ru3Ca0FCDqPT/U+rK7Xtm2ZcreiMncdMkxf4om94lQmH9OoI0thfXB5Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrYqeTPiMwfaR8Z6zutaLPf1nxcxfFq303ew6rs6llk=;
 b=YMPCmvPPUV2/r2OtOtM0VSmkeeM1qWFqvHqeY5LuWvSUNzwmPqjPwQAncoknh2JmCVhtpUEcJj9IWBnVGdAHImhNFR2fmxpnGpsYc8Vz30zP3SyLOyt+HIbEYK0g+HVDEBy74kAfhurNIPXz3Rc7M8Vm1cAQbvbGZGa3cNR/gqNC1cbABD70HrUKN+ploRmXjR7qAkWezDQ3kUCEofo28k9iZFYqphdtgolwsY2XOlB+JUyYT66xrxQZppTj3UAC5rBBa52zwsvnkkjp8/rnoh5WB50pLcVheRQZu5EI1wJ91j1lXDEoY99GZFo7VcDBJNgNjiiUyQ2zc4KBRBHIjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7925.namprd12.prod.outlook.com (2603:10b6:8:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 04:07:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 04:07:59 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 26 Aug 2025 13:07:39 +0900
Subject: [PATCH v2 3/8] gpu: nova-core: firmware: process Booter and patch
 its signature
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-nova_firmware-v2-3-93566252fe3a@nvidia.com>
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY2PR06CA0030.apcprd06.prod.outlook.com
 (2603:1096:404:2e::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1a83df-93a0-480e-2bb9-08dde4562490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0FlR3hLclYwWk9RakxtSml2R3RnNkROQ0NkYk1HdVFpOFJGQTYrUEZNMWxJ?=
 =?utf-8?B?SGxiOXhlMzlIS2sva0dLeU9TNEpvRTUvZjY2cVFvZVhqY1NmOTV4VlhETXJD?=
 =?utf-8?B?SGNrbHR0ZGY3VERkemM3WGlJYlliQkZibFg1ajhNZWRYVktPa253eGRmWFFm?=
 =?utf-8?B?MTV6SEFjRmxac0F0NkVZeUo5OWlzUTk2bDc2eDRwSlBma0RuSmVlZFdTVStJ?=
 =?utf-8?B?bWFBUUtSMnNPSXVrcGoxZXQxV1VjMS9HcDh1Vk0rOHpzdlAyMnJIRllGR25a?=
 =?utf-8?B?c3I2VElvYXlJbnRDUmFBK2paYllRR0Z4VW1HWGVrUHVTandPMkJyNUsyVVdr?=
 =?utf-8?B?MDJPV1BkRWdjV2xsT29PZXByd1JFZTdCQlVaL2kxQy9GRExtUGpuY2o4OHBQ?=
 =?utf-8?B?U08rMG9LZDJ0aGFOdXFwUFptbmRsT3kxUXQ5bXRieWFZNDFZaWczYkJTYUI4?=
 =?utf-8?B?aCs2RWZMTXBDWGEza2ZwclcybVV0ME1uR3BSaUEwZ1NQOTRERUpPbVlndHJq?=
 =?utf-8?B?eDRUaC9VL1hiOTI3bCs0WDcyY0hNbHUweVlkNkNUTFVnNGJiWUdmendTS2E1?=
 =?utf-8?B?QnJqNmtROEdOdDJFa3ZGVVV1NFhPRExmVytaY2NabWtOU21NRFd6Q3RINVBx?=
 =?utf-8?B?QjVNRmFsd2thdmwwZVMzdE1GYW1weDFrWWo5RTlQUlUrZEJISWxvM280YTFS?=
 =?utf-8?B?SktIb2twVXc4QjhEVUIxZXJOQVJqNUdaRktsOXRYcVpzSjdMSUFBVVZwcTk4?=
 =?utf-8?B?OG9hYmpMVm9xSGZLMSsvdzNMTG9ueU5RSE03OUZXcjB4anpTaVFFMElBeU8w?=
 =?utf-8?B?L1l6QUNMV0NQczkvNFVhQTltMUdINjZSdGNFMzJiQmtPTnhkUUdwcGkzaEMw?=
 =?utf-8?B?L1BXdjZEcU5YYS9hUkpVaGxzL25ONE5vbi90ZVJRLzdUNGZzNWUwQ1BOemsx?=
 =?utf-8?B?cGVhNlBVVlJGM1pMWW9kRVFTSjJXaXg0cHl1QTF0UjAyZUxyUTMyWUUxR1JY?=
 =?utf-8?B?MXVicGZseHh1YmtqMmkwdVUyc0ZMeHE1cFpqM1EvZXdVdjI1Mi9URTJra1Fo?=
 =?utf-8?B?OEFGN2JEZ04xL29sTVE3TmxiVFgwOFhPTG9ITjJYZmlCSUExZ1pmRXpHYXRE?=
 =?utf-8?B?bndpMEorUVhJVytIcC8xeFNKRHdwd2pLYUliWnVNWFBJdHZpZlVxZE05N1h6?=
 =?utf-8?B?ejdScHdTZFA5OVphRVhETlE4VVd6VDRobFNnWGVrYkJBVTFLand0bTh4YzJx?=
 =?utf-8?B?TTN4Y0t1ajA3QTlTOWZNc1dSRFIwbTFTRlVxb1Z2ekZmMHF5RTdVNnRzdVB4?=
 =?utf-8?B?bFRNS0RHQlNSMXVkeUtjeUNKQlFpOUpwdjFFWVo3TmtHSTM5QXFkN2Q1cTF6?=
 =?utf-8?B?TWlsMks1MUYxQmRWT0VrUnRsMGNxVU9YU3R5dE5ySGhmUzg5Yys3cElZRGhE?=
 =?utf-8?B?ODRncjJ6aXFWU3dkMHJxZithTFpncnZ2enFseGpSZXJYOG1uRlUxUStwb2lL?=
 =?utf-8?B?ZktEbmdtZ2pxVXdtOEJEaVYrbHhPZ3BHQ0txekROWXFPZkN3UUtsbitBU2FU?=
 =?utf-8?B?MGVaUUJNR0VYVWtVQUgzNElmNTFWOC9yYWZ4NDlEemNLV3ZhVi8zNm5wa3hz?=
 =?utf-8?B?dmVkNHRhVFRuYi9EbWJiV051ZDBaQ0JVaHV2WmlmRzRYei9TSVVZZ3FxdXlr?=
 =?utf-8?B?VjlvQTdDSjJNRzVXUmFPdVErMUl3R2ZLVGNsVml1MVE3S1J4MUJRTWVwQXpL?=
 =?utf-8?B?L3FkRERjb3BGd3VKQXZ0amlMa3U3L2VEVlp3MnF6MjlCM3QwZjM3NmlPMmhh?=
 =?utf-8?B?dUFnQVg4MnhzT3JnTmIrUHFkSlFzdGY0TFhiYjRGRHY2Q1R5dW81V1d2Y3VB?=
 =?utf-8?B?REhXSTJPZ0hVMVY2cmJZWlF0WmZXNWwvYWtjQmRWU2NSREV2WDBpUW1vTlpj?=
 =?utf-8?B?Zm9wSEF1aHZDei9NSjRVTlhDRlNtbURFL3lXVm1DeFN2cUo0cHF1TUZaMUla?=
 =?utf-8?B?eUVwYXh4YldnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzgwVFE0Ry9SajM4S053TWpEam1LK1dFUXlLTFNyS2hZT2xkeFZjSTNNd01R?=
 =?utf-8?B?TnpNdVNCTmNzRnREa0c0b2g2ZDg5ekttSHUzTUNSUnk3VVVEeWJJYkxnYVhM?=
 =?utf-8?B?YXFlNEwrQUZ5blUyUTlrNHdHOVZ1NFkwK1VlVmJMMFZkZW9laXBFYU9ScFN2?=
 =?utf-8?B?eW5rRFZ5VVM0ME5rYTcxUTJkNFBoTTBIdTd0ZVBJZ3VPTitKUlM3d3F6dVVs?=
 =?utf-8?B?MUJuT3hieGllYVEzbEdyRXh4RTVCWVBoSWNlak5Nb21ISWF3RnhHMmJRRWF2?=
 =?utf-8?B?ZER2a2ZQaEhKRlVKdUsxQnRDTE1UQS8wdndiNVJabmRmWXd6V21hVEd6dlQz?=
 =?utf-8?B?VGJCNllqR055L2xjRkZLU2FxY0EzM1phbTR0UWp0aE0zS3FFT2lyYUJJbmNF?=
 =?utf-8?B?bmI5aVdxdWRHZm9NUXZ0ZiszUWVnTnd2dkRTVURKS1drU3lGLzVQNmhnT3JC?=
 =?utf-8?B?STBGUCtmb0J3Q3Z0S0lrUUUzaVcyWU9aRVhVNkFKSmFlTWw4M0x5L0RwWDF0?=
 =?utf-8?B?SGxEZ3FTOGVkVTF3UmJBb1hoZldJTnpmR3NKL0FsbVhLSHZLM2RGUlN3Z2VT?=
 =?utf-8?B?cEk5QlAwOGxycDBxc3V3cnV1S0s3Y0NDQXRlbGhDQW5URGVLMDFCODgxc0k5?=
 =?utf-8?B?dUsyb1NpWThzb0kzWGFyR0VOZi82eE1ubEltN0V4czRrSUVjYXpkQWtlZUlT?=
 =?utf-8?B?RnZnNC84NkNuWHdJS0xlVmRvVXQrUEFyN3RidllEV2RVVjRMdGVSR0pPY0Ru?=
 =?utf-8?B?eXdVcnZtVXdOeVVjR01ub2k3SWJuVGxKMk5vWW5KUlh1OTBRSGdLa25QazFk?=
 =?utf-8?B?T1hOZ3ZqekJ3QnFVQ1g4b1oxTmZZMjFVSDdvemVkOW8zc0tLSDdQSWxFR2FE?=
 =?utf-8?B?blZFR2l1aUx4bm02a1BQaFd1a0NnZEpMTEN4cCt0bUhzaHc5S0wyRXFPUktM?=
 =?utf-8?B?MkFSZ0pLTGMyM01qZ1lIR3JxWlFFMHhnNFZNbjlRbU9LeWVoL0x5NmY5blJk?=
 =?utf-8?B?TXAwdkF4ZGVZb2gzZnFNRU5WT242d0tCUTJRcDMwNENDY3NTWWdNTWxCVnhB?=
 =?utf-8?B?OTZadXVqM3lhaldaOE1SeTdPZXVMNm54dDgrRC9yVGlpZ1RicUUwUlBWS1o0?=
 =?utf-8?B?TEtRUTVqc3hDeUY5aUsyd1JVVmxWMVZXNC9CckZHN1ZaUUxocmdGTWphd20x?=
 =?utf-8?B?dUVOcEJrajR2MURyRngvWHBYRVA1a0FsMmJYM1k5QW9xS2hzZEtMckl4Vlho?=
 =?utf-8?B?dXdPcWhSMGNFNjloVURxOVhZZ1lGWmtxSVltMWlBRG1HSjZFUm83MVZaSnVz?=
 =?utf-8?B?Yy9tUXh1L3UxeHhKQ3dnTDNLQ2hYc2paUXlWOWoyY2ZEY2gwTUJFVFhhTmcw?=
 =?utf-8?B?OE8yZVd3VzNFSmFqRWJ3aGNNOWIrSzQ5bFhIOS9tbS9KZWR6UVFXbmVhZGFN?=
 =?utf-8?B?M2tJQytaZWk4K1R4cFN5bWdKbFVsMjRvL2JZZ3pJL1h1ejF2WWcyV2VvazJM?=
 =?utf-8?B?SmtaSHRJWFU5ODdhSU1YS0tHNnpSNHBiNnBhb05yWjdwYW81alhrVGhZdVNN?=
 =?utf-8?B?SzFDeWJWc1JBRG5rUHJHVUNhaHl4dU04NnoxTjFmL0FLRWV3TllJNE9yQUR6?=
 =?utf-8?B?YVc0dXhkeE1nbENNaFdtdzJsemczcGJFL3BqQnlJTmhNeU92ZkVxeCtjSERu?=
 =?utf-8?B?ek1xZkJwd2FVSlozdUx0N29CRU1VbmQ3bjN5RUZsTGZUWnVhc0JRRVBGekNM?=
 =?utf-8?B?TGZQT0dQL2JRRXNodFNmNGpQbGJaSHZhZmtxY3ZxUnpaQkY5b0RHT09sWWl0?=
 =?utf-8?B?MUpadVNnbnZoeHVWOHlPMmdha3h2a2Y3NGlBOHZPRXJKb0tsdEhpNlNnRlRM?=
 =?utf-8?B?YUw4OGk1VjZZM2t5dzVyWmhUVUtRWUZab2VJZm4yYVZRSG9SOFhUQ2hENnBM?=
 =?utf-8?B?V0wzNHpFSmtWSkdSaW1sNEZIdWpQdTZqcVJpdVJSc29QS3lFR1ZMb2ZveDVN?=
 =?utf-8?B?U05MNEhLTVRiUWxWelUrNTlOdVQxdXA5MGdwbDRjQXA0b0tCNHhxenViUHhJ?=
 =?utf-8?B?RStzY0VySzdoTGVyem00NVpjenUraXd2Y2dhNUVyQmRKSEUxOE9IbFNiNnQy?=
 =?utf-8?B?YzRHbGhRVThJbnBNRTVLcDhOMHJlNDU3WTVKTytBZE9YdTIwYlg5d24xZDY0?=
 =?utf-8?Q?+3CiCkgJX+Dh6g8Ed7cc5DfSEeuD/V8dF7ByDF2pOaYn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1a83df-93a0-480e-2bb9-08dde4562490
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:07:59.0239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbXef7nQREaaGatFeZLTNih4NUofofOaR+oH5rKYU7WHx/Wg2b/LIoosirx8hNKWokFIwyAUNQhjGyxzTcfpSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7925
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

The Booter signed firmware is an essential part of bringing up the GSP
on Turing and Ampere. It is loaded on the sec2 falcon core and is
responsible for loading and running the RISC-V GSP bootloader into the
GSP core.

Add support for parsing the Booter firmware loaded from userspace, patch
its signatures, and store it into a form that is ready to be loaded and
executed on the sec2 falcon.

We do not run it yet, as its own payload (the GSP bootloader and
firmware image) still need to be prepared.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          |   4 +-
 drivers/gpu/nova-core/firmware.rs        |  25 ++-
 drivers/gpu/nova-core/firmware/booter.rs | 356 +++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs             |  11 +-
 4 files changed, 386 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 2dbcdf26697beb7e52083675fc9ea62a6167fef8..7bd13481a6a37783309c2d2621a6b67b81d55cc5 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -293,7 +293,7 @@ pub(crate) trait FalconEngine:
 }
 
 /// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM).
-#[derive(Debug)]
+#[derive(Debug, Clone)]
 pub(crate) struct FalconLoadTarget {
     /// Offset from the start of the source object to copy from.
     pub(crate) src_start: u32,
@@ -304,7 +304,7 @@ pub(crate) struct FalconLoadTarget {
 }
 
 /// Parameters for the falcon boot ROM.
-#[derive(Debug)]
+#[derive(Debug, Clone)]
 pub(crate) struct FalconBromParams {
     /// Offset in `DMEM`` of the firmware's signature.
     pub(crate) pkc_data_offset: u32,
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index ccb4d19f8fa76b0e844252dede5f50b37c590571..be190af1e11aec26c18c85324a185d135a16eabe 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -6,6 +6,7 @@
 use core::marker::PhantomData;
 use core::mem::size_of;
 
+use booter::BooterFirmware;
 use kernel::device;
 use kernel::firmware;
 use kernel::prelude::*;
@@ -13,10 +14,13 @@
 use kernel::transmute::FromBytes;
 
 use crate::dma::DmaObject;
+use crate::driver::Bar0;
 use crate::falcon::FalconFirmware;
+use crate::falcon::{sec2::Sec2, Falcon};
 use crate::gpu;
 use crate::gpu::Chipset;
 
+pub(crate) mod booter;
 pub(crate) mod fwsec;
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
@@ -24,14 +28,22 @@
 /// Structure encapsulating the firmware blobs required for the GPU to operate.
 #[expect(dead_code)]
 pub(crate) struct Firmware {
-    booter_load: firmware::Firmware,
-    booter_unload: firmware::Firmware,
+    /// Runs on the sec2 falcon engine to load and start the GSP bootloader.
+    booter_loader: BooterFirmware,
+    /// Runs on the sec2 falcon engine to stop and unload a running GSP firmware.
+    booter_unloader: BooterFirmware,
     bootloader: firmware::Firmware,
     gsp: firmware::Firmware,
 }
 
 impl Firmware {
-    pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<Firmware> {
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        sec2: &Falcon<Sec2>,
+        bar: &Bar0,
+        chipset: Chipset,
+        ver: &str,
+    ) -> Result<Firmware> {
         let mut chip_name = CString::try_from_fmt(fmt!("{chipset}"))?;
         chip_name.make_ascii_lowercase();
         let chip_name = &*chip_name;
@@ -42,8 +54,10 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<F
         };
 
         Ok(Firmware {
-            booter_load: request("booter_load")?,
-            booter_unload: request("booter_unload")?,
+            booter_loader: request("booter_load")
+                .and_then(|fw| BooterFirmware::new(dev, &fw, sec2, bar))?,
+            booter_unloader: request("booter_unload")
+                .and_then(|fw| BooterFirmware::new(dev, &fw, sec2, bar))?,
             bootloader: request("bootloader")?,
             gsp: request("gsp")?,
         })
@@ -179,7 +193,6 @@ struct BinFirmware<'a> {
     fw: &'a [u8],
 }
 
-#[expect(dead_code)]
 impl<'a> BinFirmware<'a> {
     /// Interpret `fw` as a firmware image starting with a [`BinHdr`], and returns the
     /// corresponding [`BinFirmware`] that can be used to extract its payload.
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
new file mode 100644
index 0000000000000000000000000000000000000000..108649bdf716eeacaae3098b3c29b2de2813c6ee
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -0,0 +1,356 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for loading and patching the `Booter` firmware. `Booter` is a Heavy Secured firmware
+//! running on [`Sec2`], that is used on Turing/Ampere to load the GSP firmware into the GSP falcon
+//! (and optionally unload it through a separate firmware image).
+
+use core::marker::PhantomData;
+use core::mem::size_of;
+use core::ops::Deref;
+
+use kernel::device;
+use kernel::firmware::Firmware;
+use kernel::prelude::*;
+use kernel::transmute::FromBytes;
+
+use crate::dma::DmaObject;
+use crate::driver::Bar0;
+use crate::falcon::sec2::Sec2;
+use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadParams, FalconLoadTarget};
+use crate::firmware::{BinFirmware, FirmwareDmaObject, FirmwareSignature, Signed, Unsigned};
+
+/// Local convenience function to return a copy of `S` by reinterpreting the bytes starting at
+/// `offset` in `slice`.
+fn frombytes_at<S: FromBytes + Sized>(slice: &[u8], offset: usize) -> Result<S> {
+    slice
+        .get(offset..offset + size_of::<S>())
+        .and_then(S::from_bytes_copy)
+        .ok_or(EINVAL)
+}
+
+/// Heavy-Secured firmware header.
+///
+/// Such firmwares have an application-specific payload that needs to be patched with a given
+/// signature.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct HsHeaderV2 {
+    /// Offset to the start of the signatures.
+    sig_prod_offset: u32,
+    /// Size in bytes of the signatures.
+    sig_prod_size: u32,
+    /// Offset to a `u32` containing the location at which to patch the signature in the microcode
+    /// image.
+    patch_loc: u32,
+    /// Offset to a `u32` containing the index of the signature to patch.
+    patch_sig: u32,
+    /// Start offset to the signature metadata.
+    meta_data_offset: u32,
+    /// Size in bytes of the signature metadata.
+    meta_data_size: u32,
+    /// Offset to a `u32` containing the number of signatures in the signatures section.
+    num_sig: u32,
+    /// Offset of the application-specific header.
+    header_offset: u32,
+    /// Size in bytes of the application-specific header.
+    header_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsHeaderV2 {}
+
+/// Heavy-Secured Firmware image container.
+///
+/// This provides convenient access to the fields of [`HsHeaderV2`] that are actually indices to
+/// read from in the firmware data.
+struct HsFirmwareV2<'a> {
+    hdr: HsHeaderV2,
+    fw: &'a [u8],
+}
+
+impl<'a> HsFirmwareV2<'a> {
+    /// Interprets the header of `bin_fw` as a [`HsHeaderV2`] and returns an instance of
+    /// `HsFirmwareV2` for further parsing.
+    ///
+    /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
+    fn new(bin_fw: &BinFirmware<'a>) -> Result<Self> {
+        frombytes_at::<HsHeaderV2>(bin_fw.fw, bin_fw.hdr.header_offset as usize)
+            .map(|hdr| Self { hdr, fw: bin_fw.fw })
+    }
+
+    /// Returns the location at which the signatures should be patched in the microcode image.
+    ///
+    /// Fails if the offset of the patch location is outside the bounds of the firmware
+    /// image.
+    fn patch_location(&self) -> Result<u32> {
+        frombytes_at::<u32>(self.fw, self.hdr.patch_loc as usize)
+    }
+
+    /// Returns an iterator to the signatures of the firmware. The iterator can be empty if the
+    /// firmware is unsigned.
+    ///
+    /// Fails if the pointed signatures are outside the bounds of the firmware image.
+    fn signatures_iter(&'a self) -> Result<impl Iterator<Item = BooterSignature<'a>>> {
+        let num_sig = frombytes_at::<u32>(self.fw, self.hdr.num_sig as usize)?;
+        let iter = match self.hdr.sig_prod_size.checked_div(num_sig) {
+            // If there are no signatures, return an iterator that will yield zero elements.
+            None => (&[] as &[u8]).chunks_exact(1),
+            Some(sig_size) => {
+                let patch_sig = frombytes_at::<u32>(self.fw, self.hdr.patch_sig as usize)?;
+                let signatures_start = (self.hdr.sig_prod_offset + patch_sig) as usize;
+
+                self.fw
+                    // Get signatures range.
+                    .get(signatures_start..signatures_start + self.hdr.sig_prod_size as usize)
+                    .ok_or(EINVAL)?
+                    .chunks_exact(sig_size as usize)
+            }
+        };
+
+        // Map the byte slices into signatures.
+        Ok(iter.map(BooterSignature))
+    }
+}
+
+/// Signature parameters, as defined in the firmware.
+#[repr(C)]
+struct HsSignatureParams {
+    // Fuse version to use.
+    fuse_ver: u32,
+    // Mask of engine IDs this firmware applies to.
+    engine_id_mask: u32,
+    // ID of the microcode.
+    ucode_id: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsSignatureParams {}
+
+impl HsSignatureParams {
+    /// Returns the signature parameters contained in `hs_fw`.
+    ///
+    /// Fails if the meta data parameter of `hs_fw` is outside the bounds of the firmware image, or
+    /// if its size doesn't match that of [`HsSignatureParams`].
+    fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
+        let start = hs_fw.hdr.meta_data_offset as usize;
+        let end = start
+            .checked_add(hs_fw.hdr.meta_data_size as usize)
+            .ok_or(EINVAL)?;
+
+        hs_fw
+            .fw
+            .get(start..end)
+            .and_then(Self::from_bytes_copy)
+            .ok_or(EINVAL)
+    }
+}
+
+/// Header for code and data load offsets.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct HsLoadHeaderV2 {
+    // Offset at which the code starts.
+    os_code_offset: u32,
+    // Total size of the code, for all apps.
+    os_code_size: u32,
+    // Offset at which the data starts.
+    os_data_offset: u32,
+    // Size of the data.
+    os_data_size: u32,
+    // Number of apps following this header. Each app is described by a [`HsLoadHeaderV2App`].
+    num_apps: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsLoadHeaderV2 {}
+
+impl HsLoadHeaderV2 {
+    /// Returns the load header contained in `hs_fw`.
+    ///
+    /// Fails if the header pointed at by `hs_fw` is not within the bounds of the firmware image.
+    fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
+        frombytes_at::<Self>(hs_fw.fw, hs_fw.hdr.header_offset as usize)
+    }
+}
+
+/// Header for app code loader.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct HsLoadHeaderV2App {
+    /// Offset at which to load the app code.
+    offset: u32,
+    /// Length in bytes of the app code.
+    len: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsLoadHeaderV2App {}
+
+impl HsLoadHeaderV2App {
+    /// Returns the [`HsLoadHeaderV2App`] for app `idx` of `hs_fw`.
+    ///
+    /// Fails if `idx` is larger than the number of apps declared in `hs_fw`, or if the header is
+    /// not within the bounds of the firmware image.
+    fn new(hs_fw: &HsFirmwareV2<'_>, idx: u32) -> Result<Self> {
+        let load_hdr = HsLoadHeaderV2::new(hs_fw)?;
+        if idx >= load_hdr.num_apps {
+            Err(EINVAL)
+        } else {
+            frombytes_at::<Self>(
+                hs_fw.fw,
+                (hs_fw.hdr.header_offset as usize)
+                    // Skip the load header...
+                    .checked_add(size_of::<HsLoadHeaderV2>())
+                    // ... and jump to app header `idx`.
+                    .and_then(|offset| {
+                        offset.checked_add((idx as usize).checked_mul(size_of::<Self>())?)
+                    })
+                    .ok_or(EINVAL)?,
+            )
+        }
+    }
+}
+
+/// Signature for Booter firmware. Their size is encoded into the header and not known a compile
+/// time, so we just wrap a byte slices on which we can implement [`FirmwareSignature`].
+struct BooterSignature<'a>(&'a [u8]);
+
+impl<'a> AsRef<[u8]> for BooterSignature<'a> {
+    fn as_ref(&self) -> &[u8] {
+        self.0
+    }
+}
+
+impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
+
+/// The `Booter` loader firmware, responsible for loading the GSP.
+pub(crate) struct BooterFirmware {
+    // Load parameters for `IMEM` falcon memory.
+    imem_load_target: FalconLoadTarget,
+    // Load parameters for `DMEM` falcon memory.
+    dmem_load_target: FalconLoadTarget,
+    // BROM falcon parameters.
+    brom_params: FalconBromParams,
+    // Device-mapped firmware image.
+    ucode: FirmwareDmaObject<Self, Signed>,
+}
+
+impl FirmwareDmaObject<BooterFirmware, Unsigned> {
+    fn new_booter(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
+        DmaObject::from_data(dev, data).map(|ucode| Self(ucode, PhantomData))
+    }
+}
+
+impl BooterFirmware {
+    /// Parses the Booter firmware contained in `fw`, and patches the correct signature so it is
+    /// ready to be loaded and run on `falcon`.
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        fw: &Firmware,
+        falcon: &Falcon<<Self as FalconFirmware>::Target>,
+        bar: &Bar0,
+    ) -> Result<Self> {
+        let bin_fw = BinFirmware::new(fw)?;
+        // The binary firmware embeds a Heavy-Secured firmware.
+        let hs_fw = HsFirmwareV2::new(&bin_fw)?;
+        // The Heavy-Secured firmware embeds a firmware load descriptor.
+        let load_hdr = HsLoadHeaderV2::new(&hs_fw)?;
+        // Offset in `ucode` where to patch the signature.
+        let patch_loc = hs_fw.patch_location()?;
+        let sig_params = HsSignatureParams::new(&hs_fw)?;
+        let brom_params = FalconBromParams {
+            // `load_hdr.os_data_offset` is an absolute index, but `pkc_data_offset` is from the
+            // signature patch location.
+            pkc_data_offset: patch_loc
+                .checked_sub(load_hdr.os_data_offset)
+                .ok_or(EINVAL)?,
+            engine_id_mask: u16::try_from(sig_params.engine_id_mask).map_err(|_| EINVAL)?,
+            ucode_id: u8::try_from(sig_params.ucode_id).map_err(|_| EINVAL)?,
+        };
+        let app0 = HsLoadHeaderV2App::new(&hs_fw, 0)?;
+
+        // Object containing the firmware microcode to be signature-patched.
+        let ucode = bin_fw
+            .data()
+            .ok_or(EINVAL)
+            .and_then(|data| FirmwareDmaObject::<Self, _>::new_booter(dev, data))?;
+
+        let ucode_signed = {
+            let mut signatures = hs_fw.signatures_iter()?.peekable();
+
+            if signatures.peek().is_none() {
+                // If there are no signatures, then the firmware is unsigned.
+                ucode.no_patch_signature()
+            } else {
+                // Obtain the version from the fuse register, and extract the corresponding
+                // signature.
+                let reg_fuse_version = falcon.signature_reg_fuse_version(
+                    bar,
+                    brom_params.engine_id_mask,
+                    brom_params.ucode_id,
+                )?;
+
+                let signature = match reg_fuse_version {
+                    // `0` means the last signature should be used.
+                    0 => signatures.last(),
+                    // Otherwise hardware fuse version needs to be substracted to obtain the index.
+                    reg_fuse_version => {
+                        let Some(idx) = sig_params.fuse_ver.checked_sub(reg_fuse_version) else {
+                            dev_err!(dev, "invalid fuse version for Booter firmware\n");
+                            return Err(EINVAL);
+                        };
+                        signatures.nth(idx as usize)
+                    }
+                }
+                .ok_or(EINVAL)?;
+
+                ucode.patch_signature(&signature, patch_loc as usize)?
+            }
+        };
+
+        Ok(Self {
+            imem_load_target: FalconLoadTarget {
+                src_start: app0.offset,
+                dst_start: 0,
+                len: app0.len,
+            },
+            dmem_load_target: FalconLoadTarget {
+                src_start: load_hdr.os_data_offset,
+                dst_start: 0,
+                len: load_hdr.os_data_size,
+            },
+            brom_params,
+            ucode: ucode_signed,
+        })
+    }
+}
+
+impl FalconLoadParams for BooterFirmware {
+    fn imem_load_params(&self) -> FalconLoadTarget {
+        self.imem_load_target.clone()
+    }
+
+    fn dmem_load_params(&self) -> FalconLoadTarget {
+        self.dmem_load_target.clone()
+    }
+
+    fn brom_params(&self) -> FalconBromParams {
+        self.brom_params.clone()
+    }
+
+    fn boot_addr(&self) -> u32 {
+        self.imem_load_target.src_start
+    }
+}
+
+impl Deref for BooterFirmware {
+    type Target = DmaObject;
+
+    fn deref(&self) -> &Self::Target {
+        &self.ucode.0
+    }
+}
+
+impl FalconFirmware for BooterFirmware {
+    type Target = Sec2;
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8caecaf7dfb4820a96a568a05653dbdf808a3719..54f0e9fd587ae5c4c045096930c0548fb1ef1b86 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -269,7 +269,6 @@ pub(crate) fn new(
     ) -> Result<impl PinInit<Self>> {
         let bar = devres_bar.access(pdev.as_ref())?;
         let spec = Spec::new(bar)?;
-        let fw = Firmware::new(pdev.as_ref(), spec.chipset, FIRMWARE_VERSION)?;
 
         dev_info!(
             pdev.as_ref(),
@@ -293,7 +292,15 @@ pub(crate) fn new(
         )?;
         gsp_falcon.clear_swgen0_intr(bar);
 
-        let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
+        let sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
+
+        let fw = Firmware::new(
+            pdev.as_ref(),
+            &sec2_falcon,
+            bar,
+            spec.chipset,
+            FIRMWARE_VERSION,
+        )?;
 
         let fb_layout = FbLayout::new(spec.chipset, bar)?;
         dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);

-- 
2.50.1

