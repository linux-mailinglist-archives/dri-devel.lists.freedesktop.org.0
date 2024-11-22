Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C269D5932
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 07:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D05F10E05D;
	Fri, 22 Nov 2024 06:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="RE7IoabQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2086.outbound.protection.outlook.com [40.107.241.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFB510E05D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 06:01:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlMRjDTWrz5VV4peLy+xRoVE6JP0N16LNqrjVy5uUtk0KjZLQ/rQO6FRT9A/u+6IhPXBdVcrnf2yLMnun3y1asI0J1/QKqNMlcbRZZ7BCdRCl1l5fnYgMadZ6jAAuDRDdCEHb4CeeYSwJNdg6lOGp5TZRAou3DQohEWoD8zFPjeliz81n03PuiCKCKVz17edOKqdWbZvJ94uS6QZGGzvNGkGPOPS9m9lV5sqqdCk5X9FF5sCezwW81ITGessF6FZJFZfuIq6ZMIMEnZYYnIeU2Pg1C7dkeVV6uTBby2om/1t698L5wb+X6YikUQLXSBPiif3LQqYRlP/vDOuNYFxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUOoQelY5Ciga7HjBjjU0h0D2OgMtqJh5mXUl5Yl2OY=;
 b=TODjYo/vgqr4NJNA7wIysV5KQAEbuSBqqzvBMZqMrNc9JNSNwZAXycL8M0sW7XXY5NN4XWGpJ/cg7cffmYxGDzpcSMb3YUj2aKP3D+Ic62wNK0qc+ZgeIYnso1AMNmiZz53J9XsAjtL+9HtNIaRc82cNvXUjowz7m/fD5KviDcx4RrS9+Th1F6moytWqqvHDn+6ZgHQ2mBk7ZDDWLjcGjLpw4gg+axsLRk+upEd66ue9OBjBzOoYSeIYtLG7T2OZtBVBq0+RNann9KVgMv5UEz1UozPk4E5HxZe6OfoqzQCGXCDq4CnqnxM8SFXbGXZ/a4BvHA1WYoBenpws3IH6eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUOoQelY5Ciga7HjBjjU0h0D2OgMtqJh5mXUl5Yl2OY=;
 b=RE7IoabQKOsDtSUhMBZG0OAGbCpQOYplWr1V//meunMNGYiC5IdUbpgV15K++CZrH8KRFp4TCyqFSwQF9D6+zNA0z8FU39gi018Wp/ijAxxrm9jZhZGt1BaNRjqVyElXjUC5qxRk5H7WPL23z/220eAn03wWq2Pbd9a95ZK2/TcvKs+C7MlpgBhjvxLIyVsh6uH0if6w7hmMwm+uHSeQ83uVhGoJhFuA1eV4onVSGHlSVBTQYD12d+z87Y2lnjvt5pUEzm2Ioo1ZwBUG4cJyPTGXOwWiTp+T5p6Uzg4PQpPew/IZAjVdspXENS1W5QK1Gg1IWmbJYABYxSU/QFHAIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM7PR04MB6789.eurprd04.prod.outlook.com (2603:10a6:20b:107::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 06:01:18 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8158.017; Fri, 22 Nov 2024
 06:01:17 +0000
