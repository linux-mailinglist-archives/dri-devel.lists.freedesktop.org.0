Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44568AD731B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54BB10E86F;
	Thu, 12 Jun 2025 14:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CLBW2iJk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2056.outbound.protection.outlook.com [40.107.102.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2984B10E86E;
 Thu, 12 Jun 2025 14:03:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PgAI2Z4PBJ1nvkeDVAjw4Bzr2Oaj6hEa1opZGccPx8OmmbOU8VLT0AGGr0GBFYVqy5mT6ZU4sgsqEaO6aws9ySwqxsNtji5a5MRZ6pjnRqTv77WQcM4ThN62xyAktLl3ulv0tGJeEpK6hpwiHleRL/ZpZtvOJ+0U2zTURyy2TPleE3jAM6UjrsYVN+q+j994TFGFhqxqjIH/5B9BUjtMId3tjcpURHqOKDX0Fo36yrF579sRApKyljPhCn5vsdXp1O75ncvB15Xw4zb/XOcR/b8q4OMQZhIozZKzfMswJWVIr8WtCus6DHWDV9jScVMykbgRT5dPWVrq3HrPDH6hyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9g6PII8a63d4L7PGzAXUmnppDWGtTDqho+K/qjAerM=;
 b=OijAGH+DuDwAlaVk+UbMvwB8NkEeRluArXyrV2shRFfuxuUIsf/WiU5zTFsaXzNIs+8dQCGnoOCwkutOI5hr9wX6Y81WcDsPMj9tNptJUL11Gm5uv0mOeOE10JzSqjTRSWnL2RU50qqyyK0Hnk24yVwc6GPKKG/BfrWTb9XpHQ+f60xPzeeZjmPqbXeJQuC87aesYdEYqM8U1keKCVzUSv0hatbwSpBax1aqmbBumFh++YfEPm1zRcHo5NkI4TJy4dIPANpUL/p64XVg6bZrGHURvbgBBZYlKo9SAs0gdhnFcOHluthHUg6M10k0eLYt3q4m2hzKyuU1Z6d7SC+2nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9g6PII8a63d4L7PGzAXUmnppDWGtTDqho+K/qjAerM=;
 b=CLBW2iJknUgnAj4kDLRNTEdt8rPg+aUhu1Eb4TQ7qHn1dHwUamj77AGjna+D0gI/b0OGAtopcZDTUqX7XRATNcXSZ6wHCG5HsUmJAti4EyXW7sxH2b2uiJAP4m8UCt4a2LPx5vC7pEbYk+1gy1RrVZrrV/usJJWgvwwcMYiyru1oDGk7SwSNHYNgdleVUrZNYKAYPdwb2WWpKeDK9+NXFBYO+2HOxkiIPfcYevyLX3my5azsnrzkWvWcO3JBr/3PiLKhREYfqZaE+5RbqM9ajR64yGg5DgQL34vG3mFQkmkYJ8lp2Pa3gUlh23BC9oRAxEwiTsCFIlhrvuEDw5RoSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8598.namprd12.prod.outlook.com (2603:10b6:806:253::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Thu, 12 Jun
 2025 14:03:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:03:44 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:50 +0900
Subject: [PATCH v5 22/23] gpu: nova-core: extract FWSEC from BIOS and patch
 it to run FWSEC-FRTS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-22-14ba7eaf166b@nvidia.com>
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
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0106.jpnprd01.prod.outlook.com
 (2603:1096:405:4::22) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: c25b2319-c7f7-44bb-61fe-08dda9b9f1a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEZDTzBwTHpSQk5aVFdZeXA0Y3hqMGRKd3dtdUptQUwrWjJBRElqV0xMN1ZY?=
 =?utf-8?B?UTY1WnAvMFBORFlXZHdlSnpOYlpQek4yT0R0Q0Y1dFZ2SHpNd2FuWkU2ZHNq?=
 =?utf-8?B?Z1UwYndsRFRmenQ2RjBMb0ZrRUo3dHJDSTVnK1I2MG9ubGpWVWNXdmNxWHAx?=
 =?utf-8?B?dkZiYlZqSks0SVpYazZ5eHZFLzh1cDJDeVpVdEcxSkN6Y2RTNVNxdUZvblBr?=
 =?utf-8?B?eVF2ZWxPNDh4ZTQxM1JoWVByNGxBdUJ0Z3h5V3YxdlF5S0lKa1BvN2gxSmM4?=
 =?utf-8?B?Q0FTRFNocFBZUGJKY0tUSW16cnA1SzV6RTduZTFueE11a0llQ0hLNnJhY0k1?=
 =?utf-8?B?ajZIc2FRdm5SeGxDVW52UnZmTm50MjJIZTRvVzdiMEc1VFRMV0h3cGY0RjND?=
 =?utf-8?B?YTFvdi8zWnBNNERibUpWR3lDY0lMeXlQbkVaNTJMd0VFNC9MZERMcnB0UWY1?=
 =?utf-8?B?U2ZoY3ppMzBVS0xFMjdBb2wra3N6TDNlZzVDSHFSWll0VGMvRThXblJIMUZU?=
 =?utf-8?B?MFd6QmpRRmtVdXRnc3RZc2k2Y1cvY3hLUDVxQlowaS9IN1NUZVhzWk0xL0dT?=
 =?utf-8?B?UTFXYnNtUmlxTDlZWVBwY0V4Y3RiaU41VU1YcklkcC8zanZBVGRta0ZOSmVu?=
 =?utf-8?B?eFR3QjJPdjJRdm1PeXgyRjFhT0xXaEIyN3h1WHpiZiszTjJpcWxiRkJxdUxy?=
 =?utf-8?B?Z3BTY0hSR0pLUkUwbG4vR3h0YkxhS09TU2ZUc0VhUXIrZHF5SEdTNThCVXVs?=
 =?utf-8?B?R0lXU1ptanFIS0VBcWdNbG9sZ3hBamFiU3JUMkd3ZUVaWlJ0b0J4RnQ1ckwr?=
 =?utf-8?B?cWxmbWpyVXNhVEhsdVNmVE9PT3lYOWJubVRTeGhnSC9zNjdvN0VuUDBGUTAw?=
 =?utf-8?B?R2RzV09DcXpyQ0M0VDQ0bkhHV0hMSklyMW8vOGQzQXJDLzNLUnBLWHVPOTFQ?=
 =?utf-8?B?Qkg3OThVSlFvMnBnZVQ3VTA2SWFHaTFtUGZvdDNBZUJUVitCNUhqd2pqWit6?=
 =?utf-8?B?TzdmYXpDTzRyVDFWekYxb1BmbFpKZU9vYWxSK0M2NWtrZTRLNDNqdHpodVFK?=
 =?utf-8?B?Y05OQ3pGTlBRVldHVzc2cm9UM2MrcjB1dERpMTNGWjdzZG9MSFVJcUZ1WGJ5?=
 =?utf-8?B?MnNTQmQxSHkvVDRmbnFIS25IL3RXdlBNbHA3REN5UThJbzVtVDFkWFBJZzUw?=
 =?utf-8?B?N1dLZ1RWeDlsb3c3N1hIWnpWRG1oTkFpeDhNUUlZYzZITTJ2bEZlNkZwQ0FY?=
 =?utf-8?B?YW82ZVVoR25vZVhNK3N4VkszOGVrdSthcjlYUWk3K1lpNVVoblBuK2RudWpM?=
 =?utf-8?B?ekM2eHdwRGRqb3dpQ05zTkZjRGpIdm5zUVVRd01paCtFV3JGaHZwMDhhRnhr?=
 =?utf-8?B?S01sU0tzbU85Wk5QbjJaSDU0Z0FXNmJCQ1I4WUhUQm11SlR3VmVsNmpLbWJJ?=
 =?utf-8?B?am15UXR5L0g3WTE4ZnhhSWFPZk5CZVhMRXJ2RXV1dUZJaHhEdXAvQzREY0V5?=
 =?utf-8?B?RmtuNmwvbFdNZU9sY2phak1BYUQ0Lzl5SUVVRUlUSm9wem9jazdwckVNVFFS?=
 =?utf-8?B?NWFNYk9ISlIvbUxMVGRNTS85NDdkd1UzcEJZWFlaTFFXNVpHSVlUWVBKUkpJ?=
 =?utf-8?B?YnplWE85d0l3R1RManBkbDI5aUo5NVNIVlNMUTZQc0IxcDlET3NrZVhkNmJC?=
 =?utf-8?B?QW94a1pCcDlBMUNtdU1iQ1YxaXJjQzZ6UnhYaTBoTnBYUFhIT1lKVkcxL3NQ?=
 =?utf-8?B?cHdoRWNLWEx5aDcrMStVMnBnejRCREhBUVlVYWtGbW5HdzVQVjVQRXR2Vi9E?=
 =?utf-8?B?TGdHZGYrcmdoT3FrekxyazBIdTJqajBYYTdJWkFIaWM2aE42RGdvaStOSmRR?=
 =?utf-8?B?WkRBell5TE5NQytNSFg0TVYyUjROZEtrY1JTbDFqSmNIN3p6QkxZOVBSUlBa?=
 =?utf-8?B?bTIrMWliOTBldys0UGZkVUpUdFJEQXJ5RVdFVmxhR2xsY25oYVJ5UWVSajQ0?=
 =?utf-8?B?ZUljQ0FhTjV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WElGd1FxaS8rNnZiS0tTQis0Nk43ekV1TlVNbHFKMFdrREtSWm5abXEvT25Z?=
 =?utf-8?B?clg2eFJUMUdvamdtMEZXK1Y1bkM1N0pLcVRkUkNCcTVoUFhDVkNrekh6NE80?=
 =?utf-8?B?cEZBREUxSmx0cVRkOUU1eUJ4K3J0SXMwTnFrcTVjZjRCYkNRSmN4V3E0VWV4?=
 =?utf-8?B?di9MWlBPUUJwMVRlN2RpbktjVlVxcWVzQmxlRTNhWENEQlUzdzR0TTRDRXBN?=
 =?utf-8?B?VVdoR2lFc3RZOE40anZtU0JidStqSWpYcHBhVkpNN0c0dGVMa1hzSnAwU0s3?=
 =?utf-8?B?NjhWeGMxb29VTkxTelg4MnpERU1Wa2QzTUZHcENSUEQ5dWNDWXpUSi9YczBO?=
 =?utf-8?B?V21WTytzbFdXM2VXSmE0RThUTnltUWxnMms2WlFtS2VMY25ON3o1NHVldTN3?=
 =?utf-8?B?dTkzV1JHVk90SllsVkovNzd0SDVmT0t2dk9DTktEL2t1dy9mYU5KSkhabHZP?=
 =?utf-8?B?WGRhdklUNDk0QVdSN284NjBPTm9odWMwd0VXWWtuTFNSMTl4aUI1eE1oR2JI?=
 =?utf-8?B?dXhkQ2J3RFd1SDFLODhqQzYwQ3VySStzQ3NKdlB2aXA0SnVpQnh5Zk9kS2VY?=
 =?utf-8?B?cWZuQ3FydjBPWTJSZVlSeC84OTBhWjhpbUdpOUNIOHlBYkp2dVQ1VHE1c29K?=
 =?utf-8?B?K2czOVNBb1dZQVBpMVFFSDVscGh5aFZzNVlQTklBQ29ob0VrRUN1OUlsY05Z?=
 =?utf-8?B?dTlZamY0RjNVRjRNK3doUTRHcUREeDhnZzZ2aFFsQVE2SGlYbFdiQjRQMUYz?=
 =?utf-8?B?ejdvZkJKTjdzbzhTZ3NTQzNFdmplUnJweU52QWNXZWgzNUlNZDQ1am95dmt2?=
 =?utf-8?B?emh1dXhGb3p4Z1VrYk5DYXA3c3hKNkNpWTNRZ1BSaTdGMVk1a2puNU5icVpR?=
 =?utf-8?B?MXFqT1k3UTl1T0VKTFp1UWllZlk5ZWlWcXlOOXd5aWJFRWtBbXpkbDVTUHE1?=
 =?utf-8?B?TWNOdnB5SExraVZYTTlpUSthOGZhY3lMRFNvVDFxbVk1SmhkRTMxQ2l2ZjB3?=
 =?utf-8?B?SVNSUlV1NUtXdjFhVjduSkErbEZHcGtQaTlxYnBtUFJldHU2K1FUVVpaMWhT?=
 =?utf-8?B?NTZaazVselRMd2lvNWNRZDhYcGlKanRuNUVtYkc1Mmw3RnZSTnk3K1F2MEpx?=
 =?utf-8?B?aHI1MlZQUjFKUVRSU3hvRGlzSUk4TzMrT3dwbk5NSzNVMUIxVUxJdnQ5VStt?=
 =?utf-8?B?MVY3a3l4YkNIeXBhcUdvS3dJRlJkNVE1OEl2Mnc5YXVjbEEydGJJWWd1NitI?=
 =?utf-8?B?ZDkxVlhXU3BGUnB1aHNsVElpWmc1UzcxaEZ2SElHa0NUVFprc0VReVJYeFlo?=
 =?utf-8?B?VWZzTHl2VjA0eGJ3NzBIQStNMXA0SVU2NVpaa0RGaDUxcVdrMzYzbDNkZG5M?=
 =?utf-8?B?ZHY4c3J1MXBVMFFiS3BOY29wYmhXcHlKQWVPYm85NTlGaG5XUFhqa3hJMHIr?=
 =?utf-8?B?SmcvdnBqNXZSMnkzeHJWd2U3WUUrSHJIdEJTZnBFNW1XZ1F0bUo1RzBLcVpz?=
 =?utf-8?B?ODY5bUd4Unh1aUZVclZ4WkNyWGlEV2lKMHBIVkp1Y2lveVgxWGtHVjJrb1l3?=
 =?utf-8?B?Ky9BZTlKUUdRMDRvUGZ2Z3ZNa2RzSzhVM2FPUy9nLzJPSWgxOE9aZEF0Qlhk?=
 =?utf-8?B?NklrMDVtTk1maWFKTlRhTnl1UW9WU3JUQjhJa25vbFhadCtGRjhiWEtTbFFB?=
 =?utf-8?B?MFpuMmNhMWg3Z0xic2N4bVhIdmRpeDRFRnhzVGxnWjhCTFUrV3NETm8vWWxr?=
 =?utf-8?B?SENXNks5bmJvMTByNlY3dlQ3SkliaEVyZlpGanhyNWZaaHJiR2s4VElrblgz?=
 =?utf-8?B?TkNia0ZRbnFMU2VObURHQ01oNm1Gb2JlQmxsMFJ3U1c0NG5sVW1MUmVHT3Av?=
 =?utf-8?B?MjFvOWJBdGxvQjZzcTNtUjE4NUE1YThQcTRvZkxnSFFwNTRRdjUwUW5XRGt0?=
 =?utf-8?B?TVZ3OFlndUZHdnVzdmlqWVJ4N1hXU2ZzNE9BZkVkbFM1c1NCc3ZId1dpMjFk?=
 =?utf-8?B?NXA2RlJGZ1M2S0VBNEhUMGN2Wm45T3l6YnVDMEt1azk5ZTFXUlJQbFVNRE9i?=
 =?utf-8?B?QTRLWHhBaXdYQjNjbU5nbS94UlZSNXJ6UmpZcFhjaGQ4WmplTml4a0Z4YWJE?=
 =?utf-8?B?LysvV3dDUXpqN0UwbE5wbmZyK0lmUmYxQzdXeVc5L2dUNTFWaEROdloxbnNy?=
 =?utf-8?Q?cYmWsmBmSS/WlmzJlIc2EEJr4HHO1laiQZz1fG0c3nbC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c25b2319-c7f7-44bb-61fe-08dda9b9f1a1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:03:44.6071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivS7Icx8bXpTzzDGM4sHTmSrbm2uLy4Je09A5M1c1c1gb6V8RbVJ6e92pR8oO21bQUmXrSs6EJiNZRjSEHCx6Q==
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

The FWSEC firmware needs to be extracted from the VBIOS and patched with
the desired command, as well as the right signature. Do this so we are
ready to load and run this firmware into the GSP falcon and create the
FRTS region.

[joelagnelf@nvidia.com: give better names to FalconAppifHdrV1's fields]

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/dma.rs            |   3 -
 drivers/gpu/nova-core/firmware.rs       |   3 +-
 drivers/gpu/nova-core/firmware/fwsec.rs | 395 ++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs            |  15 +-
 drivers/gpu/nova-core/vbios.rs          |  30 ++-
 5 files changed, 431 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
index 4b063aaef65ec4e2f476fc5ce9dc25341b6660ca..1f1f8c378d8e2cf51edc772e7afe392e9c9c8831 100644
--- a/drivers/gpu/nova-core/dma.rs
+++ b/drivers/gpu/nova-core/dma.rs
@@ -2,9 +2,6 @@
 
 //! Simple DMA object wrapper.
 
-// To be removed when all code is used.
-#![expect(dead_code)]
-
 use core::ops::{Deref, DerefMut};
 
 use kernel::device;
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 32553b5142d6623bdaaa9d480fbff11069198606..ae449a98dffb51e400db058c7368f0632b62f147 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -15,6 +15,8 @@
 use crate::gpu;
 use crate::gpu::Chipset;
 
+pub(crate) mod fwsec;
+
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
 /// Structure encapsulating the firmware blobs required for the GPU to operate.
@@ -114,7 +116,6 @@ impl SignedState for Signed {}
 /// This is module-local and meant for sub-modules to use internally.
 trait FirmwareSignature<F: FalconFirmware>: AsRef<[u8]> {}
 
-#[expect(unused)]
 impl<F: FalconFirmware> FirmwareDmaObject<F, Unsigned> {
     /// Patches the firmware at offset `sig_base_img` with `signature`.
     fn patch_signature<S: FirmwareSignature<F>>(
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
new file mode 100644
index 0000000000000000000000000000000000000000..e02c051a682b790b1627ace42c7aaa214b8903df
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -0,0 +1,395 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FWSEC is a High Secure firmware that is extracted from the BIOS and performs the first step of
+//! the GSP startup by creating the WPR2 memory region and copying critical areas of the VBIOS into
+//! it after authenticating them, ensuring they haven't been tampered with. It runs on the GSP
+//! falcon.
+//!
+//! Before being run, it needs to be patched in two areas:
+//!
+//! - The command to be run, as this firmware can perform several tasks ;
+//! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
+
+use core::marker::PhantomData;
+use core::ops::Deref;
+
+use kernel::device::{self, Device};
+use kernel::num::PowerOfTwo;
+use kernel::prelude::*;
+use kernel::transmute::FromBytes;
+
+use crate::dma::DmaObject;
+use crate::driver::Bar0;
+use crate::falcon::gsp::Gsp;
+use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadParams, FalconLoadTarget};
+use crate::firmware::{FalconUCodeDescV3, FirmwareDmaObject, FirmwareSignature, Signed, Unsigned};
+use crate::vbios::Vbios;
+
+const NVFW_FALCON_APPIF_ID_DMEMMAPPER: u32 = 0x4;
+
+#[repr(C)]
+#[derive(Debug)]
+struct FalconAppifHdrV1 {
+    version: u8,
+    header_size: u8,
+    entry_size: u8,
+    entry_count: u8,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FalconAppifHdrV1 {}
+
+#[repr(C, packed)]
+#[derive(Debug)]
+struct FalconAppifV1 {
+    id: u32,
+    dmem_base: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FalconAppifV1 {}
+
+#[derive(Debug)]
+#[repr(C, packed)]
+struct FalconAppifDmemmapperV3 {
+    signature: u32,
+    version: u16,
+    size: u16,
+    cmd_in_buffer_offset: u32,
+    cmd_in_buffer_size: u32,
+    cmd_out_buffer_offset: u32,
+    cmd_out_buffer_size: u32,
+    nvf_img_data_buffer_offset: u32,
+    nvf_img_data_buffer_size: u32,
+    printf_buffer_hdr: u32,
+    ucode_build_time_stamp: u32,
+    ucode_signature: u32,
+    init_cmd: u32,
+    ucode_feature: u32,
+    ucode_cmd_mask0: u32,
+    ucode_cmd_mask1: u32,
+    multi_tgt_tbl: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
+
+#[derive(Debug)]
+#[repr(C, packed)]
+struct ReadVbios {
+    ver: u32,
+    hdr: u32,
+    addr: u64,
+    size: u32,
+    flags: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for ReadVbios {}
+
+#[derive(Debug)]
+#[repr(C, packed)]
+struct FrtsRegion {
+    ver: u32,
+    hdr: u32,
+    addr: u32,
+    size: u32,
+    ftype: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FrtsRegion {}
+
+const NVFW_FRTS_CMD_REGION_TYPE_FB: u32 = 2;
+
+#[repr(C, packed)]
+struct FrtsCmd {
+    read_vbios: ReadVbios,
+    frts_region: FrtsRegion,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FrtsCmd {}
+
+const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS: u32 = 0x15;
+const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB: u32 = 0x19;
+
+/// Command for the [`FwsecFirmware`] to execute.
+pub(crate) enum FwsecCommand {
+    /// Asks [`FwsecFirmware`] to carve out the WPR2 area and place a verified copy of the VBIOS
+    /// image into it.
+    Frts { frts_addr: u64, frts_size: u64 },
+    /// Asks [`FwsecFirmware`] to load pre-OS apps on the PMU.
+    #[expect(dead_code)]
+    Sb,
+}
+
+/// Size of the signatures used in FWSEC.
+const BCRT30_RSA3K_SIG_SIZE: usize = 384;
+
+/// A single signature that can be patched into a FWSEC image.
+#[repr(transparent)]
+pub(crate) struct Bcrt30Rsa3kSignature([u8; BCRT30_RSA3K_SIG_SIZE]);
+
+/// SAFETY: A signature is just an array of bytes.
+unsafe impl FromBytes for Bcrt30Rsa3kSignature {}
+
+impl From<[u8; BCRT30_RSA3K_SIG_SIZE]> for Bcrt30Rsa3kSignature {
+    fn from(sig: [u8; BCRT30_RSA3K_SIG_SIZE]) -> Self {
+        Self(sig)
+    }
+}
+
+impl AsRef<[u8]> for Bcrt30Rsa3kSignature {
+    fn as_ref(&self) -> &[u8] {
+        &self.0
+    }
+}
+
+impl FirmwareSignature<FwsecFirmware> for Bcrt30Rsa3kSignature {}
+
+/// Reinterpret the area starting from `offset` in `fw` as an instance of `T` (which must implement
+/// [`FromBytes`]) and return a reference to it.
+///
+/// # Safety
+///
+/// Callers must ensure that the region of memory returned is not written for as long as the
+/// returned reference is alive.
+///
+/// TODO: Remove this and `transmute_mut` once we have a way to transmute objects implementing
+/// FromBytes, e.g.:
+/// https://lore.kernel.org/lkml/20250330234039.29814-1-christiansantoslima21@gmail.com/
+unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
+    fw: &'a DmaObject,
+    offset: usize,
+) -> Result<&'b T> {
+    if offset + size_of::<T>() > fw.size() {
+        return Err(EINVAL);
+    }
+    if (fw.start_ptr() as usize + offset) % align_of::<T>() != 0 {
+        return Err(EINVAL);
+    }
+
+    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
+    // large enough the contains an instance of `T`, which implements `FromBytes`.
+    Ok(unsafe { &*(fw.start_ptr().add(offset).cast::<T>()) })
+}
+
+/// Reinterpret the area starting from `offset` in `fw` as a mutable instance of `T` (which must
+/// implement [`FromBytes`]) and return a reference to it.
+///
+/// # Safety
+///
+/// Callers must ensure that the region of memory returned is not read or written for as long as
+/// the returned reference is alive.
+unsafe fn transmute_mut<'a, 'b, T: Sized + FromBytes>(
+    fw: &'a mut DmaObject,
+    offset: usize,
+) -> Result<&'b mut T> {
+    if offset + size_of::<T>() > fw.size() {
+        return Err(EINVAL);
+    }
+    if (fw.start_ptr_mut() as usize + offset) % align_of::<T>() != 0 {
+        return Err(EINVAL);
+    }
+
+    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
+    // large enough the contains an instance of `T`, which implements `FromBytes`.
+    Ok(unsafe { &mut *(fw.start_ptr_mut().add(offset).cast::<T>()) })
+}
+
+/// The FWSEC microcode, extracted from the BIOS and to be run on the GSP falcon.
+///
+/// It is responsible for e.g. carving out the WPR2 region as the first step of the GSP bootflow.
+pub(crate) struct FwsecFirmware {
+    /// Descriptor of the firmware.
+    desc: FalconUCodeDescV3,
+    /// GPU-accessible DMA object containing the firmware.
+    ucode: FirmwareDmaObject<Self, Signed>,
+}
+
+impl FalconLoadParams for FwsecFirmware {
+    fn imem_load_params(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: 0,
+            dst_start: self.desc.imem_phys_base,
+            len: self.desc.imem_load_size,
+        }
+    }
+
+    fn dmem_load_params(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: self.desc.imem_load_size,
+            dst_start: self.desc.dmem_phys_base,
+            len: PowerOfTwo::<u32>::new(256).align_up(self.desc.dmem_load_size),
+        }
+    }
+
+    fn brom_params(&self) -> FalconBromParams {
+        FalconBromParams {
+            pkc_data_offset: self.desc.pkc_data_offset,
+            engine_id_mask: self.desc.engine_id_mask,
+            ucode_id: self.desc.ucode_id,
+        }
+    }
+
+    fn boot_addr(&self) -> u32 {
+        0
+    }
+}
+
+impl Deref for FwsecFirmware {
+    type Target = DmaObject;
+
+    fn deref(&self) -> &Self::Target {
+        &self.ucode.0
+    }
+}
+
+impl FalconFirmware for FwsecFirmware {
+    type Target = Gsp;
+}
+
+impl FirmwareDmaObject<FwsecFirmware, Unsigned> {
+    fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
+        let desc = bios.fwsec_image().header(dev)?;
+        let ucode = bios.fwsec_image().ucode(dev, desc)?;
+        let mut dma_object = DmaObject::from_data(dev, ucode)?;
+
+        let hdr_offset = (desc.imem_load_size + desc.interface_offset) as usize;
+        // SAFETY: we have an exclusive reference to `self`, and no caller should have shared
+        // `self` with the hardware yet.
+        let hdr: &FalconAppifHdrV1 = unsafe { transmute(&dma_object, hdr_offset) }?;
+
+        if hdr.version != 1 {
+            return Err(EINVAL);
+        }
+
+        // Find the DMEM mapper section in the firmware.
+        for i in 0..hdr.entry_count as usize {
+            let app: &FalconAppifV1 =
+            // SAFETY: we have an exclusive reference to `self`, and no caller should have shared
+            // `self` with the hardware yet.
+            unsafe {
+                transmute(
+                    &dma_object,
+                    hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize
+                )
+            }?;
+
+            if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
+                continue;
+            }
+
+            // SAFETY: we have an exclusive reference to `self`, and no caller should have shared
+            // `self` with the hardware yet.
+            let dmem_mapper: &mut FalconAppifDmemmapperV3 = unsafe {
+                transmute_mut(
+                    &mut dma_object,
+                    (desc.imem_load_size + app.dmem_base) as usize,
+                )
+            }?;
+
+            // SAFETY: we have an exclusive reference to `self`, and no caller should have shared
+            // `self` with the hardware yet.
+            let frts_cmd: &mut FrtsCmd = unsafe {
+                transmute_mut(
+                    &mut dma_object,
+                    (desc.imem_load_size + dmem_mapper.cmd_in_buffer_offset) as usize,
+                )
+            }?;
+
+            frts_cmd.read_vbios = ReadVbios {
+                ver: 1,
+                hdr: size_of::<ReadVbios>() as u32,
+                addr: 0,
+                size: 0,
+                flags: 2,
+            };
+
+            dmem_mapper.init_cmd = match cmd {
+                FwsecCommand::Frts {
+                    frts_addr,
+                    frts_size,
+                } => {
+                    frts_cmd.frts_region = FrtsRegion {
+                        ver: 1,
+                        hdr: size_of::<FrtsRegion>() as u32,
+                        addr: (frts_addr >> 12) as u32,
+                        size: (frts_size >> 12) as u32,
+                        ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
+                    };
+
+                    NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS
+                }
+                FwsecCommand::Sb => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB,
+            };
+
+            // Return early as we found and patched the DMEMMAPPER region.
+            return Ok(Self(dma_object, PhantomData));
+        }
+
+        Err(ENOTSUPP)
+    }
+}
+
+impl FwsecFirmware {
+    /// Extract the Fwsec firmware from `bios` and patch it to run on `falcon` with the `cmd`
+    /// command.
+    pub(crate) fn new(
+        falcon: &Falcon<Gsp>,
+        dev: &Device<device::Bound>,
+        bar: &Bar0,
+        bios: &Vbios,
+        cmd: FwsecCommand,
+    ) -> Result<Self> {
+        let ucode_dma = FirmwareDmaObject::<Self, _>::new_fwsec(dev, bios, cmd)?;
+
+        // Patch signature if needed.
+        let desc = bios.fwsec_image().header(dev)?;
+        let ucode_signed = if desc.signature_count != 0 {
+            let sig_base_img = (desc.imem_load_size + desc.pkc_data_offset) as usize;
+            let desc_sig_versions = desc.signature_versions as u32;
+            let reg_fuse_version =
+                falcon.signature_reg_fuse_version(bar, desc.engine_id_mask, desc.ucode_id)?;
+            dev_dbg!(
+                dev,
+                "desc_sig_versions: {:#x}, reg_fuse_version: {}\n",
+                desc_sig_versions,
+                reg_fuse_version
+            );
+            let signature_idx = {
+                let reg_fuse_version_bit = 1 << reg_fuse_version;
+
+                // Check if the fuse version is supported by the firmware.
+                if desc_sig_versions & reg_fuse_version_bit == 0 {
+                    dev_err!(
+                        dev,
+                        "no matching signature: {:#x} {:#x}\n",
+                        reg_fuse_version_bit,
+                        desc_sig_versions,
+                    );
+                    return Err(EINVAL);
+                }
+
+                // `desc_sig_versions` has one bit set per included signature. Thus, the index of
+                // the signature to patch is the number of bits in `desc_sig_versions` set to `1`
+                // before `reg_fuse_version_bit`.
+
+                // Mask of the bits of `desc_sig_versions` to preserve.
+                let reg_fuse_version_mask = reg_fuse_version_bit.wrapping_sub(1);
+
+                (desc_sig_versions & reg_fuse_version_mask).count_ones() as usize
+            };
+
+            dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
+            let signature = bios
+                .fwsec_image()
+                .sigs(dev, desc)
+                .and_then(|sigs| sigs.get(signature_idx).ok_or(EINVAL))?;
+
+            ucode_dma.patch_signature(signature, sig_base_img)?
+        } else {
+            ucode_dma.no_patch_signature()
+        };
+
+        Ok(FwsecFirmware {
+            desc: desc.clone(),
+            ucode: ucode_signed,
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 413f1ab85b37926cdfd9a9c76167816b21d89adc..b0bc390b972b5e75538797acd6abffd013a8a159 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -6,6 +6,7 @@
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
 use crate::fb::FbLayout;
 use crate::fb::SysmemFlush;
+use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
 use crate::regs;
@@ -223,8 +224,18 @@ pub(crate) fn new(
         let fb_layout = FbLayout::new(spec.chipset, bar)?;
         dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
 
-        // Will be used in a later patch when fwsec firmware is needed.
-        let _bios = Vbios::new(pdev, bar)?;
+        let bios = Vbios::new(pdev, bar)?;
+
+        let _fwsec_frts = FwsecFirmware::new(
+            &gsp_falcon,
+            pdev.as_ref(),
+            bar,
+            &bios,
+            FwsecCommand::Frts {
+                frts_addr: fb_layout.frts.start,
+                frts_size: fb_layout.frts.end - fb_layout.frts.start,
+            },
+        )?;
 
         Ok(pin_init!(Self {
             spec,
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 032ee510646af21f26f3f46c2d54a0f812c25978..cac55d1534831775c14f3fed1e939ed89c7eba84 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -2,10 +2,8 @@
 
 //! VBIOS extraction and parsing.
 
-// To be removed when all code is used.
-#![expect(dead_code)]
-
 use crate::driver::Bar0;
+use crate::firmware::fwsec::Bcrt30Rsa3kSignature;
 use crate::firmware::FalconUCodeDescV3;
 use core::convert::TryFrom;
 use kernel::device;
@@ -1124,15 +1122,18 @@ pub(crate) fn ucode(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Re
     }
 
     /// Get the signatures as a byte slice
-    pub(crate) fn sigs(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
-        const SIG_SIZE: usize = 96 * 4;
-
+    pub(crate) fn sigs(
+        &self,
+        dev: &device::Device,
+        desc: &FalconUCodeDescV3,
+    ) -> Result<&[Bcrt30Rsa3kSignature]> {
         // The signatures data follows the descriptor
         let sigs_data_offset = self.falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
-        let size = desc.signature_count as usize * SIG_SIZE;
+        let sigs_size =
+            desc.signature_count as usize * core::mem::size_of::<Bcrt30Rsa3kSignature>();
 
         // Make sure the data is within bounds
-        if sigs_data_offset + size > self.base.data.len() {
+        if sigs_data_offset + sigs_size > self.base.data.len() {
             dev_err!(
                 dev,
                 "fwsec signatures data not contained within BIOS bounds\n"
@@ -1140,6 +1141,17 @@ pub(crate) fn sigs(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Res
             return Err(ERANGE);
         }
 
-        Ok(&self.base.data[sigs_data_offset..sigs_data_offset + size])
+        // SAFETY: we checked that `data + sigs_data_offset + (signature_count *
+        // sizeof::<Bcrt30Rsa3kSignature>()` is within the bounds of `data`.
+        Ok(unsafe {
+            core::slice::from_raw_parts(
+                self.base
+                    .data
+                    .as_ptr()
+                    .add(sigs_data_offset)
+                    .cast::<Bcrt30Rsa3kSignature>(),
+                desc.signature_count as usize,
+            )
+        })
     }
 }

-- 
2.49.0

