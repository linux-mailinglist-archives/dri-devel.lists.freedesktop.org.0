Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620D8AD730C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5EE10E883;
	Thu, 12 Jun 2025 14:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pEf76g12";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2052.outbound.protection.outlook.com [40.107.100.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079C210E85F;
 Thu, 12 Jun 2025 14:03:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izaymgSzvXmUA5/ix67BIFBp4Q7SlxDzTUtTxXZMxUOLVAPG8rrKkjFWoMJ1Js61HOYaNyBDq4gueohTCcXu6xod7v0GlqxiYNoTVU/NRClSSolu9a31xCIfWSoBHE1sZDZ+w2wq/6jvNEsFgpxI/qtCD/2/4/nBZDV5Q7JmVU6NxNtzgzE0SlG8EduB+e4uFUdEbcfKwkmzI1t/4lV7axy43ORn4VXEJAupTqF8bD/fQ+KfSZ4M6yuTUQfv4t4STz9onO8HvFhY33nym6sk1HxCkoBYrTPKjseX8PF++I/ph8Kjh8lSZiPATyV7wOeiqUYjlcJbwakXe+n3k/TpSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YpYXMMqz8fi/uMno15VAPmMeO4S9zJLDQO3P8fArps=;
 b=ZY8WGWMT0DeTGEF5Q7CpbsHJuz16TmKwwDvUY9OjKX+AS7VFauTY9f2m+ICTuY3xSY5pSk/O2Q4UPn42O84hPbRVZuuMMkCkEkWS5iVvU6xCDNh+PVcCgVXL/JsBWVZrBGLaSYXMcbDK6oTHkh6mgoWdnCTwsWVKmZjc1IPHZ+W+rPpGcVzCxLgbbNu8lenmCyz2ECqAu3EUxOfp/aVDD26Wah7h2HrJq6KC65yXtbo4mWfcQHA2e+eNNs/AkZk6bxYgeg1UaA0X1It1GBeP37urezn2yhl3jEet1yKYjVIYn9FlpzNv3XqPmJGGpG+qJDxfZvPFeo54+xnNOWHH4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YpYXMMqz8fi/uMno15VAPmMeO4S9zJLDQO3P8fArps=;
 b=pEf76g128edhd/StyPTHl6Cf6xpOd4wPPtSfgbQP55UYn3+T1FieDv8TCFEmkfqOdJwdynWEXECPAsTDtJw4cekTvSeNqmqEkbGbejjlW79MNNqnnxukRJyMDuJP9VrMcKo996sflhDLh4hhShEcUl1YYPstqFU8HiH/8tYUHGvO77kOtGmMD6Z7QIFm9OoozP6CsfhTXUv3ht6Va9S+T4vC4y7pwCBcjOb2iXC24wa64k6K2UeFoQnLeM8tMGJjhsAIZHG3LnIQjJ/L+jxeIrQGQjCfUBpk1jrQYCEGgkJDgi+/ACihfHXjGIVG+bhnTdXzLEyTonU4Gre7yPirCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8598.namprd12.prod.outlook.com (2603:10b6:806:253::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Thu, 12 Jun
 2025 14:03:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:03:20 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:43 +0900
Subject: [PATCH v5 15/23] gpu: nova-core: add falcon register definitions
 and base code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-15-14ba7eaf166b@nvidia.com>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0318.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: 509c196d-dd5d-494e-868b-08dda9b9e36f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0d5WG1WbnFxdVVab0FnSVI2RGRIWk5pOGxUdEVqSmV1ZlZPaDRyTmkwNnQ0?=
 =?utf-8?B?RGpxdTRQYTlSNVhNVEIraFdVenhzV2tvQ0pGU1YrRTRlZXFqMjljek8zaXZl?=
 =?utf-8?B?VmVGczN0TUV5SzBZM3hXNVlRWjVtN3I5akNENndWSHV1QllIQndRZWxzaFNj?=
 =?utf-8?B?bVN4UitHOENjMWR4UGJzd0Q3NmxjYXlHeDJxdDkyNVBneStuL0tSWVpEL29W?=
 =?utf-8?B?VFVkTjJaNGs1OS9MOWYwKy94NDhGL0RCa0l3VXFMajJTblNHSFB5dW9NVlRI?=
 =?utf-8?B?VVV0ZHdUeHc2MTduYWhLSEdSbTVBaXVuV0tHZy9OQlY2Q0lXSUZHdkdhN2tj?=
 =?utf-8?B?bU13U2ttSDIxNmVxSVg5N0pKeG1MRkFacmpCaFU5eXJJd1N6WFR0TGFDMWU4?=
 =?utf-8?B?c24xZUJWTWx5UXdOUG0vQ3dPRHMrNGcvUkZ1OTY1QkJJYkNDeG5BbHpSZy95?=
 =?utf-8?B?ekdJVEw1TDdocWNPOGxTckhDOEszMXlXbWVMN0JGQVNKdXBwWEkvZXhEN2R3?=
 =?utf-8?B?L3NMV3VKT1lhMExvM1JRNnhyaGpLQTdVaGRFNHpueFNHZElsZmgxNjF5Y0Qr?=
 =?utf-8?B?RUcrYWtrdVBDWmJZTDAzN0J0emNoOGhiRmJBSkZKVDVjbWtCbmw1b2cvNVdm?=
 =?utf-8?B?MXBJWTd0ZmdJTzhESU9kQS9lcThjemtsVXRTYnVjWkFCeU80RXhMWTJ5ZThv?=
 =?utf-8?B?Q2cwcjJzMkhWMUJCcmhvVG5Td3lPV1dQNG93VXJOT0FuMlM5YUlMb2IzcEMy?=
 =?utf-8?B?aFluZU54MWhOSERza3RIODBGN0UyNmFOWFdWekV6M043ZzY4TVord09LTzdz?=
 =?utf-8?B?M04vWXM4UXRqVnA4aHFncURvclFoZHZ2ajlEWlpDTDlzTVd5SjdwVGdwQ211?=
 =?utf-8?B?SGJHdmFrckl5MHJqN0w2UFhjZyt1ZUZBZEsxaHdja2liY1BnTWRsbTQ2RFZF?=
 =?utf-8?B?ZGZ3aHJPZFA3U2IzUGtsV1lSRTY3UklEbFNGZGVobUdGNE5XRDZ1R2NZWTVB?=
 =?utf-8?B?UG90MGtvazJ0akJkWmxueGFQMis1VUE5YXhReWN6MWI1V3pxWkdzWWozUUpQ?=
 =?utf-8?B?VnZKaGViUEhpT252bXNUSWtvWHpvZFNCK3RlL1VSeU52NlhMcGVxdndub3Fi?=
 =?utf-8?B?UU84Ym9tc3NTeGsveVllZUxBNnZxS3h5L2UvVzhieVRSN2NJVTAweUlOWkd2?=
 =?utf-8?B?amZxU2IrT3VUcE1DUCtCVHdiaSs5bVFYUjFMUktjWFJUYzJiUmZwQlFYajB6?=
 =?utf-8?B?WmNDT0YwNG52bXZERmhDRHFNa0lZTUZKYTZXMkl0THpreGRVTHpLLzY4MnRN?=
 =?utf-8?B?RUc1MnJHb2ovbE14SU0xWEVpZC90Mkc5VlZaR3BsNFhSZDM2VlNsTmUyRlE5?=
 =?utf-8?B?R0JFRTJpeFoyTDl6MGJUSDh4Z2Vpek83T2luODNBc3pEaWpqMEY4ZEo2ZFUy?=
 =?utf-8?B?L1lTcFhSNndYZjM3SGJzVGQ4Mk5DcUd2bjFnZ1lSZDd0cktGVVBtb21JR21C?=
 =?utf-8?B?eGpYdUFjblIwbi80RjdDUHAzYndRTkxaYXc5UVhiTTczWWFCYi9TZlBvSGxS?=
 =?utf-8?B?MjdnN0tUWWhsTTZCNVJ5eVZXbnhKNWhoWkF5NURlOU5QTXB6MkUvdFR0V2E2?=
 =?utf-8?B?ejV0bGd5b1pJZUgyZ1dhMWZHRUNBMFp6QzNtaWRMZmZRL1I1MUxYakkzY1JB?=
 =?utf-8?B?N3pXZEJmNGozclUrcHg3TDFLenVrQ2ZRaWZGSlVPR1ZtV2RkZWVRbXUzVDAv?=
 =?utf-8?B?UlE0dWtVeWxpM3JYT1ljVURveEQvYVFKMDRZbk1WN3oxbUZSU21mei85SjBK?=
 =?utf-8?B?eGtnVDdxK2RWaDhQaGtxZmRoYW1PWDBURmYzViszc3FYTGJiVGVwaGxHdXc1?=
 =?utf-8?B?Qlh4SDhOTzFUb3dUVU44dFo1Z21wTEtFMkRaNlpvMU9mbTBVdGNweWM3Vndw?=
 =?utf-8?B?eUFsNFFjRDhJK3ZUclE0TkVSNlRxUDRlUTlIRkZtZHQ2ejNScnB5VVNLVjQr?=
 =?utf-8?B?SXhOSUNtRnh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmY1SjVlODdLeDdiTjNXcFhKQTlLbWpiREVRdVNRbHRJTWlYcjQ2amdHOVlM?=
 =?utf-8?B?dFVtTU9OeEQzRmNBL1hHMTF5TUZIZ2JZQTZjZmpjUEordFZZUHBHUUUzM2tG?=
 =?utf-8?B?TzlxbzZEbk43UTl1ZE12ZlM4SXo0bUt0YU9YTDZmQitFMUQ1YlFyNVBuMHQy?=
 =?utf-8?B?UnkvOW9qcWZiblZ2cFYvK3VkVVUrNXI0N1o5STVxaGNCbURoN3IvSmxWYTlF?=
 =?utf-8?B?bS9YZFBOVERFUS9iRjhVeGNUaTRybGdhbWZocXhEOCt5dTU1dGtBSE5pRHdG?=
 =?utf-8?B?b2ZoenIvbngrNE5Nb3NhTGNJSWp2Mzc0Q3hZYTUxNWNXVjBpbHJaazVUM3dz?=
 =?utf-8?B?SWNnZ0hPNFBmOGFHaCtvcnBzZUhmOEFsa0s4SlByeUJ5K2REd2FpZWViYVAz?=
 =?utf-8?B?b280bENsMWkzUTV6U21nT0phMTFJOVYvbktuTXEzcGl5QWQvaU9EeGFNSk55?=
 =?utf-8?B?RERpaERMTnVkZkp5RXpCRDNBSUdrQmZNTHdtdnZLdHpsV1daVWRSS2FkNkNq?=
 =?utf-8?B?TWduNmpBanpqYnFua081ektOOWpOUUc3Vm1Sa21yaU9pMGxYaTl6VGdydmJD?=
 =?utf-8?B?VWNDaVJrMzhOY3QwWDNUVnBwQTdqenMxRTlOdUJEUWdSZkY5L3U3SlY5cnBl?=
 =?utf-8?B?RENEVGZ4Q01PUjV3WTJGaGNkQlZjWitldTFCcTJkZWRzNldCek1kQnhEeEFw?=
 =?utf-8?B?aUpUcEFTZFp1Ni9uRkdrdE9ZM2tmZmdJWkNjYVVZb1NzaHhIWHB6N1ZTdWp0?=
 =?utf-8?B?TENYWndzQ2lOYTJJV2FSVU9uKzRmQ0gyVmVHbW0wbjlydGJ5L3l6eXljMGVx?=
 =?utf-8?B?anpMSGE4cldLL2toRFFXSUJvYUpYTFdmV0kvWEZBWjVLVTU2UkhPQ2NMV3c5?=
 =?utf-8?B?RVVvdTJpV3N4MCtlUDRWZnVwZFExSlFqWFpIRUxvbDVGS2taLythaUhWUjdR?=
 =?utf-8?B?REd1ekkyN0w4VE5qT083ZzdicThybkhDdjgxLzZUOCt0TzFwOTBIZUt0czhH?=
 =?utf-8?B?S2xLQXdwQVo5enY3dXR5cW9yZW9hUW9sQXF4ZzZ0SUJ0UmZWWFpRN0N2cThF?=
 =?utf-8?B?aW13Zyt2S2crN1JTY3l2YVplT1VPYUw2MzZteXArNkZ2MnIxNGJVSUJ2d0Rq?=
 =?utf-8?B?RnpLUHRQVWE1YTdmWGE1SlFSTFZrVGk4clpLTDRSOWFDR3I5Z1FBaGQ5RHpq?=
 =?utf-8?B?NFpiayt1RStSTmh5SzIyMEtZMFVlcWhubDVyWW1kQWxxVTNReElkN1BHclJh?=
 =?utf-8?B?TldieUlRYlZHbFpaT1lJejJCWVFrNVZNanNXLytFQ1ZrdVptajlDRXBHTStj?=
 =?utf-8?B?VjdpMWlHYW5hUE5QOGFqUktJTzkwaDl4V1pSOFc1YjdCRmpkb2dENjBDR3NV?=
 =?utf-8?B?aGFuQkRXbmxzZzVaeGtLZXFkWGpWRTJSamRBanAzREdFOUtFbE1IVm80Y2kw?=
 =?utf-8?B?b2V2WTBmb21HQndxd0hEa0ZPaENodExtSjA2M3d2RlpITm1wMmJONk8vZXRT?=
 =?utf-8?B?TEZwbEtqYy9HYzZmeW1zVVZtT2EwNmNBNGJQUU5yMW9NVlUvWWdFUjRydVVC?=
 =?utf-8?B?c2d3OEtQQVpLR05YWHllZmtucU1zcXhOSXhybU4zK2xqVGhmQXpXeEkxL3Ba?=
 =?utf-8?B?Y3BuQVdicW1laUg4VVlnczFrN0NjMmRDWE1qZXU0NHUycTBiYnYyUnd6K0E0?=
 =?utf-8?B?eERIeVZmdkM5bzZ3Ky9wMmhDU0pKRllmeStsa1VzT3lPMHYxQVB1MGxrZmdO?=
 =?utf-8?B?TDR3YithZlo1eGRWUlhnUWt1bVhqcWE3T3RvOFRmam9vZ1JFRHRMajVRcDlp?=
 =?utf-8?B?cFd6Q2IrQVJQdGx6Nm8xdHZ5ZnczRVVPUjV2a1dHQU5PRlgrWVNkc1dJWHJJ?=
 =?utf-8?B?WDVMMGRXQ0lQTTNGdm1UdVl1QXg2aENSRy93Zk8rbC9DV3JWUTNXeVg2L3pD?=
 =?utf-8?B?N2s0eFpYSHhVbjNMaklDRWhyTjZWTkpVNDgzUllQVmJhNjY3TFhUWUxvVVZI?=
 =?utf-8?B?UEFjTnRvcFRrZ0VjNEVrdVoyUjJkWmhrU2w3TzRjcGE2TVNFeU0ydmJKSStu?=
 =?utf-8?B?b29XZHJlS24yZjNQcGFwTTNNS1JmL2tleEFNM1NJdnVaZWxsZmNHVEJFL3Vu?=
 =?utf-8?B?a0syMmM4S1RTdUpHVVpNTWZWNUN5MG54cjJmU24yOXVxOG14SElJOHVwUFBR?=
 =?utf-8?Q?sobPYQSRErIolZWOM/Xu2zbiYxKg+o0Ru5oqkfnWiCEY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 509c196d-dd5d-494e-868b-08dda9b9e36f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:03:20.9006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JTUSW39jME8oFuH77lFWkevVh9kaXjzjg0ws17OnCUgFU9XMsnY6oF85ASL5Cxc5gmj1zHqj1aylpcpg0Wshlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8598
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

Booting the GSP on Ampere requires an intricate dance between the GSP
and SEC2 falcons, where the GSP starts by running the FWSEC firmware to
create the WPR2 region , and then SEC2 loads the actual RISC-V firmware
into the GSP.

Add the common Falcon code and HAL for Ampere GPUs, and instantiate the
GSP and SEC2 Falcons that will be required to perform that dance and
boot the GSP.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 560 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/falcon/gsp.rs       |  24 ++
 drivers/gpu/nova-core/falcon/hal.rs       |  54 +++
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 117 +++++++
 drivers/gpu/nova-core/falcon/sec2.rs      |  10 +
 drivers/gpu/nova-core/gpu.rs              |  11 +
 drivers/gpu/nova-core/nova_core.rs        |   1 +
 drivers/gpu/nova-core/regs.rs             | 139 ++++++++
 8 files changed, 916 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
new file mode 100644
index 0000000000000000000000000000000000000000..25ed8ee30def3abcc43bcba965eb62f49d532604
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -0,0 +1,560 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Falcon microprocessor base support
+
+// To be removed when all code is used.
+#![expect(dead_code)]
+
+use core::ops::Deref;
+use core::time::Duration;
+use hal::FalconHal;
+use kernel::bindings;
+use kernel::device;
+use kernel::prelude::*;
+use kernel::types::ARef;
+
+use crate::dma::DmaObject;
+use crate::driver::Bar0;
+use crate::gpu::Chipset;
+use crate::regs;
+use crate::util;
+
+pub(crate) mod gsp;
+mod hal;
+pub(crate) mod sec2;
+
+/// Revision number of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
+/// register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+pub(crate) enum FalconCoreRev {
+    #[default]
+    Rev1 = 1,
+    Rev2 = 2,
+    Rev3 = 3,
+    Rev4 = 4,
+    Rev5 = 5,
+    Rev6 = 6,
+    Rev7 = 7,
+}
+
+impl TryFrom<u8> for FalconCoreRev {
+    type Error = Error;
+
+    fn try_from(value: u8) -> Result<Self> {
+        use FalconCoreRev::*;
+
+        let rev = match value {
+            1 => Rev1,
+            2 => Rev2,
+            3 => Rev3,
+            4 => Rev4,
+            5 => Rev5,
+            6 => Rev6,
+            7 => Rev7,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(rev)
+    }
+}
+
+/// Revision subversion number of a falcon core, used in the
+/// [`crate::regs::NV_PFALCON_FALCON_HWCFG1`] register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+pub(crate) enum FalconCoreRevSubversion {
+    #[default]
+    Subversion0 = 0,
+    Subversion1 = 1,
+    Subversion2 = 2,
+    Subversion3 = 3,
+}
+
+impl TryFrom<u8> for FalconCoreRevSubversion {
+    type Error = Error;
+
+    fn try_from(value: u8) -> Result<Self> {
+        use FalconCoreRevSubversion::*;
+
+        let sub_version = match value & 0b11 {
+            0 => Subversion0,
+            1 => Subversion1,
+            2 => Subversion2,
+            3 => Subversion3,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(sub_version)
+    }
+}
+
+/// Security model of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
+/// register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone)]
+pub(crate) enum FalconSecurityModel {
+    /// Non-Secure: runs unsigned code without privileges.
+    #[default]
+    None = 0,
+    /// Low-Secure: runs code with some privileges. Can only be entered from `Heavy` mode, which
+    /// will typically validate the LS code through some signature.
+    Light = 2,
+    /// High-Secure: runs signed code with full privileges. Signature is validated by boot ROM.
+    Heavy = 3,
+}
+
+impl TryFrom<u8> for FalconSecurityModel {
+    type Error = Error;
+
+    fn try_from(value: u8) -> Result<Self> {
+        use FalconSecurityModel::*;
+
+        let sec_model = match value {
+            0 => None,
+            2 => Light,
+            3 => Heavy,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(sec_model)
+    }
+}
+
+/// Signing algorithm for a given firmware, used in the [`crate::regs::NV_PFALCON2_FALCON_MOD_SEL`]
+/// register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
+pub(crate) enum FalconModSelAlgo {
+    /// RSA3K.
+    #[default]
+    Rsa3k = 1,
+}
+
+impl TryFrom<u8> for FalconModSelAlgo {
+    type Error = Error;
+
+    fn try_from(value: u8) -> Result<Self> {
+        match value {
+            1 => Ok(FalconModSelAlgo::Rsa3k),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+/// Valid values for the `size` field of the [`crate::regs::NV_PFALCON_FALCON_DMATRFCMD`] register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
+pub(crate) enum DmaTrfCmdSize {
+    /// 256 bytes transfer.
+    #[default]
+    Size256B = 0x6,
+}
+
+impl TryFrom<u8> for DmaTrfCmdSize {
+    type Error = Error;
+
+    fn try_from(value: u8) -> Result<Self> {
+        match value {
+            0x6 => Ok(Self::Size256B),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+/// Currently active core on a dual falcon/riscv (Peregrine) controller.
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+pub(crate) enum PeregrineCoreSelect {
+    /// Falcon core is active.
+    #[default]
+    Falcon = 0,
+    /// RISC-V core is active.
+    Riscv = 1,
+}
+
+impl From<bool> for PeregrineCoreSelect {
+    fn from(value: bool) -> Self {
+        match value {
+            false => PeregrineCoreSelect::Falcon,
+            true => PeregrineCoreSelect::Riscv,
+        }
+    }
+}
+
+/// Different types of memory present in a falcon core.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum FalconMem {
+    /// Instruction Memory.
+    Imem,
+    /// Data Memory.
+    Dmem,
+}
+
+/// Target/source of a DMA transfer to/from falcon memory.
+#[derive(Debug, Clone, Default)]
+pub(crate) enum FalconFbifTarget {
+    /// VRAM.
+    #[default]
+    LocalFb = 0,
+    /// Coherent system memory.
+    CoherentSysmem = 1,
+    /// Non-coherent system memory.
+    NoncoherentSysmem = 2,
+}
+
+impl TryFrom<u8> for FalconFbifTarget {
+    type Error = Error;
+
+    fn try_from(value: u8) -> Result<Self> {
+        let res = match value {
+            0 => Self::LocalFb,
+            1 => Self::CoherentSysmem,
+            2 => Self::NoncoherentSysmem,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(res)
+    }
+}
+
+/// Type of memory addresses to use.
+#[derive(Debug, Clone, Default)]
+pub(crate) enum FalconFbifMemType {
+    /// Virtual memory addresses.
+    #[default]
+    Virtual = 0,
+    /// Physical memory addresses.
+    Physical = 1,
+}
+
+/// Conversion from a single-bit register field.
+impl From<bool> for FalconFbifMemType {
+    fn from(value: bool) -> Self {
+        match value {
+            false => Self::Virtual,
+            true => Self::Physical,
+        }
+    }
+}
+
+/// Trait defining the parameters of a given Falcon instance.
+pub(crate) trait FalconEngine: Sync {
+    /// Base I/O address for the falcon, relative from which its registers are accessed.
+    const BASE: usize;
+}
+
+/// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM).
+#[derive(Debug)]
+pub(crate) struct FalconLoadTarget {
+    /// Offset from the start of the source object to copy from.
+    pub(crate) src_start: u32,
+    /// Offset from the start of the destination memory to copy into.
+    pub(crate) dst_start: u32,
+    /// Number of bytes to copy.
+    pub(crate) len: u32,
+}
+
+/// Parameters for the falcon boot ROM.
+#[derive(Debug)]
+pub(crate) struct FalconBromParams {
+    /// Offset in `DMEM`` of the firmware's signature.
+    pub(crate) pkc_data_offset: u32,
+    /// Mask of engines valid for this firmware.
+    pub(crate) engine_id_mask: u16,
+    /// ID of the ucode used to infer a fuse register to validate the signature.
+    pub(crate) ucode_id: u8,
+}
+
+/// Trait for providing load parameters of falcon firmwares.
+pub(crate) trait FalconLoadParams {
+    /// Returns the load parameters for `IMEM`.
+    fn imem_load_params(&self) -> FalconLoadTarget;
+
+    /// Returns the load parameters for `DMEM`.
+    fn dmem_load_params(&self) -> FalconLoadTarget;
+
+    /// Returns the parameters to write into the BROM registers.
+    fn brom_params(&self) -> FalconBromParams;
+
+    /// Returns the start address of the firmware.
+    fn boot_addr(&self) -> u32;
+}
+
+/// Trait for a falcon firmware.
+///
+/// A falcon firmware can be loaded on a given engine, and is presented in the form of a DMA
+/// object.
+pub(crate) trait FalconFirmware: FalconLoadParams + Deref<Target = DmaObject> {
+    /// Engine on which this firmware is to be loaded.
+    type Target: FalconEngine;
+}
+
+/// Contains the base parameters common to all Falcon instances.
+pub(crate) struct Falcon<E: FalconEngine> {
+    hal: KBox<dyn FalconHal<E>>,
+    dev: ARef<device::Device>,
+}
+
+impl<E: FalconEngine + 'static> Falcon<E> {
+    /// Create a new falcon instance.
+    ///
+    /// `need_riscv` is set to `true` if the caller expects the falcon to be a dual falcon/riscv
+    /// controller.
+    pub(crate) fn new(
+        dev: &device::Device,
+        chipset: Chipset,
+        bar: &Bar0,
+        need_riscv: bool,
+    ) -> Result<Self> {
+        let hwcfg1 = regs::NV_PFALCON_FALCON_HWCFG1::read(bar, E::BASE);
+        // Check that the revision and security model contain valid values.
+        let _ = hwcfg1.core_rev()?;
+        let _ = hwcfg1.security_model()?;
+
+        if need_riscv {
+            let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
+            if !hwcfg2.riscv() {
+                dev_err!(
+                    dev,
+                    "riscv support requested on a controller that does not support it\n"
+                );
+                return Err(EINVAL);
+            }
+        }
+
+        Ok(Self {
+            hal: hal::falcon_hal(chipset)?,
+            dev: dev.into(),
+        })
+    }
+
+    /// Wait for memory scrubbing to complete.
+    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
+        util::wait_on(Duration::from_millis(20), || {
+            let r = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
+            if r.mem_scrubbing() {
+                Some(())
+            } else {
+                None
+            }
+        })
+    }
+
+    /// Reset the falcon engine.
+    fn reset_eng(&self, bar: &Bar0) -> Result {
+        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
+
+        // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
+        // RESET_READY so a non-failing timeout is used.
+        let _ = util::wait_on(Duration::from_micros(150), || {
+            let r = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
+            if r.reset_ready() {
+                Some(())
+            } else {
+                None
+            }
+        });
+
+        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, E::BASE, |v| v.set_reset(true));
+
+        // TODO: replace with udelay() or equivalent once available.
+        let _: Result = util::wait_on(Duration::from_micros(10), || None);
+
+        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, E::BASE, |v| v.set_reset(false));
+
+        self.reset_wait_mem_scrubbing(bar)?;
+
+        Ok(())
+    }
+
+    /// Reset the controller, select the falcon core, and wait for memory scrubbing to complete.
+    pub(crate) fn reset(&self, bar: &Bar0) -> Result {
+        self.reset_eng(bar)?;
+        self.hal.select_core(self, bar)?;
+        self.reset_wait_mem_scrubbing(bar)?;
+
+        regs::NV_PFALCON_FALCON_RM::default()
+            .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
+            .write(bar, E::BASE);
+
+        Ok(())
+    }
+
+    /// Perform a DMA write according to `load_offsets` from `dma_handle` into the falcon's
+    /// `target_mem`.
+    ///
+    /// `sec` is set if the loaded firmware is expected to run in secure mode.
+    fn dma_wr(
+        &self,
+        bar: &Bar0,
+        dma_handle: bindings::dma_addr_t,
+        target_mem: FalconMem,
+        load_offsets: FalconLoadTarget,
+        sec: bool,
+    ) -> Result {
+        const DMA_LEN: u32 = 256;
+
+        // For IMEM, we want to use the start offset as a virtual address tag for each page, since
+        // code addresses in the firmware (and the boot vector) are virtual.
+        //
+        // For DMEM we can fold the start offset into the DMA handle.
+        let (src_start, dma_start) = match target_mem {
+            FalconMem::Imem => (load_offsets.src_start, dma_handle),
+            FalconMem::Dmem => (
+                0,
+                dma_handle + load_offsets.src_start as bindings::dma_addr_t,
+            ),
+        };
+        if dma_start % DMA_LEN as bindings::dma_addr_t > 0 {
+            dev_err!(
+                self.dev,
+                "DMA transfer start addresses must be a multiple of {}",
+                DMA_LEN
+            );
+            return Err(EINVAL);
+        }
+        if load_offsets.len % DMA_LEN > 0 {
+            dev_err!(
+                self.dev,
+                "DMA transfer length must be a multiple of {}",
+                DMA_LEN
+            );
+            return Err(EINVAL);
+        }
+
+        // Set up the base source DMA address.
+
+        regs::NV_PFALCON_FALCON_DMATRFBASE::default()
+            .set_base((dma_start >> 8) as u32)
+            .write(bar, E::BASE);
+        regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
+            .set_base((dma_start >> 40) as u16)
+            .write(bar, E::BASE);
+
+        let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
+            .set_size(DmaTrfCmdSize::Size256B)
+            .set_imem(target_mem == FalconMem::Imem)
+            .set_sec(if sec { 1 } else { 0 });
+
+        for pos in (0..load_offsets.len).step_by(DMA_LEN as usize) {
+            // Perform a transfer of size `DMA_LEN`.
+            regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
+                .set_offs(load_offsets.dst_start + pos)
+                .write(bar, E::BASE);
+            regs::NV_PFALCON_FALCON_DMATRFFBOFFS::default()
+                .set_offs(src_start + pos)
+                .write(bar, E::BASE);
+            cmd.write(bar, E::BASE);
+
+            // Wait for the transfer to complete.
+            util::wait_on(Duration::from_millis(2000), || {
+                let r = regs::NV_PFALCON_FALCON_DMATRFCMD::read(bar, E::BASE);
+                if r.idle() {
+                    Some(())
+                } else {
+                    None
+                }
+            })?;
+        }
+
+        Ok(())
+    }
+
+    /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
+    pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
+        let dma_handle = fw.dma_handle();
+
+        regs::NV_PFALCON_FBIF_CTL::alter(bar, E::BASE, |v| v.set_allow_phys_no_ctx(true));
+        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, E::BASE);
+        regs::NV_PFALCON_FBIF_TRANSCFG::alter(bar, E::BASE, |v| {
+            v.set_target(FalconFbifTarget::CoherentSysmem)
+                .set_mem_type(FalconFbifMemType::Physical)
+        });
+
+        self.dma_wr(
+            bar,
+            dma_handle,
+            FalconMem::Imem,
+            fw.imem_load_params(),
+            true,
+        )?;
+        self.dma_wr(
+            bar,
+            dma_handle,
+            FalconMem::Dmem,
+            fw.dmem_load_params(),
+            true,
+        )?;
+
+        self.hal.program_brom(self, bar, &fw.brom_params())?;
+
+        // Set `BootVec` to start of non-secure code.
+        regs::NV_PFALCON_FALCON_BOOTVEC::default()
+            .set_value(fw.boot_addr())
+            .write(bar, E::BASE);
+
+        Ok(())
+    }
+
+    /// Start running the loaded firmware.
+    ///
+    /// `mbox0` and `mbox1` are optional parameters to write into the `MBOX0` and `MBOX1` registers
+    /// prior to running.
+    ///
+    /// Returns `MBOX0` and `MBOX1` after the firmware has stopped running.
+    pub(crate) fn boot(
+        &self,
+        bar: &Bar0,
+        mbox0: Option<u32>,
+        mbox1: Option<u32>,
+    ) -> Result<(u32, u32)> {
+        if let Some(mbox0) = mbox0 {
+            regs::NV_PFALCON_FALCON_MAILBOX0::default()
+                .set_value(mbox0)
+                .write(bar, E::BASE);
+        }
+
+        if let Some(mbox1) = mbox1 {
+            regs::NV_PFALCON_FALCON_MAILBOX1::default()
+                .set_value(mbox1)
+                .write(bar, E::BASE);
+        }
+
+        match regs::NV_PFALCON_FALCON_CPUCTL::read(bar, E::BASE).alias_en() {
+            true => regs::NV_PFALCON_FALCON_CPUCTL_ALIAS::default()
+                .set_startcpu(true)
+                .write(bar, E::BASE),
+            false => regs::NV_PFALCON_FALCON_CPUCTL::default()
+                .set_startcpu(true)
+                .write(bar, E::BASE),
+        }
+
+        util::wait_on(Duration::from_secs(2), || {
+            let r = regs::NV_PFALCON_FALCON_CPUCTL::read(bar, E::BASE);
+            if r.halted() {
+                Some(())
+            } else {
+                None
+            }
+        })?;
+
+        let (mbox0, mbox1) = (
+            regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, E::BASE).value(),
+            regs::NV_PFALCON_FALCON_MAILBOX1::read(bar, E::BASE).value(),
+        );
+
+        Ok((mbox0, mbox1))
+    }
+
+    /// Returns the fused version of the signature to use in order to run a HS firmware on this
+    /// falcon instance. `engine_id_mask` and `ucode_id` are obtained from the firmware header.
+    pub(crate) fn signature_reg_fuse_version(
+        &self,
+        bar: &Bar0,
+        engine_id_mask: u16,
+        ucode_id: u8,
+    ) -> Result<u32> {
+        self.hal
+            .signature_reg_fuse_version(self, bar, engine_id_mask, ucode_id)
+    }
+}
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..d622e9a64470932af0b48032be5a1d4b518bf4a7
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::{
+    driver::Bar0,
+    falcon::{Falcon, FalconEngine},
+    regs,
+};
+
+/// Type specifying the `Gsp` falcon engine. Cannot be instantiated.
+pub(crate) struct Gsp(());
+
+impl FalconEngine for Gsp {
+    const BASE: usize = 0x00110000;
+}
+
+impl Falcon<Gsp> {
+    /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register to
+    /// allow GSP to signal CPU for processing new messages in message queue.
+    pub(crate) fn clear_swgen0_intr(&self, bar: &Bar0) {
+        regs::NV_PFALCON_FALCON_IRQSCLR::default()
+            .set_swgen0(true)
+            .write(bar, Gsp::BASE);
+    }
+}
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
new file mode 100644
index 0000000000000000000000000000000000000000..fdb4828f0b7be02729a01497bfc2198d8387d16b
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::falcon::{Falcon, FalconBromParams, FalconEngine};
+use crate::gpu::Chipset;
+
+mod ga102;
+
+/// Hardware Abstraction Layer for Falcon cores.
+///
+/// Implements chipset-specific low-level operations. The trait is generic against [`FalconEngine`]
+/// so its `BASE` parameter can be used in order to avoid runtime bound checks when accessing
+/// registers.
+pub(crate) trait FalconHal<E: FalconEngine>: Sync {
+    // Activates the Falcon core if the engine is a risvc/falcon dual engine.
+    fn select_core(&self, _falcon: &Falcon<E>, _bar: &Bar0) -> Result {
+        Ok(())
+    }
+
+    /// Returns the fused version of the signature to use in order to run a HS firmware on this
+    /// falcon instance. `engine_id_mask` and `ucode_id` are obtained from the firmware header.
+    fn signature_reg_fuse_version(
+        &self,
+        falcon: &Falcon<E>,
+        bar: &Bar0,
+        engine_id_mask: u16,
+        ucode_id: u8,
+    ) -> Result<u32>;
+
+    // Program the boot ROM registers prior to starting a secure firmware.
+    fn program_brom(&self, falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams) -> Result;
+}
+
+/// Returns a boxed falcon HAL adequate for `chipset`.
+///
+/// We use a heap-allocated trait object instead of a statically defined one because the
+/// generic `FalconEngine` argument makes it difficult to define all the combinations
+/// statically.
+pub(super) fn falcon_hal<E: FalconEngine + 'static>(
+    chipset: Chipset,
+) -> Result<KBox<dyn FalconHal<E>>> {
+    use Chipset::*;
+
+    let hal = match chipset {
+        GA102 | GA103 | GA104 | GA106 | GA107 => {
+            KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
+        }
+        _ => return Err(ENOTSUPP),
+    };
+
+    Ok(hal)
+}
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
new file mode 100644
index 0000000000000000000000000000000000000000..d4caa19229612a83d9b27e3af76c361be416d49d
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::marker::PhantomData;
+use core::time::Duration;
+
+use kernel::device;
+use kernel::num::fls_u32;
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::falcon::{
+    Falcon, FalconBromParams, FalconEngine, FalconModSelAlgo, PeregrineCoreSelect,
+};
+use crate::regs;
+use crate::util;
+
+use super::FalconHal;
+
+fn select_core_ga102<E: FalconEngine>(bar: &Bar0) -> Result {
+    let bcr_ctrl = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, E::BASE);
+    if bcr_ctrl.core_select() != PeregrineCoreSelect::Falcon {
+        regs::NV_PRISCV_RISCV_BCR_CTRL::default()
+            .set_core_select(PeregrineCoreSelect::Falcon)
+            .write(bar, E::BASE);
+
+        util::wait_on(Duration::from_millis(10), || {
+            let r = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, E::BASE);
+            if r.valid() {
+                Some(())
+            } else {
+                None
+            }
+        })?;
+    }
+
+    Ok(())
+}
+
+fn signature_reg_fuse_version_ga102(
+    dev: &device::Device,
+    bar: &Bar0,
+    engine_id_mask: u16,
+    ucode_id: u8,
+) -> Result<u32> {
+    // The ucode fuse versions are contained in the FUSE_OPT_FPF_<ENGINE>_UCODE<X>_VERSION
+    // registers, which are an array. Our register definition macros do not allow us to manage them
+    // properly, so we need to hardcode their addresses for now.
+
+    // Each engine has 16 ucode version registers numbered from 1 to 16.
+    if ucode_id == 0 || ucode_id > 16 {
+        dev_err!(dev, "invalid ucode id {:#x}", ucode_id);
+        return Err(EINVAL);
+    }
+
+    // Base address of the FUSE registers array corresponding to the engine.
+    let reg_fuse_base = if engine_id_mask & 0x0001 != 0 {
+        regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::OFFSET
+    } else if engine_id_mask & 0x0004 != 0 {
+        regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::OFFSET
+    } else if engine_id_mask & 0x0400 != 0 {
+        regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::OFFSET
+    } else {
+        dev_err!(dev, "unexpected engine_id_mask {:#x}", engine_id_mask);
+        return Err(EINVAL);
+    };
+
+    // Read `reg_fuse_base[ucode_id - 1]`.
+    let reg_fuse_version =
+        bar.read32(reg_fuse_base + ((ucode_id - 1) as usize * core::mem::size_of::<u32>()));
+
+    Ok(fls_u32(reg_fuse_version))
+}
+
+fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) -> Result {
+    regs::NV_PFALCON2_FALCON_BROM_PARAADDR::default()
+        .set_value(params.pkc_data_offset)
+        .write(bar, E::BASE);
+    regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::default()
+        .set_value(params.engine_id_mask as u32)
+        .write(bar, E::BASE);
+    regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::default()
+        .set_ucode_id(params.ucode_id)
+        .write(bar, E::BASE);
+    regs::NV_PFALCON2_FALCON_MOD_SEL::default()
+        .set_algo(FalconModSelAlgo::Rsa3k)
+        .write(bar, E::BASE);
+
+    Ok(())
+}
+
+pub(super) struct Ga102<E: FalconEngine>(PhantomData<E>);
+
+impl<E: FalconEngine> Ga102<E> {
+    pub(super) fn new() -> Self {
+        Self(PhantomData)
+    }
+}
+
+impl<E: FalconEngine> FalconHal<E> for Ga102<E> {
+    fn select_core(&self, _falcon: &Falcon<E>, bar: &Bar0) -> Result {
+        select_core_ga102::<E>(bar)
+    }
+
+    fn signature_reg_fuse_version(
+        &self,
+        falcon: &Falcon<E>,
+        bar: &Bar0,
+        engine_id_mask: u16,
+        ucode_id: u8,
+    ) -> Result<u32> {
+        signature_reg_fuse_version_ga102(&falcon.dev, bar, engine_id_mask, ucode_id)
+    }
+
+    fn program_brom(&self, _falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams) -> Result {
+        program_brom_ga102::<E>(bar, params)
+    }
+}
diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
new file mode 100644
index 0000000000000000000000000000000000000000..5147d9e2a7fe859210727504688d84cca4de991b
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/sec2.rs
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::falcon::FalconEngine;
+
+/// Type specifying the `Sec2` falcon engine. Cannot be instantiated.
+pub(crate) struct Sec2(());
+
+impl FalconEngine for Sec2 {
+    const BASE: usize = 0x00840000;
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 768579dfdfc7e9e61c613202030d2c7ee6054e2a..c9f7f604a5de6ea4eb85f061cae826302c1902c3 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -3,6 +3,7 @@
 use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
 
 use crate::driver::Bar0;
+use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
 use crate::fb::SysmemFlush;
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
@@ -207,6 +208,16 @@ pub(crate) fn new(
         // System memory page required for sysmembar to properly flush into system memory.
         let sysmem_flush = SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?;
 
+        let gsp_falcon = Falcon::<Gsp>::new(
+            pdev.as_ref(),
+            spec.chipset,
+            bar,
+            spec.chipset > Chipset::GA100,
+        )?;
+        gsp_falcon.clear_swgen0_intr(bar);
+
+        let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 8ac04b8586e7314528e081464ed73ee615001e9b..808997bbe36d2fa1dc8b8940c1f9373d9bdbfb69 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -4,6 +4,7 @@
 
 mod dma;
 mod driver;
+mod falcon;
 mod fb;
 mod firmware;
 mod gfw;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index b599e7ddad57ed8defe0324056571ba46b926cf6..b9fbc847c943b54557259ebc0d1cf3cb1bbc7a1b 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -7,6 +7,10 @@
 #[macro_use]
 mod macros;
 
+use crate::falcon::{
+    DmaTrfCmdSize, FalconCoreRev, FalconCoreRevSubversion, FalconFbifMemType, FalconFbifTarget,
+    FalconModSelAlgo, FalconSecurityModel, PeregrineCoreSelect,
+};
 use crate::gpu::{Architecture, Chipset};
 use kernel::prelude::*;
 
@@ -72,3 +76,138 @@ pub(crate) fn completed(self) -> bool {
         self.progress() == 0xff
     }
 }
+
+/* FUSE */
+
+register!(NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION @ 0x00824100 {
+    15:0    data as u16;
+});
+
+register!(NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION @ 0x00824140 {
+    15:0    data as u16;
+});
+
+register!(NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION @ 0x008241c0 {
+    15:0    data as u16;
+});
+
+/* PFALCON */
+
+register!(NV_PFALCON_FALCON_IRQSCLR @ +0x00000004 {
+    4:4     halt as bool;
+    6:6     swgen0 as bool;
+});
+
+register!(NV_PFALCON_FALCON_MAILBOX0 @ +0x00000040 {
+    31:0    value as u32;
+});
+
+register!(NV_PFALCON_FALCON_MAILBOX1 @ +0x00000044 {
+    31:0    value as u32;
+});
+
+register!(NV_PFALCON_FALCON_RM @ +0x00000084 {
+    31:0    value as u32;
+});
+
+register!(NV_PFALCON_FALCON_HWCFG2 @ +0x000000f4 {
+    10:10   riscv as bool;
+    12:12   mem_scrubbing as bool;
+    31:31   reset_ready as bool, "Signal indicating that reset is completed (GA102+)";
+});
+
+register!(NV_PFALCON_FALCON_CPUCTL @ +0x00000100 {
+    1:1     startcpu as bool;
+    4:4     halted as bool;
+    6:6     alias_en as bool;
+});
+
+register!(NV_PFALCON_FALCON_BOOTVEC @ +0x00000104 {
+    31:0    value as u32;
+});
+
+register!(NV_PFALCON_FALCON_DMACTL @ +0x0000010c {
+    0:0     require_ctx as bool;
+    1:1     dmem_scrubbing as bool;
+    2:2     imem_scrubbing as bool;
+    6:3     dmaq_num as u8;
+    7:7     secure_stat as bool;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFBASE @ +0x00000110 {
+    31:0    base as u32;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFMOFFS @ +0x00000114 {
+    23:0    offs as u32;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFCMD @ +0x00000118 {
+    0:0     full as bool;
+    1:1     idle as bool;
+    3:2     sec as u8;
+    4:4     imem as bool;
+    5:5     is_write as bool;
+    10:8    size as u8 ?=> DmaTrfCmdSize;
+    14:12   ctxdma as u8;
+    16:16   set_dmtag as u8;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ +0x0000011c {
+    31:0    offs as u32;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFBASE1 @ +0x00000128 {
+    8:0     base as u16;
+});
+
+register!(NV_PFALCON_FALCON_HWCFG1 @ +0x0000012c {
+    3:0     core_rev as u8 ?=> FalconCoreRev, "Core revision";
+    5:4     security_model as u8 ?=> FalconSecurityModel, "Security model";
+    7:6     core_rev_subversion as u8 ?=> FalconCoreRevSubversion, "Core revision subversion";
+});
+
+register!(NV_PFALCON_FALCON_CPUCTL_ALIAS @ +0x00000130 {
+    1:1     startcpu as bool;
+});
+
+// Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
+// instance.
+register!(NV_PFALCON_FALCON_ENGINE @ +0x000003c0 {
+    0:0     reset as bool;
+});
+
+// TODO: this is an array of registers.
+register!(NV_PFALCON_FBIF_TRANSCFG @ +0x00000600 {
+    1:0     target as u8 ?=> FalconFbifTarget;
+    2:2     mem_type as bool => FalconFbifMemType;
+});
+
+register!(NV_PFALCON_FBIF_CTL @ +0x00000624 {
+    7:7     allow_phys_no_ctx as bool;
+});
+
+register!(NV_PFALCON2_FALCON_MOD_SEL @ +0x00001180 {
+    7:0     algo as u8 ?=> FalconModSelAlgo;
+});
+
+register!(NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ +0x00001198 {
+    7:0    ucode_id as u8;
+});
+
+register!(NV_PFALCON2_FALCON_BROM_ENGIDMASK @ +0x0000119c {
+    31:0    value as u32;
+});
+
+// TODO: this is an array of registers.
+register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ +0x00001210 {
+    31:0    value as u32;
+});
+
+/* PRISCV */
+
+register!(NV_PRISCV_RISCV_BCR_CTRL @ +0x00001668 {
+    0:0     valid as bool;
+    4:4     core_select as bool => PeregrineCoreSelect;
+    8:8     br_fetch as bool;
+});

-- 
2.49.0

