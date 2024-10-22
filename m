Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A11E9A9C15
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 10:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E4110E165;
	Tue, 22 Oct 2024 08:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="XXs1UNiY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38D310E165
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 08:10:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yevszvDNeVJX4Hfhz421oKIYte8X7bGKqs0yydEyALo/Mwzd6RvOJM92CdChbHEAffgoJXilc7ZqhsOjVLTTyyXlbiT4pqk9jB/dcJca4J64uohe6+NqLX2LOjPG5hChbNqMwMhFUmVDoTpVrmiJrDm0Y4RYRCSr2rdLsGgh10uturAfWPBaIllQKn9fAHwQ6y0dSFcPRBE4GJOgrBULPwHgHBHN5wtcJR/1QyUH0JzXBkLwiSZmx07chaM8k9+W2AWNZtipt+SvLrYnCUDivHaWh2EETojnJqX10y8e3igA1s8K194sc7ELAcY1sZLQ1kaP+ahsNlJnGgO83Ltmyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBT7Yawja4t5KOzpO1HC8aPsQiOUdr1KXHnLoYiFhXE=;
 b=u+qwQiAWFtNfVNmZfyrIOqsBPxOIsM9a5bYrAsa+Ha9nUkW7RISGEYtDtjhy0JvZKpKhaDkv+uTUbEvgm8+0ZduOuDU4TOUgtMfxxveujtATcPtgU8W3uEJ9rIZFSWii5mSV/2GIPkwbu/W+9NsViAMoeQsBQs4st76dFumOzGrrv/HfwonKJ6QlHcUl4EuGUH9ssfefx3bY9p2dCbnkVHgPgvRoh2kr+8qJsZiwWmfI4iWTklV+61YDgSoc0Udzbu3CxTnH04OqNys3RrArjuwCCnc9J4PwTeNJHaFdPAH+j47t0d18nccYwnfqnlE1SlWIdeMPfZ6GHhpbVcoi3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBT7Yawja4t5KOzpO1HC8aPsQiOUdr1KXHnLoYiFhXE=;
 b=XXs1UNiYivtUZokx6nU3Y7inI9/D6vksx0WD24g4oFGZiacL7OaLhzUqgkxWaI8XVrR75WOkR5d6AdpwOmpZNIYMZIeynn9VP9sLs8rQ+zyoUhFdgAIsAp28ijmeaDGK/uVQld3nsz/XVMdwcPbcm6gia2LvN787Mk/lHHIlrwUDZioNhW1g7S8quz0JwcldqtI6+B3h04dQhKYrg2bC63dcTy2HooSmWKJiQL6sbXkEVt4/eySBMCMw4qbdewYuq7wVKvBaBjEhwZIJmLR9Ns97uP9f73CQjTth6VqiTgaxSyewVEp1eil59iXNZZ0xlMG0DcJx2ebSI+Q32fOvfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB10020.eurprd04.prod.outlook.com (2603:10a6:20b:682::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 08:10:28 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 08:10:28 +0000
Message-ID: <7a83230b-292c-4e28-813d-a07ea1b6a66a@nxp.com>
Date: Tue, 22 Oct 2024 16:10:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/15] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com,
 mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com,
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de,
 nfraprado@collabora.com, thierry.reding@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de,
 biju.das.jz@bp.renesas.com
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-13-victor.liu@nxp.com>
 <20241021-thick-cockle-of-popularity-c5e28c@houat>
 <889594b9-e6cb-4d90-b959-cd0258b2f166@nxp.com>
 <20241022-wondrous-fractal-lion-aedcd9@houat>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241022-wondrous-fractal-lion-aedcd9@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB10020:EE_
