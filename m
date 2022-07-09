Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF05D56C9C4
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 16:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1093113D9B;
	Sat,  9 Jul 2022 14:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20059.outbound.protection.outlook.com [40.107.2.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DC5113D9C
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 14:01:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fuqLUwgsL3rnW5IJlvYhD83TrdIXktxAcKrRz0sSoMpvpjC5PhoVvXoVrcOjDE2e5F8Mi1Oeq6c0ZgaOfSgjoAM0fUVL1dPw7O3CptqVlm5L/ehM4ohnnFTcrZXFy0cMeLMDzj/fzLccYGL7JWLs+6vznsHY48+RdFvrOydMVD5hSiA7gaBpLAaAYS3jBXTLvQt2+iZWkDokkfaz7YOQZYDuXxHiWbPkHngkaiovHMY5tTfSVgjOS85Um4HOR4G5q+Vfamj9TgCNliCtPbnXDK4bIMqGmNL+pHjAVJk4sT7WlhVCNIXz4iNt7yESgtxpgdBS/tej0L4dg38nQf3IAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMQ/SCdVZsf3QRFzmrfCimlyIbRKwR10tXaDi/HSe4M=;
 b=cHLdoMeuFZWGitJF8W7EP7h+arhHR52E1P2d9wbLIOIcTHJ0FuUO9/BkpQGSHG1qUIjt0e3O1Iz5UfOgWBALUv2GCEDTnpuqW5DS2W2cGtgC2LdREq0j8kyOBI2eTRdt1AKEGaITEnmiSEuZ+/bOCHATanBzJDSDwVCsgt5qp1i+Xeql85s9Y38yUTcuhcGOL6mOAsNtwB2lp6KusOElRJFkyRcfLBMxmx6aHoO9dEXN16ZkaOlBXCS7NCUaDOaXa9VIkua1ftKF3L164tEK+XHwKI3STND0Nyla0P28kODa335FLkZ7fIYlzEUaLGPHC3K2uks2l38IMMxuZiUajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMQ/SCdVZsf3QRFzmrfCimlyIbRKwR10tXaDi/HSe4M=;
 b=OKNsP2pZQwlL3d5lI3Hlo8anBnvnbY6NQNqDXaAqO4PQAYK3K70IrXkS03LoacjSR3VAYrgkJsvCv9b9Y3NjdxisLpWUpaEJJSQPaQuH1QpEiV7OeYBr3cJnv90seBk9nSrCAnf0IWZrC4ZKi/aNYMr+2Y1Q8PMtc/wN/uPE26A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM6PR04MB4407.eurprd04.prod.outlook.com (2603:10a6:20b:1e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Sat, 9 Jul
 2022 14:01:56 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9%5]) with mapi id 15.20.5417.020; Sat, 9 Jul 2022
 14:01:55 +0000
Message-ID: <6afe8d40658561ed191dd81561340e43b16c43e0.camel@nxp.com>
Subject: Re: [PATCH v2 2/4] drm/lcdif: Consistently use plane timings
From: Liu Ying <victor.liu@nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Sat, 09 Jul 2022 22:01:44 +0800
In-Reply-To: <20220709011746.142296-2-marex@denx.de>
References: <20220709011746.142296-1-marex@denx.de>
 <20220709011746.142296-2-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::30)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89f02002-dc21-48f1-5055-08da61b39522
