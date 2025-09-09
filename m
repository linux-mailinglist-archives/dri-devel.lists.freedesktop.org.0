Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0BCB4FED4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D012410E790;
	Tue,  9 Sep 2025 14:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dZyMcKnt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2063.outbound.protection.outlook.com [40.107.102.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4234210E790;
 Tue,  9 Sep 2025 14:07:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4+410JnyowziN67LlNQfnEn3a5B02g2vdHwFDO1DB1ui28lf1o26jYcIxJwlpDQk11MkRvpYpXMsnQBSkk2qdpBM6sxck43tuVUr0WiXYUIrvu7LwWoaJgl5dS0VETjBId1BehDcnQdj7Gem8eCI3wB80csWOkfNZC3UEv+v7/Xt722J4aYUt34EQwo0mqPOrT7Iih07LIV+53mEnsAFGPG17YTXywD6dIk6EYaldNMUwyIJUrt43HIzu8OLrb5GwV9TrLse6O7WWSQJcVbBHqm3aaXwc+9sCG/31L3eiKbsxowAJALYHV+FyeYxwV0UZ7p95v82hPlZumudGFGFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khYPdKKPukTn3lGYBhNZEVPOR2fvDLf8BIIlY7NJ0PE=;
 b=I8jWYHwhMWyhWBhTj+lW50PLRjmsXS0WmwHhMflUwY9S5/Nw/VDWY0mbVDS8mrFYcbIcjmVGPM5C9AQ6zvC8S51CyMuZ6RqqjKMv6e7qdJVUF8iJXWQYYXgEY/UadaeDJxV9s/xRErc472wuUj5N+uK2rNUhiQMPwG00GmWzpc1Qs7NDrSvMbNYAU9dl1TfFXZ/GTsjCpPvI4u2ihf3AFe7w/Zl/3aCxK8tzLr1vS09zm6jN2oaYFt9J45LCGxFrwp2j+WxXktAs4wjPFQN/rudx3WXZX3WnpfmEexWcV5HvY/fzCw0d8iHKfciXzoQapR/XE2hCguiLmrt1USJ1ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khYPdKKPukTn3lGYBhNZEVPOR2fvDLf8BIIlY7NJ0PE=;
 b=dZyMcKntsdA8JLtqmmVqK2LpsVaJNW4tKOURSEnjozPZth+TDmcZVQ/44hd721ZIFKn8DSg0pXZlS9Z0Ac4wS3oD7uVr3ylbknD3bhHtJ8H4uQh6C2+vjM34BT2icsjDuGJRi80T0WCOEIv8wyP6YKvWkaKBCIbjil1oF/UganJiDZTAfKWpsNz5JlRCEirt16hZWFc8wH7UuGQC/DTAaO9Vg2HdpPR5ahAtbnoEPkwfx4163R8JazNlOH94OMpGhSEvJMoJzN0tJdfFFbqCWbChImZzjC9GKZCxRoxems0Xdk6SgJToflqZLe3m1xenGxuyYylRebg5ysFnhuQSbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB8801.namprd12.prod.outlook.com (2603:10b6:806:312::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 14:07:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 14:07:26 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 09 Sep 2025 23:06:47 +0900
Subject: [PATCH v4 11/11] gpu: nova-core: compute layout of more
 framebuffer regions required for GSP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-nova_firmware-v4-11-4dcb433d5fee@nvidia.com>
References: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
In-Reply-To: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:1::26) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: 278d525c-7167-4162-de2d-08ddefaa3493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dldHUkJJeVE4ZGNBempvRXJ6dG9DVkJhamxndlovdEJXdGphdzdRT0hnL2RX?=
 =?utf-8?B?ZGxSUnVZVjM1a3RlQzFjK25qVHpJSFY5TGpHK05IUktraklHTDgvbmRqMytG?=
 =?utf-8?B?WmpNc2VIOE5TQms1b2Rtdk5iZGJmRUdUd2NCSXQ4eHFIclFWVmpUWlhHMlBw?=
 =?utf-8?B?K3R0Z1dHQXNncFZtckpHemZsOFhsbE1RQ1h1a1JmU0RmRHRWeGJsUERtbGEz?=
 =?utf-8?B?eTdOaVdON3ZuMG5wc1h5UmIwdkZYbzJvb0hib2V4SkpFU0IzcGxtOWZvRnR0?=
 =?utf-8?B?bkZQUkErUFQ1bXdJSDE5dTJGRmN1MW1FY09MMGRjT2E2WSt4cWNwUzRtQm9Z?=
 =?utf-8?B?dDhVcWcya1UxMFFhUUt1eHA5KzRoVXFZbWw1cHBnRnFoNzkydHRId3NoNm56?=
 =?utf-8?B?RkxCa3BITm0wK1JXZzNiaU9qSXg4eVhyUDFsUzZSR2RLYXZZZytPWlhlUzdY?=
 =?utf-8?B?cmdLRlNoWStDcnkyd21DTTd2VnVxK3ZRSjk5QmtEbFZVMlFUNFYrMGcxRDVN?=
 =?utf-8?B?WW0xVzl3RitHYmdDdUFuenVGS3NuUnQyYzZUeDZEbmlhQ2FOTjQyNi9PSVVV?=
 =?utf-8?B?ZXZrTTJrYzR6ck9WemJEWjJHTnFibGp6YVpnQXJaSEhQZjFhT2JESjRVMmdJ?=
 =?utf-8?B?N2JJSE43WnNveHpGOEtCZ3lNbTZlNkMxLzFUK1l2OWZaYXc4UWFvc281UDNu?=
 =?utf-8?B?Y1lwQ2F2TzM4UkRlalVCcjhrN2tENXB4ei9yY3ViSUxxMlZxU0JyWW9BNzdV?=
 =?utf-8?B?WHlkeDRsMzdUOUl4cnArT2JjTE81aVhEdmlJVUpMVDEzcXlBckNoUmtnK2hm?=
 =?utf-8?B?SDFEdDVPY3g3K3QzcjU5emtQV1pIV2tTMExHRU5vSHY4aGYzc2VJSGRkdFdU?=
 =?utf-8?B?bTlocjVmUlZJRmZWOHFWL054ekh5S2JWQTVjNjBoMTdmNzJIdlZWcldOMkZF?=
 =?utf-8?B?SzF4TndIdU12NGJCU25OdksxQ1NHQmoxMFNwaUhad1VEazNMNmJySFdpcEhU?=
 =?utf-8?B?OTkwVmVsbDRhNlRZTkR3bFVId1prbmJRK0F6emwzcDlWZGZ4eTg4azRqaUFK?=
 =?utf-8?B?OFVLK2psa3lnM0lGTUN6UjIvVXJXWnltUmV0ayt2Qnc2aFhYN2RqdGNiOG5p?=
 =?utf-8?B?RkVTaUhVanVuTUhhV3B6eHdIWlJtQ0djbGMyVTM5bjZ6LzZsaCt4d09QZEVm?=
 =?utf-8?B?ZDRQNVYxV0JROEZUYUxUU1JCZllka3FRNmd5WXBnN0NxY2FLVUdLTzhDODZY?=
 =?utf-8?B?dU01dU1BMTFsRmsvUmhZbFpsMlhhWUtyclpPSjBTNStKd1l5UklUakhpUjRp?=
 =?utf-8?B?dm85QVN4c1pDSndvUllRdHVmdHhwSkhUY0tVQk9iMm9FSnprN0tJSlpHZXU5?=
 =?utf-8?B?MVlkd3o0UVU2NTdqa2pqRzczV0ZGWTJ4dnYwbVVTOE9DMmZ1aVI0bFNjcXFr?=
 =?utf-8?B?WElQV3Q3OVcyaGFxbjNsc2cyUm5IQU85WWpzdG85VnlwelFpcjBTM0MwaDFI?=
 =?utf-8?B?VmMySWVDOEhhYjJ1TlJvckxJVjVnN1cvMk1ydDV2dzNBUVVCZzJlREN3VzBS?=
 =?utf-8?B?ajliL1Q5YmVDK3JYUVFId01lTkI1SEN3MW9ab25QdzZHUGNQbEh0MU1iTHMw?=
 =?utf-8?B?dVBDMytjOG9iVzlrRE11c29FcXh0d3RKWjNsK1d4bzlKWjY3UUp1bEcreTdp?=
 =?utf-8?B?Mnpaak0ydXFaMGNIYnZGV1VBc3FzQVIzMDA2QUN3QTlib21zd2Z1cVdlYXBK?=
 =?utf-8?B?VjBKSzhsWGRZeUhJOVUzYmQzVE9DUDNHRTV3RTFsaWhZeG0yYU13L0dnMWxl?=
 =?utf-8?B?OUthZis3S2lGZGZaUlNzYzNrRVJXNzFSYkhzMU1sY01PcTRNRXJwZ1B6a2RV?=
 =?utf-8?B?Uit5dmMvQzRBZWExbWZGczVOT3RjN2dVUlcxSStONjR4NXdnNzlSUTFIbWhk?=
 =?utf-8?B?WXRSSzJ6ek5kVktPbGhTRVRIa0tzcFhpS3M5OU91UkNFdlhVWStDa0x6cm9p?=
 =?utf-8?B?eW1iYngwcHRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFFOc3RFMGVoN0tteUpWdkNwcHJYMTZqaEcrWW5jaDZjZGdScWZpQ0NKSEwv?=
 =?utf-8?B?SS9yRGszZ3RDaHNmN1NyQzlrVVpnR0pEcXNubEhWYms0SGlrZnB6aUVtQnJl?=
 =?utf-8?B?Rnc3YWc0TDhYSGhEUjhONXJGTVJ4Q2M2NUdwZ2s4dGQrNGNqbmJWeXJGT1dR?=
 =?utf-8?B?OE9LNDR2dCt5dnoxSmZWWHlrRlpJNjdIOUd2c3YzSkE3Ymtyb1E2d0VPV3BQ?=
 =?utf-8?B?S2d5d1ZiTlBsYi9NSGE2d2o0dlhJbk1JZk5CblpZWHB2ODdCcENINVFIRjdR?=
 =?utf-8?B?dlVXT1l2S2NyZm54ZjZwREs1bU5vaTZRYVoyRWdvemw0Z0lSVEJsbkxpM2NY?=
 =?utf-8?B?V3RXOW5kakgxbnJrbWdJWDB5Zkx5K2pXb09CUExselNqZjlpcElObENPdVZF?=
 =?utf-8?B?N1lYS2FNc0d6WHh4YkhlWUswSHdZM0V0dlkzeGtmR0FsTVlPRGtBb2FoTzVH?=
 =?utf-8?B?d1VPUmkwbHJsTGFEN0RXQWZSNnRqT1hTQXpDQXphZGN3WXdveXgrdlp0cU1K?=
 =?utf-8?B?enp2RjBXQ0xMaXdZc21OdTJyL0hGV2FxdXhSaGkvYjdRS0JETmpuSWk2b3p4?=
 =?utf-8?B?bkpPQ0NHN0NWakVORGNjQlBwOEVkK2pheUc5VHY1dG5sRVRLS21XQXl1Nlk2?=
 =?utf-8?B?L3pNMkRhbGVkRzNVL1RJbzBDbktNa2kxb1BoMlJRSDFaaElpaXIyejJjTlYv?=
 =?utf-8?B?M2NlUFpUMnNGV0xNdnM0QVlUVEgrV0JicEE3OGVlUE5jRWFWZmVtN2J2dktx?=
 =?utf-8?B?WG9lMHNwSG13U0I2cnhqWlFwT2o5RTFRd1BHT3hocUZOQU9JWEJ2b0tHTm9r?=
 =?utf-8?B?WlN6dit2TGV3ZE1hL2hhbVZNUVh0djVmYlBqdVJmM2JkMFFZYlRlaGltbjV1?=
 =?utf-8?B?ZUpBOXhjSUJZLzUvZXJvWHJsK05iMkxCK3BuQnR0cHZhWFpVcDdDMTVPcWlQ?=
 =?utf-8?B?Y1c2NjlZSk5ueElCVmd1ZWc3Nm9YR0V1NllaT2l1UVc2cGlZS0cyZ1B2QkVC?=
 =?utf-8?B?dStLR3FjQTR0dytZTkJvOFdJUkYrc0ZsSmJyM0R1TUpsTlQxVlNqU3MyWVBu?=
 =?utf-8?B?RitQV2RmbTQxUGlNZmVLRWdoL0p0KzV4QnZvV2I4N2YzTjRmUWM5MUd4dUpv?=
 =?utf-8?B?eUpUWkhLNWl6MlBLZ2VENi9QOHdwdUkrc1VERTlhZDFmWXNGRXowS0VQbE9h?=
 =?utf-8?B?WUlINHJhSHVkd21PNlM4aEIzMXlZYzdhV3FSenJYQWRhNGNhSGFPWE1mNS9Z?=
 =?utf-8?B?SkwvcVppY0tSZVlnZE1aSEI2SlQzNUZTamJmNWFQOWswd0w3RitQV1hlMlR2?=
 =?utf-8?B?YlRkdTF5WXJIWS9GN01QTFp2NjFxczRiSUFYOHZPQmoxdVNaOWg4R0oxcmJ2?=
 =?utf-8?B?NDJwd3RlRFBzckxVTTdDdzlsQVd4Q3krWTF3NFU2bzJ6NEl3V1R2Vko4cWM1?=
 =?utf-8?B?MU5CM29GdFdHSXFWZEtYeW9hTHBuYzhONVlmRHZzT0RqNlB2ckc2UUhqY0xH?=
 =?utf-8?B?VFdrbjhib3RvUzFLM2lWcXFCZURKZGM1ZDVjTFd2V1dEVld1WG8yVGFBVlVF?=
 =?utf-8?B?WFJnZ2twa29iWVFONWlLNkFOaEtuMUovaXMvdmhBSVFBRytlS1I4QnA0WDdK?=
 =?utf-8?B?SGNvSHYyS0VxK0xGUjRvVjhINDBhcGs2T2xiL3JIRklCM0hpOXZmZm1SNUx5?=
 =?utf-8?B?VGk0TFhLcUlVbHBQSytkTnpmVGpGeEZOR3pxQ00vTmhsd0RLNE1UaUIzUEVG?=
 =?utf-8?B?ZkJ6U0l0cDdVWVNhdDhMbm55ZnA4QUNBYnpSRjQ5eE5vWlgxZ1MvNjN3dy9V?=
 =?utf-8?B?M2hPVFNSNm1UWEQ0cHNNb1VkYTlYODhZSkwreDV3bllHdG9oZkg1cU9NS1FR?=
 =?utf-8?B?bTZZN1k0MVpsVXJYMlZCd0pOUlNRbFNkMnBDZlk1KzZWMlJVdXkycEVaYjdx?=
 =?utf-8?B?YUNsVlF6ZWN3STFwSm5acS9zZXlUR1pLeVlHa1dXSWhOWDI4YWVwT0dIY21a?=
 =?utf-8?B?VEdzelpBRFNHZVVZbjRleldLNUR5US9mVitqNU43Tk8xNi9jb3FwYm5FTWhj?=
 =?utf-8?B?T3VnUDBQUStKUnd3U0dkSThvQ2c1MytpdmJUVHlIcFV3bDJOR092QVlTN2J4?=
 =?utf-8?B?b0lhWVFZODZJdmptR1VPeExTUHRaMk03eGVTN3hleTMxbzF2ZDBqM2FDTFJ3?=
 =?utf-8?Q?KahfLfIyaU/Of3w7oKFAv6PhdqbvAhhtrT+GW+OT7iMj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 278d525c-7167-4162-de2d-08ddefaa3493
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 14:07:26.3749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YT2rhyM2Ss+AGfnuKyJRy9atmUfhK79FbKkKX8LV6RZ2HNtAEgvY8QvBmbXYpVqucbMsfkOubmh6uFCzqRwr9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8801
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

Compute more of the required FB layout information to boot the GSP
firmware.

This information is dependent on the firmware itself, so first we need
to import and abstract the required firmware bindings in the `nvfw`
module.

Then, a new FB HAL method is introduced in `fb::hal` that uses these
bindings and hardware information to compute the correct layout
information.

This information is then used in `fb` and the result made visible in
`FbLayout`.

These 3 things are grouped into the same patch to avoid lots of unused
warnings that would be tedious to work around. As they happen in
different files, they should not be too difficult to track separately.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs                       |  65 ++++++++++-
 drivers/gpu/nova-core/firmware/gsp.rs             |   2 +-
 drivers/gpu/nova-core/firmware/riscv.rs           |   2 +-
 drivers/gpu/nova-core/gpu.rs                      |   4 +-
 drivers/gpu/nova-core/gsp.rs                      |   5 +
 drivers/gpu/nova-core/gsp/fw.rs                   |  96 ++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |   1 -
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 125 ++++++++++++++++++++++
 8 files changed, 292 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 27d9edab8347c5ed3be104d62a9e32709238bb92..4d6a1f45218368dd3c0e79679f2733b5a15725e0 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -10,7 +10,9 @@
 
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
+use crate::firmware::gsp::GspFirmware;
 use crate::gpu::Chipset;
+use crate::gsp;
 use crate::regs;
 
 mod hal;
@@ -87,14 +89,28 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 #[derive(Debug)]
 #[expect(dead_code)]
 pub(crate) struct FbLayout {
+    /// Range of the framebuffer. Starts at `0`.
     pub(crate) fb: Range<u64>,
+    /// VGA workspace, small area of reserved memory at the end of the framebuffer.
     pub(crate) vga_workspace: Range<u64>,
+    /// FRTS range.
     pub(crate) frts: Range<u64>,
+    /// Memory area containing the GSP bootloader image.
+    pub(crate) boot: Range<u64>,
+    /// Memory area containing the GSP firmware image.
+    pub(crate) elf: Range<u64>,
+    /// WPR2 heap.
+    pub(crate) wpr2_heap: Range<u64>,
+    // WPR2 region range, starting with an instance of `GspFwWprMeta`.
+    pub(crate) wpr2: Range<u64>,
+    pub(crate) heap: Range<u64>,
+    pub(crate) vf_partition_count: u8,
 }
 
 impl FbLayout {
-    /// Computes the FB layout.
-    pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
+    /// Computes the FB layout for `chipset`, for running the `bl` GSP bootloader and `gsp` GSP
+    /// firmware.
+    pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<Self> {
         let hal = hal::fb_hal(chipset);
 
         let fb = {
@@ -138,10 +154,55 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
             frts_base..frts_base + FRTS_SIZE
         };
 
+        let boot = {
+            const BOOTLOADER_DOWN_ALIGN: Alignment = Alignment::new::<SZ_4K>();
+            let bootloader_size = gsp_fw.bootloader.ucode.size() as u64;
+            let bootloader_base = (frts.start - bootloader_size).align_down(BOOTLOADER_DOWN_ALIGN);
+
+            bootloader_base..bootloader_base + bootloader_size
+        };
+
+        let elf = {
+            const ELF_DOWN_ALIGN: Alignment = Alignment::new::<SZ_64K>();
+            let elf_size = gsp_fw.size as u64;
+            let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
+
+            elf_addr..elf_addr + elf_size
+        };
+
+        let wpr2_heap = {
+            const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
+            let wpr2_heap_size =
+                crate::gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end);
+            let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
+
+            wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN)
+        };
+
+        let wpr2 = {
+            const WPR2_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
+            let wpr2_addr = (wpr2_heap.start - size_of::<gsp::GspFwWprMeta>() as u64)
+                .align_down(WPR2_DOWN_ALIGN);
+
+            wpr2_addr..frts.end
+        };
+
+        let heap = {
+            const HEAP_SIZE: u64 = SZ_1M as u64;
+
+            wpr2.start - HEAP_SIZE..wpr2.start
+        };
+
         Ok(Self {
             fb,
             vga_workspace,
             frts,
+            boot,
+            elf,
+            wpr2_heap,
+            wpr2,
+            heap,
+            vf_partition_count: 0,
         })
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index d25a21b42fc8b3987c861965e6ea56d929570b70..46b21385cbd623b5feea37a3ab5dfe0a90258155 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -129,7 +129,7 @@ pub(crate) struct GspFirmware {
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
     signatures: DmaObject,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
-    bootloader: RiscvFirmware,
+    pub bootloader: RiscvFirmware,
 }
 
 impl GspFirmware {
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index b7eef29956995c49ab1466bb6a71a756731bf78a..b90acfc81e7898ed1726430001d31ebbc976f9f1 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -61,7 +61,7 @@ pub(crate) struct RiscvFirmware {
     /// Application version.
     app_version: u32,
     /// Device-mapped firmware image.
-    ucode: DmaObject,
+    pub ucode: DmaObject,
 }
 
 impl RiscvFirmware {
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 52b856cdb2934ba1585ceec12fd9a219dc0034e0..b29651e1fcd2dfac0ad7384fc727fefdfa5b4ff1 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -282,12 +282,12 @@ pub(crate) fn start_gsp(
 
         let bios = Vbios::new(dev, bar)?;
 
-        let _gsp_fw = KBox::pin_init(
+        let gsp_fw = KBox::pin_init(
             GspFirmware::new(dev, chipset, FIRMWARE_VERSION)?,
             GFP_KERNEL,
         )?;
 
-        let fb_layout = FbLayout::new(chipset, bar)?;
+        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
         Self::run_fwsec_frts(dev, bar, gsp_falcon, &bios, &fb_layout)?;
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 6933848eb950e97238ab43c7b8f9e022ffe84eba..6db9892b711bb5f6de29c8e0a6bc5c361827ee4f 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -2,5 +2,10 @@
 
 mod fw;
 
+pub(crate) use fw::{GspFwWprMeta, LibosParams};
+
+use kernel::ptr::Alignment;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
+pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 34226dd009824c1e44d0cb2e37b43434a364e433..181baa4017705c65adfc1ad0a8454d592f9c69da 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -3,5 +3,99 @@
 mod r570_144;
 
 // Alias to avoid repeating the version number with every use.
-#[expect(unused)]
 use r570_144 as bindings;
+
+use core::ops::Range;
+
+use kernel::ptr::Alignable;
+use kernel::sizes::SZ_1M;
+
+use crate::gpu::Chipset;
+use crate::gsp;
+
+/// Dummy type to group methods related to heap parameters for running the GSP firmware.
+pub(crate) struct GspFwHeapParams(());
+
+impl GspFwHeapParams {
+    /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
+    /// and including the first client subdevice allocation).
+    fn base_rm_size(_chipset: Chipset) -> u64 {
+        // TODO: this needs to be updated to return the correct value for Hopper+ once support for
+        // them is added:
+        // u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100)
+        u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+    }
+
+    /// Returns the amount of heap memory required to support a single channel allocation.
+    fn client_alloc_size() -> u64 {
+        u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
+            .align_up(gsp::GSP_HEAP_ALIGNMENT)
+            .unwrap_or(u64::MAX)
+    }
+
+    /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
+    /// `fb_size`.
+    fn management_overhead(fb_size: u64) -> u64 {
+        let fb_size_gb = fb_size.div_ceil(kernel::sizes::SZ_1G as u64);
+
+        u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
+            .saturating_mul(fb_size_gb)
+            .align_up(gsp::GSP_HEAP_ALIGNMENT)
+            .unwrap_or(u64::MAX)
+    }
+}
+
+/// Heap memory requirements and constraints for a given version of the GSP LIBOS.
+pub(crate) struct LibosParams {
+    /// The base amount of heap required by the GSP operating system, in bytes.
+    carveout_size: u64,
+    /// The minimum and maximum sizes allowed for the GSP FW heap, in bytes.
+    allowed_heap_size: Range<u64>,
+}
+
+impl LibosParams {
+    /// Version 2 of the GSP LIBOS (Turing and GA100)
+    const LIBOS2: LibosParams = LibosParams {
+        carveout_size: bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2 as u64,
+        allowed_heap_size: bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB as u64 * SZ_1M as u64
+            ..bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB as u64 * SZ_1M as u64,
+    };
+
+    /// Version 3 of the GSP LIBOS (GA102+)
+    const LIBOS3: LibosParams = LibosParams {
+        carveout_size: bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL as u64,
+        allowed_heap_size: bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB as u64
+            * SZ_1M as u64
+            ..bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB as u64 * SZ_1M as u64,
+    };
+
+    /// Returns the libos parameters corresponding to `chipset`.
+    pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
+        if chipset < Chipset::GA102 {
+            &Self::LIBOS2
+        } else {
+            &Self::LIBOS3
+        }
+    }
+
+    /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
+    /// of `fb_size` (in bytes) for `chipset`.
+    pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
+        // The WPR heap will contain the following:
+        // LIBOS carveout,
+        self.carveout_size
+            // RM boot working memory,
+            .saturating_add(GspFwHeapParams::base_rm_size(chipset))
+            // One RM client,
+            .saturating_add(GspFwHeapParams::client_alloc_size())
+            // Overhead for memory management.
+            .saturating_add(GspFwHeapParams::management_overhead(fb_size))
+            // Clamp to the supported heap sizes.
+            .clamp(self.allowed_heap_size.start, self.allowed_heap_size.end - 1)
+    }
+}
+
+/// Structure passed to the GSP bootloader, containing the framebuffer layout as well as the DMA
+/// addresses of the GSP bootloader and firmware.
+#[repr(transparent)]
+pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144.rs b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
index 35cb0370a7c9b4604393931f9f3bf72ef4a794b4..82a973cd99c38eee39a0554e855a60e61dba2d01 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
@@ -12,7 +12,6 @@
 #![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
 #![allow(
     dead_code,
-    unused_imports,
     clippy::all,
     clippy::undocumented_unsafe_blocks,
     clippy::ptr_as_ptr,
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index cec5940325151e407aa90128a35cb683afd436d7..0407000cca2296e713cc4701b635718fe51488cb 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -1 +1,126 @@
 // SPDX-License-Identifier: GPL-2.0
+
+pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2: u32 = 0;
+pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL: u32 = 23068672;
+pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X: u32 = 8388608;
+pub const GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB: u32 = 98304;
+pub const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE: u32 = 100663296;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB: u32 = 64;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB: u32 = 256;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB: u32 = 88;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
+pub type __u8 = ffi::c_uchar;
+pub type __u16 = ffi::c_ushort;
+pub type __u32 = ffi::c_uint;
+pub type __u64 = ffi::c_ulonglong;
+pub type u8_ = __u8;
+pub type u16_ = __u16;
+pub type u32_ = __u32;
+pub type u64_ = __u64;
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub struct GspFwWprMeta {
+    pub magic: u64_,
+    pub revision: u64_,
+    pub sysmemAddrOfRadix3Elf: u64_,
+    pub sizeOfRadix3Elf: u64_,
+    pub sysmemAddrOfBootloader: u64_,
+    pub sizeOfBootloader: u64_,
+    pub bootloaderCodeOffset: u64_,
+    pub bootloaderDataOffset: u64_,
+    pub bootloaderManifestOffset: u64_,
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1,
+    pub gspFwRsvdStart: u64_,
+    pub nonWprHeapOffset: u64_,
+    pub nonWprHeapSize: u64_,
+    pub gspFwWprStart: u64_,
+    pub gspFwHeapOffset: u64_,
+    pub gspFwHeapSize: u64_,
+    pub gspFwOffset: u64_,
+    pub bootBinOffset: u64_,
+    pub frtsOffset: u64_,
+    pub frtsSize: u64_,
+    pub gspFwWprEnd: u64_,
+    pub fbSize: u64_,
+    pub vgaWorkspaceOffset: u64_,
+    pub vgaWorkspaceSize: u64_,
+    pub bootCount: u64_,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2,
+    pub gspFwHeapVfPartitionCount: u8_,
+    pub flags: u8_,
+    pub padding: [u8_; 2usize],
+    pub pmuReservedSize: u32_,
+    pub verified: u64_,
+}
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub union GspFwWprMeta__bindgen_ty_1 {
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1__bindgen_ty_1,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_1__bindgen_ty_2,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_1 {
+    pub sysmemAddrOfSignature: u64_,
+    pub sizeOfSignature: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_2 {
+    pub gspFwHeapFreeListWprOffset: u32_,
+    pub unused0: u32_,
+    pub unused1: u64_,
+}
+impl Default for GspFwWprMeta__bindgen_ty_1 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub union GspFwWprMeta__bindgen_ty_2 {
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_2__bindgen_ty_1,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2__bindgen_ty_2,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
+    pub partitionRpcAddr: u64_,
+    pub partitionRpcRequestOffset: u16_,
+    pub partitionRpcReplyOffset: u16_,
+    pub elfCodeOffset: u32_,
+    pub elfDataOffset: u32_,
+    pub elfCodeSize: u32_,
+    pub elfDataSize: u32_,
+    pub lsUcodeVersion: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_2 {
+    pub partitionRpcPadding: [u32_; 4usize],
+    pub sysmemAddrOfCrashReportQueue: u64_,
+    pub sizeOfCrashReportQueue: u32_,
+    pub lsUcodeVersionPadding: [u32_; 1usize],
+}
+impl Default for GspFwWprMeta__bindgen_ty_2 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+impl Default for GspFwWprMeta {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}

-- 
2.51.0

