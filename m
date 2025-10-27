Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06073C0DB44
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D2A10E00C;
	Mon, 27 Oct 2025 12:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KtCQ4afJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB50A10E47A;
 Mon, 27 Oct 2025 12:55:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXVPVVX7XWyGiuurxnGPa3joVOPkFlkCCgdK2PHRUPlmbEmp6KiLetuE7IIAa2+8z/Y6Ra/SJ1pZdRLdo0pk8PpO06J7mG/+a3RHLayqpaX9VUXoPvYXngM9AERDo7vUlGAlWym2NdhoCK0hMoq0vDl8ibWCip4XzGX9p0q6KAlouEawnh3vJvMeY6MrenH2DYDNhJJmR9S5+Uqjg87BqlcCEEcAQsKMg8Jw9IsKcdRT5yriHHyZ5Y4rS/p2cjsEaEOwAaJr/JKtjRjqQa26BedR8LE5+/P32N/vREGCKe+DCWI/I7Qzjx9G3FSR4i5yBVIrlJPSJ5wSh5sPDo7RGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6fCzqjMaUDqy2tko7mnL4hTaUlULEKaoR22YFBpXjA=;
 b=qii6WTQTp/3txXqNx7W8kkKpJtFAuVMBRPWsCWGSDqQW4Nlj1AAtRei3gos86cNumuaVOlgFE0hhHP5j7XkRilZnJr/o00ytaOxk7ImQ4WD0T0ksv3jm4pGkFI+WTT+cwQwAC3OKsoxZvXCAoSZB+UbR2VEG7so3WT/sUtMp0+ePUcCG4LEShOXVdW+1KG+b9kAMeKhIr8R2xbW9JX9ei+5IZdkHIer7o5Q3CyyeqbVIGZJCLMwdNoXfFbhYhuDkwRIWt3Y9xK64tEsgISM+RCmiKVzgZ5lDR35MnZVU9j8S4rem0Tx/ti5dbWvR2IpXxp5WJlIUf60g6vdeFGsSCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6fCzqjMaUDqy2tko7mnL4hTaUlULEKaoR22YFBpXjA=;
 b=KtCQ4afJ0XE3SXA9uIT/LtJ476n49QPxgQAD0fI9vl+xaER1OJ47NhrjMk2Fc7M9qKmJkXuDO6ExUL2FRGaBRKdIhv/ONrZ1RcIGfFzZ+mmSIpyzkdJwgI8eW1v390ljinSORcLhKF6jO+3hR/xK5HmSifqHiqOMMFd2B/mc1XPvvTczKCa8x3KRFHKtlByHXKqJKPxoA0JYqI9WyRoSVP2wi6LMuMVXNbtLGNeYW4Wi3IdsxwvNAHZ38cz4kZXkLUlt7oT3HFtFDe69tYXj6Lsw0u3d0YSYH2/lYPcPPdJC4ZNSPZDfkN+3VhgL125ALJAjDjyBQoVykNoklxVchg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 12:54:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 12:54:58 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 27 Oct 2025 21:54:43 +0900
