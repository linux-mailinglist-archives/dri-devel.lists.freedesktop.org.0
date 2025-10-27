Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A82C0DB50
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AB710E47E;
	Mon, 27 Oct 2025 12:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HqXAzd/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013046.outbound.protection.outlook.com
 [40.93.196.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE1210E477;
 Mon, 27 Oct 2025 12:55:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VsqUigeUtMNW6EuIKz3uz5IUd44o4M4dyOwS89klnoqFxDM43YCPI/HRWY5sHnB5x0+kxK6WfPw46A31fSIFkT5O5P9g1cpcu89jSOhQDoS/Ye6Wa8l2SjM6SoocLX1mK0BQfJ7pfXAQasMY8E3Zs79FeMw5Cgj1jZ810YYMDA6EOL2A520pU94Ut0Fn3HtlodDyWNLnw/C82Y70o0nT88m6OZ6/EKETBomL2M8R+0Nkaky0FQA93QQiosMCF+KVuZE6P11apF7O0jPr/gGrxgLy35KWBTWVUHBFLYGf/xEz2lCKG/sdx+Ynush6jr9cLrj9j1XPPGPSZ9LEy68qPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Nnglzr0ah2hJmNEMvXAoF45FzHTFHHBB3Ew/JCYW54=;
 b=fNa+ek69O+03dI3Q0YpIxay99BVGPQVpaN6yx/FJxnqePIQWFzIPCurBYzontOk+8sXyzoR2KBkQKlgM4e9qD/3AyDVTyQ+8Hc1KoAVMqCve/gljXPEc21dGP1wTV/b5xaYAhuWel6zSN8MLkI5aXiQ8Ma0hHVxAgtsJXq/6X3PXctyaC+IVo/XujdjLL3y4Js+whLjxUKAHGPQp0Q+kvsOZgpgz0BH+Kdyzj8qyxusbpUcabedCP18aVftLudnJFgJjUGTKR+8yzzA7QSc0XCTEgKhRNwb5WGa3X/13EbY6KpjWZe9dNszt4ydah2+r/qb2TXOZYIdws3aRooqKDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Nnglzr0ah2hJmNEMvXAoF45FzHTFHHBB3Ew/JCYW54=;
 b=HqXAzd/mwzX6gsdH5LMrqK0UUE5IMgq3vUAesRCNBivg0GkP/h4zpuUeFoTUoxBYZRK/afBm5sX7ya3r6BdOKk3f35XkCn6kjJwakM+AvKVFOc9TFIN2ik9OuHQhSOp2vcD9SBxC/5w6sh/aRG3wwQooHTT0vIrlYUv0v4non21yiZu4Mx10bzqL1Js3tVEB5+/7ZFFzbrG/mrTgikv442D87XwfVQZA7mEnKDsHYFgKFBGMFHxSqK0QptAF8WXEnY9qW+htgBQJTbWRVvj/GAnniVGTR5dBbBbdoWYsuj1v+Lqe99uYXpoIdH/RA2VxZfAun5EV41q1FPkxOkrSvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 12:55:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 12:55:04 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 27 Oct 2025 21:54:45 +0900
Subject: [PATCH v2 5/7] gpu: nova-core: add extra integer conversion
 functions and traits
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-nova-as-v2-5-a26bd1d067a4@nvidia.com>
References: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
In-Reply-To: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0152.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cea7356-4c17-4d2c-0d8d-08de15580c94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2xvRkMydFdobHhOaHoxeUNmZVhvbVh5T244ZU1hcDcvd0ZDU3BoTTA4RDNZ?=
 =?utf-8?B?a3JQaWd6VFJNZ3R3L0hqUWdZeUtwVXBRRTk2a0lJUWNSekg1Y2orNFBIdk9E?=
 =?utf-8?B?OHBVTWNXaW5nZmROR3dXM3JObjIzR1d3ODZUWFlqQUdiT3oxRGVmUEYwb21m?=
 =?utf-8?B?SmcyTGVMY0tramFzMVRMU1JqaFYvay9abER0NnZnamRHNTRFYm8vaGVhQmpv?=
 =?utf-8?B?QUtUNlhLQzZIOUFhT2t5K2d6UjN5UzlHWVdtS3ZrdXpqV251V2s4ZklyMG8y?=
 =?utf-8?B?SEtEM1VXMy9uR0twLzFWTGswNWJtOEhRSXU3RzFuRElhY0RQSXV5S1pHUFdZ?=
 =?utf-8?B?MUJQQ1lIQ2sxUVVydnBlYVhlNmw2WER6REVDTW9WeG16THl2alM5YWVGWWpv?=
 =?utf-8?B?SWx2TEwwKy9ISzZleW44bFlCRzMwMzRwTUNnQmNVUmtNakRTM3Q5STZ2UThB?=
 =?utf-8?B?RVhTVElmeEhVQ3hIKzA1QnNiMnBwNG1kRHlvTHl3VDV4TDMzbzZNaTVIdGhl?=
 =?utf-8?B?TDRUUjk0U0ZWc0sxZXNkMGRlaGdRK2dBVHZ4UVdnTEdWeUc1cmcyWmFhNVZV?=
 =?utf-8?B?SGFRbGNlRER4M2MwRHFIbW52VFZSSG43YTRTbnROb1NCOVpaaWpRQmpLT2RQ?=
 =?utf-8?B?QmdjbkNWb25GMVl2RkJXb0hCenFIUTBoVDZ4USt6Tk52b0VldnFiMEYwNHYw?=
 =?utf-8?B?cUJKZUx1RXVBU2lCeEJ5TXYwajZKL1dPRXVYclNPbEk5RXZiU3paMHF1MEcy?=
 =?utf-8?B?WnlzQVpwYytNcU1FaHgvVmNuRDhwbXUrQ0RRYnMySXR1MTgwdURxOFJHaXYr?=
 =?utf-8?B?MTBIUFptWkNaNmd3ZzVhSjFManFxTVNtYktmeUxoblFsa1BXUmdTbVBSK1VN?=
 =?utf-8?B?SWVFTHpScmVDZURWbU45c0dTcm94cUdzZzJ2VVNkVUE3NWo0VVFqckYrUUxD?=
 =?utf-8?B?THhyeExWSlM2Q09wRzRrdDlkbHMvRDMrNTZYOEZTSXg0dHZ3WmsxZEViU2l4?=
 =?utf-8?B?cDFaTjc3ZDNRNU01RGh4MFdXRXZmRWtkVnZSVGt6Q21kZzN3N0FLd1dqN1FN?=
 =?utf-8?B?aUI5NGdwb0FMV2dlNmRNK3QxdmQ1c2VsYWhQMjh2U2RjeldyYmhDU0JzdVcz?=
 =?utf-8?B?QkdrMldpUjhDRFRLME9OZVZZcktjaWQ2bWlpa09XQXg1OVNMM3hkc0l2ZWhH?=
 =?utf-8?B?QlJqTjE2QlFRVmZUZ2FvalBXL1EwaFR4K09XRFc5UnRibUVWUFlyNzlRRG9S?=
 =?utf-8?B?UHd1d0hwbzVuNnFKOGNZTzFsTmQvME1heUJvRjM4bTR0Ry9mL28rYS9QMkRu?=
 =?utf-8?B?RGRiVHA4QmJlTWpWRk5FWW5VVFRIWW5OTnBQRmUxMEpMb2t0M0RxSUhab3dQ?=
 =?utf-8?B?OThIdW9kZlNlSklDRSt1bWJrVDhHalQvWEFDZXBmTmltTEFDSDJxZFJES1JE?=
 =?utf-8?B?cnFXVWdOVUh4MFVMbDI2MXdPQmlycTNxOEpWYnUzRFQrV3lZNGNKeWdsdWRh?=
 =?utf-8?B?SGs2amdNMFdhQlo3QVJnaE9taVRIclhmczh3b2pZYlpkOHpYU3pHNS9CS2k5?=
 =?utf-8?B?dXNrcitsZXQ4MVV0YjlHR3BOREl4eTZ0Q24vK093ejdwb0lVSVJYZ0oxQStK?=
 =?utf-8?B?UkRzV1NqUHZqcmFHSVR5YWJBQzZxMEgrblpvRmg3S01sVVk5WGpZR2VYNmRB?=
 =?utf-8?B?ZUdYNHoyWnUwajZGOGcwRlAwRGJTK3ZmaUthT3NIekdkTng0Nk9yZ2YrM3li?=
 =?utf-8?B?TGNUdTRiSFBTVVVRbHpzOHQrTHpSM3ZoYWFVWjJSTUdacTM5S3B3WTFBaFpn?=
 =?utf-8?B?WXRtZmdvckxDQ0JBaTltcTI2ZVR0aXVRa0RERTVacncyb3Rqd1pQUEdjWGo0?=
 =?utf-8?B?NEFrQ1hPOVZZYk1nY2pSZWYwd3N6bEF4RTlSUURnWGkzbTYxOWFid3dhdW9F?=
 =?utf-8?B?MzF1SzZtQk1zMzVZTG85SlZvaUIvWWozQ1NCcVVVU1dPQlJXOUFjZkMwVkdF?=
 =?utf-8?B?a0VZM1V1WDZiNmZuWmhCcVN3VTRsWmh0SG9Eb3NReEUyY0dxc2ZQL2VFSHpy?=
 =?utf-8?Q?b2XF8r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDFacXg0RmpKT1h1eTM3TFZZdjhVQW1SV3dNaE5jcTVDOHlvRlh3bGVLVEQ5?=
 =?utf-8?B?aEdoK015NURuUXpuU2lGTTJGSm5hNThIZmJGdFVkVFBmQ0dkVDExMWN5Sm85?=
 =?utf-8?B?ZW5QRCtwazhUWjRuRGkvZjZtMlZyWTZKU0NsbUp2ajc5eFNLdTh3L0VCYzFJ?=
 =?utf-8?B?YTYwQjMwZTdpd0lXVjZ3eXJvYzdtOFkvR01OdEY1dDRnVjZLQS9HZHdzZHRp?=
 =?utf-8?B?Z0hQZGtGVW5pWFV4RWV4Uk91SEZicHlxam1lekpUMUN6NUtWdlJ5aGxTM1k4?=
 =?utf-8?B?aUNrR2JQbEN2OU5MbjF5djJlZzRSMitWSjJRUERjbDhhR0Vtb0ZCeDBBRVNa?=
 =?utf-8?B?aFMybzExckJicm5QbURYcWh4bnpCaVdKM3VwUHFpUTZ0ZDR6aFFic3hTZk90?=
 =?utf-8?B?dmJkQzVkUWxzTmdSQUFobXZSMExTeTVhazd4STVpK29LWStYR1JHSHgwRVVD?=
 =?utf-8?B?K0tXK3dpTkdka1h6Q2t4RmQ2T056em9objNnejdMSk5tWktKSlkrZ3IyM1Z2?=
 =?utf-8?B?NElQb1pGMEp4ZG44K3c3UDFrcTlSUjlHUFo2T1hOQXR0R3BxdTVOZVRJTVFU?=
 =?utf-8?B?S2pSMFZXYUtWUEh6MGlwbDQ5cy9ySHlVcWowc2FPcXBQcEtEM0RHK1JCNW01?=
 =?utf-8?B?NlkwakhLK0NXQldtWE51TWpCKzJiamdKSzNBSHlxL0Q5Q2Z6S0ZSbUVvTEl1?=
 =?utf-8?B?TXNtUmg0ZXRxRElLS2NSZFRXNUsrVDhDc0VaWjJUZHE5TjhrZWtDTkFwUG84?=
 =?utf-8?B?NGVjQ3QzNkF3ckRlRWtDam5rQ0VJNjdiajU3MEY0UEhrOUl4b0xiMy9EUEV2?=
 =?utf-8?B?bzhUTFBHSTYzc2pYckJJbGpjTVZrTDE2Q0h5cFA3VzdRaDN1OVlOZFNkcHl3?=
 =?utf-8?B?eEh3WVVEdUM1OTlNOHlmSGhjVGovSFowMW5rYVFIZG51Q01xVG90aEtBdXNy?=
 =?utf-8?B?T0RvOTR0cUhzU3IxZnIvZmVjVEtzTk44NGxScWswb2Y3L253U2lEVTNqTm43?=
 =?utf-8?B?ZldtVk1FNitpd2ZFYzgvZm80bXd2UFdEd2M0RW1HNkd2MXprK1ZHQUV4ZmpE?=
 =?utf-8?B?N2lWcURQZUpyU3VQWEpma0NzSG1YQlA5QVhNS3Jsd0RFMGwrOXJ5ZXNGdEh1?=
 =?utf-8?B?c2RvVDdINHNzTWVVbUJpUlF4Y1hWMDZMemI0dXBJZlFzbndTNURac2RTakw4?=
 =?utf-8?B?OVlybWRPNzBlNGhpaEFLM3A4OHd3M1E3ald3RkE4QUNSd2J3YXhTNW9RUUJE?=
 =?utf-8?B?bFVaS2VDdXhsSGFtVkw2bmIvS1lzRzZLZEFGRlZkTEhLbTBndHRTWDY1b0d6?=
 =?utf-8?B?Y1ltNzU3eXB6OVIwbHpHMzMvWFo5bU9vU0t5Z3duNmI3Yk9SR0JxRjZGUjZ6?=
 =?utf-8?B?VmRCYlpZU3JKOXh6S3oxUGhuRWgzQVlXRW41WDM0WmlFYkMxc04vUlg4WFdV?=
 =?utf-8?B?S2liZXNCekR6bStuOEpvT1ZISkt4aElkZ2ZhT0VjczdTRG5vcDBEdFgzK0Jr?=
 =?utf-8?B?Q0huTmJyYk9qR1pMNXFOYVg3OG4rV00zYmxodm91Z01hZUdmS3FqeFNqNnd2?=
 =?utf-8?B?UTdwL2xTZzF4Vm5JZ0UreXRCRktNeHNGb1krK3RpZDNPWk5xVlRJbkFuOEpt?=
 =?utf-8?B?Sm9ibEV6SEVUSEhRVVkzUkF0bW55TXZ3MVdtRW0vRVcrMWNTblJmU1ROUkJq?=
 =?utf-8?B?WjVTMnVKb1hNeCtZSDlHUUxNTU9NQmNUT0RsUnlGY0o2cWhYOENxMXA5YWRo?=
 =?utf-8?B?TFNOcjhjNFltSFF3THFuNndKcnhRK05JV1dOSWUxTzRUWEx0YUlneVJSYzZh?=
 =?utf-8?B?c0lIT3JkN1E1ZnZ1dFhxMTRvL2hicTN0cktvRDJ1MDFzR1ZqTEJHU05XT3ha?=
 =?utf-8?B?b1FoanYvL3VkQ3MrSGVTMlN6TFkxSGhkMXBpTXhTQWlRMmR0QlNhN2tybnlX?=
 =?utf-8?B?bmtIeC9TNDZQNXNKNGM5cHMxYTI3c25nVmhMZytVcDdrb3oweDZvNnI1K1hK?=
 =?utf-8?B?SHZISiswNGFDZHpLMm5kRTBpb3Jpb3pZUGlIMlpIV1Z4T2NubzVIV25OL3Zn?=
 =?utf-8?B?d2gxYXF1V2NrVVFab3hvNFA5elhkVXJibGh6aE9QUndpZjZXYVRPM08ycVh2?=
 =?utf-8?B?RXdpUW03TmdLSDBsWXVKZXdEdWFhdVZNMGJEUVNTRTFyVGh3dUppM0pKUnlD?=
 =?utf-8?Q?Jw7UULpts9CaEq0DtsZvcPImjjIUGn6gB0X2JDDMnulB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cea7356-4c17-4d2c-0d8d-08de15580c94
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 12:55:04.6978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cxg/oGg908+s18r8HBvi+IQW0oFGuJZQI+lvnu80Nh7qo8SzirMj8AoBGSCeLLg1VuGnAvJ93lqMHTepvG9kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863
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

The core library's `From` implementations do not cover conversions
that are not portable or future-proof. For instance, even though it is
safe today, `From<usize>` is not implemented for `u64` because of the
possibility to support larger-than-64bit architectures in the future.

However, the kernel supports a narrower set of architectures, and in the
case of Nova we only support 64-bit. This makes it helpful and desirable
to provide more infallible conversions, lest we need to rely on the `as`
keyword and carry the risk of silently losing data.

Thus, introduce a new module `num` that provides safe const functions
performing more conversions allowed by the build target, as well as
`FromAs` and `IntoAs` traits that are just extensions of `From` and
`Into` to conversions that are known to be lossless.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org/
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/num.rs       | 158 +++++++++++++++++++++++++++++++++++++
 2 files changed, 159 insertions(+)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index e130166c1086..9180ec9c27ef 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -13,6 +13,7 @@
 mod gfw;
 mod gpu;
 mod gsp;
+mod num;
 mod regs;
 mod vbios;
 
diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
new file mode 100644
index 000000000000..adb5a92f0d51
--- /dev/null
+++ b/drivers/gpu/nova-core/num.rs
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Numerical helpers functions and traits.
+//!
+//! This is essentially a staging module for code to mature until it can be moved to the `kernel`
+//! crate.
+
+use kernel::{build_error, macros::paste};
+
+macro_rules! impl_lossless_as {
+    ($from:ty as { $($into:ty),* }) => {
+        $(
+        paste! {
+            #[doc = ::core::concat!(
+                "Losslessly converts a [`",
+                ::core::stringify!($from),
+                "`] into a [`",
+                ::core::stringify!($into),
+                "`].")]
+            ///
+            /// This conversion is allowed as it is always lossless. Prefer this over the `as`
+            /// keyword to ensure no lossy conversions are performed.
+            ///
+            /// This is for use from a `const` context. For non `const` use, prefer the [`FromAs`]
+            /// and [`IntoAs`] traits.
+            ///
+            /// # Examples
+            ///
+            /// ```
+            /// use crate::num;
+            ///
+            #[doc = ::core::concat!(
+                "assert_eq!(num::",
+                ::core::stringify!($from),
+                "_as_",
+                ::core::stringify!($into),
+                "(1",
+                ::core::stringify!($from),
+                "), 1",
+                ::core::stringify!($into),
+                ");")]
+            /// ```
+            #[allow(unused)]
+            pub(crate) const fn [<$from _as_ $into>](value: $from) -> $into {
+                kernel::static_assert!(size_of::<$into>() >= size_of::<$from>());
+
+                value as $into
+            }
+        }
+        )*
+    };
+}
+
+impl_lossless_as!(u8 as { u16, u32, u64, usize });
+impl_lossless_as!(u16 as { u32, u64, usize });
+impl_lossless_as!(u32 as { u64, usize } );
+// `u64` and `usize` have the same size on 64-bit platforms.
+#[cfg(CONFIG_64BIT)]
+impl_lossless_as!(u64 as { usize } );
+
+// A `usize` fits into a `u64` on 32 and 64-bit platforms.
+#[cfg(any(CONFIG_32BIT, CONFIG_64BIT))]
+impl_lossless_as!(usize as { u64 });
+
+// A `usize` fits into a `u32` on 32-bit platforms.
+#[cfg(CONFIG_32BIT)]
+impl_lossless_as!(usize as { u32 });
+
+/// Extension trait providing guaranteed lossless conversion to `Self` from `T`.
+///
+/// The standard library's `From` implementations do not cover conversions that are not portable or
+/// future-proof. For instance, even though it is safe today, `From<usize>` is not implemented for
+/// [`u64`] because of the possibility to support larger-than-64bit architectures in the future.
+///
+/// The workaround is to either deal with the error handling of [`TryFrom`] for an operation that
+/// technically cannot fail, or to use the `as` keyword, which can silently strip data if the
+/// destination type is smaller than the source.
+///
+/// Both options are hardly acceptable for the kernel. It is also a much more architecture
+/// dependent environment, supporting only 32 and 64 bit architectures, with some modules
+/// explicitly depending on a specific bus width that could greatly benefit from infallible
+/// conversion operations.
+///
+/// Thus this extension trait that provides, for the architecture the kernel is built for, safe
+/// conversion between types for which such conversion is lossless.
+///
+/// In other words, this trait is implemented if, for the current build target and with `t: T`, the
+/// `t as Self` operation is completely lossless.
+///
+/// Prefer this over the `as` keyword to ensure no lossy conversions are performed.
+///
+/// If you need to perform a conversion in `const` context, use [`u64_as_usize`],
+/// [`u32_as_usize`], [`usize_as_u64`], etc.
+///
+/// # Examples
+///
+/// ```
+/// use crate::num::FromAs;
+///
+/// assert_eq!(usize::from_as(0xf00u32), 0xf00u32 as usize);
+/// ```
+pub(crate) trait FromAs<T> {
+    /// Create a `Self` from `value`. This operation is guaranteed to be lossless.
+    fn from_as(value: T) -> Self;
+}
+
+impl FromAs<usize> for u64 {
+    fn from_as(value: usize) -> Self {
+        usize_as_u64(value)
+    }
+}
+
+#[cfg(CONFIG_32BIT)]
+impl FromAs<usize> for u32 {
+    fn from_as(value: usize) -> Self {
+        usize_as_u32(value)
+    }
+}
+
+impl FromAs<u32> for usize {
+    fn from_as(value: u32) -> Self {
+        u32_as_usize(value)
+    }
+}
+
+#[cfg(CONFIG_64BIT)]
+impl FromAs<u64> for usize {
+    fn from_as(value: u64) -> Self {
+        u64_as_usize(value)
+    }
+}
+
+/// Counterpart to the [`FromAs`] trait, i.e. this trait is to [`FromAs`] what [`Into`] is to
+/// [`From`].
+///
+/// See the documentation of [`FromAs`] for the motivation.
+///
+/// # Examples
+///
+/// ```
+/// use crate::num::IntoAs;
+///
+/// assert_eq!(0xf00u32.into_as(), 0xf00u32 as usize);
+/// ```
+pub(crate) trait IntoAs<T> {
+    /// Convert `self` into a `T`. This operation is guaranteed to be lossless.
+    fn into_as(self) -> T;
+}
+
+/// Reverse operation for types implementing [`FromAs`].
+impl<S, T> IntoAs<T> for S
+where
+    T: FromAs<S>,
+{
+    fn into_as(self) -> T {
+        T::from_as(self)
+    }
+}

-- 
2.51.0

