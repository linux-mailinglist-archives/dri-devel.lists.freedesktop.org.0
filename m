Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B385F0932
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 12:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E24910EC67;
	Fri, 30 Sep 2022 10:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130082.outbound.protection.outlook.com [40.107.13.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CA010EC67
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 10:36:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoiSiorhinzt1DQAmVLByyMWDxhbFVW1HyNN6LjBPNzyl0vuDIB0TMOzRylbMyxKyCePQ8BCyxsmBnEquaiK6wjCWImB6DfPOa6QcQKYqiPlX7RNcBVtsm0aRl+dLbS1yjqLB/w4Q8Nd2Urufln6quZDXj9TOzt+jdBMuzmXH6Vvw6WepWMgPV+UQtM/MmmCXgKSRBM9zZOTyy4wDzsmNsq4VsRBhtPngDxnt5eiUn+jOgj8QLueJu5FUzz+aENE+KSjMOqgc2JzX4JhIWk3g+9xgE/HHlhhz8F3oWtQScizB8cxydHsbmTv7+9SPhBX34ybNPMKvQeJ+L71WPVIiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XikdNFT2cDtjc/pXeQjPD8zix9zzpQQ89GD569NTGyw=;
 b=iIXbXWm2wCjOjDWK8nahelRt4qeXsH5UNTCgZJO8KSTCfzG4qSNl8mNPdrkU26tBanUZ3G/Mu/hl3w+BzlkAEtPH1gW+0loo0PiwjuS4NRP/ShbqRnpk0RAXPztdcBasKKHDwizFHz8ucSoe4xOAadmXNRdQ6COmMrYQeFhspRwxockTHuDXPimVleLj7pU6tyk/Ut92gjZ13jZEFP5MpeRms/50Ag0fxEsa3xDoWAax7a2kbl+fDjzgTx9JBejOe2Vmo9HIMwca7gSMFEDvjUjT7gDQZeJI3qVPcYCh3vEiVqPU0fTERMo0ujO9v3J/gv3U34zqV8CCOzMnktrCLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XikdNFT2cDtjc/pXeQjPD8zix9zzpQQ89GD569NTGyw=;
 b=UB1G7mkgRBAfwklmUqLbmth9WU7M8w7v+3kuIQtuR8TbEpinogXF71dptFSfOZX9jATlEwE7ufw5RzuhdNFkEH36u47DKcS+5DEBuKCiwKKMUKRrYZhDXZWJS+emp4xlS3d7FrDkRq+WHb5UKezqRB/+qY3Bg/LKR7phRxCyLl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7598.eurprd04.prod.outlook.com (2603:10a6:102:e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 10:36:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 10:36:21 +0000
Message-ID: <76b01d7122786177d070ffadf750da7cc8449ad2.camel@nxp.com>
Subject: Re: [PATCH v4 4/4] drm: lcdif: Add support for YUV planes
From: Liu Ying <victor.liu@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org
Date: Fri, 30 Sep 2022 18:35:28 +0800
In-Reply-To: <20220930083955.31580-5-laurent.pinchart@ideasonboard.com>
References: <20220930083955.31580-1-laurent.pinchart@ideasonboard.com>
 <20220930083955.31580-5-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e83acb8-69f7-4a9c-f144-08daa2cf9d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JbULwgytT1Wbt4JK2xoxZqZTFVJVD7OWQL2V6tMZ1z2TmTpCb44Y1NZSfCj0mKXFE5+WrkdH+daPXXrz/0Hxr+LY8lR8y/dobLQYHVpGEwgoqGvjZXonGmf9oRJLQVYuGw/u1ImVV5hK1SttamVps3kwqGgZfPNWZibHYgDdaZiPVlbAGfgSJ+fMFrb0TjlCAqErziclhVyf/0tRjF1+u3k3Nro+TRmcxncGwuIHiR6ZI0dY+lCLV6Dpbb/nnVsMFPu8Os/1XOITa2DmAFK8OUa3AQ+KtJfcmPIMKvPZOrHWoISCMgdMyWZdanwjczzP4yoE0CfOqIMwyin+FEBGKaXjmlZeuqoSUzKXyolFFe7wyM98pJiEU4S3H25fd1Ert7XnZv4tRr1/+ga8rTJBfCmIDObUTFvsAZ+eJBV1aS4wpzvo78fiP9jUFPlojVt+4sY17jDVjspPD64zAwGKZ3pWK2n6UvTKLd8uD0yhHHQQi7l0k0HvckUL5Jg3dcnTGZ6lELAIDVUPX6QDMv6mbCZ9pckuuFfvtUblQnJ8MERoMP8HBN1pvh6z9V/8riStvYQO9NIqOVbfwSH97vZwx7rQsPIS59c5l0xesnzzIY2UXSybcLW2JLZwAJjx2gVk9MyCFHuys5dktC0aJ/nQOjZnubnYFSDun4NNF/EJsutZAuXCUDWlAg/MMYfoJG4bENyaEdwTV+0yefCiM5PijfBmamr5KL09dwvDyG6fWc9Ca87uScpPvhxbJJjUOFJAsLWSQtXPPUO5SXVEqDTqqUIH3CwOlJgnkXDt7zuqHWk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199015)(186003)(38100700002)(2616005)(478600001)(66946007)(66556008)(66476007)(4326008)(6486002)(54906003)(83380400001)(2906002)(6512007)(86362001)(316002)(36756003)(38350700002)(26005)(5660300002)(8676002)(8936002)(6506007)(52116002)(41300700001)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlF4UERpeXFCd01ldjJSanFsRlQxc1NiY280Z0lEZnlTSXpDZFFXNlhwbnQz?=
 =?utf-8?B?RmhEekVIcjNpS1BwaS9TQzFzaTEvaDFVdGh5dloyRDVtWENTMVZtLzNySXJy?=
 =?utf-8?B?MHVTQVFoLzhieHVMWDMvTmczTlJUZ1FiR2RKSFZXNEoyUEdCT3NwajhqNEtX?=
 =?utf-8?B?RTJnRVJiU1FPRkoxQ3p3b285V2pDQmZlQ0Y0QlQwaXBPYzh1NkdnSTlSWlFF?=
 =?utf-8?B?b3d1MmxiK0ZPOEovTmpnL28rZS9XM3hPUUhHMVU5RVZyQnBjdWJnZy9MdUxy?=
 =?utf-8?B?WG1NQkdzU2VUVjdlamNyTWYrQU5KS20vV2hZZkdVR09ZakRjcU1qYzRCMDhi?=
 =?utf-8?B?b0ZJeXYxQzVpaDNMMXNTUHJaNDFkbURMM2dQUmx1V2V0c3RQR2xkMzBRRTYw?=
 =?utf-8?B?UFR2WmFZbkNpUmRNWHZETEl5VlRPN0x0dlB2Ukk4emxqN3M4VjZxWWdzVUF2?=
 =?utf-8?B?Y2NaemRFbThLOXlhbWVlTEtCWC9RUXQ2aEZKeFpRV0RJeW5RK0tNMUNWSFBm?=
 =?utf-8?B?L1RscWNIT0FkSiszeW9yNFlUaHZVbDJxU1MwcTNlUFJmU0c5eW1FTFBxb2Yx?=
 =?utf-8?B?bXo2WFBwNWRzMWZwZ2VRbzhtYWdsN2x1ZW5BU1VBK2FHUHFsc0crZVE2eU1B?=
 =?utf-8?B?VmZaTXFBNks3QTZpZXZ0bnlxV3R0bHZLNkJsNjUzTlZNU0c1WE5TdFM4Rkgv?=
 =?utf-8?B?Vmx4OUxYVkV4OThhd2xMU1VFUEFvMlRzMzlKeng3MHFKVDl4djJFNktRRFRB?=
 =?utf-8?B?NW1taVpkOE8wQmpKdkpwSkN6WCtVVmdMdDVma0p5M0EvcytBWWxmSm5oa3U2?=
 =?utf-8?B?Q3ZIQWNjeGlCVTNXT0dOWGRLcHpQaHhpNGUxWGo3cWhSQ2UrdHZLMFN1d28r?=
 =?utf-8?B?STdIeFRjVEk4K05QeWRLVTdiTS83NGc0QXpscXhOU3VSWGVNUy96cU05T3Q0?=
 =?utf-8?B?aUwxOXIrNE5JWTZTay9LK1NTbit1NitKN1ZmTSthWDc0WEpiREdORzVXWUJx?=
 =?utf-8?B?Q1dmdDFZYWNLQWV2cHZiRkdTQWRoL1JqY29ubU5IZ2lSajgvL3gvSmRjd042?=
 =?utf-8?B?bFo2QklFK3NXb08xd0l5L1JMZjFsTkpITnRaNk40aTB6eGVXdGxDM1lyakpm?=
 =?utf-8?B?THlzNWN0citFU3ppczFtbUNsQTlhdVRncmwvYzRDMjhrT25KdTJjUiszaGtC?=
 =?utf-8?B?M090UmZ0UVJPMlVsVHdyOHdWSitrV1YvYVV2RmZvL2RxMUF5Q1Z5QVJOMkZS?=
 =?utf-8?B?dXNJVGdtWXg0cXNBNEljOGtTcEZBOHFOdUxwVzUvVlZiZnhQNzViNW5rMlBU?=
 =?utf-8?B?STBLR0o0Q0pMd25xV0h0M1FUem1QUXdQMFcrdy8zTjQ5TS9TL05MWGtkaHVy?=
 =?utf-8?B?U3RjRitpdU8xMmVoR2NqekpIS2orb1VROUtqcUtVRTR1QnFzMWRYWUxzemhV?=
 =?utf-8?B?U2FLS3NNeEZvQ3V6STZoNEpEbnhuTHRjUHhGZXJSazBlckpnTkVDQThOT3py?=
 =?utf-8?B?eENUU2VTa24yc2UrSDY4SHZna0d0WkUzTk9aY2o4a3VPVzZ2Q0o3TEpUTXRV?=
 =?utf-8?B?aENZMmR2OXBRUUNJQWFuUUVXZFQxRWVLbWZHNXZsMzdTenhrQ0lxdmV6Q3Bx?=
 =?utf-8?B?a1l1K1pmMVJNa2FVbjV4cWV4U1dFRVBiMDBMdU1TTnpEQy8zYnVYaCt2a25w?=
 =?utf-8?B?VTBxcFJMdjdqaGNmUTFxdEpDVm91dzlsbVpGWk84elV1dHV3cURVNXNzL2V2?=
 =?utf-8?B?NFM5cTkzNEpISkFaeFdWMlI4S05TU3RYRGtad3FKZ3BiNEdwMEQ4L1FzQ2Iv?=
 =?utf-8?B?NXJpWUZ1OExoeEJFcW1zZE1HNTJYM2ZaN3lwMW1pamRQOExnZXJtQ1dkY3hn?=
 =?utf-8?B?VXhQbENEMEtTZm95cmMwKzVsdFJmejUzT2dieWQwZVJIaFZWeUdweE5QYlhY?=
 =?utf-8?B?K1Jia21tMGZKaVVRM3NENnk5TXdYMU5XOTBvSldzdTNyM2c0emdRRy9MZXRW?=
 =?utf-8?B?cFlIQkdkYUl3LzJQZ3NzWG8zMUhPb2hveFVvd1U0NGZzWFpsUjlKbVVKcExi?=
 =?utf-8?B?dFZaNzFkaGpiTVlQTlZnalBJZGhab2FHV2NwbFd0R1F1UnJJWHh3NmcwZklM?=
 =?utf-8?Q?xjZilvLOgNC1EObUmHflxz1ej?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e83acb8-69f7-4a9c-f144-08daa2cf9d4c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 10:36:20.9372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/1E9NfUTLu0nWJJ+XHKI1yINh9eC4KkwxT/k8b2GIdijRORz5bz9swwJEUHDE7wlU0cUa/u9flWSZRdkvpAgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7598
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-09-30 at 11:39 +0300, Laurent Pinchart wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> The LCDIF includes a color space converter that supports YUV input.
> Use
> it to support YUV planes, either through the converter if the output
> format is RGB, or in conversion bypass mode otherwise.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Marek Vasut <marex@denx.de>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
> Changes since v3:
> 
> - Add YCbCr to RGB conversion formula in a comment
> - Fix small typo in comment
> 
> Changes since v2:
> 
> - Fix YUV to RGB coefficients
> - List floating point coefficient values in comment
> - Express CSC coefficients with three hex digits
> - Move | to the end of the line
> - Add comment header before RGB formats
> 
> Changes since v1:
> 
> - Support all YCbCr encodings and quantization ranges
> - Drop incorrect comment
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c  | 267 ++++++++++++++++++++++++---
> --
>  drivers/gpu/drm/mxsfb/lcdif_regs.h |   5 +-
>  2 files changed, 231 insertions(+), 41 deletions(-)

Although modetest shows wrong display image for YUV framebuffers due to
the pre-existing bug that Laurent claims, I choose to trust Laurent,
so:

Reviewed-by: Liu Ying <victor.liu@nxp.com>

Thanks Laurent and Kieran for the work.

