Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C01E4BAF3F6
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 08:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E3A10E332;
	Wed,  1 Oct 2025 06:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l8xho6g4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012028.outbound.protection.outlook.com [52.101.48.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D945A10E332
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 06:38:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uN1U0bApVkXJyzgAN6/zaAWqdqps9tz/7YPCY0K/nGH4PC5DvlGRyzeNe0mk5KWHl5xdK6i01KHZ/nAsIEIP7mLpwGS1l7snJOFf3dL4DKw22cBsf/1M2RQXzzmIOWcWLdGCSjcreaS/ciRwKWv3fn7IitPFCqf2nPHr5Yp2938t67lg0rGMBJJHJ3S67oNO6mEmEgHrHA2R0xUe/5qOuE3coPgvV8TkMHuauNpAtlmcNCV8eG5ryPtpqxlWq73qXHOba6U6Um4CgdJ+usRAaR86RupAZvy0IjLu5OI9iBBGQmrv98JWP/hoPtI7Fpd8GgNCj8ggMbs3hSnnbF86ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1mK5HToh3KHW26/Fc09IGXS/eq9Max+x0pj4r0eC/o=;
 b=vYfDU2xvZCVBKLJPDzjvpaCIlfyddN8hVp1iIvegPdd7ir6Xwl9QgD4+SNrHF8R7TX+82XLU7DucTPh/o7mjhg3se6I2q3fqnyyVI8JVZieF0iliqmh/XeceBUy+ylHusYZr0ZiMoDwuMq2W0fJ2pxjctL2KumHlsI8kg9osvHsvlGkr5uQ5uQC+DUeW5rfl3qYGT9WYPlK3iV/Z52PBcwrMN3EpugdTxAvALVSrjzMZ4AyOcgiQ5e7EXnKI0FAE3T/ryAKKk5oSUaTJ2NQi452oFAnQdTASb3126yteLGKgIEgZRc2PEPMwD0abGXzma718DmRES0vArHsqZIRQew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1mK5HToh3KHW26/Fc09IGXS/eq9Max+x0pj4r0eC/o=;
 b=l8xho6g4TjkHVij74QcdfBejYf6iB1zS1FPXEAS/s3ZgqybMZSiBlQ/4WCVGcZ0dpMSlEtFh9XIww4jWoiZXdw6JxgCKBFcgbiyV/7HgfqgAqdNI2WVHSYOeO2EGBzCdueSJUGAYdrorKISwK0cdY0mFpvceAhDxl4Nlk9lD3BPHqHdpdWIbDRfTTePLdKqZ/sn51Oc35QPW5whnJUJ+aqQV2QSYKdQ3AWzFZaqovATT+uxiTZOEXFH3aD1PJkC2f2ZQhFV5nWOgr0vbYMGbFEWuCGF6WWU6CZ5PYhXEaIPG3oKhs7OqyBxqp8QbfXmCTO+oEmLENQ5uHSXGUIwX8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 MW4PR12MB5601.namprd12.prod.outlook.com (2603:10b6:303:168::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 06:38:39 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 06:38:39 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 22/22] staging: media: tegra-video: add CSI support for
 Tegra20 and Tegra30
Date: Wed, 01 Oct 2025 15:38:23 +0900
Message-ID: <2443034.g5d078U9FE@senjougahara>
In-Reply-To: <CAPVz0n2rjDq06axWQHuS6KGQqT7ycFDtYBbZPqxbJW3S=Nstqw@mail.gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
 <7265577.tM3a2QDmDi@senjougahara>
 <CAPVz0n2rjDq06axWQHuS6KGQqT7ycFDtYBbZPqxbJW3S=Nstqw@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP301CA0063.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::8) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|MW4PR12MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: ec16a1de-fb79-4b43-4871-08de00b527ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|7416014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2g3TTFGR1VkQjFIYU5GVWlHSWdZd3o4bGc5a3pFV1VKa1ZlRW5TclJwSHIv?=
 =?utf-8?B?TlNLck9TK2N2VHk4bDBBYjUwU3BzMXVhR1h2dW1aWHkzdG9MaUtXN1JGaVNC?=
 =?utf-8?B?Zm94UEtqemNHbVJoTFpvdWQ3YW5iYnZueHZ4d1gvZkdLTjFRaUVJUFZRWVFT?=
 =?utf-8?B?NW8xWlZ0cW9Jc2NQdzRFYmE3MGVNSndMVzF6Z2YvaEEyRmxKbTQrRE52dGZw?=
 =?utf-8?B?RHVYdERLdm5oWHB0S2M3WGV1TFJONExxeG9jL1BjOXEyV3BzajlTbWJPamtw?=
 =?utf-8?B?WWI1b0x3aUtTd2lYVHlPTlFPTUFZd3NEV25JMzFDejAyekxkUE1nVVVPVDJS?=
 =?utf-8?B?TWpiTUxjRmE3UTdKdlJkSHdIMTFFTjIvRTU5MG1kdmZPR09yQXU3ZXk5czBv?=
 =?utf-8?B?SjFKRjBLWFJNRG05czdmemhZSDEvS3B4cUw2ZERyRksrRmE0c0p5N05jT0ZN?=
 =?utf-8?B?TWV1OW16ZVFXYllzN2IxZVppQng4bWN6eWNmZ3Jib09CVkZvbldvOVBmbXM0?=
 =?utf-8?B?YW1jZTBncHFvWU93Y3grY0xwK1YvYUZndy85WGZ0NG9zL1N6UUpJZWc5eVpP?=
 =?utf-8?B?c05rcm9GZGZqRkpDRnJqL0ZPMXdESW1hQVRlKzYwZUJWVlhaSFV6UFRaMG9q?=
 =?utf-8?B?cTlmc3ByazZkeE1rcC9SOUVUQm9yNzhRVjRackJ5M0VrbVRwdTExdXNYZThv?=
 =?utf-8?B?VlliOHpESkppUUtRaWw4YndnREhzWEJJMGorWDkzMER0YkQ5QWtyYkh3Y1c1?=
 =?utf-8?B?RFlZbExyaVhJN2x4Zk1WWG5tbDJuMWhNekErQjRzMGwvbDhSVFVrSUlLWjd4?=
 =?utf-8?B?MTE4QzRYeW5JNDZhOG5LM3p6TEhtR21nWFREVzRzYnUvYWhlWXRSbHZhN25H?=
 =?utf-8?B?L2gxb2Z2NVRXbzUzeU9OYmlUTVQwbmszZXV0Uk1TSmtPWmJaRXFTcTk3cktq?=
 =?utf-8?B?QStpcGZDR01lcmkwc0xvVGZiWEVSMUZSVm4yVnQyV0pIYjFjSU5lN3F0TVdz?=
 =?utf-8?B?UjhrNVVVaHhtVjg1cHFmZUFDUUZzUVExb3RFZElLSlJrakRhVUczVi9PVkhn?=
 =?utf-8?B?dzVubGFvTmt5QTJhL05XcHlUM1NjU1JWTkY5U0NXeEt2dUdHV2hsTGRVanFs?=
 =?utf-8?B?T2k3Sis1QVJRMUVNMktSK3VWcVE2SW5PRE9PeCtqcGp3cE0xWElKOEJOcmk1?=
 =?utf-8?B?MUVmYnEwMFdnQm1TZE5QdWxCTmgzdXZoU2VMd01rY0xyck1SV0hpNkJPa1Zt?=
 =?utf-8?B?bWpQS0FZS3I2QWd5VHlmelg1dHBxWE1GOUhuU0N5YkxjV2dTSmROWjZmNW04?=
 =?utf-8?B?THkrRzJybEoxdXk0WVBYVmRzbnFyaC9RK2I0MVhHd3NSYytFTURHamVLeHVP?=
 =?utf-8?B?RGFjaGNZdEJCcGFhemp0UTRyWVp3TlIwQXNPa3gxYVFabndtOXI5ZklWOGxI?=
 =?utf-8?B?TkFaQ21Sakp1UFFEdWoxcHl5MUJvZTQxNnFScTM0M25lQVNveVdtUUJCTHdz?=
 =?utf-8?B?SjZuc0NnWGNqWk1iMG82ZDQxK3VFaXhTd0xNOFVpNG5kYWVwZEZJdzhpaXV6?=
 =?utf-8?B?UFhqdm5xT01rNWNKQXplTW5tUlVNenJSYXdyNHpnZ0cwRFhoR0NnSGNFbXhi?=
 =?utf-8?B?M054TFlyMDVRdlZqdEQwVXJraFRnY09yVlUvLzJWQUdodHl1dVpDUW1tTSt4?=
 =?utf-8?B?ZzdvYlZRTnBWempRd1dPQTNJeHpCZ0xuZmovY015NE5MVGlIZ0o5a0hkbGph?=
 =?utf-8?B?YStJZk8rQlZMUCt0NDNsd1ZYVGJQZjNkOHZ2TGtzeEFQYkZ0SVFVWi8yWC9J?=
 =?utf-8?B?K3c3VG1LU0FQbEh1clV2N1lwZnpNWnh2d3hOTWtGbmhUT0oyMDZWNXlSYldB?=
 =?utf-8?B?RkpVbm9yQjZpNHRRbXlQemtvckhzbEpQaTV6WHBMeXJyRWtIUlYybW5MeVM5?=
 =?utf-8?Q?IZg5kosnAOigyOfmvS1DTFm2yhEt06P9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(7416014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWwvOFBIVW9mRmpGdWMvVmxjVXFPOTRlRDZLelQrN3dVblhlUFMrYkNaRlRw?=
 =?utf-8?B?a2l0U09QdEZWaEFLZmpkYk52eElYVVFtUXBnUmYzS0g4bW0xbkJjdmdyTVJq?=
 =?utf-8?B?bTNmQ2ZMMmpETHkwemczRStNMHFpaktIU2FEOXptN2dVWFRQSE93aTBYUVhL?=
 =?utf-8?B?VjZGTjhMdWMrQ2g5eEw0b2E4elZiK05GMi9TUFJNc1gvdFBGWWpxKzFCbzBk?=
 =?utf-8?B?SjV1akFXOHcxR0RZekNlR21kc0hYak9OL2pFcGtDMXZENFp4R2JEQ0luakJ5?=
 =?utf-8?B?U1JEWFZOUWJGV0lQUzlkbXpGdnB4WmZrUEEzZ2EzTVVhMFNOaW4vWG9tRlR2?=
 =?utf-8?B?RW1VdjUrTGFFRTVwbE5Bck1YeFNyNDVRUWZqeDdxMDFBSDJ0ZWlzZHZrc0g5?=
 =?utf-8?B?TjcrTkJmUThnWHZ2bjBBVVM3NmRGV1hUMUI0OFk3cXJKQVZoc3NzSmRkNFNp?=
 =?utf-8?B?S2JNMU1zbzRqTDcrdm9wSlFsSmZjOTQzVExPaHppcmRlNW5YR0pNNGlLem1K?=
 =?utf-8?B?UkxwMnBieVBTS3U4bVJDd21MM3E5VCt4cllFSkczdzVqNUNzZ0F1aXRvVjFj?=
 =?utf-8?B?Vk14eTVleVVXSmVMZmVRQ0s2L1Z6SHhOdEpwLzZ1WU9Wa1ZueDk3SnZwQzN3?=
 =?utf-8?B?MXVQTnB6ZjNrUTkwN0wwWEVVMVFOWTMzN0I1Y0pxN2M5L2V4ZE5LV3NGdm9t?=
 =?utf-8?B?anVKT2MyZzVybzhCTHhyN0xKZ09vM2NtZ1R3YUtHa0xqWlFDNnovWmNVZWpE?=
 =?utf-8?B?ZXRjZjQxK1UxSW02K1dtM2RaNjVnL1ZMeUhDRWdHb3hUTFNRbytTaitYVCsx?=
 =?utf-8?B?eG84Q0xRR2xpN3g2VHIvcWVyR05UeFltai9iQ2VFeWZPMEhrSFBQTGpDY3hk?=
 =?utf-8?B?TG9QOTdyMG5sVjMyUml1VGYxeG94VlQ1Y0RXK0xnWXEwZit6TWJSd2U0T1Fl?=
 =?utf-8?B?dXlOK05pWUpFa0NSaFNVcnpiVjBGbHJlSytKMmVyTDRJL3I1N2hqNGs5Ukw1?=
 =?utf-8?B?Yjc0TE9lYWVxNGk2SUdtbzZ4c01ncEoxd1NTczR4WnhyUkxxL0xmZm83bktV?=
 =?utf-8?B?THRtYXVYdWpFYWttbkRpMDh1YVlLYmtSencwK2locm5nRTZSbVpMSEdEb0RJ?=
 =?utf-8?B?RkNURUN4MG1BWURaRi9mWmFIWm1PU25wRlJyN08yTG9ma2lnQUp4TUthOXRh?=
 =?utf-8?B?c2o4cGs5OW5Hc0gydXdwOWpCcFcveE9VK2pDSVNOUDA5NG4vTFBwRzYrY0Vx?=
 =?utf-8?B?dFVqZHhsbHJzVkYzMEU5TVM5VkQ0YWVVcTRHRE5xWWZLMDkwaUJIZitlaU9a?=
 =?utf-8?B?OHp4alF5Q0d0bFBzWkdRQWE1MGRFbkM5bURDczlEZ21UZE53QlRhRzZXeXFC?=
 =?utf-8?B?UGdHc2FSY3RGTTNKeWNTMms4Qks2NTBBdk5CQk1aNVpLb1daWkdDenZuNEZM?=
 =?utf-8?B?aHhUd2U4MVgrdFdtdHE0UTFkRTFqN0Q5R1BYQmFoL2I1bTAva1NrVmFveG50?=
 =?utf-8?B?QS9QSmlZcFJvNzBRSWx1NGwxdVp1U29ZU3F1alB4RlQ5OGlhZ3BGNTRMV01q?=
 =?utf-8?B?YmladHVDck4wWHF0eHVtOWw2dlR1b1hEL3lpRE11TFE0eDgySjFFdjhUODY4?=
 =?utf-8?B?Q1VtdDdwN3VDRHd5RllDNmR0a29qbGNzSzhwREhDQmcvWHRoa0RPZEVEa3Iy?=
 =?utf-8?B?czE5MDN6cUhzWTFBQzNySk12Q1EyTTFDamhyTGZnZnJ0YnV3Z2JjNlhQbXZ0?=
 =?utf-8?B?SVRJY1pMbDd6cExqMHFiQkFreEkycmJqU1A5dGllWHpBM2xUdGdxYTRSTkw2?=
 =?utf-8?B?anFsSFNMa252MjVjU3llMy90akw5dVRVQnQ0QmNIampmQ1hjUlhOeTh0MjZy?=
 =?utf-8?B?VXczbFVwMFFyblh6MmxBWHl5ZE83U1J0OG1Na2RVQUxjZVBwcDlXcGN3ZDBq?=
 =?utf-8?B?c291WVlhQks2d0pEeUVwOW56TVErOUhGTmVsSEJVMzBEYzlHWmIyenJReE5Q?=
 =?utf-8?B?S2dsRDNRNUR6U0NxNDF0YjVGT2tQRW9yMTdSMW9WUXkwWjFueEN4M3JTck9T?=
 =?utf-8?B?bHNTUWpySkJWYW5DaDNoQWgzLzljWWpJUjBUc29tQkJjZGRPVDFQd1h6U3pU?=
 =?utf-8?B?SWFnMHlLU1ZuWXRyOTFhZk1KeVdxemxhRGtGc1g0UnJXb01JZlRIay9nWDBK?=
 =?utf-8?B?QmpiSm1JbUp4YkxDWFNXdTQvWFhZV3crTHg5MWIxYkpRMHlyVC9TZVAxcFZD?=
 =?utf-8?B?ZUJtV3JRWDRNZ3lkQ0N6RndtaEtnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec16a1de-fb79-4b43-4871-08de00b527ab
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:38:39.1062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFX+sVDm/0KCk4coyeu0kr+JWPGJFStAnx9RAMCSkvLOewdJQO1whxY8xPNggOK+cS6Bw9A9FVsHY9NOBaCPJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5601
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

On Wednesday, October 1, 2025 2:15=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 08:=
04 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Friday, September 26, 2025 12:16=E2=80=AFAM Svyatoslav Ryhel wrote:
> > > Add support for MIPI CSI device and calibration logic found in Tegra2=
0 and
> > > Tegra30 SoC.
> > >
> > > To get CSI operational, an additional syncpoint was allocated to serv=
e as
> > > the CSI frame counter. Both VIP and CSI use an existing syncpoint for=
 VI
> > > frame start events. That said, the frame capture function was refacto=
red
> > > to reflect the addition of the CSI syncpoint, and the CSI-specific
> > > configuration is guarded by the presence of a passed CSI channel stru=
cture
> > > pointer.
> > >
> > > The camera capture setup's configuration was reconsidered: the first =
two
> > > writes must be done before tegra_channel_set_stream for MIPI calibrat=
ion
> > > to work properly; the third write was moved to VIP/CSI-specific funct=
ions
> > > since it must be source-specific; the function was placed after
> > > tegra_channel_set_stream so the initial sequence is preserved and exp=
anded.
> > >
> > > CSI configuration sequences were added based on downstream 3.1 kernel
> > > sources and adjusted to the existing video-tegra framework. Although
> > > Tegra20 and Tegra30 have the same set of configurations, they differ =
by
> > > the number of clocks used by CSI.
> > >
> > > Dropped the software syncpoint counters in favor of reading syncpoint=
s
> > > directly and passing the incremented value to the polling function. I=
f the
> > > syncpoint increase fails, the PP is reset. This change should prevent
> > > possible race conditions.
> > >
> > > MIPI calibration logic was registered in CSI since Tegra20 and Tegra3=
0
> > > have no dedicated hardware block for these operations and use CSI. Th=
ese
> > > calls are used for both CSI and DSI to work properly, which is why MI=
PI
> > > calibration cannot be contained within CSI. The pads passed to the
> > > calibration calls resemble CSI PORT_A (0), CSI PORT_B (1), DSI-A (3) =
and
> > > DSI-B (4).
> > >
> > > Co-developed-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > > Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/staging/media/tegra-video/csi.c     |  19 +
> > >  drivers/staging/media/tegra-video/csi.h     |   4 +
> > >  drivers/staging/media/tegra-video/tegra20.c | 608 ++++++++++++++++++=
--
> > >  drivers/staging/media/tegra-video/vi.h      |   2 -
> > >  drivers/staging/media/tegra-video/video.c   |   6 +
> > >  5 files changed, 592 insertions(+), 47 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/stagin=
g/media/tegra-video/csi.c
> > > index 7d70478a07aa..92ee4c84a988 100644
> > > --- a/drivers/staging/media/tegra-video/csi.c
> > > +++ b/drivers/staging/media/tegra-video/csi.c
> > > @@ -827,6 +827,13 @@ static int tegra_csi_probe(struct platform_devic=
e *pdev)
> > >
> > >       csi->dev =3D &pdev->dev;
> > >       csi->ops =3D csi->soc->ops;
> > > +
> > > +     if (csi->soc->mipi_ops)
> > > +             tegra_mipi_add_provider(pdev->dev.of_node,
> > > +                                     csi->soc->mipi_ops);
> >
> > Error handling should be added. Also, I realize that we should have a t=
egra_mipi_remove_provider to call if the probe fails after this or at CSI d=
evice removal. Since tegra_mipi_request refcounts the platform device, AIUI=
 the CSI device cannot be unbound while it has users, so we don't need to w=
orry about the CSI device being removed while there are active users.
> >
>=20
> Your words tegra_mipi_remove_provider are unclear, should I add it and
> where should I use it exactly? I can make devm version of
> tegra_mipi_remove_provider by adding action there.

Yes, devm_tegra_mipi_add_provider would be a good solution. My intent was t=
hat we should clean up the provider registration in an error case or when t=
he CSI device is removed.

FWIW, I've spent a little time looking at the refcounting situation, and it=
 doesn't seem like the device refcount guarantees the driver is still bound=
. Will need to look at this further, but no need to block this series.

>=20
> > > +
> > > +     mutex_init(&csi->mipi_lock);
> > > +
> > >       platform_set_drvdata(pdev, csi);
> > >       pm_runtime_enable(&pdev->dev);
> > >
> > > @@ -858,11 +865,23 @@ static void tegra_csi_remove(struct platform_de=
vice *pdev)
> > >       pm_runtime_disable(&pdev->dev);
> > >  }
> > >
> > > +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> > > +extern const struct tegra_csi_soc tegra20_csi_soc;
> > > +#endif
> > > +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> > > +extern const struct tegra_csi_soc tegra30_csi_soc;
> > > +#endif
> > >  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> > >  extern const struct tegra_csi_soc tegra210_csi_soc;
> > >  #endif
> > >
> > >  static const struct of_device_id tegra_csi_of_id_table[] =3D {
> > > +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> > > +     { .compatible =3D "nvidia,tegra20-csi", .data =3D &tegra20_csi_=
soc },
> > > +#endif
> > > +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> > > +     { .compatible =3D "nvidia,tegra30-csi", .data =3D &tegra30_csi_=
soc },
> > > +#endif
> > >  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> > >       { .compatible =3D "nvidia,tegra210-csi", .data =3D &tegra210_cs=
i_soc },
> > >  #endif
> > > diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/stagin=
g/media/tegra-video/csi.h
> > > index 1550defb115a..422f30655945 100644
> > > --- a/drivers/staging/media/tegra-video/csi.h
> > > +++ b/drivers/staging/media/tegra-video/csi.h
> > > @@ -115,6 +115,7 @@ struct tegra_csi_ops {
> > >   * struct tegra_csi_soc - NVIDIA Tegra CSI SoC structure
> > >   *
> > >   * @ops: csi hardware operations
> > > + * @mipi_ops: MIPI calibration operations
> > >   * @csi_max_channels: supported max streaming channels
> > >   * @clk_names: csi and cil clock names
> > >   * @num_clks: total clocks count
> > > @@ -123,6 +124,7 @@ struct tegra_csi_ops {
> > >   */
> > >  struct tegra_csi_soc {
> > >       const struct tegra_csi_ops *ops;
> > > +     const struct tegra_mipi_ops *mipi_ops;
> > >       unsigned int csi_max_channels;
> > >       const char * const *clk_names;
> > >       unsigned int num_clks;
> > > @@ -140,6 +142,7 @@ struct tegra_csi_soc {
> > >   * @vdd: vdd regulator for CSI hardware, usually avdd_dsi_csi
> > >   * @soc: pointer to SoC data structure
> > >   * @ops: csi operations
> > > + * @mipi_lock: for MIPI calibration operations
> > >   * @csi_chans: list head for CSI channels
> > >   */
> > >  struct tegra_csi {
> > > @@ -150,6 +153,7 @@ struct tegra_csi {
> > >       struct regulator *vdd;
> > >       const struct tegra_csi_soc *soc;
> > >       const struct tegra_csi_ops *ops;
> > > +     struct mutex mipi_lock;
> > >       struct list_head csi_chans;
> > >  };
> > >
> > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/st=
aging/media/tegra-video/tegra20.c
> > > index 8c9655ffa886..d99a04fa25af 100644
> > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > @@ -4,6 +4,9 @@
> > >   *
> > >   * Copyright (C) 2023 SKIDATA GmbH
> > >   * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > + *
> > > + * Copyright (c) 2025 Svyatoslav Ryhel <clamor95@gmail.com>
> > > + * Copyright (c) 2025 Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > >   */
> > >
> > >  /*
> > > @@ -12,10 +15,15 @@
> > >   */
> > >
> > >  #include <linux/bitfield.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/clk/tegra.h>
> > >  #include <linux/delay.h>
> > >  #include <linux/host1x.h>
> > > +#include <linux/iopoll.h>
> > >  #include <linux/kernel.h>
> > >  #include <linux/kthread.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/tegra-mipi-cal.h>
> > >  #include <linux/v4l2-mediabus.h>
> > >
> > >  #include "vip.h"
> > > @@ -42,6 +50,9 @@ enum tegra_vi_out {
> > >  #define       VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT   BIT(8)
> > >  #define       VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT              0
> > >
> > > +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START(n)   (0x0070 + (n) *=
 8)
> > > +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_END(n)     (0x0074 + (n) *=
 8)
> > > +
> > >  #define TEGRA_VI_VI_INPUT_CONTROL                    0x0088
> > >  #define       VI_INPUT_FIELD_DETECT                  BIT(27)
> > >  #define       VI_INPUT_BT656                         BIT(25)
> > > @@ -88,6 +99,8 @@ enum tegra_vi_out {
> > >  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV422POST     (3 << VI_OUTPUT=
_OUTPUT_FORMAT_SFT)
> > >  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR   (6 << VI_OUTPUT=
_OUTPUT_FORMAT_SFT)
> > >  /* TEGRA_VI_OUT_2 supported formats */
> > > +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPA_BAYER  (7 << VI_OUTPUT=
_OUTPUT_FORMAT_SFT)
> > > +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPB_BAYER  (8 << VI_OUTPUT=
_OUTPUT_FORMAT_SFT)
> > >  #define       VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT       (9 << V=
I_OUTPUT_OUTPUT_FORMAT_SFT)
> > >
> > >  #define TEGRA_VI_VIP_H_ACTIVE                                0x00a4
> > > @@ -152,8 +165,106 @@ enum tegra_vi_out {
> > >  #define TEGRA_VI_VI_RAISE                            0x01ac
> > >  #define       VI_VI_RAISE_ON_EDGE                    BIT(0)
> > >
> > > +#define TEGRA_VI_CSI_PP_RAISE_FRAME_START(n)         (0x01d8 + (n) *=
 8)
> > > +#define TEGRA_VI_CSI_PP_RAISE_FRAME_END(n)           (0x01dc + (n) *=
 8)
> > > +#define TEGRA_VI_CSI_PP_H_ACTIVE(n)                  (0x01e8 + (n) *=
 8)
> > > +#define TEGRA_VI_CSI_PP_V_ACTIVE(n)                  (0x01ec + (n) *=
 8)
> > > +
> > > +/* Tegra20 CSI registers: Starts from 0x800, offset 0x0 */
> > > +#define TEGRA_CSI_VI_INPUT_STREAM_CONTROL            0x0000
> > > +#define TEGRA_CSI_HOST_INPUT_STREAM_CONTROL          0x0008
> > > +#define TEGRA_CSI_INPUT_STREAM_CONTROL(n)            (0x0010 + (n) *=
 0x2c)
> > > +#define       CSI_SKIP_PACKET_THRESHOLD(n)           (((n) & 0xff) <=
< 16)
> > > +#define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)           (0x0018 + (n) *=
 0x2c)
> > > +#define       CSI_PP_PAD_FRAME_PAD0S                 (0 << 28)
> > > +#define       CSI_PP_PAD_FRAME_PAD1S                 (1 << 28)
> > > +#define       CSI_PP_PAD_FRAME_NOPAD                 (2 << 28)
> > > +#define       CSI_PP_HEADER_EC_ENABLE                        BIT(27)
> > > +#define       CSI_PP_PAD_SHORT_LINE_PAD0S            (0 << 24)
> > > +#define       CSI_PP_PAD_SHORT_LINE_PAD1S            (1 << 24)
> > > +#define       CSI_PP_PAD_SHORT_LINE_NOPAD            (2 << 24)
> > > +#define       CSI_PP_EMBEDDED_DATA_EMBEDDED          BIT(20)
> > > +#define       CSI_PP_OUTPUT_FORMAT_ARBITRARY         (0 << 16)
> > > +#define       CSI_PP_OUTPUT_FORMAT_PIXEL             (1 << 16)
> > > +#define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP         (2 << 16)
> > > +#define       CSI_PP_OUTPUT_FORMAT_STORE             (3 << 16)
> > > +#define       CSI_PP_VIRTUAL_CHANNEL_ID(n)           (((n) - 1) << 1=
4)
> > > +#define       CSI_PP_DATA_TYPE(n)                    ((n) << 8)
> > > +#define       CSI_PP_CRC_CHECK_ENABLE                        BIT(7)
> > > +#define       CSI_PP_WORD_COUNT_HEADER                       BIT(6)
> > > +#define       CSI_PP_DATA_IDENTIFIER_ENABLE          BIT(5)
> > > +#define       CSI_PP_PACKET_HEADER_SENT                      BIT(4)
> > > +#define TEGRA_CSI_PIXEL_STREAM_CONTROL1(n)           (0x001c + (n) *=
 0x2c)