X-MS-TrafficTypeDiagnostic: AM6PR04MB4407:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XdRsGu2G7WXKwQ105208lmuh7Hi5UpLHTvXBXid+hU+ehrdHMzAwRu7Gf8W4mxbLO5p1sA4hTs81Oi+dwAsd/Em2TVt7+ldcskqZgarht5nfztNPhXyn59nOtHS5BsEMgrMwM57FFSARgIvSb2MHfBubI1G1E6rZJu0nz8g50u3VYkqfA73EYWhNa1HFYOHR9cyfed9RwmLzeEZsHkM8ujpbm/34OcrysdNBjiduuSTTbmQewlsI9/4Rzh8rmLSV8QwK2QccS8cjDrLK61Qa+8t3h1cvZQiSvrmrsjIeiFakirEoQ9WIZDZqUz4uHSGakUr/FEhx+9H0N+wMJu0LJE5PP3RZnkTA1jjHwRuWzcYKp3OaLYMa+APkESfg7ZAHCqEBPBMM+eGEypQQ7+rjaiJY47AWJATYIth3xAA7aVbM5sSOFlIexj5nupTJ8ox899RTKckyFT2AYjpKPUVV6pB7bkTCPFDI9t8qYlJ5D/2ViDEwpzX23jtmqXCh4zuIPxRMrBD8CRWKJYasEdDZ6CkjItTQ0TBMZbkcoOHTmuVW5zra9rZw5K7xP4p7ajlPA/9A6UGc6DuFIH/5l0dRcLr7AvvwOs6k9EtQ3/svbUG+I0TXQpel+dCFYq8AWbj1DxWGd7oTyB7L6d/5pzCoi40NnL7fJrLkksEh1SOJjc0OdTU2/IsxjtcpmKJz0vDGP9FnIamIDcPl/TSo54ayNzmYLvsTbr8KCpldwcGFjpPMIdTRoF3QOM69YJWpwQzntpB39MzgqFeSPqdx1NKc0+rhzXDgEIg+fdeRfvnbDRvgp+AGwj01LA8WbehNfBvoVnk6SMIsEhoKIWPAYL8ojQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(38350700002)(6486002)(38100700002)(4744005)(54906003)(8936002)(316002)(478600001)(5660300002)(4326008)(6506007)(26005)(186003)(6512007)(36756003)(8676002)(2906002)(6666004)(52116002)(41300700001)(66476007)(66556008)(66946007)(86362001)(2616005)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V054Wk42ZEtydTBnaldNSjR4aEJJMnVrZUEyWXRmZTNpd3lUekUyWVpiU1li?=
 =?utf-8?B?WGludXRrTXZmaEF1Nm9CcUFpQm9aYlJmbitDdHNlRm0vZW9KclIveVJQd2Rw?=
 =?utf-8?B?M1pNUEUrYmxjRHg3b090aTdjMFlmeCt5WW1qdXJ5ZHJWRGoyNTB3ekh1T2NZ?=
 =?utf-8?B?VXVkVFdPQW9TNDJna3JNUW5tK2NwcGxDY0tORjd2SGNFTURYKzR6T01aWUFn?=
 =?utf-8?B?MFZSVnlyZk9sb3VWS1hGL1hJbUtnK1JnandZT0cvSHZtazEwcE1lOVMzY1Av?=
 =?utf-8?B?UXlGeW45TjRubUZMa1hkVUZQc25tUURyQU41NE84M3N4VVN0RThDdDhZaUZw?=
 =?utf-8?B?b2lZSzFRV3p4OVRiZnVLeFNmK05KRUh3R3FtblNLZFhDYnhTK0xCWkFwbHll?=
 =?utf-8?B?L3ExemhzMVVBU1NpbS9TR2tBTUdIY056ZkM0bGZZZkVrMDY0aXp2VWxhN3lp?=
 =?utf-8?B?L1ZWemJ5L3BEMFpCU2ZRSjUrcFF3d0Y3eXc4TUhyb1Z5NVdNVzBxRDBmanJQ?=
 =?utf-8?B?YnlqUkt1SnJiU0I3bFIra0JVTENDMDJhM0hnOFRZTzR1SjM0eUIyRGYyOG9p?=
 =?utf-8?B?Mm1OYjRkTUpmUTUzaTRES21lRmdTNHN4UmF0dzlQRVFOZXAyUVZaUUwxYkli?=
 =?utf-8?B?RUhvODdtdDkwd1lZWjVrT0dmcy9UT1BSbmZhalZ4QnVzU0paYmhBT09yN2d2?=
 =?utf-8?B?dzNiaWpXc1VtT2RTMDVTQktQVER1UW9VbDRpL01PckVlT3FHMzlvWmlXMFBB?=
 =?utf-8?B?L3VVbGF6R3lvV21HVy9xSy9IZ0EyQ1BhM0hwUXlpSE5LQU8vTFJnSWtFbGNV?=
 =?utf-8?B?Z3dTcHN0YzVYRHBRbkFrVGJKblg3MUZCMllnZGdqS08rSXRGTUtHU0VIVjBa?=
 =?utf-8?B?cVNmU2tCSFl4ZXRycVo0aklLYndmeTlRcWVmTHl1N3VJL2JtSFJsM3oyZnFl?=
 =?utf-8?B?S3ZSK1lKL0pESDZZQnRMOTljenRzbk1vSTFvSjdFU1JZdlhMcS9mTEFobC94?=
 =?utf-8?B?aXhnN3p3VWpaSHJnYlBqeW1CUE5FOC96YzgxQ2Jsd0dDQ1VBV1liNFNGMDc1?=
 =?utf-8?B?TnY1MGlwT1JsU2h6Sjd4d2V2WE9Tdk1SNTJiRzNjZEVEZEVvMmFyMFhENlcv?=
 =?utf-8?B?alQvMndBSDJKMXY2UXdJMVVQRHFTMklRUFhWQ1A4UWJJb1REV1V5KzVJNjRh?=
 =?utf-8?B?aUorMVIzYUI1RW1PSGZKYU9DUHpHSTRSai80dlBINk44WnRMdHFQSW9XOXFm?=
 =?utf-8?B?REhZdm9OQlZFQ1BFKzhUNmdsMXZvRHN2eVFoY1RXbytHQ3RBbCtGcFBPejNS?=
 =?utf-8?B?TEdvVXl2V1FxOHUwV0hsaEZRNklNRzIxOWY3YmJ3aEZMTHdValV4V3pZMXdp?=
 =?utf-8?B?NS9HOHFXSGVQOHJlYmw2T0dFbUZlMVNMOUpiUmIvMUtldjhCdzYzcFl1VUNv?=
 =?utf-8?B?TTZpVjJYMllYMnA5cE9sZmNOVGxJNTFMQ3l0UUxFNk93SFFNK25BR2tPc3Vy?=
 =?utf-8?B?cVVqd2Z2dkxzUEg1VXEzMGprUDE4KzRKMUZFakZUbzM2Zy9VaDYrV1FmU2tK?=
 =?utf-8?B?TWVGcEdibng4WDZGL0hIZkRiSmRwQlhvckVhTFQ1Q3paWHJDTDhObllxbGEy?=
 =?utf-8?B?UGFSL0orTEx3NDJiK2p4bDFKOS8rUnBCUjhINTZFaGg1dWRaY3FyYXdiUkdV?=
 =?utf-8?B?VUZaZUx0L0p4MDZ3YncwS3RlQXRsSWUxSlZ6MGJIbzdSZXF6eDlyNGo4aUJU?=
 =?utf-8?B?NnZsQ1lBK251dWZ1czlvOFM1VEJtSGl2a05BTmorL29TOWY4dllEeXc5bXVj?=
 =?utf-8?B?U0E0UmxMUUVLZWx1azEwbnRONUdHY2ZMQmxKZUR2bU1UMGU4cWU2TXZ5UWdX?=
 =?utf-8?B?bGllQ2w1TS9leEhqTDZLNG4yNURzRy8rNE5KdC9ZZTl1d2t1azlISmpXWU1y?=
 =?utf-8?B?U2ppZklKY0RYL1RhRGN2MkdiQUREU0tqZ1ZUR1RUVXBlM3hNTnVFNW1veFdH?=
 =?utf-8?B?NExKZEU1Ym5vbVpMbktLb29CMGdTZzRMaENsYVdrZkhGV0ZsT0V6eUR4RTBC?=
 =?utf-8?B?aTZBL2lOQWtGUHp2MUtDNFhuamd6MTMvVjJqVEE5NGFMQStNSUZMUlF4TG1B?=
 =?utf-8?Q?T78X6+OVZFoEDNDcnz94DebPN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f02002-dc21-48f1-5055-08da61b39522
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2022 14:01:55.8877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Edqnzn6hd4iDtxCNoY0ASG8nhpfhRwivbC2/COzCPnqAaBBn3zSJ46RUJYc1CgkDNZjtXvkjS9CAc9eRW//FHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4407
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, robert.foss@linaro.org,
 Martyn Welch <martyn.welch@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2022-07-09 at 03:17 +0200, Marek Vasut wrote:
> Drop the crtc_ prefix from mode, consistently use the plain one.
> 
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> Reported-by: Liu Ying <victor.liu@oss.nxp.com>
> Fixes: 9db35bb349a0e ("drm: lcdif: Add support for i.MX8MP LCDIF
> variant")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Martyn Welch <martyn.welch@collabora.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
> V2: Add RB from Liu
>     Replace plane with plain

Do the replacement for the patch subject as well please.
Perhaps, someone may pick this up and fix that for you.

Regards,
Liu Ying