X-MS-Office365-Filtering-Correlation-Id: 554f082c-6558-4521-f682-08dcf270fd85
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnZqTGR3Q3dkRE1qaWVzNEovTVozRUcwaUZLSkF0UVZhemZSb1o4elRPQ0F1?=
 =?utf-8?B?TkRVN0d6TnNiMTc5OEFoa2JZOEVBbjdJeTNabUVwdGFqYnp6ZWlZekl2bWV0?=
 =?utf-8?B?c0xPa255WVZXYTVJZnJBS20zbDNMVE1TZkNnUUpSWU5La0p4dlZicnlnM29F?=
 =?utf-8?B?KzRlb3R6aE11OEZyZjRaY3E3WHJYdnVQaWtGb2hIanhWWUVFQjZ3eXdHdDNV?=
 =?utf-8?B?aU9uT1Q4MmtBbDJ1ZjQxT051eHJidTIyUDhVM0Z2ejErZkhmM1Z2MnJaMmto?=
 =?utf-8?B?S1RuQUE4a0RWSUlXZHMvK1VDNmEvM2pzcFRJazJtVVpMMVI0SXZaNytMb1dZ?=
 =?utf-8?B?MW5nRHlyNnEwV1RQU2NEaFRzWndSZHcxQlRrWEZ1bDlZZWRkNS9IUERCUU5G?=
 =?utf-8?B?b1hrMHMwanpFTG1CVFJua1d2SCtPTXozL2pTcFBrVVVlejlmSmgvQlNyaVV5?=
 =?utf-8?B?b1QwMDBib0dDeU8yR2JGL1lmNENmQVhtODk4Q3dPWkkrZkREbHRRcU1tNG5M?=
 =?utf-8?B?QmpPc1ZFbGpSU1RqVXhqVElKKzhRRWZFajVBVGQ3RE00QUFFUmNpWVhkLzcx?=
 =?utf-8?B?dmZMM0JxTjVnNjViN2N2ckQweGpRSy94cml3UDY1ZEE0N2diNmcvaDBya05B?=
 =?utf-8?B?UHVlM1FPSmFmVmJzMmhsaFFhRThXUU5YcmVWMlcyaUl4bTlMdTVLM2JhVnJ0?=
 =?utf-8?B?Y2sxTVkwY3hYTW5DUko0WWhZaENGYS8ycEFHZ2U1UVBEY1NLeEdQblpudW9V?=
 =?utf-8?B?MUs5MHVUMTZ2Q3NRT0lCMU93Y0t5cDBNR1dNWldUd3dETmpLS0hIcEhrUWJK?=
 =?utf-8?B?VG40bXdSbTA4NVdkc0d6TzA1UldISFVsaHFrMkdBY0NsdXo3azdCSUJoTVlD?=
 =?utf-8?B?djUrclMxTlVrL05sSjVNalpjZU1xYXNIbCtHQVpGRHF3WXdPaTZhRXI3Y0E5?=
 =?utf-8?B?enVLWnY3Q3JjeXJtU0FnbVgxTFBTQnl1Qmd0RWgxbG0xcHhaN0ZQaVlqRW5F?=
 =?utf-8?B?aVd0VkJaVkpBdGNQaFBvU052UE13OTFzVjMyWXlSRmlCMFIvTlQ0SVlnR2ht?=
 =?utf-8?B?akxoSjBvWHBWN3lGYmVINXExWjlpdC9UbTZJZE1zNWhTRUlBZkgxQXJVRDk3?=
 =?utf-8?B?Rk1CczdPem9CUmN5V2Y2VTdKZVcyM0dmRzVES2FDd3JPRnJhdGNvRlczRTN5?=
 =?utf-8?B?a0h6UUM1N05hVXd0dkNzS3B2MnNFLzhjaVk3MzVabUFPeTVkSTJ4WmMvcTh6?=
 =?utf-8?B?RnpXeXNQRTAyTXhoY1JxTnFWU3pSc0oyMWU3d0ZhK0RBbDBuak1RY1hiMURJ?=
 =?utf-8?B?ZDJIR3VzYU9pRmF6VkV5Qm85QVJzOVM0MmxXbGg2SHJwK0ZqQWZXc1RKTzJh?=
 =?utf-8?B?RjhZRlY1V1J2WDRQNFZ4MHd0bnBmNDdwc0lMYUR5enJYU09oSGdYVmJqZUhp?=
 =?utf-8?B?SVZUUW5yK3l4MGxXVEdJYUg2dE1mbjVjNHI3aE9yWlFKVHVIUXJXTFhsM1dz?=
 =?utf-8?B?eTBDSytoOWl3WmpyejZSa1NIZm1Hc0lSMkMwVnQyZEJKRmEwSDd2Nm9YQWRk?=
 =?utf-8?B?b1g3ME9xSDhwaUYwZlRMSDVFNHVSN0c1TlEwVVRTemlMck1EdTh4TUJPb3VJ?=
 =?utf-8?B?SlFCcmFkZ3V3RksvRzFlWmQrM3NxbStHWE9pTWwwSFowSjdUQk00L0RhRXZl?=
 =?utf-8?B?WCtRSDJlbEZkQzNRZGp5andGeDhZdzFSdFJvL0JreGVZcWxrVG4rQ0Myb2ZK?=
 =?utf-8?Q?i2tIkvssAjEKfB5l0zSWGTqWrXqq6pHb7EYAEVW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzJRZ3NMNDBrWEo2blNEcm5DelFVQ1JUdGRWM2NpLzFXVDJvSVQ2M3JkUnBx?=
 =?utf-8?B?cjFZRVFjQVlzZzd4WmJiS2Nvald1QmJtYWNacm55MkZJMmhZelBocnpCd1h0?=
 =?utf-8?B?NnFORXVYNFl4dDBvWUIwZFdBQy8ydGdIbGlMM1Y2ZXJrZHo5VzRLemNiKy94?=
 =?utf-8?B?TlFPVGhTUmlTM1pQYU9HMlpSWEdJN1FFQ1A4WVJ5TDBWM1hCV3hnaTVIZzRV?=
 =?utf-8?B?UzFyM1VTSXNTb1RDMkFnMUZsZGg0SFdaem1Wc2JaSFBPSitKUHpocmxBVTBR?=
 =?utf-8?B?MVJjc0pLaDFqSnZ1aFB4UkpCb0RmbFBkK0QxMGdHNWhUbjlvSlNKVkNFekUv?=
 =?utf-8?B?aXFwd2RQd1NSOHlmVTRFRXNlbFpaa0U0Q2ZJTU9hc3VndkJXdFBtMVVMMmR3?=
 =?utf-8?B?Tk5XRzh6U2dJdzBmL081U24vZFhFWXpoalN3ZU9ucDArekI1MytjdWFzQUVL?=
 =?utf-8?B?c2xxcVpzRmJOMm4vVjVHOXowZ0pvbk9La1JqanlqSEQya3Rxb0tVRG9FUUNn?=
 =?utf-8?B?WmdDUEk0UkUrY1FFTVByd0xYTjdUZml6N3R3WVBUanhNODlBcUovU2ZVTGNH?=
 =?utf-8?B?dGl1NGplVGdMaHVMVEc2RThQNzZGQ3BvdU1QRzZHVWp2OXlWUEhDVU1iYzV0?=
 =?utf-8?B?eDhucmV6UmtHZjk3eWxkbUZzQ2dZVkxJaTgxQmtvL0FWdzBIamJHK3dHellw?=
 =?utf-8?B?aklVcUNkZ0wwYTJWekI3QWJPbXl1SjFkOWlpTHNsSlNmUVhEZUZkT29KTnRX?=
 =?utf-8?B?YnlzSFZxQkhyS00rQVlEYm5aMXFSelJKK2RMZU9Cd2FnbmdIK1ZYQmkvSC9L?=
 =?utf-8?B?OHZFN3IyUW5TMDF2RVlTakVlMmFka0tTOTlFVWhiRi9yQllIR1liNG9jMTlJ?=
 =?utf-8?B?SXdNMDRYdndjektXZ0tKYytIQm4raTh0ZFBJWUhqVEd6dGIxanpTVlZxZlda?=
 =?utf-8?B?VEVGMWttMnVZcWFlWHlqU1E1ZWRyVkNSdHdPeDJPMWNvL3lzZFE0L1JRRyth?=
 =?utf-8?B?WFpmbW50OTRQdk9saVBLazM4WE1oNkdoYjFsZm40YXVzKzlkMHJ3Rit0UjV5?=
 =?utf-8?B?cEdOK2dBQVpiVTNKanhoVURtaSs5c3dwWWJlN1ZEZ2tzNG5jR0lKdXJydXAy?=
 =?utf-8?B?M0ppcGwyY1hpWDl5SUMxeXlXMUY0NTlGK1Y2N1Rnc0g2VWszR1hlYmtIaHdM?=
 =?utf-8?B?L28zRVJsVno2Y0I5WlF1di81OHNmaDBQVFozMk1UME5UNVBVME0ycXpVaHpX?=
 =?utf-8?B?WmNZOFI2Vy9lc0hCNHlnWjljcGwvaW01OSt1WGNGRkwxbUkzSjdOcnlydHoy?=
 =?utf-8?B?K21wQUQwWkhxR1YxbGVGR2JIYi9nUkRTM0l1VmxubUFsVyszd0lxam1TV2xy?=
 =?utf-8?B?TldGQit0dk54c21Dd3VPR3dsajN3Zk9adjA5SkZyNjhYVE5MWEVqTW9qQ3NI?=
 =?utf-8?B?MVBPeHgwaWMxalFBWVptaG5IeXJMUVlRS1RXZHc0WHRyY0lvK3hESkN4dW9S?=
 =?utf-8?B?WGEzVVhocnBYelNldTk5N2FVRFVSb2dhbll2YjJuN2sxRHV4VWhPRGxUeDVM?=
 =?utf-8?B?OFJLdXBCUFc2RXYwRWlweEI2aW14djl1Z0xrR2U2dFZRR1hENlhmYnlNQmFQ?=
 =?utf-8?B?MTVsNDE0L2hhTldmRUlPQkY5S2hkZ2RBenZIVmdrNlZGZ2U1RjFiclZwbnFu?=
 =?utf-8?B?NUJMK21FalZNM2RlZ3FyVjM2SUZ3aVN5YXk3S1dFcVZaekJzQWlXWFlsbFlL?=
 =?utf-8?B?dkRoU0h3RlJUbXVZUEg1TG0xUk9Vc05SbytVbVYrdm9NV2c5cHhJZVBrdE1h?=
 =?utf-8?B?QUZwcHNKZWNkQXIrUXNnOHFQVFR2dERzcjZhbUMzSlJqWGszb0FKVXcyWmFZ?=
 =?utf-8?B?c0Npa05zTzYra1VjQ1pwK0htUWU4NDhhRU5JZWZNcHBUaXlxc0VTblQrbm16?=
 =?utf-8?B?MmdrMlgxaTFxZXNVNmdJRVA4V0lydTQvZnRuNk9HbXdvcDlYSlVMQVdUNmtx?=
 =?utf-8?B?N0V5SjBacEI5NGw2V1lpY3ozNnI0OFkvS2lPRU0ySG9tSXNCQXZCUEFsenY3?=
 =?utf-8?B?Mmt0UnVOd2ZEMTd0V05QVkd6eW5uUlEybVA5L2cxUXNUWnhSeEpudSt6YmhN?=
 =?utf-8?Q?S6C+npMWG4rb4JPjlu7rtIhhp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 554f082c-6558-4521-f682-08dcf270fd85
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 08:10:28.4710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjw0fIC7SsyR6zSy607sBDxCQ5lSJbe+2vEiKmb7LcUgVtyV51GxN+prlm9EGy+yTVycOOfyOuQsxj2rE3Fnwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10020
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

