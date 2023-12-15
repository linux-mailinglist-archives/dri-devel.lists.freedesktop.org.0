Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA1381495B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 14:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFD110EA06;
	Fri, 15 Dec 2023 13:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8650310EA06
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:34:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTfxCJiaP86ShtSsnlD94aJERGSf/uDWC1V7vDA+cvAPmxEWNqxdqaTtOLelU2szyvr697RhtnHCT3XwCaI/YQA/I/BzQ+R+Orif7YoErGydtyYYXg79pGtHqZs4LFZIJzf1xJ9IS+hu8408+G31ROOkhjSeS+sQGpPiuo3BBouR989MizgGPKDy865ZtSJUe0c4upOIpOrrLFBW7mDbT9U4cnkRohT2VXiw61d/LfhnDAzkr0Us8lhTSVevKWKclPUDgld/xlbAzrDagDRJ9NEaqPq7hoysENAcylN8f1SK5Zt1HB06hO8DYdRvDjxpI0by/O/fx/1aGEQ6BcpxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fr+hZzV4eKy/4a0elyGfds8X+XUmQuNvxEb9608X3X4=;
 b=Dba6aS1QPIJ2VbgEhwUp0gp8WusarqZV/zIj2mqwl78nu+h46NgvVtLCiCMWBBEx/Dr7EibX8Ipg9ir2aeIjoPLAye7X01Oo8aaVUPZbGXx5UFX2jTjRX2r9m8hIQawzkDh0ZDo/J7dKxkhcbG4Oln/e2LxOq5tcDH5XAo9HIbNdjDQpt2CYxyiQcAG+dclVGttHmV4a8rwijaC02pn+ZV2caMwJfJkiLo4rECGRhcQReh1XGBG8jcR//9HZvgNXYf8y/uT18fH2zghP6Pu37jvQeYkEZlBOwS+AW5Ep983u5fzecnoux1F/kTxLWdyL4T/sbw96dMGtXgev99cCJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fr+hZzV4eKy/4a0elyGfds8X+XUmQuNvxEb9608X3X4=;
 b=a9FK5dDsH04dzDdsJbbpnhlveNvzol+pGjTkwC50ZF3eWoEvNqtYi6mk2Sfpk1qHY9N5wu74IpcoPjBWgLmQU1YSXMm3cE+hA8q2wRb3XPyAeKGU2nb8780TgIPGAvP6FPG1O94shw6AU45EsldEHzfpV/fFpTTyHXbHOlJ+Nd7w2oJWZ65iG1GDD+8H3t2G62H/7L/jm58HSej0cjXbFxlOaWg5EtK8XNr3njy7iA5T2Qig9jO7c7hmFYfTelTM4Vxhtqb+FGPWCugN+4M0a+W7fIifr4zfJ2EAuwC2Nub+/Z9ufje9t0Ot32iW5XeJq22UcYgFzqLwzpOoUfXTIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by DB4PR10MB6991.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3f5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 13:33:57 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::96c7:d239:1723:8761]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::96c7:d239:1723:8761%5]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 13:33:57 +0000
