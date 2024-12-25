Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6B49FC3ED
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 08:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9D410E0D7;
	Wed, 25 Dec 2024 07:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="GZg0MgaB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2075.outbound.protection.outlook.com [40.107.105.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F4010E0EC
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 07:18:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcCYe8ecEi8wVrgcj6qWRQAnmHR+a5DHh3rDvfrti2+Xxi2hwETfoDlK9uL8XehjKHFHNdjgvXN9AI4C5TMBADTtXD+6JQua/ib3NzLnlzVz61s06lhxWfN7/8hSqhwDdsBaqMK8/Bp3zMOxuZ5QcFIpQ52eGXcLj32/qZ6IxD8VevIasNh3lIOPIv3fvm1skRVNyrfovb2+HKNHuEFCT7n0i/vGRyYSV+G7B8p+heSBiu+DUETzuu8BIrhDqrypfYJDYT6IMvRVZu1bLOlFwNo5DWbC3jDF79p9/Vfht4vlD93KsCYUN+CnSDDJipqyTr3G32z4v2xuYM0f19ZoLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCgHPs26ufECo34ddwu0xg3ta4SqT6OR1eydtGApKp4=;
 b=QDG5E1F4Vus1EhGGVtcRj36WBHH5NwHXxNBUplso7IZgfED9QVGeFfIBU15MaC9Hl/7hhdlLIbulo3HMK7ymGBFpQIoo1fqXJhsnbpVHpsXimEv/wT5bMrBTM0AdQya9b81IdrF6i9dCL+bT2KssypsORDjLy/e/mXiJj8F9aTF5IttkykV/ihMLciQTSWCA4PV4cAHNb6GHrwxIpzYAuebd/Crj3ptTvfUXkkLhbpu0VTF18pqXLyCvUBIa1R/8GV/yCdjOqwll16dS1L95Yw19ROeJUSil+HTsEegGcLly8TxDG5XnFj1ITZ+x5/DepoYv5zyS/SD1zG7+l2Cmfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCgHPs26ufECo34ddwu0xg3ta4SqT6OR1eydtGApKp4=;
 b=GZg0MgaBuRsnMCZ8resfhYvw2gxbEu7wKveTPTw5ZY1iCE5nPK9fwDvqlpZMQWpgHvgWDIbC6bSgO3oPd5wPg7f9YSYtkfhWSX2nmKha3yYYIASYaVYi4fUPeR62TVf7UQmBDQ/Vc3bEvhQbeMgHu2tONf7E3oT3wg3ixIg61MzHvXUH9Y0zw65vetEmdD/M3V6jN0QDP4jE778X9xm3xjMkRuaDD6UD3tX7gnf6b4OVb5CPKxV5MXkijl9+XT5RxOAEy/7Y0OKPJdLOFc3Vr6JeHEc+woJ7OiJymvh351ir49HjDEQ4uIe2FSZptxKHbfOHNUZsu/VjGmRMRu62JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM8PR04MB7252.eurprd04.prod.outlook.com (2603:10a6:20b:1da::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Wed, 25 Dec
 2024 07:18:47 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Wed, 25 Dec 2024
 07:18:47 +0000
Message-ID: <77540387-b1ac-46c1-a3c0-afbd34337d61@nxp.com>
Date: Wed, 25 Dec 2024 15:19:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/19] drm/imx: Add i.MX8qxp Display Controller KMS
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, frank.li@nxp.com
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-13-victor.liu@nxp.com>
 <wpxxedxabgo2kxf5wuosu76i5ud3ce2tywm2imhvad4nyy5u2d@qgfhev2hndba>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <wpxxedxabgo2kxf5wuosu76i5ud3ce2tywm2imhvad4nyy5u2d@qgfhev2hndba>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM8PR04MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: b25e2beb-6993-48a9-8d25-08dd24b45f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3E2TENoaU9RNVJnVG8wQTFhbDgycHB4dmU3Nnp6SHNXNE4xVTZFWjdvZm1j?=
 =?utf-8?B?ejFCOUdobmVwS1A2NkdzNlh3QTRWY2VtTVFvVHVVN3A0TFQzM2E4QTZiVXVI?=
 =?utf-8?B?bTRmSFphRUlIdHV2UUtJRjVWYlFIMVRzc3ByQ3BVMXBaLzEyTjMxdmxiNnBI?=
 =?utf-8?B?anVBZVVEYU8xcG5UNDJQNFl1Rmx6N1g0MjQzZlJuQXJzaG0yaXdkaFpxcWh3?=
 =?utf-8?B?NWVPVWZWcWo3dFpZeWh5RHpDQkYxYmVFMGJSTFFuVmg1alNkTUhPZUhEOW9L?=
 =?utf-8?B?d3dpYWFweE9aSkdhQVlvRnQ4TnNCVWc2MVY4Q1d3QmtZQStmbDVoYlBvU0NN?=
 =?utf-8?B?VmNJUHMzdGVsYi90blFmYWJYQXV6QlhZSnE4dk52UExwa0FqRzluWktZS1VO?=
 =?utf-8?B?aUdLN0xhTGJuTmp2aDEvU1c1SE1VTXduSWVFMGY1b2JIUXNCaHk1SUowRllX?=
 =?utf-8?B?aFZraGc2NXBaMjJzNno3anJJMWFrenhKTHY4RjJOcUlpUWxGaVVXVGIwcWVX?=
 =?utf-8?B?MW5NOGYrdUtQeEZvMnI5QmtyNERvak41TjRURllFRy9JUU5lSVlHMmpmalNw?=
 =?utf-8?B?Wk9oTEhHV0pVb0dYT2U4V0gyYXpjNlcrTXlLYnNmL3NVRitHMUJBeTZpODRP?=
 =?utf-8?B?UXFER3Y0UkJBMEdBMGJJYWJFNVJBUGJ2aU5heGpkcFFFcnRRbjVoR3ArZUQ4?=
 =?utf-8?B?aDVwV0JUWkErdDFiRnN6SHdGaHMwUUdBZ2tKVjNCdHUveDZSb1haVkJ1S3dF?=
 =?utf-8?B?YS9hbzhiblBwajBHYXBZajB6ZUlHS1JBTDh5YXJ4ODlTZ2VCdjcrZUpIQ001?=
 =?utf-8?B?U29YN2Z4cHh4NEJ4RFlEUy9HQ0t4R1g1S3NKclpVV2dYak5PbUI3dzdpWUFD?=
 =?utf-8?B?emx2MWJ1RXErMGU2Y0hCSS80UTVMZC9rRDZmUGxVT1pFS0ttcVFKa25lZFRR?=
 =?utf-8?B?dEtKdlNENzB6WDh5eVdpSy8yRDF3YWJpNmVkaC9CVWFPdlFLZjVDQ21kaFFV?=
 =?utf-8?B?aWEvRWk2eU5UdmJXYjFPb1pKTmREYmxvNDc2Y1c2YkpBRE53cEFNc1pPSlJ5?=
 =?utf-8?B?Qi94ekFoTnR6eXhPWkYrOXVwVi9aRlNhT3JwdHExUFh4QVp2b2lJRXRmL3dT?=
 =?utf-8?B?d1pyYlorYVdFeWFMQkVXQ05RUlBUNzJyQTJpOWhEL1BHbjFLZ082VkRDUys4?=
 =?utf-8?B?VC9ibkNqdTBkWFE5VHlKVTdXOW5acklPMU9zQ2lCTEdFSjFva1N5U2c3ak1B?=
 =?utf-8?B?Ym5zSGU2alpwV3pGK0Z1cndEQ1hOL2M0RE5Ramc4dkV5bHJXL3loY20weGxQ?=
 =?utf-8?B?WG02eUZ5WXJleHpIeDgrN3RvVUlISWR4blp4WUYwaHhnVlBVbklmRGFjZyty?=
 =?utf-8?B?RDlJb0l2RkxnTWZoREVvOG9heEFRZGZLanh4QlFNUXprcGtwZ1Z2Z2RFNTJh?=
 =?utf-8?B?R0FXNWM0d2ZEcmx6ZTNxT1pmL1lUVTFRSnVVVUNVbWVJdWY4a0FzY2tNUERz?=
 =?utf-8?B?Z012c1hHMGJ0d0ZkL3ZvcWQxbGhtVEpsZWtGZzdtWi9UYno0UFc5S3lOaGV6?=
 =?utf-8?B?WE5TTW5SSkJSdGFUVHlNTFBJL3BOQWJGMFVVdWhkejRscDc2czBKcnc5MThQ?=
 =?utf-8?B?c2d6anNOWmI4M3VZYS9iSXk4aTgxZ24ySXBHU3g0K1kyeis5QTFkRkpkVGt1?=
 =?utf-8?B?RW5LWUlUaXNlS0loYXlyWDgwUXdodjhZMStjNVVEaXNRYXREenRSQXZtVnRw?=
 =?utf-8?B?QkNXNUVTVWtlOXdjUjk3dFdPK0tYa3dFVXdvaFBwV3ExeVRTRFZDMXdDOGpw?=
 =?utf-8?B?dERMMUxQUUp5cERHYTZLeTdiK1NBRVNMNkdwMGcrdU5JblE2a3ArV3FQMnV6?=
 =?utf-8?Q?fL/ZAQa7G8UdL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWV3bG5oaHZWN3VyL1hwdHRHb2I0VTJGaEtiUGZoNW9zZFlKdGZVcFdQRHZn?=
 =?utf-8?B?am5ySmU3Q2dsMC9ET3ZwcGVHN04vVWtPTTJsN0NjWExSMmZuUXMvLzI3K2Ft?=
 =?utf-8?B?ejAwenhrYmxvRFlJOW9RTlZ5d3kyVk5jSHZ1ZlA3by9jTzdQMmpuM0kzZ0hq?=
 =?utf-8?B?czQ1aURNaHRRWS9GZGx2c3RlQVVXVnBWTjIwMDdWWkh4MnBwNCtMTXQwYVcv?=
 =?utf-8?B?WXdIN3U1OXlWMWJIaDNIMmMvY1JIeHVzMzFHQk9pemIycFQ5VUQ0SzNWTGov?=
 =?utf-8?B?MXpQSGNtelNDbkNlN1pFeHdnQSttVlF1T3RSYU5FajJpQVd0U250M1VLUGtK?=
 =?utf-8?B?NTFkRGhUaC9HN1hHOGpxcmF6Um9vZTNRaU5ab1NUZzBnUnRMYkJxTU1Pdnd2?=
 =?utf-8?B?ZVkxZjBWWjhyUnNWRjVwNWllaExHTmY0MGRiY01OS3pkZTJsM2tVUHhqdU5Y?=
 =?utf-8?B?MytJNnkzWVdVWDNkWmVnNUdJWGhlSWp2bEk4aytsd2NnUGNzUzYzTWNaaEQ4?=
 =?utf-8?B?Ry9kYzNkdW5HbWUzOEdYY256Q25tWkx3VUJnTlVkbVpmRWI1R2oydGQvaVo3?=
 =?utf-8?B?N3E0eGhqRHM4VjA1enczWERFdkZDb0EyOHZQbU9WdUVyVHd5Tjhjb1NyRkdO?=
 =?utf-8?B?dWVaSnc1VGIzWlFJY0pPc0ZHcXJ1VWxjTndCZDU3eDBReU9zSXJlL2ZtNFBU?=
 =?utf-8?B?MlYrY3Z1cjQrZ3k4UWJTd1k0ZDREVldISUttdVA5Z3p0TTYvV3M1U2c3Vmxm?=
 =?utf-8?B?WURiNVlVUWo0eTBZcTdzc3lTeWN2VVlzbU1CcnRJSml0bVEwaDZ1NWJaS2h6?=
 =?utf-8?B?ekUvSXdCL3VpaUpLeXdVVnZOaklIMVp0TWp3YkZCb2ZGMXErdDFBMmptSlBP?=
 =?utf-8?B?cENDSUJwbWRLdHlPWExLaS9tcU91amt6dS9FWkYxdVVuQjFkK1VIWEE1ckNm?=
 =?utf-8?B?c1M2YkUyRDRqbWJRbmxDT0tVOERZU3FaRGdnYlZjOFZQdkFRbzVRMGxoblRh?=
 =?utf-8?B?ZG5GQXpDeXBTc013NFZYcU1YNVptczl3Qmo2U3ZKdnlYekQzeFp4VXFLSkJH?=
 =?utf-8?B?OCtZSDNNZGwrakxJeGtzRmVxaHdlbWVWaGdxVVVWcVNGUzQwY0lyRFdlSWts?=
 =?utf-8?B?MFpxUHVUSDJubkY1TFNPb1VscVV6MXZIZFo4d3BBVVVZQnNWVmlpbUQyZjU2?=
 =?utf-8?B?azh0dnRhK05ud2l3Y0FyUGFCSHc0U3ZVcnlveStiYUxEbUNLOXN4S1JnUEVa?=
 =?utf-8?B?cytUTDdKZTY5RnJWc1h2TDNpdDhKQktGSUo2eUFpM3IvMjV6RStEcXR4QUly?=
 =?utf-8?B?VEdPZlVmNVAycC84N25zendteVBJaHdJdm9Ob0xuUWoya2lqUDNqZ1RKNkE4?=
 =?utf-8?B?S0QxcTNwZm5HajhUYkhubHQ3YWdqRW5BeDFCa2RCWkZJYmkyMzRxMDdlSG40?=
 =?utf-8?B?bi92S0ZXWEJXT2NZV21FaVlrVGpxNTlKcVB4VEpIcXNPanNMUWNucS9IcmdH?=
 =?utf-8?B?V3FONTJjb2xHL2lZV0RmTFUzSHFMZEhmbjRuOEg5ak5zTGhTNUNnR3dGWEYx?=
 =?utf-8?B?U1JGUFI1aGM5T1FQVzM0UjBVcjY3WFB5aG1tV0R3aXlKckZqS0hyRjZtN0hB?=
 =?utf-8?B?OW4wVGJnZ2R1clVaU1Jab0wrbnJPSm0vL0NLRlFjY2UwVzYwNStmZFZyTzlx?=
 =?utf-8?B?YlAwUWlzckVoUnNhSVhqUkhpc3NadVJobXA2b0tUQ3phbjArNEpPa1BtZC9K?=
 =?utf-8?B?Ni8vUjE2NTNZVk8yYzZsMmF6WVAzc01wU3N1UXNoMmpheWR2dVhNTy9KNlB1?=
 =?utf-8?B?UmZHSFhZTHNtaGNydjAzVjZQbm1pZzRyclhOVXRyZHF2UFpMQVphZ3dhSHpS?=
 =?utf-8?B?bGc4cCtpT2V6N204Uy8zNy9NWHltYmtBQ1Nkci9XWjFiYlZUU1kyUTU3bXlw?=
 =?utf-8?B?SEpMMFpNN3lZWUFtc29lNWdOVUZlcE9oWnAzWW40MTk1amgxTVVwVFYrM0My?=
 =?utf-8?B?ZkVTZlZKUFN6aDdnd3dhWGRTKzlIOVl5Wnh4Y1JET2UyU0NqNWcvU1dvT1Ft?=
 =?utf-8?B?NWlmeXdGT2tFNEkvZUZEMk9TRCtFOTlzZlBaQlcxY0E0WUtLcy9pN05XalNW?=
 =?utf-8?Q?/QDN01NCvM1emX4ndughI+uCm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b25e2beb-6993-48a9-8d25-08dd24b45f3f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 07:18:47.1715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTOaemNmSnuT/sW4X13prP9Yt0eAZ/p7dEYLPywKt+AAhsGV4dsO1fni0PUBpUcNqG92BQtT+6o8xzvfvS19FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7252
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

