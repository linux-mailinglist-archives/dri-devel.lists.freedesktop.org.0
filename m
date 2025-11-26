Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8129C87A2F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 02:03:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B9810E4D8;
	Wed, 26 Nov 2025 01:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XxkhYQEW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011041.outbound.protection.outlook.com
 [40.93.194.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C99B10E4D4;
 Wed, 26 Nov 2025 01:03:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0MDCDk40rPfzt39XVmeQimWASxYthnAh1jQgRMIJBto0PV4FyrvP7KHY1fSsF6GnULcRpPK71CHyDKEMLsFeN+kLf+sZjAetoKeqsGVVorq3exGyJzshMLgQ5kOdVT18VcM/4zgle3hsqrVH03BeTfBInp+UaX9Wap13yY67f49dt0z/PJHoTFlJFwWCfJiZNuLol7GWoUgUOdNaM7GL2zUBu4PlY+Q4SNCnAUFZd2ON8QiK02jlvDJhonD5d5ploC3V4HZypQ5wDVASsgKKbOEhSUK9p+F8cXRUyH7Ui08tfBQL0+bbtQmuTXHj8CleSu/uR2zW5fWZOApNwuIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coPNb1H/O8ycOHlRRb+aCrQybklX6BZwHC3W8i2gB9c=;
 b=V6WVTfufqBRL+mdG5gPP90isjCVrCOS89VQqG3j9IPrvBwatN2YaTIUfIdPrxzSaMGf3DdLPM4hKZdZp/wQ/NLxHaRgtxhBcVFSxN2hrk3mz6WiUcAgR2VFrAxaiauBoa+8IZx2SyKiQPHT2lw3Oop27jRe+TuNKDqZUPtrbEsx6DD5ayJm64RZ0scgt9a33/K8RE5yjTeV8ddvo0ZYIfgoyPv/4WP1Vrh5mmJUQmOoWJ0KHnbN2DY1dE5A5o/864BQZBMgMs+bN4IRXxQBvi4Nvkoqfm8Az8g8odqeyTKuAbhQ53ibpdqaLZFlLRmtC7voP1pmeSiRHnEPBrru0sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coPNb1H/O8ycOHlRRb+aCrQybklX6BZwHC3W8i2gB9c=;
 b=XxkhYQEWQrXlZIGUUKyFUJeJjJ9Uia1SB+KfRCkWNO86FHZS/uzDSNf2TN9gY0fixeqHfZQRQXNYiYakjbkMqzTNyRNWjGRQhrzoYPiB21iiDyclipWaD2ORm34JZpN49lExP3WJ5RKH3LQwVPdiiTIIzjo+iTWTGJ+z0+YcJZ1zG3dzSNB1cl4oxR7USVjStM77VgRCxYXi6p9nAMT0t2yM6tkpK5Z4/5G7TfOshg3kJsHiT4UEVrBIe7yNKus3WnGUjnn4Mhe5gSphm89G/MiJuxkr8sSMNbM8Lk4QheQOI9iBTqH6+NFqpWZJzf0BnYu68mf0a2nty9Uy8ur44Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ1PR12MB6217.namprd12.prod.outlook.com (2603:10b6:a03:458::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 01:03:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 01:03:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Nov 2025 10:03:26 +0900
Message-Id: <DEI7ZVKG4JLA.FH1MEMUQLNUK@nvidia.com>
Subject: Re: [PATCH v2 3/3] rust: clist: Add typed iteration with
 FromListHead trait
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <airlied@gmail.com>
Cc: <apopple@nvidia.com>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <jhubbard@nvidia.com>, <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, <elle@weathered-steel.dev>,
 <daniel.almeida@collabora.com>, <arighi@nvidia.com>, <phasta@kernel.org>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <20251111171315.2196103-3-joelagnelf@nvidia.com>
 <DEGQCMSX1SGZ.2NQDPG5KUNA9D@nvidia.com>
 <04b9f849-94fc-4bfd-94d7-7337a8cffdf3@nvidia.com>
In-Reply-To: <04b9f849-94fc-4bfd-94d7-7337a8cffdf3@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:405:378::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ1PR12MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: dfdad4af-89c2-433d-edb7-08de2c879cc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3NiYXNzc1Q3Nnc2b0wzWlhIa3hrWnQreWFSYXR5WjVkKzB2WEJrdHJVbWZK?=
 =?utf-8?B?SThZak9JakJDT3B1NlZDdGJDc0ZDamVFdUlaWGIwZ0pHOHBNYXBwUHc1bU9u?=
 =?utf-8?B?WHE2ZDF0UlFDMXRpWXQ1cm9vbnZtb2JINVJxbGR1VXgyb2pCZTJQWmwweWQz?=
 =?utf-8?B?ZElYYUJYdmsvWFFGTGVCbHcwakQvYVFCRkh2UGZNMmJMbjUxNEFFcHdRRE9o?=
 =?utf-8?B?ZUlqb1lFQ1lXZGRQaFN2OXFzNGhCdzZkU2NNVndxcWFOaGp1RmlUMzVmY2cy?=
 =?utf-8?B?UXRZeFpOa09RVCt3ZkdxM3FxNERBTzNvWWJPQXhzY09hblI3QXBwc1MxUGdN?=
 =?utf-8?B?NjlmeE5Kb0pEejdkc1VlZm0zaEIwNmNZNlRSNFhvNFIxaDhUT3U0dERFa1hq?=
 =?utf-8?B?OFhTU2c4SkRzU3E3QjlKQzZYK0tjdENjakFSVlJhTCtwdXA1QUNYK0Nkcm1i?=
 =?utf-8?B?ZEZ4UjNkVy9OQndKRC94c0Z3OVpMYXYwNWFyTW1wTzlCaDhCR3VkZmtMSVA4?=
 =?utf-8?B?SUNiOVZDYnM3OWNiZVB1SCtFSU9JOGxCS3Y1Q2RmankwV2Q5SEkraWk2eWln?=
 =?utf-8?B?Q3dSc3dBMkVxY1VHQnNMdDdoRDM2RmovV2xMcUlYSGVLM3dEQlBEbGxVaUZY?=
 =?utf-8?B?amFjeDdKVEVDSzN2cGx5M0kzb05Cc0FFMXVjNmE4cW80UzZxbHBkaCt4dXhI?=
 =?utf-8?B?ejdhMTlpUDZsVzVHbHYwODRWcmpGa29sckF0T3hhbDNld1NsRTVqWWRDdGFB?=
 =?utf-8?B?Qk5LeUltRU9jeFE1YUozOUtXSHVDMGhuSXlJVW0wb0U1RzBmM0c2dHlQZHJ3?=
 =?utf-8?B?ZWRHaS9sd0FOVUlKclhFYlBsbXRVZFNxZ2hDV3NhYUJNaHNsQmYxdS9VdDFi?=
 =?utf-8?B?OHFWVUR6dE1IVFJRenpuUE1ZbzByMTlPQ3dDOGVpQS9kbU1sRVlzRWlaRHpU?=
 =?utf-8?B?bS9FVXcxaDhFYU9EYWRrNEVSVUFEazlXd2tCdnFTTUYrWVZwSUVaTWYzK2U3?=
 =?utf-8?B?QkQvRTJRalVwdTRmTWFJRDlRcmttNzlEK2NjekRhT1ZhUmpDUFVzY3pPa0NB?=
 =?utf-8?B?cFU3ejVhMkR4SThUR0pWdHRmVmpScTNTd0NIR1FHMURkN0graXUzNExZQ29W?=
 =?utf-8?B?M3JUVndJdGZzVkU5SmZlRlJOdHFDdkZnc3BITFExNU0zR3F1K3lFampkbEh6?=
 =?utf-8?B?UXFOOEk1aUUxL2kydXErN0tuREpRQ3Npb1oxZ1BMZ3lDYXNKZmhsYjdtSEd2?=
 =?utf-8?B?SEZLM2tEdkVseDkyU2JrRnk5YVpCWXVQLzVBTmYzcWZVamdnbHFXUVpaTlVv?=
 =?utf-8?B?M0lHQmFQUmVvdkNjU3U1OXc5alNsUFBWSVJEeWJLRyt6WWpGWnlaOUtaQlVk?=
 =?utf-8?B?bGk4OS84UkkyM3Nyc09CMXlqYlZxR1BzUHNDNEJkNUlCZ1lGRFVSN3JrWllS?=
 =?utf-8?B?UDRsS2pJeG5PQlVTUXMzeVhnMWJSOWUwN1d6VWtRM1VXT1BKdTRDdUg1S2p3?=
 =?utf-8?B?SldzcDVxYys5MEFwTGJadWFPaCtxcWJwTnBaN2IzVHJZUFFXWTFkcitKZGt6?=
 =?utf-8?B?b0d0RVNJNmwzQUpFRC9tYTlQdWh0aTdEWmROcGxRUHlkUW93VlZSZDk2TXEx?=
 =?utf-8?B?Ukx4ay9VSG15MzZDMk1EMmtMZFFDSjhkdy85VzNpcnFPaWhhcVZrRytxNEQr?=
 =?utf-8?B?SWEyaVFrUVNJdWJkV2tXbE5WTWNYT3dGMmRNenRzdUV3OE4wY2cvN3BER3l1?=
 =?utf-8?B?bFk1eEhqOExNL2RneFFXQWs4Q1JMbGcxbytIb1MxWXNYRFhiVEJvU1ZyOElM?=
 =?utf-8?B?RWlyMTFRc2x0MlQ4c3RiSFpNcGNuaDRXRkZONDdBSVZuSUhBV3czdTNnaVhO?=
 =?utf-8?B?SVVxa1U3dFJIQmtBMjJ0Wk1wNVVKZDhhWW5PTVRyQk5xTHBFOTFlZWU1aWlB?=
 =?utf-8?Q?Aaesy/r0gMvakd6J1b9VM2skJZKRohLD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YURYcFF4dmNIUVpwRGNDZHJQSVVoWWhnbzJzTlQ2QWMwTUpBS1NWalFDSlpH?=
 =?utf-8?B?b2VNYnVIQmlCZzVJemVkYTlVL2FENFQ0UXFBN1htZmY3cWc0R3Q5WitldnN6?=
 =?utf-8?B?NGJDZi9uR01CKzRBYUNCTVRtb0RQaHZWaXUzaGpzS2tMN1RXc2ZKb21NRDEz?=
 =?utf-8?B?L2RoaFhlTFF0d0toV3pCV2RnQ243TmlpVEFqcy9tWjNYb2N2ZWg3a3ZNNXZ0?=
 =?utf-8?B?MGgyc2l0bE5EWXN6cnVmcEZYWVNFczBRakppVFRKVTZ0V2FsQk5Za1pRTG1t?=
 =?utf-8?B?QzcrSHVyT1NHQ2hCY1dpdmEwb0xuS21qMDB3dXIzWk5DcUZkbG1WSGdBSkd5?=
 =?utf-8?B?Q2txalpDcFdtRW5nTUpvUEU1bWJlRVEwZVdFSnp6SngwWm9aK3ZvNUF2Ti9Q?=
 =?utf-8?B?Mk1xcFRhcDRxV3hYSzZNamFaSHZBM1kxK1hlL3M5YTh0RDVQVHZnTEpYQmtu?=
 =?utf-8?B?WFdQbU1GT2FiY2hyRENqdTR3SXplcWxZMUtIa3VHQ1FOY21wMDh3ajVWWW5Q?=
 =?utf-8?B?aU0vQ0Q2QytJWnFHQ213NjJHNkNIb3FnLzEvNENJOXpwOExnQkVNZ1ZyNHJS?=
 =?utf-8?B?R0t3LzR3eURnSnEvOWZzbEtBTCtTOUtJUzlyeW9IRlVxR0FreGY0TnlBejI2?=
 =?utf-8?B?Qy9mdHAxQmxFOVNoN0QxYVlFdTduRk1RTmZHUGhSaUpyZlFXZytmczhPZkxi?=
 =?utf-8?B?d3NGZkJpTTNTbFVLeGNRT0FqMHRvdFhBMFlaeEROMzhnUyttUjNWYnBaMXRJ?=
 =?utf-8?B?WmhTTGcwOW03VDgwVWpFZHBaellqN2tickJPRlBzTUZtUUhHM1Y2NUZYRS9v?=
 =?utf-8?B?cUowZ3VITG9jRHU3aTluUkNVdHJNUmlGaDdzSnJxRUxtODdoOEtPbVpxLzJI?=
 =?utf-8?B?L0c3b3UvcE5yZElVNGVHRnYvajVJd0NGNWtVQkFOT0cyRS9CSGJzaVVadlNw?=
 =?utf-8?B?QW1vUFczYnhGNVhJeVJHSktOWWlFK3BOM2NkZnd6VVBpeGRqZFNOYjFsZGdD?=
 =?utf-8?B?SVV3a2JTNjloeUNDMCtWMDRmMmFzdEtWTzY2aXZwNTREL1JyaWN5TkpvMkRD?=
 =?utf-8?B?UkE2UlBtdTROaG5hKzdNN09CUGlIaWhKa2xqZjdWMVpBQ1NlcHNISmZ3N21u?=
 =?utf-8?B?VWxJVEo1YkZzc1hCOEpOL0pTTjZoM1NaL0IxTm5BSXpZajRSZkthcmFMUmJi?=
 =?utf-8?B?c0p2aVp4dnZQVk9XVm1KZlh5cnB0clNTU2JuQnJEeE9zU1d6bCtjb3EzaWRx?=
 =?utf-8?B?SE1NZVhBSkl4N041OEVpQkdpZE4xRXZBY0JkY2s5WG5QV1h2cW9JR2VGTzE1?=
 =?utf-8?B?QVB6b0hWeUxHeW44V1J0cWF5TUVBTEZ5alhLbEswdFdzcTBBSVJMZkVKRjZV?=
 =?utf-8?B?a0FmMHBJOXR6OWdINERCbXNPRXo0aVJkclp5UEVOdFJVUlhRdDkvSXQ0Yk1J?=
 =?utf-8?B?VWNFQ3ZXUkhzY3VwUmJvMXo4OU5HUGREY0FNdFNSekRJaFJpSzdjUDJLL25r?=
 =?utf-8?B?WEY1ZXlkeTBZT3JBNjBQTDhBZHJOaEdZS2djYVdPWUtJcGcrdmMreHJFK2VU?=
 =?utf-8?B?dU1BU1E5MVdreFAvb0M0WEVFSXQ2cXFTejQ2YW9STGJ5cGxZWDVXQUpkQmpM?=
 =?utf-8?B?Y1VCZDBsVnR6VHlmdUZtdHVYd0NNUExQQVk0d1lhQTVITHllb1VGZUJJSGZm?=
 =?utf-8?B?eFZlNGI1WVBYNEVSZDNuUUo3WjNhb1NHM3hvRmxCK3dHY1Bna1B0TU5PV2RP?=
 =?utf-8?B?WStwYUdlQXRRYWdvdGtIdFVWUFkwRTdKeUhOa1cxQzdpZ0xCUjdTQmlJVklI?=
 =?utf-8?B?cVdoaHFzbDVSTTlnWXlhUWJPYUR6UnMwd0xJcFJRQzFFNFBWK1I1OUgwckl6?=
 =?utf-8?B?cXJIZXVxMHV0Y1lYTGdkOHkrbDFNdWNNVEVmR1ZWbURmSlpIRW44Rk9IR2Nt?=
 =?utf-8?B?ZXpTWmVqc1BkNndPVWlHTFNZbEV5ZThsVGZiV29ZbzU5Tm02V2RHOTg2WTVi?=
 =?utf-8?B?bDFpeTdUK2dNalErdjM0SUExbkVDQ3lwR1ZibHFoNTFvTStvR1BOME82Qnh4?=
 =?utf-8?B?MkM3UTRyREZNWmIydWxXYTVmR1doTGFtSlFwOWR5clhhTExCVVMwWXZNd2xo?=
 =?utf-8?B?U2M0R2pKSks2TThCanY1Y2ZXTmpxSGJEbEU2a2Y1ellnT3J1MForL2JiT0Rv?=
 =?utf-8?Q?4WOSsR/fBn43p5JpQPKW4LY5MH9TS4h7CkXEwJygByFD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdad4af-89c2-433d-edb7-08de2c879cc3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 01:03:29.8007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENf8Ua4inQ6jBt2gmadDaA0Wc4u0lND2tXGNU6GdT+rweJect/hO0SS8Rs4Hm2cGHHpbbg0tiqBq0d1wstBbrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6217
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

On Wed Nov 26, 2025 at 8:29 AM JST, Joel Fernandes wrote:
> Hi Alex,
>
> On 11/24/2025 2:01 AM, Alexandre Courbot wrote:
>>>  ///
>>>  /// # Invariants
>>>  ///
>>> @@ -69,6 +156,15 @@ pub fn iter_heads(&self) -> ClistHeadIter<'_> {
>>>              head: &self.0,
>>>          }
>>>      }
>>> +
>>> +    /// Create a high-level iterator over typed items.
>>> +    #[inline]
>>> +    pub fn iter<L: ClistLink>(&self) -> ClistIter<'_, L> {
>>> +        ClistIter {
>>> +            head_iter: self.iter_heads(),
>>> +            _phantom: PhantomData,
>>> +        }
>>> +    }
>> This looks very dangerous, as it gives any caller the freedom to specify
>> the type they want to upcast the `Clist` to, without using unsafe code.
>> One could easily invoke this with the wrong type and get no build error
>> or warning whatsoever.
>>=20
>> A safer version would have the `Clist` generic over the kind of
>> conversion that needs to be performed, using e.g. a closure:
>>=20
>>   pub struct Clist<'a, T, C: Fn(*mut bindings::list_head) -> *mut T> {
>>       head: &'a ClistHead,
>>       conv: C,
>>   }
>>=20
>> `from_raw` would also take the closure as argument, which forces the
>> creator of the list to both specify what that list is for, and use an
>> `unsafe` statement for unsafe code. Here is a dummy example:
>>=20
>>     let head: bindings::list_head =3D ...;
>>=20
>>     // SAFETY: list_head always corresponds to the `list` member of
>>     // `type_embedding_list_head`.
>>     let conv =3D |head: *mut bindings::list_head| unsafe {
>>         crate::container_of!(head, type_embedding_list_head, list)
>>     };
>>=20
>>     // SAFETY: ...
>>     unsafe { Clist::from_raw(head, conv) }
>>=20
>> Then `conv` would be passed down to the `ClistIter` so it can return
>> references to the correct type.
>>=20
>> By doing so you can remove the `ClinkList` and `FromListHead` traits,
>> the `impl_from_list_head` and `clist_iterate` macros, as well as the
>> hidden ad-hoc types these create. And importantly, all unsafe code must
>> be explicitly specified in an `unsafe` block, nothing is hidden by
>> macros.
>>=20
>> This approach works better imho because each `list_head` is unique in
>> how it has to be iterated: there is no benefit in implementing things
>> using types and traits that will only ever be used in a single place
>> anyway. And if there was, we could always create a newtype for that.
>
> I agree with your safety concerns, indeed it is possible without any safe=
ty
> comments to build iterators yielding objects of random type. I think the =
conv
> function is a good idea and with the addition of unsafe blocks within the=
 conv.