Hi Maxime,

On 10/22/2024, Maxime Ripard wrote:
> On Tue, Oct 22, 2024 at 03:36:47PM +0800, Liu Ying wrote:
>> Hi Maxime,
>>
>> On 10/21/2024, Maxime Ripard wrote:
>>> On Mon, Oct 21, 2024 at 02:44:43PM +0800, Liu Ying wrote:
>>>> +static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
>>>> +				      struct drm_bridge_state *bridge_state,
>>>> +				      struct drm_crtc_state *crtc_state,
>>>> +				      struct drm_connector_state *conn_state)
>>>> +{
>>>> +	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>>>> +	int ret;
>>>> +
>>>> +	ret = drm_atomic_helper_connector_hdmi_check(conn_state->connector,
>>>> +						     conn_state->state);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	return mode->clock > MAX_PIXEL_CLOCK_KHZ ? -EINVAL : 0;
>>>
>>> drm_atomic_helper_connector_hdmi_check will already make that check, so
>>> it's redundant.
>>
>> MAX_PIXEL_CLOCK_KHZ is 150MHz. With 150MHz pixel clock rate, we'll get
>> 150MHz HDMI character rate for 8bpc and 187.5MHz HDMI character rate
>> for 10bpc, both are lower than MAX_HDMI_TMDS_CHAR_RATE_HZ = 225MHz.
> 
> I guess? I have no idea how that's relevant though. Where are those
> constraints coming from, and why aren't you checking for them in
> tmds_char_rate_valid?

All constraints come from IT6263 data sheet. They are also mentioned
in IT6263 product link(commit message contains the link).

https://www.ite.com.tw/en/product/cate1/IT6263

"
LVDS RX
Support input clock rate up to 150 MHz

HDMI TX
Support link speeds of up to 2.25 Gbps (link clock rate of 225 MHz) 
"

If no objection, I'll check mode clock rate against
MAX_PIXEL_CLOCK_KHZ in tmds_char_rate_valid.

> 
>> So, it looks like pixel clock rate is the bottleneck.
> 
> The bottleneck to what?

To the IT6263 video processing throughput capability.

> 
>> Remove drm_atomic_helper_connector_hdmi_check() or keep this as-is?
> 
> No, like I said, remove the final check for mode->clock.
> 
> Maxime

-- 
Regards,
Liu Ying

