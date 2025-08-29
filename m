Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DA4B3AFFD
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 02:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDC410EB29;
	Fri, 29 Aug 2025 00:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ju5BGS7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEF310EB1A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 00:45:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5AC28mw6PO7IIwvRCi491mbXkkbtIB4lZFrAOl7qkyFS4rcL/JHat1OFHI8QjRz15SvQRcCC6MKwS5MqiQcEmNez054YM8Tzxe1yn3q21+9JHGsBK6dntxdqiE9u15EWuLVqMAA0OMa7zCkKafil0M/goMXiIdZsGWMTW7D8ba216zIfE//l4Vy5IwPEcGuY7E+OkDaGp2j9jTW8ggyvznXCYmcWdtpvEwtcG/vxfSG4K6Y4c95DniG7qISFrZGLj2VK0UjntwwnnrSZBt3OrLIIypL3vuXyMXx1u5EfURhbBH6KTuh8PcFszhBv0vYgj/UvVaz9aAMgwk8tI3OMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnLETSRKbtaZXnOn4Zwievfa24kAOjRq8IMlvPbByDA=;
 b=cIR07NWNhTe/WdJWl1c+z/Xmxe1RpcPdplyCv9+dF5uUNH0NBUS+n8FYvwyEdOpD4tqOu1JwAjPsJHSKM4E2ktWoXEPX26slSw6x3nz/K58AdGp81ZwKhxtO00ma/Yw11wjGQ0hZRkFebztJKY33l0FQxHVmk2RLBaM7VmjZar6aGUAvoTzJLPvtNTAvF02bTD5Gu9ebqQD5IS7WwXFnpFeo+/sIs3HxS1nM/FLMja2d211dVa2LcT1iSGRczQnZioeoAg4R0MAS1pYY9Q4x5mMvCkGWOeaEN4Kz1HIeANuyMy9/b8jMsC6k1qeZrseTtv+EUEhTxxu+8giDhe16Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnLETSRKbtaZXnOn4Zwievfa24kAOjRq8IMlvPbByDA=;
 b=Ju5BGS7mdb0JHaIs2NumSlInH8RSRXuu9onzHOrLKHJZ4Jv2ZoeXU4N3b9ZGxjAZ+w06sHMu6akmKHSciWCmAzE1YVRv1H6XLpRRdjLWukIErkhTw8psnSyYt/VmfAQ5S1wGcjL8cSFC7ztvGMGxMYegjWErxzLXLgYgFF+el7EWHfNDukqgpdu5JrGJrNr0nY8lhKNKuaYIHR1fUbfhfhTMhzlXGsBzJ7Zb86Knt8+yBFRHbN+jeXce3TMr2fphR3DBLgMiMiTeKpJUFBtTlMc3GgUEjtdBTqVU+ktM2uwhQiAsBDF36Y4ESxjacmAzSx6Jo4bSuax5G02JT1GJmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Fri, 29 Aug
 2025 00:45:31 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 00:45:31 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 03/19] clk: tegra30: add CSI PAD clock gates
