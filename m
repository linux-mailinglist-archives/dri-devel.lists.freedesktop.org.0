Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963FCBE1BCC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF4E10E95B;
	Thu, 16 Oct 2025 06:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FzPQ+LQu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011055.outbound.protection.outlook.com [52.101.65.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886F810E957
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:33:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3by342F7Q2x3EdH7PTmATxI40YobOzo9klNczqPQozGi2B/vUoV0U92a2bWmPlY6kD7mMvtw7DplpIZpDZsHJLjM53oH168mQBRcnKxXIZRUNNvE7lx5Elyp2ky+Rdu8yYhRamH1vcwwjsyaNIn8grSaWVHwNaj917SJTN2m0ej2RqAo1OW9O5CxxU8v4dbDORFNR4FlC/OHKbidd5dsCMsTlmk0c6h8hETyRGH7ovaOTyXIH/J3w141GX69QHpojSLn4Gam3Dedahejx5w+iqJwZiXEW7UK3zUhMrAGNooe8aTQ8CA8Z2+6EKxLGOtlABARTuZDS6jhR7Otgw8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsrigFOoVP039rn2Z7hnXpFlJwbipkD2jFQU9mOx2eY=;
 b=tR0gY3+JDtgI3pgFIjNenHEl/Q4yMPyXdyQyjXBJRuLKeT5CRww9yTNeNbW8eD6lsPxFTHWURuU3STRwR+cCQNNTgbfxsWigedZENiBcoTegZh2iedNhwCgEquyTjcz+WYqIyEY74YKgsJ8KWr0xkYZ7VvV6EGlKzTDOuM892RKNsXKOpfRV5GnfJnZbfyqn+NdPRi3cC3rrJclXuvNzgtzzQKwWXA0xGCjM2+o+A2AI6KxQYgJVOWynuLsgUZLy+BNS6steknN1iPIJRjLqNgKTO9h2fmkjzXEtSoNO/5CHejkk4MwrfvXWMqQ2nF9kT/MdybAgRB1asPhs1pptyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsrigFOoVP039rn2Z7hnXpFlJwbipkD2jFQU9mOx2eY=;
 b=FzPQ+LQuPzFUdcLPP0X05acKaNwZC4OWwMcXJqIfRHdpaZKtKZoMW58s/dQV+WAcC7m1/HyK2DiCwtcQK8m1k4GZafLZ5vZXfFB24U0bH+dhwh+5ctNbyP5CFtTcSLjhO6CWCO9hRHXwvL5/YRnTIUXfufNjiMGEtC9SgtdO61w/ByAgxvvN/lZLgrc9RpeBOdg9zoiChkYLK/2s+KZdP8EhksgmbTnnFTXSfsJAZlK+bcMdESMaEeQiIRk+o4onvYtaOiN0ah/qqXooV03Wmfy/+IbYLwC3GGqUbsH+IbMtKMo1CkDIiLVVzQnv+Zaoct9Nl/dEAw9ACfeMNGSShw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9964.eurprd04.prod.outlook.com (2603:10a6:10:4c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 06:33:17 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 06:33:17 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Thu, 16 Oct 2025 14:32:26 +0800
Subject: [PATCH v4 08/14] drm/imx: dc: Use TCON operation mode
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-imx8-dc-prefetch-v4-8-dfda347cb3c5@nxp.com>
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
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9964:EE_
X-MS-Office365-Filtering-Correlation-Id: b15b895b-f569-45e7-71a1-08de0c7de3df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFIxKys1eDJvMUVFMHZ3U0NiQzRJVFEwdHNTMis2N1NIWC82c1l4c09JckEy?=
 =?utf-8?B?SFNSbjZOUURqd2xuRHFGM2dadjNwZUMxSGVNbzNPOUx1aFNUTDRZUWZvY3hX?=
 =?utf-8?B?Wjh2WUlpMXpOVjFyVzhTWGJsU1JybjFXZFo0b1kzWkdoOVdLL3JMZEdjRHVt?=
 =?utf-8?B?RnVNRG5qV2t5Z2tZTFQ2dVRXdldqUzJFNmdPNDVEbmdhbXkwVWxHTW1pSDNP?=
 =?utf-8?B?NUppeGNtemJOdDEyYlFBSUFvVUR3WUwxMGtYZkd6eW5jMTFCNEV3bzR2NEc1?=
 =?utf-8?B?M2VKYWpNbld2bVhpQTY5a3V2eURRMCtYQzVwSVUwUE9tajJpaUFucW00MVRS?=
 =?utf-8?B?MlkyZHFxK0dzN09TN0ZmZzJxZXNPb3VsMy92bzVVbGhVSURjeWVUak9lVHht?=
 =?utf-8?B?VEx1dE5lNXFoSVI1M3FjYXNXbzJjZU5leEZnSlNCZEtVeC9DaW9ZbERmSDdE?=
 =?utf-8?B?ZUtjc2hYQlk1M2JVNjFxNW1HMGk5b1hTSGQzZEc1clNMVkQyV2hJN0pKeVNa?=
 =?utf-8?B?NVRRNEhaMUVtRUY4VVg2ajVrS2s5bGU0SnlUeUpVT3RxSHhqNWQ3WWpYWThP?=
 =?utf-8?B?MGdxYmI1YWppQWRMVEloQ1IyREVSOUJsaFEzZWpuYldleVRYdjFTK01zaXJr?=
 =?utf-8?B?cmxrNHhwZ1pKd2VTUkJWZ2xIUDN2VmlCQnZqaXJGOWx5SW5ualUwZ20vRTQ2?=
 =?utf-8?B?aGFDOTd0MFVrVk5tM29Pc2JGdXpJeEtuYkp5bGRlclJBMmJGcGxBb3NDR3FR?=
 =?utf-8?B?NW1sSmJmcElHYTAzeDBlM0tCaW10RDZsM2pXblNNVHJNVllyQ0l5emk0M0hV?=
 =?utf-8?B?d3pyMVlRT09HUGNaSC9OdDJyQlVHcExSUk9XNk1SV1lxLzJsZTdZK0w0VzN5?=
 =?utf-8?B?R01FR2g5UlY3cHNQa0tOL3hDOHdabXZ2NkFNQ2ZYSEVSMGdOZHZwaDUwQWxJ?=
 =?utf-8?B?UGlhZVNPRnJrNlFGc2hhM3BEcEJHTXlScFlDcWljMnlYQmJpY2dyTzI2Z0Ja?=
 =?utf-8?B?c0x0OE94cGh4WnM5SDBFQ3ZmYUNzSCt4YkFQUTFIRWU3azRIWGE0TDdUSGNW?=
 =?utf-8?B?cktFSDVjZWJTSzZ3dUdWNE01cjZSSGhva0dZNWMxaXhXdFJSdWtIRGFOaGFP?=
 =?utf-8?B?b1dyRmpMWDF2TVBHdkh0VU8rWDl0cWZ2VFJPTktkUXpTL1poMmNmVlRkY1or?=
 =?utf-8?B?Q3ZZZ2dwZGZDZ3Q3a2pMeENYajVIR1hzOURYeU1GcDlRMkhLa2o1Q0x3T2Fq?=
 =?utf-8?B?VkpFREtsRVdOUWltSGk4TWFQK1grWk1NU040YjlVWHIzeDlxbSt0NE0vSEEz?=
 =?utf-8?B?MmhIOURseDN5QU9wa1Z0bUY1VmUyOU04UjJBRVBWRlFTTzNzbE1Oamg3bUxW?=
 =?utf-8?B?R0ZKbVNHd0xsdGpZaDJBK2hoQUZvUzJmNmxmby9TSnRzQWZvdE8yTmdrUU0w?=
 =?utf-8?B?dVpXa2cwUVk2TVFXZDhzN1hHQ3VUYnVUR1Y3UjRrNGxjQm15ekNNTTlqZXNi?=
 =?utf-8?B?NWVTbWZFQzNKbzdJck9lUTdqMjBqR21UZWRRMzExRmN3Rk5mNXFFMWM2OTc5?=
 =?utf-8?B?RVBEaTBHeGJaQVNYR0s2eVN2cTJvM2xNL0o3VENnRncyVWJ2YzgyMlZBaU9n?=
 =?utf-8?B?citjbkxhazZRNDBOTklaelNlQnJ5WFZzYWtxOHpPZzlNa0FkK2hmSU1DMW9m?=
 =?utf-8?B?ekllRGNuR2U2TFd0dWpES0s1bzAvTVk5UTVJSDJzUTdCSnpYSmUrYUhBa3Jr?=
 =?utf-8?B?dVpmV3k4STFDRnUxejZwQjFsNFpEUUhqQkhuYXdCQzhRUWhjUjFjeU53Yy9y?=
 =?utf-8?B?S2d1RkJ5ZVZZV3Q0eVczdVo4WCtvUC8yS3ZhQmlES2cxWlFRTmFmbUUydWhQ?=
 =?utf-8?B?d09GR3I4UTlLMnh4Si9HQ1czK1RXQ0M3aERtY1p6aGRGS05zTEc2TlB1WUdy?=
 =?utf-8?B?VTQydWVOUDBYV2t5RXI2cXpPN3IxUUJ2SitnL2EvbDlQdW1Uc3VkNllqQWxX?=
 =?utf-8?B?MG9LbVB3NUV5NWo2ZGt1MDBsTVg2dTFuKzIrQ3ZpbDdKN2dlTTZQVC9DQUMv?=
 =?utf-8?B?VVMrTlpXRjFqUnViaGN3OGF5RFJQTkRJMVVRZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWFMMXgxMlBleEpOQzR1QUlFUk1VV1BjV1RCT2ZhY2RzL0JCZVRQemREWDk0?=
 =?utf-8?B?ZnRla01ZZy9Fdy93T042QXUwcEZPd3hUd0RaQmVXbThkUjl1cStvUTFGbHU3?=
 =?utf-8?B?SFNSc2wveUc0bmhUT29NWU4rMUxxQjVrZnpva2ZTYXRkUGg2OVRHa29wMHE4?=
 =?utf-8?B?YjJveGhNWG5YR1hzcnY3VHpnbUFpbGxjbitadlg3TE5yRjZXUmpvVFNDZCtu?=
 =?utf-8?B?eVdDSGMzZUF2L0ZQOHdmVzVXc1l3YVV1K3p6NFBja2FCRUZEVDRuekVhQTZa?=
 =?utf-8?B?cUxPUVdpWjUyMlgwTU9vSHRTL1dEaDNlZllHVUkrUmNHYlhtQXlEb3RySEVD?=
 =?utf-8?B?bmYxWHNiUDRPVzFBeVRyRmJaTWdEbHVnZklHbkQzTkRJLzlSWDhkQnBBVVBM?=
 =?utf-8?B?S210YTJVRjNBMTRDMFBiTU9sUzRwM0JJL3VHT2dsVll1anE2aUs1WjRQWGlK?=
 =?utf-8?B?RTlVbHpsOUJ6a2tKaW5jeEo4NzFUUTdPVzJDRU5VL3FKbTZ4K2tFMkM3ZCtY?=
 =?utf-8?B?OTNNWU1PcDBxWW5EYklBZ3BqaVJxR2loTklpOFJkc1dxWlkyUDd0T1BHQTh4?=
 =?utf-8?B?OStmTGdqdlJWYkZlSzQzMWdtQ29NVXgzZ2JDT003eVoxbGIrNjNNUW1HNmRD?=
 =?utf-8?B?enhoVHZublEyZG1BSTN5anRwSW95bHp5enY4VGgzeVBoYWF3Ni80cjQ2ZHQ1?=
 =?utf-8?B?dnpUVUphdWp2VXpqQ2tHblpTT0N2dEo0bk1xbGdrUmlOWHJWNGR0dVlkNnJ2?=
 =?utf-8?B?bUg0THc5bkhJV2hPMW9ZczhSNW1aZjltd3VpUW9qcWVCZmVUN1FxMThlYk1h?=
 =?utf-8?B?dk94aGV5UUczeE93TkFMMkJ0K3VJNlVuV2lKUzdLOUYzUGk3dHJ0aFJPOGtO?=
 =?utf-8?B?a2V6RjBMdHhCclU4dlBhRmprTG9DNkI4WndRL2pZbGIyc0N6bjVaNnVsM3g1?=
 =?utf-8?B?Sy8xMnNuYmdWNkVKQnkvTDMzK1JnMTkwYjB0WTdYTS9BTlh1NFlndEM0NXZ3?=
 =?utf-8?B?QUtydFNxZlJLOG85OTNQQWJhTCtYNGVBcXhWeTdCTllWM1JJSTFLZDBGTlVx?=
 =?utf-8?B?YTd5aGZDSHlBVDR0b3FSR0Y2ZnFOdXkzSnFOeExEaThwNDhnck5LcHltUXl6?=
 =?utf-8?B?QmVicTNjZmZzc1pMQzlLZ0RqdmZQWFcrN1ZhdGdaNTRqYkJTUzUwS3JPSGIr?=
 =?utf-8?B?NExYb0hjcFIwSmtubm5hVEFEZWRzL2NYSXUzdkgrQlpabzhnNEdEZjEySndR?=
 =?utf-8?B?RlljWWNNYnZyN3lSeXdqc1R0c1d4S1o0b2hKdVE2YU1ta2NiVnpKRWd0MEdw?=
 =?utf-8?B?WlEwZFd4Y0NhV3UvZ3ovS1RIcytIZU1SV1VCdUtiZTVnblorUFBIRWk4MGtG?=
 =?utf-8?B?TWUrMGhXNXhISG1nT20yNDZEUWJkRm1KZDlkWjJta3hiaGMyU2VXM3FIdkhJ?=
 =?utf-8?B?UndpczhERTlwYlV0MFI1R0YzOUFSUHQycEQrSHFtUCtoYm1qRjY2VHcxMndh?=
 =?utf-8?B?cVcxVHF5UWVqLzBsK29NbElZTGt3YWV2OUxISzhIYzAwUk9ZODVJSlpIeTlH?=
 =?utf-8?B?Y3o0WGVkWGxJMFdwKzBtcVdHMXNDTnRMT2tsQjNZUFpxbnE4L2paZHFxemhw?=
 =?utf-8?B?SGNKY0ZCSnhBMjRVZk85K1dibVd0eUs2OUxGKzdRaUhRVzRzQ1U3S2xYdTVP?=
 =?utf-8?B?S0RHdmoxd2hyT0lYdHVGRHNlcmkvTnhpeFA2RloxSzlxWFNCbE9lN0pPKy9Q?=
 =?utf-8?B?eFFqL25UT24vZ1B1SzVXVTJvYW1ReVZ4V1RnVHl2Ym1JQkFaLzN1V1BwQTBC?=
 =?utf-8?B?dEhyWU9PQ0pMTlRvQTRzT3lHMnIxVWlmVGFHKzhZemhISnczWHFKOXhRV3pB?=
 =?utf-8?B?ZS93OWlKRjVtOUp1SmlTckVxdW84UVBSc0wrclZuUVUrTUd2T2ZrakJtdzZ6?=
 =?utf-8?B?cnFCc2YreEo2cUtRWDBkRHdsV1p5UUpHc0JBRjdKUnZvQW0ra0huUE5PRk9X?=
 =?utf-8?B?OGt2alZMUmQ0U25hbzRNckttNStjSGREZngyMmlSbGJIZGhnNzdtYVV6Zjk0?=
 =?utf-8?B?dlNEVW0rMlg4elRWd1pJNW94bDA4NW80MmJOS3lNNWVQditqT1VCRjlwWGFR?=
 =?utf-8?Q?i7RAtnchS/S8K5MRqHoe6WRV3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b15b895b-f569-45e7-71a1-08de0c7de3df
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:33:16.9156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0gPKIu2HdCK8e+qAu5nXKnXw73dnXGo+WQqMc9f0hnkMfyhbjkjLgu3JcLw8rfQT9d9mpggxLnIU9jx4BHloaQ==
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

In TCON operation mode, sync signals from FrameGen are ignored, but
a much more customized output timing can be generated by the TCON
module.  By using TCON operaton mode, generate KACHUNK signal along
with HSYNC/VSYNC/data enable signals.  The KACHUNK signal is used as
a synchronization signal inside the prefetch engine(DPRC + PRG(s),
attached to FetchUnit(s)).  Carefully switch TCON bypass mode to TCON
operation mode when CRTC is being enabled so that the prefetch engine
may evade the first dumb frame generated by the display controller.

Since TCON BYPASS bit is controlled by KMS driver when doing atomic
commits, drop the bit setting when initializing TCON.  This also
avoids accidentally initializing TCON BYPASS bit to 1 when driver
module removing and re-installing where an upcoming patch would
disable a CRTC at boot in TCON operation mode if needed.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-crtc.c |  28 ++++++++++
 drivers/gpu/drm/imx/dc/dc-de.h   |   2 +
 drivers/gpu/drm/imx/dc/dc-kms.h  |   2 +
 drivers/gpu/drm/imx/dc/dc-tc.c   | 114 +++++++++++++++++++++++++++++++++++++--
 4 files changed, 142 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
index 45a87df1ad6a8bd768aa5ed38d6f03f14052b3d7..9e9e86cd5202bcb0bb4d5627dbcefcc3f4e2ead0 100644
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -6,8 +6,10 @@
 #include <linux/completion.h>
 #include <linux/container_of.h>
 #include <linux/interrupt.h>
+#include <linux/irqflags.h>
 #include <linux/irqreturn.h>
 #include <linux/pm_runtime.h>
+#include <linux/preempt.h>
 #include <linux/spinlock.h>
 
 #include <drm/drm_atomic.h>
@@ -68,6 +70,14 @@ do {									\
 							__func__);	\
 } while (0)
 
+#define DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(fg)		\
+do {									\
+	if (!dc_fg_wait_for_frame_index_moving(fg))			\
+		dc_crtc_err(crtc,					\
+			"%s: FrameGen frame index isn't moving\n",	\
+							__func__);	\
+} while (0)
+
 static inline struct dc_crtc *to_dc_crtc(struct drm_crtc *crtc)
 {
 	return container_of(crtc, struct dc_crtc, base);
@@ -229,6 +239,7 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	struct drm_display_mode *adj = &new_crtc_state->adjusted_mode;
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
 	enum dc_link_id cf_link;
+	unsigned long flags;
 	int idx, ret;
 
 	dc_crtc_dbg(crtc, "mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(adj));
@@ -249,6 +260,7 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	enable_irq(dc_crtc->irq_ed_safe_shdload);
 
 	dc_fg_cfg_videomode(dc_crtc->fg, adj);
+	dc_tc_cfg_videomode(dc_crtc->tc, adj);
 
 	dc_cf_framedimensions(dc_crtc->cf_cont,
 			      adj->crtc_hdisplay, adj->crtc_vdisplay);
@@ -273,7 +285,22 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
 	dc_ed_pec_sync_trigger(dc_crtc->ed_safe);
 	dc_fg_shdtokgen(dc_crtc->fg);
+
+	/* Don't relinquish CPU until TCON is set to operation mode. */
+	local_irq_save(flags);
+	preempt_disable();
+
 	dc_fg_enable(dc_crtc->fg);
+	/*
+	 * Turn TCON into operation mode as soon as the first dumb
+	 * frame is generated by DC(we don't relinquish CPU to ensure
+	 * this).  This makes DPR/PRG be able to evade the frame.
+	 */
+	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
+	dc_tc_set_operation_mode(dc_crtc->tc);
+
+	local_irq_restore(flags);
+	preempt_enable();
 
 	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_safe_shdload_done);
 	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdload_done);
@@ -561,6 +588,7 @@ int dc_crtc_init(struct dc_drm_device *dc_drm, int crtc_index)
 	dc_crtc->ed_cont = pe->ed_cont[crtc_index];
 	dc_crtc->ed_safe = pe->ed_safe[crtc_index];
 	dc_crtc->fg = de->fg;
+	dc_crtc->tc = de->tc;
 
 	dc_crtc->irq_dec_framecomplete = de->irq_framecomplete;
 	dc_crtc->irq_dec_seqcomplete = de->irq_seqcomplete;
diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
index 211f3fcc1a9ad642617d3b22e35ea923f75e645b..c39f2ef5eea98c3eb6ae9b5392f9bf9f7e33e7c5 100644
--- a/drivers/gpu/drm/imx/dc/dc-de.h
+++ b/drivers/gpu/drm/imx/dc/dc-de.h
@@ -54,6 +54,8 @@ enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz);
 void dc_fg_init(struct dc_fg *fg);
 
 /* Timing Controller Unit */
