Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F29BDDA4E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 11:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5592F10E107;
	Wed, 15 Oct 2025 09:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="STlq5bT2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013022.outbound.protection.outlook.com [52.101.72.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB0E10E107
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 09:13:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvgdiA+iMvnwH2div74MqW9jqBlTAoOgx5cS07JDIRlFhIfoXC1IfwRLOfxS7xSoubSuly/FfU47t+XIGk6Kx3pNAxVkYi6NiLjD2qbm1XlGUFwbKkhOsZOaUsAu+bLGCM1DhiXtT3eYTBx1/u2Us3NNFnnWhMIHEPKLzs2KdTT5kOZOhc9YAxahZLscJN67Xd6l2jWWk32r56qj4BLAf8mOqKdWIp2GkB268m6FGLQ8aIbs76X0cSbHUOxVJvGebtQDzRoqPBV2IJP9s5GJy3Dfq9lH3PUpnLDnp6yhXjgz0SswRTf+T6RIqLuCJvBivYwYxCBU0GO0wpdGAlebzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZrxxGI3KmLwlppHUmEApuSuioKy3TyjBhwDUlICoF4=;
 b=GD7EsTQMSMO/LCypNr0c9w6p/LSfRyRXVlPGIXn2d4zfIqbbo+aWZq8n44gk7AgavUcQWHoHlBdjWCLSVqwoDYgeeOs8bO2TyNFWn+b4eRQ7PJdlPQEYU4qCgOFmANZhlL3MUi3ASuPWH9JKfAktK+EH3ruG9bG3yQrqOaRd4m7Zzyoo8czdETVHQg8HjMtDimSWZMJ6IjZPfH11WMMNAzjJ+TomDwX06f8rA5IK3sanaCwWOjHkkpAYOpYjKAHyXKrlV19pPufhEdk1/104UQyQGU9BEmssq9OHzA0lpNwjNufgr5p16cDdqTP7lv5xyQNH60JxMAr9tb6bj2VjYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZrxxGI3KmLwlppHUmEApuSuioKy3TyjBhwDUlICoF4=;
 b=STlq5bT201Hzaf4zw4TsQ8mKYJlt4S8bV8X94FvWCaFqNEyipeA9qVn0zao6JHSshgaahNmnvVCikGGkClpuCiHJFE832s19QUVSJZoqbgZO2s5KBSCgBoOsD2pWmtiuldTiCMxbU/0UCAfyJdZ/EJNNpqMx4R+xRKJucdRh0cGl1hcali3bskz45/dWC363qEYpOhskfI0Z9yM+xAQmdWbVIRewENh5ZSvhV7TGmy9W7uvGRIV0mXqqgjPB4lJzLsmCmTlKoE0lcW/TR3e121ehkuPckLZ2fpNFg7Rj0/2cBh8mQiw7CWJ9oIfKlHbNzShY0xTpXZfx6h5XOzCoGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB9004.eurprd04.prod.outlook.com (2603:10a6:20b:40b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 09:13:39 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 09:13:39 +0000
Message-ID: <be6bc134-1dfc-4cd5-8f1b-cd5431828eb3@nxp.com>
Date: Wed, 15 Oct 2025 17:14:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/39] drm/imx: dc: Rework dc_subdev_get_id() to drop
 ARRAY_SIZE() use