> > > +#define TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(n)         (0x0020 + (n) *=
 0x2c)
> > > +#define TEGRA_CSI_PIXEL_STREAM_GAP(n)                        (0x0024=
 + (n) * 0x2c)
> > > +#define       CSI_PP_FRAME_MIN_GAP(n)                        (((n) &=
 0xffff) << 16)
> > > +#define       CSI_PP_LINE_MIN_GAP(n)                 (((n) & 0xffff)=
)
> > > +#define TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(n)         (0x0028 + (n) *=
 0x2c)
> > > +#define       CSI_PP_START_MARKER_FRAME_MAX(n)               (((n) &=
 0xf) << 12)
> > > +#define       CSI_PP_START_MARKER_FRAME_MIN(n)               (((n) &=
 0xf) << 8)
> > > +#define       CSI_PP_VSYNC_START_MARKER                      BIT(4)
> > > +#define       CSI_PP_SINGLE_SHOT                     BIT(2)
> > > +#define       CSI_PP_NOP                             0
> > > +#define       CSI_PP_ENABLE                          1
> > > +#define       CSI_PP_DISABLE                         2
> > > +#define       CSI_PP_RESET                           3
> > > +#define TEGRA_CSI_PHY_CIL_COMMAND                    0x0068
> > > +#define       CSI_A_PHY_CIL_NOP                              0x0
> > > +#define       CSI_A_PHY_CIL_ENABLE                   0x1
> > > +#define       CSI_A_PHY_CIL_DISABLE                  0x2
> > > +#define       CSI_A_PHY_CIL_ENABLE_MASK                      0x3
> > > +#define       CSI_B_PHY_CIL_NOP                              (0x0 <<=
 16)
