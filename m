Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AEE9DA2FD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 08:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C8410E073;
	Wed, 27 Nov 2024 07:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="mZwDdXPK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9CE10E073
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 07:24:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQdGgV1X+DZA5Zzv+ruD1fW90b1Qm+OH27qF8OU2zxRItKeYdR2VInDYPMeGg9AOYgcC4LX2MXhUwFhSR4LxP2t9vpCLYdpy6aO//gNQgJFH7QdVgCe2ek63RfYxv/eHKiA2IgSFQBVMGr96fXWdODQLILHptnHyYQeaBzVUqn4Yvz06fCuBh3i0xUDA8k+gi6Vu77u/nBIX8Qsx2zwykaKhF5kdQxWXcRdWrsvNFOyfJTuSj3XDK84YJ9o4S9eWfBtcSJwIt7oAd81aZvKXrgcz4NPv/Q1EWY0zy6W47wdsHGaEBof1GZplIvNLgv48at3HLUAZZkFHX8xZscaM1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoPbv42qmXlqNPBG0tdUC3QG78xGWMr8I7suB7T10No=;
 b=GA07BHQAyAq8RuK/CGlCYY/JbZ7rti5RKW4twf+CuVSYEE7F6jtsYgVXvDhMB0HcU/s2wTuAWV7rKWTDRJIZlPbH8xVJv3xOZ6tPaCWZbVrnkGXDROHXsLPmE02hlHHMg2B8Zrxvn8Z1tqL2UwBmaABLF2veuEZBMaG6daetThHPszDtA+PXxLPXb2KcGI6fBd/JMTy3zmp1M4bn18EKlapIBR8rOjA6UuamBjfABJokDotxGzkJq4twHvG4pHJKteHr1xVqHL81Sj1PU5AorA8wU6GXh+ZbP3GBZJ7XzpQyhi0AVF2s2p8VfKpgSCakJStm4cnvzmFiatgxHXVL2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoPbv42qmXlqNPBG0tdUC3QG78xGWMr8I7suB7T10No=;
 b=mZwDdXPKTe8q3zX0ttvsPL9Ekg+axJzLOD+EFtIAHhzPRcf3LkAlxikyWbRqM2RGQlNMhjaW5PMcwmI0qKkwNoElx9+tBXIKvl0kp6Vc7ECaicg0NbYf9RrpYwY5urar1gfYmdZ6ovOIjeMYZWVsUie2sO8wvgs0eXRYgW9RPXUA+ItwBBHOzXvjUQ7+L7FUETI72NFlYc84xq4ZxYNbLS0Wv3punqlvXnAv4ZuzuJATOnGgpRv+JX4oTnax9xerAq7h49iFV5TNqD9xKbzhvWE9MGMjBjECOOd22UW3wVdB2cIrWgA+yQbc7ZGQ0ZX8WzuALycYp/pGRLzXyuYUUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8746.eurprd04.prod.outlook.com (2603:10a6:20b:43f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Wed, 27 Nov
 2024 07:24:19 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 07:24:18 +0000
Message-ID: <7ceae5ec-200d-46fc-acc3-a4aff371937e@nxp.com>
Date: Wed, 27 Nov 2024 15:24:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] clk: Fix simple video pipelines on i.MX8
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ian Ray <ian.ray@ge.com>,
 stable@vger.kernel.org
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
 <b98fdf46-3d09-4693-86fe-954fc723e3a6@nxp.com> <87zflrpp8w.fsf@bootlin.com>
 <55bb77b4-5172-4b4a-aaea-df6972a417dc@nxp.com> <87h67uw92w.fsf@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <87h67uw92w.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0123.apcprd03.prod.outlook.com
 (2603:1096:4:91::27) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e4b94fc-52ac-4e79-310d-08dd0eb4817e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmFPR0V0K21rQWpyeVV2TStnRm1hSFR0MHgvRzhTaHJPSFhQMVJqcldveFdl?=
 =?utf-8?B?djh2ZHI0ZVNJTWlwVXBBYThZVi9ScmxPL1JiVXVLYm5BMWJYV05hdWlrS3cx?=
 =?utf-8?B?bFRXNnhjQmFiWklGaHFvbC9sRzJCMGd5R0ZycFVacDFHRkhDR0FhWVdibVl1?=
 =?utf-8?B?ekdQQ29qTVdCMzF6VjhDY1BibFU0LzVhYytzNUJxRmdubnR6dkM0dTQ3aDl0?=
 =?utf-8?B?NUEzbHZPVmtWU1hzWUx6cjc0Q3ArLzRaMHJWRnAzeEZSN1JWc1Uwa3RKcE9T?=
 =?utf-8?B?cTgvcnRoN3VLOXFwQ2FMTWhNVjlhSHlUcFpBQ0hxakZreTk2eEk1Y1p0VlpX?=
 =?utf-8?B?V3VQUndoZkVacXRYWFFIcE1GVE8zVW50N0xLOXVlOE14Yk8xSUFOTlpFSDRW?=
 =?utf-8?B?eE45L1c4VVBKT2ZBdDJINTlYOFNSeW1vWDlpdXZOK05RU09ZcTg3Ny9rSTh2?=
 =?utf-8?B?MTBQZ3Bib0hrREFySDVhdytyVDdxWW1DaFpNSUFwNXo2Tlc0cGNLdkJzUWxa?=
 =?utf-8?B?YXVBQytEZ29halZ3OUk4Snlyd25rRy9uSnZpVDlDVHBnMWVLU0VyYzJsSjRo?=
 =?utf-8?B?bXhJUm8yd01vcmZNUGFHdHpQVytEd3JEbzZFeWxZbE4wSDVlQjl4QzFOOXM2?=
 =?utf-8?B?MWFBaFpFeVFiZlBDc3N2TFRrWUk1ZGdSeTlRNlZnODVDajJseEtyWldjN3FH?=
 =?utf-8?B?TFQyR1ZlaGZZOVpoSHhRZWVocUh1QSt5S0FjYTBRVHQvNk9qUlZsVGVRazJn?=
 =?utf-8?B?dDdVQ3JEbUJCYnJpK0QyY1BNQWc4a2RHSW1OYUtaRXdvalMzeFNPSlgxeWhH?=
 =?utf-8?B?NHlqTWM0Ry9DOEd3M0lGeEVZUVBGYnpuQjR2WEVqTG9tOVZkUU80OWZ5bGZm?=
 =?utf-8?B?Y04zb2QvVktHWklKclU0K1NpM0wwTndmU0RUT0lBS2xNSHFuVUY0SEs3WjAz?=
 =?utf-8?B?Tkw3elQ3aVhDNDYwcXh1elZ6bythVUdMaUxISG1QeGM1b0RLRXRRbGdrcXBP?=
 =?utf-8?B?NkVMT2JzWlpTZ1VyeGFWdlJnNEtBVWJkUThsWDBrbG5MSExYb2lqVUpoeEpS?=
 =?utf-8?B?RHFaMG44Q2RhOWcwck1VdklMTEl6S2MvYU5JZk5hc3VDc1Z0MFB1dmgxOEZi?=
 =?utf-8?B?MmQrODZKWmhWcWE3NTlucm5zT096TExLc3ptQ1pKbnNOWFh1RHZCUG1KUE5a?=
 =?utf-8?B?R2tvcG5pMk1vZk90cDFQc084d0ZRWUlsZi9IUUlsR25SUjQzOXIreWgvUmls?=
 =?utf-8?B?UFVnT0N1TGVRSWVCOVgyZ1p3eW1KbWlWeUhrdytHZDZocjZOQ1Yya2RXM1FL?=
 =?utf-8?B?S1ZOc3BWQ2h3eUtGVW1GVS9TQmwwQ1RTK1pSN3FqL3kvMHNKWW9WN2JiTEt4?=
 =?utf-8?B?OFQyZVZKUVo2TXlrN0JmaGZveFBZV1RIb0poZ3FkMnRBYzJGVC9aenBWM2JJ?=
 =?utf-8?B?M3NyRGxPeHJsNllFMnVSdnFwaDQzSUVxWU5ncklCejVTWTUrL0I2dXNOV1Z5?=
 =?utf-8?B?bW1yZXIxUDQ0cmRiNFhWWUJ4emEwVGNYMDRCakRWbDZWN1FIZWlmMDI3YTda?=
 =?utf-8?B?dzFjaGlOK2dkOGgwU21DV0hTQytYWXdHcFRxYVNXWFNobU1mcUZjaEo0REll?=
 =?utf-8?B?cUw3eWlyYWZmUFdmQW1Zc3pjalFraFdmWGRhenRPTTJ6OFR0c0FrSWhwb1Vt?=
 =?utf-8?B?QWI5TGZBL2NIWXRRRWRuaHhieVNKK1pna2VjaXpxeUh3a2RDOVREcWVKazJQ?=
 =?utf-8?Q?a84Wny0ysMQAl6IXps=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlZtRjV5ejhqVTUrNWVDcVY1ZnFVcWZJUFdFV3EwRUxKd1ZOcnA0eVA4cHdm?=
 =?utf-8?B?R0gxazN6L3VvY2JieWcxZk9Cek9nQXN6UEZJTkNaUFNXbHdjMlBhS2IxZmVh?=
 =?utf-8?B?b0dEbmFObWhweitGUktUTVF5M1QvSjhFaVdMSGRCMzJJVklMdTZYTFBWREF3?=
 =?utf-8?B?UkxzSDFTSGR4STlJWEM5QjI5bnJQemZXOHpSN1dZeXNOYnNrcGIrb1R1RzJI?=
 =?utf-8?B?SDB1cGQ0TmZVeWpWQllFNzN5ejh5bHdvNFZGOGhuWDc0aGlkM2V0RHNHNWxk?=
 =?utf-8?B?dzQ4Q3R1UDNVWE9SdUV0OTZxZXg2ZDVnV3dITDFaVE9CRTJITUt1OTJ5UU5R?=
 =?utf-8?B?V0RDSnp3ZXFEaUd1WENnMWhTSjZUZU9ZNWozVlZnVnFTVlFnZVR6VHkrcU1E?=
 =?utf-8?B?c3RaLzhqWExiQUtzb2UwMndyU0kxbDV2alhONHd3TTYyRUt6K2VDMHVhTnp4?=
 =?utf-8?B?Yk1jalU2WXBNZlhxL2FvaHQyUWZJaU93dHpUOFRPbDRQb3NXSmphdU9ScHBB?=
 =?utf-8?B?bTlweGxRVkRkNVU0bDlTQzhDR0REM2NqenhlWTJXUmdwTVRpU013VFQxampJ?=
 =?utf-8?B?WkVJbGtaVFp2ZXF6bWFMNnNPQXdYZVpHSEZQeXI0TktqblE2S0tNVk1MMzZN?=
 =?utf-8?B?UHA2aHRrYWNyZVFiWHpCSmN5SVNlMnpWR3BJMjZPSEJleHVwNm9aakpiWS95?=
 =?utf-8?B?Mnc0SUdHbGdsRVV5SlZ4WWFXQ001ZjN3eFRBZmwyVnpleHR4SkRkbEJBWVRo?=
 =?utf-8?B?NXE3MDdzTDduc2QxRHZ5ZlNpektmM3dzNzBQUWp6QVNhYTN4a3IzbjlWNFVv?=
 =?utf-8?B?eVJnbWxzNHdLcUxlWnRlaGt0TndZS2JmQzZuY0c3MGozNE1QZVVreVZIUmk5?=
 =?utf-8?B?Y2x3WGNEKzBaczVpeWtDc1c3bmdMTnpHVWVIWllUZ0twOFlzZGdudXM4YnVZ?=
 =?utf-8?B?Qk1OajlScG1Wdm52Y05Gc2I0SHVEcWJXOEFPQUFnNHl1UXRxcWNoa205bDcz?=
 =?utf-8?B?MDBOamUxYURMRzhUL3luOHdZdlMrNkZSb2dSRm1KeTRhZW9Vb1F0dWljVmI3?=
 =?utf-8?B?NEhrWm5ydXdBVzRMb0E5VzRIdGV5R0ROczhlTGt5eXpTY3ROYktrMFhGS09C?=
 =?utf-8?B?QStHaDN2TXQvMUtDa0dIY3FhbHpUTTlYTitJMUpQSE5OckJOdlo5WmFoL1li?=
 =?utf-8?B?dlV2cjYyTURIV3RhWTZLK1l0bmNJeERhR1JXaUtwTWlFN0oza3MyZFYzRklF?=
 =?utf-8?B?ZXNzT1RFSUVEV1FQbGlzSTZPcE1xS291a1JkeHhzT1hYL0UvR3FQYU95V0xt?=
 =?utf-8?B?TmxMUnFDZUhYbENvb2x1bGxsZzhrSzVXRS9sK0tBRXZzcFJxckFBOFoyS3Vh?=
 =?utf-8?B?bmcvMDEzRC9nY3h2Njd1Z3RKTkd3WU42MW01aDkwcVJEcSs3K1cvNUt2c3kx?=
 =?utf-8?B?SkRVLys1b0xmVm9jYTA1Z2pGUU1SOHUxdHdKQXViSEtsTlpCVXV3U1U4ZlNw?=
 =?utf-8?B?MlY0ZWllWG1PWHNwUE5NaWV6WHprVlpOaWFKcDk5ZU1UenpOL2J5UnVlaVBQ?=
 =?utf-8?B?TVJNV1VVMUZsQnZYWXVRS0ZVMFFNeGUycFVYQkNSSmNyUGpKSHVpR1pKUVRT?=
 =?utf-8?B?VW5XOHNrT0ZDZXBqQ2l0TGRRR2tsSCsxTG5hWlNWVEYzMC9pTEc0TDJPMDdn?=
 =?utf-8?B?UjZ4OWlMOWRzMU9adkt6N1U3S0owRFB6OEU1Nnp0c01OSVlHL1ZYRE1sR3lj?=
 =?utf-8?B?bWxwRmxJK28yaE95WFZ3eVNvSVBJRE5mY29PQ0ZmSkJRWnBHZnExYTJOZkdh?=
 =?utf-8?B?WWpLRGl6MWRCV1o2NWZEN1dtM0hOcytTcXMwTFQzN2pBNWJyNmlRYzVGRnpX?=
 =?utf-8?B?aGlIdHJwZWtZVDJiM21vUjgzZm9KUVpiN0dOK2V3ZzRDVmlEWHhiNlBJWFJn?=
 =?utf-8?B?M0ZmbHhmZzFFWExRK0Nxai93SlVlU0RoTzVGMGFiazhVdzJIdXd2SmUrT0hD?=
 =?utf-8?B?QngwYWVmcEhnTjB1YmNSZmQ3NHl4eGJxSi9rbFJvUWkzVFRzNndSN1hiOU5r?=
 =?utf-8?B?bE56aUw0a1EycDZmc0RyWDlpeHRpenFpbGhrcUtiZFdDNUMzajNaTEtjaWpw?=
 =?utf-8?Q?yn/5Tz808Fbw7xUc4/vRExSgo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4b94fc-52ac-4e79-310d-08dd0eb4817e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 07:24:18.7415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40KVPmKrt9eP63Fc8vtZoXBXzGAx8+EXEPncthMOiYRg1YaocMn2sGux8lBxbHrTQ5fohLW6umHmDVN3d4kfWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8746
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