Message-ID: <b98fdf46-3d09-4693-86fe-954fc723e3a6@nxp.com>
Date: Fri, 22 Nov 2024 14:01:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] clk: Fix simple video pipelines on i.MX8
To: Miquel Raynal <miquel.raynal@bootlin.com>, Abel Vesa
 <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ian Ray <ian.ray@ge.com>,
 stable@vger.kernel.org
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM7PR04MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 491e2ef9-fb75-49fb-9261-08dd0abb1486
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnErWjhVMzcrWndPWGNGdm1WeStWcElsa1lVQmtUL0J1MW9xbFBVK3hRRW02?=
 =?utf-8?B?RlYrSmlKQkY5YjdIUUpXUm5GakhPSGp1MkJVY0UxeGtXdlhERk91RWl6VHRE?=
 =?utf-8?B?QkFnRDRvOTd5SGNuV3V0V2F5MWRRaHh4bVJnL2M0cm93RElrUVlLU0taelBC?=
 =?utf-8?B?c21wWlB3b2lvKzIvd3RUNm1aTHlZTjFJS1Blc3F2RnM1UGswb20vTmJHTUxR?=
 =?utf-8?B?UU5XQVhuM29nVmoxU2tHNzQ3TkRPcDBRMUd1cTlTN1RvSStEY1BQUC9ndmFK?=
 =?utf-8?B?RGptWmNyVkpRa2ZrVGp3Nk4yU2dPWVpXNm83WnZ1OWZMajRyd2F0SWlTTnRw?=
 =?utf-8?B?Mk15RG5jUXI5bjlEUktLUlhiVmpZekRpcktTZGVEanlpR0wyMVZJSVZ2eEhC?=
 =?utf-8?B?M1FxTVYwY043VjYrdno5QzQ1REtCaHJkeXhaQXlhekZLaG9ObUJJdVR2blN1?=
 =?utf-8?B?QWtWdWtFcnM2QXFMUVhZbFg1cy94WGNlMjFqWitKckJZQjUvNjhzdVU2WnN3?=
 =?utf-8?B?UFFmbU5jWFFxd2tybXRCb0w3REdaVkxlWHRaSGhneE9DQ2NXVWdzSGZYZlZ1?=
 =?utf-8?B?bW8zZUNxeDZjYTJTUGREdVhBRlo0L3ErTDJUT0tRNWk3ang2TzI1Vm4wQmJR?=
 =?utf-8?B?NXVhdXRDbndtQUUweTBVemtlSE1GbWRWcVRyVDhVQnIvYUdPbXhPMEFYek1K?=
 =?utf-8?B?OVhWLzVKVjFCUE5IeVlzQ29HVElHUENyMDdteTVHSmgrNHVjcDNmamhDelhr?=
 =?utf-8?B?Y1MvOGRJZ0hoUng2TlFQY1Z3cVF2d3R3UThBZFhVUmw3cFlubWVVYWFUYjNh?=
 =?utf-8?B?RXFlWmpsRWFCZ25BRWNpSll0NGFJanhia0pZS292eUtNZDFLOVZrbjQ0VGRV?=
 =?utf-8?B?UklOWUtXanFRYlp5SUFMdTl0bkUzV1I2YnNFdVIzZWwrWC9HcjhqN09zZUhM?=
 =?utf-8?B?UFIxck1NK3htdDJsbGhlWjhIcDdDenU4ZFN4Zk1YbUdmWUxnMzEyaFdyWmZW?=
 =?utf-8?B?RU0vdmFnTXN6S1RsWjVQTFJ5YXlsUkdmeHhqWDRwb005ZjlQMmFlcUpsUzRS?=
 =?utf-8?B?SXB4Q0ZnN2JFaEdtR2NGZXhXbmpwekRlZjdWL2Y4ODg0U0V1K1cxZDFDUG5a?=
 =?utf-8?B?NnBGaTExTmxRek85OVNFSFJ2d2FlRW5jczRUQ0pkeVN6Si9NMU9jMS9wcW9U?=
 =?utf-8?B?RlYxa2M1TTBrYjlVL2NhWnNmYTJuL01lUkxpNmxLQVJSTHhSbEI2eEdRMnd0?=
 =?utf-8?B?Skk3RXR1T0pEa1dUYSsvbzVHaUFkays3czlCYnEyMDZCUXdDV3Flckp1a2pl?=
 =?utf-8?B?NG05WVBtV05zQURGM1FGS3JQQzE3R2l5M2JmOGI1RHd1Z3k3ZDhTMktaS25u?=
 =?utf-8?B?cXhPVmttQ2FDYklLeGdyQkpXeWZ6TzI4R2doZUt3aDlCRkY1bk1CdGpoQW11?=
 =?utf-8?B?VE1WSHVRVHN0RU9lZEFDV0RpR3IwYkM3dDNnU0RVTUlYblNwUTlWZk90YVJH?=
 =?utf-8?B?ZWJGUHBKYWxVb3FyNDkrUllrVDMyYk90UCtNTmRGREQ4bUlYK3dhZHZKbGdV?=
 =?utf-8?B?MmJxaFlzSkY3TDA2aEpqYjJVbzR3bno0c0Q2WWFhc25maW9lQnNrTVVNWVNO?=
 =?utf-8?B?em1NVW5CMFlhQ01EeG5rcm1UOUdad3U2SFA5UlNsYWpVL240MjY2VW45RTVw?=
 =?utf-8?B?aFFodXh1ZndWNmhiQklUd0kyZ25uN0Q3VU42SXR3SzRSM2hNMVNJaFpqTkVs?=
 =?utf-8?Q?Ju4d82YeHQRhCyHVBLqeCQ0lArtH7F+HzGJ53Jy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm5YcDBxazFzRmJxdzRkNURiblJ0UEVaUktIdzUxdUVkSU9Ua01mN3Z3Wm5I?=
 =?utf-8?B?ak4vVTd4bkJ1SjVlN0pWSE1vNHVCbjFiblgvV2pXUEN0aGZ1QUxaM3ViS0JU?=
 =?utf-8?B?cEplcDhTRHdOUVROR2pvdmF1NXRTdlhPeUxWY2xaYW4xRXF0VlVaZGMrMUlx?=
 =?utf-8?B?WEZIK2Q1RzE3TGNzblFsVXBxWGxneXJSeS84NkhjRVlvT2o5dGN6RDhTV1FR?=
 =?utf-8?B?aW90WWNEMzR5WWJxVjVwRVEyU0wzWWQ3Vi9NM3RQSjVZL1lKcHVFVnMwTG5t?=
 =?utf-8?B?WTNGNU1LVGxtcldTNFYzdlR1bXBnb2J2R25GMDNWdHJvUURVYXFoa29tSjlI?=
 =?utf-8?B?MVRFYmpESG5lVnk4cFV5NnlxdkZhTEwvVjVZY1dRdkVFSHZVTTlNYklBclNF?=
 =?utf-8?B?K2NXZUZuRHd6ZWQ0bGUzRG81Qlkyc3ZoYVROTFNFM0Flb3Brc0RLcVM0UmFm?=
 =?utf-8?B?V0VlU0c3R2llb1lNOUxValB3L05zV3E2bmttQjVMOG5xVDRzcVQxQXJqb3ZH?=
 =?utf-8?B?a1NJbkFZc3MxVG1uTDl2bERrdnFwc2JjTUk5ZTJBS2JibjFBTXQwUzg1TVYz?=
 =?utf-8?B?NW8zLzV1aDAzbXltQW1qNGZlbDd1UzhBMEllRW9UVS9walhUWWF3YlJkY1Ju?=
 =?utf-8?B?QU50anVNVzRqUWFuNGd0T3lrSkR1QVpudlkvS0QzdnNiZlEvcDJPK3RKQnU1?=
 =?utf-8?B?eG5KZ3pUeHVUVTNJVmhzTG8yRWFnSFlCTXIrTHdjRFM0MWMrbkQ1ZUNNVVVo?=
 =?utf-8?B?d1hmODlGNFpHMHZWV29mMi9vdG9JSEJUZTdVeVJlY083Mmx2SEw3dzlNS2pN?=
 =?utf-8?B?ckhLSDgwcTczZzVjRCtzK05zVUJVZjBiL2VOdXVtSFhmSHppVytHTkRtRS9Y?=
 =?utf-8?B?MG5HUE1uN1pGZ1Bsd0tYdG9BamhnTmFDRzhiVit4SnYrYWNhWXVJQVRTNUdL?=
 =?utf-8?B?eWIvbFcxVTVSVkdjS2hNSnRSZkZrTk9SMFExNG95Yzc2TitHM20yU1FTK1lw?=
 =?utf-8?B?V1BxQ2hYeDl1eFo0TXNUaW9hdmJia0xMdTRaWEJTK0cvUDl6NnpGR1ZKMUNp?=
 =?utf-8?B?OCtNbEVaQ1QxNGdydEhFZWZhQkFXb2h2SnJON0RJQmRKRUtncmNkT2hHQTlB?=
 =?utf-8?B?UmpBUDFROUp2bzF6aHJjZWw1blFDa2Vva1FxOVVtaTBBTVcxTzQyVWFqVmtm?=
 =?utf-8?B?cFpvdGo3aTdGNFp0ZDR6ek91QUVJN05BbU0raTY5S3I1MWJITTFjVjE2S2lR?=
 =?utf-8?B?RjNnVEltS0tOcEhTZ2R0bEtHbDRwbHRabTNNV0dyd3BxbHQ4OTRKUnhjeEQw?=
 =?utf-8?B?NmRwMUJkWlVJQUp1R2YvNmpNa0NrL1g5cHJwRkpMYkh4b2dpaXpsUS94U3J5?=
 =?utf-8?B?SjlWYmFPRUVLb29VUG1aV0gwOGV1azRmOTB4aWMrRENYcm9TY2dQRW8yOS8v?=
 =?utf-8?B?cURxdFRUeUVwZFJRYXRMQ0t2ay9RZy92RlBOcWUrM0tYNFQ5cEF4U1VKQSto?=
 =?utf-8?B?WnV4NmZGNlJ6YnBFUUZCdXAydkN4cGwrZ09IZmdLYzRmWFJscjJlQmJUdnJu?=
 =?utf-8?B?eXZaK2dOT3NROW9oNXhUOThTWCtSRDRERFlEQlFnYXdmRkg0WlAvelIzcjRa?=
 =?utf-8?B?SW92eU15M0xNR0NXVzhBTnFWSCtld0c0U0p2UlJ0OEZXaDkxNDRlSVRsdFJ4?=
 =?utf-8?B?Y2pVUjgxVm1MTHVta0lXdWxKWU81aktSVFIwT21ySGR2ZXZ6d1NsWkxBZ1Zu?=
 =?utf-8?B?N0pvMER0cFFWQXFLQjlFOXpKbGdiZDgycldaekt6bmZKWkdHckRNN3ZKY1dl?=
 =?utf-8?B?MTFsS1MxeXNmV0hxQlNTeERseTE0ZmhNbzdpK3VCUXhieHdTc0pxZ25pSzBz?=
 =?utf-8?B?cE8wQmFKaXNWREh1K09TUCt5R2xDdVQ3cU9QTXBDUDNVenVMRFlxL1hxUXlW?=
 =?utf-8?B?NmJaMldveGhpQW1jSlRxcW5ZN2tHSFRidlo4SGNzdDl0OTNSVVppYUZDSFNN?=
 =?utf-8?B?N1hBMXRGeXNhV1krcXU5MXIvNlRJT3RjSHJiVU01MnVzbnc2MTU2eS9XaUdD?=
 =?utf-8?B?Ykx5NUt2Y3NaUytCN3dHNisrcy9NYkNIYU9nUjluSm9DYTI3SVl5QVFRVU83?=
 =?utf-8?Q?eJwSrbhsM18mX5iLuzV26n28Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 491e2ef9-fb75-49fb-9261-08dd0abb1486
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 06:01:17.8662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKoQxzMQe6VlUIpj9hueA5P7P76mb3Ft4rmdrW7uVVnzkE9ZGKYfsnV3HON9RLPVzOt/zyVC1dnnOhrHeoA9qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6789
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

