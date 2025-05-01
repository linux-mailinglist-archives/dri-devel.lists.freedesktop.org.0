Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D4AAA5EC7
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3275D10E843;
	Thu,  1 May 2025 12:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AncMGeRt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0245B10E35A;
 Thu,  1 May 2025 12:59:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDDwFRqIUrPF3Xqa5jmBZlxIJf4agT9ul54u5kwj+HhN9W6mE5CGDqFuUBz+XonbiBtKUqF/czisqw8fH4fH/iGYReZo/cyW5FCbXNvjcIgRosCpuJe8Z2xcBUSqhbz3WvO2B30uhoMGCPDtjUJ3Q50OXaA0gxxEULwo8XgxG+tUsq6oYTpGItOAdOm7y9plcIRpprsLx+xnU/FcJyeyUMEiO88jJ04ENYVvyAfLOUyui6Q3+CnmyutGwypuJol39vSvfdKDEmsU1ft5fVuoNt7RTNy8Oc1HeyUoks1/Lg5QcHZaSa+76uP2rap/DotdoaHurteiiI2TEHDOEpncCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mybvOpuWaGrUeI3A69gYmcpiGT8/agUSd0q+rd94wA=;
 b=PANs1+/tGihdyWUGgDx0U0et8be9wv6HHP40qonm865OORZX4eVKHkdiUzPD37hHHkeQsar4wI1S4LgYSD6/ujVxKg/rRyzB6SJgOJsSm6qQ2o15HT3lzMooJ/ifNQkQttdrtRVlq6g8ggoq9aFTiq8Mw/d/lylZf6uNC75Zz0fiArWRMn4W+ccrGmdVS4NZC28FBdUncSuiqYWFzoEY15uNAl7T7Rd7JYffcLOqy3aX6PJwGVCC2Kshfig0V8t1osFkZ+FjSh4ot79gqqdutTOcRTsMxtVP3VSeWnNz67McaxlZNZ4/zuLM1P5hntr72bnNF50pqaC8pbCCDy/MYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mybvOpuWaGrUeI3A69gYmcpiGT8/agUSd0q+rd94wA=;
 b=AncMGeRt/GRRUyQwqFVmF2lB2NkRpOFVEP5naiV607H2P/N3fNmeWqceGU/48oA6PRpTCjoXY6fn8uBIIHn5WVHE40ltZroKEuJ+LbeggL3yBlE8yNywJtgxFpNjQAEQUWpi3umbW8RoO484uxDpJ7s/JzGdDdHzoHO6zYDE5apuRIjopGtpGXHOrXLygyvMQkF8mySMQPQHk4Fem1Q7HvpHB6cC8Wb8v+ttlp6xTDjZDZeSyRjnGUoPV6gxeuVEqLSJfewbItl/jLHU7UavFbbxqbAXtdR+Ond+uOEqR+DNPXcbe5/CPK1xlYkw8CopnNr6Uz3m1AXJWevmKLiTsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Thu, 1 May
 2025 12:59:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:59:25 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:29 +0900
