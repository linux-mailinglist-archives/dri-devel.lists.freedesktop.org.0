Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4082FBE1B2F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E6310E2D1;
	Thu, 16 Oct 2025 06:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c8cWJyxu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013018.outbound.protection.outlook.com
 [40.93.201.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF14D10E2D1;
 Thu, 16 Oct 2025 06:24:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0b64n7eMCRySiIAROAJgnCwDCud9jTFBHoPWoIZlvfeiWTrDsAT9US0W1IloHlXgMmqlpqLOOO7LKoDADjPJlseEkUDK1ol7AsOy3DCd0+laaWaN4+ik/g9ktJLHWiDTq3MEY6Mz70fq14L4xfcDdqoAlsYQ7PsbGB7Wd+Hk3pI3Lb0eD6sjyvGddTK6OZFoKvUq0ikNMeLPfy/vjHWwMZ8TT46lM+udWlLz++5uGobNp+aAHR2ovBE2kq8LdRbXQxIpyQtyPCzBHkZnJRjRxLu/a/yVJKP5Ijk6dRhckpn7fuwcGTCOrNX3QHfFIJhUe0BMk0ilEIf+JqKeXQgYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SnXMLVjVRUh4TjuhhlDnBTGRzmeO3TfXzwNlpqryQo=;
 b=CWOl9SPLll76W6F+m5+PcVj3DjNQ7inuy7nxFQr8aD5P3wB9hw66aCq5pGS84nsOFOxg7WfObfyB9cCuK9VYjtTL0rMsRuUbSPwMhFDREbTcsowGDvuRtcmOp8YMkrCgsDMdq4Cy6h1EWdDwfY9AYM2GMqDbxv3ZwYF2ehfubFTOrXPGQIx62P6CQ/UzIEgiUysB6q1IG21AZ/Z+ZcARKEqm7HoPvdiI6zD6qCwgZR5OsbhiIzNd3xLQOrikd1AZo/MwpK0JNN7sm51j/iSdJsQmS14z9dKHk8xFnSMG7SLbHp1K7/VmI5r1AF02CBitvIXtmSSyDyKEv0DbaTdmXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SnXMLVjVRUh4TjuhhlDnBTGRzmeO3TfXzwNlpqryQo=;
 b=c8cWJyxuvXJ56Eg1RVIrLeDeKFNgudN/mwN5M5dWd1dOdT6a2Zrr6g2UZc9ImbQD6x3DfR9r0aX16XHD7l+DkohKG/9xAyAb2ZiO5xonpwRxP6HvPzk+ZI9gEJtlVYqnMEKHMEyV/grnWxq4txadfAY5jKKzNXBfS0HhVxsZlUqRYEBJiU3EcU/1MjPPv0bp04r2lE4Tj+95JxligZuxBoNZ7nzHd84kvUo4vZqcwHQ1FINgChkimu2Bh3EDTVzcF/OuRQtEEqBv75TSvt0FoEvLNkPjRHJCDNv37LYdRjGV6atZ3W1glQsWa7CDvbgEVXSmG9k8mpI/0dVOEO1V7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 06:24:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 06:24:00 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 15:23:57 +0900
Message-Id: <DDJJ4Y320YEC.O6QIUDDLFVOH@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 06/14] gpu: nova-core: Add GSP command queue bindings
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-7-apopple@nvidia.com>
In-Reply-To: <20251013062041.1639529-7-apopple@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0020.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b653e3-d0b3-4781-fe65-08de0c7c984f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnBUWVp5NklUNEtsVzl4ZFdwM3R1VlVNaktqOCtZSzRJRkpFeVZXdnR6VHZx?=
 =?utf-8?B?QjdUQ2kzcHpOUzZzSThSbnRVVnRadk00WXIwaWtlYytpM3dsK0pObVRKY3dR?=
 =?utf-8?B?QzlqQnVibUNVVHZTeGJ2UDZrbXdIa29ZbXVhZTRrOUFXc1MrbGdwQ2hNYVU2?=
 =?utf-8?B?c0VNZ3VNOS9YVVBzZzhMR09nQXJCTVdSTHg0cEdIVGtXTHBkeGdObUFWVWZO?=
 =?utf-8?B?bkRaUXdHbHIzSUNtVkpnRXhWL0h3YitEbXdYYkJ3dlV6RVZGQkJFczkrU0RE?=
 =?utf-8?B?aG90bFcvWEhCZ0YwY3FIK3NNcWhWWXZHSnVpRzA5S2t6R3pGWHVNbDZzNVpO?=
 =?utf-8?B?aUEwUWZJN0RZVFhrbWsyMjFuZm5QOE9tcTRtaG44dEg2eFN3b3ZpS21Gczcz?=
 =?utf-8?B?TXl4a3h5UUVOTzNhOVFVQXozZEJvbTB0U2wwK2JCa29UOVpwWjlxS3JsTjdt?=
 =?utf-8?B?MEx2cFFseSsxNzc3aFNBYVVtYzdIM0hnWjJxWVNJcytEcmRXSWFxTmlUdnNL?=
 =?utf-8?B?cE4vNXRJNWszeEJaS0V1Sjg2TDlub013VlZlYktyTWp2V0xuU3BCeEVNVVZz?=
 =?utf-8?B?WnhZWTRpVlBreFVkSkI1VklWa2lRNTBxRlFUcEFSeVdBSFlwdFlzejlWMGFF?=
 =?utf-8?B?OGRHVDlmdU5GWnh0RkdvaEVhQ1J2NmhhUGlxK3V3dVhlSmM4Qk0yUDh5Y3py?=
 =?utf-8?B?R1pUM21KWDlFeHhZZFRYWWNScGRJMnZKelVUaU9hRjd6ZHoycDNqenN0Uy9D?=
 =?utf-8?B?SjR0a3lPVDV3Z0p3MjAxK1drM0pDdG9YQk1yL0N1b1g2dXVmRlZ2RFl6UENy?=
 =?utf-8?B?cStDNzg1bnVNd1dHY3BNRlVUN0tSMXFoQ25TZitLcjJWcGJXeXh5REtleTBB?=
 =?utf-8?B?ZzZyTjY1NzdUSldmd1oxMnBZWW0xeGVsRVdHbWVuMVlVSWkzTE1IVlMxdTRM?=
 =?utf-8?B?RGlpVHROTERnZ2MzbXdtc3hVRUtIU3NOb0Y0dWRLeGtpNVV4MExIMERwS1Yr?=
 =?utf-8?B?OElRNkU0RnFhTDNSZ1dRSVJEbzFQbkNqZEd2VzZyTUZiZVJNTklCQS9jYmsx?=
 =?utf-8?B?aVlhd05XQjErcWxGOXBqdFlacTlkNTVJcDcwRGdlZ09KT2cyN2FCOFNWbHJh?=
 =?utf-8?B?eDVBZ2pVMldDWVNTV0tiblJ0T0ppSWt3Y2t4dkRLWHdVV0Y2VlFnZ0V4VzBE?=
 =?utf-8?B?bWN5dXdSbWVqbS9RZkJ2Y2UvcTB5WkVzcXdQYVNadDhqWXgwS3YzdnExNC9q?=
 =?utf-8?B?RC9jWGJrTFpLMG1JbTdCalJGWnB1MG9LQnJLWW5tMTROR1JZdEkxK3crZDI3?=
 =?utf-8?B?VGdTUmlSOHowMzhYNWUxRUZ4dXpzMCs1aFRNQzNkRnU4cFdoSVJhT0VXQjcz?=
 =?utf-8?B?ZWJTaytIWFE4UVQ5ZU9wb2RRRWFOWm5jMlpHeVRpS0dDeGczM2swOTA1dmNj?=
 =?utf-8?B?bWlrQmVBRXk1TGp6SHk1c29JNUQ2amtGRWx0ZEd5NytBejB2QXlBWjMwSlZU?=
 =?utf-8?B?c1lsa0Ywb01jUFJ1elpIdE5XYmJJclNWUXNXZFpXMEJTV2FXeVZBTkgwTDIz?=
 =?utf-8?B?QXg3SVVGcjR3TXkySGx2SE1jTDIwamlVc09HZ1owTWRQRGY2M0VwUk9aMk5h?=
 =?utf-8?B?dDdXa2NReGpGTEUxN01UcnZuZklZLzF3bWNReExHaG9WUm9HdDJHRzlvcVhY?=
 =?utf-8?B?YVQ3VXg3UGxCUmlYZlcrTnkwb1dwMGVsVklsSEJqSW9iYUEwd1BTc3p4TkFV?=
 =?utf-8?B?bTkwSU8zWG9jK3RYRDI1bUd1d01kUVJQWjVRTjFtbytPNFo0S0pjSUVENGdy?=
 =?utf-8?B?MHRmYmFuMHhZVnVwQXZ5cDh0MjVRWTRPa1U0OSs0RHgycWdLY1k2ZEdrMWh4?=
 =?utf-8?B?M2J6TEpid0Qrem1hRkZ5MEs0WTZSUUNyQ3IvZk15eG4xS01FcWpQUzJUYXRt?=
 =?utf-8?Q?YhCFD3Qxm3XI+Cr3wntcxCOHPlVLbkKI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTBWMUpiaWtKdXRETlVwTXQrOU9ySEFhM2UrMWlnREpad0VxVE55bWtmSC9S?=
 =?utf-8?B?b2xRQis0Vy9oWVVSS3NXZHJqL1NUVEtpdVJFZGtTcDVFOFZiamowRk5XWlls?=
 =?utf-8?B?MTRMVDNNbmFRTDJPTU0yaCtaTXFYdytBOHR0ODhORmF4MW5YTzBjVWZxd1dK?=
 =?utf-8?B?YnB0WFpOc3ZTWlN6N09pVm43ek9FVUhNM3dwREsxZFhpYnpKWnNnbUpiYmYy?=
 =?utf-8?B?NVBhNWkzQWh5NVVta0RncExKR3ZHOG4zRmpiTm81b3NZbEZONjlncHdHTUpB?=
 =?utf-8?B?S3lDa0NGVGNsZ3BNNFZweGp0RTd4dzNGRDliZjlNaFAzYi9aMnBaNkFNZnA0?=
 =?utf-8?B?ZXVCV1JWS0syUUZhNFZqR2NkRnVYUU5sekZsNnZzcjBBTkRiV0NpcWxOS1hJ?=
 =?utf-8?B?ZHE4dHZZdkJLcjNOTVFXb0hPa1g0bjcvaCtYUkN4RGpMU2dReXo2SnZ3dVhN?=
 =?utf-8?B?cHF1eUpVUm5yZzJMVG1qaGpvWHpNU0ZkQVVQUUl5dkg1N05TWXZUVmpxc0w0?=
 =?utf-8?B?dllOdStJalppeWRIV3huWTFpRVowb1A4eFkwZGN2aEt3RjFwQ2xWZGFtS2FT?=
 =?utf-8?B?QnV2QmsvTTV2THZsTEtKUEkyRjFJVnRlaklzeUtZSVJ0OTlONEUrWnk2T25r?=
 =?utf-8?B?RWE5UUFaUjBRK3BJaTFFaFJDWDN0MENyc3Z2QjkwckJaU0V0ZGg0ZS9jRWRy?=
 =?utf-8?B?cTdkL20yc29pYWFoNU51NGpNTTM0N2p6RE9xSEpQanNRc2JjVkY1ajY0YUtn?=
 =?utf-8?B?aHRUTTU3VjZrMGlwL09HUGJhVGVlSFhkK2FNWVZCV1cwMEdJWGxnNzVobEVU?=
 =?utf-8?B?UnJqUVd5THdqZTR4TDFHNVhsNnVzQlVIR2NPSVFvbGlkOFJZSEJQbERHVkhD?=
 =?utf-8?B?MXdpdXEwT0MveDBPUC9HNGYyVGhYVVVxTEUzL1JETitNUzdOSFJkOE9mSnJU?=
 =?utf-8?B?bHBSYUxoZDh4bWtIUXppYklTYU9VYmlkeDgybXJLanhXUzR3QjdFcDdnV09h?=
 =?utf-8?B?WmIxcUZueVNZZFlPTVh3WlVuNndyWUZERmF6akhONzZkU2RnYlFMN095dUFq?=
 =?utf-8?B?WFBaMU93WTRUL2hlS20zdm4vbUxCRHdPZXArTWh0NTB3eitBMGx5bSs2TmFu?=
 =?utf-8?B?V3c5MUViaUZMNGd6WkhsYm9lK0xueWVCaDdIZjFSdFNsU1FHNEV0TzdERm5h?=
 =?utf-8?B?dWM1NHVsZFdkaHhRQ1I4OFJ6eHVzMmlEYjVlVlRSRzl3cjhDc0dycGtQNGJQ?=
 =?utf-8?B?eEd5emNGSlN0MVpkeE9rQWx3a1NQTG9uM1NCOEN4RlZBMDA2SlFDcHBmQlMv?=
 =?utf-8?B?ZEtGYWlWeXJEL3pQbXNHZjNOVkY3ejMyUXkzbUJZVGhKYzczbEV3RlFoSUtX?=
 =?utf-8?B?UXJEb0IvdjdmaENldGl2bFdWMDlGTEw0RzdxY3pjZnQ2MU9rRnpqOGJ2d0h3?=
 =?utf-8?B?bXlzS0hyRy9RYUhhdHBQa0R5UTZsWGhKY1ZPM0lsaVNQVE5mdUxtNmptaCtE?=
 =?utf-8?B?SjVaemhidTE5M282M3l5cDI0Q3RnOTdDSlhPeVVyMGZlM3FxdHBtM0c4OStK?=
 =?utf-8?B?UE9LazdORWJuNXoyVmhDSDl6TnFsNnBtQWNKWTA3M1cvU2RkMENjQnVNaGY2?=
 =?utf-8?B?MXNub2hFK2hsUUFGU05EcmRlemtZejZZUTFDQStFR3BkdmVoeGdkck0xcVZr?=
 =?utf-8?B?ejJmR096K0xqc1VxSWN3V0JMZDI1L3BMckJtcWp5QmM2WThybU4wRmwzUnFj?=
 =?utf-8?B?QU1rRlhkV3pLYkFIMnRIQmVQR2d3ZnZTMi9mbC9vcmltYnRPTFJDcUNJTUtT?=
 =?utf-8?B?czRheVRiaW50L3BrNjU0dFo3ZzFjQVdHWGNUb2JabXVaWTZWbEJUOStjNWFI?=
 =?utf-8?B?ZzlKQVhrT0pnZEp4Ri82cGN5SS9uQTQrRkFFNmt0VDh4ZXBMMEQzMEFMaGdw?=
 =?utf-8?B?bTQ5ek1YY0hHTEx6N3JSbW5jNG9MMHdnZzZibHZ6RGxnMGhMYk8vb2tqb1Nl?=
 =?utf-8?B?d2ZIVnh4TUVMNi9aZUdpcWJGdVBobklySVNRbk8ySld2Yjg1dnNSTWQ4OWlm?=
 =?utf-8?B?eThRclNRTWdQNURZQnRUM0dBcGtyekUzemQzWkg1LytoZmZIaytwNUFSc2U1?=
 =?utf-8?B?L0VFMWVvOEU5dnExTHh6UWs2UWUrQTJnTUI1NjlLMlNSSllGT2M4NUphd2Z0?=
 =?utf-8?Q?ZXtlGmWBK0qCNNwhVFY89TW+oCTFIL6Y+rJYvxA9ZuOd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b653e3-d0b3-4781-fe65-08de0c7c984f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:24:00.5903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TAyqFxslWGTkZiHHYUkY3JN2V1xdAsA+UaNMgOhB2/j8hGq4yKFH8C/J+00MKJtpxMeI4HBdlHCDTDtVspgeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603
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

