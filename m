Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41566B8EFD6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 07:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A2E10E3A9;
	Mon, 22 Sep 2025 05:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TpfeEYWa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013023.outbound.protection.outlook.com
 [40.107.201.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2462410E3A9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 05:16:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHGRSwE9h4HmwIOaIIa9iCOSi7VdfrHirNxesDfbVr/5foh4Wb0BNaXQyiQ2yL9/4A7X3WD8PzON3woKx+Pwkt5kxbkuXuiES/eEEsdECNFP0UCJHFqpuICjqKnuP9G7R88lFqgU9xEBd5DdQpFVOj7RZrYDBWid1ek2r8eQ8h44bWpRum/HvAg4ZsGmUPnJnTTU97ZWa6XrFRTHYNhQS2XSdS72ozSDFH8QgZQ1fZEbjf7GxLUEppPHoIwl5AgQuNpOEZhQOc+57SRpQdSlH7AN5VgUKSGbMECOeKNJtqFyiZpGAzcVMKSNBUTx7YlwUKQA4v0ZqbhFKjpCREpnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cihieFzCb36LlBeDWIVWf1Q2MBEIVkdngtuRIYVGZrg=;
 b=LdKOGM02Sx51leZKz8ww968wwSiD3C3yQgsmrDN3eweN9zYsX1AR9NzIhNmiHKpZRHwGVb5LsV8Ca7JAZgns4ua9B1fWO76D5wB5oDpCA3BEkSm5B6KnWq8M9EkswtxvYO7pL/gI/sU69XkwUT0SwsD2Ew9/MkZRabSxU6KMlm6PoLiLQtjb6/WHMqTMu0hrhrPwrb4tjs09Ll7EbL/h7yb1i6V8yjrjX0owsv+GY2KaqWXFg4z5TLL1l/JYAAMrXA0AiQ6pIEZhEKnkcA31fRiF7lP79qUG1GtOaZRywLRMr8byTnQOFyKGzwF64qH9lLY2fHV2np4dVHmvh2OwcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cihieFzCb36LlBeDWIVWf1Q2MBEIVkdngtuRIYVGZrg=;
 b=TpfeEYWaqTBEVPFH+CDeWDmcxymb/aYmMwc48bvPpZvJ/Q2JxdujT7OsLvg6opMgOqV/4NKpMSWhl9JVTO8Rjrey2y5foXY2fOetcpY9xL9OubIYqUpPHokWLVkoK8vivpo/9zYFQMHJbbvWEKecGVw28G9TfAiSgmFNKuIgWR1GxJNNLAoRoqgl2B+U2UR1ZQNxiTRvc8y06i0VLpuXwHM0QNYZIDBuv+/1LLUdueVgRP0rDNgZe1qCDylqhCoVsK1gxo7yTKIeIJ6KxiFvgOKS1K5EssKmF5VMQT81sTNj1oUr501p5aE0TePVH6yA4xr4TXrfcuBwB572DUbCBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 CY5PR12MB6381.namprd12.prod.outlook.com (2603:10b6:930:3f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Mon, 22 Sep 2025 05:15:59 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 05:15:58 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 23/23] staging: media: tegra-video: add CSI support for
 Tegra20 and Tegra30
Date: Mon, 22 Sep 2025 14:15:54 +0900
Message-ID: <4167298.LM0AJKV5NW@senjougahara>
In-Reply-To: <20250906135345.241229-24-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-24-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0229.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::8) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|CY5PR12MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: 910d1cf9-6059-49a5-67a9-08ddf9971d69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|10070799003|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bk5XYUgrQzYwbDc1bXRyUnl5MjdSTkdKazNtSVQ3NWF3SG5vOVM0N01QVnhQ?=
 =?utf-8?B?YXRoOHpLR2s4UnUvRjF3L2JSRzFlRS8rRFhiMkZhN2lYVXhLdWxZblptcDJ4?=
 =?utf-8?B?TzVrdDlUTERUTnNsSnBMdEZqaDFHcmpCVHNUWXpOOXVoa2F6SEN3MUg1c3pl?=
 =?utf-8?B?LzIybFBwdFVIUGN3eTBmZm5qZTRjV2N6NWhtL1Q2a1F6a2dKM1lBQktzS01M?=
 =?utf-8?B?MHJjempoelpITlBQQ3o0a04zNGtTL3ZnOE0vQkl4K3EzMUdFRldyQjd5N21y?=
 =?utf-8?B?Q0dKUkhPKzhFTUZwUDJKMDVmaEFPcVdtdGg0d095Nmc4aHp3S3NsRVJaQndL?=
 =?utf-8?B?VHAwcnhPempReXpuUTVuenMvbXU4M2lkeS9Nemw0bFMraFpIajBHRW9tNjBM?=
 =?utf-8?B?djdtMUYrbEJOVVlIdVVGUXZHWnpOMGZpSVgrbmdKM0JpUWZNVVNkSndjQ0c1?=
 =?utf-8?B?MW1KaWJWaFRRNDlGUkpHajcwT3FnR2JVYjRNUU92K2t5ZEN0eTU5SnJHVWxE?=
 =?utf-8?B?Zkd4S09QaTF6V3BoQ3FNMi8wVVd3dVJvY1g5MHNMVUp3QVdHRytCa2pnOEtZ?=
 =?utf-8?B?c0podzJTVldUeWdlNWhqSERQbTJKMFRsUkpSelRHdU5FeThSUlJJTnVoejFw?=
 =?utf-8?B?aHJCODVnVDhmYU9iaHdKYSt5bzVERDB6WlMra0tETmJ3MWQyU2I0MW1XbDlu?=
 =?utf-8?B?QVJmWGVCZngyNFNPcUxDb0lFRXpaMFhDM2ZjNUhKVE0veEUzNlpycnJZYU9q?=
 =?utf-8?B?c1Y3QWVXcDRLV2dXSExERXorQmZWRUtkMHIxK1V5a0NTeVk3TG8wejVxVDI4?=
 =?utf-8?B?K0dCVVU4WFRXb0UxMkprMWdTSWhiSHh2cUxJWWMwSnVDNWk2YTRmT3A5SU1Q?=
 =?utf-8?B?WUZGeEFkWC80enpJbEtCQkZQZnhBTkduNUU2ZEpMWnVLbWpOVUVQUHNWVy9z?=
 =?utf-8?B?V21sakwxY3g0V05YcVlPM0RNL204YStVY3l0eUdWclE3eXhLWjcrdXB3UDF6?=
 =?utf-8?B?bzh3ejZoRmNTOU9KazF2Tm04UkJEa2xIT0VRWkYwV0tmWFRzdkxaY0phZ0FD?=
 =?utf-8?B?aHRpTWFmK3hvWm5yWXlNVkNkNnYrbDZqYXQ5VGFFOHI1RmJVRUp4Y2doRzl4?=
 =?utf-8?B?RHJRclFrRnpLMGVKK3lnYlpBUWxFOGhMakM1Y2pudmUzMDVTSXcyYW1PZjY1?=
 =?utf-8?B?MjdibGJSeWphTkRPWjFJa01VNk9DbFRPaklMaXlXVTY1TzNTTkppZmdST1FD?=
 =?utf-8?B?UXJwK1dtNExwUUptN3dMMUFzakhCQUZrMU00WVpFTWFKVkYyMHNOaHF1UlJ0?=
 =?utf-8?B?dVVrT3Y3K0xabmZWb0dvSFhQRXZaZnRqc2N4dEU2NmdkSUZwai9zbzVod1NH?=
 =?utf-8?B?R3NlRTByQTBDaGVRVlNzcWdLSmtVRHI1bXgxemUzY2NDcnBqL0hCbndGRXJV?=
 =?utf-8?B?dHpQQ2FyTzk5TlprcnlOY2dqdnNqRkVhejFUWElwOHY1VGZ2YW5YdHFnUFps?=
 =?utf-8?B?UlJ1QzdyT2czWEJZNFBrdXBiNi93aEdEdVJhUlRqcFUwZEQ4N0JHcWhQUmx1?=
 =?utf-8?B?Y0hlQWg4Z2JDVkVFNzFNckdFTnlyVzdtZGg5aEJpTWlXMzYyYmJGNmZVcFYw?=
 =?utf-8?B?YjMxRmZ6b2dtVTcrR3ZiK1hzL2htVWRMMWZTNnpBbWRiRE9jT1dYV1FDeTl0?=
 =?utf-8?B?ZHRKQndPRjdBVlRaYlhab1NQRXlzMFV5UlpQT2tFSXYrR2l3bXhUSUZZaDBI?=
 =?utf-8?B?NFdpVEpQb280eHo2cnZkbnhDMVpmTEsyN0pxbURFcUNCVEh4d1hBRGJHSUNl?=
 =?utf-8?B?UEJadUlxckx3UEMycm5jcG0vTjRxM2svY3dodHYzZ0l0RGFuelZTemZvYVR5?=
 =?utf-8?B?WjByOEtvdDVaZ0xnaUg1eW0yQUtqRFh6ZGJwZlhOd1B5VU11T2lSQWUwUENK?=
 =?utf-8?B?cEk0MGJVV0lpV3dWOW9tbGRkMkVReWZxOXN6ZXh6WStpN0FLZGJVSThvUFJl?=
 =?utf-8?B?Tk5iTkxCZ1Z3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(10070799003)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXJPcm8wcWYzb2ZPQi8xYVVGd3c0ZXhLU0lZTSt2MEZpdHlwMFlIK2NESDhv?=
 =?utf-8?B?TnNZb1pzeEVFQWE3Z3ZHdTJ1WFVaUTJzeEU2K0E3aEd6K2JJRGFLNlNUVFZT?=
 =?utf-8?B?VXpBSzA1Z24wUVJNVjN2dkJmMzNyZjlRR3diOHZhcXZtVG5FUm9ZOTd2QmRx?=
 =?utf-8?B?cGNSOVp4ZmtsL0ErZERlMndDeGM4QnVqU2lkVjBYQlFiajR5bTJWRUVIbjhU?=
 =?utf-8?B?bTVyemJCWXQ2NG5qWE93MkpKdFZNSGE0Y2tyUWExQ29VZUxqKzhjai9OUXFq?=
 =?utf-8?B?d1JsaTd5TGtlc3hMSHlTQnBWQUsyZ0JHTmNrNi9LUHpVNjdZeldWemVESkE0?=
 =?utf-8?B?SE54MTBoZUMvaDhVV2ZFbEFOMVdUd1hxMXZ6UVJ1MWdRYi9GdUJTNFJsVXBW?=
 =?utf-8?B?THREaHpIMmdpZGFJbDEyYW1qMzZGYldoVXhLOHUrcE9FZDBvNStac01iR3dw?=
 =?utf-8?B?RW4rWGIwMzZ2TDZXL29BSGt2WW50Z2pXMkgybzk2UzhGemVQZUZaSGR1V2k5?=
 =?utf-8?B?TU1IWmdSTk5GM01WQzVtMjhtMU50Z0M5RjhmSkNpYkdXOFNxbzd1eWx2ZWl5?=
 =?utf-8?B?VnRkQ2szYXk4N1N4TDBCbUF4UXdVM1ROZDk2SEdzOEI3Q1dFcWFPUjBnRFQ5?=
 =?utf-8?B?cWM4Ni9PTHFJT3dyUkJjUFQ3VEptcTJpYjN6eG5XV1NaS2R3Q3dySFR1ckdI?=
 =?utf-8?B?L1c0QklvKzVMZVpCaHJuVXlkb0Z2cXdKYU15eER4RG1rZm5XU3lVeTRCTVYr?=
 =?utf-8?B?R3dkM1pFZzJxUmdCL04rejF6L3ZaME1lZ1RVMmxYVFcrbnFkbk9EaGx5MnBG?=
 =?utf-8?B?UjFrdnlHL3AzUEQzMWdQOGFqcjRtQVBlaHpDSEswM2pUbkNsc1lFOUdzeEFs?=
 =?utf-8?B?cHRHNTFlRTg1c0lGL2ZJcTFsVjZrTG5pQWxtSDhpdWp2KzY0V1lESVBQdHJB?=
 =?utf-8?B?aGpwWGREQ21MNHlqUzZ5WU0wV3BTQmZwV1hHR0daS2lvcnorZ3owMWZZMGRi?=
 =?utf-8?B?d2N4Tm01T0t2NjRHRDVRVU9zY2xpcHVnSFh0MGlXaExncmp0OHhFN3I5a3RS?=
 =?utf-8?B?Y1dVbHVUUll6RUpJMkI0MVBSVHZUVWUrQS84T1VHUDYyVWxSNnhUWWJQYjdZ?=
 =?utf-8?B?UXZNQlpRdC9nMjQ2SlNHQjBtTFBYcmJYdk5pVGF3NGJEb1dMMmttNVgrOEZq?=
 =?utf-8?B?M1lLMXppM08vWEhweHlvMkNIZFlSRVdaa0k3MUhwUVlNcW0vR2hpUFBFRUFk?=
 =?utf-8?B?TmxXNzNBSEtMekNrUzNsa1dQS1BIUFp3Qlgyc3dSc1psR0kyMnJyMWhKM1Fm?=
 =?utf-8?B?bk4yaThFR1JBQlIzZFFudStNanFGY3N0VFBXUUM2TVROSFFiNUZOKzVIU3VX?=
 =?utf-8?B?VWpBT09rTFFYYytQdFJVLzNKdlNYemdnRmRuRGhFVVA2NHNCa25lSzQweXgr?=
 =?utf-8?B?MUtRT2dQem1jV2ZOdFFhbU5pcktPN3hOWE12Yy9YWkg4NS9sUUc4czNlNWpP?=
 =?utf-8?B?U2hIUWtJNEY5ZXFLNjBwNDNpbnRLUStHVUZsbWxTcFF0aGNVaGNQQjdxeVli?=
 =?utf-8?B?bitiYXorVEZWTE1XVUxYM2tTNDl4aHZtdlZLejZLWkN5UW1yN3lHMnh3MFoy?=
 =?utf-8?B?b24rQXd0RFA0SGtlclJyenl3RWdEcHkrcit0WVJxQkk1RGNjUHVVT0w5UlZ4?=
 =?utf-8?B?VEVVeXNndExaeHFvc0ZrVzZORktaTncrTWJsU05zcGU2TUlkSENCYmxkZmlz?=
 =?utf-8?B?VzJSMGdjaG9HYjczMDl4UVkvaDVZYkp5LzErc3ZhWmlnb2t0eDRmRkJDSlJH?=
 =?utf-8?B?VUhMd2JzZXF2RjNxVTVXTi96bjNKdmxRNytEb0phRUNPeXdvMWhWRklTQTdD?=
 =?utf-8?B?Rnc5WmhqZXlrczlFUjFmV2dXMDl2ekF6emlRTTJ6d0Qzd0FPYTFZb1I1QUxY?=
 =?utf-8?B?RDNhdGRJZkxYdDFsL1dtSUJUQlJiSnNlbElCTGpKVkxUTXdMMjk1S09pR2li?=
 =?utf-8?B?M3hSdVdML3dhSnV3ZzNYblZFRWZTc3ZMSDdSZGhJVU0vUENQeHpaUDZEWVNR?=
 =?utf-8?B?dWZmLzJ3b1hDcnlSeDU0RzFqd3VMcXpuTXd1dyszVlpxbU5mUkNCcEczejQ1?=
 =?utf-8?B?dTFKeDFIWEoxY1g4dWNxdVV3R3dmZlBNMmFmMURIVFBkdVJ6VzBZa2MwdFE0?=
 =?utf-8?B?TEs0L2toTTNqOEpJOXczM3BIWnJNT3NQckM2a284OG5hbzF4ZFBla1dJZ3Yy?=
 =?utf-8?B?WllVaVBwVHQyOUV1VDQ2TGJYZ3ZRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910d1cf9-6059-49a5-67a9-08ddf9971d69
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 05:15:58.8487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s5DsToOPpH+sDxyHLH8qIZHULrvaOsXmJJXiUJHZoEvPzKvwmxqorLH7DDGiSZLISbHGCm8FAMEQpOLo0A22tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6381
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