Date: Fri, 29 Aug 2025 09:44:51 +0900
Message-ID: <3399352.VqM8IeB0Os@senjougahara>
In-Reply-To: <20250819121631.84280-4-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-4-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P286CA0093.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::9) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|PH7PR12MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a761649-f407-4c21-b85c-08dde6955ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmRPR2d1SnFTNFRiY2xwWTR3TVJNam1ESDZpQVNtTHNpeHZuVG5lZjJUNmJa?=
 =?utf-8?B?WEt0bWJ6VVgvdTVFTzdKVEFzNWxVVlVTalhwVWVZSU1WMS84Ykw1b1JrbGx2?=
 =?utf-8?B?NDNZRjNCMjhIeUlmbGlmbE8xUkJPWXJjRUIzeW5ueFJxVTVERmVQQVIvTC9C?=
 =?utf-8?B?MVFMRkJLRzc1WlRhQ0JjaURCOVJvVUxrdVBkd3FFR1FocjNIV1Q1L2xMS1B0?=
 =?utf-8?B?djlWS3ptSGZZWHZjNC8zV0NVVjllVHNsR1hYYkRWYUVnMWJpZzBPRldGN3dv?=
 =?utf-8?B?eWdFUTIzZUNZMU4zMUJTVXBGRDFza2RmQ0ZrdjVwb3FQL3VNT2tkTmszMnZa?=
 =?utf-8?B?NUpVQ014VG9PaFhneitCbms3djl6N0l6YnVXMStqdG1GWVlOL0tZNDNHSEVD?=
 =?utf-8?B?YXZtVmxZUm9NUXB6Q3pSQ08xa09Id1RVdVJGT0dQUWVqOEJOQ1RFMHBwV2R1?=
 =?utf-8?B?ekhxek5uQldOdzRxeEpRdXFyc25XN00vT3ZRTURUM2kvckh5dGZ0emloc2lI?=
 =?utf-8?B?VUl2UHhqdGhLVGtFTDREYTRJRUxNMU1tcjMzUUcvVW45NGdicnYyYzN5ZXhW?=
 =?utf-8?B?a3ZJdm81OE9zMjl2SzBqVUppZ3Z1QUJ5OHZqcDBibHdid3ZaQ3IxZW9ncm9N?=
 =?utf-8?B?b1RweGwwWGlUQ1FhRUhGS1NNM0htell5OXVDdjZRc0NFRG84dlZyTit2NDRa?=
 =?utf-8?B?TlFJMHpCeEE3aFd6Nm5HZ1NFaktTVFZjdjNMSFJPZXVzMkFDbld1dzlkVEEr?=
 =?utf-8?B?MXl6c3Bqb0lGaXIrL3ZPaFpEeCtyNWNnakR3OWxQRkRNTlQyZUx3SVoxZS9H?=
 =?utf-8?B?cVUzRUhNdnBMdHlBWGxheFBVWFI1ZG9HVktsbXYxbm10V2RaMjAxTzVQYUJv?=
 =?utf-8?B?K2phQytCa2t3SDBMVzVQVWlYd01yZHFnL2FVVEhOamxHakZTVGUwRkdKWWZU?=
 =?utf-8?B?K3lsaFhoRmh3TFZPbXRMaFM2VG5yUGY4VHVIZkxLbkJFd1VoK0kvUWJmN0NM?=
 =?utf-8?B?QmRCL2JaK2VkbVJOSWwwb0U2ZmYyT01xb1RjNXU5TlFXbUg5bGEwVzBSYWFC?=
 =?utf-8?B?eldVeUNONWM3Rk4vc05sQm5XTGJYNlNJRmJhZlduUlRja2RrbkRPVG1NdXRl?=
 =?utf-8?B?d1BGd0JKMlNNWXRIUzBxWVpHL2Z1UHhkdDdIckNzSk5hZDVhOFBkZG02ZlVw?=
 =?utf-8?B?TFdxbnM2dkIxYms5YVE3QXRJalorcHhJQUlZcGVIQXhXR2Y0YmNFRkRoUHlt?=
 =?utf-8?B?c3VDNGszRURkT1dYVW14dlN5Vkc0d1hYVGFOUkZId3F2Mlh5U2ViSVN4UHZm?=
 =?utf-8?B?Z3BnZnQ1S2IrOWJtb25uNHFEUndibTdpejcxMStld1hIRU02bFdNeHBleDZX?=
 =?utf-8?B?Y2NUWGtYVDIyNjlNQ21NdzBzZTNSWjJJaGRXR3dtTHFGa2JodVB3QmV6NTJH?=
 =?utf-8?B?MXcySDVwZ2ZDS0t1L0ZCOGViZnJPTGMrZlp1Zi85YmdtV0ZsYnVqN0FMenJu?=
 =?utf-8?B?OGNQQVhmZ3FnZ3RhSktwYVJ6SVNmS0c0aVV5SVpXZVhCZ3AwZFFHZGtIZDdL?=
 =?utf-8?B?S0FtTmdDMU0zYkY1ek1NTFRwOUJvY3VLT2JBajJXYlVtTldyVlgwZi9NWm9S?=
 =?utf-8?B?RkxyTW1qUDBtZjBZQVBQa3YwaEtvdHNzR1h6VStNWm1ZN3FLK3dla3g3Y2dP?=
 =?utf-8?B?VWtsalZiUEF5UFlrZU1kY0puLzR3ZVVhU1hsMTMyL3ExVW5wZ2Ntb0dhdmpY?=
 =?utf-8?B?Uzhub3ltaTdld1UrUGR2K0hmVlljTTRlQ1pUNVlOM3lNZXJXQ245clJhM3NM?=
 =?utf-8?B?dW42cG91STVraWpvVXF0R3d6QWIybzAwVzkwL3JUSTc4SWVKUE1qVEdUUHdl?=
 =?utf-8?B?SCtadU1XejBMczM4Mm1GcVhDc1VBYk1iMUFLL3pVb2dXbllQeXR5NFdjSC81?=
 =?utf-8?Q?HEvAbOLjI4VKOGCavGQmROTBvXZ4cxwV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWFuSmRWanQvSTBzcUpKd0dId25YMUhiNXExWXI4VjI0MTNRRnBTTUNDTE9h?=
 =?utf-8?B?aEs4NXVUMzgyMmpCSGFoaU1EMTZNWnlReHUycUFDMmpTVnc2SnA5Q2VIWmhu?=
 =?utf-8?B?R1QwdHpTZUUrbE52VkVGUXB5aVYrQnN6eWVnMjJ2WllRbTRWUy95eXNvVS9S?=
 =?utf-8?B?YmpJQ3R3alkxaEpsekNJQkNOc1hsNmlnSmpCNWNCd3lvRGh1TWFYamJjeVF3?=
 =?utf-8?B?d0treVVvK0tnRTZleUh6TmdISDVpQ29pSzByVzJwY1ZzVjd4TEVRWVlrSmNO?=
 =?utf-8?B?M2JtUFRXd1lwRmxyLzRaL2NFWGw5dTRiZVJObmZoU3E5SG9ycVlRNmg3dFYv?=
 =?utf-8?B?dVBFOGhMbHV3cW0wSEh5VXdjWkpXcGxHaFlrZkwxMUVsME41YUZoUWM1MmtR?=
 =?utf-8?B?Tmp5VmRJb1puWmdlSlVmNEdIQzBDS202dFhkVTFzNE5uRTNQanBpaFRTbExL?=
 =?utf-8?B?eER1cTJFd1A4UGQxWWM1K2E1MXdZQ1JSWHJEOVg1YmFUOXFEenhmU21rTGdG?=
 =?utf-8?B?RS80ditXKzNKTS9NWnZGVFExdGdxOWViZHQ5MkFoeWd3RTJyUk1wRHBwREds?=
 =?utf-8?B?NFMrajg0RXlsdWZpcEdvWHlaQTdMUkFOYXUzR2dzaGdKdUtqZWY5RjBNdUNi?=
 =?utf-8?B?Zm9nTlYvUVBqUG42TXFUWDVQR3BTcURPQmZYK05PY2JuRHFKZWdDcm5NL1lE?=
 =?utf-8?B?QkFpNnc3UDdWVHlyYWNlZ2p1QlJXaUdQbVNNNzlROFJpTFZpc2FIUEp5bDMx?=
 =?utf-8?B?Y3hFRXNkY3o3bjgxWWljL0tlcHk0Vzd4ZEQ2RWtzK1plTHJpTjRyeDlTTFU4?=
 =?utf-8?B?eFFCZ2lPSDEvRlZUSXc3NzNQY2tMNklBL2JlbEF3R1dFM3J6dDZwNWtSVVQz?=
 =?utf-8?B?UDJPUEFTeUFYdTF0bTJ1K2hQU2xOWVZWNmJ6bnlnWnBQRWI2VTUvYnoyZGpt?=
 =?utf-8?B?U1ZWTjRBRWI2WUNESWZrcHdLUGsvemNobWR6UUpGV285UzB3Wk5YUnE5dThx?=
 =?utf-8?B?N09GUjY2bllHdHhjZDZiU1N4akFpRzIvdlEwV0ZhSmdMRmdwSHdkNzJXZnNM?=
 =?utf-8?B?TmttK1g3d0tZRUZ6OVpFdmcrTjg3NWRuMURpOXgzRVYweU1aazM0VVF4Qk5u?=
 =?utf-8?B?azIwOVUrUVZoS0xmRXR4OVNrTndZY0hsWmh2ZUdiOXhHWXJFd0g3cmp6Rnp5?=
 =?utf-8?B?U3pPd0RWcVdCd1o2K3FOQUEybEFvKzl3WHpYazRHVWlUOHMzL3VQVC8rTjc4?=
 =?utf-8?B?MkVyNWtzM3ErNUhBeXRSbjRkSWZzaVRCaFUxSzlwb0xoVlpKUjhQYU9Uc1BJ?=
 =?utf-8?B?ZkpXR3M1OWxkaW9RM1JTaGl2ajRQK3llYWJzZ3JXVVRTbkVmblZZdVBUVkMv?=
 =?utf-8?B?amtjRWEwZmxZMGxCSHZmdk9Pbi9JK080akVvZVdIdXg4a2pzVjRCY3hQbncv?=
 =?utf-8?B?T0c3QWRLZGxFSnorZzI3S1RyZE9tVXVONkpiV2FSWk5TQ2hBaWFzQjJ5cDU1?=
 =?utf-8?B?TDluVkFsZTIrcTErcWVlVFV5K0x1Qlp6YUtSNjRTWWwwREw0SnZYdjBhRjE1?=
 =?utf-8?B?MGloT2tOTDJjRFExZERVMDRsYk9PK0xKT0xvV3JoRmxaeGtoUHoyak05Mzcw?=
 =?utf-8?B?ZmFpVWIvMkp5SWQzNm5OMHY4UzJzeHJMLzFSb29GYnFWUm1sUHZPdTZaeVBM?=
 =?utf-8?B?Nk82Z2M5UTJKZTV0eThYTTBBcnl3NFZlUHNIK01hMVdYS1orRjQwZmtmejZV?=
 =?utf-8?B?b0hodUpWWXplZXhnU0lGaDZveVdDZEtHdmlwM04rYkNEZzFOY3ZsNnREMXc5?=
 =?utf-8?B?Y2R1MlVPSlZtR2djMEpJck4zcEVVN05PeHhHVkpQZjlWdlRnZDF0VjBrWk5m?=
 =?utf-8?B?WVd0SmJzYWdVUzJPalptU01DYjZueEdTNU1wSnZPTDdDRFo1WTZLTDRXV2Ra?=
 =?utf-8?B?VTZHQTZlUXhKY2Vic0lxbUJlQnZ0ZlpFVkpLTndBcU5mNFh5TXUxZGIrdTJv?=
 =?utf-8?B?aTQ0TW9MUy91d2YyWFRsdjdhZHY2ODJ3UkJWWXpXM2dhT0p1clphbmwrUmtt?=
 =?utf-8?B?TmJweiszRG9GdnRqTWMyV0FIaGJUNEdlYXNreXNTOGxjVHZjUWF3Z0RTSFAx?=
 =?utf-8?Q?9MeTPj4c7I/1kReUyjHB4eaFa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a761649-f407-4c21-b85c-08dde6955ae8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 00:45:30.9019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+ANNg8O7985YqeTDNcaR6/v7/SLjsmPq1Wh5wA/nN2a6WAGRYeAMRURchNsNjLe/Iixn3XRUWrSE68DQmW8nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6858
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

