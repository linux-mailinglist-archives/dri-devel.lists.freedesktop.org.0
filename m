Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3E8B406E9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313F610E764;
	Tue,  2 Sep 2025 14:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ofxnf1zY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC1510E75D;
 Tue,  2 Sep 2025 14:32:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWGSc86pa4BdibtWLfFgGTuIRnWzA9B9P6m8ugvpmBy1syM9kspD3SEp0YcEEG2jZ1+UJaljKMZZwoBISZ+4EPyeKMzE2nCaAxdohUveLAUkQ6mSmryizdjNv3OWaVnSZf4SUIi5FwH0RUERrA0WYI/AGrx14nZWavBb4jt9N+GaDws3amn8ItQCalq8DuR/Z6ZCIjlyFnDoUKragbk/hlxrXm4OhlHNQFFtq9+CqcnPaS5YnLAyX0aBGm5M0rzOc2GHDKlfSGQq21zZXiTxiBasjoxW46e6jHsm/vRGvXlABoOP8mKDMZ14Apu+XO5AQu8ithgGp0/13JuhtaY3kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuEE18Bej6xBRozSvWdL8T6FwIvY/OfgcRWw6htKNrI=;
 b=hDff0pM/ZTY/g9Nz/NK8asoPFqzG7bJPTQxiYmcXiHHTvRYLiWUPEwRS1mfGUw+VzCQnZgtIr7YUOSxw1f+mg6SHMW4pGL4KWVe8tIFb9eksJZRtX3RYW+5BKuJ3zzqLHyAeUXO/czY/+MUPlqWCrbgO5dKxo1XSLq5yIJedQR9vb8+FGw+HokQYoQ45k+atsZAN+akKg0J+sd6dGfvbDlI9dcIMtdPJ9hIzktT5OX94R57tDJUy4JwhiNGhYsGA5zK8g5Hef8C8vPh0VqdnztAsSylxd88vZP/E8DWic6jw+8qJT7i+4LN9nct09K9RcwJz3tDI0gLAGL058E+LWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuEE18Bej6xBRozSvWdL8T6FwIvY/OfgcRWw6htKNrI=;
 b=Ofxnf1zYezgMmACWKEOQ5e/vzo6VGVHHE7Eo8IKiXPQUxPb2hcP0QXCl14+/c+SyIfbJIn91Ht3fz7+zRg5JwxfPSSRhjG/X2S2y5SJCzUrloyaKYpTNW8ybYRPTVkrZlHsif2XD5PLaKvMIH/rdtRuKzu7aP4CB8LX8kPCRg9FR8tY2gIQEpFlyIpJir0ebsQyEftWbokT99kiyH7LzCcfIPKbDz36oOWbOVczgP61iY3948zELbX1p2kLdLEoLBrutuNxFSY2CWWaFr4SGx7jgq11iXO78mIAYnpJSZZV5Ndda0UoI0kmyH1/K8WWTkE4Zt79JAGlvXSfbfFdHvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8955.namprd12.prod.outlook.com (2603:10b6:a03:542::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 14:32:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Tue, 2 Sep 2025
 14:32:32 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 02 Sep 2025 23:32:02 +0900
Subject: [PATCH v3 08/11] gpu: nova-core: firmware: process the GSP bootloader
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-nova_firmware-v3-8-56854d9c5398@nvidia.com>
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
In-Reply-To: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
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
X-ClientProxiedBy: TYWPR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: 97787010-af1b-405e-d2c6-08ddea2d8d56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VytWdURJczNJOHhNVVVvRHF6VS9pekx2L3lCdHl0TFpVeTBvcWhOT0JveTVZ?=
 =?utf-8?B?S0pZSWVrSWFCZGt2RkIyRElCVWczNitjQ3lrUS8ydGFqYkd5LzJhcUdXVzRY?=
 =?utf-8?B?SnVTRDNDZVBlM3RjZ3BVbnpvRXdBbU5USncvemtGcTFkekIxRnozc21kbTBm?=
 =?utf-8?B?dzNSb2gxZ1oyMFhEWFF3M3VqRXo1V290cVhEU1IxOGI0MlBDZWdvSU5Kb0FV?=
 =?utf-8?B?dnVjUnRaS1Yxb0NwaG84eWlWZFJGNVd3cnd1U3ppQmJiM0xaRytLbVZjVDdQ?=
 =?utf-8?B?STlHb00wM0ZxSngwMFdqakRwZ0QwODdMS2hUMXd1S2tla0tLL1lXRitlb1B6?=
 =?utf-8?B?Njk3VldjYlMzamE5T1RVQk9waWJiSVpGdGN5dlF0T2ZUVkVLL1BOeEI4dFo5?=
 =?utf-8?B?cU00QTRrTkhwcVZVLzlxVHovaEtOWjlNc291aXJ2L1U4aXp4RGhUWFpTVW0x?=
 =?utf-8?B?Q2xiMHM4Q2JNRHRxT1I1cjdzbFdnLys5SnFWTkhzMFZ4alYzTFdRMDE5M0NS?=
 =?utf-8?B?cXRqc1BoQW1tc252bWdGOHozOCtoWjFUVzlMdlhqbTROVXl0WXhLdkZKQUh2?=
 =?utf-8?B?SW1BZVBESzV6ZkowTjRuaWg2djY4cEg4Mkh6Q0lnZUhEeGJXWk5KLzhQOWVu?=
 =?utf-8?B?NXFGMmluZlZuRkpIQ2FydktRbTJTc0VaYmZncGVvWUQ5dUxLU3d4OUgrTElK?=
 =?utf-8?B?SFhlRVZtaGljQWtWdnUyanM5MkRnb0pOS2gwQlJPV1FQTDJPVi9GZW9ZcUVF?=
 =?utf-8?B?RUxYc2JNV0xNdkg3L1BVTzdGSHU4bklUUUtBVEhQNkdCeW9jOUR2N0RVSWNU?=
 =?utf-8?B?bkFocE1XcTFTclJvVkhCUTdSeGttaXFpN3BiS0l6aS90bEtyNm9kQmRVN29Z?=
 =?utf-8?B?SVJNMW9zVk5CcVBPOVIzeXVNZEtqSlpsMS80MDR6MDduOHZJTDJ0RktvVXNv?=
 =?utf-8?B?RnNPcElMZmdWdmpkZmZjUDJMbW1mUTJQQ3FQWFRaUDNXV0ExT2NER05qUGox?=
 =?utf-8?B?QzF1N0RnRnpVazlQK216czFQWm1OTXA4YzdmZkU4b2VaSDNIdWJJVFRXMFhL?=
 =?utf-8?B?YndPdWV3ZEdzMVUyVzMyU0hIdzhOYVlxc1VYQytEc2N6WGdPTURRaDluR2Qw?=
 =?utf-8?B?WmpZVEMzWGtqc1FkUjFRaXlHOGZQQzJwYmlacUFXS3BMVDRtdnZILzg2MjFn?=
 =?utf-8?B?d0J6VHZ0aE9vRS9XWEE4WTc1STNwR3FGaDlpWE9jdDgzU1JHSThLRWcyMHgz?=
 =?utf-8?B?bDloRHFJd3dUMVgvRnVEemNFZE1kaGRJNVBnU0g2S1RNOG12b0dXR04ydWR6?=
 =?utf-8?B?T1pORHAvVzc3ZmUzMHpQWUcxQWd3N2svYTZ5WlBiWk5FeGRWSlBJRHQ5b1FN?=
 =?utf-8?B?OEovZUo5Yk5GdTRxYTYydkJocW8zU3EySHU3djViMjhoL0ZmTlZaRUNmZmh0?=
 =?utf-8?B?UlFRcHU0Zkdza01FL1N3aGpKVm9MRWtWM05IQjNWS0dudnM5OGx6Z0FraXVF?=
 =?utf-8?B?R3Z4dUkwN3NoVmQvdDJoT1E4TlZRc2EzSkNmUkV6akJjMFYzYm1vVVk5b0RC?=
 =?utf-8?B?QUlhcmxTOEIxMWhmUDhTTnRhVzFobjdESEUvYzhoRXJnR2dkNExYK0NROXFo?=
 =?utf-8?B?enRzRVVJYm5zdGFhSFNXcTlVcStrME9LaWtXY0lmdVUvNVgrbXJTMmRuazR5?=
 =?utf-8?B?OE9pcVMrbjhUekpZdkRxSndRVExsYitxeVdlaEVJSnY3ZnIyZ01UMjJoS1BQ?=
 =?utf-8?B?U2NmaXU0NEIzSkpndFl4dmFTeGVpQlpoNVR2anZoeTFUNzk1cmNQRUs1WTN5?=
 =?utf-8?B?bEMzNWR2a21OeFp2bEkrSzNkUUJhY1RoeTZqekVkcklUSkJZOHlORUpBanMz?=
 =?utf-8?B?WTVORmNSY0NVRHFZNWJMQ3NReHFUUkUxWDBZaXJVdHp2SzhVYUtqdnBjV1Nt?=
 =?utf-8?B?KzArbE9LL2VuUllZSG1NYkE4R1VwT0VET1F3OGJYNE5qekVvdDZoc1A0VDd4?=
 =?utf-8?B?WXlUQlJ5NGhnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEpQWXk3MVkva1IvN2FhNG5QamNmOFIxTHFRVHlDZktoN1ovWWo1MGw1dFNy?=
 =?utf-8?B?MGo1cHVzdzVYZExxYjVsVjM3aUw4Z3pUQURHWEk5bDZPWXd3Q0FqMGlLMUVR?=
 =?utf-8?B?VXlGTG9ibmxxeVBSRCtGL3puTHc5YXRoZmNLUG5Cd1BDYXFEckNHUlF2WFd2?=
 =?utf-8?B?RHlRbEwwYXlSdExTR3BvZHlMZWwvZUMvbHc4TUkxTk0zaDdCSTdSZTZXTzZK?=
 =?utf-8?B?ZFZBeW0zZnphRmpqbmxNRjJYWSt1Wk5oOWduNGdxbTZQNDFYUEI0UUxtZURo?=
 =?utf-8?B?RVZKeFZTRjJrUTVQN0VHU3RVOGlINjhEQmpBNUxGbStkbzBYeU81UHJ6NlVa?=
 =?utf-8?B?clE2RkNCWW1qdVhmdk9VeVhDdytpaDZ3YnIrZzUyWWxKUXZjUUNVSVNJcmdY?=
 =?utf-8?B?QkNTMm9mdlVyeTdTS2pPNGpPNlJ0cktjZHFSRTVzVk1TZncrcjQ5dndUWnpM?=
 =?utf-8?B?c0xrNURqWXRVcSs0VXBhR1JIdnZpNENIVVdwRG1Fc1Z3UTlZdWZDbERHdlVn?=
 =?utf-8?B?TTBiNzNySXRSc0pOWHcwbFJwcVh4bTdaT0FMU05JdnhNMnhKK0lzT2FpQ0dR?=
 =?utf-8?B?UUJzY2ZLL0dtMGVrcWJ0QmlUOWJsVXdYRDZiSlRrRWxYc3dHaE96QmdFRjlR?=
 =?utf-8?B?QnZLYWM1Vy9kVTd5MXU3a0NoUURhQjNpWEI1YjQyQTJzWVZlTk1rUHduV2p6?=
 =?utf-8?B?SkJkK3dJWWcxWWlSZHZ0TjRoaGJoZWYvZXFzaTN2bXMwcmh3eDlsb0xvVFIy?=
 =?utf-8?B?QUxNVEU2TDkzRHpTYlVJd2VzSldla1hGQWIySkRna2ZlUnZmZ1BpRTA0bXZ2?=
 =?utf-8?B?U1dWVVduWEZqV0dlZ3FBd2EvVmpJMTRmbVN6Yi83YXVFaVZQUGQxd2NuZmtT?=
 =?utf-8?B?VXgyMUo5OGM2cm92VnNSKzdMYzBWWkFFV1RZREhTbUlKMVdMYmcvRWFIalNp?=
 =?utf-8?B?TGhNUm5HamdLSGhxYU1QWjBub2xlTUd5VWdlL2xvcmNkSWR5YW9mSUY0eExx?=
 =?utf-8?B?ZnNuYm1tUDU3UFFZSXE5bTV4TjdMOFpoenFqU0lEQjBOVWdXdHJUMU9WQ3cy?=
 =?utf-8?B?Z04zeUVxVWgvKzdzbnR0UzJtc2hTdndObFZLWDhHanRIbGwzMllhc3NERWIy?=
 =?utf-8?B?NDFnSmtxTVM4aXZ0ZWF6SHhKMWFDVnZLOGsyTGFtZXdxYU9sb0NuZWhiUXFF?=
 =?utf-8?B?M0I5b1pWYXFwVERVdStpMXZJUjBmTTZJdjZiTmFPMXFUa1NLUi9RMmR0cVhV?=
 =?utf-8?B?N2IwYmxHWi9abnpYRk1FRCt4ZmI1cG5aS3dNcGU4MlZTUjk5WS81eldCOExl?=
 =?utf-8?B?c0c5MVk5QjdkQUhlcGpUSVpFeHdpTy9ibGFnWFR4WFVzYVdjaGJjb1NlZEgv?=
 =?utf-8?B?SlcrbFdtdXJBcnQ0eGNyOUpuYkFFeDhueVVGMlE2UGNMNWg0WWRSWWZ4djZo?=
 =?utf-8?B?QVlCR0JQaDNnaTlBUnp2VXJsWEtBNi9uVHFVTlhsWDIzenkxTHV0VThMWWR1?=
 =?utf-8?B?Sms3VklDbTQwRkgyQ0hQbHNJeTkvZHpzMDVjSGNHS05Ba002QnlIQ1NsODha?=
 =?utf-8?B?MElsYlJ0aVZNWC9vSUpOYVJwemovL3l1a0d6SFhBVlYzQng5b0EwWmdINWRw?=
 =?utf-8?B?M2RWYnFmZEQ0aCt0NjkrMUtPbkl5bHFaUURzU2d4bGYxVHZkYXRCOHpQYlVz?=
 =?utf-8?B?VmhyS3dhbDZDN1N1K0NCaVAwRGQrSFpTcVB1alRuR2NuZGEyaFNZdEIveVVJ?=
 =?utf-8?B?ZEU5L2g5ZVZ0aW85ZnlVZ2dFZGxmM3RiUUQ2NGVweFJiZC9tY1VXaExsVUVZ?=
 =?utf-8?B?WG9MejFna2Y1TVBBUk9aTUZCZlhiNVEwb0t5eTVpZUxBTUdlaFdtZ3Nhb24w?=
 =?utf-8?B?S3Q1QS9kYmxIVWJnSDdTNUdJL1JQb3FqeGExY3VqeVl4dFpjK3RBSHR5Y0Q2?=
 =?utf-8?B?akxXbWVGbmhPckhzQWgzcXNmVWNEMDJXMytRc0kwK1BVUTArZEo5WUY5T2Fa?=
 =?utf-8?B?MUhGaDN3ZTZLOHYrSHd5b0NtSWVVSmp3cElaNXZUSUhoclJLWTAxbU03Rm9M?=
 =?utf-8?B?TkNaVUtnZldsekZGcGZPK09GWk45cUVqcm90Ty9XTzVwQnk0ZzFreWloYS9T?=
 =?utf-8?B?SnBFaUh2QWZsSWFiQnZjcjZsOFpPZkE0RUFEcHBhV1d2R01UMVlzeExseU9w?=
 =?utf-8?Q?JFODoaQ/K3MGFpE+FDtqA/6/4Sj/3zu1CPWvbQry/yV1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97787010-af1b-405e-d2c6-08ddea2d8d56
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:32:32.3906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okBI49IQhuI4UpDESACFIk7gywoZDnXP/X6ltT5hBoztQTZeU5Qb+sX3+WtLlTk1NySYVocRUlqKxVtPn0qDow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8955
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

The GSP bootloader is a small RISC-V firmware that is loaded by Booter
onto the GSP core and is in charge of loading, validating, and starting
the actual GSP firmware.

It is a regular binary firmware file containing a specific header.
Create a type holding the DMA-mapped firmware as well as useful
information extracted from the header, and hook it into our firmware
structure for later use.

The GSP bootloader is stored into the `GspFirmware` structure, since it
is part of the GSP firmware package. This makes the `Firmware` structure
empty, so remove it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs       | 18 +------
 drivers/gpu/nova-core/firmware/gsp.rs   |  7 +++
 drivers/gpu/nova-core/firmware/riscv.rs | 89 +++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs            |  5 +-
 4 files changed, 98 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index cef910a7c2dc360139fafc2a01a050a9df40e45f..af7356a14def2ee92c3285878ea4de64eb48d344 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -15,11 +15,11 @@
 use crate::dma::DmaObject;
 use crate::falcon::FalconFirmware;
 use crate::gpu;
-use crate::gpu::Chipset;
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
+pub(crate) mod riscv;
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
@@ -36,22 +36,6 @@ fn request_nv_firmware(
         .and_then(|path| firmware::Firmware::request(&path, dev))
 }
 
-/// Structure encapsulating the firmware blobs required for the GPU to operate.
-#[expect(dead_code)]
-pub(crate) struct Firmware {
-    bootloader: firmware::Firmware,
-}
-
-impl Firmware {
-    pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<Firmware> {
-        let request = |name| request_nv_firmware(dev, chipset, name, ver);
-
-        Ok(Firmware {
-            bootloader: request("bootloader")?,
-        })
-    }
-}
-
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone)]
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index ddbf3f27dd795b9b2480f0392160a3bfb68c6ab7..a377c5138294c9cc70714cd18eed54d679aba835 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -8,6 +8,7 @@
 use kernel::scatterlist::SGTable;
 
 use crate::dma::DmaObject;
