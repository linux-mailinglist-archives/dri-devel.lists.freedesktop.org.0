Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D02C4B42C37
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 23:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8131B10E94A;
	Wed,  3 Sep 2025 21:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="q4bZ72Ng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1299B10E946;
 Wed,  3 Sep 2025 21:54:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtIqaTHX25DJZZdfvpW3Re5lwDZ4aqOtBibYGjnPEn+mlLltfftJwvHrXp5oa3RC29od1VKUu4o85GUcXzmyG36tZitWZmVe+wAvjEEDk+uIVMbEo4weCThVp0ih/9JHmIW8BGVTlIdvAS+G0Y+/mYyLgXxQaJQQcuaYmiMuiJGheRmKiIdfo/tixWHIu8aJenYdwuYrgCnkYVlPCEm/aN+150qs5EaoVBBdBnoTwvkIQc/XQbPK3ISnPiR7UuetA30mYVRq/p2xOpHcNDVNz37xAmTfr4dT9YS3d5ze9yezJyAZJAwYyY1sqC6wHO/BbZe4eolSgFk4GDeTmQAauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujqsT1stkNblxBlqNSEykeWg5s/J18ac+XSE+h4VxWA=;
 b=Hq7PYbfnZliL542YiWfobul3tmhCv70aClhLzRkmBngLgyVTGABUI+8QrCIGh1gP6oSOXnxmeE/hoBYn82/RYZbDTibifgNeiUyKl0xiUEJ/fivx2iDG5EtTEsXUJtrA0lT8/GxXLG5YUzfnlD2wG0n4dDXB1tGxVI2yMOlQbrlnQiL8WjXjQU+JEmmk6MTwq0sv8NFlierRIu2PaaX16C1PVxc1VBpGBPBmlkzQzf60Zn9BkDT3s3xMQ/Ch/TkC6vbjyK0fmxR5XXzgDwv2FOrTHHf2Cta3WNvpFkHsFtCSzxxb6L069TcmCYoV5ZDpq6xyloDBWXYyIx3ISqlGVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujqsT1stkNblxBlqNSEykeWg5s/J18ac+XSE+h4VxWA=;
 b=q4bZ72NgsQlnxmv+K/q+Mg1rCY6iioHakKl4hmRiQviOmR1fTs//5EpZ/X07WHgQ/F3a3jE/wjlASIIVOTY33l+Y57WeihhFOuXdSSFQSZV7xdWhy5+lW367LoPCpsvAJhxT14xzUySsWsbNx97VEKEGEcmi3yei0c7ZKoG33IEbFHxxEAKLEgFFrvqe6RPkYFLpLAKUjSLSF5bfT2j0V+2Rc4wkkaljtq49ND7g7lGPrckjEo5JLZfqmA3qEd9r9jxOrAmHlSYBO21NpELZ+aq8ZS3x7raL4+/MFW8w0AlTv6CLtz6fV2SKsX5awBKkHxsApEsH8mf3lRDT2n+C9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS2PR12MB9589.namprd12.prod.outlook.com (2603:10b6:8:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 21:54:35 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9073.021; Wed, 3 Sep 2025
 21:54:35 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: [PATCH v2 1/4] nova-core: bitstruct: Move bitfield-specific code from
 register! into new macro
