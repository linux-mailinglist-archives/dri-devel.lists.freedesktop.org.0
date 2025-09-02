Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42593B406ED
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6212710E776;
	Tue,  2 Sep 2025 14:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Jbc0kf1e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6A210E773;
 Tue,  2 Sep 2025 14:32:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/sKcmtt6oAjlRHuY7cCi73bV87m5M9gRvI0q4BPjwNzlBjtQ4Hjar3XJQadR3zdyLffBvbBhjH7v3ChQ4L6HLuMbUo9reFwwNHvmzZazjg5p3gsYi604x27OVeBcT13mvBK0vhJj41PakF2+supeJIJHe8lxw3wRJK249vSHkSoDtWjYbYGchqEaBYNJZXAApUlBvQ7wq0JEuLODuVxmpX6rYBqCHzGnUVHrCuXE8s3y3foy66BZnLnlFZf38pBzCcqWDrRBGNeTGgUswr0iZrILubxDDTarFuclXMuVynqGmZMUOwayBWVtSvXP7DM6aOX8SrUc9xNZ++a3d7Mhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSrLNniLzfoz/myCQ8yz3ave0TVPkxeQzyey1Q/oCXM=;
 b=JMbh23iGXq9uvevJurR5CpZLLRkoQL2gXqQWZ9TzpcqNegc498fZRXUCZl5roxSkzoZdXoCTxQEy5PNs28LxtAwInPZcyccGnu8ALvlYrTs/JGHAiTQt4Q6o/q81KzNBdajWdU7dOvGryMwlgd5DVQ8nVykS2HxUSplamv6rpftcU31UpKQyXvl2EwHDqce5IDqiyfPV8xuYwrV4L6SMMsx3jEvCPBKBptx/L1Jz+UauzJ4YNuiCVJYhqaZwDfRlvbAEH/FOawAKYG49ioGePx+fOl+Md0A7NEfrCFkHatX0+DmcKOhzuXwcT10CyXJl6f4r+MnsT0BWDxi8OxfwNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSrLNniLzfoz/myCQ8yz3ave0TVPkxeQzyey1Q/oCXM=;
 b=Jbc0kf1eYIUzP8S7VSTYnZyR5IiOE5l6vLMxZwO6hQjQVmdkPJ82SOLeolvTu0cBltdADBYmiG0GqRCZeYnQt5mZcw6WKRRpHBKniUir4N7tzheMdW6w5a1wkHUqz6breRYc0NBYNMaiROSAOKjN/uUvpzRa5mM+ILvlObGW9huLzs52qa2unK/15Mx0whSyn5lGbnF1j6O/rlQR9UFkPDYKwGBSWFOOnNH4RLXAorOG+pckXQMrJtMsNt1wYmzSDAkWC3nobxmwE24KG+xbQcn4YTAbyqtikCxftal8ng1UmdcPQoFzxJB/K7NGnT+/c84cLHgl71Wsm2kQuJqg2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8955.namprd12.prod.outlook.com (2603:10b6:a03:542::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 14:32:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Tue, 2 Sep 2025
 14:32:39 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 02 Sep 2025 23:32:04 +0900
Subject: [PATCH v3 10/11] gpu: nova-core: Add base files for r570.144
 firmware bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-nova_firmware-v3-10-56854d9c5398@nvidia.com>
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
In-Reply-To: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: bd8d0817-b2b8-4a9c-9778-08ddea2d91b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T01RMlV1R1VWeXB1N0RnOUNidG5rSmRkQUxuZWpmczVqVmIxcDhEYlNheThy?=
 =?utf-8?B?d3pCTHRrYjEvV0g3ZFUyYWF2aHp6d2w4TlA5eVBJQ0ROS21SYmcwTDRiaVEx?=
 =?utf-8?B?SEpDczU3OERtWkoyVnIyeVlIUnJzWnAyNUhWMHdXRXYzaDgvYXdZV2dORkVw?=
 =?utf-8?B?eFBlU21LRnhiSEZCU2Y2WDFjS05iMHhuWk9PSUdaVVR0S29ocFR1L05GMGxX?=
 =?utf-8?B?WUpZUlZNRmdyWklicVNoTW8ydmRKQVBXK3RZZk1nUjlVZjNBV0ZvWldUZzhK?=
 =?utf-8?B?NlFidWNHdzlsRG9rTXNTRENnSzl4TVErak50SXpyK0VzQkx6QUhncjNFMEov?=
 =?utf-8?B?NW5PNmZMMnZxVktzU0RmeklDTW14WkVQQU9HQlRnazlId1NEamJBNnQrZFgv?=
 =?utf-8?B?OEpzVE4zQXZhendDU29qNkV4SEtnM3V4ck5GQ2VSaXpZT2Q2NGYzYWVINVVS?=
 =?utf-8?B?Z2R6d0VEeGdLekFqMFl6ZmljUms4eDM2bXBVdEIvdDRIdXVrSzhON0FyU2Nh?=
 =?utf-8?B?aGRqOWtuTlNGcFlvOEVaOXlOU0ZWZndYZ003Snd0ZVc3aWFKUWJLeEJiUk1X?=
 =?utf-8?B?L1p6MnN3ZEk0eU9LMU9FMUFjeXY0ci9kSVRLTVpQTTdWY3l1VWdjOS9wRzd5?=
 =?utf-8?B?aGtIT3dNOWhpYnZyQWdZQTFSVkhJWnFXQlJkM0hqMndHRTd0a2VUUm5nL0Ev?=
 =?utf-8?B?U0VTZGRCeTBtUEVualZyd0E2eHgrOVdsTzhTcW9jUk1sZjF4UDFGdVlUY0FY?=
 =?utf-8?B?dVorRno5aWwyOHlmTmgzaHB0L3VzNDYvdTRmUjBSTllWdU1lcjE0YjZHOGFN?=
 =?utf-8?B?MlBZVmpmTCs0QlFMUklWZjJYUVl4NWlmT2VkSjlVelNWaUF1V1hTUUhkVU1P?=
 =?utf-8?B?VFJvcm1aZ3ZvdjVLbFFJSjRnSytjb3U3RkJ2VlFsVExVRkhWTWNGVk1FTGtr?=
 =?utf-8?B?Tm9mZzZsMncwRDRtSTgyL1pDWVlmdDFMK2U2VDRkbnBQUmVKbm1QVksxazV4?=
 =?utf-8?B?N1FSUzlyN3hUNDAxZG93ZXdjRy96RWFjZisrTnZENTU0VEVZcW5zeHVZem4z?=
 =?utf-8?B?Qk10ZDVKeVdwZ2dSQUZ5cFNDTWNkaEliVldFM1dwc1U2MEJDRFNvVnJGTmEx?=
 =?utf-8?B?cm1WNDk0NVNRZzJDYXFjV291Y081M0laZjE1bmo4VlpUZEg4MVpwRDkxUmta?=
 =?utf-8?B?bFkvSGZUT29hNHY0T2dmSk5TUTR6M0NNQVdKRis0UnpuVVdRRzIxV1BNMXhX?=
 =?utf-8?B?Y3V2ODdnZklVeVlWMkVvZEQ4SjUwWHl6ZHNSRGRmMEl1b3ZaQ3BTSzdRSTJn?=
 =?utf-8?B?UVozeDVOMDJMNEovdzdQemhHSnYzYjh0TjBZTEpLWjVEMXJzM2JxTi8rQzZM?=
 =?utf-8?B?OFpXcC9BVndlUFc5a2VtWlB3Q3RzUWVBandvTkxtc0hmb2FVWk5UMWx6THJO?=
 =?utf-8?B?UE4rSm1BdTFoOUFvTnBESDV5S3hwWEd5cTNxdU5xUnZaSXIvaDBWb2xIbTVl?=
 =?utf-8?B?Q2JJQWw1RnJ5b25KTHRLZmhWRnkybWpHdmlMZmNyNkdJM0ZuSVArNDhVVkZ3?=
 =?utf-8?B?YWRXU3NGd1JFMC9rKzRCcDIvdE1rMGh4T1AyVk84aFFDRFJ6RjN2UDl6VFF1?=
 =?utf-8?B?ZTBOYUczVDNUbFdBYkhlWlJRUXNzUEozT2c5UzJzZnRiNlVSdWhSblBUc3p1?=
 =?utf-8?B?bGZvNGxSakFHbUI3b3hVdTcxSWtTQ2ZTU01RTk5MTlVLYXh2Rm5WMlBhUUF2?=
 =?utf-8?B?Mm5VV0k1UFpCdmE4TUd3UjA2dThaNU1CV0dUVXltR0R0THovdjdxeE5lbUZz?=
 =?utf-8?B?OUVDVCsxNUt2dklJejVIOXRTQlV1UUFUcVZNazBLazRCMFNSQXNYbVVvSFAv?=
 =?utf-8?B?RWRNRkZBLytNdmJuNk9aQkpCZFhuM0Nxb1gzQ3JGRlhUa05RTGtSOXlCSWwv?=
 =?utf-8?B?S1RJQVNzZkM3T1JOWGowelpXVmR5bDJJRnNtZUc1dktPNmVCSnhHbDA2SE8z?=
 =?utf-8?B?UzdMemxnYVl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFhaM1MyZzlTTXM4YXF4ZkJkaXUzbUlkZ0oxd3JKYTNEcTFscDFvRWZrZEdD?=
 =?utf-8?B?SERudXE5QnlXRG5hRnZ5cFdJNzlzVG5vNE1xRnd4UkhTSFlDbzQ0MnEycWp6?=
 =?utf-8?B?cnd3TVNwUWY3MEVMS2tMb25reXN5MFpPNDZzckpGeDJPSjFpWVNxeElCRWdW?=
 =?utf-8?B?Zit5SmFJYjdtRWFTc2piWmN4TFJxNFZWaVBHQnZ3NHJLcmNzaEZmT0hFUjQ0?=
 =?utf-8?B?WVU1Tm9SNThOYk1lNHhZeXgzMHczRFhyTUtkdW13a2hNTVJDTTgwTm01SWlN?=
 =?utf-8?B?dG80UUhzNGlTWUpJMVhDM1hJMFl0K0dKVHBHaWVxV1h0QzVsM3Y4UnhWYyth?=
 =?utf-8?B?WkVrN0t1Ky9hNnpuTWNwL0F4TXVhaEpjM0NPZHNaeDhrell0cnNQY0p2b2R6?=
 =?utf-8?B?eHpCRDhxM2l2YjB6ZXduMmpwSGsxZXV5WnVWR09ZVEQwL0t2TmRwNGtCUlNR?=
 =?utf-8?B?QlB6S3BIWUI4ME51bnQ3ZThzZUJlcytKSzRpcWtSLy9qdUxCZnRmeXRKandr?=
 =?utf-8?B?enNQSVExZGlocnlwak1ZTDJiWHhYYkVLeDlJR2dSZkdBZEJ4cHBoNGFZZVMz?=
 =?utf-8?B?Zkc5WlNudk9xRnBDK3pEMjVQalRBcFRncXFzQWdValZYcUducGVzd2dIM1cz?=
 =?utf-8?B?bFR0M3gxc1JGQ1kzdU1oM1NaeDc3R0RxUUtXdHZ0bzh5dm1JZS84SzBhWVNO?=
 =?utf-8?B?c0wrc1Q0Z2QzZzIvVTZ5ZzJFcVpxZVhFSlE4VUlBZjQzY3E5MHZFWHNHZDhh?=
 =?utf-8?B?bU5mODM5b1drQ1daQXdMVjBBZE4zdzhpMkxLREZKK2g3Zk5Mbm9BLzM3aGRI?=
 =?utf-8?B?ZXdyaUFrS0xqOFgrQ3VZYTNRUUNpRnFBMlRhdTNhbEp2dWFySGxSdXg1cnk2?=
 =?utf-8?B?M2N0WjlnYmtyVkI2UWU4bitsZVVjekUzZys4ZlpyKzV6VGtZMWZ5dkZmeFNR?=
 =?utf-8?B?cm5zc2NybU5QeDZjUnZra0NJSFJsRnpGM0xqa2ZYOGRWTGQrTlE1U3BUaFVC?=
 =?utf-8?B?Vk4rakFJdU1RdVAvVjYrYmRVVUpueTVtbjFTTHJ1Yk5aaVJkT1A3cDlwNWFD?=
 =?utf-8?B?MHZUQzlDNGl5RjFZZ2NzdHVxbVJ3Y3ozK0VoUDZ3K29pVEdGanNUTzBHQzl4?=
 =?utf-8?B?c3BmMy9PMDhzandpaDN4eEIyUkY1OFpoR2ttaWFXbmZ0RExLN0ZpZjczZk1X?=
 =?utf-8?B?MFBYMG03YitSMWVhenN0a1pQazZieGlXa0NmeVE1cEh6bThMV2ErSkp2aUli?=
 =?utf-8?B?bERVdGJiaDJoWHIwVVYzcGt1OVRjeTBpRmZHYWFkSFk3TDduQXlEZ2FwblEz?=
 =?utf-8?B?djFPeTA4VDNXOWhaUlZTU25iU1FqbUR2R0UzU250VnlEbGZ2UnVYN0JxNkpL?=
 =?utf-8?B?ZCthZG8rNzcrNlU4MGl6dm5oV0xiWi9MdzljU1RHSGtrNjRhMjk1RXJpSWpB?=
 =?utf-8?B?OWJuVjhkNy9NZFF6WW9EMWR0VVI5aDUvbmF1dUF2bjhPOC9maDFGYk1lWmVF?=
 =?utf-8?B?eEVUTk1SY0I1aTFrN3VBRm9TRDV1TEJIK3l3N2xuQmJUNlFyTWtBaENTZWpO?=
 =?utf-8?B?NENacFloTTRQRXdMWUxiLzBtT2l0eC9uTk5WVGVzYm0rYTB3UlFKZjBrTXZy?=
 =?utf-8?B?L0RyQkkrWEtjSGNpMDIzUlFFaW5tMWlqSFlraTBtdjNmNFE3Q3hLRGI5UFpP?=
 =?utf-8?B?THRnZklxZHMySXRDaDZSUlpSYWllZUM2V2IzTzdyNS9renNTQWtqTU5tZ25Y?=
 =?utf-8?B?RGp4Nk5TWlZLajF5RlZKNkFjTFdoL3BZTFpQalZMZ25ZTVNMWGRrWEhHdkFa?=
 =?utf-8?B?VGo2OE1GblVITkRNVXF5c3EzMktaOWFkLzZKemc1SlA2bnloZzkzaWh0b2lO?=
 =?utf-8?B?V25yaEM2Z2M1V2tIOThKRi9IM0ZqdTIycUNCTjI4ZkdlVUgvbWpRa25TakN1?=
 =?utf-8?B?dmtWNUdkUDZVcC8xSmxseXhwTWUvV216NXlFd0RMbHB5cHQrdHorTmNacDkz?=
 =?utf-8?B?M3laOEhIWm5aeURnVElKWHZpN1phR0d5MmhtbDhYVGo2WnRDR25qQlFtWEs5?=
 =?utf-8?B?Y0hOOCtIam1lcm5JRmZXbnhvR3RsUmZMUmtORVlJUnZQN29ZT0ZRQ3B6QytN?=
 =?utf-8?B?bXNWYWxwRGlSY3I1VEZ1SDFodHZrbXlqTkZWdjV3UGV2TEdwTnJKRjRjL0p6?=
 =?utf-8?Q?9tRFcCZdXF8hmq7pmIvUA7B+nbQ4NfJ3D589cdV17TeS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd8d0817-b2b8-4a9c-9778-08ddea2d91b0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:32:39.6420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohI4mAdYRijT9qZ6e6oQhZajivutpyuisTZ+JdpmeqnwgNq3NwWnTy98bFPn865v729vCb9429cun/9c4ABokQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8955
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

From: Alistair Popple <apopple@nvidia.com>

Interacting with the GSP currently requires using definitions from C
header files. Rust definitions for the types needed for Nova core will
be generated using the Rust bindgen tool. This patch adds the base
module to allow inclusion of the generated bindings. The generated
bindings themselves are added by subsequent patches when they are first
used.

Currently we only intend to support a single firmware version, 570.144,
with these bindings. Longer term we intend to move to a more stable GSP
interface that isn't tied to specific firmware versions.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
[acourbot@nvidia.com: adapt the bindings module comment a bit]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs              |  1 +
 drivers/gpu/nova-core/nvfw.rs                   |  6 +++++
 drivers/gpu/nova-core/nvfw/r570_144.rs          | 29 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nvfw/r570_144_bindings.rs |  1 +
 4 files changed, 37 insertions(+)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index fffcaee2249fe6cd7f55a7291c1e44be42e791d9..db197498b0b7b1ff9234ef6645a4ea5ff44bd285 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -10,6 +10,7 @@
 mod gfw;
 mod gpu;
 mod gsp;
+mod nvfw;
 mod regs;
 mod util;
 mod vbios;
diff --git a/drivers/gpu/nova-core/nvfw.rs b/drivers/gpu/nova-core/nvfw.rs
new file mode 100644
index 0000000000000000000000000000000000000000..779db25095892d6d88652fb7da243a8d2f7db047
--- /dev/null
+++ b/drivers/gpu/nova-core/nvfw.rs
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
+
+mod r570_144;
+
+// Alias to avoid repeating the version number with every use.
+use r570_144 as bindings;
diff --git a/drivers/gpu/nova-core/nvfw/r570_144.rs b/drivers/gpu/nova-core/nvfw/r570_144.rs
new file mode 100644
index 0000000000000000000000000000000000000000..2e7bba80fa8b9c5fcb4e26887825d2cca3f7b6b7
--- /dev/null
+++ b/drivers/gpu/nova-core/nvfw/r570_144.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Firmware bindings.
+//!
+//! Imports the generated bindings by `bindgen`.
+//!
+//! This module may not be directly used. Please abstract or re-export the needed symbols in the
+//! parent module instead.
+
+#![cfg_attr(test, allow(deref_nullptr))]
+#![cfg_attr(test, allow(unaligned_references))]
+#![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
+#![allow(
+    dead_code,
+    unused_imports,
+    clippy::all,
+    clippy::undocumented_unsafe_blocks,
+    clippy::ptr_as_ptr,
+    clippy::ref_as_ptr,
+    missing_docs,
+    non_camel_case_types,
+    non_upper_case_globals,
+    non_snake_case,
+    improper_ctypes,
+    unreachable_pub,
+    unsafe_op_in_unsafe_fn
+)]
+use kernel::ffi;
+include!("r570_144_bindings.rs");
diff --git a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
new file mode 100644
index 0000000000000000000000000000000000000000..cec5940325151e407aa90128a35cb683afd436d7
--- /dev/null
+++ b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
@@ -0,0 +1 @@
+// SPDX-License-Identifier: GPL-2.0

-- 
2.51.0

