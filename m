Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACEBB947D8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 08:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A07310E565;
	Tue, 23 Sep 2025 06:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eMbh2+Zs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010031.outbound.protection.outlook.com [52.101.56.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E687710E565
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 06:04:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yW2zRgVJ27D+b2J3XXAegmLsE/2AAJabl5p2W8kMlKv5kAMdKff+rVy7j8VIrTprkJ9LQOTEggRBVIAXtVK7DVXdtpnIwgS2YUTW5rao3dByiu/rsPMcbeYhwpEZbg4NC4TVGbbpQvnLyQDsAXMEftNiTWABuEjB+h9UMczgEGqFF133TD38XjQcL9efw3HgYFHPi7gSkQduxxyT3zY60PU9wBU9lR1A39yv/TMFRgIwkrw/XhGBuQ6QQk3LFJiddxmvCE7hJWUNrz3p3SO/ltSxs+6q5ydNg2+mlXLzPWvtJWpCYBHJ1dNXQdwy84ziSGSiXkIGPXDzdoOLCgBRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ge+vDOMbBlUkJXcGgzVWDnAOSBHpUu57ob+lgHfSWe4=;
 b=pYXakNMUmk64BZ/Lt4G8A3xQfhCa6vUiaXAl5ORVWuiRzqHM9GfqgpfM7XoLhJEc8E7WIMKQjedT2iNKQfC5LM42MnDKhkiuEYu3gBj0kY2e7+C1jqMp7MGJf7z04O3LGnHg5voEghagCXwXHyfg3Up5ZP+FrMYd2J8A4AKwmIoWhVTY9ocR1BrXW2O+yPow3XPgElZ8sWW0A36E6j3aMwhhEkAko2gKIACMGFxEc1IE3D01rFfSifjOS111a0h5f8xZD3PpSiKfnMcU+8SiiD7xwxBUFr4M4HnhfF0nlwU+db8dvwR92qeCbWM3yTos8HBvzNLBDyxXyTZlS8237g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ge+vDOMbBlUkJXcGgzVWDnAOSBHpUu57ob+lgHfSWe4=;
 b=eMbh2+ZsmkS1grpOyJBX+xcVAmfslzfr/YtV0eU2SD8Py/bAHJIrJf19rsdPk44sO7ZFB6rcHKDsI/CWewh/mmlJD7ml/ZUJuqB7WNLxcmUpGJK7yt6sIlHoKPz1rFWkNm4Cg2VamHG2NXPZAMvbKxfy83k6wzsHuEA7yqTBk+TjF/oPVG/c3r0c6yuLOHkwdriw3Ibq/GxFYPQ6StyMl7b3tz7hghS1WN9bSmSBRakppX7PCaaOtxQuS+VFryclWUjspeWtMzI8WYyo+ar4tAVnZRoGmwi/PGUgMrLZgHiADvWMWhVB16jiHLW/PSJS7cAvMiog9K3YlT3pXGQI4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 DS5PPFDB3A23D1A.namprd12.prod.outlook.com (2603:10b6:f:fc00::663)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Tue, 23 Sep
 2025 06:04:15 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 06:04:15 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
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
 Dmitry Osipenko <digetx@gmail.com>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 16/23] staging: media: tegra-video: tegra20: simplify
 format align calculations
