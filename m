Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A856CC0A78
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 03:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D21610E655;
	Tue, 16 Dec 2025 02:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MQKKvhtV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010059.outbound.protection.outlook.com [52.101.201.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F73E10E667;
 Tue, 16 Dec 2025 02:57:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsyGNW1GSd1quvw5VzFJbJ9/Ikohcg0Wqwz78vQyXU8JTUqMdpRkNuFzsK9RWFe5pFKDDEIhhzhjFY3zgcoQ0485FVKjKzBseWkm06pw0jC9Nlv/pqDeMVfVB+EsKDruQkT41Ib4ohQmalk53xa3hZKO5hLZtgZc1bX6su1h5CT8egUU+AHnxHj8bAi0/eFem4o6vGMTwfiVqkR2nIivh/ciiFUZpwdpEUoTUruT7Kl3qU8+KG2Db+QN4SxjdFm950x1FGejG2z+mBXGjBQmbBnkAQ6+HOcFI33pJpQKlJv6A4owUXBtPXHlW6OB8AS+EDP+slsfYsayqvoaLig3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDZEUggjIkh/oIDG4MesEduVWTm+4V3ullCG0SWvUbc=;
 b=XuSsj8bHvPoTTm+8Zxz19xHCUJLrSqCm5mcSJdVRUZv6UpoWvZ7v+b5rtKBmjtQgi+yHMCLczgTZddJEm/9nhV+aJmn+Bwf14i165CAaYq5+Yea1HZ/P8m4vPiZLl+ASpBNAIZrAhxlAR0jz2Ru3SfjsiwgV7clg8gBSAvf4O0Rt96rnqduwchXeFTQZ+rnojsaM7ORKikj5IC6o1fYTXEk+JGPNHkD5vA05uVlWScYAg6PHHWyLVvjy+usoec5GDMpoz2cql9sRNjL2gSdbCbSKNvm2a09erSB0c0fSy5AIpJEU8n3NYs5D3fKxL8jqMcT7Lh+80uX6OoBgxneRag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDZEUggjIkh/oIDG4MesEduVWTm+4V3ullCG0SWvUbc=;
 b=MQKKvhtVORpxGInocw2L4xLKzj1Ru6Td+HatUaCG3dpSjrZJJLq2iT7vbccPzvpinU+b6vpaoarIP6nd8/MCZnRNXwv1HmF/BMQRevzU4kAzrQjSLtXnx9fhVjbaFa489076zsmSW2XkQn8PwBNNU7XcoNU30oyeqQGQ23BrPD5e5VGF1XwQrUE5Wq4DoHZx3U9Zvgb+9HpS10vJsui7qh9N36hsmEj0bH+IUjCVYlGVwvtpwEeO8+KjPV3jOPQb3AdHI7/kh0iuIR7D1PEJatAeHlK4bWUcf3fo9BImjTp6pgomlLhFrDUPHvl27bvrJxFPJTPAg8ONQO0cI3J1yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7158.namprd12.prod.outlook.com (2603:10b6:510:22a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 02:57:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 02:57:42 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 11:57:09 +0900
Subject: [PATCH v3 3/4] gpu: nova-core: bindings: derive `MaybeZeroable`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-fixes-v3-3-c7469a71f7c4@nvidia.com>
References: <20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com>
In-Reply-To: <20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com>
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
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0126.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bfea2ad-d2ab-43fe-f98a-08de3c4ee16b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXlla0pWdHp4bSswZUFUaUlVMlJ2eHE1V0FVaHFhTlZ6ZGJRaDNLTDJjUFR6?=
 =?utf-8?B?UjMzTGlPd29BRkYxZEY0UXR0NE56RlZzcFYybDlMQTFUcFJoR3hEQ0wva1Ez?=
 =?utf-8?B?TVo5Vm1IeE51MDdwYkJmdVhNMVRlK3k2UjIrT2VVUjhOWmtQMkxNYzc5RUdZ?=
 =?utf-8?B?Y2t4bnF3RTc1TWIxQ1lGTEhGNXpSNmpyZzVGRm1oZXdnN3JIQlFTNVRJWFds?=
 =?utf-8?B?ZmswNm5TQjd4bHRubXBZdGl6T0k1eGpwSUR6WURERG50K2RwWU5nY0Vsc0c1?=
 =?utf-8?B?MWF2SzF0bHBOWDFiT3JaaHlNaHJITGpPdng4N3hSK3BrSmxmaGFzNWJndHgx?=
 =?utf-8?B?NVp6YldWL2ZZbUkvR1dCZlM5VnJYS0x4R3NsRnpKTFVOWTZJMkZISWNOaTlG?=
 =?utf-8?B?MEVkVDRaelpJa0lDSkJxLzFBTnlab1Q3Y1pvdklmcG9zNUp5TERvbEcxSVpp?=
 =?utf-8?B?TjgyUTBsNVFieXFPS0RpRE95Um85aFh5YnR3bkJnSkE3dkY4cG80dUFpYUdq?=
 =?utf-8?B?QjZkbVErUVJwWXZGWWRhOVVMaGkvRGdDa3d4dTRRT01TRHZ5OFNxWUkzSHR6?=
 =?utf-8?B?YjNtTllHcCtPREhEMk93dWtPUGt6cU5GNmdyNnFCNXo4ajFXZGhEanV4NFB6?=
 =?utf-8?B?S0I5MWZSQkxFYms4TDdRT3ZHMjdWeTEyZWVVR1JTVXR1clJKNWlLMHVtb2dZ?=
 =?utf-8?B?TlhJWGMxT09wUURrVTFYZVdTcldIVTJwaVNuMUlVb245NkkvWmlQSitMS3B0?=
 =?utf-8?B?MitxM1FGMUpxWDJ0YnZoV2kyTFhCUjlmdm0wK1JFMXF2Mlh6bkJha09zOFJT?=
 =?utf-8?B?NTgrd3dQZW5CQlRkdm5FTE40c3dVQ3JYZTRkVTlpNk9IQ1JlMGsveDRqWkxI?=
 =?utf-8?B?T2hZVVAyUVRmYktMcjJzWjBROVFxTUR1YTgyQnZVd0FJNXFCMlllWHlHK25D?=
 =?utf-8?B?ZklXd2xYVVFkYTJWdVNGL1FVbEE4TS9VLzNyakdOenF1Ujc1VFAzcUtQWTI4?=
 =?utf-8?B?R0xFVEtTcFpndmI5N0xSZUpSVWZpMUt0RzVSZFpVaEZBMGljNkRoRHNBSC92?=
 =?utf-8?B?RTFOMzB2RTlCN0p3S1Y0RUxtU2ZrVmF2eDBLc0tpbVdITDNHT1Q5dlg0djgw?=
 =?utf-8?B?Mml5U3duYjM1ZjVpNWFtbmxOejlmNWZBandnZ2hPSHliSGxkbHdYV3lucmwv?=
 =?utf-8?B?dDh4ZHhMaGlzSlRxb2RjMG5pN0NObjhINmJaL01DbnRqUitaRFV2L0JBTHJq?=
 =?utf-8?B?cXhIQWdQckttYVpoaW9LWUw3RnIxb29OMWhjWnhxWFh0SFpJUEQraFNYcjlN?=
 =?utf-8?B?dFQrcG1iemFsZkFqMHVqZEF3aTVrS3pEWW1qOXRyRHlldVRJb29MVkgwWkx2?=
 =?utf-8?B?SnA1YTBuU0h1VHJ6NnMxZW11WWxRVGU2akZGVnhZM0hHYzI3VU1TUzdlY3RK?=
 =?utf-8?B?TFhTTXlyZSt4OE9ydi9UQmk3aWJYZHMzcnBNZUt5alFwUGR3TnUzSHlUSUV1?=
 =?utf-8?B?Qko0blBQR1FXQ0Z2ZmFNdGtWZ3REQW4yTFE5djMrWTlLdHJYVGlwOWw4UHFj?=
 =?utf-8?B?Y2I2NEdSdWVDQWtIbXBBZVVuaEVqc3d0NzlaQlVid2JQZ3ZrZUhUT1haQzhy?=
 =?utf-8?B?QVc4S0pTUU9RMnJXc3ZVSVdCRmdwOTRSMFIwMjZkTlc2TGZnVW5MUjBkbFNM?=
 =?utf-8?B?ZTVBNkxzRGZhcVBOeHczcWdNSjVUbFJ4eGhQYzBVSzdmeldOcFE0QzRTMGZO?=
 =?utf-8?B?bXF0a3Ixa1BnaTAreUttKzJUK3ljU0VtaFBxbmVwcG1HbHpadGUxZmVSaWFV?=
 =?utf-8?B?N2VoR2V3TWVOdkhrZ3I1bnUydTlyNXJNamg1RkpIdi9kK29KakVrQ2hpcGpV?=
 =?utf-8?B?SVR2dGlUV1B2V3BGc2o4a1ZPK3RTdHhoOEMzZWdQQWdFdWMyUWpubjlhTWFV?=
 =?utf-8?B?b09iaHpocWFncVZFWFNMWnY5Zm16aXNxbDJmVGNFbGxraGtGTTJ1WDdrcTZ1?=
 =?utf-8?Q?imNHSLysJNs1mUe11gsDUaqO9A4TOU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnArOC9OVUI1N3RkeCtZOThqRU5WNnJ1QnFYUlpHbmVpQ2h2cHZXSkk2bWlP?=
 =?utf-8?B?czBRRDRzMUM3b3ZRZkpjSEV2UUdoSXNicGYvdnhwYnJwK1RmeEQ3WTlXWEMr?=
 =?utf-8?B?YjNPUTRwSUpzRjVkR2Vya0NsWmh4L3hFRGJ4ZDdza3lYK3J5bXdWSE5meGR4?=
 =?utf-8?B?RHBIbXZESjg1c1NPQ3lvTHExZVpLSzY0eklzcVBMS0drU3I4U0dSUHEvS1c1?=
 =?utf-8?B?bG9OTTMyVk1hNGFUcDBLa3V4eDF3dXhVQ3YyT1ZvTy9LQ0cydXhiU0luNzVl?=
 =?utf-8?B?MHB4bjhldUxSZGkwR3lKSTQyZHFQcm9PaTU0Z3A1dU9JSi9EUC84NWhPTk1J?=
 =?utf-8?B?T0J6UWo2L25mSmRUL3lUbTQ3NFJmOXpPVi9NUEZWWjlTL3p4bEVYbGluWjdG?=
 =?utf-8?B?ckhQVDBPdEUzMndlYk8vdFE2b21mVnA4SFA1c29ZT3dONGF6d1FWTDkzdndK?=
 =?utf-8?B?MHVDLzNrWkdIVEFEWEpHZGlOSzJ1WTNnSGo2dnlJenlGVFJocnZmemZHcGk1?=
 =?utf-8?B?MkdZZ3F4UHdpYkE3czBheDVlNkM3emhNUGZuNnQ0cEpmeUxrUHpFQ0paNHk3?=
 =?utf-8?B?Z2tKbkUrZEdIcVp6ak5qU0pWTlFKWFEyaXZlakRMKy9nVXdZeUZIUUFyb3Y3?=
 =?utf-8?B?YXJLVTRIQjBFdjhvUU5nS0dnbW1Ec0lySlBnZHp0YlhRZmNJRnIySWJ6blpi?=
 =?utf-8?B?eEZXc2t1WlN6TlZqRUIyRjE1TVRiNXAwOEY1Z21IRmw0d0xlSjFUVDlRdmVo?=
 =?utf-8?B?ek81RFo5bzA0NmVTMktlOW9BK1dLWFVOTlMxcDBlS2w3SkdxbkoyRkpzbm9J?=
 =?utf-8?B?WGtxWmlacnRUS1I1K2l1WUVuTHF5THhsbHRXaEYrbmNZQTBjTXEzV3lydjFa?=
 =?utf-8?B?V3dDOHkxclo5UFhDZWlDOXZJOU5BcElVZmJWTXRJV0VBblVXTXVJbmFxMksr?=
 =?utf-8?B?ejRWVjNGYXdleXBrMnJNNGFmRG5PUzRNY2NaV0JLVEF6Ujd5ZmpjR3ZvNEV4?=
 =?utf-8?B?ak9TSExKMVhDa3JBMnFadVA1ZWVSeXpGSC82dmdGMGdOalB2OVpTVzJleExo?=
 =?utf-8?B?VGpHNXc4a0pzdlJld2tXb1RMdHU5N2lvVlhtRUlHWGs4TGZvYzhuUlhDd1Zo?=
 =?utf-8?B?MVAvTWFyTjRuSmIxRDUwYmhMRnJmLzRiMlJUZXRaalB4cnhzOUM1ZnRqVDMz?=
 =?utf-8?B?UzcvRlZ3RVV2a1NVTmQ3c1hpcUZTT0lWclFXWnYrTkcvc0tKaVEyN3ZFWTlo?=
 =?utf-8?B?clQybC8vK3BRb0poOTFDQmVUMWtWdFRuTWRITHlqb0ZDSU5TMERNYjdKRVVt?=
 =?utf-8?B?R21hMSs5RDR2OXdkOUdBVHM0Y1lWeDV4cVVDZ2pFbVIrQUNZV1kzaG4xdVNT?=
 =?utf-8?B?OHdnUjRwUHIycCtrcUpBeFlPT2tDeFllOGdSV2Y0WEZOVW9aNHZNNUZ2cmQw?=
 =?utf-8?B?d2NhbkVldWJtZFIvTXYrSSsvNnFvcVhiVkNnQnZReW84VWtiazU0eFpqdzIv?=
 =?utf-8?B?UWZhL0djeTM4SHE0MlVsWWpKY1dzK0g1Skt4ZExhdnhOR1h6ZW00Ykt3QjJF?=
 =?utf-8?B?NXhhckt1RFp2V1hLWE1TemlSOWpGcURzOWI3ZzB1bWJpcUJZbGNnK0VvcnBN?=
 =?utf-8?B?L0dYalFvZDF2NGlJL21mVnBsb1A4WEZPTmJ0TDJxNW5hQTRGeHVqTWo3TUVQ?=
 =?utf-8?B?U0V4VDlpczFPZ0pWQkFOc2JPN29HMXgzN0ZhR3VraE9UMC92cFFXdlpLY3Fo?=
 =?utf-8?B?b1U3cjUwNUZQRDAySVlSR2dzazVPVTNwcTBjTUN4dlFjalVlOFREMVFNZE5Z?=
 =?utf-8?B?aWY2QU1vcE1KR3M5dTB3bThCY1JVeDVvSzRBQWRUcDVVUEdhM2JXT1UvNFFw?=
 =?utf-8?B?bmxqTys1VGhVaEtwR0ZtOHRPNVZkTnRzUDB1bUJ6aVFxYUhTS0dOZE9leU1P?=
 =?utf-8?B?bCs5SDJvSVFjNmY2SGpJYm5rdXM1ejlJVlVXNjhpY2NEQ21DcmxCL3EzRXBJ?=
 =?utf-8?B?aks4cExRckFQZGxEUE1pcXN4a1ovSDlQVzZQb2hVWmNuajVsMFpZREdWQnhj?=
 =?utf-8?B?Ti94Q2dORVJQcHRLVlNrNUFhRGdTQU8xSk1rS1Q2RWZERVJyYXlIb3N3ZmhL?=
 =?utf-8?B?Qm8zT0VMNStDZWdPYmlyMitKdmFNdlNoeDFGVkRZUlU0Y2FCRkloYVB5Zk1E?=
 =?utf-8?Q?+8o1ltpwe543dDrpt5pzdXrU1usb2Hn38P2N2h0cf5IT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfea2ad-d2ab-43fe-f98a-08de3c4ee16b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:57:42.1577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mUARJv3C2VLA3roNfcnQ/50TcsaKYADw/rSk37pMm2ERzSa359wFegUCB9qrTLJr/nlCBBLG4ZkdNSFoEg/OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7158
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

Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs                   |  7 --
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          | 11 ++-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 93 ++++++++++++-----------
 3 files changed, 54 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 7b8e710b33e7..b754631d2d8d 100644
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
2.52.0

