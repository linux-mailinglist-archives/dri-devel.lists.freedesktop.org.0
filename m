Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E73179194C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 16:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B99C10E305;
	Mon,  4 Sep 2023 14:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2132.outbound.protection.outlook.com [40.107.104.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A70610E305
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 14:02:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYJWddwTvaouUPPTHI6QIXLaUzFglNlVLBEXscqf3aR2JpLJOG/qcxnRaPcEwAe72bAWfrEk3pkw2TbpAnEXehrIcqJjYv6j0jBsRsw9My6+NgnErHTnfG3Lop8KaHK3n5Zxrws419z5cSQhMVE8eg1pjnQ7kFRd9dhRQ8IbSUL0Fnp8JyDAXrSW9PkJwHn4hg9txhYEKPv2HKA4fxCEerYrFmxl8Z/t3UC3+xo8yTflPFRJASek6jiOkwODqcF/lCFudqwIk9u7u/GSwCx6YoLcGhnbtFE8GbUjtZAtgsZ1WXu1ejsDFd+d6ivv4Rz99fHSd5VUI3SWF9e/YbjC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6J1ZNsiotQITDS2DTyiAGJM59wOdgMmQZ+VcP1u5vRA=;
 b=fGaDed140G0+jImhRo/VNl6X3uz1nDdGATbOlOq8zfVR39J2rtkb+banGD09ZaeBZcBKcqoA4AEUYsrqZy1CGw3LflpbS1r6l5aSGnPcSz0GWyu8YkEOK3lGfoq8a2m/zh1Ovy+eBRazBecd+MZ2fe8k0dmUxFEN/Hw2hOd4Jwsvs2YiHJueAVN32FC6ZJXDLXPWh15PSPRP9tqzQ8EOKQEU1T2jmPNMpqDcx7kMpvDrZFvpoqZ5qycLi2fOGxTaNbQe31LQpYtjgRaqPOFOb3ajwWqHVEWyfhWcx+TNAL8M6vX7ZQj8I4CDNMBGwORWLQLiyLd3wyIpq9r/J5FExw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6J1ZNsiotQITDS2DTyiAGJM59wOdgMmQZ+VcP1u5vRA=;
 b=NfdDLh0QpurTj3dhJNF0IFJqsRmS+n92CRRnp8Pshq4jYWXioDtrP37UtQhBvp05lzDX3hhfKB2aCsNKCP2LMru2Far3byL2Qzx1PGJUtRjRItlRF23yBFf/Cm6YLSYGLuvXH93FhLI7acacdNu9gYxSULHPic02TOjyqboNR2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by GV1PR10MB6100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:9b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 14:02:31 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a2e0:c6c9:97e1:3ae3]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a2e0:c6c9:97e1:3ae3%7]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 14:02:31 +0000
Message-ID: <a95481b7-e38c-4b7c-be49-4c74e07d3523@kontron.de>
Date: Mon, 4 Sep 2023 16:02:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm/bridge: samsung-dsim: fix various modes with
 ADV7535 bridge
