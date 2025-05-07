Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F014BAAE177
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E722410E7F2;
	Wed,  7 May 2025 13:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="B2/XVW6F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCCF10E7D6;
 Wed,  7 May 2025 13:53:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S8JDpj64P4FSKwFsTqIYVZEHBdJ6h2B1xIixBgGXbHkU2U0li0MKYvrIVW0dPHMbkwnc3OI7khrHJqpY28AVBDxguuGe83NsZUX/N4qrdAfrWfa/XNiH3zb6TdP/Q81D4Hk1jXAPZCIZIGmlDX3Uh11jXotGAvVlRJBjiWVMx6NWuWtDrQTvBt7xJ9FdUetfLmfgMdJxG2lQo7jCgk6vEFLZ9TceWBUSLAl8cIbW1AnZZhjg9SW1Lahg6A9HUTemXWzguCdymymB5Yu/BvkNW8nWF5yRlBHJXGov73UNsHhxdUzCRHI93WrSlr1TTqfgZ0H1jm2tc8acXJXM2ilchg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZNl2T+AC+BRz7cvNWi+bpFA3pc+UmI2tN2gF6wRBSU=;
 b=U/MTsct6JuK1ZV3YuzWNQtPmPG9qeOeKvyMdVnWNopo2Eu3/MSaYzVaUA99RynSxtRj9w0ZzsiAC34mtYgZ4Z5mXg+ycSlVRsXWThBNAZJo6qfLxvVP2o/mTf+QayOSOlQFUeV7La/7VeEeBDfHMyjiygWQcX/t1oGUUpo1Rhd+qsSXaOF9dTvJmVej4w2cNBwdURgd/bM1Q/EHlblqsVZAJVFLf9vvMXFONVPWhiiEx9uOTuwqea4zIRV7WWJ1OE7RhPpmW5jPBVjW/shX2/Ku2ScPrbeGKL3S9zI/H0zk5StyrdcZrSvQYjQUJse++VchXTiYpLMjne5AccTe1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZNl2T+AC+BRz7cvNWi+bpFA3pc+UmI2tN2gF6wRBSU=;
 b=B2/XVW6FBDakbDBCDcdccZ2CprmsQEDNTq1JcbBhiPernLv3T9z/dnO2eLorAgXgcLliF+1myCpl2HxyJcJLe6LG1Wc5YrpfCFJTu6yQMTj7yOVwA2BULBWmpVZR5+ME2qlspO7jCVXsrkSB4xsQaCQmvrwKMSUVwk1P40TrHMlYQ/+6+V1XK3YzSx7zBTcNRIcTD/EQcxBkiobtKFqykKb00ZpdJjB9wowtVy4C5eHWWErMWwQIwXCnq9Wv9lWifOyEvihaGRtbpLbAQXes8ETWxov3wQOHObBrj+b/GnYrilebco9KVOVU68Mt7ekLg+vriqyQVNwDuNFgCWaP5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB8115.namprd12.prod.outlook.com (2603:10b6:a03:4e3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 13:53:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:53:45 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 07 May 2025 22:52:44 +0900
Subject: [PATCH v3 17/19] gpu: nova-core: compute layout of the FRTS region
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nova-frts-v3-17-fcb02749754d@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR04CA0023.apcprd04.prod.outlook.com
 (2603:1096:404:15::35) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b2ca02-25f4-4492-2617-08dd8d6e95c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0JRY0hjOG12aDZGbFVxeENyc3J6cEVJYmQyUmZMVFNwdDl2TEc1T0xBdkRO?=
 =?utf-8?B?QlJRYncwMFpKQXptTG9uUW85bWdsbmZsc0NSNlJNNS9KY29id0RXZkVZMzBJ?=
 =?utf-8?B?NThEUXFocVNlL0lBS0w5WFN4Vjc4aWpNNitMVW01b0dBZk9Sb3doeGM2amZq?=
 =?utf-8?B?SGtjQ0pnSE5HM1JUdm9iNEluSnJJYlh6KzI5cndrV2R1dnQvOWNYNldYVzhG?=
 =?utf-8?B?ZHhISmc0M0daaDNqQlVHcUZiaVF2OGJNb2VXQ3A3M25udkpraXdkRUlqdGpL?=
 =?utf-8?B?eWxxeUt2b3lCT3gwZ2hKZFhuWU9kQWFPN0V3eG9BNXA4emhBcU9VSEwvenpi?=
 =?utf-8?B?RSt5TFUweVRjYjNvMS9WdXJ4SCswdER5WUY3NHN0bkE5WTYwU3BkN0gzN2Vn?=
 =?utf-8?B?Z1IxUFgvcnpVd1l1ZGxRek0yTXdBd2ZiU240M1NDWk9vWG8wOEhGVVhUSEVn?=
 =?utf-8?B?cHZRekhaSGxFYVNJYkExbnQ3bEQxYVVUcVF0WnluR3IxblFVaDNiR3RuL3dK?=
 =?utf-8?B?d3FYNGdoSE11MnFCN0tuZEFiOHNWQWZXMlJOWXVSeEt3NnRjZ0ZkeTgvaEZo?=
 =?utf-8?B?T29MVlZaRFlRTmdTYVBBUDdOZzBwYTl4MnFjaGN6WGFmU0Ura2NBV0ZzdnhC?=
 =?utf-8?B?VHBZNis3WXBoS0RWNll5MEh1SUJ6WW5wY0tMV09zQkVSc0Y5S0NYRUVVbzR5?=
 =?utf-8?B?SjM5Qy93YXBFbVM3SXoxVENPdURSS0VxRzVpTDVlc3hMbVNhSDZLRU52SmNY?=
 =?utf-8?B?dkwxSHNYRXErKzBJYXZIK2FKNjJDMjhQckprYkV3MGF3ZzVDQUNUZ0R2ejky?=
 =?utf-8?B?TGFUdVRRUmhCaFRHTkVDN2N1bnFFWEEyei9yaU50V2pmdFRQTWdGUy9hM1Zo?=
 =?utf-8?B?RGtnYTFOUzdrc0xPb1IwdXU4VGVHWE9ZTVJ6cWdDQ3Jrelh2aFdyK1JHekxK?=
 =?utf-8?B?U1l5U3RoZ3Z0b0FTREtMYUVrd05aK1J3SVk1NHNFc1gvSkk5cEl6WklZYVhH?=
 =?utf-8?B?aDh3Yk9abEI0eisxUE9qaWxQOHB1T015VWlBREsyM2dkQ3BpMlpIdjNCZU56?=
 =?utf-8?B?Q25PNTJGdG5sUkM3eXlnZ2RERU9RYlBEM0Eva2huVEthMFBNeW5NUGZhVlAr?=
 =?utf-8?B?NHZQTUVBeWJxYmpwNGM3bisrSzhZQlV1OWdlTVoxbVRGcDI4NzdwbzhDeEt2?=
 =?utf-8?B?Z3pZUFc5MExCaXBWKzdsWitnUW9rcklIeEd5bkF2VFY3SnU5QnA2WVYrNEp2?=
 =?utf-8?B?Ty9taTkvUDhTNDI3enZoOUVRdFRIVUxnVFhza0tDaDd0S2ZucjM1UUtqUlNm?=
 =?utf-8?B?S1ZHY3htek1pMzVjOVpUVnpheU5PcHdWaW94TytlSVNkYk83OHZvZ2lua0xG?=
 =?utf-8?B?eGQ2Rzc2WE1idit3Q1VLQ3ZCWTNFUEhQYUhBSjVtTEtjSkpRZjB5TG8yNXJl?=
 =?utf-8?B?UXhJWDk3RWVqVE9GTjVMcHdOaWNOOWFzNDN5OWkzV0E0RnpaVG5TZTdka05Z?=
 =?utf-8?B?U1M2UFZ6Vy9NSUVJc3dDTjdGaVZKNVdvSXFtR1dPNjV1VlRWa0ZqT2pCVGxF?=
 =?utf-8?B?L1hBUHRXRkdUUlE0RlNqZnM1RGRYS1U3ZzRxYm1FRDRURGphRHZCc3B1N1Bz?=
 =?utf-8?B?UlIrRzBza0RzSzJzMEV2Zm5wUHQvTU05SDNGbDQ5emM2MmdSMjdPaWFnbjkr?=
 =?utf-8?B?amp1K282Q3BsRUhRRzE5RHBUNThVenlyZ1FNU0xmeHJwSUFoZWh2RytlcXdm?=
 =?utf-8?B?UVplSGVuU1BIZW5UV1ZhaWdiK0h2L2UxNXQ4czdGZHE5MW0rQ3FoSkNMYmZN?=
 =?utf-8?B?OElEdU5jc3V0UUFnUzQvM0duaktneDN2azl1RmMrc282WmlBWVlSM3czbmZU?=
 =?utf-8?B?eFFoTDBub2NUN0xwKzV0RWlzdVlweEFydmJia0VkYkRSVVFHa29pWEhWaVlp?=
 =?utf-8?B?cUFLeTN3aUNtT2JRMjlsQTl4QXpMUHdzU0ZlNytkaFA3TnFVTXp3Y29ZOXgx?=
 =?utf-8?B?d1d3UDZHTnhnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFJ6bUZGUXduM0NBeWs5a0VWOE8xd0VycjMvSGxMeTd5WllYeGYyV3U5aGc5?=
 =?utf-8?B?ZVVsMnVwbFlOT3J0Y1dZQlFKZjVQTzVEcnNUeWxNZU9hbjlvQzZ1cDFMcDdK?=
 =?utf-8?B?ZEtWRk4wSVBQQ1JvODVDTlhISXgvKzZwZWdPWi96VmFhMXRqQnVYS1FQd2ZM?=
 =?utf-8?B?QjRNU2F2K2VEM2hOWmIwcFgyclE4Ykl4K3pCUlhFZGdKbWEvRWNHMVI4cFNB?=
 =?utf-8?B?MytOMzF4TmN1WkY1R0ZKN1JMUGdrckV1bStsVG5GQTRNU2ZzZzJxNVh0TDFR?=
 =?utf-8?B?UzBVRXVRYjU3Q1d0cmV6ZlEra0RNUHNTdlhKQTNxWGxvTnNMNnBxVWhDWlUz?=
 =?utf-8?B?Wjd1MHJ4NHRUVWRvdVgwRjBaQXkrcGRCN1pxQ216bExTeGxoWmFrTThqcDYw?=
 =?utf-8?B?TTI1WnVVdDBONkRGM0Fuc2JVbDJWSitQZ01wU2phMFpyTzVodndvTDdIQ2lC?=
 =?utf-8?B?SUFLTVYrRWlTRmVENUljaTJtVTAyV1JKeEFmdnMrSG5NR3JuODRHTlBQTHl6?=
 =?utf-8?B?QXAvUEJIVE9MR0pIb2s2NW4xKzNjZXpwUkZ4YW56cXNqQW0yVHMwNWlBdkhx?=
 =?utf-8?B?azBQRU80QzdBOEhWN01XTlJCeEpHMGNSd1FkMjYvaExpNGRLK3MrUUlXYVNY?=
 =?utf-8?B?eFFYY2xNL1pYVThEbzIvMGh6elhuRjZZbS9CNHFmM3lad3dyS2VvNkxFOUls?=
 =?utf-8?B?dzYvMTU3cWRFSzNVRnJyZndrWTNVV0lYNFdPNDFwME5vdTdtazlZdDIvZUVG?=
 =?utf-8?B?U1lITFV4NWZaaXNRU2FkaGRqNExOc24vb0RMRy9VeTBsNExwWWUxbnFueEZL?=
 =?utf-8?B?dC92eXF3ejJPSzhRNnZOUUVha0xYTGJUWjRTekgyRkMybUcxWDF4OVVpRFJU?=
 =?utf-8?B?Uzg1NXhla21PamxjSlBLVS93WTBPNUd3OG1BT0tjMUxrY1dJUkxabVZiZ3hu?=
 =?utf-8?B?eVNtbVE1S2JuQjFwNko0QnliREQvTUt4YlRsUjdScnEvSzFqaXl4M01XSCtP?=
 =?utf-8?B?dnNMakJ6VWUxSU83akk0TVlPZzFMVjkwWlQrNXhYNmM4cGJmb3hTS3NNTG9m?=
 =?utf-8?B?WDdwMVg3cHJqL1ZmSEc2OWJUZjZpMXpkVmprSEpXNm1Gd2NEVnNPWUlGQTFO?=
 =?utf-8?B?R2JTaFEybmlzS2h5bWNtVXhkOUgvc0dOZGhkYVhJZzdPMmpncHRYVTJUcU1t?=
 =?utf-8?B?aFV6NVBIdW96Tkw5Y1hPZ09nWGl6MURsM3U1dDR0RGFyeE16S3A3OTFtZjVI?=
 =?utf-8?B?d3VkTGZBL2NTd3RWVlFCeHpFSkVZelhDNkQrZFFobUFLTWlVOUJBaEVlOUw0?=
 =?utf-8?B?RmtCV1BHSkZYWDJIRE5Vd1F4UnlTUmlPdmV4UC83MFFaU0ZTNG16QUZQOVZO?=
 =?utf-8?B?S2hKY0FKeXNjM3NVOUd0bVAzS09yWHhOMkoxUzdUMHJNUERZbUY1bGkvZ01Y?=
 =?utf-8?B?TkV6VUNFcUJSWTgvdWdIeHh6MmtPS3Y4dGF0YVpQK0trd2RLZ3BIcVJZejBv?=
 =?utf-8?B?YlNMT0VnK2NQWGgrbTBtY2dGa293TnlqcmlnREs1dWRaRjNhMHkxQ1dWYytj?=
 =?utf-8?B?VUk1cFMwbkluUmxGeEVZNWYzWDNhcURWOEtwaWcwOHI2eVNhNlFsQk5zUU5C?=
 =?utf-8?B?ZkRIcXFlOUd2RzIrdHRlWnZReUdSSnVTT1hZWU11VWNCVnFnRG1wUUlKeXVj?=
 =?utf-8?B?UEF1ejFKcFhsM2lKcU5IdXBTTGZXQVdReHZlSnQxTjFTaVpUVjdHUXV1OVdR?=
 =?utf-8?B?Qk9BbFZMTVBqSlRSN1VnQUVJTHRjYm9yczdOZUNieXBiamlwazcxSGlES3pL?=
 =?utf-8?B?MTZvWk12S09uTDdkQXlYRHJxeTQvN0ZEcVU3eXRpRXBTWnJSMFpnTEI4Rm5D?=
 =?utf-8?B?QkdrN1V4Y1EzTjJZekt5VWVRRFhOcjRYK2ptVWt5TlBnTFh0M0toRTVlSWFo?=
 =?utf-8?B?djNibHRUM0VyczNKSUpkelB4cDJmN25EaDh4ZEtsZENqRWZJYkJrNlhrRXBO?=
 =?utf-8?B?MFhKMm5MMWhOOG1YZ2xTam5nSTlOZjJ3RWtKTm8yUzE0YlBlbG9TNkJERFls?=
 =?utf-8?B?aEQ3bUhmN0JWdkY0dU8xY2UwVUNPbVFqdUlxTG4zMWdkMzYybEgzNXM3QU05?=
 =?utf-8?B?ajByaUY4OGlORFVxbXBzbi9FMXJBQkM3ZDJFaGttWGd4a0ZzYmFTcUFlZ1Nt?=
 =?utf-8?Q?IxEDlLlJoqFNTPhclXpzatxFEvcfbFTDWx25OmekOrel?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b2ca02-25f4-4492-2617-08dd8d6e95c5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:53:45.6299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buwD8jy93oedZonZbULPUnmOVxM9zHV4uSTwthJKk6jDYrcDNAmTTEGVuXQpnll6RkqkrdNdG0Gbfz0yJImzLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8115
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

FWSEC-FRTS is run with the desired address of the FRTS region as
parameter, which we need to compute depending on some hardware
parameters.

Do this in a `FbLayout` structure, that will be later extended to
describe more memory regions used to boot the GSP.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs       |   4 ++
 drivers/gpu/nova-core/gsp.rs       |   3 ++
 drivers/gpu/nova-core/gsp/fb.rs    | 108 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      |  27 ++++++++++
 5 files changed, 143 insertions(+)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 4bf7f72247e5320935a517270b5a0e1ec2becfec..a3d96639706e808305cce66416778d2bf6e7e683 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -7,6 +7,7 @@
 use crate::driver::Bar0;
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
 use crate::firmware::Firmware;
+use crate::gsp::fb::FbLayout;
 use crate::regs;
 use crate::util;
 use crate::vbios::Vbios;
@@ -239,6 +240,9 @@ pub(crate) fn new(
 
         let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
 
+        let fb_layout = FbLayout::new(spec.chipset, bar)?;
+        dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
+
         let _bios = Vbios::new(pdev, bar)?;
 
         Ok(pin_init!(Self {
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..27616a9d2b7069b18661fc97811fa1cac285b8f8
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+
+pub(crate) mod fb;
diff --git a/drivers/gpu/nova-core/gsp/fb.rs b/drivers/gpu/nova-core/gsp/fb.rs
new file mode 100644
index 0000000000000000000000000000000000000000..f28ded59469d52daf39e5d19c09efd7bf08fee92
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fb.rs
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::ops::Range;
+
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::gpu::Chipset;
+use crate::regs;
+
+fn align_down(value: u64, align: u64) -> u64 {
+    value & !(align - 1)
+}
+
+/// Layout of the GPU framebuffer memory.
+///
+/// Contains ranges of GPU memory reserved for a given purpose during the GSP bootup process.
+#[derive(Debug)]
+#[expect(dead_code)]
+pub(crate) struct FbLayout {
+    pub fb: Range<u64>,
+
+    pub vga_workspace: Range<u64>,
+    pub bios: Range<u64>,
+
+    pub frts: Range<u64>,
+}
+
+impl FbLayout {
+    pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
+        let fb = {
+            let fb_size = vidmem_size(bar, chipset);
+
+            0..fb_size
+        };
+        let fb_len = fb.end - fb.start;
+
+        let vga_workspace = {
+            let vga_base = vga_workspace_addr(bar, fb_len, chipset);
+
+            vga_base..fb.end
+        };
+
+        let bios = vga_workspace.clone();
+
+        let frts = {
+            const FRTS_DOWN_ALIGN: u64 = 0x20000;
+            const FRTS_SIZE: u64 = 0x100000;
+            let frts_base = align_down(vga_workspace.start, FRTS_DOWN_ALIGN) - FRTS_SIZE;
+
+            frts_base..frts_base + FRTS_SIZE
+        };
+
+        Ok(Self {
+            fb,
+            vga_workspace,
+            bios,
+            frts,
+        })
+    }
+}
+
+/// Returns `true` if the display is disabled.
+fn display_disabled(bar: &Bar0, chipset: Chipset) -> bool {
+    if chipset >= Chipset::GA100 {
+        regs::NV_FUSE_STATUS_OPT_DISPLAY_MAXWELL::read(bar).display_disabled()
+    } else {
+        regs::NV_FUSE_STATUS_OPT_DISPLAY_AMPERE::read(bar).display_disabled()
+    }
+}
+
+/// Returns the video memory size in bytes.
+fn vidmem_size(bar: &Bar0, chipset: Chipset) -> u64 {
+    if chipset >= Chipset::GA102 {
+        (regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_42::read(bar).value() as u64) << 20
+    } else {
+        let local_mem_range = regs::NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE::read(bar);
+        let size =
+            (local_mem_range.lower_mag() as u64) << ((local_mem_range.lower_scale() as u64) + 20);
+
+        if local_mem_range.ecc_mode_enabled() {
+            size / 16 * 15
+        } else {
+            size
+        }
+    }
+}
+
+/// Returns the vga workspace address.
+fn vga_workspace_addr(bar: &Bar0, fb_size: u64, chipset: Chipset) -> u64 {
+    let base = fb_size - 0x100000;
+    let vga_workspace_base = if display_disabled(bar, chipset) {
+        regs::NV_PDISP_VGA_WORKSPACE_BASE::read(bar)
+    } else {
+        return base;
+    };
+
+    if !vga_workspace_base.status_valid() {
+        return base;
+    }
+
+    let addr = (vga_workspace_base.addr() as u64) << 16;
+    if addr < base {
+        fb_size - 0x20000
+    } else {
+        addr
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index ff6d0b40c18f36af4c7e2d5c839fdf77dba23321..202e978e56f024de3ae8b178e65b63c2cea244e1 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -8,6 +8,7 @@
 mod falcon;
 mod firmware;
 mod gpu;
+mod gsp;
 mod regs;
 mod util;
 mod vbios;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index b5c6eeb6ed873a06b4aefcb375f4944eb0b20597..15ec9b7e69694ff198b5353d562fc1aff5eefd3f 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -53,6 +53,12 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
     23:0    adr_63_40 as u32;
 });
 
+register!(NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE @ 0x00100ce0 {
+    3:0     lower_scale as u8;
+    9:4     lower_mag as u8;
+    30:30   ecc_mode_enabled as bool;
+});
+
 /* PGC6 */
 
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {
@@ -64,6 +70,27 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
     31:0    value as u32;
 });
 
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_42 @ 0x001183a4 {
+    31:0    value as u32;
+});
+
+/* PDISP */
+
+register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
+    3:3     status_valid as bool;
+    31:8    addr as u32;
+});
+
+/* FUSE */
+
+register!(NV_FUSE_STATUS_OPT_DISPLAY_MAXWELL @ 0x00021c04 {
+    0:0     display_disabled as bool;
+});
+
+register!(NV_FUSE_STATUS_OPT_DISPLAY_AMPERE @ 0x00820c04 {
+    0:0     display_disabled as bool;
+});
+
 /* PFALCON */
 
 register!(NV_PFALCON_FALCON_IRQSCLR @ +0x00000004 {

-- 
2.49.0

