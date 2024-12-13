Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3609F0325
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 04:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B78910E320;
	Fri, 13 Dec 2024 03:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="kp5uKNA/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2072.outbound.protection.outlook.com [40.107.241.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2137A10E320
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 03:39:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4WUpK+qaG3gM/Ye9A1tNnR3yHf1hLpdqpwMQPSVF7Yr0DlcA8VpVxMVrE2Fktbe+2KPlZwbOPkvC+SUKeZ6maC8bcUypWtYpaM9WHD0jsiodBs03n4l72hh2sovRMxy/9eQXGnHEnSnRhzxhL7Le6UJEVT0nt87Mf6RKnyPtDIsnlpdacmPLWUT2+UnDmzpM8zG6l+b32S7pKbAdQZCa1Wy5WfuftJASTUY8o6CmaCOVN35kv1CYQsmCcB0BE0Jr7DtiIBhA58s1a+oK18hKJN4wQjeI6cEEJOAzZJLK6t6wWqm6ZpOceLa9ceNJTch7wVgNoDmAbNcs8gEkl4abA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMgI7Ygv7WX2fIbaFvJjNX8t1YP5IRezLCsDcs5QWxY=;
 b=mgK9g0teRO653gmhPxfxMBX4k1rTOaYSQGO5J7wQiHFNna2V1qNeo7hmF2UythPu8n2AnHZ6ozDESyJ+URr7xdehNAACZPtwiYA0MfKamaOjRJjVsQ+/cBSpJUTikMbxKPvcw5F5w65cwRI+rRzrpLCzAQg8XeqS0OQwXTOwYuOv4rodmNX8UtCkyT/ODhCSe2M8/B5rfP7FENeebuC1doIse5hZ9CSvhX5mWFOQFH408C9NejUR5kcEbRNxPpbyr/I4W6Hsft6QWgSPnsvaz09nlnLYklHfBj5rc5/liqGjxKC1cO31lPqs5ZU5L226KFS+xpl87+Kco3Hn8zNISg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMgI7Ygv7WX2fIbaFvJjNX8t1YP5IRezLCsDcs5QWxY=;
 b=kp5uKNA/zRohSjsDwAOgZAsJkdo7BjpbthlA2JLcoGGRTHbBxARCvWU2bkkKN/6Q5CxAh7D5Uuhy25bQpxTPwEMT5V3HE+0fjS3lXK/b711iW++kw2s60zEUJ5krR//qFwXQyfSKv86IPslg3XjKu5T3DidOPm+aYbbrZwrxFPwu3YGDAiQ8Rqar8IOX7J+0l0I1/8PZR8ap2uNymQzPRwfzSTtreTiEuX3XM4Kov5q8v2BGFXDidbeZUgZLLwpX3Qb6KMVIAjqUiF2aX9srckEbve6uDjpfXwVOrBMsdbhq2c58b0IlqJXPu3P8/eYY3NjO6ZNqYZxal8DvUhWk1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI2PR04MB10809.eurprd04.prod.outlook.com (2603:10a6:800:27b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 03:39:47 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 03:39:47 +0000
Message-ID: <6548eb6e-d4c3-495b-b59e-5fdbcb6ca398@nxp.com>
Date: Fri, 13 Dec 2024 11:40:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller processing units
To: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org, u.kleine-koenig@baylibre.com
References: <20241209033923.3009629-1-victor.liu@nxp.com>
 <20241209033923.3009629-2-victor.liu@nxp.com>
 <20241210221508.GA550635-robh@kernel.org>
 <30924a9e-7d01-46f6-9e47-405c08acdde3@nxp.com>
 <20241211145541.GA2837320-robh@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241211145541.GA2837320-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG3P274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::15)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI2PR04MB10809:EE_