> > > +#define       CSI_B_PHY_CIL_ENABLE                   (0x1 << 16)
> > > +#define       CSI_B_PHY_CIL_DISABLE                  (0x2 << 16)
> > > +#define       CSI_B_PHY_CIL_ENABLE_MASK                      (0x3 <<=
 16)
> > > +#define TEGRA_CSI_PHY_CIL_CONTROL0(n)                        (0x006c=
 + (n) * 4)
> > > +#define       CSI_CONTINUOUS_CLOCK_MODE_ENABLE               BIT(5)
> > > +#define TEGRA_CSI_CSI_PIXEL_PARSER_STATUS            0x0078
> > > +#define TEGRA_CSI_CSI_CIL_STATUS                     0x007c
> > > +#define       CSI_MIPI_AUTO_CAL_DONE                 BIT(15)
> > > +#define TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUPT_MASK    0x0080
> > > +#define TEGRA_CSI_CSI_CIL_INTERRUPT_MASK             0x0084
> > > +#define TEGRA_CSI_CSI_READONLY_STATUS                        0x0088
> > > +#define TEGRA_CSI_ESCAPE_MODE_COMMAND                        0x008c
> > > +#define TEGRA_CSI_ESCAPE_MODE_DATA                   0x0090
> > > +#define TEGRA_CSI_CIL_PAD_CONFIG0(n)                 (0x0094 + (n) *=
 8)