Date: Wed,  3 Sep 2025 17:54:25 -0400
Message-Id: <20250903215428.1296517-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903215428.1296517-1-joelagnelf@nvidia.com>
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR22CA0003.namprd22.prod.outlook.com
 (2603:10b6:208:238::8) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS2PR12MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: 31589b79-f828-4eb1-ebed-08ddeb347850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDUrd1UvM1JtL3hZb1ZPT1MrK1V5U09YK2xXdFd6VHk4TnkzdGRaOTVjMHJt?=
 =?utf-8?B?ZGZyVFlaYVZJOHQzSjhtelZKMElkclFpZWE2M2JQYlYrUUhqY3pxMDhlNUlD?=
 =?utf-8?B?WXRLTnZFWUtoQUlaTUZKZksvaTZNSjdXS0lSa3NacVo5dzQvR2RCVFpFZ0hx?=
 =?utf-8?B?RXVZVmo4OEd6cFpva1M5bStMaTErOTQ3U3FRUTFSQkRXMnNSN3l0UFNtVjY2?=
 =?utf-8?B?cmN4b3A5aEpuelBHdG0rcTY1VXJ1cFMwMnJiTHQwbG10eHg5b2FXWm54Lzlj?=
 =?utf-8?B?R3owblgveVlyK1RnQW9IQUk0ZTlGSzhKOGZaczNmQ2VNSUxIVXhiWVFHREsy?=
 =?utf-8?B?WDVoTkIxTDI5ejgzNHdtZWp6QmNmMGR6Z1NiT0RTVUZJY0treDR3Z0lNWFVF?=
 =?utf-8?B?VjBCdXhDYlJZVGR4ZjlHenphaWo1RkdpcXlVZWlIbFlIMUNPQ0FuQSt5QTBL?=
 =?utf-8?B?VTBLUzlTbXJqbWJkWGtlWktNYUNtYVdFOXk3WUN6REVXbGIvVUJoNEtZR29L?=
 =?utf-8?B?VndtcFRLNzN2c0Zua0FmRTFKOWMyYlRCc1lZTHRGMmhXM2liSTZEQnBPRTRK?=
 =?utf-8?B?eWo0OERXaXR2NlFqTmtpRC91N1hpVmVIbURkemZVb3ZZVmxqL1dIdjB1dU1J?=
 =?utf-8?B?NHlpVU1RdjJlbnIrRjhkdC9aeCtTZEd6ZlV3TVZpQlZJTmJjZzNJT1E2QWp3?=
 =?utf-8?B?N0VFdUlySnFtcUd6aGNyWVFyOUhWcjZGSjVoejNWQ3V0UHdLaC96RFB0Rm1y?=
 =?utf-8?B?aG1HYzZHTWhiUTFtYVBNeHI4eVBLNmJWa042ZXJVYW5vaGh1STZZZ0cxVytR?=
 =?utf-8?B?cHliTUVHQWthbXdCM0JveVpUR0MzTVlzVjV3KytjWXFJSVlwS1l4MFI1bzJ0?=
 =?utf-8?B?REFkbnI2UDRzWXN2L05Wek1MRlBOK25UU3oxRUkvajR2czJWWktaT1JUaFlU?=
 =?utf-8?B?SnJ6REMycG5Jc1ZIN2IxbFdzeHk2TGxzQ1daUHNKRXZ6YjdFcS96bmlISHRZ?=
 =?utf-8?B?bGJ4cHRTOG9KaGNnWk9GemhJbEx6QnpkUEdqSEczUWp5UmpyaG41WkErdFU3?=
 =?utf-8?B?bDFHZnhodU5kQmx5VVVmZzlnTmpMbDRwUkpXdG1aV3B6clpnbE1JZjY0VGV3?=
 =?utf-8?B?U08zRldjU1QwU0hyZnJoU1d6SWVhUi9YblBIUWJpYno5SmFjRjRuQW84SGZY?=
 =?utf-8?B?VEwxVVpCR2tPUHpvaEFjNEZyT0JtRjFDdE9POWZ0MnNaTUxNU3NCZXVRM25j?=
 =?utf-8?B?eVEvejNBNS91aWM1Qzc4b0tmOEJWQlNmdlRsWkt6ZE5HeG1GZzlybk9mbFFa?=
 =?utf-8?B?ZnJUTjhCUk9VWjZoZDlVMDF1dVlTdklzSFhHTXhwS3duam1ET1BSR09yVXJj?=
 =?utf-8?B?YUxMRjVHRUg3S0NpTWJJbDdqeGpkcFRYWm1BRWFrZmtKcG50QWcvS0tPenhL?=
 =?utf-8?B?Z3R0MFk0QkhzMjhnTjhPcE1JaldGRkpFRzd2TDlYKzRMdXlMK3FSdnBGaHhp?=
 =?utf-8?B?R1ZmY21ob3dKc2Vzak9aR3d4bGVNV0NQVnpNQUZzSmtVUXlsS0M1MitaRGhR?=
 =?utf-8?B?clVDUDBYSTE0bElTR0pJdm5VbnRaTmVlQTlOTW5OSkZ5Wnc0RlRtVjl1K1N1?=
 =?utf-8?B?Z0wrakNkQ1hjZnJzRElGbkI3L0F4T2NhYXRNdjU2dVBCWGp2ZklEK2ZMWkw5?=
 =?utf-8?B?VzhkOTBtVmx4dXY0Zk8yMVpTZ1dxVlgzMk93UWNXc204QmtzRUJrUThMdG0y?=
 =?utf-8?B?OXdYWnkxK3pMU3VDWVVxK1dvM21jLzZQd2V6T3JJcjIvOXpTZjF1aytWZVE2?=
 =?utf-8?B?dzJvRTVDUnhZSFVtTzNQMVE5K2hnUXpPWnM1bDluS0JoR2s1NHZEV0JETmNr?=
 =?utf-8?B?M1c1NzUyWEpkQW13bWVhSGNSbWJGUGFxMzM2ZjZ3MVp1a0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGJaNjl2WTU3cmJ0TUlMWjRlUkFSZzhBV1BKTGx0YUs0S01xdkZ4V3VqWS8z?=
 =?utf-8?B?TWNPU2hHZ2xaT2xPclB4N29WMHk1QWs0M3BpdlM3NGl0NlBMZ3BxVW9Nd1FR?=
 =?utf-8?B?Ykg1enFNeUhPdVMvNWducm44cTRBZjh3WGM2VzFTTUlGL09pWjcwUjlyRnhq?=
 =?utf-8?B?S0MrOTJKcDU4V21FZVRRRGJrNjJFWHQ1S2o0Ly80V3VUeHlSTEFLN1ZKNVU0?=
 =?utf-8?B?K0dnNmYxdy9DTDE1SCtVWW1xWHNOS0docmVhdW16Z2kzbko1NHF2TGVwWGpO?=
 =?utf-8?B?ZEZyazZCcGI0cjIvaUlzUUh2U09JWTlZQThxUlI5aXNEWWVCWmZMaVgzVjdl?=
 =?utf-8?B?eUVrYmwwRCtJaEJENEduSHg1YnVSU0JWbi9XY1NQSEprMlpLT2tHUnhld0hN?=
 =?utf-8?B?NUtxL1dkZEFqVDBaM1Z2Vnd2Z041Wm80a3ZYdEZtWG4xcDhxTTFoS0VVb254?=
 =?utf-8?B?a0I0YU5uVlMwb0xERmFpZFFWSHpsVHNLQWppNnNqU1JWM0djd2VFOG1PTmtH?=
 =?utf-8?B?d0JSK1VONG5oaWlLbFZpUWFRRS9sVVl4K2ZERUtTbFNrU0ZGOWVuUzdReGRP?=
 =?utf-8?B?SU5SRCs5aUU2OVA0SkFUMnZrMUV0YWpoeXJXSEsvV3U2bWgzRnVkZDRYK1pw?=
 =?utf-8?B?eUU2dmViUFp3VTlSclNqb0NwSFlMazRjck8wcU1CWHcybjdWQ3ZqdzdiQ1Nu?=
 =?utf-8?B?QVBvTy85YjBsNHcrYnFreCtlS2NuOXlsSWVTZmppZ2NYU29IaXZtMTM1VHhv?=
 =?utf-8?B?YWNJWCtCQ0lwcm9nd2hEUTBjWDE5c3FjMld2Z2xrVmdYR3dPMWx0dUNIa0J6?=
 =?utf-8?B?Y0lKdTlkbzc5ZThWaTFZTWFrUUFIRHZISFlWZGxZS3d2UnFSd2xnWDVsUm4x?=
 =?utf-8?B?OXlTaC8yd2tqK0lSUHdiZWlWZnBXeFRVTU9Ra2daZDREREJsRUFYQWs4V0NZ?=
 =?utf-8?B?ZmhoVFp5S2RWTFhiaTlWQkY3aUUrdG5maXhDMEw0aW16aWFXaUFlK0w2MlRt?=
 =?utf-8?B?aHROYWhzLzhDQThjeS9tbWVLc1RtRmJjWjQ0QSt0WHY2WlI0Z3A2V0ZaakEr?=
 =?utf-8?B?YzNvRXNhYjludGZnbU5FYndxck5qVmptWmVNbmVQdHhaQXJlcU5PRDNnTFpY?=
 =?utf-8?B?dWRMakg1K09MZW53NitxNVJJZmh1OW9md3dJNTZFT2dLZFRYMjcrK08vMlZz?=
 =?utf-8?B?QWJFVytZZm9OWTh0R0EwakJBVzFYUVJ2WlY3TzFGSHBjdTIyekhTMENuQjJ2?=
 =?utf-8?B?UWc1UTJEZml4R3E0TWhuUGczckdYeWtnNks2MWJTekZrR24yWXYrMW91cW50?=
 =?utf-8?B?NEMrZThKdkI1bC8zY2Y5RVNtNzgzWk1UL0lTMzNid01acmNmbmdsR3V2R1k3?=
 =?utf-8?B?akoxNlI0algraXlrS3ZzUHQxV01MVWxWZDd0WjljUkJza05YZHlDYUE4citS?=
 =?utf-8?B?R3MyVnk5ODNJSFdOSjBFOVNVVFZpdkxKK3dRa1l5c3o2bmJHZ1B3NFkwNVdI?=
 =?utf-8?B?M1FyemRQWURWUU9acWM2RjFlRExUOHpHNVcrUS9uOUpUWmk0QS9ZcWJxNG9Z?=
 =?utf-8?B?a0FQbm02MjdUL1huYnJsQ0NqQnpsS1FxdXg3UWh5aEVYZEZ3L1FGckJwL01o?=
 =?utf-8?B?cnBsaU9COXJjMmVPZ0VGYU1rM0MwY2EzYlNVS3pEYVdBeWpRa2krVlRib3V5?=
 =?utf-8?B?MTlkdGJtV0tPK1NjVzFJcThJOW82V3Q3b0x3Z1hEU1hXRTZyUmREQ2NJZTJp?=
 =?utf-8?B?NWNiVDFmT2hkYWF5NFFKZTVGNGVhVi9ONFlxaGJ3N0JKam91NnJrbDFKTmFQ?=
 =?utf-8?B?T2FXaWRWVjF6b1A0TDBVa3FJakZjck1BaTY1UDlqd1JBRktRclhVS1c5Snlz?=
 =?utf-8?B?WHl5bzQyODE0dDdtY2lnMzVobURoc0dsSm01OVE4TnprM3c3YjhxdWY3TWow?=
 =?utf-8?B?N2VHWHVJU1BwQ25mUzhUQ3ZBWjJlMFIzSDJVR2s0bTF3aGZQcGJoT1p1ZjFQ?=
 =?utf-8?B?VXVWSi9TRG5QUWNOaFcyOTFiL0pkdHpIc1VKQzQ1ZmpOT0RXMENHQmRpN2Nq?=
 =?utf-8?B?Tjk1dXNCWHNnMHQ4VVA2ZzNpUkpOT1ZaUDJEU3hLaE5Sa0JlckpXbXo3OWJH?=
 =?utf-8?Q?bdTUGIpjd6eZHY83RJp9w0EL6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31589b79-f828-4eb1-ebed-08ddeb347850
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 21:54:34.7392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TC7aEDvVmysKMuyRcRq5CedaW5vXQ0LwOjUe9VOX6zWqSsNDmGSYHRoOGQDnl9T+kWhdn0RaE2prwx7OY9E3Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9589
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

