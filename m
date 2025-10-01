Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3ABBAF16C
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 06:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D5C10E300;
	Wed,  1 Oct 2025 04:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VDS53y2m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010018.outbound.protection.outlook.com [52.101.201.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4E210E300
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 04:27:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kqy7dHtSnqRiMPyBUuoBcbf80aDKTRtRhqUB7Z/LhYWsiNfliaZVTathQL+GnZ/IBERk9/SF7rg+KAHxC8CaMKWDuQcb5AYpOBOaQKWY/INP30xFysIwbErLz6UFMggRKZfO3S/1ImYFsPBEPV3ftLAuhijD9SNdeoXsIKjaS+a+JtQXVtnTQKNmqaqSccAS9DU3kBoY8eWJ6Os3w/MsaJXU+2tW8QonMaWn8w1k8nNgPlxBh/sYP83PB0c73qTmNs20YbM9FMViK1zAfBeEOcZEp6hAZy461eHVxG5AtcSYv1AtqS4nQfhE/pNoDZZNcm92DfXqhzfyYO5NmZTDmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hu6NxMkrieTAMq88F7zqqWO6I/ouqkk3Cqt5wmpQEj0=;
 b=mH5VC+mu4CLR9niq8sd79EymNbDdJuwiEKyz+tvM098tjtzIKBKhXxI5/Abi5TgNoyP7sCg6bNO7ONul155VD1lPOTOasueJG5htuEPW8xRuLbDK+PVz1EDwAHJ/rNaHCfM0SfFsjZY/0tgMmQvMmlYqGcNwHlNLWczjkl7qYWrbQoSKF6opgPll+cWAX8h3CdzqzLXDn/vYCGNf30/FHZwY97bEnBw51i9fCeD2o97++AwyNgmY3XhJwX62SY63kYP3gzC5P176eBO0o2axmnDuE1o47eHrzhOdVTCOcWWqHLMI9wgLmCLbM5z9ejj10ufkon0ATLsNyQA/4wQVBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hu6NxMkrieTAMq88F7zqqWO6I/ouqkk3Cqt5wmpQEj0=;
 b=VDS53y2m9MBdoKyhtEdONxdNFLCKSgC3VtsS0F1RNupFYSmXg/pvnNOYvRApRjz5eXGrU/XYaAFi2IIeIJP3Lbf8c1b+tpr4QXKC4B5hgs1Y6pp/GRJkNNpVm3FHq5qXW2n9vGs85SFXpN+ovbfNtmCCAhJFoqkS8tMtgVMUD+wjMUxaZWOZyKN8twB3bAyrBRMZBZYoHPSRlKM1QRm4AuMTmIby6STYfoAQbTIVcGdIP/OnPN536y+6ApVQiC0iDpiyqHhgq/mBoz1knrHiWz9RAQPVeI6hqhNp5/c9Et4Y4/XA0SfM+jCC1lEx0fAz6Jji/CXX5DNc+Q6ufSHAYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 DM6PR12MB4281.namprd12.prod.outlook.com (2603:10b6:5:21e::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.18; Wed, 1 Oct 2025 04:27:53 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 04:27:53 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 12/22] arm64: tegra: move avdd-dsi-csi-supply into CSI
 node
Date: Wed, 01 Oct 2025 13:27:50 +0900
Message-ID: <13601984.VsHLxoZxqI@senjougahara>
In-Reply-To: <20250925151648.79510-13-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
 <20250925151648.79510-13-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0057.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::20) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|DM6PR12MB4281:EE_
