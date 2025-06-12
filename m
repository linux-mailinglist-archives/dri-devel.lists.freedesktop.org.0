Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D08BAD7315
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186B210E85F;
	Thu, 12 Jun 2025 14:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l336uIir";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2066.outbound.protection.outlook.com [40.107.100.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F12F10E86B;
 Thu, 12 Jun 2025 14:03:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zb+gedBTmzEsVRok5Hq0UlFbS0vy1wVV2BxUeZOCb76Tcyc9b39vaHwwLrtblqkyH9Ub2sAAzangpkuxfu2+xOPJmvzqwlmotx1Y6eYOUD0IcDn1KxCn0JXVzF1EF7nJbcw2VZUtO8JBSgh2/OUtGeuumQ6FoBQP4cJNvyvVLGy/Fpt+KrMNAXp+TnqsBGJAma7e+h70TQeH3pTIYx1uJG+Man83M8d37bC7v0sV3zqXhGF++XE1RyTw/6UO9G0m7uCMXCGxfmSMKEOKdpLJDkxyMthJDOS1l+gQCwj04BZHGtnahze3qCiDlbJMhhzgH8Lct6cA+bVV2w4ortuJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Thwvb5lfiJEE0rf97qe5a1kmZZD3rV0lGRlvnMB9SdU=;
 b=M35WnL6ksekVprj3UO+APX1CyIVVrTD+N80wPnMu3J2mck2x7LVGVHzBNwO13V9oRPG3xzYFyf4uH4vpaIyiJqBDZQZkajlkqzn3Ij+DC8c820DuZGyR9IOlaR0u+qCijG4dy4PWPRo/D+Y0O/tObwSMK9ofpnYG9bgy+1po9FXYPsHZtNk/jLKEkiq2PIfDKwjMraEN865cBun/FFNqQE18AeZRbptGdAQtu91ApXmEIWPjH1mI9D1PpyWJYpBLo66//gLE9ubbAoxxouFK/UH6HZnWJet3+APSvU1wmRdOgV6ENbD8MqQ/OtvRVWgWO9vQksmTCqFCJiLY1VLT/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Thwvb5lfiJEE0rf97qe5a1kmZZD3rV0lGRlvnMB9SdU=;
 b=l336uIirqr2E0WwPVIcM0qWXxnn8Q/wKW2folJyCLR+ZHBjsWwWQT88u3PRcTcwldtIqXEW51tCUDM+utE4wT4UHo0eLqBmDysH2h0RN6O3kiSEd1pu4yRwW3pMBPLa2Obzq6Q6THYBDwS25WGt2/oa00x/NRBMAawK9ueB9z4DquQ8K1kjER8YIm9AuQNfnGuQiCQ0CSFtkZ9XjOAsly7k2FpkkfICOQ343P+N6Hvbu8lS7L//LwZ/yAlbihlcSS3wyyR494u1go754dAxy3JQyH2gruwKpcCao7xWZEzdtR3zbboH1zqBG0uBre53yAtIU25tyA4kw3bDeAJFb0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8598.namprd12.prod.outlook.com (2603:10b6:806:253::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Thu, 12 Jun
 2025 14:03:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:03:37 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:48 +0900