On 11/26/2024, Miquel Raynal wrote:
> Hi Liu,

Hi,

> 
>>>> The
>>>> pixel clock can be got from LDB's remote input LCDIF DT node by
>>>> calling of_clk_get_by_name() in fsl_ldb_probe() like the below patch
>>>> does. Similar to setting pixel clock rate, I think a chance is that
>>>> pixel clock enablement can be moved from LCDIF driver to
>>>> fsl_ldb_atomic_enable() to avoid on-the-fly division ratio change.
>>>
>>> TBH, this sounds like a hack and is no longer required with this series.
>>
>> Pixel clock is an input signal to LDB, which is reflected in LDB block
>> diagram in i.MX8MP TRM(see Figure 13-70) where "CLOCK" goes into LDB
>> along with "DATA", "HSYNC", "VSYNC", "DATA_EN" and "CONTROL".  So,
>> fsl,ldb.yaml should have documented the pixel clock in clocks and
>> clock-names properties, but unfortunately it doesn't and it's too late
>> to do so.  The workaround is to get the pixel clock from LCDIF DT node
>> in the LDB driver.  I would call it a workaround rather than a hack,
>> since fsl,ldb.yaml should have documented the pixel clock in the first
>> place.
>>
>>>
>>> You are just trying to circumvent the fact that until now, applying a
>>> rate in an upper clock would unconfigure the downstream rates, and I
>>> think this is our first real problem.
>>
>> I'm still not a fan of setting CLK_SET_RATE_PARENT flag to the LDB clock
>> and pixel clocks.  If we look at the bigger picture, the first real
>> problem is probably how to support both separated video PLLs and shared
>> video PLL.
>>
>>>
>>>> https://patchwork.kernel.org/project/linux-clk/patch/20241114065759.3341908-6-victor.liu@nxp.com/
>>>>
>>>> Actually, one sibling patch of the above patch reverts ff06ea04e4cf
>>>> because I thought "fixed PLL rate" is the only solution, though I'm
>>>> discussing any alternative solution of "dynamically changeable PLL
>>>> rate" with Marek in the thread of the sibling patch.
>>>
>>> I don't think we want fixed PLL rates. Especially if you start using
>>
>> I don't want fixed PLL rates, either...
>>
>>> external (hot-pluggable) displays with different needs: it just does not
>>
>> ... but, considering the problem of how to support separated/shared video
>> PLLs, I think we have to accept the fixed PLL rates.  So, unfortunately
>> some video modes read from EDID cannot fly.  If there is an feasible
>> alternative solution, it will be good to implement it, but till now I
>> don't see any.
> 
> Can you please remind me what your exact display setup (and their
> required pixel clocks) is?

