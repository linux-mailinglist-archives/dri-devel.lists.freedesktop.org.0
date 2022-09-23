Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E22875E7E41
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 17:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C2188284;
	Fri, 23 Sep 2022 15:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F276410E366
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 15:23:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQstN6E8zxHxucgMe5afQ4VbQTXWVhVQmGWmqkLpw3i0HZXN80MUzelcKEBYbj5kW13QFnFdymH84lJagfO1ZSsfNr/m8kLRS2duHzsQcIAQl6K59LwnIDj1EqoxTPC0ceFLPzid8XXsV97NXcCK4v6u5iZV5jxAXlH0Wq3/SBW/orr0QQTFnk6NyC+mZMRHOXRVeySfHXKMc6kmsAmayh9TAwFJSly2DKjJ+UyyueHotydQqj30FfhLuUOaAB7oA//Y6FZK5B7aAekYf4JObNdIiBi+FL+zCsLhNu2MoGf+R9nN8nsoUzqnZgJFflROTP1ChXth2i6UXnrehItZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/TCBG4N38Rb0Ozumg6sNQl64nZbZvAf6sNDfqrtcSo=;
 b=oCtIcqa2jufRKM7esdLgS1AaVbPYHKD5KzIA0U+xmWGb+jvRsLbnBvyfoJ+wm15KZkENCf5TIGE1sgyQlvx0WV9CkJI2CvOkU3FaFyYCY6942gV/iOI3A1426f1uP6PPYt7moy9a3URBYO6mYzTn2ZEDdwjGeCudt+jTSybjOhKB/C0/4YBPA4hb4t8q2+04Omy0bcmRp5TneHEwFgUGZfwH36kAOQYUokcHcSFxXCMX/ure6IceTNcUPrwHUbcpAoWDl0PHybjGZs97uOCzULpbAmPUcX4Jh58GRapN+J4oeNFoJqjBivoDRibY4Wek0qpNRcQIgUmvtMqv/4oTAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/TCBG4N38Rb0Ozumg6sNQl64nZbZvAf6sNDfqrtcSo=;
 b=HPseY/6CGM7HvbwyE0rEAAknrFausEWPImtC/0fi3qNo3gOQBR7pNGxvsebUDWthaIY1gG2t3qD9f3gTPWZzZsuyIsHYwmGPeLoj+pik74Idbgs+ye59qxFjf5xqZnE3aiT6ORgpx3DvI8Q2z0rsHehrE8ga4I4TX2n6bo9Hsg8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM7PR04MB6949.eurprd04.prod.outlook.com (2603:10a6:20b:102::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Fri, 23 Sep
 2022 15:22:58 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::80cb:1937:26ca:fc94]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::80cb:1937:26ca:fc94%9]) with mapi id 15.20.5654.017; Fri, 23 Sep 2022
 15:22:58 +0000
Message-ID: <75366bfac9fcd4f8c35309193705f0277a164ae4.camel@nxp.com>
Subject: Re: [PATCH v2] PM: runtime: Return properly from rpm_resume() if
 dev->power.needs_force_resume flag is set
