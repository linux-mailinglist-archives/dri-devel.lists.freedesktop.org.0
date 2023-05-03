Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3EE6F5B6F
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 17:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3621110E30B;
	Wed,  3 May 2023 15:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2097.outbound.protection.outlook.com [40.107.241.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3314E10E30B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 15:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEHY4oPnW9UR6hWT/YX5w9oPcfMJM59t/HHYurlfHkGFL5e1EksNdMrYpbrwEAweJ2AHp/2nno3gzEkec9hHkkm0ieDcXP/FD8JAi2e0PFvPdw2PQtfEbIh3mwZAOMi8K3V5YLKux5GVmXvHU6L8st4cflo/DhMz8VXEq4yrJ9s3UgmkLIDV5y/PPiae2ym7uVPwSnd7OSLPsHMFOF9hbigltPYhUxbrg220n6ibikK2Xdv1msB1wY8MT8lH7bdyjoByNypMxRZifoo5XiKPqeKAIxL/1vGDqmTRmx6FuH43qIeio9pPl5uGYze/0Psfh2Kopjf1xqpx7HuDEHgDNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiiUY+uFCTE+qgX2aUEtApf/tNYfrWa9lnIP3deViGw=;
 b=Rc7GPSHFVZofTLKTSyfmZgJasE9TDDfAmd1mNxrtc93Img4sObue5jBkYOrkESFSutoZIFvwchCBYRjfTG6ZjpBQqQdFT67iZvsk4uFdRw9vSkQTwPzOdpHs2zNG0mNGdDqNNeSu3otNPIhsgv87pFIsPPFpUjGAO9A9iJXr+2EtqcX0ENtn8lYA3846Sn7PIGfGZqsD58rcLpW6nJTB/Czg+9aDq+pxSs0/Cbylq7bs39yz2nMKoIO4TGg8iAq2uY3yHTeKrZch1ChMAOJHOWEvjRg+rODRBrmftRAK6sibCKkJFMdqBPFOSd8Gmq7cy4s7JBBYwUW8Hb1ek6ucFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiiUY+uFCTE+qgX2aUEtApf/tNYfrWa9lnIP3deViGw=;
 b=F2MnVaVsV4wL3/eRWkUOlQ2Wkrw5BeKy2nIOR2FxABReZCMCbfxYlUMoF+RHn2373j/NEC9K5FwAyHYCSjOvzV38Jgx5EpxBy7v8AvSFvHcg5Du9MS2OJoCibcRKDmdQId6kme4t6Ha5b2DEcjPIizRuVBbw72R9Zl+Q1f3G7wU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by VI1PR10MB3646.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:138::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 15:43:08 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e6fd:d174:5710:fb3a]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e6fd:d174:5710:fb3a%2]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:43:08 +0000
Message-ID: <d7d435be-e178-2666-f83e-af3b6cc37137@kontron.de>
Date: Wed, 3 May 2023 17:43:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 6/7] drm: bridge: samsung-dsim: Support non-burst mode
Content-Language: en-US, de-DE
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230502010759.17282-1-aford173@gmail.com>
 <20230502010759.17282-7-aford173@gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230502010759.17282-7-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::8) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|VI1PR10MB3646:EE_
