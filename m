Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F767EB215
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 15:29:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB53610E214;
	Tue, 14 Nov 2023 14:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2115.outbound.protection.outlook.com [40.107.21.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B88910E214
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 14:29:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aauCOwO6E7rNouHAVDq4t+hviQYCY13bGw+Dvsefhplchz2GrW6xcsbqxHXpHsYhX0xm/2XFWtAjCFWvyUF7OKM8Fj9rac5eOiXqW7qeejjnjnIKUmAOYlDTbqpw71B0dRtf5R/C9JSBcc/QctQkuplmmyDPh3a4rGZLUKUxNo5oBYdSHMfc/h8cfzaMSflg29PyWQ18QC5p02bRqO9jiO43deg4tC5uhNFGLGhQpCBkkaPDWdM1Hmrkcmm+wjPZq4nO5gMalmpp0i0eoMRikl5sfRkHrw2Vus5vBkFmEZUlENNJjIQ4d/JQI26OKMtVKAjmFapDTG+2RgUO/Rc5nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkLasijjWyEIpmxEP7fIUf8RVPE8JtC3j+UmKCcQDkk=;
 b=VPToyIpDb+H8vDZNaB1SGdpleb+sbtcBqv/O8EGHhNdGfFaSv0dYRR7p2zMcWR9XvJXN3GcAOXFE4dvyX7fBhE+/Ga+1P4yugRf4TMqHEisjtkPPTp74KkbV9Bj8L4pBGZD+YzyssEy14Rl4sNVuEEJEDN9LlBizc6+XvSDij/Vjl2uEEM+/jv0xPcsOZ+2j2g04jS0lLhTSVGmCMW6Px6CM8mcgrqLITPscR89m44yc1Vz/SdPGqOpTlrdn3hKUYUFTvmq9CCC2S/bTSmdXm539NemER+qxg5s5qwmeVFfaDK7HMOLe+hQLpc4rkRqCTsgUfalR99axqVUzmHPFmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkLasijjWyEIpmxEP7fIUf8RVPE8JtC3j+UmKCcQDkk=;
 b=e4pvsofrfAD32JMXYT3ZWRxeO4gCO6ZnBtRZnJFssenfEhrvlqM47ZVdWsclmfN+oLn86ifIhyUvn+natZ+ZYBxZbjDkWpQOLwnBEMD1OzspheID0fUvlIC/7Gwvfhpu9MecSGU4YIt9bDPEg1q1cw2CFoqKzSczkPoPgOVR0QI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DB9PR10MB6356.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3c4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Tue, 14 Nov
 2023 14:29:37 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::27ba:9922:8d12:7b3d]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::27ba:9922:8d12:7b3d%5]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 14:29:36 +0000
