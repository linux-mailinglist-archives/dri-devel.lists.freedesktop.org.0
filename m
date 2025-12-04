Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7645CA566A
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 22:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445D310E225;
	Thu,  4 Dec 2025 21:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="r8G/RaJ8";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="r8G/RaJ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013009.outbound.protection.outlook.com [52.101.72.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A14C10E1FF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 15:20:40 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gzNunFyX3eLF5NECzn9JxlfrByNSp8y0Y4rbI/vjyVk60Vzn3ReZ8L/gyfIWm67UNMvMdFUdknYMEmCWTOkaoWtMk6Rr5jOQZqGFzRWQ0YT/Ka+1KEpB4tvLaxH+1s+WRG+pLldIddMH7J1PkBR3kMXRonlAyfXzL98vGPkgJBFXARqpLWrDKP8L3npWkb24gxa0PJqI2mnqgYJ47keUFnzzY9ZHuEEpPersezpeVj/iuXgP4h89Hc3t6td/urbcVPwMmDe5oYw68EUsEeUGfh5A7b74IatQ2waa27cqfq5wq2vHAWi4NcrIuWv+0MpdnDzC5CeHR7/JywoNl7lhJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fnembkVEEDhOuZIXW2Z8rntda6BnxuiIQu+AOaXMyk=;
 b=QSvLEUUNbqULnJ+pDWfualFO/puspYeKp7I7GjsaPBh6uXyoS5M7MAatuzeF20cgae1PhTfYk05L9FPHQEsFbVI/0odx3Q3O3PQT+FEAEHQl4m/fVedS/wMyjrbC9JBU26yZJXkjggtjuMvml/e2IPBVlUZMrXdxkGPTlHSyph/CWCNB+L3fb2cYtIY2LZkqRm0ByHVS/+bHRlrcXkgUF0r1ISKYhDoPzD4lAbuVs5a5a0od4NdO/ckJTTx4p/CEu6Ucn0B1vL3caWHLtTrunek9Uafia8x5C2cCsn1ZVl8/osNTV20cfXeu5ZhYmWHwx/TMxCGf7+l86wARPioYKA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fnembkVEEDhOuZIXW2Z8rntda6BnxuiIQu+AOaXMyk=;
 b=r8G/RaJ8L9DN+7i7aTFuCWC6xltvn5jTQjhh4abF75nc/sZqTVdQm+u4TKRFEDi6jFt19xLdwoU+OZ10E72z7pyYxhyknGPR7u7Fyla/XCNQSqwvNZ/a8MOvh/Bd9SibCh2SnuAUHNvCySBgbHnCpjUD8PPgvze5YYaoVTzxAqA=
