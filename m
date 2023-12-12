Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 514BA80E615
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 09:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D2810E586;
	Tue, 12 Dec 2023 08:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2124.outbound.protection.outlook.com [40.107.6.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5208210E586
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 08:25:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8Z/Yiv9ub12VN6Uu4a6UctbsL5kZqppjvExLLcBGJugrmCkNBSlJAH9jhKyLIgwuDWMm0iKfXacNyOI9UB0PRHBXGS2frL+Xp7EpHOt5M4fm4nes2phChlAdA+Yy8cy7a8NaeixnCqpybTELfdNFZ5eMxrpZwZP2ahhYKQsCiDVWl2caqnvzGxtunhkF3KZAczJ/qVb+JDrqQ8OnAhTluZzYZBJQKAIIzeNCodc9og24PAG54kL1228oAhBJC/WRTfzYJFNG6NjYOioJ8T+pvgFuv/7H+g7uKgAhBUp9763iqUdpxrXVFSRPGxEF9OTnT5+yk+mTz6OoKkHlPidmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1uyOxX90WGmYq6yRBwUvozwLWqXaBIci+It6jRXfvM=;
 b=KhRQ0csHIcz61x4kVijnn53ntI/Vi14cDe3Xc9iiNPn8rEsWTABPKY/hDZVendb0eKSVtUbR0bDyx1JoTvbI07pD5rHMbINgfWsu9uA1+SKL2XZXGFid9JDCGw+iPcyclscNdM/liYUSWBsfVQIJzmcPo7OOGc9zgYFnvfG2tAUo9ujLmoMUKAQVdj7dojiCWsvqBIOil3SYg1npFzpEf1a8+o/WooNJR8JtWGKiQJF5piykwgC3OwSa40qak1Flagbhw+V3vN178+dz8dxtzGdwYtDONRV6XpQYbQT3KIo0BlA+dvrbrWHT4ur0umTKX74gEOi9mQSCI2RYseFRxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1uyOxX90WGmYq6yRBwUvozwLWqXaBIci+It6jRXfvM=;
 b=gGkLtjxH9mlddDVEBh7JrIc3+ATLz1/Wq7ZvhDlz1PmE1wYWeuFz+HezwGG54YOWJMILLupyffq3CQXmx/KBFJ/QMC6lOm6g5ZrCl3+fl09eC9LyGGMmG997xrqIKa926cGdkmFJ+geql9Xjbdu7D6QfOYUNXzDydjydjWQxFBM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS2PR10MB7763.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:64a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 08:25:17 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::27ba:9922:8d12:7b3d]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::27ba:9922:8d12:7b3d%5]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 08:25:17 +0000
Message-ID: <6bdf9e39-e938-4644-b0ce-37191e1c00d2@kontron.de>
Date: Tue, 12 Dec 2023 09:25:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/bridge: samsung-dsim: Set P divider based on
 min/max of fin pll
