Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7611B6B6E4A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 05:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D769310E00D;
	Mon, 13 Mar 2023 04:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BE810E00D;
 Mon, 13 Mar 2023 04:05:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1JfqC1Sf8eBOw/xQ/6W297TAnxTNt193J3eHuC5EpNyx5gHEcTU3FqhZa/O/azzbwlYXlIIyr1gnHULiFxu947Hwxp75uHK5Y3F43ALMQu6r38VFVfVufq4dLey2HZ5pHag7eZ35vbHHspm0PxdaOktCekz6nH+lSau8RRbJ/yrvTaxO+GXGFQQe8NiLYEe6VQmX+LKRvwAxefz+oCePziO0ChkHMmnnj1AwhLFt10ejS1jP1gtDl6YTNEsqTo6lTBlABdocqSX9XDVRyLLva05LDfOLY1vqgfHPxNDBAhYWN3DeUEoALNE+eumFHnGBFS2yHPZ10TbA7tuR8ZocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mp7o9x3Q3UV49kdszSX0keoJHL/CCWgeMBw4ksNZUU=;
 b=GzNMBy/J+yaX9E6WJAQJi9crnO9S+Ti09m4y2yG7juWkFAnI6OyPoGzV5rmUBzhpggk9lqdrekt+pM3/2jxGPXJGY9IhFJhlOA0907C+jybi+rZOI9PA29hgFmWiclw+1r+My+YBXoJP9cpD4Xw35ljpH6FHGttHVkDQed/DEESf1bmveJSQHJM5gOckBHVp31mTtVNADeEcRSWoQhXxlIQunWbGGtNVQaXKQWpPrsxX6Ew0noQqHpnx1FMWwz128w1pUEufHBKQEYlWfPJGtS7YeoyzLOehipW+w1qF63dd+v+DwhZJVmhoZW95bhj9Oljt52OU4Bj+7ZcloRTSJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mp7o9x3Q3UV49kdszSX0keoJHL/CCWgeMBw4ksNZUU=;
 b=UERKNswILFOhz7Dhd9c8wrLulBABv0DpNayWGeflw73ZT5G1nwR7KIq3WvBPxZSuI5rYDo8FY2Ndlkh9hqEGxbBOxJIj9nNQarZN1v9GD0OGo6ttVIdrorwDiiMr0S3kiO++jjgpDGgdpXF+euURcv2y7Uj/8ickR2ladBH3GBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB7650.eurprd04.prod.outlook.com (2603:10a6:20b:281::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 04:05:33 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d555:5ebe:1938:29e2]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d555:5ebe:1938:29e2%7]) with mapi id 15.20.6178.023; Mon, 13 Mar 2023
 04:05:32 +0000
Message-ID: <9adaa7c15ff08464c9ec8068f8d7a2d1dde46e23.camel@nxp.com>
Subject: Re: [PATCH] drm: Use of_property_present() for testing DT property
 presence
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,  Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Chen-Yu Tsai
 <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Emma Anholt
 <emma@anholt.net>