Subject: [PATCH v5 20/23] gpu: nova-core: compute layout of the FRTS region
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-20-14ba7eaf166b@nvidia.com>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e66f92e-2019-491d-234c-08dda9b9ed76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVdkSU45U0NUY1JmVmhyQ3VLMDFqU1RRYzZDQjdYNDdxNFFDVGVpa2hSWUZm?=
 =?utf-8?B?Sy9kaGp2d280Um5PWmZDVkxxOVVTb080VDF5MU00QnFJbU81S2lneGNMT3lj?=
 =?utf-8?B?dXdPRUFwL05JYlYxTGFzajhzcFkwRDZGYldrbDV6UytjNElBQ1FkcjlFeUNZ?=
 =?utf-8?B?c2paNFhCNFNIeFh1TjRHNXZ3TXE1a1ZIUjNySkJIdDhMYWtidjhLMFpxSXZ0?=
 =?utf-8?B?c0x5Ky9pY1h5K1kxWTYyM1hqcngyRUVjVmJLZjdUNzRiY0lqT3VPb3U2cTR6?=
 =?utf-8?B?MjZEbituaVRIcWJuSlEyWFhqcndDUFpGVFRmQVUwaHJMdWlsc1dXMUxxL2dD?=
 =?utf-8?B?MUttazNDTXlsdUg1aUVLMEF3UFNOTFBLcndNUTljVlZKNm9sTmJVdUJNMWFL?=
 =?utf-8?B?NUVmQmpkQi90TEtXZjJiNXJ4UEJobHNUZzh4cm9NUHltZmFIR2dKeVRlMGlR?=
 =?utf-8?B?RHViRk94L3BZR3pITU5KelFrZGI5NmNKWVlIN2tscU83SzViTEE2U1ZCaVZm?=
 =?utf-8?B?VUdzQitTSHQ4WUNEeVNab3lYWm1Qc0plenovSHE5WkhmOEM4amx6ajRwbzBD?=
 =?utf-8?B?Ti9KZDdTR0Qxc3c2TnRXT3MwNlp1Zmd3WWh5elY2RlhlNUYrZmJMYjlreGdw?=
 =?utf-8?B?YzZWNktTZ0w1cFc2cmZSTEttTDJyaFIrRUVPaDN1cVR5S0p6TEJ0dHFQcDgw?=
 =?utf-8?B?Zk55VWx1MzFieTNHYkpJUER1TUFHdS9NKzRPQTkrdHBYLzczUmt6QkV4cU84?=
 =?utf-8?B?VXM0Z3lzK0l0aXBRZ1BjbWtacXAzVEZZNjBjZDRsOE1EbnRiUjZlcG5LYWVV?=
 =?utf-8?B?Nll0YVE0MUdVZGN2akk1STJ1cGlnYjhYNk03WU45dWJtOWVvZGg4dnZGYmNI?=
 =?utf-8?B?dlJONGtpTmZtVlB5Nm9kalNoWmhKSjlidTNCQUZEMWZEdExXejdvVkErTEcy?=
 =?utf-8?B?K0VyQm1zQmF3dTFlV3FIdzlXa2paZDE2YVJSY1hoTXZoSVREbHJGbDlJQTg3?=
 =?utf-8?B?a002TGg0WU0wQk9jbjQ1S2VSa0t2eFg5T2dTSVBDREJCQXBvcUlPTkxwSkhL?=
 =?utf-8?B?eTJTcjduc2RGZnliaHlYLzJEOHhaMW41aFdSb1dDU0c1ZVhUN2ZHcVNpSkU4?=
 =?utf-8?B?aEVvY0lPeVhuUkpFZWN2bGhCRUlGSHhBUkdlUXVMRzZ5MlFZbWFJU1VSK2lG?=
 =?utf-8?B?bmxFWktHUWpEY01LaE01ckFIQTR5Y0ExMy9PVUJTUDVocGNBbnJ5eHUxc1Ji?=
 =?utf-8?B?UHJlWEx6UXBGemlCNWNMVXFEUksrdVNQeFhzYnFRNmtjN3hYTjdGQ09kQ3V5?=
 =?utf-8?B?aGVTdjF2dHNOTmltUldLUko5eWdydGhHbUF6NXZ6UGxGRmZBOXlBazZTWE82?=
 =?utf-8?B?dkZCbHE1Z3B0aVFNdjM1TnU3RHBSRURIcm1Tenlsa21YRTVLRDk1bEttZmNt?=
 =?utf-8?B?T05UTGhWOHNxZVAzM29ycUJUcTF0MmFkTWZjSC9Rb3VodG5tc21XUWdQUVBM?=
 =?utf-8?B?dUhtYzg0d2V6NGFCeGdxT3pzQjFCb2ZhNU1CNyt0cVdPTFRCbENqMjRqVGhi?=
 =?utf-8?B?U0pCQi9weXVzMmRDNVRpdmM0eW1BczZUaHE4MmtwWERtR1FBeUZPRnVJSFVt?=
 =?utf-8?B?enM1cUlBSmp1dExrTmN2N0FCUEVRdDROc21zenJGT09RYlZoN2hzU1lGN0JC?=
 =?utf-8?B?THZwN1FrK1pvSFBQaUtJeFN6aWxkTlg5bHJtZ0cwd09RbysvcDVoL3I0TFgw?=
 =?utf-8?B?UFR4QXNZMzljMkRXSE1Ga3B5azVPNnl5MXVLM0RyNlYvcUhhYXQ0U2xrL0xp?=
 =?utf-8?B?RDhlV1AyR3BMUUtFcmZFRHNiSDZUSk5MOWw1cW9QclFMeGpwZThXRTlOVkxO?=
 =?utf-8?B?aEQ1dWFjcGVtQncwcFY5dmhoakxKM1JIZUxwd1hKVTUvR2EwZmR2UmQxVjNx?=
 =?utf-8?B?R3dlYW0xRzNmWHJlT2wyUjI5TElzdGxGMitKT1dlUjQ4eW12MGxwUTJiWnBS?=
 =?utf-8?B?azVoelFia3VRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3FES2hKV0RlM2RjQStlaklRMGdORE9aQWxvMDRWbTNFTm03NWNCVDRpMFBH?=
 =?utf-8?B?eU9zQlRUUzhRa0tqTmFoYkRwbmNORmFTZDJLYXlTTUJ5MzVXZ0t6ZThDQkVK?=
 =?utf-8?B?ejUwNkZWQ1VaUHpYK0p2QlhNbzVnOC8wY0dzOS85MFJVWlFiRmlxZnhhcFo4?=
 =?utf-8?B?bnlqWE5lVGJUVHpUSElYZUFMNkYvd29SVFdvTmtsVSt1TTFjYWlYbEFPdmhw?=
 =?utf-8?B?dHJXcUtXNjVCRFFpeU4vZDAwa2NyZHM1ZnlJWGV5eW9NSzlHcEQ2clgwZVZN?=
 =?utf-8?B?Y2FtazdGQ3R2WDdKQmU2NFFaU0htdTQvUTlDb2JLM1N1a2plRlRmN0JuMWwx?=
 =?utf-8?B?cEdtR1VZUlZZaDZtcFRIbnBUUEViOTAzNlBkM052ZnU5OGY4SFVvQ2xnL04w?=
 =?utf-8?B?OGNvVUZhQjhzdWR3MFBzVXlEL3JuUmlPZXl1YkRKUkloV09IdC9BaFBKNkR3?=
 =?utf-8?B?U2xJendtT3lnQXZUU0pYaHZGMElwc1BVc1lQTWJGZldISnFYNVNUQXU5TlJP?=
 =?utf-8?B?SmU3blpDOTE4TzJqMHoxSnFOeWtaSkJZd05pZ2R5ZlVicTB2RHQ4OU9iT0hx?=
 =?utf-8?B?NlFPOGN3VUc2Vmt5dHpnWGpRYXpmZTVuTXBDUG5qck5nOTY5YXk2dXJYR0w2?=
 =?utf-8?B?d3g0cXZTQzN3a2VuQVdZZkxSZ01kYkVseDNzYjJaeVhJbFNLSklGaHpGdUkv?=
 =?utf-8?B?bmFrUHZYMXc0cGhReDJ3a2Y3Y3VWYm50OVQ5eEMvUjUxRGYyR2VXQjRZRTRV?=
 =?utf-8?B?NmtHY29MTnVhQjV5L3hnWXo4R0FhTVNqNVdsMnNsSU43WmlTRFpjaStneVFH?=
 =?utf-8?B?cEpKVnk5SzZKdE1sRmR3bjhmYm54Qkt0WDhHUzdKeXZnQVVEeGtzL3E0d05H?=
 =?utf-8?B?ZXJLUHJwMDFBWWh6a1Z2bFI2aVBpZGkxL2JwZlZQQ3dhdEI0NVorY3ZQV0lU?=
 =?utf-8?B?Mk4yYkxvOEFXbXFsZ3NQc0xkUTFGbk5RUkV0ZHJtVkh6cUhkSmlVS1N1eWpJ?=
 =?utf-8?B?dHFKS2dzci9LSDJZSndpNzdxTnVrOGtJdnBkL2hTL2JVTThQUGZtNVJNanlX?=
 =?utf-8?B?SHo0Sld4TkhUWHdkbWE4ZTFJcUg4VlJ2SWJTUDFOZVdIbmZsNTFvUVJkeURs?=
 =?utf-8?B?WWwrYlgvOG9MekcveFdjQnBHUmRlVSs4L3E4R1g0NW9ydmJZS21iWDB3Nmpa?=
 =?utf-8?B?N3NHc29qK0tRbiszVDlBeVFkNHEraE5LTktpWWpnSlNhOUVkckcwU0hCR3NV?=
 =?utf-8?B?OTVQbDRMUmpoNTJjS0xKdWlOUW9DaHZiazcvdVNuMXVQNHpSeXducSs0ck5E?=
 =?utf-8?B?V1Y2emlhQnFxaEFlV2gycDZqekJIVU5BOVRwSzdRTWFLN0hyQ3pjbDc4Nkty?=
 =?utf-8?B?WTRKMlZ5cVJvTFpmYzFycXdMMkxFK0pkd2pleEYrMUtBcWtsNFc2YkNLTGJY?=
 =?utf-8?B?TzN6dUdGS1pla3JLdGxMUEgwZlRhVW0zSUp5T3V4QW51RXFjdjh5VWV0Wk5Z?=
 =?utf-8?B?dFZ4UWl5L0JDOTdSWU9zK2FvdVVpcHBHeU9UYlpTNzRWY0piTlZnV2FlSDBj?=
 =?utf-8?B?VFd0bWFFS3VEQkxId2RtdTNqSVdVMTVEbkRTMVp6VmtHMTdQc05wZHB3bEk4?=
 =?utf-8?B?bW1jc0lacksvM3R0S1JtRzZuRmJGN0ZNczA4bitwTVo4a0NpYThMZ1pWVUtV?=
 =?utf-8?B?eXJBRjNJVENoYk9WV01FNkZxa1JVNzdOdndHYkZGVFc2VXh6Z21RZWpOU1Q4?=
 =?utf-8?B?OXp0NnphcnRad3VUNHcwODRVWjZXNW5UcTRpUnBTTncrQlAxaStnUUVpZUMr?=
 =?utf-8?B?dFhFSGxLMVhUVzJXdlF0dGNYZkRMSTdkSy9qeWo4NHA0OWVYM1UvYnpNeGw1?=
 =?utf-8?B?UGxiMnBpVStjdEFUNjd2T0N0eG1vM3orLzdQRG10OFZGQlFsR2d0S2J0ZW8x?=
 =?utf-8?B?bVpETkNXbkR5R1FoWDFqYjBUVVNNbDFwS01xQzZPRTVHUzBETE96bnNyQ1N0?=
 =?utf-8?B?dmxPNTZrVENNbjF4dVVVallFSyt1Y083Uy8rVVZ4TExoYXVVZWxHd1JOaGph?=
 =?utf-8?B?dEFWZ2hPWnNOQ1ZiZzJiWU1UTENRWjdxVXprcjF3TGxVZ256UlNnYklZUU9z?=
 =?utf-8?B?MytCMGk5WjR0dmR2dzZ4dDNxYXFXSEtCbnpheXZYOVFZZTd5VFVhQVBxTm5K?=
 =?utf-8?Q?r4ExDYqTGgDaFKU5LwZNnKFx2Vo6CBq0J+IlKy6rlWzD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e66f92e-2019-491d-234c-08dda9b9ed76
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:03:37.5695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Paj4hjhVbMDAqkWsRw47upwlTm1YPM6Ms10iCuB/DvzTqUqZA+kK5VgytyRZTMf3LVU1jzHDjVZaVCCR7Ig10Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8598
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

