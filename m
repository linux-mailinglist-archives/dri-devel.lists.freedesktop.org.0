Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ABBBE1BA8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED97710E936;
	Thu, 16 Oct 2025 06:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="cqLKYus3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013054.outbound.protection.outlook.com [52.101.72.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187A510E936
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:32:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOIKU7Yi7jsanm1da70+P+VVud9AGrSrRfdsBVYo9nE5nNkSKHLextB4ng8gwKV19++QSo/NwuzQ495JYg9+qewX8vBMq97WZ5Y01mSm9hVpjLiiMcY31FJXxzFpzU/4h6kGcww6QUBAW0Cll7fMglPi2fnXIi3rRHRmTHg7+cMOsj1qbcJfJOFtYCtfozSFPO9TVjBw5aDBGXx0dREn66ypGWPhUsh6oSo76FilLPZ8TCZO5A6ojn4J/Cs7iol+T6HE47EOJR932CwQ1oXTmafN403+CphKzDDu/LbmnCDwUjPnE9hcv4tHkiKSqq/CdzurNWwYkMHfvYs0cLWx2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGBvEcezql+I3GV8PQ9NSU3eDUYMLQg5Ny6ZulACXGk=;
 b=p6pN75bGR8x6Ar/ou0zxxA/HQKJKhaD166PJF3SaItmf+oIzKSXYPeXFR8gJuIcM2heFuV1N9fY1k9VfTskAvfAyMMzYznvuL0zhVrt8okZKMQHJVuoxgkmUFwusNiuslTuponq4E20jPTTyFeU8pVk843H9gkNEK5TgRZ3eYjVE4U3Tl0pIDInI7YZAUGH3CH3LIvYENd+vsP/UgiSGq7JEseTMNalJ+vcMm6s4cGy6lyOQ9g8bdEA2S5UvsELRfwNH6pLlmhGzgWn2OhGqIIacNW87MV2uRykbbl/NKV1/4ZZquCHibdZtvS+7g0J2INux2Ka0+Q45nTaVjmdnIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGBvEcezql+I3GV8PQ9NSU3eDUYMLQg5Ny6ZulACXGk=;
 b=cqLKYus3pwttp7E8k7NMEhm1nTbuvOVm1Td1stbB5yenykbOSkar0aemBTu7LKOV7qi6e74bh9JLfwmMvDJoeXUC/mqiN01HYkma3U6MTx22K6cdrSa2SYL4pWhowkGqoAqFcIkPPZeLR+EKbNASKFk1hZ8a9JPlby6hjBYJgDQUF76ifckCUeXqvS386LDVl6HtDB4TbCTZHh32JJDf/JZlSoJ1xB9HW4eeue3IQ2vzxeZ7DXTQYJaSm7eFdve6j5vdLrzxnoAEA7EI6i8tAESuwdW5QK3XXaec93dqYbHBg0j0AHqhYt7IUH9GdR+2dF68HfqLyyZ3usbw+a/kcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9964.eurprd04.prod.outlook.com (2603:10a6:10:4c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 06:32:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 06:32:23 +0000
From: Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v4 00/14] drm/imx: dc: Use prefetch engine
Date: Thu, 16 Oct 2025 14:32:18 +0800
Message-Id: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHKR8GgC/23Oyw6CMBAF0F8hXVszfdK68j+MC5wW6YJHgDQYw
 r9bSAwaWd6ZnDszk8H3wQ/kks2k9zEMoW1SkKeMYFU0T0+DS5lw4ApyEDTUk6EOadf70o9YUeD
 GC9DKMtQksXURpq3ydk+5CsPY9q/tQmTr9FMm/8sio0BzIxFE6bRU5bWZujO2NVmrIt+55Qe/R
 J64cto6tAWah/rl4pvbAy4SR2AONJjCOb7zZVne6Vtj/SwBAAA=
