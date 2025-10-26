Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC8BC0AA9F
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 15:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007C610E2CD;
	Sun, 26 Oct 2025 14:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="e+00Afct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013005.outbound.protection.outlook.com
 [40.93.196.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976AB10E2CD;
 Sun, 26 Oct 2025 14:40:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yX8u4U0mnlwbs3hA1lhouKuAV4DJX5N159sisZnFnIrIfwhmIRA1U3y13L4QrnZTU/YEthUFfN5jyLTwsxqOa3tRAgpWv6EdS4yJX0g1khOhFltz7uOmNAd5HqrPyaNllgirv6SQslJa/JH6892wRIHi7HJraJmQxJAUIvnvFk09cKoIv/yFQTpYTuJ2XPViMnPLDVSi+tQf38M8/X4ZfRw47FHkN4U89ZI0BNJj+nIqZh9gNashReRUL6xbZrdJkw91HDprpEGRXKwS7PaB6kp3RnjhhwSrCWC19WKCFbC153jnzqO1tz1zKHZasoWsd48tl3bxCvF7gdJ+lRA2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdNpl/3hATbKDSDOYnLZ+PPxhm79OueeoHqXbz88CoE=;
 b=rdjpYBDO2+hrJKX+cKbjijuX45LaB5o4grrpZ1COGGXCraeT8KGB7MVbm+OUHNJQ7dCbDRUJ/IFUNeqApGqga32lZixHVTD4AnuyeY96ecpQDMsiYo+1b9CCwnrBNUOwbY6Q6d/Jj/kqagJKwEa6DEGfxGw+kvciMdQzL2wtxxbF3JoD37cqgh7zXGv6oRskZr+ycgO1eWwxS4yqNebiUxGaXP0dR0gPsFOpLL87GokheTLCf/ugcJG2B/3aboyZAxXWuT7hs/NxCqf/E8BQ6Ixw8McXMkjL5IlcT4HHf5pqUlKoCi/2L6dOQCujrw3WYCgT+FN6ZCPTqlvzLJXZUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdNpl/3hATbKDSDOYnLZ+PPxhm79OueeoHqXbz88CoE=;
 b=e+00Afct1jBtiKPzhpEX6r1BzVNURelhNOuX1kfix3iiB2q1ctsNnFkE/bpUZsMZ9EGa9xYJfAsBeNkQoubI+mGCA1jtyMVcY7hikIWGKw/8y8TOpZNcjiv+wtwDuvQFh6+3ufh5P+Cz45WJAQezUOKZM4WABfhcBi6OXSA5xDqRPff8qamKtY8vZEm5ub5JOkFg3pV2J50a5kLQLkwT/zC1NEgPeAdaDP+uBDcgebxtHHvolL45Znta95W1yEU4kTG6qCZts45qhXpGYcsJv31rrdjkwUmG5yPiooIdyLOP+sOzIfBwzAMVT7lv1L/ixkpyQOBxUYcaBrCrtAkacQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by CH2PR12MB4168.namprd12.prod.outlook.com (2603:10b6:610:a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Sun, 26 Oct
 2025 14:40:05 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9253.017; Sun, 26 Oct 2025
 14:40:05 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 26 Oct 2025 23:39:07 +0900
Subject: [PATCH 2/7] gpu: nova-core: vbios: remove unneeded u8 conversions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251026-nova-as-v1-2-60c78726462d@nvidia.com>
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
In-Reply-To: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0102.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::16) To BY5PR12MB3986.namprd12.prod.outlook.com
 (2603:10b6:a03:195::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|CH2PR12MB4168:EE_
X-MS-Office365-Filtering-Correlation-Id: 078701c9-dd6d-4938-7903-08de149d8d1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXk1VDJYZlBVZ1hhMy9rS1F0WWJrN3Btd09zMEh3bEJIYS9oN0xNTTMwcTlL?=
 =?utf-8?B?YXhWK1dtSUFIamZZSHc1MWVFc1JvemFJMVIvYUJiZzNCcXRBUStla09Iejlz?=
 =?utf-8?B?TmtsTTFXZjJtUllYbDJMaEFoUjVzdkxUYVJBQ294UTV6cVpSMjBiaWtFVGk5?=
 =?utf-8?B?cVhickVvN2dsZFRReWVOUG1Vd01QNElnbXExc2tsVlB1b2MxYm42Znc2MjFo?=
 =?utf-8?B?eXhKVHprNUptUzBjSUFKZzdBQ1FhUC9lYVBKNXU4TG4wWmtpajcwNWNFcm0z?=
 =?utf-8?B?cmdWWjMyRDY0WjREdFVnSW01N0Y5RUsybzNlY0UyQXE2aklZKzRtUFVTUHpL?=
 =?utf-8?B?RHNPRzdlY0VFVGdhdFlXY3A2WTVBU2FLVDhScDNoSmFWcVQvQUcwQXd0Vklx?=
 =?utf-8?B?SC9NSzBRMVQrc3BYWTVSZ2hpeTVSMU5kUURwQlJQVWZmRnkvTWpCdkRzaUJ4?=
 =?utf-8?B?dXFVTFBRdzNiZ1FUUS9IUXF2anRCcTdoT0NYcnlxbzlpTlNxcENPUjAxVXZq?=
 =?utf-8?B?N0QvQW9qcm5pWnpjWnRYY1JlcXFNSDZ0ZGR1VC8xSnFlOEpoTUY5blFJMVFZ?=
 =?utf-8?B?cjlINWRQWWliTVh6bnZ1UnBjU3FsM2x5K0pvMGhQcEpUVzFpWG84YjNKLzFh?=
 =?utf-8?B?THNZRHRRMkhkcVB5UEJmVWJQY2h1QWhsNkNycDI2SCtFWDNXY1VIVUgxbmhT?=
 =?utf-8?B?cnVHK0J4Z3d5MXhaWGxqbGN0VUNtTjdCMWNmZEh3WHlMa0twRFk3Tzk0VGR5?=
 =?utf-8?B?L2FiMDdLMEhaWm1aSXphZStvME9kRFQzTFBOZkRqZWxFQWxNaWtpekwwV1JF?=
 =?utf-8?B?RXV0VVdIMUxLT1NWV2FIYlpjU1IzbWc5Y2lHSVVib0dHK25MaEdrSllDbGNl?=
 =?utf-8?B?bzEzM1lCS1p4cGM4U3JiLzk0WDJQUkg3elNqVU9DeHR5N3FiMEFqaStnQzVn?=
 =?utf-8?B?Y3kvTlZ5cnFoRktmaGdadGVRbFlZR1Z0KzhFck9VeXlJQkVtNXI3bHJpb0FJ?=
 =?utf-8?B?dFpuUEcvbnVLNWJoV2IyZUl0VHBmM1R2dHlzd2N4SkY2WkRkWkF3b21idG1o?=
 =?utf-8?B?SDhIai9xUTZzSVg5L1dRQkxEL3I5OWl1TGs5cktmRVB0TVRZN28yNTNWSFM4?=
 =?utf-8?B?TUVHUk9WNlJFQUt4aVNLZWFqZnRLc0JCM0VkeGxXVnNuYVpxeGlva0kySEpH?=
 =?utf-8?B?amtFOW5EVHRaTDJXSVRXR25sWFN6VWVET0pUZTJQS21aL2tlVkxjYWgrc1VG?=
 =?utf-8?B?ZWRYOTJ5VFZiNTUyRlFZbnBkVkdFa0d1eWVZV1VVWTBjdkJvL2lLS0hjQlFz?=
 =?utf-8?B?WVc5dzQ5QXhBY0dEK00xbWRXZmVkWU9NVTNvM1ZwL012YTBXamYxamVlTWhZ?=
 =?utf-8?B?OU1ZSFRXV21RTG9kd05lZm8xVTNCRGJhK3IrK2xxUjVGRTRuTG5Db1NQVVNJ?=
 =?utf-8?B?b1JHYWNHcTI5ZlJYY2plUmpUSXlzOFZhM2hpU2ZZQ0NtN1M0cktZSERSQUtN?=
 =?utf-8?B?Nk8yeWtNdjNoL0tjc2tFdUZ6WjNnc1RybThOZHNKTmVpeGY3SXNwODFVUU9Q?=
 =?utf-8?B?Snd5M000MUZ0ZG9GZnhJNTI3bEtpalpLMmdZUnlYMlBQM2ZwWlN1MHhJUjha?=
 =?utf-8?B?VURCa2ttRXh3U2J3OE16eGcxMFpsMzdSRFZhRytaR1FJOGw2UE1ZZjBpWjJL?=
 =?utf-8?B?amkrdS9MVGtmQUZhSy8zcWRIY0R0cUFzelQ5cmVZc2Q5Q0huUDloU1p2OGlY?=
 =?utf-8?B?elo1eTZMN083VUlWbnh5bWNhbHh0d2d1SzZHSm02eGlZeThGUUMwWGlwUDFG?=
 =?utf-8?B?Z25NVzFKZkd6OXp0SWRhTmZEUFZFbDFrdTRXaU1SQmhZK3hWZFBuZkZVY0Fs?=
 =?utf-8?B?dHBtR2twRnh1NldXQkpkTzdMdXd6L0JwQW5ydFdLcG14QnYvTjFTQ0hGbjZL?=
 =?utf-8?B?d0pFMlBIOFBOclMvN2pXYlAwYW5jL1pKMnI5QnNzRHExWlFlS3FlRVJDb1Fh?=
 =?utf-8?Q?wx9KYca4P+PaEfyivAVAKLlV/qgc5g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(7416014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHMzbTNtNkJQR3NiOWFqL29UbXFycEIyemdESHIra3ZEaVFsZWQ1ckVhVWRH?=
 =?utf-8?B?QmpPSmZBQkpZRTZVUzhXWjRrL3hxNUhMVE9CVkJsRlgvemxjZUx2NS9iK1NF?=
 =?utf-8?B?NGhNVzFUSGRSM3ZyK2J2SXVybEJ0ck54L0pXaTkxLy9SU1dCdTlMYWtxUmMr?=
 =?utf-8?B?RnhBUjQ0bU9lWDZHdXBYcTJXd3lBRmRJT2x4TXpVWXh3c2pZNXJtdmpUdGV2?=
 =?utf-8?B?VTNtei95NS9ZMjFIMU1tbnZMUEN1OHZIMzlZYnNhbk5pK1kyTW8xem5aalN0?=
 =?utf-8?B?dzFCQitqV0lVZTYzejE2QVNDYWpwN1hSY3locnhlWk1SaWJwcTdaZUYrRCtG?=
 =?utf-8?B?NE15Y0JaUjZEV2tOcU5rc0NLVnN6SXZzUW81SEttMWE5THF1Tm05ZDlUaTNn?=
 =?utf-8?B?RlhiTjU2TDJrWEJ4UlVITlZYM3g5MTg1RkxmeXhMVEV2WGpvU3krZE5OYzI0?=
 =?utf-8?B?aU1MTW5NMzNXVnRyL0hsaSt5ckhJYkNEQ0RHYnQ5aENHRVBYZWtPLzRON0dJ?=
 =?utf-8?B?SEVMZ2R4NjBHclBmd1VnRnNMVVF3S0VwdGVKMkJzdi9lVkFxOHROOTlzSzRZ?=
 =?utf-8?B?WjJ2d0FaSmRxdG9nbTBXZmd3T0ZJa0NCQXN1Q2xRbndWZGE0Z1M2ZXc3NEdJ?=
 =?utf-8?B?QWtaY05CQmVoZmQrL1NncDk4SGg5V0ZSTzh1KzVIQjhaYitNeisySm1iRkJk?=
 =?utf-8?B?a0ZFSmVRTzF5ZDhBRjJieGszcVYwT1JtYy9oRWNpWWkzZ3NvY0FTTWZ0bkxL?=
 =?utf-8?B?Zmpvckt5VUpOZmovWFQ4dlBLSGthQXIzR1l0a2YzbXFJcWVndHJoVGU2NHNS?=
 =?utf-8?B?MEZtVkN3WGhsMGcrNVBMRVNwQU9wSUpYYi9SMUVac0xxcE5TUkRHYkc3Z3kz?=
 =?utf-8?B?WWxqakxJWUw4WHVGWFJWSVVXTmtOZld6ZEl3bWlZeE5BOEV4YnJaNm40NVdL?=
 =?utf-8?B?WlFxbFZPV1l5a0YvMC9ZQXNWOG5GdEFoVnducytkckV6Q0NzbHNqMXZPY3li?=
 =?utf-8?B?dUJ3QTFsSG1jL3c0UUphZmZoeGN4UnlNOFN5ZXdENW9zL0Rad3B5cmt5NHd3?=
 =?utf-8?B?U3hzMjczWHZpdVlqNjI0WmdhRVF1em1XSWJiK1h6bkQ0amI5TEI5ZDFLZnVp?=
 =?utf-8?B?UDZvMXVnVDBvYjlJVFhIUTlnNU9vYzhKb2pFRlo5MzV1Qk82MDYzUHA0Q0Zh?=
 =?utf-8?B?NFpucGl0a0JjVEs4UVdxbnk2YmlyUjIzdG9KS3JDV1hNaVZFZkU2UHJaZ2Ew?=
 =?utf-8?B?cTMvc0RaaUFlOE11L3RKVDc2aDZTem5DRHV4OU9TSm5Kdmp4dU11UDdWK0pj?=
 =?utf-8?B?SW5NQUo4R1ZwcXhoUmo5eTFXakpCa0Q1WCtwZU8xSlNYaDdxY29LaVNVWnA1?=
 =?utf-8?B?anVvQzI1clV4VlFwNkJSWGZDNWZKVHErTWtSSGt1T1VlU1pBa1BnS1g4aG04?=
 =?utf-8?B?YlFtc01IT3BXUVg3UVJkU2ZUeGVFY2o4NGl5MnlqN0EzS0JXZ0xUTmdLN3A1?=
 =?utf-8?B?M1RHLy9TNklpUTVmYm9LNUsweUhycmZGRjFhSlJYM0F6b1ZBclp2eWpNUC9M?=
 =?utf-8?B?LzNLYTJndGhnMHB2YTdOTGJlRE91MW8yZTBQSFRzRXkxaUlsRWJ4aUx3M282?=
 =?utf-8?B?YWhhSkEvbEhhM1E1dkdxNUZjTVk5YUI5b0tXazFKc2V3YktMV1N5L0hwQlg0?=
 =?utf-8?B?cFRNcHVkcFE3cGJ0R0RyRDRLNnJvWDFuZFFzbWN6YW9nY3hpU1JvOEhMaXhr?=
 =?utf-8?B?V2NyRFl4TVNtcXpreDJTQmhHVEtpRHJKN3pRaUt0L2U4YmJWeVhYNkVid1Nq?=
 =?utf-8?B?SDdObGg5OWlzdDMvWFFsOTRrUGt3K0pRV1BnRGtPeUNmaUpUOXY3V2JPWE8y?=
 =?utf-8?B?WTdUdWZ2TldyMXBSbTMwWVZ1ZEVKQU1HQXA3cU9hT1BURzdXNERaK1B1MDdT?=
 =?utf-8?B?M2Y1OVphMEppTGpXdmtoSzJwcWdhVWpLZGJWSFhlYmFCTVFxZjZZN3Y0THpl?=
 =?utf-8?B?N3R4M2tnVkVkaktYYTJ3c2J5TkNVVU15R3FNMGpra21Xd1gwTXZKVGFZMVJI?=
 =?utf-8?B?Q2p4djFqby8rUDdoQ0tneVgwdHZIN24zTHdKeGpMSm5rRnNxMnkyWHcxOWJJ?=
 =?utf-8?B?b0NCODhSSzZlM3luaVNibXF2VUkyMWc2UVFmb2RCZThzOXM5bG55OExtK1Uy?=
 =?utf-8?Q?z83lBwHNIuXz9bPSTzKQKRDXOsPJ4EdKL/KtZTAYPVTz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078701c9-dd6d-4938-7903-08de149d8d1c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2025 14:40:05.3666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KR5U1APulowSTJy+KRAfHBkCZ8CLPGEJ1pz7AYKk9FoQ0wcf9c06DFny29UixK6aHSvmFkthAOU/sRhfpVUD2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4168
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

These variables were read from the u8 array `data` and converted to a
`usize`, before being converted back to a `u8`. Just re-read them from
the source to avoid using `as`.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 943b0dac31df..dbe0d6e4a015 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -911,9 +911,9 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
 
         Ok(PmuLookupTable {
             version: data[0],
-            header_len: header_len as u8,
-            entry_len: entry_len as u8,
-            entry_count: entry_count as u8,
+            header_len: data[1],
+            entry_len: data[2],
+            entry_count: data[3],
             table_data,
         })
     }

-- 
2.51.0

