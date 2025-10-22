Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4B3BFE346
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 22:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43E810E199;
	Wed, 22 Oct 2025 20:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iIrTBb3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011065.outbound.protection.outlook.com [52.101.62.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E5110E199;
 Wed, 22 Oct 2025 20:43:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fslDTVJfSvfn5sZRpyZMyQ5psCWtvV2V9bsuuGZCi238v9BNsYwRUgFIjHIhgaZ/Z4cPuWGSN3YacnzUpELqETy67BjaSZiE6OmcqiTHxlX+mAuwlLMvhd6qFlRSWlSL336BMe0OR5rdy6Npw2yaueobiBDvDxBmIAuj9tfIsWM2ZCHnIAovOZoliE5ezg5oXm9fFDvHrL9JwHHkX6pWl0HljVTTXiKDMtUAiKgVIAt4hM2DCd/Pzk97buYY+iKs/olg5lsj1KdTZMtbkY6+QfKlMLHP0Wmfg8O1mW60P6O4yc6d7aTjwkBmR1y1kyUFEIcjy1rzvm/nTfuvwSuGzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryWLMSndVAK5UXjmjWQk8HtF61kHhkaNRE2uGwWaJJw=;
 b=BYTWpGqSXG3A/Q1nDDhYO9OanKKIupLJDiC/pY4n+S7u3AUhxUX4MaNcCFEOD+fb5OK41hYZVPLkUGeoMoAAPJC1uBXRlE5ap4SAHQpXNyLhevlFd/ggmSalPhD/0VMQBixp1Kp+fyvcqRjoG/71/+IzXybkQkoW3k+rdGVzJvAImZgrIwOtziTcL/Rpbhvhj7lyW00R8UymgQICV2P8Fsv8l8o+Ius9gAcGYPnp7jHQ7BWhax2PFpBqG266WJWQ+VWTWyx7fiSjkFFOYoLMcBnTLSejfDL9R8GjkGtWO8hwSYyth11NOd3x7MpalS3smoz+EiRpIVPMex6sMgc2Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryWLMSndVAK5UXjmjWQk8HtF61kHhkaNRE2uGwWaJJw=;
 b=iIrTBb3VnaBT1o2dhdSVSXlGrfIP3WQP59+TJgR7z1dYLGsCpvXWIHLBs4S3VUpWVPjbu1BX9pU2XQbMma+39EHzxCd+Mo/3prASTI403DtXrpubMF0ZONQATceswJgbg5yGxuhqXm+JLywGLc5fgthufWuo9ohBOYECVEsb2cYzdcsGm5xSq19LUjbTrJ8ZXcUQUDHP6hfsnyshkIZ3872O6iyJ+yiwo64Yl2Xembd2tuLp5z87+GtCh14OFnhVEHsOqQnyPGp1qjoeRvRBdD9WHWdQHpSURp/7T1SDty3M+8bp5MGdtByHoCaQIA9dCtjaPQWOm9GSW/hVQ/bpYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB7371.namprd12.prod.outlook.com (2603:10b6:806:29a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 22 Oct
 2025 20:43:39 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 20:43:39 +0000
Message-ID: <c9e8fb6d-38ea-473e-9421-d09140a4c142@nvidia.com>
Date: Wed, 22 Oct 2025 16:43:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] nova-core: mm: Add support to use PRAMIN windows to
 write to VRAM
From: Joel Fernandes <joelagnelf@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-7-joelagnelf@nvidia.com>
 <0cfdfc96-f98b-4ec1-9218-10f7344d6605@nvidia.com>
 <a8eeccb7-9586-440f-a12a-e877a9197652@nvidia.com>
Content-Language: en-US
In-Reply-To: <a8eeccb7-9586-440f-a12a-e877a9197652@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0851.namprd03.prod.outlook.com
 (2603:10b6:408:13d::16) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: 0329127d-7d64-4a53-773f-08de11abae6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ti92eGRYKzhZQkNCWTRPNk5MNWhJMU1mWlF4MjgweHRSaCtQN3ZMOU5ZZ1dE?=
 =?utf-8?B?WVJ6Z0ljVzhCd0djTnc2TkVISGJ2QUQ0VStDOHZBazJQWFZzUEVHV3NmSE9V?=
 =?utf-8?B?SStpc2JrdWgxVGcwVmc2dC9UZDBPZTdGRGFuNXBVLzdHUkN2NVBpdUFEV1g1?=
 =?utf-8?B?enUrU0UreXNkMFM2ZUtwdWZHMDY1bUp4bkdoZHdSUC8zUENpRU5BcXNKK1hz?=
 =?utf-8?B?TlhZNWd5MHdmVDhZVG9QUzZ0QWlyd2t3VjRrbXIxTTErdFl2anlSek1SdTlU?=
 =?utf-8?B?eTlOUks2WjZlWkUvZEZjSzdIcnpEQkN2WEVEQWUyY1k4Q0wySTMvQW8yWVZO?=
 =?utf-8?B?QnpJTFVUQ2V4MWw4OXduR0p0THBCcHNOK2E1bWtCcm1STDVJVDdQc2RZT2Zn?=
 =?utf-8?B?QzM0cy84UVlRbUlBWGg3cDlLeVZlbXVUcHRsTVllVmJXaVN5SHo2dERPdFBF?=
 =?utf-8?B?WW1XZlRqUGltRWRMYjZGS3JsWDQ4Lyt6YzNsaXNzUFpTSEFRdFJiNU5wWjZv?=
 =?utf-8?B?TEpiL3J2THRqaGp6elE3SWtDWWVGbzFnRVdoeUFYNU5KZHQxWVVDVjVESnhQ?=
 =?utf-8?B?RDV5SkJrSmlzeUFXTTZjSXRhR0Z3T21ESWV5b2U2anNZM3pGUndMQ2pvQVNS?=
 =?utf-8?B?VEhCUDdYbXNENXJwa0V6alZZeDUrSGxjRVRhL1BpRk1DVVBPWXR1Sko4ckND?=
 =?utf-8?B?Yk9qU2xhcTA3M1djeFllVDBIcTlSWGxOempLQU01ZjFQTFJzZnJhTzJmWDhn?=
 =?utf-8?B?Y3VVT21PQk1mYkljL0NDcDF5UllzRVhlWTFXWHo0dmN5eDI2cHlUa3hSaXBo?=
 =?utf-8?B?R1pPVzVPU1UzY2h4K0tMeHVHK1kzYStqT0JwRDg1d1RhNkExK09VTmE3Ymo1?=
 =?utf-8?B?eWRoTERGQXFISmNhOElPL0hNRGg0akxHVDNlL3kvSzdPOWI1ZGE2VG53bys1?=
 =?utf-8?B?S2xZRm1CUnBKc2UxWFBFamdjUm9tQzJ4VTlCR0ZLeEtTbUJpZEVIemhNWFNY?=
 =?utf-8?B?VXdaMXJUSWx2Y0VzRXRRTzE4U041MGowWEMrT1E2czNuK25BbmJKd1o3OXFq?=
 =?utf-8?B?QVVSQThSWWgyYTl4ZUp4Qm1wVFY5VVB4YzRCRXYwcE9zWXNLcEtKT2NVNkVl?=
 =?utf-8?B?eHdJUjNPc2c5WmhlWW13WnBqM1o2UlRQNk1IS3NKQkx4QVZGY3JkWGN4TDNO?=
 =?utf-8?B?dlF5bTB5bWZmT29JM0hkSGNPK2lLc1BiMmF2cHRkUkwzd1dPTi9TWkxrMXo5?=
 =?utf-8?B?M0tPaDNpK3dOOXkzRUROYS9icGxTL1NNeThwdmlsT1AzTG9pbEtra3QvUkho?=
 =?utf-8?B?K3lWdGpOOFZxV3ZxdTRmRUIzZmtUZTVMMHZlM0NlSTM1eVowYmh5OVJSa1Uv?=
 =?utf-8?B?VS9POEd3ekRtem5QU09NRUcvcE9VY1RWd3N6aVh5WTR1WGlvMVVhRFZ3NUdF?=
 =?utf-8?B?dVNPSkJncHh3R3FpYmJacjFNSUdMRDRaL0laSEpqckpCd21JMXdtOFNJUjdR?=
 =?utf-8?B?TDJKaW9uS1Z5VzJQd0M2dUNQbU5rV1c2cXgrK2ZXVzBnQTFkZUxHY3F0eHda?=
 =?utf-8?B?b1J2cWZ6MkU0d2xMa055ZXlxT0RxcW9oak9aQnFnWkhTQ3p4czRlRC9FQ0x2?=
 =?utf-8?B?NEpXMjJPY1NDa0lRVUNtV1JFdjFaQkhmT3pMblQxUzQ2R3RpZHkzbWdBZXdD?=
 =?utf-8?B?aC96WDBDSyt0VkVITEhXdW13WmVBZkxpRU8ycExnUzIzR3FoYWdOcm5KV2lt?=
 =?utf-8?B?Q05oUDd3bXRtNnVURHpaRy96SUlFQ3Y4VHJSWWdUZ0FsclJXK09kWjFRRnFT?=
 =?utf-8?B?bHl5TTBNaFd4RU1qcDMxeUNQcHdWaXUxRk1hczFCZVVuRnl4Y2wxUEtqSk9G?=
 =?utf-8?B?dHFUQWN3RzZvcjZxb0RjcHo3U1ZmSExvRmFLZ0JVa0VhRTlrRlB3YzV6a0V6?=
 =?utf-8?Q?rwEwwyBYr0ofQKbH2dT1PzoIaHIrdkko?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG9FOE5DcE1LRDFBOTRGOXlWOEE4Z0ZmVXpOSTNhYk11ZTRSLzN3eE9wWlUv?=
 =?utf-8?B?eElRVjVwMFJTcEdRV0k3ZHFQMXphbk50eDd6UlVucU9uSURJQVNaVU9xWUh4?=
 =?utf-8?B?RUt2VmI4R21UQ3FHUFRSUklvYklCcVVxYldtdWV6UEFWL25XamE3Y2I0dGtL?=
 =?utf-8?B?L0plT0tJcnY2dGt4ejU2K29oU1dWSzhlaVpVTWthZ1d6cWlNRUFsSE1CU2ov?=
 =?utf-8?B?aFJUUnFmUm9QZXpkT2FKVmlUSC9wc3ptRHZVTWNqblM2S0VEZSt4QjJ3TWhF?=
 =?utf-8?B?bDdjZVpVYzRnM3hnWkpDbU5jdUMxeEVjVWlvTHNvNEFydFlJY202WENQS0tL?=
 =?utf-8?B?Tkp4SlJzSUJObjdPSjhzaEdoRjVoZlY1RHkyRmY1b052QVg0L3N2LzVsR3lw?=
 =?utf-8?B?K0hoZFhKMUc4djhlZzlKNXQrK2QyN3pJc2d5YjlxbmJDNVpZQThSeHU0c0Vm?=
 =?utf-8?B?TVYycE5aTTI0V0ViZHRENVpHbGxseU1zeldOUFBka1Yzc3Vpc1hGWlFielJO?=
 =?utf-8?B?TmNmd2NIb0pld1p2MFNhK0Jrc0hzdHFpQjRwSEVFQVVmQkxYQm0wV1JnOEMz?=
 =?utf-8?B?a09Sem5WWUpCeXJER1RGbW9TTnJMSG9Xb0xVQ0x5aXJybFJIL0RoOXFLMXho?=
 =?utf-8?B?UHNQWCtCRjJTSjdhd1BieENnMk0rNTJzcWErcEZnMTBUODhSN1dKOSszUU1I?=
 =?utf-8?B?M0U1Rzd5RnpVdXlUQjRWWDNJMXA2bFk5bzJiN0R4cDRBdHk3aldYeWYrLzZU?=
 =?utf-8?B?b1Fyck4zUFljRXNIOTM2by9EZFRqaVVCTVd6RGJsOWY1dDlqS2RRU1NTNXE2?=
 =?utf-8?B?VktLKzBjQjM2WUt4bjhxZ1czckVLU1FoazZoaGhSNWlTUGlnR2ozZXlvYkwz?=
 =?utf-8?B?Nnc1SlNJb2RWNndwQkFSelhPc1M3eWZkT2hEdjd6L3NkR2pDWW1iV3VGUWpJ?=
 =?utf-8?B?U3UvVkxGMFplc2tzSFUyUnRseUpTazIvTnZyR3VnUXRLRzJqZGhZM0xlMU5B?=
 =?utf-8?B?MXFhdmZqSnMybGNSNFd0T2xPTTRXYjZQd2dXTllkQUg1aUJQSUxsRC9UdVpC?=
 =?utf-8?B?alVhd1U4cDRNNHYvWHBuWmV5L2tON2NoeXlSZ1lYU0NJL09GUTZUQUkySk5p?=
 =?utf-8?B?Rm5FRnZOSEFsREJyTEpNOUlQN25iTll0QW5FUXFXVi9UaTQ0SEgyWFQzWjhK?=
 =?utf-8?B?M2FGejE2RXB5TXAyQWd4OXhBWThIZFJNempRMnMybVVSYXpVWHZmZXljcUt3?=
 =?utf-8?B?TVh2cEVpWWR6UmNxTGlNYUNnK3JlZXN4eHNEYUtuWHVtaWJ4anFMNld3Rkgr?=
 =?utf-8?B?d0JWM05IR2FPT0RyWFpWUmdvUzA0UTVPbnNUbFJkRWh1NU82a05jV3RFTlRh?=
 =?utf-8?B?dDFLUnNjQlpLdVV6aEpHdXJsdWlOd2wvOENnVGQ3VSsvN3FJekw5cndDbldL?=
 =?utf-8?B?dENZVFdUWkpOR3RpcVMwUWo3SmNjRmFJdWF0MWQzRTFzaTVCRlpIeXh4a084?=
 =?utf-8?B?QmlESTVKN1pKVXN3blhPVkcwWXl3b3NTUHNTSDVjZFo0LzAzZkIxREdRYzNH?=
 =?utf-8?B?OSsxMnVUUDllU1djR2xHYWpyWWxJaUpPWkFvQVA5SitKSTRVOHozY1BtdU1N?=
 =?utf-8?B?OG5CVVF5anRGKzdhd3lXTzNmQm5Pa2NNNHQ5Y0liQmUxSzRqQVF3Z1NYWVI2?=
 =?utf-8?B?cmthVVlzaGhmbk0wQ0JtYUpZWWkxQmdtcERMcVY1cklkZE5DSW9HSXZvOFAx?=
 =?utf-8?B?RmJwaWZ2Q1YzQmQwQW9rdzl0aWVTNnpyZ2xHSnlnbUNmVXRCaXNNSnVIT1Mr?=
 =?utf-8?B?bDN3Y3NLT2todnB1WElCMytqbnJ3UFh6bzY0SWhEek8xWG1IeXQ0c0VQN0hB?=
 =?utf-8?B?d24rTDRCVnB4ODFjNmIvT2NxQUxhRDVxRVBVUXNnaFE3QlN5blltS0VyejhX?=
 =?utf-8?B?dnd3N0VIMnBOUERhWUNsVUFCSGRsUTBsTVJUanlkQnp0ZzcrUHpKTW9rRWdT?=
 =?utf-8?B?WVZNSG1aN3pEQmo2SUVwTGh1elo4ZVN6T3JOTTJWYXo0L0hWUGU5dHIrQjZq?=
 =?utf-8?B?MHgvWjZ1djFsdkM5ZnIzVDRvNzd2dUE2NjU0dXNOeldmR3FUeUdCUUErYURI?=
 =?utf-8?Q?NcE3/l0xmyHIZQ6F7ERp6YuEH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0329127d-7d64-4a53-773f-08de11abae6d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 20:43:39.8026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWZ2IvMpy7m+GvBEHsgYaiWdRKCfzKe0brPTQ/aGXX+z+VUbsWSZxCwHClHvFgb0Fe/iuNCf+6DffxiH94Fixw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7371
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

Hi,

On 10/22/2025 1:48 PM, Joel Fernandes wrote:
>>> +    /// * `fb_offset` - Starting byte offset in VRAM (framebuffer) where access begins.
>>> +    ///                 Must be aligned to `T::alignment()`.
>>> +    /// * `num_items` - Number of items of type `T` to process.
>>> +    /// * `operation` - Closure called for each item to perform the actual read/write.
>>> +    ///                 Takes two parameters:
>>> +    ///                 - `data_idx`: Index of the item in the data array (0..num_items)
>>> +    ///                 - `pramin_offset`: BAR0 offset in the PRAMIN aperture to access
>>> +    ///
>>> +    /// The function automatically handles PRAMIN window repositioning when accessing
>>> +    /// data that spans multiple 1MB windows.
>>> +    fn access_vram<T: PraminNum, F>(
>>> +        &self,
>>> +        fb_offset: usize,
>>> +        num_items: usize,
>>> +        mut operation: F,
>>> +    ) -> Result
>> This is far too much functionality, and the code can be made much smaller
>> and simpler.
>> and still get what we need. Open RM only supplies small accessors
>> (8 thru 64 bits wide), and no "bulk access". The calling code can loop if 
>> necessary.
>> The code uses a sliding window approach to reposition the moving window,
> abstracting away the details of the moving window from the caller.
For completeness: I chatted with John and wanted to update the thread. The main
"benefit" from this extra complexity is if we write > 1MB at a time (automatic
sliding of window). However, in all frankness I *currently* don't have such a
use case - all writes are within 1MB. Just to be clear though I do feel we will
need this though if we use PRAMIN as the primary way to access "instance memory"
instead of BAR2 since instance memory is much larger than the window.

So for next version of this patch, I will keep it simple (KISS principal). We
can add in the abstracted moving-window for >1MB writes when we need it as this
patch on the list and is not going anywhere. Also I think since we're exposing
the details of the window size to the caller, we could come up with compile-time
checks to make sure they're within bounds, so I'll proceed accordingly.

Thanks!

 - Joel

