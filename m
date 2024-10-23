Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9537F9ABDC6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 07:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA30B10E732;
	Wed, 23 Oct 2024 05:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="O+XFOPtU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2046.outbound.protection.outlook.com [40.107.241.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B00110E732
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 05:25:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R36ZfO5pOci7c9VAkn5RXMEKsfUS6Ha8FYlZ/PpgeVlTaFJiBZxlfmdIL40lO0EMpJFtPHPbeKIOU66aOZnZitYRKj4w6NEv7uJtO+SVI2eKKbYGWEcABTUboL4FLmRxen6pF5W4QPyQllLQhGKLuxuqRnnQNRRexstSJoEg/uLlJzys06qrHLe2dhbPC6rAnx8Fmc2DHPR7wSE76ClrlEhRLeM2Y1uG+fvgLI3SfdttxwgrhOBb++XXzz1/NQR7RQnB+cNHDVsX+XZAm7dFTKUFT/v1RzM+SrroG3UWo815eXTfI3t3scQRk8359R56D2+5OR1Bd9zmYDnAGhzAAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVTWFfDiaN015ZMSvMnd0i1AoYXPDU1YfrbRUPXEITo=;
 b=aH5xm9QNJgYZCzJKGUomQv+lKZWqhMaoTQiFq5ky3ZaOfXb9ylgPC9UEcCs3W8Rdv8ZOvnIUZfByaCm7ItRUll0Z/ZQ3q57pIgWQtVOvqkZr9uN0rVAIGn1Dm/iY4XCdDNf9CvwUfgjt0sROBDm901L689GJ0xyumzAuAkqbbS8tdJABkGyIBHc7Z9yyZy3YVOB60H0/aValpvT1qaWB5rCtYRF5fXSSROiUR2Ppe0tPZLACRyfaNB8Ccvh2CAvKjbo4NnF/j6c8KG3iItCM7EfqA8ifXtZUIpcbZ/X51dgwpRHmA8bBaf9hWhx9ib3Brd4GFDv24YmdSAMzpkD9MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVTWFfDiaN015ZMSvMnd0i1AoYXPDU1YfrbRUPXEITo=;
 b=O+XFOPtUZY4+a8Hz+8CHzKmleRPTvewWIiCgd1qAsvfOK8ET3attInDUsJ33Q4FsLtiU/wW5I6f3HZT0MDj5yjY6/wroFsJDdS8XOZsEDR6FUriYgpC1MykNtHoKDqnI5g6bC1z7PogNB4eH62fS7ZwMoLo5EcR+yNo/0ezAzYn734spXezNVvSQT2HuaNipRXMButuRa85s7Fol0WUQ3QjP0jw7A3yqnUETifl26cGc5kh8bmyQ/cVRHoDDmuy3YfTaP/KWsg2VYMiAVrIjhQPTHQRBybZpV6lG7m9lsn2iJ3NRnqZ/Wn3C4X6wVAu0GwNrJ1SBsDIWy7udHzyT4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8640.eurprd04.prod.outlook.com (2603:10a6:102:21f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 05:25:19 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 05:25:19 +0000
Message-ID: <41855af3-53bf-4a02-bd5a-9982becf2726@nxp.com>
Date: Wed, 23 Oct 2024 13:25:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB serializer clock
 reconfigure parent rate
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241008223846.337162-1-marex@denx.de>
 <dbede671-c97b-4ad7-8a54-f1b381fea082@nxp.com>
 <00ffd38c-b01a-40cd-9130-19c35a387ca0@denx.de>
 <819380c3-d13f-4989-b305-388fc60d30e4@nxp.com>
 <d99e0021-3253-4312-9b50-6031ae0f8d8e@denx.de>
 <d1307426-9a86-4356-93b8-9a10c8369ad8@nxp.com>
 <1f5e9559-59f8-490b-9cb2-2f8d4a8823e6@denx.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <1f5e9559-59f8-490b-9cb2-2f8d4a8823e6@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0224.apcprd06.prod.outlook.com
 (2603:1096:4:68::32) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d37faab-fbf6-479a-01d1-08dcf32315bb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGl2cWM3bnhzVWYweVpWeGVVK29tdUZMMHpCQ3RyeEZJajd5WHVPYXhTWW1p?=
 =?utf-8?B?WEliVUR3QUtaOWd5SGhoNEs1T3JIOXVvNWtaVHNtdjMxUDI3dHNoM2NhaFU3?=
 =?utf-8?B?aktUQStkdmx0UkUxMVl0eFUwUkJteFpld1ZuTHplTGRtOU1KUHZlZnpIS3FS?=
 =?utf-8?B?bmczS0NEd29QSVJTd1dEdno4aGdndjBtcWp2aGFlc3prQWo2RlM1TVhsa0NO?=
 =?utf-8?B?VnI1TDEzZEFBOTZtcTdvMHdNc29PSjhnM2FiTytPWGptcU55VmFyNTRyN1hl?=
 =?utf-8?B?SFpmMjBiNGJvVGRHQXpxQzVaQWJVVS9xcHM2WGpMcDdOZ2FIMG0rK0J0cUVs?=
 =?utf-8?B?dFdxU3JjczNGNkRHdEVvTnNPdHpyYkR5ZnlpaGJTY2JUNEVZUjBUNFRNbEZt?=
 =?utf-8?B?UTFSY1pjQXpSODN2Zm5VMjNTMjNEc2xJNmNXOTR1T1JXVHFReG9CaFQvazA1?=
 =?utf-8?B?Wi9sTUdmTFZST0R4ZGlTSG5XdE9qNHg1SmY4U2h5QzNYR2Jzc3UrNmZmT0di?=
 =?utf-8?B?SkIreHVWUjJSZUZHaDMrZlRlbmxDTTBFcmdkdDNyZ1NqWnoybi9iWG1pZlA3?=
 =?utf-8?B?TjIzNVlTTnpDYzhRMmtpaXpzNGJDdkFrQVFUNlkrNWxodEorK1ZOWkZiOHRI?=
 =?utf-8?B?ejF1ZUI3N2grRXdtdkRaUFpUaUlQZ29OSEZaOEtpQ0FTOEFPYVIxRWdLSTFw?=
 =?utf-8?B?SWxwWndWdUlGMnVsMnh4ekw4Y0QzWjViWE1VNUFvenQwaFlEM2RHTDROdk93?=
 =?utf-8?B?RVVVaEMzWDdqK1dvZEwvVWQyanpTbUYvTkQzWk9iWC9EVy9PYmErdW1BdmR1?=
 =?utf-8?B?VjhMaHV0ZkhPSmZpUDBGWUU4VWhnRWZ3a0oyblV1eDIxaEFVN2g0K2MvdWlk?=
 =?utf-8?B?Tk8ycnJEUDFib1dYdFAxbzhmNTlYY3RZNXR0NWNtTWc3QkxmOFFnYUI4SkNZ?=
 =?utf-8?B?dHgydUlDU0RlWWY4WTVYRTNVOXg1c1U5Q1ZUaXZ0b1Ezak93TldSZzhNNHIw?=
 =?utf-8?B?NkVWZmYwMkN2eWdvLzQ1YnFuUnZ1RDR0dkwzd1RvQlh1Vnk0ZTNFbnk0Ym9a?=
 =?utf-8?B?R3dWNnMyZUQ3bUtpRWpVcUpndkVBbW9KWG1uSVBLMExCemcyNSt0Q2cyUUlL?=
 =?utf-8?B?eFdCNWFZeVJRS3ZHNUZ2ZkovQUR0bGFwYXpkM1BkTm1XVk5tMnVOeFNBT3VH?=
 =?utf-8?B?K1djRm1VYmpSWFhYL3RZcCtsTDNaT1I5NDl5RmJldFp3aXM5VW1PTGJuRW1h?=
 =?utf-8?B?Y0EycWNpZzc2NFM3SC9YSStpV3hLellnZG5GUmxTVnd6M2ExZW0rQUc0VnpE?=
 =?utf-8?B?K2gvOFJWY3ZTTDNDZlFpVHBZVWdaSGlIeEpwN1Zib0lnMnlwb2gySzgzb2NJ?=
 =?utf-8?B?c2wvM1dDRmFGMzY0cGxTT3prWFdHNnJ1aTFHTUdBYm41NkdIVEIxRVZodVBi?=
 =?utf-8?B?UmJyNWhDVGNIa0hLTmlPbWdONU9uRk9DNXFKanIrNTZYZWVieGZ0MHFOTjNB?=
 =?utf-8?B?Sm5qdDRSQW9PV1B4VnpaZExKbGUrOC9QZldXOHNJQndUOFdBUzdhV2c3czEv?=
 =?utf-8?B?ZVdCb3hSZFZ1VFQrWm40YlhuTnAvVlh1a0gweWdNVEpEK0RJR3FzK2JHRzU1?=
 =?utf-8?B?YlRQMDNHNnVZRitHWHlqdjNveDYyWEpKZHM0N2szUFIwOHpLTTlmT0NuRUNh?=
 =?utf-8?B?KzVSUU14VFprVEVuYWZPOGJDK1hxZnZnVVNvRmVESGw2M0FBelNSbGs5c1ZE?=
 =?utf-8?Q?SLigoC3UHl4QHhgjpH/Nc5jXtAdMMLxekdh//Ai?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3VhdjF4cEFaY3RCaGlXaERSRFgxeEM1VGJXeUw0Ni9HSHVOeDJGU0NacXUr?=
 =?utf-8?B?S0hPYzBLd1MyQm9nTW5rYjU3KzF2RXhiNUVXaVVzTncyZkFGSHI0QkxqWWg5?=
 =?utf-8?B?cEg4aVVhK0FQak5idnNrTG5Cbk5TTEpvbjVlU256cGRiZTdhZU13Nlc3TEJ0?=
 =?utf-8?B?MzNSelAvMk5Bc0wwU3VWVXpTSVJUeHVvQmY3U2tRTHoweFdwWDE4M3FqbWlj?=
 =?utf-8?B?enNkcEdjRGlZK0dHZytJNXRZbVk3Y2pFMllGUUZhSk5pSzhTWFVyM3RYcFpm?=
 =?utf-8?B?Uzlxb2hSTmRWU0EwbGhhYTlhcCtiSkN5Vm9SWnZZZUg0TEhYMHFLam9CQVVX?=
 =?utf-8?B?WDJHVStQWStIbDFrWUZXZGoxczN5aHJBRWdDdWpUTVptbXVOalhHSTlldmdr?=
 =?utf-8?B?eDQ4dlFCeFdnNDZJSzN3Z1VMZDNYVWo0ZmZPQnZ3VGkyWFF0RVFPdVF5SnRi?=
 =?utf-8?B?clliSkIwRktkUnZDWlA1bmo4aFIzS1VJZ1R1RXU1S2RDRGRWWlJ1aVlOWk8z?=
 =?utf-8?B?MGhzUjBPalVNdHNYeWVzMG4rUzNVR3A4MkVDSldZMjRJMnF5MTRFOTQwaU9J?=
 =?utf-8?B?UlZKMGllYjNuUVZmSGxHakt1YnJhOHpjUnQrUXFwRlRrWFVRalVLL0hveEJ5?=
 =?utf-8?B?L2pIbWJ5UlNiTTliNndVeGhTQU51TFBWM215TW82eUpaME11dks4ck1ORGQr?=
 =?utf-8?B?eEF3YTd2Yzg2UjYrUSsyYWd6NUFGT3pMVkk2WjJlWWF6eFB2N1FnVEZtMlY2?=
 =?utf-8?B?WVNWSnAxWDFFaDdBT3R3RFE5Um8zT0RyZnB2SXBoQ1J5eEZCc0Z5YWgyM3ox?=
 =?utf-8?B?M3ZSZEJXb0JmejN6MmNFb3ZFWlBIY2w0Zk5jZld1VDZYSE9rajhkc3Q5bUZ3?=
 =?utf-8?B?M1FnMER6YXRhQldDY0VjVlMrQ0J1Y1ZIcFdBQXBIVGZVZlZ5L05kRmhMYXcx?=
 =?utf-8?B?VmtiL05GRDZjZ2pEZ1pSVm9iamZZR2NxUmZrbEpjc05Nb3RFbmNTcDJHK3pk?=
 =?utf-8?B?YlY3K2g0L2RXeHJtb1AyU2VXU2RYdkRPdUFqWG52M21QMXk3Zkw5T09SWVBr?=
 =?utf-8?B?OUg3VVBlM1hPU3NnTm5odVgvcVU0MjBMMk5lVkNNdmpycjdtUWV3MXAwa3R5?=
 =?utf-8?B?VUVNdUJTNUFiSEowanA4Z3NnQnRqbXpHNkt6Q1l4Yld3VjNNbGlybmxvN0ln?=
 =?utf-8?B?aXN3eUlNSzJVV2lrT3ZKSVhOSDdMenp3S2hKaUlyTFp0N3ZRYlJRZ2VJTE84?=
 =?utf-8?B?UkVFbTNUenc5RFY1M1RhMU5MY2FQbGJyOWxnRVhrZnpvS3dRM1loOVVHam9t?=
 =?utf-8?B?QThvTTZKenRjMTcrVzlLUzZFTHR2WGM5OGZJSUVCVGUvNWpvK2RiV3pzOHRu?=
 =?utf-8?B?cy82bGRnUkRPbGEyRmxveEluSUZyWnA4NzBHSDd4ZGh2T3pFMEczZW9HL3VZ?=
 =?utf-8?B?UExOUHlZR1huOGNQQUVGNDR3TnhxdXluRmIySG1uamY4TWpBWnFNRjhBcHdD?=
 =?utf-8?B?Y3NnazBkcXUyODhnbDljN3VqWDF6TXpEWnF3ejYrcllnZ2c3ejNMRElodUNZ?=
 =?utf-8?B?cmhGZ3hWaWZaL2tTUXN6bFVKQkxKbVBwaCt1aHBCeHJPdlJMSzhiWktiVU95?=
 =?utf-8?B?RllHY0MzNG40Z2R0TSt3U2UwK3lLeDc5WHRYUjJpd1pudnZZdUsxcmVTYU5R?=
 =?utf-8?B?Y2JPc3A1VE5pUmtCNTA3b0NScktBM2tKTDc5bEMybXA3RUJXRXJ6cEhMeTZs?=
 =?utf-8?B?L2JtcC9GSVBKYnNiYzVkQzFTeGQvRUhNY3V2b2FSS1ZieHpjeHZyVFRkMW5m?=
 =?utf-8?B?UzZmdlBUUGNaSnZ3dXI2NDUwK0RMK2l6UUNhbjlnMHh3c2RKVW5YcDRrYkR3?=
 =?utf-8?B?Y09JeU5SNUlMY1o3MVFFbExHblVROUxWTmRvdVB2YlhnOEsvdzBiazJOd1dT?=
 =?utf-8?B?ZDluMGJQcmhOVmV4YUtvbjRXVUNWZUZIeGQyRHpjKzJPWitTZ0pEMlV0aUdx?=
 =?utf-8?B?UGpGZVZ1ZmlFbFRWdkNVVTdoOC9sdjFremc4akRqK1Rtck9Sdit6eGxVSC9u?=
 =?utf-8?B?WFpITVFweFF0Q3lvZUxhWUswNk14Z0VjZ2w3dFkwNy91TjE3NWpBSkphOUxE?=
 =?utf-8?Q?qClndXNVS8XMfqUN3sWvXgigA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d37faab-fbf6-479a-01d1-08dcf32315bb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 05:25:19.4839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rp0iSquKGj+arsGqPUZNdZv8LjWlNOYGuhCwlLrLDun05j+rA7Ol9hl5TJOTCT8IQXRuHLZrRkE2v5kBaIK8aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8640
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

On 10/23/2024, Marek Vasut wrote:
> On 10/22/24 8:13 AM, Liu Ying wrote:
> 
> [...]
> 
>>>>>> This patch would cause the below in-flight LDB bridge driver
>>>>>> patch[1] fail to do display mode validation upon display modes
>>>>>> read from LVDS to HDMI converter IT6263's DDC I2C bus.
>>>>>
>>>>> Why ?
>>>>
>>>> Mode validation is affected only for dual LVDS link mode.
>>>> For single LVDS link mode, this patch does open more display
>>>> modes read from the DDC I2C bus.  The reason behind is that
>>>> LVDS serial clock rate/pixel clock rate = 3.5 for dual LVDS
>>>> link mode, while it's 7 for single LVDS link mode.
>>>>
>>>> In my system, "video_pll1" clock rate is assigned to 1.0395GHz
>>>> in imx8mp.dtsi.  For 1920x1080-60.00Hz with 148.5MHz pixel
>>>> clock rate, "media_ldb" clock rate is 519.75MHz and
>>>> "media_disp2_pix" clock rate is 148.5MHz, which is fine for
>>>> dual LVDS link mode(x3.5).  For newly opened up 1920x1080-59.94Hz
>>>> with 148.352MHz pixel clock rate, "video_pll1" clock rate will
>>>> be changed to 519.232MHz, "media_ldb" clock rate is 519.232MHz
>>>> and "media_disp2_pix" clock rate is wrongly set to 519.232MHz
>>>> too because "media_disp2_pix" clock cannot handle the 3.5
>>>> division ratio from "video_pll1_out" clock running at
>>>> 519.232MHz.  See the below clk_summary.
>>>
>>> Shouldn't this patch help exactly with that ?
>>
>> No, it doesn't help but only makes clk_round_rate() called in
>> LDB driver's .mode_valid() against 148.352MHz return 148.352MHz
>> which allows the unexpected 1920x1080-59.94Hz display mode.
> 
> Why is 1920x1080-59.94Hz mode unexpected in the first place ?

Because video PLL1 is supposed to be shared by LDB and Samsung
MIPI DSI display pipelines on i.MX8MP EVK and video PLL1 clock
rate won't be changed once it is assigned to 1.0395GHz in
imx8mp.dtsi at least for i.MX8MP EVK.  This 1.0395GHz satisfies
the need to drive typical 1920x1080@60 display mode read from
HDMI monitors connected to LVDS to HDMI(IT6263) and
MIPI DSI to HDMI(ADV7535) transmitters.  The transmitters can
be connected to i.MX8MP EVK through MINI-SAS connectors.  If
the MINI-SAS connectors can also connect to a LVDS panel or
MIPI DSI panel if the transmitters are not connected.

This 1.0395GHz just doesn't satisfy 1920x1080-59.94Hz display
mode with 148.352MHz pixel clock rate.

> I assume your display device reports that it supports this mode, and now the scanout engine and LDB can generate this mode too ? Or does the display device NOT support this mode ?

This display mode is read from a HDMI monitor's EDID, so the
display device supports it for sure.

The scanout engine and LDB cannot support this display mode
with the fixed 1.0395GHz video PLL1 clock rate.  With other
particular video PLL1 clock rate, they can.

> 
>>> It should allow you to set video_pll1_out to whatever is necessary by LDB first, fixate that frequency, and the LCDIFv3 would then be forced to use /7 divider from faster Video PLL1 , right ?
>>
>> Yes, it allows that for single-link LVDS use cases.
>> And, __no__, for dual-link LVDS use cases because the
>> video_pll1_out clock rate needs to be 2x the LVDS serial clock
>> rate.
> 
> Can't the LDB still set the Video PLL frequency to whatever it needs first, fixate it, and only then let the LCDIFv3 divide the frequency down ? (sorry, I am a bit tired today, maybe I am missing the obvious)

Yes, LDB driver can set video PLL clock rate directly, but it
needs to get the video PLL clock first by calling clk_get_parent(),
which doesn't look nice.

Let LCDIFv3 driver divide the rate down?  Not easy... You know
it needs to make LDB driver's atomic_enable() happen before
LCDIFv3 driver's atomic_enable().

> 
>>>>       video_pll1_ref_sel               1       1        0        24000000    0          0     50000      Y      deviceless                      no_connection_id
>>>>          video_pll1                    1       1        0        519232000   0          0     50000      Y         deviceless                      no_connection_id
>>>>             video_pll1_bypass          1       1        0        519232000   0          0     50000      Y            deviceless                      no_connection_id
>>>>                video_pll1_out          2       2        0        519232000   0          0     50000      Y               deviceless                      no_connection_id
>>>>                   media_ldb            1       1        0        519232000   0          0     50000      Y                  deviceless                      no_connection_id
>>>>                      media_ldb_root_clk 1       1        0        519232000   0          0     50000      Y                     32ec0000.blk-ctrl:bridge@5c     ldb
>>>>                                                                                                                                deviceless                      no_connection_id
>>>>                   media_disp1_pix      0       0        0        129808000   0          0     50000      N                  deviceless                      no_connection_id
>>>>                      media_disp1_pix_root_clk 0       0        0        129808000   0          0     50000      N                     32e80000.display-controller     pix
>>>>                                                                                                                                32ec0000.blk-ctrl               disp1
>>>>                                                                                                                                deviceless                      no_connection_id
>>>>                   media_disp2_pix      1       1        0        519232000   0          0     50000      Y                  deviceless                      no_connection_id
>>>>                      media_disp2_pix_root_clk 1       1        0        519232000   0          0     50000      Y                     32e90000.display-controller     pix
>>>>                                                                                                                                32ec0000.blk-ctrl               disp2
>>>>                                                                                                                                deviceless                      no_connection_id
>>>>
>>>> Single LVDS link mode is not affected because "media_disp2_pix"
>>>> clock can handle the 7 division ratio.
>>>>
>>>> To support the dual LVDS link mode, "video_pll1" clock rate needs
>>>> to be x2 "media_ldb" clock rate so that "media_disp2_pix" clock
>>>> can use 7 division ratio to achieve the /3.5 clock rate comparing
>>>> to "media_ldb" clock rate.  However, "video_pll1" is not seen by
>>>> LDB driver thus not directly controlled by it.  This is another
>>>> reason why assigning a reasonable "video_pll1" clock rate in DT
>>>> makes sense.
>>>
>>> I agree that _right_now_, the DT clock assignment is the only option.
>>> I would like to see that DT part disappear and instead would prefer if the LDB/LCDIF could figure out the clock tree configuration themselves.
>>
>> I think we'll live with the assigned clock rate in DT, because the
>> i.MX8MP LDB and Samsung MIPI DSI display pipelines need to share a
>> video PLL, like I mentioned in comments for patch 2.
> 
> They do NOT need to share a PLL, you can use e.g. PLL3 for one and Video PLL for the other if the requirement is accurate pixel clock .

I need to share the video PLL clock on i.MX8MP EVK for LDB and Samsung
MIPI DSI display pipelines.  PLL3 is supposed to be the parent clock of
audio AXI clock at least on i.MX8MP EVK.  All other clocks in
imx8mp_media_disp_pix_sels[] are not appropriate to be used by the
display pipelines, except "video_pll1_out", at least for i.MX8MP EVK.

> 
> [...]

-- 
Regards,
Liu Ying