FWSEC-FRTS is run with the desired address of the FRTS region as
parameter, which we need to compute depending on some hardware
parameters.

Do this in a `FbLayout` structure, that will be later extended to
describe more memory regions used to boot the GSP.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           | 70 ++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal.rs       | 12 +++++-
 drivers/gpu/nova-core/fb/hal/ga100.rs | 12 ++++++
 drivers/gpu/nova-core/fb/hal/ga102.rs | 36 +++++++++++++++++
 drivers/gpu/nova-core/fb/hal/tu102.rs | 16 ++++++++
 drivers/gpu/nova-core/gpu.rs          |  4 ++
 drivers/gpu/nova-core/regs.rs         | 76 +++++++++++++++++++++++++++++++++++
 7 files changed, 224 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 308cd76edfee5a2e8a4cd979c20da2ce51cb16a5..39c7a7c506dd83776eb2b23f0bfb5c57a4d3f84f 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -1,12 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::ops::Range;
+
+use kernel::num::PowerOfTwo;
 use kernel::prelude::*;
+use kernel::sizes::*;
 use kernel::types::ARef;
 use kernel::{dev_warn, device};
 
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
 use crate::gpu::Chipset;
+use crate::regs;
 
 mod hal;
 
@@ -64,3 +69,68 @@ pub(crate) fn unregister(self, bar: &Bar0) {
         }
     }
 }