i.MX8MP EVK[1] supports MIPI DSI, LVDS and native HDMI outputs.
MIPI DSI and LVDS outputs use MINI-SAS connectors and HDMI output
uses a HDMI type A connector.
You may easily find the connectors in the EVK pictures in [1].
IMX-MIPI-HDMI(ADV7535), IMX-LVDS-HDMI(IT6263 single LVDS link) and
MX8-DSI-OLED1A(RAYDIUM RM67199 DSI panel) accessory boards[2] can
be connected/plugged to the EVK through the MINI-SAS connectors.
In addition, MX8-DSI-OLED1(RAYDIUM RM67191 DSI panel),
IMX-DLVDS-HDMI(IT6263 single DLVDS link) and
MX8-DLVDS-LCD1(koe,tx26d202vm0bwa dual-link LVDS panel) can also
be connected to the EVK through the MINI-SAS connectors, though
not listed in [2].

So, putting native HDMI output aside, there are quite a few MIPI
DSI + LVDS display device combinations to be supported with
a single video PLL.

For ADV7535 and IT6263, they support typical 1080p/720p video modes
read from EDID with 148.5MHz and 74.25MHz pixel clock rates.

For MX8-DLVDS-LCD1 LVDS panel, it is supported with in-tree
imx8mp-evk-mx8-dlvds-lcd1.dtso where nominal 156.72MHz pixel clock
rate is overridden to be 148.5MHz with a panel-timing DT node,
considering the fixed video PLL rate @1.0395GHz assigned in
imx8mp.dtsi.

