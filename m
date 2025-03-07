Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65E0A56104
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 07:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF94310E0F9;
	Fri,  7 Mar 2025 06:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="GbUvrXfm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2052.outbound.protection.outlook.com [40.107.241.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB4810E0F9
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 06:41:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYU+ASEAHp1Yv2JgAh5Y45JvDbKJh5sFOjCZwsxpWbMGOTi5t9ulnFCmaKsk9dmhoipIzgasNRea/09XKV7DbdFF0tvwCRWV2UVMHvFrCRAMoQUeufsQ4/a2JrPhuMq4nvgz8fuHqEroIldb7GpzYtD/s/gteyFN0C/0kvXlL3vd/H4NiS19DT+dvdurUj61Cvctv9AvLfB5PNcxR7Ap6G04ir79TddBSUp85v/ZgDvZ80BNvtqEcG+NWV1KbRUeZUV4SA+/heg2jLZLGTne64a7EMcwnBD1fsQWDQP/WdWJzc35QpGv/aYDgvWXZntuZ4Rg7rtwhGh9IRc2AOZ3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/7veqbCImslTTTClGmuV0vBhIx7ZfNwR0pKtToxJ/o=;
 b=UPMdjS7TmuUo33zwyCPiFfibSE3w0cbltHNO8BE/qjtxfghCMw9grROJ/6lZRAz/TP+XsaW87bAPBybbg9544ZjpRmR7KSK7GwcHvk5yrbtJM6+yQtzW/223BYM0N4GJFK3LPuRN9DM1bAg1tA6nKmmvDbfrg3laZPkyZ7A2Reoimmvref4KmyuOj6rOwJi9uy0GpBf0ljRPRu45SF5f0hcOzQVkUSlEvKNy4tcx7wDf1k6nn9ZQQw5ck3DfmpEsLeUSFKkSOU+TlVvaFRBmlvBfyEP92Q18fSYFDiFlG7cwt46FvCi9dmDn4V9PnweuoM6WmAfWHphm35tglFJuwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/7veqbCImslTTTClGmuV0vBhIx7ZfNwR0pKtToxJ/o=;
 b=GbUvrXfmpZlKA8K4ZCMvGRBFz2YeSbDR6/z8B0/IPTznudWlnD1gyub41bWpNYf3jZFgW5DvF0aM2qmRQXCDkm22Uy+dLj7/MaHws33Ztovcf6+fmhJIgOK0GecR6uY+iMXf3QyeV/o5+JMObx/Vg9GiEoC8BQmws4d84eJzhCFFJl3IrlLv+dFnFOj+eCNwTnvfl3qthruBkbfyOgeH3erlzVlpOvyYMsFDq1+cptNIb5FJZCNvrFlYXHjHMsPr/iTSbw4mBfqh2hq+wvgpAKvevOEpJ7Wx1p5vq+Syju5fTF8cvKsZ3KaJOfMivZ9W/Ppj89Mrnmsd+dxKNAyNdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9769.eurprd04.prod.outlook.com (2603:10a6:20b:679::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Fri, 7 Mar
 2025 06:41:02 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 06:41:02 +0000
Message-ID: <71c44221-b18b-4928-8faf-00893ec4a109@nxp.com>
Date: Fri, 7 Mar 2025 14:42:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/bridge: imx8qxp-ldb: cleanup return value
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250306-drm-two-ldb-improvements-v1-0-f139d768b92c@bootlin.com>
 <20250306-drm-two-ldb-improvements-v1-1-f139d768b92c@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250306-drm-two-ldb-improvements-v1-1-f139d768b92c@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9769:EE_
X-MS-Office365-Filtering-Correlation-Id: 144254fa-67b1-49b5-c7da-08dd5d430734
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWtJM2N1YVN5bkllVlcrWFA3b0ducmFBSzJFdjM3RVQ4T1dnVCs1V3hrdUJt?=
 =?utf-8?B?NE10RFo3RnZWL1NJcXA4UkFRbU1hYkZzNytKQlhrMUVsd1NmQm1WemtRd0tH?=
 =?utf-8?B?SUdqdE5vbnJEaFBVVUljWGo2Qlg3WlpEdFlDanRHSkJRdGRaOERXMzVYM1hU?=
 =?utf-8?B?ZUZUbHBIL0tCM0xFODFEY1c0ay9QejVEZTNxUFZhSmNxOUpIS0hHRlFUUXA0?=
 =?utf-8?B?UlNpYUloaEQ4OEhHYlNyME1tTzJTWW9LS3V5ZVE5RjVodzhtc3pFSXFaSkt4?=
 =?utf-8?B?ejl1czJILzgvZ29WRlhwVkZPOEtiTVpQNmNGT21jMFRRUDVXaFo5RnIvZUt1?=
 =?utf-8?B?NElVY2UvbWl2YlBwVTBnNksvNEs1b2F3MDh1QnBybTNXdURtYldwdGxmVkJC?=
 =?utf-8?B?REFNeUZEbW9CMjNoZlI1ckxPSnJJS3FIQjBWa3JRRCtQLzNBaUR2cWxJQU8w?=
 =?utf-8?B?ZEZ6SnZPVUgraGZtemw0SklIV1NORjdFMVcwV1ptd3JhdUp0cnpMVEpTYWto?=
 =?utf-8?B?YUx2Q0NCVmg0bGJ4N0tJTy9nNWRqMlI2SCtIY21vOEtIejFyR3RURXBMWGhj?=
 =?utf-8?B?K20wY29pbFkya3d5NnU2NXhVaFVoays5Vml6a2NINjlrNytUU2tBK0ZiN2gr?=
 =?utf-8?B?b3RiQ3VCdjcrSStzc2pyTFdSaHpLRndjTUJ0TGN4N1krdEJsN0MvM3c1UUFP?=
 =?utf-8?B?eWZtRVNxTXJyb1pwNml1dlZiQW95RHRxckxPNlVPOVM4ZFRIZjNpQnU0WDdH?=
 =?utf-8?B?dHh4QlhxVUpYeFhiNkJRTVRLMElmNk5oRTFqaVRlYmFJckFJSzlKVElUQ3Q3?=
 =?utf-8?B?aDd0dlM2Yk1sQ3l1Y2x6N0NNWnFnV2hwaExvSGdoY2hyNk5JWWh3WGNmOVJE?=
 =?utf-8?B?ejFLNTYybG40d25tQXIvbmUyMTdZbm9XRkpQcXkvVFhmOW5JRVdkbXRCNW15?=
 =?utf-8?B?cDlhNnJOU2E0MTBHdURXdWJPd2pWQmxlcy9McGR2NEgyYThYSzZrck5ab3kr?=
 =?utf-8?B?YVVHSGh6cjhZTzVONTJvd2VEYTBTa3lKZVlxUWhIQ3lGODBNV0hkSVZnanp4?=
 =?utf-8?B?a3lNeFV3ZkwyQ0ZyUUxLTk9wV3gwL1g2L08vWTl1TFhJdys4dFQvbmsycFBp?=
 =?utf-8?B?VXlTa1o4T0oxVDFoTE42Y1BWU0g2clVEVXpyN09lVmpsTmZaSWhqZlp6QTBp?=
 =?utf-8?B?dHZGVHJjU0U5Q2ZsbHAxcnlHRFJYNkNxRWRpeTV5Mk5hUEs1YURUL2p5NnlV?=
 =?utf-8?B?SExJZ3h5ckNWRnZudnZuVlkzUUxTa3BjSUFJN29FYkZrMmlhM2llZWYveXVx?=
 =?utf-8?B?YWRxTnM5bXJUOWZ2SllOK1g0bld5blBoSWcwTDlkTllTRXh6eGJBakgvT2Nv?=
 =?utf-8?B?ZXBydUNPV0VSdFVPR0Y5ekJ4NTBPZ1g2emhIdnNRTFoxZjZPNlZaTjM4bTRs?=
 =?utf-8?B?bzFvSEFQV0RqLzRuZHlxdlpJaTNZK3dBbUZUbzlJeU4wMHowa1VYTUtSaERB?=
 =?utf-8?B?OHZCZ3lPNno2VDY5SlRqbE5SaGVzakc5eFA0dk5NSGE0NjZadmgrd0l3bURE?=
 =?utf-8?B?b2h6M2FOY3pwZk9PNm0rNkpIOU9VQjlsNVg2VlFvZHE4NlVVWmk3MXgzZzNw?=
 =?utf-8?B?RnVZaVJvdkFXclVZaGwzMllNRWgyNVVINk82YXdiWGRmcEl6OHVKejhpNWxk?=
 =?utf-8?B?R3dSaVVJbVRyZkhXdEhxdDBmTXBnZnF4NzQ1K0V0L0lXK0xJU1ViUndUZE8x?=
 =?utf-8?B?a3VzTmZreGZSUzdZVmZkRURlQ0JIUTJEWkRzVklCMDA0UUZmOTgzc3g2ZVJQ?=
 =?utf-8?B?LzFWUmhvQXlRRVB5MHl0dS9oTjNiOE5BVkxKdng4S0JXcEZ1WmxQMWpNOXF4?=
 =?utf-8?B?dzJrWktWZ0laS0JoUnFmR0JWSVZoenRMQW1saXdUWG9keGRvbzlTcEljNE9s?=
 =?utf-8?Q?/1LVbUIw8KQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlkxeVlJSkZna2J5ejJSeUIyTDdlaUprM0ZVd3NzbnlFbklUdnFsaHc3R3ZL?=
 =?utf-8?B?NTcxejVXTjNKM3ZGeE01Nm92TlNFTVRBRVFWbVBzWDBSS1VWVlI2ZkdQSWZG?=
 =?utf-8?B?b0dOb0JXUHdoNWU1d20wOTh0SDhGbXZwUWs2dmhKTW1VUjV2Yk5EMFBSZ2Vj?=
 =?utf-8?B?ZENVc3dvN1orY2o2MHFTWTlHYmNrSGR4aWN3YTBma0dqYVM3aGd6Qjdiakla?=
 =?utf-8?B?bUdUVFdaWTBkTkIwQytVZGgxVTFOUlN3ckFkMWNZNm1LdDVYUE8yZWdHTlpT?=
 =?utf-8?B?ZU5zbnVJTmwxVUhJNTdBbnd3b1hjR1FOMTBjcEZuN0crOVF0MEN6MzZEWkFh?=
 =?utf-8?B?aFB4WkJYQXJNZDhSNS9FU0VoVU1ucXZrUXRycm1vRHFjeG5YamRHTTdNWUdQ?=
 =?utf-8?B?L1pwT0RLaFBPSE1DTm5mV2dwU2EyenNNUUcxeVU4THVLdnlTazdVV1R0TjJt?=
 =?utf-8?B?N2lrdXdXdFB6WWtRZDJXaUYrUXM1RzJUZURZRDFGTEFWMlQzZEV2VE00QjE1?=
 =?utf-8?B?YmJYaGJmUGFITUk0UnhmZmF0MDJHYW1xN1UwQXVmWnhGWkhIQW9pd0NrMjNm?=
 =?utf-8?B?VzJHUUVlTHp5eThodjJoN2UyeUhXZmtPd01RdTloMW5BVFh5TFAzQXhtQkMv?=
 =?utf-8?B?bzIwR0hhOTZxS2trRGkyTmtsRkVFQWFDWTFhSGd4Y3FDcUNVelNzMy9xR3BT?=
 =?utf-8?B?NFVmSmF3T0NHTS9Wa3FEUnlDS1JjRmF3VEt1WVFxSlJLeUFoQjBoWDNqSXZH?=
 =?utf-8?B?ejEwYnhydkhtOXowelIxbjROQjJ3RmhwZ2tNRVNzMC9pbEN3bk00dlhoU0hB?=
 =?utf-8?B?K2JzSGNhUFJFOWw0TmVIenpzem5Cc0FKd0gwbDNROWRqd0FLdFdHMWxzZ2xM?=
 =?utf-8?B?RUpBS0gyTHhQY1pETmpwU0RSMzFINk1XcmlqL2N2aCtZU0ZaYVF6bVFTOHMr?=
 =?utf-8?B?ZGZZN21CYnFOWGxzdXcxSHdwSnllUkxXeXd0WjZjVXJpajZjWUxuUGpLTERi?=
 =?utf-8?B?ZzZKYWdyV08rVFJ6UkI1dTB6R2pNcFZMLy8xMUlWd0JWdjRQSHczNUJKRlNW?=
 =?utf-8?B?WWE1eEtFeTF4Wi84cUFycFlaSkFZcG45cnZPd3psSEhNaU9HVUVlSW5FZHcz?=
 =?utf-8?B?cDY3clFTbkE1eGZNYW5HQlFueC9JcXlBQTlIdGhCN2FtYUJiamRpTFExK3Ez?=
 =?utf-8?B?T2tYTXJob0F1dTJKT3MwdHBCUndRdFREc1Jwck0zSmF1TlArcU1mM1ovb2N2?=
 =?utf-8?B?NWI3UGxXZmVQNEI1M09OSGZ3N2RPNEFkSkZoZDdlaFpmMGdGdEpGTitPQTNT?=
 =?utf-8?B?bjIzSDdGRU1IbERlbnkyY0QxVk5uVjhhV0ZETHNVVjI4VmpXQlgzaWtOc1F4?=
 =?utf-8?B?SllOZ2lsUTJQZGhVYTY3UEVnOW14TGxhclI4N3hrTXhzajUzMjhtZEhMNU5p?=
 =?utf-8?B?MTFvWnFML0owdjAyNnVSR2pGNUpWZmNnNjRFMjJ6ZW5wT29aMXlxbFE1V3Mr?=
 =?utf-8?B?bW1QUVRlNy9TSDJIMlZJQUJBaSthWWRRMHNzM2hRd29LR0FFVHRmd0x3TjFO?=
 =?utf-8?B?ME1vSlVZdjVVU05CQzlyRjlZYWhtaG9EdW5Xc0pZejdpeVF0MStQRGRXamVJ?=
 =?utf-8?B?ZkQ5YmI3VEpPbXcrTlNRVkJSQUJWTnJsTk5oQTlYSGhrWnlsK003YTIrL3ZV?=
 =?utf-8?B?dEp2dHlaQmQyMGIrRTNGMU1hMksxMXg0YnpRQ1FMUGQxU21aVFJRbTIydkpH?=
 =?utf-8?B?ZUdrN3dsRVdUYmNyc0czNVc1c2tMMmtvZWJ3aFA0Y28wa2ZGcmtUa1FCWWRy?=
 =?utf-8?B?NkE1NmdzTE1xcUpYQ0dxN3NmWnNaU2lBaWJiVEVlQm4xbFJiVDVNOHNFM2Y2?=
 =?utf-8?B?UFE1QXZyMC9FWm15WHRYZk9UVzhxaTVhOTk2a0ltVFpMbUdWQVQ5b2lxNjM2?=
 =?utf-8?B?WGF5d3YzajZUQXQ2VkllZ3B3dUt4VHFqek10L2wyNXFMeUg2WnNPNktFUzlZ?=
 =?utf-8?B?UUx5SVR2bTYwQkFTZ3dHYTRXVnFoSGhJWERsc21ZUDZZOFp5dm1xbFp5UExW?=
 =?utf-8?B?VXNwK29PVm5ieWpLa1g5NC80eGZDZGRZamtETkR4ZUZHYWIrMFZMUTYrTFhM?=
 =?utf-8?Q?qMUlYT1gDZg8Y+lp+UZLJK3S2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 144254fa-67b1-49b5-c7da-08dd5d430734
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 06:41:02.4486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40ABHjzvq5szHhIxOQ0Grm4sS2Ch/s5QhSB5cfj5z7l4eZBpdpLi772EPhLWa/MHYDg6UTRhWZ87h7MzOKso4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9769
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

On 03/07/2025, Luca Ceresoli wrote:
> 'ret' can only be 0 at this point, being preceded by a 'if (ret) return
> ret;'. So return 0 for clarity.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> index 7bce2305d676714cdec7ce085cb53b25ce42f8e7..bee1c6002d5f84dc33b6d5dc123726703baa427e 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> @@ -665,7 +665,7 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
>  
>  	ldb_add_bridge_helper(ldb, &imx8qxp_ldb_bridge_funcs);
>  
> -	return ret;
> +	return 0;

I guess this is not the only place across the kernel tree where this cleanup
could be done.  So, maybe use some tools to cleanup them all?

>  }
>  
>  static void imx8qxp_ldb_remove(struct platform_device *pdev)
> 

-- 
Regards,
Liu Ying
