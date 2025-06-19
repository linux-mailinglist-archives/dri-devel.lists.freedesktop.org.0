Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0E1AE0714
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA8810EA4D;
	Thu, 19 Jun 2025 13:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="odK9SSu/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB67F10EA4B;
 Thu, 19 Jun 2025 13:25:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbvoLxW3Rng9BwxZOYn3BK+GLUzVzaCnApgsQE7jTAg1HUl8+FM0x8WyNvMeMZsRwPRKXEshwbXlESLXIU0Mvir5nF6NBCl5luRJraZmf3N4+oZFkEi6wVSZfIB/JzEaZYpYlbD3TbisQtI6Rj/awn1+Vcn2U81bq/dMrBfyWf3oXOikjcdeVv8TTEqA/OJAnJXg3D9vO4VarGd8TCjrGfpyxAHWJilAnxKerjfaG0mThe2xBimVKfViVJH2tfa4G//v/yu/PVu022mKArAcymr21aSikGqqYISSio1rjBJrOwHbkT7k2d5cr7E6IGs4d5fnR5RE6OHStzU+4jhVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUhl2x57Axfe0BTU+wWM1TXJ+n5BroSmXFQgtRQBC9s=;
 b=QS4tOltBcus7WOmFV37hrtM2c+25NerT2cilQCnxMIbe39mVmMCsbwG8L6OxQgUJUGX4kE3BKqTyTOaJ1YZsNlXvVO7xm2vvxG7Br6eZ+dPWDwzSv3h0yx8wr+0yaSYs2s470HThv3kfpfEoDIPFFouJlfGa6QLzhJy9g+TP4Mc5ILwd3xz4gcCal3YzLpxpEh8+vYaIZRSlA8vyAq5tWYuu16KPRgMN6u2eOkJux84Hw/wFwMPgaEQxsdFZBGJa0MnUblmvcGesvQqalJE7666jzCQ3p421KH/t4VZ3HmE93sXzO/TOeAM20D/TaVeEOa1+ivvEX8a+5RRVCMPzsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUhl2x57Axfe0BTU+wWM1TXJ+n5BroSmXFQgtRQBC9s=;
 b=odK9SSu/oBSHb580F7R12k0EuPEg0vuXuxf2PqlsrhW6LPnUOHlHOoalDaQqWHN7hl/AQkJuFp8DLE0bybQR3GtYbk9FvgUlrjnZDwXmbEXjFNT6EiXCWdF4UA6ii5NbypkLAUE2BKoZ27sTt10qWVBD+xDOGXKZ68Zbj613DQJMjwKETQX0m30UqHn63s+MkP03XMgSL4VrU+o1UYaasvSily0pFw3sQGil54MEwwDU9g78/ZuXeN+oFdPNwwR69uWo2cCvObw4A1OCuzoFTK1EClZYosPHJU+71x9RejCZCB1RSMgPmPo2GG6z33GD1FrU+p5ZVAHKuCzJ4hlaAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 19 Jun
 2025 13:25:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:25:18 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:23:59 +0900