The bitfield-specific into new macro. This will be used to define
structs with bitfields, similar to C language.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitstruct.rs   | 271 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs   |   3 +
 drivers/gpu/nova-core/regs/macros.rs | 247 +-----------------------
 3 files changed, 282 insertions(+), 239 deletions(-)
 create mode 100644 drivers/gpu/nova-core/bitstruct.rs

diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/bitstruct.rs
new file mode 100644
index 000000000000..1dd9edab7d07
--- /dev/null
+++ b/drivers/gpu/nova-core/bitstruct.rs
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// bitstruct.rs — Bitfield library for Rust structures
+//
+// A library that provides support for defining bit fields in Rust
+// structures. Also used from things that need bitfields like register macro.
+///
+/// # Syntax
+///
+/// ```rust
+/// bitstruct! {
+///     struct ControlReg {
+///         3:0       mode        as u8 ?=> Mode;
+///         7:4       state       as u8 => State;
+///     }
+/// }
+/// ```
+///
+/// This generates a struct with:
+/// - Field accessors: `mode()`, `state()`, etc.
+/// - Field setters: `set_mode()`, `set_state()`, etc. (supports builder pattern).
+/// - Debug and Default implementations
+///
+/// The field setters can be used with the builder pattern, example:
+/// ControlReg::default().set_mode(mode).set_state(state);
+///
+/// Fields are defined as follows:
+///
+/// - `as <type>` simply returns the field value casted to <type>, typically `u32`, `u16`, `u8` or
+///   `bool`. Note that `bool` fields must have a range of 1 bit.
+/// - `as <type> => <into_type>` calls `<into_type>`'s `From::<<type>>` implementation and returns
+///   the result.
+/// - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s `TryFrom::<<type>>` implementation
+///   and returns the result. This is useful with fields for which not all values are valid.
+macro_rules! bitstruct {
+    // Main entry point - defines the bitfield struct with fields
+    (struct $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
+        bitstruct!(@core $name $(, $comment)? { $($fields)* });
+    };
+
+    // All rules below are helpers.
+
+    // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
+    // `Default`, `BitOr`, and conversion to the value type) and field accessor methods.
+    (@core $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
+        $(
+        #[doc=$comment]
+        )?
+        #[repr(transparent)]
+        #[derive(Clone, Copy)]
+        pub(crate) struct $name(u32);
+
+        impl ::core::ops::BitOr for $name {
+            type Output = Self;
+
+            fn bitor(self, rhs: Self) -> Self::Output {
+                Self(self.0 | rhs.0)
+            }
+        }
+
+        impl ::core::convert::From<$name> for u32 {
+            fn from(val: $name) -> u32 {
+                val.0
+            }
+        }
+
+        bitstruct!(@fields_dispatcher $name { $($fields)* });
+    };
+
+    // Captures the fields and passes them to all the implementers that require field information.
+    //
+    // Used to simplify the matching rules for implementers, so they don't need to match the entire
+    // complex fields rule even though they only make use of part of it.
+    (@fields_dispatcher $name:ident {
+        $($hi:tt:$lo:tt $field:ident as $type:tt
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+            $(, $comment:literal)?
+        ;
+        )*
+    }
+    ) => {
+        bitstruct!(@field_accessors $name {
+            $(
+                $hi:$lo $field as $type
+                $(?=> $try_into_type)?
+                $(=> $into_type)?
+                $(, $comment)?
+            ;
+            )*
+        });
+        bitstruct!(@debug $name { $($field;)* });
+        bitstruct!(@default $name { $($field;)* });
+    };
+
+    // Defines all the field getter/setter methods for `$name`.
+    (
+        @field_accessors $name:ident {
+        $($hi:tt:$lo:tt $field:ident as $type:tt
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+            $(, $comment:literal)?
+        ;
+        )*
+        }
+    ) => {
+        $(
+            bitstruct!(@check_field_bounds $hi:$lo $field as $type);
+        )*
+
+        #[allow(dead_code)]
+        impl $name {
+            $(
+            bitstruct!(@field_accessor $name $hi:$lo $field as $type
+                $(?=> $try_into_type)?
+                $(=> $into_type)?
+                $(, $comment)?
+                ;
+            );
+            )*
+        }
+    };
+
+    // Boolean fields must have `$hi == $lo`.
+    (@check_field_bounds $hi:tt:$lo:tt $field:ident as bool) => {
+        #[allow(clippy::eq_op)]
+        const _: () = {
+            ::kernel::build_assert!(
+                $hi == $lo,
+                concat!("boolean field `", stringify!($field), "` covers more than one bit")
+            );
+        };
+    };
+
+    // Non-boolean fields must have `$hi >= $lo`.
+    (@check_field_bounds $hi:tt:$lo:tt $field:ident as $type:tt) => {
+        #[allow(clippy::eq_op)]
+        const _: () = {
+            ::kernel::build_assert!(
+                $hi >= $lo,
+                concat!("field `", stringify!($field), "`'s MSB is smaller than its LSB")
+            );
+        };
+    };
+
+    // Catches fields defined as `bool` and convert them into a boolean value.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
+            $(, $comment:literal)?;
+    ) => {
+        bitstruct!(
+            @leaf_accessor $name $hi:$lo $field
+            { |f| <$into_type>::from(if f != 0 { true } else { false }) }
+            $into_type => $into_type $(, $comment)?;
+        );
+    };
+
+    // Shortcut for fields defined as `bool` without the `=>` syntax.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
+    ) => {
+        bitstruct!(@field_accessor $name $hi:$lo $field as bool => bool $(, $comment)?;);
+    };
+
+    // Catches the `?=>` syntax for non-boolean fields.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
+            $(, $comment:literal)?;
+    ) => {
+        bitstruct!(@leaf_accessor $name $hi:$lo $field
+            { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
+            ::core::result::Result<
+                $try_into_type,
+                <$try_into_type as ::core::convert::TryFrom<$type>>::Error
+            >
+            $(, $comment)?;);
+    };
+
+    // Catches the `=>` syntax for non-boolean fields.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
+            $(, $comment:literal)?;
+    ) => {
+        bitstruct!(@leaf_accessor $name $hi:$lo $field
+            { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
+    };
+
+    // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt
+            $(, $comment:literal)?;
+    ) => {
+        bitstruct!(@field_accessor $name $hi:$lo $field as $type => $type $(, $comment)?;);
+    };
+
+    // Generates the accessor methods for a single field.
+    (
+        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
+            { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
+    ) => {
+        ::kernel::macros::paste!(
+        const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
+        const [<$field:upper _MASK>]: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
+        const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
+        );
+
+        $(
+        #[doc="Returns the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        pub(crate) fn $field(self) -> $res_type {
+            ::kernel::macros::paste!(
+            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
+            );
+            let field = ((self.0 & MASK) >> SHIFT);
+
+            $process(field)
+        }
+
+        ::kernel::macros::paste!(
+        $(
+        #[doc="Sets the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
+            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
+            let value = (u32::from(value) << SHIFT) & MASK;
+            self.0 = (self.0 & !MASK) | value;
+
+            self
+        }
+        );
+    };
+
+    // Generates the `Debug` implementation for `$name`.
+    (@debug $name:ident { $($field:ident;)* }) => {
+        impl ::core::fmt::Debug for $name {
+            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+                f.debug_struct(stringify!($name))
+                    .field("<raw>", &format_args!("{:#x}", &self.0))
+                $(
+                    .field(stringify!($field), &self.$field())
+                )*
+                    .finish()
+            }
+        }
+    };
+
+    // Generates the `Default` implementation for `$name`.
+    (@default $name:ident { $($field:ident;)* }) => {
+        /// Returns a value for the bitstruct where all fields are set to their default value.
+        impl ::core::default::Default for $name {
+            fn default() -> Self {
+                #[allow(unused_mut)]
+                let mut value = Self(Default::default());
+
+                ::kernel::macros::paste!(
+                $(
+                value.[<set_ $field>](Default::default());
+                )*
+                );
+
+                value
+            }
+        }
+    };
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index cb2bbb30cba1..b218a2d42573 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,6 +2,9 @@
 
 //! Nova Core GPU Driver
 
+#[macro_use]
+mod bitstruct;
+
 mod dma;
 mod driver;
 mod falcon;
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 754c14ee7f40..3fb6852dff04 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -284,25 +284,25 @@ pub(crate) trait RegisterBase<T> {
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $offset);
     };
 
     // Creates an alias register of fixed offset register `alias` with its own fields.
     ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address provider.
     ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $offset ]);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
     ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET ]);
     };
 