+
+/// Layout of the GPU framebuffer memory.
+///
+/// Contains ranges of GPU memory reserved for a given purpose during the GSP bootup process.
+#[derive(Debug)]
+#[expect(dead_code)]
+pub(crate) struct FbLayout {
+    pub fb: Range<u64>,
+    pub vga_workspace: Range<u64>,
+    pub frts: Range<u64>,
+}
+
+impl FbLayout {
+    /// Computes the FB layout.
+    pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
+        let hal = hal::fb_hal(chipset);
+
+        let fb = {
+            let fb_size = hal.vidmem_size(bar);
+
+            0..fb_size
+        };
+
+        let vga_workspace = {
+            let vga_base = {
+                const NV_PRAMIN_SIZE: u64 = SZ_1M as u64;
+                let base = fb.end - NV_PRAMIN_SIZE;
+
+                if hal.supports_display(bar) {
+                    match regs::NV_PDISP_VGA_WORKSPACE_BASE::read(bar).vga_workspace_addr() {
+                        Some(addr) => {
+                            if addr < base {
+                                const VBIOS_WORKSPACE_SIZE: u64 = SZ_128K as u64;
+
+                                // Point workspace address to end of framebuffer.
+                                fb.end - VBIOS_WORKSPACE_SIZE
+                            } else {
+                                addr
+                            }
+                        }
+                        None => base,
+                    }
+                } else {
+                    base
+                }
+            };
+
+            vga_base..fb.end
+        };
+
+        let frts = {
+            const FRTS_DOWN_ALIGN: PowerOfTwo<u64> = PowerOfTwo::<u64>::new(SZ_128K as u64);
+            const FRTS_SIZE: u64 = SZ_1M as u64;
+            let frts_base = FRTS_DOWN_ALIGN.align_down(vga_workspace.start) - FRTS_SIZE;
+
+            frts_base..frts_base + FRTS_SIZE
+        };
+
+        Ok(Self {
+            fb,
+            vga_workspace,
+            frts,
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index 23eab57eec9f524e066d3324eb7f5f2bf78481d2..2f914948bb9a9842fd00a4c6381420b74de81c3f 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -6,6 +6,7 @@
 use crate::gpu::Chipset;
 
 mod ga100;
+mod ga102;
 mod tu102;
 
 pub(crate) trait FbHal {
@@ -16,6 +17,12 @@ pub(crate) trait FbHal {
     ///
     /// This might fail if the address is too large for the receiving register.
     fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result;
+
+    /// Returns `true` is display is supported.
+    fn supports_display(&self, bar: &Bar0) -> bool;
+
+    /// Returns the VRAM size, in bytes.
+    fn vidmem_size(&self, bar: &Bar0) -> u64;
 }
 
 /// Returns the HAL corresponding to `chipset`.
@@ -24,8 +31,9 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
 
     match chipset {
         TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
-        GA100 | GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
-            ga100::GA100_HAL
+        GA100 => ga100::GA100_HAL,
+        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
+            ga102::GA102_HAL
         }
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index 7c10436c1c590d9b767c399b69370697fdf8d239..4827721c9860649601b274c3986470096e1fe9bc 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -25,6 +25,10 @@ pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {
         .write(bar);
 }
 
+pub(super) fn display_enabled_ga100(bar: &Bar0) -> bool {
+    !regs::ga100::NV_FUSE_STATUS_OPT_DISPLAY::read(bar).display_disabled()
+}
+
 /// Shift applied to the sysmem address before it is written into
 /// `NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI`,
 const FLUSH_SYSMEM_ADDR_SHIFT_HI: u32 = 40;
@@ -39,6 +43,14 @@ fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
 
         Ok(())
     }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::tu102::vidmem_size_gp102(bar)
+    }
 }
 
 const GA100: Ga100 = Ga100;
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/fb/hal/ga102.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a73b77e3971513d088211a97ad8e50b00a9131f7
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::fb::hal::FbHal;
+use crate::regs;
+
+fn vidmem_size_ga102(bar: &Bar0) -> u64 {
+    regs::NV_USABLE_FB_SIZE_IN_MB::read(bar).usable_fb_size()
+}
+
+struct Ga102;
+
+impl FbHal for Ga102 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        super::ga100::read_sysmem_flush_page_ga100(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+
+        Ok(())
+    }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        vidmem_size_ga102(bar)
+    }
+}
+
+const GA102: Ga102 = Ga102;
+pub(super) const GA102_HAL: &dyn FbHal = &GA102;
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index 048859f9fd9d6cfb630da0a8c3513becf3ab62d6..6f8ae58e9481017f1a81fb8e75fb24782e50a781 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -26,6 +26,14 @@ pub(super) fn write_sysmem_flush_page_gm107(bar: &Bar0, addr: u64) -> Result {
     }
 }
 
