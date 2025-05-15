Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5617AB8053
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 10:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B268B10E7B8;
	Thu, 15 May 2025 08:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XRA7ZK7Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2048.outbound.protection.outlook.com [40.107.101.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857BF10E7B7;
 Thu, 15 May 2025 08:23:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6eSh0M4nIcZ40Uu4Ti6HRaoFybj5moTukgCdgf3QZQ2woWOQ/0V9ZBEwoBfffdybJpB2zwmlOVdCkF+F0vB3ojAVmtIvor8iOUFClcy+KQfZIPr16VQ+xlst/GQlqwWrFeEjYNLkEqkvDs/wBiCk9s4VusPu32Q7oIcFe2quTtVgIpAKNSexmrA5hkgTbq1h3lQ+wPVpdmHXW8pCpfG6qN2Vu81/XsnAf40QJ0Wy2gIDP/nydyiyXR+EVsgml6EvGEuM946yqrNGyxGvkU70XlLX2jN+/fOM8UEmpdWUyN92Kd9wK+r4O1L4gzs14mzm8571CijHYs3SJ23myKIdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hqm8Uo2+nnWKSAmc5KwSdHRgMvwpkQlxV4fxUGWsDb4=;
 b=YQQTj5y0sAexe0j5Pt4Px9q5Hme6xiiY8P+D1SrTNetPl8gdetuuPh0byR3dsCeMYD4A2Bhx9ivVdpolTFJCDwuqG1yLsM+mpICo9zMYX29twoXwz/YMI7Fxh/mf7/ppN4No22oYhZCeNO8lZjqLbQkhmAuAmG71hnCh9fNLZQrn+qKBR2OddML8fdc4fMZpfGSaDl4vLZuNE2/agMcOCDjh2kpSbZxR3l0xCQRuyhod0WpA6A7Mcfhfh1RYOF34cJvG5EpfPICKndpAz86ojAG6pozLU6Z2CBq1YcSp5Bkp3xUPBgxSnAmT5U19IlkYiTwQT1WhV8izenwhjTMTDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hqm8Uo2+nnWKSAmc5KwSdHRgMvwpkQlxV4fxUGWsDb4=;
 b=XRA7ZK7YUxpzkEWN6s7TXXDH6hUrHJIyCEAU1nyYFjHESNorfZh+mm7kYFd/LjAVt8WGU59atfBBZCiQsxCrgPcuSfJKkcUhFDrnEnaJaIW8RpMJl0GMp+sV0jnnVpQKZ9NfV0X+3OIaqJHcH/6yIpOkM6VnnAiSkmvXFLxR0OhY6n3OrdXVquglGfC43bJ8xvsFkkli8cHNi8Cr9u7qiw6Z4n0xP9gI0YjAKwBmNk63BEuLmj179CAc981U6XqV4EVedXuNlmdQZN+6GJDv4Tdpzvz59usGecFjkL9XnyW/NTqbFx5IDBDFEJBuEeKDNcXJrJ56HKhZkDE8oV1xkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8962.namprd12.prod.outlook.com (2603:10b6:930:c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 08:23:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 08:23:33 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 15 May 2025 17:23:19 +0900
Subject: [PATCH v2 2/3] gpu: nova-core: select AUXILIARY_BUS instead of
 depending on it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-aux_bus-v2-2-47c70f96ae9b@nvidia.com>
References: <20250515-aux_bus-v2-0-47c70f96ae9b@nvidia.com>
In-Reply-To: <20250515-aux_bus-v2-0-47c70f96ae9b@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYXPR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:403:a::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: f3fdfe4d-d8a4-4181-3200-08dd9389c80b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDJlaXhEcnl4WnN1UFMwYlNWK1ZjSGU0UVZzcUd6V1NzMzBSbVFNSzJWNWo0?=
 =?utf-8?B?UnZGK2Z6VlcxYzQ3VjlmL0dkMCtHS1k4dHdWVWJyY1U4MEhZckI2dllzMnFR?=
 =?utf-8?B?NXZaWEdjc2pDWE9iZ0EzQ2ZsUVlaTmNHQi83Ukc2cytSbG5kVTlaaTlpSnVE?=
 =?utf-8?B?cE50cm9DRHJJVXVjelZTb0pHWVFOV3hGSlVqYWZxVnVWWmFIUnJueTh6UTJG?=
 =?utf-8?B?V2oyNkl0UE5HQzJKNjRjRUlDSE9MdW1xOWpxa2RYRko1WHZjWTVScENnUTJ4?=
 =?utf-8?B?NE5oZ1VYNEhsdFFtOHozRmNtTHFXOHBnd3RPS2NqcTlMc1RKY1RXb3lHeGZa?=
 =?utf-8?B?RnRXMkg3b2FPc2ZkNGFmSXNkYXgzOFJLa2FNOEZ0TnNrSHBBSWNmbDRNZm5R?=
 =?utf-8?B?WjRGUmwram5Da2xNK2xMZlhjdjJZVUptNmM5emgyOHVuZ1pKd1FKbnFrSXBl?=
 =?utf-8?B?M09mTE5JZUlIL2c3VXpONWdtQ3hQSURFOG0rQ3BnZysvTW93dDd0NUdHc1lj?=
 =?utf-8?B?WG95Y0lMdUt0MnFiTFFZNHNpcjM1Z2JlL0NHYllaaVBmTll5d3N2SmN4YTFU?=
 =?utf-8?B?SWtXNkN2cHg4QXZDcVFZTWtLOE9pejZCMHRwUEwzRm5qMVJIdml6QmhUT2VR?=
 =?utf-8?B?ZCtEWjFSZVQrRWhYMkhxWGdEeFFBYU5QTmo5UXI1U2ZvWDR6WG5hbFEzck1O?=
 =?utf-8?B?QWgrQksvK0Ztd0JRUlNNaG9RZm9sMzNpamowa0h4MnA5TndoWE0wLzNZemIr?=
 =?utf-8?B?SFp5UEc3U0RtcGoveUptbXJsMUdMWVppM2lidVM4UGpQK05DSGJncmVoUDZy?=
 =?utf-8?B?RFYwakFJdnJvQWIvQUh1YmlPazNvdkZuNVdKalNUOUNzZ2xDRjRnWU04YkJF?=
 =?utf-8?B?bEtqQjlSRmlyMWl5cU9vRHJxMm9WRUI2b2t5OTAwTXZEeDhaSXFxMnFwVUpY?=
 =?utf-8?B?RFVXN0pQN3h6aFdmYzMwTzM2M25nTTBNcVNGd3ozbitrZm9OQSt6clFQenpF?=
 =?utf-8?B?QlVYZk5yM2FhOW5QdVJkSU02Y2E3ZUZtMmhwUUlmWThQOXV4WXVCMHY3WnhK?=
 =?utf-8?B?aXNmcW1UWjFzYW1MWVFpaC9GTEdhRUdQZVM3S0MrTTlwRFo4OEloZEFGVlhn?=
 =?utf-8?B?N3JzRjdIeU1YOU1pdmpPbTBqNHM0M1NQWWkvR2V6c2phMWwyMFA1T3BqbytF?=
 =?utf-8?B?aTV0LzExamcxeWF4RXNxcDcyK1NaYkJHWmxhK0dBelpFZzgvb1J0cVZTd0J2?=
 =?utf-8?B?VFRuYUwzZHRkUXdtMzY4dHU3Vk1FL3hJWlBUbllMRTBKQ1E0d2Mvb2hLN2lY?=
 =?utf-8?B?MW1ubndHaU5kR3NCL1VZV2gzZlg4T2diaUJtaWtOV1J0THdZLytKMSsrR0Mv?=
 =?utf-8?B?SUdlSUg0Vy9lcENJL2RRQWJVZ3BOUks0bkhUZFYvNjBPV3ZxV3ZQbUZOT0J3?=
 =?utf-8?B?RVJFRVA5U25vaVhlQ0dFb2dZeXVEaVhnVTM4K3VyVFBVeTlTNmxwT2RJVGNN?=
 =?utf-8?B?dkZKN2h2NklFKyt4d0hub1dPQ2xWK0JXaWxxVHZNQ0h1cWdVenUxRUtoRlpI?=
 =?utf-8?B?ZnNnSTQyLzJyY3ZCbGdxaDVNckpzdnJpRVA5bkRNeSt4aWZhejhybUtxSnEv?=
 =?utf-8?B?RjdjWWV5ZkwwSVFHQ1lERmpDbWdHRU9JY1A4YkN1UlhzRUtZSndCRS9MZysw?=
 =?utf-8?B?UUlnaUtpNWdsSWdNOERPb3lDUkpiRXF4MjlwYXRPTGtxMmZXTVppU0lKTnlF?=
 =?utf-8?B?SDVaQ2VjSDZBRzJYTHUzd2lZWm4zdlN6R2FFN2g5V1hjUnBZVVFmMGd1UDVn?=
 =?utf-8?B?ZVpnZVBNUU9RRlpsamJGZXJJYlI3ZnJTUEFoMmR2L3lqdUJ0SmdFbHI5ZHd4?=
 =?utf-8?B?Mkx4NEVSaCt4TEVBVkk5RmF0b0RJU2FEbDB6UEs4L0dpMG1zNkVCRXh1Q2dl?=
 =?utf-8?B?UWtVRnJyeS8yeEJUekxqMHF3SHplamFZTVhGNXl2VWtkVTlZTmlYQyt3U2Er?=
 =?utf-8?B?dTNYQWN5VkxBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QSt2ZURyTHZCZ2dSTnhzcEFqUjkwZ0hOeWJiUTZqMktRLzFyOHFlT2p1M2Ri?=
 =?utf-8?B?VFpCb1NiWHc5bEI1SVFsZDF6RlRWVUxXRTRwTnBleTV2Rmd1TGtRQnBkaktt?=
 =?utf-8?B?YnZ3c2cyaStnR2wvUzkza3QyUE9VSDJlb08vd3h1ZEw1M2RkSVM0OTM4eEZj?=
 =?utf-8?B?NCtzd09yaUQyWnRLSEV4aytNU0ViVVR1NTJvTlRtd0VqRHpFQTJRcGJ3OFl4?=
 =?utf-8?B?aHVwb2wzREZpb3dxdmJRZHE3T1RBZ1NXRVdaVHVGREN0TVRYTFNKVi9UWmtM?=
 =?utf-8?B?ZG8zVGVOSkhjL1AzRTh5SitpWmY3bEdldlNuZGc5SVVQQjVJVVQ2TmZBYmx5?=
 =?utf-8?B?ci8xdWw5bHBpTzFRQUxzeWhDa1FyZ2lwbGxaVTFSbnpCSFhoY2JRcTdaeWRa?=
 =?utf-8?B?UVlVbGovMVBMZkROVUlFTU04TE9YWTNBeVFqc2ZXcytUNGlhQ2VGaGZqYjFi?=
 =?utf-8?B?cmRRZ2phMWxIdW53aW5GZFIvekJOWkd6ZUNEYmJibHRQRDU3MXVkQ3dRZGZn?=
 =?utf-8?B?VmdFS0dTZWlPRlF0MTJyMS91b3lNbHRScFFKK2JSb1pXZHBaZkJVNFRoWTBR?=
 =?utf-8?B?cmQxM2lxUFdXQWZvZDBGRVkyVFp6ZWpiWXBINnRkbDRDZklQU25ocEd6bEVM?=
 =?utf-8?B?cjliSE9oUVpoSFRxc0grQmRDL3k4eEZOd1F3YWpublFpNis0WUwweU92R1dG?=
 =?utf-8?B?UVNmT0RUTkUyNVVoTE12UFFuYnFtRGxyQW95SE5hL056YVBWYnBtK3pyc3dU?=
 =?utf-8?B?TVBrenJTeHJvankwN0tMZmJ6UVkxY3hhOCtNd3ZWNDVxQ2VYLzB3MXpNTjQv?=
 =?utf-8?B?dHR3YzdDSDlXZDAzVlpUejNMUmN3OWRRNmk5c2t0RUhOdFZSdXJxTmdnbkN3?=
 =?utf-8?B?K3ZvTmowZmlpS2RBcFZNQjZqa0M2eFdOdm9YblpaME1obW5mUTFKem52SGlv?=
 =?utf-8?B?WHdybTM3WHhLQ2lBNkN3UnBrSlBDNGFJdm1zTEtQTkpNNFlzZmlrMUQ4UEdN?=
 =?utf-8?B?YmhiOWprWWJrNnRTcE1yWEdUbWxCZkJyV0g2ZWlremRpR0VWeElSdUg3ZHIw?=
 =?utf-8?B?bERBdko5VVZtQXpoaUFhSWdSbUYwRUZaV1NFN3Q2dkVTOVhFRGxpR2dyUUd5?=
 =?utf-8?B?anBSSzRkTS92NlcxUXM3RUFUYktaS05nYTgzdllkditzZU1wbDF0MlBkNzV3?=
 =?utf-8?B?TUFiSktUZ2tTbll5N2o0Z3hGbVNCeCtQQlNOVDZZaTF1bnRIaXUyYXF5VHBi?=
 =?utf-8?B?RzFEMnhrZjB0SHJXK2FYSWFKdkpyd2FWb3Rwc251TXBiMG9LbEJiQzNkRzQ0?=
 =?utf-8?B?WFdtOUhkeEk0dDl5QXV3M0NTMTV0MTNPY21UdlhnRHoza0JRTkg5R1FZb1F3?=
 =?utf-8?B?b015MG02YWNxRnluYTNrc2VhRVBVclJZWkdLUFlaMEZHN3ZOYUw2REFyREZK?=
 =?utf-8?B?TFdZM3BIZzloVWtudnoxdmEvNWdORm1kbHJKSG42RGhod2U2dUpDd2FhYTlh?=
 =?utf-8?B?VlY5dGFBK3J3RmlQZGNoamljQTByMEVtWDQvRGpJdWE2Nk1EQjJnRVhCazZW?=
 =?utf-8?B?S3JhcG5XWFhmdzY0UUYvOThOQ3FWeUJTdEwzQmFzd01UUTZ0eDBUditIZkl5?=
 =?utf-8?B?VVJJSFFGQ3NxMHdUV2dRREEyRTNsOVIzVHZKREtmY1l4RVpObVNEU0l3RzF5?=
 =?utf-8?B?QmVBS3gzcHYvL2IySk9GMXZ4cUZxRlFTTW03VlB2ZGNCN0hhejl4K1RMZGp3?=
 =?utf-8?B?aEozRlpSYUdkV0szdE0wM0VKWFNTVnovb1Rra2xEL2E4S2lTRXp3UDgyOEZS?=
 =?utf-8?B?K1JSWENSN0tOVHU1WTlubGpEaGc0WkptaDlCS28yeWFLaVArbG1vVnFnbjVq?=
 =?utf-8?B?VFdNdEFyWWh0clBTZ0x5K2lsYUJwK1UwaDZLR0l1NHlxSzJYYVhTYzF2MDRu?=
 =?utf-8?B?US9JdDR5emRwdVF3c242cG1kbDk3RDhEcXJ3WVh3Q0hZWERzK1h3WG9uZEtX?=
 =?utf-8?B?WEJKNWtIMXFLaE8xNXN1akZpRUdrRHh3VVBXbkVhRmt5MUJXM0lTaU0ydjdF?=
 =?utf-8?B?OS8wbi9Mb1FHT3RaWnJWNS8ydk5iY3lyKzlwWUVzOXkxb0F5eFJNcnFPZnk5?=
 =?utf-8?B?NTdRNU9QbEdDc3BmRWV2Y3ViVzRRNS9JdlRob1F0N0ZKK0pOdWVNVDFSMlZz?=
 =?utf-8?Q?XCO/9fVOwssX4FNfZruhsCyCzEgvk95z2pmOdSEJmKAL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fdfe4d-d8a4-4181-3200-08dd9389c80b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 08:23:33.3615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VrJrP6d5lbjwNVEChTcjsje+/UfdHDwofgPDIRgCS6vMyM5WIEO3zaVTrEm3T7UD5TW7B5BaPCXhGp4eAPvx3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8962
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

CONFIG_AUXILIARY_BUS cannot be enabled explicitly, and unless we select
it we have no way to include it (and thus to enable NOVA_CORE) unless
another driver happens to do it for us.

Fixes: e041d81a0377 ("gpu: nova-core: register auxiliary device for nova-drm")
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 67f99b6a023a5706bc809de18f9142938d1d0cd8..8726d80d6ba4013d84d0e6194ccaa9b41a6e4af1 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -1,9 +1,9 @@
 config NOVA_CORE
 	tristate "Nova Core GPU driver"
-	depends on AUXILIARY_BUS
 	depends on PCI
 	depends on RUST
 	depends on RUST_FW_LOADER_ABSTRACTIONS
+	select AUXILIARY_BUS
 	default n
 	help
 	  Choose this if you want to build the Nova Core driver for Nvidia

-- 
2.49.0