X-Change-ID: 20250703-imx8-dc-prefetch-028e306591c6
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
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9964:EE_
X-MS-Office365-Filtering-Correlation-Id: 621431e1-f532-45bd-4ef5-08de0c7dc408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlVMc3J6OUx4VFVlYTJVU213ajZJSHZBWmtvS1NSV2RQSkt1WmdFMG1nN295?=
 =?utf-8?B?K0dwRG1OZDZKWVRRRksrNWRtaEx2QkZoYkN4UFk4QXN0Vm9xMjlqZnlxUFV6?=
 =?utf-8?B?RzdLZEtwUjg3U3orZWQ2WVduam5XUTRIcnVrYWJSU2xkdEFLRUZRZGxHaHZL?=
 =?utf-8?B?S1ZaZWVIRFBpbzVxMlYrdWRBbFJMUjIva3JEcU1WdDRVaWdtZ2xBbGNhS0ZX?=
 =?utf-8?B?bHZwYThIWU82MGFhL1JsbTZKTXB0Q213Szd3MkUxTG1jMEUrd1pFWFM2dGJY?=
 =?utf-8?B?SndOM094cGNCQUkvZUZYUWpNb0ZmMndzNWpRejc3L3JnYVNpZzl6ZVlnckJr?=
 =?utf-8?B?clRUN2lXTWZudlRsUkpSRk1ON1NDNm1RZlMrenU3R0hJNzVLR2tHQjUvK0RT?=
 =?utf-8?B?MzgyN3BFMTJPS05WaVNhZ28zdG9vTncvdUthNVpLYUZxcWp3MXQrRVl6djE2?=
 =?utf-8?B?TGpvVFFPOHVhdXNhZlhHRlpneGlXMVAvMXF4THc2WHFxNkUrbGZobjQ5V2xR?=
 =?utf-8?B?VUVrVG9qNXQ4c1lYVWJVWGdSTW1PWFhPRm1zUkNhQVN1cjNBZ0lLTERyQmN6?=
 =?utf-8?B?RS82RkIxanl3SEU5QS9SemREZVpqK0l6Q0ppREhqRVJUbXFWbnNjRmpFNFdl?=
 =?utf-8?B?UUdYZFlYRWxHRllGT3ZPMzBGMlZUWTV2NEdkbjJ6OFRQQnB6eXlRTE5WdENo?=
 =?utf-8?B?TVBxTmUwTlFqRzJHS2xTdEVld2Nic2o5ZmxETXBEWkcxL3dWZnRjUmxBZVlB?=
 =?utf-8?B?VEZFNEx2N1VrWEJtWnJMWC92U3hDRzRxUVRzYm5LVmZNa3gyQURnbDlob0VL?=
 =?utf-8?B?dHNWVnNrbDBVTEhXRVpzZlJDOUY0MzJ0eUwrK1F0S0Q1UWhna3g3VERnN1JK?=
 =?utf-8?B?UVk3akRlYk5TOGo0SXhOMkpyNzFSamMzQWErTElrcUYvUlFTNDRpUnY5Y1l0?=
 =?utf-8?B?ZmVMa0EzS0ppbG9oUExJNFVMRmN2OE84dXB0OXVmTTBmaU0zWWpZOG5VRVZy?=
 =?utf-8?B?RjRhOUQ4V3NqUDVuS3FxZ0UrSUxhWjAwRU56cG9MOHBQUGtPMkNLR0NZZHdM?=
 =?utf-8?B?c3RxSnFKZzhKL3BYQmFGZU5pL1RjWDJ1Yy9OUmE4WDJYRTZ4TnlYN3U0OVRY?=
 =?utf-8?B?cVBJc1M3c1Q2SG5VNDNLZ0FzcWpQZVFYZHVHaVRJLzU1Y1VNbXBoYjVhcktC?=
 =?utf-8?B?bU1wU21rUy8yN21Ca1M5cFNJQ3QvQVgra1NUa3NJU2dtQ2FrbkZhb1pSWWY2?=
 =?utf-8?B?UGlPRFVEVkluTzlsanRlNGsvMHUwVXpKY2hOazBkbDJ1WGxaclZ1L1h1eWRU?=
 =?utf-8?B?c2pjcG45VTJtRzZTeEZrZFpNTnhQQU4zY1U5eDRnK3grSFBVdTRDeUtQamtw?=
 =?utf-8?B?T05JdGpwN2Nwc08yTkg2bHludWtyaXR2QWozdno4ZGR5alBlaTlLWkR5U3px?=
 =?utf-8?B?QU5NUTUxTHY3VE51SEdPeDUxK3Y4OHhpVGJHWFZlY0FsZjRNZzA1eGZzbGtV?=
 =?utf-8?B?eXMyb3FFbkJwK2hEODM4TmV2K0grZnBPOFVPdWY3N3ppd3RHTHdmWkRKUzkr?=
 =?utf-8?B?ckZtN3JybTVrS21CS0JEN05LZkhqWGZVSnQ2aWM1K0xEeTBOWC9kczI0VUhx?=
 =?utf-8?B?eG9BOVU5Z1huWTV0bkttZTBXbzBjbHFwTVAzaGlFOEU5K2hjYjlOMW5QTkx4?=
 =?utf-8?B?OStWeTZFQk93R2ttdmluTVBaaVc5Z0ZrbDJFSEdNdDJaZUNsemMveFZGczA2?=
 =?utf-8?B?YkZVRVRHTDdEZUdneDNBb09OWnppZGQyd2lMTnpxN0ZCREpQSlNWNXUwL3I2?=
 =?utf-8?B?bUJGMGpLQW00UFROK3NYSFViRlcxY2tRUHdxVnJPYnlLQUpLcVk4SVZ2d1NO?=
 =?utf-8?B?b0xXQjRWUmlTUmUyWFQ5dVBmOHJ3c3RkZlhiNC9lcnpYbU9xWEFuV1locWRh?=
 =?utf-8?B?S084elptdmVPTlhhQ0k2Um1KYmxLaUw2TXFjdERaam52a1ZIRjhUdlFkVW1C?=
 =?utf-8?B?eVcwMEVYZnNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm9uMVVBNk5DZXF5ZFUwVDRpeDByTXBBMmNTd01iUUQ1YUV1ZzRxdjd4U1do?=
 =?utf-8?B?TXBPOVlWSEhQZ05sV3hsVzAzVFc0YlpvV09DQUF4RWtXSkxtTi90eStsTzNy?=
 =?utf-8?B?bTdWMi82OWUxRndheHJMVWsyWHJTN2Q4bGlDZndWOUpTQWVGVThGY2Vidzg0?=
 =?utf-8?B?NitERGhheHRLUnBRYVQrUEwvWllVZmNxaTFJL0taQzBnNnBFVEljZmJsSUdX?=
 =?utf-8?B?RkxXYnB2bW5uR05PMTVQY0FwSnl1OTg0a0VSU2lHaDNxeWZaUGhhYVNVUlNw?=
 =?utf-8?B?MEUxL0cxSXo4MlNSRHlZMHZmdGhLNmZkQ0twWVA3MW93Rmc3SHBNNVhlSThN?=
 =?utf-8?B?R0dpenIzRERsZTU5ZGNydkE5Z3plaVVKYlJwYkJpZzJMaGdBS3luOXZ6VTZk?=
 =?utf-8?B?anFYRnB3R09ZeDJmY3NvUUorMlhsVU53Uis0bTJCQU9IeWkwa2xVS3MzWFpp?=
 =?utf-8?B?SnlIYjNZM2Vmc3FQb2xZdDM5OTNyVkl6WVFGSGExVHNTa2g2OHFtV0w4aDFX?=
 =?utf-8?B?a3ZVNzZFcEVxTEo4M242SUI1ZERhUW1CUTdVMmZJTGdDVlVDY2hNUHdVblVU?=
 =?utf-8?B?R0pISGtkYnlDUXZMZk81eWlUNk56SXIyUFJEdHI0VEUxL1I4aEhkSUtBZkJF?=
 =?utf-8?B?L0M0RHVFUVE0RzR4QzVUamIwK1pIWm0ydkdYdG1iNVc5T0tnNE9Ec1Bpdzdu?=
 =?utf-8?B?dDFXWjJzUk5JRzI1bFFLaFg4NFY3N0FyNjU5eWFBaWtlRThITFl5SHprUzlR?=
 =?utf-8?B?YzlpWUxRSTNmSmtjWGtEb0Q3THJYWHlyaWNyd1NRMW95SnhJbnVxZ0xvdXJZ?=
 =?utf-8?B?M1VuSjg1Y3RZa3BRWk10eWNORU9OeGJHbmdSSTJObFI3Y2ZMamROc1paSE1Z?=
 =?utf-8?B?R0plYllhaVNWWFl2d0o2M214aTZQblVyQU4yOUlzVlhQK2x2Mmw2RUpxL3oz?=
 =?utf-8?B?WW9FSHlxTXlSWUY3d09abFkvbjNQT05HdEdYR3U1czM1cWxEMGgwLzZHcUVm?=
 =?utf-8?B?ckN5a0xPbldCMTdKemxPYUF1Mng5VWhhWmYzTVhtUEZFSmtkVlVUMnlNQzRE?=
 =?utf-8?B?aE4rUFlnNG52cGpRMG9UVVpoNkRZbHRVRWl0Y3NKYXJLRVI4M3JQemkvUEI0?=
 =?utf-8?B?ampCZ2xXSGFqRG5VeU5RM0xDYmhhcDhyNU0vdHZDQTdTSHVFYmROWXRPckZW?=
 =?utf-8?B?SFVjSDhybEo2QWk5dW5Sa05yaStDc054aXNOUEZTWjUzNFJoVjFSb2NuU01X?=
 =?utf-8?B?eGovSFBBNmI3NXc1TjZPKzVyNk1vZXNCTUllRlp4aG5xZXF1TXk2NlVsZWV4?=
 =?utf-8?B?YlVUamFnbitKa3BxL3J6aDBpeWhTaks5b2pmcmc2VURiLzlSTFdUWlBtSmht?=
 =?utf-8?B?WWFXa2ZJSHNkc1BBMmw2R2JaRXZFZGJlK0krc1FsQThVaXZqNzg2VkYyVEw4?=
 =?utf-8?B?b0h2aXg3RTZjakUrSERRRkxZODdKb1duWkdqTHhpd01oQmh1ZUlEZ0NaR1ho?=
 =?utf-8?B?QmF5Mk1nNUE0ZWR6Y0FCTFN0WVJaeXV1RHQwMlNFdDNWY01neFlpV2N2Mndp?=
 =?utf-8?B?KzFLM1k0aDRjYlFHOUZsNWVNY292VVBiY0t6eXdVL0VPV3RocXFQK0ZEcFJv?=
 =?utf-8?B?aVc2L2Z4TlpybWF2ZndXTEFiN05DUmJvdnVrT0cwRGVqbFR0U0wrWlprNGJl?=
 =?utf-8?B?V3d0M2dHcUZPZzZ4T3J6R0dwL0NXVTV4NUdwQ25IR1hETkRZM29LOWk1enVS?=
 =?utf-8?B?dVZ1Sml2bmMxVWRzMzJ2b0FGVjdLNmEvd1h5eEhwajBhVUZCSWpGdzdHbUFj?=
 =?utf-8?B?UzlERlczV1FpckJ1ZmFKY3RMWnlVZ2VQRlFoTUloUE1xRWprazVSWW4vcmtz?=
 =?utf-8?B?R01NNU1pTHlJQkExclpyc3lVbFlvN2p6NVBSTm40cklNckdsRzRWK0Q1RzJn?=
 =?utf-8?B?VXJnbmZXRGlBRHpxUTZ6VTAxTERSZDA0T0RIeG9RZ25Eay9XbUlhZ1paQXZo?=
 =?utf-8?B?dzhwR2tOMGhhcEhGcEd2S0Rha0dFbEFUM0svbUcxWWJteDBzb2RZenBBekhF?=
 =?utf-8?B?SFhhQ0w5RjdZTE02Z2tkMlZPeXMxUkRoOGxVNmV3cUJNMmZtUGg3T0o2b2dK?=
 =?utf-8?Q?Fe5lBhFrwU1tCtgv2eysk9VSR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 621431e1-f532-45bd-4ef5-08de0c7dc408
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:32:23.8501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2yPx7F4fMzajPQuWNQZ5V1o5Yvbpc8cEFuyZ4cnTq1oK9ApL0mGDPPBwUnobFcydKPp/PWT+M8y4kE8h6kmJw==
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