X-MS-Office365-Filtering-Correlation-Id: b021a603-0d57-4760-2a5a-08dd1b27ca36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2tEUWpvVnoxQnU5bDI1K1p3YS9vYkZLUVBscnF2UmFGeGZYUDJtUEdkMzB3?=
 =?utf-8?B?cGROY0xNUHJra0hhdEkweFc4VVdxUkFMb0VZT2RHR2hBNGd2VXlsNlYxdWM4?=
 =?utf-8?B?VTVsakc2cUsvYTVVU1VCait3UVREOXk1dTRKdmtpSlhFU0psTk9RRFY4MWp5?=
 =?utf-8?B?N3Zkc1NDa1R2RWp4NnBlTTNqZzBjczk2Q09Uc1I0d0xlcXQ2eSt0b3JtZm5U?=
 =?utf-8?B?Q1J4cWxTem5hMzFRenpyQkFXcWNDbldqVGtseUtreWF5TkdxQ1RkeG8xRlFz?=
 =?utf-8?B?TzFnRVgvK2NySFh5aXEzTzJtV1lSUm5jTVJPM09oNW1sZ25PSU8xelA0d0Rq?=
 =?utf-8?B?NDR0aDRyVFMwRXpjNHNHbGZNQkhiOXVuNnYxdTVwRHUxTGUrb05LSFl0L2dn?=
 =?utf-8?B?Mjd2Wk96THVyenp3ckFvT1laS1M3M0xBNEVXVnlPaHgxbFRVaU9tSlAzMVhs?=
 =?utf-8?B?cnMwRXBzNG1qNmJiWHUxYU1SUFBMRzNsM2FyV3B0Rm12aGVaQmNMdXMrN2JU?=
 =?utf-8?B?OVErYnlST0Y3em1SM0sxMkxJdTR6TEV0L2VhUWlvTlhIS2dzYldBS3RHOFo0?=
 =?utf-8?B?dFVEN1BhNEdqbUZVOEpDY2l2Qk16bXBDRE5YVlJiczYyejRUKzJjdS9VTnFJ?=
 =?utf-8?B?cklqNDZBZmJadkhBaGpLcGVoTkJEaTZ6M2MrMmxsNnd3RWRlLzIvRlQ0Yitp?=
 =?utf-8?B?dUMwbXdPSjFnNnBVQXBHMHB3eXB6S1MvMWgvaTFrZHROZjlQU1pqV3hGNHZG?=
 =?utf-8?B?bWlPZzRqbFA1S0ZXS1paL01kN1BCdTZvR3ZpMHdzakJkZ3hXMnp0UWZSSEpP?=
 =?utf-8?B?UFp0VmtxSHB4cHdQUTlldFFRZ0VLaGFvaElFMXpBMXlQVkRjWXY1RUxzbmhC?=
 =?utf-8?B?NkFJNC9DQ2F4RGtvMlI4SHpyVytNdm5pQTQxRlBEcWlaaEtMRTJkL0MrQklk?=
 =?utf-8?B?RlpDU1dyQ2F4cWg4aVlRZWZhQnF0OHpNME5saEpISlp5MmNsZzFxWEgyc0xZ?=
 =?utf-8?B?WUNLMk9RejFMbFRQRHE5Y1laOUxVdWlUL1dEeW1rS1ltYitFZFh2RjlqQXFT?=
 =?utf-8?B?R3dZa21aTXVDdjArcUFUZlROTDJhRVBGUnd2bDBzdEx3VC9oNURQcEM5emZC?=
 =?utf-8?B?WUU2ZWd5OVBtbk1VZUUzWDczT0Jzam40ekhqeW9DTDRlTEp3L0J2Q2JjcklX?=
 =?utf-8?B?bGQzbmQrb2xVZFYyNzhNWnhnb1lPVmRSSmVyeG5IajB1UU5mcnNTMk93MGJV?=
 =?utf-8?B?WDVnbm9peDFrc0VjWGEvM0RWakhIb0xzRTQ4QVlFZ3JVZGd2WEprTVpoa2c5?=
 =?utf-8?B?VUtiM3JFNUVBRzRHcVhoVE1icitXV2pNLy9vZm8xMG84YVJzNzVDSEI5Z2po?=
 =?utf-8?B?UXdSUkpBNjBJSDBTN1hNdEVPRlZycElvL1hvM0p5ckI1bHQ2dEo4bzREM2Uv?=
 =?utf-8?B?UnFqeTlJRGNXcUhDSEFsRnR3eTNJWHZ4aTk0T1hBSlI3V1RMVEUzY0xLU2ds?=
 =?utf-8?B?K2VaL2NQR1MrNG5nb2RxM2pWM0ViR2haL2dPcmEzSTEvcDZJZi9yb052Mnhw?=
 =?utf-8?B?ckxscXdBTzhTSE1URXFWOVlyOVJ1UkF5b05ReW1ZbFlvalZLUEx5dWNBbmZ5?=
 =?utf-8?B?VXRULzR0bXp3bWlramE5NEp4bmxGTHMxOTAwajJ1ZUpOSjMzdWxsZzZBbFIz?=
 =?utf-8?B?MFJVTXhWZEIwNUVjNVdtS3ByVmVUUGtVYlFGRklaTXNWY1J5WElnZWdQb0h6?=
 =?utf-8?Q?nBce57KjN4Aez2ulLs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck9uT01jUWlXWGVVeUkwZHBEdUhUTFpPL3lHOG5vRWQ4WGdvSExIeFdzamc4?=
 =?utf-8?B?eHBQZ0k0WDlFcWN3MHFlNWE4QkJVNy8yTGpPK3NVcEYydzhmSGIxdHJEVE1s?=
 =?utf-8?B?NXRzTTRNQ2Q1WXFrQitRQUdERHdkNkx4U1JkRndjamZBT1RJMWZNZ2plM3VP?=
 =?utf-8?B?bE5vSjRBaGszZUc5SE9nU0MwYnBWQW1jZjNNWTdKdnBjZW14WCtKVGlkZzhO?=
 =?utf-8?B?bGdJZ0xDaXR5M2NkOVk3b3RmQisyYmZ0U1NRVnVobi94MHRuQXZ0RTh6THdh?=
 =?utf-8?B?STl2THY5bmRwYmMwTU0zdWVOZUd4cGx2ZUE2dUtIZHhOeUtSWGVZUE5RbG45?=
 =?utf-8?B?N21kbEh5ZzZXMW1RVGFmb0w1M1ZOcmRNRkthd0tuZmpJdWtQUTA1QzVWNjA4?=
 =?utf-8?B?c1pjd2plaUlaZWRoM0V6OTlSbXdTSUxyYjg4R1NrWWwzN05yNW9kTXg4eDhj?=
 =?utf-8?B?TWJ4bE5zTUZIWmFRVG9LWU9hMVNjTlNrWVQ2aGVGdWtGS2JHTGJSS3hDcTl1?=
 =?utf-8?B?aVlqUVdQQVVKYWFRdzFKeDdBMHp6RWxWemlQdTVyaVdIeHlmdllhMDMxR2c1?=
 =?utf-8?B?SkJna0x5Z1ViZjByN2dRSFdjQUJHaTU3anpXOFBmN2swb21TK29NVEhHRVR1?=
 =?utf-8?B?ck8ySE52ZFkyUnJXOTdqbGtVZW1XNW5meC8wVEczbkNTb2Z1STdaQUo5L25h?=
 =?utf-8?B?a3k4d29ObGNRSjRvSXN6eVYzK1VzNnA3U1NDcXdwRCtHeTRGaUlHdWFEdHF5?=
 =?utf-8?B?RUtWN0ZnYzF6d2RQaUhSbmkwdzRFcmNGRFkxRGxxYjVRcDBtRml4dlVkdzd3?=
 =?utf-8?B?cHRaMkZBU1VJeHg3YmcvR0JMczhNck9wZjgyYnpHSU9ZT0lDT3Z2Qy9TTnNZ?=
 =?utf-8?B?WHhuWXZQbkYyR2lMWDV3Snh3dWV4ZWFiYXdtUXErYWw3YThlWkNqMGxOWE9L?=
 =?utf-8?B?UldJNjVTQndKd1Z5QjhqM1pWcGtid3RISnZuRmJVdTlKRlpOUkNYMDBmVVk5?=
 =?utf-8?B?VzQ2YnkvY3dZbDl2cWVnVlYrSGRVczR3bFhnZVdwVWdRdVJ6U2YyQ2hKMStU?=
 =?utf-8?B?d2FZY0FaZ2dFUlZVM1U2bHlZZ3h2UnRSVkdrNUVaQTEzSEdlaFptVVNNS1M2?=
 =?utf-8?B?cW83QTExeG05TkpkbE5ZdEpCT1I0d1VtcGd6WXdPVTl1eEdoZnhjMDFmK3VC?=
 =?utf-8?B?T2VmMk00aFNlSi9GUW1FaW1IUUpvQU9UZ1kvUTJVNDArR2UyNXJhWmJxc2xY?=
 =?utf-8?B?cjBzNllXQ1VOZXhQQ2lTZzV0MURjUEJDdURRVWhUMW1Wd21aMmlVVHZsQjlz?=
 =?utf-8?B?NERXQkozSVhLUkc4M2FYUm0xU2tQcGlhSnZuVmxhUzRLSDIzYU9selM2OEZ6?=
 =?utf-8?B?UjE5Z0NQYVRHb3h5ZTVaSTRXVGR1c2hERk5HVUJzN1VaWlNwbmo3Y2dvY3Bp?=
 =?utf-8?B?YVZFdzVWSTltS1FEbWRXOHdibXk5VjJnYlhGYUVFK3FrUHRCTXFsVksybDRF?=
 =?utf-8?B?a0VnNndYS1k0QytYL3pVeHo2cmlIUVVkZGxkblBFSm1pc1dIamxvUFB4clJj?=
 =?utf-8?B?TFQ4aC9uL1lpM3FGRXZvR3FZUkxNME82Vy9BU0pjVmJ4UXF0M3lJUCtNNTdH?=
 =?utf-8?B?Ym1OZkxwVEFpQktMWXQyekdEa1FUeWg2MUxLOGdMWklTWkRhSitmWGVPSUZB?=
 =?utf-8?B?UjZQZUthNWE1ZkRCRFRPeVpOd1hSSllPQTJ5YkpQcHZjeVAxUzY3OE5PdmxW?=
 =?utf-8?B?T2RobHdEbjNvZytVMHAwcVdVTUhOM1U5cmtMT1IzRXM4V0MvWm16bnBTb2pv?=
 =?utf-8?B?Vk5hKzNkSmU0QVZJT1BvWjRGUG1ZVDloTWVlZmd5U3YraDFIbWFrMHB1U0xu?=
 =?utf-8?B?ZDJrVkRHRkJUbW5tM1ZKQk1zSFlZYmQ4UENQNDFKalczNG1RWXN5ci9OdFdL?=
 =?utf-8?B?MEpFb2kvcXVtV2h4VEdEQ0JiT2IwbTYrUGFNNy9aRldSTkFFbmpDMk9uZ3pY?=
 =?utf-8?B?REV4c1dpYVZ2SEFVQ3VKRUxMckx5dzdZY3I2SExGU21Uamxmc1B5bnN6OC9j?=
 =?utf-8?B?MlpoK0pwbk1jUE5EcUZOdE92Snh3WjVwbTJaQ2FzdjNxVHBXaUNkNS84WUNl?=
 =?utf-8?Q?2NgOT9rDRfw+iavWJZR3hE2KX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b021a603-0d57-4760-2a5a-08dd1b27ca36
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 03:39:47.4502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o91SD0IpF8FkqKuE4SMOapkpe2eyyxPLczQEPSyxbLZNMKy1DK6yOMJWECFKYbnWlQqKw6knvu6RVXCQPX436A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10809
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

