Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62AB9D1DFF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 03:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3903C10E0CE;
	Tue, 19 Nov 2024 02:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="QSmBGU4U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE3A10E0CE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 02:16:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ju+lZDq86o3cV/bWe6p/88IEK+I/twJfHCsBlRQM2PUgFYPk86X7vChFEKglhFs6DxNYnFKBxDU0Vx37prFK7WFO41tgP3DHVR0pT4Hcb2sLA4EJ6i5qulFQ8h3itY55v3TSAVJ3cQ8qUalqARfzcG6/q+HA+318u/1yTIU8ScI8BLZGtjfC7zl1NcFGS1y5owNhNC4FBPOADjqbau0pwV5L7XmYSZzEFwrLpDQXMi2BCkavEsRB8dTqBlu8JLZjQowJTY8wscJkgaRkVTPi+ws+vHKOHlWweOGS85ntt/wmLICcw0+9vm8VeA1DR07E3Sxg0YXSDATy4QLYcBeQMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCBk88Kd4V+b6boHMcZ6FEvEwCkcFJY7jU0eMlF9U1g=;
 b=TlZMgeLo2SDKmBljnNtCxofkKP5Un+0dKJF+SmR+pDprgJX+PrQtfP1UXWZWpJDhJ2nfUOYJ5ZP9sG+QiXYzCF7GQsQ3U38b6v6sKWPNrBRsRbrbacfbjDdhe6etRuFg7gtZDZ+cFQO7SN8xH+z1XtAo8UF90MRowpHujGaTPlEN8B/ax4fT3XeFs5cJYCnNBMZlN6kzryo6gau/ljcNVIEFarnHZvlVVo7XKMPKxQFaUipPSCFpmiNQO25D6JQ4X9exWAk6SakVSk91QUqLTFtZ5MvZWsPASoxitwAF69M0MwlBfWO/BbJ6vu2gvoWCvLR+5DCEZAqkjDGxeXiDbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCBk88Kd4V+b6boHMcZ6FEvEwCkcFJY7jU0eMlF9U1g=;
 b=QSmBGU4UM4NXdEX+whSjkTjhSW5fbMeg/Stq5z5Z93eOML+Dcgf4Bwyfk/5cwfqw/rwGSMZJNWj2cZqkdS29PcQVRBvwtP5/1I/7PonMvcTB5T0a20miwvScYvhsU6KczT/gBVbzVACkXfq70ufdzMvHz2d1LmnFbmgYGokvgYXBE+Fa8h/QwI8XenjC2p+cBrlULTogsqJI0d4OO7MQo4yNEbGFL/GAB5KGCj8g4qykJenimDVDXnyD4/Yb0/xGB4zm244AB+1KKNcBxTyAt7gbuj+EBmHY9dg9nxMg61+ERZFM5bEbJd915RKZlKnOpIC/x08Z6lZVBx+Q8MDh/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBAPR04MB7430.eurprd04.prod.outlook.com (2603:10a6:10:1aa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Tue, 19 Nov
 2024 02:16:27 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8158.017; Tue, 19 Nov 2024
 02:16:27 +0000
Message-ID: <65fc8309-a3b8-4323-9431-8ab77f571d49@nxp.com>
Date: Tue, 19 Nov 2024 10:16:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/13] drm/bridge: fsl-ldb: Use clk_round_rate() to
 validate "ldb" clock rate
From: Liu Ying <victor.liu@nxp.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com,
 mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com,
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de,
 nfraprado@collabora.com, thierry.reding@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de,
 biju.das.jz@bp.renesas.com
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-4-victor.liu@nxp.com>
 <20241030-hypersonic-tremendous-tuatara-2bbeb0@houat>
 <9a438c25-5d37-444b-b3aa-9a081eaf30df@nxp.com>