Message-ID: <11fe6f0e-49e7-44d4-a31a-3b739f77489f@kontron.de>
Date: Tue, 14 Nov 2023 15:29:33 +0100
User-Agent: Mozilla Thunderbird
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
To: Michael Walle <mwalle@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Tim Harvey <tharvey@gateworks.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20231113164344.1612602-1-mwalle@kernel.org>
Content-Language: en-US, de-DE
In-Reply-To: <20231113164344.1612602-1-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0146.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::15) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DB9PR10MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: a2ab9457-9c66-4031-7ddb-08dbe51e20dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FpwbgEI04B3hmlKJtn3ac0A5uwuCGU6QYGHdjzObl67hqnHi1vA4VqfEp81TaLLsjFYT+WxDa9YUuW2w7VFNAWdPhMmt1oE71chr2BonzEiCVEtyqi+VzWrN80knSg8dVOM6yTlx7RybEHut0oavo++/jXWhCG3Pe3JdRZ3oWwmW4k+UphMtMjuanhPb00ImPrJjVwPu9dnp8uwd7wyoXI1WPhDqQHyMIg9vqGS5JvVr61SzkEFeXZAf1ZGb5sL0IdCZ9SIueYe56TUqc/dtoT4HCYc/JWjCZtZDAe8UKzqZGcUcK2ucE9lHjD2w/zkHP/CsT5S7XlbyOtz9sxjMuakKHpWiLyAhVZ9CxoKt+thfni+cLqO4SznkgdTzd2NVTFRYUR8hrOkgRHFCOA0ckHKT2Fz0h/aJRxdXHxy1mlTYX4TI0qvoxzp+YEbSSdchVKUx+QyXBaWhEfPz5TU0bpEsoXut1mdPNcQvrUxvRxCLB3XhPq6UjFi8aG4LXu15gNNJsLJvc4/JalZJheQoaJnhtb12TlLKxO+d/J3EghnxDydmNGWxovcvJkuCh6fBlh+9OB69JEsryq4IP6LPDkQvzUVvE8LDpUsSCwTn4KttLnI3qSM4SWdyCUUPnj/ArBFD2xDZM4S+6s8tqiclIaDjWg6VEzZjRki57dQa8LE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(396003)(366004)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(53546011)(44832011)(26005)(6486002)(478600001)(8676002)(6506007)(6666004)(4326008)(8936002)(2616005)(7416002)(6512007)(316002)(66476007)(31686004)(110136005)(66556008)(66946007)(5660300002)(2906002)(41300700001)(83380400001)(36756003)(31696002)(86362001)(38100700002)(921008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2tsSUxhVDZ2Y0lKWU1DR3N5b0VzWm5uNjZ4SWhWbmlVcllUMVcvOE1yeGY4?=
 =?utf-8?B?WU1vSEVsMVZUdkJPWjF5TDY1azhhSFFnZGFiNElsRlV5OWI4R3dJZFY2eDNa?=
 =?utf-8?B?Nm0vK3VYUmtIbjI2ejVKVUJVVENJTVIrM1BjRS9tbm9VNE1xMW5YWFVkeU5P?=
 =?utf-8?B?dm9JakoreFpPNEpiaUt1TGRkWUYvdHBkdm5JTWRheDN0SUVuajRwVzhvR3hM?=
 =?utf-8?B?T0FLQkI3TUxnb0JaL01XVkJ0cW1ZcmpUQW9ZekphRmhUaDBUU0hYOGNpYTUv?=
 =?utf-8?B?WTZQckJkSDdSMXg5ak1IODRYVlA5b012UmpSb2RNK2JWNGNzTEFDR0g3aDQ0?=
 =?utf-8?B?bk5pRkU5Vzd3OTdGT2ZXVHZZSVN1REZCMDMyaVZuUmdpMVM1RVc4NDVkMWt2?=
 =?utf-8?B?amZnRFBvcS9qa0dkUE8vbnBTSmxBOGJrUDMzd0FOUjFMbUtTVWN5b0l4MnBF?=
 =?utf-8?B?VTlQOGpndzJUcHpJc2ZyUHVvNXU3TW44V1RiMy9ZdUlHWUVpYU0rZi80NFJE?=
 =?utf-8?B?ZHRUdnJERXBVcWtvK2NoR091TDR2ZGVMTGpteWRhYWZWWHpmMnNsdVVQU3BL?=
 =?utf-8?B?c3VFbWJ0UnNmS2w0aVdWVE00SzZsNzdDSnRWQk5TbG5ZcE9JWmdjNm5XQndv?=
 =?utf-8?B?U3NqeHdCakp3V3htSlR1emtJRXNFTGkxZDdxWjRWVEhTT1lpZElPTmdxRG9p?=
 =?utf-8?B?eXFMNlloMTlPMk5GUnRuaExhUDQ1Q1hGTi94ajgvdXppWHdCaTF2MUJGNmZO?=
 =?utf-8?B?YmNEVStnTVYwSnprZnVSSWhyMmRKNEQ4VTdiQThiWkw1OW53ZjVFL2puWUZq?=
 =?utf-8?B?b3pDMytIcFJybCtnYmFSWDlUVVV5ZHRIRDNMQmlyai9NZEVzZndyVmFOSDBu?=
 =?utf-8?B?SUlpQkg2UW9mdU5lMUxHa3VmNzJlTmpBRTFjWUFyL0pJZEF3eGNIdjBLRWJq?=
 =?utf-8?B?bWwxbzM1bWNxRTBaL1FENnVaSDVQYjRjV3U0cTRpbE13S3RFZlVkc0Y4aDAv?=
 =?utf-8?B?Mk42Y3FaZ241SWZXMTdjemcvTFJiVGZsZ1VWeHhTdm43L00xV0ZTWmVUUWxt?=
 =?utf-8?B?ZHZ3VTdHRjZvVUN2MWc0K0NZOCtHVnA2YmZVWFlKc05qM0RjYUN6OCsreEkw?=
 =?utf-8?B?WVE5ZFVKcVMzUVZIbFh6NnFEVkVEWWVRaTQvQmRGYkE3NnZIZ3N0Vk5TbllR?=
 =?utf-8?B?TDc3ODlhSFlJR3BGK2lMdk43cGlvNUhJc3pvTitWM2hFWHQ0QUF4VVJOWkQ3?=
 =?utf-8?B?RjVaUWU1c2VsdlpzWFJiUjFtVGZFbU5Id2hqdmlMZ05WSXN4UGhiMnBEZ2l1?=
 =?utf-8?B?S1Jsd01xUHpnWGVIYmJxUUJoZjNzZm5hdk9LaUttT20yN09CS0VuemNjMUV3?=
 =?utf-8?B?NWFETm5EV2FkNUJXSDMrNmxIbjg4d2F4RGlnQ2RpSDhkVUFVeXhQT2dtT281?=
 =?utf-8?B?L05TQ0hIYk1YUnp5Z3BqN1VpRmh0Sk04YXgyTzdEMFFFV2xmaXluVDNnRU1H?=
 =?utf-8?B?S29LRmtBSnoxVUZpQjUvWmU1b0k5aENsL3pLd09GMDc5Rmg4MU03dGpHWitE?=
 =?utf-8?B?MlZxdFNZUWUwQ2ZnWGVzMU9KUWt0d0k4TVVQQzIxS01MU1hxRWYzaWNLN0NB?=
 =?utf-8?B?b1VGTFg4QnBlTllmdFMzdEFiR3N6V3ZVa3dhUW5SZFBpMWQ0S3hSLzdwZXBv?=
 =?utf-8?B?UTN1T3pZR3RLWWxmSFFTYW9ubjhLMzRBcXNuYnE2ZnhKZSt6WkpUYWVURVFU?=
 =?utf-8?B?cmwweHlRWHdwSUhISFZRZTJDMDVPc25pSHB5b3V4TVBDR2htaFVLS2lHbE9I?=
 =?utf-8?B?TXdCT2xEaVJKOS91bmpkUmhxVXQxRjM1MDJGT1M0QWVYdmcwT3NmTVlUT29U?=
 =?utf-8?B?K3lhR2prWWdRYUQ2eFI5TnBpdjRSbVlucUhxeWpwVFZzMTF5SWxQa3ZuL1VY?=
 =?utf-8?B?d0FVbWFLTmtZaUlTcURXQlArRkc1UUpoQUcrcnZNUHdMRXZsQVZlbTZrcDV0?=
 =?utf-8?B?cWJJMm9sTm5NaUNKdW5PbmZsK2FDNUsvR2VxVVRPbWg0TzR5amw1aVZqVWlO?=
 =?utf-8?B?cXY0dktaend5T1V3SmU2a1pqMGYvc1BZdzhpMnhLVTAySUZ1WXA3amhKdmxo?=
 =?utf-8?B?T21scVU1WGMzdXJqNlFLdFBxc0pSdlZYNnRtNWZBa2tMbVl0eEdKMmc1L3Nz?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ab9457-9c66-4031-7ddb-08dbe51e20dd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 14:29:36.8051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/QLZDMJ+DcOSoK1qV/PP35HmIE0rj3FMUcRIzWQl3J1NBQmdrsqJf6vZ4K9aj1xnv0dGf7c0PmFbJxnfGCX83o59i4tTqY1n3+ehM8IeJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6356
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

On 13.11.23 17:43, Michael Walle wrote:
> The FORCE_STOP_STATE bit is unsuitable to force the DSI link into LP-11
> mode. It seems the bridge internally queues DSI packets and when the
> FORCE_STOP_STATE bit is cleared, they are sent in close succession
> without any useful timing (this also means that the DSI lanes won't go
> into LP-11 mode). The length of this gibberish varies between 1ms and
> 5ms. This sometimes breaks an attached bridge (TI SN65DSI84 in this
> case). In our case, the bridge will fail in about 1 per 500 reboots.
> 
> The FORCE_STOP_STATE handling was introduced to have the DSI lanes in
> LP-11 state during the .pre_enable phase. But as it turns out, none of
> this is needed at all. Between samsung_dsim_init() and
> samsung_dsim_set_display_enable() the lanes are already in LP-11 mode.
> The code as it was before commit 20c827683de0 ("drm: bridge:
> samsung-dsim: Fix init during host transfer") and 0c14d3130654 ("drm:
> bridge: samsung-dsim: Fix i.MX8M enable flow to meet spec") was correct
> in this regard.
> 
> This patch basically reverts both commits. It was tested on an i.MX8M
> SoC with an SN65DSI84 bridge. The signals were probed and the DSI
> packets were decoded during initialization and link start-up. After this
> patch the first DSI packet on the link is a VSYNC packet and the timing
> is correct.
> 
> Command mode between .pre_enable and .enable was also briefly tested by
> a quick hack. There was no DSI link partner which would have responded,
> but it was made sure the DSI packet was send on the link. As a side
> note, the command mode seems to just work in HS mode. I couldn't find
> that the bridge will handle commands in LP mode.
> 
> Fixes: 20c827683de0 ("drm: bridge: samsung-dsim: Fix init during host transfer")
> Fixes: 0c14d3130654 ("drm: bridge: samsung-dsim: Fix i.MX8M enable flow to meet spec")
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Thanks for the fix. Your explanation sounds convincing.

Unfortunately I'm currently not able to understand why I had to
introduce these changes in the first place. What I tried to fix was
exactly this kind of issue where the display stays black every few
hundred boot cycles.

My current guess would be that the issue I was seeing was already fixed
with dd9e329af723 ("drm/bridge: ti-sn65dsi83: Fix enable/disable flow to
meet spec") and I didn't properly test both changes separately.

My cheap scope is not able to capture the DSI signals and I admit that
we didn't use our more expensive equipment to verify the changes back then.

Instead, we had an automated test setup to do cyclic on/off switching
for the display and check for a black screen using a sensor. It is quite
a hassle to set up and I'm currently not planning to spend that much
effort to verify this change again.

Anyway, I currently don't see any reasons to not revert my changes. Your
revert looks correct and seems to work fine as far as I can tell.

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Thanks
Frieder
