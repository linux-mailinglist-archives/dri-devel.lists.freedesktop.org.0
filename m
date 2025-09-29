Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D2CBA81FA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 08:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC4C10E25E;
	Mon, 29 Sep 2025 06:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kWkLbHux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011053.outbound.protection.outlook.com [52.101.62.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD96610E21F;
 Mon, 29 Sep 2025 06:30:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+PNuYQKLwKex96FfoTZzwRit+0MPwWsiWaQJJCEJWsBU094c/qFdpVsnWglW6RXXt2rCoILAQZl359mN918vKvq76l4qz+WrnUAx1MaeCppARO5JArycPMUlerLeMSWIxgoj2ScIrYid61ltTGbbXf35ONlB6cRgKSWcWTKcstwPvb/fgcHl61+FELNvyykHl4+MmdWUE/+RetXDY0F1i7JvQjdCG0O/3RORwMJpdhJlB2vwF5p3AGQ2a1zxhsJPLrHRNLpYb5Pr7XvKDuy/FgerBwDJ1OE8ppUVxUNW5LrdVDrk+QXVvRGYhUZe9AjWDlPsVAxVZgE2Kb5H0E5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xbxwlSCeWh96wjZtuxtiU+fhwrW7R9PzTSdGYmSAmo=;
 b=W6MCXph46lPfc0N6u7dInjkS6m5xY5kGpbdgMhuQP0bxy4eiAaAXoej5Fde6Yl0iW3qlrQAQsLRIQSBrp5AKKS7Z7LxuE9D2Ur9K2Fv8sxoaPDOY+pZl6Sjg99d4It5vs86nNGPxcYM9wEJgF3OnbMJIbk3U4GJBv21ClxpZOS6x66+41RVyztQdTWVhpN11D7d2nrDPJ00B14JjoaAZWIOoYDdcZ2FJJCYjSf/i5AtEISngIZ/VvrpIzYn/vhaUP2+nd11Gppc6pyXneevMehcU5hkPau6IHwS0GU06d3zO1I3GtqVp4EjsGy+QGsDuLIq7yiikTwBsXhTiO3KFVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xbxwlSCeWh96wjZtuxtiU+fhwrW7R9PzTSdGYmSAmo=;
 b=kWkLbHuxe2HJJCux2YM2ew7VSJFgToowcCrAR/fsR6DAMk/JBLyOgEFcS8qABnySGEViZCwUdWFcLShtFH+/Ln4aRRUh44PHCDYsG3rpMkdjjI0TWDsEUw1LLASis2S6bxXlTzcfQzxMf56cj+EZU5sNoL5H9EzPT17Y5Oyhv4NYuUmgU5/a4poQ8SC7ZQzLkeZYEm+m2YhIHxjuwltN2S0pNYG5Ly3zkKcM0hvQnjPHOzNgRR70ZGAkq1i5jhCDZOtSakl8LX7Di4i43IhDHgHPaYY9JrHfvb6mIZDby4fwWyWIVzxodVXr31pnK9DpDbQIa39o88bmgt4hN/LQ/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ5PPF28EF61683.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::98e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 29 Sep
 2025 06:30:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 06:30:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 15:30:40 +0900
Message-Id: <DD52MTJVGLQF.XPLX3QEWCMYD@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v4 4/6] rust: Move register and bitfield macros out of Nova
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-5-joelagnelf@nvidia.com>
In-Reply-To: <20250920182232.2095101-5-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0017.jpnprd01.prod.outlook.com (2603:1096:405::29)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ5PPF28EF61683:EE_
X-MS-Office365-Filtering-Correlation-Id: 80bed7e7-ac16-499b-9036-08ddff21b73d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODdONGs3TUNrSDNEMTZnNUo0MCtjRzV5SXRVZHBEUU83SmhWa1dIaWZHQ1Bz?=
 =?utf-8?B?RjVEcWUxYVZmTEYrQmsrY1Vrd1hhVXhjZnRsYVN0VFFVV0NVbkZ3Z2Y0R25x?=
 =?utf-8?B?RE9RMERnY3VUd1VZREZOT3NjRWY1OXF3VDgxT2w4dkUwQXFnUlJSQVlyQU81?=
 =?utf-8?B?SEROanlhS0ppcmNiemU5QU5wU280Q3dhTzI5STVQQU9hMTIzcXNDdXRRRjR4?=
 =?utf-8?B?VlhhRGNiUnNaYm9XNllManBsemh1TDBIcGhFdU9abmJubU1UY1RtdjFLYXZy?=
 =?utf-8?B?bU1MeEpIWnBxTytOZHFKNmsyZGdsN3djUXNCUEFsMU9pc0loaTl2ZXRkZG9q?=
 =?utf-8?B?TDA4S1RyYzZ0VGlUZVo5N3ZKVVJsM0lqR0poekxuay9Eb240ejZKYWZ2THVX?=
 =?utf-8?B?cTlTMjRVdW5RQVEyZm5VRllicGxqRDR2U0FSMEpwQWlzQWZuMnY4cldxSS9D?=
 =?utf-8?B?TlhBY0I3RVlvYzdBN0pvUm8zZTdiZUQzT0V5NVBtdEY0Tk9HUjNEOWsxMzY3?=
 =?utf-8?B?V0dwSkFFbVZEWnB4K1RIYVY5M1ltTHlBSE9BVG1mcHVkUnhoQ1ZocXdoQTJL?=
 =?utf-8?B?U2R0WUN1Tk1tOStmTnBLVU5hcjBjY2tPbnpCdkFrSWIrRlZ5STBGckQyUmVy?=
 =?utf-8?B?cUY2aEF2L25XUEV1NVVpekkySG96QVBIYWFIcjR6Z1lXR1F4RWJ2Rk5pVDIv?=
 =?utf-8?B?TWFFMmtURTFXbHlDaFBrTk9TYjB3RTJKZGF5YngvME11NlYvYnNHZ1Zpc3lJ?=
 =?utf-8?B?NjJNb2JlTDAvUUZ2NHBFNXVRZm9Wa2twekVQMTJ4V2grRjRxTzZjUFFMS1dE?=
 =?utf-8?B?MUNNRnU3SEZETUtSMlZyVTBKVDBYbEhya0NFNXlKVitGTDg0c0srbzQwQmxY?=
 =?utf-8?B?QTZuTFpZNWpDQTczSHdoNXdtMm02N05wSjRtdUpLQ0ZWR0gvaDNOWmxpejBk?=
 =?utf-8?B?TFRmQk9PSlhybGYzNkpsbXI5cjVLTTNzTVk5c051NEJaMXlJZDlhUHVTaDhN?=
 =?utf-8?B?aWF4RWoydzQ0bkNFQUpWb3hzdUYzODgydFlGM1JKRE5kMFR4akYweG9TZ2hu?=
 =?utf-8?B?S1A1RTVZZGdBVWlGdHBLQlpRODBWbzAzN043QmN5enltci9NMEZGT3RuR1RQ?=
 =?utf-8?B?Wmh0MUlTbWV1V1VOZkg2U0JOZjhaUGhnYkdZckVRTWpsNGU3Y25sYkVnNTdE?=
 =?utf-8?B?dWdWampjSm8yalhoTnBpTS91aWZWbURMZjlpaWZrdUtpUW1SY0c5dGc3SXlB?=
 =?utf-8?B?dG1FMXAyN0k1a3FzcFllTURqNDBFWDFsQlNaVzVnaXEwcHYrUHhMSjkrQWNU?=
 =?utf-8?B?cUVlUGNDSE5KMkk4VUZDZUs4UkRUZmE0TGJ6RDFYZ2xxeXIrN1pFYk9RTGtH?=
 =?utf-8?B?cHNKR2hVaTRvTDc3SVNUOEo1SEp3S1MxZktVMnA3OVBSUGIxRTJwYlFyTC8w?=
 =?utf-8?B?cTc3VVZTdFRzSDZWay9YL2NjN1NaMm1kaFA5ZytwNmFDL1F1OUVtVTZ5VXkx?=
 =?utf-8?B?cUJkRFBQekdkbmRvMWZNSlArSzJZcFZINTZjT2RUcFV4eHF6Tk1rUUJaRGl6?=
 =?utf-8?B?UFJySVZFd1U5RGhVMndTemNNaE9jQ2tWZ2ZZMFNvUlp1Q2U4c3hCNm0vUGFF?=
 =?utf-8?B?NXNpb00rZ0g4STV0RWZKV0xJZGxMeUVVd2htcTRPcGQweHdtWkViK01JOUk0?=
 =?utf-8?B?UXprc1Evc01haFZ5UDJUUmZtOEV4T1ZXYTZiaGRnQ0dYZjdITnJKYWRmZlZE?=
 =?utf-8?B?S0ZzUGxFOStENzBvZUxUNDAzK1JGTXJUR2V0TW8rU0JFZFh1MjlMU2N0UE5B?=
 =?utf-8?B?Y2NLbDhadFlzVmF3ZHkyeUQvdGdpam9mOXJ6Y2ZDblJFT2MveVdSNHQ2NWR1?=
 =?utf-8?B?czVOT3pGeDlWOGNrMHdpZW5MMThWQTduM3hLcVhmV0hmVjQ5b3hPK3VXek0x?=
 =?utf-8?Q?VdAsUWSF9esLOhRf73o7zf+qSgw4DzTx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHVvcmRiVEVMemxHVFNaUXNvRWo0OGptcmVDa0MzMG1zT250M0phM0JVanNY?=
 =?utf-8?B?Vy9qTUoyL1FXQVJFTnBnR1RuRHBPUFA4VDd1Sk40N0ljZ3VtMmI0blAxSjRO?=
 =?utf-8?B?Z3ZwV1pMcmpYc1dlbWNJQjVqM2NZaWlZQXdHRjBVVmRZejNKbzNCenBOMkoz?=
 =?utf-8?B?RzBrNmN5MEt0VTdiL1FOMU1yM3A3b3paU2RQdVRiZ3RnaTkwS3BMQWoxWXg5?=
 =?utf-8?B?QWxObHVEK0dNNllCTHMyeCtiZmpvNkMwQVhuUktkTEtVejdrYWQ4VE4zcUFy?=
 =?utf-8?B?Rkt2OEdnK0V0bysxVjFaS0s2VU42WjczUDJCbmhBaTIySXovMUh2TE9xbkpF?=
 =?utf-8?B?V0h4b2VsRG9IQUdSYkJ6NDFsb1pYVEZ1cVFncmhLdGI3VkM3MG1CdmpRSHlR?=
 =?utf-8?B?ZzJCb24xOEZyb1QwT0cvLzAzZU1HZ29peTQ4QjJvZkpqMDVNSmIzek1DemJM?=
 =?utf-8?B?MHRRUjQ3TENwazVpMG94RWtCLzdXeUFLWTB3Ukt3dVZHdTJNTVlRblNjSEU4?=
 =?utf-8?B?dUU3OFZ1VWtKR2V2MmRMajBESWJSVGhQaTF5WlVUVVUzN2ZmRjJCdUt5bzNI?=
 =?utf-8?B?ZDBrVHpmK3J0cUkvdFB6V2ozSGowc3M4ZUZ5b1dEcGZpQnpoR0VDUW1JZXNo?=
 =?utf-8?B?K3pvdEVvSHplNEVwWkF5dDBYdVNuZ1VZekl0M0xndFluUmpBOFpOZnI1WUJj?=
 =?utf-8?B?alBDTGE3VVQzTXRoNXg4UFZtY3UyNXZ3VkxpeVZUcVVOZTZpNk54VThTaFJ0?=
 =?utf-8?B?WGt0OVdwVms2c0hsbDBnVHNoclllU0xadEFZU3czdjJHV3FrQzgxak8vdkFw?=
 =?utf-8?B?ZW5rdmw2L29VNUJhMVM3WkRLVVJrTGdDTTdyZ3F4a2paWnZpTjJYcWJGeGxq?=
 =?utf-8?B?KzR1bHpCU2hiTXlWTVhQalFvZFpXQk9DdUplcU1zaUw1bExPYnJRdWFiaUdI?=
 =?utf-8?B?QjV6UXVHdkJGSVpEdStWcVU1dVBodnZiMEhVUEpHQXZuYVlYaGlncTRpNXMx?=
 =?utf-8?B?WkpQUlVqd1lnYlpxK1dJcmE5QTl5QnBQMk1zc1diTklKZjFUbjBwUG5PalV6?=
 =?utf-8?B?bkV5UE9tdXQ2Y2toZUNxWThsR2FjaW9HWVhSWmsyTndPTXF2VGE0SzhHeTB0?=
 =?utf-8?B?SXdqUnBpOHZOK09abm1MVHpyNC9pVmU2T1EzdWdkU3hVKzNzcHJHUTBjL2Mw?=
 =?utf-8?B?c3IwWEJFVG1LNmphSXJLeE9IcEFEMElLN25WbEk5M01ISDBENnBPZ0RjV0xK?=
 =?utf-8?B?NUNObGhhZFNibzdCWXV5TFNSdWQ5SE5jQmZSczgrVEk0K05vZlE0cGt3V3JV?=
 =?utf-8?B?ZytPaEdBWko0dGsrMkx6SkhzVW5uVDg4aWVxYzNvQzlhZFN5bkU2eDAvVEJR?=
 =?utf-8?B?b21qeldFZk81ZXVHaVk0YVArdElVNzdoV1V4WDVFbEJ1L3BJVll2YUdvU05C?=
 =?utf-8?B?U0NCTmhLUFNJLzhXZmFVSDhwQVVFS1U4TlZnT2N4b1lVK01xdVpLNzNpOGo1?=
 =?utf-8?B?bGtyZnNOOG03UmhaOTVwWkpIbHViMEhXZTd0aXdlQk8xQ2dodnhBT1ozYXkr?=
 =?utf-8?B?Z2grQyt4Y2wvMVJWZFN3M1dSYWpic0cyekJqNHlja1V6RjZxcmxCQ05JNnJB?=
 =?utf-8?B?cW1WbHBBZnZ3T3JwUWdWWDFBeW82WXJ0bEg4VVp1RFpwM2hMWUxxYzIxOWpK?=
 =?utf-8?B?bUZsOEhONVU3bTFqSlY1V3BwM0E3U2xDSEUzZkQ3dkVmenZ3OW10dUo5cDJI?=
 =?utf-8?B?bnZMTndJSHovMVlHak1IOHZuZ3IvVjhRSzdHVjZSbHBqcmFUVzdPU2Z6ZW1P?=
 =?utf-8?B?YUcxd1B5RmwzT2NNYTdRclRUdlpOV29GSUgyc2JNL0RIMkF5MDZrQS9HNFIr?=
 =?utf-8?B?cWRWMlMvK3JqV24vMFpVVzRLdDdQYk1BV0ZYdmMzM1NrNE82TDVkTG5UUkhQ?=
 =?utf-8?B?bko0aE5ZK0VsUm5ZOVc0U1B3UTZUcGNLNlRRUHFUdko2K0psWXZDc1BWTVFm?=
 =?utf-8?B?cElJK3hRRXdwN3EzZktBSmJsREJveUFab2dHOFJyejdjakx4c2hTVjlSMHQ4?=
 =?utf-8?B?KzFkY1hZYkVCcEJWM2IrZlRob0FSNnp4Q2tFcDd0RHY1cWRqL0JUclQxNnps?=
 =?utf-8?B?QmNxbUVNMFhIT0xpS1Nwd3RhRkcwMFY0SVIwdG1QN1VCQmtQUENHK1ZZUThH?=
 =?utf-8?Q?nMrYxmFSwYVxqd3nkdQx6GL4iWYilmzFP1KzAQEKjbHg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bed7e7-ac16-499b-9036-08ddff21b73d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 06:30:43.1770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: megYgItcQvkpYb7yR3w1M9FmRPqQEPEr5JOZ7h3yDFe5BR5g68GRQllJSNq3msrUmxl77k9SzfdpnV0wQ4L+5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF28EF61683
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

On Sun Sep 21, 2025 at 3:22 AM JST, Joel Fernandes wrote:
> Out of broad need for these macros in Rust, move them out. Several folks
> have shown interest (Nova, Tyr GPU drivers).
>
> bitfield moved into bits modules - defines bitfields in Rust structs simi=
lar to C.
> register moved into io module - defines hardware registers and accessors.
>
> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

Very clean move!

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
