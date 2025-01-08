Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA4EA05196
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 04:32:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B61610E7E7;
	Wed,  8 Jan 2025 03:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="I0b/55x7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013020.outbound.protection.outlook.com [52.101.67.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8F410E7E7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 03:32:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KySxp0bxef68TVQdYLXfJ/MoX7qxh6hchCl/eq47JT5ugQ3sqjN9uRaquHGj9TzjICHA4n38zRmtmQj1pPUEHjxTXA3YK0yIYTBcXG5ow85ELgp+MY/eYKRoLZWjKvtSE2/07UEbXKH44faMKaQUxFRnlUlVcdCAfsv5aQDp17xzy/EW8MDHVm2UoO5naX8/J4Ch4tEzwzIczF7emEqwz8Vmn5Xjp5Sen84WPDhHMLMMUt5uE9ruX+qvOoksXl1cMCcufCGDQQI1rkVtEF/ux99th8VrS36Hbut4us2F+nrpjdd72bkUIE5B2PdnXylWuh+7rGugNzCIQi51Asipyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gjKwhRBdvOZqIgFBxRa3Gb7SZjce6//xz9hASn1W/U=;
 b=Vk4aIgEDycSxAZ0A0qT4ArzZJ8paZy7bSp7ZUlEGOMClO/MEXDhkfao33jCE2RgsTBr10PB/dMI6kzNEXyfoDAeIZRCIdZmVHdpZVKeRzaxYg0NJBOpWmgC0viM80/VX2+cKH4JYpu4vEYMqUok6ZcZOupKKufhjf+1tkj/SuxoomO77cVjjp4Ytub3yEd/h+OR2iVlVtMXXigYQZhI4V+VE+KciqW4MXtYCV3nZMJ2gkBrcnE7eYJ3Hp92iCGs7iXtlzUFXrON7BOHU/2llOhJPxpgRLVv7xHFSZ1GNTggikNWKipLoo+5bWNA/CboJxE+p9xjntBBsQEQOArtkhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gjKwhRBdvOZqIgFBxRa3Gb7SZjce6//xz9hASn1W/U=;
 b=I0b/55x7LzAg3OrWQDV3n7Ruvbf9mVa8x/vhzXrUWnhQ0/9mzS1OtiOQY24KvU///srX96wjWOGyoM3GNC5YUAK69Z7v07UPLlsNcPyEudsAqk4MWiqH/ZTB/Ah/4T3KctwXkr/jRDGpCipSo4modZp0ncbQk/V+VljVj/6tYxp5vyGje1Clvl8LEoBxX4vjzFoAVxCDlyXO9hzQndeFtC3GSwiAbDyDGbxnboDatrDBe5FnHruNXuGR7ebdjMB6cOl/qy3OiH/bLkMBK4WU5boyaQFdeAWSVmOnBA2AOp+PLRbYiH65hU+lqtIafRMYW9hvVqlByyiJr7M0bwSWUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8296.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 03:32:25 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 03:32:25 +0000
