Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1335A45207
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 02:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6067110E20A;
	Wed, 26 Feb 2025 01:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="GJeLbRxN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011024.outbound.protection.outlook.com [40.107.74.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9392510E20A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 01:14:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0Aqof7IU4XDcg+Sg0kUgEbaMcHdkHEIASAR5yDWqLTHSKLorK3Y9/PwcndoysTV3nNa6LeCRnxgRFLD/3kEZNOnDp3pJ/1azM4sTfLzk6N7yT4jpO/B04O/xk+odgm8IJQCSJet4fmDJN3T5zE7mvTJ6ZiOfou2Cd0fng7Du6mGQxrmAM5xvj0DMmffK1W52xcpjoHFOlsvdw1xWORqEOn3S4nIXhi//+T24l/FCpYXJL1HP6QEkWG89R7uuduh/xN8QBi6Cql6dLvrBIe0ftwSPvhsy+JshqmUkr53Et09hbElBt91Qhc0VMxVsniyIe5OGSvL0Yw5yL+iSq4mDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7zaSWw6FmY0E0Rujx9PGo2q8mZHstDo8RanybewW3M=;
 b=xcpEPcFcEcLwS94NNS9o7JNXS6vqVarPkbD5IlpzOpnDVNTPR+sYBZLMrP0cpQf1gFVo8ZInERGnl2JQadK/YGVuiO9RWOIhTu+JFNkZ3le7GQhCno+DkoxWU4ECWBvmOhiS+f4dYdVpE1W6PmOHewa9y1PiHNWpM9UWrtXYdbQ9CdNUaLvxFXjmiRhEO6qFe/mD2wGSZFUjBS9BOOlwU3LteVAGe7a/MDRW7sYue+R9hwT2mUCXx8lHQAbqSZCf8FrcwW+rWdhX7jBP21SsYmjR+QI4o62aAA1uK6J9nK21zAA/z1bYBdPBBvhqOWL1QaT2v1jeOmeFSHPLRuo7iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7zaSWw6FmY0E0Rujx9PGo2q8mZHstDo8RanybewW3M=;
 b=GJeLbRxNedNgfrtn4MHb7cRYoqfebyTerCggGtMy5R2hagnfERgAMMR3bp+TWjwesf/ELbyEArUFuSSYWDx6xVCpoEqbzM7yQ4pZ+a/KBgNa/TYrMps1gUvnFsSspLsyzqxIUIPmXVYovcIWoyKMdndhBfWS8hksQiLSXwoxrvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11771.jpnprd01.prod.outlook.com
 (2603:1096:400:376::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 01:14:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:14:17 +0000
Message-ID: <87h64hh5hz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, Simona Vetter <simona@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 Niklas Cassel <cassel@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linux-Kernel <linux-kernel@vger.kernel.org>,
 Linux-DT <devicetree@vger.kernel.org>,
 Linux-ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Johan Jonker <jbx6244@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 FUKAUMI Naoki <naoki@radxa.com>, Dragan Simic <dsimic@manjaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Algea Cao <algea.cao@rock-chips.com>, Alexey Charkov <alchark@gmail.com>,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 0/3] Add HDMI audio on the rk3588 SoC
In-Reply-To: <3337030.aeNJFYEL58@trenzalore>
References: <20250217215641.372723-1-detlev.casanova@collabora.com>
 <87frk2sumw.wl-kuninori.morimoto.gx@renesas.com>
 <8734g2sg4t.wl-kuninori.morimoto.gx@renesas.com>
 <3337030.aeNJFYEL58@trenzalore>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:14:16 +0000