Subject: [PATCH v2 11/21] gpu: nova-core: wait for GFW_BOOT completion
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-11-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0199.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: fe57019f-2e3d-432a-fd5c-08dd88afffef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUlvdWxEYkwxT0tqaGtXcFNyZmRsMFk1K1FxVWtGWVNVTzFnNFNFbWJZR3JU?=
 =?utf-8?B?U1VpcXR5NVdOSk5qMDBkM21yYk1wR3lsZXhMVHVjOXcvMExEOUZndGo2RjBN?=
 =?utf-8?B?WFhDZ3dVTkd4dEorbGFUVHljcjAxbkIxaks0NG5HcTNNN2F4YW5MZ0pFV2Rh?=
 =?utf-8?B?SjB4Qkl0YkxQc2tVc1k0TER3OGNBbThxK3BYMUlZSUJhbFNrN2MyN1Z6RDZW?=
 =?utf-8?B?Vjl5RmNXV09OeXp2aFRJNDFrWUFiL0hlYUVneFRYOTU5WDZ6SVN3MXR0a3hl?=
 =?utf-8?B?cHpuTVplM1pkN3BLMFpKWEZVQUQ2cWpqaVh4QzRPZjZHNDBFWk1TRjZiUnlT?=
 =?utf-8?B?K2N2SnlxT0hTaFlkdUNOR1pGUDBsRE9tQUhlWUtkbDdYNzcrbnJWRzVXWW5F?=
 =?utf-8?B?azJUMjEyb0Q4MHQrNzdRUkJUcVVDZUduY1ppb0llL0tvR2x6aC80VWFmbGJv?=
 =?utf-8?B?SzkzSFNYdmZ4N0NFYmxqOHI1LzVzdGZoU1pUN1VMcWJyMml5TkswZTkwdnVq?=
 =?utf-8?B?WUsrRDRZcXF2OEtSRmU2aWo1cTJXSnYvTGR3Sk4vZE5leitURTgyeFo3Zlp3?=
 =?utf-8?B?Ly9Kblc1bVNQU0JTdS9MWVJjQ3BxRjJ5akxHUWpndWR3dkdibFA5dERtdDVn?=
 =?utf-8?B?RGhyZHRWdjJQbnA1WWQyQ3loQyswNi9CVW9hV3V3dUE3N3QvK1dIQTZiaXlw?=
 =?utf-8?B?VHdtd293L3QzU0hKSkIwZHQ2WHZCNEVtU0Z6bGRib3IzSWwwdmloYy9GbTV2?=
 =?utf-8?B?SnRNN2hPaGhIMzVwM1luVlZiRnBkZDZGd05WVDRpUi9vbmdLNUNUeitVUkVx?=
 =?utf-8?B?K2xyeGp4Rm1xdFM4TllTbG1yTVEvaTQ0dFJCNStYSytpc1NWTEtjUkNYZDBS?=
 =?utf-8?B?dnJGNWJsTlArT3ZNZXMzSlRVOHlSMHZhK1NBUmMvbG9ySW5sWnNQaEs0d3JI?=
 =?utf-8?B?VisvUHpFS1hEYzA4MDR4UlJMeGE0cW5HL1ZrZFZYRW1TV3YySjNsRG1WeTdJ?=
 =?utf-8?B?NmlhdSt0TmFEQWM1bENTL3dBcmlWWm1KelNpb0oyTHVzKytwUXpXY1kybm1n?=
 =?utf-8?B?MWhMQkozMktLZWtqdzF0ejd5NENUdE90NjdFOVhhL1VzbFVnZXFsUWVMQmVy?=
 =?utf-8?B?MmIxZVZIN1ZwaHo2bkNQRkU4TTI1cHNGTFBCdk1CU0trbjI0dkRTUGZyWTRV?=
 =?utf-8?B?dWhKcUNXQlgyYVFQVXlrK2lWWEZFTFROTU9pRkRCQ1EvK0RsRUVKSmduZ3di?=
 =?utf-8?B?bWIrbkZ4YmgzS3RMeDllYmljSTlyMy93WC9RMWozOU1NSytHWXRnaXk0RGcr?=
 =?utf-8?B?b0YwajQ0THdkSWloNHJkK0ZiQlN1VGY2T24ySE1VZEFtL3QzZXJJVUVyalpo?=
 =?utf-8?B?dXJCS25KVnRnYWNyMDk0aU0zRlc0Q3NUV3VmUmJVZU8xR2tsSGJNUnpabDFk?=
 =?utf-8?B?Y0RCdkZNWUhxTWxKeTdFUzFMcVdpZTFKTzhoVXdoeDIwSU1OY0NDdkNzZG1D?=
 =?utf-8?B?dWRXYjVmejlQRzZ6WFhEL2g2N0tPZGYvclk5N1lKSzVzOTBOT1AyN2J5NTho?=
 =?utf-8?B?ZlZmUUJVZjY5dnlTeHJIU0NrMUtLc3VqeVJKQnVZU2QrR3ZKWm9tdXBEUURW?=
 =?utf-8?B?RE8waUIwNXZoM0FNbHFCMFdBLzNzOGU0V05FSmdaa2NrWGUwZTErRUQwdUUw?=
 =?utf-8?B?aFFtZ3FVZnd3OXE1UDI0ZDI2OXpmbTJCeVNQK0N3T0lJR2duZitQd2srbEdi?=
 =?utf-8?B?T0xZdDY3RDFTa011VWY2RVA1R2U2MkNVTEZDa1NQVzhNSlIvaUlIUUNnK0JZ?=
 =?utf-8?B?cmpIRU5uZ3REZ1p5Q0VDcmNNOUlNemRoRDNIdE9iZWFRSndTL3F3My9xQk1V?=
 =?utf-8?B?ZjdiQ1dnVG5jVllUVWRQSFE3YktLeWxvdXJlM0o3NktVL2hRRVZiU3l5d2lL?=
 =?utf-8?B?ZklIVUplU0RmcWFISVR6Y1pjdlBINmNFL3llcFg3QUVCN0tXeXhsQ0VSY1BE?=
 =?utf-8?B?UWVmNU5hcXR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGRkMm45VFhhSGFSRm1nWlA3TkxYQTk2NmttbG1GVGg1Um1mNVdtdHV6aFRt?=
 =?utf-8?B?WERVZDFSVHBRbFpKN3FOdUlPVnlKK0lPazJMVWsyQWVTcUNXTDJKdk5sWFhi?=
 =?utf-8?B?b044aG5YMHBhcDNyNTJnUFllbnFFM3dDQVZqTEE3UnhUWG1vVmJ3RFViQUEy?=
 =?utf-8?B?R3VHQkNMOE1QbTZ6d3Zuc0I3OEpFWkhxaFV6YUNNZFpuclQ2ZERyQUtuZEVt?=
 =?utf-8?B?Zk13Nk41TDFxa0NDY0dCdWJrZWRUTDlBc0xyUDNyRHJwKyttWE5pZ3IrVk12?=
 =?utf-8?B?eCswZU93cUZDdE1IcXlYNjlETHpMV1JEcU9lMit0Zlo1RDR1Smk5UDNoVHNN?=
 =?utf-8?B?UFVLbzNnazREYWRUUXVYdFljalQ1OCt0c3o1WlBVQ2J0NTJKVWNMOGRtQUJX?=
 =?utf-8?B?RUM3SUVQR1BLMWN2d0hYc3htNFdYY3pUNXJmWFMyQ2FEb0hnWW5FelRtMkR0?=
 =?utf-8?B?MGtoV1dJVGtUUklDZWtjNHh4MWMxRlNlaHU0MXBBVUhTVFpVZmdnSDA2RW5t?=
 =?utf-8?B?ejNxMWxPck00LzZsTllpUjZtYWlCR3Y1TzNHSlpFR3A1UmVyRTFhOUpCMFNn?=
 =?utf-8?B?QXVOUlFadnlwMHcyU0F6WWFxbWRBdlU4c3FJMGp2dDhmVnBSWERCUkxub2Yx?=
 =?utf-8?B?dFZGMHJFY2JHRElpT1hXNDF2eUphT2R6eE1neHI4ZDVLOFN0ZTc1SFJ6aEU3?=
 =?utf-8?B?aStEa051OC9QeUVDSFNqV0VqMDFncTRMUGRNZEtiRnBaT3ZNRVlOV29Xekor?=
 =?utf-8?B?NHhOeHBVaFJGMEFQdU9JVEtBaVNaY0I4SWt3SUFSYmF6MlF5Y01UbTVjRlBw?=
 =?utf-8?B?UUE5SkhLc3FoNXY4emZlQmtUQ3psNThqazl6THI4T3BZblBBdXl5TFYydlNI?=
 =?utf-8?B?bk0wZ3QxYzNiVnNzcTlSTHYvNlNMVVh4YzhXbmttNXBJOTV4Y2VYNWdMZU5K?=
 =?utf-8?B?N29KV0dNa3BvZk9ldUQxczhwUTAwdDVmQ3JTdlVWeU5CUHAwTC9GVGxtYUYy?=
 =?utf-8?B?RWdmcnhiSFJzOUtMRVdmU3BFTTUvVUFvclZvT09RMzdrL3htbERBTGZWSmJn?=
 =?utf-8?B?SXNiZklYSndGV1c1M1BIeG5KQWdia3lkNXBBNEQrNlc1OENVNUZ3VTY5dGJw?=
 =?utf-8?B?ZVNGTUFRV01LQXRVcXF5WW1GdU5sYnpJUjBMVkJ5VjhpVCswMmN4YVhoWm1l?=
 =?utf-8?B?MmM4aXV6ZFhDQWV4a09qQzFDT25zT0kzd0x4SFlvTFBxT3lsdEhrOVI1b3Jh?=
 =?utf-8?B?SUh6bEprbjQxM2ozSGhmeTNGYTYxRWhaWis4L04zZGJqTmFDK01KaFFsMm5i?=
 =?utf-8?B?SEMvU3BWMVREdjFCMWFvb09zT3lqYjM3Y09KaXVvT1JUbEc3MzBEOEhzODRZ?=
 =?utf-8?B?aXltdndhVHRqUGN2VDg0MDRCdFJvRVJYbmJYYUFEU21kMVVRTzBQaXBITGQ3?=
 =?utf-8?B?QjQzNnRXeHpGZUVJM1VoYzBNTGVNV2FLZFhmaHRVaUVSWjBreU1HUkxMVHE4?=
 =?utf-8?B?Z3FUVmFFUyt5dGFYU2lLdllSRG5BV09wWWpvcmcwZkw1Qm8wRGVCWmNMMUY5?=
 =?utf-8?B?bktlRTdrV0lPU1FiOFhpQjhxZERmNXhmdC95a1UyeEdwbEFHSnFmMzdwVzJH?=
 =?utf-8?B?TnJkVmt1K3lPdFM4eC82eGFGZDVKWGZXaTVYWGROdHZTREhTQm5lN3l5clFN?=
 =?utf-8?B?MHpveU1kQTdiMGtSSmFtWlhEOHVKa0dFMDl0aWRFWE1JNnNFQ05HeFArcVZY?=
 =?utf-8?B?bFVJSFpMN01HSGVyRGZ1YzJsZDRvSGlNUGthSVQwSWNwcXo0VFlOU2NCTUtC?=
 =?utf-8?B?RUU5RlFQb2FIY3pEcTE2YzBQa3ZQM2FNWFRQbm0wV3JZR1FqbVh1MlIzZEhs?=
 =?utf-8?B?VDhJTHFRU1JBbjk1dVg0V25VQjVQam1FMUFoSWJ3bjZ4R2FZUmRib3pBajNF?=
 =?utf-8?B?VjhkRml1KzE5ZGcxQ2E0N3VCcWJ2Znpkc1hoSFpzKzJJcHAwb2pxRGpCYlQ3?=
 =?utf-8?B?Ri9jVkpyUGp6aEZMTENMOXIrdGZtRStCbEJYdWltK1FTNHIvWG45YllnaU56?=
 =?utf-8?B?RjlEcDk2dXFBWmlkU0tkR0tFTncrdlRoZjdFZjFraWkrNEJQeG1aS2txVUpw?=
 =?utf-8?B?UmlPdmdmNEtDVUNaTkVPWFhQRFQwRGQ5OHlIa2pVejFOWlJDcFFsWWIybzBX?=
 =?utf-8?Q?P6j5oJhPMD2SDmB8ZOMd7y80sfNKQ7mJnyfuQak4yB8T?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe57019f-2e3d-432a-fd5c-08dd88afffef
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:59:25.2153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9orbKo/ShbY5BZmAHer8Y/eivcrXEotstBwggmMNGujPXszp+c1OC/J+DQH0f3HRtSOytkm7r5vrR970X3RAQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442
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

