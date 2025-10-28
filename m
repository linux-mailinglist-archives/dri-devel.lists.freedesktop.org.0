Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE5FC1555C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 16:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DB510E5D8;
	Tue, 28 Oct 2025 15:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ia/RC/zA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010055.outbound.protection.outlook.com [52.101.201.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E941F10E5E1;
 Tue, 28 Oct 2025 15:07:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHl9G40Tx+Sd/kYl7e30KtI6YGyNI8+mrAEX52wKfUItmc+4YdM0MLrq6tAw+8BwDK+xR0zcc4484g3pt1jEzAyrRCMuOkCptLw4XWVNTc5XBaG2H+0xZ7ome5j1gYysSBvFypoVMPoT6OKC0CxVQ7tjMxb22brZJjOPJhlj6w7vv3mWDrMaKxQzExYDEPzfjsGgWO5apf4g0bYqMWZ9MjrxEdJkgViGxUE3wlHVSG3q12cwqf/WVRXphj0HfkL43pR0p14O7g7g8R8WgOWzNsbo58SfMr3rUljdbsk1i9/dCMOFfSu4QFmHfV2Q46SKUf6r9at0E91EyLkYmMWxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iE2Wnv4ABzNGxzjDUacxJh32ahtcvgCN/0oflg3y0vc=;
 b=ndjmFO1IgEaNZ4sbiZRLNpjpAZYk4GuFLswMf1OIJXRjIfxXEuhw4mOU2QNfCdBy5WCNXsuRNLOKBfCQk7asOidDIUy8tcI7jC56jZRPF13McAgMLsWAxtDIxnW7EYK5SNNYGPxgbpGErhY7IGeIJPpHVh1sevIsKf/dTQrjbRTatv9r/OvX1SxW1YS/qitYiN9pYQc+TOdWN5eu23NK2MUhq09XuwqPd9yw0KtHV9ORavLNBvyNAwPioQt+4ftpmonuleS97LUIFGaST4fkS5T7zOcZYLQ29Q1TQz9m224pqJ64fs0WTcQiEjdOdPjb0pHvB1SVdBJkB438uiyI2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iE2Wnv4ABzNGxzjDUacxJh32ahtcvgCN/0oflg3y0vc=;
 b=ia/RC/zAYXYEeukP/KBW0ZenJpvMPBnkb+0w4W0G+jzScyrUm69KJskZhHJazUE5F84PTuu4sTPPFXBsSGTnVt+Z3bNOlwuGFtX0efMj8kw80dq8GxNGc8fAinHagZvbDBGgpYtd0+MliFJrzsefT8lX+QPLiMgvMCi9uyfHq4kV3yIrmpdtMW0rDI4F+fjJJPHotrB17ek252gGBkOavjGeReb0jMVgZbeR09QbyQNLjfYWPvEVGEl5w81d+4KSd8g1sJsfwrGV7u7QLcq584/D7aB1PkF6842GDZVXokdzyv/yrEjMxQMkaJpVnydioKU1OXP1i1K/t+Df7c8cew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8924.namprd12.prod.outlook.com (2603:10b6:930:bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 15:07:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 15:07:52 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 00:07:38 +0900
Subject: [PATCH 3/5] gpu: nova-core: vbios: use FromBytes for PcirStruct
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-nova-vbios-frombytes-v1-3-ac441ebc1de3@nvidia.com>
References: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
In-Reply-To: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY1PR01CA0193.jpnprd01.prod.outlook.com (2603:1096:403::23)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8924:EE_
X-MS-Office365-Filtering-Correlation-Id: e382638f-5c96-46e0-85fb-08de1633c3eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aThUQkVxZE1XdFcrNFlMdUZZQ1IxdWNYUmIxRjd4RXZQRkNsQWhUbjZkZDAv?=
 =?utf-8?B?UFNDQjkxRjl4cC8rZHp5cDJha2dBRGJsR1Rzc25lZ2JEUDFWMk1Od2Fqekxw?=
 =?utf-8?B?SmRmL1QrVzgzZUtabmx5OHlsVTFTRnFxMmJtYVpKMXdmQ0lLQnl6TWxLZEpE?=
 =?utf-8?B?U2NZVElHbW9ISitCSGNmSnZLeks4cDdyVDVEdkpweTIxNzAzWHFReXNwNm1X?=
 =?utf-8?B?alBscVRNUEhBTDRQc0szTEM5TU9iTXZ2Q1RjaHdUNXpjaDBwcE9ldFlzbnk5?=
 =?utf-8?B?L28ydWdmdHVUeFVMSGIrK2x5VTEwN1NqdDJzMy81SXNjR2ErbWRaZGJ0VDE5?=
 =?utf-8?B?V3VNMCtDQkp2Ymg2M3phamN4ZnlHbjBEcXZYZ2FqdW1uOFAxeGlJTXd1ZHQ0?=
 =?utf-8?B?L1pKQ2dUeG96NGMzQzExKzRiNzZ0U0M1UFgvNDBNUXg0NG9aSmFJcEwvbWI5?=
 =?utf-8?B?T3ZxaDI1YjJINFhIMW1xbVdldXlpSVF1Zlo5czJWcXFPdDFrclpkbld3aFFN?=
 =?utf-8?B?YWkxS3JIYlBFZFJHWFF0TDVMOHJIdFlZUkY0QjQzOHkycTd5dnVYYkFqSUZT?=
 =?utf-8?B?MjBEeUtaTTFqRTRyODN3OXpjTHhFWk81eFZQY0hObjRGR254VTdPSWFKSlRD?=
 =?utf-8?B?UWlFK2EzWmJBN0hERzB3SW5NN0U3T3hQMEl2U1ZrMEIvQUZXdUJMUWNLamYx?=
 =?utf-8?B?dHliOTNxc0pKUkZGaklFMFhrMXpXSFh3bGxvRitYSC9kaEtVL2UxTmdtOVVP?=
 =?utf-8?B?YkZkSzcvU1JGaGFqZkVsUmIrKzFiZ0txVXg3VnY0UERURFZWYkVxVzlnTnA5?=
 =?utf-8?B?Y05BNk5aMkZXR2tGMDEzZmpUQkZJNWFrMmFxRW10blpjczVhenNoMlpvVXV4?=
 =?utf-8?B?ZnJuV3hEZXJFYTI2VWtNK29ka2ZLbWp6RVkySEVCTnBGMEtWNWZONlUrdldn?=
 =?utf-8?B?UkJ5M1NPNjJXZFYrZXBFQ0Z4SmczdGY5WlF1eDBoeDNRYnBHZ3dxRmZ0MC9B?=
 =?utf-8?B?NE11aVRod0JRVXFJWjRMVXlKN042K0ROeUtvMzRXTXFMWUJEVkg4VFFrUSsv?=
 =?utf-8?B?eWZ1ckxhQ3pvdS9MSmpXcm5NRDRvYkkzT3h1azRBbE5KSU5Ja1NWMEhhanA2?=
 =?utf-8?B?Zk93bWUvT0FERGc0VG1lZExEcXlsalNLVXJ1dTVFUlJHcjNoYkErRG81RzFr?=
 =?utf-8?B?SkZvLy93TzF2WVF4Q1YvQkJsQVNIcHk2MWRRc054Qkt0cEFNV0JGQ3V4TkZU?=
 =?utf-8?B?bGgzb3FFL284d2Z1QjFzV2VGbnlna3hxWVBxK2lIVWN1c3VCYXp4ZlBXYmhK?=
 =?utf-8?B?MzJ2dTlhZEZaQkJwQWZRMUp1RTh2RHFDOTdQOUprTnhWN3ZISkQyZzRJT2Y0?=
 =?utf-8?B?MGZIc1ptVzlFTFhSYXlLekFXNUJuOFRJeFFkNEFWRndpRWpIMHRhU3NHcXpE?=
 =?utf-8?B?WVhvb3Z5bG1zYjNnQ05rem80dDY5RTlGM2RacitBcGJRTHJXeWVIbHYxTTFn?=
 =?utf-8?B?VE9OUHVCVzYzRlFxdFBtczNLaWNIRUVpejRSbUs0T3pMN2VzUkJJamljZWtm?=
 =?utf-8?B?SDBOaGEzNDFjaU11NEF6WThpVnRkNS9sZmFSeHlweFdUYlZ4TTFNTWo4WTZ4?=
 =?utf-8?B?RWV2eVRkY2w3WUdwVUExWTJKMmhZVTBJamgvaHZ0TWpMZmF0c3hTMXlUZTAw?=
 =?utf-8?B?RFJhS0NDQjJSb2xneUE5MllhSzBiSlNsdFlQbTE2WmI4L3k4S0ZtZnF3blM5?=
 =?utf-8?B?TzJHS0c4cTh6MTZMbXFnRVg4MDhhQ1ljbEU1YThDOUU5QkR1czRPeWFvTjRX?=
 =?utf-8?B?Z2hXRXdCOERibTVLdDF1L1JtMTZucmxuOHM3VGd3aFpaK1JiVVQ3RkpUWllI?=
 =?utf-8?B?dFdRQW10dGV3Z1FzeUpRamJMTVhrbHdhams3WUV6QUF1b0o3dVBZbU1xT2lD?=
 =?utf-8?B?d01iMFNCRUlWLzNGY0J2SGVkUmlSVXFPWVFTNjQxVjdJNUxZRWpQUUw5Vk9J?=
 =?utf-8?Q?n/dySTVQyIxGuryIz9NoXQ+cfNq/4o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0hQa1ZrbXRUaEh0a21MY3c5RzF0blo4VTFoK0w1TlhpNDFhTkxxNlNjVFQ5?=
 =?utf-8?B?ODdoaEF4QzhUSTY3Y3RucW9QNHFHQzkrTFVCQWpPU1kzWnpsTEpmYTFDMkNE?=
 =?utf-8?B?OVVpTXNiNlVOR2g1V3VqNUw4WGY3cUJ4WTRhTjQyeFk3VmYxY0xKdm4xa0hP?=
 =?utf-8?B?cjJwRVBmbDNnaGVYTmVBWGF3R2Q0RlVUdFUvaTR3MnF5Q09IN0FZL1VyWHhK?=
 =?utf-8?B?UXZCUjUzZVVHS1BjcnNKaXRMZlF2NXhQQmRnT0lPbG9nSkNJbkE3OHkwUk9a?=
 =?utf-8?B?by82SnRzTEhYaUtrR1BKeFhidmJTRHFpVGVIWmpXV1NBOHorL2tYVjVXOTVZ?=
 =?utf-8?B?NVlqUlozRUNGenQ4Z0ZoTldSdTlVSTJ0RVIySHNVWU00UU92cmd5TFB0c0Rx?=
 =?utf-8?B?TmdWWnFGejRJQzkySEtEbloxNHNjVmJtQ1I3bzVHTmVLNThvUEdEVFJzOFBR?=
 =?utf-8?B?cy8wTjdTbmNXZEIzejh6RFdGSjBFMWdkeHhkbzdFTlU2K1Z5dXJvTTBOME8x?=
 =?utf-8?B?dVJrYUE5bjExOGtuSU5rRGYzOXFNRmlWSmFnd09OTmRVM3djeFRlZUpJNUNu?=
 =?utf-8?B?VmdNbkFTV1RTZUxLb2R4bDRzTjdDS3BkT2RRNHBmQlQ2dnlNK3VOeGp2bUhn?=
 =?utf-8?B?OHgxL2ZFQnNCNmh5WjZEeWk0RUE2WHExMEtEREpLaG81S29jclpBQ0pnb1lt?=
 =?utf-8?B?ODFsNlZSTE81eG1OM2hFSnFSYXd1U216emZHNFNEbGNZV1RpNHltR2pwZ1JK?=
 =?utf-8?B?VGJjRHhnb3BKNk4zUDlVOHdHR0tPL2VVenVvTnkwblpHMjlmeHc1UlI1SjQ5?=
 =?utf-8?B?NTZ3eDJXdGlpdW1JQVZHU0tpRnlYWGhQamMxWTZaWUIwRHlxSXdBUnBSZVZm?=
 =?utf-8?B?ZE5EZmI2a1lLSnZXWmM0UFlWdko0TXltck9hYk5sVGR2QjlKc05WU0JnbWU2?=
 =?utf-8?B?NlBFVkFVTzdvMktyaGtSRFVPQlRkdnRldU5tTGV6NWlYUlBSZWdEbzh2Tm1p?=
 =?utf-8?B?WTk0Ulh0RUpSMXB4Zjk2WlJEUjZRWjJsdm9yRFlXWUN4azlZS1UybW9DeWxj?=
 =?utf-8?B?NkxCdlV6VUV6QjR4ZlE0TnBmeW1hMkR6SGNsb0RCdEJhcVRyM3hsV3dBT3hn?=
 =?utf-8?B?bnhLWWFjRXQvRkQ2bkFubk1VOTJUR0ZnM0VXSWJqYTc0YXZ2eWpwZzJMT25s?=
 =?utf-8?B?QndIc2U2SUZjVUxaVzZTOFBNT2h6Rml2czlPZ2p6NVBDSkdLK0ZsTEkxWGZJ?=
 =?utf-8?B?ZzVSbkJyazJRQkdYU3V3N2UyOXdYanB2WE9Kb2lMZjZOclMrKzB5bzRrTUM3?=
 =?utf-8?B?c0Q0ODVjYVhuN3crbFlmeXZrWG4rTTlkdWg5dFNCS1hGcHBrMmxpL3VYbXNl?=
 =?utf-8?B?Zmh2SXkzUnZJVXZSSkdTVnJtRExLajh0V3MzWTRvakxlK2lMOGFlT2p0M0k2?=
 =?utf-8?B?V0lmb3pzR1ZPdTFBd2ZwV3BtYUtFYWNmMGNJaEdXaTZCNURsR1FxT2hJRjcv?=
 =?utf-8?B?OE1ocjc1S0c4bTZzRFVQajYra3U4TjBIN1ZmeWJBT1daNzNLOS9DOXlZdFZX?=
 =?utf-8?B?VDVDcXd3eVZmNERyZGlzb0l2RW5mc2RnamlwUUhWYUcyeDZHZVB0cDF1UXVt?=
 =?utf-8?B?TVdnMjdGdjVhL29NRGMralBWZTlHQ1pEL0VVR09jblFVN2txcG91QUlSMkxQ?=
 =?utf-8?B?REtuYnNoZ3Z2dzU4U2paOE8yYmdvZ1E2RWpOSGtlYjY5ZnVsVHc1WmFKN0Jw?=
 =?utf-8?B?NlRQcW9BM0VYRERxYy9iSHVoUlV5cmIxbnBRN2pub3NXZXk0NVBwQU1Nc0V6?=
 =?utf-8?B?b0JreElKU3k0eHh3R3JiM3VYdVFpeUp5QW1SLys3YTkyUHZvaFlRdUZTNER6?=
 =?utf-8?B?SjF6UW1SMXk1WmtPU29lSDlXRUxJQVd1YnZGTnJQMlRIUFZKWTN6YXFBZGRW?=
 =?utf-8?B?Q1BZVjhDazMvdjlGd3EvVUVQWGdWbm5yekE1cnBqNWV4RG42TytZdHRTdHpt?=
 =?utf-8?B?bWZ4OEtKVzVCSnA5cVNiTm03bUwwRHBva0c0VzIvOXlJS3A4WHQ5ZE8yaDVM?=
 =?utf-8?B?Um82S1ZsK3drUUV3ZUdYZ1BVWUhyRHdKcXV1dEZHeW52MVpGd0t0aW4wU0dW?=
 =?utf-8?B?Y1NVYzUxRFhER29jcndVRnVIcXVYaXRiN0NKOUFsSTdxczF2bXJTWGhJS0Yy?=
 =?utf-8?Q?Q0h3/SOoXMaD1XJlyN9JITzhefz26EoMiJ8JIxax41i8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e382638f-5c96-46e0-85fb-08de1633c3eb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 15:07:52.1985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMnzd0of+QcEttPkX73hReeubXCTmJHhuKC3/lGZWW3hhFPXwIgGOTiav6goEF+R150D8vzOwze/sBoloA4V9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8924
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

Use `from_bytes_copy_prefix` to create `PcirStruct` instead of building
it ourselves from the bytes stream. This lets us remove a few array
accesses and results in shorter code.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 40 ++++++++++++----------------------------
 1 file changed, 12 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index b6c20627a5e3..b02a1997306f 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -314,45 +314,29 @@ struct PcirStruct {
     max_runtime_image_len: u16,
 }
 
+// SAFETY: all bit patterns are valid for `PcirStruct`.
+unsafe impl FromBytes for PcirStruct {}
+
 impl PcirStruct {
     fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
-        if data.len() < core::mem::size_of::<PcirStruct>() {
-            dev_err!(dev, "Not enough data for PcirStruct\n");
-            return Err(EINVAL);
-        }
-
-        let mut signature = [0u8; 4];
-        signature.copy_from_slice(&data[0..4]);
+        let pcir = PcirStruct::from_bytes_copy_prefix(data).ok_or(EINVAL)?.0;
 
         // Signature should be "PCIR" (0x52494350) or "NPDS" (0x5344504e).
-        if &signature != b"PCIR" && &signature != b"NPDS" {
-            dev_err!(dev, "Invalid signature for PcirStruct: {:?}\n", signature);
+        if &pcir.signature != b"PCIR" && &pcir.signature != b"NPDS" {
+            dev_err!(
+                dev,
+                "Invalid signature for PcirStruct: {:?}\n",
+                pcir.signature
+            );
             return Err(EINVAL);
         }
 
-        let mut class_code = [0u8; 3];
-        class_code.copy_from_slice(&data[13..16]);
-
-        let image_len = u16::from_le_bytes([data[16], data[17]]);
-        if image_len == 0 {
+        if pcir.image_len == 0 {
             dev_err!(dev, "Invalid image length: 0\n");
             return Err(EINVAL);
         }
 
-        Ok(PcirStruct {
-            signature,
-            vendor_id: u16::from_le_bytes([data[4], data[5]]),
-            device_id: u16::from_le_bytes([data[6], data[7]]),
-            device_list_ptr: u16::from_le_bytes([data[8], data[9]]),
-            pci_data_struct_len: u16::from_le_bytes([data[10], data[11]]),
-            pci_data_struct_rev: data[12],
-            class_code,
-            image_len,
-            vendor_rom_rev: u16::from_le_bytes([data[18], data[19]]),
-            code_type: data[20],
-            last_image: data[21],
-            max_runtime_image_len: u16::from_le_bytes([data[22], data[23]]),
-        })
+        Ok(pcir)
     }
 
     /// Check if this is the last image in the ROM.

-- 
2.51.0