From: Liu Ying <victor.liu@nxp.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 23 Sep 2022 23:22:35 +0800
In-Reply-To: <CAPDyKFqdHX=o4V4K8GdCr4wQ5sjr=JMG6CFAy1849=CtfoSgRQ@mail.gmail.com>
References: <20220923124904.1373936-1-victor.liu@nxp.com>
 <CAPDyKFqdHX=o4V4K8GdCr4wQ5sjr=JMG6CFAy1849=CtfoSgRQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM7PR04MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: dca0996c-8475-4802-8d71-08da9d777ef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bSwjgBDNi6NllF1akVh4zeFIo5a9x7BuWLOXCuNsegBSnxqK3N4I20dmPejueK+PMnzoel+D1uV/DH+nX3y3cjH9T7LcWhSm5yErR6gxrmspqUaPHxjuDMH4Um2+DGVnix701k1X58O201+h+6wuvWydQ4jLKYKQbg+LPWvLJ+FlK8gzdeoJErqvyhdfqX1h+JRCLqiNuXwFASVEDZvI5kfG0s1PAl50z8GSSZsNGDzpioneY8kZ3kPOiMvTwrOiyodfj63P+64EGI5MHNuQ7APyOYy7Y344VG0zdFhpQ/k4facz8qD0pAZyIGgsAnpc1no3Hm98FFRWsUtEfOVANp6ThCMa/cH9QxT5VG3Yl/7NpXkHA4rBDs5NhZ8xtIur9jnTw03NUqXBBlF0CbwhknYOJGm3uOdna/pklgq5Mf5WjC2xzuVnpMqTn33/hxXWZg62FR2jQiEF427ZkIhtB8HuUCLn1bFnKW/ak84J2Sgic5jRZXQEpAahx9lzbT9+d1tY9Ig9mC0dYvVtuUtdKpTR6ifxJPUewaDvyhSo7jvvcP3yBQBp2a8DOHSPxZYR9xN5i2aWzwjcAoY2nBMbumTY/jGgGAX5164q//72xrrAwSA5jBSw5hFNu8Y/3DvGHFgGmXmNt7tgkVinD4T8AIBPdkWrB32sxqs0w+psJVck6KxX3DhCRA9KeMV42RkmVqmgV2rbsmw2yIDRx9BXoaB2YDrcXQ1n3vZ8pYl+DrPGnVO36mMP6RilU4qs2Xonu+LCPJAo6UdDnyyCdl1LGPK0oyePp28wW33yr90fUE8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199015)(38350700002)(38100700002)(86362001)(36756003)(6512007)(83380400001)(52116002)(6506007)(6486002)(2906002)(478600001)(2616005)(186003)(6666004)(66476007)(5660300002)(54906003)(66946007)(6916009)(316002)(66556008)(8676002)(26005)(8936002)(41300700001)(4326008)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE5rM2VLNFlLQUVBd1JFUkswa2xNd25vNGRwajJSelR2dTA5NHVDcVdWRnlR?=
 =?utf-8?B?VXJ4a0R5Uyt4SndsbGMzQXdFMVd0T0Z1OHFUaGR2RHY1UzMxNlB2WkxKUnF0?=
 =?utf-8?B?L0RWU3BldmtveVhOSDhMWURlVjkxVXVJbi9tNjZ0UXYzeGM1ZmN3VUFVbVYr?=
 =?utf-8?B?V3MyazhnMXpjRTFFSWFSY3h1N051Zis3dnZ3Vmp5VTFTYTh2aDhkYkJZaU54?=
 =?utf-8?B?NFc0QmZsM21CdTJKTThuZkFRQTBPVWw4SGw5U1A5d0JBcnhCbzdETnhHTVFE?=
 =?utf-8?B?U1N6MU82YlRKRHhLZEU4MVBtbmg3eG1ZZDVZRlNnV0xlVXBUTmhkeDNRVnZB?=
 =?utf-8?B?anllOEJnY2lqeU9DOGd2WDMwajFRSThHaCtYTXpnT3IwemJKdTd4UjJPMmkv?=
 =?utf-8?B?N0N4N2QwT1IzcGFNZUJyMFNKSk5RVU9sWWZPd3YyRVg4YzJzb2VYd3kzNjFt?=
 =?utf-8?B?Z2NSaE9DR0RrRlAxTS8vR3owbUlvQS9jc1d4N3ZaNExtZjdJaE5MZUhNMFAv?=
 =?utf-8?B?T0Y3NkdpdDdDYjhUL0tLbTVyNHMwR3lhKzBGak4vTmtQRTVHRTZZNlNIRXFI?=
 =?utf-8?B?cS9sbmdaUTY0cVN0TjJGbHp4T1dzVzdhVWplSGdFY2FIVmR2eW0wc1dyUVZQ?=
 =?utf-8?B?M0NwdFp1NlNkdG1XdlJhUm9PR0kzWms2RDZJNkd1MmkwV1JxK2FsWnNHaEli?=
 =?utf-8?B?Sit1amw3am9FRFpTVDc4MFd5WFBaZ25LRnFSZmZ4V0RTRE5ZV3Y0VzlUdDZH?=
 =?utf-8?B?NEJJZmJsSk1YS1ZITFVoK25ycWVwOElzM0x6MGh4OUFKU3o0c0tsSXgzcUla?=
 =?utf-8?B?V3hkSkl6R0lsamFabW5EemRselNNZ3lBeXRDQmE0dWlQd3NuWGxNZGtuSnpi?=
 =?utf-8?B?ZGFmUVNqU1poNEZFbDRLRWJySUo3R3UyWkJOWGhMS2E0eWt2Ri9CdFAyVmsy?=
 =?utf-8?B?cFFXMFZjS1Q1ZUhOdytDaDNoNE43YXdkRnBVVjkwU3RmdUN6SGJNV3RXZGU4?=
 =?utf-8?B?RXhySU8yM056a3R1MnJaTlBmcmhORG5WOUJuQ3FGVXVsa0Zic080eG9Kekl0?=
 =?utf-8?B?bVhoZC9JN21OdDVEK1lWVEZRemJOWnQzU0Jtc3pQMnhTVThrMHFDSXlLTzM4?=
 =?utf-8?B?Vy9pSHNHYVZ1TmozMXBob0huc1J3WUMrNTNuN3dxM2YvVG9RMitJcGF4QWs0?=
 =?utf-8?B?TzhXQzdlOEFpUmNUdUIwNG8wYktVeDFaYTJRcENNWEtFRC91OHdoU0ZkNVhw?=
 =?utf-8?B?UWg3SlRJRTd4Q0xJZEpOOE1YTHBJcVFYem5RdERNS2RkYWFRWS9KQlUraE1I?=
 =?utf-8?B?UEVNakZ2eWExeFVkOHNVeEpPMXQ2QUJqcFRWWmF4amxnUWh1VnVWcVJVaW5W?=
 =?utf-8?B?VmRxMjhEdG5jUmRGOE0rdnBrNzY2Z1Vudk8wdFhVdVl2eXVHbnhmS2lONmhK?=
 =?utf-8?B?VjE2aTc2dzdXN1BUQVB3QkVnbVdHb2g5bEZLaEg3bDZLbmpaSFFCRjBhSzJT?=
 =?utf-8?B?aGxaWWh0ZDVsQzE0am5DWSt5ckNmMmRVdm44bFEydDRxaW5DOHBHN3VkM09R?=
 =?utf-8?B?SU1ZNXFhczYzZmdOaEEyUUs3SmxreUlGRERYNm5XMS96S2pKZ0UxUW5adDhr?=
 =?utf-8?B?UE9aaWpvQ2JLdlVXS25TU3BPaHUyZXZzblpwbnlsTmV2ZnB3KzVjTGtWTUhQ?=
 =?utf-8?B?L3R3M1Z5YVVsanRSWENTSngyUlVQQmFjVE1xMFg0WU9hWVlKOUM5eW8zdnF3?=
 =?utf-8?B?U3pDdmREMy9GUkJPenU5MEM2YzhXOHdOOURMK3JLMTl3MlhqM3BCVWplMUF4?=
 =?utf-8?B?aS9ya3Y2M0RVV29QK1UzS05ibWMvRmJ1TU9UQmJvT0JONXM5S1lPQ2Y1a1p5?=
 =?utf-8?B?WmRBMkFFd3F5VzdjamsrbWg1R1Z0S1p0M3R4TkVGQjdlVElSTDJFdmJCZCsz?=
 =?utf-8?B?NnJNS2cvcWE4bGxuemJmMUY0L3NMeVBRN3VoYzZERDBUWEdpMmY5RWJLZFVr?=
 =?utf-8?B?bjYyTzVobWhiOU0zSTBMNjE1M3lUSDBPQWxuWm5TSmZ4N2RyRCtmdVVYNUtx?=
 =?utf-8?B?UFFTUnZJV3lSdlIzV3IzU2VmYkp1WVh5cUdKUElnTU5zTTNyMTVVN2R1Wkkx?=
 =?utf-8?Q?omuf7jio8XX12eB4kr/hJD0wb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca0996c-8475-4802-8d71-08da9d777ef5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 15:22:58.4755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJ8f2rVp3TwbiqnZBf7Hudr4s4BgCwVpxAx3PST2CZrHuZ4Bd4szU2csegAH1M292oIBB221nim3O8aZvmGr4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949
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
Cc: Len Brown <len.brown@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com, Pavel Machek <pavel@ucw.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-09-23 at 15:48 +0200, Ulf Hansson wrote:
> On Fri, 23 Sept 2022 at 14:47, Liu Ying <victor.liu@nxp.com> wrote:
> > 
> > After a device transitions to sleep state through it's system
> > suspend
> > callback pm_runtime_force_suspend(), the device's driver may still
> > try
> > to do runtime PM for the device(runtime suspend first and then
> > runtime
> > resume) although runtime PM is disabled by that callback.  The
> > runtime
> > PM operations would not touch the device effectively and the device
> > is
> > assumed to be resumed through it's system resume callback
> > pm_runtime_force_resume().
> 
> This sounds like a fragile use case to me. In principle you want to
> allow the device to be runtime resumed/suspended, after the device
> has
> already been put into a low power state through the regular system
> suspend callback. Normally it seems better to prevent this from
> happening, completely.

Not sure if we really may prevent this from happening completely.

> 
> That said, in this case, I wonder if a better option would be to
> point
> ->suspend_late() to pm_runtime_force_suspend() and ->resume_early()
> to
> pm_runtime_force_resume(), rather than using the regular
> ->suspend|resume() callbacks. This should avoid the problem, I think,
> no?

I thought about this and it actually works for my particular
panel-simple case.  What worries me is that the device(DRM device in my
case) which triggers the runtime PM operations may also use            
->suspend_late/resume_early() callbacks for whatever reasons, hence no
fixed order to suspend/resume the two devices(like panel device and DRM
device).

Also, not sure if there is any sequence issue by using the            
->suspend_late/resume_early() callbacks in the panel-simple driver,
since it's written for quite a few display panels which may work with
various DRM devices - don't want to break any of them.

Regards,
Liu Ying

> 
> Note that, the PM core also disables runtime PM for the device in
> __device_suspend_late(). For good reasons.
> 
> [...]
> 
> Kind regards
> Uffe