Message-ID: <0ba64662-b49e-4132-88ea-fcb813af1270@siemens.com>
Date: Fri, 15 Dec 2023 14:33:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231031-tc358767-v1-0-392081ad9f4b@ideasonboard.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20231031-tc358767-v1-0-392081ad9f4b@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::7) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|DB4PR10MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: 649b3998-b6dd-4e2c-3794-08dbfd727d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SnPWu1Kw8sl1RmJ7nUmDp0lrLOivrxLqgz3928aBtUlcvTwOf/Ok+zEzAqRj/n/yZgjTZPfJeTHXcKw1XAIzbcQuaIVJ+waUW3Vjjoa/8BY5z238UdI7goUUU4EZxdbdYxX5HJU0nMO75F1wTv7IW+6p0o17MrN6TK2mujpBVCSLNtcClbiVm4u23JxJC02b740lr9Crqbp/0MyHrqpMxs5SpL3CMQ5IFa3y1zGNyOoBxTHldaxwBbKGxMqD/LLH4gbxJLoP77pY//EqDZMoL0BTiAIoLFP7jDQIOZpUQHBNuhA5xaLcYHq2N7x12jADXweUDxf/lgfcPotF9IDZimHYpN8UdISVYNET9cJb+oFL+5L/7WDJWN79bbmJFZH2IZ/cpfhukZdIlo4GbYS6q4KbX3rXovM7grRKOWnkGw3xgYP9P6bI2ievf1W7IvAAcDH+Tr/PDH6XVIF7DtlxiU+uvb7OTYN6UvVm/o0JG61+y8ZECrHyst/SUnkXGqv3vOoWMQYXp4RqPLM3o33qJmpb/aSbGQCHK9a/xWIEhwjds8czCFL/QECy4O1kFVbYpF1gkiyofibVluyPJir27Va+UfRFYfq3eRib+T9Fs/sS49uxbNXm6pyxG+EJVj6UyWo1+vH38AMz19CH/Igr8ghZCY/+CDUBjsjnWA3K+Sk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(376002)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(4326008)(8936002)(8676002)(82960400001)(38100700002)(5660300002)(36756003)(7416002)(44832011)(921008)(2906002)(6486002)(2616005)(478600001)(26005)(6506007)(53546011)(31696002)(6512007)(41300700001)(31686004)(86362001)(316002)(110136005)(66476007)(66556008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWdyR0NLYnJVZ3ZrcmdSVnc2ejZZWEFLMWYxSXFlWjBERmR1WjU4T2ZnL2VW?=
 =?utf-8?B?a1NLV00yc2orUVJyM21xSlVYTDR2dUpmWmlYT1BsTWVrUXVMVmY4MEpWYWJC?=
 =?utf-8?B?RXlITmV6em13YmFWZE9UU3lYV1F3YUgyblZGVXhEQkNlUW05UUFjV2hDMVhU?=
 =?utf-8?B?R0xWMVU0TDZLT1dGajRvMWM5TVI5RUliZmhoUWd0SXczYzlONTByc3JqL0ZR?=
 =?utf-8?B?M2ZIYlNXbklvOUtjcXpQalk5dUprazJTM2FzdTI4bUx1Q1NDSjNOSFRwc2Nh?=
 =?utf-8?B?T2xKc1hTanVJUDRLNWNSNmFBcmhTOW4vbmhtQ21WSENiRzRLc3IwUkt2R0Rr?=
 =?utf-8?B?cXhFcStDdHdlL1V1NlozTmJ1R3pqNmswQkh6NFN4YUwrVGRTTTcvWkdRMEJq?=
 =?utf-8?B?ejdEOHNIRk1IdGpGN2g4eERkN0NGcFBUREltZUxCOEtwcTBBTXM0UGFGTVNk?=
 =?utf-8?B?WUo0NmdXYnBxRGppT0txQmRKTHJMWjhvSGxQNFc1aUJoQkd1UXFzdlFoZW1J?=
 =?utf-8?B?RHdHb3c0Sm1ScXJXUnErTGpkbDd4S2RvWTNMT01BVUVzVU5YTXZtenNRR0Jm?=
 =?utf-8?B?NThrWDVxcDRENFdPR0hlcFFQSFBvU0x6TW5JOHA2cERVR0l2eG41Q2F1TFlt?=
 =?utf-8?B?RVV6VGNWVlg3WVpJVWFXMWora0IvVkpZQzJtbGFkRndoeXNOY1ZMRlJEMENn?=
 =?utf-8?B?bzUyL1VqTWhMYW1aYUU5cSthMitlZ3AxYW1Ta1NsT3pPaVhYZmhPRUcyeVFD?=
 =?utf-8?B?WU1WQk1JcU0vRmFwb2wyRjUrYzdYSnRaeUZZbEtrTjZkREVlN3pOSDJyMXZZ?=
 =?utf-8?B?ZEF1d3VxY0NVNEJVeDk2cU91M0tHVnVoWnRndTRCVEpPdjgzZjlBaTl6d1h6?=
 =?utf-8?B?YWxNQnFyNVp1a0FLaEg5cUNEU2U4eWJ0N0F6VkNTODRBUkRXY0pLMWlHb3Br?=
 =?utf-8?B?Y2VIdW80WG5SeEpTRlZJTXBGL3JtSFgveVl6S2dVOENJNnVzSDJ4aW0wcFlH?=
 =?utf-8?B?Y3Y5dHhKWUVQQzQybGpxTEg1RWJVdVRnMXFUSDB2cnBnOU1ZWXU2YXpkOGs2?=
 =?utf-8?B?dTdzWkp2d2ZqZHJYU1BocnI1aUc1VEJJblA3T29NRmdmNVlCT01jaHZSbTZJ?=
 =?utf-8?B?WXN2TFhaV1E2VGNhcXoyaklwNitMVEFPaFFVbTVDdmVIMERqQXFBeGtRYm8x?=
 =?utf-8?B?WnYxV291ODlIeTNBeTlyOVFZem1JZlBDd2I3NUUwYTRjWG1QOVR3eXc0aDcy?=
 =?utf-8?B?eFpSaWFyKy9VSlhmRGFvUWFnSC91bktoRlFWVGhVa1prVlFETU81THY4Y3ht?=
 =?utf-8?B?Zyt1M3MrMDJ5bjk0eGk3ZVQzTmhKWExzU1JrNHRzOG5UdGMxV00reFk1MlV3?=
 =?utf-8?B?STN0bFgwemhoVGVSN0kxYTdMdndIbGNRSHBYQ2FIcTBUbWJmblM2b29ESWZh?=
 =?utf-8?B?dmNQV1VQd01pSXRqMzkyZ254UVBoNk1UeWh5Z1JzV05UUkd0Q052ZTJ1SWVt?=
 =?utf-8?B?OG9HdS91UTA5S2pBTFNxbUZRZTJMSVo3bTVqVWdnMHFDSlU2ZDRiTHJHNW5a?=
 =?utf-8?B?Q2hFYkhlWHJEYWU0TWZ1TXAzaHBJMHNCR2lRanpXN1dqbWtCWmdSOUROQ1lT?=
 =?utf-8?B?Y1g5M2ZVZmszaE9YL3ErZExNQ2dDUnBxaEJqWkgxTHB4aEN0cmtxeVZueVFZ?=
 =?utf-8?B?SmFLanJmRWh0T3VGaU9ZYk11QVJIYlJFcUprSE04Q2ZrR21tS2g1d05wVEpu?=
 =?utf-8?B?M0l3ZjNLUm1FSUZnQjRtL1d1M1RxY2ZFSmkzOXFMclFvNTlHdWtZamZuS3pP?=
 =?utf-8?B?RUR6dVlaSDRaSWZZQk15NzNtNy9SdUhVajFzSmw1Zk1xOTgzRngxN0M2VWIx?=
 =?utf-8?B?M01ncTVKaWN6cGZuVE12TS9KS0YxZGR1dGZOOXZjS1ZwRSs2NmNza1dZcWZh?=
 =?utf-8?B?M1R4ZVlqN3dLVG9pOGcvY2RXWHZYTHBDMDZhbEdpS3I3NnZtVFl6SnQvM2RX?=
 =?utf-8?B?alFvUGRZYmJlSmxpd0l5dzAyeHpSaHBzTk9FMll6Z2l4dnY3eXRQSWliWEVs?=
 =?utf-8?B?Uk4vY2hhVjFEaUtzYllPaVJ2eVRKRjdzWFZrdkVxb3FyOGhPL1l4WEZxaVdJ?=
 =?utf-8?B?cERRVzNkczZPd25EZ25xNFNoN2xZNWtFNWdMeTk1OWVMZ0RCMm5ra2ZQYkV5?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 649b3998-b6dd-4e2c-3794-08dbfd727d81
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 13:33:57.8374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yL/L3xs8vgDVyi4Zgb48bKHDz6KcVlaWCeRcxOu4bDPcqsiKjYKmNpIYyQPThrSOa0ObEhCknwVOb/AWRdoNWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6991
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

On 31.10.23 14:26, Tomi Valkeinen wrote:
> These two patches are needed to make tc358767 work in the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR case, at least when using a DP connector.
> The first patch, "drm/bridge: tc358767: Support input format negotiation
> hook" was already sent separately, but I included it here for
> completeness, as both are needed to get a working display.
> 
> I have tested this with TI AM654 EVM with a tc358767 add-on card.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Aradhya Bhatia (1):
>       drm/bridge: tc358767: Support input format negotiation hook
> 
> Tomi Valkeinen (1):
>       drm/bridge: tc358767: Fix link properties discovery
> 
>  drivers/gpu/drm/bridge/tc358767.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> ---
> base-commit: 79d94360d50fcd487edcfe118a47a2881534923f
> change-id: 20231031-tc358767-58e3ebdf95f0
> 
> Best regards,

What's the plan for these fixes? I'm not yet seeing them in Linus' tree,
thus also not in stable.

Jan

-- 
Siemens AG, Technology
Linux Expert Center

