Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FC3B93F09
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 04:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2F410E539;
	Tue, 23 Sep 2025 02:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="eYOU0Yco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5C610E52A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:07:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aT/itMG/viaD303GTnZDvKMOF4/Jyo61j6fsl7kaV5GQ+h5rrRmMZ27xGOTkMOgpwTOKDWFLxyHVF7pmool3oR/zK9yXfwdNkKhf0x20BeeTIN3dEf0D2gbM/CT6NNmO7jl/nkP6gkFk3t2LUf6Lb3rhq9hLrOEzsXDcVYx3UZJGqZV538Tv9BrNCcQFra9UM47BZM11JwJr3ynzwuLNrrQ9m8FAHEfcO6LWOfasxT5ngqkhSDrddZ+FgBdx0ZphfnNziUMnrK02cYaCvog23hSZLY96X31BcYHP+RcuqkWg5PZ6PmJLZchkX5pFnQWAjLqmNbplFcglX1S5HaaH3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x444hUPMWFUDiyv7erfnmsGuhdeca+JG8dX2tHlgqMY=;
 b=nz3N0amvNOIUi6P6K2uyLL4XrLN4TiTgtfkTEIwTbCm5Bn+xsOzi/mqrQu7PEU+SO8rKBbJmYWyuUqIUDglaozYxHsZgF7qzWfZ77UxQ3j+1uiJTRxXGgW5f6SUizCEQBoXgjQepezFwc0IG+f9LcFvhjHlqUwELptJD7+kASB879VNecZT4pXnmetTzWLUZ22qE9J3QpP43C/Kbm8qcLAPxNEuXFd3mM3tseESdXgFyCrenDKMc7zHTRylXspAUcvyr0FRq9d7yIe3gxjHzUhXew4N7zFqg6tqcg4+Qte46RJHZuNqorGbF0odbVkhjEuenkwVsrCS7jv1JNnuOmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x444hUPMWFUDiyv7erfnmsGuhdeca+JG8dX2tHlgqMY=;
 b=eYOU0Yco9A/K7Qy5kueZrQvuaSb6dEHP726sT1hFzGLs0cjQLWD3OVcnoxrhqZu8LEm4Yeb+9gimpKhsxTs+XNmXG5a6c/jvLDzKQsObsMphif0jyuaMlYujtFPPNRcRIP5VtwQRRXebOC7HdM/K6WH1WJhPyb4GR1C6MRGZEaVDClz/sdCXlM8cSx7YPgAzMEWoQ6bZ1dQV4fSZmUWAaUUnjKEVlefX39o3jdaBICUz8B5z0yCh/UL2RUnjeMUXM0SkBbFBH3OjostDAQ/8WZWhpY5xWXT6mhbRik5tPcMre/J9mkRZHEkrVpPk0JyrFDg3fds50Q95z5caBRKDyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9786.eurprd04.prod.outlook.com (2603:10a6:800:1e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 02:07:38 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 02:07:38 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 23 Sep 2025 10:07:59 +0800
Subject: [PATCH v2 09/14] drm/imx: dc-ed: Support getting source selection
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx8-dc-prefetch-v2-9-5d69dc9ac8b5@nxp.com>
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
In-Reply-To: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 6acce300-0f61-4243-4672-08ddfa45f849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|7416014|52116014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ektCNE5JV1ZrOUd2YjJ0UFNLeWFoZTA2d2hWYXVROXZXMzlHOG0wRE0wbmVj?=
 =?utf-8?B?NTBrRXQ0c3RHdUFtd0dxak9KSUFMYmxNTTV6SWdwSmpOcW9OdmZ5bnRRQlJk?=
 =?utf-8?B?WTc2L0Q4Rm1MdWVwaVp6L0VpSUdubHRsVW9zdUhmdjRkTlJkdzE0amhDZmph?=
 =?utf-8?B?a0U4NmRCblAvallwVHJjWVJKSUtIT09jcmxXbTQyaVdUaVlodGJIZkJFWk9j?=
 =?utf-8?B?dGVhTUNRbTFVcDB1N2RXNXZUSFNPeXdWY0VwMjRoNWRhd1pEZUExZ2F2elE5?=
 =?utf-8?B?ZkNneVpYN2pUenowSTRQai80Z1FScTBYLzlvQWNLaVJIRngzUlAzTnNtaFlx?=
 =?utf-8?B?MStnYm5yNHUrM2tlcGlyREUzczVSUTNlV0Z0SnRJN0t1SjFVUGhZSm83K3h3?=
 =?utf-8?B?a1o3ZjJjc2pHMi9RR1p3ZjV4TXpZMXdiWTQ2eml2Sk5IQ3FnM0VwNklsMmx5?=
 =?utf-8?B?dzZTUFg2akpqWXl1Qnd3a2xuUTZ1VnhHUXp1VHZiU3JHZkozcU9mQWUraHlE?=
 =?utf-8?B?NktRVFdxL3hha0JaYzVPUU96aUQ3VFliMVp6QW9oais1a2sxK2hPNTZLWWZJ?=
 =?utf-8?B?eXZOYnM3NFFUdERXSi9nQUM3TWkrNlNjTG5qVWEvQWc1WWJIdzQ1S0lMMEor?=
 =?utf-8?B?MmVpQ3lSMTF4UVluWk5iLzZPblMreUFMcE81a1RyKytGMWZLcDVNZ0VUd2I1?=
 =?utf-8?B?by81dGxyd3p2aGg1RFgvNU1zajNQK2hLTzZJRUFRdDZDb0t1ZVllNWgwblpG?=
 =?utf-8?B?RzU4Q1pzNzdJQUc5WkV5b203VXRETlFUVXlOUGJhVXF3a0lsZmxmb3R2YTJk?=
 =?utf-8?B?bEpRcE40cWp6d1loQ2lYZElSYWxOY2JaT0JqT0Y2QlRIQTJVeFY4QVhucHRj?=
 =?utf-8?B?d0kzWkRqMUNPUEkzR09McDFMVnEyVTYzd2NjRG1ibXZ5OUpmMEdWQW5PMlVx?=
 =?utf-8?B?QWhrNXhuY1hyTXJzZ1N4eWNlTktKQXFpSG56VUY4clg0eDU4citkaUZOZkJ4?=
 =?utf-8?B?SDRFaDk2SFdxUW5MRlpNLyt1NUk0akxHZGFwNDhpNnBOdzdIZ21GK2xNU3hD?=
 =?utf-8?B?QnpPNFhRSlJvM3VaVXl0eW1QL3QzMGhLUi9YVHV5am00WEJKUnhXTllabDI5?=
 =?utf-8?B?ckdsaFBzblNJbVN6U1ZxSmVnbFFJdmtYZk5pSTJLSEVYSEhUTEJlVDBrYXVI?=
 =?utf-8?B?U1RhUDh2dTBoWWpPV1FlWFh3NXQzQytzdi9RT1ZURjZhQ1lFcVBPSFFTbjhX?=
 =?utf-8?B?NnFYZ0M1UEUxOEpMU0h6N2FRYUoyRk9ZWFlpbGh4NUZzU1BQNXJtWmNrQS8y?=
 =?utf-8?B?cmpUK01idEI0bGZTYTNXTXBwanoyeEdDS2t0amlRS3pXWk1zT2dPaEdmWDU2?=
 =?utf-8?B?YVRLcGUyM1VrZnRXS2psUGs5SHNha21BNkVXOGlTZzRlWlJCbFpIRExuUHpH?=
 =?utf-8?B?bVBqQUtJR2Q0SGpsZFJqOFUrL01ZS2FyQUI1UVArMi8vTmJENSt3bFJ5L3pz?=
 =?utf-8?B?c0dILzBDclpHT1lvSEFVRURTRFZXRDd3dkJTZUQ0SmpDVEdnaldhK0VWUDFC?=
 =?utf-8?B?Mmk5dUk0by9LUkxrQ3NPVHgxbkhzVUhyanVweUEyKzlhaEVZZCtzUFo2dG1K?=
 =?utf-8?B?bkYyV3lGb0tNQk1CQ3c0WlU1bXUwYTVHSnMvbm1WOUl4OVU1UHR2SlZBN2JC?=
 =?utf-8?B?aVJITnNkeU96ckNJRk5LK2xHbEoxb2VJYjNZUkpNS0szSi9qTWg0V3hVTjMx?=
 =?utf-8?B?QzVQVjB3U1hPdkVXOHI0UStkVmdYeFdNY05ONUwwRFZSMHhxNFM3aUZpQ0tn?=
 =?utf-8?B?WGJwcmF3Z1BwSHE5N0lqcG5kVW15Qk51K3Zpb2dzOGN6VkdCWThNR0dSbUlp?=
 =?utf-8?B?dFBORmozeUNUYW5XcVRqKzNaMkhPLy92T2JCL0VMbDVWcXQvQnF4ZkwxQjRn?=
 =?utf-8?B?VzF6a05GRDhYRTBUdWxKb2ZBYzE5L3RqTW1KQ0hQUGlCOE5WQ09WV0l5cVlq?=
 =?utf-8?Q?HfHZZK6BjCEZ2SLgGumXgXJCsgMJrM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(7416014)(52116014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blg0TGNSQWVrM0VCODdSaWMrRUVtVnFBYU9HQW9HdTVtUnR6cy92R2IxOHhu?=
 =?utf-8?B?WXY4ZG5jWXNpaGcrOG9oRWpCanZNellzQmZ3NUdSakZQYWhsSzlvM1JwMW5m?=
 =?utf-8?B?MEVIU3BmZ1V0RzdDTDY0OTNIUkdwWlhTeFYwenRaRFJsUWpwVWh2Z2trRzV4?=
 =?utf-8?B?M0VkcWhNbm5CUVVhdWxOZ015NnBWa04rclBXNjNlSFFFSkg4UzZ0S2Q5dlNC?=
 =?utf-8?B?dHJOZDZOdGZmVmxUbm8yOWdaZHlGcDhyU0FoY0ZEdTE4TlN0N2pUeDViKytx?=
 =?utf-8?B?aCtTOWhJeHM3QjZWRDhPZ2JHdFRMeGNmbHZUTW9GV3pvcDVKMzFjcllpb3Yv?=
 =?utf-8?B?K0lOa3p1WU5PbVNJellSeHB1eVlXTnphSnVLQzROTlhMb2d2NnJEUUJkRmtu?=
 =?utf-8?B?dnRsM0R2dFBvRWsyWUswbWxKZkFUMG5oNzZpSm9uVE9WMXIrMlpnZ2ljd0la?=
 =?utf-8?B?VkdLZXdjS21qZHFvVnRiOU5oWWRVNE9taTRHWmRkSUxMT1l6NGRmcHBTNHJQ?=
 =?utf-8?B?UkZhZlg2alErR3N6OEM3ZG9zclpkdFpCaE1xN3pmWVJ5UEdsckRRc0kzOUJa?=
 =?utf-8?B?dGhNc0lQb2RwbWNPYTRnTmhLVGx6V3BHSFd2a09OU24yRTV1NzczMkxyUHJX?=
 =?utf-8?B?L3Y0T01qMEdlT2M4b1hHZGU3TDN1cFJWTnp6SU4vQkc1aXFTaDhSay9lcWtZ?=
 =?utf-8?B?TTVUWWU5UnF1RjFzdDZzOXo0b2hZdVRYN0RLSFIxa3FHMW03TnRTYmZkc0NJ?=
 =?utf-8?B?VVJYTGxiek9DUEtxY3duWU04RDBwWUthZ3VNYzhTRkJSYitVQlJsUXMzNU1K?=
 =?utf-8?B?RjRiWlM0Q1pKaFFWODEzZndEK3VITHNCZXRMS2dVRXlVSExQUHZhbEd1a0Rz?=
 =?utf-8?B?R2ovM0Nzc045czJOREQ5S0owaVdyUitMaElFZ1ZFckEzVWZtWkxXSnIyKzJI?=
 =?utf-8?B?NlQ1cXE5Qkd4VDFFRW1WMG12Q3NJYnI4ZVdRaWlLV3loRXdJdXEycHJJN2ZV?=
 =?utf-8?B?aEZuWjNxN2RMTGs5c210MWkxSUFFNFNQbEZVSWt6b2xWZk8zRGc0WFp1RTZj?=
 =?utf-8?B?WWRGdlcveEcrVzZUTldaRjJuVy9wY2ovWXZrYzhQQXpDSS9yMmZqZVllYkQ0?=
 =?utf-8?B?a2IxUlgxS2UrWnBtRnZxRFVmR3RNUm1mVUEzVWdScHM5YytHczJvdXJ6VUFO?=
 =?utf-8?B?NmZzbEJpZVpyRXBpYTRURFZkWUJUVzRPTUlhMzNxQnN6OUV6MUtQRGV4NVdn?=
 =?utf-8?B?OFZLMXdNMVVQUmlRWVVVckRvVW5OdDNtc05BSFBSUmFJS0IwTFBDQjZpNWRZ?=
 =?utf-8?B?anp3N2greVZaUzZlU2QrM1ZVWmJuQVFWMVFaMUpkdExRODU1Q1UzV1VBczhr?=
 =?utf-8?B?ZFJWY2VxZW9rcnA0SFlmZml5ODVXZzFucktpS3BJeE1nUjZ3Vko0bkhOdUl5?=
 =?utf-8?B?MWlrUk9LNFJMTHVlNGllZ0JWN2ZXUHM4ZXluYW5meHh2Ry9nME1rZFcxa0M2?=
 =?utf-8?B?RXdBRTIvYkZacWcwdSs4SjdyN2NBbkplR2ZkcEVLOThjTllzWmtaVWZWWDZy?=
 =?utf-8?B?ZXJjdnZUTWpIOWdWU0lyV042MGNRTFY4M0o4TW9ZNDRrOG5wN0ZGQ2V2SG1i?=
 =?utf-8?B?cHNiMEtPU0VwQ00xWGtzeW9xUUp0NHpod1h3T3E4OWNBcXpMeGNtdzhWMmhh?=
 =?utf-8?B?Q2VHRE84Y0hUcE5yVHpJZXRUWVp4djNlaDlZSFVhY1RxVUI5MThHejk2aHY4?=
 =?utf-8?B?NHljY0lPSkM5STEwNjl3RlVmZGpoZlVNNUdCZ0ZETm5FSEVNQXl5OEVJZWFU?=
 =?utf-8?B?YXh4blNBRTZvS1JsNnpFU0Y5ZnJrc29YZ2d6dlZ6Wjl3RXhZaDlWZmE4WTdK?=
 =?utf-8?B?VUdTQjZpdGtpL3RzRjhNUGt2RzZRYkFYS1dxRnpXNy9GSmdXbkswbjhVSlBw?=
 =?utf-8?B?Y2J5ODBicFhybjhnNUk5UU10WlcvTk00Z2VaYlpNZ045eVd1Yi93QVRKR3BR?=
 =?utf-8?B?Z3FKbDFXdm43eUpJSVMxM3VWZWxlYXh6VS9rcjFVckVpQlJiRGlFYk1rV3FB?=
 =?utf-8?B?VjNkUnRZL0hNd2xCN3MxTmN3VkNnczRBaGxKNi9aQlI1dDU4MGJzclh3WEsy?=
 =?utf-8?Q?SeQPm8+miJwpGW1LS7zjM/FCC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acce300-0f61-4243-4672-08ddfa45f849
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 02:07:38.3199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmApritQ/flHjH2mm1gzhx9CK1BOBWJmEzotgkIwyqqcRqMW+AQY3f/1nVVXRmVLjqLc67EcidrUmnH3Yzxfeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9786
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

Add a helper to get ExtDst source selection.  This is needed by
disabling CRTC at boot in an upcoming commit which tries to get
the source selection.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-ed.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
index 86ecc22d0a554bf3eced218df0312b513e10e179..b514790bb765329295553f89d16ee1167ef411dd 100644
--- a/drivers/gpu/drm/imx/dc/dc-ed.c
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -150,6 +150,32 @@ void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src)
 	}
 }
 