+use crate::firmware::riscv::RiscvFirmware;
 use crate::gpu::Architecture;
 use crate::gpu::Chipset;
 use crate::gsp::GSP_PAGE_SIZE;
@@ -127,6 +128,8 @@ pub(crate) struct GspFirmware {
     pub size: usize,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
     signatures: DmaObject,
+    /// GSP bootloader, verifies the GSP firmware before loading and running it.
+    bootloader: RiscvFirmware,
 }
 
 impl GspFirmware {
@@ -160,6 +163,9 @@ pub(crate) fn new<'a, 'b>(
             })
             .map_err(|_| ENOMEM)?;
 
+        let bl = super::request_nv_firmware(dev, chipset, "bootloader", ver)?;
+        let bootloader = RiscvFirmware::new(dev, &bl)?;
+
         Ok(try_pin_init!(&this in Self {
             fw <- SGTable::new(dev, fw_vvec, DataDirection::ToDevice, GFP_KERNEL),
             level2 <- {
@@ -207,6 +213,7 @@ pub(crate) fn new<'a, 'b>(
             },
             size,
             signatures,
+            bootloader,
         }))
     }
 
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
new file mode 100644
index 0000000000000000000000000000000000000000..b7eef29956995c49ab1466bb6a71a756731bf78a
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for firmware binaries designed to run on a RISC-V core. Such firmwares files have a
+//! dedicated header.
+
+use kernel::device;
+use kernel::firmware::Firmware;
+use kernel::prelude::*;
+use kernel::transmute::FromBytes;
+
+use crate::dma::DmaObject;
+use crate::firmware::BinFirmware;
+
+/// Descriptor for microcode running on a RISC-V core.
+#[repr(C)]
+#[derive(Debug)]
+struct RmRiscvUCodeDesc {
+    version: u32,
+    bootloader_offset: u32,
+    bootloader_size: u32,
+    bootloader_param_offset: u32,
+    bootloader_param_size: u32,
+    riscv_elf_offset: u32,
+    riscv_elf_size: u32,
+    app_version: u32,
+    manifest_offset: u32,
+    manifest_size: u32,
+    monitor_data_offset: u32,
+    monitor_data_size: u32,
+    monitor_code_offset: u32,
+    monitor_code_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for RmRiscvUCodeDesc {}
+
+impl RmRiscvUCodeDesc {
+    /// Interprets the header of `bin_fw` as a [`RmRiscvUCodeDesc`] and returns it.
+    ///
+    /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
+    fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
+        let offset = bin_fw.hdr.header_offset as usize;
+
+        bin_fw
+            .fw
+            .get(offset..offset + size_of::<Self>())
+            .and_then(Self::from_bytes_copy)
+            .ok_or(EINVAL)
+    }
+}
+
+/// A parsed firmware for a RISC-V core, ready to be loaded and run.
+#[expect(unused)]
+pub(crate) struct RiscvFirmware {
+    /// Offset at which the code starts in the firmware image.
+    code_offset: u32,
+    /// Offset at which the data starts in the firmware image.
+    data_offset: u32,
+    /// Offset at which the manifest starts in the firmware image.
+    manifest_offset: u32,
+    /// Application version.
+    app_version: u32,
+    /// Device-mapped firmware image.
+    ucode: DmaObject,
+}
+
+impl RiscvFirmware {
+    /// Parses the RISC-V firmware image contained in `fw`.
+    pub(crate) fn new(dev: &device::Device<device::Bound>, fw: &Firmware) -> Result<Self> {
+        let bin_fw = BinFirmware::new(fw)?;
+
+        let riscv_desc = RmRiscvUCodeDesc::new(&bin_fw)?;
+
+        let ucode = {
+            let start = bin_fw.hdr.data_offset as usize;
+            let len = bin_fw.hdr.data_size as usize;
+
+            DmaObject::from_data(dev, fw.data().get(start..start + len).ok_or(EINVAL)?)?
+        };
+
+        Ok(Self {
+            ucode,
+            code_offset: riscv_desc.monitor_code_offset,
+            data_offset: riscv_desc.monitor_data_offset,
+            manifest_offset: riscv_desc.manifest_offset,
+            app_version: riscv_desc.app_version,
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 547e5dd31aeb9650b226c267de5f0412173b3fe0..b7798257e463a2a0e29e33a1e1076380de077bee 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -9,7 +9,7 @@
 use crate::firmware::booter::{BooterFirmware, BooterKind};
 use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
 use crate::firmware::gsp::GspFirmware;
-use crate::firmware::{Firmware, FIRMWARE_VERSION};
+use crate::firmware::FIRMWARE_VERSION;
 use crate::gfw;
 use crate::regs;
 use crate::vbios::Vbios;
@@ -179,7 +179,6 @@ pub(crate) struct Gpu {
     spec: Spec,
     /// MMIO mapping of PCI BAR 0
     bar: Arc<Devres<Bar0>>,
-    fw: Firmware,
     /// System memory page required for flushing all pending GPU-side memory writes done through
     /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory-barrier operation).
     sysmem_flush: SysmemFlush,
@@ -318,7 +317,6 @@ pub(crate) fn new(
     ) -> Result<impl PinInit<Self>> {
         let bar = devres_bar.access(pdev.as_ref())?;
         let spec = Spec::new(bar)?;
-        let fw = Firmware::new(pdev.as_ref(), spec.chipset, FIRMWARE_VERSION)?;
 
         dev_info!(
             pdev.as_ref(),
@@ -347,7 +345,6 @@ pub(crate) fn new(
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
-            fw,
             sysmem_flush,
             gsp_falcon,
             sec2_falcon,

-- 
2.51.0

