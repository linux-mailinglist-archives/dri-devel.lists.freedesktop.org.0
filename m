Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FEA9408E5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 08:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AA510E0C3;
	Tue, 30 Jul 2024 06:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="XoVFXQY6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062.outbound.protection.outlook.com [40.107.22.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB9810E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 06:54:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTx/XhZ0mBfgCUxCND/mlThiX3MzV0hRMQiAQWx1pGqv3Zp64e+/+eRr94bZmBZxB1O6uBvxYFTn0fNVs/ajoMR4JxvfkxERxO8966k4Sj57BYEuELd/rN0gYLa60OyT3BZzYouZ2QtupZlFlyAJdJSsRAOjE1J+Y5JFdk1jAhC2vhMDKluisfvkeZ76ANCYSQSat1Ou6IUuOaoa1G/55jqRJkvc1x/jkGtcM+vmE0uXhsEBheJ1chmdLt33E7WqqGmoFPP8Sv+tiOYnQVsRtP2u7nkFyk8fpu4HP5TZ8FIEa0MI0BCjh7Br4xojzFtjcX4Bvn4pyqKmiTtkcgKWcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJT/TnREqObtk9itJGhPWKbK2TG2E94TaflwSlUJQMQ=;
 b=Y36pYv/UL5zp43taKyg/QnTiFZb8qSZi0LC33VFfJGrwFeAwQTZhVsPzs86sNvUqNb3gIwMasgR0RvL6kdFZUSguOI80+pI8L6jLkqMCC77JoYJSKzaXxEJ0nWV5opS7QRJ2J72tBAjLJ+wWgC+u0uKHSbHUsiDhxDAbj/TFRfz31faWW1xV+80R3joL0Fz0YVR4LDO7OSnC5QMXIv4ZyVi0cTVIZ8cnloE+zEPVh06tUS3Q8ltd6EZWGJPp8G1AKrVTHT5XX6OYDrZ0wgCLxvy6JGzv3QyUNaGGmWL47lHUS1OnDlS4d1uVDrSNntCAUOoOuZsftw0IcGbU+c57vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJT/TnREqObtk9itJGhPWKbK2TG2E94TaflwSlUJQMQ=;
 b=XoVFXQY6C5G/vlNPR4LZdZfIgE4IhBZ5LEtE4xQ1Lfm+qq4VB/sRWmKN/W/I8+Q36XEPQLq/oWHRxxGwNvC5INoGKW/LFHj+HoITw8PoXoEcCv+aP2i/Wky/Srp+ka926E8q4WpvbCqPHAAh+AGa1nWUK7wVbRNer/+AK+qGW+zUXvEODDpp5PZntw4thrnZG5t70fDBvd5/43ATjXgRo/RBXw/sOPEHPUNIU4bpdTZvCnxBLbmhNtGcjiupCNEIYou6gH+CQVgvx25TU62lfhTZ4t8vRM1iTgagKx+AHXsVXLphGUZnfwwgEud3yK+Qdi8eQOnoAtqm4fhVKbpQaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB10069.eurprd04.prod.outlook.com (2603:10a6:150:121::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 06:54:52 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 06:54:51 +0000
Message-ID: <107d89b9-e7b8-4613-bc07-9af7b52c2b8a@nxp.com>
Date: Tue, 30 Jul 2024 14:55:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] drm/imx: Add i.MX8qxp Display Controller pixel
 engine
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com
References: <20240712093243.2108456-1-victor.liu@nxp.com>
 <20240712093243.2108456-8-victor.liu@nxp.com>
 <ibdzow7lvbimaefrp2z2aolgp4pytpq3dcr2y3pegjavvknhgm@2e6j3f4zytqp>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <ibdzow7lvbimaefrp2z2aolgp4pytpq3dcr2y3pegjavvknhgm@2e6j3f4zytqp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB10069:EE_