Subject: [PATCH v6 15/24] gpu: nova-core: add falcon register definitions
 and base code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-15-ecf41ef99252@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0173.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: d6bb1ecf-6648-49c9-a699-08ddaf34bbf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGxxOGd1UW55dHplMzVIUXYxWmVtcG5FbVNiOU1wKytTUkoxVVpoVjhiUE0z?=
 =?utf-8?B?MEdXTXFJNkdwYzF2cTR6ZzNhVzA2VHBlRVVLRFRuN0JzMnJxK2xZSmlWWHRS?=
 =?utf-8?B?YmZpVlkwUm91K2c5QlY0eStwYXRqT09NQVhJSG92dXU4N0lGZ3RUTHpJTXgv?=
 =?utf-8?B?U3RWeWJ2bnF2TTJOZnJWdjFwRWtpdGs4NldnQVJtTEpOajFSZlU1UlFvTzc2?=
 =?utf-8?B?anhYRVZMeXlCNlJScXh1U3lYdHpueG1ZRzNqRW9VbFo3Qm0wblQzUlFGQjJC?=
 =?utf-8?B?V1JUMDBENG9lL3QzbWdZdk5ualhXcTJ6a3o3Uks5cjlOV05zQ0dGNUl0NU1j?=
 =?utf-8?B?QTJnQThhemxsMjZXd1BrQm5iT0R5emwrN2pNZHRqTHFzVDBRVE40WEVyc3dW?=
 =?utf-8?B?K0VUcXVsWWpnckVrSlMvdTU3dmxjWnFiTWJBMG4zS0tHNjdzUW1kQlF1aFAx?=
 =?utf-8?B?dWs1cVQzSStLNXUxdlpvbXBBbThtZ29nNld6U0RwcXVvODViYXZ0bjIvTzY3?=
 =?utf-8?B?aExFT2VDTjUvbnNJckcxZkNyZmNtUlNiUjl1M2Z0UzhUbXNsdnFCQXJ1Yi92?=
 =?utf-8?B?Mmc1Q3kzSzBKbU5nWkZHeVFvYnNlQkVyKzZkVU9GS3ArdFZyOTlrUElaY0Ji?=
 =?utf-8?B?cUdSYVdEVWNWLzdGTXp4ejdCVXZ6c2tDSzNQUjNqUHRuUldJZ0I3bnpNUmEw?=
 =?utf-8?B?SnpVbHB2Znplb2xQTTFxM3pER2dhdUlvQ1d5bE45V2tXU1BHeTFkQ3h0OVJH?=
 =?utf-8?B?ckFQVmdVbDVLTUdpUGVCWmlCMVN0YVFUelFPZy9OZVhhQVNyTjRjZExkcHNs?=
 =?utf-8?B?RW1OTmV0LzdBRUk1R2hqRk56L1B3cEl1MldRZjJlSiszTkFCUDc1VG9xUDM0?=
 =?utf-8?B?akwrKzB3UXB3MVl5bUM0SnhYRTR6bVlrSFpHWi9BUkNFTkFhYjVmanlxYzQ5?=
 =?utf-8?B?dWlSL2JOWmZTenlIZUh4NDg5WHNIR2lmVHdWc3F3S29uSGdVb1hPZUtPMnFX?=
 =?utf-8?B?d2I3cm8vcndLYUt1ektraFlEVURmRTJVZjlNVUJJU3BGYkZqMzl5NlBqN3pa?=
 =?utf-8?B?aTg3ZTE4UGZ2QmFrVUl0WFJDMUIzamdSek1pUWpGYlA0YThoRDBuNnZiTlVH?=
 =?utf-8?B?Wk1nL3FwTHl5dmxLWmd5RFh5ZlFVd0lSMkdlWXdqOGE5S3BLQktESm5LbUZG?=
 =?utf-8?B?eit0VEkrQXY5dVBvMzYzdmcwY29ielN1Y1liaXFCMXN1Q2NlWnhkZmRJTm55?=
 =?utf-8?B?cE45K2NwVkhCMHJ4ZEhKSEZVYm5IdnB2cXZkZFA2NWYwWm43WDVoTWMvbzU4?=
 =?utf-8?B?K3kreFBFVzgxMCtkc0JRdHlpdUx4ZkpmaUQ4WGxwV2JoVVlwelp5WlQ4NVVD?=
 =?utf-8?B?ZFBYKzV2S3B4dUZMOGwvS05GSnN3ZVJtNmlIL1UyaFJYOHdsdzA5WUpSV2RK?=
 =?utf-8?B?R1lnQUNjSmR5MkF0SElJd3NvUzJJa1Qya2hKTWU4Q09FYldpak4rMlpkNGVi?=
 =?utf-8?B?czMzY3Z5bFhXQXI3cURNdW4xRXFDcmZSR0grcVN4aTd1ZEgrZmVuZUtNbGRn?=
 =?utf-8?B?K3BFNVRLbzEvcENIb3E3QkROOTF3M28wRVI4bkE3bjBaWnJiNy8wOFkrSDI1?=
 =?utf-8?B?UVFyaE1MOHRXWTlwejQ4SWplR01rSXkzYVl3RGoxQ05Ia2M5YVo2UUdXZHB3?=
 =?utf-8?B?QjlNdS81aDVPalljdFBGczNjWDYxbzZDaGdPREtzWEZZR09mSng2VEV5OHI4?=
 =?utf-8?B?V2Y1K2NJQzdGTGlkd0JXUlFWVXRtUm0vN3NPT3AxbWFpdVFqQ3J4Q0Q3bDJU?=
 =?utf-8?B?SGpJUkc3U1FZNmMzYUJQb2I1Y1dXWnF1cVg4YkJtbk1NMjlJUEQwcnJUekEr?=
 =?utf-8?B?V1NBYUtVQUdZSmFNZ1QvMXZkek9seVZKNGFUTTliNTZiTjUwSkt3dnVNV3dw?=
 =?utf-8?B?elhSUkJXMXJBZ1NPNDJYc0JQa2ZyRndLNFAvTU93VS9mRzBEUEtGMlExTVR0?=
 =?utf-8?B?b3k3OXBKV0hBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzJ5VmlzeW9lL2M3U25FYnVCdU5hZWhqQ2cweGlRS29wSkNnM0pKMHVTZm1w?=
 =?utf-8?B?eEVwbSs2WXVPN0UrUXRPMHh2b3BueGZPbEdKbGtlN09TRzhhcGh1VVppU2lP?=
 =?utf-8?B?RklwT0taV0VpWm5lZDlyejF5NmdONDYzdlVkbmRaWXVqLzZ2UkRmdlEzWkdS?=
 =?utf-8?B?TXVoOVlzVjlDbkR2WXh6YzVlVDNHaHVyWXAxMXhTRnB6NkRpaElqNjJFbnh0?=
 =?utf-8?B?MHQ3WjhHMGYzWlMwaUdzQnlrbWxRUWpYUnBadUN2bDQ3MHV4djJEMHNKNW9W?=
 =?utf-8?B?OFZRZ0JOL1gzK2Z4OFIxb2N1Z2ZIQ3hWRFE3RjEzWjVldUpwL3VQaGw0TDRB?=
 =?utf-8?B?VFU0SzNNM2hSTWdhWW5XY1NVbU5oUEFnZGV3dHZ1bzU2cmEzb1hPRjhjVURO?=
 =?utf-8?B?cTg2VkxTKytjVEpZSDZ4dlI5d2QySWpEaG13M1lzSUlwK2d4ZWcvdlJ1ZTRy?=
 =?utf-8?B?cEN4aHhGbVZqd1pBYzZ0T1o2SkJPeTFXOE5CSlkwMFJXSEE1anRRL2lKT2tL?=
 =?utf-8?B?UnFHeWRKR2lJOXVzM0RWVk1YbldqdytKWVhpbzFzRGplSEZYc0xIQUg0TVhw?=
 =?utf-8?B?ZVBSY1MzZVpYeTVMVHowM0d3RzJMSFVhaWZKZEU4OHBwS2xmUE15NU5qK3hw?=
 =?utf-8?B?c281N0dnWExrVjdTcTgvSEJES09TREpjMjhnYVZ3cTY3UDlFSWdONDh0U1Iz?=
 =?utf-8?B?aXJxeEZGN3NERFlpUFFHWVNFWHU1V3o3akJWbnNsME1JcnRJbjE0bE8ydW1w?=
 =?utf-8?B?Qk9SRTdHanE5ZGdMMWNRUWorR0N0bDRhU2RBTUhoMk52Z3ExbWpreWJ0WkNh?=
 =?utf-8?B?ZzR6MTEvUk9lZVg1clRsam1UTXlUMnJ1R1o3cGxSVk5KbUNydWkyaTZ3MUd5?=
 =?utf-8?B?UDFpMmFXcDg0dVRBNXRnVjJOcW80ZGIwVjNvVlhRcjRhbU8rWFY0UHJtM3lZ?=
 =?utf-8?B?R2F1U0tpSzZLczkrWFRTSEw5MG1COW9xbFk3eW55ajJLSFg3RWFyNUxhRnE1?=
 =?utf-8?B?Ym15WjVlcXpHU21NTzdmYVNmY2xiaUN3Z1VMcUt5S3hxeHpnUnRnb2s0Z1R0?=
 =?utf-8?B?cGVKczV4aDFFclQvU2hPdGFJbi9QMTVGeGtJSmRPSVZ3bm15aGJORG15WDJD?=
 =?utf-8?B?cUNHWVpCOUpNU2lKNzBlOXdxWlhXdzJEL0M3ZDlkRXJZU0FBR1JNOTN5ZFll?=
 =?utf-8?B?VGlycjdaU0lDNjlJdXlkazAreHhHazFFNHAxelRBRDE4NXl0WmV6MDIvMUd1?=
 =?utf-8?B?NHI3aU4rQkJGVElIT0IxVmZIVEdTaGhmaEc1Wk5PTUJzTmZKUlN5TkduS2lD?=
 =?utf-8?B?U3ZNSXFVRStCRGtMdHZ2ZW5BbkFWcHhCMGlkUy9ROUNZZytkZjl1YVJZcE5L?=
 =?utf-8?B?bHhDVG12c09SWmdDd2xzOVFzd2RFMCtBbFRPK1Q3VGwxZnVPVm4rUlNnZ2hZ?=
 =?utf-8?B?SGJ6WGROQWFOWEZ6SFpYY0dmZ3YyaHdMaDhhUXRWQjdLaFJ3dFBSYmdPbi8v?=
 =?utf-8?B?RzNBYWxTY0NIWXdWNWVVdHluWnlFUnN5bmF4bHVyN3ErNWVrVU5DRm80ZExa?=
 =?utf-8?B?L2VLUjJTdkJ0RkFRUTlnSEhTNkhXZCt3Z05PMXpQVWp2NXU0b1k1dHRseklz?=
 =?utf-8?B?RWFlVWQwMUU2TFRYQ1pkTU8wQmx5dlAwekl1WXI3MzJuVjVEbTZxc0daQlp6?=
 =?utf-8?B?d295Z2N1ZjkvUk5hbGwrcUIzR2t1WTluSGt6bnBuWnUrVHJqZ3ZqaHdjZTU2?=
 =?utf-8?B?RVFrVDN6OE0vU08wSFZSbEJGVEZiNGYxNWJ5OUdNTCt5WVlqWURPR1VGVUkz?=
 =?utf-8?B?bUF3aUxZNDJCcjRIZlg1UEgrT1hBa296dEhkb1gvMmhVbHJuWmFqUkx4WlRs?=
 =?utf-8?B?L1B0WEZLcnVsSi9lVC9GWFIrNjN1ckZaQU1icEduaTFERlJ1M0Z1QzdvQkk4?=
 =?utf-8?B?NUJDQlorbXhUanpNNUJTQm9YWUJpYUNBN3BqdlRLaVpUby9HYjh4ME9SRzhP?=
 =?utf-8?B?bzBuWWk4bzlkUmMvaW1xZjEvVnplTjN4NkUxUUU1U2ZkWXdYTHMxSkxqRUxq?=
 =?utf-8?B?YVg3ZkRlTyt5QlphUWJzZi94KzUvME9EVTdNSWdZaEFvTWFJZXJscE5rY0ZE?=
 =?utf-8?B?STFnWWZ5Qm9xN0xHS3FPRXNrV2p6R2JJV3lMeU15bkhiZFRyZ0szRUgzemJU?=
 =?utf-8?Q?lWCjC2EAf9k8o/bXpdcSFaFU+hTEaOy7RpKsHhOC3Qya?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6bb1ecf-6648-49c9-a699-08ddaf34bbf4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:25:18.5770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeJ/68oBnwa3Sose3uvW/748hJlJEozvh6xqYSnwSNVPy+t+j53z2tRWRfm5M7lq/zXVeBIQsI6h+n4+WGn31Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353
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

