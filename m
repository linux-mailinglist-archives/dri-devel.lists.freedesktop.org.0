Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1307519A3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 09:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F2C10E60C;
	Thu, 13 Jul 2023 07:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0706.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::706])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E5E10E60C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 07:18:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUw9PJi/ED11IYkb5qEE01Uvo+pUZ7f/UcbwnFwdVtG65b2DpdznF3BBVQ78g/OXHIfYBQVxpFCPPylhRWVnDk4KnjeFkULxu/FT5MtwGNOxqTkAuaRqn24pbNk+OgkOLoyuhLSP5lxBaatfgSy69MR4kRGbL5mR5dz/0pH2lfeZ1SR+n/p89gzwD22EHvtTB6kFAWbAOWr0n0oIZMk2zUUjfdM91YvRy2IuvCBin33uJN7Ak2aae0CXYZa5AVN9MKdqMkCivIXpzIwqS0uHDaMPNcVbLJTOaAXVVObgRICcy1PSM83OJwpUpcRnpCKqgj61kLQTXEMpjLNRRWWVgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKYmc+HxJSXvh9gNLZkRjFpi0iWFFhYQmG1flVknIEU=;
 b=U5YNBsQBvLul7v8LVuiG4IhoCVVXWP7PlblVt4pyjPtZiNHMWy/lLwn7X8+kEcdXFKwSYvzVUySUeorMM8J4s6hTWoHzPF8KqSQq97qYjCX9Xc6/CGVnXsOGZ1keIuFsbmiL5Azw/XmDAAWeyEVQ8wPNCQTbYyCErJ5PVPLFEMghCLyaAliOQkn/BUiigUA2D2bWQpMD1bokP19wC5bm89hPMYS/6Zw7Mpy95giShdjV4gtNjKVyV+MEpHVHoItn0N24aAKqw3UGnPBKuIHgfdxOC2ziYtvMLRzm/Y6GbuU/gulsi7AuNIW1LvtIMDwxno8O3c0B0a3JupD87D2FMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKYmc+HxJSXvh9gNLZkRjFpi0iWFFhYQmG1flVknIEU=;
 b=ehPZWqGP/+/HVUPn0A5o7zZqsMxHkoSkWMbqHA7+O5Fgbc45EQdLDeRQR9iIr9dv500O/ncxB4zbyJt3ggm53ojPyrj09zxV9OGcAzRGYOwdjEAvqiU/WVjfC11sULA7PSSgFDnfsuE01i2LaRcSht52dgCfSjyXDaABmaZbg8s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by GV2PR10MB6744.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 07:18:41 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b98:7428:fb6b:3b65]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b98:7428:fb6b:3b65%7]) with mapi id 15.20.6588.024; Thu, 13 Jul 2023
 07:18:40 +0000
Message-ID: <5dc55bcf-abec-78cd-74b8-54fa67fd1fb2@kontron.de>
Date: Thu, 13 Jul 2023 09:18:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] drm: bridge: samsung-dsim: Fix i.MX8M enable flow
 to meet spec
Content-Language: en-US, de-DE
To: Tim Harvey <tharvey@gateworks.com>, Frieder Schrempf <frieder@fris.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Adam Ford <aford173@gmail.com>
References: <20230503163313.2640898-1-frieder@fris.de>
 <20230503163313.2640898-2-frieder@fris.de>
 <CAJ+vNU2d969V1kTHpH+tPK1fm=Z2DUdKSOjwyzRO=9j43HhKgg@mail.gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAJ+vNU2d969V1kTHpH+tPK1fm=Z2DUdKSOjwyzRO=9j43HhKgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0457.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::17) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|GV2PR10MB6744:EE_