On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> Tegra30 has CSI PAD bits in both PLLD and PLLD2 clocks, that are required
> for correct work of CSI block.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra30.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra30.c
> b/drivers/clk/tegra/clk-tegra30.c index 70e85e2949e0..f033eb1ac26a 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -153,6 +153,7 @@ static unsigned long input_freq;
>=20
>  static DEFINE_SPINLOCK(cml_lock);
>  static DEFINE_SPINLOCK(pll_d_lock);
> +static DEFINE_SPINLOCK(pll_d2_lock);
>=20
>  #define TEGRA_INIT_DATA_MUX(_name, _parents, _offset,	\
>  			    _clk_num, _gate_flags, _clk_id)	\
> @@ -859,7 +860,7 @@ static void __init tegra30_pll_init(void)
>=20
>  	/* PLLD2 */
>  	clk =3D tegra_clk_register_pll("pll_d2", "pll_ref", clk_base, pmc_base,=
=20
0,
> -			    &pll_d2_params, NULL);
> +			    &pll_d2_params, &pll_d2_lock);
>  	clks[TEGRA30_CLK_PLL_D2] =3D clk;
>=20
>  	/* PLLD2_OUT0 */
> @@ -1008,6 +1009,18 @@ static void __init tegra30_periph_clk_init(void)
>  				    0, 48, periph_clk_enb_refcnt);
>  	clks[TEGRA30_CLK_DSIA] =3D clk;
>=20
> +	/* csia_pad */
> +	clk =3D clk_register_gate(NULL, "csia_pad", "pll_d",=20
CLK_SET_RATE_PARENT,
> +				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
> +	clk_register_clkdev(clk, "csia_pad", NULL);

I believe clkdevs are obsolete, so we can drop the clkdev registrations.

> +	clks[TEGRA30_CLK_CSIA_PAD] =3D clk;
> +
> +	/* csib_pad */
> +	clk =3D clk_register_gate(NULL, "csib_pad", "pll_d2",=20
CLK_SET_RATE_PARENT,
> +				clk_base + PLLD2_BASE, 26, 0,=20
&pll_d2_lock);
> +	clk_register_clkdev(clk, "csib_pad", NULL);
> +	clks[TEGRA30_CLK_CSIB_PAD] =3D clk;
> +
>  	/* pcie */
>  	clk =3D tegra_clk_register_periph_gate("pcie", "clk_m", 0, clk_base, 0,
>  				    70, periph_clk_enb_refcnt);