On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device and calibration logic found in Tegra20 an=
d
> Tegra30 SoC.

The patch is on the longer side. I'd add some more explanation in the commi=
t message on the steps done in the patch.

>=20
> Co-developed-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/csi.c     |  12 +
>  drivers/staging/media/tegra-video/tegra20.c | 593 ++++++++++++++++++--
>  drivers/staging/media/tegra-video/vi.h      |   2 +
>  drivers/staging/media/tegra-video/video.c   |   6 +
>  4 files changed, 573 insertions(+), 40 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/me=
dia/tegra-video/csi.c
> index 1677eb51ec21..d3f85f964ada 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -863,11 +863,23 @@ static void tegra_csi_remove(struct platform_device=
 *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
> =20
> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> +extern const struct tegra_csi_soc tegra20_csi_soc;
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> +extern const struct tegra_csi_soc tegra30_csi_soc;
> +#endif
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>  extern const struct tegra_csi_soc tegra210_csi_soc;
>  #endif
> =20
>  static const struct of_device_id tegra_csi_of_id_table[] =3D {
> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> +	{ .compatible =3D "nvidia,tegra20-csi", .data =3D &tegra20_csi_soc },
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> +	{ .compatible =3D "nvidia,tegra30-csi", .data =3D &tegra30_csi_soc },
> +#endif
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>  	{ .compatible =3D "nvidia,tegra210-csi", .data =3D &tegra210_csi_soc },
>  #endif
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stagin=
g/media/tegra-video/tegra20.c
> index 20cdcc4e01aa..f81c40b6e709 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -4,6 +4,9 @@
>   *
>   * Copyright (C) 2023 SKIDATA GmbH
>   * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
> + *
> + * Copyright (c) 2025 Svyatoslav Ryhel <clamor95@gmail.com>
> + * Copyright (c) 2025 Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
>   */
> =20
>  /*
> @@ -12,11 +15,16 @@
>   */
> =20
>  #include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/clk/tegra.h>
>  #include <linux/delay.h>
>  #include <linux/host1x.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/kthread.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/tegra-csi.h>
> +#include <linux/tegra-mipi-cal.h>
>  #include <linux/v4l2-mediabus.h>
> =20
>  #include "vip.h"
> @@ -43,6 +51,9 @@ enum tegra_vi_out {
>  #define       VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT	BIT(8)
>  #define       VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT		0
> =20
> +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START(n)	(0x0070 + (n) * 8)
> +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_END(n)	(0x0074 + (n) * 8)
> +
>  #define TEGRA_VI_VI_INPUT_CONTROL			0x0088
>  #define       VI_INPUT_FIELD_DETECT			BIT(27)
>  #define       VI_INPUT_BT656				BIT(25)
> @@ -88,6 +99,8 @@ enum tegra_vi_out {
>  #define       VI_OUTPUT_OUTPUT_FORMAT_SFT		0
>  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV422POST	(3 << VI_OUTPUT_OUTPUT_=
FORMAT_SFT)
>  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR	(6 << VI_OUTPUT_OUTPU=
T_FORMAT_SFT)
> +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPA_BAYER	(7 << VI_OUTPUT_OUTP=
UT_FORMAT_SFT)
> +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPB_BAYER	(8 << VI_OUTPUT_OUTP=
UT_FORMAT_SFT)
>  #define       VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT	(9 << VI_OUTPUT_O=
UTPUT_FORMAT_SFT)
> =20
>  #define TEGRA_VI_VIP_H_ACTIVE				0x00a4
> @@ -152,8 +165,106 @@ enum tegra_vi_out {
>  #define TEGRA_VI_VI_RAISE				0x01ac
>  #define       VI_VI_RAISE_ON_EDGE			BIT(0)
> =20
> +#define TEGRA_VI_CSI_PP_RAISE_FRAME_START(n)		(0x01d8 + (n) * 8)
> +#define TEGRA_VI_CSI_PP_RAISE_FRAME_END(n)		(0x01dc + (n) * 8)
> +#define TEGRA_VI_CSI_PP_H_ACTIVE(n)			(0x01e8 + (n) * 8)
> +#define TEGRA_VI_CSI_PP_V_ACTIVE(n)			(0x01ec + (n) * 8)
> +
> +/* Tegra20 CSI registers: Starts from 0x800, offset 0x0 */
> +#define TEGRA_CSI_VI_INPUT_STREAM_CONTROL		0x0000
> +#define TEGRA_CSI_HOST_INPUT_STREAM_CONTROL		0x0008
> +#define TEGRA_CSI_INPUT_STREAM_CONTROL(n)		(0x0010 + (n) * 0x2c)
> +#define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
> +#define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
> +#define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
> +#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
> +#define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
> +#define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
> +#define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
> +#define       CSI_PP_PAD_SHORT_LINE_PAD1S		(1 << 24)
> +#define       CSI_PP_PAD_SHORT_LINE_NOPAD		(2 << 24)
> +#define       CSI_PP_EMBEDDED_DATA_EMBEDDED		BIT(20)
> +#define       CSI_PP_OUTPUT_FORMAT_ARBITRARY		(0 << 16)
> +#define       CSI_PP_OUTPUT_FORMAT_PIXEL		(1 << 16)
> +#define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP		(2 << 16)
> +#define       CSI_PP_OUTPUT_FORMAT_STORE		(3 << 16)
> +#define       CSI_PP_VIRTUAL_CHANNEL_ID(n)		(((n) - 1) << 14)
> +#define       CSI_PP_DATA_TYPE(n)			((n) << 8)
> +#define       CSI_PP_CRC_CHECK_ENABLE			BIT(7)
> +#define       CSI_PP_WORD_COUNT_HEADER			BIT(6)
> +#define       CSI_PP_DATA_IDENTIFIER_ENABLE		BIT(5)
> +#define       CSI_PP_PACKET_HEADER_SENT			BIT(4)
> +#define TEGRA_CSI_PIXEL_STREAM_CONTROL1(n)		(0x001c + (n) * 0x2c)
> +#define TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(n)		(0x0020 + (n) * 0x2c)
> +#define TEGRA_CSI_PIXEL_STREAM_GAP(n)			(0x0024 + (n) * 0x2c)
> +#define       CSI_PP_FRAME_MIN_GAP(n)			(((n) & 0xffff) << 16)
> +#define       CSI_PP_LINE_MIN_GAP(n)			(((n) & 0xffff))
> +#define TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(n)		(0x0028 + (n) * 0x2c)
> +#define       CSI_PP_START_MARKER_FRAME_MAX(n)		(((n) & 0xf) << 12)
> +#define       CSI_PP_START_MARKER_FRAME_MIN(n)		(((n) & 0xf) << 8)
> +#define       CSI_PP_VSYNC_START_MARKER			BIT(4)
> +#define       CSI_PP_SINGLE_SHOT			BIT(2)
> +#define       CSI_PP_NOP				0
> +#define       CSI_PP_ENABLE				1
> +#define       CSI_PP_DISABLE				2
> +#define       CSI_PP_RST				3
> +#define TEGRA_CSI_PHY_CIL_COMMAND			0x0068
> +#define       CSI_A_PHY_CIL_NOP				0x0
> +#define       CSI_A_PHY_CIL_ENABLE			0x1
> +#define       CSI_A_PHY_CIL_DISABLE			0x2
> +#define       CSI_A_PHY_CIL_ENABLE_MASK			0x3
> +#define       CSI_B_PHY_CIL_NOP				(0x0 << 16)
> +#define       CSI_B_PHY_CIL_ENABLE			(0x1 << 16)
> +#define       CSI_B_PHY_CIL_DISABLE			(0x2 << 16)
> +#define       CSI_B_PHY_CIL_ENABLE_MASK			(0x3 << 16)
> +#define TEGRA_CSI_PHY_CIL_CONTROL0(n)			(0x006c + (n) * 4)
> +#define       CSI_CONTINUOUS_CLOCK_MODE_ENABLE		BIT(5)
> +#define TEGRA_CSI_CSI_PIXEL_PARSER_STATUS		0x0078
> +#define TEGRA_CSI_CSI_CIL_STATUS			0x007c
> +#define       CSI_MIPI_AUTO_CAL_DONE			BIT(15)
> +#define TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUPT_MASK	0x0080
> +#define TEGRA_CSI_CSI_CIL_INTERRUPT_MASK		0x0084
> +#define TEGRA_CSI_CSI_READONLY_STATUS			0x0088
> +#define TEGRA_CSI_ESCAPE_MODE_COMMAND			0x008c
> +#define TEGRA_CSI_ESCAPE_MODE_DATA			0x0090
> +#define TEGRA_CSI_CIL_PAD_CONFIG0(n)			(0x0094 + (n) * 8)
> +#define TEGRA_CSI_CIL_PAD_CONFIG1(n)			(0x0098 + (n) * 8)
> +#define TEGRA_CSI_CIL_PAD_CONFIG			0x00a4
> +#define TEGRA_CSI_CILA_MIPI_CAL_CONFIG			0x00a8
> +#define TEGRA_CSI_CILB_MIPI_CAL_CONFIG			0x00ac
> +#define       CSI_CIL_MIPI_CAL_STARTCAL			BIT(31)
> +#define       CSI_CIL_MIPI_CAL_OVERIDE_A		BIT(30)
> +#define       CSI_CIL_MIPI_CAL_OVERIDE_B		BIT(30)
> +#define       CSI_CIL_MIPI_CAL_NOISE_FLT(n)		(((n) & 0xf) << 26)
> +#define       CSI_CIL_MIPI_CAL_PRESCALE(n)		(((n) & 0x3) << 24)
> +#define       CSI_CIL_MIPI_CAL_SEL_A			BIT(21)
> +#define       CSI_CIL_MIPI_CAL_SEL_B			BIT(21)
> +#define       CSI_CIL_MIPI_CAL_HSPDOS(n)		(((n) & 0x1f) << 16)
> +#define       CSI_CIL_MIPI_CAL_HSPUOS(n)		(((n) & 0x1f) << 8)
> +#define       CSI_CIL_MIPI_CAL_TERMOS(n)		(((n) & 0x1f))
> +#define TEGRA_CSI_CIL_MIPI_CAL_STATUS			0x00b0
> +#define TEGRA_CSI_CLKEN_OVERRIDE			0x00b4
> +#define TEGRA_CSI_DEBUG_CONTROL				0x00b8
> +#define       CSI_DEBUG_CONTROL_DEBUG_EN_ENABLED	BIT(0)
> +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_0		BIT(4)
> +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_1		BIT(5)
> +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_2		BIT(6)
> +#define       CSI_DEBUG_CONTROL_DBG_CNT_SEL(n, v)	((v) << (8 + 8 * (n)))
> +#define TEGRA_CSI_DEBUG_COUNTER(n)			(0x00bc + (n) * 4)
> +#define TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(n)	(0x00c8 + (n) * 4)
> +#define       CSI_PP_EXP_FRAME_HEIGHT(n)		(((n) & 0x1fff) << 16)
> +#define       CSI_PP_MAX_CLOCKS(n)			(((n) & 0xfff) << 4)
> +#define       CSI_PP_LINE_TIMEOUT_ENABLE		BIT(0)
> +#define TEGRA_CSI_DSI_MIPI_CAL_CONFIG			0x00d0
> +#define TEGRA_CSI_MIPIBIAS_PAD_CONFIG			0x00d4
> +#define       CSI_PAD_DRIV_DN_REF(n)			(((n) & 0x7) << 16)
> +#define       CSI_PAD_DRIV_UP_REF(n)			(((n) & 0x7) << 8)
> +#define       CSI_PAD_TERM_REF(n)			(((n) & 0x7) << 0)
> +#define TEGRA_CSI_CSI_CILA_STATUS			0x00d8
> +#define TEGRA_CSI_CSI_CILB_STATUS			0x00dc
> +
>  /* ---------------------------------------------------------------------=
-----
> - * VI
> + * Read and Write helpers
>   */
> =20
>  static void tegra20_vi_write(struct tegra_vi_channel *chan, unsigned int=
 addr, u32 val)
> @@ -161,6 +272,35 @@ static void tegra20_vi_write(struct tegra_vi_channel=
 *chan, unsigned int addr, u
>  	writel(val, chan->vi->iomem + addr);
>  }
> =20
> +static int __maybe_unused tegra20_vi_read(struct tegra_vi_channel *chan,=
 unsigned int addr)
> +{
> +	return readl(chan->vi->iomem + addr);
> +}
> +
> +static void tegra20_csi_write(struct tegra_csi_channel *csi_chan, unsign=
ed int addr, u32 val)
> +{
> +	writel(val, csi_chan->csi->iomem + addr);
> +}
> +
> +static int __maybe_unused tegra20_csi_read(struct tegra_csi_channel *csi=
_chan, unsigned int addr)
> +{
> +	return readl(csi_chan->csi->iomem + addr);
> +}
> +
> +static void tegra20_mipi_write(struct tegra_mipi_device *mipi, unsigned =
int addr, u32 val)
> +{
> +	writel(val, mipi->csi->iomem + addr);
> +}
> +
> +static int __maybe_unused tegra20_mipi_read(struct tegra_mipi_device *mi=
pi, unsigned int addr)
> +{
> +	return readl(mipi->csi->iomem + addr);
> +}
> +
> +/* ---------------------------------------------------------------------=
-----
> + * VI
> + */
> +
>  /*
>   * Get the main input format (YUV/RGB...) and the YUV variant as values =
to
>   * be written into registers for the current VI input mbus code.
> @@ -283,20 +423,27 @@ static int tegra20_vi_enable(struct tegra_vi *vi, b=
ool on)
>  static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channel *c=
han)
>  {
>  	struct tegra_vi *vi =3D chan->vi;
> -	struct host1x_syncpt *out_sp;
> +	struct host1x_syncpt *out_sp, *fs_sp;
> =20
>  	out_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANA=
GED);
>  	if (!out_sp)
> -		return dev_err_probe(vi->dev, -ENOMEM, "failed to request syncpoint\n"=
);
> +		return dev_err_probe(vi->dev, -EBUSY, "failed to request mw ack syncpo=
int\n");
> =20
>  	chan->mw_ack_sp[0] =3D out_sp;
> =20
> +	fs_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAG=
ED);
> +	if (!fs_sp)
> +		return dev_err_probe(vi->dev, -EBUSY, "failed to request frame start s=
yncpoint\n");
> +
> +	chan->frame_start_sp[0] =3D fs_sp;
> +
>  	return 0;
>  }
> =20
>  static void tegra20_channel_host1x_syncpt_free(struct tegra_vi_channel *=
chan)
>  {
>  	host1x_syncpt_put(chan->mw_ack_sp[0]);
> +	host1x_syncpt_put(chan->frame_start_sp[0]);
>  }
> =20
>  static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int =
bpp)
> @@ -417,41 +564,68 @@ static void tegra20_channel_vi_buffer_setup(struct =
tegra_vi_channel *chan,
>  }
> =20
>  static int tegra20_channel_capture_frame(struct tegra_vi_channel *chan,
> -					 struct tegra_channel_buffer *buf)
> +					 struct tegra_channel_buffer *buf,
> +					 struct tegra_csi_channel *csi_chan)
>  {
>  	int err;
> =20
> -	chan->next_out_sp_idx++;
> -
>  	tegra20_channel_vi_buffer_setup(chan, buf);
> =20
> -	tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_VIP_E=
NABLE);
> +	if (csi_chan) {
> +		u32 port =3D csi_chan->csi_port_nums[0] & 1;
> +
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +				  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +				  CSI_PP_SINGLE_SHOT | CSI_PP_ENABLE);
> +
> +		err =3D host1x_syncpt_wait(chan->frame_start_sp[0], chan->next_fs_sp_v=
alue + 1,
> +					 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
> +		if (err) {
> +			if (err !=3D -ERESTARTSYS)
> +				dev_err_ratelimited(&chan->video.dev,
> +						    "frame start syncpt timeout: %d\n", err);
> +		} else {
> +			chan->next_fs_sp_value++;
> +		}

Did you try the idea about resetting the HW and re-checking the syncpoint v=
alue to avoid race conditions?

> +
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +				  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +				  CSI_PP_DISABLE);
> +	} else {
> +		tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_VIP_=
ENABLE);
> +	}
> =20
> -	/* Wait for syncpt counter to reach frame start event threshold */
> +	chan->next_out_sp_idx++;
>  	err =3D host1x_syncpt_wait(chan->mw_ack_sp[0], chan->next_out_sp_idx,
>  				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
>  	if (err) {
>  		host1x_syncpt_incr(chan->mw_ack_sp[0]);
> -		dev_err_ratelimited(&chan->video.dev, "frame start syncpt timeout: %d\=
n", err);
> -		release_buffer(chan, buf, VB2_BUF_STATE_ERROR);
> -		return err;
> +		if (err !=3D -ERESTARTSYS)
> +			dev_err_ratelimited(&chan->video.dev, "mw ack syncpt timeout: %d\n", =
err);
>  	}
> =20
> -	tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> -			 VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAMERA_CONTROL_VIP_ENABLE);
> +	if (!csi_chan)
> +		tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> +				 VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAMERA_CONTROL_VIP_ENABLE);
> =20
>  	release_buffer(chan, buf, VB2_BUF_STATE_DONE);
> =20
> -	return 0;
> +	return err;
>  }
> =20
>  static int tegra20_chan_capture_kthread_start(void *data)
>  {
>  	struct tegra_vi_channel *chan =3D data;
>  	struct tegra_channel_buffer *buf;
> +	struct v4l2_subdev *csi_subdev =3D NULL;
> +	struct tegra_csi_channel *csi_chan =3D NULL;
>  	unsigned int retries =3D 0;
>  	int err =3D 0;
> =20
> +	csi_subdev =3D tegra_channel_get_remote_csi_subdev(chan);
> +	if (csi_subdev)
> +		csi_chan =3D to_csi_chan(csi_subdev);
> +
>  	while (1) {
>  		/*
>  		 * Source is not streaming if error is non-zero.
> @@ -476,7 +650,7 @@ static int tegra20_chan_capture_kthread_start(void *d=
ata)
>  		list_del_init(&buf->queue);
>  		spin_unlock(&chan->start_lock);
> =20
> -		err =3D tegra20_channel_capture_frame(chan, buf);
> +		err =3D tegra20_channel_capture_frame(chan, buf, csi_chan);
>  		if (!err) {
>  			retries =3D 0;
>  			continue;
> @@ -503,28 +677,6 @@ static void tegra20_camera_capture_setup(struct tegr=
a_vi_channel *chan)
>  	enum tegra_vi_out output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_R=
AW8 ||
>  					    data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
>  					    TEGRA_VI_OUT_2 : TEGRA_VI_OUT_1;
> -	int main_output_format;
> -	int yuv_output_format;
> -
> -	tegra20_vi_get_output_formats(chan, &main_output_format, &yuv_output_fo=
rmat);
> -
> -	/*
> -	 * Set up low pass filter.  Use 0x240 for chromaticity and 0x240
> -	 * for luminance, which is the default and means not to touch
> -	 * anything.
> -	 */
> -	tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> -			 0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> -			 0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> -
> -	/* Set up raise-on-edge, so we get an interrupt on end of frame. */
> -	tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> -
> -	tegra20_vi_write(chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
> -			 (chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> -			 (chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> -			 yuv_output_format << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT |
> -			 main_output_format << VI_OUTPUT_OUTPUT_FORMAT_SFT);
> =20
>  	/* Set up frame size */
>  	tegra20_vi_write(chan, TEGRA_VI_OUTPUT_FRAME_SIZE(output_channel),
> @@ -555,18 +707,31 @@ static int tegra20_vi_start_streaming(struct vb2_qu=
eue *vq, u32 count)
>  	struct media_pipeline *pipe =3D &chan->video.pipe;
>  	int err;
> =20
> +	chan->next_fs_sp_value =3D host1x_syncpt_read(chan->frame_start_sp[0]);
>  	chan->next_out_sp_idx =3D host1x_syncpt_read(chan->mw_ack_sp[0]);
> =20
>  	err =3D video_device_pipeline_start(&chan->video, pipe);
>  	if (err)
>  		goto error_pipeline_start;
> =20
> -	tegra20_camera_capture_setup(chan);
> +	/*
> +	 * Set up low pass filter.  Use 0x240 for chromaticity and 0x240
> +	 * for luminance, which is the default and means not to touch
> +	 * anything.
> +	 */
> +	tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> +			 0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> +			 0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> +
> +	/* Set up raise-on-edge, so we get an interrupt on end of frame. */
> +	tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> =20
>  	err =3D tegra_channel_set_stream(chan, true);
>  	if (err)
>  		goto error_set_stream;
> =20
> +	tegra20_camera_capture_setup(chan);
> +
>  	chan->sequence =3D 0;
> =20
>  	chan->kthread_start_capture =3D kthread_run(tegra20_chan_capture_kthrea=
d_start,
> @@ -658,6 +823,348 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
>  	.has_h_v_flip =3D true,
>  };
> =20
> +/* ---------------------------------------------------------------------=
-----
> + * MIPI Calibration
> + */
> +static int tegra20_start_pad_calibration(struct tegra_mipi_device *mipi)
> +{
> +	struct tegra_csi *csi =3D mipi->csi;
> +	unsigned int port =3D mipi->pads;
> +	u32 value;
> +	int ret;
> +
> +	guard(mutex)(&csi->mipi_lock);
> +
> +	ret =3D pm_runtime_resume_and_get(csi->dev);
> +	if (ret < 0) {
> +		dev_err(csi->dev, "failed to get runtime PM: %d\n", ret);
> +		return ret;
> +	}
> +
> +	tegra20_mipi_write(mipi, TEGRA_CSI_DSI_MIPI_CAL_CONFIG,
> +			   CSI_CIL_MIPI_CAL_HSPDOS(4) |
> +			   CSI_CIL_MIPI_CAL_HSPUOS(3) |
> +			   CSI_CIL_MIPI_CAL_TERMOS(0));
> +	tegra20_mipi_write(mipi, TEGRA_CSI_MIPIBIAS_PAD_CONFIG,
> +			   CSI_PAD_DRIV_DN_REF(5) |
> +			   CSI_PAD_DRIV_UP_REF(7) |
> +			   CSI_PAD_TERM_REF(0));
> +
> +	/* CSI B */
> +	value =3D CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +		CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +		CSI_CIL_MIPI_CAL_TERMOS(4);
> +
> +	if (port =3D=3D PORT_B)
> +		value |=3D CSI_CIL_MIPI_CAL_SEL_B;
> +
> +	tegra20_mipi_write(mipi, TEGRA_CSI_CILB_MIPI_CAL_CONFIG, value);
> +
> +	/* CSI A */
> +	value =3D CSI_CIL_MIPI_CAL_STARTCAL |
> +		CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> +		CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> +		CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +		CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +		CSI_CIL_MIPI_CAL_TERMOS(4);
> +
> +	if (port =3D=3D PORT_A)
> +		value |=3D CSI_CIL_MIPI_CAL_SEL_A;
> +
> +	tegra20_mipi_write(mipi, TEGRA_CSI_CILA_MIPI_CAL_CONFIG, value);
> +
> +	tegra20_mipi_write(mipi, TEGRA_CSI_CIL_PAD_CONFIG, 0);
> +
> +	return 0;
> +}
> +
> +static int tegra20_finish_pad_calibration(struct tegra_mipi_device *mipi=
)
> +{
> +	struct tegra_csi *csi =3D mipi->csi;
> +	void __iomem *cil_status_reg =3D csi->iomem + TEGRA_CSI_CSI_CIL_STATUS;
> +	unsigned int port =3D mipi->pads;
> +	u32 value, pp, cil;
> +	int ret;
> +
> +	/* This part is only for CSI */
> +	if (port > PORT_B) {
> +		pm_runtime_put(csi->dev);
> +
> +		return 0;
> +	}
> +
> +	guard(mutex)(&csi->mipi_lock);
> +
> +	ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> +					 value & CSI_MIPI_AUTO_CAL_DONE, 50, 250000);
> +	if (ret < 0) {
> +		dev_warn(csi->dev, "MIPI calibration timeout!\n");
> +		goto exit;
> +	}
> +
> +	/* clear status */
> +	tegra20_mipi_write(mipi, TEGRA_CSI_CSI_CIL_STATUS, value);
> +	ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> +					 !(value & CSI_MIPI_AUTO_CAL_DONE), 50, 250000);
> +	if (ret < 0) {
> +		dev_warn(csi->dev, "MIPI calibration status timeout!\n");
> +		goto exit;
> +	}
> +
> +	pp =3D tegra20_mipi_read(mipi, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS);
> +	cil =3D tegra20_mipi_read(mipi, TEGRA_CSI_CSI_CIL_STATUS);
> +	if (pp | cil) {
> +		dev_warn(csi->dev, "Calibration status not been cleared!\n");
> +		ret =3D -EINVAL;
> +		goto exit;
> +	}
> +
> +exit:
> +	tegra20_mipi_write(mipi, TEGRA_CSI_CSI_CIL_STATUS, pp);
> +
> +	/* un-select to avoid interference with DSI */
> +	tegra20_mipi_write(mipi, TEGRA_CSI_CILB_MIPI_CAL_CONFIG,
> +			   CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +			   CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +			   CSI_CIL_MIPI_CAL_TERMOS(4));
> +
> +	tegra20_mipi_write(mipi, TEGRA_CSI_CILA_MIPI_CAL_CONFIG,
> +			   CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> +			   CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> +			   CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +			   CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +			   CSI_CIL_MIPI_CAL_TERMOS(4));
> +
> +	pm_runtime_put(csi->dev);
> +
> +	return ret;
> +}
> +
> +static const struct tegra_mipi_ops tegra20_mipi_ops =3D {
> +	.tegra_mipi_start_calibration =3D tegra20_start_pad_calibration,
> +	.tegra_mipi_finish_calibration =3D tegra20_finish_pad_calibration,
> +};

This patch is very long, maybe split the MIPI calibration into a separate p=
atch to make it easier to read.

> +
> +/* ---------------------------------------------------------------------=
-----
> + * CSI
> + */
> +static void tegra20_csi_capture_clean(struct tegra_csi_channel *csi_chan=
)
> +{
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_VI_INPUT_STREAM_CONTROL, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_HOST_INPUT_STREAM_CONTROL, 0);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUPT_MASK, =
0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_INTERRUPT_MASK, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_READONLY_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_COMMAND, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_DATA, 0);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_MIPI_CAL_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CLKEN_OVERRIDE, 0);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_DEBUG_CONTROL,
> +			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_0 |
> +			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_1 |
> +			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_2);
> +}
> +
> +static int tegra20_csi_port_start_streaming(struct tegra_csi_channel *cs=
i_chan,
> +					    u8 portno)
> +{
> +	struct tegra_vi_channel *vi_chan =3D v4l2_get_subdev_hostdata(&csi_chan=
->subdev);
> +	int width  =3D vi_chan->format.width;
> +	int height =3D vi_chan->format.height;
> +	u32 data_type =3D vi_chan->fmtinfo->img_dt;
> +	u32 word_count =3D (width * vi_chan->fmtinfo->bit_width) / 8;
> +	enum tegra_vi_out output_channel =3D TEGRA_VI_OUT_1;
> +
> +	unsigned int main_output_format, yuv_output_format;
> +	unsigned int port =3D portno & 1;
> +	u32 value;
> +
> +	tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yuv_output=
_format);
> +
> +	switch (data_type) {
> +	case TEGRA_IMAGE_DT_RAW8:
> +	case TEGRA_IMAGE_DT_RAW10:
> +		output_channel =3D TEGRA_VI_OUT_2;
> +		if (port =3D=3D PORT_A)
> +			main_output_format =3D VI_OUTPUT_OUTPUT_FORMAT_CSI_PPA_BAYER;
> +		else
> +			main_output_format =3D VI_OUTPUT_OUTPUT_FORMAT_CSI_PPB_BAYER;
> +		break;
> +	}
> +
> +	tegra20_csi_capture_clean(csi_chan);
> +
> +	/* CSI port cleanup */
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(port), 0)=
;
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port), 0)=
;
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(port)=
, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG0(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG1(port), 0);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, BIT(25 + port)); /*=
 CSI_PP_YUV422 */
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_H_DOWNSCALE_CONTROL, BIT(2 + port));=
 /* CSI_PP */
