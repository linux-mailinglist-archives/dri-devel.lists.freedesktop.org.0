Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13892C18F14
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4E510E733;
	Wed, 29 Oct 2025 08:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WBB6rQmg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012066.outbound.protection.outlook.com [52.101.53.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C10B10E72F;
 Wed, 29 Oct 2025 08:18:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=joWIucI9iddBw6VyJMZVVkAt6e4vktWIx16iE+eDkbdciVHOfbWmKBNkV/D1IKIfaKJVS72+Q0bc/V2uefcyBlD9tqpkCtPdOYdYxRlJA3BLOznlr9W8CilGPKuDgFPcPEGwQBvkvRwQiK4sWjgOJfuGdTBFfB12lHWmGwTkXVcTKLwvb6dr0TeMPcER3WUZu4UYhkYvoaQsPyXqF6f3vtZojC3MuzBK5xS9+/I/QeYJwkEe8VXabBgeEAu2rj8P5eS87ymSJywy2AGhnj26jxlNELxQiphs+LVpOINPG4KtMW6X7rbBiLsHwHD5cznOTz7f4C+eY9JvFPv8UeddxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTOeWkfEWgaEgmnWxQBiwuGTiMa0KISwtqPSPPi7J1g=;
 b=CI5JaGMyq9t0Sit+T/p/tj1biUsNdEfyjlVlgwa63Fzmp0azjk264F/a80Zanfewbpc9VtjTOli6j1QSX4xlXbwY6vVdtZ+APIMgMO2JBrqf//DrEa+mZkitArTKNNff8fyP5qZxFAJAJRR+gV8GjvqLqcLuBBuWv7Zv2EPGHz69KqNNseN8awpH4x7i6lEM/E/ztXnWWDoV5rii/1OqYaHY7JUFCl1j81cUso9+Lw1V8cySgBSPxebx7KFONfWDXKD2OLZDlp0GXZM10ehIt1gAq3UZYSolo+MS/aVVnHUfrPEFsi7L47yKMVai6GwJeKkPq9a7q7+kPeD/SYf/Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTOeWkfEWgaEgmnWxQBiwuGTiMa0KISwtqPSPPi7J1g=;
 b=WBB6rQmgR/xPTDFHSC9z/005oFFznGW1g9x6SuRJTC670OZwqrSab13luEZkjGFra4EmsMXO4zf/2YXZvK9ZFFigDczavmnL7Ic4L7bl4LUSWktEvikluz7KivIynpwJ1mV585EGlyWJGJD8Wk8IaDBWoXIuqNm6z+1oBhuPY18OJ0P8syPzm6PCBypLHOlPxfYBT2AucbJE9YCRDKOJJNDr2OvPkTt1tCQ7O0KlerH2uAEoBQ+ogrqUPALSvkKbx/huLSX1YIpbANdSxooxRIvXjoi1U6kQ2DwLVuLNLXPUvhIR+nWkpFLlIZKdn8k++S7Vi6FGqRDn2/ySgBOwTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 08:17:58 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 08:17:58 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 17:16:35 +0900
Subject: [PATCH v7 08/14] rust: enable slice_flatten feature and abstract
 it through an extension trait
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gsp_boot-v7-8-34227afad347@nvidia.com>
References: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
In-Reply-To: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0013.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::19) To BY5PR12MB3986.namprd12.prod.outlook.com
 (2603:10b6:a03:195::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: a710c16a-6eb2-423e-8af3-08de16c3aa65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGg1WjlRRDN4QVhhZzMwUktIUXVYSm5iZmpkY1E5U3B3UEFzR1p6QnRuamV6?=
 =?utf-8?B?T0ZnNUg5OUMyaDBkQlJiZEw5T2s5UUoxODhwOEtHM05neEwvbTYwUHJHS1Yx?=
 =?utf-8?B?Nm5pWnRBMWk1TlRZbGM5c1kzamNRVXF1MVdab2s2VFpqeXFJZHlNODBzL2g0?=
 =?utf-8?B?NHJWK1VqWm1XYjhRUDdQL2ttR2h5RE90VDd5ZnlRSXY4czJCaEtsa01SakRN?=
 =?utf-8?B?TC9lSmtNbnZzYU5oNnd1cjQxUGR0VXZ6RnlRY0JRWUVtc1pmNjAvUVVUZm1z?=
 =?utf-8?B?cmVsbWc5a3plM2ZCVmJLSkRxeGZCUHNnVG1OQk5vZWNCNEdTRXFLL1pxcGhr?=
 =?utf-8?B?Skc5S0dqYU9weEM2ZThkQzhjZGUxVU5vZVRFWW1hOCt6RkJtdkowWGVZQ3Qv?=
 =?utf-8?B?NEU4eVBBb2F2dElMcCtrTHBRMXA3RzFkVEdLclN6VmtMZ3FEYlRtWXZEc2Nl?=
 =?utf-8?B?SjMrZ0pUVkdvTFZ5eHdRYTNRRnFaWlFZTnIzZTVWbWFrNitxZmN6TUN5OGtl?=
 =?utf-8?B?V044MWpjUC9EVFdIdUYwZW95Tjl6SjFjSGE0NEd4R0w5b1d3eElMRDlOa2Z6?=
 =?utf-8?B?dHdSby9BQ3BJcDVrb0QzbW1FaUVBOXJIb1pBUW1HWjBUaGIwZ2FCL2VkVGxp?=
 =?utf-8?B?bWw5M3R5N2dBUk5jNU9UUXUxMjFZY1NjaElzN2JGYllZOGJLMitIZW54alRj?=
 =?utf-8?B?WlJCem9LdlcwQVVNdFRJaVdpelZFNmoyQnZHNDhXWm5FRFROWjdmTTViaTJZ?=
 =?utf-8?B?blNQRndRdDhCdUg5ejQwejFRbThJSFNDL0h1aHE3T1gyQTA1TWNsRzhqWUZM?=
 =?utf-8?B?RUxLVHdNYlc2T01nV2l5SUI3TFlMVzVvakdOc3RIMnFKcmZLTjdRT2hnNTUw?=
 =?utf-8?B?REs1ajM3WlFlWW9BT1AxOXV4R09XdDgybi93UHlHVUZ1NDRvWHE0WjhNZEMw?=
 =?utf-8?B?WlJpRDdnTFJpeis0NU0raFV6UmJlRk5VZlVZWXl6NFFMMWVoTVJjN2Jxcms5?=
 =?utf-8?B?SFBDL2ZJTkhLUENEbXVDTUVaMG1UQ3lhb1JlS09LQ2ZmZWN0ZC9sZmhoanIw?=
 =?utf-8?B?WmFFUzhLZEhGdFV4SC9PdWJQMWZUOE51T2FZd1dVOStaNmo0M3RMV3RCY1hl?=
 =?utf-8?B?L21RNjI0S3BIQnpqSCthZDBlVGlRMjFmbHdZNjNnRW1GRUs4ZEVFOExhSHFL?=
 =?utf-8?B?SVJUS3pqRHFpUEhwQm5oUllRS2h3a21OMWN6aGJRNTQwazdsbmszTlZBNWlK?=
 =?utf-8?B?Ti9kK29wTENkMDZ6VkMxeW1IdzRFTml0MWtuenNUM2dGSmZpRFZ2aDJJOTEz?=
 =?utf-8?B?amdJdnhQMFZtZFRnVjBCcFNoaS9VWGRDcWJlZjJxcVp0M3kwSS9XMFJubDBl?=
 =?utf-8?B?MXZlMUp4YVFkRUNQNHJ2VFVQbnZJekpkNkVHeVR0azNZWm8reTFzNTU0WXpC?=
 =?utf-8?B?V0Jnc1hpQ2k5VlVOVklHLzlJVC9KOHY3N3VRdmJqS2JCeTlFZjdjV3BaOXh0?=
 =?utf-8?B?OUNkNTNvQkRtZWxDYXpLMnFwZDdyRDcva2d6VGppdERXZzdaZHJ1OVowWHVO?=
 =?utf-8?B?NEFEOEk3SmZGdlhJVkV0Zm1vbXVPd3BEejIwc2tBb2pJRjRzM1kvSFYwdW9Q?=
 =?utf-8?B?dG1FYTl5dEV3R1k2WTF6b01lemIwMFA4TGswaGR4VWdYRkJleFBZbHQwK0Vh?=
 =?utf-8?B?K2JvSGZOdTlJMC9LU09ERFUxUXhIa1JuQUVRVWhUZWQwbjd1VXoycVFSUEUr?=
 =?utf-8?B?ZkRna0JjTWx6TXdIT2Z5czR1L1FiZXg0WTVGdDhEb0lBZUlHTUp4dXdjMEVy?=
 =?utf-8?B?N1pPZWl6TUFGVVV1RG5NbEV1TVduYThsaC9sVUh6VWVDazZyRUVFbmN2U1RV?=
 =?utf-8?B?eXE0THplOGlDS0ZlU3lUVTI1ZzZ1NmFLUEkyZDFQQ0h6OS9lYVpZbmxnWE5N?=
 =?utf-8?B?VXpoR1o3N08wZ1Z0NkQrYzRpRTdPbWh1WUVCckZ5YXpXMmlDZUtuQ1hCVHp1?=
 =?utf-8?B?VGV0dXppS0trUzlFQlpYckR6eUNEeU03Ny9GSXdjczJldUM2OVgrVXErMVZB?=
 =?utf-8?Q?feDl5/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFB4Q1pYMmJleFhqM0daRm96cVl5NkovNm41enBwZm9Bbk9rdTBoTHNNM2tz?=
 =?utf-8?B?SjZVaXBrYXNWQmh2Y0orT084NWg2ZzJjMlFYRVVaN2UxVlRjc0ZkWE5MaEtE?=
 =?utf-8?B?dWJ4aUVrdnRZQVFETHV1N2QreEhEOElVN2k4OFYrZnJ2cUZBYTJTOUtabk9E?=
 =?utf-8?B?KzZpbE9VMXl5VURKejl4MVlvQ3I1dWxuN21IQjViVmh3VDk3VWFvNDFQeG1O?=
 =?utf-8?B?RWRkSkFJK3dvTWliYWUrcTJBVEVLa0ZJM1ZlRlhYWmFqNitLS0x2YUwrTmlq?=
 =?utf-8?B?VkRKeldPMkJRbGw2WGpoYlBJMUQwTjY0c3pUNmVMdHJCNzlRRXVxdW84TCs0?=
 =?utf-8?B?M2hLUVcyT0U0Ry9UNGZiSzdCM3d0a3p0VEdGajhRY2VhNnIyK0JPZm5SMzhC?=
 =?utf-8?B?VXdaVTg2eEdDckJNZisxNjlnMTZ4dWxhb3RUNE9yVjQ3UEIwUThDVHVsdXUz?=
 =?utf-8?B?d0FMZTRaRzVPTG50Q2I3N3pBeWRnMTR3TlNSZ1dRUWkwTlYraDBPYy9Walpy?=
 =?utf-8?B?QndzVUxzOTQrL2ZqSThHZlpCL0dFdnRqQzYzb2xkRVlrelo0ZlBBTUZlKzNL?=
 =?utf-8?B?dm1adEpidkxXZEIzb0lmUzRmRG9wZEh6QVBCWkVJRHZKVkk2NHhtS0hKcUhC?=
 =?utf-8?B?Z0M2Vjg1cHFYR05tSG5qSXJadGV3dk9xZnNmSDBreVZnU3pZa0xmb1BOQ2Y0?=
 =?utf-8?B?VkREemVPNW9qbFRXWldFa3cxYkt2emdCak9kQnZFVHByNytEazg1M1ZZQlZs?=
 =?utf-8?B?VmNRcHVlaklyU2NKZExRYzFqNU5vY3NtbU1lcXFZQVdEaGZIcTgxanBEZjBJ?=
 =?utf-8?B?OTlIWjZBdS9CTXlka29LZGFPMnE4QTdUWWxJcVBURlZSM0J0NGxmeC9zMkZs?=
 =?utf-8?B?YldSNU9HaTJtS3hkakJVc0tmcHkwM28vcmQwVkFWSGFxSVlEZVRHYjVYTFJ0?=
 =?utf-8?B?dWFqWEpnc0tNcXpQcFU1Ykh5TklOVHdQV1JPQzFjc2x1eXBybVpBZm5nREVY?=
 =?utf-8?B?ZDNoQ1VQOTlnUkE4THJXb1JCMUFzTHdLTVQ1TDJxTzQ2bWhGN0tYWExjODQw?=
 =?utf-8?B?NVZieXdMZisxSTZYdHJLbFBkL25xNkdsYkJnRzdEOWQrSTN2dkFIcVRGTEQr?=
 =?utf-8?B?VDhEZ2xyQXBaSE1RZzRySjc5ZXFtdGJuUHRlZ0J4RDZ2bFUxZmVaRm4vR0la?=
 =?utf-8?B?MUovdTltMXlUMzRtck9ISWZSZXRZajNabm9GTko1SkZtWW9XVmpjTHRWV0ky?=
 =?utf-8?B?MW5WREcrOFhqSmwyQkUwNDdhcnVWRnJ6UWhLK0JUSlVma2N1NC9ZVjdYRE9W?=
 =?utf-8?B?MDdQTjhrcVJ2a0ZrZ2FZOElwNlN4ZXN0ZDlwVzY0V2dDSTJuaUpTWTFua1Jx?=
 =?utf-8?B?TzRadVpRc3JWdXpUMkNvbnk2Y1R2UzFFVTJLQ0JBSFdIMk54blJjZ1d2R2Ey?=
 =?utf-8?B?Y1JEMW5UTHRYQW83akNLdFBZeUlpbGh2Mkw2RWdoMHhEMytxMjBWYTNHNlpa?=
 =?utf-8?B?TElWMTN0WmJpWG8xSU9PTXl3ZTRWbnJaamllYndjbUVSNUxyb3ZEQ2kwdjlk?=
 =?utf-8?B?Nk91dTBOMHNqU3g2OXg4ekdKSys2eDdjZVdkNGV4bkR4UjVCVHArK2VpeFY4?=
 =?utf-8?B?YUtmRDR4VUJ5aHhLU0htMldJb3EySEh0dm5IcVVBTEI0eFFaTHpuVjBSaVkx?=
 =?utf-8?B?SjdlVnVqS3c5ZGNCVTNPSnZhQUNqdnluMXZTcUZvYURrNnI3Rk11dGdXV3Fk?=
 =?utf-8?B?TDdCa05ZSDFpQTliWHhGMEFJcXV4Y2p0YVNmN1Q0WnJKNzZ1ME5OYkxmRVpt?=
 =?utf-8?B?UXIwVm9XVHVxcjRnZGNoVmd1by9mRXN5ZXJvREx2dXZIMlM0cmtScTNhN3I3?=
 =?utf-8?B?YU5zb1dGSkxKbURpQ1huT21rdFd6aldiajVTMEZDUXBrVEw0NFFQbkZ0QzRQ?=
 =?utf-8?B?V3VWdXh6MC9UM1hOMVF5WHpmdHZjUXVFWHVoMVNqeXl6UmdaeTBCMHY0eHIy?=
 =?utf-8?B?cSs3bTdOSmczNTI1M0dRSkNsNFkrZFBEZTVmcmsxZzEzS1loTld1NFF4aGE5?=
 =?utf-8?B?SHQ1VGxiMDBrQWZTMHYwZFZVUTlXSDBYQkxIUDdZd2hWNW5BTm02bUV2TEsz?=
 =?utf-8?B?ODErTzl2dEJLdGdZdGxZekJETVlkVVovNlJjaEpIbVhKZm1rU2lTQVl2eEtK?=
 =?utf-8?Q?CvhmDIVoNjpZE6Ny/rAEHL94tcsAXo8ArA+lduk8nXcv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a710c16a-6eb2-423e-8af3-08de16c3aa65
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:17:58.0336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHKSH1jn38O+m2Lmo6Uv8/RmLREjphKSbtnYsGPYCbzUTwmnq2hEQ03qqp0dJ5Fiizw1+khwviizjeC4ME79xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438
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

In Rust 1.80, the previously unstable `slice::flatten` family of methods
have been stabilized and renamed to `as_flattened`.

This creates an issue as we want to use `as_flattened`, but need to
support the MSRV (which at the moment is Rust 1.78) where it is named
`flatten`.

Solve this by enabling the `slice_flatten` feature, and abstracting
`as_flatten` behind an extension trait that calls the right method
depending on the Rust version.

This extension trait can be removed once the MSRV passes 1.80.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/all/CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com/
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 init/Kconfig           |  3 +++
 rust/kernel/lib.rs     |  4 ++++
 rust/kernel/slice.rs   | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++
 scripts/Makefile.build |  3 ++-
 4 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index cab3ad28ca49..7da93c9cccc3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -147,6 +147,9 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
 	# https://github.com/llvm/llvm-project/pull/130661
 	def_bool LD_IS_BFD || LLD_VERSION >= 210000
 
+config RUSTC_HAS_SLICE_AS_FLATTENED
+	def_bool RUSTC_VERSION >= 108000
+
 config RUSTC_HAS_COERCE_POINTEE
 	def_bool RUSTC_VERSION >= 108400
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3dd7bebe7888..2581a356d114 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -21,6 +21,9 @@
 #![feature(inline_const)]
 #![feature(pointer_is_aligned)]
 //
+// Stable since Rust 1.80.0.
+#![feature(slice_flatten)]
+//
 // Stable since Rust 1.81.0.
 #![feature(lint_reasons)]
 //
@@ -128,6 +131,7 @@
 pub mod security;
 pub mod seq_file;
 pub mod sizes;
+pub mod slice;
 mod static_assert;
 #[doc(hidden)]
 pub mod std_vendor;
diff --git a/rust/kernel/slice.rs b/rust/kernel/slice.rs
new file mode 100644
index 000000000000..7e837bec4bed
--- /dev/null
+++ b/rust/kernel/slice.rs
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Additional (and temporary) slice helpers.
+
+/// Extension trait providing a portable version of [`as_flattened`] and
+/// [`as_flattened_mut`].
+///
+/// In Rust 1.80, the previously unstable `slice::flatten` family of methods
+/// have been stabilized and renamed from `flatten` to `as_flattened`.
+///
+/// This creates an issue for as long as the MSRV is < 1.80, as the same functionality is provided
+/// by different methods depending on the compiler version.
+///
+/// This extension trait solves this by abstracting `as_flatten` and calling the correct  method
+/// depending on the Rust version.
+///
+/// This trait can be removed once the MSRV passes 1.80.
+///
+/// [`as_flattened`]: slice::as_flattened
+/// [`as_flattened_mut`]: slice::as_flattened_mut
+pub trait AsFlattened<T> {
+    /// Takes an `&[[T; N]]` and flattens it to a `&[T]`.
+    ///
+    /// This is an portable layer on top of [`as_flattened`]; see its documentation for details.
+    ///
+    /// [`as_flattened`]: slice::as_flattened
+    fn as_flattened_slice(&self) -> &[T];
+
+    /// Takes an `&mut [[T; N]]` and flattens it to a `&mut [T]`.
+    ///
+    /// This is an portable layer on top of [`as_flattened_mut`]; see its documentation for details.
+    ///
+    /// [`as_flattened_mut`]: slice::as_flattened_mut
+    fn as_flattened_slice_mut(&mut self) -> &mut [T];
+}
+
+impl<T, const N: usize> AsFlattened<T> for [[T; N]] {
+    #[allow(clippy::incompatible_msrv)]
+    fn as_flattened_slice(&self) -> &[T] {
+        #[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
+        {
+            self.flatten()
+        }
+
+        #[cfg(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED)]
+        {
+            self.as_flattened()
+        }
+    }
+
+    #[allow(clippy::incompatible_msrv)]
+    fn as_flattened_slice_mut(&mut self) -> &mut [T] {
+        #[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
+        {
+            self.flatten_mut()
+        }
+
+        #[cfg(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED)]
+        {
+            self.as_flattened_mut()
+        }
+    }
+}
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d0ee33a487be..a84b9e3171a3 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -308,6 +308,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 
 # The features in this list are the ones allowed for non-`rust/` code.
 #
+#   - Stable since Rust 1.80.0: `feature(slice_flatten)`.
 #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
 #   - Stable since Rust 1.82.0: `feature(asm_const)`,
 #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
@@ -317,7 +318,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,slice_flatten,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree

-- 
2.51.0