On 12/11/2024, Rob Herring wrote:
> On Wed, Dec 11, 2024 at 11:05:52AM +0800, Liu Ying wrote:
>> On 12/11/2024, Rob Herring wrote:
>>> On Mon, Dec 09, 2024 at 11:39:05AM +0800, Liu Ying wrote:
>>>> Freescale i.MX8qxp Display Controller is implemented as construction set of
>>>> building blocks with unified concept and standardized interfaces.  Document
>>>> all existing processing units.
>>>>
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>> v6:
>>>> * No change.
>>>>
>>>> v5:
>>>> * Document aliases for processing units which have multiple instances in
>>>>   the Display Controller.  Drop Rob's previous R-b tag. (Maxime)
>>>>
>>>> v4:
>>>> * Collect Rob's R-b tag.
>>>>
>>>> v3:
>>>> * Combine fsl,imx8qxp-dc-fetchunit-common.yaml,
>>>>   fsl,imx8qxp-dc-fetchlayer.yaml and fsl,imx8qxp-dc-fetchwarp.yaml
>>>>   into 1 schema doc fsl,imx8qxp-dc-fetchunit.yaml. (Rob)
>>>> * Document all processing units. (Rob)
>>>>
>>>> v2:
>>>> * Drop fsl,dc-*-id DT properties. (Krzysztof)
>>>> * Add port property to fsl,imx8qxp-dc-tcon.yaml. (Krzysztof)
>>>> * Fix register range sizes in examples.
>>>>
>>>>  .../display/imx/fsl,imx8qxp-dc-blitblend.yaml |  46 ++++++
>>>>  .../display/imx/fsl,imx8qxp-dc-clut.yaml      |  49 ++++++
>>>>  .../imx/fsl,imx8qxp-dc-constframe.yaml        |  49 ++++++
>>>>  .../display/imx/fsl,imx8qxp-dc-dither.yaml    |  49 ++++++
>>>>  .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  77 +++++++++
>>>>  .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 147 ++++++++++++++++++
>>>>  .../display/imx/fsl,imx8qxp-dc-filter.yaml    |  47 ++++++
>>>>  .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  68 ++++++++
>>>>  .../display/imx/fsl,imx8qxp-dc-gammacor.yaml  |  38 +++++
>>>>  .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  45 ++++++
>>>>  .../display/imx/fsl,imx8qxp-dc-matrix.yaml    |  48 ++++++
>>>>  .../display/imx/fsl,imx8qxp-dc-rop.yaml       |  48 ++++++
>>>>  .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 ++++
>>>>  .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  89 +++++++++++
>>>>  .../display/imx/fsl,imx8qxp-dc-signature.yaml |  58 +++++++
>>>>  .../display/imx/fsl,imx8qxp-dc-store.yaml     | 100 ++++++++++++
>>>>  .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  50 ++++++
>>>>  17 files changed, 1042 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
>>>> new file mode 100644
>>>> index 000000000000..7f800e72c3f3
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
>>>> @@ -0,0 +1,46 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-blitblend.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Freescale i.MX8qxp Display Controller Blit Blend Unit
>>>> +
>>>> +description: |
>>>> +  Combines two input frames to a single output frame, all frames having the
>>>> +  same dimension.
>>>> +
>>>> +  Each Blit Blend Unit device should have an alias in the aliases node, in the
>>>> +  form of dc<x>-blitblend<y>, where <x> is an integer specifying the Display
>>>> +  Controller instance and <y> is an integer specifying the Blit Blend Unit
>>>> +  device instance.
>>>
>>> That's really an abuse of aliases. If you need to describe connections 
>>> between components, use the graph binding like everyone else does for 
>>> display path components.
>>
>> I need to describe components' instance numbers which imply the connections
>> between components but not vice versa. If I use the graph binding, I cannot
>> get the instance numbers(0 or 1) of the two display engines(documented by
>> fsl,imx8qxp-dc-display-engine.yaml). If you have no objections, I may add the
>> instance numbers to compatible strings, like brcm,bcm2835-pixelvalve0.yaml.
>> What do you think?
> 
> You could have dc<x> and blitblend<y> aliases and use the graph to 
> define the connections. But I'm not really a fan of adding custom 
> aliases either. Why are the instance numbers important?
> 
> Are the programming models or features of the instances different? If 
> so, then a different compatible or property describing the feature may 
> be appropriate.

