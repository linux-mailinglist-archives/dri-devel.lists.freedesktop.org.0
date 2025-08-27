Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FD6B3790F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 06:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53DD10E6F1;
	Wed, 27 Aug 2025 04:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cTrSFoAM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5C110E6F1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 04:26:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsMrO2Ja2e7Pr/Qfr+nzq+m9GsCcddFLKMxEzcmlRLMcTRPsejjfu4sM+Rl8GA9tIhDBHhp1Z2HFm/Pem0I8td7CGc0wnApD0jnaJawAGY/A6rn7bkBG+h1+zMf9UB2kSS//2Qvq5JSDGOqGNgMjKyUskZ1yicLho0Nhi8ehfSNO+9f9L0jQvq93+UrXip2G+OKJwtXDXFGEblX6wGmLpWoGXBvb6Fd4v/xrO+ajGoJI45M3z3vGtSeMu7VEKdxCrP/msbU9+LMke+iQxXW5gUnnIh4nO/vDBdEOU+0iEoky/wMZrmeNxS5w22rpHR6/My9auuf3GRVA/B+aD6F/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSF5BS6SPWWjgmz4dY9+NWhyEZNqleYhvBU+bsHxGnk=;
 b=dQReproegXaDISPQMi+wqyf3bCTNOG46VG8lJb7uG3Or+LI8IAFbA7mM/vv8rNB07VQ9lyS9LgrwmwB6Gx5b010FcSX3ggpgn8upWxVaCC1YuwC0C2/agt1vabzTUgaPwSWcaE+Hs2Vf+SGe+uCDXHB2PcBHeyXPym3OBy45NGfunD0l4QJdLDDd6jGCkXOjoCXCCAGkXNQQlQgbhOkqNWvA0okqrfQJ42oR8jgk+TILCuKPzbUCRZnFEAd3fmGdaivOdrp3aQvs1G2UZXUumLqL42xkFvW9s2bIjEdGHrSnaKWGm5TMZPlcQR8TOn8jEd3o0JVFrtVo/SIwGfw/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSF5BS6SPWWjgmz4dY9+NWhyEZNqleYhvBU+bsHxGnk=;
 b=cTrSFoAMZOok5mkuMqdB9Lfu6QZJKDwJMHc0Zea3ePoQQ5qAP05mf+5reKUEg36Gf2kF29y2kqBayt7kNAx+mWGLhhK4GEfU68OX6Me65F41OlZrFQsuc4CoGk4Iuj4pt2rT38t2lXMt76U09p0V8rGyvyB6vRZBHWK6XGbJ1fUeQ96+N/Np/c7cnqkvg3gL6IPGXhJPCaGZMOpKBIjc8W9WSBnYnhHX9KErsrLHwQLo8GYZPQvXzfjgEfWac3LPrP/OpRXgjO7+k3G3wEonuVzT1njV6G/H51jZsl830H73FjGLjHPKJ4Q4ziqFBR8JdqRp42rXwDOm4Kq9QZGb1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 BY5PR12MB4050.namprd12.prod.outlook.com (2603:10b6:a03:207::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 04:26:04 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 04:26:03 +0000
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
Date: Wed, 27 Aug 2025 13:26:00 +0900
Message-ID: <2029586.yKVeVyVuyW@senjougahara>
In-Reply-To: <20250819121631.84280-4-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-4-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::19) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|BY5PR12MB4050:EE_
X-MS-Office365-Filtering-Correlation-Id: b57f4f97-d636-40d3-a1c0-08dde521d58a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTc1UXpuejBEUWw4anRoS0ZnWnBLTXpPOGJ1aXhrbkRqcnVGcURlSlVXMGFn?=
 =?utf-8?B?Ti9aejlDRFY4WDc0djg3QlBRSk14UXRVZng4ZjQ0WWdpTzhsUkE0RkxOZ2NL?=
 =?utf-8?B?RDEwOGN6eUFDWG1mNit5QzNDczFKMGFaY3RIZGVxdkFTU29nZzZjUlgxWVhU?=
 =?utf-8?B?R0JVbW15cE5ySEdBdGlVd1MzbXJraWUxK3dZc0RNNmhyQ1c1ZkVLS0orWUdl?=
 =?utf-8?B?MU5ubVZOYUZ2SnlkbkxwVU9LbHZFSStVQWh5OVBvM2FpTzIzc0V4bTM4bk1n?=
 =?utf-8?B?NEh1TVQzaGVwSEg3T05kMnR6WXh0ZzI4aTJlU0w1QmhFUU5QQ3Z1b3BYaGEv?=
 =?utf-8?B?SVpaVkVXSUdtak94ZkNwSHRYU1ZadFo4bDRRSmZvM2F1aFcyakRHSkpOUUh3?=
 =?utf-8?B?ZUlvRERBVkV1L3RJMzdHciswaDR1Wis2RzRMdUIwcUFmSzFyL29weStkcUw5?=
 =?utf-8?B?Yjl0VVQ0NEdOZmt2VVpiV1hVZm1YUzNqQVZ0WmRYL1VhZ3IxTmRIVlVhRmlB?=
 =?utf-8?B?YkdRQ3VYbFdoanFXU2QzanJTM0tOSkVDT2pvUW9vR2JyUyswT1psNTgzRVor?=
 =?utf-8?B?OXMrZEhYOEV1SHd3Uk5Ba3N3V3RaL2NmOGVQcklXQ0hqMG9iclJaek5wT0Fy?=
 =?utf-8?B?WjhNRmdvT1NpdHlZQTdzNWtDUllGNzdmZkg1UTdVdzRHRmhzUU51Sjh3QjNC?=
 =?utf-8?B?OGZodjc0R2hqUTlkYmpvT21mR1J3T3BlQjJwQTJpQ3NlYlBScDNoZ3ZsQUNY?=
 =?utf-8?B?Tm9UZWlpcXZQM1lIRWNJWjdFbFROTlRkZjRqOUxVMzZreFZzRHpMZlZoaVVI?=
 =?utf-8?B?TzQya0thQmRLSnJJOXlLblhXdi9BeGl2S1hsRDVISWNyaUhPUnA2MTJDTGVO?=
 =?utf-8?B?Qno2blQyeXhpNXEzL1RFejVCVTBqaDQyWXBaVUV5T0pmdXR2TDVKcDk3NUpa?=
 =?utf-8?B?WnNPcVhpREdrNTVvSDlwN09rNzJJUXl3YzIvZGhBNG1WaUtrZ2FRck91STMw?=
 =?utf-8?B?SFZFM0xkR3RmRDc0eEp3ZkprZnJpSGlxellKWXFYSUNtNjJSZEV1TC9mSUVn?=
 =?utf-8?B?RXY0WW1HRjMwZTllZnNJaW1UUUUyNEtZZ083V3FOSUxaMnB1SjlPc3haeFJk?=
 =?utf-8?B?V05KODVHbEZzS1dKMmdXTVF3RStuUmQxMjRXS1oyVjBYd1JpMmlSV1lLalhL?=
 =?utf-8?B?SXI5VG1LdzJNb0g5MTYrY3A3SFdCdVZ6NGtBUDBHeEF0YTg3NEdZZWEyeVJX?=
 =?utf-8?B?cU8xekdrUDJBRnZ1MHpUUU02eUF6RUYxRDhGSmQ2WkZkVE5YREJLY1NEVU5E?=
 =?utf-8?B?RmdCZmNQb1drcm05Zk16bjJvUlgwWkJ6MjJtUnNuNTBEb1RBYVFEQkJrcUxB?=
 =?utf-8?B?NnNHODN4MzNWTE9uMlVXQkp3YlZLQVQxTmI2MEx4UE1iNUZWdlJGVlp4ckZ3?=
 =?utf-8?B?MU5qekRSKy9XMFhQNEF5QitwUTd3WWltT3kzY0h6MWV5T2pDYjgzVEwzTFRX?=
 =?utf-8?B?T1N0aW1NbDJOc0FTUWRveUtKYjBSWk91ZjlyU1VmQlVzdjJyclpHdzRMSzVl?=
 =?utf-8?B?dmNGeEQwSlQ0YlF5SE5WdjdFNzN0WVA2b0ppTGUxZGhjaWVPWkc3VDBsNHYz?=
 =?utf-8?B?NEJ1NTIyaDkvbE01ek9LYmdLdGliazc5dWNnRDJybHhWZFVNYWc5bzNvc1Q1?=
 =?utf-8?B?eTZUTXo3S2ZGYXNjWUhIeVpyRHY2NkdLWi9mNlNZNHJhYkUxVFBFeTVYRGZU?=
 =?utf-8?B?SjNvcWRQU0NJQjBpWUNIdUlhSndEcVVJQ1U3WHczV0dqY0ZlK2RLUkpTVUFt?=
 =?utf-8?B?Wm15YjRlMnR4MFVGRWNjSEZhUHd3dnhwUEVua0gzTnlLd21nVVZFaXRPMEFy?=
 =?utf-8?B?RVNOK2JFMmFOcnFLaGI2dXYwUVozb1JJNnZjeGlsQ1pTMjV2eHUzRXY2VzUx?=
 =?utf-8?Q?smBj1SVi447lkDyh0Sy8Me+mk5p6MKwa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmNqTUgyUXFnQVRMandmWm0zaHNlMmRXbnVmNC9rTlA5K3FDRzlsU1F4SWxG?=
 =?utf-8?B?aENGZ1FDa0p2bnB0U1pxblRQVGhBRUF5dTF6VU9IejFxMGVuUGNPelUvZW02?=
 =?utf-8?B?MFhDUm00Z045bjNnaTdnWG1LRUU4TmRmUjA4WWpqbk1zeFptNCt1SEZnbXV1?=
 =?utf-8?B?T3B2RmwzZkJuTTdoYlEveWpJY1lTSFh4OXFmaitYY2RaT29iVzdIZ3MxcVZY?=
 =?utf-8?B?YTg5V1F3VXcxRWdzQTY2V3oyZU12Ym8wOGU4cU5kSWRqdGFybjR0SnRsc2xH?=
 =?utf-8?B?bHBxSEZVeEdrTHJoUjZTVG5IWFdCWWphclNoTXF5Wm1NZ2xZc2dVbm1MZGJS?=
 =?utf-8?B?a2R3dVg1TURqcFA3eWVqVTYzcmlqWHk2c2lqTDVYZlZGVzhyazhDNUE4QjdK?=
 =?utf-8?B?ZTZrcFZXa0hUWWVYdCt2N0MxdWZMZDZoZjloVDFLT0NHeHEwU05VWVpsYnlX?=
 =?utf-8?B?NDRkcFVGSTcvMTFLRGQ3WG1TQURtaC9aRlYxaDNGL2VoYmZ5L0ZETnBFeVMr?=
 =?utf-8?B?TnVkMGt2RThRK1lPRktlaG9wMmN5NFFwdjJaR2xoWW5EcGg0N1lQYVFiT0lF?=
 =?utf-8?B?QTcwTjQ1TERZSEdDekRsazdTOHpHc3Q0YTl5M2x3YzhWVldiVnBOM3lUMElN?=
 =?utf-8?B?a3ZtSmtxc2JMTHFpSE1ZdlpvMHpPTHhtSndZbWhtd21SKzlNRUtLYTIwU2Q5?=
 =?utf-8?B?SngwdW5rdVlaR1lYY1hVcVRWelE1VXZMRXRxVkpjdHpISUU0MDg4SzVzSnFp?=
 =?utf-8?B?TWUzTGduSEdkUm93NVUwaTlMdnJOdGpSNGlvNk9zV09ObTZuemtRb1dOdGVX?=
 =?utf-8?B?SHNjSDBuajBIV0o2TXIxUmI5YzdReFhIYlFQMW1QSHFFYklwNWJmeTJXRUsx?=
 =?utf-8?B?N1hYZzkwZ094Q1lKdENkNFdFdXFLRFhGTUFaUGM4RUc0VXR0VWlaaXNTNnp6?=
 =?utf-8?B?QkRRWC9OSG1SUC8yYXhXVFN3Yk41dVVKdFpMTVBqNlI3NXh4ZnFseVd4K0ZG?=
 =?utf-8?B?OWNwYUpSVi9GcWNJRFdCdTVyL0JoOE5qMy9WUkZIbURLc3EzbWlmZ2NxZmtW?=
 =?utf-8?B?eTRpZGVXaTdsRk1ENHl1RGtEMHY4djFkSzV5L1dDbGErR0ZUekt6d3BJVG1a?=
 =?utf-8?B?UEdVWUNIMkk3emoyRVQvQ0pHQTk4OEtuRmdBK1Vpb0k1OFRwM2RnK25SM1VI?=
 =?utf-8?B?N2lEdVVseDRsaTJOR3dIeXZxcWs0M3NvM01VODFMejlYM0lxbzlKUzFZbVlo?=
 =?utf-8?B?ZGQzbmtudE9vRUtDWUNTaGJ6MmNKOXBKZG5uczZiZndlTDdrbE4rd2N0cng0?=
 =?utf-8?B?ZjZ2Skg5ZHlEcGdkZW8yQjFqOHljT3Q3a0lyQkNzT3d5bUJIN0JKM0JuN2ZE?=
 =?utf-8?B?K2REMnNlek1oRGJVT0lmazFqaDF0S1R6SWJDeklVSk0xNnc0amlQQWNzR24v?=
 =?utf-8?B?cXVPcWV5dXpSL1Y5QXBtMXVQL2ZBeENTaHVmMG0yT0NZR3NneDF3SHZWOC9q?=
 =?utf-8?B?L1lra2VjeXpBTk83SmQyRmhwd1p2YUlpdzl6UUdaOUN6OUVrVnVBYzFNQzNo?=
 =?utf-8?B?WDBTMkZ6TnN5VFowRWkrRlhsWFBxNjZBY3dxOXFrSStZa1dvZGFoajJaWFMy?=
 =?utf-8?B?M1I5MnRPb1NWKzBHYXhWSWtpWXRZb0U1MzNNYk80dXJQdFdndFE2S2xid2Jp?=
 =?utf-8?B?N0NBOE1iMnphK25La0s3WktwTDlObGVDWXR1KzBRL3diSzNkek5lMER0YWor?=
 =?utf-8?B?MXFSaVl3U0VRTlFRV3RtUGhIVmc1Nm9xeTI1NlBibkIxdnpham9ib1k2VzI0?=
 =?utf-8?B?UHJITGJwVjBTTkZIcWdrRHlPbFJqY2JVYWZrTnNzTThnRUFvNHZTRUUwbzJC?=
 =?utf-8?B?MEkwc3VIMnlnOHV0WnZTSnZONGc1SUozUjBVaHc5R1lIVEpqSE5ac2VUQ0Qv?=
 =?utf-8?B?MzBIVjA4MFcrb09HUy9ZWFZHam50ZFB2RjZpZFcwbUl3QTRwbURsMm9XbVh1?=
 =?utf-8?B?V201dEhLWmR0OEdIbFFiT2J4d1V2VmhCZjgvanExOEJSc1FveFAybVJwRUJh?=
 =?utf-8?B?UzkwTnhJL1FKVW1WNnByY0FPSlpWM1d3aEVLOFZxK1pQTVF2UDVhUmdnRkVs?=
 =?utf-8?B?dWRHREJ4UzgzS2RiVWJHVjBIYzVmQUROM0draHl0UUk2MzE1dUE2SmRIVFkv?=
 =?utf-8?B?SUlDYkloL1FCUExrbGtLOW1VemRuRHUxYk10UG05WUVpWVFXQmcwYlFLNFdS?=
 =?utf-8?B?VWIrMG55RThaS3F6UHltOUlINDBBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b57f4f97-d636-40d3-a1c0-08dde521d58a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 04:26:03.8593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4Nitc6p7xtutlqCgd7BxFqILNGNum7yCnSFDIcZQvVu9UQgrHt9B0OAggmFAnWZrI2AjJuXOnz4M2mLymhrTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4050
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

'pad' is just an english word, so please write it in lowercase. Same applie=
s=20
to the previous patch.

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

Please mention adding this lock in the commit message.

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