> > > +#define TEGRA_CSI_CIL_PAD_CONFIG1(n)                 (0x0098 + (n) *=
 8)
> > > +#define TEGRA_CSI_CIL_PAD_CONFIG                     0x00a4
> > > +#define TEGRA_CSI_CILA_MIPI_CAL_CONFIG                       0x00a8
> > > +#define TEGRA_CSI_CILB_MIPI_CAL_CONFIG                       0x00ac
> > > +#define       CSI_CIL_MIPI_CAL_STARTCAL                      BIT(31)
> > > +#define       CSI_CIL_MIPI_CAL_OVERIDE_A             BIT(30)
> > > +#define       CSI_CIL_MIPI_CAL_OVERIDE_B             BIT(30)
> > > +#define       CSI_CIL_MIPI_CAL_NOISE_FLT(n)          (((n) & 0xf) <<=
 26)
> > > +#define       CSI_CIL_MIPI_CAL_PRESCALE(n)           (((n) & 0x3) <<=
 24)
> > > +#define       CSI_CIL_MIPI_CAL_SEL_A                 BIT(21)
> > > +#define       CSI_CIL_MIPI_CAL_SEL_B                 BIT(21)
> > > +#define       CSI_CIL_MIPI_CAL_HSPDOS(n)             (((n) & 0x1f) <=
< 16)
> > > +#define       CSI_CIL_MIPI_CAL_HSPUOS(n)             (((n) & 0x1f) <=
< 8)
> > > +#define       CSI_CIL_MIPI_CAL_TERMOS(n)             (((n) & 0x1f))
> > > +#define TEGRA_CSI_CIL_MIPI_CAL_STATUS                        0x00b0
> > > +#define TEGRA_CSI_CLKEN_OVERRIDE                     0x00b4
> > > +#define TEGRA_CSI_DEBUG_CONTROL                              0x00b8
> > > +#define       CSI_DEBUG_CONTROL_DEBUG_EN_ENABLED     BIT(0)
> > > +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_0                BIT(4)
> > > +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_1                BIT(5)
> > > +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_2                BIT(6)
> > > +#define       CSI_DEBUG_CONTROL_DBG_CNT_SEL(n, v)    ((v) << (8 + 8 =
* (n)))
> > > +#define TEGRA_CSI_DEBUG_COUNTER(n)                   (0x00bc + (n) *=
 4)
