Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC06DBE1BB1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DDC10E94D;
	Thu, 16 Oct 2025 06:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="SEulEf5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013054.outbound.protection.outlook.com [52.101.72.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1253610E936
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:32:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kjl4SkR+CI0XEtp+B93ZiXvxE16AtPX0T5fJq/zohqI/b5i0OgI/SHhvIy/7nLDqZiN5sJ/Ud5lSqecDxyLc/hOBZj8aXc4GizrrmaWr1Kg0DK0fRRNeXrw6wXtPxF4ahkbRgqPeBQsU/3+7pQ9aUH42poKpdIGuAo642qGss2I7PkgPfG24WfTMrBlUthGzrU/06XTke8e6l51OjitMOqRvlrozsIUq69PMu/gsuQYnkliIA4R6sjQp064hY/xWV14XRXzaEXhaKqu8Lzzf5niNjDd7GfoAkR3+Jfl1UZ2QJ5Ih4A7d0NTU+8su0h2ppmcKZDvn+auc+lOWNmjovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poWku8GBcMrVVryGNnq7eBjf2oAEJl/55bElpxFMyA8=;
 b=MGz79kfhLP7a2s/1R7Ankcl1q95op7dA4cLwMFHuD0OGKr3KtuJ2t/NTfFexnZCo/wQvbEZSEcrFinXxUXuQWNDPEacyosrKqLcjAQ1almK4xBIzfwrsqmrjVsrcPkyexc85bEZmSvprjNfsIc8Sh2/a8L0SG2nM1QOcZBy8mA8OQGZY7RVZNJIzmFto9IW4ZFTOtWXMu78pyWYaiCNDpToGTuxBUAyu9r+a27/kHuU/m5pnGYMVY8JNHnEHOVkpdvHjY3+A0Cp/Ah2n12/vFScTwYjHytpQJLQqbeelv9Ehq7Gou4Ukq86K31efAKTJ7MfS4GiSmFBMCMAio96zQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poWku8GBcMrVVryGNnq7eBjf2oAEJl/55bElpxFMyA8=;
 b=SEulEf5H1WxEcwEZ0EuisOIt5diYaFCfb+AyrKGh8K6O029NUMGbkdzvZOtr30AErKfIMeTS4nhzNi7G1G3VML3K0pguXvtFOijdfcnSkFweLQPQAOV9mIawwgZkObXd65NUp/f8Hh3XJhTyPIGXZ6NvaE0wMPlXRasaSkJXSAFamf34MkTDOoxK/P+IHQTfQjaMS1tYkX0WnHg0fR8VnGN3mb0+b5VgrNfo1o0BaTWCZcJtClj42tPhQ1+n9HRhl0q5omPDAJMkW6T2sG2Th+bhu6s/KG6B0fkmnPtvUmOWtGrqkR4s/DvLGfJNs3kfieD8/ACDr+HohAjGf2sQzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9964.eurprd04.prod.outlook.com (2603:10a6:10:4c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 06:32:36 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 06:32:36 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Thu, 16 Oct 2025 14:32:20 +0800
Subject: [PATCH v4 02/14] dt-bindings: display: imx: Add i.MX8qxp/qm DPR
 channel binding
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-imx8-dc-prefetch-v4-2-dfda347cb3c5@nxp.com>
References: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
In-Reply-To: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9964:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff37479-49f5-48be-3556-08de0c7dcbbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q09UV0JUMG5jZXhKQ0RQa1MvVTlQU0x5c0wySmNMVkdRc082azYrTHY4TnRF?=
 =?utf-8?B?K3JwSjhVM1BlOVRpMXBrc2Vic3oycm45eEc5a3hVOHpadmJWQ0xsNXFFUFUx?=
 =?utf-8?B?T3NHeVFWK3JJYmgyaVBzWFNKTzhEVEE3MEFUM3d6OG43QzdWZE8wREtDdlA5?=
 =?utf-8?B?WDgwNllTWVR0cXVvRHMzZnFmbkZsU2ZuVmMzTDd0bFZ2Q0ZwQXpVazlCdkYw?=
 =?utf-8?B?aG5rVGEwU2I2MG9wQ0hvSGlQZ0lMWWZIcXlTWmF0UC9tVThvend4TXdyTDQr?=
 =?utf-8?B?YnhHOXQwcUphUWI5MCtORitSanEwS3VjSDlrbUZJZldDWkZiaUtSc3pVNVlt?=
 =?utf-8?B?ZUw1dkp4WUVmdlp4Y3BETFRObFEwWW1TSHdHTVdkaW51V3JSNmJVMjR1Y0lh?=
 =?utf-8?B?WThQVGkzQUxSQ3g4ekZTRWxNcjRsSmthMkNXaEVZYm5JaVdEMTNiY09jeCs4?=
 =?utf-8?B?RG1aR0hsaWphVitWZ0ZMQy84eVhUNmg3bTljMjJ0djhVam1oTmhMQXFKNW5i?=
 =?utf-8?B?QmJBcW1zc1g3UGczS2toemhvdEhucXVsT0JkeHEvQmJWSEdmMU15VXhHbzBB?=
 =?utf-8?B?bFp6SFJmWWxCdFNwempIcHRiL0ZESDk5TWExWEE3UjNabkg3Q01tRjZlb0to?=
 =?utf-8?B?VzNDYXppUUZBVFJNcFMxU0NqZVFZN2ZsSENjZ3puL2Z0eHlraGNDYUNORnF5?=
 =?utf-8?B?MUxWTDBsZDNXdEQ3Wm8weXdFYWpmSlg2QzlZSENTZ2p4bFBaM2tJbmMwSnNz?=
 =?utf-8?B?a1VJaFR3VjhvM1U2WXlXeU8ySktSc25qeGFYUFY0Z0JLdkxqNXVma1Q2cHU3?=
 =?utf-8?B?cHhOTzhud0dGVHVyNUtzaEttQjlROEsrNmhrcmtuYUs0UThkRGpObzFYd1lo?=
 =?utf-8?B?NHRNZWNFek9NVU1remthZExFZFpXQ2NaRmxyY0xpOEJheXJxcVBnQ2Q3djhx?=
 =?utf-8?B?QTFKOVlDU2U0a0hkSXJoS1FCcTVkQ1FwTHlzVSt0NU5ERXhSVzZ5WHg2TkZr?=
 =?utf-8?B?QlJFdXBNK2h6dlArUTBKNjQzTW9WR1NNakJlNVVqRXMranBFOG9jbVhJenZy?=
 =?utf-8?B?cnBkTTlTRHJSbXhldnB3K3NVc1dWazQ2KzlsOXUvQTdKMHZuYngzdlBlTzBn?=
 =?utf-8?B?NThEbUJ6RlJCWTgvTXpPWlNRZ3ZMWXpsZUoxaXZaUmxzRENjOXBTMk42UEc1?=
 =?utf-8?B?cHZNSU1zVFg4cllSY0g4UHlpUWFpSjJrZ2ZabVdPYkxGVFZwVitxZDZkNU5R?=
 =?utf-8?B?RmNEcUExQTcyK2pESEVGRFBWelZlMHg0NVFFa1Q5Qll2cms0MURYSWhqNTZj?=
 =?utf-8?B?UDdOR25YdFFadThpMVRINHFCZURkS0llYXU1UWZVeThzSndDSzFkRVdJanFm?=
 =?utf-8?B?WEpFbElLcktQOURxazNzMERDbTkzNmYyWmlTN3ZmQTg4ZHBPR1M1YUdZRnM3?=
 =?utf-8?B?STRDRkNZbTNjV2RpSEdHSmprbGI2S2FaYk4rajhVODVxdUh5VG9QZUlBWnBS?=
 =?utf-8?B?NU81aGFBK2czL2V6dnY1RjgvV3RjYlRQbkxRcGJnTlJ0Tld5MVo4WVhEbXBm?=
 =?utf-8?B?cUphd01qaUltSWZHcUFKK0s0R2pMMVB1Mjl1QldOeVBjMjRYOVVJR2ZUV3JU?=
 =?utf-8?B?a2NFaHVJdWtwVGE1MDRUK1FIZzVxb294Yjl1Y0hNcXM3cW51Z1RWUjhNY0RV?=
 =?utf-8?B?d0FmZWFzWk90TEJOR1J4ZC90bmtFdjlRdWJBVGFkN2owbWk1d2lOTExwUEtV?=
 =?utf-8?B?OGNSTjdTbG1zdlFaYjZ5UEtxSU9Dd2Y4UEV5ZnhPQ3lqSWxPdElwYXJVNEZu?=
 =?utf-8?B?TnhIOTc1VXdoZmpuMFlXeVFoRkhrNjZ2ckNxL0JrNlkwaVpnWm52dWp1QmRQ?=
 =?utf-8?B?dHJ0anNMWjF5V01vdEVacWNnK1R5b3o4cDNGS01ibHRITC8wMkdEYytwMHBJ?=
 =?utf-8?B?SVF5SFRwNXBocjBQeElXSVhWQllhLy9vRzNnZlpxN1VFci9MQ2RibTdyS2ZS?=
 =?utf-8?Q?fgDu9ZytXP7TaARLlwKDoOQCVEBnVI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anU4ZklNYmhYQ2p5cW5UMnprMkpSZFJqQVBLYzh2WjI0Y1UrZGVHU3RDM3Nl?=
 =?utf-8?B?V2t2SGdZS29WVHAyRG9jMEdqVzV3RTNPaGVrVHBXdFY2NEdBUXMraVk0b1pX?=
 =?utf-8?B?Y2xub3RJNjVkaElXZldmSE1zcnFtTWp4aHhKZlJXelk1ZGplZERJS0dDSlIx?=
 =?utf-8?B?eVRxMU5RZGVHdGdHTERHZExRaS92aUZ6NmpybnFiYUQzVFNSL0d1QzB4cU5j?=
 =?utf-8?B?NUtLdlllbGlGK1k0OG9yVlNOSTF1RlVSaUlGd2JmOHNxV1RyMDg0a3VXdVhP?=
 =?utf-8?B?NWk0M2pKY0JsdytjamQyMHorVXE5T0ozK1FJM0lDbWFXZUNodnFPc3duOWZi?=
 =?utf-8?B?dzFqVXgrMnBTUlVnRUNyZ0h3QzcyQW0vbjFia2NQZTRBSHA2cW9KV0c2YjBH?=
 =?utf-8?B?elVvN3VuZ0VqUUMvazY5QTFkL3RQYnM1OEVta2RuRGh2UXZJdVo3L2M1YkJD?=
 =?utf-8?B?MjMyVEc1UVU0YVpFOVJiY29GVWhEL2VldTVRL3JUOCtsYlZzODFCeXJiM1Ux?=
 =?utf-8?B?Vnp2c1lKNERrWElDaVo5ZHQ1Vm1ETENqMkhtazl6Vzl4TGRmdFB2K1BDTTI2?=
 =?utf-8?B?QlZmbjR4bkNUN25rdlV4aHJXMXZXZFBXbVMvbWZDWlhVKzF6RUhRNmRqZTQ1?=
 =?utf-8?B?N0tDWG0vbklYelBjclorbjh0TXpFYUJFZFNlVm1sTjQycjdCSjBlK1lMdWtU?=
 =?utf-8?B?Smw3VEdtcWIycktHREJQZ0EwOElEd3d1cTE5eGFMT3FLdVpRMTl1VmdUanky?=
 =?utf-8?B?cXp4cllua2FLUmIrZFpDTitJWDM1TDZSNmtjZW9XK2F3V2FmOHVxaFhadmN1?=
 =?utf-8?B?bmhMWVVJMkRuQXlPRSt6ZUtpeTF2bFpRa2l0RlZWYlIrTkNGSm4xeWJtd1or?=
 =?utf-8?B?L3dra1ZzV00xMXh0Z2hEZDFHRmtlNEJyMWJpNDBDTnBuczljSWNvam54ZHg1?=
 =?utf-8?B?Q3JLUnFiQzFURksrd0xjUW5kbTFCSk5TNEk4aU1uclRmNFpTMzlySnIvMnEx?=
 =?utf-8?B?M2wzTDFhSzVkaEhLNXRjalY5RFl2UXFybTk3Y2Y4MWQraFZhTE9CL0ZYT1BB?=
 =?utf-8?B?ajE0Q1B3ZEdiczFzQkxObzJQS0IyVlhNbWNFSzhmVHo0b3o5T2dXMmZDYzJF?=
 =?utf-8?B?M0NneXNtZlQrb1ZBTU41MjhaQ2xqczhtOEphRVlVN3kzbUtsVkxhZzE4QWhs?=
 =?utf-8?B?Um1FOS8xK1NhdFhuemlUb2VXZUJwRHF6WkE1ZFhkdTdoWUdSeHAvSnVvWC84?=
 =?utf-8?B?NmFkYUtCUkZ0VU5USit0YjVmVkl3ZWdHcmtrZStVL1FCOUlDYlkyVGlBMHMx?=
 =?utf-8?B?VlFESGtFbTlpdHdJVkg4WUJaeDIyalVzNDM4U2QyQzlyQklvQXM1TG00S3ZP?=
 =?utf-8?B?WTNtZStOUnRuazU2UDlGL0NnTmVMNTNZbVU2NWg3dVIzelBWWEFBYkJTUmJ5?=
 =?utf-8?B?c0hVS25MaWptTFY4a1JFWUNFTmQyREJ3Si9FbWZhZDJ0Q2hWSThraWFSMnBM?=
 =?utf-8?B?azErVXdiY2hRc3pGNi9tVWxGaTFQbVlrVCtCeHpaeWljdXdiVnliV3ZTL2xk?=
 =?utf-8?B?WUltcmhYQmRrWHdmdWRmbHNtSm45eHBTdWNEK3FPMS9KOHArZFh1RDdNNkd0?=
 =?utf-8?B?TWQ3UjR2YlRxdUsxVWY1Qi9LblVjZzh6amxFOFNUbEhQdFZWMjFnSkszYTY5?=
 =?utf-8?B?S3FlSkxUVGM4M3VrTWFRdTdjTmZkdUswYzVqbHY4Zzl2SVRncE5LM2MvWjIz?=
 =?utf-8?B?bzZNR0l2VW9JV0FCUDlrWHVrVTErcnhJUHFiN0NZc0YrSDdwNk5VRGEvTEtX?=
 =?utf-8?B?SDVTWWdCNjNRb0JSd3JnYnJvR2sxaC9CaDBMWTVyWmJDYzA5ZzJUSnM3Sm1X?=
 =?utf-8?B?amt3UUc1ckhGaHpBUG5NZnpWTE8vRzc5cktteDFabS9kK2xqSjZmbnlHWU5V?=
 =?utf-8?B?ZmY1NlVBL2JMTDVGWVd2aHc0WHJIcVB5NjRjdDNRQ2xiNXplUHZlaE1XQTNu?=
 =?utf-8?B?OW92YzhROFROcUFobkt0VUZkc0phZ09hOVRKY2ZVQkNtYW54UTlKTUVIR1Br?=
 =?utf-8?B?TDBEVXFiVDlSY1RlM2ROcHpMOXA1cTZXMXdIQktHek9Na2VVUkZEM1pQanRO?=
 =?utf-8?Q?bhDQ80PktObk7/j+5drH4+LKK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff37479-49f5-48be-3556-08de0c7dcbbf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:32:36.4290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKcegREmyOX4flYGmY5utb1zaBShy9U3X8t38eLJu/1N9zS3tGkGfwLFJPcoy234M2SnuBFHetiJ2ePOaRC7qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9964
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

Add bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Changed commit message to use imperative mood.
---
 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bd94254c1288d75f81662ef12b7f79209efb45f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dprc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Prefetch Resolve Channel
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX8qm/qxp Display Prefetch Resolve Channel(DPRC) is an engine which
+  fetches display data before the display pipeline needs the data to drive
+  pixels in the active display region.  This data is transformed, or resolved,
+  from a variety of tiled buffer formats into linear format, if needed.
+  The DPR works with a double bank memory structure.  This memory structure is
+  implemented in the Resolve Tile Memory(RTRAM) and the banks are referred to
+  as A and B.  Each bank is either 4 or 8 lines high depending on the source
+  frame buffer format.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dpr-channel
+      - fsl,imx8qm-dpr-channel
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    items:
+      - description: DPR wrap interrupt
+      - description: |
+          'r_rtram_stall' interrupt which indicates relevant i.MX8qm/qxp
+          Prefetch Resolve Gasket(PRG) or PRGs are forcing an underflow
+          condition in the RTRAM.
+
+  interrupt-names:
+    items:
+      - const: dpr_wrap
+      - const: r_rtram_stall
+
+  clocks:
+    items:
+      - description: apb clock
+      - description: b clock
+      - description: rtram clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: b
+      - const: rtram
+
+  fsl,sc-resource:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The SCU resource ID associated with this DPRC instance.
+
+  fsl,prgs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      List of phandle which points to PRG or PRGs associated with
+      this DPRC instance.
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+  - interrupt-names
+  - clocks
+  - clock-names
+  - fsl,sc-resource
+  - fsl,prgs
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    dpr-channel@56100000 {
+        compatible = "fsl,imx8qxp-dpr-channel";
+        reg = <0x56100000 0x10000>;
+        interrupts-extended = <&gic GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
+                              <&dc0_irqsteer 324>;
+        interrupt-names = "dpr_wrap", "r_rtram_stall";
+        clocks = <&dc0_dpr1_lpcg IMX_LPCG_CLK_4>,
+                 <&dc0_dpr1_lpcg IMX_LPCG_CLK_5>,
+                 <&dc0_rtram1_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "apb", "b", "rtram";
+        fsl,sc-resource = <IMX_SC_R_DC_0_VIDEO0>;
+        fsl,prgs = <&dc0_prg4>, <&dc0_prg5>;
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };

-- 
2.34.1

