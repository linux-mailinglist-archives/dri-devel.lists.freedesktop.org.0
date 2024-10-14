Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D3B99BF66
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 07:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FCD10E193;
	Mon, 14 Oct 2024 05:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="jLf4kU5z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2047.outbound.protection.outlook.com [40.107.105.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD63D10E193
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 05:33:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1zXdpnLgj9PFemllJBgqhvWEPId+4ynDqslM8+vkzU/KszH96SUcDWPUpreazYZWzFdblAUiCX+3C1Fe0vKdbLON3HWGKNqsyxnqBTqB1TiIzHyu/F0PUbibGgOqgNHvDL5IlbQ0qXqhqngHLoF63xMA7OYh2J7xftPSe7CzAhzgNZHgIwvpruDHg0/uPeP8jANTjhfck5RDdh+u+I+M0ou4XqhtAuu04jc2gZyvGt5inNWdwbNLbeP87qpPemMmaHOtQvK5eak8htcjjUOvG0qhiLdmFLlL+U6N0bWNHuLZYk3xP7Cel2AjZAnqqa1Yhlx3gmB9ir8iEqKWErYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5zRSIpRa9g1a9G7lbZFx4WXsgmzW2OeQgQUv2vHdPs=;
 b=XK4eUtfESeSaf25J6t83Wa1vJXGP5Wyq2BoPZPFOQcD+fmeeCZgTQi77JJpJRn1P2Zhc1IuPTpxc+y2rkuKvNkcWgn+w+wamB0Aox1O3opzo4VTdIndS3McO1I2tKNI9Sbqg2vGcJGz4sdr7f3twMQ/3lx27++gNxUsCTl1XZzYlttpO+dVxODBWcQ9rBCQoQnHlmCJFbDeNyi2z9p6myGWdjBfwzYsgdRM7mEjqQFyM1J4DmfFT4T5k5mzn7o+xPFROzV/VawdjF+hdEog3qiOABXfGxmmkIf6sUvN/xwd4/Qz9lvwEnmiX7QH0AoSP6xNYDBjUqMSwabh7QlwVpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5zRSIpRa9g1a9G7lbZFx4WXsgmzW2OeQgQUv2vHdPs=;
 b=jLf4kU5z7imYqchpGuuVqSMF5D/lvE9a56FdtGgIIMOXWki0zJInf6rQD0AhecDBRLplB0CHVIgpQSitvaI0ORGSM3pYOf/oUce/nwntBjmFUvItym5/E9bty4dTjFpC890GuuGfX+5W5tgVVhPwH1hhGFKPXtnitxJbkIE4pl8+G3CCdcjzmP7fiPk9lcy6IUnfM8RgahytSaznNeLxm5r3SLtHyKTKD0wJRNyi4+NbAPlesZeZx3iXh8jMAqjcqJwhimyzZi33d6UkSGob5JeKyVAd2vIxxh91rzcidBiMs7pGAS5vnkqAt+MqmRGooHo6iFqntQDZH6/7AXpbhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8080.eurprd04.prod.outlook.com (2603:10a6:102:1c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 05:33:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 05:33:19 +0000
Message-ID: <90e0c4ac-1636-4936-ba40-2f7693bc6b32@nxp.com>
Date: Mon, 14 Oct 2024 13:33:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS
 to HDMI converter
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, o.rempel@pengutronix.de, y.moog@phytec.de,
 marex@denx.de, isaac.scott@ideasonboard.com, biju.das.jz@bp.renesas.com
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-6-victor.liu@nxp.com>
 <4a7rwguypyaspgr5akpxgw4c45gph4h3lx6nkjv3znn32cldrk@k7qskts7ws73>
 <07b47f70-5dab-4813-97fa-388a0c0f42e9@nxp.com>
 <dvcdy32dig3w3r3a7eib576zaumsoxw4xb5iw6u6b2rds3zaov@lvdevbyl6skf>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <dvcdy32dig3w3r3a7eib576zaumsoxw4xb5iw6u6b2rds3zaov@lvdevbyl6skf>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2P153CA0010.APCP153.PROD.OUTLOOK.COM (2603:1096::20) To
 AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8080:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c5de481-af42-4223-b97b-08dcec11b634
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2Urczg3N3EreHVpaVVnTXZWOEVMOElzSGNndUdpRjhWbzhoV3pmRk5OYm1Y?=
 =?utf-8?B?dWNhRzdZcE01dG96M2dYQVdIRk55dzFWcjVKRnVRUjF4SEpJd1NiYnJUQlhL?=
 =?utf-8?B?clh3aXFXd1pCRVRONFRaVklpN3RZUk9qNDVpR0NuZmttaXZhbEtBeXhvcmpP?=
 =?utf-8?B?ZTd5UzJqdGhSQklYTVg1SUtLL29BSVR5SjdsbTM1T2tOdmNDcS9hYndHUURk?=
 =?utf-8?B?M0tJNjNrZDRqbDFkRW96eEtjOU1zenIxUlRhUDdBVDJyWG1sY3hXYUcra01i?=
 =?utf-8?B?Qml4SFRxZncvbll0N1Z0cEQrRzQweDlkZ2wrck4wb3U1Q3p1N2o2djhabEVU?=
 =?utf-8?B?bmFQRVNDdmtrMzNZWENBbXpMdFN0Vi8yOGNvaDJ4UWlQQzErbWlwSWswNVZH?=
 =?utf-8?B?SnJZS0ZzbU1TS1Y4REdRdk1zc1p0TzJkUHFvUi9MYmRoMnI1MjhpK2FvNFUr?=
 =?utf-8?B?RlArSllLRTZielNoendGYkxoNS8yTEdoZEZ3NkQ2My9jYzdnM2thN29YZ3B6?=
 =?utf-8?B?andJSXpWWGJTMGtNQ0ZxV1pUWGgxSXNSRG00Z01LS3hIRk1DZUJvZGowaVZt?=
 =?utf-8?B?MGEvVTNOWnJjTW9vMk5RVXJ4ZVJJeEltZmpReUoxelZuem1jQmJyUW44Y1Rm?=
 =?utf-8?B?ejE2bVl1RUdBQ1YyNjliVW8vK0IrY3BzMXVvM3BRNlNCUlQvcnlJUVpzZmhj?=
 =?utf-8?B?dlViSXIzU3AvRU1wNWNna1ZHN1Q4a1JFclVFMWI4UHFkbDZXRVhOTVpGMjVO?=
 =?utf-8?B?T01wZWVTQXpnbzJxSmRlbGUyUHV3VGI1dFRRM2U4MVN0bGQxMmlYa3dTbEpM?=
 =?utf-8?B?ZzZnZ3BiVnN0SmpSd1FlaWJBdlBxN2htUm9qQW9CbklNWjVHZWFLT2hDazc5?=
 =?utf-8?B?Ymg3RTdsQXJnaUJySFZWRWsvd3d3Um8xMjJYS09tTlZ2QU85NThVanNkTkhu?=
 =?utf-8?B?VVU0ai85ZnJuQ0FTTWs0K3RGN1RCRkEzcTYva3NaRzIzdnhuQVRVV1Q2NTEy?=
 =?utf-8?B?MVBva3ltQW1za2VZSll1TWdJMHk1U1VnYnQwTWtGMHBSVmRoU2JwVmpaQ0x6?=
 =?utf-8?B?MFFzT1VCUGZsUlNKdkpaZHN1VU5aciswTS9CMStqMnJhWHNkMTRnbnFrZ2wy?=
 =?utf-8?B?Sm1sdkVLcTUrdVdmUmhieWdJb3RKblVheUhwNCtCSEZ1Z2QwVXNKcmpSekMw?=
 =?utf-8?B?Z3hOdDJoaUpoalFzenhqRW1zYmNxNkpaTXFUWTlRZlRhakRTcTlBZHBwelpF?=
 =?utf-8?B?K0FlTnp0a0NWUXBqampCZGlibEFIQ3MyNHY4bG9ZSGtLNkRLNW0wNFg0Znh1?=
 =?utf-8?B?TmZoNHh3eG11ZEpkRWpZWEY5YjUxVmMxbEFRbU1BNFhaZ1pCQW03aHlEdDVJ?=
 =?utf-8?B?dFJXWUx6ODk3U203Y01hTjJ6M3pxZkF4c043eUhDTFJUMUt2aUM1alNmYTd3?=
 =?utf-8?B?TXJqTkhXclVCWkhZaVVUMGRCeE9NUUhkK0NRODFHSHNwY3lheW5iNzlnZ2RH?=
 =?utf-8?B?eDRBWDBLUGFzbHpMaEFNYWdTU01YbUNVYzUxYUVXa1pPWUlIWElrTTd2SkJi?=
 =?utf-8?B?MHZwL09zUXBmVys2VlRHT2ZQUTJzYnpPVkNSemY4blhqb0pzTUY4YU5VL0Yr?=
 =?utf-8?Q?inf0q6Iyg8si5k2qObEEr+hzYiDmDIZr1JKbBsSJOvV4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0JFL1h4clUvR2lyL0wrQmFKNGxVRFU2a0pnK2d6QlNYRE9uYVRtNkJkdFhh?=
 =?utf-8?B?aEVmOERNQVFrVUR4aXlMZzFlcFJkQXdqWE9OWVhTWjRaT0dvUGttakNTUXpz?=
 =?utf-8?B?YU82dlI2RXI4cDdqRm1qdFBncGdtaTl3a1ptWFBnQy93bG8wTE43UHZsdGtI?=
 =?utf-8?B?N3FhbXAyQ0VDWUJndFllM1NLbUVHNkdib3BWQlJscWc4T2VMMmlrbHFQd0U5?=
 =?utf-8?B?eTk4VzNHNlQrTG5kS0dWSi9HOVBVdVQrc0Ftb0xRZkcwNlExSUFEY1pObmFM?=
 =?utf-8?B?aGNpU0M4NkNGT2pMOHBjcUpYMXhCcFNKOU5wcThZNEdYc3NwQk41T01vazJr?=
 =?utf-8?B?djlnWGlSbkJMWmpCOVMySDRCdTZUOGc2WG9OVW1IY3IrYko4a0RmWDAyLzNv?=
 =?utf-8?B?ZWNYbzN2OXo5YlZYZ0VuV3lHbGl4THFtdXdKSExqWm1MUklhWEdXaWJrVXNa?=
 =?utf-8?B?MGM3SFdCQ1pmdFQyVnB4NUtiUVh1YXBoblpjUGhna29UVGpBN1JFT3RSUlgy?=
 =?utf-8?B?dXlMMllTc0t1dmVpMlJQc09iY2REOERua1J6VWxFa1J0Vm9TQ0JlcWRaY1ly?=
 =?utf-8?B?Y1RsZnUwUktTSHVxRHF1MEUrOTl4cVNsSFNCMjFlWWJhL0xqV0JsZGxBdDlV?=
 =?utf-8?B?MGpyd1dJK3ZIL3NGcG9vN2RrRlFydEtoejhpdHM4TmE0RHJFektCa2RtcERR?=
 =?utf-8?B?UlFydzBLYWZyYVduaisrazl6WTdMUElsTlVFclo0Nmx6N0lUTGdGR1JyY1Zk?=
 =?utf-8?B?ZnFkRjB3VlA3TXpycEh0b1BKdVlZQ2gwemxFZFZ6WmZvaWt2OHNCeXA4anBs?=
 =?utf-8?B?RmRHTmJJRm5XQUpzQldVMzM1YVhKV1dZNllRVWRrNUdOOHMrTzZBcVFDWWRx?=
 =?utf-8?B?ejJQOW9xUFpwRnhCRVNIMXpyWGxQcEFUNmZDZnA0UXpvUzhpSGZueGZqVTFX?=
 =?utf-8?B?bXBYRFlpRi9VL1hnN0lBNDYvam5aSmg0V3I5enN2azdnaXBLUzNRVXhrYk0r?=
 =?utf-8?B?QTZWUUhWZE1aM1YzNXc3WkRvRUtFUHVpaGF5a3JZRHZnU01TVXFBTTVVc2pS?=
 =?utf-8?B?aWFWOXV1TEgvNG1GeW9RNEJVelpsdU9MbGJTZEhtd1o0aE1iV2ZlSCtjSnJD?=
 =?utf-8?B?dE03ci9FdGhpcXozRXVvS3Vjb0ZyQjRSUXE0SDlLeW82NjNlMndaa21FODNM?=
 =?utf-8?B?S1VXKzh6UWJ5dnpvWXlqMDNoMnlRMWd1aHJ6R004RFQvSmhobDFkVGhTYmZ4?=
 =?utf-8?B?RWU2bm4vU1pPNCtJbEM4dnE3YVAyTkhvWURUN3MzVmtlTEJhSHFISGZ5TXdX?=
 =?utf-8?B?V3dmVTBzUnZYdEJzcnMxL1FpbnJCRDduTEhTendwTVFISDE2WGpXelh0ZC9F?=
 =?utf-8?B?N1VHa1hqVDl4Q1JteDdwQUliTGJ1Sk9oY2JwQzhaZlk1eXZtYVZ4Qzdyd09x?=
 =?utf-8?B?TC9DN2N0MnR3VmZYUk9BQSs4T0YwekswZ1YzWUVuUXhJM0FGSTBxVGszNnQv?=
 =?utf-8?B?Sy9MZytwbVNJVDN6T0JwRW03Q1ZiZGpQeW03REUzTlBHMm9NOEt2aXh4TnpZ?=
 =?utf-8?B?UWFpM2d1S3hQc3dxY21yNklRMDBveUc0eUhCZjRjU2dieWFKdkNjL0JZb0Fw?=
 =?utf-8?B?cCtCZ1FOSXdpMUM5YUVzSEJvUHAxVXlIYWpsK3RIZ1cydmFKRXBnOE0zQ0Iz?=
 =?utf-8?B?bDF4V3BSdkdIRDkvRytXQzFGYzlOSGxORkFUZ2hQOTYxSnkvVndLSnYvNHU1?=
 =?utf-8?B?alZjNXJqdzNsMmJZVUFlYXFBT25iK3duME16N0V2RGVNZWFqV3BaZWxqUzh0?=
 =?utf-8?B?OW9uZnlGcFZ3N3RDTW5GaWoyK1dkZUhmR21DTCtyUERUSVB2NnEzK3JzRVZB?=
 =?utf-8?B?dm4rMy8yNmRJOWhUUTlHVmRkcVQyZm9jL2hkckJkWEdzWEFZNWZWTTQ1T1B6?=
 =?utf-8?B?aWx0MzNHeFoweGhXcThpcklyV2NKVnREWXBkRkdpTklnbkdlSHpIRms0Ykpj?=
 =?utf-8?B?cUxlZTlpempWVWhiOWhQVm1EdU5YUVdJWDNWQks2MlU5WXZxQ2VXWkxsbVd1?=
 =?utf-8?B?R1kzdVlJVGx1SHMyUGhiYVBaK3F5Nlh3V3Q0eVh0cUFFc3NlUHVGMUhsejY2?=
 =?utf-8?Q?asJxbuXxO5Wctnxo+qNLRvKtz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5de481-af42-4223-b97b-08dcec11b634
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 05:33:19.8084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DM/ov20wzB9dQpy49YckWfb3b2qigTeYaAs0qOuNkzXKn/a2fkZ5n7LN/WYtHQANlPOPLUXt8KVCaCIA8IOcSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8080
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

On 10/14/2024, Dmitry Baryshkov wrote:
> On Sat, Oct 12, 2024 at 05:14:13PM +0800, Liu Ying wrote:
>> On 10/12/2024, Dmitry Baryshkov wrote:
>>> On Sat, Oct 12, 2024 at 03:35:39PM +0800, Liu Ying wrote:
>>>> Document ITE IT6263 LVDS to HDMI converter.
>>>>
>>>> Product link:
>>>> https://www.ite.com.tw/en/product/cate1/IT6263
>>>>
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>> v2:
>>>> * Document number of LVDS link data lanes.  (Biju)
>>>> * Simplify ports property by dropping "oneOf".  (Rob)
>>>>
>>>>  .../bindings/display/bridge/ite,it6263.yaml   | 276 ++++++++++++++++++
>>>>  1 file changed, 276 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>>> new file mode 100644
>>>> index 000000000000..bc2bbec07623
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>>> @@ -0,0 +1,276 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: ITE IT6263 LVDS to HDMI converter
>>>> +
>>>> +maintainers:
>>>> +  - Liu Ying <victor.liu@nxp.com>
>>>> +
>>>> +description: |
>>>> +  The IT6263 is a high-performance single-chip De-SSC(De-Spread Spectrum) LVDS
>>>> +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a transmitter,
>>>> +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
>>>> +  The built-in LVDS receiver can support single-link and dual-link LVDS inputs,
>>>> +  and the built-in HDMI transmitter is fully compliant with HDMI 1.4a/3D, HDCP
>>>> +  1.2 and backward compatible with DVI 1.0 specification.
>>>> +
>>>> +  The IT6263 also encodes and transmits up to 8 channels of I2S digital audio,
>>>> +  with sampling rate up to 192KHz and sample size up to 24 bits. In addition,
>>>> +  an S/PDIF input port takes in compressed audio of up to 192KHz frame rate.
>>>> +
>>>> +  The newly supported High-Bit Rate(HBR) audio by HDMI specifications v1.3 is
>>>> +  provided by the IT6263 in two interfaces: the four I2S input ports or the
>>>> +  S/PDIF input port.  With both interfaces the highest possible HBR frame rate
>>>> +  is supported at up to 768KHz.
>>>> +
>>>> +properties:
>>>
>>> No LVDS data-mapping support?
>>
>> It is enough to document number of LVDS link data lanes
>> because OS should be able to determine the data-mapping
>> by looking at the number and the data-mapping capability
>> of the other side of the LVDS link. 
> 
> From what I can see, data-mapping is specified on the consumer sink side
> of the LVDS link. This means it should go to the bridge's device node.

Then, I won't define data-lanes, because data-mapping implies it,
e.g., jeida-24 implies data lanes 0/1/2/3, see lvds-data-mapping.yaml.

Please let me know which one you prefer.

> 
>>
>>>
>>>> +  compatible:
>>>> +    const: ite,it6263
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +    description: audio master clock
>>>> +
>>>> +  clock-names:
>>>> +    const: mclk
>>>> +
>>>> +  reset-gpios:
>>>> +    maxItems: 1
>>>> +
>>>> +  ivdd-supply:
>>>> +    description: 1.8V digital logic power
>>>> +
>>>> +  ovdd-supply:
>>>> +    description: 3.3V I/O pin power
>>>> +
>>>> +  txavcc18-supply:
>>>> +    description: 1.8V HDMI analog frontend power
>>>> +
>>>> +  txavcc33-supply:
>>>> +    description: 3.3V HDMI analog frontend power
>>>> +
>>>> +  pvcc1-supply:
>>>> +    description: 1.8V HDMI frontend core PLL power
>>>> +
>>>> +  pvcc2-supply:
>>>> +    description: 1.8V HDMI frontend filter PLL power
>>>> +
>>>> +  avcc-supply:
>>>> +    description: 3.3V LVDS frontend power
>>>> +
>>>> +  anvdd-supply:
>>>> +    description: 1.8V LVDS frontend analog power
>>>> +
>>>> +  apvdd-supply:
>>>> +    description: 1.8V LVDS frontend PLL power
>>>> +
>>>> +  "#sound-dai-cells":
>>>> +    const: 0
>>>> +
>>>> +  ite,lvds-link-num-data-lanes:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint8
>>>> +    enum: [3, 4, 5]
>>>> +    description: number of data lanes per LVDS link
>>>
>>> Please use data-lanes property inside the OF graph.
>>
>> In both port@0 and port@1?
> 
> Yes

I'm assuming if data-mapping is defined, then no need to
define data-lanes.

> 
>>
>>>
>>>> +
>>>> +  ite,i2s-audio-fifo-sources:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    minItems: 1
>>>> +    maxItems: 4
>>>> +    items:
>>>> +      enum: [0, 1, 2, 3]
>>>> +    description:
>>>> +      Each array element indicates the pin number of an I2S serial data input
>>>> +      line which is connected to an audio FIFO, from audio FIFO0 to FIFO3.
>>>
>>> What does that mean from the board point of view? Routed audio links for
>>> the multichannel audio?
>>
>> Yes, also for single channel audio.
>>
>>>
>>>> +
>>>> +  ite,rl-channel-swap-audio-sources:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    minItems: 1
>>>> +    maxItems: 4
>>>> +    uniqueItems: true
>>>> +    items:
>>>> +      enum: [0, 1, 2, 3]
>>>> +    description:
>>>> +      Each array element indicates an audio source whose right channel and left
>>>> +      channel are swapped by this converter. For I2S, the element is the pin
>>>> +      number of an I2S serial data input line. For S/PDIF, the element is always
>>>> +      0.
>>>
>>> Why?
>>
>> Because this converter has the capability to swap right channel
>> and left channel and S/PDIF always uses audio source0. 
>>
>>>
>>>> +
>>>> +  ports:
>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>> +
>>>> +    properties:
>>>> +      port@0:
>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>> +        unevaluatedProperties: false
>>>> +        description:
>>>> +          The first LVDS input link.
>>>> +          In dual-link LVDS mode, this link works together with the second LVDS
>>>> +          input link, and one link receives odd pixels while the other receives
>>>> +          even pixels. Specify the pixels with one of the dual-lvds-odd-pixels
>>>> +          and dual-lvds-even-pixels properties when and only when dual-link LVDS
>>>> +          mode is used.
>>>> +
>>>> +        properties:
>>>> +          dual-lvds-odd-pixels:
>>>> +            type: boolean
>>>> +            description: the first sink port for odd pixels
>>>> +
>>>> +          dual-lvds-even-pixels:
>>>> +            type: boolean
>>>> +            description: the first sink port for even pixels
>>>> +
>>>> +      port@1:
>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>> +        unevaluatedProperties: false
>>>> +        description: the second LVDS input link
>>>> +
>>>> +        properties:
>>>> +          dual-lvds-even-pixels:
>>>> +            type: boolean
>>>> +            description: the second sink port for even pixels
>>>> +
>>>> +          dual-lvds-odd-pixels:
>>>> +            type: boolean
>>>> +            description: the second sink port for odd pixels
>>>> +
>>>> +        oneOf:
>>>> +          - required: [dual-lvds-even-pixels]
>>>> +          - required: [dual-lvds-odd-pixels]
>>>
>>> This still allows one to specify that both ports provide odd pixels. Is
>>> that expected? Also why do you need two properties which specify the
>>> same option.
>>
>> No, that is not expected. Description for port@0 already mentions
>> one link receives odd pixels while the other receives even pixels.
> 
> That's not expected, but permitted by the bindings.

It is not permitted by port@1. If "dual-lvds-odd-pixels;" is added
to port@1 in the dual-link LVDS example, the below warning will be
generated by dt_binding_check.

Documentation/devicetree/bindings/display/bridge/ite,it6263.example.dtb: hdmi@4c: ports:port@1: {'reg': [[1]], 'dual-lvds-even-pixels': True, 'dual-lvds-odd-pixels': True, 'endpoint': {'remote-endpoint': [[4294967295]]}} is valid under each of {'required': ['dual-lvds-odd-pixels']}, {'required': ['dual-lvds-even-pixels']}
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#

However, the binding for port@0 does allow DT writers to specify
both even and odd pixels. I raised similar concerns in v1 discussion.
According to Rob's comment in #devicetree IRC, the ports property
is simplified to this form and more description for port@0 is added
to tell when to specify the even/odd pixels.  If you know any better
way to indicate the constraints, please shout.

> 
>>
>> Two options are supported for dual-link LVDS, not the same option:
>> 1) LVDS link1(port@0) gets odd pixels
>>    and
>>    LVDS link2(port@1) gets even pixels.
>>
>> 2) LVDS link1(port@0) gets even pixels
>>    and
>>    LVDS link2(port@1) gets odd pixels.
>> That's the reason why each port needs two properties to define
>> odd/even pixels.
>>
>>>
>>> My suggestion would be to add a single root-level property which
>>> specifies which port provides even pixel data.
>>
>> That won't work.  The LVDS source side expects the ports of
>> the sink side specify dual-lvds-{odd,even}-pixels properties.
> 
> I didn't notice that these properties are already defined.
> 
> As these properties are common between several schema files, please
> extract them to a common schema file (like lvds.yaml).