> > > +#define TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(n)     (0x00c8 + (n) *=
 4)
> > > +#define       CSI_PP_EXP_FRAME_HEIGHT(n)             (((n) & 0x1fff)=
 << 16)
> > > +#define       CSI_PP_MAX_CLOCKS(n)                   (((n) & 0xfff) =
<< 4)
> > > +#define       CSI_PP_LINE_TIMEOUT_ENABLE             BIT(0)
> > > +#define TEGRA_CSI_DSI_MIPI_CAL_CONFIG                        0x00d0
> > > +#define TEGRA_CSI_MIPIBIAS_PAD_CONFIG                        0x00d4
> > > +#define       CSI_PAD_DRIV_DN_REF(n)                 (((n) & 0x7) <<=
 16)
> > > +#define       CSI_PAD_DRIV_UP_REF(n)                 (((n) & 0x7) <<=
 8)
> > > +#define       CSI_PAD_TERM_REF(n)                    (((n) & 0x7) <<=
 0)
> > > +#define TEGRA_CSI_CSI_CILA_STATUS                    0x00d8
> > > +#define TEGRA_CSI_CSI_CILB_STATUS                    0x00dc
> > > +
> > >  /* -----------------------------------------------------------------=
---------
> > > - * VI
> > > + * Read and Write helpers
> > >   */
> > >
> > >  static void tegra20_vi_write(struct tegra_vi_channel *chan, unsigned=
 int addr, u32 val)
> > > @@ -161,6 +272,35 @@ static void tegra20_vi_write(struct tegra_vi_cha=
nnel *chan, unsigned int addr, u
> > >       writel(val, chan->vi->iomem + addr);
> > >  }
> > >
> > > +static int __maybe_unused tegra20_vi_read(struct tegra_vi_channel *c=
han, unsigned int addr)
> > > +{
> > > +     return readl(chan->vi->iomem + addr);
> > > +}
> > > +
> > > +static void tegra20_csi_write(struct tegra_csi_channel *csi_chan, un=
signed int addr, u32 val)
> > > +{
> > > +     writel(val, csi_chan->csi->iomem + addr);
> > > +}
> > > +
> > > +static int __maybe_unused tegra20_csi_read(struct tegra_csi_channel =
*csi_chan, unsigned int addr)
> > > +{
> > > +     return readl(csi_chan->csi->iomem + addr);
> > > +}
> > > +
> > > +static void tegra20_mipi_write(struct tegra_csi *csi, unsigned int a=
ddr, u32 val)
> > > +{
> > > +     writel(val, csi->iomem + addr);
> > > +}
> > > +
> > > +static int __maybe_unused tegra20_mipi_read(struct tegra_csi *csi, u=
nsigned int addr)
> > > +{
> > > +     return readl(csi->iomem + addr);
> > > +}
> > > +
> > > +/* -----------------------------------------------------------------=
---------
> > > + * VI
> > > + */
> > > +
> > >  /*
> > >   * Get the main input format (YUV/RGB...) and the YUV variant as val=
ues to
> > >   * be written into registers for the current VI input mbus code.
> > > @@ -283,20 +423,27 @@ static int tegra20_vi_enable(struct tegra_vi *v=
i, bool on)
> > >  static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channe=
l *chan)
> > >  {
> > >       struct tegra_vi *vi =3D chan->vi;
> > > -     struct host1x_syncpt *out_sp;
> > > +     struct host1x_syncpt *out_sp, *fs_sp;
> > >
> > >       out_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLI=
ENT_MANAGED);
> > >       if (!out_sp)
> > > -             return dev_err_probe(vi->dev, -ENOMEM, "failed to reque=
st syncpoint\n");
> > > +             return dev_err_probe(vi->dev, -EBUSY, "failed to reques=
t mw ack syncpoint\n");
> > >
> > >       chan->mw_ack_sp[0] =3D out_sp;
> > >
> > > +     fs_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIE=
NT_MANAGED);
> > > +     if (!fs_sp)
> > > +             return dev_err_probe(vi->dev, -EBUSY, "failed to reques=
t frame start syncpoint\n");
> > > +
> > > +     chan->frame_start_sp[0] =3D fs_sp;
> > > +
> > >       return 0;
> > >  }
> > >
> > >  static void tegra20_channel_host1x_syncpt_free(struct tegra_vi_chann=
el *chan)
> > >  {
> > >       host1x_syncpt_put(chan->mw_ack_sp[0]);
> > > +     host1x_syncpt_put(chan->frame_start_sp[0]);
> > >  }
> > >
> > >  static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned =
int bpp)
> > > @@ -418,41 +565,79 @@ static void tegra20_channel_vi_buffer_setup(str=
uct tegra_vi_channel *chan,
> > >  }
> > >
> > >  static int tegra20_channel_capture_frame(struct tegra_vi_channel *ch=
an,
> > > -                                      struct tegra_channel_buffer *b=
uf)
> > > +                                      struct tegra_channel_buffer *b=
uf,
> > > +                                      struct tegra_csi_channel *csi_=
chan)
> > >  {
> > > +     u32 val;
> > >       int err;
> > >
> > > -     chan->next_out_sp_idx++;
> > > -
> > >       tegra20_channel_vi_buffer_setup(chan, buf);
> > >
> > > -     tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTR=
OL_VIP_ENABLE);
> > > +     if (csi_chan) {
> > > +             u32 port =3D csi_chan->csi_port_nums[0] & 1;
> > > +
> > > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_C=
OMMAND(port),
> > > +                               CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> > > +                               CSI_PP_SINGLE_SHOT | CSI_PP_ENABLE);
> > > +
> > > +             val =3D host1x_syncpt_read(chan->frame_start_sp[0]);
> > > +             do {
> > > +                     err =3D host1x_syncpt_wait(chan->frame_start_sp=
[0],
> > > +                                              val + 1, TEGRA_VI_SYNC=
PT_WAIT_TIMEOUT, NULL);
> > > +             } while (err =3D=3D -ERESTARTSYS);
> >
> > This function is called only from a kthread, so I don't think it's poss=
ible for any functions to return -ERESTARTSYS. Have you seen otherwise? (An=
yway, it it were possible, we should add a parameter to host1x_syncpt_wait =
to specify whether the wait should be interruptible or not, instead of work=
ing around it)
> >
>=20
> This is caused by dma_fence_wait_timeout being unconditionally
> interruptible. I do not want to touch host1x stuff, this patchset
> already takes too much resources.

Sure, I don't think we need to change host1x. Since this function is only c=
alled from non-user context, even if the wait is interruptible it should ne=
ver be actually interrupted. So I think you can just drop the ERESTARTSYS h=
andling.

>=20
> > > +
> > > +             if (err) {
> > > +                     if (err !=3D -ERESTARTSYS)
> > > +                             dev_err_ratelimited(&chan->video.dev,
> > > +                                                 "frame start syncpt=
 timeout: %d\n", err);
> > > +
> > > +                     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STR=
EAM_PP_COMMAND(port),
> > > +                                       CSI_PP_START_MARKER_FRAME_MAX=
(0xf) | CSI_PP_RESET);
> > > +                     goto exit;
> > > +             }
> > > +
> > > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_C=
OMMAND(port),
> > > +                               CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> > > +                               CSI_PP_DISABLE);
> > > +     } else {
> > > +             tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAME=
RA_CONTROL_VIP_ENABLE);
> > > +     }
> > > +
> > > +     val =3D host1x_syncpt_read(chan->mw_ack_sp[0]);
> > > +     do {
> > > +             err =3D host1x_syncpt_wait(chan->mw_ack_sp[0], val + 1,
> > > +                                      TEGRA_VI_SYNCPT_WAIT_TIMEOUT, =
NULL);
> > > +     } while (err =3D=3D -ERESTARTSYS);
> > >
> > > -     /* Wait for syncpt counter to reach frame start event threshold=
 */
