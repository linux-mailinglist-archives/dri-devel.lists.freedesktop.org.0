Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B778890A365
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 07:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2597210E11C;
	Mon, 17 Jun 2024 05:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="xem1gX3y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249BD10E11C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 05:40:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0Vrz1lz6bX84N7MKGSUxEeqx6VUHPkg0IjvtdI+Bljd2QRZE0DSqdGYc/aLTZRCotpXlTeQ/oBheNWsNV+Howwb4tFAa0gPQM+WpPVjoucXCHlD95Gy1Kxemioa1gXGrTYrtZ2yJNOUXYHHfgAjIp0OEgDgrzU6ZkQuhkDc0bpJDsnesswAIP9LjM41G9HED/ih3KZOt4U4Sj02+DIYz5ogVStI7XZwvZN2nzuulEXPRT9qFSaZxJgTMUJc+oEsT3YqSHbplDZ6NYMKZ5YwzBZPzIu+pQ7fVZt/pUFcOzhbCi3woYmdZZD3wK/+W5lJs00EopLphcA1cPxPS845MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Is+qv7uCplBT+/WJbhVYy5B3wXrEVfxSBYAHjfBInJY=;
 b=Kjq5GTDmcFpwzR9pozsFeapUmA6yhP7ngqzDMBlgTxer7juQne7dU46y54Ci1ftVYuCf6qTjEVIr1wu4KQ+mmYhhApYDzTGCYwnmPfgbSP3+2Cat0n4YekUaN4IBAsukZwEhPzH9QTAmegJ9SGApDCtQEdR65OyqXRg0bPHJop9nnmggoerSaqHeUZvrsafJ5M1J0whdJr6x09KRpF+5065V+DJYQsioz7xv7yAwmKCuOH61kULkNv+r1BTdUDQVkROZ8fN3GvD0Rr9ATBFpcR46tGr1Ws9x5RgiACpjPgFxBX7AGIOD4mncNSfSGnYYTpBwf4wttqnZQdrFuCBTuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Is+qv7uCplBT+/WJbhVYy5B3wXrEVfxSBYAHjfBInJY=;
 b=xem1gX3ymE7I9QKW987kfnIEFbR3d8qrZc35fD48TpESxDZjVI4WHFe3GZyFxnfQnyF+99gGVc9ROQVgnl4VqIFaP+MNWoAxVMFCtPOEzsWIRCHPWp41YwCxsVaao5r9nPkTmQiymm0tm5SdnqlHCxG2Jr5nD7h8clrd7QlNLYIIkR9a9o2J5Ghzj7qasP8yp0LBufc4kI4tYQX088wwQzWpm7Vh+VjWESwKrjMtVWkxOiZQkpItHutWBTIpy5Pp/QCBghXj0UchVufuS9LcZ8LpoIO82MwHQ7Xuzh4ulZRhaRAr65kyFV0kw+wzAG2Yfqb2Qvl4FNXTicLNyusfcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by DU0PR10MB6702.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:402::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 05:40:44 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408%7]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 05:40:44 +0000
Message-ID: <36ef53b6-57a3-42e4-95ef-a10eef4ca1c9@siemens.com>
Date: Mon, 17 Jun 2024 07:40:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
To: Marek Vasut <marex@denx.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
References: <20231108-tc358767-v2-0-25c5f70a2159@ideasonboard.com>
 <f6af46e0-aadb-450a-9349-eec1337ea870@ti.com>
 <2f3bb86b-6f8c-4807-985e-344a0c47864c@siemens.com>
 <3277848.aeNJFYEL58@steina-w>
 <b2052bc9-b2da-489b-9e5b-3c9b4f6c1c99@ideasonboard.com>
 <bc96c6b5-a7f8-4ef3-a89b-bf577943f11c@denx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
