Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FDC567F92
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 09:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631EA10E6AD;
	Wed,  6 Jul 2022 07:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10134.outbound.protection.outlook.com [40.107.1.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AF810E16B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 07:09:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8wZUS7hMgKaMojjlR+nizAJ08XwzHcZM035D4OCPO/NNKhbHc8lyPjRA44VXdrGFEiXqGtdW9xwORIhHGjYVPBQLckv6IJmU0QkQoza2jVV/XrLd5nbC13cQaFhZpkNcZMXHOzBfIdWlixwyQYXXpusPg00BIu6z44M0VB2pSN+8wkmtu9Sx3Ge2qqQyDA7nZKfWh/l6AINI5yfb4peo/uG0gLETRRHbfJx4RogDtPnCIwzracfPpHoGMoDP7aVwb2fyh5dVnf7D3f/Sgh0ANxFW7SEVENMFptD/rfTlMQcUGiw/YNvGqdtccBy8W61kuo47kFv4Q6IiaEIf82Mcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dePFKP6752RfAz0CfyUZkj6hn+MyHkIuJPASD4N1o7M=;
 b=dzCpuCqkYOprO0+PVuywLHLfR7GdJiHBg4brZqqF6mWQFNsF8E1bEVLT3egAgr4iGO/L1yBkmTw5gOyeIbliKg1f93zXHUD8RqtrPTyO5Y5O7Hp4lsV2740whUqOK+b/S5LABpGjMO7z9SEdTk7oW6p8bdf+VQgzscuqHw1HIxzs+OT1B+v/2GAf9/eduZxOINdNOR2Ab/m2Lgjed26IHKivJBRzRlIFhtkFY+3Fgv9XjpuRPKdWTPUOnaEodPhhOpQ9llFriQNzfPeAZ7qEI+ncAXBKqjBnmcCP44u8NmJiIdHHCneMInsmAjR/q2dLi/U3w1Pqcg7lCTa76oKWvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dePFKP6752RfAz0CfyUZkj6hn+MyHkIuJPASD4N1o7M=;
 b=kNRyj3kkSWhKR4XO0SC8lEYHrVU7h+RqTrISMgyEPwP9Cvy1z7Jb/npaFCMe5XKd+nFk3VlVe/53rr7wWWJkbSIjm4o3kbBbe36OmdI1gqOWz8bGtcT2Tjmbs22q1b44WDdpbxcBT3S1d7684pU0E+7zPCBQtSW2dPs60rptHq0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by PR3PR10MB4111.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:97::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 07:09:27 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::35e3:b154:10cd:4ebd]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::35e3:b154:10cd:4ebd%6]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 07:09:27 +0000
Message-ID: <27702b37-2904-3a2a-dd0b-1111efe70826@kontron.de>
Date: Wed, 6 Jul 2022 09:09:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <CAPY8ntC-2Yij+a5wWEZ3BRBSh7bz+74coHCoB01ZhY550H+BDg@mail.gmail.com>
 <CGME20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7@eucas1p1.samsung.com>
 <CAPY8ntAi1tM7BZEpKkMAasRH3R_+tJCUFY7k-yVBdtogvxQNRA@mail.gmail.com>
 <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
 <7d3bcbaa027422018b956507d5ac5d19422dc892.camel@pengutronix.de>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <7d3bcbaa027422018b956507d5ac5d19422dc892.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::9) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16d8e7f5-619d-44d1-9cc1-08da5f1e76e6
