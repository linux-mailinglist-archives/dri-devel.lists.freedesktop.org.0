Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EDC99B272
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 11:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0BF10E057;
	Sat, 12 Oct 2024 09:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Xsz+C5dj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2070.outbound.protection.outlook.com [40.107.22.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988D610E057
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 09:13:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B86v/uYEhR1EN+Bcp+z6tzTEjuwNE0y37/DXuQ1mEYuJGy2mJlNhva2fv3OKm1v7/pV47h38ULaMwSkB0NbJMZ3+Xf2eQ7YZiA3zAeIrPGLqyq+WbxkdaHdC8VCgyg4WKHMbblufZ55qdl+ZHRnfBOWvla4cF0JFRXGDlpBALnp6gjiFw9pY5hiy3kXNP4c4sWZfNDNffE7KpmyR449gkuJSPfKFynu/vSKlx9jZdTqzheC/W1k0pYjzuFKaUkHT/C4tF95sDFE39ZG0IvPnuou1imtrecJ4cs4nWPP3/uWCCG56Qu2Qw608tfhOCkojIY5Hduy/wETOh8OPtoKRzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeB5/bD83LybU3JC++izIdjveH+4EdODm1z43xFFYf4=;
 b=CuNSYfCo/4+9BZFwVpWStAJ+uptfutgt4xa6HqokKVNk6n1PBJBkTcHp5E32UAPqq3Yl5iz7UOaeLf6gWbtxNm6otniZCbKiRzMISUIRtr8hCMMxcYsCekBjUHwu91asinfBd4nkVF7xRnBJM+zfVmZJ1Axxbkmp4xkbqhnIgwmWqc38gqKoCdRmTWSRoCqLNWp67jufwJOeCv8Lkw8aNJvBODUyh22lkBmifPn9Ze418FCOVjTyiR2ZVu65hb/wtWVDjD36oMovXBGllNWedy1S7uV/AbRuWkJ9KSyaIIMnYDJKC58UyuWQ7YzQKlVTkrblngJgf4ojvv+g4wyf9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeB5/bD83LybU3JC++izIdjveH+4EdODm1z43xFFYf4=;
 b=Xsz+C5dj0ihj5lyJlfxT0/N16tPCD+JW30F/IlBlo2/KZGSarFl57NwJX+UaSJGNKunYxt73P/6f9OoHZJna/M5F1mtbkYfV9PLyTRVTaEc1JRIvP3p3610g/Afn9ObzyTQw2456+3PAF8y869yMsjjF1HNVenRnsfHECVTgXmJv9CdilXkAPse9ohg8kbH60PYEMCVRRfUvJUV3TI7Xh15X0HhAcVfMaH1YpuZrf54Id5UO0ldjRhrXDMmCW1qXe37+7XGnAVT31E8ijugTiKAGkrp1RMBKtZZbYdpz+vFfjYcAb/dKHIsXK7rmqKQoT0x4hhBST4VS0RR/+tEZbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8990.eurprd04.prod.outlook.com (2603:10a6:102:20d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.22; Sat, 12 Oct
 2024 09:13:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.020; Sat, 12 Oct 2024
 09:13:50 +0000
Message-ID: <07b47f70-5dab-4813-97fa-388a0c0f42e9@nxp.com>
Date: Sat, 12 Oct 2024 17:14:13 +0800
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
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <4a7rwguypyaspgr5akpxgw4c45gph4h3lx6nkjv3znn32cldrk@k7qskts7ws73>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8990:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ec122ad-f3ef-4c55-d314-08dcea9e2f95
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ujc5eWhHTGg1YUl0eGIraks1eFdKWjVwV29ackNEOGs5eUx6d0RpeklEbmFK?=
 =?utf-8?B?MWxnU2Vxc0dYZVFKTEU5RnUySkpGN1JVY1RlaXBqWUVvVFV5MnVtd2dNT25k?=
 =?utf-8?B?R1RQNkF0TDFLeS93Q2VjaVRkSWxQd1BaamFPWjhMUUpCc0lHRHk0clFuVWlu?=
 =?utf-8?B?NTlXcWthSDhtdzF1Q1JJUmU0UjA4clVWSmtjRW5Cd0R4aGN3VzJZcERrSlM3?=
 =?utf-8?B?TnNoUWVZK0x5ZXgzZmg1bWNQU0prUkg5bUpkQ09xaTliYVRYQ09MUXFhNks2?=
 =?utf-8?B?cndoSVQ3SWcvZWJyWGpVUTZOS2RSVVhGOHN1OHNZRVRXM2ZEUmNqeUErdEpk?=
 =?utf-8?B?eUliTVNyZUpmdDVYcmhrTkVMWVI4QThGd01EQkdzeTU0R1VIMmRiL0pyK1VS?=
 =?utf-8?B?MXZlRmwzdmRTUkVxdXk4RmpKUSs0VVJwb04zZGlXaUI3aTRPQkgyWTZwQWZN?=
 =?utf-8?B?Y040ajBwZkRuR2FsZjZES1hrUUF3V1M5M1dweVB6akdkQ1NCNFRoMnZ3dWZ2?=
 =?utf-8?B?SnZYMDROY3QyYkx3K0I4NXc2VUplMWlXSlZkakgzclRvbWkvZmRwUFhQQkt2?=
 =?utf-8?B?eUVoWFg2dUpZTTJBSzNwOXZEOUNBM2dKNGRUdWxyNjQ5UXdlSEtOTVFVUlQv?=
 =?utf-8?B?R0ZldVQxNXlTVUtGSk03ZWwyd2tuUkZLZ2x2d29ZUUhETVd3NFcrZVlLZVU5?=
 =?utf-8?B?K0dKa1FKcktlUG5GKzh1TjZCY290UU5EakF4enI5bG9aQ0lLTm9NRlNhcjlK?=
 =?utf-8?B?WHlaZW1ZOVlNcmVEM2JiYk5vQXorc25RMjBxdVNRMHc2NzJKcmZGMFhPNGJa?=
 =?utf-8?B?ZTBGVFNhRjgvS1ZvUW5RZUllMlJMVG1pQ0k5aGNKTUJoLzdaVENlRDk3TzQ1?=
 =?utf-8?B?a05hb01Sa2dRTkMwVEZGQmN4MzRBM25jdW1zbllQdEgvWXNLenFiTTRNazZt?=
 =?utf-8?B?T0hNNk1QQnNPRTFDZlNBSTZIUlltaFZzSzZZS28yNXhTbVI1ME9UOHM3RllP?=
 =?utf-8?B?SjQvMTRpd2UzdndNK2pPS3QxU1AveUJQOHVLQmpCNEJQenRlKzFBVmtmbzJi?=
 =?utf-8?B?djRMUmI3d3dOOEc1aG02OGhTYXliQytCZ0tNSFBmRWtsSnNuNWJIRjRwSWNC?=
 =?utf-8?B?VXoxTXEzUis1VVFvWFZ0cGo4MEozOGZKaFRFeldCb2JXYXRJU1pRUDE5ci9k?=
 =?utf-8?B?WFBDa003SUozRXg2emh4b3ZqVWtvRkRLVFN6dGFtN3RtNkhxMWpYU0p5MVFL?=
 =?utf-8?B?ZFFsQkdDQnVHV0VSdWE0RDVsbktENWxaS2RQRjFQTGlKbUpPU2FQejNsY0RX?=
 =?utf-8?B?M2hHOWxlZVdDNGc4aVVwLy9IK1NjcHZ6SjFLZWwrNjBOanVTTWdwNUhJZ3Y4?=
 =?utf-8?B?UDY4S05zZi9BQkoyMnVhbjNzSzVuUmJFRitkUzAya01iaFhpb3NTNzh0dExG?=
 =?utf-8?B?RTlZMkdZL2pXeXFyaTlRUzg5NSsrQ3BjengzQVVoZnc0dHpJYUxaMXI1SmZr?=
 =?utf-8?B?cXVvdTVPTnJYalBONlNoQ3hZL0JTek9hclhzTThHUDkrdG5MeGZlT1hlUnZ4?=
 =?utf-8?B?Y2h4WkNhRVNmRjFvdEdjdW16azUvWXhGTXRVV3VoeVI2T2MxZVhRNGVwTkVt?=
 =?utf-8?Q?NRzaW/QiqeSBF1NIBOqZvrAen2/HD4JL9XS0E0Mu/kBQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1RHUWZkb3Z1cTdXaTc4K0x5Si9aNS9iZjYzNThCNkQvSjRucFJseEFuL1Zs?=
 =?utf-8?B?MEorZ3pIWGh2Zm1QUWF3ZFdkY0pQeXhkaWdoVG80cW02R3JRN25uNEx0OTlB?=
 =?utf-8?B?M0dKNVRjdjI5OHBSbEFXdkcydGhBb0t6UC9PTVhReng5cldkSkhYb3BhMVFu?=
 =?utf-8?B?WWpzNTJrZXUyK3RITkJkY1IvNXhWTExZbytNamFQQkNGQlJpamwybHBULzZV?=
 =?utf-8?B?djdjQnVjTkRXVGN1eEZIV1M5N0tURFRwRks4RzhkdHVKV3dSSnFNMDFZOXpD?=
 =?utf-8?B?cTk1d01LdzhRQzY4L3BQT2czdWVKVXJIRGY0MXhjQUJMeVpFZzhKTG9tMFJi?=
 =?utf-8?B?a2dyWHdHbXozT1ZldXprNTJaTXl5NXVWUDFMYk9sL0txQkpTTTA1ZkFVZnZV?=
 =?utf-8?B?cU95VTg2VmpYM1MzbXFQOEpZR0RRVUpBSUN1TVdsc3RDSjQxcitTQ09UcW5I?=
 =?utf-8?B?MFR6cVN6bzgrSWI0Wlh0bUpTcXdIczVXS3lDWnhpd3VBT1lQNTFiZzdmTVZ4?=
 =?utf-8?B?cVZOck16cy9Dck0vekxwaC9HMm84cnVhTzhReEJFZjN4ZmpyNmpIdDNNVExI?=
 =?utf-8?B?Zm0yZkU1SzZPRnhRZ0RpeU9rdTRRVlQ5TnR2QkVDL0xSQ1FNSnVDQmwzMGJm?=
 =?utf-8?B?S1FtdDBZS2JNWkFHNEJyRThwUTY2OEZTbWNUUllUeUZ6dkZ4ZmxPS2YxQ3dW?=
 =?utf-8?B?VjhYSXVZK0RrRHVvaHRSTjQxcFN6ZWR3UjdMWFF0S3lMbFk3bnFDRXpyRFVZ?=
 =?utf-8?B?eUJWLytjYWpidGVwcHp6YXpwZFZCM0lCWk1qZXQydDdmcnlrNjNUd3R2OXlB?=
 =?utf-8?B?T3dBZit4dzFVT3JIZW1qODdOR1oyU0xQTndhVWhNMmVMZ2E4bCtvb2hBb2Rq?=
 =?utf-8?B?SFJOMmZpaWZyUFFGY2k5V1huM3lXNFRaZnlsdk5ZQ2lJd2dmMXNrMVZGVVFF?=
 =?utf-8?B?QzZFdjYzQ0RWUGJxR3RVTEtneHU0N0pZUVcxdklmUmUrelJSZSt3RElBaHFO?=
 =?utf-8?B?cnN3RTZUMHZrUWhOT1crMG1jTXVMT2xWYjZWdjM3ZElpR1RiUzJ0SEZFVjFv?=
 =?utf-8?B?N3JaSC9CTGw1NVNDZ1pETDAyZUpqUnQ5SmJxMDIvS3JyZjBVMktLN3AxbURi?=
 =?utf-8?B?bkY1YnpjdytLVmxwN0d3V2RlMWVaajBOdkhlYkJYdlFwNy9nbWxocklBU092?=
 =?utf-8?B?V3dNRmJORUlabS9haGFQbGFRMjZ6U2JJb2x2VkJGQW9BMlZGWEhIUDRmeTJq?=
 =?utf-8?B?ZU1jbmgzaFM1VFQ0VndHSFRxd0ExYm9ub3VYNzdXMVU4bWF4WmJmWEliWHZv?=
 =?utf-8?B?ZlBueUdYOHRTTGhMenZVR0VIb0NVWWl3akwzR0FnZlFHWDNVWVZWbHltTS9y?=
 =?utf-8?B?aHR0WjlBVnp1ZElKWEVPRElwanc3WERaeDhJTENGS1hyeWdUa04vbHZDVDk1?=
 =?utf-8?B?K1hBeUJoWEpEMDNaZmUweHlpQlJjUGViNkpyREFsKzY0cWM4ZTJSOWFLT2xv?=
 =?utf-8?B?WFNEeXhyVEhPT2Mzc2phQ05Bck15Wktqb0JtampYYXc1ODFRL0FVSGQrQTFz?=
 =?utf-8?B?YVdHcG4rQUFTOTRJRy9jaVUwK0RROWpQb0J4K1d6Y0RjZThISWZyWDl4c2lp?=
 =?utf-8?B?TVJyTG44RmdieE03dDk0RlhnT2pSUnhpMnU1a29Jd0lvMkc2Y2lSTHJJaEVx?=
 =?utf-8?B?V0hWRHdhc3c3amZXSWl0SUYrZFJWNS9VTUsrRXBhak9lVFZKZzQzZFdBUnlY?=
 =?utf-8?B?UCtKQ3ppdUhLTVAwQytCcUFidjFSYVEwM0VibEoyMU9hb0VWVWdUY255b3Za?=
 =?utf-8?B?VzZEUkdzc2gyM0wrY3E2NDV4dEdCbzBUK01UVTJUSmdGMFF4dDN2b1pzNWR1?=
 =?utf-8?B?WU9hUG12TDM3NG9oYnV5NFB4QkVSYjZZUDRvSFhWN0Uzcm55NFdBWkpuUDls?=
 =?utf-8?B?ZHViVy9PNWhZckNyRHFOY0hCVThwQ2JDdGhUeS9pRnFCVmRXZjVoR3kreko4?=
 =?utf-8?B?c2VVS0hydzVmLzhBL2dtNUREeW5NUHlKS0gwb1VERWRKWGlXOTQ4RDB1cFhn?=
 =?utf-8?B?N1o1c2Nwdllqd0gzWndyWTdJQWlzbTZycFBXMU1yYVpYSXdBMjkwODRmNzhY?=
 =?utf-8?Q?gVydMfOpyA/+zs2iWoqwrpJMn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec122ad-f3ef-4c55-d314-08dcea9e2f95
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 09:13:50.4855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLqaX7qB8s/fUX3BseVCh7+r9dVRuEYOwaQqo0oVrd3sN9bbsf/xdcPfbuwohJV6ldd1J+uCvzgP3PQf5B4ElA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8990
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

On 10/12/2024, Dmitry Baryshkov wrote:
> On Sat, Oct 12, 2024 at 03:35:39PM +0800, Liu Ying wrote:
>> Document ITE IT6263 LVDS to HDMI converter.
>>
>> Product link:
>> https://www.ite.com.tw/en/product/cate1/IT6263
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v2:
>> * Document number of LVDS link data lanes.  (Biju)
>> * Simplify ports property by dropping "oneOf".  (Rob)
>>
>>  .../bindings/display/bridge/ite,it6263.yaml   | 276 ++++++++++++++++++
>>  1 file changed, 276 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>> new file mode 100644
>> index 000000000000..bc2bbec07623
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>> @@ -0,0 +1,276 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: ITE IT6263 LVDS to HDMI converter
>> +
>> +maintainers:
>> +  - Liu Ying <victor.liu@nxp.com>
>> +
>> +description: |
>> +  The IT6263 is a high-performance single-chip De-SSC(De-Spread Spectrum) LVDS
>> +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a transmitter,
>> +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
>> +  The built-in LVDS receiver can support single-link and dual-link LVDS inputs,
>> +  and the built-in HDMI transmitter is fully compliant with HDMI 1.4a/3D, HDCP
>> +  1.2 and backward compatible with DVI 1.0 specification.
>> +
>> +  The IT6263 also encodes and transmits up to 8 channels of I2S digital audio,
>> +  with sampling rate up to 192KHz and sample size up to 24 bits. In addition,
>> +  an S/PDIF input port takes in compressed audio of up to 192KHz frame rate.
>> +
>> +  The newly supported High-Bit Rate(HBR) audio by HDMI specifications v1.3 is
>> +  provided by the IT6263 in two interfaces: the four I2S input ports or the
>> +  S/PDIF input port.  With both interfaces the highest possible HBR frame rate
>> +  is supported at up to 768KHz.
>> +
>> +properties:
> 
> No LVDS data-mapping support?

It is enough to document number of LVDS link data lanes
because OS should be able to determine the data-mapping
by looking at the number and the data-mapping capability
of the other side of the LVDS link. 

> 
>> +  compatible:
>> +    const: ite,it6263
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description: audio master clock
>> +
>> +  clock-names:
>> +    const: mclk
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +
>> +  ivdd-supply:
>> +    description: 1.8V digital logic power
>> +
>> +  ovdd-supply:
>> +    description: 3.3V I/O pin power
>> +
>> +  txavcc18-supply:
>> +    description: 1.8V HDMI analog frontend power
>> +
>> +  txavcc33-supply:
>> +    description: 3.3V HDMI analog frontend power
>> +
>> +  pvcc1-supply:
>> +    description: 1.8V HDMI frontend core PLL power
>> +
>> +  pvcc2-supply:
>> +    description: 1.8V HDMI frontend filter PLL power
>> +
>> +  avcc-supply:
>> +    description: 3.3V LVDS frontend power
>> +
>> +  anvdd-supply:
>> +    description: 1.8V LVDS frontend analog power
>> +
>> +  apvdd-supply:
>> +    description: 1.8V LVDS frontend PLL power
>> +
>> +  "#sound-dai-cells":
>> +    const: 0
>> +
>> +  ite,lvds-link-num-data-lanes:
>> +    $ref: /schemas/types.yaml#/definitions/uint8
>> +    enum: [3, 4, 5]
>> +    description: number of data lanes per LVDS link
> 
> Please use data-lanes property inside the OF graph.

In both port@0 and port@1?

> 
>> +
>> +  ite,i2s-audio-fifo-sources:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 4
>> +    items:
>> +      enum: [0, 1, 2, 3]
>> +    description:
>> +      Each array element indicates the pin number of an I2S serial data input
>> +      line which is connected to an audio FIFO, from audio FIFO0 to FIFO3.
> 
> What does that mean from the board point of view? Routed audio links for
> the multichannel audio?

Yes, also for single channel audio.

> 
>> +
>> +  ite,rl-channel-swap-audio-sources:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 4
>> +    uniqueItems: true
>> +    items:
>> +      enum: [0, 1, 2, 3]
>> +    description:
>> +      Each array element indicates an audio source whose right channel and left
>> +      channel are swapped by this converter. For I2S, the element is the pin
>> +      number of an I2S serial data input line. For S/PDIF, the element is always
>> +      0.
> 
> Why?

Because this converter has the capability to swap right channel
and left channel and S/PDIF always uses audio source0. 

> 
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description:
>> +          The first LVDS input link.
>> +          In dual-link LVDS mode, this link works together with the second LVDS
>> +          input link, and one link receives odd pixels while the other receives
>> +          even pixels. Specify the pixels with one of the dual-lvds-odd-pixels
>> +          and dual-lvds-even-pixels properties when and only when dual-link LVDS
>> +          mode is used.
>> +
>> +        properties:
>> +          dual-lvds-odd-pixels:
>> +            type: boolean
>> +            description: the first sink port for odd pixels
>> +
>> +          dual-lvds-even-pixels:
>> +            type: boolean
>> +            description: the first sink port for even pixels
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: the second LVDS input link
>> +
>> +        properties:
>> +          dual-lvds-even-pixels:
>> +            type: boolean
>> +            description: the second sink port for even pixels
>> +
>> +          dual-lvds-odd-pixels:
>> +            type: boolean
>> +            description: the second sink port for odd pixels
>> +
>> +        oneOf:
>> +          - required: [dual-lvds-even-pixels]
>> +          - required: [dual-lvds-odd-pixels]
> 
> This still allows one to specify that both ports provide odd pixels. Is
> that expected? Also why do you need two properties which specify the
> same option.

No, that is not expected. Description for port@0 already mentions
one link receives odd pixels while the other receives even pixels.

Two options are supported for dual-link LVDS, not the same option:
1) LVDS link1(port@0) gets odd pixels
   and
   LVDS link2(port@1) gets even pixels.

2) LVDS link1(port@0) gets even pixels
   and
   LVDS link2(port@1) gets odd pixels.
