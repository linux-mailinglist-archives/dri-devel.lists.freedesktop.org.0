Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D356B9250
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 12:57:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92D710E172;
	Tue, 14 Mar 2023 11:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1b::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E22310E172
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:57:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6iEL84iA3lh6DBMv3uKumoo6Au3eDGSUzSgBzGfnS96Rm7sVsIxz51s9clu3vWiLwc52e1OfI8jdkWHIc9uA729Ly3Zp7bFytIz9TjZOV+0tuLCfH46eR3wz82sW+SsOkcJgVpz9ghRDswtVqFie1+lUZZ9WFS6vo3I9d2TfqpGfZPZ/Ur76gMwH0NT1jA28ItgYv9CVVkUtSc1t/gxJE4lQtLVi+aTZgraFTiJ7ZBuN4iDocu3OriNDUgMYQ3XWIlaqaeGLokP9taUxrSCw17oi+SL3eokaQzS+6a97bcmhOEd5WKhY6lkG5jfa8fE6w2jbV2uNslSOsS+E8pAzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RxzTUoV8jgy2CiyBX0UXxzArvENgGobz0Ayv8/770U=;
 b=SVS8g4TnyRSnO2O3RvdaZueKomCEzdAtrxdahJStLS5WFQ4dgeLLTbtwFQ2LvB+L18R1CIUsD3HTOQ/8q6lds+/nmaD+LYIyrG8C23GYAcophUxJ/jQKhKDO5CFVI07xJUqRaVt+CayOOVAx9+umjIIxLfjJ772AsnBLrg5qKrRm8sSqmnM76nUyJStZNXKAYhFYn32SGeCh0rVdkpk/N3UPrEXc3gJZK6O1D9Bt+3cdABuClLdv/EufjIFB0Za3JpZDlDLaSimZbSEc5IwJ6Wgxz6z3GjK0ZCdFoyPy72+s3ct18128rXTkQc0bt6peutjf/bErq9KKpLV4PagopA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RxzTUoV8jgy2CiyBX0UXxzArvENgGobz0Ayv8/770U=;
 b=1iEzx/dowqUhGg53pTeNzB5EWO4i+ou1y84sXBBYbLETH6rx+Oo8OyC5yq7I+yj1x6LleeqP8LPfqAscm4slXsd3OMx69eJi0ZARhQmU/22l5m7rTnrOMOSQ1UfUrPDwqg6ZT3SVCLYzwyXrH6HegUkEyJk2ajzmThKXmcQUnjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com (2603:10a6:803:100::13)
 by AS8PR08MB6694.eurprd08.prod.outlook.com (2603:10a6:20b:39e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 11:57:01 +0000
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b094:4fd2:abe3:9f08]) by VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b094:4fd2:abe3:9f08%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 11:57:01 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] Add timing override to sitronix,st7789v
Date: Tue, 14 Mar 2023 12:56:37 +0100
Message-Id: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
X-Mailer: git-send-email 2.37.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0802CA0032.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::18) To VI1PR08MB4544.eurprd08.prod.outlook.com
 (2603:10a6:803:100::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR08MB4544:EE_|AS8PR08MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: 14cc6cf7-964f-4783-9bd1-08db248338c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NOJB7ENW/sCyv/txEhxgwUL1pKMv2prEFC4znvuuGsdOviUkCdURqf+BDq257jjqxbDiv0vFrMgcXUOEb7fTnHSsvsvCeiZ2zu6ysMz2sUGjLIJHNeoxTXRv9eMh4NP13+oX38MheHlkSBcupOuHqLmpubYVCwxrir0CVub3EA9jNRmIh1HpyIHKVaD8FVwumefHIB0HGValUsATzaSKtJCAjf+qlh0Ge1aNwcHi7EXEbQ8bi1/+edRkODXIxmLxTotrWgVtjotSUuMPgim9IijSb9jcK4ljgzfJyMqc5KlxB8gzjEK+FoYr7nAfS2MJ0WIzyZneLBy/at4gWm6YSAGuxmDbEvLsZtTN6MSmqLuHfXFbuU4aEVmvl37evMQ4iRQKjkG4cPO7EhF5MKGgcsSimLlLQNarZodrTCXWeaOw+Mvl/ucByoOWXhfF4smXQIKXmiZ5pI43bWyxaelAKo8VpR1D7LBjsKzRWCMPfgAolWSnoz2J4v8FE7tS8/M112eBjNkp9gWSZALdQGt199NfBWSIeeG5n9KDrMNW9aEtw1sAhGnLqrXJJiprJvstGZ6Kors8i/p00BuN//oYwXamXmOCvEYL2P/kkfB5Cgnwe3mBJtBSVp2nHc1wcYNGtkMbkeIxg0h7IGLDzm7iATQpplN8yxoMfj1wt4X62QBMbX8sGjxBVwGHuHyIAM9WlG1CxzqbtuvI1YmrRsPwiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB4544.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39850400004)(366004)(346002)(376002)(136003)(396003)(451199018)(7416002)(86362001)(478600001)(5660300002)(8676002)(2616005)(6666004)(36756003)(6486002)(186003)(2906002)(52116002)(1076003)(26005)(6512007)(6506007)(107886003)(4744005)(44832011)(41300700001)(38350700002)(4326008)(66556008)(66946007)(66476007)(38100700002)(83380400001)(8936002)(54906003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ju6wQdx39/0Vk2JIxzGnH/kvN+N3Bp5atXLbstSlnM9R9dpdWSpTuWHbMiTJ?=
 =?us-ascii?Q?UschMF08oBYz/QkybxfSMyAQHWjDPTRQgGCMRf62A+9M67VKpAgbUSoo5kgc?=
 =?us-ascii?Q?wwPhTfiGp4ZnORLY5xgJFm+etqdHvo90tqNrtdyf4JkfIf6OVY+NOu1RdA8n?=
 =?us-ascii?Q?xuAdzpf8jCr4NwONeRmAZP8KZS8QB2FlqbtIfmAKBGbbc6r7spikBcLrIeCA?=
 =?us-ascii?Q?4dtzknTToXHJuqU4jg3aDCrAtMmKO7BqEzxJVb65rCq8U5WRQbgtA2RGQMOC?=
 =?us-ascii?Q?D+YfwFuogWZX7eUuYEjtdyMD8ZqPuX9HGjn4yVFQcJH5hWhK+n1LaS43KmqT?=
 =?us-ascii?Q?lVCmgz1CT8t0KBfyrhhbxbyXe/ZKFOKkevNoJ1y6KUCP1Fo5qDbcwphwuErC?=
 =?us-ascii?Q?ELcyPif7msEC5RBAN/TkO35nDjM3ealNctO0UUl924Ar57LgP15FRO8H4OMT?=
 =?us-ascii?Q?KJhz7Cd3815pbuSM7N6W80WFoe12d05bNXmgUX59utnDZttvrdluh5HYWQ9P?=
 =?us-ascii?Q?7DwxqUBIvOWYVDI/QEhTFl42IumqKKjDfFgBAX2OMv8wjv34cbsHbJ/+n8gX?=
 =?us-ascii?Q?nhb1Fl7x7t1sor+UMgh0qziZa+CfwR/xcCh34FCmU4NWQ9HyY6sp++N4JEOR?=
 =?us-ascii?Q?UNgsv8sun+hnducDBoJr6+fT2SP0kWbIanw85r3o8a+CbZb5tTNEdR085BaD?=
 =?us-ascii?Q?IOw+ZHKlaVFNZq8o0f/jN9BEteGoGD2QjalMzH6vyxppp+YXJOhgsWB3iI7Z?=
 =?us-ascii?Q?wGC22rKXrFVjXBtoftP2F8MC9vqtOPTmizl4Xv+cNSCrod0Uko711N0QhJKc?=
 =?us-ascii?Q?pL5YxLzksuPsiP7Lx3mNEJf0p4cwb5GB6bZdjFoUG8q7XlM62CG+MxDqS8Jq?=
 =?us-ascii?Q?/qR5tJcSpkNsMSrIapLqqeagcvFSrruKxfv6uGQmmYdOSX13qQV2BN9811bk?=
 =?us-ascii?Q?hT2XcJ6SroqeKaPgIs0WJs4gGetaEN8zlvo1YkpSd5yaGGdrI3SH0kbHO9DT?=
 =?us-ascii?Q?vlZSl1J0v1Nig8qOxr9vtGTHt8hcv/AQSCJiNedi7KlhUVd3ktRYE6jqZ5Fn?=
 =?us-ascii?Q?mv9sRnFPA1y8sIeAAYGctLUmIXxDU49DMAxSegKv4hoEu3PA2JvPlUjQIxEc?=
 =?us-ascii?Q?17RF34il3YxFB3uoGM9iATHUjh5fzYE9cOzttoOSsQi00wucz5m8cSLB1JEu?=
 =?us-ascii?Q?WAe0+VYhrHhVmrsCBNylThqnK24o0ICyeMSQ9FJg+gURl8RvJBjSrymMWN5V?=
 =?us-ascii?Q?sflVNnTXAjBcuLFrDpbkbg0+Bu6/cXw61YPlhLS3tAM1ck/UXqn5FuSr5/fV?=
 =?us-ascii?Q?QCO4m0uMy6a66UNQAjJN5VpleQN4zffAhmYQ4COBR8qR7VbKzH5/WlgUE/Gx?=
 =?us-ascii?Q?XGMTu8E8ZtI59CX5HAXLAWCTHNQBMDJo3eMUuztV0ymKNeVRfV6BQuPXgh0j?=
 =?us-ascii?Q?/xLuJ7FjB8/eGsusktrCE8tXFNcsorHXOk6jt5cbozpddq18Qlz8PCJ6rf7Z?=
 =?us-ascii?Q?oRpDfcUSnpIedoSV+uBi0htCVG6SYpUg/m/LNrcHZUW7aLXmqHd+OlyWTwHN?=
 =?us-ascii?Q?jEmZ8nrEnoGiBTGlRCoARWUKhk5YiI3PeyXHRcY2xYsYIDvtddWBCQYMnnxY?=
 =?us-ascii?Q?XjsXuKPCc08GZwn+98AX+ro=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 14cc6cf7-964f-4783-9bd1-08db248338c1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4544.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 11:57:01.5991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8MJAmmt3xlbk6MSlckAiWsA/dkLCbYZPRNXGhxXKarAThNAyKjsOqM/7rX4gVDijpNN4R99Y1QxtxcpYP4EvgbbIFTHZhPRrbVQ4rHSyA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6694
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
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch set adds additional functionality to the sitronix,st7789v
driver.

Patches 1,3 and 4 propagate useful flags to the drm subsystem.
Patch 2 adds the orientation property.
Patch 5 parses the device tree for a panel-timing and makes it possible to
  override the default timing.
Patches 6 and 7 add the new properties to the dt-bindings.

Gerald Loacker (4):
  drm/panel: sitronix-st7789v: propagate h/v-sync polarity
  drm/panel: sitronix-st7789v: add bus_flags to connector
  drm/panel: sitronix-st7789v: parse device tree to override timing mode
  dt-bindings: display: add panel-timing property to sitronix,st7789v

Michael Riesch (3):
  drm/panel: sitronix-st7789v: propagate RGB666 format
  drm/panel: sitronix-st7789v: add panel orientation support
  dt-bindings: display: add rotation property to sitronix,st7789v

 .../display/panel/sitronix,st7789v.yaml       |  19 ++
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 204 +++++++++++++++---
 2 files changed, 191 insertions(+), 32 deletions(-)

-- 
2.37.2

