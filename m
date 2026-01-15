Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D09DD23F55
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 11:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BF910E05E;
	Thu, 15 Jan 2026 10:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KcVL7HPC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011043.outbound.protection.outlook.com [40.107.74.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62B510E05E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 10:34:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUhwz0xTdwdBi08bxzb/Hb6au2/mRcBpxeF82DBM3WPAkDOcwbyBbWbBQQ7XxvpatvMi/csGDNm5rmfm2IHp32wtQANHva4d4HRRbQz8YwxBYMBPojLHM3jUaMabQG1pFvZhxucScoJyQSqp41OKPRJlx3JvrH7FrTnwvvhSSUOfuFnQeKXIHvnnc3I8ugxhzE17gwJZUHzc2tanRb7x9sX7XDbcMpc5pEO9Q/oiUjR015Gl/NWVEUCLmx+SnHQYy76Wq9YkLaDyNQ7ufgEJy5M20RZvsEOvQXJLr4L77kU+CePNxT8/EkDjBZgP0lT4fWM9GRgQ9Oc7mTAsuqABaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1nlavtCe0jSwhbQ7VCv9Gq1WyBdW4DVdrLU3KFAitM=;
 b=kXoK9vFVfZmLhgr6K0i1t/NGHVBfUh45ADAsDaz3kWWrxqoTLUBUbH9wu35TqVYZjrQIS8s5Yzks3dYHeWvyhM5550P7ONFuYD7a3mNf4W7rXZEvrUh/VyEAHEmQCXo2zu7xSdFCYiTASiCkyHSuUUboqC/SQQ7v/ZWK03R5zWEllDiuibB2G7VKnVw0OCojv/NiusQ1th2aNE6Xp8iAMKOv/fdSmfDAyQOJqa3hqNmeXIICWYEAahjQK3lvN9sfMW5MIr5/RDSy/nMwAXGNQsFx4Zu7H0Xvk73wSnYT12QOhCJs0ZRe3s8EwTXZJhOZLYml6l1H+RAnqXkSX1grHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1nlavtCe0jSwhbQ7VCv9Gq1WyBdW4DVdrLU3KFAitM=;
 b=KcVL7HPCnJMcPZVyPNkixcPFogbyfukWUWutYYeZIlgLUswT7RaKrv+q2Yqn8/BhA6Chde6VV0W8XQPLcI3GqVQoPv1ahrSzebzKmwHC0b2VCDk3/qxUii5urJ7+oaWlxCLpUm/fSupVGBP3hPef98YAq5P1t7FrrxjbWNPvI08=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSRPR01MB11633.jpnprd01.prod.outlook.com (2603:1096:604:232::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 10:34:30 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 10:34:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: laurent.pinchart <laurent.pinchart@ideasonboard.com>, Tommaso Merciai
 <tommaso.merciai.xr@bp.renesas.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tommaso Merciai <tomm.merciai@gmail.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, magnus.damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 10/22] dt-bindings: display: renesas, rzg2l-du: Add support
 for RZ/G3E SoC
Thread-Topic: [PATCH 10/22] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Thread-Index: AQHcXt5Sr0mFHG5nfkaeppwNYIyqH7UPnpSAgABY1gCAQfATAIABPySwgAAMWgCAABDyMIAAD+oAgAAAgIA=
Date: Thu, 15 Jan 2026 10:34:30 +0000
Message-ID: <TY3PR01MB11346DB362955A62D2A2E828A868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <20251203-shrew-of-original-tempering-8a8cfc@quoll>
 <aTA-Hj6DvjN4zeK6@tom-desktop>
 <CAMuHMdW=UkZxhf-pbtp6OBFd_3jPcjUaKFmH4piuc+P=kgxzGA@mail.gmail.com>
 <TY3PR01MB11346DF85F8F7EA9ADDED16EB868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUhke83ZVXxDQE_Dt1HRwyGeoMq1pYmEP47WOgR_vYNtA@mail.gmail.com>
 <TY3PR01MB113463EE3F22A0E0E6C97DC40868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVP4M6mS6itgN13QG_w7rxUo6wUbA2cbWU38=vPA0XLhw@mail.gmail.com>
In-Reply-To: <CAMuHMdVP4M6mS6itgN13QG_w7rxUo6wUbA2cbWU38=vPA0XLhw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSRPR01MB11633:EE_
x-ms-office365-filtering-correlation-id: bf2a77e1-423e-4970-13d2-08de5421aa93
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?RTdLZHcrdVlJTlVmTVRXQ3RXOWFFVjJnbzRMenpGVGp6ZWRpcDFXR01BV0Mz?=
 =?utf-8?B?Z1hkdUtvRmY3YmFScTVud1NpY0daQjB5RWE2VUcydElsY3l0cmM1cWhwL2xF?=
 =?utf-8?B?TDg4bmt1ZWx2RllpUGU0WmtnYTNVNjNqbFY4VndycmJ3eEx4dnhGc0JjblVW?=
 =?utf-8?B?VWlHUmNDMVA3aTNZWHFsall3YVFETDFKOVUyeUx4Q0JHMElxai92cHord0Rr?=
 =?utf-8?B?eFdYTlkvU2NFZ0Jtd293TlFhL0VOWU4zdXhVK2JhaUhnRHlEVkNvbXdPYldP?=
 =?utf-8?B?VFg0VmdHaThKWm9aelRaOGVkdjZiTDJQY2ZjU1l4dDNidkNtdWRJc2pZWTN0?=
 =?utf-8?B?NnFYTm9HWnZEcVNZbGJIRVF3emZFQzBMMkZOSGVZOVdBKzE4d2JjbFQrZ0JY?=
 =?utf-8?B?WkJkNGpWV0VUT21CajdvNEk0ckVLUEZ2aE5YOTRvelpaZjlBQm1sZ05VcEhI?=
 =?utf-8?B?NnI0VFNZVWozZk5ueTZQT0hpcTJmTmE5WUI0STNmbU10bjg0UVlFaTNINFhM?=
 =?utf-8?B?K3FWQ0krZlkyUHA0cTlpT0x5cWFCYVBnZloxaitMWEFpb2xQZ1IzZ2IyMnRH?=
 =?utf-8?B?ZndBcEpoNTNmcWhmalNKZFpNb2VhUGpHV1hLdkVralpQeEhQS0RlcHFGc2V5?=
 =?utf-8?B?ZEtoMjc3WjVTN2RoR0dOUFErOUpzNTdZUWRNU0FYQUptYVNLTUtpdVdkODBx?=
 =?utf-8?B?M0pMaGhDVEgzcVk3WDV6Vjc1cEFqTzk4RmhjTzJMajNZZDZLdWhNUFMyN2tD?=
 =?utf-8?B?QWd1VEJSbmE4SXVRQW5TVEwrSnBDS29JTS9aeE9qa200RTNJQmlxSkJkS3VO?=
 =?utf-8?B?ZnVsUUZHd1dHbWx6OG91dy9DTW85R3kwOGpnM24vd2ZPMHhtRUEzRG1HUkVB?=
 =?utf-8?B?WHoya2doSU5zcVQ5ZW5PVjMxZXhGdHN5R1ZGeGRqdXM5VjZjcnNScFZiOHoy?=
 =?utf-8?B?TVYyQ0c5a1YrL2NoMnQ1d3BNTDdvWEdPUXRqOWNacnNHOVluVE5WM0VJdGNi?=
 =?utf-8?B?b2lpZFp3RG9sRFZON01OWklKeno2V2FrUWRPVVcyZ3dhaTJMMjY2Zm9lNlpt?=
 =?utf-8?B?cVo1SS9qdGdIT2c2K1J2cS9malF6cVg4ckZWdWhEbEtuYmIvYWVIOTFjVHpj?=
 =?utf-8?B?eU9VWDFJVTVMS3NPTXpwSFZSU2x4eExTdzB5aDgxeFRtRmxiYU1CYXNGekdL?=
 =?utf-8?B?ZzJodEpZL1c4UC9Qc3VNWU8yRWxTbTE1SE1HbHh5VUUyR25ManZDbVBqN21p?=
 =?utf-8?B?MkY1UzJwMWxiVnpNZ1dEbENGQnorTjdNenV1cC9nR2ZCeGwreXFjL2c4WDFQ?=
 =?utf-8?B?TVNOU3FabVAyT1NJS3lkbjBXR25EcC9LMkp4Nm8yU0NrTUp3SzM1N3huWDEy?=
 =?utf-8?B?elJLNU5xQnM1eVpTcEl6L0xubFp6ODREWUZQU1doTFRxV2t5SS9jaGx3Y3Q0?=
 =?utf-8?B?ZzJnTUJnV3crWDg5UlpaOFRPZXNtWDlUZTl3cmErclk4Zi9VYkMvNUEvOGRC?=
 =?utf-8?B?UzlpM25JWHdTc2E1eDV3QjJqUVpIekd6WkttN0huWVYvVzVjd0MvdGZpdGlB?=
 =?utf-8?B?YzhBRE9TSUdud1BCVVNmbUhkUklYWWNuci83VXViWmJWSXFwUm95N1pIVlpQ?=
 =?utf-8?B?dzlKSHI4cDlsWlpEY0xLSzY0M0VRdVVnRU5yRzRkWjFhSi9iTUUyeFFiTlYr?=
 =?utf-8?B?emxtd21lRlFuUEFBZi9ybjBGK3hGUmFRWWpWYXM0dy9FOXZlS1VJZm01eFh0?=
 =?utf-8?B?VGM4R1huT0VpV09ITkNjK01CV0t6UmtVVHU1OVdiOEZYbnNkdm1UcHBNSkow?=
 =?utf-8?B?cDluU21XQ0ZaaWtwcTUrZEgrSGZ3OXZjanZiS1Qxc2lyRks1V0thTHJBT0Zl?=
 =?utf-8?B?Yml3cUtJOW50L3hmZXFlMmkvbnNtL2g2cU9nZFAvVWZrYnZTeXAvblREcjFi?=
 =?utf-8?B?RE1nMHJUOUFmMU1pQU1Oenhhb1hQY1hzUDhSUlViV1gvcklvTFBnNzdkbDJ5?=
 =?utf-8?B?bG1HTmxsNGNjZzQyVTlHNU51a1FYSWdiTjVJNXltVElUNXYrbmlhZE02ZXVo?=
 =?utf-8?B?S3BmSWh3Sklmbk1oMkNjQlFUL0owS0M4L3NLMTNWSnBjdFVIVnEvRWNpdlg2?=
 =?utf-8?B?NHZkVHRjWjJQV1IvZzViRW80cVJkckNzYW96cDNBdUpJU25JVWNxQlU4UFpY?=
 =?utf-8?Q?hrwtt4qfcBT/4WQ3xCaaqV4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUFhbVdRdTlsRG5QV2phOFJnOHZ2VTVuM0Z2aGN0NW9CQU1IbUtnaUxVV0lI?=
 =?utf-8?B?Q0FocWZDQ3phWW40TEQzZEZ6TzZEQm82UGxHWFlLT3FXOFZYY3JrZUVIMDAz?=
 =?utf-8?B?d3Y3QVB6eFVtQ1JwdThYTjZrQzFyUENWclFpNEs2L0hNeWtDZnNMZC9WSlZU?=
 =?utf-8?B?ZnNBakNRZEJXZWNJM2YrdXNhNW1jcEpBVTkzVXZpMFVidDFYWlJzMUl5eDcx?=
 =?utf-8?B?SWp4RnB4Tm9sMXhTRlorTmNuWWVHOGd3SlVBSjNON1VQdUU5Z21MUGNBaG03?=
 =?utf-8?B?WmZ1UTV4bTduN3VtaHBaY0pSZVNSOVUyTGNwbXYwU0lsa2I0Yi9OZzVpN1lW?=
 =?utf-8?B?M3NYbm0rV1NDU0x4UUN6NWptdi9ZVUNOb3NscFJDTm84Z3ZvK0VTa05UL3BT?=
 =?utf-8?B?NWNxOFVRbnZJem5uRjZydXQ0NFFEb2E2UUh0em5LYlRvdVBSWkdRNlY2Z2k4?=
 =?utf-8?B?c3p0Qm9uMmp6MG9QMC9nRndFWGtVWWx1NGNDdklZakNMYmRuV1RKbjIza1Zx?=
 =?utf-8?B?OUk5SnlySFJVOVZISW1CYlg1WlhrbDNrYXcwV1VUNFA5cWpDVzlrK2RicUJM?=
 =?utf-8?B?dGppSVUxR1NXUVU3c0x1R3ZJS05tWmdXbmJiNEk3SEcvUjM3N3h1dW82bC83?=
 =?utf-8?B?L0M3Sk0vd3MrQm5aSHdydm5ndWJSMmZHZTBUcGZWaU9ad1p0bFFvc3pUM2hH?=
 =?utf-8?B?VmF1RkY4MURCQ0dQMkZiRGIrU2tqM3UyWTZqbXNTcWFaODVSdVUwUVA2aXRI?=
 =?utf-8?B?NVRrVHRPZFkvMUJMWXJqZ3VjbFlSczh4d211V1FVeEg5YXVSVUxHQ0h1N1pz?=
 =?utf-8?B?QlFkWkl4VzJ0SGpYVXhnOHZKYU9IdlhrekJEcElKQStneWp2V1JXNTVFR3Uy?=
 =?utf-8?B?Q2tNT1RaRE5CNGRJUVFPSVpsOGlLdFd0ZlFRbXlqMFF6dThFQjlOdlhoTHpj?=
 =?utf-8?B?a2pOQWpObFAwL2VNUXFYaFVqd2c4dXEvU2U2ZzNSVzl4R1NOUGVzcWY2K2Jj?=
 =?utf-8?B?NFhUTVNQRW8rbWRIakJCTWFheVdPNnRLMFpEZWtaY2Q1UG9DVkRKYm1KL0E0?=
 =?utf-8?B?VEh3Wmtzd0FRdWtZSEVkRkp4WnRLazhnMUk2MFNBM0ZRRlpBR2JjaUl2Qk1N?=
 =?utf-8?B?UXdoRmN4d3hjQno2cTBrcCtsOGFKdHJzOGg4M0p3TURRRFd0Q25neUVWVXU2?=
 =?utf-8?B?TUhCaC81TzhvTU5PUHZ6eGZyMWNKU3M4OFdzckxjL29yaDY1SmpxL2dtSWND?=
 =?utf-8?B?VW9GeXBnWnRiQU0zWWVhc1JwV2F3emFwcSt4bWFLQko4SERWaVJ3WnN4WFdt?=
 =?utf-8?B?bzFNZHQxaDlSWkt2WW5FT04wUjMvOHRyc21POW12M2RkMUFHdnhUWGNlUXp5?=
 =?utf-8?B?TEtIaEdRZEgzN1l6Z2hIbWRvVW8yOU15c1BuR1AwWTd6VkNROXJFZXF0Qkhp?=
 =?utf-8?B?eW1yN051NDhMWk1YODBnRVl1VmFzb1VteHdGeXZDcGkrckRPOTlGRWhaTWpx?=
 =?utf-8?B?T0Z2eWVuN2w3aWdGV1dyZTJmaDl5UWlRelVEalIxY0NvM2NUWkcwRE5rZjd1?=
 =?utf-8?B?VDV5ZGNIeDdNR3I1NmhDbkhVTXI2TkMxMFdXUE1Gbmx1K2tETDJLeXBaa3pL?=
 =?utf-8?B?aFpwaStVckFGWjk0aG9vdnZzcXFQdE1rUFVwRmh0LzU0ZzhSRjNIREVOMWth?=
 =?utf-8?B?M3k1M1NWUEgzWUJQazJNc0VGTXRkZ2xMNFJjcFFwOTBFbVF2UTI1S2U4eEkz?=
 =?utf-8?B?bGQ5QnNjcXBwRWExaTQwbmtOZkw1a1B2STh2SHg4dmp4bWJKRDRyKy9KYzlq?=
 =?utf-8?B?alUvZ0hKVVJLQzBFWkxjdjFqRUxRUWYxVHdlRFE4aFJIQ2xJckx6TTBWaHdJ?=
 =?utf-8?B?bHZkYzY5TStHOW5zRTBxMUxIcVBBZzRhb2w5dnU3aU5aWkpWVytvWFc0bVR1?=
 =?utf-8?B?UGJpNWhYTm5sOFhHWlpNT2dLc1FaNk9HSll4UVUwZHhLYmVkWGEyVTQwQWtR?=
 =?utf-8?B?eFJpenhVVUpDRE8wWjAxeU8xLy9QM0lYM250SW1FejE0cGw1Zm8xdVBrQ1ZY?=
 =?utf-8?B?WmxGNFdiVjBwV2JYZmdPalFZMmN5ZDdjSzEzMXZFMEVZMTBha1V6THJxS1Fo?=
 =?utf-8?B?N2FaM09KY3NuckxuYzRlZzdpc0t3M3phWit1eVdFZjNrMWhjOTkyVjhaSTFr?=
 =?utf-8?B?NUtHZ0swYXZQNWV4bTNJdG1icExBWHIwS1pzcUZaU3htWUhOZGhuQUhOR0Zr?=
 =?utf-8?B?aElLaHJwb214QzJlakFOSGxVTDZQeWsxaEdYR1hCZXkrdDlhQ3lYSkRvaTJn?=
 =?utf-8?B?MEVFcW9ibFI0Zjd1bXdNZy9YbjQzVFcrMmVwRkpSUHczZUVGc0VKQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2a77e1-423e-4970-13d2-08de5421aa93
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 10:34:30.5315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uO//KljcDgz1R2vsB6dd7Q6aLSYm/9lgs0yuBSSuEoS3utfi7AFDu77YwOBg/owafIlC1KbQvQ+pjjvtc8lULuRaFI+jmzJilL3qWDeJI3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11633
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

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE1IEphbnVhcnkgMjAyNiAxMDoyMg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDEwLzIyXSBkdC1iaW5kaW5nczogZGlzcGxheTogcmVuZXNhcyxyemcybC1kdTogQWRkIHN1
cHBvcnQgZm9yIFJaL0czRSBTb0MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIDE1IEph
biAyMDI2IGF0IDExOjEwLCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdy
b3RlOg0KPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4gT24gVGh1LCAxNSBKYW4gMjAyNg0KPiA+ID4gYXQgMDg6NDgsIEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gT24gV2VkLCAzIERlYw0KPiA+ID4gPiA+IDIw
MjUgYXQgMTQ6NDIsIFRvbW1hc28gTWVyY2lhaSA8dG9tbWFzby5tZXJjaWFpLnhyQGJwLnJlbmVz
YXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+IE9uIFdlZCwgRGVjIDAzLCAyMDI1IGF0IDA5OjIz
OjUzQU0gKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4gPiA+ID4gPiA+IE9u
IFdlZCwgTm92IDI2LCAyMDI1IGF0IDAzOjA3OjIyUE0gKzAxMDAsIFRvbW1hc28gTWVyY2lhaSB3
cm90ZToNCj4gPiA+ID4gPiA+ID4gPiBUaGUgUlovRzNFIFNvYyBoYXMgMiBMQ0QgY29udHJvbGxl
ciAoTENEQyksIGNvbnRhaW4gYQ0KPiA+ID4gPiA+ID4gPiA+IEZyYW1lIENvbXByZXNzaW9uIFBy
b2Nlc3NvciAoRkNQVkQpLCBhIFZpZGVvIFNpZ25hbA0KPiA+ID4gPiA+ID4gPiA+IFByb2Nlc3Nv
ciAoVlNQRCksIFZpZGVvIFNpZ25hbCBQcm9jZXNzb3IgKFZTUEQpLCBhbmQgRGlzcGxheSBVbml0
IChEVSkuDQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiAgLSBMQ0RDMCBzdXBwb3J0
cyBEU0kgYW5kIExWRFMgKHNpbmdsZSBvciBkdWFsLWNoYW5uZWwpIG91dHB1dHMuDQo+ID4gPiA+
ID4gPiA+ID4gIC0gTENEQzEgc3VwcG9ydHMgRFNJLCBMVkRTIChzaW5nbGUtY2hhbm5lbCksIGFu
ZCBSR0Igb3V0cHV0cy4NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IEFkZCB0aGVu
IHR3byBuZXcgU29DLXNwZWNpZmljIGNvbXBhdGlibGUgc3RyaW5ncyAncmVuZXNhcyxyOWEwOWcw
NDctZHUwJw0KPiA+ID4gPiA+ID4gPiA+IGFuZCAncmVuZXNhcyxyOWEwOWcwNDctZHUxJy4NCj4g
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gTENEQzAvMSBidXQgY29tcGF0aWJsZXMgZHUwL2R1
MS4uLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBXaGF0IGFyZSB0aGUgZGlmZmVyZW5j
ZXMgYmV0d2VlbiBEVTAgYW5kIERVMT8gSnVzdCBkaWZmZXJlbnQNCj4gPiA+ID4gPiA+ID4gb3V0
cHV0cz8gSXMgdGhlIHByb2dyYW1taW5nIG1vZGVsIHRoZSBzYW1lPw0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+IFRoZSBoYXJkd2FyZSBjb25maWd1cmF0aW9ucyBhcmUgZGlmZmVyZW50OiB0aGVz
ZSBhcmUgdHdvIGRpc3RpbmN0IGhhcmR3YXJlIGJsb2Nrcy4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiBCYXNlZCBvbiB0aGUgYmxvY2sgZGlhZ3JhbXMgc2hvd24gaW4gRmlndXJlcyA5LjQtMiAo
TENEQzEpIGFuZA0KPiA+ID4gPiA+ID4gOS40LTEgKExDREMwKSwgdGhlIG9ubHkgZGlmZmVyZW5j
ZSBjb25jZXJucyB0aGUgb3V0cHV0LCBidXQNCj4gPiA+ID4gPiA+IHRoaXMgdmFyaWF0aW9uIGlz
IGludGVybmFsIHRvIHRoZSBoYXJkd2FyZSBibG9ja3MgdGhlbXNlbHZlcy4NCj4gPiA+ID4gPiA+
IFRoZXJlZm9yZSwgTENEQzAgYW5kIExDREMxIGFyZSBub3QgaWRlbnRpY2FsIGJsb2NrcywgYW5k
IHRoZWlyDQo+ID4gPiA+ID4gPiBwcm9ncmFtbWluZyBtb2RlbHMgZGlmZmVyIGFzIGEgcmVzdWx0
Lg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEluIHN1bW1hcnksIGFsdGhvdWdoIG1vc3Qgb2Yg
dGhlIGludGVybmFsIGZ1bmN0aW9ucyBhcmUgdGhlDQo+ID4gPiA+ID4gPiBzYW1lLCB0aGUgdHdv
IGJsb2NrcyBoYXZlIG91dHB1dCBzaWduYWxzIGNvbm5lY3RlZCB0byBkaWZmZXJlbnQgY29tcG9u
ZW50cyB3aXRoaW4gdGhlIFNvQy4NCj4gPiA+ID4gPiA+IFRoaXMgcmVxdWlyZXMgZGlmZmVyZW50
IGhhcmR3YXJlIGNvbmZpZ3VyYXRpb25zIGFuZCBpbmV2aXRhYmx5DQo+ID4gPiA+ID4gPiBsZWFk
cyB0byBkaWZmZXJlbnQgcHJvZ3JhbW1pbmcgbW9kZWxzIGZvciBMQ0RDMCBhbmQgTENEQzEuDQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiBJc24ndCB0aGF0IG1lcmVseSBhbiBTb0MgaW50ZWdyYXRpb24g
aXNzdWU/DQo+ID4gPiA+ID4gQXJlIHRoZXJlIGFueSBkaWZmZXJlbmNlcyBpbiBwcm9ncmFtbWlu
ZyBMQ0RDMCBvciBMQ0RDMSBmb3IgdGhlDQo+ID4gPiA+ID4gY29tbW9uIG91dHB1dCB0eXBlcyBz
dXBwb3J0ZWQgYnkgYm90aCAoc2luZ2xlIGNoYW5uZWwgTFZEUyBhbmQgNC1sYW5lIE1JUEktRFNJ
KT8NCj4gPiA+ID4NCj4gPiA+ID4gRHVhbCBMVkRTIGNhc2UsIGRvdCBjbG9jayBmcm9tIExDREMw
IGlzIHVzZWQgaW4gYm90aCBMQ0RDJ3MuDQo+ID4gPg0KPiA+ID4gRm9yIHRoZSBzaW5nbGUgZHVh
bC1jaGFubmVsIExWRFMgb3V0cHV0IG9uIExDREMwLCBvciBmb3IgdXNpbmcgdHdvDQo+ID4gPiBp
bmRlcGVuZGVudCBMVkRTIG91dHB1dHMgb24gYm90aCBpbnN0YW5jZXM/IEhvdyBpcyB0aGlzIGhh
bmRsZWQ/DQo+ID4NCj4gPiBEdWFsLWNoYW5uZWwgTFZEUyBvdXRwdXQgb24gTENEQzAsIHdlIHVz
ZSB0aGUgZGF0YSBmcm9tIExDREMwLg0KPiANCj4gVGhhdCdzIHRoZSAiZHVhbC1saW5rIiBjYXNl
IGJlbG93PyBCdXQgdGhhdCBjYXNlIGRvZXNuJ3QgdXNlIExDREMxIGF0IGFsbCwgc28gaG93IGNh
biAiZG90IGNsb2NrIGZyb20NCj4gTENEQzAgaXMgdXNlZCBpbiBib3RoIExDREMncyIgYmUgdHJ1
ZT8NCg0KVGhhdCBpcyBhIHR5cG8uIFNvcnJ5IGZvciB0aGF0Lg0KDQo+IFdoYXQgYW0gSSBtaXNz
aW5nPw0KDQpEdWFsLWxpbmsgY2FzZSwgTFZEU19UT1BfQ0xLX0NIMCwgTFZEU19UT1BfQ0xLX0RP
VF9DSDAgdXNlZCB0byBkcml2ZSBib3RoIHRoZSBMVkRTIGNoYW5uZWxzLg0KSW4gdGhpcyBjYXNl
LCB0aGUgY2xrcyBMVkRTX1RPUF9DTEtfQ0gxLCBMVkRTX1RPUF9DTEtfRE9UX0NIMSBhcmUgbm90
IHVzZWQuDQoNCj4gDQo+ID4NCj4gPiBXZSBoYXZlIHRoZSBmb2xsb3dpbmcgdXNlIGNhc2VzOg0K
PiA+DQo+ID4gU2luZ2xlLWxpbmsoY2gwIG9ubHkpOg0KPiA+ICAgVGhpcyBtb2RlIG91dHB1dHMg
dGhlIGltYWdlIGRhdGEgb2YgTENEQzAgdG8gTFZEUyAoY2gwKS4gSW4gdGhpcyBtb2RlLA0KPiA+
ICAgTFZEUyAoY2gxKSBpcyBub3QgdXNlZC4NCj4gPg0KPiA+IFNpbmdsZS1saW5rKGNoMSBvbmx5
KToNCj4gPiAgIFRoaXMgbW9kZSBvdXRwdXRzIHRoZSBpbWFnZSBkYXRhIG9mIExDREMxIHRvIExW
RFMgKGNoMSkuDQo+ID4gICBJbiB0aGlzIG1vZGUsIExWRFMgKGNoMCkgaXMgbm90IHVzZWQuDQo+
ID4NCj4gPiBTaW5nbGUtbGluaygyY2gpOg0KPiA+ICAgSW4gdGhpcyBtb2RlLCB0aGUgaW1hZ2Ug
ZGF0YSBvZiBMQ0RDMCBpcyBvdXRwdXQgdG8gTFZEUyAoY2gwKSBhbmQgdGhlDQo+ID4gICBpbWFn
ZSBkYXRhIG9mIExDREMxIGlzIG91dHB1dCB0byBMVkRTIChjaDEpLg0KPiA+ICAgU2luY2UgTFZE
UyAoY2gwKSBhbmQgTFZEUyAoY2gxKSBhcmUgbm90IHN5bmNocm9ub3VzbHkgcmVsYXRlZCwgdGhl
eQ0KPiA+ICAgY2FuIGJlIG91dHB1dCBpbiBkaWZmZXJlbnQgaW1hZ2UgZm9ybWF0cyBhbmQgY2Fu
IGJlIG9wZXJhdGVkIGFzeW5jaHJvbm91c2x5Lg0KPiA+DQo+ID4gU2luZ2xlLWxpbmsoTXVsdGkp
DQo+ID4gICBJbiB0aGlzIG1vZGUsIHRoZSBpbWFnZSBkYXRhIG9mIExDREMwIGlzIG91dHB1dCB0
byBib3RoIExWRFMgKGNoMCkgYW5kDQo+ID4gICBMVkRTIChjaDEpLiBMVkRTIChjaDApIGFuZCBM
VkRTIChjaDEpIG9wZXJhdGUgc3luY2hyb25vdXNseS4NCj4gPg0KPiA+IER1YWwtbGluazoNCj4g
PiAgIEluIHRoaXMgbW9kZSwgdGhlIGlucHV0IGltYWdlIGRhdGEgZnJvbSBMQ0RDMCBpcyBzZXBh
cmF0ZWQgaW50byBFdmVuIHBpeGVscyBhbmQNCj4gPiAgIE9kZCBwaXhlbHMsIGFuZCB0aGUgb3V0
cHV0IGlzIGRpc3RyaWJ1dGVkIHRvIExWRFMgY2gwIGFuZCBjaDEuDQo+ID4NCj4gPg0KPiA+ID4g
RG9uJ3QgeW91IG5lZWQgYSBjb21wYW5pb24gcHJvcGVydHkgdG8gbGluayB0aGVtIHRvZ2V0aGVy
Pw0KPiA+DQo+ID4gWWVzLCBXZSB1c2UgY29tcGFuaW9uIHByb3BlcnR5IGZvciBEdWFsIGNoYW5u
ZWwgTFZEUyhEdWFsLUxpbmspIHVzZSBjYXNlLg0KPiA+ID4NCj4gPiA+IElzIHRoaXMgc2ltaWxh
ciB0byBkdWFsLWNoYW5uZWwgTFZEUyBvbiBSLUNhciBFMyBhbmQgUlovRzJFPw0KPiA+DQo+ID4g
WWVzLg0KPiANCj4gT0ssICJjb21wYW5pb24iIGlzIGluIHRoZSByZW5lc2FzLGx2ZHMgYmluZGlu
Z3MsIHdoaWNoIGFyZSBub3QgeWV0IHVwZGF0ZWQgZm9yIFJaL0czRT8gRG8geW91IG5lZWQgaXQN
Cj4gaW4gInJlbmVzYXMscnpnMmwtZHUiLCB0b28/DQoNCk5vdCByZXF1aXJlZC4gV2l0aG91dCB0
aGF0IGl0IHdvcmtzIGxpa2UgUlovRzJFLg0KDQo+IA0KPiA+ID4gT24gdGhlc2UgU29DcyB3ZSBo
YXZlIGEgc2luZ2xlIGNvbWJpbmVkIGRldmljZSBub2RlIGZvciBhbGwgRFUNCj4gPiA+IGluc3Rh
bmNlcyAod2hpY2ggY29tZXMgd2l0aCBpdHMgb3duIHNldCBvZiBpc3N1ZXMsIGUuZy4gUnVudGlt
ZSBQTSBhbmQgQ2xvY2sgRG9tYWluIGhhbmRsaW5nKS4NCj4gPg0KPiA+IEJ1dCBpbiBvdXIgY2Fz
ZSwgaXQgaGFzIDIgc2VwYXJhdGUgaW5kZXBlbmRlbnQgTENEQyBJUCdzIHRvIGFsbG93IGFsbCB0
aGUgcG9zc2libGUgb3V0cHV0cyBhcw0KPiBtZW50aW9uZWQgYWJvdmUuDQo+ID4NCj4gPiA+ID4g
U3RhbmRhbG9uZSBMVkRTIGFuZCBEU0kgdGhlIHByb2dyYW1taW5nIGZsb3cgaXMgc2FtZS4NCj4g
PiA+DQo+ID4gPiBPSy4NCj4gPiA+DQo+ID4gPiA+ID4gT2YgdGhlcmUgYXJlIG5vIHN1Y2ggZGlm
ZmVyZW5jZXMsIGJvdGggaW5zdGFuY2VzIHNob3VsZCB1c2UgdGhlIHNhbWUgY29tcGF0aWJsZSB2
YWx1ZS4NCj4gPiA+ID4NCj4gPiA+ID4gVGhlbiB3ZSBuZWVkIHRvIHVzZSBhIHByb3BlcnR5IGNh
bGxlZCBkaXNwbGF5LWlkLCB0byBkZXNjcmliZSB0aGUNCj4gPiA+ID4gc3VwcG9ydGVkIG91dHB1
dCB0eXBlcyBpbiBiaW5kaW5ncywgcmlnaHQ/Pw0KPiA+ID4gPg0KPiA+ID4gPiBEaXNwbGF5LWlk
PTAge0xWRFMsIERTSSkNCj4gPiA+DQo+ID4gPiBMVkRTIHR3aWNlPw0KPiA+DQo+ID4gTENEQzAg
c3VwcG9ydHMgRFNJIGFuZCBMVkRTIChzaW5nbGUgb3IgZHVhbC1jaGFubmVsKSBvdXRwdXRzLg0K
PiANCj4gVGhhdCdzIHR3byBwb3J0cyBmb3IgTFZEUyAoaS5lLiAidHdpY2UiKSwgcmlnaHQ/DQoN
ClllcywgeW91IGFyZSBjb3JyZWN0Lg0KDQpDaGVlcnMsDQpCaWp1DQo=