X-MS-Office365-Filtering-Correlation-Id: 641bbd0b-32fb-41fb-9bb2-08dcb064824e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWlCZ2EyTFdoS2FvTzUveWt5VEZwRjcyWWNaR0NxVStkemRqTjJsVjhBbDkz?=
 =?utf-8?B?WFdzUi9jM29qWkFDY1ovdWdpSCtncTNuVnVQV2RuQXpUN2dKTW5VSmR0VWkr?=
 =?utf-8?B?bFlKTWF5YjNxRGdiZUY5N3MxNEIrc0g5bTB3eTRKY2YrWkdTVTdFeUN4K2N1?=
 =?utf-8?B?K3dVbHNsUmVjL1hvUEJ2YndLMFk2NGtxcVFuL1FRS1ltanhEcTB4VzhCTjF2?=
 =?utf-8?B?bmNDWlN4VHFTKzJZV1J0ZWRLRFBCK2craFYrckZqWk0xampKY3RESTVBV0p1?=
 =?utf-8?B?aytMWDhHY24rbklleVRyb3hrN29vMlhyR3cwMUNTV3I3VHJMQmlNNzdRZVZI?=
 =?utf-8?B?TXNkOUJxM2ZVOXRVd0huNFRud1ViSVprY0p5ZHZMSTRqbVdEOWFXaHFUUHNW?=
 =?utf-8?B?cGVkWVlaRktYbFAwL3RTaDgrWWh6cm5mbnE2N1RWSjJtZzhhRThrOFo4ZHFS?=
 =?utf-8?B?NERMSmIyR3hTU2FKanJ3bVczRzhoMTFKYy9sS2t0L3pDRkxtaVRzK1NHWmpY?=
 =?utf-8?B?eTIxbEM3MnpEdmJlSFlZSDh3Rms2RFd4YjZPZFhvMnhCd29nTG9yNjNHa25S?=
 =?utf-8?B?bTU3VExUbnlEOXh6Mm1nUHlqdmcvVjBIMVE5bHliTGgrakpkRHRBWUZzdHda?=
 =?utf-8?B?dEtZWHpoREJKVG9yZHpDSDJlYVgxekNZL3VIOE1HQktPRUZPWnhDenAxc295?=
 =?utf-8?B?Tk5YYzkrVStPMTZxVThzek9sUnRNYWNkZ0ZFY3I0WGZ5a1ArOHBDRFhHVW1q?=
 =?utf-8?B?ZzhMU1ZDTkJwaURsb2hRUmJZaTYvQ3AzZTBZSUVGZ2l6cndUTXFaQklpbElF?=
 =?utf-8?B?akxpTlc3MERLVHdkekl4a3JkSUFXMFpaVXNmTGVTYjU0T1ZoNFdERGN1TnFy?=
 =?utf-8?B?Vlhlb1FaT0o5U0prQjh5OXUzcHpWSncrV3FlalRXK2lqRGlwUnFXYUFqTDAr?=
 =?utf-8?B?cWJKUXVFRUVnTE1LZGY1eFQyeFpUTERndDJSYkZ2dHd2ZUFyT0hBdmRJNVBO?=
 =?utf-8?B?RHdXVHVkbVhPenFXYmdVVXg4aWlLamJQbThPanRYNWFZajFkb2ZQNHI3KzQr?=
 =?utf-8?B?a0xvT3ZWSjhoOEFnb3ozczUzc3hGVGhqaUZsenZuaE5hYWVSM3EyYTRqZ05n?=
 =?utf-8?B?RXBJaWJBTDc4c1ZXRnY2Njk0VG5jQXBRaldRQis3dnhDd21zc2Y0NnQyWStW?=
 =?utf-8?B?c0E1NGJ5aGNjYklnUTlYR2dBNFZsOTN1ZzJFQkVBTVZlMFRqUk92M0RxUGFG?=
 =?utf-8?B?OWx0d2JJbCtUZFozdHV6MndpV2VCenlsamp4eFYyT0JJRnc4Vk5vY25rS3lT?=
 =?utf-8?B?K3dzZm95cnM4eWhZc3pZNHFKc0NuQmNXMWttckEwNkZHZ1ZaenB2d2c3OWFa?=
 =?utf-8?B?OE5JM0pwcnRaUDJ0WUVZeVhZQlArbGEvQzN6VkFxYzFhN3UrSkR6Rjc1T25R?=
 =?utf-8?B?bVlrSmVicnZoRHZkNUkwa2UrNVFsTC96MlUyQkdYd0tFcElpWHZhR255S010?=
 =?utf-8?B?dDdPcVBXU2tOYzdwK1ZsMkc0L3ZzYUIyUElqRURTUlRDSUFUeUpuQ1QrYkwz?=
 =?utf-8?B?NWFEMGZSZER4LzFwaFJaSXZUeE8vcm9YMVY2b2JEaGJMbUVUbDFuL0JDczlI?=
 =?utf-8?B?eVphUGl2RzZMancwVWlBYWRZWmJJd25wZ2ZCbkEwbU5KU2oyRnpLZko1K3VW?=
 =?utf-8?B?cFdhb29tanBTc3FEYXFzdE5aRFJUNHpWNllkanRDaGw4MmUxNmRPeTBzK2dU?=
 =?utf-8?B?L2JMQkJlQU1SeHdwa3k2WTI1RlVxbVd4UmFMWEtsM1A4UVdFMWp3QmhrQ0hX?=
 =?utf-8?B?M05nQWxKM2FqWnMxRGpZZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXFYc0FDaHppTlR6S2QzeUNNcVZjaGIveDBwTys2WDZaZmhlSlNNenRqREl5?=
 =?utf-8?B?N05LdFZ5cnRsSks2d1ZDQ3NHKytyc2JtRGlRKzg3YmtKNTZHVWFnS001NVp4?=
 =?utf-8?B?RHlSRGs2bXpzWlk1K0Z5a09HcWNXTHJOait5Und2dzFrTmV3M0FYMHV5aEQ0?=
 =?utf-8?B?TFZiQzhKYW9UTXJnSSs0TzJZcXM4ejRnSlRQU1RsNG15dDJZbHNMZlpUZGRC?=
 =?utf-8?B?bTVXU0ZCblBncnVMc0xjKzVSSVpJdzY2ZlFzNWlaNVc3eE9qWnhld3NBRzNT?=
 =?utf-8?B?Yk9iVGhwVXJrL1MwMTJIOVpuU0JuM3NKWlJuaXB2UVBIWDZaNzBiMUFPZCtO?=
 =?utf-8?B?TmpOaFpsd2ZFYXZWdFRSSlNWckFvYlU4bm5EM1crT1hwTC9rNHBDeGZqREdw?=
 =?utf-8?B?WFVCdUNCRkt2dEdwR054SVpqeGIyQTIzdWxBb0V4SjFZanRRTWllSGFsRkI0?=
 =?utf-8?B?WlQzb09MdXN6ajNRZmlsTlJrdVVMTU55dDVuSmJLUnROUngxSlJNemxQcEF4?=
 =?utf-8?B?ZHpKUkNzMEZKK3VqYTZoTWdFaW93SFZ6NHYvckwzTWI0Sm1jN1JjVkQ4WUxW?=
 =?utf-8?B?cHgvVWtuTnpTRlBCeCtZd0QyODQ5R3NTVEVFZW1JbzV0MzFSRFpHVHJFRUFC?=
 =?utf-8?B?cnQzQWdwdmxaNE1iOTRpV0xMRFJ3bEhkSVpaSko2VHhrNXNSWVErbUk1TlJj?=
 =?utf-8?B?N0g2M2Q0ZXcxNXh6SmFRMFJxWjdFN1Nsc0Vsa3NEQUlDb0JvYUFGNi84WW0z?=
 =?utf-8?B?NFhWc293TEFHTktoOXA0YnhhZFFCNzhVaTk0SktxWFJqMnpPMi90bHk4VThX?=
 =?utf-8?B?K0RzOHVRQnRXR3czQUErVkZLZjJIcjJ6VUExODFaMlJuaXpCem9OTzJONDhx?=
 =?utf-8?B?T28rMDlsa3FOcnNNNFJ2aW9raEN1by9uYzcvdGhkSkd2QmVLbXZ1by96VS9E?=
 =?utf-8?B?R3Q1NE41cnBYSk1lRUJzU2crei9rdjBTa0hZbFUrTG9JZnFPQmo2cFhPbmU2?=
 =?utf-8?B?ZUxBYzZBRUFyY1RJVHNISVdZQ1A3R1RsVzhZc2NDeWVTMmptMmNrZzF1ekk2?=
 =?utf-8?B?bW5hbHgwS2w3MDlxcmxCZXJzMTJ1Ri95bmpVNDhZdWVQYkdUdk9sOTR6SWwz?=
 =?utf-8?B?dkV5NTl4N0IwMFFzUkZ3N0NJV1JxTWVpaW5ZSmthcXRvZUhPWDhhUUNsOUc4?=
 =?utf-8?B?czluYXFPYXZwM1NiRStSM3Qvb3lUcGpoWHo3QkIvSjIxMERyNGFXNlFFZ1dU?=
 =?utf-8?B?Njl4ZE5ZUDdneDVyenRUOGdDKzhqa25va1lBd3VvL0hWYjdaSXc2c2hWN2VB?=
 =?utf-8?B?QUZjK1FwK205Y2xtU01qeGVPcEI2ZVExRzkzYTV2VUs1WnhDWFhlNm5YaVNq?=
 =?utf-8?B?Wm1DR1IzQ25wQmNZejVyWEJXTVdlNzdnNjRKVWtrVFdXbzA4d3RWLzkwc280?=
 =?utf-8?B?bzZIeDdmbExjdHBjUXRUZk1pN21DRVErcVR4Rk04Uzg2WHBtWmlacjkyaVlu?=
 =?utf-8?B?UWEydkdlc0wzc0ZGNGdOMGpqZXlQMEI1UXVEamJKNElyNEpTRTlZQ1NUQzhR?=
 =?utf-8?B?R2JJU3NWVXFTemFZNDZwbUdWVGdCY1JnOVd0MnRMVVR1bDVVdHV3N0dWbGo3?=
 =?utf-8?B?eEYwS3d4enhrTTVCdDVRQ0ZYUHQwSFJKL2dmdHpRN2hHY043OENVaHFHZ08y?=
 =?utf-8?B?ZUFMNnVaRVNpTXErcEFWQjZuSGkxSW5Pa1I5V0Z0QTZUNGRzNlRZcWdxTlk0?=
 =?utf-8?B?Z0NRckJsZFR0ZDU4dTBzc1hnSlg5SlpBajlHcDFaaVNXMVptdVZLcHIzZG50?=
 =?utf-8?B?V0t3NlJhSEJDT2JhaVoxdUgyT1h5VGtSWldjWDZWVGZtTmxRbFFhbG1MUE5w?=
 =?utf-8?B?UXl4dWhkRFBKVkxVdS85aGZEeEpsWndpTWVxNUdBeHNHL09reUsyT1NxbU5Y?=
 =?utf-8?B?Nlg2clFPSDNvbTJ6UVdvWVYwZ0ZoRW5UTUhwOWxjYnRFSDRvN0VucVdrUEY0?=
 =?utf-8?B?ZjNuY2o4eXlCMThWVzVJTjRkZHUzelMydHdqTEF4Sm5SYTFJaGFzenNtWC9n?=
 =?utf-8?B?eU4vYlFxVXdyQXFBQ0lZUzZ0Rk0ydS9kdEp5bFlLTEp6N0drdVlzbjRYTk1X?=
 =?utf-8?Q?PPKhX7SyKhaNuceQVuix7szBD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 641bbd0b-32fb-41fb-9bb2-08dcb064824e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 06:54:51.0624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NG/NIoaeURG6aVGAm90efr5UFbnrhfmVzgNhFAQxjuhz+xQU1b1ic3TTn3MCKRc9w7maBLn4NGE8fnfflBb2Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10069
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

