Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6B6A98E23
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 16:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1134110E6C8;
	Wed, 23 Apr 2025 14:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LY1hdON/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2086.outbound.protection.outlook.com [40.107.100.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8849B10E6C6;
 Wed, 23 Apr 2025 14:52:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L99TWSGyRMB5urs+zHFnz4VZHJmABxPGohg+jt4Arw59uCwZTcWpP/0AypDb6wUcx7TB4CU7ZIlIzuLo/J69oZHyTuPyNS8x6b1+AN3yJwQTMcyFjU9KMgAA3mCb8y2AQ6kLUVfw018bvYlFADLEI2TwViLW+L10/ehPvdmr06xG4ILy+X8bRDrPxEutgyrHju7xIvHc1Jn5JQ5iqrvnAEh3c9w3G5O6RVLMR4kIpzosx9B18dXY6V5n76q4yDl2r65sOFHuS22WbuggosK6ylVFDgWqC0+If/WiYcf9U5KBGdyn9LZMjDUvw0zNFbhXqU6q/ozdaF0IwyLmgwsUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmwQgkIJAzWGiNOOc0XQUWD0i0GAyawlLTVWDHSsHzM=;
 b=yfHaGX47H4JmIIr1eTLtGa2kFVjBAH/PD20Rl3/58CDS6gMZOMuLys4Gm2eAASWlevkODqk76x7b5/FhFr1+LiR9EOeNT4UB5k67XCSLgmmBs3jvALGqGiF6EG7iungnYgsd3I0ihBqe1b5pk3/Dg6JJ593A1rZKluWH4El86y8ZM/oKYR93tc7BuOYSNYmFVYiIzlFhZRYcOTRzC/3hHXXbCOFtEQZDH+TfDaR5MpM3zTGdjnpUO1WJN6hFrih/0vOi7gMRABJR2sb6FC94UUueki/VoSiOgRSyjOHgQlj8o2dHYfd7UHoRsxGjUtuSLGEpOi0PbsEGBjAlaNsPiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmwQgkIJAzWGiNOOc0XQUWD0i0GAyawlLTVWDHSsHzM=;
 b=LY1hdON/xWHgnT+sDXKm0+WpD8O8tIjifCdGS5ZNSsclN+w0qt6TkRGOpUjwurh1SV/uVIyd/D/HNuZ8hEuACaCfWMmKfcMXW4NTF4ptdomgRoum+OHhAKZLQseJRG5ZsZj+iuKmyKBQ55erN+1atmlYNh5sM3pzRVmzLyWR2kwYJJa07fBd3m1Y2xQ/YmYze5ogHG7sIMFXvVFnjwmDDHp5vffeMRVk0S2KfMVDTdyFw1Euiau9VCq5fZhCnPUfAih7z6kXMCUEKLzs1GLkGFjY+uzp4N4wQ452/ElGYG5kI49e4goNs4e4fF+N2aZ35I1QRGnkK0/v8xIr1nccOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ1PR12MB6290.namprd12.prod.outlook.com (2603:10b6:a03:457::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 14:52:47 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 14:52:47 +0000
Message-ID: <88937e2b-6950-4c9d-8f02-50f9b12c7376@nvidia.com>
Date: Wed, 23 Apr 2025 10:52:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/16] gpu: nova-core: Add support for VBIOS ucode
 extraction for boot
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-13-ecd1cca23963@nvidia.com> <aAjz2CYTsAhidiEU@pollux>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aAjz2CYTsAhidiEU@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::18) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ1PR12MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: f3413d0a-860c-498b-a7ae-08dd8276830d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVpnNzVQMlVEUE1FaHU4VGxBVUZOcER4TFdiZTNiM3FuMm9jbkR4SmNEMTVp?=
 =?utf-8?B?bnkzU0xiMlhKdDlteFd5SEhYMTZWbmlpOVlIQlFqR2FKNlZjYTJWNllMSUdC?=
 =?utf-8?B?bE53NHlUdlJodlBwcmJCeGRzU3EzQ21GK05sS2NNU3pwUEdYQ1JHMjJ2MUh5?=
 =?utf-8?B?ZEkzY2UzOUZiUjJ3WGQxQklUVk9KaG54di9qYTVrbkFaTDZqcjJDWkNmTmsr?=
 =?utf-8?B?Uld3YVhHdlpMZ2xrU0dYa0phMGg1ckdTOFlwUzJ4bDgxem5tMXYrNDc1OW4y?=
 =?utf-8?B?RUZmb2RZQ0Y3ODlrVTdSTHRwc0ZtQjVsUHVsdnJaMXZETzZEN1BybnJwc0NT?=
 =?utf-8?B?eUROWDJLNVgvRzRKL1Zkclkvb2NFamR5ZFhiMW9abDBWUXArN3FCUGpVUTlj?=
 =?utf-8?B?aU90Ylp0MG0wZGVNKzd0WFMwd2YwTHNYaFYrRDNVbFJUMk5ZbnE5bnlHVHlS?=
 =?utf-8?B?d3Z4OFJOZmVQS2ZoRmhqcEg1Q2RtaHluOEk5L3JGbVBRNS9EMnM2R1p3OEtH?=
 =?utf-8?B?UkM4Q25GNjRBQkxlb2R2M1NHcEowZk5JTEVIQkpJMWczWjhUUmpmQlNrd0VH?=
 =?utf-8?B?NjNzOXdUdWxueXJVQk5uV2tsVmNMK2lxd2hWL3hmbU5jT3I5TXFud1pHQ0RX?=
 =?utf-8?B?V1g0Z0NJQ3NSNUZFNldLd1ZrM2ltSWxmd0NQU3M0bEZUOFlFbldyaWt6UG9B?=
 =?utf-8?B?eHcvaWI5WGhwRFhBbTNxNXFHbVlJNFMxTEdaT2U5SlJLS2F0QzVkTkY1NkpK?=
 =?utf-8?B?TlBhdS9qcUpPRWJnL0JFL0RVcktYUTU2YmNOZTQrbkYwL1F4N1l1T0h6dHh3?=
 =?utf-8?B?OFB3cTkyeGp3cGY1Q241ZldGcVgyT0VneU0ydjNVSFpadGhzT0xPRDJHQUdt?=
 =?utf-8?B?Y3RBVDdhMkNjQ0VFVWZYYmdNMEpMSmJJTG9hbTVVc1VhSTJpdklFNmtLNG5z?=
 =?utf-8?B?bDgzejZya0JFQ2pYMnp6Q1hBUjJuS2d4b0NMYUp3aEpmczNoUWFWRElydFFM?=
 =?utf-8?B?V2xGbVR1OFBPRFRxZnpYWGROc1ptUGppQ251VmF4SGllRitWZzJ2MDhseXQ1?=
 =?utf-8?B?TmpHZEJpQ0hMenBNTnFXRVRHMFN0T2lselJ4OEIyOWJTQktub2tKMEdBekYw?=
 =?utf-8?B?a2JPU2hpZzNORkdVSStMQW9aUGVKY3ZvSnRpNS9JakJZbnJWbnlZOW96WXdC?=
 =?utf-8?B?NTVvaTJvQVpjWkM4WHcxdndBZEpiT2FvNFZ0ci9LbE5hK3VBMDBpK0hJdUJX?=
 =?utf-8?B?cHRtellFOUNjOTd2ZVhxK2t1cGYyYjcyZmN0VERtNXVLNENkbXEzVEFKMlR5?=
 =?utf-8?B?UFNHelhPS2RTaFBDMk1tYnlnY3BHT0NQOWMwVUNLL2xIY0R5ODRrTS9oRTJq?=
 =?utf-8?B?WW0wZW0vV2VuZGZxWlVBYTQ3U3dYZVZSa3ZnbE90ZXNITWRGU0Z6R1dzdjJB?=
 =?utf-8?B?cHQvU2ZPZzFSODc1Z21YTGRFZzVwaHJqY0VuZHFRRzJEUktSOEpxQnd3Y0Mz?=
 =?utf-8?B?WDFTZTFMWEp0dmt2dStSNjFpYlpUQjh4WWhuL05UNGgwQmY4UzRQQmd4dXRL?=
 =?utf-8?B?SmNoNWxtT2ZQTDVLRkNxYzNmeWVSVXRkWm5MK0VIYTVvb0VGNzJ6ZXpvbllq?=
 =?utf-8?B?Nm1vUEFvRDM0QmNqaTV5VnV6UE80a0t5d1ljMTVwRUIyVWlQc0ZQbDZEUnRE?=
 =?utf-8?B?Q0ZnVlZpdHZLSFZWV3VhTjB2Z0pUbUwrSHVlMXpKV0xnNlFhYUJ5b2FUbEFW?=
 =?utf-8?B?VmZXeGF6akxINXZNdURIcFlwTW9LZWpNMUlwbzhPeTRDV2ZrU1oycTRpdkVj?=
 =?utf-8?B?dGlEQkhHSWFWQ2lMcmdNK0p0dGZCWlN6WWV3VmVzRStTaE1GYUxxaWs2dE05?=
 =?utf-8?B?NWFUZFJJQnFUYmVOT3dZT0VUQ1JNd1pTNVptd0Fmd2F6ZnErMk1pcmpRYXox?=
 =?utf-8?Q?CSsnn6P4xnY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1hocE1oTDM3Qk1KWFN6bmY1RHZINk1DNXhvR2srZktMNW1aV3d0VlZ1bVJP?=
 =?utf-8?B?QkZIQnhpQktGS0U2TitCemM5RHErQnFpMkI2RlQ4aVlzWGZCNC9kTVMwOWIx?=
 =?utf-8?B?a0pyQksvVk9oMzVHNmNTMWdVYkZNdUF1cTNINEpKeGlsN0FpM0UyQWxRaEh4?=
 =?utf-8?B?dEhhZjc5N2Y5NCtwTEJySGYwd2xQU09EVFp3U1o5WHllcEFYbmVGMC9ueXN2?=
 =?utf-8?B?L3BodU5MdXRlZVpaeXpUNmZSS0hWMFlqS0lDLyttVE1rS2JhZGJ0elpWMGRT?=
 =?utf-8?B?eHhFc2w0VE9YUWEwVCsyQXYvZzFwQ0RlZFJnck9QS3R6OVJjNnBNT0FUTEN4?=
 =?utf-8?B?M2RyZUtRT2JXZGdpVEZvaytKRllqQ0xIRXg0cWVkcTk4YVMxQWdrQ3p1WXJY?=
 =?utf-8?B?UTU3LzFrUlJXTjFVNTdPanBXZ3Q1WkkvUHpGYXNpWnI4aVJ2UnpBNVI0VEhK?=
 =?utf-8?B?ZmhVOHRVZkRTaFpRYkJlTG1OVWtLK09zbEJiODNEYnR6NmpOQWF1QVFXQytW?=
 =?utf-8?B?SnhYL2J1MEdVQnFuam1oV29MRVJKTzFmWG1vYUNBOHB5MGVsUlpFMnNhVFpq?=
 =?utf-8?B?MDhUTnZHYTlrdDhHRllzWGxHa2lZV09WbCtoYkFpT1JQRlF1VVlKZS9tbTNr?=
 =?utf-8?B?TkxEZjVlVmgrVkZNUDJLdWl5WkcwcmxGNUpiWUJjVjBiQTljeU15d2x4UzM1?=
 =?utf-8?B?NHM1Ym5ZeVlENkRtRVQvZDlGNUhHUUtRWDI4K05ibzJKdFJpdFBJUXJSN3d4?=
 =?utf-8?B?cm92dGJpU0hvMURpcktidzZabTFNSVV4b3kwY0liUjNOdXA4YVIvQXJQZTgz?=
 =?utf-8?B?VmQzL2pBVSt3L05xb0ZCRjB1V1FWM2ZIZmwvTVh0QWxrQm12TWZuWkd1QTBq?=
 =?utf-8?B?U2VhUlh6MnU4UkhFQ0RYOGtDc3FpRHkwMEdQOUJBZFJHRE5tYUVpVkpzaXor?=
 =?utf-8?B?clRiR2N6SlYrbjBhUnQyNHBtbVBkSjJFaDVuYnpSajVWVi94N1ZwZ3pwS1Zy?=
 =?utf-8?B?aGU5empuYktFZndyTkN6a3NIT2dxRDU3Q29BdXBmWFJ5dDNnVzMvSC9Fd3ln?=
 =?utf-8?B?bDY4UkJTVi9nSGw4NGY3ZEVIVUFIdTJDNE54UGV2N3U3UThCelorakJLYS9x?=
 =?utf-8?B?bUlMdUc2RDFCRDZTUHpsLzNncTRzS21rYXFCZ1R3ZUFhd2dtSHdGS2ltYWdK?=
 =?utf-8?B?NUNPaDNxakd0TDdTWWk2NDVxd1RDbHVtdXlDSFFib0JFTEhzaHhUclZhRXR3?=
 =?utf-8?B?MURqNVIyUHNwbk1WNW9pV1l2NzM2S0tIcXFQY3dIemZEQ1JhQTJNb0psTnk0?=
 =?utf-8?B?aU5UT3dIamZGMXI0SERMcFlQNXhkM0pTclBKcEZiWlk0WWhtVXRwcElKL2FL?=
 =?utf-8?B?MGtDOTkwOTFvWTIrWU95eWNKN2NDZlhHR0w3ODJCT281a3djQWh2bG5BQnNI?=
 =?utf-8?B?NXJtYkhFcHRtMFQ0cldjWTdENjc2ZWxxQUJwUnVEbk91NzcvTjU0ZEloN2pE?=
 =?utf-8?B?MHM2bDcrQ0Y5SWtoK0Z1QTlEdDZyNlg2dFIwc1FWdGhoYjlMMFR2OHZqbnBP?=
 =?utf-8?B?RFRoaFJpR09PU1JYbGpHRklrK2FZVFBxakJxVnZEOXY2SVpoWng5R3BnTG9T?=
 =?utf-8?B?bWs1eTEyM2VpUTdtWEVMNit5clBoYVY0c1pPMzZxRURTUExhdmZZY1JZZE43?=
 =?utf-8?B?YlJUQmdIdmYwVUFDUUlGdXV2T1Z6MndvZEFRS1hEbmtJTHFUTmVJUlp6ZjZi?=
 =?utf-8?B?d25tNDlpSzBGdm5aUFc0ZE9ISDZiSXI0aDF6bXEvK0RqWEVvTTJtSSs2U1d4?=
 =?utf-8?B?Tzk1eFVnSUNmME96ZUdYOHRZK2JEQXdsUGxBbjFMNXBCQ3pyK2JNbXJUMzI1?=
 =?utf-8?B?K2txSnZFZVpGVWk1ZHVkK1k1VHR6Sm1xbjJzenJRZkJwUUVDMlF2WElFaGRR?=
 =?utf-8?B?OGRrMmJNZG01eTg3K0FuUThjcU9VcXpjdzVDY3dQaFFFdXVNMndUQm12RGdO?=
 =?utf-8?B?ZDUzVzZrUHJYMWpQeHM0cW4vaGhhTy80Q0JTb2tpR1VvK3RnbjZpQlN0TUMw?=
 =?utf-8?B?dEpJQVkwMzFUUkR2VHUwczBtRUNyLzhmbldRUUdLV0Z3YTdTblpwVkdNZFRi?=
 =?utf-8?B?MzNMREtOQ3FoTE9vUStIRTdkMUNQYmV5Znd6c2VLU1d6elpJKzVBb0YzaXJR?=
 =?utf-8?B?b1E9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3413d0a-860c-498b-a7ae-08dd8276830d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 14:52:47.6326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oGWGNPdZjwqs4EB0JqhqshXCyow0xRpfOqfD6At00/FkyxIj+zwcBSK5+5eEK2HlQkV/lRjtaRF8r1bhU+phA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6290
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