+int dc_ed_pec_src_sel_get(struct dc_ed *ed, enum dc_link_id *src)
+{
+	u32 val;
+
+	regmap_read(ed->reg_pec, PIXENGCFG_DYNAMIC, &val);
+
+	switch (val) {
+	case LINK_ID_NONE:
+	case LINK_ID_CONSTFRAME0:
+	case LINK_ID_CONSTFRAME4:
+	case LINK_ID_CONSTFRAME1:
+	case LINK_ID_CONSTFRAME5:
+	case LINK_ID_FETCHWARP2:
+	case LINK_ID_FETCHLAYER0:
+	case LINK_ID_LAYERBLEND0:
+	case LINK_ID_LAYERBLEND1:
+	case LINK_ID_LAYERBLEND2:
+	case LINK_ID_LAYERBLEND3:
+		*src = val;
+		dev_dbg(ed->dev, "get source selection: 0x%02x\n", val);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 void dc_ed_pec_sync_trigger(struct dc_ed *ed)
 {
 	regmap_write(ed->reg_pec, PIXENGCFG_TRIGGER, SYNC_TRIGGER);
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
index f5e01a6eb9e918516adfc89949665fdd2ff1e40e..0b81dc6b251c452e7ca72f1cd12af065bafaa198 100644
--- a/drivers/gpu/drm/imx/dc/dc-pe.h
+++ b/drivers/gpu/drm/imx/dc/dc-pe.h
@@ -85,6 +85,7 @@ void dc_cf_init(struct dc_cf *cf);
 
 /* External Destination Unit */
 void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src);
+int dc_ed_pec_src_sel_get(struct dc_ed *ed, enum dc_link_id *src);
 void dc_ed_pec_sync_trigger(struct dc_ed *ed);
 void dc_ed_init(struct dc_ed *ed);
 

-- 
2.34.1