That's the reason why each port needs two properties to define
odd/even pixels.

> 
> My suggestion would be to add a single root-level property which
> specifies which port provides even pixel data.

That won't work.  The LVDS source side expects the ports of
the sink side specify dual-lvds-{odd,even}-pixels properties.

> 
>> +
>> +      port@2:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: video port for the HDMI output
>> +
>> +      port@3:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: sound input port
>> +
>> +    required:
>> +      - port@0
>> +      - port@2
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - ivdd-supply
>> +  - ovdd-supply
>> +  - txavcc18-supply
>> +  - txavcc33-supply
>> +  - pvcc1-supply
>> +  - pvcc2-supply
>> +  - avcc-supply
>> +  - anvdd-supply
>> +  - apvdd-supply
>> +  - ite,lvds-link-num-data-lanes
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    /* single-link LVDS input */
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        hdmi@4c {
>> +            compatible = "ite,it6263";
>> +            reg = <0x4c>;
>> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>> +            ivdd-supply = <&reg_buck5>;
>> +            ovdd-supply = <&reg_vext_3v3>;
>> +            txavcc18-supply = <&reg_buck5>;
>> +            txavcc33-supply = <&reg_vext_3v3>;
>> +            pvcc1-supply = <&reg_buck5>;
>> +            pvcc2-supply = <&reg_buck5>;
>> +            avcc-supply = <&reg_vext_3v3>;
>> +            anvdd-supply = <&reg_buck5>;
>> +            apvdd-supply = <&reg_buck5>;
>> +            ite,lvds-link-num-data-lanes = /bits/ 8 <4>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +
>> +                    it6263_lvds_link1: endpoint {
>> +                        remote-endpoint = <&ldb_lvds_ch0>;
>> +                    };
>> +                };
>> +
>> +                port@2 {
>> +                    reg = <2>;
>> +
>> +                    it6263_out: endpoint {
>> +                        remote-endpoint = <&hdmi_in>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +  - |
>> +    /* dual-link LVDS input */
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        hdmi@4c {
>> +            compatible = "ite,it6263";
>> +            reg = <0x4c>;
>> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>> +            ivdd-supply = <&reg_buck5>;
>> +            ovdd-supply = <&reg_vext_3v3>;
>> +            txavcc18-supply = <&reg_buck5>;
>> +            txavcc33-supply = <&reg_vext_3v3>;
>> +            pvcc1-supply = <&reg_buck5>;
>> +            pvcc2-supply = <&reg_buck5>;
>> +            avcc-supply = <&reg_vext_3v3>;
>> +            anvdd-supply = <&reg_buck5>;
>> +            apvdd-supply = <&reg_buck5>;
>> +            ite,lvds-link-num-data-lanes = /bits/ 8 <4>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +                    dual-lvds-odd-pixels;
>> +
>> +                    it6263_lvds_link1_dual: endpoint {
>> +                        remote-endpoint = <&ldb_lvds_ch0>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +                    dual-lvds-even-pixels;
>> +
>> +                    it6263_lvds_link2_dual: endpoint {
>> +                        remote-endpoint = <&ldb_lvds_ch1>;
>> +                    };
>> +                };
>> +
>> +                port@2 {
>> +                    reg = <2>;
>> +
>> +                    it6263_out_dual: endpoint {
>> +                        remote-endpoint = <&hdmi_in>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> -- 
>> 2.34.1
>>
> 

-- 
Regards,
Liu Ying