+pub(super) fn display_enabled_gm107(bar: &Bar0) -> bool {
+    !regs::gm107::NV_FUSE_STATUS_OPT_DISPLAY::read(bar).display_disabled()
+}
+
+pub(super) fn vidmem_size_gp102(bar: &Bar0) -> u64 {
+    regs::NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE::read(bar).usable_fb_size()
+}
+
 struct Tu102;
 
 impl FbHal for Tu102 {
@@ -36,6 +44,14 @@ fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
     fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
         write_sysmem_flush_page_gm107(bar, addr)
     }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        display_enabled_gm107(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        vidmem_size_gp102(bar)
+    }
 }
 
 const TU102: Tu102 = Tu102;
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 1c577d3eff8b32bbc45d7d2302c3e2246bef3b44..413f1ab85b37926cdfd9a9c76167816b21d89adc 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -4,6 +4,7 @@
 
 use crate::driver::Bar0;
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
+use crate::fb::FbLayout;
 use crate::fb::SysmemFlush;
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
@@ -219,6 +220,9 @@ pub(crate) fn new(
 
         let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
 
+        let fb_layout = FbLayout::new(spec.chipset, bar)?;
+        dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
+
         // Will be used in a later patch when fwsec firmware is needed.
         let _bios = Vbios::new(pdev, bar)?;
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index b9fbc847c943b54557259ebc0d1cf3cb1bbc7a1b..54d4d37d6bf2c31947b965258d2733009c293a18 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -52,6 +52,27 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
     23:0    adr_63_40 as u32;
 });
 