> +	tegra20_vi_write(vi_chan, TEGRA_VI_V_DOWNSCALE_CONTROL, BIT(2 + port));=
 /* CSI_PP */
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_H_ACTIVE(port), width << 16);
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_V_ACTIVE(port), height << 16)=
;
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(port), 0x1)=
;
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(port), wo=
rd_count);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port),
> +			  CSI_PP_FRAME_MIN_GAP(0x14)); /* 14 vi clks between frames */
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(port)=
,
> +			  CSI_PP_EXP_FRAME_HEIGHT(height) |
> +			  CSI_PP_MAX_CLOCKS(0x300) | /* wait 0x300 vi clks for timeout */
> +			  CSI_PP_LINE_TIMEOUT_ENABLE);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(port),
> +			  CSI_PP_OUTPUT_FORMAT_PIXEL |
> +			  CSI_PP_DATA_TYPE(data_type) |
> +			  CSI_PP_CRC_CHECK_ENABLE |
> +			  CSI_PP_WORD_COUNT_HEADER |
> +			  CSI_PP_DATA_IDENTIFIER_ENABLE |
> +			  CSI_PP_PACKET_HEADER_SENT |
> +			  port);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port),
> +			  CSI_SKIP_PACKET_THRESHOLD(0x3f) |
> +			  (csi_chan->numlanes - 1));
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port),
> +			  CSI_CONTINUOUS_CLOCK_MODE_ENABLE |
> +			  0x5); /* Clock settle time */
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START(port)=
,
> +			 VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> +			 host1x_syncpt_id(vi_chan->frame_start_sp[0])
> +			 << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT(output_channel),
> +			 VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> +			 host1x_syncpt_id(vi_chan->mw_ack_sp[0])
> +			 << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> +
> +	value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_D=
ISABLE :
> +		CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_DISABLE;
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +			  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +			  CSI_PP_DISABLE);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
> +			 (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> +			 (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> +			 yuv_output_format | main_output_format);
> +
> +	return 0;
> +};
> +
> +static void tegra20_csi_port_stop_streaming(struct tegra_csi_channel *cs=
i_chan, u8 portno)
> +{
> +	struct tegra_csi *csi =3D csi_chan->csi;
> +	unsigned int port =3D portno & 1;
> +	u32 value;
> +
> +	value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS)=
;
> +	dev_dbg(csi->dev, "TEGRA_CSI_CSI_PIXEL_PARSER_STATUS 0x%08x\n", value);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, value);
> +
> +	value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_CIL_STATUS);
> +	dev_dbg(csi->dev, "TEGRA_CSI_CSI_CIL_STATUS 0x%08x\n", value);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, value);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +			  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +			  CSI_PP_DISABLE);
> +
> +	if (csi_chan->numlanes =3D=3D 4) {
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND,
> +				  CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_DISABLE);
> +	} else {
> +		value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL=
_NOP :
> +			CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NOP;
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
> +	}
> +}
> +
> +static int tegra20_csi_start_streaming(struct tegra_csi_channel *csi_cha=
n)
> +{
> +	u8 *portnos =3D csi_chan->csi_port_nums;
> +	int ret, i;
> +
> +	for (i =3D 0; i < csi_chan->numgangports; i++) {
> +		ret =3D tegra20_csi_port_start_streaming(csi_chan, portnos[i]);
> +		if (ret)
> +			goto stream_start_fail;
> +	}
> +
> +	return 0;
> +
> +stream_start_fail:
> +	for (i =3D i - 1; i >=3D 0; i--)
> +		tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
> +
> +	return ret;
> +}
> +
> +static void tegra20_csi_stop_streaming(struct tegra_csi_channel *csi_cha=
n)
> +{
> +	u8 *portnos =3D csi_chan->csi_port_nums;
> +	int i;
> +
> +	for (i =3D 0; i < csi_chan->numgangports; i++)
> +		tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
> +}
> +
> +/* Tegra20 CSI operations */