For MX8-DSI-OLED1 and MX8-DSI-OLED1A MIPI DSI panels, both have
nominal 132MHz pixel clock rate(see panel-raydium-rm67191.c). NXP
downstream kernel uses 148.5MHz pixel clock rate for the two panel.

In short, I use 148.5MHz or 74.25MHz for ADV7535, IT6263 and the
LVDS panel.  I haven't tried the MIPI DSI panels with upstream
kernel yet.

[1] https://www.nxp.com/design/design-center/development-boards-and-designs/i-mx-evaluation-and-development-boards/evaluation-kit-for-the-i-mx-8m-plus-applications-processor:8MPLUSLPD4-EVK
[2] https://www.nxp.com/design/design-center/development-boards-and-designs/i-mx-evaluation-and-development-boards/i-mx-8-series-accessory-boards:i.MX8-ACCESSORY-BOARDS

> 
> AFAIU, you don't want to use dynamic calculations for the PLL because it
> breaks your use case with HDMI. Of course this is a very limited use
> case, because using a static rate means almost a single type of display
> can be plugged.
> 
> The clock subsystem will not recalculate the video_pll1 if you can
> achieve a perfect rate change using the LDB/PIX divisors. So let me
> propose the below addition to this series. With the below diff, your
> setup should still work with assigned clock rates, while letting us
> handle our calculations dynamically.
> 
> The addition I am now proposing is to remove CLK_SET_RATE_PARENT to both
> media_disp[12]_pix clocks. This should actually fix your situation while
> keeping pixel clocks accurate as far it is possible as the LDB clock
> will change video_pll1 only if the PLL rate is not suitable for it in
> the first place. And then, there will be no other clock messing with
> this PLL. This is probably a safer approach, which should still allow
> accurate dynamic rate calculations for "simple" setups *and* let the
> static assignations work otherwise:
> 
> -       hws[IMX8MP_CLK_MEDIA_DISP2_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300, CLK_SET_RATE_PARENT | CLK_NO_RATE_CHANGE_DURING_PROPAGATION);
> +       hws[IMX8MP_CLK_MEDIA_DISP2_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300, CLK_NO_RATE_CHANGE_DURING_PROPAGATION);
> [...]
> -       hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT | CLK_NO_RATE_CHANGE_DURING_PROPAGATION);
> +       hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_NO_RATE_CHANGE_DURING_PROPAGATION);

