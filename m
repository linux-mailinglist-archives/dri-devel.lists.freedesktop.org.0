Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F27FBABFA75
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 17:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAB310FD70;
	Wed, 21 May 2025 15:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iuRSbdjK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060.outbound.protection.outlook.com [40.107.212.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF16110FD70;
 Wed, 21 May 2025 15:59:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+YZrVMxoxiF/EpXwcos3x33VQK+tlRQv5p/7vxmK7l9fgOIgkqlL0mwGYXL7I+mVcx6lcL0dyw3+VgmRPq19E+qWbgHwPeiGdxRIkW0TmDhgjQuKGIX8g1itJG0aakGo67UpUk91sSiNt0XIpF1eym8oVyIi9oChIO1r8FNudyEFN3sbHJ0uPofZ3m6s8dburnHafEFEjbcW9HaE10FW2J08O55D4OYvR/8KyQ/RhElg1xQJxIw6O/yn+Y0HH/EksZMBh7GxwNoy6yjyylXY5cZpfgGR44bb097WNWlE8onFnCNK7XXpiMQeuS6VPP31t0fFoel4BO9Ao9X1gYP+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFv4WPyJERDJBX4BwTJPbxxOiKfxy7n7tdqAm0Z/PTU=;
 b=Nt6AVIUeWJ1rfIG9EoutF9fsHodlcx/07Rwf2Mtj8t/QINVjhVAbpv5NGs5ZNLPQDo+t2A5cfknR/OjzjVN53YZ5i2Rd9NgWpZtDe/Q9ip6LXHNe9Jp6PPSUr6bsIJ1n6Uci1oECdx6EZr2kFDDTXeWpWuPyBHNV0HExQdLolRf2x8F41/L/8dAVj1m/G7GSdl1mnnGQf57XjnalIEqB0EoQ4DmD8gLznQbpdRzjAgypdEGcbROfUcTDXARJ4Rum9yD5QOVKaPf5Qyznlv/YwemysKecrq1qlLMNIivuZRDTSGXTeZIFj53Ek55gip8Y95ZHVoDN8pIkRVpFZT6wFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFv4WPyJERDJBX4BwTJPbxxOiKfxy7n7tdqAm0Z/PTU=;
 b=iuRSbdjKEWqJQgivoD+ri40cEUy/bo8uXY03fDKfp4wwer5d99fesF+nK5BtmOUFfNvqhNEfVxhQhrTE5qP5Evt6fJXzm4lLYpXS00jHMKN59pAxev6UJmnwp63MHgjgkZgiNCpZKeZ8OnPnZxfOqeHvAtz3d5X+t6SLXCM09huRTB4Vi7JpqoHPbcaUv/sr2Vup+mEjJWL9J+rxPkeEzxqB/izNIE2MHlGSM+NbT3d8+36M4YjK4m2hjgKtkDJZamMQPor7Ms7sLhOTJOAT5H0PUrFCf8VI6dcqxtstI32YtcG4G4Ha9+1dANtcD/a1tIQiQSgn3LNZvIV6a09idA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB7419.namprd12.prod.outlook.com (2603:10b6:806:2a6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 15:59:34 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 15:59:33 +0000
Message-ID: <ad10ce1c-c3cb-438e-a0e6-37653eb0a37e@nvidia.com>
Date: Wed, 21 May 2025 11:59:30 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/20] rust: dma: expose the count and size of
 CoherentAllocation
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Boqun Feng <boqun.feng@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-1-05dfd4f39479@nvidia.com> <aC3KbKeEVlHggi5l@Mac.home>
 <0d5a71b7-92d4-4052-93a8-ed61bc9ebb67@nvidia.com>
Content-Language: en-US
In-Reply-To: <0d5a71b7-92d4-4052-93a8-ed61bc9ebb67@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:208:52d::7) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB7419:EE_
X-MS-Office365-Filtering-Correlation-Id: a50d56cd-2291-482c-902a-08dd98807a9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnQrR3loN2NDQVdMaXFCQzE0UnR6QkYzQk8wUkZPWVdXSC9ORXFjWmlkMjlq?=
 =?utf-8?B?QnBub1lEL2NwVEt3M2VRM3lqczJacHI2M1dkcmdOMkcrTmFlRUxCM08zM2xk?=
 =?utf-8?B?WnFKUkg1QW1oK2lKbmpsMFNrRlBINm1sM2lWNVJ6aWYveXZ5VlBFaEVPWEYy?=
 =?utf-8?B?K2ZYNjVONXZ5a1ZsbkxVclQrTG1vam5iVkl2YnpsU2JsMHBWODZqaEZUTmlL?=
 =?utf-8?B?R3JOMU02a2M3YzVCdm42TUFkMXJ3M25KLzJ2SVBIeFFoNzM0KzhsdklqOEcw?=
 =?utf-8?B?RmF4NVlOMms5TlkzTnl0amhmMmxrVmpCUHRUcnFuanpQdEVtWkQzUks0OE9m?=
 =?utf-8?B?ZmQzQ3RkZDB2M1RwbHNnWjdCLzBkSXNqVGxWMk90V2ZqTkkvQVE5bFQ1TjNU?=
 =?utf-8?B?SW1nMU0wWHhFUTM3bERqTHRCM0RBbVhFSDk0U1E0KzhFb1JJRkJzT3RleHQ5?=
 =?utf-8?B?blRYYWlVSVpyY1B1KzBIZkNaR056c3ByNUZQZjVNRXF0d2xTRG5IOHNaUUps?=
 =?utf-8?B?clpmWGt0SDBJVHFXSDRkckxZLzNuc0RzRUJxS0JxcU9oQlhwQWFOd0pHTXFE?=
 =?utf-8?B?dHJPMUdjOW4zRkZFekoyTUNmcHh4c0p4QnJpclg0c2tRTW1XazB2OTVvZ3Vu?=
 =?utf-8?B?Mk5nRU9Oejk5YW9xZ2daS0pPeldYZXFiSXNvZmxxWGh3UC84aVdzZVRBY0J3?=
 =?utf-8?B?QnBST0svMERoUVJ2bFFWN0t5bzhmblIyZ3VJNUVVU1BrSm5LVTM0Z1Ivenhz?=
 =?utf-8?B?M1UwTUlqK0wxcXg2cXcvRGdUVm9XZzQ2VmIyVUZ2LzA2cS9MYUFnZDhLYWUw?=
 =?utf-8?B?aXlsYm9pUWxLcEt1ejNxN2FsWC9BcHQrTmVyVFd0bVlnWDNHU0FjM3gyMkgx?=
 =?utf-8?B?eVRPcVZ6c1BFWWhyRGsxeWlnenBVKzRrZDJtZitSRjdYTHppNkRneXFCUzZm?=
 =?utf-8?B?Qkk2MEphQlA3d0gwQTZGQ0l3cmtHZ2JRSHRDQmNSbEhDRHcvcHcrM3A1M00x?=
 =?utf-8?B?L255V3VYR21wTHBZQms1Z1hOcWhQS2RvVUFGa1lpYXMvdnBNUVhWK1dQSzE0?=
 =?utf-8?B?c2RiVlcyRGhXVHNOUmJIRTdlS3NZRUlZKzJyR1N4MEQ4S1RUSUd0Q2hLcWFR?=
 =?utf-8?B?SWJNdUlzUkZTVjY2QklKU2dFMkc1Q095cVBZMFFrNlNMQlQvRU1yWTVrZWRO?=
 =?utf-8?B?SUpwbFFLVDRINWUwM2ZjYkJsT3ZkWHc0SllCRWhYWHlSMWFXdEsrL0RFai9a?=
 =?utf-8?B?alNuamJrcTgrSUVwcUcvd1BzV2xwa1VtbVVXbmtpZlNQMjB5eXEzcHhjV0xI?=
 =?utf-8?B?VExmVTFXMDFqczZWcE9CZlpDc05GbEJnbWpRYUhhTllzUzdoaHNoQ1Jyd0t5?=
 =?utf-8?B?Y0Izdk16TGhlSHZxM3h2M09SWFhPUEZQb1RKNHo1Nk9sZ2pvUVJVN3hjREtY?=
 =?utf-8?B?Nll5SCsxcTZYYTRZakdXamI5aW1ObUJTanVLOUE0VlV6cTk0SHFvdUJmZWhC?=
 =?utf-8?B?eEFjMXNOL0R4bHJHQldxblRYNm1HNEQ0cVBPRnR5ODZjTk1IdVVnVnJ3dW03?=
 =?utf-8?B?enJSTmFiQzM3Z0FpbzlPeHorWll3QlJ3d0NaYk4zc0ZHSDhhSDhMa2VOdXhI?=
 =?utf-8?B?Z1ZQbHZWdzBoeE1UQXpsMndxS1g1NTJQOWJkL3ZPb3hkb1pXOXN2MVdmdXEw?=
 =?utf-8?B?bkcwSDBNcXRqTkdwdGszQVk5eGROY1BhRFladExMWUwwRHBDV0RmT1VTYTk1?=
 =?utf-8?B?aXR4aStsMWRDQVQzcG9OUlNPMk1LemZ5YVd4T090OGQwSHhieUZXaWJYSmZ0?=
 =?utf-8?B?c0tBR1NqS3BUOVpDSHJwSGJQV0cwYk9SNkRGbWZ6WTFjZ2RUYnZFNys1OHFx?=
 =?utf-8?B?N3ZyTnVjRXpZV1BRbG5NTExhcVRRZ0NuNnBnY0ZGc0d1MXFRTWtFOUJTZHRu?=
 =?utf-8?Q?nkQ3OdPQMi4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUNxcUFhdUpGN3dmTWx2K1pvcy8rUm5LKytYMFo3MHNhOXNKZFlDc1RsQ2hF?=
 =?utf-8?B?K3dGZHBzWXdqNVJDSWZSN3ZzQTEyNHEvMGt1NnNVN2EzeVZWUFo3ajNUMGNR?=
 =?utf-8?B?bUZBRWZvSTh1WExVc0U4cHNKaGxITURBZlFrS1FnYitsaFpKbFZMUG5OZXIz?=
 =?utf-8?B?ZlRpVlk1aHZzVkJxMlVYTFpHejlPdFB3K1dQSm15RTlnR2NEenZmRXQ4WVV5?=
 =?utf-8?B?VUxSTE1Ock1jK3kyQjNGdG85NGFLMnlQa1JqTWR0QVlpVGpLa0FaZlVJMUdX?=
 =?utf-8?B?akNxZzgxT2MvNXZxMXNQSkJlVTZYbXZDelVydm9DYlhDN2t2TE42SGhWeHBa?=
 =?utf-8?B?VUJZUEdndkxtZ1hqSzBBMU5WdXB3TVVFSkZ3L2hzdVYxeHc3NXJ0T3ZuQU53?=
 =?utf-8?B?UFFWKzZzQkd2SGhHTlRpbTRTeXZZMi9VRGh6bHJESm91YXdvYmJjbEh6OGJ3?=
 =?utf-8?B?WGNKQ2ZnOExJQnlSZmgxZXM1bnQ3a1pQM0ppWEJ6cjB4T2JrTVZqaTBXdWtn?=
 =?utf-8?B?ZnRRNkRLQjFrSEZBY1luVDRDVG9TUURGNmV1MWtaZzZhZFBOc0VROTg2SHNo?=
 =?utf-8?B?d1g4bUxQMzdVenV4bFBQS3VIT2F1R3lMcnA0QnJwL2RTSzdMQ202SW9uMUUx?=
 =?utf-8?B?SWQxM0V1c1MyQjIzcmQ2Mk1Ed0RES0x2bjZlSXliUHEwQ2xaZUhkOUErTWFT?=
 =?utf-8?B?bG9Zc2ZZNVpuYlhxNk8yQXZEOExHNXNBbVMrT3daRGhHYkZoSXQ4c2Y1S3JU?=
 =?utf-8?B?bTVnV3FQRGx2STYwMXFncStmcmM3Tm5oTzBxWlZyU3RKZ2NDdVlYajltWmNZ?=
 =?utf-8?B?dEFVVWRhYjVYR2k1VGVmQjh4UTVMSDlmWmFSRnZlb1BUcFJpQnhURURNdXVI?=
 =?utf-8?B?K0NvZXN5NU1WcGFGT1R4d3JMMjEwYWk4Qmh4Z0tLL21wU2thV3RVb28xZzZD?=
 =?utf-8?B?b0dDcUJzUTBGWHA5Yk0rMThNNENQRlZRS0w2OVJYTmxpRDZJQ2FCVTIyMjJk?=
 =?utf-8?B?VzdjaDJUNE9HOHNTNTV6WUl3QUhRU2VQbElZMkNHV3FFUzB1N2MrODFOY0k0?=
 =?utf-8?B?VngweHhZSWtsc0ZVcDA4dHJqNlV6OGRJV3hwYStDd3kwbSsxZ1lxUlZrUG1s?=
 =?utf-8?B?WDFXM0IvTWc2ajJTYVdBRUdYZm8ydmFxUWYxVUdNUWt6NEIzSnd4TkU5QnNZ?=
 =?utf-8?B?ejgwbFFZdSt5dklySy8vUGFTcW9LZ0JtU3dhWUpBSWJXdXV4MU92bnVXVzl0?=
 =?utf-8?B?UVlKTWtWSXFKalJEVWdIcmVlOXFvcDVKdk1MTVRzTGY0MDM2NmJNSnVONm1N?=
 =?utf-8?B?cm9EOS9xcEtNZjBmT3ZRMkVxaU0waTFlSVJEeHZrYnpGcjJ1VnRkK1A3WVUr?=
 =?utf-8?B?b1V4Kzk0SXh0TVhId1lFL0R6aFp2eG51bVNobGhYME5CTG95eHJXMnpPbVc0?=
 =?utf-8?B?RmtDZDR5cnA4SHo2bW1Sajl5cjY2UTdwVG9MTzdGREhhc0o4ZmJvajNMakZG?=
 =?utf-8?B?Vk04NVlZenpOQjkyT3crcmRDREU2Lys5MkhJSVVZZis0N3l0UC84NkdJMEZz?=
 =?utf-8?B?cU5KWVFUSlpEUnY5Wkx3TFZIUEt1NFJKbnZQUlI0N0VST2phU3Z2Tkp4bEho?=
 =?utf-8?B?SHJBVVRXQkh3Q2NNVDBuS1U4Ujk3cXJGeGRVcTdxWkJCZzVyVWpaMGgvZDhY?=
 =?utf-8?B?VWoyaW9zcnRpeEdjMUhocUNzN252dnliUGxadVFzYWFLR1U2Y0xXVjFDb2Zp?=
 =?utf-8?B?bG4vaUpZSjVqRDdBUHBxZGp1U3oyQXBtdzJqM3hPSFpYYkFpZzZJc1dGeHBJ?=
 =?utf-8?B?WVk3RWI3OTd3VXZwSWdNRUZXL0JYdGNERmRCWWFsVkZuU0pmTmtnalJrT1h3?=
 =?utf-8?B?N0pOMmZ3dWVPSzBZYitTajhtbW1SVU1nRTkzeUhFRlJNdklzVkN5MlNXVm5v?=
 =?utf-8?B?M0htN3A1eTlELzFKS1RuTzdkRFVsN0NtSEhBckZaMnRqa0xHYWo1dWtFWFJx?=
 =?utf-8?B?cEIwbFdXNGx6RkwvWGFMdlh3eTFNWWdXRUZBMTU0aHpBWTNvUk9HN1EraTZ4?=
 =?utf-8?B?bmk4UVRlMVFhZTZqTmc3TUZKZlArYU15NVoyWE1NYS9HUXRFN3hmdTBYbm9F?=
 =?utf-8?Q?KGcIWXS4pEkkjUCNHfcnBYIjm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a50d56cd-2291-482c-902a-08dd98807a9d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 15:59:33.8338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAjfImkkcolDBBebN82b7ygEHwxGm+oS/rUpwepsJjdJJ5bLn6I6J9EiYupJCdvMGMonDctb01qJFMDrREOh5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7419
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