Content-Language: en-US, de-DE
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231212033259.189718-1-aford173@gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20231212033259.189718-1-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::8) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS2PR10MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: ae2ed0ac-2f76-4250-3f3a-08dbfaebdef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bBNAWjbkjgSdOB07pz3m1yRp7KLeZ1ojAVfDfbgSMnptLLisWTobOoykrbI2DdGjUtkWhPJoB5YiWjV2XG3BTs/2Fv9fKrMh5SD3bNX2uzE4D11Ergms4duKyZ0+5FEcm2qQPY9xW9Hsw4eMpa5i3/hmjN46A56MhLT+00BVWgT3pLo2t2l7UWXyPfu+RGGfIVIXMxAReUW/MHt9LzTFNGtWZZl+rEU5+Imv9gMqpEjWjlU3ZdNXvsbY7UAtSI/e9kDJ7zhqWHPpHvmER2W4SWdV+U64laIWCvdMo2hTbyqVnjYg7iYHz7RlBUngMxTAI8pKyGPUxkzkkmBIUSFgFa3j3AtymT3yjTg/DVGismfJvwNRCCUQV7B/M1/eVipGgctmQ7Bwd/X8dSiPLZo4McJEh+AeKRkv5OhTMOyYs7OfAnJhyr/uEhkJMo5CRkyeyS4DsKAJrKIxxe4FUGLpJF41r27z/V/K3jGNirNKJ0hNerfVK306Sn1Lf1DeOU+ULzPhNliVqorTMqBpzcTnN7qSFmrgjPOZjvoBFXPKFt8zD2hb8Jan4ilxtSJP8jiYUJzNgXclrHNMPgOqSNUxQYaL/kQA6b4b8DC5ERED/jMDqQZeZ6hfr/vOmqI1FFW8xn+ZLrQd3av6XiCRh7wsgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(136003)(366004)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(7416002)(2906002)(41300700001)(38100700002)(31696002)(36756003)(86362001)(2616005)(83380400001)(478600001)(6486002)(53546011)(6506007)(6666004)(6512007)(4326008)(5660300002)(44832011)(316002)(8936002)(66556008)(66476007)(54906003)(66946007)(8676002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXd2VVdYTVVZWG95RVZ6REJ1UjhkUWxjUW5nTjlKa0FrMC9BTC9MVUdQampU?=
 =?utf-8?B?WXlmRTliSGhRbkpjUVpEb0R1aW5TSURNbXZiUS9Jb3UweGpYay8vS2lhSWRa?=
 =?utf-8?B?VE1NQjRRTk5TRGRINVJoMHNBeTJtYnFVT3FSM3FFUGZmbStGMzhqMFJVQlJp?=
 =?utf-8?B?UjJxdlZ5NlI2cWZ5bzlaaEY5YklmaXhwcTkwQWRCSGl1ZTJvOVBuRDl4YlV1?=
 =?utf-8?B?TFNrZGg1V25XOG1NRHhBY0E0ZGZkRGNPbGgzcmUyMjcwVS9NTWdvM3AyNlVP?=
 =?utf-8?B?RlAxUi9sc2cwNVpFMjN4WXFRcndNT3kzb0g5QVFLT3BXb3lRaUJDS0dHdDBU?=
 =?utf-8?B?R0NnTTRRSjArTVVUSW4wK0tDUnlHT00wT1NrNW92R0dZd1d6U1JQTmp1N1ps?=
 =?utf-8?B?dmtZMk9URzJKU0Y2dk5tckxMazJDZ2h4RXh0Mmc2Zzk3ZXpaMnQreEZmdmQx?=
 =?utf-8?B?U3lIWTdvVWVqM00yNU9MdmFTSUJHL0t1M2dZejcrWmxOQXNYZFRsUEJabkE3?=
 =?utf-8?B?a2N5S1AwSWlrOExpMUxoT0tDNWZRaVZ5emJLdjNqWXZTNjZZNmxUL3JDVG4x?=
 =?utf-8?B?WUlaUlJSbGJNT0RhNGtRNi9kdDhJMUw5TkJNbnczVS9WVk40WnJ5RVFVNjAx?=
 =?utf-8?B?WldnL2NYYUxCZ0tsQytaR2ZDK3lOVC80TWdOUDFHZHQ5MEI3RHNaUFNTbmxG?=
 =?utf-8?B?dVRUTkFlby9OY3VKUGdiUlBDS0RqeGlNZHduR0ZuazZ2aFVjdDJoT1NCVDY0?=
 =?utf-8?B?bUJZeHhhUGNyMXAvUVZEUHZKamtJSjArcExTd0pxc0t6QXh2VWlta3E2K1N3?=
 =?utf-8?B?YTYvcmVIbW9ZWVJjdE55ZzBYTFk1OEZkbDR5eUc1V2Zud2hXOHRVUnQxMkk3?=
 =?utf-8?B?R0VnYVhwSVBCNEdhWnZBQjlvNjJjZDA4dTRCalY0dXpaNm90d1JLMnBNcjRi?=
 =?utf-8?B?ZXdwRGZFbVVUUzhQSlVSOFhzNUxtR3JSMXlVWFpPdEJYbWYweFhkR1oxL2ZC?=
 =?utf-8?B?NEk4dEZ5ZmI5Nlh6VGFjNjNvdnFYSFpQeTlHclZJVWgzVGZnMFVXS2pjaFRE?=
 =?utf-8?B?SFlUTTJQRjY4Q0JXVkI0SERBVFZpQVZvQVVhNHRYOFdFTnQ2Z25BbDhmdmJC?=
 =?utf-8?B?dGcyYTBXcnZFSHA0Y3AyclFLSGErTDMzQmlSZnpsTFRDMDN5RG9FaC9jUnRm?=
 =?utf-8?B?b3AwM3NrUXRhalVzSTB5UFowd2Y2b3Y3TVFFSnJKMmdRWk9tMnlMUGFRbnlT?=
 =?utf-8?B?QWtQNjEydmV2ZkUvdVZIVjNuUHl1MUhyN2h5eUtlZXZNVkM3c2FiSWRoWkl3?=
 =?utf-8?B?Q3UwSmVqdnc1cnN2UmgwU1lwaDIrQ1FpSmhvT2RPZlpNaVJBWUFrSHp3M3BR?=
 =?utf-8?B?eXhHbzI1WWtnYi91SWJuTlFndDJFa1Q4SGZwRmRCM2JSZ2FqeHRJTnByajAx?=
 =?utf-8?B?dFN6WWZJbGhPbWZNVFBSMHhTRkU2NjB6enJEOXMvMjMvSEV1ekVVZzBzU3dk?=
 =?utf-8?B?QkY3VUEvR01lT2xRZ29YSzMreGFyWWE2eVlCNnNlMHZ0Q3pYU0FYU3VaeU5L?=
 =?utf-8?B?cDA5UVREVlhaYXVSUDNaOWh0S0ZsaW1TL2ppa1oxdEdmbVlzZHNodDN4MVkr?=
 =?utf-8?B?d0tseS91cWRyOGpBWXY2NGdNT0xEMFd4SzgxZ25jdlRmVmsrSmdhV0dZTW51?=
 =?utf-8?B?ZnFMVFM0d21Vb1BVK25jVHVYRUU4WFlwTW41QVBiVnM5cmptVmViTHV0M1Aw?=
 =?utf-8?B?OSt3RzhTaGw4VHVRemJFamFmaGFGemF2MjhRaHhmS0IrbjI0eXEzWnA4a3BR?=
 =?utf-8?B?aGdkeTFKazROalk3ODBSU2YycVFLc0FpeTgxSTBPTWM1T1V0cW01aHhSd0RM?=
 =?utf-8?B?dlp0cEpBeGZRQVpOcm5zYkhnZGQxbnpUUkVMc0l3Qkk3ajk4S2k3YTJySHF3?=
 =?utf-8?B?R3BiN3RxRitodmJOMkxkUkdaTnUwWnViUWduV1VLZ3hjVFJRN2FtTkFEMDFt?=
 =?utf-8?B?a0hmdkJDQk1COU9rbkFaUkRsMGpicHZKR3hmb1dKUnBzakp3RlFuMEkxMGpn?=
 =?utf-8?B?NmYvdWdMK04zMk1iWlNzTzV2cGNKVFd1dlZRUFl1SlM1OVlBOFJ5ZXZLdUYz?=
 =?utf-8?B?VG1uVUVUR2VWcFJza1MzTjc3Zm10UnJweXdTMEdoMmFEWmxNWkNXUEVpaVRW?=
 =?utf-8?Q?x7QovrlsmJ7VzypY1IgJrkOg1zR4I0lxP/9JcOGhM48M?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2ed0ac-2f76-4250-3f3a-08dbfaebdef7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 08:25:16.9330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PWQ23BwlmW+e0hZfOKb6YMNR2T1KWh+fpZiQNwtRSNbd1j4mKIUcu1aJDMpiMdbp0qeO5KfYHD1fpqPtVKd+ratAQdz5ASfPJbIsq1GjP/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7763
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, aford@beaconembedded.com,
 Maxime Ripard <mripard@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michael Tretter <m.tretter@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adam,

On 12.12.23 04:32, Adam Ford wrote:
> The P divider should be set based on the min and max values of
> the fin pll which may vary between different platforms.
> These ranges are defined per platform, but hard-coded values
> were used instead which resulted in a smaller range available
> on the i.MX8M[MNP] than what was possible.
> 
> Fixes: 846307185f0f ("drm/bridge: samsung-dsim: update PLL reference clock")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index be5914caa17d..239d253a7d71 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -573,8 +573,8 @@ static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
>  	u16 _m, best_m;
>  	u8 _s, best_s;
>  
> -	p_min = DIV_ROUND_UP(fin, (12 * MHZ));
> -	p_max = fin / (6 * MHZ);
> +	p_min = DIV_ROUND_UP(fin, (driver_data->pll_fin_max * MHZ));
> +	p_max = fin / (driver_data->pll_fin_min * MHZ);

I did some tinkering with the PLL settings the other day and this is
literally one of the things I came up with.

So I'm happy to provide:

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Regarding the P divider, I'm also wondering if there is an upper limit
for the p-value (not for the resulting fin_pll) that we should take into
account, too. The problem is that we have conflicts in the documentation
(again) so we don't really know what the correct limit would be.

There are the following ranges given in the RMs:

* 1..63 (i.MX8MM RM 13.7.8.18.4)
* 1..33 (i.MX8MM RM 13.7.10.1)
* 1..63 (i.MX8MP RM 13.2.3.1.5.2)
* 1..63 (i.MX8MP RM 13.7.2.4)

Unfortunately there are similar discrepancies for the other parameters
and limits.

Thanks
Frieder

>  
>  	for (_p = p_min; _p <= p_max; ++_p) {
>  		for (_s = 0; _s <= 5; ++_s) {