Content-Language: en-US
In-Reply-To: <9a438c25-5d37-444b-b3aa-9a081eaf30df@nxp.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:194::21) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBAPR04MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: f097a303-da29-4ddb-885a-08dd08402c24
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1lmVTB4RHdnMmJNSkh1SW9PM0tpWFIzZkd6d0tkU1l0bHBTTkhXV2VCQkx1?=
 =?utf-8?B?aElmQjJtWmpESEFHejhDWE12cFRaVzd4bUJVQmdWWWJBRzhsOFZqV0pNeHdx?=
 =?utf-8?B?U1h4MWVpTmFNU3FCNS9DNHFnRUtoa2trMDJzaklGQXFGdzN6MEtveERKK3hE?=
 =?utf-8?B?dzNKdzJFNXpTTlUwV2Zqb1VHZi9SRVpkMG9VQnNDMnJEQkt0dFNuTmYzeE4z?=
 =?utf-8?B?cWdiZnFtYklhNm9DWnNQYmxiaWpVM0NyeDJLd3FsZitPL2daU1lRWHE2dG9l?=
 =?utf-8?B?MEszWHkyUExCUjRRSjNTakw1aVdtSW5DUG0wOUxmL0RhTkpVa0xYdDZNV01E?=
 =?utf-8?B?SHpKMUxhU3pLNGdDT2taS3I4OHBRMmpWbHZ5eUpaRmxxZytKTlpjQU01Z0V6?=
 =?utf-8?B?WW96dWVmcFliNjJ4SFY4cDFXMnF6ZUNLbk5JSzAwKzFxWEZoWUhncjBYZUl2?=
 =?utf-8?B?NjNaSEVlNnlNc2FaSy9UZitJM3NYQ3doTk5yTUpwUWp4T1NQN2QybGlMWkZW?=
 =?utf-8?B?NDZOcEVZclFOSkRYZmlGOGNwb2MvK0t2VHltNXVsVWxFbmRVMTNDYy9WM1Rv?=
 =?utf-8?B?dzVWT3J4RWNoMDVhUTYyeFZvL2lVdk5NQ0R5QVFOQSsyVDZSMmhLMEFLWWs2?=
 =?utf-8?B?QzJtS0cvUU1VaUJ3ZHF2ZkN3eGYrdUFicXhZSVhXdWZ0b1lRVHdzOEdyUW9M?=
 =?utf-8?B?ZHRKRGxkVnBSVmJpcEFXejA3YkpXdVhadjN4NXdRdjhPK2xQNGxRcWdlUTlV?=
 =?utf-8?B?Nm40Y215U0NwbEdjWFk2bkowK3lWcnNwL0syaDdNY1FIM1U0cy9iYW9lMUpN?=
 =?utf-8?B?MDRSaFZ6VmtMcW5XS1Q4dVZPQ3pSdFJ6WmlMRjBXRmNYa1BjUkhkRk5URmdo?=
 =?utf-8?B?MXVBQjNJcWhueldOODRsUzdJVFlaVXZabUx4UkhwOUk2RHlGQk9iOXRYVlo3?=
 =?utf-8?B?YUxwSmJnd1hzeGZtc1Yydm1qOFZGdThBK0xVT00xNEVmQWJkSkwzdG0zUU5U?=
 =?utf-8?B?VExXdVk5UXNkNzdxTmJpWHV2aDR5UWt6bGp3ekcrVTRhMjQ3RlRGWDR1Q2tG?=
 =?utf-8?B?SFp1WFBrcWRiUStGbVorRHdadHVMZFdYZTJQSW9pVDRidjBzVEMyOGVFZXFZ?=
 =?utf-8?B?ZlZNZisxa3g1UUR1N3YvMys2N3pZSXQ5Ry9qeUF0LzJPWkVhM1cybExNK2ZL?=
 =?utf-8?B?UUp5ZWtrYi9vNCtHdjNXUEZCMDVZWkloUmtZV3poaFhOODRtZDNjV2piMlVt?=
 =?utf-8?B?Rk5oQmRoMVg4TjZuaXROQ3N6Ukx6QXNwYzA0MkVqc2RxeCtYTXR1Ti9rYTlM?=
 =?utf-8?B?VjFzdjlLc2NML3ZTYjVlUEF4Ym9ibFYvWElxV0xWV2l3MHcwZkpsVEdwdGdN?=
 =?utf-8?B?Y2RLeEpCbG5nTVFsSHBTOXBPaWRYQjNLQ2EzMlNMcHJReTNpU000S2s1bHBJ?=
 =?utf-8?B?WjdqcjBRNkhNQ3ZxODZlMU52ZHd4SThvUUo2Z2laWllQdWVHYXVtNkoxRG1Z?=
 =?utf-8?B?VDV1QnZxcjIvemdlSm82M2RQUFBBUGJLMW1pRW9hQXVkVU94ZDlzT2NsTkV4?=
 =?utf-8?B?TEJmT3JHT3ZOMWN0ajM4Y3FhMVNhcUJ0cUNLRHZpMWoxd0NGR0xHWUFFK2gx?=
 =?utf-8?B?V0ZUYkNwMVZEanlKSlFIVG9qRE85UEUzaVpnQzg3QTZXelZjUVZqekFOZ25p?=
 =?utf-8?Q?KJQWqfthdN5dn4JWBMYj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUtpZEJSWDFKcWxEaXRjNE9GMmNTcC9JRVdSZWFuamlVR2hneVB1N2trN29F?=
 =?utf-8?B?Qkcyck5RSHNmOWVHV3dHM3dVTW40Ni9UUjg2Q0VmQlIxckRkK0hsU0VJbUpF?=
 =?utf-8?B?Zk5yOWI2RWFVOEJuczlHbzROdndLQWk3NHBRKytjcFNNV3RMUDVsVlUyUlV1?=
 =?utf-8?B?QVlSaVEwaThmL2pPWGVjN1Y4TU9jeW5pUEZWUy90czNmYy9ERnJNc3N3eFVQ?=
 =?utf-8?B?UVFkL0lwd0R1RDJQUEdGZkNrUllJSHlPNW1iMGVFcDBXZDNJY2MvcVJua1ND?=
 =?utf-8?B?TlAvSTdpWkV5bDdxampRZXF2U09pNmFrRnRIVGpzZGdFQ21ITDA5cGErVndP?=
 =?utf-8?B?a3EvR3dyc3lZNU9oMExYbGhtV09EcUlkS0Q0bUI0a0VHeGdha1JQTkxGdHZG?=
 =?utf-8?B?MjdMY0ErMkxhR1RlUkpNWEcxa2J5NUQ0OWhmSVRnaVc5Q3NNUFlFK2taMWho?=
 =?utf-8?B?VDlVMHhLUCtianIzaFUvakYwM3A5WFNTbUUzRExiVVRTTnQ0TmlSbEREQXRu?=
 =?utf-8?B?MVUrTGRrRFhYZnc5M0IvM0l2WGlCbWxhdlpHV1JySjRhWXNtN0djaVFJbko4?=
 =?utf-8?B?d2hwejFkWnV0dkpKQktCK3ZaL1FuUlNMOS84dVdpVFVKQXVTMkM3MGpqVkdX?=
 =?utf-8?B?SEZwUk51SXBqUVM1ckt1TTQrTGE4ejhBUFVKNXpBNlEvYnF0Q1dTUHBGUkRi?=
 =?utf-8?B?YmF5RHNHTXpJc1k1UVFjTVgwb3JhWUFYUEVaMU84SWlyZUphaWhxVTBBa0dG?=
 =?utf-8?B?TUtWbVVtbHprVG40dUNpZ1ROWVN4YWEwYWRzKzZhOW55a0o0eC9tNTNUV0JO?=
 =?utf-8?B?TDNVYzg4WU5iT2N6RWRHK0szd1JwVHlVVHJJeDRvQnlSck1HdG1UVGhkTHp1?=
 =?utf-8?B?d1BZMzJua2ZCaURFcko0YmQ5aURVZGxPUEVjUE5VdjN0bnFSYjUvckZiR2FO?=
 =?utf-8?B?aGFvOHhnYml3bjZlNXBpbVFxaFZrdDZNeVd1NFppVTE1eUFNT1RFeFhIWHN6?=
 =?utf-8?B?TTVWR0JzYmdmenNzVFQyWWhZeG5STXJROEFoR25ld2Uxb3lzZG0yc0JkMkRt?=
 =?utf-8?B?QU5EV2M2bTc1Q2EzWFRDcUJSano1dEdFY3lzNGV2ZnpxOFVhUEkxMG53SW4x?=
 =?utf-8?B?WjN5N0t1QXdsRVhGblh3bExVaUFZczJ4QUZCcVBuaXF5QXYyNFlLdmJvQnN0?=
 =?utf-8?B?WkltVVJqL1ZEMnl1RFpXaGZBVTk4VDlKV0FGNzBGV1JXT0wrdzVxOVZVZnJQ?=
 =?utf-8?B?TnRRRlJKTm9KajR0aWo1VjdJaDYxbXA1UzAwYWEwZjlVdlYzc3lyeWpyak5V?=
 =?utf-8?B?aE9ZbThPSVNleVorckdDY1hKNFZRYjQ2L04ySG5NblhDMnVXSE1LYjIyWktP?=
 =?utf-8?B?WXdXSjljdW5BMllXZWJOZ2xuV2wrR1RDblVkendjOW5hSUFBVFNGYkl5RGRs?=
 =?utf-8?B?YmlZQ1daM3V0TS9mcnMxVWJxdGtnUlVoL2lubHV3SWpTQVFuTENaa0FETDha?=
 =?utf-8?B?ZzJ5cit4VFBscE9kOXg2NFRwK09RNjRjNncvVit5bTVLNHMyUVp2V3FYTWVj?=
 =?utf-8?B?a0crYUxoWGRLVEl1bmtWazYzVTdoQldzQkdRSHV5NU1oVzMzY3I0emtMT1hT?=
 =?utf-8?B?a2lZUERHblBlNkZJV1VxaTErSTR1VENWOEo1SkkxY0VOMmliakx2R0VDVHcv?=
 =?utf-8?B?b0ZHQzhRTGFDOElnbFZCbDZFNy9LVk9mT2swWWZrc0xIcXVZT2VZcFJGeFJ1?=
 =?utf-8?B?eW8wK2dKQytqZlRzOXF0OFJyL3dyNTdXcmpUczYyamVNRmV4VmRDK2hsQ1Vm?=
 =?utf-8?B?clU4My9wRnJOQ1VPdXovR3JSZXhUVmJXWHBkdWhhYm1UU2RwVlNWcTVJNHo4?=
 =?utf-8?B?NHo2MWMvM1VSWlRLdDlhWGw1Qk5QVzdRemI5WE5lUktrRVpBT3FCd2hKdWJz?=
 =?utf-8?B?MlZnRDZEb2krWjN2czY5M1I4WFh2Z09sTmJrSVlWMmhzRmZObUFpMTArRjdU?=
 =?utf-8?B?WTFpTEhjUnVQd1VkeTRIdUprZUVhbkNIcEtPL3JSdmhLR28xcC9ZNnp2am9v?=
 =?utf-8?B?SmZMR1FraFMrVDN2aFY2L01mQ20vNzhTS1RESk82SUZoYVdxU3MwckNkeHlG?=
 =?utf-8?Q?64TB0s/hzBOUZEbtswD+luEh7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f097a303-da29-4ddb-885a-08dd08402c24
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 02:16:26.9602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DiLL/2rMh5OlKAcCgTQqtrP5U8fR/fY7hoOciG6tqpnb39GDTwh8DOMDATKYCM2cxtbz6zFiSjqz7DMkPmMagg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7430
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

