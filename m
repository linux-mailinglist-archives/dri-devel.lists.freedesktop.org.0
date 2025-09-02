Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C56B3F1B4
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 02:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4435F10E554;
	Tue,  2 Sep 2025 00:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YqrVuC8e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D9A10E554
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 00:51:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFS94/XuV28SSC/EYtgcQla5Qd++22OrqCQKwsEHqPVsYXctlpPbijB1fac8FPnm8s8+DjeTb3m67FcT/uFY4gJmFwMQ/OzbKlr7tQAldo8p4USWM6dfQJ3D4jqpTlvpw1nXSOwkPyCu91RwiUDbj4KYpBqBuUIp7CfJYgLR0L06ppnMtPbvG/uG/aiRemNi1kWYpDapdnjCAfrOn403nYdZ8GifMyDWctmvEzsUnLfeP5bLv/AfhDvhN+Iir40H8SrVZcCAQUcQ4qJmGlBvWfhz8R7T5Dg07rVvP8jyJHXYqEaTFVd+wBVnwFekCQ6pmcM6ysJRnw0mKv07+Zijeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PouDaTHVtkb1IBsxL25MO8Jdb60QPsDISvjJZaWJG6E=;
 b=pVWVEsm+HtdKAu96GuhUg6rNQ4Ww+DsLl/mxk+1O/BP4pnOE0IhsYm1XBkAO2bZxUJg/aWpXn9JKMoQopvhIbtcrefui8PuPvktGXSp6J1RtqcsTW/Vy5ZJAFvpvaV+z+I9nlmucDRExkr4KlZtZ+Xd6Ftp2ZtMSeUquJBOpTBEC7/72hiwJGLmq9FWUnDbuDKiXdgkEZOcNgS5m3+lGl8JganSJm81G5NYMYt4SgEjVQOlWCmxCfglduVgrdrqc/R5zuBT8Rmcg/toEhQQqEkHTrX/KBctS2musxJHg0vu8ogs1/n0/JS5AzoSBlD73e6ceQQzARZtn42unZqZ92w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PouDaTHVtkb1IBsxL25MO8Jdb60QPsDISvjJZaWJG6E=;
 b=YqrVuC8eVQaGMf0vGin4sN4cy+CZC6WxddoTZs6OdSnrOEIrzWbn5WJVjcARLK0rU9ALpp7ufs5D/+tnHL1NhzPg32ltrEvrEttnya5zphLAZUpz7AcgBzLVJpY7H5phDzOlE1lzwORxPqndcOVlpOv/rX2idyd5yJ3zWrdr3X9aS/9D3Fnzof2xkXAGPdsolxCRrcWRqvvujvesumvWenEbl6LKXGvdYrmkCYJbPbcvtHOa6y6Av338DtXoXzhQk+tLx79x4vQH4dMoLf1k9aVOL7L4Wrw0TndIx30FSRXopCn7tBDBBnQ8HQpMUaH+Vh9TO4a35b2N7CWxwALrlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 IA1PR12MB7760.namprd12.prod.outlook.com (2603:10b6:208:418::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 00:51:45 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 00:51:45 +0000
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
Subject: Re: [PATCH v1 10/19] staging: media: tegra-video: tegra20: set correct
 maximum width and height
Date: Tue, 02 Sep 2025 09:51:41 +0900
Message-ID: <5434824.LvFx2qVVIh@senjougahara>
In-Reply-To: <20250819121631.84280-11-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-11-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0113.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::10) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|IA1PR12MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: de143fc4-d733-4437-fb12-08dde9bae3b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2tXWWtGWjlOSUhzK1BGMXBQa0tMNkpuTVBnNzkwODNodDdXeTd2R20rNzlE?=
 =?utf-8?B?d3BSb3RqVXlaNUhpeDV0YW11c3A4UVVOZGpBY2dZdnV1cm5vQmVLMGRXK3Bw?=
 =?utf-8?B?NTdlZFNsaW1RSERCRHFDdDhmLzN1K3kyQXhkN2tvWE1MMStBcHpoNWZJcS81?=
 =?utf-8?B?Tml0Wlg1UG9zWkNmVTRXb1NHWmo5eGwzZUxBbmNMU2tQVkRDSHdvaUk5K0RV?=
 =?utf-8?B?ZGFjNHNkTC9EMVBCck1xc0gvNmRFa0pQcUp5V1lOUFZLMC91ZnNIa0pWQmpO?=
 =?utf-8?B?ZGNpQkhMR2tLb1MzNm4rSXhYNmxOOC9HYk1OL1pJamUza291VUhuTUdvMnJx?=
 =?utf-8?B?SUtiNTlhNVBFYnd0SUhDWFFac3BWVitROTVQa1AxOElYODdtM29ENG0ydFJG?=
 =?utf-8?B?b1RweDlEYklCNDFTTGxQN0hLYldXeFZkbEJYNERSNTVkc01peTZzb3dzUFc5?=
 =?utf-8?B?RmJvazNhbHFpeGJPVDUxQ1B6UEVuMFllcUFidThFRjl5WDh2RUhJZUdHSHlR?=
 =?utf-8?B?enpIUDFwWHUxT2NNVDBnUWw3MkxwaXcwWldYOTN5SWZiQVduY0dIUXNpbnRa?=
 =?utf-8?B?OHJTanNla010QkJWbUxNYUxrclpwWEZWWW55Y1g0Tkh3bGtwcHFhbXMrSVJy?=
 =?utf-8?B?N1ZaSGErNTdMcGwyUzg1QzNUcUlkb1NOcE1qM2EzQWhFU2RnazZYNllQU0da?=
 =?utf-8?B?bTRYR3RzR3UyMjM5UlhSaDhIZFJYUEdCTWxKcmNPenVNdGhmZ2puUEJJM3ly?=
 =?utf-8?B?SVFOZlgyZ0Z1aG01SWRLaFF3NXpmV3NuTHNPYmJydVFuTG4vL1ZNSWoxcTlY?=
 =?utf-8?B?REUvUVF1ZVJFaXVpNmV3SXFFR3p0TjdHZGJkMDVJNHR1aXVqZW9WbnpFMVRi?=
 =?utf-8?B?VFoxSkxNeTJQeG9qUUF6NWVyc2xIaEN5QjBQb05oVXBMcmxFV3hkS0o4Vi90?=
 =?utf-8?B?YzNmbUpNSFBObnRDdHhQNm1Uc2pPOWZRbXNrcXVHbFdMS3hjaUpzZC9hQ0hJ?=
 =?utf-8?B?VnJBZFArZG05ZWcvMGZUVXJyckNVaEJOV3ZDVjNIUGlQTHpqdlRacFpzWkxu?=
 =?utf-8?B?SUdNK2xQVFpPd0NIUHg0cktmejRuTmRwTzVVbXJsWXp6eC9SbS82Z2c3MFVo?=
 =?utf-8?B?Z1AwUENZQlk4dXpyL0dBa1NmK1N1T21Ic0Roazg0TnJuOUJzNzluTE5leVo0?=
 =?utf-8?B?L3V4UStYMFYzNm5PRkhCSDdGN0lMOE1yWkJlRFZqMGszdmVvSk1IOHR3MkNj?=
 =?utf-8?B?VUNUTFRIQ2FHZVppdVV6b0NtTWlHaTBjV1BqRmpTM1RLWm44U1V3UEMyZm1X?=
 =?utf-8?B?ai9OWGV6dTcrU0l5RGU3WlIrRzlOeUxYeko3YmQvd21BYTE5UjhjRUtCYlc3?=
 =?utf-8?B?K0NpR05qSnU4Y3ltS3VtYm10RzV6WmhiMm1BUTg3T3AyS0p6UlBYVGw4YmJW?=
 =?utf-8?B?WE02Y1Zvb0dJa3k5L1FsTW1DU3pCUVhZUG9iM3B3KytGcnNNMUlEOWlwMHY1?=
 =?utf-8?B?OEhJNWF2a0EyVm1iRytnK2dWSW5vejhVKzZ2cEFmUzJqN3pZRFYwTmd1VHN0?=
 =?utf-8?B?cE95OEF3VVJuVGtoZFpaVW00eUU1cXArbGRYUk5vTGJDTWIvVXpGc3o3UzBE?=
 =?utf-8?B?WTNSaVg5dURLMUw2d051TVFjUFBGTHVvRVlCWnJjZUYrdmFNNEhhRGxqRWZm?=
 =?utf-8?B?YXNWazhqc1RJOXFGYzZ2cFBIYUxOekFxS0ZaV2FNYnhrNURJMllBcFEyWjBC?=
 =?utf-8?B?d2NwMnNSOG9rUDhMOUlPUXVNdnUwdnJvSHlISjMwcjZud01YRDh6R1dVQ1Mz?=
 =?utf-8?B?K2tKdkNiQ0Z4cEExZnFsVXVpdWJyeXFHS0RjdUNrZURqYWhkTExvL3ZROWtM?=
 =?utf-8?B?V2V6VDJnQW1qdzVFMG9WZmZDL0U0TnpscHVGRXgxOVV3VElsRGVXNUJKS1VM?=
 =?utf-8?B?aEpxUnVqOHY0aXl5RUt3cTlqNXQxd0YrM3pKYytWOGJyOG9pcFRIRFJhbW1h?=
 =?utf-8?B?OVNzYm9oVjl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmJaakRRMG1kRkh6VFcyQVNlSmZjRlZEK2N1MXJkSkszSkZlWDYyaHVvc0hG?=
 =?utf-8?B?dW5LT3M1OHlXaGJFQW51d0h3NHZ1UGhBNXp4N0EyK0FrRXNGL1NKb0ZOTlhY?=
 =?utf-8?B?TVlYalJHcTZHdE9VUlVWdFpVOGxGQThMVlIwOTN6WXJMMm1NbmU0TnJTeGRv?=
 =?utf-8?B?Y01FZGNRREZXdHJZRkJKZlE4L1NpZUdTVHBJMTZlZnBrbmdaMmk4TWdSM09a?=
 =?utf-8?B?Z2w4QVlNMTIzWkhJazRWVHVjZmRJbTlFZ2RONjhuMnphMDRkN0NFN2tTSUlK?=
 =?utf-8?B?ZHVrUU9sQVJQbVBEZHU1MVlQNVk0enZ0Y1ZVYW9GaU41VWlMUkEyVGk3WkxC?=
 =?utf-8?B?OGd3NUNqeFJ2dVpOQnQ0ekdUNmtHZHQ1MFVqMm80Lyt0OVU5eVEzK0kxaXc1?=
 =?utf-8?B?TUMzTFU5aFgxRm1oYXZiQlNpZ3hIMFRZZWxzWFptTmJnK1lGMmhwQ2xUUjVn?=
 =?utf-8?B?dGFCcXd2ZWkva0FNa2w4L1JSdUFhTCtnS0t1MERyaHdmalZFdUFlMngyUzA5?=
 =?utf-8?B?cHJNcWIzK0ZaUWhabGJyTHp0YnFJNk1la0xYUU12MmszaUVnNE56QXFCN0RC?=
 =?utf-8?B?UEMvUldNK09TSTB5dHNzMSsyK0tDYlllYWh4c0tqMGN6MW1xT003REVnNkp3?=
 =?utf-8?B?Ryt2U1FiaHVQdFZhM3hQZmFrd0Rpc2dESURLM1gxa3lPNFRNaTBnK1lXb1NX?=
 =?utf-8?B?RE8vSTZYWFNBZjNCUXdRVU9xY243dnVRTXJNQmwwSC9IcGtERzFWdk4za0JK?=
 =?utf-8?B?NXk1S1VEYTdxL0R5MzUyeVVzS2xBbXp2TE9ucDhUS1NqS0JaY1dZb1kwYWJh?=
 =?utf-8?B?QTdJN0FjZU9DWVBOREFDeXhOSnBtRTQ0L2Q3MUFxdFN3ZG9UbTdhS0ZZR3ly?=
 =?utf-8?B?RDluaWIwOEYzMWJMa0FrSTgzTW9HTENJbC9BbHVpM2Q1a2Vsb0JKRDdHN3RX?=
 =?utf-8?B?dnBtcGV4d1d3US9nVGJaN3haQjRiTkRMT2pwc0dKQTNrWURkVnBSRlZZN2Vv?=
 =?utf-8?B?M045WFJtcUwrQi8xZ0RiL2JzTHYzZG1LWHcwS29ja3ZCVmtxYjNuQ0RLMDUv?=
 =?utf-8?B?Q3VOS2ViZGd3eDlXZjZudXFCNXFnd1BaMDRyT3RMczRKMXhhaWNCT2Jrc0Zq?=
 =?utf-8?B?ZVd3MWhHQ2hDbkJSeSt4YXpLVGZqUmZQZ2dYemYzMkZTczFCU3ZVZjZDMkt6?=
 =?utf-8?B?VEkvaHE4SVZkRzB4VHIyeUxLVzhSeFpzZmdtZEE4SFlOSmNvWjJPK3NhMUhC?=
 =?utf-8?B?TlJUMDYvWFdlZ1dpVWRZSENjOE96S0RvMTg0MlF3a2RXUzBndFVGZUtEb0g2?=
 =?utf-8?B?RUhpUzJSVFF4aTVObVB5OGR6OVhtU1pUT0hjY1JtYmhKL1hWK0VDR1BESWdI?=
 =?utf-8?B?eVBOczBpVWVWZGpzWm1LMmdxOXJnNDV0VjkyRlAyNTlhNURRNS94NWRhS3ZE?=
 =?utf-8?B?Vi91a1E4TURjV3ZKREVKQUtKSWVXeCtrdENaSk9xOVRpbkZTZzlnRXVOM05y?=
 =?utf-8?B?dElBWGJFQ3BRK1JEeGZXbFZHa29GeWJ0eTZmR0JGLytEY0toQk9EL2NueTli?=
 =?utf-8?B?OEVQcEVtdXZoT0RybWJqQnc2Z2UvVkdCd3ZjVlhrb2xkQy84bno0Y2JBYzFz?=
 =?utf-8?B?QUI2di9sWU1RYU1QQ240YWUzYW9rdmZHVHpHWVRIOHJrU3RPaTN2QnViYk4v?=
 =?utf-8?B?THlpU2dQdzR4OVhPREJNSk4xQ3diRnNvSWxEQnA5dXpCaTJ5dEFpRSs3YWZt?=
 =?utf-8?B?Zy8zRkZvSnlXZEhYMGlua1NLL3hiV2s5UGRpQUFpOTg3TEpsMjdmM2ZoSDU3?=
 =?utf-8?B?T2hDaCtMcWFDeWRqWmZhRllXQmt6RVpRSmtieUltclkyWkFhVDMreXBCL2xk?=
 =?utf-8?B?eUFVUlhTbTMzWEhWdCtERWVsSE9TM2FJN0N6ejFLckE2bnNYMzFicTV5NWg1?=
 =?utf-8?B?c0lHRXVERDV3TmJrYVRZMVo1WE9WR2VmRE5VT3JiWXpadTJ4YWNlUlJJclhk?=
 =?utf-8?B?K2Q2eFI0UnkzbFlQMlloeGptancva2dTYStmUVhuM1I3UkFpdlJDRVY0VmhY?=
 =?utf-8?B?MDdaY0lSMFEyWE9KeDZyS1JRb1FkNmJ3QWlXL2ZsY2NZeUpzNUJuWnJKUnVi?=
 =?utf-8?B?cTJmY3BJZDhFNFZON1IrTDl6eUVwaFRmNWZ6dExKeU1PRERsRkZqWWlEZmdG?=
 =?utf-8?B?SzdxczdFdW1Obm9iR1NoRVVsMUMxSkp6cEkzUGVMY0l2T2xOQ1FhSnZ5RTFn?=
 =?utf-8?B?TXNLZlM0bXNFbmhKa2ZwdlFxNCtBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de143fc4-d733-4437-fb12-08dde9bae3b0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 00:51:45.1957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFgvwXh457+2Lhzp0VlbTbT+fmi3i+NsEz0Bgoq10WEL/hCqPru/icQJL4CR9/ec3te5VjmGaqYcs7Mrxj9cYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7760
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
> Maximum width and height for Tegra20 and Tegra30 is determined by
> respective register field, rounded down to factor of 2, which is 8191U
> rounded down to 8190U.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/tegra20.c
> b/drivers/staging/media/tegra-video/tegra20.c index
> 7b8f8f810b35..3e2d746638b6 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -23,11 +23,10 @@
>=20
>  #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT		=09
msecs_to_jiffies(200)
>=20
> -/* This are just good-sense numbers. The actual min/max is not documente=
d.
> */ #define TEGRA20_MIN_WIDTH	32U
> +#define TEGRA20_MAX_WIDTH	8190U
>  #define TEGRA20_MIN_HEIGHT	32U
> -#define TEGRA20_MAX_WIDTH	2048U
> -#define TEGRA20_MAX_HEIGHT	2048U
> +#define TEGRA20_MAX_HEIGHT	8190U
>=20
>  /*
> -------------------------------------------------------------------------=
-
> * Registers

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>




