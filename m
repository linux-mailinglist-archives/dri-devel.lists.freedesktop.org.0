Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688C7C0C670
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA9E10E399;
	Mon, 27 Oct 2025 08:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="JaHfImDh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010058.outbound.protection.outlook.com [52.101.84.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2C010E399
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:47:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXT5uMpiIzoHkpSD0nBxyouNtfzCjr4pcr+qZjV8D0NV7E23juXAKR6a3JaY8NMzpRvsCC82GxdPYIdzkY775JWSlAk+vQdSR6XXLWF94B1dS8yLStOFl+NmEHzhh7vg0gcACVbLeNP+KYZ9G3+FhKx9TRBUCcfkw2bWJ+gCvpNlidRiYOkJQQNeDEL4lkwdFIfYi6ksAx1pF3rM4BrZ6CmAY5lHb2cHhoxjUY/0DuYbzFQ0iz0+Modx3ZbwTzdfBATQNfKjbgoeTCBz5VvWHYTmjQtMrqfG9N2kq5nbpjZWWpCQrfCLLyAyY//6aZtFbaqmPMhERKe627q4y0pIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8hIWmhjvQ3L2ok6boVjVUHBrxXYMXGfAqWIjd2G2vI=;
 b=kxCD3FjWPO9bmXvZXrkSf10pivd5o+JQnFzOtVIe3LwO5grAvKg53tUG4f2zzR6oelbsaIf+BuyiobPmBWMyClPRjwH1zxzRahYvfnNSyqp/3/Yz1rQa4mPelX1zlGGuIPkgwB4OH24RMoERYS82AHcWWuAaUYHBTTRmN0AYdl/atHMBfOGGn9NUfnHun/MJxcrrE9k2Tje7MRa50mUoLzR7geVMwODrd3Y+7X3yg5025URACBj5/vsDaLGncTWHxBPKp2nKzIAtjxhZ31rMHd8HSupNdDC6tJI/x9B+lCUK1LJt8J7f8xOSYaepCVCcRTG0Tb+UmR3yi/WemoK1yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8hIWmhjvQ3L2ok6boVjVUHBrxXYMXGfAqWIjd2G2vI=;
 b=JaHfImDhE9Akykih+FHlYdKjiVNL921jihc6EbeCmlhjf0xNyLn4teGv+R6HvAMGSGfx7qwyH9ua21acFRLDSFcwFizw71nZG3iAbjp6vvx70+UAxAn676QQ02oJumE4vm9FBgmwqbTn+JG6RgHvwUGMt7XnBSObKQFuc9TC7WhYLysFE2ZjwM43e3y9Tafzq4lqU8F4AlshkerHaDqT5YfgDk4crzbLgkoMDUcJHwWKx/fSxBbLMN1TIT7bu1nTfUq7hoOn/YqP9xjJ1elO31hI9RDj6Ng4RZ04mDPGkDqFPzqXkbxz2+ky701lGkje6mSQxyd0XhTIDwhCny6S9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8739.eurprd04.prod.outlook.com (2603:10a6:20b:42c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:47:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:47:01 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 27 Oct 2025 16:46:52 +0800
Subject: [PATCH v5 02/13] dt-bindings: display: imx: Add i.MX8qxp/qm DPR
 channel binding
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8-dc-prefetch-v5-2-4ecb6c6d4941@nxp.com>
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
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 217aec5d-240c-485b-1f46-08de15356525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGlMSzFGU1dOVlhBbGg4RS9uWDRmU09nbnpNT05KdDVEd1o2RGhDQnNYUFBE?=
 =?utf-8?B?aThVc2xmL2dTQXBOUHhNMEcrT2U2YzRtU0cwU29xQTFNNlRSUzlhZjBranRk?=
 =?utf-8?B?aVNleUlEaVpVNjZ1TXlMYUYwK3VQU3A1c2dqZkJzRFdnL3UxdVN2bEtLcGl5?=
 =?utf-8?B?Sm92bXFMTnFCVm5semVDNlNIcnNwaWNrc2Z4UXNML3ZoZ1FUazE0czE2UXVY?=
 =?utf-8?B?YzJpcitsRGc2SzlsMkwxemI3U0lVcll1SXJ3Y3BaOU5pNnFhNUNRVkwvZnUw?=
 =?utf-8?B?N1MyS2RFQVZkczQ5aDAwcllTU3AzdE5uM1BZN0o4VDdBSVJsaHdWMUNsbWN1?=
 =?utf-8?B?dis5TXJGak9yb0RKSURQYTV0dlVtaU5uZkViYk5yMnNqdmRSaXlad29FeWVy?=
 =?utf-8?B?MW5XTG5vaURGOCs2RkU1RnFLM2xCNGczTkd4RDJxZlBneGJOd0hiaDdNejRZ?=
 =?utf-8?B?YWZZOFo4bm1XV3pzQ3ZuM2xtRURvQWgwSVVwMTJPU3BQdnI4aTY2c2t6MmZ0?=
 =?utf-8?B?MG1HSy95bWJPeEVBZWgzbDl6TE43Zm5hWnZYbkFoV3VzVW5jTlRNZmdWMkN3?=
 =?utf-8?B?UXFCcWZBUGZKYTVzNkt2RTRRazAzYW5VNHpRcjBXa0owbzlpaVB4QXBSaDhW?=
 =?utf-8?B?Nmg0OVZDREZGRzJJNm9aSnJSZ1FONWVIMDQxQjFvUm5IVVFBK1NBUCtFakVn?=
 =?utf-8?B?aVZ3WEY3ajZrUDZaL3htQU1FelhObElJRzk5ZWlNTU1YOCtSbndTam1KQ1k2?=
 =?utf-8?B?SlFTckZXanhkOVpPQ3IwVXhQVkI5Ykl0QWhqemJGdG1RbG85V01qRko4YXg4?=
 =?utf-8?B?aUo1UTVJOGgyWjF4Tk1WZE1SOXU0Y01ocUtCV25TUWtBa2tKYk5hMHdwVWZP?=
 =?utf-8?B?WEpncVhBWmhNQnhoYWpheTdTMTl3eWJ2UnVNRnVtQ1N2Z05hQnU5ell5NmJJ?=
 =?utf-8?B?WGRFK2paQ2Y2UVkwRTEyR05wWm91eVJ6MncyUnZObnd6T1ZuTmtUV0tDRXRR?=
 =?utf-8?B?Ukc2TUt4Y1pnc0hvV0xLWkcxaFRudjY1NWVqWnRKMjRxUjkxeE9qOHNwRjFj?=
 =?utf-8?B?UGxaQjQ0alRuMXJodys2dk1RWkYwcGNJL1pzaG1xUUhFWDdUT081aTFYY0Ru?=
 =?utf-8?B?TkZIS0tkTUFiWmlTcUZ5Z0ZDMkhhZm9yQmJWYjJxYk1TR0Q2TVUrZWI5bC9Y?=
 =?utf-8?B?UW5nRkdGdHFYSjJNUWhkTnc5MUhOMVZIeG52aHBUNjVCZ1JPYWVOVEpmdzFK?=
 =?utf-8?B?dm54VUdiVDdZalQvUk9sQkRVcDNHMTZ1dzVJSlNCREh3YWlaM1U0K3N6ekli?=
 =?utf-8?B?cEVwMHZKOUxzNmNVZ0FERVZyMFB0cC93Ym9NWkFYMUYwRk5mWjlvZ0oraEJP?=
 =?utf-8?B?Qi8xYm1LbDQ0bzd4RDVkY3Rubk5VZVN3aWVFYW1iNVBCakNOTFk3OEMyK1pl?=
 =?utf-8?B?STZCMnJKRG9EUk5qVkFiYi9nMGh4eExIZXNlQmVua3RpSUhIVUNjMTBia3ZD?=
 =?utf-8?B?MjdvcFdBbU90NjFqNGszZkdPRS96aGlDNk5ndzh6Q3M3SEF0aHRpLzBvMEtN?=
 =?utf-8?B?NUhNaFhSNUF4YVA3a3MwUVhqeVZlU09BUXNtRWlvQm5TVjRpRVVTYTFVY21L?=
 =?utf-8?B?VjgxQXU3RlRZOWZsZlhPdWgwNHJLTVJERndlR3Vlemh1N016S1dzYVRIS1pM?=
 =?utf-8?B?NlhVbjA4QWdaRFk1VEhTQWp2TkpXK0FZUytnRDNVMEIrbzFFbXc2TGFjQUVB?=
 =?utf-8?B?TElldHF3N0FET1oyc0xKL2FHRkdhcHZHV09hZ1BSejVnNDZ6NXl0K1VsQldv?=
 =?utf-8?B?MVZ4NU55dTZEK0pQNE53TTY2RTNSdnBIV2t4V3crZUFLV0IrS0FMQVVmWjJV?=
 =?utf-8?B?U1JaVnQ4ZzNIS3hnTFlnSHptTm1hSXR2QUJwWlY0b2F2eW9LdlBpWjBEclpG?=
 =?utf-8?B?aFluY2N5WXRxNWNtVkxuSHdnaUdVNkwrYmVRSnlyNEZ5SU1IR3VuU3UvNTdk?=
 =?utf-8?Q?QDMoZ8BVRMVjemg+YIJGci2iAi3QP8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0VQdnZvYU1yeGNEM2xJMWMwZGlQcjRQOExPZS9ZTDd2TndveVBXSlcvN0Ns?=
 =?utf-8?B?TUxSSzNrVmtYMWczWmwyWTArcWNjdUJPNUlUQXhLcWk2Y2dBTHlWUVA4enY5?=
 =?utf-8?B?NTR3bm1FUi9EQWFhTCtwOS9xV2ozanJydkV0ZXJZQTZISmYwOExZMmxBS0Zu?=
 =?utf-8?B?eXZYd3lQYmRGU0hYMjUxQ24wQTBXVEdBM3UrNmRDTHYxR2pFZDNnbkt3UTRu?=
 =?utf-8?B?eTlHMGJQRVlJTEc0RzJ3dU83T1NQWWFoRmV3M3JpY3V3Vi9OZW5xcGdaRmMw?=
 =?utf-8?B?Q1Z0emViU1h3NTh5T0xjRFlVSC9aZTBHcUJPcGRNM3d4VGRJdm1COGVwbE5S?=
 =?utf-8?B?N3NPMDVnS0tNOFBYWmU2Si9JazJrenZTWGhTMzNCMi9WbzhTN0E3d20rWEI2?=
 =?utf-8?B?cEJEUGR6Rjl5WUNrditPSnM2em1RS00vcGMvUVMwSy9PU3E4NHYwdFZtMmtp?=
 =?utf-8?B?NDFNSkRHSWNmQ1QrVWd1UXpCYmxHWXFDYlQ4VWk1WVlNcW1RZ1F3VlhsL0Z4?=
 =?utf-8?B?dXlPTTZXRFRXRm9EN2lnNmRYUVBQWmR0WVJ4SFlGMXlqSDNIVFZyVi9XU2Q0?=
 =?utf-8?B?VS9YRlRJcXZ5aytlZlJlbWs3eWRGR1lCRnd2VnU0dnl6cGxPSXorSW14NVNm?=
 =?utf-8?B?N0JzeFlyWWM0cktGMHIzZVFUTVRmQTFuQTNjemRZQUdDcWpSWTZRMlVYZ0VK?=
 =?utf-8?B?NE5rUHRmQmJKOXh3NHBQK0g5bWY5MVZwUHc0T0ppK0x4VGpEaFh3bVVpTUY1?=
 =?utf-8?B?c0ZWMHFiWVJNMlUyZlRqZTZZcHh5a2ludUgwZ2tzVUFXTTA5cEUxdTVOWElN?=
 =?utf-8?B?UkpHc0dxNDR1czRWTVBDVmJKaUp3OXlGeCsyL1RjZTZOVGpsUEJXNUZOTkdm?=
 =?utf-8?B?RHJPSG9xMExLVVNxazM3V0N3bys5MFJ4YzJsMzBuZDF0YXpsczMwTHpYdmNK?=
 =?utf-8?B?cEZrVGFjT0svbS8zMGp6SjR1Ny9sRERodCtYUmpQc2hONFVGWnRVamNpNG94?=
 =?utf-8?B?eTVmVnV5eTJvd3krd2YyR2NROG1leGVJbVlJY20wOUgvcktCempCWEVOMk5J?=
 =?utf-8?B?ZXAwL3VHNHJvMktIK0p5NlladFBpbi9LY3BiZzZxWE9iWXBhbGxwTmFjVkI4?=
 =?utf-8?B?Ry9EQ3doQVhCRW9UdmpyRnRzMW5JWkVDWmFFcUkzYk53dm1VdC9JWlpVd01B?=
 =?utf-8?B?S2plbC9RYUZVZTJHd0xWU1dodDIvaHY5aEhvMUlGSjZjYzljTTR6OS9GdnpS?=
 =?utf-8?B?S0VCNmV5TGRkTWJUaS9RTGNSTzN0cVR4MkVlWFhnaXhkZUM2R05rUUtROHJm?=
 =?utf-8?B?TitvSXF2UElnTUpjZFNKejZBN3lzb3ZOYU0wYzJ5N24xZ20vcXp1a0RlVWJa?=
 =?utf-8?B?MGVoa3dWbGY0ZVc5UUo5Z0REK3hyS0J0eFkxdzFLR2dOV01VOUNKcWJJZGRI?=
 =?utf-8?B?QUdrcGthYldjRGRMRCs4NjkxaTdZUHVDR1BDNkFRY1pkVmQ5ZmpOaHBRRWFP?=
 =?utf-8?B?ZG9tSld4clpua25kcmJyRWFtcHEzMVZHS0dGb0Q3SWQ5Vm1vaGJ2dkt0WEQw?=
 =?utf-8?B?TFNibkc1RTkxMHV1RkFvWldDOEFqR1piUWdFRjJpck1va0NWMzZXUUhGUVlJ?=
 =?utf-8?B?Ti9jaGdsdkZLVFlkamFHZUdPc3Y3bnNWY0hvYmtocGZEbjJ3SVIrUkRnWVhp?=
 =?utf-8?B?QjRkVjhGZGdKeUJZTzF2U08wTzlvSThkVkVqWEoxbVlyUitGZFpKMW0yVWM4?=
 =?utf-8?B?aTR3eVVOVzk3NHk0YzJidmVmVXZrb3AxckVLMWozYUwxOTQvRVZ2RjNwV2RK?=
 =?utf-8?B?TnpGUVU4cGlvN2h2UFpSUUFvWXhZUkI5YjM1TzJDK1J0R2l2M3d6NDdzOThR?=
 =?utf-8?B?bEd6V0Y1WjhPczk3OHcwYk5ScUZuNER6K2ZOY1RRR3BDWlc0SjVrS1crQVhQ?=
 =?utf-8?B?d2krOStKWHJNdnU3c0xZSVhtc29LQUQ5UGlWdlFEV1ZySzZyVVFpOUh5cDkr?=
 =?utf-8?B?N2lmaTJrY2ZFQU1SVHdiR0Fwa01nZ29hTnJ2K3RKR1g0b1B5TTdwVkRFZFpq?=
 =?utf-8?B?RTJQU1RzZGlDYzhuMGN6YmJkSmFSdndTakI3Y1RaMXZOaFN3ek9ic1hDK01x?=
 =?utf-8?Q?JdElaQLv6qIOk54LfYZx+ImYy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 217aec5d-240c-485b-1f46-08de15356525
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:47:00.8983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwYrNbhM6j8i/Qn7jpLGjUkdIYJWRBsa+PE4Nxy9yXgSsrWkez8p9g1IqNWxN9zj15pDWnVtbuccRwREmsxObg==
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

Add bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Changed commit message to use imperative mood.

v5:
- Add the DT binding file in MAINTAINERS.  (Krzysztof)
---
 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 100 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 101 insertions(+)

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
diff --git a/MAINTAINERS b/MAINTAINERS
index ba8201b99d0d45f8289462963a43c78b769e05a9..a816b626da6d05b70ee6fc90f83911ebb4e12e06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8332,6 +8332,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc*.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
 F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
 F:	drivers/gpu/drm/imx/dc/
 

-- 
2.34.1

