Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 280DFC18EBD
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BDC10E71E;
	Wed, 29 Oct 2025 08:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JOcmbrkk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013045.outbound.protection.outlook.com
 [40.93.201.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1414D10E17E;
 Wed, 29 Oct 2025 08:16:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ID8wuy0h/Ge3SXN8LKN+ebxx+ubB6zjEUeIo/RrzYMlhHCR8W7oNDDKu04HDdVMRm4/8Zg9jT6pcmwLP0OxcvEPV/oRHfhRe0firPBC1bi6s+hcT4pYzeyJ1F+c+NTrFJ3sFL4T8mIdKp8B3w3dNeBE+qJPKBMZXLbudKtW3s1ZHg1ZfpIltzyQN7VINFjQdK6sxWZEbZ3cC02NzxzsOxK+Sw5pb64SkFfgrCznpym/QPv/mEkV4qza8iuOvDTjFn3nM5R4RQ7tFh5oQK1Niu4gAtQqFIRt5h9uemZo7wI32hM3x5qcqRe/+BRMdqvBXAMKG/umqPXkUPFp5x80xfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJ4hLTtfz7bihWUiLhrGK4Zynb0jJrCmoKhKVlJZKPg=;
 b=FUkQyUi8jhjIXa51TZMWQMwiSQmieW4bRcelG9WAgjXwMWKEBFVxEEm+C8FSpnLif2BBqfGatw1pfVoFv/Y5KqcmDG5kfGzNuVDAQztICGsvT4DMrw0cyx0wtZHUw4rWxyoDqxesf5ry4CZeLyYvuh2KYjBoQYUwQpq++3LkvK+Dq5o7ev/PDDelrPH//yut3wa+FsVqsXrcPA+Ry6VwXFVbUAY+2GUysfs+UWq9uUt480fjNcI+95Sxm58JlZofKRE2CFG9KUkty7Y1LLzyac/rZ0AZNchWxEj/Lee4e8ZdsiPYTeGTDcLfu4mSug+66/vvgeKX8WvETWCBu6xxDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJ4hLTtfz7bihWUiLhrGK4Zynb0jJrCmoKhKVlJZKPg=;
 b=JOcmbrkkky0tCC2LSVS3pZLxrVks5Fo2eVOT0G3yNMe+fX+MphWh/AJ2lxb4FnKRWaadET7potU7nu4qVMkvjQ7Ik3H749qsTygwF6eIaYBKM6Y47/aJsP5ZYIoS2x9r+drsiOH4X9SIeSu9MMKKl7vqxOrtNcBFr9Pgpf1BtX1ZYHvXnbvLEuSgk/IcADI0KDaMdKbGkkKJ0q0U5CpcVtg0el6Tc3CsCEhpSDYnSERsj1maGmdW0nDLWcG0Fk7ANtSqoT4hl5rWXgcF/GohIB/ltHQ7527m4C1HCvkhU2ZNqbZUhl4e/Lnp1RxsDnHkM6pWDe2KC3vljxbT+TA+2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 08:16:54 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 08:16:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v7 00/14] gpu: nova-core: Boot GSP to RISC-V active
Date: Wed, 29 Oct 2025 17:16:27 +0900
Message-Id: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFzNAWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyNz3fTigvik/PwS3WSzpCQDE4tEYwOTVCWg8oKi1LTMCrBR0bG1tQA
 xxCh/WgAAAA==
