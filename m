Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CF1B37FDB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 12:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3949410E0F5;
	Wed, 27 Aug 2025 10:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="q9I3Snjc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DFF10E0F5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 10:27:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5r3vm2YcNFcw7wpNDmfzUaFDPnM+grS2N6arROFW1G3LUnGNFi1MPGvILBP5/icUY+R4HiE/4+fuy2bUK1MpVm9OVyWvg5/5YFlyQP5lAzlK24JNPto7ANSkvzYB82lgNJegezqT8xO4D3RkntLZNewBXai0u9phTzRfWlxfD7n/kTwlDAdEY0gQiypPm5SuwDl0DhXiFWLX1TsbBtnJ1zwgHkNlVy8NREtpj1hqoMhodFPDTZZoYChmjkM4odD+OscARsJ8Ty8CVrMon19QJ50tjd+msfL0o2O22eVvof66TtTNND3oWSw3vdF+yOhr9TcCEglnnUTa61nHs+hCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmVJ312u/R7aDtNdoP46jgUjs4Em7dHrbwbbKZnItBA=;
 b=NvBU67hbgA70Oiv6+6CmRTr7O7oIZPfVl8JWA8EAEubska+GyVnF4A4aTJ8HiKZAWvH2/dcpDmix+J0QAFIZMdlbwdefHGGInl1HvVlGjL3IjLq6pu3Nd0rchwWi3ZoS8iB1ZkxPfgV//q5NEsiv/Lj9+kz35KJbg0tOWa069bMIS1SoB9qn9WJeINcZ85saWqjj0mFpyjcRbMkn3ISrr1uzsiLgiI7k73hiONRWa4OEtUYSIEFzLR5erL5Fb6hn0JtPdvepKazK/wiFswi+2/cbjiPUhwHYF9Z8gSRjfGek2rh4ui/857HGkjVp1+bry0FOJmr83ehUU8fPAcRdAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmVJ312u/R7aDtNdoP46jgUjs4Em7dHrbwbbKZnItBA=;
 b=q9I3Snjc4U0gzkxsqlTfeNM0j+6GAyn986MMbBpX9b/DQbquzhkDoou+nu48FmQqGkXcqNmbs/VY0yDEh+Ia7LNgXh/NcwJxA/eMMyrBJmVkdIrUcYQeVT99oGMehnpxLA9p0Qj0Ybj9c8bDuJ3epsHBMrBTX5NRRHGux0+dt2cQjLdq9flOd9mK1JDM9TO/GKls5ybynVr+JI6IO8CYwdyPCVQZ5wINxL9u7r5GLNKs1ZbHGl2G2ofKtirl6TzhGzosS9ye6lBqtrhH6PGqcs2sOGhdWZ7UxKeer9zFBaC7KvStfyhvYPEs9WsfSWPv/JVZoIBc9JVcrK6nGYKDNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 DS7PR12MB6069.namprd12.prod.outlook.com (2603:10b6:8:9f::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.20; Wed, 27 Aug 2025 10:27:29 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 10:27:29 +0000
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
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>, Svyatoslav <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 02/19] dt-bindings: clock: tegra20: Add IDs for CSI PAD
 clocks