X-ClientProxiedBy: TYCPR01CA0201.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11771:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c16b9d5-e7aa-48d3-3a64-08dd5602e3e4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZSb4NMpYNo49TkbgjefhWLPadjvt1IYBNGFKJSQ4m1CR5NoIi8ZtOzQ8qzQT?=
 =?us-ascii?Q?dtptFj7xjsuCu9hmDYpZpv0gAtRgLiciW2l60mBn8A25ESaltc6OV7u3xYlj?=
 =?us-ascii?Q?rFUMcJgpacn7ZiXQJO7ohfa+uICrwP6c/3p0Z3XP37cb4dlgFSPYGIhQt+1C?=
 =?us-ascii?Q?u43Vri46vB1TVc6kHRJyuMuLw0Y8/cEWseNaJ1HaAW1fEcOx2zTuM2a7FsBL?=
 =?us-ascii?Q?NXhZ5hwHxrigYAnbIrTvp/FAHtDT+F7J/r0bkCBqA3JSpJ1u3/RFnCCCxX0n?=
 =?us-ascii?Q?zjFHKDKSO3Jk7SX1op9o6/hu3ul39IFJL34UbBRd09fJjuZT+5XjTc1hkLh3?=
 =?us-ascii?Q?vIpXC3DUUIT9WXCLKhI2Hc5ifb0XnuYv6vB4+fty/lYj/WEGn464YPvN8W/G?=
 =?us-ascii?Q?TNnQLNiliTJx+KDaHUVTQ6DDvCGxtmH+CO6Z2cuXr3MohoNtIu0v/J9soxCJ?=
 =?us-ascii?Q?ircNDUDzLVwMM91H8ACIJG1hTHEBSnL5/wTEkeQCqDR6/dQVpLlm1dMLyrCu?=
 =?us-ascii?Q?tCmje4EhZmsVZ5wxhn4DW7jYmGQZXZffX2IGOt880mRD+nHPiuTQbhYCrTTp?=
 =?us-ascii?Q?74QkTOQPxYbhxyA156QS37ZgheivXvYI/mj3dIIOvYSHlcfaKzAAznKnGp+u?=
 =?us-ascii?Q?f2ondoN8v9b5pGYUpWto0BRjdgPQ/Jp3hAzTwSPJ53ODyfpMEyZ4So3LgJUG?=
 =?us-ascii?Q?8ufrpgwrW0O5Qt2W/CQZ1eV3PKUqOvDU+DISP18PK14Y+gPJjvFJe3WcQ300?=
 =?us-ascii?Q?r0pY5JVFzPMjDK1H3wrUCWOmnrlxK47PYnNENUMZkcyPXELhf4treGz0bkq5?=
 =?us-ascii?Q?t7kS2jfuaqQ8wUn01C01a/LLGohKz1XL7SkAysDmuKWztxiWSQlJMQz3S0pe?=
 =?us-ascii?Q?IxgdsAu1iQ7bkwAEaMdfxaNUO46bHzMB20RW6I5CeLFNXgSBLu7QQpkRM3hA?=
 =?us-ascii?Q?JFof30cf1CKFaM13h98Mq7XNnXq4Yp9yQDWW+mKo2DakSbsyJTbTM9I/gBqz?=
 =?us-ascii?Q?cIe63tSkMlO8RlSM/pyzSmVcZQ1Y4iG7ND6rmG4LllSTHHqQ42jvTLX1x4xx?=
 =?us-ascii?Q?jVWG4wmfxvUo3XRnS8RBowCMoWI0nF2V4Kak5XvZddHVP3rBiiIznw4XSYsw?=
 =?us-ascii?Q?WHbjjjj+SaD7dB14SnMst1/JDhsyVBxoTTQBWXjx126HgU56xDa3/ZVhU65P?=
 =?us-ascii?Q?HcWBFcPFkJ09GB3buuSRaxtESKgnw0yjjNhaSnfcXzYBATfLNnkDte1saRFF?=
 =?us-ascii?Q?F2jnd2A6R530rE+5dszANdsEzbvDSiHMvEaUY2vmRJ90x5ziFL0qp2o7GRZL?=
 =?us-ascii?Q?sVIGECdWcBPEhJiX1eujQhNh/uiumtWmMaExyXke/X1tYnVrqOKXhtmagsab?=
 =?us-ascii?Q?b6M4E7X9VprLaO59Gbs/B8HCd7XqKjC/8KN+BY/nEgZ6rmecuEPPvi1/iMe3?=
 =?us-ascii?Q?n84Pukxq/1Fv/gJJeywYADruer/FhXWv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a5a4x6IUj0J8GmI21pBOIUZ7/Qxilekt+a9wLDjnaDOad6zbXmNCGxzCQi1e?=
 =?us-ascii?Q?Oc/jn4zIL78NoDso6Hm+J9pw+MbLqDKcOc52X0il5y9wSGSB7ZNbtS7kv58l?=
 =?us-ascii?Q?brlWXkwwldQt+gGhQHWK9/seHcUu2dQSTKDBq/i/Bh3uwaCipaX+GA2GsF6K?=
 =?us-ascii?Q?gZvtv/dJyAIeE/FHLRwNtWcepv8YuHuCd6q8592x1KXLUOcL39cQ/Fvkaxvp?=
 =?us-ascii?Q?aaQbGVQmBXAkZ5Uflc3LAg2rTu+dR1wfZ/ZWtMLd+uPZxlXFD3YHXRRT2g9L?=
 =?us-ascii?Q?baAWT89RpMFPUVfNixNDkcl57WztcIyUh51PpnGsFazXpaJgCH+gAaC2L67t?=
 =?us-ascii?Q?bZmyN5zKOJB4gJC3mkd9g4GrSA3PNgKVW1gdAuUkrQke8rRaoMn4jUDPcCCk?=
 =?us-ascii?Q?ETqu8LwBg2uEFZFnzmr09JDLZ0Ai5Sfk6siiD/LmedbWpjdx2/vcTS4yrDqk?=
 =?us-ascii?Q?CmxOBeaAcIPIh8OGSZf7hGolr6LhIHg1Wj6hHsnFOufCtFLyd2ts0O6cR9fX?=
 =?us-ascii?Q?u/9H50hZvD4VHnvc6W5nfX+MS3+SY/47q93HcrlXEKbWxqWlkGrIsOwlvyrM?=
 =?us-ascii?Q?J0jLUVmmgcF6vp7pVXrwyKm16d7d9w4x4LkloDGG49ETGiAN0FTjd9Utnql8?=
 =?us-ascii?Q?242oZDf6S13GzX5XChGns0qGXQYqbBcW2g1nGEtRyVqPSK91uKHjoEMKhSZt?=
 =?us-ascii?Q?2kYGgyx+3eoTuUbJL16gYvA3hqW40RgTz1x4XypKmWK9SOghlcBy8g+JC0Ha?=
 =?us-ascii?Q?7aZJyWO7vUUmkLinR8sZDzZI7zvgazN4Rt3/YJkNotFuRc0chD524STAeTMZ?=
 =?us-ascii?Q?cmddnZGw65dkIYKR5tsJIHSZOWwOKhPzwE/REPtocKCqRIXyG8HARzr3TuCP?=
 =?us-ascii?Q?6UYAbcOZCkLDqB7Gs5TzO4M1ZuJzxam7Sfzud/bmaJZf85FJYfBCR82Ipltd?=
 =?us-ascii?Q?nwbfZkq3B86B4LF4JEgmeMm5yzBwG87jWYFxwNrGpbpS0uCat1/PqCp1juev?=
 =?us-ascii?Q?mFRk3HFzo6CGoPSlNI6AXep/JpFZp6sJRRvekiB+9iJzRWR0Fq/wCVdfUfGi?=
 =?us-ascii?Q?KeLeEuIvSowRdGZ2/18l/2FDcggdRMkNXtjr4KGPw32Tr4szaFUVrrrYZM7k?=
 =?us-ascii?Q?NCZHGZdX/CX5+yuTXXQoEy0HlpL5Q/o+gVXNtPC+e4guddIpUEc2LsdNU6uA?=
 =?us-ascii?Q?zqFGCwVbIMR2Y4VtYxFnm9xlz28wgS3u0sWgwUDsGn0k/OHlNo8kKuH8yQtW?=
 =?us-ascii?Q?dWaxPq/Bcs5WiQRQ2fXULyKbhAriWbi+nzJfgTSCxT9PGTh56IAOsluTAzVk?=
 =?us-ascii?Q?KNkohFliDzkSYnEPZufCgneUGxC3DazBfmEal8pC6XivoXG6uaLCKymovHOq?=
 =?us-ascii?Q?16DrNwX1dFcHdrzWFZwjZyRIXUrE0MAwjDtIFYy4DdqcIfG5GFAjK+33eEF4?=
 =?us-ascii?Q?6HrbEgVfximK4Uyh53oTZLyaIVYNylwYog6XXcirSCW2x4fza9zrEOWiYkrI?=
 =?us-ascii?Q?+WjYVErEEWsULJKnS6sUCgV38Ux+hd5d6iojHTEFijembvWNl9hVyt/DlRVw?=
 =?us-ascii?Q?kaa2SIBLD56srrEPFfrjMGr2RgoCrv0VYqZ/7hde0jy54dnHJMylpCsXCfsQ?=
 =?us-ascii?Q?48K33Fjaf4k5HJakSt6DHTQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c16b9d5-e7aa-48d3-3a64-08dd5602e3e4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:14:17.1388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bT7zs/K7zdnHUQa7CYoqndmUDlTxyWpq4h+VDVawOiC1ac/F4VS87vU145iCsldknQqQJaIA2p9VX0DlW9LMG8HB1td8g85RhhB1+NzMaDhkTi6r4KJ+uskMOyUO3k/9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11771
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


Hi Detlev

Thank you for the testing.

> I got same report from our test team. I'm now tring to solve it.

It seems our test team and your team are encounter same issues by different
way, and it seems it happen if some kind of deffer issue happen (?).

> That being said, I'm not sure I completely understand why that extra line fixes 
> the issue. Is the __free() attribute smart enough to know that the pointer has 
> been copied and not free it at the end of scope ?

__free(device_node) attribute will automatically calls of_node_put() when it
lost the scope. By below patch, graph_util_parse_dai() will use
__free(device_node) and thus dlc->of_node counter was not increased.

	419d1918105e5d9926ab02f1f834bb416dc76f65
	("ASoC: simple-card-utils: use __free(device_node) for device node")

In such situation, if some kind of deffer issue happened, xxx-card probe()
will failed and calls simple_util_clean_reference(). It calls of_node_put()
for each dlc->of_node, but above one was already called of_node_put() via
__free(device_node). So you encounter the error.

I'm not 100% sure why dabbd325b2 commit removed the issue, but I think
it is just luck, I think.

Thank you for your test !!
I will post the patch with below tag if our test team could confirm it.

	Tested-by: Detlev Casanova <detlev.casanova@collabora.com>

Best regards
---
Kuninori Morimoto
