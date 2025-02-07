Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DC5A2BE59
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 09:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAC110EA6B;
	Fri,  7 Feb 2025 08:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="EX1HGSnU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2108610EA6B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 08:47:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghdUFgSsSDLSJs0R6Fl0jXcgzaCPwXBIIFQ8suc9KMCcj2lKr1yCFocPwNpg9GOGDnYhglxcU+F3eARiorctTKQou8DTEQwuodWNdvl67GyWrHP2JhRmAaDuqUkEo1l/YK7Dvf4uPqME/R9FmmBtVXP4rpvukMcbPUbH3BHhgayj62VRUFrFYwBpU23lTIEfhNNx+hKScUibCaT+YiLcYPSDg03LCF/WAl88KhCc66RyYP3is67Dgfv/+7UfFyKaQ2R18Z7H3dH8PX1jTiqmzToRTzf/bV1pZLyUv7ZJElhIWBeazC0tLPPsaQKRRfL17mH8wr05vBAKJYW2adPbOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SH46aVv9/VOfH/xEb11ZtoX4HVKmA1nTMrYeld7JIEM=;
 b=lbyl+9sgxDiq3MVhARcSwCyRsYZmDglAeZmKtHh+rDkLzbgpduQqpLtYkrr2JCQhnh3oJXz3aRPzxLu7TRreooF/pq3NNtwCcSru6PBMuViiwB3M4t0jOgcQADW6KGuV94N6TSM+deG5rHuGaV3tuq+IPmsTmjXWd9sZERvj2xMNyxvsf/amj5CEcJNqtXZcauExi55TRTWaS7oeVhuee8+iFBW10CWGKEOwO5uj113Jgvr2MMZXZ7ui7GcYrF6JAJQjec5FYQQehX53pdy6p4ctIdYwKTVkEbTMDlAiQ5/UnG3uLhpCFFmpsZHF45TxL2caPVEh6+L2NcBGFRO13g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SH46aVv9/VOfH/xEb11ZtoX4HVKmA1nTMrYeld7JIEM=;
 b=EX1HGSnUVI6QkRgM5BbTc5vq2pWA7uTDBWGiig4Q2N6+JxsAR+5GkvcBmSspfyLkW+BmeWDzlro27FKZaxlNmNZctLFrp37ECx6CIYAqEVfaTph16Ph6RYUqseAHKa8U5V9UkJckdzbEdBLV9O24P8AncgxVqRiBtm+c0pXINlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB9833.eurprd04.prod.outlook.com (2603:10a6:800:1da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Fri, 7 Feb
 2025 08:46:58 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 08:46:55 +0000
Message-ID: <dee642fd-e50e-44b2-8482-a1ffc7948517@cherry.de>
Date: Fri, 7 Feb 2025 09:46:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/bridge: synopsys: Add audio support for
 dw-hdmi-qp
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Niklas Cassel <cassel@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>,
 Kever Yang <kever.yang@rock-chips.com>, Johan Jonker <jbx6244@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Algea Cao <algea.cao@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20250203171925.126309-1-detlev.casanova@collabora.com>
 <20250203171925.126309-2-detlev.casanova@collabora.com>
 <db29945e-565a-490f-8a8c-387ecd47a198@cherry.de> <13709044.uLZWGnKmhe@earth>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <13709044.uLZWGnKmhe@earth>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB9833:EE_
X-MS-Office365-Filtering-Correlation-Id: a85854e6-d1a6-45ba-a52f-08dd4753f9dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0p2ckVjRU9ZRmRIK05UM2pWT1EwL245UFNjK1RrbDNsZWNYN3FQTVJobk1s?=
 =?utf-8?B?Y01UdGVBdmdVUk00b0dFd052K3hwN3NCQlhpUHRZaDkxV2pPdXlCZTJPVktF?=
 =?utf-8?B?Uk5sUWMweG1qcUNhb084SGxzWURqZUl4VXhHVnpYV2hGWEV0MFhwYVpDK2E3?=
 =?utf-8?B?Y0dOQStwZ21UbHRxUjJ1UzVmTHFDdXA4cEptL01qajdpNTdTeURyd05BUHJh?=
 =?utf-8?B?RVZRKzdYWUlsYnVCNmRYRENjTUhITkxwaDhZTEhVWUtqWmc0S1NhT1lrVTYz?=
 =?utf-8?B?Y0xmV0JEblJrbDRYbk9qUE5ibkRQdXJ0T1JyWkRHRkdxekpyUTBHVlFpa1Bj?=
 =?utf-8?B?Uzg3cWM0dEZXQXVKUHZUYXVUYUFaYkhGWW5CbGlmczlMcWZaVnZIVnkyeC9k?=
 =?utf-8?B?elM4cGJzd2E1RFBwcUFnREtYL2lsZk9NOFVEdXhSSlV2K0tkQnEweFVBMHZu?=
 =?utf-8?B?WFhkRXFzUThrSktnNEJ5cUlkZlpFczlyb0I0bFFJdEY2elRZSndRYkpUUEt3?=
 =?utf-8?B?TGVhK3BKRUZtUU9QaVRjRk8xMXdtN1BxWGowU0hIRjZodjkxVVpIQXhoQjR1?=
 =?utf-8?B?aTA0Lzg1bU95U0ZIRy96M1l5aXFXL0NDQkhIQ2RvUjhieXVMVkNPNVJBSW4z?=
 =?utf-8?B?NnRTcm9rZTlzOVlabkZicXIrZEg2NWVSbDdUeDRVTzFiQzNmM2pQNmVZVHFp?=
 =?utf-8?B?UGR5ZEN6Umxxc0NvazNvalBucVRIRFRNcEtXdEFtV3dicm5YbXQ4RG9HVjR5?=
 =?utf-8?B?dkhrczR1aWtFdFdmYlVUV3NMSTlKWXhMYUc3amRMVlUxamlQTGRaZnJPbW5S?=
 =?utf-8?B?cmxpQkRWMm0yWGlWd0RRa0FOdENhRkxvdlora3R2cngzOTVsWHhrb284Z2lq?=
 =?utf-8?B?Qm5XQmF4a2I4M0F6NC9ZZ0ZvOEFjN0x2TEhnaUdkeVQ2SkV0RXd5dW1OVDVp?=
 =?utf-8?B?aXo0elUrR2VpeHArUVVYaU80TnNKSWtZd08vUEtJUzlaci9tM3B3NHpkVEp4?=
 =?utf-8?B?dHd2cjRFMVFwUjdnWjJVZ2h0YkpSdHhIQksraWw0bDltdm9pMFRnZGdPZUkz?=
 =?utf-8?B?NDZQUjJlL2JkUnZWSzBXVXB2bklOMG02eTlCOGFpR0VJWERWRDV1Q1RCNnF5?=
 =?utf-8?B?ZVAyMzN6dmFtcm5xRmJxY0NLYklIdXNRdm93L2RmcnpSUUQ5SGYydjFxMUZ5?=
 =?utf-8?B?UEsyaGo5ODhsZHBvTUZOc2Y4OFdndDNQb2F2WjJvTTVLVy9tR215YnRBUXRU?=
 =?utf-8?B?ZDV5blVVZFdJM0U3aEQwU0MweDUwK1kwSU1lcER2amNac0t4SWN0S0djeFBG?=
 =?utf-8?B?NTE2eFlGY1MvRjdwRUV5V2ROMFBPZjVhOGcrRjlkOUlkcmpSVjFUeWhDSk8x?=
 =?utf-8?B?SmZVZWdkVXpJdk4rZUNrYkh6YmNsbzMvVDJwTStrQnhadHRPdGJyUCtCWXZB?=
 =?utf-8?B?a3ByMDRVTzN3cTRDbGxYNnl6b3c1MG5TcDJBNEZBeUI0bXpXeUpIM3BycDAx?=
 =?utf-8?B?Z0tmVlpkTzFMaW16MitXMGRWOUF2cEVHUTFXaHgvUTNBdjVCZUExVk1uaFpq?=
 =?utf-8?B?UWkwZFZ2T09sWUxRYnplOVRxanVhYlptUnRHUGxFZE5rb1hsdFRUVXMvZlNm?=
 =?utf-8?B?dThiUm1vc0xsVFRMb3NSRVhZcnV6a2tEMjNacUR3ZXB2U29NQ24xcWpFNVpP?=
 =?utf-8?B?ZFlFT0l1d1dPZlJpMko3TUxCb25jRUdvR3RSN3E2YU4wMythVXRjZ3dKUXZD?=
 =?utf-8?B?OHp3WkRsRWJKUnE3RmhqTDE1dGQwTXY5bW1BWEliV3l3aE9BN1JlQ1dreHM1?=
 =?utf-8?B?WGtBWHRjSnl4RmltRk1yZ0NONXByK0hJWGt6QjhycERTQUtqZEdHL3E3cE5h?=
 =?utf-8?Q?qo9Gc/XKQ5Kle?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clZRT25oVVYvRmRBcG05TVdhWlpzM0VMVUVYS0VrcFFDNDUwRHhPamxxWnNN?=
 =?utf-8?B?aFV2ZTFjU2lUTDM5Yko0aFBHVzIwWXdhQ0h6aXR5YTUyN3c4SUw3cGhGQ0xG?=
 =?utf-8?B?ZDVGdktLVEtpL3Y2OUxPdUpxbmU5dllNS3B1WmFseW9obW8zV1FUWVg0OTdm?=
 =?utf-8?B?Y21lRjB4K1lrNXdLNGhkS3V3OWxsVWpzZ1ZhbnFNYXFWQ3VSaWxpRGVDZ2VJ?=
 =?utf-8?B?ZjJnNFR6K0tLaXVwVDExMHIxVlU2YXhZUjg5UVRhQ05oNWEwakc3RXVuZit4?=
 =?utf-8?B?RDBMOWFsamtWTGJSanFKd1ZOSEJDM0d1ZnZkU0diZkxUUFY3dG5LcnlONjdn?=
 =?utf-8?B?dWwrT0NORi9nWExKVVBxYUVyUVdFSWxEbnFWYitDN3NEYzkwWkJjL1VaYm4z?=
 =?utf-8?B?Smo2cDVJVVRqUDF6RnhDVDJrdUhjVnNRcTFiOGs0T0VvRjAxWlcyNjRNNG5J?=
 =?utf-8?B?V1FOdDBnakkvWmNTcUwybjQreHIyVmtabk9YbEVtVU83Uy9EYTFNYzRzVytW?=
 =?utf-8?B?U2NTOGNBT1NpVlpWeC9rWWE2UDZvY1FDendmZUNNRzBMVUt0Ky9xUmJKWUc5?=
 =?utf-8?B?dHFuWmpMOXZUeUg2Tmt5UjRjZTNOb2RMbzQvbzNJUlc0azRqMTdIVFhmNXgw?=
 =?utf-8?B?eFY5ZUJLY01OMVBCaW9BcS9jSm4zNmI2MnZwSTBFT1VVUGllN3hJaUM3a08y?=
 =?utf-8?B?Q2JvazJ5a0RCVjRoTnRJQ1JuOC9uL2NRNGJvZWtVZytLdHlTSEpmM1N3clVk?=
 =?utf-8?B?MzZoZG8zcVZoQytySXJ4NGxidzVmZXRNSzBrUm9QenVvNUFWQ2RyN3ZWSFl4?=
 =?utf-8?B?eUlLREIyZGp0TytoVEVyTWJCSjhyYktEUzJnaHdxWUZjLzNIS2RwUHlpZ01r?=
 =?utf-8?B?MXR1YldoNmRpVlpCbjRqVnpZK0w0TDMycWEyTENHY2F3UDUwMG1CclV6bGJU?=
 =?utf-8?B?V1Z5cEdaQk81dTZObXJkTll4M21MQ25kV3Noc3BiYmtCcDROcTFvTythZzZB?=
 =?utf-8?B?QmJSR0p2eXdualVVV0lWSHN2aHdpZnNXOC9ncGRLSnBuRkJmVlV6dmdCUUJs?=
 =?utf-8?B?T1BQak5uV3dvVDFuZ2M1ays3Qk40cURqbEkzRDErUFJNQ2NFOEZYRWtGVHdK?=
 =?utf-8?B?a2tveVZqdXNCK25GVlhRb3RhcWtOMGttTk02Q2tnMFlqVGp4RUJ1dHlEWWFj?=
 =?utf-8?B?Z3F2NUM2K2dkYVNLa1dPMk1IeWw0cFUzMW4zcDlyU1U5akV2Mnd3WGt0Z3Fj?=
 =?utf-8?B?N3J2Ryt0WjVKOUdvdjcxSkZqWDVLZE9KNnN2SFpjWlhucnQyOERkQzdXaWRB?=
 =?utf-8?B?T0grMjZkbVVCVE1QNTVjRnE0K0M2dzZoRklqM2dwaEdpZnpPaUpEaStRTkJv?=
 =?utf-8?B?NXo4RjhMdUhXVEFLbXVnUnJHc3VYaFVoNWpodm9XOXVRZjdKUk1IWWxwUTJp?=
 =?utf-8?B?Nk9ja0R5RnlmSmxYZ3BjYjZmRmtjZlN1S3l6TWo5YkVtL3JCZkFNNHZBSlhE?=
 =?utf-8?B?T2xKYlZvZENUSjBHVjl2Nkp0MHpoNmg1MlZNdHhUSTRUbG5ycFhNemt2a0tw?=
 =?utf-8?B?bkR6MEh6RitkeEhCTTR4VXBPazVNdU5HMHJMZ3c1c3B4ZkhoZHJDODRNdkY4?=
 =?utf-8?B?YzAvMFRBNVM3ZUFhTUtNVnZhd3RYNEw1YVFzUjAzT0RwMEcxQ2o4eGtHSCsv?=
 =?utf-8?B?M0Y0YTdDVzV3U1o5TXRURk1jOUNXdm02c1BXSWNIV0Vwa2RCb09pM2IyeDRv?=
 =?utf-8?B?T2VUR2kvWEJacHkyK3hLVk1ndHphQUVsSkxxczhwQnlhbzdXYWpOL3M5TzFH?=
 =?utf-8?B?RndzNWtoRzE3VE1yeHlMVWpQZFNOT1RoK0RHQnpuTEZYYTliaXd1S1BxR0FR?=
 =?utf-8?B?OXdzWFE5RWMwTFpaRGpNb2ZSNG45cUhIN1VETmhqMWtETm50REVDMU9oTGVm?=
 =?utf-8?B?ZlJhVWo0MTJIRWl1YWN2VjNia1hhYWNpTjAyMlcxcHd4MnF2azc3R0VWcmVr?=
 =?utf-8?B?WE15bGxubFZ6ckJSMlNJUEd3d25JTjE0WWxCQjJDdnBPaWJVMVl6SGttR2JN?=
 =?utf-8?B?VlozLzhtMVFzVURWZzF3elRSTEx1TmM1ZWdDLzFoZCs1UDl5QzdhVUpQSFdP?=
 =?utf-8?B?elhJWTJXNzFRUy9oTmNtbVhkMytZbU5hZ0tqZmlCWFJyMlJHeVRqamZyRExz?=
 =?utf-8?Q?VuCE8nzlzNY+qfQSiDJKg0M=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a85854e6-d1a6-45ba-a52f-08dd4753f9dc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 08:46:55.7852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYfD/uaK1W2/xUcigthW8AizuJ1nyaDQJPc4IPcetSUuwBocTEqhTFs9t6wXCXZ3d95mmiwuy44g+9dlgMrvXibwvyMaKFUhdM+Jo2kdUnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9833
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

Hi Detlev,

On 2/6/25 9:40 PM, Detlev Casanova wrote:
> Hi Quentin,
> 
> On Tuesday, 4 February 2025 04:59:12 EST Quentin Schulz wrote:
>> Hi Detlev,
>>
>> Just some drive-by comment inline.
>>
>> On 2/3/25 6:16 PM, Detlev Casanova wrote:
[...]
>>> +static void dw_hdmi_qp_set_audio_interface(struct dw_hdmi_qp *hdmi,
>>> +					   struct hdmi_codec_daifmt
> *fmt,
>>> +					   struct hdmi_codec_params
> *hparms)
>>> +{
>>> +	u32 conf0 = 0;
>>> +
>>> +	/* Reset the audio data path of the AVP */
>>> +	dw_hdmi_qp_write(hdmi, AVP_DATAPATH_PACKET_AUDIO_SWINIT_P,
>>> GLOBAL_SWRESET_REQUEST); +
>>> +	/* Disable AUDS, ACR, AUDI */
>>> +	dw_hdmi_qp_mod(hdmi, 0,
>>> +		  PKTSCHED_ACR_TX_EN | PKTSCHED_AUDS_TX_EN |
> PKTSCHED_AUDI_TX_EN,
>>> +		  PKTSCHED_PKT_EN);
>>> +
>>> +	/* Clear the audio FIFO */
>>> +	dw_hdmi_qp_write(hdmi, AUDIO_FIFO_CLR_P, AUDIO_INTERFACE_CONTROL0);
>>> +
>>> +	/* Select I2S interface as the audio source */
>>> +	dw_hdmi_qp_mod(hdmi, AUD_IF_I2S, AUD_IF_SEL_MSK,
>>> AUDIO_INTERFACE_CONFIG0); +
>>> +	/* Enable the active i2s lanes */
>>> +	switch (hparms->channels) {
>>> +	case 7 ... 8:
>>> +		conf0 |= I2S_LINES_EN(3);
>>> +		fallthrough;
>>> +	case 5 ... 6:
>>> +		conf0 |= I2S_LINES_EN(2);
>>> +		fallthrough;
>>> +	case 3 ... 4:
>>> +		conf0 |= I2S_LINES_EN(1);
>>> +		fallthrough;
>>> +	default:
>>> +		conf0 |= I2S_LINES_EN(0);
>>> +		break;
>>> +	}
>>> +
>>> +	dw_hdmi_qp_mod(hdmi, conf0, I2S_LINES_EN_MSK,
> AUDIO_INTERFACE_CONFIG0);
>>> +
>>> +	/*
>>> +	 * Enable bpcuv generated internally for L-PCM, or received
>>> +	 * from stream for NLPCM/HBR.
>>> +	 */
>>> +	switch (fmt->bit_fmt) {
>>> +	case SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE:
>>> +		conf0 = (hparms->channels == 8) ? AUD_HBR : AUD_ASP;
>>> +		conf0 |= I2S_BPCUV_RCV_EN;
>>> +		break;
>>> +	default:
>>> +		conf0 = AUD_ASP | I2S_BPCUV_RCV_DIS;
>>> +		break;
>>> +	}
>>> +
>>> +	dw_hdmi_qp_mod(hdmi, conf0, I2S_BPCUV_RCV_MSK | AUD_FORMAT_MSK,
>>> +		  AUDIO_INTERFACE_CONFIG0);
>>> +
>>> +	/* Enable audio FIFO auto clear when overflow */
>>> +	dw_hdmi_qp_mod(hdmi, AUD_FIFO_INIT_ON_OVF_EN,
> AUD_FIFO_INIT_ON_OVF_MSK,
>>> +		  AUDIO_INTERFACE_CONFIG0);
>>
>> This is all very I2S-centric while the HDMI controllers on RK3588 do
>> have the ability (according to the TRM) to use S/PDIF instead of I2S. I
>> assume the driver should be able to know which format to use based on
>> simple-audio-card,format property? Is that correct? Then current support
>> which doesn't even check for I2S would be fine and not conflict with a
>> later commit which would add support for S/PDIF? (Essentially asking if
>> we need another DT property for the HDMI controller node or elsewhere to
>> specify which mode to run in instead of expecting it to always be I2S).
> 
> The hdmi_codec_daifmt::fmt field already has this information, based on the
> simple-audio-card,format = "i2s"; field in the device tree.
> 
> I could add a condition in dw_hdmi_qp_audio_prepare() to fail with -EINVAL if
> the devicetree specifies anything else than "i2s" for now.
> 

All I was asking is whether we can (easily) check this property is set 
to i2s the day we want to implement support for S/PDIF :) If that's the 
case, then I don't think we necessarily need to check it right now, but 
a -EINVAL would be fine too, up to you.

> I'm not willing to implement support for the SPDIF path for now, mainly
> because there's no need for that yet (I2S works well) and the downstream
> kernel doesn't implemented it, meaning it hasn't been tested a lot anyway.
> 

That's fine, just wanted to know if a "backward-compatible" 
implementation for S/PDIF would be possible in the future would we want 
to support it :)

Cheers,
Quentin