Received: from CWLP123CA0205.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19d::7)
 by AS8PR08MB6582.eurprd08.prod.outlook.com (2603:10a6:20b:339::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 15:20:33 +0000
Received: from AM1PEPF000252E1.eurprd07.prod.outlook.com
 (2603:10a6:400:19d:cafe::8) by CWLP123CA0205.outlook.office365.com
 (2603:10a6:400:19d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Thu, 4
 Dec 2025 15:20:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252E1.mail.protection.outlook.com (10.167.16.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Thu, 4 Dec 2025 15:20:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZuM8GSTDoUcdThzA3iRT9U5hWhfb2kBjN7cSZUMV4jYLDfCd1fBERyvgCYwCraEQsF0NGnXjBUcYrShIdyfZR6+xC6oyEziAeoVMEuX/8c6gZe+i9OEs8gyP3OFV+uwuq6o0BKyIRA5GIj350iE0zSXmsjMBzSyZW6hbha4CyN+fdnZsFqHsLQ1lfrEaSAxa81RCyCKGKaSkbDEZsyXiTyGH8ix/pbphjILIcu3sIfFpreauG/nFLFcyRuMhjibJxapSuNfyC5Wb48odjt/BuLA8UKOwR/SKqh5n9T+C2ywK8ZHIlcz9CYefojmMcX55WK1Jr6cQHcoQEnjP282QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fnembkVEEDhOuZIXW2Z8rntda6BnxuiIQu+AOaXMyk=;
 b=ENXtcb6AWU0Efke5pY0J66IYLJpIosO0R7WWcLKSsadfN5H1srWfYQIVnAIQKepoDZK4C/gdUFis9Qey3nBee1HqvnhbY+KKYMTJX7LeZooxHzqqcSeCTHPz7prX256SGbRTDPe5gh1SMA+UF33AOqvcxSd6sZp34q2OTz3nJcKvnqogI+Hfr/tQFio2NpuM2fWDJuz06eVrJU7aP9z2IbhWMnzOE/0HuV3dbTm6W+HLD2J2c0j958ndAmwl95z92hOOgOx77An3YCi8bxwhS+tGRn2+KXtU79gY9MqheeO405St0w0q8NJUf7jAROufY9U32zPzxpquNhBxeWM+8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fnembkVEEDhOuZIXW2Z8rntda6BnxuiIQu+AOaXMyk=;
 b=r8G/RaJ8L9DN+7i7aTFuCWC6xltvn5jTQjhh4abF75nc/sZqTVdQm+u4TKRFEDi6jFt19xLdwoU+OZ10E72z7pyYxhyknGPR7u7Fyla/XCNQSqwvNZ/a8MOvh/Bd9SibCh2SnuAUHNvCySBgbHnCpjUD8PPgvze5YYaoVTzxAqA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV2PR08MB8368.eurprd08.prod.outlook.com (2603:10a6:150:bb::7)
 by VI1PR08MB5341.eurprd08.prod.outlook.com (2603:10a6:803:135::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 15:19:27 +0000
Received: from GV2PR08MB8368.eurprd08.prod.outlook.com
 ([fe80::f88b:b5a0:3f87:e5a]) by GV2PR08MB8368.eurprd08.prod.outlook.com
 ([fe80::f88b:b5a0:3f87:e5a%7]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 15:19:27 +0000
Message-ID: <b0a801b9-5d09-466f-af20-46bb136d75dd@arm.com>
Date: Thu, 4 Dec 2025 15:19:18 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] drm/rcar-du: Modify custom commit tail
To: Linus Walleij <linusw@kernel.org>, Vicente Bergas <vicencb@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
 <20251202-mcde-drm-regression-thirdfix-v6-3-f1bffd4ec0fa@kernel.org>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@arm.com>
In-Reply-To: <20251202-mcde-drm-regression-thirdfix-v6-3-f1bffd4ec0fa@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0185.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::10) To GV2PR08MB8368.eurprd08.prod.outlook.com
 (2603:10a6:150:bb::7)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV2PR08MB8368:EE_|VI1PR08MB5341:EE_|AM1PEPF000252E1:EE_|AS8PR08MB6582:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f40130-8898-433b-16eb-08de3348aa5e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|366016|1800799024|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?QWl0WG1YelFTaGNPMS90VDdLNDY2MlBxNHRJb1BkS0FYdjR0UERBRGgrUEZ3?=
 =?utf-8?B?Z0FSaGQvMXR5QjdmV2R5ZUdZbzFpTzhzL0VtVnJZOUUxcWlsSmhtc2o2cXFU?=
 =?utf-8?B?T3NCOEpUQ2ZnNVpiaWw2TStkYk5vZGJQcVdBWnZCdnU3cC9ZN1RYZ3RrVEsv?=
 =?utf-8?B?ZGNZRXh0RzdhQVBFWG00RWhaclYzakRCTWJQT3V2L2ZqdUxqRmZFMnd5SHFa?=
 =?utf-8?B?UFVITkRVUUVHQ2pQZklScEFpVVJBbnBERHVVVlY1VVp2RmhtQkk3Wm9mUVlS?=
 =?utf-8?B?bDI3R0h4ZU9WVUFXa0trWktvdlZsVWREZlM4aVEwZWFLb3pKMFVVU3UvQ3h2?=
 =?utf-8?B?cU1JU1JZUzM4cGtLNzlSaTJkV3JXd1JqOHJUZ3VBUFgvTlhIRHJIbmhUZWV4?=
 =?utf-8?B?ZWQ0K2VhMGlFVXRmSlJYYzh0SzY0K1BuOUVidU96bFgrV0g1a0JDMkdLMnB6?=
 =?utf-8?B?V0hJRDdrUTNWV3dMbXM5RXBONlJmdDV6c3o4SFNDWUFGM21GNUlER0NRbW9H?=
 =?utf-8?B?WGxVY1RPQWxSWVFVUWw5YXJmMHNrQjhRa2hsWlE5YWplZmg4TVlJSjBPeThQ?=
 =?utf-8?B?Uk04RG0xaVIyeHgxaGZEcnl1NkExVE1rZmFNeDNGMWlxRnE4eU9wVFdTeXJy?=
 =?utf-8?B?UE9zamtOcUl3ZUUyZUFnaFUvTVZWbFFrOWdMUGZqQ1QrbmhIYlJaYjNRT0xi?=
 =?utf-8?B?V1dudkRxekZ1ajVXRFhra2h2SEFZWTN6YjJ1S0pwQzViZGhmZjB4VW9NdjZQ?=
 =?utf-8?B?MGtUWmtNUVdJcXJYSUJxOFZUQXFXcWpoZEhJaEZPMTFDM1dqb252blNrOXl5?=
 =?utf-8?B?VEFOWTdlQ1FRanBMMzFQU1FQS3RRN1Btak1RTlpHenlJeitwMWhxaXRZaTRu?=
 =?utf-8?B?eXFML2FZeVY0MW9KRTduTnh2TWk4K3RRNnk0MGl6Zi9QMWo3WlZlRS9FTkNw?=
 =?utf-8?B?d1dLRGlSdDZFU0JtbEJuODNocjFrQWNJekxOcHJLcXBXdFR1ZkZlWk15RitP?=
 =?utf-8?B?M3ZJclNYdTV2cjE4TXdKVlFGQ0lDRXhNdTJ6ZzRTV29JTGdnZXdnQ3dQZVMy?=
 =?utf-8?B?UWhUT0RPQ3UwY01WWHQvbC85MlhjMlN5QlJUOWpoYi9Pc0VWSkxacTczZ24z?=
 =?utf-8?B?eTA2TFdyMlJiOS8vbnVTeTd1S0h6TVFBZE81ZGdvempENktlTFhUUWwzNEpD?=
 =?utf-8?B?TzZ6RGFZL3VSMmhBcWZTaDhMNTVTWXhyaFB4cFo1L3FkYVMwVDU1cmJIdGRK?=
 =?utf-8?B?S01hQUxIZE9RcURFWVBWcmhHVkhrUDhtRFBrL2dZWHpzeVFOelNaeWUyZkFs?=
 =?utf-8?B?dm1UQzc0YzdXTlpVVDhYamY2YXowOTE5Q3NqVGZlWlZrenpaeHQvd0NRcCtz?=
 =?utf-8?B?czJ6ZEVOQUNmY1JacVprRGZnQmNhSUY1VVhNRzgxNnRKeFlQOFpLcEVDMEdN?=
 =?utf-8?B?KzBUdkNXODEzSWxJWnMzR04rS04zdm1XQ3NITzIxbkZreFpRYlVNTjNmaCt4?=
 =?utf-8?B?ZThwd3hvektYOXFwUnhRNjJUWDVwT05zMjhMTXRyZVpBSk55eTJwNm9JQXZ6?=
 =?utf-8?B?MTF1K0gvYkhNTjFZeHRicStDTG5ORTM2RkdKN2d0TGpLVFBLZWtPaFZOMFd5?=
 =?utf-8?B?c2hPMWpab09tMVVQRTUrUXRYY0cwcy9RSC9XY3BNZytJa2pVTHNQZGVzZlZ2?=
 =?utf-8?B?R0U1ZjFxU3IyOVlnVUFvcW1oYU1YS2Y4WEROc2g3M29Jc1prbHkzRGVvWE1B?=
 =?utf-8?B?L2JhRE1BaUQ4L3Vwdk9vWWdQNEtEelQxa3Zwb0RjSnM5RlBQUGxMbkZJc1gy?=
 =?utf-8?B?ampoTFFlR01xaHBoWHhGMW82VEcrNnAwVnRmbjl3emxKOWJnaHJsVTRMeVFs?=
 =?utf-8?B?OFdIZGtnOHdsRUlqeW52V0FSY3g1Rkhhc2lkU2FQc1UybWEydWlRajJIeldr?=
 =?utf-8?B?WW94d08rRDZiTTRXVDNFRDJ1OHV3MWhNOUFPOXVjQmtLNVJqTEJqeTIxYllQ?=
 =?utf-8?B?dFdUaVo0WFBUeG12eE1RcENxMXY2Y3gwZGljTklNS1UrYXYyTGZrRENrd29H?=
 =?utf-8?Q?XKbvXw?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:GV2PR08MB8368.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5341
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4fc37009-5913-4a36-3bc4-08de334883a7
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|36860700013|7416014|376014|35042699022|82310400026|1800799024|7053199007|13003099007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWpqZFVLUGFzamRWd2dKRU5NR2MvK2FiNUxGL0pQVDlaNXhjT3dZL1FTaWZ2?=
 =?utf-8?B?OHQ5a0s5SHJEOFpYZnpZOVpUcEY2ZjRwaCtKK1Bvck1CcjdvdkNYNzdURlRO?=
 =?utf-8?B?Mmp3V0ozbHpFU0lEQ3ZCN2hSV1RoUzFMTG5OMUFkamhQbFFYQlBrSW41dXo3?=
 =?utf-8?B?aGNubFBnalJHRXp5aHBBdlBJUWMwVEpDb3UrZU5pZUhWcmIzb1owZVBzZEV2?=
 =?utf-8?B?ZHh6ZXQzRytzcEpjbFQ3Zi9mOHY0WEYrQlVJYUZVUVpCalpvQ3BmTmJmem9q?=
 =?utf-8?B?d3F6UmhjMDRWbGJja2tWcldtSm02bEFLTTg5a0hOTWZ6VmxHTnRkdm9wMm1t?=
 =?utf-8?B?TGRUYTdSTnIrT3BTZkc2M3JwSXZoU090cVlLOGJjYy9TUUJ1Z0RueG5jOXJw?=
 =?utf-8?B?VVdWcXNaT2FoVDlTdVBSS3lzL1JuT1pRblFRbmF1K25uUDhpeGtzazQxdk9T?=
 =?utf-8?B?MWdwaTJrZ3lSU285Rk4yUGtSOE5ETDdrYURzYlgyMTBmQVhsV1RnYk1Gb1kv?=
 =?utf-8?B?ZFI0YUFNYmNzTG9Obm1SQnFrTFpHYTRYT2Q2cENrdVVYSkhwSFZad3VFa25w?=
 =?utf-8?B?b2tYc0ROYTdWNklENEZuNStzbkU3STYxb1JWOTNpWmt5RVZ2a05DN21kYUM2?=
 =?utf-8?B?QXo5c0pRTGZGTDlUeWp0SytrY3JpdmNiSURoVnRIcllMdVo5WjVlUFRlMlFp?=
 =?utf-8?B?NVJjL0VhWGNkZU5mVUd1MmlFNzBGM0c1SVVMcFM2N2pHVVhiYVRjVUdUZzNO?=
 =?utf-8?B?Uk5ZNkJxakVJZ09SdDExT2V5MGpMbVFheld6emFJTm9ldXdRMk43dEYrdEEr?=
 =?utf-8?B?ZWd1SE9jTjlva1h3U0U3RDlWa3NCUklpdGR1WjV5aDBaRGFGTEV0U2gxRVlQ?=
 =?utf-8?B?WTJtbGZYTDdpSHF2T0R3YUhxelUxUHRzTWdnOFpEQ3phc2tnSXRyR2RqSjVr?=
 =?utf-8?B?dWhyOU1TR2dVOEVjQWo1VnZkbTNEZmFhWXo2aVRRczNZVVBhRmtsWjcrWk5Z?=
 =?utf-8?B?QlZxMk9qMmYxN3poamhrdXlFdUVHeDhlRk1xVFNqbWM1NnYvK3cwSXc5U2tK?=
 =?utf-8?B?dEdCL0xFTVY5amtodU1TK1lTbThseTNHdStueGFLaDROZVV0QjFKc0tjNTFW?=
 =?utf-8?B?aUNKbkl1S2ZxR0RDYjhYSFpTVHhvaWt1QW1HSXpVUXhuUmpVb1piOWxQY2tN?=
 =?utf-8?B?TUY4QmljVjNIY096MGY4akRwWUNyVEZJZmJSQWJZaWF1ZTJBQUwxRUlKZ1Ft?=
 =?utf-8?B?Yk5HL0JWMi9KK3NXS0JZbURYUWJaOTByOHYwYTNUVEJZbFlHOU9QUUo1VnBo?=
 =?utf-8?B?MEN0a3BFUmRvS2NjNWxWR3ZuNHRXL3RySmhkaURSbXhlVTRRSy9aZWpzcTFk?=
 =?utf-8?B?RUgwMkgzY3FQK1Foako3TEZ5UVdtdjh3dFhvaUtqeUNRUFluRWVrOWR3OTAv?=
 =?utf-8?B?R2w4MmpmN095WUpGWWxTT1RnZktCdjNHRGd3b25aYVdZbXN6NWN1cldvTWhv?=
 =?utf-8?B?NWJCbEMra2JmaitFanVSamdoMkREQjNDNHhmQWkxYVZrN3FuY0duWE4vZlRK?=
 =?utf-8?B?blZzdmdCdEZ2SGdYalR0d2o2ZWVGRGtGNE5RYnEwVFA4R2c2VWRUZjdKR2tt?=
 =?utf-8?B?L1Vyd3VyWWp1NUJuN2JyS2ZSbEpDOWNXWDY2OXBQTjdyRWdLQzdVNmFQOWFW?=
 =?utf-8?B?Nm5DTm1wRkdqWklKQXJCbzZyYTExdzR4RzhUbGhmNWhrditaam93M2FDbzIy?=
 =?utf-8?B?VDV0S0FBZE5rRHFiRWtaR29JTHlVb0FPNEo5MkljanhuTW0rb3RDUUY5aUZQ?=
 =?utf-8?B?S1pjL1JHZUJUUmt4Q29oUnBCY3JkTnBlSnFPb1BWclkvaTBNOFgzSkZsU0gx?=
 =?utf-8?B?OWROeHZyRFJYMGorQWpKR2pHdTR2WEZSZk95RWFUc1dieE94K0NlN2NtTTZz?=
 =?utf-8?B?bWdMQkQvTVNRWWxILy9LbmF0eTlWNXVJaFYvMnp2RUowK0RxUWhFd1ZxTDVa?=
 =?utf-8?B?cElIODA4b3ZwS1FLNzJRS1Y2MFhTQ0JDbSt6QThEc3RQUFNBL0pqdVhodHgw?=
 =?utf-8?B?ME5CMnlJSmxiUHFNWkhYa0NKREF2ME9KUk81UnlTZVBsSzZUSU84M2NmMjVZ?=
 =?utf-8?Q?gqnYNIy/gC0mTUVRWAwEMrh/L?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(36860700013)(7416014)(376014)(35042699022)(82310400026)(1800799024)(7053199007)(13003099007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:20:32.1142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f40130-8898-433b-16eb-08de3348aa5e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6582
X-Mailman-Approved-At: Thu, 04 Dec 2025 21:01:44 +0000
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

Hi,

On 02/12/2025 21:02, Linus Walleij wrote:
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused regressions in all bridges that e.g. send DSI commands in
> their .prepare() and .unprepare() callbacks when used with R-Car DU.
>
> This is needed on R-Car DU, where the CRTC provides clock to LVDS
> and DSI, and has to be started before a bridge may call .prepare,
> which may trigger e.g. a DSI transfer.
>
> This specifically fixes the case where ILI9881C is connected to R-Car
> DU DSI. The ILI9881C panel driver does DSI command transfer in its
> struct drm_panel_funcs .prepare function, which is currently called
> before R-Car DU rcar_du_crtc_atomic_enable() rcar_mipi_dsi_pclk_enable()
> and the DSI command transfer times out.
>
> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable=
 and post-disable")
> Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Br=
enesas%40mailbox.org/
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> This is a modified version of Marek's patch using the approach
> from MCDE. I'm pretty sure this driver also needs the original
> semantic ording during disablement, and it surely doesn't hurt
> to restore it too.
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 33 +++++++++++++++++++++=
+++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
>

Acked-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
