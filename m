Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0043997C59
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 07:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87EA10E860;
	Thu, 10 Oct 2024 05:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hdJBE+eA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2067.outbound.protection.outlook.com [40.107.104.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B898410E85F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 05:22:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHUYwEZTXIO/zfmP5kl1c4vy1CaF20hjIky9GPnjiPedLBgcvD57FBLW1rNyIh5u6YMJ0ZPK8FqzpqqE20rW8i+TaP9PA2IyFquGFCIT+q6jIoSlgOcMIHCe+B0LtSxVMbAN0FipsIWx1sv/wUUCVzvpOx0pbiS3acHDejfcfPTJK+DmsHJhYAAilREw3cqJfCz+NlpEDRECLb2U1Xh0/bgOm9JISg3ivZfQS55PN/bIPyTqxiOtyebEcusHAzLqU/PYy7vpfokTksIu6jjGyySwEAv+ZgqljJUwXmSH9THNyBIif7WNV+cMEL5Ejtua23Pr36XtSa+0qe85KoQ4wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTiWlXUcDL/fSn8of21x+p7Iby3nmNh06hHJOkRV0mA=;
 b=sX+nOGhLNELCT9WwiBWSUhmtR+3xbUOFq2Ck+w1jpQCA+jtTygOA5Kq3BRv5BDesDtZTv2mLpM88N6oyQntwZ/PC53ENrmKID42WKt40AT5omcuSYfFHHaXyQ+LN3dLanqObJw07cPGTX1d2oUNIblEvpV5SIGlfb4nQCbukGZyV7r3ZRSheRIGWzpkhJs01BSfva9QipEuwaBfXUxQxfQHCqlKMEFCGOswvhRbHh1jdJwt1wnxx1DMJccr/T7Qc/bBctVomZ2cGmy/A48wVKxHXGSg55Fklq9Fo86Ya9U0P5xz0hw6xIKTaWV4U/FcZ8J1ayEH25AlbQbB10MIlVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTiWlXUcDL/fSn8of21x+p7Iby3nmNh06hHJOkRV0mA=;
 b=hdJBE+eASgL2HLpbkxb2xYJVs/HL3tobqZtQ0vk4WvqAwEPsClVHr0AjYHMfHhrT2r8e44vXj7uIqP6Yp69SwgJYU/H2SaWzMUVqjDhZXkz7TLwlcci+D9hdPxBEOvbiA/gPJQ3LMvXzc1OWxGb1wNpEefEUm8lDUFvpXabV8zdoJ6TJPzdJK6RxwcsxuqVXqHdZKMKTu+g6XpuQ0DLoyISRlULRkAwgsE5GjOKuhkaeh6F9rSzZNd3Tcrin3FHMVG4ySazfjrwDVHKWDhE1C4xTrTJsriBXkjIBIe3VQ1lDFQ8L03EygBtcmzkmqTMqTaUqGsxqb6dmD7pCewdjwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7663.eurprd04.prod.outlook.com (2603:10a6:102:e9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Thu, 10 Oct
 2024 05:22:15 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 05:22:15 +0000
Message-ID: <dbede671-c97b-4ad7-8a54-f1b381fea082@nxp.com>
Date: Thu, 10 Oct 2024 13:22:40 +0800
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
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241008223846.337162-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0189.apcprd06.prod.outlook.com (2603:1096:4:1::21)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: 28e948ad-e262-47fb-8268-08dce8eb8067
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aURnMUVHb1lHL0FqOUtHZGNXdFUrYzVDRUNmeTA0K0Qxa1o3ajFVOXRBMmZN?=
 =?utf-8?B?RWZmcE13SXIyWGlDZlpIQmxQT1dRUDhKZFJ6VUNKck9FY1FQYThDYnZNSTBI?=
 =?utf-8?B?ZlRsOXdUemIxaG1Zc2pmZnFHb3pTVWEzUlVCVFN0b1VlZkpQQkdERjRBTHZl?=
 =?utf-8?B?MFJkaTB3dXBvTXhiekhhaWpySU5mMWxhdGl3UzJmOGJCa0g5VlBRN3kvdkNQ?=
 =?utf-8?B?L1lOM1BObktKb2ErTlVTb3Z1TXhwTnVTc1dqVXZBOG5nY1Z0MUtiTzJPNnRU?=
 =?utf-8?B?TU94cEFoaEp3KzM3dEtwVmtKVnprQ05lb0FvNEhKYXFRMjY0U0cyRzNZZ1pR?=
 =?utf-8?B?eHkzT3ZmWWdSZW1hM0RHT1kyUWFtUzdXRGs3RUVCN3I5eWRQZnpTUmFWS1ho?=
 =?utf-8?B?d1ZTclFtOHl3WCtDL1AwNjFKMGwzSlFzMUdPRUtOdFNaeU5tWVJJbkJ0ZERD?=
 =?utf-8?B?a3laZWE5eVF2ZVNoaDc3eVBCL0JFOUJLOHZtVlEyeDdjbEE0elJpa3NnM1VF?=
 =?utf-8?B?QkljV0NGT3lVRzFtaUJ3ZjdzVytqQXNCaW40VFBuOCtXL2JUS1ZKdmUwVVFl?=
 =?utf-8?B?VitoaVlLNW5QRGl6RkVDV0xDbU9PVUlSeVlpQTN6NXZkUjJnMFNvenZkeXc0?=
 =?utf-8?B?Vm9Gb1ZqNWRaMURCRmJzY1JWbW85dm1YcFV0aE8zTjgrMG5iRnc0WStZWVJx?=
 =?utf-8?B?amo3ckMyWTRqanNGMjQxZWgrMTFMSkR1OGJOOXhOQmMrRjhmSC90MnMwZHpM?=
 =?utf-8?B?REltTCtGOEVBb3duOGFBbGNRakJXS05ReXpJMmczNVZYamlYWTB5MkR4Qkc4?=
 =?utf-8?B?SWRnSE9lS0piOTVYUWxYcmxjdmxMdHd2VldsMHdsdHI1U3FoMm9HTTY4Q05E?=
 =?utf-8?B?ZkFjZnM1di9FK1k5UnVrWjRjbFlVWWFmU2plZ0dROEk0NS9qM29vQWhNQXFl?=
 =?utf-8?B?UnJSZDZBaDBET3pnMjdNN0ZqN3docDBrNTgxM25ReHlWZE1YdFM0NFMrem1t?=
 =?utf-8?B?NGdQUzhNRDVTZXpNQm9SN0NJMnVuckhQakJ4clpMdjVyRXdaQXFxTnhDRUdn?=
 =?utf-8?B?SWpGSUpNdmxPU0FYN2E5dEpjYmR6U2YzTEwxTW9MWThMUXJ6b0dJSzBKZzds?=
 =?utf-8?B?eHZoMXlRYjlEZ2Y3NE1RbTJMTHd2VFBYNkFHeExmQjJyd1l6ejhCYWNyamU3?=
 =?utf-8?B?K1JJUUhESFVIRnBOcmxNeHBXWVVOVzYxaklVMy9WWSs4U0QzM3EvY05VUk1r?=
 =?utf-8?B?a3BUaktMMzJBN1JnSWY5Uy9TR0x1SmNCekxzcmtpOVdrUi9OKzV0clJkWkM5?=
 =?utf-8?B?L2JZQ2YvOGNyLzU0alg5dEx5ZVFEVHJNUWpXbXpXTVFjNmpjc0Jyd0dtakFW?=
 =?utf-8?B?bkl4YkV5bk8vQkZqdC9VTU1rMlJJTWNsQ3lBMXZNUG5iQzgvRGpHeDZEcGJn?=
 =?utf-8?B?SUlyWHQyYlJST1IyOW0rMGZFc2Y5M1dsQU9JRUEvbjd5RUdrNWZYZ0o4Vk9j?=
 =?utf-8?B?QzBraVpJeVpMWVA5QUdraXdPTHhOTWI5dnlnQXhLc3lqTk9WMFB2enNYaG9G?=
 =?utf-8?B?T1VIWmlqUmhZdytmQjZsN3JVK0ZsUmRzM0RPWXlUOGtHeE5LcVZBQzZrRFFv?=
 =?utf-8?Q?oLyzgDKWgqzSCEPuFJN6eblpb+tdd8DLmtRE4sze2Ucg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDAvZ2xmMHUzNGZyU2Jic0psNzNDREdvaGcrelNDdWdHZlNYUnFsMExEbEZy?=
 =?utf-8?B?M25pUFB0bDV1dHN1UmZacTFmYnExNXFPQVhLUjVseUNZVld5TlVKUWdLcXFs?=
 =?utf-8?B?cVZCR1ljeVJDbXJTekxHTDRSeWVUK21nZW1uM3g5V21KZnpwZXh1d0Ftd0JO?=
 =?utf-8?B?YXJQbkpJbVFYam1kNmpyUGJUT1R1Sm1UTlZWKytLeThsWFJOMklocVZqdjZT?=
 =?utf-8?B?UHZFL0xzWkkyeUl0c1B6V0hUWWtjWTdJTTZ2ZEVxbFBqd1RyYmZUR2psOEdE?=
 =?utf-8?B?VWpWeTBIRUhRaDJhanI4SDFmMk41N2NkajV3eVFKR3VnT3NjYUJGbllsdjZJ?=
 =?utf-8?B?SmJoMWNNdngrRU9MbDZJZjVyeGUrUXVLQXV5MU5OWTU4b2l0MTdpWFBsQWVT?=
 =?utf-8?B?UCtEd0RlZDZ6aFU5VEZXSkJFYVFlcWRZZVpHYXNpZTNOdFNaZndWbCtaMkFv?=
 =?utf-8?B?VXNzWUVSYVlqOWZRVm9MVjh5bTNuQktCU3kzQitwNHhvYTVqaHJiWEJDcWZX?=
 =?utf-8?B?U3g4Q2xFZXgrRnNOaERkYWg2TjJ0bEZTSGJGcHhoZVBzWmFPMklVNmZJNEVT?=
 =?utf-8?B?SHJRZm5KaDM1Skdta0JlUnJtZzBkakVSRVNtdStDSWdUYW1TQldDRU1TOVpt?=
 =?utf-8?B?QnpPcTVJd01TMWhnMjNhcndCdE85akdXWTB4Y0hORllnbTBsRWZZcElsT01V?=
 =?utf-8?B?bDJ5cllVRnJtUDdEWUJ3aXBrMExkWnh2NXVXWGVOYWVaZ0lXRXBsTHBqdEl6?=
 =?utf-8?B?U3d3bzBHWkg0Z2RJU0ZXTC8zL3JqNGJJMXBwZjNpNEZUY0l6c0hidWhvcVI2?=
 =?utf-8?B?Q3A0VUtVeXNOL2JWRmhtWjVHNnl0YzZuYXBWVVlXb1dSUlo2eGJiUDluTTEy?=
 =?utf-8?B?SjBtTVNZMkNhazRqTURqSWhObE1QMFpQQnI2eUVHdjFGUFZWenQzQXlaK1dj?=
 =?utf-8?B?Uk5NKzhpbWVOcDhjZ2E3bmxkOU9QT2tBbncyMDZDYnAwYVJpbGNKVisrblkw?=
 =?utf-8?B?WW1zSWJhWk1hems4OUdQdEdLakVPNG9XNFg3M0E2UW9RZWZ2WUVvR1kyQmVo?=
 =?utf-8?B?KzBGdHk0RDZTQS83eUQ0Q015bDIveW1qNzNnbjhmdi8xQnpJQXZ3TThrMXUv?=
 =?utf-8?B?TEZzWDMvUDhWUjAxTTNQRGVYNXh1SGNXWTlXb3ZBWndEZHI5NDc5OXRHSEpt?=
 =?utf-8?B?QlFLR2syL20vTFFqMXVVZWFIS2hBTDVlaXVYemVWeUFoKzlyWUlrQWFzOGRN?=
 =?utf-8?B?Q3plZnZXeno2ZlU1MnF0SC9hUnA5eUJSbU1OdEo4dGNpY3l6dHJGM2tJNVFJ?=
 =?utf-8?B?Q3plYXV1bEtScko2ZVN1SDNEalJxei9zTi81MVcyNEo3S1VkTlZKMm5adlV0?=
 =?utf-8?B?akNobG5NaW01QXpSTlJaS1BGZitzWDUvUGdsMVZNUGhXZHVUa2RPcDJBcU1k?=
 =?utf-8?B?bE1vZDlVcjdITUkyTmV5REtVc09OS1JPRVUwS1UxblJkWDM5OVdrMS9DdU5Y?=
 =?utf-8?B?U2tMVVM2VmRFY20wWGF5ZjNQNXE2UHVoSG5mQnc4RTdxdmRjVU1TOG9VVllx?=
 =?utf-8?B?eVdGbDJpc0h3OVBXTUlNM3dRWXNGQlIwVk9sMTlvSXJ4N25mcUNEbXdZT05o?=
 =?utf-8?B?MkNxNVZmNVdibnptZGIxRnB4dVBtajJBS2d2MnQ4c2E3bnVuL2NEcGhGWjA2?=
 =?utf-8?B?UHlyaG5JSG1XdFE2dS9RUnAvR3JLdDJFVGpiYlBhcVYyVzlJd0ZLMXBQSGFx?=
 =?utf-8?B?SHN4am1GZjMrNk5ZR2EyUDVVM0Y4ZXpqSFlJRWpWdGRVN1Y3OHVEcXVGMURG?=
 =?utf-8?B?Z29pbDhPb0xkUWFCL2lBNjBZUndjc01URktZUUR2RkNMSCszd1ZXMkIwYWtB?=
 =?utf-8?B?enVaRm1wN0plOHVEbGcybFZ2ODl0QXFKb0NINitiL3ZjK0J6NDBwVVVNTDB5?=
 =?utf-8?B?QlA4UWpEUEZ3THo4dXZaNlhJdmp4UTB4Vmc4dVhXd0hZbmRFYXhGZmx2MlJV?=
 =?utf-8?B?WkM2cDNsbHJlVHIxZHBVTjQ1R015ay8zTExMR08wNjBuWkdrS3FZYVo2RUlX?=
 =?utf-8?B?bkhuY1A4U1VSZlBoVUxPVEY5VGtXTTVzdlJ1OElNNys4aWRmdHJBbmdrT3lz?=
 =?utf-8?Q?Sxl0/JAGgyXxg7DWBZNt5idxE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e948ad-e262-47fb-8268-08dce8eb8067
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 05:22:15.0649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wlyQcNPJUdrCxmr3fRQrnmcpXlGJ9PLb+xX+v17tQ5UKoIlZaTOEJKA3Uvnzw6QdNXR+rwMPtNZSRKpOjEkU7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7663
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

On 10/09/2024, Marek Vasut wrote:
> The media_ldb_root_clk supply LDB serializer. These clock are usually
> shared with the LCDIFv3 pixel clock and supplied by the Video PLL on
> i.MX8MP, but the LDB clock run at either x7 or x14 rate of the LCDIFv3
> pixel clock. Allow the LDB to reconfigure Video PLL as needed, as that
> results in accurate serializer clock.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Isaac Scott <isaac.scott@ideasonboard.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  drivers/clk/imx/clk-imx8mp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 516dbd170c8a3..2e61d340b8ab7 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -611,7 +611,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
>  	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
>  	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
> -	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
> +	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite_bus_flags("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT);

This patch would cause the below in-flight LDB bridge driver
patch[1] fail to do display mode validation upon display modes
read from LVDS to HDMI converter IT6263's DDC I2C bus.
Unsupported display modes cannot be ruled out.  Note that
"media_ldb" is derived from "video_pll1_out" by default as the
parent is set in imx8mp.dtsi.  And, the only 4 rates supported
by "video_pll1" are listed in imx_pll1443x_tbl[] - 1.0395GHz,
650MHz, 594MHz and 519.75MHz.

[1] https://patchwork.freedesktop.org/patch/616907/?series=139266&rev=1

>  	hws[IMX8MP_CLK_MEMREPAIR] = imx8m_clk_hw_composite_critical("mem_repair", imx8mp_memrepair_sels, ccm_base + 0xbf80);
>  	hws[IMX8MP_CLK_MEDIA_MIPI_TEST_BYTE] = imx8m_clk_hw_composite("media_mipi_test_byte", imx8mp_media_mipi_test_byte_sels, ccm_base + 0xc100);
>  	hws[IMX8MP_CLK_ECSPI3] = imx8m_clk_hw_composite("ecspi3", imx8mp_ecspi3_sels, ccm_base + 0xc180);

-- 
Regards,
Liu Ying

