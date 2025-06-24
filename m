Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC40AE684E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 16:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F5D10E040;
	Tue, 24 Jun 2025 14:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="tLSsFLzq";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="itiCfOAw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1689 seconds by postgrey-1.36 at gabe;
 Tue, 24 Jun 2025 14:22:42 UTC
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE35310E040
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 14:22:42 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id
 55O5wNZ43005600; Tue, 24 Jun 2025 14:54:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=nfoEOAnRY1cqDKwnjSXds4519
 q+Wh+Cz4zzImtJUuh0=; b=tLSsFLzqvATpPyx7OdP/k/cNOTtQyCLHKUI+gzkHj
 K7Ewh85LFKt2UzFcQbHE/PGcy3CCYccJ1xkqCBJ3LKt8kg9Y/S/XywjjFlwg3nr3
 8rZW8O6NXZvORXy59yaKS8FLgwmdHIm1F0u8pzi48Y0keH+/s04htq6kkIX7xSwV
 hOZ9/eJ61HJiErPgPW2r4V0z4WyxJ4SwVQoedFfY/QCu60erjF1RmwCUJDIJrZfG
 A7Zi+Nc2MLYDWJRppUfheKygA5Ydwyqe7NNaoSOf0etDniSsqb0QTFWOiSB+g2SM
 B/DvafIAmIrq4OiC4xJ4wJcn/p8l7L++jA5igDJ1RkejA==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazon11021080.outbound.protection.outlook.com [52.101.100.80])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 47dmtt2bep-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 24 Jun 2025 14:54:08 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vq/5GR8NXqfsyfyQM2BKEpW6Zuz8yffnOWZU5JfBGiRUPyiPjtIJEXa/olwuJhoAtHMtn3Lg7OhHq4+vTdeKLghrqtEonUO+UPKjLtccIi/hZpZvVYzCSRVAQYp/l68FdFdVbAVLg1wWMhEJ9uGZ6UvRJq6f+nsSu43eHd7kxhqgZ7Gvl1DcOLxyG3Ewjtm0c9NvfcMNdUMzgItD+8zws2Ye60mgKI/pupYHaWc9Fy566t2U8dnHE4RNqPX6liKK5WJbqpyI+SkAXj3ucM3T/aysYcYD4UiDGsjijDOMNl0WlJrGE6Kki0qZRgHZQQratTy4rq1TgIWEKqS8I2lKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfoEOAnRY1cqDKwnjSXds4519q+Wh+Cz4zzImtJUuh0=;
 b=L5hCd9Q8DKKuzpfSaD191QayRr9Ij9shYCGfdOdz1gLiF1dDY8up2PYIweZOYC1T0IIS9E47kmi4lW3qOPGrqNlUiM75gqCsewcnZyJWcsKizo41sXYLy5CnhlIUA9UFxVD1zYPjq6xh0AlFXBqmpwJbgfLT1qdaNRoZGOnivHAVitb3EZJ3WEUuNwkY0y6pHGick6IMdxP8vsNoW/NX/d2FlumBU0A9pzibGUSoeM8WP8TisDa/AEZwT1NopCFkmqk+vcduX+wwiCcYJqFzESumR2ovvEWjqQ0pD/qK7n2IPfFB5NFEytU0r3xOhLa42/dLVqf6QJ1pjwZ+xs1S4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfoEOAnRY1cqDKwnjSXds4519q+Wh+Cz4zzImtJUuh0=;
 b=itiCfOAwgGo/30oJneYAINaYWt8bSEQpAYrwn70jFsVHlSEaENVfIcRHBeIjk7hfYCWZkamQbcKZMf8ItzqQ+EliOWsJdF1/1bCAJADpVSYJ1S6O7k60B2NdLDoksNana31mNIx1gH1F9pCIJAspB5BNh63xLdGMAU2jrx4YJ6c=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB3595.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1b5::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.28; Tue, 24 Jun 2025 13:54:06 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 13:54:06 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