Subject: [PATCH v2 3/7] gpu: nova-core: vbios: add conversion to u8 for
 BiosImageType
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-nova-as-v2-3-a26bd1d067a4@nvidia.com>
References: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
In-Reply-To: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
To: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0198.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d1a9aa6-aeb7-4e52-198c-08de1558089e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUU5WDRPOVZPQm1BTU8xdEFRZnVOLzBSSjRQMmVlL3NVaDV3UVBoWGhzUENm?=
 =?utf-8?B?UkNLOVQxSzN1ck9uUGVodk5ia2tvVlhEWVYyVjVrb252SExsenhVT3IwMHJD?=
 =?utf-8?B?YVdWVm5KanRwZUFZM1J2Tk1BeVdaZkZra1NKUUp3UlRjQ3Z1YWxGbkxpd00w?=
 =?utf-8?B?QmVrRGNkV2NCSjhYS2MwbXo3bnZmZEtUUCtIRE9GcXhyU3pZWmhya1F1MDhF?=
 =?utf-8?B?d0JVOFVsd2xnV3dlUzVwUnYrdEZWMVUvWVlwVC94aW5LUXQwdVVYTDIzcHhw?=
 =?utf-8?B?ZXU4RU9RSnAzSElmL3FZWHlDTHZPbHZQV2FJcWpjbEd2UE5pcjgrTGgyQXJC?=
 =?utf-8?B?ZWxxcWlVdVhlcXR4VWJIQ0RoQVNxaUFRVDluZi9ObXZLdlRvWlV0b1FsQS9K?=
 =?utf-8?B?WjFWN3lsdmp0OVZBU3dBUk1lbThHSGJIcDd1QzUxQnBsNDdKL0VQVlFWZVZn?=
 =?utf-8?B?YVJHS3o1RFZKaXJRSUJEcnA4K2tmNkh4N290SFNDWTdrbXVUbG8zUFBlMDF6?=
 =?utf-8?B?WG9mSkVVR0hYMnhuWVFiZGxkdndOWk9HS0R1K29xNmRQMzNOVXkrcXpkVUMw?=
 =?utf-8?B?ejlPb1NQNGhZcTVUaGJSSTN1eXUyaFdYOUQySHZzS2ZBVGptS1J6K3lvdlhF?=
 =?utf-8?B?dGtrNGZxMUd0aDEwT2gzWUFKME40alBlMkxnbzk3TnlmZmVTSXA4Rzd6TVdE?=
 =?utf-8?B?MlJtWk9mbElLc3M5bVVQcDJQd1FrZFhveDUzb0VYbk9RY1NHVW9OS2duOEFq?=
 =?utf-8?B?WFBORTVnVUFZMkFvNXQ4Mm9iQ1ROWmdKeDNzOVpjUmJhbzNDSEt4QnRZN0pD?=
 =?utf-8?B?NlRUTUMxMys3VUw0bWVKdXZIdkZMMkFIdVFETWZvbzFzbG16VUJtSnRwQWN6?=
 =?utf-8?B?NU9iSlFZdmtTUjVhUzEyc1hLSmhEdTlaM3hCdWhOM1U1d0JVeGZnZkxkZGNy?=
 =?utf-8?B?N3JleCt2M0JpajY2bVZBbGFydXBlRWk2S0FSWDlXUjN0ZjUrNnBubzAweWFT?=
 =?utf-8?B?bVpveDd4N0h4ZWVudWlXQTJGRDZvSlI1MGZrYVpoWkh0ajZPTzkwS0cyMDhn?=
 =?utf-8?B?Y2RxM1JzYzRzUlV5dllvUmRYSDRYYSt5dURraVZFa3YyTitKVWhHMHRaZ3dr?=
 =?utf-8?B?UEZ5ZVhubzE2WXBpL01GTVd3UGIvWG10d0FkZ25nNG05K1lVamE2TlBGNjlh?=
 =?utf-8?B?WjFBbSt3RGppdFhCd3JqVnpac0xBQ1RBUlRBa3JLUVJRRGVRbVdjUHluVy9s?=
 =?utf-8?B?cW9HY2xSSmlLMytkdDNVbVZ2YU94NTl4dHdFVnVQSFVvVnBVZFRkTUhtcWNU?=
 =?utf-8?B?RHZPQ0YvbkZxeFNub0l1bW84VGhnV3VkQ2xmemVtUDZTRU1XWEFDdE0wend5?=
 =?utf-8?B?RlZsdlRUYzJJZDhmLzlkZFN0ejl3NEdGbGkvQ2NUYkNudGl3YTB6Q2hReXVX?=
 =?utf-8?B?WmM4OEg3TWZJRjc1QlA1OUJlN29reldRaVlnQmVOUFREa3NaTFAzYTFkOVcw?=
 =?utf-8?B?M3EySS8ycXAwamhOemxEVjJ4d3RFUkgxMlJtTlU5WEYzRHVWSFcwOU10UHcz?=
 =?utf-8?B?RmI5Q0FtUUpzWGw3UkE5c0YyT2NuNkJVWE01ZlNPY2FrVTUzdTltOE5waHJK?=
 =?utf-8?B?UEI5SzZhVkhleGlCaXA3VlpiRlJ3NEg5U3poNmlrdElRNWJtbjV1Uy9hamxY?=
 =?utf-8?B?U21EY0xEbnJsOGkxZStLWmZEV0Q1cXZQSFFTMWJabUxGd1FnY1ZocTl6K2NK?=
 =?utf-8?B?djVibnZzTm1NcUNoR3N6U3o2WmVsTUNXM1BEVjdHR2tQYm0rNk5iNG1lL3Vq?=
 =?utf-8?B?eTVQZ1Q3NjlxeTFNTTZvQndOWm04UGRJaUtXWENWemZQTzQ1a0o4Rml4N0Zn?=
 =?utf-8?B?Wjh2cGVKTTRxUy9aYi9sc1pDRUZPVmZGSm9mL2xOaVFYeWNCQ1lua1dZMmRq?=
 =?utf-8?B?KysyQkU2TTNUR0hrWjRlNlBwZHB6UmRVTDhWcUZvZVV1VGhYYVFTd0tyOVB2?=
 =?utf-8?Q?3+a/jV3AD+bp/PBM10X32oHhlUGaHY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkIwbFV4eTRLcDg0amFLTUxwenpjNUJ1ZEEzNDNaTEJOSDBVNVNTNU9MMzlY?=
 =?utf-8?B?RkhnTkRnN2ZiSG8rSXNuRys5WjNXcFdzaUpkNTFzS2I2MURvZ0NGcXk4ajJr?=
 =?utf-8?B?TWZZYi8wWVdpSG9OeUxhWDFKbVg5dVhodUV6Ni82VFN2SzlnQlNadHZ6d0gz?=
 =?utf-8?B?eU5ZOXU1V09NdzVlK09xa3kycmdzblp3VW1VZ2U5KzR6YndiSlV5RFdKUzdE?=
 =?utf-8?B?bTFIMHduNDZlY2RXWnpSaGN2WjF3VEgvUzVTd3IwUVE5SWhjUmRKL0RxRHBz?=
 =?utf-8?B?OFpPcVV4WFltK0RRSmljYUVBV1FxZGVtYVMvbkdoUmxmUHFwejJBYlFSYVRl?=
 =?utf-8?B?d3ZDSUxKc29qQ0dVSUxzeUoyK1B2RW9IRzYrT295d08ybW5OTUl5cWRWOG5n?=
 =?utf-8?B?TEExOFluMXc1cWhqMkpjTjhFTnQvMVdRaFZheUNwRHFSSjVoWE1ldC9pZjlH?=
 =?utf-8?B?dkxXTndpOXpGeG9BZzVlUFZOekoxR3lON3VteXZaYTFyejAvOVkvN0RHWjJX?=
 =?utf-8?B?NkVmUDRxVVc4OUtibWw4VWtaMENaYUFjL2o3UUNZUXIwdWZvakhZajVRYVRk?=
 =?utf-8?B?elN3b29vak1HN3k4N2FxTyttNU85bDArRmxvbE1UUUNkVFV2K1pkaStuUUFZ?=
 =?utf-8?B?aEJXSTlFc01OaEFwREhpUEhPZWkwNUx5Q2hNSXF6TFZMUktBY3FvaW1TTURj?=
 =?utf-8?B?dEttblJRa3pDdDRXNVl5RzVMWDRvaktVd2xnenhqNjZYTnBQeDNmMXJBUUM2?=
 =?utf-8?B?dWw1TURHTUJuZmlNdjF1cjdZWmJ2TDI1SUtRL2VITXFta3A4cjJvblRRakNJ?=
 =?utf-8?B?eFVHd2xHeldoR3FXanlPOE9EdWkySjAvZnhZOFVheTFQNDd0eE1acGljWFJS?=
 =?utf-8?B?SzFoeFZ4MkltOUpEK095aHlQR3dFQlpqTDNxRTdQQ09zVitRVGl5RE5oRlF0?=
 =?utf-8?B?a2RQVHdTdm5TY0NTQjZkSy9BdDdMSUVUWmNLMnBnbUF2SjBKekhXNDdsSXUz?=
 =?utf-8?B?c25zZFdzazl6Y0lKaFdUN3paRER2V084N0dncERLVkNtcGpLTzgwZG5tMm1E?=
 =?utf-8?B?Mm4za2FHSlVwRHRqc2VncXkxOGdpSCtUbEVkV2p0bUN4QVNyY1g3dFFzSkQ5?=
 =?utf-8?B?TUtYWmZLb1hjbzlWQzRNdDhKTUhGQXNBQnhtc0QxcUlHdm9iK0N5MTNsY1pL?=
 =?utf-8?B?a256UVgzMjZ3K1I2OXpEOUZWeFh5TEx6Q0JENFFYY2RCSjVGWlpIR3B3QlNs?=
 =?utf-8?B?UUlPbWNhWnBOQmNLWWV1ZnBsdFM5UG1YejloTFhFS21xV05QRDc3WHJ2cnpl?=
 =?utf-8?B?NHMxYTZXUVVqVG1XYmdIM241VEhJVHBUOUtkVjlETldFZTl2MXQwZTlIOTQ2?=
 =?utf-8?B?aFhCK1BKa1FWRHhoT05YQUFEbEdyTUFGS0d1enBIT2JLc1FaUENZQnQxT0tC?=
 =?utf-8?B?R2tsY2ZqM1NXbWVKcE1jaFhKaG43Z1lIalY4dDc4dGx1RUwyeUw4WDQrSzQz?=
 =?utf-8?B?cFN6emRDbC9JQjVEdmtqeldKTFVHUjg1Y2prc3loYkV5VzBTUGtLam5vUCty?=
 =?utf-8?B?bGVEbW9ieFhaanlNV0g3cFJLZmRnK0dKNFlFNEJGQXp0ZTQ4TjZhZStLOUJ0?=
 =?utf-8?B?YnZ4UUk5ZklIcmlpaThwbnp5dUlFOGxCUWtidktPREM5TXBjZFNIZjhQb3l2?=
 =?utf-8?B?WFpTRlhkV2xOdVJjbE5RTkU1L3lMNWQzVUY2WW8xamljNU9YKzI2T2dqZzdm?=
 =?utf-8?B?UHQ4MEk5ZXp6Y0xqdXQ0LzByaTBYemFENG1ia01EWVFsWUtBNnpra1NCbVJT?=
 =?utf-8?B?a0k5TS9vN2dTM3Y4ZGdmUTdVbGJyV3VWY2t1NnhGekIwbk5POWZ0TEYvQ1dH?=
 =?utf-8?B?MEV0NDM0V3VpUEwyMU5QbXI0am9sNVNSbnNtMnBmYW15bVREMDdIVTNrZElC?=
 =?utf-8?B?VGN6T2RpcUpBU1JrZ3M1WE5xRDRwMDY1Tld1NVNPVmVRbVpCSkdZUDJqY3hX?=
 =?utf-8?B?U0QxNDNIWHd3TkRaY3VEVENWYlc2TCsvckZPdWhFYWd1T243S0FsZTNxUWhY?=
 =?utf-8?B?dWtwcVVBM25BWW1SUVd3ZjY1UEVOZnFDSzE1bk9RRGY1eVRiRWEwU1R5L1hO?=
 =?utf-8?B?cjZrdU9MRmhiTk14OTFBdm9ITlVtM21FNDBZTkNQZW5Wb3FqVGVNM25VdWdB?=
 =?utf-8?Q?/DWBECCeKXKb/gIZOq8JjditnsYOkYssQoiOzso+OLSG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1a9aa6-aeb7-4e52-198c-08de1558089e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 12:54:58.0427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqLytC+K90XbLZSMxRLWQo43bXG60NHng3sNhkMzxOUSgSTZ8XniY+3i3ugN3NpzgBGtHfx5SYhCZz9464LcWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863
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

Since `BiosImageType` is `repr(u8)`, if can safely be converted into a
`u8` but this is not obvious when doing this in the code.

Instead, implement `From<BiosImageType>` for `u8` so the cast can be
done in a single place, with a justifying comment.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index dbe0d6e4a015..a521c0a4df0f 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -50,6 +50,13 @@ fn try_from(code: u8) -> Result<Self> {
     }
 }
 
+impl From<BiosImageType> for u8 {
+    fn from(value: BiosImageType) -> Self {
+        // `BiosImageType` is `repr(u8)` and thus convertible without loss.
+        value as u8
+    }
+}
+
 // PMU lookup table entry types. Used to locate PMU table entries
 // in the Fwsec image, corresponding to falcon ucodes.
 #[expect(dead_code)]
@@ -711,7 +718,7 @@ fn image_type(&self) -> Result<BiosImageType> {
     fn is_last(&self) -> bool {
         // For NBSI images (type == 0x70), return true as they're
         // considered the last image
-        if self.pcir.code_type == BiosImageType::Nbsi as u8 {
+        if self.pcir.code_type == BiosImageType::Nbsi.into() {
             return true;
         }
 

-- 
2.51.0