Thanks to Ben Skeggs for pointing out an important bug in the memory
scrubbing code that could lead to a race condition and ultimately a
failure to boot the GSP!

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 551 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/falcon/gsp.rs       |  24 ++
 drivers/gpu/nova-core/falcon/hal.rs       |  54 +++
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 119 +++++++
 drivers/gpu/nova-core/falcon/sec2.rs      |  10 +
 drivers/gpu/nova-core/gpu.rs              |  11 +
 drivers/gpu/nova-core/nova_core.rs        |   1 +
 drivers/gpu/nova-core/regs.rs             | 146 ++++++++
 8 files changed, 916 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
new file mode 100644
index 0000000000000000000000000000000000000000..ba14cb24b80db89901191000a617bee683cbc060
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -0,0 +1,551 @@
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
+        // TIMEOUT: memory scrubbing should complete in less than 20ms.
+        util::wait_on(Duration::from_millis(20), || {
+            if regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE).mem_scrubbing_done() {
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
+        // TIMEOUT: falcon engine should not take more than 10us to reset.
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
+    fn dma_wr<F: FalconFirmware<Target = E>>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
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
+            FalconMem::Imem => (load_offsets.src_start, fw.dma_handle()),
+            FalconMem::Dmem => (
+                0,
+                fw.dma_handle_with_offset(load_offsets.src_start as usize)?,
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
+            // TIMEOUT: arbitrarily large value, no DMA transfer to the falcon's small memories
+            // should ever take that long.
+            util::wait_on(Duration::from_secs(2), || {
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
+        regs::NV_PFALCON_FBIF_CTL::alter(bar, E::BASE, |v| v.set_allow_phys_no_ctx(true));
+        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, E::BASE);
+        regs::NV_PFALCON_FBIF_TRANSCFG::alter(bar, E::BASE, |v| {
+            v.set_target(FalconFbifTarget::CoherentSysmem)
+                .set_mem_type(FalconFbifMemType::Physical)
+        });
+
+        self.dma_wr(bar, fw, FalconMem::Imem, fw.imem_load_params(), true)?;
+        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params(), true)?;
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
+    /// Runs the loaded firmware and waits for its completion.
+    ///
+    /// `mbox0` and `mbox1` are optional parameters to write into the `MBOX0` and `MBOX1` registers
+    /// prior to running.
+    ///
+    /// Wait up to two seconds for the firmware to complete, and return its exit status read from
+    /// the `MBOX0` and `MBOX1` registers.
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
+        // TIMEOUT: arbitrarily large value, firmwares should complete in less than 2 seconds.
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
index 0000000000000000000000000000000000000000..b233bc365882f9add9b6eab33b8d462d7913df37
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
+    /// Activates the Falcon core if the engine is a risvc/falcon dual engine.
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
+    /// Program the boot ROM registers prior to starting a secure firmware.
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
index 0000000000000000000000000000000000000000..0a4e5e7adf8cbcec9f67bb09ba758a9cb2887bae
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::marker::PhantomData;
+use core::time::Duration;
+
+use kernel::device;
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
+        // TIMEOUT: falcon core should take less than 10ms to report being enabled.
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
+    // TODO: The ucode fuse versions are contained in the FUSE_OPT_FPF_<ENGINE>_UCODE<X>_VERSION
+    // registers, which are an array. Our register definition macros do not allow us to manage them
+    // properly, so we need to hardcode their addresses for now. Clean this up once we support
+    // register arrays.
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
+    // TODO: replace with `last_set_bit` once it lands.
+    Ok(u32::BITS - reg_fuse_version.leading_zeros())
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
index b599e7ddad57ed8defe0324056571ba46b926cf6..a2f449eb08b5691aaa6f2f0e7635791838996806 100644
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
 
@@ -72,3 +76,145 @@ pub(crate) fn completed(self) -> bool {
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
+    12:12   mem_scrubbing as bool, "Set to 0 after memory scrubbing is completed";
+    31:31   reset_ready as bool, "Signal indicating that reset is completed (GA102+)";
+});
+
+impl NV_PFALCON_FALCON_HWCFG2 {
+    /// Returns `true` if memory scrubbing is completed.
+    pub(crate) fn mem_scrubbing_done(self) -> bool {
+        !self.mem_scrubbing()
+    }
+}
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