To: Marek Vasut <marek.vasut@mailbox.org>, Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-6-marek.vasut@mailbox.org>
 <aO0vLbkpXejre2Ta@lizhi-Precision-Tower-5810>
 <c7fee270-f3ff-402f-8266-0ffbb5077a61@mailbox.org>
 <aO5oKe14GLp3diGH@lizhi-Precision-Tower-5810>
 <43e3e005-5d30-4450-8dbc-8c6b5a0fa951@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <43e3e005-5d30-4450-8dbc-8c6b5a0fa951@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0190.apcprd06.prod.outlook.com (2603:1096:4:1::22)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB9004:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de24c49-648c-4ca4-7ba5-08de0bcb20f4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGVzRkc5ZGNKNkFFbVRUUnlRWUtMM1hGSklRNDl0NXJjTmtmTXNwcENpUTMz?=
 =?utf-8?B?SWZ3clZRUWRKQVNkODNDRXBJZFJwUFdlSno0bE9XcngxWXlPV2VoU0lTQWl0?=
 =?utf-8?B?SzVsNG4wNW5YRVYrNEkvcGIxeUd1UUhUYTNQR2trbG1RNFY2WGZKNCtKY2lx?=
 =?utf-8?B?TjZDdWI1MWpkS21uN1V1QTBBTkxjcUZjNmhwUlZFcFdWeERDRXZneXdVOGhN?=
 =?utf-8?B?bjM1eTdrdmtZa0N6UWlhbUtCcDdWTHdZekhCTk5SR2lmTXU5UDIvZ1gvT1ZC?=
 =?utf-8?B?VjVQLy82K0RSRGNxaXVFK1krL1RQc2U2VDRNRkJFUFRGOXV3YkpzVENRVndD?=
 =?utf-8?B?cG1tQStXaWE3ZW4xVGJGL0xaZW5VNU9OVTFCM0N0RjllS0NBSzdLbytvVmFQ?=
 =?utf-8?B?ZGNOaUZ5ZVVxcEloeUN3eDFmOXM2eWtnMVFWWEpjamtOc2doa1p4dStkOUZI?=
 =?utf-8?B?dnBDY1IrNHFIcUtQOXJpR3hmTy9lTW42aWlFR1Jac0RRZUZudzIzRmpVQnZR?=
 =?utf-8?B?S053Z1R2T01QY1FlM0YxRkxBQzZJQWZTUGZuamQvbVY5ZHRIcVMyMGlpQTZ0?=
 =?utf-8?B?Q1REYWJPbEU0REROYkYrM0FHaGhzb3ZaSEc0VGJYTlZDODhoTFRDeEt6NnBn?=
 =?utf-8?B?SjRsRDZEZVd5bkkxUmNESm9rWjUzN2k1dXJMSUxqK296OFpPQmlPK29BUlFz?=
 =?utf-8?B?Uk1oQ3NFZDl1Q051SlJERW14VnFEQWdFZC9ULzZIcExQR0dTRFU3N0VlY1lB?=
 =?utf-8?B?SXpaM3NoN1JQcmNNNkJDSi95RnhWUzhEYStyWlRFZER6V3dMZVBCdHdjMHRK?=
 =?utf-8?B?dG9xSTljSjc2Z1BvYm1DMExpZm42R2Zoc3lYS3dsQ2lTbWxmVG5oS2dwTzlH?=
 =?utf-8?B?Z25ZczM2VlNYNyswTTl4Nm0rdGVXZnB1aDYzU05BQUU1alN0aDZsTDhtd0NP?=
 =?utf-8?B?WjFjODhrZGtoSmZOY09TNWpjN2xqck1UM21aVFZYUVF5MFd3bmpQemVPVFU3?=
 =?utf-8?B?bHVTdXBITWc4eEgwdDlBcW9WTXZ6clVTNVd5a3VSNmpvRFljVkwrT1BGaXFN?=
 =?utf-8?B?aHVBNTk0ZUJYbmJ3QkNmVWRKMG9JZW9WNElUUWhCWktjUzFubXZ6dFc4cUlt?=
 =?utf-8?B?SHdCb0tyenFhNWQxL0hoaFd4OW55OHdYUW92WmNpVWc1cXpFZnNieitTbE5U?=
 =?utf-8?B?KzBGbjJONFBXZmhMbnQvZ3AvcEd5WUxVZU0yc0RJUnl6VkdyeFlmc0ZQdGE1?=
 =?utf-8?B?cDJwdVFhVmVFampINjM0L05ERXk5MWRjTUxPYXpXSG1YZEx0dUo2RUNJOTdU?=
 =?utf-8?B?anhueUQ0Z2RKejlyeFNMSWs2czRCTVU2RHNoY1NiRU5ZbW9SSHZ1QURYVEEv?=
 =?utf-8?B?MDEvU2xJRmdiYlI4SmZINkhaSGl5U3JKWnJqQ0lhdVZ3UXRKTXpydUE2OEMx?=
 =?utf-8?B?SklzeTExY1hoYkJUb3lncjdzTVZ5dmdSRUMrdWN0NnhRa1NOckorNFQ5c2NH?=
 =?utf-8?B?ZVZFQWpLTUpKWWNnbFd0Y05LNzlMcTgvOXdOaEUzL3llYXpLaHZNTDR1eVBL?=
 =?utf-8?B?RnhTWDNJazBaTkdidVNxdFhnM2YybDZ3Q0FKRTA0b3VudlhFaHhPK3RFanFY?=
 =?utf-8?B?RVBGWnI4akI5VVIwQk83aHp2eUsweG1OZlZreVNGaGlIWjB3cGhsQ1Nlajd2?=
 =?utf-8?B?ZjNQNnMwWlIzZW1FNmdjTVEvd1l2SDJidm9XTStDYkFnVTFJakM5ZlhpZXlX?=
 =?utf-8?B?NWUwbmp5NXZ3RGVCd2NZYXZMNlR3bElFV2todkEvalNQdGVYem5QRTl3UVBD?=
 =?utf-8?B?TjFiZTAwaStlSUtMZTAzWVRjdEtoUG9sRkl1R3RyWi84ZCt2NUY0ck1MNmY1?=
 =?utf-8?B?bzRuWnNvNWRxT0Q3U2RQRElrVzNxTWFyY3ExdHlSQmoyM2M4NStSOHY0cDV3?=
 =?utf-8?Q?hgehn3GtOmKTF51EQ57Qc2p8o+U8mFAR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW01VWxKcHVUa1lKMlJoczRUS2lrand6NStxR0VHQ0k3MGZncUdGaG1KT0Nv?=
 =?utf-8?B?SWpnMkY1eGs2ZjlKNURxUkVocnJac0NNMDlwRFFqK2R3MVFzWEJrbEFBbXgv?=
 =?utf-8?B?bS95WERrQ0VqYVRaRTZuTFQ3YVhLMUNlSC9MTEZRWGxSTmJpM3N1OGo4Ukcr?=
 =?utf-8?B?UWNPUXRvcS9QVWhOWFRIOWkwQWE5RXp0QWZhVlArZjY2UG5ROVF0elVjajBz?=
 =?utf-8?B?dDdTZEtZNDc3S2J1dFlUNXRjUjVid010OVMzUkZJc1N1YUo5Nkt4dndmZGcy?=
 =?utf-8?B?K1dINys2dlhLYnpZRlJjeXZyajByRHNWcTJwanhMcS9MdW0xNHowR2xmWEJD?=
 =?utf-8?B?M2lscU5VbGtTaU42RCtxK1o5aVRGUUdWeWNha0dnUnRhOUoxYVRoOHNJVjFL?=
 =?utf-8?B?TUh6bEMvbzlNTEIweDdpVXBWaHdONndUMTgzUTdUdHVCZHJ2WWJ6cmxOWmFH?=
 =?utf-8?B?MW1iWDlRVkh5blBjaFErMHNlVFk0Z3MreGduUEphYTREYXhROFdpVEtUbHJs?=
 =?utf-8?B?dEVCejJCbEdsNjM0emdwcVhHMWI2QzVmZVllb1pWSEJxTmkvemJaOHNPazdo?=
 =?utf-8?B?TTg3SVdWQ3NMVWdZWWJ3VC9QOENlcW5vTGtSQWFVcFF1OHkvaFJlZFhabGRV?=
 =?utf-8?B?QlpFdXAxRmwvMGNVYXBTVVpyamRHTTFtWWxCRkN5dFhNclJ6TXNWSmJCbkRS?=
 =?utf-8?B?YzkxY3VkeVRwNG9ZbE9ILy9wL0gzWE1paGxMTGFTZXgvOGJYMmUveUNtZU96?=
 =?utf-8?B?VTdZNXg4NklYR1NBekg2Qm1uYVcySGdLTkswUHRlTkxNcEZ6RDFRcERQdmdC?=
 =?utf-8?B?dE5wMzF6ODJBcDFnK295NVJhSUw5T3JxaGlUWkM2V1BzZVd0QzZvZ0VkUEcz?=
 =?utf-8?B?cnhvYnhkcG52Nk96SUtoNHdZcFJac1c1MzVKdXUwL0IxOHNmNG9udXdIZkI3?=
 =?utf-8?B?Y0J2UmJwM29sbVEzS3dCQWY5YUFsSUhPZkJKbXBtZlFqOHNHdVI3WFI3VXo4?=
 =?utf-8?B?OEZPTzNzaUJtRVp3Nzd3MXZ0NWlrZjN4V2VhbnUxdUNtb1Z6aVRjVjY3aHBl?=
 =?utf-8?B?UFlkeS81cmZNMjE4SkJwNkMxWHl2S0ljSGxhajZQSFh2TklzcXhKMDZSS2RG?=
 =?utf-8?B?dGVCUVpGQ2Y3cVBKbjlhdHRxeEcvRUVCS1BPclFuak5nQ0lLZnJZZXhZb09o?=
 =?utf-8?B?T0dMcElsbGtPa25CNUEvOG96ZTlpcVFITDhqMzdhSnZsMG56QzliUmJ4a2d3?=
 =?utf-8?B?eVRzemFaK1VUTVFsa1hCNWJmWEY5RWRUNlFTNHUzcWZOa1grOFFlQ1pDd05F?=
 =?utf-8?B?WG5HL2xxNU10YkZ1MkhUbnFqVUdFTG05TzlhVGNNSHlIbXkrb3A0bThTQlNT?=
 =?utf-8?B?aDRPTW0rN1duTm43bDhhM0ZKZFo5dUNEdjJrRmJpRjJocTFZTlBLMlgrbmJ6?=
 =?utf-8?B?a0dVemRRdERyVncxa2NNZ1RnR3VrVjlUUjY0bEpZNmFha0x1ZVhYRTNKS3pV?=
 =?utf-8?B?WGI4M0s3RXhVaVdPOTFqUVd2cm5VdWxDREpVSDFpMSs5bTBEUk9aYWVkWmdI?=
 =?utf-8?B?YjZSOWkvVU8reE8rbi9ucUFyemwwTERhQzkxNWJwbElnL29zbmZIT3p0OEJk?=
 =?utf-8?B?eS9oNHB6VXZCZjk4YUVsU1lTc2liVWRteThBVTBORFY4eEdweTJ1YlBDR0JL?=
 =?utf-8?B?bWhJZ2gxNldYWmhOSFJwUk5SbENPQTF6YzhQZ2duSHd3bGk5WWQzbXpHRVU3?=
 =?utf-8?B?MU9xUWlqWkpnZVdueWRUeE5FeXpHVEhvYmhML3Znd2M0bm55aXhNS3BLYUdo?=
 =?utf-8?B?SStjWWJtdXFJMkdpUDlMaHllbjBpSzFPdzVZQmFRa3JhWE1uVEcxVkZ1RGd4?=
 =?utf-8?B?aVlQbzkxVjQrT0Z2WlM4MlpPMStjTGNKaldCZE96cGI1cXE3eG1QbTVKS0pQ?=
 =?utf-8?B?dmFkOUJGK1Yycmx0UjZVdDFvT1J6VW01eU8vMTZqNDV2K2UyVngzWCtQWjZY?=
 =?utf-8?B?aHZzNTRhSlFsLzlMQy9VL05TMFdVZm5FQ0dYMFk0bWw3RVhTVDlmaWVqWHlm?=
 =?utf-8?B?d3BFcGV3UWVuNFhjc3FESysvV3hOK2YwS2dLdUVlNlBvM2pRY3BSc1hWRkwz?=
 =?utf-8?Q?0xW+5Ra/K5C8dqRPcreqpb7EA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de24c49-648c-4ca4-7ba5-08de0bcb20f4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 09:13:39.4581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEfC/hgutro91o/h8hW2dklfhFgESDIFkLsBsgR/A+JqGEc/V1gsbuWDVaE9gtlGCmV6AfuM99pd0+h/PAqm+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9004
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