On 10/31/2024, Liu Ying wrote:
> Hi Maxime,
> 
> On 10/30/2024, Maxime Ripard wrote:
>> On Mon, Oct 28, 2024 at 10:37:30AM +0800, Liu Ying wrote:
>>> Multiple display modes could be read from a display device's EDID.
>>> Use clk_round_rate() to validate the "ldb" clock rate for each mode
>>> in drm_bridge_funcs::mode_valid() to filter unsupported modes out.
>>>
>>> Also, since this driver doesn't directly reference pixel clock, use
>>> clk_round_rate() to validate the pixel clock rate against the "ldb"
>>> clock if the "ldb" clock and the pixel clock are sibling in clock
>>> tree.  This is not done in display controller driver because
>>> drm_crtc_helper_funcs::mode_valid() may not decide to do the
>>> validation or not if multiple encoders are connected to the CRTC,
>>> e.g., i.MX93 LCDIF may connect with MIPI DSI controller, LDB and
>>> parallel display output simultaneously.
>>>
>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>> ---
>>> Note that this patch depends on a patch in shawnguo/imx/fixes:
>>> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20241017031146.157996-1-marex@denx.de/
>>
>> I still believe that the root cause of this issue is your clock tree and
>> driver setup, and since I've asked for explanations and didn't get any,
>> I don't really see how we can move forward here.
> 
> Since you asked for a description at *somewhere* in another thread[1],
> can you please suggest a place where this could happen?

I have written a description in the cover letter of this patch series(v7):

https://patchwork.freedesktop.org/series/139266/#rev7

If you don't mind, please provide review comments there, thanks.

> 
> [1] https://lore.kernel.org/imx/47d92ae0-c71a-4c18-9ad7-432c0f70a31f@nxp.com/T/#m587e6a25bdab542d5d99abbf01caaca89495b1d5
> 
>>
>> Maxime
> 

-- 
Regards,
Liu Ying