Removing CLK_SET_RATE_PARENT from the two pixel clocks is also done
with my patch[3]. 

[3] https://patchwork.freedesktop.org/patch/624509/?series=139266&rev=7

> 
> Can you please give this proposal a try?

I tried this/your patch set + your additional patch(remove
CLK_SET_RATE_PARENT for pixel clocks) + your additional patch(set LDB
clock rate to 2x requested link rate for dual-link LVDS)[4] + my two
patches[5][6] with ADV7535 + IT6263 on i.MX8MP EVK.  I don't see
any particular issue for both single and dual link LVDS cases. Some
typical video modes(1080p60/50, 720p60) work ok for ADV7535, though
there is still no display for a few video modes(should be not caused
by your patch set because there is no mode validation logic for the
MIPI DSI display pipeline).  So, basically, this has the same test
result if simply only applying my patch set[7].

I think the key change for your patch set to work for my test case
is your additional patch(remove CLK_SET_RATE_PARENT for pixel clocks).
Together with [4][5][6], the video PLL rate is fixed to 1.0395GHz for
all video modes.

Back to the separated/shared PLLs problem, I still don't see any
feasible alternative solution till now, since you are proposing to
remove CLK_SET_RATE_PARENT for pixel clocks which defeats the idea
of dynamically changing PLL rate(at least for the MIPI DSI display
pipeline).

