Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FCF793846
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498E510E1CB;
	Wed,  6 Sep 2023 09:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2123.outbound.protection.outlook.com [40.107.7.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210B010E1CB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:31:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TS5OhMQYt2A+gL9p598ypz9I/N414RrPrPph1HDL29sw808sy/b3G9C0tTBafRZdnq1OqpHlJEc463YHosa3IaLj5pJuG5F/mlSLRqxAfqE1lYTXfkUjL1ybnjBfsgX3V5VmD2zD1wox1FOntBjui4xmtQ80TMu9nAMecOzKTD2iGecGE/2WfGJh0YXPs7TAZOdvXTZGeynL83yg2sscLCX1USrHouTryM47nFoUB1Sg88aRMZeMbTJV0ItNVhspbvmWf/5iqjlVfyRJJGgTVEijt5IoWpIazU04kr33IwiLZXkLcOB91sqYkrz2r0bU754uX2Tbon8zRUKObVhwiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHShvVMpLFpuSVH+77so7o5PlZjjH7PsiGvSaQGmVrw=;
 b=Yq+o/xZ22bmkaD1dj8dAvnQlxcWT9VUgdUpikaMD2IVQlgUAQR/gBO2VrquFzj9Dt7NM4TJ+2nBhXz7TAsNBgZXFveMrRtsBdwgdj/dHYUBVg2kgBp3X6muDR3HO564IBWK+VajC2kkk19zp7CCmza/SijPz0H5xPMHN6co0St2WmHs6IjrnPRePzOj7FJHFus6A//I8EY4dsVgp5toESpJEq0pAqLIItPZMomq+hMIN6W1pgfoNVtIdNooo66jb31vOWO2PUPQMiiOthFzvTaUCpdyuM1z15Y0VNGCbVv+ecAJ5W+0oZYO/6GIC/VcQHzMoVjjK6T4rok3N6/Cd6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHShvVMpLFpuSVH+77so7o5PlZjjH7PsiGvSaQGmVrw=;
 b=VNZ4yk+TauLmmR8745EdOlmf7CFhWbIw0v0B5imr8T134uePdzDYD6z6p7tmJ7nB5Zup2gTcNd424JgoKUnRSdrhUgE3mCvGfppkYDVdWv38NBZQJqt6j3EN7iG2/69K2RGnbhkO+lkKtx3+wgJVdPE7p1JyTP4I98VwR4Ahl3w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by GVXPR10MB8251.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:120::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Wed, 6 Sep
 2023 09:31:49 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7c42:15ff:f9fa:b221]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7c42:15ff:f9fa:b221%4]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 09:31:49 +0000