On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
> Add bindings and accessors used for the GSP command queue.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

There are lots of unused warnings when building on this commit. I know
we don't like big patches, but since this is semantically related to the
next one and the two touch different files anyway, how about merging
them? IMHO this is preferable to adding lots of `#[expect(unused)]` that
we are going to remove right after.

If you have been told to split in a previous version, let's just add a
the `#[expect(unused)]`  where needed.

>
> ---
>
> Changes for v5:
>  - Derive the Zeroable trait for structs and enums
>
> Changes for v4:
>  - Don't panic the kernel if trying to initialise a large (> 4GB)
>    message header.
>  - Use `init!` to provide safe and complete initialisers.
>  - Take an enum type instead of a u32 for the function.
>
> Changes for v3:
>  - New for v3
> ---
>  drivers/gpu/nova-core/gsp/fw.rs               | 275 +++++++++
>  .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 541 ++++++++++++++++++
>  2 files changed, 816 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index 1cc992ca492c..a2ce570ddfaf 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -5,6 +5,7 @@
>  // Alias to avoid repeating the version number with every use.
>  use r570_144 as bindings;
> =20
> +use core::fmt;
>  use core::ops::Range;
> =20
>  use kernel::dma::CoherentAllocation;
> @@ -16,6 +17,7 @@
>  use crate::firmware::gsp::GspFirmware;
>  use crate::gpu::Chipset;
>  use crate::gsp::FbLayout;
> +use crate::gsp::GSP_PAGE_SIZE;
> =20
>  /// Dummy type to group methods related to heap parameters for running t=
he GSP firmware.
>  pub(crate) struct GspFwHeapParams(());
> @@ -158,6 +160,120 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_la=
yout: &FbLayout) -> Self {
>      }
>  }
> =20
> +#[derive(PartialEq)]
> +pub(crate) enum MsgFunction {
> +    // Common function codes
> +    Nop =3D bindings::NV_VGPU_MSG_FUNCTION_NOP as isize,
> +    SetGuestSystemInfo =3D bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYST=
EM_INFO as isize,
> +    AllocRoot =3D bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT as isize,
> +    AllocDevice =3D bindings::NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE as isize=
,
> +    AllocMemory =3D bindings::NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY as isize=
,
> +    AllocCtxDma =3D bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA as isiz=
e,
> +    AllocChannelDma =3D bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA=
 as isize,
> +    MapMemory =3D bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY as isize,
> +    BindCtxDma =3D bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA as isize,
> +    AllocObject =3D bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT as isize=
,
> +    Free =3D bindings::NV_VGPU_MSG_FUNCTION_FREE as isize,
> +    Log =3D bindings::NV_VGPU_MSG_FUNCTION_LOG as isize,
> +    GetGspStaticInfo =3D bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_I=
NFO as isize,
> +    SetRegistry =3D bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY as isize=
,
> +    GspSetSystemInfo =3D bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_I=
NFO as isize,
> +    GspInitPostObjGpu =3D bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_O=
BJGPU as isize,
> +    GspRmControl =3D bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL as is=
ize,
> +    GetStaticInfo =3D bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO as =
isize,
> +
> +    // Event codes
> +    GspInitDone =3D bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE as isize,
> +    GspRunCpuSequencer =3D bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUE=
NCER as isize,
> +    PostEvent =3D bindings::NV_VGPU_MSG_EVENT_POST_EVENT as isize,
> +    RcTriggered =3D bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED as isize,
> +    MmuFaultQueued =3D bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED as i=
size,
> +    OsErrorLog =3D bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG as isize,
> +    GspPostNoCat =3D bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD a=
s isize,
> +    GspLockdownNotice =3D bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTIC=
E as isize,
> +    UcodeLibOsPrint =3D bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT as=
 isize,
> +}