> > > -     err =3D host1x_syncpt_wait(chan->mw_ack_sp[0], chan->next_out_s=
p_idx,
> > > -                              TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
> > >       if (err) {
> > > -             host1x_syncpt_incr(chan->mw_ack_sp[0]);
> > > -             dev_err_ratelimited(&chan->video.dev, "frame start sync=
pt timeout: %d\n", err);
> > > -             release_buffer(chan, buf, VB2_BUF_STATE_ERROR);
> > > -             return err;
> > > +             if (err !=3D -ERESTARTSYS)
> > > +                     dev_err_ratelimited(&chan->video.dev, "mw ack s=
yncpt timeout: %d\n", err);
> > > +             goto exit;
> > >       }
> > >
> > > -     tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> > > -                      VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAMERA_CON=
TROL_VIP_ENABLE);
> > > +     if (!csi_chan)
> > > +             tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> > > +                              VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CA=
MERA_CONTROL_VIP_ENABLE);
> > >
> > > +exit:
> > >       release_buffer(chan, buf, VB2_BUF_STATE_DONE);
> > >
> > > -     return 0;
> > > +     return err;
> > >  }
> > >
> > >  static int tegra20_chan_capture_kthread_start(void *data)
> > >  {
> > >       struct tegra_vi_channel *chan =3D data;
> > >       struct tegra_channel_buffer *buf;
> > > +     struct v4l2_subdev *csi_subdev =3D NULL;
> > > +     struct tegra_csi_channel *csi_chan =3D NULL;
> > >       unsigned int retries =3D 0;
> > >       int err =3D 0;
> > >
> > > +     csi_subdev =3D tegra_channel_get_remote_csi_subdev(chan);
> > > +     if (csi_subdev)
> > > +             csi_chan =3D to_csi_chan(csi_subdev);
> > > +
> > >       while (1) {
> > >               /*
> > >                * Source is not streaming if error is non-zero.
> > > @@ -477,7 +662,7 @@ static int tegra20_chan_capture_kthread_start(voi=
d *data)
> > >               list_del_init(&buf->queue);
> > >               spin_unlock(&chan->start_lock);
> > >
> > > -             err =3D tegra20_channel_capture_frame(chan, buf);
> > > +             err =3D tegra20_channel_capture_frame(chan, buf, csi_ch=
an);
> > >               if (!err) {
> > >                       retries =3D 0;
> > >                       continue;
> > > @@ -504,28 +689,6 @@ static void tegra20_camera_capture_setup(struct =
tegra_vi_channel *chan)
> > >       enum tegra_vi_out output_channel =3D (data_type =3D=3D TEGRA_IM=
AGE_DT_RAW8 ||
> > >                                           data_type =3D=3D TEGRA_IMAG=
E_DT_RAW10) ?
> > >                                           TEGRA_VI_OUT_2 : TEGRA_VI_O=
UT_1;
> > > -     int main_output_format;
> > > -     int yuv_output_format;
> > > -
> > > -     tegra20_vi_get_output_formats(chan, &main_output_format, &yuv_o=
utput_format);
> > > -
> > > -     /*
> > > -      * Set up low pass filter.  Use 0x240 for chromaticity and 0x24=
0
> > > -      * for luminance, which is the default and means not to touch
> > > -      * anything.
> > > -      */
> > > -     tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> > > -                      0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> > > -                      0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> > > -
> > > -     /* Set up raise-on-edge, so we get an interrupt on end of frame=
. */
> > > -     tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> > > -
> > > -     tegra20_vi_write(chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channe=
l),
> > > -                      (chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> > > -                      (chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> > > -                      yuv_output_format << VI_OUTPUT_YUV_OUTPUT_FORM=
AT_SFT |
> > > -                      main_output_format << VI_OUTPUT_OUTPUT_FORMAT_=
SFT);
> > >
> > >       /* Set up frame size */
> > >       tegra20_vi_write(chan, TEGRA_VI_OUTPUT_FRAME_SIZE(output_channe=
l),
> > > @@ -556,18 +719,28 @@ static int tegra20_vi_start_streaming(struct vb=
2_queue *vq, u32 count)
> > >       struct media_pipeline *pipe =3D &chan->video.pipe;
> > >       int err;
> > >
> > > -     chan->next_out_sp_idx =3D host1x_syncpt_read(chan->mw_ack_sp[0]=
);
> > > -
> > >       err =3D video_device_pipeline_start(&chan->video, pipe);
> > >       if (err)
> > >               goto error_pipeline_start;
> > >
> > > -     tegra20_camera_capture_setup(chan);
> > > +     /*
> > > +      * Set up low pass filter.  Use 0x240 for chromaticity and 0x24=
0
> > > +      * for luminance, which is the default and means not to touch
> > > +      * anything.
> > > +      */
> > > +     tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> > > +                      0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> > > +                      0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> > > +
> > > +     /* Set up raise-on-edge, so we get an interrupt on end of frame=
. */
> > > +     tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> > >
> > >       err =3D tegra_channel_set_stream(chan, true);
> > >       if (err)
> > >               goto error_set_stream;
> > >
> > > +     tegra20_camera_capture_setup(chan);
> > > +
> > >       chan->sequence =3D 0;
> > >
> > >       chan->kthread_start_capture =3D kthread_run(tegra20_chan_captur=
e_kthread_start,
> > > @@ -662,6 +835,345 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
> > >       .has_h_v_flip =3D true,
> > >  };
> > >
> > > +/* -----------------------------------------------------------------=
---------
> > > + * MIPI Calibration
> > > + */
> > > +static int tegra20_start_pad_calibration(struct tegra_mipi_device *m=
ipi)
> > > +{
> > > +     struct tegra_csi *csi =3D platform_get_drvdata(mipi->pdev);
> > > +     unsigned int port =3D mipi->pads;
> > > +     u32 value;
> > > +     int ret;
> > > +
> > > +     guard(mutex)(&csi->mipi_lock);
> > > +
> > > +     ret =3D pm_runtime_resume_and_get(csi->dev);
> > > +     if (ret < 0) {
> > > +             dev_err(csi->dev, "failed to get runtime PM: %d\n", ret=
);
> > > +             return ret;
> > > +     }
> > > +
> > > +     tegra20_mipi_write(csi, TEGRA_CSI_DSI_MIPI_CAL_CONFIG,
> > > +                        CSI_CIL_MIPI_CAL_HSPDOS(4) |
> > > +                        CSI_CIL_MIPI_CAL_HSPUOS(3) |
> > > +                        CSI_CIL_MIPI_CAL_TERMOS(0));
> > > +     tegra20_mipi_write(csi, TEGRA_CSI_MIPIBIAS_PAD_CONFIG,
> > > +                        CSI_PAD_DRIV_DN_REF(5) |
> > > +                        CSI_PAD_DRIV_UP_REF(7) |
> > > +                        CSI_PAD_TERM_REF(0));
> > > +
> > > +     /* CSI B */
> > > +     value =3D CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > > +             CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > > +             CSI_CIL_MIPI_CAL_TERMOS(4);
> > > +
> > > +     if (port =3D=3D PORT_B)
> > > +             value |=3D CSI_CIL_MIPI_CAL_SEL_B;
> > > +
> > > +     tegra20_mipi_write(csi, TEGRA_CSI_CILB_MIPI_CAL_CONFIG, value);
> > > +
> > > +     /* CSI A */
> > > +     value =3D CSI_CIL_MIPI_CAL_STARTCAL |
> > > +             CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> > > +             CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> > > +             CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > > +             CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > > +             CSI_CIL_MIPI_CAL_TERMOS(4);
> > > +
> > > +     if (port =3D=3D PORT_A)
> > > +             value |=3D CSI_CIL_MIPI_CAL_SEL_A;
> > > +
> > > +     tegra20_mipi_write(csi, TEGRA_CSI_CILA_MIPI_CAL_CONFIG, value);
> > > +
> > > +     tegra20_mipi_write(csi, TEGRA_CSI_CIL_PAD_CONFIG, 0);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int tegra20_finish_pad_calibration(struct tegra_mipi_device *=
mipi)
> > > +{
> > > +     struct tegra_csi *csi =3D platform_get_drvdata(mipi->pdev);
> > > +     void __iomem *cil_status_reg =3D csi->iomem + TEGRA_CSI_CSI_CIL=
_STATUS;
> > > +     unsigned int port =3D mipi->pads;
> > > +     u32 value, pp =3D 0, cil =3D 0;
> > > +     int ret;
> > > +
> > > +     /* This part is only for CSI */
> > > +     if (port > PORT_B) {
> > > +             pm_runtime_put(csi->dev);
> > > +
> > > +             return 0;
> > > +     }
> > > +
> > > +     guard(mutex)(&csi->mipi_lock);
> > > +
> > > +     ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> > > +                                      value & CSI_MIPI_AUTO_CAL_DONE=
, 50, 250000);
> > > +     if (ret < 0) {
> > > +             dev_warn(csi->dev, "MIPI calibration timeout!\n");
> > > +             goto exit;
> > > +     }
> > > +
> > > +     /* clear status */
> > > +     tegra20_mipi_write(csi, TEGRA_CSI_CSI_CIL_STATUS, value);
> > > +     ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> > > +                                      !(value & CSI_MIPI_AUTO_CAL_DO=
NE), 50, 250000);
> > > +     if (ret < 0) {
> > > +             dev_warn(csi->dev, "MIPI calibration status timeout!\n"=
);
> > > +             goto exit;
> > > +     }
> > > +
> > > +     pp =3D tegra20_mipi_read(csi, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS=
);
> > > +     cil =3D tegra20_mipi_read(csi, TEGRA_CSI_CSI_CIL_STATUS);
> > > +     if (pp | cil) {
> > > +             dev_warn(csi->dev, "Calibration status not been cleared=
!\n");
> > > +             ret =3D -EINVAL;
> > > +             goto exit;
> > > +     }
> > > +
> > > +exit:
> > > +     tegra20_mipi_write(csi, TEGRA_CSI_CSI_CIL_STATUS, pp);
> > > +
> > > +     /* un-select to avoid interference with DSI */
> > > +     tegra20_mipi_write(csi, TEGRA_CSI_CILB_MIPI_CAL_CONFIG,
> > > +                        CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > > +                        CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > > +                        CSI_CIL_MIPI_CAL_TERMOS(4));
> > > +
> > > +     tegra20_mipi_write(csi, TEGRA_CSI_CILA_MIPI_CAL_CONFIG,
> > > +                        CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> > > +                        CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> > > +                        CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > > +                        CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > > +                        CSI_CIL_MIPI_CAL_TERMOS(4));
> > > +
> > > +     pm_runtime_put(csi->dev);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static const struct tegra_mipi_ops tegra20_mipi_ops =3D {
> > > +     .start_calibration =3D tegra20_start_pad_calibration,
> > > +     .finish_calibration =3D tegra20_finish_pad_calibration,
> > > +};
> > > +
> > > +/* -----------------------------------------------------------------=
---------
> > > + * CSI
> > > + */
> > > +static void tegra20_csi_capture_clean(struct tegra_csi_channel *csi_=
chan)
> > > +{
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_VI_INPUT_STREAM_CONTROL, =
0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_HOST_INPUT_STREAM_CONTROL=
, 0);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, =
0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUP=
T_MASK, 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_INTERRUPT_MASK, 0=
);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_READONLY_STATUS, 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_COMMAND, 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_DATA, 0);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG, 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_MIPI_CAL_STATUS, 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CLKEN_OVERRIDE, 0);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_DEBUG_CONTROL,
> > > +                       CSI_DEBUG_CONTROL_CLR_DBG_CNT_0 |
> > > +                       CSI_DEBUG_CONTROL_CLR_DBG_CNT_1 |
> > > +                       CSI_DEBUG_CONTROL_CLR_DBG_CNT_2);
> > > +}
> > > +
> > > +static int tegra20_csi_port_start_streaming(struct tegra_csi_channel=
 *csi_chan,
> > > +                                         u8 portno)
> > > +{
> > > +     struct tegra_vi_channel *vi_chan =3D v4l2_get_subdev_hostdata(&=
csi_chan->subdev);
> > > +     int width  =3D vi_chan->format.width;
> > > +     int height =3D vi_chan->format.height;
> > > +     u32 data_type =3D vi_chan->fmtinfo->img_dt;
> > > +     u32 word_count =3D (width * vi_chan->fmtinfo->bit_width) / 8;
> > > +     enum tegra_vi_out output_channel =3D TEGRA_VI_OUT_1;
> > > +
> > > +     unsigned int main_output_format, yuv_output_format;
> > > +     unsigned int port =3D portno & 1;
> > > +     u32 value;
> > > +
> > > +     tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yu=
v_output_format);
> > > +
> > > +     switch (data_type) {
> > > +     case TEGRA_IMAGE_DT_RAW8:
> > > +     case TEGRA_IMAGE_DT_RAW10:
> > > +             output_channel =3D TEGRA_VI_OUT_2;
> > > +             if (port =3D=3D PORT_A)
> > > +                     main_output_format =3D VI_OUTPUT_OUTPUT_FORMAT_=
CSI_PPA_BAYER;
> > > +             else
> > > +                     main_output_format =3D VI_OUTPUT_OUTPUT_FORMAT_=
CSI_PPB_BAYER;
> > > +             break;
> > > +     }
> > > +
> > > +     tegra20_csi_capture_clean(csi_chan);
> > > +
> > > +     /* CSI port cleanup */
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port=
), 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(por=
t), 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(por=
t), 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(p=
ort), 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port), 0=
);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(p=
ort), 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRA=
ME(port), 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port), 0=
);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG0(port), 0)=
;
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG1(port), 0)=
;
> > > +
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, BIT(25 + po=
rt)); /* CSI_PP_YUV422 */
> > > +
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_H_DOWNSCALE_CONTROL, BIT(2 +=
 port)); /* CSI_PP */
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_V_DOWNSCALE_CONTROL, BIT(2 +=
 port)); /* CSI_PP */