On 10/14/2025, Marek Vasut wrote:
> On 10/14/25 5:11 PM, Frank Li wrote:
>> On Tue, Oct 14, 2025 at 04:03:37PM +0200, Marek Vasut wrote:
>>> On 10/13/25 6:56 PM, Frank Li wrote:
>>>> On Sat, Oct 11, 2025 at 06:51:20PM +0200, Marek Vasut wrote:
>>>>> Rework dc_subdev_get_id() to drop ARRAY_SIZE() use and use empty trailing
>>>>> entry in each ID look up array instead. This allows passing of those arrays
>>>>> around as OF match data, which will be useful when using this pipeline on
>>>>> i.MX95, which has different address-to-ID mapping.
>>>>>
>>>>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>>>>
>>>> This change is okay. but my questions is why need map register to id.
>>>
>>> This seems to be a recurring pattern in the driver, where some components
>>> need to find other components to link with them. The mapping is fixed, and
>>> since the DT does not encode link IDs, the resolution of the mapping has to
>>> happen by mapping the component base addresses to the IDs first.
>>
>> In graphic link, port@<n>, n should be id? why not use it?
> I suspect you could model the relationships between the DC blocks using OF
> graph, yes. I also suspect that description would be very complex in
> DT, considering the amount of blocks and links this device contains. I
> suspect this is why there is no such DT description using OF graph.

Yes.  The design decision was made to avoid using OF graph to describe
links between DC blocks due to the complexity.

> 
> I think it might also be good to talk to Liu directly about the original design
> decision and why this id mapping was done the way it was done,
> they should know better than me.


-- 
Regards,
Liu Ying