I'm not sure how to do that. Is it obvious?
Please shed some light. 

Only two panel schema files are defining even/odd pixels now -
advantech,idk-2121wr.yaml and panel-simple-lvds-dual-ports.yaml.
Maybe, extract them later when more schema files(especially for
bridges) try to define the same?  I'd like to keep a low profile
for now.

> 
>>
>>>
>>>> +
>>>> +      port@2:
>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>> +        description: video port for the HDMI output
>>>> +
>>>> +      port@3:
>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>> +        description: sound input port
>>>> +
>>>> +    required:
>>>> +      - port@0
>>>> +      - port@2
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - ivdd-supply
>>>> +  - ovdd-supply
>>>> +  - txavcc18-supply
>>>> +  - txavcc33-supply
>>>> +  - pvcc1-supply
>>>> +  - pvcc2-supply
>>>> +  - avcc-supply
>>>> +  - anvdd-supply
>>>> +  - apvdd-supply
>>>> +  - ite,lvds-link-num-data-lanes
>>>> +  - ports
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    /* single-link LVDS input */
>>>> +    #include <dt-bindings/gpio/gpio.h>
>>>> +
>>>> +    i2c {
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <0>;
>>>> +
>>>> +        hdmi@4c {
>>>> +            compatible = "ite,it6263";
>>>> +            reg = <0x4c>;
>>>> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>>>> +            ivdd-supply = <&reg_buck5>;
>>>> +            ovdd-supply = <&reg_vext_3v3>;
>>>> +            txavcc18-supply = <&reg_buck5>;
>>>> +            txavcc33-supply = <&reg_vext_3v3>;
>>>> +            pvcc1-supply = <&reg_buck5>;
>>>> +            pvcc2-supply = <&reg_buck5>;
>>>> +            avcc-supply = <&reg_vext_3v3>;
>>>> +            anvdd-supply = <&reg_buck5>;
>>>> +            apvdd-supply = <&reg_buck5>;
>>>> +            ite,lvds-link-num-data-lanes = /bits/ 8 <4>;
>>>> +
>>>> +            ports {
>>>> +                #address-cells = <1>;
>>>> +                #size-cells = <0>;
>>>> +
>>>> +                port@0 {
>>>> +                    reg = <0>;
>>>> +
>>>> +                    it6263_lvds_link1: endpoint {
>>>> +                        remote-endpoint = <&ldb_lvds_ch0>;
>>>> +                    };
>>>> +                };
>>>> +
>>>> +                port@2 {
>>>> +                    reg = <2>;
>>>> +
>>>> +                    it6263_out: endpoint {
>>>> +                        remote-endpoint = <&hdmi_in>;
>>>> +                    };
>>>> +                };
>>>> +            };
>>>> +        };
>>>> +    };
>>>> +
>>>> +  - |
>>>> +    /* dual-link LVDS input */
>>>> +    #include <dt-bindings/gpio/gpio.h>
>>>> +
>>>> +    i2c {
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <0>;
>>>> +
>>>> +        hdmi@4c {
>>>> +            compatible = "ite,it6263";
>>>> +            reg = <0x4c>;
>>>> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>>>> +            ivdd-supply = <&reg_buck5>;
>>>> +            ovdd-supply = <&reg_vext_3v3>;
>>>> +            txavcc18-supply = <&reg_buck5>;
>>>> +            txavcc33-supply = <&reg_vext_3v3>;
>>>> +            pvcc1-supply = <&reg_buck5>;
>>>> +            pvcc2-supply = <&reg_buck5>;
>>>> +            avcc-supply = <&reg_vext_3v3>;
>>>> +            anvdd-supply = <&reg_buck5>;
>>>> +            apvdd-supply = <&reg_buck5>;
>>>> +            ite,lvds-link-num-data-lanes = /bits/ 8 <4>;
>>>> +
>>>> +            ports {
>>>> +                #address-cells = <1>;
>>>> +                #size-cells = <0>;
>>>> +
>>>> +                port@0 {
>>>> +                    reg = <0>;
>>>> +                    dual-lvds-odd-pixels;
>>>> +
>>>> +                    it6263_lvds_link1_dual: endpoint {
>>>> +                        remote-endpoint = <&ldb_lvds_ch0>;
>>>> +                    };
>>>> +                };
>>>> +
>>>> +                port@1 {
>>>> +                    reg = <1>;
>>>> +                    dual-lvds-even-pixels;
>>>> +
>>>> +                    it6263_lvds_link2_dual: endpoint {
>>>> +                        remote-endpoint = <&ldb_lvds_ch1>;
>>>> +                    };
>>>> +                };
>>>> +
>>>> +                port@2 {
>>>> +                    reg = <2>;
>>>> +
>>>> +                    it6263_out_dual: endpoint {
>>>> +                        remote-endpoint = <&hdmi_in>;
>>>> +                    };
>>>> +                };
>>>> +            };
>>>> +        };
>>>> +    };
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
>> -- 
>> Regards,
>> Liu Ying
>>
> 

-- 
Regards,
Liu Ying