> > > +
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_H_ACTIVE(port), width=
 << 16);
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_V_ACTIVE(port), heigh=
t << 16);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(por=
t), 0x1);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(p=
ort), word_count);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port),
> > > +                       CSI_PP_FRAME_MIN_GAP(0x14)); /* 14 vi clks be=
tween frames */
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRA=
ME(port),
> > > +                       CSI_PP_EXP_FRAME_HEIGHT(height) |
> > > +                       CSI_PP_MAX_CLOCKS(0x300) | /* wait 0x300 vi c=
lks for timeout */
> > > +                       CSI_PP_LINE_TIMEOUT_ENABLE);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(por=
t),
> > > +                       CSI_PP_OUTPUT_FORMAT_PIXEL |
> > > +                       CSI_PP_DATA_TYPE(data_type) |
> > > +                       CSI_PP_CRC_CHECK_ENABLE |
> > > +                       CSI_PP_WORD_COUNT_HEADER |
> > > +                       CSI_PP_DATA_IDENTIFIER_ENABLE |
> > > +                       CSI_PP_PACKET_HEADER_SENT |
> > > +                       port);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port=
),
> > > +                       CSI_SKIP_PACKET_THRESHOLD(0x3f) |
> > > +                       (csi_chan->numlanes - 1));
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port),
> > > +                       CSI_CONTINUOUS_CLOCK_MODE_ENABLE |
> > > +                       0x5); /* Clock settle time */
> > > +
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_STA=
RT(port),
> > > +                      VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> > > +                      host1x_syncpt_id(vi_chan->frame_start_sp[0])
> > > +                      << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> > > +
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT(output_chann=
el),
> > > +                      VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> > > +                      host1x_syncpt_id(vi_chan->mw_ack_sp[0])
> > > +                      << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> > > +
> > > +     value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_ENABLE | CSI_B_P=
HY_CIL_DISABLE :
> > > +             CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_DISABLE;
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(p=
ort),
> > > +                       CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> > > +                       CSI_PP_DISABLE);
> > > +
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_cha=
nnel),
> > > +                      (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> > > +                      (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> > > +                      yuv_output_format | main_output_format);
> > > +
> > > +     return 0;
> > > +};
> > > +
> > > +static void tegra20_csi_port_stop_streaming(struct tegra_csi_channel=
 *csi_chan, u8 portno)