On 12/23/2024, Dmitry Baryshkov wrote:
> On Mon, Dec 23, 2024 at 02:41:40PM +0800, Liu Ying wrote:
>> i.MX8qxp Display Controller(DC) is comprised of three main components that
>> include a blit engine for 2D graphics accelerations, display controller for
>> display output processing, as well as a command sequencer.  Add kernel
>> mode setting support for the display controller part with two CRTCs and
>> two primary planes(backed by FetchLayer and FetchWarp respectively).  The
>> registers of the display controller are accessed without command sequencer
>> involved, instead just by using CPU.  The command sequencer is supposed to
>> be used by the blit engine.
>>
>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v7:
>> * Drop using typeof in macros and explicitly define variable types. (Dmitry)
>> * Add a comment for disable_irq_nosync() to explain why _nosync. (Dmitry)
>> * Inline dc_crtc_check_clock(). (Dmitry)
>> * Use global drm_dc->pe. (Dmitry)
>> * Drop dc_crtc_disable_at_unbind(). (Dmitry)
>> * Add kernel doc for struct dc_{crtc,drm_device,plane}. (Dmitry)
>> * Define common IRQ handlers separately for each IRQs. (Dmitry)
>> * Rebase this patch upon next-20241220, so drop date entry from drm_driver
>>   and correctly include drm/clients/drm_client_setup.h.
>> * Collect Maxime's R-b tag.
>>
>> v6:
>> * No change.
>>
>> v5:
>> * Replace .remove_new with .remove in dc-drv.c. (Uwe)
>>
>> v4:
>> * Move dc_fg_displaymode(), dc_fg_panic_displaymode() and dc_lb_blendcontrol()
>>   function calls from KMS routine to initialization stage. (Dmitry)
>> * Drop dc-crtc.h and dc-plane.h header files and move relevant defines to
>>   appropriate .h header files or .c source files. (Dmitry)
>> * Drop futile "else" clause from dc_crtc_common_irq_handler(). (Dmitry)
>> * Drop dc_drm->pe_rpm_count. (Dmitry)
>> * Drop DC_{CRTCS,ENCODERS,PRIMARYS} macros and only use DC_DISPLAYS. (Dmitry)
>> * Drop drmm_kcalloc() function call to allocate an array for storing IRQs.
>>   Instead, put it in struct dc_crtc.  (Dmitry)
>> * Call devm_request_irq() to request IRQs, instead of using drmm action.
>>   (Dmitry)
>> * Call devm_drm_of_get_bridge() to find the next bridge. (Dmitry)
>> * Select DRM_CLIENT_SELECTION due to rebase.
>> * Select the missing DRM_DISPLAY_HELPER and DRM_BRIDGE_CONNECTOR.
>> * Use DRM_FBDEV_DMA_DRIVER_OPS due to rebase.
>> * Replace drm_fbdev_dma_setup() with drm_client_setup_with_fourcc() due to
>>   rebase.
>> * Replace drmm_add_action_or_reset() with devm_add_action_or_reset() to
>>   register dc_drm_component_unbind_all() action.
>> * Request interrupts in dc_crtc_post_init() after encoder initialization to
>>   make sure next bridge is found first.
>>
>> v3:
>> * No change.
>>
>> v2:
>> * Find next bridge from TCon's port.
>> * Drop drm/drm_module.h include from dc-drv.c.
>>
>>  drivers/gpu/drm/imx/dc/Kconfig    |   5 +
>>  drivers/gpu/drm/imx/dc/Makefile   |   5 +-
>>  drivers/gpu/drm/imx/dc/dc-crtc.c  | 556 ++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/imx/dc/dc-de.h    |   3 +
>>  drivers/gpu/drm/imx/dc/dc-drv.c   | 238 +++++++++++++
>>  drivers/gpu/drm/imx/dc/dc-drv.h   |  22 ++
>>  drivers/gpu/drm/imx/dc/dc-kms.c   | 143 ++++++++
>>  drivers/gpu/drm/imx/dc/dc-kms.h   | 131 +++++++
>>  drivers/gpu/drm/imx/dc/dc-plane.c | 241 +++++++++++++
>>  9 files changed, 1342 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.c
>>
> 
> 
>> +
>> +static int dc_plane_check_no_off_screen(struct drm_plane_state *state,
>> +					struct drm_crtc_state *crtc_state)
>> +{
>> +	if (state->dst.x1 < 0 || state->dst.y1 < 0 ||
>> +	    state->dst.x2 > crtc_state->adjusted_mode.hdisplay ||
>> +	    state->dst.y2 > crtc_state->adjusted_mode.vdisplay) {
>> +		dc_plane_dbg(state->plane, "no off screen\n");
>> +		return -EINVAL;
>> +	}
> 
> Nit: doesn't drm_atomic_helper_check_plane_state() ensure in this already?

The can_position argument is set to true, though it is a bit unusual
for primary plane.  If can_position is false, I think this should be
ensured already by drm_atomic_helper_check_plane_state().

> 
> With that in mind
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks.

> 
> 
>> +
>> +	return 0;
>> +}
>> +

-- 
Regards,
Liu Ying