Hi Miquel,

On 11/22/2024, Miquel Raynal wrote:
> Recent changes in the clock tree have set CLK_SET_RATE_PARENT to the two
> LCDIF pixel clocks. The idea is, instead of using assigned-clock
> properties to set upstream PLL rates to high frequencies and hoping that
> a single divisor (namely media_disp[12]_pix) will be close enough in
> most cases, we should tell the clock core to use the PLL to properly
> derive an accurate pixel clock rate in the first place. Here is the
> situation.
> 
> [Before ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate")]
> 
> Before setting CLK_SET_RATE_PARENT to the media_disp[12]_pix clocks, the sequence of events was:
> - PLL is assigned to a high rate,
> - media_disp[12]_pix is set to approximately freq A by using a single divisor,
> - media_ldb is set to approximately freq 7*A by using another single divisor.
> => The display was working, but the pixel clock was inaccurate.
> 
> [After ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate")]
> 
> After setting CLK_SET_RATE_PARENT to the media_disp[12]_pix clocks, the
> sequence of events became:
> - media_disp[12]_pix is set to freq A by using a divisor of 1 and
>   setting video_pll1 to freq A.
> - media_ldb is trying to compute its divisor to set freq 7*A, but the
>   upstream PLL is to low, it does not recompute it, so it ends up
>   setting a divisor of 1 and being at freq A instead of 7*A.
> => The display is sadly no longer working
> 
> [After applying PATCH "clk: imx: clk-imx8mp: Allow LDB serializer clock reconfigure parent rate"]
> 
> This is a commit from Marek, which is, I believe going in the right
> direction, so I am including it. Just with this change, the situation is
> slightly different, but the result is the same:
> - media_disp[12]_pix is set to freq A by using a divisor of 1 and
>   setting video_pll1 to freq A.
> - media_ldb is set to 7*A by using a divisor of 1 and setting video_pll1
>   to freq 7*A.
>   /!\ This as the side effect of changing media_disp[12]_pix from freq A
>   to freq 7*A.

Although I'm not of a fan of setting CLK_SET_RATE_PARENT flag to the
LDB clock and pixel clocks, would it work if the pixel clock rate is
set after the LDB clock rate is set in fsl_ldb_atomic_enable()?  The
pixel clock can be got from LDB's remote input LCDIF DT node by
calling of_clk_get_by_name() in fsl_ldb_probe() like the below patch
does. Similar to setting pixel clock rate, I think a chance is that
pixel clock enablement can be moved from LCDIF driver to
fsl_ldb_atomic_enable() to avoid on-the-fly division ratio change.

https://patchwork.kernel.org/project/linux-clk/patch/20241114065759.3341908-6-victor.liu@nxp.com/

Actually, one sibling patch of the above patch reverts ff06ea04e4cf
because I thought "fixed PLL rate" is the only solution, though I'm
discussing any alternative solution of "dynamically changeable PLL
rate" with Marek in the thread of the sibling patch.

BTW, as you know the LDB clock rate is 3.5x faster than the pixel
clock rate in dual-link LVDS use cases, the lowest PLL rate needs to
be explicitly set to 7x faster than the pixel clock rate *before*
LDB clock rate is set.  This way, the pixel clock would be derived
from the PLL with integer division ratio = 7, not the unsupported
3.5.

pixel    LDB         PLL
A        3.5*A       7*A      --> OK
A        3.5*A       3.5*A    --> not OK

> => The display is still not working
> 
> [After applying this series]
> 
> The goal of the following patches is to prevent clock subtree walks to
> "just recalculate" the pixel clocks, ignoring the fact that they should
> no longer change. They should adapt their divisors to the new upstream
> rates instead. As a result, the display pipeline is working again.
> 
> Note: if more than one display is connected, we need the LDB driver to
> act accordingly, thus the LDB driver must be adapted. Also, if accurate
> pixel clocks are not possible with two different displays, we will still
> need (at least for now) to make sure one of them is reparented to
> another PLL, like the audio PLL (but audio PLL are of a different kind,
> and are slightly less accurate).
> 
> So this series aims at fixing the i.MX8MP display pipeline for simple
> setups. Said otherwise, returning to the same level of support as
> before, but with (hopefully) more accurate frequencies. I believe this
> approach manages to fix both Marek situation and all people using a
> straightforward LCD based setup. For more complex setups, we need more
> smartness from DRM and clk, but this is gonna take a bit of time.
> 
> ---
> Marek Vasut (1):
>       clk: imx: clk-imx8mp: Allow LDB serializer clock reconfigure parent rate
> 
> Miquel Raynal (4):
>       clk: Add a helper to determine a clock rate
>       clk: Split clk_calc_subtree()
>       clk: Add flag to prevent frequency changes when walking subtrees
>       clk: imx: imx8mp: Prevent media clocks to be incompatibly changed
> 
>  drivers/clk/clk.c            | 39 ++++++++++++++++++++++++++++++++-------
>  drivers/clk/imx/clk-imx8mp.c |  6 +++---
>  include/linux/clk-provider.h |  2 ++
>  3 files changed, 37 insertions(+), 10 deletions(-)
> ---
> base-commit: 62facaf164585923d081eedcb6871f4ff3c2e953
> change-id: 20241121-ge-ian-debug-imx8-clk-tree-bd325aa866f1
> 
> Best regards,

-- 
Regards,
Liu Ying