On 5/21/2025 11:57 AM, Joel Fernandes wrote:
> 
> 
> On 5/21/2025 8:43 AM, Boqun Feng wrote:
>> On Wed, May 21, 2025 at 03:44:56PM +0900, Alexandre Courbot wrote:
>>> These properties are very useful to have and should be accessible.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>>  rust/kernel/dma.rs | 18 ++++++++++++++++++
>>>  1 file changed, 18 insertions(+)
>>>
>>> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
>>> index 605e01e35715667f93297fd9ec49d8e7032e0910..2a60eefa47dfc1f836c30ee342e26c6ff3e9b13a 100644
>>> --- a/rust/kernel/dma.rs
>>> +++ b/rust/kernel/dma.rs
>>> @@ -129,6 +129,10 @@ pub mod attrs {
>>>  //
>>>  // Hence, find a way to revoke the device resources of a `CoherentAllocation`, but not the
>>>  // entire `CoherentAllocation` including the allocated memory itself.
>>> +//
>>> +// # Invariants
>>> +//
>>> +// The size in bytes of the allocation is equal to `size_of::<T> * count()`.
>>>  pub struct CoherentAllocation<T: AsBytes + FromBytes> {
>>>      dev: ARef<Device>,
>>>      dma_handle: bindings::dma_addr_t,
>>> @@ -201,6 +205,20 @@ pub fn alloc_coherent(
>>>          CoherentAllocation::alloc_attrs(dev, count, gfp_flags, Attrs(0))
>>>      }
>>>  
>>> +    /// Returns the number of elements `T` in this allocation.
>>> +    ///
>>> +    /// Note that this is not the size of the allocation in bytes, which is provided by
>>> +    /// [`Self::size`].
>>> +    pub fn count(&self) -> usize {
>>> +        self.count
>>> +    }
>>> +
>>> +    /// Returns the size in bytes of this allocation.
>>> +    pub fn size(&self) -> usize {
>>> +        // As per the invariants of `CoherentAllocation`.
>>> +        self.count * core::mem::size_of::<T>()
>>
>> I think we need a comment or even an invariant saying this multiply
>> cannot overflow.
>>
> If there is a coding error (say large count passed to alloc_coherent()), then I
> don't think it can guaranteed. Maybe use
> self.count.checked_mul(core::mem::size_of::<T>())?
> 
Nevermind, we already checking for overflow in alloc_coherent():

        let size = count
            .checked_mul(core::mem::size_of::<T>())
            .ok_or(EOVERFLOW)?;

So maybe just a comment suffices, then.

thanks,

 - Joel