@@ -313,7 +313,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_array $name @ $offset [ $size ; $stride ]);
     };
 
@@ -334,7 +334,7 @@ macro_rules! register {
             $(, $comment:literal)? { $($fields:tt)* }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
     };
 
@@ -356,7 +356,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!($idx < $alias::SIZE);
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
     };
 
@@ -365,241 +365,10 @@ macro_rules! register {
     // to avoid it being interpreted in place of the relative register array alias rule.
     ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
         static_assert!($idx < $alias::SIZE);
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
     };
 
-    // All rules below are helpers.
-
-    // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
-    // `Default`, `BitOr`, and conversion to the value type) and field accessor methods.
-    (@core $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
-        $(
-        #[doc=$comment]
-        )?
-        #[repr(transparent)]
-        #[derive(Clone, Copy)]
-        pub(crate) struct $name(u32);
-
-        impl ::core::ops::BitOr for $name {
-            type Output = Self;
-
-            fn bitor(self, rhs: Self) -> Self::Output {
-                Self(self.0 | rhs.0)
-            }
-        }
-
-        impl ::core::convert::From<$name> for u32 {
-            fn from(reg: $name) -> u32 {
-                reg.0
-            }
-        }
-
-        register!(@fields_dispatcher $name { $($fields)* });
-    };
-
-    // Captures the fields and passes them to all the implementers that require field information.
-    //
-    // Used to simplify the matching rules for implementers, so they don't need to match the entire
-    // complex fields rule even though they only make use of part of it.
-    (@fields_dispatcher $name:ident {
-        $($hi:tt:$lo:tt $field:ident as $type:tt
-            $(?=> $try_into_type:ty)?
-            $(=> $into_type:ty)?
-            $(, $comment:literal)?
-        ;
-        )*
-    }
-    ) => {
-        register!(@field_accessors $name {
-            $(
-                $hi:$lo $field as $type
-                $(?=> $try_into_type)?
-                $(=> $into_type)?
-                $(, $comment)?
-            ;
-            )*
-        });
-        register!(@debug $name { $($field;)* });
-        register!(@default $name { $($field;)* });
-    };
-
-    // Defines all the field getter/methods methods for `$name`.
-    (
-        @field_accessors $name:ident {
-        $($hi:tt:$lo:tt $field:ident as $type:tt
-            $(?=> $try_into_type:ty)?
-            $(=> $into_type:ty)?
-            $(, $comment:literal)?
-        ;
-        )*
-        }
-    ) => {
-        $(
-            register!(@check_field_bounds $hi:$lo $field as $type);
-        )*
-
-        #[allow(dead_code)]
-        impl $name {
-            $(
-            register!(@field_accessor $name $hi:$lo $field as $type
-                $(?=> $try_into_type)?
-                $(=> $into_type)?
-                $(, $comment)?
-                ;
-            );
-            )*
-        }
-    };
-
-    // Boolean fields must have `$hi == $lo`.
-    (@check_field_bounds $hi:tt:$lo:tt $field:ident as bool) => {
-        #[allow(clippy::eq_op)]
-        const _: () = {
-            ::kernel::build_assert!(
-                $hi == $lo,
-                concat!("boolean field `", stringify!($field), "` covers more than one bit")
-            );
-        };
-    };
-
-    // Non-boolean fields must have `$hi >= $lo`.
-    (@check_field_bounds $hi:tt:$lo:tt $field:ident as $type:tt) => {
-        #[allow(clippy::eq_op)]
-        const _: () = {
-            ::kernel::build_assert!(
-                $hi >= $lo,
-                concat!("field `", stringify!($field), "`'s MSB is smaller than its LSB")
-            );
-        };
-    };
-
-    // Catches fields defined as `bool` and convert them into a boolean value.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
-            $(, $comment:literal)?;
-    ) => {
-        register!(
-            @leaf_accessor $name $hi:$lo $field
-            { |f| <$into_type>::from(if f != 0 { true } else { false }) }
-            $into_type => $into_type $(, $comment)?;
-        );
-    };
-
-    // Shortcut for fields defined as `bool` without the `=>` syntax.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
-    ) => {
-        register!(@field_accessor $name $hi:$lo $field as bool => bool $(, $comment)?;);
-    };
-
-    // Catches the `?=>` syntax for non-boolean fields.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
-            $(, $comment:literal)?;
-    ) => {
-        register!(@leaf_accessor $name $hi:$lo $field
-            { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
-            ::core::result::Result<
-                $try_into_type,
-                <$try_into_type as ::core::convert::TryFrom<$type>>::Error
-            >
-            $(, $comment)?;);
-    };
-
-    // Catches the `=>` syntax for non-boolean fields.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
-            $(, $comment:literal)?;
-    ) => {
-        register!(@leaf_accessor $name $hi:$lo $field
-            { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
-    };
-
-    // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt
-            $(, $comment:literal)?;
-    ) => {
-        register!(@field_accessor $name $hi:$lo $field as $type => $type $(, $comment)?;);
-    };
-
-    // Generates the accessor methods for a single field.
-    (
-        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
-            { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
-    ) => {
-        ::kernel::macros::paste!(
-        const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
-        const [<$field:upper _MASK>]: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
-        const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
-        );
-
-        $(
-        #[doc="Returns the value of this field:"]
-        #[doc=$comment]
-        )?
-        #[inline(always)]
-        pub(crate) fn $field(self) -> $res_type {
-            ::kernel::macros::paste!(
-            const MASK: u32 = $name::[<$field:upper _MASK>];
-            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
-            );
-            let field = ((self.0 & MASK) >> SHIFT);
-
-            $process(field)
-        }
-
-        ::kernel::macros::paste!(
-        $(
-        #[doc="Sets the value of this field:"]
-        #[doc=$comment]
-        )?
-        #[inline(always)]
-        pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
-            const MASK: u32 = $name::[<$field:upper _MASK>];
-            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
-            let value = (u32::from(value) << SHIFT) & MASK;
-            self.0 = (self.0 & !MASK) | value;
-
-            self
-        }
-        );
-    };
-
-    // Generates the `Debug` implementation for `$name`.
-    (@debug $name:ident { $($field:ident;)* }) => {
-        impl ::core::fmt::Debug for $name {
-            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
-                f.debug_struct(stringify!($name))
-                    .field("<raw>", &format_args!("{:#x}", &self.0))
-                $(
-                    .field(stringify!($field), &self.$field())
-                )*
-                    .finish()
-            }
-        }
-    };
-
-    // Generates the `Default` implementation for `$name`.
-    (@default $name:ident { $($field:ident;)* }) => {
-        /// Returns a value for the register where all fields are set to their default value.
-        impl ::core::default::Default for $name {
-            fn default() -> Self {
-                #[allow(unused_mut)]
-                let mut value = Self(Default::default());
-
-                ::kernel::macros::paste!(
-                $(
-                value.[<set_ $field>](Default::default());
-                )*
-                );
-
-                value
-            }
-        }
-    };
-
     // Generates the IO accessors for a fixed offset register.
     (@io_fixed $name:ident @ $offset:expr) => {
         #[allow(dead_code)]
-- 
2.34.1