The instances numbers are important mainly because the four ExtDsts(0/1/4/5)
belong to content or safety streams of the two Display Engines, plus the four
LayerBlends(0/1/2/3) in Pixel Engine have different numbers of input ports to
connect with the outputs of other LayerBlends, though the reason for LBs is
weak since the input ports can be expressed by the graph binding.

                                           CF0/1/4/5
                           PE               | | | |
                                            V V V V  primary layer cross bar
                          +------------------------------------------+
                          |                                          |
4 FUs + (VS4/5 + HS4/5) =>|               LB0/1/2/3                  |
   secondary layer        |                                          |
   cross bar              +------------------------------------------+
                             |          |              |          |
                             V          V              V          V
                          +-----+    +-----+        +-----+    +-----+
                          | ED0 |    | ED4 |        | ED5 |    | ED1 |
                          +-----+    +-----+        +-----+    +-----+
-----------------------------|----------|--------------|----------|-------------
                          content     safety        content     safety
                          stream0    stream0        stream1    stream1
                             |          |              |          |
                             |  DE0     V              V    DE1   |
                             |       +-----+        +-----+       |
                              ------>| FG0 |        | FG1 |<------
                                     +-----+        +-----+
                                        |              |
                                        V              V
                                       ...            ...

(Safety stream still is supposed to still function when content stream fails
over.)