X-Change-ID: 20251027-gsp_boot-c6bb048a304e
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: OS7PR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:604:257::20) To BY5PR12MB3986.namprd12.prod.outlook.com
 (2603:10b6:a03:195::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 197b6c04-8bbe-4d2d-e15e-08de16c383f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MU5Fb0YwbXp4MjBJWHVwQmFvVG9kYk53c0NkZCtpblFRcXhsUWFWU0dnai9P?=
 =?utf-8?B?R0J1cG5KdjVSTDlMQW5NZnVDaGhnNmd3clJ0WTVBL1VYb1BCL1dkR2F4Zjhz?=
 =?utf-8?B?REUxK29RenR6ejRDSVUwRlBRZkk1NlJmQ09ZbmR5dXFkVG5GZ2VyNGM4aUZ2?=
 =?utf-8?B?dlJNU3hrMzNQWkY2Z1E0VHVIWWJ0eEYyeVJDMG5HaDV3dVVJa1hOM21yck12?=
 =?utf-8?B?Y0ZkUGJjNHdoR05ReHRBUXp4M1JCUzRHdlFZT3BURlVnTmpLS041dnRHNWFL?=
 =?utf-8?B?bFdiWDRwc0paZk9LNjB5RHEwajNhWE9tK3JJWC9VZEcreHNaZ3dMVUFOL2cv?=
 =?utf-8?B?a1d1OW9sQ245dHRVOGxZQ2w4TktPSUFRMi9uWURGS2FjU00yQVpINHlMQW9s?=
 =?utf-8?B?ZmFIaFgrdDEvWlpyVitFU0xqRUZKU1hEUlNmanlSTUFEQWRYdGZOYkhLVGJj?=
 =?utf-8?B?SWZyOGUrMElBL1RKVEYwYUxLV0RYL2w4SXdSdHRjVkhHNkN0Z3BPOFJkNzl4?=
 =?utf-8?B?S0hRaEFDblV6NFQxNW1pNDRMU0o5UUtkYzNYaE8xTWtBL0tUN0VhRDlJSlR0?=
 =?utf-8?B?MnBKRDEwcFBXUlQ5aTNUdjdNNC9QMWQ3TDNCcmh5RmhyZ2JoWE5OWmdGZ2Vs?=
 =?utf-8?B?Ym8wck41OHhxYnQrQWhQbSt3NE1XMFN0WnMzNDd6cncwb0ZJeE9leXhDV3hl?=
 =?utf-8?B?UHNXd2tZRjJZT2dXczlMOXloNktsNTJuQ0VHVHVYZVhONDd6Q2Y0U3NzZm9F?=
 =?utf-8?B?dzlxTGtyRDJ0WWN5cEFoMjVtV1pCUCtjNUVmZDdreEFZVk9yRDZYWjVLeElq?=
 =?utf-8?B?Z3hPY282a3NrRkhCS3lNMmxZUHdkaXNsOEw2RndSQXRpNlZRMnRSQVpNT2ph?=
 =?utf-8?B?MHBZVWRaTzI1ZmVwVFNPek1UaDBaTVpsOVhwMG5hY2FYRy9oSkFVOEFsYzk3?=
 =?utf-8?B?Q3dPeEVSVHo5eXlKUGFOUjlmZVlnMjVLcHZ1SGdQZVNDNlRZdzJTQUhpRnUw?=
 =?utf-8?B?QlBscjdwS01VUTl1ckRTejA0amEyN3dtWXNGdDUvV0gxeUlNQjN6cy9BM3k2?=
 =?utf-8?B?azR6QURkZjV3UGtQUFJEMHk5ODJacHN6a1ZNcC96VGI3YiszeWk3cndaQ1o4?=
 =?utf-8?B?QlY4UGplQndFQk9oN1phK01PTGxISUprOFFCYi9zazdYNmJYeGRGZ0pCd2hj?=
 =?utf-8?B?N3AyOVJpb0VaUWdYRmdzYlYxeTlXT0Q3S215T3gydjBTY1h3M3FzRzdDdTYy?=
 =?utf-8?B?N2N5MVVaN1BzRmlyeHl0VXVZbTdabm5XcmhEcDlDMGRSNi9CYmVjY2FIdUJu?=
 =?utf-8?B?dEpWT1ZNOCtheVFaazF3enM4UkhUcXpuN2JMQVZJTGk2aFArVk9yNEIxTm5h?=
 =?utf-8?B?V2dNMVRXMkJRYWQzQmhUOEpCeFZscEVnQXJsTVh1dDl0RVpRWXloaTFGL2pB?=
 =?utf-8?B?b2FUdVVkQndpVWhTQ3JURUxvd1VxVVk1eG9RYko3ZjNJRlVXS2h6MHNaK28y?=
 =?utf-8?B?cU5HR3Y5MjBEbFZtb1NMTVl1QTU3ZXY1bXdmTlVZUEtrbnJEc01GV1VpNnNx?=
 =?utf-8?B?WVlTRW91SVF0WXh1TVBqV2h2YUdvVDIwZHYyUC8vNWJYcm92YTVmTlR1OTY5?=
 =?utf-8?B?RmFWOW9QZmlTVHBjMElWNmN4WjVCKys1eDdiSUlZUkZmL1BoMnl1SGphbTFq?=
 =?utf-8?B?azhtV3V5NUNTV0hHdzRuQXRMQXZsVmtmektIZ1ZoR3NBRDBsaVNKNkZrQThm?=
 =?utf-8?B?YUU5eHVMUkFWekRzanVDTS8wR3JsemEyWTJ2TC9yMUtpaS8yaVhkc1ZiZGdZ?=
 =?utf-8?B?YnZFV3dzaEx4eldvWnhDb2lBa1M2NHIybXlld3lmVXRvMDM2R2JwT2lTWm80?=
 =?utf-8?B?TkNVTXJ6Vk1oejJPc1VpNUFWYUFNbitZKzJMS1loaTJwQmFrcmxzT0xRaENE?=
 =?utf-8?B?TCtIbWF5WG41SDRJaUNVK2Vicjc2Y0RRUjdaajNTWSt5OGU1bEN6SWNKbDB3?=
 =?utf-8?B?WENCdXBHeG9jUWExRHBQa2NVZ3hMOGk0M1hIekluN0pHbWxxdXNnMTF3dW1I?=
 =?utf-8?Q?zP3Cp4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2RlTWNBZFVXMW16MDFIV29wS2p3ZFhVd0FqTnNyQlQrZ1hTYXFsT2c2MWY4?=
 =?utf-8?B?VktHK0hadmZFUFYrWXNLNGlFTVcrTmlzd2NJYmx2OTBpb1V2bW9XcE5oM2Vh?=
 =?utf-8?B?OEZlVWozelhITDgydlFkanRQcmZhZFBJQ1NwMDN3QU5IQjBESk94SVdlUTVm?=
 =?utf-8?B?K3hsMVkwK3ZQbEpCdEtDMWUxUnkrVFpNU2VmeG5oNWlwU2hBTE9LaXJCQ2Zs?=
 =?utf-8?B?UW5uQUduK0tSNDJsSGtTRUxoZWJ6TUx3OFZDL2YzcjBzWDhSbnVSc2Y0ZlF4?=
 =?utf-8?B?Q1diVk1pTnF4ZExuTkFzMTdrSUM4cFlKUnY1NUdXaVN6TUZ4dkpqeWZPUkp5?=
 =?utf-8?B?WHIwRWxqTXpheVJNT3IrY3dEYStpSy9CT2EvYjIzYWZOaGVITHpsd1hIaWNm?=
 =?utf-8?B?OWEwdVR2cUxoTml0QkdlWnBpSXVZakx4MW4yc2N4MW80aTJWSkkrODFEWGVF?=
 =?utf-8?B?VXV3TjNlMGVsZFdrc2tWRHkvbnhOeW5zWHlmbzJ2ZGdBV1BVbVNHRFAxc0dG?=
 =?utf-8?B?VTRuaGorcElRVTA1SmVieWpqMHlMRHNYMzhHOGZKOGo3d3NKVVBxbm4zL2Js?=
 =?utf-8?B?WFJSUWVvL09nWFhkRjZlZDFYWDRRSCtwR0ZDYVRRZTVNMmd5Q2pwNDAxYmhJ?=
 =?utf-8?B?cStVckVrNG8xR1FaR3IxT2g4TkZCRE44eDlmWnBnb2VwSEcvYi8ySjVZYXdY?=
 =?utf-8?B?S1lJdzJpT3JKNmJ5dmczaTFDWUZGWkpQbVFocXhHL2FPaHdMWS91eFl4M2JI?=
 =?utf-8?B?SGx5d3cyRGp4ejRHOU1hZWErVjFreHhyU04vVlpzMXdNM3N4OVdiZXpiUW1s?=
 =?utf-8?B?by9vRXIwQS8xUER6ZFppU2RDTWxHYXcvMDRHeldKK3RTcnhVeEpYWnVORXJv?=
 =?utf-8?B?cjJzSGZBRWdNR1hwVVp0Vk9Zb3d0UHJKMlZwQkp4cVl4aENLOXp5aHJhdHI3?=
 =?utf-8?B?N1lydE5TUUUxK09ZN1AyVVhxanVGSGFrbWhkRXdtdFRzMnRYdXExZ0M1YkJO?=
 =?utf-8?B?ajZxTkxFeFJZOTNpNTRPTForbGtJcm53c1pUTVM1MEtpT3JoNnJrMmRaWHRh?=
 =?utf-8?B?eHVOaTVEZE44OVk2L2tEOGU4cytpMG96R21zM3RRY3YzdVdsS2Z3NGZWNDRJ?=
 =?utf-8?B?T1RPZ05yRXVyNFlTTkkzZ1pOa2g5UDZXeDc0ZkpoTm9zaGJQZ1p3L2tadkkw?=
 =?utf-8?B?aktJdFpnenkvNm1YSGNnOTI3M21maDUvUXJxU0pOeHppYW9CRVNwcWhVbm9j?=
 =?utf-8?B?TUxmNWF4S09CN2hDc0s4VUdVMmNIWlVkL0JOOVZtdWp1Q3pjRi92TURzN3NO?=
 =?utf-8?B?TzZWcE5CQUF3UDlLcVhSaExLNlR0dHVvWlgrYlNEMjFhYnNJM3FnUDJjcmtV?=
 =?utf-8?B?Y2dqMzl1b1VsNXplNkU0VmMvbEMxOHNrMHlZY2pkdk5heTFxS21QNUhKYVkv?=
 =?utf-8?B?ZWwrdjJLOG81ajlvMnF2eEhVQnNIaE9DK3VnUFFwS0RHTTRNNHpxdE5oczdT?=
 =?utf-8?B?UjJDUDlBejVLenVvYWtJZm1DSWlPNStoclM1emEzZGZLOTYvQU1tSEhCQ3Z2?=
 =?utf-8?B?M05wOHhlc3U3M3duK2pyelBBRzE2RFZwRVBWenl5aGd1WXF5VXFHTE9xUWpH?=
 =?utf-8?B?Tk80SUQ1SlBiVVU5VWJjSnlGWXB3cmFXTy9sYTJ2d3BwM0NUYUU4NktYTGg4?=
 =?utf-8?B?Mkx4UEw4UlVIUDk0YjhUbFJVOE5vek8xUXF6VFk1blVFWGxGTzNjVFhERDVy?=
 =?utf-8?B?SXEyQjd2YXVRbUJpYzNpRUZQZjhDdFBVbE5DVnNMdVhkNmF5TzlFTGFBeStU?=
 =?utf-8?B?OGNrS2M4dnZPQWQxbXpXRXNXQ0VCYmtEZzFuVnZWUEx0ZG5WNnVOOXhEb3lm?=
 =?utf-8?B?VFd0WWxWVGNQR1VEa2xoREQzNUhMeXMrOHpmRktGNS91TjZIb01pRzgzd3da?=
 =?utf-8?B?ejREMWMvRWo2VURpRkZnb2NBaEVCa2I4Yk9tcEZJSjNqM0ZYK2ErdWQwbktE?=
 =?utf-8?B?Z2Y2YVJPZFFWNjVOZ3RvL2MzYmlaR0ZORmZLWlJ2Z1AxUDJkL1hCbEg3alUw?=
 =?utf-8?B?L2s3TXNWYkVoVDhZeHVaRC85eisxWlVocG1WL0l5S2NBdHVWc0NuUkUwa3Q2?=
 =?utf-8?B?ZUsyTkVMWmJZbDhLQlZpdXlaSEh5OHNvZjQ5UzBYaHZteVBmV2F5bmVVWkVw?=
 =?utf-8?Q?Vlvi+/g5cLuU5p4iA7wccxlUzRq88PZCRS2qdBgd+yyq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197b6c04-8bbe-4d2d-e15e-08de16c383f9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:16:53.9507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOD2V3vFzNYQg03wxgk/R+1Xu0pr2WjNjSw/IPNh9dYKZucOWdYW9yLflS2HRq6TFAcL31F6JqcPDFCRT2fdVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438
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

Taking over this series while Alistair is on holidays.

This revision is mostly a polishing of v6, notably by removing the use
of `as` thanks to the newly-introduced `num` module [1]. It also
addresses some leftover feedback from v5.

I still need to do an extensive review of the top patches, but I think
the command queue basics should be looking close to what we want.
Caveat, they will evolve once we support interrupts.

One patch that needs particular attention is "rust: enable slice_flatten
feature and abstract it through an extension trait", as it abstracts the
slice flatten feature that has been stabilized in 1.80. I hope I
captured Miguel's proposal correctly.

A branch including this series and its dependencies is available at [2].

[1] https://lore.kernel.org/rust-for-linux/20251029-nova-as-v3-0-6a30c7333ad9@nvidia.com/T/#t
[2] https://github.com/Gnurou/linux/tree/b4/gsp_boot

Changes in v7:
- Remove `as` conversions by using the features of the `num` module.
- Add build-time conversion of constant integer values to smaller types.
- Thanks to the two items above, make more functions infallible.
- Remove unneeded `nr_ptes` member of the `Cmdq`.
- Use `repr(u32)` for `MsgFunction` to simplify it.
- Use `from_ref` instead of casting references into pointers with `as`.
- Add message header version type to remove use of magic number.
- Switch some parameters to `usize` to limit type conversions.
- Add comments for undocumented functions.
- Remove `function_number` method of `GspMsgElement` and return invalid
  function numbers as the error value of `function` instead.
- Work around the renaming of `slice::flatten` to
  `slice::as_flattened` in Rust 1.80 (thanks Miguel!).
- Fix clippy warning with Rust 1.78.
- Link to v6: https://lore.kernel.org/r/20251017054736.2984332-1-apopple@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (3):
      gpu: nova-core: compute layout of more framebuffer regions required for GSP
      gpu: nova-core: num: add functions to safely convert a const value to a smaller type
      rust: enable slice_flatten feature and abstract it through an extension trait

Alistair Popple (8):
      gpu: nova-core: Set correct DMA mask
      gpu: nova-core: Create initial Gsp
      gpu: nova-core: gsp: Create wpr metadata
      gpu: nova-core: Add zeroable trait to bindings
      gpu: nova-core: gsp: Add GSP command queue bindings and handling
      gpu: nova-core: gsp: Create rmargs
      gpu: nova-core: gsp: Add RM registry and sysinfo bindings and commands
      nova-core: gsp: Boot GSP

Joel Fernandes (3):
      gpu: nova-core: Add a slice-buffer (sbuffer) datastructure
      nova-core: falcon: Add support to check if RISC-V is active
      nova-core: falcon: Add support to write firmware version

 drivers/gpu/nova-core/driver.rs                   |  16 +
 drivers/gpu/nova-core/falcon.rs                   |  15 +
 drivers/gpu/nova-core/fb.rs                       |  68 ++-
 drivers/gpu/nova-core/firmware/gsp.rs             |   7 +-
 drivers/gpu/nova-core/firmware/riscv.rs           |  11 +-
 drivers/gpu/nova-core/gpu.rs                      |   2 +-
 drivers/gpu/nova-core/gsp.rs                      | 142 ++++-
 drivers/gpu/nova-core/gsp/boot.rs                 |  80 ++-
 drivers/gpu/nova-core/gsp/cmdq.rs                 | 522 ++++++++++++++++
 drivers/gpu/nova-core/gsp/commands.rs             | 117 ++++
 drivers/gpu/nova-core/gsp/fw.rs                   | 599 +++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw/commands.rs          | 100 +++
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |   2 +-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 703 ++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs                |   1 +
 drivers/gpu/nova-core/num.rs                      |  49 ++
 drivers/gpu/nova-core/regs.rs                     |  17 +-
 drivers/gpu/nova-core/sbuffer.rs                  | 222 +++++++
 init/Kconfig                                      |   3 +
 rust/kernel/lib.rs                                |   4 +
 rust/kernel/slice.rs                              |  63 ++
 scripts/Makefile.build                            |   3 +-
 22 files changed, 2715 insertions(+), 31 deletions(-)
---
base-commit: ed136b2f7e5c159324b27d1e761bad753d2a711e
change-id: 20251027-gsp_boot-c6bb048a304e

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