Content-Language: en-US, de-DE
To: Michael Tretter <m.tretter@pengutronix.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0037.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::6) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|GV1PR10MB6100:EE_
X-MS-Office365-Filtering-Correlation-Id: e883baca-b946-4fed-a48a-08dbad4f9484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mLsysymMtJb9xCSvJAKZSp0PZ5oKkzlwJovCRmM30FgDqFfCxsS3P+ZVNngfjAZ1SWB6Mk3wo8/at0so6a5CM9467ZORRBILsJT2WNcbK5sJczA7q3sKVF1FDYxBhKVHtEPrbMuE8USoqXFqLkjQ6kt3RVDU70FPkfOLTbpJpLMWV/rqw3YpVbLijVLyIJZtvSnLO6OeXFrTyzYKBKFJ5neI61lT5b5rVBq8ahN9kHcj3H020o15wYMk3NX+00wfpRJV03DR1Un0TQZOFRJKBo/HgSL2VZ4VuknR/HVHX1Rhr+/Jomit7evi/llkO9Qi9rr105pei2qYFBfHk40ixRFZT6P/twQKTLkyI1IOCm/Y+1Sb4lM5LGyASKg/+28w/a/qu9iWzGbi0RXWYKzOU+KMKr5/6NB2dLFkU9y1IDMXv/g4lQE7c9lGVK+BItUT3M5Y5MNX7PHeRcjxDqxH9F9nQzbEbBGWBkXmJjrquJYdU8BlfZ+N6kPRWxEPmSSRHQMkSI1EAUfYiP/EedwaGy59phPSb5pgaygoD5P805pUgiaq8EZ9R8KVuusuwfg1J4RBAn73eh7ajlu4xQBi6rCnqUKf6dWvqbAorzVW23+A2+0tzQFXN63uWpY9IMfveyohZ3lulkUPt09IJXiAUexlBcHrRYABxThKC2nCZDo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199024)(186009)(1800799009)(31686004)(86362001)(66476007)(66556008)(66946007)(316002)(110136005)(2906002)(36756003)(31696002)(8936002)(5660300002)(44832011)(4326008)(8676002)(41300700001)(6512007)(2616005)(38100700002)(83380400001)(26005)(7416002)(966005)(478600001)(921005)(6486002)(6506007)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHVxZUJwblNhYytOYm50UTRtbGxoM0hvRVpQclRKQlhqMFc5N3p0eUh5ck94?=
 =?utf-8?B?SWxoL1lvVEduUzhGcTVzTHM4VHoySTZGSy9mRFpUN1Erak41WldpUmZBWU92?=
 =?utf-8?B?NGNNUDFWNHM1OUUxcjVBcHVXU2RsWmF6ZVRDWTB3U1QxMFRFdTVQcE5rdEFx?=
 =?utf-8?B?T3VtdDNaR2ZmU0Q3MmxJTzRLTUQ4M0JjZm9DdjRzc2Q2eExzU2Q2N1VHVHJR?=
 =?utf-8?B?UUdKVWducEpSUEJTYzIrbElQVUFzLzBUWXdIaFNWdkdrZnQxb3FTdFJLYWw3?=
 =?utf-8?B?SldLSDEzSDhxcjBjSVVWVTZrWEtGajRLRWpNTmxmTXpUSnVQdU5xajJRMnZu?=
 =?utf-8?B?VmtCN2VGTnpjRXBlSU9lRnh4MlB0dTJxTUpyR2N0aWdQWUMyZXdXNEhzWDd6?=
 =?utf-8?B?UU5Rd3Z2ZjdNMTZFWGR4dWRQTzB1SDAxMmNxYVNlM3YrZC9qeUhLcDE3SS9H?=
 =?utf-8?B?VXFxdXZsR2FrTnNHWDNKQzNIVkdjMHh1QndxOW1Objc4akFPTWdNVEkvMVhn?=
 =?utf-8?B?UW5qdlBzSTlPU1RITUJ3dm9mUnNPTHV2M2FvSWIwVXlTWDV2NEhRZS9yTWlO?=
 =?utf-8?B?Q2Z2OTdCM2Vac2czR3VOeHp6TUpZUkg1VzVNY1RGQVpvYnJ0elNaY2o3eDBP?=
 =?utf-8?B?K1Q4YXVmWHFJVS9UMFZ3alJiV3lRL21xZVMrUFQ2WXp3ZVZ1RW5TcU96YVR4?=
 =?utf-8?B?WVdCaXRkeFUrRUlTQVZDQlUzc3RHRW4xMWZrdTlTdU5sajZpNmZvZjdUOHV2?=
 =?utf-8?B?ZmV2TTZRb0FOVVd5YlQ5cUhqNDBhYXBuR09sWWprWkFEMGZEeDUwOWlYbzBx?=
 =?utf-8?B?RHZ0blNGRVBVcTNNQW5halJjSnJlRDA1Wm1NUkxhaGtXYlJYUEdKWE51WUVE?=
 =?utf-8?B?eWJtSk43Sm9naDM4cnFKWnVRTVlxR2UrMktnRFN3YlFSSEdhQ3AvSExMZXpJ?=
 =?utf-8?B?Q2N5STlNTTFsTjFsRzd4Tnc3eEI1TzJrM09oN2RyS2NHNnhkM05Gb1owSEc5?=
 =?utf-8?B?d1VjV01vS1JBclpvODNFcG1xWERRN3FpZngvcXFUV3IwWnRUSy93NUd2bWhY?=
 =?utf-8?B?VTR3YUo0N21kdE9BZkRHaFQrYmhKMGwxcWJ0Z0p1czZGWXVvMzNmbHRSWGFs?=
 =?utf-8?B?Z1pta29kcTVwcTltYTNTZmxvK0NQa2UrcVZqSFdwdy8raGxIOFVMZkVhWGlt?=
 =?utf-8?B?K21LWi96Z2hxVC8zRU5yZm96Z2VvVVZkSUZWZjhWNkpUQUNUcUZaN2dHSGN6?=
 =?utf-8?B?UG1UVEZ6R1VkRm5wL2swckJzaTFkZmFHbEdFd0c5YVVkZWt6QU9yQ3dvMkVQ?=
 =?utf-8?B?TnNXWm8xRDlWbVJ1bU1TbDBFa2JUZisrS3lWMS9FRTZsUTBtbm1ORldqSmVs?=
 =?utf-8?B?amgyeG4zcC9RVncvYjJFVE9KUG1zUlFlblF5eDV0Qno2Zjd5ZTdITXRLSTgw?=
 =?utf-8?B?R0FaekhGYmdPS1lCZS9xbkJMZm1CYWp6V1hxbFVHMDZOem5IblVzLzVMazZN?=
 =?utf-8?B?NXI5ZFZCN2ZBa3lNWVB6dzEwSDlpS2lKQSs3M1cvWDcrSENGajBjRVZWSVor?=
 =?utf-8?B?NkliK2wzaDIrUG8wWGNIdVVOcVAvZkczUWpESStiR3B1VmEzaHdRa1FvaGpi?=
 =?utf-8?B?Q2VydFptNzVPc09vVnJ0MG9WR2tOQ2orMy9lRW5zMENJN3RkS2hOcCtMVkpv?=
 =?utf-8?B?MjZFajBJQjd4eUEyL1VFUDVyUm5Sa2VmK3YybWNIK1R3TjAvdzA4ZEFIdjZn?=
 =?utf-8?B?VE1ObnA4eERFcWRCdEZEdTRFTUxyUE5CajYrcmhWREpMcW82eW1ZNFovTmVZ?=
 =?utf-8?B?eDhsV1FMSmhKSjdMK0lpUGlFNklmYndkOTNMZkZJZ1JiaUlpUUVhWnFkY3hw?=
 =?utf-8?B?U24wYnp6bERXR3RoNEpBU3FJbWJCUHlhaVNGVHlFZXVYYkVpVCtsWWUwMU9N?=
 =?utf-8?B?QWZOMzdjaTMzeG9oTXBsa2F3UGpqT0hWejAzZlpVK2YyU2dabUVPUU9YbVhz?=
 =?utf-8?B?bFZ6c0tHMzF2dUl2Nm9ERkNiTkYwNnhjQ00wdWw1cFg2dmo1Z01WYy9LWTNE?=
 =?utf-8?B?VTNzalJ6YTM3WWJpcm9kNkFWRDNpcjhyem5CVzRZOUNNZFpXRlppOXltNGlW?=
 =?utf-8?B?TTJDSW5pbGFHSHlHOFhKN1pYYXBCRWwvN0wzODNLcEJ1NUZJN1V0RCtOV094?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e883baca-b946-4fed-a48a-08dbad4f9484
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 14:02:31.1087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlAPKam2MeZbXoK6LRx9+NYwnGjwU3oMDNTocAu/UaAixAlyPgEGa6CBq0yC0hsA5iKqwNmW8SBWl3s6VKwd8mJZeTd0cl8Npdoq6ojcCFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6100
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

