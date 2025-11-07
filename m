Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A12BC41FF8
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:43:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753B910EB95;
	Fri,  7 Nov 2025 23:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HwrnbHgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013022.outbound.protection.outlook.com
 [40.93.201.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD7E10EB92;
 Fri,  7 Nov 2025 23:43:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FabqTzpVcFApJbsOQUnLxUj4ZYxwxnXqrlNe3gyvKwQ1Vo3ybhLdidbRJuXPX0j+TAZN9blh17MN1TEEyfbfagg/wshvH7kVvJi9NcLGSRCDJZcjosTEirqP0x1UqgXGzJTW/ZvYJi8qTAMZlIoZcx3rUA70TNL+sE4ntK2gdJBJ72tp6OyVCYz/N4VQ2lgDpsDeRwCXqX5OSqGD/uTLFzQw2eiT9cAa2q8ESoGWXMIt6dQNpaqWuig6uR0ytG3TBdiGz55fu2ZJ3DcJfywkJntYTlcNqoL72W1mz620YzRN7dKwtLh8J9SSbHU1DkkCTihL8LdkiKEVtErknN2upQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YE+4g7TW5PhPQDFJtxzU2S/ge8hsEEFl0gppWg9apc8=;
 b=Kw4+htjpk6SQN4F1SnDM3n9RV14xbaI4ckG3dNMyvF/n0kRHZNSJyFmdOcJLuac5zLxxDhvYrTDiLYZ/Lhn7N1eKPaLke7uQSR/jFKBC6NZm6w8uq+EuuTG8qLWE0tgNOzVTfI9f8gbjqHHeQF1oEoiBhqy8sEOomYvjZOrVXLudoPwUzhraioMfTWr7E1qIlmWegJBl/GHAHy+0gtcj9q1KMMOYrAQPyrSrnYyA0Rr8k3pqz4pHIz2gAvlStwgFeFqVSnNezyCNn5O4/9s+aZ6EXoRZdi9HN3nzRjPJowM7qaS2YHf6jWoQ/vTtXBSAOw1CvbFlC+oFcO3G2V8ing==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YE+4g7TW5PhPQDFJtxzU2S/ge8hsEEFl0gppWg9apc8=;
 b=HwrnbHgVBHdhpaRpqs4U3xuFNTPRh/mRsfyIkLnaQqS5Aifz1fDneFhcWHQ/bn+ZcBpWKx93UdR0MCk9tSCxFutq2No69l+wpvdPtUAtxtmTX2Ejdfk98uiVs3U40g336Ri9SYenJd0sl9ld+giCL13Kf1/DFkltM27gZCfwflV18XZ2LcvD+yM/poDyuL72LSDd9y9UjCq6NybOoTGttTlWKlb5Bpr40onAkR2lwDq5BK8/olDuT3uKRifoja9oRAub4PKbpLlsg3p8k0qLtIJiTu7DHY/c/L9j0Y29M+y+v6unRNPxsKlbSVXeynxi6RDLFaFEdqXOagbulaHGCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 23:43:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 23:43:29 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 08 Nov 2025 08:43:04 +0900
Subject: [PATCH v8 03/16] gpu: nova-core: num: add functions to safely
 convert a const value to a smaller type
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-gsp_boot-v8-3-70b762eedd50@nvidia.com>
References: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
In-Reply-To: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0003.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: a78a12c0-3ce8-4285-9362-08de1e5773ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFFFNGUrbnU0MDk1bXdZSnVCeEJ1Mmp5OUtHNStJU0RrdXU1czl6WnM4aEFE?=
 =?utf-8?B?YVJnUDcrRVdzUExXNEFReEVINzNFNFVGdkdENnBoMDJrUm9yaWlqajJ2YnZG?=
 =?utf-8?B?MmNPKzA2cHBEUi9EQ3hrRnN1N05NYTRKYnkrMUh3MURtWUNzVjluRG5kbXJ4?=
 =?utf-8?B?S0ttSDduRUNINGlxRXlITEE1T3lsclpRU1FvRWwrZXVNUFRxNUxrK1RKUDlL?=
 =?utf-8?B?MThTRk9nRkFIekhuNGttU3ZpbGlPRFdRSGluSXZFS3gwQWxqWkk5MTVEUVZ3?=
 =?utf-8?B?VGJhM3FqZXhwaDlPNFRYVFoyajhLZFJWaGRyZWFyQ2dsajVoNDR5YUpTdG4w?=
 =?utf-8?B?ek9Gb0Y1TUhYWHlHU2c3Zyt0TE84UEZXOFptN3RQWmc2Z3lvOUpxcnd5SGJG?=
 =?utf-8?B?NXFKZmdBcWNyTmxsYTJHc1NpbXpQVVhLS2VoUnhRc3hPR25hcDQydXB2VzFQ?=
 =?utf-8?B?OTROYUZleHFuaDI5RE1aTUJQODhNK3ZnY05CNnBBako4WjdjNkZrOG15eUF6?=
 =?utf-8?B?S29LaE1vaXFKeGhGN2ltWnMzSGNFS2VjLzVnN21PVjl3OWtiblNPVVcyb1JY?=
 =?utf-8?B?MXNLM1pxb2lZcGVCQ2VJK0EwaVVnR1gybVpOWFQwSEg4dm1rNGJPeWZ0Uy9D?=
 =?utf-8?B?RUR5TkVmcTJ5R2VsMW1KNExjZm8xbnBCS3BxSENkR09lWUFhcUxtQ2k5WlBr?=
 =?utf-8?B?b0Q4WFRaeUd6ZS8xSENoTFQxVUpjSmZRU3IvYWl6d0RFU29NMm1zTHVYUlho?=
 =?utf-8?B?V3REN1Roc1Fpb2xERTJFWHlRb0VPeldaOUg0OUkrS0ZNYnV0d2xEbWYxV29v?=
 =?utf-8?B?Ym1ib3dBMTdkV3RSSXVOTjUwR3dTeXduV0o4NGJvQUZiMDEzTXNXK1dtRU8v?=
 =?utf-8?B?UWVtUndva0ovc1g4MjVRcWV0aVlWa2pXNTNvRzdzakJrbk81TVdFNFdJYnVM?=
 =?utf-8?B?UHJrc2N5RlJxUkVLcC9WaExCOU9ZOGFRRXhsd2NzNlFLaDJzTXc0Q0pnOHd0?=
 =?utf-8?B?ckV1NkZ6cE05Rm83ZTZUc200S1kwcHZ4Wm9VMDhiclNDMnVtMzJpWk1MZnJK?=
 =?utf-8?B?RStRd0tZdnpkZThlUHJSbFd6OUc3SU9aOXZzeXU2dW85KzRBSmlvVkFvaVow?=
 =?utf-8?B?ZExibVo5ZTV4Tjg4cFArbXdlRi9MVklsK3oxNVVBMnIzRDZUZk4rejNzWlpH?=
 =?utf-8?B?Rnc2SGhQdlJUbEJTNkFlbHdqQTNEOXRQMEY3SndlTHRvSG1DQ2tsTmcrSk9h?=
 =?utf-8?B?VTFsYldOd3FiaWFMcCt2cStTVmVUVUhnK2pvZXBNaml2VFpRMVZBUkdic3c4?=
 =?utf-8?B?UmRFam9obnFnUFdYemZnV3hBK2dTaGtEWXMxYkZXbjRBS1FPbEFrMVZoQjdQ?=
 =?utf-8?B?R0R4UFROaDlLZTdKL1k3Q2tTNENaR2ZkMmNhRWNoRnJsY2pWZnJJUWVWajRy?=
 =?utf-8?B?MW56bVgyWmhUdWdhSldyQ3JVNEN1MFJrdVY4SGtQU051U1BReG5ZOFdzMW9G?=
 =?utf-8?B?VnFrUEhYaVFzcU1kaDc0UTArSEF6WnVidFkwemEyamhSY0twYkd0ZUt3ZFkr?=
 =?utf-8?B?YUJEVXp4WWZpUUpqZUtKTG9sT1JVU2xqTi9FSGVuUnRwUnRzeHpkTWJEWEN4?=
 =?utf-8?B?aEw1RGhHYis0eTI4T3Bsd01iNXR3aUpjcmg0TExTTGJFQ3hyaE9uYU9ZY3lX?=
 =?utf-8?B?M3IyYmFNWWJ5NFV4eUtpcyswa1BRRDVpdWU0OUNURVozdTBBVWVHMlVjSlZa?=
 =?utf-8?B?RGgxYUk3RDhNQjVGYUNIdU11emRtRkFJNHhLVmZRdmJEVVk1RTdOOVcrRjRy?=
 =?utf-8?B?ekM2a0VvRmJjRU9vaitKczZBbFhOb1gzN2NLdzk2RWY4VVFma2EvRFY3WWVq?=
 =?utf-8?B?WmQrN2YxWmdtQnUveWFsVUNMRy9pemxLZkFYR0YyOWwwL0NIZDZNcStBcyt1?=
 =?utf-8?B?KzVhM3BkWVFtSVpScG9SOEtWMlRKeTR1YTFDcVIvYXhNMEJOeFlaZUx4ejM3?=
 =?utf-8?Q?Eyue6Y9M8JnOr6ejB5KaXwiVcWAoak=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW1KWDRkNm5aeUFJckJuWlFxb2l6ajJjaFpSV1NlVHpQaEVOYkMvTUFuSllO?=
 =?utf-8?B?SXJxM240VXdqUGtDSmxaRk9EWE4xQWQyYmZ0LzlzdVhQQVl0aVFmUGp5WTVs?=
 =?utf-8?B?NU1nM2s3N3d3Y2JqbExlN2ZTZHJwcjZVRWt1MzQ4T3JjQkJYdTM2eXlFUzNz?=
 =?utf-8?B?R1FJVGR6KytUTVNJSlRiejByR2xjZ2VRSGpvME1JVjNQYkRudDh5aUVSL2da?=
 =?utf-8?B?RHFtcGY3UzhJdS92NFFMTlVrUW1YQnFQVkw0RndiNk5wY1dObWxOSVFLLzRk?=
 =?utf-8?B?OHorSVFlczVjTTNDQ05seGg5L0YrR3k0Zkt3VGMvendrNDN1c0xxaWdTUytm?=
 =?utf-8?B?alNyTjljdTF5dXgyVkp0TFZCY290bWd0RzRBZksxSG8vSHozM2haRnJ3K240?=
 =?utf-8?B?aWdraEhGbHdxZW9vQjF3NCsyN0JHaWhvTTR1d3dITzNnWStmZVBCQ2VoV21k?=
 =?utf-8?B?WWwzM3MyTDVIUE5EYjdLK2VKOWl0OVhiSHBLd2x1OHN2TkxJV2ZwZURBMlQ0?=
 =?utf-8?B?Z1JuL1AwODlMWjRvNGMrSllQS1MwcHE5WmNEN0syN2xsT3R1a2RpMVFBU3hl?=
 =?utf-8?B?SkpWSXJmQ1h2b2hPZWN1WjJlbGszVExSMExYd05lVHFkV0gvUVhJSUZlb0wr?=
 =?utf-8?B?UnRYUUEva1k5c2RKNTBlTmUvS0NNMDRUZTd3elY5L3VobE5aTkJybEdpWldO?=
 =?utf-8?B?MWsvcDc0dENsZEw1K3dxQTZ1T1hicVIrS1dmOFJSVmhYWEJuQjBCMitpV1NH?=
 =?utf-8?B?bUZ4d1dlUUFlU1Z1amVhbHdBVXJXb2VjYkYzMDdWL0hJVVh0Z2FWNWJiZE0y?=
 =?utf-8?B?TmVKVXhXK2JvMEFFUEQrOHl3ODhXNHEvR1RhYUphRCt4WTgyVkE1UlVjOGU2?=
 =?utf-8?B?ejVod2k2TEo5cVRrYzI3U3o0Nzh5eHVDUjYrVDJnK21yN2RDd3BTcy81aWk4?=
 =?utf-8?B?bVJwRU9SNkQyZlIyNXR2RHdoa1cvZEpqTUNDY3Z3L2NyQnU0bVRaTzZIRndt?=
 =?utf-8?B?MVpCQWVUVzAxZmZNS21IRExwaCtzcHJXR2VsNzdVRkxvZnJ1S2xwWVdrMGpZ?=
 =?utf-8?B?MzYxLzZPQW5YZjdUVjBKWGZFWFZHWlE5cVhjR0wvcmZnWkVxSzNibG1Rek5Y?=
 =?utf-8?B?WmtyNjZ4VnJ1NVdia1l4SDYyeFlKU28vQ08zM01mdVJac1BFV2dzYkhwYXZk?=
 =?utf-8?B?YmFqbjVnVDR4NmdGZ0Z4Vkt6RXJyLzRLRFNsT0hFU2NPSUhkRW5oMGRFdWhw?=
 =?utf-8?B?Y25VT3l0UFNqNi9uUGxkcmthMmI2eWpuQWd5eGRKKzgyZEJIRHVpVWQ3OEs5?=
 =?utf-8?B?NlI4b3VMdmU5bi8xaGIvMjcwODhrVmJ1ZmxlQXZNQlV1eXpQOUpBRWZUTzhN?=
 =?utf-8?B?alhHMm5xQ2N0dmdKcFpYM0k4RUNoQkpRaXNEL3hNb1dwRFVSZWZvMkU5VG9k?=
 =?utf-8?B?bnZWR1pGMGc4dzNXZkgrK0tpVmVHMUZabEJaQzN0REwvY3dYZk13Rk5vQklk?=
 =?utf-8?B?TnFiQUtOcDZVVHVKRFh6NmwyZ1RsMytPS29SeVZadjhEK2FVMWV2aldjR0Zh?=
 =?utf-8?B?Szg2UkZzcFhlN0lxTXBIWnlJTFJ6TGRkN0dOMlVVOGYzNy9MR3RRKzAvM05P?=
 =?utf-8?B?UGRKMmVhcHF2TjdHTjcwa1hLRlNYRk8yaVdOR2UwN0ErOTdtYXBhOUM1NUVQ?=
 =?utf-8?B?ZDZGYXRJWGpDd0wvcVNjWTVTQ0FXZHYxSkpHQUpsK3NwVmovS0VJQTA0amh6?=
 =?utf-8?B?S3pGTWJLdEVZYm1TVkFWRlhDMWlsUE5TYW50Vlo3aWlQT3JjWVlFd0l0VGh5?=
 =?utf-8?B?YXFxV1UyZFBaKzUzRHhsbnIyKy9BeXZxZkM5MUFEUDBqdmh6SjY0U1hwYTVE?=
 =?utf-8?B?RlRjZml1WWx2QzAvWVg4cXliNC9rem1ieGhkOTdKV0RocDQ2YTlkSW9DNVVn?=
 =?utf-8?B?cEljR1FmeFh5VzlvcXloS3pWTGlwYmNuc2VNWDBZLy9KNTE5d3BzTStxT3dH?=
 =?utf-8?B?VGZlSnJVNEJtaC8vb0Zpc1lOZDNIZ1lCTVdiYU43VE1vZSszb2d0S0p6M3B3?=
 =?utf-8?B?NndrQ0tWWFg0ZjRZczA4V0lxQlo4YTFIVnYvU3NiTTNXNEJpYmRGbnVWQ2I4?=
 =?utf-8?B?S1E0ajYwdjEwM1hiOW14Q2MzVkw4US93VG5kU0cwSU90dmYxSGt5amc4OUhw?=
 =?utf-8?Q?KCVCOM87RVDsr0Z7NpEQaRymc6i3NQQuwT9tkZO8ZHD5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a78a12c0-3ce8-4285-9362-08de1e5773ea
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 23:43:29.0860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eRW9w9bwCC/nHSbJpZdLcLrR7co75XRFe8LK02DcaUArLOYIj/r8xeA5GmA2eCFxAOJpAg87AC8mdHFrxXCVxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642
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

There are times where we need to store a constant value defined as a
larger type (e.g. through a binding) into a smaller type, knowing
that the value will fit. Rust, unfortunately, only provides us with the
`as` operator for that purpose, the use of which is discouraged as it
silently strips data.

Extend the `num` module with functions allowing to perform the
conversion infallibly, at compile time.

Example:

    const FOO_VALUE: u32 = 1;

    // `FOO_VALUE` fits into a `u8`, so the conversion is valid.
    let foo = num::u32_to_u8::<{ FOO_VALUE }>();

We are going to use this feature extensively in Nova.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/num.rs | 51 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
index 92a91b9e30de..f3740ab6cb9d 100644
--- a/drivers/gpu/nova-core/num.rs
+++ b/drivers/gpu/nova-core/num.rs
@@ -163,3 +163,54 @@ fn into_safe_cast(self) -> T {
         T::from_safe_cast(self)
     }
 }
