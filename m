Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD68BE1BC0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C17B10E954;
	Thu, 16 Oct 2025 06:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="TAl1b6Kx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013046.outbound.protection.outlook.com [40.107.159.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7FF10E954
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:33:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7KxYW70wzf/p7qwo0kmCLNtCQ8ERJue6lbt6g/69aiQq3NXhSkNe+Ikm4MQiCcvrtTnibG/DIPs+UZ/+otmTY6uDmmwmRG1Xd9KbwIXqpDy/yL0YOt0R/Hl5jN7YJYSWlKOy2kEa/D5sUvF957J5clxPA7Rog9z/+rl6injAvFNQNDhpixLE2/V7lrFtYhRzSa0PCEbPthQkxtAsd6ypDPL1uNRNSws9IW40DXxyk4IpaY37qJ1VSuevMtSEiIrQUSefrsLlTTfWMmOcpP5lhqpTpgs980FXUwnO24sg02Yztb4NEiVmj29JxioW2UPiBlKcmv7fJWc4WvygptaEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrQrQpoM9jXVOm5X1Z9zp0ygGm2l+n58obMquDW0pzU=;
 b=Fx6D0exasnHjm+KAGVwqSUO4IjVluT6FQktnXQNGgyKgd646h1OZPL3U2t4VS6C5nB+dhMTPMosgCehd9tsc4WIqzbqzHa0SONjsGeQh7ic0460pCY3u9xjCIjJ3Zi42RHeLw/2fotjk4R/D+jcIktZBitnNU2+fL/97+3/PmrRTQCmMkI04pFz9RkXMhX9i8XNZNL9xIgVMKUWwIuguDYqMPMjEZvP8DCAM7L8LWRArJDM6AF9VI+LTIdMDw95RJZpOiAEZNiS2jH+bXUX4z5XDYqFyke7XvmuMBKmIiYKyWl0LORxuBJ3HDVa6gZ9685Kf/sZXTRM1V7CxA3J3fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrQrQpoM9jXVOm5X1Z9zp0ygGm2l+n58obMquDW0pzU=;
 b=TAl1b6KxWq6ZdIzpP9wf2iqbzkQKt0E8y5yoYgfXFN11PezLeVKAl7EZAWoZIMHia+pPVv5sEiitJrYyf00ML2AD6yt/W1nuh4ssb4X4EVUFx+lw6pjx47rC3nDqfXwn9Nv7rAknKmW9aeKice6UtU9im2L/06STI74ngtjQeZW3XWVTRYIjgShYk4NYvABA7ZHtxhHiyOI3qbBoYaLXiLYUaO6PlH1XsPpRYnXJh+8ySer2a5tIWBC0/iKSdVImvj2f9vaKppNlIbGJRhgp2rpgOSVlPHlR4nzNKB0dI2XDjjGAL1fV89pPFVyoRQq00TOyodu1jrukwL9MdZZnNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9964.eurprd04.prod.outlook.com (2603:10a6:10:4c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 06:33:03 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 06:33:03 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Thu, 16 Oct 2025 14:32:24 +0800
Subject: [PATCH v4 06/14] drm/imx: dc: Add PRG support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-imx8-dc-prefetch-v4-6-dfda347cb3c5@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: e95d08b4-9a0d-4bac-f309-08de0c7ddbf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm5sTlo5SDNFWFVEeFpSZnAxakRzTzBETk9hMmwwWWFrSEVhQnkzem9PTTdT?=
 =?utf-8?B?cXYwNE9DMmY4RnVHZjhLRkpGdFBZOXkvS1N5YzBhQ1NVQ3pBRURjWEVMVEJv?=
 =?utf-8?B?VnE2NWVzZjRyc2NZOU5WSVBRcmhoU0lwZzMyT2VGdVR4SnpjTHFLUlBMS0da?=
 =?utf-8?B?UHBDRDBRQzJTWjVJYzRDdWxyamdmaUVPL01NZ1FPdkRRZHFDWUpMOGtaQWpw?=
 =?utf-8?B?Q280bGhiNU5VdGxORWIzcVZqZmJ4bXlWTlFCWlE3UVA0Y0pVb3lwd2lNcUFp?=
 =?utf-8?B?VXlNeVBsTUE2QnFYZUU5dVVoSGI3WEdWQm5BcDNkK21rTGNxVWRRcFZJZElI?=
 =?utf-8?B?KzdEbS93UzM5WGFNN1lzMGtTQmowbUZRRC9OSHFvS2RNdVhhYVplb21zblR4?=
 =?utf-8?B?RFVsR2w2NXV3bktiWnZMWS9CVXpMUngxcThEc2ZjSkpxZlJOcDNZWkhCTURU?=
 =?utf-8?B?MWFEanFMejVlUkZvYjRLOXZTNUtaSUt6TENZRmhmMHZYWFZLZDlJWmNsTmVF?=
 =?utf-8?B?eXpZV1JkL2d2MklMdkVESFcrRUlhN1FFZjZYYkpTZVYrWTkwTVJSdkJqeGg4?=
 =?utf-8?B?K0NvRnVWYUdta1BCNTdpZDdxbnJqNXNzOHhyN08vTHg1V002WTg0azRwR3J2?=
 =?utf-8?B?S1lONE5VR3BTVnl0anArdndKMXpKdE1IQkI0Uk1qM253TXpXUjhURFFraUE3?=
 =?utf-8?B?QStFLzgwUGlYTWJvendoZ2R5di85Z1ZxVHhTbk5EL2lSLzI2RmlhdEJWWHpV?=
 =?utf-8?B?NmJ3ZE9tTkRqQmZFZ2pkRFZSRC9EaHNMVkZhVDZ6a2Z3cVhDV2FGWlBobkVY?=
 =?utf-8?B?RGxVNXVDWVZKV3E2aVUyZWc1V3BEejUwVTlBdllXaTZxeXNxZHB3SmhZOXN5?=
 =?utf-8?B?bzkyWUVZT1Z6T0liWmFyZnVaM3JXVUk2Vm04WHJpclQyeUYzRlVzQ3I2am1G?=
 =?utf-8?B?c3haR0ZlRUJYK2podGNMVG4wYzZwYlhUaTJXOG1ySDBkNVFqa3U2eXk0WWFN?=
 =?utf-8?B?V1NTTG9HWnR2WHkxMGd1bjIwbnpIN3piUlRyOGNRZXhvNUk5czRiOVQwS2x1?=
 =?utf-8?B?TXdQNG1vRGJFcENEYm82YkVGcDhiVnFncncrV2F0M0lSWStzVEFBVmtEOHF2?=
 =?utf-8?B?WXgySmszT25yeTlPNkxHVXhtb0xTNEwrbjJ4a3B1VGgxanV1L2w3b2FYbDhL?=
 =?utf-8?B?VGI5bFFiRU90c0tzK25TamZseDlRWlZRbWh0TGVtSWFvUFVvTlExREkrZzJw?=
 =?utf-8?B?UE5DZzFFOWV3YU1NVVpSRnB2Q2doQ094UVRUc3g5RENmYmhjSzRHYlRCTkJK?=
 =?utf-8?B?T1pLdjhWODl1OWxYZjBJT2FySTRxMWt2Z3N1cnVHRHZENURkM2k1OGFmdkI4?=
 =?utf-8?B?QXE2dDA5b2ZjT2IzcTE0V0J2QTFDM2VUbHQwUFZESG1jYytMeS8xaEZHR1dM?=
 =?utf-8?B?b0I3Rmpxd3NiRXpHS2dCSUo4ZTJKY2hxZ2ttRmlsdzkxYXd4cEFwSG43RDdR?=
 =?utf-8?B?SHlNK3FlTkFwZGlKcmlGazAxbEV1VFBKS1lPZzB3b2tEU2E3UVYyczlFUDRj?=
 =?utf-8?B?bmNGd1hScVVNdDdTZ3NYMlhzREphUFhXQVB2QkFIUVFQM0RlS1dpUE9aRkYz?=
 =?utf-8?B?MXAzRnNTd05IZHhpVkgwNGJndm4vUmpoVVdjZ2dOVGprTWNKR3FLTVBZRWgv?=
 =?utf-8?B?dmhhOXRTVGswM3YzMlV3RFg3eTdSQmlSUnJ3Tm9CS1lsVmFqcE9VZkFlcHdj?=
 =?utf-8?B?OHFWUklqMnpYOGFHZ2pmU3Rhak1LbG5RWktPdnliZjFtd3ZkY0EzQkJZcnZq?=
 =?utf-8?B?bzVEdVNwcFRPOWxLNVVydUF0YjVjZ05YUHNmcVUwek5QQVl3Q1hpMTBoVEdr?=
 =?utf-8?B?SEp5OERJT2JLVmJTWlh5cDQ3VFZ6QVUzdkk0VDRuVHFvdWd1TUYvUXArVDJF?=
 =?utf-8?B?L05UVEo0aW9STUVpRmczdmZyNkhBa1o3RVpUYks4RTMyT2ppclJIbWszRFBt?=
 =?utf-8?B?U3VFTHVOSmpWSUdaN2Z6K0U5c0hnaEpteFk5Y2R5U2NVcGZkWWd0TDJyYjd1?=
 =?utf-8?B?ZXovbzlMS25ZUTJDdHRpNjZQZ1hpcWkzT1Z5UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejVDTVNtY0lBdjBNWGVPOEh4MW5nOTlzR2dQQ093M1M3K1hBSHkxNFYrc0V6?=
 =?utf-8?B?VTZmTVdNRlgvY2RXMERuZ0VqV2g1dTRlSGNscUc5WFZmU1A4dmI3eGU0Ui9z?=
 =?utf-8?B?RU9NWjFzUG1NQjEvZ1ZSTzc0cHpaSHU1U3VXcjFqaEtkT1MzQWlubFYzNGtt?=
 =?utf-8?B?eFFYL3cvUUtPcVpSMXlkTmNWWVE1blRvNWVDQnB4dWNCcWNBZ1ZvVHY1enRh?=
 =?utf-8?B?UXExcGdJSGd4T1BpTEFGWWUrb1VwRlo5d3Fqbi85Y2hBR1VObEVzdHlyb1Zh?=
 =?utf-8?B?cDkxNkZJYlVtT0FiclpMNklxQTlGNC8xZE9Mc2JvZkhicUZ3eEttNHp0VlBt?=
 =?utf-8?B?RHY1TXZOUmN3ait4cVl1ZHFuWEJUQXBwVjhIWjJFY1dHeDNId1AyVEhzZUFk?=
 =?utf-8?B?YkJhRFBteFVqa29XRlhMcWdGclc1V240cElIL29FT21SQi9YdzZWUGZ4RndY?=
 =?utf-8?B?S0lrekh1MFhnRmkwcnJSTUx6TWo2RGNON21ydFFHRkRJT2pNOURkdm11dmVw?=
 =?utf-8?B?S2JzK0dqNXZvblI1TE9yZVFYTjNONGIxODZOQzhqYmZyOUthVmNzTkNZNk52?=
 =?utf-8?B?dGhheE9hZHoxL1V2NG1QVzI0RGZOYzRzalpqZmRxZCtrV1FDdFYxRHlJSEk2?=
 =?utf-8?B?bHQ0N0N1eStHbFpGRjY3Rmhxb0VjUlMzdVp6akZ5SHhQb05qbDYwSHl0WmhW?=
 =?utf-8?B?QzFaNWpKalFhRkFtODVJaVBQZ2cwSVRJY3R6UzU2SEZSczJXVnFiWFdzNXZm?=
 =?utf-8?B?NjRPOERpVjZhbW9weHY5Uk5EdlZBZjl5V0YzdWh2a012MmhTMjNxbm0vWkpT?=
 =?utf-8?B?VDYzcEdBd2h4TUFCZThxSjVDSHp0TnNqQ05ZMGdTYy9SY0dZU21EaEF1OE5i?=
 =?utf-8?B?bUI2ZENnMEx3UFB4aWpXZmpUTkt4N2RxbzRaV0o4WjlVd2lDcjNweTV4RXpn?=
 =?utf-8?B?bTdualJESldIVGplUElnMW5lMlVPMXhhVnF5YWE2UWkrcUhLcFlkdFVzeisr?=
 =?utf-8?B?cW9mQW1JZm1aVk93Qi9mdE9INkwwZnRuaDlZdnlvZDhBSWZFY2J4c0ZJMGg0?=
 =?utf-8?B?Wm0wYVN6V01ZdFQ0NGp0ZzZzd2tteW4rMk5LL0pnSmRvMnRidXQrV0t1V2NE?=
 =?utf-8?B?dTZhK0xpN1hEZlFsV2ZBSW9pV1ZYOGFQYm5TWVdmc2UyS2t5NTVrOFhISzdu?=
 =?utf-8?B?K2wyR3B2UVp2dElmckY5d3UyYnJxbzNRYU1wcHVVQklhbU0vNktEd21uZU14?=
 =?utf-8?B?Zzhab0o1RjBvbHpEeHFGeE5KWWNsMzI5OWR4VjVOUXlrbTB5d0pYNDArVFNJ?=
 =?utf-8?B?T2RXL2J6TlQ1YnJ3NllNUTR1NWZ4aStYTWVUZ2NBSlB3SUYxSnU2TWdQd250?=
 =?utf-8?B?QkNKUnVtMjRyS0pDTTV6M0tadXJjRmlqbHNkdTllU2JMRG1KZ2JldWZwYkxL?=
 =?utf-8?B?ajRXOEE5UHFwNVlyN1NybWsyamZtN3BRR1dJQkgyUkRXWkxqb0kwTklLYjk3?=
 =?utf-8?B?Vnk5QmgycWhWQUhaRG5vbW1UWkpIVEpxVTRwcE80NVZmVHJQeURFeXhlWFJW?=
 =?utf-8?B?ejVCeDZlemM0UXFrODQyR3FWdDR5L0NXQ1g1dWdsczUwQXBTNzB2ZDlLM0cr?=
 =?utf-8?B?WkxjQlY0MjJ6TklqTi9iQWQzNlFJLzhOelJHUmVFWHpNbmJ0T3lpeDI0Zk1U?=
 =?utf-8?B?WGh6Y01ITHBuK0NkWllBTVFDU3M2UVA4U2RSQ0U2QnFtN1VZMWljYy8wbm9I?=
 =?utf-8?B?WXFlKzcyNnJvcnI2NG1vbmEyZnY4a3VqNmxORXQ4T3duQ0FZcmZxcTVPM05U?=
 =?utf-8?B?NFV2NC9odFdmbkt0NjZNd3FrWEVodmhxRUltVjV1SjdROVFhSFVlbkZRcTI1?=
 =?utf-8?B?dXg2Q2FsOUxRbEEyc3RsYnU1aDNJMHNsNXJjMnEvSkpWdDZ5V0VYeEtMMTc2?=
 =?utf-8?B?RzZhQkY5dXJmQjc1dUdRejJWVytnNUlDRVFoZTgzNmFnb2UrSlU0emZvZHhW?=
 =?utf-8?B?WDgrb3REVVdjUlNFYzdPKzFQK3krMlZoR0lqRXZoUlZkZFVCYk90eENzUXlJ?=
 =?utf-8?B?cTV3MWM5OFNMaEI2QVhtRVBLNnJtN1BYZHpkTlM3TDZNbU9hbHVvSC83SVhH?=
 =?utf-8?Q?cUSDE8QQAkSxCVofOi29Mf5dT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e95d08b4-9a0d-4bac-f309-08de0c7ddbf9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:33:03.6879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqlctnsnfpJNfLqBpttVSsWDTIXqB4UCJYhzFTmZzjrgh07cHwHjCAhZ1PKW3fM6G62QNng0dqI+M1QXF3i3vA==
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