Hello, Danilo,
Thanks for all the feedback. Due to the volume of feedback, I will respond
incrementally in multiple emails so we can discuss as we go - hope that's Ok but
let me know if that is annoying.

On 4/23/2025 10:06 AM, Danilo Krummrich wrote:
> On Sun, Apr 20, 2025 at 09:19:45PM +0900, Alexandre Courbot wrote:
>> From: Joel Fernandes <joelagnelf@nvidia.com>
>>
>> Add support for navigating and setting up vBIOS ucode data required for
[...]
>> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..534107b708cab0eb8d0accf7daa5718edf030358
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/vbios.rs
>> @@ -0,0 +1,1103 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +// To be removed when all code is used.
>> +#![allow(dead_code)]
> 
> Please not, use 'expect' and and only where needed. If it would be too much,
> it's probably a good indicator that we want to reduce the size of the patch for
> now.
> 

Sure, I will switch to expect. The addition of a bit of dead code is intentional
as we want to keep unused bits for future extension and lesser reader ambiguity.

Note that I've already been conservative with not adding too much more code than
we need (otherwise this patch could have been 2X the size), however VBIOS is a
complicated thing and I think we want to keep a little more than we need for
future extension for GPU families and proper documentation.

>> +
>> +//! VBIOS extraction and parsing.
>> +
>> +use crate::driver::Bar0;
>> +use crate::firmware::FalconUCodeDescV3;
>> +use core::convert::TryFrom;
>> +use kernel::devres::Devres;
>> +use kernel::error::Result;
>> +use kernel::prelude::*;
>> +
>> +/// The offset of the VBIOS ROM in the BAR0 space.
>> +const ROM_OFFSET: usize = 0x300000;
>> +/// The maximum length of the VBIOS ROM to scan into.
>> +const BIOS_MAX_SCAN_LEN: usize = 0x100000;
>> +/// The size to read ahead when parsing initial BIOS image headers.
>> +const BIOS_READ_AHEAD_SIZE: usize = 1024;
>> +
>> +// PMU lookup table entry types. Used to locate PMU table entries
>> +// in the Fwsec image, corresponding to falcon ucodes.
>> +#[allow(dead_code)]
>> +const FALCON_UCODE_ENTRY_APPID_FIRMWARE_SEC_LIC: u8 = 0x05;
>> +#[allow(dead_code)]
>> +const FALCON_UCODE_ENTRY_APPID_FWSEC_DBG: u8 = 0x45;
>> +const FALCON_UCODE_ENTRY_APPID_FWSEC_PROD: u8 = 0x85;
>> +
>> +pub(crate) struct Vbios {
>> +    pub fwsec_image: Option<FwSecBiosImage>,
>> +}
>> +
>> +impl Vbios {
>> +    /// Read bytes from the ROM at the current end of the data vector
>> +    fn read_more(bar0: &Devres<Bar0>, data: &mut KVec<u8>, len: usize) -> Result {
>> +        let current_len = data.len();
>> +        let start = ROM_OFFSET + current_len;
>> +
>> +        // Ensure length is a multiple of 4 for 32-bit reads
>> +        if len % core::mem::size_of::<u32>() != 0 {
>> +            pr_err!("VBIOS read length {} is not a multiple of 4\n", len);
> 
> Please don't use any of the pr_*() print macros within a driver, use the dev_*()
> ones instead.

Ok I'll switch to this. One slight complication is I've to retrieve the 'dev'
from the Bar0 and pass that along, but that should be doable.

> 
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // Allocate and zero-initialize the required memory
> 
> That's obvious from the code, if you feel this needs a comment, better explain
> what we need it for, why zero-initialize, etc.

Sure, actually the extends_with() is a performance optimization as we want to do
only a single allocation and then fill in the allocated data. It has nothing to
do with 0-initializing per-se. I will adjust the comment, but:

This code...

>> +        data.extend_with(len, 0, GFP_KERNEL)?;
>> +        with_bar!(?bar0, |bar0_ref| {
>> +            let dst = &mut data[current_len..current_len + len];
>> +            for (idx, chunk) in dst
>> +                .chunks_exact_mut(core::mem::size_of::<u32>())
>> +                .enumerate()
>> +            {
>> +                let addr = start + (idx * core::mem::size_of::<u32>());
>> +                // Convert the u32 to a 4 byte array. We use the .to_ne_bytes()
>> +                // method out of convenience to convert the 32-bit integer as it
>> +                // is in memory into a byte array without any endianness
>> +                // conversion or byte-swapping.
>> +                chunk.copy_from_slice(&bar0_ref.try_read32(addr)?.to_ne_bytes());
>> +            }
>> +            Ok(())
>> +        })?;
>> +
>> +        Ok(())
>> +    }
..actually initially was:

+        with_bar!(self.bar0, |bar0| {
+            // Get current length
+            let current_len = self.data.len();
+
+            // Read ROM data bytes push directly to vector
+            for i in 0..bytes as usize {
+                // Read byte from the VBIOS ROM and push it to the data vector
+                let rom_addr = ROM_OFFSET + current_len + i;
+                let byte = bar0.try_readb(rom_addr)?;
+                self.data.push(byte, GFP_KERNEL)?;

Where this bit could result in a lot of allocation.

There was an unsafe() way of not having to do this but we settled with
extends_with().

Thoughts?

Thanks.