+
+macro_rules! impl_const_into {
+    ($from:ty => { $($into:ty),* }) => {
+        $(
+        paste! {
+            #[doc = ::core::concat!(
+                "Performs a build-time safe conversion of a [`",
+                ::core::stringify!($from),
+                "`] constant value into a [`",
+                ::core::stringify!($into),
+                "`].")]
+            ///
+            /// This checks at compile-time that the conversion is lossless, and triggers a build
+            /// error if it isn't.
+            ///
+            /// # Examples
+            ///
+            /// ```
+            /// use kernel::num;
+            ///
+            /// // Succeeds because the value of the source fits into the destination's type.
+            #[doc = ::core::concat!(
+                "assert_eq!(num::",
+                ::core::stringify!($from),
+                "_into_",
+                ::core::stringify!($into),
+                "(1",
+                ::core::stringify!($from),
+                "), 1",
+                ::core::stringify!($into),
+                ");")]
+            /// ```
+            #[allow(unused)]
+            pub(crate) const fn [<$from _into_ $into>]<const N: $from>() -> $into {
+                // Make sure that the target type is smaller than the source one.
+                static_assert!($from::BITS >= $into::BITS);
+                // CAST: we statically enforced above that `$from` is larger than `$into`, so the
+                // `as` conversion will be lossless.
+                build_assert!(N >= $into::MIN as $from && N <= $into::MAX as $from);
+
+                N as $into
+            }
+        }
+        )*
+    };
+}
+
+impl_const_into!(usize => { u8, u16, u32 });
+impl_const_into!(u64 => { u8, u16, u32 });
+impl_const_into!(u32 => { u8, u16 });
+impl_const_into!(u16 => { u8 });

-- 
2.51.2