+void dc_tc_set_operation_mode(struct dc_tc *tc);
+void dc_tc_cfg_videomode(struct dc_tc *tc, struct drm_display_mode *m);
 void dc_tc_init(struct dc_tc *tc);
 
 #endif /* __DC_DISPLAY_ENGINE_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-kms.h b/drivers/gpu/drm/imx/dc/dc-kms.h
index cd7860eff986a272f6983ad0f3cc87dbf40c2851..a25d47eebd28792e4b53b4ecc89907ce00430c2c 100644
--- a/drivers/gpu/drm/imx/dc/dc-kms.h
+++ b/drivers/gpu/drm/imx/dc/dc-kms.h
@@ -50,6 +50,8 @@ struct dc_crtc {
 	struct dc_ed *ed_safe;
 	/** @fg: framegen */
 	struct dc_fg *fg;
+	/** @tc: tcon */
+	struct dc_tc *tc;
 	/**
 	 * @irq_dec_framecomplete:
 	 *
diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
index 0bfd381b2cea15444c399f3ad261e2d061ea1c9f..6f1dc71f1b40cb4d99ca177172bd0066f39e8314 100644
--- a/drivers/gpu/drm/imx/dc/dc-tc.c
+++ b/drivers/gpu/drm/imx/dc/dc-tc.c
@@ -9,11 +9,30 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include <drm/drm_modes.h>
+
 #include "dc-drv.h"
 #include "dc-de.h"
 
 #define TCON_CTRL	0x410
-#define  CTRL_RST_VAL	0x01401408
+#define  SPLITPOSITION_MASK	GENMASK(29, 16)
+#define  SPLITPOSITION(n)	FIELD_PREP(SPLITPOSITION_MASK, (n))
+#define  DUAL_SWAP	BIT(15)
+#define  MINILVDS_OPCODE_MASK	GENMASK(14, 12)
+#define  MODE_4PAIRS	FIELD_PREP(MINILVDS_OPCODE_MASK, 0x1)
+#define  LVDS_CLOCK_INV	BIT(11)
+#define  LVDS_BALANCE	BIT(10)
+#define  LVDSMODE	BIT(9)
+#define  ENLVDS		BIT(8)
+#define  INV_CTRL_MASK	GENMASK(7, 4)
+#define  BYPASS		BIT(3)
+#define  TCON_SYNC	BIT(2)
+#define  CHANNELMODE_MASK	GENMASK(1, 0)
+#define  CTRL_RST_MASK	\
+		(SPLITPOSITION_MASK | DUAL_SWAP | MINILVDS_OPCODE_MASK | \
+		 LVDS_CLOCK_INV | LVDS_BALANCE | LVDSMODE | ENLVDS | \
+		 INV_CTRL_MASK | TCON_SYNC | CHANNELMODE_MASK)
+#define  CTRL_RST_VAL  (SPLITPOSITION(0x140) | MODE_4PAIRS | LVDS_BALANCE)
 
 /* red: MAPBIT 29-20, green: MAPBIT 19-10, blue: MAPBIT 9-0 */
 #define MAPBIT3_0	0x418
@@ -25,6 +44,16 @@
 #define MAPBIT27_24	0x430
 #define MAPBIT31_28	0x434
 
+#define SPGPOSON(n)	(0x460 + (n) * 16)
+#define SPGMASKON(n)	(0x464 + (n) * 16)
+#define SPGPOSOFF(n)	(0x468 + (n) * 16)
+#define SPGMASKOFF(n)	(0x46c + (n) * 16)
+#define  X(n)		FIELD_PREP(GENMASK(30, 16), (n))
+#define  Y(n)		FIELD_PREP(GENMASK(14, 0), (n))
+
+#define SMXSIGS(n)	(0x520 + (n) * 8)
+#define SMXFCTTABLE(n)	(0x524 + (n) * 8)
+
 static const struct dc_subdev_info dc_tc_info[] = {
 	{ .reg_start = 0x5618c800, .id = 0, },
 	{ .reg_start = 0x5618e400, .id = 1, },
@@ -33,6 +62,8 @@ static const struct dc_subdev_info dc_tc_info[] = {
 static const struct regmap_range dc_tc_regmap_ranges[] = {
 	regmap_reg_range(TCON_CTRL, TCON_CTRL),
 	regmap_reg_range(MAPBIT3_0, MAPBIT31_28),
+	regmap_reg_range(SPGPOSON(0), SPGMASKOFF(4)),
+	regmap_reg_range(SMXSIGS(0), SMXFCTTABLE(3)),
 };
 
 static const struct regmap_access_table dc_tc_regmap_access_table = {
@@ -47,7 +78,7 @@ static const struct regmap_config dc_tc_regmap_config = {
 	.fast_io = true,
 	.wr_table = &dc_tc_regmap_access_table,
 	.rd_table = &dc_tc_regmap_access_table,
-	.max_register = MAPBIT31_28,
+	.max_register = SMXFCTTABLE(3),
 };
 
 /*
@@ -60,10 +91,85 @@ static const u32 dc_tc_mapbit[] = {
 	0x13121110, 0x03020100, 0x07060504, 0x00000908,
 };
 
+void dc_tc_set_operation_mode(struct dc_tc *tc)
+{
+	regmap_write_bits(tc->reg, TCON_CTRL, BYPASS, 0);
+}
+
+void dc_tc_cfg_videomode(struct dc_tc *tc, struct drm_display_mode *m)
+{
+	int hdisplay, hsync_start, hsync_end;
+	int vdisplay, vsync_start, vsync_end;
+	int y;
+
+	hdisplay = m->hdisplay;
+	vdisplay = m->vdisplay;
+	hsync_start = m->hsync_start;
+	vsync_start = m->vsync_start;
+	hsync_end = m->hsync_end;
+	vsync_end = m->vsync_end;
+
+	/*
+	 * Turn TCON into operation mode later after the first dumb frame is
+	 * generated by DC.  This makes DPR/PRG be able to evade the frame.
+	 */
+	regmap_write_bits(tc->reg, TCON_CTRL, BYPASS, BYPASS);
+
+	/* dsp_control[0]: HSYNC */
+	regmap_write(tc->reg, SPGPOSON(0), X(hsync_start));
+	regmap_write(tc->reg, SPGMASKON(0), 0xffff);
+
+	regmap_write(tc->reg, SPGPOSOFF(0), X(hsync_end));
+	regmap_write(tc->reg, SPGMASKOFF(0), 0xffff);
+
+	regmap_write(tc->reg, SMXSIGS(0), 0x2);
+	regmap_write(tc->reg, SMXFCTTABLE(0), 0x1);
+
+	/* dsp_control[1]: VSYNC */
+	regmap_write(tc->reg, SPGPOSON(1), X(hsync_start) | Y(vsync_start - 1));
+	regmap_write(tc->reg, SPGMASKON(1), 0x0);
+
+	regmap_write(tc->reg, SPGPOSOFF(1), X(hsync_start) | Y(vsync_end - 1));
+	regmap_write(tc->reg, SPGMASKOFF(1), 0x0);
+
+	regmap_write(tc->reg, SMXSIGS(1), 0x3);
+	regmap_write(tc->reg, SMXFCTTABLE(1), 0x1);
+
+	/* dsp_control[2]: data enable */
+	/* horizontal */
+	regmap_write(tc->reg, SPGPOSON(2), 0x0);
+	regmap_write(tc->reg, SPGMASKON(2), 0xffff);
+
+	regmap_write(tc->reg, SPGPOSOFF(2), X(hdisplay));
+	regmap_write(tc->reg, SPGMASKOFF(2), 0xffff);
+
+	/* vertical */
+	regmap_write(tc->reg, SPGPOSON(3), 0x0);
+	regmap_write(tc->reg, SPGMASKON(3), 0x7fff0000);
+
+	regmap_write(tc->reg, SPGPOSOFF(3), Y(vdisplay));
+	regmap_write(tc->reg, SPGMASKOFF(3), 0x7fff0000);
+
+	regmap_write(tc->reg, SMXSIGS(2), 0x2c);
+	regmap_write(tc->reg, SMXFCTTABLE(2), 0x8);
+
+	/* dsp_control[3]: KACHUNK */
+	y = vdisplay + 1;
+
+	regmap_write(tc->reg, SPGPOSON(4), X(0x0) | Y(y));
+	regmap_write(tc->reg, SPGMASKON(4), 0x0);
+
+	regmap_write(tc->reg, SPGPOSOFF(4), X(0x20) | Y(y));
+	regmap_write(tc->reg, SPGMASKOFF(4), 0x0);
+
+	regmap_write(tc->reg, SMXSIGS(3), 0x6);
+	regmap_write(tc->reg, SMXFCTTABLE(3), 0x2);
+}
+
 void dc_tc_init(struct dc_tc *tc)
 {
-	/* reset TCON_CTRL to POR default so that TCON works in bypass mode */
-	regmap_write(tc->reg, TCON_CTRL, CTRL_RST_VAL);
+	/* reset TCON_CTRL to POR default except for touching BYPASS bit */
+	regmap_write_bits(tc->reg, TCON_CTRL, CTRL_RST_MASK, CTRL_RST_VAL);
 
 	/* set format */
 	regmap_bulk_write(tc->reg, MAPBIT3_0, dc_tc_mapbit,

-- 
2.34.1