Date: Mon, 13 Mar 2023 12:04:44 +0800
In-Reply-To: <20230310144705.1542207-1-robh@kernel.org>
References: <20230310144705.1542207-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: c782a274-8f10-4e1d-3f6b-08db237830ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PLdbZdrVQDJv8+BIgx8iVLamMjiz5zaCm9+rv8npjw64kmbglCTx+EaFcv2GY+RIWlhCtAbp4mRWXKwSvBhAcxLBK1iWPVNZMz7SYUoFugMQX+k2CrV/XDq1KoE5qNtQwmmaQIVY4uGZAssvmqG2RdFdC+sWo4UF+m4BCpTeWqtl9ekQTIQqFLVZqq+84Wmyv5BJDeKsBlx4HvR6Ay0YeOVHCDyRvbXlYgK/rK6kBkto0KW81PAacVusYdRfBLXT9dWOAukudRgNYyhiJBb4OpQZ0cHf6N9RA6oABGB7q3vuIucfkl2kzCmt9iGiBrK7iknRyHAyUZtYGjwv/s7+OlnRpy/Vim7TiKKuU1XP0XLHpo+PWXVC7Ac4Yr30nDjrlvqQYFPy030MJAwX/NCmIskyKGei4e+MegKHkGrvq6FhN9hdqZPEGh04MTaG0c94OpSohWRMbjtMEOxgm7s4WE+YldFZTh8MZ+Y6yxCajKCknr1B0i3m8BNRT/6zYLxK7hYtoUzy/+1P29VkE08kJlrILPt9g0A6ccBy8vKWJIKkl/sj/18CBP+SA9GYu67Du4v5S0shZEnHN263rhuAk3ic1/duXn6rNUE+Xigw+KJJoJXmkTtA9rqC2gLvLm4XEi2M81x8LYA6D8kbPk5JDGmbF1xwbUZi+BmOcmmrHIZPriL6rkytF17qgouM+OQk5tj71x6eLZTHmi5kj7ub7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199018)(36756003)(921005)(86362001)(38350700002)(38100700002)(8676002)(66556008)(4326008)(66476007)(66946007)(478600001)(41300700001)(110136005)(8936002)(316002)(4744005)(5660300002)(7406005)(7416002)(2906002)(2616005)(83380400001)(186003)(52116002)(26005)(6666004)(6506007)(6512007)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEVhRTlaaVViWUF1MGF1eHQ3QlFBcG9KQmp2NFhZYVVFMEcvVzJrcWg5SDFC?=
 =?utf-8?B?R1k1T0Fid0txMmFPTzkzT2U1NzdMdXNKZUU4THpraDhzSlhKeTZJSlBQT1Zq?=
 =?utf-8?B?ODRyVHBQUUE4Q0xJejNWM0FsVVkxMXdSMyttN2o1NHBaOWxyenZVTklDanh0?=
 =?utf-8?B?RG5Bd1p0ditMNHUzbHhaM254REE1ZUlFaVp6MTJRd2dvTG9rK1h5anl2ZDAw?=
 =?utf-8?B?cGRSSFNMUUp2VzRkK3hhLzZ5Z0hadGp6MnNVUTlXV25IcXRvUWZObktCbHoz?=
 =?utf-8?B?RDhWeUs0VDZUVUJPSmV1SlNSWW9JakxhTTVnaThSLzA3YW5rRGllUWxKNHU0?=
 =?utf-8?B?WHM3ajltclZxNG53bGxLdGhqNTVla3dOZFZBajRJbWZ5WjdtME9xNnhNZFIz?=
 =?utf-8?B?OXRmRklocXgyV3B4NU9lYks4U3NmUWp4SS9BWkh4eTNvQlBCaUNhcjNaOEFs?=
 =?utf-8?B?QitFVkdJV2JjMThyM0wvUXMyTjI5ZEJMVmV2SDZIaVRlbjhWekZ6aWlxdllB?=
 =?utf-8?B?RlkvbEhiMFAzZ21Xa0tkU1ljTFRkYTJvSGhRVDREZGFaWE1VcTdxRkVNdko2?=
 =?utf-8?B?U3RVb0J6QjI2cUwxWXNCcVdQSVdrZi8wY25lVHpvR1l4YlpDSDlJR3NZUVV1?=
 =?utf-8?B?LzlRUGNkS3VUOHQxWlVDenN4UDlTTmJJWndnMjF6OTl1RG5OTW5UWnkwbFUz?=
 =?utf-8?B?VnphMnRVRXFocnBaOEh6T01DTCtkbW9kSkJIcWdwU0dSYmpPZWRmcDV1TWRE?=
 =?utf-8?B?UzkxUHQ5dVF4bHRaWk1JbnEzSTh4M0hMNGx1YldYWXgxQnJMQXRyQmhCWHFR?=
 =?utf-8?B?OHZXNkhXak84bDFFOFBDWVlxbzVZSWphbkFTZHI3amU5K0pxZGc5S1hMSkEx?=
 =?utf-8?B?bUZhZ3dOZ1cvakREM1ltUDZwTzNSbHFDcEpuYVRrWitDNnVGMkpuTFRBeThU?=
 =?utf-8?B?WFBtd3dEdFpSOTVnVTQ5dHJWbnJWamJSQ0VGbjcydEZ5bm92UXN4RmpnZ1J1?=
 =?utf-8?B?L1lpN05RRHMwKyt6OHJWTDljd2dnditVUFZiRjZ2Q3NPTDZpMi9IM0dJeDJS?=
 =?utf-8?B?ZEJsb0JGRnI1K0Z5M0NFdjdmZ3JsN1RJRlZOQ2dzeHExWCtHd1FoZ1NKbUVE?=
 =?utf-8?B?MTBWakFKREtPZFFNT3VEQ3hxVlBFdi9xVVROMG5IOThUV0lrZWxTMjcrNGdX?=
 =?utf-8?B?R3g3RXhLTXQ0QXFrYmhvTFladDkrOEZ1NmRaNHhFeG9pU1c2d29MN1BxNDlO?=
 =?utf-8?B?WUNPeFVQUmd0YmJqN254OUx4Y0dHZlIzQVd1dmJNeFdjdVpveTZoWDZZZ1lm?=
 =?utf-8?B?VFkyRXFpdjRwcW41T3hpQitwSlp1OTJuaTZNR2Njb2ZpL3BITk54aUZNYm1O?=
 =?utf-8?B?aHYyQkl3bXdsQXIzSnFWU04yQlN4MitEZUNmc2xjOHhINFA3SXovclhnajQv?=
 =?utf-8?B?Z3FybDdoZkFRWENRZ0RMSThaclBoZVR6OTdoNS9HU2drWEt6VDdhQ25aaW0x?=
 =?utf-8?B?OFk5UjE0WGIrY251VWMvbHdqZzZrUWFHWWRUOXZBaFl4dGxoanlQT1kvSXNK?=
 =?utf-8?B?MDgvaTFKcjVTdUJzcTJyY2c0R25tZjJVZkxlcDdGQlg2OGdMQ1F4ekVtZXhz?=
 =?utf-8?B?MmRTQWs5OVRMN2xrdUp6SFlXTzBRUENDMGF2SStUelRUOE5hU3lEV0ZYa0Fs?=
 =?utf-8?B?bTVia2hVZE8vNDVmblA5VkExaTMxUk5CYThyb1hVNVhFN21PajR5eVhMR3lp?=
 =?utf-8?B?NTYvRGxqcUZkanhhTkMrcFRGMUtNL1RVYUdqNnRaNkxOVmxNNnFBYVpNSjFp?=
 =?utf-8?B?UmNpU1lHYXAvQmgxWG1LZTN6UnlRRDRRbXFoeUR3aHl0Y21QVVhGMWRPSVFu?=
 =?utf-8?B?SzYxU1lGb1huTGtqTzRyUkJiNDIvbjU3VDE1SmRsVVorZ2RoYThOcFJ3SGNS?=
 =?utf-8?B?dTcwUWZCdGJJUUVrSVIySEM1bVVxRzM2UEl2UnpIa1J6WXp3UDhEQVh4TXRz?=
 =?utf-8?B?WDNKc3dhd3VjNWN1MG1Mem85R25Gc2NuYzRYejY0dTNSNHI5UTh6aGlNY2R1?=
 =?utf-8?B?UTJTSnBPZGtZbzc1SXNwVFdDKzl0ZGNWem40WFlwWXdoalFjaFJkOTRscklh?=
 =?utf-8?Q?1Sa5UBW/vS9SSNMcRXKuytBJU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c782a274-8f10-4e1d-3f6b-08db237830ee
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 04:05:32.8587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KVTb2SzrnoDgX/qDhXwRBDBEKfppjf0yyQ1JaOwOA6pjXKvQfcA6g4pyUWWSmm/xczJLjEhs27Ln1Ow/viiGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7650
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2023-03-10 at 08:47 -0600, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 2 +-

Reviewed-by: Liu Ying <victor.liu@nxp.com> # i.MX bridge

>  drivers/gpu/drm/drm_mipi_dsi.c                  | 2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c         | 2 +-
>  drivers/gpu/drm/sun4i/sun4i_backend.c           | 2 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c             | 2 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                  | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