> > > +{
> > > +     struct tegra_csi *csi =3D csi_chan->csi;
> > > +     unsigned int port =3D portno & 1;
> > > +     u32 value;
> > > +
> > > +     value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER=
_STATUS);
> > > +     dev_dbg(csi->dev, "TEGRA_CSI_CSI_PIXEL_PARSER_STATUS 0x%08x\n",=
 value);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, =
value);
> > > +
> > > +     value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_CIL_STATUS);
> > > +     dev_dbg(csi->dev, "TEGRA_CSI_CSI_CIL_STATUS 0x%08x\n", value);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, value);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(p=
ort),
> > > +                       CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> > > +                       CSI_PP_DISABLE);
> > > +
> > > +     if (csi_chan->numlanes =3D=3D 4) {
> > > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND,
> > > +                               CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL=
_DISABLE);
> > > +     } else {
> > > +             value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_DISABLE =
| CSI_B_PHY_CIL_NOP :
> > > +                     CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NOP;
> > > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, =
value);
> > > +     }
> > > +}
> > > +
> > > +static int tegra20_csi_start_streaming(struct tegra_csi_channel *csi=
_chan)
> > > +{
> > > +     u8 *portnos =3D csi_chan->csi_port_nums;
> > > +     int ret, i;
> > > +
> > > +     for (i =3D 0; i < csi_chan->numgangports; i++) {
> > > +             ret =3D tegra20_csi_port_start_streaming(csi_chan, port=
nos[i]);
> > > +             if (ret)
> > > +                     goto stream_start_fail;
> > > +     }
> > > +
> > > +     return 0;
> > > +
> > > +stream_start_fail:
> > > +     for (i =3D i - 1; i >=3D 0; i--)
> > > +             tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static void tegra20_csi_stop_streaming(struct tegra_csi_channel *csi=
_chan)
> > > +{
> > > +     u8 *portnos =3D csi_chan->csi_port_nums;
> > > +     int i;
> > > +
> > > +     for (i =3D 0; i < csi_chan->numgangports; i++)
> > > +             tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
> > > +}
> > > +
> > > +static const struct tegra_csi_ops tegra20_csi_ops =3D {
> > > +     .csi_start_streaming =3D tegra20_csi_start_streaming,
> > > +     .csi_stop_streaming =3D tegra20_csi_stop_streaming,
> > > +};
> > > +
> > > +static const char * const tegra20_csi_clks[] =3D {
> > > +     NULL,
> > > +};
> > > +
> > > +const struct tegra_csi_soc tegra20_csi_soc =3D {
> > > +     .ops =3D &tegra20_csi_ops,
> > > +     .mipi_ops =3D &tegra20_mipi_ops,
> > > +     .csi_max_channels =3D 2, /* CSI-A and CSI-B */
> > > +     .clk_names =3D tegra20_csi_clks,
> > > +     .num_clks =3D ARRAY_SIZE(tegra20_csi_clks),
> > > +};
> > > +
> > > +static const char * const tegra30_csi_clks[] =3D {
> > > +     "csi",
> > > +     "csia-pad",
> > > +     "csib-pad",
> > > +};
> > > +
> > > +const struct tegra_csi_soc tegra30_csi_soc =3D {
> > > +     .ops =3D &tegra20_csi_ops,
> > > +     .mipi_ops =3D &tegra20_mipi_ops,
> > > +     .csi_max_channels =3D 2, /* CSI-A and CSI-B */
> > > +     .clk_names =3D tegra30_csi_clks,
> > > +     .num_clks =3D ARRAY_SIZE(tegra30_csi_clks),
> > > +};
> > > +
> > >  /* -----------------------------------------------------------------=
---------
> > >   * VIP
> > >   */
> > > @@ -681,10 +1193,11 @@ static int tegra20_vip_start_streaming(struct =
tegra_vip_channel *vip_chan)
> > >       enum tegra_vi_out output_channel =3D (data_type =3D=3D TEGRA_IM=
AGE_DT_RAW8 ||
> > >                                           data_type =3D=3D TEGRA_IMAG=
E_DT_RAW10) ?
> > >                                           TEGRA_VI_OUT_2 : TEGRA_VI_O=
UT_1;
> > > -     unsigned int main_input_format;
> > > -     unsigned int yuv_input_format;
> > > +     unsigned int main_input_format, yuv_input_format;
> > > +     unsigned int main_output_format, yuv_output_format;
> > >
> > >       tegra20_vi_get_input_formats(vi_chan, &main_input_format, &yuv_=
input_format);
> > > +     tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yu=
v_output_format);
> > >
> > >       tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, 0);
> > >
> > > @@ -717,6 +1230,11 @@ static int tegra20_vip_start_streaming(struct t=
egra_vip_channel *vip_chan)
> > >
> > >       tegra20_vi_write(vi_chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CO=
NTROL_STOP_CAPTURE);
> > >
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_cha=
nnel),
> > > +                      (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> > > +                      (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> > > +                       yuv_output_format | main_output_format);
> > > +
> > >       return 0;
> > >  }
> > >
> > > diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging=
/media/tegra-video/vi.h
> > > index 5cbc0606ed6c..bad55e0bd313 100644
> > > --- a/drivers/staging/media/tegra-video/vi.h
> > > +++ b/drivers/staging/media/tegra-video/vi.h
> > > @@ -125,7 +125,6 @@ struct tegra_vi {
> > >   *           frame through host1x syncpoint counters (On Tegra20 use=
d for the
> > >   *              OUT_1 syncpt)
> > >   * @sp_incr_lock: protects cpu syncpoint increment.
> > > - * @next_out_sp_idx: next expected value for mw_ack_sp[0], i.e. OUT_=
1 (Tegra20)
> > >   *
> > >   * @kthread_start_capture: kthread to start capture of single frame =
when
> > >   *           vb buffer is available. This thread programs VI CSI har=
dware
> > > @@ -188,7 +187,6 @@ struct tegra_vi_channel {
> > >       struct host1x_syncpt *mw_ack_sp[GANG_PORTS_MAX];
> > >       /* protects the cpu syncpoint increment */
> > >       spinlock_t sp_incr_lock[GANG_PORTS_MAX];
> > > -     u32 next_out_sp_idx;
> > >
> > >       struct task_struct *kthread_start_capture;
> > >       wait_queue_head_t start_wait;
> > > diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/stag=
ing/media/tegra-video/video.c
> > > index 6fe8d5301b9c..9f2bddc460bf 100644
> > > --- a/drivers/staging/media/tegra-video/video.c
> > > +++ b/drivers/staging/media/tegra-video/video.c
> > > @@ -127,6 +127,12 @@ static const struct of_device_id host1x_video_su=
bdevs[] =3D {
> > >       { .compatible =3D "nvidia,tegra20-vip", },
> > >       { .compatible =3D "nvidia,tegra20-vi", },
> > >  #endif
> > > +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> > > +     { .compatible =3D "nvidia,tegra20-csi", },
> > > +#endif
> > > +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> > > +     { .compatible =3D "nvidia,tegra30-csi", },
> > > +#endif
> > >  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> > >       { .compatible =3D "nvidia,tegra210-csi", },
> > >       { .compatible =3D "nvidia,tegra210-vi", },
> > >
> >
> >
> >
> >