Upon reset, the GPU executes the GFW_BOOT firmware in order to
initialize its base parameters such as clocks. The driver must ensure
that this step is completed before using the hardware.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/devinit.rs   | 43 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/driver.rs    |  2 +-
 drivers/gpu/nova-core/gpu.rs       |  5 +++++
 drivers/gpu/nova-core/nova_core.rs |  1 +
 drivers/gpu/nova-core/regs.rs      | 11 ++++++++++
 5 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/devinit.rs b/drivers/gpu/nova-core/devinit.rs
new file mode 100644
index 0000000000000000000000000000000000000000..31a313a0652cfb16c490a346d06c47ca5b0edde9
--- /dev/null
+++ b/drivers/gpu/nova-core/devinit.rs
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Methods for device initialization.
+
+use kernel::bindings;
+use kernel::devres::Devres;
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::regs;
+
+/// Wait for devinit FW completion.
+///
+/// Upon reset, the GPU runs some firmware code to setup its core parameters. Most of the GPU is
+/// considered unusable until this step is completed, so it must be waited on very early during
+/// driver initialization.
+pub(crate) fn wait_gfw_boot_completion(bar: &Devres<Bar0>) -> Result<()> {
+    let mut timeout = 2000;
+
+    loop {
+        let gfw_booted =
+            with_bar!(
+                bar,
+                |b| regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK::read(b)
+                    .read_protection_level0()
+                    && (regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05::read(b).value() & 0xff) == 0xff
+            )?;
+
+        if gfw_booted {
+            return Ok(());
+        }
+
+        if timeout == 0 {
+            return Err(ETIMEDOUT);
+        }
+        timeout -= 1;
+
+        // TODO: use `read_poll_timeout` once it is available.
+        // (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
+        // SAFETY: msleep should be safe to call with any parameter.
+        unsafe { bindings::msleep(2) };
+    }
+}
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index a08fb6599267a960f0e07b6efd0e3b6cdc296aa4..752ba4b0fcfe8d835d366570bb2f807840a196da 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -10,7 +10,7 @@ pub(crate) struct NovaCore {
     pub(crate) gpu: Gpu,
 }
 