Hi,

This patch series aims to use prefetch engine in imx8-dc KMS driver.

One prefetch engine consists of one DPR Channel(DPRC) and one or two
Display Prefetch Resolve Gaskets(PRGs).  It prefetches data from
DDR, resolves data in tile formats if needed and outputs the result
data to FetchUnit(s).  When one PRG is used, a prefetch engine supports
processing pixel formats with one planar, e.g., RGB formats.  When two
are used, pixel formats with two planars are supported, e.g., NV12.

For now, this patch series only supports prefetch engines with one PRG
because it is enough for XRGB8888 which is the only pixel format
supported by imx8-dc plane driver.  Two PRGs would be supported by
future patches.

Patch 1 and 2 add dt-bindings for DPRC and PRG.  They were reviewed
by Rob[1][2].  I slightly modified the patches' commit message to use
imperative mood.

Patch 3 adds DPRC and PRG dt-binding files to MAINTAINERS.

Patch 4 fixes FetchUnit dimensions as related to prefetch engine function.

Patch 5 disables CRTC at boot if needed to support prefetch engine better.

Patch 6 and 7 add PRG and DPRC drivers.

Patch 8 to 13 do preparations before using prefetch engine in imx8-dc KMS
driver.

Patch 14 uses prefetch engine in imx8-dc KMS driver.