Message-ID: <b97eaa99-2782-408c-8494-1fd99c7ee1eb@nxp.com>
Date: Wed, 8 Jan 2025 11:33:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/bridge: imx8qxp-ldb: Use dev_err_probe
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
 <20250107143900.988567-3-alexander.stein@ew.tq-group.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250107143900.988567-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee2ee34-34e4-4b24-e47b-08dd2f9511f5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amEvSFkwLzFxU2RjQW9ROTB5MDcrRnUwUWVIY2Y3SnhFanRkNWtEUzJSSU1u?=
 =?utf-8?B?Lzg4RzIrOUV6bWszZExMbXJ0L2g4VWlNa1pVckFKQTJ5b1VDR2QxRUdEdVJi?=
 =?utf-8?B?WHo5bTFGbEQ5UlZyVlVhYk5uTGFYTVorWjNVWWZSb1B1UmdZTEtybU9zVXNj?=
 =?utf-8?B?Q1lZR3E3NzJuOWZ3TUYrY0VqeHBsOTZqZ1BCdENObnhiZTVXK2JSenFmdjZX?=
 =?utf-8?B?eHJBaFFwT2cvdlJack5jeFluSldoaDlaNUJBQUswRjh0TXhzQTRKZXd4S2xZ?=
 =?utf-8?B?eU5KOUtERUVhVDRhZnVWeEFVOWs4U05RNWkrem53QXpZTEJ4U3pRbERkVE5D?=
 =?utf-8?B?VHBlOFNxdjNFOVU3QTM4WkJGMW05UHI5TGZ2TzdtWnQ2aVBqSnBDMC9lMmpW?=
 =?utf-8?B?Q0pyRGdkZTJ5MXRzSXZIZDUvRXRKbVFONENBaGRzTkY5OFJxOVlwTUVkUmFO?=
 =?utf-8?B?Ty8wcytaWUxZcnNJRU00b3RpQUdCVVh5WTZaN1dIbFBnSGt4aFlmYW9LNGRq?=
 =?utf-8?B?ZDNsc1duYXIza0NtRjhnbmxPT29jRmN0UG00R2N6TXEzRXFOUmRITUVBckNv?=
 =?utf-8?B?Vkw0ZXBkQUZaVE5pOFF1QzBFZDZieVVmMVViWTFFOGtkWDdnck92dC8zcmxZ?=
 =?utf-8?B?SVBVSmFaTUFTdHNuZTR3UFdiY1U1RjNHbXIwYkl1MC9WdDlrN3JTSi9GRWZo?=
 =?utf-8?B?SUN5K1JlM1VvYm8yaDRpNVNFdWlRVXhpVUZFbDNDWmV2cGRWaFloVXVBRTB2?=
 =?utf-8?B?TWhkd0lQcGFuZHdvNHBDOGQxQ2M1Rzl3ODE1dDBqejB6d1hvd1BGSEpkdUxm?=
 =?utf-8?B?eDBmdE9OT1Bab1JSUnhYQTdEL2dlbHJ4dmZoa2YxalpwUTlKVjNVaVR6aGVV?=
 =?utf-8?B?MkowaHF2WnB0NTV4ZUdyazFBWGVPOXUyeTdDWXZIMlRkV1IxTFJRb0N6WGhx?=
 =?utf-8?B?cy96dmpsdWNUOEI4RWszN3pqMDNCSnJLclcxbmh0aHdxYTZPWnJBNG5Xc1VI?=
 =?utf-8?B?UnFDZE9iZTdIRGlZdVA5akJzdnRKZ1RmQ3ZRZURwOEpPWXVDbFRqVnlBOGd6?=
 =?utf-8?B?SVVxY05mNkQrTk9hZ0tyM3ZHTFlBajNRSnJ0MGxhOUxWUFg4Ky8vMG14SEtl?=
 =?utf-8?B?aFlCb0NCS1d2RFBKZXhMVDE3Q0NTUmFqeENmOVZFa2JMYmNER1lJYmtQKzRX?=
 =?utf-8?B?THM0dmNEczFPazZmTVlRR0UzN1BwbXhBaEt5Y1BwNFdnRzNwZDhnbk1zYmpz?=
 =?utf-8?B?YWI2T2o5RDg3RnpmZU5ER1VPRTdVLzlXS25KYjBuc25yOW1xbFBTRSt4Sk5C?=
 =?utf-8?B?QU0vb0lnaHdvV2tueTZJN2lGWW9KMDNCcUgvcjRqYW81eHRxYUROdmtJb0tk?=
 =?utf-8?B?Z25OLytkTWtMc0x2VEs0Z1RMajg0c08vbGtWQ0lubFpkeVkwVVdIUlcrS2RK?=
 =?utf-8?B?S0FKMVFmaGc0clpUS2ZnQVhjTVhLNURQQm04UGRtbU5MNFlnSERZVWFLeTVI?=
 =?utf-8?B?bytQVXZzaUgrL0ZHTkp2Z0RWaW1jWGlSU1p2dWdIMWJZQmlFRFlNVHpwYmk2?=
 =?utf-8?B?SFRhUFJ4WVFOOGQ3Z0JFNTQwTVJNbDBNQTU5Q2Qvdml3K21vR1pEMnRpUGpq?=
 =?utf-8?B?K3hod1AzVGNsekdEUUdlYkJRM2crcjgwNlQvTVBJQUlYNXFwOWtXYzZVM2xU?=
 =?utf-8?B?SFdXMTUrRFcxdFZCSWFXWW9yMmYrbS9ISTNrZ2Noc2daUkJmL2ZzSTlLTjcr?=
 =?utf-8?B?ekU3eFdEK0t6SFhYOGYraGNGbGRBM0g2bktVeS9iVEFoNXFXbFp6azVqQzN1?=
 =?utf-8?B?ZitMejEzNFhCS0pYWEdkbTd1ZTlmMFBremZxaTNyU3RZQlFQdHNwQjNyVTdp?=
 =?utf-8?B?THBpVUhOWXBxWXpSWC9WUWROUlNyQ0ZVNGtWczM3R3ZsaHEzSDNMVmMzSCtQ?=
 =?utf-8?Q?sdI7vob4OgM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzI4elpDMDlyRnF0MEZHdFV3MklSU2tOWEEyV2J1Q0FKZGZIQ2dLMllHeFJK?=
 =?utf-8?B?ZlZkb0VNOUFXUHY2b05iY2RDVnR1bkNsK2tiR01rVEFQeFFwaFNjTzNvSnFT?=
 =?utf-8?B?NlhNM05POEdCTjhEOGkrUXdxZVRGYjlpK0VOTXlEMFF5enBUelpzc0N0WnNI?=
 =?utf-8?B?Rk9PemVmNnhhUE1GeTFqKzdQeEt4ZFJlS3RSdFQ5WEpRN092Nkd4eE4vb2VU?=
 =?utf-8?B?T1RlN0sweUl3WWgrMXNLM0lPb3lYNEk5YUNCOW5zanNzcW1vNDA2RTZXb2FT?=
 =?utf-8?B?MnByMGV1eUFvQWdNbktKVS9WNUlmRkE5VHNkV1NIa3J3Q0ZYMGRRWS8xTUNi?=
 =?utf-8?B?NW14dmIxYUM3UDVXREJ5dkI5V2lFcDdIWUo0c0JZVmFSM01EQjBudnNFL3p6?=
 =?utf-8?B?b3R6ZHZQR1F2ZVFtak9YVHhVTGVxR2FPenp1RWJIMlY2bXB3Q29MdFFobisz?=
 =?utf-8?B?ZGVhTFJwUm92ZVhPYVRIdkRENGNCMWRkSWs3NFZrdGhKWUZnNU01L012L1Fj?=
 =?utf-8?B?RjZYOEhRa0NuRzlKWVEwbTJGTWIxYm9xdFFyUHY1L21oaDhVei9ITkNrTThY?=
 =?utf-8?B?RnR1aEJDVHI5LzZIUG9DVFQ1STBXYVp6bVFham5OMFBkTVRoazhtOFFBNjVW?=
 =?utf-8?B?WWpQNnBrSU1oZ05JRmRIZkR4YkZhanNrOTVZOFhDN2IvS1pRMk44YWhVUm9j?=
 =?utf-8?B?RkZrYndnSFJUYTBtdzRWd0RCY2xJc1hvVU5YcVQzbW9WMXlDalNaSGhVTFpH?=
 =?utf-8?B?SS9ScWF5VXdFMU1wS1FpYStuSEV3T3pTdXBzc29HL0xTYXdMOW12WWZzMDVa?=
 =?utf-8?B?d3REMW5xRXRaV1dlTzBEQU1IK3ZoRk1uVGRwMlNybi9Eb0E5SlpKM2Q1VHRU?=
 =?utf-8?B?KzY5UGJuZXBCVXo5QjNaVUxLL0NRRXZsMVg5VW85UVo4T0FYUkY5TllYeWxW?=
 =?utf-8?B?VmhTay9lMkd4QWNiam9hYm02NU5xdldYZFQyT2VoQmZiRVlscVg2QnFjbG1G?=
 =?utf-8?B?d3BPT0tEdEtRNXJyK3UxQU8yWEF5VFptMU9wZ2EzSStpeS8xUklkcVdNTDJO?=
 =?utf-8?B?U1lua0QxQ25FQWlVWmMxQWR4MnpnK1pQMXhlL0Y2YktwQjY5ZUt0TitTOEZK?=
 =?utf-8?B?QWRRTldLSEVQbmZhaHpYWWlEQUF4VnBEWDNEYmNHTUxYVFM3SGhzOTZqRE5W?=
 =?utf-8?B?d2RNMDZVS1dEdStJL0puNFM0NzBxT2ZqSGxGZkorOEEvS2FwOGsyTVJKSE9s?=
 =?utf-8?B?djJueVBqdkQ1NFo3WUhQcDJZUkErS2ZtSDJlR1VUZWtXWU1Rb05RUWQ5Umc2?=
 =?utf-8?B?STZ5M2ZVK3N1eGFQWUY2RWQvbVRFUUZmcTl1NmhWazFoa3dTb3JIaVNtSlov?=
 =?utf-8?B?NVZCZjNyZnVqMDAybXREaHZ0cUd5ZW5JSHFxSzJ6OVEzNjFxdXVlZm15UVBp?=
 =?utf-8?B?TWx3a1Nndmd5MGNoTDIwek1Db051ZGlPYVBMZzA1eklZalBqaTNsMmRRZkox?=
 =?utf-8?B?d0k1QnhEa2NiT09jUGNRM2hhbVgzRWJHdytOcHpCbkw3U0JFYkdJVjYvREdD?=
 =?utf-8?B?Z3lSY2RZRU9NUVdGMy8wcXlMZmlTU29VbE9tN0FnLzNSSk91N2JpLzNEemVk?=
 =?utf-8?B?OVVYaC8wM3JuVkpWQkFiTkJER0ZqVDhhSmtlcFdqN0pyNzV4dHp6MDJIYm5K?=
 =?utf-8?B?bENUUHYwMTQvYmxjelJXeXZRdGdnRm8zalFaQVFabkxSaFhGWENUVnptbWtv?=
 =?utf-8?B?RUw0T1d6STIyemp4Nml1d3QwZTNacncvQUxUNVo5ZWtsWWd2Q2Z5bGJsTWxl?=
 =?utf-8?B?ODhqekFpeXBrblFLMHF4S3NXNFJRVWUyL0FncHVwOW5jdVdXa1VteVdRNklr?=
 =?utf-8?B?Zm5xMGxqakdPci9NTWNRWjFBNWY5NUZyakZZWVJISXlwV3FyVEJtTnA3dXZ6?=
 =?utf-8?B?cGd4Z1NiVEwzTWZGeXhXb3J3Wk5tdFVZMmV2YitKVlkvSElneUl1UHdhSHB2?=
 =?utf-8?B?d3JuYnY5MEFNdGsxanhrUVRXdS94Z08zSk4zT0w5dVNsOXBsWUxOQXMzU3hI?=
 =?utf-8?B?WGVKQXNqdDBVZjRTM2dtaFlUY2dVR2VrWFBuTk8vdVptR2xBQklML0hyWjR5?=
 =?utf-8?Q?RQRpyNtCkYqua0F9c/kGTttAO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee2ee34-34e4-4b24-e47b-08dd2f9511f5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 03:32:25.7105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEB2X6Hwgf6qIOIOtll75di9yqEKztv+3MxwxCSRr3K9bH1XhxbLsNVPB/eU+B8n6S4fPWjiTJI1gLp0H5SUaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8296
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

On 01/07/2025, Alexander Stein wrote:
> This simplifies the code and gives additional information upon deferral.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 37 ++++++++----------------
>  1 file changed, 12 insertions(+), 25 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>
