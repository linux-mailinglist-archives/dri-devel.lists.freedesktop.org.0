Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBEAC0C685
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DF710E3A3;
	Mon, 27 Oct 2025 08:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="KCmgJjlO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11D910E3A3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:47:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNcs/FpmNVmBJgehUOlnOjYekz+Wx5NAkoZ36jhk9+HNDKDADe1PPQ7E43l2oytYBx8vlfEBmJwnIOGlcbhsYMC4BuF3bjWxTqgBJUoZljSBth1rnzRTEIp9Uln9/vX1o2xXiksVcVqYH2VmvWoVFeG41BAjKVJz27qAQ1Us6m4cWDdqcA03Bl43Hd+skefuUl/Dgoq139OmNWHQcZMs8fpCKufbDF3UdxqRkO2Z0+OJu6ARvIfQ7vS7olhQT5LXERCfRg1uzgAcnUn5KJbYZEtXHb+y7W5jjCef8oHpX5nfg8qqiX8GJjHjYTLDWL3qnvtICE4R/0h1ZrXnoWys2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrQrQpoM9jXVOm5X1Z9zp0ygGm2l+n58obMquDW0pzU=;
 b=vqMWZrSiOwPWv6LQydrth1uNIuLjk73USfSIvnF8ouXztCcrqCrTv9nn6JRWpGFBtuEOkXL1cTMW3Yi6ZHWxxHF2DjFgf3Py2OoxjkdJqNRvjUJSMuBhzGXNUKSJbBeI8zisssFO4EfICr/ETU8WlweaV5xGdA/TtxC9Hz9yLmxL+FYJwQmzcy6O56sc9IKzCiyC5or77HBLixQ0urxa6nHtJ43bYn9LFiGXI5L9AY4zUvexdFjJQwCnX6nYKo4mc6//6Sh6uYUl/46sD+bqLO853LvA1AqSXAwNvtKht8pNMLcyoHfBpeG7RGwiKtkuxN2Wxj8L8oy8EpCmqkA/pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrQrQpoM9jXVOm5X1Z9zp0ygGm2l+n58obMquDW0pzU=;
 b=KCmgJjlO9ROV0WPaG/srNRfRpoqVjotBgnwRw2GWlXIUL9tLvvHHbeA+k3wPl+Awc7fkXhqtKt3sSzaU/UkniwROtztU/WsuG5ya+jPD5OQZq8prakBlkezmGVAYBp8OhwG3xASUEXbZxg40/x77G7WtbV66+SJM+zEWAhuTviNu2pyp1lh4OwqdsdX17NUV6wAae726aaPwEwTPKGIPaD1bAVkpOwqAlakEIXg1UMv3qpAIHoOGu0zHGuM4/UpbzOZaXl2RN+6wEiGV82bb2LzNbFioKlBA/NkKQ1zvDqY83i1Niql2nsnptPBg8FymjuHfY7/aNToNoqgBdWWR4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8739.eurprd04.prod.outlook.com (2603:10a6:20b:42c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:47:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:47:19 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 27 Oct 2025 16:46:55 +0800
Subject: [PATCH v5 05/13] drm/imx: dc: Add PRG support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8-dc-prefetch-v5-5-4ecb6c6d4941@nxp.com>
References: <20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com>
In-Reply-To: <20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com>
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
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: b582bd3d-a06a-4c56-2a16-08de15357071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFVSSWxnM2J1L3QyVCtrWTM0M0RRanZvVzBNYUJjNCtXL3BNSGQwdnQ3YjVn?=
 =?utf-8?B?akpueWwvZm85bWZkOHU1NGtYdmlObXJ0bUYxcCszQXNuTmU3RVpxSmF5eHZF?=
 =?utf-8?B?eGFVaTB2R045U3BHZW1IckxHVGtINmlnUlBWT083N0NnMmhUUGFYRkcvT3BV?=
 =?utf-8?B?KzRKU1ZWd092TEtSZUpZT3lVbXNwQ1lTSCs3OHpXZzI1TWFrK0VFYWJyd0Vl?=
 =?utf-8?B?YzQyc3dIZFdtOUl4V0ZxRk1YTDhRTHpVRzV2NVE1c29WZTdEZnJkSmNmeGJY?=
 =?utf-8?B?TWFMYlYwTXJISUlMbFpzNTU3Y3VmbmExTmJmVEl5Y1hZZE1oYVQwMWpmS3FG?=
 =?utf-8?B?eDdSRnc1RmYxbUJHTXVCSCtEUFhlWktiZmxRUVZIbG11cmlCUlhHV1pVQ2NR?=
 =?utf-8?B?bmN4bGNQZG45eXlxVWREWmdFYTE0R21BVVFqbUpaeUcybHBPTGcrM1h0L09z?=
 =?utf-8?B?UGtuT0RDcmtwSmFlSS9wUlZrUFQybUdsQ1JzaGZrSVE0K2hMT21CclpNTEl1?=
 =?utf-8?B?VUNMcmNWTmIvWGI1dlcyYXhCQnBFemhJWU5HWmNQZHRCejB4NmJ0bTZuVzdp?=
 =?utf-8?B?UVFtNkVWQ1F3NEJWejNXWERhSS8zdmNncW8yZzJtSEYzQlpNYVhjSXdyN1Nn?=
 =?utf-8?B?NW9PY2ErVnNFMVhLNG9WQmVZZE93M3MvV0tpMVlZL0hmaEZpMFplcGttYWFB?=
 =?utf-8?B?c3RwUW0yRzNBS0lIMWpxcGIxNWc4cVlzWmt3WkZqYkx3R3ZvSlJLN1dYRnlR?=
 =?utf-8?B?RGpKTTZ0dFdyREVoWE5JRUp5anQ2SE0wWU85bmpKR0Y5YlorVkFBaEJkT0hp?=
 =?utf-8?B?ZFZIaFcrMGtFaG1qRnl6T1kzTzFXNDVlb1F5TDJsVUVVVVR1bk1hS0tvWlFS?=
 =?utf-8?B?QnM2azd6OVdwczBkRlZsbEd3UmhvWnRQTk96MTB6ZGZIWGpDZVRKbk16QUN4?=
 =?utf-8?B?QWxkQzVubDhUa0dmR1p6OUdscmdKWlZ6T0VpR1hGVldDbXNXd080YWdWZXdD?=
 =?utf-8?B?V21rMVg2UWVkbHVuVzl2N3RnWUhtRitFYkVvRUI0NXVzUWQvTkpZditacW0y?=
 =?utf-8?B?OUJ0R2JuQ0NLRy81bGNpQkpQNlpJZFRzZnp5WjdTWFZNNkVjcWZCV0x2NGtC?=
 =?utf-8?B?TDFuanp4UzF3dmx0ZmhFUXFJeVRzUmlFOUJLNzh5amFUbkVaOFozcHUzRk13?=
 =?utf-8?B?VjB1NE1tUjR5YVYyWUxhbEJmUTc4VXYrOTdubjE0bHNUU1JrOEN5eUJoZHVa?=
 =?utf-8?B?aXBwNi9pQ2c1ZGJwSDNScDV3Ni9rWEJGZERCYjdJaExFdTJTY25kclZnRkp4?=
 =?utf-8?B?YlhRR0hSYXBBbnF4WDJ6RER0ME1keU1FdS9BNUhUNWJFSlB0TUY3UkpEVSt2?=
 =?utf-8?B?bS81ajEvQ1lDakJtaUdWNmgyUCtScGxhSXJMRUZ4MGNaclJsc3gyZjkydXVa?=
 =?utf-8?B?ZEMrcmltS3ZsOFhUZElzWEN1NE5BSytyN3ByQ2J0Wmx0elh1cThrUkE2MHRM?=
 =?utf-8?B?RVJ3SU5YaVRjWXBsRWNYVkdvL25xUkJhZ2ltanEyV2ZwdGhnbGZIUFB3Ti9G?=
 =?utf-8?B?cGttblJvcEQxN000Z1lEMXZNaWJDSmhRSWNOZ2RVU29pSFhlWFJCcCtkTFRm?=
 =?utf-8?B?d21YSE40dEF4TG9wMW9Bc2dnODZ2Nm5saG4yZEZXR2lkaFV5WUlHMDFheDFY?=
 =?utf-8?B?d0dBVTRaSGJmNWhrZS9DM1JPVVQ3MGw5eldidllwa1JId2doUmRnREx1dWRz?=
 =?utf-8?B?T1B1TEFSeGYxeGFHY0xOcllmSFNkWjFUVUVKWWVRVUg2Z0NHanUrY1UvdkF1?=
 =?utf-8?B?dE84UDRxWXpUdnAxeXRGYlhnVU5IZ21xSmFpYWwwVzF0K2dvL3V4Q0VsQytL?=
 =?utf-8?B?S2FEZ0lsSytidkxucm1PQ0FoV2w2T2YxOXZPRHJ2Ky9KWDdkRGtMTnBUNjdD?=
 =?utf-8?B?SE4zVGp6RjFxRWNmVTE2a0FiMndVYVFmbkNLRFdxQ2duMkJYaFcxTW1YcVVC?=
 =?utf-8?B?TzkzTzU2ZURLcjB1UU4xb2hxeFJpbHN4VXhiNVhpQmpscnJDYUVpSFQ0SXln?=
 =?utf-8?B?ckxSVGxFRnBJck5iQlEzREtwQ0dTbnVMMXJKUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXFHNGd0eEl0VVA1OGhiOVZjaXp3VFJOKzNyaFdybmZiV2Rza3NySi85cHBn?=
 =?utf-8?B?dTRlTUIwb3dFTXY2ckdIZmpUN2d1RXV2QzhpQmRNbitDWHdVVmU5L1hJK004?=
 =?utf-8?B?dVB5UGhXVXhiRUVLdkgxeDRDT2RhWXdQVkFSRzc0djJDdVVmMERoMGVSSjRj?=
 =?utf-8?B?KzRkSkRiZjErMEY3MDRwUlJXZ0FqQW0vVGEvenhWSUtiZzhhS296MDJuMEo4?=
 =?utf-8?B?ZWR5bmtYYXgvdEQ3UTFzQWg2VGk0ZmErbmFhaXFqQWlVWUN4WTZ3MHhuTWFy?=
 =?utf-8?B?OFA4c1lBV2cwaW9zTmlHQWNEOGxPd2tKajE3aiswQ0RnOFhsN1FwTE93RXdp?=
 =?utf-8?B?b2tJOFpDa05lU0pweDUwdytLR1BPV1ErVXFIeHpoT3luQVp4M0cwbW9pTmxx?=
 =?utf-8?B?YWFlWHpWL2RCY1VOOE9LVVlDODVrWXRhYU1ydC9PWFdPcGlSUlg4bHVpTjVR?=
 =?utf-8?B?SlV1QldSaGdZdFI5a3hMMTNaeTJBWHZ6SHRlKzFocDJzTXNiTW81RFYzYmo4?=
 =?utf-8?B?RnpOZGplOEh4TkFGTnA1U202NWF3ZHZLWnNGaUxCc2FqdEh5clFuN0w5elJI?=
 =?utf-8?B?cStQNXVKTUVNaFI2Y05qTzRtQ0YvK0hvaEJZR3pCYVZZQ0Mwb3YrWVJqZ0o5?=
 =?utf-8?B?MmdKc0xXbXlxNzVjTitqY1lLQnd1RzRYR2tqRjFkNmQ4b3k5ZXdoZFc1SGlJ?=
 =?utf-8?B?ZHNTVjVxUWZSMHlpcnQxMFVNb2p1dmU0WlBjTm0yTVdXV2FCYUZvazArOWo2?=
 =?utf-8?B?WHlqVC9VTTJGSXNaaDJjYXUwN2xJNkc5S2pyRzZtb0p3Z3JTeFdmOGdUUE1J?=
 =?utf-8?B?eEI5MmdGKzlwa2lHc2dYSXVua0tOTy9BK3hGN05tMzhvZjFNMVEyYWdXbWZE?=
 =?utf-8?B?RXJRMWlSY1k1c3BVVVdkYWNmbjVPRWJubHRHaWtKanAvN256Q1N6cjNpNThR?=
 =?utf-8?B?MVgxNVlnbHRYbFBmUC8xb0VuYmhvcWFiQ2RjcnNEUU1HRk9VSXYrbmZOMDNu?=
 =?utf-8?B?T2YrYkVVRUw2OGdoaEh4NDFGZWZ5YUk2cmxvOWlyUnExYWhzeDE0dytkdFhW?=
 =?utf-8?B?cmpXSkpaQ1g2WVhXZjNKUVNtckNnUk1CYmFUQ1JSbUtUR0NZSWhsKy9SMkVB?=
 =?utf-8?B?djhMQnN1cDB1TjFzOXBJOGFrRG5UWlEwYTZ4bnZCb3FGOG5WMTY1ZXJPaUxK?=
 =?utf-8?B?bVdhTnhmNDdqTGdsZi91aWUyY2JXblhxTWNRZmZKN1M1b09henVUMnJRbXo0?=
 =?utf-8?B?SkRXejZIRmUxNW9wNGFvY2JwMWh5U3lmUTNVMUl2ZkV4eVV0RnR4cGsydUlX?=
 =?utf-8?B?Uk1WNEVXRE13bTNObEtXVWNTaVdlYmdCaVVBT3lqRWZHQU5pNTdHMmJWc1Fw?=
 =?utf-8?B?dGdLUVEvdWRVaUJjNmlJQXBkZjJnUDV1VzF4ak5Id3Zzbm02cDh1bVcyNFh5?=
 =?utf-8?B?OG9zaEVmcFhGK2taQm40Mi9ldWRIOE5jUnkyZUdMYkdXVmJHdEhCeDRtN29V?=
 =?utf-8?B?UVpOSklMTmMyaER1OWY3RC9EajNXWEFBZFZnUUdmeTJFOXo0SkQ0SFFLaEhu?=
 =?utf-8?B?SmJqaDB0R1I2NHIvYTBtLyt5cFRjRFRYVGxTY3lIZWhLNTd5OWthZCt2NTJ0?=
 =?utf-8?B?ZDZ6Y0Njb0NQMFBnOHJRNTJ1dUxKelZrd2tLTnJyNmxLMjVENkdZWDI0WjJx?=
 =?utf-8?B?b2ZMYTlMRU9Jc28yaGVFWFMvcUZ4QzZJWlhFMktFZTg5UzYwSnJJb0xwZm5v?=
 =?utf-8?B?bjVNSFBDV0dsc0ZGbTZGTWhGM2krRTlib011VTN0eGxwSStYei9IZkJOYytP?=
 =?utf-8?B?QlJvQ2VEVEQ1L1MxdUpReHBtWHlIdXNFSU1BdUt0QjN0c096UlNqd0p2Y2hn?=
 =?utf-8?B?WnlxVmJudTdCcWFoUlBCSTlYT1F6Q0F4cVZUSEozQlp2Z2s4VzJ5dG4wZVdL?=
 =?utf-8?B?K1VvcnNnaXMvRkM0eFZyVXh5VXFlR3hpOHVReWNDRExBYXY4cjJpNmd6VVdY?=
 =?utf-8?B?YWVLUFJjbTNYQno5N29xclNJcjFzNERNb3ZXOWZRREhaTnFZeE5TajlQU3BT?=
 =?utf-8?B?VTAwaEdZVTNCdDF1SkVmZ1hkaERHeU1RaHF2UXN6Sk1Xa3M1bVNtRzFTRXVx?=
 =?utf-8?Q?kDYSy5juCM+YY4IgIw4Ty/0t/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b582bd3d-a06a-4c56-2a16-08de15357071
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:47:19.8416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZMmv0LrUdlt8fxxqBG01mdjeWHuapZW5x+ANqtgwR5/1t+4Q9k2W/48kL+M0Svp4h+hhqfGfpF3kMkqvK0v9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8739
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

Display Prefetch Resolve Gasket(PRG) is a part of a FetchUnit's
prefetch engine.  It sits between a Display Prefetch Resolve
Channel(DPRC) and a FetchUnit.  Add a platform driver to support
the PRG.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4:
- Sort bits and bitfields in descending order for register PRG_CTRL.

v2:
- Manage clocks with bulk interfaces.  (Frank)
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/Makefile |   2 +-
 drivers/gpu/drm/imx/dc/dc-drv.c |   1 +
 drivers/gpu/drm/imx/dc/dc-drv.h |   1 +
 drivers/gpu/drm/imx/dc/dc-prg.c | 308 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-prg.h |  35 +++++
 5 files changed, 346 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
index b9d33c074984a7ee5a6f0876d09bfeee5096264c..e3a06ee3ce1a5117d0a9a00fdf7655ee31be3caf 100644
--- a/drivers/gpu/drm/imx/dc/Makefile
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o \
-		    dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o dc-pe.o \
+		    dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o dc-pe.o dc-prg.o  \
 		    dc-plane.o dc-tc.o
 
 obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index f93766b6bfbfae8510db05278d104820ca0719c4..9bdcfc5aee976ef77bea6b3f6f3ac5f11249798f 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -276,6 +276,7 @@ static struct platform_driver * const dc_drivers[] = {
 	&dc_ic_driver,
 	&dc_lb_driver,
 	&dc_pe_driver,
+	&dc_prg_driver,
 	&dc_tc_driver,
 	&dc_driver,
 };
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index 68e99ba7cedbca1b8bdc0d8ced7a610a1056bfc7..557e7d90e4ea8ca2af59027b3152163cf7f9a618 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -81,6 +81,7 @@ extern struct platform_driver dc_fw_driver;
 extern struct platform_driver dc_ic_driver;
 extern struct platform_driver dc_lb_driver;
 extern struct platform_driver dc_pe_driver;
+extern struct platform_driver dc_prg_driver;
 extern struct platform_driver dc_tc_driver;
 
 static inline int dc_subdev_get_id(const struct dc_subdev_info *info,
diff --git a/drivers/gpu/drm/imx/dc/dc-prg.c b/drivers/gpu/drm/imx/dc/dc-prg.c
new file mode 100644
index 0000000000000000000000000000000000000000..b72bb9154642c388db912450f7e9db973bb7fb87
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-prg.c
@@ -0,0 +1,308 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include "dc-prg.h"
+
+#define SET			0x4
+#define CLR			0x8
+#define TOG			0xc
+
+#define PRG_CTRL		0x00
+#define  SHADOW_EN		BIT(31)
+#define  SOFTRST		BIT(30)
+#define  DES_DATA_TYPE_MASK	GENMASK(17, 16)
+#define  DES_DATA_TYPE_32BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 0)
+#define  DES_DATA_TYPE_24BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 1)
+#define  DES_DATA_TYPE_16BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 2)
+#define  DES_DATA_TYPE_8BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 3)
+#define  SHADOW_LOAD_MODE	BIT(5)
+#define  HANDSHAKE_MODE_4LINES	0
+#define  SC_DATA_TYPE_8BIT	0
+#define  BYPASS			BIT(0)
+
+#define PRG_STATUS		0x10
+
+#define PRG_REG_UPDATE		0x20
+#define  REG_UPDATE		BIT(0)
+
+#define PRG_STRIDE		0x30
+#define  STRIDE(n)		FIELD_PREP(GENMASK(15, 0), (n) - 1)
+
+#define PRG_HEIGHT		0x40
+#define  HEIGHT(n)		FIELD_PREP(GENMASK(15, 0), (n) - 1)
+
+#define PRG_BADDR		0x50
+#define PRG_OFFSET		0x60
+
+#define PRG_WIDTH		0x70
+#define  WIDTH(n)		FIELD_PREP(GENMASK(15, 0), (n) - 1)
+
+#define DPU_PRG_MAX_STRIDE	0x10000
+
+struct dc_prg {
+	struct device *dev;
+	struct regmap *reg;
+	struct list_head list;
+	struct clk_bulk_data *clks;
+	int num_clks;
+};
+
+static DEFINE_MUTEX(dc_prg_list_mutex);
+static LIST_HEAD(dc_prg_list);
+
+static const struct regmap_config dc_prg_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = PRG_WIDTH + TOG,
+};
+
+static void dc_prg_reset(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL + SET, SOFTRST);
+	fsleep(10);
+	regmap_write(prg->reg, PRG_CTRL + CLR, SOFTRST);
+	fsleep(10);
+}
+
+void dc_prg_enable(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL + CLR, BYPASS);
+}
+
+void dc_prg_disable(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL, BYPASS);
+
+	pm_runtime_put(prg->dev);
+}
+
+void dc_prg_disable_at_boot(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL, BYPASS);
+
+	clk_bulk_disable_unprepare(prg->num_clks, prg->clks);
+}
+
+static unsigned int dc_prg_burst_size_fixup(dma_addr_t baddr)
+{
+	unsigned int burst_size;
+
+	burst_size = 1 << __ffs(baddr);
+	burst_size = round_up(burst_size, 8);
+	burst_size = min(burst_size, 128U);
+
+	return burst_size;
+}
+
+static unsigned int
+dc_prg_stride_fixup(unsigned int stride, unsigned int burst_size)
+{
+	return round_up(stride, burst_size);
+}
+
+void dc_prg_configure(struct dc_prg *prg,
+		      unsigned int width, unsigned int height,
+		      unsigned int stride, unsigned int bits_per_pixel,
+		      dma_addr_t baddr, bool start)
+{
+	struct device *dev = prg->dev;
+	unsigned int burst_size;
+	u32 val;
+	int ret;
+
+	if (start) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0) {
+			dev_err(dev, "failed to get RPM: %d\n", ret);
+			return;
+		}
+	}
+
+	burst_size = dc_prg_burst_size_fixup(baddr);
+
+	stride = dc_prg_stride_fixup(stride, burst_size);
+
+	regmap_write(prg->reg, PRG_STRIDE, STRIDE(stride));
+	regmap_write(prg->reg, PRG_WIDTH, WIDTH(width));
+	regmap_write(prg->reg, PRG_HEIGHT, HEIGHT(height));
+	regmap_write(prg->reg, PRG_OFFSET, 0);
+	regmap_write(prg->reg, PRG_BADDR, baddr);
+
+	val = SHADOW_LOAD_MODE | SC_DATA_TYPE_8BIT | BYPASS |
+	      HANDSHAKE_MODE_4LINES;
+
+	switch (bits_per_pixel) {
+	case 32:
+		val |= DES_DATA_TYPE_32BPP;
+		break;
+	case 24:
+		val |= DES_DATA_TYPE_24BPP;
+		break;
+	case 16:
+		val |= DES_DATA_TYPE_16BPP;
+		break;
+	case 8:
+		val |= DES_DATA_TYPE_8BPP;
+		break;
+	}
+
+	/* no shadow for the first frame */
+	if (!start)
+		val |= SHADOW_EN;
+	regmap_write(prg->reg, PRG_CTRL, val);
+}
+
+void dc_prg_reg_update(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_REG_UPDATE, REG_UPDATE);
+}
+
+void dc_prg_shadow_enable(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL + SET, SHADOW_EN);
+}
+
+bool dc_prg_stride_supported(struct dc_prg *prg,
+			     unsigned int stride, dma_addr_t baddr)
+{
+	unsigned int burst_size;
+
+	burst_size = dc_prg_burst_size_fixup(baddr);
+
+	stride = dc_prg_stride_fixup(stride, burst_size);
+
+	if (stride > DPU_PRG_MAX_STRIDE)
+		return false;
+
+	return true;
+}
+
+struct dc_prg *
+dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index)
+{
+	struct device_node *prg_node __free(device_node);
+	struct dc_prg *prg;
+
+	prg_node = of_parse_phandle(dev->of_node, name, index);
+	if (!prg_node)
+		return NULL;
+
+	guard(mutex)(&dc_prg_list_mutex);
+	list_for_each_entry(prg, &dc_prg_list, list) {
+		if (prg_node == prg->dev->of_node)
+			return prg;
+	}
+
+	return NULL;
+}
+
+static int dc_prg_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	void __iomem *base;
+	struct dc_prg *prg;
+	int ret;
+
+	prg = devm_kzalloc(dev, sizeof(*prg), GFP_KERNEL);
+	if (!prg)
+		return -ENOMEM;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	prg->reg = devm_regmap_init_mmio(dev, base, &dc_prg_regmap_config);
+	if (IS_ERR(prg->reg))
+		return PTR_ERR(prg->reg);
+
+	prg->num_clks = devm_clk_bulk_get_all(dev, &prg->clks);
+	if (prg->num_clks < 0)
+		return dev_err_probe(dev, prg->num_clks, "failed to get clocks\n");
+
+	dev_set_drvdata(dev, prg);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
+
+	prg->dev = dev;
+
+	guard(mutex)(&dc_prg_list_mutex);
+	list_add(&prg->list, &dc_prg_list);
+
+	return 0;
+}
+
+static void dc_prg_remove(struct platform_device *pdev)
+{
+	struct dc_prg *prg = dev_get_drvdata(&pdev->dev);
+
+	guard(mutex)(&dc_prg_list_mutex);
+	list_del(&prg->list);
+}
+
+static int dc_prg_runtime_suspend(struct device *dev)
+{
+	struct dc_prg *prg = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(prg->num_clks, prg->clks);
+
+	return 0;
+}
+
+static int dc_prg_runtime_resume(struct device *dev)
+{
+	struct dc_prg *prg = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(prg->num_clks, prg->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks: %d\n", ret);
+		return ret;
+	}
+
+	dc_prg_reset(prg);
+
+	return 0;
+}
+
+static const struct dev_pm_ops dc_prg_pm_ops = {
+	RUNTIME_PM_OPS(dc_prg_runtime_suspend, dc_prg_runtime_resume, NULL)
+};
+
+static const struct of_device_id dc_prg_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-prg", },
+	{ /* sentinel */ }
+};
+
+struct platform_driver dc_prg_driver = {
+	.probe = dc_prg_probe,
+	.remove = dc_prg_remove,
+	.driver = {
+		.name = "imx8-dc-prg",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_prg_dt_ids,
+		.pm = pm_ptr(&dc_prg_pm_ops),
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-prg.h b/drivers/gpu/drm/imx/dc/dc-prg.h
new file mode 100644
index 0000000000000000000000000000000000000000..6fd9b050bfa12334720f83ff9ceaf337e3048a54
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-prg.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DC_PRG_H__
+#define __DC_PRG_H__
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+struct dc_prg;
+
+void dc_prg_enable(struct dc_prg *prg);
+
+void dc_prg_disable(struct dc_prg *prg);
+
+void dc_prg_disable_at_boot(struct dc_prg *prg);
+
+void dc_prg_configure(struct dc_prg *prg,
+		      unsigned int width, unsigned int height,
+		      unsigned int stride, unsigned int bits_per_pixel,
+		      dma_addr_t baddr, bool start);
+
+void dc_prg_reg_update(struct dc_prg *prg);
+
+void dc_prg_shadow_enable(struct dc_prg *prg);
+
+bool dc_prg_stride_supported(struct dc_prg *prg,
+			     unsigned int stride, dma_addr_t baddr);
+
+struct dc_prg *
+dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
+
+#endif

-- 
2.34.1