>
> One thing I am concerned is with the user interface. I would like to keep=
 the
> user interface as simple as possible. I am hoping that with implementing =
your
> idea here on this with the closure, we can still keep it simple, perhaps =
getting
> the assistance of macros. I will give it a try.

We should be able to build more convenient interfaces on top of this
closure-based design (hopefully without the help of macros).

But first, one needs to recognize that this Clist interface is not your
regular, easy-to-use Rust interface - it is designed for specific cases
where we need to interact with C code and do unsafe things anyway.

Still, the most common (maybe even the only?) conversion pattern will be
"substract an offset from the address of this list_head and cast to this
type". Instead of expressing this through a closure using
`container_of`, maybe we can have a dedicated constructor for these
cases:

  pub unsafe from_raw_and_offset<const LIST_OFFSET: usize>(ptr: *mut bindin=
gs::list_head) ->  Clist<'a, T, ...>

`LIST_OFFSET` could be specified by callers using the `offset_of` macro.
This method would then call the more generic `from_raw` constructor,
passing the right closure. And with that you have a more convenient
interface. :)

>
>> Also as I suspected in v1 `Clist` appears to do very little apart from
>> providing an iterator, so I'm more convinced that the front type for
>> this should be `ClistHead`.
>
> This part I don't agree with. I prefer to keep it as `Clist` which wraps =
a
> sentinel list head. A random `ClistHead` is not necessarily a sentinel.

I expressed myself poorly - what I meant of that `ClistHead` should be
the only type you need for the low-level iteration (which should not be
public).

And if Clist ends up just being a provider for a ClistIterator, you
might just as well return a ClistIterator from the beginning. Anyway,
collapsing the two types into one can be done after the design matures
if it turns out to be the right thing to do, so feel free to keep both
for now.
