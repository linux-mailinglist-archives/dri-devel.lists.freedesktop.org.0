Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2926A9D1DF6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 03:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E5310E5A0;
	Tue, 19 Nov 2024 02:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hJexebqH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2083.outbound.protection.outlook.com [40.107.20.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542F510E5A0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 02:08:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfCI/nTQb7B4XsHsgLpgan+5jf32RI0tdhfyNxc5D36+6MNyF3Rh6a1+0aPtRcI3tlm6O2+QM1HTRyxry32NUXu3lNbrNfG8MogqW8oYiH1QaUVwPAuYBOMEjKWfHYHJa9tFsIlKeF7OiDHYByUbEr5ewrOjucQLe/YZk6ldxY0e+Sjmnd12XU73vNGPjNNxoOxMj2BNRdgWjkTc/sizdK346r35f/1LwFTpwVU9BcAzGqTxnSoHA8Bf4LZGDhJYEwe+S444V5fw7SX4tBeOMo6ZJENpTCux00A5KSD+Ifdi1G5eUuOXBiDxQ35GQODh16+uF5fTErnNCDNC5n89xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMkRXYHmZs1y6NaqoF/hrXniEOmnWYDsQOfDfiiAQX0=;
 b=JHi0uDX+6CNXYe41zJz6x0TCd9nue53oHVOXGpI+K6Jq8AAsh100781TgBfoth3ykBd0UPP8fCLtn1QjLhrqnpWAKyPp8tEDSNgYiTaHeRmzvcEDhMpQdKC1as0LrIt6ozsp3lFhzLVz1KpvSNjq/jc0/a4pAq8lAZbQoq1BJMCUiQKv34Iy/Z1s6xIdhz1oggYkt5tDysox2L8Haan1CyZ6HonjtFGYbQ73GJuj7Tx7VA6TLjVhAZCcXZrnWT6V15il4FekHSYi8Z3dd5TWCC99uG+ozyeRR5ubUZPxxMMKqNOWNlVUjNJnxpLJHOVjODMR8VFb8gyKDTFtmP7XVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMkRXYHmZs1y6NaqoF/hrXniEOmnWYDsQOfDfiiAQX0=;
 b=hJexebqHdyoVY0eEEBhUS5mpyxJz5ZOK1ii5cwPEhGT9SdvpfzfPjcyoLxYjMtbk0ZFlGQ33EsgW7TlW16/kbjTZlJTCTJBsgf9OGYIQdQq5HMaXgQJs0Kl9CzgXPazH4otIJC0CiutZhaqk8lM09tXiXBqroNiEITHD8akQTIFBKYPIrFBh1CA4inA7h5I8TPZ8bgpM35eI8158UQNONFYMERHTfoSYqIv3wO3I3qQQw16fHYxSNTxymw8kIukkKO2FSqN4oqzZqFWurs7kbrdDcZ8W1GcaEHWR16msSeg8V2041N2heDiYmU9UyefI6+eJEoUQupnFJJUX6OgB5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8155.eurprd04.prod.outlook.com (2603:10a6:10:24d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 02:08:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8158.017; Tue, 19 Nov 2024
 02:08:36 +0000
Message-ID: <b7b87f6b-4af6-42c4-99e5-5addfc275e10@nxp.com>
Date: Tue, 19 Nov 2024 10:09:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB serializer clock
 reconfigure parent rate
To: Maxime Ripard <mripard@kernel.org>
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 <20241022-quirky-ubiquitous-hamster-11dca5@houat>
 <47d92ae0-c71a-4c18-9ad7-432c0f70a31f@nxp.com>
 <20241118-sceptical-mastodon-of-pizza-df93de@houat>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241118-sceptical-mastodon-of-pizza-df93de@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0107.apcprd02.prod.outlook.com
 (2603:1096:4:92::23) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: eaca9b2b-a6e6-4246-6876-08dd083f13a7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0ZZOHpZR1ZzbEpDeXhLcWdOY25OOEpFUzlQc2Z4bUdtcktGZTcvSTdjeFNy?=
 =?utf-8?B?N1RwNTY1d2I2dUVIb3JLS3V1ckdkTURQYmJPcFpaeHZ3cVRTVHhBeDB2UVd3?=
 =?utf-8?B?U1ZaelZKSDRXVTB1SUErWUt1c3lGSW51NTJLNlJOTkhGNmRjY2JtcXRCVjA3?=
 =?utf-8?B?dTNPVG8yY215UUlOd3BuSi9QQm94dlliZzc1bGREUEVDazlvclduL29pNFdB?=
 =?utf-8?B?Vis4MTFGZjduT0Rvak4vUzhnTlFtSXQvMGoxS3lhaWh4WmN3UDE2L0dTdlBD?=
 =?utf-8?B?MDZyVkwzS3FkT0YrRUc4RGtoOCtseHYybnQ5SFVISFlpUURDeDBMdUtFa09Q?=
 =?utf-8?B?L2dCY0dSWHdvcTlZeXhuaUtmWS94MGN6T2xEYm5QbGdMUnJ1eUhnRWtTREJG?=
 =?utf-8?B?TmVMSHM4Vk1ySVdzTDlyWXIwdDRhc09temc0bnBNeGpCSFliRWlZRzdMaGtB?=
 =?utf-8?B?Vnk2dDZFcjNaR1Rja0x5ZldQVmJXVGpob2kvaFVoWFpkMWxVM3MwdXYyRy9m?=
 =?utf-8?B?NVBIK2ZrTktxbTlkNFBQcGd6VUpobVd4S1cvOVEyNFFONmYyU2FNU084cUhh?=
 =?utf-8?B?UnlTYUZLKzRYLzJlUERoL3NEc1pnekVOYnBvQ2hDazUrcXBOV0E5ZTkxeVl3?=
 =?utf-8?B?aUh6WEtVZ2xXZHgwSXdGNU81OGFZbENhT0JuNFdIRkNIbEpGK3pKbFlDbjZW?=
 =?utf-8?B?K052NW9uTG5ZTkdmU3dTTlpNSHFMbGE5Q1BiTG5sN3pKQ2p1K3FhTkJmM1dm?=
 =?utf-8?B?VTN1c1c2TFd6K21iUVI3NlVTSTdQc0cxTUw0UHQvZWpRZ254dnhTTlJJOGlG?=
 =?utf-8?B?dW40WFpsN1paUVlnUE1HNlIzdHhXSTgzeVlRcERiMUJMS1JFMVowcGxqVUVY?=
 =?utf-8?B?RFRvU3JpcnlYenpPUDBmTnUwMUdidzJTTHczNlNPSWhnZEdqWldnQlhtOTZt?=
 =?utf-8?B?aFVmZGZpdFNwQ2VhU1ZERlFDUGlNelZTNG9GQUZyTEZ4V1hoVW9pRVRKdGsr?=
 =?utf-8?B?MS9iL3lyZ1pSSGM1dzNaTEo4aU9NbkxiUG13ZzVmNUp1TFAzYm14UlVaOUhM?=
 =?utf-8?B?ZnBVMUIzMm4vdkhtRUFCVXRkUzZEMXRwdnZ5RHdOUzV5QjIveDRwR25mNzNl?=
 =?utf-8?B?Tm51VVVoRjJmV2JPRTkzaDd5U3Jsemk3aXlEYnlubWZyZk9aOC9LL1krK0Nh?=
 =?utf-8?B?V093SzVOYnRST1ZMSlhqNGJ4aVVSOTA1RXZZYnJHcGNrZ01nMVFQNHZOY0J1?=
 =?utf-8?B?NFlaelRsY3hJbDFiYmRsdDcrckRUalZZa1dZQnBIQmhUT094OVJmdFRrYklS?=
 =?utf-8?B?R2cwSGlMWHgxL0ZnVHRTeEk5c2RRc2o1TnZ4ejIxMU9HT0NQb1pzcktGWUM3?=
 =?utf-8?B?dENBSUhFUW5sNUJ3ekFVYUxUYjhvMUErUFd3bjJpcmZjcnd4V0RyZFprWlNq?=
 =?utf-8?B?NWoxZW12cytzY1ZXaHVlKzkzdHBLL1lzYS9lVGswd1h3OG5XWHU1bmk1NDZw?=
 =?utf-8?B?NmFjNk83UmZlOGFzdVJ0dmZmMTNxTjl4Vk5Zb0FBWVdHWG15amY1VWwydGhk?=
 =?utf-8?B?MmNnNUZMZ2ROa0VtalBQSWNFTVVUNGY0TGF4WktocXBPSW56djEveHkvVmVC?=
 =?utf-8?B?VnI0cThHZGttSGViZlIyQ1NMSXFQWU0xZ25PMW1PWGNIZEwyaXJoYnZSWmRP?=
 =?utf-8?Q?a9A3+meoxxMJ+KKahvnh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm8yM3pKZlFtN1ZSSG0zRTJGK1pNMlh4b0VUVXVUOU80OGM0RDZjT3Qwa1dS?=
 =?utf-8?B?S1pJUHhRbHVHRnJkMUJMME5GQnJYMTBlOElrTU8xdk55alJodSt5Q0VrcXJ0?=
 =?utf-8?B?N3F6MUJvTHBoVnMvODV0UjlKQ0lreDhnV3ZaZHE0d09BNEpRaDBRYXB4aW14?=
 =?utf-8?B?cEo5OXJENjlqTHhRcWo4aGoxN2s5ZkY0TmdwY3lsZFZyaVF1djNvMGJBQ1RE?=
 =?utf-8?B?aGxZNEtFUWdxNC8wZEQvQnlsLys0b2t0MnhzeEZKYitQbzFaekFVRWZNc0Vt?=
 =?utf-8?B?Ly9kd0lzMVlKZnFyd1BKanZDa1ZJZ0tMNVhlb0JQbUhlSW1MMERHS1JVK2tr?=
 =?utf-8?B?NE5YQ3RtTHJ0M1hRTXRtSTNzeUZqRlF5ZkVYNEhrWXAzcmk0c29GQy9PbU5k?=
 =?utf-8?B?T2gxOTN0bVk4Q3JaQ3FCVTRCTU9FTW9yL3lQTjJWYldCTjNxYm1wc0pXanU2?=
 =?utf-8?B?Y1JuMjV3SXVvRks0SURtRUJXUndDV0hOQVgzbEhlTW1Rdi9SYlhhODAvS2ZG?=
 =?utf-8?B?MFRYeFhNMjdHVFM0QnhTMktHUDM0MEN0Tld1RDhCYnlMTi9RcTZSZGNINGVl?=
 =?utf-8?B?eitSdlZJKzNRY1ZadWpaUkdNTWRXbURFeUVBcHZqbi9OYS9HazVrQkh3QWhx?=
 =?utf-8?B?QWNtaEpUUTlBT2lNWXJqcWZFRnpxK2ZCRzdHTXFLNytlVTJRQU5SY2o0RkQ1?=
 =?utf-8?B?aENBNC9HeWw1ak5YdEhpd3krOUtNTlJDMGxQamxSQk5tSURNMEZHekpqb1E2?=
 =?utf-8?B?SlJ4bG9hQVpMVDJRUjBvbStJNXQ1cTY2STBFTG5welhlN0xjeU0rcXZRK0JQ?=
 =?utf-8?B?ZzFOdmh2NmJpVEtBSDRSaDM2dEpHelp3SHRva0hXVzBuMmFpQUJYU0RSZy90?=
 =?utf-8?B?czY0ZzZhUjlGS2poN3EwYjBVVjVKaFlwNC81NTJKek5rRUtPM1Z3RFpWdGtp?=
 =?utf-8?B?T3lvc21ScHMzTGR5SU5BMEVaQ1FWMDJ4THhXQitYOVVDWHQzaWlxcVlmekdF?=
 =?utf-8?B?cWFOR04xUjVrM1hmMFlnNSt4bWR1MDJsN0FuTk00STFORVFicXo5bkZkYXFv?=
 =?utf-8?B?ck9vaVBUb0VFamxacHhlVmZDVzBXazhjaHhnb0MrczFXMklVeWFhNGdyN0ww?=
 =?utf-8?B?WHlBaUdpNFlGbEtEOHcybzVWcTl2SWk4c3FPZWNDUVJ0dFNFWHhlMFAzb0Vo?=
 =?utf-8?B?TmJ5UGRnZHg0QnczSUFPU3kxd2FSSDRocDNsUXJYZ0tlSzJWd2JEVGtPTUJy?=
 =?utf-8?B?Q1I3dzJ6OWlPNm01dEE0bTQxUFhjMkdlSEZRQUdwL2p4NElkV3l4UUl5RXJu?=
 =?utf-8?B?N2hiZ28zaGsyK1VZS25sNUpDOHBURnpVZjlkNEpieS91ZTYxQlhxU0NhSUxY?=
 =?utf-8?B?K1pCeG9CSTdqN0l1N3I1UWc0dUNQNEpEUVNPNSt1WFYwM3ZjQUs0UjQzQ3Yr?=
 =?utf-8?B?VEt1ekJSL1lMTlRzVU8vejRhajZjQ2pFUC9zT2tWenVhZUx5WDh3QmdoVTVR?=
 =?utf-8?B?VHNkejZUSmdXQUZlSzQybm1FdFVIWXo3cjd3NDIzRHlYK0pwVktXSGpmY3lY?=
 =?utf-8?B?ZmdHWm5MQjlVeXRka29MendQb29nVlRweW9MOWJvWXNiWDZRcXMzSEZRYXkz?=
 =?utf-8?B?MFVOS3Bia1MzSExhcWZxaXo2YmE0NzRVUHBERElyTVhSS1E0RWIzOGRLQlNC?=
 =?utf-8?B?YTAwVTZvSGxPU0hKVklnUUN2NlE3N2N3Mk9lWFpONXJvYmxIZFRpTllhKzF6?=
 =?utf-8?B?S1Erd3hOTXZFcU0yOVQ3NEtVcWJ3WkdrWWloR0VLWURmalZNaE1sZ3I1anZi?=
 =?utf-8?B?Y0J4K055Unp3bU9JQVZaRGs2eUY2TXNRMC9VVHNWUm4yQU1vY2dCaGJkaU96?=
 =?utf-8?B?dXBnRktqTk0zNXdXN2pORjNuOUsrYTRocGgvcHdwUkFxMVZzNFV0Z2Irbmls?=
 =?utf-8?B?T3FJcTNYSXdHN1hJODV5Z3NRaU1xNE1yWllCNk5WSHRJZnE3Qk5jWlMyQkU3?=
 =?utf-8?B?Y0lRUUY1dDlOaFZhb3pYeHdjZDhEQ0hWTGRTQ3ViQW1NaWlhN09JTjFTY2lo?=
 =?utf-8?B?ZWpta1Z0NkZOQjhpZDJUSktUa0lrSURHcW5pSldVMjZQQ1lOWVJtczdacGkx?=
 =?utf-8?Q?ULnQR0HPIpJvilg+0TJxqjGjt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaca9b2b-a6e6-4246-6876-08dd083f13a7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 02:08:36.4128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKh5oOsXOtViet4guy0xt8VJJVdz0WoB8RmUrlD4eHf2zXJCMjOHLSu180otaLMobbIN7VXC5N6GWvW1W3ioow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8155
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

On 11/18/2024, Maxime Ripard wrote:
> On Thu, Oct 31, 2024 at 10:35:27AM +0800, Liu Ying wrote:
>> Hi Maxime,
>>
>> On 10/22/2024, Maxime Ripard wrote:
>>> On Tue, Oct 22, 2024 at 02:13:57PM +0800, Liu Ying wrote:
>>>> On 10/13/2024, Marek Vasut wrote:
>>>>> On 10/11/24 8:18 AM, Liu Ying wrote:
>>>>>> On 10/11/2024, Marek Vasut wrote:
>>>>>>> On 10/10/24 7:22 AM, Liu Ying wrote:
>>>>>>>> On 10/09/2024, Marek Vasut wrote:
>>>>>>>>> The media_ldb_root_clk supply LDB serializer. These clock are usually
>>>>>>>>> shared with the LCDIFv3 pixel clock and supplied by the Video PLL on
>>>>>>>>> i.MX8MP, but the LDB clock run at either x7 or x14 rate of the LCDIFv3
>>>>>>>>> pixel clock. Allow the LDB to reconfigure Video PLL as needed, as that
>>>>>>>>> results in accurate serializer clock.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>>>>>> ---
>>>>>>>>> Cc: Abel Vesa <abelvesa@kernel.org>
>>>>>>>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>>>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>>>>> Cc: Fabio Estevam <festevam@gmail.com>
>>>>>>>>> Cc: Isaac Scott <isaac.scott@ideasonboard.com>
>>>>>>>>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>>>>>>>>> Cc: Jonas Karlman <jonas@kwiboo.se>
>>>>>>>>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>>>>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>>>>>> Cc: Michael Turquette <mturquette@baylibre.com>
>>>>>>>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>>> Cc: Peng Fan <peng.fan@nxp.com>
>>>>>>>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>>>>>>>> Cc: Robert Foss <rfoss@kernel.org>
>>>>>>>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>>>>>>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>>>>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>>>>>> Cc: Stephen Boyd <sboyd@kernel.org>
>>>>>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>>>>>> Cc: imx@lists.linux.dev
>>>>>>>>> Cc: kernel@dh-electronics.com
>>>>>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>>>>>> Cc: linux-clk@vger.kernel.org
>>>>>>>>> ---
>>>>>>>>>    drivers/clk/imx/clk-imx8mp.c | 2 +-
>>>>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
>>>>>>>>> index 516dbd170c8a3..2e61d340b8ab7 100644
>>>>>>>>> --- a/drivers/clk/imx/clk-imx8mp.c
>>>>>>>>> +++ b/drivers/clk/imx/clk-imx8mp.c
>>>>>>>>> @@ -611,7 +611,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>>>>>>>>>        hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
>>>>>>>>>        hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
>>>>>>>>>        hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
>>>>>>>>> -    hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
>>>>>>>>> +    hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite_bus_flags("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT);
>>>>>>>>
>>>>>>>> This patch would cause the below in-flight LDB bridge driver
>>>>>>>> patch[1] fail to do display mode validation upon display modes
>>>>>>>> read from LVDS to HDMI converter IT6263's DDC I2C bus.
>>>>>>>
>>>>>>> Why ?
>>>>>>
>>>>>> Mode validation is affected only for dual LVDS link mode.
>>>>>> For single LVDS link mode, this patch does open more display
>>>>>> modes read from the DDC I2C bus.  The reason behind is that
>>>>>> LVDS serial clock rate/pixel clock rate = 3.5 for dual LVDS
>>>>>> link mode, while it's 7 for single LVDS link mode.
>>>>>>
>>>>>> In my system, "video_pll1" clock rate is assigned to 1.0395GHz
>>>>>> in imx8mp.dtsi.  For 1920x1080-60.00Hz with 148.5MHz pixel
>>>>>> clock rate, "media_ldb" clock rate is 519.75MHz and
>>>>>> "media_disp2_pix" clock rate is 148.5MHz, which is fine for
>>>>>> dual LVDS link mode(x3.5).  For newly opened up 1920x1080-59.94Hz
>>>>>> with 148.352MHz pixel clock rate, "video_pll1" clock rate will
>>>>>> be changed to 519.232MHz, "media_ldb" clock rate is 519.232MHz
>>>>>> and "media_disp2_pix" clock rate is wrongly set to 519.232MHz
>>>>>> too because "media_disp2_pix" clock cannot handle the 3.5
>>>>>> division ratio from "video_pll1_out" clock running at
>>>>>> 519.232MHz.  See the below clk_summary.
>>>>>
>>>>> Shouldn't this patch help exactly with that ?
>>>>
>>>> No, it doesn't help but only makes clk_round_rate() called in
>>>> LDB driver's .mode_valid() against 148.352MHz return 148.352MHz
>>>> which allows the unexpected 1920x1080-59.94Hz display mode.
>>>>
>>>>>
>>>>> It should allow you to set video_pll1_out to whatever is necessary by LDB first, fixate that frequency, and the LCDIFv3 would then be forced to use /7 divider from faster Video PLL1 , right ?
>>>>
>>>> Yes, it allows that for single-link LVDS use cases.
>>>> And, __no__, for dual-link LVDS use cases because the
>>>> video_pll1_out clock rate needs to be 2x the LVDS serial clock
>>>> rate. 
>>>>
>>>>>
>>>>>>      video_pll1_ref_sel               1       1        0        24000000    0          0     50000      Y      deviceless                      no_connection_id
>>>>>>         video_pll1                    1       1        0        519232000   0          0     50000      Y         deviceless                      no_connection_id
>>>>>>            video_pll1_bypass          1       1        0        519232000   0          0     50000      Y            deviceless                      no_connection_id
>>>>>>               video_pll1_out          2       2        0        519232000   0          0     50000      Y               deviceless                      no_connection_id
>>>>>>                  media_ldb            1       1        0        519232000   0          0     50000      Y                  deviceless                      no_connection_id
>>>>>>                     media_ldb_root_clk 1       1        0        519232000   0          0     50000      Y                     32ec0000.blk-ctrl:bridge@5c     ldb
>>>>>>                                                                                                                               deviceless                      no_connection_id
>>>>>>                  media_disp1_pix      0       0        0        129808000   0          0     50000      N                  deviceless                      no_connection_id
>>>>>>                     media_disp1_pix_root_clk 0       0        0        129808000   0          0     50000      N                     32e80000.display-controller     pix
>>>>>>                                                                                                                               32ec0000.blk-ctrl               disp1
>>>>>>                                                                                                                               deviceless                      no_connection_id
>>>>>>                  media_disp2_pix      1       1        0        519232000   0          0     50000      Y                  deviceless                      no_connection_id
>>>>>>                     media_disp2_pix_root_clk 1       1        0        519232000   0          0     50000      Y                     32e90000.display-controller     pix
>>>>>>                                                                                                                               32ec0000.blk-ctrl               disp2
>>>>>>                                                                                                                               deviceless                      no_connection_id
>>>>>>
>>>>>> Single LVDS link mode is not affected because "media_disp2_pix"
>>>>>> clock can handle the 7 division ratio.
>>>>>>
>>>>>> To support the dual LVDS link mode, "video_pll1" clock rate needs
>>>>>> to be x2 "media_ldb" clock rate so that "media_disp2_pix" clock
>>>>>> can use 7 division ratio to achieve the /3.5 clock rate comparing
>>>>>> to "media_ldb" clock rate.  However, "video_pll1" is not seen by
>>>>>> LDB driver thus not directly controlled by it.  This is another
>>>>>> reason why assigning a reasonable "video_pll1" clock rate in DT
>>>>>> makes sense.
>>>>>
>>>>> I agree that _right_now_, the DT clock assignment is the only option.
>>>>> I would like to see that DT part disappear and instead would prefer if the LDB/LCDIF could figure out the clock tree configuration themselves.
>>>>
>>>> I think we'll live with the assigned clock rate in DT, because the
>>>> i.MX8MP LDB and Samsung MIPI DSI display pipelines need to share a
>>>> video PLL, like I mentioned in comments for patch 2.
>>>
>>> Guys. There's 4 different discussions that look to be on the same topic,
>>> and doing workarounds in the DT, DRM driver and clock driver for
>>> something that looks like a broken clock.
>>
>> This is a bit complicated, because it is related to i.MX8MP MIPI DSI/
>> LVDS/HDMI, i.MX93 MIPI DSI/LVDS/parallel display pipelines.  Even
>> i.MX6SX LVDS display pipeline is a bit related, since i.MX8MP/i.MX93/
>> i.MX6SX LDBs share the same fsl-ldb.c driver.
>>
>>>
>>> Could we have *somewhere* a proper description of what the problem is
>>> exactly, so we can review it? Because at the moment, it's certainly not
>>> helping.
>>
>> Can you please suggest a place where this could happen?
> 
> Here, by mail will be good. Worst case scenario using a ascii art.

I have written a description in the cover letter of this patch series(v7):

https://patchwork.freedesktop.org/series/139266/#rev7

If you don't mind, please provide review comments there, thanks.

> 
> Maxime

-- 
Regards,
Liu Ying