X-MS-Office365-Filtering-Correlation-Id: a617ad34-8232-47ae-3fa2-08de00a2e370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHRwbFZKQnovaWV0d0dtTDVCdWN4VHZmc2dPaVdXKzVsYkE2a1FYcDl5WE1r?=
 =?utf-8?B?V0JteTFXVDhRamtXWXlCOFYxQVUzd3EyMVZXL3E0SG1ETTFyYnlVUytZaGpR?=
 =?utf-8?B?WUVPRDVZaVA5L1g2MUVyalRXN1pRQ01MOXNsMzVEYUdMUUFLR1VBY2FvUncr?=
 =?utf-8?B?VE1xSms4b01SZk5BaElxQ1FaMDNrVmRXeXREcHp2TTRkVWZsSWQ5bkREVEd3?=
 =?utf-8?B?TVVBTXl1T21oUzY5S1V2UVFzKzhLdTIxNnF0M0NjODRTRWl2WS9kQjV1a0JD?=
 =?utf-8?B?TlpoQTdGajhweTNFYmRKVlRuVHYxY1d5UzZ2UkJwemZ1N01qeHRaMEtoaFFn?=
 =?utf-8?B?NThwK0RFQzB3cW9GUzg3SlZuT2ZSeU1Kd2t0Y2hKSVYxaW14aENxaE4yTUdU?=
 =?utf-8?B?TWhhMWpZKzJKMkJUWjJoUXpOaDl5S3NFTWVhcUhMejRydFgrMTZ2SXFvNDVp?=
 =?utf-8?B?ck81N3hKUWhaR095MjRIdmxnU0ZyendmWE5NbGxqRnNSKzh6MTlIM3crcjBy?=
 =?utf-8?B?MjJjcjhra1NtNTZqR2lpSThxV3ZiVk9DOTdGMy9wYnBkS3FpTmdCdUV2YlYv?=
 =?utf-8?B?UERUUzVaQjYxWmNzMDBhU1BrVkQ4cUYrYUVVYi9rVCsrMWU0a3JMWEFKTVpG?=
 =?utf-8?B?ZEhyUVI0M3VKM005UTdybXRPdDNadS9reDZranN4eEVZeGs4NFJWRFhVSm1D?=
 =?utf-8?B?aTJZZEs3VFI4K3UzMHE0Rm5xbFlCSU5XYzdpZzBlVVM2R05QajdXM3pTanJW?=
 =?utf-8?B?cWtaWERvNWo0YWVvK1E2cTdyaWRZZFRFVmdQd1FuTm1VcDJCUzE2S2pKSm1z?=
 =?utf-8?B?SGwzM1Z6MnhHMEZrSVJYZVB1cTFOdkZWY3VNSnR6UVZ1MXZWdE1OUTNoS2xk?=
 =?utf-8?B?bC90OVFDYlIzVk5OQUVyL2U4NVBFc3Z6cWliM2ZNeXpUQloxQVRuSGNmV0RM?=
 =?utf-8?B?dmNIYmJpL1lPRlVPWHhudmpWeU1zTG4vUFZER2N6TUFBeCtYcGpTRS9JNllI?=
 =?utf-8?B?Mkx5RWFlUE9SSzYxU1Fldzh3bjRhNHBFSU5Mc1dWTkl4aHpIYjN0RHN4cHQ2?=
 =?utf-8?B?dDJoQVU0QmJPWVNxRlQzU2dzRy9oMWZid3RlWjEvYXg2MUhkRTE5MDkxOXF4?=
 =?utf-8?B?QzNEbjJxS2RrR1JPY2ZDT1ZsUWttT29VM1NFQUZRR2pDY3QrQkI2RHBsR0J2?=
 =?utf-8?B?YVRhVFh2RENXd21FZHVjaEFHR0F3R0VRT3BCa296MWxDSkdldW9TYnMrMFJV?=
 =?utf-8?B?YWtaRCtSNTF1aWRaNG5yUFhxbmVzSXlvQlJUWTVOQlRsS3FZc0dOMXNPWlNz?=
 =?utf-8?B?eHBDTCsyL2ZnTHhXaGJ5bWQvMmRZd2p2L3JoSWY3MU1SYXZkSmQ1NytiUklh?=
 =?utf-8?B?VXF5RWphWE1veFlEVGVFT2FXL1V2M0htQkh2Yld2U3VPWWRsT1M4WDRwS1Zy?=
 =?utf-8?B?a1hodlliaWREVUZUb1YvNWVUYTZ1NFZnWDdsTC9iU3BTQXIwUlhhNUQrRWdO?=
 =?utf-8?B?UFRVTUl2OUVQV1ZRUnN1ZXlsYU5DcTBnYm0ySG5IR29OdXZwSlNFMFVZR3JX?=
 =?utf-8?B?azBRNUd3aCtjRi9CNmp4ajBLRHlhdXhJL25ITTM5TXFqTEpMblB6d05VNDYx?=
 =?utf-8?B?bHJ0ZWdHY1lndFBZWWF3cWVPT3VYcnJvWmVTaVFrRnV5TzVwNzlBYURnMWla?=
 =?utf-8?B?SmVOT1VkNDRPdHNDZHNFcE9TS1lhRjVtSmQwR3IrSHpoazJSRldGRk5meW1Y?=
 =?utf-8?B?dTF3NWxmNWFqWEorWDErSEJxTVh2a1FhR1VTd0RGQWVTZ0szcDc5SS9TaGo0?=
 =?utf-8?B?VHFvUXd4QVBXTDBnRThnVkJSaitVTGg1TUozeUMwZDFpVjE1ZHQrQlowWXRV?=
 =?utf-8?B?WWJ5QTErRTVxcEh6aU1ScEc3YjRuM2JNZWRycjNqekd3b3JVM1FpeGNiTUUz?=
 =?utf-8?B?WjQwWnQySEhSbHdYODVNdjl1MlZRT2VCVlRVY1dac29aMyttT1hqc2xDemNY?=
 =?utf-8?Q?R5hQBXtKPBWNlYnJAh8v8fHadjoxsE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjV6TGVQMDVQM1pKRVYwZ0hKZUViUnQ1WVViUXg2c3A1c3h1NGwxdTRadG82?=
 =?utf-8?B?RXZxYW1XdG9WbGFhM1FRamFLQ0FlNWZBZ3E3SXRiWWFDTkFQV1hwdlJpREV1?=
 =?utf-8?B?REYvN3B5QUNFT3NVdmhJTUR4NGMrR3E3OUhvR2NpL1hydTl2b1pXSGJYaERM?=
 =?utf-8?B?L0FhcnpnT21lZmhzQVpvQnRQT1RYbStBVXhCQ1QrekhFRlpPUXl6VVkxOHhS?=
 =?utf-8?B?TGFhVUFyS29pbFFNRXFmTm8wSW9QaGpZcDJnb0p3SC83aTMrK0lDZTZ1aEoz?=
 =?utf-8?B?UDQwWnVvSGhnUkdUV1cveEZwcUh3bFNGanV2SE82YmFTOVYrRkNiRHZ1NnYr?=
 =?utf-8?B?VW1KcDU1cWtqNmxUaFJNTWh2d0trODR4bUttRTRBcjlsbUM1aExyZld4ZHJx?=
 =?utf-8?B?NlQ3MFc0dTdmZHhYZVZWRGU2Zk5NdzFMWldrNjZrRlpOMkJWUE5aVFM1TURo?=
 =?utf-8?B?TS9CQ0pPTVJCR3pRMXVzYm1BR0JGWkszemoySHB5a2tVTmUxb210dzdCUytR?=
 =?utf-8?B?Rmxwemd4WWZyUTcyY0JLeFFlYmdubHpYYWxLbVNBdVhRUFR3dXNVTG5JSHZZ?=
 =?utf-8?B?ZWtrTndzdEhoaWwvRjRKcXJPV2dqaTRlaktiWVBYNUtqVlRVRWdSVEJlUE5M?=
 =?utf-8?B?WEtFOWFKVklwekpxdU5xYnYvcmZuZTNScFBrc0NKbTcrUmd1RVV0cFE5bkxm?=
 =?utf-8?B?VjZvcGlPdnR1dFdrZVdUTVVMNVQzdEVWaVJ4b01EcFNwVU1tU01LaGhUNVhS?=
 =?utf-8?B?bnVBcEpKcDZYd2NLbUhZVTlUUGJQNEx1YnNVa1JuUUY4cFM0NnMxVFk0dUk4?=
 =?utf-8?B?L010bDhVQXFIOHQ1aEVlc0RmWE1tREpCb3drY1ZaTDVFdm1UMlkwSFkxT0ZB?=
 =?utf-8?B?dklkQmJPODlhcXFPREFrb2REV2ZOZ0p1UkFWZ0Jua3R6U0JkbWJjOHpjSmRa?=
 =?utf-8?B?TFUwUXhtWVZyaUY4RW9CNEdpRW5QVm9UVmpnVS9kdjIvNjRRa1VMVWp2b1NI?=
 =?utf-8?B?MVBwdHE3aUJqNkU2aWJXSWNHQWRDN0VGVWp2L2xNVnRLRzhLUDRWeXd1RWRl?=
 =?utf-8?B?bzRieHljVlE4R1Q3VFFYZnJCbzBmNEgxck9lbHlxQ1NlVDN6Ni9NbDVKTzRX?=
 =?utf-8?B?QWxTOE5aS3UyVzR2OXRlUFF5NTk3ZXlvSDdJSG9WVEdsbjJpc1MwekJIWGhi?=
 =?utf-8?B?bjQ1S0IzazVlbmcwWEl3OFp5TDlpTnlpV3lkcGZ3SzhjLzgxWEoyeVpvcHUv?=
 =?utf-8?B?NFBlNkhRNW4rOTFobHhjSzlZY1VEUlBaSWdNd3BUcXZXOTRuR3A3L1VsOWw1?=
 =?utf-8?B?T3FobUJzMXllOXU0YytRK0xHclo5NDVQa2NkVE9kNEFFYU5zK2pWYmxZb2RR?=
 =?utf-8?B?eXVVc1V0OEtieVFHR2JrQ0dXT0I0Q3VXaW53cU1XUUFsRG5oNk8vSklGR040?=
 =?utf-8?B?cGM2S3dlbFFDUW9aMG5tbkFJNGxldEd1RlFNS2UySnpPNHhZUkJObFdnWGVM?=
 =?utf-8?B?M2J1eFJwVHNWQUYxcnBrSDJmSTc2TmxQNDhUMnB5Sjd2QWJBSHZVbFlFZWt1?=
 =?utf-8?B?a3BDblVNM1djVGhRRTZrc25tVGdxWmZmNGFFUktVOEJvZlZpU00vcUliMXJK?=
 =?utf-8?B?Y0JPMC9JOE4yZ1VseThyYzYwcHQ0UE0vQlZmT056OVFDQWo5Njd2OEkwUEZr?=
 =?utf-8?B?Y0trNmlORHF1Q0NCcC9qcUcrekNWZXVRTzFVa2M1d244UXY4SGFpcHZYcFh5?=
 =?utf-8?B?MWNiVFh3d3IrbHBGU2RwZzB6dlV4aXkyUGl0YXRETnFhczBDbkNOUFFzNjB1?=
 =?utf-8?B?MzJpZ01hQlZBSXhkVGdVSmE4NHdvS2RwQVNUOU9RME5HdnJmdTFZbElQT0hl?=
 =?utf-8?B?aTFQOENtbUNWQmNWaVNabTZ0ZjdZK3J2TjU5MGg3T1NlY012RFN4WGgwVDFI?=
 =?utf-8?B?N1paZ1VPN0JIdnhHU1BFdlBxb2Z1enlnQ21zZTEySjZXbmRzR0JBTklHWEdG?=
 =?utf-8?B?MEZKVHJEem9WSjNSL2RndHkxTGN0OXlpSDllcUVKMER2ZGVvaXdEbGVPQnJM?=
 =?utf-8?B?RXlIM3RvdWRkR1h0M0oyUm1JbnNHcXNVNFBJWDZwTWtNU0JYcHVJVXpkN1lK?=
 =?utf-8?B?ZzFvbHJvekxTc1d3aUw5UGFhdlpDeVRYRGNWYXBRYXJqbHVkejhuVG1TOEZ1?=
 =?utf-8?B?SkE2Z2QyNHkraFJlRmU3bmVyK0dtWHVjdGtFbSttY0hTa055cVBvNVl6RU1w?=
 =?utf-8?B?cWJyTmxpWjh6ZDRxU2hKQjBoKy9nPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a617ad34-8232-47ae-3fa2-08de00a2e370
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 04:27:53.5622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4HUFfiH6aq4tS9q5sIflflIw0gfGZwEpsjmCyzrO41ec1lLEj70LJTb1S2PQv128KHomPTCvn4d/riHKAJF/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4281
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

On Friday, September 26, 2025 12:16=E2=80=AFAM Svyatoslav Ryhel wrote:
> avdd-dsi-csi-supply belongs in CSI node, not VI.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 4 ++--
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra210-p2597.dtsi
> index 584461f3a619..4a64fe510f03 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> @@ -20,10 +20,10 @@ dpaux@54040000 {
>  		vi@54080000 {
>  			status =3D "okay";
> =20
> -			avdd-dsi-csi-supply =3D <&vdd_dsi_csi>;
> -
>  			csi@838 {
>  				status =3D "okay";
> +
> +				avdd-dsi-csi-supply =3D <&vdd_dsi_csi>;
>  			};
>  		};
> =20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/ar=
m64/boot/dts/nvidia/tegra210-p3450-0000.dts
> index ec0e84cb83ef..f1d2606d9808 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> @@ -64,10 +64,10 @@ dpaux@54040000 {
>  		vi@54080000 {
>  			status =3D "okay";
> =20
> -			avdd-dsi-csi-supply =3D <&vdd_sys_1v2>;
> -
>  			csi@838 {
>  				status =3D "okay";
> +
> +				avdd-dsi-csi-supply =3D <&vdd_sys_1v2>;
>  			};
>  		};
> =20
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



