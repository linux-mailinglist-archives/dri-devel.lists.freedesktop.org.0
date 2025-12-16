Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55FBCC398F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 15:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D86910E7F8;
	Tue, 16 Dec 2025 14:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uFr8DiAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013030.outbound.protection.outlook.com
 [40.107.201.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BBF10E7F8;
 Tue, 16 Dec 2025 14:31:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EM6HCpsU+2X6pQVleZ+3uu1SP43IMIjA+CWfDUCvF7QkqiBsLBmgHGYM/yCZevbdXNqApl/29Ku0MbzJ/JQeOCxonoHYA1q7G3pVDYXaBg+FJzXYjh0QPoMGUDqshUL5ucrjo3gKOikfM+tB/WgMd0KRWmBHzgOxWQp5BSuupcp2qovPjbmo92khYXh12owiko50MufRhpY/s5y/B8LPiEXQXY4Hchm5KgLSqvjmYQLav5AyQo0k/eXq6XWLE+MjM1huZf+09To1qcBFQ5jorsc+bGS9maYjVxAwb1u4RpYomx1edrjF0zvvv2vWbyWATt1nJ36BGS+gGiGF5cYarw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0EktwFzNitpHTCdcupIZo0bM6/xW0r7Hp0O9l5Uaj8=;
 b=FxpXVZwD8LNJtUN6sx1Gcsicvg8CakWK65yeWBa1Rmo9opxfCTklega3qlNRUNzuE94QAUg8gzuAGdZ092FtWvlhkYEGpnDQRUBcVMH4D8uoaPBAiE9ilL+iWBIeTl+PJPHfNsSJA7wlfsssGXGpM0FAdQiwySXy9SqsXPmOitG+Dmw3WsOTkdhGvMndPwUrtmwf7ZV2/HhKusfA4CvU9Q2+v3YR19/3kxb+nPxCBQh4wWVreyrU0Rfpu2yqLcYEanT4+7gJVQqCrqLqZacnTKchcxECKX8mE3mx+bFNoFjWA2ltCTSfY9+QPNcTdWVVGeQUHfQIsayXx529p1nL4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0EktwFzNitpHTCdcupIZo0bM6/xW0r7Hp0O9l5Uaj8=;
 b=uFr8DiACER5Vn2KfVdsqsknlURIzqQxXf27wjx97Tdg/uRsF0kJLCo+DS9oSJ8FA7fgyZR/N37uf+YXHrJG5ijCaJXAYuSTTN5Gh68zSDAx9clXtE16cyR21M4ph7iQ2s9jtOAgdx4aOoq2FSqQ7m9S6sV35YcOSe49Irat60zB5oH0UDdwICKKNMUkeOwF07i21bVwtm0BZoJW8aOC9QxJ2dKxHRC+vnwHGJ+6CMv6T5BSjHxmU+r7G6QqGgF6TOMlYiPGIr8cref3Zskm42Pr1lRqfI0sI2ZzNFft3p0paoajOKD9rr0F/aHWXauYfwtLY/AnnWErKIU5PTy3S0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4228.namprd12.prod.outlook.com (2603:10b6:a03:20b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 14:31:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 14:31:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 23:31:51 +0900
Message-Id: <DEZPPQVSS2H4.1WGXTSDHIR8J@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] gpu: nova-core: fixups for GSP message queue and
 bindings
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com>
In-Reply-To: <20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com>
X-ClientProxiedBy: TYCP301CA0072.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4228:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa33794-df5c-48d8-3314-08de3cafdc90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ei9SbnJ0VUNXTGlYTkJzdGtuY3ZubmsvY2tXNEoyM3hWOTBUYmtsL1k3a2Nw?=
 =?utf-8?B?eVgzNjZyZ1Y2SmEwS2NuY0tqYXFJMTBMMWQrYy9pM1RNL3NjQW1IYjkrcldL?=
 =?utf-8?B?c255cDErVWVCRFN4c2p5YXNleVNSSU1PeEJJQ3JIdldqVWFhWXV4Y3pMWkN6?=
 =?utf-8?B?bjVWK2REN1ZaaVRGNWtvRlVJY3k4M00vb3pqNG5jNXBGWVJVazdQZ1pyOVl6?=
 =?utf-8?B?K0tubmpGYnEyb0xTcGQ0T2FxQ0J3WmFTWDNLbzM4L1licHNKY0IyQnpodERI?=
 =?utf-8?B?eE5WcHd4SlFaay9oQ01qZFk2OG5EMDEzQjJRTDlrWjQwZ1EwWm9WWFprdWh4?=
 =?utf-8?B?QXQzb3JoWENiWW9maUtiSzJMN3l5TWVwb1JBNEhlSmIzTEdiTGFPdzhCaXlS?=
 =?utf-8?B?K0ZVMmNMK3ZkeHZma0c2dUNud0tpMTBYSTNVQzdDaDlRdllDaXEybjg4UVp6?=
 =?utf-8?B?UFc1RkdtemxBekRCbjlVcFhqc010NWxnSEh3QTlTY1NDYVkvZE9TZ0Frcnpa?=
 =?utf-8?B?ejJQMEFSa2FkVTZlM1JJN2NkMDBqdnpQSU5PbGFQK2JNVFpFd0p4NkwzbElo?=
 =?utf-8?B?N2p4cVJQTzR2WExCZS92amsxM04rNU13OGlNMzFOeGdGSlJheWpqeEZSMkNJ?=
 =?utf-8?B?alptSWppeWpHVVcyS3hYbWlQTzZUY25FdmhtRUI0bWdMTkZBRmhkRS9ZMzc3?=
 =?utf-8?B?UDA2d0NIemtmSWlFTGZJU3I3d0l3bDRzbnd1b2xvRzY4MDBjbHNFbGNZcTk5?=
 =?utf-8?B?SDc0RUVoOGZ6QVU5c2VZVTYxYWI2cm9RZUdNVHJxSEIrZERaUVVpQkJaVnlP?=
 =?utf-8?B?UXNjbUt3bjJuTlNIWElBMWl0S2pJZjh2Q1loaUxqeGNmanFHbnVSdG5KdG04?=
 =?utf-8?B?WkRPazJidE5Ra0ZFNVBHNXhFalVkZ29PWHRKUEx6K2wwZktjcUtaNVN0LzBM?=
 =?utf-8?B?Sk1XVWdzWFIrVkljNmhaTW9nUzlHRGMrNVh2OCtWSktpR1crNjJKaUNMdGhC?=
 =?utf-8?B?WFpHTWJLTHJabWloQVQ2M1AwS0FrL2JmM0VuWlU5aXBHQ3FUczhHb2xJckRJ?=
 =?utf-8?B?dDArVWE1UWlpamlBZDFaTVRCNmJzckpBYVlkZ1prT2lkcW5xaitGL2tkUmxO?=
 =?utf-8?B?eEtZc2RYWEQ2dTdKdDM5a1dJeC9URWw1M3JGbk1XKzhSVkhaMkFZRTIxUDFa?=
 =?utf-8?B?VFV1Yy81bzVnRUZhWk5EU1MxOXFNY0VVdUk3NDA1MDM5S09OMlRFRkRrbGFp?=
 =?utf-8?B?bFRNRjFyU1VER01XOE9VR0wvU1BTNlFpbnllTTc4blBSb3V3NzRFTkQzMnpy?=
 =?utf-8?B?YWI5eG9ycGVJYXZzN2luejVJVVVuVlBhQ25tS1ZUdlJNZ2hUYmE3Q0JpU0hZ?=
 =?utf-8?B?Q21Ga2JHZGNsNjBZQVVzNHpmUTc1cThNY1dnV0RFdGFETDk2eDN6endSU1hp?=
 =?utf-8?B?ajJ5RGYrdDgvcnJIM05xVlN1aFE2TXRka2N3bHJEVnRhSS9Cc1I1Mk13RFdm?=
 =?utf-8?B?L1VkV3A2M0dGTDZmRVEzY1RVWHc0NkpwWE9WbkV5SVl1WVZ6aFJMRWdvQVk4?=
 =?utf-8?B?QnpWcXlNc3NHa1FjSm1BY2U0dmtQQmlkUlcrVUwrYmZRbURrTlI1RUEzMno0?=
 =?utf-8?B?dTJsYXR2OHc5VUNDMnhZMUMycTBPZTdwenFmOUpGV3ZOb0dBMHVHbCtRZEFM?=
 =?utf-8?B?bWk4WEUxTkRQbFZTZC9mMmpBQ3F3ZkxUYTl2KzFsSzBOWmJTZTlKNGFKNjln?=
 =?utf-8?B?YTcvUlVhR1J0S09rYUNxVVJmRmlBVTVPL2VFdmFpeHplVUptS2dYU3YxL0dP?=
 =?utf-8?B?NHQ0eDByMDhsbDNFY2lFZWFETCtpNXo0cE5KV2J1V1lMM0JvU2kzZkROQnpQ?=
 =?utf-8?B?R29nS0RqUUtNWVBtK3ZMZFZKZTcxMm5lVlIzNy8rSk1McEUxWk9TUitBU3Fo?=
 =?utf-8?B?aDVqVVJFM1gxTUR4aXhSM2xvT3VIenJ4RE9CVHg5NnVrUUVkQ0Fhc0ladFIy?=
 =?utf-8?B?a0ZtVHd3YmFWcTNRblJoYmthZmtnOEMrVTdwYlFxekkwaTBENzQvMjk3RmhI?=
 =?utf-8?Q?xoBWSq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkJJTTVaTkZhbzluNU1CVWlabklpK1ZkeHRvNUp2TTBwNy9UU0I4cmlDU2RO?=
 =?utf-8?B?NDJEemlxWU1yR3NuZk9WWXdjYlB5Tmd3bno2a1RlbGdMZFdXMWx5SEU4cnBh?=
 =?utf-8?B?SUdBcGgzcTZnWEVDRS9ERUdzQVZJejZtL2RXbTZ5RFhPQ0JVMkZxcjBtM3B3?=
 =?utf-8?B?aVhPVkVtRGpOQkJEVkJsT3ZNMmlzYXVzaUtaMVlSUExKZDl4aTBXZmlySUhR?=
 =?utf-8?B?d3R4c05JS0VWcVZPZk5oOWhpdnE4SGZScHBsaEJNaG5BVUV4S3N2VHhieGpt?=
 =?utf-8?B?T2F0ODhZQkJxZzVxQVEweTI0VDlpVFQ2WExrRWpoc3B6Smp6cUhVSkR6ZXNR?=
 =?utf-8?B?S0xkV0JWazNaZW5pVTNqbk5JS1B5T3hnd1BjWDZpOElzUGRiMERXZFRQbjI5?=
 =?utf-8?B?a0Y1UCsvYWVCclhreDRWK2hHZWJ1MTV5NUtJb09Wa3FXaEhXSXZndTZvdU1U?=
 =?utf-8?B?QjF6M0h1eFZJVVhPZGJNcFFQSS9MVEU2RHNkRGs1cjloZVhtM095VUFrRVk1?=
 =?utf-8?B?NTUzV1NCNnE0a2FpUlZUMENwRzZLczVLRUdRN3VoZHBTaStIWmx6NXM4ZDJq?=
 =?utf-8?B?UUp5eFhJc3pienppdjluRE54a3BUNEM5VjErSlNSbDduNkF5V2pRT3EzMFhw?=
 =?utf-8?B?TTEwcmdVdWI0R3V0eHg0OTYvb2FOQmthams2R1hvKy8wMmQ1dXhQRkFWUFY5?=
 =?utf-8?B?MFIyZXl1QyttSUtocUk4OXRMaXVFSXVGTGEzUFZCYlVqeTZyVkpxbm5LSi9L?=
 =?utf-8?B?L2JNOFZQUDU4SGd6SGRURXQxaDFGcGxOLzRwZU9Gdy9PT2hLRitPaGpNZzg4?=
 =?utf-8?B?STE4Y0dHaVh5ZXlUZWtwMlg5V2lYUHVDUWZTZFNwVzVpT0x3TnNwMENSWjVz?=
 =?utf-8?B?L0ZUTGpsMkxLYWp3dVRETVc0UHhIaUNtN09HUjJFSFBTNE5PdVlmanh2RG82?=
 =?utf-8?B?OVBLZnJTLzBuNnF2UjdpSzh5ZTg4YlczNXlpZXlGTnRDSzZtWjlySi9IM0N4?=
 =?utf-8?B?NFdNcG9UaDVJL1B5SUlYVU82bC9mV096eEkxL0QxNjJxd2NyY0JVbTVja1Ix?=
 =?utf-8?B?dzRkL1RqRzRMVElrYmx3dTRpekRxT0xwL2lvNFBIcW01RWV0UHhZUitLWGs0?=
 =?utf-8?B?ZlFIWjdhVWpRY045d0drZlE3cXdBZmVVUHRYTzJTWlFVb3cxVlYxbkRMQ1ha?=
 =?utf-8?B?SEl2VFRXZWw0RjE2Ukw3SzFXRm9mL3lKQ1hCN3hJejFSZHdVMEFGOCsyd3pa?=
 =?utf-8?B?TytHU253bXpEcjlZSHRHWHhVS3pIOGtUQjE0emJvbWNpQktIL0x1VE83U1pw?=
 =?utf-8?B?VERweGtUZ29rOFAvSFM4ODdPWk1BMWJmUGlicHNIdm5ZZEx5c2oxV1FpT21I?=
 =?utf-8?B?RWVGVmFIMVRrUXNBcFVTNTBxaVk3TXdVbjk3enJkVjdDSU1vN0lGbjFkaTVm?=
 =?utf-8?B?TVdINXdnZTRLdmFYeXJ6NmlXY3BzSWNsLzJjV0w0b09KdXNpMk1pWXhXUzdh?=
 =?utf-8?B?SkEyTXpkOHlteGJidm9HOUFVbEZiOUdhdWZBejRzSnJmSyt2clNkZjlNQUh6?=
 =?utf-8?B?OXVNWWFFR3Y3eTBuRndsbldCQjYzNW9xUm9EczB5VmRYQ1Q3dHQ4UTVPaHBn?=
 =?utf-8?B?aGt4VzJrZHNheVpXc0RIK1RGMldxZitDbURCSUQ0N1pKZk9NQ0lELyt1Z2da?=
 =?utf-8?B?Ny80SWthQUZYLytCemQwUHJFSVVDS014L1M1SC9PZmplMXVzWjBHc2RuQUNH?=
 =?utf-8?B?aEM3S2ZzTndqbWZEdy8vRENZdVp3dTRxODZZTWd1ZGtLVDZYTVJpRVJiSzdl?=
 =?utf-8?B?bmFRbTNUMW1HTks1TlFKaE41ZnErOUFVcERCb2NHYjIyRDdSNXBSdVVFU2VX?=
 =?utf-8?B?Y3Q1b0ovbmtJYmI0M09RQUx2T215c3RJT20rb2JGTmE2ZzcyOFVwTjJnb1NE?=
 =?utf-8?B?Vm1tMENOR0lweHlXekgwR0hUdG5oQ2szaHdsd0xGZ3pkZlhtUTFhaUVCRVZk?=
 =?utf-8?B?N1FmQ0dCd01HckRqTUpDSHpRN2lpekNGRy9ZaEoxY1JJRG9kdEVlWWtsWm5m?=
 =?utf-8?B?VVRVWnFSbW1XMWdDajBtVFArLzEzQ2lJNVlNT3hHMlY4TU5keTBCeFlhYm11?=
 =?utf-8?B?aFBaSkkwMXZ5YXNwZ0IrQXVHNWljcktVcUtvSXhMOEdDRG9IYk4weXdhNDZ4?=
 =?utf-8?Q?vKUGZuyYXLDWwVLSDw/DOZucFuOWkISb7uCUAsa0+qmM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa33794-df5c-48d8-3314-08de3cafdc90
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 14:31:55.4838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2/KqWInoNwuBl1CXc0/AWg+SbFI+w8k8gVXUFdasGmUAbI7KUXSBj1pBcOPnZgJrcaNkL7M7JtIvT5p7JOalg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4228
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

On Tue Dec 16, 2025 at 11:57 AM JST, Alexandre Courbot wrote:
> This series contains a few fixups for the recently merged GSP
> command-queue code, by order of importance:
>
> - Some explicit padding required to safely implement `AsBytes` was
>   missing in the bindings,
> - A bug in the received message length calculation results in the
>   message handler being given more data than it should,
> - `MaybeZeroable` is now derived by the kernel's bindgen, but the Nova
>   bindings have not been updated for that,
> - Some items in the bindings were referred to using the version module
>   directly, instead of the alias we defined to limit the diff when we
>   upgrade firmware versions.
>
> All of them address "bugs" (with the first two fixing actual correctness
> issues), but since Nova does not do much anyway, they are also not
> absolutely critical. Other series planned for this cycle will depend on
> them, so one way or the other it would be great to see them in
> drm-rust-next.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Pushed (with Danilo's Acked-by received on Zulip) to drm-rust-fixes,
thanks!

["gpu: nova-core: gsp: fix length of received messages":
  update `PANIC:` comments as pointed out by Joel.]