-const BAR0_SIZE: usize = 8;
+const BAR0_SIZE: usize = 0x1000000;
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index b1ee465de907432325c4d0e0dead3a52e81ed067..ac246d08141e95927a25cada4ecb7e23156ac6b4 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -2,6 +2,7 @@
 
 use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
 
+use crate::devinit;
 use crate::driver::Bar0;
 use crate::firmware::Firmware;
 use crate::regs;
@@ -181,6 +182,10 @@ pub(crate) fn new(
             spec.revision
         );
 
+        // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
+        devinit::wait_gfw_boot_completion(&bar)
+            .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
+
         Ok(pin_init!(Self { spec, bar, fw }))
     }
 }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 0eecd612e34efc046dad852e6239de6ffa5fdd62..878161e060f54da7738c656f6098936a62dcaa93 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -20,6 +20,7 @@ macro_rules! with_bar {
     }
 }
 
+mod devinit;
 mod driver;
 mod firmware;
 mod gpu;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index bfb9555b203ff880c0fc373bb22e5ce6048015d4..401d885539cee03cbe732102f5e2233785a7b284 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -38,3 +38,14 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
             .and_then(Chipset::try_from)
     }
 }
+
+/* PGC6 */
+
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {
+    0:0     read_protection_level0 as bool;
+});
+
+// TODO: This is an array of registers.
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234 {
+    31:0    value as u32;
+});

-- 
2.49.0