Hi Michael,

On 28.08.23 17:59, Michael Tretter wrote:
> I tested the i.MX8M Nano EVK with the NXP supplied MIPI-DSI adapter,
> which uses an ADV7535 MIPI-DSI to HDMI converter. I found that a few
> modes were working, but in many modes my monitor stayed dark.
> 
> This series fixes the Samsung DSIM bridge driver to bring up a few more
> modes:
> 
> The driver read the rate of the PLL ref clock only during probe.
> However, if the clock is re-parented to the VIDEO_PLL, changes to the
> pixel clock have an effect on the PLL ref clock. Therefore, the driver
> must read and potentially update the PLL ref clock on every modeset.
> 
> I also found that the rounding mode of the porches and active area has
> an effect on the working modes. If the driver rounds up instead of
> rounding down and be calculates them in Hz instead of kHz, more modes
> start to work.
> 
> The following table shows the modes that were working in my test without
> this patch set and the modes that are working now:
> 
> |            Mode | Before | Now |
> | 1920x1080-60.00 | X      | X   |
> | 1920x1080-59.94 |        | X   |
> | 1920x1080-50.00 |        | X   |
> | 1920x1080-30.00 |        | X   |
> | 1920x1080-29.97 |        | X   |
> | 1920x1080-25.00 |        | X   |
> | 1920x1080-24.00 |        |     |
> | 1920x1080-23.98 |        |     |
> | 1680x1050-59.88 |        | X   |
> | 1280x1024-75.03 | X      | X   |
> | 1280x1024-60.02 | X      | X   |
> |  1200x960-59.99 |        | X   |
> |  1152x864-75.00 | X      | X   |
> |  1280x720-60.00 |        |     |
> |  1280x720-59.94 |        |     |
> |  1280x720-50.00 |        | X   |
> |  1024x768-75.03 |        | X   |
> |  1024x768-60.00 |        | X   |
> |   800x600-75.00 | X      | X   |
> |   800x600-60.32 | X      | X   |
> |   720x576-50.00 | X      | X   |
> |   720x480-60.00 |        |     |
> |   720x480-59.94 | X      |     |
> |   640x480-75.00 | X      | X   |
> |   640x480-60.00 |        | X   |
> |   640x480-59.94 |        | X   |
> |   720x400-70.08 |        |     |
> 
> Interestingly, the 720x480-59.94 mode stopped working. However, I am
> able to bring up the 720x480 modes by manually hacking the active area
> (hsa) to 40 and carefully adjusting the clocks, but something still
> seems to be off.
> 
> Unfortunately, a few more modes are still not working at all. The NXP
> downstream kernel has some quirks to handle some of the modes especially
> wrt. to the porches, but I cannot figure out, what the driver should
> actually do in these cases. Maybe there is still an error in the
> calculation of the porches and someone at NXP can chime in.

Thanks for working on this! We tested these patches with our Kontron BL
i.MX8MM board and a "10.1inch HDMI LCD (E)" display from Waveshare  [1].

Without this series we don't get an image with the default mode of the
display (1024x600). With this series applied, it's now working.

For the whole series:

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL
i.MX8MM + Waveshare 10.1inch HDMI LCD (E)

Thanks
Frieder

[1] https://www.waveshare.com/10.1inch-hdmi-lcd-e.htm