In-Reply-To: <bc96c6b5-a7f8-4ef3-a89b-bf577943f11c@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::8) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|DU0PR10MB6702:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e9f3e4-1baf-4d0f-7bd3-08dc8e9007dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|1800799021|7416011|376011|921017; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGdqQzFLRHJIUXppNFMxd24zaWhaZmo4VEgyU1orS3N6SGFWV2NDck9rd2dR?=
 =?utf-8?B?K3FKWmdydmJRWVdaK2tuTU1XRXJHYVZvVWtMOVdXd1dGMUY1VzBFcnI4cDRv?=
 =?utf-8?B?TzFkRFlrZzAyUXVETEh4RnF3bnRVQXd6SklxUXljU05XcDV3Tzgrem96TDVK?=
 =?utf-8?B?SDk1U2J6QzUzTTNTN3VkY0pwMU9QaWliT1ZzQkw0OE9SV0JtREJVeW5uWnUv?=
 =?utf-8?B?STBTNDArNlpVTW4rYVQ2aCtvRjhhaVhOSFlzRUZPdnhQY2dxd2hVa2NRZENi?=
 =?utf-8?B?VXVjMGdNSlVBU1p3bnhmMEdNYmZ3Q3pESlFDK05UMFBBMWZzSHZDVm9SS0E1?=
 =?utf-8?B?b01RUzExbXRWWmMrMU4wNU5kdEFtQkNaU2JYbXE0OGZoZS9tK0ZDM2o0SGxt?=
 =?utf-8?B?djZsRVpVNS95SEFjakRVYnU4WEIvR0VTR3Q4aVE2dVBJNmpRNWpoUi93MVdR?=
 =?utf-8?B?MDF4UlV1eUh6WFJjaFJpTXlRWjRiejFYQUxvcDlTbDVkdlJneVVjM1RVTEJh?=
 =?utf-8?B?Wktwa0VMM1I3a2V3b3ZnVTJVMmM1Q0FSMW8yckFUR05GellPVXZSNGZERHFi?=
 =?utf-8?B?THV6aG9MdEhDQ1dxM2p2VG1pWG5CVlNIK3I3ZmxITVlPeXd3eTA1dU9oUlgv?=
 =?utf-8?B?a2psYTdlNnhMRVJpdjZFRzZDdUtBK1hOZTNmdFp6dlhNUjhBNjJielNhR1h6?=
 =?utf-8?B?ejV5M3RUWi9JbGdLY3R0M0JYeXovdGkrUkg4eFMrTmtHTHU4NUFGU2hVNGtC?=
 =?utf-8?B?ZlNZdVZ4dk5sTHNaOXREV0xmUWJYUm13eVQzb0d0bUFlYXpVdXV0Q0lFZmhL?=
 =?utf-8?B?MVBHeVlFMG5Tdm1wVk9pelh3STN4blN1Y1JzU1ZBei8rK2RhaU9YTHBOclhr?=
 =?utf-8?B?L0RDUXJKYkV4eDNlY1Y0WDAya2lQZ3hJcTlOUy82ZXdtMFBHVFJreUdtSk40?=
 =?utf-8?B?bGxUbCtNbzJLajNiY1Q5N3cwRUs1N2RNc3BNdHFJYTNDVlpqNGloWEUyTk5P?=
 =?utf-8?B?WHpFQXZ0U3JRNlRFZnhYMm5ZOEpDSkIrNjlVYlJsVUh3TXN3WnlOREhVTTJD?=
 =?utf-8?B?UmFhS1NlYUp6WHQra3BKWDRwY0F2ZVh2VGhOT3lTV3EyMmF2dmRobjJJWU05?=
 =?utf-8?B?SU9YL0d6VFA3N2FKUkM5UDJPMExJcU5CSzBPL0tZRENEc2U1YmdWQmJUTGlK?=
 =?utf-8?B?VG9PbU1raXkxZXluUjd1Vk03clBXcm54RHk0NUNJZ3ZUTCtJaUJVQ3NDUzJG?=
 =?utf-8?B?WXJEM3lqOXhpT04rNW1LNmgyaVc5RVN3NndMQmdtbkJSdDkzU2dubEU4Z1My?=
 =?utf-8?B?bTNhNWJLYStjV25JcVRwWEFHT0dwU2Ivd2NjZFNoWW00VUtVQlZWcGJIQ2Mw?=
 =?utf-8?B?d0pxTHdXRkNlbWJDK041bFdDK2dGSzZUeUQxSXhGUXBjdnhnR2VJQWxqcDVl?=
 =?utf-8?B?VXVnODN3SjlWRThUYVBCZ0pVUUxKdTdRWG1ndzBYMWlHWlRxWno0OHAxTmdD?=
 =?utf-8?B?cTlESU5ncjdFMTZ6SHJaODVnU2lvMmQzcE41MG9UTHNoYTNMR29lSWhwOWF4?=
 =?utf-8?B?eFplZFhpTHprNW9kdzFxMElJYjhPWC9LTm0zT0xxOExZMVU5MVp4cTBYWXNV?=
 =?utf-8?B?VmlDQUd6cXpVV0Y3clMybmpNdG5vU0VIRGdIRElGNVdOQmNsVVNIRVZsUDlJ?=
 =?utf-8?B?WnRvSitNalQwdk5xOFA2RjlVWXp1cGx5Q2pZUjhkbEtCWU5aSjZtYXpCNU45?=
 =?utf-8?B?MmVnUm9nWEJFdjErc1JDUm04aGxQbzVadkRxb0liR2c0cUF4RGgzZTN5S2VC?=
 =?utf-8?Q?py/LbkPYN9wJejvysB5R5yd1gdxVkQU/ANbUg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(7416011)(376011)(921017); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enZzbHUvUGRzNW0zaWpCaEFoZkh3Nnl4cVR3N0wybGZEU28ySXVvOUlhVENT?=
 =?utf-8?B?MU1YLy91Qzg0R2ZHb2tuMDB6M0diOUhmODQwL0RGODdON2FoU1VYVFZqOFlN?=
 =?utf-8?B?ZWdtTDZVb3BuWmpyOVRuUmxCUmZWTS9yOXlkMzRGV3lWdVVoa056SXJsaEc1?=
 =?utf-8?B?MWlpSld5RjVacy92Z21CRDBDOEFURldCSzFzSS84aVhQYytVT1VXSDZOeGlF?=
 =?utf-8?B?NkZEQ1F5cEkxRTdXcVR4NDMrQWRZQ005cCtydWtyMytqRjRUUkNIaDBpY3ZY?=
 =?utf-8?B?Y01aYTNLRFc2OGl6UnRJM2h2QnRVQm9lN0NZbEdKbG9BeEJCMC84QkR4TEVm?=
 =?utf-8?B?NVBzajBUb2s4Uy9IY2xaSk9ZRlQ4aEhqL0hEbUVaY0hoT3NJb2hiWW5LajBX?=
 =?utf-8?B?dXZUTDBwMDNzV3RVL3dIb09oZEJPcjg3M2VCVzNKYy9ZSEZlUFB3aDhIS016?=
 =?utf-8?B?K3dKQ0JnQ0tmaDFqWE5iQ1FRSHpmQ2Q4ZlNGWjNCcEdhTVNiVm5oQTJZQkEv?=
 =?utf-8?B?QnpQTUtVc1V1RlYwblNPRVhhUjJWQWJ4TDVGbmFCZEdLVVF2aVZ2OHBoS1hF?=
 =?utf-8?B?ZXFadmNWT24xWktvd3JkOXZPQlZMTFdxOUY4TDdJSFIvV0JrL3Z1UGdoZGcz?=
 =?utf-8?B?b2ZDVldjNWJLQnpidFlGVlg0Mjd1eWQ3SE83WE1DOXJYTWkzeHJJV1pmMHRp?=
 =?utf-8?B?SVI1RkV6UzNFQ0hsUHI3RlpzVTh5ZVBxdDNGZjY5MllJTGtTU2J3bm9NV3lz?=
 =?utf-8?B?KzMzZGtYa3pBdmN2NHAvZXhtUHFxdXRqbUo4UXFUTWxMSVlPeU9aM3FlYlJi?=
 =?utf-8?B?Qy9hQWtjUEFzS3RaK2lMWDZvZWtEcUE5VGFPcGM0SWoyc2lsbUV5RldXSkV4?=
 =?utf-8?B?bEVLdldHczlMaVhSRTEzZzU3V0wyRzJpUzE4S3JlNUttNlM5NUgwa000Z0hW?=
 =?utf-8?B?My9FeDZXMFVWZVgwK0d1cXNDZDRxU2QyazdETytGU2I4bWJEZnJtalJCR3V5?=
 =?utf-8?B?eVI1MFluVCtvYTlWOXVSaElrcS9wREloeGlyeFEvWmJNc2E3ZDNpOXdhdHhh?=
 =?utf-8?B?UHdENnJWODVsTUtYNEJRVnNOTTh3cVI3eHZnYjhjb252bmVIcklyMXZxSUN1?=
 =?utf-8?B?azZQbXZNR0p1RFpCZTE5cHNPZVFrWWJPME1JVU51Mk1NZzVpV3dPNzlkYnBp?=
 =?utf-8?B?bXNUNVZYVzI0eXAxS0tOYnlocjZWYzNwYzloN1NncTh4TUVkeC9FciszaFlZ?=
 =?utf-8?B?U2xHaCs5Z01CSFliSzdUUm5VcDBLdk4ydTd2ODRZZWJqeHM4ZVk1ZWlwZ0FE?=
 =?utf-8?B?UWdHVUxyTU90NkxRVWdLNGxuemlYRUtXRnU0Q0MxNFVvcW90UUV5a0hrbTk1?=
 =?utf-8?B?MVN1cDJGZmRDaHp4c29vRStsZFJ3RHBOVmpIczJSVmtMS3JBSXNseVE0dVhm?=
 =?utf-8?B?UFZCSVhZSXdiUjBUaWk0K25GbXlLY1NvL2xkYWFueW5oZDlrQjRzZWZqaWhr?=
 =?utf-8?B?QVlOT0p6YThRNXgveWdWU3p0ajJENG5ZeFAyRElFcXBMbjJIa0tqajVsWmR2?=
 =?utf-8?B?M0JXVVZWS01VciswV1NPSjRjcFZyclpuVXFYUXJlYS9KcG54eFFEcE5WUm1h?=
 =?utf-8?B?OWc3Y0hFaldpaU54Nk5ncEFvNnFEa2h6dUFieTNGeGc0b0R6ZmJzdGNBL1Yy?=
 =?utf-8?B?SG42aTY4bnlVRXdnK04yck0zbmE0TENJNWU3b2Vrd29iY2o1UmxEWm1ZSWtr?=
 =?utf-8?B?b1EwK1AwbkRkb0lmeUkzeWRSRUc5bm0walFmNjRJNkxYM3RERUhyYko2KzdH?=
 =?utf-8?B?NlMyNXc3NWMwVWFQSUpBSlVVOEQ5d1JoWUtGOVZ0dzJSOFlwSkxPQWRiYjZL?=
 =?utf-8?B?cURSN1JtVUdHVHlXRnFWcndqZDZwLzdNTk5WN1p2b1ZKaTdnZTBjWkRIQU9a?=
 =?utf-8?B?U2VRc1lPMDA1bUR1d1p2bjJQQitxeE9PQ1V6ZGw4R0cyUk5DYnB2eXJsVG83?=
 =?utf-8?B?MGJLZ0NPNjc3Lyt2RmIxTFJ6K0hGemNNTjNlMFlsU0JibUhoM0hHeFYzb0Z2?=
 =?utf-8?B?NFJUaWpBejhCY2ZwSDVWbDAySmE2d3ZxZzJJbWdqeEhoTkVQajFiK3hMNDR3?=
 =?utf-8?Q?c43fQxK/Oh7sAMfs7dLXTcfKK?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e9f3e4-1baf-4d0f-7bd3-08dc8e9007dc
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 05:40:43.9563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxTk0aovWowN+l5HxX5L7nf6/O8IcJocFjS91OxnFaUmsWZvhg6F3H2fyQ0Mu9NT7TZUvnxDaIhIEVGPCDk3Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6702
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