Date: Tue, 23 Sep 2025 15:03:57 +0900
Message-ID: <7680340.18pcnM708K@senjougahara>
In-Reply-To: <CAPVz0n1ozJ13MB4eFMAJzESe8iQ7SKjMApZCLFAZ_eubCFs0tg@mail.gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <3074302.Sgy9Pd6rRy@senjougahara>
 <CAPVz0n1ozJ13MB4eFMAJzESe8iQ7SKjMApZCLFAZ_eubCFs0tg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0037.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::12) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|DS5PPFDB3A23D1A:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d0f73a1-ac55-4d81-ba9a-08ddfa67066d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1ZNUTRsUjdlWFA2S2NQMmV2bnlNZG05MVR3MVJ6eVZjZDhkVjRRZElxWk1h?=
 =?utf-8?B?bVFsbmZiUlRaaFNpbE1zL2d5OEphc2drb2tPNTNreXZZWlpwZ2ozMk1vblkv?=
 =?utf-8?B?UWpHYVdjL2ErVzh0SnZiS1lSUU5MTjZJcFp0OXNFb1BhN2RwV1FnaVNHMC9x?=
 =?utf-8?B?SWVNWDhHQzJXRDlZeHJkRGNkcjV1c3UrbGh5S2JGd0thbVBRTjJqSFhvWHhN?=
 =?utf-8?B?bGN2Wk9OYVJCSW9QUlgrN0dicG9ja3phbFV5aEpIYnFhWVlBWlNCTjVtajFt?=
 =?utf-8?B?N2ZuL09NSGFNWG1QZjV5Y1FXc1ZBcXVENkovKzcxYy96ZVRSYm5aN3pvMHR1?=
 =?utf-8?B?dlpoQVFRUVo5cFZyMDJHVGJuK1gySkVueWNtT2ZlZzdjRVhGdnh6YXB5eStz?=
 =?utf-8?B?L3B2NW1xMjlPY0dNbEszemNDbFBCVzFnN2lSb3BSQ3JBYkhzSTNSd29NQk9F?=
 =?utf-8?B?QzhuMXIrVGgvTnpPU1Z1U2FlT3pLdVQ3NVYwSGJ3c0lnMTNjWTJMYnlYanF3?=
 =?utf-8?B?U2JqVXJNRnR1YUFwa2R2TDhJZDhqdE51eUNLdE5tRnVFSi9qNHFNeFVieUZZ?=
 =?utf-8?B?YjBwYVR3OHM1b1hLSUpHOW9Nb3lzS1BsSVUxUzZzdDE5RXdJOHRwMEhJKzYy?=
 =?utf-8?B?bm9QQ2IvMDJhVDNmdjVxQm5PYm0vVk9OVWVzOXdWUjBROUVaTnMyRUV3ZmJT?=
 =?utf-8?B?VHFIcWlkY1FmS0p2dUR0aXBZekxMazJIVndzRkxuY0VydUVBSlBZaG50QzhY?=
 =?utf-8?B?L29VVi9ra2pvMTkwMEJzZ1lrdEFIK0xlalBES2RvRldYOGVLTjNMQkw0TU1k?=
 =?utf-8?B?bmxHREIyaVAyUHZCcnBVcEFrd2swSWh1N1hJcm9rbEs3aGNlTWRpeGJmWWZU?=
 =?utf-8?B?N09CeXRPUVFDWGxyaExPSG9aUU5NbVEyWE5PRGUxVFpTWDdvUUJ4b1Y0NkQ5?=
 =?utf-8?B?VCttZmx4TXV4ZFpObFA3c0wrSzliYmltVENFMUZxOXFSOG1ZdlROaERIaVBR?=
 =?utf-8?B?TC9PQXZzU01wSkg0cEdOVXBrYllrWHRVbkdIcGlQSjhGYnMwUUFnVU1vSmtR?=
 =?utf-8?B?MHlSY28xempzbGYvekRub3dhQWp4ZzE0ODY2ZmJxRU95S1NhVXFCd0Y2a0Js?=
 =?utf-8?B?VllPd3J3OVJTYkwvdzA2bmlKSWJ0Yk53enZJb3YxNFFYTUdqZXhFVlNHMVNZ?=
 =?utf-8?B?ckw3RFhPKytBOGVDNmd3Z1FIUGVCM1VKRFpVeTU5VXR5b1Bqa21BTnJSTktD?=
 =?utf-8?B?cW9DNitoc1lXL0pmZVhCcGNSK1Bpd0ZEK05KVU5mbmVhYXNuN0dvdVlLcUtS?=
 =?utf-8?B?QnZ0anBPajBnMDdhaWFyYVVQM3luTTVLSTMzSFNOVmovYzNrUHVFa3IyVnVG?=
 =?utf-8?B?R3dQYjFLTGMzZGUxWEFNTWYweDQwMk1oNmZzTUFGaEVKQUxucytNRVRNalBq?=
 =?utf-8?B?WVBwV0hkTm1tMm1jemxTMitibzNIN2dhQU5SVmNRcmUraUpzVXg3UEdLOTQr?=
 =?utf-8?B?am5QRmlVaHBwWVVDSk1MOUk4YVdzZHZOdFJheTFMOEQ4eWNETG9GU2VZWnhz?=
 =?utf-8?B?QWxZSWlGYWVORGQrUlZnN2Znc0NXUmRpbWRLQVowOTFMYWp4V2p0WGxmZTZM?=
 =?utf-8?B?WTBqNmVLM280dTZVMGE2T1hCZkJtSVhDRWlmUlA5dmord2JwOE5DeS9yRSth?=
 =?utf-8?B?UEp1cUdiVFNlMTlDQUp5NGduTnU4QjNOc2Izbm1VaG55WVFuekJpUXRpamky?=
 =?utf-8?B?RGVHL2ZRMk0xSVN0WmFtSGRtem12NWRjd0tZNGprczlkb2pDUGhRS3psQlEz?=
 =?utf-8?B?VG1qaUtYaWZIV3hyQmdheFhHZTkrM1N0YWJ5Um10eEI3d01PTDdHVWVNcHFS?=
 =?utf-8?B?Q3VpRWd5eGpCU0JsQ05PaTUzcWRZRGVsU29aRGc4NTB2N1hyaXljWDJYK1ho?=
 =?utf-8?Q?Vrrk0/yCiU8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkZFaTFFY2lTVDlhUGwwd2VUcStMbGRwV2FpSUNUaGRjVklrQ1ZhNXY1WXht?=
 =?utf-8?B?U21WZGdFaElLMXFOVVA2bXl3K3k4dmFYQ1JFRzkvMWRCQWExVVRQVjA1N3Ji?=
 =?utf-8?B?Y3daeGIzcytUNWVjdzdvcEFZNitic09HcWpobk1MRHBtS3k0YnppYUtNY1JJ?=
 =?utf-8?B?c09uODM2VmVUYmtuWS9UNVNqZ2dZWTIrNitKTGVzZE01VllXYyswQmlZY0FG?=
 =?utf-8?B?WGw0Wkp5MkJIcE1kcERNVkJNc0wrREMvaHBuajNvY2tKRTc1ZkNlVVBhMVZ0?=
 =?utf-8?B?V0ltRXl3cy9sR3U2Y0swc2NES1lpcERCU3ppWTZyNDZoWEU5eWJpZUdaRm9u?=
 =?utf-8?B?MmZoV2dFMTB2bUh0bWZ1TXNIYnJWWDhWbXk0djJiK25OUnRRZkdvNnJtcXNI?=
 =?utf-8?B?dDQrSkVWbGFNRmZldWpIeTlRSDBraEJkWllOb01ucUpMQ204UUZpUjBuRlJl?=
 =?utf-8?B?bkJDcmJ0cURPc2pkSWpOeGsxb0F6cVhySXJMaXB0UGFLd0hvSm5TM3lhQUhm?=
 =?utf-8?B?Y05vTG5INDZmekprRHVrd29yc2Y1M01nMUpNMTRnQXY1RHB2OTNOcTJLaFVw?=
 =?utf-8?B?bzBWZCtLVUs3Vy9DZ1BvNlVXdWh0OE50UWVSdkNoejdWUW5FQmt3K0g3V1ZH?=
 =?utf-8?B?TjlkMmZvOTB4ZTlHTDNOVDNMakNZMmg4cFhmQVNDUXUvUGYyVzVEQkFJTVRK?=
 =?utf-8?B?TlNFSmhGVDhQS0hPWU1zOTl0VGhjMmhxbVlrS05HRmtYWDlYUHVYRjRKa3lo?=
 =?utf-8?B?Vi9rVmUrT2Q2TFA4WVZ2TXVjajVWSnFKWlpvMVQ2NnZQdnBjckVNVElxSmE1?=
 =?utf-8?B?RXBHMW12dldZVjRmVXNTYTRBVHJleTIydXd2SHF5cXdDU0JmSitMSzB5TEpw?=
 =?utf-8?B?V1MzRWRGV3pvejFSZDlMNG1JVXVLUlVtRUsvcTUwemd5Ly9OaG5YRjdKL0xJ?=
 =?utf-8?B?RlpHVFJpU0M2M2pjMXVCUWdVcmxBN2d3RldSNkhMSlIrQ25tQzFDMmY4QW9o?=
 =?utf-8?B?TlU4MCtNTFdFNHdEclJXWm4vcGhxNGZ4WGFvMnRhb0pBK0p1ZnltQ0ZKbWJ1?=
 =?utf-8?B?SzFtcjR1UHpUSFRoWnRMWnpVMUhMeHJxaXhKV0liWnR4Rko1RHZDY09xMDh3?=
 =?utf-8?B?OWk3dE90SU1VSWN2OVQzMzdEV0h6RXZiY2ZkUkNrSGpOcU9tVDRRd2ZTOHp4?=
 =?utf-8?B?TFBqU3dWMFh1NXBQTGI4WGdpdExzOCtwdWdJa21KVzN0THFhWWZSTkJRQ1hX?=
 =?utf-8?B?dlJpUURSUDBScjd4RXp1SjI1aHRadHVrZU1VV1VxVEgvUjBLcjBWeW8wQVNR?=
 =?utf-8?B?ejhBNjQ0YmNxZnhUNFQ4V0QyVzZNejdJcVlpZlJCTWhnVFdweGdMNE5rM0lm?=
 =?utf-8?B?NnpwdjFUVjdQTmZUTVF3ME5PS2NXV1psOGROT0lxN2pCZFR4K3BHTWZlNHo2?=
 =?utf-8?B?U3V5dmM5UEdhS3JaM3k0SHJ0VzRHUTNDT1Z1TWJQNCtaWHA5UVpmVUMwczZE?=
 =?utf-8?B?TEM0ek9MVlhMR3NDSlgwbU1HaXBubTZDK1lJd2lOc0xCS1NCZ0pOTms3VmNn?=
 =?utf-8?B?YUJXTEFjQ2dwOS9vVEtyK0xrZGk1MWdDS0lMb0lhcGVuK2dSSFJLcHd6TTFN?=
 =?utf-8?B?d0dJQTFGam91WmZGcmlOK0FhZUZoVXgybjZzS1JVa1l6bThoNmpWUE1lK2to?=
 =?utf-8?B?TEhDRzBsM3I0c3lzZnFmOE0xdHBVdGVmazFTN3htNFgrTytweEdpRjc5dytF?=
 =?utf-8?B?Q0xOZ040OEt1c04rREM1c0Y4UWZhb1BmaUFUZGJPN3pqMnFQVWxsRVN2eXp4?=
 =?utf-8?B?aXBCS0hUeW1ERU9YUm5tTGlWZ1dUNURFNHdMUTBuell6b3lrMkNkaTdtbEJm?=
 =?utf-8?B?UjgyaU9pSS9WL0llc3RoMGVjclZxMHR2ait6V3k0c3RQdzVwVmYvNk1YLzFr?=
 =?utf-8?B?bmp3OUtYaWNsakhlLzlZOXJDdDVaZjJuemZkZ3RIYmRGUG9hS0xpOXZsaFRY?=
 =?utf-8?B?b0VBeWw3L2ZIdnJPWlVienhEZjRqbHo1aWVySUhudWZ5cnRKTFArZEE4QW1J?=
 =?utf-8?B?UFVCdDg5ZVZ5UDRqRTIwY09CNUc2dnN0ZGh2WnFHd0hvTGNLQnhQWFByU0RR?=
 =?utf-8?B?SHQvMTVVNUxQNEhrOFc4U0ExUU1wdWhhUyswOWJNUWhDei9lQ014QTdMZWhV?=
 =?utf-8?B?Z1FZd0w1WUdvcHVkNGZKeHpIWks3ZFdJNC9YcVd3aUprSS9iVVBuQ0VIMjJn?=
 =?utf-8?B?dm9NRTl4UXhjcC9CclUvRE1ESUdBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0f73a1-ac55-4d81-ba9a-08ddfa67066d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 06:04:15.4982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6Dx700leyO84wqE1Abt7OpaJUJu5kN1w/Ei+TW0cg3CmD0FXE6k8oXXHcshAM6R2kr2MZb7xv3HHCXGbcImFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFDB3A23D1A
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

