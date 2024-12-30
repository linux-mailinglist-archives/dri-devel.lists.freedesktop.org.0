Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C8E9FE33A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 08:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6F810E47A;
	Mon, 30 Dec 2024 07:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="LwXTJJcD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2778310E47A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 07:28:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caoITNSkDs8bq0/kXE8mjNiqjA7fSowELaGyltb/y/YoOmUsKuUOVh9oOaYjKdtNIEikjGhZZBS5f7Zri51uyqKhH4muR+U9kD6qEjsaCOYp2Mc0EBrFhyOyR+2C4xM5GAsZ8melIUFU8Gp9KcTk6t5mFbZRS9RSFa040kpFCiz0yvZjB+frgSZFXrvIT4K7RhKVpBB6zpHzXVX3Kll1a40Jg7a3igvxqhg/omezUbqy1OwNojQudiF72AfrOjg9gcp+l2HJ9HhUbLz/+HPS6rMJuBWMcP0ZaCNBRAP0vwjL62Dcg5hERaXPVSYTAjYMnqPJYMIgoBWjZRXX5sVPWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HBmgaGKBP9w6zHWZNqJJqvoEZCHZ5w5tnCpEMciz/Y=;
 b=oasZAYP82DB2iWjuEKotsZn2afm7ODYRKFJ22/HwHAcq9Og/ivq1oiXs3KJdgWA+o1KSlJaltTACqTU+2aD1HFID8KGkxpYKrfCyVORP5SzmI56rrMfwXQSKZap7Qoe2OFdzSYWF06iK0iQkPrEqzxCD8YJDM/+ZlICxjI4NmAXEafOoFz73ufq75wT6XOQafREhqTBOJBzDzcgnnq0CRrOqxtQh2thE/glDHPU8LjkAyFuL9PzKGNkumDt4LmmzScJthDQJxc4G2euwNz/4R+sxxgeZLj7gODn3DK18jVWNHSR4fyqsja5JDuDZwO8FJ96PKRqVrG5eTcEbTdqBug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HBmgaGKBP9w6zHWZNqJJqvoEZCHZ5w5tnCpEMciz/Y=;
 b=LwXTJJcDhi/mZYSoxk+qtgy3o5MKb7y2iFTNAL1Z2krRKXhh7/R2ushbFX1cWgLGpskGqOI8+hq2b0tR8HPu6o2s6Sr65N/Y59mOhsjrWXYq+OWqodkEhZFiRffOlo/KKPbzPCoQdBlzbGkEyjYWDl9O1ySFAV45D6zs5eoUOCp1zhJ0XdkFgCPDwKbVz4yoJHcMtvqKQRkI+7QP5jjolN3JOHEjYFx8uXIevt2o0uAkeu2mz/LEU4AsGJYMJDTpjeFFpB04v0XgyQdnzkJlwhhaa3owFT6JNzx/5+nooS0hmXpfGYQaUZB341m8tdqswAdjnyLLTmVcUtShYs8b2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9898.eurprd04.prod.outlook.com (2603:10a6:10:4d2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 07:28:25 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 07:28:25 +0000
Message-ID: <20f33e1e-b531-4755-b414-02ab897e16af@nxp.com>
Date: Mon, 30 Dec 2024 15:29:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/mxsfb: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
 to drm_bridge_attach
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie
 <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241224014701.253490-1-marex@denx.de>
 <20241224014701.253490-3-marex@denx.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241224014701.253490-3-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: d40a04b5-cd7e-4564-0253-08dd28a38bef
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2FnT1NNcW5EakFOY0FLNy9FUUdsdFNQVEJNOXBSenl6OUdhQXkyUlNMUkZy?=
 =?utf-8?B?S0kxS25JcFY0aGhzUG1sZjVmMzg3RXF5ZE9FemhFM2FWYm1zYTA3WjJPVk9n?=
 =?utf-8?B?bU91ZDVoMzkzOVg3b1RyU3hGQVJ6U2JXSzdBNFBqZFdZYlB1dC8weWZ0RjVs?=
 =?utf-8?B?TFRDZkNmQjROazExaElNN2NPSjlSdURCRDhuTFZFSkRaMHNxQks0cDgvU2No?=
 =?utf-8?B?T3RvdEV3R1R1ekV6M0VaWFEyZndHQmE1V2o5UlJUWkMrazFreVdkUUhqcTZr?=
 =?utf-8?B?YkJ3c0RkbVBhVHRYVFNYUnBIVGgxVzdXNTJrSGlPeVhjNDVJMWRNeHJMMXVk?=
 =?utf-8?B?ZTV5RWZtbE4zRkM3RmdndlpjNW5mSS9uSVVoR1Bjak85cSs4aXU1c2syOHRP?=
 =?utf-8?B?RTNPcUtMNWZ5V2t0eXI5Tm5zS1FGWS9aZlArcXIxYzZSRWswRHpBWEFxUzJZ?=
 =?utf-8?B?dUN4cm1rZ2NFOXprOUhzNzVZWUxjM3B4Z0tvNE12a09IcXA3RFRiOVNmcDRa?=
 =?utf-8?B?THAyc0x4UExMeFRnR1B1ZW0vQll3aDBaSDRocU92MmlsUVU3YVpzcGFvMndQ?=
 =?utf-8?B?M0cvbjVVYm1CZ05NZEg0V0JicG1QTDhGaVY0c3lDSWJERHRSWlZIcFdsWFV6?=
 =?utf-8?B?aksyVkZBaDlnVENuZHdubVZyejZzOUJxUnJ1Vy9ZalpNY3YzZmVzN0hyaDN5?=
 =?utf-8?B?ejJjWGpPZHpteGU0SDBDVEFrZlRFRzNVakJBdU5ZUnIwYWNxcm5iY21uR1cv?=
 =?utf-8?B?SHhYeTlPcXRaeFd3U3NDR3lZRWNxN1lhZ2pKUCtXbW5BU2ppSzBsVm1xVVJN?=
 =?utf-8?B?OWJ4dlJSOHNMVGdncktNbzRqdW9KbGtRVVp3L2pVYThwTUxQUGZ1UE44R1Nj?=
 =?utf-8?B?Mll4bDZCQlhUbDVXa1Y5Q1A1bXFEd1kzM3h4L1NKcDhXQjdiSHhRS2kzRWRL?=
 =?utf-8?B?blhqOUFuT1RSQklQSkYwYzkvS0MyS2pSa3pqSkc1N1pya2ZoLzJJQ0tsVFBr?=
 =?utf-8?B?K1BDRFB6OGdrNHhLbmNmNDlwQThhVlN2dUNRcjlxU0cxRmVIbmR6MHJPakFS?=
 =?utf-8?B?U3Fib0tjU1ltdE4xMXhieXBPWnpuemoxWUFMdlpNMXoyZlA5eXlSMGZoVWMz?=
 =?utf-8?B?aFFtN0E2emg1TTRESW8yNWpIVm5YcGJPcHp6RjNiWnJIRFE3aVpNS0NpM3VC?=
 =?utf-8?B?dTNydDV4SDVaNE5HQ1FkRy9oZndDSFZpY0VtTUpTZEY1WGNwZDFOQi92L3ZB?=
 =?utf-8?B?Sk11Smt4bThMQ3E3Ujk5cHpvUCsrVmdnRkx2UjkyZ1FEbTJmbzk5UVdrOElw?=
 =?utf-8?B?WmkwYjM2NW85MTEzZjZHL3hYRThzL1JWWm4zSW5FYW16MDFmR1pmajZMc0pP?=
 =?utf-8?B?VEVWenNqNlFMRklSelh5QzRwU3N3TC8wei95Z0dIRWFFNVMwQTFCQ1B6Uzkx?=
 =?utf-8?B?bTJwb29EQkJPVzUyVkxYYi93ZWFhK0pDWUJSUWxWL0ZGUU5CZithM3YyUEcw?=
 =?utf-8?B?SllOaGJ0aTVoTVluYmZ5dU9XeTBxaHprb3hhQnJvS3h3VC9HcklHNVVZeTZ1?=
 =?utf-8?B?N3pTeHB0T21Qck8xWU1YODB1aXM4T25JS2c1bU9UKytrTFc1Z1VIYTRXbFc5?=
 =?utf-8?B?eG1QeVpFNWc3cGZFWGZyYU9OTVNjYU5RV1F6TFZ0N0dsNWNibWRjSEFydTE2?=
 =?utf-8?B?ZThPR3FvRFBwOC9ua2FYZzR5U3lRSjhFWVV2b3FrTXB4V3djZzBhakVQTFBz?=
 =?utf-8?B?b0hmTEM4LzVhZDJiRU1CdHgxczFhRGUxNGdDZGJOZFp0VlJEZ0VxVURaalM0?=
 =?utf-8?B?YTV0VS80Nk5McFVQZjhRaVU4RldkSmhmcU44cmpmai9LUHZqek1DTStsOTdP?=
 =?utf-8?Q?q9TmISlwmJdWh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTdUVzVtcStkTFI5S0VreHdtOTNSd201QWF3SW92cG9GUTlYTmF5UE1vbWV0?=
 =?utf-8?B?c0ExSnhsenY3VElxUE9lVVRFcVhhUklMalhIcDJ5MWhIZVR1OSsxeEZLMHA3?=
 =?utf-8?B?YmpGWkhBM1c1ZUZXaHNZeGN5RkF6cFRHbTBwR1hBaExmNXpNZEdiN040RzAz?=
 =?utf-8?B?Q2tvUXB3akdwQkhKNXAvWWJDQVZKYmhzZjJtaVJxVE40M2JrYVNNVmF6SkNr?=
 =?utf-8?B?UTMzZXVYZzVOM2JJQjE4T2Z2N3YzKzRxVlRJVzhpaG5URU40VTZZU0krQnhQ?=
 =?utf-8?B?aFNqWUdBS1VSKzhrMUo3TVBhUURjbmZ4TEkwUFQyaGJtR3pvdlVBZU50VlpL?=
 =?utf-8?B?NkgrUXFKTllWSTJOVlJQbTNlRXJmMUxGUzkyQWxCWlcxSmNmREJ3R0hFMC9E?=
 =?utf-8?B?N3dXaUhxQ1ZFMlN3cmdNQ2prMlRUdlFaSXd1ZXRpd2FmVUJSVzlEb0VTc0RS?=
 =?utf-8?B?WU4rbW9HR21CNVloYXhOWW8vYkFCVTlZYjAvUVNvNVVtSVQvWjdHUWZveTVl?=
 =?utf-8?B?eWkxRzlyNWxCdk1nZGxJcjk4cjNQMTRSZEliMVpSa0dxbjJvQVltWGFPQkF1?=
 =?utf-8?B?b0NEWWczMlV1QWFYbVNFeGo4ZmdqUng0bU0xY0xzb0NISWhsNUU3S0tPUy93?=
 =?utf-8?B?NnNQRWJBVVN3YnJZQjFvcEh5ZUhENnVzS3FQN0o4NEpTV1ZBb0ZGVFFkQ1U2?=
 =?utf-8?B?RVVHWkE1UlkwVjlRMjhIQnR3czl6WUVDMldsMVNQZnB3ampYYURWZjk2YWJ2?=
 =?utf-8?B?OXJtTFNwVE5YYkhESCs4by9NZXp2dVc1NGVMbGNsUnBodlZBbEhzM1RSaUVq?=
 =?utf-8?B?NWNDWnpIdWxSYUVIU050VmNYbVdUWVlFVndHR0ZwNFJVRXJ1a3o3MUNoM3pG?=
 =?utf-8?B?VjduRVhaREtDNFMyT1ZIVW1rdlBZcngycm9DODA4MCtHUHczUy84WFRENHJx?=
 =?utf-8?B?dTBEU3JsajBEdGdXYStWS3liUzdRTEwyUllQZ05oK0ZzS1pmTGVPSy9kU3dx?=
 =?utf-8?B?cGdGR3BTQ3B5RVN5Z1hTMEJVcHNPMlFQN2YzNTNVaDVhOGNMam9Ya3NkM3lF?=
 =?utf-8?B?NHV3ZnpkSS9ZNnBkb0tzWTg5UU5Eci80T3l2YVMva1JyN0kzSTBVOWZ0eHZN?=
 =?utf-8?B?ejRUREVhTU9EN2NzWVF0MHZ2anExMUVURnd1d0lIck1RTytMT2ZZWjRTMGlp?=
 =?utf-8?B?QXdud0l3bVpaZnBuUm9zT09uZ2F4S2lHWGNyVTJucm9lRVVlTVFpQXlhVi8v?=
 =?utf-8?B?Z2M2Z1hMYk85aHpXazEwMDEyVUpPenBQQWV3eVJmclJxVzRZU2RoaUFZa3J0?=
 =?utf-8?B?eUNtMytJWkJjaEZsN0tKMEdIVjJMbXlxT3E3Nkp0akxzT2x4bjJ2a241eGZD?=
 =?utf-8?B?dnBBOGJpNTVBTDhyYzZDdkEybUorMHhXdDRGVVI0ZE1RM3dYYStIWlJYQ05Y?=
 =?utf-8?B?TThYb3h4cXFyVXpvZVY4TWYwZlVxWnJGbEtwMGRMZXFqd3NaZUs4b3VWZkNW?=
 =?utf-8?B?VlF6R09nSHZ3SjJNSFFQY2lFVkhRZWNrdG9xbmhucGpvY2ZnWnpSZGhwaUJN?=
 =?utf-8?B?Z1JEeXRnSGd0RzBXOVRqSWhORmxmNFBZcE1VU0ZzTWlZbVducnBtMnBnUFJZ?=
 =?utf-8?B?T3FWZnh5TTIyK1VlaU14WDNTa3l2RGY3eE5hakFWaEpSdlBMcDBDZUczUnpX?=
 =?utf-8?B?dFhNRFZlTTB3TVc3Vm9wdXVNaFNSL3ArbVVVb3QyWXl5S1l3eklXNHRWVmZY?=
 =?utf-8?B?YS90Qko5UTU3WHN4TlYwZGt6R2ZITzlnenRTQ2o5KzJSa21lckdON3o2eXdk?=
 =?utf-8?B?WTIxRUpzR0xoblB6M3RHVC95MklEbjFMbDhlVldLWnpaRHd2emdaL3pJR29B?=
 =?utf-8?B?R013QVVoZEcrMFdhYmdyKzh0NTIyOGFmZ05XaHlESFN3QnRWVXNzQU42NjRJ?=
 =?utf-8?B?VkRtMmRod2t4L2t3NU50OGY1YmRSdGJIam42K01HOG94d2ViS0h4RDhodnlo?=
 =?utf-8?B?b2FIcUJzVkRNS2ZSZjVsVHBmZTlPZis1WS9nNVk1dEYzbmtMQWQyMEoyc3Zy?=
 =?utf-8?B?VHpOQzNoVEwzNmpoSXlwb3R6MnNjQnRlaXNaQ1NTd2N1cWdNUEQvQ0w5c1Yv?=
 =?utf-8?Q?DsAdRmNyuYPYq53+SfxGXVGeM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d40a04b5-cd7e-4564-0253-08dd28a38bef
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 07:28:25.1498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S39j3VNuzQNm0ey8zC9hGKWl9TgO+hvf/LfpC3ms+Y6cCKUiQoIjpjomjp7iW8oY1hIBcXFiQgqKiXo9LKE4og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9898
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

On 12/24/2024, Marek Vasut wrote:
> Commit a25b988ff83f ("drm/bridge: Extend bridge API to disable connector creation")
> added DRM_BRIDGE_ATTACH_NO_CONNECTOR bridge flag and all bridges handle
> this flag in some way since then.
> Newly added bridge drivers must no longer contain the connector creation and
> will fail probing if this flag isn't set.
> 
> In order to be able to connect to those newly added bridges as well,
> make use of drm_bridge_connector API and have the connector initialized
> by the display controller.
> 
> Based on 2e87bf389e13 ("drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach")
> 
> This makes LT9611 work with i.MX8M Mini.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: Cache connector from drm_bridge_connector_init()
> ---
>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 37 ++++++++++++++++++++++---------
>  2 files changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> index 07fb6901996ae..e67de148955b2 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -12,6 +12,7 @@ config DRM_MXSFB
>  	select DRM_CLIENT_SELECTION
>  	select DRM_MXS
>  	select DRM_KMS_HELPER
> +	select DRM_BRIDGE_CONNECTOR

Select DRM_DISPLAY_HELPER.

>  	select DRM_GEM_DMA_HELPER
>  	select DRM_PANEL
>  	select DRM_PANEL_BRIDGE
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 59020862cf65e..2f205512f3105 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -20,6 +20,7 @@
>  #include <drm/clients/drm_client_setup.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_dma.h>
> @@ -119,9 +120,9 @@ static const struct drm_mode_config_helper_funcs mxsfb_mode_config_helpers = {
>  static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
>  {
>  	struct drm_device *drm = mxsfb->drm;
> -	struct drm_connector_list_iter iter;
> -	struct drm_panel *panel;
> +	struct drm_connector *connector;
>  	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
>  	int ret;
>  
>  	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel,
> @@ -139,21 +140,35 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
>  	if (!bridge)
>  		return -ENODEV;
>  
> -	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL, 0);
> +	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  	if (ret)
>  		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
>  
> -	mxsfb->bridge = bridge;
> +	connector = drm_bridge_connector_init(drm, &mxsfb->encoder);

Nit: Drop connector and use mxsfb->connector?

> +	if (IS_ERR(connector)) {
> +		ret = PTR_ERR(connector);
> +		dev_err_probe(drm->dev, ret,
> +			      "Failed to initialize bridge connector: %pe\n",
> +			      connector);
> +		return ret;

return dev_err_probe(drm->dev, PTR_ERR(connector),
"Failed to initialize bridge connector: %pe\n", mxsfb->connector);

> +	}
>  
> -	/*
> -	 * Get hold of the connector. This is a bit of a hack, until the bridge
> -	 * API gives us bus flags and formats.
> -	 */
> -	drm_connector_list_iter_begin(drm, &iter);
> -	mxsfb->connector = drm_connector_list_iter_next(&iter);
> -	drm_connector_list_iter_end(&iter);
> +	ret = drm_connector_attach_encoder(connector, &mxsfb->encoder);
> +	if (ret < 0) {
> +		dev_err_probe(drm->dev, ret,
> +			      "Failed to attach encoder.\n");

It looks like no one else calls dev_err_probe() when
drm_connector_attach_encoder() fails, plus drm_connector_attach_encoder()
doesn't return -EPROBE_DEFER at all.

> +		goto err_cleanup_connector;

Nit: Call drm_connector_cleanup() directly instead of using goto.

> +	}
> +
> +	mxsfb->bridge = bridge;
> +	mxsfb->connector = connector;
>  
>  	return 0;
> +
> +err_cleanup_connector:
> +	drm_connector_cleanup(connector);
> +	return ret;
>  }
>  
>  static irqreturn_t mxsfb_irq_handler(int irq, void *data)

-- 
Regards,
Liu Ying
