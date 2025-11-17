Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CEAC63D11
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 12:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D981710E380;
	Mon, 17 Nov 2025 11:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NSby/jFm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C62710E385;
 Mon, 17 Nov 2025 11:30:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=geJAO25v4JCHDC0ZkxFG+VNt5zPZGJkLingHmZN6UX2Nz7uz+mFl8gmtMOAz79IP7Zrn6VR4Ewm+M+qMcmxUFw1t11cbfb50D8RFWf9NO3K7nqWVfjMQMD6MgMRaAvK8stINaTsk/MEc8gdoq3PtTkR11VryjpnHygTH4+rjCEPzHEEw48HwS+Pjvsudi1iP0O6oS5Lhlf8A6xgUtkXJzor2O7sePXgeYR/yh+CfVbtcrlMN37/00n4JEOU2lUinxUV4VV/CDrmzl+6pjF+F7nY4pKWMrGgTrrlUxAbIxcVKV8LwGe2wC6iREM0ZKaKFvfgyshFckimuGuZbBrVOzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aB6GG5TkcfbHeYebwbirJKMOVjQWNg7N8GaMG47H4fk=;
 b=gGT+zNIYLiZ53DFasiL2gccdZN8jaDk1fD3kZB6UO0Vm+PXsKcojq69L2H7osVQawNRvcNEOHOpCoLZ3lG3PzmY+4lFYGqZcrOWkNkiDzEsTwZ62AAZra5kbaqIDGwi/skL8w4wZfkfVt1PtavMZErReIc5OwjZYu7n5hOEYOC3KKEoR/1coFV1pghCC7UShz4WYJVaHqzxD87pi3q0J7xflt0hjsdCH8AQADtqUPS45RrMxtZ4ZvOKm0v/5k0B8jjdas0Ja2B0AYt31sUlK2lws/ws3XG92qYMtVZMgBbfbmZIHCbRXgqORetYuhXwLgd9UICYd8IddPK2iuB1MVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aB6GG5TkcfbHeYebwbirJKMOVjQWNg7N8GaMG47H4fk=;
 b=NSby/jFm0rxq8A/0iB5qIwxaXxHpxYuPN0OA1GS8EEEWJ9lDh8Cznr+uLwujET3YbM71W9gLPayxi1TNNwMDjALcrL5IQZ3oIjSeyBei7qrbXFkHg6UCEE+Hu/yjH2fsMbSKtMwNhRFo2tRDcQNaQJUHZiXZV94su65VIABC9an3Be4/JGG3wpnNGIqJU3WD4xWItZxrGtNI5xpRRUzyNOQF5k8YC3bIcHPMdntpma5TE/p4Beu4zxSLB1yrEgIOIEPSQ7Oi0PZZCbvpAhcHkExeP+JAV+xRm34Tyns3nD3eqasez7qpBLOV9pibfxyvsbaFDtMUWt5gCbYpgMXWQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB7837.namprd12.prod.outlook.com (2603:10b6:510:282::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Mon, 17 Nov
 2025 11:30:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 11:30:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Nov 2025 20:30:13 +0900
Message-Id: <DEAXOVFTT71N.1AERE0MGYTK8V@nvidia.com>
Subject: Re: [PATCH v8 01/16] gpu: nova-core: compute layout of more
 framebuffer regions required for GSP
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Lyude Paul" <lyude@redhat.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
 <20251108-gsp_boot-v8-1-70b762eedd50@nvidia.com>
 <23d72ccb35a87640720746ba0849eea5a45a85b1.camel@redhat.com>
In-Reply-To: <23d72ccb35a87640720746ba0849eea5a45a85b1.camel@redhat.com>
X-ClientProxiedBy: TY4PR01CA0023.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: c62bde3c-8221-4e26-3ca2-08de25ccaf25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGY3TmZId2dXanBzSFhUaEdCYW56UEE5RWd2Zk9vWDRoQzExR2ZsTDJHL2ds?=
 =?utf-8?B?TWYwbG9iOFBVcVJXZmtjRFVEZHBvbzJVUVRKcG5lcUNSZmV4dWp0alAxbzN0?=
 =?utf-8?B?amFlQU9TUWRNd0dBbEIxZmpuTHZoVXVzYkxiSXlQM1RLaGlmRUtJY0pZUWxy?=
 =?utf-8?B?bllLckc0ODMwcndTeThWRTJTa2s2LzR3bERQM3d4UTNkTFNnY04zRFcxcHho?=
 =?utf-8?B?clUvZ3laZ0g3enM0a0xWSUp5OXpyVytlSkpTbzNIVHFoWFRjOG12eE42MTQx?=
 =?utf-8?B?VmI4Q2F1QnVHVklwakRoZlRUaUluODhGS3dMRVhxYSs1cGszWXJBM1BvZFha?=
 =?utf-8?B?WVhFL1RidHdvbVFYcUd2OXpGVjBDQlRIaGc3dUlva3pLRGJqTFRsS2tOVkFK?=
 =?utf-8?B?L3VDZE1FRDR0QjhiaHA1S0c1R294ckswWndEUG1yUFdva2VRc1JIejJaaDVO?=
 =?utf-8?B?ZENPWmFJYjU3NEVaby9QWmdSSEVLSEloUFFkUFpLNHVkbVJDRUlsVVJJMncx?=
 =?utf-8?B?YnMvc05kbTJJcnRaNkp1N3ZDeStLQVNEMzZ2dnBxT2hLQXhkMDVZY0VuSzVE?=
 =?utf-8?B?cjQzVnRkZnJaQ2Y1UG0wUXRXQmNoWGxvek5aaTNTdjMvcUU1T09iYUdHTFZ4?=
 =?utf-8?B?Q2dEd243Tmlha2sxVU5QRlVyL2oya0QvalF0cklFTHo0NXR1ZS9GWGFSOFEy?=
 =?utf-8?B?TmczUWFxemhEdFp3dVR5eUZudndTaE9ENVNNRFNTbmFyOE1DOXlhYlloZ0FO?=
 =?utf-8?B?dWg4QUowSnphYXNmUDB2L21YalRwSHhqelhNZXRhaDlONGJrNmNkZkVsSXNr?=
 =?utf-8?B?bU1QbjRXd2FXemtFRzg0bTdkQTlSSUlxdFBkNmJBcy9hc1dZVHRxZklqeEtE?=
 =?utf-8?B?SkdUeTIxSE83ZkhiQy9BdVFEcVREOWhIZWczTWpvRHd6Q2pHK2FHMDB6ZC9L?=
 =?utf-8?B?aGh1N0JJVTJ5aXRaOHFrSkpWNkMxKzUrVzhHVWJnN3Vrc0tOMGZtZUZQdjA5?=
 =?utf-8?B?MW1MWnR5M1M2R3plbkxuQllwVk83dG1wWWRjSzZIR1JJYWdBd01va0lnOTFG?=
 =?utf-8?B?RS91VlgyeElMK0h3dE1VMzVtQU5EUkVHUUZybFFLQ09ZWHNLVU96RWhmTkd0?=
 =?utf-8?B?bW5nNUQ0bmVSVVZacEt2bzUyWEd1Wi9IRG5lOGtrSGtJbnAzdVRlNGFVTXZh?=
 =?utf-8?B?NUsveXhvb0JKQVhwOXAvZlhiT0NJUVhONHFmL3FtL2kwRGV1U29KTlJNVlZF?=
 =?utf-8?B?bGF2OVFKWXhZNFNxTEJVMnFPVjFlNzE1OWE5U2draFBMZ3FtNGl2amxUbWg2?=
 =?utf-8?B?eUErNE5QdEUvc09ic3lrMXVYaG91R0J3RHVIUlB1MVJUdVBZZ1liNUY5bkNn?=
 =?utf-8?B?RTF1NDFPeTBOQm1Cc29IVVdJeHorNW4xRWRqd29GMjZyTUZLNFRnaFJ6NEJH?=
 =?utf-8?B?Ry85bGUrSlEvMmRtVTFxdDdENW5vVnVlZXRGdTJjM1dDVVZlWm4wdmN2bHoy?=
 =?utf-8?B?OEk2QmZSMnpILzJQaGQ3LzdybElYclE2Ry81Z2VxSVZ5MThPUmZOYzM0TmlN?=
 =?utf-8?B?T1J4L2tPU2RhTk0vNnBnenViOXVjVnBRMVhzNGltNFhLeFliaEwycDVBemp0?=
 =?utf-8?B?UldPam9TT3FlbEM3YnY0V2tHUElta2dwWC9nd1IranMrOU40bVhENmVDcWYr?=
 =?utf-8?B?Z1p3RjdjUjc0ci83ZndJS3JKcXZCN3hKdW9CNW1qcVlnYlhhanhPdk9kaktU?=
 =?utf-8?B?aVRjTWVUWTlpbVN1ck9ONDgxQTNlVHZOT0VhSHNmWDA4RXEySEtXcmdiU1Zs?=
 =?utf-8?B?QVZhbnVUZ3BqQ1JtTmxDQ2lxQjBxR2lYNUI1UnNDUG90QVB2YnRzcVNyQloz?=
 =?utf-8?B?eW8yQitncVh1RUsxQTZrS1JMNDFocUEzL0d5MkVlMnpkaWhwVG5Pc0czb3Ft?=
 =?utf-8?B?NW9MMVRXSlQzMzJiOHYyMDQvR1NDNTJ1S3pTdE9nU2NaUWpJT3NFWTZ4Undk?=
 =?utf-8?Q?/zJFIInej8vdkSJE0f1wLKdissTqdQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXdZWmNuend1OStudFBWZGhZb0lZOEcreis3aDNiQ01wN0pHbzJRK2xoY1dk?=
 =?utf-8?B?N2F1RS8vTno0bWdjRTVLbVhOV2FSMHFWK24wZGovVmlQNkhZNUNTK1hBMW8v?=
 =?utf-8?B?cUpRb0lmUnpuWjJnaVVUY2RpVXkyTDQzUmlCVDRQU3BWdkRkNEg3aWU0QXJE?=
 =?utf-8?B?RmpGQWxCZ3MzNTZzZE83VENKOE1Qb1dxR09ncWd2WHpORUI4Q3BiL3pTdk1x?=
 =?utf-8?B?M1kyZ1ltdEN1SHJpaEgyZ3ZPaEhYSWtnQmJnd3E5NTRTRjJtRS9zV2RvdkNt?=
 =?utf-8?B?TGlEUDJnUU9tSWdxcHNKMWdMcTRMUVAxVXBwaUlaL3NIbDZoOU5udmFDK3Zl?=
 =?utf-8?B?V2hKYzNrWXZFeUUrZVBVWU5nbFpTVTFCMGFmSWhLVC91bU8zMGN6bjFKTm5p?=
 =?utf-8?B?RnlaZFM1b1A2bU0wZG9zVEpWdHpkSnZyb25nRzJYWWpZdldaS3Z0UEJTRHpY?=
 =?utf-8?B?cm9aK2FpMEtUVVI5SWNITmx3Nk1NTWR0M3cwVXBKejRJUkZOUmxTZDhmZmlp?=
 =?utf-8?B?SEN4OGNoaklUclZPRExWOUtQNW91VWtoeUJ2SThtMjdESXlPbG9lOElsSXdQ?=
 =?utf-8?B?QW1LcVBxNDVJUzJHbjhyOTY2YkZ5bUplVzJyU2FvaWRtTXVpL1U0K3NnRndh?=
 =?utf-8?B?aUk2YVpBamU5bm56WFFQYWt6d0MwZWc1YnYrTTA1RUR5eXJzOGlPaTJjMUJh?=
 =?utf-8?B?bTdCOHhyZ0wvK0ZBQVFkd25LZnA0ZnlhMmU1OCtLYWhBRWE3a001R1A1UWhn?=
 =?utf-8?B?bEo3SWtZWWxORzU4ZXYzRVg0VDcyT1h4YnFIWUJydytPU1lCRG9VTE83MUF6?=
 =?utf-8?B?NWNEdFJEZDZ5d1lRbmFyZERsTGcyMEFJMk1nY2xlOGJ1OHp4SDcvYUE0OWpP?=
 =?utf-8?B?WldMWlptOTlTYUdDRGQ5amZocUxsZW5tODR5T2hxeGUyWnZvYVV6bGFWaDdx?=
 =?utf-8?B?VGc2NmhSVEo1YWM1TG0rS2JCaDJlQ2hEWlAvcG1DVStXNzRGRk5ETlBwRTFn?=
 =?utf-8?B?OStKcUxCWFRKbGlCZCsyV25Zem04UGxLSGpGajZoZnlnMW9vSCtGdWVxMUZB?=
 =?utf-8?B?OGt5aC9rRUpDUFRralVVZGY5VXpYU1pZclNxWW9PNEVmeDFQaDUvNUJMaC92?=
 =?utf-8?B?czdtai9jZUhCMGFrMnhXVXJGRXVCNDZSbWRBREVjcW5ueHpyeHhIekFxUUkr?=
 =?utf-8?B?TkJVendWZ1BGVmRSeUlENitna3hNRHNXbUxQTFhkYjV5UytGZnJWQVdqQ2Jt?=
 =?utf-8?B?WEdrQXc2b3FCVGczZGpvazgvbytEUUV1SG5PcVJtRFN6b3pUUjVKSTRaaHlr?=
 =?utf-8?B?UlNNUmZma0I2ajhnUVhyeWp0UUh3ZTdHYVZhbEpBVzRtNUMwbzdTZlhVWUJz?=
 =?utf-8?B?TVU3VitySmRYOXdBWHRvV3AyZjBYVWtkbExXZGhDTWd0M1dRSUxNeUNQQWF4?=
 =?utf-8?B?c2I3SE1aRklqcU1XS29PdFF1UmFWMUw3RFlIZVppSExKY2ZpRVpiR29FaDU3?=
 =?utf-8?B?Qmc1aDFoT3FIY1JDVzY0L1BSR0FoaEpkdXZwdU13V25FdlgzNmducXdmRHlU?=
 =?utf-8?B?a01pTlNaOUVvWjkvaE5yMTRoSGJNd1dLRmpHK1RBQ2FnZDlUeVVpaUsxM3or?=
 =?utf-8?B?U2N5d0pSZVZYcGsxYTFQSGN4SlR3cGlnR282ZGhKaW54NTY1aTZyZ2dSbVFZ?=
 =?utf-8?B?UjA0QTJIb05kVWtZOVY0VzFNQ01qeE56OWFZK1VVL2I2NyszdnB5L0x2UVg5?=
 =?utf-8?B?Z04yV2s1eXJGU3V6NWZaYTNjUktUQnJKTU5vRGdwY3lkc1p2c0xqelFPa2N0?=
 =?utf-8?B?ejJPaHNNKzJLS1hlZWJ1ZmUrUC94aTMrSjlwakROcjhsbE9UaFoxTVl1WkRW?=
 =?utf-8?B?N01LRUprMERlWHM0cTRjZVdQbERLL2pCK0RPQWovak13dFdidktLakFya1JT?=
 =?utf-8?B?Y2FIcEQyaVhncVNrY3lBSFV2NHNBWUlHdWR3bVNsRVllVXNlV3FsNnp3Q0ll?=
 =?utf-8?B?bU1aM3BkL0tSQ0Z6Z3R6OVlhajhOdEFuSTBOTHZVVndOa2RhSU5saFNMWjRa?=
 =?utf-8?B?cTRMWGpxSVQvcnBBOEJra1dneVY0aG1RTkRINUJxall0SENFR25yQit3RXZj?=
 =?utf-8?B?MzJqNlhjOG1PemxndWJocE9tWVNPTHRubklEcEdnajFWMmRxZzBLd0pLeUNO?=
 =?utf-8?Q?k6qefhQFG4hgQN8awqZRPnKKw3A8hEOy5N2SbZqA6YRN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c62bde3c-8221-4e26-3ca2-08de25ccaf25
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 11:30:17.7208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nTqtbEW5VAhP97eAoK58cX76mwPsddFg352rs+rAT7Of026SfjZatgkHqHkrxIMxJh7zyobuXg0hCtFUG+3VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7837
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

On Sat Nov 15, 2025 at 6:53 AM JST, Lyude Paul wrote:
> Does this need review from RH's side btw? Figured I should ask since I se=
e
> Danilo's acked-by there but not on any of the individual patches=E2=80=A6
>
> If so, I'll be happy to review it next week

Ah, this was a remnant from a series merged last cycle, delayed to make
use of the `num` safe integer converters. It is now pushed to
drm-rust-next, but of course feel free to point out issues that you find
or post follow-up patches if needed!