CC: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 8/8] drm/imagination: Enable PowerVR driver for RISC-V
Thread-Topic: [PATCH v6 8/8] drm/imagination: Enable PowerVR driver for RISC-V
Thread-Index: AQHb5Q9zN6P/bKW/O0KM1MpKRva9Gw==
Date: Tue, 24 Jun 2025 13:54:06 +0000
Message-ID: <ff96ee1f-23ad-4e7f-9ac1-11f410e459e3@imgtec.com>
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <CGME20250623114439eucas1p17e4405b95a5693a972bf40a3b3ecdc11@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-8-6583ce0f6c25@samsung.com>
In-Reply-To: <20250623-apr_14_for_sending-v6-8-6583ce0f6c25@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB3595:EE_
x-ms-office365-filtering-correlation-id: be6b6f67-902c-4963-f3cb-08ddb326963a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MkczUVpCWk9nZGttaTV6ZGhBdGJvUS9nOWhmRHpHbkFFc09hbW50NUJjdW52?=
 =?utf-8?B?THp4ZzFTYkNNYnBXUHBnQlJzRTJWVmVHeVJpYW5GcmMzQ2MyTHhSaFFzY2RS?=
 =?utf-8?B?NlQvUlhoWkM0ZUUzN2R1bGY5SUczSmhCbTFENUhNSi9CVWJ2d3duRjJMRHp5?=
 =?utf-8?B?N0huTk1Bc1VSRGUyVmZ2OVNDNUFVRVNwSTlwSi9pblJFd0xGZEw5VHZYT3lq?=
 =?utf-8?B?elZzY2VyZ21KdDBKYlJiWSt2Nm1QZXk2Q3B2T1JxUXI0cHUvQnduemlKQ2Nm?=
 =?utf-8?B?SnN5dGtzSnBzTE9sbDNMSWx4b2t2cGV5MVUzR0VpVWdZTWxZTzkzMmdaMjhP?=
 =?utf-8?B?MjNVT0NDMGtQL1lCTEc3YlIwbk1BMlR0N3FlVysrNytpRWtITlFtbHpVUys4?=
 =?utf-8?B?MnBWM1NERS9JQkl3ZWViblBoRWhMTTF0Q0drbktlakErNEFEK21kYWdZNkdI?=
 =?utf-8?B?L1VoclZydGNocTJ0UjdtcmltMEp1Mlo3ckJ3TnZETlJ1dmZjQ1FRN1JVSnJw?=
 =?utf-8?B?c3VrUXgvcjQ4M2VuVFB1N2VLdW9CSm9icHYySHh0RDhYd2VoVU5rTTYva1k3?=
 =?utf-8?B?Z1dkQWc2SmwvQzd5c1c0RWRvT1hPQXF0WTdjQzlGWi9zQjlYRFBkU3RJeGcw?=
 =?utf-8?B?YnpCcFlnS3JGaVcvQkd0YWpZYmg2QXRFTTFabzBiUHhxcG1XZVN4Nk1MVHlQ?=
 =?utf-8?B?WG90STJOWC8xb0p1dUFURHc5UVZPbElkNWNkV0NvWFJhQnJnaGg3eTNSb1ZH?=
 =?utf-8?B?QzBNUDhVRHRHcy95TEJoSjdXK25IYlZTb3J6VkZNeUlJMllNZDZ5NEtlb3lo?=
 =?utf-8?B?QlBvcUZFWEw2K3QzNWxXZGNDT3FwTUthdjl1OTExVmIva0ZLekZCWWJLM0l4?=
 =?utf-8?B?UTNvNFA3MFVKTmhYWFpmV2VXcGVqZ202c2hzUjBBL0pDWmFsWFdFZ0IwUm14?=
 =?utf-8?B?eFJVeHhXV2Npb3dHYjQ0UUVSbXBsejNDWkpiRGF1bjF6MTBiV0ozeGdUMGJl?=
 =?utf-8?B?Z1B6VUx3VzgvS0xZaXFpY0toVmFpMmJnbjNjQStqUkxmYXVMUjBVU2xVYVYz?=
 =?utf-8?B?T083NXNKVkgrblpxK0pZekNuZ2hHRnFaM0QyajlJZmxzWCs1bllUL0VLNnd5?=
 =?utf-8?B?R2hUZFdOQkdVVlVPaHRySVJpREovWElVRy9PMmVuS21kdm9Sc1B1Z3VwL2Er?=
 =?utf-8?B?WmpIS3Awb2RXZzdGVERod0hucytpckkybTNMY2pFdzJKdUZha3Z1SE5XU3FT?=
 =?utf-8?B?SGNyZjFDYkhnTDRsZkRLc1RlZnVjblFZK2VETW1uYzBrSmluNC9UUmpqaXZr?=
 =?utf-8?B?WnlwTExWRDZBV09RVnMyWHc5a25jVkY3bWVhbDAyMzM3S1JibkUrQkdyNVRi?=
 =?utf-8?B?RGlib1M0UlQ4OVNKcFVXSDh6TmhVdndKTVFIUlpzcXY4S2c0RTBPUTkxTldz?=
 =?utf-8?B?ZnJ4UzF0TVJZVFBGNklxclZJV2xZWUlCZWZQYXRYZDlpazlBY3BjOGJGVHFm?=
 =?utf-8?B?ZXRZV2JqallQSitDbUxFeGVvckFYZGZxVk9FbVJ0R0p0T2tDamlHSjRMa0hE?=
 =?utf-8?B?eENldEVNeE5ISDhmR1p0SlJTWUJZZmRYTmxjZ05aN00xa1pUMVV3VzB3cnB5?=
 =?utf-8?B?MkMrcEdBRkpwMnNSeVBwcm5ZNXZGcC9MQ0kxM0hHUHpTd0lBYWJjbFNCeEJV?=
 =?utf-8?B?Nk5tU3FMSG5Qb1B3b0dXWVlkT2JnZEVWUDBmbzdEeGVESGMzQTdSdFVqeGZB?=
 =?utf-8?B?Mjl2RlZoNkV4Vi8vUmRWMDI4L2RjY2VBVGdHTGhibzZSVElES1AxK2lxVjRT?=
 =?utf-8?B?dGs4eTNqYWpuaDFRLzAxSDY0VmlyMlZ1emJLT0xnQkVHcWVyUE9qMzZNcXVU?=
 =?utf-8?B?QjFhNSs4YkprMC91USs0Vk1qQzd3VCswOU9UUit4NXZEbFluQXdaLzlFdzM0?=
 =?utf-8?B?L3RRYzI0SzVxcno5bG5VWERINkwzVHhvZTFMc2pGNVUrN055cjZqSkRWMk0z?=
 =?utf-8?Q?1OYigNEoylgYw6/bRRkOu5eY6Xf/BM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(4053099003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clRIVy9kMzRuUU5HMVRQUW1aTVR2bWQxd0lYK2ZhYmRVRjlvaGkxNnczeG13?=
 =?utf-8?B?YkloMThCSkh5VTFzZnhjY2pkNldMMS9KSDhLVGc1UGRmM3dyS3gyaEhQNmcz?=
 =?utf-8?B?d0tTYTVZWXlWblU5YW1xL2tnT3duQTA3RkMxU1dDT003VU5LV09CdVhKeE1z?=
 =?utf-8?B?akJqeE4xMG0yL3dud1ZMbXlRVytsN2QxN0ZUUklwT0ZVWXVVRll1NnpxVEhI?=
 =?utf-8?B?VVd3SXRJUVN0TzJiVlRmZ0hJWkNoSnB6Qk9uWWJNUHNFK1U3aDd2U2gvVkpL?=
 =?utf-8?B?Yzg4Q1JzcytYSmNQbCs4b25ubjRRajJhWlEydVFJV1lJRVBlTks1eklLSnVv?=
 =?utf-8?B?RzdIZUd2Q3VkYjlGejVVQ3AxL21Gb3hDejBFK0ZIY1VsSno3bTRtNGdNSWRV?=
 =?utf-8?B?NG1acFlTU2VwdEpBUlBuSGUzVHBTRXNpZUFZNzI4c1dod3ZQOGwrVmZCY2Zj?=
 =?utf-8?B?YmYyTWtWcnVVbkhuTXZ1aVFmejd6ZTBmMGVDUGZVeG1iWmFKRzNDa25HTHlh?=
 =?utf-8?B?S05kUjgwM3pKL0U0ei8zTm1IOGs2THp5YXg0Skt4ZWNYUG9PdnB4UHZCdzBq?=
 =?utf-8?B?RHBzZzlqRFZUN3FpSkduWExJVjlmSjFnRFlkcmxoTWxmNWdMMnhzSjF2MzRF?=
 =?utf-8?B?R2dnU0haenQ5T3lPUk5NdS9xUk1ZcTlKaFllU29lWXIyWFVpUnhXSXlHNmdj?=
 =?utf-8?B?S0VnZGU1WExLWHh0aWhhYTA4OHNiOVIwMXZYZkZSS3FIL0pTa0NCYTVTbjhz?=
 =?utf-8?B?b1hvYVJ5NlM3Q25pVVFHeU05eXBGOUJSWnZLcjJUaTdVQng2MUNRU0VrLzZx?=
 =?utf-8?B?c1RWc0pTQlBGS0ppcHBUNU9Cd0dTR212ZERsajlxUlRtbDVudHRUWnl4UjRD?=
 =?utf-8?B?UTdhcnBlRlU4WlJKRDBiZ3p5NDRrem5ZNWxybjQxT3lCNDRrREYrNHVScElj?=
 =?utf-8?B?TkJRZnlkcWNVaEpCWHIzaitYSFljZzhRUzFpRnkvTzRNdXNibVFvWnNKdllm?=
 =?utf-8?B?a1VUKzVHNG5IbEpsK0cvVmdtYjY0aFZzQm9pMWQzNEFCN3NhNndmRCtBY05Z?=
 =?utf-8?B?cXYwM2RmM1ljSEgwQVhJNjFuSkNObzNQdjNsbXAyRFYrOVU0VkJVaERiTUZP?=
 =?utf-8?B?WnBsVThlME0reEhSdm9SZGw0dVMzd2JkT3BvWVhpeWtZeFhpcW1QN1dQNHI1?=
 =?utf-8?B?UUpNYkhyUDNlU1QyNVRKWDhBOCsyZXpaeHhCa1pCV3J1dFdsa0hiU0VRNlhT?=
 =?utf-8?B?d1doMlJWUWlTUTJSd2JhRDVlMnVaTzBaVkdzQkxyY3NaWnUvVDJ6NElXaWVC?=
 =?utf-8?B?KzREVFIxYjJrb01aZHEzbTRJVHVBZ2xYR0hyMHNVTVlVL0hQUHBUdU14Wkd4?=
 =?utf-8?B?MFA1dlBNMlB1MHI1c3ExYnFGK0NUQmhwYllTSUhnWHhRSVZTZHdVeW5ET0NN?=
 =?utf-8?B?M3B1cjRodENMaFdUOW4yQ2hjcDVoOFN6eXZSR2Y3UU5ubDBsMWhuejEvTlNv?=
 =?utf-8?B?TXcrRnJmMWsrZlRLRHk2QkpKUDc1eG5JaTRXcHZGdTI0ZytHQnByMFJBS0Nv?=
 =?utf-8?B?Z1BIYkc0L3AwemxjKzYzcUlHR2p6NllNUUxFRjJ2R0xBL0hFc1BGcm9aNE02?=
 =?utf-8?B?NlpWVVplK3pPT0VtdTMraWZRbHF4aGJ2cU5ISUMwTW53aDk3d0FHa3JpcFV3?=
 =?utf-8?B?cEpJWTFKZ1ZrZ3pnTERyYWpsc3BDemp4eHowK1Y3ME0yM1R6WVRWd0prUlhU?=
 =?utf-8?B?WHo1ay9WaDgxZXFWRElxY2ZkbXR1RW52UDhLWTl1ZkJGbURmNCtNOFRnUTdm?=
 =?utf-8?B?UTMzSkFnbU0yOVp4ZFo4QjZTYUlrMmFQQUVxaFBBVUxnd3BrSUxZY25RcGNN?=
 =?utf-8?B?dlNpTXFBeUx3cDloM1AwM2J0NE95UndYVDJCVll4UjJtSE1IbWU5L3dkaEFW?=
 =?utf-8?B?MW5XeG1RQXh4NGJRSi8xbFNDdmhhU25PMCsvMFlhcFdhcDB4R0pTcnVsK2NS?=
 =?utf-8?B?T2xFV3dFbzVQaFBNL29UVDY4SnpUcGRXRHhZZmVtNXNMaVh3TlJyaFJpNEZ1?=
 =?utf-8?B?d1dHY0RxUTZUOEQ0USthM3RuUGpjVkRMMFpCQ1BRMEdjeDRVZVJEQjVlMWhH?=
 =?utf-8?B?clpmTEhxcnZYL3ZtS3pqVXNoZlJyRFU1dDcyempxd0N5SWFjSmE5djNVbWlC?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------z61IJcekd9unOZFCBM6aNJiR"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: be6b6f67-902c-4963-f3cb-08ddb326963a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 13:54:06.6566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6cg8qL4yDF40liDywDqxEP//pR+0lSOclp+8BLL/obpZsRGnM9UEHKDISqOawYoCr7/Lvd72WnT9YcXre2VllQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3595
X-Authority-Analysis: v=2.4 cv=SeD3duRu c=1 sm=1 tr=0 ts=685aae01 cx=c_pps
 a=UIWbGZxE+ONOz/38PoR5Ow==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=NgoYpvdbvlAA:10 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8
 a=YI4zNEWV3SPB4RYFvQQA:9 a=QEXdDO2ut3YA:10 a=pho5xY8m-WCaA0Ene9IA:9
 a=FfaGCDsud1wA:10 a=cvBusfyB2V15izCimMoJ:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: sY-k4-y8Sx-MD_gRrAiFBaqmLCr9gJeO
X-Proofpoint-GUID: sY-k4-y8Sx-MD_gRrAiFBaqmLCr9gJeO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDAxNiBTYWx0ZWRfXxRbTQqqD/s8C
 rCV+Tj/TT8ewbOqZyJnn+xMKSji2h05FUdkUVqeqaqaqpLbY3nonMKTpEebc46TWQXnWoQEBHGJ
 Lgkagyi2sUNunsFVATxNNAQRqFvELj5NaTTi/k4NOFQv4BrIONc1bw2Vf/ZQxOrhZDelZqqcfyN
 3V1VL/uDFaAv0F7ws0NGuND9FUUgOnezqA37hJS3WwUFvkdG9+ojfQxzwLdAazsrI1jWaKFFvtx
 e7K0oiodeGsKpRcTIQouICmoJlcX3/7c4BDx/DXUNRWHRj8jzBfCu50JAoeyxDSqSDhJ+/KVuJZ
 7+SmPhsV1Rxd73wUnGJPeBncJW1FSX1Z+r1/D/TAW+MACVq315KoJgY5s1eYWU+qVlBX6+IAU4J
 IZBq+GE5
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

--------------z61IJcekd9unOZFCBM6aNJiR
Content-Type: multipart/mixed; boundary="------------3826KnTQawC2RH75fzT20EYp";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <ff96ee1f-23ad-4e7f-9ac1-11f410e459e3@imgtec.com>
Subject: Re: [PATCH v6 8/8] drm/imagination: Enable PowerVR driver for RISC-V
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <CGME20250623114439eucas1p17e4405b95a5693a972bf40a3b3ecdc11@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-8-6583ce0f6c25@samsung.com>
In-Reply-To: <20250623-apr_14_for_sending-v6-8-6583ce0f6c25@samsung.com>

--------------3826KnTQawC2RH75fzT20EYp
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23/06/2025 12:42, Michal Wilczynski wrote:
> Several RISC-V boards feature Imagination GPUs that are compatible with=

> the PowerVR driver. An example is the IMG BXM-4-64 GPU on the Lichee Pi=

> 4A board. This commit adjusts the driver's Kconfig dependencies to allo=
w
> the PowerVR driver to be compiled on the RISC-V architecture.
>=20
> By enabling compilation on RISC-V, we expand support for these GPUs,
> providing graphics acceleration capabilities and enhancing hardware
> compatibility on RISC-V platforms.
>=20
> Add a dependency on MMU to fix a build warning on RISC-V configurations=

> without an MMU.
>=20
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/gpu/drm/imagination/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imag=
ination/Kconfig
> index 5f9fff43d6baadc42ebf48d91729bfbf27e06caa..a7da858a5b301e8f088e3e2=
2f5641feb2e078681 100644
> --- a/drivers/gpu/drm/imagination/Kconfig
> +++ b/drivers/gpu/drm/imagination/Kconfig
> @@ -3,9 +3,10 @@
> =20
>  config DRM_POWERVR
>  	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG=
 Graphics"
> -	depends on ARM64
> +	depends on (ARM64 || RISCV)

There were two issues you encountered when enabling COMPILE_TEST in v5,
both of which are somewhat simple to workaround but expose underlying
assumptions we made during early development.

The first [1] is due to us assuming a 64-bit platform, which was never a
problem with the ARM64 dependency, but may actually be a problem with
RISCV given this allows for 32-bit as well. You should probably make
this (RISCV && 64BIT) until the implicit 64-bit dependency can be worked
out.

Somewhat related, we also assume a little-endian host. Technically ARM64
can also be big-endian, you just don't encounter that in the wild too
often so it's never been a "real" issue. I do wonder if swapping out
(ARM64 || RISCV) for (64BIT && CPU_LITTLE_ENDIAN) entirely would be a
reasonable change, perhaps for another day though...

The other [2] is slightly more subtle. To keep things straightforward,
we currently map CPU pages to GPU pages 1:1, meaning we use the CPU page
size to define the GPU page size. That GPU page size is configurable,
but does not support every possible size the CPU could support on any
architecture. The failing test there was sparc64 with an 8K page size
causing no GPU page size to be defined. See the #if/#elif ladder at the
top of pvr_mmu.c for the supported sizes and the doc comment above
PVR_DEVICE_PAGE_SIZE in pvr_mmu.h for the acknowledgement of the page
size restrictions.

The "proper" fix here would be for us to make these two sizes
independent, but that's not a trivial change. The "quick" fix I suppose
would be to depend on one of the supported page sizes, so maybe
(PAGE_SIZE_4KB || PAGE_SIZE_16KB || PAGE_SIZE_64KB || PAGE_SIZE_256KB)
since the larger page sizes appear unsupported (probably for good
reason).

>  	depends on DRM
>  	depends on PM
> +	depends on MMU

Nit: can you keep this alphabetical?

Cheers,
Matt

[1]: https://lore.kernel.org/r/202506191323.zD1fszQb-lkp@intel.com/
[2]: https://lore.kernel.org/r/202506201103.GX6DA9Gx-lkp@intel.com/

>  	select DRM_EXEC
>  	select DRM_GEM_SHMEM_HELPER
>  	select DRM_SCHED
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------3826KnTQawC2RH75fzT20EYp--

--------------z61IJcekd9unOZFCBM6aNJiR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaFqt/gUDAAAAAAAKCRB5vBnz2d5qsKOP
AQD+ubdnUNyyg+rcECS4hMoMpVLzTuqe6MgE+E7gNswi/gD8DyaSpDhXiqzYXNs23+M7g/6BruXS
b8spGHMA8+eYCAA=
=OHqm
-----END PGP SIGNATURE-----

--------------z61IJcekd9unOZFCBM6aNJiR--