X-MS-TrafficTypeDiagnostic: PR3PR10MB4111:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S7GkrxnPpg4If8+gLR6CtGPJ2xjmt5QyM/P4X5BfOjk+YPimRikHPdU0OSDGL8sbpijSjni6HUSm384XUSxJ1Nz1GJGgy8jneAzRnofaXfrl1SxpR18KnibW8P6Pl8PLAAxBBtxt1lDZpUURJnFu4+xm3+vH7IiP+Mhe4ZwY5azjHCJNHgCSgE081RlFWCFRzCicIn++tW4rFN9OQhQVjG7Bv106rbt38Zs5CaUqQB+77tiLtBUUbeXJ43E59QzDDelPHNSsFF4WOwN9+egm/fB55zs71Gtm8M4IFumA8MLUBSkZIXUSp1yHz/WmPn16gFzVGZeB0ozrdSR9+Ei3S6dH177ZJJ2SqVbphTcHaeGRP5mOtpvs4PTO950X5FJMxCrgsAoP6QloVZsfryRbPvVYnBT87nLZpzsM+VmdAtXFL3AkQ81f7hazfGvVcFT8RrNGQ7Ue/6bGxPbdBDzjFY6/5oto1aEZyBzqU0nFekYio/bOtgMrmicMkLFRqRXW56Xe7KScQllbjEWW53WEpq14SMX/FY7VpEXLtftQytDnVOnXBesP16Nz/6Jq07XyCaQtLeC5ie3Y1GHwBCNZYU6nHK2qosWOfHN8Ho9HjnoxV5TJat69OOT4k/0Y+Tzvo9u+Qwzf4M61Wv9JtTGJNesu1aBWBaSSoXKW6+nYcbdMY/9Y4IwtvckCQzOfzKQN48oN5kFHZRfDmS4hyS1V0zWjQxy63D1wHv1bPnCHAsGjZHlZiLDtj1y/m/utf7HXaTQpwjtEHQrnALnhyyq5QSIpPADtChfq9kEGL+mKtC2uBZsedRvwf3UiGkLbv7TMXtQLQMWV6/T6OAMWveJWpoxzqXHznluutMa46AuL0cI3/JpGwCmbpJnl8wBUWgnS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(83380400001)(38100700002)(6666004)(41300700001)(36756003)(54906003)(31686004)(4326008)(316002)(66476007)(8676002)(66946007)(66556008)(110136005)(478600001)(186003)(6506007)(8936002)(966005)(5660300002)(6486002)(7416002)(44832011)(2906002)(53546011)(2616005)(86362001)(31696002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L25ndGx2dUlSV0xLTXFGMTY5QXZlUUp3VmJ2NFpkZjk4MGRZMEp3VUxhbElJ?=
 =?utf-8?B?NStBbmFvdnREbmhEMkNuNFRkRmwwZ1dzdGRySU52UlhUR3pOWk9GaE93TGpC?=
 =?utf-8?B?Q3lrbU9WYUpaSHNTYkl6bFI0NU13RXRyQ2RkOXVSK1d3K3pxTmJOcGN1MFZx?=
 =?utf-8?B?cG96c3o0OS84NDdaUVlRTHVETFpsSWE4aUdtVld1S2d3QnprOGdXTGo5ekkz?=
 =?utf-8?B?ZGpzeVpBU2x3aWh1bCtzSlgxZitWbFVCeHBIU3hqUVQyb0haSnZXWDE0c29H?=
 =?utf-8?B?SCtiSTFUQU5Cdk5ITEZqUjlSaDQ0WVVpb2hMWHpQNmc1cFNKL2h5WUpOVkY5?=
 =?utf-8?B?cFQvb2JRMWgydThmT0IvekhXeUJZMnZ6VUxBNWdMbUNDMnNiWFJUTDJEU3ov?=
 =?utf-8?B?RUxNSFFMUFgyVVppQUNnNlMrdWpPN050SFhnR1N1enh6TVRkc1BXS3VFaS9P?=
 =?utf-8?B?bnFuTTlWYTZUa08yemRuTDF3WS9BRHNVK0xHVFgwZmJZV01XYU9zZ0c4QXIy?=
 =?utf-8?B?K0IxVlFNQVlMVVJjemxaeW9aZ1hmTXZ2QlJRa0pBdWY0NU43L0R2b2FIUER2?=
 =?utf-8?B?TEVRc3NqenlpdVZyeGQ4aVRHQXBSeEZFK2cxZmpQSkt5K2xLSzVrYmVKdksw?=
 =?utf-8?B?VDJpd3pHU2xFVmdFMjNNbFo2SHVMTktOK2tJYVNMQTQ5KzFTUHljTExnR1gy?=
 =?utf-8?B?TkdJNzFSWmIzZWZZa1RMT2ZWS3Jkd2ZiR1Q1a2E0blljVXZwSFRmRGM1aEsx?=
 =?utf-8?B?c3VWWVV5UUJEZTgzbEowdG5mdjlrdGhNMGxBZjdmRGdjeTl1TVROZGVZUXNR?=
 =?utf-8?B?TkJzbDBHekRFbTk5L2JHK2JEdnc1a2M1OTBSTjVacnplbVZYM2kyNE4yelJ6?=
 =?utf-8?B?aTlGakRKYmJqbGp0VVdNNXZPRlRzL1hJcTRqcDR1c0VzQzJ1V01JRE9kK3F4?=
 =?utf-8?B?NlV5U1RSb0duYjB3ZFpLaE9KSnkzUUlLZ0FNREhEMFJBNWxwcnRHOTFvNHFZ?=
 =?utf-8?B?VW0zSTBacWNqRDZ6MzdIbUxhWDNPS1YranVYaTZOTmZYTnA3OE12TGt3eVQw?=
 =?utf-8?B?anNBcE84QU10NW55SzFKWW53MCtqTldwdTdSVUJhbDR2emE2eFVYNVBBQzZo?=
 =?utf-8?B?anhibjRTczY3cHdqRTUvREsvYi9wck9KV3plMk5SV3U0L2k2OW01dWxRRk5D?=
 =?utf-8?B?ZzNvOGVVbHlTRkgrK3pWc2xlKzZ2d3k3VmFoQ0pkV0tSWVRJM2lLcEJyMzFJ?=
 =?utf-8?B?N0hDQnRwR1UvOCtUakFwRDV4V2w2UGF1c3R6QWdSVU1ObThEc2ZmRkVJRjZa?=
 =?utf-8?B?aDVHUUxzdVVGN3ZhaEdBVzRCd0RrOFBLdGhuWlgyMTBZaUxHQy93K3hDdU5I?=
 =?utf-8?B?eDdBM1V5RE52RC9FVHZ6TkhNSUxBay9VUDRxTU9sNTU4Y2tFVnJJU1NpclVt?=
 =?utf-8?B?TnJXVllxbytrZWJQOCtDa0wwQU9GbkpYZTRxT3IwUVZPbi8wQ1pFVjhCcENH?=
 =?utf-8?B?MW1KemlIbENFK1ZDc3FoT1I2a2ljNXgrY09lbU5rUlc2UUlLZWlzMHVmSFFY?=
 =?utf-8?B?dXRQTlBWOGdYSWlXMUNtVFh5Uk5tdVN4UW5lNTJtbHVtREM0MXF2VWJVZ1Fj?=
 =?utf-8?B?WE5jdTNPdVQyNk1aMVgvQnYrTUZyaEJhUEVTVlZ0MFdHNTdPVC9HYTlTbmVD?=
 =?utf-8?B?Y081VUZ6bk4xSWloQ1hGdzcxMlpQRFo4bDc5TVJKdEQ5SXRzbmZuRldjZjNZ?=
 =?utf-8?B?dHZPZUFLd0ViWldlVUJvUjhjcTVxQUw2d1FlYXpoaC9EUTlJSVRCOXJNb3lq?=
 =?utf-8?B?MTR5TWpLMXBoaDkvRW5HVGQ2NHE1aklQTU8xM1A0a2VEem81TXVUdmYzcnZa?=
 =?utf-8?B?WmM1ZVlaOStCRFdHdGk5TkVHWGtQVVZmWkZPeTJoZ2VEOWV0ZFNjWVBCY0Vw?=
 =?utf-8?B?NDFwTHBnZjZ6OXVvUktmYUJOaG9vM2ttVUh6OUtMNDZvWkpwa3p3TmwxU3Nu?=
 =?utf-8?B?b1RSK1RWSnpzTE4wdTFXS2pUQWIwamRYaGNVS2lNYW5ZWkFqL3g5VjBCb0oy?=
 =?utf-8?B?VjN5SStQU3pJdy94QzhpRVNvKzZPMmJDR29OY3hVRnpPSGt4ZUlOL3d3cEN2?=
 =?utf-8?B?NzJGNCt2K2dxaFhYdDZVRm9SeU8vYkQrVVQ2Y3lyMHdmYk9YWm9tZi9UT0tK?=
 =?utf-8?B?SkhoQmRlZFhIWWI1bENRU3JqNzNHOHd4QlV6SzFuMDR6SzhHUjd1dy8rNW9v?=
 =?utf-8?Q?at3OC2abLVNeJQQrTXXVGcmSlXMsleKPWzwN+pRbcI=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d8e7f5-619d-44d1-9cc1-08da5f1e76e6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:09:27.6078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJU1xl66zC+WK5jvRRelsfV+1hzvFLPzXX+kc2OfwUf8OEu85lFzgnVHdg9y4fLjWbWJYZmAfVJAm6wJy2xm2B7iDY/02BknBF1jbumgWqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4111
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.06.22 um 09:52 schrieb Lucas Stach:
> Hi,
> 
> Am Mittwoch, dem 11.05.2022 um 16:58 +0200 schrieb Marek Szyprowski:
>> Hi Dave,
>>
>> On 05.04.2022 13:43, Dave Stevenson wrote:
>>> On Fri, 18 Mar 2022 at 12:25, Dave Stevenson
>>> <dave.stevenson@raspberrypi.com>  wrote:
>>>> On Fri, 4 Mar 2022 at 15:18, Dave Stevenson
>>>> <dave.stevenson@raspberrypi.com>  wrote:
>>>>> Hi All
>>>> A gentle ping on this series. Any comments on the approach?
>>>> Thanks.
>>> I realise the merge window has just closed and therefore folks have
>>> been busy, but no responses on this after a month?
>>>
>>> Do I give up and submit a patch to document that DSI is broken and no one cares?
>>
>> Thanks for pointing this patchset in the 'drm: bridge: Add Samsung MIPI 
>> DSIM bridge' thread, otherwise I would miss it since I'm not involved 
>> much in the DRM development.
>>
>> This resolves most of the issues in the Exynos DSI and its recent 
>> conversion to the drm bridge framework. I've added the needed 
>> prepare_upstream_first flags to the panels and everything works fine 
>> without the bridge chain order hacks.
>>
>> Feel free to add:
>>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>>
>> The only remaining thing to resolve is the moment of enabling DSI host. 
>> The proper sequence is:
>>
>> 1. host power on, 2. device power on, 3. host init, 4. device init, 5. 
>> video enable.
>>
>> #1 is done in dsi's pre_enable, #2 is done in panel's prepare. #3 was so 
>> far done in the first host transfer call, which usually happens in 
>> panel's prepare, then the #4 happens. Then video enable is done in the 
>> enable callbacks.
>>
>> Jagan wants to move it to the dsi host pre_enable() to let it work with 
>> DSI bridges controlled over different interfaces 
>> (https://lore.kernel.org/all/20220504114021.33265-6-jagan@amarulasolutions.com/ 
>> ). This however fails on Exynos with DSI panels, because when dsi's 
>> pre_enable is called, the dsi device is not yet powered. I've discussed 
>> this with Andrzej Hajda and we came to the conclusion that this can be 
>> resolved by adding the init() callback to the struct mipi_dsi_host_ops. 
>> Then DSI client (next bridge or panel) would call it after powering self 
>> on, but before sending any DSI commands in its pre_enable/prepare functions.
>>
>> I've prepared a prototype of such solution. This approach finally 
>> resolved all the initialization issues! The bridge chain finally matches 
>> the hardware, no hack are needed, and everything is controlled by the 
>> DRM core. This prototype also includes the Jagan's patches, which add 
>> IMX support to Samsung DSIM. If one is interested, here is my git repo 
>> with all the PoC patches:
>>
>> https://github.com/mszyprow/linux/tree/v5.18-next-20220511-dsi-rework
> 
> While this needs rework on the bridge chip side, I fear that we need
> something like that to allow the bridge to control the sequencing of
> the DSI host init. While most bridges that aren't controlled via the
> DSI channel might be fine with just initializing the host right before
> a video signal is driven, there are some that need a different
> sequencing.
> 
> The chip I'm currently looking at is a TC368767, where the datasheet
> states that the DSI lanes must be in LP-11 before the reset is
> released. While the datasheet doesn't specify what happens if that
> sequence is violated, Marek Vasut found that the chip enters a test
> mode if the lanes are not in LP-11 at that point and I can confirm this
> observation.

The SN65DSI84 also has this requirement according to the datasheet.

> Now with the TC358767 being a DSI to (e)DP converter, we need to
> release the chip from reset pretty early to establish the DP AUX
> connection to communicate with the display, in order to find out which
> video modes we can drive. As the chip is controlled via i2c in my case,
> initializing the DSI host on first DSI command transaction is out and
> doing so before the bridge pre_enable is way too late.
> 
> What I would need for this chip to work properly is an explicit call,
> like the mipi_dsi_host_init() added in the PoC above, to allow the
> bridge driver to kick the DSI host initialization before releasing the
> chip from reset state.

So to sum up on the missing parts:

1. This series needs more reviews, but is generally agreed on.
2. Jagan will integrate Marek's mipi_dsi_host_init() PoC when respinning
his series "drm: bridge: Add Samsung MIPI DSIM bridge".
3. Bridge drivers need to be adjusted to call mipi_dsi_host_init() if
required.

Did I get anything wrong here, or is there some point that I'm missing?
Jagan, do you have any plan to pick up the threads?

Thanks
Frieder