Date: Wed, 27 Aug 2025 19:27:25 +0900
Message-ID: <3173051.CbtlEUcBR6@senjougahara>
In-Reply-To: <268A6593-1FAC-4A4D-925A-801FB6FEE9F6@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <2451218.NG923GbCHz@senjougahara>
 <268A6593-1FAC-4A4D-925A-801FB6FEE9F6@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::11) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|DS7PR12MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba899c1-3cf6-44f1-0df4-08dde5545323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eU8xZ1dLYUdNWjEydGxGNTlDSFRFVllMNmpBOWZrTXZjajNKdWFNclNOS2lS?=
 =?utf-8?B?My8yZ21RNDFiNTFxeVFHc2JURStXQnkvVTdmZlJKeGw2cjRjdm1SaVZMeURs?=
 =?utf-8?B?UUJqeFN2b1RNaG81Q0ZrZWhHdTZZUmcwTElRdDhUZXRNa3BvVlp1ZGdSak5T?=
 =?utf-8?B?K0twZWU1U21aNml4S2RoOXNQNlYyMGJwalBIdjVRWEdLdm5kNEdzbmxkMDRW?=
 =?utf-8?B?Szh5THE4TVZ4S2I3NjdVNGthV1Y4VzI2SGtpSTJibjcrUElyU21xWThkZ0FS?=
 =?utf-8?B?M3Y2RnpRTjRMdUlnb0MzdDQzSjhRZkNpcjl2WTVzaUcvTmczUUFXbitiZlBV?=
 =?utf-8?B?NmdjSVRDZUtTcDMyRXNmaElUVENzY0dkSUQ3ZzdWY0syQ0ZUeUhidnIyS2w5?=
 =?utf-8?B?WndGTzhMK3NkMEFRbmdvZTg1UDJ1QldMR3ZMMGV0UGQycnVlSktNSi82cEN4?=
 =?utf-8?B?VjJSUlBMTysreEhZbkF1NDFNYUlmL1ZjWEl1dWZhSmZ2QktueENEMkpSbkdU?=
 =?utf-8?B?dnBUNit0YnJlaFowMnEzQlpxQkFpZVpLL0Zkc0t1VXpJUldYQ2dIUEkrMDZv?=
 =?utf-8?B?cDBIUFdqUy8wcmlqRkZJTDZQODVSNVB0cytOblNCcnYvemg1c2h0RE9tWHFU?=
 =?utf-8?B?aUdlTnhTOFRmTkxZWkU4M1VMckVQYWRPUlB1V1Vldkx2YnlvUkRGdHV0Qm5l?=
 =?utf-8?B?Zm5WczBvZ3ZTSHhLYytQeGFPKzFsU3hIV2p6UEU3ZUNTNDlTdE5VVWcrWTFD?=
 =?utf-8?B?clhJN0dXLzVjVy9OdnBieFpuZ0NTMlRQOU5USVovME5VSHh4TCsrM1BRZXc3?=
 =?utf-8?B?ZGl5ZjBEQUx5NFZDSWJFNWVTRkg2OXNSUjdxSi8wOHBucGtaMklEUk5VNXR2?=
 =?utf-8?B?bGtrUGNIbi9pU21BWFpKQ3BRaWVEMHpEU2xEczZ0dUFTMGFCTW5jSmZPU2pt?=
 =?utf-8?B?VkpxNXRtUmpTQVpIVnVpMlhRaFFyUGZZaTdSeFRuYktnUmFYYTZnWGFYeWdE?=
 =?utf-8?B?cSs4L1NMTG5zUkpxTUx6MmhkWnA3cFl5dC9NM0VhaTdacitGMG1PZEd5N2c5?=
 =?utf-8?B?cUJWdDhrcWlFS2xFVWFhU1pQdkVQK3VlVnAySitTUWllWnVhTkZWTXk2YnFW?=
 =?utf-8?B?YVlNTUxJclBpL1FpVjk2N1pVcEJhMGZZRURuRE9oYjMrTGprZnZ2NDNWaDdv?=
 =?utf-8?B?MC90T0pwYzhvNXlUdnl0b200SW95Tk16anlobXVFUDJaemVzcmZJZ2JaQ2li?=
 =?utf-8?B?TU9JVmFwdWxNYmdTQWdHcE9uRkdJUDBoSkNBMU1ZdUg1Tmw2NHBDUFBoenNh?=
 =?utf-8?B?TGdqbUo5cFdMVnprSWlUcUhRR3NGT3dkNjV6d2JYRjlZUUdQUWV6dk1KNGJG?=
 =?utf-8?B?MDF5WnlQT0pIL0V4ZDhNWUJ6OE03NFlTeGR6QlBCRFZvR2x6WlQ5WEQwak1k?=
 =?utf-8?B?RzdIeGt1Z2FQY21sTXJ5cHVpa0M5b0NFdTQySmNncVMzSjR3dk5ubGhCSTl0?=
 =?utf-8?B?RjAwcTVGOEQ0R2wwaDNUS21LY0lDcXQ5bkcvVm9ONWVRNHJKQU9hUmRHYjBO?=
 =?utf-8?B?WmFQei9hZnNHM21pV05xZkVlU2l1SXFERW1FSjg1YndlekltenpKRFNyYk1j?=
 =?utf-8?B?YXlHbjVlQjgvMEJwWTNCQThNQ3JQbnY2MW9VekFSVlRXMFArWjVaSStOeVkz?=
 =?utf-8?B?K0ZnUWMwREtzT0VEdGN5RUJqblFrMzZqMXpZTXIzUlg1Qm5BMnkvZ294TW1s?=
 =?utf-8?B?c0d3NG1EbUVwamRGb29XWFpSa205WmxmendaK0dDY2E1YlNvS01EeDVYclJa?=
 =?utf-8?B?KytLcDMydGV4MWx6cmtnaWpHZWhUcGRYdGVJeWVFalV6cHI3WXc2WnExdGVG?=
 =?utf-8?B?WklIQjRvNWVBNjJkajJsODlhbjFCbFkxMllUa0VwS09OR0NBeTl5UGZoVjhy?=
 =?utf-8?B?Q044MkhXZHhqaldOUlQvYVhMMFBXTEpBaHpVTkZtR2plSmRWaEVxRlpJUWxs?=
 =?utf-8?B?RXF0dTlPdVpBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0JmcmF2dXVrcTd5RDVTay9Jb1BCRVdqdis0WEVsWU10RDI3L1c3MTlXNlZ0?=
 =?utf-8?B?NUNWZHl2aEVOMXBQajRXa0xHS1FHWTBHWGFENjJRa1MyZTFTZ0tGbjk3cDU3?=
 =?utf-8?B?Wk9EWGY0YjRMbEhodjZHNmw2Ym1pQ3NuTEZPai9NV0JuYzlHakYySGxTQjkv?=
 =?utf-8?B?d3R3NXdPWWpmbVQzb2lkeUY2SktLenEwVGJYc0NUbGkxNzVLZzU5U21TL0hI?=
 =?utf-8?B?anlMZWlVRytIZlQwalh4UEl3Q0VDS3cvMnNmQUdKSXdaZDdpQnRldVdKd1VS?=
 =?utf-8?B?YStiRDJOY20xYXNXRTcyOHlNNlQvUVFJSmJOTWRIbTEwdXBENFNnUDdKZjUw?=
 =?utf-8?B?ZXlXRXFReFR1elhIUFAzUmdVVC9qSlpFeWtQRDNkeVc4S3pDWEFHb2gzOXpl?=
 =?utf-8?B?WGtHdHd3a1ArSUZtU08vRE5QbldQMlRWaTl1ZUFqY0s1aTBHYitGVmY2cWZC?=
 =?utf-8?B?TTBCdGJCNnBWMGduRnRoMmI3WnJ0TlZFcllYbSttd2RDSEFEUEZMR3ZFRzBK?=
 =?utf-8?B?MVFPUHRVM1dxM3NJOTNsZlRZZUtQVDRpclJYaVZ1Y05YM2xHbTJYYkZ5TkxD?=
 =?utf-8?B?NXZxSTU3a2s3N2M4N1B5bE5VOGJicGZLQW9adDVQdDBiTWVid2djcElFZXhl?=
 =?utf-8?B?N0lNSWFSZ2x0SmI0c1lLdmxZV2xkYmFsb2NNUks4UTU4RHpYSU02amc5NVov?=
 =?utf-8?B?bTlFdnUxcnQ2TjZxUnpkcnU3cjdXakxMN1J0ZkF2eWhhWllZYU9EYURPODJp?=
 =?utf-8?B?RWtnQUszWDVvSWVpODZMT1FtTDVvQ0tFOS85VzlNMHJHcnBvWXRHZjRIbzF0?=
 =?utf-8?B?czhNaGVEbnc5THRCMzhuajNlTE1CN3VTQXp3dDVJRS9rdWhPWHl1S0xleVZq?=
 =?utf-8?B?UEVjNTNSeDhFZDBwWlI2SDlDUU4rcEdPWk8wb3ozZGdpSDVFVEZZeEIxYVpD?=
 =?utf-8?B?b0tZNXJ0UGxTbFVEL1hCcWdOdGRWWjNLR081bnBveVNJcFkwY1hlanN5ZERJ?=
 =?utf-8?B?cmpFaW5aUlZVT3c3THhtOUdLNHIxdHAxbzMzVEZrd2tGNnZxVTN2N0JYS2Vj?=
 =?utf-8?B?UmVDNVNvRkRtUjROUlNEc1E1em11UXdvTW9pRWg0K3hacjF1TE5ya25vYWpD?=
 =?utf-8?B?YUVZOEZWWitQUUE0eXBMczdraXZMY0tzY1dxd2NSMFhWV045dUdtK05CVDJr?=
 =?utf-8?B?Z0NUclU3c2VVTVdydDBMcGY1SVNRTkdoT1djMlZoSDRlUnBROWIxR3pnWnBF?=
 =?utf-8?B?b1JxWDRDTXNIY3BxLzV0QXhVLzZBRGcvV0ZSRURWczRQWFJNaUNZN1N3bXBo?=
 =?utf-8?B?VG9Hd3czb2djSkpUYzVNZkM3M2F2bXNPSWlrOExXRGtLbGZxbitqdDZuOW9k?=
 =?utf-8?B?UUhuckNvWFBJcm0vUjBQS211WlF6Z0xyMDRIeC9XdExiTTQ5RXg0OU5GSmlu?=
 =?utf-8?B?RU95UitZYzVDMDh4K0w5R3paNzhPNXM2Qmc3Sklyc29YL1dmendPSnFXV01S?=
 =?utf-8?B?Q0wvTmZwdER4TktQYTBCUW1EV0ZWVlp3eHZGbHVVSnp5bU1ZeWFacUxZKzl6?=
 =?utf-8?B?ZEVHbWJZTWRqZEdwQTVzTTFFZHg3ZVVMRFhOSVRGUm9zbWVPS1dCU0h5SXU4?=
 =?utf-8?B?YW44eG82QlJFVG4vNlV6ZjVEa1kwUE5pUWJTVzRhUDg2U3NtSEpjTE43cUdC?=
 =?utf-8?B?ZkF6cE0vbnI2NHFkOGdYOHVaU1VFa0luNnNpRmxMWktkU2R2RzZLWmFDU3Q2?=
 =?utf-8?B?SUhmb2ZSTEh6Y3pFN2tBa1lHWEIxNE5LOWx4MisrT0NKRzFqUHQ5clZqVEJQ?=
 =?utf-8?B?TytscmE1dFlpUGhueDByZmRMZ203Vk56anpNRFU4Ly92bjNmUklXdEM1VUZn?=
 =?utf-8?B?RVRwMGtQZUJocXN6UnA2Z2ZCVkxOR3FOWGVGVm1hVSt5MW16R2p1cDloVXNq?=
 =?utf-8?B?ZGc0ZEpYcE5pL0dIQnZBWjc5RVB1VEJESzlZWDd6ZVA5cWc1Zyt5eWltZW52?=
 =?utf-8?B?MWgybkQwUk4rV2x1YTNtbEpzZjBGc1RyMjRWSGNCQnpIRHJ6RGo2alVJUHlP?=
 =?utf-8?B?Mnp3eWZUSk9wV05JTlhHNjJWWlVrL2tYcGZqZ2dGWXZpZkx4Q1dZd1RMRjg3?=
 =?utf-8?B?SnpXWHZDWWx0Y1lMZElBeGh0NmxsZmQ3YnQzUEEvemV6S0NYYThCS3hrY0Ew?=
 =?utf-8?B?MnU1VnJTWEVEbUhCWTZwUEdEaUF5V0dkdURYOTFhTVBsWmJveHZaSHFqNDNU?=
 =?utf-8?B?Vk5oMnFVOFhzclYvMElEeC80Q2VBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba899c1-3cf6-44f1-0df4-08dde5545323
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 10:27:29.3929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDgDOTPHBuWWgI/77jbs7XY2VfFkL34a+mz7UbYxMxry5yVw1GL65o8Iu8La0mOujlh1SEvwTdHskWCzHGMpdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6069
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