On Monday, September 22, 2025 4:36=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 10:27 Mi=
kko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Monday, September 22, 2025 3:30=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09:2=
3 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > On Monday, September 22, 2025 2:13=E2=80=AFPM Svyatoslav Ryhel wrot=
e:
> > > > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE =
07:44 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > >
> > > > > > On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhe=
l wrote:
> > > > > > > Simplify format align calculations by slightly modifying supp=
orted formats
> > > > > > > structure.
> > > > > > >
> > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > ---
> > > > > > >  drivers/staging/media/tegra-video/tegra20.c | 41 ++++++++---=
----------
> > > > > > >  1 file changed, 16 insertions(+), 25 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/dr=
ivers/staging/media/tegra-video/tegra20.c
> > > > > > > index 6e0b3b728623..781c4e8ec856 100644
> > > > > > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v4l=
2_pix_format *pix, unsigned int bpp)
> > > > > > >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDTH,  =
TEGRA20_MAX_WIDTH);
> > > > > > >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIGHT, =
TEGRA20_MAX_HEIGHT);
> > > > > > >
> > > > > > > -     switch (pix->pixelformat) {
> > > > > > > -     case V4L2_PIX_FMT_UYVY:
> > > > > > > -     case V4L2_PIX_FMT_VYUY:
> > > > > > > -     case V4L2_PIX_FMT_YUYV:
> > > > > > > -     case V4L2_PIX_FMT_YVYU:
> > > > > > > -             pix->bytesperline =3D roundup(pix->width, 2) * =
2;
> > > > > > > -             pix->sizeimage =3D roundup(pix->width, 2) * 2 *=
 pix->height;
> > > > > > > -             break;
> > > > > > > -     case V4L2_PIX_FMT_YUV420:
> > > > > > > -     case V4L2_PIX_FMT_YVU420:
> > > > > > > -             pix->bytesperline =3D roundup(pix->width, 8);
> > > > > > > -             pix->sizeimage =3D roundup(pix->width, 8) * pix=
->height * 3 / 2;
> > > > > > > -             break;
> > > > > > > -     }
> > > > > > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp, 8)=
;
> > > > > >
> > > > > > Assuming the bpp is coming from the format table below, this ch=
anges the value of bytesperline for planar formats. With this it'll be (wid=
th * 12) / 8 i.e. width * 3/2, which doesn't sound right.
> > > > > >
> > > > >
> > > > > Downstream uses soc_mbus_bytes_per_line for this calculation whic=
h was
> > > > > deprecated some time ago, here is a fragment
> > > > >
> > > > > s32 soc_mbus_bytes_per_line(u32 width, const struct soc_mbus_pixe=
lfmt *mf)
> > > > > {
> > > > >  if (mf->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> > > > >  return 0;
> > > > >
> > > > >  if (mf->layout !=3D SOC_MBUS_LAYOUT_PACKED)
> > > > >  return width * mf->bits_per_sample / 8;
> > > > >
> > > > >  switch (mf->packing) {
> > > > >  case SOC_MBUS_PACKING_NONE:
> > > > >   return width * mf->bits_per_sample / 8;
> > > > >  case SOC_MBUS_PACKING_2X8_PADHI:
> > > > >  case SOC_MBUS_PACKING_2X8_PADLO:
> > > > >  case SOC_MBUS_PACKING_EXTEND16:
> > > > >   return width * 2;
> > > > >  case SOC_MBUS_PACKING_1_5X8:
> > > > >   return width * 3 / 2;
> > > > >  case SOC_MBUS_PACKING_VARIABLE:
> > > > >   return 0;
> > > > >  }
> > > > >    return -EINVAL;
> > > > > }
> > > > >
> > > > > V4L2_PIX_FMT_YUV420 and V4L2_PIX_FMT_YVU420 are classified as
> > > > > SOC_MBUS_PACKING_1_5X8 hence we get width * 3/2
> > > >
> > > > Googling this brings up the entry
> > > >
> > > > {
> > > >         .code =3D V4L2_MBUS_FMT_YUYV8_1_5X8,
> > > >         .fmt =3D {
> > > >                 .fourcc                 =3D V4L2_PIX_FMT_YUV420,
> > > >                 .name                   =3D "YUYV 4:2:0",
> > > >                 .bits_per_sample                =3D 8,
> > > >                 .packing                        =3D SOC_MBUS_PACKIN=
G_1_5X8,
> > > >                 .order                  =3D SOC_MBUS_ORDER_LE,
> > > >                 .layout                 =3D SOC_MBUS_LAYOUT_PACKED,
> > > >         },
> > > > }
> > > >
> > > > which matches that you're describing. It doesn't make sense to me, =
since it at the same time specifies PIX_FMT_YUV420 (which is planar with 3 =
planes, as documented by include/uapi/linux/videodev2.h), and LAYOUT_PACKED
> > > >
> > > > /**
> > > >  * enum soc_mbus_layout - planes layout in memory
> > > >  * @SOC_MBUS_LAYOUT_PACKED:             color components packed
> > > >  * @SOC_MBUS_LAYOUT_PLANAR_2Y_U_V:      YUV components stored in 3 =
planes (4:2:2)
> > > >  * @SOC_MBUS_LAYOUT_PLANAR_2Y_C:        YUV components stored in a =
luma and a
> > > >  *                                      chroma plane (C plane is ha=
lf the size
> > > >  *                                      of Y plane)
> > > >  * @SOC_MBUS_LAYOUT_PLANAR_Y_C:         YUV components stored in a =
luma and a
> > > >  *                                      chroma plane (C plane is th=
e same size
> > > >  *                                      as Y plane)
> > > >  */
> > > > enum soc_mbus_layout {
> > > >         SOC_MBUS_LAYOUT_PACKED =3D 0,
> > > >         SOC_MBUS_LAYOUT_PLANAR_2Y_U_V,
> > > >         SOC_MBUS_LAYOUT_PLANAR_2Y_C,
> > > >         SOC_MBUS_LAYOUT_PLANAR_Y_C,
> > > > };
> > > >
> > > > i.e. non-planar. The code in the driver is handling it as three pla=
nes as well, with addresses VB0_BASE_ADDRESS/VB0_BASE_ADDRESS_U/VB0_BASE_AD=
DRESS_V. Since the planes are separate, there should be no need to have mor=
e than 'width' samples per line.
> > > >
> > >
> > > I did not invent this, I have just simplified this calculation from
> > > downstream, output values remain same. I have no cameras which can
> > > output V4L2_PIX_FMT_YUV420 or V4L2_PIX_FMT_YVU420 so I cannot test if
> > > this works either. Other YUV and RAW formats were tested on real HW
> > > and work perfectly fine.
> >
> > My understanding from the code was, that the MEDIA_BUS_FMT_ formats lis=
ted in the video format table refer to the input formats from the camera, a=
nd the V4L2_PIX_FMT_ formats to output formats from VI. Hence VI could inpu=
t UYVY8_2X8 and write to memory in YUV420. The code dealing with V4L2_PIX_F=
MT_ values seems to be related to the output to memory. Is it possible to t=
est this (your camera -> VI converts to YUV420) or am I mistaken?
> >
>=20
> Camera I am testing with has no YUV420 options available and from what
> I can tell there is no way to force VI to output in YUV420 unless
> camera supports it. Any format manipulations should requite hooking up
> ISP, or am I missing smth?

From a quick look at the spec it looks to me like for YUV422 packed input f=
ormats specifically, VI should be able to convert to YUV420. If that were n=
ot the case, e.g. 'TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),'=
 would not make sense anyway as it's talking about both YUV422 packed input=
 data and then also YUV420.

>=20
> > It's certainly possible that the current code is functional -- if bytes=
perline is set to a too large value and that information flows to userspace=
, it could still read the buffer. It would just waste memory.
> >
> > >
> > > > >
> > > > > > > +     pix->sizeimage =3D pix->bytesperline * pix->height;
> > > > > > >  }
> > > > > > >
> > > > > > >  /*
> > > > > > > @@ -576,20 +564,23 @@ static const struct tegra_vi_ops tegra2=
0_vi_ops =3D {
> > > > > > >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> > > > > > >  };
> > > > > > >
> > > > > > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > > > > > > -{                                                    \
> > > > > > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,           \
> > > > > > > -     .bpp     =3D BPP,                                 \
> > > > > > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,               \
> > > > > > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, B=
PP, FOURCC)      \
> > > > > > > +{                                                           =
         \
> > > > > > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,        =
           \
> > > > > > > +     .bit_width      =3D BIT_WIDTH,                         =
           \
> > > > > > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,         =
           \
> > > > > > > +     .bpp            =3D BPP,                               =
           \
> > > > > > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,             =
           \
> > > > > > >  }
> > > > > > >
> > > > > > >  static const struct tegra_video_format tegra20_video_formats=
[] =3D {
> > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > > > > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > > > > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > > > > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > > > > > +     /* YUV422 */
> > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
> > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
> > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
> > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
> > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
> > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> > > > > > >  };
> > > > > > >
> > > > > > >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > >
> > > >
> > > >
> > > >
> >
> >
> >
> >




