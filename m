Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAAEB48C68
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 13:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AD110E4D0;
	Mon,  8 Sep 2025 11:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aVu5h5wC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2053.outbound.protection.outlook.com [40.107.101.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E0A10E4D0;
 Mon,  8 Sep 2025 11:43:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0S1fZ1oObwjbgR9vZ4CQp1eciMd5Ehc0KVLtPx78UEic3TfF5ScDn6iB2UhYQMKwRM0hPaOMT1o1dsbpVGuZCOoVGPj5wc9jCMvC1Z6+F7wHgbofIlzDmxj+/HgA5jfyPgH9F0KmcQJ5yb0EZ1Bw2rSx5RNvVprpRkJBb1ja4KL35LAcJZOb562p6LjVhQFv9luwaSmYg9cG0DsY5IcXu7bt+vqBMU5qcSsHMXEyyIwtkFyHIL8jnqHn9mQei+F0zK1sYaHbwdZH6ugF4/t3EFpyTlFCFflsfN/vqewRX6gg85cChLrhd4nILe1xGjt0idvqJ3eKUfoCj7pTfV9tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufezDUiQlSwSUmW31CqVL2aNj9s39nfDiRkW3sKCzyU=;
 b=cvbFB2ZDjL3umI9wGJ7HCMiKDw/FLWGdk5ciH6o0ybdW3DA6DXaSu8XOxorrYAo4KlOMk1PhrNFwCIuPB4cLC2OdN/uIbgZs0K+nrI878ES9YdYc/gVT678VocgPOELh799CADoy1zkF3rXz27nIaZvAapbwxKiMgNRu3h2fJFJwZzZjkJVF/099u5HMITqHDbComakbUn6IW0wdNIS6NiGuRJcZifdOTdP6BfjsoJUCJkRQ6cAYFuEh8FymaKF/VXv+VZqx15I3mx2VP1r0GFuIRH4ZPAd356/QeoGjX+RIWlFdgbm89X3jr+Ltfn3Huw/ryDjqylSF7HbTGyJIVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufezDUiQlSwSUmW31CqVL2aNj9s39nfDiRkW3sKCzyU=;
 b=aVu5h5wCVKzSnOUySq2TJPVj/pnFvgTOrs+6gBMw9B536JINtyiN3+0k5XDWDpj6jIWBukt90DXbEp6cQNxmdhOSAV6VTPwXsEHzJa9eDgmK3MusMizqnTXcchxZN8Ed0ViOrGgSE9Ky7YbjVKXj4PRGwlwich+g8h6Yed+nI2AI/pW6WqrxA1NXpvlrAzDxgysdrnjbAIktU78Pppwq9ZaL4e9+kMdh/2nnuOoPwBAn2zaooNEeMvwO76COGEAKDcWJJMLec8+MKDm6KWSKHs5KlJFf7eNow7CT4Hx7Rb4Qhf+3mYZin/3FHy2/x1X3/7/eMBBgp/e0vdFGTdFh0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6343.namprd12.prod.outlook.com (2603:10b6:208:3c0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 11:43:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 11:43:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Sep 2025 20:42:56 +0900
Message-Id: <DCNE4H8KT8B8.20Z8SOHSGB5AD@nvidia.com>
Cc: <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 04/10] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-5-apopple@nvidia.com> <aL1kbG0YYy0FQCGM@google.com>
 <kxriy5tmcdpbop674gt55tmcfsvdy52dnw6dw6svemj4a52dtf@xhvjfrcjxbgw>
In-Reply-To: <kxriy5tmcdpbop674gt55tmcfsvdy52dnw6dw6svemj4a52dtf@xhvjfrcjxbgw>
X-ClientProxiedBy: TY4PR01CA0077.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 802570d3-3376-49cf-4dc5-08ddeeccdc98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHEvZ2dzWmY1Y3RyZDk4TkN4dlRPNmxhVzNObGR4YXRsUEpFSWQ5WkJKY3h0?=
 =?utf-8?B?L2RmRjhYSExBY2dMQU44cDlRdlhlak9YTUd3TFJDYWN4U1IyTXd0RVFFR0pa?=
 =?utf-8?B?eVlzUDgrZUdYMUQ0NnFNdnlFWVNrQ0syVmhDcVVQeHlyZ3A1aFIzTCtvaGVC?=
 =?utf-8?B?STllN0EwdWoxckM3Z0JvaGFVYUhsVEFrYndEd3Q3cFJKZkNZRHNVRGNUUkhm?=
 =?utf-8?B?ZmNHMm56U0RFbzRZTmRHQVZhZUZxMC9BdVlReU9nK01BNlp4Ym5YV1JuM0tS?=
 =?utf-8?B?OTVpZFplQ0FmUEErTG8wVnUwSk1NaFFMc2d5eFFLTDZLQWJNajBnUlRlWHg1?=
 =?utf-8?B?Yml2cGlyVnlRWGpybUczcTdsRGsreDA4L3lISTF3ZlVBTkRqU1NlNS92Qnpx?=
 =?utf-8?B?YUROdkREODBxUEJrWE8wbkNlRUlHTGwvZDFJUVRvc1ZtMTFabUc3SkFDdE05?=
 =?utf-8?B?bjJSVFh0c25DZnlQSlhsZnZsc0tUVEVWMmo0RXoyZE93M1gxMkhQVjBkMEh3?=
 =?utf-8?B?aC8zMHpad1ZoclhOMCt2dXJJUU0yazFvaDd3R3J4Tzd3bXBnRUlzM3FSVTY0?=
 =?utf-8?B?ZVpsV3NXSDhCakRoN1JDb3NURjB5dzkyaWFHOXZoSnlYTEY4OXZlaDZjSkhR?=
 =?utf-8?B?LzQ5Ri9sY2VwRHFBaDFnWXhWaXd0TlhxblFlSHA2dHVmMG1XQlA2Mmk3R0E4?=
 =?utf-8?B?cTRyU0FYMzRBNnlYbk1kcE5Ib1R3eDJhM1c1UmwyaGZrVnhEeEJZMGVIeEgz?=
 =?utf-8?B?ckNpNTNPdlEyUDhvZ2UyNlJPcVpGWnZBSkVXYjhUSlY4MkxxamIyZVVxcTRt?=
 =?utf-8?B?TEhyYmNlR0l3c2R4STZqYnd4UllGa09tVkhtNlhKVGdFb21qOVN6Vk9LYm1Z?=
 =?utf-8?B?NGs0c3M1bktIQnZCL2FXQVRnejhwY0R3RWVMUGxsdENJVVhFUjRRbW1UWnJj?=
 =?utf-8?B?bVpBYmxCSFlPU1c5bHE0UFhZM2c2THZtMUZ1OHdGSXgzZkEvYXlTN1ZBa2V5?=
 =?utf-8?B?cVJpeXpJVXF5ZFdWRXJucGhsR01jUUhIaStBOXczNC9ySGo4RGxSemZZcXNq?=
 =?utf-8?B?TUtCNkl6eUFMbnR2VGJVbzZFQ0I0SVFtd2pLVlpHaSs1MFh2UDlPODg3ZGpT?=
 =?utf-8?B?MWh3dXJ5SWhjeEY2elorL1hvM2NMeURMZnlheXpPaHpvRkhGTmVTNzlGb1dz?=
 =?utf-8?B?MElEZ3BLVjdjS3B5RS9CVDY2QXdrdmVsUnl0ZTZIUHFRY3lVNURWNnFMSCtF?=
 =?utf-8?B?bmJnbHZqN1Q4K2ZRNmlOY3Y3cVZONkFCeGxKM053TU5jcWJoYUMvVm84ejBE?=
 =?utf-8?B?bng4TVBYTThpL2NOK1ozUkdMeEZmMTJmSTZ6MDQ0TXRnKzJNTnd2NGlNWDda?=
 =?utf-8?B?TVBFa3ZMWWxZeUNVeG9Ya0IvYVBCQTU4VnFjcGtsV05mZDVWcFZ2V1pJdFZ4?=
 =?utf-8?B?Ti95dUpLOUJMTHltTkJPMEN0VWFIZkFXakRXVm93aXJUQ2Q1OUhseUppSlpw?=
 =?utf-8?B?V1Y0ZGtGR3hsUmhocVVsM0tyOE9kR1VjOGpSYzFBbVFpeVpkaTN2RHRQeEho?=
 =?utf-8?B?VTVkOHpXSTZRTUJzeTZ4dnZrOFV6V1VMNVNSelJqbmJ0dGlJTEdWNXNUc0tJ?=
 =?utf-8?B?MExZcTNFRk9iZVR1SEtQUnJWenNiMHFXZHdEN3NCaHN0MU5Jc3JEM2F3TFYx?=
 =?utf-8?B?Q212QVZpUDA4N2ptL0FFUFlsZnZyeXRua1hwcVR5Q3NLdENnWkFJcWJJbDRC?=
 =?utf-8?B?T1Q3dEZTVnlmd0hJbHRjSHdOOWlmYzRoZnJVb2dpSlNwWWRVemlwNGYzbkRk?=
 =?utf-8?B?Z0Nhak8yMUhtOVQ5SDVPeFR5STI0MnJOb3VvNzVYSElkb3N6RVovNWJmWllB?=
 =?utf-8?B?dlZzUlJzSDkxdzN3MVpjK1I0bEVzVEdKMTlwbW42VUlzME9OZkRiZWljRlRG?=
 =?utf-8?Q?dvzWSHjYXLs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjlpbWhYVTdibzNZNzlKSjFDc2wrRFdNOE1acnFXTEtqQUMrKy84ei8ybWVs?=
 =?utf-8?B?QzZOTU9TN2cwcTBsYy9wWE1FRHdrYk90VVFvYnNVRnFRZVpoUWtva3VhbVlU?=
 =?utf-8?B?TjA0MHc0VmZsWG9YbkhsSVVjcktXeVlHeFY3U0VkMThrWExnMk1HVkN1N0Jm?=
 =?utf-8?B?cmxuWkRjYkNyNWxNOFJIUml0YmE2bTN2ZVgyVnltZm92S2pmL1c4QXFqVU9j?=
 =?utf-8?B?Wk5KVDRxOVlYOWZSWjJRY0czakMxaUJqK3JZZFBUaC9Ga0gwaUpUY1czMWpP?=
 =?utf-8?B?R3RZNEF0SkFxbW5pYUNkcGJLekk2M0k2YVQyYWJ2enJncEg2R25EOWpqb21O?=
 =?utf-8?B?aHJtaXR5bC9ZR0FDVWxOa3RHZk4yQ0VkTVdDT1pkUGNYUDhYYXBqSzVVTm16?=
 =?utf-8?B?VGRYU3ZZdzZac0tSVlZMTjhjc1p6RU4yWUowTnBaWHV5UlhpNjdwZ0ZpZG5N?=
 =?utf-8?B?enBIZElwTGw4ekIvdFZrYTk0NGgxSmtVM2loNVFsRmpicldkQ2NncjNDelA4?=
 =?utf-8?B?YUdvUFhvZ1lMT0FQZU1sVGdka1lxREcxY3o3cXpvcE0zK0kyd0pBMDFvNmhH?=
 =?utf-8?B?c0w1SkN5T2FnRnJmekpSZUIxYzEwTFBxNjh0UHF1YWtTZEQyYWwvbEZTYmtB?=
 =?utf-8?B?ck5uYVNpUUpySDBnaHlneWx3WFh2UU80d08zeFEyeWxuQ0VpYUJVUUhNckhE?=
 =?utf-8?B?bFRmMFFpNDBDUndpeEllanIzODlhbnZZWGFTZ0ZhYzNXQllhR1NtM0toN3dy?=
 =?utf-8?B?L1BlSlhaNmh2b3dNVnZMMEx2L1VCcjZJaGMxbjZCeWwvOXZ2UjUyaDZVbmRF?=
 =?utf-8?B?M0dGUFNxRzdhK0FYSjEyTFJkMHFhV000eXl1YzFpSDQvbVNTakFhUEtxSjlJ?=
 =?utf-8?B?a1VvZWRaMVU3bGxqTWxhWUNxY1MxeDhveFNsVXRPcnF2dFRoTWpCRXhON3Y3?=
 =?utf-8?B?MVZaRGJCRlZneTcvaGhtYWt5bExoUFZhY2hMdHgyYTNndnFFU1NKSmlpWld1?=
 =?utf-8?B?WlpOZWROeHV6YUt4cGgvcStiOWxTNVpjTzhqM0ZxcHNqeTh0L29xUXJTdjh4?=
 =?utf-8?B?TUVGcmtsbUNuaXE2bGZPQmRpeTBZN3JYTEp4VzV4Nm5kZWZwdHVWOEJGSlVZ?=
 =?utf-8?B?SWNYbE1aY0EzWHpuQnJWU2Q5a2UxRERFZjZtWFNCSFY3VHdianAzdTd2UTJX?=
 =?utf-8?B?QkJCSmlCTENFZzJ6N3JrZndhcjlHeTRjUXV0Z0lmMEF2bm8ybkMwRmFudDZX?=
 =?utf-8?B?SzhtWGoxYXBuYXloRlNLMk9IR3VXWFV5QmdtelVIUGtDZDdocHRhTWZxTmth?=
 =?utf-8?B?SXpoU2c2RGV1K3VzaEczdWRyRmR6bHdnU2d2cWhQWXdXdWwwTUZCeVBYRnhI?=
 =?utf-8?B?SWE5dExzWDRHaGx3NVoraXdWZ3VHS0ZpWnlJZWY3YzZlbEpBTms2ck1jaS90?=
 =?utf-8?B?YjRGY016cmJqVGFtbHBlaERpVTk1dkFzSThFQ2dEL2ZUMFJqV1lOZVVVcUI4?=
 =?utf-8?B?Ky9zN1BLdzVuNlo5a2MxQTNJa3N6Ym10Z0YzNEtqV21PRkFKVEZja3Y2VEpJ?=
 =?utf-8?B?b3FTelFodUc0VE5aNDNSakUvNTh0Q3Nkc2VaUUMyanNONERLOFl5L3pic3Zy?=
 =?utf-8?B?eEtxR0J2Y3V3WGlFTlpmV0laMG14SlQyMDdZeDBhNGdyV1VDOUpPZlZCTHdK?=
 =?utf-8?B?djVIQXpRbjk5UWFSNEFzTUZhZnJLbXY4RytlUjBHaE1WUDF0cXFDekFyUjh6?=
 =?utf-8?B?Z2I3SG9SbGtFWkxsaDd4czA4aFVVYmNtQzE4SVNJOUNlak94L1FEQmxHblBp?=
 =?utf-8?B?UUhGMVE4ZE14MmVIK29NTlM0ZXNJQkpCeC84YURKMEhSWXkxTlgxNjMvWnBQ?=
 =?utf-8?B?a1pCYUprY2dZVE5IKzFVS0VKY21xRk9nYmVsdVUyNWJ5R1pOZUgzR0RXRmVx?=
 =?utf-8?B?K1ZkZ0FQT0dlMGYrdE02M0NJajEyYmJzcStGMFdaOVZSaVhMdWpvei9kY0Yy?=
 =?utf-8?B?ZEloNjlOSWRyaU5ST3VXaitQdVFLRmxYb3BzdGx5R2Vnakp2ajZqVjlzWU9K?=
 =?utf-8?B?T1NsQnM4dWRRR3dqb01YWEJaMFREUXkyNkVWNEhlL1V1Y0pIOEtyMkVnT2li?=
 =?utf-8?B?NitVbVRBUmR2WGNHZ3VETVRIWHJUSmJGc0NwY3lUQVp1dVJIRDVxb2ZDMTFM?=
 =?utf-8?Q?P3flOkNoJu9NlDojYu0xmnUB9E6OxJ0fKZuHE9miwIjm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 802570d3-3376-49cf-4dc5-08ddeeccdc98
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 11:43:00.0010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVpBwUn8wTBah5kTHD5ttG/Ch/vkSJhkAeuv9yX8ydzWtMDvcnHNxjZh24Akz2RDtscTISiuzQDc3riQ7wZxoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6343
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

On Mon Sep 8, 2025 at 8:31 PM JST, Alistair Popple wrote:
> On 2025-09-07 at 20:54 +1000, Alice Ryhl <aliceryhl@google.com> wrote...
>> On Wed, Aug 27, 2025 at 06:20:01PM +1000, Alistair Popple wrote:
>> > From: Joel Fernandes <joelagnelf@nvidia.com>
>> >=20
>> > A data structure that can be used to write across multiple slices whic=
h
>> > may be out of order in memory. This lets SBuffer user correctly and
>> > safely write out of memory order, without error-prone tracking of
>> > pointers/offsets.
>> >=20
>> >  let mut buf1 =3D [0u8; 3];
>> >  let mut buf2 =3D [0u8; 5];
>> >  let mut sbuffer =3D SBuffer::new([&mut buf1[..], &mut buf2[..]]);
>> >=20
>> >  let data =3D b"hellowo";
>> >  let result =3D sbuffer.write(data);
>> >=20
>> > An internal conversion of gsp.rs to use this resulted in a nice -ve de=
lta:
>> > gsp.rs: 37 insertions(+), 99 deletions(-)
>> >=20
>> > Co-developed-by: Alistair Popple <apopple@nvidia.com>
>> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>>=20
>> This seems like duplication of the logic in rust/kernel/iov_iter.rs [1].
>
> Conceptually I guess there is some overlap. The thing that's different he=
re
> is we don't have any C version of the iovec struct or iov_iter, and AFAIC=
T [1]
> doesn't provide any way of creating one from within Rust code.

Yup, I was about to ask as well - I am not familiar with the C API, but
how can we use it from Rust, using e.g. a pair of slices as the data
source/destination? I see that `struct iovec` also has `__user` marker
for its base, which hints to me that it is not designed to work with
kernel data?