These comments don't add much.

Thanks,
Mikko

> +static const struct tegra_csi_ops tegra20_csi_ops =3D {
> +	.csi_start_streaming =3D tegra20_csi_start_streaming,
> +	.csi_stop_streaming =3D tegra20_csi_stop_streaming,
> +};
> +
> +static const char * const tegra20_csi_clks[] =3D {
> +	NULL,
> +};
> +
> +/* Tegra20 CSI SoC data */
> +const struct tegra_csi_soc tegra20_csi_soc =3D {
> +	.ops =3D &tegra20_csi_ops,
> +	.mipi_ops =3D &tegra20_mipi_ops,
> +	.csi_max_channels =3D 2, /* CSI-A and CSI-B */
> +	.clk_names =3D tegra20_csi_clks,
> +	.num_clks =3D ARRAY_SIZE(tegra20_csi_clks),
> +};
> +
> +static const char * const tegra30_csi_clks[] =3D {
> +	"csi",
> +	"csia-pad",
> +	"csib-pad",
> +};
> +
> +/* Tegra30 CSI SoC data */
> +const struct tegra_csi_soc tegra30_csi_soc =3D {
> +	.ops =3D &tegra20_csi_ops,
> +	.mipi_ops =3D &tegra20_mipi_ops,
> +	.csi_max_channels =3D 2, /* CSI-A and CSI-B */
> +	.clk_names =3D tegra30_csi_clks,
> +	.num_clks =3D ARRAY_SIZE(tegra30_csi_clks),
> +};
> +
>  /* ---------------------------------------------------------------------=
-----
>   * VIP
>   */
> @@ -677,10 +1184,11 @@ static int tegra20_vip_start_streaming(struct tegr=
a_vip_channel *vip_chan)
>  	enum tegra_vi_out output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_R=
AW8 ||
>  					    data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
>  					    TEGRA_VI_OUT_2 : TEGRA_VI_OUT_1;
> -	unsigned int main_input_format;
> -	unsigned int yuv_input_format;
> +	unsigned int main_input_format, yuv_input_format;
> +	unsigned int main_output_format, yuv_output_format;
> =20
>  	tegra20_vi_get_input_formats(vi_chan, &main_input_format, &yuv_input_fo=
rmat);
> +	tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yuv_output=
_format);
> =20
>  	tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, 0);
> =20
> @@ -713,6 +1221,11 @@ static int tegra20_vip_start_streaming(struct tegra=
_vip_channel *vip_chan)
> =20
>  	tegra20_vi_write(vi_chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_ST=
OP_CAPTURE);
> =20
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
> +			 (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> +			 (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> +			  yuv_output_format | main_output_format);
> +
>  	return 0;
>  }
> =20
> diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/med=
ia/tegra-video/vi.h
> index 367667adf745..648dde82a14b 100644
> --- a/drivers/staging/media/tegra-video/vi.h
> +++ b/drivers/staging/media/tegra-video/vi.h
> @@ -124,6 +124,7 @@ struct tegra_vi {
>   *		frame through host1x syncpoint counters (On Tegra20 used for the
>   *              OUT_1 syncpt)
>   * @sp_incr_lock: protects cpu syncpoint increment.
> + * @next_fs_sp_idx: next expected value for frame_start_sp[0] (Tegra20)
>   * @next_out_sp_idx: next expected value for mw_ack_sp[0], i.e. OUT_1 (T=
egra20)
>   *
>   * @kthread_start_capture: kthread to start capture of single frame when
> @@ -188,6 +189,7 @@ struct tegra_vi_channel {
>  	/* protects the cpu syncpoint increment */
>  	spinlock_t sp_incr_lock[GANG_PORTS_MAX];
>  	u32 next_out_sp_idx;
> +	u32 next_fs_sp_value;
> =20
>  	struct task_struct *kthread_start_capture;
>  	wait_queue_head_t start_wait;
> diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/=
media/tegra-video/video.c
> index 6fe8d5301b9c..9f2bddc460bf 100644
> --- a/drivers/staging/media/tegra-video/video.c
> +++ b/drivers/staging/media/tegra-video/video.c
> @@ -127,6 +127,12 @@ static const struct of_device_id host1x_video_subdev=
s[] =3D {
>  	{ .compatible =3D "nvidia,tegra20-vip", },
>  	{ .compatible =3D "nvidia,tegra20-vi", },
>  #endif
> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> +	{ .compatible =3D "nvidia,tegra20-csi", },
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> +	{ .compatible =3D "nvidia,tegra30-csi", },
> +#endif
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>  	{ .compatible =3D "nvidia,tegra210-csi", },
>  	{ .compatible =3D "nvidia,tegra210-vi", },
>=20