+register!(NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE @ 0x00100ce0 {
+    3:0     lower_scale as u8;
+    9:4     lower_mag as u8;
+    30:30   ecc_mode_enabled as bool;
+});
+
+impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
+    /// Returns the usable framebuffer size, in bytes.
+    pub(crate) fn usable_fb_size(self) -> u64 {
+        let size = ((self.lower_mag() as u64) << (self.lower_scale() as u64))
+            * kernel::sizes::SZ_1M as u64;
+
+        if self.ecc_mode_enabled() {
+            // Remove the amount of memory reserved for ECC (one per 16 units).
+            size / 16 * 15
+        } else {
+            size
+        }
+    }
+}
+
 /* PGC6 */
 
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {
@@ -77,6 +98,42 @@ pub(crate) fn completed(self) -> bool {
     }
 }
 
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_42 @ 0x001183a4 {
+    31:0    value as u32;
+});
+
+register!(
+    NV_USABLE_FB_SIZE_IN_MB => NV_PGC6_AON_SECURE_SCRATCH_GROUP_42,
+    "Scratch group 42 register used as framebuffer size" {
+        31:0    value as u32, "Usable framebuffer size, in megabytes";
+    }
+);
+
+impl NV_USABLE_FB_SIZE_IN_MB {
+    /// Returns the usable framebuffer size, in bytes.
+    pub(crate) fn usable_fb_size(self) -> u64 {
+        u64::from(self.value()) * kernel::sizes::SZ_1M as u64
+    }
+}
+
+/* PDISP */
+
+register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
+    3:3     status_valid as bool, "Set if the `addr` field is valid";
+    31:8    addr as u32, "VGA workspace base address divided by 0x10000";
+});
+
+impl NV_PDISP_VGA_WORKSPACE_BASE {
+    /// Returns the base address of the VGA workspace, or `None` if none exists.
+    pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
+        if self.status_valid() {
+            Some((self.addr() as u64) << 16)
+        } else {
+            None
+        }
+    }
+}
+
 /* FUSE */
 
 register!(NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION @ 0x00824100 {
@@ -211,3 +268,22 @@ pub(crate) fn completed(self) -> bool {
     4:4     core_select as bool => PeregrineCoreSelect;
     8:8     br_fetch as bool;
 });
+
+// The modules below provide registers that are not identical on all supported chips. They should
+// only be used in HAL modules.
+
+pub(crate) mod gm107 {
+    /* FUSE */
+
+    register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
+        0:0     display_disabled as bool;
+    });
+}
+
+pub(crate) mod ga100 {
+    /* FUSE */
+
+    register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00820c04 {
+        0:0     display_disabled as bool;
+    });
+}

-- 
2.49.0