LayerBlend primary layer selections:
static const enum dc_link_id prim_sels[] = {                                     
        /* common options */                                                     
        LINK_ID_NONE,                                                            
        LINK_ID_CONSTFRAME0,                                                     
        LINK_ID_CONSTFRAME1,                                                     
        LINK_ID_CONSTFRAME4,                                                     
        LINK_ID_CONSTFRAME5,                                                     
        /*                                                                       
         * special options:                                                      
         * layerblend(n) has n special options,                                  
         * from layerblend0 to layerblend(n - 1), e.g.,                          
         * layerblend3 has 3 special options -                                   
         * layerblend0/1/2.                                                      
         */                                                                      
        LINK_ID_LAYERBLEND0,                                                     
        LINK_ID_LAYERBLEND1,                                                     
        LINK_ID_LAYERBLEND2,                                                     
        LINK_ID_LAYERBLEND3,                                                     
};

People may argue that ED instance number is also not that important, because
content/safety stream can be inferred from FG input port numbers.  That's
true, but the connections between the internal devices are too complex and
I'm afraid it's an over-kill to use the graph binding. I list LB2 primary
layer selections and ED0 input selections here as examples:

--8<--
Selection of the source for the prim input of the layerblend2 module
0: disable      
10: blitblend9  
12: constframe0 
16: constframe1 
14: constframe4 
18: constframe5 
27: matrix4     
28: hscaler4    
29: vscaler4    
30: matrix5     
31: hscaler5    
32: vscaler5    
34: layerblend1 
33: layerblend0 
--8<--

--8<--
Selection of the source for the src input of the extdst0 module
0: disable      
10: blitblend9  
12: constframe0 
16: constframe1 
14: constframe4 
18: constframe5 
27: matrix4     
28: hscaler4    
29: vscaler4    
30: matrix5     
31: hscaler5    
32: vscaler5    
36: layerblend3 
35: layerblend2 
34: layerblend1 
33: layerblend0 
--8<--

TL;DR: I'd like to get instance numbers because of an appropriate programming
model _and_ different features of EDs and LBs(content/safety steam for EDs +
different input selections for LBs).  If no objections, I'll add instance
numbers to compatible strings in next version.

> 
> Rob

-- 
Regards,
Liu Ying