[1] https://lore.kernel.org/lkml/20201207165945.GA430214@robh.at.kernel.org/
[2] https://lore.kernel.org/lkml/20201207170206.GA434964@robh.at.kernel.org/

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Changes in v4:
- Rebase onto the latest drm-misc-next and resolve conflicts in patch 4&10.
- Sort bits and bitfields in descending order for register PRG_CTRL in patch 6.
- Cc Marek as stakeholder of the driver due to recent i.MX95 DC patches posted.
- Link to v3: https://lore.kernel.org/r/20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com

Changes in v3:
- Call dc_dprc_enable() only when start == true in patch 7.  (Frank)
- Collect Frank's R-b tags.
- Link to v2: https://lore.kernel.org/r/20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com

Changes in v2:
- Rebase the patch series onto next-20250922.
- Collect Alexander's and Frank's R-b tags.
- Manage PRG's and DPRC's clocks with bulk interfaces in patch 6&7.  (Frank)
- Sort variables in probe function in reverse Christmas tree fashion in patch 7.  (Frank)
- Link to v1: https://lore.kernel.org/r/20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com

---
Liu Ying (14):
      dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
      dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel binding
      MAINTAINERS: Add i.MX8qxp prefetch engine DT binding files
      drm/imx: dc-fu: Fix dimensions
      drm/imx: dc-crtc: Disable at boot
      drm/imx: dc: Add PRG support
      drm/imx: dc: Add DPR channel support
      drm/imx: dc: Use TCON operation mode
      drm/imx: dc-ed: Support getting source selection
      drm/imx: dc-lb: Support getting secondary input selection
      drm/imx: dc-ed: Drop initial source selection
      drm/imx: dc-lb: Drop initial primary and secondary input selections
      drm/imx: dc-fu: Get DPR channel
      drm/imx: dc: Use prefetch engine

 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 100 +++++
 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      |  60 +++
 MAINTAINERS                                        |   2 +
 drivers/gpu/drm/imx/dc/Kconfig                     |   1 +
 drivers/gpu/drm/imx/dc/Makefile                    |   6 +-
 drivers/gpu/drm/imx/dc/dc-crtc.c                   | 191 ++++++++-
 drivers/gpu/drm/imx/dc/dc-de.h                     |   2 +
 drivers/gpu/drm/imx/dc/dc-dprc.c                   | 466 +++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-dprc.h                   |  35 ++
 drivers/gpu/drm/imx/dc/dc-drv.c                    |   7 +
 drivers/gpu/drm/imx/dc/dc-drv.h                    |   5 +
 drivers/gpu/drm/imx/dc/dc-ed.c                     |  27 +-
 drivers/gpu/drm/imx/dc/dc-fl.c                     |   7 +-
 drivers/gpu/drm/imx/dc/dc-fu.c                     |  49 ++-
 drivers/gpu/drm/imx/dc/dc-fu.h                     |  11 +-
 drivers/gpu/drm/imx/dc/dc-fw.c                     |   7 +-
 drivers/gpu/drm/imx/dc/dc-kms.h                    |   7 +
 drivers/gpu/drm/imx/dc/dc-lb.c                     |  23 +-
 drivers/gpu/drm/imx/dc/dc-pe.h                     |   2 +
 drivers/gpu/drm/imx/dc/dc-plane.c                  |  46 +-
 drivers/gpu/drm/imx/dc/dc-prg.c                    | 320 ++++++++++++++
 drivers/gpu/drm/imx/dc/dc-prg.h                    |  39 ++
 drivers/gpu/drm/imx/dc/dc-tc.c                     | 114 ++++-
 23 files changed, 1497 insertions(+), 30 deletions(-)
---
base-commit: 6674f54b21a6b20f8157426bd0ace3e249b3e4ba
change-id: 20250703-imx8-dc-prefetch-028e306591c6

Best regards,
-- 
Liu Ying <victor.liu@nxp.com>