On Wednesday, August 27, 2025 1:28=E2=80=AFPM Svyatoslav wrote:
> 27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80. 07:19:39 GMT=
+03:00, Mikko Perttunen=20
<mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> >> Tegra30 has CSI PAD clock enable bits embedded into PLLD/PLLD2 registe=
rs.
> >> Add ids for these clocks.
> >>=20
> >> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >> ---
> >>=20
> >>  include/dt-bindings/clock/tegra30-car.h | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>=20
> >> diff --git a/include/dt-bindings/clock/tegra30-car.h
> >> b/include/dt-bindings/clock/tegra30-car.h index
> >> f193663e6f28..14b83e90a0fc
> >> 100644
> >> --- a/include/dt-bindings/clock/tegra30-car.h
> >> +++ b/include/dt-bindings/clock/tegra30-car.h
> >> @@ -271,6 +271,8 @@
> >>=20
> >>  #define TEGRA30_CLK_AUDIO3_MUX 306
> >>  #define TEGRA30_CLK_AUDIO4_MUX 307
> >>  #define TEGRA30_CLK_SPDIF_MUX 308
> >>=20
> >> -#define TEGRA30_CLK_CLK_MAX 309
> >> +#define TEGRA30_CLK_CSIA_PAD 309
> >> +#define TEGRA30_CLK_CSIB_PAD 310
> >> +#define TEGRA30_CLK_CLK_MAX 311
> >>=20
> >>  #endif	/* _DT_BINDINGS_CLOCK_TEGRA30_CAR_H */
> >
> >The commit message refers to tegra20, but contents are tegra30.
>=20
> My, bad, it should be tegra30
>=20
> >Regarding the CLK_MAX define, I agree that it would be better to get rid=
 of
> >it. Perhaps you can check if it would be reasonable to calculate it
> >dynamically in the driver, but a define and sanity check in the driver
> >would work too, I think.
>=20
> It is not unreasonable, but moving this elsewhere may cause issues with
> adding new clocks. Addind new clocks would require updating not only head=
er
> but also a place where max clocks are moved to and ai am not sure how can=
 I
> dinamically calculate amount of clocks in the driver without updating bot=
h
> header and driver with each new clock added. Maybe you can propose a
> method?

Looking at the code, it's probably better to just move the CLK_MAX define i=
nto=20
the source code. We can leave a comment here as reminder to update the defi=
ne=20
in the code if any new clocks are added. This happens so rarely that I don'=
t=20
think it should be a problem.

> >Cheers,
> >Mikko