Message-ID: <86fac1f0-0fcb-4cbd-a983-03a6e7c41097@kontron.de>
Date: Wed, 6 Sep 2023 11:31:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm/bridge: samsung-dsim: fix various modes with
 ADV7535 bridge
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: Michael Tretter <m.tretter@pengutronix.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <a95481b7-e38c-4b7c-be49-4c74e07d3523@kontron.de>
In-Reply-To: <a95481b7-e38c-4b7c-be49-4c74e07d3523@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0229.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::19) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|GVXPR10MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc31a99-73f0-4f34-cd71-08dbaebc187e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EKizITnDg1ORdv8Xz38FElxPXIxql9FCtJUfYlogtbHH4DLYm3SjspDSVljQYGIJqqF46j9/9wePQ04XBbCkXrDJFD6pb0uv2eZ5AThVYEimz1GM+y0rhKDAzBj1Sy7bIMO7B7u+dUqPyAmul9NQz/L0U7is2sWBfDmiPpJcMi+gQiLd6NvkmNeau4ePRBktc4x7/+JQeHvbAz2FOLj17DqLD4BdXQsye5Tu72h93grpp/onCQ2RzqXpX2JdfoByw8I/xC9m/kEkzmnzDChZwVE5gJiK9bgnE3+CtPc8Jz+hQeADMKNqopXVRoRje61EEePBG4uuIQHJazz/My4x7mG2+W9hOOi5zT6EGW1qaOpQPuQ9bQh3SIojjMFppMkwuLXjLVS0weUVP4ngPpeHbMqBRPobZqrRy9QNYrRtdv4QV59z5vmummYMh4v56g9EYm89bNc8uxZ0vnTazHw9p1TCiJQzf8dvO1C0t32h8fCnPDBNU90rYjdGg6wOc7O93g0qR6Pf53X/FjdZ6+9tgr2HPdmW9Ud7kj04n2b72TcZE8r4YMnjb+DxGrn/hsMkyNhmhuDLEkzKraAGBCjlF3bzIam1UCrfWhFc2veDyLi+GGWrQgXLnNXv2Baa04q3EDwJUcRivC3H/PdBx8j/HnDRr77Pqkt4aHx/e2lPbVY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199024)(186009)(1800799009)(38100700002)(478600001)(921005)(966005)(36756003)(31686004)(6666004)(26005)(41300700001)(6486002)(2616005)(110136005)(316002)(66946007)(66476007)(66556008)(83380400001)(53546011)(6512007)(6506007)(8936002)(8676002)(2906002)(4326008)(44832011)(31696002)(86362001)(5660300002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckxsME5rVTRhLytLdmlOQzI2WUpJTHNKTE1oU0QybUdDSVNjUHMwUWRNaGtV?=
 =?utf-8?B?R09aSndCYTBpc0FOL0tpUGxFeWpYVnBxMUZiWCtHSjNROXRuQkozSGRTWW5u?=
 =?utf-8?B?QTdkL01GNDZQUlBDaTZlTFl3ODBjd1hycDZrOTlYYUJBNUIxVVJpcXA3clA0?=
 =?utf-8?B?Mi84VitsVUV4ZmcrR3h4bUFyYXIwZ0xybGYxTk1VbWVWUHgrVGV6NE8xNjAz?=
 =?utf-8?B?NGFRTXk4QzVpbkJCYzlDcjR5QjcrQithcDdSK0NSVzZCUzZzeGFKRmx6Y1R2?=
 =?utf-8?B?VFNMRnI1QTI3UWZHK0NBODdiNnVaZXVXT1Q3d3kwSFpGNmhML3B4M1hxT3hu?=
 =?utf-8?B?azRqRkVzQlBoVHhkampibkdkdzB6Y25SZDJ3OWZUTkdFTHArU2pNSnFYemtq?=
 =?utf-8?B?S3BrNVR3YkNhTGlvSG1FMURjQVNXcWY0L2JObzhZY0xpUjJHb1g0YlJkL0or?=
 =?utf-8?B?UlpPNDRHNXEwdGRCWXZuT29CWng3U2NOcXowNVY0ME1TajBySnlRbjJJeWhJ?=
 =?utf-8?B?c2w2NmZRWXBJTkVSc3lQaFk5VW8yVURvbUdCbTlVM016b05qeVJKQ2lrbGNp?=
 =?utf-8?B?cnQwMWRXTW4zcVdENFAwcFM4QytTT1N5Y0l3TW1NazRoU3NsTDBFa3hXMXJm?=
 =?utf-8?B?dFlNOERDYXhVb080VXNsdXRXQmQwOFJUbnZSM2dBVWZXVk85dm01NHNDeWlL?=
 =?utf-8?B?aGFvQ3ZvaTdOTTE5STNRSHFYckpUSjJTSWMxR0pBMUk1R205STRFa0N1RFhM?=
 =?utf-8?B?cUNIcjFnM3BJSy9hdDhCRDJOVGMrTS8zYWdUdmtpbW0vL21DYUJjUkJaOXNw?=
 =?utf-8?B?L3FPRW53K0VSeDRhc2xwZlJnRGlqZVRMSGgweUNUU2NlNllhUlZ0Nm9zV3JV?=
 =?utf-8?B?QStvZ04waDZqQ2VQcHRTM1R2N1l5UHdHOEs0K0t0T2tyOG56NzB4ZktpRUdh?=
 =?utf-8?B?WU1jdzZBc0NZK050aGJKNURhb2dKU2NOZjZ6dW9BZDc0bktBWUtrU2o0RERM?=
 =?utf-8?B?YUpaZEJta25NelNhcTlxUXljSEk4aEk2QUNkSndST0tHTDd3YzYzZzh3NkVx?=
 =?utf-8?B?dS8xTVEwVE44M0VTakdaUGZTUHl6bFN4SWRkYitMbHNZNCt6RndNbVFoMDlJ?=
 =?utf-8?B?MS9TYnhNdjFiaS81OE5iWkltRjF3YkNCc3A2S0d3dVcrV0FRTHdBWmptckRS?=
 =?utf-8?B?QW1PcmY2cmRGekh5R1djR1pidkM5TWtLWXMycGZqVklJRmRNYTdwbm9hQ3FE?=
 =?utf-8?B?WDU2cEJJblpiTmZvN0hnenZkSUVxc0o0TW05ekdrWC9pK2FkVEkxTDMrMGFn?=
 =?utf-8?B?eUp0dkZoRTJQMlUyL2hxdCtnUlpVMkVGWTBLNk0yVEd5Q3BlSjdqUlY0TlJy?=
 =?utf-8?B?N1FsdHVxWXhGay9NRjRzcys3b1U4aWwzYS9TSVN5SmxVOWRPV3JlNy9lZTVk?=
 =?utf-8?B?OFRZWnR1bjNORDRGQ2tmVm9HU09yTXlCOUlJclR1K3ZGWFROckRXK1hqWU9k?=
 =?utf-8?B?aVgydWtTTzdZdHpUYmNjd1FMb0NLNW1xVi9tUitGa3U4MFpHU3QrM0QwcStG?=
 =?utf-8?B?YjQ1UWc5VUNIZmNwUHhEdmZtbDBoU3hONXNHcjRmaEFmUVl5WTNmaWQ1bUgr?=
 =?utf-8?B?TzliVGxkb2JUK25zdGVpZ2xwc21FUEtBTGZtd2FpdXp2S1RpUFdDQUlRTk4r?=
 =?utf-8?B?akllYzk1eDhId2V3OXZjVFZVck1kVHZnb2lhTzBZRVovTFVsWXhiQjN5SHU2?=
 =?utf-8?B?TDMyZGRoM0N6dnlWSHBzT1BYVjFjL01vTTV6Y2NJNFZ6R1c0cXF6OVJ3eGNM?=
 =?utf-8?B?YzRUWDJpeWlOVWFKeFhla09sYURvVHJicGNud3gwY3dLMWpiZXZrbS9odkor?=
 =?utf-8?B?YjVmUWoxeThkR3dzdmVweklFOVdmQXR4Qmd5eSt3RzZ4ajVUNXNpR1VkM1h1?=
 =?utf-8?B?T1d6UmxYWmVDN2RjaDZJc094VWVpQlFVUGFHeWZSWnl5WXczUklWSERyVnZT?=
 =?utf-8?B?bGhnOVMzY2puemtpOGZrbUh1NXBpanJpNncyR0lkL2tsdWV3TkhQVmtDMnlU?=
 =?utf-8?B?ZU44OS9XaWg5cmlpOW1qL1FadEdIM3ZCaXNRUkJKQnlmZzloc3NzMWxYUmJ5?=
 =?utf-8?B?Sk1vcTdQUnJKT2piY251dldKZ1ovYWRUYU5YRjUzK1hrR1grSmdRQldwL2p2?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc31a99-73f0-4f34-cd71-08dbaebc187e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 09:31:49.2342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85wZmplyprsjexLL80GKVyOnOVb4PGm82dFcmjHWGPqf70noetXQRkv4RQ63px27s8YcAHn7DZ4nxJQNjef+CpPvlvMv63WoWd/GuWBvSkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8251
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
Cc: dri-devel@lists.freedesktop.org, Marco Felsch <m.felsch@pengutronix.de>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04.09.23 16:02, Frieder Schrempf wrote:
> Hi Michael,
> 
> On 28.08.23 17:59, Michael Tretter wrote:
>> I tested the i.MX8M Nano EVK with the NXP supplied MIPI-DSI adapter,
>> which uses an ADV7535 MIPI-DSI to HDMI converter. I found that a few
>> modes were working, but in many modes my monitor stayed dark.
>>
>> This series fixes the Samsung DSIM bridge driver to bring up a few more
>> modes:
>>
>> The driver read the rate of the PLL ref clock only during probe.
>> However, if the clock is re-parented to the VIDEO_PLL, changes to the
>> pixel clock have an effect on the PLL ref clock. Therefore, the driver
>> must read and potentially update the PLL ref clock on every modeset.
>>
>> I also found that the rounding mode of the porches and active area has
>> an effect on the working modes. If the driver rounds up instead of
>> rounding down and be calculates them in Hz instead of kHz, more modes
>> start to work.
>>
>> The following table shows the modes that were working in my test without
>> this patch set and the modes that are working now:
>>
>> |            Mode | Before | Now |
>> | 1920x1080-60.00 | X      | X   |
>> | 1920x1080-59.94 |        | X   |
>> | 1920x1080-50.00 |        | X   |
>> | 1920x1080-30.00 |        | X   |
>> | 1920x1080-29.97 |        | X   |
>> | 1920x1080-25.00 |        | X   |
>> | 1920x1080-24.00 |        |     |
>> | 1920x1080-23.98 |        |     |
>> | 1680x1050-59.88 |        | X   |
>> | 1280x1024-75.03 | X      | X   |
>> | 1280x1024-60.02 | X      | X   |
>> |  1200x960-59.99 |        | X   |
>> |  1152x864-75.00 | X      | X   |
>> |  1280x720-60.00 |        |     |
>> |  1280x720-59.94 |        |     |
>> |  1280x720-50.00 |        | X   |
>> |  1024x768-75.03 |        | X   |
>> |  1024x768-60.00 |        | X   |
>> |   800x600-75.00 | X      | X   |
>> |   800x600-60.32 | X      | X   |
>> |   720x576-50.00 | X      | X   |
>> |   720x480-60.00 |        |     |
>> |   720x480-59.94 | X      |     |
>> |   640x480-75.00 | X      | X   |
>> |   640x480-60.00 |        | X   |
>> |   640x480-59.94 |        | X   |
>> |   720x400-70.08 |        |     |
>>
>> Interestingly, the 720x480-59.94 mode stopped working. However, I am
>> able to bring up the 720x480 modes by manually hacking the active area
>> (hsa) to 40 and carefully adjusting the clocks, but something still
>> seems to be off.
>>
>> Unfortunately, a few more modes are still not working at all. The NXP
>> downstream kernel has some quirks to handle some of the modes especially
>> wrt. to the porches, but I cannot figure out, what the driver should
>> actually do in these cases. Maybe there is still an error in the
>> calculation of the porches and someone at NXP can chime in.
> 
> Thanks for working on this! We tested these patches with our Kontron BL
> i.MX8MM board and a "10.1inch HDMI LCD (E)" display from Waveshare  [1].
> 
> Without this series we don't get an image with the default mode of the
> display (1024x600). With this series applied, it's now working.

Minor correction: The display does work, but there is some flickering
and occasional black screens if you let it run for some time. So there
is still some sync issue.

Anyway it's better than not working at all.

> 
> For the whole series:
> 
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL
> i.MX8MM + Waveshare 10.1inch HDMI LCD (E)
> 
> Thanks
> Frieder
> 
> [1] https://www.waveshare.com/10.1inch-hdmi-lcd-e.htm