On 07/28/2024, Dmitry Baryshkov wrote:
> On Fri, Jul 12, 2024 at 05:32:34PM GMT, Liu Ying wrote:
>> i.MX8qxp Display Controller pixel engine consists of all processing
>> units that operate in the AXI bus clock domain.  Add drivers for
>> ConstFrame, ExtDst, FetchLayer, FetchWarp and LayerBlend units, as
>> well as a pixel engine driver, so that two displays with primary
>> planes can be supported.  The pixel engine driver as a master binds
>> those unit drivers as components.  While at it, the pixel engine
>> driver is a component to be bound with the upcoming DRM driver.
> 
> Same question / comment: create subnodes directly, without going
> through the subdevices. A lot of small functions that would benefit
> being inlined.

Like I replied in patch 06/16, I can't create sub devices directly.

Can you please point out typical ones for those small functions if
the comment still stands?

> 
>> +static int dc_cf_bind(struct device *dev, struct device *master, void *data)
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct dc_drm_device *dc_drm = data;
>> +	struct dc_pe *pe = dc_drm->pe;
>> +	struct dc_cf_priv *priv;
>> +	int id;
>> +
>> +	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->reg_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
>> +	if (IS_ERR(priv->reg_cfg))
>> +		return PTR_ERR(priv->reg_cfg);
>> +
>> +	id = of_alias_get_id(dev->of_node, "dc0-constframe");
> 
> Is it documented? Acked?

Like I replied in patch 06/16, I can add aliases nodes to examples,
if needed.

No Nak from DT maintainers I'd say, but I hope there will be direct
Ack(s).

> 
>> +	if (id < 0) {
>> +		dev_err(dev, "failed to get alias id: %d\n", id);
>> +		return id;
>> +	}
>> +
> 

-- 
Regards,
Liu Ying