Can we split functions and events into distinct types? Their bindings
even have different prefixes.

Also, rather than casting these all as `isize`, I'd suggest making the
type `#[repr(u32)]`. We don't need negative values here.

> +
> +impl fmt::Display for MsgFunction {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        match self {
> +            // Common function codes
> +            MsgFunction::Nop =3D> write!(f, "NOP"),
> +            MsgFunction::SetGuestSystemInfo =3D> write!(f, "SET_GUEST_SY=
STEM_INFO"),
> +            MsgFunction::AllocRoot =3D> write!(f, "ALLOC_ROOT"),
> +            MsgFunction::AllocDevice =3D> write!(f, "ALLOC_DEVICE"),
> +            MsgFunction::AllocMemory =3D> write!(f, "ALLOC_MEMORY"),
> +            MsgFunction::AllocCtxDma =3D> write!(f, "ALLOC_CTX_DMA"),
> +            MsgFunction::AllocChannelDma =3D> write!(f, "ALLOC_CHANNEL_D=
MA"),
> +            MsgFunction::MapMemory =3D> write!(f, "MAP_MEMORY"),
> +            MsgFunction::BindCtxDma =3D> write!(f, "BIND_CTX_DMA"),
> +            MsgFunction::AllocObject =3D> write!(f, "ALLOC_OBJECT"),
> +            MsgFunction::Free =3D> write!(f, "FREE"),
> +            MsgFunction::Log =3D> write!(f, "LOG"),
> +            MsgFunction::GetGspStaticInfo =3D> write!(f, "GET_GSP_STATIC=
_INFO"),
> +            MsgFunction::SetRegistry =3D> write!(f, "SET_REGISTRY"),
> +            MsgFunction::GspSetSystemInfo =3D> write!(f, "GSP_SET_SYSTEM=
_INFO"),
> +            MsgFunction::GspInitPostObjGpu =3D> write!(f, "GSP_INIT_POST=
_OBJGPU"),
> +            MsgFunction::GspRmControl =3D> write!(f, "GSP_RM_CONTROL"),
> +            MsgFunction::GetStaticInfo =3D> write!(f, "GET_STATIC_INFO")=
,
> +
> +            // Event codes
> +            MsgFunction::GspInitDone =3D> write!(f, "INIT_DONE"),
> +            MsgFunction::GspRunCpuSequencer =3D> write!(f, "RUN_CPU_SEQU=
ENCER"),
> +            MsgFunction::PostEvent =3D> write!(f, "POST_EVENT"),
> +            MsgFunction::RcTriggered =3D> write!(f, "RC_TRIGGERED"),
> +            MsgFunction::MmuFaultQueued =3D> write!(f, "MMU_FAULT_QUEUED=
"),
> +            MsgFunction::OsErrorLog =3D> write!(f, "OS_ERROR_LOG"),
> +            MsgFunction::GspPostNoCat =3D> write!(f, "NOCAT"),
> +            MsgFunction::GspLockdownNotice =3D> write!(f, "LOCKDOWN_NOTI=
CE"),
> +            MsgFunction::UcodeLibOsPrint =3D> write!(f, "LIBOS_PRINT"),
> +        }
> +    }
> +}
> +
> +impl TryFrom<u32> for MsgFunction {
> +    type Error =3D kernel::error::Error;
> +
> +    fn try_from(value: u32) -> Result<MsgFunction> {
> +        match value {
> +            bindings::NV_VGPU_MSG_FUNCTION_NOP =3D> Ok(MsgFunction::Nop)=
,
> +            bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO =3D> {
> +                Ok(MsgFunction::SetGuestSystemInfo)
> +            }
> +            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT =3D> Ok(MsgFunctio=
n::AllocRoot),
> +            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE =3D> Ok(MsgFunct=
ion::AllocDevice),
> +            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY =3D> Ok(MsgFunct=
ion::AllocMemory),
> +            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA =3D> Ok(MsgFunc=
tion::AllocCtxDma),
> +            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA =3D> Ok(Msg=
Function::AllocChannelDma),
> +            bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY =3D> Ok(MsgFunctio=
n::MapMemory),
> +            bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA =3D> Ok(MsgFunct=
ion::BindCtxDma),
> +            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT =3D> Ok(MsgFunct=
ion::AllocObject),
> +            bindings::NV_VGPU_MSG_FUNCTION_FREE =3D> Ok(MsgFunction::Fre=
e),
> +            bindings::NV_VGPU_MSG_FUNCTION_LOG =3D> Ok(MsgFunction::Log)=
,
> +            bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO =3D> Ok(M=
sgFunction::GetGspStaticInfo),
> +            bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY =3D> Ok(MsgFunct=
ion::SetRegistry),
> +            bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO =3D> Ok(M=
sgFunction::GspSetSystemInfo),
> +            bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU =3D> {
> +                Ok(MsgFunction::GspInitPostObjGpu)
> +            }
> +            bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL =3D> Ok(MsgFun=
ction::GspRmControl),
> +            bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO =3D> Ok(MsgFu=
nction::GetStaticInfo),
> +            bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE =3D> Ok(MsgFunctio=
n::GspInitDone),
> +            bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER =3D> {
> +                Ok(MsgFunction::GspRunCpuSequencer)
> +            }
> +            bindings::NV_VGPU_MSG_EVENT_POST_EVENT =3D> Ok(MsgFunction::=
PostEvent),
> +            bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED =3D> Ok(MsgFunction=
::RcTriggered),
> +            bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED =3D> Ok(MsgFunc=
tion::MmuFaultQueued),
> +            bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG =3D> Ok(MsgFunction=
::OsErrorLog),
> +            bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD =3D> Ok(Ms=
gFunction::GspPostNoCat),
> +            bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE =3D> Ok(MsgF=
unction::GspLockdownNotice),
> +            bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT =3D> Ok(MsgFun=
ction::UcodeLibOsPrint),
> +            _ =3D> Err(EINVAL),
> +        }
> +    }
> +}

This is another place where the `TryFrom` macro will shine. :)

> +
>  /// Struct containing the arguments required to pass a memory buffer to =
the GSP
>  /// for use during initialisation.
>  ///
> @@ -208,3 +324,162 @@ fn id8(name: &str) -> u64 {
>          }))
>      }
>  }
> +
> +#[repr(transparent)]
> +pub(crate) struct MsgqTxHeader(bindings::msgqTxHeader);

Short documentation please (`MsgqRxHeader` provides a template).

> +
> +impl MsgqTxHeader {
> +    pub(crate) fn new(msgq_size: u32, rx_hdr_offset: u32, msg_count: u32=
) -> Self {
> +        Self(bindings::msgqTxHeader {
> +            version: 0,
> +            size: msgq_size,
> +            msgSize: GSP_PAGE_SIZE as u32,
> +            msgCount: msg_count,
> +            writePtr: 0,
> +            flags: 1,
> +            rxHdrOff: rx_hdr_offset,
> +            entryOff: GSP_PAGE_SIZE as u32,
> +        })
> +    }
> +
> +    pub(crate) fn write_ptr(&self) -> u32 {
> +        let ptr =3D (&self.0.writePtr) as *const u32;
> +
> +        // SAFETY: This is part of a CoherentAllocation and implements t=
he
> +        // equivalent as what the dma_read! macro would and is therefore=
 safe
> +        // for the same reasons.
> +        unsafe { ptr.read_volatile() }
> +    }
> +
> +    pub(crate) fn set_write_ptr(&mut self, val: u32) {
> +        let ptr =3D (&mut self.0.writePtr) as *mut u32;
> +
> +        // SAFETY: This is part of a CoherentAllocation and implements t=
he
> +        // equivalent as what the dma_write! macro would and is therefor=
e safe
> +        // for the same reasons.
> +        unsafe { ptr.write_volatile(val) }
> +    }
> +}

These methods should also be succintly documented imho.

> +
> +// SAFETY: Padding is explicit and will not contain uninitialized data.
> +unsafe impl AsBytes for MsgqTxHeader {}
> +
> +/// RX header for setting up a message queue with the GSP.
> +#[repr(transparent)]
> +pub(crate) struct MsgqRxHeader(bindings::msgqRxHeader);
> +
> +impl MsgqRxHeader {
> +    pub(crate) fn new() -> Self {
> +        Self(Default::default())
> +    }
> +
> +    pub(crate) fn read_ptr(&self) -> u32 {
> +        let ptr =3D (&self.0.readPtr) as *const u32;
> +
> +        // SAFETY: This is part of a CoherentAllocation and implements t=
he
> +        // equivalent as what the dma_read! macro would and is therefore=
 safe
> +        // for the same reasons.
> +        unsafe { ptr.read_volatile() }
> +    }
> +
> +    pub(crate) fn set_read_ptr(&mut self, val: u32) {
> +        let ptr =3D (&mut self.0.readPtr) as *mut u32;
> +
> +        // SAFETY: This is part of a CoherentAllocation and implements t=
he
> +        // equivalent as what the dma_write! macro would and is therefor=
e safe
> +        // for the same reasons.
> +        unsafe { ptr.write_volatile(val) }
> +    }
> +}

Documentation here as well.

> +
> +// SAFETY: Padding is explicit and will not contain uninitialized data.
> +unsafe impl AsBytes for MsgqRxHeader {}
> +
> +impl bindings::rpc_message_header_v {
> +    pub(crate) fn init(cmd_size: u32, function: MsgFunction) -> impl Ini=
t<Self, Error> {

This method can be kept private.

> +        type RpcMessageHeader =3D bindings::rpc_message_header_v;
> +        try_init!(RpcMessageHeader {
> +            // TODO: magic number
> +            header_version: 0x03000000,

Let's resolve this TODO by declaring a constant or even better,
adding the relevant bindings symbol if there is one.

> +            signature: bindings::NV_VGPU_MSG_SIGNATURE_VALID,
> +            function: function as u32,

This `as` is ok once we set `MsgFunction` to have a `u32`
representation, but...

> +            length: (size_of::<Self>() as u32)

... at the risk of sounding too pedantic, we probably want to do the
arithmetic on the `usize`, and then do a `try_into` u32 to remove this
use of `as` here:

    length: size_of::<Self>()
        .checked_add(cmd_size)
        .ok_or(EOVERFLOW)
        .and_then(|v| v.try_into().map_err(|_| EINVAL))?,

This also requires changing the `cmd_size` to `usize`, which is actually
better as that's also the type used by the caller anyway, so this
removes another conversion.

> +                .checked_add(cmd_size)
> +                .ok_or(EOVERFLOW)?,
> +            rpc_result: 0xffffffff,
> +            rpc_result_private: 0xffffffff,
> +            ..Zeroable::init_zeroed()
> +        })
> +    }
> +}
> +
> +// SAFETY: We can't derive the Zeroable trait for this binding because t=
he
> +// procedural macro doesn't support the syntax used by bindgen to create=
 the
> +// __IncompleteArrayField types. So instead we implement it here, which =
is safe
> +// because these are explicitly padded structures only containing types =
for
> +// which any bit pattern, including all zeros, is valid.
> +unsafe impl Zeroable for bindings::rpc_message_header_v {}
> +
> +#[repr(transparent)]
> +pub(crate) struct GspMsgElement {
> +    inner: bindings::GSP_MSG_QUEUE_ELEMENT,
> +}

Small documentation needed.

> +
> +impl GspMsgElement {
> +    #[allow(non_snake_case)]
> +    pub(crate) fn init(
> +        sequence: u32,
> +        cmd_size: usize,
> +        function: MsgFunction,
> +    ) -> impl Init<Self, Error> {
> +        type RpcMessageHeader =3D bindings::rpc_message_header_v;
> +        type InnerGspMsgElement =3D bindings::GSP_MSG_QUEUE_ELEMENT;
> +        let init_inner =3D try_init!(InnerGspMsgElement {
> +            seqNum: sequence,
> +            elemCount: size_of::<Self>()
> +                .checked_add(cmd_size)
> +                .ok_or(EOVERFLOW)?
> +                .div_ceil(GSP_PAGE_SIZE) as u32,

Let's chain a call to `try_into` here as well.

> +            rpc <- RpcMessageHeader::init(cmd_size as u32, function),

... and thanks to the change suggested 3 blocks above, this `as` is no
longer needed.

> +            ..Zeroable::init_zeroed()
> +        });
> +
> +        try_init!(GspMsgElement {
> +            inner <- init_inner,
> +        })
> +    }
> +
> +    pub(crate) fn set_checksum(&mut self, checksum: u32) {
> +        self.inner.checkSum =3D checksum;
> +    }
> +
> +    // Return the total length of the message, noting that rpc.length in=
cludes
> +    // the length of the GspRpcHeader but not the message header.
> +    pub(crate) fn length(&self) -> u32 {
> +        size_of::<Self>() as u32 - size_of::<bindings::rpc_message_heade=
r_v>() as u32
> +            + self.inner.rpc.length
> +    }

We can save ourselves a bunch of `as` conversions in the following patch
if we make this method just return `usize`. The only one needed will be
for `self.inner.rpc.length` to `usize`, we really ought to have
non-fallible converters for things like this that obviously cannot fail.

> +
> +    pub(crate) fn sequence(&self) -> u32 {
> +        self.inner.rpc.sequence
> +    }
> +
> +    pub(crate) fn function_number(&self) -> u32 {
> +        self.inner.rpc.function
> +    }
> +
> +    pub(crate) fn function(&self) -> Result<MsgFunction> {
> +        self.inner.rpc.function.try_into()
> +    }
> +
> +    pub(crate) fn element_count(&self) -> u32 {
> +        self.inner.elemCount
> +    }
> +}

Documentation needed for these too.