Also, I feel that CLK_NO_RATE_CHANGE_DURING_PROPAGATION is not
needed, because the pixel clock rate can be set in
fsl_ldb_atomic_enable() as I mentioned before.

[5] https://patchwork.freedesktop.org/patch/624511/?series=139266&rev=7
[6] https://patchwork.freedesktop.org/patch/624512/?series=139266&rev=7
[7] https://patchwork.freedesktop.org/series/139266/#rev7

> 
> [...]
> 
>>> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
>>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>>> @@ -177,6 +177,17 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>>>         mode = &crtc_state->adjusted_mode;
>>>  
>>>         requested_link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
>>> +       /*
>>> +        * Dual cases require a 3.5 rate division on the pixel clocks, which
>>> +        * cannot be achieved with regular single divisors. Instead, double the
>>> +        * parent PLL rate in the first place. In order to do that, we first
>>> +        * require twice the target clock rate, which will program the upper
>>> +        * PLL. Then, we ask for the actual targeted rate, which can be achieved
>>> +        * by dividing by 2 the already configured upper PLL rate, without
>>> +        * making further changes to it.
>>> +        */
>>> +       if (fsl_ldb_is_dual(fsl_ldb))
>>> +               clk_set_rate(fsl_ldb->clk, requested_link_freq * 2);
>>
>> I don't think i.MX6SX LDB needs this, because the "ldb" clock's parent
>> is a mux clock with "ldb_di0_div_3_5" or "ldb_di0_div_7" parents.
> 
> Ah, you mean we should only do this in the imx8 case, right?

I think that doing this does no harm for both i.MX8MP LDB and i.MX93
LDB.

> 
> Thanks,
> Miquèl

-- 
Regards,
Liu Ying