X-MS-Office365-Filtering-Correlation-Id: 02da4c02-30f9-401e-55f9-08db4bed17a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JfGSM/sr0BDz7mhFqQz0ythG1oW6LquxYyPUBuv01lKlBByq4QXLvW9xOhTojejtUcEMUqIdnjldQwHh8mVNtjq5x7FqpHSsJkPrtCWdgLqwYhkz7KsTHbQKRp+fhzZR8D9/eIrxo5uFGm1gwT9MgMvI4vcRPELdAn+Oe00ka0gVzZqmHH/8SNxw3XKpvJYaJuXHT90lPC7waZrbUGv3/2IjivifMDjEbdlqdtOEjJVnM4Zr7fUpoW7aB9GMgz+PUIcHpkWoMt/KrY3A3cftH4SvhQlukcIWUKklPgZVwdJjcseNaOc2TFUnrxjMqRUxz1bu9nV3WP3bdBhtLtP5skqlarRLpz4AaOPNNzi6GU0jsWy2vYj1PiTReDDsePlPN2szYFPQVc+TOlSXl9XBEtb98453rkGWyswUM0PrO53mt34321DgaA3aJ+IxkaSOEZ4HkJAvJeeR98XNjWblSvlwzKo27VRy1Iwd6IZKLwrPL3cfGuuDkMhGP5+HH4QEt0CxXHnn45JsPqFCjqYOSPGdUzb6x4MjJJgipYnyUYayCrtXui2dGbp7BsCMq+5+JsQXOsAtaz3tvfg6mX+n/byPCShdCiiIy5f4rsFmulP1oO2kmIB5YtZF4GU12A6x+Vy8Xa+NvpMN3joRUNTkaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199021)(31686004)(2906002)(4744005)(5660300002)(44832011)(7416002)(36756003)(8676002)(8936002)(41300700001)(66476007)(66556008)(66946007)(86362001)(31696002)(6666004)(54906003)(4326008)(478600001)(316002)(6486002)(38100700002)(186003)(53546011)(2616005)(83380400001)(26005)(6506007)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dU82T2kxMUhraFB5dWNSakNUUncyK2Z1aHlZMFNmMnNQYUdzSjZ5N2VzeEI1?=
 =?utf-8?B?bmE5UmY5eU9BVzFOQ1dNa3djcXhXK25OTmpOTDJzeTJ6UUwzU0xUUEhGOXV0?=
 =?utf-8?B?T21PUk52Tk9UNWxsbU8vMmJtSjVWWmhMS3hHZzRiM1FOeGNSZjNDNFdIUWNP?=
 =?utf-8?B?V1hZREJjVnFZUlBBa0JXNm4yR3ZtZ2p4MkdaajhXV2FoNXM0T1VJWXJ0bkNn?=
 =?utf-8?B?cSt5MkVWRFphNjBEWkFjR1dFcHNEcWwvOU5peWNSaTY3elRxcVNjd2Vlamc3?=
 =?utf-8?B?R0VlKzY2UGdMLy9ZeEVyNzdZbVpBcGtnRXIzRkxhZWJFczc5Rmo5UlhOa252?=
 =?utf-8?B?eXErcllqWjN0V21SOXZCZ09HZDllUk53OXlxbEtXRTRGS1NaQzhwOTZVajN2?=
 =?utf-8?B?eUZiRTAyRXNTU1gzanBrTmRZTUNmVVNMT09LNGpzc3pQVjRxc1drdHR0dUVR?=
 =?utf-8?B?M1VsS01DRTFHR094OUJBcEVXeE5aM3UxU0hwU0tyNTlXN0llSzdldVhpYzZO?=
 =?utf-8?B?a1UzM2tVdlFsUmMwM0llMkllUG0rbTFFMnhyNzFSWDNKVkthczlQUERvSGg1?=
 =?utf-8?B?clRzeW90cU9yblZ2emdSeFMzTElpOU9Ddyt5Q0Z0RUZZY2srU1BTZit3SlhR?=
 =?utf-8?B?ZUs1NWZGVWU0MWM2TUpzU0ZSOTlQcEJVUjBxSFNKN1lrSFZXcGFXTVArVmZl?=
 =?utf-8?B?LzBVNXRLL05qL0hTK2lJM0JIbGN5ZlVBY2QvV0hsVGk2QzBGTmd2Sk9lWlpY?=
 =?utf-8?B?MGo0UVZDbzdPU0t0a0czQnlVTkNRUGxTSjhKY0N1UlpvTGRVaW5STExYQkln?=
 =?utf-8?B?aWpUNDBBaGFTeFhHL1BwZllqM3ZHdkI2L0hEbU11TEJJUFZHMm0zUDVsSlpj?=
 =?utf-8?B?ZnlRc1N5czhhRm1TUHV0MUNIRjZyTlU0NkQ4MHVjano5WmpWcTRxV3lXWDF1?=
 =?utf-8?B?OXRxNGhGYlZaNElud21Scm42Y3ZnVHlpVTRzY21XejBQZU9uUDhyd1ZpUWE0?=
 =?utf-8?B?Y0VERUpDNzhRRTh0aGRVODMzaHpjWm85NXdBaDE0TnFsQlNYWjdHb1JSRDE4?=
 =?utf-8?B?cnFCREVnRTFjR3A5bHREbjdpZ2g5Z1B5UTlCK1J2RE1Ba1NxaVBobUwwcDVy?=
 =?utf-8?B?SkszUFluMWM0dm8rMFplUldtOEM5TXdrQldlU3lrSC9JVi81dzlURm5FZWZN?=
 =?utf-8?B?ZHY0eXJvQStmcit6K0s5MDB3OXFia1FrNEw1QTNiYVNiakxGNmRPdm5LTXNw?=
 =?utf-8?B?Qnd1NnRXN0ZLdWFhNjVSK3JSK1JMbGZIakRzbjlOQ0tmcTZMNmxJdlYwZDFE?=
 =?utf-8?B?aEtaQ3FBaGFlL2d3ZW43WERHcHFObWl5TkxFUlNtWUx3SklYM2dJcXNFRVdr?=
 =?utf-8?B?UlMrUmRZRGYwaHl5aDFpSHlXNHhGWmhwbjhqdzh5ZWREeGd3S1F3a2lKUU5Q?=
 =?utf-8?B?YjFWWVl4U2VKQVBUb1diMzl6TDdrdWZQeG5sVGtETHpLWGlSUytiUWwxWE1N?=
 =?utf-8?B?dG5jM0NiQ1UxSHBLcUhSWXFwamRRcjBKOEJQTHBSbWJYOCtBWVVDRFkzVEpD?=
 =?utf-8?B?dTNFQnFpMmdub0djQTJ2QmJCcE0xR0NnWEQ4U2RhdXZWMW5CNUxPWWNETGtB?=
 =?utf-8?B?b1dYR1BheDNPQTd2SWd2VmFKamlrYkNPTVpMWXdDVzdnU2x2aFNaYmI5UTVi?=
 =?utf-8?B?WStTY1RhWXJCbmFhbDUySjZjWHpyOVVNdk9hZGorT1VDS3ovZzVEVC80QTNE?=
 =?utf-8?B?cy8zTXcrdjh4ZEFqdStBTDNuUGpUSUxVcjljMG5QdVlkZ0VUNXp4N09nYXlL?=
 =?utf-8?B?b1NFMDNocE52QnFkb0E5bkIrOEZqaUJBTEJzbHREalM0b29oVG1naS9XYVpX?=
 =?utf-8?B?dXFvQ0dYV2FhRUJraEdhZGRzbmxjVytYSmdVQmcrekxYSmlTMnhqcFVTV0Fw?=
 =?utf-8?B?MjZyZHJ1SXdZRHdlb1VOR3NzZi9pMlB1ZjZlTlBnY2FQdjFqcFRsbFNIT0Jw?=
 =?utf-8?B?dDQvbzRzRFZsUnptekxzVGp3NVM4MTFESHhOcmcyWEx5QzFCVlZtQnBWcUpx?=
 =?utf-8?B?R25taklJb0ZlWXRjM3dnSzUrOEo0UU1pcEZ4MmFoQ0VtejZnTEUvQmk4ZHN3?=
 =?utf-8?B?SXMrVm5LWW94ZWdlRjgxVWxNTERtT3d4WWJ3RE41bmlUQk5FeVhFMW44blJr?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 02da4c02-30f9-401e-55f9-08db4bed17a1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:43:08.0323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EwPiBsnl0rZYzFR7JIbQf/EAjsfyxILQzwnw9sy5dc3BAWVaHxoCU3MZUyC6eQHnFPQpgmyHW7e6SANA+nYYzjfDiszKUHSnN721Mrbtyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3646
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02.05.23 03:07, Adam Ford wrote:
> The high-speed clock is hard-coded to the burst-clock
> frequency specified in the device tree.  However, when
> using devices like certain bridge chips without burst mode
> and varying resolutions and refresh rates, it may be
> necessary to set the high-speed clock dynamically based
> on the desired pixel clock for the connected device.
> 
> This also removes the need to set a clock speed from
> the device tree for non-burst mode operation, since the
> pixel clock rate is the rate requested from the attached
> device like an HDMI bridge chip.  This should have no
> impact for people using burst-mode and setting the burst
> clock rate is still required for those users.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Tested on Kontron BL i.MX8MM with SN65DSI84 and ADV7535 bridges.

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