X-MS-Office365-Filtering-Correlation-Id: 69994299-9e88-4286-144c-08db83716253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 561mdgmBoEMWd1VyaagPphRle2sF1qzovLegeo+vjle/SUaEfltnCdvieAcLWXlsL+sz7jj6JYf/Kkp0Q349KIlN8am80izozQYOHYyZLZl0U1CjHS8JpwDqwMYHsJHi6IxNBuNSVwe2a8Bm7u4zGD3P0+/xY6vRYV/FnId0/8hpEuqXwi0GJw1HkJbjwhyMAy9CK+ahJYcvx07aVGP39EfLkRlb8/2HdD6PHt6K+qMKfImD4aOqedJHkpzqS+BNgD+8UiYjXhtDC0uK8fotDOqgGv3DiP1sxSGJ3sHH84gfk5YSVy563xqNchOcnCcBw/X19vKVyUzVw+QTOAyCvMaorXCW3HE4Txp47S+baUfdX4VsndkdcgHukmu6m+lk72noso5Crdu+EZ9LsdU9ovoaoCc7khaCZ3ZKdcCzS5Rw5gHiTL6UCqRErH0YENnnfCVmdbaq3dY9sMi9zQ8qxzalwjWH/X2VD6/tcQgSJ2HeSzuqNi2hnCL1DfkjGjDQNNsskct3H3a6KnNrVYPUUR7Q/UvTZ5AbaIS2j1n32f/O2YjZBO/k2TXAn7cePy4Dm5TZcdo+ho4B/5EmWmOnXMtwlew4FQ6+cJGYc/F2BDAXAOqi0vt+2IApm8Bb0EAxjm957/+CkyBHoPFl66L88w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(26005)(6486002)(53546011)(6506007)(966005)(6512007)(36756003)(2616005)(83380400001)(31696002)(86362001)(38100700002)(186003)(2906002)(5660300002)(316002)(478600001)(31686004)(44832011)(4326008)(54906003)(66946007)(110136005)(7416002)(66556008)(66476007)(6666004)(45080400002)(41300700001)(8676002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1dzVC96eEU5MWNqa1RQYktCY0J1c1FJWERuL2FrcWFpRkpLd2RoUXpyZDBV?=
 =?utf-8?B?S1BiTkNDZlZiT1NlM2kxM0VJK0laaUttRTQyTlZPS3JFQnFzdWwrTll5bzRC?=
 =?utf-8?B?ME9leGRFMjBJbWFINlhWOTNVY3dIMG05Mzg0cy8zUXBicndlSkZEazcxb3hq?=
 =?utf-8?B?amVRTTdhQkEzTWxHYzVnV0N1eXNMUFZKYzNRZ0ZGZldLK3V2Q0xOY0hkZ2M4?=
 =?utf-8?B?MWxtQlhZV3I1YXRLNHVxQ1ZEVkRXalRiVzVzU212cmY0OVdyUS9QaHZNS0cw?=
 =?utf-8?B?Y2NHUXZrNUtCRUNFTjFoWlRRdzhDMDdFNUNNbnFZUzE0bW5GS2UvekZ1RUlS?=
 =?utf-8?B?cDlRMG1OWVdoVE00aXVhT1V6WW16L0MrZEJSNklUSCtidG5SU0tXT0xWZmtY?=
 =?utf-8?B?aGtnM3lvN24rWVpIZHN1MWdxbFJtVEt3bWFOVGJMZ2hDOStZdG94aDdMZGFM?=
 =?utf-8?B?ejJwQVh1ZEt1SWlObWhhUDRTeDlENTc3WllSVW9GaElEcllpSnJOd3daM3hB?=
 =?utf-8?B?aEg0Q0J6aWNuWWszdVd3R2RlUzRJY0ZsOWZNSXVnTkxKa29PL21LUW9nSlNp?=
 =?utf-8?B?ayt1SStwZU5ZRU1abWl6aFBOYXk2VC9Kd0ZxQ0NpT0oxbWlodU5zY2hIbXYr?=
 =?utf-8?B?NkdwK2VhUGpwdzVlLytpNjNHTDI3OWplL3N2REYwaFlBMDhMOHhxMXFrcko5?=
 =?utf-8?B?Y0sxV3dIcWNuUFJOMVFaWmt5YkJodnBRTFIyeTZhUVE5THdFSTdHT2U0Z2Ri?=
 =?utf-8?B?RG5BaUdjQ2lJdG1ndGZ6aGlvMUw5Qk9MVDdZazB2dm5CK0dpRGh3NldXV25B?=
 =?utf-8?B?ZDV4andlbTdwZWVxVWNnT09lRFBHaEJnVDZPdFBxa2U0Qk9LMnlCQVlKQzIv?=
 =?utf-8?B?d2ZrNWtoTTA3eHhyQ3huaHRld0kvbDBSQUg3a0F4UW5LNmk4bUJ6dzZsdE5X?=
 =?utf-8?B?ZWNUZ0hicHhtM3lFLy9RMnVzc2owNlgvY0c1a0xxQ1pQZVV1UzRyR2F4L2hR?=
 =?utf-8?B?NGV3R1pyVzViczduNkZJYU9kWExIV0RXbU4xaHhCdEYwRmR4YjRxcWkzaWhP?=
 =?utf-8?B?MmgvdFIvVzFVV1o1THU2QlRIaGs4czlUZndtYzEycVRTM3ZCNzcydXVWL1M2?=
 =?utf-8?B?b3k3T1VEc1dURWxqMFc3RnovVHlybWFXd2ljQUZwcHRQQ09jSWVqOEhmaWp6?=
 =?utf-8?B?aTQvMitsYVNLb0liQTJMSkJERjRvYUJKa1g1bHdoWE1RbVZVNFpmZFY0TXVK?=
 =?utf-8?B?M1N1WXUwSCt5clJDdDdYbFFyd2VQNC9QZlNNa3pDWnRXa2svcWMzc1ZyOUNj?=
 =?utf-8?B?MHdpSndVZlJNeWIwWW52TWpsTEdBYkxvUSswYmo5R0p0aDhpdzZFeDJ3R2Jp?=
 =?utf-8?B?ME5acFNGS1lFMnArVUZIVEVIeVd4a1hqWmM2VEFLZDJSZjBLcjhGYjJCRFFE?=
 =?utf-8?B?ZXh4aFkvY3J4bllvODVZY1M3bEdPL2Y0cVNJZWdWVTZzMHQ3ZDJ6SUZjdStZ?=
 =?utf-8?B?eCtjQzRjdTNmVk8ra2NMTEpSQ0JsTDBPQkQydXZFdENUV2VEbjN5eERtS09F?=
 =?utf-8?B?ZWFtc0krSE1PdHh0ekVrSkFEYmdobjlGd25CTHc3ODcvNkxYc2JJV1lwd2RG?=
 =?utf-8?B?aklLU1lpbkM2R1ZUaTA4WkdQdVVjb1B5M0xlWXpwd09zNHFSbUs5a0pnR0NM?=
 =?utf-8?B?TkpDVDc1SVoza1ZUVE1LNkFKeXNXcGpBay85RGVEbkhVbzRHdEV1SGptQVE5?=
 =?utf-8?B?SXRyREMzZEo3RTJJNUE3bkE2eUpHOHc2N0JWRU1uNXZ3aVo1bXpmQitKckR0?=
 =?utf-8?B?V3Uzdkl4T2JWVUgwYUd6RHk2T3JTSW9RR28wMXh4OHJQbWZjQlF2aHRNVGpR?=
 =?utf-8?B?WmdrbndVZjZ1TVJNbGJPZXhWc2Uwc20yZVIyenovYnF0aGZYY2FGNk5CZlZ4?=
 =?utf-8?B?Wm1WaE1BNjN4NWd2WG41N1BwLzhsVUFINUx3SnhSRnlBTEJBSWZWNzhnMmlE?=
 =?utf-8?B?MFlLKzNRWWs1ekZwR2xWOHNFK3UvWFFud3pWUTdXbkhYNDBmcEVmSGE1WFJZ?=
 =?utf-8?B?MW55TEJHNzFDbVZ4M0h6enkwbGxkQmFWUjduQ2t0NTQ1OGNValpMRGpGdXU2?=
 =?utf-8?B?TTdIbXRyUzRnb0Z5VmRUMk9jVnY1NGZEdnlZbHdCQWJQV0NxK0R3Snh4d0ll?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 69994299-9e88-4286-144c-08db83716253
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 07:18:40.8818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRxbQS7lw/ivV1RC4cl2WL1q5oUwObeT40r3dE2YN5mrg38f/03MzbUlmnCpgAjIizJ/8LNaR6gvg0avuvbcvqdxR1W0ZbHPrztfGvKTQ2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6744
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tim,

On 13.07.23 00:34, Tim Harvey wrote:
> On Wed, May 3, 2023 at 9:33 AM Frieder Schrempf <frieder@fris.de> wrote:
>>
>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>
>> According to the documentation [1] the proper enable flow is:
>>
>> 1. Enable DSI link and keep data lanes in LP-11 (stop state)
>> 2. Disable stop state to bring data lanes into HS mode
>>
>> Currently we do this all at once within enable(), which doesn't
>> allow to meet the requirements of some downstream bridges.
>>
>> To fix this we now enable the DSI in pre_enable() and force it
>> into stop state using the FORCE_STOP_STATE bit in the ESCMODE
>> register until enable() is called where we reset the bit.
>>
>> We currently do this only for i.MX8M as Exynos uses a different
>> init flow where samsung_dsim_init() is called from
>> samsung_dsim_host_transfer().
>>
>> [1] https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation
>>
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> ---
>> Changes for v2:
>> * Drop RFC
>> ---
>>  drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++++++++--
>>  1 file changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
>> index e0a402a85787..9775779721d9 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -859,6 +859,10 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
>>         reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
>>         reg &= ~DSIM_STOP_STATE_CNT_MASK;
>>         reg |= DSIM_STOP_STATE_CNT(driver_data->reg_values[STOP_STATE_CNT]);
>> +
>> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
>> +               reg |= DSIM_FORCE_STOP_STATE;
>> +
>>         samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
>>
>>         reg = DSIM_BTA_TIMEOUT(0xff) | DSIM_LPDR_TIMEOUT(0xffff);
>> @@ -1340,6 +1344,9 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>>                 ret = samsung_dsim_init(dsi);
>>                 if (ret)
>>                         return;
>> +
>> +               samsung_dsim_set_display_mode(dsi);
>> +               samsung_dsim_set_display_enable(dsi, true);
>>         }
>>  }
>>
>> @@ -1347,9 +1354,16 @@ static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>>                                        struct drm_bridge_state *old_bridge_state)
>>  {
>>         struct samsung_dsim *dsi = bridge_to_dsi(bridge);
>> +       u32 reg;
>>
>> -       samsung_dsim_set_display_mode(dsi);
>> -       samsung_dsim_set_display_enable(dsi, true);
>> +       if (samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
>> +               samsung_dsim_set_display_mode(dsi);
>> +               samsung_dsim_set_display_enable(dsi, true);
>> +       } else {
>> +               reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
>> +               reg &= ~DSIM_FORCE_STOP_STATE;
>> +               samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
>> +       }
>>
>>         dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
>>  }
>> @@ -1358,10 +1372,17 @@ static void samsung_dsim_atomic_disable(struct drm_bridge *bridge,
>>                                         struct drm_bridge_state *old_bridge_state)
>>  {
>>         struct samsung_dsim *dsi = bridge_to_dsi(bridge);
>> +       u32 reg;
>>
>>         if (!(dsi->state & DSIM_STATE_ENABLED))
>>                 return;
>>
>> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
>> +               reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
>> +               reg |= DSIM_FORCE_STOP_STATE;
>> +               samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
>> +       }
>> +
>>         dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>>  }
>>
>> --
>> 2.40.0
>>
> 
> Hi Frieder,
> 
> I found this patch to break mipi-dsi display on my board which has:
>  - FocalTech FT5406 10pt touch controller (with no interrupt)
>  - Powertip PH800480T013-IDF02 compatible panel
>  - Toshiba TC358762 compatible DSI to DBI bridge
>  - ATTINY based regulator used for backlight controller and panel enable
> 
> I enable this via a dt overlay in a pending patch
> imx8mm-venice-gw72xx-0x-rpidsi.dtso [1] which works on 6.4 but not
> 6.5-rc1 which has this patch.
> 
> The issue appears as:
> [    6.110585] samsung-dsim 32e60000.dsi: xfer timed out: 29 06 00 00
> 64 01 05 00 00 00
> [    6.326588] tc358762 32e60000.dsi.0: error initializing bridge (-110)
> 
> Instead of
> [    1.011729] samsung-dsim 32e10000.dsi: supply vddcore not found,
> using dummy regulator
> [    1.019829] samsung-dsim 32e10000.dsi: supply vddio not found,
> using dummy regulator
> [    5.649928] samsung-dsim 32e10000.dsi:
> [drm:samsung_dsim_host_attach] Attached tc358762 device
> 
> I'm curious what board/panel were you needing this for and do you have
> any ideas why it broke my setup?
> 
> I'm also curious what board/panel Alexander tested this with and if
> Adam or Jagan (or others) have tested this with their hardware?

Sorry for breaking your setup. My test- and use-case is the same as
Alexander's. I have the SN65DSI84 downstream bridge and without this
patch it fails to come up in some cases.

The failure is probably related to your downstream bridge being
controlled by the DSI itself using command mode. The SN65DSI84 is
instead controlled via I2C.

Actually we should have tested this with a bridge that uses command mode
before merging, now that I think of it. But I wasn't really aware of
this until now.

I'll have a closer look at the issue and then will get back to you. In
the meantime if anyone can help analyze the problem or has proposals how
to fix it, please let us know.

Thanks!
Frieder