On 16.02.24 15:57, Marek Vasut wrote:
> On 2/16/24 10:10, Tomi Valkeinen wrote:
>> On 15/02/2024 11:03, Alexander Stein wrote:
>>> Hi everyone,
>>>
>>> Am Donnerstag, 15. Februar 2024, 09:53:54 CET schrieb Jan Kiszka:
>>>> On 11.12.23 09:07, Aradhya Bhatia wrote:
>>>>> On 06/12/23 17:41, Tomi Valkeinen wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 08/11/2023 14:45, Alexander Stein wrote:
>>>>>>> Hi Tomi,
>>>>>>>
>>>>>>> Am Mittwoch, 8. November 2023, 12:27:21 CET schrieb Tomi Valkeinen:
>>>>>>>> These two patches are needed to make tc358767 work in the
>>>>>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR case, at least when using a DP
>>>>>>>> connector.
>>>>>>>>
>>>>>>>> I have tested this with TI AM654 EVM with a tc358767 add-on card
>>>>>>>> connected to a DP monitor.
>>>>>>>
>>>>>>> Just a question regarding the usage of this DSI-DP bridge.
>>>>>>> What is the state of the DSI lanes after the DSI host has been
>>>>>>> initialized,
>>>>>>> but before calling atomic_pre_enable? AFAIK this bridge requires
>>>>>>> LP-11
>>>>>>> on DSI
>>>>>>> at any time for accessing the AUX channel.
>>>>>
>>>>> + Marek
>>>>>
>>>>> Marek, Alexander,
>>>>>
>>>>> A quick grep tells me that you have added devicetree for tc358767
>>>>> in DSI
>>>>> to (e)DP mode on other platforms. Could you please test these patches
>>>>> and report if you find any issue?
>>>
>>> Sorry, I can't provide any feedback here. I've yet to setup the DSI-DP
>>> correctly.
>>
>> Ok. Does anyone have a worry that these patches make the situation
>> worse for the DSI case than it was before? Afaics, if the DSI lanes
>> are not set up early enough by the DSI host, the driver would break
>> with and without these patches.
>>
>> These do fix the driver for DRM_BRIDGE_ATTACH_NO_CONNECTOR and DPI, so
>> I'd like to merge these unless these cause a regression with the DSI
>> case.
> 
> 1/2 looks good to me, go ahead and apply .

My local patches still apply on top of 6.10-rc4, so I don't think this
ever happened. What's still holding up this long-pending fix (at least
for our devices)?

Jan

-- 
Siemens AG, Technology
Linux Expert Center

